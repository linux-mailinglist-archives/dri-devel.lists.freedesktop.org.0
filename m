Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6F8841C14
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 07:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA5C10E388;
	Tue, 30 Jan 2024 06:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D154810E2EB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 06:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706596961; x=1738132961;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ggGw9faE3lQ5xKuVx3BPBeh63/KsS72wsYlBFL4FBDI=;
 b=sesY1AZWIsFdTcRc7F66GmKcyCbiNyDqQTf8r01xaI9hhCt/TWmAPQjz
 2jo2Sbj9X+nIbR3pVOzQ+X1CLwSiddbiqXxwqItVRFLv+Iiy3SqLyjKrS
 J3WzrAiZpYioFu3bIDIpTL6JMVtXg6HXgPGH1958kLD4kDGlgShxeuGWz
 imPJHtc4lvWofdzGFVWlkSwC0NyWpLKdi6CyC029nhWzty3M3wznlo64o
 VjBMA82tftsq9/USiLyipoDDYfwsXNp1Hc6O5grruq922vB9oaIQpr/g3
 F0I05MXgI+sBJVuVxigqHG+Ps9zvbflj8ijH0ID6cXn7w2rpw+h+SqZnC w==;
X-CSE-ConnectionGUID: mod48umKQyKy0ELWJkcR5A==
X-CSE-MsgGUID: N2qTpJtVRdadh03IUSxo9A==
X-IronPort-AV: E=Sophos;i="6.05,707,1701154800"; d="scan'208";a="15482769"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jan 2024 23:42:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 23:42:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 23:42:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxBOsY37n2RK0lycEbIDeokSXloOG945cf0qbYF6KYxkLdMlB1PDJ5oUUodU7U7IQtFrH8KeZ+jpGBPM/qOHhHu0iZQmRpV57vpDcrijc1RZSKC36fGu2E7cEBAIrLW1Xl5yHX+Ykx5n/crg+9IpHDrpY9HViohTVRWVNeisL45z6Lc004P4uUHUYTfXUPs6SxPCsNoF3akq0Et+ZJaPSGWhL0KwpwCYetf7VRMrG0TffavtE3t61YrYGHQNbQsD325VoaDwSWWfiP74cKGrnh3XDWRtnNuitP3/Plf5wIuzEiVYHbT8Mj7GDURmkLBNeZvMzLGzA9RF4k7hKR3vOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggGw9faE3lQ5xKuVx3BPBeh63/KsS72wsYlBFL4FBDI=;
 b=ivAQmM61X5qISgl/YT0Xb8ALfHuwRftcrLY72yIMsFhW/Vo0VZAFmmPNZoDy5AO8PMQn2xUVAwPgXFYynntu/3ySznraz97i8ebOzymQCm4R7FFRYp5vzp8fYOEoMSxWTnQ12ZyAK7SJ/lUwLEwv/bmiTlaCHsr01+dChyDaNMsMRUYZ3RvLL4TIvEgJbkWJGqW/8Kk7fo9ejeBCUrorcVp3sHdTKYfmJcwcWwnEAdLXn4hJAJv7SdP/xp+4o3qWRbcMHe9Ilr+GM0JmQIXDwX6PyDc7oq1yFf7V7Xfp+jxclalGwif77HZjuF0wLtVJdVfCgAeeiMGJIyF8qI98rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggGw9faE3lQ5xKuVx3BPBeh63/KsS72wsYlBFL4FBDI=;
 b=3ArxuC840Szw4U1gfTUOlcTfpsBcXz3eIaJKWcqH0CtpsbdfDMtUuAdpsgAWUKbPi073bEAnsvndCy80Na1A2lQea5fA76eqA13V3putExJG9GZZtv6TDo41m24FvfoR8QVpx6BhNmK27xOc5k1vCGdC/x82fqeTDCIwpRkaZODdxzhE1Bh0uyw3otO0gKUWlirsAtm0XsRJBRJdeO4KyFUJ5pnU8YETv0y0u6kIDZJHGL+619yQqR7R5lrmbRA9uFst2vboTqnsIAgIyyUAHF1bxUQq117wrc/XcDX63xcRGc5hcZClrKBKV0cbq+w2SGdH/noQckFM91uRUsdYxQ==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 06:42:04 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 06:42:04 +0000
From: <Dharma.B@microchip.com>
To: <conor@kernel.org>
Subject: Re: [PATCH v4 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Thread-Topic: [PATCH v4 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Thread-Index: AQHaTqw0q4W9m2h7Rku5SGb7zc2nKbDpKt2AgAjGqQA=
Date: Tue, 30 Jan 2024 06:42:04 +0000
Message-ID: <6eb0a63e-8619-40d0-b76e-4bcf7094a9ab@microchip.com>
References: <20240124100019.290120-1-dharma.b@microchip.com>
 <20240124-portal-sputter-f5207ac206ee@spud>
In-Reply-To: <20240124-portal-sputter-f5207ac206ee@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SA1PR11MB8521:EE_
x-ms-office365-filtering-correlation-id: 7558a3b4-f4c0-4ace-376e-08dc215e923f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r5qsW6cg9iC/KNtwK8ah9VdLyUBUAegxDrvBwbYMiPLMWMpcSfrAQkG9OeA3bcAGXn0d4SmWHL+V8BohxyqOD3Jf6Q737UYziHHulgCH4Fhp4DUGwNuEm2KmLzGX508yenaLo0LwA/DttAVxNnMqbADUywviE5o37tWIAnMpVtRLb+GrTnpyKNQ0/dcWHRMnBhfUlBZp5eL6Tv1ABb8OABRFmQ6zELz5rGES6VHIyAxINO7/PJ2n1UzT7DGb3PDCG7NXvOnPZrt6ScXzovEY6E4eHOHl28I66PC7B6C391DSIAogkWlp9pkGESrHx9WJvxr6rZLZHZLhOmimv7Op6jyC5lqV7AgrPKjRCK34O2243KzRva2dH+K+PiFPudKwXXzM+hMDjo1HB9JxmMIR96uAVFviGN6hTZhHJWleODmGG6kJTt+vKER2zCSl3a/Hw6byKuVQ5dari/lARF+g4go9Nti2V1KM8qlihAczqjmJqZw8Sx12QnWYSivBzi/tWCaNQfSVyMCLxqy5PTqxmKdlQz8BbRTOYLrd8UhAAiu/RrRl/4yt9e/yPbdmkLSJvBizQ+Ntz9+FzhAXVYWsHIZmE2NxlFxkQNx1/cLkBmYRSGijMMU/+/9st2tZ0PSsbboMDZPSZFq5vGWwXQ7QIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(122000001)(71200400001)(478600001)(86362001)(6486002)(31696002)(91956017)(38100700002)(4326008)(6506007)(83380400001)(5660300002)(2616005)(53546011)(6512007)(26005)(7416002)(54906003)(8936002)(66946007)(6916009)(66556008)(316002)(76116006)(8676002)(36756003)(2906002)(31686004)(41300700001)(38070700009)(64756008)(66476007)(66446008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWN0cVE1eW9qbUJKSlpZODVGV0J6ZzVFTFRGR0JJK1dzcU1zVk1XWnV4SWJR?=
 =?utf-8?B?U1JFeUx6dUNldFQzOCtWZ0JjQitsMlJPbzdsQnN4VHAzZjh1djRQUHdUVlR6?=
 =?utf-8?B?RGJqVHJCbzZ0TTR0QjBtVXordWJRUkpHaEx2RVRqUjJPSWxVaGx3Wllvb0JX?=
 =?utf-8?B?THY0NXdBTXpnL0RnZW5Ia3MybTlJb2Z2cjFNaW9XWHFlYjlWRU1sdWRuZnly?=
 =?utf-8?B?Nm9NRDlqTDFrdlYzVjZzeFV5ZTRub2RZY1hDZkcvYytxZTd4T29xMzhSTWRo?=
 =?utf-8?B?NjY1YnNuWlZXTTJzZDZRMm44NFZ1TGVsR2lYcnhGSXJyVzUydHZXbUVRVFR5?=
 =?utf-8?B?cW9sMU9OaUZKL0xvb1g0MVRlYk11VDB3RE9DY0pKYmx2RkpoYzJhTHprMDBS?=
 =?utf-8?B?Rll1U0FZb1QrUWd5V1RJYWtNZTdMWEcvUXowT0UycTg5bTlzSjNkODJpN2Er?=
 =?utf-8?B?OVVWUVFYd2gvM2U3S2d6Zjd0T3BpM1hOZEs4dDdabzhMTS9QQW5zQVdjYjhy?=
 =?utf-8?B?L1R4bFVQR3Y5cjMvVzMzT1FaMXpzdkJ1b2lIc3Y1TG5aVW13Sk1zbWlrTnlO?=
 =?utf-8?B?cGFmRG5icERqUFpvRnFSUkdYaDBXQzZ4LzNFcXM3aUgzTTF6RThxcnM0eGVQ?=
 =?utf-8?B?RHNxM0Q2OEoxbGNMdDhheGNiZGdkRkhHRUJyMDFBR2x3ckxTS0IxdDFyalVl?=
 =?utf-8?B?c0pwRW9La1VGZlRwL2NoclgzNzZmYmxXQlJ3K21WaERJL2F4Qy9lQTRDZVVo?=
 =?utf-8?B?WlBWeGVvYktUN1JWbVFpRFErbE50ZGtIRk1aTU9KdlAxUjZqcmlGK3VXenBG?=
 =?utf-8?B?b3RJaFE1RENpK3VGd2NGVDl4RWQ2Y01LWEY4eDBlWUJhUkE1dHdTb1FkZEts?=
 =?utf-8?B?bUVqRjVNK0tFd0V2cnlhU1Nua085N2hxSEhyK0F6cUJHSzBFV21jSUhkeWJ4?=
 =?utf-8?B?cEtNOWNhVjRlRDFxWGdEZERrdzU3cElpWEYzSHpYSGFnRHhjR3I2K00xSWRy?=
 =?utf-8?B?SUpBcHJjdk04Z2V5MUs5ekNLSlcrOWpSdThFcDdtdSs0eXMwQnVpMUt0Rk5Z?=
 =?utf-8?B?QVl6cVpsU3lKbUNmbkJCNEpoRXg2cXJyUWhqVGVEWHYvaUdvZ2YzWVM3ZXh0?=
 =?utf-8?B?SkFlQjFVSDVuMWpEQWV3UUlIeTZzeG8yYkxQMG03TjlXbDdCTHB5ZEpuVjl0?=
 =?utf-8?B?NGRrZy9OZWlocXVYOVh4YVViMTZUeEwzREZnOUx2MWxjOUNBU0t5UThiMThK?=
 =?utf-8?B?dkhxdnpoOVBUNXFBUjRtckVub2JNT0I3MmEzVHZrdG1IaWdudGp5NWJ2eXgr?=
 =?utf-8?B?VDdTSlQvdVg1M2dnOWo0NE15SENOUHFxTFJsUG5qUE5XS1Z5YWRpTDFzODRw?=
 =?utf-8?B?R3lrZ1dtd2g2Mmk0Z2NkZzJUZGJsaFpCU0pkWDNTdEo5eGRsblU2b2VNSHJ5?=
 =?utf-8?B?STBMNnNZRFUvMnJCUnNsTk92MUtzZUJldFg3SDdpYVpjNTl6OVdPZlhEUU9C?=
 =?utf-8?B?OXkvcnlFOWRjdE5jUlF1dCtDTVZsME80Qzk2Y2Vta3pMTXFEZWRlaEhUY09y?=
 =?utf-8?B?bWo2RWxaY2xsTFZHSTAwc1BLY2pUTjh4SWd1TlBmVzQwYWRIb0RWZlo5cEJt?=
 =?utf-8?B?ajRSVVZ4UEZvVHBJZk1NQ3IwOVZDOHZ5Nk1PWkxlRk1uZy9HdmhKOXNuR0s5?=
 =?utf-8?B?V0hqeFhoZEU2SlRucjdVRmlKaDAvdGhTMDZwKzJTdEdJdFRrUnJLWnZQTlRG?=
 =?utf-8?B?aUE3bkxzNTFqd3E2Y0pZaS9hRE0wMGlxUUNpZndLRUVOVWpabHVFSXR1elVs?=
 =?utf-8?B?ZWtSb3p2dFhiL0xsLys2eXRHSVo0MzFSWWh4YkRrTmI5MWViR1A3VU43blQr?=
 =?utf-8?B?cEpQR0gzSmU2RkFTUy9JUWJvZEZ0ZTkxcForRnVIdjVOajZhNGJFbzl0bDB3?=
 =?utf-8?B?WTJmR3g4Y01Cai9XK29ZeS9iTjZYaDZ3MUtSR3R4OGx2dXZUaW1Tb0ZzR0xS?=
 =?utf-8?B?M3lTc0xIV3NkalRaN0VMdDhkOUN2aDNrVzZyWjhkOFpoS0tSOExDVVk4Zko1?=
 =?utf-8?B?ZmRzcWsyRjY1OStDb2ZMellrblY4VlN2RFoyNzdmZ1ZEa3hPSkc1Y0FCbWth?=
 =?utf-8?Q?H0AGkWkGt9ux0WXyXpQs+i+7J?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C46DB54299EFD64CBF0D661BFDE7BBAC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7558a3b4-f4c0-4ace-376e-08dc215e923f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 06:42:04.3399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYfz2+rNrUTeIzb0j/Fr9evP5tKLsUSHURVNsssADeFPLxoA9KBxKbLwWcdxMtBYjMG9xVh+5Qn59R6rnYq8HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch,
 krzysztof.kozlowski+dt@linaro.org, bbrezillon@kernel.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, lee@kernel.org, Nicolas.Ferre@microchip.com,
 mripard@kernel.org, claudiu.beznea@tuxon.dev, robh+dt@kernel.org,
 thierry.reding@gmail.com, alexandre.belloni@bootlin.com, tzimmermann@suse.de,
 u.kleine-koenig@pengutronix.de, airlied@gmail.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ29ub3IsDQoNCk9uIDI0LzAxLzI0IDEwOjEwIHBtLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFdlZCwgSmFuIDI0LCAyMDI0IGF0IDAzOjMwOjE2UE0gKzA1MzAsIERoYXJtYSBCYWxhc3Vi
aXJhbWFuaSB3cm90ZToNCj4+IENvbnZlcnRlZCB0aGUgdGV4dCBiaW5kaW5ncyB0byBZQU1MIGFu
ZCB2YWxpZGF0ZWQgdGhlbSBpbmRpdmlkdWFsbHkgdXNpbmcgZm9sbG93aW5nIGNvbW1hbmRzDQo+
Pg0KPj4gJCBtYWtlIGR0X2JpbmRpbmdfY2hlY2sgRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy8NCj4+ICQgbWFrZSBkdGJzX2NoZWNrIERUX1NDSEVNQV9G
SUxFUz1Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvDQo+Pg0KPj4gY2hhbmdlbG9n
cyBhcmUgYXZhaWxhYmxlIGluIHJlc3BlY3RpdmUgcGF0Y2hlcy4NCj4+DQo+PiBBcyBTYW0gc3Vn
Z2VzdGVkIEknbSBzZW5kaW5nIHRoZSBQV00gYmluZGluZyBhcyBpdCBpcyBpbiB0aGlzIHBhdGNo
IHNlcmllcywgY2xlYW4gdXAgcGF0Y2gNCj4+IHdpbGwgYmUgc2VudCBhcyBzZXBhcmF0ZSBwYXRj
aC4NCj4gUGxlYXNlIGdpdmUgZGlzY3Vzc2lvbiBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiBzb21l
IHRpbWUgdG8gY29tcGxldGUNCj4gYmVmb3JlIHNlbmRpbmcgYSBuZXcgb25lLiBJJ3ZlIHN0aWxs
IGdvdCBxdWVzdGlvbnMgYWJvdXQgdGhlIGNsb2Nrcw0KPiB0aGVyZS4NCg0KQ291bGQgeW91IHBs
ZWFzZSBnaXZlIGEgZ3JlZW4gc2lnbmFsIHRvIHByb2NlZWQgd2l0aCB0aGUgdjUgcGF0Y2ggc2Vy
aWVzIA0Kd2l0aCB0aGUgZm9sbG93aW5nIGNoYW5nZXMgb25seSBpbiBQQVRDSCAzLzM/DQoNCisg
IGNsb2NrczoNCisgICAgbWluSXRlbXM6IDMNCisNCisgIGNsb2NrLW5hbWVzOg0KKyAgICBpdGVt
czoNCisgICAgICAtIGNvbnN0OiBwZXJpcGhfY2xrDQorICAgICAgLSBjb25zdDogc3lzX2Nsaw0K
KyAgICAgIC0gY29uc3Q6IHNsb3dfY2xrDQorICAgICAgLSBjb25zdDogbHZkc19wbGxfY2xrDQoN
Cj4gDQo+IFRoYW5rcywNCj4gQ29ub3IuDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFy
bWEgQi4NCg0K
