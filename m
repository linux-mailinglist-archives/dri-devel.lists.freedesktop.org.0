Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35090A2D70C
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 16:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEE110E0D1;
	Sat,  8 Feb 2025 15:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="d183eTQ0";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Go3OYt/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5526010E0F4
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 15:53:54 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518Fo2xM012750;
 Sat, 8 Feb 2025 15:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=Qz2tJ6Y8g1ITAcPb+YReg9cPxjZeEzkUNtQR3zXbQ4s=; b=
 d183eTQ0vJHKuThkEPHkMQOTXXnnpb+QA0Ca5oWuYVwoftHmceslIO/DTps9nbNo
 KRVC0/XZhGEhsKbonE2ZN9E51dkZ1lTJquCOXI0mKWMFgHz6B6fLgLLHFDmnQFII
 xX21TYT7B3sovzIfVsE4f9BhbhaXQta3PVezXFIKXJj1K+V+sfV3fanzVwElEKjo
 nlnc7askfHnzMgQzny0aPXV6pAdMiyjVSNkGPJCd+1DKTv6hFinPBzNqMCki9TPX
 T8D259bY9zlrdY1VpmueSuzCUbPSS0NoMh48v3KZZ8aokcVbkYWA+S8FLQR9Xh3j
 e+xvkMZKFxM55jRWvwUlYQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0qa8b6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 15:53:29 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 518B4WXG037888; Sat, 8 Feb 2025 15:53:28 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44p62vc2dc-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Feb 2025 15:53:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrYmyWYCxohURJmR3VJADRtD9xh3iaz2sOyr8BB9vKCHoeQ3zlV8heMUYT7m9ssbm/xZUgwwIrvWY307mD8eDBlMFK9i8kaZBcq7bbZvVJ5KB6rfo/Sb+9lZBQ7x3CMn1lg3TJmouP4hR/w2aLE+n+D+6pODMRq/52sUEmfAIEanyH0bPLu7NC5s8eh3j97D+RsmzHMYaqpwn60MX1FwlxrdaeNVjyiYUrGWA2KTx/PaFq7hjXvmBU6EpIjFv4yXfv1lkmPhBEoFBwEJUMuh8aTw+V3cGNOJQk80nmxX7xID2EQLH7a/e5+ekgkAUcLWWfKyF8C9/Pd5xN1VAliunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz2tJ6Y8g1ITAcPb+YReg9cPxjZeEzkUNtQR3zXbQ4s=;
 b=yehkVCE/CCcFB9r5YdDBsmgtFoeWSTtoNqzXYJyRZTOkfDs4jzSSq0x3DF67U47tN0+qZf4k8chO5g/n1Q2fgYLIPSuTcl24c+HeJsJDiRJW3WOB0LQffeCYQhfkhjcwBv44uxn/rNn2F+xHfJcY5Jp6sr1WvniUlLCj9A5P9Xq6qQE58PHN3x3Sx0e07+MRpfn66QAmCAPvzqZ2jXUgAO6jOY3k73g5/lyxLk3OUXjXdfzJnEXkXnlYVvCsCBDVaNZG3YcPshAV367/pkwJOvyVuQ55FldJqNZsJMtyi+Ee58wv72W1nfUvIghQx14h6pG4nDgT4L9xJep1YfNMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz2tJ6Y8g1ITAcPb+YReg9cPxjZeEzkUNtQR3zXbQ4s=;
 b=Go3OYt/hrM6raviJZnwBLrmITAQGnTffUZ+8fWEMXpVJCXhHS9UJwDhFkHtrPyeNVTugkSsb/Ga1LmbpuWdHdDFJUmjLhduNRC9tV7NzMFmZnW8qMCC9atlO67gXsjUYQZpOeJiOfH5gAPprWr9CnXWOoQLrNnaTh3nHsgFpYKk=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Sat, 8 Feb
 2025 15:53:14 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Sat, 8 Feb 2025
 15:53:14 +0000
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
Subject: [PATCH v3 2/3] mm: provide mapping_wrprotect_range() function
Date: Sat,  8 Feb 2025 15:52:55 +0000
Message-ID: <e5bf969d64e7f2f2ae944d42341fc8994b736a81.1739029358.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739029358.git.lorenzo.stoakes@oracle.com>
References: <cover.1739029358.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0037.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::25)
 To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 354f6022-4b73-42be-e447-08dd4858b27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ylJnym0YCQsyd7yA1WqI+q0OL0R55XY6NEQkblGsbbRf2YMBO1cS/sqJacSI?=
 =?us-ascii?Q?htfUT5ETLfa5DTyYKnprg4LKbI70XtWNSWz6GBX+3yQEV49reLysfFyDduxe?=
 =?us-ascii?Q?EjvQHzgl5Lc9MEt7WbXNdVGVyKhgfbRS4OSML+pn6PxkYILOK4NmzT2z0G7L?=
 =?us-ascii?Q?k2B2zyee1LV5DQu9uc/2Xl8SD43f8hBapgKKzIJcFusqbfJgrKAiX9fIG9PT?=
 =?us-ascii?Q?6k5IBNl//BTHLBy5nvt+IF+zwjBtYK3D7yYwu4WGRZWU3vN7n34dkwW7DDof?=
 =?us-ascii?Q?ef4l9nG8CzmsCQA40SUkRpooqQx6A52RHeuHGln+hNOSFGqdHdRO7QT5lrfj?=
 =?us-ascii?Q?YaEvwgyIIPekN5InebY5c3LhGApVLmMh0erlvVdwjaGCt5b9JJOYSwN+Z53P?=
 =?us-ascii?Q?d5nw0hK2ERWtMdEBi7mgh5LtcXY1NhkG4bQU25Cbbn3q0ALZKslfZvKDZXzf?=
 =?us-ascii?Q?JOXHJbdYgq9Kw6NUV8oDi0HvVkLLHm5ijtT2n9+zd+otcDHUDEcNsUWqkf3p?=
 =?us-ascii?Q?2bz+yOhYdWQUnWOFxsvCdb3LuzWI0zZ9/3eIh3KvA8w/ByBN5XIWyvEVz4PT?=
 =?us-ascii?Q?mQ2doyZ9gdF0FPw7Hf6tpZZGAdHEVCP4AXPegRPS1RuaS7pG2i6VHjT6PDjC?=
 =?us-ascii?Q?POhnocGBFzbBKkqxNf6As301hR5ESJiipTQzpU9SxRnt2HhW6gXPnC8IyQKE?=
 =?us-ascii?Q?LZoZ5bStlxtQcQ2noFQXm9m1EvbveP1cCsCNMoOrWTTSavYO6+lJxBh3i02v?=
 =?us-ascii?Q?ELJ96OKrbvnAcX3t88O5WZ26Ft0GUo/XJPaC6MX9oAkG45aVixm66MBmioJC?=
 =?us-ascii?Q?k6mo+jFEp4zvmrC7fT/D0pcQomChsJnKxzDPhG+wom3VZlxLyTarIvybH/z1?=
 =?us-ascii?Q?MufFlqHbaOYW0F7zzgmNSifxEHwg/2R6qxdeWyVUecMWA7u0hbKnFjeXd58w?=
 =?us-ascii?Q?q46UY3tSjExpHaALfS0wNtbwzlQYjWm0/niy6OQLsgrC++ZDVCK8ZFF0MSe2?=
 =?us-ascii?Q?mdS7jQG4KabfVvqnEE3haAz5sLk3tXRhImDfgeX1ZvsPqWCw5SJLyRcGYLp4?=
 =?us-ascii?Q?Pp1zYgUvQY4bnVEb6a4SdDuaVPl35EOIpTeM6g8tXi3ZqhEm3KwTTHUn3LRd?=
 =?us-ascii?Q?q0n2tHVpDPQPq/WTJLw8o5GIzhEirWYXaSCrwK0hBU0uMbUYaF/Z7IhLl2NN?=
 =?us-ascii?Q?sMrItQcjZFMY2xcSwDDYFdWzTvT8gWNp0VGXMS1fLrwoaR2tLEpYYWWaVPDp?=
 =?us-ascii?Q?fcS9Kdk7Sj8ee0YV+sbkfdMbgvokJV7zdyj9Ei/+TOSM+MmYp0Usepo3jskz?=
 =?us-ascii?Q?3lhrZ/NLqMpxk/F34CZETbY+QW6VmRqewUXMuub0Hujf2HY2lHJ2a3I3LCC/?=
 =?us-ascii?Q?lFYqpqgUczvxa5FbAeR9wUf9hu39?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8VbWZvDfem7I8QHNgdCQqUiTDMPFL1QadtLpXV/oxhH2YSmJeQrk4lTQPix4?=
 =?us-ascii?Q?cGwpVcVzErbVFFb78/BuNdUjStWc2qDSjacdnd/JfTmG8yUiADm1pLLdtV9y?=
 =?us-ascii?Q?uF8tOas6w60mpV0tn/mDTqTqBcx76ueW1LxgRYDpLr97RgZG8F4rc24BEHN1?=
 =?us-ascii?Q?sdxO/fuPvO4BiEaoeqb2POaWZs2gWBB+P6YqrYi9/JDaQ36FDPbKM1g1YP1F?=
 =?us-ascii?Q?+8KjojnBicHS1zn/pxf13wycIdAQe+egLJ5MthZTs/JIfslNWR62nWZjvwwa?=
 =?us-ascii?Q?YMKow5AQD281EITsjzPZbFbSl2vtVxAWDyljK3R8f3eUFUil4esKRn+574L0?=
 =?us-ascii?Q?e2qR5ZUHN5H/btxIeFl6eiuuLQXMEQTGRq1g9Axh3qkrjNtXMafTWIPXW0nD?=
 =?us-ascii?Q?bsWSOPWOrdLN6VJBZxpXtOrxU00fV8n7gUgIgmY1NrvPRm1ydFaXEad0BWYA?=
 =?us-ascii?Q?5pMFD+DiY3tScl+XLeqobNA+O++zOhw1L/ErEhofR3O0iYriYUGC3PxSTgw+?=
 =?us-ascii?Q?2jSfoe2gswn08Hh5zMIsI6V94H1SfOLB4G1uTUjfIneqw4mB3naKGOzR1lk/?=
 =?us-ascii?Q?M+1F4lSawsRLUBDEKpqN0Hui3DRp08KU8DlfjFg54c+ArRAubKUMY1APSmZg?=
 =?us-ascii?Q?9bgrPABg5PW5LMRGStkGp28VgknqnewMSYDycBgEXlEgcPKQ3D8/U2n+kLol?=
 =?us-ascii?Q?sXIkgsM4RFQVMeBfkkrPodma6hBlunPaDpmOAuNv118hj6D9kfu1XKv1Om+x?=
 =?us-ascii?Q?B21kwP2GzDNtrY0A38g4cFzESHeGRY/1GmHBBQKOz7XJmDwN9ZU7cY2Vo+Ty?=
 =?us-ascii?Q?Irc8uem1ss/O5NVVHIOdvIfBPiB3VfVIrlZZgA8YjNxhvRkP/fX/3KMYwpIT?=
 =?us-ascii?Q?dgdELO9QSVFRzm4xSiP6w4h30aXCFs4uGHqAG5c8LYTXcqMPdecKwELJS9es?=
 =?us-ascii?Q?eMIfvk3lAcy//+WPS4g0XuVx7hzGlNreD1dbjgv9UEIbWfMIOuCch/EZelHl?=
 =?us-ascii?Q?g87+Is2mriq2elKpy5bY09gFQ6+2+oOsy2Tt2z/E9wNvzA3mtVVaJnBvkas+?=
 =?us-ascii?Q?XkMFbkJ6PlBTOdy29Vunz93DlMsMBRBoPr/BpLBcAVDSDhG1CdYb/tlfcIv3?=
 =?us-ascii?Q?L00P6ywYPQCMXrqkvT8PpGxy99Tvld6R83j4ZZou1WQKZbRYQQgBBL0WjS1p?=
 =?us-ascii?Q?QzCtkS12QM72CFUr868iFpy3HR/zTB25Syzu6ZYhnKP9a4REIYeDsqePpvUr?=
 =?us-ascii?Q?GOtEIPK5TCmPVwYWgV0AsAYBPsZSPXCjQ8BFWP2nLXMwFldxhepvvgbkqcyj?=
 =?us-ascii?Q?G1sRKre77FC0ZUVQH4JAJOE8Yov9j1tNpHSTaLmI4p+od+BKICcX4ifdUk7v?=
 =?us-ascii?Q?kGu4XKzQpbyitkWLAhDI0AieWglIhz+wUJ8sXtCXgby85wi1R1o4uWaTxE0C?=
 =?us-ascii?Q?9o0KzuRJBAURb4WAvw0utnYlsXNgg3DkDJBQ7uIkpSdSvZcD02SlMfrgSrse?=
 =?us-ascii?Q?U3uj2bFET4w+pzMcf3mCDJN/ArJsmjtmPn8Kcfp9TR2TZJtljnWf5O2Hh/RA?=
 =?us-ascii?Q?3haDdATc0bI7o93ZiKkQG+trPt2AqJhVRvVzJLV5Qt5M41rGiylP8XiV/RGW?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qY/C9zOcXJ83xo89a5MHyDDxh5vDtEnV269BJGZ2Ao1DatoQ+qF7OQFDmpS4phUYsZEUky11A3B6/os45ybo0Cg41wm+lspzdo8dfHBDgiOdAyVqOWJXrU3QjWPjpumw+09WVBK8ypOFEYA7vTwe7nCHDg6NHbUBSIGyULMQJQNnVRUnoBiOIMOHtTk25F7nUjmcW5oyT0z7J1COCZAjbIv18Q86GIgak/gRSCIMPvDIZY+nu/uNQZH3LQZ8l7t/ThvlFLeEAMT8zgKjIbZY1gA2U+to773lbUtHFLaIvQ78OXT/TPgjCFKq4pCgF4SyZXFBc0OR1w95rzSEkH0j+93Igxr8t8pJZYrO8TURmmzNkYWpQxuHqKN2qaZDTPquMJYUkQ6WnyAC+UmoIvgo+S+qkjtwB8CHo/zGU7JjjpzrNEenmJd9x8S5qr/xBxlRYqZuB1LVPeUCYhZs3AnudlHT5L5n2UaGYzu7osyeZBLmWhEFe4nrFm6vIa0Miv3xsPR6ev2vv/m0wBTKMWNwTZsEDnPjmO4+fv18iuQAsBeacT4tWB6DMM6fT4vH384qYRJCwqOjrfxDvXnERc2eLooEP2DcztE2A2dzcH1Yl0Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354f6022-4b73-42be-e447-08dd4858b27c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 15:53:14.6557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XALPqy6exCq+ZE2w3rCSLxlgJtOW6gCaaJeY7+10jftAgE32wGlfCh+gT5/3VanuLQ23Un2EiaXVls3KNVK2gDtXlsa0XpWCVQUWYiUKlTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080134
X-Proofpoint-GUID: nCA9nG1NUE3Savxs5cP299wdpRzhO7ut
X-Proofpoint-ORIG-GUID: nCA9nG1NUE3Savxs5cP299wdpRzhO7ut
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

