Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE4CC1D7A0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 22:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C68810E85A;
	Wed, 29 Oct 2025 21:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5vMNzeU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D44B10E859;
 Wed, 29 Oct 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761774229; x=1793310229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ADRYKI/sfE1K0EaUSPb8kVlHrR6gvNBXHoe9iLq4BZs=;
 b=I5vMNzeUHOzw0zP8as8368B/Otw2us3BYSLMFnz4yYVB4C0Zp09y/XAq
 eQEV1bbapX7Sfn9X5Rc3vJSzKhxEt+a7ywnb+RWQykssgaFW567BVPgh+
 ul2dlnjsoDoYPSn3L+eaz12ONAe0t8fWuRDR4v1Oua9D1bXnxJi04HUNr
 9HS/9HqxTeIsNBF0Itfs5IrL+Le17XW8prkyv0qDeLhUdVYwxDDwSw5t0
 /XRUH0UZlIOBbaRCXprFyLgI+2anphN++BOUZHFx8eQpyWs9Rc94OAjym
 uW1tXHP6ucPQzaJvweorGRbscidqQ4tcDfBTGSeWjNzJ9ljWr6T/q5Q/C g==;
X-CSE-ConnectionGUID: bgh+/WxmTVCZ48TljE2Bdw==
X-CSE-MsgGUID: 7WaNgd6tRkalzeXhhrm6LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67743932"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67743932"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 14:43:49 -0700
X-CSE-ConnectionGUID: bVrWp0mBQByS4HsKfgMqfg==
X-CSE-MsgGUID: jY4kj6VhScai9JFaY2tP+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="185474215"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 14:43:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 14:43:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 14:43:47 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 14:43:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JABxlEia+sWiW3WRDSPSlxm7z4rcqwDsMmEOHYYf7oAU3X5sDXAp1qtlG9NMe2wxc0MBP+9G1bECuuzHyWfXoZR+HahCsvy3o6hYil9L+ezcSQI666NwGq065EpI5YdWIla9xJsZwR+ofpHEdeR0UGXOJWVCeQ5vpqUESk2WSFj7apSnN4rnXpDRw8z1WWiv9+4Vn8xTcMAhhBr8HTufW3HDhgRv5pcQe1DQf2B6PUJIeENFuUxg909me6RKZ/BUB171EOF0HPlTJS/7zIWU2PBz4DoGwO4rirw1SMb+u1jtNjuLHBLJ3IUvPbwhygsTLGKA2Qyt/51dQ5xNf94Gkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADRYKI/sfE1K0EaUSPb8kVlHrR6gvNBXHoe9iLq4BZs=;
 b=ktrZRb40x3DDcRHItCF3WLMJ2Y4KC4KXUHm9QxP5//BOP6C5o0FLbCcE6497Sg0KAjkvzGDOQDy11CQNNQ5Q2xw42XqWN+biaxETJohPqQxImIJFumBRmxpv1ULSsRWyaSfrdNduw7hoCo5a1RotXw22n1GOcgw8QaQdBQ3S30kInLOzVFY1smjUZwDWFHYhbJm5L3yUCtJlNhJxgEnQ5bMnwFeRLDToK5bdDSedE4FLnIskgCFozovlcOGJmKNrT+7jNyU6tJu7LmnjF0S4qe9fKJsaA3dohI/iPJV6Fpy5OzKjrV3LMXmZ/aufu6wJzfynTyS7pYqg85mKZkx6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH8PR11MB9458.namprd11.prod.outlook.com (2603:10b6:610:2bc::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Wed, 29 Oct 2025 21:43:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 21:43:45 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "lumag@kernel.org" <lumag@kernel.org>,
 "sean@poorly.run" <sean@poorly.run>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
Thread-Topic: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
Thread-Index: AQHcSFowTO5eveyVB0OA9qufakJZHbTY02YAgADWGAA=
Date: Wed, 29 Oct 2025 21:43:45 +0000
Message-ID: <d768e2abf7e27edac66f1d0068540e2b0617561e.camel@intel.com>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
 <jn7piiqfyeiiinpxu5ht7qza2la3cigdqlhtlvuvkbzqeyhcad@v5aypgcrcdok>
In-Reply-To: <jn7piiqfyeiiinpxu5ht7qza2la3cigdqlhtlvuvkbzqeyhcad@v5aypgcrcdok>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5373:EE_|CH8PR11MB9458:EE_
x-ms-office365-filtering-correlation-id: 14cadc53-e916-43b6-d945-08de17343cd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VlJ5L1N1R01CTXhOVjlhK0ZyOHFOZTZ0dDZZRkF0cldsYkk5OTJ2RXRqMzQv?=
 =?utf-8?B?dUx3aTVnNDAxMW9uZ0ZFcDlhb1lJbWVWWDlkbWF4bDNISno0M1I4RDNsc3dN?=
 =?utf-8?B?WTYwd1pFMEFYc3hsNVVESHdQdFBSWHNsMVlES2ZQRzhXblcwM1ZiR2tnK0xZ?=
 =?utf-8?B?VVl1VEI1WkpNSVNlQTZTZjluRjdieE1MNHNGbXpoczRjQm1xczNnTEJJdUdT?=
 =?utf-8?B?MEo2QmNrSjNhbE11bVFFOEd6YTdoelRSWnFmRlhKQ1dNWDdzbXhoaWVlejBO?=
 =?utf-8?B?M0hIdTV5eng3NURZUW5wL21acXAzcTR1WFJDc25QVWtOcVMrZ0tteVlEVVRQ?=
 =?utf-8?B?cm9waVBYNTRRQ1B5UW9zVWVEb25vNkR1S0lmVm9BQmJHRENJdERtYkJOdnh1?=
 =?utf-8?B?U0dUaStBR3grRjNieUxUMUxFakI4aDRiM3NDdGdWZXByMWFiSXZqR1U0VWIw?=
 =?utf-8?B?QzFqZnZzQVl1NUFVNi85NEhpTFFreXE3QmEvVkY5RnZyRW9mMENhVjRlamRl?=
 =?utf-8?B?L2h4b0puWmFrSU53L2xoa3lOSVFjbXhMaW1jYXJwNVZCUjBBNURKRlNnNTI4?=
 =?utf-8?B?Y05jTjlFMGJrWWVQdjhQOE5NSitxOGYzYjVjRTBmSnArd2F2RnpzcFJCRUFv?=
 =?utf-8?B?bjVMN2xHbXNPbFhGdEwvdWdwU1Z5dDFLS1BDOU4zbVdJcU00VERPSlVJQkQz?=
 =?utf-8?B?bHQzVmpzNzA4N2k2Q24rWlJ2Q2ZNdXRHN29FNDJYV1FqdnVFcGc2V3hvMzNF?=
 =?utf-8?B?SUNYeHd0M2VCQWl2OUZ0NUhDTXZXa2tLRCtyclRGR3FtdWZUdTEza0V4b1Zs?=
 =?utf-8?B?TlRLTTQ1aUJhZjJENzhOQVZKWkFrT3ZiaENvWkV2RDltWEdZS01GaWxqR09Y?=
 =?utf-8?B?ZXNLTS9yUVdzZ1ZrRE1TSmZLRWhEa3djUm4rV1h3V1NwekxhOTNzNUU4WHpZ?=
 =?utf-8?B?eXdqNVBpRkprV1lTZUswQzFLblc1MDFHZWh2R1JaSEdQYmh3SWdNVWo3OVZt?=
 =?utf-8?B?QUJQd1FyNWtMdFVLS25pa0R6aE50ajlKQnJyckd5SlB1eGN6T1lNb3dGQ0JF?=
 =?utf-8?B?OG0rVmV5S3FITStpVDQrcTZRMVBQd1QrWlVZZndqZld5Wk1FeThMWlVMblpW?=
 =?utf-8?B?UGVoUFozdWpnRDVkVkF5SXJDZWhFWEJXd3AxYldvV0NMYUhmV1U2M0lkL2Vy?=
 =?utf-8?B?bUdyanJyYW1zR2tFbkd1ajgrR1VldFdSMjkvNDdmTWcxRFAvbk1aZUd5WWZF?=
 =?utf-8?B?V2FmbktMQlRBcjNra2Q3R0U4VXYxb25Uc25TZUpsd1dJZitpV0JJU0sxZHRl?=
 =?utf-8?B?T3dObVIzVUx6S0ZzMldlSFlaNjJCWkFTK1hzVlI4V2U1SWR6dFEySmltWnd5?=
 =?utf-8?B?YXlHUm5YOW9FY2RYTjRRaWV0UElXS1RKaC80dnlzQjZ4N25WTnV5cDZzTkFX?=
 =?utf-8?B?bzJsYkpEUlkxNU10QURrOTZpUm9yZVdudnVERTBVS29RZ2ozVkdsMGQ2VFMx?=
 =?utf-8?B?cjYwVWdYSllGaFpCV1FjRjdTUWlickJYM0VJd3d0Y0VDQUZKU1pQZ2tQcDJ4?=
 =?utf-8?B?bm8yZjdFSVoxUUpiN250Rm03bmQ5cXJhUkFvdStWWkJXQUd5dCszOFdNRksz?=
 =?utf-8?B?SHhFTmdralJhRFJIMmljUXI3MElsWHpNTUlmZmtmdms0S1hXelU1V0ltWk0w?=
 =?utf-8?B?bldlUEZkWTBNeWRTb1I1ekpmOU1oQ2FScnNCWEc3RE42U3lTMDFscnU2L3o2?=
 =?utf-8?B?dmJlRFlrV1VXcldSbTZDQ1RtY1BsS1lZQjU4TTFsV3ozRzlHTkZIVUJjdk9p?=
 =?utf-8?B?RHo1ZVU1Z0pxdCtqV0I3Z3RCcGRQSmQ0MG9kZlZMdXVGNzM5MmxQY3pBQm5l?=
 =?utf-8?B?UWlHZ0k4NFlkcC8vTnN4ejNjN3FlSVZHR2MvZUhBQW9wOWU4UWNyM0VGZFp0?=
 =?utf-8?B?b0FBSnVkVm81cjYyT2lEUXZuYkljby9Ib2dzV0tIYTlrQkRDL2Via050bzZN?=
 =?utf-8?B?MGM2Sk1Md0UzckdWSHhabmJCZEFFV0tVaWduOExvWG5JKzJXV2dlUlNKend4?=
 =?utf-8?Q?bdjHR7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTVBR1BmMGE0cGVHSFdiclp2UjkxMTVCQlRyUWgwNDV2YlR6akkxZFl1Y1Nt?=
 =?utf-8?B?ZHVKTlpoMk5CUEtmR2UvYkhMQUlQeWpmOUErSVJVY2dHcDJ0Y2FsVWdmd1M2?=
 =?utf-8?B?bEJkZWJzRnpCeW1Td0xleGg3UGE3Uk1wcXJEL0VsRHN0dU1LeXUyemNuc01s?=
 =?utf-8?B?U3FIMjRjR2RxNUFpdkNTZ3k3bDVRYlg2cWNaYnJXZ0RDbEROVlJrRUp0RHBD?=
 =?utf-8?B?aVdkSEtrcUdNemhEUEpVREtmSFJkQXBnZmFod1lwcCtqSG9aemowN2x4WER4?=
 =?utf-8?B?MWcvZWNjYUp5ZHg2dTl2a3dQb0d3MGV5dVhpZTMwVGliYkNoZHMySW9lTmRD?=
 =?utf-8?B?WFdOcWtxQTVScTNkYjh0MmkzMHhPNkgyYXhSU3U2dDdrYUFvWU0vL0FoYmFS?=
 =?utf-8?B?UklHeWFTb2hhb0lvT3B2L0lhTjNJY0xyTjY0WExKbnd4S2VNYXk5SUdrMjJp?=
 =?utf-8?B?Y0U5ZnMzRHZqVXNKVkg2c3E2c2U4LzZQbkZ0T3A0dytMK0hkUVFzdDlKWkUy?=
 =?utf-8?B?enZiN0oyc2F3NG43cmkwR0RsMmxGMjZROENmRTNxSjZnaytZSGpicENrcW1t?=
 =?utf-8?B?OU1nMGtPTWg4ZEdiZ0dlKzFXMWNiZ0FFeWNaZ25adk1DK2dpRm82OHIwQ0lJ?=
 =?utf-8?B?QllGMk16ekczQVVUOXVJejhMNWxOY0EyV0xBRjlwV1ZKdE9sd0M4cGpFOFpp?=
 =?utf-8?B?UzR0OWxhVzlsK3Zoc0RjMVVSYmJFZDN6emtldEF5UUIydHNIb0pKZ2NyZGJ3?=
 =?utf-8?B?Skcvbk5qdG5LL3pla3d5UGZEOGJwTkYrbW1LR2FLdWZIN09BVC9XcElsbEN3?=
 =?utf-8?B?cGQrZys2M2gzenhoM0ZLMzlMMHZYaE5maG5OM3pHdUdGR29DTFBnWUxXaktp?=
 =?utf-8?B?N3kwN1VxNDZ5c1Y0Q2xnOEtrWHk0ektPNk9ZYUlsQVpDTFRCRSt4dEJZT0lJ?=
 =?utf-8?B?RUlPVTdoOGtydmpGT2JKNWpKWUxuWnNjcGs3djJvWmNIVTFzdTZsdWdmb0tU?=
 =?utf-8?B?d0huSjdxUkUzUXNFQ3M0MEJiRU1HcUZBWEJFR3hoQXFFaUFRR1Q3WHpBdnZy?=
 =?utf-8?B?cldnRDNLU1g3T0dvTTdPNSszTU44dHdHZndZNDhsQ0tCQ2N5RDBacTNDTDY5?=
 =?utf-8?B?NU4xRmVPWUxqamNvUnd0T01kQnJoamhVRW9ucGdjVUhSbmRsdHFzTDkyVXpx?=
 =?utf-8?B?QmMzRzFmWmhKRjZmQWNwb0t4blVMWU5WS0Q0aG53ZVBCdFZlaDJTQ0pnVUNL?=
 =?utf-8?B?Z0RtSGFrNDlNZm1LbjJGa3g3U1QrZ3AzVHFoMWZML2oyS3ZQNW5iU0ZzaEs2?=
 =?utf-8?B?dEVqUDl5K0t2eDdDRWc2WUtRbDVYRjVkZXFMMDRzcGp3eWRhejV1YXZFYzND?=
 =?utf-8?B?aitHRDJzYXA5R1p5OVR0aUxCckdsdDBSRGVRaTZtZDNtc1VxemtUclRVSzRH?=
 =?utf-8?B?VXJmais0UWM4M2dKUFZQcURFTDAvbXVITmUzbFlCQVdMNm5GRmxQeE9NTmxB?=
 =?utf-8?B?eGRTcmFmeVJJOW1KN1lCemlVK3FrbEZZR2V5OU9ZeTNDd0s5L3ZtdmdSbmtQ?=
 =?utf-8?B?bFJObXp6YTJaaEMyc3hhN0Rta3pUZjU0Z2lZekhxU0hScUVxc1lIMmdRTDNI?=
 =?utf-8?B?bG94bE1Scml5RkJKWmFPUzlnbGNTSHVLOGIralk5U1JkdW4ya2xmYkFBayt2?=
 =?utf-8?B?eVZTK2l4WHJZZGgyY2E2RWFWVG0zL1hvVWJRR3ZURldDV041QURWVGM0NUdI?=
 =?utf-8?B?TmRyNUgraG91SVd3YkVXUzZOKzArQlFyM1FFa0dhcEoxRVNUUDF2eGJXcEl3?=
 =?utf-8?B?TkdHSUdMOVdEOUU1VHhsY0xNTzdpa05uRkNtMEN3bWNZeXBVUDZsMVJ4SmM3?=
 =?utf-8?B?OHJ6UnpMOFJlTDhUYzJoWmVyejA5VDVBblFnNk9TUUlnN0E2MUc5cjBrUjJu?=
 =?utf-8?B?WDhMNnZGRVBIbWNNZUFTSi9IY09ETHdWbjh2WnE2VUZJKzZNclhUR0pTUHNW?=
 =?utf-8?B?Y3JmMmdRVk9OSUU5Rkw5UW9LcnhoOEFUNDVGNk1kTlljTXdUek1FSVg2aklw?=
 =?utf-8?B?MUlOSXI2Q0F3SmJ4QU1VWWNiUldLRFpVTE9BTVBLa2ZWdEFML1F6TWwyeVBT?=
 =?utf-8?B?Vk5QOHFONnZMT0RFOFhZQ3FtQjVWcDgwT2dRK1MxZXZsZTRqQlZJaEhKM1RV?=
 =?utf-8?Q?LoA334o5Xa+xHRfAbGa6ysI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6902EE8E00C5244493986195962405C0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cadc53-e916-43b6-d945-08de17343cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 21:43:45.9423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+eYoJDiGWiCZ+TJc4jRsJxU91Fwe6y6BeQPb9GCo905u+mL15qtSaPCy15HB7wt0aFHK7zk5Vea3o/Jogw6RWLLbW0lcucCxj2LKvML3DA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9458
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

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDEwOjU3ICswMjAwLCBEbWl0cnkgQmFyeXNoa292IHdyb3Rl
Og0KPiBPbiBUdWUsIE9jdCAyOCwgMjAyNSBhdCAwMzoyODoxN1BNIC0wNzAwLCBLaGFsZWQgQWxt
YWhhbGxhd3kgd3JvdGU6DQo+ID4gVGhlIERQX1RFU1RfTElOS19GQVVYX1BBVFRFUk4gZmllbGQg
d2FzIGRlcHJlY2F0ZWQgaW4gdGhlIERQIDEuMw0KPiA+IHNwZWMuDQo+ID4gVXBkYXRlIGl0cyBu
YW1lIHRvIGFsaWduIHdpdGggdGhlIERQIDIuMSBkZWZpbml0aW9uIGFuZCByZWZsZWN0IGl0cw0K
PiA+IGFjdHVhbCB1c2UgaW4gdGhlIGNvZGUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4gPiAN
Cj4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiBDYzogUm9i
IENsYXJrIDxyb2Jpbi5jbGFya0Bvc3MucXVhbGNvbW0uY29tPg0KPiA+IENjOiBEbWl0cnkgQmFy
eXNoa292IDxsdW1hZ0BrZXJuZWwub3JnPg0KPiA+IENjOiBBYmhpbmF2IEt1bWFyIDxxdWljX2Fi
aGluYXZrQHF1aWNpbmMuY29tPg0KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLaGFsZWQgQWxtYWhhbGxhd3kgPGtoYWxlZC5hbG1haGFsbGF3
eUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2xp
bmsuYyB8IDIgKy0NCj4gPiDCoGluY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmjCoMKgwqDCoCB8
IDIgKy0NCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiANCj4gUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5i
YXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFdvdWxkIHlvdSBwcmVmZXIgdG8gbWVy
Z2UgdGhpcyB0aHJvdWdoIGRybS1taXNjLW5leHQgb3IgdGhyb3VnaCBtc20tDQo+IG5leHQ/DQoN
ClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuIA0KaXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IGNh
biBtZXJnZSB0byBkcm0tbWlzYy1uZXh0IGFmdGVyIEkgYWRkcmVzcw0KS29ucmFkIGlucHV0Lg0K
DQpUaGFua3MNCktoYWxlZA0KPiANCg0K
