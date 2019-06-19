Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FED4BC25
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 16:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBB06E424;
	Wed, 19 Jun 2019 14:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410129.outbound.protection.outlook.com [40.107.141.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEAA6E329
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 08:08:12 +0000 (UTC)
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1850.jpnprd01.prod.outlook.com (52.133.162.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 08:08:09 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 08:08:09 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 1/3] dt-bindings: display: renesas: Add r8a774a1 support
Thread-Topic: [PATCH 1/3] dt-bindings: display: renesas: Add r8a774a1 support
Thread-Index: AQHVJek3P4X/AbQjwUG5WDOZ21klq6ahniIAgAEB0lA=
Date: Wed, 19 Jun 2019 08:08:09 +0000
Message-ID: <TY1PR01MB1770E12DBC116A3F395DE17BC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190618164338.GG21105@pendragon.ideasonboard.com>
In-Reply-To: <20190618164338.GG21105@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94827198-ddb4-4e26-2ad0-08d6f48d448f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1850; 
x-ms-traffictypediagnostic: TY1PR01MB1850:
x-microsoft-antispam-prvs: <TY1PR01MB1850E638A564179166CE816CC0E50@TY1PR01MB1850.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(136003)(39860400002)(366004)(189003)(199004)(6916009)(316002)(11346002)(4326008)(14454004)(53936002)(3846002)(9686003)(6116002)(26005)(7736002)(7696005)(68736007)(6246003)(107886003)(229853002)(99286004)(73956011)(446003)(25786009)(74316002)(2906002)(14444005)(256004)(5660300002)(54906003)(8676002)(81156014)(52536014)(76176011)(7416002)(71200400001)(102836004)(8936002)(66476007)(44832011)(66066001)(476003)(86362001)(478600001)(71190400001)(486006)(81166006)(305945005)(186003)(55016002)(33656002)(6436002)(76116006)(66446008)(6506007)(53546011)(66556008)(66946007)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1850;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1tfoIGCsBfofxfOHoiqMT9bgpgcsfNuR9/FQdHjyPYFQ0/8nNSdZMYlLBcAGVyOJ5i8fPX/8gKpWg5XxltoH1euL0qko7FFF6xUgOOX9A+Bx5uz/GZL3buhKnL9Jbhv/Otnu+VEVd7DsLDhpZAljFmFFnxLisFP3tbMn3xkYTdGEFdMsGLdE4T6U84+9ZdW6DeYs9fE7JhgJSGsTy+Kt3Q38nhE1121xUcZtSqEOvdLg0wU2CBmaqpiOc1JZklsIn+unogNZvl3RBeHQmR7qFjvqHiWu+1zhmKU1zFi9WUSTRB0HmIc+euDjZGKYh0h7+3U1tBMypNbzMCCCNGhnmcKkmYh2SbSrZc0emiUgRJT+ZxeqO14H98iRdkema1WhK9QJyzVBkm4bPY5//3MM12CtvEbtuOsmNRPRgkHq+GE=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94827198-ddb4-4e26-2ad0-08d6f48d448f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 08:08:09.4964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1850
X-Mailman-Approved-At: Wed, 19 Jun 2019 14:58:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCZQBN+yvt3myNSu1yv2To5GMRbknMBc+SviwMgp/eo=;
 b=BExZB40OOAIw5vKK2e6EIlxgwOqYapC6w+t0ZuPQafYDpOXaUKRVGgbsL6fjizxoBqZC183CxPO5GTBHp5FwrYH+An2QcwiiWKMz9v0NLrn9z3d/bZfki7tZZgK14FnG6biJ7CTkISwCuoSGzqtyMg0F2wm20suyHnCQM5k5fKI=
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IGxp
bnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtcmVuZXNhcy1zb2Mt
b3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgTGF1cmVudCBQaW5jaGFydA0KPiBT
ZW50OiAxOCBKdW5lIDIwMTkgMTc6NDQNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzOiBBZGQgcjhhNzc0YTEgc3VwcG9ydA0KPiANCj4gSGkg
RmFicml6aW8sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFR1ZSwg
SnVuIDE4LCAyMDE5IGF0IDA0OjE4OjM3UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToN
Cj4gPiBEb2N1bWVudCBSWi9HMk0gKFI4QTc3NEExKSBTb0MgYmluZGluZ3MuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2Fz
LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiBJIGRvbid0IGhhdmUgcGVuZGluZyBjaGFuZ2Vz
IGZvciB0aGlzIGZpbGUgZm9yIHRoaXMga2VybmVsIHJlbGVhc2UuIEFzDQo+IHlvdXIgc2VyaWVz
IGNvbnRhaW5zIERUIGNoYW5nZXMsIEknbSBmaW5lIGlmIHRoaXMgcGF0Y2ggZ2V0cyBtZXJnZWQN
Cj4gdGhyb3VnaCB0aGUgQVJNIFNvQyB0cmVlIGFsb25nIHdpdGggdGhlIHJlc3QuIE90aGVyd2lz
ZSBwbGVhc2UgbGV0IG1lDQo+IGtub3cgaWYgSSBzaG91bGQgaGFuZGxlIGl0IG15c2VsZi4NCg0K
VGhhbmsgeW91IExhdXJlbnQsIEkgdGhpbmsgdGhpcyBwYXRjaCBjYW4gZ28gYWxvbmcgd2l0aCB0
aGUgcmVzdCwgaWYgdGhhdCdzIE9LIHdpdGgNClNpbW9uPw0KDQpUaGFua3MsDQpGYWINCg0KPiAN
Cj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQgfCA0ICsrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3
LWhkbWkudHh0DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQNCj4gPiBpbmRleCBhNDFkMjgwLi5kYjY4MDQxIDEw
MDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9yZW5lc2FzLGR3LWhkbWkudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQNCj4gPiBA
QCAtMTIsMTAgKzEyLDEyIEBAIGZvbGxvd2luZyBkZXZpY2Utc3BlY2lmaWMgcHJvcGVydGllcy4N
Cj4gPiAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPg0KPiA+ICAtIGNvbXBhdGlibGUgOiBTaGFs
bCBjb250YWluIG9uZSBvciBtb3JlIG9mDQo+ID4gKyAgLSAicmVuZXNhcyxyOGE3NzRhMS1oZG1p
IiBmb3IgUjhBNzc0QTEgKFJaL0cyTSkgY29tcGF0aWJsZSBIRE1JIFRYDQo+ID4gICAgLSAicmVu
ZXNhcyxyOGE3Nzk1LWhkbWkiIGZvciBSOEE3Nzk1IChSLUNhciBIMykgY29tcGF0aWJsZSBIRE1J
IFRYDQo+ID4gICAgLSAicmVuZXNhcyxyOGE3Nzk2LWhkbWkiIGZvciBSOEE3Nzk2IChSLUNhciBN
My1XKSBjb21wYXRpYmxlIEhETUkgVFgNCj4gPiAgICAtICJyZW5lc2FzLHI4YTc3OTY1LWhkbWki
IGZvciBSOEE3Nzk2NSAoUi1DYXIgTTMtTikgY29tcGF0aWJsZSBIRE1JIFRYDQo+ID4gLSAgLSAi
cmVuZXNhcyxyY2FyLWdlbjMtaGRtaSIgZm9yIHRoZSBnZW5lcmljIFItQ2FyIEdlbjMgY29tcGF0
aWJsZSBIRE1JIFRYDQo+ID4gKyAgLSAicmVuZXNhcyxyY2FyLWdlbjMtaGRtaSIgZm9yIHRoZSBn
ZW5lcmljIFItQ2FyIEdlbjMgYW5kIFJaL0cyIGNvbXBhdGlibGUNCj4gPiArCQkJICAgICBIRE1J
IFRYDQo+ID4NCj4gPiAgICAgIFdoZW4gY29tcGF0aWJsZSB3aXRoIGdlbmVyaWMgdmVyc2lvbnMs
IG5vZGVzIG11c3QgbGlzdCB0aGUgU29DLXNwZWNpZmljDQo+ID4gICAgICB2ZXJzaW9uIGNvcnJl
c3BvbmRpbmcgdG8gdGhlIHBsYXRmb3JtIGZpcnN0LCBmb2xsb3dlZCBieSB0aGUNCj4gDQo+IC0t
DQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
