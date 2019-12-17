Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A963812413F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23B46E235;
	Wed, 18 Dec 2019 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400095.outbound.protection.outlook.com [40.107.140.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA796E987
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 11:03:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IISWOdeav7TrWg8Q4yVffqp44x8bY/C48xdtEALrdsRTz8A9sBqlGpf6aLzfjsUkhY8vjJq+ZVqa24TNa0+tbVGKnqA+7yzuaaiGZXltiwFuln0GY3K9nLl/ottjyzrhXEFFHaLVJZH90vw1IwDeormJMA7Q6gtH3aiQTADLXiGOwoQez5O+VelWs/8l+OLAkHsDsmLM/giFgycrBOTJyNrLn8CsOoM8MKRPL2WGh8kY9HdUJ0KUU+8Lt7Zcx9lpO70WFP7IZ8NsiUphcpEJ7UYEPZwMGmifuhuOlxYXLAeU+qiFAbkDniEqn0fyjwZcWSZvbRVnrIiJOOasxUqKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IBqzniADRAIE00mLm0EwgMRhysyu7ZgXrh89yWWtYk=;
 b=NHkbUiO0bffGJ/I9pQWVa5l/aqmGMdKm1cU+4dwFayT1liadj+SCrg1tWOzi6w1CzoL8dEPhroGn1IAAkOIgBakpTH/DYQWkqiuKuiuTk0bWjJZvc5gYBqAaAg+vEDmB8Buts/voGZF0Kwj5yEhbka5oyOsvmDTsEfroR7yDx1mrQ2/HJqhJZ8Fz8TtDzyOFVzTGqe9MiDpGXso4DSeLIniCs5De2p72NCC85DcM/9ksm0JVoFfcJtJbjNQif+9qZciYnmx8uxF+30exM4WinZPWhIV3LhUCYl5RBZ2un1iV+wPpUGTCUDYIbUNPaVMkmHvplVDZ+YN9Q9FEBZ/smA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IBqzniADRAIE00mLm0EwgMRhysyu7ZgXrh89yWWtYk=;
 b=I/yr/j6RHcVYl813sVdmnASsrxpFAoOh8ay6c1g9oTd1Y+bitIQ4z1ZhxwDpmgiYd4pOkUde8sgZsiq+6qD3i/1J5JTLXIlcopWneGOMV9f6V7lw5Fkj4gnWcDAVIHyOq5+A1Vl21hUVi2BOuuSJMHMhWH6GPplEELbvGw3Rozs=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1594.jpnprd01.prod.outlook.com (52.133.161.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.19; Tue, 17 Dec 2019 11:03:00 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 11:03:00 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Thread-Topic: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Thread-Index: AQHVmjpQshhfnt50Ik69GSb05e3v8ae4fAYAgAXgh5A=
Date: Tue, 17 Dec 2019 11:02:59 +0000
Message-ID: <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213171038.GH4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b1000ea8-992c-4c9d-d552-08d782e0ae26
x-ms-traffictypediagnostic: TY1PR01MB1594:|TY1PR01MB1594:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB15949089C9109DDAC0E0F05BC0500@TY1PR01MB1594.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(189003)(199004)(55016002)(6916009)(8676002)(66446008)(64756008)(66556008)(66476007)(316002)(66946007)(8936002)(4326008)(52536014)(26005)(81166006)(81156014)(33656002)(86362001)(71200400001)(186003)(2906002)(6506007)(53546011)(7696005)(44832011)(5660300002)(54906003)(76116006)(9686003)(7416002)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1594;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d5iYjd3unIiRUHTsF6wSYc1O0A/5AN+kwedpTVl8IOHX9/wN1dY7hJpL4TBxznlSbRoS+vA/wxj1XbJa4kCvQrzEdsuUFg9/fXwEZ3dYo9W5XzohxS8RgPKpJDzw0UCQFZ8FfOchdAiBIlQCxEVEm9dSss4c7nSP7hGcgPH1tJ4AoVR4fWeeN27ivt2HGQ9VCFe1INvi0/h778Z60iZw8OpfUqkH2ovQ5MpHYZMPkOUahn0CXp363JnRQskWvYpP42XSZ4gym7N7ueafEb/r+wn911+TDN9Zij6VwGCVMvEduxVybhdXywcEM4ecBKaBjcohJgXdPSWUlbu6lm+yULwtQEIIXvga02pplctJC2JhU4G44AEu3R8vOjE8pNfc1xMNpQ8SGftMWP4ibV6lHui7oLdnAGOIZx28FgVhKGI9ZnYuNn060c/6/lZeaYQc
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1000ea8-992c-4c9d-d552-08d782e0ae26
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 11:02:59.8042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aQOQHxoYO3LoYiyYlXIDplH5RBiMuckX2ugRYwnjZLNAtAHQ+eDwrtSG1Fyrlie78y+Uozr15GZAXp3wvWsS/6o3RFDa37aA8pd0rMPJ+V8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1594
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMTMgRGVjZW1iZXIgMjAxOSAxNzoxMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA2LzEz
XSBkcm0vYnJpZGdlOiBsdmRzLWNvZGVjOiBBZGQgImx2ZHMtZGVjb2RlciIgc3VwcG9ydA0KPiAN
Cj4gSGkgRmFicml6aW8sDQo+IA0KPiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCAwMzo1MToyNVBN
ICswMDAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHRyYW5z
cGFyZW50IExWRFMgZGVjb2RlcnMgYnkgYWRkaW5nIGEgbmV3DQo+ID4gY29tcGF0aWJsZSBzdHJp
bmcgKCJsdmRzLWRlY29kZXIiKSB0byB0aGUgZHJpdmVyLg0KPiA+IFRoaXMgcGF0Y2ggYWxzbyBh
ZGRzIG1lbWJlciBjb25uZWN0b3JfdHlwZSB0byBzdHJ1Y3QgbHZkc19jb2RlYywNCj4gPiBhbmQg
dGhhdCdzIGJlY2F1c2UgTFZEUyBkZWNvZGVycyBoYXZlIGEgZGlmZmVyZW50IGNvbm5lY3RvciB0
eXBlDQo+ID4gZnJvbSBMVkRTIGVuY29kZXJzLiBXZSBmaWxsIHRoaXMgbmV3IG1lbWJlciB1cCB3
aXRoIHRoZSBkYXRhDQo+ID4gbWF0Y2hpbmcgdGhlIGNvbXBhdGlibGUgc3RyaW5nLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVu
ZXNhcy5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiB2My0+djQ6DQo+ID4gKiBOZXcgcGF0Y2gNCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMgfCAxOSArKysr
KysrKysrKysrKysrLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbHZkcy1jb2RlYy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMNCj4g
PiBpbmRleCBiNTgwMWEyLi5jMzJlMTI1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvbHZkcy1jb2RlYy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9s
dmRzLWNvZGVjLmMNCj4gPiBAQCAtNyw2ICs3LDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2dw
aW8vY29uc3VtZXIuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICAjaW5j
bHVkZSA8bGludXgvb2YuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0KPiA+
ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPg0KPiA+DQo+ID4gQEAgLTE3LDYgKzE4LDcgQEAgc3RydWN0IGx2ZHNfY29k
ZWMgew0KPiA+ICAJc3RydWN0IGRybV9icmlkZ2UgYnJpZGdlOw0KPiA+ICAJc3RydWN0IGRybV9i
cmlkZ2UgKnBhbmVsX2JyaWRnZTsNCj4gPiAgCXN0cnVjdCBncGlvX2Rlc2MgKnBvd2VyZG93bl9n
cGlvOw0KPiA+ICsJdTMyIGNvbm5lY3Rvcl90eXBlOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRp
YyBpbnQgbHZkc19jb2RlY19hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4gPiBA
QCAtNjUsNiArNjcsNyBAQCBzdGF0aWMgaW50IGx2ZHNfY29kZWNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gPiAgCWlmICghbHZkc19jb2RlYykNCj4gPiAgCQlyZXR1cm4g
LUVOT01FTTsNCj4gPg0KPiA+ICsJbHZkc19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAodTMyKW9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsNCj4gDQo+IEknbSBub3cgZ2V0dGlu
ZyBhIGNvbXBpbGF0aW9uIGZhaWx1cmUgaGVyZToNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbHZkcy1jb2RlYy5jOiBJbiBmdW5jdGlvbiDigJhsdmRzX2NvZGVjX3Byb2Jl4oCZOg0KPiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYzo2ODozMTogZXJyb3I6IGNhc3QgZnJv
bSBwb2ludGVyIHRvIGludGVnZXIgb2YgZGlmZmVyZW50IHNpemUgWy1XZXJyb3I9cG9pbnRlci10
by1pbnQtY2FzdF0NCj4gICBsdmRzX2NvZGVjLT5jb25uZWN0b3JfdHlwZSA9ICh1MzIpb2ZfZGV2
aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXg0KPiANCj4gVGhlIGZpeCBzaG91bGQgYmUgc2ltcGxlOg0KPiANCj4gCWx2ZHNf
Y29kZWMtPmNvbm5lY3Rvcl90eXBlID0gKHVpbnRwdHJfdClvZl9kZXZpY2VfZ2V0X21hdGNoX2Rh
dGEoZGV2KTsNCj4gDQo+IEknbSBib3RoZXJlZCBieSB0aGUgZmFjdCB0aGF0IEkndmUgY29tcGls
ZWQgdGhpcyBiZWZvcmUgd2l0aG91dCBhbnkNCj4gaXNzdWUsIHNvIHRoaXMgcmVhbGx5IHB1enps
ZXMgbWUuIERvIHlvdSBnZXQgdGhlIHNhbWUgd2FybmluZyA/DQoNClRoZSB3YXJuaW5nIGFwcGVh
cnMgd2hlbiBjb21waWxpbmcgZm9yIGFybTY0LCB1bmRlcnN0YW5kYWJseSBzby4NCldlIG11c3Qg
aGF2ZSBjb21waWxlZCB0aGlzIGZvciBhcm0gb25seSB0aGUgZmlyc3QgdGltZSBhcm91bmQuDQoN
CkkgdGhpbmsgdGhlIHJpZ2h0IHdheSB0byBzb2x2ZSB0aGlzIGlzIHRvIGVpdGhlciBjYXN0IHRv
ICh1MzIpKHVpbnRwdHJfdCkgb3IgKHUzMikodW5zaWduZWQgbG9uZykuDQoNCldoYXQncyB5b3Vy
IHByZWZlcmVuY2U/DQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiA+ICAJbHZkc19jb2RlYy0+cG93
ZXJkb3duX2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJwb3dlcmRvd24iLA0K
PiA+ICAJCQkJCQkJICAgICBHUElPRF9PVVRfSElHSCk7DQo+ID4gIAlpZiAoSVNfRVJSKGx2ZHNf
Y29kZWMtPnBvd2VyZG93bl9ncGlvKSkgew0KPiA+IEBAIC0xMDUsNyArMTA4LDcgQEAgc3RhdGlj
IGludCBsdmRzX2NvZGVjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4N
Cj4gPiAgCWx2ZHNfY29kZWMtPnBhbmVsX2JyaWRnZSA9DQo+ID4gIAkJZGV2bV9kcm1fcGFuZWxf
YnJpZGdlX2FkZF90eXBlZChkZXYsIHBhbmVsLA0KPiA+IC0JCQkJCQlEUk1fTU9ERV9DT05ORUNU
T1JfTFZEUyk7DQo+ID4gKwkJCQkJCWx2ZHNfY29kZWMtPmNvbm5lY3Rvcl90eXBlKTsNCj4gPiAg
CWlmIChJU19FUlIobHZkc19jb2RlYy0+cGFuZWxfYnJpZGdlKSkNCj4gPiAgCQlyZXR1cm4gUFRS
X0VSUihsdmRzX2NvZGVjLT5wYW5lbF9icmlkZ2UpOw0KPiA+DQo+ID4gQEAgLTEzMyw4ICsxMzYs
MTggQEAgc3RhdGljIGludCBsdmRzX2NvZGVjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgbHZkc19jb2RlY19tYXRjaFtdID0gew0KPiA+IC0JeyAuY29tcGF0aWJsZSA9ICJsdmRzLWVu
Y29kZXIiIH0sDQo+ID4gLQl7IC5jb21wYXRpYmxlID0gInRoaW5lLHRoYzYzbHZkbTgzZCIgfSwN
Cj4gPiArCXsNCj4gPiArCQkuY29tcGF0aWJsZSA9ICJsdmRzLWRlY29kZXIiLA0KPiA+ICsJCS5k
YXRhID0gKHZvaWQgKilEUk1fTU9ERV9DT05ORUNUT1JfRFBJLA0KPiA+ICsJfSwNCj4gPiArCXsN
Cj4gPiArCQkuY29tcGF0aWJsZSA9ICJsdmRzLWVuY29kZXIiLA0KPiA+ICsJCS5kYXRhID0gKHZv
aWQgKilEUk1fTU9ERV9DT05ORUNUT1JfTFZEUywNCj4gPiArCX0sDQo+ID4gKwl7DQo+ID4gKwkJ
LmNvbXBhdGlibGUgPSAidGhpbmUsdGhjNjNsdmRtODNkIiwNCj4gPiArCQkuZGF0YSA9ICh2b2lk
ICopRFJNX01PREVfQ09OTkVDVE9SX0xWRFMsDQo+ID4gKwl9LA0KPiA+ICAJe30sDQo+ID4gIH07
DQo+ID4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGx2ZHNfY29kZWNfbWF0Y2gpOw0KPiANCj4g
LS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
