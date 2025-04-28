Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A9A9F9E4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90B110E6F0;
	Mon, 28 Apr 2025 19:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="KHsigtuE";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="grq6Of2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ACF10E6EB;
 Mon, 28 Apr 2025 19:47:46 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SJiLg8014309;
 Mon, 28 Apr 2025 19:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=SmZhARRH84paigH9Lc
 D2MSM5GSzrrHwosZP0/IvOwGU=; b=KHsigtuEdtVLepkKIN9pB2nWLBo5mphx3T
 hf7mn3UmezDXH4njHu3LWywIOMXfRMhu8s6jtXq6l5qLhGQltL+Utgh/k4zbA0DU
 pclToJ0AnkwJtqFcrkwA68tCUzvcPtvuvYRMPQCdPIyEAvNbQL6Pik3elw9a1DFc
 sM4doXhWGnNb/W+xAoVLa0YWw4RI/N1RFZQ1tcYQiT2fJw03SzCmcLnhPSZC5i2T
 tw8aoEtKC8LrvUv4wBX0WRQSqrp5SfrVaAqQTPaU1gLkTyVOfL2pkpRCvK45WZ4w
 ZdphGsJnZL3lF1HnCPvPMeM/uGJVU0qHbBVED4zNG6Ird/cKTUuw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ag38r08k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 19:47:16 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SIDX57013788; Mon, 28 Apr 2025 19:38:37 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazlp17010007.outbound.protection.outlook.com
 [40.93.20.7])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8w0vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 19:38:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMY85TOmv0p4VRnFbP55HBse2n2ctm/XvF7dX5lH0g4OkR3I6d5psblnbQ9H0Xu35WliluC+g5l52ZbrJoZvHITPtpBMRBTcSGqIyTpm4h8tlucFCuHLXFLCCCcH7Q81SfhtoEY9OSUrE6nJSIuUW4H3amey84MBbNm6VonjQbOK7XiP7e+vxw6FQXLB1tWfuV9cmGmrpqh4qxGSTh3/S9jSBPqskGP1MZgphaupItjEEw2tVzQ31hBKLFFF7r2cdPYOY2AzzucSzXfrW6Q9dINXDFqIOGiQK627D51OMZ158Y1XKh7DI7D1tQRTYRhxgVUyMICTA44ZiBd+RVEzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmZhARRH84paigH9LcD2MSM5GSzrrHwosZP0/IvOwGU=;
 b=kOtSRo/UelfxZf0CJlVHYR4L1EvyMOdYuiMWaBPq1jdJ3LOmwJm2E0/WLqV1TcQNLq2A9z2nJI7GjBmt72JdhHIOAzHkR8SDMu+m3xnjwp8LUr/9tg6XsJiqIUyweW4MbH4axOHxZaJY2DrpwrEOjHtplEuNEGdvRWs4MJEjD1VVlDyW/oZl3VO02y49Q96f116dmD3uTvTxSA6gXMRNoSGhVN7N/ugMVZT8c9YlwJa/Uky/N+Soxil9K+NgFrSjWrz5rBTMqCtI/4LPtvhDoikP6PmeMhQYMfSAyKGdDaMsHBa28T5hvFl+reNcBUbLoo7sHT014NO437+tKyrFcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmZhARRH84paigH9LcD2MSM5GSzrrHwosZP0/IvOwGU=;
 b=grq6Of2kpdK1CgHxm/QATNRLJWvdWfkyisBoDAhypzhyMhQCMhaO3yrRdS7ilEPbeCQlrDSktCzMQOhWJzYeSQOEcG7z2oqhj9M7894ePHa+UoEst8Ah9T/U5ENM9/9vTiQgSW4MvK9/Ha6yKGH+9jjAAnxjhtpowrqAMVjDGkc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB7012.namprd10.prod.outlook.com (2603:10b6:510:272::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 19:38:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 19:38:29 +0000
Date: Mon, 28 Apr 2025 20:38:27 +0100
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
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <8131940c-8b22-4856-947b-62ca64e2f417@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-6-david@redhat.com>
X-ClientProxiedBy: LO6P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ff72da-e21b-4b0f-aaa0-08dd868c40cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mkg8tBCNG0RS7I5PVsxaj5r6uIH442tLftFVlLxu0M5vfLQ5Z7JIN1VN5rSF?=
 =?us-ascii?Q?u4rVnWmrUsIHCr8xVLMLCe4LC6GB8+B2p732zLzvLm0LLNzL7ADH/gld4qso?=
 =?us-ascii?Q?MQI0RNzBnII6Ya4kOAqCuK/L02XRsP5eAaE8qOs5zFrHIQzFE/qyVZRX4wm7?=
 =?us-ascii?Q?zb22nIeZ/lw32Kvyhg7gDAcE3IlBonO6WAKI5uiQw/9O3PCzpiqSJixH0NKe?=
 =?us-ascii?Q?dyHYw3Pg4bw0rGry/mlEgMOKq+FZ+Py5bnmBFntVsqveP8AT4VZAG0PhevFQ?=
 =?us-ascii?Q?40SmecEnZiQUIN1Q/n1q9Q8VZVpqwkXuQotk0wevZ+G8BvXZPRrGSaX/L4N5?=
 =?us-ascii?Q?Kpr/mfwG2g0XIWC4gwnJL9KpsRoShReM5KdE2MS/QXjDTYQZWuApaw6cYy1R?=
 =?us-ascii?Q?u8T99yhRqH4g9jp0WmwfKHrjmd1iMJlHvoP6TldWkqnf6UX/I4xR5R3VRGKY?=
 =?us-ascii?Q?bL7JG2Nuk+2TZuoV+1uEgYFThQdc40VcBI8BUVUwC98pBnjTgI+PRPh6fhUE?=
 =?us-ascii?Q?V3aUK2WYy9Kp+5YQlVloMGNM771BVeVDGVIIEse9rNOHa3iRGAN7cNrXRJNM?=
 =?us-ascii?Q?h0g+DRKT5f1OOE2a6eLWLOrD/ZAPhzE3zNrLC1fNgdIvo46t7fQH+jbauoP/?=
 =?us-ascii?Q?48XbocZb2h2yIEqoLip0FsFrC0q0AWSaYaSnO24zqGSiy6n+x821xExEp2Uv?=
 =?us-ascii?Q?jpmGdFv84K72F6rGXWO4UqzAB6t58dFhJK+GhuwsS/JSq9oqHp0/YMffIvM9?=
 =?us-ascii?Q?nrmWfyn67+VfDEkUS3O1eyxOJheaZTH5klTdN+c0cCGziEYlmOqbMLGw6JTH?=
 =?us-ascii?Q?sSMZVaAqBYg2//yW378l9+x8DVasZJYx9cm1mHeV27dY0btWJIieLqo6BD15?=
 =?us-ascii?Q?bKDVmgO1WDGNT0UT26ANWEB+XRtUN3yewD+6D6vzq2f07S/vsN3fKMf2w6Qf?=
 =?us-ascii?Q?KPRVI5lTJGgzaWIZw/Dxyq6j44+XaSIB7ji8LlT8QpHgghB9IUdCNuY/hwfo?=
 =?us-ascii?Q?p7wC4hLNAxoTNi6w4jvQ2w6vMaWEw6gGXYwSv6sV/NdCWp/rlyfUGaebpG4j?=
 =?us-ascii?Q?tf5A2wUVgisqCh47h1p85bp+7NEkq5km+H6NXPEerLhsxAdhKBeJCTm4bIEK?=
 =?us-ascii?Q?deE1IP/a3h+mvOMMW+E5ZI00nFD0iCZVpi//mr7agoswk2AN0gtNGvJE+n0/?=
 =?us-ascii?Q?P6PPQCQgeoY9t7AscgMmXvaWqopRt1MZPYVL1g8eSptmWjewGfL06RjJFaB7?=
 =?us-ascii?Q?OtTTuKl+4wOTLW4snIbsFqToTO9c1S49CN9pqN0eBEzUrsNieHkFKSHbB6dr?=
 =?us-ascii?Q?VeDzBoerx/n4CoLrhT2vkNJY95AikthGxGD4PB3rv3pVDOQZljuor2QuLMN1?=
 =?us-ascii?Q?E4IG7+fYjfm8zWiroHcg/zXPMYO+5XzYYNu2ZJg/GbnxZEZmjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qs1mqGEpPufk6Z1nV5MMNEz6RVLdxwTLLMkyDtfizyXkg4c9JRf6lsvc7PJl?=
 =?us-ascii?Q?vepHt0OIAwHuR3OSqN2Bitfqnm9FjewbK8w+g5rqZIZEUjfd4ptiCwwi6IXL?=
 =?us-ascii?Q?BN0E+KIg5H5oxzTe9QG4bsN0c+VsnpWSRuytBqR1uX0dPLCXG9cou4tcpl8X?=
 =?us-ascii?Q?qMVSLKziG5x4AhUfGN/xeIPM3/JcWa5RfDqAbuStBdCC9zg52h4Ht675HM/0?=
 =?us-ascii?Q?dsLI0PUjzvk7KTIWGFlpl16mPV42VA61r24lcrvWgk25cbLgi8O3Oi/gVxQD?=
 =?us-ascii?Q?cuu0uHGlaTBoKZYT6uGaBBPM7n5NCG4ovdZHMmgheUi6nMyleOak7TzYYQKd?=
 =?us-ascii?Q?QnFYJ+LFSdPoFgN4IdtoeZgy4mLdj/86p/Vc5MdMbyuwL65xGoO/R0Aga1md?=
 =?us-ascii?Q?LKwXefFwvk0WWpey0YXcoAYzQ87KDqaL24MIzCUNuWGQkVglJ/20+rMkrWBF?=
 =?us-ascii?Q?5EWtpPPNvjcbEo/pm7n8nFSyF7+tN6VTgR0gdL9oQtPua4Oje0ALsrtp994j?=
 =?us-ascii?Q?ClBuZhZ0WyIVzwOpvamTRrYwegO52L6Sd5rzaC9hN2OvqaZoMZDDpcVratyx?=
 =?us-ascii?Q?2fiFW+ThtFRcEu2xnREw0c+hWMAhef5xJMAPz3APynDNaftIgfyuDZueSx76?=
 =?us-ascii?Q?h8JCO8VxFUXZftZhsFgp/RprokRc+Vtu7yIQbNYUQtjlLU8vVkHsE8Z8XSEX?=
 =?us-ascii?Q?atZVU6cIDXXN8HxXS4notTf3fx95fvx5HfydWA/W9EhmZe1P/JfmymVr3sAL?=
 =?us-ascii?Q?pBAOxOJ+Th5Lk+m68AHUl3RAYGGCxWvftACvWXkxbkYM59SlEz+zdqHLi5E7?=
 =?us-ascii?Q?pwfZsABGdMcOxSTJb//tQTVviIw/4GWR7JnjzuVt8I3/tkWKPqlsz3/SfZCN?=
 =?us-ascii?Q?2Pl+LRkxa9/jIqT0dQuFvJm3IthSCszoUjo9TBl3kJeQtANRnEr/Pv3kCy2Z?=
 =?us-ascii?Q?6WGaXu4LbKhKJyHEQVdCKIxCO8Tdd+AuNsJiG95VP4hW8TV1uuRwOoJwuyva?=
 =?us-ascii?Q?2BpG9V61BtTDHlf7IXiHiG1alhjPh8vZfsYSEw4DUZhH15YnpKbxCIw2AoXN?=
 =?us-ascii?Q?dW2aEBu4xE6I6+sADU038i99wesJtVXxVdm957MSTkYvF9aYb9m2P1YiJ1rw?=
 =?us-ascii?Q?PJAJGX8tB4ghxPJ3W4VAnGy/GiLGmJhDbJC++uogL4IsZyOxWBji68PylFD2?=
 =?us-ascii?Q?VWK3tm9G4L8V4r5n5f6PLX1sBOtYMKf4mVPh0Rvg6cdpDn45gD4rY/hcUPo+?=
 =?us-ascii?Q?6fvgOQrcHUeqKNWaEtevnkGmwBVNS55eCEJ5YVOeRF4PnNSzLsnoIpyvUyzh?=
 =?us-ascii?Q?9vIyzcRDwNwX7GCj6vgQs6ox0oYAq/KF3MKN2d6xLtQFaFIkHbyzLPDpkYt3?=
 =?us-ascii?Q?kJcnD4Up/RsqRXmM4p6hfPu9wFuzZbHlwWxPbcFg8+WNvFWohZ4ON86WgPgK?=
 =?us-ascii?Q?VpYCzWB4VeAsw8lkxLrpdsQOuRw9+QcigZcmYRY9/4pX0QLeb/IAcjCQeC2F?=
 =?us-ascii?Q?bkK1fAu4qr1DBN6UU7z0ygnoU3ooB0AUi4wbkLl2vxIscapqoxi3qONqJHdB?=
 =?us-ascii?Q?c4WXTc2rWol72I943qGop5aGjf5LSD/X7VleRi4z3qlpkOkZ7lPycz8rjnH6?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zfdaliorWQE5T2AaSrHwqZ9sT0xQ3MwCawwPv8owkpe+/AfIUNvSLoR5LkssD9xezISd2BTqq4Q0hnZcmdST7TU+yGXJ4vtj8AguL6/q90d/MDAS3XQCzaAl229IvWweflZCRmMkacFrR7ytVJoYgyIyeH7dIGPL+BGhxAunvAUOCddn6J42Nl3TBhEBeSb+/zY623Pm1/aAvD7HzbzQbcMNLTMEjO4EScDpZogfZlVKymmp7OPUO6YFB7yT8W1eh3a4Gnpd0zs63wbDv4FDwP3kuFZjbA5hTk35Lfr4fcnVWG3zNOh7bCjXj3+xj+KBc4lbrlh2KG0FW4YlisNqizXQ3xcgjm3yJWkK0ZYJL6MBAG+kr7Vy+MzKyOY/w9KOesBStERf07NKZjeRd8y6pIKR66mmvHubFRwcDGzwtC7FvJoFDYysU1aqfquQcWi+UN7Oicc+EGzzrYBlyc4ytV/qhDbuAhqGBqaN9O154CmP4qc6ycOdxnVbkoq3JzZN6v2rD51aDhfMp6diC6sFbsL1Zg3wuj5u3WpfZBTOP4X2AfGfZD2Hk0/BpcVpkvvFzFB7yuObp6qgQHlwdrK+BFT+yhcXJZb0VGELjzDTfCg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ff72da-e21b-4b0f-aaa0-08dd868c40cb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 19:38:29.9212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikeYO4D+/fS33VxxlSTg6SjIzY3O3tAb8wGENwxPr97mBFWI4/gL4cp4t5Xix+i5+lKap7qO8YbfOgFOzt+jmCwVLNtnpflLVSt3Am07mGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7012
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280158
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE1OSBTYWx0ZWRfX+dZ2ehYBKvEq
 6JkmTz7JxiQxAA0or0rx+qhDJZ+LiM+SvMOPkByYlVV81AmVFGubEROejg+btZwWqbl5tBE8x//
 R3s7uESzznSPEJEkSIpaF/meS7TUpZYt1S+t+0DQuhZASLymXMh93HN7thoqqnZGljil5QWMRjZ
 X+Iig2ZfhGbdUa8BLsD2lJAJZ00Vy1G0u7EZMVzv+9JRXJPauAdvriLhVB6KYfN4Krf2ANeFSgF
 9Ub8L8pi3aqZWr/5OdgWw42lLhBuCBqRTGQSAwV2LtI6lb8qlXeav4CP3Wh2OzZG0xhroUTRgDr
 RQPF2DNyTsq/TMfBSYZPS7HEUVqldRiTqaluL5qS6xAVHck5KfJ+UmkaWkDbq0TUrssylDzAC+c
 S3LMTHLs
X-Proofpoint-ORIG-GUID: 15kKXl2xvTADJdKFEnFOIXJZwHY00EEe
X-Proofpoint-GUID: 15kKXl2xvTADJdKFEnFOIXJZwHY00EEe
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

+cc Suren, who has worked HEAVILY on VMA field manipulation and such :)

Suren - David is proposing adding a new field. AFAICT this does not add a
new cache line so I think we're all good.

But FYI!

On Fri, Apr 25, 2025 at 10:17:09AM +0200, David Hildenbrand wrote:
> Let's use our new interface. In remap_pfn_range(), we'll now decide
> whether we have to track (full VMA covered) or only sanitize the pgprot
> (partial VMA covered).
>
> Remember what we have to untrack by linking it from the VMA. When
> duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it similar
> to anon VMA names, and use a kref to share the tracking.
>
> Once the last VMA un-refs our tracking data, we'll do the untracking,
> which simplifies things a lot and should sort our various issues we saw
> recently, for example, when partially unmapping/zapping a tracked VMA.
>
> This change implies that we'll keep tracking the original PFN range even
> after splitting + partially unmapping it: not too bad, because it was
> not working reliably before. The only thing that kind-of worked before
> was shrinking such a mapping using mremap(): we managed to adjust the
> reservation in a hacky way, now we won't adjust the reservation but
> leave it around until all involved VMAs are gone.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/mm_inline.h |  2 +
>  include/linux/mm_types.h  | 11 ++++++
>  kernel/fork.c             | 54 ++++++++++++++++++++++++--
>  mm/memory.c               | 81 +++++++++++++++++++++++++++++++--------
>  mm/mremap.c               |  4 --
>  5 files changed, 128 insertions(+), 24 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index f9157a0c42a5c..89b518ff097e6 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
>
>  #endif  /* CONFIG_ANON_VMA_NAME */
>
> +void pfnmap_track_ctx_release(struct kref *ref);
> +
>  static inline void init_tlb_flush_pending(struct mm_struct *mm)
>  {
>  	atomic_set(&mm->tlb_flush_pending, 0);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 56d07edd01f91..91124761cfda8 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -764,6 +764,14 @@ struct vma_numab_state {
>  	int prev_scan_seq;
>  };
>
> +#ifdef __HAVE_PFNMAP_TRACKING
> +struct pfnmap_track_ctx {
> +	struct kref kref;
> +	unsigned long pfn;
> +	unsigned long size;
> +};
> +#endif
> +
>  /*
>   * This struct describes a virtual memory area. There is one of these
>   * per VM-area/task. A VM area is any part of the process virtual memory
> @@ -877,6 +885,9 @@ struct vm_area_struct {
>  	struct anon_vma_name *anon_name;
>  #endif
>  	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> +#ifdef __HAVE_PFNMAP_TRACKING
> +	struct pfnmap_track_ctx *pfnmap_track_ctx;
> +#endif
>  } __randomize_layout;
>
>  #ifdef CONFIG_NUMA
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 168681fc4b25a..ae518b8fe752c 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -481,7 +481,51 @@ static void vm_area_init_from(const struct vm_area_struct *src,
>  #ifdef CONFIG_NUMA
>  	dest->vm_policy = src->vm_policy;
>  #endif
> +#ifdef __HAVE_PFNMAP_TRACKING
> +	dest->pfnmap_track_ctx = NULL;
> +#endif
> +}
> +
> +#ifdef __HAVE_PFNMAP_TRACKING
> +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
> +		struct vm_area_struct *new)
> +{
> +	struct pfnmap_track_ctx *ctx = orig->pfnmap_track_ctx;
> +
> +	if (likely(!ctx))
> +		return 0;
> +
> +	/*
> +	 * We don't expect to ever hit this. If ever required, we would have
> +	 * to duplicate the tracking.
> +	 */
> +	if (unlikely(kref_read(&ctx->kref) >= REFCOUNT_MAX))
> +		return -ENOMEM;
> +	kref_get(&ctx->kref);
> +	new->pfnmap_track_ctx = ctx;
> +	return 0;
> +}
> +
> +static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
> +{
> +	struct pfnmap_track_ctx *ctx = vma->pfnmap_track_ctx;
> +
> +	if (likely(!ctx))
> +		return;
> +
> +	kref_put(&ctx->kref, pfnmap_track_ctx_release);
> +	vma->pfnmap_track_ctx = NULL;
> +}
> +#else
> +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
> +		struct vm_area_struct *new)
> +{
> +	return 0;
>  }
> +static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
> +{
> +}
> +#endif
>
>  struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  {
> @@ -493,6 +537,11 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
>  	ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
>  	vm_area_init_from(orig, new);
> +
> +	if (vma_pfnmap_track_ctx_dup(orig, new)) {
> +		kmem_cache_free(vm_area_cachep, new);
> +		return NULL;
> +	}
>  	vma_lock_init(new, true);
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
>  	vma_numab_state_init(new);
> @@ -507,6 +556,7 @@ void vm_area_free(struct vm_area_struct *vma)
>  	vma_assert_detached(vma);
>  	vma_numab_state_free(vma);
>  	free_anon_vma_name(vma);
> +	vma_pfnmap_track_ctx_release(vma);
>  	kmem_cache_free(vm_area_cachep, vma);
>  }
>
> @@ -669,10 +719,6 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
>  		if (!tmp)
>  			goto fail_nomem;
>
> -		/* track_pfn_copy() will later take care of copying internal state. */
> -		if (unlikely(tmp->vm_flags & VM_PFNMAP))
> -			untrack_pfn_clear(tmp);
> -
>  		retval = vma_dup_policy(mpnt, tmp);
>  		if (retval)
>  			goto fail_nomem_policy;
> diff --git a/mm/memory.c b/mm/memory.c
> index c737a8625866a..eb2b3f10a97ec 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1370,7 +1370,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  	struct mm_struct *dst_mm = dst_vma->vm_mm;
>  	struct mm_struct *src_mm = src_vma->vm_mm;
>  	struct mmu_notifier_range range;
> -	unsigned long next, pfn = 0;
> +	unsigned long next;
>  	bool is_cow;
>  	int ret;
>
> @@ -1380,12 +1380,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  	if (is_vm_hugetlb_page(src_vma))
>  		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
>
> -	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
> -		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	/*
>  	 * We need to invalidate the secondary MMU mappings only when
>  	 * there could be a permission downgrade on the ptes of the
> @@ -1427,8 +1421,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  		raw_write_seqcount_end(&src_mm->write_protect_seq);
>  		mmu_notifier_invalidate_range_end(&range);
>  	}
> -	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn_copy(dst_vma, pfn);
>  	return ret;
>  }
>
> @@ -1923,9 +1915,6 @@ static void unmap_single_vma(struct mmu_gather *tlb,
>  	if (vma->vm_file)
>  		uprobe_munmap(vma, start, end);
>
> -	if (unlikely(vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn(vma, 0, 0, mm_wr_locked);
> -
>  	if (start != end) {
>  		if (unlikely(is_vm_hugetlb_page(vma))) {
>  			/*
> @@ -2871,6 +2860,36 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
>  	return error;
>  }
>
> +#ifdef __HAVE_PFNMAP_TRACKING
> +static inline struct pfnmap_track_ctx *pfnmap_track_ctx_alloc(unsigned long pfn,
> +		unsigned long size, pgprot_t *prot)
> +{
> +	struct pfnmap_track_ctx *ctx;
> +
> +	if (pfnmap_track(pfn, size, prot))
> +		return ERR_PTR(-EINVAL);
> +
> +	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (unlikely(!ctx)) {
> +		pfnmap_untrack(pfn, size);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	ctx->pfn = pfn;
> +	ctx->size = size;
> +	kref_init(&ctx->kref);
> +	return ctx;
> +}
> +
> +void pfnmap_track_ctx_release(struct kref *ref)
> +{
> +	struct pfnmap_track_ctx *ctx = container_of(ref, struct pfnmap_track_ctx, kref);
> +
> +	pfnmap_untrack(ctx->pfn, ctx->size);
> +	kfree(ctx);
> +}
> +#endif /* __HAVE_PFNMAP_TRACKING */
> +
>  /**
>   * remap_pfn_range - remap kernel memory to userspace
>   * @vma: user vma to map to
> @@ -2883,20 +2902,50 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
>   *
>   * Return: %0 on success, negative error code otherwise.
>   */
> +#ifdef __HAVE_PFNMAP_TRACKING
>  int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
>  		    unsigned long pfn, unsigned long size, pgprot_t prot)
>  {
> +	struct pfnmap_track_ctx *ctx = NULL;
>  	int err;
>
> -	err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
> -	if (err)
> +	size = PAGE_ALIGN(size);
> +
> +	/*
> +	 * If we cover the full VMA, we'll perform actual tracking, and
> +	 * remember to untrack when the last reference to our tracking
> +	 * context from a VMA goes away.
> +	 *
> +	 * If we only cover parts of the VMA, we'll only sanitize the
> +	 * pgprot.
> +	 */
> +	if (addr == vma->vm_start && addr + size == vma->vm_end) {
> +		if (vma->pfnmap_track_ctx)
> +			return -EINVAL;
> +		ctx = pfnmap_track_ctx_alloc(pfn, size, &prot);
> +		if (IS_ERR(ctx))
> +			return PTR_ERR(ctx);
> +	} else if (pfnmap_sanitize_pgprot(pfn, size, &prot)) {
>  		return -EINVAL;
> +	}
>
>  	err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> -	if (err)
> -		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
> +	if (ctx) {
> +		if (err)
> +			kref_put(&ctx->kref, pfnmap_track_ctx_release);
> +		else
> +			vma->pfnmap_track_ctx = ctx;
> +	}
>  	return err;
>  }
> +
> +#else
> +int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
> +		    unsigned long pfn, unsigned long size, pgprot_t prot)
> +{
> +	return remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> +}
> +#endif
>  EXPORT_SYMBOL(remap_pfn_range);
>
>  /**
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7db9da609c84f..6e78e02f74bd3 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1191,10 +1191,6 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
>  	if (is_vm_hugetlb_page(vma))
>  		clear_vma_resv_huge_pages(vma);
>
> -	/* Tell pfnmap has moved from this vma */
> -	if (unlikely(vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn_clear(vma);
> -
>  	*new_vma_ptr = new_vma;
>  	return err;
>  }
> --
> 2.49.0
>
