Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A67C854F1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C690710E3FE;
	Tue, 25 Nov 2025 14:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neo0y8qd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F9810E3FE;
 Tue, 25 Nov 2025 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764079402; x=1795615402;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qj/vCPmCHLEfpdks3ptQFKdYWcWbswU87FlVigsRcYg=;
 b=neo0y8qdOoA6l8aDO88CW8/ZPj59vqvAaxZp2GmjprarZK86a4fmwPoi
 MJDH8J1A1URhcIfWM9rKb9GdZrn6ndhGynUuDmyw9tfqO/mJ9GSgyPEVJ
 d/yThQQLWQ1FIkT1JKZ1mVazpqj1jmelgcMKLOgqcs+oiCQcjXxxn1UB7
 apiZ4kTSOA85rEuvl7mugeMEUIp4sZ+mKXB1lFKv9LY/Oeg0gPGcsj7ze
 zsm/eav+kxf88t8/Np/ak+AaD6DUGJfGtyECdGBfnoW5NyQ3S+4yqXPKy
 2l1pt5TxFEF8pKBwUt7irpu850WJ7NU1etxJ6ARnjnOimwIVm94j+Kbo/ g==;
X-CSE-ConnectionGUID: bzA5If6pSnieyCPXZx+4XA==
X-CSE-MsgGUID: CF86cijdR+qUMC8xYsC37Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69722498"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="69722498"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:03:17 -0800
X-CSE-ConnectionGUID: VGoKcVvFQ4ec0dHGnktQsA==
X-CSE-MsgGUID: c8rhH2NPRvGKNr1G1KxLjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="197125444"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:03:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:03:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 06:03:17 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.12)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeNyU0TJs6gaqWFA+IFHBLQ2rh/c2IHPiGFP6ruEgUfPkX54x/ASNweP4ZOnTU5YkZKL9qTf7b6oN3vv+TANjtXeHJWUSlVMVdnK0gmnB3paDPgldhDHfGeD6wt6jo2+a0wcS4zg0te3KSvvOMTx9NRCWlJa6t2TKDNeYhM36Km73nYubdSBTDF0XWPywBHX00nNUISsxffAIGCHpBKeBkvBQV1ffPrEr8j386+QXb0VMCcnF4b2ICZwtjscL1aMAUiMhhAWmV/Y6yHtkTSTnvhVv7sOOLDPeuv2ua2gE5onjHgmr00oxyb6GQB9ZeVhIUOSBfrQ5COdSuZRZqygig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj/vCPmCHLEfpdks3ptQFKdYWcWbswU87FlVigsRcYg=;
 b=KrAuHVFdMXYS8VJdZU+17zQJd32sYaC4sgnnYoQhzsNRsk4tSm5i8kH+jAkrEACQtFck64hVAsKN0zXUuYdaoCSLxuj4ufHaM977PauyCw1nCNmQ63ZviKJ5FoHNpuzHfORnlNjtfBJP3Xs4fd9lcTBWN5JatS3mXLyPllXPW/J7tVDTxzOj8I1HZF9XyAFEthBsoyQ/wqgW1Gh6ngLoPhNKCbUvBLugtU3+MNHZzAP2VFs0+fYpChGrmpWiIiFNcN/BK7UmIUI+7SfpoDAuULC5xb22p+ze/oyRBN6/mRST3EfpinldzxIGt6sUOWeWs357flKL5VPRokYTYtVnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS7PR11MB8784.namprd11.prod.outlook.com (2603:10b6:8:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 14:03:14 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 14:03:14 +0000
Date: Tue, 25 Nov 2025 15:03:07 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: <stable@vger.kernel.org>, =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH] drm/i915/gem: NULL-initialize the eb->vma[].vma pointers
 in gem_do_execbuffer
Message-ID: <nt4bt52kqrl4hw3ubbgaapg4a6zkq67vlkntvfk6qpiabthzap@ytl2pldbsi2c>
References: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS7PR11MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: b53fc054-d610-454b-1207-08de2c2b605f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkhZODVtcDVITWl4dmc5U2pWYlBRSGJ5WUlYQzNBeG1xWFB1VXFzdUkwUE1l?=
 =?utf-8?B?c21iWXlXbHNwdkh2Tm90UzFlYUZBUUVMSUxuMDNCa3ZBMUg0c1puTE81b0oz?=
 =?utf-8?B?aGo3RDRmZTJIK3IxS2xwYnljZ29vUVQ1NFEwRmRkK2FGVGZFR1p2eURLS0dB?=
 =?utf-8?B?dGZuV0s4SzNKT1g0RkRoc055SFdMOUpIZDJkS0FRdE40N1M0bEU3K0RMUnZ4?=
 =?utf-8?B?Z3FwZ00rcXorcFo2QXFYcmpwZWI4V0FDTW1DNStJSDBkNGpkSUlQQ0JRYnVN?=
 =?utf-8?B?R2hIRDFaSzFsMjY1WU1CNDlEdW9TREJjNEt5Y08wU3hheTRVdTkvMkc4Wk5L?=
 =?utf-8?B?OG9QeVlIUXJOUmUwL3RmMDVqZEZ4OUxnSnBDenI4eTlRQXJqbTZMQjVlUXF5?=
 =?utf-8?B?YzRiT1FvSGhRcklMblhPSHBGWVNiNU1OdkpxZ0Y3QVhLY1EwbE5wMGFtWVpV?=
 =?utf-8?B?Y0lua3hVTVBzbkdCQ1lHSVpvOEhqTjAvK0NhNjJOTVk5NTF0V0V6eGx5blM3?=
 =?utf-8?B?dmwwb3NUa3BtU3lvd3VtUkhzaExrVnZHc3ZqcmREQmRRU2p5UjJMZ1J4RDRm?=
 =?utf-8?B?S043SVViQWk0RGE1NElsVXdEL2ZYTWU2Yyt6S2hwUVViUDF2eEV3MXEwR3Ro?=
 =?utf-8?B?Z2tDeUVneVlXY3FpWE9CNzA1MEY2bmxmS2VMWlFkYnlTb2xuWktXV01scmRB?=
 =?utf-8?B?dW5MczkzTys3RXpjaDJCVndpNHBmU25hb0JNdk5sbU9HRWliQk82QzB6TUYw?=
 =?utf-8?B?RGxOZTdIYkV2ZitXTW1YSitwbmZQVXJGUk1abUFPWTJxMi92NVdNcWxtQWht?=
 =?utf-8?B?NGNpTi95Ujh2R2JzM0VIeGJGeXhETlk1ODRzcTN1eHlKbGUvRW54OWxuVDIr?=
 =?utf-8?B?RU9zajdXZmZHc1JUdVAwMmpmMnN2M0wzK0RLL1pwVndrTXZBejQvNCszV3NJ?=
 =?utf-8?B?dE42SytLSWJBM0ZBN1FCenVDTy9jODVXbm9OcThQd2wydmFISFVJTE0wWERS?=
 =?utf-8?B?c1EwcTVqQ0pPZDlXbWUxUXhKem1VSHZsM0VJVS9GYUw1bDNEdEw3NTlXZmRD?=
 =?utf-8?B?N3VXMGtsdkFISHh4WEpJaWk0RkxXRnRHRkxhSDA3N3kvLzhySy9PcE1KblBt?=
 =?utf-8?B?TFY1cTgvU0lxYjhoQW1rcG5vbWhocXR4WlJBWmdxbXg3Nk1tN1pBR3VBOXZy?=
 =?utf-8?B?dDRNZDdKTzhYQ3Bia05OMSsyL0tEQ2F3eFZwSkdueTNrdnQ5ZFdJbUw4UkVC?=
 =?utf-8?B?NW51MXBNc0JMUk9yUmpjOVk1UkJjOGtMdFhtZllzRGRlajk2QjQrd09ubHhu?=
 =?utf-8?B?ekwwQVllL3RlWG9Ya2daNzBpamNMQWwzK0FwVFlSc29YckszMXRobkdGMVEy?=
 =?utf-8?B?T1JrUE15TUJFVkxTQkdGNnpQc21ONkdjczYzYVRuUWllSWozRWlBWW13RzBy?=
 =?utf-8?B?QUdOdkt4dTVDTlZ2MUVvU1B4ekhFZ3NoN0p0eW5aNVRWYWdmRUxlK1ZmT2lk?=
 =?utf-8?B?eTlvWlJVVkc4aDh2bjloelhyVEdueVF1TTgwNHE4ZEgxaTRiTEJ6d2JSNC84?=
 =?utf-8?B?VENBSmQxUmtPVTlWUFhva3BIaG1JOFNpYTdwbm5odnVvSStFR1N0UHZnVU9m?=
 =?utf-8?B?V2cvcTQwVjN4MWorR2NIdVpkR0ZpRkh3YUI3UDVldHVYZEtBV1NHblg5cHNZ?=
 =?utf-8?B?eDRhRmZrNmFlV05MOFhvdWRUb1B0eFc0MUtHRC91Ykc3STVjNVNhQVJIbXhC?=
 =?utf-8?B?Zll1OXhMVVVRRUsxYWh2M0lOdWhpaHVEQTNGSVpnLzRKa1dLRDNFVlFFeEVH?=
 =?utf-8?B?alFRWHMvcUJFbmlSdWpPd04xSWViMUZPZStJWklnblpyZ1EwYVltZnJZd1NY?=
 =?utf-8?B?ZXJTd0JaQjdDTVFFUFY5K2p4ZFVyZ2tIYmtpN3FjM0xBamNSOUVNZm11by96?=
 =?utf-8?Q?hN3OWkt+SdexS/lNpPDNG7SjvpudM5ZO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VER3Ny96Ym9NVUFObjg3QjUyOWwwcnNuRmxadW5PcEtRVnNXTFVGbGpEN2ZP?=
 =?utf-8?B?aExZdHhUc1krYzVPK0J5N2pCTTYxQ3ZiRHFBOXdpTHBiWXZBYXZrTTJDNC9G?=
 =?utf-8?B?RkI5QlgrNkxpTWRSYUFTQUtFcWNqSy8wQXFQZnVMb2d5QzNQd3dpWTdtcGVG?=
 =?utf-8?B?d09QREg2RWF3ZTRJcTJXbUlMUmw4NnU1aThxYThac2xiU0JwSzVISy8wcjJF?=
 =?utf-8?B?ZDltMjlXQy9LYVJ0cGZROGNuTHhpWDVkVUx6eW4rck4xbG9kZ0EyZC9UQXdV?=
 =?utf-8?B?c2tVNTNrTlRMWG8rVk44aFEvZnR4UFhnTEQzeW9EczkzeCtrTGJjd0Jwd2JU?=
 =?utf-8?B?L2pMcytueTFwb0xTenpxS2hvNVFlU1MwaTJYM3NmN0VwYVBTbEpUUzVrNExu?=
 =?utf-8?B?cTlxMzBLV3Z0SVRYSWdMQzdMVUNUZkdCa2Z2a0VKZmFmSkJHMGYweGdyVVBs?=
 =?utf-8?B?VHZTcmt6bW5PaXhuSSt3TDhhQUszZFduMjk2VGEyUjBWbFBKWkNyMmwzSGYr?=
 =?utf-8?B?QS9ZRkpoUEZBZHJtRXMzOUowM0hNWmgrZ1o2NHFQUUtUSlcybTRFWnFoTHB0?=
 =?utf-8?B?RDVTQlJQZGM2RkhOQVQ0VHdtRWxPd2VRZzRad2s4b3ZMZnkraHBSdXIwdjFO?=
 =?utf-8?B?QlB1aGtCZ0hzWk9oK3Z0WGZUTTMvZFNpVUdGbEEwWWJKeHAwc1ZwYWJpY3J3?=
 =?utf-8?B?WEl5MThSblpURmxWc0RVVHh4MEJpMUlNYVJ1cG94N05WQktPRS9BbUs0WVht?=
 =?utf-8?B?MWtJOEFkbUhuQWhRbWx3V0orWWlUdnNwYnJSWFZIMlVkMzZCd3ZxNmd0N0Ux?=
 =?utf-8?B?Y2JnTFJObXhFQmlHQWNBUXF4ZHlVcmxhQnV2amdtT2pjbEhTbFVnZlZpcjU1?=
 =?utf-8?B?bmRuU2NBUWJlaGp2YkZtTkxqaTdjZ2g2Wld6QlRFdGlHNnFJTnZpN0NVb0hv?=
 =?utf-8?B?OG41Wjk4NVpESnQyeW1QNmZBVEl6bTRsbWppZ0NhaXJvTGt0QXcrSE9vQUxI?=
 =?utf-8?B?RXVIRzJOd2JJazdPTVl5TU9VMUcwdEQ3ajhWdElmY3NrdnhrK0lBbjRhMlkv?=
 =?utf-8?B?M29EcVM4anBObURJNldQd2hOWDNOQnUrZWhhN21Ldnc5Y0VCM1Zjc3Z6YjJU?=
 =?utf-8?B?THoreFpKdTVXaGdqNERJOFlCVUhZNjJtSUl2MzFzWXU3bWs0OVVaM0VkOGUw?=
 =?utf-8?B?b24veG5Xeiswb2IzNmM3TXduZnFCZHRmeWdybDdFVFZEa1dGMVZOYjZ4SENt?=
 =?utf-8?B?UFFBSGJMbTRzRlJGaERneWxNVXIzMmlhQnBDRm9WeGtnTXBJRFU0MmM4T1Z1?=
 =?utf-8?B?S254WXFiQW15MnR3Q3g0eHZ0Y0VqODAyT0tCK1BkNURqQ1ZERkUzRjc4dHdx?=
 =?utf-8?B?dlZ1djJEeWdxSFM4QkcvUFpBMXpkdXVHcHVoZUVKNkN1UzJlVE50N1NZTzJO?=
 =?utf-8?B?ckpyZENUTStwUStoYnhOV0VnQVVRZmwzNkFtZ3dQbWlkanFaTUllSkJRVEM2?=
 =?utf-8?B?aThjT2xodFh1alBGdFd2eHkyU2JUc1Q2WHk4Sm1wazZVdDZyY204cHR4ZEhI?=
 =?utf-8?B?NDV1Wk5VcmVneVZMNDhtNm9WU1p2TVYxQVJ0SUVlUHEzV0ZYbnZpZlA4U2ZN?=
 =?utf-8?B?S0k2RUV2Q1EzbUhQNUtocVlyOVE3Mm5GQmsxQllTSkoyTjlCbXdRSGpmeWEz?=
 =?utf-8?B?dW5IbUFYQVdoeUNYUGUreHA5VEVTYlczUXNkRW9uWXloWjNiTHh6WndIdTA3?=
 =?utf-8?B?N3VIZldsZlRDekhCVHFpSllnM2tEVWNBQ2Q5Mk1qM0pyM0JpTVZPSEZZaXI0?=
 =?utf-8?B?bjJLdndOd2lYYmlsR2FhVldoTEQ2cS9vbm5nMXpOOFUwNVVUTjNGbFpiYmRC?=
 =?utf-8?B?V09objBCTVlGS0hhd1Y3NC9pYjA3Zy9HYUhMR0RlejZTbUpLYlFDNWlkKzJG?=
 =?utf-8?B?SXJwTVg5MlJrVzMxZW5ZNnQrMzBVYmc0b2htcHhIeU5NdDlMZk5pSFVoem12?=
 =?utf-8?B?VmN1MzZPbmlmcXk1bjg1N2dINHU0MFdBZVBwK2RuNW9wOGNEcC9iNTV5dGdZ?=
 =?utf-8?B?d3RvRStiUTRPaUJBN28xejVOZ1hOMW9PVERxK2V1NXRrNzM0U3V6eGZLMXdu?=
 =?utf-8?B?cVlNNzJVMmhpQU54SDZWVFpuK3dtak13dnUwenlKa2hOVEdQVXpGNmxTVUtl?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b53fc054-d610-454b-1207-08de2c2b605f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:03:14.6866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvzDfA66fwddmEQtj7EzY52+1j2Qh+1QOBS+MNdMnFHcTTtW0RT4weFSLYiLmPTllzJnohOecQGZ8we+sQ3XTxGxQQn2BqPjqVZ7wcttH18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8784
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

CCing Tvrtko, used the wrong email in the patch by accident, sorry.

On 2025-11-25 at 14:33:38 GMT, Krzysztof Niemiec wrote:
> Initialize eb->vma[].vma pointers to NULL when the eb structure is first
> set up.
