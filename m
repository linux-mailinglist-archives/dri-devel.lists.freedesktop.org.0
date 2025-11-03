Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC866C2B125
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F26610E3AA;
	Mon,  3 Nov 2025 10:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQAZgI8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6981010E152;
 Mon,  3 Nov 2025 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165927; x=1793701927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C48TOsN/mssQZ5kCnguHROmL4GbPZsD3BqVQc28YrYU=;
 b=hQAZgI8dDnpryroJX6we5O1BcwbtPW6MnJTeuygHCqsa0vSrNzr3tOWD
 HOpjqLn3b79ff/3z+ZRd8Mb6YhPMWgXYDQT2leqYa0v5ScG6+GPY+wDnM
 8viydWB9KSF0aw3aRmEMV+P452rw/EdJM+qoL8WxoD0qUrnZMNt986I62
 D/J57lA25k4RK+aXuIX9gewQ9s6QLzMK3bwN+jE63jRUjzVgXJBVYd/Ao
 s437ocrG37V+/obPhuIUTh7e1jceXieb8ahN2MeloD994KrsZMtK8B/I3
 I/366MYKs9uu2mQhb4qJBummfHoCV41dYerpQcDqZbIVh0cMcWbdAvWAZ w==;
X-CSE-ConnectionGUID: Eol3ZROtQWqyZMNwLJPy/g==
X-CSE-MsgGUID: bNLy0xcXQiGjqqxSkXNmfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64141477"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64141477"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:32:07 -0800
X-CSE-ConnectionGUID: CGeEmXdpTEqdntKGJ8pSfQ==
X-CSE-MsgGUID: Un3YjzdaQoWHOFeqc3Bi0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186509682"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:32:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:32:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 02:32:06 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:32:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwZpG+JBWltNu2mYnQO6RsE6uw30M6Yp7KsHTwf+Uni5tnmBxYHsnsnuMIw7lUYNnlRTUMjYq+xGsNGpMHZNuaflkAzs+C7qq9lvxSXs1tvzAlS4qMlK0aOsOSla8Dj1EAnHHoKmPEULP+knu9OE4/dmbzEr57g7Al48RxRM1+xFj14qyF1gI8jqUjRx0V8LFtvGIG6KrJzWTEhW0g+QoPEFOZmj538dVghqhcl2ldrBfnA8olHzwNGqegZ/a79JHoh+J41bic3gyEDii3uEnbGGwadwp1hrjKUAui4lDk4kQdWvFGqQB0Yrb5mkitAf3/7Q4+zCTe+EtDEFMJ+XZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d10EdOqkJAn7kxbNtyoNL5OEjHM9CYDsaAsC4guELzg=;
 b=vewLzyut50GeKC08tejhkmfL7ndFbN4WMz5PbRmuXRPJ2P+iLCpLdV8uGhlck0JaBKQI611lmvofmQBlEDieGwe5ypFtTFojfbBMyfpHx/+TTovdk40sDpke61eJ6cexzoW0RcUndSmBU+e4RMBJmHjmT7SbdfuqSjOk8e7HKbkWCRLtIaxPlUn/WS5k4VlQ2DtUb7l6AhhkWitCeG6pMvemSTY2mUT1NoybNl+KOPGQtOK4+hn4x7G18aqZjpIeJqSqxa9ci6G1FiSL72Hoqm8BNl36TObvERFVEqK6GTMNieD8jZ6ZBE8/bJSl4YGlf0+ZiipmEe+Gg5jVjnHz3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH3PR11MB7818.namprd11.prod.outlook.com (2603:10b6:610:129::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 10:32:04 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 10:32:04 +0000
Date: Mon, 3 Nov 2025 10:31:52 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/i915: WQ_PERCPU added to alloc_workqueue users
Message-ID: <5ujqee7npggfcqmul6lcm44ilqrhmpcpiaxvdpcjjfawjhf63j@764n7hxk3mfm>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251031100923.85721-1-marco.crivellari@suse.com>
 <20251031100923.85721-4-marco.crivellari@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251031100923.85721-4-marco.crivellari@suse.com>
X-ClientProxiedBy: DU7P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::15) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH3PR11MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2dbeb9-dcab-4545-0488-08de1ac43b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZC90Z2s5YnBSSlp2QjdjTXRWZm5kdEpZSi9ybE5abm5qQlR2S3AyQ0VveHRP?=
 =?utf-8?B?TkNuRmt3RzJYeGlUN0JNVWs4bFMreWIwL0U1YU5seGhwWk5YN3RTMVBvbVAr?=
 =?utf-8?B?VlEyUkc2c0xyb1NDU2Z2ckZFQkhEQW1LWkFEdXVycWhsWkRRK2FZdytMa0hp?=
 =?utf-8?B?S1FLcno0L1hTNWxEbzJoRllRTDV3TkZiVStoZFhCeEpJaDhwUVh1dzk2Wkdv?=
 =?utf-8?B?ZU9DbHp3R1JMczNnOUc5M0dKSmFRYjRDQTVmcTJ5dGhBeEM4a3pTQmI3bkRS?=
 =?utf-8?B?OVFoNGhHNGUyczliRHBJT0s0em9scTN4V3hmcU5vTDk4QkVFQUkzRHZ2V1hr?=
 =?utf-8?B?YjYzZlg3cm1CVlJqM0N6RzY4cGdvalJ1N21iS0hWcEZ5WlJIck8rSjFqMmVm?=
 =?utf-8?B?OE5HNXZvVmxIelVqa3JyRlNiMDF0WGtuRDdWYUJXMGhTejI2eVVvQ2NJL0pZ?=
 =?utf-8?B?bDlxaVFTSHdxWXZuZExFZ2g3VWVxampCaVp3MUlXMW5Xd0ZaZjR4RXZZczlm?=
 =?utf-8?B?TjdhMWVMUGRJZWkvRER0OXR5ZzQvdGlMNHBWM3d1ZTVEa1daQTJac2lsZC9T?=
 =?utf-8?B?NURWaDJHekZlZFZNajNnWHlCYWVlc0E3K2ZUODFXYjV0d0F0dUZaREVMRGJr?=
 =?utf-8?B?UW9ZZ1pTZnhUL2FzV3JOUWlYT1ZKWmdoSWdBZW03eG1IaU5hNHJBODNzZHQ3?=
 =?utf-8?B?dTM2QzFYWGVaNDczUGhiTlJPeW9EMi9peitiQjZKcThscWdVSnlBVnVHZnc1?=
 =?utf-8?B?dUp0NS8zR2pQRElqQmpjYkJJME9EaVJXSTRVeGJTb3NCNVE3dG5jQkhkRFFW?=
 =?utf-8?B?c1J0ZGJzSjVQaTBBN00yRVlIQ1RZQ0NZT241bC9qUktpaTZmSEEvRFlMSXNT?=
 =?utf-8?B?dmF4K3Q4cEZvWTFJRWc4Z1I0c2t0MVpORlk1d3Z0VmZ1aTQ4eXc5K3Jia0dT?=
 =?utf-8?B?TWk2NjdjVisrRzZpMU5Cc3JQMkQ0WVhqbEU4aFZ6REh5dVNlc2xYMzVDNUhX?=
 =?utf-8?B?QkF5bXhBNzdRWU1Dbld4emNWTU9ka3FocVZhOUdlVmh3c1d2azR4L05ZOENR?=
 =?utf-8?B?dkY2OGlGZm1Kbi9FeDlSY0JMdThMbnNLZi9CTzVEUmhTNHpDeFBlaVVKM2Y2?=
 =?utf-8?B?ZjFqL0UzK3pSMXo0a0hKZXVsWFVLQU5FKzJZdkcwYUplRzJQbWlZa2dMTnNE?=
 =?utf-8?B?d3Y5WDR5T3BUKzF3Nnh1Q1plSHVpNXpZbFoxZldzUTN5NkFZSkZaMGpGb1lP?=
 =?utf-8?B?V2NQdnppMW9yS0tIRE1xa3UrOEVJc012ajNLVnVzZnFtUE12bXhqdXQ1VkM5?=
 =?utf-8?B?dHF1bWpQek1VeEtqV3BuMnhhS2JhNU4zRlhmZ0p6MWJRRS82b1R0cGw4UVNm?=
 =?utf-8?B?R1pJeUR1VjBLZ3lmZEttVlh1K2h0UWdNem9vNXc0UVB1TE5MV09VZ0lhbjJG?=
 =?utf-8?B?c1huNGkrUkhFZ3RJelhvUzRSUzBTQ2xqODRDSGRCK1NVNFgrZ0ZRNXUyRThO?=
 =?utf-8?B?K0l4T3VvQUl2dVFhbks4dEdpRFRESGRDN2l3Ykhpa1QwZThHcnpMcE5rRGJq?=
 =?utf-8?B?Zk5McGd5M3NKVFU3OWRCQlJ1VlYxb2hnVGt3MFBuaEFQUkRVUnJNRFVlbTZG?=
 =?utf-8?B?YWNnTXFadlhqUmlCdVFEZjF2RmZJOEZFRDdEQXVQcS9qeWZNNlVKNWtlMEVN?=
 =?utf-8?B?STB3SVVMWURUMnp6YXVXQlh5T08rakR6MVlNd1BNU3VPTktOemo2UkVWMmpH?=
 =?utf-8?B?L01PWTBWZkhUUU96NmZIN1ZPMmx6U3ErZU45ODJNZFc5U0xGWnVDVy9JUm95?=
 =?utf-8?B?VEZrNExCeW0rdW5sYmozYWtRZ1piTHMvOExHdktZVTRheTNyZW1hQTIvNmh1?=
 =?utf-8?B?ekIzWVZBMkdKTUVZRFptRzNVVDdsYm5NVHJTSU15Y045YnkvMGg0REIyKzc2?=
 =?utf-8?Q?yutqz00cef3esOZQqtXxlxm63hxTIJdt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWptc0J1eXVyMy9XS3ZvQnArRlJsSDB2Ym41OEp3TlhWWWRENmJSblhBWUVx?=
 =?utf-8?B?T0lNOGZiM1ZqTlVQUWtCajVOaTc3K0x6Z3dYVDlKTG44OEFIWUNvZTl2QWNM?=
 =?utf-8?B?SGY5a1k1VlRLcy90TTQ5TTRvRjZIaFkwdy92WGZ2SVhTcEEvZnJhR0FuMG5W?=
 =?utf-8?B?bjljQUtnNFM0QnVJY3hiUTY5V1YzRnVhaW1YTWlDN1N0QStMY2VaajRuYzZC?=
 =?utf-8?B?OXNwL252VUZCY2pjN3gyOE5nWWZQYUg4dU9mTkZVQVl0YWx3Nm96TG8wWnBy?=
 =?utf-8?B?QnF4ZWVJRlAyMEx0MWxySmpkYVJZaVRVTE5ja21KdDAvWVZkcndzT250QnJP?=
 =?utf-8?B?U0VCYU9iUGhFZDR5ZEFQbEk0OUg5NGdzT29NdG5Gb2NlN2E5bEp1ZVphdVVI?=
 =?utf-8?B?WkRWb3dRVnVpTVNkRCtxcnFGTVozT002d3puR1RuOURTS0l0NVVNK2dnTytx?=
 =?utf-8?B?cUxUWlFEaHhVU1VmcEpNZ2RBMVpwZTQ1NlpSRHRkbGFoVVQvSzVPeDVtTi82?=
 =?utf-8?B?Ym5YL2xlMnV6RXVGQVJ4REIxQ0pKdG5uY2NDUDlIdXA4dGZndHFMaFlmV0NE?=
 =?utf-8?B?bjFsTTgxc3hqNVYxK1NZVG9hUk1KZ2FLdjZNcFlBMGV6WEVnME1mQ2REKzZL?=
 =?utf-8?B?d2dsWWhrV2hlZVJYbEh4dVlWaVJ0ZEZnYjFaQ0ZiM2thcURFbStrNHhIenpx?=
 =?utf-8?B?dTRzNXk4V3ZscUVqMkNjOC8zTWVrL1lZNXJYREExMG51K2tlRlNDcHZtVEpS?=
 =?utf-8?B?UFVpaS9DRmdPL2JYdEsyaHE0NmFGbVRWVDJyVzNjY3N1WVRzOUVndUhHMUw3?=
 =?utf-8?B?cDV6QWFXaW5KYzd6dFlPSlYvWVQxZjNFWVBEc211Tjc5ZGd0MUFoblFTeCt2?=
 =?utf-8?B?RWxTMi9DSnhiaHA2RW1SQlZJZEhDYS9kTmZBOXFxUGRKSkY2dGN1TUxRTUtU?=
 =?utf-8?B?WnAyWlJrT3V5c2FyanBGLzFUQlVTTUx1Z09HamxpUWxJWmJ5WXFPQnZwdmc0?=
 =?utf-8?B?Z0FwSlBZVHVta1NFNTdPZW5BRVJoZGpTRWNLVjJsZ2lNS0loZGgvNnZsTHlz?=
 =?utf-8?B?RHVraXMvUkkrcytCK1JFOTFhbVVpYzB2S0xCaUtvVVR2YXFtWC91RzkwR0oy?=
 =?utf-8?B?R21pUTZybGZaK2F2RHpWbW1aOWw1RFNnTXpBRVdyTVBoWUUrOUxrUjhieHRj?=
 =?utf-8?B?Q2pUOVNwb0p5RWNITGNCQU54YWQyRXJKa3pxazNTU2dkVzNIbE8wNTRhOTZX?=
 =?utf-8?B?Ti9BM0c5Wnl6V05yZkFiakIrdXpoeUZLQU9NS0pmeW1VZG9FK1hEeGliZS9z?=
 =?utf-8?B?clJPZ1FPQmxGZWRjZjJ2SXJvVFBYblJsUjFTeUp6WkIxeWhiakQ5dXQ2NThJ?=
 =?utf-8?B?L0R4RkpONUc2SHJnbUJXcXJUeHNtL3gvUHhRQlpRUldJcm0weXVaVVNYeW1W?=
 =?utf-8?B?RmNBNmRxSkZFSSszUmczM0VnS1NoTVBrYlZhTUJjd1ltQ1VSMWVHdTNaa3o0?=
 =?utf-8?B?cVRNeXdWZkJWRlczeTFpdk8yYkRQT2dzdEowKzIyU3BVZkRHTEc3ZnIwTzAw?=
 =?utf-8?B?SHFpQk0ybmVtM2QwbE5PdGZEOGxkWklhQUxjMzRoK0lrMHRRWGY5MGE5eG1W?=
 =?utf-8?B?YnRtSFY0T243L0lma05rU1RNNFdYTTI2VG4xalo5RHlxK0ExT0NWcDJCL2t6?=
 =?utf-8?B?eUd6VnFySDR1YVNISElMdmJxaDJISUlnV0VjbXlCN2hkUStzNGUwZEpjekRH?=
 =?utf-8?B?cndKN3N2Y0lrVHVxWncva1FnTGszS2U1WlRxYlF1azFub004R3RrUGFHT3Y1?=
 =?utf-8?B?L1FVeUlZTHhEcTNsMjZ5a1lpQ1Z0VjFOTmFycmc5dmJKVDV4Q045Qkg3VE0x?=
 =?utf-8?B?VEpXUDM3ak5qRE5TQ0hlMTN3MjNjQ1RJQi9QN3g0MS9HaWJKaW1USlF4NU9T?=
 =?utf-8?B?bWRaYllPWVA0MnZvbzJXcEcwRFd1RFpBejN2KzNPM3hTS083dS9JQVN5MmRh?=
 =?utf-8?B?T3BkOTlmU2s2YzhlWFp1dGVkTnpyM2JuVnc2SER3MGF1TjFEbVQxQ01tc0RY?=
 =?utf-8?B?Z29HQVVnOW9wWVlLaWpTQnJlOUo3T25CcmFad2xLWkRzSmp2SXZkeDhKS0Va?=
 =?utf-8?B?T2tYejlpZm5lZS9mUzIzOC9WQ28yTHF3aEZRdExhb2k1Si9VcXpXZ3lBMEtr?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2dbeb9-dcab-4545-0488-08de1ac43b30
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 10:32:04.3659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaWheRbAqcHKUN/s5jbCKjh6MEQDGI162TtVGxV1W88MeTALiIVYfIdQcW4Qq2YwPK1i9beX5L0y4RZbNvfpVrmTlNC3qYO1d62MmBqMhE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7818
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

Hi Marco,

Usually, imperative form is used for patch titles:
"add WQ_PERCPU to alloc_workqueue users".

-- 
Best Regards,
Krzysztof
