Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C553A2576E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 11:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CC010E46F;
	Mon,  3 Feb 2025 10:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Lw7KGE1X";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0RWG2W+p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E50A10E46F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 10:54:48 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5138NUfH030672;
 Mon, 3 Feb 2025 10:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=nfneLl2ykzYBsrupxd
 5cIuVNL0K+1ecg7H+0SZHk2Yo=; b=Lw7KGE1XgZ75mGNn84zSQv4vcpz6YIs/5r
 S51rEeUGahbT3T5iWdDbOOI/BMz+7ltRi/Yxp5xUD99lES4PoNJWIJcTbvqc2c7E
 +eAuhUF7dsS8Z9EATxLcKq5vjdhR2if2bnDyU29qCbMw1HWxrCa3Tbp7mNagLb6w
 qIgxtH0t6wQqLq874jr+8nMRVDddHxG5PGVsqBtOEFFvk5TZWcF4M0LochMDRfnv
 ebL7D4mDmipEP9Uaiq/Y55q65g9+OvOYwrHYdPieWKzsYtzwWSagJIGoAVqI/lx+
 cAq3RpApneSfCQbAh07ViieqsQdZcsvv+ZPYCFDiuWlVQWFv1kKA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hh73j0qh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Feb 2025 10:54:33 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5139oUc5037627; Mon, 3 Feb 2025 10:54:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44j8gffxdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Feb 2025 10:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rys05cm73ryYzXLeMqCBH6C3u8KLDqrGilsBsi4+2SlkCDebipvo7Xyry0cT4hHfgcC/nChIpciet8hMkHtHX+Qn2Rkqco7BgQS4k1C6dDvDDAh1I0sRf2Rc+to/kJOBeB61l+3dORRZxwIMyGIk4PcF8ATVB9PATYxEykiaHMgnOZK9sAX00Ycq0BxmRsPKOdVJ94baNjmN+6G/iD/vm7kGLYQVfzGG8LPyWYD80mAOTe5SqNCMz+YclKg/RvMPPlqXMcnKkPhH6kZOO4K3oEnyhX/Xvsc0NkJ1CbhMeWlEk+4T9cmuxkH0Da41oqNslj499nWLvw1fC7RT/9IaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfneLl2ykzYBsrupxd5cIuVNL0K+1ecg7H+0SZHk2Yo=;
 b=Mwukoe7uLQvC5JsmpHZSpSnkHZS1At5l0Bn+8tggSMxgHv9kday9PhEpHvPm1zXS3XkRMM4OQaNq5hQkIIKGT5jE81IjcGrtuN0mQCNdIrUxeJ2N1He9tUoVo4sUSEn3aCfU/+fYOjus0fm7RBvwu4H0/k7icNJlpE22kVSJUck0eovaSdGekykAUCvXpyyfKQ6cog4jsGdMSLENj4AQkJEbJshC0dSOpkG+fPsL9FB9bZfIDRhgQMwG6lSB76oVd5jrnIPvBOFbC6UvCge8iGrt4p1FJpRT8eTddiL0AxI4H/NLi2wFw/0cj0i4OC7jo7tq/V4JYUylbWzM7Og26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfneLl2ykzYBsrupxd5cIuVNL0K+1ecg7H+0SZHk2Yo=;
 b=0RWG2W+pbXc+BlPmYE6veq85YcnCxQe6G4UPFjlYtSWQAjdJWzzA7XR2pgRZ621aMV9Dz7qDM8m8iDI/JHggG/07Q/+2VdImzmvMfa8C/2MKMF4txYqaiXoGbsoO+9vg7yRZ28X2El+/NaJTtGk1GjJ4CA2UUsUczfnEaOwbsPw=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA1PR10MB6170.namprd10.prod.outlook.com (2603:10b6:208:3a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 10:54:30 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 10:54:29 +0000
Date: Mon, 3 Feb 2025 10:54:26 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v2 0/3] expose mapping wrprotect, fix fb_defio use
Message-ID: <1f431d3f-7572-4c71-85d3-78721ee2156f@lucifer.local>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
 <b284f594-2b28-4c1b-b00e-2fe7e9036b2f@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b284f594-2b28-4c1b-b00e-2fe7e9036b2f@suse.de>
X-ClientProxiedBy: LNXP265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::26) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA1PR10MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ddfb634-fb66-4c6c-e74a-08dd44412216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iykj1otqKOK8Vs1lvOpzOk29WEs8ju4uFyIQXUmLmEVSvljH9nnpVNz24xdm?=
 =?us-ascii?Q?RB4DZ1kj5Szllih3N9DoHvcAJXelvsi96xTQ5IaBk6DomUamri+gx6x2E6sv?=
 =?us-ascii?Q?SsDBDcWPZcfdLU9nexN1PnSsB3/3uLH6Q4rKBuUpxGc3LiZzsEtzyLY8mECh?=
 =?us-ascii?Q?2Xm6fp66xSnhMWPLxdEdrDsGHsFbdLaje+ltgHhDse7JrwjDx3u5/IzzKHN6?=
 =?us-ascii?Q?LB3H7h2nhxhF8rkMeJ+Fs3HzII9YDnEchVdTshGtK2GSN1VmIfilnF2pKCoE?=
 =?us-ascii?Q?yBPZWEYJ96vD1kTX3GEU8qSXnglcb59wfwvvfkJwRasxBXkb9n2oT5PW+M6b?=
 =?us-ascii?Q?4ZhtJZdcPiFq1XBewtKi7AcxUgsWohaQLKOpsN+C47Eyy8stiNNA2aDMG1ly?=
 =?us-ascii?Q?JzTaPiOuGvNKQy1uuOwNoAX0fLf1hrUYhYNJaJwrG60+svnjRqO3OPELu3M8?=
 =?us-ascii?Q?NqjPAXuS7VwpWeNhYpxu3rCiNsA1VsDfpRtPK7Vgr/KX1aIF+YsxVUo27izB?=
 =?us-ascii?Q?726uE412Ik3ZMKUK4U1k95d1tkPwH1F9i21Fj5msxT7eon+upuQlAOZz1S+G?=
 =?us-ascii?Q?50dj/9cOCf+2JS2s6jOJIffB9e1B74NgwN7Px0nYK5VFWpGHUno5GV1bccGU?=
 =?us-ascii?Q?E8gpuUYnJVEfWW26ZzfFcheNeCjjBmo24hTRGPD6Mmk/zUVmd51g5SSqI9ET?=
 =?us-ascii?Q?q68Zf5kdZk86wbywjy7DiTjspUv3V4xgnN2pMTDNhAHAD/DAG8KyLYsjGo4n?=
 =?us-ascii?Q?w4bYST/gW+FfaAXDdbFNGhTWC8o8e6jgwIwV3OunL7zXiNtVkm80AbpBfe06?=
 =?us-ascii?Q?dm2RGGQkTAClIP0WOwXV8g1DwPcJGR9GNcaTCIlk3QWucDYwMOYqkQlcCtsd?=
 =?us-ascii?Q?cv6nCoUJRN0cUit5zCAqKXlZpLrP04w5JyiCbkf8OU5k1xTuL8dZYJruO3xS?=
 =?us-ascii?Q?ViJ38NWAST2btE+TCP7i8YEeb1yWv8NBMPYmnPV4sAUgO24VOLS+3W7Bh2gr?=
 =?us-ascii?Q?RNh4dfLHksXTVBia/CEqYfnUyllIyKzf0LuUNlE3XcXBjWZmxeKJgEmyXdMg?=
 =?us-ascii?Q?+nsZVyfrnd3PDDnvz4OV0e6S+fAvwwm8QqoKNMD3Or5H4fcd580tvGgbwXge?=
 =?us-ascii?Q?g7WA36+aGQ1RJjVxTldWIRxd/a6Be8bIAW6IeKVEBsuZCgOaV3kOV8UfZp4s?=
 =?us-ascii?Q?FP7MtazxGHceG2ypGQjJpgCOaE9bA3MpGk+xwIAwVcDrb0NkFllghCIFIYWH?=
 =?us-ascii?Q?bzkmajo20O4Z1qCQ9JgXnzBwN9/zBKnNuFrHgEqyq1QVOTS5KYXG7tM97PnE?=
 =?us-ascii?Q?AY5aYV/WuxQVbKpffjwYOmQsf6GlIgDUbRLOOI1tjO7caS/iUcSbSOSYEMIa?=
 =?us-ascii?Q?wAgUqyhTVFmh6IB5NXRqncXXiUz5P2ySIDP0oSPJSwwusAti9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LcKMU1PNQu4VEaM9hDrPgE75pGk97J8h14A53t89wQwh1JqhqSxizjmKAhdj?=
 =?us-ascii?Q?epX1KrHvgoUHo3Xyay6d9Q2memnZQRIYiBnM/7EMp5zASzWYo8t/9TCWJOcW?=
 =?us-ascii?Q?DARV1hZk0VYL8zCj2724giu0ezsHMjIujnBZ48kkY4rpj7jVYtzSun08x56A?=
 =?us-ascii?Q?xRJXKHvw6+GYbabjuzVtC7pQrA051Vn1wMUPl6Zoq07qQp/YaFe8fYtGAttp?=
 =?us-ascii?Q?r/cBQrSLU3acYkGXI4Zub8BKA6PHFW+9MRBN5Q/IL3rib4B+r7AKJXVjtDW9?=
 =?us-ascii?Q?PygePJ56GCCyKdJ+prZS6US86B0YXL/ZHREO8qHiYdGYzD/uivBoxT0H05L2?=
 =?us-ascii?Q?v/f6IQiNr7YFe3L2n2rEe0+kKyiJKkrCA2NaIJZeNesohq0xdPKttQq9Cll/?=
 =?us-ascii?Q?l9aKxa0huatsJpA2M5zI85f3NVxwQIzYw6SRaSmsGC6pdgrl2QTbUVqSLTI4?=
 =?us-ascii?Q?hD/P1wZKX9mU9fKLeeGgk/bqUlK0AR3+Lu2a91NpM4f8uHLVF4cLuF/zE24G?=
 =?us-ascii?Q?dML0lg0F/Jn7PyqnmIHn3cIABZzHT81DV4YfvaKObWTPId4GlWsc6NU7pEuZ?=
 =?us-ascii?Q?hqmZbNdlbBTZ84UhEUNdLdZTHhoG3yrq4PKfuM3PJ/cKXf9TiQq1Y1Tn8EdO?=
 =?us-ascii?Q?SJG/jwBLQMnnjts1whVROQ2YP1t2yjbI9clj/vBOQKOIJjZL0j/vw9DQVDMQ?=
 =?us-ascii?Q?IYRRHhYsAAc+vDNZQvEtMhmtG9rEV7mU/vJWQlfY+X90bgS31F6q+X/WpfsX?=
 =?us-ascii?Q?a07W8sEdRYklcp2tm6HdTqChtt2qLY9920Ng71lPAIH4KW4xVOdlmREpcPtF?=
 =?us-ascii?Q?BQU69cv2ck7AS7XwfSv6pyW1h4PWiEaxUZuHvKeWaUXgdB1DzbH1GC/N0s5A?=
 =?us-ascii?Q?RhOuLI2lcxkjZmCBzS+5GjSdxP0cI/VF02r4oirKNXJ0ZEoViFjoStlmbXEG?=
 =?us-ascii?Q?hACAT173mIUXPsYmvaq56qP5HaUgLSTM9HtanLk+dIM38tePA14kR4LAvkOH?=
 =?us-ascii?Q?r2efgeziOXHtfQ3MXalb5cSHfmtcPUtLKAetdKsu/hzRqHCfUGJ1Le+EzhR5?=
 =?us-ascii?Q?7vJQRREKRwnnE33bOLzzN6ThTB9PyE7anlg9ZEq4fxxZxsy+bEnbic6wzbwu?=
 =?us-ascii?Q?sVMhRO4v8VkbXgteiTBe9IfVknG8tapslKO1A264dvMB/ToCy/cH5SHwrNOP?=
 =?us-ascii?Q?NUPQBTNMyywUQJjeIwmtWE7DEp3zhWk2Kej6LuDGklPnFPeGO9vrJ0uxfwNn?=
 =?us-ascii?Q?f8Uk2bz+KHceP1NRCI5120pbYTz1RCcrSq046IXTR+ErLsVuVEqJ1TJ4+IGv?=
 =?us-ascii?Q?zQe1v0VLVofFYDV9pswTIES1TbNtE2oIl/D8Dj94QT9P7cI78Nbjcj3j8NBP?=
 =?us-ascii?Q?xcP/BXU4P8L2hUqFWvYJSLElyiUQnoxVJ1d2M1rOpMYWRtRkCW0gB2GW8YPw?=
 =?us-ascii?Q?ucOA+FNclwVjSTl++bNKCrV3wkgRDOSCC9b68f8fgOsvO0VBfilQvCXbQp6H?=
 =?us-ascii?Q?TreODuaX15q4j4zXLVvM7KFc8DDwko/40W/sgqTkrjQN2EpHeoG6Ksi15z+k?=
 =?us-ascii?Q?00nse2MlES1DvlkP1Cgbe/Vtcpq5n09j1kXd7lCHKhyCY5bueJjSX9+Lr89t?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: XgEFejT1kI7lajMf+aJiCLVrua502NSBu+4enpJFPotDPxvMC6BazVEyB/cKqZzomkun1kd8qFWfP3Gs5LI2eDcbSQqkmsm0drmqMfZiB4r3UkFxZEn7VW0NFyH2wv/GubXNFM1XTDG5o22noFMTAW50ViNJ9qFtXgvl0/nDwsRXy6j8cgUndNbxiciGe/0s0CYP+KiRt0/J2+91fbi90FTXGwpAeUD1w2ahB3REWZ0VP+/F+UoCfUM+bMCaDysHHq6H0xaNVfCGUn30LcEF7Hc7kdw8AcZUeXqUOtTqYFk5bqM5g4NKFIPxDnHLLArI+Gfu2ajD3V3M7fYvQZgsMTomkUB8ipjji8A2Bd7CeZXXm4FdKWjl4InSvOw5iUBLD4BDMRGMBqDJNu66A2y73CI8GNUhPKzfvGmOaBObMmicwl6hzNFqFS+q8flje9AhY8d0z2cxoPY2thFgH+E6kCKoVJ2/q+TCneab+nb2BuoT0y1xX5bQKsM5r5Q5kPc+zBkyJ1C8jb140oWiB43vA0ZLwao18f/nxK4/JBNgfxF2PsvZ57z/MAH+uuUubs6l8OkQxOS4h6Gy+eQBnuU3nBsnLbfeBoDIaTsMEye+grU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddfb634-fb66-4c6c-e74a-08dd44412216
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 10:54:29.3334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsQkLKCc74EzATn5OQLsEQAAm/qvp4H9geBHuYyq/1X0P8Cfzu7dnksabAw7fhi1EY6FCKpCtAGo7aYTbkV283jAHzFn0o7Pw4rq0D9DSEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502030083
X-Proofpoint-ORIG-GUID: 2oHuFc6XgOjmy5xvCm4EGUSsychuNEsm
X-Proofpoint-GUID: 2oHuFc6XgOjmy5xvCm4EGUSsychuNEsm
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

On Mon, Feb 03, 2025 at 11:24:50AM +0100, Thomas Zimmermann wrote:
> Hi
>
>
> Am 14.01.25 um 00:15 schrieb Lorenzo Stoakes:
> [...]
> >
> > *** REVIEWERS NOTES: ***
> >
> > I do not have any hardware that uses fb_defio, so I'm asking for help with
> > testing this series from those who do :) I have tested the mm side of this,
> > and done a quick compile smoke test of the fb_defio side but this _very
> > much_ requires testing on actual hardware to ensure everything behaves as
> > expected.
>
> With a recent Linux distro, you likely boot up graphics with simpledrm,
> which uses fb_defio as part of its console emulation. To test, boot the
> kernel with the 'nomodeset' parameter and write to /dev/fb0.
>
> Best regards
> Thomas

Thanks, luckily a user kindly tested the series on real hardware and
confirmed it worked, so the series is now un-RFC'd [1] :) but will try this
if it needs significant respin.

[1]:https://lore.kernel.org/all/cover.1738347308.git.lorenzo.stoakes@oracle.com/

>
> >
> > This is based on Andrew's tree [0] in the mm-unstable branch - I was
> > thinking it'd be best to go through the mm tree (with fb_defio maintainer
> > approval, of course!) as it relies upon the mm changes to work correctly.
> >
> > [0]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/
> >
> > RFC v2:
> > * Updated Jaya Kumar's email on cc - the MAINTAINERS section is apparently incorrect.
> > * Corrected rmap_walk_file() comment to refer to folios as per Matthew.
> > * Reference folio->mapping rather than folio_mapping(folio) in rmap_walk_file()
> >    as per Matthew.
> > * Reference folio->index rather than folio_pgoff(folio) in rmap_walk_file() as
> >    per Matthew.
> > * Renamed rmap_wrprotect_file_page() to mapping_wrprotect_page() as per Matthew.
> > * Fixed kerneldoc and moved to implementation as per Matthew.
> > * Updated mapping_wrprotect_page() to take a struct page pointer as per David.
> > * Removed folio lock when invoking mapping_wrprotect_page() in
> >    fb_deferred_io_work() as per Matthew.
> > * Removed compound_nr() in fb_deferred_io_work() as per Matthew.
> >
> > RFC v1:
> > https://lore.kernel.org/all/1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com/
> >
> > Lorenzo Stoakes (3):
> >    mm: refactor rmap_walk_file() to separate out traversal logic
> >    mm: provide mapping_wrprotect_page() function
> >    fb_defio: do not use deprecated page->mapping, index fields
> >
> >   drivers/video/fbdev/core/fb_defio.c |  38 ++-----
> >   include/linux/fb.h                  |   1 +
> >   include/linux/rmap.h                |   3 +
> >   mm/rmap.c                           | 152 +++++++++++++++++++++++-----
> >   4 files changed, 141 insertions(+), 53 deletions(-)
> >
> > --
> > 2.48.0
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
