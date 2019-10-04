Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89500CB56A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EB96EAF3;
	Fri,  4 Oct 2019 07:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DCD6EAB6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 07:09:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VS7IF1hcLGZc6pFp1S+FrQNNZxUNvVRcWPNQyPTCjDS00cBKtSMpwDoAzSnzL6jvN7AWThNSr94nixPETIE4YGfTAGw0yPHR59RIIdkiNNCyA4K1FySCxKjK1fKD6Z2jyOn+cVn5KlYE4zlM9V2Qq27IORbWKBOL4BMRwyTnAf9Dj4k6e5+ke+LzsNjuUrB4vYgouP3y9sMFxi+oZazsTnFS8BAqjMQqdKVk0wm4VHi+z18eGRrJM1ib7taRE+4jvakrfH+WXIpJNfABNAnvjq95HIGI6kzzMO9uVHeq5hdxTR0TEPqrc/aaoT547lVaw9S4KBGyFQBm8OZhDhNZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgv/Ea5BwbUhMrUuHgzDR90WUNFlwThnpgDBifDnCak=;
 b=WTMWP/3DI5FztGEKTdHvXD0NRtrJ2hwdxh7oftC2dLRzkgh0yaOoVBDgu8rLpoEAhPD+cypDIIeNZpCgr22+fiSbq0gv+DyMK49yXunciX0kkpWIWLJ3O42cXIJ6NZiZySNUDczluLzK34asCEkqxjCFFO5Z649Gkm1hwPBeY5tbNwigPJaWLF7HpIFxC7nePM6ytDTUJ2deKDR9r4x1qKVGzfoBL89QPzgWXOQOw8IfJ+jPAti+X/g0joFAlr0Z1H6gGS0umBfCmYsMd5L0gaS8iWutX4PF6KELutmnb2Z7rCRiYHxfVSIzWq+k5b0EN4Uay8h4l5t+IDm+TleckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com (52.134.19.20) by
 VI1PR0502MB3936.eurprd05.prod.outlook.com (52.134.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 07:09:23 +0000
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::f427:26bb:85cf:abad]) by VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::f427:26bb:85cf:abad%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 07:09:22 +0000
From: Philippe Schenker <philippe.schenker@toradex.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v1 2/2] drm/panel: simple: add display timings for logic
 technologies displays
Thread-Topic: [PATCH v1 2/2] drm/panel: simple: add display timings for logic
 technologies displays
Thread-Index: AQHVb4i+AFMG6Tf6HkW/qXEuG4gbDqdGaaaAgADPIICAAe87gIAA/jgA
Date: Fri, 4 Oct 2019 07:09:22 +0000
Message-ID: <f6f7055534e0843eaccd6269f867ef44e4953849.camel@toradex.com>
References: <20190920075411.15735-1-marcel@ziswiler.com>
 <20190920075411.15735-2-marcel@ziswiler.com> <20191001220539.GA16232@bogus>
 <e6fdfd7f46308dbc8fd33d4a2ff0b242ec39a84c.camel@toradex.com>
 <CAL_JsqKmCVP3Fc2sUY=FpM5-HLQ0-=uTf6PEwn0XzyC5BBHBOA@mail.gmail.com>
In-Reply-To: <CAL_JsqKmCVP3Fc2sUY=FpM5-HLQ0-=uTf6PEwn0XzyC5BBHBOA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 078c1e18-08af-47e7-0e1c-08d74899c8a7
x-ms-traffictypediagnostic: VI1PR0502MB3936:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0502MB3936B0B9499BE1ED15A598F7F49E0@VI1PR0502MB3936.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(189003)(199004)(102836004)(76176011)(11346002)(2616005)(446003)(25786009)(2351001)(44832011)(7416002)(256004)(476003)(36756003)(2906002)(118296001)(305945005)(186003)(66066001)(486006)(6436002)(6116002)(71190400001)(71200400001)(26005)(5660300002)(2501003)(7736002)(3846002)(229853002)(6486002)(6512007)(6246003)(5640700003)(99286004)(6306002)(6506007)(66946007)(4326008)(66476007)(53546011)(966005)(54906003)(66556008)(478600001)(66446008)(64756008)(6916009)(8676002)(316002)(76116006)(91956017)(8936002)(1730700003)(81156014)(81166006)(14454004)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB3936;
 H:VI1PR0502MB3965.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N3ImLopR8lVNYSgERirl0N2Xc/L5O40gwmXT10wuV4Fxher7OnnQFjL+RblCLUQDzLHt6Z/oM8EOTTt440dEryfFueeRw+i5xIGt/p0c10lXVwc9pspgAQBV/IIXeRoquJto1rrVvf6LNoe/VSrJ4LlNzRdgHyOuCU69dnsQMySu1WAtnqZWOV4Gor7UH/vnxu5SO4b72vZ/8oFW/OQxCOPTsWQcSEPUNA6LfNO+WNQ7uA9K/8qiWH1sDeu1uYlX0VI2VZG4NxbeLwTb4hi806NLN2nPUeX+zI1JRq+V+p3MT4QbPPsSyx+PGVPfnyyrrRxKc/0qR4UPl2ZVgVSLIJhWPlSuskWXESgpybV2rP6o8eI8Nfrf+PtH4aTQZhTo77C7c6Zl/+3W6xz5fwx5aLBYxfaMeMDv1TRphlHNMP5pVSMHZ/0oTuo2UUwI3KMk
Content-ID: <8219941CBD310146973D8E8CCB36BEC4@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078c1e18-08af-47e7-0e1c-08d74899c8a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 07:09:22.8262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONh1pG9zAZI7JRt/9zJU2YeVinVvVSOoZlT9eMCeHV+G8zYpgx3aPGidC947odzx+JfWUwXon5uCb/3XgWMJWh37l7lv0ze9C0qIZqHi10o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3936
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toradex.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgv/Ea5BwbUhMrUuHgzDR90WUNFlwThnpgDBifDnCak=;
 b=ZNe+YLSAkFIbnnsTv+z0NIo7gbI5GSY+QDOFd0gXhaaiE9DUvJEroik03CKSuJmGitDQ1G9LxdY9LFWaGtZRWNsYQHCPk27ddKuMMzHzTqGDrxatrnbZiPcLqf2QOFOCE4y5T9USoBs1bs62de2vMBYyyWjQVr34p78refYP4/U=
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
 "airlied@linux.ie" <airlied@linux.ie>,
 "j.bauer@endrich.com" <j.bauer@endrich.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "info@logictechno.com" <info@logictechno.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marcel@ziswiler.com" <marcel@ziswiler.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTEwLTAzIGF0IDEwOjU5IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA1OjI3IEFNIFBoaWxpcHBlIFNjaGVua2VyDQo+IDxwaGls
aXBwZS5zY2hlbmtlckB0b3JhZGV4LmNvbT4gd3JvdGU6DQo+ID4gT24gVHVlLCAyMDE5LTEwLTAx
IGF0IDE3OjA1IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiA+IE9uIEZyaSwgU2VwIDIw
LCAyMDE5IGF0IDA5OjU0OjExQU0gKzAyMDAsIE1hcmNlbCBaaXN3aWxlciB3cm90ZToNCj4gPiA+
ID4gRnJvbTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQo+
ID4gPiA+IA0KPiA+ID4gPiBBZGQgZGlzcGxheSB0aW1pbmdzIGZvciB0aGUgZm9sbG93aW5nIDMg
ZGlzcGxheSBwYW5lbHMNCj4gPiA+ID4gbWFudWZhY3R1cmVkDQo+ID4gPiA+IGJ5DQo+ID4gPiA+
IExvZ2ljIFRlY2hub2xvZ2llcyBMaW1pdGVkOg0KPiA+ID4gPiANCj4gPiA+ID4gLSBMVDE2MTAx
MC0yTkhDIGUuZy4gYXMgZm91bmQgaW4gdGhlIFRvcmFkZXggQ2FwYWNpdGl2ZSBUb3VjaA0KPiA+
ID4gPiBEaXNwbGF5DQo+ID4gPiA+ICAgNyIgUGFyYWxsZWwgWzFdDQo+ID4gPiA+IC0gTFQxNjEw
MTAtMk5IUiBlLmcuIGFzIGZvdW5kIGluIHRoZSBUb3JhZGV4IFJlc2lzdGl2ZSBUb3VjaA0KPiA+
ID4gPiBEaXNwbGF5DQo+ID4gPiA+IDciDQo+ID4gPiA+ICAgUGFyYWxsZWwgWzJdDQo+ID4gPiA+
IC0gTFQxNzA0MTAtMldIQyBlLmcuIGFzIGZvdW5kIGluIHRoZSBUb3JhZGV4IENhcGFjaXRpdmUg
VG91Y2gNCj4gPiA+ID4gRGlzcGxheQ0KPiA+ID4gPiAgIDEwLjEiIExWRFMgWzNdDQo+ID4gPiA+
IA0KPiA+ID4gPiBUaG9zZSBwYW5lbHMgbWF5IGFsc28gYmUgZGlzdHJpYnV0ZWQgYnkgRW5kcmlj
aCBCYXVlbGVtZW50ZQ0KPiA+ID4gPiBWZXJ0cmllYnMNCj4gPiA+ID4gR21iSCBbNF0uDQo+ID4g
PiA+IA0KPiA+ID4gPiBbMV0NCj4gPiA+ID4gaHR0cHM6Ly9kb2NzLnRvcmFkZXguY29tLzEwNDQ5
Ny03LWluY2gtcGFyYWxsZWwtY2FwYWNpdGl2ZS10b3VjaC1kaXNwbGF5LTgwMHg0ODAtZGF0YXNo
ZWV0LnBkZg0KPiA+ID4gPiBbMl0NCj4gPiA+ID4gaHR0cHM6Ly9kb2NzLnRvcmFkZXguY29tLzEw
NDQ5OC03LWluY2gtcGFyYWxsZWwtcmVzaXN0aXZlLXRvdWNoLWRpc3BsYXktODAweDQ4MC5wZGYN
Cj4gPiA+ID4gWzNdDQo+ID4gPiA+IGh0dHBzOi8vZG9jcy50b3JhZGV4LmNvbS8xMDU5NTItMTAt
MS1pbmNoLWx2ZHMtY2FwYWNpdGl2ZS10b3VjaC1kaXNwbGF5LTEyODB4ODAwLWRhdGFzaGVldC5w
ZGYNCj4gPiA+ID4gWzRdDQo+ID4gPiA+IGh0dHBzOi8vd3d3LmVuZHJpY2guY29tL2lzaTUwX2lz
aTMwX3RmdC1kaXNwbGF5cy9sdDE3MDQxMC0xd2hjX2lzaTMwDQo+ID4gPiA+IA0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNv
bT4NCj4gPiA+ID4gDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiANCj4gPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDY1DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspDQo+
ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNpbXBsZS5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
DQo+ID4gPiA+IGluZGV4IDI4ZmE2YmE3Yjc2Ny4uNDJiZDBkZTI1MTY3IDEwMDY0NA0KPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMNCj4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jDQo+ID4gPiA+IEBAIC0yMDM0
LDYgKzIwMzQsNjIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGxnX2xwMTI5cWUN
Cj4gPiA+ID4gPSB7DQo+ID4gPiA+ICAgICB9LA0KPiA+ID4gPiAgfTsNCj4gPiA+ID4gDQo+ID4g
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRpc3BsYXlfdGltaW5nDQo+ID4gPiA+IGxvZ2ljdGVj
aG5vX2x0MTYxMDEwXzJuaF90aW1pbmcNCj4gPiA+ID4gPSB7DQo+ID4gPiA+ICsgICAucGl4ZWxj
bG9jayA9IHsgMjY0MDAwMDAsIDMzMzAwMDAwLCA0NjgwMDAwMCB9LA0KPiA+ID4gPiArICAgLmhh
Y3RpdmUgPSB7IDgwMCwgODAwLCA4MDAgfSwNCj4gPiA+ID4gKyAgIC5oZnJvbnRfcG9yY2ggPSB7
IDE2LCAyMTAsIDM1NCB9LA0KPiA+ID4gPiArICAgLmhiYWNrX3BvcmNoID0geyA0NiwgNDYsIDQ2
IH0sDQo+ID4gPiA+ICsgICAuaHN5bmNfbGVuID0geyAxLCAyMCwgNDAgfSwNCj4gPiA+ID4gKyAg
IC52YWN0aXZlID0geyA0ODAsIDQ4MCwgNDgwIH0sDQo+ID4gPiA+ICsgICAudmZyb250X3BvcmNo
ID0geyA3LCAyMiwgMTQ3IH0sDQo+ID4gPiA+ICsgICAudmJhY2tfcG9yY2ggPSB7IDIzLCAyMywg
MjMgfSwNCj4gPiA+ID4gKyAgIC52c3luY19sZW4gPSB7IDEsIDEwLCAyMCB9LA0KPiA+ID4gPiAr
ICAgLmZsYWdzID0gRElTUExBWV9GTEFHU19IU1lOQ19MT1cgfCBESVNQTEFZX0ZMQUdTX1ZTWU5D
X0xPVyB8DQo+ID4gPiA+ICsgICAgICAgICAgICBESVNQTEFZX0ZMQUdTX0RFX0hJR0ggfA0KPiA+
ID4gPiBESVNQTEFZX0ZMQUdTX1BJWERBVEFfUE9TRURHRSB8DQo+ID4gPiA+ICsgICAgICAgICAg
ICBESVNQTEFZX0ZMQUdTX1NZTkNfUE9TRURHRSwNCj4gPiA+ID4gK307DQo+ID4gPiA+ICsNCj4g
PiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBsb2dpY3RlY2hub19sdDE2MTAx
MF8ybmggPSB7DQo+ID4gPiA+ICsgICAudGltaW5ncyA9ICZsb2dpY3RlY2hub19sdDE2MTAxMF8y
bmhfdGltaW5nLA0KPiA+ID4gPiArICAgLm51bV90aW1pbmdzID0gMSwNCj4gPiA+ID4gKyAgIC5z
aXplID0gew0KPiA+ID4gPiArICAgICAgICAgICAud2lkdGggPSAxNTQsDQo+ID4gPiA+ICsgICAg
ICAgICAgIC5oZWlnaHQgPSA4NiwNCj4gPiA+ID4gKyAgIH0sDQo+ID4gPiA+ICsgICAuYnVzX2Zv
cm1hdCA9IE1FRElBX0JVU19GTVRfUkdCNjY2XzFYMTgsDQo+ID4gPiA+ICsgICAuYnVzX2ZsYWdz
ID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfA0KPiA+ID4gPiArICAgICAgICAgICAgICAgIERSTV9C
VVNfRkxBR19QSVhEQVRBX1NBTVBMRV9ORUdFREdFIHwNCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICBEUk1fQlVTX0ZMQUdfU1lOQ19TQU1QTEVfTkVHRURHRSwNCj4gPiA+ID4gK307DQo+ID4gPiA+
ICsNCj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGlzcGxheV90aW1pbmcNCj4gPiA+ID4g
bG9naWN0ZWNobm9fbHQxNzA0MTBfMndoY190aW1pbmcNCj4gPiA+ID4gPSB7DQo+ID4gPiA+ICsg
ICAucGl4ZWxjbG9jayA9IHsgNjg5MDAwMDAsIDcxMTAwMDAwLCA3MzQwMDAwIH0sDQo+ID4gPiA+
ICsgICAuaGFjdGl2ZSA9IHsgMTI4MCwgMTI4MCwgMTI4MCB9LA0KPiA+ID4gPiArICAgLmhmcm9u
dF9wb3JjaCA9IHsgMjMsIDYwLCA3MSB9LA0KPiA+ID4gPiArICAgLmhiYWNrX3BvcmNoID0geyAy
MywgNjAsIDcxIH0sDQo+ID4gPiA+ICsgICAuaHN5bmNfbGVuID0geyAxNSwgNDAsIDQ3IH0sDQo+
ID4gPiA+ICsgICAudmFjdGl2ZSA9IHsgODAwLCA4MDAsIDgwMCB9LA0KPiA+ID4gPiArICAgLnZm
cm9udF9wb3JjaCA9IHsgNSwgNywgMTAgfSwNCj4gPiA+ID4gKyAgIC52YmFja19wb3JjaCA9IHsg
NSwgNywgMTAgfSwNCj4gPiA+ID4gKyAgIC52c3luY19sZW4gPSB7IDYsIDksIDEyIH0sDQo+ID4g
PiA+ICsgICAuZmxhZ3MgPSBESVNQTEFZX0ZMQUdTX0hTWU5DX0xPVyB8IERJU1BMQVlfRkxBR1Nf
VlNZTkNfTE9XIHwNCj4gPiA+ID4gKyAgICAgICAgICAgIERJU1BMQVlfRkxBR1NfREVfSElHSCB8
DQo+ID4gPiA+IERJU1BMQVlfRkxBR1NfUElYREFUQV9QT1NFREdFIHwNCj4gPiA+ID4gKyAgICAg
ICAgICAgIERJU1BMQVlfRkxBR1NfU1lOQ19QT1NFREdFLA0KPiA+ID4gPiArfTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGxvZ2ljdGVjaG5vX2x0
MTcwNDEwXzJ3aGMgPSB7DQo+ID4gPiA+ICsgICAudGltaW5ncyA9ICZsb2dpY3RlY2hub19sdDE3
MDQxMF8yd2hjX3RpbWluZywNCj4gPiA+ID4gKyAgIC5udW1fdGltaW5ncyA9IDEsDQo+ID4gPiA+
ICsgICAuc2l6ZSA9IHsNCj4gPiA+ID4gKyAgICAgICAgICAgLndpZHRoID0gMjE3LA0KPiA+ID4g
PiArICAgICAgICAgICAuaGVpZ2h0ID0gMTM2LA0KPiA+ID4gPiArICAgfSwNCj4gPiA+ID4gKyAg
IC5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRfU1BXRywNCj4gPiA+ID4g
KyAgIC5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8DQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgRFJNX0JVU19GTEFHX1BJWERBVEFfU0FNUExFX05FR0VER0UgfA0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgIERSTV9CVVNfRkxBR19TWU5DX1NBTVBMRV9ORUdFREdFLA0KPiA+ID4g
PiArfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlIG1pdHN1YmlzaGlfYWEwNzBtYzAxX21vZGUNCj4gPiA+ID4gPSB7DQo+ID4gPiA+ICAg
ICAuY2xvY2sgPSAzMDQwMCwNCj4gPiA+ID4gICAgIC5oZGlzcGxheSA9IDgwMCwNCj4gPiA+ID4g
QEAgLTMyNjQsNiArMzMyMCwxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0K
PiA+ID4gPiBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gew0KPiA+ID4gPiAgICAgfSwgew0KPiA+ID4g
PiAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJsZyxscDEyOXFlIiwNCj4gPiA+ID4gICAgICAg
ICAgICAgLmRhdGEgPSAmbGdfbHAxMjlxZSwNCj4gPiA+ID4gKyAgIH0sIHsNCj4gPiA+ID4gKyAg
ICAgICAgICAgLmNvbXBhdGlibGUgPSAibG9naWN0ZWNobm8sbHQxNjEwMTAtMm5oYyIsDQo+ID4g
PiA+ICsgICAgICAgICAgIC5kYXRhID0gJmxvZ2ljdGVjaG5vX2x0MTYxMDEwXzJuaCwNCj4gPiA+
ID4gKyAgIH0sIHsNCj4gPiA+ID4gKyAgICAgICAgICAgLmNvbXBhdGlibGUgPSAibG9naWN0ZWNo
bm8sbHQxNjEwMTAtMm5ociIsDQo+ID4gPiA+ICsgICAgICAgICAgIC5kYXRhID0gJmxvZ2ljdGVj
aG5vX2x0MTYxMDEwXzJuaCwNCj4gPiA+ID4gKyAgIH0sIHsNCj4gPiA+ID4gKyAgICAgICAgICAg
LmNvbXBhdGlibGUgPSAibG9naWN0ZWNobm8sbHQxNzA0MTAtMndoYyIsDQo+ID4gPiA+ICsgICAg
ICAgICAgIC5kYXRhID0gJmxvZ2ljdGVjaG5vX2x0MTcwNDEwXzJ3aGMsDQo+ID4gPiANCj4gPiA+
IFRoZSB2ZW5kb3IgcHJlZml4IHdhc24ndCBkb2N1bWVudGVkLCBidXQgdGhlIGNvbXBhdGlibGUg
c3RyaW5nIGFuZA0KPiA+ID4gcmVzdA0KPiA+ID4gYWxyZWFkeSBhcmU/DQo+ID4gDQo+ID4gTWFy
Y2VsIGFkZGVkIHRoZSB2ZW5kb3IgcHJlZml4IGluIHRoZSBmaXJzdCBwYXRjaCBvZiB0aGUgc2Vy
aWVzIFsxXQ0KPiANCj4gUmlnaHQsIGJ1dCB3aGVyZSdzIHRoZSBwYW5lbCdzIGJpbmRpbmcgZG9j
dW1lbnRhdGlvbiB3aXRoIHRoZSBhYm92ZQ0KPiBjb21wYXRpYmxlIHN0cmluZ3MgZG9jdW1lbnRl
ZD8NCj4gDQoNClRoYXQgb25lIGlzIGluZGVlZCBtaXNzaW5nLCB3ZSB3aWxsIHByb3ZpZGUgdGhh
dCB3ZWVrLiBUaGFua3MgZm9yDQpwb2ludGluZyB0aGlzIG91dCENCg0KUGhpbGlwcGUNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
