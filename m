Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD84A24AE7
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 18:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621C910E241;
	Sat,  1 Feb 2025 17:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="bd8Fodrl";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QmBYkzah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2F110E241
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 17:03:32 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511Dnvv0009312;
 Sat, 1 Feb 2025 17:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=+Wib/Od3MWsdj883t/
 GkFb+0s850EGVxF33UsEWPQzA=; b=bd8FodrlC/4wZKShAlodn0E2pl/in+4Ea1
 zBXv5qTMF2BjLAX7YuZupnNrQ/qLjfE6Ut+pmXXIgEPH6h/q1OvaMBHqYLEYPrUC
 IR8fvvcQ8OZLPC3YfM2oPD5aPE5K8JE+1HtFma8Rf/pBW1Yi45AlJqwNpujn1nfb
 tUlcoac7zzpfcxwgs6uPQQoQHT9HfHuGex1zerM8dvF0uExRNL26gebFQeXE6cg9
 R7S1SW1JFLBTNtzDKFG824/sieri+X4qD338Xfd8XejoY8GMwtMY59hw0SKTA/Wb
 Xzw8Vy4q+DrNi0a6Bnu3RJT6MJZrstfqpQAJ38BkNmMugai67+JA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hfy809kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Feb 2025 17:03:21 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 511EIfD5020787; Sat, 1 Feb 2025 17:03:20 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44ha2d58n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Feb 2025 17:03:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC4jZ1b94qT2UH/4YyqybYBTFV+zBjN+HsBoaP22Dmm6JLAn7O1LfzBAm6+DYiY4qpcrzy4GwCHLugKl3QUxe5Sb6vT3hGylR7a7zOM8LN64QLM4D9nPqWHAnmXv+b3hrWeuZZLLgD/yr4xvwruPg4Eri8OC7Nh8SoY6WeGe4E/jM3BwzAnrUkTdWuDV8GsMmVXjl7mgyVqVjGGkmfEjPfpjAA7z0BWAz0ZsfJf/Hq41Us/gCs/VrQ8jUPEl8bqci9qfTspzXEezx5t+0ZX46L0YiL9qrU4vhN9cnV1+ZgHdRdfaUspj+7nJhGjDoMPRu8mK3ELvieLrGfgvSk6sdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Wib/Od3MWsdj883t/GkFb+0s850EGVxF33UsEWPQzA=;
 b=KOl+9TFcP9KDWtPaP1DJfQxtR9R3q/QcqxXzsxKweafIcRhpL0xMxp8o6e5zXn54c8OlAIgPqp2dFJRnaUsx/HSCd6RBtTfeW5Dz7PZMC7cjO1rMG4DXDbs4IZIM9THS2Xfwr2ccRH2cMJBKADJB+6RTSkrOZlhwfsGXKXCTlU3gNbBWBcKqPWtHMVq8RevMDTfM5sD7fcXY/ZzRkwd4JiuNnx7kQ7IIrrL0CtSytwuIzNcADabJ8XolCJettSCGRT+XHPS/I8rxa9an/OJR5CwFZC/+L2+wwxYsDidsjq8QBWYl2PCheEzQji8L1KJ0vB9bO0o0bvkYOVNpYI0chA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Wib/Od3MWsdj883t/GkFb+0s850EGVxF33UsEWPQzA=;
 b=QmBYkzahUsxjvNBmHJCUfPHUeHy9C6gJHbJWf3u7b2RLpmMz5KFiBftlnDI6+qAHA2i/yXLL2CAh5kyzzgAi3nsk3opmCCzXs3UgSSDz0zco/mE+V3K8/Irrmx9/iPv9XIskzCPEExtlx/ftkiOkcJtjABdPUvGooT95nEHzF1w=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Sat, 1 Feb 2025 17:03:16 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Sat, 1 Feb 2025
 17:03:16 +0000
Date: Sat, 1 Feb 2025 17:03:11 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v2 3/3] fb_defio: do not use deprecated
 page->mapping, index fields
Message-ID: <0f34f3db-17ba-4c4c-9f63-834f20f24847@lucifer.local>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
 <b5c053f1d85efa31028e50476333a9efed8a069a.1736809898.git.lorenzo.stoakes@oracle.com>
 <eb700763-eeee-4319-b6ac-904b8633b2b3@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb700763-eeee-4319-b6ac-904b8633b2b3@lucifer.local>
X-ClientProxiedBy: LO4P123CA0599.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::11) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 9018b035-1647-4e1f-edcf-08dd42e2523e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bcpmds9FdjZGKH4CbiPA3W0X13Z4giNpLcEqKrIR9Z/MmwMtg1OWkeaP+Tfx?=
 =?us-ascii?Q?LovxCFmPvoHPEQQAjLnaG3SB5mfba6VYrErA0KvUXQqrZfOD4eP0CmvbCKLz?=
 =?us-ascii?Q?q8RhGxr4H4wekBu9yrUAJLOb2I2D7IR2fnU3+A1ITqG5GzAFBwjya5RjQ6vJ?=
 =?us-ascii?Q?X4t9aZjOf3dcDiv3lKrn8YKZMNFielGjtSPw6xUyD0cvAgqTFaioYqc+8gvU?=
 =?us-ascii?Q?er8/Nml1bwh4QIV/xVFFlZWDFwBZ8z1GdiA5Pib0M5zy/WM4Ue089YFkokV2?=
 =?us-ascii?Q?TC1xG7jjbGYNawrLNYrX4nmEstUzQwSIjpzyx6iKWmsYSFyGbzpNCogikn7O?=
 =?us-ascii?Q?MPibbchGzi+iHf3lu5iLCee+ffuD8l7tmtrfrfsH7eCV9TO5vxCrxEqJgNai?=
 =?us-ascii?Q?cBgXnPYOwaWLwy2Pryej4+cp2ZV5E9eAO64NPQTvQaoYMxb24mTJRPJjRMni?=
 =?us-ascii?Q?QQkJYZsclhrjfpFwugJO7AZBIOsIA/o+P1ujotrKArrMGbf94ZkB0e5tA3AC?=
 =?us-ascii?Q?OgEphVWLYZ4WwR/PfpGjY4QnmV4vdd7KyYlPdjAvdJT8Wt6wFOiK47ETB+BZ?=
 =?us-ascii?Q?T2r/9H0XjfrFpXGZmYJ3NXmfUqUZtYzhew0EgnqXfPu3yMfOl20D/x+DsFmg?=
 =?us-ascii?Q?BrI0ojgj9fFyjSOtHbi8CKZwRYoOS7aq3BqpvIYOFjTfuUzc+mYNwu53Dowy?=
 =?us-ascii?Q?XOEZi+pDj9Zd/02Tpo/d7cirQ4gv5xCyVqBOOt1c7oYTEKa9F7q8ngdyqpAD?=
 =?us-ascii?Q?z+8s2hSWkCSCNZKmNw6LYgodwMLj+jfU49bdgKs/zWYTCsuueMM+IuykuQf5?=
 =?us-ascii?Q?oNYDxTBBL1Bcy5fc8qlQPez1fgquBlPq58xGekIpmDxWOuv0Eg2JmuDN0e0p?=
 =?us-ascii?Q?GmfvofzLW9VlC8MvdMpweTmqstQ0er+apnowWNiX7tcIsKHCiPxjEbVyyn4m?=
 =?us-ascii?Q?Bt+r69utSXMCJ3ut/yyShnBpXEf3eDyHrkiRKT9OFDXxterTnPUQt/o8Dwsn?=
 =?us-ascii?Q?ktt+xPbSpG2yEUjiYeOC/N7SbxLt/c69ZPicsdF4gH2c1+WWQc2V9Vcdip3r?=
 =?us-ascii?Q?iZngDdzhtiBEB6kHAi9clVy7cP7zXLyG7rzhUUVkeeaX+PnK2myOtrDhuSyX?=
 =?us-ascii?Q?piTS8mwqFPH+15qVClphUzVaeSG/cNyi+5OjWajGcyrhFtNOfdyzuWNqHoPJ?=
 =?us-ascii?Q?8KluqYeqKPNAp5feoZqL1UB23QeDOfTwiAjWVdtoyZc35C/kGXZvs8NTO1eT?=
 =?us-ascii?Q?YIHm/K7X/PdTVxO0vNVomgkgqoD6BNTXuigQe3KkRULYLsrLDuLaZLt+DQZv?=
 =?us-ascii?Q?tnrfXRwQRp+Ltjl7F99AU1tqAEzlyBIlt49G6SVVB0T+uHJS3b+PdmdlXPJO?=
 =?us-ascii?Q?Kw3bk4kou/FQdo4kWgVrE0ZLFPM/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nkgCznCSHRgj7+ikllhrvTs+BwpX+NRFllJT9+RIti8m1EL6FIgdDigFBgli?=
 =?us-ascii?Q?70HvxYn7eOnHv8ktccnLmGR/9Mdxb1qYvYMuqjHBqYRYqMyXBflRUnkgv/go?=
 =?us-ascii?Q?FVRCuHKEqTXBqZfXLEUvW+kNrj0hxTeEobU/bu+wfX6o3yAl7iTOWphjDBpL?=
 =?us-ascii?Q?1qtgiaz1cY93Mn8Q7fp5WrHO/eS+HU9ZmQFH/8fxSgS1Idajyof9+FqipZaL?=
 =?us-ascii?Q?Y4KKd71Sf0G/bCnd+AMzqUswagfOqB4wy526jq3fwWZ7dxVAokJN95tCgv+S?=
 =?us-ascii?Q?53FCwxegZSzCmoFrb+xxrPsmtj7Purkpms8TWildq52BAzBeqeKbeJNFv8CS?=
 =?us-ascii?Q?EUSC2dC9sO4hnIWkjBzSjHPowrvpgkktPpqsi5lh+D6nvQFzedca4M85joZK?=
 =?us-ascii?Q?rP1OxQBCaTYlc2qrInIwOlxQM6WLZQBSxyQl04ZomSx0gcin0E+2Qgb35OQg?=
 =?us-ascii?Q?dXQ7clhnauThNsw8lPDn/4Tgh8BbJVqc/b7eY4lco1FB7wTCbwIUCnEeOZtY?=
 =?us-ascii?Q?eqItjs1xAlEs+oT3amom5UPWHvDcOyqIEJaZdMre0hLmIwOVRTiE2yoaEMbc?=
 =?us-ascii?Q?MKn7aGTpjUfrzOgyTLtiNBT7al0wGOH0D26XeS7bjnIx9iPDLYPtff1SDSuM?=
 =?us-ascii?Q?z8peDxf9mdiCkomm1QZRKX34lHNN0fidC1NmV1XVgwJ97G6nUQ6LW0HmZbor?=
 =?us-ascii?Q?XlRoY6DNP4BP9tL95veNru0nXzlMiIDU872uukfs93pjNU5r2Dz3rVtVWXQ6?=
 =?us-ascii?Q?htysIPIwgHlEIq4t1ItyiYxOfgoolEgd9zhppAZMs8ypLkh3gip1xLIOSmdi?=
 =?us-ascii?Q?0ysv+CneW/J7szuZYEtvfnPfnds1qeIYlKX0bGZ25yI/LsqNvx1Rp2xI+Dfm?=
 =?us-ascii?Q?NmC5mMyPsesMffGMecluoEF5X8eU5GegHD3bOUaoOf+bX/fXMLf/B/D0K+dD?=
 =?us-ascii?Q?mem3SGJbQimzQrjJMnxsx4Z/LMGtiYvIqco5Df1Be16/8BKo0ODilfr//c8A?=
 =?us-ascii?Q?mlPK4xhRpchgeorQn8/zcVOJBcTDqt+SgDCwFAviiI3zAJfftnyNi2udx7M2?=
 =?us-ascii?Q?ENt4c/t7PlP+SXVcJYuqzBA28z8E7/v7I3pLts3oKiLHvYHa5qAy4PsfFPMq?=
 =?us-ascii?Q?Rfhp2gGSuPZ7Do7nB6zH+GZEvMQz8obMg2U/6e9U5mZTAiRwyb3N+75+tkaG?=
 =?us-ascii?Q?Cyx0txDhXvusof0vVk5Sx2KLiNnzLkIQDIwIGQU4BUVbZ39RUgJQgyrB94/+?=
 =?us-ascii?Q?ohvzQDr6BITcVvssmdys3W8lA7MMrmArYm0EdhgnBq7G+Ykttf/aUbCgVK1w?=
 =?us-ascii?Q?++e3DK0h75Zw7hxV/xxZVXqz8TZmM+F3u1WxPGsdwHYdO+4gw5r9IsJfS3In?=
 =?us-ascii?Q?S7Jh2bqPKW8TYXMNHMqyFt/StZKJwyk6OK8x7gb/qvH1rCfwkCSTJZZyVqa/?=
 =?us-ascii?Q?oCHjSs71xcwdDh28volrc4PuPB746BJFaX0fyrVvrgF6rgLYutX3q+Z3nJaN?=
 =?us-ascii?Q?Az5UaIc5nNs45ExV1NqEqO/Ce/aVuzQR+aOJD0f+W9UnaTBza93uc5VmqKw3?=
 =?us-ascii?Q?PpxavMcl/rGJWG+qj/IseXPzGBSJX8ON5u0u4eSgHsqFT6UFeSCp2ZauBlmb?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +6Qb0BKuDhFqm99ZFy9CG2yehBbG4MCVGBu5m7vWncm3CSp5VqhiWrLoXLfEGVkq+auABGaiADvOe7+Vfxm5/8D8ZklVOv1bRvfwkikD4Duq9JDbsn6j2pUI+0cMORPjl22KDOnUIv5vNUOV3c2csI2arbaZLoHiBHrPSnnxg7Zs3hU6uAAhXRWhcGp1Sr53pCiWo1gvsMXCCuePGAtK9HldWUq1fNNtF6IltgI3W1FPou2l/rFCjRAMc/EGMOKsW8OPbsI/gNEeqRTi3+YyL4LnSAIiF/5Nof7x0OIKYiXENazzkxlwkzf91yR5QLVEgDK0m8YcfIk1hrFdhTArwb3XUv0XGgVcGViYzION36X+5ej2YaoA7NHAky3C00s/w2qUDK2EqKpQIowB5sYjmT2YQ1wVg74TUA7nkoDsJ7rrqxENKnX+i/rIbGwopmt4Xn//yoW3RJWoEkUiVNvDiOKSrpV56ImcUvpEiROLSV+wzlEwmN6BxisJ3R8aJrCt+mjOyLCVxoSUmNn68Qii8se0sBUMbKkNHXhKLw9uKnA69MVDreJrtXabnO19iaIl8SYxilCulKs66SfoEGMEgWpxqvAkQv7hgwWmk49g6B8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9018b035-1647-4e1f-edcf-08dd42e2523e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 17:03:16.7514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7IIVRYgI6ZjxXFdv8rdbtNfUGS6tfanm1y+kxNu8d7v/nQ6aMgENGvq1UQ9JV1k1Vz8JMgWxNTeHNUyUM/ntSfBuiulQsgDgdKO9udmcWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502010148
X-Proofpoint-GUID: aDuwzq0cnpGgR_9FRljPlDjQrdKJxJHd
X-Proofpoint-ORIG-GUID: aDuwzq0cnpGgR_9FRljPlDjQrdKJxJHd
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andrew - Ugh sorry - please disregard the below, I sent it to the wrong
thread. It's Saturday and I'm tired and brain not working :>)

Let me resend this against the correct non-RFC thread!

On Sat, Feb 01, 2025 at 05:01:15PM +0000, Lorenzo Stoakes wrote:
> On Mon, Jan 13, 2025 at 11:15:48PM +0000, Lorenzo Stoakes wrote:
> > With the introduction of mapping_wrprotect_page() there is no need to use
> > folio_mkclean() in order to write-protect mappings of frame buffer pages,
> > and therefore no need to inappropriately set kernel-allocated page->index,
> > mapping fields to permit this operation.
> >
> > Instead, store the pointer to the page cache object for the mapped driver
> > in the fb_deferred_io object, and use the already stored page offset from
> > the pageref object to look up mappings in order to write-protect them.
> >
> > This is justified, as for the page objects to store a mapping pointer at
> > the point of assignment of pages, they must all reference the same
> > underlying address_space object. Since the life time of the pagerefs is
> > also the lifetime of the fb_deferred_io object, storing the pointer here
> > makes snese.
> >
> > This eliminates the need for all of the logic around setting and
> > maintaining page->index,mapping which we remove.
> >
> > This eliminates the use of folio_mkclean() entirely but otherwise should
> > have no functional change.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Andrew -
>
> Sorry to be a pain but could you please apply the attached fix-patch to
> avoid build bot failures when randconfig generates invalid
> configurations. The defio mechanism entirely relies upon the page faulting
> mechanism, and thus an MMU to function.
>
> This was previously masked, because folio_mkclean() happens to have a
> !CONFIG_MMU stub. It really doesn't make sense to apply such a stub for
> mapping_wrprotect_page() for architectures without an MMU.
>
> Instead, correctly express the actual dependency in Kconfig, which should
> prevent randconfig from doing the wrong thing and also helps document this
> fact about defio.
>
> Thanks!
>
> ----8<----
> From 32abcfbb8dea92d9a8a99e6a86f45a1823a75c59 Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Sat, 1 Feb 2025 16:56:02 +0000
> Subject: [PATCH] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU
>
> Frame buffer deferred I/O is entirely reliant on the page faulting
> mechanism (and thus, an MMU) to function.
>
> Express this dependency in the Kconfig, as otherwise randconfig could
> generate invalid configurations resulting in build errors.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502020030.MnEJ847Z-lkp@intel.com/
> ---
>  drivers/video/fbdev/core/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
> index d554d8c543d4..154804914680 100644
> --- a/drivers/video/fbdev/core/Kconfig
> +++ b/drivers/video/fbdev/core/Kconfig
> @@ -135,6 +135,7 @@ config FB_SYSMEM_FOPS
>  config FB_DEFERRED_IO
>  	bool
>  	depends on FB_CORE
> +	depends on MMU
>
>  config FB_DMAMEM_HELPERS
>  	bool
> --
> 2.48.1
