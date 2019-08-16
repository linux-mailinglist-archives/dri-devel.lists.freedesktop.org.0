Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C091166
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B14C6EA33;
	Sat, 17 Aug 2019 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400110.outbound.protection.outlook.com [40.107.140.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D7A6E2A4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 08:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DECPryo+Fb8+SXlBY8D8DcsI528bFmRB329cNJF3cthpJt2UTH48bQQmFxuiE2/QmdQx6AGSlsjHNTsJdJZqdo7PFnG9RLx5Z2bB2b/irFFS3BzAudK3AzgVEXfycJbW6XMHC53DI77VQOJJuyWCtZZZBDxDBwoPVHjdZQCByyM4sFcRB9Co6C8yRbervPbGFxUjb9yhdF1RQ5PayfmGOAoHE5DQQY/oxHDm91SLQNjAHMYbZ0OWyZ6u0ygX8FtPuBeXgm+DONItka1Gg3m3ETDOmXWKAWx2mdwTxsbAiz3RWT7rOFTANu0n2DPa3dOWs/cHvNTcfjXOO5Q6u/+wQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVCQgd/O+r6bO1RV2qsLx1yZnDhXj51rF1NMLFuKa1U=;
 b=SV7R5eryienWpvicH+53X3/DK7MxW8qMDyWaWKhDNLP1U3S6pd7t2q2QKhfP6BQBioAMOlLiXpW0+DjXG9Sz6fZqa17Dx4V/i4+rBNJIojMxa3CLFkDkPnfFZAhzeUCLw7neBG5UVgwkq1huAptQA7Z0qBPmEn1055LPAzrzWGBYPuPNEu8ZP8/FWIbg1uPpLHG0i3SAqpfDQrjY5TAGnom3+GvqIUXLTCJcGfDWjGapyB+NzFi+H/MUxNzyuw59N/tlVToofDauOVgQ1BpIqofvrZqllxBnpyY/Is1OTcCTutLsauYJmTjNRrvR+K6Nb+9KgLzRvZnI4nJy49C5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1498.jpnprd01.prod.outlook.com (52.133.161.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 08:11:25 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd%5]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 08:11:25 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Thread-Topic: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Thread-Index: AQHVU1lM9+L2miT/i0amqdy98WNy2qb8MTMAgAAMrQCAAAL7AIAAASrAgAAJiwCAADYegIAAEGwAgADa8KA=
Date: Fri, 16 Aug 2019 08:11:25 +0000
Message-ID: <TY1PR01MB17708449AC5C85C2A1FA6BC8C0AF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
 <20190815140400.GA7174@kroah.com>
 <20190815141440.GA20322@pendragon.ideasonboard.com>
 <TY1PR01MB1770404C560F6967FA81D521C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190815145300.GA15016@kroah.com>
 <20190815180641.GY5011@pendragon.ideasonboard.com>
 <20190815190528.GA14835@kroah.com>
In-Reply-To: <20190815190528.GA14835@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37c7617c-4dd7-401f-aea8-08d722215547
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1498; 
x-ms-traffictypediagnostic: TY1PR01MB1498:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB14988DD75324CB1A6C63E59CC0AF0@TY1PR01MB1498.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(199004)(189003)(305945005)(478600001)(6306002)(102836004)(229853002)(6436002)(66066001)(7416002)(52536014)(9686003)(8936002)(55016002)(7736002)(33656002)(66446008)(76116006)(66476007)(5660300002)(64756008)(74316002)(66946007)(53546011)(71190400001)(44832011)(446003)(966005)(186003)(86362001)(81156014)(8676002)(66556008)(110136005)(14454004)(11346002)(486006)(7696005)(81166006)(26005)(6506007)(53936002)(476003)(3846002)(6116002)(71200400001)(316002)(6246003)(25786009)(76176011)(256004)(2906002)(54906003)(14444005)(4326008)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1498;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HXtxxZRtAvC0ezMJSKoDSX+KpGQxUPrW3OzQYajkhMpvDJKL/MI3X2Drkb2hAjidZZ0hQ0QGfSiyL7oSv7CVFCF30sqssR+4PZMzKPSPx+41seNizqBLvUmGXGCQRswRzFyZUnNKxH8JeGmmOVfEE+WaYbi27lMFTbYeHGEt3UNMndX1SWp2FG54kskIRbPyJWBS7oPmeKLi35gobYwl8TqWWoSwkgI0QTebzb2u9+hrpKa1PFPT8TVkSFUrc0DPnRplJ2hFVF+eqEBWFCquwMEkDh530FzogtCFDYwaQ/jnFlD0/u3WZA7Bj54/INdG06uum3AVWuwmNTqN45Ze8+h4mskRQSVIZa4No6dJxfhvrhj91cLQKG8lKj09f1TsiGXkUvYf+Ur9g+9oe++eV8uPnRCuBqimbD6nEmRg+LY=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c7617c-4dd7-401f-aea8-08d722215547
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 08:11:25.4052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dv38HUze45J7jfrtu9JssC+LRIpWLLqOPuxy/fTrymCTrmXhKI4bCzz8s/EEwPDzKwnz6gYf8Q+xfRpEYpwhnDE9Jk5sIq2SzQIn4EP3OQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1498
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVCQgd/O+r6bO1RV2qsLx1yZnDhXj51rF1NMLFuKa1U=;
 b=P3B4zYorC5hCW/bQUlg3IJHAx+1eVDcirv8XY/oXTSkSB9CRtLEz0gADOc3JZEP3PPDVcHRULOEmz9mC5CxZl0qQPqtWTYCHtb3y8muId+46dkBPLIc4VSVA5zfUJJDKRRPwptcphdqRZFSm1dJo82E9sID3KLAlbLVXeBqqMiE=
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

SGkgR3JlZywgaGkgTGF1cmVudCwKCj4gRnJvbTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4KPiBTZW50OiAxNSBBdWd1c3QgMjAxOSAyMDowNQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMy85XSBkcm06IFJlbmFtZSBkcm1fYnJpZGdlX3RpbWluZ3MgdG8g
ZHJtX3RpbWluZ3MKPiAKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwOTowNjo0MVBNICswMzAw
LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gSGkgR3JlZywKPiA+Cj4gPiBPbiBUaHUsIEF1
ZyAxNSwgMjAxOSBhdCAwNDo1MzowMFBNICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6
Cj4gPiA+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDAyOjMxOjI2UE0gKzAwMDAsIEZhYnJpemlv
IENhc3RybyB3cm90ZToKPiA+ID4gPiBPbiAxNSBBdWd1c3QgMjAxOSAxNToxNSwgTGF1cmVudCBQ
aW5jaGFydCB3cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA0OjA0OjAw
UE0gKzAyMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gVGh1LCBB
dWcgMTUsIDIwMTkgYXQgMDQ6MTg6MzhQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToK
PiA+ID4gPiA+ID4gPiBIaSBGYWJyaXppbywKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IChD
QydpbmcgR3JlZyBhcyB0aGUgYXJjaGl0ZWN0IG9mIHRoZSBTUERYIG1vdmUpCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IF9vbmUgb2ZfLCBub3QgdGhlIG9uZSB0aGF0IGRpZCB0aGUgbW9zdCBvZiBo
ZSB3b3JrLCB0aGF0IHdvdWxkIGJlIFRob21hcyA6KQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEyOjA0OjI3UE0gKzAxMDAsIEZhYnJpemlvIENhc3Ry
byB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IFRoZSBpbmZvcm1hdGlvbiByZXByZXNlbnRlZCBieSBk
cm1fYnJpZGdlX3RpbWluZ3MgaXMgYWxzbwo+ID4gPiA+ID4gPiA+ID4gbmVlZGVkIGJ5IHBhbmVs
cywgdGhlcmVmb3JlIHJlbmFtZSBkcm1fYnJpZGdlX3RpbWluZ3MgdG8KPiA+ID4gPiA+ID4gPiA+
IGRybV90aW1pbmdzLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+ID4g
PiA+ID4gPiA+ID4gTGluazogaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtcmVu
ZXNhcy1zb2MvbXNnNDMyNzEuaHRtbAo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IC0t
LQo+ID4gPiA+ID4gPiA+ID4gdjEtPnYyOgo+ID4gPiA+ID4gPiA+ID4gKiBuZXcgcGF0Y2gKPiA+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBJIGhhdmUgY29waWVkIHRoZSBsaWNlbnNlIGZy
b20gaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGFzIHRoYXQncwo+ID4gPiA+ID4gPiA+ID4gd2hl
cmUgdGhlIHN0cnVjdCBvcmlnaW5hbGx5IGNhbWUgZnJvbS4gV2hhdCdzIHRoZSByaWdodCBTUERY
IGxpY2Vuc2UKPiA+ID4gPiA+ID4gPiA+IHRvIHVzZSBpbiB0aGlzIGNhc2U/Cj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBodHRwczovL3dpa2kuc3BkeC5vcmcvdmlldy9MZWdhbF9UZWFtL0Rl
Y2lzaW9ucy9EZWFsaW5nX3dpdGhfUHVibGljX0RvbWFpbl93aXRoaW5fU1BEWF9GaWxlcwo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gR3JlZywgYW55IGlkZWEgb24gaG93IHdlIHNob3VsZCBo
YW5kbGUgdGhpcyA/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFVnaCwgd2hhdCBsdW5hY3kuICBC
dXQgZHJtX2JyaWRnZS5oIGlzIE5PVCB1bmRlciBhbnkgInB1YmxpYyBkb21haW4iCj4gPiA+ID4g
PiA+IGxpY2Vuc2UsIHNvIHdoeSBpcyB0aGF0IGFuIGlzc3VlIGhlcmU/ICBUaGlzIGxvb2tzIGxp
a2UgYSAibm9ybWFsIiBic2QgMwo+ID4gPiA+ID4gPiBjbGF1c2UgbGljZW5zZSB0byBtZSwgcmln
aHQ/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gWW91J3JlIHJpZ2h0LCBJIG92ZXJyZWFkIHBhcnQgb2Yg
dGhlIHRleHQgaW4gZHJtX2JyaWRnZS5oLCBpdCBzZWVtcyB0bwo+ID4gPiA+ID4gaW5kZWVkIGJl
IGNvdmVyZWQgYnkgYSBCU0QgMyBjbGF1c2UgbGljZW5zZS4gU29ycnkgZm9yIHRoZSBub2lzZS4K
PiA+ID4gPgo+ID4gPiA+IE1tbS4uLiBUaGlzIGlzIHRoZSB0ZW1wbGF0ZSBmb3IgdGhlIEJTRC0z
LUNsYXVzZToKPiA+ID4gPgo+ID4gPiA+IENvcHlyaWdodCAoYykgPFlFQVI+LCA8T1dORVI+Cj4g
PiA+ID4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPiA+ID4gPgo+ID4gPiA+IFJlZGlzdHJpYnV0aW9u
IGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dCBtb2Rp
ZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nCj4gY29u
ZGl0aW9ucyBhcmUgbWV0Ogo+ID4gPiA+Cj4gPiA+ID4gUmVkaXN0cmlidXRpb25zIG9mIHNvdXJj
ZSBjb2RlIG11c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlLCB0aGlzIGxpc3Qg
b2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgo+ID4gPiA+IFJlZGlz
dHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJp
Z2h0IG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlz
Y2xhaW1lciBpbgo+IHRoZSBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMgcHJv
dmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0aW9uLgo+ID4gPiA+IE5laXRoZXIgdGhlIG5hbWUgb2Yg
dGhlIDxPUkdBTklaQVRJT04+IG5vciB0aGUgbmFtZXMgb2YgaXRzIGNvbnRyaWJ1dG9ycyBtYXkg
YmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMKPiBkZXJpdmVkIGZyb20gdGhp
cyBzb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljIHByaW9yIHdyaXR0ZW4gcGVybWlzc2lvbi4KPiA+
ID4gPiBUSElTIFNPRlRXQVJFIElTIFBST1ZJREVEIEJZIFRIRSBDT1BZUklHSFQgSE9MREVSUyBB
TkQgQ09OVFJJQlVUT1JTICJBUyBJUyIgQU5EIEFOWSBFWFBSRVNTIE9SIElNUExJRUQKPiBXQVJS
QU5USUVTLCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhFIElNUExJRUQgV0FSUkFO
VElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUgo+IFBV
UlBPU0UgQVJFIERJU0NMQUlNRUQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBDT1BZUklHSFQgSE9M
REVSIE9SIENPTlRSSUJVVE9SUyBCRSBMSUFCTEUgRk9SIEFOWSBESVJFQ1QsIElORElSRUNULAo+
IElOQ0lERU5UQUwsIFNQRUNJQUwsIEVYRU1QTEFSWSwgT1IgQ09OU0VRVUVOVElBTCBEQU1BR0VT
IChJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YKPiBTVUJTVElU
VVRFIEdPT0RTIE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1Ig
QlVTSU5FU1MgSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZCj4gVEhFT1JZ
IE9GIExJQUJJTElUWSwgV0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNUIExJQUJJTElUWSwgT1Ig
VE9SVCAoSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKSBBUklTSU5HIElOIEFOWQo+
IFdBWSBPVVQgT0YgVEhFIFVTRSBPRiBUSElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0Yg
VEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgo+ID4gPiA+Cj4gPiA+ID4gQW5kIHRoaXMg
aXMgdGhlIGxpY2Vuc2UgY29taW5nIGZyb20gaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oOgo+ID4g
PiA+Cj4gPiA+ID4gLyoKPiA+ID4gPiAgKiBDb3B5cmlnaHQgKGMpIDIwMTYgSW50ZWwgQ29ycG9y
YXRpb24KPiA+ID4gPiAgKgo+ID4gPiA+ICAqIFBlcm1pc3Npb24gdG8gdXNlLCBjb3B5LCBtb2Rp
ZnksIGRpc3RyaWJ1dGUsIGFuZCBzZWxsIHRoaXMgc29mdHdhcmUgYW5kIGl0cwo+ID4gPiA+ICAq
IGRvY3VtZW50YXRpb24gZm9yIGFueSBwdXJwb3NlIGlzIGhlcmVieSBncmFudGVkIHdpdGhvdXQg
ZmVlLCBwcm92aWRlZCB0aGF0Cj4gPiA+ID4gICogdGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2Ug
YXBwZWFyIGluIGFsbCBjb3BpZXMgYW5kIHRoYXQgYm90aCB0aGF0IGNvcHlyaWdodAo+ID4gPiA+
ICAqIG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBhcHBlYXIgaW4gc3VwcG9ydGlu
ZyBkb2N1bWVudGF0aW9uLCBhbmQKPiA+ID4gPiAgKiB0aGF0IHRoZSBuYW1lIG9mIHRoZSBjb3B5
cmlnaHQgaG9sZGVycyBub3QgYmUgdXNlZCBpbiBhZHZlcnRpc2luZyBvcgo+ID4gPiA+ICAqIHB1
YmxpY2l0eSBwZXJ0YWluaW5nIHRvIGRpc3RyaWJ1dGlvbiBvZiB0aGUgc29mdHdhcmUgd2l0aG91
dCBzcGVjaWZpYywKPiA+ID4gPiAgKiB3cml0dGVuIHByaW9yIHBlcm1pc3Npb24uICBUaGUgY29w
eXJpZ2h0IGhvbGRlcnMgbWFrZSBubyByZXByZXNlbnRhdGlvbnMKPiA+ID4gPiAgKiBhYm91dCB0
aGUgc3VpdGFiaWxpdHkgb2YgdGhpcyBzb2Z0d2FyZSBmb3IgYW55IHB1cnBvc2UuICBJdCBpcyBw
cm92aWRlZCAiYXMKPiA+ID4gPiAgKiBpcyIgd2l0aG91dCBleHByZXNzIG9yIGltcGxpZWQgd2Fy
cmFudHkuCj4gPiA+ID4gICoKPiA+ID4gPiAgKiBUSEUgQ09QWVJJR0hUIEhPTERFUlMgRElTQ0xB
SU0gQUxMIFdBUlJBTlRJRVMgV0lUSCBSRUdBUkQgVE8gVEhJUyBTT0ZUV0FSRSwKPiA+ID4gPiAg
KiBJTkNMVURJTkcgQUxMIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5E
IEZJVE5FU1MsIElOIE5PCj4gPiA+ID4gICogRVZFTlQgU0hBTEwgVEhFIENPUFlSSUdIVCBIT0xE
RVJTIEJFIExJQUJMRSBGT1IgQU5ZIFNQRUNJQUwsIElORElSRUNUIE9SCj4gPiA+ID4gICogQ09O
U0VRVUVOVElBTCBEQU1BR0VTIE9SIEFOWSBEQU1BR0VTIFdIQVRTT0VWRVIgUkVTVUxUSU5HIEZS
T00gTE9TUyBPRiBVU0UsCj4gPiA+ID4gICogREFUQSBPUiBQUk9GSVRTLCBXSEVUSEVSIElOIEFO
IEFDVElPTiBPRiBDT05UUkFDVCwgTkVHTElHRU5DRSBPUiBPVEhFUgo+ID4gPiA+ICAqIFRPUlRJ
T1VTIEFDVElPTiwgQVJJU0lORyBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBVU0Ug
T1IgUEVSRk9STUFOQ0UKPiA+ID4gPiAgKiBPRiBUSElTIFNPRlRXQVJFLgo+ID4gPiA+ICAqLwo+
ID4gPiA+Cj4gPiA+ID4gUGVyaGFwcyBJIGFtIGNvbXBsZXRlbHkgd3JvbmcgaGVyZSwgYW5kIEkg
YW0gbm90IGEgbGF3eWVyLCBidXQgdGhlIHdvcmRpbmcgc2VlbXMgZGlmZmVyZW50IGVub3VnaCB0
byBtZS4uLgo+ID4gPiA+IEkgYW0gaGFwcHkgdG8gdXNlICJCU0QtMy1DbGF1c2UiIHRob3VnaC4g
TGF1cmVudCBwbGVhc2UgZG91YmxlIGNoZWNrLgo+ID4gPgo+ID4gPiBQbGVhc2UgdGFsayB0byB5
b3VyIGxhd3llcnMgYWJvdXQgdGhpcywgd2UgYXJlIG5vdCB0aGVtLi4uCj4gPgo+ID4gSSBkb24n
dCB0aGluayB0aGF0J3MgZmFpciB0aG91Z2guIEZhYnJpemlvIGlzIHJld29ya2luZyBrZXJuZWwg
Y29kZSwgYW5kCj4gPiBhcyBwYXJ0IG9mIHRoYXQgd29uZGVyZWQgd2hhdCBTUERYIHRhZyB0byBh
cHBseSB0byBhIG5ldyBmaWxlIHRoYXQKPiA+IGNvbnRhaW5zIGNvZGUgbW92ZWQgZnJvbSBhbiBl
eGlzdGluZyBmaWxlIHRoYXQgaGFzIG5vIFNQRFggdGFnLCBidXQgdGhlCj4gPiBhYm92ZSBjb3B5
cmlnaHQgbm90aWNlLiBIZSdzIG5vdCB0cnlpbmcgdG8gY2hhbmdlIGEgbGljZW5zZSwgb3IgcmV3
b3JkCj4gPiBpdC4gQXMgU1BEWCBpcyB0aGUgcHJlZmVycmVkIHdheSBvZiBleHByZXNzaW5nIGxp
Y2Vuc2VzIGluIHRoZSBrZXJuZWwsCj4gPiBoZSBsZWdpdGltYXRlbHkgYXNrZWQgZm9yIGhlbHAs
IGFuZCBJIHRoaW5rIHdlIHNob3VsZCBwcm92aWRlIGFuCj4gPiBvZmZpY2lhbCBhbnN3ZXIgZm9y
IHRoaXMgKHdoaWNoIGNvdWxkIGJlIG5vdCB0byB1c2UgU1BEWCBidXQgY29weSB0aGUKPiA+IGxp
Y2Vuc2UgdGV4dCkuCj4gCj4gQWgsIG9rLCB0aGF0IG1ha2VzIG1vcmUgc2Vuc2UsIGRpZG4ndCBy
ZWFsaXplIHRoYXQuCj4gCj4gRmFicml6aW8sIGp1c3QgY29weSB0aGUgbGljZW5zZSB0ZXh0IGFz
LWlzIHRvIHRoZSBuZXcgZmlsZSBpZiB5b3UgYXJlCj4gY29weWluZyBmcm9tIGFuIGV4aXN0aW5n
IG9uZS4gIEZvciBhbGwgb2YgdGhlc2UgIndlIGhhdmUgdG8gcmVhZCB0aGUKPiB0ZXh0IiBmaWxl
cyB0aGF0IGFyZSBsZWZ0IGluIHRoZSBrZXJuZWwsIHdlIHN0aWxsIGhhdmUgYSB3YXlzIHRvIGdv
IHRvCj4gY29udmVydCB0aGVtLiAgQnV0LCBpZiB5b3UgbGVhdmUgdGhlIHRleHQgaWRlbnRpY2Fs
LCB3aGVuIHdlIG1hdGNoIG9uZQo+IGFuZCBmaXggaXQsIHRoZSB0b29scyB3aWxsIGNhdGNoIHRo
ZSBvdGhlciBpZGVudGljYWwgb25lcyBhcyB3ZWxsLCBzbwo+IHRoYXQgZG9lcyBub3QgY3JlYXRl
IGFueSBleHRyYSB3b3JrLgo+IAo+IGhvcGUgdGhpcyBoZWxwcywKCkl0IGRvZXMhIFRoYW5rIHlv
dSBib3RoIGd1eXMhCgpDaGVlcnMsCkZhYgoKPiAKPiBncmVnIGstaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
