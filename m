Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8C9113B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D926E524;
	Sat, 17 Aug 2019 15:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410139.outbound.protection.outlook.com [40.107.141.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F086E9AB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 13:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNMuzlqHQZklgTvubrLgaz75HVGUM+uh2udbEOn+cIYAphw+dr9QRawjbSWT79WpBucpx1Hhhz2BUHuOHxOu2NXvWuYelDhWZr+7i5jlY8751ZouBLBwXqYQvu48pNJYWp9kNBikK8+DaynHjrR15sC3i+TCyv2K8qQPwbn7hJkR2o22fn2AgRlfLafG9qrJEFm+JMhMzucmiaMgV09+1BDulzwpmGYLXhwohTYnu4pAABSp6caxEAdYeppCM82XyTkcudwai0Wexb+XbwR3JFRDK+MjJbiE1qliP6BwbaMEKL+mIzik8+LAGCKJZBxZ/4QgwAQDTTqGYXWAbq6sAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMsa/ND03M2Rda13bghfC3y8VhPof3YVBt12ythMVaY=;
 b=YSEYMqT7LF4l+I9N/YCNRYR82TbwIrnjJ9d5+srvmpTgD8nfveNPgQZE2JyCr0OnAlbnn+k6sYY652/4bbmPs1AMPyqZZo0B1v4K024lo6HlhEwzEjHgf+s9kFGQFLOz1XzWiuMjXv9TUVn2sRayifN/nXF0wcYdYzGzKz6/19KZSzYA1qV/OVjDdmQdMQUql3yQV/W2OfptrM2aAsvm4voWwG8LV9pd4n5SFAiQgOSZcG+FaqF8lUQUYyE1Ighj7Q8OVupgMQNrYwTAwpT5c+NWnS5bcb1dNiQs1gzm/3ij3Af3NX2s+CDvnJLA39fVGGIdwXJOBeZDukfjN5I0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1852.jpnprd01.prod.outlook.com (52.133.164.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Thu, 15 Aug 2019 13:37:38 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 13:37:38 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 1/9] dt-bindings: panel: lvds: Add dual-link LVDS
 display support
Thread-Topic: [PATCH v2 1/9] dt-bindings: panel: lvds: Add dual-link LVDS
 display support
Thread-Index: AQHVU1lFdIlwd432g0qpjiqqiII4lqb8FxyAgAAfOSA=
Date: Thu, 15 Aug 2019 13:37:38 +0000
Message-ID: <TY1PR01MB1770B076A94B922978E54341C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815114515.GH5011@pendragon.ideasonboard.com>
In-Reply-To: <20190815114515.GH5011@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a5f89dc-197a-4ee3-5e31-08d72185bd2d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1852; 
x-ms-traffictypediagnostic: TY1PR01MB1852:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1852DEBCB024A0A342DC1FAEC0AC0@TY1PR01MB1852.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(54906003)(316002)(7416002)(8936002)(25786009)(74316002)(71190400001)(71200400001)(86362001)(478600001)(2906002)(26005)(186003)(66066001)(5660300002)(81156014)(81166006)(7696005)(76176011)(8676002)(64756008)(66446008)(102836004)(66556008)(76116006)(66946007)(66476007)(52536014)(7736002)(14454004)(33656002)(53546011)(6506007)(6436002)(3846002)(6246003)(229853002)(256004)(55016002)(6116002)(53936002)(486006)(446003)(476003)(4326008)(6916009)(11346002)(9686003)(305945005)(99286004)(44832011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1852;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8gbt9ipF3r8FHpxyRjd1SmaWfXYvVM6QkvkZPUi0lwvSsw77L/aeJ9uN7Uw1yzV0FAYoTACRw4S2CujGz59GFLPPWFSGvucfcBbykILNHaojNcK+d7UIJx2wgcW2BcuMq+/wrEFgy2Tw5lIHvDThNenkb3euCrSjcdTHfKVArUWQMFR7aDkD+AfZw4EpvPDtVIK1yGuY3AVnmBa0/p+YoLakrDfqlAorrIIjtFTCcsi79nwJW3MSLcY4SzUcZ7yMVfljg6p55yLGjP7b004U3AjMItBeouRZry/0+c0bzdq9pPnj9gtx0jGo/pcHJGCKBFudf2PF2OQWCtbhZJJxZn+HwA6Wn4jIfO9DCqy8VbZ0bcJTtTaYsvj117lOoHsUzCj+OgcuoHqwC83yKLftyhk6xv0hakPzzKIFclb7eBg=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5f89dc-197a-4ee3-5e31-08d72185bd2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 13:37:38.1170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wID9JiuWqYkTvdArDgBpf2dGRoZ2IhSCQkqHxNSckUnXg7pg2532oBrisS900LMweZUo+wlBTS77pQY86lv0pkcwp8uoVl6UTbXe7A+QUv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1852
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMsa/ND03M2Rda13bghfC3y8VhPof3YVBt12ythMVaY=;
 b=c0TluoxT0e93MUjhXgpjPG0MEcybojxB8FVsXRf18oUl0teb6DOrgoo0KgmnTIlLof/KVpySpEU6AgwyHcAvXLB2ACwqfAeAStGO6u7HGUMwsbfR5eJhBW+vlwdiPv66/obaGz15V/dMa5pKjUW7cnypSRN7+AW+dAEteW7qmvc=
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
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IGxp
bnV4LWtlcm5lbC1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbC1vd25lckB2Z2Vy
Lmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBMYXVyZW50IFBpbmNoYXJ0DQo+IFNlbnQ6IDE1IEF1
Z3VzdCAyMDE5IDEyOjQ1DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS85XSBkdC1iaW5kaW5n
czogcGFuZWw6IGx2ZHM6IEFkZCBkdWFsLWxpbmsgTFZEUyBkaXNwbGF5IHN1cHBvcnQNCj4gDQo+
IEhpIEZhYnJpemlvLA0KPiANCj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6MDQ6MjVQTSAr
MDEwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+IER1YWwtbGluayBMVkRTIGRpc3BsYXlz
IGhhdmUgdHdvIHBvcnRzLCB0aGVyZWZvcmUgZG9jdW1lbnQgdGhpcw0KPiA+IHdpdGggdGhlIGJp
bmRpbmdzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXpp
by5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiB2MS0+djI6DQo+ID4g
KiBSZXdvcmtlZCB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIHBvcnRzIHByb3BlcnR5DQo+ID4gKiBs
dmRzMF9wYW5lbF9pbiBpbiB0aGUgZXhhbXBsZSBoYXMgYmVlbiByZW5hbWVkIHRvIHBhbmVsX2lu
MA0KPiA+ICogbHZkczFfcGFuZWxfaW4gaW4gdGhlIGV4YW1wbGUgaGFzIGJlZW4gcmVuYW1lZCB0
byBwYW5lbF9pbjENCj4gPg0KPiA+IExhdXJlbnQsDQo+ID4NCj4gPiBpbiBsaW51eC1uZXh0IHRo
ZXkgYXJlIG5vdyB3b3JraW5nIHdpdGg6DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbHZkcy55YW1sDQo+IA0KPiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sdmRzLnlhbWwgaXMgaW4NCj4gZHJtLW1pc2Mt
bmV4dCwgc28gSSB3b3VsZCBhZHZpc2UgcmViYXNpbmcgb24gdG9wIG9mIHRoYXQuDQoNCldpbGwg
ZG8uDQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiA+IFdoYXQgc2hvdWxkIEkgZG8gaGVyZT8NCj4g
Pg0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1sdmRzLnR4dCAgICAgICAg
ICB8IDk1ICsrKysrKysrKysrKysrKystLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcxIGlu
c2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWx2ZHMudHh0
DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFu
ZWwtbHZkcy50eHQNCj4gPiBpbmRleCAyNTA4NTBhLi41MjMxMjQzIDEwMDY0NA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWx2
ZHMudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwtbHZkcy50eHQNCj4gPiBAQCAtNDEsNyArNDEsMTIgQEAgUmVxdWlyZWQg
bm9kZXM6DQo+ID4NCj4gPiAgLSBwYW5lbC10aW1pbmc6IFNlZSBwYW5lbC1jb21tb24udHh0Lg0K
PiA+ICAtIHBvcnRzOiBTZWUgcGFuZWwtY29tbW9uLnR4dC4gVGhlc2UgYmluZGluZ3MgcmVxdWly
ZSBhIHNpbmdsZSBwb3J0IHN1Ym5vZGUNCj4gPiAtICBjb3JyZXNwb25kaW5nIHRvIHRoZSBwYW5l
bCBMVkRTIGlucHV0Lg0KPiA+ICsgIChmb3IgYSBzaW5nbGUgbGluayBwYW5lbCkgY29ycmVzcG9u
ZGluZyB0byB0aGUgcGFuZWwgTFZEUyBpbnB1dCwgb3IgdHdvIHBvcnQNCj4gPiArICBzdWJub2Rl
cyAoZm9yIGEgZHVhbCBsaW5rIHBhbmVsKSBjb3JyZXNwb25kaW5nIHRvIHRoZSBwYW5lbCBMVkRT
IGlucHV0cy4NCj4gPiArICBEdWFsLWxpbmsgTFZEUyBwYW5lbHMgZXhwZWN0IGV2ZW4gcGl4ZWxz
ICgwLCAyLCA0LCBldGMuKSBhbmQgb2RkIHBpeGVscyAoMSwgMywNCj4gPiArICA1LCBldGMuKSBv
biBkaWZmZXJlbnQgaW5wdXQgcG9ydHMsIGl0J3MgdXAgdG8gdGhlIHBhbmVsLXNwZWNpZmljIGJp
bmRpbmdzIHRvDQo+ID4gKyAgc3BlY2lmeSB3aGF0IHBvcnQgaXMgZXhwZWN0aW5nIGV2ZW4gcGl4
ZWxzLCBhbmQgd2hhdCBwb3J0IGlzIGV4cGVjdGluZyBvZGQNCj4gPiArICBwaXhlbHMuDQo+ID4N
Cj4gPg0KPiA+ICBMVkRTIGRhdGEgbWFwcGluZ3MgYXJlIGRlZmluZWQgYXMgZm9sbG93cy4NCj4g
PiBAQCAtOTIsMzAgKzk3LDcyIEBAIENUTDM6IDANCj4gPiAgRXhhbXBsZQ0KPiA+ICAtLS0tLS0t
DQo+ID4NCj4gPiAtcGFuZWwgew0KPiA+IC0JY29tcGF0aWJsZSA9ICJtaXRzdWJpc2hpLGFhMTIx
dGQwMSIsICJwYW5lbC1sdmRzIjsNCj4gPiAtDQo+ID4gLQl3aWR0aC1tbSA9IDwyNjE+Ow0KPiA+
IC0JaGVpZ2h0LW1tID0gPDE2Mz47DQo+ID4gLQ0KPiA+IC0JZGF0YS1tYXBwaW5nID0gImplaWRh
LTI0IjsNCj4gPiAtDQo+ID4gLQlwYW5lbC10aW1pbmcgew0KPiA+IC0JCS8qIDEyODB4ODAwIEA2
MEh6ICovDQo+ID4gLQkJY2xvY2stZnJlcXVlbmN5ID0gPDcxMDAwMDAwPjsNCj4gPiAtCQloYWN0
aXZlID0gPDEyODA+Ow0KPiA+IC0JCXZhY3RpdmUgPSA8ODAwPjsNCj4gPiAtCQloc3luYy1sZW4g
PSA8NzA+Ow0KPiA+IC0JCWhmcm9udC1wb3JjaCA9IDwyMD47DQo+ID4gLQkJaGJhY2stcG9yY2gg
PSA8NzA+Ow0KPiA+IC0JCXZzeW5jLWxlbiA9IDw1PjsNCj4gPiAtCQl2ZnJvbnQtcG9yY2ggPSA8
Mz47DQo+ID4gLQkJdmJhY2stcG9yY2ggPSA8MTU+Ow0KPiA+ICtTaW5nbGUgcG9ydDoNCj4gPiAr
CXBhbmVsIHsNCj4gPiArCQljb21wYXRpYmxlID0gIm1pdHN1YmlzaGksYWExMjF0ZDAxIiwgInBh
bmVsLWx2ZHMiOw0KPiA+ICsNCj4gPiArCQl3aWR0aC1tbSA9IDwyNjE+Ow0KPiA+ICsJCWhlaWdo
dC1tbSA9IDwxNjM+Ow0KPiA+ICsNCj4gPiArCQlkYXRhLW1hcHBpbmcgPSAiamVpZGEtMjQiOw0K
PiA+ICsNCj4gPiArCQlwYW5lbC10aW1pbmcgew0KPiA+ICsJCQkvKiAxMjgweDgwMCBANjBIeiAq
Lw0KPiA+ICsJCQljbG9jay1mcmVxdWVuY3kgPSA8NzEwMDAwMDA+Ow0KPiA+ICsJCQloYWN0aXZl
ID0gPDEyODA+Ow0KPiA+ICsJCQl2YWN0aXZlID0gPDgwMD47DQo+ID4gKwkJCWhzeW5jLWxlbiA9
IDw3MD47DQo+ID4gKwkJCWhmcm9udC1wb3JjaCA9IDwyMD47DQo+ID4gKwkJCWhiYWNrLXBvcmNo
ID0gPDcwPjsNCj4gPiArCQkJdnN5bmMtbGVuID0gPDU+Ow0KPiA+ICsJCQl2ZnJvbnQtcG9yY2gg
PSA8Mz47DQo+ID4gKwkJCXZiYWNrLXBvcmNoID0gPDE1PjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4g
PiArCQlwb3J0IHsNCj4gPiArCQkJcGFuZWxfaW46IGVuZHBvaW50IHsNCj4gPiArCQkJCXJlbW90
ZS1lbmRwb2ludCA9IDwmbHZkc19lbmNvZGVyPjsNCj4gPiArCQkJfTsNCj4gPiArCQl9Ow0KPiA+
ICAJfTsNCj4gPg0KPiA+IC0JcG9ydCB7DQo+ID4gLQkJcGFuZWxfaW46IGVuZHBvaW50IHsNCj4g
PiAtCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX2VuY29kZXI+Ow0KPiA+ICtUd28gcG9ydHM6
DQo+ID4gKwlwYW5lbCB7DQo+ID4gKwkJY29tcGF0aWJsZSA9ICJhZHZhbnRlY2gsaWRrLTIxMjF3
ciIsICJwYW5lbC1sdmRzIjsNCj4gPiArDQo+ID4gKwkJd2lkdGgtbW0gPSA8NDc2PjsNCj4gPiAr
CQloZWlnaHQtbW0gPSA8MjY4PjsNCj4gPiArDQo+ID4gKwkJZGF0YS1tYXBwaW5nID0gInZlc2Et
MjQiOw0KPiA+ICsNCj4gPiArCQlwYW5lbC10aW1pbmcgew0KPiA+ICsJCQljbG9jay1mcmVxdWVu
Y3kgPSA8MTQ4NTAwMDAwPjsNCj4gPiArCQkJaGFjdGl2ZSA9IDwxOTIwPjsNCj4gPiArCQkJdmFj
dGl2ZSA9IDwxMDgwPjsNCj4gPiArCQkJaHN5bmMtbGVuID0gPDQ0PjsNCj4gPiArCQkJaGZyb250
LXBvcmNoID0gPDg4PjsNCj4gPiArCQkJaGJhY2stcG9yY2ggPSA8MTQ4PjsNCj4gPiArCQkJdmZy
b250LXBvcmNoID0gPDQ+Ow0KPiA+ICsJCQl2YmFjay1wb3JjaCA9IDwzNj47DQo+ID4gKwkJCXZz
eW5jLWxlbiA9IDw1PjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiArCQlwb3J0cyB7DQo+ID4gKwkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiAr
DQo+ID4gKwkJCXBvcnRAMCB7DQo+ID4gKwkJCQlyZWcgPSA8MD47DQo+ID4gKwkJCQlwYW5lbF9p
bjA6IGVuZHBvaW50IHsNCj4gPiArCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHMwX291dD47
DQo+ID4gKwkJCQl9Ow0KPiA+ICsJCQl9Ow0KPiA+ICsNCj4gPiArCQkJcG9ydEAxIHsNCj4gPiAr
CQkJCXJlZyA9IDwxPjsNCj4gPiArCQkJCXBhbmVsX2luMTogZW5kcG9pbnQgew0KPiA+ICsJCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczFfb3V0PjsNCj4gPiArCQkJCX07DQo+ID4gKwkJCX07
DQo+ID4gIAkJfTsNCj4gPiAgCX07DQo+ID4gLX07DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiAN
Cj4gTGF1cmVudCBQaW5jaGFydA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
