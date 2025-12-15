Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C1CBD016
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B8410E24B;
	Mon, 15 Dec 2025 08:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIojckYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C340788EFE;
 Mon, 15 Dec 2025 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765788202; x=1797324202;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dVVzkP9N/ydhklpppTLy01QLTJGFU7wIEPGOplmvDUA=;
 b=dIojckYcEBcH04U3Jhowj46kKe1MeYmQVRkwebVFiieJiBVDGctVy/S1
 UmFYJBZ5UzHltr2M40oSfXEdn6B2Knozf6Sed7e6fJHZunugoOhvKSeMR
 2c4oOvyoSfL3Y77ss4sVZaqVAE4kWU+nL3+QjGR4WZXTFnGDsCJW5OnkA
 9FnVek9Bb/RAYP9EjlWj+XfUtEg20zw938h8Rp/nvZOb0bJVuBnn8uvIX
 hKX4XUWAxfCpnncQtoqQtlqnMyEHFrHSUGaiIWDStK9nSJpHjOnlciPCp
 RyTstfaEUfrfRIEw6bBK/6OKf9+ClM2uYx3iI0JKmFdlhq8OixFmlwmC5 g==;
X-CSE-ConnectionGUID: AOzCKGTZQnK8qnxYIfH4Lw==
X-CSE-MsgGUID: tn1HDToiRWmD3RHmHNe4Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78800240"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="78800240"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:43:22 -0800
X-CSE-ConnectionGUID: sElr31KGReC5F/6IGKd28A==
X-CSE-MsgGUID: mXOs+vXZQCOban7n5xPF8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="196932219"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:43:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 00:43:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 00:43:20 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 00:43:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdyGTuudYVrCp8xFvCVI4B7AFagX6JPf8uOH31yM56sHP5R9adBhhvrmFif6uKVY858yq2r7ZTLywLxml2hRU8xBFF5h0aZoGIgYtZkz9ckp8TdwMULAAN0YKlW5o1c2ZCIFnya2yaBS583jW5sxy1XqG+Ejn0Z2FUDEBHpQ5uoCMiQvn+wUH+dJcWni/Z9fsFi9u9L7hfeuHNHO3EO94wWN4heJhKyy8clxLr5V8YKFtiXoUkKXU2+16y4gVAGxCk/mJLqIxZ9onTp133KTVRXZLS3SU7BjOXOsgWrx2bVz+SavKP+WKGTfE8amsUa6SX2g3ekFUD/wIlKMeZ4nqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHuWdZhHVrYuXZgxkenxMtX62PTlWvatke8MKaHIMqI=;
 b=rnHPmbxir+PmuqzsxA0gCUY2LCH0Yo5Uh26U3/TbvANReJgvjDdR8ar3NWJMuw2afZaPIGbD0n0itWwNWlaf0+SwRLD7ZRJdadvtV/ZWsAG2QylphMxUkZyzkpewb1gJllzR27iHqD8JEo332ZgIHjsaMs1U/tu02ZdLob9vHIrwNRNfsNw7iXM/zzpXlIyD4sJKIHU/5Zzz3Mb5upxk97ZX2euCMvR8Q+Iq1DWVDnRRJBmJwrvlKsJfSt9XSwOGM94r36UAYd8ypVlpwdEQD34jw9N35L4yVO/z/vyIuesXOz+NtqydXMvSJh3HZAJo1UPwXZc30iBAoZcnlpDeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Mon, 15 Dec 2025 08:43:17 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 08:43:17 +0000
Message-ID: <31921238-6621-40d5-94b5-8ba3e5f9d40c@intel.com>
Date: Mon, 15 Dec 2025 14:13:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 14/15] drm/i915/color: Add 3D LUT to color pipeline
Content-Language: en-GB
To: Simon Ser <contact@emersion.fr>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Uma
 Shankar" <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <pekka.paalanen@collabora.com>, <harry.wentland@amd.com>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>,
 <alex.hung@amd.com>, <jani.nikula@intel.com>, <suraj.kandpal@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
 <20251203085211.3663374-15-uma.shankar@intel.com>
 <aTwwBMKUp5AYmFTN@intel.com> <f24364ad-a861-4fcd-93ab-3230a6b3299b@intel.com>
 <k4mMdQv6X-RIzc4veUD5pP2oD1KGp1Tx6ifJM6S8W3nrowRPz275vsfcNUHeflvxZaISPaM_e861Q-1rO1jnV8bNNmOdPJ3tyS3GVbnpbao=@emersion.fr>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <k4mMdQv6X-RIzc4veUD5pP2oD1KGp1Tx6ifJM6S8W3nrowRPz275vsfcNUHeflvxZaISPaM_e861Q-1rO1jnV8bNNmOdPJ3tyS3GVbnpbao=@emersion.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0411d2-5858-47ba-e146-08de3bb5fe33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkthVGFESC8yMDk3R1krZmMzdVFleWF3WlJhWjRWekgxMzJocS9qY2phMytu?=
 =?utf-8?B?L2U3eVpzV0hieDFKamYyL1lhNjl5aE11d0tPeGtwNjEzWUVHZ0hUbHpKQmpM?=
 =?utf-8?B?N2dkdTZ0U0MrdEFqRlJLLzhkbUhiRDFxUDBzSmFWbG1adEl6RUFxRzhrdFJu?=
 =?utf-8?B?RlhaYWJScE15TE1BZlFEQjlTSVF6ai9rRXp3Ym5YWHJEYjZPdTNWaUVTWWJJ?=
 =?utf-8?B?NzNvREJkRzM2UU8yTGp5QXNybG02ZDVYWk9ZN0I3VHJVRGdNYnRtcTZFcGFv?=
 =?utf-8?B?QWhSTXFEaTNCb2d1MWZva3FvL1pZQ1lRR1pJdS84cm9INmw0QkdZVy9tRDcx?=
 =?utf-8?B?c1BqQ0tXYmluNXQvYjB4SXNoTjU3cjdWSXdjWkZJYng2R05nOEJmZG1zN1JH?=
 =?utf-8?B?N3oySmVrQ3pveUVPQ2o2bGJsZ3doekN3aCtYZ2FvNE1lcmdDeVBib0YzaGVE?=
 =?utf-8?B?eS85YVBYRVY2YXFNUEJPQzVXb3lQTFZlV0xKcGFmQ0R1NWlyUW5TWDFKbFJO?=
 =?utf-8?B?ZWJKZ3ptQ0JKaFpDNWpsWUg5Vko2M200RVhTT3ZvSHdBOVFpeFRlQzlpVUEr?=
 =?utf-8?B?L3JRRzBjc3hLMERpT24rUjdIT0U0R0hVOG9xTHZaWWdVTXVudjdCWW9JVkk3?=
 =?utf-8?B?bXRHQkh0a1cwTDFRMUFrenF4aXlKbnNZNDdtMkJCeUMvUGNJYXBDcUE2ZmxB?=
 =?utf-8?B?RDJkcWxjWE5SekNqZGVhYjBaTlQwTkp1clVuQS8xdktaYmw3akZEM05VR013?=
 =?utf-8?B?TmRBS3ZSVFF1UWNnOHl5TXdsYWZQSWRHNWxxUXZBWEVpWHRVN1hRWFdEN1pu?=
 =?utf-8?B?OXBUaVBFcWNuWDc2YXljdmZrS0IvWHFHVnIyRjVLSVNRTXlRNjNuM3YvY2pJ?=
 =?utf-8?B?bGNXTUVaSldoNjZvajNHUGJXbVp5Rkw2Z2pnRDNEb0YvQXlrZ2s2ZURscEVD?=
 =?utf-8?B?bzdjMWZaSFJpVnB3VUtIcnV0Y1M5dW5uWU41Q0lITVlvVGJRcTMwRnBXRk9h?=
 =?utf-8?B?N3lRTWdOcHVYNlc3TnFOYW1ZR2tyajhuZWhqNWFITHR4a29Lelg3eU1rdkxU?=
 =?utf-8?B?VDhld05VTXlMSjh3ZEk2ZzJjR3daaE1UczVoNkgwWFBLVm9hM2I4V3Bpd3Vm?=
 =?utf-8?B?Y1kycitUMVVUZUZpUlF0NzJsWFRGckdtMS9VRXhmK0dLeDI0dzZBbEhqNVly?=
 =?utf-8?B?bitIU0lCcFovMjl0clVZZStFM2ZPOCtSNlhUM0dBalFXaFB4QkVsb0V1M25R?=
 =?utf-8?B?ck5PQUlnYU83TTdxelplQ1U3Y3RqWmNDTE93UkRna2JYeHpkL3VQeDZUckVJ?=
 =?utf-8?B?YldFT24zcE5FVTl2MEdKRkU1VGV5VjV1b25CZnFQME9ZNTZHMURRWW1GQmJk?=
 =?utf-8?B?VDkwaHVuUTdpRjREVHBickRaMzc1ZzcyL3Z0QXJyTkN4a3p1VVRZTXA3OEFj?=
 =?utf-8?B?QXp0RjczN0tHUEVzdkJFYWF4aDRaRERWd3hXeEZUd3NVVGhDMmJEb2V1VXpR?=
 =?utf-8?B?Qk91Qm9peWh3SUs3NVRESlRsSTdVZERNNkJ6Z0xrWjZDSjFadWZjQnlrM1Z3?=
 =?utf-8?B?dFFzak5yaExZdm02R0Mxbloxd21LRC80UU9EZHZLNHlGdXhCaWNJcUt5SmZz?=
 =?utf-8?B?N2MrcEQ0STJjaGQ5dU5JSHF1Sk5hSUYveTBtb1VtVU9KRTZIQzFua0pWeC90?=
 =?utf-8?B?U2syVitxVEE4WUFUOHlybzhWTkRiWHhVZU5PUm02ZlZiS3hiaml6VXAwamd0?=
 =?utf-8?B?NGlra2tEYStoaUxUWUpWSGFUaks2cHZTVVZJcXlxUFljMy9CdnNjNlFCVU5O?=
 =?utf-8?B?L1NWSVF3b1pycWl1VVlYUytlU2Mydmt1OEhKWmFONWlLMjhta0xpa0t6STRI?=
 =?utf-8?B?RlNzMlU2N1owSnRpTTJQaVQyUm1pL0RqUDhqN0xQdFJlY0xFTXBZekhwR09h?=
 =?utf-8?Q?LwhDYGRZDFS7AYrw85bxHHCrbD8uSOK9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjhDUzBNQWF1RUFndUpSZnJIQ0tQV2RPZTFGb0Q0YzJHeXNyQ1NQbjFoSEww?=
 =?utf-8?B?dVg2b09TL0t1MVgyMzUzMDBLVjU3ejJHUm9zOHZhVlpkOGFmVVFEQThtM1p6?=
 =?utf-8?B?bm1pcHRkVEc2b2FFTUpTMkZYVVhEay9IbG5FYmhHeFBRbWpUeUMvN3BoZEhL?=
 =?utf-8?B?VHdLazFNU01GTlo3NjdQTnN2ZUIzN1Y0MDgrWG90cWlIQ04rRzhmQTFYK1c3?=
 =?utf-8?B?RlhLTnNoR0pBWFBWbTJUcEU5VkcwcEtQeHJiZjlKNWQ2ZVNTWFZiQnB5OWJR?=
 =?utf-8?B?THBoQkdtWlZidUh4OUVETDdhZGkxOXJRSEpTbTEyU3FiWE9rc1RuN05wbFlo?=
 =?utf-8?B?c1NuanBqcHFqUWJ1bTBWSlJZZjNqRXppZ2xwQzNIUmFZMk5rbkJLUk9lWmUz?=
 =?utf-8?B?cGxqd0VpSWxNMVBUeXY0NWxLUkZrZzZaNGE2MDdWSmRrTHpENDNNVGpSWFRy?=
 =?utf-8?B?VjhRQTh4UEd6bGpQRGZUeUpFQlBWL0xJa1RYdkhJejI3WE91ZWZ2R0E2MUpl?=
 =?utf-8?B?QnowZVh2NWhiK09MN2tUTGNkN0lQTENIbGdDcmxFcjFvanBNeXB0YTFwd21y?=
 =?utf-8?B?OWdNUnRVd0NyNERTaWIvS2k2RGhjUVN1b0lGRjJBTHl3UW9lSEdMMkRjSWIv?=
 =?utf-8?B?MWpjOCtYN21Eb2pGU3FyeHBmU2xmYW9HVm55WFNpTW1LTWNLcnFHcXRqZ0tR?=
 =?utf-8?B?V3FxbERUNC9oU21oNTVZaDJiL2pqVlRPMWwreWFkbmEzc3F3MHg3dC9CVmZM?=
 =?utf-8?B?dkFXOTFxVVFYZHdoSHAwNGZ2ZURtZ2tGdkRETzVKcVlNUWVZWHI5RGJUdmF2?=
 =?utf-8?B?VFViZi9HNUQzclRHZFhQb0w4bFA3MWZ0dmNKd0xjOGhVdTMweU9DZExhQytI?=
 =?utf-8?B?d3lTd1FIajNiVFpxRTB4UUNPN0JWMHlzUnZhQUU0UTM5RHFBRXhQTWNBekVi?=
 =?utf-8?B?bTBtbTFYT0lNZGxaRXJlRGJNc1BUZjYwcldwdWVYVlcvSW5WQzg3SXRQWFVI?=
 =?utf-8?B?RUxieVhGY09uM3NVWGNQSklUZ05lVDZ6ODE1cFFEWElsb1pzOTVzR2g1NVdi?=
 =?utf-8?B?SWNWM3hhZ2s4OVR2MjRQek9xTXNIY2RyQjc5bmVtTnMvcSt5N25zaUMvREM1?=
 =?utf-8?B?Vy9QZ1ptYUxlRDloVUR6US9qc1Z6d1V0VTMzdmliNTh2TzZZTEpVNlhOZS82?=
 =?utf-8?B?K2Y5N0ZpckxvMlU2L0hpZ0M1RjdyclNUYVlaVFRpMGlVTGVBMXBjeHBUUVRJ?=
 =?utf-8?B?YzEyWDdmWFJZZ0R4SlhEVG9nWVo0OHoyR1ZoZ0ovWHVUUHkxK1FtVEJ2UGNS?=
 =?utf-8?B?ZURHdXU4MEFoNmpMM044MEIrVFRKdCtyVVQvQzY1eEtQTmhwV2FXcW5Udnd6?=
 =?utf-8?B?MUIycVVlVVByMDNzMHErTVBGczdoU0hBYXR1bVRyczdhS3ZZSXNHc1JRL3hl?=
 =?utf-8?B?MHcvbWU4WkhST1RRQ3A1WDE5OERWS2FzM3FhRTVvL0hQdnowVXc5TTRSeXQz?=
 =?utf-8?B?VnNpd3R2NnhjSjVLdmx4Z3dXUXgrRjhJa21IRWFjQWVtdjk0bHlsQmRkbmVV?=
 =?utf-8?B?ZGFzWW8wcllkZUdNWStMUHozakE2L0dyZDI3ZEg0aDVTaGdGcW1SdlNaelNj?=
 =?utf-8?B?SHkwK3UyZWpkbGxHbnNZb3lOYk9MTEV5Vmt5eVhLeG9uYjJ3bDFSSjNheGRO?=
 =?utf-8?B?NUxmR2xQeTFKZXp3NjYrYTMyaHMwWkdXdkVXSDMrYW5VOFZZbVdCUWRZaEkw?=
 =?utf-8?B?QnpXY1J2aGg0SmdSNXljV2ltS1QySC9tOHMyVy8zQ2g5TGJ4SzcyQUZhUHZl?=
 =?utf-8?B?U1dFcDBjN1N5RXR4ZjhFODg2SkVQUjRsaTJEZjk2Ly9XckpSVml3czJFaWdV?=
 =?utf-8?B?KzdJUGZkWnAwK0dtWXh1eGJlVGk1VW8ydHRmQVZ6Uzd4TTNNSTJ4VmEyTEN1?=
 =?utf-8?B?OTM0MGYxMjVJOFM4SFlzcHpHcXljblJ4dzVmMHgzMzlxMCtHN21SdlBaNTlw?=
 =?utf-8?B?OUdLenVOSHY3enEvbC9MREpIalpXaTFmbzRGZ2Q5TitRSjFMZFM3blBGOGRo?=
 =?utf-8?B?M3ROL3h2Y1Y3OUU1dXJTR213VzJJMExzamdnS1ZOT1dRZTdFVXhlZXMwblNJ?=
 =?utf-8?B?UnFvOTY2TEpQc2NqaDRNZktpbTgvdmRlNTR3dG1CVnR5NEtUcnhEcUVXdnJn?=
 =?utf-8?Q?32T/WPDErSOqEfyERJxZx5I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0411d2-5858-47ba-e146-08de3bb5fe33
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:43:17.5934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRSPLEgCIDBYyzt7IItEhuZBu0BWhR7xmc4uoJEEDu5to3GPZXrwQKiqjycopvEJdXZidjGJQUD5xMqqqGoqIZcNy6136VP5zXna7UnZepQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
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



On 12/12/2025 11:55 PM, Simon Ser wrote:
> On Friday, December 12th, 2025 at 18:47, Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com> wrote:
> 
>>>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>>>> + const struct intel_plane_state *plane_state)
>>>> +{
>>>> + struct intel_display *display = to_intel_display(plane_state);
>>>> + struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>>>> +
>>>> + if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>>>> + glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
>>>> ^^^^^^^^^^^^
>>>
>>> And this looks like a pretty major fail. Why is the 3D LUT stored in
>>> the plane state when it's a pipe level thing?
>>
>> With DISPLAY_VER(display) >= 35, 3DLUT can be attached to a plane.
>>
>> (Bits[23:22] in 3DLUT_CTL). This is the only way we are exposing the HW
>> to the userspace right now (through the new plane color pipeline uapi).
>> Therefore, it lies in the plane state.
>>
>> However, there are (soonish)plans to adopt the color pipeline for crtcs
>> too. Once that happens, it needs to be handled a bit more carefully. A
>> potential approach is to allow userspace to program the block with a
>> first come first served semantics and fail the commit if it tries to set
>> 3DLUT both on plane and crtc in the same commit.
> 
> The plane 3D LUT must only be used before blending. Any pipe-level
> post-blending 3D LUT hardware block is not suitable to implement plane
> colorops.

Same 3D LUT block is shared across pipe and planes. When we do end up 
implementing the pipe color pipeline we would like the 3DLUT exposed at 
the pipe stage too.

However, there is no good way to do it in the current color pipeline 
UAPI (atleast that I know of). One suggestion from Harry (discussed in 
the hackfest) was to list the pipelines in order of preference of the 
driver.

Considering we prefer the pre-blend 3DLUT over a post blend one, it 
would mean that we *don't* expose the 3DLUT on the first pipeline on the 
crtc but do it in the second one. (I am not sure how well it scales though)

I have considered other solutions like introducing a new property say 
"muxed" which could be used with Bypass to indicate if the current color 
block is being used in another part of the pipeline.

Suggestions are welcome.

==
Chaitanya

