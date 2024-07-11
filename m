Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5D992E430
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 12:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C5710EA0D;
	Thu, 11 Jul 2024 10:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="QwjZwCXh";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="0XfIc8ZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D1710EA0D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 10:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1720692491; x=1752228491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nvsQ0/76RWLd9qIfdOsWmKKSY666Q8zAhNBceP3KmMo=;
 b=QwjZwCXhTD/iBWjvuEaGN8XaPvw/xdny2vObV0tbFGphEYdLDVARhcew
 txvPc8FIViKD8L5Vq7RS2XJFtEfpZYc4XAGmOBpyAUbX9eK+4/dv3qYXM
 7PJFIUrhf34AZviP6gA/CpZY6dPMwq027Tatz000iZfl/4x91DSUZMXZR
 mrF3Z6NUVfpupoQ/ck5wiKhUKnEdEObjCQKmh+PxEm0sGTP82Md/M38aG
 OnXAccln72iefm/zSvdPYE/kihWPjrv9n+ErCEvvIkVpZi4VdMrH8OQP1
 eMFPT9esK/ankz018uCUsS8cfhpO5kHJm2I/huQP/V/sQT5w8z5cnVhy5 g==;
X-CSE-ConnectionGUID: ZLmvC6IhRZSWpK7lXeALFQ==
X-CSE-MsgGUID: DQOPIgs2QJihWkV/mexk2A==
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="31785133"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2024 03:08:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jul 2024 03:08:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jul 2024 03:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaVZfVikW7qC+oPtXZtWGcxtIzfjk189n9JJvyYk+RHaciXFpwybeRRizZce3FS+Mmri3bL9YQfHd5cUg0XIoN4MJZfy8Le++K8Ww6TAOD9CKABLWawZaojKLXONQ7ok94XrkDIAVYPnCkEXk7DOVAAhkKo6x+XUCo25RFc5kaLvXdRxi8hxe58txcAim0eDRMDZYhsZiVb8A3JDwcHemQlflSczSU+QEGtWHxOIvvckiTp0Kufw0olIIpGZGgkUklGoDYoIwnpBOvcrtp7pjbDttbY01DYvwTxJlL1ii4j1WHM4COCrDZ+qFgWRed9eVcGRFwRTM5/Q/oOw4yH12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvsQ0/76RWLd9qIfdOsWmKKSY666Q8zAhNBceP3KmMo=;
 b=RWez9RQHLakBC7r5wluzRsUVmhntiFTQirZTUUyp543bwsV1B170kf6EQOH42mfZ5w80YSz4HsLcj6jKGtKZu47UXljaoa9GiKn9+ZF8zJV1nh9AytZ80aLfgE1cvJJ5k7HDmanFMbNmh1/R8WVOzrZwJ4xMznuwYvbugPENIdKsC15w35Sw3DofmdZWwRECEjfqmsQ6RopfsdMLeRNs5WeAjVxlhbfz/TYuo3Vn3SEvLSbC75l4a6Nmz1jpE2vtaP9Po98EM20swcIb5aoTR/L47OuIXN6C7jgRwKbER+hYjVNMdqxvz3tUF3ozY563Wff+KQ0a6Rs2MXrydCEOFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvsQ0/76RWLd9qIfdOsWmKKSY666Q8zAhNBceP3KmMo=;
 b=0XfIc8ZJGhLbJncg1tgupalLbIJa34EymE2FTw4T+hpaH8qyjnySKQm6b2Bk848Igm0m90iaHOTozIPTXtJDJ622MyYn4a6wibJ4AMgikaoCM0rcK/TGRcdkJd6K1x0UoPGEjcJescmaeaqZdEAjVxp9Vst96O7Hfm5M0Ucx70+TJezSQj5rjUv3yi9nj7YQ3hNa8NQ/CjQnq7EXFqUcfiKQeMjbdk5ttZWLZhlUn0zSlmCxpV8gdTkMRuASdCnMypG8vvUuO3bXEtVrAksvng30ct5JK/g8EKFVJw+mML03cfxJfxop8Pultm3afC8R3Kz8aJQfseQG7h/lCFxRuQ==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 10:08:04 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 10:08:03 +0000
From: <Manikandan.M@microchip.com>
To: <conor@kernel.org>, <krzk@kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <Jason@zx2c4.com>,
 <palmer@rivosinc.com>, <mpe@ellerman.id.au>, <rdunlap@infradead.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/4] drm/bridge: add Microchip DSI controller support for
 sam9x7 SoC series
Thread-Topic: [PATCH 2/4] drm/bridge: add Microchip DSI controller support for
 sam9x7 SoC series
Thread-Index: AQHaze8SbLT0DLpvz0KnSuQXRfjkibHmZhYAgArXVICAAAm1gIAADssAgAACpIA=
Date: Thu, 11 Jul 2024 10:08:03 +0000
Message-ID: <597d49f6-7b25-434f-b14d-17ce17abb212@microchip.com>
References: <20240704084837.168075-1-manikandan.m@microchip.com>
 <20240704084837.168075-3-manikandan.m@microchip.com>
 <9ef5a1ba-e404-46e0-8513-5fffbfb5618b@kernel.org>
 <aeaeb5d4-5e55-4a7a-bce7-fa207ebf0616@microchip.com>
 <4c1b7af7-e53c-492a-9c41-40cad78f7666@kernel.org>
 <20240711-freezing-decrease-4807d5d62f2a@spud>
In-Reply-To: <20240711-freezing-decrease-4807d5d62f2a@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|DM4PR11MB7278:EE_
x-ms-office365-filtering-correlation-id: bcf09b3e-d4d6-4e2f-c82d-08dca1915a55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YmNhQU1pcUJFS1ZSSzZhbXFXQTdlUWZ6R25BUUorZEZYYjZ0OWNOWEdVd1lU?=
 =?utf-8?B?VG1BU3c3d1VpdjUvYTJJUDEyaWVpcVYwYTkrMHpuT1Q0Y0dqR1lLVXZwdWEv?=
 =?utf-8?B?MXdHZVdSS2FONXlsZkVpZU1nVnU5dmlrSHYrUFhxMDF5NFF2dEd6TkVGYXlQ?=
 =?utf-8?B?Rnc4QmVzejlmNC9FdFNyZWpDYVNqT3I0N2RDdlNHUndFZTNLT1lHTUxXNzZI?=
 =?utf-8?B?R29IK09SYTNIS0FXS0FQTzBjaCtXblpNR2VFcU1Ub08wQi9yZmJYNk5jcnlC?=
 =?utf-8?B?aUNSVUtRWW5FV005NEtLZ3hDWkJjMHNoYlZJYUtrY0xZbS84SWZ5RTE4QnA2?=
 =?utf-8?B?SVR0S1R5K1IyYXUwOUlIZ3g0ZHZ0SUZrYVpRT0JVVjJzVld1VndZam84RFZw?=
 =?utf-8?B?NkYvMkxrSjFKSHVJWHVHV2RIcjlzMVl0enZvK1J4MGFiSWtyMEE1M2ljK08w?=
 =?utf-8?B?NW5JUlpsempacVdxaTJXQVllN2xzTHNWNld6MHhrQURQTW1zUE9oK2pyU0ov?=
 =?utf-8?B?TWE5aEx3YllublpoM2dJQU1OSDlZc0NMck44MjdUdmVwN28zNWowR3lmVVYv?=
 =?utf-8?B?UVdxMUQ5cWYyK3VibGVnb2JJUytQNVJIWWZJR0Mxa1h0d2l5WENMbHR4MWdF?=
 =?utf-8?B?UkNiaGlCTThlUngwTUN0WWFtZElCUzJaWVpweUNkTkJ4QWdKMEFuMGdjM1Zt?=
 =?utf-8?B?Z2ZLbm4vVjBvTE5WTHg1enNtS1BPMjhQd09aYXIxQ2swQmFEbGZJQitoeWs4?=
 =?utf-8?B?UmhWVTZzeklERkRKOWVlT0N6ZFFaYXBqVlhJMHZ5NDV0eDV3Z2JoMUJPVGlv?=
 =?utf-8?B?WnRVVFlQTXdISEloNTZYc2l6TmpyTUt2Y2p2eFVwT3c0QVZsTXJrOGZ0d1Jj?=
 =?utf-8?B?ZFBsZDdzMmQ1TklHNWFGK3FkUThSTHU5TjJOc1lkam0zOFdNZ2NiZ0twcnV4?=
 =?utf-8?B?KzllRnpiem1yL2MwWUUrZ05YU1ZtUkdBNHc0MTRMbFMvNlM5MVVuWmUvQTZl?=
 =?utf-8?B?TnQ5VTNZTWtiQ2M3aGRaM2xxWmhDbW1CbkZzL2lJTVZqR3E2RS9LU2lkcWE1?=
 =?utf-8?B?UC9ZdzQvZ3lLNk9Va1kyTmV0T0dIL2R3T1g4RjBQYnFUNGxYL1YrN3FUTU92?=
 =?utf-8?B?RVAvSXdwUnpBYUJDaitrQkFKV3psWTJGY3grZTlUcjRCSlppRG9nQ2RLdXFu?=
 =?utf-8?B?QW40dVNJWEx1YkdHd3M4QUhaQ29xOW1IVjRhWWN1Zkc2REw4bm82NlZQaDVB?=
 =?utf-8?B?Z3BuL0tMTE1BZmVtQnlMV0NLamowMktUMW9yVFppVlFKcWRhRGdPeEl5SzlR?=
 =?utf-8?B?S1hFYWJENnFjUFY1VC90eU9JOWk3Smc2VFkxL29GcFhMaWZjRjBadlBEVG0v?=
 =?utf-8?B?UkxiVVN0TVJucVV2WFFubEh2YlN2V0xhNUdxRUlXWUlzc1VMVkV5a0t5ajRU?=
 =?utf-8?B?N0VHeDR3MVg3YWxDaS9MMzdPQlJRZWhzV3pwdzNOVXpGK3Exb2VNT0x0VUl6?=
 =?utf-8?B?b01tb0pYUEhHM1JSWllVenBoNFNzYU5ReFZlSkRJeTIwMThrd3dzakw3Rlo4?=
 =?utf-8?B?ZVRiYkZsUG1BbStBdkJ0QmR2dWhCd2hOMUozSE1kZ29BOUdiTmFNcDJucC8z?=
 =?utf-8?B?SzExRUJPaUlYNVE1RFlSWjhqcFh5VG01UERmZkZXb0dWdUgwd0ErZkNxTXZN?=
 =?utf-8?B?M3M1cGw5akJnUjdvSkYxdUs2QWxQems5dFNCQ0VodHhCTFNvQ2UrNk9iNW1v?=
 =?utf-8?B?cVRaSExRYTFCVkdlbXlGNFhCNG5KbFY0c01oR29TeGZNYWRjOHkyTlhkRXpG?=
 =?utf-8?B?NUYxcW43bjk0NEttTFFsQmN2bnNLbXlmUldjQlJIQis3Z0EweG9pSWVWSFZU?=
 =?utf-8?B?QWRINmZOenprVlZWN0UxNUxqVjhSYlFoanZkV2Z2Mm85TEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDRueHBsR095VjFLN1ZQbUxTOVBwTEU1RXpNWmd4NXllUzVPdWZzb1BDVnpy?=
 =?utf-8?B?VitUQ1cydkFvSzVya2FFemdISURVbGZMcHBtRmd6QU52Rk9BbUNEWmplUWpR?=
 =?utf-8?B?MDcrM2QzREJhVHBPN2xMbW0yTWRiTFBET1dSY1hwa2ZURWZIeUF4ZkJPWU96?=
 =?utf-8?B?VmcxSmVST1Y3czNJc0FNZWtmN0FjS2ZhanFjQm51THNRWG1BM043M3llRXFP?=
 =?utf-8?B?dmVQVGYxWVhFcmMvaGJoQUt0TXQ1YjNxa2o2dEkyZzlkY3FOcEQyNlAzRzN0?=
 =?utf-8?B?c05LUDdqWVJTelFrS1B5U25HZDJhMis1ZndZclVvWTdLdkljZEtFU0RuUEU5?=
 =?utf-8?B?Z1JKLzFrdkl5R1IrbFlESlJXWHZsLytjV2U1Q0pRMXBIbjVLRDVVZE9adlFR?=
 =?utf-8?B?QTQxNG1xUFMrQU5MN1ZhRlVPTVZCSnA0WUwveHZrV056ZnU5S1drUWR2N3ha?=
 =?utf-8?B?WEZSYTNTazBhU3M3Tkd3cWxZejNJL1R6M2c3T0VWQy96cXNPRmpDR2QrdklS?=
 =?utf-8?B?K1VlZ0YxdCs3TlBRQlVTUnlNdXplQ2c0dHpzYU1wWFcrRjdsUjdwai9oS09X?=
 =?utf-8?B?MSs2L2U2OVpSSEhEZ2YrNWlSNHBFcnJtdEo5NWVtTnU0MjJCMDRMaE1xMnJt?=
 =?utf-8?B?WFVZUm00a0k2UTJLY3VKcHhFTnZIMFI5NUIvUzl0RmFnbFhYbVFpRnlSOXJQ?=
 =?utf-8?B?cWg1YWRzNWN2MzhnczRmLzl4L0RMUlJPRlY5cld5cE04bGp5MzdZZENtV0dp?=
 =?utf-8?B?ck10NGd3WlV5ZDB4akhUSXFWNTJqU2ZrUThtc2Q3Qi9zcDNaZnorYTVGS25r?=
 =?utf-8?B?RGJoTTdFOEFEaVVjaVJoT3QzemkySkFQSEUyMVpQNkRXQU1JTmxHVWIwNVR3?=
 =?utf-8?B?cFV1QUduekJndzM4Nk5zNTdHWFN6OFh5SExGYXJjbEgxSFRTdy9wSXlUeUNN?=
 =?utf-8?B?a1lJYjEvM1dZUGR3QjhIaTEwWFR0aFZsRXErYXAybjltRE5GWTRCVktNNmNw?=
 =?utf-8?B?ZEhhck0vSkhLNlMwWll4Sy8wakYzNWJjTFBaK2JyK0dGYVJmZjFqb21sWkg2?=
 =?utf-8?B?UUx1azVZUk04UStwRHdlWVF2ZGY1eUlZYVhrYlBISHc0V05LN0NPTmpLYTVK?=
 =?utf-8?B?MUhDL3phYWJEbXE1cWlxMWVZN0RxQ0ZyaTB4RUdRcVJPSFgvK0VZUFpwdFF3?=
 =?utf-8?B?Q0QxZXhHUkxTM2dOTXpXYjVNV2V0V3hvMWZqZjc1RXNLbmZCcEdlbUNpVmtN?=
 =?utf-8?B?bllaeXo5VUZkSm1NVFVMK25DZVVKVVhyM29YTHBDRFJ5enA0NTlNTGV3RGgw?=
 =?utf-8?B?S04wOUtIRkhHS0tpbU5jcHNpZU05WEJQaCtEUTFLQ1IvblBGbzA5MWFkN2xZ?=
 =?utf-8?B?dU9BTDk4dmJxSXFUR05QOU16eVhjb0IxemZlTE4zQnpFM1ltRWZxdDg0RWxr?=
 =?utf-8?B?eXJqT2hTRzc0d01DdUxwckFLUFRYNnZsdnZqUm9pRi9Za1MyZnhOL2RUT1Ez?=
 =?utf-8?B?T0E5eExTdUsyYkcxS0w2c203eERmSVppS0ttNVI4akF5VFRKb2NGbmthWGYr?=
 =?utf-8?B?U29OTzVKOTRsUkxCUGNIWWxmdUZaa1V0cTRvUi9yRGNycEZsdGo4WVUxN0Vj?=
 =?utf-8?B?ZkZYbnl0NU51NXpQQTNLY2ZVaDZiaytMcnZ5NUtXTTVFbUlXUDdlT0krc0gv?=
 =?utf-8?B?SDBjZHdmV2piS092Qy9SNk1GZkM0Ty9vZ053djlpWnNUUEVLWlo4VkZHTmI3?=
 =?utf-8?B?ZXZxTWxZNXFMQk1yNUxOVFREQlJQNmdwZzlNN056a3d2a0Q2VFM2NU9xcHBt?=
 =?utf-8?B?OHpKL2ExeEVLeXhrbGxDR3lWSkp1ZFVrWHFOU1BOa3Y3NTh3SXRzNGxBUGpC?=
 =?utf-8?B?WTdEZjVnZzJOclg3SjdkUE1iYStValE1dFAwZUxkZm44U0h1aGYxTWMvbDBm?=
 =?utf-8?B?aXovTHFxeDRqRnIzRGIwYzA1aGwrWjJQWU50WnNsWjFWcTZFK3Mybmx0czV5?=
 =?utf-8?B?QWRKRmFFQ0Uvc3c0NkRTQzNoUkNFWlNKSjZIbXVHYWRpbmVjRHoyL21hVWpY?=
 =?utf-8?B?Wk5UM2V3MUVLODhFby91TnBzWnZYaExMaE5VUndES291bElSUVlwR3lOczc5?=
 =?utf-8?Q?3yUWIqCj59uDGym3chND+k9zC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <847826A4C076CA4984E6F8F495B31BEB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf09b3e-d4d6-4e2f-c82d-08dca1915a55
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 10:08:03.7069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Z+atjVA4n+2mImaPLc/sTUjYi8PB/+V6exzKVwdB4b9bIQp3GqZVW1xJtn8fiCesA4fqRTKPq1DZxd7suJiBAtMhuXesdjA9TE9/6DXYjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
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

T24gMTEvMDcvMjQgMzoyOCBwbSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBPbiBUaHUsIEp1bCAx
MSwgMjAyNCBhdCAxMTowNTozN0FNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0K
Pj4gT24gMTEvMDcvMjAyNCAxMDozMCxNYW5pa2FuZGFuLk1AbWljcm9jaGlwLmNvbSAgd3JvdGU6
DQo+Pj4gSGkgS3J6eXN6dG9mLA0KPj4+DQo+Pj4gT24gMDQvMDcvMjQgNDoyNyBwbSwgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToNCj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBz
YWZlDQo+Pj4+DQo+Pj4+IE9uIDA0LzA3LzIwMjQgMTA6NDgsIE1hbmlrYW5kYW4gTXVyYWxpZGhh
cmFuIHdyb3RlOg0KPj4+Pj4gQWRkIHRoZSBNaWNyb2NoaXAncyBEU0kgY29udHJvbGxlciB3cmFw
cGVyIGRyaXZlciB0aGF0IHVzZXMNCj4+Pj4+IHRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkg
RFNJIGhvc3QgY29udHJvbGxlciBicmlkZ2UuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
TWFuaWthbmRhbiBNdXJhbGlkaGFyYW48bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+Pj4+
PiAtLS0NCj4+Pj4NCj4+Pj4gLi4uDQo+Pj4+DQo+Pj4+PiArDQo+Pj4+PiArI2RlZmluZSBIU1RU
KF9tYXhmcmVxLCBfY19scDJocywgX2NfaHMybHAsIF9kX2xwMmhzLCBfZF9oczJscCkgICAgICAg
XA0KPj4+Pj4gK3sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+PiAr
ICAgICAubWF4ZnJlcSA9IF9tYXhmcmVxLCAgICAgICAgICAgIFwNCj4+Pj4+ICsgICAgIC50aW1p
bmcgPSB7ICAgICAgICAgICAgICAgICAgICAgXA0KPj4+Pj4gKyAgICAgICAgICAgICAuY2xrX2xw
MmhzID0gX2NfbHAyaHMsICBcDQo+Pj4+PiArICAgICAgICAgICAgIC5jbGtfaHMybHAgPSBfY19o
czJscCwgIFwNCj4+Pj4+ICsgICAgICAgICAgICAgLmRhdGFfbHAyaHMgPSBfZF9scDJocywgXA0K
Pj4+Pj4gKyAgICAgICAgICAgICAuZGF0YV9oczJscCA9IF9kX2hzMmxwLCBcDQo+Pj4+PiArICAg
ICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4+ICt9DQo+Pj4+PiArDQo+
Pj4+PiArc3RydWN0IGhzdHQgaHN0dF90YWJsZVtdID0gew0KPj4+PiBTbyBtb3JlIGdsb2JhbHM/
IE5vLg0KPj4+IEluIHRoZSBzYW05eDcgZGF0YXNoZWV0LCB0aGUgaGlnaCBzcGVlZCB0cmFuc2l0
aW9uIHRpbWUgZm9yIGRhdGEgYW5kDQo+Pj4gY2xvY2sgbGFuZSBhdCBkaWZmZXJlbnQgZnJlcSBm
b3IgdGhlIERTSSBjb250cm9sbGVyIHJhbmdlcyBhcmUgdGFidWxhdGVkDQo+Pj4gd2l0aCBjb25z
dGFudCB2YWx1ZXMuDQo+Pj4gSSByZWZlcnJlZCBvdGhlciBzaW1pbGFyIHBsYXRmb3JtcyBmb3Ig
dGhlIGZ1bmN0aW9uYWxpdHkgYW5kIGZvdW5kDQo+Pj4gc2ltaWxhciB3YXkgb2YgaW1wbGVtZW50
YXRpb24sICBvbmx5IGEgZmV3IGhhZCBlcXVhdGlvbnMgdG8gZGVyaXZlIHRoZQ0KPj4+IGxvdyBw
b3dlciBhbmQgaGlnaCBzcGVlZCB0aW1pbmdzLkkgYW0gbm90IGFibGUgdG8gY29tZSB1cCB3aXRo
IGEgbW9yZQ0KPj4+IGVmZmljaWVudCBtZXRob2QuIElmIHRoZXJlIGlzIHNvbWV0aGluZyBJIGFt
IG1pc3NpbmcsIHBsZWFzZSBzdWdnZXN0Lg0KPj4+IFRJQQ0KPj4gWWVhaCwgdGhpcyBzaG91bGQg
bm90IGJlIGEgZ2xvYmFsLiBOb3RoaW5nIGFib3ZlIHN1Z2dlc3RzIGl0Lg0KPiBJIHRoaW5rIHdo
YXQgS3J6eXN6dG9mIGlzIHN1Z2dlc3RpbmcgaGVyZSBpcyB1c2Ugb2YgdGhlIHN0YXRpYw0KPiBr
ZXl3b3JkLi4uDQpZZXMsIGFmdGVyIGxvb2tpbmcgYXQgdGhlIGltcGxlbWVudGF0aW9uIGluIHNp
bWlsYXIgcGxhdGZvcm1zLCBJIGRpZCANCmZpbmQgb3V0Lg0KVGhhbmsgeW91IENvbm9yLg0KPiAN
Cj4+IEJUVywgbm8gVz0xIGNsYW5nIHdhcm5pbmdzPyBBcmUgeW91IHN1cmU/DQo+Pg0KPj4gQmVz
dCByZWdhcmRzLA0KPj4gS3J6eXN6dG9mDQoNCi0tIA0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTWFu
aWthbmRhbiBNLg0KDQo=
