Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96EF6CBF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99166E835;
	Mon, 11 Nov 2019 02:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400095.outbound.protection.outlook.com [40.107.140.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850256F966
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 12:02:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQNkVgjEkHETPS02jMBpHBkyyV7tejopWbGk5BtlzWmxEVvd6D+YuPQ90VDa7neG84xJl94MkMBBnpkb0wq6RSoEnqv1FIRyjXAx1Ppru59AFQcW77LjHllGcuissBI0XZzqZB7HJnslcJjpX3C4+NdugzQneteCoDl3njPmICpO3L8gT7X99MRbvKVfrvpeNRQCzjLdFnYIWPM3enWfGuDlJEJjxax4vYBqkCTyGWt8YCmREq/xS3OCN41RT6F4cajLg4DFqfAO+YKrKQu5mV9NRK0N738KOQBPgo+nekVWnoGpENsiSo0hEmLC4n+y55dFaE9oTc91p7wEJW6aDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N58KYz+ItsbN2HzWg8uPT7fe6MuubNTh3liUoiEgXlk=;
 b=PXi+ONTTgDOEzBktHl1Q6PU65/ZZOpk7PGtQnKJ5OcjUssds7BvNcG4GMDhdoHIgvCFVpXLEhN5HwQgD5A3T8SBxerfUlsfDPbdUQqi0O4VW4MtHJuESajy0pkh8Wt6cGDcf7a0pPNu8zGg459Wnuw7u1RMH6JhZfzEnbIFsbbvop44vwN87bb8zW1h+5H60UIS+1WOk+goA8Jy8O7MkCQ5i0GEh+fn1i0ER7N76oGVxV8//c8pIOZ13Gx6S316wlBrIoutbpyhVcn6st0FcYVQDzja0kP2tK5Ff197toC5EEK2vNQcujIeTWPVq3kdzA5jmWxrehvxsVgfB2aSugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1836.jpnprd01.prod.outlook.com (52.133.160.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 12:02:05 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287%7]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 12:02:04 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 6/7] ARM: dts: iwg20d-q7-common: Add LCD support
Thread-Topic: [PATCH v3 6/7] ARM: dts: iwg20d-q7-common: Add LCD support
Thread-Index: AQHVlaeS/+J7N420Tkeg2ioTVPqKN6eAMAUAgADYzrA=
Date: Fri, 8 Nov 2019 12:02:04 +0000
Message-ID: <TY1PR01MB1770D144464371F5DB5746B8C07B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107205520.GR24983@pendragon.ideasonboard.com>
In-Reply-To: <20191107205520.GR24983@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2a2b66a3-1ae7-471d-3e29-08d7644378cc
x-ms-traffictypediagnostic: TY1PR01MB1836:|TY1PR01MB1836:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB18362AEE4E91AB209A275C13C07B0@TY1PR01MB1836.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(189003)(199004)(55016002)(76176011)(74316002)(66066001)(7736002)(305945005)(256004)(7696005)(7416002)(316002)(53546011)(102836004)(86362001)(99286004)(44832011)(186003)(26005)(446003)(11346002)(6916009)(6506007)(476003)(486006)(6246003)(478600001)(64756008)(5660300002)(66446008)(4326008)(66476007)(76116006)(66556008)(6436002)(66946007)(54906003)(81166006)(14454004)(8936002)(81156014)(9686003)(71190400001)(229853002)(71200400001)(52536014)(6116002)(33656002)(25786009)(3846002)(8676002)(2906002)(14444005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1836;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q8PCXZGoB2VzK7uUMplL0qM6Vs13Z8UKk90F9JfcB/I6LouMGDuY47kSdDNrDQAytnQ/PeQK1Psa0Vgsg3//Crw4PrgR5B4Dh03t9Z7zkgpKgbSZ79xMY9mWRSKKwn6HlhgST8uLZk02wsrQ4iTm4atF9gleAGThaCJXFv/mxXaPyK/Nv6fx1b3QLEdnleKj6UQb62vA18kW5jnRmabTv2MAcK7lq85GlQJhkgb7xRISaFrlTKS55sdfFnxQukEZmLTQNGf7gk5x7iVKFs9Tm1tvDce3Oastpas8neQ/GOb9dXS4TOaTBKGxuPRT4q6rQwePoJS7ZCBp+/sQ9xdavHwZDNey5dHpBu0Ir+4Enr/fajNbccznoRl2wgzqOaz4PkGTN5xMiNXWdDj+2Pg7jH8VXGflqpY7dweTY/y0nd/urbvQn7eDmrF1vpVa6tZZ
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2b66a3-1ae7-471d-3e29-08d7644378cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 12:02:04.4699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lusWHP28Ry7cQz/nzQs2PI9V+RDIAJPRzkAKEjXhYQqNyXXvfUHcRwxpGZ/OBrg5arZyLcsFWTNbO7N726C5uzU+BqeeTdg/kiArk2ft42I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1836
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N58KYz+ItsbN2HzWg8uPT7fe6MuubNTh3liUoiEgXlk=;
 b=jvMd+bFjGkCWWyhB2Offab+7L8z9jCvjFh8yDxlVXhYF6iFSR86usrRMqUEV507HRmBu8QW92zRuE+sNLGwotchAP1eMolyMLhvHBvYopCGWXUebb1mtMe7LXpjQQbYeYOU1kyBhkY1JyP8aVyXv2dqVbfnCrMNcQ/MAwGuXClw=
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
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IGxp
bnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtcmVuZXNhcy1zb2Mt
b3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgTGF1cmVudCBQaW5jaGFydA0KPiBT
ZW50OiAwNyBOb3ZlbWJlciAyMDE5IDIwOjU1DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNi83
XSBBUk06IGR0czogaXdnMjBkLXE3LWNvbW1vbjogQWRkIExDRCBzdXBwb3J0DQo+IA0KPiBIaSBG
YWJyaXppbywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVGh1LCBO
b3YgMDcsIDIwMTkgYXQgMDg6MTE6MDJQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0K
PiA+IFRoZSBpd2cyMGQgY29tZXMgd2l0aCBhIDciIGNhcGFjaXRpdmUgdG91Y2ggc2NyZWVuLCB0
aGVyZWZvcmUNCj4gPiBhZGQgc3VwcG9ydCBmb3IgaXQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPg0K
PiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAqIE5vIGNoYW5nZQ0KPiA+IHYxLT52MjoNCj4gPiAq
IE5vIGNoYW5nZQ0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctY29t
bW9uLmR0c2kgIHwgODUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgYXJj
aC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaSB8ICAxIC0NCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNvbW1vbi5kdHNpIGIvYXJjaC9h
cm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNvbW1vbi5kdHNpDQo+ID4gaW5kZXggYWU3NWExZGIuLjM0
MjhiOGQgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNvbW1v
bi5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNvbW1vbi5kdHNp
DQo+ID4gQEAgLTQ2LDYgKzQ2LDQ5IEBADQo+ID4gIAkJY2xvY2stZnJlcXVlbmN5ID0gPDI2MDAw
MDAwPjsNCj4gPiAgCX07DQo+ID4NCj4gPiArCWxjZF9iYWNrbGlnaHQ6IGJhY2tsaWdodCB7DQo+
ID4gKwkJY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsNCj4gPiArDQo+ID4gKwkJcHdtcyA9
IDwmcHdtMyAwIDUwMDAwMDAgMD47DQo+ID4gKwkJYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCA0IDgg
MTYgMzIgNjQgMTI4IDI1NT47DQo+ID4gKwkJZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDc+
Ow0KPiA+ICsJCWVuYWJsZS1ncGlvcyA9IDwmZ3BpbzUgMTQgR1BJT19BQ1RJVkVfSElHSD47DQo+
ID4gKwl9Ow0KPiA+ICsNCj4gPiArCWx2ZHMtcmVjZWl2ZXIgew0KPiA+ICsJCWNvbXBhdGlibGUg
PSAibHZkcy1kZWNvZGVyIjsNCj4gDQo+IEEgc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmcgaXMg
cmVxdWlyZWQuDQoNCldpbGwgZG9jdW1lbnQgdGhlIHNwZWNpZmljIGNvbXBhdGlibGUgaW4gdGhl
IGJpbmRpbmcgZG9jDQoNCj4gDQo+IEkgdGhpbmsgdGhlIGx2ZHMtZGVjb2RlciBkcml2ZXIgc2hv
dWxkIGVycm9yIG91dCBhdCBwcm9iZSB0aW1lIGlmIG9ubHkNCj4gb25lIGNvbXBhdGlibGUgc3Ry
aW5nIGlzIGxpc3RlZC4NCg0KT2ssIHdpbGwgbW9kaWZ5IHRoZSBkcml2ZXIgYWNjb3JkaW5nbHkN
Cg0KPiANCj4gPiArCQlwb3dlcmRvd24gPSA8JmdwaW83IDI1IEdQSU9fQUNUSVZFX0xPVz47DQo+
IA0KPiBwb3dlcmRvd24tZ3Bpb3MgPw0KDQpUaGF0J3MgYSBidWcsIHdlbGwgc3BvdHRlZC4NCg0K
PiANCj4gPiArDQo+ID4gKwkJcG9ydHMgew0KPiA+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4gPiArCQkJI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+ICsJCQlwb3J0QDAgew0KPiA+
ICsJCQkJcmVnID0gPDA+Ow0KPiA+ICsJCQkJbHZkc19yZWNlaXZlcl9pbjogZW5kcG9pbnQgew0K
PiA+ICsJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczBfb3V0PjsNCj4gPiArCQkJCX07DQo+
ID4gKwkJCX07DQo+ID4gKwkJCXBvcnRAMSB7DQo+ID4gKwkJCQlyZWcgPSA8MT47DQo+ID4gKwkJ
CQlsdmRzX3JlY2VpdmVyX291dDogZW5kcG9pbnQgew0KPiA+ICsJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmcGFuZWxfaW4+Ow0KPiA+ICsJCQkJfTsNCj4gPiArCQkJfTsNCj4gPiArCQl9Ow0KPiA+
ICsJfTsNCj4gPiArDQo+ID4gKwlwYW5lbCB7DQo+ID4gKwkJY29tcGF0aWJsZSA9ICJlZHQsZXRt
MDcwMGcwZGg2IiwgInNpbXBsZS1wYW5lbCI7DQo+IA0KPiBUaGVyZSdzIG5vICJzaW1wbGUtcGFu
ZWwiIGNvbXBhdGlibGUgc3RyaW5nIGRlZmluZWQgYW55d2hlcmUgYXMgZmFyIGFzIEkNCj4gY2Fu
IHRlbGwuDQoNClRoZSB1c2FnZSBvZiAic2ltcGxlLXBhbmVsIiBhcyBhIGNvbXBhdGlibGUgaXMg
d2lkZXNwcmVhZCBhbmQgcmVhbGx5IGNvbmZ1c2luZy4gDQpUaGUgZmFjdCB0aGF0IHlvdSBtYWRl
IHRoaXMgY29tbWVudCBpcyBnb29kIGVub3VnaCBmb3IgbWUgdG8gc2F5IHdlIGRvbid0DQpuZWVk
IGl0LCBJJ2xsIHRha2UgaXQgb3V0Lg0KDQo+IA0KPiA+ICsJCWJhY2tsaWdodCA9IDwmbGNkX2Jh
Y2tsaWdodD47DQo+ID4gKw0KPiA+ICsJCXBvcnQgew0KPiA+ICsJCQlwYW5lbF9pbjogZW5kcG9p
bnQgew0KPiA+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX3JlY2VpdmVyX291dD47DQo+
ID4gKwkJCX07DQo+ID4gKwkJfTsNCj4gPiArCX07DQo+ID4gKw0KPiA+ICAJcmVnXzFwNXY6IDFw
NXYgew0KPiA+ICAJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsNCj4gPiAgCQlyZWd1
bGF0b3ItbmFtZSA9ICIxUDVWIjsNCj4gPiBAQCAtMTIwLDYgKzE2MywxOCBAQA0KPiA+ICAJc3Rh
dHVzID0gIm9rYXkiOw0KPiA+ICB9Ow0KPiA+DQo+ID4gKyZkdSB7DQo+ID4gKwlzdGF0dXMgPSAi
b2theSI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmZ3BpbzIgew0KPiA+ICsJdG91Y2gtaW50ZXJy
dXB0IHsNCj4gPiArCQlncGlvLWhvZzsNCj4gPiArCQlncGlvcyA9IDwxMiBHUElPX0FDVElWRV9M
T1c+Ow0KPiA+ICsJCWlucHV0Ow0KPiA+ICsJfTsNCj4gDQo+IERvIHlvdSBuZWVkIHRoaXMsIHdp
dGggdGhlIHRvdWNocGFuZWxAMzggbm9kZSBhbHJlYWR5IGxpc3RpbmcgdGhlDQo+IGludGVycnVw
dCA/DQoNClllcywgdW5mb3J0dW5hdGVseSB3ZSBkbyBuZWVkIHRoaXMgYXMgdGhlIGJvb3Rsb2Fk
ZXIgaXMgcG9raW5nIHdpdGggdGhlIGdwaW8uDQpJIGNhbid0IGZpeCB0aGlzIGluIHRoZSBib290
bG9hZGVyIGFzIHdlIGhhdmUgbm8gY29udHJvbCBvdmVyIGl0Lg0KDQpUaGFua3MsDQpGYWINCg0K
PiANCj4gPiArfTsNCj4gPiArDQo+ID4gICZoc3VzYiB7DQo+ID4gIAlzdGF0dXMgPSAib2theSI7
DQo+ID4gIAlwaW5jdHJsLTAgPSA8JnVzYjBfcGlucz47DQo+ID4gQEAgLTE0Nyw2ICsyMDIsMjUg
QEANCj4gPiAgCQlWRERJTy1zdXBwbHkgPSA8JnJlZ18zcDN2PjsNCj4gPiAgCQlWRERELXN1cHBs
eSA9IDwmcmVnXzFwNXY+Ow0KPiA+ICAJfTsNCj4gPiArDQo+ID4gKwl0b3VjaDogdG91Y2hwYW5l
bEAzOCB7DQo+ID4gKwkJY29tcGF0aWJsZSA9ICJlZHQsZWR0LWZ0NTQwNiI7DQo+ID4gKwkJcmVn
ID0gPDB4Mzg+Ow0KPiA+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8yPjsNCj4gPiArCQlp
bnRlcnJ1cHRzID0gPDEyIElSUV9UWVBFX0VER0VfRkFMTElORz47DQo+ID4gKwl9Ow0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiArJmx2ZHMwIHsNCj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+
ID4gKwlwb3J0cyB7DQo+ID4gKwkJcG9ydEAxIHsNCj4gPiArCQkJbHZkczBfb3V0OiBlbmRwb2lu
dCB7DQo+ID4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNfcmVjZWl2ZXJfaW4+Ow0KPiA+
ICsJCQl9Ow0KPiA+ICsJCX07DQo+ID4gKwl9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gICZwY2kwIHsN
Cj4gPiBAQCAtMTgwLDYgKzI1NCwxMSBAQA0KPiA+ICAJCWZ1bmN0aW9uID0gImkyYzIiOw0KPiA+
ICAJfTsNCj4gPg0KPiA+ICsJcHdtM19waW5zOiBwd20zIHsNCj4gPiArCQlncm91cHMgPSAicHdt
MyI7DQo+ID4gKwkJZnVuY3Rpb24gPSAicHdtMyI7DQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiAgCXNj
aWYwX3BpbnM6IHNjaWYwIHsNCj4gPiAgCQlncm91cHMgPSAic2NpZjBfZGF0YV9kIjsNCj4gPiAg
CQlmdW5jdGlvbiA9ICJzY2lmMCI7DQo+ID4gQEAgLTIxOCw2ICsyOTcsMTIgQEANCj4gPiAgCX07
DQo+ID4gIH07DQo+ID4NCj4gPiArJnB3bTMgew0KPiA+ICsJcGluY3RybC0wID0gPCZwd20zX3Bp
bnM+Ow0KPiA+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArCXN0YXR1cyA9ICJv
a2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gICZyY2FyX3NvdW5kIHsNCj4gPiAgCXBpbmN0cmwt
MCA9IDwmc291bmRfcGlucz47DQo+ID4gIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctZGJjbS1jYS5kdHNpIGIv
YXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaQ0KPiA+IGluZGV4IDBlOTlk
ZjIuLmVkZTJlMGMgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3
LWRiY20tY2EuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1kYmNt
LWNhLmR0c2kNCj4gPiBAQCAtMzksNyArMzksNiBAQA0KPiA+ICAmZHUgew0KPiA+ICAJcGluY3Ry
bC0wID0gPCZkdV9waW5zPjsNCj4gPiAgCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4g
LQlzdGF0dXMgPSAib2theSI7DQo+ID4NCj4gPiAgCXBvcnRzIHsNCj4gPiAgCQlwb3J0QDAgew0K
PiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
