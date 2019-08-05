Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFB482C8D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BCD89B46;
	Tue,  6 Aug 2019 07:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410100.outbound.protection.outlook.com [40.107.141.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191CA6E3DD
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVJLpGAYhx9mgCyvWtD+Ep67YHkxzWnYtiyustnEe4qIy3+F11/z+jPXFCrjx4U0Ca21Pvi7FzEr1pTBGuMOFCplIIEyi1ZuaRvrzBbz2n2Tsqoh2MIfIwsrz0phfQvGltK9+5mbALiV69CgQ50SwtZ4W8jSVV933j5XTFyXYGcFLd5snFxzlFckIvvvtwQuAgs44ixRPMepGnoXdKW73UeMO4RXyzdBwvZu2ShUAlH5JX06fC8SoFPdiwB9O5uOI1qCyzeu1iWlj5Gz4JTq+cAgHjOKW5EDJPdcCBvxp1lLqfHjhRG//i133ZdFu54Ul0YKw1aLrqETetluLWyGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gks3pFMTeZLMenuOHfsa8j66upiYTJ51pQnlQ2yMDLY=;
 b=SnMtOVWjyhLn/ajX6zBBYwAJdbKWQShzo89fyvKRhkT1V2YdkxQ06NqgBPD3YLyRCcThapYKc8V/7SuX/btRc9x6lvenMNP18JTofXxuatStXsmmRTdLBrTDSzL/V7R3czEfVUIs92S956SudJeGenDgPHYrJ8hJJXXf9QkBeV3J9D0eXOgW/qH7cloJsehly0F0CGeQh4bTSudCCiL+ehTm6lXthrgjwKr5mP7UOuLY/7bPj6hfC6AqgbYjeg7qONAA5eft0i9ATHcuSl1Dduu9i1xfwo78sQnGDr4fXz7qAc3lUE3oUPO9LmPxWpDeFu5v8vc74WZq7S1NkCi2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1673.jpnprd01.prod.outlook.com (52.133.162.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 10:07:24 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 10:07:24 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document
 renesas,swap-data
Thread-Topic: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document
 renesas,swap-data
Thread-Index: AQHVSQTAkHqVuaZ+mkSDN4F3/wGVC6bnejAAgATJjGCAAAyHgIAACJAQ
Date: Mon, 5 Aug 2019 10:07:24 +0000
Message-ID: <TY1PR01MB1770C5AB21E45C24158584B7C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802074428.GB5008@pendragon.ideasonboard.com>
 <TY1PR01MB17706A4FF4C26CD4BDA1A5DAC0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190805093543.GB29747@pendragon.ideasonboard.com>
In-Reply-To: <20190805093543.GB29747@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 313d52ad-4411-4454-1357-08d7198cb6c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1673; 
x-ms-traffictypediagnostic: TY1PR01MB1673:
x-microsoft-antispam-prvs: <TY1PR01MB16734743AC1C0188F964EBB5C0DA0@TY1PR01MB1673.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(199004)(189003)(11346002)(3846002)(6116002)(256004)(229853002)(86362001)(7416002)(446003)(55016002)(8676002)(68736007)(478600001)(186003)(9686003)(476003)(6246003)(7696005)(99286004)(6916009)(81156014)(6436002)(66946007)(76116006)(52536014)(81166006)(66556008)(66476007)(74316002)(107886003)(33656002)(14454004)(7736002)(8936002)(66446008)(64756008)(102836004)(76176011)(316002)(71200400001)(71190400001)(53936002)(486006)(66066001)(26005)(54906003)(2906002)(305945005)(6506007)(4326008)(53546011)(25786009)(44832011)(5660300002)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1673;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5a/EfsZR0RokdCyOue26Yw71Fa5zAv0fNnFVFHsLJHM/66MASHjfpvSMxwcFja8mZI6SMGzrW7jw3hDqiIYiKfez5ADwzffpUWQ84RYezdeZan0JCQu5inRuJ2cxyQmtQqJCzhg4qEzguKZo3MfdcS0cfblojxYSqvzaEkU+bz0SUzVaCfviKvb8XO/SfNW/kI98mxMA0jJ+rdanYZXyM5rVlr3yI2MJ/SlzRUEWBgCxk94OFHbpFQ8w3VVCmd1HwvyPu+oLJklt5zpEgmT5N71eDZe2QjWgcR5ud8TAK++VtKL24IYWFDmDp12P5e4pgY1mDgK91s/uPlyc243uQ/oughSk4tC1Q5I44xYDa9KG6Wg9KBj4T+O/1blhAB0qF+8+/+fYouGW6z69AF7F/CaCHqo4E5kYY8NMkyTgGrc=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313d52ad-4411-4454-1357-08d7198cb6c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 10:07:24.6790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1673
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gks3pFMTeZLMenuOHfsa8j66upiYTJ51pQnlQ2yMDLY=;
 b=YDxy67Ubez1S8yfMBs79yTcpc1sB1XNvGcwdxs41wPbgpYTutmq0KnsW3jnimNaJ5VazsczffapIw+SwVF1tjsOd6JEF4TRM/3GZRzzTRwpwiApWh2NF5EfUBRwrgwW5EvAmezGOeamNAsdTZFh6mhWrEfC1BPV7ntI0LhhDNVU=
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
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KPiBGcm9tOiBsaW51eC1rZXJuZWwtb3duZXJAdmdlci5rZXJuZWwub3Jn
IDxsaW51eC1rZXJuZWwtb3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgTGF1cmVu
dCBQaW5jaGFydA0KPiBTZW50OiAwNSBBdWd1c3QgMjAxOSAxMDozNg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIL1JGQyAwMi8xMl0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXM6IGx2ZHM6IERv
Y3VtZW50IHJlbmVzYXMsc3dhcC1kYXRhDQo+IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IE9uIE1v
biwgQXVnIDA1LCAyMDE5IGF0IDA4OjU5OjUxQU0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90
ZToNCj4gPiA+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4NCj4gPiA+IFNlbnQ6IDAyIEF1Z3VzdCAyMDE5IDA4OjQ0DQo+ID4gPiBTdWJq
ZWN0OiBSZTogW1BBVENIL1JGQyAwMi8xMl0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXM6
IGx2ZHM6IERvY3VtZW50IHJlbmVzYXMsc3dhcC1kYXRhDQo+ID4gPg0KPiA+ID4gSGkgRmFicml6
aW8sDQo+ID4gPg0KPiA+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+ID4gPg0KPiA+ID4g
T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDg6MzM6NTlBTSArMDEwMCwgRmFicml6aW8gQ2FzdHJv
IHdyb3RlOg0KPiA+ID4gPiBSLUNhciBEMywgUi1DYXIgRTMsIGFuZCBSWi9HMkUgc3VwcG9ydCBk
dWFsLWxpbmsgbW9kZS4NCj4gPiA+ID4gSW4gc3VjaCBhIG1vZGUsIHRoZSBmaXJzdCBMVkRTIGVu
Y29kZXIgZW1pdHMgZXZlbiBkYXRhLCBhbmQgdGhlDQo+ID4gPiA+IHNlY29uZCBMVkRTIGVuY29k
ZXIgZW1pdHMgb2RkIGRhdGEuIFRoaXMgcGF0Y2ggZG9jdW1lbnRzIHByb3BlcnR5DQo+ID4gPiA+
IHJlbmVzYXMsc3dhcC1kYXRhLCB1c2VkIHRvIHN3YXAgZXZlbiBhbmQgb2RkIGRhdGEgYXJvdW5k
Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJp
emlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4
dCB8IDUgKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4g
PiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0DQo+ID4gPiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0DQo+
ID4gPiA+IGluZGV4IGRlY2U3OWUuLjg5ODAxNzkgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMu
dHh0DQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0DQo+ID4gPiA+IEBAIC01Miw2ICs1MiwxMSBAQCBP
cHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAgICBtYW5kYXRvcnkgZm9yIHRoZSBmaXJzdCBM
VkRTIGVuY29kZXIgb24gUi1DYXIgRDMsIFItQ2FyIEUzLCBhbmQgUlovRzJFIFNvQ3MsDQo+ID4g
PiA+ICAgIGFuZCBzaGFsbCBwb2ludCB0byB0aGUgc2Vjb25kIGVuY29kZXIgdG8gYmUgdXNlZCBh
cyBhIGNvbXBhbmlvbiBpbiBkdWFsLWxpbmsNCj4gPiA+ID4gICAgbW9kZS4gSXQgc2hhbGwgbm90
IGJlIHNldCBmb3IgYW55IG90aGVyIExWRFMgZW5jb2Rlci4NCj4gPiA+ID4gKy0gcmVuZXNhcyxz
d2FwLWRhdGEgOiB3aGVuIGluIGR1YWwtbGluayBtb2RlLCB0aGUgZmlyc3QgTFZEUyBlbmNvZGVy
IG5vcm1hbGx5DQo+ID4gPiA+ICsgIGVtaXRzIGV2ZW4gZGF0YSwgYW5kIHRoZSBzZWNvbmQgTFZE
UyBlbmNvZGVyIGVtaXRzIG9kZCBkYXRhLiBXaGVuIHByb3BlcnR5DQo+ID4gPiA+ICsgIHJlbmVz
YXMsc3dhcC1kYXRhIGlzIHNwZWNpZmllZCwgdGhlIGRhdGEgZW1pdHRlZCBieSB0aGUgdHdvIGVu
Y29kZXJzIHdpbGwgYmUNCj4gPiA+ID4gKyAgc3dhcHBlZCBhcm91bmQuIFRoaXMgcHJvcGVydHkg
Y2FuIG9ubHkgYmUgdXNlZCBpbiBjb25qdW5jdGlvbiB3aXRoIHByb3BlcnR5DQo+ID4gPiA+ICsg
IHJlbmVzYXMsY29tcGFuaW9uLg0KPiA+ID4NCj4gPiA+IEZyb20gYW4gTFZEUyBlbmNvZGVyIHBv
aW50IG9mIHZpZXcgdGhpcyBpcyBtb3JlIGEgY29uZmlndXJhdGlvbiBvcHRpb24NCj4gPiA+IHRo
YW4gYSBkZXNjcmlwdGlvbiBvZiB0aGUgaGFyZHdhcmUuIFdvdWxkbid0IGl0IGJlIGJldHRlciBm
b3IgdGhlIExWRFMNCj4gPiA+IHNpbmsgdG8gcmVwb3J0IHdoaWNoIG9mIHRoZSBvZGQgb3IgZXZl
biBwaXhlbHMgaXQgZXhwZWN0cyBvbiBlYWNoIG9mIGl0cw0KPiA+ID4gZW5kcG9pbnRzID8NCj4g
Pg0KPiA+IFllcywgdGhhdCB3b3VsZCBiZSBteSBwcmVmZXJlbmNlIHRvbywgYW5kIGl0IHdvdWxk
IGJlIGJldHRlciwgSSBhbSBqdXN0IG5vdCBlbnRpcmVseQ0KPiA+IHdoYXQncyB0aGUgYmVzdCBw
bGFjZSBmb3IgdGhpcyBpbmZvcm1hdGlvbiB0aG91Z2gNCj4gPg0KPiA+ID4gVGhlIExWRFMgZW5j
b2RlciBkcml2ZXIgY291bGQgdGhlbiBxdWVyeSB0aGF0IGF0IHJ1bnRpbWUgYW5kDQo+ID4gPiBj
b25maWd1cmUgaXRzZWxmIGFjY29yZGluZ2x5LiBJZGVhbGx5IHRoaXMgc2hvdWxkIGJlIHF1ZXJp
ZWQgdGhyb3VnaCB0aGUNCj4gPiA+IGRybV9icmlkZ2VfdGltaW5ncyBzdHJ1Y3R1cmUgKG9yIHRo
cm91Z2ggYSBzaW1pbGFyIG1lYW4pLCBub3QgdGhyb3VnaA0KPiA+ID4gRFQuIEFuIExWRFMgc2lu
ayB0aGF0IGhhcyBhIGZpeGVkIG1hcHBpbmcgb2Ygb2RkL2V2ZW4gcGl4ZWxzIHRvDQo+ID4gPiBl
bmRwb2ludHMgd291bGRuJ3QgbmVlZCB0aGUgaW5mb3JtYXRpb24gdG8gYmUgc3BlY2lmaWVkIGlu
IERUIGF0IGFsbC4NCj4gPg0KPiA+IElzbid0IGRybV9icmlkZ2VfdGltaW5ncyBzcGVjaWZpYyBm
b3IgYnJpZGdlcz8NCj4gDQo+IEl0cyBuYW1lIG1ha2VzIGl0IHNwZWNpZmljIHRvIGJyaWRnZXMs
IGJ1dCB0aGUgaW5mb3JtYXRpb24gaXQgY29udGFpbnMNCj4gY291bGQgZXF1YWxseSBhcHBseSB0
byBwYW5lbHMuIEkgd291bGQgdGh1cyB1c2UgaXQgZm9yIGJvdGgsIHBvc3NpYmx5DQo+IGFmdGVy
IHJlbmFtaW5nIGl0Lg0KDQpXaWxsIGdpdmUgdGhpcyBhIHRyeSB0aGVuLg0KDQpUaGFua3MsDQpG
YWINCg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
