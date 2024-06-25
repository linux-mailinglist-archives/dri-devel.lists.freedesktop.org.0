Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD291615C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 10:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042AD10E5F0;
	Tue, 25 Jun 2024 08:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2133.outbound.protection.partner.outlook.cn [139.219.17.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBA810E5F0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 08:34:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDubkIDt3PJGlbMTQg2ceSUVL3UVRbHeWgcpUpePLVAPtQmk36HPTf6xyI7WKYInULNhsc3+00qXHWlKg+L803nNo0seC31NtCWlcShDcVWOHeDEHs3xDknyDCMt0SHgfjwa/YiAyuSST6wdbT2o66QF4YZIIJnxsWwgIrcdfWdpjYOGHILseAzjCxbvqUAcS/HUc7y+PtCG3JMCfUkvsZKp1pF+VDPzqxKFT2h5TxqUqqjXQxuleJSW6++9yAyGuxdXg+4JxUYPq5SH0kNjkE91aSjj+ZbmYW251B3C/VTMMu3wjC7zMk7INsrgVdUrYzjr3Q+Q4UDxoGCNAn/TsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h44alAIhm+wdotxkX3SW8SlUVRUCu+XyCIeJoGop1xA=;
 b=S2e0U89UUoqTlXWsVNsRvxGieLxJNomBeAIUXSbP3nvJiMrPoOK4KtKj4o0zgPHvJ0EBvfNrcp6YZqDcBJgtqWuRxdzM4q4X8nExrv6Ki31grHABdeZ2qbBj3g0F5Ne04dp2BvrnPN8bLKGnOSIG8oI/L5ToN/mKX056W+CMVIuw7cLJIXWaWhBCmr6LCU1ghKvbjtwHqK3pWidbmItG9Yvb/LSk6lXMaUr5+ihOHyBQivs6aPT1DAC1hS60oTx2giNNrmGtQk5shHkFaO1GwdHIBin/iCj1QjHZlNuU05htBx2FIXdnisFK2bAbsNIGV6FyAkyaE2+kHMmmg0Zpww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB1116.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.33; Tue, 25 Jun
 2024 08:34:08 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::47b8:45b2:ce25:9c34]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::47b8:45b2:ce25:9c34%3])
 with mapi id 15.20.7698.025; Tue, 25 Jun 2024 08:34:08 +0000
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "heiko@sntech.de" <heiko@sntech.de>, "andy.yan@rock-chips.com"
 <andy.yan@rock-chips.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Jack Zhu
 <jack.zhu@starfivetech.com>, Shengyang Chen
 <shengyang.chen@starfivetech.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 08/10] drm/vs: add vs drm master driver
Thread-Topic: [PATCH v4 08/10] drm/vs: add vs drm master driver
Thread-Index: AQHaqyrFZ/LFL2PbyUq9SIEMaoRcK7GiMUeAgC/DA/CABBg0AIACL1PQ
Date: Tue, 25 Jun 2024 08:34:08 +0000
Message-ID: <NTZPR01MB105085DD76CAB0B8C96FAF43EED52@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-9-keith.zhao@starfivetech.com>
 <mbkrlg67jtggoqwecu6emymw3hgqoyf5pe55ho2fthq6pgnds2@ml7mbssrdr2x>
 <NTZPR01MB1050CAD9457771A58217A58CEECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
 <uymjzpwsvlaoenftrc6y2colqpvtoniubuoncyslfychynom4i@3qvmcudgfrql>
In-Reply-To: <uymjzpwsvlaoenftrc6y2colqpvtoniubuoncyslfychynom4i@3qvmcudgfrql>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB1050:EE_|NTZPR01MB1116:EE_
x-ms-office365-filtering-correlation-id: 90020195-9c64-4c1c-2087-08dc94f194bd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230037|7416011|41320700010|1800799021|366013|38070700015; 
x-microsoft-antispam-message-info: tjcghwAGl70/WVP/OcpOz1bi4+aH17mRtq6wkoXOLYORpGLl5mT9EGu6RxrVMSxPih6mP91cswWbrSja8x5BtZn0NoGh21xVR1TR+Qf+uyU/6xRoz8qcE5ak296xknXpSj0F4AzOMJCB+6EJc5lDbJ653F4UO2jPitAQdIX0z5HOJE75PvWkXDEfZTEIIJGEfooFy79tcgH2+1ztAuQcHWFlBU7RVH0pZAxA8jQ6mZRFXo0Tl465IBeopUgeCltsi41FCLgAW2D1CtzND6KZBxgagK+V5EP8zTc4ZvNw3JsNmNgr6H+ENJaTVixAdq9G7PIA2pTcUKS1rLkwLxH7fJrc82WrKwdLm7gPPVDMbmx8LUt/BaJ64wLlETSdBRBEUBXRtzlckrYPAPpKTOlKOKixxnq1i9YRLCH60pQz9+Dy03tVlSN8nHcRtDZb/YUQDe9QAzGDZUlU7dZ9pz7iUUgJObx9okdNgSi4Y/ni/bOeOwgCwura1qEihuplCQ2afmtpL8lNiIkbPmIMrd716UEHiFFGPTzPfdBaNRu+aMWuZZVMZjS3oR3tLEnoVUn/2lZ/hnxEa+E9pyTLaHpV6CsGLBJU0fOe6JfFSTn3EcGrUnBThZjcDLZ8vdCZGoPQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230037)(7416011)(41320700010)(1800799021)(366013)(38070700015); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: gYlDMyie4CFoJLejcDvgfAtwRlh4LT+1fRPb43/NEoNsxZh1wYsvFzbQ515a2cgXbavYyp3Fqb/1WKoivcCyQgz8EBMHxob5pHszSy0ux3qhEzFSeJHtUT0tb6vV02pB4/4JxnpGElFICmwIQTMs4qFurvNvopEi/a814/sB5kRKTsyY2REEsDJ/RFonCTCoAJeSPk/Ugfiuyx09o23Lr/RI12mtoDcwQerQFZT1ns5hmZ2rTbaZH5eHur0LMnMJ3+KIr7PetYyjSmwj5znUwbdzdx7r1tiJbWfpvcklbsFhG7RHWzBmcOklCanaVn9sdKSx17oXnGvbz1IiF25xifY5UchNpyF0Podj8BLpCiyHnJOspkWhsH7RGEayXIqg5ghBMnhM6uXE46GNfVY9c31XigBXxFR7SaQoBkq0UmY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 90020195-9c64-4c1c-2087-08dc94f194bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 08:34:08.2988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JtdFmf67isjbppECEPXreVk0sT1tdHknlrAcORWteaXEVUKpXcsCDaAfZ5HGBarBQsFzCVJq988MDje0PWKbdA2oCK/LTA6FmfPJfokX+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1116
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiAyMDI05bm0NuaciDI05pel
IDU6MDgNCj4gVG86IEtlaXRoIFpoYW8gPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4g
Q2M6IGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBy
Zm9zc0BrZXJuZWwub3JnOw0KPiBMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb207IGpv
bmFzQGt3aWJvby5zZTsNCj4gamVybmVqLnNrcmFiZWNAZ21haWwuY29tOyBtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb207DQo+IG1yaXBhcmRAa2VybmVsLm9yZzsgdHppbW1lcm1hbm5A
c3VzZS5kZTsgYWlybGllZEBnbWFpbC5jb207DQo+IGRhbmllbEBmZndsbC5jaDsgcm9iaEBrZXJu
ZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+IGhqY0By
b2NrLWNoaXBzLmNvbTsgaGVpa29Ac250ZWNoLmRlOyBhbmR5LnlhbkByb2NrLWNoaXBzLmNvbTsg
WGluZ3l1IFd1DQo+IDx4aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT47IHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU7IEphY2sgWmh1DQo+IDxqYWNrLnpodUBzdGFyZml2ZXRlY2guY29tPjsgU2hlbmd5
YW5nIENoZW4NCj4gPHNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20+OyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDgvMTBdIGRybS92czogYWRkIHZz
IGRybSBtYXN0ZXIgZHJpdmVyDQo+IA0KPiBPbiBTdW4sIEp1biAyMywgMjAyNCBhdCAwNzoxNjo1
N0FNIEdNVCwgS2VpdGggWmhhbyB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgTWF5IDIxLCAyMDI0IGF0
IDA2OjU4OjE1UE0gKzA4MDAsIGtlaXRoIHdyb3RlOg0KPiA+ID4gPiBBZGQgdnMgRFJNIG1hc3Rl
ciBkcml2ZXIgZm9yIEpINzExMCBTb0MgQUREIERNQSBHRU0gZHJpdmVyDQo+ID4gPiA+DQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IGtlaXRoIDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+DQo+
ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL01ha2VmaWxl
IHwgICAzICstDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJ2LmMg
fCA3MTgNCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDcyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pICBjcmVhdGUgbW9k
ZQ0KPiA+ID4gPiAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2Rydi5jDQo+
ID4gPiA+DQo+IA0KPiA+ID4gQklUKERSTV9DT0xPUl9ZQ0JDUl9CVDIwMjApLA0KPiA+ID4gPiAr
CQkuenBvcwkJCT0gMCwNCj4gPiA+DQo+ID4gPiBIb3cgYXJlIHRoZXNlIHpwb3MgcmVsYXRlZCB0
byB0aGUgenBvcyBmcm9tIGRybV9wbGFuZV9zdGF0ZT8NCj4gPiBacG9zIHdhcyBhZGRlZCB0byBk
cm1fcGxhbmVfc3RhdGUgYnkgY2FsbGluZw0KPiA+IGRybV9wbGFuZV9jcmVhdGVfenBvc19wcm9w
ZXJ0eSBmdW5zLA0KPiA+DQo+ID4gdnNfcGxhbmVfcHJpbWFyeV9jcmVhdGUNCj4gPiAtLS0tLS0+
IGRybV9wbGFuZV9jcmVhdGVfenBvc19wcm9wZXJ0eSguLi4uLi52c19wbGFuZV9wcmltYXJ5X2lu
Zm8tPg0KPiA+IC0tLS0tLT4genBvcyApDQo+IA0KPiBZZXMuIEJ1dCB3aHkgZG8geW91IG5lZWQg
enBvcyBoZXJlPyBFc3BlY2lhbGx5IGlmIGl0J3Mgc2V0IHRvIDAuDQoNCmlmIGFueSBwbGFuZSBo
YXMgdGhlIHpwb3MgYXR0cmlidXRlICh3aGV0aGVyIHZhcmlhYmxlIG9yIGltbXV0YWJsZSksIA0K
dGhlbiBhbGwgcGxhbmVzIHNob3VsZCBoYXZlIHRoZSB6cG9zIGF0dHJpYnV0ZSB0byBlbnN1cmUg
Y29uc2lzdGVudCBzdGFja2luZyBvcmRlciBhbmQgYmVoYXZpb3IuDQpIZXJlIGlzIHRoZSBpbml0
aWFsIHZhbHVlIG9mIHpwb3MgcHJvcGVydHkNClVzdWFsbHkgbWluIGNhbiBiZSBzZXQgdG8gMCBh
bmQgSSBzZXQgdGhlIHpwb3Mgb2YgcHJpbWFyeSBwbGFuZSB0byAwLi4uLi4uDQoNCj4gDQoNCj4g
PiA+DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlkcm1fZGV2LT5tb2RlX2NvbmZpZy5taW5fd2lkdGgg
PSBtaW5fd2lkdGg7DQo+ID4gPiA+ICsJZHJtX2Rldi0+bW9kZV9jb25maWcubWluX2hlaWdodCA9
IG1pbl9oZWlndGg7DQo+ID4gPiA+ICsJZHJtX2Rldi0+bW9kZV9jb25maWcubWF4X3dpZHRoID0g
bWF4X3dpZHRoOw0KPiA+ID4gPiArCWRybV9kZXYtPm1vZGVfY29uZmlnLm1heF9oZWlnaHQgPSBt
YXhfaGVpZ2h0Ow0KPiA+ID4NCj4gPiA+IEkgdGhvdWdodCB0aGF0IEkgc2F3IG1vZGVfY29uZmln
Lm1pbi9tYXggYmVpbmcgaW5pdGlhbGl6ZWQuDQo+ID4gWWVzIHRoZSBtb2RlX2NvbmZpZy5taW4v
bWF4IGhhcyBiZWVuIGluaXRpYWxpemVk77yMDQo+ID4gVGhpcyBwbGFjZSBpcyBkb2luZyBhbiB1
cGRhdGUgYWNjb3JkaW5nIHRvIGRldGFpbCBpbmZvLg0KPiANCj4gVGhlbiBwbGVhc2UgZHJvcCBw
cmV2aW91cyBpbml0aWFsaXNhdGlvbi4gV2hpbGUgbG9va2luZyBhdCB0aGUgY29kZSBpdCdzDQo+
IGltcG9zc2libGUgdG8gdW5kZXJzdGFuZCB3aGljaCBvbmUgaXMgY29ycmVjdC4NCk9rIGdvdCBp
dC4NCj4gDQo+IA0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgc3RydWN0IGNvbXBvbmVudF9t
YXRjaCAqdnNfYWRkX2V4dGVybmFsX2NvbXBvbmVudHMoc3RydWN0DQo+ID4gPiA+ICtkZXZpY2Ug
KmRldikgew0KPiA+ID4gPiArCXN0cnVjdCBjb21wb25lbnRfbWF0Y2ggKm1hdGNoID0gTlVMTDsN
Cj4gPiA+ID4gKwlpbnQgaTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKGRybV9zdWJfZHJpdmVycyk7ICsraSkgew0KPiA+ID4gPiArCQlzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyICpkcnYgPSBkcm1fc3ViX2RyaXZlcnNbaV07DQo+ID4gPiA+ICsJCXN0cnVj
dCBkZXZpY2UgKnAgPSBOVUxMLCAqZDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCQl3aGlsZSAoKGQg
PSBwbGF0Zm9ybV9maW5kX2RldmljZV9ieV9kcml2ZXIocCwgJmRydi0+ZHJpdmVyKSkpIHsNCj4g
PiA+ID4gKwkJCXB1dF9kZXZpY2UocCk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkJCWRybV9vZl9j
b21wb25lbnRfbWF0Y2hfYWRkKGRldiwgJm1hdGNoLA0KPiA+ID4gY29tcG9uZW50X2NvbXBhcmVf
b2YsDQo+ID4gPiA+ICsJCQkJCQkgICBkLT5vZl9ub2RlKTsNCj4gPiA+ID4gKwkJCXAgPSBkOw0K
PiA+ID4gPiArCQl9DQo+ID4gPiA+ICsJCXB1dF9kZXZpY2UocCk7DQo+ID4gPg0KPiA+ID4gV2hh
dCBhYm91dCBqdXN0IGdvaW5nIHRocm91Z2ggdGhlIGdyYXBoIGNvbm5lY3Rpb25zIGluc3RlYWQg
YW5kIGFkZGluZw0KPiB0aGVtPw0KPiA+DQo+ID4gVGhlIHB1cnBvc2Ugb2YgdXNpbmcgY29tcG9u
ZW50cyBpcyB0byBjcmVhdGUgZW5jb2RlciBhbmQgY29ubmVjdG9yIHRvIHRoZQ0KPiBkcm0gc3Vi
c3lzdGVtIGJ5IGNhbGxpbmcgY29tcG9uZW50X2JpbmRfYWxsDQo+ID4NCj4gPiBncmFwaCBjb25u
ZWN0aW9uIG5lZWRzIHRvIGJlIGJhc2VkIG9uIHdoZXRoZXIgdGhlcmUgaXMgYSBicmlkZ2UgYXQg
cHJlc2VudC4NCj4gPiBJZiB0aGUgYnJpZGdlIGhhcyBiZWVuIGFkZGVkLCBpdCBjYW4gYmUgb2J0
YWluZWQgdGhyb3VnaCBkcm1fb2ZfZ2V0X2JyaWRnZQ0KPiA+IENyZWF0ZSBhIGNvbm5lY3RvciBi
YXNlZCBvbiB0aGUgb2J0YWluZWQgYnJpZGdlIGFuZCB0aGVuIGF0dGFjaCB0aGUNCj4gY29ubmVj
dG9yIHRvIHRoZSBlbmNvZGVyLg0KPiA+IFRoZW4gZG8gZHJtX2Rldl9yZWdpc3Rlci4NCj4gPg0K
PiA+IEkgZG9uJ3Qga25vdyBpZiBteSB1bmRlcnN0YW5kaW5nIGlzIGNvbnNpc3RlbnQgd2l0aCB5
b3Vycy4gUGxlYXNlIGhlbHAgY29uZmlybQ0KPiBpdC4NCj4gPiBUaGFua3MNCj4gDQo+IFlvdXIg
Y29kZSBpcyBsb29waW5nIG92ZXIgdGhlIHN1YmRyaXZlcnMsIGxvY2F0aW5nIGRldmljZXMgYW5k
IHRoZW4NCj4gYWRkaW5nIHRoZW0gYXMgY29tcG9uZW50cy4gQ2FuIHlvdSBpbnN0ZWFkIHVzZSBk
ZXZpY2Ugbm9kZXMgd2hpY2ggYXJlDQo+IGNvbm5lY3RlZCB0byB5b3VyIG1hc3RlciB2aWEgdGhl
IE9GIGdyYXBoPyBJZiBJIHVuZGVyc3RhbmQgZXhhbXBsZXMgaW4NCj4geW91ciBEVCBiaW5kaW5n
cyBjb3JyZWN0bHksIHRoaXMgYXBwcm9hY2ggc2hvdWxkIHdvcmsuDQoNClllcywgVGhlIE9GIGdy
YXBoIG1ldGhvZCBhcHBlYXJzIHRvIGJlIG1vcmUgZWZmaWNpZW50IGFuZCBkb2VzIG5vdCByZXF1
aXJlIHRyYXZlcnNhbC4NCkFmdGVyIGZpbmQgdGhlIGRldmljZSBub2RlICwgDQpMZXQgaXQgc3Rh
cnQ6DQpkcm1fb2ZfY29tcG9uZW50X21hdGNoX2FkZChkZXYsICZtYXRjaCwgY29tcG9uZW50X2Nv
bXBhcmVfb2YsIGRldmljZS0+b2Zfbm9kZSk7DQoNCj4gDQo+ID4gPiA+ICtzdGF0aWMgdm9pZCBf
X2V4aXQgdnNfZHJtX2Zpbmkodm9pZCkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKwlwbGF0Zm9ybV9k
cml2ZXJfdW5yZWdpc3RlcigmdnNfZHJtX3BsYXRmb3JtX2RyaXZlcik7DQo+ID4gPiA+ICsJcGxh
dGZvcm1fdW5yZWdpc3Rlcl9kcml2ZXJzKGRybV9zdWJfZHJpdmVycywNCj4gPiA+ID4gK0FSUkFZ
X1NJWkUoZHJtX3N1Yl9kcml2ZXJzKSk7IH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArbGF0ZV9pbml0
Y2FsbF9zeW5jKHZzX2RybV9pbml0KTsNCj4gPiA+DQo+ID4gPiBXaHkgX3N5bmM/DQo+ID4NCj4g
PiBsYXRlX2luaXRjYWxsX3N5bmMgd2lsbCBtYWtlIGl0IHN1Y2Nlc3MgLHdoZW4gZG8gZGV2bV9k
cm1fb2ZfZ2V0X2JyaWRnZS4NCj4gPiBBbHNvIGl0IGNhbiB1c2UgdGhlICIgRVBST0JFX0RFRkVS
ICIgdG8gYXZvaWQgaXQsDQo+IA0KPiBXaHkgZG8geW91IG5lZWQgdGhpcz8gSXQncyBwZXJmZWN0
bHkgZmluZSB0byBoYXZlIERSTSBkZXZpY2VzIHByb2JlDQo+IGFzc3luY2hyb25vdXNseS4NCldp
bGwgcmVwbGFjZSBpdCBieSBtb2R1bGVfaW5pdA0KDQo+IA0KPiA+ID4NCj4gPiA+ID4gK21vZHVs
ZV9leGl0KHZzX2RybV9maW5pKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArTU9EVUxFX0RFU0NSSVBU
SU9OKCJWZXJpU2lsaWNvbiBEUk0gRHJpdmVyIik7DQo+ID4gPiBNT0RVTEVfTElDRU5TRSgiR1BM
Iik7DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuMjcuMA0KPiA+ID4gPg0KPiANCj4gLS0NCj4gV2l0
aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg==
