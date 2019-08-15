Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED379113E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF84A6E525;
	Sat, 17 Aug 2019 15:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410111.outbound.protection.outlook.com [40.107.141.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735F56E9AD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 13:38:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GX3t1Kg27SY6Mppn+aCkOj43knLXJo9Iqfg68GRHN1HhCfVxCpoYVywgcTEnObEwhgRfsdWPdkdjSn+HDrJdWLmP5Pxs2JAYtf+SJEnlRLs4uFcaoi/WmWMvwPWYEwXCVPzWkYY8Xx7eFCEABw6OO/B1CDQhb7ZxL9mzxagdL2RvcNTQJChgkEOpGgtuKRCYOUSikxsLh6snqzzjieR15rZV30IxKhZd8WYJkEG1xsDqbg9O1SwLtR9kBWPcz8aBdAjsz7XsxNj8YaXk0oiYE4tYpSDEVIkQ0X+/9mgZfg/qNsOyv14JKjDRBvDULaaUA+rlrMgBpfCj04RAfQbxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnpVbylAnyvRNJGIv9t6S6TVx7YjVOEZkPuJ+3HMxmU=;
 b=ZkSwpiXJN5BT6d9Qbyj1Td7gV5EwxB3kvPPNmv/oQCim/pIJ7U301GXiKNWXeyonc6z/3IcT+Gx9P1kjTVASCcMXZHk8ToX8tpY1Hb/VZPlFjTaI1Nd8GL03Kcby1jmejwf01EV6MvcwzVwuRrjzVL9wvRi7vkqrrS1th5dD22kUCXkaWfAARatOzU1Rxdeh0t9G/brCU4iR5/sgyLJDDEvd1i1RevB2UsH5dlNfMFzlj7eOPlnl7AnmcaoWmmplXpLRosBhqij6oJw1twA61XFKkA4I20Xr7lUNOY1IxDqpnqXGLFDZjgLXOGstpw47gyhkpAo36nhi1WoV2e51Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1852.jpnprd01.prod.outlook.com (52.133.164.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Thu, 15 Aug 2019 13:38:35 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 13:38:35 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 2/9] dt-bindings: display: Add bindings for Advantech
 IDK-2121WR
Thread-Topic: [PATCH v2 2/9] dt-bindings: display: Add bindings for Advantech
 IDK-2121WR
Thread-Index: AQHVU1lH7t05DLd9tUSILZ6YYuPIqab8F6+AgAAe9GA=
Date: Thu, 15 Aug 2019 13:38:35 +0000
Message-ID: <TY1PR01MB1770F0B8363364D4A9315577C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815114719.GI5011@pendragon.ideasonboard.com>
In-Reply-To: <20190815114719.GI5011@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02ce9ee8-5505-4c5a-6f29-08d72185df3f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1852; 
x-ms-traffictypediagnostic: TY1PR01MB1852:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB185260CDBDF6EDFFDE662A9AC0AC0@TY1PR01MB1852.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(54906003)(316002)(7416002)(8936002)(25786009)(74316002)(71190400001)(71200400001)(86362001)(966005)(478600001)(2906002)(26005)(186003)(66066001)(5660300002)(81156014)(81166006)(7696005)(76176011)(8676002)(64756008)(66446008)(102836004)(66556008)(76116006)(66946007)(66476007)(52536014)(7736002)(14454004)(33656002)(53546011)(6506007)(6436002)(3846002)(6246003)(229853002)(256004)(55016002)(6116002)(53936002)(6306002)(486006)(446003)(476003)(4326008)(6916009)(11346002)(9686003)(305945005)(99286004)(44832011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1852;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ruK4RITGpZK7XlldUO9jrrTVRlsi5jV1a5kT4ZIRLga8VrRaIBtn0wCgDPKdKFenzVzlKKkBIm4K77tgUy5gSruM0Wzhex6wawlNxIk62xqGqGOhijHCzfg26eqvC2eaCxNrxUEI7LjDaBOBqmptmUxw70LAtjnlp/Wiel3c2vJzpBiF93XeB+sT2rSLNgRTEUfO21cA8YmBwN03MIhpxea0J7HkOjTn7GXCxfbfGk5Im9X1IlVRlIC/ppge5ACpPqOqnZz63bAaHzAlln3NRZRG5Z3DYXhHUNizgBGiSlyDExMpAppNsfDlHdqTQnSR1eH3pMG2VuNz6gX1U0jCkboa3C+umvrRDcU60NPH3lUJDRmijQRP/ml2Xmh8AEF161qwTT5qUhzpIvbDQC9nqIWRzU1qLQMa8RF8NyUEY1o=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ce9ee8-5505-4c5a-6f29-08d72185df3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 13:38:35.4928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GFnfOG5i8Ti2x6rgOd7MPmYiWCM4lXg9Bd6G0l1DK/eHRKqNLUSsXnDLCcKqXzw0eFd4sSau6wTy1i0F6YAnjkUGboo45kaOJFmt/c3wdHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1852
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnpVbylAnyvRNJGIv9t6S6TVx7YjVOEZkPuJ+3HMxmU=;
 b=WqQ2wvvJDf2U40zXcr5cm2u/WCL5XsIgtkN7Gr0dgyU+1+MqeLecCdJ/YCeyb38Xnmc8A/d4KnDdjegl76tBZVjXLeUbdfzV07Txlbc2wydmkW7mhlUFdAXwH9jlp510M5ny3E0uewxjntUJyPGVNcB+iQ0tESWsWYHtPe/U9n4=
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMTUgQXVndXN0IDIwMTkgMTI6NDcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzldIGR0
LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQgYmluZGluZ3MgZm9yIEFkdmFudGVjaCBJREstMjEyMVdS
DQo+IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEyOjA0
OjI2UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gPiBUaGlzIHBhbmVsIGlzIGhh
bmRsZWQgdGhyb3VnaCB0aGUgZ2VuZXJpYyBsdmRzLXBhbmVsIGJpbmRpbmdzLA0KPiA+IHNvIG9u
bHkgbmVlZHMgaXRzIGFkZGl0aW9uYWwgY29tcGF0aWJsZSBzcGVjaWZpZWQuDQo+ID4NCj4gPiBT
b21lIHBhbmVsLXNwZWNpZmljIGRvY3VtZW50YXRpb24gY2FuIGJlIGZvdW5kIGhlcmU6DQo+ID4g
aHR0cHM6Ly9idXkuYWR2YW50ZWNoLmV1L0Rpc3BsYXlzL0VtYmVkZGVkLUxDRC1LaXRzLUhpZ2gt
QnJpZ2h0bmVzcy9tb2RlbC1JREstMjEyMVdSLUsyRkhBMkUuaHRtDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4N
Cj4gPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAqIFJld29ya2VkIGFjY29yZGluZyB0byBM
YXVyZW50J3MgZmVlZGJhY2sNCj4gPiAqIFJlbmFtZWQgbHZkczBfcGFuZWxfaW4gdG8gcGFuZWxf
aW4wDQo+ID4gKiBSZW5hbWVkIGx2ZHMxX3BhbmVsX2luIHRvIHBhbmVsX2luMQ0KPiA+DQo+ID4g
TGF1cmVudCwNCj4gPg0KPiA+IFNob3VsZCB0aGlzIGJlIGEgLnlhbWwgZmlsZSBhbHJlYWR5Pw0K
PiANCj4gSXQncyBub3QgYSBzdHJpY3QgcmVxdWlyZW1lbnQsIGJ1dCBJJ20gc3VyZSBSb2Igd291
bGQgcmVhbGx5IGFwcHJlY2lhdGUuDQo+IEkndmUgY29udmVydGVkIGEgRFQgYmluZGluZyB0byB5
YW1sIHJlY2VudGx5IChmb3IgYSBwYW5lbCB0b28pLCBhbmQgSQ0KPiBoYXZlIHRvIHNheSBJJ20g
aW1wcmVzc2VkIGJ5IHRoZSB2YWxpZGF0aW9uIHlhbWwgYnJpbmdzLCBib3RoIGZvciBEVA0KPiBz
b3VyY2VzIGFuZCBmb3IgRFQgYmluZGluZ3MuIEl0IGV2ZW4gdmFsaWRhdGVzIHRoZSBleGFtcGxl
IGluIHRoZQ0KPiBiaW5kaW5ncywgd2hpY2ggaXMgZ3JlYXQuIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS93cml0aW5nLXNjaGVtYS5tZA0KPiBzaG91bGQgZ2l2ZSB5b3UgYSBmZXcgcG9pbnRlcnMg
dG8gZ2V0IHN0YXJ0ZWQgKGluIHBhcnRpY3VsYXIgbWFrZSBzdXJlDQo+IHlvdSBydW4gbWFrZSBk
dF9iaW5kaW5nX2NoZWNrIGZvciB5b3VyIG5ldyBiaW5kaW5ncykuDQoNCldpbGwgZ2l2ZSB0aGlz
IGEgdHJ5Lg0KDQpUaGFua3MsDQpGYWINCg0KPiANCj4gPiAgLi4uL2Rpc3BsYXkvcGFuZWwvYWR2
YW50ZWNoLGlkay0yMTIxd3IudHh0ICAgICAgICAgfCA1NiArKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9h
ZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3
ci50eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9hZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAuLjZlZTFkMWINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlk
ay0yMTIxd3IudHh0DQo+ID4gQEAgLTAsMCArMSw1NiBAQA0KPiA+ICtBZHZhbnRlY2ggQ28uLCBM
dGQuIElESy0yMTIxV1IgMjEuNSIgTFZEUyBwYW5lbA0KPiA+ICs9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArUmVxdWlyZWQgcHJvcGVy
dGllczoNCj4gPiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImFkdmFudGVjaCxpZGstMjEyMXdy
IiBmb2xsb3dlZCBieSAicGFuZWwtbHZkcyINCj4gPiArDQo+ID4gK1RoaXMgYmluZGluZyBpcyBj
b21wYXRpYmxlIHdpdGggdGhlIGx2ZHMtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3BlY2lmaWVk
DQo+ID4gK2luIHBhbmVsLWx2ZHMudHh0IGluIHRoaXMgZGlyZWN0b3J5Lg0KPiA+ICtUaGUgcGFu
ZWwgb3BlcmF0ZXMgaW4gZHVhbC1saW5rIG1vZGUgYW5kIHRodXMgcmVxdWlyZXMgdHdvIHBvcnQg
bm9kZXMsDQo+ID4gK3RoZSBmaXJzdCBwb3J0IG5vZGUgZXhwZWN0cyBvZGQgcGl4ZWxzICgxLCAz
LCA1LCBldGMuKSBhbmQgdGhlIHNlY29uZCBwb3J0DQo+ID4gK2V4cGVjdHMgZXZlbiBwaXhlbHMg
KDAsIDIsIDQsIGV0Yy4pLg0KPiA+ICsNCj4gPiArRXhhbXBsZQ0KPiA+ICstLS0tLS0tDQo+ID4g
Kw0KPiA+ICsJcGFuZWwgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAiYWR2YW50ZWNoLGlkay0yMTIx
d3IiLCAicGFuZWwtbHZkcyI7DQo+ID4gKw0KPiA+ICsJCXdpZHRoLW1tID0gPDQ3Nj47DQo+ID4g
KwkJaGVpZ2h0LW1tID0gPDI2OD47DQo+ID4gKw0KPiA+ICsJCWRhdGEtbWFwcGluZyA9ICJ2ZXNh
LTI0IjsNCj4gPiArDQo+ID4gKwkJcGFuZWwtdGltaW5nIHsNCj4gPiArCQkJY2xvY2stZnJlcXVl
bmN5ID0gPDE0ODUwMDAwMD47DQo+ID4gKwkJCWhhY3RpdmUgPSA8MTkyMD47DQo+ID4gKwkJCXZh
Y3RpdmUgPSA8MTA4MD47DQo+ID4gKwkJCWhzeW5jLWxlbiA9IDw0ND47DQo+ID4gKwkJCWhmcm9u
dC1wb3JjaCA9IDw4OD47DQo+ID4gKwkJCWhiYWNrLXBvcmNoID0gPDE0OD47DQo+ID4gKwkJCXZm
cm9udC1wb3JjaCA9IDw0PjsNCj4gPiArCQkJdmJhY2stcG9yY2ggPSA8MzY+Ow0KPiA+ICsJCQl2
c3luYy1sZW4gPSA8NT47DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gKwkJcG9ydHMgew0KPiA+ICsJ
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArCQkJI3NpemUtY2VsbHMgPSA8MD47DQo+ID4g
Kw0KPiA+ICsJCQlwb3J0QDAgew0KPiA+ICsJCQkJLyogT2RkIHBpeGVscyAqLw0KPiA+ICsJCQkJ
cmVnID0gPDA+Ow0KPiA+ICsJCQkJcGFuZWxfaW4wOiBlbmRwb2ludCB7DQo+ID4gKwkJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZsdmRzMF9vdXQ+Ow0KPiA+ICsJCQkJfTsNCj4gPiArCQkJfTsNCj4g
PiArDQo+ID4gKwkJCXBvcnRAMSB7DQo+ID4gKwkJCQkvKiBFdmVuIHBpeGVscyAqLw0KPiA+ICsJ
CQkJcmVnID0gPDE+Ow0KPiA+ICsJCQkJcGFuZWxfaW4xOiBlbmRwb2ludCB7DQo+ID4gKwkJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMV9vdXQ+Ow0KPiA+ICsJCQkJfTsNCj4gPiArCQkJfTsN
Cj4gPiArCQl9Ow0KPiA+ICsJfTsNCj4gPiAtLQ0KPiA+IDIuNy40DQo+ID4NCj4gDQo+IC0tDQo+
IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
