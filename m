Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2991146
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D37F6E52A;
	Sat, 17 Aug 2019 15:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410132.outbound.protection.outlook.com [40.107.141.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0F56E9EF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 15:40:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcwNnjyuhgCPjkecuFpa964JUR6OgjcBPoOWIaM+5kDkF9CHNHsB7QT/RSVrGnnTcoAZSBGuW+/rbTwkI7W29m4MRtxPQZIdVlCbwvWD+fIpYuWGvrJd6jTltDQjwawwAuDuCGV8TwxrpbvxjZfrH55H0BQIX0qsb7N5xkdIira7WpUVfOO9r1owX0UPRigjwXSs/odONHcBQ5xXj3uRfWAg+zQU/R0sZ1HxrHst+tREYXkHZP8BopEWnfOnyL5tz7Jqe3mt/PzOdO/niLPZwvS1U1r/Kism+Eb6Sdozt3h+I6jt5ttLbd4u50nTuL98VJLmivJkGnJGkj1fUt0M6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IkRrFLO/mQrao3GPVzqG1zhbDxsXu4LrqbJ5GcTT+8=;
 b=LO0/MP5wE6zvIPiaKhh4PjGI8nzY8tJPkOBxH58AzO3ZJ/eRLlYMMeRgRDSeKqMQ3wzxlyPotK96f4U/26NSIjsPE7ji9ko97bRm4jgE7yuJbw8I/efyUNf8Y6qrYp/qL4H2LoWi9FG5F4qhhOiyw9zQhGasLfLMf5v5UOO7I3zOxuXWKIsvqLS8pQ+Qt3I2/69bUeZMlHa8oHt22SRBtwm0eUkN4YlHBWLHUGPi6jGcT6CkYKHVg2DUM9+PiWEaG5IfkRlFWpUNz0wqaxjRL7BqkpLPCw3/0lfwC5wgumapHYoIF9QucdJWEjdiI5W+GsGHfWiQ75ee7xIHMJtZgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.168.140) by
 TYXPR01MB1470.jpnprd01.prod.outlook.com (52.133.165.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 15 Aug 2019 15:40:09 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::8432:480c:12c2:d239]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::8432:480c:12c2:d239%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 15:40:09 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 4/9] drm/timings: Add link flags
Thread-Topic: [PATCH v2 4/9] drm/timings: Add link flags
Thread-Index: AQHVU1lOWobC8dS6C0q1OP//wkHPVqb8G0sAgAA9KNA=
Date: Thu, 15 Aug 2019 15:40:09 +0000
Message-ID: <TYXPR01MB1775593360A56D72CAFE5AD4C0AC0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815120014.GK5011@pendragon.ideasonboard.com>
In-Reply-To: <20190815120014.GK5011@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c674b38-2fd4-4890-b4b8-08d72196dab6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:TYXPR01MB1470; 
x-ms-traffictypediagnostic: TYXPR01MB1470:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB147071B4B4BBE938B5ABE181C0AC0@TYXPR01MB1470.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(199004)(189003)(5660300002)(33656002)(14454004)(86362001)(102836004)(316002)(8676002)(99286004)(966005)(8936002)(26005)(76176011)(6916009)(4326008)(9686003)(54906003)(53546011)(6506007)(7416002)(6306002)(55016002)(81156014)(81166006)(486006)(11346002)(74316002)(66066001)(14444005)(53936002)(305945005)(25786009)(476003)(2906002)(446003)(6116002)(76116006)(66556008)(186003)(71200400001)(256004)(7736002)(478600001)(44832011)(7696005)(66476007)(66446008)(64756008)(6436002)(229853002)(6246003)(66946007)(3846002)(52536014)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYXPR01MB1470;
 H:TYXPR01MB1775.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6DcM6J0HfWVNjX/5E/ddfMleT98NwAOePUlAB0XljXOvVagAotw50HwxhlBXblX9/2cmoD6D8s9zgnKctg0ZSpsswiwCj9vVoENxzjB8TorJBGvrug7Gr+Gq18ItKwdvcCYn8pH5Kjq6fi2kw/GvJd7KHxZ4QxYxJYrzfG7K4a3tIqDryyx3SQHugTjBljAMFaKQtCikx/NRVosDjcA/Cvf0jo3Wj7rnY6IfVtbpTfWD0/8DlSMiEG/cftrH8/KKZJMyOw7rx3ievnpwCykhHVvIDGbDf22KxjsV7kpow14xTzaGdpsJTrxLqFxZ8CzCZ1WJieC1wNRP0aOndlQgHZ9uAFIFl85bouNlsaun8jVFoxxGoDxv+eW4XTj2tjS/odw99bbWXLtB70OFJFxaob5OffPegGepZMn5NGawyng=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c674b38-2fd4-4890-b4b8-08d72196dab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 15:40:09.2815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnTp/+rbzQ+S/+ENqNFXQea9FQ15VyWZYtNNAI/Ne8rhfXAdnChGBVuI6DjyB5dYOAgEAjsvjTChneLzxCRSfOB+JL2bwdbrRakw63ybkHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1470
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IkRrFLO/mQrao3GPVzqG1zhbDxsXu4LrqbJ5GcTT+8=;
 b=dPBPLVqUgcwFErLCuqdU+2T2xNxBdu6jYClfpYq/chWBOa9vZCoEqLpV+Pj3G+btpQFtANYfU9QyrrLmfvzVdjFeXDq304mnSnGwb1SQuMdN3Nk6eqp+wGmc2rL33k0vZYc11VcH+FApWIv2qZzxrlLlgQN7EG2/QS7LKnhSJ54=
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2shDQoNCkkgdGhpbmsgd2Ug
bmVlZCB0byBjb21lIGEgY29uY2x1c2lvbiBvbiBoZXJlOg0KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMTA5NTU0Ny8NCg0KYmVmb3JlIHRha2luZyB0aGUgY29tbWVudHMgb24g
dGhpcyBwYXRjaCBhbnkgZnVydGhlci4NCg0KVGhhbmtzLA0KRmFiDQoNCj4gRnJvbTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAx
NSBBdWd1c3QgMjAxOSAxMzowMA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvOV0gZHJtL3Rp
bWluZ3M6IEFkZCBsaW5rIGZsYWdzDQo+IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6MDQ6MjhQ
TSArMDEwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+IFdlIG5lZWQgbW9yZSBpbmZvcm1h
dGlvbiB0byBkZXNjcmliZSBkdWFsLUxWRFMgbGlua3MsIHRoZXJlZm9yZQ0KPiA+IGludHJvZHVj
ZSBsaW5rX2ZsYWdzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxm
YWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiB2MS0+djI6
DQo+ID4gKiBuZXcgcGF0Y2gNCj4gPg0KPiA+ICBpbmNsdWRlL2RybS9kcm1fdGltaW5ncy5oIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fdGltaW5n
cy5oIGIvaW5jbHVkZS9kcm0vZHJtX3RpbWluZ3MuaA0KPiA+IGluZGV4IDRhZjg4MTQuLjU4ZmJm
MWIgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3RpbWluZ3MuaA0KPiA+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV90aW1pbmdzLmgNCj4gPiBAQCAtMSw0ICsxLDYgQEANCj4gPiAgLyoN
Cj4gPiArICogQ29weXJpZ2h0IChDKSAyMDE5IFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycG9yYXRp
b24NCj4gPiArICoNCj4gPiAgICogUGVybWlzc2lvbiB0byB1c2UsIGNvcHksIG1vZGlmeSwgZGlz
dHJpYnV0ZSwgYW5kIHNlbGwgdGhpcyBzb2Z0d2FyZSBhbmQgaXRzDQo+ID4gICAqIGRvY3VtZW50
YXRpb24gZm9yIGFueSBwdXJwb3NlIGlzIGhlcmVieSBncmFudGVkIHdpdGhvdXQgZmVlLCBwcm92
aWRlZCB0aGF0DQo+ID4gICAqIHRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFwcGVhciBpbiBh
bGwgY29waWVzIGFuZCB0aGF0IGJvdGggdGhhdCBjb3B5cmlnaHQNCj4gPiBAQCAtMjEsNiArMjMs
MjQgQEANCj4gPiAgI2lmbmRlZiBfX0RSTV9USU1JTkdTX0hfXw0KPiA+ICAjZGVmaW5lIF9fRFJN
X1RJTUlOR1NfSF9fDQo+ID4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4NCj4gPiArDQo+
ID4gKy8qKg0KPiA+ICsgKiBlbnVtIGRybV9saW5rX2ZsYWdzIC0gbGlua19mbGFncyBmb3IgJmRy
bV90aW1pbmdzDQo+ID4gKyAqDQo+ID4gKyAqIFRoaXMgZW51bSBkZWZpbmVzIHRoZSBkZXRhaWxz
IG9mIHRoZSBsaW5rLg0KPiA+ICsgKg0KPiA+ICsgKiBARFJNX0xJTktfRFVBTF9MVkRTX09ERF9F
VkVOOglEdWFsLUxWRFMgbGluaywgd2l0aCBvZGQgcGl4ZWxzICgxLDMsNSwNCj4gPiArICoJCQkJ
CWV0Yy4pIGNvbWluZyB0aHJvdWdoIHRoZSBmaXJzdCBwb3J0LCBhbmQNCj4gPiArICoJCQkJCWV2
ZW4gcGl4ZWxzICgwLDIsNCxldGMuKSBjb21pbmcgdGhyb3VnaA0KPiA+ICsgKgkJCQkJdGhlIHNl
Y29uZCBwb3J0LiBJZiBub3Qgc3BlY2lmaWVkIGZvciBhDQo+ID4gKyAqCQkJCQlkdWFsLUxWRFMg
cGFuZWwsIGl0IGlzIGFzc3VtZWQgdGhhdCBldmVuDQo+ID4gKyAqCQkJCQlwaXhlbHMgYXJlIGNv
bWluZyB0aHJvdWdoIHRoZSBmaXJzdCBwb3J0DQo+ID4gKyAqLw0KPiA+ICtlbnVtIGRybV9saW5r
X2ZsYWdzIHsNCj4gDQo+IFRoZSB0ZXh0IHdpbGwgYmUgZWFzaWVyIHRvIHJlYWQgaWYgeW91IGlu
bGluZSBpdCBoZXJlLg0KPiANCj4gCS8qKg0KPiAJICogQERSTV9MSU5LX0RVQUxfTFZEU19PRERf
RVZFTjogRHVhbC1MVkRTIGxpbmssIHdpdGggb2RkIHBpeGVscyAoMSwzLDUsDQo+IAkgKiBldGMu
KSBjb21pbmcgdGhyb3VnaCB0aGUgZmlyc3QgcG9ydCwgYW5kICBldmVuIHBpeGVscyAoMCwyLDQs
ZXRjLikNCj4gCSAuLi4NCj4gDQo+ID4gKwlEUk1fTElOS19EVUFMX0xWRFNfT0REX0VWRU4gPSBC
SVQoMCksDQo+IA0KPiBJIHdvdWxkIHJlbW92ZSB0aGUgZHVhbF9saW5rIGZpZWxkIGFuZCBhZGQg
YSBEUk1fTElOS19EVUFMX0xWRFMgKG9yDQo+IGFsdGVybmF0aXZlbHkgdHdvIGZsYWdzLCBkdWFs
IGx2ZHMgb2RkLWV2ZW4gYW5kIGR1YWwgbHZkcyBldmVuLW9kZCkuDQo+IA0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiAgLyoqDQo+ID4gICAqIHN0cnVjdCBkcm1fdGltaW5ncyAtIHRpbWluZyBpbmZvcm1h
dGlvbg0KPiA+ICAgKi8NCj4gPiBAQCAtNTUsNiArNzUsMTIgQEAgc3RydWN0IGRybV90aW1pbmdz
IHsNCj4gPiAgCSAqIGFuZCBvZGQtbnVtYmVyZWQgcGl4ZWxzIGFyZSByZWNlaXZlZCBvbiBzZXBh
cmF0ZSBsaW5rcy4NCj4gPiAgCSAqLw0KPiA+ICAJYm9vbCBkdWFsX2xpbms7DQo+ID4gKwkvKioN
Cj4gPiArCSAqIEBsaW5rX2ZsYWdzDQo+ID4gKwkgKg0KPiA+ICsJICogUHJvdmlkZXMgZGV0YWls
ZWQgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGxpbmsuDQo+IA0KPiBJIHRoaW5rIHRoaXMgY2FsbHMg
Zm9yIGEgYml0IG1vcmUgaW5mb3JtYXRpb24gdGhhbiAiZGV0YWlsZWQNCj4gaW5mb3JtYXRpb24i
LiBXaGF0IGluZm9ybWF0aW9uIGRvIHlvdSB3YW50IHRvIHN0b3JlIGluIHRoaXMgZmllbGQgPw0K
PiANCj4gPiArCSAqLw0KPiA+ICsJZW51bSBkcm1fbGlua19mbGFncyBsaW5rX2ZsYWdzOw0KPiA+
ICB9Ow0KPiA+DQo+ID4gICNlbmRpZiAvKiBfX0RSTV9USU1JTkdTX0hfXyAqLw0KPiA+IC0tDQo+
ID4gMi43LjQNCj4gPg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hh
cnQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
