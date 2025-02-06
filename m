Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A95CA2AC84
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519B10E1E3;
	Thu,  6 Feb 2025 15:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="gBfae9+s";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ewyBYiQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7C410E88B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:34:24 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516Ehx8Y003933;
 Thu, 6 Feb 2025 15:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=Qz2tJ6Y8g1ITAcPb+YReg9cPxjZeEzkUNtQR3zXbQ4s=; b=
 gBfae9+sCyCeu2w1zYeiFc6Pg8l8IwFl2VuFaaiYuCtDelBPXbk87ac0KdAdW5Zi
 nOSz5XvQJf4oHcltzYuYhaTwEiMAfun2aYDZCKsAKNwj9rc+HaoKU/7MxQreDo0p
 KENiJEE4PrnVNPWlYeVuzc7Gddz8jn833H7okWsiZqbom5u3LDajXCbHKZkBSCMe
 JpOIw+4H52Q2XwCSKTPXyouf8032IFho4S/1ncCSiaxXaDIZ4SQe0d9HVnYOESFV
 i3dTTchgXRdFu8/UBeqzcG/PHhvxTy8FX4dRgsJpSV1F9jTDii26c5fRt+91vUjP
 ojboyFhRzxO/vAXlcaZCqg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhju1f3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 15:33:57 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 516EHchf020760; Thu, 6 Feb 2025 15:33:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44j8fs04ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 15:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWJ+sfIThUcdAOFh4J8u7DhtF8vH9QrD5hdeyIjjPz+H33xabEASIjAlcZDYVV2AaCVPUGnay9Ms0BK9OeHmPflTyM67jkhbhZy7oN76XsnoxQq7H7FVm8ASZR2Ijv/jak1vtFzsXLuTaOcAM69ROs2nXuM8vPr0ItrTq12vMpMQmSnt1yqRFEUGAd8Mt3MLSCzg3LBd42JnVfHwsD5RVEEFDjU74GH7R/sbb+FhiF45F+UZwS5+tYj5kPBZaAkJdSlhjxjn99Ef9oURFh5og3yNPqQ1mjcnELbm0veAl0gIKLD/qr0SqCZdiP1MJ9DWWbowspl7iDRA5mz6XZadlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz2tJ6Y8g1ITAcPb+YReg9cPxjZeEzkUNtQR3zXbQ4s=;
 b=FJAAaGigE4wbg3ryvN9M6Yzf/YGVN+6yeLToY+pEdoHU3+UiPeBeiY2fs1XcrQyTG/hrkH69DJeA9PLzU13deXozjTDoNjrUJKPX/Sj9017w6fNILVw756I1EcafJgEQ2CiTCMON0XFXHEYfoThgWttgVeGikh6Y4477oJC9Wkb1mTslOpqIM8aYKd4130UlaYdzh3HqeKx81N7quaVIJykNI9uhLQdRGYrtRG9vlH2kOn3Bue7mG9RgYInPMx81yV52VQrw2BF4AoSCtKlJwBT8nPSuaw0Zkj6PNypgfuW3XGpXCTh0v3Id++waqKQRve/ezbX3sS/hsFQNiytenQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz2tJ6Y8g1ITAcPb+YReg9cPxjZeEzkUNtQR3zXbQ4s=;
 b=ewyBYiQVjo+IkoxrKke8rbusM1yhJUPgaPfvDcKB29JTZcNnscWF+rrwx9k/s6jVkTiRMkqLBIuRH3Cln809GUkEGgnEClfAODaCUqwRRzamom6jMTI3pDp+9A663e8XeeArR6A9B0ZU+3iotcGDY+ZVO/9yLVsEUFEn92Ki0nU=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4808.namprd10.prod.outlook.com (2603:10b6:510:35::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 15:33:53 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 15:33:53 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/3] mm: provide mapping_wrprotect_range() function
Date: Thu,  6 Feb 2025 15:33:20 +0000
Message-ID: <23d1a931fd1cf3ce0b07f7872eae956323f45393.1738855154.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738855154.git.lorenzo.stoakes@oracle.com>
References: <cover.1738855154.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::6) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: 315b03a6-c810-4910-27e7-08dd46c3a999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tcy8KVxwf58qn/GMwEcZC5RB7n9YPqr+YecRd7AUe2kAC7B/8zRXxzncxW6e?=
 =?us-ascii?Q?mCbr7gYvrfs6WyCj0FI36KqJd2/mAY+3lBOhF6WeI2Us9m56mjOZ0U7h4qgE?=
 =?us-ascii?Q?Dij9iQd5i6tNRxTP6EeuqVLWfNxFTIz3tB28GEwFyfUCy5uyKeo7NqUdcfk1?=
 =?us-ascii?Q?aFttaL/Wsp30G2/VenGDw5KtuRUkb7rDyHYnYTDHJ004k+9dsrjMXYS1cSS9?=
 =?us-ascii?Q?NbxLtftLyZtU6tJSzH+2L1A+eU5S29/bikPSvPdw2ekZ2825LhqIp3XIduab?=
 =?us-ascii?Q?HRcYL5coJXn87q6IgsbGf9ztpzajR5I3d8iUOABZ/cIB39f6VvtN4pRmAafL?=
 =?us-ascii?Q?N4JDF9LbBcpBzCyh/UMV/HKhzij8b+WH5GXRIPbjGUvz5AIJg4kp0yzYpzb1?=
 =?us-ascii?Q?vonfAvTQaqUMbPCQbxBkrbVv0cxxnC1hLZ9REsVdpdDbPj2oTPotn+DRxWyI?=
 =?us-ascii?Q?SWULRpqBuDUGRppl4RcXCuTvsuqFPHdBP2sEeBbVGPqFIjhgXHsnhwENBUex?=
 =?us-ascii?Q?Ev4l5uZuFRgSIXyFyWSHQGVcAKhH7ImDZK1WlRpIz7RqOc9xycVngtibaJu7?=
 =?us-ascii?Q?O/KJjKw5HWZmLj1zkIOyvGj0p7ERAOiILm0kQ7G3MU6xF9bHXRTzh4kyJYnU?=
 =?us-ascii?Q?Yg65fbEj7o8CfEIDhqry0TXDAObwKr57U6IujF1wz6vIfde8GsTUb6aum5La?=
 =?us-ascii?Q?KopTb2ThrnWldBaK7IpiRxZ+2Zw24ByeOBJj1IRpsj2AVdeYrg2zLoI6AOJK?=
 =?us-ascii?Q?Cd3Z6xqectNzGSg9dWYGSmF3rdnnlA53QBHVQ4w2ZCbfP9iGjqA8nQOGcGiS?=
 =?us-ascii?Q?iXf6OQktAkdtMNG2jh+UPjUBTAlS+/uBJC+V4LKhv/Fgfq0l6a+dykmCiZiV?=
 =?us-ascii?Q?0Y+l+KkS61Cr7vA7DNWhKT7G0DDUySW5zb7Z9M5wMBr7VtiegOQReiE6KKXR?=
 =?us-ascii?Q?W7RUSABxtroZ9u42Pk1AEWjz8hYmxcboKmYhKhfbsK/apwqXhjM9hcB9Ino0?=
 =?us-ascii?Q?1H7OcTttHKvM7zhKD8J3ULJYpZIHPAdWt/PdBAPUnXI8VZJaedSAuRbD28m5?=
 =?us-ascii?Q?HXQBXmlRRuAAGmpBfSwWKkNx8g6NnNlHotHidHF7aewhqA3lWwJSdOCOhA+s?=
 =?us-ascii?Q?UIhHni51rISm9BLJR+ocBzIqCHQFO1zwuJbe2rGr3iQGwgqCEws032uv/0c2?=
 =?us-ascii?Q?3VuYRzfVMa2J6IfTzU4untmw1eM6Z2xdG9yPPbD9j50GlYhqCyyC3UYkrR0w?=
 =?us-ascii?Q?TwDvOoFzP4JH0BrIwYmWdSgCwKBXDamN0UOJxWX7SRVn3HnrnaQfLOQhFrYV?=
 =?us-ascii?Q?YejnrYljUBTATF2Rhifhtnl/tjIpW01HRtWmdtrjo1ZA3yNmn5OBvA2KU3pr?=
 =?us-ascii?Q?eFPY145uqWDvIwgjBWKeCPdPMIvD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFkg7P6OzoTLO23lFn97s8tunQ/Mr2s66YAr7w6cJzYXdR015JU7360zqZ6u?=
 =?us-ascii?Q?7J1thULjLKbwSSLHvt1HDk7moSsLjFcwieXyioxcfK+aHPCcPNpWweIVQO5p?=
 =?us-ascii?Q?B2GuAW8Zi8Ql1e69YJ84uzorH1iTfrGqOHXq+rzSfTFejnNVaVRidUyXqJIx?=
 =?us-ascii?Q?64QBpwlJFoaCML4a/diBZ2YRLCg/eUN0NHBuqQS/4PG5kMwQu2pgle7TPIpl?=
 =?us-ascii?Q?HIfyn8Q8lXWsafYCncqYlegSnScFLFPXT2B8pbEYJ280wnF1+uBXIdUU5bwS?=
 =?us-ascii?Q?LenNAOVA8MXkuAlCW97p2WtN9aGxEgMeMFu7T2xWxdAfP1odT/drCT2y24km?=
 =?us-ascii?Q?t4wCnfEDzIXM73+z1gsdutThuOfhYTqoVhkpElq2+jQWcZASRgvzLjSmlKbV?=
 =?us-ascii?Q?DbPPKlWTP7dD6YPnTfYYrnLQ52Tq6NGNqqX53Y6jdJ5dLwFsnzXKmHPV/ZaY?=
 =?us-ascii?Q?IrvU5K40SNTm4VaLVMSkgYBWqqdgl07aMpbiu1+oMFItVvqzIMX+Rkf0KMPy?=
 =?us-ascii?Q?hzLFXUC2WKx6PVB9SUslWHVbJ3yXQCkZMYaTFd82ucbk44iYH1dlewD5U9m5?=
 =?us-ascii?Q?6ilYsBcd1BafwAB/Ol6jHs7MhJj/TKGSXZKz3ABybak2kX/BE/XNctfMtd9C?=
 =?us-ascii?Q?qVJCmFMmxN3GgFhmkHEw1P7TTi5EpkK07OsCbGkPE2FS0NMJ5h4U57sAfMVH?=
 =?us-ascii?Q?v4j0pksjKjzOiiBPzwQvGcbx3FTx+CtMeBwSYXnX5GB2JgQTTA9VoMDHGZI0?=
 =?us-ascii?Q?lo1MyBKF7Ng3syPGrmJtaVW5Ct+8b+tHMnKYvORPpb0zqxY0K9pvquBnEQ7s?=
 =?us-ascii?Q?k7wkgCu59wNH7lGxMiCi+e47Z7m5ry002ZbB83T2HlD5dTOwQ3t+quQB0S1Y?=
 =?us-ascii?Q?uH6JtMMSlyr2FP8RQ4E5jA6rkwni8BUQsNcRgxW4laJyoSIGNEULjCP/1EmQ?=
 =?us-ascii?Q?9P5YXrhTI85Yl8nYV5P/QwRPswt/5j1qNoYYncAvY8yebnaDOCiQQgPxLaNl?=
 =?us-ascii?Q?AKLCXsIdECCLpii9yqnYHVoihqIgjlw3zdbXc4+hCT+uYm87lkov2XlaI+ff?=
 =?us-ascii?Q?CuZDtV1PoRHpoXo/emAjsqu/xJq8mqmpMrSGM7ygMDPoQdwDnOo2PdzQ1acJ?=
 =?us-ascii?Q?/kNAt+NkVrjCql3LEiuAJVDa1N6fN6Bj/iD8bF/cbI2EcPBvfxaR7hkiYw76?=
 =?us-ascii?Q?S2MeR6BDjEBgBsindCWKETp0ldZTSkZEHbgtLEvQz+NbOCKaxQudwL0x20rD?=
 =?us-ascii?Q?NdfxUVhkWJmqNom7xI+eggv1Q+D6xNQZnBZTnPCvdBH8sYFkLG1ccw4iU01w?=
 =?us-ascii?Q?dOJ2dP/GxR1DOPHArSeo7CTWrWta7Gkr6WnsmcBVR6IxVUGJCEsJzuYd7IEP?=
 =?us-ascii?Q?mcj9poAVnMVyAbHbfq4HAUgfuMFlEA37AXYTIdV/oxrnK3zrQ/5mPoSk5KUR?=
 =?us-ascii?Q?ztuvhB8br0YlKc4stUxh7DsrraHIMKHKexQMyk1sgDpj7SvLoIzH+Yu7G0Vl?=
 =?us-ascii?Q?orc3PyJCvL6Jg1ijYupKQO4cVHZ6n8Vms0RmuEqdmZvx1nKmw55qQ55EbsHY?=
 =?us-ascii?Q?gGCF9pDh2wetj5MQ72qDYnpxczD+zyBT9m4Jpaz/aBXc047bnCuktQaBnA87?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rFI7cA2N/AKOw4c/qvRS275q4Ks7j4WUgVwpT9VVLM0NHEyaRXeJe6/Yuld//oDuFevTkqwCt86rBB7EJggj7bJypQeSNELGpuKd3gluK+KwVfaWEy6I9hcJZU39BK8Q3DgEskP5Gwi0LrVPtjlLsFS98SqyOrKt6FJhJJLQmBQ+zjfC/ioWTwZ1LZhrPkvPKh7Wk73ZKXQmeoWop1Z9IDMq0F6p+5sjt08hI/JU1WNJ4F6z7T+H7JB1pgesj5HUa1al+QshUcyGOEDIApnwPu4FuWTX3hdoXNgwQ/Kdi1E1HKFkviXrQ10OoLIKcbbuhlAArGw/EQa1bEi2bYKqbE+wlwPBvDFXmU6BYTwsL+N0vQpec1tSuUOo2zaYuJCXKl//zt6CXiCCsKEO5sZzvTQI1OfqXtsNAT4vdstFZfgGFXqvQhltLL3eMMrV4clV3YlSP5OQLE9/LRYCLAsxeuKCeFjVqinQUgRKnico3axQOorSoUVjT8+Pd3h6WXxZtPNhfe8XT4aTx509D51X12FKS/Zy41rMRgG3iowZbxltFSG1ywvKjIFwA46uqFKrtbkey+e2BRdWrRp2JUqnn49hYOuwWl6ZScQdjWmlA6o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315b03a6-c810-4910-27e7-08dd46c3a999
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:33:53.5497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx3CvAEob5FQjWlITCLucxOaa5/VLY0xNPWTPv8J0Tg+NnUE1YFbjvxtvsSnGaU3IR8Ve3gdRBj6wSsWAIJaVO+enuEW4Ywcuqh1p5VledU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4808
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060127
X-Proofpoint-GUID: 4O1xAGrtfM8PHPehqAMZM5mrzKAH9fXb
X-Proofpoint-ORIG-GUID: 4O1xAGrtfM8PHPehqAMZM5mrzKAH9fXb
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

in the fb_defio video driver, page dirty state is used to determine when
frame buffer pages have been changed, allowing for batched, deferred I/O to
be performed for efficiency.

This implementation had only one means of doing so effectively - the use of
the folio_mkclean() function.

However, this use of the function is inappropriate, as the fb_defio
implementation allocates kernel memory to back the framebuffer, and then is
forced to specified page->index, mapping fields in order to permit the
folio_mkclean() rmap traversal to proceed correctly.

It is not correct to specify these fields on kernel-allocated memory, and
moreover since these are not folios, page->index, mapping are deprecated
fields, soon to be removed.

We therefore need to provide a means by which we can correctly traverse the
reverse mapping and write-protect mappings for a page backing an
address_space page cache object at a given offset.

This patch provides this - mapping_wrprotect_range() - which allows for
this operation to be performed for a specified address_space, offset, PFN
and size, without requiring a folio nor, of course, an inappropriate use of
page->index, mapping.

With this provided, we can subsequently adjust the fb_defio implementation
to make use of this function and avoid incorrect invocation of
folio_mkclean() and more importantly, incorrect manipulation of
page->index and mapping fields.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/rmap.h |  3 ++
 mm/rmap.c            | 74 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 4509a43fe59f..e28622ee4648 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -754,6 +754,9 @@ unsigned long page_address_in_vma(const struct folio *folio,
  */
 int folio_mkclean(struct folio *);
 
+int mapping_wrprotect_range(struct address_space *mapping, pgoff_t pgoff,
+		unsigned long pfn, unsigned long nr_pages);
+
 int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 		      struct vm_area_struct *vma);
 
diff --git a/mm/rmap.c b/mm/rmap.c
index 52f98f6ccb56..66cc318925bc 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1129,6 +1129,80 @@ int folio_mkclean(struct folio *folio)
 }
 EXPORT_SYMBOL_GPL(folio_mkclean);
 
+struct wrprotect_file_state {
+	int cleaned;
+	pgoff_t pgoff;
+	unsigned long pfn;
+	unsigned long nr_pages;
+};
+
+static bool mapping_wrprotect_range_one(struct folio *folio,
+		struct vm_area_struct *vma, unsigned long address, void *arg)
+{
+	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
+	struct page_vma_mapped_walk pvmw = {
+		.pfn		= state->pfn,
+		.nr_pages	= state->nr_pages,
+		.pgoff		= state->pgoff,
+		.vma		= vma,
+		.address	= address,
+		.flags		= PVMW_SYNC,
+	};
+
+	state->cleaned += page_vma_mkclean_one(&pvmw);
+
+	return true;
+}
+
+static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
+			     pgoff_t pgoff_start, unsigned long nr_pages,
+			     struct rmap_walk_control *rwc, bool locked);
+
+/**
+ * mapping_wrprotect_range() - Write-protect all mappings in a specified range.
+ *
+ * @mapping:	The mapping whose reverse mapping should be traversed.
+ * @pgoff:	The page offset at which @pfn is mapped within @mapping.
+ * @pfn:	The PFN of the page mapped in @mapping at @pgoff.
+ * @nr_pages:	The number of physically contiguous base pages spanned.
+ *
+ * Traverses the reverse mapping, finding all VMAs which contain a shared
+ * mapping of the pages in the specified range in @mapping, and write-protects
+ * them (that is, updates the page tables to mark the mappings read-only such
+ * that a write protection fault arises when the mappings are written to).
+ *
+ * The @pfn value need not refer to a folio, but rather can reference a kernel
+ * allocation which is mapped into userland. We therefore do not require that
+ * the page maps to a folio with a valid mapping or index field, rather the
+ * caller specifies these in @mapping and @pgoff.
+ *
+ * Return: the number of write-protected PTEs, or an error.
+ */
+int mapping_wrprotect_range(struct address_space *mapping, pgoff_t pgoff,
+		unsigned long pfn, unsigned long nr_pages)
+{
+	struct wrprotect_file_state state = {
+		.cleaned = 0,
+		.pgoff = pgoff,
+		.pfn = pfn,
+		.nr_pages = nr_pages,
+	};
+	struct rmap_walk_control rwc = {
+		.arg = (void *)&state,
+		.rmap_one = mapping_wrprotect_range_one,
+		.invalid_vma = invalid_mkclean_vma,
+	};
+
+	if (!mapping)
+		return 0;
+
+	__rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
+			 /* locked = */false);
+
+	return state.cleaned;
+}
+EXPORT_SYMBOL_GPL(mapping_wrprotect_range);
+
 /**
  * pfn_mkclean_range - Cleans the PTEs (including PMDs) mapped with range of
  *                     [@pfn, @pfn + @nr_pages) at the specific offset (@pgoff)
-- 
2.48.1

