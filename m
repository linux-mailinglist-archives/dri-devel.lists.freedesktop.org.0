Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15849A0654A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 20:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C9C10E342;
	Wed,  8 Jan 2025 19:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="VOfBylCx";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JrHyygQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E0810E342
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 19:24:39 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508INJkk013794;
 Wed, 8 Jan 2025 19:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=yUAZ5OEOoJXVYQDJiv
 doZ/3cT2p0koQuFkDwlckOT04=; b=VOfBylCxnhXz/2MFXT8zjVRAC7o00siODb
 ceCZfW0BRMIKRXAdKO1aLsTLG2uzLpxUu5fdQXhuWjuu2ed/HCMuNjnD8QX9d2cZ
 Ryl8tZk8etUjl0xM9mNAQBFJkS+KAR/waJBZbDK7N5iqFlny+UoOIlNPwMbimlfL
 Jf9XaVD+kTTURoyfvFD0/ILxxW2UkmgYjyLDhasDUPTa62m5GmzR4ZoAUBBAjGMq
 Y1jFvBvkEZcMZ9fcU3SnKyr6j7Ab/3u8rnQ5it0w+LU+s8RVsxIdRuhIiBKNEIw6
 OmbvoZuyU8y2AdbphBMtXH+3e+wIfvYWvEhUfdugUIlDSjJSqOhQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xwhsqc9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 19:24:28 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 508Io682011240; Wed, 8 Jan 2025 19:24:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 43xue9yxkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 19:24:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuDJOt+QThvauU0cX+lpQBlGCax2oJB6cTaHzASmJfOIArN0gwXbyog9XaLt2Smd2ymkuA/DWl8n6xY7euszs1jURTq/6qcSLntXgf2BI3cUdhDKDGAewkbF7tB2qEuMigm/+GmkWPh+2KHvTWke3vLN9yiH3BkQivPDUfnK1RUgyDyDXYwnCHRYsdX2KtuBUY0lSj/S5cdn0OvRMhtoMb1lm4kjZRc85hfwyYvN8aqZF0l64LkpjW+VbxbWl9Wh7dDafNe1NTncmfF1xH+YPUmB0j3CocmIYEhvkdLS4pnMSEaUsYTfYrtrck35P677p19p2ZQ6sb97R9NmZlpvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUAZ5OEOoJXVYQDJivdoZ/3cT2p0koQuFkDwlckOT04=;
 b=IJnLbOWHz7NhZL1v29m2ns6soUYyXj05V0G4w2UsHJjcxoCLHE3NwZHdbdpduFNs4t6aFp4HaEDEgERbkKju5ckAFRADCsAB7/0VclruHSroR+jdgeCJ9SeTszYvQ18s8vOZD66ekDpflB66FI2r74PPofNnn/UNv7sAS9R2LOcCoMrWRo0rgBRuMl42c+99BLDbmPlJA5Fo+jTRm2OreNa29TEmAe42fCFIMdnq8R3yFghpzfr18bVx/zLvbvkRS1ZT0mNnFoXjehp+gv03o+Cu4qo0AGYSoOPODvCaKgzlOuVPiPTtWb0AJ4DNevQq65ECmpGX3fNC9EPfeYxc1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUAZ5OEOoJXVYQDJivdoZ/3cT2p0koQuFkDwlckOT04=;
 b=JrHyygQ3S15TLQFUS3UNiy7IO1cH9jX5STlNEU0YJ239/l6OtY84B/+b0BSooiSKpM1bVmtTT54UePhIYeEyrrTNFaWi9lQncyI6XLsQtc5ncs45mndHxrvM5qtPhd9rxWtqU0YeGA5pSi1QrVn5Ux7/ADTx1tRx6YI9c649zbQ=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CY8PR10MB6729.namprd10.prod.outlook.com (2603:10b6:930:94::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 19:23:39 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 19:23:39 +0000
Date: Wed, 8 Jan 2025 19:23:36 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH 1/3] mm: refactor rmap_walk_file() to separate out
 traversal logic
Message-ID: <0aefd0bb-7897-4a7c-af18-c2b95547f492@lucifer.local>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <0c53589f34a6195938eeb58c3a88594fa30cc90a.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z36qIbm82vMLW7w_@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z36qIbm82vMLW7w_@casper.infradead.org>
X-ClientProxiedBy: LO2P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::23) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CY8PR10MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: db9cdfd6-c412-41b3-8dfb-08dd3019f44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?43xTnCxl0YNtgZlkFnW1kCPOVI+pBvGQFbAVPsKwZE0NEkJtzz6SfOle6w1E?=
 =?us-ascii?Q?T4kMbpIG4RjZ6iIkXXNloVj+dlIpdwVwU8+90v+tBcOEqt5lemCpUWFT4ZpF?=
 =?us-ascii?Q?FwPxNFWKjmty5S2PXC0X26F8m6OAgYjZ5lJ7z8uewN2bcverbNN1v1N07VFX?=
 =?us-ascii?Q?9JvMiplKUnPRQ+GilT2585L9mCHp6wFvIdbXPb0ZpiJlWdG8whAFWrJ2yRtb?=
 =?us-ascii?Q?zvKRpZJNeXHVy7lprHRyVt4IzuuJchGswsXAXv1AawT1cQ6wwNl07Q2Tvg+b?=
 =?us-ascii?Q?0cpMixaL5TR5jIzhkEHwJJcuKRw/aPT0mAipTGDI1FLe1tDCzW1nXG2kEAuI?=
 =?us-ascii?Q?qYmu2sbRJFsXXBXwlzwmnXiclzdgsnBaefAg259uOc3T1ql9wiX5Kwhkl7xo?=
 =?us-ascii?Q?N8nU/xpN/GTSvG+bw15R6xRcXKhnrCtFRdtMAAbLCgMv0JcjSRxVOPiFtsB4?=
 =?us-ascii?Q?C93hWCmLwp0e+OdIqPgy1hvyUqWA5GvHA2YcTzMXtkXCQdJOMs5jW+zwrSBK?=
 =?us-ascii?Q?ZSv71pWlsYdvQhf64t2bN/RffJ1rffmSbn0r1+zd0u8mnepJVKFRAFB/ZXNe?=
 =?us-ascii?Q?dFlhJiXeX75xSuMFIUvz+VmsfUDpOnyRk/dQh3fGwhWtLTogBKZj4DJDp7qr?=
 =?us-ascii?Q?2oa7pr2K23hfXbhtEGcvFg4j0WLDJyJhYY0J4wBy5p07NzeNrOuLsyZrHT2c?=
 =?us-ascii?Q?x8hifhmcxJU8tzjOPKN4nYu4k1oQWmsXRYAbyqo4V6wEK3zjv3/7vYR7jlvf?=
 =?us-ascii?Q?mndehvWqZfjFjHxBaHxATkMLLk7f3Lu9rSxGuM9CVinlz0A23Fj++n2vGRDh?=
 =?us-ascii?Q?qlulIMTgddU4pdK8yUwfzI8FriKXm0BirW6SBVx1nscMTgKkQfYgRDHFH0aj?=
 =?us-ascii?Q?7+CP/VPlgojor/3EuEHmuwMcAPQErIMInw45a6dZy1mQsxrH/rAVnh1Hsqvf?=
 =?us-ascii?Q?wwexzrcR44b4s/c40shcizwH1s60nK2yEtylvTNz+nB6ZOIcJqIFeTidkQs8?=
 =?us-ascii?Q?0J1I4DOC2VSGEiLHhjW7PwtTkJcInPDqeQ1k+qOWt/hrf9JJowiBIvnzfkjv?=
 =?us-ascii?Q?KepDYcQ4wxHm9jBDhZPo2TdAFG7pSiZ6FIIyRMDNthHtJlSNyADeX3Asr+1k?=
 =?us-ascii?Q?EBqacMj4AOCWP+SiYt3dtX98qyw2NAgrtLxXo6WJ1YRYVFXd3qMM/FZQAg7Z?=
 =?us-ascii?Q?GkPjptr1WcuGqrkiiDc48Hcx+4P4BsMNsr6nm7t1vypjq35MJP/7Z9a1rolR?=
 =?us-ascii?Q?dA5i05EmxSmKcBFQ8FlpGgW9YIyIQwsyHSFEpuNrEpZ2cxdKiCmKLLdPnvXr?=
 =?us-ascii?Q?b/jDqex0IsuJiyW9MViBcsnVzaJL3iEzz/bswJopnFroOJksgLMcEQQMBpyF?=
 =?us-ascii?Q?pgW/U65jIus9J0pHIpu1lG2t0BLv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zRoFPFkgyf7E54RbUe4jB037F0P2004nuJAbxJ6ALHepXu6IAh4N8YBFKHqt?=
 =?us-ascii?Q?QuHHSQ7bWSZFvldJMBYvEL/4fBYnefKGulRS7zSC7ihSGlA+ix2Jj4x/fflt?=
 =?us-ascii?Q?o/Hu3m+IZHXxet6dAVmyGTPVJisTOQaO1ZDwm/gy7uEeAK5dpf17eIMGzQhy?=
 =?us-ascii?Q?HsMxW7SBYyT/K92BA4AQAWtghm1XdmiUXUv4RDZXTduiLodkhRcRcRQiw8Dt?=
 =?us-ascii?Q?emmQp2fDtvpv8RglKm5d4Q80MS84HOTq77n13br5WBVszL3goiabX02oqEUd?=
 =?us-ascii?Q?ebMXI7bwZbmPW05SAnshGgZYWsMg3PEGRBbIt9+n/5ugxxJmZLGNVSS0+zSR?=
 =?us-ascii?Q?TOfl+KoiOhjwUa3xQL2zuuVQZByTpZAcWQqq/HflkHshs9L7GFbveorceq8z?=
 =?us-ascii?Q?+dL1w2MomrL18uSHa7deyrjt3k6jg5Ak0AX1fgAKX+9aAoOXv65/lbpvKpa9?=
 =?us-ascii?Q?aozmCBSjOfUuLWi8bb1weaCZwZLwFkkSQitPAkK1IRR+GstCdV8rg/mng/AU?=
 =?us-ascii?Q?ZNshED6Pb0VR/wSojHv6EppwpGQg9ngIgahd4UyKCKmFIbH0ImEjTtsidzPA?=
 =?us-ascii?Q?/+wJpRLYBcMEZ9+Q0/YlU9kyBGjnEeaqq4CnUynvDhGsL/gi+QrXvAftaHGB?=
 =?us-ascii?Q?i1o19HBXWq97CufZlFc7ocacuwMPYn+7c68F21rDDATJb3qchFVSpPN+I61I?=
 =?us-ascii?Q?CCjxtmrOB35PonNyRyqKT+0XMlankCstcczRtJ0jL0HpOhs4rk6K2n85xo8c?=
 =?us-ascii?Q?pah8MYzcCAi2+3ec6VbWvyGZ1QfanLO2wxdYJQ/xLvmS5/Ktq4QeL/lsK4yt?=
 =?us-ascii?Q?FiJFkORnr2z4fZ/vvm1tj9oR2D2KKz/vUoRhLAaTHM521oDufh7gXdHOrFXD?=
 =?us-ascii?Q?nvOA5eryW4vuO4h6ySqOp0ecn4xxDJPIjNOFQr+5Vhqr0pUv7zZuY2He8esB?=
 =?us-ascii?Q?D5YcH6des46JuSxN3xLZP38ON7Pr9iVPwRR6FJBEG2ApP/3aZphSVl3j9h/2?=
 =?us-ascii?Q?CbI1Fb+hSIQhAv1SPEuQfMUsqDtUvZtFwgFnlFO4iIIHJm55+PSYeyDjJkbr?=
 =?us-ascii?Q?KD8ogWyrXoGh4pm5SHtP5fWPl8v79w+qX/IhkB3xku7DUJzQxe/m6F5N+/zk?=
 =?us-ascii?Q?rMoH4LdTk/0YmsaqHIFaCNpUfzzbW7j/hAjIZR3hmG0treYY6UfmpECI/HBv?=
 =?us-ascii?Q?Wb65SWFuFOfnfisXBfLYf5Mv3U9BzcYZH8MkZyogCes0Ati5NcfuMvpTscB1?=
 =?us-ascii?Q?apqNim7/vKQbYTuYCJ3OeDlNqwYZrqgsmtBXBQ77q98khtSP7MDdBD5sSoP+?=
 =?us-ascii?Q?e9KaYmYkyoOI3FzQ/V3GCJKB/70vWcILhPEEGy1mluBnQKi+kheIiBGtUjPf?=
 =?us-ascii?Q?bf1EjIb8PUFnuK3C2OI+RW2VAZlZ8793mana6CUjdl6EGKseGWzb7UR0wWh0?=
 =?us-ascii?Q?uTBQyh54i/YkLsPhk33ILiCP55CSU4R7dk21674iK0V7QiKjmpljHqOh7Z+/?=
 =?us-ascii?Q?ZmAlTPiKEVN4ox7JhRrg+Awhng1g1EkpV6RV/Jo+lXNAi2yNyM4as/xB5fnX?=
 =?us-ascii?Q?6kAxUD74tg6f8rz+EnvI+KqC/5yfsXZ1DRlnvGXSl1Kj5skpsnI5PPQtbji2?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: y1zfhuYaTbofXXUH+Vpj7El8XZ10JDnS7qve6Q4/7q+g29YMX04ALybseOGz/pyT8cMHQmj+ohIXfeGfHt8x9bZ38PE7OOvlwBrz6GUePi5/h+p+lDecpR4eDecyXD1LaOCyFE33zggXsnmR0tuSEFbYhfND5MxBI6vUr4pXZCHJRLEMP56VubxDDgJzuEBHDfMt+c9Sc/t5/GS32bswSfq26YZ1+P5VfhJR4IbqXuLkxjut2TN6ZEziWResrzsa/ifJrVwwUaXDk/3CC+LPYFBwl6/cgVmfs/urzh5brCiyaA0CbggbeiXLsTnY3SEClzqJfv+mpHRVmuDOdCVavV6TDRomElnbCMTh5EA5ghK++7DSojmcuVEsW/+bmhmssI64j+bnBMGwWemJA+gX402EnKpJNtm32BV6+4ZmQlmFbu8NIw4dxdzOl2REWifmCEMhJkRnJRhms5G/Cf2G+ntfPdWnVUiPAEw9fZbdkdk+rfrxmak/HVJnLTGK49fK4m4sTdpeFSlQGS6HcOjDMefRamanVVQWGif00nG4tOeQjkq+rB/3ikWtsVbs0u/Ad3gMJUA2hhHEAjmnVjl1QPSy35ZSTKuVVSNgZo/I2IQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db9cdfd6-c412-41b3-8dfb-08dd3019f44a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 19:23:38.9837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcqOUuQRzNJ839JRF4gkeAVUxjHVrfFNtsJZ2S8Q0X5IhvXqnt2mzwX1RVHMGskYaDFsQuxJub2uT3GrvRUqVWXmkUv4vZbDk6Scqtnx7zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6729
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_05,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080159
X-Proofpoint-GUID: DU5LXjHg2_EAvEUfZgtBhtvPocUFeUzH
X-Proofpoint-ORIG-GUID: DU5LXjHg2_EAvEUfZgtBhtvPocUFeUzH
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

On Wed, Jan 08, 2025 at 04:38:57PM +0000, Matthew Wilcox wrote:
> On Wed, Jan 08, 2025 at 04:18:40PM +0000, Lorenzo Stoakes wrote:
> > +/*
> > + * rmap_walk_file - do something to file page using the object-based rmap method
> > + * @folio: the folio to be handled
> > + * @rwc: control variable according to each walk type
> > + * @locked: caller holds relevant rmap lock
> > + *
> > + * Find all the mappings of a folio using the mapping pointer and the vma chains
> > + * contained in the address_space struct it points to.
> > + */
> > +static void rmap_walk_file(struct folio *folio,
> > +		struct rmap_walk_control *rwc, bool locked)
> > +{
> > +	struct address_space *mapping = folio_mapping(folio);
>
> I'm unconvinced this shouldn't be just folio->mapping.  On the face of
> it, we're saying that we're walking a file, and file folios just want
> to use folio->mapping.  But let's dig a little deeper.
>
> The folio passed in is locked, so it can't be changed during this call.
> In folio_mapping(), folio_test_slab() is guaranteed untrue.
> folio_test_swapcache() doesn't seem likely to be true either; unless
> it's shmem, it can't be in the swapcache, and if it's shmem and in the
> swap cache, it can't be mapped to userspace (they're swizzled back from
> the swapcache to the pagecache before being mapped).  And then the
> check for PAGE_MAPPING_FLAGS is guaranteed to be untrue (we know it's
> not anon/ksm/movable).  So I think this should just be folio->mapping.

Ack, and we assert that it is indeed locked first. We will have checked
that this is not anon, and with the lock we shouldn't see it disappear
under us to be slab, we have also explicitly checked for ksm so that's out.

Wasn't aware of that swizzling actually... good to know! But I guess that
makes sense since you'd hit a swap entry in the fault code and trigger all
that fun stuff (hm let me go read the swap chapter in my book again :P)

TL;DR - will change. But will add a comment saying we can do it safely.

>
> > +	/*
> > +	 * The page lock not only makes sure that page->mapping cannot
> > +	 * suddenly be NULLified by truncation, it makes sure that the
> > +	 * structure at mapping cannot be freed and reused yet,
> > +	 * so we can safely take mapping->i_mmap_rwsem.
> > +	 */
>
> I know you only moved this comment, but please fix it to refer to
> folios, not pages.

Ack will do.

>
> > +	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
> > +
> > +	if (!mapping)
> > +		return;
>
> Maybe make this a WARN_ON_ONCE?

I'm not sure if this isn't actually a vaguely possible scenario? Though
hm. I'm not 100% certain it's  not expected to happen _sometimes_.

Perhaps one to do as a follow up in case it turns out this is sometimes
expected due to timing issues with a truncate?

But I may be wrong and this should demonstrably not happen other than in
case of programmatic error?

>
> > +	__rmap_walk_file(folio, mapping, folio_pgoff(folio),
> > +			 folio_nr_pages(folio), rwc, locked);
>
> folio_pgoff() can go too.  Just use folio->index.
>

Ack. Will change.
