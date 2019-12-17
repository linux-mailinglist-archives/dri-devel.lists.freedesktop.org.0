Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C915C124147
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2E26E24E;
	Wed, 18 Dec 2019 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400113.outbound.protection.outlook.com [40.107.140.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC626E9CB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 12:31:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2Izr/V2JE9kzOgvbIhEBfXujHl+9ZzM5NqWBGwpgq5JOFI5OFE8FpXMEY7hNcnbOEni+7TsLaUIhrS1Bj4tPDQilzCkLQC02wvxH6LgYm1Jy1dsAgosA07GyahbO6Z4yL5RYRDUi+gKQcPYrNP6vEWmbHD2lg9P620n/mNng99vEoTb65mLaeEX9vjpF1wuWTusIMA/oRJVK5j7teuv4pxo+ZPWjuSz4BZ6roJU8WOubbRmCZx8V7QFqhSyZo3SIxHoqYLmhMkXUz6sjtDH12bJVh2liBqGDI6IAakoOE8CbTYO6w0mzIzKJeWCseWqax/6P4bZWsoeNLLHeNOX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVL5KJ4/B2RwsOxsEyuyVfUcSkCXY2eNSO7UnisCGa8=;
 b=a6doADeNKQp4oqbCM1RbPa0kfRZyOkpXmfyXHpvGt9b6xsYtKmps/dP3x+njuMAW7C97RUFxnQCanWRM3IjlcODTK+3/OaQCewu3kLb39VlbzNCMcb5VzBB1cl10B/A03roOFdgpZdZfvLXLMUZRpo1pAdKM2h58QPGfvJ8WCL/X9RwY2JcQPAimJmz7RxOaPWv2nzduY6Qf6t7DSrr8W6wOFadje1mrbjCRE9m7mA4royymAL1kyS2ygeWC1zxT6zGv5vaLWYU//3vcFL2WfAdHXH9Gwau86XWh7rIYUBZ/1zfp6WtDIE0Vrp2rZs0VpSlkpte+Ukeq8ZllIiRpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVL5KJ4/B2RwsOxsEyuyVfUcSkCXY2eNSO7UnisCGa8=;
 b=QgBhogywbNOdJz8bOkQQ+FER/0dXeCicMxa6/UdKagZ7P04kAFnGCbVvgSG/lQ8b8ulzrA/kqDLf2fKBQLviiRouA4EGk5Q9NAVULLm6DqIm7CIz5Us4CsofyMKZe0nc2rV0uHENIAvCQK1LG9wjgaSxNS+I0DrZl+hzCTG7tgE=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1802.jpnprd01.prod.outlook.com (52.133.164.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Tue, 17 Dec 2019 12:31:11 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 12:31:11 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Thread-Topic: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Thread-Index: AQHVmjpQshhfnt50Ik69GSb05e3v8ae4fAYAgAXgh5CAABfsAIAAAEyg
Date: Tue, 17 Dec 2019 12:31:11 +0000
Message-ID: <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
 <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
In-Reply-To: <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af96dc1d-c8a8-474f-ddb8-08d782ecffee
x-ms-traffictypediagnostic: TY1PR01MB1802:|TY1PR01MB1802:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB180229DF4C513E82906082D0C0500@TY1PR01MB1802.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(199004)(189003)(2906002)(26005)(6506007)(9686003)(5660300002)(44832011)(33656002)(81166006)(66446008)(7696005)(71200400001)(66946007)(478600001)(186003)(316002)(7416002)(6916009)(54906003)(53546011)(66476007)(76116006)(81156014)(4326008)(52536014)(86362001)(55016002)(66556008)(8676002)(64756008)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1802;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hJyt6Ov5iPPXw8McovB1zFoMLDufqb5zZBf9yc0pc8dQwsKYYzpURwRE8bqefzBnb0cr2UbJt6oIt8OtKWOxC63860kOzuw5hc0soOVXd5BrWrX2RAw3au62ito/eZvLNF1Uz0dCMacQiFcGvqzJUL20BZpTwSR8dBQsi/YbtoR+ztAd8oK70BNwtNGKtFTWetxYAViod7O4TZ4jA8v5DPiJ2hr3nXN07oBS8zFr9znhgNVYhaFf6OBJqB4EvJFqcxdyOBFCy+WVnUT9BduFLHkIBi0T/rbDKqlfJz+2eqqI+f7Vb5eJDf/lGD8B6nfaykduAHdikPhtmSo8Bbkok3wpiVpFv+Yo8DdZ2d5DGHDOB7Xcaeoxrn1YZ3Ey0GMPcoPI+KpriHdjFjnmLMpTLPbOoMYK3LDVxMCDzEDJNW9UyiTYDxVHFLqYwiyfW9Gx
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af96dc1d-c8a8-474f-ddb8-08d782ecffee
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 12:31:11.1183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /kptyreCCugc7ydzsLQE27uppmjmFwLJx4wqd7ZF6NH5HKkynbvwJQUGEMpXmrgOM7nikcUpMsfXfU23enH3JO/W93ZkGgMmjrd++UhOp6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1802
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBsaW51
eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXJlbmVzYXMtc29jLW93
bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiBT
ZW50OiAxNyBEZWNlbWJlciAyMDE5IDEyOjIxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDYv
MTNdIGRybS9icmlkZ2U6IGx2ZHMtY29kZWM6IEFkZCAibHZkcy1kZWNvZGVyIiBzdXBwb3J0DQo+
IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IE9uIFR1ZSwgRGVjIDE3LCAyMDE5IGF0IDEyOjAzIFBN
IEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gPiA+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4NCj4gPiA+IFNlbnQ6IDEzIERlY2VtYmVyIDIwMTkgMTc6MTENCj4gPiA+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDYvMTNdIGRybS9icmlkZ2U6IGx2ZHMtY29kZWM6IEFkZCAi
bHZkcy1kZWNvZGVyIiBzdXBwb3J0DQo+ID4gPg0KPiA+ID4gT24gV2VkLCBOb3YgMTMsIDIwMTkg
YXQgMDM6NTE6MjVQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+ID4gPiBBZGQg
c3VwcG9ydCBmb3IgdHJhbnNwYXJlbnQgTFZEUyBkZWNvZGVycyBieSBhZGRpbmcgYSBuZXcNCj4g
PiA+ID4gY29tcGF0aWJsZSBzdHJpbmcgKCJsdmRzLWRlY29kZXIiKSB0byB0aGUgZHJpdmVyLg0K
PiA+ID4gPiBUaGlzIHBhdGNoIGFsc28gYWRkcyBtZW1iZXIgY29ubmVjdG9yX3R5cGUgdG8gc3Ry
dWN0IGx2ZHNfY29kZWMsDQo+ID4gPiA+IGFuZCB0aGF0J3MgYmVjYXVzZSBMVkRTIGRlY29kZXJz
IGhhdmUgYSBkaWZmZXJlbnQgY29ubmVjdG9yIHR5cGUNCj4gPiA+ID4gZnJvbSBMVkRTIGVuY29k
ZXJzLiBXZSBmaWxsIHRoaXMgbmV3IG1lbWJlciB1cCB3aXRoIHRoZSBkYXRhDQo+ID4gPiA+IG1h
dGNoaW5nIHRoZSBjb21wYXRpYmxlIHN0cmluZy4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+
ID4gPiA+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2My0+djQ6DQo+ID4gPiA+ICogTmV3IHBhdGNo
DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVj
LmMgfCAxOSArKysrKysrKysrKysrKysrLS0tDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9sdmRzLWNvZGVjLmMNCj4gPiA+ID4gaW5kZXggYjU4MDFhMi4uYzMyZTEyNSAxMDA2
NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMNCj4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMNCj4gPiA+ID4g
QEAgLTcsNiArNyw3IEBADQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5o
Pg0KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ID4gPiAgI2luY2x1ZGUg
PGxpbnV4L29mLmg+DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ID4g
PiA+ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4NCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiA+ID4NCj4gPiA+ID4gQEAgLTE3LDYgKzE4LDcgQEAg
c3RydWN0IGx2ZHNfY29kZWMgew0KPiA+ID4gPiAgICAgc3RydWN0IGRybV9icmlkZ2UgYnJpZGdl
Ow0KPiA+ID4gPiAgICAgc3RydWN0IGRybV9icmlkZ2UgKnBhbmVsX2JyaWRnZTsNCj4gPiA+ID4g
ICAgIHN0cnVjdCBncGlvX2Rlc2MgKnBvd2VyZG93bl9ncGlvOw0KPiA+ID4gPiArICAgdTMyIGNv
bm5lY3Rvcl90eXBlOw0KPiA+ID4gPiAgfTsNCj4gPiA+ID4NCj4gPiA+ID4gIHN0YXRpYyBpbnQg
bHZkc19jb2RlY19hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4gPiA+ID4gQEAg
LTY1LDYgKzY3LDcgQEAgc3RhdGljIGludCBsdmRzX2NvZGVjX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ICAgICBpZiAoIWx2ZHNfY29kZWMpDQo+ID4gPiA+ICAg
ICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ID4gPg0KPiA+ID4gPiArICAgbHZkc19jb2Rl
Yy0+Y29ubmVjdG9yX3R5cGUgPSAodTMyKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+
ZGV2KTsNCj4gPiA+DQo+ID4gPiBJJ20gbm93IGdldHRpbmcgYSBjb21waWxhdGlvbiBmYWlsdXJl
IGhlcmU6DQo+ID4gPg0KPiA+ID4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmM6
IEluIGZ1bmN0aW9uIOKAmGx2ZHNfY29kZWNfcHJvYmXigJk6DQo+ID4gPiBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2x2ZHMtY29kZWMuYzo2ODozMTogZXJyb3I6IGNhc3QgZnJvbSBwb2ludGVyIHRv
IGludGVnZXIgb2YgZGlmZmVyZW50IHNpemUgWy1XZXJyb3I9cG9pbnRlci10by1pbnQtY2FzdF0N
Cj4gPiA+ICAgbHZkc19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAodTMyKW9mX2RldmljZV9nZXRf
bWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeDQo+ID4gPg0KPiA+ID4gVGhlIGZpeCBzaG91bGQgYmUgc2ltcGxlOg0KPiA+ID4NCj4g
PiA+ICAgICAgIGx2ZHNfY29kZWMtPmNvbm5lY3Rvcl90eXBlID0gKHVpbnRwdHJfdClvZl9kZXZp
Y2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gPiA+DQo+ID4gPiBJJ20gYm90aGVyZWQgYnkgdGhl
IGZhY3QgdGhhdCBJJ3ZlIGNvbXBpbGVkIHRoaXMgYmVmb3JlIHdpdGhvdXQgYW55DQo+ID4gPiBp
c3N1ZSwgc28gdGhpcyByZWFsbHkgcHV6emxlcyBtZS4gRG8geW91IGdldCB0aGUgc2FtZSB3YXJu
aW5nID8NCj4gPg0KPiA+IFRoZSB3YXJuaW5nIGFwcGVhcnMgd2hlbiBjb21waWxpbmcgZm9yIGFy
bTY0LCB1bmRlcnN0YW5kYWJseSBzby4NCj4gPiBXZSBtdXN0IGhhdmUgY29tcGlsZWQgdGhpcyBm
b3IgYXJtIG9ubHkgdGhlIGZpcnN0IHRpbWUgYXJvdW5kLg0KPiA+DQo+ID4gSSB0aGluayB0aGUg
cmlnaHQgd2F5IHRvIHNvbHZlIHRoaXMgaXMgdG8gZWl0aGVyIGNhc3QgdG8gKHUzMikodWludHB0
cl90KSBvciAodTMyKSh1bnNpZ25lZCBsb25nKS4NCj4gDQo+IEp1c3QgY2FzdGluZyB0byB1aW50
cHRyX3Qgc2hvdWxkIGJlIHN1ZmZpY2llbnQuDQoNCkl0IHNob3VsZCBiZSBzdWZmaWNpZW50IGZv
ciB0aGUgY29tcGlsZXIsIGJ1dCBJIGhhdmUgc2VlbiBleGFtcGxlcyB3aGVyZSBwZW9wbGUNCnBy
ZWZlcnJlZCB0byBiZSBleHBsaWNpdCwgbGlrZSBpbjoNCmRyaXZlcnMvbWFpbGJveC9tdGstY21k
cS1tYWlsYm94LmMNCmRyaXZlcnMvbGVkcy9sZWRzLXBtODA1OC5jDQoNClNpbmNlIHRoZSBrZXJu
ZWwgaXMgaW5jcmVhc2luZyBpdHMgdGlnaHRuZXNzIHdpdGggcmVzcGVjdCB0byB3YXJuaW5ncywg
SSBwZXJzb25hbGx5IHByZWZlcg0KKHUzMikodWludHB0cl90KSwgZXZlbiB0aG91Z2ggbm90IHN0
cmljdGx5IG5lY2Vzc2FyeSwgYnV0IEkgYW0gZmluZSB3aXRoICh1aW50cHRyX3QpIGlmIHlvdQ0K
ZG9uJ3QgbGlrZSAodTMyKSh1aW50cHRyX3QpLg0KDQpDaGVlcnMsDQpGYWINCg0KPiANCj4gR3J7
b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiAN
Cj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
