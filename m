Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A3A3422C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BDF10E0EA;
	Thu, 13 Feb 2025 14:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l79GWxn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796B910E0EA;
 Thu, 13 Feb 2025 14:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739457219; x=1770993219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BVcteqH56xfVFAMSy2VgrAF70029pkXRtOdRvWzFmNY=;
 b=l79GWxn2ZaAkKogFrKiygSjE2o7T3CNTqU+Vsp78ymGKvZvMfnn1Mqg2
 I2/yNEne1qZFd8aoWBcCZH+aFmNYmz78eM8WdWEJVAvnY0LC3g/bqQ4w1
 OmW8suu3dfkZ4n0seeihnczwl6ageNPsZTZaRFXnaO5JVaqtj7CNz/cMR
 cqRMKcAFxXSH9/EsY/Lig4jdnVbP8PwXf+1kyS6y0kKq41+NRsLlKORxe
 Dw3lGoNMkMRP9sjFx0DeD7e20J5ZqNmwSSZlg5K7qTcNMFnwIrN60C8Nq
 HRNoMdT05+yGB5yHr3n2gtYk2xS764GtPyib0kHQphpV4m0bUgeyHsI4k A==;
X-CSE-ConnectionGUID: m62xevOnRR62iWSZJwdW5Q==
X-CSE-MsgGUID: BUXf3fcZTCO2QX4ZYqcWSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40421515"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40421515"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 06:33:39 -0800
X-CSE-ConnectionGUID: iGLNTCNCRM+WCrbYrxIWhw==
X-CSE-MsgGUID: dB65uHNTTxW0foR9rLdj0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113652217"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 06:33:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 13 Feb 2025 06:33:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 06:33:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 06:33:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1j8cd/4KHlJGk98pIhbMkyA/UzJKW9I0aY3eIs/JZIP0ix86wHildfcSv6MKb1dSFE23DdPrp2MJ4L3Cd8IdCx4E0s+ovIM+Yme5jm22EMDJhGsH+v7tYoNPkangqtP5DCx5eIU676WM/RhpYGemkFks/l/qcXMS7DsKpzxZn8JUS06zNssfb8MVdCcYAi3b4w3L2qXYbFCDuGRu5Zq+xLToBCalMD/RHDPSJBRyr0W4dpKQIUWk1Hau8bvY2SVcyUEzo/IJaWfB8o9ESI2d2uAtnq9i4AULCOnkqgNA6yAjOy2xowyYWXD9sQKTCwd8QL2mc6qShQRvP2ydzpzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VImmWM6Jc+z8iaySD8lt8kOkV/gARCYnca+hEK+owG0=;
 b=NqIHQk42RCRuEaXicB14kt70pN/rndBE9fknQvKupBs8w0uHux4gli1NX3VKdpVXRqJ1qNoKgrSdCd26MEM3/tms0fqbf3OFa2SEIYCk6rO9gFEuFVHvOOkAWcNC5daOBaEfpTlkmL3if5HBEHcgX55ByMmfKRKGveAh3gpyJ59nLv7VRriz/jG7zW3hTxy5O6cYc52GUA3fG+MLe9RpK22Xtich/9SnY1Yqf69PxK017ca9kpWFj2SU6gBgZIQ8OvpH51BL0u6/3al6+oHZyQ81equ0RuXCsRvVLF2GUr4alw6FF2AxYnTzsj3KUx6z+I+PDyNJEerQtrLy5kh1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYXPR11MB8729.namprd11.prod.outlook.com (2603:10b6:930:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 14:33:20 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%5]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 14:33:20 +0000
Date: Thu, 13 Feb 2025 15:33:08 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 0/3] drm/i915: Fix harmfull driver register/unregister
 assymetry
Message-ID: <qwgzgt7iyqrxuxhk2q7bawk7w5anhmjlqcyaayxqlxmozeb3pm@6v7l6famp3o7>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
 <Z6n4nx7V2D1z0zWA@ashyti-mobl2.lan>
 <tdyxqxcuigkc54zrrue4e6nqdhczgwbhn7z4bbw4h4kgfqmata@uckh7vqzx6ua>
 <Z6y_tE7DvfirNwLh@ashyti-mobl2.lan>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <Z6y_tE7DvfirNwLh@ashyti-mobl2.lan>
X-ClientProxiedBy: VI1PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:802:2::18) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYXPR11MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: 25153615-5254-4bff-64e2-08dd4c3b5cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qm9STnFMS0JmVmFWd3JjSmwzcFpwTmlyUEtTcHF6ZjEzeVU4MEhPNzU3ZVJV?=
 =?utf-8?B?ZkpzRkhmVDdRVWJsK0FpdGEvck1FektiZUREVXZ0K1paT09VTU9HZ2hMeFNN?=
 =?utf-8?B?N0wwYWx6UkhGbXVaT1VleHlFeG05ZDR2bTc2ekx5d0ZORGRKTDBSaEg3VE5P?=
 =?utf-8?B?RlNNVUlEVDJoaiszMVVCcytONi9tRXlMeXhPQnB0M1dZbis4a3E0ajlwTzRZ?=
 =?utf-8?B?MndWUDJOdUEyUUo4akNoMVozMXVTelhlU0JxMXRDYkc1Z2NBYkVIenl1V0Uy?=
 =?utf-8?B?c084STVOdXJvaUV4dEYzb2RFcVFmVys3QW1oVVZnSURXUDc5ejZIYXRSUnhw?=
 =?utf-8?B?OFRSbUNBTnBOdmJGSjdSQU81aEdKV1Z4bURrd3o2QnFzUTBnSUEwUjRmM1VR?=
 =?utf-8?B?UGRHazlsd0JTb21JY1daMnk0Y1MyUDgyalpyb2VtQzZGakI1Ky9vLytZTjBv?=
 =?utf-8?B?cTViVWdFZzRFVXF4M3I4b3ZzdnNqRis4TnV0R3hJWStxNEVmSkQxMU93TnNz?=
 =?utf-8?B?MW1WVW5xM0FLNXBWaHVuUWxhTG5PZjBmQkM3MTZuL0Zqc3pYc2hGdzFIUXpo?=
 =?utf-8?B?QytrNjdzcWYybWJNSHRkWDFucXkvK0pldkZXZ1pmOGcrK3B6a1NTRVp0WFZw?=
 =?utf-8?B?bjlYdXZDNWVNa0dLWCtaSno5MlVnRGEwNmxTYUN2MG1yVXVmWklHYlBkV1ZH?=
 =?utf-8?B?Nnphek1VelNlRWhmaUNRSjFXcHlXd3A1WXBRV3NXcUN5c0t2Vk4vZG1YemRQ?=
 =?utf-8?B?cTN5Tzh3bDYrc3VodzAvUW1KMjlrMXUrV3p2V0FVVnFZUWM1NEFRelR5b3lB?=
 =?utf-8?B?WjRETVpBUHcrSUZ0T3U1VE5NblJ1VmNJNWlyd1kvaU4rdnp0bkM0MklaK1hn?=
 =?utf-8?B?TDZBYW1tSjQ5cEVYS0ZmWnBKWmQxb1ovMWJoYi80di9tTWxVaHhEMXRBY21R?=
 =?utf-8?B?MWJLREFaYlFFeWIyeHpwY0JvWFgwekQxN20xaXVSWHczMXg3RnU5WmRWR3Av?=
 =?utf-8?B?SEwzcThiaDRjWTNJTC81Sm41VlpDdGpVeE5KRUVTbWErMm1tUkxGWEd4Z1Vw?=
 =?utf-8?B?UElWV1RJV3NoNkd3SlJpcEljTHYyYXN5bi9XTzhlYnVXQXh6dVBFMlpvSWd6?=
 =?utf-8?B?VUhTOUJnRXdDYzA2SDRoTndIQmNmV0V3OFh4VmpiWE03L1ZqdXI0U3hWcTc1?=
 =?utf-8?B?OGhGWTVueGRSOVdHcjVSUFpSNVcxMkViaDRVT3d3VmFVUVVWVUdEY2hIa3RY?=
 =?utf-8?B?R25CVFdGamUxS0VNdmg4T3VqTWJOTWdzeE5qMUV4VlU3eFdHanZ3VEwwRTlj?=
 =?utf-8?B?MlVrUlRLa2FVU2Q1SDRrejdIUkltbmdYMjl5UEZOeWVnbGcyZ1dZMDZhaXBI?=
 =?utf-8?B?dWpwK250RlBKcTdjNEJEc0Y3MjV1ckF1b29JV0UzTE01MDFEMnRiNytZMzJs?=
 =?utf-8?B?aXU2Ky9ET3FEbWxVVEV4VHpkcUdpaCtuQnBneG5yUU02RGlSWmp0dEl3ckNp?=
 =?utf-8?B?eWMyUG9Fc0JWMTJ1QUtsR2laNVdKWTlnOTRqSGtUTlA1bUU0Zk42TFk3NWlI?=
 =?utf-8?B?NUpPSHQxcUx3bGViSklrZ1ZkNzBDVFFMUFZIRGtuV05qekxNQ0JSMCtRQWNv?=
 =?utf-8?B?VUtQYTRPVDRlWDk5RktNMGFqMmxxcG4rTHo5UTVyT3NkZG9XbUhkK2xQNDJk?=
 =?utf-8?B?MzVGMFNLZ1ZsbWFMMm8wdmFDcWdrTmUxL1BQbnhXSkRCL093YVVBdjZtME1C?=
 =?utf-8?B?dzNYK2VpRFJjY0pyQU42ZENxWWI4QjV5dnpCbXhhN2JsNVRtSlN5SURSK2RC?=
 =?utf-8?B?ZFFhRE1Bczd3cTlCR01ITkkyZWF0dDBwMDVQbktGRVhURzVxNUtRdW5ydmNk?=
 =?utf-8?Q?DCtHtwGe8htUl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmkzcXRGeGlZTlo2cmZzYW9FY1BucnVZY1ZEMXdDSEMxTXRGT3VQNVVrUzFQ?=
 =?utf-8?B?eGVMVnZyWm1SNHp0WExaRnB1aUcvZmwxSkhPYlFvOWhDVmhVd1JxZTQzMC9H?=
 =?utf-8?B?Ym0zSTVFUkVYcVFPaE9xenVFOUswcWdscytWUHhoUE8zaHFwOVQvOEVIQ0Zp?=
 =?utf-8?B?UG9tQXJrZlA5SFV0NnVXbnRyTUl4NGU4aXpEL3hsb2JkUXJwQ2dKTTdZdXhS?=
 =?utf-8?B?TFB4QW9uZVZ5WFhsLy9MbHNwMGZ2Vmc5MlpjQW1PYmtnV0dvUzNPRUVJaGRK?=
 =?utf-8?B?c29aUzErdDZOMVNxeHAzQ1FwRHNCdHZVRHEwSXp3c1J5bHZzWlBNQ1JPdlJv?=
 =?utf-8?B?WDU1akNVQkRGZ0JhM2xBeE04TUkwM2ljU0ZMZHdSRDNXNXcxQzZmSXQvT1VG?=
 =?utf-8?B?SVhCVjRhTVd1dDhaY0RlaEg1WktkS0d0c1FnOVdCTlVhK25rd0dvVnl4UENj?=
 =?utf-8?B?eUJaMHcwSVhFSEdTNEF1NUQrTzUxN3dpOExlWFRRM0ZUdFJVc1FDYWpIMFox?=
 =?utf-8?B?Y1BFSCtVOTB1bUVnZE5sZUpteFUyMGgzcXpTUENHa0IyYU1OLzRsOTFTbEIz?=
 =?utf-8?B?MWdyTVhmSC8rWUlYRm9aT3pTOTFxVmk0aXlxZ0lyaXBJSUtyWlJFSUdWUVFp?=
 =?utf-8?B?dTZxV1c5RlRSK09CVFdHMmk1dFEvVUt0QTRrVHVXRWlWbTRFUU1yZmFTZFJJ?=
 =?utf-8?B?QWxuZFZmbVM3b3NBYWliMzdmaTUyYWovbzNXb05vcXI4eVl1MFZlbXRRRDcr?=
 =?utf-8?B?Qk5xQ2pMdVUxckZsaFB4V0o3ZlNpSHJ2b2x4azRJS2dlTkllSVhLYnFMdDJH?=
 =?utf-8?B?cmg1VGloM1RnUzdFRFMvOGNraGovNVlPbXdyVTg2TGhaL3pNNnFYQ1BmWFk3?=
 =?utf-8?B?d1BpTkh4b1hyMXdRQVRqQk9ZTWdqQ0RXYzlKNlB5ZGI3RzVjemkxWTlNN1ls?=
 =?utf-8?B?U2pNaldXU3J5TFdrbnRmbEF5MkxURDlUNXp6azlmY1RUZE5rYm5FeEVSN0Jj?=
 =?utf-8?B?aWVRSDR6Z3RpL0xiN0pGY21GREhBY2xMaGUwRTNtcWVRN0g4L2ZtcUwzVWRE?=
 =?utf-8?B?R0k5RVFVVkttRkxTLzhLSjE5UWt2NjV6RmlyMkFBNm5UZ3gyVjdDeUMvbkJT?=
 =?utf-8?B?cGJMSlZwY3loNHUvbUZlOGxSc1ZKU2szUXZCaUV4QUNCV1ZkYXB5dGRxalQ1?=
 =?utf-8?B?LzdRVXFBcnBJVDlIYmtzVmp5THdsc3laekFFZDJ4RkF6aHV1M2trUTZOV0Zz?=
 =?utf-8?B?b2l4U29sMEw2UFBydGorbFh4WG9JTW1xd3ltWVV0UGxqK1NzTjhFcklubzcr?=
 =?utf-8?B?cWlGb3dxR1hwWnVVNjR0ckg2enFxNGU3NFZnellnd3A1OGRodFNZYjdSa1U4?=
 =?utf-8?B?TlV1RTMycnJFUHpLL0M1d1BLcnluL1loVGdvMmNBc25mYzlkRG5xT1MyTTVu?=
 =?utf-8?B?S1poWW5oOG9hbUNURjZTdXZqMmVMWEsyS01nQlRLM2hQVzV0KzFRTzdhaEFN?=
 =?utf-8?B?VTZIU3pUSkU4cit3dDJaRTRqMkxpY3U1emh3bDluQ0R3MlpNd3FPQzdRYm9I?=
 =?utf-8?B?Um9IalBTaTJ3cnBjOUJQZ25VaTJESk0vSVlyU0Rjb2Q3aUZHQUpEMkRKUk9G?=
 =?utf-8?B?ejk0dWxBRnRVTUNyS1NiQnpzcFJWWENNL3NneGV1aTFPU2RvTUNsRHM2dWtU?=
 =?utf-8?B?MXF1RnRVd2JLeFpKZkcxcTEvejRTRndZOGFrc0FWOGdmKzRuMzhDNHJYZm5U?=
 =?utf-8?B?by9kbndCUmpWSCs5cFNMSm9udndVRXJqUzRZRnUxTWp4Rm5WWEEwT05LWm9C?=
 =?utf-8?B?elpZZG1EZ21TdnhGU2ptbE9ZK0xSc2dVMnQvcmRxL2Nlb05zZlRTVUlvaVZV?=
 =?utf-8?B?bUdvN2lYWE9kS0xIUGNPa0JIUkV5YmlnOEFTa2d0ZlJTdzluT0FiVHd1cVpJ?=
 =?utf-8?B?TjF4RWJyMmlJMlR3NFNqQkEyV203REVXSU1rUTdFamhaT3FLWjVjM3B0R21G?=
 =?utf-8?B?QXdNWVFVT2lVclBQYityUTM0cGJhWDlxNk96Um54M1RMNHhlaVpnbG5mZEha?=
 =?utf-8?B?cEZZWUg0dTM2M2pEdkVwUXpoUDgxR1k1ZzJVUjQrRHFJUUdQcHgydC9TK0I1?=
 =?utf-8?B?Rit6ZUxuNXM2aXpIQll5dGNpZlVCbS9WU0FiUGhTa3RVSEhSWXY4LzB6SHo2?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25153615-5254-4bff-64e2-08dd4c3b5cd9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 14:33:20.2802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+frPYrQjW2bHLqS4vOKwx3paGWsgcPv7eRjlksRc8mhEO2aFbJIjLRLPPLrfBg/4Xmwjmz7HAOYTIA4byqAt9jRIqb9MCeGN3mU5/5Omes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8729
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

On 2025-02-12 at 16:35:16 GMT, Andi Shyti wrote:
> Hi Krzysztof,
> 
> On Wed, Feb 12, 2025 at 12:50:17PM +0100, Krzysztof Niemiec wrote:
> > On 2025-02-10 at 14:01:19 GMT, Andi Shyti wrote:
> > > On Thu, Feb 06, 2025 at 07:07:38PM +0100, Janusz Krzysztofik wrote:
> > > > We return immediately from i915_driver_register() if drm_dev_register()
> > > > fails, skipping remaining registration steps.  However, the _unregister()
> > > > counterpart called at device remove knows nothing about that skip and
> > > > executes reverts for all those steps.  For that to work correctly, those
> > > > revert functions must be resistant to being called even on uninitialized
> > > > objects, or we must not skip their initialization.
> > > > 
> > > > Three cases have been identified and fixes proposed.  Call traces are
> > > > taken from CI results of igt@i915_driver_load@reload-with-fault-injection
> > > > execution, reported to several separate Gitlab issues (links provided).
> > > > 
> > > > Immediate return was introduced to i915_driver_register() by commit
> > > > ec3e00b4ee27 ("drm/i915: stop registering if drm_dev_register() fails"),
> > > > however, quite a few things have changed since then.  That's why I haven't
> > > > mentioned it in a Fixes: tag to avoid it being picked up by stable, which
> > > > I haven't tested.
> > > 
> > > I'm not fully convinced about this series as I think that you are
> > > fixing a subset of what needs to be handled properly. What about
> > > hwmon? What about gt? what about debugfs?
> > > 
> > > In my opinion we need to check in _unregister whether the
> > > drm_dev_register has succeded and one way would be, e.g., to
> > > check for the drm minor value, or even set the drm device tu NULL
> > > (first things that come to my mind, maybe there are smarter ways
> > > of doing it). This way we could skip some of the _unregister()
> > > steps.
> > > 
> > 
> > Is there any situation in which having the driver loaded after failing
> > drm_dev_register() is of any use? Because if not, instead of recording
> > the fact of registration failure, we can just stop the driver from
> > loading altogether by checking drm_dev_register()'s return value,
> > then calling _only_ the required _unregister steps as cleanup in an
> > error path, and propagating the result up to driver probe. This way we
> > don't need to store any additional information at all.
> 
> as long as the driver works, why pushing it to fail? Janusz's
> patch is really showing the case.

Because the driver doesn't really work... it is loaded into the kernel
but you can't access it the expected way because we failed to register
it to userspace, and we also skipped a bunch of registration functions.
Is there really any benefit to keep it loaded in that state?

Also, i915 is the *only* driver in the drm directory that doesn't check
drm_dev_register()'s return value. All other drivers at least check it,
and the ones I took a closer look at (xe, nouveau, amdgpu, radeon,
virtio) propagate errors in drm_dev_register() up to their pci .probe
functions. So I think we're safe to handle it this way, and this
wouldn't force the driver to keep information on whether the
registration succeeded or not (if _unregister ever gets called, it's
because we're exiting from a properly loaded driver, so no functions
are to be skipped)

> 
> Andi

Thanks
Krzysztof
