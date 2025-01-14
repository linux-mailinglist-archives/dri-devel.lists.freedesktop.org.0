Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D494EA1087D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5515F10E312;
	Tue, 14 Jan 2025 14:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEtJC+s6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5701A10E312;
 Tue, 14 Jan 2025 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736863561; x=1768399561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6RBvcUWB3ET5ExFMbakvyQnSaAeWASskkl720u1Y9mk=;
 b=PEtJC+s6PfN3LPDj3VmR4g6Lq4YcLocrypd/iU250hR6FXuHqdLPexx5
 Wtp+t82hkPcgYwRqh8MbDLhXzZusg0TW20jlXyeJI/Xh/Yhr0LSXqoTri
 DaOjZ/+8CLTgOiTPv2N6LcKs5RJ5jvBgLzOH+7phBUyOLsv1BC4eZGyzl
 R09vcDxEoubIWkvvEBmi47qR2Q2jRPNWsjqa50psIpzEIqRL5xhePFZL7
 OYQe03W9FkPNTRlY3/eT39KiGY5Qtas+BlkxBKtE6GDAtqjtO96Xn8qvX
 vDKqJRb5KsEDAMuLyYAJ1ysiNUEYtmAW9tVVFyD2/PLXm1XIo6dRXEhAo Q==;
X-CSE-ConnectionGUID: wmy+ZJEURyu2KViXZctACw==
X-CSE-MsgGUID: qpwXP05jSgmuR0VRJuiR9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40838738"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="40838738"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 06:05:50 -0800
X-CSE-ConnectionGUID: aQKYFt+TTeaRgAeBL/yPow==
X-CSE-MsgGUID: i5z6CsM7ROmIpL9WmjsaoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108876662"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 06:05:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 06:05:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 06:05:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 06:05:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3HdUSQbcX8Iw4nd2VmK7YWMkrUL1/gETaFu01XYAyRep29S/19qhkJAPB8OdCByQOIgXblO9rpjc6SCAe6Ee1Urc4IQZrlr35SxWGUA6ipaKMM9imXZGEtkSeVwrOPNbHqUEQpVOE8spAYDERAZYKOwhpkazTzAHxIofg/Bnje9YR9gst2RUj6eF7l1RO7LJ/IJyIukjFvJ5iTb+NVF92BiC62oS87HpVY79kym8nGLUFTEwEMwCZ0XF88YI3SvpzTIBdZkH1DDjlCBo6QZSPhHViy5eyIeYAs+kDCFASKkUInfRL87iikfQ5TthrvYU5ffv3F8kHjAPCYspm8dbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RBvcUWB3ET5ExFMbakvyQnSaAeWASskkl720u1Y9mk=;
 b=H6+MmOgWckH4UBzdwjlpqvQOZcc38+f4Mn+iVuWSqavYfZyF/tfiu+Vf2Elsc3C56EqKQrrsmyFirqSSCpnp6miRiH/qh88nhZpHGoZUbcXubuQ0A05YzyOvV+BsRARSLEQ9WzMOmkah20u9E33MbG+SD5n4UKCt8rc5TGtsscK/eqtBeQSycTtLPxmp4v5ySrXNt682QqKCMqur3YJ9Jm66IE8pi5iaLW6X9iRoXIRwv3HQhsfjw3XRipkv8NbD/1G9uiA+HZxO/rAmq4db5aCvLwmWQwIA2/vP7r3lWDnkMLjwyFlLAwXog909zfSBMsuICgbBtX7Hy2SuHB81cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Tue, 14 Jan
 2025 14:05:40 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 14:05:40 +0000
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
Thread-Index: AQHbXGTq3Ynz/rfH2UqisY27+I2b+LMJl8JDgAADOlCADMamsA==
Date: Tue, 14 Jan 2025 14:05:40 +0000
Message-ID: <CY5PR11MB63663795A6C4DC83CB89602AED182@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-2-alexander.usyskin@intel.com>
 <87sepwp6d9.fsf@bootlin.com>
 <IA1PR11MB6370A551FC8AEF0F9F404B42ED102@IA1PR11MB6370.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6370A551FC8AEF0F9F404B42ED102@IA1PR11MB6370.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MW5PR11MB5763:EE_
x-ms-office365-filtering-correlation-id: 1c984d28-7ea1-4b11-270b-08dd34a4877b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QUNHcU1LWThWaTJBVzByZ2E2eGVUVys5REYvU0Q0R3BScEhmUUVkWDRqNTcw?=
 =?utf-8?B?SXpxcWFFajNsU1cxcXdGY0pzMXYrR2hXczNGRyt3bEVwbFovN0RtcVdjU1d0?=
 =?utf-8?B?cjVjRkFMNEE2VFdpZDVTTm1jYVgwb3JFNnFZYzZtRUFLd0QvSEljOTd3SzV5?=
 =?utf-8?B?YUtpNzJCcGtNMHF3NmNZV21HdDNQYU43YWdwVWZSaUJ0VENmeUd3ZzY0Yjk2?=
 =?utf-8?B?RnFqVEkvWHNtcDRnVjRSRkc5Y0Z3dGxCay9aTjAvRTBnZE53NDg2QzZXM21w?=
 =?utf-8?B?TGt0bzQ4azR0cDRCWW4xR0lpZitCQ1d2cHJYR1AwTGJ2YlQ2WG5NNG9TN0pE?=
 =?utf-8?B?dDJMck1Qem93QXc3bHV6aUt5TndsOXdrbGE4aEl6Zm80NkR5ODE0dVZzZ09z?=
 =?utf-8?B?YUxxOFR2ZSt2SzZKcUg2ckxuM0dsT1g5a29vajhCWFdIZXZpWW0yZHdhQ2NW?=
 =?utf-8?B?NmtKNWRGWTJrWmx4cWtpT1AvbGJLQ250Y01lZElFcGZtMkM3QjkrYWVCR2Zz?=
 =?utf-8?B?QjN1N2hGSEtlREVQN3hhUElmNk81ZXZibnpaZUQwU3FKTEpxdFpBdldPTUZC?=
 =?utf-8?B?eWtIOUlaTEJtM1NYS3VCNTNvMXFXZzhKV0NWTml2Wkx5NDB5cSt3c1FLS01i?=
 =?utf-8?B?ZHpvYjhrcGhDSVpWODRpY0xhbUlxWXcwcndNalpsbmNSQ0VOVlpBbmFNSDVu?=
 =?utf-8?B?TFluSXBqZitGUVprV29WdjcxZjNhRENtcWJlYjI5NVBZK2kwUE83ZTZQQjUy?=
 =?utf-8?B?eE5IRVVJeXB4L1VXMmM0ZUprZ0djSUpiVjYyeThyeU5OeXJWSDRRekVvUFhi?=
 =?utf-8?B?amZjVDRkV1dOY1ZYeWFzUmZPckkxR2RqZG5YNHhxbno0aHI3OFdvRCtIdStV?=
 =?utf-8?B?UVFMa2h2N3k2aEszOUIwZ1BYbG1kOTl6cVllWFhYMjBRandkcXh5eUErbXoz?=
 =?utf-8?B?QUN6RExuNHRzSy92aWdBY3d0K0xQc1p1Ym5WWTVwQkRVZXRXQmkzS0VNS2FO?=
 =?utf-8?B?dzVWNDNjMERMK25oZE1SNXlJQ3ZWYkl2SjU4akZ4ZjNyUHpBK1NjVlUzNUdr?=
 =?utf-8?B?cVRKeEEwM2ZPOHBsamNHY0hyRHB6R1dCWHVNdjVsZDV0ejRSQlhNYlNrNlpt?=
 =?utf-8?B?VEZRTXBacWZjZ2dnZFQxUmdLeGxMSjN4ZUg3WkY5SDBuRmV2Z3VkdzRUK2hC?=
 =?utf-8?B?aTltVEpIcCtMZ2VmMitzN2I0b0tuMnp4ajdUaEpyQ0dkdXgxK0N3MytJeVd3?=
 =?utf-8?B?bjNMdVJJREJYQjc2Yzhrb0UrUHpkNnE4VGdFeFJ4WElVUzVMSFF1dG1nVjVF?=
 =?utf-8?B?Q0NyaXQwMlZkbGdDZmNNZ3dEMzkvY240WkRPamg1ZHYxd3RMTmMvREFSSm81?=
 =?utf-8?B?MGhtUC9jQVU1QW9acUJ1bkNYSSt2SHdQcEd2Z3V4T3k2NXI3TFpLRWhSZksr?=
 =?utf-8?B?Z2FGTUR0VTc3RlN1T3pUbDZCeFBYczBpM29xTnkxS1RSY2crVDJWTHFseGYw?=
 =?utf-8?B?K1BhMFpnM1lma0pjcytGNXBReXdsdXN3QUlhQzB6MTgycDYvUG9oK013SGlw?=
 =?utf-8?B?ZmltQWM2UXJ4emZVL1QyRWVnWnovU2lUZ3JjWUlCVVJ2MnpDeGdJUmhnMUxL?=
 =?utf-8?B?eDFDNlFRQUZETzVpTElMVTZXZlJTSHJiM2tOdXdGdTBTZXdoQmU4cGJkSGdL?=
 =?utf-8?B?UEVaWXdXVXp4ZG5IREg3NThIWGV4WUpuYUVaSHh6TjJjbUJCMTQwaWV5eDNw?=
 =?utf-8?B?MUpDNlNsUzhCNWovS0NDNW9QSHJIeEI5STM5QThHajdlWVQ2bDc0Y1ZvNHVm?=
 =?utf-8?B?d1RTSVRmWWVqOU4wOWRIVGg4dG5qVHZXdytYN3JBVGluUUk3WEZVVmtPemZN?=
 =?utf-8?B?blYwNEFKYTJqQ1ZoM0FMSkhDL3M4S3RjU3BQczNUdUMwS0xQTFFhRWUvVUE1?=
 =?utf-8?Q?WoRiTX4kdAE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1I4R1RWcmJ6dG5pODkwMXdjVmc4ZEZSS0QxSVhyVi83Ti93ODVHN05oYWd0?=
 =?utf-8?B?cU0xYnd1Yld2WGZ6Tzl0RVhZS3J6S1VGU0NsQ2pKdWJCZG54NHlKOWV0VVBT?=
 =?utf-8?B?Z3JKMldPeGtyRlprVmcwcTBpMFRUWTFLSjNHNU43VEhBdW9wVnNpV25tbEVK?=
 =?utf-8?B?K29ZclZDU2JRNHphMEQ5VW5NTHVwYU9RNURnVytxRUhuLzg3bHNjbUJTazBq?=
 =?utf-8?B?Y3h5OTMwY2tTNXg1VlplNGRyR3o3V0Q0UXRLSEordTNNRDl4TysyT2R1OE9i?=
 =?utf-8?B?TFpJeEIvd0N5aDdjTTZnMEtBb09POEwxV2oxT0w2bGl6RG1VUnhsMDN5S0d1?=
 =?utf-8?B?Rzl1cVZUYU1BMzJxNTBCWm1Tc3VseFFpeWZvSnZEOUEwQXZZL29IenFUZmI3?=
 =?utf-8?B?azlvTENIS2c4ZklnYVBjM2wvU2krVkhJRGJETCt6dThnbnBpalNPcmMxWVhv?=
 =?utf-8?B?L3ZsRWJ6alV4SmRSSm5NNnk0eUsxMldMRzBqc090dTZyK0pjNktCWS84cjBE?=
 =?utf-8?B?aC9rRFhzU3I4VzRCU1R4c1lxaGtBK1lWcncrazhQNGh0TFA2ZktiNjdnTnRR?=
 =?utf-8?B?OHBDNDJjMWtWRGtyRWZ6RitJemVDTVZTTkdyU0hrYmNtM0VTZS8ydVZJUW1L?=
 =?utf-8?B?akk2b1BIYkE0TTk0OWtZbnRxNjdYMmtnWmlzSlo4aUYrQzQ4cFZYUUFXVThv?=
 =?utf-8?B?OFplWERTK3k1aDFSNWp3aE9oRnhOeXNLc1kvNG5iejhtUHhQc0tHM2pvOUJH?=
 =?utf-8?B?OEZYY2RVbUVhaHY2S1U3NjcrajlEUEJVWkViS3FoTnVqSlptMEdDVHN0V2dD?=
 =?utf-8?B?Sm4rYnZnQ1VaV2lVVXRRejcrQXBtY2JPOUNHUGt3dlYvRFZEc2NSbVVVa3p3?=
 =?utf-8?B?QS9Dc2NSYmlaOC9qVHdicFFHSjFsUW5BaXF6c2NhNjA5a3hKSmIrcUVHQWM4?=
 =?utf-8?B?UTErTHN6UXFnTVJNT1h5OGNZbHV6dVB1b2hiV2Z1NmF2ajROdEh2WGVCSkRr?=
 =?utf-8?B?YThXanJXclNBaGdKUkxCL1g3V2M2a01KSmRxd2pmYlRsREdNWEdoMGphcDZI?=
 =?utf-8?B?MFhlNm0wckhWNUZ2VGNITE1LL01Ia1ZONmkvNEhtb0ZDMC8ydHlTNTJwL2ty?=
 =?utf-8?B?d2lSOWZqMnMybFVQVTIyek5vMjJ4UEVCOU5xbHJvOTJSZkVaNWFxVXFaVHBh?=
 =?utf-8?B?Y0RwR3c0dnI2a2FVOUUweCt5RzdNOXY3WVdUUmZUV1B0alJhcWpKd3BxL0dU?=
 =?utf-8?B?V3BWZ0htS0lQbU5hYWUwSjYvNGs0KzcwYkNaUlNJRTdZOFVydUNJRW5sdzVS?=
 =?utf-8?B?bHpNdW9sbjhVNVhpY1NSa29hRGgzZ3hLVGVGT1hCbTNaR3Z5aWkvcS9Tb3Jk?=
 =?utf-8?B?UC8ydW8rczB5TlpVYWN1ZVRMbzI1WUE0ay9tU0o2TnRVMVl1Tyt0UWJ4RVZt?=
 =?utf-8?B?aDM1MjB0YU5DQ1N5TkNoSmIxeHhGSnlBTFFmSmEyWlZQOUJudFdTTEk5SG1a?=
 =?utf-8?B?VlA5TVdwVVlQNDZlM0FweS9tVTNTLy9yT2p3ZVM0THp6c3NwVDRTcEhxYno1?=
 =?utf-8?B?clg2TVRGeVhvWDZaZkUzb3lzMmFLOWlmWnp4WXE2TUNRNUZhUUYyenRoRXpj?=
 =?utf-8?B?U3dvVzZpY1hhVzFJQ0I0Y3hhV2Urb010a3hUcmg1SGkvanpoQ24xTGNzYjI3?=
 =?utf-8?B?R3lPYnFWdjNqTWtSYjJsdTlTNTRMdEtOWW5FdlZsUVE2Sm5abjJZTEdyS0cx?=
 =?utf-8?B?aERzdmdyZUEwdFVkNWNMeDRaTGFkcHlvR0drRDBKdVJoVk5BYzhPRm56T0Nh?=
 =?utf-8?B?MDRVN09JV3RDY1E2WG5LM3lUcUxrbTcwVHVKYmRxT0tTNy9oSVdWYjB4OHU1?=
 =?utf-8?B?Rm00WGFtNllKSE03ZVo1VXFKS01DaTRoZGVoYTdkdWc1RGo4U2djMm4vY2Zk?=
 =?utf-8?B?WG9KREFrRjRjc2IwSW80MlppNzNKN2x0UU1XS0VxNWlmN0VhMmVHN04yVi94?=
 =?utf-8?B?L1JDMFlwdEV0WHRwSFdNMlNZQ21IMzQ5akVFTEx4KzdVTEkzQ29vaDlSdDZC?=
 =?utf-8?B?Q0k3c1lWblNQVVhONzZvMEVVN1duK2F4Qy9rRW1CYkFxYWZrKzRNYndrSTl6?=
 =?utf-8?B?YjBkL3hPZVdnK0VESEFlSHE3MnNwamtSUlVsUzB1by9ZQWl1MDVSL2diVWZ5?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c984d28-7ea1-4b11-270b-08dd34a4877b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 14:05:40.8127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1JQPbqMnxWQdrflhUw0TfaNNXy6lsLtc+3wtWIcUx2WqsVrVH4n8IHw7h+Uleq5i7OsAkaqQdEdAvWdBMziHCoYn07f2bFatGAzlFltJRWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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

PiA+ID4gQ3JlYXRlIG1hc3RlciBkZXZpY2Ugd2l0aG91dCBwYXJ0aXRpb24gd2hlbg0KPiA+ID4g
Q09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIgZmxhZyBpcyB1bnNldC4NCj4gPg0KPiA+IEkg
ZG9uJ3QgdGhpbmsgeW91IHRvb2sgaW50byBjb25zaWRlcmF0aW9uIG15IHJlbWFya3MgcmVnYXJk
aW5nIHRoZSBmYWN0DQo+ID4gdGhhdCB5b3Ugd291bGQgYnJlYWsgdXNlcnNwYWNlLiBJZiB5b3Ug
ZW5hYmxlIHRoZSBtYXN0ZXIsIHlvdSBubyBsb25nZXINCj4gPiBoYXZlIHRoZSBzYW1lIGRldmlj
ZSBudW1iZXJpbmcgaW4gdXNlcnNwYWNlLiBJIGtub3cgcGVvcGxlIHNob3VsZCBub3QNCj4gPiBj
YXJlIGFib3V0IHRoZXNlIG51bWJlcnMsIGJ1dCBpbiBwcmFjdGljZSB0aGV5IGRvLg0KPiA+DQo+
ID4gSWYgSSdtIHdyb25nLCBwbGVhc2UgYmUgYSBsaXR0bGUgbW9yZSB2ZXJib3NlIGFib3V0IHdo
eSA6KQ0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IE1pcXXDqGwNCj4gDQo+IEhpIE1pcXVlbA0KPiAN
Cj4gSSd2ZSBjcmVhdGVkIHNlcGFyYXRlIGNsYXNzIChtdGRfbWFzdGVyKSBmb3Igc3VjaCBkZXZp
Y2VzLg0KPiBVc2VzLXNwYWNlIGxvb2tpbmcgZm9yIG10ZCBkZXZpY2UgY29udGludWVzIHRvIHJl
Y2VpdmUgc2FtZSBudW1iZXIgb2YNCj4gL2Rldi9tdGRYIGRldmljZXMuDQo+IFRoZXJlIHdpbGwg
YmUgYWRkaXRpb25hbCAvZGV2L210ZF9tYXN0ZXJYIGRldmljZXMsIGJ1dCB0aGlzIGlzIHVuYXZv
aWRhYmxlLCBJDQo+IHN1cHBvc2UuDQo+IE1heWJlIHdlIGNhbiByZW5hbWUgaXQgdG8gc29tZXRo
aW5nIHRoYXQgbm90IGluIC9kZXYvbXRkKiBleHByZXNzaW9uIChlLmcuDQo+IG1hc3Rlcm10ZFgp
LA0KPiBpZiBpdCBoZWxwcy4NCj4gDQoNCk1pcXVlbCwgaXMgdGhpcyBnb29kIGVub3VnaCBvciBy
ZXF1aXJlcyByZXdyaXRlPw0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCg==
