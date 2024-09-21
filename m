Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6382397DD4E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 15:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB8010E309;
	Sat, 21 Sep 2024 13:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBT1ZJ5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE6310E045;
 Sat, 21 Sep 2024 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726923661; x=1758459661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J2c+LXU+72D7NmOwqUzJhB1/riCFQrcfGPG0+vhVD4w=;
 b=gBT1ZJ5BgAMXNme3mHguKbOaFKJOgJc96Mc7b6PQWZHNKZh/dMf49HlJ
 UDcyYcA/N7WJO0eq0pNjP/tUVJfjgDUjy64LJKF79euplz6FI9ZNdCID3
 IOMedeotTK/4mv1VcmZi2DCPdkQFg1DBSCg75vZ1pb1mIGWMHRE0UPXxD
 LpD9XWiosclVgCHz4YgS+8/i6EtiI8P+of3YmvEYLslNsIDmliR7WZvA/
 uJ/X3vf52X3LBrC009fWL+SvSTIT6e0eIrDtBx/J+S/xLSxcDPwhijSg0
 D43Fls6nlWza2LQV8ujis+8tBAs+t6E1ofuk+xPaQTUm5WkTJ+lvy+qcZ w==;
X-CSE-ConnectionGUID: z7jYRvM6Tym6RBFDcvuLhw==
X-CSE-MsgGUID: A6JKbG/GS9OTfy7EfZi1Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="13621134"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="13621134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2024 06:01:00 -0700
X-CSE-ConnectionGUID: eNBNVDvZQgSXgkMdIibwug==
X-CSE-MsgGUID: D9bzuh27STao4Tfi3MKNqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="75361388"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2024 06:00:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 21 Sep 2024 06:00:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 21 Sep 2024 06:00:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 21 Sep 2024 06:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Euw09FCJ60+E0SExOoV50eOnqzXsI7hjuc4zN3VgGdlca4tn9Qs9oWpwiSSLVjcV8Fyiqy9S3Yz9iH6KXUbxkGj5CGgDb1FrBuNjR5AcuiyzFJVbGVVOxbP5P1F5d6ZVX2DxbSoZCql55PqvOrJiMH/Oh2mJ3n+lxcV45pvC+BGN8RZCMDnIEJXSw6c8jJOLgD7fix4fUpVIQfqlOeDJLuE6uUpuEdc1D4VMvzsqxY9zigOojaeWR7BS3Stlp6zLQ5MyKzslHQDCMv6wlwXIP7m4Eb+t1Qzzp111nyIk6C16+83tShhGaSrm2YYAvFGMv4jxbP8aigbNjDPsQgm1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GA6L6OPYc3ie5YPrJbdI5NTwAZHD2CFvL2oFm72rgUc=;
 b=g7so4vc4LRQSTTTPE9agffStNkOaPeWNXcx6lcgmYx3I8Wbn0fsTpY2ChA6waCM6PWYfsDKv5wU2f623DAITrVS6UGGlHj17V58U8xtt2g+N0uvb0GI1660O8PqUrRgf43gA2Yi6oveAhX++eJ9JCwVZ3CimXKI2J6faic2e6jJMBFEg3AcbOh2nhXS4vbTz1zwIEtAJc2h6BFnU4rt77+UCeabQKdE6i5dZdMsnXai0SRgl2ZWQ8ZTQADeggk2YqXLy/fpSUgIMbcsngn673N4ePozIU44lvFEXTywbTjAs4eTDixuguCK53LX2ow66UcxIxL53HQnmG+CV1nxwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Sat, 21 Sep
 2024 13:00:53 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7982.018; Sat, 21 Sep 2024
 13:00:52 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, "Lubart, Vitaly"
 <vitaly.lubart@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v6 01/12] spi: add driver for intel graphics on-die spi
 device
Thread-Topic: [PATCH v6 01/12] spi: add driver for intel graphics on-die spi
 device
Thread-Index: AQHbCEBkZ7X5wnyiXEe3qiGmampdoLJdjhaAgAFR0ECAAA32AIADOJHA
Date: Sat, 21 Sep 2024 13:00:52 +0000
Message-ID: <PH7PR11MB760505A11C7A41DAB0359184E56D2@PH7PR11MB7605.namprd11.prod.outlook.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-2-alexander.usyskin@intel.com>
 <ZurWk_eXSQndgA4Y@finisterre.sirena.org.uk>
 <PH7PR11MB76057D2326D436CA9749A113E5632@PH7PR11MB7605.namprd11.prod.outlook.com>
 <Zuv9qsWJQhx7rbhJ@finisterre.sirena.org.uk>
In-Reply-To: <Zuv9qsWJQhx7rbhJ@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7605:EE_|DS0PR11MB8071:EE_
x-ms-office365-filtering-correlation-id: 25f99d30-6159-462f-246b-08dcda3d6c92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?QYMfMpnL3j9n6WUpEMhOmhYizdEPtYSLFHoEmoz2e2T3bHD+Lck096X/Nu?=
 =?iso-8859-1?Q?78eFVE2N6HWZnklQ6f9AhxNwxjys8Blr/UtNOYbaLN2B/W8Tsnuf2tqh1i?=
 =?iso-8859-1?Q?TZPEVoWqPd3XSmQqaeIm1gzlt68yqoAU7ZCmfydu9PBcIv48+Ks6L/lVWz?=
 =?iso-8859-1?Q?SpdpuNsqteIR4qt29nz2MxuMEOCEfnJnfGIfikOgIv8NDlioQv7+Xjubw3?=
 =?iso-8859-1?Q?fK2fYJy2kZUky7mRwtL2Xe1EcfY/spbw5p/QyqFRVU5LJuD+bEkAjo7ddK?=
 =?iso-8859-1?Q?QCyjNo/OUgFuLiPbUFNMnju0dUa1c0N4+hEPzCO5NlPCFfXqiFqFqKhbYm?=
 =?iso-8859-1?Q?yJALoIzy/02+zahbOPBl6l3VpzTmTHxJHVJaBu9DZymEPmsz7zxD17x4gN?=
 =?iso-8859-1?Q?K7hLVXsFhd8lRoTwKfN8nEdiVKAKj7g8dekNNgs3dEgMQHmYZr9EWtSs7C?=
 =?iso-8859-1?Q?JqaZ3sJtGpM8yGprlaj7GPNMRqigLo0eBOwnWRaaIlo9eHVNJzSrpuLqQ9?=
 =?iso-8859-1?Q?+Gb02L159VaRfFIQP8sVNIKQXx4V1sQ83tmcqm4oOZEf3i7VY7wx/D8mqE?=
 =?iso-8859-1?Q?+edAiiPgLb9+hpwsjUw7eQnK+3Gk4jUvATqS93IkWPOBleaPEj9yper/20?=
 =?iso-8859-1?Q?8rPAwENVo3Kz61pT7u9/8uSq+h+8A3lrTVdywSMSCTw3qRLGhHSzRSApnG?=
 =?iso-8859-1?Q?zyslf8ULsd2fO9VOOUM+CzI5iZFotevnEHqx0SJSCXxnGnFJ+CPBKCfvH0?=
 =?iso-8859-1?Q?J1rXk4EVuGrSa7SRgSXCrZQjAnGGGeXuPWl6bkLhCX5Xu64WHGXTr7VfJR?=
 =?iso-8859-1?Q?gb3asPagE5OaK7yZrPF2bQegCqxvXe5TDVf8w5Eg2reslAb5uUKG69uw8D?=
 =?iso-8859-1?Q?jHf+4Stgd+JIR99DzuAzIiCUCExT9n6yWELxcDzqt81tE6+80u2lWvZztl?=
 =?iso-8859-1?Q?hU754jYbjjbdphpWfCUE4LZpFekcGzWVOA8BWrHIaZRJVPyHM3MBYniG29?=
 =?iso-8859-1?Q?b8gSxidGvhqN9rev1clAXON6TNz5HcRvASzhJaJqfp02AxdVRftawtMlBB?=
 =?iso-8859-1?Q?yg61Z5D+58zl/EGnJR6kwilaHNhL6Dgt3mTMQIbBuHFZ4vWxDKdOZero+7?=
 =?iso-8859-1?Q?WDUIuUgTUOpxQwQ63n8UjbNveMPR/p8wpFWtdYAgCNOYg9kMBYRoFutoOx?=
 =?iso-8859-1?Q?iNTxHa8ookAkPbJjJB3WnYhsAVhzvGDAMP/sTBh1qjtXo1PUFKbD0/N4Sw?=
 =?iso-8859-1?Q?xuCEng2uWiRp4hjYyfnrJNtEHHSl/u0XWoSYiK50KmVEmCDVpvL37DQcgX?=
 =?iso-8859-1?Q?EnFPLPtcNebYn65EWE0fmfXWxEEmCWzSOj+cTtw5LjfwKDYceZDcPl5ERo?=
 =?iso-8859-1?Q?Fr7o6b+wMLs51KsO1VBh+S0XB69OizJF1TDjPw557W1x0XGkV/8r4winyq?=
 =?iso-8859-1?Q?A+Qjj/PpN/40jx3frnhQGd35nrdcjWCOO/Lgwg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?59m91GBI3I5qlY1eZ67zIaqpAot4tp+AHEyJvx1yJi+zz8sambJDGQXCOf?=
 =?iso-8859-1?Q?dGOPOEjPIlQ0e3Ey6U+QE1zyjYkCScv+hTzgpv6q92sCInczyPCx36Uh67?=
 =?iso-8859-1?Q?5Jm8lutdkVREjPTIOJekURuxww2XNHok7OlRYNz2eaag/lawaUsSDxPUI9?=
 =?iso-8859-1?Q?DF+ah9YleIP6NcUi/oaXubHQuhw6ibR30Zzx5do+K/CZ4+l4Wkd3vjqwhf?=
 =?iso-8859-1?Q?7z/cbrn3PnKASABJnLPNYe9HapGoVubaGb9ZBA6xqbBWDiI12km3xZ/8Iq?=
 =?iso-8859-1?Q?aPiXlTm20vdSuxoKgAsj/7k6mquw6HIWExaX0vRi2Es5vrJQy9oqEYxwBS?=
 =?iso-8859-1?Q?5hTK7osL+Myc4fvYWaC4Ru/CHNfkULqfqMQa7dR1+eMDkXsvb/2KLlJf+r?=
 =?iso-8859-1?Q?ou/ZJmVFNKHjXw4CSIfno5tmaAJYgj4erqKIQR4eWFxAjwgQYvD3feotKQ?=
 =?iso-8859-1?Q?FC7keMNZnLhsStv+UImxOE5NPrZ0xUexKd831t7wLormZPhI8+XN/WoOPc?=
 =?iso-8859-1?Q?WFOz0R4r9HmQ1gdH3oefxfQwR0aYUY7iMezezqSJj1Tu6EKr6gFMD6UbZh?=
 =?iso-8859-1?Q?gq0UnXjK3fuSJJwApImt/JbGhhXbzI1ib2WBKDT+gitMqMiFXKgVqBSteg?=
 =?iso-8859-1?Q?/J5FUC++8ZvhSMboBEzKV8o0MOMgj3WShwjNLq8Rqf7Izzkn2q22pkNYhq?=
 =?iso-8859-1?Q?d2xOIQI3G98vfb2HOpmfhmH7KNjcH+5yLdcRf3rWGQDXtz95so18fO2m7X?=
 =?iso-8859-1?Q?g/DuZzu9epWmXdqjHA1i/91uqdlUAuVrWkg7weH/S7Jyrmx/SI3rGk77Sg?=
 =?iso-8859-1?Q?qSirx3GZoSh7EWXODcy75qLU+sQmmz4xZsPl9AYMuqiWCrhIVxaNcL2QrF?=
 =?iso-8859-1?Q?dg+PqGwVI0B8FTLa1sJnvUfJDqpkgKnkO5Txx9X/ljhPKmrYrPBGzkfd6P?=
 =?iso-8859-1?Q?VAvlq6F4AfMxWtuE6AfwABFZi9BDXDoUyjWl8URpztV4A7VMB9Z/Mw7RP4?=
 =?iso-8859-1?Q?BdNx3X7+2uQmI2iCRgqXf8oTro5vNclqVWccJb4/OUf98/CR+LG3zQLBsG?=
 =?iso-8859-1?Q?XbubzFSJIDQn09Kd6z03MHV67sOT+ERel7CSUXR4xc28SnJkaZiooVJm1k?=
 =?iso-8859-1?Q?O6Ug2eF8XDZmFrx1cL16IB4rHjRFpSupFX07x+EmIXGNGoomBNHdTsAL8I?=
 =?iso-8859-1?Q?NdqsQ8Q3lG9EPgMhbVWBTYx5O3QSnIpnc3Quqo3wmUgCi0JJuRvHtaDmcb?=
 =?iso-8859-1?Q?RSpqoNzVoY5UKhJgq/xIXUAFE/ioCpy4eUg9BcuRia5qYOh0vtS0i+YeOR?=
 =?iso-8859-1?Q?bFHBkTFWyQfy2/j8AqCYoRmB7+WPKHwyq4qjicCrQ7Fde7TzE38Jsmkb0q?=
 =?iso-8859-1?Q?xaH5BaQGvqhMWIzOOpgeE8VUwWJ/IAJTP1MCBN3kzKnpMNvvjLf/tQiCTw?=
 =?iso-8859-1?Q?xMIfvuQi81L23yeoIGEy7VUQAWV9RMokp0qO18lSs+b7L92Y/do+Fhdae9?=
 =?iso-8859-1?Q?OWDfBJ95ujQQf9q0/WWdVRi+yJTU/vDdPf9vrrGcH2qOxbcwjgaj/mfKeG?=
 =?iso-8859-1?Q?qrG8W7Q6QEfiMfGUieqXhnEv4JO8Vc53QQDTTQg5b0P07vRfScbFnei1HH?=
 =?iso-8859-1?Q?pSwIBnpWxHG1DXD9hG+W1UmejG8/qmJO8O?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f99d30-6159-462f-246b-08dcda3d6c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2024 13:00:52.8676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zEc0nGa0IK3tEqDrJAJzwRYETPjyOh4CsWKi6+WIkXsuBSXTYiZehOTVemQuuhvq5EPi4vOF/D0EqTFFeYyfmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
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



>=20
> On Thu, Sep 19, 2024 at 09:54:24AM +0000, Winkler, Tomas wrote:
> > > On Mon, Sep 16, 2024 at 04:49:17PM +0300, Alexander Usyskin wrote:
>=20
> > > > @@ -0,0 +1,142 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
> > > > + */
>=20
> > > Please make the entire comment a C++ one so things look more
> intentional.
>=20
> > This is how it is required by Linux spdx checker,
>=20
> There is no incompatibility between SPDX and what I'm asking for...
>=20
> > > > +	size =3D sizeof(*spi) + sizeof(spi->regions[0]) * nregions;
> > > > +	spi =3D kzalloc(size, GFP_KERNEL);
>=20
> > > Use at least array_size().
>=20
> > Regions is not fixed size array, it will not work.
>=20
> Yes, that's the wrong helper - there is a relevent one though which I'm n=
ot
> remembering right now.


I don't think there is one, you can allocate arrays but this is not the cas=
e here.=20

>=20
> > > > +	kref_init(&spi->refcnt);
>=20
> > > This refcount feels more complex than just freeing in the error and
> > > release paths, it's not a common pattern for drivers.
>=20
> > What are you suggesting
>=20
> Just do normal open coded allocations, the reference counting is just
> obscure.

The kref here is for reason so we don't need to hunt the close open, I fran=
kly don't understand
what is wrong with it,=20



> > > > +		if (ispi->regions[i].name) {
> > > > +			name_size =3D strlen(dev_name(&aux_dev->dev)) +
> > > > +				    strlen(ispi->regions[i].name) + 2; /* for
> > > point */
> > > > +			name =3D kzalloc(name_size, GFP_KERNEL);
> > > > +			if (!name)
> > > > +				continue;
> > > > +			snprintf(name, name_size, "%s.%s",
> > > > +				 dev_name(&aux_dev->dev), ispi-
> > > >regions[i].name);
>=20
> > > kasprintf().
>=20
> > As I understand kasprintf allocates memory, this is not required here.
>=20
> There is a kzalloc() in the above code block?
Sorry  you are right.=20

>=20
> > > > +static void intel_dg_spi_remove(struct auxiliary_device *aux_dev) =
{
> > > > +	struct intel_dg_spi *spi =3D dev_get_drvdata(&aux_dev->dev);
>=20
> > > > +	if (!spi)
> > > > +		return;
>=20
> > > > +	dev_set_drvdata(&aux_dev->dev, NULL);
>=20
> > > If the above is doing anything there's a problem...
> o
> > It makes sure the data is set to NULL.
>=20
> Which is needed because...?

This is a boilerplate part, the content is consequent patches.=20

