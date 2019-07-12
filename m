Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41BC67A70
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536AC897E8;
	Sat, 13 Jul 2019 14:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00053.outbound.protection.outlook.com [40.107.0.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412446E2ED
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 08:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BX2+lkD6KHguYisdIUo6085OAIUth2ZDwGtqqFSP3m3fpC5shLIOS3OPZJWL5NfKNlNZgmrchO4LB2Ei+6/XuodzxZu9Dof/HQc+TLaWDtmti2ZHIZrcCYKlksdkSi2sm+i3fLsaFZyCRYtIluEKC77WJDSrBbgJNfJSjKbpJVzCs/+MGikJ85uD7CWwE2WRQ62udKeI1aYeqLr4y+EyIoSIG9HVXu3TPPvyyfWp1F4fj1yxfVuS7+XcLDSGvH5AWJSjjmUgisf97Gk6UUE4fClR8FrMcOQHw0QftnbQK0tX2thhemSmiDRnTBXg3AGWzb0n+1mLD+is8Xyi0aKqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+CjbQZ2Hzdk2S495Z+A9qf6opd87+PBdjGIQnqaXWQ=;
 b=M2Fb4z9X55i2/WyzS7DD0qPvQroy8JbjvwyIhRHmvDIUcUJcixMuR4Wljx6ksYLs0QQZ79qniLxmyN/caeaQD2A1QRzP26tybx6R+M7y8onGaBpaeW13IEKHCGfzIUwHejCXslbXZqeduyu9iBnuLmiGegUNavJhMYHTmVv9B9wZk2KnUnVrVI28LEUEdvGhb/hvB5xs8mx58BExOKfGLZbHAqpTu/3DOclVK2SMT9XJ9igmXsIN5AU4v7ZadJ5LJDv9eMPH7vi/feJqJ+CuCPW07JM4JsgcTIRamfSvjB1mt317AtdPHySTs2c3JNElB9N8gIqOvQQYNUZZLHZ8iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
Received: from DB8PR04MB6715.eurprd04.prod.outlook.com (20.179.251.14) by
 DB8PR04MB7033.eurprd04.prod.outlook.com (52.135.62.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 12 Jul 2019 08:15:33 +0000
Received: from DB8PR04MB6715.eurprd04.prod.outlook.com
 ([fe80::5d5c:c0b9:a85a:900f]) by DB8PR04MB6715.eurprd04.prod.outlook.com
 ([fe80::5d5c:c0b9:a85a:900f%5]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 08:15:33 +0000
From: Robert Chiras <robert.chiras@nxp.com>
To: "agx@sigxcpu.org" <agx@sigxcpu.org>
Subject: Re: [EXT] Re: [PATCH 00/10] Improvements and fixes for mxsfb DRM
 driver
Thread-Topic: [EXT] Re: [PATCH 00/10] Improvements and fixes for mxsfb DRM
 driver
Thread-Index: AQHVLCOX39rb+e39GkGlwLk9dRqh9KbFm3mAgAEgMYA=
Date: Fri, 12 Jul 2019 08:15:32 +0000
Message-ID: <1562919331.3209.11.camel@nxp.com>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
 <20190711150403.GB23195@bogon.m.sigxcpu.org>
In-Reply-To: <20190711150403.GB23195@bogon.m.sigxcpu.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e327ed6-8dae-4d3d-328e-08d706a11c72
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB7033; 
x-ms-traffictypediagnostic: DB8PR04MB7033:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DB8PR04MB703361372A86155B436B7A5BE3F20@DB8PR04MB7033.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(199004)(189003)(6436002)(91956017)(2906002)(76116006)(26005)(66946007)(66556008)(64756008)(66476007)(7416002)(44832011)(68736007)(186003)(6512007)(2351001)(229853002)(86362001)(6486002)(5660300002)(5024004)(14444005)(53936002)(66446008)(66574012)(486006)(6306002)(8936002)(5640700003)(256004)(6506007)(76176011)(4326008)(71190400001)(7736002)(476003)(478600001)(316002)(102836004)(66066001)(81166006)(54906003)(966005)(446003)(2501003)(8676002)(11346002)(103116003)(25786009)(45080400002)(1730700003)(99286004)(81156014)(71200400001)(14454004)(2616005)(6246003)(50226002)(305945005)(36756003)(6916009)(3846002)(6116002)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB7033;
 H:DB8PR04MB6715.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nS98uNkjEgLQ5XJqu4trnGfbt/cfhtjuMFQ9eISXlYV7NxxJpGsDIXTzMnQd9y2lJ19LyX8oxkzL1r0c0+2Q9swvAqx/JNj/EAIa9IqXIkzO2GHuU7jv91TcfN83CXo/Vguho63BWuaU9LyHUff4zPxUjwdD2acrmQBx8lM8QgRHM+bheFRQ3JPus4/CpBPX43LdgVU/dNdWL6M2JoYPjwdzHopKPzzJSBTvImVNMxhTCmSEw4zIuWl4YmDFeeFwAz0SPVfc+zuBaQwsIrSHZwge9KwoVEphoCxi6q5MO8hWXJlF6jjHmUk1ly0gPuph89VnXNY1y21VRdIOIuI1J5KqV9GXWflDYSzb+8ebAsFRNTpxstD2dHLbhQosH2obfPcQZn0+YMi+L6MxC34IDo7wGBPa8yyhQd8uQbOKqcU=
Content-ID: <E9B2574B3BBE654EB1C0BABA73DF44AA@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e327ed6-8dae-4d3d-328e-08d706a11c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 08:15:32.9054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: robert.chiras@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+CjbQZ2Hzdk2S495Z+A9qf6opd87+PBdjGIQnqaXWQ=;
 b=ickDPmWdRAAOaDK+9VIPg1SOe5oJf2Y2OuMKRUo+AI4ZXuKcPuFA/11ldmTy3wPJfQ//pMs29woPAxp1SyVkCpw4oeotmLS8SsAS6MByCBZZntEcvwGjKfEiXvANzU+RuYk5ev/ghO1nMfq32l5rpeayAyN+kdprTOtZT9+Qzw4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=robert.chiras@nxp.com; 
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
Cc: "marex@denx.de" <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8sDQoNCk9uIEpvLCAyMDE5LTA3LTExIGF0IDE3OjA0ICswMjAwLCBHdWlkbyBHw7xu
dGhlciB3cm90ZToNCj4gSGkgUm9iZXJ0LA0KPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwNDoz
MjowOFBNICswMzAwLCBSb2JlcnQgQ2hpcmFzIHdyb3RlOg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2gt
c2V0IGltcHJvdmVzIHRoZSB1c2Ugb2YgZUxDRElGIGJsb2NrIG9uIGlNWCA4IFNvQ3MgKGxpa2UN
Cj4gPiA4TVEsIDhNTQ0KPiA+IGFuZCA4UVhQKS4gRm9sbG93aW5nLCBhcmUgdGhlIG5ldyBmZWF0
dXJlcyBhZGRlZCBhbmQgZml4ZXMgZnJvbQ0KPiA+IHRoaXMNCj4gPiBwYXRjaC1zZXQ6DQo+ID4g
DQo+ID4gMS4gQWRkIHN1cHBvcnQgZm9yIGRybV9icmlkZ2UNCj4gPiBPbiA4TVEgYW5kIDhNTSwg
dGhlIExDRElGIGJsb2NrIGlzIG5vdCBkaXJlY3RseSBjb25uZWN0ZWQgdG8gYQ0KPiA+IHBhcmFs
bGVsDQo+ID4gZGlzcGxheSBjb25uZWN0b3IsIHdoZXJlIGFuIExDRCBwYW5lbCBjYW4gYmUgYXR0
YWNoZWQsIGJ1dCBpbnN0ZWFkDQo+ID4gaXQgaXMNCj4gPiBjb25uZWN0ZWQgdG8gRFNJIGNvbnRy
b2xsZXIuIFNpbmNlIHRoaXMgRFNJIHN0YW5kcyBiZXR3ZWVuIHRoZQ0KPiA+IGRpc3BsYXkNCj4g
PiBjb250cm9sbGVyIChlTENESUYpIGFuZCB0aGUgcGh5c2ljYWwgY29ubmVjdG9yLCB0aGUgRFNJ
IGNhbiBiZQ0KPiA+IGltcGxlbWVudGVkDQo+ID4gYXMgYSBEUk0gYnJpZGdlLiBTbywgaW4gb3Jk
ZXIgdG8gYmUgYWJsZSB0byBjb25uZWN0IHRoZSBteHNmYg0KPiA+IGRyaXZlciB0bw0KPiA+IHRo
ZSBEU0kgZHJpdmVyLCB0aGUgc3VwcG9ydCBmb3IgYSBkcm1fYnJpZGdlIHdhcyBuZWVkZWQgaW4g
bXhzZmINCj4gPiBEUk0NCj4gPiBkcml2ZXIgKHRoZSBhY3R1YWwgZHJpdmVyIGZvciB0aGUgZUxD
RElGIGJsb2NrKS4NCj4gU28gSSB3YW50ZWQgdG8gdGVzdCB0aGlzIGJ1dCB3aXRoIGJvdGggbXkg
c29tZXdoYXQgY2xlYW5lZCB1cCBud2wNCj4gZHJpdmVywrkgYW5kIHRoZSBud2wgZHJpdmVyIGZv
cndhcmQgcG9ydGVkIGZyb20gdGhlIG54cCB2ZW5kb3IgdHJlZQ0KPiBJJ20NCj4gbG9va2luZyBh
dCBhIGJsYWNrIHNjcmVlbiB3aXRoIGN1cnJlbnQgbWFpbmxpbmUgLSB3aGlsZSBteSBkY3NzDQo+
IGZvcndhcmQNCj4gcG9ydCBnaXZlcyBtZSBuaWNlIG91dHB1dCBvbiBtaXBpIGRzaS4gRG8geW91
IGhhdmUgYSB0cmVlIHRoYXQgdXNlcw0KPiBtaXBpDQo+IGRzaSBvbiBpbXg4bXEgd2hlcmUgSSBj
b3VsZCBsb29rIGF0IHRvIGNoZWNrIGZvciBkaWZmZXJlbmNlcz8NClNvbWV3aGVyZSBvbiB0aGUg
cGl4ZWwgcGF0aCAoYmV0d2VlbiB0aGUgZGlzcGxheSBjb250cm9sbGVyIGFuZCB0aGUNCkRTSSkg
dGhlcmUgaXMgYSBibG9jayB0aGF0IGludmVydHMgdGhlIHBvbGFyaXR5LiBJIGNhbid0IHJlbWVt
YmVyDQpleGFjdGx5IHdoYXQgd2FzIHRoZSByb2xlIG9mIHRoaXMgYmxvY2ssIGJ1dCB0aGUgcG9s
YXJpdHkgaXMgaW52ZXJ0ZWQNCndoZW4gZUxDRElGIGlzIHVzZWQgaW4gY29tYmluYXRpb24gd2l0
aCB0aGUgRFNJLg0KSWYgeW91IHRha2UgYSBsb29rIGF0IG15IERTSSBkcml2ZXIgZnJvbSBOWFAg
cmVsZWFzZXMgKEkgZ3Vlc3MgeW91IGhhdmUNCnRoZW0pLCB5b3Ugd2lsbCBzZWUgdGhlcmUgaXMg
YSBoYWNrIGluIG1vZGVfZml4dXA6DQoNCnVuc2lnbmVkIGludCAqZmxhZ3MgPSAmbW9kZS0+Zmxh
Z3M7DQppZiAoZHNpLT5zeW5jX3BvbCB7DQoJKmZsYWdzIHw9IERSTV9NT0RFX0ZMQUdfUEhTWU5D
Ow0KCSpmbGFncyB8PSBEUk1fTU9ERV9GTEFHX1BWU1lOQzsNCgkqZmxhZ3MgJj0gfkRSTV9NT0RF
X0ZMQUdfTkhTWU5DOw0KCSpmbGFncyAmPSB+RFJNX01PREVfRkxBR19OVlNZTkM7DQp9IGVsc2Ug
ew0KCSpmbGFncyAmPSB+RFJNX01PREVfRkxBR19QSFNZTkM7DQoJKmZsYWdzICY9IH5EUk1fTU9E
RV9GTEFHX1BWU1lOQzsNCgkqZmxhZ3MgfD0gRFJNX01PREVfRkxBR19OSFNZTkM7DQoJKmZsYWdz
IHw9IERSTV9NT0RFX0ZMQUdfTlZTWU5DOw0KfQ0KDQpJIGtub3cgaXQncyBub3QgY2xlYW4sIGJ1
dCBpdCB3b3JrcyBmb3Igbm93LiBZb3UgY2FuIHRyeSB0aGlzIGluIHlvdXINCmRyaXZlciBhbmQg
c2VlIGlmIGl0IGhlbHBzLg0KVGhlc2UgZGF5cyBJIHdpbGwgYWxzbyB0YWtlIHlvdXIgbndsLWRz
aSBkcml2ZXIgYW5kIHRlc3QgaXQsIGFuZCBhbHNvDQphZGQgc3VwcG9ydCBmb3IgYnJpZGdlIGFu
ZCBlTENESUYgdG8gc2VlIGlmIEkgY2FuIG1ha2UgaXQgd29yay4NCg0KQmVzdCByZWdhcmRzLA0K
Um9iZXJ0DQo+IA0KPiBDaGVlcnMsDQo+IMKgLS0gR3VpZG8NCj4gDQo+ID4gDQo+ID4gDQo+ID4g
Mi4gQWRkIHN1cHBvcnQgZm9yIGFkZGl0aW9uYWwgcGl4ZWwgZm9ybWF0cw0KPiA+IFNvbWUgb2Yg
dGhlIHBpeGVsIGZvcm1hdHMgbmVlZGVkIGJ5IEFuZHJvaWQgd2VyZSBub3QgaW1wbGVtZW50ZWQg
aW4NCj4gPiB0aGlzDQo+ID4gZHJpdmVyLCBidXQgdGhleSB3ZXJlIGFjdHVhbGx5IHN1cHBvcnRl
ZC4gU28sIGFkZCBzdXBwb3J0IGZvciB0aGVtLg0KPiA+IA0KPiA+IDMuIEFkZCBzdXBwb3J0IGZv
ciBob3Jpem9udGFsIHN0cmlkZQ0KPiA+IEhhdmluZyBzdXBwb3J0IGZvciBob3Jpem9udGFsIHN0
cmlkZSBhbGxvd3MgdGhlIHVzZSBvZiBlTENESUYgd2l0aA0KPiA+IGEgR1BVDQo+ID4gKGZvciBl
eGFtcGxlKSB0aGF0IGNhbiBvbmx5IG91dHB1dCByZXNvbHV0aW9uIHNpemVzIG11bHRpcGxlIG9m
IGENCj4gPiBwb3dlciBvZg0KPiA+IDguIEZvciBleGFtcGxlLCAxMDgwIGlzIG5vdCBhIHBvd2Vy
IG9mIDE2LCBzbyBpbiBvcmRlciB0byBzdXBwb3J0DQo+ID4gMTkyMHgxMDgwDQo+ID4gb3V0cHV0
IGZyb20gR1BVcyB0aGF0IGNhbiBwcm9kdWNlIGxpbmVhciBidWZmZXJzIG9ubHkgaW4gc2l6ZXMN
Cj4gPiBtdWx0aXBsZSB0byAxNiwNCj4gPiB0aGlzIGZlYXR1cmUgaXMgbmVlZGVkLg0KPiA+IA0K
PiA+IDMuIEZldyBtaW5vciBmZWF0dXJlcyBhbmQgYnVnLWZpeGluZw0KPiA+IFRoZSBhZGRpdGlv
biBvZiBtYXgtcmVzIERUIHByb3BlcnR5IHdhcyBhY3R1YWxseSBuZWVkZWQgaW4gb3JkZXIgdG8N
Cj4gPiBsaW1pdA0KPiA+IHRoZSBiYW5kd2lkdGggdXNhZ2Ugb2YgdGhlIGVMQ0RJRiBibG9jay4g
VGhpcyBpcyBuZWVkIG9uIHN5c3RlbXMNCj4gPiB3aGVyZQ0KPiA+IG11bHRpcGxlIGRpc3BsYXkg
Y29udHJvbGxlcnMgYXJlIHByZXNlbmQgYW5kIHRoZSBtZW1vcnkgYmFuZHdpZHRoDQo+ID4gaXMg
bm90DQo+ID4gZW5vdWdoIHRvIGhhbmRsZSBhbGwgb2YgdGhlbSBhdCBtYXhpbXVtIGNhcGFjaXR5
IChsaWtlIGl0IGlzIHRoZQ0KPiA+IGNhc2Ugb24NCj4gPiA4TVEsIHdoZXJlIHRoZXJlIGFyZSB0
d28gZGlzcGxheSBjb250cm9sbGVyczogRENTUyBhbmQgZUxDRElGKS4NCj4gPiBUaGUgcmVzdCBv
ZiB0aGUgcGF0Y2hlcyBhcmUgYnVnLWZpeGVzLg0KPiA+IA0KPiA+IE1pcmVsYSBSYWJ1bGVhICgx
KToNCj4gPiDCoCBkcm0vbXhzZmI6IFNpZ25hbCBtb2RlIGNoYW5nZWQgd2hlbiBicHAgY2hhbmdl
ZA0KPiA+IA0KPiA+IFJvYmVydCBDaGlyYXMgKDkpOg0KPiA+IMKgIGRybS9teHNmYjogVXBkYXRl
IG14c2ZiIHRvIHN1cHBvcnQgYSBicmlkZ2UNCj4gPiDCoCBkcm0vbXhzZmI6IFVwZGF0ZSBteHNm
YiB3aXRoIGFkZGl0aW9uYWwgcGl4ZWwgZm9ybWF0cw0KPiA+IMKgIGRybS9teHNmYjogRml4IHRo
ZSB2YmxhbmsgZXZlbnRzDQo+ID4gwqAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IEFkZCBtYXgtcmVz
IHByb3BlcnR5IGZvciBteHNmYg0KPiA+IMKgIGRybS9teHNmYjogQWRkIG1heC1yZXMgcHJvcGVy
dHkgZm9yIE1YU0ZCDQo+ID4gwqAgZHJtL214c2ZiOiBVcGRhdGUgbXhzZmIgdG8gc3VwcG9ydCBM
Q0QgcmVzZXQNCj4gPiDCoCBkcm0vbXhzZmI6IEltcHJvdmUgdGhlIGF4aSBjbG9jayB1c2FnZQ0K
PiA+IMKgIGRybS9teHNmYjogQ2xlYXIgT1VUU1RBTkRJTkdfUkVRUyBiaXRzDQo+ID4gwqAgZHJt
L214c2ZiOiBBZGQgc3VwcG9ydCBmb3IgaG9yaXpvbnRhbCBzdHJpZGUNCj4gPiANCj4gPiDCoC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0wqDCoMKgwqDCoMKgwqDCoMKg
wqB8wqDCoMKgNiArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHwgMjkwDQo+ID4gKysrKysrKysrKysrKysr
KysrLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB8IDE4OQ0KPiA+ICsrKysrKysrKysrLS0tDQo+ID4g
wqBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB8wqDCoDEwICstDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhz
ZmJfb3V0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB8wqDCoDI2ICstDQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfcmVncy5owqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHwgMTI4ICsrKysrKy0tLQ0KPiA+IMKgNiBmaWxlcyBjaGFuZ2VkLCA1
MzEgaW5zZXJ0aW9ucygrKSwgMTE4IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IC0tDQo+ID4gMi43
LjQNCj4gPiANCj4gPiANCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiA+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0DQo+ID4gbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZsaQ0KPiA+IHN0cy5p
bmZyYWRlYWQub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGbGludXgtYXJtLQ0KPiA+IGtlcm5l
bCZhbXA7ZGF0YT0wMiU3QzAxJTdDcm9iZXJ0LmNoaXJhcyU0MG54cC5jb20lN0M3ZGMwMWEwYmRm
OTI0NWINCj4gPiA4ZDg3MDA4ZDcwNjExMDU1YiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVj
MzAxNjM1JTdDMCU3QzAlN0M2MzY5DQo+ID4gODQ1NDI0ODE5MDM0MjUmYW1wO3NkYXRhPXlTSW5P
NkgxQjRrSnRKVXdSczJ1VElVdmUwU1NOWkYwcyUyQnYlMkZEVQ0KPiA+IDBWeTFFJTNEJmFtcDty
ZXNlcnZlZD0wDQo+ID4gDQo+IMK5IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmwNCj4gaXN0cy5mcmVlZGVza3RvcC5vcmcl
MkZhcmNoaXZlcyUyRmRyaS1kZXZlbCUyRjIwMTktDQo+IE1hcmNoJTJGMjA5Njg1Lmh0bWwmYW1w
O2RhdGE9MDIlN0MwMSU3Q3JvYmVydC5jaGlyYXMlNDBueHAuY29tJTdDN2RjMA0KPiAxYTBiZGY5
MjQ1YjhkODcwMDhkNzA2MTEwNTViJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUl
N0MwJTcNCj4gQzAlN0M2MzY5ODQ1NDI0ODE5MTM0MTYmYW1wO3NkYXRhPXVjWURRTGlLN1JhbFJG
JTJCNU1lQjMlMkY3NmNGTEdXYTdDDQo+IG14Q0ZMRWc0V3ZxYyUzRCZhbXA7cmVzZXJ2ZWQ9MApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
