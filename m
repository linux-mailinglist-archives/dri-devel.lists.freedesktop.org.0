Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAEAA32833
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229A610E8B1;
	Wed, 12 Feb 2025 14:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVKFMNsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2CB10E137;
 Wed, 12 Feb 2025 14:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739369808; x=1770905808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IqwaLE/eIFCxkPa5wwOk+0QUFCRrBDK9yPt0iyae02o=;
 b=EVKFMNsz0ZrpDtIN9U0TEVz49n+m6Bo8w+ym+O981nfToyV57opzrqjO
 2coiiLrOsHarAwZwFhQToOjfdguGjliIBVI4EdguxzTrWUWUoo05tTM+t
 ovVPbiSJCraDyHQZBbwMwHjtXkEQFDy9McZ15px8zt8AacouDAL+e3mny
 a/HosGUWqMCMG/ChVJJnoUl7cQCa7kDi5OIATEikQKN3W0m7Td9JM1Woq
 Ppp/l3I8PBZmT4DPW7gohKMaQSFzwH8Ub8GLZAk+ZOxNPVFp5H724wVUF
 OEr5OrcLnx60Vw81bkdy29CVPqZ7pfVhKRlA0w3cnV/kaXpKIjolt4z+v w==;
X-CSE-ConnectionGUID: sNrPSLczQx+PxQt3lE2rdw==
X-CSE-MsgGUID: 1KNX0hIpTzShdlwcIIdRRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39948842"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39948842"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:16:47 -0800
X-CSE-ConnectionGUID: NJ4MtpbhQKqtufWpQ8J1zQ==
X-CSE-MsgGUID: tz9k5HVwSqaMsN2Fagu55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="117918789"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 06:16:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 06:16:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 06:16:20 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 06:16:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJnygrU1Bs4U4DzWpUvTTXeaqRV4+UNcO8ezKmlyK3c/n+ziag0ckwuk6siDn3789WblEP/UCu8ycIGj3RhtuJs9qBIxGLCblHhW9jKyZjzUf5/qtAEFHOtRn1ByHi/w2uo16oqfJW0n6BBEXQUUi2lrZDzzWA+pEk/8AWIz7L67rLU6miTCwHm2sjg4FHVQstDlDemFJhwg32yjTRuve5OYcLU6WcQk7og8mBOryQmVo4daCnh6NZvZ2HubjM48izgdhIlmCZc8rvtJkVFcf9wAGAaAyWfeCzbM/l+lkryBWJpNx0prKFONNbM9nxmXGQ8qcF1rj2cVIthS+GntFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqwaLE/eIFCxkPa5wwOk+0QUFCRrBDK9yPt0iyae02o=;
 b=c5hHsSEWb/bTmv6ZtjFaObaIUVxraCnYBxN/U7EcXfUUd/Q5vOv3Wkp1GIAQVPyrbH0mZrsaCVrPPb/QJcCbEtJ6Q560jYtJVTRb9d+T5yG01eCezFCDWj9OZosWPWD5mZVPS4DKJpon+2MKdx1m79xV/eNjFFY1QzrVV45hCBBOx3vq0YZ819kLO4OfKOW6NbIwjUh/S8Zce9krp0B11Rn4dy0luVhb2o6zMQZJ4JbSEtwGTCCoGFpKK1iG6UipFEyND45jm3LssF2W15UPq/dehMV45LM6ihKcBDlAQ7qf2kfh1R0TNSc1SDH7au2yCDiv0K51KsohXN6ceONQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CH3PR11MB7346.namprd11.prod.outlook.com (2603:10b6:610:152::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 14:15:47 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 14:15:46 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
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
Subject: RE: [PATCH v4 07/11] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH v4 07/11] mtd: intel-dg: wake card on operations
Thread-Index: AQHbXGUATzfgBwKiikWfLhqBlbVWZ7MudwCAgBWAjjA=
Date: Wed, 12 Feb 2025 14:15:46 +0000
Message-ID: <CY5PR11MB636606772899446D719DEC30EDFC2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-8-alexander.usyskin@intel.com>
 <Z5qiyRzkdgwQ9kTP@intel.com>
In-Reply-To: <Z5qiyRzkdgwQ9kTP@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CH3PR11MB7346:EE_
x-ms-office365-filtering-correlation-id: 25331737-83b4-4ba6-1c36-08dd4b6fbe8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cHlIejZ3VVR0bnorTmRwbVBWN2VOdzBOaGl0UHRuQ1BITzBRSFRXbVBiV0ZJ?=
 =?utf-8?B?QWZnUzhyZFk2aUhCZXNPTVl1SllrbFBRMFNFa2RlQjFtZFFjRGZpV1ZTNkQy?=
 =?utf-8?B?ZTBRZ3NVSUxEbjF0MGx2YTZMeW9xQ1ZnckUyUmxxZFlaOEFyc1NBVytiZDRH?=
 =?utf-8?B?OExtQ0NETXhNYlNnWkhheHdGakZDZWNocURRK1ZQWTlQN0NzTWd5d3FlR3g0?=
 =?utf-8?B?VnhTaTNGSE53WlpuREwwTVBNTFZJclJ0WXl3RzZzZGNYWnRBYkhXbGUrRHl4?=
 =?utf-8?B?TXA4eW5nYWVDU0ZrWTBJVlplbS9ITFUvWWNJYTNqRlVoay9ENHMyU2JKMTl6?=
 =?utf-8?B?ZWtwVzJrM2VkNUdNZmd6dW5lTlRRSkhxOSswQnRyYnZvOFpodVFiMkp0Z0RJ?=
 =?utf-8?B?ZEpqMmN6RHFMb2xYTG5wUHg4ZU9rczMvUm9LbmFzRWpldkFyZDkyNnlVU3Iy?=
 =?utf-8?B?T215WDFSaHhGMUtWY1VWQVhyYVN1eXhaam5yd0VKQ2U5eXpDbHhpUENmc2sz?=
 =?utf-8?B?OWFPejNYN0gvUGhhR0FRM1doaVJSWGRrWklVd2VSOFdXM0pKaXVIckk1bkJB?=
 =?utf-8?B?UE0vcWZ4czdZY1JJeHZNOGM2SDVHbTRxejB4OWZ5K1NrSHR4blhOREFmalV3?=
 =?utf-8?B?WEFGemVIdG9MRFFhcUpWSnpSOHA4bmdEWUxxcWJpd3JkNytNWi9SVkhaTXBY?=
 =?utf-8?B?eUR1b1FqOTRoV2hYNi9LaXlUdGdiVDZoUW9YZGlTTFFxOHJrWTRoZGh0VkVs?=
 =?utf-8?B?L210cUo5V1J5b2VndHZNSkpVOUFWSDZ3ejA3MGI5SzYrQkVKdTB6SjlHMjZz?=
 =?utf-8?B?ZnRGUVJsZ0FzWHJXdU9KV1ZDaEZxckxxZFA0UkZPRXZqSkIxcGtUWFRzdE45?=
 =?utf-8?B?Vi9hcWIzb0NSdlA1VTBmU3Z3cUNtL1NWVUxmUXNQVTFyQVpYODlScU05eGR5?=
 =?utf-8?B?Tk1HN0ZwZnJqbEhqTDdVb0taeEM0bEFURE5MWlNqNEpxVnk0cXJORzZzZXpo?=
 =?utf-8?B?S3YzK2ZXZnAvSFhzSWZkbEwvdjVvNHJ1ZEt6MXFhVUo3Uk12OCtnYVBKeGJL?=
 =?utf-8?B?VnE5d2pHS0pNMGp0eWRwVjJLdktCN0hvb05tRk52M1NSbUhZMUJ1R1hEKzRH?=
 =?utf-8?B?ajY0N1hNU2x6N2lIOEdRVHhNYStSb0xvWm52ckVPS0hXY2dtdEtNWDNhb2dZ?=
 =?utf-8?B?MFF5NjNnWlFZZE0wYTl3RGYwSFhZNWdPcW05SnZuVm0rMCtEZEpDMnVDUTFr?=
 =?utf-8?B?U1VEWmpUcEoyTDBlYjVLK1hKaVc5TnZBTElneExCcjVUMVcwa1hrRTRIZk1B?=
 =?utf-8?B?N3YwVG9ZTEJybEZ3eVFPOHVRS2s3Qm9xY2Y0ZEUxNElnQkpLWFhPMG43cVh6?=
 =?utf-8?B?NktQdnRXN3I2c0w0Qk1MSTBjYzYzcHd3L1NhOXIyUC9RUk96bDA5bTgzMW5y?=
 =?utf-8?B?YlVVTkR2b0hBdG96TUdnQXpIVUoycVFFcDVtbzAycE16NE5RY0kyQmYweGVT?=
 =?utf-8?B?Vzg2dDBQSjVzdGpQalNEU2ZWRXNQeWh1a2Jsd0xIeGw4U0xOdlpYUzRHYXVY?=
 =?utf-8?B?bGFrVXlib1lvWjBPS3Y0blg1bGV2QWtnSFB3S04wcmVjSnlFYm1hMXo0WHZ4?=
 =?utf-8?B?UTJnejRrL3JTWi9FSVp3M1hTdE5xTXM0M3k1RHdONGh1bGMxWFlXMHQ2azNp?=
 =?utf-8?B?bHBWeml0V0FzOGZiUTFyYktOb0ZTankzdDNHTDdpd3JRRUhTNlJHYmhiVHhx?=
 =?utf-8?B?dFB0QkdWaUp0RkprSVFRQ0svRDJFdFN3dVRwU0dzRUtzZDZVQnZwTHNUNk1R?=
 =?utf-8?B?Mm5yZGJSTUh2RDJBaFhEdDUvOVZRNURBUlpuaGlDR1RsUjJGSzBQU3g5cVJa?=
 =?utf-8?B?VjJCekY3WElRblpDOFV1c1ExcXFyQWpnSXBVazdjbk9JZ3pVNzU0N1djRFli?=
 =?utf-8?Q?qDrexldYZxdRHKQ4L112aTZiasgWxDzG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clNHSFVTZkREN3dKN1NJNklKOXR6b2JWMjFyVTNvVWtIQmpTK0tobTNFYmpm?=
 =?utf-8?B?cGpiZjYyOEdoUXpocHFuSHc2dFNjWFVWZXhqKzRERXZma09zMm5Lc0tDV3dQ?=
 =?utf-8?B?bDkxNjgxWUlnMEUxR1o1RUd3MlR0dFE3NURBbS9WMDFyRC9Gc2htVHh2RTN5?=
 =?utf-8?B?eGxNVmpwYks3T011V0RQaU9DZ3NuRWlheDUyTm1YelJVamxsMEtaeTVLRW5D?=
 =?utf-8?B?Wmw0ZHZqbVk1S1JVR2JKeUVVVVdNZklhUkRzZ2szR2lpZ1VCZTE3dEJ3SW5H?=
 =?utf-8?B?ejBMeU11K291RzI1VUwxU0wwN3ZFdUhmbFNGbTJIWThzUm93dTNwVWZpTzdH?=
 =?utf-8?B?QTZIMitwbFR3WGp1WVJDN2NrRTJ6OW9jcXd0eVVWQkE2Z2NlVVlhSER2WEpV?=
 =?utf-8?B?SnJ2QkV5b05ZVVgwdDZtck9nbkF3R2cyUEp4d2g0QnQ2WHZLU3IxKzU4TDhx?=
 =?utf-8?B?aXR5YkVBWEFkSEZyLzY3bXplSWZTTDZobjVoeE9vY0JseXNxU0YyTTc1M1p4?=
 =?utf-8?B?TmxnZmhWZEEzc0pCK3I3eUlvWDVyZ3BlMGRqTldPTlFpcGJqcXdEbFNYTXk0?=
 =?utf-8?B?MUJPWXJFZHZuWEpyd2ViU0hEcDVwU3hIUGhzcDFUTWl1YVo5N1NpSmwzdW5t?=
 =?utf-8?B?NUVkaFZVam1TRHNrTTVQakc3UWw3MWwyeUo4K1Myc3NYWlVIazBWSUxJbWRm?=
 =?utf-8?B?Z3kwWHNoVW9ZaHdNU3pTN3RIa2NBMDJyS25PRFQxTkNkK3pUSDFjSFlNL3pa?=
 =?utf-8?B?UkZrQ3VXK0RIcHpFZ0tBdGw4MEhkVUNqRjZ5WTJxc3pKRUNkanhBSnRWR3Vm?=
 =?utf-8?B?NzhNU1hNQ0FSZXlqbXozUFBTcGNvelpFcEdEenVKbVgzNW8zb1R5R2N1em9I?=
 =?utf-8?B?bFJ2VGMzTlZjeHd3Y2wycXltcGxpSFJ3aGlheW5RRFRIVzVWVTYzSjE3YzFI?=
 =?utf-8?B?aGExMy93cXpCTEhhcFF6WkRLRDhkeThTTldKcXo0M2NrZHB4ZjNpQTl6V2hD?=
 =?utf-8?B?YTFBNjM0K0h4bEhRbjdxdmxXaEF5MEVSemJydFlxS3FrRzNlVG5jS1hCWlRJ?=
 =?utf-8?B?NW9WdUNEV3ZLS204QlNETnE3bjgwZFBYMTYvUlNGTzZMbk4xUWRkdlBvTnVP?=
 =?utf-8?B?Ynk5ZzAvN1ovNnVlOU9FcDJ4dnI0b21kb1Erc2hnTDUzd0JJSHRJTllmZTll?=
 =?utf-8?B?RUJ4QWMvRzNyd3V1emwyU0oyY1I1WHRaY3FubWROVVVuOXhJTUMwcmVKMDBZ?=
 =?utf-8?B?dzVpVG1nVnhJN0d5d2kycTFZN0ZZa0dMK3dEcjRseUwzd2VnM3dzK0dwNWJ6?=
 =?utf-8?B?cm54aVJLQ1ZOOWZWYk9Ndi9KWEdidWxqYnY0dUMweENSbkVpam1mWXBXa3dy?=
 =?utf-8?B?SmtXWHl0c2tOLzF1aWMxYUp4K2dFbnNhanorS3RUVnR2R1V4NzY4NmFGcVc0?=
 =?utf-8?B?WVM4TDNxSWc2Z2tncllVNTl0RWhPWXZCTkgrU1hNVGh6cUhaL0VYaXR5cThH?=
 =?utf-8?B?M2ZsYXczcTdiNFpFTmZoU1gvUGNSK0F1U3RuMFl6NFZhblplcTI4M0IwU2xG?=
 =?utf-8?B?NmdZSGNpV0xoeE1lOGtDOG80clNZYlZsaGpkUUd4L2hyczdCUjljZ3hUb3Fm?=
 =?utf-8?B?UVBYV2VHT21oTjdvNFpCYS93eng5U1pJN2lFY2hNbUdud0dlTldkUFhtL1VY?=
 =?utf-8?B?Wnc5RXM0ek9yY1MrV2JJSGNhck1ReUdyUExhdHVWd082KzhxYUlSdzRoTm9y?=
 =?utf-8?B?SkZSU0YxNGdWZjBtd3N0Sk9MN2dlTzRWMmlmNUxybEdzMjBVL3V3NW1jd0VX?=
 =?utf-8?B?UlB3a0NIc0h0R1NCeHFERTF0bkJWQjk3dnhndlJjbE5WSVQ2L2haVzhTb29W?=
 =?utf-8?B?SWRWNVNmTVZpdVVEZXZnNjFWcTZobkRqOUtKbE0vUmJ6WHZ3RzZueUVHbzFl?=
 =?utf-8?B?ajFEeTBSbzlISTI5RTgzeDhoc3FZb2JjYXNqTzhiUDIxZ1cxUXZSWGVTVExh?=
 =?utf-8?B?bUJidkcxbHU5T3lHL2xnU3MwbzVuVjkzSEU2eSsvNkJRVGhyekl5QTlXdDBW?=
 =?utf-8?B?RndvOEpVRk4zMDdBUk5hSVljUEdGR1lNVStmQkFvWjIwcDVjWDc3NGQrWWtl?=
 =?utf-8?Q?EiCBWeLjfq+6ymsyA/f4+PxNG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25331737-83b4-4ba6-1c36-08dd4b6fbe8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 14:15:46.6137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9hM3S2jXYmf5p3IB/E+MRDhuXl+Hzem1iK69WIcuTMg05VBJGx5yWtcd9Qi6u0shM4GOH0F0Ke1ZAsQFwooFHiDxRWhVzOCZZBbwCssa4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7346
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaXZpLCBSb2RyaWdvIDxyb2Ry
aWdvLnZpdmlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMjksIDIwMjUg
MTE6NTEgUE0NCj4gVG86IFVzeXNraW4sIEFsZXhhbmRlciA8YWxleGFuZGVyLnVzeXNraW5AaW50
ZWwuY29tPg0KPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT47
IFJpY2hhcmQgV2VpbmJlcmdlcg0KPiA8cmljaGFyZEBub2QuYXQ+OyBWaWduZXNoIFJhZ2hhdmVu
ZHJhIDx2aWduZXNockB0aS5jb20+OyBEZSBNYXJjaGksDQo+IEx1Y2FzIDxsdWNhcy5kZW1hcmNo
aUBpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ow0KPiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgSmFuaQ0K
PiBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT47IEpvb25hcyBMYWh0aW5lbg0K
PiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47IFR2cnRrbyBVcnN1bGluIDx0dXJz
dWxpbkB1cnN1bGluLm5ldD47DQo+IFBvb3NhLCBLYXJ0aGlrIDxrYXJ0aGlrLnBvb3NhQGludGVs
LmNvbT47IEFibGl5ZXYsIFJldXZlbg0KPiA8cmV1dmVuLmFibGl5ZXZAaW50ZWwuY29tPjsgV2Vp
bCwgT3JlbiBqZXIgPG9yZW4uamVyLndlaWxAaW50ZWwuY29tPjsgbGludXgtDQo+IG10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0N
Cj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA3LzExXSBtdGQ6IGludGVsLWRnOiB3YWtlIGNh
cmQgb24gb3BlcmF0aW9ucw0KPiANCj4gT24gV2VkLCBKYW4gMDEsIDIwMjUgYXQgMDU6Mzk6MjFQ
TSArMDIwMCwgQWxleGFuZGVyIFVzeXNraW4gd3JvdGU6DQo+ID4gRW5hYmxlIHJ1bnRpbWUgUE0g
aW4gbXRkIGRyaXZlciB0byBub3RpZnkgZ3JhcGhpY3MgZHJpdmVyIHRoYXQNCj4gPiB3aG9sZSBj
YXJkIHNob3VsZCBiZSBrZXB0IGF3YWtlIHdoaWxlIG52bSBvcGVyYXRpb25zIGFyZQ0KPiA+IHBl
cmZvcm1lZCB0aHJvdWdoIHRoaXMgZHJpdmVyLg0KPiA+DQo+ID4gQ0M6IEx1Y2FzIERlIE1hcmNo
aSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+IEFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRy
aXZlcnMvbXRkL2RldmljZXMvbXRkLWludGVsLWRnLmMgfCA3OSArKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvbXRk
LWludGVsLWRnLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL210ZC0NCj4gaW50ZWwtZGcuYw0KPiA+
IGluZGV4IDIzMGJmNDQ0YjdmZS4uYTg0MTUzODEyMjkxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvbXRkL2RldmljZXMvbXRkLWludGVsLWRnLmMNCj4gPiArKysgYi9kcml2ZXJzL210ZC9kZXZp
Y2VzL210ZC1pbnRlbC1kZy5jDQo+ID4gQEAgLTE1LDExICsxNSwxNCBAQA0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+DQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0aW9ucy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgv
cG1fcnVudGltZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+DQo+ID4gICNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9zaXplcy5oPg0KPiA+ICAj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gPg0KPiA+ICsjZGVmaW5lIElOVEVMX0RHX05WTV9S
UE1fVElNRU9VVCA1MDANCj4gPiArDQo+ID4gIHN0cnVjdCBpbnRlbF9kZ19udm0gew0KPiA+ICAJ
c3RydWN0IGtyZWYgcmVmY250Ow0KPiA+ICAJc3RydWN0IG10ZF9pbmZvIG10ZDsNCj4gPiBAQCAt
NDYwLDYgKzQ2Myw3IEBAIHN0YXRpYyBpbnQgaW50ZWxfZGdfbXRkX2VyYXNlKHN0cnVjdCBtdGRf
aW5mbyAqbXRkLA0KPiBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5mbykNCj4gPiAgCWxvZmZfdCBmcm9t
Ow0KPiA+ICAJc2l6ZV90IGxlbjsNCj4gPiAgCXNpemVfdCB0b3RhbF9sZW47DQo+ID4gKwlpbnQg
cmV0ID0gMDsNCj4gPg0KPiA+ICAJaWYgKFdBUk5fT04oIW52bSkpDQo+ID4gIAkJcmV0dXJuIC1F
SU5WQUw7DQo+ID4gQEAgLTQ3NCwyMCArNDc4LDI4IEBAIHN0YXRpYyBpbnQgaW50ZWxfZGdfbXRk
X2VyYXNlKHN0cnVjdCBtdGRfaW5mbw0KPiAqbXRkLCBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5mbykN
Cj4gPiAgCXRvdGFsX2xlbiA9IGluZm8tPmxlbjsNCj4gPiAgCWFkZHIgPSBpbmZvLT5hZGRyOw0K
PiA+DQo+ID4gKwlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCZtdGQtPmRldik7DQo+
IA0KPiBJJ20gZ2xhZCB3ZSBhcmUgbm90IGFjY2Vzc2luZyB0aGUgcGFyZW50IGRpcmVjdGx5IGhl
cmUgYW55bW9yZSwNCj4gYnV0IHRvIG1lIGl0IGlzIHN0aWxsIHN0cmFuZ2UuDQo+IEkgZmVlbCB0
aGF0IHdlIHNob3VsZCBiZSB1c2luZyAmYXV4X2Rldi0+ZGV2OyBpbnN0ZWFkIG9mIG10ZC0+ZGV2
Lg0KPiANCj4gV2hhdCBhbSBJIG1pc3Npbmc/DQo+IA0KDQphdXhfZGV2LT5kZXYgaXMgdGhlIHBh
cmVudCBkZXZpY2Ugc3RvcmVkIGluIG10ZC0+ZGV2LT5wYXJlbnQNCldoZW4gaW4gcHJldmlvdXMg
dmVyc2lvbiBJIGFjY2VzcyBtdGQtPmRldi0+cGFyZW50LCBJIGFjdHVhbGx5IGFjY2VzcyBhdXhf
ZGV2LT5kZXYuDQoNCk5vdyB3ZSBoYXZlIHJlYWwgbXRkIG1hc3RlciBkcmV2aWNlIGFuZCBjYW4g
cmVseSBvbiBpdCBydW50aW1lX3BtLg0KDQo+ID4gKwlpZiAocmV0IDwgMCkgew0KPiA+ICsJCWRl
dl9lcnIoJm10ZC0+ZGV2LCAicnBtOiBnZXQgZmFpbGVkICVkXG4iLCByZXQpOw0KPiA+ICsJCXJl
dHVybiByZXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJZ3VhcmQobXV0ZXgpKCZudm0tPmxvY2sp
Ow0KPiA+DQo+ID4gIAl3aGlsZSAodG90YWxfbGVuID4gMCkgew0KPiA+ICAJCWlmICghSVNfQUxJ
R05FRChhZGRyLCBTWl80SykgfHwgIUlTX0FMSUdORUQodG90YWxfbGVuLA0KPiBTWl80SykpIHsN
Cj4gPiAgCQkJZGV2X2VycigmbXRkLT5kZXYsICJ1bmFsaWduZWQgZXJhc2UgJWxseCAlenhcbiIs
DQo+IGFkZHIsIHRvdGFsX2xlbik7DQo+ID4gIAkJCWluZm8tPmZhaWxfYWRkciA9IGFkZHI7DQo+
ID4gLQkJCXJldHVybiAtRVJBTkdFOw0KPiA+ICsJCQlyZXQgPSAtRVJBTkdFOw0KPiA+ICsJCQln
b3RvIG91dDsNCj4gPiAgCQl9DQo+ID4NCj4gPiAgCQlpZHggPSBpZGdfbnZtX2dldF9yZWdpb24o
bnZtLCBhZGRyKTsNCj4gPiAgCQlpZiAoaWR4ID49IG52bS0+bnJlZ2lvbnMpIHsNCj4gPiAgCQkJ
ZGV2X2VycigmbXRkLT5kZXYsICJvdXQgb2YgcmFuZ2UiKTsNCj4gPiAgCQkJaW5mby0+ZmFpbF9h
ZGRyID0gTVREX0ZBSUxfQUREUl9VTktOT1dOOw0KPiA+IC0JCQlyZXR1cm4gLUVSQU5HRTsNCj4g
PiArCQkJcmV0ID0gLUVSQU5HRTsNCj4gPiArCQkJZ290byBvdXQ7DQo+ID4gIAkJfQ0KPiA+DQo+
ID4gIAkJZnJvbSA9IGFkZHIgLSBudm0tPnJlZ2lvbnNbaWR4XS5vZmZzZXQ7DQo+ID4gQEAgLTUw
MywxNCArNTE1LDE4IEBAIHN0YXRpYyBpbnQgaW50ZWxfZGdfbXRkX2VyYXNlKHN0cnVjdCBtdGRf
aW5mbw0KPiAqbXRkLCBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5mbykNCj4gPiAgCQlpZiAoYnl0ZXMg
PCAwKSB7DQo+ID4gIAkJCWRldl9kYmcoJm10ZC0+ZGV2LCAiZXJhc2UgZmFpbGVkIHdpdGggJXpk
XG4iLA0KPiBieXRlcyk7DQo+ID4gIAkJCWluZm8tPmZhaWxfYWRkciArPSBudm0tPnJlZ2lvbnNb
aWR4XS5vZmZzZXQ7DQo+ID4gLQkJCXJldHVybiBieXRlczsNCj4gPiArCQkJcmV0ID0gYnl0ZXM7
DQo+ID4gKwkJCWdvdG8gb3V0Ow0KPiA+ICAJCX0NCj4gPg0KPiA+ICAJCWFkZHIgKz0gbGVuOw0K
PiA+ICAJCXRvdGFsX2xlbiAtPSBsZW47DQo+ID4gIAl9DQo+ID4NCj4gPiAtCXJldHVybiAwOw0K
PiA+ICtvdXQ6DQo+ID4gKwlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCZtdGQtPmRldik7DQo+
ID4gKwlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgmbXRkLT5kZXYpOw0KPiA+ICsJcmV0dXJu
IHJldDsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgaW50ZWxfZGdfbXRkX3JlYWQoc3Ry
dWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLCBzaXplX3QgbGVuLA0KPiA+IEBAIC01Mzks
MTcgKzU1NSwyNSBAQCBzdGF0aWMgaW50IGludGVsX2RnX210ZF9yZWFkKHN0cnVjdCBtdGRfaW5m
byAqbXRkLA0KPiBsb2ZmX3QgZnJvbSwgc2l6ZV90IGxlbiwNCj4gPiAgCWlmIChsZW4gPiBudm0t
PnJlZ2lvbnNbaWR4XS5zaXplIC0gZnJvbSkNCj4gPiAgCQlsZW4gPSBudm0tPnJlZ2lvbnNbaWR4
XS5zaXplIC0gZnJvbTsNCj4gPg0KPiA+ICsJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dl
dCgmbXRkLT5kZXYpOw0KPiA+ICsJaWYgKHJldCA8IDApIHsNCj4gPiArCQlkZXZfZXJyKCZtdGQt
PmRldiwgInJwbTogZ2V0IGZhaWxlZCAlemRcbiIsIHJldCk7DQo+ID4gKwkJcmV0dXJuIHJldDsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gIAlndWFyZChtdXRleCkoJm52bS0+bG9jayk7DQo+ID4NCj4g
PiAgCXJldCA9IGlkZ19yZWFkKG52bSwgcmVnaW9uLCBmcm9tLCBsZW4sIGJ1Zik7DQo+ID4gIAlp
ZiAocmV0IDwgMCkgew0KPiA+ICAJCWRldl9kYmcoJm10ZC0+ZGV2LCAicmVhZCBmYWlsZWQgd2l0
aCAlemRcbiIsIHJldCk7DQo+ID4gLQkJcmV0dXJuIHJldDsNCj4gPiArCX0gZWxzZSB7DQo+ID4g
KwkJKnJldGxlbiA9IHJldDsNCj4gPiArCQlyZXQgPSAwOw0KPiA+ICAJfQ0KPiA+DQo+ID4gLQkq
cmV0bGVuID0gcmV0Ow0KPiA+IC0NCj4gPiAtCXJldHVybiAwOw0KPiA+ICsJcG1fcnVudGltZV9t
YXJrX2xhc3RfYnVzeSgmbXRkLT5kZXYpOw0KPiA+ICsJcG1fcnVudGltZV9wdXRfYXV0b3N1c3Bl
bmQoJm10ZC0+ZGV2KTsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0
aWMgaW50IGludGVsX2RnX210ZF93cml0ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IHRv
LCBzaXplX3QgbGVuLA0KPiA+IEBAIC01NzgsMTcgKzYwMiwyNSBAQCBzdGF0aWMgaW50IGludGVs
X2RnX210ZF93cml0ZShzdHJ1Y3QgbXRkX2luZm8NCj4gKm10ZCwgbG9mZl90IHRvLCBzaXplX3Qg
bGVuLA0KPiA+ICAJaWYgKGxlbiA+IG52bS0+cmVnaW9uc1tpZHhdLnNpemUgLSB0bykNCj4gPiAg
CQlsZW4gPSBudm0tPnJlZ2lvbnNbaWR4XS5zaXplIC0gdG87DQo+ID4NCj4gPiArCXJldCA9IHBt
X3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoJm10ZC0+ZGV2KTsNCj4gPiArCWlmIChyZXQgPCAwKSB7
DQo+ID4gKwkJZGV2X2VycigmbXRkLT5kZXYsICJycG06IGdldCBmYWlsZWQgJXpkXG4iLCByZXQp
Ow0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJZ3VhcmQobXV0ZXgp
KCZudm0tPmxvY2spOw0KPiA+DQo+ID4gIAlyZXQgPSBpZGdfd3JpdGUobnZtLCByZWdpb24sIHRv
LCBsZW4sIGJ1Zik7DQo+ID4gIAlpZiAocmV0IDwgMCkgew0KPiA+ICAJCWRldl9kYmcoJm10ZC0+
ZGV2LCAid3JpdGUgZmFpbGVkIHdpdGggJXpkXG4iLCByZXQpOw0KPiA+IC0JCXJldHVybiByZXQ7
DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCSpyZXRsZW4gPSByZXQ7DQo+ID4gKwkJcmV0ID0gMDsN
Cj4gPiAgCX0NCj4gPg0KPiA+IC0JKnJldGxlbiA9IHJldDsNCj4gPiAtDQo+ID4gLQlyZXR1cm4g
MDsNCj4gPiArCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koJm10ZC0+ZGV2KTsNCj4gPiArCXBt
X3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCZtdGQtPmRldik7DQo+ID4gKwlyZXR1cm4gcmV0Ow0K
PiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgaW50ZWxfZGdfbnZtX3JlbGVhc2Uoc3RydWN0
IGtyZWYgKmtyZWYpDQo+ID4gQEAgLTY3MCw2ICs3MDIsMTUgQEAgc3RhdGljIGludCBpbnRlbF9k
Z19udm1faW5pdF9tdGQoc3RydWN0DQo+IGludGVsX2RnX252bSAqbnZtLCBzdHJ1Y3QgZGV2aWNl
ICpkZXZpY2UNCj4gPg0KPiA+ICAJa2ZyZWUocGFydHMpOw0KPiA+DQo+ID4gKwlpZiAocmV0KQ0K
PiA+ICsJCWdvdG8gb3V0Ow0KPiA+ICsNCj4gPiArCWRldm1fcG1fcnVudGltZV9lbmFibGUoJm52
bS0+bXRkLmRldik7DQo+ID4gKw0KPiA+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVs
YXkoJm52bS0+bXRkLmRldiwNCj4gSU5URUxfREdfTlZNX1JQTV9USU1FT1VUKTsNCj4gPiArCXBt
X3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKCZudm0tPm10ZC5kZXYpOw0KPiA+ICsNCj4gPiArb3V0
Og0KPiA+ICAJcmV0dXJuIHJldDsNCj4gPiAgfQ0KPiA+DQo+ID4gQEAgLTcyMCw2ICs3NjEsMTcg
QEAgc3RhdGljIGludCBpbnRlbF9kZ19tdGRfcHJvYmUoc3RydWN0DQo+IGF1eGlsaWFyeV9kZXZp
Y2UgKmF1eF9kZXYsDQo+ID4gIAkJbisrOw0KPiA+ICAJfQ0KPiA+DQo+ID4gKwlkZXZtX3BtX3J1
bnRpbWVfZW5hYmxlKGRldmljZSk7DQo+ID4gKw0KPiA+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1
c3BlbmRfZGVsYXkoZGV2aWNlLA0KPiBJTlRFTF9ER19OVk1fUlBNX1RJTUVPVVQpOw0KPiA+ICsJ
cG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoZGV2aWNlKTsNCj4gPiArDQo+ID4gKwlyZXQgPSBw
bV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGRldmljZSk7DQo+ID4gKwlpZiAocmV0IDwgMCkgew0K
PiA+ICsJCWRldl9lcnIoZGV2aWNlLCAicnBtOiBnZXQgZmFpbGVkICVkXG4iLCByZXQpOw0KPiA+
ICsJCWdvdG8gZXJyX25vcnBtOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgCW52bS0+YmFzZSA9IGRl
dm1faW9yZW1hcF9yZXNvdXJjZShkZXZpY2UsICZpbnZtLT5iYXIpOw0KPiA+ICAJaWYgKElTX0VS
Uihudm0tPmJhc2UpKSB7DQo+ID4gIAkJZGV2X2VycihkZXZpY2UsICJtbWlvIG5vdCBtYXBwZWRc
biIpOw0KPiA+IEBAIC03NDIsOSArNzk0LDEyIEBAIHN0YXRpYyBpbnQgaW50ZWxfZGdfbXRkX3By
b2JlKHN0cnVjdA0KPiBhdXhpbGlhcnlfZGV2aWNlICphdXhfZGV2LA0KPiA+DQo+ID4gIAlkZXZf
c2V0X2RydmRhdGEoJmF1eF9kZXYtPmRldiwgbnZtKTsNCj4gPg0KPiA+ICsJcG1fcnVudGltZV9w
dXQoZGV2aWNlKTsNCj4gPiAgCXJldHVybiAwOw0KPiA+DQo+ID4gIGVycjoNCj4gPiArCXBtX3J1
bnRpbWVfcHV0KGRldmljZSk7DQo+ID4gK2Vycl9ub3JwbToNCj4gPiAgCWtyZWZfcHV0KCZudm0t
PnJlZmNudCwgaW50ZWxfZGdfbnZtX3JlbGVhc2UpOw0KPiA+ICAJcmV0dXJuIHJldDsNCj4gPiAg
fQ0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4NCg==
