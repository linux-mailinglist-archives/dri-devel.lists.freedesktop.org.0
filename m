Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B154CA2D70F
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 16:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E294610E40E;
	Sat,  8 Feb 2025 15:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="SsoJGDp0";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CQp3Gz35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EEE10E0D1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 15:53:56 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518BqPP2012898;
 Sat, 8 Feb 2025 15:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=sV8SPtY26nGYpzk1aH3K9acBX4L9j9k99U0rgANCNSs=; b=
 SsoJGDp07iaRoh//Z6WZXpQi4aDxvuKIvBtSdRwS1bZ2LLjSpuU6mLhvqcppF9h+
 nfxxISyP4LTA01cS7Q1Qn6NvcGBIDOBqZW7xbbd/oGfJVuqHax1PtW3e6ctpuCaG
 4duvzn4Wqztk7BoC0rX1gSq7Ht75TZpKYZBtpfUzJfEccxZTBF5tbcmvgpO776oa
 iqipTWwOlNEDo8yjtJTvp1HFeK+oUawQxGM4rzVEoOubZF+iDWObFyA0trest7rX
 St+cesMcRrfyEXKhRfJaLwv7ZSx/v85iHMHiXaNWhGeG37VxZAg+hfl6Ms/uauXp
 uSXSlrbAWuqGNv6poQn2wg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0qygb3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 15:53:29 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 518B4WXH037888; Sat, 8 Feb 2025 15:53:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44p62vc2dc-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 15:53:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZdUDpK2IUZcNfReOlP4Qn3EDQZIZSFRRSw7fQNbdztit3Mk6I1npxEFOK71f6X7TDK5izc1uYYIEldCrvAXqfCA9ZD3dS3JAndShR1pBV++9v+Ar1C0NURHugikiukXOrsz96YZcJDn+doaNta8jatKmGPMPypUQLj6rgDYQ4jC7Gf/bBG/cxruBFx1TWSN9F2P45Msl9utPINnsjiJhhBUD4dM5wVJI+uT4Gd5sb2OxLnm3O67c4IfS3kKWcnIFgGwf86T7Azcso9d2OorPco8cHab3mrt4OO80ND+xfyJefbarxlYoZ2tTz32OtHqQISSvyWxTCU+l/Iwtw2RMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sV8SPtY26nGYpzk1aH3K9acBX4L9j9k99U0rgANCNSs=;
 b=Yd0T1W9Z5B0FmlGFcFOHytVFW+K5PHOdrqG8zq1+hSCzL6y5+hxswXq8pwZDKY2ddi/L6Imk55JivBu9utnNED86FBUPQrscQN9HmMbHTh1QdpHCdVvQwGKwoI79K3s9iGtUiJ343NkkAatEdMBX2X+A29itE1N14vq+dykp3MQN7pRgmK8Jtmz7o7MxQLiiuI7NU7W83O1NYeXS56NAByeUreosjm7xrXI/l88+jCtyl0UcNRqfU0RhC8j/4sciC9ENcYyWpePm1vFk2naFk3+/F+4m1qLXk7cVYkwphrx6UUSq3fiTDKiap5p/i9rh3wcf3rWPx881cyG+ftqOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sV8SPtY26nGYpzk1aH3K9acBX4L9j9k99U0rgANCNSs=;
 b=CQp3Gz35NuEl7zDy4eERD4QRugUYKbf2B13Tkfh34ZPBtQ355onfAZOLqNhZBlt2SUqmgBt2KepiHz3j9APLCPECITzJoizgw/zL58qluzWYzoyPUWSRFY4puai1W87/pN9yVzZ7qhXy82rf0VBP618tSU7SflrTi08alewm+i0=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Sat, 8 Feb
 2025 15:53:17 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Sat, 8 Feb 2025
 15:53:17 +0000
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
Subject: [PATCH v3 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Date: Sat,  8 Feb 2025 15:52:56 +0000
Message-ID: <81171ab16c14e3df28f6de9d14982cee528d8519.1739029358.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739029358.git.lorenzo.stoakes@oracle.com>
References: <cover.1739029358.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0045.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::20) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca2ace4-6e2b-4922-e34d-08dd4858b432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?THkpuebtYLVYzwd7Veirwr/ldx694TQd9/ME7kvs1Y5HfjR2FvMPWluKLj8t?=
 =?us-ascii?Q?BcIKK6nVmAANrTsai/3e8fEV8qqKQvS5pr1HSGjb6brRgaQw1lFhXwbg094l?=
 =?us-ascii?Q?HqVbWDK0XlclwstCxGb0YcvWdqTXoM+M4+Xat8cIzFmtWpXny2Ao+9PXq0Cc?=
 =?us-ascii?Q?cNsQ2qc50K+tAeN8QZutntKGt8QPg25vdM6YGo091nTUgOy03W1yHeljn6XW?=
 =?us-ascii?Q?MOWdPEG7RwKF1BRz7N9XPcUg1CHAJQoywzkC+KRTdANx8nCh2uVn3/cZEnyD?=
 =?us-ascii?Q?+NEajYTGjiuInGPwvkKAQzCXhUp0+QcLSTvdvJdZdvwx0aPg4f4mAa0tc4Oo?=
 =?us-ascii?Q?+4vDxmW3EGIhV5HI2HDXPCylEqWLCOFevVltj4LN/yOYq+tKnwGmHbhX4Eyu?=
 =?us-ascii?Q?8ov/mzcKx4Le1SK7yYk3oWKao2r/riCdu6jx7aCX7qzLPZ9Y4oFb7U3efUvg?=
 =?us-ascii?Q?ZZBFlOSOlRuF/MBH/OSKAHn6HFsISUz01GEeo4vXTvIiONYWcB1Ph8cmzaFq?=
 =?us-ascii?Q?GRf25STVarvkW/qVMCguSWAoa67j4sU3DutObQCHKTrjWiUmvCNflCb0HtyG?=
 =?us-ascii?Q?qjXJIjW6UnyTL/8IMbbn8DAYsHQX+aJSwqtqreWBLv461PNdWXEsvnIwkL7G?=
 =?us-ascii?Q?vmEN1KFLIF7HrYXIiEPn1x9oBUKYWpucjH8M16iLHivzRd9se32c1I43AjZv?=
 =?us-ascii?Q?ivlk030LkbMuXoJ3P8GtEVYxyuIJl1+41v7GSLZhp8DPxbKsPQw/IIlPEfSb?=
 =?us-ascii?Q?elNXbTuxfKu9wGl+PhVqMVKj/a/pBVoLCMacn+eiOwBO4xBMytGQB47QLwuT?=
 =?us-ascii?Q?AAWPEJhWUOVnYqoLkVQrUO6ZO4xxljaFYOAn5IbtDHkv/x3sevMJjLJo/oRi?=
 =?us-ascii?Q?D6v/PZimD56eA317tYgXPwp3dAtxRTXcfhy3NByUk0PXrLqjPufcJ0/6KlMA?=
 =?us-ascii?Q?gLRLdjIYpo1qahxV8YA6UAwWjIrRY6Mc1I9QPMA7cclK/f68vsrhaySso9+v?=
 =?us-ascii?Q?sHlfSYghwC1i/+XSwdZXFHi1GRzFlcs9EEX/Lqu5q8kijLwapZ/uuxwIjclR?=
 =?us-ascii?Q?IqQIob/8ihzIWN8VHVrtHr17H5UGz6BQUyPe45ZMS3jxDBLmggPGtqH3Vq7L?=
 =?us-ascii?Q?cp0P5okrKGRgdrheM8OeaYEc4jsyv6dwTXFuGPPOx6fsnhkIgKx0GxrnxY0i?=
 =?us-ascii?Q?w2Vh8jM1kHi4/AOe2mY471RYoM45JcWr/sfNfAOqTD+qASLq06VC4gcUnd4+?=
 =?us-ascii?Q?nzkfUiAwAPGfJweivc5/3keFyiFGSPRgQSOGmSSE0L5gT08zOqNqyZ/FLCc9?=
 =?us-ascii?Q?8DLIZj7Ocia4g5+pB4TGHRiHm3BdfgYK3Y+iZbQKhBI/l3sR5tOabTu1TDjX?=
 =?us-ascii?Q?aq4DrFokiYlynSNgwPPhMFNrvJnU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3CXYU4cTZnJ5H/6fqDDs5CK5gl4h3CHlPM7x1lU59Nd1D/BEFUH4DN4Os9QI?=
 =?us-ascii?Q?HSPTNe7W3ksvBTD98ZznqBG1PvMxDs2C0aWepWIxi+ENHj+plw66IVOFc+Tu?=
 =?us-ascii?Q?23JBFALt/WLzUBuH4tXWrroeq9dTlxTfuxjEcjgs3x9TP+S8FIfPMZrB6Y3M?=
 =?us-ascii?Q?meyiRLjI8G0lqZLBeTyDYrmJ+G6+gyqmq7KC4asTU0XgCAFCo7iP0zzVwLw9?=
 =?us-ascii?Q?U+PdwnRilTp5h8WzWj+yHzuOHgziknFAUZ+LlLJt/JHfd5HgjpzJEVFv0f64?=
 =?us-ascii?Q?uFu6Eyj8BBI4IrsG1UBprOLPOUtPdzgQA7SyqCwNInVdtdUmLEQ8JpysXnYS?=
 =?us-ascii?Q?7RdtdK9bM3FJP9wHOLMUvuaqccvg/grxtYRxvMst2kna4ri8sDUCv+ZkeHva?=
 =?us-ascii?Q?9O/VdmuBdkWVbUHwPTAb4vrEo/7OVlS97mWrhc2v/9wp2/0tY3YRHoUGuhIG?=
 =?us-ascii?Q?njs99D4bn8D9ORsX6TFFFVpCq8Rxur8+rciaLm1MyVr2G55Tt7xNyggdkgCi?=
 =?us-ascii?Q?DFR/HmvVzqol/WrlJ/1H9bxwwFxdkQJ+M7LTPnNDR+k+khUTs0YZOsO86h8+?=
 =?us-ascii?Q?81x6FBU4KyJTb5OPQO1QdHYJkvkTJYVWFcfCauaMPXOK4D27UpT30JGQm6KR?=
 =?us-ascii?Q?fASEpjRksxLjc/pf11GdjIsT7kCcL/SyopJ3Szjbfxw/z7r5rKq5+aHWvkfx?=
 =?us-ascii?Q?8bRwN/lCdg6eqx49xocThdEISwZJAjqXxybsQqD6gB6IwQoAFCxJaIu0E+vm?=
 =?us-ascii?Q?GAjNDft+5s4fAD+izmAtIAJfNxBBpboUMK6s/IPmQVU3pzFWVmcYE4nocFo/?=
 =?us-ascii?Q?TRbYL3c2I5KK9SQrQ/dqjtMRmtcZ/Bv+i4Mc0kUrnDhzj61KFo6VXkMn4N8/?=
 =?us-ascii?Q?O5fxMOwEL7FFLC2oACtnfx3vpWNTcC5qmkMdSRr5X5VB1ZCuhPCjrb46VTzJ?=
 =?us-ascii?Q?Vk4unprz/mrESNKdHemtDGDxgF4iacWDun+WAG5C1d5PjMC84NTkLjPvIuKv?=
 =?us-ascii?Q?l6mPEu/p5rRP2d5qn7qrmj1BuDHOb4VViycmoT2wpJY6nTR/jMmcYskY3DLL?=
 =?us-ascii?Q?UIMZeLhl7vsytqDBITvsZ0MNvQShERlmoY5m9sAgjBAsVE2Q3Wz9RY2YCHGR?=
 =?us-ascii?Q?Qtyw4AShkJL/OZctox+zdoadALbvpQDtuLo4afBSawcdwdr/QDs3AVwLegpY?=
 =?us-ascii?Q?s7nS+hG00Pnp0evcQgazZ3xuKQ1bNA9vXzN6ix0onR5glL2su7gPFEdl0O4m?=
 =?us-ascii?Q?fxQ7eo25gLwFxjAMllL/a319Tnmlr8optmPpxXIM9Py45rsB0L/fxeXjq/z1?=
 =?us-ascii?Q?lxvaEW8IC/lBNJwyDAaQQn0HZgGtCxZ8SvKnxSRr4+qJclR1vPHrSf2f7JXq?=
 =?us-ascii?Q?LVBaOnQrfG3HgvRGbKzH6OP/AqMGBntrUIUdUNh79AAfkO5hhLhhF4jf4f7C?=
 =?us-ascii?Q?UGlU3Gmv66d0DYkeuwA0jTCY20SPACKkx+WjXgCElA1V3ufb+jXSDWinLKOy?=
 =?us-ascii?Q?LPPdk7RWrMl8kCL86RTq2bD1FxVtN8rxr6iMN3tFcesDmUTG2ZJbJUsBy/Nj?=
 =?us-ascii?Q?ABUIPUO2ZnA6Prc+24rzQjevd/I0QqKbkuZpHpL1tZt0OrpyNU/K3Vhb1UWH?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ni0IcpLxe+MH8I5a2Qf2u2ff84g1LOOpQ2dfqfnIeRDCylkT7/e3SZsFdJYNPfZ0XtwvXG5klsupCX+g92e9R9toiZ+b9Wh8b1o2YvijTCEcsEhjItRQdFyGok2gvtAxWwrKTu5oI+5O9aTR0W9hxAxQMpHnuxwMBwD6u/gCq1peLEFRrAk+7lMPJCz3JVmp9LOE4lnBMJQoCZ8G+iw+KxjKoZqPDZTxMzmDL5pcZDqZCmzD4DgVjpuJuB0janVHOJBu9zdLt7wo/EAoO5KaJ161AGtUQ0NKeZcwYXanGr/W/1jL8YLrkD+DOUvhKuc0WXWNdaXSCLoLypTM1AK/HycBEzb//3uP01EtExamIClNCyGFFpSwGR1PbPXLlk+XWiGhj7/JJSkXDT6KB7bI2oLd9vVxdH0v6rej4P2DrXbLhc0pBSlGFxB7GHiHz+pOWQ2lduhODvKT+UyXuADDz9dox6DVTL+agAtlM9fZfOHH6nmkCQD4Nj9Rkm3YKnaL8tBTdbVQuYpwtTvNLc2pX0K+ow3aMmc76z2/opi6kRHj++yu5eOd1OiDZFVKVnwP4rAYu/ZThZoJn43pgvjLJkH3kd9T3wk7WQ4C63Ypcxc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca2ace4-6e2b-4922-e34d-08dd4858b432
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 15:53:17.4965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ej+wZc5jZFbn0DbI68uEkODIOzN/BvWO6If8nfKpkqrAz3kVtnsI1CAgfKZodmF1ArrZHdmZ/YulrXweDjEy1g6m3P4jRy47PkE/2k7Zs4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080134
X-Proofpoint-ORIG-GUID: kooadM9Z001K76SLMor7u7cZ2wPVbteU
X-Proofpoint-GUID: kooadM9Z001K76SLMor7u7cZ2wPVbteU
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

With the introduction of mapping_wrprotect_range() there is no need to use
folio_mkclean() in order to write-protect mappings of frame buffer pages,
and therefore no need to inappropriately set kernel-allocated page->index,
mapping fields to permit this operation.

Instead, store the pointer to the page cache object for the mapped driver
in the fb_deferred_io object, and use the already stored page offset from
the pageref object to look up mappings in order to write-protect them.

This is justified, as for the page objects to store a mapping pointer at
the point of assignment of pages, they must all reference the same
underlying address_space object. Since the life time of the pagerefs is
also the lifetime of the fb_deferred_io object, storing the pointer here
makes sense.

This eliminates the need for all of the logic around setting and
maintaining page->index,mapping which we remove.

This eliminates the use of folio_mkclean() entirely but otherwise should
have no functional change.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Tested-by: Kajtar Zsolt <soci@c64.rulez.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_defio.c | 43 ++++++++++-------------------
 include/linux/fb.h                  |  1 +
 2 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 65363df8e81b..acf7bc7ac45f 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -69,14 +69,6 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_lookup(struct fb_in
 	return pageref;
 }
 
-static void fb_deferred_io_pageref_clear(struct fb_deferred_io_pageref *pageref)
-{
-	struct page *page = pageref->page;
-
-	if (page)
-		page->mapping = NULL;
-}
-
 static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
 								 unsigned long offset,
 								 struct page *page)
@@ -140,13 +132,10 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 	if (!page)
 		return VM_FAULT_SIGBUS;
 
-	if (vmf->vma->vm_file)
-		page->mapping = vmf->vma->vm_file->f_mapping;
-	else
-		printk(KERN_ERR "no mapping available\n");
+	if (!vmf->vma->vm_file)
+		fb_err(info, "no mapping available\n");
 
-	BUG_ON(!page->mapping);
-	page->index = vmf->pgoff; /* for folio_mkclean() */
+	BUG_ON(!info->fbdefio->mapping);
 
 	vmf->page = page;
 	return 0;
@@ -194,9 +183,9 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
 
 	/*
 	 * We want the page to remain locked from ->page_mkwrite until
-	 * the PTE is marked dirty to avoid folio_mkclean() being called
-	 * before the PTE is updated, which would leave the page ignored
-	 * by defio.
+	 * the PTE is marked dirty to avoid mapping_wrprotect_range()
+	 * being called before the PTE is updated, which would leave
+	 * the page ignored by defio.
 	 * Do this by locking the page here and informing the caller
 	 * about it with VM_FAULT_LOCKED.
 	 */
@@ -274,14 +263,16 @@ static void fb_deferred_io_work(struct work_struct *work)
 	struct fb_deferred_io_pageref *pageref, *next;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
-	/* here we mkclean the pages, then do all deferred IO */
+	/* here we wrprotect the page's mappings, then do all deferred IO. */
 	mutex_lock(&fbdefio->lock);
 	list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
-		struct folio *folio = page_folio(pageref->page);
+		struct page *page = pageref->page;
+		pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
 
-		folio_lock(folio);
-		folio_mkclean(folio);
-		folio_unlock(folio);
+#ifdef CONFIG_MMU
+		mapping_wrprotect_range(fbdefio->mapping, pgoff,
+					page_to_pfn(page), 1);
+#endif
 	}
 
 	/* driver's callback with pagereflist */
@@ -337,6 +328,7 @@ void fb_deferred_io_open(struct fb_info *info,
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
+	fbdefio->mapping = file->f_mapping;
 	file->f_mapping->a_ops = &fb_deferred_io_aops;
 	fbdefio->open_count++;
 }
@@ -344,13 +336,7 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
 static void fb_deferred_io_lastclose(struct fb_info *info)
 {
-	unsigned long i;
-
 	flush_delayed_work(&info->deferred_work);
-
-	/* clear out the mapping that we setup */
-	for (i = 0; i < info->npagerefs; ++i)
-		fb_deferred_io_pageref_clear(&info->pagerefs[i]);
 }
 
 void fb_deferred_io_release(struct fb_info *info)
@@ -370,5 +356,6 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 
 	kvfree(info->pagerefs);
 	mutex_destroy(&fbdefio->lock);
+	fbdefio->mapping = NULL;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 5ba187e08cf7..cd653862ab99 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -225,6 +225,7 @@ struct fb_deferred_io {
 	int open_count; /* number of opened files; protected by fb_info lock */
 	struct mutex lock; /* mutex that protects the pageref list */
 	struct list_head pagereflist; /* list of pagerefs for touched pages */
+	struct address_space *mapping; /* page cache object for fb device */
 	/* callback */
 	struct page *(*get_page)(struct fb_info *info, unsigned long offset);
 	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);
-- 
2.48.1

