Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B77F6E981D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C786210EC86;
	Thu, 20 Apr 2023 15:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3CD10EC86
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmvK5foq6fag+v/Ko/mQ277Ea6UM3Xot9D64heNF8OCeiEwvv0fog6iGhjCX+nJ0FAJv0MGctazEghcCnZddpex4dTWnOEeC3gNkAJ1w0eryM1AmWaCnFnqL4IwmYTbUmTeJyE35stpe53X3WrFUUTU1pRHNzG2TBriYDwHovWNDnzszXOVFofKKWmwR/AZAG15jxKVZ4dTF/nJtwE+Vip/UDTA050m3fGzM9hHYIyqXpHhKYT2BUHV68MMDjCMRdWNi10i9+5gQAMbCajgBHhessQPE4qT6ILvmqfvRxB3zZgU9kIo/oA484+8+hfpF5u4reNjdHjhDXBZRNz2D8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJg6qnDYVdmU9SeborJTgxbaXRRNk9RRVXy42ix7R/w=;
 b=g0ktOg7pcAdWIuW/tdhW7cMBDI4SfqfSi5oFpZ703uPZtbkuFDRT8NiVWynctMmboGRGg0yvjyXu34GWWANku9ij486RC6QcprM5vov0UY7QY6Z3tiZh3ByBBO2gGb/21AtiKoLXE6I0/ctUdDmh17CUqrQZ4cbBhRTR1Kgh3dT1eb5e2ipFRbkRaRvO8oE0ywFqUgAueefxj+Y+LAbBh/iJ0KYUDbGMuf9VDF+uJRs/9iUVewNV0cHYbwGj5reZEQjJHfXpK1l/iM+tpwnbGD8pigmKTBNlLIth4SaTGJLgH2PCUej5AWF24fKf1+H7u/AfY2wZeM0pTB8SdmTT2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJg6qnDYVdmU9SeborJTgxbaXRRNk9RRVXy42ix7R/w=;
 b=lDaYtRQKaSz/tmnAgd2o4mEGmUX2obMF1WRUyV4YEcMg9TBGfidvqxZ087x1Cj/VtM8ae6gRuQGdLE7HLEb72a4aG+uVXOwvp3ZJJsRCLizw8/hr1tgScfirZc2BkFRi7u762UcfD+RbhfqDjDeE7DNcjzg/gyRhfCNIwCjrzww=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11444.jpnprd01.prod.outlook.com (2603:1096:400:371::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 15:13:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 15:13:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v7 4/8] drm: rzg2l-du: Add RZ/V2L DU Support
Thread-Topic: [PATCH v7 4/8] drm: rzg2l-du: Add RZ/V2L DU Support
Thread-Index: AQHZbG5YrwbluTMMtUCOY7Lh1JUVAK80VVGAgAAGmvA=
Date: Thu, 20 Apr 2023 15:13:34 +0000
Message-ID: <OS0PR01MB5922A95994B7C792B88E4A8886639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
 <20230411120810.368437-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdU4NTcNL6MYEqTmRtPP3iTSNTfnoEttPwevFyXZ_Vk4aA@mail.gmail.com>
In-Reply-To: <CAMuHMdU4NTcNL6MYEqTmRtPP3iTSNTfnoEttPwevFyXZ_Vk4aA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11444:EE_
x-ms-office365-filtering-correlation-id: 21900086-fd7b-4e94-b27e-08db41b1cf3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tc897LG3WsgplJnMqUpbim+hbf4uRq4r+5yDk2UwHkyof+rgJ7bGWFNziD7ZgazKZxzJJsDMxOpUHi/F4k0NozEgnnzTOb30WMD+onrK00mRk7rN6mbirFbjjjlAl9mcI3TLLl8gxZ+tHCRsMows+PbGTKm5oRF/R6Ze3i+SpUO2yqLHr93+r51fpKLspM1rL80ZTtEZkgyXLrzWIZzZEm0X5JAGAHh7SHj3z2Xn4/1lkegkokaAUZZPxgX7957MNVeFUmKR/E03CGz2vQt9TE5CoBn5n5Vx0vemJ0D9yfyS27pSzZZlMY5XJxQauz6IjxVIMBtEcC1B4jYjhawsKWTozePhwegT6rkB5Gz+K7urkPdxMyQLhCLKwF9SuSXFbfVV3vWW/iDRMh87R/7MaUZ2C/m7HXhDVxs7YcjVrBzRJuF6nWgAq+4/0EzjwyYDWGWUM3r9K8K6xIegMfHDScqaQa1Hr5GV4SoWaj0Pr6CEflV8DFmYKgtmxuIWTMUMgsD4Jg+QmEVCRvgbir/9vFMeN/On0/OdOelk60qOOO10lC4Q1pAr0LFUq/D9RJ39NmzCpexvm6kXSnaCE+UgktaHp6+gHuphT+DoDX3VIRXBrmsEPnaWq2lQZE/1khXW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(186003)(6506007)(71200400001)(9686003)(53546011)(7696005)(52536014)(5660300002)(316002)(4326008)(41300700001)(66556008)(6916009)(66476007)(76116006)(66446008)(7416002)(66946007)(8936002)(8676002)(54906003)(478600001)(38070700005)(38100700002)(2906002)(64756008)(86362001)(33656002)(83380400001)(122000001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzFxaEhwT1YyV2M1c2dvWkMwQVIweVloZTdHcXgyaDJEN21tb3BvamlWYTJw?=
 =?utf-8?B?aGtzMUJ4NU1HdXFCMSt4cm82UW5UeFA5QlhFS3oxeDl0TmFabEZ1VkFHc2pl?=
 =?utf-8?B?YkM4NEFxUGI3SVJONlJSUWw5U0tXUk5GcXFUSC9DTTUzZXVBVzBUSWg2YVhO?=
 =?utf-8?B?dG81ZGkrNzdKSm1UNU1ia2RNbktkWGRCZjQySXNGQU9uUkIyQ3JKQklaWEFF?=
 =?utf-8?B?UFJ0RjI1di8xdmRNSHhIOWt5VzR2TzF2OTE3R1Z3TEFxd0F6dEI2NnNZSE5v?=
 =?utf-8?B?SkxoT216R1hwR3VpN3FMT05FOFpUamRrcHhURG85RjUrdUNqbHlVZ3hQU1hZ?=
 =?utf-8?B?REU0cldwM01HNGhuODdUNjdaRDkzNmhzYmZlZ0xPOTQ5V0lrc0ZTUTFtNDVu?=
 =?utf-8?B?WTVmZ2tPODdSV1hqN1BIT1lDeWsvdnAzU3dMTHlCOEtSV2kyODdYbG44eUFU?=
 =?utf-8?B?enJJb1lZQlpQN0hSRmpLdWRLSW96dXFMQllEZlUwUnV3M0VrYWNhbW40Rjdl?=
 =?utf-8?B?RGVSSFRia0JiMnUxZ2NkQmJ4ZzBZZ211aG1yei94dVgvMTJmamEzZjgvQzZt?=
 =?utf-8?B?SnRaR2VKNVY1Mmp4MTk5Y29PeEdMU1R5WXV2N2dCU1NlTnNnU21McVJ4R0s1?=
 =?utf-8?B?NHhMUzZBTmlHTHBST2Jsdmc3SUhGNFdWd29Dakd3MU1LZytkZ2ZhVXFvRXR2?=
 =?utf-8?B?OEk5akdEZzdRbW4vdkVHRm9nM1dOaktiZkNWMEdSM2srYVhrbFFpOFN4cW16?=
 =?utf-8?B?NmRlWjNuMUtjQ0JFcDJuSDZXT1FFTmtaKzdUMm5kV01aNXNqWmttZU1aNlln?=
 =?utf-8?B?UElCTHh5WUVxYk5VWjc0WjVzUHBoNHZHWWhvUWZjUHMxQmdSa3RKTUZxZTR2?=
 =?utf-8?B?MEQwU0kzT25QY1U3R1V4MTN6Q2hYQWlZZ203Y1hiaXh6Sno3aXJwZTk2cnUr?=
 =?utf-8?B?REpmblpJaFQwbWlSUUdROHVmTHFySnVLOEVMZk9MTFFUVWlyMGMxdWZWeVRi?=
 =?utf-8?B?Q2YzQzV2clh5b1c5WXdTb2o2OXlOMGxLQzRxdWovQWpyVzZrb2txMEdRdFoy?=
 =?utf-8?B?UGJJNmhRdjhoTVU3V1pVTHdzTTBQVVNKWUZ6bXE5UmRTSHdnRHZza3Zkckhm?=
 =?utf-8?B?Rmw1MGo1K3FnRUd5dSt3L0JSWGpIQkk1dTh3eWVUMjBFaW9WWDBPRWdUbzc4?=
 =?utf-8?B?dU00ZHNlVkdqcmhPUG9qY0FOdHFjbllXd2o4VlFRd3RqcytUYmpYYVVHZlVm?=
 =?utf-8?B?WFYvdTVrZTJHNjlZdVNOUnYxZWc4U2xDenlrSEhMTUNPUDZlc0h4ZDRPVlk5?=
 =?utf-8?B?emllK3A2M0lVRmtvQ05OZDFTNzBSZnFFOUFEOWI2Tk9qR1JoUHB3aGMrV2F5?=
 =?utf-8?B?bW5WNDhFVmpVUC9tTDFxQ2RiWnQxLzFYN2cxd2VuQ3JkT091RVUrVzkydHdp?=
 =?utf-8?B?OEJrZVFmd3owMUEvc3g1MlVUd1FXVG1ZWjFLVTl1alU1WHhyS045Qy80dngr?=
 =?utf-8?B?NUg1MTRGdzRYRWVBQjN1TTVuWnZpcnVPdzlacTNQbFd0QTZQTDF0Z2JnNUlV?=
 =?utf-8?B?NVBaOHpyRHA0bFZyQVhTTjlBcWlSQVJsSlhzYVNUMUlET1JPY0VHME1tcDNE?=
 =?utf-8?B?T2xIZUpnN1VLUU9seHA0VW5TQ0xVNDJYNGZtTGZpbThrL3FRMzVBZU5EaFdH?=
 =?utf-8?B?aFRhR08yVHJSTTlyZEZlOVFoY0Y1VVJmVld2M0pYU3psM1R5QTVRQTlRR3hv?=
 =?utf-8?B?eUg5U0I0WFhvdTRhWGFPQVlWTmphdnZKT0Z4UDRVNEhqbVdOYnFxUit3ZVlM?=
 =?utf-8?B?N09mL0k4ZzR3MDdYd2JMck92UEtvU21wVWpTK1JYRW1mTncxTGhXWVordk5a?=
 =?utf-8?B?ZHR3WWdFT2ZXRW1tQmh0SkNaQjVqdHNmamJiVUlsTnZxWW9UTnhnTFM4TCtM?=
 =?utf-8?B?b2pLczNzckpONDIvRng0eXVDMmF5TFVoMXlWcjRBSUtyK1NPQnBrNFVCR21z?=
 =?utf-8?B?N2ZPalU0MjZLS2ZNcEVrbVdNbjIrSmJUeTVPb2k0dCtwa3NxMG1lb0RqQWFT?=
 =?utf-8?B?VTd6bFB2bDRLRGlhbFNNT1A4bkFIcGNZZ1picUZ6ZjYxVndjN2doRDFHV3Vv?=
 =?utf-8?Q?041I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21900086-fd7b-4e94-b27e-08db41b1cf3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 15:13:34.4786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0Bx4eYtrkJDtRydMnytZqXMAyO9heeI2UwE6QAu369IjjMnlEmLgwRD3kuYETho7MpQdgrj/dD05iYtuxIvuS+E0ln8dmHkaSUOI+moEJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11444
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEFw
cmlsIDIwLCAyMDIzIDM6NDggUE0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBNYXVybw0KPiBDYXJ2YWxobyBDaGVoYWIgPG1jaGVo
YWJAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0KPiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBMYXVyZW50IFBpbmNoYXJ0DQo+
IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT47IGRyaS0NCj4gZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtDQo+IG1lZGlhQHZnZXIua2VybmVsLm9yZzsgR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT47IENocmlzDQo+IFBhdGVyc29uIDxDaHJpcy5QYXRlcnNvbjJAcmVu
ZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQNCj4gPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDQvOF0gZHJtOiByemcybC1kdTogQWRkIFJaL1YyTCBE
VSBTdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBBcHIgMTEsIDIwMjMgYXQg
MjowOOKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+
ID4gQWRkIHN1cHBvcnQgZm9yIFJaL1YyTCBEVS4gVGhlIFJaL1YyTCBEVSBibG9jayBpcyBpZGVu
dGljYWwgdG8gUlovRzJMDQo+ID4gU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHY3Og0KPiA+ICAq
IE5ldyBwYXRjaC4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcnpnMmxfZHVfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yemcybF9kdV9kcnYuYw0KPiA+IEBAIC01Myw2ICs1Myw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmNhcl9kdV9kZXZpY2VfaW5mbw0KPiA+IHJ6ZzJsX2R1X3I5YTA3
ZzA0NF9pbmZvID0gew0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHJ6ZzJsX2R1X29mX3RhYmxlW10gPSB7DQo+ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInJl
bmVzYXMscjlhMDdnMDQ0LWR1IiwgLmRhdGEgPQ0KPiA+ICZyemcybF9kdV9yOWEwN2cwNDRfaW5m
byB9LA0KPiA+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA3ZzA1NC1kdSIs
IC5kYXRhID0NCj4gPiArICZyemcybF9kdV9yOWEwN2cwNDRfaW5mbyB9LA0KPiA+ICAgICAgICAg
eyAvKiBzZW50aW5lbCAqLyB9DQo+IA0KPiBTbyB0aGlzIGNoYW5nZSBpbXBsaWVzIG5vIGZhbGxi
YWNrIGNvbXBhdGlibGUgdmFsdWUsIE9LLg0KDQpJIGFtIHBsYW5uaW5nIHRvIGRyb3AgdGhpcyBw
YXRjaCBpbiBuZXh0IHZlcnNpb24gdG8gbWFrZSB1c2Ugb2YNCmZhbGxiYWNrIGNvbXBhdGlibGUg
YXMgZGlzY3Vzc2VkIGluIHBhdGNoIDYvOC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCj4gDQo+IFJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0K
PiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZQ0KPiB0aGF0Lg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
