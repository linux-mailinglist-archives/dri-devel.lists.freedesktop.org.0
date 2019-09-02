Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFABA5CFB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7B189A0E;
	Mon,  2 Sep 2019 20:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400124.outbound.protection.outlook.com [40.107.140.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367F98982C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 10:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=es6TV4oT86Gtl8j/Fmg5F6jQEN6XUmTsCJ+xgGDYn/4gO3bE0qamorG7HE+3C2yAcLihwUvC87poQs3IJHaFPSfnfJmapsbDAw+APTEZ/Ie+VD8gOzrmtnCK5ciPLKFgQ9YWSV5DQEvu4y7OrD+l0L35UTJLY5tXcW3chvPump7T8UQy3LaCRhWwZx8eZHRzBvy15hk++ab4GaVImA8bZA9e24wrs0TewrGkD005bfyXgWTDjay2OyLPurDeJ+BdiI4aeVcYZZNWHLaLIWo/xpfRJfELgtiyxdoPo8HXp2KaHbeFEJcleqVky8Z7zCDpr0bAX+fI4D0PyZjS/fK0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iam/u8neA1QK/hQi10l6PmBSmzZ3CW4Q7I9tAe6wFwc=;
 b=T1a0+tdf2Ij2/Cs841tuUEzhf6JzRZVSNU/mqZn3q1Q8yQj+kAj+x/Yj5HaM99Rd1fKIyZPkCAb9SZGzBsQrsQ1TlXan0TboE5xXAitAwtjBrnYTR0Ek48O1PhBEuGcm11KnJzqJ9GwkMpJlOWxCrRAjSenDZZVaujE/V0s6N5H/E3VGgwLN+m8YtukB3FkHOIm9VMeNevFlgp7PFzy1a9m0sAH402ngcFg9zv8k0EoxKoBRjRIcH7L6hfZy+H7pz0gEdPj6JZOm8jo//crCLDQNxnBCEROXa71E3qvkYNR0eGQ2qIXXj51bLBVUxWOBFekIT9hA0cp88ViIlbYmkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1594.jpnprd01.prod.outlook.com (52.133.161.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 2 Sep 2019 10:01:01 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd%5]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:01:01 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
Thread-Topic: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
Thread-Index: AQHVXc+RlrcIOAtYlU6wFCg32X69c6cSQLOAgAXt1BA=
Date: Mon, 2 Sep 2019 10:01:01 +0000
Message-ID: <TY1PR01MB17700DA7BEC8DA3AA32BEA53C0BE0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_Jsq+5FMHK4W4UQU24g+rm3CLjnhRcB29skygRB++GaJyM0A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+5FMHK4W4UQU24g+rm3CLjnhRcB29skygRB++GaJyM0A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f948ce04-1668-4099-add8-08d72f8c7608
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1594; 
x-ms-traffictypediagnostic: TY1PR01MB1594:|TY1PR01MB1594:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1594504F63D6E4DD4235AC0BC0BE0@TY1PR01MB1594.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(199004)(189003)(446003)(7696005)(8676002)(186003)(110136005)(81166006)(81156014)(9686003)(66066001)(53546011)(6506007)(74316002)(71200400001)(71190400001)(26005)(54906003)(33656002)(8936002)(256004)(478600001)(86362001)(6246003)(14444005)(7416002)(66556008)(66476007)(486006)(5660300002)(64756008)(66446008)(11346002)(966005)(316002)(44832011)(476003)(2906002)(76116006)(102836004)(7736002)(76176011)(6436002)(305945005)(14454004)(55016002)(6116002)(3846002)(99286004)(52536014)(229853002)(53936002)(6306002)(4326008)(66946007)(25786009)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1594;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:3; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +dj83F7+2yVDqTvF/tZqYG7S4/p6FCgeoakzqIAsQKrMajtUe18Uzj6xIfR2U34i0pt1plff4MJ4kqdDaPwMvKyrXXUZ+DIFu4wPKde1No61rBW7+Jxs0SKTSA3EcLf1tEyVtTCDbOm3oEEHjygyKU6Sp1H+C7veEbeFVbrTpBMTa0IAwcKwLzLom7iETR8e06Dosmn8yaa9Agl0YZxqwFIrlHSzj2f8lZ3K9rp97JHI21e8HynDVKi9uLQkVBPX/RPC1b0bgVSOHiuWJ0TRLhEpsOlpMX9nbo1O2qrd1JLBVOVpJ8EZSrysL5CXZH9IBKzrzA6BUJrKWk465QxYZnkG2kLKeCy40LCrr5eOIS7teduMBCmo281tGFhnt+98scdlMr3wBZ5Cu8em3oB/tBlGMiMwfVbiLzB1mUILh7I=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f948ce04-1668-4099-add8-08d72f8c7608
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:01:01.2285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rne7QRVDvKgRW6nvvL+LXs+C8wxghq8yHG1n2Ozjz6gJbz3Q9zbMt2WyiJ14e9tPPCRraG7Kueh8eRXPQ26QXmUCUFBKoS1AIQ+SuIoAm6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1594
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iam/u8neA1QK/hQi10l6PmBSmzZ3CW4Q7I9tAe6wFwc=;
 b=ajaCCb0bWNFhAR8EfqtVSA6JKem3+p6UXBozMo7pM46airEK13HqZwZ8N1J+nE+5j2xCK5tYFovEVg6LJeEP2HDwIiBeuDfDy3s5JpBtSB650D/M4OUjrnh929DK6tmd78fMEsyPwcsge9+B6g9JwJu//hnVXrLPto+tKr5YFes=
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
 Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>,
 Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQoNCj4gRnJvbTogUm9iIEhl
cnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gU2VudDogMjkgQXVndXN0IDIwMTkgMTY6MjcN
Cj4gVG86IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAvOF0gQWRkIGR1YWwtTFZEUyBwYW5lbCBzdXBwb3J0
IHRvIEVLODc0DQo+IA0KPiBPbiBXZWQsIEF1ZyAyOCwgMjAxOSBhdCAxOjM2IFBNIEZhYnJpemlv
IENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0K
PiA+IERlYXIgQWxsLA0KPiA+DQo+ID4gdGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBkdWFs
LUxWRFMgcGFuZWwgSURLLTIxMjFXUg0KPiA+IGZyb20gQWR2YW50ZWNoOg0KPiA+IGh0dHBzOi8v
YnV5LmFkdmFudGVjaC5ldS9EaXNwbGF5cy9FbWJlZGRlZC1MQ0QtS2l0cy1IaWdoLUJyaWdodG5l
c3MvbW9kZWwtSURLLTIxMjFXUi1LMkZIQTJFLmh0bQ0KPiA+DQo+ID4gVjMgYXBwcm9hY2hlcyB0
aGUgcHJvYmxlbSBpbiBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IHdheSwgd2Ugbm93DQo+ID4gaGF2
ZSB0d28gbmV3IHByb3BlcnRpZXMgdG8gbWFyayB0aGUgcG9ydHMgaW4gdGhlIERUIGFzIHJlY2Vp
dmluZw0KPiA+IGV2ZW4gcGl4ZWxzIGFuZCBvZGQgcGl4ZWxzOiBkdWFsLWx2ZHMtZXZlbi1waXhl
bHMgYW5kIGR1YWwtbHZkcy1vZGQtcGl4ZWxzLA0KPiA+IHdoaWNoIG1lYW5zIGRldmljZSBkcml2
ZXJzIHNob3VsZCBub3QgdXNlIGJyaWRnZSBzcGVjaWZpYyBvciBwYW5lbA0KPiA+IHNwZWNpZmlj
IGR1YWxfbGluayBmbGFncy4gQWxzbywgaW4gdGhpcyBjYXNlIHRoZSBEVCBkZXNjcmliZXMgdGhl
DQo+ID4gY29ubmVjdGlvbiBmdWxseS4NCj4gPg0KPiA+IEluIG9yZGVyIGZvciB0aGUgc29sdXRp
b24gdG8gYmUgZ2VuZXJpYywgSSBoYXZlIGV4cG9ydGVkIGEgbmV3IGhlbHBlcg0KPiA+IChkcm1f
b2ZfbHZkc19nZXRfZHVhbF9saW5rX2NvbmZpZ3VyYXRpb24pIHRvIHdhbGsgdGhlIGRldmljZSB0
cmVlLA0KPiA+IGFuZCBmaWd1cmUgb3V0IGlmIHRoZSBjb25uZWN0aW9uIGlzIGR1YWwtTFZEUy4g
VGhlIHNhbWUgaGVscGVyIGdpdmVzDQo+ID4gaW5mb3JtYXRpb24gYWJvdXQgdGhlIGNvbmZpZ3Vy
YXRpb24gb2YgdGhlIGNvbm5lY3Rpb24uIElmIFB4IGlzIGNvbm5lY3RlZA0KPiA+IHRvIGEgcG9y
dCBleHBlY3RpbmcgZXZlbiBwaXhlbHMgYW5kIFB5IGlzIGNvbm5lY3RlZCB0byBhIHBvcnQgZXhw
ZWN0aW5nDQo+ID4gb2RkIHBpeGVscywgdGhlbiB0aGUgaGVscGVyIHJldHVybnMgRFJNX0xWRFNf
RFVBTF9MSU5LX0VWRU5fT0REX1BJWEVMUw0KPiA+IChsaWtlIGluIHRoZSBleGFtcGxlIGJlbG93
KSwgb3RoZXJ3aXNlIGl0IHJldHVybnMNCj4gPiBEUk1fTFZEU19EVUFMX0xJTktfT0REX0VWRU5f
UElYRUxTLg0KPiA+DQo+ID4NCj4gPiAgLS0tLS0tLS0gICAgICAgICAgICBkdWFsLWx2ZHMtZXZl
bi1waXhlbHMgIC0tLS0tLS0tDQo+ID4gfCAgICAgICAgfC0tLS0gICAgICAgICAgICAgICAgICAg
ICAgICAgLS0tLXwgICAgICAgIHwNCj4gPiB8ICAgICAgICB8IFB4IHwtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tPnwgUG4gfCAgICAgICAgfA0KPiA+IHwgICAgICAgIHwtLS0tICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tLS18ICAgICAgICB8DQo+ID4gfCBTT1VSQ0UgfCAgICAgICAgICAgZHVhbC1s
dmRzLW9kZC1waXhlbHMgIHwgIFNJTksgIHwNCj4gPiB8ICAgICAgICB8LS0tLSAgICAgICAgICAg
ICAgICAgICAgICAgICAtLS0tfCAgICAgICAgfA0KPiA+IHwgICAgICAgIHwgUHkgfC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0+fCBQbSB8ICAgICAgICB8DQo+ID4gfCAgICAgICAgfC0tLS0gICAgICAg
ICAgICAgICAgICAgICAgICAgLS0tLXwgICAgICAgIHwNCj4gPiAgLS0tLS0tLS0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tLS0tLS0tDQo+ID4NCj4gPiBUaGUgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIGVuY29kZXIgdGhlbiB3aWxsIHdvcmsgb3V0IGlmIHdpdGggdGhlIGN1cnJl
bnQNCj4gPiB3aXJpbmcgdGhlIHBpeGVscyBuZWVkIHN3YXBwaW5nIG9yIG5vdC4NCj4gPg0KPiA+
IFRoZSBzYW1lIHNvbHV0aW9uIHdvcmtzIGZvciBib3RoIHBhbmVscyBhbmQgYnJpZGdlcy4NCj4g
Pg0KPiA+IFNpbmNlIHRoZSBEVCBkZXNjcmliZXMgdGhlIGNvbm5lY3Rpb24gZnVsbHksIGRyaXZl
cg0KPiA+IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMgd29ya3Mgb3V0LW9mLXRo
ZS1ib3gsIG5vIGNoYW5nZXMNCj4gPiByZXF1aXJlZCwgaG93ZXZlciwgdGhpcyBpbXBsZW1lbnRh
dGlvbiBvcGVucyB1cCBhIHByb2JsZW0gd2l0aCB0aGUNCj4gPiBkdC1iaW5kaW5ncy4NCj4gPiBE
cml2ZXIgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYyBjYW4gc3RpbGwgYmUgcGxl
YXNlZCBieQ0KPiA+IGEgcG9ydCBub2RlLCBidXQgYWxzbyBieSBhIHBvcnRzIG5vZGUuDQo+ID4g
SSBoYXZlIGNyZWF0ZWQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnVzLXRpbWluZ3MvbHZkcy55YW1sDQo+ID4gd2l0aCB0aGUgaWRlYSBvZiBpbmNsdWRpbmcgaXQg
ZnJvbSBwYW5lbHMgYW5kIGJyaWRnZXMgZHQtYmluZGluZ3MNCj4gPiBzdXBwb3J0aW5nIGR1YWwt
TFZEUyAoYW5kIG9mIGNvdXJzZSB0aGUgZHQtYmluZGluZ3MgZm9yIHRoZSBzcGVjaWZpYw0KPiA+
IGRldmljZXMgc2hvdWxkIHNheSB3aGljaCBwb3J0IHNob3VsZCBiZSBtYXJrZWQgYXMgd2hhdCks
IGJ1dCBmaWxlDQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvbHZkcy55YW1sIGZvcm1hbGx5DQo+ID4gcmVxdWlyZXMgcHJvcGVydHkgInBvcnQiLCB3
aGlsZSB3aXRoIHRoaXMgaW1wbGVtZW50YXRpb24gaXQgc2hvdWxkIHJlcXVpcmUNCj4gPiBPbmVP
ZiAicG9ydCIgYW5kICJwb3J0cyIsIGFuZCB1bmZvcnR1bmF0ZWx5IEkgY2FuJ3Qgc2VlbSB0byBm
aW5kIGEgbmVhdCB3YXkNCj4gPiBhcm91ZCB0aGF0LCBvdGhlciB0aGFuIGNyZWF0aW5nIGEgbmV3
IGNvbXBhdGlibGUgc3RyaW5nDQo+IA0KPiBKdXN0IGFkZCAncG9ydHMnIGFuZCBkcm9wICdwb3J0
JyBmcm9tIGJlaW5nIHJlcXVpcmVkIGluIHRoZSBjb21tb24NCj4gYmluZGluZy4gVGhlbiBpdCBp
cyB1cCB0byB0aGUgcGFuZWwgc3BlY2lmaWMgYmluZGluZ3MgdG8gZGVmaW5lIHdoaWNoDQo+IG9u
ZSBpcyByZXF1aXJlZC4gT3Igd2UganVzdCBsZWF2ZSBpdCB0byBhbGxvdyBlaXRoZXIgZm9ybSB3
aGljaCB0aGUNCj4gZ3JhcGggY29kZSBjYW4gaGFuZGxlLg0KPiANCj4gV2UgY291bGQgaGF2ZSB0
aGlzIGluIHRoZSBjb21tb24gYmluZGluZzoNCj4gDQo+IG9uZU9mOg0KPiAgLSByZXF1aXJlZDog
W3BvcnRzXQ0KPiAgLSByZXF1aXJlZDogW3BvcnRdDQoNCg0KVGhhbmsgeW91IGZvciBSb2IgZm9y
IGxvb2tpbmcgaW50byB0aGlzLiBJIHdpbGwgd2FpdCBmb3IgYSBmZWVkYmFjayBmcm9tIExhdXJl
bnQNCm9uIHRoZSBjb2RlIGJlZm9yZSBzZW5kaW5nIG91dCB2NC4NCg0KVGhhbmtzLA0KRmFiDQoN
Cj4gDQo+IFJvYg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
