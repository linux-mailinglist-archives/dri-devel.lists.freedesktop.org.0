Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317BF6CA7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821146E811;
	Mon, 11 Nov 2019 02:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400098.outbound.protection.outlook.com [40.107.140.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337766F8B4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 09:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IB0Ppltea+gtI+lMY2NnIg7SlMxUTMkG2GpIYa7T2EUNPfXCZBD56R+AhgxzZfRSaL8k85K6Eye3LCdeZDy0FICTTMDxMHH83ELcOlNBdWzg6xNC3WreVdkiz+UQPUCgWzkozw/wqPk/nju+m5b6TaRWKBhBDE1ma/azekW7kjCsGmrp1t4XCuddP4PlT5Ry5KS+d4XETQpk7GaeonOYi3tLVI+SsRzvwj8dfuHRvyqU2xMFgtl8M7WxyFlVDFUpfrsIiKSIg/foujEgncZUM/q0ynKx3sga23tRD1ii/0aEdKcDyToaXh+nN9xo2NNm+rC0/ic/ZTi6HCw3VOqmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0GYLgh1Oylvckau9k/rhiEoX3H1moI5UffS8DhQndI=;
 b=P35ExcYcIvcu0cpGAdD2sYyXdLUageSJR5PIhuKAp6hWAublVRqPdBj7HdzCkbzS1nrwmFmx30Nufsf9m8Ng31mFz2QkgHrYt+FcNChGVW7+qoRiGzXwn1eu9Zr+wXxMg5pGytMNlL8yOVIJNvBv9YhkDI2vemmbGfpF/02b7LznJyIe/yZQZ8JxXhJn6rIqiVZveuMwx/8z97XYdZy750jrSh+3GawHWUaw2wwwtCkC1hMH4n3FVWKtGE/NPazLwZRwEjqioWz6MUQk0NwrvYvYyoovIi6Fj3uw8PL3N22DxBMHaBCe3J+bSkD4AkyoaCIdZnxGpKGWSiMw9IU0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.167.146) by
 TYXPR01MB1534.jpnprd01.prod.outlook.com (52.133.168.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 09:32:53 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::91c8:fb22:e4a6:8518]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::91c8:fb22:e4a6:8518%7]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 09:32:53 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 4/7] drm: Define DRM_MODE_CONNECTOR_PARALLEL
Thread-Topic: [PATCH v3 4/7] drm: Define DRM_MODE_CONNECTOR_PARALLEL
Thread-Index: AQHVlaeMDgqMlHoMwk2u0QM5Tlax0KeALa0AgADUNkA=
Date: Fri, 8 Nov 2019 09:32:53 +0000
Message-ID: <TYXPR01MB177521E753ABF296097F094CC07B0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107204656.GP24983@pendragon.ideasonboard.com>
In-Reply-To: <20191107204656.GP24983@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af69eaaa-77dc-4326-c4dd-08d7642ea138
x-ms-traffictypediagnostic: TYXPR01MB1534:|TYXPR01MB1534:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB1534D498DDD701A8E8E85D05C07B0@TYXPR01MB1534.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(189003)(199004)(66066001)(55016002)(478600001)(81156014)(81166006)(8676002)(2906002)(99286004)(71200400001)(71190400001)(6436002)(6306002)(7416002)(9686003)(14454004)(86362001)(305945005)(25786009)(256004)(33656002)(6916009)(54906003)(229853002)(8936002)(966005)(3846002)(6116002)(6506007)(7736002)(53546011)(64756008)(4326008)(316002)(6246003)(102836004)(66476007)(26005)(486006)(186003)(76176011)(5660300002)(74316002)(52536014)(446003)(7696005)(66556008)(11346002)(76116006)(66946007)(66446008)(44832011)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYXPR01MB1534;
 H:TYXPR01MB1775.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cT85mqz2BFC1TzA45Q8SCujXfXr31Owj+5bfMtUvsfiMmrn9KH3g4Euf+9kQct+zZYaRU2z0MFbvtpbpndbzNCNiF7v3rjgCpPfRwmwrP/UUkxIk83Tv1+1uUJKfuSuh8kkiQtQCOjVP2Od0UvDHWP/3W2ON02u38iDEmKlmI3W1RnfjEXLW5+bzdNNHpSZ5BVDHKMcmPLD/qRqeGmLScKKfiLbVJtamjVPcj3Z/ppq6rTb8K+J5D/RSOSvGLmY9DyAo62SN9pqtqjkrjoaPbAt3nOGdnWc8cNjRL+3wX2/aFW4wZot5tKy9I8ZHrYx0sOlJzGMZhi6hqIlawQ25y5qariEDwmwcL90+djgp01k7is0tLX3V3yY2gZysT6CdqzAueOWyxo1Py6K2FQX6aOHq1TH9aRVsapg4UZxVVTjHExrRNQFmtwKN7H380OQTleZAOw2kt8cIqAGjo8nsiR2KPsd11R+bKOLzCkAlFt8=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af69eaaa-77dc-4326-c4dd-08d7642ea138
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 09:32:53.0341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 856+4SgcECiXFlfSDxqEoNssG/3KAajDqo9fO2RfCPO6AVc0PGbckzQ/6WQvsGbRtnKoRadkDVjLgrNwChgbtNhBoKeTTZ3YP6MKcH2BE+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1534
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0GYLgh1Oylvckau9k/rhiEoX3H1moI5UffS8DhQndI=;
 b=om1fXBJLCtVQ5ke7SmglR2vkfbS4rE6UrBG1mu0y7hdpxhZsOi1dgwshO8gRxwHICj78ySgVhMkra4hEB/ndx/7ZhyOOFNzgSlt4p7AJCfiWj0jaq3CXrpMfwZy+5DWNddpCwtur+t7vaKA23BwbPUd6lXM2deJNi7LSlxosrVE=
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
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IGRl
dmljZXRyZWUtb3duZXJAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlLW93bmVyQHZnZXIua2Vy
bmVsLm9yZz4gT24gQmVoYWxmIE9mIExhdXJlbnQgUGluY2hhcnQNCj4gU2VudDogMDcgTm92ZW1i
ZXIgMjAxOSAyMDo0Nw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDQvN10gZHJtOiBEZWZpbmUg
RFJNX01PREVfQ09OTkVDVE9SX1BBUkFMTEVMDQo+IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IChD
QydpbmcgU2FtKQ0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUaHUs
IE5vdiAwNywgMjAxOSBhdCAwODoxMTowMFBNICswMDAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6
DQo+ID4gVGhlIGV4aXN0aW5nIERSTV9NT0RFX0NPTk5FQ1RPUl8gZGVmaW5pdGlvbnMgZG9uJ3Qg
c2VlbSB0bw0KPiA+IGRlc2NyaWJlIHRoZSBjb25uZWN0b3IgZm9yIFJHQi9QYXJhbGxlbCBlbWJl
ZGRlZCBkaXNwbGF5cywNCj4gPiBoZW5jZSBhZGQgRFJNX01PREVfQ09OTkVDVE9SX1BBUkFMTEVM
Lg0KPiANCj4gUGxlYXNlLCBuby4gV2UgYWxyZWFkeSBoYXZlIHRvbyBtYW55IGNvbm5lY3RvciB0
eXBlcyBmb3IgcGFuZWxzLCB3aGVuDQo+IHVzZXJzcGFjZSBzaG91bGQgcmVhbGx5IG5vdCBjYXJl
LiBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUywNCj4gRFJNX01PREVfQ09OTkVDVE9SX2VEUCwgRFJN
X01PREVfQ09OTkVDVE9SX0RTSSwgRFJNX01PREVfQ09OTkVDVE9SX0RQSQ0KPiBhbmQgcHJvYmFi
bHkgRFJNX01PREVfQ09OTkVDVE9SX1NQSSBzaG91bGQgaGF2ZSBiZWVuDQo+IERSTV9NT0RFX0NP
Tk5FQ1RPUl9QQU5FTC4NCj4gDQo+IFRoaXMgaGFzIGJlZW4gZGlzY3Vzc2VkIGluIFsxXS4gTGV0
J3MgaW5zdGVhZCBkZWZpbmUgYQ0KPiBEUk1fTU9ERV9DT05ORUNUT1JfUEFORUwsIHBvc3NpYmx5
IGFzIGFuIGFsaWFzIHRvIG9uZSBvZiB0aGUgZXhpc3RpbmcNCj4gdHlwZXMsIGFuZCBkZXByZWNh
dGUgdGhlIG90aGVyIHR5cGVzLg0KPiANCj4gWzFdIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xp
c3RzL2RyaS1kZXZlbC9tc2cyMjQ2MzguaHRtbA0KDQpUaGFuayB5b3UgZm9yIHRoZSBwb2ludGVy
IGFuZCB0aGUgZm9yIHRoZSBkZXRhaWxzLiBUaGF0IGNsYXJpZmllcyB0aGluZ3MgYSBsb3QuDQpJ
biBteSBjYXNlLCBhcyB5b3UgbWVudGlvbmVkIGluIHRoZSBwYXRjaCB0byBzaW1wbGUgcGFuZWws
IEkgY2FuIHVzZSBhbg0KZXhpc3RpbmcgZGVmaW5pdGlvbiwgdGhlcmVmb3JlIEkgdGhpbmsgaXQn
cyBiZXN0IGlmIERSTV9NT0RFX0NPTk5FQ1RPUl9QQU5FTA0KZ2V0cyBhZGRlZCB3aGVuIHRoZXJl
IGlzIGEgdmFsaWQgdXNlIGNhc2UuDQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0K
PiA+DQo+ID4gLS0tDQo+ID4gdjItPnYzOg0KPiA+ICogTmV3IHBhdGNoDQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCAxICsNCj4gPiAgaW5jbHVkZS91YXBp
L2RybS9kcm1fbW9kZS5oICAgICB8IDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVj
dG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jDQo+ID4gaW5kZXggMjE2NjAw
MC4uYjIzMzAyOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rv
ci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYw0KPiA+IEBAIC05
Myw2ICs5Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Nvbm5fcHJvcF9lbnVtX2xpc3QgZHJtX2Nv
bm5lY3Rvcl9lbnVtX2xpc3RbXSA9IHsNCj4gPiAgCXsgRFJNX01PREVfQ09OTkVDVE9SX0RQSSwg
IkRQSSIgfSwNCj4gPiAgCXsgRFJNX01PREVfQ09OTkVDVE9SX1dSSVRFQkFDSywgIldyaXRlYmFj
ayIgfSwNCj4gPiAgCXsgRFJNX01PREVfQ09OTkVDVE9SX1NQSSwgIlNQSSIgfSwNCj4gPiArCXsg
RFJNX01PREVfQ09OTkVDVE9SX1BBUkFMTEVMLCAiUGFyYWxsZWwiIH0sDQo+ID4gIH07DQo+ID4N
Cj4gPiAgdm9pZCBkcm1fY29ubmVjdG9yX2lkYV9pbml0KHZvaWQpDQo+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUu
aA0KPiA+IGluZGV4IDczNWM4Y2YuLjU4NTJmNDcgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS91
YXBpL2RybS9kcm1fbW9kZS5oDQo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5o
DQo+ID4gQEAgLTM2Miw2ICszNjIsNyBAQCBlbnVtIGRybV9tb2RlX3N1YmNvbm5lY3RvciB7DQo+
ID4gICNkZWZpbmUgRFJNX01PREVfQ09OTkVDVE9SX0RQSQkJMTcNCj4gPiAgI2RlZmluZSBEUk1f
TU9ERV9DT05ORUNUT1JfV1JJVEVCQUNLCTE4DQo+ID4gICNkZWZpbmUgRFJNX01PREVfQ09OTkVD
VE9SX1NQSQkJMTkNCj4gPiArI2RlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfUEFSQUxMRUwJMjAN
Cj4gPg0KPiA+ICBzdHJ1Y3QgZHJtX21vZGVfZ2V0X2Nvbm5lY3RvciB7DQo+ID4NCj4gDQo+IC0t
DQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
