Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB0A9117A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461366EAA6;
	Sat, 17 Aug 2019 15:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410138.outbound.protection.outlook.com [40.107.141.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01C46E9CB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCg+ancFRG3T9nee4ulrrJ491eyGGH9SGOJo4k65E6LWkALkLrx2Pg+hsulDSbNveot69hVSpOO0xgsT7LtTbZEP223p0uIp7dRdC/c6xsy3c8frx1oFlnCsbzLmgPAUvlPL/AQpw55RzId3K/xBYUiFirvPBilvtGgazpq7/r621Eq4CkfLg0v5gfxBZDNG4u5fN7D9jeblbAbtN00JtuWGw/vULmijx2/W7+md9PO6NhlfTtJ1Hp6QV/8YMVKZ7ujlVciW7X/3b1VleMz8dHm22rHPhw0Pyc51f8vgUzLJjcL1WM8xXSO6CkS2TBMRFOhCA0TKiz3Bhy057MFdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JufUOxBFGSFy8tfgqPX8eRkinQKZ7ICx2Kz3EyhxF7I=;
 b=YGOe0aW8w79VdT8xw1Dwgbqlz1OsJg4q1vZfYvNQB9Z8JMwvLPPC3/KmNngt9VXGSMq0786/HomI4zsthANAyydFZXj+vFTvPSqQaJOmtf7K8PJSJ+cd8MS8YJHpT+/W6NCZnSuFJwlaSivh6jyyFcWVPw/mxJ1ruB/+Yfgh9ttkK58Lp4VVmuJr5dyBfkluDkG62W0Qf54QsJ5cEI6igPRfWiZ2zVBhfsc3ONFQ9ng/08yviG2rBcGwXOw9Xm0Kd1onL9DG919YxPuvdPpvqD2TwNBmlZfjfvpsOZGhraOgANZdugFtw+yXfkSXut6ibM543cGyp0Cy8FS2a1qY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1482.jpnprd01.prod.outlook.com (52.133.163.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 15 Aug 2019 14:31:26 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 14:31:26 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Thread-Topic: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Thread-Index: AQHVU1lM9+L2miT/i0amqdy98WNy2qb8MTMAgAAMrQCAAAL7AIAAASrA
Date: Thu, 15 Aug 2019 14:31:26 +0000
Message-ID: <TY1PR01MB1770404C560F6967FA81D521C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
 <20190815140400.GA7174@kroah.com>
 <20190815141440.GA20322@pendragon.ideasonboard.com>
In-Reply-To: <20190815141440.GA20322@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cb0fa44-7912-4816-50da-08d7218d4145
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1482; 
x-ms-traffictypediagnostic: TY1PR01MB1482:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1482BA48CA1D7CAF49E8B5C0C0AC0@TY1PR01MB1482.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(189003)(199004)(66946007)(305945005)(64756008)(52536014)(446003)(74316002)(25786009)(6116002)(2906002)(256004)(14444005)(66066001)(7736002)(186003)(478600001)(476003)(6246003)(229853002)(76116006)(53936002)(44832011)(3846002)(66476007)(66556008)(66446008)(6436002)(76176011)(26005)(966005)(71190400001)(55016002)(8676002)(86362001)(5660300002)(316002)(8936002)(6306002)(102836004)(11346002)(486006)(6506007)(81156014)(9686003)(110136005)(99286004)(54906003)(4326008)(53546011)(33656002)(81166006)(7416002)(14454004)(7696005)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1482;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XlfY40e+zrPQIddfIXhyU3PUidtC4QLAK10qKZyK80+vIiE5LmeAbHqHFBR+aM3SMnKGDGf5aonJPW3VRm7nf9lAr2zDGZgLI+0412dZwuxiv8gWlOCOfPw0s9sOtiY4dBhnOsoR1axvc/IVVz0C0Uv+moJgYZoFcSJQTRpwCj0d4f/oP9+6LpcWFWn9rd4Q8Zb2niZaCl4tcq+F7XHYTxaTHFW3vF+uqXOjeUGCE6YuaSvORQKF3kG/kK3yUzcRLJy7kbPyDZgVEAIlICNrt3X0im5ZdHes23oKTavY6F3+j/hK7+lhZ69aEWkwPO6/vI/kS5GJOyB+qaC+sQO9A4eJWR7m7NwgCdM61DZCcZuR26I0Q0soCRJopgiZwNgqORZI4jmzfpsNK2EEsKpngSjFCE+god307cQuLp5h/GI=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb0fa44-7912-4816-50da-08d7218d4145
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 14:31:26.2113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vUXxVfC6R5XSpI18YzddQuITxDyEMUPWkHmbX6u8sjdI19N2KMkT8JRmpuNyLKKtw1U5T4vk9ByzHLNxgNbIMjzjgHDwmccPdURspv/E/14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1482
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JufUOxBFGSFy8tfgqPX8eRkinQKZ7ICx2Kz3EyhxF7I=;
 b=k2Je6gf7AO28y/NPJOBFUISY2ChgRmB244YhEYOsy0sQvNO8KMxk/JlvP2ll4o7EQ9+wvGR84ALENhTzaSpvN9uugoqxV7EK6OIWp8eigErnLwCN0+t8rmL/gZlbnSqWbca7TObxpIsOuoA6nk48wjO49uH7iHqGM1LTz4EY0Ls=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Simon Horman <horms@verge.net.au>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZywgaGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+
IEZyb206IGxpbnV4LWtlcm5lbC1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbC1v
d25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBMYXVyZW50IFBpbmNoYXJ0DQo+IFNl
bnQ6IDE1IEF1Z3VzdCAyMDE5IDE1OjE1DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy85XSBk
cm06IFJlbmFtZSBkcm1fYnJpZGdlX3RpbWluZ3MgdG8gZHJtX3RpbWluZ3MNCj4gDQo+IEhpIEdy
ZWcsDQo+IA0KPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwNDowNDowMFBNICswMjAwLCBHcmVn
IEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6MTg6
MzhQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPiA+IEhpIEZhYnJpemlvLA0K
PiA+ID4NCj4gPiA+IChDQydpbmcgR3JlZyBhcyB0aGUgYXJjaGl0ZWN0IG9mIHRoZSBTUERYIG1v
dmUpDQo+ID4NCj4gPiBfb25lIG9mXywgbm90IHRoZSBvbmUgdGhhdCBkaWQgdGhlIG1vc3Qgb2Yg
aGUgd29yaywgdGhhdCB3b3VsZCBiZSBUaG9tYXMgOikNCj4gPg0KPiA+ID4gT24gVGh1LCBBdWcg
MTUsIDIwMTkgYXQgMTI6MDQ6MjdQTSArMDEwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+
ID4gPiBUaGUgaW5mb3JtYXRpb24gcmVwcmVzZW50ZWQgYnkgZHJtX2JyaWRnZV90aW1pbmdzIGlz
IGFsc28NCj4gPiA+ID4gbmVlZGVkIGJ5IHBhbmVscywgdGhlcmVmb3JlIHJlbmFtZSBkcm1fYnJp
ZGdlX3RpbWluZ3MgdG8NCj4gPiA+ID4gZHJtX3RpbWluZ3MuDQo+ID4gPiA+DQo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMu
Y29tPg0KPiA+ID4gPiBMaW5rOiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1y
ZW5lc2FzLXNvYy9tc2c0MzI3MS5odG1sDQo+ID4gPiA+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2
MS0+djI6DQo+ID4gPiA+ICogbmV3IHBhdGNoDQo+ID4gPiA+DQo+ID4gPiA+IEkgaGF2ZSBjb3Bp
ZWQgdGhlIGxpY2Vuc2UgZnJvbSBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggYXMgdGhhdCdzDQo+
ID4gPiA+IHdoZXJlIHRoZSBzdHJ1Y3Qgb3JpZ2luYWxseSBjYW1lIGZyb20uIFdoYXQncyB0aGUg
cmlnaHQgU1BEWCBsaWNlbnNlDQo+ID4gPiA+IHRvIHVzZSBpbiB0aGlzIGNhc2U/DQo+ID4gPg0K
PiA+ID4gaHR0cHM6Ly93aWtpLnNwZHgub3JnL3ZpZXcvTGVnYWxfVGVhbS9EZWNpc2lvbnMvRGVh
bGluZ193aXRoX1B1YmxpY19Eb21haW5fd2l0aGluX1NQRFhfRmlsZXMNCj4gPiA+DQo+ID4gPiBH
cmVnLCBhbnkgaWRlYSBvbiBob3cgd2Ugc2hvdWxkIGhhbmRsZSB0aGlzID8NCj4gPg0KPiA+IFVn
aCwgd2hhdCBsdW5hY3kuICBCdXQgZHJtX2JyaWRnZS5oIGlzIE5PVCB1bmRlciBhbnkgInB1Ymxp
YyBkb21haW4iDQo+ID4gbGljZW5zZSwgc28gd2h5IGlzIHRoYXQgYW4gaXNzdWUgaGVyZT8gIFRo
aXMgbG9va3MgbGlrZSBhICJub3JtYWwiIGJzZCAzDQo+ID4gY2xhdXNlIGxpY2Vuc2UgdG8gbWUs
IHJpZ2h0Pw0KPiANCj4gWW91J3JlIHJpZ2h0LCBJIG92ZXJyZWFkIHBhcnQgb2YgdGhlIHRleHQg
aW4gZHJtX2JyaWRnZS5oLCBpdCBzZWVtcyB0bw0KPiBpbmRlZWQgYmUgY292ZXJlZCBieSBhIEJT
RCAzIGNsYXVzZSBsaWNlbnNlLiBTb3JyeSBmb3IgdGhlIG5vaXNlLg0KDQpNbW0uLi4gVGhpcyBp
cyB0aGUgdGVtcGxhdGUgZm9yIHRoZSBCU0QtMy1DbGF1c2U6DQoNCkNvcHlyaWdodCAoYykgPFlF
QVI+LCA8T1dORVI+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIA0KQWxsIHJpZ2h0cyByZXNlcnZlZC4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANClJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdp
dGggb3Igd2l0aG91dCBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0
aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMgYXJlIG1ldDoNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IA0KUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11c3QgcmV0YWluIHRoZSBhYm92ZSBj
b3B5cmlnaHQgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2lu
ZyBkaXNjbGFpbWVyLg0KUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBmb3JtIG11c3QgcmVwcm9k
dWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBh
bmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyIGluIHRoZSBkb2N1bWVudGF0aW9uIGFuZC9vciBv
dGhlciBtYXRlcmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0aW9uLg0KTmVpdGhlciB0
aGUgbmFtZSBvZiB0aGUgPE9SR0FOSVpBVElPTj4gbm9yIHRoZSBuYW1lcyBvZiBpdHMgY29udHJp
YnV0b3JzIG1heSBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cyBkZXJpdmVk
IGZyb20gdGhpcyBzb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljIHByaW9yIHdyaXR0ZW4gcGVybWlz
c2lvbi4NClRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBIT0xERVJT
IEFORCBDT05UUklCVVRPUlMgIkFTIElTIiBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJS
QU5USUVTLCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhFIElNUExJRUQgV0FSUkFO
VElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQ
T1NFIEFSRSBESVNDTEFJTUVELiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQ09QWVJJR0hUIEhPTERF
UiBPUiBDT05UUklCVVRPUlMgQkUgTElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5D
SURFTlRBTCwgU1BFQ0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElO
Q0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBPRiBTVUJTVElUVVRFIEdP
T0RTIE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1IgQlVTSU5F
U1MgSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksIE9SIFRPUlQgKElO
Q0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBP
RiBUSEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBUSEUgUE9TU0lC
SUxJVFkgT0YgU1VDSCBEQU1BR0UuDQoNCkFuZCB0aGlzIGlzIHRoZSBsaWNlbnNlIGNvbWluZyBm
cm9tIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaDoNCg0KLyogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICANCiAqIENvcHlyaWdodCAoYykgMjAxNiBJbnRlbCBDb3Jwb3Jh
dGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgDQogKiBQZXJtaXNzaW9uIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBkaXN0
cmlidXRlLCBhbmQgc2VsbCB0aGlzIHNvZnR3YXJlIGFuZCBpdHMgICANCiAqIGRvY3VtZW50YXRp
b24gZm9yIGFueSBwdXJwb3NlIGlzIGhlcmVieSBncmFudGVkIHdpdGhvdXQgZmVlLCBwcm92aWRl
ZCB0aGF0ICAgIA0KICogdGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYXBwZWFyIGluIGFsbCBj
b3BpZXMgYW5kIHRoYXQgYm90aCB0aGF0IGNvcHlyaWdodCAgDQogKiBub3RpY2UgYW5kIHRoaXMg
cGVybWlzc2lvbiBub3RpY2UgYXBwZWFyIGluIHN1cHBvcnRpbmcgZG9jdW1lbnRhdGlvbiwgYW5k
ICAgICANCiAqIHRoYXQgdGhlIG5hbWUgb2YgdGhlIGNvcHlyaWdodCBob2xkZXJzIG5vdCBiZSB1
c2VkIGluIGFkdmVydGlzaW5nIG9yICAgICAgICAgIA0KICogcHVibGljaXR5IHBlcnRhaW5pbmcg
dG8gZGlzdHJpYnV0aW9uIG9mIHRoZSBzb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljLCAgICAgICAg
DQogKiB3cml0dGVuIHByaW9yIHBlcm1pc3Npb24uICBUaGUgY29weXJpZ2h0IGhvbGRlcnMgbWFr
ZSBubyByZXByZXNlbnRhdGlvbnMgICAgICANCiAqIGFib3V0IHRoZSBzdWl0YWJpbGl0eSBvZiB0
aGlzIHNvZnR3YXJlIGZvciBhbnkgcHVycG9zZS4gIEl0IGlzIHByb3ZpZGVkICJhcyAgIA0KICog
aXMiIHdpdGhvdXQgZXhwcmVzcyBvciBpbXBsaWVkIHdhcnJhbnR5LiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgDQogKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAqIFRIRSBD
T1BZUklHSFQgSE9MREVSUyBESVNDTEFJTSBBTEwgV0FSUkFOVElFUyBXSVRIIFJFR0FSRCBUTyBU
SElTIFNPRlRXQVJFLCAgIA0KICogSU5DTFVESU5HIEFMTCBJTVBMSUVEIFdBUlJBTlRJRVMgT0Yg
TUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTLCBJTiBOTyAgICAgICAgDQogKiBFVkVOVCBTSEFM
TCBUSEUgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkgU1BFQ0lBTCwgSU5ESVJF
Q1QgT1IgICAgICANCiAqIENPTlNFUVVFTlRJQUwgREFNQUdFUyBPUiBBTlkgREFNQUdFUyBXSEFU
U09FVkVSIFJFU1VMVElORyBGUk9NIExPU1MgT0YgVVNFLCAgIA0KICogREFUQSBPUiBQUk9GSVRT
LCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgTkVHTElHRU5DRSBPUiBPVEhFUiAg
ICAgICAgDQogKiBUT1JUSU9VUyBBQ1RJT04sIEFSSVNJTkcgT1VUIE9GIE9SIElOIENPTk5FQ1RJ
T04gV0lUSCBUSEUgVVNFIE9SIFBFUkZPUk1BTkNFICANCiAqIE9GIFRISVMgU09GVFdBUkUuICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IA0KICovDQoNClBlcmhhcHMgSSBhbSBjb21wbGV0ZWx5IHdyb25nIGhlcmUsIGFuZCBJIGFtIG5v
dCBhIGxhd3llciwgYnV0IHRoZSB3b3JkaW5nIHNlZW1zIGRpZmZlcmVudCBlbm91Z2ggdG8gbWUu
Li4NCkkgYW0gaGFwcHkgdG8gdXNlICJCU0QtMy1DbGF1c2UiIHRob3VnaC4gTGF1cmVudCBwbGVh
c2UgZG91YmxlIGNoZWNrLg0KDQpUaGFua3MhDQpGYWINCg0KPiANCj4gPiBTbyBJIHdvdWxkIGp1
c3QgdXNlICJCU0QtMy1DbGF1c2UiIGFzIHRoZSBTUERYIGxpY2Vuc2UgaGVyZSwgaWYgSSB3ZXJl
DQo+ID4gZG9pbmcgdGhpcyBwYXRjaC4uLg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExh
dXJlbnQgUGluY2hhcnQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
