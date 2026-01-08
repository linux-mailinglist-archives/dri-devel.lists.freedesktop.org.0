Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF58D013D4
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 07:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E5910E697;
	Thu,  8 Jan 2026 06:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VI90Nfx2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F67710E236;
 Thu,  8 Jan 2026 06:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767853506; x=1799389506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2rUTcMgvd6qWa/tixdnpwKtzS6bLFRIx9PI/HasvRUo=;
 b=VI90Nfx2CDFNzSDLXT0Vra/av3lTxJmPdNm5pPer3lJbUktnC8hVl2ZQ
 oJT3ijHhwQqFJyAS71wXZbEJmG6ljnurIYtipoDmTSwj6Vg8Vrj6vfrxP
 jze9kLdElYxIPfKXdl1UJCG+3nVS5IsBVopy9sl1mY0lKZbmBJ3nhqFio
 PtLwi2TqVkIU8Gj1uC99GuceQsc4733jZS2Gw9WHt6gT0XB7932ZNNHoy
 cYS5aP7RetXCGSMsNiSTbTSpTwtY8KytyAf508px0XZm6FaV7Hp80276I
 4vaaaLFj5LEO39OuMv6AWEFQxiz1KzC1NjqieIkgLxf4O6cVAkp6si58t g==;
X-CSE-ConnectionGUID: ArbBRA+4QDaCpSWL1gl5Sw==
X-CSE-MsgGUID: D0mDcgGHRBCRLLzbto0Sww==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94693053"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="94693053"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:25:06 -0800
X-CSE-ConnectionGUID: kn6TjsodQbOexCxHTaM3OQ==
X-CSE-MsgGUID: Zsq1TYv7RhadzepC6cruWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="226563610"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:25:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:25:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 22:25:05 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3FY4ASo/r7LJSPiJcseehukOkLGjaBpXZXrlrplexuOXJIymM1nfBdv9dkgFX1quPlNRhICAApBzJ1+Fb3N1TjhEToncbtmcHu/6g7wZ7ipoFeg+tfOVNLx0KalVizeOyGymLgRHcVSHXrTzphKegeOG72/UfZMxS9xKXbagKSen7kKjd27YdNgjV/W4jduPjnxu3sDLKRe4nKIAevs3t//n+tKua2rb545qcZ7R9ZskNMLuA0c9PXW40qZ8XX4z1Y79MO7adFlwbVX4GC3IUxTFhpasunq+yrpmSGqYRVswPtG2hByMXfq/N9V8Y0KDNoMxY8yjul7wdBkn5sWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rUTcMgvd6qWa/tixdnpwKtzS6bLFRIx9PI/HasvRUo=;
 b=w+o8HyMKi/1rXhNq83pOnKTV+oYu91EzaaLb5ZGf9sdV9HAxIbCXnYGMOZ7JYNSW2mwRLDodnSiGBOxnx7zCTByj/8M2/zACletiQ+HytQwKLZCTGt8dBzfn3AEq7sSrYGlylbCjwOtqaupH8s6pjTRoE8DAcyHOawHem6BaU46fGgPsaiEw5rrPzoidhqFAHTT+6/hdWq7kJRdOBPUc4F3eigYBNBhUibIxq0p63Zab3vD+b/dxo8Q7FVhXvggXAfOeLt15N69FWfDU+5SEgQlQUc7mWsggVx4jPuRe4RSow/0OyUWLep8MdUIU16J5eGRu146NNz8UdWp74wJwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6041.namprd11.prod.outlook.com
 (2603:10b6:8:60::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 06:24:56 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 06:24:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v7 5/5] drm/i915/display: Error codes for async flip
 failures
Thread-Topic: [PATCH v7 5/5] drm/i915/display: Error codes for async flip
 failures
Thread-Index: AQHcfsaX3NyCVqJhaka2Jw8AuNWJNbVH0VZg
Date: Thu, 8 Jan 2026 06:24:56 +0000
Message-ID: <DM3PPF208195D8D98B68F11F3AC2366313DE385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-5-d51d9a351684@intel.com>
In-Reply-To: <20260106-atomic-v7-5-d51d9a351684@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6041:EE_
x-ms-office365-filtering-correlation-id: e4323993-3d63-4abc-e1db-08de4e7ea48d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TnN3STluWUZ3b2prQzZ5cVJGNGk4dGh6UjhpUWZzRDZGdENONXNwQStubVNK?=
 =?utf-8?B?Qm5OUWJqQWZNSlFUeFdidkZKTWE5SzM5Y09Da0gzT1FuR3loeVNaN3REc1kw?=
 =?utf-8?B?TnZkWTVNcTVtbjAwZ2NBQ2JTQlVTUExlN09SSGpTaWZjekJqVHBXRE51OW5u?=
 =?utf-8?B?LzFYa3loeHYyWlk4bEFUY0oxa2hQVnl0TUFSMDduRHM3NjVZcXJ0TDlJRkYy?=
 =?utf-8?B?T29JVWlXOEoxVVZHcy9QQTBZZVhSdGlJOGlTN1JTVTdMMTVpc0p5ejdGdjZw?=
 =?utf-8?B?OTdnYkxGK2NialFFaGpmT0VqMlVVUEd5U3g4bmJoVW1qMldSR0gwUy8vT0k4?=
 =?utf-8?B?SmVJRTVMeFBKSFExWEhVM3ZsVElEQTZOY0w1UjVSSW9FUHg2QktBQ1JoTkpH?=
 =?utf-8?B?OFJzQjNBYTdrSUl0Vnc5Uk12WGhTaW9lNk1SV05QeG16RkgxZXBlZ25UMEFU?=
 =?utf-8?B?MEQrWHNaWlJZNmRIU1dpSC9JN0MreVpTK3I2YVU0MWxoNVJ4MmpkYzFPQXYz?=
 =?utf-8?B?VnRaS3YyYVlBYWY4U2U1OFp6czZZUzJ4TkJXMjdNOHUxWWRJdnlDOCtGR2Jr?=
 =?utf-8?B?NERGUldtQ2prQWxVSjh2N3lPaHBpdjFtODVsUnhTQzl5b1RscW03Qk5TZGgv?=
 =?utf-8?B?ZWFDL3dmandtVDRodlRYYjZTSmNXMjl0Yk5QSEcxSEdDSC81V1F3U1VKS2Vv?=
 =?utf-8?B?UmlnZUJGaUc2cjkwZHpzYTJvbjNFaTlWUDhRRVFMS0dtTDJycVRMbWRpbmZo?=
 =?utf-8?B?Q1Mya0tnVk9nUENaTFk0SE5yV2pGMWozR3NUNTZlRkZveHZaRmdUVzFQS3dl?=
 =?utf-8?B?MEVoemt3RTRYQy9JN3d0cWdKQk5FOGUyYUJzaGs3UW4wWVdNTTYyWFJtaWJZ?=
 =?utf-8?B?cWgyZDF0MFEyVmIvMUR6bnlpWGtIV29IVlIrQVRpK01QWGdDTXRXOEdkWkJj?=
 =?utf-8?B?dXAwUExvZlF3bkxmUk5iWEJJTTNDVkkrR0J5ZEZiVVJTZFNXUmtKakFKWjR2?=
 =?utf-8?B?Q1lMeUVJVDhDSFU3NzdsbFpadVRXL0N3Vm9DRlhJNTR1d3hWT1dLaUZxOGVD?=
 =?utf-8?B?SVVLZmZlV21rQllqS2N3N3Fud0ZOQ2Y2WlFISDAwdmJaNE04SGF6ZW00VHQx?=
 =?utf-8?B?eHBtR1U3VWVRMHdkcHprZXdROTU3aEZVZ09XTDN0OStVUGhNTVpzdjcwU1RC?=
 =?utf-8?B?bFp5UjJUYWxaR1J6UUZ3VjFvcHhibTVuZ1hIb0RDbUNrcERSZ211Q2l6N1dp?=
 =?utf-8?B?NUZ1Q3hYRVpJWFZYRjRzVzM2Z0VXWVdBREtkbFBPODJPeVBTK2ZRa1dYeEZm?=
 =?utf-8?B?Z24zMjhpNXZxYWx3Y1hpZCt0SFU2YVVNVGVHa2FNOXdwRFkxeHNNYWIvQnpU?=
 =?utf-8?B?V0k0dTZXU2RGTjNQNXl6TC90SFFlaGpQMjhTZWtEMkJiVUlkbkQ1UlE0REZB?=
 =?utf-8?B?Y0xFTE50YjdBTFhpSjNob1dFTkpEeEJPNDVJTXZvQ1g4Ris5ZDZ1U3hUaGh0?=
 =?utf-8?B?WU1xTExrZ0M2QW9lb0k2TGJSdEliRDlNQmM5SThwcjVMZDVZK2RZdXJqYjRZ?=
 =?utf-8?B?VVhjZ2dxQ2daTXAySW9LTjNoTWFwaGdiUyszNDd4M2kvSkJFd0NuU01YUjk2?=
 =?utf-8?B?MGRoWkdMWjRBWm4xSytucStWdmtsZTNJZFpOdUhldVU1a3E1SGZtdEkxU3V2?=
 =?utf-8?B?amRIM0Z5K3hqaGlyNjZBc0VMWTdJTjM4ZjdaZmRqcXlKMWI4UEJLa0ZlaTZD?=
 =?utf-8?B?dDZkY3AwSk5tQkY5N3g4VDV1T2lOSkNZRUg3SGtCcDJ0UEVrMllzQ0dYV0w3?=
 =?utf-8?B?ME5UaS9KYk1oUTlMdGhiMmVGRkxzTWRQdURhUStRMFl6MUNCTVRMQzROcU5V?=
 =?utf-8?B?dTFkckg2dTFudkNGS3gzdTVRYXRxazBHUVU1Mno0SFEyd2Q1djBNN3NJMm1a?=
 =?utf-8?B?WGJCL3F4aDg3WDQ4cVJBVWZXK1FaVC9DT2haZTZGckc4WkpQaFkzR0RKK3Rm?=
 =?utf-8?B?NWZ1YXBrbEZTV0ZIaWFtMXFVT1JHem5pQVptL1FINnhLQXh4QzFnaWIwR3hW?=
 =?utf-8?B?UElUTXk1TjZGSUJuaVRKTC9VOTJFU1BSbnZVdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWYweDZHOTF3ZmU4UU51aEVqSy9PdGFkV1pIVDlHVnhVajZsNWEwWHc3N0F4?=
 =?utf-8?B?UWRaK1Fha1hXa0tPNWJsOENjL3lLQ3J6ZWxXTzlMWG0zZFVLUFJmMmlWOWoy?=
 =?utf-8?B?ODg2WGFlT29ETW9zdmNwNWNCMGtHWi9Dc1IxZ0QxZDZ1VXN4OEJ4Y0lFOVRQ?=
 =?utf-8?B?c2FybjU1UXNCazZhSldsRVJRby9PWXlDNmZsejVTOGkycXBsRWZqQ2h1eURu?=
 =?utf-8?B?b1NlajJtTXg1c0R3WDNnS1BTOUZHSTk1Mm93ZDZlakpxTjVXdDRQNXdZZHZx?=
 =?utf-8?B?Ym5DK3Jna3N3aVpZUk5DTXcwa1pkYW5hL3ZSNGhoQnFCdllkYUhpVVUrcGRk?=
 =?utf-8?B?azdwMHk2b05wSzQrejNOWVM4VkRUL3BhNy91MnpTNVVNTWJPV0JOdENtc1dr?=
 =?utf-8?B?R0hDS0JKMTUzbmNacGY1aW81UVVFVWxiZXJBeHZON0U1c0xRcXd0NTFIejFM?=
 =?utf-8?B?SEJWa2xDOVViMGFPd2luL20zK0wzZlpiKzNCNTJSRWJOYWhOQW5MeWdmL0tT?=
 =?utf-8?B?TWV4MkVWV0Vtd21YMUtteVE5Z1Zub2txZzE2cVgrdEVmRG0wQWt4aUMrZnRJ?=
 =?utf-8?B?STEvbzRIS3QrZjkzYTFQUnI0cGRuQWZJcFBhWEZraEszOHI2ekVhMGZFQ1Mx?=
 =?utf-8?B?L3lQMm9BdklsVHZFcCtoNDFkUUFsMVNRNkxtY0hxcHFrdlQyRjlLdVBZTit0?=
 =?utf-8?B?c1F2REdPaDU4VHVncWhyMVFzell1bElYdVRRcW8zVU55bFpmaTlDOVIwVmFH?=
 =?utf-8?B?a1hoSXRqeVM1MlRVcE1ueTBVMElsckR3N1orVDBBak5rcEtNbjhLTlBOODJO?=
 =?utf-8?B?dy80Sjg1WVdUejkyT204REp5dnlDZDhsejBiVVptN3l3aTg3bCtRQm85YUZq?=
 =?utf-8?B?bm9mVjl1cUhoa3VrSUpteXdtOEczbEtHYUY4MzBUdVgyM1lNNUppblhteXlm?=
 =?utf-8?B?K2ZJNFhoeHpISGpvQVZnbzZ2Z3FKYXA0SElMclJUdEozZ0JRaEcrWXdKNCtW?=
 =?utf-8?B?MkFEQnJ5WnZYb2RnQ0Y3TDZjaGxWcHRCWmZ3ZGhmdm5EYTFmUFdsTjNPZUpX?=
 =?utf-8?B?aUNBaVU5SXNIbnhNWDU1MTNsZXBWdkdPTnY5YTNPMStIUVRkK3V5ZWNVSko0?=
 =?utf-8?B?NW1GU2gzcEZjaExXZCtYMlEvb3BtSG13bDd2bGRRWTVZUG1CZHVYZnYrdVlQ?=
 =?utf-8?B?WEhKa0d2T2RvQ0hSV3dib1Zjb0RGelNyamhsOUVmcmdnV2lVLzdxOHVTQ0Ja?=
 =?utf-8?B?L2t6cVJ3dlQxT3p3YmRtRWJENFZ0aXBuN3hVZ2d5VUxzKzVLQUl6ZzRwdHdT?=
 =?utf-8?B?VVZWS1o4VDhIc3NMeks4WFNWYUh5eTJlM3hFaFh5di9CWkRLYm5ObTZ0Y1Js?=
 =?utf-8?B?QzBPOWZQSldjUXFzTHpTVytBTWR4ZUpoZE9ScHNGZlVFZHRKOC9kNmdsc3Bm?=
 =?utf-8?B?dm84V2g2RDNZQjBOcENPeHF4dFRvY0tNK1JIMmdPcC8rNVhHeFl3NnpxNHR4?=
 =?utf-8?B?dFNyNGhQUlFSNVFieW94TTJhOUw5b0cwY2d2cXhIV1hTK21UL1FvcFpRNXda?=
 =?utf-8?B?NWRoTmhMeWk5cEJpZGJnWnYxZVpCYkgvTkdYeGZVd1hwa0lWaEVDL3J4K2hX?=
 =?utf-8?B?SUNqTHIveHBaL0ZXUnM0Nk1TVzR1L0hBN2dGNGE4MHd3bS9TNHpYK1ZrU2tR?=
 =?utf-8?B?emhUTXB1em4vT0MvSzhza29yUDNFcHNqcm9iTHF1dUtzdWRWUkhkWWZ3R1Ro?=
 =?utf-8?B?blErNTRybkxqMHBSRnBQSFp0NXZiQmhOdHdnM0dhM09XcEtmNVBxQVV3WHoy?=
 =?utf-8?B?bXBOWlVQZGJvc05PMllxUVpOakhOYXluYWZqZHRzVnRnQ1pOWXkyTU1yM3ZB?=
 =?utf-8?B?ZmR5eW85LzhtSGxRemh5akNxWWdwOEIybjU1UjZxWFhMeGVxQU9RS2lFT3pP?=
 =?utf-8?B?ckRrK2VQMUkwYjU2R2ZGNzRMenBxMSt4N3hKaHNVZUo2OWlsNTJ4bk40U2w4?=
 =?utf-8?B?Sko5QVZzVmVxZDgxSDg0d3R4Y1FwM0tvYTJxNXpLZVNheTdib3R0ZW1PKzda?=
 =?utf-8?B?L3NnL3RCaUpSWC9YTGFVUEdzYVRIMWUydVcwaS9FNExNRThaTC92OWsxc1ZO?=
 =?utf-8?B?bzVYaDBPNVd6NmIyUkIySUZGZU1NQlR4STkwYjVqUDFEQWhvYzhPeGhhSEo5?=
 =?utf-8?B?N3JPK292aEgyN1dVc1dkcXFJbGk4YVkzM3NNaUgyTVROUnkvT0tNMUJnQ3VE?=
 =?utf-8?B?Wm9oNUxnZlp5NjlqVlFkMHRwd3FCM0NLT3hlZVE4aDVTL1FJRnIxSXpEU2Vr?=
 =?utf-8?B?bXVjM0QzaWFnQXA1NDFwWi92YmR2TjBxd0VTaVBpSHlMR0dqREltdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4323993-3d63-4abc-e1db-08de4e7ea48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 06:24:56.6328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UuHW6tC/jPXEmdtrQl7HBK11vn91vaAOA8yYEGGajknw6YcvB1mHZ50elz4OIey9MvUS4IcpxMWlvbN54+03IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6041
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjcgNS81XSBkcm0vaTkxNS9kaXNwbGF5OiBFcnJvciBjb2RlcyBm
b3IgYXN5bmMgZmxpcCBmYWlsdXJlcw0KPiANCj4gRm9yIGZhaWx1cmVzIGluIGFzeW5jIGZsaXAg
YXRvbWljIGNoZWNrL2NvbW1pdCBwYXRoIHJldHVybiB1c2VyIHJlYWRhYmxlIGVycm9yDQo+IGNv
ZGVzIGluIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJ1
biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQoNCkxHVE0sDQpSZXZpZXdlZC1i
eTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDI1ICsrKysrKysr
KysrKysrLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheS5jDQo+IGluZGV4DQo+IDgxYjNhNjY5MmNhMjAxOThlZDQ0NjBhZjI1YTYx
YjJkNDhlNzYwMjMuLjczN2EwN2Y5YzBjYTA4NjgyYjEzYzIwYWINCj4gNTg3N2MxYjU3YzA5OTkw
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
Yw0KPiBAQCAtNjAxNiw5ICs2MDE2LDEwIEBAIHN0YXRpYyBpbnQgaW50ZWxfYXN5bmNfZmxpcF9j
aGVja191YXBpKHN0cnVjdA0KPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCX0NCj4g
DQo+ICAJaWYgKGludGVsX2NydGNfbmVlZHNfbW9kZXNldChuZXdfY3J0Y19zdGF0ZSkpIHsNCj4g
LQkJZHJtX2RiZ19rbXMoZGlzcGxheS0+ZHJtLA0KPiAtCQkJICAgICJbQ1JUQzolZDolc10gbW9k
ZXNldCByZXF1aXJlZFxuIiwNCj4gLQkJCSAgICBjcnRjLT5iYXNlLmJhc2UuaWQsIGNydGMtPmJh
c2UubmFtZSk7DQo+ICsJCWRybV9tb2RlX2F0b21pY19hZGRfZXJyb3JfbXNnKCZzdGF0ZS0+YmFz
ZS5lcnJvcl9jb2RlLA0KPiArDQo+IERSTV9NT0RFX0FUT01JQ19DUlRDX05FRURfRlVMTF9NT0RF
U0VULA0KPiArCQkJCQkgICAgICAiW0NSVEM6JWQ6JXNdIHJlcXVpcmVzIGZ1bGwNCj4gbW9kZXNl
dCIsDQo+ICsJCQkJCSAgICAgIGNydGMtPmJhc2UuYmFzZS5pZCwgY3J0Yy0NCj4gPmJhc2UubmFt
ZSk7DQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgCX0NCj4gDQo+IEBAIC02MDg1LDkgKzYwODYs
MTAgQEAgc3RhdGljIGludCBpbnRlbF9hc3luY19mbGlwX2NoZWNrX2h3KHN0cnVjdA0KPiBpbnRl
bF9hdG9taWNfc3RhdGUgKnN0YXRlLCBzdHJ1Y3QgaW4NCj4gIAl9DQo+IA0KPiAgCWlmIChpbnRl
bF9jcnRjX25lZWRzX21vZGVzZXQobmV3X2NydGNfc3RhdGUpKSB7DQo+IC0JCWRybV9kYmdfa21z
KGRpc3BsYXktPmRybSwNCj4gLQkJCSAgICAiW0NSVEM6JWQ6JXNdIG1vZGVzZXQgcmVxdWlyZWRc
biIsDQo+IC0JCQkgICAgY3J0Yy0+YmFzZS5iYXNlLmlkLCBjcnRjLT5iYXNlLm5hbWUpOw0KPiAr
CQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygmc3RhdGUtPmJhc2UuZXJyb3JfY29kZSwN
Cj4gKw0KPiBEUk1fTU9ERV9BVE9NSUNfQ1JUQ19ORUVEX0ZVTExfTU9ERVNFVCwNCj4gKwkJCQkJ
ICAgICAgIltDUlRDOiVkOiVzXSByZXF1aXJlcyBmdWxsDQo+IG1vZGVzZXQiLA0KPiArCQkJCQkg
ICAgICBjcnRjLT5iYXNlLmJhc2UuaWQsIGNydGMtDQo+ID5iYXNlLm5hbWUpOw0KPiAgCQlyZXR1
cm4gLUVJTlZBTDsNCj4gIAl9DQo+IA0KPiBAQCAtNjEyNSwxMSArNjEyNywxMiBAQCBzdGF0aWMg
aW50IGludGVsX2FzeW5jX2ZsaXBfY2hlY2tfaHcoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0
ZSAqc3RhdGUsIHN0cnVjdCBpbg0KPiANCj4gIAkJaWYgKCFpbnRlbF9wbGFuZV9jYW5fYXN5bmNf
ZmxpcChwbGFuZSwgbmV3X3BsYW5lX3N0YXRlLT5ody5mYi0NCj4gPmZvcm1hdCwNCj4gIAkJCQkJ
CW5ld19wbGFuZV9zdGF0ZS0+aHcuZmItDQo+ID5tb2RpZmllcikpIHsNCj4gLQkJCWRybV9kYmdf
a21zKGRpc3BsYXktPmRybSwNCj4gLQkJCQkgICAgIltQTEFORTolZDolc10gcGl4ZWwgZm9ybWF0
ICVwNGNjIC8NCj4gbW9kaWZpZXIgMHglbGx4IGRvZXMgbm90IHN1cHBvcnQgYXN5bmMgZmxpcFxu
IiwNCj4gLQkJCQkgICAgcGxhbmUtPmJhc2UuYmFzZS5pZCwgcGxhbmUtPmJhc2UubmFtZSwNCj4g
LQkJCQkgICAgJm5ld19wbGFuZV9zdGF0ZS0+aHcuZmItPmZvcm1hdC0+Zm9ybWF0LA0KPiAtCQkJ
CSAgICBuZXdfcGxhbmVfc3RhdGUtPmh3LmZiLT5tb2RpZmllcik7DQo+ICsJCQlkcm1fbW9kZV9h
dG9taWNfYWRkX2Vycm9yX21zZygmc3RhdGUtDQo+ID5iYXNlLmVycm9yX2NvZGUsDQo+ICsNCj4g
RFJNX01PREVfQVRPTUlDX0FTWU5DX01PRElGSUVSX05PVF9TVVBQLA0KPiArCQkJCQkJICAgICAg
IltQTEFORTolZDolc10gcGl4ZWwNCj4gZm9ybWF0ICVwNGNjIC8gMHglbGx4IG1vZGlmaWVyIGRv
ZXMgbm90IHN1cHBvcnQgYXN5bmMgZmxpcCIsDQo+ICsJCQkJCQkgICAgICBwbGFuZS0+YmFzZS5i
YXNlLmlkLA0KPiBwbGFuZS0+YmFzZS5uYW1lLA0KPiArCQkJCQkJICAgICAgJm5ld19wbGFuZV9z
dGF0ZS0+aHcuZmItDQo+ID5mb3JtYXQtPmZvcm1hdCwNCj4gKwkJCQkJCSAgICAgIG5ld19wbGFu
ZV9zdGF0ZS0+aHcuZmItDQo+ID5tb2RpZmllcik7DQo+ICAJCQlyZXR1cm4gLUVJTlZBTDsNCj4g
IAkJfQ0KPiANCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
