Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA9A1AEEE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 04:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA24010E8C6;
	Fri, 24 Jan 2025 03:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Til3Ty+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6736810E33E;
 Fri, 24 Jan 2025 03:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737688596; x=1769224596;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GUZqJoZxpGesNVsliDmLEc8isSlmWk1blES+ZagIrRE=;
 b=Til3Ty+WPV/jGdRUxAVnwCr0pjqrjaui1ATLkKAxbfhoDJbI1EiEejmk
 N31vD76vFaArluoAgXwwLlnIeG94f0GyDlsLAiKpn6wp0gUzm7F1fmPII
 WWbSti2KHsvMn9JOuOxCQKYwpVLGhz250B6EKpM26mSSgw/UuFIME3KLt
 9b3CNLljsSylCaTxGf/Mc1P1wxXQdJIDCtef6dGt+NDVp6SRXdFjCQake
 ouQISfyhRLDTmZHLFsL+GJXR/H0LFDOvytOvosM35aFG5WHA+k0jsaSH4
 faMaM3H8k/0rtuW20TaW+RJWgxtja9aoDzsFsn7g7okqEZp7hBivWnwKP A==;
X-CSE-ConnectionGUID: DFAA2Fn8Qli19EyQlRVmlQ==
X-CSE-MsgGUID: GmUt5FM4TyWudzVIkZV4Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55631108"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="55631108"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 19:16:35 -0800
X-CSE-ConnectionGUID: SpLSL/qjTgeZd3ZCDQy3pg==
X-CSE-MsgGUID: R1P6ktdyTP218EiHqayEPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130946154"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 19:16:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 19:16:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 19:16:22 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 19:16:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpmckoBDOGljvpxVXBf5wczeVnEVb3JiKDhIfEd37MNZ9AQL+6XGspvu4Q16G/uKvpxJyjPswad5UfTtAzcUkGwHrcI4xtBO7bPjui7HOc0AvNW4/X5Ei0sjwIO8ECV+m+rpXE/YfkS3YOMbndHTq5g1mWNdcKNH9usNPvx0Oq4ZCAXFl4V+LFPUnaRZfRj9xT9XH7kxRg2iSLRc0ZdKp738/194PlbDSiQ+qSUgh1LWdWAYT034XoM3F2bnWzjJOtwB3y02GnOe2t4B7PsvhJyB1dFHqjnoX7Xu4oLG47ddyJs1C9n/YOYF5NFrVu3sgFyJKukAf+j85lRwAwOToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH9vfjVceY5dot25l63w4tfYY3BdmVEE0ndRV9hNy4k=;
 b=bTPJ9QYOH/DsYL2FgbWDIUkXOtuUribMqMEDTCEQT6xNekeGY3K9czO8QYYtNdeJv65ukbNDgyD+lwtrTSRPY81zudmYrTwdL6/YlP7TjyptEzcX8KKLkQLQ4cWOXUrASLrWw2T8DbHNxERFrFdU/Q+X00RoHTgNIZXKz/cZyMBbAifDIScHqHuvxlrwTccSC5AmOB2NzmCeBOEl2bzXWgsu14L5h1arGEpOcWs1w2EA6CMXR1g5bcwVg3soHwcwlizgaUbK1CpCGlLsEx7XdxLWmsmy9Y3yWBLB3KvqM+RzrrTy0SzbksYZKOeXDyYrRcQJnDJlFmj2Qqp9tK927Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DM4PR11MB6068.namprd11.prod.outlook.com (2603:10b6:8:64::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.16; Fri, 24 Jan 2025 03:16:15 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Fri, 24 Jan 2025
 03:16:13 +0000
Date: Thu, 23 Jan 2025 22:16:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedriuswork@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/i915/lspcon: do not hardcode settle timeout
Message-ID: <Z5MF9_SAZZJjedXb@intel.com>
References: <20241017075725.207384-1-giedriuswork@gmail.com>
 <CALt+6nqxMZjuZuOKaj8Cx4dcNZx0n-0F9aa97d-vZoMWeN=bOw@mail.gmail.com>
 <Zyk8dFthM0EA2A_K@intel.com>
 <CALt+6noH3qSJNFYeVmhhGahcFiUsti5Rbt8+ef8QKOi37neaEQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALt+6noH3qSJNFYeVmhhGahcFiUsti5Rbt8+ef8QKOi37neaEQ@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:303:8e::14) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DM4PR11MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: 4608ad03-57d1-410c-3bb0-08dd3c257473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk9iVDN5Z0drMGZXMFVPOFhZbERZVVpXbWg4MVhqbE92S0pHc04rdFV3b0ox?=
 =?utf-8?B?ZEV5Z2dHWWl1TjkzcUZkaHJmSStqWVpMOUZic09EMVBtUnJydGFocHVFb1po?=
 =?utf-8?B?TWg1bDR5VE14YzhVczU4RUMwWlVONkNxQTlHYmlDdHFoNDFUdmU3ZlJldjVO?=
 =?utf-8?B?RXlrWWZNbzBPUE5qTldyWEFBWmIvbXl6MUJsZE5RbUVvTWtjQ1gxazVoVTQ4?=
 =?utf-8?B?bmVjcDZZMk8vMnJnWFZ1WUtwaXVuYVduZ3ZiUVhVT2wrWnQxR3M5b3JsN29Y?=
 =?utf-8?B?VEFlRS9PbCtBcWN6RkllV1lLc3ViUUZndG9XMTJETmdDZDNoOFJLdlROQ1BC?=
 =?utf-8?B?RGJrRGduZTQ1QmhOQmpqYkdzOVErS1dKa1hoQXFPZG4zM3JOZStKVWxFQ05r?=
 =?utf-8?B?R01sRXVlc202WFE2ajdEZUk2RjVrVUxlNGNIUS9xQ1FBd2VIdjdYREtzSnFT?=
 =?utf-8?B?ZGhwTENXaVNRbEM4UmEvcWN4SDNRRGhQNDk5NW5vc1FQOEhKWWxXbm92akE2?=
 =?utf-8?B?S2JUVzZYaDNhN0lOVkthUFc0Zkw0a1FYNWhubjVNY3pXZk5HZFBNRGROdy9Y?=
 =?utf-8?B?TXlJc1kwV01VMmNuWnYvVkxiVVZoeVMyS1dhOFlLMVhzY2VsNE4vK2h5b0Rp?=
 =?utf-8?B?L0RucERoSXRrV2xIUmlyYktWTVhkWDErVGwxdkdBZWx3RTlJVkVpUGRsdlhx?=
 =?utf-8?B?aWtLdGxCcE4wNW1ENWRybGh1ZzFraHZuOXJFTy9sdkt1TTEvdjBkdkRLYTJD?=
 =?utf-8?B?U1ovV01nMkZWakdKOHl3d080dDJ6ZWxBZmNPNUtIOWxoU0YwWUh3RmxZWWM4?=
 =?utf-8?B?eEVyZWZkajZGS3dwOGd2ZTJMeDAwL3IwYVZoMWcrQ1Y2akRTbGREWWRXRFVI?=
 =?utf-8?B?NVU4VE8wMis0akNRVUF1TVVLU3RBWHdUNk5yR1VhRnJnajhXeldUTzdselZk?=
 =?utf-8?B?VDFzUFZzY2hTSkpiQ1JNQnpYenhJY1RURU16SVpRSTJsYURmbFpBYjlneUJL?=
 =?utf-8?B?Q2NXSXlrVm5hcmdFaVJEcHZublBrcDhPdjBoS1lEbGtEMlBTR28zM1FHMUtF?=
 =?utf-8?B?czVsNWZLR2xuc2M5cUhSb003cVVuc3dEMVA5VUdRT1UrZSt5TmJtck9KWmh2?=
 =?utf-8?B?dlRjTlBzNG5KcGNTYzJnTS80Y1lLbGtvcWpRb2ZOREVIYis3ODFCU2R1RFR3?=
 =?utf-8?B?dXlSeFBIUjY5Ty8zcXJuMFN0L0NaRGZ2ZFQ1a1lCM3Q1Nmx6SDB2SUdaL1cx?=
 =?utf-8?B?QWkwalBIYVQ2WTJFTHhQdXVwejlPUzZRMDZVWkE3NUluOFlaSmtuSGZvaFRu?=
 =?utf-8?B?RjE5WW9YNjVBd25NbzI1Y1pPbUcwT1Qyemt1ZUl3QVdXenh3Mmg2c1AyNUhm?=
 =?utf-8?B?Wk1MaGVvK1JGNmJVVyt0RHJTdGM4WG9rVUFhUEovVUhOWXRyUjVKdTdRUURH?=
 =?utf-8?B?MmJuUDNxQlVXeUtSdVB3QlU1NURWTWJ0TWxXT0pVbWZhM3dFYzdFTXJIWE5r?=
 =?utf-8?B?WXVCQ1M1OHlGUlJ1N2dTTlY5RU1CTC9lVTR0ejh2d1d0NWFRMTlTckhjSEkx?=
 =?utf-8?B?MDFmaDd5TGxQNE00OG5lM3oyZ3IrU1RmQjdlUWRJM3lPSzk0d2orYSs5c2FS?=
 =?utf-8?B?SEo4RHRXVkRkZHd5bFljTVFtVGVYWmtpeWx5NzVtUFpyeWdQbk05NUtlN1JV?=
 =?utf-8?B?NnM1SGl2cHdHNU0yMGZ0N29kVm9FeGR5UngxUytZUHJxS3FXYmJXdktRNTBH?=
 =?utf-8?B?TXpYc1g4TVVYY0NNdXo5anBnL3B5SXp6bFY5SmhxWU84L0RmaDJkbFVrbys3?=
 =?utf-8?B?SzgrajFDVFZDYTlReU1OV3IzRTg5Z1M1TGVWTzJlaWpDeGZaQjkxWWJsY0Jm?=
 =?utf-8?Q?KiYDEJ8m6YcoK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REY3QWdzS2owT2l1UDBxcVFWVjhBVFlUVGNIdzFRSGVucU9MTzcrVjJvdzlr?=
 =?utf-8?B?VVEzZlUyVjFRYnVFaU50OUZiU3dYK2RUOEtjQnEyUlNTaDJFQ0VZZXJCWllV?=
 =?utf-8?B?SlY5dHhXTE1UNVJGMTJLTkZtN01STFJ5eDFjcXdYRk5VYjdRQzFpdEFnNEN2?=
 =?utf-8?B?U0o1WTVXbFBNTk5zeGNCa3BRTXl2QTNNSFpZQkxBT3ZzUFJpZFhuMjdvM3Bt?=
 =?utf-8?B?dkRvN0l1dEtUZjhva3dra0FVaFRxZFlDSGl5NS9yNURNVHNlYjdWczBEOWxB?=
 =?utf-8?B?d0gyMEFiYzd5VC9sN0poeE1MQXM1ak43QVFZU3paa09IZVNXR1hwbFdWdElv?=
 =?utf-8?B?T2VPcGR0cTgyOThGWEZMVk1neHRNUzVIMHBFNUcyUHdiajJ2Z2tiMmYvOEJv?=
 =?utf-8?B?dDJWN09MeVBvT1VmSFI1V2t3NFNMYXI5c3JaNEZHQmxzakVGRWlRRkFvMC9Y?=
 =?utf-8?B?SzFRWGw0Q3pQbTBxZnRlRzJKMDlzMmVTbzNmRGNkVmZFQ3pXMDl6MGVnYWEv?=
 =?utf-8?B?bGkvWXhYcjkzbUNld0swTWlsVCs2amtBNm54VlRHdkRVZ1lzQ1UxZEFJdXZQ?=
 =?utf-8?B?WjlVUlhmTTV0K2I0aDRJM29XNExWSlBJSGpMSjFML0MyZEYrMkRVVUplY1lS?=
 =?utf-8?B?TWRLLzRObWFwS0NkNExNUjNlVExkazViU24yNmFMcktiOG5wM1dzTGdPaDh5?=
 =?utf-8?B?WVhsakNTcm1LK2tUdzl4UHhoNlROdVhOSGM4dGMzdXRvdkx2WTUxWFMrZWlx?=
 =?utf-8?B?T0FYb2oyaWVkaldpcTNEaWFPbWl1M1hOMTJSU0x6MVdvV1d6KzZjcG9ENHhU?=
 =?utf-8?B?K2VhT3B0NEpiRExsc3dnOGl1dkU0RlkydG1JM0UvZHd0M0NzcktQdk1QU3Fh?=
 =?utf-8?B?QW9NbGxJV0Z0TVVYSUlMNXN2QjM4YzE3eGVOQ1M3aVVhSVNmWFkweW9XbVF1?=
 =?utf-8?B?VHZBbTBSNnZ1blMwV0xPalRMbVFUM25iZ0drYld1QjZ5QkptTWI5dk5Ma0lT?=
 =?utf-8?B?QlZJQzJJNjRSb1RBNlIrSWg3azFtcDIybytLYWorbzBMd3dhaWZpS1lnQTlM?=
 =?utf-8?B?Y295VElBR295NTVSZm90Q3ZrSVVuVlhlOWp4YVd6YUt3dmdDTXJ5MHpEby9R?=
 =?utf-8?B?bHZYVzM4NnJyOVdUTXI0a3Z6eDhyOXF5SkswTFZ0MW44elMrUjNVZUJoNHA1?=
 =?utf-8?B?SHI4RUZQZS9aeEVLRHhlcW9HRU4xQ0ZWbjNEaEkwbDd4Um95V0t1bndtL0Jy?=
 =?utf-8?B?WnVKdXBnRENCbnp2SlNhOFExWnIwbGFLNklYSHA5VkM3eEd0WVpLMlgvd1RH?=
 =?utf-8?B?WDNzRUYrUDZSQVp0RGIvL3NMaFl3Z3hXZ25LWWwrMjlFd041WHRObHRad2k3?=
 =?utf-8?B?QVpSYU1QdTh0Q2VWbnBXN1dDTTFnVUM0VHBDNWg5aW5jdXlSZmZQTVplb1Jr?=
 =?utf-8?B?bGFqeWl3L0pGdmpsZnBiWGY0d0dIL3lLL0lXU3JzUEVCR2dZcDEyOWxoY2o3?=
 =?utf-8?B?NHFsQUkvbGlSaDd2OTR0K0l2Rk11eGk4Qi9zaG1yVXdTZFYwRFljN2U4YjZo?=
 =?utf-8?B?MjJXU3JldzM2N050b0pNdHhGcVZZNFJhSHlhM2UwcUs1a0VpMTR4YUw3ZUlu?=
 =?utf-8?B?VlVRM0NiZ0NzSDliWE1NdjRIbFhXVzE5bWdBWlJTdTdKZmJDcXFpbEtwbUda?=
 =?utf-8?B?VHlGN1UxSjlYaWgxOGRpMlI1Z1JPT1l5Ump1bGJtVGJJcVRtNWwrRkVIMDZs?=
 =?utf-8?B?WWdYYVdYMEJoVXJEYVR4WjJlbjBPZ0JwZjJCRlhmZUNRNE5Za2FJUmVUVU9W?=
 =?utf-8?B?bFhkcjhqRGtmUSt1UW5Va3pmdkxKYmlibjFzQ2JEaFFnZFljS1RNam9kZjc0?=
 =?utf-8?B?OG9yVHJGZW1TYWY1dURaSTBFM1g3TkNDbm1OYU53c0EwaHpNWkUvTHlZNG9l?=
 =?utf-8?B?aFQxVVZNR3Njb3VSTUpBTGRqc2R6WmF1WEQwNG9vQnFkQXpPWDlLaG5WbFBn?=
 =?utf-8?B?OFpVd0dZYTJ5OGppZEppUHdZYVFZNWR6VmswWmlrcUdDdXdEM1QyYWVET1Uv?=
 =?utf-8?B?RlFBbDBEaUlvUUhzdzkxOVJ4ZVNMZXJvcTNPQWgvSE5kSTFKOHhWZmdKd01u?=
 =?utf-8?B?blBhdzF1eGs4aUE0QVJsL2NZSEZaMGVFOTdWTEphVGNYcVBiWEhxUTNHRHhR?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4608ad03-57d1-410c-3bb0-08dd3c257473
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 03:16:12.4067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3Y+nJL0JyZE7lvpeBc4dcDbK8tTVJXA3ydiACSRXj64BNuMpT1qBPIZHeOsPz760vcbbmbx9rh0qwJYUhGQ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6068
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

On Wed, Jan 22, 2025 at 01:15:31PM +0200, Giedrius Statkevičius wrote:
> Hello,
> 
> On Mon, 4 Nov 2024 at 23:28, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >
> > On Mon, Nov 04, 2024 at 02:09:46PM +0200, Giedrius Statkevičius wrote:
> > > Hello,
> > >
> > > Kind ping.
> >
> > There was a pipe underun in CI... I honestly don't believe this patch is
> > causing it, but anyway I decided to trigger a retest there before I push this.
> >
> > Thanks for the patch and review.
> 
> 
> Ping. Could we merge this patch? This plus another patch (that I have yet to
> send) fixes replugging the HDMI cable on my laptop.

First of all I'm sorry for the delay here.

CI was the problem, not the patch.

I was going to merge this right now, but I noticed it touches include/drm

Sima, Dave, ack to get this through drm-intel-next?

> 
> Best regards,
> Giedrius
