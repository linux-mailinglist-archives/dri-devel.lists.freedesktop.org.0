Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B282C9F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E16589F43;
	Tue,  6 Aug 2019 07:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410094.outbound.protection.outlook.com [40.107.141.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8696E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:08:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRE8Qvyweia6GBsSbbsmjyQ1Z+I8JOMxIIfotRWIgKiPt0GpoEk/jL9TF9wUYWgXYDeY0JS76qsI2Sim9Q7tcLbq8OVGGkywMFpz1BHhJ2g8cYWpFeryHj8dsdEr4ajYXl/j7uZACSOBg/4U+L7BJnWHHrbUTC07C7mosrYtPNwtXLBLzmDcOB7FcyyLhP9TYFf4B/YP3XDO9EDm6UzmWqWFfT+KnGd6c75GtdDuzJg0jx/NdgVGaigNCyGKOl+p3T7p57s2uv+vB+gHzMPYyT3toZH9b4VDkC/aFTIeKpRCxQQikIYYeoFTt0xhkDAn/R+t2F1H49EzMw/r+2Bz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKYwD4PjX7zAEvtnWK6Xb5ZpiiL6ncAhWuhtjOFUB+o=;
 b=UmrqY7/trU3leJR0EDUenqpVk8bW8O3P/pwXXFw2wpdHUAlMB6Bjfgi4Xeft9sb8lKtih0I0+EHm3oowlVCT8V44p5NFvbg7DkXYh+sVjGpkbJb0GXJp2Bwy/jWDbgULYK+ZwQ6AeOwa81ZivDjqoXJ0urdC1S3D7InxKjrRrlJssQiwxb4Gh51DsIjR1YwyngUSJnVJno+7DdObQqNo18lp/Nhu3pZ4yPIc3Mpw1NmTbYlJZwCxLw3aFy2YdYrJ5sm5+yXE/K3Ir/cd/8ShL410tb3BA4QAUKST9mAzamwNlwyQVAO51Si9QGEnHOPjt8fpDX0oIndHdcu1cXnMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1673.jpnprd01.prod.outlook.com (52.133.162.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 10:07:57 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 10:07:57 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link
 panels
Thread-Topic: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link
 panels
Thread-Index: AQHVSQTQGxO+ExbJj06XbPWiwlaDqKbnhDUAgATD9OCAAAuvAIAABUsg
Date: Mon, 5 Aug 2019 10:07:57 +0000
Message-ID: <TY1PR01MB1770A40992E1435FE694485CC0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082020.GH5008@pendragon.ideasonboard.com>
 <TY1PR01MB1770CA2012398B421E609D54C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190805094832.GC29747@pendragon.ideasonboard.com>
In-Reply-To: <20190805094832.GC29747@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81535b34-3848-44ac-39e5-08d7198cca3b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1673; 
x-ms-traffictypediagnostic: TY1PR01MB1673:
x-microsoft-antispam-prvs: <TY1PR01MB167338CB5000BA8464CFF270C0DA0@TY1PR01MB1673.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(199004)(189003)(11346002)(3846002)(6116002)(256004)(229853002)(86362001)(7416002)(446003)(55016002)(8676002)(68736007)(478600001)(186003)(9686003)(476003)(6246003)(7696005)(99286004)(6916009)(81156014)(6436002)(66946007)(76116006)(52536014)(81166006)(66556008)(66476007)(74316002)(107886003)(33656002)(14454004)(7736002)(8936002)(66446008)(64756008)(102836004)(76176011)(316002)(71200400001)(71190400001)(53936002)(486006)(66066001)(26005)(54906003)(2906002)(305945005)(6506007)(4326008)(53546011)(25786009)(44832011)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1673;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4CTlwGyagMXT1r0bd13JW6lwdJup3AVGCq5TyRrBqd+RdaVQtWVgtoieQIEA+5pDCbWgU+VAYki6vSMukIDqy5k+vMaejt9XBMyCg2OnGe5eZWnZjUVL7tFob8ENvk+nGN94Y1s6R3VjAd9DZo17xn/gux/zYLi/0Fxqyil5huG1g5kMCtAKKpyG0iS+J386wVhnkZNxKk0pDccJo9jwriI5SwKN6swRMWank/1cWfZe4LMiZVDt7Lu1020C8jnadP3OQPrqBKNkvhJ0e3YMqE2d2UyabT6xLHzWCqm9V7Fk+rTYHVO+9yoidk1YhGQ+8bfT3qEDXQfeByv/8RF2masOorMNaxFgE5yFn/CS+mZZXMNekSHGF4pUZKKabi8sCd0hVM1mpnU8gkI54f35mgJXeoIB+2M98jgyaRf6J1A=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81535b34-3848-44ac-39e5-08d7198cca3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 10:07:57.3800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1673
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKYwD4PjX7zAEvtnWK6Xb5ZpiiL6ncAhWuhtjOFUB+o=;
 b=S7LKFTZZHaKK+NwGuTRo6IlJXjzPD2Rsc8BUk+miMDsIo7SehBPvE/sbASiIetzroCSr60ULTGcw7EKq/A1bemi+90ai+D759uQeV7uqhl3GbJIwwxhAeYoEihHtR8Mbi8AYkKZd4gyBhOrKDy9EPHRF8M/+LEQZ1XLiL8QrNtg=
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

SGkgTGF1cmVudCwNCg0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IDA1IEF1Z3VzdCAyMDE5IDEwOjQ5DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0gvUkZDIDA3LzEyXSBkcm06IHJjYXItZHU6IGx2ZHM6IEFkZCBzdXBwb3J0
IGZvciBkdWFsIGxpbmsgcGFuZWxzDQo+IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IE9uIE1vbiwg
QXVnIDA1LCAyMDE5IGF0IDA5OjEyOjM0QU0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToN
Cj4gPiA+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4NCj4gPiA+IFNlbnQ6IDAyIEF1Z3VzdCAyMDE5IDA5OjIwDQo+ID4gPiBTdWJqZWN0
OiBSZTogW1BBVENIL1JGQyAwNy8xMl0gZHJtOiByY2FyLWR1OiBsdmRzOiBBZGQgc3VwcG9ydCBm
b3IgZHVhbCBsaW5rIHBhbmVscw0KPiA+ID4NCj4gPiA+IEhpIEZhYnJpemlvLA0KPiA+ID4NCj4g
PiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgQXVnIDAy
LCAyMDE5IGF0IDA4OjM0OjA0QU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gPiA+
ID4gSWYgdGhlIGRpc3BsYXkgY29tZXMgd2l0aCB0d28gcG9ydHMsIGFzc3VtZSBpdCBzdXBwb3J0
cyBkdWFsDQo+ID4gPiA+IGxpbmsuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZh
YnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiAt
LS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgMyArKysN
Cj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPiA+ID4NCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMNCj4gPiA+ID4gaW5kZXggMmQ1NGFlNS4u
OTdjNTFjMiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9sdmRzLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRz
LmMNCj4gPiA+ID4gQEAgLTc1MSw2ICs3NTEsOSBAQCBzdGF0aWMgaW50IHJjYXJfbHZkc19wYXJz
ZV9kdChzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQ0KPiA+ID4gPiAgCQkJcmV0ID0gLUVQUk9CRV9E
RUZFUjsNCj4gPiA+ID4gIAkJCWdvdG8gZG9uZTsNCj4gPiA+ID4gIAkJfQ0KPiA+ID4gPiArCQlp
ZiAobHZkcy0+aW5mby0+cXVpcmtzICYgUkNBUl9MVkRTX1FVSVJLX0RVQUxfTElOSykNCj4gPiA+
ID4gKwkJCWx2ZHMtPmR1YWxfbGluayA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9jb3VudChyZW1v
dGUpDQo+ID4gPiA+ICsJCQkJCT09IDI7DQo+ID4gPg0KPiA+ID4gVGhpcyBpcyBhIGJpdCBvZiBh
IGhhY2ssIGFzIEkgdGhpbmsgdGhlIGluZm9ybWF0aW9uIHNob3VsZCBiZSBxdWVyaWVkDQo+ID4g
PiBmcm9tIHRoZSBwYW5lbCwgbGlrZSB3ZSBkbyBmb3IgYnJpZGdlcy4gSSdkIHNheSB3ZSBjYW4g
bGl2ZSB3aXRoIHRoaXMNCj4gPiA+IGZvciBub3csIGJ1dCBhcyB0aGUgZGF0YSBzd2FwIGZsYWcg
c2hvdWxkIGNvbWUgZnJvbSB0aGUgcGFuZWwgYXMgd2VsbCwNCj4gPiA+IHdlIHdpbGwgbmVlZCBp
bmZyYXN0cnVjdHVyZSBmb3IgdGhhdCwgYW5kIHdlIGNhbiBhcyB3ZWxsIHRocm91Z2ggdGhlDQo+
ID4gPiBkdWFsIGxpbmsgZmxhZyB0aGVyZSBhdCB0aGUgc2FtZSB0aW1lLg0KPiA+DQo+ID4gSSB0
b3RhbGx5IGFncmVlLCB0aGlzIGlzIGEgbmFzdHkgaGFjaywgbXkgc2VyaWVzIGlzIG1pc3Npbmcg
dGhlIGluZnJhc3RydWN0dXJlDQo+ID4gZm9yIGRlc2NyaWJpbmcgdGhpcyBpbmZvcm1hdGlvbg0K
PiA+DQo+ID4gPiBJIHRoaW5rIHdlIHNob3VsZCB1c2UgdGhlIGRybV9icmlkZ2VfdGltaW5ncyBz
dHJ1Y3R1cmUgZm9yIHRoaXMgcHVycG9zZSwNCj4gPiA+IGFzIGl0IHdvdWxkIG1ha2UgbGlmZSBt
b3JlIGRpZmZpY3VsdCBmb3IgdXNlcnMgb2YgZHJtX2JyaWRnZSBhbmQNCj4gPiA+IGRybV9wYW5l
bCB0byBoYXZlIHR3byBkaWZmZXJlbnQgc3RydWN0dXJlcyAoZXNwZWNpYWxseSB3aGVuIHdyYXBw
aW5nIGENCj4gPiA+IGRybV9wYW5lbCB3aXRoIGRybV9wYW5lbF9icmlkZ2VfYWRkKCkpLiBUaGUg
c3RydWN0dXJlIGNvdWxkIGJlIHJlbmFtZWQNCj4gPiA+IGlmIGRlc2lyZWQuDQo+ID4NCj4gPiBJ
IGFtIG5vdCB0b28gc3VyZSB1c2luZyBkcm1fYnJpZGdlX3RpbWluZ3MgZm9yIHBhbmVscyB3b3Vs
ZCBtYWtlIGV2ZXJ5Ym9keQ0KPiA+IGhhcHB5PyBJcyB0aGVyZSBhbnkgYWx0ZXJuYXRpdmU/IFBl
cmhhcHMgdGhpcyBjYWxscyBmb3IgYSBuZXcgc3RydWN0IHdlIGNvdWxkDQo+ID4gZW1iZWQgaW4g
Ym90aCBkcm1fYnJpZGdlX3RpbWluZ3MgYW5kIHNvbWUgZHJtX3BhbmVsXzx3aGF0ZXZlcj4gZGF0
YQ0KPiA+IHN0cnVjdHVyZT8NCj4gDQo+IEkgdGhpbmsgd2UgY291bGQgc2ltcGx5IHJlbmFtZSB0
aGUgc3RydWN0dXJlLCBhbGwgaXRzIGZpZWxkcyBhcHBseSB0bw0KPiBwYW5lbHMgdG9vLg0KDQpP
aywgd2lsbCBnaXZlIHRoaXMgYSB0cnkuDQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiA+ID4gPiAg
CX0NCj4gPiA+ID4NCj4gPiA+ID4gIAlpZiAobHZkcy0+ZHVhbF9saW5rKSB7DQo+IA0KPiAtLQ0K
PiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
