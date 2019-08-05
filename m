Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7B482C89
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A1C89B7B;
	Tue,  6 Aug 2019 07:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410122.outbound.protection.outlook.com [40.107.141.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAFD89AB9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S44m0UwFpIWEZYq6IC3LrBcpQbUyoicam2G2ZrfkTLqYm/IzBx4ZVjeNNQKHYv1i3ES2dREuxidfs61om2IWByBSDFsF3fnorIDMsUHow4aECGLzBv7B5QI3Ounvu+oyA5USlk6QLxCrHJchVbzhPT6lNmMgCuGcERFEGonZzchUgz5dJz2MNndptsJsWXv5lxGwUwugqFiidatr2w9X/eV2QcYz+23GOBoj9waaZJwPfoaXyL0ZYF+0IXgkUsCyiL2CYHqwZG4lR6L7u8ATzgSHFCgMuQX1LWvEQCEb/JH0cnwUcJ6vklzwLgytS+8X+MkA6soei479wPnHl+78EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjSRsjKkqZ+BPtxiJJZsF/r6f+yBXa+fysjH406Nexw=;
 b=P9aYds1dhLQvFZTX5AmcGgSU7rx6b51kfD27vZsTqnvzcptK+9S2keXwSjhXVELVl9FNV2/ohKnmSMonHzQHXogdARJbrGEtSweJVmIm8VFn5H4BEuMNlAF1XePL2dUsjuoqEy/ALBIyChAA2Re2DXqhUnTJB5EZqU4mY4YRYEkbmO1of7DUqNQbitWL17wUriZnG5LaAJEFWphuX3HGacey69gpwwnsYHnl5qi/Fsj6gPZBwjs4FFKqd+3Lzq/Rw6i32R71W1pTxaODuI9Dz2oKJejz9gj9AhhxxxZJy2eaLm+NS6jiSFAR1nwls+DB/yor4Te/Y00ovaItdpbO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1753.jpnprd01.prod.outlook.com (52.133.160.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:32:42 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:32:42 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
Thread-Topic: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
Thread-Index: AQHVSQTKYmjDUkedxEyBXClm+R2Nz6bngEOAgATLqrA=
Date: Mon, 5 Aug 2019 09:32:42 +0000
Message-ID: <TY1PR01MB1770F1B00FEA431E43978FD9C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802080613.GF5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802080613.GF5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24426f8e-4a41-4a06-4929-08d71987ddd8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1753; 
x-ms-traffictypediagnostic: TY1PR01MB1753:
x-microsoft-antispam-prvs: <TY1PR01MB1753169E543400F0534C1148C0DA0@TY1PR01MB1753.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(8676002)(99286004)(54906003)(446003)(11346002)(5660300002)(305945005)(256004)(476003)(71200400001)(71190400001)(81166006)(7696005)(7736002)(6246003)(53936002)(4326008)(186003)(6916009)(486006)(52536014)(8936002)(6116002)(3846002)(478600001)(107886003)(74316002)(7416002)(86362001)(229853002)(66556008)(66476007)(64756008)(66446008)(2906002)(53546011)(6506007)(66946007)(44832011)(316002)(6436002)(55016002)(26005)(76176011)(68736007)(76116006)(81156014)(66066001)(33656002)(25786009)(9686003)(102836004)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1753;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Z53RhhO92RPEYmdNkcw8NnEFkKbZq8/UH3Wm0YNGs3N1AsxKw4mf4X+vcXQqbHOla0DSckBu82aXGGW3OD1j3lJvMKOtMIk/Bu+Gqj5cWfkwlFA+/RVr4z4zNO5ytVaUhe/ZIlrmsbMwZmSMR8NQmaXzPNdduK5pr82i1M2HwlPxhuRFuoEobIu7z761kH1f3kHV0U+GVYf3uEENHZQ5XsaSIYSPxjjxUBO43JsCXGhV6ZnEHlqFckN+TxeZ/pW9FHnsl8Zogh0YI5pWDrkOT3BJ1Eih/VuJ2ec629mfTMdJ+D9mgEV7ivPHg6HTKMg+xUwqIvpM2t1tlF8Wjp0aQE1QbZKz3neTpAZRKM0GWDIT21EiWex72rrZK90QBU/bOXLXkGMC/5ttLIHq5vuaLFQDOjnLH+QkLA4DGserO4=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24426f8e-4a41-4a06-4929-08d71987ddd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:32:42.7494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1753
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjSRsjKkqZ+BPtxiJJZsF/r6f+yBXa+fysjH406Nexw=;
 b=PqRsA6RflTZguBFbhXOQBbu9r2vI46S9qJWqhYVL/hf0x6Rej54p8t5G31I1j5zyaSnEqcqJvh5VUf98DY0EMu2uvZeEpHIz8FOHm6mmDBta8D6mcc5zdZ0HvNLzk7VhTEG4/7WSTvadkZtBnc796caCLonYz6cWJCDa0zX5sIU=
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMDIgQXVndXN0IDIwMTkgMDk6MDYNCj4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDUvMTJd
IGRybTogcmNhci1kdTogbHZkczogQWRkIGRhdGEgc3dhcCBzdXBwb3J0DQo+IA0KPiBIaSBGYWJy
aXppbywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gRnJpLCBBdWcg
MDIsIDIwMTkgYXQgMDg6MzQ6MDJBTSArMDEwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+
IFdoZW4gaW4gdmVydGljYWwgc3RyaXBlIG1vZGUgb2Ygb3BlcmF0aW9uLCB0aGVyZSBpcyB0aGUg
b3B0aW9uDQo+ID4gb2Ygc3dhcHBpbmcgZXZlbiBkYXRhIGFuZCBvZGQgZGF0YSBvbiB0aGUgdHdv
IExWRFMgaW50ZXJmYWNlcw0KPiA+IHVzZWQgdG8gZHJpdmUgdGhlIHZpZGVvIG91dHB1dC4NCj4g
PiBBZGQgZGF0YSBzd2FwIHN1cHBvcnQgYnkgZXhwb3NpbmcgYSBuZXcgRFQgcHJvcGVydHkgbmFt
ZWQNCj4gPiAicmVuZXNhcyxzd2FwLWRhdGEiLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgMjMgKysrKysrKysrKysr
KysrKy0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+IGlu
ZGV4IDNhZWFmOWUuLmMzMDZmYWIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9sdmRzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2x2ZHMuYw0KPiA+IEBAIC02OSw2ICs2OSw3IEBAIHN0cnVjdCByY2FyX2x2ZHMgew0KPiA+DQo+
ID4gIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqY29tcGFuaW9uOw0KPiA+ICAJYm9vbCBkdWFsX2xpbms7
DQo+ID4gKwlib29sIHN0cmlwZV9zd2FwX2RhdGE7DQo+ID4gIH07DQo+ID4NCj4gPiAgI2RlZmlu
ZSBicmlkZ2VfdG9fcmNhcl9sdmRzKGJyaWRnZSkgXA0KPiA+IEBAIC00MzksMTIgKzQ0MCwxNiBA
QCBzdGF0aWMgdm9pZCByY2FyX2x2ZHNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Up
DQo+ID4gIAlyY2FyX2x2ZHNfd3JpdGUobHZkcywgTFZEQ0hDUiwgbHZkaGNyKTsNCj4gPg0KPiA+
ICAJaWYgKGx2ZHMtPmluZm8tPnF1aXJrcyAmIFJDQVJfTFZEU19RVUlSS19EVUFMX0xJTkspIHsN
Cj4gPiAtCQkvKg0KPiA+IC0JCSAqIENvbmZpZ3VyZSB2ZXJ0aWNhbCBzdHJpcGUgYmFzZWQgb24g
dGhlIG1vZGUgb2Ygb3BlcmF0aW9uIG9mDQo+ID4gLQkJICogdGhlIGNvbm5lY3RlZCBkZXZpY2Uu
DQo+ID4gLQkJICovDQo+ID4gLQkJcmNhcl9sdmRzX3dyaXRlKGx2ZHMsIExWRFNUUklQRSwNCj4g
PiAtCQkJCWx2ZHMtPmR1YWxfbGluayA/IExWRFNUUklQRV9TVF9PTiA6IDApOw0KPiA+ICsJCXUz
MiBsdmRzdHJpcGUgPSAwOw0KPiA+ICsNCj4gPiArCQlpZiAobHZkcy0+ZHVhbF9saW5rKQ0KPiA+
ICsJCQkvKg0KPiA+ICsJCQkgKiBDb25maWd1cmUgdmVydGljYWwgc3RyaXBlIGJhc2VkIG9uIHRo
ZSBtb2RlIG9mDQo+ID4gKwkJCSAqIG9wZXJhdGlvbiBvZiB0aGUgY29ubmVjdGVkIGRldmljZS4N
Cj4gPiArCQkJICovDQo+ID4gKwkJCWx2ZHN0cmlwZSA9IExWRFNUUklQRV9TVF9PTiB8IChsdmRz
LT5zdHJpcGVfc3dhcF9kYXRhID8NCj4gPiArCQkJCQkJICAgICAgIExWRFNUUklQRV9TVF9TV0FQ
IDogMCk7DQo+IA0KPiBXb3VsZCB0aGUgZm9sbG93aW5nIGJlIHNpbXBsZXIgPw0KPiANCj4gCQls
dmRzdHJpcGUgPSAobHZkcy0+ZHVhbF9saW5rID8gTFZEU1RSSVBFX1NUX09OIDogMCkNCj4gCQkJ
ICB8IChsdmRzLT5zdHJpcGVfc3dhcF9kYXRhID8gTFZEU1RSSVBFX1NUX1NXQVAgOiAwKTsNCj4g
DQo+ID4gKwkJcmNhcl9sdmRzX3dyaXRlKGx2ZHMsIExWRFNUUklQRSwgbHZkc3RyaXBlKTsNCg0K
SSBhY3R1YWxseSB0aGluayBJIG5lZWQgdG8gcmV3b3JrIHRoaXMgcGF0Y2ggc2xpZ2h0bHksIGJl
Y2F1c2UgdGhlIHVzZXIgbWFudWFsDQpzYXlzIHRoYXQgU1RfU1dBUCBpcyByZXNlcnZlZCBmb3Ig
TFZEMVNUUklQRSwgc28gSSBuZWVkIHRvIG1ha2Ugc3VyZSB3ZQ0KZG9uJ3Qgc2V0IGl0IGZvciBM
VkRTMS4NCg0KU28gcGVyaGFwcywgdGhpcyBjb3VsZCB0cmFuc2xhdGUgdG8gc29tZXRoaW5nIGxp
a2U6DQpJZiAobHZkcy0+ZHVhbF9saW5rKQ0KCWx2ZHN0cmlwZSA9IExWRFNUUklQRV9TVF9PTiB8
ICg8c3dhcC13aGF0ZXZlcj4gJiYgbHZkcy0+Y29tcGFuaW9uKSA/IExWRFNUUklQRV9TVF9TV0FQ
IDogMCk7DQoNCkkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGJlIHNldHRpbmcgTFZEU1RSSVBFX1NU
X1NXQVAgd2l0aG91dCBMVkRTVFJJUEVfU1RfT04sIHRoaXMgc29sdXRpb24NCndvdWxkIGFsbG93
IHVzIHRvIHRlc3QgbHZkcy0+ZHVhbF9saW5rIG9ubHkgb25jZSwgYW5kIHdpbGwgcHJldmVudCB1
cyBmcm9tIHNldHRpbmcgTFZEU1RSSVBFX1NUX1NXQVAgaWYNCkxWRFNUUklQRV9TVF9PTiBpcyBu
b3Qgc2V0IG9yIGlmIHdlIGFyZSB0b3VjaGluZyBMVkRTMS4NCg0KV2hhdCBkbyB5b3UgdGhpbms/
DQoNClRoYW5rcywNCkZhYg0KDQo+ID4gIAl9DQo+ID4NCj4gPiAgCS8qDQo+ID4gQEAgLTc3MCw4
ICs3NzUsMTIgQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHQoc3RydWN0IHJjYXJfbHZk
cyAqbHZkcykNCj4gPiAgCQl9DQo+ID4gIAl9DQo+ID4NCj4gPiAtCWlmIChsdmRzLT5kdWFsX2xp
bmspDQo+ID4gKwlpZiAobHZkcy0+ZHVhbF9saW5rKSB7DQo+ID4gKwkJbHZkcy0+c3RyaXBlX3N3
YXBfZGF0YSA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbCgNCj4gPiArCQkJCQkJbHZkcy0+ZGV2LT5v
Zl9ub2RlLA0KPiA+ICsJCQkJCQkicmVuZXNhcyxzd2FwLWRhdGEiKTsNCj4gPiAgCQlyZXQgPSBy
Y2FyX2x2ZHNfcGFyc2VfZHRfY29tcGFuaW9uKGx2ZHMpOw0KPiA+ICsJfQ0KPiANCj4gQXMgZXhw
bGFpbmVkIGluIHRoZSByZXZpZXcgb2YgdGhlIGNvcnJlc3BvbmRpbmcgRFQgYmluZGluZ3MsIEkg
dGhpbmsNCj4gdGhpcyBzaG91bGQgYmUgcXVlcmllZCBmcm9tIHRoZSByZW1vdGUgZGV2aWNlIHJh
dGhlciB0aGFuIHNwZWNpZmllZCBpbg0KPiBEVC4NCj4gDQo+ID4NCj4gPiAgZG9uZToNCj4gPiAg
CW9mX25vZGVfcHV0KGxvY2FsX291dHB1dCk7DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4g
TGF1cmVudCBQaW5jaGFydA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
