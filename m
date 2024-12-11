Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8B09EC99E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 10:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AF110EAD9;
	Wed, 11 Dec 2024 09:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BT6wSD0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A0D10EAD9;
 Wed, 11 Dec 2024 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733910448; x=1765446448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=71KVlJYnwhGVsSRdVSejXZapg4IAartLYsPupR4WBXU=;
 b=BT6wSD0MDxeJWBmYt/v3Q80uj356JjxQ2YWuTIZR3ugUaN8CyHwDe2ww
 YdJppaZ6e9b8WaVLT41YpqdO8yvis3yp33YoQYUCAzKdWfETDjsBhOYPn
 RqMI7XMqhvhiO+sxEvBzh6vRr5IE+kos+2sBerBLu1lnyfNCi4XMjY1lF
 MO9AfqhU0hZ0vsTirNaXN3Y60qA7coSyuy8L0pQBkc84xwCFfo0cEFSJ7
 ZTXc+GDIocBF260UZbetOHDNtLYIKVwJoGjFVSCuNqPFA24CdAzf03OUZ
 9OoSgGk/QUaWOxoDepmTRhNSfB+lCgzft02V8Bn5QkfAyi5SiV/Gndaqy w==;
X-CSE-ConnectionGUID: YPcPfAzpQ2maFM3cJ24N1g==
X-CSE-MsgGUID: +bsKldK7T0W+4dIMVRe6jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34408331"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="34408331"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:47:24 -0800
X-CSE-ConnectionGUID: aq+CAFspQT6akCRKNoIb6w==
X-CSE-MsgGUID: 0pZtLqfCSVKgmLtp3wMWvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126666860"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 01:47:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 01:47:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 01:47:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 01:47:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVJRHdN9lWbBTuOE19MxlPWthFeP2jzR/jRn0+XPN9BdY/wudwQL6yEbUBtlHZHkVichZxS0CCvRcT/L9cLkXvb9EaEIHt1sPo9ibzITm/Tx1f+fQvGroNeHd0EtsB1WEYwjbW2XdLGToTWURa0ijgQlEUw5r3ElSVJMFyONcNGVa2FUJZd2czNtlz2J3EmvqWbUdEta8T/Wl80JzyU3pcAbFQ0evg8yVkSg39LP0LZxRysEUT0NhqB8rOsO9EoSn/fmK+SLoGEVBdfpkSdiLfS6quyAlEZAlE5rXsGyQSyfW+cSMNI1RfpIxRHa7hHRT8OAP3BZZ3yniYnDbqj2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71KVlJYnwhGVsSRdVSejXZapg4IAartLYsPupR4WBXU=;
 b=nxvAu8pDS0AOrqb1NV/zsW1Y38/5ldBHVV42N8Ff4hTMWm1BvWh1bgUNTauREbYxzhYkcjSe5a3BvkgGKjbUQ/WgXLK4rXh/9LXeMs4y4ig7QwLRh6tedFhBcq/hsQfIqtg79DeBEU96FF6G3CeQVcwKIAjdqO3yd6NwKS0tkj4zWC2hgeGuPecWEZiLgRNsDagkWoosjItXLOiSLUPhF729n4cvSZDc0wp3VoCgnpcaYnfQk/S2/XA4b5LAcf5LbnHrgJP0ZUSO9JmcFGyDLkTSxmjUBD5oJ406JriFptZtbodOtlzCQbWDIS6VJeQfnZujBMDrAT+DYUTp0R14Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Wed, 11 Dec
 2024 09:46:52 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%4]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 09:46:52 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Deak, Imre" <imre.deak@intel.com>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 06/10] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH 06/10] mtd: intel-dg: wake card on operations
Thread-Index: AQHbJHC0/rbs/wzgjUKBVSZeKHczwbKcSmeAgAABYACAAU36wIAKGt4AgADo09CAA+hQAIAEFXyAgAFugICAAJ3To4AucVkQ
Date: Wed, 11 Dec 2024 09:46:52 +0000
Message-ID: <CY5PR11MB63661AF635C8A98EF82861CCED3E2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-7-alexander.usyskin@intel.com>
 <Zx-mPQSHXv5Teq_j@intel.com>
 <CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CY5PR11MB6366EF9CA6552ADF6E01A557ED4B2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <Zyk5kueKlusKlwqM@intel.com>
 <CY5PR11MB636622B23A3646D58A70A920ED522@CY5PR11MB6366.namprd11.prod.outlook.com>
 <Zy1EAIPEaY8Wlh-h@intel.com>
 <CY5PR11MB6366769459115688B8AA100AED5F2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <CY5PR11MB6366051E35678864805BC89CED582@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87msi5o6rq.fsf@bootlin.com>
In-Reply-To: <87msi5o6rq.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB8273:EE_
x-ms-office365-filtering-correlation-id: 02c85fb1-eeda-4f77-620b-08dd19c8bdf0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Wm9qbWNsY2lHYzJxWENkRHJFTGdMRmQ1UXBIVUdrOGhPTW1iUHFXNXUvZlZa?=
 =?utf-8?B?THp5cVZaZzlxRXNUYUxmYmNYclVPcGpBMERER0l3ZllkcjdtU3N3YXZITWx2?=
 =?utf-8?B?ZmUvWXRnMEovOU1TMFdKVGt4emZBeXF6RjFlRmZuREVWWXlvbldOLzMzUVhs?=
 =?utf-8?B?OHVNQ0dIdHVMVXUvVVA0MnpyU0pwWFY4V3JsK3Vta1FpbFkwcW1QaG95UFVp?=
 =?utf-8?B?ZGltUnVhTU1CRm9HREZDNlptMGp3QXhKTzdXMWpnQit6UWxieXBsb0lPeWsw?=
 =?utf-8?B?WWF2QnJUbkg3TmFvTlNqUXNYN00yL3Z0M2pVRjZoVHlqNUdZcmo2QmtmZjJS?=
 =?utf-8?B?dzl1M0FVN3lMbFVlQUxsM2RMaWlBeEwwRnpMdDFTY01QVzRJUUs3Z0k5WHI0?=
 =?utf-8?B?TGsvZ1liSDU1ckNWNEhXSTR5eTNITnNsNXN3ZFlnZlo5M091SVdWa29WQWxW?=
 =?utf-8?B?TWdQNWdvSTVkQUVvRFBiOTh2L2VIUk4vTlFpb0JJV2huajJsRUMreGtsTTNn?=
 =?utf-8?B?MkEza1FtbVJKcmVGYUsrME1ZM1JuQk1acTNMNDNYZDBSNlQ2Q3RyQ2U3eU1O?=
 =?utf-8?B?SVFQWnZLSFZwaE5WSU1ySE53djh5TExJTm5jZkYzVzduQ2oxVzJFMEkzV05m?=
 =?utf-8?B?S0lITjlkc0RodlhGbXJ1MW1IbHZuSjNHc0I4OGhsSTUrVWsrMWNMdzZsT3BP?=
 =?utf-8?B?dEx6TmJQUW4wbFdTbG4zYysrcWhsZkZDdm11Tm1RSTVIYkZVNEdmRVNCVGJh?=
 =?utf-8?B?U3E1cWJFVjNlSC9hVEJ0YVdhVjNjQjUrOUoxRUNwUi9OcGNlVEdUSmxsbmVj?=
 =?utf-8?B?VTJEdGRRTGFVbjNMS0dxcG5ZY0xtb3RibXE3ZlNmVVVobGRvbUowTHNsTW9o?=
 =?utf-8?B?ZlozcHVlRkNIK2dkY1VvUzF5UUU3SDVjQnc4bUxpTzRnT3lwY25nZk1kbUxu?=
 =?utf-8?B?UGRuRUduU1dQOFNsNDZhdE5raXYyMFpvTTlvYnJrRmtBdDZEekk1Q0xsbGhY?=
 =?utf-8?B?T1p5eWhvTUNCUU9ucXZBaVNiR2czU2NscUZSclVaWkljdzVWRnU4TDNRMGRI?=
 =?utf-8?B?Ujg1YTNWdU5WZVlQYnNnL3AvS3V5SmhUQ0swK2lydEZDeG1vbTJwY3ByOTFt?=
 =?utf-8?B?U0FFYWFLSFB4WERTdlljUk0xQmM3eTJoenl3bGUwQjhDZzlzaHJyb0pxcGtZ?=
 =?utf-8?B?YjUzRU9VM01TYU5jU3pDV25tdzVqbTFMeWdVcXVsVnJDcXhsdlRZa1llc2JE?=
 =?utf-8?B?OGNIYU1MNkhuNnVpZVpwWjlibXRoYVZQbUJRR3kzNzhyUHlPeXlUQk12YTdS?=
 =?utf-8?B?NGo1QVNWR25mM0hzWll4R05PLythVGRZTm4zcVcxemF0aEdUYUIzQzlScWI4?=
 =?utf-8?B?ajFTUG42OWlwWGVjVkF2NXJMNnNadkxsTE1mYWREQ2NGdFRleUppREx3NEhE?=
 =?utf-8?B?ZjlndEZTSDRyamdYSkF0UUMvZWJSdXRRdHJIczc3d0ZONld0KzVvTkpUQUJH?=
 =?utf-8?B?VEZxMGtVMTJUV1NNWFRRRXhTRHFrMFg1RXRIZVVtY0lIVTE0T2ZQanJQVjFu?=
 =?utf-8?B?QzBjQ25tR1dONDNheFJmbEVKbEpHWTRFbWJJWUhWWkFUd0c1T29DR3VzdEEw?=
 =?utf-8?B?TzlWOUhBbjlnVENCVURoQ1oxZkxoOW9HUHd6RW5DZHF1VHphU0JBNHFJUHZR?=
 =?utf-8?B?K1N5WFI2aFhQaUYyZmlwb0p2emxMcXBPcFJBYk1rS3ppRkJ2Ny9hWDJTRzZm?=
 =?utf-8?B?amZ2WDQranptL0tlUjdrUXpOWm9ZcGducnppOW1YZkpaVUlMNWcyUy9sQmZx?=
 =?utf-8?Q?uydEHzb/SHSIXuRGwDFZY0WPBf3xYM7kAODGo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N01RVmxOTTZ6ZThGbXRka2c0OVphNVpuYWdQWUgyaXc0RGo4NW1oTk42ZUZZ?=
 =?utf-8?B?VEQwZHZOcXltblFvYWR3MTkycmtkWCtTV0RGVHFDKzh3SU9ONGZGZmdWcjFU?=
 =?utf-8?B?Z0tnT0x6M1VYb0VjcHBobEdNRmRwQkNSYmZSaWVPdFNKSFNqL0QzVCtBZGJP?=
 =?utf-8?B?ckM4QlZlWmJFQnpmZkRYc0J6aFZzRVh5K3Z4eVhsQi9FUFY4OENhV3crR3BS?=
 =?utf-8?B?Vlp6eTZTTWxURlZ5MCtZQUQzanVzZm9UTit5Yk11MU15bU9Qd3J0Sm1QN09T?=
 =?utf-8?B?SzJIU2dvY0U1L1RyaFF0WlZTeUdjRE9ORkpYUW0zVnI0dFJhbXNTcGoybVNi?=
 =?utf-8?B?dEFNQnBFRFFlY0hXUTd1RnpLZGRiQWxJdGJJcHNxSjRmaGtyZFA5YmgwNFNT?=
 =?utf-8?B?eTg0M3B0UEFYaGlWNSs1djlKaUdEemFJWEFRVHZGd1ZYZFBYZDFTL1NYZkdO?=
 =?utf-8?B?SkFZdmp5ZlF2L1hBbUg3dFBuVDhnUVoxaFNRZGdhZHczWDMxWkZCYU9EOGFK?=
 =?utf-8?B?Ulh5cGJUQ2NlNmE2THhBRVZZVDVJS2RVV0E1R3lnL2pmL2ppR2N6aVc1Z2ky?=
 =?utf-8?B?QThXT0xJekxBc3hEbVJnU1pCNUJSdUE5VG95TStWclMwM2dNVHRLeVk0WCtT?=
 =?utf-8?B?QkcrZjBHZW54eGtSYTYvdDE2ZHd3V3FKbDlhOGVtYWpCWW1SUm9MdTlvaHpQ?=
 =?utf-8?B?Z05GLzZVQXI3cHloMkEwc0J1dDYwb05sRk4zV1I5SStlVzV0VEVXTmtQRHJS?=
 =?utf-8?B?Y2prZnBLaUo2bk1CdlFheEZXeWJIUWp0VzF0S2JVT3graC92bzlCbmRaODlk?=
 =?utf-8?B?dW1lcE9ubmJydTFqYzZHKzdQS0tkQ1JSR1kyUTFEQTQ4RVdBbUFuNHUrbjdx?=
 =?utf-8?B?OEhHYWtGV1R0NzBMS1JiT1dqWWlPdkhUSnRjZDRhYi9DVG92WWpGZU1UQVNO?=
 =?utf-8?B?ek5vQnYrYmtZV3BzQ2Q5RWpFa1hwWEM3RzQyWkUycGMxRnJ3dHFZaFNldk8r?=
 =?utf-8?B?ZlJpM2RMT25VYWtwcTVoemEzd2JjS3lUWVVkdG5GeE5NNG5vSXBnSDNPWVRX?=
 =?utf-8?B?UCtVUjRjTUllZUdnRzhIU3JaaGlhVmIwbWJWaGZKcWZoazBmOE5QeWdCeVU0?=
 =?utf-8?B?U2t1YjZLcVhjSkZ0Q0VlMnpZbnpYR3lOZ2E1NWIwc2ZWWVNnQ25SaWEzR2lU?=
 =?utf-8?B?MW1WMUtIMjAzUUlMeHdoVDdqNUt5d2x1QXhPZ1MwUzNkRXFXcU11NFIwaFdC?=
 =?utf-8?B?cWtMV3duaUVLSXpCZC9iUzRsT09yeEVXaHpadDJoS2l4T3d3MWZmOStwSVNH?=
 =?utf-8?B?REFpSjd2QmQwUW56NGhsakp4RzhYTFREUWJNWlZNR2pRU2FBdCtiamNXalZz?=
 =?utf-8?B?NHZDLy9qQkkwMjhuLzlUM1ZmZHJoS0hMR1ZrMkRZbTVlZndHOUhRZUNHODVk?=
 =?utf-8?B?RGxyNlpaV0l3MSt6RzBtUWg0K2RVZTdDcERmT2lMNGZQT2NOOThwaG5zd0lt?=
 =?utf-8?B?MzFURUF1enpWOEI3TXBFS2RpcjR5b0xUUDk0RXF5ajVKSW9SWDU0dlU2aUJj?=
 =?utf-8?B?YllhbnZldHFKNFBRT2VnMFdaN0VGNHlIcnBtWFJLdVltWm1kcTBqMWlhLzQz?=
 =?utf-8?B?Q01NYU1LcEpkdUwxdmNCR29BWTJUSDhEODFvQUsycDU2M1cwaW82VnBwUFht?=
 =?utf-8?B?Y2s4RjFnRmEveWhSOHQvRWdXL0hvSEliTFViQlUzZ1M1Z21VT0NDem1sSkpN?=
 =?utf-8?B?TlJnUlJQRUd0U0xCeHdZbFJ1WFkyVVlZQW42UExra3F3bHA4V29SOSt3S0Fp?=
 =?utf-8?B?MGwvQTFKQVcwT0tjL0w3TmVKVEp1dGgxZ0x3ZW5KR3BFTVpremFiQUg5end3?=
 =?utf-8?B?NHFST05BcDJlMUR1Qzl1UGU0V3dkNUkxNXp0VG8wRFo0ZHVocjZzOC9sUGdY?=
 =?utf-8?B?eVlJT1AvZWFicTcvUWhIOHNGaVRUZ0dEeTA1VlJSUmgzSWE3T2xKOWV4YzNT?=
 =?utf-8?B?ODFzdytUUEFFYVpmNlpnMStXWGJOY0RvblQ5NlMveiszN2h4ZSszZzc0UjVk?=
 =?utf-8?B?R2NNa3VIQ2F6RFJqZXRsZjR4ekluV3dvZE1EN2RQSGpPVkd2M1hrSXQ3aEJR?=
 =?utf-8?Q?oUVu5ln2yCWoQRuHjjwG7/6K3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c85fb1-eeda-4f77-620b-08dd19c8bdf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 09:46:52.6726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rtZ9dOMJw35xkWp15jwwarJkbiJTSqMCOmmBXWmpyQUHKCAEQkac+0TR4iVhkHuC3ARgk/0+s1+OpO/ZcOxURFHtAq3pY5ggWgBUbtLTg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
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

QWRkaW5nIEthcnRpaGlrDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwNi8xMF0gbXRkOiBpbnRl
bC1kZzogd2FrZSBjYXJkIG9uIG9wZXJhdGlvbnMNCj4gDQo+IEhpIEFsZXhhbmRlciwNCj4gDQo+
IFBsZWFzZSByZWR1Y2UgdGhlIGNvbnRleHQgd2hlbiBhbnN3ZXJpbmcsIG90aGVyd2lzZSBpdCdz
IGhhcmQgdG8gZmluZA0KPiBhbGwgcGxhY2VzIHdoZXJlIHlvdSBjb21tZW50ZWQuDQo+IA0KPiA+
PiA+ID4gPiBUaGF0J3MgdGhlIHBhcnQgdGhhdCBJJ20gbm90IHN1cmUgaWYgSSBhZ3JlZS4gaWYg
SSByZW1lbWJlciBmcm9tIHNvbWUNCj4gPj4gPiA+ID4gZXhwZXJpbWVudHMgaW4gdGhlIHBhc3Qs
DQo+ID4+ID4gPiA+IHdoZW4geW91IGNhbGwgdG8gd2FrZSB1cCB0aGUgY2hpbGQsIHRoZSBwYXJl
bnQgd2lsbCB3YWtldXAgZmlyc3QNCj4gYW55d2F5Lg0KPiA+PiA+ID4gPg0KPiA+PiA+ID4gVGhl
IGNoaWxkIChtdGQgZGV2aWNlKSBkb2VzIG5vdCBleGlzdCBhdCB0aGlzIHBvaW50IG9mIHRpbWUu
DQo+ID4+ID4gPiBUbyBjcmVhdGUgTVREIGRldmljZSwgdGhlIHBhcnRpdGlvbiB0YWJsZSBzaG91
bGQgYmUgcHJvdmlkZWQNCj4gPj4gPiA+IGFuZCBpdCByZWFkIGRpcmVjdGx5IGZyb20gZmxhc2gg
dGhhdCBzaG91bGQgYmUgcG93ZXJlZCB0byBkbyByZWFkLg0KPiA+PiA+DQo+ID4+ID4gSSBkb24n
dCB1bmRlcnN0YW5kLi4uIHlvdSBoYXZlIHRoZSBtdGQtPmRldiBhdCB0aGlzIHBvaW50Li4uIHRo
aXMgaXMNCj4gPj4gPiB0aGUgb25lIHlvdSBzaG91bGQgYmUgdG91Y2hpbmcsIG5vdCB0aGUgbXRk
LT5kZXYucGFyZW50Li4uIGV2ZW4gYXQgdGhlDQo+ID4+ID4gcHJvYmUsIGJ1dCBtb3Jlb3ZlciBv
biBldmVyeXdoZXJlIGVsc2UgYXMgd2VsbC4NCj4gPj4gPg0KPiA+Pg0KPiA+PiBBdCB0aGUgcHJv
YmUgdGltZSBJIGRvIG5vdCBoYXZlIGRldi0+bXRkLCBidXQgbm93IEkgc2VlIHlvdSBwb2ludCBo
ZXJlLg0KPiA+PiBJJ2xsIHNlcGFyYXRlIHBvd2VyIG1hbmFnZW1lbnQ6DQo+ID4+IC0gcHJvYmUg
YmVmb3JlIGRldi0+bXRkIGNyZWF0aW9uIHdpbGwgdXNlIGF1eF9kZXYtPmRldiAodGhhdCB3aWxs
IGJlIG10ZC0NCj4gPj4gPmRldi5wYXJlbnQgbGF0ZXIpDQo+ID4+IC0gbXRkIGZ1bmN0aW9ucyB3
aWxsIHVzZSBtdGQtPmRldg0KPiA+Pg0KPiA+PiBJcyB0aGlzIHRoYXQgeW91IGhhdmUgaW4gbWlu
ZD8NCj4gPg0KPiA+IEkndmUgdHJpZWQgaXQgYW5kIGZvdW5kIG91dCB0aGF0IG10ZC0+ZGV2IGlz
IG5vdCBpbml0aWFsaXplZCBpZiBwYXJ0aXRpb25zIGFyZQ0KPiBwcmVzZW50IFsxXS4NCj4gPiBN
aXF1ZWwgLSB0aGlzIG1heSBiZSB0aGUgcmVhc29uIHdoeSBvdGhlciBtdGQgZHJpdmVycyB1c2Ug
cGNpIG9yIHBsYXRmb3JtDQo+ID4gZGV2aWNlcyB0byBtYW5hZ2UgcnVudGltZSBwbS4NCj4gPiBP
ciBJIGhhdmUgbWlzc2VkIHNvbWV0aGluZz8NCj4gDQo+IFBsZWFzZSBrZWVwIGluIG1pbmQgdGhl
cmUgaXMgX2EgbG90XyBvZiBoaXN0b3J5IGJlaGluZCBtdGQsIGFuZA0KPiBzb21ldGltZXMgY2hv
aWNlcyBmcm9tIHRoZSBwYXN0IGNhbm5vdCBiZSBzaW1wbHkgImZpeGVkIiB3aXRob3V0DQo+IGJy
ZWFraW5nIHVzZXJzcGFjZS4gVGhlIHByb2JsZW0gd2l0aCBtdGQgaXMgdGhhdCB0aGUgIm10ZCIg
c3RydWN0dXJlDQo+IGRlZmluZXMgbm90aGluZyB3aXRoIHByZWNpc2lvbi4gSXQgbWF5IGJlIGEg
Y29udHJvbGxlciwgYSBjaGlwLCBhDQo+IHBhcnRpdGlvbiwgb3Igd2hhdGV2ZXIgbWl4IG9mIHRo
b3NlLiBJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgSSBiZWxpZXZlDQo+IHlvdSBhcmUgbWVudGlv
bmluZyB0aGUgS0VFUF9QQVJUSVRJT05FRF9NQVNURVIgY29uZmlndXJhdGlvbiwgd2hpY2ggYnkN
Cj4gZGVmYXVsdCBpcyB1bnNldCwgd2hpY2ggbWVhbnMgeW91J2xsIGxvb3NlIHRoZSAidG9wIGxl
dmVsIiBtdGQgZGV2aWNlPw0KPiANCj4gSG93ZXZlciBpbiBnZW5lcmFsIEkgYmVsaWV2ZSB0aGUg
ImZyYW1ld29yayIgc3RydWN0IGRldmljZSBpcyBtYXliZSBsZXNzDQo+IHJlbGV2YW50IHRoYW4g
dGhlICJidXMiIHN0cnVjdCBkZXZpY2Ugd2hlbiBpdCBjb21lcyB0byBydW50aW1lIFBNLCBzbw0K
PiBhY3R1YWxseSBJIHdvdWxkIGV2ZW50dWFsbHkgZXhwZWN0IHRoaXMgZGV2aWNlIHRvIGJlIHVz
ZWQ/DQo+IA0KDQpTbywgd2UgY2FuJ3QgcmVsaWFibGUgdXNlIHRoZSBtdGQgaGVyZSBhbmQgc2hv
dWxkIGhvb2sgcG93ZXIgbWFuYWdlbWVudA0Kb24gbXRkLT5wYXJlbnQsIGFzIGRvbmUgaW4gdGhl
IHBhdGNoLg0KTm90IHN1cmUgaWYgdGhlcmUgYW55IHZhbHVlIGluIGV4dGVuZGluZyBtdGQgdG8g
c3VwcG9ydCBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQuDQoNCi0gLSANClRoYW5rcywNClNhc2hh
DQoNCg0KPiA+IFsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMi0NCj4g
cmM2L3NvdXJjZS9kcml2ZXJzL210ZC9tdGRjb3JlLmMjTDEwNzgNCj4gDQo+IFRoYW5rcywNCj4g
TWlxdcOobA0K
