Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C22124159
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10026EA44;
	Wed, 18 Dec 2019 08:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410094.outbound.protection.outlook.com [40.107.141.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24216E143
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 22:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nITcj0jzpXT6eanxsH5kf8iBODxdkEiy80xrpwrXPRjl2lxlKBYprb+Deo2LAcAVwA1hVK+irqdbCDVgj1MZ8rkGoAwOLezMT3dtJOIUu0KU0VN8naT8iXFKJEtL39iC2nTuDNAIbSyoO3lddg2SJ9Xe6yVI+Rs7Mo2WgugTxroI45M6RpHSYX9dgzxpNwZmAdMX3H5I1z1VlQzv3hiCWb23qxzM8vqDjqWkDqsgIcfyH4tflV7+1ndcHiSPoPzlPujZqkjhXYMyTOsw7GEO5iB3gBsSfCQYS+CmOg0zj7AlYtiX4lOowDZcVVNA9dUj67e1l9wIspwELZHtAxonww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7Z1W9Fvu5LZUIkf2pShl94oLIl/WSjvZB3RGEqTt8M=;
 b=kkzdT445aRZI7s6ImmI5nlD+PCbaP5G/MKUENHQcq0ZdcqAHEBZcc4xJogVdc47qFVs1Tv8fO+yR7qka3o1oS+ud4J9UssNhBBP513q+zpydG8Y0TYfglnSLAUoXo82PS6xy6OWx+nZvShdIvmV2rCrVyMjl+culxACKAdCp4VxFIpvsNoYB0rJMkDQ84LT4k59zUFmFYXVjt0VQoLTlsbEIQDpzu82nLR8IVLnU18W8HlDl146Qm4ijxlrQy+J1YZBXr0xNcFl90ox5f4sG92SLuWQwHibxPqf54AjaSK/ex0FEkG5AaOkulkYU85AeuOC1vTyzve1nRAhtMrzYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7Z1W9Fvu5LZUIkf2pShl94oLIl/WSjvZB3RGEqTt8M=;
 b=JhTLHF13RjJdNXHg6Ia5Ms9W7R3RxtMtx5B7S8VdCvLUQZd8JCMSXWLRKxoV6QjTY+xNI1DZ/4bbzzopf9RbbQxoMAyPCV1aXh1BggQ/GYpyx7KQbzcb1wqVkW9Y+r6P4ccBG3qvQHIL9vWUpN1CQh5iX2FW/FmpC0ac2/CX3Mw=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1531.jpnprd01.prod.outlook.com (52.133.163.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 17 Dec 2019 22:06:15 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2559.012; Tue, 17 Dec 2019
 22:06:15 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: RE: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Thread-Topic: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Thread-Index: AQHVmjpQshhfnt50Ik69GSb05e3v8ae4fAYAgAXgh5CAABfsAIAAAEyggAAEpYCAABUQAIAAiR2Q
Date: Tue, 17 Dec 2019 22:06:14 +0000
Message-ID: <TY1PR01MB177059B563B0F29E5A4E424BC0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com>
 <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
 <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
 <20191217135414.GA4741@pendragon.ideasonboard.com>
In-Reply-To: <20191217135414.GA4741@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d2add08f-d9d0-4d39-9b99-08d7833d55d5
x-ms-traffictypediagnostic: TY1PR01MB1531:|TY1PR01MB1531:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1531EF8DE3188054E6BCB814C0500@TY1PR01MB1531.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(199004)(189003)(54906003)(186003)(4326008)(110136005)(26005)(7696005)(55016002)(44832011)(53546011)(9686003)(33656002)(86362001)(7416002)(5660300002)(316002)(6506007)(8936002)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(478600001)(71200400001)(2906002)(8676002)(81156014)(52536014)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1531;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BPlCJu9uI4ppvjscfgLyyjxLOxEJNVUGvyjYZBC+sqmCi/H9hsxCae7REY5N3STt9lCEdKxo5bi0/ju94OUICW3/vDL7JPy5U+dA9+imND4P4kkd1+XCEZZkaBiK+tGze055fklIBMS//xtS747GElBnS0QGHAd8BNYuVdrpscijn0l16a3NxO927Fhu5Rcbwu37EQRJPblx2K7GjWHlWjWF8vTFbX8kAJm9/viiY9tUUuRS69mJUklhw6ShLmrFi8xWBysI/0jRh0Qm3Ae8g3DF05WbGrMf2tElcLtJ0d/4s7W6bhNTeuF2m01md0qB5KaczvEWYGPlu4kSTyHjAOL/iI3JaM+cF3Y8n5/mpGTBvdPWN64LhTgWr9oU/0gJOWd3rk4NFqETZU/jKZX9/tngJkhQ+IlqjWzVkQHl4w6DG584tctISoi7V6g3RMvu
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2add08f-d9d0-4d39-9b99-08d7833d55d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 22:06:14.9332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pCxH7faRhnB5cW4vHJ/P/u+uEL2nWC1M5p0JkJXVz0ggPJSS9lCGTXhuuJ9qNZB/6AvvOvLy75RcI1uIgMQc1ypJVRMHoFITnnTPrpJOcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1531
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZ3V5cywNCg0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IDE3IERlY2VtYmVyIDIwMTkgMTM6NTQNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NCAwNi8xM10gZHJtL2JyaWRnZTogbHZkcy1jb2RlYzogQWRkICJsdmRz
LWRlY29kZXIiIHN1cHBvcnQNCj4gDQo+IEhlbGxvLA0KPiANCj4gT24gVHVlLCBEZWMgMTcsIDIw
MTkgYXQgMDE6Mzg6NTFQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+IE9u
IFR1ZSwgRGVjIDE3LCAyMDE5IGF0IDE6MzEgUE0gRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+
ID4gT24gMTcgRGVjZW1iZXIgMjAxOSAxMjoyMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0K
PiA+ID4+IE9uIFR1ZSwgRGVjIDE3LCAyMDE5IGF0IDEyOjAzIFBNIEZhYnJpemlvIENhc3RybyB3
cm90ZToNCj4gPiA+Pj4gT24gMTMgRGVjZW1iZXIgMjAxOSAxNzoxMSwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToNCj4gPiA+Pj4+IE9uIFdlZCwgTm92IDEzLCAyMDE5IGF0IDAzOjUxOjI1UE0gKzAw
MDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gPiA+Pj4+PiBBZGQgc3VwcG9ydCBmb3IgdHJh
bnNwYXJlbnQgTFZEUyBkZWNvZGVycyBieSBhZGRpbmcgYSBuZXcNCj4gPiA+Pj4+PiBjb21wYXRp
YmxlIHN0cmluZyAoImx2ZHMtZGVjb2RlciIpIHRvIHRoZSBkcml2ZXIuDQo+ID4gPj4+Pj4gVGhp
cyBwYXRjaCBhbHNvIGFkZHMgbWVtYmVyIGNvbm5lY3Rvcl90eXBlIHRvIHN0cnVjdCBsdmRzX2Nv
ZGVjLA0KPiA+ID4+Pj4+IGFuZCB0aGF0J3MgYmVjYXVzZSBMVkRTIGRlY29kZXJzIGhhdmUgYSBk
aWZmZXJlbnQgY29ubmVjdG9yIHR5cGUNCj4gPiA+Pj4+PiBmcm9tIExWRFMgZW5jb2RlcnMuIFdl
IGZpbGwgdGhpcyBuZXcgbWVtYmVyIHVwIHdpdGggdGhlIGRhdGENCj4gPiA+Pj4+PiBtYXRjaGlu
ZyB0aGUgY29tcGF0aWJsZSBzdHJpbmcuDQo+ID4gPj4+Pj4NCj4gPiA+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4g
PiA+Pj4+Pg0KPiA+ID4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2Rl
Yy5jDQo+ID4gPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMN
Cj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+IEBAIC02NSw2ICs2Nyw3IEBAIHN0YXRpYyBpbnQgbHZkc19j
b2RlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4+Pj4+ICAgICBp
ZiAoIWx2ZHNfY29kZWMpDQo+ID4gPj4+Pj4gICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+
ID4gPj4+Pj4NCj4gPiA+Pj4+PiArICAgbHZkc19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAodTMy
KW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsNCj4gPiA+Pj4+DQo+ID4gPj4+
PiBJJ20gbm93IGdldHRpbmcgYSBjb21waWxhdGlvbiBmYWlsdXJlIGhlcmU6DQo+ID4gPj4+Pg0K
PiA+ID4+Pj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmM6IEluIGZ1bmN0aW9u
IOKAmGx2ZHNfY29kZWNfcHJvYmXigJk6DQo+ID4gPj4+PiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2x2ZHMtY29kZWMuYzo2ODozMTogZXJyb3I6IGNhc3QgZnJvbSBwb2ludGVyIHRvIGludGVnZXIg
b2YgZGlmZmVyZW50IHNpemUgWy1XZXJyb3I9cG9pbnRlci10by1pbnQtY2FzdF0NCj4gPiA+Pj4+
ICAgbHZkc19jb2RlYy0+Y29ubmVjdG9yX3R5cGUgPSAodTMyKW9mX2RldmljZV9nZXRfbWF0Y2hf
ZGF0YSgmcGRldi0+ZGV2KTsNCj4gPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gVGhlIGZpeCBzaG91bGQgYmUgc2ltcGxlOg0KPiA+ID4+
Pj4NCj4gPiA+Pj4+ICAgICAgIGx2ZHNfY29kZWMtPmNvbm5lY3Rvcl90eXBlID0gKHVpbnRwdHJf
dClvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gPiA+Pj4+DQo+ID4gPj4+PiBJJ20g
Ym90aGVyZWQgYnkgdGhlIGZhY3QgdGhhdCBJJ3ZlIGNvbXBpbGVkIHRoaXMgYmVmb3JlIHdpdGhv
dXQgYW55DQo+ID4gPj4+PiBpc3N1ZSwgc28gdGhpcyByZWFsbHkgcHV6emxlcyBtZS4gRG8geW91
IGdldCB0aGUgc2FtZSB3YXJuaW5nID8NCj4gPiA+Pj4NCj4gPiA+Pj4gVGhlIHdhcm5pbmcgYXBw
ZWFycyB3aGVuIGNvbXBpbGluZyBmb3IgYXJtNjQsIHVuZGVyc3RhbmRhYmx5IHNvLg0KPiA+ID4+
PiBXZSBtdXN0IGhhdmUgY29tcGlsZWQgdGhpcyBmb3IgYXJtIG9ubHkgdGhlIGZpcnN0IHRpbWUg
YXJvdW5kLg0KPiA+ID4+Pg0KPiA+ID4+PiBJIHRoaW5rIHRoZSByaWdodCB3YXkgdG8gc29sdmUg
dGhpcyBpcyB0byBlaXRoZXIgY2FzdCB0byAodTMyKSh1aW50cHRyX3QpIG9yICh1MzIpKHVuc2ln
bmVkIGxvbmcpLg0KPiA+ID4+DQo+ID4gPj4gSnVzdCBjYXN0aW5nIHRvIHVpbnRwdHJfdCBzaG91
bGQgYmUgc3VmZmljaWVudC4NCj4gPiA+DQo+ID4gPiBJdCBzaG91bGQgYmUgc3VmZmljaWVudCBm
b3IgdGhlIGNvbXBpbGVyLCBidXQgSSBoYXZlIHNlZW4gZXhhbXBsZXMgd2hlcmUgcGVvcGxlDQo+
ID4gPiBwcmVmZXJyZWQgdG8gYmUgZXhwbGljaXQsIGxpa2UgaW46DQo+ID4gPiBkcml2ZXJzL21h
aWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gPiBkcml2ZXJzL2xlZHMvbGVkcy1wbTgwNTgu
Yw0KPiA+ID4NCj4gPiA+IFNpbmNlIHRoZSBrZXJuZWwgaXMgaW5jcmVhc2luZyBpdHMgdGlnaHRu
ZXNzIHdpdGggcmVzcGVjdCB0byB3YXJuaW5ncywgSSBwZXJzb25hbGx5IHByZWZlcg0KPiA+ID4g
KHUzMikodWludHB0cl90KSwgZXZlbiB0aG91Z2ggbm90IHN0cmljdGx5IG5lY2Vzc2FyeSwgYnV0
IEkgYW0gZmluZSB3aXRoICh1aW50cHRyX3QpIGlmIHlvdQ0KPiA+ID4gZG9uJ3QgbGlrZSAodTMy
KSh1aW50cHRyX3QpLg0KPiA+DQo+ID4gSXQgZGVwZW5kcy4gSSB0cnkgdG8gaGF2ZSBhcyBmZXcg
Y2FzdHMgYXMgcG9zc2libGUgKCJjYXN0cyBhcmUgZXZpbCIpLg0KPiA+DQo+ID4gV2hpbGUgYWRk
aW5nIHRoZSBleHRyYSAodTMyKSBjYXN0IG1ha2VzIGl0IGNsZWFyZXIgdGhhdCB0aGUgaW50ZW5k
ZWQNCj4gPiByZXN1bHQgaXMgYSB1MzIgKGZvciBub3cpLCBpdCB3aWxsIGNhdXNlIHNpbGVudCB0
cnVuY2F0aW9uIG9uIDY0LWJpdCBpZg0KPiA+IGNvbm5lY3Rvcl90eXBlIGlzIGV2ZXIgZW5sYXJn
ZWQgdG8gdW5zaWduZWQgbG9uZywgYW5kIGxhcmdlciB2YWx1ZXMgYXJlDQo+ID4gdXNlZC4NCj4g
Pg0KPiA+IEluIHRoaXMgcGFydGljdWxhciBjYXNlIHRoaXMgaXMgdW5saWtlbHksIHRob3VnaCwg
YXMgdW5zaWduZWQgbG9uZyB3b3VsZA0KPiA+IHN0aWxsIGJlIDMyLWJpdCBvbiAzMi1iaXQgcGxh
dGZvcm1zLCBzbyB0aGUgbGFyZ2VyIHZhbHVlcyBjYW5ub3QgYmUNCj4gPiB1c2VkLg0KPiANCj4g
SSBhbHNvIHRyeSB0byBhZGQgYXMgZmV3IGNhc3RzIGFzIHBvc3NpYmxlLCBzbyAodWludHB0cl90
KSB3b3VsZCBiZSBteQ0KPiBwcmVmZXJlbmNlLg0KPiANCj4gRmFicml6aW8sIGNvdWxkIHlvdSBz
dWJtaXQgYSBuZXcgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIHdpdGggdGhlIHByb2JsZW0NCj4gZml4
ZWQgKGFuZCB3aXRoIHRoZSBjYXN0cyB5b3UgZGVjaWRlIHRvIHVzZSwgYnV0IHVzaW5nIHVpbnRw
dHJfdCBpbnN0ZWFkDQo+IG9mIHVuc2lnbmVkIGxvbmcgaW4gYW55IGNhc2UpID8NCg0KV2lsbCBz
ZW5kIGEgbmV3IHZlcnNpb24gdG9tb3Jyb3cgd2l0aCAodWludHB0cl90KQ0KDQpUaGFua3MsDQpG
YWINCg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
