Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36317A023CA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 12:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163E010E618;
	Mon,  6 Jan 2025 11:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPjVkI0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CE510E618;
 Mon,  6 Jan 2025 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736161414; x=1767697414;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tY+4n45bbfEQJxpBLSiVRpvE0voWzFHsEOL+WMbRP24=;
 b=JPjVkI0wipi5b7c/MCNwAip/2UwOd+/n9eU/DHcHCosft28bmT74Rqzl
 VqqQP9/B+xddgAeu4A/pDVzesYieO1GiJkZ7S4ErijN8aLIG0neKAJ7pK
 eRt99Hb42rW1m5dg3c+sjG6ndv3QFbfB/IJ5hUk7BawsQykmmvjJRmXH2
 sOc8IxJHrwGJsVfq8+3Gd7YHT/Cml50+q2uxumZ/cOeLHpHDkCNcv0uS9
 7SXPIutnfpyWtZxOuOd7gyci6pPD3wnGrceEDKOqUujMLsvFqgVPgrHtn
 sUd5IDyFmiGJfikQW1x89AczNlj0o0yBZv5q065g8+Tcj0GmVYCKcB1kg Q==;
X-CSE-ConnectionGUID: d2WPXq21QHKmu5dop4A3JA==
X-CSE-MsgGUID: 1TxAIzlNTyapfxQFI5KaCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46803004"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46803004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 03:03:34 -0800
X-CSE-ConnectionGUID: 3PzFNT8YRem3oOZFluc6eQ==
X-CSE-MsgGUID: 3oVOtK4ITFa8mYTyesv5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="102934510"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 03:03:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 03:03:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 03:03:33 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 03:03:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIwteOXriJOx2w8Rb6styksmPkb0l5llw3WffVl3vnib2UOfdJ5lot7tHewm23wR7cdoUnZXUcDLlbysms55nr4bfxcJ1Paa0kBnolRDT2U2ffW05UDXIVl5K64rdryGMOAd2Uyfw/18NRc7bnPAL2Js0o27KI1WUT6faBeHecs0R3JZ6NVZ/CzeW1+E2W517MHKV3sggjgDW58vtbzZGG1snl6L8ed7pCAwbwJ8eByVYAZLVgYAqQJlO4Qa22t3LDfFZVaug1c1IIE9CCQUTfpWFneMl7N/HdWPckrTwlu0XDomOfOCw8V4p+QBWGJtQCXhwJ9+sIExwzKiFU5iNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY+4n45bbfEQJxpBLSiVRpvE0voWzFHsEOL+WMbRP24=;
 b=BE8GCxlS+UlNHnUXzbEL18xWHdggjyRMLa1jbCwKVI3cD00kyeSWKLBvAZXpy2J3hR27CH3F84Tz8SHrG19mqmiDgs2PoSBGXuHrC1/BSrXJXLB3RkiwTLgLdxm995xijjfE7AYqq/sWNsLzp1DeInpacLtkMrvjHP+GW6AsxdUpclbD/Z2mMkQhAeMswre2bI9m2yNB7NM1+JQk2ZIwfsPnKRCXzeZaomqJCRBl5tDVhumnwKhi24piosq1cTCvPQmkmE4EF5nNhSLwhiVfbZedBi9OADyNmr1SYUh9C+gQR5MUCojIsLQEZPzZT7DtNZaeTZv4oLaP1sm9PbiSFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Mon, 6 Jan
 2025 11:03:27 +0000
Received: from IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d]) by IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 11:03:27 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v4 01/11] mtd: core: always create master device
Thread-Index: AQHbXGTq3Ynz/rfH2UqisY27+I2b+LMJl8JDgAADOlA=
Date: Mon, 6 Jan 2025 11:03:27 +0000
Message-ID: <IA1PR11MB6370A551FC8AEF0F9F404B42ED102@IA1PR11MB6370.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-2-alexander.usyskin@intel.com>
 <87sepwp6d9.fsf@bootlin.com>
In-Reply-To: <87sepwp6d9.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6370:EE_|CH0PR11MB5233:EE_
x-ms-office365-filtering-correlation-id: 94ba0483-6fb7-4282-104b-08dd2e41bf57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|7055299003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?d1g3eDZtSlR1ckZ5WEpMYzBobFo3dmxMMmlVZ2czc29hMmlIM2dLckg0b2tI?=
 =?utf-8?B?VzRjc3hVTnlRd3lzM0JtbEoySlJobHFZVFBDWVhsUTN3cm8razlKNFlMR1lK?=
 =?utf-8?B?MkU4UDdXM0NkaFA1cGRFd2N5QnZ1VnJGbjJlKzRRbS91MGxxWUpaVUNpV2JZ?=
 =?utf-8?B?RnJaN3ZocitRRnlPR0hONk5SVkxtOE14RVhRUkJYeEhWeFY2djlXSkFPTncv?=
 =?utf-8?B?alRzSG9oTWpOU3pqUjZCR293NnFXMlRFSnN2MHpWN0dCdDNtS1JxQzI2ejdB?=
 =?utf-8?B?WWlJY0VoKzdaY0FXdzRnSElpYTkxOUtxWlFoRFVwaC9WMVBkMkZDZkN6TGRr?=
 =?utf-8?B?Y3R3RzNreWROTmtSVkZMRDc2c1pLUFpHSjY0TnRmc1dxNHdyRVJ5M3AvUGt0?=
 =?utf-8?B?TTRKQVNIdEVHREJOSmF3VTlhVXFTY0wvaUU0OE9kMklCWi9wS2llWnl5ekdE?=
 =?utf-8?B?TkpqdDNsQTJRQ0xqMU9oSXVEbDNpTVliMDJsTVBtSW15eDZxVmVSY0tscG9m?=
 =?utf-8?B?VnBmUmVLZlhrSkJqVW5uQ3d1WkU4Q2RIYlF2b0VKUks3bk9hWHJLQ0RqeUFx?=
 =?utf-8?B?UDBBZlJXTlJxVlJRVmUwMUpXWCt0Yko3YU44YUh3TmtLbXlZWDRONUF5dkRU?=
 =?utf-8?B?SG0xT3JYRkxxRHVON21oaUlKSGZOenZKV3Q1RlhpYlFWNVhLd3NaWlJOVzc4?=
 =?utf-8?B?ZlROcThvV3JybUxEaGxLR0FQN1R6YW8xYnNKajBKRzhnUUp2VnpnN0Y5aUhJ?=
 =?utf-8?B?bUk2V2tuM3MxcThjYWlwYkNKUXpSM015aWRjYzNIbDc0NkhueUdDNmJCR0Nh?=
 =?utf-8?B?cC85VkNiWVUzOFRaS2dNc2kvekQxUXlWbjQwb2tJbW5ZWE81NytKN3JXQjU1?=
 =?utf-8?B?dVVjdUxSNHRlazJzQWZRL2J2akVwRngvc0VrSEZzR3Z2MVY2UTdtaUIzeC9z?=
 =?utf-8?B?TUNKYzAwRndRNkszbDV0NjR2STJEQ2E1cXkxL3BtcVQwNnVJS2ZIbGIyVEMv?=
 =?utf-8?B?L09ibTE4dTJPK1F6cjhiL08yT2Zqb1MzdFBzbmZwd3hsUldZdGxXaWZOSnJP?=
 =?utf-8?B?QlZoQW83VkhiNzZqRDhQMHNGaHRxeDFOb0FVc1FLa0d0UHBMZDJTK095ckRQ?=
 =?utf-8?B?ckVNcGwyM0ZaNGNCbDY5RmY1QktabFdrU0lPTHRFd2pNNVV3L24rb2pScU1q?=
 =?utf-8?B?UUU2VXlFdnVBbEtrRmFkb1pKQkFHRUptbjRJR3hEcitwSEtOMkRVUmtWSUpx?=
 =?utf-8?B?NGx6blJYbkFVZytMcEhPcW1jNUVsZTdLd3JjdGNuQTFKenpsNXJqdER5ZXJl?=
 =?utf-8?B?NmswUmVseDFNZUcxekVWVjVsOEl6ZUZVR0hpMVNReHkyanh5RVZtcnFvUlk3?=
 =?utf-8?B?ejM1MXFkSmY2Sm16RDhRZHE0Yk9HVlFoR0ZnQjRpSDl1ZzhEZGZXSU1ybDVY?=
 =?utf-8?B?M0d4Y3NRTlo5ZDZ2ZVJ0QmtIdG45YzR1L2ltREp6RTV3U21ZSlNmaWZoVzI3?=
 =?utf-8?B?bHlDcC83Z3U3ZTkyMlpvT1hLb0pYSnFNU3lmenYxcnFDMnV5MG9UTGlFdmtR?=
 =?utf-8?B?L2xYMkFTQWI4alE0RXhITmlHUk5jUlRsU2RPcjRsb0JxN3NOdGsrMzAwcWFB?=
 =?utf-8?B?dm9qcnpYSE9BNmhPaDdsOWs2b25ETjcvazFqaVBSOUt5T3dPbjZxdWYzU0Jw?=
 =?utf-8?B?T3ExQnR3SzhzcDUrcjUvS3d1eE94R2lnbXI5cmRieEFzaG80bW5FNDBJa3hj?=
 =?utf-8?B?UHF1M2FQc2R3YzdYb1NFOG9ZK1lpTDY3TC9ubkYwRzlzUmp6bHJtWkpXWWZs?=
 =?utf-8?B?YWU5VlMwZnpXUFltTFlGb3I0eHJyMmk1ekhRalAxSnA0dW8vdSs2NVAyL0hr?=
 =?utf-8?B?eU1HTGxPTkowenlVWUlnYnhhb0tVRjBYSHIxWnJVeHJpNTFnYkJ2Qzl4SVFr?=
 =?utf-8?B?eVhRbjE1Z0VhSXcrYXZHaFRielhHZ3FXM0RuVTM1a3c0dmhCTDlWODRTR1Fp?=
 =?utf-8?B?eU5hcWpGRjRnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6370.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7055299003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2V1WGZ6UWVHQ0VuazJyM0c3WGdUYXpYUUtTU0Q5S2RyNm44dXBaY1gwWGh3?=
 =?utf-8?B?WnZXZ241ZUg3OGNjSGVBTHZ1MFZqZUNFVitNdy9BUUtoZVhpekdOOHFBZGNa?=
 =?utf-8?B?UU4yaitiaU9FZFJ2b3ZpbytHS0xUQmx0cU1VR1JScEJOb0dmZ2ZHL2JqN3c4?=
 =?utf-8?B?dS91a0NxRXpZUUpHNTZpcmRoeEFjRVlrTTFlM1hmSTNuSVhiaTJlVDFkWmRa?=
 =?utf-8?B?QXpoKzgzM2NUSzVsOCt4YWpLNG5DMis2SUh4Tkw1OGpXcTFuNHZianBXN2dO?=
 =?utf-8?B?OVFpTWp1STRROGFudVU4Q1Z6cjQwZHRhL0R4WndCOUpGLzFaN0piVGJQbWU0?=
 =?utf-8?B?OVNxdHlqWjNmSmlIN2NIeStkMVFFUTdkLzJUaFh2Q0hQbjJSWWMwN2tyb2xm?=
 =?utf-8?B?OXYzOFBOZEl6YTFDdVhHb05kNWVYS2d2aGhXeitpQU0xYUlUNGRDTjJzcHhW?=
 =?utf-8?B?S0EwbnN1a3pnbG9Cc2dHenZ5OS9MWWgwRVRJaGJPS1JMem85dEJkTDY0ODFk?=
 =?utf-8?B?d2RWbFAzSVpJcnNiNnVxYnhjclc4SXNEUEswZWxGMTQ0T0hzN01aUEFrczda?=
 =?utf-8?B?M3NGL2t4aHA0K3plT3dUNUJTVlBUSVRkSmlaWGFLbDRWOUF2cGZCL1VSK3Bx?=
 =?utf-8?B?aUg4L2NXbDg3S0hmdEZLKytUVVJIbkFlQ2R6T2NqYnhibzhPNkk0Tk1zTkVU?=
 =?utf-8?B?V1Jsb2NrMzBXWXJGelQ5cXFiYTA3SGFqSmJoMzhJOGdROVIxc0xpY3FPUFVN?=
 =?utf-8?B?dFh3Nm9jdUJKbkFnUnIrT0NpS1ZZdVczQkxXMlBvdlNjWGZlZzBvVWJHNk9I?=
 =?utf-8?B?TllNNnNyTGVaS3NOZk43ZGl4eFpHcWFoR21ZTVdlTXJIdWFXK3JqQXlJa1RD?=
 =?utf-8?B?WHlLS3NxeTk3TDduSmd3c2cxWkF1VnA4RVNZb3ZXNzJaZFk2bjFpYzNGdmJJ?=
 =?utf-8?B?dDBpNEJaeGpTcXlUN2RhclFPY3k0OGN4MGs4a2o3TDU0b05DQW5NN21KZFhi?=
 =?utf-8?B?Z2hNRzVhck15ME5oczZoS3o1d2pHMWVpY2ppQzgwOFpxR2ZGODNRc0hsdFQ0?=
 =?utf-8?B?YTFsNWl6YWNnRXUyYmxrUkFXWjVYenZGU3pxbUh5KzE0V1VaZkNFMnN4aTVu?=
 =?utf-8?B?b0xpMmxLUWx1QzV6MS9YWnFXbk02LzVEME9iNGdXWGpjYjFtODBONnpUcnp6?=
 =?utf-8?B?dk8rSXJMTmdtRXRFeFBaRTlvR0FoL1cxNHZxWEZjZVJaanQySWNXblJKcEdV?=
 =?utf-8?B?V1MvczN2N3hqSDhsbEhMaGk3a0hPblZTWTUzZTFzZUR0VU8xR3R3UTZxNkZM?=
 =?utf-8?B?ZFVxNzBqLzBMdTgxNVg5ZDY5b0dlbzAwNUtmQzRTeFhVbExOa2lXTTg1TDNZ?=
 =?utf-8?B?OElJaXdwck5La1hXTnZ6OEZFQ01SaHcvSTNnNFErbmdDd2NMdTU2bENWOEJR?=
 =?utf-8?B?dGp1cDZIWTJZdHZkeEJvVzlLV1dPVU40aDd4aGN6NVFCNVd6T3Q4dmdhZmVV?=
 =?utf-8?B?Mmx6Wmp2aG9INUd1eFk0TmVPazREVWxJU1BLSjdIcURnRlphNnFuNWFZbU5j?=
 =?utf-8?B?QkVoREdOK0cxQWVSRmM1ejdkSVpCc05uTStpdkgwLzdOcmVHenlLOHBoM2J4?=
 =?utf-8?B?d0xFcEJZUC9TVjZJYWp5eEFTdmQyZlRhMG1DRzFNdzFQSEhmUGJaam1jYldt?=
 =?utf-8?B?eXRzV21WamcybENJNTN2OTd2R2c1eFZnRVFWUWZCakdWUnZhSlI3V3NxRlVJ?=
 =?utf-8?B?dUdvdUMwSHhsYjI2aTdqeTBWcExCeWNQS0h1WURaV01KQ2tFVzZIdk8rZjEw?=
 =?utf-8?B?NURFVm9NdmVvTDVOeXVFZ3c4Q3pWOEdieWI3VEJwQVhwOGlGRFpNdTM1aDJT?=
 =?utf-8?B?QnZTTURlOW1qR2xPNDhGb25KaVhyOW9zbTJrTWRzUHVRdFBmelRsWDRnUUd0?=
 =?utf-8?B?bTluNC8yK21VamJYTWNYcHIxcEVjaUs3U0FVK1RzaGI2QmFYWllFT0FLU3hi?=
 =?utf-8?B?aUJTS0NBZVRJRVRESDBCbU9kRWZDb083WnlDNzZxSkcwL0dpemdFZGx6VEd0?=
 =?utf-8?B?enUwUUpEaVVXT0lVTi9qbnd0YVMrNWFPNEZvRnVMbUcxNkVUUU9DUFNsaElw?=
 =?utf-8?Q?Qt27KLa00BZ9snJPS8V0qAeLz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ba0483-6fb7-4282-104b-08dd2e41bf57
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 11:03:27.4214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4Ak8G1w/u7kAj+CjAiI6PKFWqCq8QLSKmncNEA1vQNybeOh9PC7sBU3aP91klJwJ1PcNDxt98EHeICARjgp+5l/qdr7YVsQYyvW44m/Cbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAxLzExXSBtdGQ6IGNvcmU6IGFsd2F5cyBjcmVhdGUg
bWFzdGVyIGRldmljZQ0KPiANCj4gSGkgQWxleGFuZGVyLA0KPiANCj4gT24gMDEvMDEvMjAyNSBh
dCAxNzozOToxNSArMDIsIEFsZXhhbmRlciBVc3lza2luDQo+IDxhbGV4YW5kZXIudXN5c2tpbkBp
bnRlbC5jb20+IHdyb3RlOg0KPiANCj4gPiBDcmVhdGUgbWFzdGVyIGRldmljZSB3aXRob3V0IHBh
cnRpdGlvbiB3aGVuDQo+ID4gQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIgZmxhZyBpcyB1
bnNldC4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgeW91IHRvb2sgaW50byBjb25zaWRlcmF0aW9uIG15
IHJlbWFya3MgcmVnYXJkaW5nIHRoZSBmYWN0DQo+IHRoYXQgeW91IHdvdWxkIGJyZWFrIHVzZXJz
cGFjZS4gSWYgeW91IGVuYWJsZSB0aGUgbWFzdGVyLCB5b3Ugbm8gbG9uZ2VyDQo+IGhhdmUgdGhl
IHNhbWUgZGV2aWNlIG51bWJlcmluZyBpbiB1c2Vyc3BhY2UuIEkga25vdyBwZW9wbGUgc2hvdWxk
IG5vdA0KPiBjYXJlIGFib3V0IHRoZXNlIG51bWJlcnMsIGJ1dCBpbiBwcmFjdGljZSB0aGV5IGRv
Lg0KPiANCj4gSWYgSSdtIHdyb25nLCBwbGVhc2UgYmUgYSBsaXR0bGUgbW9yZSB2ZXJib3NlIGFi
b3V0IHdoeSA6KQ0KPiANCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQoNCkhpIE1pcXVlbA0KDQpJJ3Zl
IGNyZWF0ZWQgc2VwYXJhdGUgY2xhc3MgKG10ZF9tYXN0ZXIpIGZvciBzdWNoIGRldmljZXMuDQpV
c2VzLXNwYWNlIGxvb2tpbmcgZm9yIG10ZCBkZXZpY2UgY29udGludWVzIHRvIHJlY2VpdmUgc2Ft
ZSBudW1iZXIgb2YgL2Rldi9tdGRYIGRldmljZXMuDQpUaGVyZSB3aWxsIGJlIGFkZGl0aW9uYWwg
L2Rldi9tdGRfbWFzdGVyWCBkZXZpY2VzLCBidXQgdGhpcyBpcyB1bmF2b2lkYWJsZSwgSSBzdXBw
b3NlLg0KTWF5YmUgd2UgY2FuIHJlbmFtZSBpdCB0byBzb21ldGhpbmcgdGhhdCBub3QgaW4gL2Rl
di9tdGQqIGV4cHJlc3Npb24gKGUuZy4gbWFzdGVybXRkWCksDQppZiBpdCBoZWxwcy4NCg0KLSAt
IA0KVGhhbmtzLA0KU2FzaGENCg0KDQoNCg==
