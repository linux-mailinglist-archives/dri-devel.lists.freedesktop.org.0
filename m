Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E96C9BF186
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F1F10E212;
	Wed,  6 Nov 2024 15:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4tjlr2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436A410E212;
 Wed,  6 Nov 2024 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730906675; x=1762442675;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L5lOxODCP9gJT7GokPf0smLDHBwT8XwnMp+943S+omY=;
 b=f4tjlr2lUqXMWyIDJegJIi57fFSQq3B1VJwwYqGF2ezkM1IOIrwl1bN9
 db6ul1cmTE/o5TM1DPtsTPr5VdnQPdVWslvcgRatmO2rMg9Jp2dPEB039
 tXDqoSumdif6xCxcFwSQ8K5tBze6EERhrWpPb9MO/7bqFUNSWJ8IIUVdG
 FyppwgnVrMoEaoR4/9yiHRD/5Gk34C6/JaLCou8jwj08L8GqXuudwqgLG
 j27gCnpB4ukLY8aJBJ6j2AbT8VrgTOBQItAgt42NRlVf95Hmju3z4/4hD
 3pBeFap6BCnTArQDZxiUdni41Tc2M1s3BhpZk8ItPP8+De1juzHFO9VJp Q==;
X-CSE-ConnectionGUID: o9vwVJGIQ/epX97W4neYIQ==
X-CSE-MsgGUID: ZIhB0FnpRPCDGP8sx21pfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30562533"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30562533"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:24:34 -0800
X-CSE-ConnectionGUID: FJwR0ZIlSmi73Q8hV/Rl5w==
X-CSE-MsgGUID: xDVB2ic7QAObGSXbUOcsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84769404"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 07:24:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 07:24:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 07:24:34 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 07:24:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLjK9WFwHEg1MbrSDkRqmoProgKjQYFx5GT1hysDlge+ZERe8SrxB0BW9bFnKSIv4qF+wW0Cd1IN/cT3IVUYWlN9PikuAB+a+MLu4hTrI0OkW7X/NqQ1q0n7sRra+dE62SAlCVWL+ug8B0Af3exmHlITs+fkVK/oobPBdvMMOsy6Kr+36uv7/j1Oyzp0TIisd6xEZJLqGBijnWhouPkLydNgaOBa3DWpjgqfipnz9sNy2bexjess36pDMKdAHAYs7HfZFJLBEp1S3fTCbR9jooYD4W2zOvlkHh5OfH8cpbd3o8sKcW/5TU9eXeyTDIxMpWsjxAFtqzVrtV+J477OYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myYQI+LZh/1uG35bI0cmE6NqIHGhMxMHQ6CnhiKoPWY=;
 b=Tsm9sqiStootOTueuIuvgGALBVEoW89LN5KguFwRQ1l3C8gLSQ1uLjhM1DBLu7eX9cs+WGnJHqvjOh6Y+FpjhfJhFazFaIYqqjxMM8Ux/XeMuTQg5YpaBgFCC6xLzSu1FOnEQRnmHQ16Y9wieK+HNnW2xqi+iYOhRZpzLt+bwdf+MEIgrGDuRnUsHr8N5ZmTf476zBro9iqMvcBHrWeJMlix1Ojypeaj1Oc2JejqD6g89j49NtsjI0xmZpWjFty1cXsIscgyjNSbZmtp+6gdXmDa3NfxZscHYe2FojJIHUt7rJ4svtYUcOjJGhsijqiX+c+trh/ks6TMKtHSZeQNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8796.namprd11.prod.outlook.com (2603:10b6:806:467::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 15:24:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 15:24:29 +0000
Date: Wed, 6 Nov 2024 07:25:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
 <ZykFrJIx9M204Weg@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: cccc94b1-dccd-4d6a-1297-08dcfe771aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mi84b3U1dHVtY0N2dFF6b2pmOUlITG00SnVQSHVKVldyVzdGT3JhMmsra0cy?=
 =?utf-8?B?aW05d2JHS1A4cnpxWS8yN2VveWhidUp0cXpOem9yeDFLSW9CSm9KdGt2bVJz?=
 =?utf-8?B?TElsenNpZjVoRUZkYXBJRFM1TFZTRnY0eUZxTUxKU0JkdUVyVzNzVmVIb1pZ?=
 =?utf-8?B?dWgxZ2pjaWYvRXp0QUpsSXdSMXR6OHJnbGtUT2U2SlNzaG1SdFdsLzd6Mi9m?=
 =?utf-8?B?ZlVrdnFiU0VmVDJ5NHRLWU1WNUZBeGJ2blcwMkFud05NeWRTZWVDNCtiLzJa?=
 =?utf-8?B?OHhnSlhSTlQyVHZxaE9OYWhFck5GdDB5MnJtT2Z1Q1c3clZNbVVKdkpzZ2VH?=
 =?utf-8?B?dTJmVXJWb2puazFFWHJXWVVLLzNoYWtsOGVGczJ3TmpmUGtwOXMxMis2eWdR?=
 =?utf-8?B?dFJLQ0NDWTUxc29rZkgzMlY0TWNWRENYdkczakQvVWdhZDVFQysxSXNjZFpI?=
 =?utf-8?B?c2g3SXUrUW5JckY1SUsvQlN4Qlk3RjFnNkxMaFlVbW1sNS9VNHUyNngwVzRz?=
 =?utf-8?B?c3BHaHg1RkdxdzZ2NExBc0JWSzMvbU1PV3NEdFovV0FJcUFqa1l3OXBxbWxR?=
 =?utf-8?B?RDJjR2VVMnZ0dys2b0U1dW5NUnhYSWZpNDVhbEk0ZXJselFaQjVPek5xWFJo?=
 =?utf-8?B?amFZVTAwVjlHRlE5RWNWbDRVS1VZNGx1M0JjbnYwUzh3RlljSzB2SDQvL0Nt?=
 =?utf-8?B?c2dBMGZyOXVYNmpXaithd1V5a3B5UjkvK09nTDRPUE9IeUxkeXBrVnFRREVP?=
 =?utf-8?B?UmZmNmdIZHFTYUtScW9jbDFQenFWdUcwU202VlBuLzYzNUFyVzIzWGtsaElT?=
 =?utf-8?B?MkZmdVJ4SzFMNVpLSGZlQUMwZnhyVFIrQVliTXdmcGhzcHE5UEY0ZkZSZGoz?=
 =?utf-8?B?YlB4N09zWnpxVjR5TXNvMTJjMlgwc1lZSndxcTh2ejlBdDVZaVRYY2U2d2Rt?=
 =?utf-8?B?WHA4blplM3lhVFlLd0o3ME5QVkVBL24rM3RTMHZCK1dXYjRZV0Zvd01KL3hm?=
 =?utf-8?B?bjBNR3MwMU1vY1ZNR1o3YVpVUDQ2K3krcGNLRk9ackZ6TTROUFl2ejE0Mm4r?=
 =?utf-8?B?cVFFYjJTNjNFdXhBR005RHRvKy95YlBBTHJscWRIclF1M04zTVVwUitwVFJq?=
 =?utf-8?B?aFAyendVQVJzazhwdkY5SjVXWnBIQlFJY0NzdSt6S1NuQ202L2gvbXRWTzh1?=
 =?utf-8?B?UFJUSTZuWnJDY0NEUmpNeTVZSVJjdXE5dDVyRzRMemh2TFA3TlAwRE1wcE1B?=
 =?utf-8?B?YzFqOWxCVFpPQmlpUDZJdnZyYlNjekM3c3dteVN0TjZnY0xwdEtkUCtRY1Qy?=
 =?utf-8?B?VStPbFFjdEgrM01FMURFMUlDSHBWc2djMFFyVENXaVJFQzRHK2xOTS9iOSt0?=
 =?utf-8?B?S3NVU1BrVGc0WUxVSmpDc2tuaW96MFBPeThCK2MrSjMrbWZNd3hrWi9ZKzhj?=
 =?utf-8?B?dXNWQUtBTVRFR1NtdEJkMGhpdHBnbTVhZ0NWQWFVZm5sWVgxdUNiaHJEa3Zi?=
 =?utf-8?B?ZmdSMmRrYzluVWxicXFWaVJsbTV3NGVqZlhpSjdBWm1XcEx1NlkwMG1hVEky?=
 =?utf-8?B?RWdrcEtlc1dVNTNQVEF2Z1NUYk1tNUJWcGZzVENWMFRDZ1hja2pkVmNvMGxO?=
 =?utf-8?B?RXR2WEZhTmxUNE1QWEFWRU1jeXZYWVptd1N2QU9Da0JBZ1JZVkMrVHI5WlND?=
 =?utf-8?B?YU1jbVJvKzkvYmRSUTdsVDI2bGFZZWdzTlZTRk9HMmxXcHhRSmdrY1I0YXp1?=
 =?utf-8?Q?n0XVsF9drNH8c4sATo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmJueWdBVEVVaExJdTk0NVI4Y0FVcllVMlhMM0VmdTZ2RXljUW1KbDRJU1Iy?=
 =?utf-8?B?V1Frb3VldnRoN0tzZDVmeThlWGRMVm5tSGdHTExab04wRmQ2UWUvS2RaWUdO?=
 =?utf-8?B?SjBpN2I0Uk82YTZPMEpUTWd6emExRk5XaDhFWjdmb1lyb21SWmZmY0wvazNp?=
 =?utf-8?B?bWNJUWJNTk5oNmNoa2UycFJGRnVYS3pEelNFMWhuUUd2RjY5WEhsTG1OdVg0?=
 =?utf-8?B?SzRXblBMY3VMRWdDOUZWd1N6aFBXS2ZDVXBCQml6T0lrcFVSTWh5UWN5d2dm?=
 =?utf-8?B?YldIVXVwcWNQR25Ra1lxZW53d2QzaXJubzk5cTQ5VnZYTFVORHlqVUw2eWJF?=
 =?utf-8?B?SldIUmRtRWlPYitLdDN6a2NSMlUxcVo0S3FSR3J0OFZIb2FnSktBdEd4RjlE?=
 =?utf-8?B?eGJjV3ZOa0tyV1pNaG1iR2ZZRUNVMFRoZzdXeWRWQUFjTm1BOHhaZnpERUdZ?=
 =?utf-8?B?NVNwZ1RyOTZ1TUhUSmpSLzFIWEVpaTA1TTRQbE1mMHE2NmVkUWhTSGNPczU2?=
 =?utf-8?B?aS82Qzl6L3RiNEVjNXRuYmlOUXROUVNzQklpaG1sRGNyQW9OVENtTG85TnNZ?=
 =?utf-8?B?Qjl4VnhkbHBiNFRueTFpMTBIL3lhSWl1cGwrNGI1bFdIWmFETi9rWHg5K3FT?=
 =?utf-8?B?UGdQbm42QXdnTWFXT0gvVVpndlZIRWVnZmM4T3o2YUlMa3FYS3MwblNkNmcv?=
 =?utf-8?B?S0FucldDMnB6NDMvNDNCTGw2cXhtSmlreEF2bnZaUjE2TzVxYTVYTTM2QjlI?=
 =?utf-8?B?VkJZMWZHdVRPbkFOQ2RhSjkwNS9jempteG1lWS9ETnZOTmZhMU9DUldQQWZj?=
 =?utf-8?B?b1M4eFlaUzFpMnNsWE9HdVV2cGc0UGNhcEN6RGtXUlpPREkvZzREVGJiUHIx?=
 =?utf-8?B?eTdvNUlWdUdjT1d2dkd4eENrMitBN2NIQitaZG9EMUY0Mjg5NTQ3RStsK0pm?=
 =?utf-8?B?MmM2RjE4dlo1djEzQzdHVTlLaEtqNnpRS3VVT093Y1M4Q0NTU0cwN0Y0L0p4?=
 =?utf-8?B?blRUZktqeDF4dmtqOUU4L1QzNjlCNGxVMXNiYVhrTWptN1BOL2NKQW9sdGNn?=
 =?utf-8?B?bjBvN29CQzM4S2NCdEZxUUUyMlN6bWRBaW5LNUwrZXRyUU9YY0FEMWg1Zi9Y?=
 =?utf-8?B?VVMxVG1lS0J0TGloSHAwNDlyLzN4OWRZM3c1MDdxaHE3eGlhZWI1b1pPendo?=
 =?utf-8?B?N3dscXpiaHJXT2VjOStrWjRmbEd0SjNlMnlCaG9lWjNTSWVwd00rZktkTHpP?=
 =?utf-8?B?cnZ5cUFyQjVJQU81ZWtqQ2RnRDcrTnZtVXNvTFVHKzNrN1lXenhUNk5ZTGo1?=
 =?utf-8?B?V0xsRWR4dmIvdW1XcDdPMkhETUU1SXJhRlRTKzRxTlovdmluVDZqMlEvSW05?=
 =?utf-8?B?czBWNGdybmJrRlA3TkhTb2EzWlR3Y0Z4aWwxd2RuOElQcDVWeXpESEFTOWNz?=
 =?utf-8?B?YTgvMlFNUllJN0NLdEp1bml1MEI2MVhQK0xWU2dKQXBkU1BnaytUTlFISVE2?=
 =?utf-8?B?ZDBDNWV2b0dNME1KQm1Fb0RTZkRTVVdDdDYyWGJ2RHNkVXNwMzBXODVKMTFY?=
 =?utf-8?B?aE1YM1ByS0JPTFN1TVJLeUVQUldjZllIa1FrSmNhNGxPM2Z0SHhEM3lyRGRF?=
 =?utf-8?B?R1hqTVlVanlHTWExTnNGOVpoZnZWVXUxMnhRdnFsd3lvcTZaSFlSbWthYmEz?=
 =?utf-8?B?dUpEQVMvTkFCdVpYaGxYazlwQkZtRGYxQXJKY20xMWd5SHJ3aDl2WnFsdnF6?=
 =?utf-8?B?VU9MM2FMMURZQlA3TWdHUXVTWTJsWHlqSDNKN2RuMnQ0dEV6eFgzSURMeWkw?=
 =?utf-8?B?cjBITnhrVnBPNUFUTE14OWhWSFY2Rkd5SDMyYkUwRXM2S3R1U3FmNHczaDRM?=
 =?utf-8?B?SHpPSXNzanNOTXVvT0piNFZCdWxtQ0J2OU9mckh2ZEVKQ0JkSkd0aFdoSmQx?=
 =?utf-8?B?TFh6MUMyQTRhNVl0SGdwZWU3K0JkNnhucmE0V3N2YjF1YUswM3huRTNXb2l1?=
 =?utf-8?B?bGVzdFZOWitiVVRYamJiVXhwNDJwUndqOU1VVVlwQlc3MkhsbWpHTW5jWGpE?=
 =?utf-8?B?NHAxVGlObFB5MmJyZ0NwRkZ6STZEUytoUVY2ZHpmZmRhSEdCRkVla0YrWnFs?=
 =?utf-8?B?VzZCMkR4YUZzRzRKeE9WbUxiY2xGVVFZMXQ2UUt6djFENFlnZHNOT2RCdUFF?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cccc94b1-dccd-4d6a-1297-08dcfe771aff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:24:28.9561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMSksfHbKUXpzaX11gOiabzeSs+ddyW8b1K/Ur1Im73GAl0n5BjfmB+3As4vxumMDNA7pQzbVwJyqha8MH8Fyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8796
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

On Wed, Nov 06, 2024 at 10:48:45AM +0100, Christian König wrote:
> Am 05.11.24 um 19:35 schrieb Matthew Brost:
> > [SNIP]
> > > Well we spend quite some time removing single page mappings from device
> > > drivers.
> > > 
> > > The only remaining use case of ttm_bo_kmap() with just one page is the
> > > ttm_bo_vm_access_kmap() function and I was really hoping to make that one
> > > TTM internal at some point.
> > > 
> > This is still static, right? I suppose this exposes this to the outside
> > world though in another place. I asume there is a reason we can't use
> > vmap in ttm_bo_vm_access?
> 
> Well no, the point is we don't want to.
> 
> There is a huge push from upstream to avoid using kmap/vmap if possible.
> 
> > > > > You need a really good justification to bring that back.
> > > > > 
> > > > The use case is EuDebugger requires essentially the same functionality
> > > > as ptrace -> vm_access.
> > > Then why don't you use ptrace in the first place?
> > > 
> > I think the debugger speaks in GPU address space thus needs to access
> > via the GPU VM -> BO, userptrs.
> 
> Exactly that is strictly forbidden. You can't access userptrs through this.
> 

My mistake for mentioning userptr—I clearly caused confusion. This patch
itself has nothing to do with userptr; it is accessing a BO. In Xe, a
userptr doesn't have a BO, unlike in AMDGPU, where you have BOs for
userptrs.

The above use case was an example of modifying a GPU program with
breakpoints, speaking in GPU address space rather than CPU address
space. Hence, we cannot use ptrace. Userptr is a possible example, but
that access path in the code is different and, again, has nothing to do
with BO access in this patch.

> That's one of the major reasons why upstream has pushed back on using kmap
> so massively.

Userptr access is not part of this patch—it will be a separate code
path, so this seemingly does not apply.

> 
> Can you fully describe your use case? In other words what exactly is your
> debugger trying to do?

See above; I hope I've made this clearer.

Also, I'm not really an expert on Eudebug, as I haven't been involved in
the development aside from reviewing its interaction with the core of
Xe. Any further explanation would likely require me to loop in a
colleague.

> 
> > > > TTM mapping non-contiguous VRAM doesn't work unless I'm blind. User BOs
> > > > which the EuDebugger accesses can be non-contiguous, hence the new
> > > > helper.
> > > Then why don't you handle that inside the driver in the first place instead
> > > of going through a TTM midlayer?
> > > 
> > Well common code always seems like a good idea to me. Can do this if you
> > insist though.
> > 
> > What if I change my new helper ttm_bo_access to be based on vmap for
> > SYSTEM / TT but honestly that seems wasteful too for a temporary
> > access mapping.
> 
> Well, I think we need to take a step back. The major question is what is
> your use case and is that use case valid or causes security concerns.
> 
> For example userptrs are imported anonymous pages the GPU has a DMA mapping
> for. Re-mapping them into an user address space for debugging or even
> accessing them through the ptrace interface is strictly forbidden.
> 
> We already had people trying to do exactly that and it ended not well at
> all.
> 

Again, if we can focus on what this patch is doing—accessing a BO, not a
userptr—I think that will help progress here.

To bring things together: "There is a huge push from upstream to avoid
using kmap/vmap if possible." How would you suggest accessing a BO then?
kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
failing to see the problem with adding a simple helper based on existing
code.

Matt

> Regards,
> Christian.
> 
> > 
> > With this, I strongly prefer the code as is.
> > 
> > Matt
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Matt
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > Reported-by: Christoph Manszewski<christoph.manszewski@intel.com>
> > > > > > > > Suggested-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
> > > > > > > > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > > > > > > > Tested-by: Mika Kuoppala<mika.kuoppala@linux.intel.com>
> > > > > > > > Reviewed-by: Matthew Auld<matthew.auld@intel.com>
> > > > > > > > ---
> > > > > > > >     drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
> > > > > > > >     drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
> > > > > > > >     include/drm/ttm/ttm_bo.h          |  2 +
> > > > > > > >     3 files changed, 89 insertions(+), 64 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > > > index d939925efa81..77e760ea7193 100644
> > > > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > > > @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> > > > > > > >     	return progress;
> > > > > > > >     }
> > > > > > > > +
> > > > > > > > +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> > > > > > > > +			      unsigned long offset,
> > > > > > > > +			      void *buf, int len, int write)
> > > > > > > > +{
> > > > > > > > +	unsigned long page = offset >> PAGE_SHIFT;
> > > > > > > > +	unsigned long bytes_left = len;
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	/* Copy a page at a time, that way no extra virtual address
> > > > > > > > +	 * mapping is needed
> > > > > > > > +	 */
> > > > > > > > +	offset -= page << PAGE_SHIFT;
> > > > > > > > +	do {
> > > > > > > > +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > > > > > +		struct ttm_bo_kmap_obj map;
> > > > > > > > +		void *ptr;
> > > > > > > > +		bool is_iomem;
> > > > > > > > +
> > > > > > > > +		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > > > > > +		if (ret)
> > > > > > > > +			return ret;
> > > > > > > > +
> > > > > > > > +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > > > > > +		WARN_ON_ONCE(is_iomem);
> > > > > > > > +		if (write)
> > > > > > > > +			memcpy(ptr, buf, bytes);
> > > > > > > > +		else
> > > > > > > > +			memcpy(buf, ptr, bytes);
> > > > > > > > +		ttm_bo_kunmap(&map);
> > > > > > > > +
> > > > > > > > +		page++;
> > > > > > > > +		buf += bytes;
> > > > > > > > +		bytes_left -= bytes;
> > > > > > > > +		offset = 0;
> > > > > > > > +	} while (bytes_left);
> > > > > > > > +
> > > > > > > > +	return len;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * ttm_bo_access - Helper to access a buffer object
> > > > > > > > + *
> > > > > > > > + * @bo: ttm buffer object
> > > > > > > > + * @offset: access offset into buffer object
> > > > > > > > + * @buf: pointer to caller memory to read into or write from
> > > > > > > > + * @len: length of access
> > > > > > > > + * @write: write access
> > > > > > > > + *
> > > > > > > > + * Utility function to access a buffer object. Useful when buffer object cannot
> > > > > > > > + * be easily mapped (non-contiguous, non-visible, etc...).
> > > > > > > > + *
> > > > > > > > + * Returns:
> > > > > > > > + * @len if successful, negative error code on failure.
> > > > > > > > + */
> > > > > > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > > > > > +		  void *buf, int len, int write)
> > > > > > > > +{
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	if (len < 1 || (offset + len) > bo->base.size)
> > > > > > > > +		return -EIO;
> > > > > > > > +
> > > > > > > > +	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > > > > > +	if (ret)
> > > > > > > > +		return ret;
> > > > > > > > +
> > > > > > > > +	switch (bo->resource->mem_type) {
> > > > > > > > +	case TTM_PL_SYSTEM:
> > > > > > > > +		fallthrough;
> > > > > > > > +	case TTM_PL_TT:
> > > > > > > > +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> > > > > > > > +		break;
> > > > > > > > +	default:
> > > > > > > > +		if (bo->bdev->funcs->access_memory)
> > > > > > > > +			ret = bo->bdev->funcs->access_memory
> > > > > > > > +				(bo, offset, buf, len, write);
> > > > > > > > +		else
> > > > > > > > +			ret = -EIO;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	ttm_bo_unreserve(bo);
> > > > > > > > +
> > > > > > > > +	return ret;
> > > > > > > > +}
> > > > > > > > +EXPORT_SYMBOL(ttm_bo_access);
> > > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > index 2c699ed1963a..20b1e5f78684 100644
> > > > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
> > > > > > > >     }
> > > > > > > >     EXPORT_SYMBOL(ttm_bo_vm_close);
> > > > > > > > -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> > > > > > > > -				 unsigned long offset,
> > > > > > > > -				 uint8_t *buf, int len, int write)
> > > > > > > > -{
> > > > > > > > -	unsigned long page = offset >> PAGE_SHIFT;
> > > > > > > > -	unsigned long bytes_left = len;
> > > > > > > > -	int ret;
> > > > > > > > -
> > > > > > > > -	/* Copy a page at a time, that way no extra virtual address
> > > > > > > > -	 * mapping is needed
> > > > > > > > -	 */
> > > > > > > > -	offset -= page << PAGE_SHIFT;
> > > > > > > > -	do {
> > > > > > > > -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > > > > > -		struct ttm_bo_kmap_obj map;
> > > > > > > > -		void *ptr;
> > > > > > > > -		bool is_iomem;
> > > > > > > > -
> > > > > > > > -		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > > > > > -		if (ret)
> > > > > > > > -			return ret;
> > > > > > > > -
> > > > > > > > -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > > > > > -		WARN_ON_ONCE(is_iomem);
> > > > > > > > -		if (write)
> > > > > > > > -			memcpy(ptr, buf, bytes);
> > > > > > > > -		else
> > > > > > > > -			memcpy(buf, ptr, bytes);
> > > > > > > > -		ttm_bo_kunmap(&map);
> > > > > > > > -
> > > > > > > > -		page++;
> > > > > > > > -		buf += bytes;
> > > > > > > > -		bytes_left -= bytes;
> > > > > > > > -		offset = 0;
> > > > > > > > -	} while (bytes_left);
> > > > > > > > -
> > > > > > > > -	return len;
> > > > > > > > -}
> > > > > > > > -
> > > > > > > >     int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > > > > > >     		     void *buf, int len, int write)
> > > > > > > >     {
> > > > > > > > @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > > > > > >     	unsigned long offset = (addr) - vma->vm_start +
> > > > > > > >     		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > > > > > > >     		 << PAGE_SHIFT);
> > > > > > > > -	int ret;
> > > > > > > > -
> > > > > > > > -	if (len < 1 || (offset + len) > bo->base.size)
> > > > > > > > -		return -EIO;
> > > > > > > > -	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > > > > > -	if (ret)
> > > > > > > > -		return ret;
> > > > > > > > -
> > > > > > > > -	switch (bo->resource->mem_type) {
> > > > > > > > -	case TTM_PL_SYSTEM:
> > > > > > > > -		fallthrough;
> > > > > > > > -	case TTM_PL_TT:
> > > > > > > > -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> > > > > > > > -		break;
> > > > > > > > -	default:
> > > > > > > > -		if (bo->bdev->funcs->access_memory)
> > > > > > > > -			ret = bo->bdev->funcs->access_memory(
> > > > > > > > -				bo, offset, buf, len, write);
> > > > > > > > -		else
> > > > > > > > -			ret = -EIO;
> > > > > > > > -	}
> > > > > > > > -
> > > > > > > > -	ttm_bo_unreserve(bo);
> > > > > > > > -
> > > > > > > > -	return ret;
> > > > > > > > +	return ttm_bo_access(bo, offset, buf, len, write);
> > > > > > > >     }
> > > > > > > >     EXPORT_SYMBOL(ttm_bo_vm_access);
> > > > > > > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > > > > > > index 5804408815be..8ea11cd8df39 100644
> > > > > > > > --- a/include/drm/ttm/ttm_bo.h
> > > > > > > > +++ b/include/drm/ttm/ttm_bo.h
> > > > > > > > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> > > > > > > >     int ttm_bo_evict_first(struct ttm_device *bdev,
> > > > > > > >     		       struct ttm_resource_manager *man,
> > > > > > > >     		       struct ttm_operation_ctx *ctx);
> > > > > > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > > > > > +		  void *buf, int len, int write);
> > > > > > > >     vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> > > > > > > >     			     struct vm_fault *vmf);
> > > > > > > >     vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> > > > > > > > -- 
> > > > > > > > 2.34.1
> > > > > > > > 
