Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E002A9FF474
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2025 16:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC9F10E2D7;
	Wed,  1 Jan 2025 15:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VM5D/lCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910E310E2D5;
 Wed,  1 Jan 2025 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735746884; x=1767282884;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PUfmQBb8d7RzDcByHHO7c9oiaW8y2QU8GcAjjYC42c4=;
 b=VM5D/lCdRDkyct1hbYcxgMWsolWRrdft3YzYEfqi6aaJYBZ4pCORCdQi
 AUeiZbNUh4hzli9aM2Yo8a+JuH/ps1Q9G12vhp0SSTcpGAjdtgfzwiEyQ
 q2/E4LOP5VxgHcq0mv1jmlNokcQ9ABY7ZDeKlUTeZ9V06XAza+9vGRyuh
 vVmnK8Lt9/AVyv7zaCo1WsR0uRh2JbNbwvW8orbVKxFtQyxNjy67L+DHt
 i5gw2jNRyzT/KtisbOm3b19niAz+GRhtUCStfKPZ4J5ExqXTmETDsrjGM
 GJlwbL1PXEVYp+HfAZcfAblNJWtWTma+gu8zNqIO000VB/1WQ9PcRrWYp g==;
X-CSE-ConnectionGUID: 2xAAx4d8T3Gr8sbH+7+4DQ==
X-CSE-MsgGUID: hXhShgFmSXe8V6N8UhtAFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47356736"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; d="scan'208";a="47356736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 07:54:44 -0800
X-CSE-ConnectionGUID: B45wwi08S96thJt9tO7HRg==
X-CSE-MsgGUID: dzVv0nLLSiWa3BNKYcsLwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101131440"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jan 2025 07:54:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 1 Jan 2025 07:54:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 1 Jan 2025 07:54:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 1 Jan 2025 07:54:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYGuXpRy6d6KIh/Yrq7PJJoHGV3tSFmTKIayk445JfB8pJljuvQcAq0Z+qwaFR38jgxYG/6EpNsAEGE9iwwQncC7wC6oEN8jhOQA4PpWaVoNeXh5k/bFrflvLzgjN8o+20TC0vU0Hha09GGmUsiAPJk9jPcFMAp9cND0Nhl2S1SWKlJdUbV/QxbYUOlPE+aDyFYyN9zlCYixsTKd67ch8dNp3vEoFe6QR+EXAHgzWqrZmY6AAKpolkiMKPJ3+AXBx06xsk7huMwUqyZlQN+23pploC3u+n2lqiFQhjZ2jLY+w4PrPk1bnp7HJZG/LHP0Hy0YWtubcWpJZ0+vagqmag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUfmQBb8d7RzDcByHHO7c9oiaW8y2QU8GcAjjYC42c4=;
 b=OBYtRopqjym5hC9oazrztlWncvFlGCCnZujxxyJHuabUNtjj3D3TO1u/lCH/NHjTVxvC+0NlKCvgiXinSUdploTvDKfSnCVaTwMpj8FOG7KhSJfDCIBIEjPQuEkkg6Z0KbRgtIglohlm7htBzTs5UGDETbwezyyOdK8gs3+MfJ/sZZI8V99Zo5YUKkhizZeY/BgAJoxYbNQcAximmW9jbMf7B/b2WSvpKhVYJe/xiMygsrrpxjngmNnFFFT/JbUniqhMZqH/VBp3DiPBRKM4IZZiAVNVsMfBR4nRFqKOwyEo9A7DLHVMt9Y1D5KGC5FQSOYJrbm7tlpophuXEJD3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Wed, 1 Jan
 2025 15:54:10 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8314.012; Wed, 1 Jan 2025
 15:54:10 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
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
Subject: RE: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
Thread-Index: AQHbOo1AUWIZth7q1kuLhA0cCsqn17LrNrOAgABrRYCAACSGoIAAjmVQgAgV2q+ACSSYkIABKGfngAOdGdA=
Date: Wed, 1 Jan 2025 15:54:10 +0000
Message-ID: <CY5PR11MB6366301B162CC29D9B395989ED0B2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-7-alexander.usyskin@intel.com>
 <Z2H_7Xry3R2fWpMZ@intel.com>	<24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
 <CY5PR11MB63663382E44A258B0BAEF1BAED052@CY5PR11MB6366.namprd11.prod.outlook.com>
 <CY5PR11MB6366CBE2D1AA392AD3F745F7ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87cyhiqk7a.fsf@bootlin.com>
 <CY5PR11MB63663D73FA8ED331F8229AA1ED082@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87o70ta7jo.fsf@bootlin.com>
In-Reply-To: <87o70ta7jo.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA1PR11MB6735:EE_
x-ms-office365-filtering-correlation-id: a2eb63c8-2934-4268-8e5f-08dd2a7c8801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aEIwQUZzRElEK1M2dXBCNlJSVEs3OHRKMEdKVzZHWGtoUFRibjRmR01qbWJq?=
 =?utf-8?B?UGtsc2FZenYza1QxTC83ekw1QWNGTis0dUdzMnBuWG5nZU1Jb2xnelkzRWxj?=
 =?utf-8?B?MEh4OWY1cnRUTWxEVDhYRXNLZUxqZ08xeHFYTnQydlVrTGEzNTAxaXhEbTdW?=
 =?utf-8?B?a3lUYlpOenJyMWkzKzdBai9mclg5VDN1aTdCVFJESVMzSHA3dnFuZ0xkQmtK?=
 =?utf-8?B?WWRsZllXaFJ2MmFhSzdmelFvVTI4TGM1MzRBeHVDUmNVQ1FyTUJEbW1BS05S?=
 =?utf-8?B?Uy8yR1Q5cFlXOVQ5Z2xPcUNQSmk4Y0c3ZFhTaXFkSUJ6NEVnYmtLbW16NmlN?=
 =?utf-8?B?ZElBWVRuK2t3OHlWR3E3bCtUeFYrMVdMR2lvMXIvZGVLdFBSQzVsZ2lIY3hI?=
 =?utf-8?B?c21vdlJoQnNNbTY5cWlrK29QRHhHL0U2M0NPWkNSMzJXZ3BQSlMvQ2V4RjV3?=
 =?utf-8?B?bHdJc1ZyVVZKRzNaR1U1TjZEc2VvdEp6UVlkMURsNUMrNWM5UVVBTklFeXJB?=
 =?utf-8?B?K3IvdEt3Y2E2bm5WeGRCN1h0bFRQemJNNHJyKzVKaEQ3WnFGcllyL1JDMnJQ?=
 =?utf-8?B?RUMybklENVg3amxuMmZLYVpkTldPY2F6SFpmYkdWS2JmYXlkZC9oaXNtOTNO?=
 =?utf-8?B?RGYwU0RWOHRsaXdrS3hhUlZGOEt6QUtVcFZkaXExQWxSMHI3NUI3eUFTcHd0?=
 =?utf-8?B?eUFPZEs5WjEzUHJVWFlyQmk5NVBEU056ejJzWWx5NnBDNmkzNWJHb3pNcHdR?=
 =?utf-8?B?bXRqWWFEaUtKbm0yM0l1c3ZtY0gzdFFoRjR3RDVOd2pKRGVsU1hPQnRQNkxz?=
 =?utf-8?B?enJtTHVUS2FpZnFZQk5qbWxCYlNiZHlORnBKSGZDVlJmZCtCK0piY3dZUEFa?=
 =?utf-8?B?c2hLeEEwOTlJQ2YrVkZ6YTVUajVNNm5Pd2pMSExJSUFLb1QzdkRDR0Y0a2h1?=
 =?utf-8?B?elJOVi82ekFzZ3FzRFcvUDVRNGEvbW9FQk1UQmtzY1NBTG1xelo1T0NlUEM4?=
 =?utf-8?B?WVNzTnR6NjVoNmpQdVJhNFUvV1VBTVM3WnpQTXE2Nlc1RUFheFUzK1BRclZl?=
 =?utf-8?B?dkNNMWRiT0lpMC95TDlvbmtKNE15NFlXT2diN2VicjZidXlRK3FDeFRWTFJv?=
 =?utf-8?B?dThLRndjdkZoM1RPWTJsQTltQ0pGRHh4WTFYNnpWSFVkdSt4WG1aUXR0UVF6?=
 =?utf-8?B?NzczelFWWDRkRHhyVDFFdlJNcDFMSE41dkoweTFnKzFTSUlqNnpYUW9nM0Zo?=
 =?utf-8?B?NVZMenhJTVc4YWtmUEF5WWgzR3Fic3h4c3pFbEUrYUtqMFJnZHdZVFZOUGkz?=
 =?utf-8?B?M1lySk5vVW9mNkFvai9MS2VQdXZsN09FcG9QMHJ3dFdFYS9JckloWEJaNm94?=
 =?utf-8?B?L09iVmN0eU4rcDdlNHpvS3g2SEZrdXlmei9xbmZjZVhmNjluTzArY0hyN0Nq?=
 =?utf-8?B?SmlCNnFmeEl5TkdmTDdZVWxQTUZSQWhKSkJKc285QjdJSndPK0R6b0I0TjBh?=
 =?utf-8?B?SkJuc0lYdFdxMXhTSG1hQlhpWi9INTVVa2J2Q0xxNlo3RlBaQmFnWjhTbllr?=
 =?utf-8?B?OVkrOG5KS1kzTFcweFNhTzloNVJkbStFR1BySkJSUitxdWU5dkd1ZzBNVTky?=
 =?utf-8?B?QVRhTzRJcHAvVVZ1dzRZandhY2xBWVA1V2hzV0h4a3g1a1hpYlNVYysvWmNx?=
 =?utf-8?B?WkErb0lxRzlSNmRlSlk4cTFNNENmbGUwenJnTlFPcjlTUU95R1hoTjRzdnho?=
 =?utf-8?B?ay9YL05VWE1pcklGMEtLeU9CVFJmRXcxdDdIbGZsdEU3V0FEcTFNUVRqbVRO?=
 =?utf-8?B?YmRxZmZEUlRpZmpRRFhETDNPRUpiWFZOY3dHS0xNcEVQTnNHODF0eEpaVTh4?=
 =?utf-8?B?RGVmMjRiZmh5TEJaZ2ZTODdyZldldDVySGM3eW82WlZ6dkhQTGN1b1RBUEtt?=
 =?utf-8?Q?UzcWu/xviF3v16qBNQZU/uLdkttM9CDc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnBWeFExeVVrYjlnUmtLUTA5T0JqdHF2eGNEMTdiUVNON0o5ZnRQNEJVQmJ5?=
 =?utf-8?B?OHBmNHVjMURwWnBNb3pqN1dzeGQ0dm5QcTBHa3F2Tm9xRjFhU3F1cjBqd1hs?=
 =?utf-8?B?QVJpOUZOVy9HZDlrSVdDbUJQZjc0aCtncHZ6UmU3SXMxWCtLMlpxUVNaN3pp?=
 =?utf-8?B?Q0J2dncyL1N4S0htbndXUmpJZkJTMmcxcXI4eE9DblVsaDdIaitFcm9tbDAw?=
 =?utf-8?B?VEMyeHVpOHdocnZxS3BEWTBhaDY5TGJmSXZiNzh3S0dRU293T1dYOCtyelJP?=
 =?utf-8?B?TG4xVUZnQ01yNzdZWFBkT2hqeUNqYUxDRVJMbmFHOUxPSkVsTDJDSExLaGxM?=
 =?utf-8?B?K3hZeFdwTUt5UDd3M0dVdmpHQ1Bzc3loanB6UCs5SHhwa2p4TlA3Qi9SOUZX?=
 =?utf-8?B?VXhGMGlPSHRjUHQ2eFBsQm4rSVhtMldMZkxsWlhvdVJZTVdod3FkUmZsdVRV?=
 =?utf-8?B?NU8yZEkxaWNiTmd2ZVFaOWswbFJsYzA2OFRwcnovc0JTc1R5MUZFWmkzMStw?=
 =?utf-8?B?bGZSaytHYU83UVFrZW16cEpWNnZSV3R5V2lDZlJoSWVwdWpWY2d6OGptc2dB?=
 =?utf-8?B?bnk1YWs2MVhnSEZEaDNrbGduSkhBeXR1S3lxVXFVU3o3TDhWK2ZBdDlMZEhH?=
 =?utf-8?B?dmlPSEVtMWxqNjIwWjBLMkE5dFIvV0w2TEVSRm9aWm1RTUhwRWgveXUzNHhG?=
 =?utf-8?B?c2JoTkc5dGFMdDdLQklFTXBmaVdIN1VmdkR1RWRTcUw0ZElyTmszblFvTU1l?=
 =?utf-8?B?R2hoSzAyOHlVVm1JVEFyWDludmZESHR6MVF1S09wQXAzck9jTDIzSkFXYTJY?=
 =?utf-8?B?UG1lNUZkdFBXVlRuSis1ZUVUTGY2UGVPcEpPekxIaHdtQzlLSmRXSlJ3V2hR?=
 =?utf-8?B?THBmeDdMOXRxTjJGaDhVTnI1VEVZREZBS2d4YlBvcjNEU3I3THhJZ0V5ZkN2?=
 =?utf-8?B?ZHZLcXN1L01lNkZmSjU0UmFXV1QwdHBhT0VpV01icTk1eDI1N2JXakZMOVI5?=
 =?utf-8?B?SlZ1aGw3VHdoUUdzS08zcmxqa1MxRytDbGljbndYYlQvQWFWV1AvQkhXYTBF?=
 =?utf-8?B?VWE3aDR6dnIvRnMzQXpzQ243bllEM2pjZHhnVFRzbUZhZXFKY1ZCMzUwWFQ2?=
 =?utf-8?B?Rkl1SlpZMmdORjkwU0UwSkUxQkJxR2VNZTJDYTE1MVB2aC9QamxmOW5aR3hm?=
 =?utf-8?B?M1BMaXZOaFU2bmJ5SjVtTjR1czZveUVkQzBRQnZIZkZqWVZlMmtNMWdLaUs3?=
 =?utf-8?B?L1dKcmZFVldSN3BPdHdxa0RWOWFINnMxYlgvZk42M3o5M0prOHhRMGxEcmhy?=
 =?utf-8?B?K2hIY0dHTzZHV0NEbHpaekJTZ0dCbzVRZmo4T2pCN2Q5ZWsrT1orRldwUmZL?=
 =?utf-8?B?TElrWEFMK0dGMDRPWjJjMElCeDQxWXhEQ3IxU3A2SkZHOUc5VVlYaG1lWjNa?=
 =?utf-8?B?bzh0K3dsQzFYZUV4bFh3UGl4d2F1eExOWnF3U0dSbmptYWN4dlBDaTduYXoy?=
 =?utf-8?B?bDJpang4VitsS0NyUDJkUElscXhHNEFjTW8zQWZuU0hubkJoa092S1JVV0JG?=
 =?utf-8?B?bWlCSDJ4UTFMRk1RalJYOHRBYjlTWXcrUitUK0VVdUhWZEQ2ZnRpR1AzbU9W?=
 =?utf-8?B?Z2pIOXZpT3JsZVplVjNXcDFDMjRabFp3OHFDWURyNExlZmFqTS9PUnNPTHMx?=
 =?utf-8?B?bHJETFFNQ3Q3WnZHV0YxejZuRVhaVEJFQ0RZeHVxRXJEUjZ2Zm9kK29aZEFI?=
 =?utf-8?B?MWJ2WWtoZG5lbk9KbGRQTURyRjUyU08vSzZPbmtUbDdvNUg3Ym84VE5iUThS?=
 =?utf-8?B?M055bTc4bUc1RVJCejh2eGdKL01wcFo2ME9tV0N5SFhzUGs3MDVZQlB1ajQz?=
 =?utf-8?B?djh5M3poSFNVTEduVFFNN1BRTTJkREhSTE4zazAxRjlDejFWMHlEckpSZVI0?=
 =?utf-8?B?ajZ1SThmWFZoR2drbVF1VDFyY2pwMGltMndDT0lNZnFjTkNMNE52Y2ZrWDl1?=
 =?utf-8?B?bkExTVc3WkZXTlNSdW9lUDRHSEZucmF6RndOdlMybGU4emQ3akgvTlY3S0l2?=
 =?utf-8?B?Zjc5N2JUOG5RT0xKaFRlK0hEQ2MwaFhjRTVwSm15eElxbzdnQkpsbnZLcGIr?=
 =?utf-8?Q?VZRs/yfvHhV1Htjnet9Se1/pi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2eb63c8-2934-4268-8e5f-08dd2a7c8801
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2025 15:54:10.2430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KI4nMyTcqLKvJ4gYZQLPWsrtGGlvlk5xQ3cKJ1b0VVI2HYuTb00LDtidyk+mOpdr9nNUz6Ggjilv3QhTRA8K3qrlX/CrOrJWZzK4aLxcVYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

PiA+Pg0KPiA+PiA+PiBJZiBzbywgSSBoYXZlIHRvIGFkZCBwYXRjaCBmb3IgbXRkIHN1YnN5c3Rl
bSB0byBhbHdheXMgaGF2ZSBkZXZpY2UgZm9yDQo+ID4+IG1hc3Rlcg0KPiA+PiA+PiBpbml0aWFs
aXplZCByZWdhcmRsZXNzIG9mIGtlcm5lbCBmbGFnLg0KPiA+PiA+PiBPbmx5IHRvIGluaXRpYWxp
emUgc3RydWN0IGRldmljZSwgbm90IHRvIGNyZWF0ZSBmdWxsIG10ZCBub2RlLg0KPiA+PiA+Pg0K
PiA+PiA+PiBNaXF1ZWwgLSBhcmUgeW91IGFncmVlIHRvIHRoaXM/DQo+ID4+DQo+ID4+IENvbmNl
cHR1YWxseSB5ZXMsIGJ1dCBwbGVhc2UgbWluZCBvbmUgdGhpbmc6IHdlIGRvIG5vdCBicmVhaw0K
PiA+PiB1c2Vyc3BhY2UuIFNvIGlmIHlvdSB3YW50IHRvIGtlZXAgdGhlIG1hc3RlciBtdGQgZGV2
aWNlLCBmaW5lLCBidXQgeW91DQo+ID4+IG5lZWQgdG8gZG8gaXQgaW4gYSBjb25zaXN0ZW50IHdh
eSBzbyB0aGF0IHBlb3BsZSBub3QgZW5hYmxpbmcgdGhlIGtlcm5lbA0KPiA+PiBmbGFnIHdvbid0
IGdldCBhIG5ldyBkZXZpY2UgaW4gdGhlaXIgcm9vdGZzLCBzaGlmdGluZyBhbGwgaW5kZXhlcw0K
PiA+PiB1cHdhcmRzLg0KPiA+Pg0KPiA+PiBUaGF0IGJlaW5nIHNhaWQsIHlvdSBhcmUgcHJvYmFi
bHkgZ29pbmcgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiBieSBkb2luZw0KPiA+PiB0aGF0Lg0KPiA+
Pg0KPiA+PiBUaGFua3MsDQo+ID4+IE1pcXXDqGwNCj4gPg0KPiA+IEkndmUgbG9va2VkIGludG8g
dGhpcyBlbmRlYXZvdXIgYW5kIHNlZW1lZCB0aGF0IHRoZXJlIGEgbmVlZCBmb3Igc3BlY2lhbA0K
PiA+IGRldmljZSBjbGFzcyBhbmQgY2FyZWZ1bCBhdHRlbnRpb24gaW4gcmVsZWFzZSBmbG93IHRv
IHVzZSByaWdodCBjbGFzcy4NCj4gPiBJdCB3aWxsIHRha2UgdGltZSB0byBkbyByaWdodC4NCj4g
PiBNaXF1ZWwsIFJvZHJpZ28sIEthcnRoaWssIEx1Y2FzIC0gbWF5IHRoZSBERyBOVk0gY29kZSBi
ZSBtZXJnZWQgaW4gdGhlDQo+IGN1cnJlbnQNCj4gPiBmb3JtIGFuZCB0aGlzIGRldmljZSBiZSBh
ZGRlZCBsYXRlcj8NCj4gDQo+IEluIGdlbmVyYWwsIHllcy4gQnV0IG1heWJlIHlvdSB3YW50IHRv
IHNlbGVjdA0KPiBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiAoSUlVQyB5b3VyIHByb2Js
ZW0pLg0KPiANCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQoNCk91ciB0YXJnZXQgaXMgdXN1YWwgZGlz
dHJpYnV0aW9uIGtlcm5lbCwgYW5kIGl0IG5ldmVyIGVuYWJsZXMgQ09ORklHX01URF9QQVJUSVRJ
T05FRF9NQVNURVIuDQpBbnl3YXksIEkndmUgcHJlcGFyZWQgcGF0Y2ggdGhhdCBjcmVhdGVzIG1h
c3RlciBkZXZpY2UgYWx3YXlzIGFuZCBwdXNoZWQNCmEgbmV3IHNlcmllcyByZXZpc2lvbi4NCk1p
cXVlbCwgaWYgeW91IHByZWZlciB0byByZXZpZXcgYW5kIHB1c2ggdGhlIG1hc3RlciBkZXZpY2Ug
cGF0Y2ggYmVmb3JlDQp0aGUgd2hvbGUgc2VyaWVzLCBJIGNhbiBzcGxpdCBpdCBvdXQuDQoNCi0g
LSANClRoYW5rcywNClNhc2hhDQoNCg0K
