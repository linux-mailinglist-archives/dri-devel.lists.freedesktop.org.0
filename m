Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB46E103039
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A0D6EA19;
	Tue, 19 Nov 2019 23:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410109.outbound.protection.outlook.com [40.107.141.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490906E51D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 10:35:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkI0z1Ad0Ajn2CUn35JDrQ60i2ByYUPpzYBRlNQmhDSsqqOP6/7m0ehI45uJr68vtkTZhi1Lf6+5qxbXd/fMIvSNSASJhce4tgFPed4NSU9ZsnZyzXOP4xgBo0I2pprSfZDeSwfDCd32GUdneg7XBicECqUOoESTrMCr6oBkWFrrmZNXQoHN1gqQqGMh1vANAOYpwsR9N71Cpt8AyIYja8+TjzJ6QDPpbFHpYcs5OnxPhoDsuI/Uk+55e6FBZHGBWoaczywJERCjTntwlRVUoPWphnO/SENtD0bk0CB/2wxr/nO+LKFB52ZdEL7JD1mbqSfc9hh228sCob/lOF3zzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEqjpzFWztgamXYvRAv2B1FhcZ0aC5X06WR91JV3G/g=;
 b=MF17UqrZjmCvDGgpKdrjbt5Q4+pXKdvkKEq9Kn9U1ipgufYKuJ/JCL7clgN9aFTLVdQBLBW9DeIOAfwEt6ocAvExJBSmL0RnX7Xlbk8sXIRhKuWU6zAQ2aRC4bkJgQQ0c7Eqla8+zVFY6T3IAic00hpZmCyldASSeW+cNhqB1XCKyFR49h6AtDp0jKVbVx21LcjjwTRke6hk6YzznrUrr/m5NtsJ4+fft3+umilRAYWNWWJEakzOZI1wuOdWHwP6B/MAevRaEpgkWshRfwLmxIWPjifORTTaK2GIQ2Ud/KsTx3YIIjp9z8gh9iiZOUX7PAR/h0K7IzgPPoKfSJL/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1627.jpnprd01.prod.outlook.com (52.133.161.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Tue, 19 Nov 2019 10:35:51 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287%7]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 10:35:51 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 08/13] dt-bindings: display: bridge: Repurpose
 lvds-encoder
Thread-Topic: [PATCH v4 08/13] dt-bindings: display: bridge: Repurpose
 lvds-encoder
Thread-Index: AQHVmjpXMK9bdvSq+UGZ9JDacPS6LqeRplAAgACvEIA=
Date: Tue, 19 Nov 2019 10:35:50 +0000
Message-ID: <TY1PR01MB17705936E1CCDDA62624D5E9C04C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-9-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191119000752.GH5171@pendragon.ideasonboard.com>
In-Reply-To: <20191119000752.GH5171@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 18710c23-9b8d-42f1-2361-08d76cdc3f88
x-ms-traffictypediagnostic: TY1PR01MB1627:|TY1PR01MB1627:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB16278937E825F789DD2D18B6C04C0@TY1PR01MB1627.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(189003)(199004)(3846002)(81156014)(476003)(6916009)(81166006)(8676002)(2906002)(7736002)(6116002)(66476007)(66556008)(64756008)(66446008)(9686003)(6306002)(55016002)(316002)(6246003)(6436002)(66066001)(33656002)(5660300002)(229853002)(99286004)(52536014)(54906003)(76176011)(7696005)(8936002)(11346002)(186003)(446003)(102836004)(53546011)(6506007)(26005)(7416002)(305945005)(86362001)(66946007)(256004)(74316002)(76116006)(71200400001)(25786009)(44832011)(486006)(14454004)(71190400001)(478600001)(966005)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1627;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qEp+vpLNZZXm2Kmt7nB50oInrVSCmDpJKdMYjIz6B2298mh3n2LbQu+2AjkJ8QM4IuXmUDYw8eigNnNCEI/O1Mt565mfoQoEbclx0kt7AM6ndjyjW3Rj3Q5N7VuoKpnaYWaj7w2wqCrwhcoGQO7IaQhF1RE9eC2m9Xk0xlUEXDefcS664oc07OCH7Ow+lAzRmHk4PdKzK1gD2g4XGTmqoMYmaX2qf3fo4fKNMSJCFPbktlO++ExeMrii95ngrCrOt9V8nqJK36MY0uYIEyrkZwpMJvDHqo/40t60lUiyb2YhbTsJ+d5mwlxDTLJvW7bSj8a6mgkwcPx4HAfzfX5Z4hgO5jlqkA25DVJ2ZIVDrCC+HTrJSmX7GbjgZ/etGbamSoSuAQBraSfEgEzhsv9qLl+MUKYA5g94FNj9BKYLdkPuqFSqSRd3VTvbvv/pOAFR
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18710c23-9b8d-42f1-2361-08d76cdc3f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 10:35:50.8277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2phQSUoJ5KNY9jC7AoGBcbt6T+HFroEaruR9uRUQS7w7smhHvze8wSMhIfnbjF0TtbD+zlIahnMd9F84HbkEt6eZc/8Z6gZdNI2DvejAsEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1627
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEqjpzFWztgamXYvRAv2B1FhcZ0aC5X06WR91JV3G/g=;
 b=D2Zn0utjbXwtMAK25FlpPzlDMzloGqkQDQwc/YiL9f/6FbeNNffrXieZ/7dQtwYq0MEQqniQ3TLQzRdULBo+oD+N82I6xJ2/ylRwMg6arb8I+cBDDb1HRMAsruc5sYiPuGMDBRZ3g1pi0B48WM2ANMI4ZyzzVSfoi3rEmKpXy8Y=
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

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMTkgTm92ZW1iZXIgMjAxOSAwMDowOA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA4LzEz
XSBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBSZXB1cnBvc2UgbHZkcy1lbmNvZGVyDQo+
IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4g
T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDM6NTE6MjdQTSArMDAwMCwgRmFicml6aW8gQ2FzdHJv
IHdyb3RlOg0KPiA+IEluIGFuIGVmZm9ydCB0byByZXB1cnBvc2UgbHZkcy1lbmNvZGVyLmMgdG8g
YWxzbyBzZXJ2ZSB0aGUNCj4gPiBmdW5jdGlvbiBvZiBMVkRTIGRlY29kZXJzLCB3ZSBlbmRlZCB1
cCBkZWZpbmluZyBhIG5ldyAiZ2VuZXJpYyINCj4gPiBjb21wYXRpYmxlIHN0cmluZyAoImx2ZHMt
ZGVjb2RlciIpLCB0aGVyZWZvcmUgYWRhcHQgdGhlIGR0IHNjaGVtYQ0KPiA+IHRvIGFsbG93IGZv
ciB0aGUgbmV3IGNvbXBhdGlibGUgc3RyaW5nLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiAt
LS0NCj4gPiB2My0+djQ6DQo+ID4gKiBJbXByb3ZlZCB0aXRsZSBhbmQgZGVzY3JpcHRpb24gYWNj
b3JkaW5nIHRvIExhdXJlbnQncyBjb21tZW50cw0KPiA+ICogUmV3b3JrZWQgZGVmaW5pdGlvbiBv
ZiB0aGUgY29tcGF0aWJsZSBwcm9wZXJ0eQ0KPiA+IHYyLT52MzoNCj4gPiAqIEV4dHJhY3RlZCBj
b252ZXJzaW9uIHRvIGx2ZHMtY29kZWMgYXMgcGVyIFJvYidzIGNvbW1lbnQNCj4gPiB2MS0+djI6
DQo+ID4gKiBDb252ZXJ0ZWQgdG8gZHQtc2NoZW1hIGFzIHBlciBOZWlsJ3MgY29tbWVudA0KPiA+
IC0tLQ0KPiA+ICAuLi4ve2x2ZHMtdHJhbnNtaXR0ZXIueWFtbCA9PiBsdmRzLWNvZGVjLnlhbWx9
ICAgICB8IDU0ICsrKysrKysrKysrKysrKysrLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQy
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiA+ICByZW5hbWUgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3tsdmRzLXRyYW5zbWl0dGVyLnlh
bWwgPT4gbHZkcy1jb2RlYy55YW1sfSAoNjElKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0
dGVyLnlhbWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvbHZkcy1jb2RlYy55YW1sDQo+ID4gc2ltaWxhcml0eSBpbmRleCA2MSUNCj4gPiByZW5h
bWUgZnJvbSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
bHZkcy10cmFuc21pdHRlci55YW1sDQo+ID4gcmVuYW1lIHRvIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwNCj4gPiBpbmRleCAy
N2RlNjE2Li4wZWNjOGE0IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnlhbWwNCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1j
b2RlYy55YW1sDQo+ID4gQEAgLTEsMTcgKzEsMTcgQEANCj4gPiAgIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMA0KPiA+ICAlWUFNTCAxLjINCj4gPiAgLS0tDQo+ID4gLSRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRl
ci55YW1sIw0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkv
YnJpZGdlL2x2ZHMtY29kZWMueWFtbCMNCj4gPiAgJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4NCj4gPiAtdGl0bGU6IFBhcmFsbGVsIHRv
IExWRFMgRW5jb2Rlcg0KPiA+ICt0aXRsZTogVHJhbnNwYXJlbnQgTFZEUyBlbmNvZGVycyBhbmQg
ZGVjb2RlcnMNCj4gPg0KPiA+ICBtYWludGFpbmVyczoNCj4gPiAgICAtIExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiA+DQo+ID4g
IGRlc2NyaXB0aW9uOiB8DQo+ID4gLSAgVGhpcyBiaW5kaW5nIHN1cHBvcnRzIHRoZSBwYXJhbGxl
bCB0byBMVkRTIGVuY29kZXJzIHRoYXQgZG9uJ3QgcmVxdWlyZSBhbnkNCj4gPiAtICBjb25maWd1
cmF0aW9uLg0KPiA+ICsgIFRoaXMgYmluZGluZyBzdXBwb3J0cyB0cmFuc3BhcmVudCBMVkRTIGVu
Y29kZXJzIGFuZCBkZWNvZGVycyB0aGF0IGRvbid0DQo+ID4gKyAgcmVxdWlyZSBhbnkgY29uZmln
dXJhdGlvbi4NCj4gPg0KPiA+ICAgIExWRFMgaXMgYSBwaHlzaWNhbCBsYXllciBzcGVjaWZpY2F0
aW9uIGRlZmluZWQgaW4gQU5TSS9USUEvRUlBLTY0NC1BLiBNdWx0aXBsZQ0KPiA+ICAgIGluY29t
cGF0aWJsZSBkYXRhIGxpbmsgbGF5ZXJzIGhhdmUgYmVlbiB1c2VkIG92ZXIgdGltZSB0byB0cmFu
c21pdCBpbWFnZSBkYXRhDQo+ID4gQEAgLTMzLDEyICszMywxNCBAQCBwcm9wZXJ0aWVzOg0KPiA+
ICAgICAgZGVzY3JpcHRpb246IHwNCj4gPiAgICAgICAgTXVzdCBsaXN0IHRoZSBkZXZpY2Ugc3Bl
Y2lmaWMgY29tcGF0aWJsZSBzdHJpbmcgZmlyc3QsIGZvbGxvd2VkIGJ5IHRoZQ0KPiA+ICAgICAg
ICBnZW5lcmljIGNvbXBhdGlibGUgc3RyaW5nLg0KPiA+IC0gICAgaXRlbXM6DQo+ID4gLSAgICAg
IC0gZW51bToNCj4gPiAtICAgICAgICAtIHRpLGRzOTBjMTg1ICAgICAgICMgRm9yIHRoZSBUSSBE
UzkwQzE4NSBGUEQtTGluayBTZXJpYWxpemVyDQo+ID4gLSAgICAgICAgLSB0aSxkczkwYzE4NyAg
ICAgICAjIEZvciB0aGUgVEkgRFM5MEMxODcgRlBELUxpbmsgU2VyaWFsaXplcg0KPiA+IC0gICAg
ICAgIC0gdGksc243NWx2ZHM4MyAgICAgIyBGb3IgdGhlIFRJIFNONzVMVkRTODMgRmxhdExpbmsg
dHJhbnNtaXR0ZXINCj4gPiAtICAgICAgLSBjb25zdDogbHZkcy1lbmNvZGVyICMgR2VuZXJpYyBM
VkRTIGVuY29kZXIgY29tcGF0aWJsZSBmYWxsYmFjaw0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAg
ICAgIC0gaXRlbXM6DQo+ID4gKyAgICAgICAgLSBlbnVtOg0KPiA+ICsgICAgICAgICAgLSB0aSxk
czkwYzE4NSAgICAgICAjIEZvciB0aGUgVEkgRFM5MEMxODUgRlBELUxpbmsgU2VyaWFsaXplcg0K
PiA+ICsgICAgICAgICAgLSB0aSxkczkwYzE4NyAgICAgICAjIEZvciB0aGUgVEkgRFM5MEMxODcg
RlBELUxpbmsgU2VyaWFsaXplcg0KPiA+ICsgICAgICAgICAgLSB0aSxzbjc1bHZkczgzICAgICAj
IEZvciB0aGUgVEkgU043NUxWRFM4MyBGbGF0TGluayB0cmFuc21pdHRlcg0KPiA+ICsgICAgICAg
IC0gY29uc3Q6IGx2ZHMtZW5jb2RlciAjIEdlbmVyaWMgTFZEUyBlbmNvZGVyIGNvbXBhdGlibGUg
ZmFsbGJhY2sNCj4gPiArICAgICAgLSBjb25zdDogbHZkcy1kZWNvZGVyICAgIyBHZW5lcmljIExW
RFMgZGVjb2RlcnMgY29tcGF0aWJsZSBmYWxsYmFjaw0KPiA+DQo+ID4gICAgcG9ydHM6DQo+ID4g
ICAgICB0eXBlOiBvYmplY3QNCj4gPiBAQCAtNDksMTIgKzUxLDE0IEBAIHByb3BlcnRpZXM6DQo+
ID4gICAgICAgIHBvcnRAMDoNCj4gPiAgICAgICAgICB0eXBlOiBvYmplY3QNCj4gPiAgICAgICAg
ICBkZXNjcmlwdGlvbjogfA0KPiA+IC0gICAgICAgICAgUG9ydCAwIGlzIGZvciBwYXJhbGxlbCBp
bnB1dA0KPiA+ICsgICAgICAgICAgV2l0aCBMVkRTIGVuY29kZXJzIHBvcnQgMCBpcyBmb3IgcGFy
YWxsZWwgaW5wdXQNCj4gPiArICAgICAgICAgIFdpdGggTFZEUyBkZWNvZGVycyBwb3J0IDAgaXMg
Zm9yIExWRFMgaW5wdXQNCj4gDQo+IEhvdyBhYm91dA0KPiANCj4gICAgICAgICAgIEZvciBMVkRT
IGVuY29kZXJzLCBwb3J0IDAgaXMgdGhlIHBhcmFsbGVsIGlucHV0DQo+ICAgICAgICAgICBGb3Ig
TFZEUyBkZWNvZGVycywgcG9ydCAwIGlzIHRoZSBMVkRTIGlucHV0DQoNCkl0J3Mgb2sgd2l0aCBt
ZQ0KDQo+IA0KPiA+DQo+ID4gICAgICAgIHBvcnRAMToNCj4gPiAgICAgICAgICB0eXBlOiBvYmpl
Y3QNCj4gPiAgICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+IC0gICAgICAgICAgUG9ydCAxIGlz
IGZvciBMVkRTIG91dHB1dA0KPiA+ICsgICAgICAgICAgV2l0aCBMVkRTIGVuY29kZXJzIHBvcnQg
MSBpcyBmb3IgTFZEUyBvdXRwdXQNCj4gPiArICAgICAgICAgIFdpdGggTFZEUyBkZWNvZGVycyBw
b3J0IDEgaXMgZm9yIHBhcmFsbGVsIG91dHB1dA0KPiANCj4gQW5kIHNpbWlsYXJseSBoZXJlID8N
Cg0KSGVyZSB0b28NCg0KPiANCj4gSWYgeW91J3JlIGZpbmUgd2l0aCB0aGlzIGNoYW5nZSB0aGVy
ZSdzIG5vIG5lZWQgdG8gcmVzdWJtaXQsIEknbGwgY2hhbmdlDQo+IHRoaXMgd2hlbiBhcHBseWlu
ZywgYW5kDQoNClllcyBwbGVhc2UuDQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiBSZXZpZXdlZC1i
eTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0K
PiANCj4gPg0KPiA+ICAgICAgcmVxdWlyZWQ6DQo+ID4gICAgICAgIC0gcG9ydEAwDQo+ID4gQEAg
LTk2LDQgKzEwMCwzMCBAQCBleGFtcGxlczoNCj4gPiAgICAgICAgfTsNCj4gPiAgICAgIH07DQo+
ID4NCj4gPiArICAtIHwNCj4gPiArICAgIGx2ZHMtZGVjb2RlciB7DQo+ID4gKyAgICAgIGNvbXBh
dGlibGUgPSAibHZkcy1kZWNvZGVyIjsNCj4gPiArDQo+ID4gKyAgICAgIHBvcnRzIHsNCj4gPiAr
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9
IDwwPjsNCj4gPiArDQo+ID4gKyAgICAgICAgcG9ydEAwIHsNCj4gPiArICAgICAgICAgIHJlZyA9
IDwwPjsNCj4gPiArDQo+ID4gKyAgICAgICAgICBsdmRzX2RlY19pbjogZW5kcG9pbnQgew0KPiA+
ICsgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRpc3BsYXlfb3V0X2x2ZHM+Ow0KPiA+
ICsgICAgICAgICAgfTsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICBwb3J0
QDEgew0KPiA+ICsgICAgICAgICAgcmVnID0gPDE+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgIGx2
ZHNfZGVjX291dDogZW5kcG9pbnQgew0KPiA+ICsgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQg
PSA8JnJnYl9wYW5lbF9pbj47DQo+ID4gKyAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgIH07DQo+
ID4gKyAgICAgIH07DQo+ID4gKyAgICB9Ow0KPiA+ICsNCj4gPiAgLi4uDQo+IA0KPiAtLQ0KPiBS
ZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
