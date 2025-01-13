Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281AA0BF26
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C1710E75B;
	Mon, 13 Jan 2025 17:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="JNs2A2NM";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dxoaPH2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7454510E75B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:49:12 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHMp50026442;
 Mon, 13 Jan 2025 17:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=F5BxxHVlN00q5h84pu
 V6VzkcGfjLQfEa3yjM4s6NnXI=; b=JNs2A2NMjk2hEMFrcXQzBMOkF6hqFa2kIy
 2FPJ/4AqufP1cRLBP6BOEhg3aHtK6bPe59RItb7QAdvv5Sfhr1D0e8cHa78BrCGD
 8YtBL1qw7oFGojwJSq9oNkZbnkE4LI07NaZ/NVMEC8mTpVzeR7WLAr1d9YSweVBy
 V+J89nBIYYahPon2V93Hg8S582mMSF5RzInoYHDeJXq6maYyy9VM8FoGgUoL8zXm
 kw0l6iJrV9gV1VIMa08+77L4YKb+CsIh9MOSQVmrtqtOtV7TEPiJHKTy2yQjZvDH
 9czUW5R1TVIC7cB+JPsF+f1o1Hp0RHhhrrkF+W+BU2Vu/MX9GYLg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gpcm8ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 17:49:02 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50DG3ItB020355; Mon, 13 Jan 2025 17:49:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 443f3dhxu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 17:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJBB5kjAzgYS8Jvid3xD3LE4/UtXoxFLnqPh9wyZek/HB3XK5e53gP9rcthF+mL9smMylBubBBReYubFyiLLpKAMp3IAKu4EAn/VMjwGZYILWk+Y2MebdqAHrvGmxctS/kHxYr2DpOMTkTe43tCxdrtxkn3vGcxPnWk3YVvNxC4bBRoloPbLL6RF/ecWyHyVZWqQ783C4V8JsSpIBhqXJTteb4BoKE8wjeJSRezZtZtCCUcKePpUZlIi8QyvyE0viPFRtvFKA+a3aji8rLkoeEnpM3VazS8ds5rv2NRAspBMCEIrEqq2a7j9ljBqsd40WXrFUr+5xlxnXnChnAUVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5BxxHVlN00q5h84puV6VzkcGfjLQfEa3yjM4s6NnXI=;
 b=AuATzHKkHJaBBiXL01MuL/bqTRLaf4KP/GeV+xSZ+5Oi6OKASLIKrb5g4j8upu6Iz5Rb1Vyi4wkmlVpcYTJwnf3AyqN7wBsPhQH4doO/IFjDU3YqQ3WR9NWAhijOe2JNaJP9xJbm52rEfZ3gcqu4/NolVXMgh9zh7ypakQdX81a3pPt4BUbmH9c+vD7AoUWf/7fP4XFzYeFvVyqnXvkSnKQSIqjPPcisds549r+/8NvAiaemYan532mAV9+lNaumtCDUcBxpuRPYF3494G95Bk1CQH3ofrg4CbilOLCnLA7gLwg87X3d9l+30gB/4sjEeN3rfAkoYp82/n09cN7pPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5BxxHVlN00q5h84puV6VzkcGfjLQfEa3yjM4s6NnXI=;
 b=dxoaPH2/GzfwNzYRlbzNTWw4bBcEm+/SQKaaGR4/sP7TZ7a01ElrH+umA4aIfgVPW8Z1ZL6x9WFh3yjDE8ZPNUfw8cPiYBVU4ZgCuO5g9QBjpbazyHRl87Zpd+zBrdLOIeCroDPvKSDvj8ncuwylSjb7Dyvk3AJV9ETuJGcKHWg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DM4PR10MB6814.namprd10.prod.outlook.com (2603:10b6:8:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 17:49:00 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 17:49:00 +0000
Date: Mon, 13 Jan 2025 17:48:57 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Message-ID: <f0b3bdec-ee11-4648-8a33-d04317f36b93@lucifer.local>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z362xoQMxQRxYUlJ@casper.infradead.org>
 <b7465ad8-50ec-490b-a62a-e535e0a4691c@redhat.com>
 <Z37mE7NdQu-ZgBES@casper.infradead.org>
 <34ad8349-c4c3-4370-a662-324fa91b32b1@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34ad8349-c4c3-4370-a662-324fa91b32b1@redhat.com>
X-ClientProxiedBy: LO4P302CA0025.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::13) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DM4PR10MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 694827cb-32bf-42da-8cd2-08dd33fa8f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qe+oIxHhb+Sy0+mD1Emy8Hron+clevMLxUQpCHxVj1ET7kyVzfTGpRFkga96?=
 =?us-ascii?Q?lxQTe7x1ruUzoITPD5ckY9b0j1OasIYynYpdPZJzv3LF2PfJuGWFHa4yL8fa?=
 =?us-ascii?Q?qVaVl8wQFGGMDV9x6EtJFSMb8Qc7IWg90A7A2h6ce4N1VJQXD+F+MMa6lrD+?=
 =?us-ascii?Q?nFtKBempjdK79+PSwJP8fe0Tms/LMS5HKf6DPWQ3sekebLwwmPCHJ4a+tKIY?=
 =?us-ascii?Q?cwYkeBzb7IS5z+4DnY7EFXPf5TESVXXLDfwaoBrFlTyH3SK0yeDvgGLZl246?=
 =?us-ascii?Q?YSkbO6P0hjkPKMHh6lCGek7y6i9WJVcg4ztAkBbVWf6ALSKONPLVVaz6Vxec?=
 =?us-ascii?Q?z/7pD1ccUK8Eur0iUqxYLTv3fREn/6hNhZabDIXLwDLTyLfW2ZXFxschIUsk?=
 =?us-ascii?Q?wxpmU0qdu1iB49wmhSavA6neuohOkSsofgAlwhx5SURzVN+I4M+AY5muRI7K?=
 =?us-ascii?Q?0n7dfsF3XFwItnjv9Da3WVIm9Te9SM1Yqqc3mmf4orLXQpi9RdttRBWcUCRd?=
 =?us-ascii?Q?CF2TrCFUj9oz4ZXpqHD9EYpFwqHiCV4I9dRpb8ed5S2ks3DYr3Qdhn8gN6CJ?=
 =?us-ascii?Q?DGk8z6S4krJg9q2YTdTMuCQTa/5w4gTPyjTuUv1NxChPxfEfjBYVMu4la4vP?=
 =?us-ascii?Q?5S78zmcnXDM0tVTw90TtrBPGYEUYF+D0BRAK/PXQernDcH76m9B8/5I7RRP2?=
 =?us-ascii?Q?E1ISRxE9duD2go37bacq1/ng+83eRRAawXnX2EoIpDDUhYJXRSf4Z4G1dU7V?=
 =?us-ascii?Q?ZWdf8PtgUglJyEo4Fl3Ot2RQKPzG5FalrO23r8v7QQxouKjS+JAe5z02bT2D?=
 =?us-ascii?Q?wp/hwGZuFVbISy8sACgvY1HNjiRVwUtjVS2y4zwLUJAZm+OcyES2fykJivAP?=
 =?us-ascii?Q?qmVZbO7Q2KfTyEahxC1tNsqUaVil874YdEivN4wlRWhSJ0CMmXoRa6qWVKpe?=
 =?us-ascii?Q?N70ASym9cOQLnyUH0yjBQ/oFEDs6ulFKDXmIHNURWzaP4Ii5+TsHm51J3qMT?=
 =?us-ascii?Q?XymUlyN1WPoCXgoB1CSeyzqE0+ylJfsGonmMu4cgC/XCcnGldK19pDakCeTP?=
 =?us-ascii?Q?7lt18vnM2YJmWrl3Xqhbot1i4yMs+9AMpRhO1A/Xx7vLvTx1ml/LefcueMZS?=
 =?us-ascii?Q?rVBFOG+BgPX3p//JAEcy5Vfn1JEKOaFxhgcfEfLhZuzAx47kVV1heSZs+bWD?=
 =?us-ascii?Q?Emz+xJPZg7LCwdav7X2feBRlgeG01OXyPi5er7vTaBka3VTD7y1U+O9SRm+R?=
 =?us-ascii?Q?UundKyCOdX+vjRSCO0Fj/DY9btOTuaFtuhfchajmhXuifjH2cL12YpDZQeg0?=
 =?us-ascii?Q?JpLQh0yN4Ipaq9BvbutXGWQeC1Z9/dira78cyCH57HVTIUH1IssNDc6dYbWC?=
 =?us-ascii?Q?nzJunHHI0KtXAqj/FyfX0re+q7O4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c+Upg6ucaT0g4ylhV52yEhr7O27u1Ieg7Jdei6S34IuSEaK7FD0ngF1x1Bmi?=
 =?us-ascii?Q?cvq51lSMstTvminPMf/iGDWj9NXVB4q+3M5f1pf9gSe6W0eauL27vfJuk3Xe?=
 =?us-ascii?Q?KDXCLdWlTGLxWakkf9GhksN65RtozupMzYdmlxvpTDaMgOB5LI4fJbkgkKIn?=
 =?us-ascii?Q?miJH9pEtrwOvZWgiCmqmgz40mhX8BCkNwwU6CWRZ4qI8HiR6CA5C4JFXLE/0?=
 =?us-ascii?Q?sMMyr6WdToEPr/C/hJWXRWCLWJDL7RQNwiG5O1OFVuG10vX83irgpSrvE8Nu?=
 =?us-ascii?Q?3KlOCtjVrLVTc014PjSWRahRj9sajUH4uAy7K/WUC1yWfxU5eMm73FC+rpIm?=
 =?us-ascii?Q?eMWfk3WHmiE9Rzj0AS0lKuuMBZjBS5bZSb/vEV8r2xfSVHQnw/8cKHWsOe9u?=
 =?us-ascii?Q?oH4OzcMnOifm0yI1XuYu6RFvon2DX+ttkwIPua+kHIotO89gr5TEnoGeElsf?=
 =?us-ascii?Q?5K9OarjvNTFnxu1qvYJcLI3vZLA+iridrJXg+KNyO8zEHYy280wRIF63raS1?=
 =?us-ascii?Q?/hG1vQOLgk6lc2ncqyawPGra+Kt2zPnCHDFiRQQukQmPSd8yiQOE5eCp8qa/?=
 =?us-ascii?Q?xKtNLIg2UyATfhpnTEEzKRde6Y8MVuXFZX7sj0sipvLJP1pJUORdTotja/+K?=
 =?us-ascii?Q?AOeanOjhwCt4AKuNUZHj+8b31mRYYLowkdduElEi3DMTwSG0x46aRsgAzaYm?=
 =?us-ascii?Q?x78vOT6amZ2PCFb872WI/UrHhs3wiDR7GjcuiqNI9DdJute8obYhe8yTLVW1?=
 =?us-ascii?Q?IcU5BQNdKdEjgxlVjQ229y6CwZnttItXiAKdUB6voLKPUnm4Qz/XvrvWHBVN?=
 =?us-ascii?Q?pINlcv6xaQVIwBEMqouBj4mEOBRGYNN9fb5Bb/RxMnkuz015/1Evpw4GQAub?=
 =?us-ascii?Q?shQlOus9QuCCd0QQCHI+u/AALhtXh66YYavUbXJiTBK3AazcUkZjVHbPC/Po?=
 =?us-ascii?Q?51DQ7wY8eJeSzkcVOG308yAu/fbcZiyQX9K0Byu96xe6eOvgH0FubOui6XmH?=
 =?us-ascii?Q?oNH99/SSEhh2XYFTDZnTcF1PNS+MWSPrnBuC6Mb2DRAnHTGKTPkWdVT/tWjS?=
 =?us-ascii?Q?UwM8DMeCupz4PmAOOJ+jk+RImbGeINQROzRvcwSHKHKwyzzMB6jDC+NvgnEi?=
 =?us-ascii?Q?+3M5GUG3vxc7tlSopEqfV1b0JrtRuk1hzZ52onQPPjM/gzNLpgeXPjNtuF44?=
 =?us-ascii?Q?G0s6qkB2TQQhVxxvygKbH00PeZY2SlRPioP0lSL7pBx933KS7+iXvmizchyj?=
 =?us-ascii?Q?dMVdji9lrcFY1cRbbkcLcQg8riIBqk0uQFnRgLl6BZWRGiZhk5myzpc5HKAG?=
 =?us-ascii?Q?sPW0k7kyPmvhK8tZcUnt69bkaEQ1gn3DE3W2AdBUUmdjUEv8KPg8Mvzlp+4N?=
 =?us-ascii?Q?Z3gmjgA9buz6NrFsgMQv8hk1yxnaOH3GGVRL1VHiu5XZqffBUAr4y7qyr/2C?=
 =?us-ascii?Q?UjtJT4/2RLh6hco9wFeCHwMmK7VTi58OFAB/VnxiDH4FpVueaLlmDJZuFOoR?=
 =?us-ascii?Q?XGF8mpW/aegw1i8u6mKQ7lyVAwOZx0rtbLyGnfGQO9EmaiX0jvDQWEQyB575?=
 =?us-ascii?Q?asuI9ISo9SKE0htUi4B/bqZK/gRpwCcW4zGSfXG/1XsPQzH/B84M3e2n924S?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lajcqUpi0xujsvLPbxcp5k9FCwtuSTQCHpg6rBJXZTqRXEy8mu2IvPo9FiYA+W/1l/GLZuwUbEN4ybkXm9lBNJdQAWzvMuhaF0VvzQwueq/rG/mwh8YrQgL9CMUZ8Wb0n/3nn8OKzt4RnZ8kdh3BNIXpaFfjPwQuxF1HOKS1yiRe7gY37IBBvECymhZaouUrDoVAguF+GTIzGxY83f+sLa9Kd44YFiwzupkduxcYWxT9O3EX78oi7mlmhchyHLhh2+WzEGeVPJZnJCuBhIn77ULONXHojbxXkabG0UCpgLXtYhmL0//+PZwO4gGHZX4yOrxa5rEnADIMT9CKG/1KFIk2ak6UT83j7lL6taG/QnoSG7h19cs1OHPjer7uX+d03hc1QthCMuzDmZ4hi4QTXGVdrjiwSyB8rPdXjxIelWp7GAm36jYJnQZHHjTmGaat4YtlJm8c3Cd8oCgNMsk0BtZ7Tu75UJ1zMXM8gTxKpu6DUtRleXl/fgEAnn2ef0hzu9JtNza64HwY9DrO1KuQNOOL+b/B1b9KEE+/PWkBDnpiVygVirKfXzauzV8W6mpGcK1Hfh+pHt8fWx/DOZvPx11Q8clqqtEVzmeleYVFdHo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694827cb-32bf-42da-8cd2-08dd33fa8f9c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 17:49:00.1593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6O8U9eCPTp827ChDOhyz5LloOhGN31JPW0jK2AH+6bMtWdgT6vDPLVfa4LB+XO8nAs1UBLWkzNMHKZkfn85rv6KqT0/CnvxtUUdkKRTaQSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_07,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130143
X-Proofpoint-GUID: y2_Oq1tEFGy9QoSL3EMkg9vRJWW3qd6E
X-Proofpoint-ORIG-GUID: y2_Oq1tEFGy9QoSL3EMkg9vRJWW3qd6E
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

On Wed, Jan 08, 2025 at 10:12:36PM +0100, David Hildenbrand wrote:
> On 08.01.25 21:54, Matthew Wilcox wrote:
> > On Wed, Jan 08, 2025 at 09:14:53PM +0100, David Hildenbrand wrote:
> > > On 08.01.25 18:32, Matthew Wilcox wrote:
> > > > On Wed, Jan 08, 2025 at 04:18:42PM +0000, Lorenzo Stoakes wrote:
> > > > > @@ -280,7 +269,10 @@ static void fb_deferred_io_work(struct work_struct *work)
> > > > >    		struct folio *folio = page_folio(pageref->page);
> > > > >    		folio_lock(folio);
> > > > > -		folio_mkclean(folio);
> > > > > +		rmap_wrprotect_file_page(fbdefio->mapping,
> > > > > +					 pageref->offset >> PAGE_SHIFT,
> > > > > +					 compound_nr(pageref->page),
> > > > > +					 page_to_pfn(pageref->page));
> > > > >    		folio_unlock(folio);
> > > >
> > > > Why do we need to lock the folio?  (since this isn't necessarily a
> > > > folio)
> > >
> > > Can you clarify the "since this isn't necessarily a folio" part ? Do you
> > > mean in the future, when we split "struct page" and "struct folio"?
> >
> > Right.  I need to finish the email that explains where I think we're
> > going in 2025 ...
> >
> > > Doing an rmap walk on something that won't be a folio is ... sounds odd
> > > (->wrong :) )
> >
> > Not necessarily!  We already do that (since 2022) for DAX (see
> > 6a8e0596f004).  rmap lets you find every place that a given range
> > of a file is mapped into user address spaces; but that file might be a
> > device file, and so it's not just pagecache but also (in this case)
> > fb memory, and whatever else device drivers decide to mmap.
>
> Yes, that part I remember.
>
> I thought we would be passing in a page into rmap_wrprotect_file_page(), and
> was wondering what we would do to "struct page" that won't be a folio in
> there.

The reason I provide a PFN is that we internally use a PFN for the walk, and
everything else is folio-fied for stuff that isn't necessarily a folio.

However it does seem silly to have to page_to_pfn() a page that we pass in, so I
will update to accept a page and do this bit in the function itself.

>
> Probably, because the "_page" in rmap_wrprotect_file_page() is misleading :)
>
> ... should it be "file_range" ? (but we also pass the pfn ... )
>
> --
> Cheers,
>
> David / dhildenb
>
