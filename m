Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421EA2AC85
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE9C10E89C;
	Thu,  6 Feb 2025 15:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="cyO5A7lu";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b+mGDFek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A284610E89B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:34:30 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516EP7Y7007509;
 Thu, 6 Feb 2025 15:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=corp-2023-11-20; bh=aObSFrw1OWoRgwcP
 eX9KsauJhBapUFHT+saMzjeqznI=; b=cyO5A7luh1DBGBVNnfwIY/Pq9VhZZJ5G
 4Jh3km/6QH5iLx8vdi4l5JcZ0pWM3Fksb8Bpsf1f5sUgmZYabMDa6yAZoxSj09dy
 4AFK/VwHLS96nlkMmLaSKyTqqtCinDUmJBL7lGpEl+8LGWLq0Qs39YWE82ubcYEN
 EW0MIyMLqu2LxaGijojIRRwC8kii0gV3QJIEnZC+tHYR0iYZVTQ4ExlZcSG8JhNt
 XlsOTVfdpp1MjZO+WBRG4bVZg0z5+upa78/P3Qzomir+VxUnKnrsfiuzq0UF8IbG
 UVXUzWSJsEl157V2DA3UIo3Kgenge+U3x2CwSGTmXA2ffzr+PjrpPA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m50uavd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 15:33:50 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 516EHAU4027902; Thu, 6 Feb 2025 15:33:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44j8p5yvuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 15:33:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqPIKZCphooIHiZ5cmCpMM+BAh0P6hqKBdgHqp9ZCxPN+lq30MW88SXS1tGEqu8xLIQ4X1VF6BOC9o9sPRGF07OUZDUXwS8PYDL/lrhd0jlC0ewuquOAG0bWa7/1YyEIryEMT0O4O1y/ycs7umYaba+R5ZTTnGgjraSvS8zI58JryfToyj5UXGOV7oEzfGgCgQZJJgPQbzb+FHcNPJ4iLrSc83PD1VXbrSHaIIp8XLw219zLhXB4NFyBuibIg9+4ceS5nLzqU6CsEKmKortD4HuYwtqcc+Tz5MmmjBZxyGQ6MD6YdL4eGIoZJWQXH32z77dg32YoTkrxGi7/L1/WhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aObSFrw1OWoRgwcPeX9KsauJhBapUFHT+saMzjeqznI=;
 b=vO0QJKCeKA6jEomJUHoJyC2Vl8TRGBSbTMyPsKt+3zO0VT0brsMLL5bVrNRUfXC/mI5wXVa6NR/0UQFbLy94UJsXBW/6LqOPbmSzwFrF2JNcPOp0omBzoNB4GBMzDffZgAff7esFNsKdsgODNGl0zAMW9jPqZl09wiTjmPmrhH08NVHsl29r/lYHCgKdunyN4oEkhPzwEhbCEbiGkV7q4RtaH9QcAw+RG5L4a9E+AFzbMJFzwjzgIj5yY+C4ZWk0JWxAzXZ1EFqIhzzf6/k62bW+jC1CnctfZF4MqJHka/xrBnfoHBMNIFoohkg6/kW/lCCLvDRbyn5Her2xDLU5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aObSFrw1OWoRgwcPeX9KsauJhBapUFHT+saMzjeqznI=;
 b=b+mGDFekOJxwmLrqtaFCK4Gwxth9S78wmLa35BlB7G69EpY/OEjMOgQpE4ruAbONmXg09OBJr24ia9PbKDbrzZ9UIx3LKKHfBwW0VL8gyGmg6v8MhYrFAPb6ku2t4oNy//LGVBX5QiWStQ+9Nlws9+uKwwxSdHQ3SIpKGaSbTD4=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA1PR10MB7417.namprd10.prod.outlook.com (2603:10b6:208:448::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 15:33:47 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 15:33:47 +0000
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
Subject: [PATCH v2 0/3] expose mapping wrprotect, fix fb_defio use
Date: Thu,  6 Feb 2025 15:33:18 +0000
Message-ID: <cover.1738855154.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::30) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA1PR10MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 7513ed1b-1027-44ad-e78b-08dd46c3a5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jVqCl6hP6+G28UwnqTqb9xK+5oCQl4RL6MAvAAwKBd2YIOKqdZsfUi+IiEFv?=
 =?us-ascii?Q?l6mxjC7sc0KNCtzvFdMkv8sEs+SE1ixq9ZL3GfbvqIiZkbcJ172QqmjufW01?=
 =?us-ascii?Q?3LAvsDypsYgECezHT3mCA14EvhdjM8vrz2y/PUmapYx6pdMji0xhD1EUXhD4?=
 =?us-ascii?Q?iK/M3Z2zZm41/5WEbXgjksJAQiX4nkPa/kfXw/YEy+RYdc662qwNu8zeQYHK?=
 =?us-ascii?Q?fCiB7TVNYBSiilNmfyFEeeD4qTe8ApoTzHyQXgf4t5ERB0gCDGY7YtlYGuQI?=
 =?us-ascii?Q?LuUGYrFoKycpvOKP6w77uvEexrH30f1bXTOpaa+WM2JSIQ6vcxz9M1Xbj9sA?=
 =?us-ascii?Q?YFJ3IWtj01GZ2SrVwzrKKW+npefNqkMqLqaQfR+AO5ZnapEnPMiy+oCphGHh?=
 =?us-ascii?Q?t4lromKNVvLfDFutp3ymq3F9OTOYdWBlFDhvZrOFLnG0+IXqvbHJZtyBkpWL?=
 =?us-ascii?Q?gpFpL5m2oE6FlUcatE3XseSby1NPVrw4NWFRZx7SQg0M+q+qyBSpFqg2l5TZ?=
 =?us-ascii?Q?5QzqCFq6WHiy9Ny3GNNWcJv7iDK1En0JPyGgdNwRJlKRp0BRk2jBB91PO3jc?=
 =?us-ascii?Q?ROJ1zVJZXePCSTgUop/04gGTVvj8AdrbYvYJ9dD4OIfONBRBA4ewfgBuvMuD?=
 =?us-ascii?Q?XnVWQFkgo+4sAseeFOhcj35xeKYaVWAoyplm9ap9pWlVg2SAoI3pmOCb7Z/W?=
 =?us-ascii?Q?favxTHpBMK05i6IFGdXkDWjZZ+Gg/XA231hYE1Ti6cwUQdno4vuOQX9nuvWc?=
 =?us-ascii?Q?hfm5azbeTiZOnA5xJoUFyjTlupcFw66SiaSbTuTkN+SB4lO43Xzwq69Mwoqk?=
 =?us-ascii?Q?cqXDNG7RlrSDxFsDpTYPHyqHiBa3nVbPqTD/83ll6pnahs1l0eVI3RUFRliy?=
 =?us-ascii?Q?RJVyYjG+cDWPnuViFndL21t+gRQizUuhRNAXUKQA7HAWG04X80NeKSpuhBfb?=
 =?us-ascii?Q?honGfmWsLgw8KQWvz9oI1VwacQe2/j03uo2lQFChedZAbWFFUbi0u+EZvqJx?=
 =?us-ascii?Q?3I8vMjVrcB7t1Qzen4HX9o8SE133YmJc/3sn+kquOmYEIvwbmt8hwn8WHhEs?=
 =?us-ascii?Q?z7lZKHkMBeQX0DMG56qslvDRn1eXlfZ5AmPeqcMCRhbOx+BpiaBjtworzPqi?=
 =?us-ascii?Q?65zdrSBHvQOaw1WEc5SOwqqvlSvF7pxJkeJuQKsVv/2gC0iwTVbktw1c+8DD?=
 =?us-ascii?Q?ITk4vufZ5SpaIWTSCDMzvssbJc/xrxGAXpNrsd1c5OT26u53UZDoAiD/gW4V?=
 =?us-ascii?Q?GWoHbh4Ye+C7BTM30tl0umhfTCSY4BDYluYL6jXzEmoe/Wr49EJZoWgDEaoa?=
 =?us-ascii?Q?6oOlzftwd7klhuPZnIxYHWbXjpQNSMyJPLCSsD001p9vnd+tUkUGMwP8ZyOc?=
 =?us-ascii?Q?x3P3puh++qfpFoJ/D89kSlYBzHvTnW/yXhCb+J0k/ai2Yxz6Hw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?exF6B1vOZH7MM8uFeAYZRZ/cbo3SlFPl9NuVPjaZOgxKWCYxQtPXZZpwcaoH?=
 =?us-ascii?Q?qlEsoT7FrQboQIAW5a2jftcN171y2mnxVPCflDIzUG9HBgOeoYuly8k0w9Yn?=
 =?us-ascii?Q?HXz4uQKckB6YQSP/cIPEFWx89xZ4qR1MU4rONGv+Z/1/dz9Ug968FwgNsj8+?=
 =?us-ascii?Q?H4i/3KnfYsMD+n4XJdMWFlXtexuUmScpwOVU1HAdwez9IYE/qImDfJGgDE64?=
 =?us-ascii?Q?TF53FKDj+4xHrvO3+PEedFBi5TZlJlGQBj4ZKt4XKGwsd0Zc+Nc/+ofawu6A?=
 =?us-ascii?Q?sTu0mvSvFoB0buzIhQTivekvCPZuFLRIPXOSuVeM+l44n9vXtqnUv/Fpnej/?=
 =?us-ascii?Q?mUFEEelu+4UMaGE2ld/x2gAGwv3Oa55WpTCE1dIfUMYS+cJcVNo7kmQlH3nu?=
 =?us-ascii?Q?ATDa+2lxbBbf/7P8HkR2Zzs1eglY3+wF3s7OgjntrxkajRNA3n4hiqIRnmzH?=
 =?us-ascii?Q?fGgcp26SBE0SgoFy7gz7NUpP1pefoMdfe70zHmrmzLA6BxJRrSKKLPhQyoPn?=
 =?us-ascii?Q?e+M4fmbYRrfKP71TcXCNY+NLVtsMzMd6YT8QZwC46E7mHl8b4077xCiP7ynC?=
 =?us-ascii?Q?JD0bEoZdmONCjYpkSyO4De136FToOdKWwQJmjYugX8giEvZhmb1AIfc9VNAS?=
 =?us-ascii?Q?x3ybq3D6dfVODUMpSyMg9qV1FDgPfb2uLYJvEXTMGd1E2MX/aFi5sWyvalQq?=
 =?us-ascii?Q?nrqzvBSUaTPLu3H06IWiY+X52ht7nbF+OB9J4iPNKYSUm6HmF89petzpl5Y5?=
 =?us-ascii?Q?62e/iZxFN4pnwmQoDQEd8reV2/ph65JWhPcmZPuW0M5EnXDBAhc3UFpz6xGV?=
 =?us-ascii?Q?mV3CJZqLBHm4s6MTimMFuaLlAf7SWlmS7BKVLd4ow9tK1+TNAIgaCQijXsNH?=
 =?us-ascii?Q?z6g0ifZhxVWO9WE2TweCBwufDOcE2jTZJsRb2aWkx5UA3rN5quTmAJRrI32h?=
 =?us-ascii?Q?UoP4hSrV5VoGBdO8+LBSUBxZKSZoY+dy96BaGpWgJKgCuzxQ8V4+GrMLEtdU?=
 =?us-ascii?Q?o9IQM+w80VvmrR5TPxJUNO7Uj/EfQvSD9ehUjzn3PC1FTyJP6DpSeMfMlfbI?=
 =?us-ascii?Q?CQKnNpU03XdihoUsyEJImxeVyx2KJmLQC576Xt0aQ9P/OXi8q1jBJIGx10JK?=
 =?us-ascii?Q?tJ1Tiy3iTzd76D7Yc0AXPrWnk0cQZz/R5pIpwCZJNS047VaySKM3LEvJu3Ag?=
 =?us-ascii?Q?hA+Ieh6CgTaDxZNNWI3mIExIFxCP19kMuwfa8hctO0I2rJQpER0FjZw0k/2F?=
 =?us-ascii?Q?qeQ7vF7imgmugBDdktCN628KKOIE6rzhPDYBIDoxElaBjwh7okjqQpfxSxfz?=
 =?us-ascii?Q?3AeItdUxj4bYTmyrHRBePEa9QmtyUwj6pIwQZvCinlZ/5LJoWUoNnFCvO5A5?=
 =?us-ascii?Q?QTOZNBR4G2vJk2Pk4bfW7fMhKUVO9IOFpLrReQyFtLHWc2pquV67Wv5XoQO5?=
 =?us-ascii?Q?KxzuxLqHpyHS1cSkp4fQ9JyMJOJszbM2yJDu6D9O6KfNDPek7OKcuGktQAG0?=
 =?us-ascii?Q?hNByBpmAqTnjwrGOmh5wlLh/DzqX3YAdoQKJtrErD9Oo1m/zIQPpN2WdqylB?=
 =?us-ascii?Q?O51fNO+XppnsX3bnLvmQYAMYPpaUbb7rRmwMVtCQyUmi+tmaCiIw2Whlt2ei?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: c8e4frX/QNRuhmVDvzj0pClvKzISNvjt/noajjHH0CO3/TzLXc2RjW85nHLkVHpLpRmyhgOCdm08vG5NWkql+26GOLYmBZAuBK6hv0oTI3hB1Lw0H/PKvIqE6c6rVZYO91zHB9M5VBU6NDpz6CgO8+/iwJI0yVRyFuzafZwTTpvjNCZm6O7u9IIBCa+K3p+QOYVSpDT89sBBszt9BVDzWUY5WJUGZHBt13wIXBs4P6HWnPGUGe8Rm9jGglYFib433SsHA+Way6y4vzR8Ddcop30XkeX3NHqENf0m9rgdaUCaqtg8Aey0Hkna1FC6YpU70Q1dE7KJyN4eKGiQ3ug/dPA+QEV8WnjVbysqyHcvZlmJ8jkZIut4SxO7jKpblU898FCnuLP5DITYbJXbpZjNqOAIU5+EVvJl91w/bM6gg/cVplPHn2L53ysYw0T4JbXlaz9cuqgxA46HEtVWn+GdWu8HYdtQF1pycDe8qFJtNz+gqNyF7ftfqxKdl+2cxVSI4h78FuAjKeBLXKFa1zLJ2OIb42OnuHYDB/4rFGFH3p74ahsMXt29ZVeIXQvbQKJMY+Olhan+btPrcVfU3/djhqfbMfh/y/wWV3ZE7GNAYFk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7513ed1b-1027-44ad-e78b-08dd46c3a5d8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:33:47.2938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bwr9ruTl0EDOfDzUT+UZbqNG1Fi2WJrk6YTtx3Q/E7DK9hbmItJOTQSDP+FiQsSIMtXE0mCLJOeA9Fi9Czef+nWjEsjNG4JGUuXcM9QjY2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7417
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060127
X-Proofpoint-GUID: S9sIAal1XuX9jidJ3_2ug7-EHtscNsSC
X-Proofpoint-ORIG-GUID: S9sIAal1XuX9jidJ3_2ug7-EHtscNsSC
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

 drivers/video/fbdev/core/Kconfig    |   1 +
 drivers/video/fbdev/core/fb_defio.c |  41 +++-----
 include/linux/fb.h                  |   1 +
 include/linux/rmap.h                |   3 +
 mm/rmap.c                           | 153 +++++++++++++++++++++++-----
 5 files changed, 145 insertions(+), 54 deletions(-)

--
2.48.1
