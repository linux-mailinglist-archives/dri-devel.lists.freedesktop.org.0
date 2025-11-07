Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38492C3E4EE
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 04:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8AF10E19B;
	Fri,  7 Nov 2025 03:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TS5tTmUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EA010E189;
 Fri,  7 Nov 2025 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762485037; x=1794021037;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cPKyuRtxg55n/P1H3PHN+IrY7utEAJf/c/gOB2EtqmI=;
 b=TS5tTmUMtfq8HOzj6U3H7F6B8m/PgpAdXUVrDpy92EMMCbDST608ZvcR
 l/CUYBglwYDfYdenO4AtOEtneG1BPLU+lDLji7qotlTDsvMqCW00OZHQx
 SJ9mgNXsPtT4HdnBowwTuh62m8yq/+jX6ooyy/Hnyuu2NpAl5oCWtSYNV
 dY6+JAC/khHT8ZTFu9jGHhCQWkHPSHtQGFarkquGGsy/779nwQjdsDrdt
 yY8yTfL/o2l49g57j2jPpLCrjzCTgpakigDlej+dhYEPu3PaoaKlvLow9
 lEHoAPRZrpPm+pDquEKJ5PxejnwetpT/j63DDuQlW/E/GrtaNcxCWVLis g==;
X-CSE-ConnectionGUID: 8F17ZAB1SY26D+yYJSnSoQ==
X-CSE-MsgGUID: OzcnWW/RTLqYS4iq9upqOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64675162"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="64675162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 19:10:36 -0800
X-CSE-ConnectionGUID: gNstoQXhRwSIUIcDqy2Umg==
X-CSE-MsgGUID: T04MKIq+REKIdbNWRK/V5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="187652081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 19:10:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 19:10:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 19:10:36 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 19:10:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDOetzGBe4p+u7kzo2w2pWIf3uJhdUecp3PP1RdoAQKC08CCMqk8LjKOEQL6dbFO1YYCuxiDnxJwYscKDYXTuqP4gRJIPcqceduVedk1s8OQJ4PitOWGL++9iMIBTPjaMAfUdch751qJuwDqyWxx7olK2fWYpfNRIhSt81MSLV5dGaQK1s+lYUdig5MXwvkwYKr3oGuVfhimi/YezRFWFSizUzNiomtr5h64VqNBXRRNBvscSC51AlIu1wzF6Gxxctns4je1uIA3xc474TaKYN3z7ummr80nywtQl28io9M9CElTM4ZJ4lIdVIw1f3tJ8k/mRD420T9BlR4Mr/tuxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPKyuRtxg55n/P1H3PHN+IrY7utEAJf/c/gOB2EtqmI=;
 b=sRT87+tZHVMJTkP7ddqiCrFyrpPqZBK0rcwzTiKIJpV0KTAxU9dIljKLeSkxT02K1anYeTe2JG6zs62us7w9vOzr7pi0vbGDx8FEmzq5LZ04jwR2x7SaUMPIIipVLvOWWMVppKRGTsUyaeMwZYKwLCwaidhztpEUbCJgtRGjyBNFECLppsDlfG7GPqqydfgGBCpHftN2GssQByKPAUZg0wHwC8gwU+w0BuUjlIVQXTRjnNxjjqkcYRubL29WxTIV+krZMJuAlZMrM7BqUk2yIqNkNjpBR953FR+r7ZnB06pVWhO7D/uM1uTqECIuD0LEZxGcdJGiug9nBN58Bhvx8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 03:10:34 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 03:10:34 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>
CC: Alex Williamson <alex@shazbot.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, "Shameer
 Kolothum" <skolothumtho@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "Christoph
 Hellwig" <hch@infradead.org>, "Cabiddu, Giovanni"
 <giovanni.cabiddu@intel.com>, Brett Creeley <brett.creeley@amd.com>
Subject: RE: [PATCH v4 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Thread-Topic: [PATCH v4 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Thread-Index: AQHcTma4AScpX+8jekK4XzUp/ut4Z7TlTUzggAAtqwCAAQu2wA==
Date: Fri, 7 Nov 2025 03:10:33 +0000
Message-ID: <BN9PR11MB52768763573DF22AB978C8228CC3A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-29-michal.winiarski@intel.com>
 <BN9PR11MB52766F70E2D8FD19C154CE958CC2A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7dtl5qum4mfgjosj2mkfqu5u5tu7p2roi2et3env4lhrccmiqi@asemffaeeflr>
In-Reply-To: <7dtl5qum4mfgjosj2mkfqu5u5tu7p2roi2et3env4lhrccmiqi@asemffaeeflr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CH3PR11MB8364:EE_
x-ms-office365-filtering-correlation-id: 8e3acfa7-45a5-4815-94ba-08de1dab376f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aERmZGVPamUwSTYzcXJuVlZtYkR2TEUzaXovY2lrcTA1azBDYUpYeGZ4VytJ?=
 =?utf-8?B?NkZGa2I2M3IwdzhybjNGWkd0Q0IwZHNMdXM0Y3g0NGVkUHd0US90a1NnYVFa?=
 =?utf-8?B?WlZYaVZ6SGtLYkowSlI1eTUrZDlXaVVkMWpVRjQxNzRQV0JwMmJ0NEUvUW9x?=
 =?utf-8?B?QTd3ZjI2NEdoQXBLVU1nSE5zU21wRU92K3dybnMyMGhhbERlTEVXdGtFYVc0?=
 =?utf-8?B?TzZ5elFrNUo0Szl2cFJIUlk1UmZRZ3BzQzJlUERhdDZ6bllJRjAwejRVanRZ?=
 =?utf-8?B?UVd1NkRmcldoMnlaQXhxMFhqRi9uUXZJSEZBTXJhK0NqdHNuZUpiZ1ZZdm9l?=
 =?utf-8?B?RDRYditrMDlVay9ORC9qOXQyKzB0NU1Gekd3T2NRMXg1QklybWJSSTFDVE1a?=
 =?utf-8?B?R2xwa2JZMVF6cUZKUXdVNmVhS0U2QWRTdzRONS9hak4vSTFlT3ZnMGovcy96?=
 =?utf-8?B?Mmwyb1BqNnhIdENTN3ZpdUFsWTk0TWpDZmsvSUFPWllidzFWY1hORlQxMFor?=
 =?utf-8?B?NWduRzgvODAxZHRqN2dBUjA1ajlBQmVhWEMxUkNRaVF3bGNNWUppSmpoY3hZ?=
 =?utf-8?B?ZGFGUUtDc1hwNkI4S2FLdXNyUHlsNHRSYk9yblFSZEVGQmNoRnU3T1BEVTNq?=
 =?utf-8?B?bUV6T1lRWVM4aHpsMUJiM2d5NmU3VUpleUlLUkhmUTJKSTRMdDRPY0dwTVpK?=
 =?utf-8?B?RnRtVU41M0lQZm8rSGZCV0I0bE9IT3Z3d2paUjhUNFN0bmtDZXBRZGpXNHBS?=
 =?utf-8?B?clBCT1RjYktkaDF6aUJ4blVIUmJNdzVSRTFaTCsrVUNiUi9kY2lZM2tBWUMz?=
 =?utf-8?B?UjBuYktyRGZXaFVMeXVIeGFPSFJwS3huaUozN25RRVZzTE83QWJxL2xhdzVq?=
 =?utf-8?B?dTdxa0xENzZnQUFpTVdTOXZqN292eXlLTWtIQjhCNlBtMFZDR3gySEgwU0Vo?=
 =?utf-8?B?RWZQN285Z3JyU01MQWFnaTRET0hteFVGMUFFSG9MTGdnRmU0ekpwQWkvVE10?=
 =?utf-8?B?SXZwNGhQcnF6a3QwU2EwNjM2R1o0NmNnMXhqV3UzT2RQaEpuQ05ncW84UHdQ?=
 =?utf-8?B?S3QxaW1uL1NaMTJyZVZ2QXdxU0x3TWJ5L3RRU2YxL3NoTHcwSitSSWFySm5B?=
 =?utf-8?B?NUFHL3h1M0czd0ZmajZxUUp2d1JXSU51bjNBR3pTSXQrUXIwRmI1bW0rZHlr?=
 =?utf-8?B?ZTloVkVISnRBeVhWUFNTVWhSdjlYeENXdnVwem9nZUZGRmpEL05RVlc1TWZx?=
 =?utf-8?B?MHZocUR1ME5XOGVMYzdHVkRnckZleDFRb3YxeXE5UmlPTmdCM3ZDUytOc3BV?=
 =?utf-8?B?Z3ZkQjVqTVBKTWxBK2lBcFY5RWRiNi9zRnhaVDdxZFBuOXpKRlFlWHZwZVNk?=
 =?utf-8?B?elp0RDExS0Z2MnNiU05xVFVNQjJRZE9qUzhObk1TaWRLUEtWR1lwRGg1UGZN?=
 =?utf-8?B?QTg1c3RNTlJBTDBEQVRwd280eG9vR05GNlZSMkJVV0xDdDVIeEd6U0RvWDRy?=
 =?utf-8?B?OHVyTjZNaXFwdml4Y3JWNHQ1OFhkaE8xMnlabkFnS0R3VUc1SjAwcXpJbzRp?=
 =?utf-8?B?b3M0V1h3N2hCKy9kVkI3Ym1qSUVNWFNYTGpnMndKclFaSS9FWFQyM2F4bWRw?=
 =?utf-8?B?YkVqZ3daaWxIazhxY3hSM0NIaDcyUnB6SGswcXdEV2x3Tit6dzByUnJPR2FP?=
 =?utf-8?B?L1RXMG1rNkViRzFyK3QySXZDc00rYkhUOFIwSk00UXpKdHJ3aWtCdDFRT21q?=
 =?utf-8?B?dlA2V3UyeWFYNmpxVTgzT0IwUmVFRE9sbTllZ00rK1RJSmFnYXk5M01HWmJr?=
 =?utf-8?B?MzY5YWdYSHFFaGJ5Yjc3ZDlWSDhpQ1hJWGdYYkJuOVp5QlE1bzg2SElrazlX?=
 =?utf-8?B?M2pYNmVoaDBHUVhpbS9CczFXUFFIQ0RURXN6c2VacEU2YVlwblluZWNvWW1v?=
 =?utf-8?B?dHNXdlI0NDlQUnQ4MEJOUTg3Q3lkU3Q4QiszWmN4VUJQOXVpNFRrMmNMSVVO?=
 =?utf-8?B?cHRmKzdweWRrNENJeCtneUM4TTBRb1lRL2lKY1d4RlE2R21BS2lnUzVOMjN4?=
 =?utf-8?Q?pjZ2JZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEwzd3FGUUN4Z2k2RTZXSTJ6Nm45WSs3L0tUNkl0WS9tdzBtd3ludHE1aFFU?=
 =?utf-8?B?cnNxNStnYm1VTDltTytwNjUwZFJHMWpvWEhRdmpNNDBZNnhxbzNKSVplekVC?=
 =?utf-8?B?bGV6WUZRdU1DQXMyeGNtOWN1V2ZNTE1iU1dhQXl5OElpRTR0NDlGTmpSQSs1?=
 =?utf-8?B?QzlrakM3UlZsSXZramN0c3AyZGJZV1RGenNBMld1SFVJR0kvcjZmTE1IZk5R?=
 =?utf-8?B?QjV4eTRITGFsWGEwREtCK3NXeXhnRXRHQnEvWXhIdkM5TktFd0NGVHpUTXla?=
 =?utf-8?B?d2RENTJwMU5WeVRjR3NsUlpiTkZ1OE42aXFNMEdMVmZ0RzlESDA5Rml0SCsx?=
 =?utf-8?B?dkgxTjU5aERxc1FaZUpDZ2ZCUVJTWlk3S2tsVFp6SVRxRVZrNnVDY2JEL0J0?=
 =?utf-8?B?RHhiM3djRnVhT3BpYW5yeGxLc2E3amV5MXk1N1RPZWR4OS9NaGlTc1RWWjRM?=
 =?utf-8?B?UUo4b2JhckM5bWxIaEgvSTM4M0ZsSVVuWGk0RU9wMGVyVW9pTDY2SnhiWDNR?=
 =?utf-8?B?WXYxd0JTMEJFcUVHa0xqeXdSV2FQUmxlTDNXZVBxdVk3VnVaeG9HZW42Yktu?=
 =?utf-8?B?N2lCWlFNdkdGVmJoell5b3RZNDZsNCtieTEvNjhBOURrQUl2MzkvTGh4cW1N?=
 =?utf-8?B?c09ldElJR2xCa3owY0RMcDRsM2lxRFNKRjdOMXV4cGd4OERDWjR0YUJsM3Fq?=
 =?utf-8?B?Z0RnMXE2d1JISzZ4UmhLREd6SzlUU3g0bXFITWw5S0Q0cWw4Q1p3b1M4VDgw?=
 =?utf-8?B?QmpRZkVXcXRPb1pvOS9vMGZQOUVsU3pZay85YWkyU2hPZlc1UHlDa1BBMkVB?=
 =?utf-8?B?S3Q0QlplUmRpamhRcjhrVitnNTI3Yk42clVCNXBzWDZyVTM4UVJxdUVudUNr?=
 =?utf-8?B?NU1lNEY3VEtlYnRlRlBwd0NXbjVHbXdPQUw2ZXJOK25KSGJjelU3djQ4UUtI?=
 =?utf-8?B?aWVoRkFCdXVWOG1VaTNtaUluMmpsdGlQK2piR3BtWlZaRGdCMWUwREFRYVR0?=
 =?utf-8?B?UHBoSGkrbVhEclg0dDRRaVZncDl6R1RtMFY4Wld2Z1RaZWp1azlDMk9IUUFn?=
 =?utf-8?B?OVBOYUJVWkdodHRKcVZSVGNydkhXd0lFdmp5K245b2JaZm5JK1NUR0VIbXM0?=
 =?utf-8?B?ZmVwbmdJTnF2M0pxYnQyZ3dzMS9qeENrMVBwcVBVQ2R3eGpldjBqOS9NN2xt?=
 =?utf-8?B?V1Y5aHJPODNTYVVscDhCcUpJN0FzSFRpLzlFdWFsQ1NyMXg2K3E5UGFxanpG?=
 =?utf-8?B?enNzTmRUNzlxWDJEbVQyd2J1bER4a2ZpWHkxQldjdHpyZmJkdXZJRmZNYVht?=
 =?utf-8?B?Q01wS2dOZ09nck1oZ2w3ZjJHWURRN2czdytiTFdZNkVvUzJkblFPWnkyUUkx?=
 =?utf-8?B?OU4rcW1LcSswbkVlWDdTQVdqOStQQzVMNFh2bmo1clV4bWd6RjJOdEIzMDJp?=
 =?utf-8?B?NkNvemVnZ1JNVklLR0xTUXc3VVczWUh4bCthcnVvZGxjRzcvK3U1eWRlUUhn?=
 =?utf-8?B?ck03ZnlvOGxlSWNPc040QjdIV1RHL0NsaURSTlcrN0l0d1RoR1lxSU5kcHlI?=
 =?utf-8?B?MC9hRlVFajYyT2J6Vjk4RnVWUEE3cjlDMENHTnArQlZNY01meTJzNGc1dW1P?=
 =?utf-8?B?WU5xdUNrbjBBKzlkVms2WWFGdHlkSCtVYXFWZ0FtY3BOSHBNcGxkenA2Z3Nu?=
 =?utf-8?B?SmdJcW1IOHBURWMyU3VaSytldm5wZXRjMHhhcDV3dklDSUhGSUJaMXRmRFZD?=
 =?utf-8?B?ZzliK3RXNmF6dWZVUW5uaDRINmVCRUE5UEV5Y3FGTW5qVzFiTmJ1aWFCWGdo?=
 =?utf-8?B?VStHdTQ0TDlLWXlOVk9HL3Iya1pyNzFNZ2NMSmE5bUE3ajFwbFlKZTVDVGY0?=
 =?utf-8?B?REZReGRJWUF0RHNsSkliWko3dm96QktMczVuVlE3UnhMLzcrMmpUdUt0NjRY?=
 =?utf-8?B?TGNQZVVjR0U0dHJLNUprVERvTE9lTTNWb2JielNZVlhFOGdJRGoxK1c5NWJu?=
 =?utf-8?B?RHdLSjFPYjJRQmt5djh2eDZXZUVBRmhXZVJzL1ZNb1pYbE11M3F0WW9wK085?=
 =?utf-8?B?SGlqTXVrc3A3aEdQTW9ZMlZpZXVzR3ZWaE5EWmFhcUw5NlgwaE9uZ2tqcVFY?=
 =?utf-8?Q?ehn/GdVyIn3qlDUsaQx96ogL3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3acfa7-45a5-4815-94ba-08de1dab376f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 03:10:33.9693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4O7G0e600nMIi3wTseoUut8ttbBdf36ZPyK+OXwAoKEP0sBErdSnc92aL3nQiF775G1YmtxFhgRHwt24UzRMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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

PiBGcm9tOiBXaW5pYXJza2ksIE1pY2hhbCA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQo+
IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA2LCAyMDI1IDY6NTYgUE0NCj4gDQo+IE9uIFRodSwg
Tm92IDA2LCAyMDI1IGF0IDA5OjIwOjM2QU0gKzAxMDAsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+
DQo+ID4gdGhpcyBkZWZlcnJlZF9yZXNldCBsb2dpYyBpcyBhIG1seCB1bmlxdWUgdGhpbmcuIFNl
ZToNCj4gPg0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8yMDI0MDIyMDEzMjQ1OS5H
TTEzMzMwQG52aWRpYS5jb20vDQo+IA0KPiBJbnRlcmVzdGluZywgdGhhdCBkb2Vzbid0IG1hdGNo
IG15IG9ic2VydmF0aW9ucy4NCj4gDQo+IFtdID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiBbXSBXQVJOSU5HOiBwb3NzaWJsZSBjaXJjdWxh
ciBsb2NraW5nIGRlcGVuZGVuY3kgZGV0ZWN0ZWQNCj4gW10gNi4xOC4wLXJjMy14ZSsgIzkwIFRh
aW50ZWQ6IEcgUyAgIFUNCj4gW10gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+IFtdIHFlbXUtc3lzdGVtLXg4Ni80Mzc1IGlzIHRyeWluZyB0
byBhY3F1aXJlIGxvY2s6DQo+IFtdIGZmMTEwMDAxNWFmM2VjMzAgKCZtaWdmLT5sb2NrKXsrLisu
fS17MzozfSwgYXQ6DQo+IHhlX3ZmaW9fcGNpX3NldF9kZXZpY2Vfc3RhdGUrMHgyMmIvMHg0NDAg
W3hlX3ZmaW9fcGNpXQ0KPiBbXQ0KPiAgICBidXQgdGFzayBpcyBhbHJlYWR5IGhvbGRpbmcgbG9j
azoNCj4gW10gZmYxMTAwMDE0YzU0MWE1OCAoJnhlX3ZkZXYtPnN0YXRlX211dGV4KXsrLisufS17
MzozfSwgYXQ6DQo+IHhlX3ZmaW9fcGNpX3NldF9kZXZpY2Vfc3RhdGUrMHg0My8weDQ0MCBbeGVf
dmZpb19wY2ldDQo+IFtdDQo+ICAgIHdoaWNoIGxvY2sgYWxyZWFkeSBkZXBlbmRzIG9uIHRoZSBu
ZXcgbG9jay4NCj4gDQo+IFtdDQo+ICAgIHRoZSBleGlzdGluZyBkZXBlbmRlbmN5IGNoYWluIChp
biByZXZlcnNlIG9yZGVyKSBpczoNCj4gW10NCj4gICAgLT4gIzMgKCZ4ZV92ZGV2LT5zdGF0ZV9t
dXRleCl7Ky4rLn0tezM6M306DQo+IFtdICAgICAgICBfX211dGV4X2xvY2srMHhiYS8weDExMTAN
Cj4gW10gICAgICAgIG11dGV4X2xvY2tfbmVzdGVkKzB4MWIvMHgzMA0KPiBbXSAgICAgICAgeGVf
dmZpb19wY2lfcmVzZXRfZG9uZSsweDJiLzB4YzAgW3hlX3ZmaW9fcGNpXQ0KPiBbXSAgICAgICAg
cGNpX3RyeV9yZXNldF9mdW5jdGlvbisweGQ3LzB4MTUwDQo+IFtdICAgICAgICB2ZmlvX3BjaV9j
b3JlX2lvY3RsKzB4N2YxLzB4ZjIwIFt2ZmlvX3BjaV9jb3JlXQ0KPiBbXSAgICAgICAgdmZpb19k
ZXZpY2VfZm9wc191bmxfaW9jdGwrMHgxNjMvMHgzMTAgW3ZmaW9dDQo+IFtdICAgICAgICBfX3Nl
X3N5c19pb2N0bCsweDcxLzB4YzANCj4gW10gICAgICAgIF9feDY0X3N5c19pb2N0bCsweDFkLzB4
MzANCj4gW10gICAgICAgIHg2NF9zeXNfY2FsbCsweDZhYy8weGU1MA0KPiBbXSAgICAgICAgZG9f
c3lzY2FsbF82NCsweGExLzB4NTYwDQo+IFtdICAgICAgICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVy
X2h3ZnJhbWUrMHg0Yi8weDUzDQo+IFtdDQo+ICAgIC0+ICMyICgmdmRldi0+bWVtb3J5X2xvY2sp
eysrKyt9LXszOjN9Og0KPiBbXSAgICAgICAgZG93bl9yZWFkKzB4NDEvMHgxODANCj4gW10gICAg
ICAgIHZmaW9fcGNpX21tYXBfaHVnZV9mYXVsdCsweGVjLzB4MzEwIFt2ZmlvX3BjaV9jb3JlXQ0K
PiBbXSAgICAgICAgaGFuZGxlX21tX2ZhdWx0KzB4OGFhLzB4MTNiMA0KPiBbXSAgICAgICAgZml4
dXBfdXNlcl9mYXVsdCsweDEyNC8weDI4MA0KPiBbXSAgICAgICAgdmFkZHJfZ2V0X3BmbnMrMHgx
ZDIvMHg0MjAgW3ZmaW9faW9tbXVfdHlwZTFdDQo+IFtdICAgICAgICB2ZmlvX3Bpbl9wYWdlc19y
ZW1vdGUrMHgxNzMvMHg2MTAgW3ZmaW9faW9tbXVfdHlwZTFdDQo+IFtdICAgICAgICB2ZmlvX3Bp
bl9tYXBfZG1hKzB4ZmQvMHgzNDAgW3ZmaW9faW9tbXVfdHlwZTFdDQo+IFtdICAgICAgICB2Zmlv
X2lvbW11X3R5cGUxX2lvY3RsKzB4ZmRmLzB4MTI5MCBbdmZpb19pb21tdV90eXBlMV0NCj4gW10g
ICAgICAgIHZmaW9fZm9wc191bmxfaW9jdGwrMHgxMDYvMHgzNDAgW3ZmaW9dDQo+IFtdICAgICAg
ICBfX3NlX3N5c19pb2N0bCsweDcxLzB4YzANCj4gW10gICAgICAgIF9feDY0X3N5c19pb2N0bCsw
eDFkLzB4MzANCj4gW10gICAgICAgIHg2NF9zeXNfY2FsbCsweDZhYy8weGU1MA0KPiBbXSAgICAg
ICAgZG9fc3lzY2FsbF82NCsweGExLzB4NTYwDQo+IFtdICAgICAgICBlbnRyeV9TWVNDQUxMXzY0
X2FmdGVyX2h3ZnJhbWUrMHg0Yi8weDUzDQo+IFtdDQo+ICAgIC0+ICMxICgmbW0tPm1tYXBfbG9j
ayl7KysrK30tezM6M306DQo+IFtdICAgICAgICBfX21pZ2h0X2ZhdWx0KzB4NTYvMHg5MA0KPiBb
XSAgICAgICAgX2NvcHlfdG9fdXNlcisweDIzLzB4NzANCj4gW10gICAgICAgIHhlX3NyaW92X21p
Z3JhdGlvbl9kYXRhX3JlYWQrMHgxN2IvMHgzZjAgW3hlXQ0KPiBbXSAgICAgICAgeGVfc3Jpb3Zf
dmZpb19kYXRhX3JlYWQrMHg0NC8weDYwIFt4ZV0NCj4gW10gICAgICAgIHhlX3ZmaW9fcGNpX3Nh
dmVfcmVhZCsweDU1LzB4ODAgW3hlX3ZmaW9fcGNpXQ0KPiBbXSAgICAgICAgdmZzX3JlYWQrMHhj
MC8weDMwMA0KPiBbXSAgICAgICAga3N5c19yZWFkKzB4NzkvMHhmMA0KPiBbXSAgICAgICAgX194
NjRfc3lzX3JlYWQrMHgxYi8weDMwDQo+IFtdICAgICAgICB4NjRfc3lzX2NhbGwrMHhjYzQvMHhl
NTANCj4gW10gICAgICAgIGRvX3N5c2NhbGxfNjQrMHhhMS8weDU2MA0KPiBbXSAgICAgICAgZW50
cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NGIvMHg1Mw0KPiBbXQ0KPiAgICAtPiAjMCAo
Jm1pZ2YtPmxvY2speysuKy59LXszOjN9Og0KPiBbXSAgICAgICAgX19sb2NrX2FjcXVpcmUrMHgx
YWZmLzB4MzQ1MA0KPiBbXSAgICAgICAgbG9ja19hY3F1aXJlKzB4ZGUvMHgyODANCj4gW10gICAg
ICAgIF9fbXV0ZXhfbG9jaysweGJhLzB4MTExMA0KPiBbXSAgICAgICAgbXV0ZXhfbG9ja19uZXN0
ZWQrMHgxYi8weDMwDQo+IFtdICAgICAgICB4ZV92ZmlvX3BjaV9zZXRfZGV2aWNlX3N0YXRlKzB4
MjJiLzB4NDQwIFt4ZV92ZmlvX3BjaV0NCj4gW10gICAgICAgIHZmaW9faW9jdGxfZGV2aWNlX2Zl
YXR1cmVfbWlnX2RldmljZV9zdGF0ZSsweDljLzB4MWIwIFt2ZmlvXQ0KPiBbXSAgICAgICAgdmZp
b19kZXZpY2VfZm9wc191bmxfaW9jdGwrMHgyODkvMHgzMTAgW3ZmaW9dDQo+IFtdICAgICAgICBf
X3NlX3N5c19pb2N0bCsweDcxLzB4YzANCj4gW10gICAgICAgIF9feDY0X3N5c19pb2N0bCsweDFk
LzB4MzANCj4gW10gICAgICAgIHg2NF9zeXNfY2FsbCsweDZhYy8weGU1MA0KPiBbXSAgICAgICAg
ZG9fc3lzY2FsbF82NCsweGExLzB4NTYwDQo+IFtdICAgICAgICBlbnRyeV9TWVNDQUxMXzY0X2Fm
dGVyX2h3ZnJhbWUrMHg0Yi8weDUzDQo+IFtdDQo+ICAgIG90aGVyIGluZm8gdGhhdCBtaWdodCBo
ZWxwIHVzIGRlYnVnIHRoaXM6DQo+IA0KPiBbXSBDaGFpbiBleGlzdHMgb2Y6DQo+ICAgICAgJm1p
Z2YtPmxvY2sgLS0+ICZ2ZGV2LT5tZW1vcnlfbG9jayAtLT4gJnhlX3ZkZXYtPnN0YXRlX211dGV4
DQo+IA0KPiBbXSAgUG9zc2libGUgdW5zYWZlIGxvY2tpbmcgc2NlbmFyaW86DQo+IA0KPiBbXSAg
ICAgICAgQ1BVMCAgICAgICAgICAgICAgICAgICAgQ1BVMQ0KPiBbXSAgICAgICAgLS0tLSAgICAg
ICAgICAgICAgICAgICAgLS0tLQ0KPiBbXSAgIGxvY2soJnhlX3ZkZXYtPnN0YXRlX211dGV4KTsN
Cj4gW10gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2soJnZkZXYtPm1lbW9yeV9s
b2NrKTsNCj4gW10gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2soJnhlX3ZkZXYt
PnN0YXRlX211dGV4KTsNCj4gW10gICBsb2NrKCZtaWdmLT5sb2NrKTsNCj4gW10NCj4gICAgICoq
KiBERUFETE9DSyAqKioNCj4gDQo+IFtdIDEgbG9jayBoZWxkIGJ5IHFlbXUtc3lzdGVtLXg4Ni80
Mzc1Og0KPiBbXSAgIzA6IGZmMTEwMDAxNGM1NDFhNTggKCZ4ZV92ZGV2LT5zdGF0ZV9tdXRleCl7
Ky4rLn0tezM6M30sIGF0Og0KPiB4ZV92ZmlvX3BjaV9zZXRfZGV2aWNlX3N0YXRlKzB4NDMvMHg0
NDAgW3hlX3ZmaW9fcGNpXQ0KPiBbXQ0KPiAgICBzdGFjayBiYWNrdHJhY2U6DQo+IFtdIENQVTog
MTggVUlEOiAwIFBJRDogNDM3NSBDb21tOiBxZW11LXN5c3RlbS14ODYgVGFpbnRlZDogRyBTICAg
VQ0KPiA2LjE4LjAtcmMzLXhlKyAjOTAgUFJFRU1QVCh2b2x1bnRhcnkpDQo+IFtdIFRhaW50ZWQ6
IFtTXT1DUFVfT1VUX09GX1NQRUMsIFtVXT1VU0VSDQo+IFtdIEhhcmR3YXJlIG5hbWU6IEludGVs
IENvcnBvcmF0aW9uIFdISVRMRVkvV0hJVExFWSwgQklPUw0KPiBTRTVDNjIwMC44NkIuMDAyNy5Q
MTguMjIwNjA5MDg1NiAwNi8wOS8yMDIyDQo+IFtdIENhbGwgVHJhY2U6DQo+IFtdICA8VEFTSz4N
Cj4gW10gIF9fZHVtcF9zdGFjaysweDE5LzB4MzANCj4gW10gIGR1bXBfc3RhY2tfbHZsKzB4NjYv
MHg5MA0KPiBbXSAgZHVtcF9zdGFjaysweDEwLzB4MTQNCj4gW10gIHByaW50X2NpcmN1bGFyX2J1
ZysweDJmZC8weDMxMA0KPiBbXSAgY2hlY2tfbm9uY2lyY3VsYXIrMHgxMzkvMHgxNjANCj4gW10g
IF9fbG9ja19hY3F1aXJlKzB4MWFmZi8weDM0NTANCj4gW10gID8gdnByaW50a19lbWl0KzB4M2Vj
LzB4NTYwDQo+IFtdICA/IGRldl92cHJpbnRrX2VtaXQrMHgxNjIvMHgxYzANCj4gW10gIGxvY2tf
YWNxdWlyZSsweGRlLzB4MjgwDQo+IFtdICA/IHhlX3ZmaW9fcGNpX3NldF9kZXZpY2Vfc3RhdGUr
MHgyMmIvMHg0NDAgW3hlX3ZmaW9fcGNpXQ0KPiBbXSAgPyB4ZV92ZmlvX3BjaV9zZXRfZGV2aWNl
X3N0YXRlKzB4MjJiLzB4NDQwIFt4ZV92ZmlvX3BjaV0NCj4gW10gIF9fbXV0ZXhfbG9jaysweGJh
LzB4MTExMA0KPiBbXSAgPyB4ZV92ZmlvX3BjaV9zZXRfZGV2aWNlX3N0YXRlKzB4MjJiLzB4NDQw
IFt4ZV92ZmlvX3BjaV0NCj4gW10gIG11dGV4X2xvY2tfbmVzdGVkKzB4MWIvMHgzMA0KPiBbXSAg
eGVfdmZpb19wY2lfc2V0X2RldmljZV9zdGF0ZSsweDIyYi8weDQ0MCBbeGVfdmZpb19wY2ldDQo+
IFtdICB2ZmlvX2lvY3RsX2RldmljZV9mZWF0dXJlX21pZ19kZXZpY2Vfc3RhdGUrMHg5Yy8weDFi
MCBbdmZpb10NCj4gW10gIHZmaW9fZGV2aWNlX2ZvcHNfdW5sX2lvY3RsKzB4Mjg5LzB4MzEwIFt2
ZmlvXQ0KPiBbXSAgX19zZV9zeXNfaW9jdGwrMHg3MS8weGMwDQo+IFtdICA/IGVudHJ5X1NZU0NB
TExfNjRfYWZ0ZXJfaHdmcmFtZSsweDRiLzB4NTMNCj4gW10gIF9feDY0X3N5c19pb2N0bCsweDFk
LzB4MzANCj4gW10gIHg2NF9zeXNfY2FsbCsweDZhYy8weGU1MA0KPiBbXSAgZG9fc3lzY2FsbF82
NCsweGExLzB4NTYwDQo+IFtdICA/IF9fbG9ja19hY3F1aXJlKzB4NzNmLzB4MzQ1MA0KPiBbXSAg
PyBfX2xvY2tfYWNxdWlyZSsweDczZi8weDM0NTANCj4gW10gID8gX19sb2NrX2FjcXVpcmUrMHg3
M2YvMHgzNDUwDQo+IFtdICA/IGxvY2tfcmVsZWFzZSsweDEwYi8weDM0MA0KPiBbXSAgPyB3cF9w
YWdlX3JldXNlKzB4ODIvMHgxMDANCj4gW10gID8gbG9ja19yZWxlYXNlKzB4MTBiLzB4MzQwDQo+
IFtdICA/IHdwX3BhZ2VfcmV1c2UrMHhjYy8weDEwMA0KPiBbXSAgPyBsb2NrX2FjcXVpcmUrMHhk
ZS8weDI4MA0KPiBbXSAgPyBjb3VudF9tZW1jZ19ldmVudF9tbSsweDIwLzB4MTcwDQo+IFtdICA/
IGxvY2tfaXNfaGVsZF90eXBlKzB4OGYvMHgxNDANCj4gW10gID8gbG9ja19yZWxlYXNlKzB4MTBi
LzB4MzQwDQo+IFtdICA/IGNvdW50X21lbWNnX2V2ZW50X21tKzB4MjAvMHgxNzANCj4gW10gID8g
Y291bnRfbWVtY2dfZXZlbnRfbW0rMHgyMC8weDE3MA0KPiBbXSAgPyBjb3VudF9tZW1jZ19ldmVu
dF9tbSsweDIwLzB4MTcwDQo+IFtdICA/IGNvdW50X21lbWNnX2V2ZW50X21tKzB4MTE0LzB4MTcw
DQo+IFtdICA/IGhhbmRsZV9tbV9mYXVsdCsweDEzMDAvMHgxM2IwDQo+IFtdICA/IGhhbmRsZV9t
bV9mYXVsdCsweDNjLzB4MTNiMA0KPiBbXSAgPyBsb2NrX3ZtYV91bmRlcl9yY3UrMHg4Yy8weDIz
MA0KPiBbXSAgPyBsb2NrX3JlbGVhc2UrMHgxMGIvMHgzNDANCj4gW10gID8gZXhjX3BhZ2VfZmF1
bHQrMHg3Ny8weGYwDQo+IFtdICA/IGlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKzB4MTAwLzB4
MTMwDQo+IFtdICA/IGlycWVudHJ5X2V4aXQrMHgzMS8weDgwDQo+IFtdICBlbnRyeV9TWVNDQUxM
XzY0X2FmdGVyX2h3ZnJhbWUrMHg0Yi8weDUzDQo+IFtdIFJJUDogMDAzMzoweDcwZGZmMDMyZWIx
ZA0KPiBbXSBDb2RlOiAwNCAyNSAyOCAwMCAwMCAwMCA0OCA4OSA0NSBjOCAzMSBjMCA0OCA4ZCA0
NSAxMCBjNyA0NSBiMCAxMCAwMCAwMCAwMA0KPiA0OCA4OSA0NSBiOCA0OCA4ZCA0NSBkMCA0OCA4
OSA0NSBjMCBiOCAxMCAwMCAwMCAwMCAwZiAwNSA8ODk+IGMyIDNkIDAwIGYwIGZmIGZmDQo+IDc3
IDFhIDQ4IDhiIDQ1IGM4IDY0IDQ4IDJiIDA0IDI1IDI4IDAwIDAwIDAwDQo+IFtdIFJTUDogMDAy
YjowMDAwN2ZmY2MwMzY3ZmYwIEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6DQo+IDAwMDAwMDAw
MDAwMDAwMTANCj4gW10gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDU3NDhlMDQ2ZDYw
MCBSQ1g6IDAwMDA3MGRmZjAzMmViMWQNCj4gW10gUkRYOiAwMDAwN2ZmY2MwMzY4MDgwIFJTSTog
MDAwMDAwMDAwMDAwM2I3NSBSREk6IDAwMDAwMDAwMDAwMDAwMWQNCj4gW10gUkJQOiAwMDAwN2Zm
Y2MwMzY4MDQwIFIwODogMDAwMDAwMDU3NDhkZjY2MyBSMDk6IDAwMDAwMDAwMDAwMDAwMDcNCj4g
W10gUjEwOiAwMDAwNTc0OGRmNjYzMDYwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDAw
MDAwMDAwMDAwMDENCj4gW10gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogMDAwMDU3NDhlMDU1
ZjBiMCBSMTU6IDAwMDA3ZmZjYzAzNjgwODANCj4gW10gIDwvVEFTSz4NCj4gDQo+IEluIHNob3J0
Og0KPiANCj4gMDogc2V0X2RldmljZV9zdGF0ZQ0KPiB4ZV92ZGV2LT5zdGF0ZV9tdXRleCA6IG1p
Z2YtPmxvY2sNCj4gMTogZGF0YV9yZWFkDQo+IG1pZ2YtPmxvY2sgOiBtbS0+bW1hcF9sb2NrDQo+
IDI6IHZmaW9fcGluX2RtYQ0KPiBtbS0+bW1hcF9sb2NrIDogdmRldi0+bWVtb3J5X2xvY2sNCj4g
MzogdmZpb19wY2lfaW9jdGxfcmVzZXQNCj4gdmRldi0+bWVtb3J5X2xvY2sgOiB4ZV92ZGV2LT5z
dGF0ZV9tdXRleA0KDQpvaCB0aGF0J3MgYSBnb29kIHNwb3QhDQoNClByZXZpb3VzIGRlYWRsb2Nr
IHJlcXVpcmVzIDMgcGFydGllcywgZHVlIHRvIGNvcHlfZnJvbS90b191c2VyKCkNCnVuZGVyIHN0
YXRlX211dGV4Og0KDQowOiBzZXRfZGV2aWNlX3N0YXRlDQp2ZGV2LT5zdGF0ZV9tdXRleCA6IG1t
LT5tbWFwX2xvY2sNCjI6IHZmaW9fcGluX2RtYQ0KbW0tPm1tYXBfbG9jayA6IHZkZXYtPm1lbW9y
eV9sb2NrDQozOiB2ZmlvX3BjaV9pb2N0bF9yZXNldA0KdmRldi0+bWVtb3J5X2xvY2sgOiB2ZGV2
LT5zdGF0ZV9tdXRleA0KDQpOb3cgd2l0aCBtaWdmLT5sb2NrIGFuZCB0aGUgYWRkaXRpb25hbCBw
YXRoIG9mIGRhdGFfcmVhZCBpdCBiZWNvbWVzDQphIDQtcGFydGllcyBnYW1lLiBhbmQgbG9va3Mg
aXQncyBjb21tb24uDQoNCj4gDQo+IEluIG90aGVyIHdvcmRzOg0KPiBzZXRfZGV2aWNlX3N0YXRl
IHRha2VzIHhlX3ZkZXYtPnN0YXRlX211dGV4IGFuZCBibG9ja3Mgb24gbWlnZi0+bG9jaywNCj4g
ZGF0YV9yZWFkIHRha2VzIG1pZ2YtPmxvY2sgYW5kIGJsb2NrcyBvbiBtbS0+bW1hcF9sb2NrDQo+
IHZmaW9fcGluX2RtYSB0YWtlcyBtbS0+bW1hcF9sb2NrIGFuZCBibG9ja3Mgb24gdmRldi0+bWVt
b3J5X2xvY2sNCj4gcmVzZXQgdGFrZXMgdmRldi0+bWVtb3J5X2xvY2sgYW5kIGJsb2NrcyBvbiB4
ZV92ZGV2LT5zdGF0ZV9tdXRleA0KPiANCj4gY29weV90b191c2VyL2NvcHlfZnJvbV91c2VyIGRv
ZXNuJ3QgaGF2ZSB0byBiZSBjYWxsZWQgdW5kZXIgc3RhdGVfbXV0ZXgsDQo+IGl0IGp1c3QgbmVl
ZHMgdG8gYmUgdGFrZW4gdW5kZXIgbWlnZi0+bG9jay4NCj4gVGhlIGRlZmVycmVkIHJlc2V0IHRy
aWNrIGV4aXN0cyBiZWNhdXNlIG1pZ2YtPmxvY2sgbmVlZHMgdG8gYmUgdGFrZW4NCj4gdW5kZXIg
c3RhdGVfbXV0ZXggYXMgcGFydCBvZiByZXNldF9kb25lIGNhbGxiYWNrLCB3aGljaCBjb21wbGV0
ZXMgdGhlDQo+IGNoYWluIGFuZCB0cmlnZ2VycyB0aGUgbG9ja2RlcCBzcGxhdC4NCg0KdGhpcyBj
aGFpbiBkb2Vzbid0IGV2ZW4gcmVhY2ggbWlnZi0+bG9jayBpbiB0aGUgcmVzZXQgcGF0aC4gSXQn
cyB0cmlnZ2VyZWQNCmFscmVhZHksIHdoZW4gYWNxdWlyaW5nIHN0YXRlX211dGV4Lg0KDQo+IA0K
PiBUbyBtZSwgaXQgbG9va3MgbGlrZSBzb21ldGhpbmcgZ2VuZXJpYywgdGhhdCB3aWxsIGhhdmUg
aW1wYWN0IG9uIGFueQ0KPiBkZXZpY2Ugc3BlY2lmaWMgZHJpdmVyIHZhcmlhbnQuDQo+IFdoYXQg
YW0gSSBtaXNzaW5nPw0KPiANCj4gSSB3b25kZXIgaWYgZHJpdmVycyB0aGF0IGRvbid0IGltcGxl
bWVudCB0aGUgZGVmZXJyZWQgcmVzZXQgdHJpY2sgd2VyZQ0KPiBldmVyIGV4ZWN1dGVkIHdpdGgg
bG9ja2RlcCBlbmFibGVkLg0KPiANCg0KQEphc29uLCBAWWlzaGFpLCBAU2hhbWVlciwgQEdpb3Zh
bm5pLCBAQnJldHQ6DQoNClNvdW5kcyBpdCdzIGEgcmlnaHQgdGhpbmcgdG8gcHVsbCBiYWNrIHRo
ZSBkZWZlcnJlZCByZXNldCB0cmljayBpbnRvDQpldmVyeSBkcml2ZXIuIGFueXRoaW5nIG92ZXJs
b29rZWQ/DQo=
