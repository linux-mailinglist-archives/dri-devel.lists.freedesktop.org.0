Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA486A89F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 08:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B80C10E44A;
	Wed, 28 Feb 2024 07:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="BIZRh0dF";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="tFoBykL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E333F10E44A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 07:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709103635; x=1740639635;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NfE5g0YRCRE/rgsHoclrXjQ2zD81XoyLIeKbfeUZdYs=;
 b=BIZRh0dFe8vjwSxTs60KDMAoC0T0lwinA4cKDMb62t93vyWR9ZQy0ex5
 rgYxaxtPjn0X+mZcn/bRVuzPFZ2jUIXWvmhnYIvVDe1U3fdlW5WCeuHd5
 1VmX6GbWrr8WZSPrXFPrq0czyiGQwSSz37deAKBJbBaUiCzWWXjBwpfMZ
 P1KRCc7U0xTD4rQQAvx/lHFK6aMKerQos9eScYh4roKM1geTVt3k/VQs3
 AS5OpjV4HEF3EHFaYsjDqshEPCxG+JWhjgZXJ3u/WOLfgHnXbyG/I5idR
 IsXQJZtLtWC07xl4SCzEdxFC0XfkrUMWGhPxMkyLPzuunXMQH2KT/7lUZ g==;
X-CSE-ConnectionGUID: 9HY/Db7CQ5K8Svqp2VCHfQ==
X-CSE-MsgGUID: PmZLBuLLSbeIUO4HosWQSg==
X-IronPort-AV: E=Sophos;i="6.06,190,1705388400"; d="scan'208";a="184207705"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Feb 2024 00:00:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 00:00:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 00:00:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njuZBCCuNzVdkz70oVV2XGV6Rs/MBlCA0jmISRhCc5ozBCC4JITCCOc24NVUTCnL9YVYf14OSCYXbDL5dGwV+2NrMlNQAsPPJ76R0JAwxsTphFVplZkIJdnXlV9W46gJCFW10qWfAGoMJrjM0cYwhX+4X96ZqKDHOIsdyextPNILMH/1r2gUAy1VX2QGQxBDQ6rZh6w9FrnIdqiGXOIZb7MyK5qKA22pmTr5Z8EhlU1zP3z3Y6Fnj7Q1sWZHl4UrGj81WFzaA2L8EdxwQJwOO9bEkCnpLawSN0zQkXnHYcEntyJ2dy0kSARauwhXKdQGzchG24EcdJJ68PkrqY6oLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfE5g0YRCRE/rgsHoclrXjQ2zD81XoyLIeKbfeUZdYs=;
 b=OqhtH0N5bR60uB6JC6CzK9C2ckgEbuzPOGyKMek6Sv6B1+hCPXzZFbiOkKhVxnUgtbw7DQviVnmBTyxwKRCCUrjec2HyMo2llwbtr2TqDJRLnKSnT1c/CEuDbctmgXFpl11BKn0aQ7ccg4qNNQ3AwGU5r5toz4TAVQifoUR2lJQDbtc7WP5j8WTGHWByvOPqAtGHhLP3PxUA/s0WoOEE8VsUUx1HXvPAcgPee+o17yAnW9dZ0vhBGlsNeHjIPxEs0DNAdYkyPzhyRj4tmqeEcYCsc6u0GOYchk096J5ouFHsiK5LNGYOXMhoZwutDISUpYM7N6qDRKEx30WTrdUqvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfE5g0YRCRE/rgsHoclrXjQ2zD81XoyLIeKbfeUZdYs=;
 b=tFoBykL7anrnOB93MKTTsZIKFolw4j++OpwLRrSF1xGJRaxMVLnTYKz3M2DzWxV0UF31V7osvwAkKIIFa758BOXEpNx/QsmivSPNktWQKpED4KQuR8IyOpQKXE6rAYkgsbveOrih0GZSittNtOlaISzaVnFCf4yHXjWxVKqa6VIlkcDgWZ8lXSjXTcmcoApcTzQE+qb3qM8DEtd0wLEDmychLaAMgo8CUCFFspyHk75QahdcavYZtXjsfHH7sktRB+OYZ7TSjmn+tKsu36Mrxlao5BpP5+cjylcf0IE1Zh5kTv/RCviaIhXWs5S6Bsb6Up/0tiZ9JIkO6008v4OlCw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by CO1PR11MB5122.namprd11.prod.outlook.com (2603:10b6:303:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Wed, 28 Feb
 2024 06:59:59 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd%3]) with mapi id 15.20.7339.022; Wed, 28 Feb 2024
 06:59:59 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: display: atmel,lcdc: convert to dtschema
Thread-Topic: [PATCH] dt-bindings: display: atmel,lcdc: convert to dtschema
Thread-Index: AQHaZjjd01Ir06e0kkmO7KWz3iDwFbEeHZWAgAE9Z4A=
Date: Wed, 28 Feb 2024 06:59:59 +0000
Message-ID: <11c545e2-45df-4587-a5c7-12b05c2f01e0@microchip.com>
References: <20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com>
 <796652d5-af57-4aca-87c2-10a7b0b55959@linaro.org>
In-Reply-To: <796652d5-af57-4aca-87c2-10a7b0b55959@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|CO1PR11MB5122:EE_
x-ms-office365-filtering-correlation-id: bf490cb3-fe48-49ad-f939-08dc382ae0f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3VJ1XMVUt3F8Q6DB1hr11/EH5CVznv1f23jDxE2dFf+MkRgX4mzmnOdCt/gfXOLMzxJG9ejZZPCZkPvguTV8R+9U+vTixYk9S/6opxxi6d50sGBzqvNLM46tQvr7wueC1z27IJe9PdqIChNtU+G7TV0oQrIv6bfq8aIOI6mOSNI01udSgVutPFAn+mRqqdOdFhuyV2hNJ3c/eKw2MTHba9y0htNq4ppe6ASNYH66r25CpBXUajKnmJVCY/mKAWXfOPzXTDTdFPyuLCsyTqheloMgKKhLBrzJGabAclINF8YZZh+t7nwDFGErn6ghjd2UieOzdkxNs20O3Fb2A0OEbUxJVXoiZhtfi2XKLUcRTTHuaMNYbUQDb20MTZZEMg+M/ZthAC1jy4n0G542Gt+NvSYMLHoJzNFAQw8aUzJzVPy7pHNO6fXNROpFIDV1F8aAqfxKWI/V/wS+oxgN6JgYsB46srClcqbpUcTLeW8DlvxADPQWBZdGiBLNXfedAf3RrtzXZdwy2TAS175fTBfMejwq8QdFHiD6i6Kgqda/voW46LdeLjGBVEkCTG52SHR8ipKIlo3POGSyZw8xezlC6fVQn3Fq4Xh7O9j4W8A3J9vvmiUnYIO04g/Bj+Mla/aOeq+AFIbE6opOB9KtBgPp0OfR+pStpjL1e7tThPgY6MWYZIT62zHnzOqccCWJrqaxaGriEKT5RnaskVNKBTWiXz4zLmYp3xOybl8pR9E+Dtk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009)(921011); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VndtdFFBQkhsWWRpVjFvYm1BbWpwVmNvazh1c3ZRYWxXby9qZFdLQXMxTHRq?=
 =?utf-8?B?LzF4Wk95OWkydm9aZVNLWG1pdGlJUWRzb0FKc3RyRDlpZUxnVGRXbFByZnVQ?=
 =?utf-8?B?YTZCbGphTmRpZUltMlVjRFUxUmNXbS90dUVXcE8zdWU0ODZ4cjV4UHFZdEVo?=
 =?utf-8?B?TTdzRTR3SzRmK0xSWWJvYnk3VEVDVjNObzhiaDRZVTl6aUlwTGdtTTl5ci9v?=
 =?utf-8?B?NlJ1ajFFVzJyeWNQRDVuNHVaQnB1cmFxRXk4Rm5qUmlJRTdwZFNZdmMzbnB0?=
 =?utf-8?B?MW83WHJadUpRRWNnK292WFZzV2RTQXFvYVRPSDV0QXloVk8xMU5nVmRNOWRC?=
 =?utf-8?B?T2JRaXdESEorUnozS3pMaDFENjdhRFQ3QmtvQkZXeURFb1JFcDYwNGJSRmVj?=
 =?utf-8?B?MkNkempXV1VKaC9WWWNaNjI2MnlYb1FtR3dhNVhFTnhBSGg1bjFpMWc0SDZm?=
 =?utf-8?B?RmRGZW9SMzZIZTE2dVZYR2pnY2JKLzVVM1hBOEFrV2pCTGJWNDVIRnowa0ZW?=
 =?utf-8?B?dTM0aEFYakpEOXh5a29wY2VGK1BNWlpwT1BhVjZrdUNVZlJHQUwrNVo5Ynhv?=
 =?utf-8?B?RjlmdTdqTEVZc2ZtMFNvVGNFdCtwaTRtZGdXa015WGxlalFjOE9Yck5TVk50?=
 =?utf-8?B?Skw3d2UyVWh1ZEN4R0VBWERSck9DRmh0L0tUSVpUWmxBVHZaZTI1eDFyOXlS?=
 =?utf-8?B?dkVNYzVCNjRoNGlXQk5HeGF1T0xEa2VZQmhuQllsOEk2ZnhKQTV1eWIxZFVq?=
 =?utf-8?B?a1dLZjI0c1Y3Q0tDazhOWUZBWnIzdVRFNDcyOGFDcmxPSkpvMmlSaU4xNVVy?=
 =?utf-8?B?T09DZ0svVzFWd3g0TmhLMW1JK0VoNm5RbHl2c09xZ1R2TS9jeGZ4YWZTejdS?=
 =?utf-8?B?U1lRbE1OM1VSMlhUMGNycW4yZndCZDJuVmFvdG95ZndheU9qMXZBMHB2RWpS?=
 =?utf-8?B?aUJCZVpjaVJsNDFtRGpqbVlqcSt0bjBqQlZkZTV4T0ZHQW1YRVNrR1R6a21O?=
 =?utf-8?B?WVEzWUxwWkZSWWlIRWJZTUZ1b3FRRTk4b3pzY1VDeFpvS2tqbCtvYVVMbkx5?=
 =?utf-8?B?NjJEZENmODZVaUI0dG03YnhHbEdFanREUno0YUw3NmgxUDBDSW9tdTk0bnc3?=
 =?utf-8?B?VkphRk1MUFZzcmNZVEdYa2t0SDlYelBhd3h0bTBnekt1Wjdyd252TXI3TFNL?=
 =?utf-8?B?ZEV6N3pLaCtXaGNBUjIwVGZwam9VRm52clRjOTg2Zk9CYzR2ejJOVWR5MkRn?=
 =?utf-8?B?OHkvTFM1MS9BSXZodzJpdzl1UXA4OHhCSERHaTg0N2VWZGdOeThyL2VrNTd3?=
 =?utf-8?B?ajJDQXQ3Z2QxRUdCUGJxRlNEa1NjWU1DWE90UklTcTFWT2hWZHhPUHBvbFo4?=
 =?utf-8?B?d25OTk5DZzZ2bVM1ek1hYUdrTkxKbkVhd0tXeHpnaDJSYXdkUUVZVFBncGtK?=
 =?utf-8?B?Wjd6TWs5Z1VJb25hWitzVDA3UlN2YWpwc3U5aCsvZTU3eCtBSzFGUGIrbENp?=
 =?utf-8?B?OFlhNE5LUzVIWnk3WjMvQlVSQ3A1a2tTN3NKSHM2UVN3d0ZMZGh2SEg0WVBu?=
 =?utf-8?B?YTVUallTVUh2OU90ZnhWZkJMa0xmMC9EVGVXaXZsSXRidGV1NFV3U3U2NFRp?=
 =?utf-8?B?eGEyWEt1WUNKYVFjUGJvM2FLZGt2cnBtei9YUzFpalN1NUJ4VXQxeTlQTXk2?=
 =?utf-8?B?NUhESVhneFR2MVF4eXpSQVd4andOWXUvdjlrN0pTU0MxTklwNFRzRzVMcWRY?=
 =?utf-8?B?NkxDbDVjSXZndDdDdzEvMERsMTdWZitncWZmZUpXN0dvYVBSeDNYUmY3L0Zm?=
 =?utf-8?B?S0c0ZzVrd0pDWTdrVlFjOGo2NmloenljNWZ1d0N3Q29LT2VUdlJyczdEOER1?=
 =?utf-8?B?OHQ4YzlYekR4ZVU1dk9NOWJzK2RjbDE3Q0RnTnB6NjQwZnBsay9HTXNubzdT?=
 =?utf-8?B?ek9YSnlXR3g2VkFYODZBMHZPU3hVNjgyTkFGQk9wSHlYanBYeTZrNXB3TnNE?=
 =?utf-8?B?N0w4czZjYmVjYWVzdG1zM3hTZ1hYdnd3VmpkclppSTRCQ0U1QUsvUUJVL2l3?=
 =?utf-8?B?YmNEd2ppTUEwZ3BRWlBpcDJMT2ZzcXduVTR1S08wc0tLMklYYmdKK1dyWURv?=
 =?utf-8?Q?jF9dUgkRjQGZ1MhLCtq8v867s?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6FB034AF1423C4BBFFAA4831F4CF561@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf490cb3-fe48-49ad-f939-08dc382ae0f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 06:59:59.3459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zdnh4LtLxP9p9RaHdhITLsgmX2PHkSK7tSPq21Js6A7X8OKtruVN3W7j5Y3Z/HYzYQJ4kmZJjizYcx+yq5YUjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5122
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

SGkgS3J6eXN6dG9mLA0KDQpPbiAyNy8wMi8yNCA1OjMzIHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDIz
LzAyLzIwMjQgMTA6MTQsIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3cm90ZToNCj4+IENvbnZlcnQg
dGhlIGF0bWVsLGxjZGMgYmluZGluZ3MgdG8gRFQgc2NoZW1hLg0KPj4gQ2hhbmdlcyBkdXJpbmcg
Y29udmVyc2lvbjogYWRkIG1pc3NpbmcgY2xvY2tzIGFuZCBjbG9jay1uYW1lcyBwcm9wZXJ0aWVz
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJA
bWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2F0bWVsLGxjZGMudHh0ICAgICB8ICA4NyAtLS0tLS0tLS0tLS0tLQ0KPj4gICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2F0bWVsLGxjZGMueWFtbCAgICB8IDEzMyArKysrKysr
KysrKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygrKSwg
ODcgZGVsZXRpb25zKC0pDQo+IA0KPiBZb3UgaGF2ZSBzZXZlcmFsIHBhdGNoIGVycm9ycy4uLiBj
aGVjayB5b3VyIGdpdCByZXBvIChnaXQgc2hvdykuIFlvdQ0KPiB3aWxsIGVhc2lseSBzcG90IHRo
ZW0uIE9yIGp1c3QgdXNlIGRlY2VudCB0ZXh0IGVkaXRvciB0byBjbGVhbiBpdCB1cC4NCj4gUnVu
IGNoZWNrcGF0Y2guLi4NCj4gDQoNClRoZXJlIHNlZW1zIHRvIGJlIGFuIGlzc3VlIHdpdGggbXkg
Z2l0IGhvb2tzLCBUaGFua3MgZm9yIGxldHRpbmcgbWUga25vdyANCnRoZXNlIGVycm9ycywgSSB3
aWxsIGZpeCBpdC4NCg0KPiAuLi4NCj4gDQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXRtZWwsbGNkYy55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXRtZWwsbGNkYy55YW1sDQo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi40YTFkZTVhOGQ2NGINCj4+IC0t
LSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2F0bWVsLGxjZGMueWFtbA0KPj4gQEAgLTAsMCArMSwxMzMgQEANCj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpDQo+PiArJVlBTUwg
MS4yDQo+PiArLS0tDQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNw
bGF5L2F0bWVsLGxjZGMueWFtbCMNCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+ICsNCj4+ICt0aXRsZTogTWljcm9jaGlwJ3MgTENE
QyBGcmFtZWJ1ZmZlcg0KPj4gKw0KPj4gK21haW50YWluZXJzOg0KPj4gKyAgLSBOaWNvbGFzIEZl
cnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+DQo+PiArICAtIERoYXJtYSBCYWxhc3Vi
aXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4NCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjoN
Cj4+ICsgIFRoZSBMQ0RDIHdvcmtzIHdpdGggYSBmcmFtZWJ1ZmZlciwgd2hpY2ggaXMgYSBzZWN0
aW9uIG9mIG1lbW9yeSB0aGF0IGNvbnRhaW5zDQo+PiArICBhIGNvbXBsZXRlIGZyYW1lIG9mIGRh
dGEgcmVwcmVzZW50aW5nIHBpeGVsIHZhbHVlcyBmb3IgdGhlIGRpc3BsYXkuIFRoZSBMQ0RDDQo+
PiArICByZWFkcyB0aGUgcGl4ZWwgZGF0YSBmcm9tIHRoZSBmcmFtZWJ1ZmZlciBhbmQgc2VuZHMg
aXQgdG8gdGhlIExDRCBwYW5lbCB0bw0KPj4gKyAgcmVuZGVyIHRoZSBpbWFnZS4NCj4+ICsNCj4+
ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgZW51bToNCj4+ICsgICAg
ICAtIGF0bWVsLGF0OTFzYW05MjYxLWxjZGMNCj4+ICsgICAgICAtIGF0bWVsLGF0OTFzYW05MjYz
LWxjZGMNCj4+ICsgICAgICAtIGF0bWVsLGF0OTFzYW05ZzEwLWxjZGMNCj4+ICsgICAgICAtIGF0
bWVsLGF0OTFzYW05ZzQ1LWxjZGMNCj4+ICsgICAgICAtIGF0bWVsLGF0OTFzYW05ZzQ1ZXMtbGNk
Yw0KPj4gKyAgICAgIC0gYXRtZWwsYXQ5MXNhbTlybC1sY2RjDQo+PiArDQo+PiArICByZWc6DQo+
PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICBpbnRlcnJ1cHRzOg0KPj4gKyAgICBtYXhJ
dGVtczogMQ0KPj4gKw0KPj4gKyAgY2xvY2tzOg0KPj4gKyAgICBtYXhJdGVtczogMg0KPj4gKw0K
Pj4gKyAgY2xvY2stbmFtZXM6DQo+PiArICAgIGl0ZW1zOg0KPj4gKyAgICAgIC0gY29uc3Q6IGhj
bGsNCj4+ICsgICAgICAtIGNvbnN0OiBsY2RjX2Nsaw0KPj4gKw0KPj4gKyAgZGlzcGxheToNCj4+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPj4g
KyAgICBkZXNjcmlwdGlvbjogQSBwaGFuZGxlIHBvaW50aW5nIHRvIHRoZSBkaXNwbGF5IG5vZGUu
DQo+IA0KPiBQaGFuZGxlIGRvZXMgbm90IGhhdmUgcHJvcGVydGllcy4gRGlkbid0IHlvdSB3YW50
IG9iamVjdD8NCj4gDQo+IFRoaXMgY2Fubm90IHdvcmsgLSBqdXN0IHRlc3QgaXQuIENoYW5nZSB0
aGUgcHJvcGVydGllcyBpbiB0aGUgZXhhbXBsZSwNCj4gcmVtb3ZlIG9yIGFkZCBzb21ldGhpbmcu
IERvIHlvdSBzZWUgZXJyb3JzPyBObywgYmVjYXVzZSBpdCBkb2VzIG5vdCB3b3JrDQo+IGF0IGFs
bC4NCg0KWWVzIEluZGVlZCwgSSB0aG91Z2h0IGl0cyB3b3JraW5nIGFzIGV4cGVjdGVkIGFzIEkg
aGFkIGFsbCByZXF1aXJlZCANCnByb3BlcnR5Lg0KDQo+IA0KPiBJIGRvbid0IGtub3cgd2hhdCdz
IHRoaXMgZXhhY3RseSwgYnV0IGlmIGVtYmVkZGVkIGRpc3BsYXkgdGhlbiBtYXliZQ0KPiBjb3Vs
ZCBiZSBwYXJ0IG9mIHRoaXMgZGV2aWNlIG5vZGUuIElmIHNvbWUgb3RoZXIgZGlzcGxheSwgdGhl
biBtYXliZSB5b3UNCj4gbmVlZCBhbm90aGVyIHNjaGVtYSwgd2l0aCBjb21wYXRpYmxlPyBCdXQg
Zmlyc3QgSSB3b3VsZCBjaGVjayBob3cgb3RoZXJzDQo+IGFyZSBkb2luZyB0aGlzLg0KDQpPa2F5
LCB0aGVuIEkgdGhpbmsgdGhlIGRyaXZlciBhbHNvIG5lZWRzIHRvIGJlIG1vZGlmaWVkLCBjdXJy
ZW50bHkgdGhlIA0KZHJpdmVyIHBhcnNlcyB0aGUgcGhhbmRsZSBhbmQgbG9va3MgZm9yIHRoZXNl
IHByb3BlcnRpZXMuIEFsc28gdGhlIA0KY29ycmVzcG9uZGluZyBkdHMgZmlsZXMuDQoNCj4gDQo+
IA0KPj4gKw0KPj4gKyAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgIGF0bWVsLGRtYWNvbjoNCj4+
ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0K
Pj4gKyAgICAgICAgZGVzY3JpcHRpb246IGRtYSBjb250cm9sbGVyIGNvbmZpZ3VyYXRpb24NCj4+
ICsNCj4+ICsgICAgICBhdG1lbCxsY2Rjb24yOg0KPj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+PiArICAgICAgICBkZXNjcmlwdGlvbjog
bGNkIGNvbnRyb2xsZXIgY29uZmlndXJhdGlvbg0KPj4gKw0KPj4gKyAgICAgIGF0bWVsLGd1YXJk
LXRpbWU6DQo+PiArICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy91aW50MzINCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBsY2QgZ3VhcmQgdGltZSAoRGVsYXkg
aW4gZnJhbWUgcGVyaW9kcykNCj4+ICsNCj4+ICsgICAgICBiaXRzLXBlci1waXhlbDoNCj4+ICsg
ICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPj4g
KyAgICAgICAgZGVzY3JpcHRpb246IGxjZCBwYW5lbCBiaXQtZGVwdGguDQo+PiArDQo+PiArICAg
ICAgYXRtZWwsbGNkY29uLWJhY2tsaWdodDoNCj4+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcNCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBlbmFi
bGUgYmFja2xpZ2h0DQo+PiArDQo+PiArICAgICAgYXRtZWwsbGNkY29uLWJhY2tsaWdodC1pbnZl
cnRlZDoNCj4+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L2ZsYWcNCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBpbnZlcnQgYmFja2xpZ2h0IFBXTSBwb2xh
cml0eQ0KPj4gKw0KPj4gKyAgICAgIGF0bWVsLGxjZC13aXJpbmctbW9kZToNCj4+ICsgICAgICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL25vbi11bmlxdWUtc3RyaW5n
LWFycmF5DQo+PiArICAgICAgICBkZXNjcmlwdGlvbjogbGNkIHdpcmluZyBtb2RlICJSR0IiIG9y
ICJCUkciDQo+PiArDQo+PiArICAgICAgYXRtZWwscG93ZXItY29udHJvbC1ncGlvOg0KPj4gKyAg
ICAgICAgZGVzY3JpcHRpb246IGdwaW8gdG8gcG93ZXIgb24gb3Igb2ZmIHRoZSBMQ0QgKGFzIG1h
bnkgYXMgbmVlZGVkKQ0KPj4gKw0KPj4gKyAgICByZXF1aXJlZDoNCj4+ICsgICAgICAtIGF0bWVs
LGRtYWNvbg0KPj4gKyAgICAgIC0gYXRtZWwsbGNkY29uMg0KPj4gKyAgICAgIC0gYXRtZWwsZ3Vh
cmQtdGltZQ0KPj4gKyAgICAgIC0gYml0cy1wZXItcGl4ZWwNCj4+ICsNCj4+ICsgICAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiArcmVxdWlyZWQ6DQo+PiArICAtIGNvbXBh
dGlibGUNCj4+ICsgIC0gcmVnDQo+PiArICAtIGludGVycnVwdHMNCj4+ICsgIC0gY2xvY2tzDQo+
PiArICAtIGNsb2NrLW5hbWVzDQo+PiArICAtIGRpc3BsYXkNCj4+ICsNCj4+ICthZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICtleGFtcGxlczoNCj4+ICsgIC0gfA0KPj4gKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svYXQ5MS5oPg0KPj4gKyAgICBmYkA1MDAwMDAg
ew0KPj4gKyAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsYXQ5MXNhbTlnNDUtbGNkYyI7DQo+PiAr
ICAgICAgcmVnID0gPDB4MDA1MDAwMDAgMHgxMDAwPjsNCj4+ICsgICAgICBpbnRlcnJ1cHRzID0g
PDIzIDMgMD47DQo+IA0KPiBBcmVuJ3QgaGVyZSBzb21lIHN0YW5kYXJkIGludGVycnVwdCBmbGFn
cz8NCg0KSSB3aWxsIHVwZGF0ZSB0aGUgZmxhZ3MgYXMgd2VsbCBpbiB0aGUgbmV4dCByZXZpc2lv
bi4NCg0KPiANCj4+ICsgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPj4gKyAgICAg
IHBpbmN0cmwtMCA9IDwmcGluY3RybF9mYj47DQo+PiArICAgICAgY2xvY2tzID0gPCZwbWMgUE1D
X1RZUEVfUEVSSVBIRVJBTCAyMz4sIDwmcG1jIFBNQ19UWVBFX1BFUklQSEVSQUwgMjM+Ow0KPj4g
KyAgICAgIGNsb2NrLW5hbWVzID0gImhjbGsiLCAibGNkY19jbGsiOw0KPj4gKyAgICAgIGRpc3Bs
YXkgPSA8JmRpc3BsYXkwPjsNCj4+ICsgICAgfTsNCj4+ICsNCj4gDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KPiANCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBC
Lg0KDQo=
