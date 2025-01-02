Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816669FF9C2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 14:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B00A10E0C6;
	Thu,  2 Jan 2025 13:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zr+T/JE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C60810E0C6;
 Thu,  2 Jan 2025 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735824093; x=1767360093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xpAKtWRVJd+dNNRwX4u9VDDcel9mTjuNBvArS30HMUM=;
 b=Zr+T/JE7x3I8ppCGPcWioOD7vRBuXxppfEeQIFsu+Ra69G5Yo2/UcmkT
 pP45mrs+oCUJWtYslHOVus4heIAWZQGs8J4L+Mt/9Z2DNVv8nMdzssPsM
 jH6PNNzQ2oQlcC0Fzt4iolRAibchBktXc8KEUD30lwbJSBewdzMdrP0s/
 9o29qAX8ry7kE6SPPiNhoM1GE7KgZUWUMcmN30U33DgMyw4Svan4fpUsY
 sgJJjzplq4y/C2rO27lzJEfm5DUUulo1mz6MkFFHC4RMeFavmqlwT+AMK
 48wvo14tp+IKhQgT4/4Uiu7zz+NoRgoxnVS81EjGA8BLYksY0zYKbOkb2 g==;
X-CSE-ConnectionGUID: VLA78pE9TQONCFuKnd5g0Q==
X-CSE-MsgGUID: rIjzfQokTMq+BclHtBDUAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36281900"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="36281900"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 05:21:33 -0800
X-CSE-ConnectionGUID: W1V9LIDKR5SD4axYnOnxhA==
X-CSE-MsgGUID: rQXu7t2FTi2hhDDjftN8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101347385"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2025 05:21:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 05:21:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 05:21:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 05:21:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6m2HOkocQGWelWoAXSJ01vikZwjh0ZEzIfxtzQ26w+lmgE5suGvdK88uugsCUgUMGEOd0PKP2lD+Z+udsZEHBh0KZlkJltRC7gRCo4wJsLDmBgUQ2e/yQ4rg571EGRdyhVBBZHJcrod3hpx+aJUUyWfuqb3gstAaQaSC0OB4XsKJnwMdYXEjN3NE2FOGKuv47gSrQXZqYhOFeiHNxSAfsub4yTNmXsgFhnvPja8AO2WbarRTPSq8Z/fej1J2v+wyGqe9ZZ6844/5Ff9Wlo+ta/tB7+cYHJTnvp5YpJ707L4KOg3IgjL4rCkmTI0Q2NcaDu8x7VRjg0KcDKEVKHDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpAKtWRVJd+dNNRwX4u9VDDcel9mTjuNBvArS30HMUM=;
 b=ZSMfIhs2J8G3ri+Gd9n9lmdB7l8Yzb9uNGQ3dCceBprEjHv30kWcEkzZoTFFS4TU5ElBuGyEx1Fj28Zi0lSaQQXFJdVnjsh4bIEwK+sq/q1nc01igzKKwILvEj0cbivJzXXJ/g4mbmmNiAjq1gs77vDpP/5Oh8mxzCVGtQ0Yal84oT/5zL/qZM5drY2IbUG4Zm8kK5cIK3xQ2tTHtnRCSxbJf0/7//1NpdyOoLmRCHTkyV/SjKrCeE57ZcwgLyO3c6277zKC3iN2ylvSZUui367DHSitVmgc0W3P4cl7Gic/vFDI9H0IjHMwqsUttgDp+u/93Lk40R1vPa1vmWox9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 13:20:44 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 13:20:44 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Tomas Winkler <tomasw@gmail.com>
Subject: RE: [PATCH v4 02/11] mtd: add driver for intel graphics non-volatile
 memory device
Thread-Topic: [PATCH v4 02/11] mtd: add driver for intel graphics non-volatile
 memory device
Thread-Index: AQHbXGTtGGP/1CG3iUSlqIRDeU09/rMDSnCAgAApEzA=
Date: Thu, 2 Jan 2025 13:20:44 +0000
Message-ID: <CY5PR11MB6366A3FD539462F8473D24DCED142@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-3-alexander.usyskin@intel.com>
 <2c89e56d-26e9-4ef6-9da3-4b0121163b30@wanadoo.fr>
In-Reply-To: <2c89e56d-26e9-4ef6-9da3-4b0121163b30@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB8569:EE_
x-ms-office365-filtering-correlation-id: da835260-3e97-485a-01f4-08dd2b30438c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?aTB4SFBQc1ZSYS9JR0FrOTR0YnJOeGdFMkpla2o2L1FWVjFWdlhFdFRJWmwx?=
 =?utf-8?B?STJiN216RWV5ajRiWGFwSFVHODBRZ2lKOHN4ZmdqVGhoRlBEdEJaWGRpVVVF?=
 =?utf-8?B?OG9UcHhvTEJjMWF1UEtObDFvenUzaHFIZUtLMlVyL3BCa0dPTWI1S2xRYVd3?=
 =?utf-8?B?cWtBVDlmRWYvWHFmMU9FTjQ0NGRjMnNZdjJDalQ4T3Uzdi9VOTFJemRtb0Qv?=
 =?utf-8?B?ckVWZmQ4VU04T3h6MlVRRnU2R1k5TCs0d2lFeWYwSTFST2ZmcXVNWVowUEdi?=
 =?utf-8?B?cGlWZHRLQjZRTERQN2h1L0hPWmJnY01qU3MzT0l4L3NxdmM3MmpJOUI1QjlL?=
 =?utf-8?B?WGVNYmRYajY0M0NaQU91bUVmd29qYlovVTFQSXBzQk5QdzUvUkN2a3NtRExZ?=
 =?utf-8?B?dUR0MnBybXNzN3BhWVVabUdXbTJhcnJKeDR1WC8rVHUrcjYyY01TWHdvRlpt?=
 =?utf-8?B?bCtzU3lkMWFweXlLdmFQRVNaSXdqRWo2dGN2ZEdpT0U2OHJTenVHbFhmdU1z?=
 =?utf-8?B?SUlEK1JVSnU0YjQ4SU1UNlZMTkY3YTJrUTYzRGVkV2RpZlhhcVpUNHNVaWR6?=
 =?utf-8?B?UEF4SXp6YlpSTmFXeVo5ZkcwVlNwTXBnRHc1byttKzh5U2xObStrVUJZd2lN?=
 =?utf-8?B?TXgyaldVWEUwNXJLZG1xc1RkRkhiVVFzQjB6VWhUOU1jMFBMbUptMEhVK3hU?=
 =?utf-8?B?U2p5ZVljUFRXVzRlNVdIOFRjRmpwRm9XakRVT01UTVpLOEdyQWhOVzVGKzFl?=
 =?utf-8?B?MmVub2d1NU9NdDMrRVVlRVlac3FJQWhPRGhibHdrRVBvNFpPeTlFcWtpNHEw?=
 =?utf-8?B?TU84eERMZGxBMmpwdDFCbWIwTnFYZGdUVHhaY3piaFkzaDZyTzR0T3QvMS9n?=
 =?utf-8?B?Mm00UTdzeXlGQlN1S3I0WE5NTGk2MUtkd3M2L0NnM0YzL2pGUWtNZEdDME41?=
 =?utf-8?B?OEUxU0xCMThjN0paa3d3L1F3WndhN1FqTXYydThPaWx5MmpzSHZ1WDd4cjRO?=
 =?utf-8?B?NDZYaytmbnRGaFMyYzg2Z1ovbE55MTY0ek4wc2RSdENsY0hyYk9GSEZDVkxK?=
 =?utf-8?B?ZXdHMk5DUFhIUnpLUnFpRjlhbVdGRkdaZEIrcldXamFkYUtDSmJXZWJQRy9t?=
 =?utf-8?B?MUZXT1BNSXdsaHlFMGFqOGpndHJtOTBQYkNTc3JBbkNBNFZUMnhBcnAvcE5T?=
 =?utf-8?B?WXZaV2xtZlljRU9MZGl2dDlBZk1QbzVWY1Z0WGY3cEJJM1VVejBCb2QvZ3dC?=
 =?utf-8?B?Yzgza2hjaXFyMDFyNmVESE5WV2tnWnozazF2QmROdndMR3VPRngwTXpTNFR0?=
 =?utf-8?B?b2RQSzFqZW03TUtzWi90dWxWc3ZzVXNmUVlCc3hNd1RHSVNZaXdtWW9UR3U5?=
 =?utf-8?B?b2d3U3RIakM3dExQWWE0aklFYjZybVREL2ZkZUZyd0oyTjFyQlFjckZyYkdr?=
 =?utf-8?B?dm14MTBuRDFGNEo0YjhGaUpQWTVyaXM5MDJqVkdTVkxkOGVKRnlGSy9HbWRP?=
 =?utf-8?B?RUd3TW15a3JveUdHaTZNSUZpSHc3ZitycnBSdFlsYXprSzhaS1pVUyttYzVp?=
 =?utf-8?B?SFJLbXlrZEp6MUtKbDFaRFYwQnhDMS8vcGRXdEI4c2docGNRSE84OWN2ankx?=
 =?utf-8?B?N3phN3VzKzdUUEUrRDQ2R2JYOTJ0VERZM003dHFGTDRidXA3ZjRsMVRub0R1?=
 =?utf-8?B?Nml0VlZDRCtyMlZMaXNaaEpOZExhK2lYVk1RQ0FpS2g5ZU9KcG55c05mRDR3?=
 =?utf-8?B?dmlBaGkrSG8zL2J5VFl0RjJJTUJTQU5SMm9MVnYrVC9VUm4xSnI2OEMrUXdH?=
 =?utf-8?B?ckhCMm1mblFycTIwcDNSZWlNSTM5UzlNeGhabzVSZmxmNFVqUXU4WnNZY1VZ?=
 =?utf-8?B?dUh4UXlGMTAwS01TOFJpcDlUaE12ekVTYWxGS1VZNi9RVUJWTURoWEpUaGhw?=
 =?utf-8?B?Sks0M2dBdHhIcHFOT1VJdk0zOHdQcm9DMEE0M3MvQjZCUmJUcUNIUjhqU2RU?=
 =?utf-8?B?cmNWZHEvb0pBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWZyUnNUbjJwd0MzTzhHQ1c3K0NBOStkS1lQYS9uWlk1SjRzL1QzRmRpU0RZ?=
 =?utf-8?B?SlJjVnZwSWczTk1KVWxjM3laYnZEMWFtTTFKd0g1T21zZCt5bkM4T3A4bWRS?=
 =?utf-8?B?TitPWFA3dWwxZkoyUkxsLzFrVUdwai85YmtMWXZRVXBROG5ibU9OWVBKY3RE?=
 =?utf-8?B?WUpOZEgyc3lETWpYU21wM3grbENZZVA2Tm85dlp2ZmhrSHAzczRXSUNiYmM2?=
 =?utf-8?B?ZXlRTllnUW5CcW9hTXN2My9QVDVKSURnR2tLZTdDQllkVWoxNHhlY1QxbXc0?=
 =?utf-8?B?UVJwZUdWYmN5MDJhWE1MRnlqTmRMbGRKNHJ4VzFDaHRnVkR3cEpGZkNOdUl3?=
 =?utf-8?B?czdpKzFlOHcycU1tY2doZ2IxUTFkV2NNdHNCQ01tOVZ2L0I5WW1Jb0wwMWxC?=
 =?utf-8?B?YU9jdk0wczRJSGhDWnJoV0ovalJpQ0d4UWxNcmxsYmZnWW54c2RaTzNqTWx0?=
 =?utf-8?B?bUJJdW53aWU0aEJsZUh2NnZJUnVkNHBScVpUcnBiTGZxekVzSWRzdEZ3RWx3?=
 =?utf-8?B?T0NuU1NUbDdsV3M3enM3eWk1ZTE1L21QY081bUs1cWpkVThxS3VlaEJPeFA4?=
 =?utf-8?B?ZmQ0ZWZRZ2VETkd3dXdFTUFCTDh0ZTEzOHkrQ1BENlFDY0hMTjhvellHb3Zm?=
 =?utf-8?B?cjBwZFdCcGR5cXg5dU9pdldwRTI0Smw4K1B5dXFJQlNvMnpjbElKWUt0ZTVa?=
 =?utf-8?B?RW1lVzJVdUNCbU9jN3U3ZXNzMFNnMC8raGlhcTZQbXhqTUI2ejRlZ1JFSmh0?=
 =?utf-8?B?OGlvbWhpVTR1TS9EakxjTU5WTDdMQVg2RGk4Y05Dd0V3bmlrb3VFUnRJZHk3?=
 =?utf-8?B?YU5SR2haTlNDSVlJbFJLcksvOVkzRzFSdDlGK2UvUy84dEU5N0g2bS83WDc3?=
 =?utf-8?B?RjVGdHFPSDhEVEJaMXRwMUhzQUk3YzRZajBzSVlCamN4YzhUd3FxRnBXc2VL?=
 =?utf-8?B?U0p1ZTRNZE9lSFl6anorYkFiTXdOSklaTmloUDlYM1AyL0ZNQS9iRG1LNnZE?=
 =?utf-8?B?dXlsSytJblZveC80Z0RXMnl5N0hCZHlxZVhRaGQzSU1wcTN2d3dpVjhHV1lB?=
 =?utf-8?B?em5FNkZ3MEZkSlZQeXBwYkJxMzJLN0tpRlI5N3UvTW44MFIzY0xRd0VDc1E3?=
 =?utf-8?B?c0x5VEpsVmJlN295dWJ3YlMwczlSVmVVaS9zelRENlJ0V1FvdFZSRmp1SUsy?=
 =?utf-8?B?VytDUytwZnRWYVN3MFZUZEhWTERlU3p3UGNaWFhZRWlIdHJOMHF0OFkxQ1M3?=
 =?utf-8?B?ekI5enRDM1Eyc2cyVnZEampldWpaMXBOaStBdmVJai9rd2FwbDlSck5mdFBi?=
 =?utf-8?B?Q1NST2RiOHByT3plMEtwTzZ1VWp6NytUZmswT3NlS0F1S2trMzZONUdYVHlt?=
 =?utf-8?B?MFl2OUs0TUJKeHhaSHhLamEvUVBta2lUVDNycHZ6Mm5YeTZUdnNUWWc2bkZi?=
 =?utf-8?B?SG95THA1TzY3N1ZMUEtVNUxnRUFCZFA2UUs3aXhTR0k5dWVCRXNaY2xOencv?=
 =?utf-8?B?b3d0TU1oUTNLb2hCM25TNkF4QXdqTXU0L2plc3k0SEhPdWF1Y1pRUEVoL0s4?=
 =?utf-8?B?L0dGSHpTL3NSc1J4T2FrQURTZ1gyVUxvbTlVcWE0QytJakdQMWxaVmduZmdw?=
 =?utf-8?B?ckIzQ3Z5MUFSUWNqdVU1dDc1azhjd2kycFJVd1ZJRnJpWFBtdTBjSHpMYkwv?=
 =?utf-8?B?T01QNDNQWnR5OHo1clA0SFR6Z2JXdnZ2M1IrYTJvQ0IyNHhJT2NJRk0vTmg5?=
 =?utf-8?B?ZG1ha21MVUxkUnR4cm16aCtTYjFZWUxTUnJPMlR1b3g0RVBTM1kzZENIUFZm?=
 =?utf-8?B?eXlXUmFFNDdLeEtpUlFpUmlsL3NQWVcrM0lqckFQNlJ5MXkvSUJuSW5wbHpk?=
 =?utf-8?B?YUJQTzlXSTJiTmNPYjN3aE9aNnA2M3QxTHkrWCtSczNpbW9BSXBPSWNSc0ZM?=
 =?utf-8?B?VER4MmEyWUZreUNVbTd1K2xpL0dFa2lPNVZLOHN6ZHRkd0RieERjVlhjYi9J?=
 =?utf-8?B?bkRFbjJwOEo3Y28rM2VMZWpKc3EvMjJVeUpRTEdDQ0VFR1pJOVJmY0ltM1Nr?=
 =?utf-8?B?QU5uTnhzZVZOWjE5dFYwZzBnWWxYV1pZQlpYNmR5aFZIUlZPNkE0cS9hTDlx?=
 =?utf-8?Q?r6RDM9fg0/RK9JKFLQxY9zSok?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da835260-3e97-485a-01f4-08dd2b30438c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 13:20:44.7871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MsEQVxgGNU7jNPOCI8HglpBQgN8UqvkU0HZJDDYUpCjR3vhoxtw+cb9r7gBLTFt3kkii+6IYh+7bgMQghLJYyNY+SdEt4NjmQim73XJOkUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
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

PiAuLi4NCj4gDQo+ID4gK3N0cnVjdCBpbnRlbF9kZ19udm0gew0KPiA+ICsJc3RydWN0IGtyZWYg
cmVmY250Ow0KPiA+ICsJdm9pZCBfX2lvbWVtICpiYXNlOw0KPiA+ICsJc2l6ZV90IHNpemU7DQo+
ID4gKwl1bnNpZ25lZCBpbnQgbnJlZ2lvbnM7DQo+ID4gKwlzdHJ1Y3Qgew0KPiA+ICsJCWNvbnN0
IGNoYXIgKm5hbWU7DQo+ID4gKwkJdTggaWQ7DQo+ID4gKwkJdTY0IG9mZnNldDsNCj4gPiArCQl1
NjQgc2l6ZTsNCj4gPiArCX0gcmVnaW9uc1tdOw0KPiANCj4gX19jb3VudGVkX2J5KG5yZWdpb25z
KT8NCj4gDQoNClN1cmUsIHdpbGwgYWRkDQoNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyB2
b2lkIGludGVsX2RnX252bV9yZWxlYXNlKHN0cnVjdCBrcmVmICprcmVmKQ0KPiA+ICt7DQo+ID4g
KwlzdHJ1Y3QgaW50ZWxfZGdfbnZtICpudm0gPSBjb250YWluZXJfb2Yoa3JlZiwgc3RydWN0IGlu
dGVsX2RnX252bSwNCj4gcmVmY250KTsNCj4gPiArCWludCBpOw0KPiA+ICsNCj4gPiArCXByX2Rl
YnVnKCJmcmVlaW5nIGludGVsX2RnIG52bVxuIik7DQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbnZt
LT5ucmVnaW9uczsgaSsrKQ0KPiA+ICsJCWtmcmVlKG52bS0+cmVnaW9uc1tpXS5uYW1lKTsNCj4g
PiArCWtmcmVlKG52bSk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgaW50ZWxfZGdf
bXRkX3Byb2JlKHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphdXhfZGV2LA0KPiA+ICsJCQkgICAg
ICBjb25zdCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9pZCAqYXV4X2Rldl9pZCkNCj4gPiArew0K
PiA+ICsJc3RydWN0IGludGVsX2RnX252bV9kZXYgKmludm0gPQ0KPiBhdXhpbGlhcnlfZGV2X3Rv
X2ludGVsX2RnX252bV9kZXYoYXV4X2Rldik7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlICpkZXZpY2U7
DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGdfbnZtICpudm07DQo+ID4gKwl1bnNpZ25lZCBpbnQgbnJl
Z2lvbnM7DQo+ID4gKwl1bnNpZ25lZCBpbnQgaSwgbjsNCj4gPiArCXNpemVfdCBzaXplOw0KPiA+
ICsJY2hhciAqbmFtZTsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJZGV2aWNlID0gJmF1
eF9kZXYtPmRldjsNCj4gPiArDQo+ID4gKwkvKiBjb3VudCBhdmFpbGFibGUgcmVnaW9ucyAqLw0K
PiA+ICsJZm9yIChucmVnaW9ucyA9IDAsIGkgPSAwOyBpIDwgSU5URUxfREdfTlZNX1JFR0lPTlM7
IGkrKykgew0KPiA+ICsJCWlmIChpbnZtLT5yZWdpb25zW2ldLm5hbWUpDQo+ID4gKwkJCW5yZWdp
b25zKys7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKCFucmVnaW9ucykgew0KPiA+ICsJCWRl
dl9lcnIoZGV2aWNlLCAibm8gcmVnaW9ucyBkZWZpbmVkXG4iKTsNCj4gPiArCQlyZXR1cm4gLUVO
T0RFVjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlzaXplID0gc2l6ZW9mKCpudm0pICsgc2l6ZW9m
KG52bS0+cmVnaW9uc1swXSkgKiBucmVnaW9uczsNCj4gDQo+IHN0cnVjdF9zaXplKCk/IChhbmQg
bWF5YmUgbm8gbmVlZCBmb3Igc2l6ZSkNCj4gDQoNCldpbGwgZG8sIHRoYW5rcyBmb3Igc3VnZ2Vz
dGlvbg0KDQo+ID4gKwludm0gPSBremFsbG9jKHNpemUsIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYg
KCFudm0pDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsJa3JlZl9pbml0KCZu
dm0tPnJlZmNudCk7DQo+ID4gKw0KPiA+ICsJbnZtLT5ucmVnaW9ucyA9IG5yZWdpb25zOw0KPiA+
ICsJZm9yIChuID0gMCwgaSA9IDA7IGkgPCBJTlRFTF9ER19OVk1fUkVHSU9OUzsgaSsrKSB7DQo+
ID4gKwkJaWYgKCFpbnZtLT5yZWdpb25zW2ldLm5hbWUpDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+
ICsNCj4gPiArCQluYW1lID0ga2FzcHJpbnRmKEdGUF9LRVJORUwsICIlcy4lcyIsDQo+ID4gKwkJ
CQkgZGV2X25hbWUoJmF1eF9kZXYtPmRldiksIGludm0tDQo+ID5yZWdpb25zW2ldLm5hbWUpOw0K
PiA+ICsJCWlmICghbmFtZSkNCj4gPiArCQkJY29udGludWU7DQo+ID4gKwkJbnZtLT5yZWdpb25z
W25dLm5hbWUgPSBuYW1lOw0KPiA+ICsJCW52bS0+cmVnaW9uc1tuXS5pZCA9IGk7DQo+ID4gKwkJ
bisrOw0KPiA+ICsJfQ0KPiANCj4gU2hvdWxkIHdlIHNldCB0aGUgZXhhY3QgbnVtYmVyIG9mIHJl
Z2lvbnMsIHNob3VsZCBhIGthc3ByaW50ZigpIGZhaWw/DQo+IAludm0tPm5yZWdpb25zID0gbjsN
Cj4gVGhpcyB3b3VsZCBtYWtlIF9fY291bnRlZF9ieSBiZSBtb3JlIGFjY3VyYXRlIGluIGl0cyBj
aGVjay4NCj4gDQoNClNvdW5kcyBnb29kLCB3aWxsIGRvDQoNCj4gPiArDQo+ID4gKwludm0tPmJh
c2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2aWNlLCAmaW52bS0+YmFyKTsNCj4gPiArCWlm
IChJU19FUlIobnZtLT5iYXNlKSkgew0KPiA+ICsJCWRldl9lcnIoZGV2aWNlLCAibW1pbyBub3Qg
bWFwcGVkXG4iKTsNCj4gPiArCQlyZXQgPSBQVFJfRVJSKG52bS0+YmFzZSk7DQo+ID4gKwkJZ290
byBlcnI7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJZGV2X3NldF9kcnZkYXRhKCZhdXhfZGV2LT5k
ZXYsIG52bSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICtlcnI6DQo+ID4g
KwlrcmVmX3B1dCgmbnZtLT5yZWZjbnQsIGludGVsX2RnX252bV9yZWxlYXNlKTsNCj4gPiArCXJl
dHVybiByZXQ7DQo+ID4gK30NCj4gDQo+IC4uLg0KPiANCj4gQ0oNCg0KLSAtIA0KVGhhbmtzLA0K
U2FzaGENCg0KDQo=
