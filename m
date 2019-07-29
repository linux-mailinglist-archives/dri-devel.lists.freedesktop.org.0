Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFAC7A29A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679596E437;
	Tue, 30 Jul 2019 07:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20105.outbound.protection.outlook.com [40.107.2.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F6E89D87
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 10:57:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRJQL4Z2LnAtfQ6UmpBwEvN/RK/AkfJ6YVwJ5yYPeDLSt9pXaDINFwFUrIvnwn4HguuskA3beBqsxQZ1yrio7z2llmcCNW/+o0N12biiaTjvrAQgkisldthThtVRolm82vPPbpe1jG9i3aEVnmEou72EcJvisFGCstkXCJ6N/mPiLyWTk5x3QRva1ccxxVY26ij3Z422u5HF5BcuEMlAahdavjw74Fa75zpykG+9EEtvkMUcUn+Z9IQLy7PA8ACUA83CwzQ705715Nuhlz9IAM4QGEzvLXlLf7ae9Vhj47QvwAr7U904r20rFUUEb74+jGazbaw8Ix64znG3IRSxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVTn9j8VBZrIA78PRkbLkn0dfOPvDZp0uaOBNASeRls=;
 b=fNXLlz2iw7EGI5+8gqI6Wu5uE8PdoBVkV1qbWJTJT/hkfZPO/WAKV12uTJQds7d+bVroQSRHzuydoTy/8n+RiKElFK86rnHryPpcIQbepdPmCPOXfn32GHpKbDOSTc5x4Lu3QU9oQMNDwx+d82xwVrtEk/Btym5uWvZacXhtpxTm4HcB5SBg4U1rzzyOzWV9JCnVSKf70UWT35POVTxEMO3oetLYZPVP/0NtlrieYr07KDeKE7DblgzPpIv2PE0BASYWlHj7WL4cHPjQBgp+3P5BN0ogTugAfVwSPBKlc72fM5zwhDQKe/vBrdBlIJW7TmgQmeGk7E4KBgDuIMYNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB6565.eurprd05.prod.outlook.com (20.179.18.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 10:57:39 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 10:57:39 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/1] This patch fixes connection detection for monitors
 w/o DDC.
Thread-Topic: [PATCH 0/1] This patch fixes connection detection for monitors
 w/o DDC.
Thread-Index: AQHVQtjbQmQDpUU8tU2AbrHFyIUWg6bbM5+AgAY9oAA=
Date: Mon, 29 Jul 2019 10:57:39 +0000
Message-ID: <CAGgjyvEA54kR3U8Lyz-1-vPS74raT6SpoM0e8YYcm12T=0r50A@mail.gmail.com>
References: <20190725110520.26848-1-oleksandr.suvorov@toradex.com>
 <20190725113237.d2dwxzientte4j3n@flea>
In-Reply-To: <20190725113237.d2dwxzientte4j3n@flea>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0041.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::18) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAWIAXjgM0wYa7P022z5CK43sQvZ+fxdiulpAXPx5/R26u4JYY5J
 iY6CMloUciX9J5RZxOBeVCI0vqDzJJaFmzlaiT4=
x-google-smtp-source: APXvYqx6lzkOl+k2q/4Rzqx/zOA50Zxjrtiesmb/seUsMHRH0SIHei35eUParrN1FfG1RFnaGvTBkgZWcpPex6hvGWc=
x-received: by 2002:a17:906:d8ab:: with SMTP id
 qc11mr21568720ejb.219.1564397455287; Mon, 29 Jul 2019 03:50:55 -0700 (PDT)
x-gmail-original-message-id: <CAGgjyvEA54kR3U8Lyz-1-vPS74raT6SpoM0e8YYcm12T=0r50A@mail.gmail.com>
x-originating-ip: [209.85.208.53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c95a1bd-808c-43c8-2474-08d71413929a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB6565; 
x-ms-traffictypediagnostic: AM6PR05MB6565:
x-microsoft-antispam-prvs: <AM6PR05MB6565E5B8C208536B2F8B7F84F9DD0@AM6PR05MB6565.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(199004)(189003)(476003)(53936002)(71190400001)(6436002)(55446002)(486006)(11346002)(61266001)(44832011)(66066001)(66946007)(66476007)(66556008)(64756008)(66446008)(14454004)(6506007)(53546011)(102836004)(446003)(14444005)(256004)(386003)(61726006)(99286004)(2501003)(76176011)(52116002)(71200400001)(5640700003)(8936002)(9686003)(6512007)(498394004)(6862004)(305945005)(81156014)(81166006)(68736007)(107886003)(4326008)(3846002)(6116002)(95326003)(5660300002)(6246003)(316002)(25786009)(478600001)(86362001)(6486002)(26005)(229853002)(2351001)(186003)(2906002)(8676002)(7736002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB6565;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TN6qsXfAj2NSv4hiIKON2BbvoTnPCzafi9QK9nzYAuheeZP5eN8weGcWJEG280mamkNro9iYQ/6PeATmIcPQRLQL8r2REhHerCQOayFGgr0O9ZRlNjV831srh5Q+yxXlgHUPC5Kxsmqpt+iN1byYdVGQ2Chixy9I7Ov5d7ELLQpSr2lq6wdVVt0ZF2Kp5ckn+7Qw1AFLuVyDiZNqYkXe9nW9UeGvXsyGMowA9yMLtLTELHbexLYr0FcwXn81i0/i9uSpmiW9gWPjdJx1fP7cCFmo5hms4/ZSgkpv96ydXY0XMfP+NPxgDUBnY7OTlBXymKOObgmKi/fNttD2SzK1Y5JwlCuKpqX66ridNcEoBZjBAolHgLJYBeIDu9c+s9s2ro3nQghM/ULBu3lc3Tz1n3epZNQUeV9VpMWvEqlgvOE=
Content-ID: <F43948D5B3AB134BB6F8BF565A41F65A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c95a1bd-808c-43c8-2474-08d71413929a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 10:57:39.3583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6565
X-Mailman-Approved-At: Tue, 30 Jul 2019 07:55:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toradex.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVTn9j8VBZrIA78PRkbLkn0dfOPvDZp0uaOBNASeRls=;
 b=M/BuE1dpwezvGzBmJT0KGOZeJsh4HI9wZlnbFLdETkzEfpdMTBSEDt+OpHyoFSKJqVTPBD6oFbsPqNAyBRmRMcCP9vRuJvPoshpvD5VkLmG5Ks2h5oY2Pnk6KlYPI7jEEUltso188b94kMJvgdKOFISMsO/3gN0OxpiV4bREd6g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Suvorov Alexander <cryosay@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgNTo0MSBQTSBtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ry
b25zLmNvbQ0KPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPiB3cm90ZToNCj4NCj4g
T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTE6MDU6MjNBTSArMDAwMCwgT2xla3NhbmRyIFN1dm9y
b3Ygd3JvdGU6DQo+ID4NCj4gPiBFdmVuIGluIHNvdXJjZSBjb2RlIG9mIHRoaXMgZHJpdmVyIHRo
ZXJlIGlzIGFuIGF1dGhvcidzIGRlc2NyaXB0aW9uOg0KPiA+ICAgICAvKg0KPiA+ICAgICAgKiBF
dmVuIGlmIHdlIGhhdmUgYW4gSTJDIGJ1cywgd2UgY2FuJ3QgYXNzdW1lIHRoYXQgdGhlIGNhYmxl
DQo+ID4gICAgICAqIGlzIGRpc2Nvbm5lY3RlZCBpZiBkcm1fcHJvYmVfZGRjIGZhaWxzLiBTb21l
IGNhYmxlcyBkb24ndA0KPiA+ICAgICAgKiB3aXJlIHRoZSBEREMgcGlucywgb3IgdGhlIEkyQyBi
dXMgbWlnaHQgbm90IGJlIHdvcmtpbmcgYXQNCj4gPiAgICAgICogYWxsLg0KPiA+ICAgICAgKi8N
Cj4gPg0KPiA+IFRoYXQncyB0cnVlLiBEREMgYW5kIFZHQSBjaGFubmVscyBhcmUgaW5kZXBlbmRl
bnQsIGFuZCB0aGVyZWZvcmUNCj4gPiB3ZSBjYW5ub3QgZGVjaWRlIHdoZXRoZXIgdGhlIG1vbml0
b3IgaXMgY29ubmVjdGVkIG9yIG5vdCwNCj4gPiBkZXBlbmRpbmcgb24gdGhlIGluZm9ybWF0aW9u
IGZyb20gdGhlIEREQy4NCj4gPg0KPiA+IFNvIHRoZSBtb25pdG9yIHNob3VsZCBhbHdheXMgYmUg
Y29uc2lkZXJlZCBjb25uZWN0ZWQuDQo+DQo+IFdlbGwsIG5vLiBMaWtlIHlvdSBzYWlkLCB3ZSBj
YW5ub3QgZGVjaWRlZCB3aGV0aGVyIGlzIGNvbm5lY3RlZCBvcg0KPiBub3QuDQoNCk1heGltZSwg
dGhhbmtzLCBJIGFncmVlIHRoYXQncyBhIGJhZCBzb2x1dGlvbi4NCkJ1dCBJIHN0aWxsIHRoaW5r
IHdlIHNob3VsZCBiZSBhYmxlIHRvIGRlZmluZSB0aGUgRFQgbm9kZSBvZiBhIGRldmljZSBmb3IN
CnRoaXMgZHJpdmVyIHRvIGNsYWltIHRoZSBjb25uZWN0b3IgaXMgYWx3YXlzIGNvbm5lY3RlZC4N
ClBsZWFzZSBzZWUgbXkgZm9sbG93aW5nIHRob3VnaHRzLg0KDQo+ID4gVGh1cyB0aGVyZSBpcyBu
byByZWFzb24gdG8gdXNlIGNvbm5lY3RvciBkZXRlY3QgY2FsbGJhY2sgZm9yIHRoaXMNCj4gPiBk
cml2ZXI6IERSTSBzdWItc3lzdGVtIGNvbnNpZGVycyBtb25pdG9yIGFsd2F5cyBjb25uZWN0ZWQg
aWYgdGhlcmUNCj4gPiBpcyBubyBkZXRlY3QoKSBjYWxsYmFjayByZWdpc3RlcmVkIHdpdGggZHJt
X2Nvbm5lY3Rvcl9pbml0KCkuDQo+ID4NCj4gPiBIb3cgdG8gcmVwcm9kdWNlIHRoZSBidWc6DQo+
ID4gKiBzZXR1cDogaS5NWDhRWFAsIExDRElGIHZpZGVvIG1vZHVsZSArIGdwdS9kcm0vbXhzZmIg
ZHJpdmVyLA0KPiA+ICAgYWR2NzEyeCBWR0EgREFDICsgZHVtYi12Z2EtZGFjIGRyaXZlciwgVkdB
LWNvbm5lY3RvciB3L28gRERDOw0KPiA+ICogdHJ5IHRvIHVzZSBkcml2ZXJzIGNoYWluIG14c2Zi
LWRybSArIGR1bWItdmdhLWRhYzsNCj4gPiAqIGFueSBEUk0gYXBwbGljYXRpb25zIGNvbnNpZGVy
IHRoZSBtb25pdG9yIGlzIG5vdCBjb25uZWN0ZWQ6DQo+ID4gICA9PT09PT09PT09PQ0KPiA+ICAg
JCB3ZXN0b24tc3RhcnQNCj4gPiAgICQgY2F0IC92YXIvbG9nL3dlc3Rvbi5sb2cNCj4gPiAgICAg
ICAuLi4NCj4gPiAgICAgICBEUk06IGhlYWQgJ1ZHQS0xJyBmb3VuZCwgY29ubmVjdG9yIDMyIGlz
IGRpc2Nvbm5lY3RlZC4NCj4gPiAgICAgICAuLi4NCj4gPiAgICQgY2F0IC9zeXMvZGV2aWNlcy9w
bGF0Zm9ybS81YTE4MDAwMC5sY2RpZi9kcm0vY2FyZDAvY2FyZDAtVkdBLTEvc3RhdHVzDQo+ID4g
ICB1bmtub3duDQo+DQo+IEFuZCB0aGF0J3MgZXhhY3RseSB3aGF0J3MgYmVpbmcgcmVwb3J0ZWQg
aGVyZTogd2UgY2Fubm90IGRlY2lkZSBpZiBpdA0KPiBpcyBjb25uZWN0ZWQgb3Igbm90LCBzbyBp
dCdzIHVua25vd24uDQo+DQo+IElmIHdlc3RvbiBjaG9vc2VzIHRvIGlnbm9yZSBjb25uZWN0b3Jz
IHRoYXQgYXJlIGluIGFuIHVua25vd24gc3RhdGUsDQo+IEknZCBzYXkgaXQncyB3ZXN0b24ncyBw
cm9ibGVtLCBzaW5jZSBpdCdzIG11Y2ggYnJvYWRlciB0aGFuIHRoaXMNCj4gcGFydGljdWxhciBk
ZXZpY2UuDQoNCklmIHdlIGxvb2sgYXQgdGhlIGNvZGUgb2YgZHJtX3Byb2JlX2hlbHBlci5jLCB3
ZSBjYW4gc2VlLCB0aGUNCmRybV9oZWxwZXJfcHJvYmVfZGV0ZWN0X2N0eCgpIGFzc3VtZSB0aGUg
Y2FibGUgaXMgY29ubmVjdGVkIGlmIHRoZXJlIGlzIG5vDQpkZXRlY3QoKSBjYWxsYmFjayByZWdp
c3RlcmVkLg0KLi4uDQogICAgICAgICAgICAgICAgaWYgKGZ1bmNzLT5kZXRlY3RfY3R4KQ0KICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGZ1bmNzLT5kZXRlY3RfY3R4KGNvbm5lY3Rvciwg
JmN0eCwgZm9yY2UpOw0KICAgICAgICAgICAgICAgICBlbHNlIGlmIChjb25uZWN0b3ItPmZ1bmNz
LT5kZXRlY3QpDQogICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gY29ubmVjdG9yLT5mdW5j
cy0+ZGV0ZWN0KGNvbm5lY3RvciwgZm9yY2UpOw0KICAgICAgICAgICAgICAgICBlbHNlDQogICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7DQou
Li4NCg0KVGhlIGRyaXZlciBkdW1iLXZnYS1kYWMgc3VwcG9ydHMgYm90aCBEVCBjb25maWd1cmF0
aW9uczoNCi0gd2l0aCBEREMgY2hhbm5lbCwgdGhhdCBhbGxvd3MgdXMgdG8gZGV0ZWN0IGlmIHRo
ZSBjYWJsZSBpcyBjb25uZWN0ZWQ7DQotIHdpdGhvdXQgRERDIGNoYW5uZWwuIEluIHRoaXMgY2Fz
ZSwgSU1ITywgdGhlIGRyaXZlciBzaG91bGQgYmVoYXZlDQp0aGUgc2FtZSB3YXkgYXMgYQ0KICBj
b25uZWN0b3IgZHJpdmVyIHdpdGhvdXQgcmVnaXN0ZXJlZCBkZXRlY3QoKSBjYWxsYmFjay4NCg0K
U28gd2hhdCBhYm91dCB0aGUgcGF0Y2ggbGlrZT8NCg0KQEAgLTgxLDYgKzgxLDEzIEBAIGR1bWJf
dmdhX2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3INCipjb25uZWN0b3IsIGJv
b2wgZm9yY2UpDQogew0KICAgICAgICBzdHJ1Y3QgZHVtYl92Z2EgKnZnYSA9IGRybV9jb25uZWN0
b3JfdG9fZHVtYl92Z2EoY29ubmVjdG9yKTsNCg0KKyAgICAgICAvKg0KKyAgICAgICAgKiBJZiBJ
MkMgYnVzIGZvciBEREMgaXMgbm90IGRlZmluZWQsIGFzdW1lIHRoYXQgdGhlIGNhYmxlDQorICAg
ICAgICAqIGlzIGFsd2F5cyBjb25uZWN0ZWQuDQorICAgICAgICAqLw0KKyAgICAgICBpZiAoUFRS
X0VSUih2Z2EtPmRkYykgPT0gLUVOT0RFVikNCisgICAgICAgICAgICAgICByZXR1cm4gY29ubmVj
dG9yX3N0YXR1c19jb25uZWN0ZWQ7DQorDQogICAgICAgIC8qDQogICAgICAgICAqIEV2ZW4gaWYg
d2UgaGF2ZSBhbiBJMkMgYnVzLCB3ZSBjYW4ndCBhc3N1bWUgdGhhdCB0aGUgY2FibGUNCiAgICAg
ICAgICogaXMgZGlzY29ubmVjdGVkIGlmIGRybV9wcm9iZV9kZGMgZmFpbHMuIFNvbWUgY2FibGVz
IGRvbid0DQoNCi0tIA0KQmVzdCByZWdhcmRzDQpPbGVrc2FuZHIgU3V2b3Jvdg0KDQpUb3JhZGV4
IEFHDQpBbHRzYWdlbnN0cmFzc2UgNSB8IDYwNDggSG9ydy9MdXplcm4gfCBTd2l0emVybGFuZCB8
IFQ6ICs0MSA0MSA1MDANCjQ4MDAgKG1haW4gbGluZSkNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
