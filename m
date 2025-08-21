Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78885B2F4D1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 12:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A37710E131;
	Thu, 21 Aug 2025 10:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="mPv9MjaO";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BsiUNBFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2AB10E131;
 Thu, 21 Aug 2025 10:05:27 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9jpi1019835;
 Thu, 21 Aug 2025 10:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=1p/ljejplOhmFsx8Ny
 CEQuZ7fLxWKEkQuyyzj8Ybq+s=; b=mPv9MjaOC1BybflYE4ALLUfu2TDle/YdMu
 xt4iVLVI+13eO26SGtYb1+XH12lvBqp9lZjGGlaFd+Crg+EbzdrByeWMjtdgWfDU
 sFsGNtq6HV28ml5p7sLqMjM9BdvLh7F7A6HPYsqCtC2vrlXuq9tjilIn1BdXxgaj
 eNo+F0Zen8iFtyOMf3QadqqOtXem7924sTHjkRdMf2nkx8tth2BvGy3Nj4w/htVh
 h4vWfrIm3rBFq+JfHZCat9FviuoWsnkn4pnUxOLa2RErLx6hNWAV0hql2OI3HoAz
 IHxD/FqBMy1SnWBPbWh9Ii1Wy21dRwf7aXLkGZuUT+fJw3qOv6hw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0tqu7eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 10:05:16 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57L9dTKG039497; Thu, 21 Aug 2025 10:05:15 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 48my3rw1sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 10:05:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dx2gwMSddbbp3lrAljaV3b0pX+8HV5hBGArRKquKKKSrrJKOQ+zPQPeA0TIe2t5ulcxpOmccCZj3CXVzYDqB1L+EPu3GAzUH0CzN85GAF7EGlC11EPFFtp+ggIKQTWVzDIpyLsuVKk5WDZ9Mia6BaIUFOxOTSGln/Npe9aBTjObi8jDUCUGVKT69sAYfiIRlhEtqL6eHyOavrt+Zb+FsLGKexoFkUjwpBsoQJm2hZ6dFlb1AAYOCzQ+eHRiVGbu5GO3nn6DvG+Ae2R7JfDHT20E8rsWjs5NsVpmykWu3wustTaw2XZqTEGBSSSLlvOJuGinBugfd2YQzgJWE/4dg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p/ljejplOhmFsx8NyCEQuZ7fLxWKEkQuyyzj8Ybq+s=;
 b=emg/gc0PCEc+ns6/zbV3eVjCJZ4mtO12M5LTZ6YpmMcCPbRbVIo/x8JCwepERu7HTSO7kfX7+TABrdD6TiIYbRzGIiG9lwtAVL6xqGGvJJI0A446mtfBCd6uWK6yXC38C2Gq3DOFmIyO+M3QP9y+Uc+VFMmYp77AWTSwLZV1HlwqzvDXjhb26w/rDucDtNV2eGxfWEjIRnYOk0/ZQnGPuvkmw7poRpTJsUAlO3+Gpg1JAXve07Vsvw5apsl7LFdFBVakdsr0Lo9sJlYGvvl47FfpiKMpTEHHHM8Jd+RwWbxTze+9PgTGamL5D/Dfls3XlCgON8mf9YTZJ7eFvVAIeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p/ljejplOhmFsx8NyCEQuZ7fLxWKEkQuyyzj8Ybq+s=;
 b=BsiUNBFMZoXcnvJmerSnbyfl3JEfx9nyDfIQds/5JJc190TGkp3YN3kK560qiR7hlzdrF823gjG4MnP3SyM4Q6wv542ELG/SamLnL7j6HaW3OT5m9nN3TPpfjXAa85NM2df0B66Lpw/Yj9pOMS+HfJXG+mMyH0e2VPg/0Vdhtck=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4758.namprd10.prod.outlook.com (2603:10b6:510:3c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Thu, 21 Aug
 2025 10:05:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9031.024; Thu, 21 Aug 2025
 10:05:13 +0000
Date: Thu, 21 Aug 2025 11:05:09 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org, airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Liam Howlett <liam.howlett@oracle.com>
Subject: Re: your mail
Message-ID: <f6f85c73-2a1e-438a-82c9-f3392d91020c@lucifer.local>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <7db27720-8cfd-457c-8133-5a7a1094004c@lucifer.local>
 <82e5e566-87e9-43a8-a0e9-00656572d65c@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82e5e566-87e9-43a8-a0e9-00656572d65c@redhat.com>
X-ClientProxiedBy: MM0P280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c64fcf-2fdd-45bf-87d6-08dde09a3849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bXpwPk+Cp0IXlSxop+9B89g/hqFSDrkgf7pWqDEX/AaYNeS/rTWtao2PU217?=
 =?us-ascii?Q?7IVMePMRPcbNIZcWS9paLCy+Qj/s4W3lRKzgBojP/OJEd52sKb2c/AXCYwuP?=
 =?us-ascii?Q?T/EzZMuWrgRz4F88OWeUB1o3JaW4thptLYbziq0zsKmFEgMiJLY/FzFXC+ur?=
 =?us-ascii?Q?6SU9Pkn5Vj91U7zQshLULQ822NrDaxJn0njHr0Cf3EuDr65/Won3csr8/JIW?=
 =?us-ascii?Q?48kqbARSOZp7j3AMYsjtyGOUcrXDJHUjouAnnF4KEkiEyg7QCQW0od522jo5?=
 =?us-ascii?Q?5t3+cj3cMj8wF/lh0zc8lQ+40dCW9sn8z8HF35B7oNxnZWA/MwqKUCShAUXO?=
 =?us-ascii?Q?c6Jl6fWtjSKozF8zM21amaKoK4aPkIuyyOtPFQTEMQr5HrnfVVWUq10W6p5s?=
 =?us-ascii?Q?DrWNLy0PvSs5OiusxDIA/GYu4ofsBvoWeuBkB0wU6TUs8jQBB/87cNZszrFf?=
 =?us-ascii?Q?2qMnOQ+eZXnDKEDPB55rqS7eTWgVkGLu0xZXKGDmwnq6OVha0jBk7NPofjQ2?=
 =?us-ascii?Q?nSMv7aBjvsWTO5ItnkZPo1nbS1zeZzNsaDpgvuGkxrLTA5QFiQPZvd4h+7qG?=
 =?us-ascii?Q?XmcF6Kili1kI3ZBPplKpsB0RucZw49HLKrQFi4aDxOcPNmxNKkJs0daV1AhM?=
 =?us-ascii?Q?2C70VT5Duhi/rfavBxIU2E2ASCSP2vkdSgxwyBYwkGPVncuhitsSd9coRYpb?=
 =?us-ascii?Q?fhZCQie7lJXh8ywxQ3U55x2u/GTk6vMKoPIOcvO3dJ0FeUMDjNi6Pl2WvxMR?=
 =?us-ascii?Q?VksdNUYLyYX8SVn04EDziYzDmxEi61qFQskMOCyx2bsAojx/I9w2uWV3HGPP?=
 =?us-ascii?Q?MRw09CvFkPFxLuwk9A7QGMUzJLx3F39nm8/6LZaUs1ovqw79KNujEvixdf2a?=
 =?us-ascii?Q?YTmjwNxNl+ox/eScQeRpmyqxHVqNt18TsJTv6ubi9HCZGRfa6D7QOO7bwDGf?=
 =?us-ascii?Q?d/CjEYDbwl71QrNQ+/mcoXNgYc/3ZaKp/pB9rzIdeouRzxsBJto+FIkgoMpE?=
 =?us-ascii?Q?+i21xvVJGmE/yqYJQqprFxUbtHGrAL7DHCxU3R+BWHjUMyZ/O9leIxfrbWcQ?=
 =?us-ascii?Q?LyjoVAX7qvBVCRtHlBjmuJDr8Vvy9mZRSzVanBW6sAM6YTQ0XuCFH/+94hab?=
 =?us-ascii?Q?ercecuEP856NZldhMsenRprA+TtGIE/a9zLwcVO0ErQqvkh9ecSX4MrgXh6N?=
 =?us-ascii?Q?r5dljHUYrznRPhiF3MCOcNnhRden5yLjhr/mCY26bbiR4o4mujrQiMLAb77P?=
 =?us-ascii?Q?s/eUIWE6jywt4BPwNuU5baZEU1bEajA5Ax8gtuNeT39c8U2sTiXHd/lpP4FE?=
 =?us-ascii?Q?XWZmPqBOx61FMLHoR0L31Pi8Xtsol/J4ZVdU1oYSz1Bue6v7SNvLdFGpVtSt?=
 =?us-ascii?Q?igtdFK/OiizDWlbUV++9hpwTA7cCj4HYZSAR5nXCW+/no6qRyds/Bi3H2N8T?=
 =?us-ascii?Q?9gIuz9mU7AA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bQnajexhJo2niuVts5Ma4QTSTbNzGrgfL7UHx8CrMDAnqZ1HCT2LeVXoel2z?=
 =?us-ascii?Q?mkBn887GNDyUczgT1vMUpQD+rUDQ8tyPq/ZSqYpt0OigIfE9g00AIS6Yu/7t?=
 =?us-ascii?Q?r2rPdzCHFpUBIqmfjhkQEG2Y5C4JnHD+HuYh3bycGe9Gb/d/3roFGbShvGJx?=
 =?us-ascii?Q?dTiya2bTM5PNyjlbt2G8rVKAitOoJ5VBYkn01Qa0xt+zis/GcBNlpGCmVzLR?=
 =?us-ascii?Q?J5HdzQAQz7S+HzbSdeI2uGh/tUsUbzuxPsBzK7ElS4uJcKHzTb17Q4LL6zhe?=
 =?us-ascii?Q?hESiA2L/7byjmlN+R1OH5TyneoZ6kXnkw9eiYJzRko7g441E+wgY6ci9DPeW?=
 =?us-ascii?Q?dOZ1uLUoPAFe60KN5CYgqNEzj+82GSFpP7D9mIL3YnTjgz1DNM9QAYU4w67C?=
 =?us-ascii?Q?6Kw/EnhUrcCXwgR3BGGZOCLj51rti1BEPQsngoR8eIUq9S+oZRFZeyMiuaR+?=
 =?us-ascii?Q?gbIvnkrXw7vaKFGzt+hoF0XoOP6CoTj33zZAK2TdxaDsALStKbzpQ6GpGsZc?=
 =?us-ascii?Q?AtKsQtUsecIwxlVVQPeX65J8WND+XPL9nWsgmf98Cf6hzMPIZgHyk0i1Dd87?=
 =?us-ascii?Q?0o3+zghKAu3ZV5UEX5ybVKp9ky/usJyPEx501/gxVpE3DBBUuz6bAOgDNI8O?=
 =?us-ascii?Q?XNkdYZMpn/a2sYmIRJxqWdfKiLDIADlBbVfEuOKRrN4KdiS+XNoay/3b595s?=
 =?us-ascii?Q?LlKB2P3AztidH1zdW8i4Ta6Gu6J4ojNm+P0HoPnHIQcyZC7BhT2bqPeul2cc?=
 =?us-ascii?Q?I0sn8RCOJqmF3L5VypnLUtUgGAhQP82E5NvG7roAngI7NdZMfEkZvYGmrj4u?=
 =?us-ascii?Q?ILfQZwS8WiL4qBUdhGQR7CQ/vLhjbyNpIWuwqQvQm4DUuDGVWB5rKUHybB5O?=
 =?us-ascii?Q?pdZKsv0h40PrG6OJ6kqR2DCKvaSIx/P7vNNwb+3TF2cyYNK70je6zF1yZirx?=
 =?us-ascii?Q?r4q7ZiuhrED2XJ9nzEuTEJHFadesRd9KwCyVJ8B0HjL24fRiQxWwmD0t1Rrh?=
 =?us-ascii?Q?WRjMiRBTiYWJgi1Z/9uz1XaxDU18cFyipgnMWhi2z7Bzp29s9vR9qHwiet7l?=
 =?us-ascii?Q?a0iq16qj0SG54fCUXOvl5UlsR86sH9856R4D1FawTJUFhDaHz773ALvcHI1P?=
 =?us-ascii?Q?zCKb5mhfTnFwbKFNBnTj3I4Z/9gkGuJg30MQ2f6XIuXf09vS+17cWvwkoljJ?=
 =?us-ascii?Q?KUF+JUPZv5WymC5SX8nDwAPUj6Ju9ajiz7ReByUq7wriLh/ynwia2tL02/Ki?=
 =?us-ascii?Q?8XtQIWiX8YOlkNDVxPdjyQ7yEIJ7dIfiilCB9TeV1xxo6i4+B8xhgoq4Gyg0?=
 =?us-ascii?Q?chahJDIkJ9E3kBeBPwMAOwMOpfCqnzb4B5P5KBDlrHy2+4xcKpSgnpPtF1lo?=
 =?us-ascii?Q?YPlcp8GgnQC2H3b0GdAhPVVCB+kherAIqanQSS+qOwDv8rS2SlJloBzCPtyM?=
 =?us-ascii?Q?mXYp8rDLgdCMtt3DbHZNg0qnSL0nIx9TGEiwJdeGlXkwq25tv8AG2h6SikYn?=
 =?us-ascii?Q?nEEEqZAyQuRc8K9EzPGQUbJIm+v1O3ugq2YCz91S+mvMB6ZcSPcMWAQRnJdz?=
 =?us-ascii?Q?z/Go/+1gjwnKDaLw5B4/mM7CIbe/mMz/oigjhf37r6n5bRx6CTYFioHR8A86?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ysgA5u69Qk0deKxVxxkTuv8nSiaysQqv4jfNRMsbZ+0cxGf54Y52Pd31xpB8vAovfVtPdX2CA5U1Zd3yZUNav943PFmaDG7p5aNsHCYzmXWINVFS01TwBWmhjRMf5GGnVFkrISpXF8RZDuYZwq/aqWTBqKEUG2i6Mt1RQTMXFrbZT/9tBNvFOBbnM9SB8cEYK3utQ1Riz+XyFO1Enm7ODCUnpW/pF4sUFYTtDRJgDdhCtZefpUJIEFdTmsN0vnosJ2qAYxc/t9AhG1o7ZhZ+3ECPzel1VryIRFJZKKH7CBRk9+Zz9ZvmH31zQ72R1xNFTzn86J7L+suaLIg4/Cg/pt3TLlGqjHmpK+rYCyD3UFqBYPCnDK/wFenT6vp4QdobH+sjOLmVMsNQIl2mQQX2TifnYW9LEYhq75acuzAe7Zd7M3KL2cLhYqStGmefPR4ISWJTquVqVOPm9dQooyFVcq196YMYXt35qMjqlIB0ZBrwptm36lKmmSChGpTdR92m0tSE2F11TfUGnD9pPx+BLq7Iqo4CyMI22yUu2OSKUcqeFrm2nTxF1R4sNC2fsIocnRsea1HIN8r5YXrNVU5iPlig8PFjBAGXbcf0sV85aW0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c64fcf-2fdd-45bf-87d6-08dde09a3849
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 10:05:13.1086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW7cEyxeEaT1r2JIvDoy1gDAnURR60VETwlsLIGBdbCD6Z3rCVLemjtnp72Krw4vcYhhMWNVhw6CK2JbfLp6KwBXApNG+C3pVEOQCEgplOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4758
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=613
 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508210079
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NyBTYWx0ZWRfX6Dgd0n4YFf9N
 Yzx9RpwYGUwbDZBKqWOE6Wyd+9aDDOd8v+xE/lGGn9tIxeqx/b7l1Q8/xXhAcxeNID1vPVniVhM
 ATgpiyhSJYYZgTGHaBib3+8ZNQJmYsxeTC6FMYlyqpj3dgN91kazu0C/N6L17iZzTJQerpCvwb6
 1pAQM2mF5yjsvLRV6keC6ytzrXpWgZhhRKSYwiIeb6+F6spl0UWSYaJkBovaLFWb4IYDCs/07SK
 e60oMBHuFzDjLaky1PbxnEM8vADmgUmfV/T57u8QEsuMH6NsyDfk9xSMHAhJ5ihFkyEu3ihrq1r
 44TaxQQIoS9QtMwbhZmi5eIjvobJYJ4uBmDVRn8IPh1bPt3aPK78w2zxKjWLA5vc9CnyEl1Y9g1
 Ojg/NtDWxsMDdSWEKg0N1vGBy8o6Eg==
X-Proofpoint-ORIG-GUID: sRVq0ZWLg_ezG0v2xiFImryV12WMesau
X-Proofpoint-GUID: sRVq0ZWLg_ezG0v2xiFImryV12WMesau
X-Authority-Analysis: v=2.4 cv=K/p73yWI c=1 sm=1 tr=0 ts=68a6ef5c b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=_JUs_0rQ0FDngYdaXIoA:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22
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

On Thu, Aug 21, 2025 at 11:30:43AM +0200, David Hildenbrand wrote:
> > I will add this xen/apply_to_page_range() thing to my TODOs, which atm
> > would invovle changing these drivers to use vmf_insert_pfn_prot() instead.
> >
>
> Busy today (want to reply to Christian) but
>
> a) Re: performance, we would want something like
>    vmf_insert_pfns_prot(), similar to vm_insert_pages(), to bulk-insert
>    multiple PFNs.
>
> b) Re: PAT, we'll have to figure out why PAT information is wrong here
>    (was there no previous PAT reservation from the driver?), but IF we
>    really have to override, we'd want a way to tell
>    vmf_insert_pfn_prot() to force the selected caching mode.
>

Ack, ok good that we have a feasible way forward.

FYI, spoke to Peter off-list and he mentioned he had a more general series
to get rid of this kind of [ab]use of apply_to_page_range() (see [0]), I
gather he hasn't the time to resurrect but perhaps one of us can at some
point?

Perhaps we need a shorter term fix to _this_ issue (which involves not
using this interface), and then follow it up with an adaptation of the
below?

Cheers, Lorenzo

[0]:https://lore.kernel.org/all/20210412080012.357146277@infradead.org/



> --
> Cheers
>
> David / dhildenb
