Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD509D7CAB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 09:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1966F10E5D2;
	Mon, 25 Nov 2024 08:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjelxIKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4C10E5C6;
 Mon, 25 Nov 2024 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732522484; x=1764058484;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8QUdC0/MJbfzIhgS/0uW+a5Qq67vce+YqdYx9e7nIt0=;
 b=NjelxIKOE1P1VlMHQyoGbd91pmBU2IYp8v0ENCHZiV7npHniiE1ViAGF
 kN1lAWC4PJzwxMTavINy3noqUlRNb6PtiifvXCBNHpFvg55A9kEIPSKQ2
 E4RrjTwMOYMhYm1fZUPCn0PLsvhgVoTDF8nF2MnyKD4fHQvrCybdcL1t/
 ESYhDMkexraCmQ27Er3LzyEs+iWvp2TMKh1nQdRCBN4ffUHAyhee71mSB
 MVqwbWAe602a/0+BSwdAxWDjEaUEvgZORStrRp77lAo4yPbATke19VPgB
 G6PvXWFOcX32UnTZJCEz1TMjOG2tnEc7ZUXAdNMunDcnY4IaQvlCSo9+/ w==;
X-CSE-ConnectionGUID: oHMDyTG5Tm2oaMsA2PVkyw==
X-CSE-MsgGUID: 0uc8Uya4TlCIv+7m7L4ASg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="35467264"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="35467264"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 00:14:44 -0800
X-CSE-ConnectionGUID: gMdOFehCTsaGervpQDthhg==
X-CSE-MsgGUID: jWMde2ScSduxLoiQwlJrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91983079"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 00:14:44 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 00:14:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 00:14:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 00:14:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boG7FFc3SOIj95BGg/Iq3oF+evRyH6PuYIEXMxEMPvDtxghGksXnhaODPNQhgC4/m2Rc2KLm56+wPAN3s+MmW+3iqmv3IcSHUXzG+4Panr0LetfFKrdh1wKw3ErRBI1idBggQKyQG8g6oWLa6dr3GgSY6WFM64di6w8wVyGY2FSGBzep9DenxFotYCO49Zx4hXRuBK8PlsF1JJwHbRhVFdFuuA0kkNeWgrdmHmnY0SUQi7Xgejvu2zXcTjBVZ0hIYAiZYVxFMpKhHWy8Buu/cQTLfftGSDxf6zNTMpF6v/ccXcoxAaQrVMjAqKjIUeVOUsf2yru8IdzwC4U03m1CSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QUdC0/MJbfzIhgS/0uW+a5Qq67vce+YqdYx9e7nIt0=;
 b=spq7ONyq763Q17wDXffnskM2+Ljw3XDKlt6x51U2tlcvEzu2DA1Sy/EjwsKJnxv0AwOdl5lx3wqK7diFe8Y6Smu4wySUlIKpQDMyev09WHWPTMiZOrdRbIQ6AWkmopOLKcEb9zBeRfucW9gXKonF0yfXDuznOxE6wBjEiEwpPSz/qx37R/LGkJ0TCCb9+NXrS2UCDD7oC7uVMPYXeqyVGZhzx5yzNLjbZw5nUf+NMq/Juoi/2Q6Ntv+1HegIhgfBybJxp7V0S0FW2aBiE47CLHq3AkJi2iveEWlXSxooiq1okPkwF9YDZ0KWy2hOukObjCtDy3h7ZP8WJlpmAzvi3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SN7PR11MB7089.namprd11.prod.outlook.com (2603:10b6:806:298::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 08:14:10 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Mon, 25 Nov 2024
 08:14:10 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv6 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Topic: [PATCHv6 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Index: AQHbPBHyjJ9QkG83RUayJ5zlEgjYXrLCXeuAgABWSxCAAD86AIAAArSAgAS1QMA=
Date: Mon, 25 Nov 2024 08:14:09 +0000
Message-ID: <IA0PR11MB730755786A611EFD9A744D71BA2E2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-6-arun.r.murthy@intel.com>
 <thqbnbw2yiqbfya7bh2izzf5qwr6fkir5m5luqkrhqj6vnltad@w2562fgo75g5>
 <IA0PR11MB730794BF402FC82BA5FEC1D4BA232@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJppXwCaYH9dNjTq7B0M5XF7p7VECHZH3=Fq-7fUuf7T++w@mail.gmail.com>
 <IA0PR11MB73079C28423B2DF134784310BA232@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73079C28423B2DF134784310BA232@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SN7PR11MB7089:EE_
x-ms-office365-filtering-correlation-id: 65e05276-30ad-45d2-b7ea-08dd0d2923a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K3Y1NW8vWkR0VUdvTGtSWDBEUHVMVFpKUE5OeGw3T0REb045TkFyZCs5Wmdw?=
 =?utf-8?B?OVNtazdaSmx4Yk5FcE9qNmZpR3lSRm1odnVPL3NtR0dyUnQwaUxISzkzc2sz?=
 =?utf-8?B?NWRIb0NBU2VVK3VEMW1lbEVuN1ZuVjZ2bjBsRU5JQkdRZThIeHpBNVJoQmo3?=
 =?utf-8?B?Umo2djZNN3lmUUh5VGUyYllhSzV4NVFJVWN3K1RlVytqRk5LNnp5VGR0R1N4?=
 =?utf-8?B?eXQwWTFLek9jV0E4K29iNXRYY3RhenVndnA5SWtEUjgrd2gyRXQ2b25udG5z?=
 =?utf-8?B?ZTQyMU02VDNabk9TWFBscjJRTlEva0VhTk5rOGlXNEMvZnpiU2N1aXowdnIz?=
 =?utf-8?B?NEdQK3NEc1AvbmJPNzhKdHhtN3pScE1BbHFBVU1XLzhDeS9VT0RBUHhiZVZa?=
 =?utf-8?B?MnM2VEplT2dzcWM5NDQ1Y3BEaW9JaW5tSm5GWEZOc0xsQ1dMYXRDQkNWUzR0?=
 =?utf-8?B?TFFNdmwvR01RME9uVlllNUFVdmpIUTZhbUxvN3RXMDFhSDBuZHVJOVBCTkwx?=
 =?utf-8?B?NTNhT2h1QS9iNS9hajB4L1NWR3NiajI3KzUzaVNpOGYxYWRqM0hRNUVNZzcx?=
 =?utf-8?B?clZuNnR3TU1PNC9JQ2dmZGcrUWpiZHFJUE5TSHlmaXQweDVqMGRoOEN3SE5F?=
 =?utf-8?B?eDZoKy9CdXgrbHF0cW82ZFRyRXZKbTBnN1poQ3JUNVFWUjBYVW5ubTJVZmRv?=
 =?utf-8?B?Z2RjUTJlUFBkU3NhZzIzK3M4ME9uSjRLVnMzNHBGNk9EVmRhbzAybTNLQXUw?=
 =?utf-8?B?NEFVQVpoM2Z5b1dRYVgvUCtybGNZVnd6ZjlPb08zVmtEOEFCemphTnZjcWV2?=
 =?utf-8?B?MS8vSGZiSitwMG9NdE1WQmlzd2JpQWtkdThFUVFSRk5rZFFCdExydUt4YW9P?=
 =?utf-8?B?c3NhY05TcGgyTHpQUXExTDBLUTBwS2E1MG5zQ01jSFNPTzRic2J3T21aZlZ0?=
 =?utf-8?B?cFZhbjJoSElvTFlGdFFiUi9hOEFvOVFVcWJkOG5QVG9WenV2YUJ3Y09xamtF?=
 =?utf-8?B?MkJsd2pGSXZYcTBiL0M0QjhRdmMrK0ZDWGJiYlRtbDFxTzRDZEhtSkJlNXd6?=
 =?utf-8?B?TERFVFh4azM5cTIyL2M5YytGNUZQdzJ2bkFVbzJxZVlDVlIvSWtHOSt2YWlw?=
 =?utf-8?B?YUpGMmZ3bUJ1NnFNeGdkdjhzTkVna1hPZVZaOUg4TUpSUWhNelpkZ0tLVENn?=
 =?utf-8?B?Yk5sN0xxNHA1bjZlS0NzcUZtNUVzcmZaeVZ3SDRWNXY2VFR0UzRjNmxUQVA3?=
 =?utf-8?B?OGRqT3VyampYc1hqcHZtbTQwS3E1aWJCdHM1bHo2cnNOcldyKzVEVzlPYTFN?=
 =?utf-8?B?QVNIUHk4cnFqVGNFeTZqTXRtckVPK1IxYXk2YllZQmJtUjFBYVppOGlXVE9M?=
 =?utf-8?B?cHozVjZDSTRyOFg5ZzN2WGxEY2cxV2IxcG01NWdKaDltTGJkeWZ4RFZzTXdM?=
 =?utf-8?B?UDQwakhER2Q3Y2pjOHdXa1NtVTFqMUlhUkZYTmViT2IySU9UZUpzcmxtdURx?=
 =?utf-8?B?NmJCWWlKL2NEUTVEZHdaR0czL1l4Rk1vNWo2clJSRDRRbllMTkRLV0VvS2Zj?=
 =?utf-8?B?amNCalRBYXovaE9VM1BvWXJHa3hBRGRHb25VbXZIL1lvMmYwMmpTRm5JWFdy?=
 =?utf-8?B?b0E1N1NRNUxrWS9ia0h2dERQelFnYk1XeGhLMWRnRmhmUlNKQ2FtYUlsOHZz?=
 =?utf-8?B?L3hVNDJTaVpjanRYYmhLM0U4Z3gzMTV2ejVyNE1teVJjYzI4N1JYcGNWRVNs?=
 =?utf-8?B?TFZQN29JNW1ra0VPT2RoTGpUMzFFRUcyV0RKZm5wVEZ3ODZiVG9JQ2NnMm0w?=
 =?utf-8?Q?FfppfDWFj6f2IQBFOFMt1hhMne9mpc56z0TwM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WU5uMmJESjFaejhSVlhTTVM5dERVRHZhZldiVGNMNlhGc3pXeUNlTFo2OHc0?=
 =?utf-8?B?NmZyRXZIazYrb2hZbWRTUEh1VmlnZUFwTXdleFZjcEpoYm90c2h4K0JWazNR?=
 =?utf-8?B?OFR5ZjE4NDBINnZXOENTSW9aTVIvV0tVSHpLZDVwaGptaklJajRnT0llYXc3?=
 =?utf-8?B?TXcrUzlRdWIyU21sUlpvODk4V2twSlY4YldoU1BvcUQrMmFGOStIME9jbHNw?=
 =?utf-8?B?bGxmWFlnNFR2OGJDdU16RTJMejBwVkdpdXJNK3V3NkQzZU5Qdi8xTThtdjBq?=
 =?utf-8?B?M0p1RUlLa3NtQTFqb0tnb0JyM2Rlb2hRNUNTUE5HdUpEUmc3Q3BhR1VDQmdj?=
 =?utf-8?B?R2hUOHI3UDN0Ymx0em40Rml4c1F1UUZlaFhVZ1psb0tQaTUwQnhpRWw4c1k0?=
 =?utf-8?B?bjE0VWZGM1dlcFYzSlRXNGxWcDhQRHpoTFdydVg2ZDZzekk5bFFEamVOY0Rt?=
 =?utf-8?B?KzBKbyszKzFDWVFUN2ZMcFVYVWhkTEsyMGpKU3pzY0FHbUcwcStWczVrK1dB?=
 =?utf-8?B?b2Y4OHcxNVVuZldMQk9RN2k0M05HdHJZOEd3MkRDLzBZdTdWbVdlYkQ3M3Z6?=
 =?utf-8?B?bCt4WWJoNC92NzJsZitRQlJhblVrQ0JSQnA1cE9XZXdTNXFTbXZvOFRaM3hG?=
 =?utf-8?B?L252STJPQmxUaVBWT0NNbThnUHNodmkzU0pwTXhDczJuU1A2bHRXa2pzS0hH?=
 =?utf-8?B?UUVyMERESDNSMTNPcUR6ZGVHRDJYODByRjFxSjRTbEt4WmJjM0R6dWNTb0dm?=
 =?utf-8?B?SlQzSmpFaDVNcVN1Q1E1TnNKbnhPY0pCTWEvTDVXbTJiTS82TVorcnZSTEVE?=
 =?utf-8?B?cmpqU2YvUXNQYWQ5bWZuQ04ybU5VSG50eVBLNUZsM21RL01rRXV1ZXJGUXZR?=
 =?utf-8?B?MHdJL0JDbVBDUHR5SGJsMVNCVk5TWXlrSHJaRi9OcVFHcmozNEhiRFF1a2dG?=
 =?utf-8?B?Ly9QbkRaZU9UczVTUktwOFpyc2JpZDRFWXJRbmVvaG1kdnAvQllScFlCQjFi?=
 =?utf-8?B?ZzVPSjIzbHJ1bkViTmtIMUx3eTVHaW1JY0QxQ1JlcllpL05xam5KYjl1Vm1j?=
 =?utf-8?B?cEcxMFQ4cnovSVZObVNHdmUxektZZWtQeHRmbVlrbk9ucFpKeWdXV0ZZd1By?=
 =?utf-8?B?SElwYTB2a3I4WGpnb3BGdzFSdVl1TzlhNmt0T0RmTzRDSXRWNXFNcHJndTQx?=
 =?utf-8?B?VU81c0ZpMk5SZGxON2c1WVdjdTlvWmJkZjIyMWgvUVkrNUNBQkR6RU1LU1hs?=
 =?utf-8?B?Uzc0ejhmS3hMaHhKTmN4dUJoSlNUWFRuTEYreVJWN0hXZFZoR2tWQjd6WWk4?=
 =?utf-8?B?Vy91NlR2a2tSQjI0eDZQQnpUT3l6UENha3IzVnA4V21vN043MzJOdjZYUHBR?=
 =?utf-8?B?NEIwNldCTFNnak5kdEVzUWpVdnI0b1pDQXpzVjk3d3NmWTJQTU5PUlJlOHZv?=
 =?utf-8?B?TWo0NllNWWhSd3BkY0N5aUltMG1td2FYWE95WE55OXNTY1lkN2tVRXJ2S0la?=
 =?utf-8?B?Y2g3YmhDb3RVOWVYV01yOFI4a1R6dS9hRHRYSndXUHJCQVYvdExWTUFxemJp?=
 =?utf-8?B?NHIybkdHeXpRU2NWcm5LdG1Nb2g5ZVppVW45REwwY2RPaW1CanBLRGYvTzBv?=
 =?utf-8?B?KzlqajFnbzc0UFNZM2lVTXpCeHd1aXdZRDltSmVIM09pc1dQZ0FkRXpYSFd6?=
 =?utf-8?B?NnV1aGQrRVAyU0VzZWxxYmFwQ2hHeVZ0YWRRV3FlWmlzcFVOSnkzWFhwVTZm?=
 =?utf-8?B?VndDYWFFMWxwMVdUUUNaZlV2Z0dvU25qWU1EVDZzaXQwbGJrUXJTL3FCMHQw?=
 =?utf-8?B?Nk4rUWw0RkJhOUVJczNyWkFQbjczZVdzK3BBa3RrSENIWmk3R2NmbkFDaHJU?=
 =?utf-8?B?S2czQzVaTDlIeGhsSSt5V1Baai9mSWVDUURpT3ZhRk9NMGpjNnl2NnpPdms2?=
 =?utf-8?B?Q0gzR1lJL05xb1dYRFE1UVJHU1ZUTUMwc3BYUHgxYlZ0TndRSmFNQUpaQjhO?=
 =?utf-8?B?QjlWSVExSUJ0T2RHZVNZRk1ENGlhOHQvOSt1ZiswOVpKYXBpTWFSVXA5N1A2?=
 =?utf-8?B?M0hPOExMOTRPVjFPeTNNZ1BKT1l6V3JNR2lWT281K2gzOUtWckI5YlBvZUhZ?=
 =?utf-8?Q?TIWiUnakvMptpmxcFnd84bPr3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e05276-30ad-45d2-b7ea-08dd0d2923a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 08:14:09.9382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDpks25F7H8X2cEi46e3kNOebGkG5TV0XAfpOizlF523MEckGuKk+cSBtWau677UNjZ4pBJroEXCVC9a/NmEqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7089
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

PiA+ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAyNCBhdCAwNTo1NjowMFBNICswNTMwLCBBcnVuIFIg
TXVydGh5IHdyb3RlOg0KPiA+ID4gPiA+IENSVEMgcHJvcGVydGllcyBoYXZlIGJlZW4gYWRkZWQg
Zm9yIGVuYWJsZS9kaXNhYmxlIGhpc3RvZ3JhbSwNCj4gPiA+ID4gPiByZWFkaW5nIHRoZSBoaXN0
b2dyYW0gZGF0YSBhbmQgd3JpdGluZyB0aGUgSUVUIGRhdGEuDQo+ID4gPiA+ID4gIkhJU1RPR1JB
TV9FTiIgaXMgdGhlIGNydGMgcHJvcGVydHkgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIGdsb2JhbA0K
PiA+ID4gPiA+IGhpc3RvZ3JhbSBhbmQgdGFrZXMgYSB2YWx1ZSAwLzEgYWNjb3JkaW5nbHkuDQo+
ID4gPiA+ID4gIkhpc3RvZ3JhbSIgaXMgYSBjcnRjIHByb3BlcnR5IHRvIHJlYWQgdGhlIGJpbmFy
eSBoaXN0b2dyYW0gZGF0YS4NCj4gPiA+ID4gPiAiR2xvYmFsIElFVCIgaXMgYSBjcnRjIHByb3Bl
cnR5IHRvIHdyaXRlIHRoZSBJRVQgYmluYXJ5IExVVCBkYXRhLg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gdjI6IFJlYWQgdGhlIGhpc3RvZ3JhbSBibG9iIGRhdGEgYmVmb3JlIHNlbmRpbmcgdWV2ZW50
IChKYW5pKQ0KPiA+ID4gPiA+IHYzOiB1c2UgZHJtX3Byb3BlcnR5X3JlcGxhY2VfYmxvYl9mcm9t
X2lkIChWYW5kaXRhKQ0KPiA+ID4gPiA+ICAgICBBZGQgc3Vic3RydWN0IGZvciBoaXN0b2dyYW0g
aW4gaW50ZWxfY3J0Y19zdGF0ZSAoSmFuaSkNCj4gPiA+ID4gPiB2NDogIFJlYmFzZWQgYWZ0ZXIg
YWRkcmVzc2luZyBjb21tZW50cyBvbiBwYXRjaCAxDQo+ID4gPiA+ID4gdjU6IGhpc3RvZ3JhbSBj
aGVjayB3aXRoIG9sZC9uZXcgY3J0Y19zdGF0ZSAoU3VyYWopDQo+ID4gPiA+ID4gdjY6IFJlYmFz
ZQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1
bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljLmMgICB8ICAgNSArDQo+ID4gPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0Yy5jICAgICB8IDE2Ng0KPiAr
KysrKysrKysrKysrKysrKy0NCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9jcnRjLmggICAgIHwgICA1ICsNCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgIHwgIDE2ICsrDQo+ID4gPiA+ID4gIC4uLi9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8ICAxMyArKw0KPiA+ID4gPiA+
ICAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGlzdG9ncmFtLmMgICAgfCAgIDYgKw0K
PiA+ID4gPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDIxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4gPiA+DQo+ID4gPiA+IFBsZWFzZSBwcm92aWRlIHRoZSBkb2N1bWVudGF0aW9uIGZv
ciB0aGVzZSBwcm9wZXJ0aWVzOiBiaW5hcnkNCj4gPiA+ID4gZm9ybWF0LCBldGMuIEFsc28sIGlk
ZWFsbHkgc3VjaCBhIHByb3BlcnRpZXMgc2hvdWxkIGJlIGRlZmluZWQgaW4NCj4gPiA+ID4gYSB2
ZW5kb3ItbmV1dHJhbCB3YXksIHNvIHRoYXQgb3RoZXIgZHJpdmVycyBhbHNvIGNhbiBpbXBsZW1l
bnQNCj4gPiA+ID4gc3VwcG9ydCBmb3INCj4gPiBzaW1pbGFyIGZ1bmN0aW9uYWxpdHkuDQo+ID4g
PiA+DQo+ID4gPiBJIGFzc3VtZWQgdGhhdCB0aGVyZSBhcmUgbm8gb3RoZXIgdXNlcnMgb2YgdGhp
cyBoaXN0b2dyYW0uIEhlbmNlIGhhZA0KPiA+ID4gaXQNCj4gPiBpbnRlcm5hbCB0byBpOTE1IGRy
aXZlci4NCj4gPiA+IFdpbGwgbW92ZSB0aGVzZSBwcm9wZXJ0aWVzIHRvIGRybS1jcnRjLCBtYWtp
bmcgaXQgdXNlYWJsZSBieSBvdGhlcg0KPiA+ID4gdXNlcnMgYXMNCj4gPiB3ZWxsLg0KPiA+DQo+
ID4gVGhlcmUgYXJlIG5vIHVzZXJzIGZvciB0aGUgSW50ZWwgaGlzdG9ncmFtIGZvcm1hdC4gSG93
ZXZlciBvdGhlcg0KPiA+IHZlbmRvcnMgY2FuIHByb3ZpZGUgc2ltaWxhciBmdW5jdGlvbmFsaXR5
IHRvIGVuaGFuY2UgdmlzdWFsIHF1YWxpdHkNCj4gPiBkZXBlbmRpbmcgb24gdGhlIGltYWdlIGNv
bnRlbnRzIGFuZCBhbWJpZW50IGxpZ2h0LiBQbGVhc2UgZGVmaW5lIHRoZQ0KPiA+IHByb3BlcnRp
ZXMgaW4gYSBnZW5lcmljIHdheSwgbGV0dGluZyBvdGhlciB2ZW5kb3JzIGJlIGFibGUgdG8gaW1w
bGVtZW50IHNpbWlsYXINCj4gZnVuY3Rpb25hbGl0eS4NCj4gPg0KPiBTdXJlIQ0KSGVyZSBpcyB0
aGUgcGF0Y2ggd2l0aCBjaGFuZ2VzIHRoYXQgaW5jbHVkZXMgd3JpdGluZyBiYWNrIHRoZSBpbWFn
ZSBlbmhhbmNlZCBkYXRhIGJhY2sgdG8gdGhlIEtNRC4NCmh0dHBzOi8vZ2l0bGFiLmdub21lLm9y
Zy9HTk9NRS9tdXR0ZXIvLS9tZXJnZV9yZXF1ZXN0cy8zODczL2RpZmZzP2NvbW1pdF9pZD0yNzA4
MDhjYTdjOGJlNDg1MTM1NTNkOTViNGE0NzU0MWY1ZDQwMjA2DQpJIGFtIHdvcmtpbmcgb24gbW92
aW5nIHRoZXNlIHByb3BlcnRpZXMgdG8gZHJtLWNydGMuDQpXaWxsIGZsb2F0IHRoZSBjaGFuZ2Vz
IGluIHRoZSBuZXh0IHZlcnNpb24uDQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0
aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo=
