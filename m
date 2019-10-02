Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB98CB53F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3416EAC0;
	Fri,  4 Oct 2019 07:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50095.outbound.protection.outlook.com [40.107.5.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D506E92F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 10:27:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGXhFrpFFT8MBODaPppTRv0TodReNo9YylGcTatZ8cy6xB+K25GZCclmhslxsV2JUDkzKFuW8XJlsibUAd7oHlt9NmXM6bfB4FHje8on1uN3YKq8Ljl1mto2A47fGcW7A26gUxM0MgMSBp+p3u8AnNnhDB+TvjoxRGS3f5S5ukLSnV09TuHXoH8qwudATNKkIaslQHi4FKD5WiEVUXv+o7VVm1pVaeQ2uAgLNs/CBCa6SOAzaXeYGFHT5yQax15Zn0K2Sua0MrFU3NM2MLt2AWBrzEt2PM2v/KGeSSvOh6aM9LI3BtbOKIX7yH+uYuyxHFnhsG64Nr32PXrVXs5pLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0mvGMjtSZzZ6ei3bNFTvVYZBW5Eh6xrBGjTUPMZ3mw=;
 b=D2nfwMkAYbOpTAkjrL8q9uATqC6eL5yuHXhKN1qtT0/+iKDoWDxmoYN+BvSA/cGPKl0s8GSBzuqDOebKjYGMhU2lCoHHN0gJi3FFIULtTReD6/n6fRniVdIL5gFb9aDZIUZe2JcnVNOb9shPfKSlWwHZS77DJnRtAP2Z9XQG272S+PMLfG3HUdBASGdxz1h8rai7KaVCoDVlQc7zk9AxeL2Tb041QiRpN9VqcrdHOnXkbeomApOcDwn1Cq9dYx28cm8zSAER+gxE7d2L2iDHjq5P3R29TNRymbK0vNJlyKHfx2ISgtY1WuQZyTSqMzC+4vVW1GX5kujg56VUl93axw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com (52.134.19.20) by
 VI1PR0502MB4096.eurprd05.prod.outlook.com (52.134.19.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 10:27:00 +0000
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::f427:26bb:85cf:abad]) by VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::f427:26bb:85cf:abad%7]) with mapi id 15.20.2305.017; Wed, 2 Oct 2019
 10:27:00 +0000
From: Philippe Schenker <philippe.schenker@toradex.com>
To: "robh@kernel.org" <robh@kernel.org>, "marcel@ziswiler.com"
 <marcel@ziswiler.com>
Subject: Re: [PATCH v1 2/2] drm/panel: simple: add display timings for logic
 technologies displays
Thread-Topic: [PATCH v1 2/2] drm/panel: simple: add display timings for logic
 technologies displays
Thread-Index: AQHVb4i+AFMG6Tf6HkW/qXEuG4gbDqdGaaaAgADPIIA=
Date: Wed, 2 Oct 2019 10:27:00 +0000
Message-ID: <e6fdfd7f46308dbc8fd33d4a2ff0b242ec39a84c.camel@toradex.com>
References: <20190920075411.15735-1-marcel@ziswiler.com>
 <20190920075411.15735-2-marcel@ziswiler.com> <20191001220539.GA16232@bogus>
In-Reply-To: <20191001220539.GA16232@bogus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f15d255-e1c9-4abc-1c33-08d747230f57
x-ms-traffictypediagnostic: VI1PR0502MB4096:
x-ms-exchange-purlcount: 5
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0502MB40969228AC2181E5BE9B3A8FF49C0@VI1PR0502MB4096.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39840400004)(366004)(396003)(136003)(199004)(189003)(81156014)(4326008)(8676002)(6436002)(71200400001)(71190400001)(5660300002)(186003)(25786009)(36756003)(8936002)(44832011)(229853002)(81166006)(110136005)(486006)(118296001)(14454004)(966005)(446003)(478600001)(476003)(99286004)(11346002)(2616005)(316002)(6486002)(54906003)(3846002)(6116002)(6512007)(6306002)(256004)(26005)(7416002)(2906002)(6506007)(2501003)(7736002)(305945005)(6246003)(102836004)(76176011)(76116006)(64756008)(66446008)(86362001)(66066001)(66946007)(66476007)(66556008)(91956017);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB4096;
 H:VI1PR0502MB3965.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pwO/jSufG8D89yQnZnI3BRONcgXw9sqwVxEQkaqxFATMhJmFT6/ea3HZQCgVCkxTqcUlRTPcbddKp9mW5zD3bAqzGdVaDO3++dl4+CV9SwkM5661YsrTUctkLkGcs+4NXqZpjvSpYC0C7EDZeGMtUY8IDwRCLisHA5j7XKiQ30yzKPHfXYkOFazm/tdfWCeraqXipfpHLkf1p/KkUWK7b+otHfJPyD1QPvoUafAoWchnVYPi1lLq6LWs4u1s4Dnbqp7Upzj50HCkk4Eq8xwi/kxwLp8LJCoxEpQBy5G0TTVmw5v9gwuk8GFyvvecHalcyAcKAnkCgmcDVaAgmmbNJYE0JzQ+hvhKvxMvrfjTj6I/iOGx2EqAjL0+IqN1ToSQrbWkOdLb0XBxwrwdetQXDlwj8Wvh0HjbQL6uk/h98xkHLwjUlj57MWsEhG9i4/M/TLrE2XDj9kFK5/ww+Cng+Q==
Content-ID: <D3C60422FD7EBD47B696FB27DF221D96@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f15d255-e1c9-4abc-1c33-08d747230f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 10:27:00.1769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gq7TmBEgRf1NUtq9b+O6AJ/8KACub/tnZRDTeeBVlwyjAWHHRBNeJs/Y4uhWV/mhcbGPVkmPet2tOuMZRwVyNWaRxYnSrY2/1wBeBssWffE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB4096
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toradex.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0mvGMjtSZzZ6ei3bNFTvVYZBW5Eh6xrBGjTUPMZ3mw=;
 b=a35TCs9HsEBKLiigAT7TlpmJVFhs9zG4I7DSaP0X2UuHnvVPSbrftktcIM/mpnpIaDTxIZhcE0UlVYhYHxsDJhqXbFJ0h3Ccwm0+DhHiYswjx0sTwKp+bFXLdiTf1m8RND9MxfUFVYveCWeMmXJjCYlKEA2i9kE7KE0OYiQvRb8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=philippe.schenker@toradex.com; 
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "j.bauer@endrich.com" <j.bauer@endrich.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "info@logictechno.com" <info@logictechno.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTEwLTAxIGF0IDE3OjA1IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDk6NTQ6MTFBTSArMDIwMCwgTWFyY2VsIFppc3dpbGVy
IHdyb3RlOg0KPiA+IEZyb206IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFk
ZXguY29tPg0KPiA+IA0KPiA+IEFkZCBkaXNwbGF5IHRpbWluZ3MgZm9yIHRoZSBmb2xsb3dpbmcg
MyBkaXNwbGF5IHBhbmVscyBtYW51ZmFjdHVyZWQNCj4gPiBieQ0KPiA+IExvZ2ljIFRlY2hub2xv
Z2llcyBMaW1pdGVkOg0KPiA+IA0KPiA+IC0gTFQxNjEwMTAtMk5IQyBlLmcuIGFzIGZvdW5kIGlu
IHRoZSBUb3JhZGV4IENhcGFjaXRpdmUgVG91Y2gNCj4gPiBEaXNwbGF5DQo+ID4gICA3IiBQYXJh
bGxlbCBbMV0NCj4gPiAtIExUMTYxMDEwLTJOSFIgZS5nLiBhcyBmb3VuZCBpbiB0aGUgVG9yYWRl
eCBSZXNpc3RpdmUgVG91Y2ggRGlzcGxheQ0KPiA+IDciDQo+ID4gICBQYXJhbGxlbCBbMl0NCj4g
PiAtIExUMTcwNDEwLTJXSEMgZS5nLiBhcyBmb3VuZCBpbiB0aGUgVG9yYWRleCBDYXBhY2l0aXZl
IFRvdWNoDQo+ID4gRGlzcGxheQ0KPiA+ICAgMTAuMSIgTFZEUyBbM10NCj4gPiANCj4gPiBUaG9z
ZSBwYW5lbHMgbWF5IGFsc28gYmUgZGlzdHJpYnV0ZWQgYnkgRW5kcmljaCBCYXVlbGVtZW50ZQ0K
PiA+IFZlcnRyaWVicw0KPiA+IEdtYkggWzRdLg0KPiA+IA0KPiA+IFsxXSANCj4gPiBodHRwczov
L2RvY3MudG9yYWRleC5jb20vMTA0NDk3LTctaW5jaC1wYXJhbGxlbC1jYXBhY2l0aXZlLXRvdWNo
LWRpc3BsYXktODAweDQ4MC1kYXRhc2hlZXQucGRmDQo+ID4gWzJdIA0KPiA+IGh0dHBzOi8vZG9j
cy50b3JhZGV4LmNvbS8xMDQ0OTgtNy1pbmNoLXBhcmFsbGVsLXJlc2lzdGl2ZS10b3VjaC1kaXNw
bGF5LTgwMHg0ODAucGRmDQo+ID4gWzNdIA0KPiA+IGh0dHBzOi8vZG9jcy50b3JhZGV4LmNvbS8x
MDU5NTItMTAtMS1pbmNoLWx2ZHMtY2FwYWNpdGl2ZS10b3VjaC1kaXNwbGF5LTEyODB4ODAwLWRh
dGFzaGVldC5wZGYNCj4gPiBbNF0gDQo+ID4gaHR0cHM6Ly93d3cuZW5kcmljaC5jb20vaXNpNTBf
aXNpMzBfdGZ0LWRpc3BsYXlzL2x0MTcwNDEwLTF3aGNfaXNpMzANCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCj4g
PiANCj4gPiAtLS0NCj4gPiANCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jIHwgNjUNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jDQo+ID4gaW5kZXggMjhmYTZiYTdiNzY3Li40MmJkMGRlMjUxNjcgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jDQo+ID4gQEAgLTIwMzQs
NiArMjAzNCw2MiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgbGdfbHAxMjlxZSA9
IHsNCj4gPiAgCX0sDQo+ID4gIH07DQo+ID4gIA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRp
c3BsYXlfdGltaW5nIGxvZ2ljdGVjaG5vX2x0MTYxMDEwXzJuaF90aW1pbmcNCj4gPiA9IHsNCj4g
PiArCS5waXhlbGNsb2NrID0geyAyNjQwMDAwMCwgMzMzMDAwMDAsIDQ2ODAwMDAwIH0sDQo+ID4g
KwkuaGFjdGl2ZSA9IHsgODAwLCA4MDAsIDgwMCB9LA0KPiA+ICsJLmhmcm9udF9wb3JjaCA9IHsg
MTYsIDIxMCwgMzU0IH0sDQo+ID4gKwkuaGJhY2tfcG9yY2ggPSB7IDQ2LCA0NiwgNDYgfSwNCj4g
PiArCS5oc3luY19sZW4gPSB7IDEsIDIwLCA0MCB9LA0KPiA+ICsJLnZhY3RpdmUgPSB7IDQ4MCwg
NDgwLCA0ODAgfSwNCj4gPiArCS52ZnJvbnRfcG9yY2ggPSB7IDcsIDIyLCAxNDcgfSwNCj4gPiAr
CS52YmFja19wb3JjaCA9IHsgMjMsIDIzLCAyMyB9LA0KPiA+ICsJLnZzeW5jX2xlbiA9IHsgMSwg
MTAsIDIwIH0sDQo+ID4gKwkuZmxhZ3MgPSBESVNQTEFZX0ZMQUdTX0hTWU5DX0xPVyB8IERJU1BM
QVlfRkxBR1NfVlNZTkNfTE9XIHwNCj4gPiArCQkgRElTUExBWV9GTEFHU19ERV9ISUdIIHwgRElT
UExBWV9GTEFHU19QSVhEQVRBX1BPU0VER0UgfA0KPiA+ICsJCSBESVNQTEFZX0ZMQUdTX1NZTkNf
UE9TRURHRSwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxf
ZGVzYyBsb2dpY3RlY2hub19sdDE2MTAxMF8ybmggPSB7DQo+ID4gKwkudGltaW5ncyA9ICZsb2dp
Y3RlY2hub19sdDE2MTAxMF8ybmhfdGltaW5nLA0KPiA+ICsJLm51bV90aW1pbmdzID0gMSwNCj4g
PiArCS5zaXplID0gew0KPiA+ICsJCS53aWR0aCA9IDE1NCwNCj4gPiArCQkuaGVpZ2h0ID0gODYs
DQo+ID4gKwl9LA0KPiA+ICsJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDE4
LA0KPiA+ICsJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwNCj4gPiArCQkgICAg
IERSTV9CVVNfRkxBR19QSVhEQVRBX1NBTVBMRV9ORUdFREdFIHwNCj4gPiArCQkgICAgIERSTV9C
VVNfRkxBR19TWU5DX1NBTVBMRV9ORUdFREdFLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBkaXNwbGF5X3RpbWluZyBsb2dpY3RlY2hub19sdDE3MDQxMF8yd2hjX3Rp
bWluZw0KPiA+ID0gew0KPiA+ICsJLnBpeGVsY2xvY2sgPSB7IDY4OTAwMDAwLCA3MTEwMDAwMCwg
NzM0MDAwMCB9LA0KPiA+ICsJLmhhY3RpdmUgPSB7IDEyODAsIDEyODAsIDEyODAgfSwNCj4gPiAr
CS5oZnJvbnRfcG9yY2ggPSB7IDIzLCA2MCwgNzEgfSwNCj4gPiArCS5oYmFja19wb3JjaCA9IHsg
MjMsIDYwLCA3MSB9LA0KPiA+ICsJLmhzeW5jX2xlbiA9IHsgMTUsIDQwLCA0NyB9LA0KPiA+ICsJ
LnZhY3RpdmUgPSB7IDgwMCwgODAwLCA4MDAgfSwNCj4gPiArCS52ZnJvbnRfcG9yY2ggPSB7IDUs
IDcsIDEwIH0sDQo+ID4gKwkudmJhY2tfcG9yY2ggPSB7IDUsIDcsIDEwIH0sDQo+ID4gKwkudnN5
bmNfbGVuID0geyA2LCA5LCAxMiB9LA0KPiA+ICsJLmZsYWdzID0gRElTUExBWV9GTEFHU19IU1lO
Q19MT1cgfCBESVNQTEFZX0ZMQUdTX1ZTWU5DX0xPVyB8DQo+ID4gKwkJIERJU1BMQVlfRkxBR1Nf
REVfSElHSCB8IERJU1BMQVlfRkxBR1NfUElYREFUQV9QT1NFREdFIHwNCj4gPiArCQkgRElTUExB
WV9GTEFHU19TWU5DX1BPU0VER0UsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IHBhbmVsX2Rlc2MgbG9naWN0ZWNobm9fbHQxNzA0MTBfMndoYyA9IHsNCj4gPiArCS50
aW1pbmdzID0gJmxvZ2ljdGVjaG5vX2x0MTcwNDEwXzJ3aGNfdGltaW5nLA0KPiA+ICsJLm51bV90
aW1pbmdzID0gMSwNCj4gPiArCS5zaXplID0gew0KPiA+ICsJCS53aWR0aCA9IDIxNywNCj4gPiAr
CQkuaGVpZ2h0ID0gMTM2LA0KPiA+ICsJfSwNCj4gPiArCS5idXNfZm9ybWF0ID0gTUVESUFfQlVT
X0ZNVF9SR0I4ODhfMVg3WDRfU1BXRywNCj4gPiArCS5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdf
REVfSElHSCB8DQo+ID4gKwkJICAgICBEUk1fQlVTX0ZMQUdfUElYREFUQV9TQU1QTEVfTkVHRURH
RSB8DQo+ID4gKwkJICAgICBEUk1fQlVTX0ZMQUdfU1lOQ19TQU1QTEVfTkVHRURHRSwNCj4gPiAr
fTsNCj4gPiArDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtaXRz
dWJpc2hpX2FhMDcwbWMwMV9tb2RlID0gew0KPiA+ICAJLmNsb2NrID0gMzA0MDAsDQo+ID4gIAku
aGRpc3BsYXkgPSA4MDAsDQo+ID4gQEAgLTMyNjQsNiArMzMyMCwxNSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZA0KPiA+IHBsYXRmb3JtX29mX21hdGNoW10gPSB7DQo+ID4gIAl9
LCB7DQo+ID4gIAkJLmNvbXBhdGlibGUgPSAibGcsbHAxMjlxZSIsDQo+ID4gIAkJLmRhdGEgPSAm
bGdfbHAxMjlxZSwNCj4gPiArCX0sIHsNCj4gPiArCQkuY29tcGF0aWJsZSA9ICJsb2dpY3RlY2hu
byxsdDE2MTAxMC0ybmhjIiwNCj4gPiArCQkuZGF0YSA9ICZsb2dpY3RlY2hub19sdDE2MTAxMF8y
bmgsDQo+ID4gKwl9LCB7DQo+ID4gKwkJLmNvbXBhdGlibGUgPSAibG9naWN0ZWNobm8sbHQxNjEw
MTAtMm5ociIsDQo+ID4gKwkJLmRhdGEgPSAmbG9naWN0ZWNobm9fbHQxNjEwMTBfMm5oLA0KPiA+
ICsJfSwgew0KPiA+ICsJCS5jb21wYXRpYmxlID0gImxvZ2ljdGVjaG5vLGx0MTcwNDEwLTJ3aGMi
LA0KPiA+ICsJCS5kYXRhID0gJmxvZ2ljdGVjaG5vX2x0MTcwNDEwXzJ3aGMsDQo+IA0KPiBUaGUg
dmVuZG9yIHByZWZpeCB3YXNuJ3QgZG9jdW1lbnRlZCwgYnV0IHRoZSBjb21wYXRpYmxlIHN0cmlu
ZyBhbmQNCj4gcmVzdCANCj4gYWxyZWFkeSBhcmU/DQoNCk1hcmNlbCBhZGRlZCB0aGUgdmVuZG9y
IHByZWZpeCBpbiB0aGUgZmlyc3QgcGF0Y2ggb2YgdGhlIHNlcmllcyBbMV0NCg0KWzFdIGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDE5LzkvMjAvMTI2DQoNClBoaWxpcHBlDQoNCj4gDQo+IFJvYg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
