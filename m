Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B016EFE7A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4B76EA57;
	Tue,  5 Nov 2019 13:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410135.outbound.protection.outlook.com [40.107.141.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4C36E95F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5xZNUz8IAAVzorCfoqXcEEzKKI5AazWkedv4OTKgsThnr7PYJSng3so2k6VX9BK5zHZv3t7MHVrHxn967F5SPyZ+tlYMyn6UoWKVGt1Y6HKnpaMFTfA2QiK8CADg+BEEqkJRiFc/ZgsrLrkJ1gN1hljfrci8LLaORTG9VZn3eOSAZmIRxkKA5ZibcryyypzlIZ1AnxF4moJQbfTXnLys48dc762AfmaoZB1tzbAzPW3feV2M5bp4/h/1m4h7jODx0/hJ1KubxUlRgC9Fbkv+0AvAZIEOr1AuSuEnT5TCudc5SC6gD5P0pZRGtk68MIY3ubnl4XQghZ4bFqKrnQlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz8CKRjgeaa065pljQylb3eYWo+lyP88veBDhvIfE2Y=;
 b=divaMeLLHYFKWLGXwQ0rgCz+1sH0+8V72r79gzxfMYVQutWjOW2O4L3S/bc3PHNjr9ic9McV/AuxRBZHdY4msAtfYGKKgjJkWavj+ABjm0wN3Iyp9SosvJbEuVEAaBCe1Pf5iC8eni5gPg5tST8t7Ke1J8jqCYzdsagTDbOa19yqevdep93GFbKLg/oUb4L+Adti5C6A5HImXvVb488DTBvh/uOWrKOyT/p9gxGYtQJle3ZV3X1TvauyRTSQFUdkBCvSHUabwv4Kub9r62Gc5wOgnlGnUoSMaVJQ+drCHQdUTrplW56vLeQxmuxe/pha3AuqcJe9q/mtl0wyZo6B3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1689.jpnprd01.prod.outlook.com (52.133.163.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 09:33:28 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287%7]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 09:33:28 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v2 2/4] dt-bindings: display: bridge: Repurpose
 lvds-encoder
Thread-Topic: [PATCH v2 2/4] dt-bindings: display: bridge: Repurpose
 lvds-encoder
Thread-Index: AQHVkzESR2xpe9fL00q33GVpoGbh06d7hZaAgADCn0A=
Date: Tue, 5 Nov 2019 09:33:28 +0000
Message-ID: <TY1PR01MB1770F97A73768451B2ED8A22C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572886683-4919-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqJ+xus0GDWb0Px6HKDBzOt1yjwCCkQrfMspubwG+LZOdQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJ+xus0GDWb0Px6HKDBzOt1yjwCCkQrfMspubwG+LZOdQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6235153f-2024-4835-728c-08d761d336ec
x-ms-traffictypediagnostic: TY1PR01MB1689:|TY1PR01MB1689:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1689CDB3DDF0003426E25950C07E0@TY1PR01MB1689.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(199004)(189003)(76116006)(52536014)(71200400001)(2906002)(7736002)(66946007)(66066001)(6436002)(25786009)(44832011)(229853002)(5660300002)(256004)(14444005)(476003)(71190400001)(7416002)(66446008)(66476007)(81156014)(6306002)(8676002)(8936002)(966005)(446003)(64756008)(66556008)(11346002)(55016002)(81166006)(3846002)(6116002)(4326008)(33656002)(305945005)(86362001)(7696005)(76176011)(6246003)(486006)(99286004)(14454004)(478600001)(186003)(316002)(102836004)(6506007)(53546011)(74316002)(9686003)(26005)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1689;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oz5n339Zcd3dNkKPoyJF3k2XBAj7QbyFYQ5hfaS+WwzYkGYU0ZsOXoN+s6RPA+3qfz7VYYYJcHJG7rwrwuYtntp4WBa5rQP8tvJqsWa7kWJbz//CpeVO/uCjMOkQhk71lARgm8bm8V4U/tMagFCdF6jIAN1o4m9F9tY2vPKWtWS59gpgncmlJgcdVsb9B/YCCLaFxX1P99kAGnvv/BM+eTVWLJ/vTUt1ZPODUEW9I3Ta+ACThHWe7RKs+W63wuPN0mLX3wuTRRSbl++0ryI8Ix+uy5eg/L5/CIKnsOPL32kWB4PV37r5mq0eRI8gMGxDgOK+Na7V6BjE4tWVHIlL7rs/vwOZrfZTNO2eWlFbcECZ2yyiFTGXWuAwYzSd3ODEiApBrDn4Il6rQogMk2Gx1S5YEz0/4B8pw+kMqVe36pl92AEYcy39yWfCfYn+x9uelIPRhBkrHbcgCNj2LxN7Yi1lgVYXfV730hmGktn0VCk=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6235153f-2024-4835-728c-08d761d336ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 09:33:28.1974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2p2GdhY5FS0YFd/pjo1HgE3pRLi1F9hflsEZGLbcq5y4XSvmnEV31ty8Ug3ADMhKv0J1t4JAwZ/4NIbT8932PtmfG6c2lTsTxAVwaRORQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1689
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:29:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz8CKRjgeaa065pljQylb3eYWo+lyP88veBDhvIfE2Y=;
 b=TpwfmbMssMjIKnTFcyfLd2+R6d+tEO4qOU0yHF/5WiCrGs8KdNjesSDmA6sB0A50bk5rTdDddVEgPRsJ0mqVAVcycb0lK1d+qfj1yutIZvsgxUF/0AIQ5Z0Ms81f3reHQ6FCoM3ykA+EvkTrURhPXZ0qHxMDrqCqwSPPHzokmjQ=
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>, "open list:MEDIA
 DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gUm9iLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQoNCj4gRnJvbTogUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gU2VudDogMDQgTm92ZW1iZXIgMjAxOSAy
MToyMw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvNF0gZHQtYmluZGluZ3M6IGRpc3BsYXk6
IGJyaWRnZTogUmVwdXJwb3NlIGx2ZHMtZW5jb2Rlcg0KPiANCj4gT24gTW9uLCBOb3YgNCwgMjAx
OSBhdCAxMDo1OCBBTSBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBJbiBhbiBlZmZvcnQgdG8gcmVwdXJwb3NlIGx2ZHMt
ZW5jb2Rlci5jIHRvIGFsc28gc2VydmUgdGhlDQo+ID4gZnVuY3Rpb24gb2YgTFZEUyBkZWNvZGVy
cywgd2UgZW5kZWQgdXAgZGVmaW5pbmcgYSBuZXcgImdlbmVyaWMiDQo+ID4gY29tcGF0aWJsZSBz
dHJpbmcsIHRoZXJlZm9yZSBhZGFwdCB0aGUgZHQtYmluZGluZ3MgdG8gZml0IHRoZQ0KPiA+IG5l
dyBwdXJwb3NlLiBBbHNvLCBjb252ZXJ0IHRoZSBkdC1iaW5kaW5ncyBmcm9tIC50eHQgdG8gLnlh
bWwNCj4gPiB3aGlsZSBhdCBpdC4NCj4gDQo+ICJBbHNvLCAuLi4gd2hpbGUgYXQgaXQuIiBpcyBh
IHNpZ24gZm9yIHNwbGl0IGludG8gMiBwYXRjaGVzLg0KDQpXaWxsIHNwbGl0IGludG8gMiBwYXRj
aGVzDQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5j
YXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiB2MS0+djI6DQo+ID4gKiBD
b252ZXJ0ZWQgdG8gZHQtc2NoZW1hIGFzIHBlciBOZWlsJ3MgY29tbWVudA0KPiA+IC0tLQ0KPiA+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1sICAgICAgICB8IDEx
NyArKysrKysrKysrKysrKysrKysrKysNCj4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L2x2ZHMtdHJhbnNtaXR0ZXIudHh0ICAgfCAgNjYgLS0tLS0tLS0tLS0tDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDY2IGRlbGV0aW9ucygtKQ0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL2x2ZHMtY29kZWMueWFtbA0KPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwNCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLmZmNzliYzINCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL2x2ZHMtY29kZWMueWFtbA0KPiA+IEBAIC0wLDAgKzEsMTE3IEBADQo+ID4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0K
PiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL2x2
ZHMtY29kZWMueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogVHJhc25wYXJlbnQgTFZEUyBl
bmNvZGVycyBhbmQgTFZEUyBkZWNvZGVycw0KPiANCj4gVHlwbw0KDQpXaWxsIGZpeA0KDQo+IA0K
PiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2Ny
aXB0aW9uOiB8DQo+ID4gKyAgVGhpcyBiaW5kaW5nIHN1cHBvcnRzIHRyYW5zcGFyZW50IExWRFMg
ZW5jb2RlcnMgYW5kIExWRFMgZGVjb2RlcnMgdGhhdCBkb24ndA0KPiA+ICsgIHJlcXVpcmUgYW55
IGNvbmZpZ3VyYXRpb24uDQo+ID4gKw0KPiA+ICsgIExWRFMgaXMgYSBwaHlzaWNhbCBsYXllciBz
cGVjaWZpY2F0aW9uIGRlZmluZWQgaW4gQU5TSS9USUEvRUlBLTY0NC1BLiBNdWx0aXBsZQ0KPiA+
ICsgIGluY29tcGF0aWJsZSBkYXRhIGxpbmsgbGF5ZXJzIGhhdmUgYmVlbiB1c2VkIG92ZXIgdGlt
ZSB0byB0cmFuc21pdCBpbWFnZSBkYXRhDQo+ID4gKyAgdG8gTFZEUyBwYW5lbHMuIFRoaXMgYmlu
ZGluZyB0YXJnZXRzIGRldmljZXMgY29tcGF0aWJsZSB3aXRoIHRoZSBmb2xsb3dpbmcNCj4gPiAr
ICBzcGVjaWZpY2F0aW9ucyBvbmx5Lg0KPiA+ICsNCj4gPiArICBbSkVJREFdICJEaWdpdGFsIElu
dGVyZmFjZSBTdGFuZGFyZHMgZm9yIE1vbml0b3IiLCBKRUlEQS01OS0xOTk5LCBGZWJydWFyeQ0K
PiA+ICsgIDE5OTkgKFZlcnNpb24gMS4wKSwgSmFwYW4gRWxlY3Ryb25pYyBJbmR1c3RyeSBEZXZl
bG9wbWVudCBBc3NvY2lhdGlvbiAoSkVJREEpDQo+ID4gKyAgW0xESV0gIk9wZW4gTFZEUyBEaXNw
bGF5IEludGVyZmFjZSIsIE1heSAxOTk5IChWZXJzaW9uIDAuOTUpLCBOYXRpb25hbA0KPiA+ICsg
IFNlbWljb25kdWN0b3INCj4gPiArICBbVkVTQV0gIlZFU0EgTm90ZWJvb2sgUGFuZWwgU3RhbmRh
cmQiLCBPY3RvYmVyIDIwMDcgKFZlcnNpb24gMS4wKSwgVmlkZW8NCj4gPiArICBFbGVjdHJvbmlj
cyBTdGFuZGFyZHMgQXNzb2NpYXRpb24gKFZFU0EpDQo+ID4gKw0KPiA+ICsgIFRob3NlIGRldmlj
ZXMgaGF2ZSBiZWVuIG1hcmtldGVkIHVuZGVyIHRoZSBGUEQtTGluayBhbmQgRmxhdExpbmsgYnJh
bmQgbmFtZXMNCj4gPiArICBhbW9uZyBvdGhlcnMuDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0K
PiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICBB
bnkgZW5jb2RlciBvciBkZWNvZGVyIGNvbXBhdGlibGUgd2l0aCB0aGlzIGdlbmVyaWMgYmluZGlu
ZywgYnV0IHdpdGgNCj4gPiArICAgICAgYWRkaXRpb25hbCBwcm9wZXJ0aWVzIG5vdCBsaXN0ZWQg
aGVyZSwgbXVzdCBkZWZpbmUgaXRzIG93biBiaW5kaW5nIGFuZA0KPiA+ICsgICAgICBsaXN0IGEg
ZGV2aWNlIHNwZWNpZmljIGNvbXBhdGlibGUgZmlyc3QgZm9sbG93ZWQgYnkgdGhlIGdlbmVyaWMg
Y29tcGF0aWJsZQ0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZW51bToNCj4gDQo+IFlv
dSBjYW4gZHJvcCAnaXRlbXMnIHdoZW4gdGhlcmUncyBvbmx5IDEuDQoNCldpbGwgZHJvcA0KDQo+
IA0KPiA+ICsgICAgICAgIC0gbHZkcy1lbmNvZGVyICMgZm9yIExWRFMgZW5jb2RlcnMNCj4gPiAr
ICAgICAgICAtIGx2ZHMtZGVjb2RlciAjIGZvciBMVkRTIGRlY29kZXJzDQo+ID4gKw0KPiA+ICsg
IHBvcnRzOg0KPiA+ICsgICAgdHlwZTogb2JqZWN0DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0K
PiA+ICsgICAgICBUaGlzIGRldmljZSBoYXMgdHdvIHZpZGVvIHBvcnRzLiBUaGVpciBjb25uZWN0
aW9ucyBhcmUgbW9kZWxlZCB1c2luZyB0aGUNCj4gPiArICAgICAgT0YgZ3JhcGggYmluZGluZ3Mg
c3BlY2lmaWVkIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncmFwaC50eHQN
Cj4gPiArICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgIHBvcnRAMDoNCj4gPiArICAgICAgICB0
eXBlOiBvYmplY3QNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICAgICAg
V2l0aCBMVkRTIGVuY29kZXJzIHBvcnQgMCBpcyBmb3IgcGFyYWxsZWwgaW5wdXQNCj4gPiArICAg
ICAgICAgIFdpdGggTFZEUyBkZWNvZGVycyBwb3J0IDAgaXMgZm9yIExWRFMgaW5wdXQNCj4gPiAr
DQo+ID4gKyAgICAgIHBvcnRAMToNCj4gPiArICAgICAgICB0eXBlOiBvYmplY3QNCj4gPiArICAg
ICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICAgICAgV2l0aCBMVkRTIGVuY29kZXJzIHBv
cnQgMSBpcyBmb3IgTFZEUyBvdXRwdXQNCj4gPiArICAgICAgICAgIFdpdGggTFZEUyBkZWNvZGVy
cyBwb3J0IDEgaXMgZm9yIHBhcmFsbGVsIG91dHB1dA0KPiANCj4gcG9ydEAqIGFyZSByZXF1aXJl
ZCwgcmlnaHQ/DQoNClllcywgcG9ydEAwIGFuZCBwb3J0QDEgYXJlIGJvdGggcmVxdWlyZWQsIHNp
bWlsYXJseSB0bzoNCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0
LHN0bTMyLWRzaS55YW1sDQp0aGVyZWZvcmUgSSBoYXZlIHB1dCAicG9ydHMiIHVuZGVyICJyZXF1
aXJlZCIsIGluIGEgc2ltaWxhciBmYXNoaW9uLg0KV2hhdCdzIHRoZSByaWdodCB3YXkgb2Ygc3Bl
Y2lmeWluZyB0aGlzPw0KDQpUaGFua3MsDQpGYWINCg0KPiANCj4gPiArDQo+ID4gK3JlcXVpcmVk
Og0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcG9ydHMNCj4gPiArDQo+ID4gK2V4YW1w
bGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgbHZkcy1lbmNvZGVyIHsNCj4gPiArICAgICAgY29t
cGF0aWJsZSA9ICJsdmRzLWVuY29kZXIiOw0KPiA+ICsNCj4gPiArICAgICAgcG9ydHMgew0KPiA+
ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICNzaXplLWNlbGxz
ID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICBwb3J0QDAgew0KPiA+ICsgICAgICAgICAgcmVn
ID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgIGx2ZHNfZW5jX2luOiBlbmRwb2ludCB7DQo+
ID4gKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmZGlzcGxheV9vdXRfcmdiPjsNCj4g
PiArICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgcG9y
dEAxIHsNCj4gPiArICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiArDQo+ID4gKyAgICAgICAgICBs
dmRzX2VuY19vdXQ6IGVuZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50
ID0gPCZsdmRzX3BhbmVsX2luPjsNCj4gPiArICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgfTsN
Cj4gPiArICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4gKw0KPiA+ICsgIC0gfA0KPiA+ICsgICAg
bHZkcy1kZWNvZGVyIHsNCj4gPiArICAgICAgY29tcGF0aWJsZSA9ICJsdmRzLWRlY29kZXIiOw0K
PiA+ICsNCj4gPiArICAgICAgcG9ydHMgew0KPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Ow0KPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAg
ICBwb3J0QDAgew0KPiA+ICsgICAgICAgICAgcmVnID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAg
ICAgIGx2ZHNfZGVjX2luOiBlbmRwb2ludCB7DQo+ID4gKyAgICAgICAgICAgIHJlbW90ZS1lbmRw
b2ludCA9IDwmZGlzcGxheV9vdXRfbHZkcz47DQo+ID4gKyAgICAgICAgICB9Ow0KPiA+ICsgICAg
ICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgIHBvcnRAMSB7DQo+ID4gKyAgICAgICAgICByZWcg
PSA8MT47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgbHZkc19kZWNfb3V0OiBlbmRwb2ludCB7DQo+
ID4gKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmcmdiX3BhbmVsX2luPjsNCj4gPiAr
ICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgICAgfTsNCj4gPiArICAgIH07
DQo+ID4gKw0KPiA+ICsuLi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
