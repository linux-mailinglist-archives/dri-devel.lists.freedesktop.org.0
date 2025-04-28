Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F900A9FA5C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A115710E9FF;
	Mon, 28 Apr 2025 20:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="llozdi6c";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JMCPlz2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D9910E9F7;
 Mon, 28 Apr 2025 20:18:57 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SK8JG4018595;
 Mon, 28 Apr 2025 20:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=swCt1y5JanTRCSpYLd
 PsF53NNybFNft6TUpNk3oaMEs=; b=llozdi6cyASkwldrxpAIBJoeFD+s0EqpCq
 iYxNG+USmQBWIPPUQhtzyvKTUYvVwEVwJW8hDzsu/6cp2FYl2Y/Lk5Yjh9VLLJ4P
 4O8xip/qUM/UJ9DMptfCkJgSQE1BNTgp8xMFRxPfgxL6SQMVd+X/w5qGaPZij6e2
 /1RAvRfQrwefBRpsYGdhmLAWE79Gj6qNI+x5oPLsICihwcMZeLa8ZANwpV/Qjq41
 7F6B6KzWTLwwpEf6zSnFQtX6oY8B481UNIK2f0xLZK5AlXrIwprFuU4lkb7YatpI
 kmnOyoCZYhSHPM7DQn1Trbg6slvXYJj2hIJQOKA3xix4pJC6CG4g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46age480jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:18:28 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SINS4i001321; Mon, 28 Apr 2025 20:13:11 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8wfnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:13:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Az+u4vEHRcbTs1kPWs74Jgl2+q4AYq/aaeqI/xmTzdix7ZG5+MqyyGXBhEx/qTBk6yiQ/yXVoX1fXqRYUrMRdLFvMRtexewcbFAdEoegR6EAeCf23fvGrTZ+5Di2pELH5sJ/mbQbjjxqeE9xkA5HY8dxD3s1TIV3wenWd8VhVA7YXehXNbypbkRkWyVCmT2JoywRkdh7WEj/b7aWkkshwI7PJL+rhRr2zmMwHqR+FKWxt9CEdM/OcBAqjySxdTnrZZlRKXABBgxQ5UR+PYlfBDSRIOMEIiL9FwprE7Bt40fVCMkSqyZ0yh99y31Wod4goonnEt99Zw18/19trTpXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swCt1y5JanTRCSpYLdPsF53NNybFNft6TUpNk3oaMEs=;
 b=oCXihsc10qVFavUGBSJRl5FP0KP+bM9l2+C6YdtxprzzTJGT36pOrM/i8vCveisfWXGrjxWeNKya2j4fp/tij5k6TCqOcC4rajiqnMtekj5QBCLI2ZEsX7xKIgVSludxtdjJpWEeJSfxblG15b0bk6O0TmxRP57uV63IcIMWFDkdDrh4iwqWPV+c9bm5IVVUcFSsJtPmwLfLIdC1+CxLR1XCHHdaf4Gi9jgtKvpDhOuNg2k9qtlUxrKlx6irDdrKobq1EizTGva4Fpf/nIsvEGJ/RlLy0piyaymzLm5k2Mn3luUG4Qho4ViIsQJmHTqFw8jTIC3BawGMkicr6+ds1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swCt1y5JanTRCSpYLdPsF53NNybFNft6TUpNk3oaMEs=;
 b=JMCPlz2Pb6Ni/ZcfQgTjO8OwD77x/58vTaQHJZ6UnUBqjASg5jgjVGBQrEovBFb4GRTjHult6tehiFxmo5r3aEf6k5+SLPBTwVi3zZDzyU3qgzbB1X/Vhd8Y+PK7wdBsLFN3YA91+y2CR4au3x/xe3oyoPMRWYLBSpYfQfMBHdQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS4PPF109C7C399.namprd10.prod.outlook.com (2603:10b6:f:fc00::d0a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Mon, 28 Apr
 2025 20:12:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:12:44 +0000
Date: Mon, 28 Apr 2025 21:12:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 06/11] x86/mm/pat: remove old pfnmap tracking interface
Message-ID: <683f254b-2a6a-46e2-b11b-e0514c1b076f@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-7-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-7-david@redhat.com>
X-ClientProxiedBy: LO4P265CA0162.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS4PPF109C7C399:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c29eb34-70fb-4274-b484-08dd8691097e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MFrDSmtsGI2ooRxf8WGSFEWGZLHGhLZcEXzGg6UIWF+RBcubIYi+Hr5If+Mc?=
 =?us-ascii?Q?tmx8L3nxPx39jnXN9oVBrW3rQJJdY5aUtZJZQ/MZc++Lpns/hA46tgTqksB4?=
 =?us-ascii?Q?R1OHBYB/tT95Byf1PfR34uoCahOyxk6mZRDEn2XSLZpvqjNx7K8nTicUWA7i?=
 =?us-ascii?Q?OsqR63ZbmMfq5OFpp9d0/eOYclwavTXqMP63IIQR3xL/oyP2Hqh0Vhxfl1kl?=
 =?us-ascii?Q?juoQovxEzs3o817z56niGiu6tKdqh+nZ3vvXRTwLwvP0PhVYiDxEY3pqym3R?=
 =?us-ascii?Q?BsJW5A/BrjpwQcWQh+45bIoZtc0C85xMRmLzsxdKfGQBusNEUW5kV+PNgE0n?=
 =?us-ascii?Q?vU2OVUP9pqXIsMgtRWNZvEwsN7+599nUxGvGc5jr2rjHYKkEKiMRRyUeFACi?=
 =?us-ascii?Q?TibzM2aAHdj5nb/IIlYWjOPnnDX1W9bDzPrdLw9nBfFJayAgmcDboRIWDu/d?=
 =?us-ascii?Q?L/GPLn4RUewKALCvjAb6LJoLhmQPFFiBw665G7loa7wVu35yagSMtVPvp2PD?=
 =?us-ascii?Q?RtO7bK7gK4m4cjH2G+ZdyoFnA1P8kJQrpoXaXp5ihlPtt0ZmHig8wiWSQo1t?=
 =?us-ascii?Q?7bwfDRy5JqzXuCx5jBT32pqoLqp2UE/MDxJ5BtuCESBAwHXD6hgWY1x/5AU4?=
 =?us-ascii?Q?Pmlt/2d0g0KBJlb+Q8iFJqYPVxJLu1vqPm9zsIA76PnSKgCR8I5SzI0yjrKo?=
 =?us-ascii?Q?/hBXBDTpwS5x2xLuPUqLXFck21QPhz1g0AOG7haAXnQHs/0WguJhkpSS7SFX?=
 =?us-ascii?Q?gaDkb19BkQ6IZMOLB13goGIZDsfTt4EFOn3ZBpxdzXDLQOBrkfUVLFonqQcj?=
 =?us-ascii?Q?6ylBTHcqBweLPH7iE/O6WccBRB32l41aD8Qy4zaJH+esCX4d149g9t0c3Fwg?=
 =?us-ascii?Q?HDvG+Y42JEl45zX9HCDrkDvMQAa4lYldo449ZJLZ6+8Aos/6d7B9bUIJJDvd?=
 =?us-ascii?Q?L222FGIDYXZctLcuKhhF23NauuFl5op/647uO7X+BCmQGfFxFvHW26ptWl8i?=
 =?us-ascii?Q?8svLPuX/pDNdj7hbSV4xj0a/cs/fk3dHwSFE7SV1ym/NuFTIrO89DrmOlyGp?=
 =?us-ascii?Q?rh5D9QelpO9WOgQ6sHUnh41CAiE7QOqpouHKV2l8+vDehAitsoNzLesQi0wK?=
 =?us-ascii?Q?ih1efdr7icg9lXzJi3CPwtt3AfH4+1gg+hVHlcaj8VIN6I43ZZB3AyadYZ1H?=
 =?us-ascii?Q?oxYIp+IQ1BbVK4ji6ukuRvB05DZEPGJe9FO7EubM/1x4JBCuadNTAr/GUM4f?=
 =?us-ascii?Q?JkHCZdQvyu7RKa4VJ0gIPw/HDTLwWqBFx+c+3zPHOYQVYLp5Gan3LL3KO7SS?=
 =?us-ascii?Q?adaL4JZFXjVxeys4Tv3u+mETDg4XQhnTQMPt5dnwDU3OpVygnKwoi3oxXxaU?=
 =?us-ascii?Q?Cu9TDrr2hJLfjZK9pblPqdWFG2K6jNl+HWmPxm+xKHbcsdWQ4of6VFoDqqsi?=
 =?us-ascii?Q?5wfjcdxkWbs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OXewyOFYFrCdnW4XLNGz/kqL7vP77NHJVM0JUjbwwNz2iuHqPG1znddEf61I?=
 =?us-ascii?Q?iFS1jvvL4Y8TbL5PbiZVdceSFAWQhLAA39JXiLmXCnjKbtqrTlCz5LPxO5/m?=
 =?us-ascii?Q?aOdrh1mbVD4J6sUwpJHeB7nRLlY+8GcySdrKQjhYGIecdfriwGrW3LHDkQhe?=
 =?us-ascii?Q?Rvn7pEHUm12BblYf1v5xSVCImbCRCVEkhD6bFRdyFUHhdiDhIonfw7SBCyRT?=
 =?us-ascii?Q?WyPcoAM29BhA7mPTVdR1ABu9B3vKH6pxbiUEn2xLB4B1cJtg/h7pofNOL+Nq?=
 =?us-ascii?Q?CDyg3ZsaLv/SJr/j4vyvd1RvfvAlqSJPL8uTuP85aJVPhWcVe4CA58vrQ9Kp?=
 =?us-ascii?Q?7l8u05RfXMqquGH6EtAaAlFKHGPRZOtH8WXywINyNWppPpfIjvLJ+EVqWc1a?=
 =?us-ascii?Q?XGkL4oeu4MyWTlQWEi6dS+TYsnpuISlGFlZgkGseMUStvxZuwZWgS9s+A2p2?=
 =?us-ascii?Q?qO7xbc8y9Fz5ozvyGT/DidHQhWJofpk3MPnya9q+5JG4Ujx/iu0fSLKA1+UU?=
 =?us-ascii?Q?H9z21oWOnXY5GaG9y+qxDQsWDDz7OccoqG1MA/tTTnR9mobknqNW3atxH53a?=
 =?us-ascii?Q?fz/17AwG2gYaBJfBwyYBcHOBNmkMkcS42bly1+HCsxrryhictb3hcP5KDpZV?=
 =?us-ascii?Q?2Q/awtrNH3g/vlenm2v73+IX3BfI4ErQ6Ym/z+uD6N5nztyIlOi3lUQ+PAtY?=
 =?us-ascii?Q?byMZTbVbwcoHLLHHNLYQLTsHCh64ObcW5VO4xjD72mMFDgNpg6Cqqlj7ydpQ?=
 =?us-ascii?Q?zg6ZDaulSpIk0U/csv8f0aNzn132AwpJ++nwKUthm9oGzaWjmv8sKusYs+Ni?=
 =?us-ascii?Q?xEMxqZEE2lfTk91B3jli4jTjtcZiWBkC0qumORyTEvXp1BN1KzvyRQAs71Ly?=
 =?us-ascii?Q?q4eoFGGyoDSay/I7P1VzvUbjg8CdWVdVmE9L8pp0FFzjeF2sirlOLK2OmhTl?=
 =?us-ascii?Q?I19nRoM8i5biMXn/I/uTUr0XjkSlfNtfKUFXUYiqJJoZJ4z4QPk6h9OnRPaP?=
 =?us-ascii?Q?uLGeH7TRp3VJiDcrAiItGYF5TQ4th6FylcsB9T/kg0qPC+/YGzXDxP6hTDAD?=
 =?us-ascii?Q?gPiVaYRwI1FhqcETVLnfXF4Tc0FZVaF6/RBnKcRdWFggXeBeJaqDpJG8LmV5?=
 =?us-ascii?Q?Jbr40w3lVQNBaqpYbd4d1VimeheeTl+e8aUOYIgWc6VoE6yV8gHoZtNewfg6?=
 =?us-ascii?Q?TaWLbb+y93+/Kaqhu00LosHB8Pvcdb3/hgJaKkbbTTA7rX+JwVC0rA0HHJp6?=
 =?us-ascii?Q?1jIfEHj89w/urzJcsO469LqkGC72I/VxgjamFY02bKE5u5ZzRNcd2H8DMT/r?=
 =?us-ascii?Q?2M+EgRd1typsnnbxBxTXkj/4LxhHsCXAcyvhUJz27nkUwdDQP2cvr3ucYd2h?=
 =?us-ascii?Q?qgC8dj6DjQaCIJ95vvOaq6fg63wIWp998RFXf4Z99B+aH0ID2PVDM+y+FG/m?=
 =?us-ascii?Q?IoypUiLemGkH8Z3KD+a0nTAxYwmkaQjHwHY+eGLiFyWgnCo+Z9HD54RJgD29?=
 =?us-ascii?Q?hTGnJU3ir+nKWDBUW5vFbnxFjH1sgCA8w+tSpwmV7hzDA/zHSYg1CIdMMfCk?=
 =?us-ascii?Q?/BKv3Zj5CGuumN0fxnxxDRKPZoN8eAmpCOmq1fwZyh17W/IjKQPE36wXTgBf?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: boJthh+qdtSR4vx9Bvg6R7F2u2U3EewpPymplZcEcmqHuDYqi+xhZODtSU5WbmsNXpSUBb6OKWN3GePO9QFr8jOvSkksMNZqjG5OjxLgLwDquuOUyrhop+rrz6E3D3iRgLLmJkE+try4wY991emvvjqdu5+jysDJY49vzPN+T2bLl2sCwTEB9I1fZqBa4u7FCVN+W4BToVh0k1Bv3PiyaD8Zy2MiMwGKbRlmjG1hO3sHgz/NBxpip2dbQHcCBdBVxHtSK/EHthetQGlAdRz9EkKSvVCNK1yzislkpfXlfzfQX0lcGnNW1dMNEpgAJbY7GRmRl0+CDxEV5szjlMVmv8XWw8E/6LiqY8+x22clOdJ3ls+GlZnttBCN5lm5nUtIkDvo467A7gjqIkeAbeXxgH6Ef+M+TS9IjnE5/rs3nPvfHuK+7JBYWFwTMN5UG18tXiHi/7bKF6bVl749WzobP5lBui+jy2cMvMRK4LzM55bIVCS43Vqc6WzmDmSUgdzqQ2iNCcdkTfw7YTRiU46AeWbk5uNInk3+sCmhI610f9CFiT3FHioGAmAjD1f21IlTsl7W0BPZYHmpDKJ14FyrqRA8oXIJ+FR6TIO+mLunzx8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c29eb34-70fb-4274-b484-08dd8691097e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:12:44.6396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfDqg1m3eGnQCQ3xBDkzEqNH//PTrfxhUIkPOnq/Av8MqkYo+/8pWB0TRkr/7mbtDkI/fwRBCb5uFhBmcIcpGOgXv2o9H+q8FYC3BS/gGWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF109C7C399
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE2MyBTYWx0ZWRfX7eAcwSIQNhos
 vSI1I0rmK5HAv9FBqNorbY8cxIcTNxTbFitqF2QNCQ3ym6Rldeb1W+hqZAJBLDWMjRyMZ5daTq6
 qVGTW8UF33UVKRqG+5E0ltaADaAJqkobNw6jaFqJ2/4e+R+zx+17A2tZ0wLc/WmXaY/nyfhNJFd
 Qybb9eYG5HUClscv1ae/DreYV/CB0CdWMci5DqMaShXHIRwOh2ZMKSXVZqEjJQK98rnTTlSPKaj
 33iL4cQ6UlpIzkU+GL9qhtF9PfpTb6eHm+sbJl1OZWls+CwNqCvKmdzf5lgy8QN+g36+pBLN5iA
 /ozcrfvUut/wvPkkmebHh430+O4G8mJVCXtmVkVAJKvjRQYm2JlszUIyZJyGzrkt48Tzd62mKzj
 WT5iRR2S
X-Proofpoint-GUID: QxvC2pKjSmz3bdKLR0pRc8_m44VFPQSE
X-Proofpoint-ORIG-GUID: QxvC2pKjSmz3bdKLR0pRc8_m44VFPQSE
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

On Fri, Apr 25, 2025 at 10:17:10AM +0200, David Hildenbrand wrote:
> We can now get rid of the old interface along with get_pat_info() and
> follow_phys().
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Oh what a glorious glorious screen of red I see before me... deleted code
is the best code!

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 147 --------------------------------------
>  include/linux/pgtable.h   |  66 -----------------
>  2 files changed, 213 deletions(-)
>
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index c011d8dd8f441..668ebf0065157 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -933,119 +933,6 @@ static void free_pfn_range(u64 paddr, unsigned long size)
>  		memtype_free(paddr, paddr + size);
>  }
>
> -static int follow_phys(struct vm_area_struct *vma, unsigned long *prot,
> -		resource_size_t *phys)
> -{
> -	struct follow_pfnmap_args args = { .vma = vma, .address = vma->vm_start };
> -
> -	if (follow_pfnmap_start(&args))
> -		return -EINVAL;
> -
> -	/* Never return PFNs of anon folios in COW mappings. */
> -	if (!args.special) {
> -		follow_pfnmap_end(&args);
> -		return -EINVAL;
> -	}
> -
> -	*prot = pgprot_val(args.pgprot);
> -	*phys = (resource_size_t)args.pfn << PAGE_SHIFT;
> -	follow_pfnmap_end(&args);
> -	return 0;
> -}
> -
> -static int get_pat_info(struct vm_area_struct *vma, resource_size_t *paddr,
> -		pgprot_t *pgprot)
> -{
> -	unsigned long prot;
> -
> -	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_PAT));
> -
> -	/*
> -	 * We need the starting PFN and cachemode used for track_pfn_remap()
> -	 * that covered the whole VMA. For most mappings, we can obtain that
> -	 * information from the page tables. For COW mappings, we might now
> -	 * suddenly have anon folios mapped and follow_phys() will fail.
> -	 *
> -	 * Fallback to using vma->vm_pgoff, see remap_pfn_range_notrack(), to
> -	 * detect the PFN. If we need the cachemode as well, we're out of luck
> -	 * for now and have to fail fork().
> -	 */
> -	if (!follow_phys(vma, &prot, paddr)) {
> -		if (pgprot)
> -			*pgprot = __pgprot(prot);
> -		return 0;
> -	}
> -	if (is_cow_mapping(vma->vm_flags)) {
> -		if (pgprot)
> -			return -EINVAL;
> -		*paddr = (resource_size_t)vma->vm_pgoff << PAGE_SHIFT;
> -		return 0;
> -	}
> -	WARN_ON_ONCE(1);
> -	return -EINVAL;
> -}
> -
> -int track_pfn_copy(struct vm_area_struct *dst_vma,
> -		struct vm_area_struct *src_vma, unsigned long *pfn)
> -{
> -	const unsigned long vma_size = src_vma->vm_end - src_vma->vm_start;
> -	resource_size_t paddr;
> -	pgprot_t pgprot;
> -	int rc;
> -
> -	if (!(src_vma->vm_flags & VM_PAT))
> -		return 0;
> -
> -	/*
> -	 * Duplicate the PAT information for the dst VMA based on the src
> -	 * VMA.
> -	 */
> -	if (get_pat_info(src_vma, &paddr, &pgprot))
> -		return -EINVAL;
> -	rc = reserve_pfn_range(paddr, vma_size, &pgprot, 1);
> -	if (rc)
> -		return rc;
> -
> -	/* Reservation for the destination VMA succeeded. */
> -	vm_flags_set(dst_vma, VM_PAT);
> -	*pfn = PHYS_PFN(paddr);
> -	return 0;
> -}
> -
> -void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
> -{
> -	untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
> -	/*
> -	 * Reservation was freed, any copied page tables will get cleaned
> -	 * up later, but without getting PAT involved again.
> -	 */
> -}
> -
> -/*
> - * prot is passed in as a parameter for the new mapping. If the vma has
> - * a linear pfn mapping for the entire range, or no vma is provided,
> - * reserve the entire pfn + size range with single reserve_pfn_range
> - * call.
> - */
> -int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
> -		    unsigned long pfn, unsigned long addr, unsigned long size)
> -{
> -	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> -
> -	/* reserve the whole chunk starting from paddr */
> -	if (!vma || (addr == vma->vm_start
> -				&& size == (vma->vm_end - vma->vm_start))) {
> -		int ret;
> -
> -		ret = reserve_pfn_range(paddr, size, prot, 0);
> -		if (ret == 0 && vma)
> -			vm_flags_set(vma, VM_PAT);
> -		return ret;
> -	}
> -
> -	return pfnmap_sanitize_pgprot(pfn, size, prot);
> -}
> -
>  int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size, pgprot_t *prot)
>  {
>  	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> @@ -1082,40 +969,6 @@ void pfnmap_untrack(unsigned long pfn, unsigned long size)
>  	free_pfn_range(paddr, size);
>  }
>
> -/*
> - * untrack_pfn is called while unmapping a pfnmap for a region.
> - * untrack can be called for a specific region indicated by pfn and size or
> - * can be for the entire vma (in which case pfn, size are zero).
> - */
> -void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> -		 unsigned long size, bool mm_wr_locked)
> -{
> -	resource_size_t paddr;
> -
> -	if (vma && !(vma->vm_flags & VM_PAT))
> -		return;
> -
> -	/* free the chunk starting from pfn or the whole chunk */
> -	paddr = (resource_size_t)pfn << PAGE_SHIFT;
> -	if (!paddr && !size) {
> -		if (get_pat_info(vma, &paddr, NULL))
> -			return;
> -		size = vma->vm_end - vma->vm_start;
> -	}
> -	free_pfn_range(paddr, size);
> -	if (vma) {
> -		if (mm_wr_locked)
> -			vm_flags_clear(vma, VM_PAT);
> -		else
> -			__vm_flags_mod(vma, 0, VM_PAT);
> -	}
> -}
> -
> -void untrack_pfn_clear(struct vm_area_struct *vma)
> -{
> -	vm_flags_clear(vma, VM_PAT);
> -}
> -
>  pgprot_t pgprot_writecombine(pgprot_t prot)
>  {
>  	pgprot_set_cachemode(&prot, _PAGE_CACHE_MODE_WC);
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 898a3ab195578..0ffc6b9339182 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1489,17 +1489,6 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
>   * vmf_insert_pfn.
>   */
>
> -/*
> - * track_pfn_remap is called when a _new_ pfn mapping is being established
> - * by remap_pfn_range() for physical range indicated by pfn and size.
> - */
> -static inline int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
> -				  unsigned long pfn, unsigned long addr,
> -				  unsigned long size)
> -{
> -	return 0;
> -}
> -
>  static inline int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
>  		pgprot_t *prot)
>  {
> @@ -1515,55 +1504,7 @@ static inline int pfnmap_track(unsigned long pfn, unsigned long size,
>  static inline void pfnmap_untrack(unsigned long pfn, unsigned long size)
>  {
>  }
> -
> -/*
> - * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
> - * tables copied during copy_page_range(). Will store the pfn to be
> - * passed to untrack_pfn_copy() only if there is something to be untracked.
> - * Callers should initialize the pfn to 0.
> - */
> -static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
> -		struct vm_area_struct *src_vma, unsigned long *pfn)
> -{
> -	return 0;
> -}
> -
> -/*
> - * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
> - * copy_page_range(), but after track_pfn_copy() was already called. Can
> - * be called even if track_pfn_copy() did not actually track anything:
> - * handled internally.
> - */
> -static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> -		unsigned long pfn)
> -{
> -}
> -
> -/*
> - * untrack_pfn is called while unmapping a pfnmap for a region.
> - * untrack can be called for a specific region indicated by pfn and size or
> - * can be for the entire vma (in which case pfn, size are zero).
> - */
> -static inline void untrack_pfn(struct vm_area_struct *vma,
> -			       unsigned long pfn, unsigned long size,
> -			       bool mm_wr_locked)
> -{
> -}
> -
> -/*
> - * untrack_pfn_clear is called in the following cases on a VM_PFNMAP VMA:
> - *
> - * 1) During mremap() on the src VMA after the page tables were moved.
> - * 2) During fork() on the dst VMA, immediately after duplicating the src VMA.
> - */
> -static inline void untrack_pfn_clear(struct vm_area_struct *vma)
> -{
> -}
>  #else
> -extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
> -			   unsigned long pfn, unsigned long addr,
> -			   unsigned long size);
> -
>  /**
>   * pfnmap_sanitize_pgprot - sanitize the pgprot for a pfn range
>   * @pfn: the start of the pfn range
> @@ -1603,13 +1544,6 @@ int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot);
>   * un-doing any reservation.
>   */
>  void pfnmap_untrack(unsigned long pfn, unsigned long size);
> -extern int track_pfn_copy(struct vm_area_struct *dst_vma,
> -		struct vm_area_struct *src_vma, unsigned long *pfn);
> -extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> -		unsigned long pfn);
> -extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> -			unsigned long size, bool mm_wr_locked);
> -extern void untrack_pfn_clear(struct vm_area_struct *vma);
>  #endif
>
>  #ifdef CONFIG_MMU
> --
> 2.49.0
>
