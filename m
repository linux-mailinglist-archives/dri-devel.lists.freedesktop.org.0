Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC27A26D60
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4E810E288;
	Tue,  4 Feb 2025 08:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="etROjRj2";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hk6Dl1v2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD0310E288
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:38:08 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141MsPY008602;
 Tue, 4 Feb 2025 08:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=vLWMsTLK0nOo0aWnJB
 F1rF0UM5Wxbo3QULTDjejkOU4=; b=etROjRj2qyHKamnhUpJ4CuDQwfiAEzt10T
 Nn0jBx79GmoT9rJKX5uyEHpm8hT0MuWJRsz4jJQgIJwViL4jniuEXDx6bp+MNm3x
 4EUB8p76vSlpl0QFh3t+RY1CAy4sfG70JWCBt0S2MFAKxklaiMdLm/MdDtRmQqVg
 nVpz5FV5qkW2lsw+J0p5h1MVOZhylTqgCPfY4EYtKS6YkFoPxhdSilhA6crac3h+
 Qm9Zel6iht6/uMDKx8reNKV2t+BZOJ6uY+WS6/rufbRQjF4aY46/KbEQB0i++veN
 mNDF5veMyjZ9KlfaUJqX71avwyeijPCpaY8p4OOMGDDl9wWw6V0Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhjtv9fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Feb 2025 08:37:43 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5148IUGF005072; Tue, 4 Feb 2025 08:37:41 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44j8fnq58j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Feb 2025 08:37:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iO4BnJLJwMpZwhcbxqS6va0zRiaJLyOiaGIZqlI8iIxg/6L4pr9BOlI1aIUPj19HPilwXGcDGbcVAFVff9Uf6GiaRSKxOKp802rFpn/AXBnw5crfunZLfAowJz/q00XYQdmQKtwZEQLAxwmZNORNecOuuhS2KWSDWH4rZS9HUpj9da2FyfaPwYIn6dYOI/uO3q9rAp0CJsq6klp6Y1rKWLaUi8JC97U5HakxhLdG6wJioRg5pAxJHH0jZI2DnbygJdyrUePZyxg+VJ/ZzD9Dz0gKRCthPdccUFROQib5eX4wrCixZOpxH5ujAYCxVt2ox9bZqHM7klZFciFeFRLa6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLWMsTLK0nOo0aWnJBF1rF0UM5Wxbo3QULTDjejkOU4=;
 b=j8LSFgAW5z569NdesRInL23TlKq2djoZtBUzyZQrp/Fcmdf7QrP0Yk/90xtMTX6qE+d/mAdyt1cjFjsnzH+oV8e+kOUtm4p2gL8hih+oqrDqfUE/guHbdGnh0iLFYQKY07gy9ePnt6BZkBvHHDDawCRRNbFZAraoy6PnIwi15LsEjooh9qqUG/L1V/2o6qe2g+ySLyrHyk+F3TYm0HRMbUr052Ozy5cYpCaTE5kjsAnOpIyirXwNjn09GgqKDOSbseDrLdEONVyB+Dj/f0LWRhXwSf2yq9cQgEAsQzNp2BQLI6eqj0taE+9FEYfao+EAhBB9WAiyVJF6Hyw0gwH36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLWMsTLK0nOo0aWnJBF1rF0UM5Wxbo3QULTDjejkOU4=;
 b=Hk6Dl1v21hBLwHmJOEga9d3SrIrY5fKr+2cbzkAOO8H3GhTI4xuZGDnjG9f5weXYXK233LAKt2QHhu8Ym5ZUrw5C4S3AbXeCBAt54bVWE2quOn4jB+PAVGo4QjH2QtXUKuwBaCjAnbqXHfRIwdIytJh2bk/ARUTh6l7VyfNd2O0=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CY8PR10MB6492.namprd10.prod.outlook.com (2603:10b6:930:5c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 08:37:39 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 08:37:39 +0000
Date: Tue, 4 Feb 2025 08:37:36 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 3/3] fb_defio: do not use deprecated page->mapping, index
 fields
Message-ID: <168bdcc6-1035-4072-855b-afcfa2bf7e5d@lucifer.local>
References: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
 <3542c5bb74d2487cf45d1d02ee5e73a05c4d279a.1738347308.git.lorenzo.stoakes@oracle.com>
 <d800c5a5-b751-4f74-aee4-8dda1536dd85@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d800c5a5-b751-4f74-aee4-8dda1536dd85@suse.de>
X-ClientProxiedBy: LO6P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::19) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CY8PR10MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 221d5d56-167b-4489-4bf1-08dd44f72eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U7bG/aeoSCaVVdaj9WCIiFKaVOeV3LiQdYi06bUR14gPzraqjueBOycF7GZK?=
 =?us-ascii?Q?hlgBq5YRP6Ck0RTwmkwQNKBCSPFD94C2MrD5HjatNGNchy5XrKwdRjkB9fhC?=
 =?us-ascii?Q?1D5qw8BdWEsVqxJBup2xxx0hw8Ohx5YJhccmNVTJ4DM2zVVI8isJY4l3k6u7?=
 =?us-ascii?Q?IaeElSAExevZPngV6PALLUXYgPdxu4clbdSqXtwTagxpS34lckefb+a0cy5b?=
 =?us-ascii?Q?z6uRsw7slrg4xhfVPg+W7NO/gY6icsfOoKgiSorr1NLXT9TtK1oqCUHyBd7k?=
 =?us-ascii?Q?Fr1h0nLP8hYnSwZZgv6V91aFOJYVgmvdBjxlLDbXgGjx6j2yY2BE/4QsgIwD?=
 =?us-ascii?Q?MUnCTTsyfutxyC7d5alzs9eQYW87/5tqRISKSY6IXo4AMiPMSMBgB24ZOMcx?=
 =?us-ascii?Q?OiCh7j2H0gBMdz/bSSs9cMAOkesbkoD8mCIlkOVswXzrby4kqMMwiovyJN+U?=
 =?us-ascii?Q?5rmQ59K0n7ymKcB0ptAIK8zlKq/3Q5zxEHPt8UvSpOjzUjpZ1KjRiHv0bSNp?=
 =?us-ascii?Q?BN56Zx57bz1AylyRqrjJ6WVUBlC5XSP03cPXBr12J8pAicCDQJyTAoU2Fhdm?=
 =?us-ascii?Q?sT+7sSV4qmYKaUXY0P1gtWnlE957KPcEICIIRrfg8VWSHuC0TzzWFrBtSQBS?=
 =?us-ascii?Q?8zKMdtw3d6xBzVWKcyoYhcC6XS61LIGU3U7VMNOFNE51IbnGli26kqAc/zjE?=
 =?us-ascii?Q?Om4CVCzykG4XCTktDb3D+Z7wDze8UUewJH7y+zAJ+COT7dAVO6W2qz90Iv31?=
 =?us-ascii?Q?NSKYi4TE5qBOS6hQMUDfuDP6qEMMFlRxEdLXRhkdF954TpLSV6AqT+v5Ap1y?=
 =?us-ascii?Q?Ao8OlPKKsyiZRUFNef0A1DOJ4Z3zrWnHxDXD6iXXcGNQy/QBzqSTaV78YflP?=
 =?us-ascii?Q?ILxP5HwOV6cEP6BC0DHWJmX0JYRf0jRwY+TQx3ldDA5Yhl6ol5wTg1s9vBMZ?=
 =?us-ascii?Q?0/o2SVRqd0FACF7HJ3TEv8uYNz48B887iYy/NNZ1+HLT1Hg4KywehCDLlCcJ?=
 =?us-ascii?Q?PObE3Nf2IbsRr4uQ74+c+gsxjGuahN0InxMXDWVLBCAGg1cStSc70raOCYBZ?=
 =?us-ascii?Q?OKwElcbUQwhZ6Riviy/Wyyoaox3rSFyK7dendJ+4AhciSjdyO0Yp6v8ALXC0?=
 =?us-ascii?Q?EpUF17qt5ody5ZG0D1n8Fqtb51vcS3VqDTDJ++dyD87tPJXIhCnbFxQXZmab?=
 =?us-ascii?Q?S+Ej5XAdNB6S/e9MsxTo8f9c4S+c1rPJ0CS9qESpOfGskaanKVSHsdud9dJG?=
 =?us-ascii?Q?gBpMY6FzF367zFvK5KT+7LX8s6LJ19bgze9UWTql/+PPzUZw97M0qMqg5DA+?=
 =?us-ascii?Q?KkClE8/T35gKZSl/3rZinMhapjJ3L6r41R8TEAuXHM+3BrW0MlECPpfZi/H3?=
 =?us-ascii?Q?ad+dP/yyy0Tv5uEbIGFGWIe5DiPu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8uqfzYcg8VeFWXak1UZmy81ibUPe5M7Ze2GFSIz356GW2FEBC7Fuo1wTCjXl?=
 =?us-ascii?Q?G3qR+RUbXT1NEGmL5BKjTJLJcyTKX7MJETV78z1EapxoJh9oTY5EHgryQ1CC?=
 =?us-ascii?Q?KQlf3Gg7htYViA9WjoXrseb6kxXEGgSKe78dhvH/F377fp16mJ3PlBsZlue+?=
 =?us-ascii?Q?/H2nPTt/2zUkAn6Z+f2gBn1g9DZXH3xZK2XJR9WfNFTuGq4DXCBWvwq5a/mL?=
 =?us-ascii?Q?tMdeM5yQKufTH8XowgmM+zCl1POVpj3kG4a5NyzJ1hwRS1pjzMbJU2KgcEWj?=
 =?us-ascii?Q?cYewiWJqwwbJ/jXbEuPLxOvhFrWD+D4q2kCtj7wU6NpdaLAU3LC2iXBfXIoT?=
 =?us-ascii?Q?QIrH+n9Rxstf1OX40mWKMPuz/c2c1ozl5JDOfuKXUJjgYkVuThnCxmzYWL5D?=
 =?us-ascii?Q?EJlt72Tkdq6gKqIvIKVMt/mXlbNFQQUKQP2PFElVYZV/nKILZuVhWojPyRp4?=
 =?us-ascii?Q?zu1Y0ZIa/To3Iu0EN0Inhb5IgsKSTq49Ny8SZUVSv63LSYFnMUXwdoB3UkGL?=
 =?us-ascii?Q?kfScsU6r4yF0XySHaxqagjvpzAGoMfraJkbDMScgyK4CaLODK4DbmtD905B7?=
 =?us-ascii?Q?brgnoqWJFAkElpPB1tIwkhWXLp+P8niVjr4e1iM/QhyFLm8M4ftWGJvTg6ui?=
 =?us-ascii?Q?GzE4PRFybKGUdMmMpIyxPTawioFUQ0PYo6yH8+Yo8DTRmOdX1kpBKMfNR4Bs?=
 =?us-ascii?Q?ajno8N318WkGjsk0+OmC80wMrCwXBDaGLHMGvOidYGKpT4Q1t2iVVsodXhPk?=
 =?us-ascii?Q?16a59MM1CAqqNhxhXxigNb4dGBt49T/j+h9DzbxLvDJSLbY00wvdXqCS/5uD?=
 =?us-ascii?Q?a3qs/sowZnSkQzZmfjEPFTLIw05ezyIEV9VjXqhlWJQhq6WMhwkTrFKhNf0d?=
 =?us-ascii?Q?k+sCFcIjX4n+fQXsYlQlYg41Fihbm2Ky7x7ml8bIYE2WscCbvVi89bmvLitG?=
 =?us-ascii?Q?XYXEMPH3SlL1Nc5r7Em/11v1hQXI/2AXZRfINWQdFmdT/yQPjY1kZLXuYHxO?=
 =?us-ascii?Q?+FeritmXVhYe4jAq1ZkSlE5piioA6SUYVXbLm68NOcqR7wMkaOJRM+fXwt9K?=
 =?us-ascii?Q?ZoCzfzgTBUq7XTKA23vlQ9SBJys20ldTaXEDKlnYlg/me0PUvfaVL8J6Lv4D?=
 =?us-ascii?Q?8kusoVqVtGQufEZqdl66DkvP+6VXkdu+92I9WJLssdlBtHq18VoNbaatHXq+?=
 =?us-ascii?Q?ry9RnmNgmxgQoXGVHRMkx/V+qx5pPHTW8B3b3cVC+9cUm6YucNt9vZPW7bk2?=
 =?us-ascii?Q?zEHcz+ijbk2etJ02oSg/oFnT9lJkbBIo2uv2yOkS8mZVgs2OVQ3DGYKWtHhH?=
 =?us-ascii?Q?OKDMPvQtt9qZ9rDv2+rQri6sJaDiCT9Azbfv4RfeZzCZBqOMDS2QrY0TcMkb?=
 =?us-ascii?Q?Tr1AAExy7mPui6sayzIjLeFMk90A9Uq9lXkd0ad/7ZKb7iQXKPjdq/miZAU1?=
 =?us-ascii?Q?0QE7BuVjMJrNgHbvKHIBq2AyLXtGfQLfVOyt3Fq0obR+7tAI8vBkeP4xKtL5?=
 =?us-ascii?Q?BptJ3mcxhJQzjm/PDWTuUJMn154+2pgLQxB83HWBhLJyTDJSpIc1MaGXNU45?=
 =?us-ascii?Q?zRBtOuHvujpluJy6bIo2YAemUN1diuiKb60e7EfcekrPLiN7UAg12pRwYoPr?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 83lSLenukbdHNWGaIUmOGzkOacLSnSvDe5vtYc5932tF8HvxUBj9L9WsyZwZtKRKIjTqMgTCsdpd4mCBX9TBYTLGnLXNJBySMHQR6CPoETRp5sF4sztHkRkCbMOhlXrYy6x1Tq5Z3DLcK8m66koseRJs6fhFJXjUNIbrU3sR73ZKgRt9Py/ITko/poUQbkp+j9/yl0ipMLKTNRoaUtvfXhDFAFqwVCkb1agvdLG+Z45YkefPtuhD5u8qdLWKrUropJmImdP/CVhBSTj4FueWHcc/OihU1JKS1uvCt7VNINxGUGZ/wNv9c9gt2dCCvio7TGXO+jlK3QCtTOXl62KVyXDaEJtxF6JYWaBDv1t/Y2fFoVRmChgKjU7cq8LSzxdiSFv0R3w8GKduB+yRpvEW2rlDBrtwOQ5+KZO+dBJWAiNpUAI4N/LYOhqsZ0Zm1GEKZD2UCOO9MqJYr9JYanZjuI+2yK423MOn3vXUtjaaDvPfDRW+8vS0uutqZRqXEKR+2N0ZQDDt63aPa3+QvvPEuZ6Xt6WrUxI9BT/aRjz1lk0bxwRt1vJXO+w3mMSV7aXpNRBBySwV2ZzF7iGe9XxbYgnpQfI/38Qwa5W8DFAEmGU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221d5d56-167b-4489-4bf1-08dd44f72eed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 08:37:39.2718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EyR+8FIl/LIXFpoFLeCIbIcpuK4OIkZLl7yGsOTOAFrrEU30hfPTdsROPx8P5puGKr0ML6Pq7m2eda8XxIu09tCqd8hJIeGwZeFKVhGBoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6492
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040068
X-Proofpoint-GUID: YyyDSkaWE2yuwOTzN9ieCQJ8o4BlVdU6
X-Proofpoint-ORIG-GUID: YyyDSkaWE2yuwOTzN9ieCQJ8o4BlVdU6
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

On Tue, Feb 04, 2025 at 09:21:55AM +0100, Thomas Zimmermann wrote:
> Hi
>
>
> Am 31.01.25 um 19:28 schrieb Lorenzo Stoakes:
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
> > Tested-by: Kajtar Zsolt <soci@c64.rulez.org>
> > ---
> >   drivers/video/fbdev/core/fb_defio.c | 38 +++++++++--------------------
> >   include/linux/fb.h                  |  1 +
> >   2 files changed, 12 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> > index 65363df8e81b..b9bab27a8c0f 100644
> > --- a/drivers/video/fbdev/core/fb_defio.c
> > +++ b/drivers/video/fbdev/core/fb_defio.c
> > @@ -69,14 +69,6 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_lookup(struct fb_in
> >   	return pageref;
> >   }
> > -static void fb_deferred_io_pageref_clear(struct fb_deferred_io_pageref *pageref)
> > -{
> > -	struct page *page = pageref->page;
> > -
> > -	if (page)
> > -		page->mapping = NULL;
> > -}
> > -
> >   static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
> >   								 unsigned long offset,
> >   								 struct page *page)
> > @@ -140,13 +132,10 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
> >   	if (!page)
> >   		return VM_FAULT_SIGBUS;
> > -	if (vmf->vma->vm_file)
> > -		page->mapping = vmf->vma->vm_file->f_mapping;
> > -	else
> > +	if (!vmf->vma->vm_file)
> >   		printk(KERN_ERR "no mapping available\n");
>
> fb_err() here.

Ack, will fix on respin.

>
> > -	BUG_ON(!page->mapping);
> > -	page->index = vmf->pgoff; /* for folio_mkclean() */
> > +	BUG_ON(!info->fbdefio->mapping);
> >   	vmf->page = page;
> >   	return 0;
> > @@ -194,9 +183,9 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
> >   	/*
> >   	 * We want the page to remain locked from ->page_mkwrite until
> > -	 * the PTE is marked dirty to avoid folio_mkclean() being called
> > -	 * before the PTE is updated, which would leave the page ignored
> > -	 * by defio.
> > +	 * the PTE is marked dirty to avoid mapping_wrprotect_page()
> > +	 * being called before the PTE is updated, which would leave
> > +	 * the page ignored by defio.
> >   	 * Do this by locking the page here and informing the caller
> >   	 * about it with VM_FAULT_LOCKED.
> >   	 */
> > @@ -274,14 +263,13 @@ static void fb_deferred_io_work(struct work_struct *work)
> >   	struct fb_deferred_io_pageref *pageref, *next;
> >   	struct fb_deferred_io *fbdefio = info->fbdefio;
> > -	/* here we mkclean the pages, then do all deferred IO */
> > +	/* here we wrprotect the page's mappings, then do all deferred IO. */
> >   	mutex_lock(&fbdefio->lock);
> >   	list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
> > -		struct folio *folio = page_folio(pageref->page);
> > +		struct page *page = pageref->page;
> > +		pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
> > -		folio_lock(folio);
> > -		folio_mkclean(folio);
> > -		folio_unlock(folio);
> > +		mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
> >   	}
> >   	/* driver's callback with pagereflist */
> > @@ -337,6 +325,7 @@ void fb_deferred_io_open(struct fb_info *info,
> >   {
> >   	struct fb_deferred_io *fbdefio = info->fbdefio;
> > +	fbdefio->mapping = file->f_mapping;
>
> Does this still work if more than one program opens the file?

Yes, the mapping (address_space) pointer will remain the same across the
board. The way defio is implemented absolutely relies on this assumption.

>
> Best regard
> Thomas
>
> >   	file->f_mapping->a_ops = &fb_deferred_io_aops;
> >   	fbdefio->open_count++;
> >   }
> > @@ -344,13 +333,7 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_open);
> >   static void fb_deferred_io_lastclose(struct fb_info *info)
> >   {
> > -	unsigned long i;
> > -
> >   	flush_delayed_work(&info->deferred_work);
> > -
> > -	/* clear out the mapping that we setup */
> > -	for (i = 0; i < info->npagerefs; ++i)
> > -		fb_deferred_io_pageref_clear(&info->pagerefs[i]);
> >   }
> >   void fb_deferred_io_release(struct fb_info *info)
> > @@ -370,5 +353,6 @@ void fb_deferred_io_cleanup(struct fb_info *info)
> >   	kvfree(info->pagerefs);
> >   	mutex_destroy(&fbdefio->lock);
> > +	fbdefio->mapping = NULL;
> >   }
> >   EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index 5ba187e08cf7..cd653862ab99 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -225,6 +225,7 @@ struct fb_deferred_io {
> >   	int open_count; /* number of opened files; protected by fb_info lock */
> >   	struct mutex lock; /* mutex that protects the pageref list */
> >   	struct list_head pagereflist; /* list of pagerefs for touched pages */
> > +	struct address_space *mapping; /* page cache object for fb device */
> >   	/* callback */
> >   	struct page *(*get_page)(struct fb_info *info, unsigned long offset);
> >   	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
