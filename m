Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E7F6CB2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4416E820;
	Mon, 11 Nov 2019 02:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410109.outbound.protection.outlook.com [40.107.141.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D866F8F3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 09:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwLr2+JwLR42noPA+uGyiLp/bhn54FBfQG2nCU3h4vfThkMSvdeQ/TrnQ0AyqKTNLIVFA9mmJrAnw4y5EvvahifxhtL6+Ja5DyZKA/VwL9gy+ogilaizS+J6ClCRbr3kf8jCaTETgIi5VFi0JXl86fy22gyv9IFzt7X0/EideK5t/lWRRw2Nvb6uApQnBsO2Dr7WbUjpYqo5niG0gVPo8UB0df+OEOYl0C8gyUgOdVHYiH/7AssZdwAV49Yl6EZw9pLHEq8Zeb8JH+0TplAyFwk9Tg6+r7lMxfJuML9rMJU5vR5S8DKg5rA+mQNENBZ7Z98hXtfdc5P9vLkJ8H4zmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5lcJowE77Zfkg1hSRTr8Azgu3SWMlwBAvgA/JeOMOs=;
 b=ZquXWFl5OgA6c57aHctmCTJCvGSHTkVwQY8y5n8ufZVV1tKU3Rdqn5bULKc0QbzhKWlk+HHMfQXmu6smiQuZw2ksEk7I1IQmaKtUm4A/nsgqxrhjZvjF2V0QEQxa9/lBQMlqOMySVCzGFMQyTQjMHLXRIE+uvm03Veo5ZSkFPbJvcBYyA94GU3rNIrntQJ+JmMUmqFDJxtltEI7YsNAx42JOyE+UAeffoFAtRH/7C0XZTGXUnumUxLud4BzZZ0erQeSrmpNJS7lzivpINWjt451VrAt3qt8ZoKqeFgwHqYhspI8byHsrsQV/sXCCaHqakbNYBMvNtjGhGCxKpdg58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.167.146) by
 TYXPR01MB1615.jpnprd01.prod.outlook.com (52.133.167.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 8 Nov 2019 09:51:04 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::91c8:fb22:e4a6:8518]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::91c8:fb22:e4a6:8518%7]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 09:51:04 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 5/7] drm/panel: panel-simple: Add connector type for
 etm0700g0dh6
Thread-Topic: [PATCH v3 5/7] drm/panel: panel-simple: Add connector type for
 etm0700g0dh6
Thread-Index: AQHVlaePEm3wvUZb7Em2Dr1/KfbHL6eALjAAgADVjjA=
Date: Fri, 8 Nov 2019 09:51:04 +0000
Message-ID: <TYXPR01MB1775B15EDC05B551A778B7A1C07B0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107204846.GQ24983@pendragon.ideasonboard.com>
In-Reply-To: <20191107204846.GQ24983@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab39c3b7-2256-470b-ddfe-08d764312b94
x-ms-traffictypediagnostic: TYXPR01MB1615:|TYXPR01MB1615:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB16151EA373305BC96866875CC07B0@TYXPR01MB1615.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(136003)(346002)(366004)(376002)(396003)(199004)(189003)(26005)(71190400001)(14454004)(186003)(9686003)(76176011)(4326008)(6246003)(256004)(66066001)(229853002)(44832011)(478600001)(7696005)(86362001)(102836004)(52536014)(66476007)(8676002)(8936002)(3846002)(7736002)(74316002)(81156014)(66556008)(6506007)(53546011)(71200400001)(316002)(5660300002)(66946007)(66446008)(6916009)(6116002)(25786009)(76116006)(7416002)(55016002)(11346002)(486006)(33656002)(99286004)(305945005)(81166006)(476003)(54906003)(446003)(2906002)(6436002)(64756008)(138113003)(98903001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYXPR01MB1615;
 H:TYXPR01MB1775.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X8nmQyFw1Oyo4QF29CDRWLXpxjD33sX+oVyHATXp9VxMvSH0qTXLdcpYA/Ih9+gIjETOdAPdLTCRY3eqMsiv3wenZtYJHjJlxvo4aHkSh4Rg/SsmhlPskujVOlwnrldmDKigm1+TkPc6Y9jIkEEFC6ksEwzmrAgeC9zbofFUCkpFrxZxlJ65wY8y6FS28AQqJ37Sd+P4JXla/qN0NbBJsGU4bt99FjcOl2lyo2uKjRgTlyhZgqGa64j/OEphqYtqvU2EkLuPC3wczOrhv1FZmsfZIeRjR0eX7g3PkTK73xL4tW9Ggm+of/l5ODfG4cAJvDcuH2VnIC2Www86O2DqZS12oVDABZrZOlAba4mUXYbyH7Gq3dbGz2xB4b4i5O8fPqOYGOe95w45paPGR6N0OIHPVPJZSmxxx8zdscO+ZTfghya80s1E6D5UoMMfWcyb
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab39c3b7-2256-470b-ddfe-08d764312b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 09:51:04.1507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aeEsG8c17c6b8rXjAOy7qNQqZFVcYooapulCz/crtN/QHJKlHta4HsYR6OUvC1e5Fajg/BLrWfTuRJ6aASgHEOSC0/NnkXl+USPHobz6Xug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1615
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5lcJowE77Zfkg1hSRTr8Azgu3SWMlwBAvgA/JeOMOs=;
 b=LSKyo+wdfxc6Q0TuzMkpATbLXjmemK6FDeTiVzNpXEC0bAanIyRv1KIXzNhjBlEHpPbZxtlqyjT/ocJQM3AZSO1vRSdJN7og3S+7MhKkXtl92j4fgGaTj2BUeUgs2eIZdeQgwCjnLpDSbOQWVk0us8WlPzDJuDOxl5Csvc4xqEI=
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

SGkgTGF1cmVudCwNCg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQoNCj4gRnJvbTog
bGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1yZW5lc2FzLXNv
Yy1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBMYXVyZW50IFBpbmNoYXJ0DQo+
IFNlbnQ6IDA3IE5vdmVtYmVyIDIwMTkgMjA6NDkNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA1
LzddIGRybS9wYW5lbDogcGFuZWwtc2ltcGxlOiBBZGQgY29ubmVjdG9yIHR5cGUgZm9yIGV0bTA3
MDBnMGRoNg0KPiANCj4gSGkgRmFicml6aW8sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aC4NCj4gDQo+IE9uIFRodSwgTm92IDA3LCAyMDE5IGF0IDA4OjExOjAxUE0gKzAwMDAsIEZhYnJp
emlvIENhc3RybyB3cm90ZToNCj4gPiBBZGQgY29ubmVjdG9yIHR5cGUgZm9yIHRoZSBldG0wNzAw
ZzBkaDYgZnJvbSBFbWVyZ2luZyBEaXNwbGF5DQo+ID4gVGVjaG5vbG9naWVzIChFRFQpLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAu
cmVuZXNhcy5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gKiBOZXcgcGF0Y2gN
Cj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMSAr
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zaW1wbGUuYw0KPiA+IGluZGV4IDVkNDg3NjguLjgyMDY1ZmYgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jDQo+ID4gQEAgLTEzNDIsNiAr
MTM0Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBlZHRfZXRtMDcwMGcwZGg2
ID0gew0KPiA+ICAJfSwNCj4gPiAgCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I2NjZf
MVgxOCwNCj4gPiAgCS5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNf
RkxBR19QSVhEQVRBX0RSSVZFX05FR0VER0UsDQo+ID4gKwkuY29ubmVjdG9yX3R5cGUgPSBEUk1f
TU9ERV9DT05ORUNUT1JfUEFSQUxMRUwsDQo+IA0KPiBJIHN0aWxsIHRoaW5rIHdlIHNob3VsZCBo
YXZlIGEgRFJNX01PREVfQ09OTkVDVE9SX1BBTkVMLCBidXQgcmVnYXJkbGVzcywNCj4gdGhpcyBw
YW5lbCBzZWVtcyB0byBtYXRjaCBEUk1fTU9ERV9DT05ORUNUT1JfRFBJLg0KDQpUaGFuayB5b3Uh
IEkgd2Fzbid0IHJlYWxseSBzdXJlIGFib3V0IHdoaWNoIGRlZmluaXRpb24gdG8gcGljaywgRFJN
X01PREVfQ09OTkVDVE9SX0RQSQ0Kd2lsbCBzdXJlbHkgd29yayBqdXN0IGZpbmUuDQoNClRoYW5r
cywNCkZhYg0KDQo+IA0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFu
ZWxfZGVzYyBlZHRfZXRtMDcwMGcwYmRoNiA9IHsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0K
PiBMYXVyZW50IFBpbmNoYXJ0DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
