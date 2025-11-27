Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C9C8D17E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 08:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308B510E773;
	Thu, 27 Nov 2025 07:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a20lDZpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D37910E76B;
 Thu, 27 Nov 2025 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764228480; x=1795764480;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HSFOu3rkgPji6kI3DP480xVjsc2AgWzVYMaHXWUYIYA=;
 b=a20lDZpkIsjQBLa6fpPGcU7uiEZsciTZOHIfkhS96EGix6g4bFLIn15H
 bjrhwJaCLzHRzot/dvTrAeLmCgcA5ApwFEWT0n+OZa5ya7Gr0ALZIx3fk
 ZXPJZkc77Tkcx9qeScb447idrs2wVBMd8nAFHLFR/alVNVEM1uH+1oiS4
 QTk/99YcEuRmwOmFqjp7sR9B8vftaEUHRpLElLyGUlpkq9grndRZJORKF
 O1lpB51Pv7pt6LgKSeseGgyzuS+q1NUnIaeNi3oNNXmzuwPCfdxp11H/6
 qiY/qoQ9RGYG9IUj02E2R6EQOnh5+GiWQJs70Mit3OB0Q5Tf2/4wVjb84 g==;
X-CSE-ConnectionGUID: kU606i5WRByZAGo2yrJJjw==
X-CSE-MsgGUID: RaqyiIPlRZ6KlzXN9H9l1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70133435"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="70133435"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:28:00 -0800
X-CSE-ConnectionGUID: +wrWKb2cSUyOGYZuIzA5xg==
X-CSE-MsgGUID: 2RFLuQkOTeSaq28UOHFshg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="197486662"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:28:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:27:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 23:27:59 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:27:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxLX+UnEB2i6nRx6sjefHnV+LeCkyY2ik0FaE3TD8DtsD1ukCxH2da/acOFL3WAW99yP0GTrc4zCvvCBKwqpLvQgNoErzQE7wtl/dcDNk0KkOcQ96Tw2cFfyw10LBERxuxc1AMajDjbYutz6lgY4smHjQNPfOpZwkm7EybLJTT7sx4cy0bISYfkAjbI5MR+BrGjqCB0wWhkwr2NtV1LCb9ZfyFgI5tfojh8GCKXwr2nJLohOutghtv7fyosokdDkatax3Lc3cwQBGtbsyBrff/qUxr0S0SyCgrlTrAqtENB6dn3pcctfCfl7qnVNg4q9/NpuQIKKffUkilb+bOReMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSFOu3rkgPji6kI3DP480xVjsc2AgWzVYMaHXWUYIYA=;
 b=YmMCQrBKgLdYT5PQ221d2kPyMRHMd+WFzVnZw1RlVy/fC/OgcnidNN0Gtf0b43vpIS+EQjpBFEBgzLuNnd6OmSHld0ldjnPPot1gUr6FR7OIlmwf7MSnlm3sOlDWARL3HlXRsVb1MC0MHQ9jQFT2teZavOvm7No4z5ACx5KKl/3Yt6vgKY4ezpaXbl8xbR/fcJUcsl9UYwqGVZh2oR3N2fzLRAYfIfP07kL6hxpeC8br/L6byA13KOK+xxg5oIsaD2DlhQNDUMDNYJjZIYg55FV9h/QKgvvfABrM7rv6JAX0l7jL4Gm1jSdg1yMdtQfNg4Ta/g3xvoQ4CgXFWVtT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ5PPFBBB839A03.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 07:27:57 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 07:27:57 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/i915: Eliminate one more frequent
 drm_format_info()
Thread-Topic: [PATCH 3/3] drm/i915: Eliminate one more frequent
 drm_format_info()
Thread-Index: AQHcVCxu2NVL7v2ONU6uiwdcdY5+IrUGNlkA
Date: Thu, 27 Nov 2025 07:27:57 +0000
Message-ID: <9ad4b4b01128cfedb5db6fad0d7f54377b56f73b.camel@intel.com>
References: <20251112233030.24117-1-ville.syrjala@linux.intel.com>
 <20251112233030.24117-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20251112233030.24117-4-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ5PPFBBB839A03:EE_
x-ms-office365-filtering-correlation-id: 2bec21e3-c267-45b0-c184-08de2d867ce6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UWtYSnU2UTFyL2N1WGxXdXMwM2VFb1RBazYxYk9RN0lzaVp5Qkg1NUJvZm9l?=
 =?utf-8?B?SzRPc281WCtBSUxBcXk2K2RJclBoOTBPaFZjS1d5M25YMTAwV1BpeWJ4Y1d1?=
 =?utf-8?B?RUFMTGhZYldIY2NWdjZEdXdOSTJZQlFkQWdrZzJqMVhFem5pVDB3MGdTbGgr?=
 =?utf-8?B?enArM2d4UXFDbDl0UEQ1RnF1YkFYU0FHREYzcWdxQVE1V2h1SEFKSkFmRlc3?=
 =?utf-8?B?Nm8vR0FyTzk3TDgwVnBhNFpSMEdaV05TK1JuNEdTMlh3cXhySytKY2tqUjdK?=
 =?utf-8?B?N3czNCtrTDJlbUJYVm1VSmNEd3dtN1dBeDRxWEF0ZEFXSHROTGpmdldBclFn?=
 =?utf-8?B?YzhWMGdRVmxkTDlOZEFlcFJabmdqdVVwOWcydDQ0SmhhYkkxcHY5WVRuSmVB?=
 =?utf-8?B?aTFyZFlkNWRTR0c3OWJrQm9CS2QzTmFyYkNwR1lEQ3JXbGpyeDVQRmlrSFJK?=
 =?utf-8?B?MkxHZkM1Q1FDTmMxRW5xS3hscW5iU21tb0NKbnZ4M3ZXTFk4ZHp3MlRTNWFn?=
 =?utf-8?B?aXlha2VsbW10R3FpMzExditNMkRuUjdUTlJaNHI3TVlCZkpVeERwenRpTXMv?=
 =?utf-8?B?SnR1eEdLVzBvRTRzMEt1REsrL0IzQmk1UGhTZ0dCNzFzT09kVlYybGhqK0VF?=
 =?utf-8?B?bElraGxJWEkxQVAyMWQrZGtIeWgxYzJpRDRuNm5CM0JIU1RrSW44a3ZBUzdz?=
 =?utf-8?B?NURER0xHUVRpVE9rUXpwUTc1SUR1eWZwTnRSOFlqOFVrYWxwV2VRM0FwMVNs?=
 =?utf-8?B?Mkt3SWxLZ0dpZWRYaGxveVZTKzluNi9JTzNXRWNGbW5sS05TUWhrZFhLZmpF?=
 =?utf-8?B?bllpNFE4aWdrcjZLYW96emp1eklWY05nQWNzZ3hPWU5OM2Y3aEFLMncvVWVD?=
 =?utf-8?B?RXZzR1Y5MzU4YUNDWTlWbU1zR0xiUVI1RFhtTTQ1Qnd0a2ptaTMvTTlmaUJY?=
 =?utf-8?B?WXVucVlUM1c4ZjhtS0R6Qm9NTWx1TXo3aEwwdTV2LzFzKzYxck5KSU1wU0xl?=
 =?utf-8?B?dEs4T003TFBEcEdPV3gyREh4bWM0QW55RGNTRE56T2o2Z3ljZjJjaHIycDhw?=
 =?utf-8?B?N1lwZWlKcGxUZVlPT1Q1L0RUK2VKVFM1ZHdwbnJYWUxNTDc0cURoWkJZK3B6?=
 =?utf-8?B?bDJJQlpIZ3lpWGwrMmlremZtNjl5VnA1ZzY5TDJabmdtSkg4VEJweTBnQnBH?=
 =?utf-8?B?TkJCelBORnZ5c3dkUGxtcVd0RVB4UVNMdGx2bGZCb1djbXU4YnJCSUFBb0NU?=
 =?utf-8?B?cjEvdTU3OWJQREVOWTQrU0l2dzlyVW1RbXJ3MkRGa25BWGZBeHByeHYzdmZp?=
 =?utf-8?B?N1gzTk51eE1qbmNjOUYyTGE0NUQyakg1YURETGhRc3FhK0NyQklCUytTekR5?=
 =?utf-8?B?M0tweloxdjdIQnl5VHJHYk5XN2hvcWJaS29kZTZjSnlRclYyWW5kTkkzRVVB?=
 =?utf-8?B?UUk3RTFHUHpaM3dvNlJSNUJSdjlLNVdwME5DQ3YxOVdyckp1c3JvQmJsY25F?=
 =?utf-8?B?dGptT0ZyYVdOakdvWUdYUlllWUFtcGx4YmdaV1cwVWM3L3J5ZHlzUVMxZmF1?=
 =?utf-8?B?dks4YlM0YnBRUEg2SVdLQklySjVRTG9SUVRRZS8vbXJBQi9RQjd0cFJiRWFK?=
 =?utf-8?B?TTZtVVAwaGhabG1iMElqSW1KTWttNWlBb3BubUI0RmNIMWt3YW5zQUk4enFW?=
 =?utf-8?B?RmhKTmpXZFFId2lOdVk5ZlRJTkVpaVEwZW05SjFXeUlYTEVJVUNteGt6WHZn?=
 =?utf-8?B?YmRla280OFg5amdvM1lsd2RlL0tXeFdrdGgxdEpuMmorVFUydDdhaStFanRI?=
 =?utf-8?B?UnVpcDhvbVNvaXlUTEx0UTJmS0ZNWFBIUER0YTZxS0w2TTBIQXoybHI5L3Fk?=
 =?utf-8?B?UkJCNXE2RkN3YkdMWHRqQjdLZGNVRUFXbjlkNEU5aG9ldUhqSFpveWtjRHB2?=
 =?utf-8?B?U2RuZ3NZZXQ4NUtZZksxZHZ5c2RuMkdPZ0ZpYmlsVldFeGlNMGNUc0k2YzNW?=
 =?utf-8?B?anU0V3o1SkpEN3RnUU9CZ3g1aFE2M0ZIT016MGx6U0dxN1Z4MVhiZ0pycWlU?=
 =?utf-8?Q?lmgDF5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnNPTHlRZVlya2NjaDdMRXRHT1Y3UkpEa3ZjTXNvLzJWQ0hNSkFqdlIxd0ZV?=
 =?utf-8?B?aEdwOXI1djR2Z0VTS3BVQVAxR0hZRUpuMHY3QkhldlRXQ2Y0bGFadGovYXhv?=
 =?utf-8?B?R2RxVG1xZjd0Y29YdUY5R3EzdWMvSmFMRzR4TWd1cWhOVXNYMHd4S1Zmbmdp?=
 =?utf-8?B?bHQ4TEtnWVJsMW43NmIxU2g2SWRGOEMzdjRPUzhsNEhBaE5XZ2pHV2NFYURK?=
 =?utf-8?B?SHB3RysvM2FXYnY2OTk0YW5zaWsrUUduLzR4TDRPMkFPcFRoZncveGdFeVBw?=
 =?utf-8?B?MVk1WXV5MkFETUpTeXMrenhaS2VMYWdOTmQ0amVQaU9UTDJLTHRiVU9xbzJa?=
 =?utf-8?B?Snd0bUJleGJ6Y2h1L2xKaURMUzZ3NHJQS1V5c1docnRYMHNIUmdLTnQwQnZD?=
 =?utf-8?B?VzVuODFoWEFKak9pNDlRR2kwaWJZbStqRFFYWDZPWStQRitUTi9uVGJYZEs5?=
 =?utf-8?B?bUtFKzl1ZUM0Y1FPNjR3dE8wc0ZhZ1p2dDlSSlZiWXEzOHlFSWxUa1NwQjRO?=
 =?utf-8?B?L2JVRnQxaDJCOEJxaTNLaDRFQnF0cVB4ZHRqQ0xxZE52ZXQzQnpqRTBVY1Nt?=
 =?utf-8?B?Mi85cWpsaEp0UnFiOExyVWhRb004N0ZKOHJwQ0gxcDVndDlXaHVEcWhtcFZj?=
 =?utf-8?B?TXg0eFVQWktWVmk4a09sT0E0WENEbGh1Vk9reHlrUkZXY2NQRUlmNS9CYWw5?=
 =?utf-8?B?ZWNhM25BUm90RXB3Z0JWbmp2cEVUUWxCMzdVT2RhYWY1bFZLc25SM2hBeC81?=
 =?utf-8?B?WVNQRHZBU0Q0eXVoeTd1NzI1cnBUcTMxbHlXR0QrSkVrVWRjQ2NyWlhrT3g5?=
 =?utf-8?B?TFVycGs2K2JOamZjWkdxbE1LWDFrZlp2endLM0YxWnlDNmJyM3FsYWtYMDZC?=
 =?utf-8?B?ZlNFY2FaUHoxVzNtVFo2TnRpU2hmVVZ1amphQkltZk5XNWVBb3Roamg2Skk5?=
 =?utf-8?B?eGw3VWRUM0UxczRKanBjdzRLazZIMjNKWnZ3ODRtN3J3cnlOY2t3WnBzUDdU?=
 =?utf-8?B?TFV3QWE0N21tVkVhc2N6TFczaGdCOFBlbk9Db2loZ0ZIN2x2L1NVRzhaM1BF?=
 =?utf-8?B?Y0JQVUxHSStSL2NBbzM5R1dCQk5yVnlLZG00aUJEMjVuWGdXam1DQ1RlaFJT?=
 =?utf-8?B?bzg1dnBzSTc3OWw4RER1SzlVNGQxbUxTYzZkNWhaRmQ4a0c0N0dCNmlBdlhq?=
 =?utf-8?B?cnpzN3ZNejMxMWdvbVVJRGRQM3hDSGRlS2NmWFJYcWNrdjlzZGdVZFhDVUg2?=
 =?utf-8?B?czdRbGFxVElSSnl6VmRBU3BiNnltdEpkY2NWSExHc0lSRnZveWwxYlZvMGgr?=
 =?utf-8?B?T3o0NzUyMDZUQlBwek9HS0pranFQNEdXNDNNcDhEYzFEcXZrb3JqQytYVWts?=
 =?utf-8?B?NUJTbVpxRERucEk3R3BpNHpZbGJRS21JY3lDZnkxWG5rdW5MWlBIMGlZaEF1?=
 =?utf-8?B?ZFdKUWhUb0FEWko2L3ZURGh2YzkyS1dsSXJyQ3BKRGJaVVYwb2tCcW5yMjhD?=
 =?utf-8?B?UnNwbnk2NWNnd2t0dkk2QUhKbVJmMWJzZktsM29BMERkdGRQQXk1TTFUbU8z?=
 =?utf-8?B?aTRyb21YMzlieU03bnZmQUdaaXI2N2tmSERFTHpSVTZRdnhuZ3ZKM1hoVk1x?=
 =?utf-8?B?MG9TTzNpNkR0TWZVOE5xT2JnM2tUK3pnUnU3THdPMU9oeHhwekFhK2tjeGc2?=
 =?utf-8?B?WTRmZzZWZW9pelVUZDVpMC84K3lSeFk1MVFOOTdLb20ySUJsc3B4VUNBcEZr?=
 =?utf-8?B?aERTTDJIVllOOFdsc2RCT1JzWmNhNFVRekhpSW5ONzJkcEVTK2FZSHgvL1hP?=
 =?utf-8?B?WlVvWU94UWVhMkJhMVlKb05zMC9ONDJXSnJQQlRzbCt3VnNmSEFSbWRRbVdJ?=
 =?utf-8?B?M0NraDFjNlIrRndIYUQ3OVIrNVZiazVWclFVVlpmd1Z3akgzeXVrZGNCVlNY?=
 =?utf-8?B?UWs2M29rNy82Y0pFQ3dqeThaZ2pGam1FS0ZhZXNVdkUxUE9SWDJURW16S2pD?=
 =?utf-8?B?R1ovTVBmVEJLdUxibXNLNlVsNmR3RGJjL0s3V3BCOU9SR2M4LzlkWjFIRm40?=
 =?utf-8?B?WElWMGNYQnQxcVdTMFJxbDdROCsrYmY2bWsrNDJPL3E0cTUzMHJKaFVnaXlF?=
 =?utf-8?B?azNKbVdTUExCbFNKYTFBb0R1VXNBM1dwTkZkL3Mzbm0yd0thSDQvdkNFT0kz?=
 =?utf-8?B?MVgwNUdDdjhTWHNZN3ZOMGRuQyt5MGNjdHZ6Y1JIOEZlb2M5L2xLWUtIT2lk?=
 =?utf-8?B?NHJtVzZZYmR2M1IyQjluNnI3Vkh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E07EB1407FCEF409CA343C0DA15CA7C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bec21e3-c267-45b0-c184-08de2d867ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 07:27:57.7190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpJTSd/L6mVZJA3nhayppnXsTaopG6Ex2pQbWQ4N+ZInSnCipwCpYiXYsHcFI5jheQTKiHgU+Vnndnc0s6AAImc8cc9en8ZCXF7TTOsJCow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBBB839A03
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

T24gVGh1LCAyMDI1LTExLTEzIGF0IDAxOjMwICswMjAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gQW5vdGhlciAoc29tZXdoYXQgZXhwZW5zaXZlKSBkcm1fZm9ybWF0X2luZm8oKSBjYWxs
IGhhcw0KPiBhcHBlYXJlZCBpbiBpbnRlbF9wbGFuZV9jYW5fYXN5bmNfZmxpcCgpLiBUaGF0IG9u
ZSBtYXkgZ2V0DQo+IGNhbGxlZCBzZXZlcmFsIHRpbWVzIHBlciBjb21taXQgc28gd2UgbmVlZCB0
byBnZXQgcmlkIG9mDQo+IGl0Lg0KPiANCj4gRm9ydHVuYXRlbHkgbW9zdCBjYWxsZXJzIGFscmVh
ZHkgaGF2ZSB0aGUgZnJhbWVidWZmZXIgYXQNCj4gaGFuZCwgc28gd2UgY2FuIGp1c3QgZ3JhYiB0
aGUgZm9ybWF0IGluZm8gZnJvbSB0aGVyZS4NCj4gVGhlIG9uZSBleGNlcHRpb24gaXMgaW50ZWxf
cGxhbmVfZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMoKQ0KPiB3aGVyZSB3ZSBoYXZlIHRvIGRv
IHRoZSBsb29rdXAuIEJ1dCB0aGF0IG9ubHkgZ2V0cyBjYWxsZWQNCj4gKGEgYnVuY2ggb2YgdGlt
ZXMpIGR1cmluZyBkcml2ZXIgaW5pdCB0byBidWlsZCB0aGUNCj4gSU5fRk9STUFUU19BU1lOQyBi
bG9iLCBhbmQgYWZ0ZXJ3YXJkcyB0aGVyZSBpcyBubyBydW50aW1lDQo+IGNvc3QuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pOXh4X3Bs
YW5lLmPCoMKgwqDCoCB8wqAgNCArKy0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5LmPCoCB8wqAgMiArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfcGxhbmUuY8KgwqDCoCB8IDIyICsrKysrKysrKysrLS0tLS0tDQo+IC0tDQo+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wbGFuZS5owqDCoMKgIHzCoCA0
ICsrKy0NCj4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmPCoMKg
wqAgfMKgIDIgKy0NCj4gwqA1IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE0IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaTl4eF9wbGFuZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pOXh4X3Bs
YW5lLmMNCj4gaW5kZXggNTFjY2M2YmQ1ZjIxLi5iOTNjODYxOTdiNGEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaTl4eF9wbGFuZS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaTl4eF9wbGFuZS5jDQo+IEBAIC04MTksNyArODE5LDcg
QEAgdW5zaWduZWQgaW50IHZsdl9wbGFuZV9taW5fYWxpZ25tZW50KHN0cnVjdA0KPiBpbnRlbF9w
bGFuZSAqcGxhbmUsDQo+IMKgew0KPiDCoAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9
IHRvX2ludGVsX2Rpc3BsYXkocGxhbmUpOw0KPiDCoA0KPiAtCWlmIChpbnRlbF9wbGFuZV9jYW5f
YXN5bmNfZmxpcChwbGFuZSwgZmItPmZvcm1hdC0+Zm9ybWF0LA0KPiBmYi0+bW9kaWZpZXIpKQ0K
PiArCWlmIChpbnRlbF9wbGFuZV9jYW5fYXN5bmNfZmxpcChwbGFuZSwgZmItPmZvcm1hdCwgZmIt
DQo+ID5tb2RpZmllcikpDQo+IMKgCQlyZXR1cm4gMjU2ICogMTAyNDsNCj4gwqANCj4gwqAJLyog
RklYTUUgdW5kb2N1bWVudGVkIHNvIG5vdCBzdXJlIHdoYXQncyBhY3R1YWxseSBuZWVkZWQgKi8N
Cj4gQEAgLTg0Myw3ICs4NDMsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50DQo+IGc0eF9wcmltYXJ5
X21pbl9hbGlnbm1lbnQoc3RydWN0IGludGVsX3BsYW5lICpwbGFuZSwNCj4gwqB7DQo+IMKgCXN0
cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShwbGFuZSk7DQo+
IMKgDQo+IC0JaWYgKGludGVsX3BsYW5lX2Nhbl9hc3luY19mbGlwKHBsYW5lLCBmYi0+Zm9ybWF0
LT5mb3JtYXQsDQo+IGZiLT5tb2RpZmllcikpDQo+ICsJaWYgKGludGVsX3BsYW5lX2Nhbl9hc3lu
Y19mbGlwKHBsYW5lLCBmYi0+Zm9ybWF0LCBmYi0NCj4gPm1vZGlmaWVyKSkNCj4gwqAJCXJldHVy
biAyNTYgKiAxMDI0Ow0KPiDCoA0KPiDCoAlpZiAoaW50ZWxfc2Nhbm91dF9uZWVkc192dGRfd2Eo
ZGlzcGxheSkpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jDQo+IGluZGV4IDA2OTk2NzExNGJkOS4uNzFiZDg0ODQ4ODViIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBAQCAtNjEyMiw3
ICs2MTIyLDcgQEAgc3RhdGljIGludCBpbnRlbF9hc3luY19mbGlwX2NoZWNrX2h3KHN0cnVjdA0K
PiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLCBzdHJ1Y3QgaW4NCj4gwqAJCWlmICghcGxhbmUt
PmFzeW5jX2ZsaXApDQo+IMKgCQkJY29udGludWU7DQo+IMKgDQo+IC0JCWlmICghaW50ZWxfcGxh
bmVfY2FuX2FzeW5jX2ZsaXAocGxhbmUsDQo+IG5ld19wbGFuZV9zdGF0ZS0+aHcuZmItPmZvcm1h
dC0+Zm9ybWF0LA0KPiArCQlpZiAoIWludGVsX3BsYW5lX2Nhbl9hc3luY19mbGlwKHBsYW5lLA0K
PiBuZXdfcGxhbmVfc3RhdGUtPmh3LmZiLT5mb3JtYXQsDQo+IMKgCQkJCQkJbmV3X3BsYW5lX3N0
YXRlLQ0KPiA+aHcuZmItPm1vZGlmaWVyKSkgew0KPiDCoAkJCWRybV9kYmdfa21zKGRpc3BsYXkt
PmRybSwNCj4gwqAJCQkJwqDCoMKgICJbUExBTkU6JWQ6JXNdIHBpeGVsIGZvcm1hdA0KPiAlcDRj
YyAvIG1vZGlmaWVyIDB4JWxseCBkb2VzIG5vdCBzdXBwb3J0IGFzeW5jIGZsaXBcbiIsDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BsYW5lLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BsYW5lLmMNCj4gaW5kZXggNTEw
NWUzMjc4YmM0Li5lZTljZGE5NGE3YzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3BsYW5lLmMNCj4gQEAgLTE3OCwyNSArMTc4LDI5IEBAIGJvb2wgaW50ZWxf
cGxhbmVfbmVlZHNfcGh5c2ljYWwoc3RydWN0DQo+IGludGVsX3BsYW5lICpwbGFuZSkNCj4gwqAJ
CURJU1BMQVlfSU5GTyhkaXNwbGF5KS0+Y3Vyc29yX25lZWRzX3BoeXNpY2FsOw0KPiDCoH0NCj4g
wqANCj4gLWJvb2wgaW50ZWxfcGxhbmVfY2FuX2FzeW5jX2ZsaXAoc3RydWN0IGludGVsX3BsYW5l
ICpwbGFuZSwgdTMyDQo+IGZvcm1hdCwNCj4gK2Jvb2wgaW50ZWxfcGxhbmVfY2FuX2FzeW5jX2Zs
aXAoc3RydWN0IGludGVsX3BsYW5lICpwbGFuZSwNCj4gKwkJCQljb25zdCBzdHJ1Y3QgZHJtX2Zv
cm1hdF9pbmZvICppbmZvLA0KPiDCoAkJCQl1NjQgbW9kaWZpZXIpDQo+IMKgew0KPiAtCWlmDQo+
IChpbnRlbF9mb3JtYXRfaW5mb19pc195dXZfc2VtaXBsYW5hcihkcm1fZm9ybWF0X2luZm8oZm9y
bWF0KSwNCj4gbW9kaWZpZXIpIHx8DQo+IC0JwqDCoMKgIGZvcm1hdCA9PSBEUk1fRk9STUFUX0M4
KQ0KPiArCWlmIChpbnRlbF9mb3JtYXRfaW5mb19pc195dXZfc2VtaXBsYW5hcihpbmZvLCBtb2Rp
ZmllcikgfHwNCj4gKwnCoMKgwqAgaW5mby0+Zm9ybWF0ID09IERSTV9GT1JNQVRfQzgpDQo+IMKg
CQlyZXR1cm4gZmFsc2U7DQo+IMKgDQo+IMKgCXJldHVybiBwbGFuZS0+Y2FuX2FzeW5jX2ZsaXAg
JiYgcGxhbmUtDQo+ID5jYW5fYXN5bmNfZmxpcChtb2RpZmllcik7DQo+IMKgfQ0KPiDCoA0KPiAt
Ym9vbCBpbnRlbF9wbGFuZV9mb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYyhzdHJ1Y3QgZHJtX3Bs
YW5lICpwbGFuZSwNCj4gLQkJCQkJwqDCoMKgIHUzMiBmb3JtYXQsDQo+IC0JCQkJCcKgwqDCoCB1
NjQgbW9kaWZpZXIpDQo+ICtib29sIGludGVsX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkX2Fz
eW5jKHN0cnVjdCBkcm1fcGxhbmUNCj4gKl9wbGFuZSwNCj4gKwkJCQkJwqDCoMKgIHUzMiBmb3Jt
YXQsIHU2NA0KPiBtb2RpZmllcikNCj4gwqB7DQo+IC0JaWYgKCFwbGFuZS0+ZnVuY3MtPmZvcm1h
dF9tb2Rfc3VwcG9ydGVkKHBsYW5lLCBmb3JtYXQsDQo+IG1vZGlmaWVyKSkNCj4gKwlzdHJ1Y3Qg
aW50ZWxfcGxhbmUgKnBsYW5lID0gdG9faW50ZWxfcGxhbmUoX3BsYW5lKTsNCj4gKwljb25zdCBz
dHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvOw0KPiArDQo+ICsJaWYgKCFwbGFuZS0+YmFzZS5m
dW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWQoJnBsYW5lLT5iYXNlLA0KPiBmb3JtYXQsIG1vZGlm
aWVyKSkNCj4gwqAJCXJldHVybiBmYWxzZTsNCj4gwqANCj4gLQlyZXR1cm4gaW50ZWxfcGxhbmVf
Y2FuX2FzeW5jX2ZsaXAodG9faW50ZWxfcGxhbmUocGxhbmUpLA0KPiAtCQkJCQlmb3JtYXQsIG1v
ZGlmaWVyKTsNCj4gKwlpbmZvID0gZHJtX2dldF9mb3JtYXRfaW5mbyhwbGFuZS0+YmFzZS5kZXYs
IGZvcm1hdCwNCj4gbW9kaWZpZXIpOw0KPiArDQo+ICsJcmV0dXJuIGludGVsX3BsYW5lX2Nhbl9h
c3luY19mbGlwKHBsYW5lLCBpbmZvLCBtb2RpZmllcik7DQo+IMKgfQ0KPiDCoA0KPiDCoHVuc2ln
bmVkIGludCBpbnRlbF9hZGp1c3RlZF9yYXRlKGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqc3JjLA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wbGFuZS5o
DQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wbGFuZS5oDQo+IGluZGV4
IDRlOTlkZjlkZTNlOC4uNWE4ZjJmM2JhYWI1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3BsYW5lLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9wbGFuZS5oDQo+IEBAIC04LDYgKzgsNyBAQA0KPiDCoA0KPiDCoCNp
bmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiDCoA0KPiArc3RydWN0IGRybV9mb3JtYXRfaW5mbzsN
Cj4gwqBzdHJ1Y3QgZHJtX3BsYW5lOw0KPiDCoHN0cnVjdCBkcm1fcHJvcGVydHk7DQo+IMKgc3Ry
dWN0IGRybV9yZWN0Ow0KPiBAQCAtMjEsNyArMjIsOCBAQCBlbnVtIHBsYW5lX2lkOw0KPiDCoA0K
PiDCoHN0cnVjdCBpbnRlbF9wbGFuZSAqDQo+IMKgaW50ZWxfY3J0Y19nZXRfcGxhbmUoc3RydWN0
IGludGVsX2NydGMgKmNydGMsIGVudW0gcGxhbmVfaWQNCj4gcGxhbmVfaWQpOw0KPiAtYm9vbCBp
bnRlbF9wbGFuZV9jYW5fYXN5bmNfZmxpcChzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5lLCB1MzIN
Cj4gZm9ybWF0LA0KPiArYm9vbCBpbnRlbF9wbGFuZV9jYW5fYXN5bmNfZmxpcChzdHJ1Y3QgaW50
ZWxfcGxhbmUgKnBsYW5lLA0KPiArCQkJCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmlu
Zm8sDQo+IMKgCQkJCXU2NCBtb2RpZmllcik7DQo+IMKgdW5zaWduZWQgaW50IGludGVsX2FkanVz
dGVkX3JhdGUoY29uc3Qgc3RydWN0IGRybV9yZWN0ICpzcmMsDQo+IMKgCQkJCSBjb25zdCBzdHJ1
Y3QgZHJtX3JlY3QgKmRzdCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gaW5kZXggODljODAwM2NjZmU3Li45MjFiMmY3
M2QyN2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3Vu
aXZlcnNhbF9wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2ts
X3VuaXZlcnNhbF9wbGFuZS5jDQo+IEBAIC01OTUsNyArNTk1LDcgQEAgc3RhdGljIHUzMiB0Z2xf
cGxhbmVfbWluX2FsaWdubWVudChzdHJ1Y3QNCj4gaW50ZWxfcGxhbmUgKnBsYW5lLA0KPiDCoAkg
KiBGaWd1cmUgb3V0IHdoYXQncyBnb2luZyBvbiBoZXJlLi4uDQo+IMKgCSAqLw0KPiDCoAlpZiAo
ZGlzcGxheS0+cGxhdGZvcm0uYWxkZXJsYWtlX3AgJiYNCj4gLQnCoMKgwqAgaW50ZWxfcGxhbmVf
Y2FuX2FzeW5jX2ZsaXAocGxhbmUsIGZiLT5mb3JtYXQtPmZvcm1hdCwNCj4gZmItPm1vZGlmaWVy
KSkNCj4gKwnCoMKgwqAgaW50ZWxfcGxhbmVfY2FuX2FzeW5jX2ZsaXAocGxhbmUsIGZiLT5mb3Jt
YXQsIGZiLQ0KPiA+bW9kaWZpZXIpKQ0KPiDCoAkJcmV0dXJuIG11bHQgKiAxNiAqIDEwMjQ7DQo+
IMKgDQo+IMKgCXN3aXRjaCAoZmItPm1vZGlmaWVyKSB7DQoNCg==
