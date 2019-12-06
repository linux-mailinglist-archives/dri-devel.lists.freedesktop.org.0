Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5DA115436
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 16:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750ED6FA45;
	Fri,  6 Dec 2019 15:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400119.outbound.protection.outlook.com [40.107.140.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C771C6FA31
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 15:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyAboIst5VyCyNeGqmQADl/UnDT6NlhN452anZFNVJhllWOWgX0AUEJ/GOAlTFPQZTys8ZD5Lx+mR+RdOpqvktglxx/WMK2dFyyQpMrzGRhQmJyV5lm2BsBsFcAieLmjgh+Q05oTR3edxA76E0MyIN7UQtC6QR4/OnuGugRSSr1PlzuwYlnX2ONZiKrBXDkdZ2dvLl2oxmdYfIlg1ttslfxi3KOIS8XCOehjr0zVUhJV0oXLKupa/jWgMF9swcgpbR7q0mgsb696pB65uQ3djrGzhwOQAzeXGNksMDepY80yab+mSc+1LUQ6YyByAWUosCqv6FS86PTw3N4Mc1jV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f98c2X4xMpMoKBp9ynGi/A09SXVvCvofYn6D3Nn2rng=;
 b=Ke5msFHhUpFLWjMmSqWLukCl9n8Lp+iDDisCBdMdUrJbILwgRtgNvxZN6R3+oIIUx4mNR9mGIL5Y3jo5VMxrzOIXO/CIgZWHSuLvqJob7i/xmesi0MdkIkevS84jGzNIc8KpFLkZI18+Lc3wHu3tcMOl59JWml7Acu7B7XM2BYopvjkgCGhXKO4/dbb+0n4CBKtDm92g31cwh/A4ryAP5D16UotcdQ6TfYL4m3tStsoqehxRmO2mlKUiiLqKyfeSoB8Zyi31Eci2fZTGcwL2IyS5SRd1oz/+CPIsh4oS9R5Os0AFk8oddEr4nvMBcSYPetCnmf1KFAICwtAN35iwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1546.jpnprd01.prod.outlook.com (52.133.162.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Fri, 6 Dec 2019 15:10:47 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2495.014; Fri, 6 Dec 2019
 15:10:47 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
Thread-Topic: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
Thread-Index: AQHVXc+S57mj9oC72Eeu0P6rCOw/zacSKVsAgJunKjA=
Date: Fri, 6 Dec 2019 15:10:46 +0000
Message-ID: <TY1PR01MB1770295520291BECDC4D4A1BC05F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqKWWCpEeBd4UFaqBVffS-OxUNAHfvtJKcGsLDR+f=Uytg@mail.gmail.com>
In-Reply-To: <CAL_JsqKWWCpEeBd4UFaqBVffS-OxUNAHfvtJKcGsLDR+f=Uytg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6bdd666b-1cf2-4c85-75b1-08d77a5e78ec
x-ms-traffictypediagnostic: TY1PR01MB1546:|TY1PR01MB1546:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1546A11A768CBEBACA6AF522C05F0@TY1PR01MB1546.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(189003)(199004)(4326008)(9686003)(26005)(71190400001)(81166006)(2906002)(55016002)(8676002)(8936002)(966005)(71200400001)(86362001)(478600001)(186003)(7696005)(316002)(74316002)(7416002)(76176011)(33656002)(305945005)(102836004)(66446008)(54906003)(229853002)(76116006)(53546011)(99286004)(5660300002)(66946007)(44832011)(6506007)(52536014)(66476007)(64756008)(81156014)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1546;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZFxjwT4cKZh31ogSXOxEhVCtaRgnYlpXt7Npst04zggoJN+MiP0KFQPMDjh6WyxZtZGybDygSRhORuStnJ2EqH0Pzr0/gCknZrpbS0wysR3ENRLd8C6wrDDc7Lzf/QdaqjTlRiddodT+qtHNgx/GemckpOrgSD6Qk8YVhffSfZU4hUjMCgWosJgNHvOtcV8YjVvl2zr4NC7Y8HhubuW80rNMHk30A4IWcFdEG8F3FZdihC3UJkAjJZIMKRWK5uz4CFmaNTdPTzGP0dwdAq1YshAj/AcuyFh87g4JUfMYWXnUWP+6jrRY4TE8cpF+6hjvhavVpFvH/2FN6UBIFT7gU/8XUZrZaZPyfNffTarjkCKjeokAiQ6XovEQmbmi1WE/qSZVswKDirweHHZyMwBxiitiAZEivwFPgEk0yS6k2UhK5MT+krFyjxHfxXk3NFyMq2Xa1g3A5GeclKXH6lVb7aGPslZEYOcqrl5lnheVr+k=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdd666b-1cf2-4c85-75b1-08d77a5e78ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 15:10:46.5984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5U/UNmq72CHT3/cI6AH5jTYiynNEhdN+KgpbkiqJqkRRhso3k62MNZ/lS6EFvTS3dcYSoAsWhjg6Gw4K27onbHPXPFRnSHg7CxrJXn9wn2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1546
X-Mailman-Approved-At: Fri, 06 Dec 2019 15:27:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f98c2X4xMpMoKBp9ynGi/A09SXVvCvofYn6D3Nn2rng=;
 b=UErJBqt/ziM1+msmdkBN0+Fk2XXaL/FV33amX9+8NN0YaMguL2+e8vRuO8RbA5PNrp9DiYcyUEYM51j53c1cDGcc8NIZQ3kEwkNNCkI0rqqxQ2YKCtiFFIUHsltus4RutLBiEGvIsdE3VAGO0ww39xaHH7ipyBjCNXogjfggOyA=
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQo+IEZyb206IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+DQo+IFNl
bnQ6IDI5IEF1Z3VzdCAyMDE5IDE1OjAzDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS84XSBk
dC1iaW5kaW5nczogZGlzcGxheTogQWRkIGJpbmRpbmdzIGZvciBMVkRTIGJ1cy10aW1pbmdzDQo+
IA0KPiBPbiBXZWQsIEF1ZyAyOCwgMjAxOSBhdCAxOjM2IFBNIEZhYnJpemlvIENhc3Rybw0KPiA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IER1YWwtTFZE
UyBjb25uZWN0aW9ucyBuZWVkIG1hcmtlcnMgaW4gdGhlIERULCB0aGlzIHBhdGNoIGFkZHMNCj4g
PiBzb21lIGNvbW1vbiBkb2N1bWVudGF0aW9uIHRvIGJlIHJlZmVyZW5jZWQgYnkgYm90aCBwYW5l
bHMgYW5kDQo+ID4gYnJpZGdlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENh
c3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gLS0tDQo+ID4g
djItPnYzOg0KPiA+ICogbmV3IHBhdGNoDQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9kaXNw
bGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbCAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnVz
LXRpbWluZ3MvbHZkcy55YW1sDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnVzLXRpbWluZ3MvbHZkcy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnVzLQ0KPiB0aW1pbmdzL2x2ZHMu
eWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMC4uZjM1YjU1
YQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9idXMtdGltaW5ncy9sdmRzLnlhbWwNCj4gPiBAQCAtMCwwICsxLDM4
IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gDQo+IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSBpcyBwcmVmZXJyZWQgZm9yIG5ldyBiaW5kaW5ncy4N
Cj4gDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbCMNCj4gPiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0K
PiA+ICt0aXRsZTogQ29tbW9uIFByb3BlcnRpZXMgZm9yIGJ1cyB0aW1pbmdzIG9mIExWRFMgaW50
ZXJmYWNlcw0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBUaGllcnJ5IFJlZGlu
ZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPg0KPiA+ICsgIC0gRmFicml6aW8gQ2FzdHJvIDxm
YWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjog
fA0KPiA+ICsgIFRoaXMgZG9jdW1lbnQgZGVmaW5lcyBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVzIGNv
bW1vbiB0byBMVkRTIGFuZCBkdWFsLUxWRFMNCj4gPiArICBpbnRlcmZhY2VzLCB3aGVyZSBhIGR1
YWwtTFZEUyBpbnRlcmZhY2UgaXMgYSBkdWFsLWxpbmsgY29ubmVjdGlvbiB3aXRoIGV2ZW4NCj4g
PiArICBwaXhlbHMgdHJhdmVsaW5nIG9uIG9uZSBjb25uZWN0aW9uLCBhbmQgd2l0aCBvZGQgcGl4
ZWxzIHRyYXZlbGluZyBvbiB0aGUgb3RoZXINCj4gPiArICBjb25uZWN0aW9uLg0KPiA+ICsgIFRo
aXMgZG9jdW1lbnQgZG9lc24ndCBjb25zdGl0dWUgYSBkZXZpY2UgdHJlZSBiaW5kaW5nIHNwZWNp
ZmljYXRpb24gYnkgaXRzZWxmDQo+IA0KPiB0eXBvOiBjb25zdGl0dXRlDQo+IA0KPiA+ICsgIGJ1
dCBpcyBtZWFudCB0byBiZSByZWZlcmVuY2VkIGJ5IGRldmljZSB0cmVlIGJpbmRpbmdzLg0KPiA+
ICsgIFdoZW4gcmVmZXJlbmNlZCBmcm9tIHBhbmVsIG9yIGJyaWRnZSBkZXZpY2UgdHJlZSBiaW5k
aW5ncywgdGhlIHByb3BlcnRpZXMNCj4gPiArICBkZWZpbmVkIGluIHRoaXMgZG9jdW1lbnQgYXJl
IGRlZmluZWQgYXMgZm9sbG93cy4gVGhlIHBhbmVsIGFuZCBicmlkZ2UgZGV2aWNlDQo+ID4gKyAg
dHJlZSBiaW5kaW5ncyBhcmUgcmVzcG9uc2libGUgZm9yIGRlZmluaW5nIHdoZXRoZXIgZWFjaCBw
cm9wZXJ0eSBpcyByZXF1aXJlZA0KPiA+ICsgIG9yIG9wdGlvbmFsLg0KPiA+ICsNCj4gPiArcHJv
cGVydGllczoNCj4gPiArICBkdWFsLWx2ZHMtZXZlbi1waXhlbHM6DQo+ID4gKyAgICB0eXBlOiBi
b29sZWFuDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgVGhpcyBwcm9wZXJ0eSBp
cyBzcGVjaWZpYyB0byBhbiBpbnB1dCBwb3J0IG9mIGEgc2luayBkZXZpY2UuIFdoZW4NCj4gDQo+
IFRoZSBzY2hlbWEgc2hvdWxkIGRlZmluZSB3aGF0IG5vZGVzIHRoZXNlIGdvIGluLiBUaGUgZGVz
Y3JpcHRpb24gc2VlbXMNCj4gdG8gaW5kaWNhdGUgaW4gJ3BvcnQnIG5vZGVzIChvciBlbmRwb2lu
dD8pLCBidXQgeW91ciB1c2UgaW4gdGhlIHBhbmVsDQo+IGJpbmRpbmcgcHV0cyB0aGVtIGluIHRo
ZSBwYXJlbnQuDQo+IA0KPiA+ICsgICAgICBzcGVjaWZpZWQsIGl0IG1hcmtzIHRoZSBwb3J0IGFz
IHJlY2lwaWVudCBvZiBldmVuLXBpeGVscy4NCj4gPiArDQo+ID4gKyAgZHVhbC1sdmRzLW9kZC1w
aXhlbHM6DQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4g
PiArICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzcGVjaWZpYyB0byBhbiBpbnB1dCBwb3J0IG9mIGEg
c2luayBkZXZpY2UuIFdoZW4NCj4gPiArICAgICAgc3BlY2lmaWVkLCBpdCBtYXJrcyB0aGUgcG9y
dCBhcyByZWNpcGllbnQgb2Ygb2RkLXBpeGVscy4NCj4gDQo+IEhvd2V2ZXIsIEkgZG9uJ3QgdGhp
bmsgeW91IGV2ZW4gbmVlZCB0aGVzZS4gQSBwYW5lbCdzIHBvcnQgbnVtYmVycyBhcmUNCj4gZml4
ZWQgY2FuIGltcGx5IGV2ZW4gb3Igb2RkLiBGb3IgZXhhbXBsZSBwb3J0QDAgY2FuIGJlIGV2ZW4g
YW5kIHBvcnRAMQ0KPiBjYW4gYmUgb2RkLiBUaGUgcG9ydCBudW1iZXJpbmcgaXMgdHlwaWNhbGx5
IHBhbmVsIHNwZWNpZmljLCBidXQgd2UgbWF5DQo+IGJlIGFibGUgdG8gZGVmaW5lIHRoZSBudW1i
ZXJpbmcgZ2VuZXJpY2FsbHkgaWYgd2UgZG9uJ3QgYWxyZWFkeSBoYXZlDQo+IHBhbmVscyB3aXRo
IG11bHRpcGxlIHBvcnRzLg0KDQpUaGUgcG9ydHMgb24gdGhlIHJlY2VpdmluZyBlbmQgb2YgdGhl
IGxpbmsgY2FuIGJlIGlkZW50aWZpZWQgYnkgYW55IG51bWJlciwNCm5vdCBuZWNlc3NhcmlseSAw
IGFuZCAxLiBTaW5jZSBhdCB0aGlzIHBvaW50IGluIHRpbWUgd2Ugb25seSBoYXZlIDEgdXNlIGNh
c2UNCmZvciB0aGlzIEknbGwgbWVyZ2UgdGhlIGdlbmVyaWMgYW5kIHBhbmVsIHNwZWNpZmljIGR0
LXNjaGVtYXMgdG9nZXRoZXIsIGZvcg0Kc2ltcGxpY2l0eS4NClBlcmhhcHMgd2UgY2FuIHNwbGl0
IHRoZW0gYmFjayBvbmNlIHdlIGhhdmUgYSBzZWNvbmQgdXNlIGNhc2U/DQpJJ2xsIHNlbmQgYSBu
ZXcgcGF0Y2ggc2hvcnRseS4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBoZWxwIGFu
ZCB5b3VyIHBhdGllbmNlIQ0KDQpGYWINCg0KPiANCj4gQWxzbywgYXJlbid0IHRoZXJlIGR1YWwg
bGluayBEU0kgcGFuZWxzPw0KPiANCj4gUm9iDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
