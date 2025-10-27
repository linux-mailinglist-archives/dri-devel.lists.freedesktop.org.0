Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271EC0C81B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5375C10E40B;
	Mon, 27 Oct 2025 09:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnHdLpPx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3683C10E40A;
 Mon, 27 Oct 2025 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761555721; x=1793091721;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5c/sUxL7WJ7oM5DJ1C2Q+ntktdYJDVx97qvyq4qh5mM=;
 b=UnHdLpPxWel8MPft5jc8M3vvqJL6lZn03NB5N4OD+DZ0uhcjhkqQ3KoG
 MFMdvkVmwm/cH51YZPQoe/mtfg5vcrGy0Kik6wkTMeTSFgglXQO1sMUdD
 1aDlFChXxF9hXetsfwR4NswhFurdzWGEAux3Yo+o+ClhyoPobA7gxErn5
 bjk26pyy+EqWzB0yIlZIyQeDevAMe0TBH/6/BWzv9d6ck84M8dqusmVRp
 X65dMpYal+1/6Gg1Xvvdq+0KCP2X7R0hNoMDiy78BE9hUB7XKoVbVUaUh
 GT/OtFjiQVeaPviTfVg7+IdpSTlAaxweqWJDpzFaZIMpy1EdTb5Qov35Z Q==;
X-CSE-ConnectionGUID: 9dDte06fS1KMxSuBMeu/gg==
X-CSE-MsgGUID: 97IitTP4QSOR66WAIatNhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51206715"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="51206715"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 02:02:01 -0700
X-CSE-ConnectionGUID: +OQF0RdvRkCMreH9HufKoA==
X-CSE-MsgGUID: xmjtiEF9QjyWWSrv4XLCvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="215888134"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 02:02:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 02:02:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 02:02:00 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 02:02:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZxJNZZ/nKFT/r33dAII5q/jD1M0VEabh+lEHzyP12kMSfWPlq5o5VsJQOZZVk9QNNaMffTWOJHsGXEyPWHkdRPbWDCMP6tBPgDm1Dpw35krR9szzdTAKXBUDDOsvlDZ7HdOPkR8PZbGhbUhtopWSJ+ibhPzemJk7VFWY3lAaEUGkPjv8AY9Twdv0xl+H48eaWoCcCuye01wbcxWNU4/B1DY9v6lS5I9UqDBZaZzEoB1zENDMsCYF8RkzF9X+ExLtf6mzgIt+0XNTmiJWR1co76G5lmpmwp3UFWxWU2s+rqEVuTEjguli3pk6VPrBFivPu2jKwo9qn1byspVLTGnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfSnePq8knwHNXM1w5BcMrc2Y6I2+ST3TYEI1SYIUmo=;
 b=kQ+qS0tFe/tGFRlpHUW0wqhQONHJ2l6/bhj3CxWm8GYCiHhCMrMUJqmWu+92meGNFoFKwExIpdHxh+PpxT3YGOzfMeWwbCUDM6wbtBqzkPq8Uv927bzNK2vKF7F9fXtcZObx+6lYrr8T17lwYSKQ2h07OaR8BEzwcwrrHB/0MlAMcnXIkamdwlqu1Q/TAF0IeetjZKo/AYq1OnRSYZnlRWbZi3PGw+L6TqRLMB4cpZHTZvz+5d0YwOi8VfIx12mTgbz8YrZ6XqsrHQx3OUsp5ExUdkQcHJZny/Avneg0p6fT++fUTqkRG/iGV28fan+aXzzrvZXt6D+Ugq9KKo20Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 27 Oct
 2025 09:01:58 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 09:01:58 +0000
Date: Mon, 27 Oct 2025 09:01:45 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Defer signalling the request fence
Message-ID: <oflu2uwshjp75rphwmo3tvggjazkafz3rsacwiqmsyrm3x3x6q@pe6dawjfrs4d>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251024170313.135544-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251024170313.135544-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: TL2P290CA0025.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MN2PR11MB4728:EE_
X-MS-Office365-Filtering-Correlation-Id: d0343750-8517-4c43-c945-08de15377c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXFQMDlXS2tqT0ZPZFFTbmxBeWd6bzl3OHlKNzJibStKMDhTQ3NCQ1ZLWHln?=
 =?utf-8?B?dUxrVjdDbTFtQlEvVjdIWURTUytLbHRQNWh3NXdZejJXQVZyNkhVaTJXTHpG?=
 =?utf-8?B?WTNIaDJJQ08wcXFocTh4WmdNQTVoNDNzenlJd25xaGx0VXc1Rk0xanhOTXpz?=
 =?utf-8?B?d0NzcUt4UEwxRWFINFlVRlZDdi9ZeFdDSlpqMGY4RDJIZ0tUc1ZublZlWkRT?=
 =?utf-8?B?MkxjeHdrQVRKaEZSUkQyMHRuandtbnVwME5ETzZZakxXajJjYmhsMXNRaDBn?=
 =?utf-8?B?Rjd1YkVyT3JYSWtsNFNNblpDcFNOckxabURWL0VMZm1sSzAzcU1NMWtTS0Q0?=
 =?utf-8?B?dTdXSGZJVFBGdkdVdFZ2a3FZemVhUmpzTGR0RjJyM0tRWjVXTkRJNXFGaDJu?=
 =?utf-8?B?dURlVCtiOVY3RExaSEdadStRcE55S1E4QmtGeXNaRTNCUXNwTmhOMnNJLzgw?=
 =?utf-8?B?WVI3b3lrTnc4VU5vQys0bTdQWUlaU3dhVG9QWGZPb3dsL2FEUEVTYnIrYjBU?=
 =?utf-8?B?YTI5ZkJzMTUvLzRPanl5bGNzMHZPdU9wU0tTRURIcEQrRnV6UmtUUFhlZ3Zr?=
 =?utf-8?B?bGl2dmpNMnQ0Nk5hLzN4cTJQYXdnU29Wa3pXbmVZcDE1Y1RkczlDRmNndEZN?=
 =?utf-8?B?aEFIdFZiRE93TjUwekFTbmE4V3lNanA0TTR3KzJOZ2RlSTVxZENLTDhlUUpr?=
 =?utf-8?B?Mnp4ZHhLTWM3WE5BTjBSUzFuajA4YUlaT1dpWWVkaHBRN3hyUnp6NmFCUGVq?=
 =?utf-8?B?azgwWnVRZEZwQTIwdjZXWU5tb3kveFdhOUtZc3BqYkxBWURqbURKTHVRMEU4?=
 =?utf-8?B?SHdsdzF3SWwxL2U0RWU2SktkZThodnoxYW1IZjBwOEZjNGROUHdDZVNiaERM?=
 =?utf-8?B?S0tLUkJTRTVCdHcxaDg5V2J0U1F0NDlNR0JwS280UXEwd2krbUhjZmdDTWhx?=
 =?utf-8?B?SXpBeEhxMW5lNjh1eXhXNVp0ejFjRFBsdEZoRmp2NzdGL1ZhVUlTVGlpaWJj?=
 =?utf-8?B?cHRDMjcwZUM2ZXlPZUdrSC90Q1U1dnZKT1g0Z09UVEZRcmI1RzRLOTFQQjk4?=
 =?utf-8?B?dHA1aDBzZ1NsYkpXR2VmTVlKVjAzZGtyWnMvOEFvLzNTdlVFd1djMjdZZURP?=
 =?utf-8?B?eE13S1NKcURNR25TVDdvaldEU2dJWlJXbmVBN0lXZWhJL1dzZG00MjRiQlpN?=
 =?utf-8?B?TFNHeC9zcDNZVTFQd2dYeUVFUkVMVHhBdzhjdi9RNUh2ZDFtc1N3em9sYmJh?=
 =?utf-8?B?dVBrWHhpYTdtOVRtTnZwUVowT0tzWk9GOUFOcjllMlZLV3p6OSsrdlFoc1NN?=
 =?utf-8?B?Y0ZKK3RkNkc5Q2NOejcvNU93OW9uMEt1VmFQS3FodzBDa0ZWcW14UFdxMi9k?=
 =?utf-8?B?TXo3VWVPYmI3M2V1cmMvTktJY0IxSGdyeDFMNkxhOVRGcDlwcDViVzMwMTVy?=
 =?utf-8?B?ZE0rdjhKQnpKZ2VjOXJrbSt4ZXNNYW04NGxEa0EzR0U5dFVBMVZZWmF2SGVX?=
 =?utf-8?B?cFB2VzdISjNnSTJwTSs3V1BIZThVcFhqNm5HdjNDMzhvYTdZUGI4bmRNOFRT?=
 =?utf-8?B?dXdNcEZLeklXNkJJclZ2aU15RURKSjR4eE03VXpCb0xnY2E0R2xXcFpweGdi?=
 =?utf-8?B?cm0vVklVNVZBVzkyNDlxaWRSSXVudUdqVjN6VEI1QjMyemJINzdTUzNYKy9w?=
 =?utf-8?B?a2Q5RWtUVms2Sk44Umt3OTcyQkdHU0ZteTlRVTZmWDZVcExKZ3dMYkNHOFZt?=
 =?utf-8?B?ZDZOdXZYZVFUZDVrZGtXYWtacTN5SnBGcjg2amd5dmgrc2ovcGdFa3R5enNi?=
 =?utf-8?B?TU5MVHlBM3FzVmRqM01wWXJNK25CRHZrbXNJSlMvUWZYaCtlN3U0WXhiZ2ZE?=
 =?utf-8?B?OUg3ZDNiTUlWMjR4ODl3Ym9ZUkVlNUVUeC9JYXJVcnM1UHozUjhJZm5vdGJT?=
 =?utf-8?Q?yoGZpvDVSihisjE9nEN2WsnAptFeIhIo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGxIZ3lDaGR4Mi9NeVdRZ1VkUmZNZUphcUh0KytFditHamVvemUxMXVWTGdl?=
 =?utf-8?B?VnlscjhDa3hHalZ5RkdtNmRYZVpxNGU3MjZzc25MVzlubjVudmplL3VrZGJs?=
 =?utf-8?B?dUtJS0dOVitCdkQzS2xabUlJRnNxcDg0b0JlcnVHOHpjTXM0NjF4bjZTMGNG?=
 =?utf-8?B?eHZvcFpmQWUzQlZVbDBXUldZemNZMjg2RUozRzgzTlNOQ1VWUndkQi8yUXRp?=
 =?utf-8?B?aHFDUGZhL2xUZmRBRmhxK3VFTXowTEZYMjBTU1lqemtJTTl5VGZZUTBhVEIv?=
 =?utf-8?B?N090TWZlejJGTytqUEhIL1dXRE5nM1BsM3FaYmpUbHRCV0p5b015MnpJRW02?=
 =?utf-8?B?WU1aT3VmS0E4Q0lwQytzbnhvWHNMQU15U3d3cVZYU3Z4NnhmTDFrQVJnRTFM?=
 =?utf-8?B?bWp3SjM0UU92N3hwT2tTUUJQTnhzTDVVSzFzYURhQVA4Q2hEQUV2VTI5QlRQ?=
 =?utf-8?B?Z0Z0QktFWWUzSTU0Qjc1a0t5VzZJdUVhMzVqYnFxemkvc3J0NGhhYnkyQ09W?=
 =?utf-8?B?L2MrUTlKZXErSHA1ZEtHVkkyTU9mRytPb1hCWGxRMzliRm9Ub1ZQQ2FZQWxi?=
 =?utf-8?B?TXlvMGJiMlI1YWluckZUeGFkc1p4ODN3M013RW1hQlJsbjdZN1ZSZzQ0d3Zx?=
 =?utf-8?B?Zzhqb091bDA2WGFKUWlxZzlGV2c2bENnVDVra3VybHJDU2dCRG1oeUJ4QjJn?=
 =?utf-8?B?RExtNTRhbG90MU1mb1Y3aGZMbVFLdlZ2bEN3WnBjNUkrQW5TM2JQaWgvZmFw?=
 =?utf-8?B?ZDlGVkFLODduSk5UL09Ia0ZMR29mSmZEUW9wdXZnT0VrZng2TWh5a01ZbkVQ?=
 =?utf-8?B?VWg5UEF3OWhQTXN4VGloSGx1TXdJdVZwbXBxWFJWcnQ4YUQ2UjJpZ1JuR3Zp?=
 =?utf-8?B?bkQxQndoeXY3M0h3L1cxUnM1T0EzaG9PTUNKNXZZNkhEVnArbkF6MEcvQ2dq?=
 =?utf-8?B?SVJDL3pYTTdHVHZGSS9oQm1tdWkrTG1JNmh2V1hiWURod080MFJBekNhM3oz?=
 =?utf-8?B?bjlnOEdRcWtZRUFQUDZRVHNTWllBZG1zVWo3Y2NiVElJZXdaN2pEeW1oN1BM?=
 =?utf-8?B?YlhsNm5yYzl4THZjWi92NG5rakFMSnlQYmFYUzdtYnhrWmpKYmdpZ1BmcHJq?=
 =?utf-8?B?bXhTTjB2cHdJWUMza0NPVzhWblFiWUo4Zk5rR3V6WHE4REhwRnhrMWdqVUxJ?=
 =?utf-8?B?QU5TWEpsNVpKaUt1V29sVGhPbk5WQ0ZmQU4yVzR5U0Yyc0o3YmFMU0dKcHBG?=
 =?utf-8?B?TEpNak5vbS80dUJNc2JHRWdsbzZ6TVRoL0IzL1N1cjlGS2pTZHQ5TXJGVUZa?=
 =?utf-8?B?OXY3S0JIT1BFakNkM0Z0RVZDK0ZMbmpOdllvaXFWMlZlZ1RnNzg1SWM2a3Vm?=
 =?utf-8?B?Q3N1TG05MmV0WXlCYytpNUxETDU1ZndiNnlla3VtUFNrOHgrYWFib0VnM2dp?=
 =?utf-8?B?WDVYZE1IeVk0cUx3QUJWQUxHVmx0aEZWUi9vSEQ3TERwMWp6cUxpcjlHcTBN?=
 =?utf-8?B?ckdnN3ROMW9kZFNZUDlLTWdMRXVTVXFjdHBtdHRoV3NNWmF0Z3p3Y1VtdzB5?=
 =?utf-8?B?VUh2dENtYURxNlJ0VDhWVGYwaWlzbDhWUCtaN0dLcjk4TThDckQxcG95a1lK?=
 =?utf-8?B?WUZ2M3gxbFhpVnBvZHg3ckZUYnNQOGpPZXU2ckRNOHpBdVFvUlBsank3ZWhU?=
 =?utf-8?B?L0I2WmFQUnozZ3VlZXd3SURsUDVKcFl0SHBkK3Z0VTFyanpoTzNzRytnVkhL?=
 =?utf-8?B?VkllNG12Y2QrdGMra2R4UDBzRnZlYlBmU2VpOFZqV3BRQndhZ2lTaHptZU9V?=
 =?utf-8?B?cHFyWEduTGp1c2pXbHFjbjNxUFlaZXNIREZidVM1V01nQWdPZndiVCtDNjhu?=
 =?utf-8?B?SlNad3dORGYyN2ZENnRRMHp5NllVdlJRVHIzbHBxdDhqb1p0RU5Edm1FSTQ1?=
 =?utf-8?B?aVNRbk5lUzR3cTN0eUdTeG4xRDcwcmFPbnZsYnRqb1AvbGd0YkVXRkl2STVw?=
 =?utf-8?B?UjV1ZjBqS1dsRG1sR3lTb0VuYXAvaGQxRXQ1QzZJTi92bXJaZHlRelpsQ3E1?=
 =?utf-8?B?aENySVp0bjcxQzl4NzQxVWFXZk43L2t4cmExWU1GV2VoQmlsREhtbzFyb3l0?=
 =?utf-8?B?S2ZwN3d5OGNEekxWVHV1ZWRob0Q0L0xhaWJzdFJyVzdQYkZqT1ljNU1NN3VR?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0343750-8517-4c43-c945-08de15377c11
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 09:01:58.3220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZuWK9wPLQ+y3004zT4uVHGtK3tWF2gwOYE1fHMayjYm8IM1D25mwh+lWTACvy4v+G31wx2DOEeYZm/CCBlqshS5JOi0BwVmpoWVThYuqpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4728
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

Hi Krzysztof,

> The i915_active selftests operate on an active attached to a mock
Instead of "selftests", you could mention explicitly the two
selftests that depend on this call. It took me a second to
figure out that not all of the three live_active* tests suffer
from this race.

Apart from that, the change looks good:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> request. This request is created during the test, and a fence is
> attached to it for the test to control when the request is processed.
> However, because signalling the fence happens inside the same thread as
> the test, and before a call to __i915_active_wait(), a race condition is
> created where if the request is processed before the aforementioned
> call, the active callback will not be called.
> 
> Defer signalling the request's fence, so that the request completes only
> after the test's call to __i915_active_wait().
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---

-- 
Best Regards,
Krzysztof
