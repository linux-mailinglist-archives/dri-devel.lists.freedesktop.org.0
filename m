Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C54A2F7AE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA66010E1E7;
	Mon, 10 Feb 2025 18:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/2DZmyX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BE510E091;
 Mon, 10 Feb 2025 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739213176; x=1770749176;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5CUh7iZOO0w0pXBVX7tcCqCiArRGR7RsSuUGzDASoec=;
 b=S/2DZmyXE65kyHgVBkpBGQ/Ui8O2Bwi1ucoQuQLqJ34bNGp5daktllJE
 fgOT84eTS0dfOg8L9mipZtHc2aW2aMlTRUKj4GLbOpYYEpZVbB4caGmSU
 HjLIzZQsO5d4WVfBp2lqfP74ssSOIcASjBzdUIxyFiCLTcmjJ2lAFCPY0
 41tFJ6ky8CM4VoB7j6a2W7udBnMe0O5icCdh2J6u2bZq9gMJjIgV3038X
 CMYZLGelqCfzHpSQfnPCZ46/PSjlPNJNZvGZ90Y1evJBvFNuWRloHmdY3
 paRZWipXLQr/rRkqhMo9gpQMi/bdh3WCChmx8scKUQ338lNDLn/oKNK+v A==;
X-CSE-ConnectionGUID: N35BMkSlThiiKwLR62J4sg==
X-CSE-MsgGUID: zYLazmbESmSrmI3h2Z3vuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43572672"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="43572672"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:46:16 -0800
X-CSE-ConnectionGUID: MuhnCw/RScWFoslTNG8sIQ==
X-CSE-MsgGUID: eU1skfx6S/2qUhIf8XRJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143161160"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:46:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:46:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:46:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:46:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVRLHGre5MhwVeAohIJn4i3zIX0iE8Op7goprMJ3kpXdC4Ar/vxP5STQBMU4kfyGOC8/3Vwbd7+8H/l9pZ3bt/459DNBwY6/XLNGSK7icvs7s0FzKJzWPsJE4D0hqtreZR4NmL5MdVI94xB2X93vHyhmPqiavaTKFBQsclEpqazMXesw3ZSXFQJFdVyAE79xUw8yXYhp5gWGEVu7oNNPx+fBgtyPgPwOE3jcBn8taDl8PrVcgofQOpP1MgwyKvPXG8rhpLum+ghpPMx4h7LP4o4p6maI5TEYiByjK0NSUFqNUwtocYElMCWJ9QGrD3I1gPrFLG0gUKKmLmZz7UZmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CUh7iZOO0w0pXBVX7tcCqCiArRGR7RsSuUGzDASoec=;
 b=VzEq+qR1Nl8SlwbeXaaP1HEcRt0VLba/9ocAf7U7t9uXKVKyUM+SmHS4UsFtz5jDd6jhfU2JBh1sOz48BsmZmOMN6oAo6HCEZPaaf6w1EyJUxvueOhmpE0l7mVf3OEzNm7zoWijm+12CEKwEarQ3r4FV94ymeaVJW8MJiHfkEMwvBf/I+UMCbIs00Sp4yp/Ei0gOKVC8McKgNo0Gd4WSdEjJiMisQ7bMD1sBqmlPtUD/EpvAgooQ5QSUPS2p1SuhMFHwCNBSL5MwKVh42wQURXiOfAJtzUKgviP6KYfgiKWbjUPgdoed371Od58eHfhvZMTprRmfihuoTnVacXXm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 18:45:57 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:45:57 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v6 3/6] drm/xe/guc: Split engine state print between
 xe_hw_engine vs xe_guc_capture
Thread-Topic: [PATCH v6 3/6] drm/xe/guc: Split engine state print between
 xe_hw_engine vs xe_guc_capture
Thread-Index: AQHbcbOf61pJlZDasUO5hikrNhYnCrMv7S0AgAFSv4CAD7S1gA==
Date: Mon, 10 Feb 2025 18:45:57 +0000
Message-ID: <bba8c0e76c373a55bff4340b9b9469a2f29b4612.camel@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <20250128183653.4027915-4-alan.previn.teres.alexis@intel.com>
 <Z5wAagl1DmBIVRG5@intel.com>
 <15c9dfff4aaf5dece96cfb412fb933fce079628c.camel@intel.com>
In-Reply-To: <15c9dfff4aaf5dece96cfb412fb933fce079628c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB5097:EE_
x-ms-office365-filtering-correlation-id: 83bc641a-86fc-4334-e65b-08dd4a032857
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b2lRUDFoTlBWWWNhbWNJa2N2MVRGYVBKNEFMaTdDejhkWktHeHdzZEVDZWNT?=
 =?utf-8?B?a29hd0R3dGNSK1FzQ2I2eE9HcmtGVUJHSXBMYjhST0Q2cEpXMkV4WFQrM3FG?=
 =?utf-8?B?SGc2VG5RNTFLUGtFMkJzK1lZMStnd1Nya2ZWd2hCTTdLRnpGK1J1OXBQVjc0?=
 =?utf-8?B?a3lObnhDRjlFMTNGZFd6cnF2TC82TWpsTytPOHZ4RzQvVy93N3B3TEZLdmJl?=
 =?utf-8?B?bkFOaFI4b0oxVHlraVFHbW1PNXRpLzBBVXFMcVRsNlR5SHM4Rml2L1RCYVlK?=
 =?utf-8?B?S21MUEZycnAwd2xyWFZIeUdGdVk0allTM1NNVTNoOWhXcVFZclMvTVEySjJr?=
 =?utf-8?B?YmY5Y3NVRlY3b25JQklpd2NRYzVXTEk4cUt3OTlxNllGZHJ2UzkyRFE4ZzNj?=
 =?utf-8?B?SXVDOS96ZEJVaWlHcDNaRHAydlZScGFyTm53clFHaFBUOC9vR1FPV3R2OVYy?=
 =?utf-8?B?aGFSb1BwbElEQTZ3RWY1N0c2cnkvV1ZNTG9WbjN6T1c3N2FIUWRENmx0YStp?=
 =?utf-8?B?azRxd1l2djhaZXkxUHVUUTNreEI3SDFaNXk0aHd4OHFQbHVpSVYyMzRBK3RM?=
 =?utf-8?B?Y0RTVitzRHNieUZPb1k2cXYrSzNOamluTjg3QjBvRDBja1poVS9nZGlyeDlh?=
 =?utf-8?B?WmFRcW5RZVpjUEdIUEhvdWZqVUtvUzZtang4QnRqaEhYcnNyWmN1QkVSRUx3?=
 =?utf-8?B?ZUtLNFlHaHdQcFd1Wm45T2JzY1B6czZaVGxYSGtQODhodlJoM2RjWXNWMFhZ?=
 =?utf-8?B?NzBTM2libXlYME50eVkvSlJ5a01yS3pCRk1wcnNiOHdRWUJnV21FYkZZdDhs?=
 =?utf-8?B?WDV0bHFTQ0pzeXg2WTR2TTFUQjhZZFBBaEV5dVNXWWo0cVRJWG43OWpPTHZG?=
 =?utf-8?B?djN4d1lRMTh3aHBBOFlZL1VVR1ZiajFqOVpSMXM3Q2V4YUlRK3hEenF0TGZX?=
 =?utf-8?B?aTArdUl6QmFmWjdOdEZUM0R0ZEcwQ3M2bm9aV0lNWEF4SlI4bzBRd1pSeUk5?=
 =?utf-8?B?ZjZPQ0EyQzB2MjQ3QWdrLy96VTZuZHNkdUNGQVhvTjRDZzFuSmYrTWg3OTl0?=
 =?utf-8?B?Z3RZZ3hWdm1TM2xuVENORHJVckhZY0VQOTd4VmdPMzBscTkxdjRZWU9lV2RD?=
 =?utf-8?B?RkkrSXAyaERnVyt6OWk0MjJxa2trRDFzSGJBVFcvK25iRGNqOERPRTZzNzBK?=
 =?utf-8?B?WW1rNm9xTVRnYWIxSFpCOGVlS0pEbDFRYkFFRHBnUjFWMVZsU2xCMU0zM0VZ?=
 =?utf-8?B?eitBeC9CRjJ2Z0EwbWF0WlB3U2M3eXRXOVM2aFIvWGdEeHM2alhRTVA2cVhU?=
 =?utf-8?B?YVcxS1lQVWN4RU9Ic0xuMkNXSFlXdmZJNzNlWXhHeklJNHNBRzFKb3hrRFhP?=
 =?utf-8?B?VU9xWjJjUDZOb0NQdXRjdlY5cEZYNUdiTHZQLzNhUG9rS0FOY0FxL2QybUpR?=
 =?utf-8?B?amNsN0ZZU0hqZ0NPcFFGT3pJQ1hFNzNzSE1xSmpSdiszdlVsWU1MMXB1YjJE?=
 =?utf-8?B?Y3Y3cU44QUdMQ3Ivb01ZKzBvb0FJNG5oZ3duYmlwRWhVR3BPRGNhOUxCUUVF?=
 =?utf-8?B?U3EyUHQ2cWVEZ2dlRmhNQUJNQXFqMjM2R0FaTDJzNktwSTlWTjFBUlp2cDE5?=
 =?utf-8?B?Q0NoRFFrR281bHlWYlgwR2haOWhXVlVlZWZwNVpGeW9qWHQxdXgvdVc5QkRp?=
 =?utf-8?B?MUpwdTRRY3h4b01vN2xyc0FCblF0R2JTdW0rUXk2eFQ4UjAxQTJRdkpjRTY1?=
 =?utf-8?B?WmpxUmhjbllLZjUzbTcxTDFBMFJvcnV4TUFQc0QraVVucHN5UU50cUJNRElH?=
 =?utf-8?B?ZU5VNkwzQUlnSUxNNzViWnlCb1Z1WnFValU3UU1wMjNjbXJCTHpTdEhQWThw?=
 =?utf-8?B?K2kxRW5Xc0JNQ2diSUU1eEJzc3hPTm02d05UbW5wdTJMZG1CNm1uUWRrRS9l?=
 =?utf-8?Q?kGs0637bE3frYSvtVA+6ArU4QQZ8OtLQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHNKK0p5eHlPVnhHeHgzM1lzMmdPZC9RcXU5WXJVVkxXdC9RdzN1eWVnWXRP?=
 =?utf-8?B?RzVaNVdMaXo4bmQ5Rzd5Q2Q2dkFURXdHeDBVa2JrWFIwSWRFOTdqdFgvN2FU?=
 =?utf-8?B?ak1KRGI3S1RpY0wydzZmME9ZL1lmc3lDTVhITnVlbWluYThtT3lkbWdTTmN6?=
 =?utf-8?B?QVZ2RXY1dm9MSzNWcDcvK2JnWnBJZ3AyNDJ2bkRxQXdncGxESG51SXduOUJi?=
 =?utf-8?B?SU5lenFZUUJPM1dYalAzS25kMTFtS1NxdzZweHVLdHUrbEkyYW5xQ0JRZGo3?=
 =?utf-8?B?MFRMa0FaNThNUFg1Z21uYm1pTFg5bjVvb1oyV25taVhoYWhGUE03VllWeUUv?=
 =?utf-8?B?dis3YXFwZlExaW5pUkM5Q2M1d3VEcFBPWmtjeW9qVU9Hc01VV3BYY0gzOW12?=
 =?utf-8?B?UStyUDkyYkgyR21FWXFoeGl5R28xOGRWelpUbXlWK1crMzgwUHFQYzk5TlBo?=
 =?utf-8?B?TWh6RWFVLy9nY1FNYVpDTlI3aXlCYW1aeTZEeC9UWjUwaDJIUGg5RGJjdU1Y?=
 =?utf-8?B?dWdtNmMwSXNkQmZacjFwR0FIYTJKZU9taGY0NXo2dGl1UEpTc0NURUg2aGlR?=
 =?utf-8?B?bnpBeVhKZk83U2M2QzhrTk84ZzBiNEFsVmpJd0VvNlJGdmVlTDdSQTBDc0Vx?=
 =?utf-8?B?NjhEQ2JaSUpTYnB0MFBzQVNzbDZEWDJJMm5wRDhhbUtuV2tWcFF0a3RCRTBv?=
 =?utf-8?B?S1BBUXdpLzhPcDBoSUU0MEFXWTMyT2pCK2VJc0luWmlGVlZ0OHplQXZyRVht?=
 =?utf-8?B?Q0lzc083aU40dGdvZjE1TFQwRExwMVV4cGt1Rk8xT1h6ZnZtdzhUTXJIK1Z1?=
 =?utf-8?B?OWc4Z0o1MWg0eFlCTnF5L1dEbDBBWTc5V1BCN2VvTytVaVh4QXdZVTJCbjU1?=
 =?utf-8?B?ckRubFdZRW9icUdQK25wKzQ3M093NlBrWGRZL1h0Tzc1OG41bHlYc3MrNDMr?=
 =?utf-8?B?MUZvT2J0em5RbDNDTHhKcjY0UkxhU3VHY1lXdEw3ZFBxYUxBQTVUQ3lZQ0py?=
 =?utf-8?B?RzcyRDlHVURFNUJ5WDFxWm5US0pIQ0lwYjhBYUYzaHd2Z1F6bEFMOFpNekZW?=
 =?utf-8?B?S0ZRY2lCL0tzRkllOFhxUk5jVnF0NDNRb2hlMDV3MUUzL2hmQWNwYisxblNj?=
 =?utf-8?B?SHNGY2J1dS9SenViYXp1M0NqekJPT3VmeWo2TDVIeTc5djFTTi9vT1ZTMGpR?=
 =?utf-8?B?NkVHck5hVXlyTElMYjVROFpCaytFK1lYbjY5dVlIMVNqNUdlc2hZb1AwTG5k?=
 =?utf-8?B?RkpRdzBteWYyVWxoa2RnY1ZHUHkvNG11cDRuY0Q2T3hqQTJDY25oV3B6ZWd0?=
 =?utf-8?B?M2VQTGY3OHVobWNBNmtOeXBxaHhjeWhLVUQrSjZXdVFuVDlTVEVhV3lEd0Fo?=
 =?utf-8?B?L0c2VXNLMWRiNGwzQjZTaVlBZVV1dXRxc0oySEVRdmRYaDNBSWVYL2hlOTVG?=
 =?utf-8?B?SnMzajVtOVU2WW1ib0F3SXltT0J5M2RWYTVJd25UaVlQQ2VCNmhLUWhjdHo3?=
 =?utf-8?B?RnNUS1BSV1JBQmd4d3FFQ1dvMXZiZSs2cmJrc1VHbEhhcWZPQlY2S1dPaGxi?=
 =?utf-8?B?dUtzdGxFTEVzOXBldFV3N1NPV3R1SDlMT2NwbXp2WG92b3lIMTlRSUcvMUNN?=
 =?utf-8?B?bmcwd0NvaVVZeTRVckwzMjJUTklqbFZGdVhZOW9MVGFyUWd3em5EWFlDZVZz?=
 =?utf-8?B?enpMbEt5TFlSMWQ0cXJDSmJhdjZJZFM4MzArQWg0cFlmWE5TUmNnd0xVUTdv?=
 =?utf-8?B?S2R5K2M4Nyttci9PVFViZ1p6VUlqYUpITlZKY29ORmduWG0yQXJwK2w5K0Ju?=
 =?utf-8?B?REozdjkrZG9xWXpxSDFwcUttNGorYlAxU3NobXVSb2dKVy94eXRkNkM3UlRF?=
 =?utf-8?B?SkhhTklyZWt1NUtEUmdsM2tUY1pxdXhaR3FiVGNqbDJLamsrVTc5ZS9tSk8r?=
 =?utf-8?B?ZFNSYVJiZGxOUnRFSXVvbGtnVi9hWXBtSzlEcTJ2cFZpQml1RkNZNzVJVDVk?=
 =?utf-8?B?ZEFxU2F6RkNrc1p3b1VrdDc4YitJelJnZmFlQnhmVmRtNEo1aERaa0U1N1B2?=
 =?utf-8?B?bzFWYitzQTRkTUFjSDdsdFBDc0t1THJXMnluY3IraUcxbjVpazY1Z1ZUNzZx?=
 =?utf-8?B?a1pZZmo5YWxHcjh2L1luM1hyUnpidjQ3M2orcnNBeitVTklGdzhERHFkWEJK?=
 =?utf-8?Q?Wdn7e90nGIgCdZiDO4Cfih0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <917506392DC8C6428CB66EB9FED15CA9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bc641a-86fc-4334-e65b-08dd4a032857
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 18:45:57.8395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cnPPAXSDmq2XEbjgYruXJ0aPC/277ztUl9COg26ELZZiO15aeTzzqyeCGtrsUx6XM3x9GjfBjjQbsUCcRsFrofHVjMGmYbCkWCFDVJ9E/51ufnkmKJ83iaA4NxEpFJ/9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
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

T24gRnJpLCAyMDI1LTAxLTMxIGF0IDEwOjU1IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOgo+IE9uIFRodSwgMjAyNS0wMS0zMCBhdCAxNzo0MiAtMDUwMCwgVml2aSwgUm9k
cmlnbyB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDI4LCAyMDI1IGF0IDEwOjM2OjQ5QU0gLTA4MDAs
IEFsYW4gUHJldmluIHdyb3RlOgo+ID4gCj4gPiA+IAphbGFuOnNuaXAKPiA+ID4gLcKgwqDCoMKg
wqDCoMKgaWYgKCFzbmFwc2hvdC0+bWF0Y2hlZF9ub2RlKQo+ID4gPiArwqDCoMKgwqDCoMKgwqBn
dCA9IGd1Y190b19ndChndWMpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIW5vZGUpIHsKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X3dhcm4oZ3QsICJHdUMgQ2Fw
dHVyZSBwcmludGluZyB3aXRob3V0IG5vZGUhXG4iKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gK8KgwqDC
oMKgwqDCoMKgaWYgKCFwKSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9ndF93YXJuKGd0LCAiR3VDIENhcHR1cmUgcHJpbnRpbmcgd2l0aG91dCBwcmludGVyIVxuIik7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoH0KPiA+ID4gwqAKPiA+ID4gLcKgwqDCoMKgwqDCoMKgeGVfZ3RfYXNzZXJ0KGd0
LCBzbmFwc2hvdC0+aHdlKTsKPiA+ID4gLQo+ID4gPiAtwqDCoMKgwqDCoMKgwqBjYXB0dXJlX2Ns
YXNzID0geGVfZW5naW5lX2NsYXNzX3RvX2d1Y19jYXB0dXJlX2NsYXNzKHNuYXBzaG90LT5od2Ut
PmNsYXNzKTsKPiA+ID4gLQo+ID4gPiAtwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKHAsICIlcyAo
cGh5c2ljYWwpLCBsb2dpY2FsIGluc3RhbmNlPSVkXG4iLAo+ID4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzbmFwc2hvdC0+bmFtZSA/IHNuYXBzaG90LT5uYW1lIDogIiIs
Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNuYXBzaG90LT5sb2dp
Y2FsX2luc3RhbmNlKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYocCwgIlx0Q2Fw
dHVyZV9zb3VyY2U6ICVzXG4iLAo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzbmFwc2hvdC0+bWF0Y2hlZF9ub2RlLT5zb3VyY2UgPT0gWEVfRU5HSU5FX0NBUFRVUkVf
U09VUkNFX0dVQyA/Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5v
ZGUtPnNvdXJjZSA9PSBYRV9FTkdJTkVfQ0FQVFVSRV9TT1VSQ0VfR1VDID8KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJHdUMiIDogIk1hbnVhbCIpOwo+ID4gCj4g
PiBUaGlzIGxvb2tzIGxpa2UgaXQgaXMgY2hhbmdpbmcgdGhlIG9yZGVyIG9mIHRoZSBwcmludHMu
IFNvLCBwbGVhc2UgZW5zdXJlIHRoYXQgdGhpcwo+ID4gaXMgbm90IGJyZWFraW5nIHRoZSBkZWNv
ZGUgdXNlciBzcGFjZSB0b29scy4KPiBhbGFuOiBnb29kIGNhdGNoIFJvZHJpZ28sIGxldCBtZSBk
b3VibGUgY2hlY2sgdGhpcyBhZ2FpbnN0IHRoZSBtZXNhIHRvb2wuIEFsdGhvdWdoIEkgYW0gd29u
ZGVyaW5nCj4gd2h5IHRoZSBNRVNBIHRvb2wgd291bGQgaGF2ZSBldmVyIGV4cGVjdGVkIG5vbi1l
bmdpbmUtc3BlY2lmaWMgcmVnaXN0ZXJzIChmb3JjZXdha2UpIHRvIGJlIHNsb3R0ZWQKPiBhZnRl
ciBhIGNvdXBsZSBvZiBHdUNGVyBzcGVjaWZpYyB0YWdzIChsaWtlICJDYXB0dXJlIHNvdXJjZSIg
YW5kICJDb3ZlcmFnZSIpIGZvbGxvd2VkIGJ5Cj4gZW5naW5lLXJlZ2lzdGVyIGR1bXBzLiBJIHN1
c3BlY3QgdGhlIGxvY2F0aW9uIG9mIHRoZSBHdUMtdGFncyBjb3VsZCBtb3ZlIGFyb3VuZC4KPiBX
aWxsIGRvdWJsZSBjaGVjayB3aXRoIHRoZW0uCgpqdXN0IGEgcXVpY2sgdXBkYXRlIC0gZmluYWxs
eSB3aXRoIEpvc2UncyArIEpvaG4ncyBoZWxwLCBtYW5hZ2UgdG8gZ2V0IHRoZQptZXNhIGF1Ymlu
YXRvciB0b29sIGJ1aWx0IGFuZCBKb3NlIGNvbmZpcm1lZCB0aGF0IHRoZSBtaW5vciBjaGFuZ2Ug
YWJvdmUgd2FzCmRpZG4ndCBicmVhayB0aGUgZGVjb2RpbmcuIEpvc2UgZGlkIHBvaW50IG91dCB3
ZSBoYWQgYW4gZXh0cmEgbmV3bGluZQpzbyBJJ2xsIGhhdmUgdG8gZml4IHRoYXQuIEFib3ZlIGh1
bmsgZG9lc24ndCBzaG93IGl0LCBidXQgSSB0aGluayB0aGUgbmV3CmxpbmUgaXMgb24gY2FsbGVy
IG9mIHRoaXMgZnVuY3Rpb24uIFdpbGwgZml4IHRoaXMgYWxvbmcgd2l0aCBldmVyeXRoaW5nIGVs
c2UKYW5kIHB1c2ggYSBuZXcgcmV2IHNob3J0bHkuCgo=
