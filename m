Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50492B335CC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 07:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED01A10E121;
	Mon, 25 Aug 2025 05:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVzQUS/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E0F10E121;
 Mon, 25 Aug 2025 05:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756099948; x=1787635948;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U2LsVzdeksGP+776kdGzr82tu34RpFYjABBqUeJqzG4=;
 b=GVzQUS/9IGmtnQaQiqUl60eJwidLFoPxEM6qz1eNv9gRaLlHITOtAXCU
 p3eBnVooWzZBFCmN7XXr1wku/kECP60Y3TJcx/hXTfiw5xyMmXSroUHLM
 q18GScvI80+tTrGXHJbt0DsYZrfbz5WFt710Iuknv4IFeuY4jOK+/d5vn
 FZI42HYmbWiFrZU8v3dqF0B19THhLoiww4WDq0lvARqNqj03jVk8FL11O
 cQSU8aU1NAI3ZE69fiVV+dKpxtcluMQxp+/I7tTgWzpQ2uLOXR+Vxvau8
 s+h/J6E7jYY5BUNITesD19C2rf7Hz1Nh50YrMp1oyXbXrVjhKQTBs04xs g==;
X-CSE-ConnectionGUID: wADXHCClSPiYlZ2AE0ZExA==
X-CSE-MsgGUID: i8tkt18LRVevgO52xX2Cvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58014144"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58014144"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 22:32:15 -0700
X-CSE-ConnectionGUID: pjj+7DxrQQaqecabqteqdQ==
X-CSE-MsgGUID: ciFCEWTxRSmiyTzOTeLgIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="173385992"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 22:32:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 22:32:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 24 Aug 2025 22:32:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.44)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 22:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWhkRz5s9/punQzCvWKMueEspMJXWvhWQZLNf57hRDtckaKRHXUpc+hAip7uCU/pTm43ycnY9qRUZmbAhMrcp4GERAus140cditg5RubB8KemPujx3bLcuNgEXZlnnfXXLext/qAl7FId8zodZwxmVQZgxdElCwu2rWNH9KjVXk+oqSYSKhRztAF/mibPYlMVHhQ3UGKl5Qeo4BCELedgwq4tnCcoi+ryRlSP/0q2RU5OlNAdBK+VvCMuIRwDzF3xZbo/KjV1TmEyC6syh9f6JtFFyLj59PGeAazIi1Yqo7s6hK1dhWk561LH6awTx0UXiitI3jzeC37X3cVZAvDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4qQIuofPnMT0S8wKZvw7MbjBsb9D0smZX63+vG0ylI=;
 b=XqfN9ypHtADvkWTSSOqayjS6uhIQM24A4mkCEdTdOqMY+cf3TKD92G8xOXsvUPk/NVtE7LJn9LL9vNRMAXUDralcJ8KUax5R6lI/UZOkcYAYxZEc/jklLZCEZhimhMSZ+NG+wQn7RnbtOYfS0dVYjpZihCBHkXoUxRIjaTIhzFhL8GB9aI7FZGMy2gIZYNQsK3yNFRiBzTActiFZ9/TJS3GyeTfTxGiT1xrKxpVN3EsYqDlSFnxerjJOWWGuKurYEOkMsC3Jf8EfywfxjtvDsQJzjaKWocxTHMkTk8hAwQrquAzZCgFwSRZ/+IhibhOXO6BaOFmZKHtCP4QY5CoySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 05:32:11 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 05:32:11 +0000
Message-ID: <b5f0e3f8-8de3-4902-8d97-353446f92d72@intel.com>
Date: Mon, 25 Aug 2025 11:02:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/i915/display: Error codes for async flip
 failures
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, <naveen1.kumar@intel.com>,
 <xaver.hugl@kde.org>, <uma.shankar@intel.com>, <harry.wentland@amd.com>
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-4-13a0e8f2c581@intel.com>
 <1043ceb7-8198-48ed-9040-9e5d08a01723@linux.intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <1043ceb7-8198-48ed-9040-9e5d08a01723@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c778de6-ebf1-474c-9a5a-08dde398bd3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzJ2WnJqUEJmL1pZeTczb3N4dEMzNVNhVEhPb3RRbXFrR1dFUGRsa0RqUUpP?=
 =?utf-8?B?Ymlhay9zVDl1aVdZNGgwZ3JoRUVPbmlaZHRibm96K0FXWTJDa0srVEg1QU0v?=
 =?utf-8?B?RFoxWlJ1T1dFRk8xbDZJUnQrY1NKbXNlRFZXcmlFbXJhanRhOUtxRXp5V3Fy?=
 =?utf-8?B?Q3pGL0tQb05UVHExNzNCRVQ4M1d5SFVPYUZWRWpKUnV5YjRDQ1p3MzJRNCtj?=
 =?utf-8?B?d0JhSkFabURwbFRHMU84NDVVVTBoQXpKWnV3eTN0elNPWjBEY3JQTEQ0bjFx?=
 =?utf-8?B?K0lhV3FwTlR4Q3BMVHRwc2VPaWQzWk9xRW9UR0FRVFRXRktRdy90TU5yMldJ?=
 =?utf-8?B?WUZuZ1oyK2hVbFc5ZlU3UGdabEZXdHEzY0czU0oraC9qNmN0Tm9EZmJnTXUv?=
 =?utf-8?B?eDlReGxpNVdxNElMMmRCTWFOQ2UrMVptL3dKTTNVa1BCZ08wZ3dTcnV6ODE0?=
 =?utf-8?B?WjRweDhqRnQ0Q29CcmM2MnRpV1NkRWNWSHdkZUdBK3A1Skp4RFBkUUZQakEz?=
 =?utf-8?B?NUNHZlRCRmNaenFrOXhXZTV1QW44eWhZQXJmSENGYmU0NFBuTHdNeUMxNWh0?=
 =?utf-8?B?VGFSWTc0TFh1T0RuTVhzcGhSUXhUQTd2cllSbmZraTBDMkFFWVY0Ulh2dmhu?=
 =?utf-8?B?V0FoU0g1cTY4L3VrbVlQdnlUTk1hcWtVMHlJdUhkVEhhdW5YMkJEZlA3TmM4?=
 =?utf-8?B?Q0JYcWYwcEl3bm1FSDRhdEd1d1BGcitRZ29ubTYrUFgwcDdaTFBOT3RabHk1?=
 =?utf-8?B?TlUyUkJNMjZGbUwrNERETHVNb0tsQll6VHdqcG51bTREMTRIR2xZdWtCOUpi?=
 =?utf-8?B?UDVtUTd5N1ZhU09KTG4rMkQyTytzZDh0MGF6N1Q3NjlyRlU4RmtSN3k1SFFH?=
 =?utf-8?B?SGhyMnppTEV0dmkzbktzNUxWcnZqUjNXRDNUenFjVkVyRFpMR3MxOHk2S05i?=
 =?utf-8?B?R0V6VXBEcEJaMXM5ZjJHYXNDaGZwaWVRZVlHTnNBbmMzdTRob1U3ZXo4WE9I?=
 =?utf-8?B?cmdtc3BWL3JTUjAzaTZVVUtMaG4yaHYxeUdyVHJmZk5nK1k2YmVzaU1FYjFG?=
 =?utf-8?B?WDJCN3FDKzVQNEZhbVN6ZE9xeHQwWjBJS0ZCRXRIK2NCQ1pIQ3NaTGxNcUV3?=
 =?utf-8?B?clF4ZTJCUVQvY2lxUk5DRzRhdWJlbThKek9zM2FHNEtrQUZLOHZVamZnQlN0?=
 =?utf-8?B?Q0Z1eHprVStrUDdxWGgxRlVsUmNrY3NvMWpuOGpoTks3ZHp4YmE2ekVaU2cw?=
 =?utf-8?B?c2w5VElGc0drUnppSnZ0eEphRXBJMlN1VmJXRFB6ZGkrVnVseENFTlZGdDFC?=
 =?utf-8?B?TzFja0ZRWVNzT1dnY1d3YlowaERiME40aDkvdWI2UU1JajA0ejJMcFNaOVhZ?=
 =?utf-8?B?ODY5YWo5NGRhUHVodnE2TEcvZmlHUW55bWhCY2Z5WGQvTUNsdFFFWVhQZlBF?=
 =?utf-8?B?VEcwNW1KTUpMamczK3dIUGFVT2VsNjFYVWhxcVpRY2ZwODgvOUE3cFVUNUhE?=
 =?utf-8?B?Z01JbjFGUnUxWmZGSW1rNUJrMThiQlBYc0tPa3ZiWllCZjZBa215OSt5d3lN?=
 =?utf-8?B?OG84aC9sbmFYa2svblVmSlJwczBKdHpZS1U3aW1GRjEza0h2TmJtN0JjVmJQ?=
 =?utf-8?B?Z3FJME5KL2xEdXRKRUpqRWhoOVdaeFpGaEhWUFdlK3lWcjdNMDVCUjVUVWxG?=
 =?utf-8?B?TSt3dWwvdm5IYXpHNW5Cd3dWU1NVN1RZTnY4TE83Ry90eEhDTmxHRHdrMW50?=
 =?utf-8?B?cGpma2Uwb1FjaHVFdE1CYzJBUnB1S0t0N1o2bTQ3LzdiVE1wandPYTlGYmhz?=
 =?utf-8?Q?0LFOi7Q/TW33dFAwL+5+/k5hbs4trm8aD7vRs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clh0ZXhZLy9TODNqamtsQ29ycEs1bklySVpLRndLcFl3aHNobDdlSHhtVkJG?=
 =?utf-8?B?Y0lIZ1BUd1hid3hmTEEwUjdHTnJQSis3VFVjenRDT2FyNmNaVDhwU25DcUtD?=
 =?utf-8?B?RklidEFycGp3VlZNaWsvUUlrenpYV2V0REdCaU1ndGpKcjdhTktqT0p3Nmd1?=
 =?utf-8?B?VUFCa0lLZVkwUVpxMkNuaEcyWDZnaDJGRjdQbzE5aUYxL2c0SGN1QTN4dXRW?=
 =?utf-8?B?Y1poUUt0ZEpPMlA0Y0xXQUROTUpXSGxicFZaTDRTY2QwcTdLZ1lMZVoxemtN?=
 =?utf-8?B?SE9JSDVWTXlVMVlJYVYreVlFd3dMdWxVNUZqaUdzMXo2b3hBQytLTWdzN2pm?=
 =?utf-8?B?SGZ3UDR0U1QwalhEZG15OTB6TWxqUSs0NzVUU09xanR5Zi9QeVFOUDR4cjEw?=
 =?utf-8?B?QW9rZmY4Z2FzRlAvblQwMzZqWk9qNENPcU5wMnRZQ1BVSlJGWCtVQ2JPK00w?=
 =?utf-8?B?cTJkM21lSUZ1b1pFUEh5SUlwbHY5TFVyWW5wUzRiVnQ5M0pNVXhDNVdlNThK?=
 =?utf-8?B?RE5CaFI4Ri91VDBLYUlJVENsNGhyNUxtN1poZXdqZE5kNTVwWkU4bHVTRUho?=
 =?utf-8?B?THpyQWJKU01COC9zY1dyMk5ObVpXWldEYkVUWXBMbzZDK1NZUHFKVG1ONmNl?=
 =?utf-8?B?bkoyT0U5S1g2YTRjckc3ZFI3QlJiMlZiVHFqYytuUjFPNHpoTUZUN1Bsd1Rk?=
 =?utf-8?B?M1o4dDcrZ01ZMy9wOW50V1hFVUNRZjlGcDZGMFBIY1owU1dzZ0psc0o1R0hm?=
 =?utf-8?B?R2t0dVZRM2E0UmxGNDllN0lYaGc5ZXFhQXp5b0NOZmFlTVE0SklPWStnMXpY?=
 =?utf-8?B?amU5UDhsTjdHMUtkVTBGWEtWTWNwcnVRbmxleURkS0p5dE1zUGdic2w5Yk1L?=
 =?utf-8?B?WEdiMkljd29ZdXJTSi9MK1dTNFVBbUZKSHZpWnI4TmpzSk8wY2U0SmdkcG5D?=
 =?utf-8?B?ckdXdDBCYmovMHF4SktVQk5sYTc1RDc3MHhKd0FpMW5XNmsydllpZGRlQmFP?=
 =?utf-8?B?VFp1RVprQnVJQm1Gc0hhdkY2eWR3VXlKQm1KNVZsbDhBaFl6R0lVRnRGTFFR?=
 =?utf-8?B?RmFlNzErM2VwRzhMaW1PWXZuZHE2aEh0akZiL3dlamRManFwYlJVdy8yYlE0?=
 =?utf-8?B?cU1jeFNCZWFpc09haGt1ZUxYeTZKOE1KVlM2c3VrL0JHd21VUmtNc1FnRnBC?=
 =?utf-8?B?SDdWRERSbGR2cGFGbnZvNHFWb2dQU3JsQVdzd21ZU0U0MHZ4a0wrLzhmN0o2?=
 =?utf-8?B?Y1FhUEdxdTJyQWJBOEsxMWVONzRaOGpUUG9sZWpzYmVJaDJDMkRzbXBwNnFp?=
 =?utf-8?B?VGlYMktDdzRvV3NvMGo1Zkx5VmRWQmIvU3BMYjc1NDUzcGM0cHBabGlZUkN5?=
 =?utf-8?B?b3lQWkhJZmdXRXV5VVFRZ2xVOEx2aVBqTnNYbnFmQlRnbEJUdlRwaWJNOWpJ?=
 =?utf-8?B?VHkxUkc2UkJqdGJOTDNFMVpTTXMwN1F1Q3drOE9NcFdRNVFxdDIwQ1VZZHBB?=
 =?utf-8?B?ajhnV24wNnRBOExETHZZc2oyOHR3di9qUkFSRUtxM2JtWGI3MXMxQWVZRDJw?=
 =?utf-8?B?cFpGSndYU205ZTdlMXhLVUdJWWdoQTZwRHNaQStrczN6TzhqVUNFMlFzZXlz?=
 =?utf-8?B?OTdYYW9xSkp6TEtyQmliOTF3NGhFQ2YyYy9tajl2MWdPWkdDM0FxNHdvV2gz?=
 =?utf-8?B?ZFZ3YXFYTDRlNFFSZVNjVXV0QU1TM2dJZUFYVmtTSkptUndpRUhVQ2Y2ZGhX?=
 =?utf-8?B?bWNXZHBTcGNxaVpuNkFYL296L1pENlRycDY1VzFXQVZ4ZlpuWnlNY3BNbEJl?=
 =?utf-8?B?WDgreVZKS2hHR0hTSW1LOG55TC9GVVV5b3ZwRkdSNXZFaldadWZyNXZBZEdH?=
 =?utf-8?B?aUFrUUhzdVhhNkJLbHNzbHRGRHRQNnRmSVRyVlI0cWlQcGIvbFk0TkNJQktt?=
 =?utf-8?B?a25FTHlxMXRRN0xmUVRpNWMvYkU1RHd2b2dpTXZ1aDlaYjdXRDduSDlpejB1?=
 =?utf-8?B?eGxSUGViS3ZURnVPQU5mcnpkRW9XOVpDcE1waFdoTTVFN3JVaXFPeXY0cFZI?=
 =?utf-8?B?Q0xTMUxVQXVJcWxIMGtwekcwNUU3N01PcDA1Vi9aZkxRYzdMamhaaDNxYVlz?=
 =?utf-8?B?T2RyVzlGN0o4TlQ0Uy9iTWdkQi9hSVJ2V0VWWERhN2JQSThoSzdLcUJoQnh4?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c778de6-ebf1-474c-9a5a-08dde398bd3c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 05:32:10.9240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GfNP0N3qst9Gir25ybUYaUbOzwn7Mz03Z6ybzxsra8w15Adwx6humlkILJfp5xEb1TIEA4qyqb5pASID60oow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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

On 22-08-2025 17:01, Maarten Lankhorst wrote:
> Hey,
>
> I'm not entirely sold on the design, it's way more complicated than it should be, it should be trivial to add any amount of error messages.
>
> Replace return -EINVAL; with return drm_atomic_error_einval(state, class, "string");
> Where class may be an enum, but in a way more generic way than currently specified, for example "invalid use of api", "requires modeset", "invalid arguments", "driver limitations", "async flip not possible".
>
> The drm_atomic_error_einval() would set class and str as appropriate, and then return -EINVAL.
Looks good to me, but again this state, string will have to be filled to 
the struct and the address of the struct to be sent in the reserved 
field to the user.
So background for choosing this struct [1]

> That's probably all we should need here.
>
> Kind regards,
> ~Maarten
>
> Den 2025-08-22 kl. 09:00, skrev Arun R Murthy:
>> For failures in async flip atomic check/commit path return user readable
>> error codes in struct drm_atomic_state.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_display.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index c1a3a95c65f0b66c24ddd64f47dfdc67bbde86c9..5e23f4fc747bd01fa05eba63661bf7279b083317 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -5950,6 +5950,7 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
>>   		drm_dbg_kms(display->drm,
>>   			    "[CRTC:%d:%s] modeset required\n",
>>   			    crtc->base.base.id, crtc->base.name);
>> +		state->base.error_code->failure_flags = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
>>   		return -EINVAL;
>>   	}
>>   
>> @@ -6019,6 +6020,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>>   		drm_dbg_kms(display->drm,
>>   			    "[CRTC:%d:%s] modeset required\n",
>>   			    crtc->base.base.id, crtc->base.name);
>> +		state->base.error_code->failure_flags = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
>>   		return -EINVAL;
>>   	}
>>   
>> @@ -6061,6 +6063,8 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>>   				    plane->base.base.id, plane->base.name,
>>   				    &new_plane_state->hw.fb->format->format,
>>   				    new_plane_state->hw.fb->modifier);
>> +			state->base.error_code->failure_flags =
>> +				DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED;
>>   			return -EINVAL;
>>   		}
>>   
>>
Thanks and Regards,
Arun R Murthy
-------------------
[1] https://hackmd.io/f3bDn3kyRUalLn4LbMfCVQ#Commit-Failure-Feedback

