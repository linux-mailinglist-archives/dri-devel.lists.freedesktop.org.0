Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FFDACE498
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 21:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DC810E7F3;
	Wed,  4 Jun 2025 19:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFGOWGqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B490110E7E4;
 Wed,  4 Jun 2025 19:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749063667; x=1780599667;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kSuz5uPOyC2CE1pIwodL81z8Pz1Agv9CXgAHwkG/KHQ=;
 b=cFGOWGqi/brFyqZrSwJXr0FtsRadLk5W2NPNJum+Aqq+egkoDHZKvxRh
 eO6E2ySuLIFZOt+Pauk4w11i8Fvj3aN3qG5YgWdl0ZkEz8jEe2wHWbr/m
 dG7dyAOFPHa2XXFlz961XjJFdhXe47fe/i/NUa7ZWKDBhxObV4xbQsuOl
 lVCwJLLIvFHAlwav5LC8VG3MPQAqG9M1AvmXZFKi+IdVijvj1RJlIc8vR
 /DWptS3usg4txCHgaIycvpmBejFf0kKgmUwyg0L/alAgNOwzRyr7tgsyb
 3VkV9M1qkNT3sAPnFUCci6ej+/v+p5fHojVFGqLrQK3gvEU9CwlFexZH6 A==;
X-CSE-ConnectionGUID: bznUpy7yTdSv6n1OP3i4Gg==
X-CSE-MsgGUID: NmPGu9PRSne2OW91BWClKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62553940"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="62553940"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:59:40 -0700
X-CSE-ConnectionGUID: qALKIVM/ScuOKkUfxQhASw==
X-CSE-MsgGUID: +uBNk5MqSuSLhBjHEAC7wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145145224"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:59:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 11:59:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 11:59:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 11:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSwx5jZxYaabmOp/7X+q4SPX1YvlXpnbdAxF96UfCdSHdcNpi93SjxDAU5mx6/6xi1fqknoeo+HQpl1tqn2V/YbfZdRiMulxhRdYO0pbOUN9esQf+SZdvoNyVIYR4YDilgtP2Dtki0erVkrSPp2/gCZHkYqjypp+mei9YEiEfH4tZzpTjsK0KEssLnya6ZLK71sFJ00giOVde2h42uWN/PuBhozvMy2ih6F51QK4WQ7w5V3kteKsruymVcPefBDm1HZlL+BhPMH7lGXLaaWoEqw5JwmXqG6lBZPlKPsFOMIS7/nVHXJqd9XklJKosIN8/1cazRbjHGwL7ii80kgpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSuz5uPOyC2CE1pIwodL81z8Pz1Agv9CXgAHwkG/KHQ=;
 b=e7RrDp8A1DLyBXdt1oeaiblqhVS6C2GS1JOrnU4blG4ENWessEMNBn7ioj90vtaL0yR8yuJdEDYg+kzRgr2+0BNcaVtUpfFLbYZCE9ZgLZEN18TxZ9wtsK0iSv4045IT3qs3PczgiHF6VK7QtpKYzdBJUAyl8+D4lJyTW1yaJr0Z2eWFhXnR+9d4KWjbM/MunOwe2eixf2Cvu1vHiiLp7AecvgOCTkecyS3JyFWFV1D+HK1ltrWj8kcMq/4eyTE0O/H3kNGLj6RsRi4Vbp7ujA/5ujiIzFrPzPIJjPLCMY0tWXYUU4q6o9XbyRNZHCxtWNytbQ9CaQ8qnLhUr3mx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Wed, 4 Jun 2025 18:59:22 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%5]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 18:59:22 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, Pekka Paalanen
 <pekka.paalanen@collabora.com>
CC: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "leo.liu@amd.com" <leo.liu@amd.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah, Chaitanya
 Kumar" <chaitanya.kumar.borah@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Topic: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Index: AQHbnqqz2YhtxDgq7E6gFv3ZntqEdLOkXCdQgAACfoCAAAPEoIAAj/AAgAAWPQCAOdBI4IAMv5WAgAXmbmCAAC6cAIAAoNiAgAF4/SA=
Date: Wed, 4 Jun 2025 18:59:22 +0000
Message-ID: <DM4PR11MB636037A3F51B4062BE199C4AF46CA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
 <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <3ca1958f-62e0-4a5c-837b-3cd705acc181@amd.com>
 <ZqHOWK3X_Ici9wNgijgeUt9r3asi4jhqw-0-keIfXYAFxbsGLaFTIozGHHR64SnkAzPA4CM-zmc6OwVtrKMKjVyoblti88KpRf9wEu8daP0=@emersion.fr>
 <DM4PR11MB6360CE0C5C99FB02CD6CC0BFF499A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20250530165818.0e6cb846@eldfell>
 <DM4PR11MB6360BFCB5756A16F38945DE7F46DA@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20250603135108.603fa6e6@eldfell>
 <f80f66d1-38a8-4e45-ba63-ae2427c91317@amd.com>
In-Reply-To: <f80f66d1-38a8-4e45-ba63-ae2427c91317@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA0PR11MB7693:EE_
x-ms-office365-filtering-correlation-id: 34e044c8-8ffa-47cd-a49b-08dda399eb12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MjZ0dUtZV20yVFlKbENOZFRvaFNvTE5wR3JRMWxDdHZ5bDhxblk2dTFKTEF0?=
 =?utf-8?B?RGZNeStvS1ZpM281UDFiQ0twZE1BZzBKeE1xZjhpMGJuUFFPZFFLQmtmOEt1?=
 =?utf-8?B?RVp5S3I5azFQamxNcWFSZFVQSnhMcTZFZWZrT3h2VUNaTjQ5OW93dWNiQ0dD?=
 =?utf-8?B?ZGdQKzE4ek1CVk1ZbzhCS0lBMlVUWXYvaTUyalNOZFBWR0wyTTZvWUFoeTds?=
 =?utf-8?B?LytMUG5nNE5OM01XRmdoNWs0WVNDck5HMW5OUGcvOWg2c2l6NVBlV21rZ2JV?=
 =?utf-8?B?cGJCZjQvcWNwV1dROG1BOWhCY2VVMlRqb0ZaVzVlbk1CWDI1ejcxWjMwNnNE?=
 =?utf-8?B?aE1IQnBjLytmdFNNbHhKMkFlcGhHejZxd0pYOHJTRlExaDlMblNDNVFRWUR4?=
 =?utf-8?B?akhWbEJwQWxQcTd2dXRFUG9JZndtUWw4TG4wN0ZHY2t6NWd4QXBlRlZrZllw?=
 =?utf-8?B?TXJkTlNQLzlmK3FqU0ErNmIvZHhjTllXM3FKK0V6YksvSlJQNzcrcnhaSjBV?=
 =?utf-8?B?UjgwTlA5UTJXNTFVWnFmdFkrVjN2cWNLY2I2dlRPbEZ5dE5HUHdqNWMyNHBX?=
 =?utf-8?B?bVBwa1AvVUxLdnRMZUY3UjF3ZGFvOVpBYVZZN1o4VTdZVHlYTGQyZmcxQWpo?=
 =?utf-8?B?RGE2d2RZRzdsM01KVjEwYzI2S3JPYkx6ekpuQ1J4ckZYRHYzQncyRzE1dlhT?=
 =?utf-8?B?QVlyRmJtVFRoK0ZhODNTS3kxZ3FCT09IOE0rcjkwVDVFd2s1NGRBejlqOW4r?=
 =?utf-8?B?ZUdJVnkzZ0tkWE9OVGljVGovd0R2M21VNUJTazdTZGJCODU2dG5JQ2hFVG56?=
 =?utf-8?B?WlpqTm1MNGxVMUF6N3luSXI2eGluRnNOblJVNVRXTUpKaklSUDROY0ZhUTVY?=
 =?utf-8?B?Nm0zVjNDeHE0RzhTVldSQ3ppSzF3QTZmUHZvQ1pQQzZKNjVaM3VlZlNvZk93?=
 =?utf-8?B?cEQwd3RJY0hoN1ZRQjZxUzVXc2tXV3VXRmNtOHFsTi9lYU9tbnBOMjNJNUta?=
 =?utf-8?B?MUFEeFNaYThMQWV1NTFMNFNMT1RqdUFXTEJBc2NjMEJubWlhcVFJNTNJQ0xv?=
 =?utf-8?B?K0h6d2ZGZFdKUkJPNTA2b0ExMVc1aS9tTERwTVRDVjdkT2pMVXJwN0RSUlZM?=
 =?utf-8?B?QVNPd002RGpIelRGaDkzcndETGFoNGFTVlcrUmxkeTU1OHBMa2NUUnF2SXdv?=
 =?utf-8?B?eTNGUlJ1MzY2cVduV0I1SUt6clhQdkJyOWZzei9GekUvUzV1d2tpdUY4aXdy?=
 =?utf-8?B?bUdiZjFqR0NGN0RPZ1lDeDVwd3E3MkhQbW5VUzZ6L3VTUGUydkJ1dUJzdW1S?=
 =?utf-8?B?dFNVOFMyOHZ3bWoySG9OSThDalVJb25MNzMxenFpNEg2SE9MeXphR1FmSnRm?=
 =?utf-8?B?dkZPcXNja1ExTDY2UXNSNzVKM2dKcFcwR1pUbXhZVjI0MkkrQTN3ZVo3VjA1?=
 =?utf-8?B?c044V3BsTE5ObytSUHRFYzR5Njd3d2dtbHJySjBqeWZwVWtiMXBiK2RtTThN?=
 =?utf-8?B?ZFhQeHhWNVdLUk4rTTQyVUM2Z2VpbDVGWkVEY0FYSlh2b2pRNkM3cFh6dFdE?=
 =?utf-8?B?ck5CeGpZTkpZaUFSQnVwWFphdHlGNmY3ak8ycVNINVVveTRFSG1IcFZjQSt1?=
 =?utf-8?B?ckIwaEIzTFExTzdZK2RlVlJkZTNZRzBRb3BPeVdLRkhiK2NNSWtFS0VtQ0dD?=
 =?utf-8?B?UUZoOEsveFlRN0I2UzZOdGdVMmN6WUpCKzBhNStPOFp3a2RBYi9TMmdwaFhB?=
 =?utf-8?B?MlV0dGJ5d29Hc0dRaGVWU0xKMUlrMkJxWU0wMklnUG4rZVN5dnB1TytCY1da?=
 =?utf-8?B?RzB0YUh4ZVd0Vk1pN3UvVGIxZnQrb3h5T21BUTVoSjB5RDZxdDZRSTlEcGJz?=
 =?utf-8?B?OE5WYkdqZ2pLbjdWQnhJVURHWFF4dWhUUUhycmhlak1BZnQ0NW90ODM0NTZt?=
 =?utf-8?Q?hnXpEibIyiw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWF4cHUxZGowU3UrV1lsM3JYZU5pQWxuTUE1K09xNFNOYWdUTzdDcDhDb3dL?=
 =?utf-8?B?REkwNEsyQnZibWVjbVo1Zkt5WDgyYi9CUlZxQmlpbkZuYjdxK1M0NU13eDlW?=
 =?utf-8?B?M3hGRTNKUmszejEyYXpSbjArcG0xZ2tCVmlTRUw0MkFmNGdSSWhiUlBabzBx?=
 =?utf-8?B?cTUrekxKNWVkVEZ2aGhNUHpZT29GWWFCcno2WGkxUWtwSHpzK3RuSkJHdXE1?=
 =?utf-8?B?ME5PWkpxSzVVekVpcXkyK2RCejNFd1ROYnZGK0NkdTFWTGRBaHdsdWR5Q3Z3?=
 =?utf-8?B?bTFwUmpuZjU5b3cyMEFwTDl2Y3l5RlhERFZwQjVCWFJOSkFTRTUxU0NseTlj?=
 =?utf-8?B?L0pqS0U2Tm1sNlZpR2hyaU9YY1VrMkgrbmY4eGRDMGwxclZPMk9Sekl5U3Fi?=
 =?utf-8?B?NmxZMTV2NEY4NU53UEJ3eFpiSENGMmVGVDhaWU9LcVBINjdxSnhZZEdZKzRz?=
 =?utf-8?B?NTVQdm53R29PeW9HdXJFSk5KZXhkR3B4UU9rSllyNndOZU9USkFqd2JQeE5H?=
 =?utf-8?B?VzBLTWNYTDdMc0lrTVQ2M2xNa2cxcWhuTUQwd2QxK0JxV2JmVXFBZEdFUDJR?=
 =?utf-8?B?czQwcm1QVkVFdGdOaldiTmxDM3RoV1B6MlVGZ2tCYlZiTWRzOTBBbWI1NzJn?=
 =?utf-8?B?WTFRTk1aWTV6azZOWS84QlRVL05zZ2trNVNiTzNzRmFxWVN1bGtVSkxaNlVl?=
 =?utf-8?B?OGlHSnU1SFZRSGNkWTVKY1dQYVdFQWRIZS9yM1ZGVjEzQzN0a3NpaHRncElp?=
 =?utf-8?B?WHBtTlRVZTByd1FjUVlSUEgrNzhxbVNzb0pvdXBaS0FseUprK2hzbUxZb0sv?=
 =?utf-8?B?b3RPU2FoVEozK3lxRnVEMWlNaHNEUHQ2V2FRNnRSZ1ZBdzd0Wmg2WHhuTkNF?=
 =?utf-8?B?QW9jOGJFWGI0MUZsQmU1MHEwOE8xbXBsMDdsS1pkYW9jb0FKOEZPaUFHeGow?=
 =?utf-8?B?VVFtVldKOVVPTFFMVzBCM0d0QklUdzRhM1NxREgvSWJINUh0K1A5UGdLRFFq?=
 =?utf-8?B?M3hDRkhBVUE5Yll3Qk5keWRreUh6bzcwUGRscGxZT0ZpWHArYW91Y0FkeGdT?=
 =?utf-8?B?L29QY1Bib2cyYzBkbFEyM3hVTUkwY216UlE1M2hITHE5cGp2ME5oQkFBaTU4?=
 =?utf-8?B?ajdKSS9aTGF0Y2hsNjczRnNkc2p2V2xRUWxZeUpMMDROYlJjb1ZJV1E5K2NS?=
 =?utf-8?B?RDF5YTJVSzZtV3JiajFYTm1iMVRacDl3by96YVMzTmQrVUZpcCs3dTZUTy8y?=
 =?utf-8?B?Z1hjRzV4bXpRNFhNVnhZalJWaWJNWFlaRVhyb1BqUVdLdC9BdTNjbXRkV3pJ?=
 =?utf-8?B?MHpZY08rQkQxWHQ3LzJqOUxpVE83SnU2eFkrc3kwa05jcHFoQTQ5eVFkZDJZ?=
 =?utf-8?B?Q2ptKzI4QWJ3STBCWWQ2WXpuMlRqZC9iSERpWTdMUFI2L0NERnNDK0ExT1J3?=
 =?utf-8?B?TUs5amtjalRsNkNGSU8wdG5HbGJKZmI5Ukllb1dNMFVqS1M5Wnc1a3lEYzdX?=
 =?utf-8?B?RFY1clplSUM4VDZCZ0oyRjhaT2xIMEIxeFc5b2hMdm5JajE3aVVCMnFxNTVa?=
 =?utf-8?B?ZHBvWjVWY1ozdmliVytmOXFrR2dXdmJlRTlMNDdmZjQ0ZlQwWXZTSUtMUzk2?=
 =?utf-8?B?U0dpVFVUc0RmY1lMWlFhREc2ZFpFeTk0QlQ0K2NQbFYzTEJRdWlXNUdRdmx5?=
 =?utf-8?B?YjlRK3RJT3I1MWRLZk1tUkxuQWZkakZaMmhZRVJkeTZpUUxNc2JWTUpBalZZ?=
 =?utf-8?B?TjF4YTRHWCtjdlhtMy9JNUJZQWw2bGxkb0EveFduL2lON1RreU1qU3NsWXg2?=
 =?utf-8?B?WXpZUllFeEZZMnRJRTVxZytTeGE4Q1FYVncrV25PYWh1a3h6WnlMN0UvaDFv?=
 =?utf-8?B?aktjUkdiYW5lWnhLRUNYZDFteGExUUFZclBOaDVRekdSZEVDN29aQzNTMFg3?=
 =?utf-8?B?Q01NQld6dWdNYUgzeG1HZmdYRmYzby9LYjVwQTFVT1REbjdNTzNRZG5LQXNu?=
 =?utf-8?B?T3c5LzFvWUFJNzdCUytoQllyZzlHeTBvZWV1bmtYWmZCVzQxenE0dEtGNEdD?=
 =?utf-8?B?aVdTaDEzYjZMZWt3WjZIOC9TT3JTc003RURnU3NqZjNwUmZrYUxXMFROQ1hD?=
 =?utf-8?Q?GVxtIDkkhcAvX/bPVhdTOBaM7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e044c8-8ffa-47cd-a49b-08dda399eb12
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 18:59:22.5476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JcFzqfl15ql+cagPGlHxA4NHkXcrzJCmWprjI6jevpRHm28HEwh5wAQG8Hh1Cr+qscmOeqWLBzqzkl5lZfTGUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFycnkgV2VudGxhbmQg
PGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSA0LCAyMDI1
IDE6NTcgQU0NCj4gVG86IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEu
Y29tPjsgU2hhbmthciwgVW1hDQo+IDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+IENjOiBTaW1v
biBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+OyBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29t
PjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgd2F5bGFu
ZC1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGxlby5saXVAYW1kLmNvbTsgdmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb207IG13ZW5AaWdhbGlhLmNvbTsNCj4gamFkYWhsQHJlZGhh
dC5jb207IHNlYmFzdGlhbi53aWNrQHJlZGhhdC5jb207IHNoYXNoYW5rLnNoYXJtYUBhbWQuY29t
Ow0KPiBhZ29pbnNAbnZpZGlhLmNvbTsgam9zaHVhQGZyb2dnaS5lczsgbWRhZW56ZXJAcmVkaGF0
LmNvbTsNCj4gYWxlaXhwb2xAa2RlLm9yZzsgeGF2ZXIuaHVnbEBnbWFpbC5jb207IHZpY3Rvcmlh
QHN5c3RlbTc2LmNvbTsNCj4gZGFuaWVsQGZmd2xsLmNoOyBxdWljX25hc2VlckBxdWljaW5jLmNv
bTsgcXVpY19jYnJhZ2FAcXVpY2luYy5jb207DQo+IHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb207
IG1hcmNhbkBtYXJjYW4uc3Q7IExpdml1LkR1ZGF1QGFybS5jb207DQo+IHNhc2hhbWNpbnRvc2hA
Z29vZ2xlLmNvbTsgQm9yYWgsIENoYWl0YW55YSBLdW1hcg0KPiA8Y2hhaXRhbnlhLmt1bWFyLmJv
cmFoQGludGVsLmNvbT47IGxvdWlzLmNoYXV2ZXRAYm9vdGxpbi5jb20NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCBWOCAzMi80M10gZHJtL2NvbG9yb3A6IEFkZCAxRCBDdXJ2ZSBDdXN0b20gTFVUIHR5
cGUNCj4gDQo+IA0KPiANCj4gT24gMjAyNS0wNi0wMyAwNjo1MSwgUGVra2EgUGFhbGFuZW4gd3Jv
dGU6DQo+ID4gT24gVHVlLCAzIEp1biAyMDI1IDA4OjMwOjIzICswMDAwDQo+ID4gIlNoYW5rYXIs
IFVtYSIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+PiBGcm9tOiBQZWtrYSBQYWFsYW5lbiA8cGVra2EucGFh
bGFuZW5AY29sbGFib3JhLmNvbT4NCj4gPj4+IFNlbnQ6IEZyaWRheSwgTWF5IDMwLCAyMDI1IDc6
MjggUE0NCj4gPj4+IFRvOiBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4g
Pj4+IENjOiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+OyBIYXJyeSBXZW50bGFuZA0K
PiA+Pj4gPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+OyBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQu
Y29tPjsgZHJpLQ0KPiA+Pj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+ID4+PiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyB3YXlsYW5kLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPj4+IGxlby5saXVA
YW1kLmNvbTsgdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb207DQo+ID4+PiBwZWtrYS5wYWFs
YW5lbkBjb2xsYWJvcmEuY29tOyBtd2VuQGlnYWxpYS5jb207IGphZGFobEByZWRoYXQuY29tOw0K
PiA+Pj4gc2ViYXN0aWFuLndpY2tAcmVkaGF0LmNvbTsgc2hhc2hhbmsuc2hhcm1hQGFtZC5jb207
DQo+ID4+PiBhZ29pbnNAbnZpZGlhLmNvbTsgam9zaHVhQGZyb2dnaS5lczsgbWRhZW56ZXJAcmVk
aGF0LmNvbTsNCj4gPj4+IGFsZWl4cG9sQGtkZS5vcmc7IHhhdmVyLmh1Z2xAZ21haWwuY29tOyB2
aWN0b3JpYUBzeXN0ZW03Ni5jb207DQo+ID4+PiBkYW5pZWxAZmZ3bGwuY2g7IHF1aWNfbmFzZWVy
QHF1aWNpbmMuY29tOyBxdWljX2NicmFnYUBxdWljaW5jLmNvbTsNCj4gPj4+IHF1aWNfYWJoaW5h
dmtAcXVpY2luYy5jb207IG1hcmNhbkBtYXJjYW4uc3Q7IExpdml1LkR1ZGF1QGFybS5jb207DQo+
ID4+PiBzYXNoYW1jaW50b3NoQGdvb2dsZS5jb207IEJvcmFoLCBDaGFpdGFueWEgS3VtYXINCj4g
Pj4+IDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPjsgbG91aXMuY2hhdXZldEBib290
bGluLmNvbQ0KPiA+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCBWOCAzMi80M10gZHJtL2NvbG9yb3A6
IEFkZCAxRCBDdXJ2ZSBDdXN0b20gTFVUDQo+ID4+PiB0eXBlDQo+ID4+Pg0KPiA+Pj4gT24gVGh1
LCAyMiBNYXkgMjAyNSAxMTozMzowMCArMDAwMA0KPiA+Pj4gIlNoYW5rYXIsIFVtYSIgPHVtYS5z
aGFua2FyQGludGVsLmNvbT4gd3JvdGU6DQo+ID4+Pg0KPiA+Pj4+IE9uZSByZXF1ZXN0IHRob3Vn
aDogQ2FuIHdlIGVuaGFuY2UgdGhlIGx1dCBzYW1wbGVzIGZyb20gZXhpc3RpbmcNCj4gPj4+PiAx
NmJpdHMgdG8gMzJiaXRzIGFzIGx1dCBwcmVjaXNpb24gaXMgZ29pbmcgdG8gYmUgbW9yZSB0aGFu
IDE2IGluIGNlcnRhaW4NCj4gaGFyZHdhcmUuDQo+ID4+PiBXaGlsZSBhZGRpbmcgdGhlIG5ldyBV
QVBJLCBsZXRzIGV4dGVuZCB0aGlzIHRvIDMyIHRvIG1ha2UgaXQgZnV0dXJlIHByb29mLg0KPiA+
Pj4+IFJlZmVyZW5jZToNCj4gPj4+PiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvNjQyNTkyLz9zZXJpZXM9MTI5ODExJnJldj00DQo+ID4+Pj4NCj4gPj4+PiArLyoqDQo+
ID4+Pj4gKyAqIHN0cnVjdCBkcm1fY29sb3JfbHV0XzMyIC0gUmVwcmVzZW50cyBoaWdoIHByZWNp
c2lvbiBsdXQgdmFsdWVzDQo+ID4+Pj4gKyAqDQo+ID4+Pj4gKyAqIENyZWF0aW5nIDMyIGJpdCBw
YWxldHRlIGVudHJpZXMgZm9yIGJldHRlciBkYXRhDQo+ID4+Pj4gKyAqIHByZWNpc2lvbi4gVGhp
cyB3aWxsIGJlIHJlcXVpcmVkIGZvciBIRFIgYW5kDQo+ID4+Pj4gKyAqIHNpbWlsYXIgY29sb3Ig
cHJvY2Vzc2luZyB1c2VjYXNlcy4NCj4gPj4+PiArICovDQo+ID4+Pj4gK3N0cnVjdCBkcm1fY29s
b3JfbHV0XzMyIHsNCj4gPj4+PiArCS8qDQo+ID4+Pj4gKwkgKiBEYXRhIGZvciBoaWdoIHByZWNp
c2lvbiBMVVRzDQo+ID4+Pj4gKwkgKi8NCj4gPj4+PiArCV9fdTMyIHJlZDsNCj4gPj4+PiArCV9f
dTMyIGdyZWVuOw0KPiA+Pj4+ICsJX191MzIgYmx1ZTsNCj4gPj4+PiArCV9fdTMyIHJlc2VydmVk
Ow0KPiA+Pj4+ICt9Ow0KPiA+Pj4NCj4gPj4+IEhpLA0KPiA+Pj4NCj4gPj4+IEkgc3VwcG9zZSB5
b3UgbmVlZCB0aGlzIG11Y2ggcHJlY2lzaW9uIGZvciBvcHRpY2FsIGRhdGE/IElmIHNvLA0KPiA+
Pj4gZmxvYXRpbmctcG9pbnQgd291bGQgYmUgbXVjaCBtb3JlIGFwcHJvcHJpYXRlIGFuZCB3ZSBj
b3VsZCBwcm9iYWJseSBrZWVwDQo+IDE2LWJpdCBzdG9yYWdlLg0KPiA+Pj4NCj4gPj4+IFdoYXQg
ZG9lcyB0aGUgIm1vcmUgdGhhbiAxNi1iaXQiIGhhcmR3YXJlIGFjdHVhbGx5IHVzZT8gSVNUUiBh
dA0KPiA+Pj4gbGVhc3QgQU1EIGhhdmluZyBzb21lIHNvcnQgb2YgZmxvYXQnaXNoIHBvaW50IGlu
dGVybmFsIHBpcGVsaW5lPw0KPiA+Pj4NCj4gPj4+IFRoaXMgc291bmRzIHRoZSBzYW1lIHRoaW5n
IGFzIG5vbi11bmlmb3JtbHkgZGlzdHJpYnV0ZWQgdGFwcyBpbiBhIExVVC4NCj4gPj4+IFRoYXQg
bWltaWNzIGZsb2F0aW5nLXBvaW50IGlucHV0IHdoaWxlIHRoaXMgZmVlbHMgbGlrZSBmbG9hdGlu
Zy1wb2ludCBvdXRwdXQgb2YgYQ0KPiBMVVQuDQo+ID4+Pg0KPiA+Pj4gSSd2ZSByZWNlbnRseSBk
ZWNpZGVkIGZvciBteXNlbGYgKGFuZCBXZXN0b24pIHRoYXQgSSB3aWxsIG5ldmVyDQo+ID4+PiBz
dG9yZSBvcHRpY2FsIGRhdGEgaW4gYW4gaW50ZWdlciBmb3JtYXQsIGJlY2F1c2UgaXQgaXMgZmFy
IHRvbw0KPiA+Pj4gd2FzdGVmdWwuIFRoYXQncyB3aHkgdGhlIGVsZWN0cmljYWwgZW5jb2Rpbmdz
IGxpa2UgcG93ZXItMi4yIGFyZSBzbyB1c2VmdWwsIG5vdA0KPiBqdXN0IGZvciBlbXVsYXRpbmcg
YSBDUlQuDQo+ID4+DQo+ID4+IEhpIFBla2thLA0KPiA+PiBJbnRlcm5hbCBwaXBlbGluZSBpbiBo
YXJkd2FyZSBjYW4gb3BlcmF0ZSBhdCBoaWdoZXIgcHJlY2lzaW9uIHRoYW4NCj4gPj4gdGhlIGlu
cHV0IGZyYW1lYnVmZmVyIHRvIHBsYW5lIGVuZ2luZXMuIFNvLCBpbiBjYXNlIHdlIGhhdmUgb3B0
aWNhbA0KPiA+PiBkYXRhIG9mIDE2Yml0cyBvciAxMGJpdHMgcHJlY2lzaW9uLCBoYXJkd2FyZSBj
YW4gc2NhbGUgdGhpcyB1cCB0bw0KPiA+PiBoaWdoZXIgcHJlY2lzaW9uIGluIGludGVybmFsIHBp
cGVsaW5lIGluIGhhcmR3YXJlIHRvIHRha2UgY2FyZSBvZg0KPiA+PiByb3VuZGluZyBhbmQgb3Zl
cmZsb3cgaXNzdWVzLiBFdmVuIEZQMTYgb3B0aWNhbCBkYXRhIHdpbGwgYmUgbm9ybWFsaXplZCBh
bmQNCj4gY29udmVydGVkIGludGVybmFsbHkgZm9yIGZ1cnRoZXIgcHJvY2Vzc2luZy4NCj4gPg0K
PiA+IElzIGl0IGludGVnZXIgb3IgZmxvYXRpbmctcG9pbnQ/DQo+ID4NCj4gDQo+IEZvciBBTUQg
dGhlIGludGVybmFsIGZvcm1hdCBpcyBmbG9hdGluZyBwb2ludCB3aXRoIHNsaWdodGx5IGhpZ2hl
ciBwcmVjaXNpb24gdGhhbg0KPiBGUDE2Lg0KPiANCj4gPiBJZiB3ZSB0YWtlIHRoZSBmdWxsIHJh
bmdlIG9mIFBRIGFzIG9wdGljYWwgYW5kIHB1dCBpdCBpbnRvIDE2LWJpdA0KPiA+IGludGVnZXIg
Zm9ybWF0LCB0aGUgbHVtaW5hbmNlIHN0ZXAgZnJvbSBjb2RlIDEgdG8gY29kZSAyIGlzIDAuMTUg
Y2QvbcKyLg0KPiA+IFRoYXQgc2VlbXMgbGlrZSBhIGh1Z2Ugc3RlcCBpbiB0aGUgZGFyayBlbmQu
IFN1Y2ggYSBzdGVwIHdvdWxkDQo+ID4gcHJvYmFibHkgbmVlZCB0byBiZSBkaXZpZGVkIG92ZXIg
c2V2ZXJhbCB0YXBzIGluIGEgTFVULCB3aGljaCB3b3VsZG4ndA0KPiA+IGJlIHBvc3NpYmxlLg0K
PiA+DQo+IA0KPiBSaWdodCwgYW5kIHdpdGggMzItYnBjIHdlJ2xsIGdldCBhIGx1bWluYW5jZSBz
dGVwIHNpemUgb2YNCj4gfjAuMDAwMDAyMyBjZC9tXjIsIHdoaWNoIHNlZW1zIHBsZW50eSBmaW5l
LWdyYWluZWQuDQo+IA0KPiA+IEluIHRoYXQgc2Vuc2UsIGlmIGEgTFVUIGlzIHVzZWQgZm9yIHRo
ZSBQUSBFT1RGLCBJIHRvdGFsbHkgYWdyZWUgdGhhdA0KPiA+IDE2LWJpdCBpbnRlZ2VyIHdvbid0
IGJlIGV2ZW4gbmVhcmx5IGVub3VnaCBwcmVjaXNpb24uDQo+ID4NCj4gPiBUaGlzIGFjdHVhbGx5
IHBvaW50cyBvdXQgdGhlIGNhdmVhdCB0aGF0IGluY3JlYXNpbmcgdGhlIG51bWJlciBvZiB0YXBz
DQo+ID4gaW4gYSBMVVQgY2FuIGNhdXNlIHRoZSBMVVQgdG8gYmVjb21lIG5vbi1tb25vdG9uaWMg
d2hlbiB0aGUgc2FtcGxlDQo+ID4gcHJlY2lzaW9uIHJ1bnMgb3V0LiBUaGF0IGlzLCBjb25zZWN1
dGl2ZSB0YXBzIGRvbid0IGFsd2F5cyBpbmNyZWFzZSBpbg0KPiA+IHZhbHVlLg0KPiA+DQo+ID4+
IElucHV0IHRvIExVVCBoYXJkd2FyZSBjYW4gYmUgMTZiaXRzIG9yIGV2ZW4gaGlnaGVyLCBzbyB0
aGUgbG9vayB1cA0KPiA+PiB0YWJsZSB3ZSBwcm9ncmFtIGNhbiBiZSBvZiBoaWdoZXIgcHJlY2lz
aW9uIHRoYW4gMTYgKGNlcnRhaW4gY2FzZXMgMjQNCj4gPj4gaW4gSW50ZWwgcGlwZWxpbmUpLiBU
aGlzIGlzIGxhdGVyIHRydW5jYXRlZCB0byBicGMgc3VwcG9ydGVkIGluIG91dHB1dCBmb3JtYXRz
IGZyb20NCj4gc3luYyAoMTAsIDEyIG9yIDE2KSwgbW9zdGx5IGZvciBlbGVjdHJpY2FsIHZhbHVl
IHRvIGJlIHNlbnQgdG8gc2luay4NCj4gPj4NCj4gPj4gSGVuY2UgcmVxdWVzdGluZyB0byBpbmNy
ZWFzZSB0aGUgY29udGFpbmVyIGZyb20gY3VycmVudCB1MTYgdG8gdTMyLA0KPiA+PiB0byBnZXQg
YWR2YW50YWdlIG9mIGhpZ2hlciBwcmVjaXNpb24gbHV0cy4NCj4gPg0KPiA+IE15IGFyZ3VtZW50
IHRob3VnaCBpcyB0byB1c2UgYSBmbG9hdGluZy1wb2ludCBmb3JtYXQgZm9yIHRoZSBMVVQNCj4g
PiBzYW1wbGVzIGluc3RlYWQgb2YgYWRkaW5nIG1vcmUgYW5kIG1vcmUgaW50ZWdlciBiaXRzLiBU
aGF0IG5hdHVyYWxseQ0KPiA+IHB1dHMgbW9yZSBwcmVjaXNpb24gd2hlcmUgaXQgaXMgbmVlZGVk
OiBuZWFyIHplcm8uDQo+ID4NCj4gPiBBIGRyaXZlciBjYW4gZWFzaWx5IGNvbnZlcnQgdGhhdCB0
byBhbnkgZm9ybWF0IHRoZSBoYXJkd2FyZSBuZWVkcy4NCj4gPg0KPiA+IEhvd2V2ZXIsIGl0IG1p
Z2h0IG1ha2UgYmVzdCBzZW5zZSBmb3IgYSBkcml2ZXIgdG8gZXhwb3NlIGEgTFVUIHdpdGggYQ0K
PiA+IGZvcm1hdCB0aGF0IGJlc3QgbWF0Y2hlcyB0aGUgaGFyZHdhcmUgcHJlY2lzaW9uLCBlc3Bl
Y2lhbGx5DQo+ID4gZmxvYXRpbmctcG9pbnQgdnMuIGludGVnZXIuDQo+ID4NCj4gPiBJIGd1ZXNz
IHdlIG1heSBldmVudHVhbGx5IG5lZWQgYm90aCAzMiBicGMgaW50ZWdlciBhbmQgMTYgKG9yIDMy
KSBicGMNCj4gPiBmbG9hdGluZy1wb2ludC4NCj4gPg0KPiANCj4gV2hpbGUgSSBsaWtlIGZsb2F0
aW5nIHBvaW50IGJldHRlciBmb3IgcmVwcmVzZW50aW5nIHRoZXNlIHRoaW5ncyBJIGRvbid0IHRo
aW5rIGl0J3MgYQ0KPiBncmVhdCBpZGVhIHRvIHBhc3MgZmxvYXRpbmcgcG9pbnQgdmFsdWVzIHZp
YSBJT0NUTHMgYnV0IDMyIGJwYyBpbnRlZ2VyIHZhbHVlcyBtYWtlDQo+IHNlbnNlIGhlcmUuDQo+
IA0KDQpOaWNlLCB3ZSBhbGwgYXJlIG9uIHNhbWUgcGFnZSBoZXJlLg0KDQo+IFRoYW5rcywgVW1h
LCBmb3IgcHVzaGluZyBvbiB0aGlzLg0KDQpUaGFua3MgSGFycnkgYW5kIFBla2thIGZvciB2YWx1
YWJsZSBpbnB1dHMuDQoNClJlZ2FyZHMsDQpVbWEgU2hhbmthcg0KDQo+IEhhcnJ5DQo+IA0KPiA+
DQo+ID4gVGhhbmtzLA0KPiA+IHBxDQoNCg==
