Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4B091170
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355AF6E9F9;
	Sat, 17 Aug 2019 15:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400139.outbound.protection.outlook.com [40.107.140.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DA36E9DF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 15:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC/N8NW69QVyJ5oChT4ro3Dxuh8uy0Ir6H6zc5jSm8ij+RWA2YmL7OaufQMXl9XTEX5+9liCkuU1p3BfYL2aQIte7++NRZGLhyerMJuYz9uCVWE046GQR88Gw7d68Fr+zjbhRb7RC1UJ77jWx3O6iMH/pyvzrZGb0HYcGH2AbfmqONKLlq2MI5zJSRsD++p4e7YVeewNgr13ft3h499kCmZbBAYUU8U8if6CQZjb4VdMLpVsE3gT7Qq/NlVrNHnk9AVb3Bg7e2g9yVrDcFFu/ADngPA3/uxafbpse5Vf3cwmwGnuNsbTAQfnr6kI0YsU1Gfq9iTIlwja5gfvqgNDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXGUA2JogWOLFE2PJ6GSAFG+qu+o5RBJL7qBImXb0zo=;
 b=h7lBzMO/P7ByP8XiOLcGuUWSmQQ6RO0Q0N7fkiau/9xzr4Fv743b/zIgxpj7BjLIaiGpcPWIMSIE0e9tyJE34lm/MKEO121ss1qNRFPXKggWl87sB3WukorkuV0fh5EYPn5IC4/QsvjKIYBMkUsJ/MWVkqHHT5nc4s/TDladqfy/PfYI/wQBEw2rgZLLhF1Cx53lyyudZWcPYc+QHsGALsH4kmtz4vHNOWxK72hSEH9GOcbPeTeq6Xg27mNgdqqFavo6vC5sM4XoDZU/AroyNZTYn4PpIOx0S+5I5myHHjJGByeoj6zw8Eqjzu8slZjE3t4KkYGU6RscV0IKZoovyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1596.jpnprd01.prod.outlook.com (52.133.162.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 15 Aug 2019 15:01:44 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 15:01:44 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Thread-Topic: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Thread-Index: AQHVU1lM9+L2miT/i0amqdy98WNy2qb8MTMAgAAMrQCAAAL7AIAAASrAgAAJiwCAAACe0A==
Date: Thu, 15 Aug 2019 15:01:43 +0000
Message-ID: <TY1PR01MB177014EDD97819824C163F36C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
 <20190815140400.GA7174@kroah.com>
 <20190815141440.GA20322@pendragon.ideasonboard.com>
 <TY1PR01MB1770404C560F6967FA81D521C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190815145300.GA15016@kroah.com>
In-Reply-To: <20190815145300.GA15016@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eff8ff50-8c27-468a-5848-08d721917ca2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1596; 
x-ms-traffictypediagnostic: TY1PR01MB1596:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB159675706F14FA3EE0B51594C0AC0@TY1PR01MB1596.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(81166006)(76116006)(64756008)(476003)(66476007)(55016002)(66556008)(11346002)(81156014)(186003)(446003)(66946007)(6916009)(52536014)(26005)(5660300002)(86362001)(4326008)(53936002)(102836004)(9686003)(6306002)(486006)(8936002)(66446008)(74316002)(6246003)(53546011)(478600001)(66066001)(316002)(6506007)(25786009)(8676002)(7696005)(305945005)(99286004)(3846002)(44832011)(2906002)(54906003)(256004)(6436002)(229853002)(7416002)(7736002)(14444005)(6116002)(14454004)(71190400001)(76176011)(71200400001)(966005)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1596;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KiRZHup8bNKAh15iWEo3E/ljcaWcYWV26thAD7UdICWC4W6x2hh32UZSYfplGscYOUQ2Cp/sT52MPoXbMqGl9TXbl19aeC93oelxh3goV2OhK1rRw1mRjDUn3gEFMIuY9+0fQtiZnh51i1j2V6AGrcM63+ETidVxnIg+ntHDuYwVpXpzPtFRZsZL+CbEZ8PbmdszUgPUzkRVkm8geNiGD+a6hbbODDshWef5rMhDl8xfn0GkkvTlUzBYVNbVg/3MGEOpQsZcsOMeDUKDGl+SvVlSOWYwHyGGcoqnqcc2VCdf0P/BUHwtR4VyqsFwxZlTpVmh+5i7TFKasJLs83jGH8iPTdFgeMEva37aL6HcF7+5GkxpSRuLBs7iuG+QZFX8e6vGP1eh6q7RdCGPwBZja2/VPzC94YmKCtk8XkxCwlM=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff8ff50-8c27-468a-5848-08d721917ca2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 15:01:43.8135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rx5IOwulmj/jTaxkShwIhWzGkx9xLBsz9T2m/VxjJBM2xrnzxNp9f2kkGfNro0dhKUXNP82QGQV3sVxrMtX4oRFcmNtez4a0h0b5H6W8f3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1596
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXGUA2JogWOLFE2PJ6GSAFG+qu+o5RBJL7qBImXb0zo=;
 b=IIaJ0nIrn78qV0Xn1IDqLuQ7kGo459yQWFiObBK7GbtsC4m2KLsq/JXGdGHi/GYYuBoEMPKUMOd99gnMiZc+tPlUcraF1v4ByAPBnOKWQpUI23uZKPQWizCEXf6R8JJNOUBR3WWkX6F2Ir21Uc26XYqkXhG69X04l4K9MDx/1Ec=
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZywgaGkgTGF1cmVudCwKClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayEKCj4gRnJv
bTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBTZW50
OiAxNSBBdWd1c3QgMjAxOSAxNTo1Mwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy85XSBkcm06
IFJlbmFtZSBkcm1fYnJpZGdlX3RpbWluZ3MgdG8gZHJtX3RpbWluZ3MKPiAKPiBPbiBUaHUsIEF1
ZyAxNSwgMjAxOSBhdCAwMjozMToyNlBNICswMDAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4g
PiBIaSBHcmVnLCBoaSBMYXVyZW50LAo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFj
ayEKPiA+Cj4gPiA+IEZyb206IGxpbnV4LWtlcm5lbC1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxp
bnV4LWtlcm5lbC1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBMYXVyZW50IFBp
bmNoYXJ0Cj4gPiA+IFNlbnQ6IDE1IEF1Z3VzdCAyMDE5IDE1OjE1Cj4gPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMy85XSBkcm06IFJlbmFtZSBkcm1fYnJpZGdlX3RpbWluZ3MgdG8gZHJtX3Rp
bWluZ3MKPiA+ID4KPiA+ID4gSGkgR3JlZywKPiA+ID4KPiA+ID4gT24gVGh1LCBBdWcgMTUsIDIw
MTkgYXQgMDQ6MDQ6MDBQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4gPiA+
IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA0OjE4OjM4UE0gKzAzMDAsIExhdXJlbnQgUGluY2hh
cnQgd3JvdGU6Cj4gPiA+ID4gPiBIaSBGYWJyaXppbywKPiA+ID4gPiA+Cj4gPiA+ID4gPiAoQ0Mn
aW5nIEdyZWcgYXMgdGhlIGFyY2hpdGVjdCBvZiB0aGUgU1BEWCBtb3ZlKQo+ID4gPiA+Cj4gPiA+
ID4gX29uZSBvZl8sIG5vdCB0aGUgb25lIHRoYXQgZGlkIHRoZSBtb3N0IG9mIGhlIHdvcmssIHRo
YXQgd291bGQgYmUgVGhvbWFzIDopCj4gPiA+ID4KPiA+ID4gPiA+IE9uIFRodSwgQXVnIDE1LCAy
MDE5IGF0IDEyOjA0OjI3UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiA+ID4gPiA+
ID4gVGhlIGluZm9ybWF0aW9uIHJlcHJlc2VudGVkIGJ5IGRybV9icmlkZ2VfdGltaW5ncyBpcyBh
bHNvCj4gPiA+ID4gPiA+IG5lZWRlZCBieSBwYW5lbHMsIHRoZXJlZm9yZSByZW5hbWUgZHJtX2Jy
aWRnZV90aW1pbmdzIHRvCj4gPiA+ID4gPiA+IGRybV90aW1pbmdzLgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0Bi
cC5yZW5lc2FzLmNvbT4KPiA+ID4gPiA+ID4gTGluazogaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQv
bGlzdHMvbGludXgtcmVuZXNhcy1zb2MvbXNnNDMyNzEuaHRtbAo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiAtLS0KPiA+ID4gPiA+ID4gdjEtPnYyOgo+ID4gPiA+ID4gPiAqIG5ldyBwYXRjaAo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBJIGhhdmUgY29waWVkIHRoZSBsaWNlbnNlIGZyb20gaW5jbHVk
ZS9kcm0vZHJtX2JyaWRnZS5oIGFzIHRoYXQncwo+ID4gPiA+ID4gPiB3aGVyZSB0aGUgc3RydWN0
IG9yaWdpbmFsbHkgY2FtZSBmcm9tLiBXaGF0J3MgdGhlIHJpZ2h0IFNQRFggbGljZW5zZQo+ID4g
PiA+ID4gPiB0byB1c2UgaW4gdGhpcyBjYXNlPwo+ID4gPiA+ID4KPiA+ID4gPiA+IGh0dHBzOi8v
d2lraS5zcGR4Lm9yZy92aWV3L0xlZ2FsX1RlYW0vRGVjaXNpb25zL0RlYWxpbmdfd2l0aF9QdWJs
aWNfRG9tYWluX3dpdGhpbl9TUERYX0ZpbGVzCj4gPiA+ID4gPgo+ID4gPiA+ID4gR3JlZywgYW55
IGlkZWEgb24gaG93IHdlIHNob3VsZCBoYW5kbGUgdGhpcyA/Cj4gPiA+ID4KPiA+ID4gPiBVZ2gs
IHdoYXQgbHVuYWN5LiAgQnV0IGRybV9icmlkZ2UuaCBpcyBOT1QgdW5kZXIgYW55ICJwdWJsaWMg
ZG9tYWluIgo+ID4gPiA+IGxpY2Vuc2UsIHNvIHdoeSBpcyB0aGF0IGFuIGlzc3VlIGhlcmU/ICBU
aGlzIGxvb2tzIGxpa2UgYSAibm9ybWFsIiBic2QgMwo+ID4gPiA+IGNsYXVzZSBsaWNlbnNlIHRv
IG1lLCByaWdodD8KPiA+ID4KPiA+ID4gWW91J3JlIHJpZ2h0LCBJIG92ZXJyZWFkIHBhcnQgb2Yg
dGhlIHRleHQgaW4gZHJtX2JyaWRnZS5oLCBpdCBzZWVtcyB0bwo+ID4gPiBpbmRlZWQgYmUgY292
ZXJlZCBieSBhIEJTRCAzIGNsYXVzZSBsaWNlbnNlLiBTb3JyeSBmb3IgdGhlIG5vaXNlLgo+ID4K
PiA+IE1tbS4uLiBUaGlzIGlzIHRoZSB0ZW1wbGF0ZSBmb3IgdGhlIEJTRC0zLUNsYXVzZToKPiA+
Cj4gPiBDb3B5cmlnaHQgKGMpIDxZRUFSPiwgPE9XTkVSPgo+ID4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KPiA+Cj4gPiBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZv
cm1zLCB3aXRoIG9yIHdpdGhvdXQgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVk
IHRoYXQgdGhlIGZvbGxvd2luZwo+IGNvbmRpdGlvbnMgYXJlIG1ldDoKPiA+Cj4gPiBSZWRpc3Ry
aWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodCBu
b3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWlt
ZXIuCj4gPiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhl
IGFib3ZlIGNvcHlyaWdodCBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUg
Zm9sbG93aW5nIGRpc2NsYWltZXIgaW4gdGhlCj4gZG9jdW1lbnRhdGlvbiBhbmQvb3Igb3RoZXIg
bWF0ZXJpYWxzIHByb3ZpZGVkIHdpdGggdGhlIGRpc3RyaWJ1dGlvbi4KPiA+IE5laXRoZXIgdGhl
IG5hbWUgb2YgdGhlIDxPUkdBTklaQVRJT04+IG5vciB0aGUgbmFtZXMgb2YgaXRzIGNvbnRyaWJ1
dG9ycyBtYXkgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMgZGVyaXZlZAo+
IGZyb20gdGhpcyBzb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljIHByaW9yIHdyaXR0ZW4gcGVybWlz
c2lvbi4KPiA+IFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBIT0xE
RVJTIEFORCBDT05UUklCVVRPUlMgIkFTIElTIiBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRAo+
IFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUgSU1QTElFRCBX
QVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFS
Cj4gUFVSUE9TRSBBUkUgRElTQ0xBSU1FRC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFIENPUFlSSUdI
VCBIT0xERVIgT1IgQ09OVFJJQlVUT1JTIEJFIExJQUJMRSBGT1IgQU5ZIERJUkVDVCwgSU5ESVJF
Q1QsCj4gSU5DSURFTlRBTCwgU1BFQ0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERB
TUFHRVMgKElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBPRgo+IFNV
QlNUSVRVVEUgR09PRFMgT1IgU0VSVklDRVM7IExPU1MgT0YgVVNFLCBEQVRBLCBPUiBQUk9GSVRT
OyBPUiBCVVNJTkVTUyBJTlRFUlJVUFRJT04pIEhPV0VWRVIgQ0FVU0VEIEFORCBPTiBBTlkKPiBU
SEVPUlkgT0YgTElBQklMSVRZLCBXSEVUSEVSIElOIENPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZ
LCBPUiBUT1JUIChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4g
QU5ZCj4gV0FZIE9VVCBPRiBUSEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNF
RCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCj4gPgo+ID4gQW5kIHRoaXMgaXMg
dGhlIGxpY2Vuc2UgY29taW5nIGZyb20gaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oOgo+ID4KPiA+
IC8qCj4gPiAgKiBDb3B5cmlnaHQgKGMpIDIwMTYgSW50ZWwgQ29ycG9yYXRpb24KPiA+ICAqCj4g
PiAgKiBQZXJtaXNzaW9uIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBkaXN0cmlidXRlLCBhbmQgc2Vs
bCB0aGlzIHNvZnR3YXJlIGFuZCBpdHMKPiA+ICAqIGRvY3VtZW50YXRpb24gZm9yIGFueSBwdXJw
b3NlIGlzIGhlcmVieSBncmFudGVkIHdpdGhvdXQgZmVlLCBwcm92aWRlZCB0aGF0Cj4gPiAgKiB0
aGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhcHBlYXIgaW4gYWxsIGNvcGllcyBhbmQgdGhhdCBi
b3RoIHRoYXQgY29weXJpZ2h0Cj4gPiAgKiBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3Rp
Y2UgYXBwZWFyIGluIHN1cHBvcnRpbmcgZG9jdW1lbnRhdGlvbiwgYW5kCj4gPiAgKiB0aGF0IHRo
ZSBuYW1lIG9mIHRoZSBjb3B5cmlnaHQgaG9sZGVycyBub3QgYmUgdXNlZCBpbiBhZHZlcnRpc2lu
ZyBvcgo+ID4gICogcHVibGljaXR5IHBlcnRhaW5pbmcgdG8gZGlzdHJpYnV0aW9uIG9mIHRoZSBz
b2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljLAo+ID4gICogd3JpdHRlbiBwcmlvciBwZXJtaXNzaW9u
LiAgVGhlIGNvcHlyaWdodCBob2xkZXJzIG1ha2Ugbm8gcmVwcmVzZW50YXRpb25zCj4gPiAgKiBh
Ym91dCB0aGUgc3VpdGFiaWxpdHkgb2YgdGhpcyBzb2Z0d2FyZSBmb3IgYW55IHB1cnBvc2UuICBJ
dCBpcyBwcm92aWRlZCAiYXMKPiA+ICAqIGlzIiB3aXRob3V0IGV4cHJlc3Mgb3IgaW1wbGllZCB3
YXJyYW50eS4KPiA+ICAqCj4gPiAgKiBUSEUgQ09QWVJJR0hUIEhPTERFUlMgRElTQ0xBSU0gQUxM
IFdBUlJBTlRJRVMgV0lUSCBSRUdBUkQgVE8gVEhJUyBTT0ZUV0FSRSwKPiA+ICAqIElOQ0xVRElO
RyBBTEwgSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUywg
SU4gTk8KPiA+ICAqIEVWRU5UIFNIQUxMIFRIRSBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUg
Rk9SIEFOWSBTUEVDSUFMLCBJTkRJUkVDVCBPUgo+ID4gICogQ09OU0VRVUVOVElBTCBEQU1BR0VT
IE9SIEFOWSBEQU1BR0VTIFdIQVRTT0VWRVIgUkVTVUxUSU5HIEZST00gTE9TUyBPRiBVU0UsCj4g
PiAgKiBEQVRBIE9SIFBST0ZJVFMsIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBO
RUdMSUdFTkNFIE9SIE9USEVSCj4gPiAgKiBUT1JUSU9VUyBBQ1RJT04sIEFSSVNJTkcgT1VUIE9G
IE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgVVNFIE9SIFBFUkZPUk1BTkNFCj4gPiAgKiBPRiBU
SElTIFNPRlRXQVJFLgo+ID4gICovCj4gPgo+ID4gUGVyaGFwcyBJIGFtIGNvbXBsZXRlbHkgd3Jv
bmcgaGVyZSwgYW5kIEkgYW0gbm90IGEgbGF3eWVyLCBidXQgdGhlIHdvcmRpbmcgc2VlbXMgZGlm
ZmVyZW50IGVub3VnaCB0byBtZS4uLgo+ID4gSSBhbSBoYXBweSB0byB1c2UgIkJTRC0zLUNsYXVz
ZSIgdGhvdWdoLiBMYXVyZW50IHBsZWFzZSBkb3VibGUgY2hlY2suCj4gCj4gUGxlYXNlIHRhbGsg
dG8geW91ciBsYXd5ZXJzIGFib3V0IHRoaXMsIHdlIGFyZSBub3QgdGhlbS4uLgoKSSBhbSByZWFs
bHkgc29ycnkgZm9yIHRoZSB0cm91YmxlIChhbmQgdGhlIHdhc3RlIG9mIHRpbWUpIQoKSSdsbCB0
cnkgYW5kIHVzZSAiQlNELTMtQ2xhdXNlIiBmb3IgdGhlIG5leHQgdmVyc2lvbiBhbmQgSSdsbCBz
ZWUgd2hhdCBoYXBwZW5zLgoKVGhhbmtzLApGYWIKCj4gCj4gdGhhbmtzLAo+IAo+IGdyZWcgay1o
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
