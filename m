Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE65A09649
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 16:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB3510E075;
	Fri, 10 Jan 2025 15:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbzgejDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3411110E075;
 Fri, 10 Jan 2025 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736524043; x=1768060043;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=txcn1Dt++OcMgItlzhO14t89rakJDLcz5rhFWAqttBI=;
 b=cbzgejDc37FI9/d1lrqsMfsAjr82q14ZraTjO9WKFnYcRNw0DmOgSrqK
 acTO1egWT5JC04lQ/VH3Aq/FppSWKYFSvey9WQTT9pn/PKGyOBEeyIPAc
 QUxLaP3xuXkIYXMEVw8eBNidrEEgT7q9ePkkoXv3TFA0j7kSlTlMYV+Pj
 Btb1tf+OxUi7uw+FjFlshx3kQMGZTdHqeC8jbgKx3NN16evgZccRcWTB4
 X/arlVaupy8P3yf/52LFzfhSyMnuedoDpJi/G7nP1BJ5awKEHMBB/bGfT
 cuA8/XH3X/xm/+mtAIJULm0o0mIj7+gFF8tGfSLNRmz5SnwAseiCPhWvz w==;
X-CSE-ConnectionGUID: UuWTYXRXRdWE2QSBXKWBdQ==
X-CSE-MsgGUID: Dxnlw+MKQX6mFDniZTLvtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47316312"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="47316312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 07:47:23 -0800
X-CSE-ConnectionGUID: lupx/CKCSsurs19fOdvT9g==
X-CSE-MsgGUID: kMS0yIajQau1m+lKaLpnGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="108806654"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2025 07:47:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 07:47:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 07:47:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 07:47:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwfm6yQ99edck2/H5EkK/z9labXhZF9e1T5tTD0o/Wp2XEDf8U3aaBA6ftkqWpQz3PrutC2BsdxR7ud+JXygwAN6+1KtjHhL7+yzY17mo56Jv5s6RwMoNtGmbhUvBaX616DTEQvpSravO4sKC6kRULe6cVzfMwW+TNKMPxjk0ErxtDnkHZYZCwoczxshl4gR+5NrhRn1sQed+XqNcIqHjOkJEe2X9UgX3eeLxYnN5LhxOIPoaxh3B0iOrTtX4OvLS139MMU7/HncxSHscMkAvWviXy1rRbMx0gxgjRR1oJ4aPCiPsWnw1ociql2Gkmec3UbY9VlJ5Jo/hwH2IWgCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHcmb3pGDi89lwkhVs/yvmVcxJVAOQMDgRRik1Sx9ug=;
 b=hHCWgbNSVzq1onTvNQhdVLy7oJfaEE52oLEsYS3roQsCBWd3ROym/t7qYWYotvazIXYqLaLKA5h0JxDZIBslvEwrOqooS9F0z4eV/MOzRpNd/R9AU/KwVPft0KY60NqtBvzyWOGLl+IO5D55JtC7EkRE/URMRUTo2bu4t5ld5NlBg+AXgQstbG1OXnllDi/rX1k0te6z412cmwUEodW1Cp/bn63EA1wHQHBxJksCe3pY+3bk4Aqg03MW7zIHRM8JzLhHq4vJRIcJb8o3e2BFQ9d6h4jQOEABYqoJnCyE+aTopZfbxPJAsrBB6Oe39ea1Qw5QUGV5EEDG2B8xcpNiKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 15:46:37 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 15:46:37 +0000
Date: Fri, 10 Jan 2025 15:46:28 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH] drm/i915: replace in_atomic() with manually set flag
Message-ID: <eshvssuzswcswzcyuwe3dghg2kxhnw4mbggylp6ssgfx3c4eqq@ufnjnmfxmpra>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DUZPR01CA0092.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::27) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DS0PR11MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c95573-1ec2-46a8-1d76-08dd318df7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czBxNFRDcXJiT0U5ckI0c1ZIQVpEU0dyUmJ0bnd6UDNZbm1kRWVqamltbXpN?=
 =?utf-8?B?VTZ3VUxCaFhHczQ1YVMycDQwaUowTlBNN01LSlY2NFo1ejB3aEYrS1ErTkp2?=
 =?utf-8?B?bWd6bTFPSGI4UXoxNGNLQm9nU0luR3FvL0NMaGlWWkZQTGJmNHhSTkRCc2RG?=
 =?utf-8?B?bjhQaFFYMW5GSHFaRFI0aWFTRzlJYkVPMHY2ak85YXhGWmtWNE5JYktjOXM3?=
 =?utf-8?B?dHJYbElmWUd1eFNBWkdPQXY1d09WeHZnVjdvekY1cC9nZkQyUnhTUU1abzRF?=
 =?utf-8?B?cklXZWl6bzRKSks5K1FQbDlGVmJHQ0c5Z2UvWGlSTmVVT2d3eEdZN2NNeDNt?=
 =?utf-8?B?dDh3aXBzQkpzQWtEVDM3ZXhzVFhjODFVU1JjdVMrR1l0QmJIUUhzdHdMVnlr?=
 =?utf-8?B?cGtvWlBYRWdCUjN0UHl3US8yTFNpdmlsOGJjTmRUeDVKTURaYWZXSmhsaXFp?=
 =?utf-8?B?WUZlWW52VmRlRGNaRkd4NzNrcjZEQmcwdkR3Z1ZYMVBQTElZWGdVWStneVNv?=
 =?utf-8?B?R2QyOFpzbEoyVzRRN3gyV0RYV0tWdXp0aGJJRzdER29uZXRJcW1lc2RFdjNT?=
 =?utf-8?B?VjNhcGNXNWs1UDZzK0JRMS9BN3dyTFlxd1Q3RW1wQ2RwTnArbVBaUVlOeGs3?=
 =?utf-8?B?b1RMSkpxNlRlYzdtZ1hCeTRVYVFTcDg4YVhYcHBRVEQyLzVhM0N3bmEyNWJr?=
 =?utf-8?B?bVZoQk5JNVNwM0s3M2JaQjB1YW9KRmJIUEM1K0RyWGNwWSt0QytSUHloYUFh?=
 =?utf-8?B?R21wVFdscW1lVk1vL0lSVGhnT29ZSkhUR0ZMcnhGMllPSzk1NVFRbG90OTkv?=
 =?utf-8?B?MEhsVS9UVXE1V0NUMGdSeHNqK3BhWTBJRlhVOUtTUTU3NnIxbXBzc3MxaXMy?=
 =?utf-8?B?bEdKYmEvdkFwZzl3N0dYT2NzZm9BODZzQ3hkNmh6UEx2VkFPZ3g1S0U0cGEw?=
 =?utf-8?B?TFFVQkpZMXkzaW9pMklOQ1pzMWN1SmhGeVZVa292dHZrWDcyQ3RIdHVJTVU2?=
 =?utf-8?B?ODlqdlFFbnEyYzFheFdNejBJS2J1d1FlRXQ1U2h3MDNHZFJsWktkWCtGSW52?=
 =?utf-8?B?NThranhhNFRNMFljaXBZWFFXWDk0WHNpenVxa2xWbnEwKzlBTjZDdFA3Skgw?=
 =?utf-8?B?VllDdzN5TTJFQmJSVjY2NUoyN0JQTVBzNnF1UHM2MjVZb1RvYjdscTlvazhG?=
 =?utf-8?B?TXZDaWdaOVllWnhoUmNtL2JrZVh6MjZTUmRlbWcrWEd6b2tvcEpBaE9JMjA3?=
 =?utf-8?B?Wjl6aDZyb0t0VmF0aTlKYW1ycDZkblYvaCtOVmZiZk5ONW5vbWtpU1BhNTBU?=
 =?utf-8?B?Y3h0YVVUQW44cVdPOGI5TjRIRSthZjdWS2h6dkVmRHZqaXpDUmxvdG43UU1l?=
 =?utf-8?B?SnFsclRlUHAzclRZdng4VmdhRm81d1FzdGxWRmt4Rks3UWZXNENQZ3dCUHJm?=
 =?utf-8?B?eUg1Y0pnZ0FSNUJzRHI4ajIvMVYvUU16b0pWT0R5bmEvR0YwOEhCUS95aWJS?=
 =?utf-8?B?dmtITlBsNURZOEZVSDV1WDlmTGxjSWs0Zi9yTTFVa01nK0J5RkFWamdaS1Av?=
 =?utf-8?B?SE1RYVdLMm9HeXFhYmsrM1QrSnVYSlRSL2pvRnlFODg1R010RDIvZTE0K0Nt?=
 =?utf-8?B?Y2wySmJxRENRcU9Fd1JjZjYxREI5M2FIZXAwb3dxS1FmQlJjd01kOCtVdndW?=
 =?utf-8?B?SVZqVmo3V09LT3lYckxGaGJSTVAyazhuTzhZRXJkMEJOTWg0d1EvZGNUM2dz?=
 =?utf-8?B?bWV5S0JwbWhCZDhUTldrWDc3RFoxaVFuUXlqMG5rNmNvQjNtUXgrcHl0L1c4?=
 =?utf-8?B?Z2I4YlhSb2F4cEFiNldYMmdRd0JwbWVNMnlidHhMZDUzRmd1ZFhDbjFGVHdY?=
 =?utf-8?B?ZEpjYWIwWDB3alJGb3didWhLMy92cVFIZ0NMQTZhQlBteENvRWgyLy9uZkUw?=
 =?utf-8?Q?VhUxO4tvpJtoygv9mUWw69e4m5oSyjWo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2w2Y0JyZFNNZXhoTGxjWnZCYVhFZGJLNDZOeHVKSGR5Uk1WZ05scWFzelRj?=
 =?utf-8?B?cEZzcGZxWEptK003d2xzTldZb09hN2hTYVVpSXR1THAyOGh1Z1luRTFWanZx?=
 =?utf-8?B?RGZ1K2d5aFJIQ0JHSEplSEE4UE03Ykw1SnhCZjJBUVVlQzF6NEtyT1NVUXhm?=
 =?utf-8?B?cGQxZUZ2VVRNa2VRQUVTakhscWYyL05vK241bW45bmVkYXdEWkFyZTRQZXZL?=
 =?utf-8?B?UDQxcXpxN2pOMUE2ZDF6U2txdGlWVGVjdHpUaVBMRmVTWEVZNUxqQkpWUTZO?=
 =?utf-8?B?cHU4Q05nNFM1b1drMXRKM1lrMG5GcGl4UU9QWXkvQXFLYWtiWThzU0o1aEV2?=
 =?utf-8?B?b2pSYXhmOHNjOTFJNmlyZEVobEQ1Vng5N3dYcUl3SkdoYzZKVmc2UTl2Tmxo?=
 =?utf-8?B?QUgwSnYvRVR2eWxGYjAvZzMrZENpUndEeEtRTnlWalFxU2R5bjdEaEtjNC9v?=
 =?utf-8?B?MjY1dEI0UEVodXlLTTkybmQ0MFBLWG53cDlydVdiMElJaFpWNWRLWkpMdnBp?=
 =?utf-8?B?ZG1jWDJlN2N2UG1qTWJ0U24wRXBHU0ZDME9GMmVoRUtBZjVrSTZzNXNEc0Rj?=
 =?utf-8?B?c25WWnprajF3dmYwVUxhNEx3Y2pad3RKMllUcTRvU09wQkxYLy83TWcreGRu?=
 =?utf-8?B?VU8zUEJHelE1WHZMZUZkeGxkdUJNbHljWHJHNUdNR25rY29rdFJSYmxVcU0v?=
 =?utf-8?B?VkxrelpLZmtMd2tiZFlnS1RvWXNSWUNmVCtkTmNwa0FoeEZDVUpWL1FpYk9S?=
 =?utf-8?B?K2V6MnliVU5kMW5LT0FsUU9pckdkS2JOcjNpYjNVdnBFdXlUbjRDTEpXUVhB?=
 =?utf-8?B?VWRyd0lUOFVvSzY0N0JTcmpnbmhWZ0JGUUpRdjhCOUN6R0pSblBuUWZKTG9r?=
 =?utf-8?B?V0dGdDU0WGJMK2tReDJTejdEUnNPRzN3VHUvNkxnOVdqSE9NMDlNY3phemwv?=
 =?utf-8?B?OVo4bWYweWNMb0dCMEVGUmVNekpaUTFzeDE1aEdad2kybGxmd2QwaWxXaUdI?=
 =?utf-8?B?R3g0TEhvQm12M0x5dEpxbzNueThndm9JZExlY0U4THJUSDZkczc4SnA5OGRt?=
 =?utf-8?B?aDJFemxBMDBqS2R0VVYvKzlPVW05amZWa2UzanBnajZMWHpFNVh4bXAvYSta?=
 =?utf-8?B?OXNRSGxZK2FoWXl0RUZrMUF6NDRMV2g5dlBwUjRia2xmNlRzaUt0SUl6VVBz?=
 =?utf-8?B?eGNkcjhrMVRtSk5HczVUWWRBLzNudTNQREZNQjJoSno5TkhXZjlYOHZaZVhm?=
 =?utf-8?B?VUJmbVFkK3E2bE1WTjBlT1BQTkZ3TDAwRC8vWmdhWW5JYlRYOXNGUENabnFH?=
 =?utf-8?B?N3o5cWZlVVZJRDBVZGFZMi8yNTBsSGtSbFUybVdhSjhNdjIvYk1tV3RGcEZT?=
 =?utf-8?B?S0xZdTN2b084V1ZBSGhBdkdGYnRuUUZ1cVJ0MnpHUTVVU0xCeG5wRzBpTmo3?=
 =?utf-8?B?RHFGYUF3Qys1ekE3MG1NL21SaE5OankyS2x2S1o1V0ZJdFl1blNBYTkxTGx1?=
 =?utf-8?B?TGdXNC9NN0x1ak1YZDVFOU91TFNtY0wvK3JlS01qZCtRY0MzclgzamNVenJS?=
 =?utf-8?B?WWpFQTlwcjV6TDFnWlFJcXNJbldRczNpQWZsSUYwMWEwN0lsYk5JWWlSUCtx?=
 =?utf-8?B?NWIzZFRvOFpPaHZ2MXoxeWlBRDZ5VUlHa21YZFZiMjRqOSt2VDlLVzhqMFVM?=
 =?utf-8?B?eUQwQVhLa3RBd2dpQ2ZEQUFFWDhrRHpzODdiQ2ozRGRPTmlXSi9MKzVmdnBG?=
 =?utf-8?B?eFFyTWFVcUlNU1NjWWlwTyszYnBabW85bnEyZkN0K2Z1Z0VVUTdjTmxSQjRq?=
 =?utf-8?B?QVRPZ21TNlA2UGNXWHVhYytxVG9tcldsZjZPTUQ1dm5hUVdGdHdSdkFtYjNC?=
 =?utf-8?B?QXVHN0RPekt3aEVQbXlmRHVmekJaMnM5Y0xHMlNnVFgzV3BKUWZBSGNZQWM4?=
 =?utf-8?B?Y3EzNThlQXFrNVJJVER6RGJDejVEaUlDeExUOXh5RDM2b3NJMDhrNDJPbjFY?=
 =?utf-8?B?YTVXenlHU0JwRzBVUjYvRkhoMVROUm9lV2dvWnNmQjRWb1c3d1g0YkVYVWZZ?=
 =?utf-8?B?bnNqSW1TTmoxL203QkpMSzdpS1JCWGl6Ni9UbnBxREZHVnlqUk95c21RTlk3?=
 =?utf-8?B?dkVWdWFONkJhMHRIKzZLWWJLQWhOckRJUzVrUm5uR3JqRWlLM2MvaHhiQitH?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c95573-1ec2-46a8-1d76-08dd318df7f4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:46:37.8415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: av/X7LBNPxjgH5CFjJy3blnHkldQ/fYsHFhUAGAjwS3B/UE385eYFN9Zi62u/NHu0/pgJQyYYT8OR9F+QRBCmpfvU2wbn/Kg6rb2j6VsWZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
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

GuC code uses in_atomic() function to determine if the current
context is atomic. As noted by the function's description it
should not be used in driver code, as it is not guaranteed to
determine atomicity correctly in every instance. This is also
pointed out by the FIXME note suggesting that the caller of
intel_guc_send_busy_loop() should be responsible for providing
information about whether the context is atomic or not to avoid
in_atomic() usage there.

Add a new flag to indicate active spin locks and pass it down to
intel_guc_send_busy_loop(), similarly to how "loop" flag is
handled.

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 127 ++++++++++--------
 3 files changed, 74 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 57b903132776..0ccd97dc32f7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -358,18 +358,12 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
 					   const u32 *action,
 					   u32 len,
 					   u32 g2h_len_dw,
-					   bool loop)
+					   bool loop,
+					   bool locked)
 {
 	int err;
 	unsigned int sleep_period_ms = 1;
-	bool not_atomic = !in_atomic() && !irqs_disabled();
-
-	/*
-	 * FIXME: Have caller pass in if we are in an atomic context to avoid
-	 * using in_atomic(). It is likely safe here as we check for irqs
-	 * disabled which basically all the spin locks in the i915 do but
-	 * regardless this should be cleaned up.
-	 */
+	bool not_atomic = !locked && !irqs_disabled();
 
 	/* No sleeping with spin locks, just busy loop */
 	might_sleep_if(loop && not_atomic);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 46fabbfc775e..6d7ec67e8f58 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -198,7 +198,7 @@ static int guc_action_policies_update(struct intel_guc *guc, u32 policy_offset)
 		policy_offset
 	};
 
-	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true, false);
 }
 
 int intel_guc_global_policies_update(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 12f1ba7ca9c1..2154718d278c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -618,7 +618,8 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
 					 const u32 *action,
 					 u32 len,
 					 u32 g2h_len_dw,
-					 bool loop)
+					 bool loop,
+					 bool locked)
 {
 	int ret;
 
@@ -632,7 +633,7 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
 	if (g2h_len_dw)
 		atomic_inc(&guc->outstanding_submission_g2h);
 
-	ret = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
+	ret = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop, locked);
 	if (ret)
 		atomic_dec(&guc->outstanding_submission_g2h);
 
@@ -690,8 +691,8 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
 					      true, timeout);
 }
 
-static int guc_context_policy_init_v70(struct intel_context *ce, bool loop);
-static int try_context_registration(struct intel_context *ce, bool loop);
+static int guc_context_policy_init_v70(struct intel_context *ce, bool loop, bool locked);
+static int try_context_registration(struct intel_context *ce, bool loop, bool locked);
 
 static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 {
@@ -718,7 +719,7 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	GEM_BUG_ON(context_guc_id_invalid(ce));
 
 	if (context_policy_required(ce)) {
-		err = guc_context_policy_init_v70(ce, false);
+		err = guc_context_policy_init_v70(ce, false, true);
 		if (err)
 			return err;
 	}
@@ -991,7 +992,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 
 		if (unlikely(!ctx_id_mapped(guc, ce->guc_id.id) &&
 			     intel_context_is_schedulable(ce))) {
-			ret = try_context_registration(ce, false);
+			ret = try_context_registration(ce, false, true);
 			if (unlikely(ret == -EPIPE)) {
 				goto deadlk;
 			} else if (ret == -EBUSY) {
@@ -2445,7 +2446,8 @@ static int __guc_action_register_multi_lrc_v69(struct intel_guc *guc,
 					       struct intel_context *ce,
 					       u32 guc_id,
 					       u32 offset,
-					       bool loop)
+					       bool loop,
+					       bool locked)
 {
 	struct intel_context *child;
 	u32 action[4 + MAX_ENGINE_INSTANCE];
@@ -2462,13 +2464,14 @@ static int __guc_action_register_multi_lrc_v69(struct intel_guc *guc,
 		action[len++] = offset;
 	}
 
-	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
+	return guc_submission_send_busy_loop(guc, action, len, 0, loop, locked);
 }
 
 static int __guc_action_register_multi_lrc_v70(struct intel_guc *guc,
 					       struct intel_context *ce,
 					       struct guc_ctxt_registration_info *info,
-					       bool loop)
+					       bool loop,
+					       bool locked)
 {
 	struct intel_context *child;
 	u32 action[13 + (MAX_ENGINE_INSTANCE * 2)];
@@ -2505,13 +2508,14 @@ static int __guc_action_register_multi_lrc_v70(struct intel_guc *guc,
 
 	GEM_BUG_ON(len > ARRAY_SIZE(action));
 
-	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
+	return guc_submission_send_busy_loop(guc, action, len, 0, loop, locked);
 }
 
 static int __guc_action_register_context_v69(struct intel_guc *guc,
 					     u32 guc_id,
 					     u32 offset,
-					     bool loop)
+					     bool loop,
+					     bool locked)
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_REGISTER_CONTEXT,
@@ -2520,12 +2524,13 @@ static int __guc_action_register_context_v69(struct intel_guc *guc,
 	};
 
 	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
-					     0, loop);
+					     0, loop, locked);
 }
 
 static int __guc_action_register_context_v70(struct intel_guc *guc,
 					     struct guc_ctxt_registration_info *info,
-					     bool loop)
+					     bool loop,
+					     bool locked)
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_REGISTER_CONTEXT,
@@ -2543,7 +2548,7 @@ static int __guc_action_register_context_v70(struct intel_guc *guc,
 	};
 
 	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
-					     0, loop);
+					     0, loop, locked);
 }
 
 static void prepare_context_registration_info_v69(struct intel_context *ce);
@@ -2551,7 +2556,7 @@ static void prepare_context_registration_info_v70(struct intel_context *ce,
 						  struct guc_ctxt_registration_info *info);
 
 static int
-register_context_v69(struct intel_guc *guc, struct intel_context *ce, bool loop)
+register_context_v69(struct intel_guc *guc, struct intel_context *ce, bool loop, bool locked)
 {
 	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool_v69) +
 		ce->guc_id.id * sizeof(struct guc_lrc_desc_v69);
@@ -2560,26 +2565,26 @@ register_context_v69(struct intel_guc *guc, struct intel_context *ce, bool loop)
 
 	if (intel_context_is_parent(ce))
 		return __guc_action_register_multi_lrc_v69(guc, ce, ce->guc_id.id,
-							   offset, loop);
+							   offset, loop, locked);
 	else
 		return __guc_action_register_context_v69(guc, ce->guc_id.id,
-							 offset, loop);
+							 offset, loop, locked);
 }
 
 static int
-register_context_v70(struct intel_guc *guc, struct intel_context *ce, bool loop)
+register_context_v70(struct intel_guc *guc, struct intel_context *ce, bool loop, bool locked)
 {
 	struct guc_ctxt_registration_info info;
 
 	prepare_context_registration_info_v70(ce, &info);
 
 	if (intel_context_is_parent(ce))
-		return __guc_action_register_multi_lrc_v70(guc, ce, &info, loop);
+		return __guc_action_register_multi_lrc_v70(guc, ce, &info, loop, locked);
 	else
-		return __guc_action_register_context_v70(guc, &info, loop);
+		return __guc_action_register_context_v70(guc, &info, loop, locked);
 }
 
-static int register_context(struct intel_context *ce, bool loop)
+static int register_context(struct intel_context *ce, bool loop, bool locked)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 	int ret;
@@ -2588,9 +2593,9 @@ static int register_context(struct intel_context *ce, bool loop)
 	trace_intel_context_register(ce);
 
 	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
-		ret = register_context_v70(guc, ce, loop);
+		ret = register_context_v70(guc, ce, loop, locked);
 	else
-		ret = register_context_v69(guc, ce, loop);
+		ret = register_context_v69(guc, ce, loop, locked);
 
 	if (likely(!ret)) {
 		unsigned long flags;
@@ -2600,14 +2605,15 @@ static int register_context(struct intel_context *ce, bool loop)
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 		if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
-			guc_context_policy_init_v70(ce, loop);
+			guc_context_policy_init_v70(ce, loop, locked);
 	}
 
 	return ret;
 }
 
 static int __guc_action_deregister_context(struct intel_guc *guc,
-					   u32 guc_id)
+					   u32 guc_id,
+					   bool locked)
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_DEREGISTER_CONTEXT,
@@ -2616,17 +2622,17 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
 
 	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
 					     G2H_LEN_DW_DEREGISTER_CONTEXT,
-					     true);
+					     true, locked);
 }
 
-static int deregister_context(struct intel_context *ce, u32 guc_id)
+static int deregister_context(struct intel_context *ce, u32 guc_id, bool locked)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
 	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_deregister(ce);
 
-	return __guc_action_deregister_context(guc, guc_id);
+	return __guc_action_deregister_context(guc, guc_id, locked);
 }
 
 static inline void clear_children_join_go_memory(struct intel_context *ce)
@@ -2691,14 +2697,15 @@ MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
 
 static int __guc_context_set_context_policies(struct intel_guc *guc,
 					      struct context_policy *policy,
-					      bool loop)
+					      bool loop,
+					      bool locked)
 {
 	return guc_submission_send_busy_loop(guc, (u32 *)&policy->h2g,
 					__guc_context_policy_action_size(policy),
-					0, loop);
+					0, loop, locked);
 }
 
-static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
+static int guc_context_policy_init_v70(struct intel_context *ce, bool loop, bool locked)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	struct intel_guc *guc = gt_to_guc(engine->gt);
@@ -2730,7 +2737,7 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
 	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
 		__guc_context_policy_add_preempt_to_idle(&policy, 1);
 
-	ret = __guc_context_set_context_policies(guc, &policy, loop);
+	ret = __guc_context_set_context_policies(guc, &policy, loop, locked);
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	if (ret != 0)
@@ -2910,7 +2917,7 @@ static void prepare_context_registration_info_v70(struct intel_context *ce,
 	}
 }
 
-static int try_context_registration(struct intel_context *ce, bool loop)
+static int try_context_registration(struct intel_context *ce, bool loop, bool locked)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
@@ -2960,12 +2967,12 @@ static int try_context_registration(struct intel_context *ce, bool loop)
 		 * context whose guc_id was stolen.
 		 */
 		with_intel_runtime_pm(runtime_pm, wakeref)
-			ret = deregister_context(ce, ce->guc_id.id);
+			ret = deregister_context(ce, ce->guc_id.id, locked);
 		if (unlikely(ret == -ENODEV))
 			ret = 0;	/* Will get registered later */
 	} else {
 		with_intel_runtime_pm(runtime_pm, wakeref)
-			ret = register_context(ce, loop);
+			ret = register_context(ce, loop, locked);
 		if (unlikely(ret == -EBUSY)) {
 			clr_ctx_id_mapping(guc, ctx_id);
 		} else if (unlikely(ret == -ENODEV)) {
@@ -3036,7 +3043,8 @@ static void guc_context_post_unpin(struct intel_context *ce)
 }
 
 static void __guc_context_sched_enable(struct intel_guc *guc,
-				       struct intel_context *ce)
+				       struct intel_context *ce,
+				       bool locked)
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
@@ -3047,12 +3055,13 @@ static void __guc_context_sched_enable(struct intel_guc *guc,
 	trace_intel_context_sched_enable(ce);
 
 	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
-				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
+				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true, locked);
 }
 
 static void __guc_context_sched_disable(struct intel_guc *guc,
 					struct intel_context *ce,
-					u16 guc_id)
+					u16 guc_id,
+					bool locked)
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
@@ -3066,7 +3075,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 	trace_intel_context_sched_disable(ce);
 
 	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
-				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
+				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true, locked);
 }
 
 static void guc_blocked_fence_complete(struct intel_context *ce)
@@ -3139,7 +3148,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	with_intel_runtime_pm(runtime_pm, wakeref)
-		__guc_context_sched_disable(guc, ce, guc_id);
+		__guc_context_sched_disable(guc, ce, guc_id, false);
 
 	return &ce->guc_state.blocked;
 }
@@ -3190,7 +3199,7 @@ static void guc_context_unblock(struct intel_context *ce)
 
 	if (enable) {
 		with_intel_runtime_pm(runtime_pm, wakeref)
-			__guc_context_sched_enable(guc, ce);
+			__guc_context_sched_enable(guc, ce, false);
 	}
 }
 
@@ -3219,14 +3228,15 @@ static void guc_context_cancel_request(struct intel_context *ce,
 
 static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
 						 u16 guc_id,
-						 u32 preemption_timeout)
+						 u32 preemption_timeout,
+						 bool locked)
 {
 	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
 		struct context_policy policy;
 
 		__guc_context_policy_start_klv(&policy, guc_id);
 		__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
-		__guc_context_set_context_policies(guc, &policy, true);
+		__guc_context_set_context_policies(guc, &policy, true, locked);
 	} else {
 		u32 action[] = {
 			INTEL_GUC_ACTION_V69_SET_CONTEXT_PREEMPTION_TIMEOUT,
@@ -3234,7 +3244,7 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
 			preemption_timeout
 		};
 
-		intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+		intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true, locked);
 	}
 }
 
@@ -3280,15 +3290,17 @@ guc_context_revoke(struct intel_context *ce, struct i915_request *rq,
 		 */
 		with_intel_runtime_pm(runtime_pm, wakeref) {
 			__guc_context_set_preemption_timeout(guc, guc_id,
-							     preempt_timeout_ms);
-			__guc_context_sched_disable(guc, ce, guc_id);
+							     preempt_timeout_ms,
+							     false);
+			__guc_context_sched_disable(guc, ce, guc_id, false);
 		}
 	} else {
 		if (!context_guc_id_invalid(ce))
 			with_intel_runtime_pm(runtime_pm, wakeref)
 				__guc_context_set_preemption_timeout(guc,
 								     ce->guc_id.id,
-								     preempt_timeout_ms);
+								     preempt_timeout_ms,
+								     true);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	}
 }
@@ -3307,7 +3319,7 @@ static void do_sched_disable(struct intel_guc *guc, struct intel_context *ce,
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	with_intel_runtime_pm(runtime_pm, wakeref)
-		__guc_context_sched_disable(guc, ce, guc_id);
+		__guc_context_sched_disable(guc, ce, guc_id, false);
 }
 
 static bool bypass_sched_disable(struct intel_guc *guc,
@@ -3431,7 +3443,7 @@ static inline int guc_lrc_desc_unpin(struct intel_context *ce)
 	 * with suspend, so we undo everything if the H2G fails in deregister_context so
 	 * that GuC reset will find this context during clean up.
 	 */
-	ret = deregister_context(ce, ce->guc_id.id);
+	ret = deregister_context(ce, ce->guc_id.id, false);
 	if (ret) {
 		spin_lock(&ce->guc_state.lock);
 		set_context_registered(ce);
@@ -3596,14 +3608,15 @@ static int guc_context_alloc(struct intel_context *ce)
 }
 
 static void __guc_context_set_prio(struct intel_guc *guc,
-				   struct intel_context *ce)
+				   struct intel_context *ce,
+				   bool locked)
 {
 	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
 		struct context_policy policy;
 
 		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
 		__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
-		__guc_context_set_context_policies(guc, &policy, true);
+		__guc_context_set_context_policies(guc, &policy, true, locked);
 	} else {
 		u32 action[] = {
 			INTEL_GUC_ACTION_V69_SET_CONTEXT_PRIORITY,
@@ -3611,7 +3624,7 @@ static void __guc_context_set_prio(struct intel_guc *guc,
 			ce->guc_state.prio,
 		};
 
-		guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+		guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true, locked);
 	}
 }
 
@@ -3630,7 +3643,7 @@ static void guc_context_set_prio(struct intel_guc *guc,
 	}
 
 	ce->guc_state.prio = prio;
-	__guc_context_set_prio(guc, ce);
+	__guc_context_set_prio(guc, ce, true);
 
 	trace_intel_context_set_prio(ce);
 }
@@ -3927,7 +3940,7 @@ static int guc_request_alloc(struct i915_request *rq)
 	if (unlikely(ret < 0))
 		return ret;
 	if (context_needs_register(ce, !!ret)) {
-		ret = try_context_registration(ce, true);
+		ret = try_context_registration(ce, true, false);
 		if (unlikely(ret)) {	/* unwind */
 			if (ret == -EPIPE) {
 				disable_submission(guc);
@@ -4447,7 +4460,7 @@ static inline int guc_kernel_context_pin(struct intel_guc *guc,
 	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
 		guc_context_init(ce);
 
-	ret = try_context_registration(ce, true);
+	ret = try_context_registration(ce, true, false);
 	if (ret)
 		unpin_guc_id(guc, ce);
 
@@ -4990,7 +5003,7 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc,
 	add_wait_queue(&wq->wq, &wait);
 
 	/* This is a critical reclaim path and thus we must loop here. */
-	err = intel_guc_send_busy_loop(guc, action, size, G2H_LEN_DW_INVALIDATE_TLB, true);
+	err = intel_guc_send_busy_loop(guc, action, size, G2H_LEN_DW_INVALIDATE_TLB, true, false);
 	if (err)
 		goto out;
 
@@ -5062,7 +5075,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 		 * register this context.
 		 */
 		with_intel_runtime_pm(runtime_pm, wakeref)
-			register_context(ce, true);
+			register_context(ce, true, false);
 		guc_signal_context_fence(ce);
 		intel_context_put(ce);
 	} else if (context_destroyed(ce)) {
-- 
2.34.1

