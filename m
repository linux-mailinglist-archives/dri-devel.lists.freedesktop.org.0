Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70863D1097E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 05:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2975810E2BC;
	Mon, 12 Jan 2026 04:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTdpVHVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7A010E2BC;
 Mon, 12 Jan 2026 04:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768193185; x=1799729185;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=93T/zb6eAx2i/mQqdO308+osRad3a9lRAMhFqzUxdOQ=;
 b=NTdpVHVVKpH/EMNKlxBEVNeTj1qhOvrPeeY9eqnFP9LV3olpeSIOuYIT
 e1q0URUjmmLS/III+gITfe+7a0AJzzuegoefW5mgpiPqyJNkTw9bIqntP
 SMQcaba9Bqj5EdwMbqv2TyCrEmUIIPNWdk5Ks1Mt/5HegJewh6aD6XyA1
 0b7jTOOeR7SGxHfhhhxgFhjHV+aqxFAKOIQVp+pyfjuDnVG0AHkSLrBXl
 rM4a9VhF0YUEHfNRj9ADAfozLdWXjGNKZJfizryEz7s1G+dykAcIH3TXm
 19MAPZzGQX30CoZhELdEd53M4MAk/vTQ8d6dHrpP3MjV2ujtTaFQcCQ5F g==;
X-CSE-ConnectionGUID: X2ri/UAGQlakCaorMHJtyw==
X-CSE-MsgGUID: KxKvSKE6TnawsLrsLKciGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80919147"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="80919147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 20:46:24 -0800
X-CSE-ConnectionGUID: FSubdL2TR02NJLv2zZTfew==
X-CSE-MsgGUID: OoD31ghnRAuH4Er390Jgew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="227262984"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 20:46:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 20:46:23 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 20:46:23 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 20:46:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiqeZplOc9HvDtf9I2P8W461tb7jtZtL1930oZRVy7yrGTLe5GbCu4V6CGyR7QnG4qq3QTk9mZr7tWGysapfcwjPqMBor/dZtdhyUBUYPTpBsdXFB770xNPbMBziNMWMaiekyEaYP59BgMQ7IHluuCQ7UCWnOgEo+v+qmYyPg+34N0Nr8BZZxgQaEsbnBn9b2qerZiu/IzmNaOYq97yY7XERHbnP4rCyPJZxifrRETLu/RO4QA0RbPLsBZGkfFfIS16nf6sTh+0uxd5OXftTDFFHM//18nMny/pZAYFP2jLwq0XYOybtOT90W+w6lS+4IxlWUtMv4LPyczty9LQVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZDPO2UyIUnaRJJs8rqp5/knHbHMxBGzyA5V9OjG26Y=;
 b=EnMONOTTuMGSgOXQc0lCvtZFkm47b+wAj3FK8U2aE9mQ6SGNPV+kj5J5BsQNG2LzfDlFUkDouwCTX5Iwx4Zj9KEJCKcD1/n67U3SMkhzHC1KO5DGkkP1szPfeXCHbzZ9WQyvwzPJdJ5dzmU+wu6IxaUMhkI8zzOHjcFUH56d73mL3ikJgXwbdNRjFDOTFnNk0n8i3+JPOIlzbvyx8UJ651XhPpUN4XtZUEGS0JvIAKXyuYmszGAkEscdCA+VVST0PexnPEvctw8yknfp6fYBiEi5wbcogOyi7YuCQwAadYbKE1akoDVAOfuV6dRe0o2RB+cvUviirLKVVcovTjLNwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 04:46:15 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 04:46:15 +0000
Message-ID: <55c9e0d6-42e7-4736-a5d1-29ac6933e067@intel.com>
Date: Mon, 12 Jan 2026 10:15:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/xe_hw_error: Add support for PVC SOC errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <lukas@wunner.de>, <simona.vetter@ffwll.ch>, <airlied@gmail.com>,
 <pratik.bari@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <ashwin.kumar.kulkarni@intel.com>, <shubham.kumar@intel.com>, "Himal Prasad
 Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-10-riana.tauro@intel.com>
 <aT_oXo97R3GyWgNk@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aT_oXo97R3GyWgNk@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: c4945d85-fd76-480f-215f-08de5195847b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXZQZG92NThJZU9TUXMxVjM0bGE0UXE4cnRpRHI0MS9EMUx1S3BNdHJDQ1BG?=
 =?utf-8?B?Qkt3dFU1bHhjQS92c3NHZFdRazRDQzZNZEJNUzJsOE1UYm5nWVQ0MU5YbnM4?=
 =?utf-8?B?d01pdG5Sc2cxeU9XYWxCWUlOOHBjSUlaWHFTNmUrL3BjTXlHcnZ4TTNTWVBm?=
 =?utf-8?B?a1ZwWEgvWjdLQXVWSVRHRUIyQ1krOTNQdzEwTG9XNHl3L05KU21ZdVVoVlBj?=
 =?utf-8?B?dDduc0FRMHEvQnhMa0lMQkZjOUV2d3F2RldRR3FRSDJiRFpQNlFNbytNaWcv?=
 =?utf-8?B?SXVJRzNlLys0amxQVTl6emJDK2NzYnZ4SHcwa2R1NDRYSDBzK1ozUHlkZW40?=
 =?utf-8?B?RHZSdC9oL3RlSDN2dUdOMGRTZkkxSzdRU2VkUWdiTW03elc1VlY3TXVRM1Zt?=
 =?utf-8?B?NTlkQU9ERGt0RnNNaVlEdTcwd1ZsTXdzNzBvWU1IR3N4VUliUlhVb2JXVzcv?=
 =?utf-8?B?LzNaZVBoaGFZaXRtU2hURnFRWmJhWHRIRlYrUVNCTlJzallpRTlSUkQwRXF5?=
 =?utf-8?B?ZVJlczZGb1lTaDRrQzZoZUpNR2lUSGRJSlN0bmVNeWZoZkdUcWRZeU1DVzRa?=
 =?utf-8?B?YnpiUlBuV1lzYzZxU1dSNlk2OXpna0ZkM3VhSFc4a3FYTDdhU1ZqTklhT3hD?=
 =?utf-8?B?TDU1eEhwb2xXbEM2QVFuOTJrTU1jYTFnL2xHenRnL2hHMlFrbEJJbTA0UEdJ?=
 =?utf-8?B?TVRlSWYxUE5STmFjMTRwaWZ3Vm1VNGNJT0Y0RWdvbjdKc2NoMkowaHpEcjlt?=
 =?utf-8?B?bDNxekoxVDRJZFdzZEFxS1M1WHE5WU54dWhNcnV3ZmtiZDJ6SDRxVm1Objh0?=
 =?utf-8?B?TDgyVHhnN0dyN2pybUw4eUhyNS9mTWNsUmpKa0N4akxuVjdkdFc5S1pLYVNn?=
 =?utf-8?B?R2JPeEwvbTZkSmRpRzd4S0o1WVZmUDFYQitReEFCdVNkcDcrN1A1RTZPN1pz?=
 =?utf-8?B?SURKSFFvOENFQjB0cmlId0pDdzZxQ1pSTnNtQlFXdWlLeE50L0ppVzRWTHVm?=
 =?utf-8?B?MnRrTG5kbWJuN29DVFYraTJGdUxQbkdXTnl3bFNFSmFGK3FFaHBacnU4TC9u?=
 =?utf-8?B?RUQ1b3pOc3d1MjNkYTc0c1FNYXFwVC81UzkrY1pGdUdONVVTYkg3a2J4bUVw?=
 =?utf-8?B?T1FDemEzNGtRbnovU0duTEo2V083VEpUNlVnbldoQVl0TkhTTlVIaHhwR1Jn?=
 =?utf-8?B?clJ2SXpsUVREWWhPTTZITEJaTTNjSjJiU1JhNnJSMEtkZWdsT1lYWWJRaTVl?=
 =?utf-8?B?ZDFMMEVZcUQrNC8yMmsvSTFsemdzRy9MWTFaNlYrL3RoOE9RWklwNXk0OHdw?=
 =?utf-8?B?ZmRwY0FpMEtCL2VwS3h4R2t3emgvOEVnejhBWC9PYXBvTENHcll1d1pUR2pq?=
 =?utf-8?B?SHZUbjhpVC9aaHl5MWVBTFBBaDhCOWd5NGgzV1VvSGtBMllPZHUxZ1pvZHFi?=
 =?utf-8?B?SU5qMmNVakM1QlhtdUtNdUZHb3Rhc0Y0Q3MvNVFjVU5pRGtqc1U0ZDhnVFNB?=
 =?utf-8?B?aFg1QWIyNzQwT2xpdHB1WHlhcWl2S1JQMUlZNTNCNUF3YVJOWlJLa040cVhY?=
 =?utf-8?B?MHN3dGxkNFBGdjcvcHZRUndQVFlHb3lwd3hNbmZ6OWdxU29CbkdKM0VYTzFw?=
 =?utf-8?B?eGs5ajhkVDN2RXBROUQzMGlxTVZ3S2J0d0tWMlZDNUtLaEZHNWFnYjFLL085?=
 =?utf-8?B?WkMrVFlDMTFDcUxjVHo2MVIwWFF0T0JlNlNUZzdVMkxDZDk3enVUcTQrcGJL?=
 =?utf-8?B?R0JveWVIWW5oMURWRnBLNm1Bc1Bmd0RIV09ySFlVcTRSSnl5MmllYnRhQzJt?=
 =?utf-8?B?UEkvblYxeStTd1dNcU0vR2F0am5XM2FvZmFLQjEydjBLeTZnSzNhdHgvL1Fn?=
 =?utf-8?B?cHZTUXUxMEliTmhxMnhEWTJwTzJ4UTVZRVowYXN0WmZxV2VXbkc5d2pQWkNL?=
 =?utf-8?Q?7J8geG/bZDGi7b0RWCkRerI+xSeXdv8v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1pzUXBid0JVQ2U0YlJWclBnbmN5ZkxPL3NUdGtSK01RbXdNUGVCam5kR0JD?=
 =?utf-8?B?dy9wbkVjT25ZeWFxK3h6b2JXN1J4Smw2Q0M2YzE0UldlUGp0bWczQ0RkeEV2?=
 =?utf-8?B?b3Y2SXA4WUhFNGNxM05HcFpNSVprYTUxaGc5cVhDWCt1NEorREdtdlc4RzV1?=
 =?utf-8?B?ZkI4Q2pGaEdHcHZuQ0pDd0dRUW9vSWliNzFnbVpUVEJuUEJmdVlOV3pzT3Jz?=
 =?utf-8?B?L2tBYUpHOXdqWHVaWktRbFpuRU9RWnM2SktBZjJCTHQ5cDlnNEdscHBKNEN5?=
 =?utf-8?B?TFU0UWFSMDk1V0ZONkR3WGFxcURveTA3VkozcU1RdVhOU1FXZUd2Z1BrdnY5?=
 =?utf-8?B?dU16N1hVdXYzOFhYYmRBZWtuM3Z4Y2hwc2FoSUNxN3dhRXowa3pkMW5nT2Vp?=
 =?utf-8?B?NER2b1lQMzZWNnAyQUExb3RIN0tsOUltTFZUM0k1dWFFSDRBOWsveW5DVWJC?=
 =?utf-8?B?Y2VFbGRlRTJwS0pNR2ZFRkFQZzZER2xFMkNSOFRuSDc0UzdaazVKL3UrY0ZC?=
 =?utf-8?B?aWtmT0ZFZUtWMnZWS2hKSVQvZFQ4QWxDeXhRMVlueEx4cWUyR3JNbUFKL0RT?=
 =?utf-8?B?a0toWERwUWh2UzgybW5nYlpxbTZoSWpkY0U5MG9YNFZBODNUNTM2UTlwUFh6?=
 =?utf-8?B?Qkp0c2FMSmtlQ01keTRuUVM2a25kOFJ3SlRUdGkyeXR6VG8ybDJWUzJGS1JS?=
 =?utf-8?B?dzNGb1FIV08rSzIrY3VUN0duakk5VXNGejhTK2ZkdHR3ZGlYakhlUmJMdmgy?=
 =?utf-8?B?MVdvWTNKN3lqYTRjenNuZFU2ZGt0aitueVpleTBXVkhiUytTTUFrMTlGdmlt?=
 =?utf-8?B?dWh1eXJRbWpxUnBZWVA2UXIxM2F0bGRVVHY2aURpWGg5TW9hR0RBb0M1eU1r?=
 =?utf-8?B?ZmMwbE5UYkI1cTZOMmo0djJnOWhjNVpqTXRFeG5wbndkME9RUElsSlNOVDhU?=
 =?utf-8?B?cGxidHV0RWxlUGhoV0NTVzdNZUEzb25oSGZ5RmNBY1V5dXhTRzhvcWY5VzNq?=
 =?utf-8?B?MSs5M3Jac0lJaEFPMVNjVktHaThRN21FYXVESVloYjhyN3JLVnV4UThhQS9K?=
 =?utf-8?B?S0pFc1BCcFVZelZZWlUvdERabHZVanVIUzBSUjd5UkZLMmdLVWYvU1dRNzNH?=
 =?utf-8?B?SVpUWGFBRW5OcktwU2x3NFdIK216YkFjSkg0c0lZZXZkS3hxdlBseGFmeEYx?=
 =?utf-8?B?eCs3TDZ3czE0b1BTaVpoZVJpb1VLc2xpOG9xNmQwQjl0NWlLN0RCM1I5V21S?=
 =?utf-8?B?bXloY1pmYnpRWVZZc1NxNWxJQ29ZZ2l0WVBWZlNtaXkyQVI3RGFwLzZDUlFn?=
 =?utf-8?B?Wkc2bC92Nzk5eGVGamJSUURkZmdTeUZwckd4OHl0OVRTODI4MkdiVHF1N3Ra?=
 =?utf-8?B?WDZiVUNFWnl0ME0xalMwY0l2RVd6eUZpMEczNjJLYXYxTnZHeEZxd1VKWmdT?=
 =?utf-8?B?a2NJclpvRmpUbDNlVW5RVU5oVDNBZFZPajB0aTFIaEF3UjZLYVNmWE9NQnJK?=
 =?utf-8?B?VEVHKzhubG1RK3VwcnptQ01STGR2TkMvL204Z3dmcUZPNlVwd1FSZlZ6OFlq?=
 =?utf-8?B?enlBWHdNeW9NWG5ybkJocGY4dnFGMEg3dnJpeE9zalkxTkFmYjduc2Npd2xD?=
 =?utf-8?B?YSthMW5PNy9aRUZWbmQwYzRpZTdOSlNTK3M0Ky9aZ0QrTXZXZmkyc01nYU9G?=
 =?utf-8?B?a0ZsRWl6a2szWGIwaGRGT2VGZ1U4eUdDY0hGc1pDMVhWS3lCR2oyUlVkUG8z?=
 =?utf-8?B?eStWSkY1ak85MVZ4S3FQdFIwVmlMRTYvaEpCNmh4OHRDdi82b24rQXlBTTc3?=
 =?utf-8?B?WDhGa2F3V2lDc1VSdDVmK2xHWkpZeEJ4emFMNXJoY0JqTzBtVUpzS2x0Vmgv?=
 =?utf-8?B?NFV3RFIyeXFzTGRhdmxoT1ZjTW9jVlovTVBNTXU0cy9yV041Z3hlZmxmZnU4?=
 =?utf-8?B?TGVJS0pUWkp2cTBFNVFLK0xPbElHVmhSUzY4YVFJakFFRjNUWXI1ZWNmenpC?=
 =?utf-8?B?NWZ3L1VWeVpHb0QwYnE4SkU4Tndyd3E2czRtSTV0YkdVbm4yczBZS3JjMlUy?=
 =?utf-8?B?aWY2VWtNd1JCVzJJUk1RcUs5dU5qdmppUXRET1VwenBiSHZmMjJOeXhLSTZ1?=
 =?utf-8?B?SzVHd0xoazM1RmpoZFcrWDZldVZZMlJFU0JVczEvUmJDcVBMUzVEd0hNUm5k?=
 =?utf-8?B?dXNvdUpHV2drd0ZGdDBXTTB2TEhVU0lwMGhMbE1WSmR4VFB6b0tFbVBvbDdG?=
 =?utf-8?B?REV5ZEJzV1BGc2RnZEJuT0xIa1N3Ti9ob1dYampCdFNMRkd6WlNIR1YrUzZY?=
 =?utf-8?B?L2NYUzdLSDhJYmM4NGhnNkd4d1JHQmZ0eENkUlZHZVp6dmZYa1Zndz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4945d85-fd76-480f-215f-08de5195847b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 04:46:15.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlgR+7hMWmOtDM1gXFM39KhvuQVys5eRaYSQkvLg7UEOZEThFvNvDhAZFU1kTVVrWPboTq5KGTPJ12gEkmpWqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
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

Hi Raag

On 12/15/2025 4:22 PM, Raag Jadav wrote:
> On Fri, Dec 05, 2025 at 02:09:36PM +0530, Riana Tauro wrote:
>> Report the SOC nonfatal/fatal hardware error and update the counters.
> 
> ...
> 
>> +#define SOC_PVC_BASE				0x282000
> 
> Curious, should we use 'master' naming for consistency with the code?

Okay will name it master

> 
>> +#define SOC_PVC_SLAVE_BASE			0x283000
>> +
>> +#define SOC_GCOERRSTS				0x200
>> +#define SOC_GNFERRSTS				0x210
>> +#define SOC_GLOBAL_ERR_STAT_REG(base, x)	XE_REG(_PICK_EVEN((x), \
>> +								  (base) + SOC_GCOERRSTS, \
>> +								  (base) + SOC_GNFERRSTS))
>> +#define   SOC_SLAVE_IEH				BIT(1)
>> +#define   SOC_IEH0_LOCAL_ERR_STATUS		BIT(0)
>> +#define   SOC_IEH1_LOCAL_ERR_STATUS		BIT(0)
> 
> What's the secret spacing convention in this file? Really, I couldn't
> figure out ;)
> 

This is patchwork/diff issue. If you apply the patch the spacing is fine.
Even checkpatch shows no error

>> +#define SOC_GSYSEVTCTL				0x264
>> +#define SOC_GSYSEVTCTL_REG(base, slave_base, x)	XE_REG(_PICK_EVEN((x), \
>> +								  (base) + SOC_GSYSEVTCTL, \
>> +								  slave_base + SOC_GSYSEVTCTL))
> 
> Brace around slave_base for consistency.

okay

> 
>> +#define SOC_LERRUNCSTS				0x280
>> +#define SOC_LERRCORSTS				0x294
>> +#define SOC_LOCAL_ERR_STAT_REG(base, x)		XE_REG(x == DRM_XE_RAS_ERROR_CORRECTABLE ? \
> 
> In previous patch this was 'hw_err', so whichever one you use please make
> it consistent.
> 
>> +						      (base) + SOC_LERRCORSTS : \
>> +						      (base) + SOC_LERRUNCSTS)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 77c90f1b06fd..1b7c782dbd98 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -18,6 +18,7 @@
>>   
>>   #define  HEC_UNCORR_FW_ERR_BITS 4
>>   #define XE_RAS_REG_SIZE 32
>> +#define XE_SOC_NUM_IEH 2
> 
> Alignment please! (including the values)

will align values. macro names are aligned

> 
>>   extern struct fault_attr inject_csc_hw_error;
>>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>> @@ -34,6 +35,7 @@ static const char * const hec_uncorrected_fw_errors[] = {
>>   
>>   static const unsigned long xe_hw_error_map[] = {
>>   	ERR_INDEX(XE_GT_ERROR, DRM_XE_RAS_ERROR_CORE_COMPUTE),
>> +	ERR_INDEX(XE_SOC_ERROR, DRM_XE_RAS_ERROR_SOC_INTERNAL),
>>   };
>>   
>>   enum gt_vector_regs {
>> @@ -48,6 +50,92 @@ enum gt_vector_regs {
>>   	ERR_STAT_GT_VECTOR_MAX,
>>   };
>>   
>> +static const char * const pvc_slave_local_fatal_err_reg[] = {
>> +	[0]		= "Local IEH internal: Malformed PCIe AER",
>> +	[1]		= "Local IEH internal: Malformed PCIe ERR",
>> +	[2]		= "Local IEH internal: UR conditions in IEH",
>> +	[3]		= "Local IEH internal: From SERR Sources",
> 
> Unless there's anything like 'IEH external', let's try to simplify a bit.
> 
>> +	[4 ... 19]	= "Undefined",
>> +	[20]		= "Malformed MCA error packet (HBM/Punit)",
>> +	[21 ... 31]	= "Undefined",
> 
> Nit: I'd align '=' in all the arrays here but ofcourse it's a personal
> preference.

will align

> 
>> +};
>> +
>> +static const char * const pvc_slave_global_err_reg[] = {
>> +	[0]         = "Undefined",
>> +	[1]         = "HBM SS2: Channel0",
>> +	[2]         = "HBM SS2: Channel1",
>> +	[3]         = "HBM SS2: Channel2",
>> +	[4]         = "HBM SS2: Channel3",
>> +	[5]         = "HBM SS2: Channel4",
>> +	[6]         = "HBM SS2: Channel5",
>> +	[7]         = "HBM SS2: Channel6",
>> +	[8]         = "HBM SS2: Channel7",
>> +	[9]         = "HBM SS3: Channel0",
>> +	[10]        = "HBM SS3: Channel1",
>> +	[11]        = "HBM SS3: Channel2",
>> +	[12]        = "HBM SS3: Channel3",
>> +	[13]        = "HBM SS3: Channel4",
>> +	[14]        = "HBM SS3: Channel5",
>> +	[15]        = "HBM SS3: Channel6",
>> +	[16]        = "HBM SS3: Channel7",
>> +	[17]        = "Undefined",
>> +	[18]        = "ANR MDFI",
>> +	[19 ... 31] = "Undefined",
>> +};
>> +
>> +static const char * const pvc_master_global_err_reg[] = {
>> +	[0 ... 1]   = "Undefined",
>> +	[2]         =  "HBM SS0: Channel0",
>> +	[3]         =  "HBM SS0: Channel1",
>> +	[4]         =  "HBM SS0: Channel2",
>> +	[5]         =  "HBM SS0: Channel3",
>> +	[6]         =  "HBM SS0: Channel4",
>> +	[7]         =  "HBM SS0: Channel5",
>> +	[8]         =  "HBM SS0: Channel6",
>> +	[9]         =  "HBM SS0: Channel7",
>> +	[10]        =  "HBM SS1: Channel0",
>> +	[11]        =  "HBM SS1: Channel1",
>> +	[12]        =  "HBM SS1: Channel2",
>> +	[13]        =  "HBM SS1: Channel3",
>> +	[14]        =  "HBM SS1: Channel4",
>> +	[15]        =  "HBM SS1: Channel5",
>> +	[16]        =  "HBM SS1: Channel6",
>> +	[17]        =  "HBM SS1: Channel7",
>> +	[18 ... 31] = "Undefined",
>> +};
> 
> I'd move this array above as per SS<N> ordering. Also, group together
> global and local ones.

okay
> 
>> +static const char * const pvc_master_local_fatal_err_reg[] = {
>> +	[0]         = "Local IEH internal: Malformed IOSF PCIe AER",
>> +	[1]         = "Local IEH internal: Malformed IOSF PCIe ERR",
>> +	[2]         = "Local IEH internal: IEH UR RESPONSE",
>> +	[3]         = "Local IEH internal: From SERR SPI controller",
>> +	[4]         = "Base Die MDFI T2T",
>> +	[5]         = "Undefined",
>> +	[6]         = "Base Die MDFI T2C",
>> +	[7]         = "Undefined",
>> +	[8]         = "Invalid CSC PSF Command Parity",
>> +	[9]         = "Invalid CSC PSF Unexpected Completion",
>> +	[10]        = "Invalid CSC PSF Unsupported Request",
>> +	[11]        = "Invalid PCIe PSF Command Parity",
>> +	[12]        = "PCIe PSF Unexpected Completion",
>> +	[13]        = "PCIe PSF Unsupported Request",
>> +	[14 ... 19] = "Undefined",
>> +	[20]        = "Malformed MCA error packet (HBM/Punit)",
>> +	[21 ... 31] = "Undefined",
>> +};
>> +
>> +static const char * const pvc_master_local_nonfatal_err_reg[] = {
>> +	[0 ... 3]   = "Undefined",
>> +	[4]         = "Base Die MDFI T2T",
>> +	[5]         = "Undefined",
>> +	[6]         = "Base Die MDFI T2C",
>> +	[7]         = "Undefined",
>> +	[8]         = "Invalid CSC PSF Command Parity",
>> +	[9]         = "Invalid CSC PSF Unexpected Completion",
>> +	[10]        = "Invalid PCIe PSF Command Parity",
>> +	[11 ... 31] = "Undefined",
>> +};
>> +
>>   static bool fault_inject_csc_hw_error(void)
>>   {
>>   	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
>> @@ -197,6 +285,117 @@ static void gt_handle_errors(struct xe_tile *tile,
>>   	}
>>   }
>>   
>> +static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
>> +			  const enum drm_xe_ras_error_severity severity, u32 err_bit, u32 index)
>> +{
>> +	const char *severity_str = error_severity[severity];
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +	const char *name;
>> +
>> +	name = reg_info[err_bit];
>> +
>> +	if (strcmp(name, "Undefined") != 0) {
> 
> Do we need '!= 0'?

Can be removed

> 
>> +		if (severity == DRM_XE_RAS_ERROR_FATAL)
>> +			drm_err_ratelimited(&xe->drm, "%s SOC %s error detected",
> 
> Again, duplicate 'error'.
> 
>> +					    name, severity_str);
>> +		else
>> +			drm_warn(&xe->drm, "%s SOC %s error detected", name, severity_str);
> 
> Ditto.
> 
>> +		atomic64_inc(&info[index].counter);
>> +	}
>> +}
>> +
>> +static void soc_hw_error_handler(struct xe_tile *tile,
>> +				 const enum drm_xe_ras_error_severity severity, u32 error_id)
>> +{
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_mmio *mmio = &tile->mmio;
>> +	unsigned long master_global_errstat, slave_global_errstat;
>> +	unsigned long master_local_errstat, slave_local_errstat;
>> +	u32 base, slave_base, regbit;
>> +	int i;
>> +
>> +	if (xe->info.platform != XE_PVC)
>> +		return;
>> +
>> +	base = SOC_PVC_BASE;
>> +	slave_base = SOC_PVC_SLAVE_BASE;
>> +
>> +	/*
>> +	 * Mask error type in GSYSEVTCTL so that no new errors of the type will be reported
>> +	 */
> 
> Can be one line.

will remove multiline

> 
>> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
>> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(severity));
>> +
>> +	if (severity == DRM_XE_RAS_ERROR_CORRECTABLE) {
>> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, severity), REG_GENMASK(31, 0));
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(base, severity), REG_GENMASK(31, 0));
>> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, severity),
>> +				REG_GENMASK(31, 0));
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, severity),
>> +				REG_GENMASK(31, 0));
>> +		goto unmask_gsysevtctl;
>> +	}
>> +
>> +	/*
>> +	 * Read the master global IEH error register if
>> +	 * BIT 1 is set then process the slave IEH first. If BIT 0 in
>> +	 * global error register is set then process the corresponding
>> +	 * Local error registers
>> +	 */
> 
> This can definitely be less lines.

okay. It'll still be 3 lines

> 
>> +	master_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, severity));
>> +	if (master_global_errstat & SOC_SLAVE_IEH) {
>> +		slave_global_errstat = xe_mmio_read32(mmio,
>> +						      SOC_GLOBAL_ERR_STAT_REG(slave_base, severity));
>> +		if (slave_global_errstat & SOC_IEH1_LOCAL_ERR_STATUS) {
>> +			slave_local_errstat = xe_mmio_read32(mmio,
>> +							     SOC_LOCAL_ERR_STAT_REG(slave_base,
>> +										    severity));
>> +
>> +			for_each_set_bit(regbit, &slave_local_errstat, XE_RAS_REG_SIZE) {
>> +				if (severity == DRM_XE_RAS_ERROR_FATAL)
> 
> Shouldn't this condition be outside the loop? Also, should we not log it
> after we clear the bits?

Yeah condition can be.

But why should we log it after? Anyway the rest of the registers need to 
cleared too to unmask

> 
>> +					log_soc_error(tile, pvc_slave_local_fatal_err_reg, severity,
>> +						      regbit, error_id);
>> +			}
>> +
>> +			xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, severity),
>> +					slave_local_errstat);
>> +		}
>> +
>> +		for_each_set_bit(regbit, &slave_global_errstat, XE_RAS_REG_SIZE)
>> +			log_soc_error(tile, pvc_slave_global_err_reg, severity, regbit, error_id);
> 
> Ditto.
> 
>> +
>> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, severity),
>> +				slave_global_errstat);
>> +	}
>> +
>> +	if (master_global_errstat & SOC_IEH0_LOCAL_ERR_STATUS) {
>> +		master_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(base, severity));
>> +
>> +		for_each_set_bit(regbit, &master_local_errstat, XE_RAS_REG_SIZE) {
>> +			if (severity == DRM_XE_RAS_ERROR_FATAL)
>> +				log_soc_error(tile, pvc_master_local_fatal_err_reg, severity,
>> +					      regbit, error_id);
>> +			if (severity == DRM_XE_RAS_ERROR_NONFATAL)
>> +				log_soc_error(tile, pvc_master_local_nonfatal_err_reg, severity,
>> +					      regbit, error_id);
> 
> These can be consolidated using temp variable. Also, log after clear.

will consolidate the arrays

Thanks
Riana

> 
>> +		}
>> +
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(base, severity), master_local_errstat);
>> +	}
>> +
>> +	for_each_set_bit(regbit, &master_global_errstat, XE_RAS_REG_SIZE)
>> +		log_soc_error(tile, pvc_master_global_err_reg, severity, regbit, error_id);
> 
> Ditto.
> 
>> +
>> +	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, severity), master_global_errstat);
>> +
>> +unmask_gsysevtctl:
>> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
>> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>> +				(DRM_XE_RAS_ERROR_SEVERITY_MAX << 1) + 1);
>> +}
>> +
>>   static void gt_hw_error_handler(struct xe_tile *tile,
>>   				const enum drm_xe_ras_error_severity severity, u32 error_id)
>>   {
>> @@ -269,6 +468,9 @@ static void hw_error_source_handler(struct xe_tile *tile, enum drm_xe_ras_error_
>>   		}
>>   		if (BIT(err_bit) & XE_GT_ERROR)
>>   			gt_hw_error_handler(tile, severity, error_id);
>> +
>> +		if (BIT(err_bit) == XE_SOC_ERROR)
> 
> Make this consistent with above.
> 
> Raag
> 
>> +			soc_hw_error_handler(tile, severity, error_id);
>>   	}
>>   
>>   clear_reg:
>> -- 
>> 2.47.1
>>

