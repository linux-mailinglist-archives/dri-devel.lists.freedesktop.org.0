Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17653A326F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C8E6E2BE;
	Fri, 30 Aug 2019 08:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400103.outbound.protection.outlook.com [40.107.140.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B26F6E142
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:38:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKL3JZmpH+P0p5vXykLKZOl2kN3rj/jTHzPd2k5kcE2dxTWgx6NT9fvvBN7Cn6/y5mccawdrz1jZ4CXjsaLE0cnquOynG48/ZQvzocx5TYgfJ8AVKDXOoox9pvZJvOQmsRTe1fCDZIeU+ZbMq10giOesHwbfRdqgoGP9wbyASVyxTYhlI8JRu/Ydj/3mYHCTnonN5fefOUTxls8kchmcZa60QZLBTqJPJ47x/s4fuymejO7M1wkbSTagXYbLLyu5urm6lhUczIXRFwf/2wdfc3mzf3v0rnZDzNjTwpZtinL541gr7wVdMt/i8kw/IzVQcuGMFpv+pTyeqtDZl6bQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk2ftVWDRukc11fHW3qUcam0QuEaXF4MvsLFwnp0r9g=;
 b=jD65g369jzgJnNs2qADQYtHIT2wUSV9oE3tjUhqoPz4JPYq+2c9AoUncMGdh4bgsveojf1UZ3ONDRZ0I6MHCUGMIXCAFtcI03yx8nHvzn2bs0AHhloaZK3cnYtclV/iLal2os3x/xNh3eSwmGQu+mYnLNr+gUWi7PgRYeaX35kCJe0Inx3HuiM1SsmUf1zHsri24lmPnZqluyy8Kh7dwbUGRVG6Sq8+LIn3fucCaLIn4L6lG9uNGjyf4lezldXpzHW6Kk+6b6ScLModfLgnVbjMR0R2GjSqhAogA8noleBXrTddJBvv7b5mtzUxTYklAyRomLL5Kgy1uTfE1teMfpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1721.jpnprd01.prod.outlook.com (52.133.164.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 29 Aug 2019 14:38:07 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd%5]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 14:38:06 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
Thread-Topic: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
Thread-Index: AQHVXc+S57mj9oC72Eeu0P6rCOw/zacSKVsAgAAGgdA=
Date: Thu, 29 Aug 2019 14:38:06 +0000
Message-ID: <TY1PR01MB177060B843107361FEF44022C0A20@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqKWWCpEeBd4UFaqBVffS-OxUNAHfvtJKcGsLDR+f=Uytg@mail.gmail.com>
In-Reply-To: <CAL_JsqKWWCpEeBd4UFaqBVffS-OxUNAHfvtJKcGsLDR+f=Uytg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69d7cd7e-2339-43d8-36b2-08d72c8e81bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:TY1PR01MB1721; 
x-ms-traffictypediagnostic: TY1PR01MB1721:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1721F5298C6843B7D676393BC0A20@TY1PR01MB1721.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(136003)(376002)(346002)(39850400004)(189003)(199004)(5660300002)(71200400001)(71190400001)(486006)(44832011)(476003)(11346002)(33656002)(446003)(8936002)(86362001)(53546011)(2906002)(6506007)(102836004)(478600001)(6436002)(26005)(99286004)(53376002)(6246003)(54906003)(316002)(14454004)(76176011)(25786009)(55016002)(4326008)(6306002)(6116002)(186003)(3846002)(966005)(7696005)(9686003)(8676002)(66946007)(66476007)(66556008)(7736002)(81156014)(81166006)(76116006)(256004)(52536014)(66446008)(64756008)(66066001)(53936002)(7416002)(229853002)(305945005)(74316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1721;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ROfJN9JuMu4MEO6irQfCAIlT1WPlEGCNT69T1fUbOTZHCWOMKw01KjAIFUTlYVUFnI8L/kBZ2ikMYgbPwe1n8Z2XOpcjaZx3Q6eMqAZj5VoOm3DjxNZN8wrmkrKpYZnSfcNr+Q8eQzvzfplHyFZNsl3TVCwyMzz2HEWwuywUy0r7u13GxZA0bXpyj8NUAKROEEoNsh9k8BAyhVVXpendXvgbJ0oNHh7RkmH04OFklPjYothYavV8hoT4t9PFbUag0DOgyInvzCxjhFD2QyloiB9C+yquMrebgytXmT14TPhipZENq0IBc+ijhTSHzP2tkf3thEKTE04BFJuE/mcodjulxVNUaPYlb0LqqtfYyxlO3kFEkIZFjR+vmh9nVuYLUC7M5D612wfwGbuAi4Va+stRn4Ko082t35zOdpAdwqs=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d7cd7e-2339-43d8-36b2-08d72c8e81bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 14:38:06.5375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C3OAjlt/EC8AIKv+e7rQoKuTp6Ht7hEKHjU+iciU/BEw9QOSHKJfkRuv42fD3SZ49cT7PrOkE8yXr0kTzI2w/dLASnFB2jPY1akKS9QGw5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1721
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk2ftVWDRukc11fHW3qUcam0QuEaXF4MvsLFwnp0r9g=;
 b=cR/jqkUhy2kQCAQnpt/SNF9ul9UhQAtjxUVv29zGSzoyLM/sKP2QUYf13lI81vsrymMiXJCK/n2+PlBVO3/1i40+l13UgzRiaT6/LguCjDqzyx0LPHw42HDHHC2l6cj8yKSd+6+mwa/MUIHl1hP3of4o7CodskSkKuRCkUjyBNs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQoNCj4gRnJvbTogUm9iIEhl
cnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gU2VudDogMjkgQXVndXN0IDIwMTkgMTU6MDMN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzhdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQg
YmluZGluZ3MgZm9yIExWRFMgYnVzLXRpbWluZ3MNCj4gDQo+IE9uIFdlZCwgQXVnIDI4LCAyMDE5
IGF0IDE6MzYgUE0gRmFicml6aW8gQ2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNh
cy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRHVhbC1MVkRTIGNvbm5lY3Rpb25zIG5lZWQgbWFya2Vy
cyBpbiB0aGUgRFQsIHRoaXMgcGF0Y2ggYWRkcw0KPiA+IHNvbWUgY29tbW9uIGRvY3VtZW50YXRp
b24gdG8gYmUgcmVmZXJlbmNlZCBieSBib3RoIHBhbmVscyBhbmQNCj4gPiBicmlkZ2VzLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAu
cmVuZXNhcy5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gKiBuZXcgcGF0Y2gN
Cj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnVzLXRpbWluZ3MvbHZkcy55YW1s
ICAgICAgICAgfCAzOCArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9idXMtdGltaW5ncy9sdmRzLnlhbWwNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9idXMtdGltaW5ncy9sdmRzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9idXMtDQo+IHRpbWluZ3MvbHZkcy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwLi5mMzViNTVhDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2J1cy10aW1p
bmdzL2x2ZHMueWFtbA0KPiA+IEBAIC0wLDAgKzEsMzggQEANCj4gPiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KPiANCj4gKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
IGlzIHByZWZlcnJlZCBmb3IgbmV3IGJpbmRpbmdzLg0KPiANCj4gPiArJVlBTUwgMS4yDQo+ID4g
Ky0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnVz
LXRpbWluZ3MvbHZkcy55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBDb21tb24gUHJvcGVy
dGllcyBmb3IgYnVzIHRpbWluZ3Mgb2YgTFZEUyBpbnRlcmZhY2VzDQo+ID4gKw0KPiA+ICttYWlu
dGFpbmVyczoNCj4gPiArICAtIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5j
b20+DQo+ID4gKyAgLSBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2Fz
LmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAgVGhpcyBkb2N1bWVudCBk
ZWZpbmVzIGRldmljZSB0cmVlIHByb3BlcnRpZXMgY29tbW9uIHRvIExWRFMgYW5kIGR1YWwtTFZE
Uw0KPiA+ICsgIGludGVyZmFjZXMsIHdoZXJlIGEgZHVhbC1MVkRTIGludGVyZmFjZSBpcyBhIGR1
YWwtbGluayBjb25uZWN0aW9uIHdpdGggZXZlbg0KPiA+ICsgIHBpeGVscyB0cmF2ZWxpbmcgb24g
b25lIGNvbm5lY3Rpb24sIGFuZCB3aXRoIG9kZCBwaXhlbHMgdHJhdmVsaW5nIG9uIHRoZSBvdGhl
cg0KPiA+ICsgIGNvbm5lY3Rpb24uDQo+ID4gKyAgVGhpcyBkb2N1bWVudCBkb2Vzbid0IGNvbnN0
aXR1ZSBhIGRldmljZSB0cmVlIGJpbmRpbmcgc3BlY2lmaWNhdGlvbiBieSBpdHNlbGYNCj4gDQo+
IHR5cG86IGNvbnN0aXR1dGUNCg0KV2VsbCBzcG90dGVkIQ0KDQo+IA0KPiA+ICsgIGJ1dCBpcyBt
ZWFudCB0byBiZSByZWZlcmVuY2VkIGJ5IGRldmljZSB0cmVlIGJpbmRpbmdzLg0KPiA+ICsgIFdo
ZW4gcmVmZXJlbmNlZCBmcm9tIHBhbmVsIG9yIGJyaWRnZSBkZXZpY2UgdHJlZSBiaW5kaW5ncywg
dGhlIHByb3BlcnRpZXMNCj4gPiArICBkZWZpbmVkIGluIHRoaXMgZG9jdW1lbnQgYXJlIGRlZmlu
ZWQgYXMgZm9sbG93cy4gVGhlIHBhbmVsIGFuZCBicmlkZ2UgZGV2aWNlDQo+ID4gKyAgdHJlZSBi
aW5kaW5ncyBhcmUgcmVzcG9uc2libGUgZm9yIGRlZmluaW5nIHdoZXRoZXIgZWFjaCBwcm9wZXJ0
eSBpcyByZXF1aXJlZA0KPiA+ICsgIG9yIG9wdGlvbmFsLg0KPiA+ICsNCj4gPiArcHJvcGVydGll
czoNCj4gPiArICBkdWFsLWx2ZHMtZXZlbi1waXhlbHM6DQo+ID4gKyAgICB0eXBlOiBib29sZWFu
DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzcGVj
aWZpYyB0byBhbiBpbnB1dCBwb3J0IG9mIGEgc2luayBkZXZpY2UuIFdoZW4NCj4gDQo+IFRoZSBz
Y2hlbWEgc2hvdWxkIGRlZmluZSB3aGF0IG5vZGVzIHRoZXNlIGdvIGluLiBUaGUgZGVzY3JpcHRp
b24gc2VlbXMNCj4gdG8gaW5kaWNhdGUgaW4gJ3BvcnQnIG5vZGVzIChvciBlbmRwb2ludD8pLCBi
dXQgeW91ciB1c2UgaW4gdGhlIHBhbmVsDQo+IGJpbmRpbmcgcHV0cyB0aGVtIGluIHRoZSBwYXJl
bnQuDQoNCkRpZCB5b3UgbWFuYWdlIHRvIHJlYWQgdGhpcz8NCmh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvY292ZXIvMTExMTk2MDcvDQoNCkNvdWxkIHlvdSBwbGVhc2UgYWR2aWNlIG9uIGhv
dyB0byBkbyB0aGlzIHByb3Blcmx5Pw0KDQo+IA0KPiA+ICsgICAgICBzcGVjaWZpZWQsIGl0IG1h
cmtzIHRoZSBwb3J0IGFzIHJlY2lwaWVudCBvZiBldmVuLXBpeGVscy4NCj4gPiArDQo+ID4gKyAg
ZHVhbC1sdmRzLW9kZC1waXhlbHM6DQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKyAgICBk
ZXNjcmlwdGlvbjoNCj4gPiArICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzcGVjaWZpYyB0byBhbiBp
bnB1dCBwb3J0IG9mIGEgc2luayBkZXZpY2UuIFdoZW4NCj4gPiArICAgICAgc3BlY2lmaWVkLCBp
dCBtYXJrcyB0aGUgcG9ydCBhcyByZWNpcGllbnQgb2Ygb2RkLXBpeGVscy4NCj4gDQo+IEhvd2V2
ZXIsIEkgZG9uJ3QgdGhpbmsgeW91IGV2ZW4gbmVlZCB0aGVzZS4gQSBwYW5lbCdzIHBvcnQgbnVt
YmVycyBhcmUNCj4gZml4ZWQgY2FuIGltcGx5IGV2ZW4gb3Igb2RkLiBGb3IgZXhhbXBsZSBwb3J0
QDAgY2FuIGJlIGV2ZW4gYW5kIHBvcnRAMQ0KPiBjYW4gYmUgb2RkLiBUaGUgcG9ydCBudW1iZXJp
bmcgaXMgdHlwaWNhbGx5IHBhbmVsIHNwZWNpZmljLCBidXQgd2UgbWF5DQo+IGJlIGFibGUgdG8g
ZGVmaW5lIHRoZSBudW1iZXJpbmcgZ2VuZXJpY2FsbHkgaWYgd2UgZG9uJ3QgYWxyZWFkeSBoYXZl
DQo+IHBhbmVscyB3aXRoIG11bHRpcGxlIHBvcnRzLg0KPiANCj4gQWxzbywgYXJlbid0IHRoZXJl
IGR1YWwgbGluayBEU0kgcGFuZWxzPw0KDQpUaGlzIGlzIHRoZSByZXN1bHQgb2YgYSBkaXNjdXNz
aW9uIG9uIGhlcmU6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMDk1NTQ3
Lw0KDQpIYXZlIHlvdSBjb21lIGFjcm9zcyBpdD8NCg0KVGhhbmtzIQ0KRmFiDQoNCj4gDQo+IFJv
Yg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
