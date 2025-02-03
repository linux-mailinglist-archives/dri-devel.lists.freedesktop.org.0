Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB52DA267F2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 00:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D103610E051;
	Mon,  3 Feb 2025 23:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEpdYrgH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C8E10E051;
 Mon,  3 Feb 2025 23:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738625853; x=1770161853;
 h=message-id:date:subject:references:to:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cZJ8Q3FeyOjAunYsN93ElaueF+JmxQQUxUiRQY6oARY=;
 b=JEpdYrgHpqUtInEtRCqDJh2olZF3d+f0gguN/RE/X2h4QWyFes+lJiYP
 pN4RJJuJ8k8Y9c/ui4EpWgfzedzueaDrKFw2YbDzQGXh/vFjETtx62IOm
 G4cejTjgPxl6EpMV9VGCGmazKn8JSku68iSL0VBVs/4MX0cKU5VSw/qNx
 um1TZJ0tPi5yXgXCoZPzKoViLLAUSqylQdSDI02KmM8q2kDhm5Tz77FX/
 Xj4OCn87/Dz204b0SO+rVXyZXweU1MQW1Av7Seh5L5VqlFSA3QhjbHZIK
 RA2om9QnMyBEhp1BDl/jG8iCM7DaIlWnvrxelZhmWiiseStZccN4y3qut g==;
X-CSE-ConnectionGUID: JUOy5zrCQlaiwimX0Ivzwg==
X-CSE-MsgGUID: 9oRgn09JQhWqY22+D4IGYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39237249"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39237249"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 15:37:33 -0800
X-CSE-ConnectionGUID: 7ox3J3NqSuuU2WfBVB3s5A==
X-CSE-MsgGUID: fuL0mVaHTcOWhepd/R6Fjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="110257552"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 15:37:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 15:37:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 15:37:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 15:37:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+Uy6ojmIHIZlMNJnAX0dsrCI4HJT/mD46RfjjX2iojVkQVBcZFxkHLpI7fyZ3vQSwwPFxbxDmU68S8ZugBJ6b10GeuZgfAGrQYpa3ApzTC2Z4eBusqAMH2ly9ZpyHP58HzyC0ASQ9uqdY8LOqybHg/H7I3zCkpVTf75Vo2rVaVrfM056IPJi4mGkBPXSRrPuXUQaWaQxuwmnG/ZDY3XFb7Rp72nHCIDktZvBJuJNjI5JyHTC1svCT1QOcdXJnbCD9zB7FSBxkdF/lUMbBw7+b45ovlYTm+6EeEqEPuJ65MNDFPT+jn/rKLCe/WkUzRHE4P62/xVw7b68mhfGmjShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrvfUXvsiFeMLsXc5NOFxNw6ILTRO/6Piu2zmw08Hjg=;
 b=jX2/4fhkDpvndUIt8myroCEyjbNfPAuABVsAALwfBID4APueYje+sXLqEylK38/hKyOCrOwDvGfwMlYheJyjaTAos+LVO7HAA4Q9kp4BKcr14K7A52hYzM0GwZ4TkIcxhVc5VgQ44SbmPOGNpeu6vCqBycrDKxqvC4i32nezfX7BbWuUIpK2+v1rWDVnvc0pxboXzyTGfiibzfXIa5s+Xwi7vSZdeR9EKlZnh2MCKVLUe/p4ohU2Q8/X2lrFb/YZAYyLuq0n9jXJqnLY5+lCK65qZucmgq2xsgUDcVAHdQAzVhOtoNR63VXLk3VhXi5V/XPLPWv4JAtBxbDP7sqIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 23:37:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 23:37:13 +0000
Message-ID: <fab8cfdc-7f72-45f0-abef-047cac488c92@intel.com>
Date: Mon, 3 Feb 2025 18:37:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH v1] drm/i915/guc: Always disable interrupt ahead of
 synchronize_irq
Content-Language: en-US
References: <bd1ef8f5-6a48-42cb-a58c-c050f454b4f1@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <bd1ef8f5-6a48-42cb-a58c-c050f454b4f1@intel.com>
X-Forwarded-Message-Id: <bd1ef8f5-6a48-42cb-a58c-c050f454b4f1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:303:6a::7) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CO1PR11MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: a10fd1d8-6a26-4546-7ccd-08dd44abafd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGNFaUdjRTZ5T1NiOE9HSmxiUzgxVTVVTkFBNko5OUtOU0lUT1pHbWVPdUVE?=
 =?utf-8?B?aG9odDNLTzlrb0dYWFlnTWNEWXRPTGI2cVAvdGdlQ2ZKUzVEZ1g5NDBUTG5i?=
 =?utf-8?B?eUtzUC91Mm0ySzA3dFJaMDh1STRLenhURGorVEt3YWtkZjVnQVN3N0JXTExk?=
 =?utf-8?B?Zlo0eGI0alJsVGZ5NEI5eDNWb2lqKy9lbTA2am1BK25CVVU2aUF6WkNtOXFP?=
 =?utf-8?B?ZldkcEp0eDh5ZmM0RVlENkpnM2dXNlNPN2g0aXQrSXdJdUhLTTVMM2VlV0di?=
 =?utf-8?B?cWpVQzMzbHFpakRYY1E4aURVUmlsN3g5c21vL2JjQkQyUVZmZTZqaU5Oald0?=
 =?utf-8?B?aFZ0Uk0yNitLSWphWmsvRTdiNUI0bE1VTitqME5MSE5hVUs3ZTJPUjVveVZF?=
 =?utf-8?B?RXRwWTV2a2hseUZHR2pwYjUyY3dtZ3MrRlBFM25QLzEydGRkUDZHMEQ3Yitt?=
 =?utf-8?B?Z0QvaGwrcnlZTFBVOVdaRWI0M29KVzUwTUEzaVozL0M2aWE3eUFjN1ZBWi92?=
 =?utf-8?B?VnBESTJsblhvdlhUZzBNWFRyNG9yUEMrK1dyVlU5Z0llaVN6eDUwUCttcWxv?=
 =?utf-8?B?ZFZ1OEc3aXZad3V5M3FjMnJ5REtqRkpWdjJnRVVVZUh5UUhzbWlhRjZwVndC?=
 =?utf-8?B?YTNTbERmWnF6WGMvSFROclExSGhaOWRtZlY5MlZLellZWWFiUkptcTFwVVdH?=
 =?utf-8?B?MERqM1hCekF5R1V1OXVIVHBzeFNGazREUkhyUlpWSTFTU1BQNjl3S0dPbVBG?=
 =?utf-8?B?Qk4wRVNtemgrT3owNzRjLzNpYzdYaWRDcEhFTGJ6WUxOVFNGbFdGM3NSektB?=
 =?utf-8?B?R0FoRjA2dnBQNko4ckkxYUJiemNkdUdUOVlnWmh5UlJQTkROcFVJMzFGS2pa?=
 =?utf-8?B?RnBJQURHM1BtWlQ4MzhLdm5rZWlGMjV5eXppc2VWYTRrVDhTOXpVU0ZKSWNu?=
 =?utf-8?B?ZzAvNkZhejhTcVNUcnZnRTc5ZXFKWWdFT0h2R2RxNHgyQ0YwVm8rbUhEL1Zv?=
 =?utf-8?B?VFZ3WXVjRWZHNmtGMW5hUkN3WGNYUWsyMUNPaUZSV080TzRMdEVPcFRabHF0?=
 =?utf-8?B?WVVxT1pwYm9XamdhNXg2ZHpjbmlQMkRpY0xWVFFpcDhiNjA0d0R6aTRVdGJ2?=
 =?utf-8?B?RStkQ0w3bm1zdlJJeXVpdlE5cHBMRDZCdFNHVFhqekM4NjkwN3kxWGtwcVB1?=
 =?utf-8?B?NTBEWVVUZUtMdmJuSndHK25nSU9LQkF1c1kvQUVFM3FqQTVhdGNJNWdZZjdp?=
 =?utf-8?B?ZXRBYlZVa0VQYU10WFNsNUNBUjY4bHFKOGRyZm54UEFac05jczRPSERjZmR5?=
 =?utf-8?B?L3N3Ykdld05UQkVMNXQrcUgrSWhFNlNJZVJLL3dWN01oUkRNUnErcE1CYTNC?=
 =?utf-8?B?UWFhdEdJdytLNjhwalYvMG9SVU1HZWQyTUwrZ0pOUmpKRFA2T1FhODVQR2hv?=
 =?utf-8?B?RWltcE13RWtIYWdXVDNtSk84YmEyYUgxZHZuNVlvYU1CdGJUdE1EcForMk5Y?=
 =?utf-8?B?RHVYRm54YTRGSitlTkhOeGZEN3A3YjcxaVFObUt0TTJKNThRTHI1dkhZMTRR?=
 =?utf-8?B?a1kyV2lkK0dZWDQ4RGQxSGFVZ1c2RmFuZmU0RHlsbnEveWYzUnQvMWR1YzdV?=
 =?utf-8?B?RDcxZ0o5NEpMdG5mdG5wOTNFQktvN0cwTDF3UmNjRE8yZ2JsOU1mbkVwZjVU?=
 =?utf-8?B?SGFuWkF1ZmlyVzd2NkxkV1ZBZHdLbFl1dVdqTkhyc0RuaWIxMWNuRzQvM2lw?=
 =?utf-8?B?MW9aZnRCRWxGTUJueHhMY29vVXhobHZSNWxLUVZvVU45OGFHd0xlUVd3NWI1?=
 =?utf-8?B?Z09abVMxcUZ2eFhEM25xUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmFqUCtTRmpmRlhjR3ZLV1Y4R2ZzYkdwRDd6T0pUdGxkMTE5QzFXaG53czdY?=
 =?utf-8?B?d2hTSDd1YnR1ZytXbmYxMjBURXNuMWViYW4wU25PWEwxZXY4SzRvUDRaUXpm?=
 =?utf-8?B?TDFKY0QzdjFVbDNLekIxM3NBVVIrMjgxTVRNQzk2MUc2UjhIRWdvR3RwRzNr?=
 =?utf-8?B?a0dEcmJVYndEeG9POTVMNmZYR2JaTG43Tk5ZaWFYYjczMzQ5NUNpRVRZbE1J?=
 =?utf-8?B?YS94dUJUL0lLUHJpaFBaRGs5QWdUdnNUN25CVXphYjRYTGhNZGlDcEF3enRU?=
 =?utf-8?B?K0dTeHR0NHpMNFUyT0c0VFQ1MVNTWkc3WjdIYnB5eDByTWdBOTVGOWdzT0pP?=
 =?utf-8?B?ZzVmODFUbFVBNkdkRG5OdHFQcDFZbGlGUTVVWjdyUERUVzRXRm1GSzFzZFd2?=
 =?utf-8?B?eE91clo0L2xoK3FZZFNGRkw4WmxqSmRnZTJTMjUvUDlUZmJXUXo0bmdmRDlT?=
 =?utf-8?B?T3RsVXFEZGRvRHlMR1ZYVEY5L0ZFYVVibktMU0ozd3NiTHViTkRybGpnUkYx?=
 =?utf-8?B?UHNFU3U5RE83eW9zWEVYbWd2M0NmelR5UHVyeHJ4NXpYblB1NURUOGNKQW9R?=
 =?utf-8?B?S2ljTWROVmNkV1ZReUQrVkJUbWROSjF2bzM4WG1DNk9JNDBJd2VzN1NickRi?=
 =?utf-8?B?c1N5bmZVV1ptdGc5VEVGRW5rT3BNUGhwRzZFZEs2NVJZU2FwQ2hIWnF3blhY?=
 =?utf-8?B?K3RUQlhXaVlaZTZidlEwMVVVSWVnb212K0MxeEhpUjMxQXNNcVd6Z2orZGR6?=
 =?utf-8?B?QTBIOTRhdHc0OGlBeWFIOHV5Y0l5UUJDVE4wYklSRi85L0dhUkFlbkZJRXkv?=
 =?utf-8?B?MWhuZ1NxUlBKS0FIZ1U5QjFMMzZGOG5zdktpc3BPNFdhTEYvN3lwa080bnl5?=
 =?utf-8?B?L0V2WktZeEMrMUFDT3VRRnU5bGVaaDAwalA1N25rUU8wM09rdUwxSzZIK1Vt?=
 =?utf-8?B?ZUg5MytuTzJWcnIvRVdtNGNiZXEwQURXUlBFRDV6S0tCRzFJRnp5ZkJheVJi?=
 =?utf-8?B?YzBNZVlzaCtsVm1telJDbmVxTnBZMXhZYjZWYmFOQmNwS1M0bHBOSitxM0hH?=
 =?utf-8?B?Skx0TW9kNVl6V2F6TTNWTWhpemhFdjNOSThWWEw2ZWQ4SWtEd2NhMkE1dHhw?=
 =?utf-8?B?OEozMzIwMmhlSVlXR24zazVKMW9rb1ZIU0RjNjRpRVhvL1RvblFtdXh3Ym9P?=
 =?utf-8?B?aVlCcHozYkZnRHBVZkRGNGxTSm9jNWN4bkkydU9TOVNObVVnK20zVEorazdh?=
 =?utf-8?B?OFc4ODkrVnF5TmlCZWZ2Zm40dGk3NFJzY3pjNHJBYlR3Sm5UV2pUNkFFV0ta?=
 =?utf-8?B?M0F5NGVPU1RWSUJWSkZpSmRNelV3ZERvbUpVZ2Zzalp1UTlPNXArL2dKZldo?=
 =?utf-8?B?ZDZlTE5naTdtTWtvWm8xWkh2YjJuOVYwMklwUVdubDhjVTFmZTFSVTR3eXk0?=
 =?utf-8?B?cEd4MDRoWXczZ1JHWk95OUg4STJxS2pVQ09mNzdwQTFVTm1rWlYxbmsyWW1n?=
 =?utf-8?B?NisxdlBBWnI3c2NRQ2pmdE1TS2M3Y3RWVEw5Rmt4enlwcFZ0TkFSOGpHWCto?=
 =?utf-8?B?Y3dzL2crNzNGa3hXYWdBKzBPaFF5WHFIVGsrWDdXbmlDWUZGY25XNTNlKzlo?=
 =?utf-8?B?aHBXT3UzWHFsV0JIL2doNnhIUWhDeHdzYTJtQVp6TVFGZXVTRkZCSFBsbVFY?=
 =?utf-8?B?V2J1L0phWXJoNVdWcUltYVJZR3BjYmtNaDVUTGZHaGYvbEtHb21sd2FkNE5G?=
 =?utf-8?B?OUtTbnlYL0FtSE5qL1VKc3YwellOSU0wZEJQVGtrVjdmS0Zib3QxakswZ0dn?=
 =?utf-8?B?clVQVnFiWkZYWU5sbVdwbFhqd0E0MUpsdEJsalVzRit3UENVVVNhdFgrN0VS?=
 =?utf-8?B?aFBvRWF5dU5waWRYQ0YxQ0djQmhveVhGc0dDd2Y1RjFpU1JLQjc2T2tnV0Zt?=
 =?utf-8?B?Q2wvcXlmLzBuUlhScDJkbnhHOEZ6WkJMQTlZR2Y4ZlNJZk5aTythVzRIemJh?=
 =?utf-8?B?b1RpdFB1ZkdyUzZsdzZhQ1FSWDlPM3lDejhUZ2ZiMzBudDRUZ2p4a09YK0gw?=
 =?utf-8?B?bHhwNmt6TUhxNUxMODFVQ0p5b0xwbW5rTjNtcFZabFpPSmRrSkQ5eFJSQ2xq?=
 =?utf-8?B?U0t3cVNqUUhzaXN4aFlCdERURmdDUTkraXRpSmd4M0t6WjFkb1A3Ukp0SFdp?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a10fd1d8-6a26-4546-7ccd-08dd44abafd1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 23:37:13.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QA+7VeJOa7kLfbttu4GERxsLAilGqIUpvGuqUAFiVZmFrhq1gjkn7l2yAfVIO03guy4S1Cd16qE0VMtphy1yZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
X-OriginatorOrg: intel.com
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

Just found my previous response click on "reply", not the "reply all", 
so add Cc list.

Regards,
Zhanjun Dong


-------- Forwarded Message --------
Subject: Re: [PATCH v1] drm/i915/guc: Always disable interrupt ahead of 
synchronize_irq
Date: Mon, 27 Jan 2025 17:17:33 -0500
From: Dong, Zhanjun <zhanjun.dong@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Please see my comments below.
Daniele raised a good point on GuC interrupt, I will dig deeper for more 
info.

Regards,
Zhanjun Dong

On 2025-01-27 12:12 p.m., Daniele Ceraolo Spurio wrote:
> 
> 
> 
> On 1/23/2025 8:23 AM, Zhanjun Dong wrote:
>> The purpose of synchronize_irq is to wait for any pending IRQ handlers 
>> for the
>> interrupt to complete, if synchronize_irq called before interrupt 
>> disabled, an
>> tiny timing window created, where no more pending IRQ, but interrupt not
>> disabled yet. Meanwhile, if the interrupt event happened in this 
>> timing window,
>> an unexpected IRQ handling will be triggered.
>>
>> Fixed by always disable interrupt ahead of synchronize_irq.
>>
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13454
>> Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
>> Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on 
>> Gen11")
>> Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
>> Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state 
>> management")
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>
>> ---
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Andi Shyti <andi.shyti@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c      | 3 +--
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c   | 4 ++--
>>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c | 2 +-
>>   3 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/ 
>> i915/gt/intel_rps.c
>> index fa304ea088e4..0fe7a8d7f460 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -244,8 +244,8 @@ static void rps_disable_interrupts(struct 
>> intel_rps *rps)
>>       gen6_gt_pm_disable_irq(gt, GEN6_PM_RPS_EVENTS);
>>       spin_unlock_irq(gt->irq_lock);
>> +    rps_reset_interrupts(rps);
>>       intel_synchronize_irq(gt->i915);
> 
> I don't think this is an issue, because we set the irq mask in 
> gen6_gt_pm_disable_irq, so there is no chance of getting any new 
> interrupts after that. Not saying that we shouldn't do the re-order, but 
> we don't need a fixes tag for this.
Good point, the interrupt already disabled by gen6_gt_pm_disable_irq, 
the rps_reset_interrupts is just clear interrupt bits, so no risk here, 
therefor no issue at all.
Anyway, re-order is still a good practice, the interrupt bits set/and 
clear is all about the interrupt bits, these 2 actions could be consider 
logically tight relationship, the intel_synchronize_irq considered to be 
the next step.
So fixes tag should be removed. As not an issue fix, this work could be 
done separately.

> 
>> -
>>       /*
>>        * Now that we will not be generating any more work, flush any
>>        * outstanding tasks. As we are called on the RPS idle path,
>> @@ -254,7 +254,6 @@ static void rps_disable_interrupts(struct 
>> intel_rps *rps)
>>        */
>>       cancel_work_sync(&rps->work);
>> -    rps_reset_interrupts(rps);
>>       GT_TRACE(gt, "interrupts:off\n");
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/ 
>> i915/gt/uc/intel_guc.c
>> index 5949ff0b0161..3e7b2c6cdca4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -116,9 +116,9 @@ static void gen9_disable_guc_interrupts(struct 
>> intel_guc *guc)
>>       gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
>>       spin_unlock_irq(gt->irq_lock);
>> -    intel_synchronize_irq(gt->i915);
>>       gen9_reset_guc_interrupts(guc);
>> +    intel_synchronize_irq(gt->i915);
> 
> Same as above with gen6_gt_pm_disable_irq
> 
>>   }
>>   static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
>> @@ -154,9 +154,9 @@ static void gen11_disable_guc_interrupts(struct 
>> intel_guc *guc)
>>       struct intel_gt *gt = guc_to_gt(guc);
>>       guc->interrupts.enabled = false;
>> -    intel_synchronize_irq(gt->i915);
>>       gen11_reset_guc_interrupts(guc);
>> +    intel_synchronize_irq(gt->i915);
> 
> No early disabling here, but I don't think this change helps either. 
> AFAICS gen11_reset_guc_interrupts() only calls gen11_gt_reset_one_iir(), 
> which just clears the IIR bits for the GuC. There are no changes in 
> interrupt enable/mask status, so interrupts can still be generated. The 
> way interrupts are stopped for gen11+ is by setting guc- 
>  >interrupts.enabled, because that's checked from both guc_irq_handler() 
> and intel_guc_to_host_event_handler(), so any new interrupts generated 
> after we set that should be immediately dropped.
Good point! Because there are no changes in interrupt enable/mask 
status, guc interrupt won't stops, therefor synchronize irq won't make 
changes.
Let me dig deeper and get back to you once I have more info.

> 
>>   }
>>   static void guc_dead_worker_func(struct work_struct *w)
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/ 
>> drm/i915/pxp/intel_pxp_irq.c
>> index d81750b9bdda..b82a667e7ac0 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
>> @@ -101,9 +101,9 @@ void intel_pxp_irq_disable(struct intel_pxp *pxp)
>>       __pxp_set_interrupts(gt, 0);
>>       spin_unlock_irq(gt->irq_lock);
>> -    intel_synchronize_irq(gt->i915);
>>       pxp_irq_reset(gt);
>> +    intel_synchronize_irq(gt->i915);
> 
> Again not a bug here, __pxp_set_interrupts is doing the interrupts 
> disabling and that is already happening before intel_synchronize_irq().
Same to above rps case, not a bug.
> 
> Daniele
> 
>>       flush_work(&pxp->session_work);
>>   }
> 

