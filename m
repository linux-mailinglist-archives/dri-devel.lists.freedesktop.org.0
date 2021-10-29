Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3543F7C7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 09:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72756E9F7;
	Fri, 29 Oct 2021 07:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2109.outbound.protection.outlook.com [40.107.21.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A766E9F7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 07:20:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsoAitDnQCctHQCkxr7CNeQE/+1oERka+y0gP4Mh5S0/axFV+QPL/J7KCDOMScYFQ6ozbcCzkWf9kGF5elKqcWCZnXMfW6+urVk64EoXl2uAVGfxBl8zgW+qsZdX3z4KttA4AC+nySK5jYkGz6tHpaJ+1NXmasmzIlOtCg9zNEgFPuTQQwCwmaWf+vRrNuBpZp4PyeK7FXJ1/WRw5ChzQrEwsIMwZMaht6o4mp+nIOdLreItBRRr4OYw5PCMO0eSc0kth8yxBafQ6q4zPHYACZ5lakKmtDkmKDLey+oemigjvUTSbpYLhqHRpkHCtmLFg2igsF4rtfyIvRrOQce6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+93QNoUCrpY1EbZ7cPe7zjABwhbhayzC3Ds4U0pix14=;
 b=XyDo40Cp07Wy2lOqLA60WTTcGL2UM1tfho6LmETlZeWuDMirOUNxunXkfm7/Wm+L7bZRgumjKmcgQFn6j6qalN4sSbsZ9w923HU2ynDKUGN4K4d23cHX2McDmQj2tHx2vL9YFp0EvJV8VcXZkELxgGtQHiNH6NWXrLWw5uOAwQKLhUeqY/rueHEr5K7nb01t0LaS5i1ughnoV/JzFL8ay6QzN3LasHGOOdvaxsqvqR2BSncWnw1niMjht28QRJt7b5W0it9LHg0iFvPhjhaJ7260P5eKjpqdSfg4rbRFcKs/7oK3hpbMAtC9P8KsbS1g3HB96yPWnfcaWRao6UAotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+93QNoUCrpY1EbZ7cPe7zjABwhbhayzC3Ds4U0pix14=;
 b=PV2bnLwaj8/TSk5b8eNKEEWo0wPJOkfY6eAYL/H7IXpZcgEr3NwqAI58HAEAvW3go/37WjkaD5mOfbF3c8q8tHJ78glmc7vto2wPzKjFmLB1aQeY06mBlFks2EFJl+RoUPWH2RWv0alYC2Wdmt1MeH4Q8L/0sYUXtEdq18cq0A0=
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com (2603:10a6:10:55::32)
 by DBAPR05MB6982.eurprd05.prod.outlook.com (2603:10a6:10:183::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 07:20:00 +0000
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::91e8:e960:243:da70]) by DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::91e8:e960:243:da70%5]) with mapi id 15.20.4628.020; Fri, 29 Oct 2021
 07:20:00 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org"
 <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "airlied@linux.ie"
 <airlied@linux.ie>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "lkft@linaro.org" <lkft@linaro.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
Subject: Re: [PATCH v1] drm: import DMA_BUF module namespace
Thread-Topic: [PATCH v1] drm: import DMA_BUF module namespace
Thread-Index: AQHXy0b0gZ5pUr/KX0G6WBvl+vAPP6vnKucAgAAoL4CAAW50gIAA0quA
Date: Fri, 29 Oct 2021 07:19:59 +0000
Message-ID: <16172209beb3bd1f0f5494c829e275449e532224.camel@toradex.com>
References: <20211027152534.3366799-1-marcel@ziswiler.com>
 <77d1966e-3081-10d3-d7a8-c159b62004aa@suse.de>
 <0f90b5da6139316429363fc14f76e96366f4a4b5.camel@toradex.com>
 <e5b4681a-36cd-20ba-c763-c4ff00732eb4@suse.de>
In-Reply-To: <e5b4681a-36cd-20ba-c763-c4ff00732eb4@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 400d9dfa-1934-4161-130e-08d99aac84ce
x-ms-traffictypediagnostic: DBAPR05MB6982:
x-microsoft-antispam-prvs: <DBAPR05MB6982A6BCC9D693B91A88B24BFB879@DBAPR05MB6982.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ru/9lXlx9C4JEozgGNT+HZ370xW5WPS4Y20bjTYtkIxBiMKBicQfe9d2tWpzIUxWLJFq0ncqruFsqRQD+/TIFDiZLoyZthI2vugpTVks2nLITm5CfGwewmXyhzRymNs5gpgWxIfJVEDbQlvqEug1UlQNkv6LZLDFq0DiyVYGvGVZrDGeSoJ0lKLOrLKRw67fAk2p8X/VyKAx1RRB16xfbZUyHgMGvtApFu1JM0D6zE9BVQwRMgQKyQcyCGisc0B4xUrkBqyl8EWHrHRoMl42sUWTsrLwzWf/X1E2M2736QaHk32ZjdRPd67FHjPZfTEbQUbIAbaXRDTUT6N3LCTWcWTKhK20TKHRz5rWutile1JGvbJOuNRiRym30e6ZJTEaIF2ye8rKgl3oSgRyml9L+Ehcndc42QCmCOprt35JTFti3v2Z7oz+7QuDR9+GZjuBELU6gqicYN412tZOK6anGAiJ2JqS+5Ei/N0jGegzW3aRtRqPOEi2teZi2mtrKwHIDnUAW9Q5VKQAry03aJYB3/XVOgDhBseRawhNRmrYJrCp9RJ0OVSr70hU9rHEohFr3ireJpvynsffhlgpT4tScscMhwGAXxXS7Bs0fKEAs1j1yHp/fM6qUlPpCCK2zKfAu1baZCz9wRUTiIqVr0BLmOcZv14pdjaQUAn7UwMDrA4Pwe4ZewkZqE+wF+tnopVj7fALMEErsnY960/RwrQCnqVMVcoK+u0sKQzUgoBq1YcupU419aGUb/XRHRFSwd1A8U2iGDuDZoQqpLsqTGWUrG/+Z8yJrYTXNSqGEK/CC8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR05MB5431.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(186003)(71200400001)(26005)(2906002)(44832011)(66446008)(66946007)(6512007)(8936002)(66556008)(76116006)(91956017)(66476007)(64756008)(83380400001)(6506007)(54906003)(5660300002)(8676002)(122000001)(316002)(4001150100001)(66574015)(36756003)(38100700002)(38070700005)(4326008)(508600001)(966005)(110136005)(7416002)(2616005)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXFwWWg0aVQ0VU9SazNWU21IYURndTU2M0hac3pFUXc3dFhuSHIrK3RhbENn?=
 =?utf-8?B?SGNmcjlhZ085T0JhcW1DOGROQkhnODAwUTZQWEtMTlZJSVExaWJXQ0UzN3lU?=
 =?utf-8?B?czhYcDk2bVhMSGEwak9lUnVVYlY3Qy9xSHJCMjZsYTNPNFh2RlloOGhvK3Ay?=
 =?utf-8?B?K1NEc1daTUZPbGZ0dzFwNllvMFc0dDRJVWpBY0tZUHFobFdDRGtwR01BT2o3?=
 =?utf-8?B?TzVEWUhKQk9JZzI1WExROHJyemxCRWxDWnZldUZmMnM4dzA0U0FjZ29yOHZK?=
 =?utf-8?B?b3ZtRkR3Sng4cHltZ2lrTnUrQWlaRGtSOGdLVE9WRGd1RkNvc1F4VWNlV3U0?=
 =?utf-8?B?MzRGcFl6ejlnekhqZWxncHR2UWVjZVYzT0pPUnBjTkp1MTk3emVDM05kU2VD?=
 =?utf-8?B?MlgycVZCVHBVbEkvRmlYS3JlZ05zSmZqRTVlTlNHN0tGMWQxTmNNcG9OOVVr?=
 =?utf-8?B?N25MamR1SWxuRE5UWUZENExMc29pQWowb0V3REJkdFJpUFhNYXpBb2VmYXN4?=
 =?utf-8?B?UzNRTzk0VGdoUDdKTGYxR3RqbUJUSTFQNDBiTTYwVGhoa2JEN3dDWGFlc2Fy?=
 =?utf-8?B?T2hkV25USFhyVDVZenc3dE9WSkdaa3NxSFNNeElRV1gxSnY5Q0ZxeWlQOUEx?=
 =?utf-8?B?ZjRBbmp2YmN2S1VhZDEwckJwdnRXeFYwVlBqV2tQOTZ0VEJnVGk5ZGIwT3Fo?=
 =?utf-8?B?M2d5SlNVS205TnBTSytZa2J4YUVnK2xEcS9udmVLQkpiRHd3NysxaHBYVHFD?=
 =?utf-8?B?NGdjeTNBUnp5ejlzWGRST2txTHl5SzRzd3FlL0F5bmNzWThoYVJpeUNxck1i?=
 =?utf-8?B?c1J6VXVVWHlvRjlqNkV2WlROcGhqc0p1cTZEaUxMM1BYVHBzMHllc3UzV2Fn?=
 =?utf-8?B?TW5DTnh2MTNzRlRJT3Zsd0gyY1VFUjBIeTk5bE8wcEMrZkt3cXhDUkdiS2E4?=
 =?utf-8?B?TzdmMXp6eHZWdzYwSENOMmxQbmZmK2hWU1p4Vnk0UVB3MGY3bTdFTkxYb2pR?=
 =?utf-8?B?dm9rZTJqaXVVRXh0MEhveVFGaDhwWGdUWFlkb1hMbEFPM2RDR01zVXBXWjZh?=
 =?utf-8?B?VmViMU5ZK0V4ZjZYWHJJNXpKbFBLbDFsRDJrNGN1aE9mOStvSEw0aldmM1d3?=
 =?utf-8?B?U0I1b1ZybmpDTmpJclNpbnE5aEhLZ1V6a1B1L3YvNWlCWWRSU0kzazNoNWkw?=
 =?utf-8?B?WThVNHhjSFd0Tkp4VzlEaytkYk12NFZjWkhtYzcwRTZjcnAyeForeFE5c292?=
 =?utf-8?B?bjIzeHU1N1VudkRGTmljaHA1bGh1STJyS0RtNVhkck9nL0UwV3hvVm54Ny9i?=
 =?utf-8?B?dHRPTDZOS1ErYUxzdEkydU9rQzFWazFqd1RFN2VxSWxETURsdnRueXpDWGwv?=
 =?utf-8?B?b2hwcmlXa2daTmtjRURyQlBId3hneFp5c1RXY2FWSVZIQjhvQTFRVzRSdGJF?=
 =?utf-8?B?TWdBNTdTaVkvN21SZmNXK2FKRlhRNXFDWjVlMTlmaVJWSkNKOG1RK1FkK2U4?=
 =?utf-8?B?dlFoNG9KWTdxYzlNUHlsN0pwRTMzTElURUxMc1N0MnFRaDlzL1RZem1oNWs0?=
 =?utf-8?B?ak92eTBkbHJ2S2Z3aWtjSjVtL1dXQWxmZzVQTVkvenhHTTBsVlhlUFg5d2Nm?=
 =?utf-8?B?L2JTZWgxeTZMYTNkcjFucWE4bWZBck9CREVRODBGNHVQYWpnQ1IxY3RJUWh4?=
 =?utf-8?B?bnZva244RWdBZUlKSkM0UjBpbkRWMTR2MjdYOUQxZTh0OVdLMExOUjBtVFJG?=
 =?utf-8?B?OXF2aFppK0M3VmZMZWYyVjR3WlVrWWZHUVlYcVUrSHBTeUZsWUhhUTM3Vkwy?=
 =?utf-8?B?WitzWFJnQUM1VFFhd1RhWGd5dlZhVDExeDhYbVAyc09CQllwQjVxTE9wRHgv?=
 =?utf-8?B?a0xVV1hvSVZVUStIM1FBY0ZTM0hOR0hPK3J1MlZGZXY2eStxVGVTNUdhSlNX?=
 =?utf-8?B?MTZsWmdlL2lQamhGMDV3Sm9malNVQzJXTExrSVpmVjNvWk1HakI5bEFtRXMy?=
 =?utf-8?B?NGZZbTlTb25GRTNSRGs4dnJrRmZ3aGVUWlpWN2FpUlNrM3UyRTU2UUVmTDZS?=
 =?utf-8?B?aWlsdmRZV3N6NU44b0QvaURqeW5weGlvOU9LWTJMNFNaVWdyQ01HeTVMVVBa?=
 =?utf-8?B?SEhyVjV0ZnQ1S2g5SXQ1UFpKQ0tQL1REaWd1dHRVTWJ0M09iNDlXeEl3dzI3?=
 =?utf-8?B?eC9yNmd5Vk0xdUxjWGNTNkwvSmtiT1VMSEVmaE4vek9GbGpEblF2WnFpRmtr?=
 =?utf-8?Q?YsOrkD3NH36F6x9/jNTcQmpeN8Uzu/kJewc1tGMolI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E83AE4168BF55444AB54F504BFA2EB35@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR05MB5431.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400d9dfa-1934-4161-130e-08d99aac84ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 07:20:00.1396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oh+r0iv3hWxOduAK+Ywuz1fLh5NnujJVWl6iffs1JmT4F+SVv9LXlSbG3L5tlE9PEyh28q8rnzkmQMYg+5JebhYo2leYSW4fQ8U5iSBKi5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR05MB6982
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

T24gVGh1LCAyMDIxLTEwLTI4IGF0IDIwOjQ1ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGkNCj4gDQo+IEFtIDI3LjEwLjIxIHVtIDIyOjU0IHNjaHJpZWIgTWFyY2VsIFppc3dp
bGVyOg0KPiA+IFNhbGkgVGhvbWFzDQo+ID4gDQo+ID4gT24gV2VkLCAyMDIxLTEwLTI3IGF0IDIw
OjMwICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4gPiA+IEhpLA0KPiA+ID4gDQo+
ID4gPiB0aGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gPiANCj4gPiBZb3UgYXJlIHZlcnkgd2VsY29t
ZS4NCj4gPiANCj4gPiA+IEFtIDI3LjEwLjIxIHVtIDE3OjI1IHNjaHJpZWIgTWFyY2VsIFppc3dp
bGVyOg0KPiA+ID4gPiBGcm9tOiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3Jh
ZGV4LmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IFRvZGF5J3MgLW5leHQgZmFpbHMgYnVpbGRpbmcg
YXJtNjQgZGVmY29uZmlnIGFzIGZvbGxvd3M6DQo+ID4gPiA+IA0KPiA+ID4gPiBFUlJPUjogbW9k
cG9zdDogbW9kdWxlIGRybV9jbWFfaGVscGVyIHVzZXMgc3ltYm9sIGRtYV9idWZfdnVubWFwIGZy
b20NCj4gPiA+ID4gwqDCoCBuYW1lc3BhY2UgRE1BX0JVRiwgYnV0IGRvZXMgbm90IGltcG9ydCBp
dC4NCj4gPiA+ID4gRVJST1I6IG1vZHBvc3Q6IG1vZHVsZSBkcm1fY21hX2hlbHBlciB1c2VzIHN5
bWJvbCBkbWFfYnVmX3ZtYXAgZnJvbQ0KPiA+ID4gPiDCoMKgIG5hbWVzcGFjZSBETUFfQlVGLCBi
dXQgZG9lcyBub3QgaW1wb3J0IGl0Lg0KPiA+ID4gPiANCj4gPiA+ID4gUmVwb3J0ZWQtYnk6IExp
bnV4IEtlcm5lbCBGdW5jdGlvbmFsIFRlc3RpbmcgPGxrZnRAbGluYXJvLm9yZz4NCj4gPiA+ID4g
Rml4ZXM6IGNvbW1pdCA0YjJiNWUxNDJmZjQgKCJkcm06IE1vdmUgR0VNIG1lbW9yeSBtYW5hZ2Vy
cyBpbnRvIG1vZHVsZXMiKQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJjZWwgWmlzd2lsZXIg
PG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IC0tLQ0KPiA+
ID4gPiANCj4gPiA+ID4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMg
fCAyICsrDQo+ID4gPiA+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+
ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYw0KPiA+ID4gPiBp
bmRleCA2ZjdiM2Y4ZWMwNGQzLi42OWY4NTY0YWQxMWNkIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jDQo+ID4gPiA+IEBAIC0yMyw2ICsyMyw4IEBA
DQo+ID4gPiA+IMKgwqAgI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaD4NCj4gPiA+
ID4gwqDCoCAjaW5jbHVkZSA8ZHJtL2RybV92bWFfbWFuYWdlci5oPg0KPiA+ID4gPiDCoMKgIA0K
PiA+ID4gPiArTU9EVUxFX0lNUE9SVF9OUyhETUFfQlVGKTsNCj4gPiA+IA0KPiA+ID4gQ291bGQg
dGhpcyBsaW5lIGJlIG1vdmVkIHRvIHRoZSBib3R0b20gb2YgdGhlIGZpbGUsIHdoZXJlIHRoZSBv
dGhlcg0KPiA+ID4gTU9EVUxFIHN0YXRlbWVudHMgYXJlPw0KPiA+IA0KPiA+IEhlaGUsIGdvb2Qg
cXVlc3Rpb24uIEkgd2FzIGFjdHVhbGx5IGFza2luZyBteXNlbGYgdGhlIHNhbWUgYnV0IHF1aWNr
bHkgbG9va2luZyBhdCBhIGZldyBmaWxlcyBhbmQgdGhleSBhbGwNCj4gPiBoYWQNCj4gPiBpdCBh
ZnRlciB0aGVpciBpbmNsdWRlcyB0b3dhcmRzIHRoZSB0b3AuIFR1cm5zIG91dCB0aGF0IHdhcyBy
YXRoZXIgc2hvcnQgc2lnaHRlZC4uLg0KPiA+IA0KPiA+IExldCBtZSBsb29rIG1vcmUgY2xvc2Vs
eS4gQ3VycmVudCAtbmV4dCBoYXMgZXhhY3RseSAyMDAgZmlsZXMgd2l0aCBhIE1PRFVMRV9JTVBP
UlRfTlMgc3RhdGVtZW50LiBPa2F5LCBzb21lDQo+ID4gb2YNCj4gPiB3aGljaCBhcmUgZG9jdW1l
bnRhdGlvbi4gQW55d2F5LCAxMzIgb2Ygd2hpY2ggZG8gaGF2ZSBpdCB3aXRoIHRoZWlyIG90aGVy
IE1PRFVMRSBtYWNyb3MgdG93YXJkcyB0aGUgZW5kIGFzDQo+ID4geW91DQo+ID4gc3VnZ2VzdC4g
MjAgb2Ygd2hpY2ggYW5kIG1haW5seSBEUk0gc3R1ZmYgaGFzIGl0IHRvd2FyZHMgdGhlIHRvcCBh
ZnRlciB0aGVtIGluY2x1ZGVzLiBGdW5ueS4NCj4gPiANCj4gPiBXaGF0IGRvZXMgdGhlIGRvY3Vt
ZW50YXRpb24gc3VnZ2VzdD8NCj4gPiANCj4gPiBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL3N5bWJv
bC1uYW1lc3BhY2VzLnJzdA0KPiA+IA0KPiA+ICJJdCBpcyBhZHZpc2FibGUgdG8gYWRkIHRoZSBN
T0RVTEVfSU1QT1JUX05TKCkgc3RhdGVtZW50IGNsb3NlIHRvIG90aGVyIG1vZHVsZQ0KPiA+IG1l
dGFkYXRhIGRlZmluaXRpb25zIGxpa2UgTU9EVUxFX0FVVEhPUigpIG9yIE1PRFVMRV9MSUNFTlNF
KCkuIFJlZmVyIHRvIHNlY3Rpb24NCj4gPiA1LiBmb3IgYSB3YXkgdG8gY3JlYXRlIG1pc3Npbmcg
aW1wb3J0IHN0YXRlbWVudHMgYXV0b21hdGljYWxseS4iDQo+ID4gDQo+ID4gVGhlcmUgeW91IGdv
LiBQbHVzIHRoZXJlIGlzIGV2ZW4gc29tZSBmYW5jeSBhdXRvbWF0aW9uICg7LXApLg0KPiA+IA0K
PiA+IFNvIGxldCBtZSBtb3ZlIGl0IGRvd24gdGhlcmUgdGhlbi4NCj4gDQo+IFdpbGwgeW91IHNl
bmQgb3V0IGFub3RoZXIgcmV2aXNpb24gb2YgdGhlIHBhdGNoPw0KDQpJIGFscmVhZHkgZGlkLg0K
DQpodHRwczovL21hcmMuaW5mby8/bD1saW51eC1hcm0ta2VybmVsJm09MTYzNTM3Njg2MzE2ODA3
DQoNCj4gPiA+IEluIHRoZSBmaXhlZCBjb21taXQgNGIyYjVlMTQyZmY0LCB0aGVyZSdzIGEgc2lt
aWxhciBjaGFuZ2UgZm9yDQo+ID4gPiBkcm1fZ2VtX3NobWVtX2hlbHBlci5jLiBJdCB1c2VzIGRt
YS1idWZfdm1hcCBhcyB3ZWxsLiBEb2VzIHRoYXQgbW9kdWxlDQo+ID4gPiByZXF1aXJlIHRoZSBz
YW1lIGZpeD8NCj4gPiANCj4gPiBMaWtlbHkuIExldCBtZSBqdXN0IHJ1biB6ZSBhdXRvbWF0aW9u
IGFuZCBzZWUgd2hhdCB3ZSBnZXQuLi4NCj4gPiANCj4gPiA+IERvIHlvdSBoYXZlIGFueSBpZGVh
IHdoeSBJIGRvbid0IHNlZSB0aGVzZSBlcnJvcnMgaW4gbXkgYnVpbGRzPw0KPiA+IA0KPiA+IFdl
bGwsIEkgZ3Vlc3MsIHRoZXJlIGFyZSB2YXJpb3VzIEtDT05GSUcgc3ltYm9scyBpbmZsdWVuY2lu
ZyB0aGF0IHdob2xlIHN0b3J5LiBIb3cgYWJvdXQgZS5nLg0KPiA+IA0KPiA+IGluaXQvS2NvbmZp
Zzpjb25maWcgTU9EVUxFX0FMTE9XX01JU1NJTkdfTkFNRVNQQUNFX0lNUE9SVFMNCj4gDQo+IFRo
YW5rcyBmb3IgdGhlIGhpbnQuDQoNCldlbGNvbWUuDQoNCj4gQmVzdCByZWdhcmRzDQo+IFRob21h
cw0KPiANCj4gPiANCj4gPiA+IEJlc3QgcmVnYXJkcw0KPiA+ID4gVGhvbWFzDQo+ID4gDQo+ID4g
Q2hlZXJzDQo+ID4gDQo+ID4gTWFyY2VsDQo+ID4gDQo+ID4gPiA+ICsNCj4gPiA+ID4gwqDCoCAv
KioNCj4gPiA+ID4gwqDCoMKgICogRE9DOiBjbWEgaGVscGVycw0KPiA+ID4gPiDCoMKgwqAgKg0K
PiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gLS0gDQo+ID4gPiBUaG9tYXMgWmltbWVybWFubg0KPiA+
ID4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPiA+ID4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQo+ID4gPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCj4gPiA+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4gPiA+IEdlc2Now6RmdHNm
w7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCj4gPiANCj4gDQo+IC0tIA0KPiBUaG9tYXMgWmlt
bWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPiBHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyDQo=
