Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 051869210C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFA389A5C;
	Mon, 19 Aug 2019 10:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130070.outbound.protection.outlook.com [40.107.13.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFE36E084
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 02:13:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEq06ZFXS6sco/pZd3xctKMd4p47m2Cb57ueuV53BiUZ03BrpS3hAnRk9f+AtJj2LqvYsdnn1onAlUAPJp6jCrGS2xOFOpi7zY1UoPiDsJBQoZC7Op/RKpclSR2tg0bldEv3hRidLuhy/34a2s7Ckr725qU/ZaNWDB4hNHkqUVx/dreApAzLtvWPOtwnGJhzUP+JPO4qu7GKbnxkMFxgn8ROkjJoAjslvpDfO74cQBmNVAdtxP8JUw7YgkwUEIotDEajnWkkr/ANbOxDnGj1FCsC8i5Uhs6VOHTpZuOMgAstqosnMfgsX+3Xe3MEQLNXeJXQ+Vde4nQXozD6P5JT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st782Dzey9PA1/vvSlYLlx14iUDCtENxN17Zf/FKWtc=;
 b=ByREkiwGIIv82Shvh2+P5b5FrzG7PQY43yc1B4MO2mWndZHXvmkIDkS9J+y1Mzmirc/smLUxXQ4Y7psNln+2c0rHqI9bye/QRWslYO0JJVjvTpCn61IKmGKqRoUqycpvFoH3jF3GSp8sT3cStPcyBeRMfLlveZcdM3V1ntEkEbtYf80n6jc+yLIj5VO5vqvPiHK7iYmyE/d2QRB2oeNJdRxAgJ7xQ3DSB0j8ZW8ugODfZE1G9wGHAUKY8Ssb62t3W91UIYeJJYl/cAoTmDmG8BXrgsQb9JKt0VT+B5CRtMUjlQKGpQwu6DvCs4/Qxpra+XNG30aPomUzS+GHV3HQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB7PR04MB5195.eurprd04.prod.outlook.com (20.176.236.27) by
 DB7PR04MB5004.eurprd04.prod.outlook.com (20.176.236.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 02:13:39 +0000
Received: from DB7PR04MB5195.eurprd04.prod.outlook.com
 ([fe80::e854:ffa9:a285:88a4]) by DB7PR04MB5195.eurprd04.prod.outlook.com
 ([fe80::e854:ffa9:a285:88a4%5]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 02:13:39 +0000
From: Wen He <wen.he_1@nxp.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: RE: [EXT] Re: [v3 1/2] dt/bindings: display: Add optional property
 node for Mali DP500
Thread-Topic: [EXT] Re: [v3 1/2] dt/bindings: display: Add optional property
 node for Mali DP500
Thread-Index: AQHVVBtfU+J9pIyqBkadkWh1U2HF+6b+NL4AgAOHRjA=
Date: Mon, 19 Aug 2019 02:13:39 +0000
Message-ID: <DB7PR04MB5195A94A64615FF44C0F4442E2A80@DB7PR04MB5195.eurprd04.prod.outlook.com>
References: <20190816100424.5366-1-wen.he_1@nxp.com>
 <CAL_JsqLPZ+hCGd=J3MU83saHJJ-yx6k+X0Y7-2ECu5yT8PxF4w@mail.gmail.com>
In-Reply-To: <CAL_JsqLPZ+hCGd=J3MU83saHJJ-yx6k+X0Y7-2ECu5yT8PxF4w@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec169130-fa65-40ab-28e4-08d7244ad9f5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB7PR04MB5004; 
x-ms-traffictypediagnostic: DB7PR04MB5004:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB500455FA76E9BBE929A9A14DE2A80@DB7PR04MB5004.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(13464003)(199004)(189003)(305945005)(229853002)(71200400001)(7736002)(66066001)(71190400001)(55016002)(8936002)(8676002)(81156014)(81166006)(26005)(86362001)(74316002)(478600001)(33656002)(256004)(6436002)(9686003)(316002)(52536014)(14454004)(66946007)(99286004)(476003)(76116006)(64756008)(76176011)(66476007)(54906003)(66446008)(7696005)(5660300002)(446003)(102836004)(186003)(25786009)(11346002)(4326008)(53546011)(2906002)(486006)(53936002)(6116002)(6506007)(6246003)(66556008)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB5004;
 H:DB7PR04MB5195.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jLgbFF3dcrHB9gSP8ArLp/W8iVKoxGNm0nBPIa9enuQ6L2VeFdKogoJA/oH3mYPIjk5MKAvUPlFbmy706x39A1djLKrg2HiuiSLA4UmpYwpmkfiFn9ispHf0b5kxuREG80u/LCaOB7hfz3j8DPJWQw9z10Qah/d9+lJH24alI4Vb5DZ7smOQNDdj4H2t3Md6nsmQP8daiqV1VL6nZy/AupLaoYmbPI6cJHRK/YDG2+/h6HJduWLZlMQCxi+Ztajt1sL210obUeyGg0oVSSbz6XxRhsZd49+c1b7qqkkgf+eCJ4UdY9K8nO20uQvCXzhQ+xGTLGh8qBIzIbVRsvGNfHIP+sdkeyrm5lc4NejwgN7kKAvY97JWTqDG3EQ7uWoDileprUoqoxSONOwn7NfpaQ0bg3SC0rGJbBEqaD7SxoY=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec169130-fa65-40ab-28e4-08d7244ad9f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 02:13:39.7258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQ3y9SDbXaSmHyaBmMXeRRWgU41i+naaZk0IdAXuhy2rbvdrrzEFUgYjBfC9hFqNuoCWmNBvXDmPisdWJybnCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5004
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st782Dzey9PA1/vvSlYLlx14iUDCtENxN17Zf/FKWtc=;
 b=V9xOMBXKcOVPFgJZPKfqn+15/Z1uxoN6fj5siCUvYUbIiwXfxBCeuhq4gGDmZPjkkCEmf+5Tiy6/1iJu6yDBwZUZmj95rOnGdWGAfxAwfnUHtfYplPq/kBIr7YrkXdgobAzlLZEvEUmuIihJjwZA2qsuXB5Lh1jD+58quAIKIuo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=wen.he_1@nxp.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Leo Li <leoyang.li@nxp.com>,
 "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmgrZHRAa2VybmVsLm9yZz4NCj4gU2VudDogMjAxOeW5tDjmnIgxN+aXpSA0OjA5DQo+IFRvOiBX
ZW4gSGUgPHdlbi5oZV8xQG54cC5jb20+DQo+IENjOiBsaW51eC1kZXZlbEBsaW51eC5ueGRpLm54
cC5jb207IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPjsNCj4gQnJpYW4gU3Rhcmtl
eSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPjsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PjsgRGFuaWVsDQo+IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgTWFyayBSdXRsYW5kIDxtYXJr
LnJ1dGxhbmRAYXJtLmNvbT47IGRyaS1kZXZlbA0KPiA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gU3ViamVjdDogW0VY
VF0gUmU6IFt2MyAxLzJdIGR0L2JpbmRpbmdzOiBkaXNwbGF5OiBBZGQgb3B0aW9uYWwgcHJvcGVy
dHkgbm9kZSBmb3INCj4gTWFsaSBEUDUwMA0KPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0K
PiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCA0OjE0IEFNIFdlbiBIZSA8d2VuLmhlXzFAbnhwLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiBBZGQgb3B0aW9uYWwgcHJvcGVydHkgbm9kZSAnYXJtLG1hbGlk
cC1hcnFvcy12YWx1ZScgZm9yIHRoZSBNYWxpIERQNTAwLg0KPiA+IFRoaXMgcHJvcGVydHkgZGVz
Y3JpYmUgdGhlIEFSUW9TIGxldmVscyBvZiBEUDUwMCdzIFFvUyBzaWduYWxpbmcuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBXZW4gSGUgPHdlbi5oZV8xQG54cC5jb20+DQo+ID4gLS0tDQo+ID4g
Y2hhbmdlIGluIHYzOg0KPiA+ICAgICAgICAgLSBjb3JyZWN0aW9uIHRoZSBkZXNjcmliZSBvZiB0
aGUgbm9kZQ0KPiA+DQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2FybSxtYWxpZHAudHh0IHwgMyArKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2FybSxtYWxpZHAudHh0DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50eHQNCj4gPiBpbmRleCAyZjc4NzA5ODNl
ZjEuLjFmNzExZDMyZjIzNSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sbWFsaWRwLnR4dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxtYWxpZHAudHh0DQo+ID4gQEAgLTM3
LDYgKzM3LDggQEAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4gPg0KPiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtbWVtb3J5L3Jlc2VydmVkLW1lbW9yeS50eHQpDQo+
ID4gICAgICB0byBiZSB1c2VkIGZvciB0aGUgZnJhbWVidWZmZXI7IGlmIG5vdCBwcmVzZW50LCB0
aGUgZnJhbWVidWZmZXIgbWF5DQo+ID4gICAgICBiZSBsb2NhdGVkIGFueXdoZXJlIGluIG1lbW9y
eS4NCj4gPiArICAtIGFybSxtYWxpZHAtYXJxb3MtaGlnaC1sZXZlbDogcGhhbmRsZSB0byBkZXNj
cmliaW5nIHRoZSBBUlFvUyBsZXZlbHMgb2YNCj4gRFA1MDAncw0KPiA+ICsgICAgUW9TIHNpZ25h
bGluZy4NCj4gDQo+IFRoZSBkcml2ZXIgaXMgcmVhZGluZyBhIHUzMi4uLiBEaWQgeW91IHRlc3Qg
dGhpcz8NCg0KU3VyZSwgYWN0dWFsbHksIGhlcmUgc2hvdWxkIGJlIHVzZSBhIHUzMiB2YWx1ZS4u
Li4NCg0KVGhlIG9sZGVyIGRlc2NyaXB0aW9uIHdhcyBjb3JyZWN0LCBzb3JyeSwgSSBzaG91bGQg
YmUNCkNvcnJlY3Rpb24gdGhlIGV4YW1wbGUgbm9kZSBkZWZpbmUuLi4NCg0KJ2ludGVnZXIgb2Yg
dTMyIHZhbHVlIGRlc2NyaWJpbmcgdGhlIEFSUW9TIGxldmVscyBvZiBEUDUwMCdzIFFvUyBzaWdu
YWxpbmcnLCANCg0KPiANCj4gDQo+ID4NCj4gPg0KPiA+ICBFeGFtcGxlOg0KPiA+IEBAIC01NCw2
ICs1Niw3IEBAIEV4YW1wbGU6DQo+ID4gICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmb3NjY2xr
Mj4sIDwmZnBnYW9zYzA+LCA8JmZwZ2Fvc2MxPiwNCj4gPCZmcGdhb3NjMT47DQo+ID4gICAgICAg
ICAgICAgICAgIGNsb2NrLW5hbWVzID0gInB4bGNsayIsICJtY2xrIiwgImFjbGsiLCAicGNsayI7
DQo+ID4gICAgICAgICAgICAgICAgIGFybSxtYWxpZHAtb3V0cHV0LXBvcnQtbGluZXMgPSAvYml0
cy8gOCA8OCA4IDg+Ow0KPiA+ICsgICAgICAgICAgICAgICBhcm0sbWFsaWRwLWFycW9zLWhpZ2gt
bGV2ZWwgPSA8JnJxb3N2YWx1ZT47DQoJCQkJCWFybSxtYWxpZHAtYXJxb3MtaGlnaC1sZXZlbCA9
IDwgMHhkMDAwZDAwMD47DQoNCkJlc3QgUmVnYXJkcywNCldlbg0KDQo+ID4gICAgICAgICAgICAg
ICAgIHBvcnQgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGRwMF9vdXRwdXQ6IGVuZHBv
aW50IHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2lu
dCA9DQo+IDwmdGRhOTk4eF8yX2lucHV0PjsNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
