Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718BBD10B0D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 07:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B2910E189;
	Mon, 12 Jan 2026 06:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIBEV6te";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5153010E041;
 Mon, 12 Jan 2026 06:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768198409; x=1799734409;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sIk42ndtT7uD0L13PJRlv/DIuldSxC3U6a/xP+StXgY=;
 b=GIBEV6tevTnGNYIDKBZNLXkZ6CGTZIL7tJEK8yjzG/z6ktYrsAgznzdv
 5EMIHON8VR9pYFKiPnKD3H2UVj09fdJcvrAz3ugwCd5t+J+C/sETwwpyv
 gqb/JnQTSwhv7rrXw4iOm3QlDlUuZWAVw7yhjPXDHPPufti+WwtR0iGey
 Y7XcuCGQw5edsmo4ZPJd7/E0EcB1A5kNoxjIe6XIYi7CnOf2L0UUTnYVH
 R3pCc/wh3AxmcQtx/AIH6ykpFy/1XI2PTAiSODzjJ8FiEUwP9vBObj2Rk
 dHoz7Jgbx8Zt9pbnXPNKQRidH0Lc4bLyh5KGO9i4wqGAXUkt5feh5fyVQ Q==;
X-CSE-ConnectionGUID: pm+HcK60TJSf3J1PSkD/MQ==
X-CSE-MsgGUID: EwmYInDETIWIuMj8m3szvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="92134456"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="92134456"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:13:28 -0800
X-CSE-ConnectionGUID: aWjmIzq9SOu2CCGXsh+cow==
X-CSE-MsgGUID: x/FooIdWSEGusmeeFGM6dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204077634"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 22:13:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 22:13:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 22:13:28 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 22:13:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHmnlP/+AitZX9Pi0bc53ITc2d1yKZ+avdKJX1cjkdvLBr9GEprgqT1yA9FFANB+GCggAtj9YA1bBVn8kvMceS1sXTg6o3cOUpLo8FSD4ntVFx9QtUFiEQGtDe1xqci7P/Xf9KZZ7BTCb1bcJwtww1h4FOMZ6q8wcWN4BaFHac7B9cTkTxAPCcC96u+XzbEcpGIkrMS/1xeUNA+U/MMjJ3MoX72bnpb3I5uNzmQ9LE6VwF8YDwomtlJL/R9xnmlm66UbpDL0Gz8z8r6gXLWwcaTHyHL/vTH4l41bzJb18CygFzYzsrkqMzpHUYFS63MfWVuJSVCz0+shuzQ07lf7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2s6TLcQFI9Qvu/3tve+AqOAJxMQ25QmQRWc+VU8RQA=;
 b=GorManK0fYkA8OUKinQhP+Ubd635cdI07ZnFI7GJspvj/rvMkrrLDApLlsUvp+K0cBuwsfNVYTDm8h4GfyQHaCENLeRhGKxHAFzHx3bowXwvaRfFIh5MFZhwwFpk7vfux1eeMm+sQfjRHaRBlGvWutv/kiElqwDigqDxcSL6p71iJHwtIz9pJV6mVqYhzwuSPHr7wALFRb0jy06y6Pc+veFtTcTMiUb+bPneS0xo6yxUaDRqaTcSsHp5XfSeidvCBA7GBPV/WcubWgYU3k1ivuEebVZZda1hdHwvGPNXz5jAETLdJbv5V0of3EVcYIKEP95eywHn7DTlUMVJL/XT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 06:13:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 06:13:26 +0000
Message-ID: <fb4fed2d-27e6-4533-a37e-8a8d24f20aae@intel.com>
Date: Mon, 12 Jan 2026 11:43:16 +0530
User-Agent: Mozilla Thunderbird
From: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/xe_drm_ras: Add support for drm ras
To: Raag Jadav <raag.jadav@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-8-riana.tauro@intel.com>
 <aTfcV5nb_vBOOBvP@black.igk.intel.com>
 <ac78c819-51ce-4a6b-a5c8-1f327d1d8a7e@intel.com> <aWENCzpkeI4OaZqa@intel.com>
 <aWEljhdVF10_70Cz@black.igk.intel.com>
Content-Language: en-US
In-Reply-To: <aWEljhdVF10_70Cz@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0256.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe1f920-e594-4294-3000-08de51a1b284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFJGbVV5Q0xpRkxBdW9QRFlDQkJDaFc3UERkd1ZoOWVGR1pRTk1zQXB1Tk1Z?=
 =?utf-8?B?MUhwS1VYZ2prRklNanFiZ2d4ZHc3ZWlFMlpQMm03NHUxeFROTlZ2K1dOQk9o?=
 =?utf-8?B?dFJJNWpLbW8vWDdTbEV5d0dFVk1iU2lQMVcydWk5Szhqay9IYisvNHVOT1RT?=
 =?utf-8?B?cXZUQjQ3dE5XUFlDN0d3cEpUQUsvdERhWWRRdDJkSkxCc25EeVV6M2Q5OGVW?=
 =?utf-8?B?VDYwaTBPNWlKRjArRVRHR0UzWG85bTl6RHhLdTY2UWZxbHVLZVkxeWRvZUU2?=
 =?utf-8?B?Z1hSaG1LbHg0UXk2T2w3ZFdvWTRkbjk1RjFiMXd3WlFTUmd2dWhwVmRNQWhq?=
 =?utf-8?B?L1ZuY0NEU1ZlZDJtSTVscDgxUnBLaXZ2VE1yai9seGV1bmZTaWViWkRxdTRv?=
 =?utf-8?B?MGNBT2IrUEdNNk4yNWFqZ2pzRnJPWHI2R2lBenFwYWNHOTFFWTZ1MXJ2S0dh?=
 =?utf-8?B?M1hvMEdiUzRXYWtNWXJkSWd2YzUwY21FcEx4NWxsbjRrWjR4cmgyL2NCVFNJ?=
 =?utf-8?B?ZEdPcnFRQkFWRk5ld0I0a1hoNkt3WWx1YWdxNVM1WG5wSldteXZkbEVWQU5M?=
 =?utf-8?B?aFJGejQ5VEVUWHN5RmpIRDdyOXFYLzkvZXRmRGtlRmNNMVZyWi9NU0xWeTlG?=
 =?utf-8?B?QUZLTEFPUElhUTVyY1ZFT3VRMEtNM3VQOStsWGVuZ2psRUYrOGRjakVaeEFS?=
 =?utf-8?B?c0VOYmdaYk1heWNJZGlUOEFqbXNPcGFHMTBvR3F3YlhJRlptTHBScjZDbnQx?=
 =?utf-8?B?MlFlaWZFMkh4SGJ4SlZ5bGVOMEpyay8wQWhYbURxTXcxWjFTcWpVRWVBYU5C?=
 =?utf-8?B?MS9VWTQvcTcwZXYreVVzYVdReFhwS1Q1eW5wQzlmWUtuMDRWTjJ4S05Pa3c0?=
 =?utf-8?B?UU5SNy9Pak5Za2lwUlRkVnNDYTNVSjloQ3g4MUZtcUw2Uk5icWZkME4zZkRo?=
 =?utf-8?B?NkxSanhQenFqODc2aXluN25hVHplWTZZelZjMm5BRmR0Rm52YTdwcHo1ZTlZ?=
 =?utf-8?B?S2xKMVBBYXFnNWJtNGQrZHhTbGlBNG9BYUEzc2swekdqWVFFbU9FUjVySi9q?=
 =?utf-8?B?R3pLZ1Z1ajBLV252VGREUUdsd0k1N3M0Nk9ZRUlNR1dlbzRndHhvZUo2OUhX?=
 =?utf-8?B?VWJWNmx1OE91MjdpcFZJSngrRFl3RW1yMnBTalJFclZOYkNuanl6d3VxZ0pk?=
 =?utf-8?B?Z3htSmdHR2M0ZjRpM3prSVduU2tueUJCeStXZ0Rxa2dqZ0MwVGNaL21vbFFG?=
 =?utf-8?B?VFhKRDV1RFlvZFhaOVdqRmc4cGRzUjNyempRcDhjV014bnFDTHR4d0o1ZTZX?=
 =?utf-8?B?dUlKMHkyZ0E4MVpwZXkxYXlUZ3luQ1BscGE0WHQ0eVYrQUN0OTFiUHZuVHBQ?=
 =?utf-8?B?aXhvSmN1R1U4Qk4rUytQdmd6cEF0eU1RZTFOM1FWTlp2NWNQbWFzUlQrRUQz?=
 =?utf-8?B?R2NiQnRCYTBoenV2U05CdGhXaHdobnVMdEtHYkJXdTh1dHhvc3N2R3R0ZUR0?=
 =?utf-8?B?aU16NHI5ZTcwQ0VLT0VPRFc3TjR6aGRIck9ZRW55d0h2a1ZBRVB6RkVKVk9N?=
 =?utf-8?B?V01iYTVZN1RKVlJKUUJNSk1jOHRxcXRkT28rTmJaTno1YTg0OHFBUmNpanJo?=
 =?utf-8?B?RjJOYzRzWFFkb3hWVXhSWlFVTTNWNVNKdnNYL3N6VVdzaWNJbWNaQVk0VzlL?=
 =?utf-8?B?WURLV0g2OUMrZmV4Rk01R1cxbFZtbTZ6cjRxc09RSFFSOU1qQi91djFZTnNk?=
 =?utf-8?B?d0lMT3l6S0FJYWhUbjhLT2ZtOUlkNDg3UzhBSSsvNnpWTEhFMUdkWnJ0aXI2?=
 =?utf-8?B?QkJPcVIzMEdmdzdMbVJsbjl1QTJsUHlhUXNHK2pNUFRHbCtObm41OWlyWmJs?=
 =?utf-8?B?V0ZaMjZENGN1dXFEWTNiZzhhbDRjTllRNWdxZ25oeFpFMFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEkyYW44cWRmaFo3czVmUDB5aUN4dC9GTm5EVTg0ZkRkdkxzVXhTaktLTUNY?=
 =?utf-8?B?RXNMSkthRTU5bG52NmdodDdOVUR3YmZPUWZFdi9lNjNFamVVT3JpczFDUEsy?=
 =?utf-8?B?ZVNGdkNZalJqS05PNkRsTTVxV1RiQmlPWTY5UExiTWFiNHN5YkJkVWxBVlRT?=
 =?utf-8?B?dFdJZUhiNUhSc1NPRjNmU0RlR040akJ4OHJSM0lITGVPZWxFd1JRd3AwUStv?=
 =?utf-8?B?RHRHN0svd1BIek4xOHlGSWtzUGdVUFVjeDg2aXB2bjFUeXR2KythT1JXUnBw?=
 =?utf-8?B?OFZRYVArbXc0Vk5yckFpdnJyRVNiMHhxU05sTUhvcktIcjdMS0V4cVJZRkR3?=
 =?utf-8?B?Tk9GTEY4TlNHbkxQRmdUNjllMzBvM2xpR05EYmtBS1pzOXdKWXdNRjR5VXlp?=
 =?utf-8?B?SEVwckthb0ZTK3R6cUtBUmJZckNFZ2c0Ym1RQiszR1BwdWZySWRaaDBhT2NN?=
 =?utf-8?B?RXhSYnpvQlZKZFRUZm9nYjh2OUlaQmo3R01GMm5RbVlBdWUvQlp4WmFMNlJC?=
 =?utf-8?B?b1RMVjRLRmpkUVB3d2JDOTNhNzk2ck1SSG5BWHdJbTgyOHlHM1ZLMVFkeTQ3?=
 =?utf-8?B?d3FSM1ZFd2lMVXpCcndxbWIzT3BxYjZMR2l0ZnI4dVJlVHNDK3pBQU43cGdw?=
 =?utf-8?B?Y0hkS3Y3UjFJSmZQVHRSRjFEWDdBQ3JTcUtmWjB1eXRnbkJsV3RvMjdhSHcz?=
 =?utf-8?B?L21oUHhwRGlpNHlrV2RWVmtXQ3JlemR0eHRUOUxtbFdadnRmeExGNUFVdFJO?=
 =?utf-8?B?Tnp3eXpDREkzdU52SUVvZEx5MjlCV0NyMENmWU9pSjFyZENPb3pOZ1Jnc0ZH?=
 =?utf-8?B?RTRuQ2Q0RUZtdEN3ajZoRlNrbm5HSEkvSTl3bmQxWnJLQ2pRUGt2dkVYL2tI?=
 =?utf-8?B?cFNZNVRCbWI4SWtPQTFQVUZKU1lucmNuY0k0cXhQYjZraXA4RlFWWThtU2pL?=
 =?utf-8?B?cjNsaU4rQ1BUbnp4aFUzVWhCY1dzVHRTRnZXczAxTStFcnE4SjdVQ3pycjFU?=
 =?utf-8?B?dWY1SFlQRFVtZ1c5S0pmT2wxWVEwd1B3L3BYVU16U3VYcUFWTlh1RWd1MlRE?=
 =?utf-8?B?U0F1ZkVnbHRVVkwzVmVPVWpPMUs5K2JRaGRCVWdzNmVmeGNWdmdrRE9QckQz?=
 =?utf-8?B?ZHhKYS94SzY3eXhqbDJqam9BbHBRUng3RXZQNnlYK3JuQ1doU0dKcHFBVGxB?=
 =?utf-8?B?alpUWnRKWUlvRndFazNnaThOOSt5bGM1eGduVFVYMTNDNzY3S09rWjlFd3pV?=
 =?utf-8?B?SnpDK1FzU3hjKzJOMHcvdkxiTXIyTVNBcXpoTmhpcll3WTZZWVFURTMvT1Mw?=
 =?utf-8?B?WWxLMDMwUFVtejJhYjhwTDYzdDRNdE5KR1hnK1hRSzJ4c2V6alZtZmxKMHkr?=
 =?utf-8?B?LzREeFl2V3c1YzJFclFoZ1p2clp3Kzcwb1V3QjFZdUhwTS84blVBY0tzOVdH?=
 =?utf-8?B?NXZiN2U0bk4wUHFRdkFZeU1DQzNCUkhGc3pQUUhubFEvbllZeHIwSVRhdlc4?=
 =?utf-8?B?VHJKazZyWGNaajhKS0ttdnZtbll1djc5N2J3VDl4WTE2U2hRTTduUmZCeE4w?=
 =?utf-8?B?U2FMY1dJdERhNEl6UjhBTTg3MHhIOEk0a1BvS1YrajRYYnkxajNGNktCM1h2?=
 =?utf-8?B?K2lrdGtvZ015N1BrazNUbWROZVgzNWdZdW45N0Q4bVlpcmEvZFlSZkxDbno4?=
 =?utf-8?B?a1lEYXhOY0NuczJnRjNxbEFvV0tLdGx5dDYybzB4eGh2dVlJSjhkRW92NnNF?=
 =?utf-8?B?UmRsb2hVdWZHRXBZWVEvOTUwMXhabTdzUmhrcStLeFhMNGlCeFR5SExtMW9h?=
 =?utf-8?B?alI3TC9IeDcxRU81bTRUZVlLSGZUVnprVVF2bmx4SlJDQ0ZTL3NLbTJRRFFx?=
 =?utf-8?B?bjdHc2pCUnVOSG1SWFVQVkcxMWwva05yYWZYSlovSjhKbGwraURIbUNRaktK?=
 =?utf-8?B?b1JGM01iQU12UjdLVmozTzE4MitaRFhXbmMwK0dkVkdueUU2ckgwY3hWQ1VV?=
 =?utf-8?B?OTlZbFFwNGNXZVQ1YklGcUFNMFgrWlhldkhMT1JTZ2dPZ25jSktjMnBwRE9N?=
 =?utf-8?B?Q2JHR3U3eXBtTlJLUWovc1AzanZmeXVpbDR4Sm1NSXZ3aytMSysvT3phTU0r?=
 =?utf-8?B?U1JRYkZkMUl3WDQzOVpGOTRQZUlESnhCc0lSODNnUlNNL3YxemdsQ3g1K2kz?=
 =?utf-8?B?L3lLc05DaEFVN2VYRkdjakpQSFl2K2FhS0x4MklPUkZsblZlOGlyWC9lTWlP?=
 =?utf-8?B?R2ZKdjg3RDFHRk1ka0ZNem5BbTRvRWRySGI2NC8wY1JqbWFzZm44TS9LaEQz?=
 =?utf-8?B?eW1jaThmWkx5cHFYZVVRSDgxdThUdGIyeW9vSDdYeldmNkZmQkxXZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe1f920-e594-4294-3000-08de51a1b284
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 06:13:26.3328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4huDdI/iOwGgbDEuI+ein8YlhOYp+HW9riFxEeuklHypRnmnFgLNC/+7E/R/Ch8df9ZeCXUZKJ0aH5bVMftfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8686
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



On 1/9/2026 9:28 PM, Raag Jadav wrote:
> On Fri, Jan 09, 2026 at 09:13:31AM -0500, Rodrigo Vivi wrote:
>> On Fri, Jan 09, 2026 at 01:38:44PM +0530, Riana Tauro wrote:
>>> Hi Raag
>>>
>>> Thank you for the review
>>>
>>> On 12/9/2025 1:52 PM, Raag Jadav wrote:
>>>> On Fri, Dec 05, 2025 at 02:09:34PM +0530, Riana Tauro wrote:
>>>>> Allocate correctable, nonfatal and fatal nodes per xe device.
>>>>> Each node contains error classes, counters and respective
>>>>> query counter functions.
>>>>>
>>>>> Add basic functionality to create and register drm nodes.
>>>>> Below operations can be performed using Generic netlink DRM RAS interface
> 
> ...
> 
>>>>> Query Error counter:
>>>>>
>>>>> $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":1, "error-id":1}'
>>>>> {'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0}
>>>>
>>>> One more (sorry): So this means graphics will be a different id? Or do they
>>>> overlap? How does it work?
>>>>
>>>
>>> Did not get this question.
> 
> This give the impression that it's specific to compute engine, so I was
> hoping for something more generic like "execution unit" or simply "core"
> but I couldn't come up with anything better than this, so upto you.

Perhaps just GT. Let me check

> 
>>>> Also,
>>>>
>>>> [*] I'm not much informed about the history here but the 'error' term
>>>> seems slapped onto almost everything. We already know it's RAS so perhaps
>>>> we add it only where make sense and try to simplify some of the naming?
> 
> ...
> 
>>>>> +/**
>>>>> + * enum drm_xe_ras_error_class - Supported drm ras error classes.
>>>>> + */
>>>>> +enum drm_xe_ras_error_class {
>>>>> +	/** @DRM_XE_RAS_ERROR_CORE_COMPUTE: GT and Media Error */
>>>>> +	DRM_XE_RAS_ERROR_CORE_COMPUTE = 1,
>>>>> +	/** @DRM_XE_RAS_ERROR_SOC_INTERNAL: SOC Error */
>>>>> +	DRM_XE_RAS_ERROR_SOC_INTERNAL,
>>>>> +	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
>>>>> +	DRM_XE_RAS_ERROR_CLASS_MAX,	/* non-ABI */
>>>>> +};
>>>>
>>>> Also, all of the enums share the same DRM_XE_RAS_ERROR_* prefix, so let's try
>>>> to have distinguishable naming. Perhaps [*] would be useful here as well ;)
>>>
>>> DRM_XE_RAS_ERROR_SEVERITY_* will cause longer names. Any suggestions?
> 
> Already mentioned above[*], the key is to not overuse 'error' ;)
> 
> DRM_XE_RAS_SEVERITY_*
> DRM_XE_RAS_COMPONENT_*

There's been an interest expressed to add telemetry nodes as well.

https://patchwork.freedesktop.org/patch/666138/?series=118435&rev=5

I have kept the prefix (DRM_XE_RAS_ERROR) consistent with the first 
patch (type - ERROR_COUNTER) for alignment.

 From my perspective retaining the prefix ERROR would be beneficial to 
differentiate if there are different types.

Can you please have a look at the link and let me know if you still 
think the same

For differentiation, i will add SEVERITY and CLASS/COMPONENT.

Thanks
Riana

> 
> and so on ...
> 
>> Try this full version first and see how the outcome looks like...
>> if we are still respecting the line limits without ugly cuts, then let's go with it.
>> otherwise try something shorter ERR_SEV_ ... or something like that...
> 
> ... which can be futher shortened with this idea.
> 
> Side note: I'm already using these on my local branch.
> 
> Raag

