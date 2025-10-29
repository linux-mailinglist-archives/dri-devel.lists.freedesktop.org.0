Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90C4C18C1C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EEA10E713;
	Wed, 29 Oct 2025 07:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpZBJAsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671E110E179;
 Wed, 29 Oct 2025 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761724019; x=1793260019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VTU+AhoY5cGyVpipvk3MfWiUG8KJRPRNZOS3gF8ex5g=;
 b=GpZBJAsRLgkuupY4oTE2yCa34idzxco262XQK9ToxhXeci9bgTR2njNc
 fKP4TVFFamypzKo2JD+UWt3ZggsUPr/Mc4+E8iCVhGXC12KPAYplZ2v7h
 b4ftrHbCZ2tEwqj9Qs46xLEU5Cewsf8/hWgTCXTKFbo0RG6wn4UNyRf4/
 o76QorsuJ2A//MYQCacbS+cP/swaq5r4Avzqsl4+tny57AZT1U/ASvXmL
 dzQIsqpoxZiT7cbqCx6cAHGrhbyEGfH5ye9iOtgYNxFCqTmsT16NzHWbj
 2lmOMtSko/cpfgbE8TQuklFFuF90glt166cH4LJE+Dr6YzgLN4QoC9Jnz A==;
X-CSE-ConnectionGUID: twbhOo6jRfWYxeQs3xSGeQ==
X-CSE-MsgGUID: oe2119s8Qx+rvtmLts7Pmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89305746"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="89305746"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:46:50 -0700
X-CSE-ConnectionGUID: IQBtUiGyQqmEj7mnk6cY6Q==
X-CSE-MsgGUID: D4SxpeVDRlS/as2+B2R73Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185927404"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:46:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 00:46:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 00:46:49 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 00:46:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hO04pL6KQAnuLTWupGoG6xLtj2FvNWINBNzUhAQ/kDQnjVddZ4yVzlXKc89g3PRWeJEzYSKMEQ35ChADOufX2eR9UwfHSPzBgKQA2bSn0csto4ZG0DoR9SlE2t9wiVfl1R8sdyNcJS3IIOcaQocbDums0unNZDPxIgDZwDd9C49O8VhmyrNdCNQQstQIUAm8iWHaSJaq7EoyxDniZdFd8iCseFUJvhziIG38uoDWhqXM17cc8ZUkSkR3AIOONO2No35ZN8DWtGbXy2AMa1awnJ0kmMSPdiIYO9gbznEzqWIqLeqOatgkixM1wDwG8UWk/nxs7WXhtR1hvE9Csq05BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTU+AhoY5cGyVpipvk3MfWiUG8KJRPRNZOS3gF8ex5g=;
 b=GXnJ3z0I4zbW+PNHegWA2YqPwVj+N22vlWNQQLsIAmiiuqC3ZbFe30r13+GjT364DDNi4/4oUlsI+Gp0aSsbLgQeWKt8SeMra33Wodw37UZlrHpb2dZUW3z2NNXYM2mXYaYw1yPwbjtIqJX+rtvvHNS6G6ZpKW2099j8QNVfLdxFiwbXuIPGZetmXdwIt0uDoUg2O5RcVO9vFiDw9xDLmyQm0HGDkwaotcA7jlGbJcP76yyBbLOfoa6GN9IC7WDst2DQDL2nuqcPdlch1XPVdXHlOxVvb7/Isjz5Z21E3FxEazdI2gcsoGy7VGkR2ykCv8NOG3jgtjKocEcx9r2Lmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB7941.namprd11.prod.outlook.com
 (2603:10b6:208:3ff::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 07:46:47 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 07:46:46 +0000
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
Subject: RE: [PATCH v6 3/5] drm/atomic: Allocate atomic_state at the beginning
 of atomic_ioctl
Thread-Topic: [PATCH v6 3/5] drm/atomic: Allocate atomic_state at the
 beginning of atomic_ioctl
Thread-Index: AQHcOQD4AeDH3YsmO0ysHLu8qkBdvLTY29QA
Date: Wed, 29 Oct 2025 07:46:46 +0000
Message-ID: <DM3PPF208195D8D7DFDB5695BD42A3B437DE3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
 <20251009-atomic-v6-3-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-3-d209709cc3ba@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB7941:EE_
x-ms-office365-filtering-correlation-id: 2a97ff62-ace7-4463-9669-08de16bf4fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dW1Nemo4SUVmOU80d1FzMHNtS1BUcWFxZjE5NEhOSTFyVU9GY0pTM2pqTzN1?=
 =?utf-8?B?UEd6bVNUSWtXckF5NlhQVkh0Y3dybzE5TzhlblVjcElOZk95RENGdm1rMVR6?=
 =?utf-8?B?NDM1dVVlS1lRLzV4Smxqa3lTb2NpVXo3UUh4MDN1WjBvUGJmb0FDUnVEYllU?=
 =?utf-8?B?QTRZTzhsL3ZUTnJWeDFLb3dkRjNGZnkwaGJ0Y3VTbTJ4UjlHc0FPMGNQVG9K?=
 =?utf-8?B?L21RWHlQMitORDNPVEZyb2tpRzF6Zk14SlA4ZFY5NFFhV0NPb2xweE9reXFt?=
 =?utf-8?B?RFd5ZUljYkJld3Rud2g3SkNQNGx2TTZzcmJuNVc2UTJNdjhNVkJuSlRYbFR3?=
 =?utf-8?B?UXlSZ0ZHT1JhUnc3NjJRQ0tORlEzamd4N2ZhcVlWU0VxVlEwb2pXampERUht?=
 =?utf-8?B?V2Y3NHcramF2Tm03djBWRUNFRFVzVndKWm4vaU1pbTVTNk05L3A2d3F0elpn?=
 =?utf-8?B?Q3JvSGo2NVdocUkxbHNUdmk3K0JPWTZROTkvY3BoSnZQZjdjcWRadVIxRndl?=
 =?utf-8?B?OUx0L0lpVmVPaG8zYUJrSWpCWWs5RTdaRHQyZGtlZDNUSzhHZ0Z3NUhQaHli?=
 =?utf-8?B?a1FiYTlPbzhmUjVNdUxPejFFbnJQOXQ5SHpFbnpqSFRXb3BwWUJZQ051YzFu?=
 =?utf-8?B?amtlVFEvZjhhdmczNEQyNzFHUXRkWFRTS3VZSy9mVXorSnVXS2wvRGF0YjJ0?=
 =?utf-8?B?Y1lnSkVDeWk4a1Jod09jN3RSbG1aWS9NY2tvaHFLV3lzNXRGbFRmTFQ4dWVx?=
 =?utf-8?B?blU2ekl4TXNMOFhZZWtRbUUwaE44cmtmYjBrSC9rbXNZcHV0Z0E3dG5HSXNi?=
 =?utf-8?B?ZGoxU0kwTUl3ZEpyUVkvdEVjNERkSWkxb2U3VHVzQng4alQxcmJUZVhSTWcy?=
 =?utf-8?B?Z0hqWWpiQ0hlbEF1d05QTi9ORUk2ZTlvWnF1TCs4bXlaemZ6S3Fxa0ZpM21X?=
 =?utf-8?B?N2NvOWtRN2M2eEkrMWZEY3RqbjNiamV2OFVHSHNuZ0hjcVlhZGsrb25mU3RS?=
 =?utf-8?B?NVc3OEdxMk15ZTFiTnJ0VHNsaG5TNGM5MlRCQ0I0a1MwNElwR3JRUTJjS2Vy?=
 =?utf-8?B?WTVPSzF6S2RVZmtld3Z5UDllcS9rUzRadWVWNkNiVldMaSt1UGdvY0djMU5h?=
 =?utf-8?B?NDVCL2pvQ0NPNnlhZkpKYVNmYzNXd3lFd1psUTdwNG5FVml5QW5qUDJoSDhH?=
 =?utf-8?B?dDNuRlhlL1Z0Rk44eG9NdGY3WVFQSmd5MXVpNENIKy8rcHAybitYbDFKdnJY?=
 =?utf-8?B?SHlQUkNiSmNWbHJIWlBEVFBsNUF2UVh3SGQ1UWxOLzlQSWJySXBhMS9MWmlC?=
 =?utf-8?B?dXV4L252akRBcXBoTWdFUG0xK1Y0V0J3aGN1N3M4djhpVFpubVcxVWlNMFBi?=
 =?utf-8?B?UUZ3OVQ3NzlQeU5mRTgrR2tHT1NBS2hwcGdQQzRLYlArNUl6UU1HRTBSdS9i?=
 =?utf-8?B?LzY0RTg2VTNsR2JySC9oWXd2Qk9MQTU4NlVVdExDYmRDUGVVZnJaVTVyTHhi?=
 =?utf-8?B?RTI3VUdqU1VPUU1lNlV2akhQS3Z5RDhGTkZQZTZ0enRHSFZYcnM4MmpZS21a?=
 =?utf-8?B?dWo4TUhGN1ZSUFF1b3BUcEREVzJHeUNOL0xkMGk2VmxPczVCais4dGdMSWI1?=
 =?utf-8?B?UkZQbHQ0N0JraHJUdzZDVnF2eE40cVJhTHVNTXo1TTdLTmNWblk1aGx6WTE0?=
 =?utf-8?B?R1p0MjliSEtCR2hKQVMyUjJVOXdCdThyNkhMaG9PejFEUjVoTFE5R1kxcHVS?=
 =?utf-8?B?Y1B5KzhzL1krcXpiUzM3UHcyYWlUWVp6OUF1N3U1ajNmV1ZuUGNPdUZ4bEFa?=
 =?utf-8?B?L3JGTndlOEprU3dVNDVOeXBDM2NJbnFkdFlDTFNxYk12Zkdwa1gvNEVNRCt0?=
 =?utf-8?B?d24vaUdyTkwrNmdkTXJGN2xCeFAxY2tVdmVnam5YNWFsRWNHTXpva1ZUbFdw?=
 =?utf-8?B?MEJUYWdEMXN2RnovT29VbkhyR3NQTWw2VExycVlZRDhqMUNnbUF5UngwbnBJ?=
 =?utf-8?B?a0pjODhKdk8yWnRlZEtpTWJVdGt0bHRTU3AzbExpR0FSYU0xUk9VTitaZCt6?=
 =?utf-8?B?MWs5bGduR1NJTWlOdzhKUXZ2M2pxVUxTb0dzUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjRaRTAydzFKT1phN0pJejY5RWM4MCtBdll0QjZSMUdqeU40SFkvK1BPdlJ6?=
 =?utf-8?B?ZjliTkJibk1qSmY3Sm1yOXFrYzBHK1dDZmRWZlEraXNzTmlHbmZhVXIvUnM4?=
 =?utf-8?B?bDhjci9QZnRJNFFvUU9XcDg3b0FTTlpqNnhROEdNcUd5c0FXQkpZNUdvb3JQ?=
 =?utf-8?B?enJKb1dPM1lVQjNGdGRaUVM5bllxVnRkOFczNFRLOHRGM2Qwdlh3WTZTNFh5?=
 =?utf-8?B?c2pmU0VPWDNSYkF4eEthVU9UWWRkMXlMN2hYYkY4eFJqQ21PSzdGK0ZLVmwz?=
 =?utf-8?B?MkJVdHBrTU9Cd1JqNlRjVWFEVWpERTZOektCTDVVVklOaVVPU2x0b3puUlNz?=
 =?utf-8?B?R3l0WUdSd0ZJMVRIclJEZDRJeHltWTJmb2NLc1c5TjlHTU9FcDRWK0dHc2hn?=
 =?utf-8?B?THMxNEp3Z05XU1Bab1dITnA2bUExNENKSmVQc1lrL3VnbjVVSkdmV0I3VGNC?=
 =?utf-8?B?bzVVNDhWL0lVb2tJWWRTQm5YM0JUVk45UzlKQ0t4NWdDMDNEVHd3ZFR5cEh1?=
 =?utf-8?B?RVJpZk11dmdUYklrbXFxWHBYcEdaUytMTEFGOU5FbHFUSGs1ZXBzVTdGZmRw?=
 =?utf-8?B?R3JtUmZhbjlvRGFTTFJaelBkajhSeUJ5cWdlbVM3Q0RyS2tIdmFOTzR3Q0VF?=
 =?utf-8?B?bmUzcWNSREU2aFZ2U2FHRzNrQjZJSEJCL2ZDTldJbWpESGE3azkyY0NtbnB4?=
 =?utf-8?B?WG5sV3BHazIvVkgxTVFUVVhVNFdnanR2a1ZTMGNPZTlNK0FieHlWVzRtcXVj?=
 =?utf-8?B?UHR0WUZtS0t6Q1E5Q21OOWowTDBhTUhNZk9MRDVraEQvTGVUWjBwNHpsVWg3?=
 =?utf-8?B?WEVQNTcvRVBmY3U4UFYrdmtIOGZYb3RwQmhWRjRZYzVKdmY1bnJmN2dLR0lN?=
 =?utf-8?B?WDQxWGJ6N1hiTzhaNUxTYWhveU14V1JTREVHL0RnRDA5MUxQc1lJM0dzNS9j?=
 =?utf-8?B?akhZN3FlaWs0ZUNJSzdBTzhrLy9kK3MvanFaSGRKd1FFemRUL2FscEVNUm5B?=
 =?utf-8?B?TVdPbmJNalVvZTM2N1hhcmJMWTNYS2ZXNG5ENXo4dGo5Z3l6clg1NXp3d2Ev?=
 =?utf-8?B?aVZUVksrc3dFTVhiTXFhSTJDK2xaWnZrempwYzhydUNnVEVIc0hmM0xGZGhw?=
 =?utf-8?B?OHJXbkRaMzFaV0NnZ3Z0aERYM0VnTDNPOXI2eXRJSVRRVUNPSUNBVjVjVWtL?=
 =?utf-8?B?cm1nQkIxWHBHQ1VIUDJFQ0RacVNoZkplbG9PaGRYSWV4TDNjU1V1TDA5UDFr?=
 =?utf-8?B?ZlE3ZzJXSDhWNVVPc3EzVlNzOG44STNqdngxZ3NFaTAremlpQ2JQd016cEJP?=
 =?utf-8?B?M3MwTGZiSnczSDU4SHhCQ3lKZi9peXk1SXIyWGlIQm1jWE8xMjVPc1phTDhW?=
 =?utf-8?B?TzR6N1dOSlc3dVF0YUcwaXBrbVZVM3RuUEhCSVhCZHJIZ1VFVGFBRkNVSVpF?=
 =?utf-8?B?M0hHdEhKdWsxckhKeGplZGVPL2R6S2I2S1BRczBjNm50ZGFGZTQwOTBuenI4?=
 =?utf-8?B?aEFheDlOS1lPZEUrQjNQSjZxczliRG9ZeEdNR0dIOGtzL2dQVkxWbXNBeWs5?=
 =?utf-8?B?MVhaVjc0cGx0VTNaK01MMVBHd2hUQmZyWUVDOEZ3cTN4TGJDU3RIUTNzbGxt?=
 =?utf-8?B?ZkxwYmlKTTZqajNkNE5sTzQxOEh5VytQL0VFU1o0VWlwWDNFdVNCZ2Q3SmNi?=
 =?utf-8?B?QXkvSHVSZDRxUVROanczTzBQWm0xYXVaQTBEalZQQUN4R2M0TDUzbzFTYXVU?=
 =?utf-8?B?L0cvdFlWZ0NwVFdCZDZLYmZHOE9NYmVJTFpTaldRQ1BJQi9uL083dEY1V2dB?=
 =?utf-8?B?UkNBSHNnMlNRL2dwMDB1RmZiRUE2c3VHTlBCNDhUb2hBZHRRMFBTL3NQSDlZ?=
 =?utf-8?B?N3REWXh6ak45U1hTL0hnN3g5OUdpZWRPeGp5SWpmL2FaUUFrV1NONUUvK1pN?=
 =?utf-8?B?bnV6d3RzRmZ2THFaODR3VzdCb0FVVmh6QXVjSFhLcmxkOXBTbFRVWUdoQU1Y?=
 =?utf-8?B?OUgzMUpvRnR0bWV6MjZRaDNBd3pYZ1hYQm1XbWs0aFhnT0dDb2pXeUxqL2JY?=
 =?utf-8?B?U2NteUZKdVlicjljMDhmYkY1TTZ4SGwvN1loWnFnRFliSlNFWll5a3Zad0x3?=
 =?utf-8?Q?O+VFURswcIdthckWBtTaRHeLa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a97ff62-ace7-4463-9669-08de16bf4fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 07:46:46.7297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31pEU5GkB7Eq8lmtPbyEJpXjd3gQF71TJKWfMsHfoyUg2fW0HLRAet6cOS4YeoX2QnjTB+HjPu5SUHXkEf0PPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7941
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjYgMy81XSBkcm0vYXRvbWljOiBBbGxvY2F0ZSBhdG9taWNfc3Rh
dGUgYXQgdGhlIGJlZ2lubmluZyBvZg0KPiBhdG9taWNfaW9jdGwNCj4gDQo+IE1vdmluZyBhdG9t
aWNfc3RhdGUgYWxsb2NhdGlvbiB0byB0aGUgYmVnaW5uaW5nIG9mIHRoZSBhdG9tY2lfaW9jdGwg
dG8NCg0KVGhpcyBuZWVkcyB0byBiZSBpbiBpbWVyYXRpdmUgbGFuZ3VhZ2Ugc28gc29tZXRoaW5n
IGxpa2UgIk1vdmUgLi4uIg0KQWxzbyBUeXBvICphdG9taWNfaW9jdGwNCg0KPiBhY2NvbW1vZGF0
ZSBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUgdXNhZ2UgZm9yIHJldHVybmluZyBlcnJvciBjb2Rl
IG9uDQo+IGZhaWx1cmVzLg0KPiANCg0KQWxzbyBtYXliZSBtZW50aW9uIHdoeSBkcm1fbW9kZV9h
dG9taWNfZXJyX2NvZGUgY2Fubm90IGJlIGFjY29tbW9kYXRlZCBhdCBwcmV2aW91cyBwbGFjZQ0K
DQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyB8IDIxICsrKysr
KysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljX3VhcGkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPiBpbmRl
eA0KPiA4NWRiZGFhNGEyZTI1ODc4Yzk1M2I5YjQxNTM5Yzg1NjZkNTVjNmQ5Li4zZWY0NzhlNzE3
YmVjOTE3ZDFiODgwM2MNCj4gNzJiYmNjOGQ2NDA5ZDc0NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
YXRvbWljX3VhcGkuYw0KPiBAQCAtMTM5NCwxMyArMTM5NCwyMSBAQCBpbnQgZHJtX21vZGVfYXRv
bWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ICAJc3RydWN0IGRybV9tb2Rl
c2V0X2FjcXVpcmVfY3R4IGN0eDsNCj4gIAlzdHJ1Y3QgZHJtX291dF9mZW5jZV9zdGF0ZSAqZmVu
Y2Vfc3RhdGU7DQo+ICAJaW50IHJldCA9IDA7DQo+IC0JdW5zaWduZWQgaW50IGksIGosIG51bV9m
ZW5jZXM7DQo+ICsJdW5zaWduZWQgaW50IGksIGosIG51bV9mZW5jZXMgPSAwOw0KPiAgCWJvb2wg
YXN5bmNfZmxpcCA9IGZhbHNlOw0KPiANCj4gIAkvKiBkaXNhbGxvdyBmb3IgZHJpdmVycyBub3Qg
c3VwcG9ydGluZyBhdG9taWM6ICovDQo+ICAJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRl
diwgRFJJVkVSX0FUT01JQykpDQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gDQo+ICsJc3Rh
dGUgPSBkcm1fYXRvbWljX3N0YXRlX2FsbG9jKGRldik7DQo+ICsJaWYgKCFzdGF0ZSkNCj4gKwkJ
cmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKwlkcm1fbW9kZXNldF9hY3F1aXJlX2luaXQoJmN0eCwN
Cj4gRFJNX01PREVTRVRfQUNRVUlSRV9JTlRFUlJVUFRJQkxFKTsNCj4gKwlzdGF0ZS0+YWNxdWly
ZV9jdHggPSAmY3R4Ow0KPiArCXN0YXRlLT5hbGxvd19tb2Rlc2V0ID0gISEoYXJnLT5mbGFncyAm
DQo+IERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VUKTsNCj4gKw0KPiAgCS8qIGRpc2FsbG93
IGZvciB1c2Vyc3BhY2UgdGhhdCBoYXMgbm90IGVuYWJsZWQgYXRvbWljIGNhcCAoZXZlbg0KPiAg
CSAqIHRob3VnaCB0aGlzIG1heSBiZSBhIGJpdCBvdmVya2lsbCwgc2luY2UgbGVnYWN5IHVzZXJz
cGFjZQ0KPiAgCSAqIHdvdWxkbid0IGtub3cgaG93IHRvIGNhbGwgdGhpcyBpb2N0bCkgQEAgLTE0
MzksMTQgKzE0NDcsNiBAQCBpbnQNCj4gZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgCX0NCj4gDQo+IC0Jc3RhdGUg
PSBkcm1fYXRvbWljX3N0YXRlX2FsbG9jKGRldik7DQo+IC0JaWYgKCFzdGF0ZSkNCj4gLQkJcmV0
dXJuIC1FTk9NRU07DQo+IC0NCj4gLQlkcm1fbW9kZXNldF9hY3F1aXJlX2luaXQoJmN0eCwNCj4g
RFJNX01PREVTRVRfQUNRVUlSRV9JTlRFUlJVUFRJQkxFKTsNCj4gLQlzdGF0ZS0+YWNxdWlyZV9j
dHggPSAmY3R4Ow0KPiAtCXN0YXRlLT5hbGxvd19tb2Rlc2V0ID0gISEoYXJnLT5mbGFncyAmDQo+
IERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VUKTsNCj4gLQ0KPiAgcmV0cnk6DQo+ICAJY29w
aWVkX29ianMgPSAwOw0KPiAgCWNvcGllZF9wcm9wcyA9IDA7DQo+IEBAIC0xNTQzLDcgKzE1NDMs
OCBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+
ICAJfQ0KPiANCj4gIG91dDoNCj4gLQljb21wbGV0ZV9zaWduYWxpbmcoZGV2LCBzdGF0ZSwgZmVu
Y2Vfc3RhdGUsIG51bV9mZW5jZXMsICFyZXQpOw0KPiArCWlmIChudW1fZmVuY2VzKQ0KPiArCQlj
b21wbGV0ZV9zaWduYWxpbmcoZGV2LCBzdGF0ZSwgZmVuY2Vfc3RhdGUsIG51bV9mZW5jZXMsICFy
ZXQpOw0KDQpXaHkgdGhlIG5lZWQgdG8gY2hlY2sgbnVtX2ZlbmNlcyBiZWZvcmUgd2UgY29tcGxl
dGUgc2lnbmFsbGluZw0KQWxzbyB0aGlzIHNlZW1zIGxpa2UgYSBzZXBhcmF0ZSBjaGFuZ2UgbWF5
YmUgc2hvdWxkIGJlIGluIGl0cyBvd24gcGF0Y2gNCg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwN
Cg0KPiANCj4gIAlpZiAocmV0ID09IC1FREVBRExLKSB7DQo+ICAJCWRybV9hdG9taWNfc3RhdGVf
Y2xlYXIoc3RhdGUpOw0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
