Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA795A37AE9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 06:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FDD10E152;
	Mon, 17 Feb 2025 05:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+H09CIq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34DF10E152;
 Mon, 17 Feb 2025 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739770175; x=1771306175;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y71QJ9ZYgXaKMB3fgU88iC+Tyqtgsi+vTQ5R8IqTKXE=;
 b=O+H09CIqrkGDnWo1X3bkA1c7opcl2yTwmn2dedXws2V+7ekmJYCmJAS+
 /iI9q+JnUKyheGHvZzFct4pCFTDMhtLFkZMrrQzR0hriHMWZPbbKARION
 lMdcGulcwkhR88rCO6GiPfz2xZLcP0NYQXgt+MN8JJFt+0bHmv2i70hvU
 dxNDkIKQsoIUKrsU7+C+ObjEzK6n+VxQs4s9BPDN/nx46yTAndhhoBHk/
 tBlDXcDZfL3DRwqo/CTXqva/CqMhQeVb22UxuzZmg0sMNje9elHBmlWn/
 D79b6jknsSszV+rAIOkL+m8QIjjG15mcCQnAfDTzNhM0heG0YB3AZqY7e Q==;
X-CSE-ConnectionGUID: hmBYnSlmQYO7ASnJaL7JVQ==
X-CSE-MsgGUID: uzVfnLpDQRSQQG0mH1+LKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40300442"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40300442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 21:29:34 -0800
X-CSE-ConnectionGUID: vvIHOjoVS+KNIlsYH9ELRg==
X-CSE-MsgGUID: 3FCxUoWyRBOKCk/Yrz+BPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114508201"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 21:29:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 16 Feb 2025 21:29:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 21:29:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 21:29:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y37mQ6ydSs8+lrJpZWC8+BJDmAV4g7S49hts4lDoAqa663k1r1Si48xlJ+TcuiS7KZKes7jx/CTJ+hizkpF/MaHX4uCWU+XS4Q56sRK8zcNoFt4wAr09vEvzhxvIfNmHqIQlHVjxIaM+iF1e9nhVkajkM/7KhX0Hi84KI91BNhRSrzzRyvKrfkBQBpxHdqkfnw/O2sO45uKwjhwOAa3AEMQqJ4/ATS9PgZLUD3J+H2yQmrlI/EN8Y7wsBcrLGmD6143gmlViji3FbMkjFLYt+MHEhdlfwyNevvzLuOgnAKDZCbGKwlviPwa1qBK1bGVUITjvcF2VQttL/AyTMUKY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y71QJ9ZYgXaKMB3fgU88iC+Tyqtgsi+vTQ5R8IqTKXE=;
 b=N5YQ049Bk4u5QZHh37iHn9533QmVAMzqyC40FSlz9mYRUPioD2Fzm/LKxvEy2Bii9lzNeDlm6pjL6y9LglZKe9YsGdQP4axoaaNF8Wi8upbyezAFQ+V1ZQmSJoVJj9iExj8doKG3euT7S/HquQi0eO55Dfg/4rdlOJwRgrR0kK6IM+wWngRyUtroLQjXQQuGSJ8qkqweeW+gHGr7qWESf9Ti07oP0nt6nwb7EHY0t/90qxP1QWMBzY1l/JAbvTgzIMJfiHpeQ8oLl7IKOkfLr2DcvpYh5hzm4Ulj+IGiGHx14Y4ZM9gLJKC3vzc6sRbdleAmZpf1DDfFV0Y/81ZQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB4933.namprd11.prod.outlook.com (2603:10b6:510:33::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 05:28:44 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 05:28:43 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v5 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
Thread-Topic: [PATCH v5 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
Thread-Index: AQHbfWvbSA1wbuLVO0alAEpHFhjFRbNK+74Q
Date: Mon, 17 Feb 2025 05:28:43 +0000
Message-ID: <SJ1PR11MB61297847E809ECB814011154B9FB2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250212-asyn-v5-0-dc182281dca3@intel.com>
 <20250212-asyn-v5-3-dc182281dca3@intel.com>
In-Reply-To: <20250212-asyn-v5-3-dc182281dca3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH0PR11MB4933:EE_
x-ms-office365-filtering-correlation-id: f9694c87-caeb-4921-2481-08dd4f13f1d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NHlUdjBkMEZDaVBlbHZYQkx6UDhvMWMwK3VFdGtzcyt3ekpFMnR4cURNTmc4?=
 =?utf-8?B?V1dRdUNSRzhJNUU4aDJwQXdXd3VoRzRsNnF2K3YzV3BHei9qVThTN2FGbGpW?=
 =?utf-8?B?TWN6cEhWK05tMTZVbEhmSXFsakZqQmhxR0Z1R3d1dGRDL2orYzNvT2YrTWQz?=
 =?utf-8?B?VFBxVzFsSEZ4Wms3a0pKb3J1N1UrWGFYKzZOZ1BDS2JoRW1aYlhpbmpPTC9O?=
 =?utf-8?B?VjBSUDBTQmQwM2RLYm5KMGhmalFiMS84NVdiSnBYemJMNGRmd0RHUXhXWnlR?=
 =?utf-8?B?dnVJc0s2dnZhNzRvNzAyOEk2djBZZkZQNXVQNUJvTGZmRDBZdG9nblJvQTM4?=
 =?utf-8?B?REl5aEdpcmFwQS96RU8waHgrSFpQajYyQ2QzUTNTeFFWMWpRTll6b0RoditM?=
 =?utf-8?B?QVI2RHRFZHpNMzRLR3laUHpDZHQ0cXljK2V1L0luZXREZHdnbkVyNUVvd1p6?=
 =?utf-8?B?QzBwL3JQbVQrYVBzU1dWVFFrcVp5T3lMTnJ4NkNtb3hjR2crYzhVL2FEdVFW?=
 =?utf-8?B?Nm9WVGJCWHVxbHJKVjZRZkFScGp4Tng2Y1RTZVdyWS9lNmlxVUZndzRWQ2RC?=
 =?utf-8?B?WTEyc0EyMTJMRzVvWTc5R0orM1JUTE5qMUlkV1A1aE44WnpIaFpBam1Bd1pi?=
 =?utf-8?B?NGgvNHhDM2hVR2tYa29SY1dILzBxK01vcTJ0UWg0VEhxcTh5MHd5aU5qa2lU?=
 =?utf-8?B?dTlYMWFXOGNFWHpFRmFqWlA4M3FRUnUvL3lYQ1ZFN1RKYkdJem42OUl0dmRl?=
 =?utf-8?B?MkpVYlphNGtLMUpxcENsNWhGNE1SR01Vb2hYd0dJNmxOKzFMM0EvalJjZFFa?=
 =?utf-8?B?SUE5Zkxvc3pYUGVvLzNnbnM1RVpTbVViK0JxT3dHWDdUeTBHOG5IanZtZE1Z?=
 =?utf-8?B?UnNwQXdyZVE2OEFscC9iNHBRRnROTktvZFhLd2I0amVIVS84RkdPODNuZ1I0?=
 =?utf-8?B?SER2VmtMWnhNMkpJOWVMdEU3a0pxK0NyUjdVSnJFMGkzd3lTUnJ2cXFnbGRt?=
 =?utf-8?B?alBWTlErRkFibWhEb0NseGZaMkdWRWIrWWJJeHljVkRpQ0JmN0ZZSGJoWDJE?=
 =?utf-8?B?Mmo0SmRMMkhjSm5GSnJFSHRSekV2VmVuYjhoazJIWmZyU1grbGI2aVdrYkcy?=
 =?utf-8?B?NVBJYVB6UjkvclBGSHVJL2d2U2xtTVlhN2lyRlcwY3U4L0dMb2UzQ3c1YkVw?=
 =?utf-8?B?TVh6cjQrcDcyUWxYTG90ekxWNko0UEZMVG5POTMxNzdlMzZmV0FFd0lvU2w1?=
 =?utf-8?B?RDl1eHJaTFJIYXF1bW1POXRsbjRmQ1Y0K0p6QWlxZWZ0Nm5HL3RvUlgzMGta?=
 =?utf-8?B?NTltdUZMY0tGRk4xeTZsZmE2d3dlMUxmOEdsUWpvTHhVdm4wTXlXMlFMNFE4?=
 =?utf-8?B?UWQzRUpBcWlmU2VvUTFJRnh1WnZaaU5VbFJKUStmYWxpR2VvNTdDbjc1UVJm?=
 =?utf-8?B?UjdZTVc3ZzVhZVZPajFWeStNUVpHTWxkY3NyMGNiMVU4V2FOSjN3a3BqTXJR?=
 =?utf-8?B?Z0VnT1RBK1FjQmRSa2NXQmU3L3pzMXZzTGJxUkhTdGxseWlmM1dndTc5ZzlV?=
 =?utf-8?B?SVZVSUc1VElwUzFkN0hoRi90bjZGcmFGZTBxL0w1aHJVRnFGVnAzdUswUUhT?=
 =?utf-8?B?cE82T29zNmYzSk9INVI4UEc4M3lqNUpRVFhqUjhiRjJJRFdybStTam16U1lL?=
 =?utf-8?B?TXcxcHZLQkJrK0RoRTFWbGluSytBbFNmSUJtUXVya2tERGZJSHpEQWdoVExG?=
 =?utf-8?B?RU9DM0Y2NklOcDVjeVQycUxUTnllc0M1QjVHN21Qa29FaU1KeDhENnlHbTdM?=
 =?utf-8?B?MnRucUlra2pSa1g5clNjakdYMHVXUWc0TWJtNU4vMGZjeUJNdmNweDByUnl4?=
 =?utf-8?B?M0tMam1PM25TMjZFUUpMK3J4UWdjTlgweDczMUdQQkxHU05WTUJXZ3FyN3dR?=
 =?utf-8?Q?fD6LhSyQKL9nQzpabijsNvrVxoxQXqca?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjFnRE8xTkJDeUdwd3ZNSW5TbnFPNWJWQzNodHJTbXB4aUxmV281TWx1RWR5?=
 =?utf-8?B?ZmxFMnNWVXBGMUhYZi9uVS9SdWlOek0yMjlRMkJReUJ4STlCOGVuY05EWGx2?=
 =?utf-8?B?WjVrSzhIS2NQYWFWdlNmbWRmbjYrMjZOT0ViOWNrbTkzclI2eWRubUhRRHFN?=
 =?utf-8?B?TEJadDJyTEZnUGVtUi9PSXBKc3lRSGJIU3dYYXpyZHhxWldsbHA0MWZnTXMx?=
 =?utf-8?B?UzhIeTR3NUFoUUpJVkhzZFhaY0lyMTUyWW1zWloxSlNTQWh3U2ozc08vSEo3?=
 =?utf-8?B?QUV2Nmg3YnBBcFI2ZXNGanJibGFxRXR0bi9IbTh1Y0lsVGVISDVLSTFUcFlI?=
 =?utf-8?B?SkNxa2xmbC9jdmdoOWVpTkE2YUx1L3hEdkcwLzhzOFNMMHFHMDJFVHBuZDBW?=
 =?utf-8?B?NVE5YTZBZVozaXNFYzVldE1BYytuQ2haNU5XL0Nxdi8wQzRaN1hEa1E2RHpS?=
 =?utf-8?B?c0RxczZGR1hxR1l0UkEydEREUWFiTnZTWHROQjFlcDhBVzFtRThHYVFDZy9u?=
 =?utf-8?B?Zlo5cDJKbzRNdjIyZUJ5Q3Nmdm92djV0RURDYzRWNkpUK2ZjbWpBcVQwNjYz?=
 =?utf-8?B?NWpDWFNVL2IxV09pTUdGMEZ6eTIyRC9yMTloamFQS29MVFRsdkdLeGtWRFp6?=
 =?utf-8?B?aWZ6SnI1cDlta3JTcjZTS3YyaitIeURiKzVPVng4MGZFWTNGcXFhbXIzNW5N?=
 =?utf-8?B?SVU1TDhaU1RUSUR4eWtpUlM2cWpnUm03Q01uckx5ZVpoZ2lvQW45OUpOc1JQ?=
 =?utf-8?B?YmhxUTlnWVphclo0elF5bWU1SzlkRi91VGwrSHUzRGdsKzl1WU4rRnFZd2JR?=
 =?utf-8?B?L2oySFZpMnI1Y3lIUjIxK3g2T2MvRG1oSTNZYjMvRE93eERwMGFETlRNL25L?=
 =?utf-8?B?R1hyUERpS3Uyb2x4Y21GUzBuaWdYUUlST3FrNGJDUzZpN2tucnNORG5pTTFq?=
 =?utf-8?B?UVBaRTI5OVlUOVhVRFZYMjgwU0lQTkVwSjRCUjMxQURyNnBCTlZ6T1NibnBG?=
 =?utf-8?B?RWNtd01PS1VrOXZ6MHBWbStTT2pNZ2FkRzh3ZVZhM2REYVN5dVlwRFVYa2ZV?=
 =?utf-8?B?L1d0L2FWQVYyUWsyMlV0MWV0WXlSVW9EYi91dnpVWXZ2a1Zkd0ZNdGZSdjN3?=
 =?utf-8?B?ajh2cUlTT1QvUVZpSjJLT1oxSi9HUTVuS3hkakVBMk9qVkFUbVgxNlZJTDY2?=
 =?utf-8?B?dFZUL3NSakM4NjZJZGVwV0FhWXdiUXM1eTh2TitRYVBHWENEaGJqZVErK21C?=
 =?utf-8?B?UEpwYkM5YTlkRThGYlNlZGcra1ZnUU8xNjBmdXhUNkRiNnhLcTluTXlZdTJB?=
 =?utf-8?B?all6bi9NR1UrS2I2TXdPdHVlQjhPRjRkWUk1V2VTWUxXNTVMdHF6MzBKU2tR?=
 =?utf-8?B?UTk1NDJENHRZdlRzaU9pUXU4REdPVGo0dW1Kb0NNa21ZczlISEJXS2ZHV1Fr?=
 =?utf-8?B?ajM5UWxkWUdabE1nZ2xIL0pkcmRtYWFONCtyZXprUFArZnRtZkhtdW02UjFV?=
 =?utf-8?B?aWx1L21IcE5UbU5lZkpwTkVhWVVmVUNhWHoyZWIwU3oxM1NsTGVER1R0VFRM?=
 =?utf-8?B?akJhd1ZpYW1rdlhNdXdPM1VIUjkxQ2prV2xYRzNMQlZYakV5dlpxcUJ6bHpW?=
 =?utf-8?B?d0VNSkhPVjdlMktmZ2xnOE1EYXBmTmVQbzMvamU4N0d5eE9DRVY5M1FFNFA5?=
 =?utf-8?B?ZHIwU3VRaGRia3YrTGE2ZVQyRUxKeS9hNU9iNjRHQk14TFRrSlFDSEtOVmxT?=
 =?utf-8?B?bWhZQm1WOG9rSUw5VC8zNkxPZ0xiR3h4cWRZTHh6dERLRmFLYVZPclZycmhu?=
 =?utf-8?B?bmUxQjlneGUrUGhDZUhzK2ZsNytJdUVWSXpZeVZSWmErNjJoMFM4bWFESjhp?=
 =?utf-8?B?SHd5cHUzZUY3SXlCd2tFQ3hHVkpSampmYUpxMnA3SjNGQjIrQURLRkxjSmUv?=
 =?utf-8?B?QnV6Q0lWNXBWRjY3Y0xTWE5iWU5RdmpicWRIeTZoREF4N29hRktvT2F3eldB?=
 =?utf-8?B?bXJQWkxmbldGTGQ3Ni9oakVsWDEwZXNtbUpXeGRtL1pLTGdzeDF2NzNPSjIy?=
 =?utf-8?B?T1AxWk9US1p0RUtTUGRhenZaYkR3K0l2c0xLNlFHYWlMMkdhS3FISUpxRGlV?=
 =?utf-8?B?NklqcUdDWVZ6R0xMYXlmV1dRN1VCY05aYTlCZ05XaUlrWDZNWDUzN0ZXL1Jw?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9694c87-caeb-4921-2481-08dd4f13f1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 05:28:43.6601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j/XSlkbIeV7j11GiMQuCW2kty5t77PIjXXdmEXZjRISmHlRPL71GJZFrfLR9YczG6rqnf1WCQq4hM40UOwNfafd/HmIMrnolVf4JblaDg50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4933
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDEy
LCAyMDI1IDk6NDggUE0NCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgPGNoYWl0YW55YS5rdW1hci5i
b3JhaEBpbnRlbC5jb20+OyBTeXJqYWxhLA0KPiBWaWxsZSA8dmlsbGUuc3lyamFsYUBpbnRlbC5j
b20+OyBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6
IFtQQVRDSCB2NSAzLzNdIGRybS9pOTE1L2Rpc3BsYXk6IEFkZCBpOTE1IGhvb2sgZm9yDQo+IGZv
cm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jDQo+IA0KPiBIb29rIHVwIHRoZSBuZXdseSBhZGRlZCBw
bGFuZSBmdW5jdGlvbiBwb2ludGVyDQo+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jIHRvIHBv
cHVsYXRlIHRoZSBtb2RpZmllcnMvZm9ybWF0cyBzdXBwb3J0ZWQNCj4gYnkgYXN5bmNocm9ub3Vz
IGZsaXBzLg0KPiANCj4gdjU6IENvcnJlY3QgdGhlIGlmIGNvbmRpdGlvbiBmb3IgbW9kaWZpZXIg
c3VwcG9ydCBjaGVjayAoQ2hhaXRhbnlhKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJ1biBSIE11
cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQoNCkxHVE0NCg0KUmV2aWV3ZWQtYnk6IENo
YWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFu
ZS5jIHwgNTYgKysrKysrKysrKysrKysrKy0NCj4gLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
MSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IGluZGV4DQo+
IGJhNWRiNTUzYzM3NDI1OWY4ZjMyNDZjMTQwOGI1NWQzMmM4Nzk0ZTUuLjI3NDNiMDMxZDEwOTJj
Y2M3NGI0MTQ0Yg0KPiBkMDZkYmE4NzkwZjcyMmU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0KPiBAQCAtNTExLDYg
KzUxMSwzMyBAQCBza2xfcGxhbmVfbWF4X3N0cmlkZShzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5l
LA0KPiAgCQkJCW1vZGlmaWVyLCByb3RhdGlvbiwNCj4gIAkJCQltYXhfcGl4ZWxzLCBtYXhfYnl0
ZXMpOw0KPiAgfQ0KPiArc3RhdGljIGJvb2wgaW50ZWxfcGxhbmVfYXN5bmNfZm9ybWF0cyhzdHJ1
Y3QgaW50ZWxfcGxhbmUgKnBsYW5lLA0KPiArdWludDMyX3QgZm9ybWF0KSB7DQo+ICsJc3dpdGNo
IChmb3JtYXQpIHsNCj4gKwljYXNlIERSTV9GT1JNQVRfUkdCNTY1Og0KPiArCWNhc2UgRFJNX0ZP
Uk1BVF9YUkdCODg4ODoNCj4gKwljYXNlIERSTV9GT1JNQVRfWEJHUjg4ODg6DQo+ICsJY2FzZSBE
Uk1fRk9STUFUX0FSR0I4ODg4Og0KPiArCWNhc2UgRFJNX0ZPUk1BVF9BQkdSODg4ODoNCj4gKwlj
YXNlIERSTV9GT1JNQVRfWFJHQjIxMDEwMTA6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1hCR1IyMTAx
MDEwOg0KPiArCWNhc2UgRFJNX0ZPUk1BVF9YUkdCMTYxNjE2MTZGOg0KPiArCWNhc2UgRFJNX0ZP
Uk1BVF9YQkdSMTYxNjE2MTZGOg0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gKwlkZWZhdWx0Og0KPiAr
CQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICtzdGF0aWMgYm9vbCBpbnRlbF9w
bGFuZV9mb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYyhzdHJ1Y3QgZHJtX3BsYW5lDQo+ICpwbGFu
ZSwNCj4gKwkJCQkJCSAgIHVpbnQzMl90IGZvcm1hdCwNCj4gKwkJCQkJCSAgIHVpbnQ2NF90IG1v
ZGlmaWVyKQ0KPiArew0KPiArCWlmICghaW50ZWxfcGxhbmVfY2FuX2FzeW5jX2ZsaXAodG9faW50
ZWxfcGxhbmUocGxhbmUpLCBtb2RpZmllcikpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiAr
CXJldHVybiBpbnRlbF9wbGFuZV9hc3luY19mb3JtYXRzKHRvX2ludGVsX3BsYW5lKHBsYW5lKSwg
Zm9ybWF0KTsgfQ0KPiANCj4gIHN0YXRpYyBib29sIHRnbF9wbGFuZV9jYW5fYXN5bmNfZmxpcCh1
NjQgbW9kaWZpZXIpICB7IEBAIC0yNTU5LDMwICsyNTg2LDI5DQo+IEBAIHN0YXRpYyBib29sIHRn
bF9wbGFuZV9mb3JtYXRfbW9kX3N1cHBvcnRlZChzdHJ1Y3QgZHJtX3BsYW5lICpfcGxhbmUsDQo+
ICAJfQ0KPiAgfQ0KPiANCj4gKyNkZWZpbmUgSU5URUxfUExBTkVfRlVOQ1MgXA0KPiArCS51cGRh
dGVfcGxhbmUgPSBkcm1fYXRvbWljX2hlbHBlcl91cGRhdGVfcGxhbmUsIFwNCj4gKwkuZGlzYWJs
ZV9wbGFuZSA9IGRybV9hdG9taWNfaGVscGVyX2Rpc2FibGVfcGxhbmUsIFwNCj4gKwkuZGVzdHJv
eSA9IGludGVsX3BsYW5lX2Rlc3Ryb3ksIFwNCj4gKwkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9
IGludGVsX3BsYW5lX2R1cGxpY2F0ZV9zdGF0ZSwgXA0KPiArCS5hdG9taWNfZGVzdHJveV9zdGF0
ZSA9IGludGVsX3BsYW5lX2Rlc3Ryb3lfc3RhdGUsIFwNCj4gKwkuZm9ybWF0X21vZF9zdXBwb3J0
ZWRfYXN5bmMgPQ0KPiBpbnRlbF9wbGFuZV9mb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYw0KPiAr
DQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9mdW5jcyBza2xfcGxhbmVfZnVuY3Mg
PSB7DQo+IC0JLnVwZGF0ZV9wbGFuZSA9IGRybV9hdG9taWNfaGVscGVyX3VwZGF0ZV9wbGFuZSwN
Cj4gLQkuZGlzYWJsZV9wbGFuZSA9IGRybV9hdG9taWNfaGVscGVyX2Rpc2FibGVfcGxhbmUsDQo+
IC0JLmRlc3Ryb3kgPSBpbnRlbF9wbGFuZV9kZXN0cm95LA0KPiAtCS5hdG9taWNfZHVwbGljYXRl
X3N0YXRlID0gaW50ZWxfcGxhbmVfZHVwbGljYXRlX3N0YXRlLA0KPiAtCS5hdG9taWNfZGVzdHJv
eV9zdGF0ZSA9IGludGVsX3BsYW5lX2Rlc3Ryb3lfc3RhdGUsDQo+ICsJSU5URUxfUExBTkVfRlVO
Q1MsDQo+ICsNCj4gIAkuZm9ybWF0X21vZF9zdXBwb3J0ZWQgPSBza2xfcGxhbmVfZm9ybWF0X21v
ZF9zdXBwb3J0ZWQsICB9Ow0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1
bmNzIGljbF9wbGFuZV9mdW5jcyA9IHsNCj4gLQkudXBkYXRlX3BsYW5lID0gZHJtX2F0b21pY19o
ZWxwZXJfdXBkYXRlX3BsYW5lLA0KPiAtCS5kaXNhYmxlX3BsYW5lID0gZHJtX2F0b21pY19oZWxw
ZXJfZGlzYWJsZV9wbGFuZSwNCj4gLQkuZGVzdHJveSA9IGludGVsX3BsYW5lX2Rlc3Ryb3ksDQo+
IC0JLmF0b21pY19kdXBsaWNhdGVfc3RhdGUgPSBpbnRlbF9wbGFuZV9kdXBsaWNhdGVfc3RhdGUs
DQo+IC0JLmF0b21pY19kZXN0cm95X3N0YXRlID0gaW50ZWxfcGxhbmVfZGVzdHJveV9zdGF0ZSwN
Cj4gKwlJTlRFTF9QTEFORV9GVU5DUywNCj4gKw0KPiAgCS5mb3JtYXRfbW9kX3N1cHBvcnRlZCA9
IGljbF9wbGFuZV9mb3JtYXRfbW9kX3N1cHBvcnRlZCwgIH07DQo+IA0KPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgdGdsX3BsYW5lX2Z1bmNzID0gew0KPiAtCS51cGRhdGVf
cGxhbmUgPSBkcm1fYXRvbWljX2hlbHBlcl91cGRhdGVfcGxhbmUsDQo+IC0JLmRpc2FibGVfcGxh
bmUgPSBkcm1fYXRvbWljX2hlbHBlcl9kaXNhYmxlX3BsYW5lLA0KPiAtCS5kZXN0cm95ID0gaW50
ZWxfcGxhbmVfZGVzdHJveSwNCj4gLQkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGludGVsX3Bs
YW5lX2R1cGxpY2F0ZV9zdGF0ZSwNCj4gLQkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBpbnRlbF9w
bGFuZV9kZXN0cm95X3N0YXRlLA0KPiArCUlOVEVMX1BMQU5FX0ZVTkNTLA0KPiArDQo+ICAJLmZv
cm1hdF9tb2Rfc3VwcG9ydGVkID0gdGdsX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkLCAgfTsN
Cj4gDQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
