Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A7A2D70E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 16:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A87110E2B8;
	Sat,  8 Feb 2025 15:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="KWcMi4u/";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HgUlf0Xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F8310E0D1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 15:53:54 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518BHPRN025532;
 Sat, 8 Feb 2025 15:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=corp-2023-11-20; bh=N1rHkmsdtiTwcUAm
 5z/o3D5/sohBeA4Uu7gZTOFDUDI=; b=KWcMi4u/stYkY0M/UvJlRhgXeK0gLh7W
 ZMgEMLbvixhT0zljOyPpKXyw66xcyFW0zehZO6wpxByg2oNS+LmyIrAI8o2FNO8k
 Utl7ewaZfpmDPryKcQ8v8WXAXW43jErnc0PQdxt3qc6Q2fxNUPM+6PeYG7ERBtml
 BY2+A9D9IO91YR0cDvqBR/+9OOduOfWIqqWDmEW7qMIBCFFcPMkJXWEsvO7QJLXa
 Zs0pTaftnE9A2ALRYMMvH2Mm/cWvQWU6nlBvvVqFD5VDVeWkrZ82F9ruLWsFSWGM
 RfOGmnP7YfLrlCJ4Q/lCXM1YLhfy3h7ZS9UAwZplIuYbNMn6xL1dCw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0sq0b9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 15:53:27 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 518B4WXE037888; Sat, 8 Feb 2025 15:53:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44p62vc2dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 15:53:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tN73OTFrN/mBjonWjIMYlGTSP/AD1A2VR71TLEgTDmhy2jNdaiLmMZ/ucWoWXlzx79dSb5/6ZQCaxndAaMXaDRniq7gi4ohhmRviqMXZurKgE7GbXrsd6RXZSeWiU8s9YfMaOIdc0NSks7vuRlupqOrX55zB8Tf/sh6MDY0yQsRRYirx416rfX+HboEgBEAQMqyptFiIVXjxiST8e1wkFU2OkuLA0VU+npYhsV1DgSkjXc+2C6rwDojVu1BHrQKMAe3UDbbid15CWAUErnMXnOQexCin2u+h671YLyiAsgGQ5o5QuIlVPekOjckem00Bed6OUpK9gVgdSHOy+yASzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1rHkmsdtiTwcUAm5z/o3D5/sohBeA4Uu7gZTOFDUDI=;
 b=o7uVrMSMdETZihQqZMNJZILmQj503ftO8gT8YXfqgPFyWu8nKrfjLEpDY0JEx3uPxjK3QAHA+nLMh25PJC1HyfpAT88EDGLguUjK2g7IVp0AqQbsd4wkG7960CTOSbyL3PKUsDB7XaSgHLG3hl0t74Y15kvftd533qNG4YweWi2Pjv67Dg1lQXCKM/TJxrSjF+aD7GkdwV+gUt4OTOyCeoVIuWIwty0c2gCph30+CbPLaua1xWJ3ED0HhyOQfQ6bTTm5kgW9YpkpRXX7cDkQElVUs8d6dDSi8DnBqYCXm6t3ibO9Mq5SIwETc50yomjjUDaFgzXoTbS4bi1k03mDSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1rHkmsdtiTwcUAm5z/o3D5/sohBeA4Uu7gZTOFDUDI=;
 b=HgUlf0Xi4OOe1v4OS+dNcrbpshwTxib7FWzICetOjtup2pbxNupmgzPBhA1U83COQVfnNbOktm86LLr5ZXhLQB/NiJVX/U+VKQJYKeyMgVCyI3ceKm2AKB3tvU8GJz3eaxew00ubzRpz0TF24o08ylu7Y9PZqxHD5+Lq6NFnjVU=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Sat, 8 Feb
 2025 15:53:09 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Sat, 8 Feb 2025
 15:53:08 +0000
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
Subject: [PATCH v3 0/3] expose mapping wrprotect, fix fb_defio use
Date: Sat,  8 Feb 2025 15:52:53 +0000
Message-ID: <cover.1739029358.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR02CA0064.eurprd02.prod.outlook.com
 (2603:10a6:802:14::35) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d8c3ba-2bd3-467f-15b7-08dd4858aee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SCjmLEIvKO9LRMS4P9okWJ2kXIMWWzYpd0B8OMaPBReDScyVn4bmLAqQaAPj?=
 =?us-ascii?Q?xH0CcDyyysFbC9CzoI+rtWQiPZY8wEx/iqz/HHaFj1V0o9iNENV9gQ0Gps/i?=
 =?us-ascii?Q?nmqNtrKOlgVL6bYvbUuQ8MAehE7WKGBXXpFkJgrGE7DNSq4h/mvZCz3kFxUe?=
 =?us-ascii?Q?yPxDr1PBqpzVg53B99BmmdyQtQwDAm26C9lgNYOyx+F2TFLI9Shs7YAllcLa?=
 =?us-ascii?Q?PAcDv0ZCcV6UB5mk2jC5hihDSOcy//ofZ9CmnoNZRuzdiZA8lXj+v59/rcb5?=
 =?us-ascii?Q?0foFIXW5E8nYfL+3/C7evPFycuZEyo6t4KcxFOZGGck5PR/Np5jpIRNc7GTV?=
 =?us-ascii?Q?lEr7duJaGJE5rK0KRPzCyV7ulWWg2cOxLDpgyoACBNVqq+ilY3z8c3OUfrXv?=
 =?us-ascii?Q?0sQmdll+1edIYJpoN8wxuV8pVzf+EHvKmLxTL1cdlOf03pyfyPNw10RgS1eD?=
 =?us-ascii?Q?tKJ05cLFCn8ITcd4Q2gjOgB1p/Uk4NqH4f5Vs4KAbinBZCiV99jH9pFZXRiL?=
 =?us-ascii?Q?07etqh8cp27ZDBIvrSeEfKtlIBNuTVimVlHtHIBrNls+zAc/zQzh9jGu/DqA?=
 =?us-ascii?Q?1hTZtr+gHEZqdvJvJkvmqAJ+u4lVd5YYVPWkxw1Tyy8ImN+zQ4k0oh1kkZYI?=
 =?us-ascii?Q?4091L3PziN/PckunIOv3tbbY3k6+LAqNJ5F3NN3WOZOCnc+O8lNFf90PbxU3?=
 =?us-ascii?Q?2mDDNhTDfmW+ZNiwjwyysugyqV7ntJTOPaelPweMB7RDYS1CUVoP6v0DQCmu?=
 =?us-ascii?Q?PwOXvlbZboE8ATe0rtnwD2wfIolzUkHj6X7ua/05nzDulxcmMXQozvfE10IM?=
 =?us-ascii?Q?bpBznWwhr8GUCKikTpNeWyyCldfurLb7KjL1hd6Y+rGmBoRJlas4aHuj+s1C?=
 =?us-ascii?Q?J1W+JzAKP9HEkBBMT+lcVzwerpwm+LRFnL6mCrNu/73LLs/N6YZW9ateQacT?=
 =?us-ascii?Q?xBt2zcuygW/ru5/j99zsv7VJiiZ7ROUJY/KMLPheBMaYrF8K93QNsobGA35I?=
 =?us-ascii?Q?MxeHYF7KHrctCi6mpczWRPZV1GPhWK+FxnC+n+IwOWyfOxP+DqwLYPvpee69?=
 =?us-ascii?Q?fMsMugsKE+qxTQOORKgNpg05xCxIv3UlfwZPCB8ZECaQ46L1ukUPbXUJWgdX?=
 =?us-ascii?Q?IVh68Tmnzv2hK+Yino34EL9haJt0Aw8y/lq844fvAUHre9qC2Pb61RKilnn/?=
 =?us-ascii?Q?NbCgWGRsoTxWpxOOg2QZd0MMTMKEXr9aT7DAoISyRg8gurfqGxKvozr15oG9?=
 =?us-ascii?Q?Pa2JOWicd/XlPB/9/B94bEhQ0e/9gSo6J2slXDH7ScrwvBR2Y6EqsGIH7kRc?=
 =?us-ascii?Q?+qRencO9eUhiGWdgFNLW1y2enFBGTK7t+zqWhpIrk6QxfzjEllMesWHHl0+d?=
 =?us-ascii?Q?hHl5tvff7xbYn+hyYSDUSd4aJiEFUE4vNl7zBW70OhqV0VtX+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZCpQAdaDHhkYRneMrG4EFqudo6lTG0flUXtfbGkjBi/JKF7eVyGK+3PALan?=
 =?us-ascii?Q?QD7DUY4Ip+HZhb6j4IUJWDHk8meoWoCz6km93zihXJvs/ZOJBpvmEfQelwUe?=
 =?us-ascii?Q?nuzJfRtp4Ysr3p0TYVDzGIjObDRKjKw8d1UGNJT7Nzxfsh029KUiFTaSe38u?=
 =?us-ascii?Q?TWQTQyzuOeTdWBZcWdsnxSpxn5vHPBVNMgpx5h3ytLA3IMniKL3kZ9qHbsPr?=
 =?us-ascii?Q?Rsz0qFw3MeGZgL50vjiSnBb9u2N6cLPKrmEU+B/T+JhpJJ/lNDxCgVqlqLZ3?=
 =?us-ascii?Q?RL8z5/9z0PTzo2j5SVrHclZNU8x/c43hOm69WoplZnqh+4OK1Mahp6jSpAiK?=
 =?us-ascii?Q?x6hrXBf9UIhqdTvv1KZ5ivra5RYAisA3eRXfQuKrcLYv9N0+62F8IX0kgnDe?=
 =?us-ascii?Q?ynWoni7MFSNiDFFt9EH7yJCfmjrKzmWkMpV0GRmk1vluAn37Pq2B/6AzUMmw?=
 =?us-ascii?Q?M4TdlMi+aGpUCsp6XFBEgUO6WUZK9G3eNG1u4QBxXZvCJR2cXO2BJcIDiUu2?=
 =?us-ascii?Q?yVRSqh26+R6SPcc6cJ1k3nGamAbe5h201dzmsTVMsUzBCQQLuKwB8/JZLSrJ?=
 =?us-ascii?Q?3BSP//7c0WcHU1wnlixqvyUCZF/6pmDSRkKj0GlSauXhi9hJPDFYXDBcG3CE?=
 =?us-ascii?Q?kZz3IgjM4TRyjquK8nmy5HxfEKZIxk6sNAj36dsc7iwlC8RNm6D2F3yZe1lL?=
 =?us-ascii?Q?Stq2FihrErBvEbeIh8VhDISK4NiAJp+QFoqiuPBy3/nclBVF0WklDmRIyB/9?=
 =?us-ascii?Q?+2umDrgNJ8TcNu7QDQdWecBDuI7tnpCORFyj4EbuDCJps7MWhlce1EsuYPah?=
 =?us-ascii?Q?cWSOEv1FueXvLB+zMMFGoRI4rE3db2rw0nfhIBfCtLOmxTMsU+WSiYfcBaBZ?=
 =?us-ascii?Q?eQ2ryC3v5YW+B6M7DKWnSjxPFwpsnUV+C7OkCDN46vOwjQyLWTVEKF61S9Fc?=
 =?us-ascii?Q?BqBUHCUQWvIQhvREeBIvuuSuBBvA/0iuXLKmlmrM7sRYEc3MYCsp5VqoV+Z8?=
 =?us-ascii?Q?5hhIt6z+ovt+TPMaIaBAr59RO3/6ITCfjZNEM4TmKKM1G9WrvuaatFqLj1+d?=
 =?us-ascii?Q?0opa5GBWXZRzLBaJXUYzXMJQhwPQyj/Qf34lGsSgQGxIUaF26gtYdV/J8w3u?=
 =?us-ascii?Q?Mzgehns48Mx++8bs3ADeSHlGeawXfIcwKA5YDiPltDBzmd7mLFZPq8c+H7G4?=
 =?us-ascii?Q?51EtiZYJwAByTwYrKsXtvZ/KjcAexB+uueb4JJ9/2QDF+bfy3GO6MMgG/N3E?=
 =?us-ascii?Q?+D4a9ei+9tLtZ4jLGIz+QB3KHBcPVd2R/bWcRmVJ/0tG/iRqaHrnIpGBm+/2?=
 =?us-ascii?Q?VfOM2RILtL9oXYYb7lZP5fFebEyhLHemxHGZhF9TlN0L1ocItcc5jNHg9owg?=
 =?us-ascii?Q?CIZA/Je/3jkHpcAtoCXbSKdtUbfizUNgflA0bhw01iIqbQJnZ05/Z1wJEghX?=
 =?us-ascii?Q?BX1NgVtlvCgA3CfmFX6m5+HlwSOyPS9YGvrpH0kRxt+9q4jC9Gb4gqx381Ax?=
 =?us-ascii?Q?Hfhqv6Dw9D5BfQ5fxksior998atjwQlFxsmczfV0tFOmnOSzph9wjYKiDnC5?=
 =?us-ascii?Q?Qx99izwju4kpfi6E665hzkznOWxt6IpnGu+Q+EdaVde5RajIcSeDJDlIQkTz?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: b5P7VD108g85PfQo9HNq3Rub3qLoZix4EaYBrkJbRwle0Sm1gr/pMz388YDhW3HaGEekeJcv4dlHm2/A0PQViHtQg+l6fb/Qq2XFfS3l6IzbNnwPzkXyyyc+Ol0krN4S1vj+Qqrfc+IFRTSUoExqgjWbEomx2Ph7Y+/DRBJVZXbWmB7vshKIasgm9wbHnLfBwb6drUSsOSu/i+yBgM9KSLy5th9aWw+20+N1VvchxiuePYHQ+um3Jl9SqbdMzt1L703PpeYL26/SOZiJgccMTnolDNcFJJ/P3Hk1w8Yxc2qzPGqOv7jzgYRK0ccDs3WUgy/D5KvzrLHOy6NLBuWEyZBf1DlJ98DFf43nnr2lJnF5Z/rgbQ3MjZH9YxpLPOKAyqwtNeIusGBtB77UsP+P9mrYdMDENU/P+9HBd79iGRZNNKsU8M0doGEU5SA8uI9t/qPALZpRn25COFzADw7dQlWqp+A10syiFsmLLx9e/2ksfizz0WyaQ4HeoRMZGseay1ac9ihDcKHJ37+JJqTClb0mAKl2J/T4WucZveJlz38195p8dWKPyd6DQtpD8eV0rYqHxyRSV47nE715hXXRkfXaXY3kai52GLMl2HyU20Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d8c3ba-2bd3-467f-15b7-08dd4858aee7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 15:53:08.7783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfNul+N+JaA2Gtx51gqvB8WUVfM9pIBlaJjmA6v69coihqG7LLXf7dD+cgoZ32e57mEmBQvEWMS8ih+uTYryutVUx0RKGmT1F8yhcS3DDOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080134
X-Proofpoint-ORIG-GUID: nt6rH50LmeQfAolHUHi7-sgaqPUqvruA
X-Proofpoint-GUID: nt6rH50LmeQfAolHUHi7-sgaqPUqvruA
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

Right now the only means by which we can write-protect a range using the
reverse mapping is via folio_mkclean().

However this is not always the appropriate means of doing so, specifically
in the case of the framebuffer deferred I/O logic (fb_defio enabled by
CONFIG_FB_DEFERRED_IO). There, kernel pages are mapped read-only and
write-protect faults used to batch up I/O operations.

Each time the deferred work is done, folio_mkclean() is used to mark the
framebuffer page as having had I/O performed on it. However doing so
requires the kernel page (perhaps allocated via vmalloc()) to have its
page->mapping, index fields set so the rmap can find everything that maps
it in order to write-protect.

This is problematic as firstly, these fields should not be set for
kernel-allocated memory, and secondly these are not folios (it's not user
memory) and page->index, mapping fields are now deprecated and soon to be
removed.

The removal of these fields is imminent, rendering this series more urgent
than it might first appear.

The implementers cannot be blamed for having used this however, as there is
simply no other way of performing this operation correctly.

This series fixes this - we provide the mapping_wrprotect_range() function
to allow the reverse mapping to be used to look up mappings from the page
cache object (i.e. its address_space pointer) at a specific offset.

The fb_defio logic already stores this offset, and can simply be expanded
to keep track of the page cache object, so the change then becomes
straight-forward.

This series should have no functional change.

v3:
* Fix fb_err() usage.
* Do not add missing CONFIG_MMU dependency on CONFIG_FB_DEFERRED_IO -
  unfortunately this is simply not practical in this series, as this option is
  selected by other options and this propagates quite significantly, and it is
  not obvious that a dependency on CONFIG_MMU has been correctly tested/assured
  to be valid in all instances.
  Instead, simply use #ifdef CONFIG_MMU to avoid calling
  mapping_wrprotect_range() for nommu, which is equivalent behaviour to before
  this change.
  Ideally somebody will work through the fb/drm code and ensure anything that
  requires deferred I/O explicitly depends on CONFIG_MMU, or is ok with the
  deferred work being a no-op.

v2:
* Make CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU (as it strictly relies upon
  it) to fix randconfig builds.
* Replace mapping_wrprotect_page() with mapping_wrprotect_range() accepting a
  PFN, as per Simona. While it is not suited for use with DMA addresses (as
  pointed out by hch), it is still worth doing so to make the function more
  flexible.
* Also update the mapping_wrprotect_range() signature to be more logical -
  with the pfn argument appearing before nr_pages.
* Use fb_err() for error output as per Thomas.
https://lore.kernel.org/all/cover.1738855154.git.lorenzo.stoakes@oracle.com/

non-RFC:
* Kajtar kindly smoke-tested the defio side of this change and confirmed
  that it appears to work correctly. I am therefore stripping the RFC and
  putting forward as a non-RFC series.
https://lore.kernel.org/all/cover.1738347308.git.lorenzo.stoakes@oracle.com/

RFC v2:
* Updated Jaya Kumar's email on cc - the MAINTAINERS section is apparently
  incorrect.
* Corrected rmap_walk_file() comment to refer to folios as per Matthew.
* Reference folio->mapping rather than folio_mapping(folio) in
  rmap_walk_file() as per Matthew.
* Reference folio->index rather than folio_pgoff(folio) in rmap_walk_file()
  as per Matthew.
* Renamed rmap_wrprotect_file_page() to mapping_wrprotect_page() as per
  Matthew.
* Fixed kerneldoc and moved to implementation as per Matthew.
* Updated mapping_wrprotect_page() to take a struct page pointer as per
  David.
* Removed folio lock when invoking mapping_wrprotect_page() in
  fb_deferred_io_work() as per Matthew.
* Removed compound_nr() in fb_deferred_io_work() as per Matthew.

RFC v1:
https://lore.kernel.org/all/1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com/


Lorenzo Stoakes (3):
  mm: refactor rmap_walk_file() to separate out traversal logic
  mm: provide mapping_wrprotect_range() function
  fb_defio: do not use deprecated page->mapping, index fields

 drivers/video/fbdev/core/fb_defio.c |  43 +++-----
 include/linux/fb.h                  |   1 +
 include/linux/rmap.h                |   3 +
 mm/rmap.c                           | 153 +++++++++++++++++++++++-----
 4 files changed, 146 insertions(+), 54 deletions(-)

--
2.48.1
