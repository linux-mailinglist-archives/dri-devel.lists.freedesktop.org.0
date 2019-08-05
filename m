Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972CC82CAD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B8D89F3B;
	Tue,  6 Aug 2019 07:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410109.outbound.protection.outlook.com [40.107.141.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA466E2E1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+7OgEKzC1eyh55Oe2oPlmwkZ2WhlqERO8/Gl4pQqZjkpVoMv3hjJwYy/98LRc+EItkfJ86KwWoOR7nmPTqyY2+/E9FHGtBNa92VcTWVBqhboyU1gOMJqoXW7WJL6+66uN/9dh9FVccerBAkV00HTRrNxAktqRD+e6UecGUyb1a7V5FL4oq3BhCrHmmA8MGviUAJbBpXey5eNKXZAE7foaDBm/0lfu+G9vvcIXGqPRDfPZK71VLJt/ChNoUG1mJWkYhb68gGjQuEWe/COXv0k8pL/+y4I4vhCBMG4D1v5PkMrg4eRm67xpiBMF0BPqtT7M64WeqEd3u+SYNZoVvgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PI1VTkq+DknD61W6rTeS0/hKdwPudU6umN6torDcrXY=;
 b=KtXCwCdmYGUtH3VNZecQVrDtgFwgvCGS5dy+1dqeeVaFdxNLG5ju/CQO/YDxvZnWfapYH67MFHz7N3jsSFOhFLS7K1DsUmksSfGap5x9dcWyiy4L2ygFSHGA8ReprKyvK8FdlWG9mKblgE+smm+OpoUE1oDLHAxBEndoFK2PjXz/2PRzv7YzGFKRxUvNrU0lJICHcGZyBQkG/sqsGfhwFozucN8/PrqcHV0Xkc99upLX+5OObtp1poMdovuYNajaJ8iaScZjIc5K5fUHtKLF1DxZHAXQAV4UdnouMqBTRbHqtAjFZjOr0ltzV1UrW5LTTVtdj0C1dvwllllt2tGqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1673.jpnprd01.prod.outlook.com (52.133.162.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 09:04:13 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:04:13 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH/RFC 04/12] dt-bindings: display: Add bindings for
 Advantech IDK-2121WR
Thread-Topic: [PATCH/RFC 04/12] dt-bindings: display: Add bindings for
 Advantech IDK-2121WR
Thread-Index: AQHVSQTHhRQPDdNpvUO4HZ2ir6G+NKbnf4MAgATHjZA=
Date: Mon, 5 Aug 2019 09:04:13 +0000
Message-ID: <TY1PR01MB17704B1C61D4746CA9C58367C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802080332.GE5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802080332.GE5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25d3e4a9-7c0a-468c-0e10-08d71983e2d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1673; 
x-ms-traffictypediagnostic: TY1PR01MB1673:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB167324B676252C449E605277C0DA0@TY1PR01MB1673.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(199004)(189003)(11346002)(3846002)(6116002)(256004)(229853002)(86362001)(7416002)(446003)(6306002)(55016002)(8676002)(68736007)(478600001)(186003)(9686003)(476003)(6246003)(7696005)(99286004)(6916009)(81156014)(66946007)(76116006)(52536014)(6436002)(81166006)(66476007)(66556008)(33656002)(14454004)(7736002)(8936002)(64756008)(102836004)(76176011)(316002)(966005)(71200400001)(71190400001)(66446008)(53936002)(486006)(66066001)(26005)(54906003)(74316002)(2906002)(305945005)(6506007)(4326008)(53546011)(25786009)(44832011)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1673;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /NWfZTCg/XB5+SMowmcy10xGb9T2RPCjBHcuT39CXE3J3/yTsO3rAbHLRzGzO9F8oBreLMkVQran0X4YuU3g13XFVYVsOxSUcTeVGz2XWKA0NMLWyugnY7y+sqPdWMvToGXRE2HLg+QPv+oKveC0fxPErhq7mfIzQRqDWT+klwjyRwbOxrWD4hZPd2aRj2zZMbY5PIjF1fPNhNnV6mZO2heqmmqM2A8+10/KyRXx/5OBLO8Ut01B1uehOU5LrLY49cazhXP9aZPskUq7ncPgAkf3mkgkaD/ehnMo6lCke3srlAEYJlmgo+SI6lF10u1lUtLlpBcWf6BtQAASPC/C+Z+S34RykQGEXFIZWP4E/sTp/7fze/owACepPsS0GtYPiC23CnlOUGGnZugJmWLkrBXnqREaDA1v/3Nz1qh10pc=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d3e4a9-7c0a-468c-0e10-08d71983e2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:04:13.2021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1673
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PI1VTkq+DknD61W6rTeS0/hKdwPudU6umN6torDcrXY=;
 b=g0pAWAl31JIyUggY6PN+VgU0i2lePLGB/2J3lQ6chACq2rsDSPIbP/sJIh6f5kAD3If0aqWf4S5NGETpS57UkPJEkFOIPPcuCGkBkhaGoEJTxnHMLXFlB08WOl9ygqnPFkd+NoWksb+6H5vaRsO5LdwrQxTvJYUDH9dHMHZi7hE=
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
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMDIgQXVndXN0IDIwMTkgMDk6MDQNCj4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDQvMTJd
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQgYmluZGluZ3MgZm9yIEFkdmFudGVjaCBJREstMjEy
MVdSDQo+IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0K
PiANCj4gT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDg6MzQ6MDFBTSArMDEwMCwgRmFicml6aW8g
Q2FzdHJvIHdyb3RlOg0KPiA+IFRoaXMgcGFuZWwgaXMgaGFuZGxlZCB0aHJvdWdoIHRoZSBnZW5l
cmljIGx2ZHMtcGFuZWwgYmluZGluZ3MsDQo+ID4gc28gb25seSBuZWVkcyBpdHMgYWRkaXRpb25h
bCBjb21wYXRpYmxlIHNwZWNpZmllZC4NCj4gPg0KPiA+IFNvbWUgcGFuZWwgc3BlY2lmaWMgZG9j
dW1lbnRhdGlvbiBjYW4gYmUgZm91bmQgaGVyZToNCj4gDQo+IHMvcGFuZWwgc3BlY2lmaWMvcGFu
ZWwtc3BlY2lmaWMvDQoNCldpbGwgY2hhbmdlDQoNCj4gDQo+ID4gaHR0cHM6Ly9idXkuYWR2YW50
ZWNoLmV1L0Rpc3BsYXlzL0VtYmVkZGVkLUxDRC1LaXRzLUhpZ2gtQnJpZ2h0bmVzcy9tb2RlbC1J
REstMjEyMVdSLUsyRkhBMkUuaHRtDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBD
YXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4u
L2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IudHh0ICAgICAgICAgfCA2MiArKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9h
ZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQNCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjcwYjE1YjYNCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IudHh0DQo+ID4gQEAgLTAsMCArMSw2MiBAQA0KPiA+
ICtBZHZhbnRlY2ggQ28uLCBMdGQuIElESy0yMTIxV1IgMjEuNSIgTFZEUyBwYW5lbA0KPiA+ICs9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4g
PiArUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImFk
dmFudGVjaCxpZGstMjEyMXdyIiBmb2xsb3dlZCBieSAicGFuZWwtbHZkcyINCj4gPiArDQo+ID4g
K1RoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIGx2ZHMtcGFuZWwgYmluZGluZywg
d2hpY2ggaXMgc3BlY2lmaWVkDQo+ID4gK2luIHBhbmVsLWx2ZHMudHh0IGluIHRoaXMgZGlyZWN0
b3J5Lg0KPiANCj4gSG93IGFib3V0IGFkZGluZyAiVGhlIHBhbmVsIG9wZXJhdGVzIGluIGR1YWwt
bGluayBtb2RlIGFuZCB0aHVzIHJlcXVpcmVzDQo+IHR3byBwb3J0IG5vZGVzLiIgPw0KDQpZb3Ug
YXJlIHJpZ2h0LCB3aWxsIGFkZC4NCg0KPiANCj4gPiArDQo+ID4gK0V4YW1wbGUNCj4gPiArLS0t
LS0tLQ0KPiA+ICsNCj4gPiArCXBhbmVsIHsNCj4gPiArCQljb21wYXRpYmxlID0gImFkdmFudGVj
aCxpZGstMjEyMXdyIiwgInBhbmVsLWx2ZHMiOw0KPiA+ICsNCj4gPiArCQl3aWR0aC1tbSA9IDw0
NzY+Ow0KPiA+ICsJCWhlaWdodC1tbSA9IDwyNjg+Ow0KPiA+ICsNCj4gPiArCQlkYXRhLW1hcHBp
bmcgPSAidmVzYS0yNCI7DQo+ID4gKw0KPiA+ICsJCXBhbmVsLXRpbWluZyB7DQo+ID4gKwkJCWNs
b2NrLWZyZXF1ZW5jeSA9IDwxNDg1MDAwMDA+Ow0KPiA+ICsJCQloYWN0aXZlID0gPDE5MjA+Ow0K
PiA+ICsJCQl2YWN0aXZlID0gPDEwODA+Ow0KPiA+ICsJCQloc3luYy1sZW4gPSA8NDQ+Ow0KPiA+
ICsJCQloZnJvbnQtcG9yY2ggPSA8ODg+Ow0KPiA+ICsJCQloYmFjay1wb3JjaCA9IDwxNDg+Ow0K
PiA+ICsJCQl2ZnJvbnQtcG9yY2ggPSA8ND47DQo+ID4gKwkJCXZiYWNrLXBvcmNoID0gPDM2PjsN
Cj4gPiArCQkJdnN5bmMtbGVuID0gPDU+Ow0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJCXBvcnRz
IHsNCj4gPiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKwkJCSNzaXplLWNlbGxzID0g
PDA+Ow0KPiA+ICsNCj4gPiArCQkJcG9ydEAwIHsNCj4gPiArCQkJCXJlZyA9IDwwPjsNCj4gPiAr
CQkJCWx2ZHMwX3BhbmVsX2luOiBlbmRwb2ludCB7DQo+ID4gKwkJCQkJcmVtb3RlLWVuZHBvaW50
ID0gPCZsdmRzMF9vdXQ+Ow0KPiA+ICsJCQkJfTsNCj4gPiArCQkJfTsNCj4gPiArDQo+ID4gKwkJ
CXBvcnRAMSB7DQo+ID4gKwkJCQlyZWcgPSA8MT47DQo+ID4gKwkJCQlsdmRzMV9wYW5lbF9pbjog
ZW5kcG9pbnQgew0KPiA+ICsJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczFfb3V0PjsNCj4g
PiArCQkJCX07DQo+ID4gKwkJCX07DQo+ID4gKwkJfTsNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJ
YmFja2xpZ2h0OiBiYWNrbGlnaHQgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdo
dCI7DQo+ID4gKwkJcHdtcyA9IDwmcHdtNSAwIDUwMDAwPjsNCj4gPiArDQo+ID4gKwkJYnJpZ2h0
bmVzcy1sZXZlbHMgPSA8MCA0IDggMTYgMzIgNjQgMTI4IDI1NT47DQo+ID4gKwkJZGVmYXVsdC1i
cmlnaHRuZXNzLWxldmVsID0gPDY+Ow0KPiA+ICsNCj4gPiArCQlwb3dlci1zdXBwbHkgPSA8JnJl
Z18xMnAwdj47DQo+ID4gKwkJZW5hYmxlLWdwaW9zID0gPCZncGlvNiAxMiBHUElPX0FDVElWRV9I
SUdIPjsNCj4gPiArCX07DQo+IA0KPiBJIHRoaW5rIHlvdSBjYW4gZHJvcCB0aGUgYmFja2xpZ2h0
IGhlcmUsIGl0J3MgYSBiaXQgb3V0IG9mIHNjb3BlLg0KDQpBZ3JlZWQuDQoNClRoYW5rcywNCkZh
Yg0KDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
