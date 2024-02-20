Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED26385B5D7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 09:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B12010E047;
	Tue, 20 Feb 2024 08:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="d/m+Wq1s";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="0Z/v9L4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AA110E047
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1708419070; x=1739955070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sAK1JAWMaVy25MKDlYTlF0gS6d8ov/GEA8U6p0TI/ck=;
 b=d/m+Wq1s8cgGKo4IRTGPMI39vNjmbnmBH7KeNMLVX3yphcZWtdNVtSvD
 bbyBQRDVR+DXemxxkiLetuoFn6EDuyKtrfaOCTWNOHn4wCd6d9LwkNUFG
 28P7sIFP8E2LVLo/brDskrqGcZXAkIkvKFp8IPZouRNP1oQZtqi9flUuO
 7BZ/qmFPpa7fV7odcKsOGoqPkEYyEw/uBi/nz1oifVdSORnC0y49EsAn6
 CS5Be/5utfwDbG1gS8EeV7g990FK+eyVmT7hfUtJLqierC7HHMXTLsP+g
 XiA2zs3BAnXcpIOKTpyB9BClA/NtMhQDLeqZ2BLeFBuGg65te97kN5T65 w==;
X-CSE-ConnectionGUID: rUNlUwCKR1GoB6kooNDYoQ==
X-CSE-MsgGUID: 09cAdwpQT16qKXSfXZu49Q==
X-IronPort-AV: E=Sophos;i="6.06,172,1705388400"; d="scan'208";a="183778038"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Feb 2024 01:51:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 01:50:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 01:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgxDG92Y/5PnNub9kxkVef8pe7Zgf43AUVnoSJRAuMdMFUmDUHxbOUxLIRkiy60DM8cOBMU/htv3H7XPugMw8xkBXMT7vJH7adpDo6X0UxjYZmVA4xAvWbr4yx5w8vDyj9PC5RWxFI5wnpUCFNF+t55cfOGu0X56Pxq3SjrrrdiUiQi0A5/cREdA5+dNwVAIxcG1f+e8pBRT4V0DRpp4F6OFWQPdhcRdmVwCQQhPnp3BUVH5En1sbmU7Gs1VnzvOB7l4kkbjNYU+Q9Lp3xhP4EHJHzKlCuoEZqmAh/qPbY4cAxXkGM7WcojiYRsxOoExl9xeGPtFz9/cq0Tcja51Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAK1JAWMaVy25MKDlYTlF0gS6d8ov/GEA8U6p0TI/ck=;
 b=P70NyRO/TGXPCNrjSlr+zdoZqTxSNV15ItxEgdd+JK8nnHg5yzWis0J+NelqqJ/7dyg+evreIX0zigaYUjmebfVWxslin6D63UCLbmgFvfIelFnYL/tPut66Qtat7ssXXbCv2lTPoueYZG3fo3RD2R/xGZsGVWsSTpsf92Bz/ELkvPBIi5CPLcqSkdTKAc/JeMmFSc7hi81Mjt2uSHFxA3vtmJ+mZ2SAOkHKlaClfJhtV82SyXoOoBshUHxVtd06bHIB/d60An1Qgl7Vt3FzVyMEuRlMfYY8qBWwwjZi0UUhYX2mUn/D8U6xQomfE1vyjFj1OkGWkaQ660zHS1JSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAK1JAWMaVy25MKDlYTlF0gS6d8ov/GEA8U6p0TI/ck=;
 b=0Z/v9L4SbOjSXUBLLeyc8lwYxEQ4AHFEbYZBMFh7MVixmZDGW+kav4rf5FjV+n2ZdwgZZXfv6/Wy6l5uaKSNwLlvVmcvTnh+TnOV6BimKpPlTwuH9Fp0A/OZwx95wuLknA5kb70ut2hdNZpN8Z/Qy0a1sbwABcuREB834tJt7+Gw1T/W/vBurS4L0EJwUjG4jOqFPMZQ1Z/BjrHW1OXJTlD+ET5O2xhY9oTNtfbCUAnoq9g2saQmktCbJYz07oPsMGjPZTJRZKNofniPKixiIwJUQMom2Wp5D7WaQu7i7Dpz0SuFHL948n0gpG0/4hzDexn2GilBuy1ikEBdt8KuDA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SJ0PR11MB5629.namprd11.prod.outlook.com (2603:10b6:a03:3ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 08:50:46 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7270.036; Tue, 20 Feb 2024
 08:50:46 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Manikandan.M@microchip.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux@armlinux.org.uk>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <geert+renesas@glider.be>, <arnd@arndb.de>, <palmer@rivosinc.com>,
 <akpm@linux-foundation.org>, <gerg@linux-m68k.org>, <rdunlap@infradead.org>,
 <vbabka@suse.cz>, <linux-arm-kernel@lists.infradead.org>
CC: <Hari.PrasathGE@microchip.com>
Subject: Re: [PATCH v3 4/4] ARM: configs: at91: Enable LVDS serializer support
Thread-Topic: [PATCH v3 4/4] ARM: configs: at91: Enable LVDS serializer support
Thread-Index: AQHaWbCD/RhoD50NpkiMLDNHADIcdbES/uWAgAABhgA=
Date: Tue, 20 Feb 2024 08:50:46 +0000
Message-ID: <f7dbee94-8334-4282-8b10-4b15e7f32184@microchip.com>
References: <20240207102802.200220-1-dharma.b@microchip.com>
 <20240207102802.200220-5-dharma.b@microchip.com>
 <5f1c9b8b-1e64-4b44-b7d5-a8f8136710a1@linaro.org>
In-Reply-To: <5f1c9b8b-1e64-4b44-b7d5-a8f8136710a1@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SJ0PR11MB5629:EE_
x-ms-office365-filtering-correlation-id: dc820ff1-b4c6-431d-8c96-08dc31f1079e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4o9qZ0erl3UZgs8vmS/Xst4BHkIb3KK1BM1AoZgXBfJ/8n1ROwSN3jcQf2y7F+TMTmGfGQRe/Z3chaoKklzz7KwnXD1RNtCaGImJ7Ws0rOoYXZIZeAkGlNB5lIjJfyLrKM5TY0GZL6yz9Tr4BguIInQT5wuq3O1DyFop6WlAcqFz1TxX/xK0TrT1AKoumcTnfkL0rGELLSKs4PZkKAk0kPneqfRqeOhxDZK7mbD8+NX66acCTQKghXI+MJxw4ENuMymyjdqJMH0McitAtUAlJVY6NIr0ubloYKP9VgDY0wFRw4SesIC1WxJhcQP8VTtstnE3NN0Mj4IlAg9bFGqNJFWCyXXlIggeYcKlvoxvwkfzdX9S/+4NWliX5xA3gDmEZyqBGlj0Z3dt9OLEFgKIpc9wZ1ySy/URNqoOonWAeYv2B1ZgRysIVDC4n8RU2/Ct4iw5t+DxaEQ2mVY1U6EWjDOA1/Mq5nfxjVNxFDrAHGbNyRpHx8ppHkGUYQ3FJJyZmXSGUyOHFROjcBYYbpIqfohFKWNXYq8ID5/UfmAZVbKT9tAMRfLYtu4uAT3JB+Z/wpGhUri9I+IHsX7l18zg8rqHC/tRfu4YTb9UirZP7zq5s+NMXTx9k33gJevav3GYN2rdDfPSmxgontJJw6gRCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(921011)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUViVFRHUmFja28xTmsvU0pqSTVSd3R1Umg2SzNjYlZtSk5kTGpEWEI3SEdv?=
 =?utf-8?B?L3NMWHlaaXNUWUo2SEJtcWdWWkRXaUdtdU1oNWpGUTZQNjR6c1VVZDZ0bHZx?=
 =?utf-8?B?M3dkVEhqbjFDM1paTDZ0cjNGVHJXSVdjenZtTHRzNGZFc2RsalBBSmVlUFpW?=
 =?utf-8?B?aDlwc1Jnb2M5dG1ORG1kdWtjeVQ5Qm9Ka1pQSG1tK2F3RmNSUnZENXFhbHJO?=
 =?utf-8?B?WEhkWHd1OSsxK1RNTjdzdlY1Yk5PTWcrOUpCNFFGSkRBTTdoV1NGaGNyUG9E?=
 =?utf-8?B?Nk1EODlqQjEzaVFtWll3T2x1bjljOEgveGd2NU5pT2pNQURXeHJxb3lHczN0?=
 =?utf-8?B?Q2xOSmQwV2ZMTnZ2UmV4aGNHb1BjMFB1VDlkQlZLbTJaRWpHU0hlK1UwalhN?=
 =?utf-8?B?RW1oaEN1Ulg0S0w4YkEwL2UxbFNDQ1pqYktzc1JVSW9RU013SjU5UG5hb29H?=
 =?utf-8?B?YjM5L2U2bTJWZ2ZsbjJ1bXhQK1lMczJGRXFFRDJKZGwyb0VTL3VlV211bldL?=
 =?utf-8?B?WFRxbmhORDBMUlhPeWRtQWRmak5JYmVkN1ExenhleFB2QXUrdHlpOERNQm0y?=
 =?utf-8?B?aDQ5Z2ZpOWNRZ0JkOEEwZVJFVUtQbTVsS0pXTXI0bjVRdndsd2NVdnN5V2lZ?=
 =?utf-8?B?Qi9aZDdTYjVyNk8yVzUxZWVsejlJL3NrQytnRHMrSGVRd3VOR3F5bUZuY0NS?=
 =?utf-8?B?eVdQRHFWOGJvMkM5TEhhdUFPSnV2bmNySE9Fb0NYWk1qMFJkTkpCU3NnK0th?=
 =?utf-8?B?bFNhNXg5M1M0RTI2UlVMZm0wVGowVUgvbmFuRnc1NTN0RXlOcUE3YXg1bUN3?=
 =?utf-8?B?SCs4eW15bm5iRWtJak9kd2V1Y0dUMEJVeDRacGZ2V3BXUkk0Uzk5Um5FQjg0?=
 =?utf-8?B?ZEhBbHI5aUpBeVZPajVuYklPdXc5TEF1TUlOdkxpM3NQU1AwcDFQYTNWY3J1?=
 =?utf-8?B?Z3hUR2k5eXYxN0d5bzVXc1V1aVdHQ2J2Y3BUTy9CQUFKYllZQ2l2czZKMS9z?=
 =?utf-8?B?OTBBVXZrUWRNMjgybms4Ny9IZHJFTzNHTDVrZGVRdzlBbVBBdHlmVHFCQmhT?=
 =?utf-8?B?eEtRT2orWDRmZ1JsakN2Z1VTRENhWG0zRXdvNE5QMUY1WHFCU3pobDQ3Y3hm?=
 =?utf-8?B?ZXd1Sm5CYjA0YUhnelVpN2xUK3g5eEYyM0NnOVB4dHZoT0tNZDJLQkE2NFRK?=
 =?utf-8?B?RUZNb3FHUDVvVmFRTjl2eVBOUFNvOWZUZWRjdU1HV0swYVhZVGErVEowVkpa?=
 =?utf-8?B?VU1tTmo3SGRkSStiRHo0K3FMSDVDVEJ2K3hTTHJrakwzeVd3MEZPaTBNZjVq?=
 =?utf-8?B?T2hRTFd2RkVRaldKN1FsY3gvMWhWTVJLV09JUGRLWWozUFhOV1I1OFU4MVo3?=
 =?utf-8?B?dWxUK3I5YnB5Nm95WEgwVHBOVkxPck5UVW1wU1VNRnlPNjZnTFlDVDQ0a2JJ?=
 =?utf-8?B?cSt1YWQ5OXFDL0l4MklpMW9USWpTUFB1RHc4WW5RRHkxY1AxeVdRRTY2QmF3?=
 =?utf-8?B?Tk1rNWlXanN0V0JWUmtBYkovMGIvNDlBb3NIVGFPS1pvcDVTUWNTUkg4YmVX?=
 =?utf-8?B?eDZ2YlRvWEhndzdiUGo2bUszelhtS2pzajJDNkFHRUdBdElnNThXMDQxd0Ra?=
 =?utf-8?B?c1hZSGM0Qk0wZDJheWMzQ3RjV1ZhWU1xb0RmL0lVVnBJcjJXaVZRL0ZkSTQx?=
 =?utf-8?B?ZWtiWkdveEthRjJDNzNNWUM3SHNDK0xOQ2FQNDhxRWxPT2xlRWxyeUorSFVE?=
 =?utf-8?B?TThOQUtlbjFDbDVlUmhaOWpVdmxienJWUFR3SW9CWm9LN2pEdXBLRXFReGlV?=
 =?utf-8?B?YnU5VSsvQUlJMWg1ekFBN29CMzRIUm1uRS93WWtqaWNPUklBbXBMQ2pXL1lZ?=
 =?utf-8?B?eCtiS3NRbEF6TGlQM0hCbDZLbjlhZnRoZFgyZ1lPRENoVXNDZjNleVljWGdL?=
 =?utf-8?B?K0l2MmZCalFsNStXTGp1alNLdUgraGdVaCt4RG9adDNycmt5bXRncFArTTdl?=
 =?utf-8?B?OUZzeUdWVGtwWW9JY1R3VVNUazRpZEZZeWxDZ3VkWUl1ZzVZTktOMU1tQmsr?=
 =?utf-8?B?aFlXeUU0bmRTSG1ETHZWcC90RU1YeGM4STlFYkhhQkRtWHJKUVJBVWhZbC9V?=
 =?utf-8?Q?x2jkeDzUImL5V7oAtFy8gFxAd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AFACEBDA4A6C04F96964D83418BCA0E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc820ff1-b4c6-431d-8c96-08dc31f1079e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 08:50:46.4423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NaatEK+VlW7/vM/7yvSZm66+4qL1yRzgpWXm/DnsJTkW6B7nvPJalgsIkvw/aSH6JyOYBbHPaorqSF07x7d0ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5629
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

SGkgS3J6eXN6dG9mLA0KDQpPbiAyMC8wMi8yNCAyOjE1IHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDA3
LzAyLzIwMjQgMTE6MjgsIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3cm90ZToNCj4+IEVuYWJsZSBM
VkRTIHNlcmlhbGl6ZXIgc3VwcG9ydCBmb3IgZGlzcGxheSBwaXBlbGluZS4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+
DQo+PiBBY2tlZC1ieTogSGFyaSBQcmFzYXRoIEd1anVsYW4gRWxhbmdvIDxoYXJpLnByYXNhdGhn
ZUBtaWNyb2NoaXAuY29tPg0KPj4gQWNrZWQtYnk6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVy
cmVAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlbG9nDQo+PiB2MiAtPiB2Mw0KPj4g
LSBObyBDaGFuZ2VzLg0KPj4gLS0tDQo+IA0KPiBJbiBvdGhlciBlbWFpbCB0aHJlYWQgeW91IG1l
bnRpb25lZCB0aGF0IHRoaXMgZGVwZW5kcyBvbiBkcml2ZXIgY2hhbmdlcywNCj4gd2hpbGUgdGhh
dCdzIG9ubHkgcGFydGlhbGx5IGNvcnJlY3QuIFRoaXMgcGF0Y2ggZG9lcyBub3QgbWFrZSBzZW5z
ZSBpZg0KPiBvdGhlcnMgYXJlIG5vdCBhY2NlcHRlZCwgYnV0IHRoZSBvdGhlcnMgYXJlIG5vdCBk
ZXBlbmRlbmN5IGZvciB0aGlzIG9uZS4NCj4gVGhpcyBzaG91bGQgZ28gdmlhIGFybSBzb2MuDQo+
IA0KPiBJbiB0aGUgZnV0dXJlLCBwbGVhc2Ugc3RhdGUgY2xlYXJseSBkZXBlbmRlbmNpZXMgaW4g
Y292ZXIgbGV0dGVyIG9yIGVhY2gNCj4gcGF0Y2ggY2hhbmdlbG9nIChzbyAtLS0sIG5vdCBjb21t
aXQgbXNnKS4NCg0KVW5kZXJzdG9vZCwgVGhhbmtzIGZvciB0aGUgY29tcHJlaGVuc2l2ZSBleHBs
YW5hdGlvbi4gSSB3aWxsIHRha2UgY2FyZSANCm9mIHRoaXMgaW4gZnV0dXJlLg0KDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywN
CkRoYXJtYSBCLg0KDQo=
