Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B6AD1D3D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B919F10E261;
	Mon,  9 Jun 2025 12:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ax12rDFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED3310E286;
 Mon,  9 Jun 2025 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749471822; x=1781007822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IeJMhFnLohCrFlYva/SivwQ4Ids6mVhpgcW+zG6oZj8=;
 b=Ax12rDFjuENLxqHhlDEPMYD6SNBc363972Ds9RW9yeAes8u9wpsnOgd1
 iSwLqGNe6u3fLFDCbDpXwzrBwv60iFx33vhuE1Kodu4eMKQEe05XSgWdT
 rLXBvzRZcOVd9v0w6/qINj9saLsEr6O+6tgOGNixaWuPwiMXSLGgxo/Zh
 oQO4MdDYsEiiBjxPiKmnVfi6aOntS4VumsSD0ytbw4GG5ws/VZ/yRfvde
 6PC01qAUP+pXSPpQKY0DBCl13siir7B8bTd27zSCP4wRPbLRhHr4azVn/
 m2XPBVsWsSVK29tQ12ukPZ+kdivN5nHq7foRFva33iHjj2+jlg1znDp1P Q==;
X-CSE-ConnectionGUID: BOMzFNyiRzuNLtYcvQE6iQ==
X-CSE-MsgGUID: Pe3Y7FWxQquS16KGjpmX7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51250744"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51250744"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 05:23:42 -0700
X-CSE-ConnectionGUID: DT9V9qOXSji988bjchvtwg==
X-CSE-MsgGUID: gwMvWSIBQ262dfITPHsxfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="151494970"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 05:23:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 05:23:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 05:23:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 05:23:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLB+8qD5QJu96oD3iOeRyEOKtRxo+iDadFNLy6ognvxRWwZDFDlqFqWhTAKBi3UjqRP5WUHPzDqNLxNt9U2ra5fVdrM5dfaB+ejQu7rnBDIUsEq9R0CYavI/WCdOGLvVju0EXW4MStvFQPT3EgVZwlEVIKqzPmRkBLwe++PbulyjP4k/1krunaEHEBv9O+BUoCBz8MUSCgYYygdchyMK+5Jj5JZmWQrrWR4ORFaCiiIwMB8SE3J1Ia2e9PLKSGYKALDTUUnLxb2Y/ME7EJ6lSYG9cBeGwG2dvvmg9tOgTBpO5COT8W3O3k3HB59XmMJ6EHsJso7XqjPt1VnH1kBlQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeJMhFnLohCrFlYva/SivwQ4Ids6mVhpgcW+zG6oZj8=;
 b=xFo2WssYtB7cTo+YAZMF4dHBo8kcnz24hSBoh9URAF0ZMppdYkX75guSt9fgY2mqCq8m84JGfnFKqmzxXl48EYSUNBabAnviaV17bp2H0Dm019U1izvsUCSDwdPc7rhCLP+gSXBvb0DoQTsCE390qzaBo3QnXWKXPHFaBBCNwnn8sQZeToxcbzHt/Gx6cBG1ELhs+42rTStc1RbR5opAH88V6brN4Vle28DdiuKPUKO8qcP7ZO2gFigqHMrc61fHl9EZB9IL5BWsGoOD5fX+uKckmvhe3IyMXV747lUXNRNZy4JVO917DzfbA6VGnTl1qmPmL2Nh2/3iHqNxko8bQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ5PPF3F833FA49.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::823) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 9 Jun
 2025 12:23:25 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 12:23:25 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck
 <linux@roeck-us.net>
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
Subject: RE: [PATCH v6 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v6 01/11] mtd: core: always create master device
Thread-Index: AQHbi35N9ptLZMK+/0+KHmcJoUKk0bP5FNKAgABXSdCAANahSoAAWdKAgACSaAOAACUigA==
Date: Mon, 9 Jun 2025 12:23:25 +0000
Message-ID: <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
 <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
 <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87bjqyja7o.fsf@bootlin.com>
 <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
 <87ikl5xnbc.fsf@bootlin.com>
In-Reply-To: <87ikl5xnbc.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ5PPF3F833FA49:EE_
x-ms-office365-filtering-correlation-id: da6841e3-c139-433b-ce7d-08dda7506edb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eUQwSW9zQWFSK0Q1cWZOc1V1YXkrcmtTb0E1UjFjNGVBT0Yyam56VUVpVFVk?=
 =?utf-8?B?R3NvOE9zOC85czdtNkgzblJSQVhzUjgvMncyTlZwSGRheFRNejR6bURXcmZS?=
 =?utf-8?B?SEtNcEpYT0xVQ1JDZmszaEMrY3pRRVplaHFncVRNZWU3THMzWjRsRjNldmtl?=
 =?utf-8?B?NnJ2UTBmaG41c0JnK1FGUUFPemQ5ejVlN0NEeFdIL3QrcGdRbGtVaWZRYkJ5?=
 =?utf-8?B?bVZQcHJ0WTBOTWdxZ0tRenFHV01DeStYK2NvMkJoN05HeXdTUi9hL3JSWVRI?=
 =?utf-8?B?WkxDVlNvUy9YSWEyRGtEUVdBMWJkSEJwTmxWcGxPbytUWDBRcXNzUEtJekxK?=
 =?utf-8?B?ajlXTjJqaVB5L1FROUZGUzUwakk1ZkdwQjNvOFQwMmRzbzd4bDVka0ZucXBZ?=
 =?utf-8?B?WWJCUGIxVDVuZ281T1pudGhQYXVnN2NrSFFsNVQ3eHBJV01CZVMyQndaZVY3?=
 =?utf-8?B?d3N0ZWZEeTBWaWZaVi82UGxXK3hvM2tjaUZXc3hUeTdTdk1VekcvcFM4dzU0?=
 =?utf-8?B?YmRWSmhDdXlWUkZYOW9FeHozUzBCTVY5dXZobXBZZkR3NlJaQ3Zrb1I4MU1a?=
 =?utf-8?B?UHlFck5KQm1sTFpnR1ZPRmZJaFdralUxRlNHTnV4TDZnSE1RRndCS1VVRlVO?=
 =?utf-8?B?K0RiM0RDVzJzdWhrTHZKODgzWGd1THRRejF3bmdHVXdrQk1uZFFSVGpvcEFm?=
 =?utf-8?B?YTBLTTZJam9nbWw3d3dTTVdIK3dCdlNXRU53ZDRQWnY5SzJ5ZHEyTElVY1Zo?=
 =?utf-8?B?VEp1SHhWbjJJc29LY3dveHltMU1sK2RGVkNBOXBNTEtwbjJ6YTNvT0diOHd0?=
 =?utf-8?B?bGdaenRvRUI3Q0Q4alV4WEluaEtKYXJHdG1EYVgzcC9rWVpaS3NlVFBicHI4?=
 =?utf-8?B?VHp4K3FIRWhEY2FNYkxiaWhleTVKU1BOdGlRZE1pWDdVdEJpK2UzSVhyTzRS?=
 =?utf-8?B?aTB1YlB6Slk4VTRxejVGOSsvWG83dk5kRnRFd09xRmdFQjJCT2FNalV1SVZO?=
 =?utf-8?B?ZXhrK1B6V25rd2dPY2JVMnZsUEcwSloyelo5cTU2cjBaNHdRdTY2bUM1MC9S?=
 =?utf-8?B?VUlFSUZ3MVIxREFpeklDbjFra1FLQm5Ec3JLZVB5TTZyK0dadGRSeVVpRzRS?=
 =?utf-8?B?TUpBa1pVMGVQOXBaV0xiTzVST1hIekdpd0lsNGgzTkpScXgrQlNaUkpUdUJa?=
 =?utf-8?B?NnhmdjhtRmNrbFhkZWtNSHB6NUN4M1QrWnIxU25EWEs0Y2IybjNIYTY3Q0xy?=
 =?utf-8?B?VnExNVZKMDhaOVp4eFd6TGJsMlNMQ0lTcTZTUVpiSG9WZ1l6MVNiQksrdER3?=
 =?utf-8?B?eENOSVVGMTZyRVhjWW5YZXZuOGh0TXdVK3dmRjR5Z05hSWRKVXJIKzlISkpk?=
 =?utf-8?B?ZjAwbDBCQ3VlczdoZ1FkWEc0TFk2V002K0pJRUhEb1VTNTVlWnEwSWhrRWZp?=
 =?utf-8?B?OWIxaVM2L1h5YlBkZHovSlVWNm9xajhjcVNDeVJVZTMrTTlNYlBRRy9WNjh1?=
 =?utf-8?B?RHBaVnhNMVUydVVBbWI2VEpPQ2tOaGwzT1M0MXRUOG9URHVDRkVXdmVSd21P?=
 =?utf-8?B?ZUpLbC9VajA1dWZtZG1DYjVvNGJNcS9VRjNNb3NoU3phOTRQaEd4U0d2NGEr?=
 =?utf-8?B?Qjg1S3Jxd2RTbzZlMHV1dDV5M0QxZFEwd3RoYlhFZGJtdnV3NXdUd05pMm43?=
 =?utf-8?B?WU1VSXovRXpqaTNCRERGWHV6UTlqUDJZQThOeWlsS0NQSXR5WnI3UUp6cHpC?=
 =?utf-8?B?K2JrTDNCeld0R283TUdYNVVNNk1kRXZMYm5tTDhOTndoSExDNklVenRjTkl5?=
 =?utf-8?B?VC85bGtUeDlFWGdaeEZ4M05nQTdJdWZ4anJ0QnBXbThRWVIvTzV2aXUwUEdN?=
 =?utf-8?B?bXVYNmlicjFjakFNMnMxSzVIVkUvSVRtcFRFOStra2NzbDZBcUxaZVk5ZTNl?=
 =?utf-8?B?NCswa2lWQTFBM2tBL0M4ODByTzZwMXp0Ukh2VHJxOFhleFZ2a3Mzb1RVcEc2?=
 =?utf-8?Q?M7KhjwCTYQS8eabXu3BD5ZNV1YO+2Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1RzeWdUNjhvL2N3WHJqbnk4QVhzREM5WVBnZXlrcVNjK2d6U0doV0xZQXV6?=
 =?utf-8?B?VVJ2V2pNR0hBSkZ1QmRsWGhHWFB6VGY1d2s3S3Z0VFlJd2Zma1dxd2tkTm0y?=
 =?utf-8?B?NDRDMTcvcnEvb1gwd0cvZXo0TnpzSDdVcm1xb0lqb3RrUTJLeUdkVlYxa0tq?=
 =?utf-8?B?L1Z2RG1PSm1LaElXS1g5Tzg2bU5vOU16d3d0eVJTR3RzWUo4K1EwSUdZS2hB?=
 =?utf-8?B?WVR6OTVlbTFBQ284TmtSWWRDN0svVXNtczVkZTNzZ1lmWG1rZTFkRkQrUDk4?=
 =?utf-8?B?bVowTVJLZGw1SWVTMDZWWnQvRHBPV3VGUlRZbGdEVHJicHI1ZzJHSGxOM2lS?=
 =?utf-8?B?TzhiMFFPQ1dwNFFlQmU4dTR1MmxDeU1LSFRvS0JydCs2KzVhWkRZa0FZMVVp?=
 =?utf-8?B?S1U1clB1bUlLWjY1elQ5QklGYkJjemo4Qzl3WXBlbTlad0NSSnVNK3Njcmo1?=
 =?utf-8?B?S2tOSTN2YkdKV0RqN25EN3NaSkw5ckRoWWFOU1BPZzhkclZpbGdVRnkvRGFR?=
 =?utf-8?B?MytRMHdhNzBQbUNWcklraW04eUpwZUp4VlJyRkMxa1p0MCtzZ3lCaUJzWU1i?=
 =?utf-8?B?WWMvTHkxbzQ5VTJKdXBJMG1wU3g1RXp1c2NJSStNSFlaZWdyR1dTT3B0akZr?=
 =?utf-8?B?TXNOYXFzQ1JodUFrV0tySEtlMStEemtYZkpWRFREdGY1cEJaUEVtYUxpNjEy?=
 =?utf-8?B?RUtJLy92Si9jR3VYbFUzcVNObTRsMEplUC9LVytYL2hLZjcyWHM0dGJyVm5O?=
 =?utf-8?B?bTh3N2ZaVmZXMUhxdGxlV1FpUGlab3JpbExFTW04eHl6cHVkeUQzcWpHbUtM?=
 =?utf-8?B?dnVxYVpWYmZmQTg5YmhZbnRXOEJIUlBXWWV3VE9tSnpwZWlQcnVpTU5zSzlM?=
 =?utf-8?B?OWhkbFk3YmtiR2U1QzA4cTNPc096WWZoUm5ibTV1K0p3Z1FwUUpZa3VPeHBi?=
 =?utf-8?B?YzdmSWxyQ3dVV2czUWtVQXlpT2wwcUY1L0wrQ3p4R0I0WWQrYVpCSVpwdmpS?=
 =?utf-8?B?VzZFZUltWnd2dHVvVFVQRU5rQ3ZTYzBmNFFzUCtPeVdnUUc1M3lObVhNTGxM?=
 =?utf-8?B?eHBaV1djYTdTQmNOcEJ6Rnlld3h5VXloTFlwOXdZWTFmdWFUSjc3bmpVcERQ?=
 =?utf-8?B?L2hlWnY5RUFRZTltZ09LVmp0RWJsOUtCcUllVVR2eWdLTkFqRnZEa1l6dG40?=
 =?utf-8?B?WU9vd0JiWW9QVlVjNUdkUGxMbWlpSXA5Z05rYXZkK3IxUXdRa0FtZVp6bzBx?=
 =?utf-8?B?TGVPYTI4cXNQNjk5YWhWYUdoaHh1dnRFbkdnQUNSUTMvc1ZxK0lkOEI1c0Qx?=
 =?utf-8?B?NGVKS3FEUFRyOTl4akk4SWNkUnZjbEwrS0ZDR0t3SmFhUDRuQ2lQMVN1dHlp?=
 =?utf-8?B?NXI3Szh1a3Z4R1pFamplQ1RVaTlmMkpvbkhqUUxtb0VGbnNRY05sMkY2YUgv?=
 =?utf-8?B?UjJndWRWMmZqLzUwelpSaHlIZCtVVVkvem94K2RuVk5FcFVpMTc5V1krVXlp?=
 =?utf-8?B?OTROVCtlVDA3OFJOTFlMUHBpa0hCc1k3TlJXUmtRVTljYlpSMENQNDJnN1Ur?=
 =?utf-8?B?WFIxalBOM05QeDNaQ1o3dkE2cDNwMnp3T2NmRk1YUWo4eGpVMndwT0FlNWwr?=
 =?utf-8?B?SnI5WXgrUnQ3bE9xd3RpTHp4aDlMczNRUGVoa3cxK2pEQ3lYRnBXdHdmQmJY?=
 =?utf-8?B?NFE3QksvcFRJT3lQUktIbURkV2tWUVRUaVFmUXMzY21tdFdHcmtFZzM3RWNv?=
 =?utf-8?B?T2dBTVZUSUJ6VUpYeGNrZzN1dE9MRnpOUE9FZGZCQlBianB1VGF5UUszZEQv?=
 =?utf-8?B?S3RRN2ZtdDdzM0NjaTZOYVNhckhXUnEwLzNXaWx5Z3lEYk9ZODZtTTJJUEQ4?=
 =?utf-8?B?NHlqNDJlZWVyR0I3Unc0TUptNG5KS2ZJblZZK1B3emRkajZrV0F6c2RYU1I1?=
 =?utf-8?B?bi9mRVU0YkZsdkhBYkhYN3hQK3NDZmtkMit5VXExZU0wTmpENExOQnl2a3lz?=
 =?utf-8?B?ejJFclBIRmtnSjdiSnFOeGdFUUpOK1oxczluMTY1UXRMbENuZ2oveEhUUnpI?=
 =?utf-8?B?Z1lVMTBXMkpjRGRFc0UwTzBWSk12L2hMbVhGWkk1WnlqTlJydlBlclV6czFR?=
 =?utf-8?Q?mXkw8IRKenin/XebKOAQfsp8r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6841e3-c139-433b-ce7d-08dda7506edb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 12:23:25.5460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m2scWbucWDU4rjrPeJ8sGFSlfWsXH/zZZKZKB/X60Zzbs9eyktuI3dI7nse1PX9mUrWVZEbgdlQImPt6uGYAc/LE2G4IEAz7NhsCX4swSLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3F833FA49
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAxLzExXSBtdGQ6IGNvcmU6IGFsd2F5cyBjcmVhdGUg
bWFzdGVyIGRldmljZQ0KPiANCj4gDQo+ID4+Pj4gU2V2ZXJhbCBvZiBteSBxZW11IGJvb3QgdGVz
dHMgZmFpbCB0byBib290IGZyb20gbXRkIGRldmljZXMgd2l0aCB0aGlzDQo+IHBhdGNoDQo+ID4+
Pj4gaW4gdGhlIG1haW5saW5lIGtlcm5lbC4gUmV2ZXJ0aW5nIGl0IGZpeGVzIHRoZSBwcm9ibGVt
LiBBcyBmYXIgYXMgSSBjYW4NCj4gPj4+PiBzZWUgdGhpcyBhZmZlY3RzIGNvbmZpZ3VyYXRpb25z
IHdpdGgNCj4gQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVI9eQ0KPiA+Pj4+IHdoZW4NCj4g
Pj4+PiB0cnlpbmcgdG8gYm9vdCBmcm9tIGFuIG10ZCBwYXJ0aXRpb24gb3RoZXIgdGhhbiBtdGRi
bG9jazAsIHdpdGggdGhlDQo+ID4+Pj4gbXRkIHBhcnRpdGlvbiBkYXRhIGluIGRldmljZXRyZWUg
KC4uLi9hc3BlZWQvb3BlbmJtYy1mbGFzaC1sYXlvdXQuZHRzaSkuDQo+ID4+Pj4gSXMgdGhlcmUg
YSBndWlkYW5jZSBkZXNjcmliaW5nIHRoZSBjaGFuZ2VkIGJlaGF2aW9yLCBieSBhbnkgY2hhbmNl
LA0KPiA+Pj4+IGFuZCBob3cgdGhlIGJvb3QgY29tbWFuZCBsaW5lIG5vdyBuZWVkcyB0byBsb29r
IGxpa2Ugd2hlbiB1c2luZyBvbmUNCj4gb2YNCj4gPj4+PiB0aGUgZmxhc2ggcGFydGl0aW9ucyBh
cyByb290IGZpbGUgc3lzdGVtID8NCj4gPj4+Pg0KPiA+Pj4+IFRoYW5rcywNCj4gPj4+PiBHdWVu
dGVyDQo+ID4+Pg0KPiA+Pj4gSSd2ZSB0cmllZCB0byBtYWtlIGlzIGFzIHRyYW5zcGFyZW50IGFz
IHBvc3NpYmxlIGZvciB0aGUgZXhpc3RpbmcgdXNlcnMuDQo+ID4+PiBPbmx5IGNoYW5nZSBpcyB0
aGF0IG5vdyBldmVyeSBwYXJ0aXRpb24gaGFzIG1hc3RlciB0aGF0IGlzIG5vdCBwYXJ0aXRpb25l
ZC4NCj4gPj4+IElzIHRoZSBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj1uIGZpeGVkIHRo
ZSBwcm9ibGVtIGZvciB5b3U/DQo+ID4+IE5vIGNoYW5nZSBpcyBleHBlY3RlZCwgY2FuIHlvdSBw
bGVhc2UgZGVzY3JpYmUgdGhlIGRldmljZXMgdGhhdCB5b3UNCj4gPj4gb2JzZXJ2ZSB3aXRoIGFu
ZCB3aXRob3V0IHRoZSBwYXRjaD8gTWF5YmUgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIGluDQo+
ID4+IHRoZSBjb3JlIGxvZ2ljLg0KPiA+Pg0KPiA+DQo+ID4gSSBhbSB0cnlpbmcgdG8gYm9vdCBz
dXBlcm1pY3JvLXgxMXNwaS1ibWMgaW4gcWVtdSBmcm9tIGZsYXNoIHBhcnRpdGlvbiA2Lg0KPiA+
IFRoZSBxZW11IGNvbW1hbmQgbGluZSBpcyBzb21ldGhpbmcgbGlrZQ0KPiA+DQo+ID4gICAgIHFl
bXUtc3lzdGVtLWFybSAtTSBzdXBlcm1pY3JvLXgxMXNwaS1ibWMsZm1jLQ0KPiBtb2RlbD1uMjVx
MjU2YTEzLHNwaS1tb2RlbD1uMjVxMjU2YTEzIFwNCj4gPiAJLWtlcm5lbCBhcmNoL2FybS9ib290
L3pJbWFnZSAtbm8tcmVib290IC1zbmFwc2hvdCBcDQo+ID4gCS1hdWRpbyBub25lIFwNCj4gPiAJ
LWRyaXZlIGZpbGU9L3RtcC9mbGFzaCxmb3JtYXQ9cmF3LGlmPW10ZCxpbmRleD0xIFwNCj4gPiAJ
LW5pYyB1c2VyIFwNCj4gPiAJLS1hcHBlbmQgInJvb3Q9L2Rldi9tdGRibG9jazYgcm9vdHdhaXQg
Y29uc29sZT10dHlTNCwxMTUyMDANCj4gZWFybHljb249dWFydDgyNTAsbW1pbzMyLDB4MWU3ODQw
MDAsMTE1MjAwbjgiIFwNCj4gPiAJLWR0YiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVk
LWJtYy1zdXBlcm1pY3JvLXgxMXNwaS5kdGINCj4gXA0KPiA+IAktbm9ncmFwaGljIC1tb25pdG9y
IG51bGwgLXNlcmlhbCBzdGRpbw0KPiA+DQo+ID4gVGhpcyBpcyB3aXRoIGFzcGVlZF9nNV9kZWZj
b25maWcuIE5vdGUgdGhhdCB0aGUgZmxhc2ggbW9kZWxzIG5lZWQgdG8gYmUNCj4gc3BlY2lmaWVk
Lg0KPiA+IFRoZSBkZWZhdWx0IGZsYXNoZXMgYXJlIG5vIGxvbmdlciByZWNvZ25pemVkIHdoZW4g
Ym9vdGluZyBmcm9tIHFlbXUgc2luY2UNCj4gY29tbWl0DQo+ID4gOTQ3Yzg2ZTQ4MWEwICgibXRk
OiBzcGktbm9yOiBtYWNyb25peDogRHJvcCB0aGUgcmVkdW5kYW50IGZsYXNoIGluZm8NCj4gZmll
bGRzIikuDQo+ID4NCj4gPiBUaGUgYWJvdmUgb25seSB3b3JrcyB3aXRoIHRoaXMgcGF0Y2ggcmV2
ZXJ0ZWQgKG9yIHdpdGggdjYuMTUgYW5kIG9sZGVyLCBvZg0KPiBjb3Vyc2UpLg0KPiA+DQo+ID4g
R3VlbnRlcg0KPiANCj4gQWxleGFuZGVyLCBjYW4geW91IHBsZWFzZSBpbnZlc3RpZ2F0ZT8gV2Ug
bmVlZCBhIGZpeCBiZWNhdXNlIEd1ZW50ZXINCj4gbWlnaHQgbm90IGJlIHRoZSBvbmx5IGFmZmVj
dGVyIHVzZXIuIE90aGVyd2lzZSB0aGlzIHBhdGNoIGNhbid0IHN0YW5kLA0KPiB1bmZvcnR1bmF0
ZWx5Lg0KPiANCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQoNCk1heWJlIHNvbWV0aGluZyBpcyBtb3Zl
ZCwgYW5kIGl0IGlzIG5vdCAvZGV2L210ZGJsb2NrNiBub3cuDQoNCkd1ZW50ZXIsIGlmIGl0IHdv
cmtzIHdpdGggQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVI9biwgY2FuDQp5b3UgZHVtcCB0
aGUgbGlzdCBvZiBkZXZpY2VzIHRoYXQgeW91IGNhbiBzZWU/DQoNCi0gLSANClRoYW5rcywNClNh
c2hhDQoNCg0K
