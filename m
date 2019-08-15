Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973A591153
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6461B6E52E;
	Sat, 17 Aug 2019 15:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410135.outbound.protection.outlook.com [40.107.141.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960946E9B1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 13:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rnh/Q5g+uUYrCzYnHcS+O+ubUrs4bLBKWAqZH5iyMflEe6zIGPKdLLsxYQPJauQVT6QY+pQ+eW1YDbJHIfCfTpQz6dujpcy1qmzulZNNwSdnYEbafsuIXVdetrRJI706hRDUJoUey+woCv5MMQ88OWZHC39uV6zAg0ZWKt6f5aEaoxS/262Dg/gIIIlhwxBCm17FRcSiyO9i/XPukHmT0qpfNxu1NdlGVozdBOVkjPzSoq2DZClfziS7bJ6m2aLCBw7iVxxyreOt25KqaaQa3zafzOHRvpHbfS3LgKvxamBBU4/gtpZGStGoQQnhC7hZok2rbA38c5ApzYfLtasskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrRuv5SCO+y9TDZmQXdusvjtBNp4TZtqLuHBnUAWpBw=;
 b=ELnz4xiGSi0ZyIXSLtPQKB5GC+a3Lo5fUVH+9cEBgopHBA5nlE8nMHgoegygaF+ncky4GeUedl+qjTMzCDNMwWtvbQsYUPnEwfVelGJlFiE+3nhPPHmQT4l+PtiwlfWnjADr2O2eDbp6/nd8w2N26RVXwcFNMaTRVNVBvTdmr4gytke5N25vBzB6WJxCxGUZTP/ONUp4/A21qkLBUQ2nRmkGI6zziwIsA5q2BsfG9ZF6H7bEfD+GKi6LUvOq92Wjh4nIiQ+I+QlJqt0YXq/GSsxRZikcQWm2Yru8N9cLrFPSMXgsnjKeaJSnvAxwGF5cdM0i2L70LRw9XadJuffrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1705.jpnprd01.prod.outlook.com (52.133.164.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 13:43:04 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 13:42:59 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 6/9] drm: rcar-du: lvds: Fix companion's mode
Thread-Topic: [PATCH v2 6/9] drm: rcar-du: lvds: Fix companion's mode
Thread-Index: AQHVU1lUt9TvxTVXz0W4x7IQ8cGQSqb8GemAgAAc4kA=
Date: Thu, 15 Aug 2019 13:42:59 +0000
Message-ID: <TY1PR01MB17709614E219524FC4C907A8C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815115517.GJ5011@pendragon.ideasonboard.com>
In-Reply-To: <20190815115517.GJ5011@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5df2dede-c855-44f7-21ce-08d721867c7e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1705; 
x-ms-traffictypediagnostic: TY1PR01MB1705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1705C5B599F5FCCC0025F37DC0AC0@TY1PR01MB1705.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(52536014)(8676002)(86362001)(6506007)(8936002)(81156014)(25786009)(66066001)(53546011)(71190400001)(11346002)(81166006)(476003)(66556008)(64756008)(66446008)(76116006)(186003)(26005)(2906002)(33656002)(256004)(5024004)(7736002)(66946007)(6916009)(305945005)(102836004)(446003)(5660300002)(66476007)(74316002)(71200400001)(7696005)(6116002)(3846002)(6436002)(76176011)(53936002)(44832011)(486006)(99286004)(54906003)(55016002)(316002)(9686003)(478600001)(6246003)(4326008)(14454004)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1705;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6qvRNm3PuVAHCpghmHm/oY6ys3WrkB+Dn+o6Fw8m8uOehcJAyqsK4qm4wiD0NVwLxG9y6zupq5tvRrs9jKqJnmTaJTkywomiFy5wv2P9N2iRQJEHpHQ2vDAbWL380IeGrnFJCcWZb5ZhsBYXsgttxoj7FzFNYDY7kZ5MIWLMqCkq5Sn7Fc2lycgfeBLEDdivrsniU8ACee11dXpMKdtLAWFvyDTMcvllGeBjRShZwXqXwmGjIEYUNAS2HIaxtJmh7TW+tbaJShPfE5RX297/pj/8vHrl+ILYPCMkEDkon3Ky3eqZnoz5XcCSqLx73mQLLvdhDgXAyJpv/X5sREoXpercAhBp+fgm9ZhUm1cW48OAdii0g3YIF9bEjZ2cKtqDsB12q1rPaOUgAWGClfbXwiouL4tHh3oWM4C4dDYhL6Q=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df2dede-c855-44f7-21ce-08d721867c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 13:42:59.3060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCNs4ilhnIrdNoa4le9hWPTV3BALs6CiH2WEQkkJ4n2jbmoLxqjRdi+tBwbo+ypmUwgcZGT05OsTfW5i8vmRwzRgmOin956G9MWMs9eIkgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1705
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrRuv5SCO+y9TDZmQXdusvjtBNp4TZtqLuHBnUAWpBw=;
 b=hRunq1uFDaOoBWQI4eTd9oTYXoezI9PuKxu5ehB8AvrH709lpFdOUoPtbrAXJd9+MVAYi6QH7FpXFh69UcCSLvrQ9NGVHkW6ElirhgpP4r+N1c9aP0pRNCB7TgKXezo+5wLJV6mxUEkCJ2Dc9zxZXmPQwIZ9YQ3dRx8ImnaMkkY=
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IGxp
bnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtcmVuZXNhcy1zb2Mt
b3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgTGF1cmVudCBQaW5jaGFydA0KPiBT
ZW50OiAxNSBBdWd1c3QgMjAxOSAxMjo1NQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDYvOV0g
ZHJtOiByY2FyLWR1OiBsdmRzOiBGaXggY29tcGFuaW9uJ3MgbW9kZQ0KPiANCj4gSGkgRmFicml6
aW8sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFRodSwgQXVnIDE1
LCAyMDE5IGF0IDEyOjA0OjMwUE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gPiBU
aGUgY29tcGFuaW9uIGVuY29kZXIgbmVlZHMgdG8gYmUgdG9sZCB0byB1c2UgdGhlIHNhbWUNCj4g
PiBtb2RlIGFzIHRoZSBwcmltYXJ5IGVuY29kZXIuDQo+ID4NCj4gPiBGaXhlczogZTllODc5OGFi
N2I4ICgiZHJtOiByY2FyLWR1OiBsdmRzOiBBZGQgc3VwcG9ydCBmb3IgZHVhbC1saW5rIG1vZGUi
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJw
LnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICogcmV3b3JrZWQg
YWNjb3JkaW5nIHRvIExhdXJlbnQncyBmZWVkYmFjaw0KPiA+DQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgNSArKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+
IGluZGV4IDNmZTBiODYuLjQxZDI4ZjQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9sdmRzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2x2ZHMuYw0KPiA+IEBAIC02MDMsNiArNjAzLDExIEBAIHN0YXRpYyB2b2lkIHJjYXJfbHZk
c19tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiA+ICAJbHZkcy0+ZGlzcGxh
eV9tb2RlID0gKmFkanVzdGVkX21vZGU7DQo+ID4NCj4gPiAgCXJjYXJfbHZkc19nZXRfbHZkc19t
b2RlKGx2ZHMpOw0KPiA+ICsJaWYgKGx2ZHMtPmNvbXBhbmlvbikgew0KPiA+ICsJCXN0cnVjdCBy
Y2FyX2x2ZHMgKmNvbXBhbmlvbl9sdmRzID0gYnJpZGdlX3RvX3JjYXJfbHZkcygNCj4gPiArCQkJ
CQkJCWx2ZHMtPmNvbXBhbmlvbik7DQo+ID4gKwkJY29tcGFuaW9uX2x2ZHMtPm1vZGUgPSBsdmRz
LT5tb2RlOw0KPiANCj4gSG93IGFib3V0IGNhbGxpbmcgcmNhcl9sdmRzX21vZGVfc2V0KCkgb24g
dGhlIGNvbXBhbmlvbiBpbnN0ZWFkID8NCg0KQ2FuIGRvLCB3aWxsIHNlbmQgYSBuZXcgdmVyc2lv
bi4NCg0KQ2hlZXJzLA0KRmFiDQoNCj4gDQo+ID4gKwl9DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0
aWMgaW50IHJjYXJfbHZkc19hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4gDQo+
IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
