Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A5A0A780
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 09:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A28010E2EF;
	Sun, 12 Jan 2025 08:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDOG7hpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB6D10E27C;
 Sun, 12 Jan 2025 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736668864; x=1768204864;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V0L61EGwZ3sLEK8Kmv9SxM/MeUuxPPCgScYJq+/vnK0=;
 b=gDOG7hptntuk7d88CR1HGI1+8JsfN54H//CYcA2UOdrRuEgJju2EdbN2
 GTiEjldeTouzGjeJ+x5FIBwBDPNDvFMdZy6um9okHtijSRIOmMGHM5dv4
 5OvQ8G2SfkzOQmedB3wfbUEv3xiKT0EhO2fx2FPjVldnKE1BmTaBNckpI
 QUr2I6OCWNQ0w2t7QIBELu4bG5uA7ajSRAjY9kLEJWzr6NyLcAj6+AkXO
 DCda7oRj9uocw+FB8h2hFDnmB5drUXSZ9PYwvSTbr/4gIX1GesHJ6PMhP
 H2fYPE4RUQEKEMA6EkVbe31E90niq3EFfaE21o6zhCIF5YCajZu7nDuCz Q==;
X-CSE-ConnectionGUID: tYwTYL6lRxuJmJO77pFeVw==
X-CSE-MsgGUID: nXW2AaoRQQWc8cadh0sLqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36814786"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="36814786"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 00:01:04 -0800
X-CSE-ConnectionGUID: 9mGy7PuYQZS712zNM1IEig==
X-CSE-MsgGUID: vjJWzx1eT0elY2itHloeDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="104701083"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2025 00:01:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 00:01:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 00:01:03 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 00:01:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLkKsPMweRt2SnGWUDCqq1e50o+jOAemSJX4lOdabpDxEnvQpcAU4DPhPsM7TEpq3aNysdo/0aPwFN3vP+7RCJAn7on0LX194VyNNkHKl9OOGL1AMfMXWIJqni9M0UrNP1ZjRzo2HkoqD6a9uVrQd1MZ7nDpORBKKIuOV3y7cadYoePhOf5WVgyqBqUg8phl1MyHvMV54lbGnnfHN3eVeJtDkCmVGJXU+YJR9aaxZPxJoiYuFT01IYvuH/e63o7uFaeTd9M/DvLfOVIsmvZ0fIbaCOTPjY4JTfc1P/MAn8XQyNwsoEHpy3/kXwHlDGrZn32hOWL3DiHydMT98AIlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0L61EGwZ3sLEK8Kmv9SxM/MeUuxPPCgScYJq+/vnK0=;
 b=S9B0tl85Uxbgbt3Yb9BQdDQAD1+u83BbN9EdozTQZYTKmSnWBjsbKSztHtccp/+8xWyJlqm8gFEXqvVs/hDc5UMs4MdaxJti+U47EkCh0sqZHa/GJ3Ud+qntGeypcsJz10eImLsvcY4vMqRb/FU0rO6RnFUKxlqK8BYv4zhj+9EJs2h8jdfQYmr1LlGMdDBzG84BQEcJlBpuz/CURKGHhqNQVXjQFdVfbUEbPgjZw/MpoauZ1a1E664QOSV/mIHhdy4C2x5opxUMhM9rb/Cjdx6J0nUgh5kUsI7RFhLkwp17Sa/u9o6eS4DTviKzXCHTu4EcV5aVWJ47/fOzxq69+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Sun, 12 Jan
 2025 08:00:19 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.8335.015; Sun, 12 Jan 2025
 08:00:19 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbYZGzWpcbHJL1pUi0hPF0y6Z5nbMSs/1A
Date: Sun, 12 Jan 2025 08:00:19 +0000
Message-ID: <SJ1PR11MB6129D345A6E295DF51F48643B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-2-f4399635eec9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7521:EE_
x-ms-office365-filtering-correlation-id: 36e78aa7-7f92-4764-0db0-08dd32df28bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cG5DaHV5RndsN3M4M0tyeGFzNW84SXpneUlWcklkTXBsdnhueHJ6Z3MvREQw?=
 =?utf-8?B?M2VVd0Z1b1MxbVpXcDRwVDNNWGZSbkt6eStlREpBbThlTExvdGFkam9TSGxR?=
 =?utf-8?B?NDhudzJhdkpUc0pNcDBGRzBFUlVydktPZEFRN28vZ1o3TExxSWxYa3FzbEYx?=
 =?utf-8?B?VWVNS1BPTDVvaFRMdG83WUF2ZUlaQ1VaU20yYW9IUGNXbjZibjlRclJoQlRk?=
 =?utf-8?B?b0tSQ1paZXBFN3BvWHVVN1Zta21JdE5TOUFGTmtDbklvaWdUS1B2RGpZa0NU?=
 =?utf-8?B?OGxJMVAvVEJlZUNKM1FFOXNsMHR6anFGUTlBVUFxM2swWU45Ni9STTgxUE9F?=
 =?utf-8?B?c2pCQnd4WXIzREJnTHI0STFsQWlqcHZWeTNia0g1aHpRa3h5emVkT09QU0c5?=
 =?utf-8?B?NVlKUnE1SkNxWHhkRHlvZlNCVlNIQ0UwMnZnYkJjaWV4ZHozQk40SkNIMGZZ?=
 =?utf-8?B?NUdsbmJzTDllNldrRE5xRXk2QklkTUtxSHF5dWZVV3lhajJTcmFZRlBJeUNI?=
 =?utf-8?B?Z0M4cFgxTXpHK1lQNXpMZjZSSkd1dkpCZmhTWVNEVkRHdHlHaUFOemFVVnJB?=
 =?utf-8?B?cjlYSXFLK2d2Y3lTbWJwRnVJcUpYQi94K2wxY3IySjlTdnk3SHR2ZW53eW1O?=
 =?utf-8?B?clVYYVZpRXB6L3dxNUFEa3ZBZ0VzSWlRcnVFd2FWMi9xUG1YM2dva3hrMzdJ?=
 =?utf-8?B?M2MyaHNsVW1CZWdxbEtuSVRKbm1kaVk2RXJ6WEo5d28yTnQ3RVBMMXZ5SkFI?=
 =?utf-8?B?UFE2MWZzYk9Yc2IxcmhVbFBSWTRxZExEN2I5NFhWQ0RwakVXMm9KT2pSNTZz?=
 =?utf-8?B?ekl3dXBza0E2OFdnLys5YkFBVzJwZm1yYU5vVXJwaWtnSEk0UUVLRktSUWg3?=
 =?utf-8?B?QmthSTdUQWcyck55MTFZbXYzd1B1U2lHRHE1V3NnZElLQk9PdTE1ZExDTURI?=
 =?utf-8?B?dmsrQVVyQkRRK3lDNUtmM0RMQTAzVGpPOXFsaDBycmxzNXdWSXBkWDZSeEZZ?=
 =?utf-8?B?bFNWWTdUUFpiM3RZL3J5dTNKZmU2NXpFSVRDNTJsaGpPcW5tQTZxbGtaMUlm?=
 =?utf-8?B?M2xYanViVndkVTA5NzljMHdtMHpueXQycUFGOTVyNnJCZzN5RE5rMTVyWm1W?=
 =?utf-8?B?QlhWbUd2VWVHTm1obDlTNjF6QVNMdnRyd0FybDRzZW5nV1RkRjBMUWh5Q09L?=
 =?utf-8?B?a1BKSDFiU25pcEpnT3RWYmNyR0d6ajhVNWJNdU9xSXczcEJ3ellKdGRWQzFB?=
 =?utf-8?B?TUt3dk5aeFlIVTRacVNES0xKVkl1dmdWNFVLRmJoclF6RXlndFMzV2RwR0pT?=
 =?utf-8?B?Z1dycG1LaTB2VUpicU1STFRRcWJ3M3FSYkF5Q2lXekd4cjh6ajI5SGl3VUZ2?=
 =?utf-8?B?M2t1c2ZyaURsQ1lMMDdUN2FHOUdacWdoNjIxa0xYUlZzdXBXdXM1c1IxZnpZ?=
 =?utf-8?B?Ulpyc2ZXVDE5OEIyeVFxVy84Vm9LY1VhR3FHSk53YXJCbEtSQXdFaEF1TGhr?=
 =?utf-8?B?YU5SUDN5c0JVN1dHZkt6RjJ6NmNnUXV3WXc3UlhvcFV4cUFsSU9WR1MwRFJF?=
 =?utf-8?B?ZnhqdXUvUGxobTVJR0I3Tmk0K3RCNzdzUUxTM2h0V1BnRVB3bXZmZ0FIeW00?=
 =?utf-8?B?REREcE5Kb1ZCR0FUdGE2OXdOcmo5Si91TmVCcWprSy84V1RtUzJpN0xMOFZv?=
 =?utf-8?B?NkJPYitxNzM5NDR2TCt0Y1A0Qk5aNnZDa2pNSnJPcDBIbmRFcjc5akxWdEFt?=
 =?utf-8?B?M1R6UmFVYUIvei9ibUlVODlBOEN6Yy9XQ3BDZC9TV3FyS29PMkFrSlVIem4w?=
 =?utf-8?B?NmJqL0Z3OGpmTU5NZHhLSG0rODJYUTFZaHVFS2RDTTcwQ3lLTm5OZi91SStx?=
 =?utf-8?B?NHU1Q3JOdzR3N2twUHhPa3VRaWVCUFpVNmFGTGFNNldQc2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2J3NnM2djlpeDZUTjRjN2RuMkdvWDBRU0FrL1hnRkl0UDBzeldBb3dtSEha?=
 =?utf-8?B?MktEL2JEYlljQ1pxK2ZwcGFVejJmcVh3TDZyY0tTSUIzM3d0RUxnYkl3Zkd2?=
 =?utf-8?B?aXUrL1ovMmlXVnR4c3lIKzNNTVN6V1ltdW50WVY1bFkxWFZTMVM0dll6OU1l?=
 =?utf-8?B?d3BJdWRPanZlUDZ2S2lMdU9iUnAxVHlUTjB3bjg1OG0ya2hORlBPYVh4N01h?=
 =?utf-8?B?L3RaNm9RWStzdzJ3VUJ5RTRKT0dzbDUwY1UvMHUvbWNWSldTTFpNVE54MVJV?=
 =?utf-8?B?M1VBV2E5Z2tVZmM4M05XSDFmWEFKb0E4MzRscGlBdXkweDJBWitySExWQzYx?=
 =?utf-8?B?MEpFUEhFaGtTalluTzdWSUgxbHA1dWVWV2MyYkY5REhycWo1R1o5RVBqQ2sr?=
 =?utf-8?B?YmhoNVpoRWl0WkpneFh3YlRCNjNaTVppL045NVhzVFZtL05MdllMWG9wOE5u?=
 =?utf-8?B?TGVtUG1YazFIQ3k1VytIaDhGTnBMWU42K0VhYVRsdDlBa3YyTXpqKy9JUkZw?=
 =?utf-8?B?OTFHWGRqbHJTNzVvR21QREZNQ2NuZXh0UnhBVmNINWdTN1FQM1BYRXBMZWM4?=
 =?utf-8?B?YkFMTFNURTFKZGdCMVI2ZUViOXJqMk9WU0tjczVMbnR1Y1djeDRTT2JaY3hT?=
 =?utf-8?B?eHdWSVBqWml3NHZidmVCTmFPNUYxMHJFdXVTUHJvN0hsM2Vibjh2VFdtTm8v?=
 =?utf-8?B?a1BsTjlFdjVSd1dyK0Y2REoyT2M4VGFiQW5qMzVreldwdGxRaWc5R2c3QlNm?=
 =?utf-8?B?dFgzdlJjdkhaeXpGcnlKbmZhazk1b0xoZU5HVXhPTjNUQ3RieEZOam1PZmY1?=
 =?utf-8?B?MVlpY3ZyV1VkZkdncXR4VUxjNWh1SldValI5WHRvcWFRSmI0UVJVdjdRVEtK?=
 =?utf-8?B?TDJhNDJOOVRTQ0taakNMbnRhY1BOZUJONHE2OS9BSzFtWGM0U2Rjc3JwNUNR?=
 =?utf-8?B?UjVMZDBKdHRwR3VSNUpuY05GaTdVU3oyMnV4T3cybS90aTBDOWpjUENmdk1w?=
 =?utf-8?B?V2E4SzlEN1BHZVNEa3BleTFZMXkrODRvTFRjUDhkejlVbk1FYWpkQ2hZN09w?=
 =?utf-8?B?QVE0cVBNQktZZldYbVZ0TTZ6WFZDdXNRWDgwVHlvMlZpTTR1TkE0eEk0WXJP?=
 =?utf-8?B?blhrYVlMeHkrYXVlSFh0SGpoWkdXRTVuTUp4UGhFUUZQS3dHNkJhVXhmMzBl?=
 =?utf-8?B?Zlg2dnZ4NExlQXRweXZteDYwa2d5aXU2ZThQSWJma1R2VmlZNUdmdk0xWVkr?=
 =?utf-8?B?NXBtQjFWZGxKZExFS2twUzhmTnUrQ1I4ellvbXNSUm50dW4yRDRqTEJOSjQ0?=
 =?utf-8?B?eXF2WFVPYklNZnNaMGczaW5Lb3BxN1k0TnNJWDVmaVl2YkJOT3BvYWQvbnpL?=
 =?utf-8?B?QnQzWGdzNTNsWEhVWlNIZ1ppYUdqRDkxWmQra0xQRmFxa0V2dUU3L3J3Uytp?=
 =?utf-8?B?eUszRGo3c0lKcklsbjNheFVoQ21sUDlOTDRDcWVsUDBGeXpnME1wSWxrSStq?=
 =?utf-8?B?cUI0VnhiRnRwb3dkYkFlakVjSmRoVVZZQjY1ZXZpYTdSK0NOSUZxTmc2dHRv?=
 =?utf-8?B?T3hNRDNkZmNNdnpPK3dsWlZDTEJGVFFhanhmenlFbmNhQUtpUUFyQlVxUGJZ?=
 =?utf-8?B?cjA3U0VnWEkvdnh0TFlZa1FBWmpCV3B3ZERnYnN2YzlMNUZrTy9ncTJuRE0y?=
 =?utf-8?B?elB2R3dTR2U2UjBtTUVOMDMwd0ZmM1BJNnNmM2NDOURhcjhoekN2NjRlVTgv?=
 =?utf-8?B?ejZIcHJwMXFNcTA4WmhHYmxHL3l3QVg4WE1sTm85cFhURzVtVlZsQkt0ditk?=
 =?utf-8?B?Y2tOSjArTHJnRi9Qd1hYeTFzWW4yUGcvdEowOE5ockR5SXVHajlPRzlVRzNs?=
 =?utf-8?B?ZU40VG9ZSHp0ZWpsQitBdkpuMllUbnd5WWlUdzRKamp2ZGlzQnhtTWxjcnRS?=
 =?utf-8?B?NUN0M0gxR2dGK1hIM1dLeDJPZURhZWRDYXQ5KzRSNUhLMzgwdkRNRUVCV09B?=
 =?utf-8?B?NzVIWHBVYnpzUVNLR0JXRDV3a2JOS0E0ckJyalFHTmI1RnpoTGJYNXYxZUhV?=
 =?utf-8?B?MjdlRnlVUEkrdHJFNGNQQ1phY1l1VUUxL2FabWFQQk5LZ3kzUE5HZkJaZmZP?=
 =?utf-8?B?aXR0ZngrR2daK0I5L1RjcU8zODRUcTFqUnN6TzNtZkVSR3A5Zy8xR2wzVW5z?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e78aa7-7f92-4764-0db0-08dd32df28bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 08:00:19.8520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUY9bcQIP/twZguGclex8juZg1jZ61k3ukK20h3SfCaarg0kOZudkf3OmY1z/emrW3+7apN7CmQepxDS8jNk1SwltixVcAvFpLwAWjHvJOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBcnVuDQo+
IFIgTXVydGh5DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA4LCAyMDI1IDExOjA5IEFNDQo+
IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBN
dXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2MyAyLzVdIGRybS9wbGFuZTogRXhwb3NlIGZ1bmN0aW9uIHRvIGNyZWF0ZSBmb3JtYXQvbW9k
aWZpZXINCj4gYmxvYg0KPiANCj4gRXhwb3NlIGRybSBwbGFuZSBmdW5jdGlvbiB0byBjcmVhdGUg
Zm9ybWF0cy9tb2RpZmllcnMgYmxvYi4gVGhpcyBmdW5jdGlvbg0KPiBjYW4gYmUgdXNlZCB0byBl
eHBvc2UgbGlzdCBvZiBzdXBwb3J0ZWQgZm9ybWF0cy9tb2RpZmllcnMgZm9yIHN5bmMvYXN5bmMN
Cj4gZmxpcHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVy
dGh5QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgfCA0
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+IC0tLS0tLS0NCj4gIGlu
Y2x1ZGUvZHJtL2RybV9wbGFuZS5oICAgICB8ICA0ICsrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MzMgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+
IGluZGV4DQo+IDQxNjgxOGU1NGNjZmZjZjNkM2FhZGEyNzIzZTk2Y2U4Y2NmMWRkOTcuLjRmMzVl
ZWMyYjc3NzBmY2M5MGMzZTA3YTkwDQo+IDY4YjMxYzA1NjNhNGMwIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9w
bGFuZS5jDQo+IEBAIC0xOTEsNyArMTkxLDEwIEBAIG1vZGlmaWVyc19wdHIoc3RydWN0IGRybV9m
b3JtYXRfbW9kaWZpZXJfYmxvYg0KPiAqYmxvYikNCj4gIAlyZXR1cm4gKHN0cnVjdCBkcm1fZm9y
bWF0X21vZGlmaWVyICopKCgoY2hhciAqKWJsb2IpICsgYmxvYi0NCj4gPm1vZGlmaWVyc19vZmZz
ZXQpOyAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUNCj4gKnBsYW5lKQ0KPiAraW50IGRybV9w
bGFuZV9jcmVhdGVfZm9ybWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gKwkJCQkg
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUsIHU2NCAqbW9kaWZpZXJzLA0KPiArCQkJCSB1bnNpZ25l
ZCBpbnQgbW9kaWZpZXJfY291bnQsIHUzMiAqZm9ybWF0cywNCj4gKwkJCQkgdW5zaWduZWQgaW50
IGZvcm1hdF9jb3VudCwgYm9vbCBpc19hc3luYykNCg0KV2UgY2FuIHJldGFpbiB0aGUgb3JpZ2lu
YWwgYXJndW1lbnRzIChkZXYsIHBsYW5lKSBoZXJlLiBBcyBJIHVuZGVyc3RhbmQsIHBsYW5lLT5m
b3JtYXRzW10gYW5kIHBsYW5lLT5tb2RpZmllcnNbXSBhcmUgcG9wdWxhdGVkIHdpdGggYWxsIHRo
ZSBmb3JtYXRzIGFuZCBtb2RpZmllcnMgc3VwcG9ydGVkIGJ5IHRoZSBwbGF0Zm9ybSwgcmVzcGVj
dGl2ZWx5Lg0KDQpUaGUgZ29hbCBpcyB0byBlc3RhYmxpc2ggYSBtYXBwaW5nIGJldHdlZW4gdGhl
IHR3byB1c2luZyB0aGUgY2FsbGJhY2tzIGZvcm1hdF9tb2Rfc3VwcG9ydGVkKCkgb3IgZm9ybWF0
X21vZF9zdXBwb3J0ZWRfYXN5bmMoKS4NClNpbmNlIHRoZXNlIGFycmF5cyByZXByZXNlbnQgYSBz
dXBlcnNldCBvZiBhbGwgdGhlIGZvcm1hdHMgYW5kIG1vZGlmaWVycyB0aGUgcGxhdGZvcm0gc3Vw
cG9ydHMsIHdlIGhhdmUgc3VmZmljaWVudCBpbmZvcm1hdGlvbiB3aXRoaW4gZHJtX3BsYW5lIHRv
IGRlY2lkZSBob3cgdG8gcGFpciB0aGVtIGhlcmUuDQoNCj4gIHsNCj4gIAljb25zdCBzdHJ1Y3Qg
ZHJtX21vZGVfY29uZmlnICpjb25maWcgPSAmZGV2LT5tb2RlX2NvbmZpZzsNCj4gIAlzdHJ1Y3Qg
ZHJtX3Byb3BlcnR5X2Jsb2IgKmJsb2I7DQo+IEBAIC0yMDAsMTQgKzIwMywxNCBAQCBzdGF0aWMg
aW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJtX2RldmljZQ0KPiAqZGV2LCBzdHJ1
Y3QgZHJtX3BsYW5lICpwbGFuZQ0KPiAgCXN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVyX2Jsb2Ig
KmJsb2JfZGF0YTsNCj4gIAl1bnNpZ25lZCBpbnQgaSwgajsNCj4gDQo+IC0JZm9ybWF0c19zaXpl
ID0gc2l6ZW9mKF9fdTMyKSAqIHBsYW5lLT5mb3JtYXRfY291bnQ7DQo+ICsJZm9ybWF0c19zaXpl
ID0gc2l6ZW9mKF9fdTMyKSAqIGZvcm1hdF9jb3VudDsNCj4gIAlpZiAoV0FSTl9PTighZm9ybWF0
c19zaXplKSkgew0KPiAgCQkvKiAwIGZvcm1hdHMgYXJlIG5ldmVyIGV4cGVjdGVkICovDQo+ICAJ
CXJldHVybiAwOw0KPiAgCX0NCj4gDQo+ICAJbW9kaWZpZXJzX3NpemUgPQ0KPiAtCQlzaXplb2Yo
c3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIpICogcGxhbmUtPm1vZGlmaWVyX2NvdW50Ow0KPiAr
CQlzaXplb2Yoc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIpICogbW9kaWZpZXJfY291bnQ7DQo+
IA0KPiAgCWJsb2Jfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmllcl9ibG9i
KTsNCj4gIAkvKiBNb2RpZmllcnMgb2Zmc2V0IGlzIGEgcG9pbnRlciB0byBhIHN0cnVjdCB3aXRo
IGEgNjQgYml0IGZpZWxkIHNvIGl0IEBAIC0NCj4gMjIzLDM3ICsyMjYsNDUgQEAgc3RhdGljIGlu
dCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUNCj4gDQo+ICAJYmxvYl9kYXRhID0gYmxvYi0+ZGF0YTsNCj4gIAli
bG9iX2RhdGEtPnZlcnNpb24gPSBGT1JNQVRfQkxPQl9DVVJSRU5UOw0KPiAtCWJsb2JfZGF0YS0+
Y291bnRfZm9ybWF0cyA9IHBsYW5lLT5mb3JtYXRfY291bnQ7DQo+ICsJYmxvYl9kYXRhLT5jb3Vu
dF9mb3JtYXRzID0gZm9ybWF0X2NvdW50Ow0KPiAgCWJsb2JfZGF0YS0+Zm9ybWF0c19vZmZzZXQg
PSBzaXplb2Yoc3RydWN0DQo+IGRybV9mb3JtYXRfbW9kaWZpZXJfYmxvYik7DQo+IC0JYmxvYl9k
YXRhLT5jb3VudF9tb2RpZmllcnMgPSBwbGFuZS0+bW9kaWZpZXJfY291bnQ7DQo+ICsJYmxvYl9k
YXRhLT5jb3VudF9tb2RpZmllcnMgPSBtb2RpZmllcl9jb3VudDsNCj4gDQo+ICAJYmxvYl9kYXRh
LT5tb2RpZmllcnNfb2Zmc2V0ID0NCj4gIAkJQUxJR04oYmxvYl9kYXRhLT5mb3JtYXRzX29mZnNl
dCArIGZvcm1hdHNfc2l6ZSwgOCk7DQo+IA0KPiAtCW1lbWNweShmb3JtYXRzX3B0cihibG9iX2Rh
dGEpLCBwbGFuZS0+Zm9ybWF0X3R5cGVzLA0KPiBmb3JtYXRzX3NpemUpOw0KPiArCW1lbWNweShm
b3JtYXRzX3B0cihibG9iX2RhdGEpLCBmb3JtYXRzLCBmb3JtYXRzX3NpemUpOw0KPiANCj4gIAlt
b2QgPSBtb2RpZmllcnNfcHRyKGJsb2JfZGF0YSk7DQo+IC0JZm9yIChpID0gMDsgaSA8IHBsYW5l
LT5tb2RpZmllcl9jb3VudDsgaSsrKSB7DQo+IC0JCWZvciAoaiA9IDA7IGogPCBwbGFuZS0+Zm9y
bWF0X2NvdW50OyBqKyspIHsNCj4gLQkJCWlmICghcGxhbmUtPmZ1bmNzLT5mb3JtYXRfbW9kX3N1
cHBvcnRlZCB8fA0KPiArCWZvciAoaSA9IDA7IGkgPCBtb2RpZmllcl9jb3VudDsgaSsrKSB7DQo+
ICsJCWZvciAoaiA9IDA7IGogPCBmb3JtYXRfY291bnQ7IGorKykgew0KPiArCQkJaWYgKGlzX2Fz
eW5jIHx8DQoNClRoaXMgcGF0Y2ggbG9va3MgaW5jb21wbGV0ZSBiZWNhdXNlIHRoZSBpbXBsZW1l
bnRhdGlvbiBmb3IgYXN5bmMgaXMgc3BsaXQgYmV0d2VlbiB0aGlzIGFuZCBbMV0uIEl0IG1pZ2h0
IGJlIGEgZ29vZCBpZGVhIHRvIGhhdmUgYm90aCB0aGUgcGF0Y2ggc3F1YXNoZWQuDQoNCg0KWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82MzEyNjEvP3Nlcmllcz0x
NDA5MzUmcmV2PTINCg0KUmVnYXJkcw0KDQpDaGFpdGFueWENCg0KPiArCQkJICAgICFwbGFuZS0+
ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkIHx8DQo+ICAJCQkgICAgcGxhbmUtPmZ1bmNzLT5m
b3JtYXRfbW9kX3N1cHBvcnRlZChwbGFuZSwNCj4gLQkJCQkJCQkgICAgICAgcGxhbmUtDQo+ID5m
b3JtYXRfdHlwZXNbal0sDQo+IC0JCQkJCQkJICAgICAgIHBsYW5lLQ0KPiA+bW9kaWZpZXJzW2ld
KSkgew0KPiArCQkJCQkJCSAgICAgICBmb3JtYXRzW2pdLA0KPiArCQkJCQkJCSAgICAgICBtb2Rp
ZmllcnNbaV0pKSB7DQo+ICAJCQkJbW9kLT5mb3JtYXRzIHw9IDFVTEwgPDwgajsNCj4gIAkJCX0N
Cj4gIAkJfQ0KPiANCj4gLQkJbW9kLT5tb2RpZmllciA9IHBsYW5lLT5tb2RpZmllcnNbaV07DQo+
ICsJCW1vZC0+bW9kaWZpZXIgPSBtb2RpZmllcnNbaV07DQo+ICAJCW1vZC0+b2Zmc2V0ID0gMDsN
Cj4gIAkJbW9kLT5wYWQgPSAwOw0KPiAgCQltb2QrKzsNCj4gIAl9DQo+IA0KPiAtCWRybV9vYmpl
Y3RfYXR0YWNoX3Byb3BlcnR5KCZwbGFuZS0+YmFzZSwgY29uZmlnLQ0KPiA+bW9kaWZpZXJzX3By
b3BlcnR5LA0KPiAtCQkJCSAgIGJsb2ItPmJhc2UuaWQpOw0KPiArCWlmIChpc19hc3luYykNCj4g
KwkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnBsYW5lLT5iYXNlLA0KPiArCQkJCQkgICBj
b25maWctPmFzeW5jX21vZGlmaWVyc19wcm9wZXJ0eSwNCj4gKwkJCQkJICAgYmxvYi0+YmFzZS5p
ZCk7DQo+ICsJZWxzZQ0KPiArCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJh
c2UsDQo+ICsJCQkJCSAgIGNvbmZpZy0+bW9kaWZpZXJzX3Byb3BlcnR5LA0KPiArCQkJCQkgICBi
bG9iLT5iYXNlLmlkKTsNCj4gDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICtFWFBPUlRfU1lNQk9M
KGRybV9wbGFuZV9jcmVhdGVfZm9ybWF0X2Jsb2IpOw0KPiANCj4gIC8qKg0KPiAgICogRE9DOiBo
b3RzcG90IHByb3BlcnRpZXMNCj4gQEAgLTQ3Niw3ICs0ODcsMTAgQEAgc3RhdGljIGludCBfX2Ry
bV91bml2ZXJzYWxfcGxhbmVfaW5pdChzdHJ1Y3QNCj4gZHJtX2RldmljZSAqZGV2LA0KPiAgCX0N
Cj4gDQo+ICAJaWYgKGZvcm1hdF9tb2RpZmllcl9jb3VudCkNCj4gLQkJY3JlYXRlX2luX2Zvcm1h
dF9ibG9iKGRldiwgcGxhbmUpOw0KPiArCQlkcm1fcGxhbmVfY3JlYXRlX2Zvcm1hdF9ibG9iKGRl
diwgcGxhbmUsIHBsYW5lLT5tb2RpZmllcnMsDQo+ICsJCQkJCSAgICAgZm9ybWF0X21vZGlmaWVy
X2NvdW50LA0KPiArCQkJCQkgICAgIHBsYW5lLT5mb3JtYXRfdHlwZXMsDQo+IGZvcm1hdF9jb3Vu
dCwNCj4gKwkJCQkJICAgICBmYWxzZSk7DQo+IA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmggYi9pbmNsdWRlL2RybS9kcm1fcGxhbmUu
aCBpbmRleA0KPiBlODc0OWU2ZmMzYmMwYWNmYzczYmJkODQwMWY4NWMzMTI2ZTg2NzU5Li5lYjg0
ODMwZmJiNzIzZTM5NDM2YmZiYWRmDQo+IDM2OTg5NGE1NjU3Y2Q0NSAxMDA2NDQNCj4gLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgN
Cj4gQEAgLTEwMDgsNSArMTAwOCw5IEBAIGludA0KPiBkcm1fcGxhbmVfY3JlYXRlX3NjYWxpbmdf
ZmlsdGVyX3Byb3BlcnR5KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCAgaW50DQo+IGRybV9wbGFu
ZV9hZGRfc2l6ZV9oaW50c19wcm9wZXJ0eShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gIAkJ
CQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX3NpemVfaGludCAqaGludHMsDQo+ICAJCQkJ
ICAgICAgaW50IG51bV9oaW50cyk7DQo+ICtpbnQgZHJtX3BsYW5lX2NyZWF0ZV9mb3JtYXRfYmxv
YihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiArCQkJCSBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSwgdTY0ICptb2RpZmllcnMsDQo+ICsJCQkJIHVuc2lnbmVkIGludCBtb2RpZmllcl9jb3VudCwg
dTMyICpmb3JtYXRzLA0KPiArCQkJCSB1bnNpZ25lZCBpbnQgZm9ybWF0X2NvdW50LCBib29sIGlz
X2FzeW5jKTsNCj4gDQo+ICAjZW5kaWYNCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
