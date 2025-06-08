Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC613AD114F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 09:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192BE10E05E;
	Sun,  8 Jun 2025 07:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ktd412Wf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E54A10E03C;
 Sun,  8 Jun 2025 07:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749366016; x=1780902016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dqmc05PGJVnfF18/A+KT0QxopGCiH+XcsSh8ajRtEj0=;
 b=Ktd412Wf232dMU4wG8N7K7qiH+m7tMyyJnnjgAC5iEXT1Ymjvo5/RLrJ
 6Q5ZY2tuvv5xe+g5x39OJ1zlzMUr/gDV9IslhEfP4z/w6Ha+c8MSgjJIe
 UOh0tgxMT7BfOr3rSZdoA2A8F2rtu/2pgFM5rk8w6hxoBZyz47VuEH1me
 MgkMLTkIU4KC2FAx/x0RVywIToNJd/Ldv/GDRXhYBKU9hp8kjG2c6V1YA
 n7avn7EH3NHqLxbdfFQ31yeJfEJgErxQF+QuSIehQRA/vE1/MAqfIVoaC
 JG9rnh2waYGrZV0sUTANzQnnI5PJnOAWsTELQd9/2sNrPY/Ry2lzyvEoU Q==;
X-CSE-ConnectionGUID: oEoM7gHkTNiaqyzMiJ1i7Q==
X-CSE-MsgGUID: VqDrQR/wSNmGWdy/5K5B2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51173347"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; d="scan'208";a="51173347"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 00:00:14 -0700
X-CSE-ConnectionGUID: LznLH+VvSuuHb28mimmklQ==
X-CSE-MsgGUID: va5Zdm75SGW6NMLKTlccPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; d="scan'208";a="169391009"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 00:00:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 8 Jun 2025 00:00:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 8 Jun 2025 00:00:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.60) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Sun, 8 Jun 2025 00:00:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lx2PIOFcqPXNaj8rrggYDH6xxFTKwls/HIuo9WpJCvFSmhuaeQ3jjZv4f6J15X/+CVG4I5I1/RpjDbe2wil5s28TnJSiebTE2yZR01gJuHgDUOkqBQNFkcXO5YmR9FMwUcuFKzcBOfIHbWfiH47h4+0a16S76afOzT+D55GnNt/Ra0Dq1PKxEXAK3MzlwM2UsUDr+EhJy22742EiJnF8cBThvs9iBll0CTz0PCb3t/HfECGrpMSj8Tvl2GE4D4Kb7qNPcPIU8cKtP9XFqwvWfkKDy8xyhOQp1dek3tpttRtC+IocYn3bnH6Bwv9e1erkxyiwYaRkR4ALPddhwSrkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqmc05PGJVnfF18/A+KT0QxopGCiH+XcsSh8ajRtEj0=;
 b=IiV4aCJSEvV93XF6LnG98+zUuspQIGwLxuybm0FIjHb/dyCarN4yNI2wRJ3qwcZ5+217pQ6wChJLJLgy4ugCL13qNA7cLCrn74m0aa05opM6ihN0jjN0my5aiqNN4Q7oHiE+ljs9GuiVJPxw1bStVGOpGrb0191/yGdA7ze5eZV7ka4MoNZj+TI8w8QXQztg3U77dl91rTYikdjEU4LkIx0kN2Xtm3voZVbV72jqDNdz9+poAdcYk96OM043GZlXJv6ROfORm1Gm2Zr22skuPoBboGRxVxzTYQ/vjT+UAj/ZgXPEmw0s1TTWGNv6YAHgXIBSyhms37vvUbWDfTqmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Sun, 8 Jun
 2025 07:00:11 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8813.020; Sun, 8 Jun 2025
 07:00:10 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v6 01/11] mtd: core: always create master device
Thread-Index: AQHbi35N9ptLZMK+/0+KHmcJoUKk0bP5FNKAgABXSdA=
Date: Sun, 8 Jun 2025 07:00:10 +0000
Message-ID: <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
 <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
In-Reply-To: <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MW6PR11MB8392:EE_
x-ms-office365-filtering-correlation-id: 311aac21-f871-4ad6-814f-08dda65a1c57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bGRRNWNacmswZ09rVVFqdStYQ2lsRUxJQy9KRW1WSTl2M2pla2ZJK1hGNU1B?=
 =?utf-8?B?bEZWdXN1UDNnck51VzdzWXpoazU1NnMrbEZqR3c4NnJrcXFKTkNzRDBpYUV2?=
 =?utf-8?B?RkszNU9SYy95cWtuRVk2WXFTSndFNWtQcktPSWRZeUNISFdVZWFGMVd4VGNv?=
 =?utf-8?B?WEQzRHV1THVjZld4U1VlaXh3WGJMYUkxNk5CbWVUTi94SlRrbUZDd3pNUE4y?=
 =?utf-8?B?V0FUd3Q0bmd0REN4NFpEbDhWV1JIMkQ3bEFPUi9tZGoyVEZSdnZkc2MwM2Zw?=
 =?utf-8?B?TERPam5sUTA5N3lpdEZ6TUpEOW9mWm45OUtMZ3FLNnlRTWFla3FCMXprWGg2?=
 =?utf-8?B?Wk8vbEtKNUcyTzZaWHlzcUZhK0FUQjJibEJsUm1VVFUwR1E0Qjk1RE91bnJw?=
 =?utf-8?B?emhzaEVGNFNTSGZWVUF4N2RDS0NMNVpkbjR5YmFLaEkyQklBQ2NEcGJNZ1Bj?=
 =?utf-8?B?U0ZkZWlubStZSnEzVlZ0Q1JQdHBYMHB6bzBVdC9nNHZHZTA3N21XekpIZE1o?=
 =?utf-8?B?WUtOQWpTRXRNZmE0ZHh0QjNndVM0aThhb3c0enJONjBwcnJKQmNGdHdKc2Ez?=
 =?utf-8?B?TGR0NklINnhLL2hJSi9DbWpwQ3pzVG9IZVpXKzdWK2pTKy9wYmYwUFBiZEtx?=
 =?utf-8?B?ZDdlVTBoMkRRblFjTksrQUcwd01QZnU0Y2lEZ1QxakNNV3FlR0xQem1EaXdY?=
 =?utf-8?B?K0xlTHJrRVRyODU1dlJha0tMZFBvbmswalRMRUR4dDdZaGZYQkQwMGxYeG5I?=
 =?utf-8?B?Q1BvRTdhQWNnRk8yQmNIZEZpalBUWUJuQ1pIMGw1djg5SytEK000NFZ5NmVM?=
 =?utf-8?B?UENLRkhLcHo4dHM4QnRJN3hEbDFjV1VHWWFLK1pRS0pFUER6K1R1RXA4M2Qw?=
 =?utf-8?B?eVVoUjVHRDZZcjZ4SHBrd2hsR05VT2RkTVNRTVR2VklKSzk2d3pIR1VuVUR3?=
 =?utf-8?B?WlpFempXVlhvOHhzS1B4OTJ4bEZ4Wm95dWNJN2hjQjhuQ0ZEK3duUHJLdkwr?=
 =?utf-8?B?eEpsU3VtSHZwNnZqYkdJUFo2SXprNnRaWkFlWFFaeUEwTmxRQWhrOUJreEx4?=
 =?utf-8?B?MGhPT1NSTDM2VzFhQWZQODZrRDQ4WWhqdWVLdjBSTm9hV0g1a3BhNjUxZE5N?=
 =?utf-8?B?UmV5b0YvNDVIbWVIbm9wYThpS1lYb2NSL0ZvSnhlMm9iNFdDV0NPWUxSdFZR?=
 =?utf-8?B?dU12bEVCQ1QzaEJhUEFaTVl6T2NaeGZtMUpDVlNyelNSM1A0eGhXcXI0dWs5?=
 =?utf-8?B?S1FSdlN1bjRGS0p1dFIwWStEaUo3RHI4THMrQnU3ci9uenVtSEtzMWJUeVlm?=
 =?utf-8?B?bTA3aHBrS0VoVW5OY203VlBxbVY5ZVpsZ2ZPTm9QY3BsV3FmQTZ0SGxkUXp2?=
 =?utf-8?B?VzJSS2JrUWhwbVB0WXFoRHdHWEJkNmxRUTFLYU1FaWg2bisvYjhDNzlYbFli?=
 =?utf-8?B?MGdmcXZ4RkZkKzU0QlJDUWlySDlwTjNKaTY5eHo0ZUFUbkRaMjNmZTIwZWdo?=
 =?utf-8?B?RjVOTzhiZWxqR0Z3cWp2N0JnNUF0TW5xeDVVUCsrRGdEMks2d05nc2J4M01t?=
 =?utf-8?B?Z0F4a25NcFc5RmdpTTFVQXRJblVyKzVvM1BxTEt3ckhJaThOZGx2aHp6YkNJ?=
 =?utf-8?B?RnEzZUd6Y2U2UnR3NTBoYWMyWjduazFFNEhZajBMc3FqbVRlQUEwd25EdG03?=
 =?utf-8?B?QU9Zc2JRemsxbG9QTC9uVXI4ejIwcklOcUpMOTdNVm5wYkFKbzkwT2lhK0dp?=
 =?utf-8?B?Y3ovR2RIeXZoTVlWUXcwU3haVlltTGdETFlaZE9vcGtPZXNrd3VlWHZqZnMv?=
 =?utf-8?B?dFVIV3kvMzNvREl4Myt0azBNMU9SVGZteVV5SHBTTFNGUXF0dUwrZHJFVUZ0?=
 =?utf-8?B?K1NGMExGSVZKYk95dW5panB1L2IzUHBaVHZkbG1yK0JvdlZrMnU5UTU2YXIr?=
 =?utf-8?B?ek8razNBZFl0OXd6OEI0STNGZjNmTGJaRlVGNlhZWER1dzgrSkJ2eTZsdUlP?=
 =?utf-8?Q?hnYPDFAzayqXimxShAPvAo4B7Jd6MI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVljOWdqQzFNazQ5YjBmZkIzNmxaRDAxRG5RSVVSbUZzcit1WElTc1c4QzV2?=
 =?utf-8?B?N2FHWE9YY1hpWHJqcFdtMGpBK2psanZOa0VDSTZFWU5QbFpFQ2w3L2luM3c2?=
 =?utf-8?B?UlN5MkY2QWU3cXVabWJZTUZEZzV1RHhPZ1N4ZTgwNWJVK3luMC91OTlLVE1E?=
 =?utf-8?B?eGF4U2RhdU1jL3lSN3ZLZGZFOEJER2FSWmVyRjZEVkVST0p5dTZxOGthR0U2?=
 =?utf-8?B?alpyTWhib2RqWXZRL3BwcStmQUF0WTcrUmdhdVE1SXJKbDZvbEhuWXJ5cHBa?=
 =?utf-8?B?TmYzMjltYklaZEI5bVoyU2tCRmFuMjBReVprcnZxNGE5b2NRa3VscDBoYWRR?=
 =?utf-8?B?MG5vbTkrV0V6anNoQjhjQXNveSsxM3lYT0ZFMXQzSWppbUEraEt5cmNxRnM3?=
 =?utf-8?B?Qm05bjVTV0dWOEtRQ1FsYkYrS2t0bHMydm5LcUNGN3l2ZjlodEN6NmFnakgw?=
 =?utf-8?B?aEJrZU42RVVmcHRsd3gzTG5zOWFJU2VwNTZUMGp6a1VTaVZJUDh3VjVnT21h?=
 =?utf-8?B?LzF2bkliSXRrMG1DYlVhUWdWaytxZXQxQUJQV2hPRDVNbHVwM0FSeVpHTGxl?=
 =?utf-8?B?Wk1ST280ckFxSXdNU3NiMERQMkF4c1l6ZjNlUkx3TmVzNzNyZGlMdk4xRGUz?=
 =?utf-8?B?ZGtldGcvajJuQWJVeTNKeUsyUWNBdTlRdkQxZE5aYzdXY09tY1RYTzZwMFN2?=
 =?utf-8?B?RTdCZjZqM0tzaWtQYXZnSUZ2cXRrUjhFRUNIdDV1TmNLZlVxMC9JT2NCWFVQ?=
 =?utf-8?B?UWZKeEdiY1hQL2w0WXEzdG15TjZ4MVNmZmdhbVFFNkJwVWxVdEZUMmQwM0RW?=
 =?utf-8?B?ejBjNU5mYVlzeFlsL0pNQ3FuZFhKMnhYTFlOWGFtdVI1akxrTmFXeUVoUDlX?=
 =?utf-8?B?cUFtSDAvUFlDaWEzNTdUNVprU3MzSkM5NzNLNWIySGwvdFRyVXJ2dHdSd2gw?=
 =?utf-8?B?VzJPeFliY29YN3pMK2o5cEFNSXkzd3BLVXdFc2srOEJTMm56aHA1dmFZZEcy?=
 =?utf-8?B?b3lVdThsWklxckR4ZFA0RGdBQ0c0eWpicGMrNkg3S2QrcHRvU3dPVEdtbFdv?=
 =?utf-8?B?cWRZYnhVZFJNWERTYjBXRUlwdEpDRVJ2dCsxZ0djcEM3YVlNcktnNldYZllm?=
 =?utf-8?B?ZUZaRERBS0s3bkZjeVBzVkFybkIzM0VuZm9LeWdHT0NxZEpGYUJTRUVGRjVN?=
 =?utf-8?B?cytPSjgxbi9MbTduTlg3TTl6TDBCRGxJdTk5MDB6cDVIUWZ2R3BES2Zta3lK?=
 =?utf-8?B?cFVtd1kweEpWYUtHWVVVN0NnRUlPTXdrQzh0N255N2Y1TXNOTkFNY0J4TDhT?=
 =?utf-8?B?aW5jaEo1RUJrcUpiZG8rRkZRNFJEUG9RVHc2YUE2VlNLRTA3ckQxK0RaUUV2?=
 =?utf-8?B?dDhFWTNkT2lCZmVGZnRSZlk4WTFSb1JoVjZQS0d5eGRSSHFTUFY4Ni8rY1VF?=
 =?utf-8?B?anFmeTMzMEhWcXJ6cDFmUHM3QVczNk9TVkJMYXVEb2hvNUhjUnBpajN6SWl6?=
 =?utf-8?B?aytEMG5ZcUdZcFZYZDREUW5ySkVPOW5JOGJpU1NjcXVKL2VDc1VmYlF2YVBI?=
 =?utf-8?B?ckRDcVI0RWhkMGFZaW5xemQzdVUwSVErUGxSdEh2ZnVoUEZld283anlUQzNW?=
 =?utf-8?B?TlZodFRYVTNFUHBEZmcxbnp1cmZKRUxtZ3NkRFNxdDJBN1pFRkxsVW8xMGhq?=
 =?utf-8?B?Qm9kajlGczN0UDExWHZpZVdHN2RlRGg3UDk0KzdWczNacTNZS2pSYzhTU01O?=
 =?utf-8?B?UU1MY1d4N05vZERZNVMwT1lleUhMdU1Wc0xzNHdqTkZ1MkRTNTlUS1cxanBR?=
 =?utf-8?B?LzdEamsvQ3E2eEk3UjQ3UCtDRkVCUmkrZ0ZORm43Y095RzF6OVd4ODE4T3J0?=
 =?utf-8?B?K05qSlJlNEg2OGk2T1FDaDVqUFJYYkYySTFDeVBZbmFnQjI2cnMzSG5rYmFn?=
 =?utf-8?B?S2hzN0xxQXdaRWlPV2Z4TFgycUVOTzloVXovSDl3WlcvbWxQejh5L1FuenNl?=
 =?utf-8?B?YTA5QlBkeVJUUlo0MDJWVmpMUDlXejlCOGVJbVZFeVR0cWJzaWRSZHRrYmlE?=
 =?utf-8?B?ZGNZYlRwaUtVRXQ3NlplcC9aYXB2YldqMFNCeUVGdk5WUHM1NUpaZ2l3dmZC?=
 =?utf-8?B?NTlSYlhMTnhuSFp5WFF3SkFVbUNaU1l1NGR2NkFCZFM0aW55TDUyR0RFeGV5?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311aac21-f871-4ad6-814f-08dda65a1c57
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2025 07:00:10.8827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2Zs0W9HuRgRoirgfYrPIdoGQPAgXzLNFwzPrc7fGu8C0O2GflS5kx3k/IjugjOboMOkT2Ri9Q27L9BV0UP64Vib/bhs7b8C57ldFa2kN+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDEvMTFdIG10ZDogY29yZTogYWx3YXlzIGNyZWF0
ZSBtYXN0ZXIgZGV2aWNlDQo+IA0KPiBIaSwNCj4gDQo+IE9uIFN1biwgTWFyIDAyLCAyMDI1IGF0
IDA0OjA5OjExUE0gKzAyMDAsIEFsZXhhbmRlciBVc3lza2luIHdyb3RlOg0KPiA+IENyZWF0ZSBt
YXN0ZXIgZGV2aWNlIHdpdGhvdXQgcGFydGl0aW9uIHdoZW4NCj4gPiBDT05GSUdfTVREX1BBUlRJ
VElPTkVEX01BU1RFUiBmbGFnIGlzIHVuc2V0Lg0KPiA+DQo+ID4gVGhpcyBzdHJlYW1saW5lcyBk
ZXZpY2UgdHJlZSBhbmQgYWxsb3dzIHRvIGFuY2hvcg0KPiA+IHJ1bnRpbWUgcG93ZXIgbWFuYWdl
bWVudCBvbiBtYXN0ZXIgZGV2aWNlIGluIGFsbCBjYXNlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+IA0K
PiBTZXZlcmFsIG9mIG15IHFlbXUgYm9vdCB0ZXN0cyBmYWlsIHRvIGJvb3QgZnJvbSBtdGQgZGV2
aWNlcyB3aXRoIHRoaXMgcGF0Y2gNCj4gaW4gdGhlIG1haW5saW5lIGtlcm5lbC4gUmV2ZXJ0aW5n
IGl0IGZpeGVzIHRoZSBwcm9ibGVtLiBBcyBmYXIgYXMgSSBjYW4NCj4gc2VlIHRoaXMgYWZmZWN0
cyBjb25maWd1cmF0aW9ucyB3aXRoIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSPXkNCj4g
d2hlbg0KPiB0cnlpbmcgdG8gYm9vdCBmcm9tIGFuIG10ZCBwYXJ0aXRpb24gb3RoZXIgdGhhbiBt
dGRibG9jazAsIHdpdGggdGhlDQo+IG10ZCBwYXJ0aXRpb24gZGF0YSBpbiBkZXZpY2V0cmVlICgu
Li4vYXNwZWVkL29wZW5ibWMtZmxhc2gtbGF5b3V0LmR0c2kpLg0KPiBJcyB0aGVyZSBhIGd1aWRh
bmNlIGRlc2NyaWJpbmcgdGhlIGNoYW5nZWQgYmVoYXZpb3IsIGJ5IGFueSBjaGFuY2UsDQo+IGFu
ZCBob3cgdGhlIGJvb3QgY29tbWFuZCBsaW5lIG5vdyBuZWVkcyB0byBsb29rIGxpa2Ugd2hlbiB1
c2luZyBvbmUgb2YNCj4gdGhlIGZsYXNoIHBhcnRpdGlvbnMgYXMgcm9vdCBmaWxlIHN5c3RlbSA/
DQo+IA0KPiBUaGFua3MsDQo+IEd1ZW50ZXINCg0KSSd2ZSB0cmllZCB0byBtYWtlIGlzIGFzIHRy
YW5zcGFyZW50IGFzIHBvc3NpYmxlIGZvciB0aGUgZXhpc3RpbmcgdXNlcnMuDQpPbmx5IGNoYW5n
ZSBpcyB0aGF0IG5vdyBldmVyeSBwYXJ0aXRpb24gaGFzIG1hc3RlciB0aGF0IGlzIG5vdCBwYXJ0
aXRpb25lZC4NCklzIHRoZSBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj1uIGZpeGVkIHRo
ZSBwcm9ibGVtIGZvciB5b3U/DQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoNCg0KDQo=
