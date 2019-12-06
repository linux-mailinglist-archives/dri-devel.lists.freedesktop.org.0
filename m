Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0D115433
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 16:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E496F6FA3D;
	Fri,  6 Dec 2019 15:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400108.outbound.protection.outlook.com [40.107.140.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10396FA39
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 15:17:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du1nZpPFnay1nA5h1LDiD1Ksp/HkWG7AOy8wVO/aomEvdDMieI8BTJGKVeFIbEnHUEHltFVTkrDp7/2U9r3tjqffAAihxeKnt3PDF9gii64/I3YnmPU/uFhraJ1Mh2AIJ2lEItGEJcx1kIpqFCR3Di7+RKdORLDB6StPkparVu6eReYd8bOv+vIPgW59BiN2A8X4568bqDc4fg9/s4cd+xd9cNZNCAsbWkG0g8LSxv+0e7kjCntOJ2djfG5Eaj75j3RtQje/Z+uey/7PsZooI08YDHypd/RkJyOHNfKFhWB6u4haaMTssKPRhiAVwUf14iBnpzG6Xbdur3BrLUglTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af35GfE5Qpm+Pm4cThFvJn1ggwoq/UfOyct4ME7LnuU=;
 b=jY5YKUvWBCiBIwU8DlAd5MdSblYEEmqqOV50oOVrAA0kG7qxw69YJlgFg2WFfF77K5+TlhLFCvH+2aNJsaFl7Pb+cpmboKFcj2JthKaK6IMa18pIWjTv/K8CpKnhU+7RPcKHo+KZPE4+lMPsQbVL3vL8+GwX6qF2JzXmBItevTbjnaeBr1a8wOWyl+fFUyRck84o8/sO5xCARWKN7cZDtUUwecLnZ+UczosEfYF5EOhmZWa1uDmRM0mGQVaVQs5UAb5nXHlu0Wj15fTSC3RHoUX3wI8SbdZQPunMpjRlrTUMToMBaa8xORkXERd8AJXQpU5Ttx4HEy+AG9QCPb0OjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1739.jpnprd01.prod.outlook.com (52.133.163.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Fri, 6 Dec 2019 15:17:41 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2495.014; Fri, 6 Dec 2019
 15:17:41 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 2/8] dt-bindings: display: Add idk-2121wr binding
Thread-Topic: [PATCH v3 2/8] dt-bindings: display: Add idk-2121wr binding
Thread-Index: AQHVXc+VJwaQTEUZ9E6807XkOQK7f6eAchMAgC1hVgA=
Date: Fri, 6 Dec 2019 15:17:41 +0000
Message-ID: <TY1PR01MB1770973E2F6AAA74B6F6B16CC05F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107181200.GB24231@pendragon.ideasonboard.com>
In-Reply-To: <20191107181200.GB24231@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 05b64988-2861-46be-9f67-08d77a5f703a
x-ms-traffictypediagnostic: TY1PR01MB1739:|TY1PR01MB1739:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1739A34B1B7106C550F71E6AC05F0@TY1PR01MB1739.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(189003)(199004)(26005)(76116006)(52536014)(966005)(66946007)(64756008)(2906002)(7416002)(74316002)(66446008)(81166006)(54906003)(305945005)(86362001)(6916009)(33656002)(66556008)(478600001)(8936002)(55016002)(5660300002)(66476007)(53546011)(6506007)(229853002)(316002)(102836004)(81156014)(186003)(71190400001)(8676002)(7696005)(4326008)(44832011)(76176011)(99286004)(71200400001)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1739;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: erR7NAgGaqff9wc1klFl7Lsp2qdpsc2c2bIRzBsQd07K0VbGt7XewxYfG+sLnSx30NwczLQyVc78933BSzUx5i5DFK0tvGCDLmx4Zlsg+r1QnwWZ6rcWXsL70jbM7J83G/m2Ez0Wq+U9K/c81YxdPlDIqS2Gil9R63zOslcEef8cfO46ZRG4bpXPwrabGmWZLI38YIKr6+bpHYx0BcPcLChcU3lRHjde+QEeRAexTEudY3Olbb5UsmrVMPmGNvHNAGyu+33TfJuZrh1C1JKiULNeiTaaJXtXJ0nIclgXG4ZoYMppSPt1HUToPg5x9HCMPeSORgXMqfNo9bZ3n5GEQwCs+KRz5BNLbOLTUShwvvleLBoghABRLEU0cV6Hc2+MBDpJyrpzjIjeqBhWuzhWLs/wSTlycKzYaGulcXsSzIsHf/XR1bMUe1/TvGWUdB1mh50cEWT7GE5PID3d3/LTmGGTbiWYTCnioU5deas48c8=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b64988-2861-46be-9f67-08d77a5f703a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 15:17:41.4719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yQwBLxDMSEyu5dyopd68bpIgh6yBDMaYA8w8fbyUlWxfuwoUnZM9UNo49XAOAtvkwOSN4X8cogEbBbnqXA/WNT4HBY3taSYOTq7iGWiDy6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1739
X-Mailman-Approved-At: Fri, 06 Dec 2019 15:27:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af35GfE5Qpm+Pm4cThFvJn1ggwoq/UfOyct4ME7LnuU=;
 b=Bk3JIeRbuXEJK7sz+GWyi2DVIF/VV/gUpxFkqSvDo1ceGsXV6dOse3ygRUY8DUtbWfVUErgryFkNE/adRakZSozRN4uwGn1oIdqrIlOWcm5sStrGRhAeHk0VrHq0c4ngSQz9KePPkYnc93OeEClts/ppW5uYDJQNva/Phxvk9gw=
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

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMDcgTm92ZW1iZXIgMjAxOSAxODoxMg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvOF0g
ZHQtYmluZGluZ3M6IGRpc3BsYXk6IEFkZCBpZGstMjEyMXdyIGJpbmRpbmcNCj4gDQo+IEhpIEZh
YnJpemlvLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBXZWQsIEF1
ZyAyOCwgMjAxOSBhdCAwNzozNjozNlBNICswMTAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+
ID4gQWRkIGJpbmRpbmcgZm9yIHRoZSBpZGstMjEyMXdyIExWRFMgcGFuZWwgZnJvbSBBZHZhbnRl
Y2guDQo+ID4NCj4gPiBTb21lIHBhbmVsLXNwZWNpZmljIGRvY3VtZW50YXRpb24gY2FuIGJlIGZv
dW5kIGhlcmU6DQo+ID4gaHR0cHM6Ly9idXkuYWR2YW50ZWNoLmV1L0Rpc3BsYXlzL0VtYmVkZGVk
LUxDRC1LaXRzLUhpZ2gtQnJpZ2h0bmVzcy9tb2RlbC1JREstMjEyMVdSLUsyRkhBMkUuaHRtDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0Bi
cC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAqIG5ldyBwYXRj
aA0KPiA+IC0tLQ0KPiA+ICAuLi4vZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci55
YW1sICAgICAgICB8IDkwICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDkwIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdy
LnlhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sDQo+IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0y
MTIxd3IueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMC4u
YjJjY2RjOA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sDQo+
ID4gQEAgLTAsMCArMSw5MCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdyLnlhbWwjDQo+
ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iw0KPiA+ICsNCj4gPiArdGl0bGU6IEFkdmFudGVjaCBJREstMjEyMVdSIDIxLjUiIEZ1bGwtSEQg
ZHVhbC1MVkRTIHBhbmVsDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIEZhYnJp
emlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+ICsgIC0gVGhp
ZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2Ny
aXB0aW9uOiB8DQo+ID4gKyAgVGhlIElESy0yMTIxV1IgZnJvbSBBZHZhbnRlY2ggaXMgYSBGdWxs
LUhEIGR1YWwtTFZEUyBwYW5lbC4NCj4gPiArDQo+ID4gKyAgVGhlIHBhbmVscyBleHBlY3RzIG9k
ZCBwaXhlbHMgZnJvbSB0aGUgZmlyc3QgcG9ydCwgYW5kIGV2ZW4gcGl4ZWxzIGZyb20NCj4gDQo+
IHMvcGFuZWxzL3BhbmVsLw0KPiBNYXliZSBzL2Zyb20gdGhlL29uIHRoZS9nID8NCg0KV2lsbCBm
aXgNCg0KPiANCj4gPiArICB0aGUgc2Vjb25kIHBvcnQsIHRoZXJlZm9yZSB0aGUgcG9ydHMgbXVz
dCBiZSBtYXJrZWQgYWNjb3JkaW5nbHkuDQo+ID4gKw0KPiA+ICthbGxPZjoNCj4gPiArICAtICRy
ZWY6IGx2ZHMueWFtbCMNCj4gPiArICAtICRyZWY6IC4uL2J1cy10aW1pbmdzL2x2ZHMueWFtbCMN
Cj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGl0
ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBhZHZhbnRlY2gsaWRrLTIxMjF3cg0KPiA+ICsgICAg
ICAtIHt9ICMgcGFuZWwtbHZkcywgYnV0IG5vdCBsaXN0ZWQgaGVyZSB0byBhdm9pZCBmYWxzZSBz
ZWxlY3QNCj4gPiArDQo+ID4gKyAgZGF0YS1tYXBwaW5nOg0KPiA+ICsgICAgY29uc3Q6IHZlc2Et
MjQNCj4gPiArDQo+ID4gKyAgd2lkdGgtbW06DQo+ID4gKyAgICBjb25zdDogNDc2DQo+ID4gKw0K
PiA+ICsgIGhlaWdodC1tbToNCj4gPiArICAgIGNvbnN0OiAyNjgNCj4gPiArDQo+ID4gKyAgcGFu
ZWwtdGltaW5nOiB0cnVlDQo+ID4gKyAgcG9ydHM6IHRydWUNCj4gPiArDQo+ID4gK2FkZGl0aW9u
YWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21w
YXRpYmxlDQo+IA0KPiBTaG91bGRuJ3QgZGF0YS1tYXBwaW5nLCB3aWR0aC1tbSwgaGVpZ2h0LW1t
IGFuZCBwb3J0cyBiZSByZXF1aXJlZCB0b28gPw0KDQpUaG9zZSBhcmUgcmVxdWlyZWQgYnkgbHZk
cy55YW1sLCBhbmQgdGhpcyBmaWxlIGhhcyBhIHJlZmVyZW5jZSB0byBpdC4NCkFueWhvdywgSSB0
aGluayB0aGUgYmVzdCBjb3Vyc2Ugb2YgYWN0aW9uIGlzIHRvIG1lcmdlIHRoaXMgd2l0aCB0aGUN
CmdlbmVyaWMgYnVzLXRpbWluZ3MvbHZkcy55YW1sIGZvciB0aGUgdGltZSBiZWluZywgYW5kIG1h
eWJlIHNwbGl0DQp0aGVtIGJhY2sgbGF0ZXIgb24gb25jZSB3ZSBoYXZlIGFub3RoZXIgdXNlIGNh
c2UuDQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiBBcyB5b3UgbWVudGlvbmVkIGluIHRoZSBjb3Zl
ciBsZXR0ZXIsIHZhbGlkYXRpbmcgcG9ydHMsIHBvcnQgYW5kIHRoZSBuZXcNCj4gZHVhbC1sdmRz
LSotcGl4ZWxzIHByb3BlcnRpZXMgd291bGQgYmUgbmljZS4gSSdtIG5vdCBZQU1MIHNjaGVtYQ0K
PiBzcGVjaWFsaXN0LCBzbyBJJ20gZmluZSB3aXRoIGEgYmVzdCBlZmZvcnQgYXBwcm9hY2ggaGVy
ZSwgYnV0IGFzIGZhciBhcw0KPiBJIHVuZGVyc3RhbmQgUm9iIHByb3Bvc2VkIGEgd2F5IGZvcndh
cmQsIGNvdWxkIHlvdSB0cnkgaXQgPw0KPiANCj4gQXBhcnQgZnJvbSB0aGF0LCB0aGUgYmluZGlu
Z3MgbG9vayBzbmUgdG8gbWUsIHNvDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gb25jZSB0aGUgYWJv
dmUgaXNzdWVzIGdldCBhZGRyZXNzZWQuDQo+IA0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4g
KyAgLSB8Kw0KPiA+ICsgICAgcGFuZWwtbHZkcyB7DQo+ID4gKyAgICAgIGNvbXBhdGlibGUgPSAi
YWR2YW50ZWNoLGlkay0yMTIxd3IiLCAicGFuZWwtbHZkcyI7DQo+ID4gKw0KPiA+ICsgICAgICB3
aWR0aC1tbSA9IDw0NzY+Ow0KPiA+ICsgICAgICBoZWlnaHQtbW0gPSA8MjY4PjsNCj4gPiArDQo+
ID4gKyAgICAgIGRhdGEtbWFwcGluZyA9ICJ2ZXNhLTI0IjsNCj4gPiArDQo+ID4gKyAgICAgIHBh
bmVsLXRpbWluZyB7DQo+ID4gKyAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDE0ODUwMDAwMD47
DQo+ID4gKyAgICAgICAgaGFjdGl2ZSA9IDwxOTIwPjsNCj4gPiArICAgICAgICB2YWN0aXZlID0g
PDEwODA+Ow0KPiA+ICsgICAgICAgIGhzeW5jLWxlbiA9IDw0ND47DQo+ID4gKyAgICAgICAgaGZy
b250LXBvcmNoID0gPDg4PjsNCj4gPiArICAgICAgICBoYmFjay1wb3JjaCA9IDwxNDg+Ow0KPiA+
ICsgICAgICAgIHZmcm9udC1wb3JjaCA9IDw0PjsNCj4gPiArICAgICAgICB2YmFjay1wb3JjaCA9
IDwzNj47DQo+ID4gKyAgICAgICAgdnN5bmMtbGVuID0gPDU+Ow0KPiA+ICsgICAgICB9Ow0KPiA+
ICsNCj4gPiArICAgICAgcG9ydHMgew0KPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Ow0KPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICBw
b3J0QDAgew0KPiA+ICsgICAgICAgICAgcmVnID0gPDA+Ow0KPiA+ICsgICAgICAgICAgZHVhbC1s
dmRzLW9kZC1waXhlbHM7DQo+ID4gKyAgICAgICAgICBwYW5lbF9pbjA6IGVuZHBvaW50IHsNCj4g
PiArICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMF9vdXQ+Ow0KPiA+ICsgICAg
ICAgICAgfTsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICBwb3J0QDEgew0K
PiA+ICsgICAgICAgICAgcmVnID0gPDE+Ow0KPiA+ICsgICAgICAgICAgZHVhbC1sdmRzLWV2ZW4t
cGl4ZWxzOw0KPiA+ICsgICAgICAgICAgcGFuZWxfaW4xOiBlbmRwb2ludCB7DQo+ID4gKyAgICAg
ICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczFfb3V0PjsNCj4gPiArICAgICAgICAgIH07
DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4gKw0KPiA+
ICsuLi4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
