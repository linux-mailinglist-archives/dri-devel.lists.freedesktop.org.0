Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF682CAF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8209B6E2EB;
	Tue,  6 Aug 2019 07:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410138.outbound.protection.outlook.com [40.107.141.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39346E2E1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 08:59:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amTK67qYb5kxcRha/PpXdTCCRWbSeBM57ZQ+8E9M5qRZdaRu3AIeVw52DTKzX9SdshhzJNFDBisfeyzXRLNFUF9fVjdeaqxdNm6AucDzZFAEzqKILA86yTiXmLJOVS3EbsBVTTaOOnDs+5Owvj+AFwZ2s4Cf7LuaG/nMT1C6XQQJt/PnvmSpSuAMH/edwS/Sb5T9/DDB0Zkk9Q3O0xbW6HZNQtuGVZcuX/2AyU+00JndPVNw7ajyv60J6aGHFOLp6/GfJd8QCcHsHbPwTqwIPkn0R9lJn6HwT0S7TEr7PiDZQPtoahL6NnRq5ZVfAB4yav+ao4/WgzcxXUPZLHFbYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuIMtIkzJotMv6SkT0lzhrqP0UyTWDQ4cLNA5GMC6RE=;
 b=c7Ts6cBnTpAbi2VNtuvMSVRYJVnsfQ9e6z5RniloCTQCFKPS8ol3L4PXfODZd86D4HjssMlPdaCsa0V3/yEbe3S6VRoFtzNIe2VATtFdWiwk5xYgTIiDpwElO8Th6srmA/rcPnilukLJA7U+/7M71p+OWuPnEPMzHo/DAZpGOkKpLbtsOQZah1DxOOkHvDBq7lXgArqWC1zUp06Nu35vGpe72uD6f4Hqp8OEQpo7pGcP31OPH3FGQkyjkDy7eknC6aOaeSiliYmL/K1ffhXGgkH06eLuFVrUY7vltrlxR7D0AlNt9kagHCeNlJRu01EIle44B/9gIWAJVzWPZTY/9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1673.jpnprd01.prod.outlook.com (52.133.162.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 08:59:52 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 08:59:52 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document
 renesas,swap-data
Thread-Topic: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document
 renesas,swap-data
Thread-Index: AQHVSQTAkHqVuaZ+mkSDN4F3/wGVC6bnejAAgATJjGA=
Date: Mon, 5 Aug 2019 08:59:51 +0000
Message-ID: <TY1PR01MB17706A4FF4C26CD4BDA1A5DAC0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802074428.GB5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802074428.GB5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14b0c9d2-b9e3-4136-b886-08d71983472c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1673; 
x-ms-traffictypediagnostic: TY1PR01MB1673:
x-microsoft-antispam-prvs: <TY1PR01MB1673378B4DA39B2829B22749C0DA0@TY1PR01MB1673.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(189003)(199004)(71190400001)(71200400001)(76176011)(102836004)(64756008)(316002)(66446008)(74316002)(54906003)(66066001)(486006)(53936002)(26005)(107886003)(33656002)(8936002)(7736002)(14454004)(6506007)(53546011)(4326008)(44832011)(5660300002)(25786009)(2906002)(305945005)(7416002)(86362001)(446003)(8676002)(478600001)(68736007)(55016002)(11346002)(229853002)(3846002)(6116002)(256004)(186003)(52536014)(6436002)(76116006)(66946007)(66556008)(66476007)(81166006)(6246003)(476003)(9686003)(6916009)(99286004)(81156014)(7696005)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1673;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e8rTS7MiQ4DhwIfRBFRKENDqBqyl19otiiNI18Vku2wxbOP+TYMrvbCO7/AyimhDabZaVnj5k0LOFjfzTqcO7j7JWvFhgCWeti2VFkDAdqiq0w5n/c3t7VYL3LWYBoTiM2gYKrZuhPbieff8tG00+zll8dbunTxrwL1djU3TdEvqICnRm6mJ4xhz5qoHkbTLA6vbAlheAfsqYp8zRMJpwRFFOTFRWcob+r7BOMjDs3l7sM2nMRd7zNLX8mUJ0JcrzYFadbss6Dv56dkvECMhLaRU4tgCs7i0vnrEH2XJAc4k3DZR2DzfdMUsuuKKyCAoRLqRk0/KEvPDb/Ij8mF8AxLrNFqAGRW8wkPMqJRIXkF8mWgfbIgZf0rfLjyQtuLNuacUi/pB4fkcU7YXG046/FRb3bg01ccaR6B/frrNLBo=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b0c9d2-b9e3-4136-b886-08d71983472c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 08:59:51.9089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1673
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuIMtIkzJotMv6SkT0lzhrqP0UyTWDQ4cLNA5GMC6RE=;
 b=IEWHez7Zs0b4VuVZzPptQ23idNuf1VKRiplTmXQ1cS6XYKioFOkJ2QFTNRXFBLB6F17MyReLzhmLyK0VYmeOwBZBDXvLelz32sEhaCbfTOyeTvDcWHm/XRLbwHxoFEFGKe10ExNYUv7YywjR7ZdNajm0+0Nlqpu6STyGXxxE0n4=
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

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMDIgQXVndXN0IDIwMTkgMDg6NDQNCj4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDIvMTJd
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzOiBsdmRzOiBEb2N1bWVudCByZW5lc2FzLHN3
YXAtZGF0YQ0KPiANCj4gSGkgRmFicml6aW8sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aC4NCj4gDQo+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDA4OjMzOjU5QU0gKzAxMDAsIEZhYnJp
emlvIENhc3RybyB3cm90ZToNCj4gPiBSLUNhciBEMywgUi1DYXIgRTMsIGFuZCBSWi9HMkUgc3Vw
cG9ydCBkdWFsLWxpbmsgbW9kZS4NCj4gPiBJbiBzdWNoIGEgbW9kZSwgdGhlIGZpcnN0IExWRFMg
ZW5jb2RlciBlbWl0cyBldmVuIGRhdGEsIGFuZCB0aGUNCj4gPiBzZWNvbmQgTFZEUyBlbmNvZGVy
IGVtaXRzIG9kZCBkYXRhLiBUaGlzIHBhdGNoIGRvY3VtZW50cyBwcm9wZXJ0eQ0KPiA+IHJlbmVz
YXMsc3dhcC1kYXRhLCB1c2VkIHRvIHN3YXAgZXZlbiBhbmQgb2RkIGRhdGEgYXJvdW5kLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAu
cmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0IHwgNSArKysrKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50
eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
cmVuZXNhcyxsdmRzLnR4dA0KPiA+IGluZGV4IGRlY2U3OWUuLjg5ODAxNzkgMTAwNjQ0DQo+ID4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Jl
bmVzYXMsbHZkcy50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dA0KPiA+IEBAIC01Miw2ICs1MiwxMSBA
QCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ICAgIG1hbmRhdG9yeSBmb3IgdGhlIGZpcnN0IExW
RFMgZW5jb2RlciBvbiBSLUNhciBEMywgUi1DYXIgRTMsIGFuZCBSWi9HMkUgU29DcywNCj4gPiAg
ICBhbmQgc2hhbGwgcG9pbnQgdG8gdGhlIHNlY29uZCBlbmNvZGVyIHRvIGJlIHVzZWQgYXMgYSBj
b21wYW5pb24gaW4gZHVhbC1saW5rDQo+ID4gICAgbW9kZS4gSXQgc2hhbGwgbm90IGJlIHNldCBm
b3IgYW55IG90aGVyIExWRFMgZW5jb2Rlci4NCj4gPiArLSByZW5lc2FzLHN3YXAtZGF0YSA6IHdo
ZW4gaW4gZHVhbC1saW5rIG1vZGUsIHRoZSBmaXJzdCBMVkRTIGVuY29kZXIgbm9ybWFsbHkNCj4g
PiArICBlbWl0cyBldmVuIGRhdGEsIGFuZCB0aGUgc2Vjb25kIExWRFMgZW5jb2RlciBlbWl0cyBv
ZGQgZGF0YS4gV2hlbiBwcm9wZXJ0eQ0KPiA+ICsgIHJlbmVzYXMsc3dhcC1kYXRhIGlzIHNwZWNp
ZmllZCwgdGhlIGRhdGEgZW1pdHRlZCBieSB0aGUgdHdvIGVuY29kZXJzIHdpbGwgYmUNCj4gPiAr
ICBzd2FwcGVkIGFyb3VuZC4gVGhpcyBwcm9wZXJ0eSBjYW4gb25seSBiZSB1c2VkIGluIGNvbmp1
bmN0aW9uIHdpdGggcHJvcGVydHkNCj4gPiArICByZW5lc2FzLGNvbXBhbmlvbi4NCj4gDQo+IEZy
b20gYW4gTFZEUyBlbmNvZGVyIHBvaW50IG9mIHZpZXcgdGhpcyBpcyBtb3JlIGEgY29uZmlndXJh
dGlvbiBvcHRpb24NCj4gdGhhbiBhIGRlc2NyaXB0aW9uIG9mIHRoZSBoYXJkd2FyZS4gV291bGRu
J3QgaXQgYmUgYmV0dGVyIGZvciB0aGUgTFZEUw0KPiBzaW5rIHRvIHJlcG9ydCB3aGljaCBvZiB0
aGUgb2RkIG9yIGV2ZW4gcGl4ZWxzIGl0IGV4cGVjdHMgb24gZWFjaCBvZiBpdHMNCj4gZW5kcG9p
bnRzID8NCg0KWWVzLCB0aGF0IHdvdWxkIGJlIG15IHByZWZlcmVuY2UgdG9vLCBhbmQgaXQgd291
bGQgYmUgYmV0dGVyLCBJIGFtIGp1c3Qgbm90IGVudGlyZWx5DQp3aGF0J3MgdGhlIGJlc3QgcGxh
Y2UgZm9yIHRoaXMgaW5mb3JtYXRpb24gdGhvdWdoDQoNCj4gVGhlIExWRFMgZW5jb2RlciBkcml2
ZXIgY291bGQgdGhlbiBxdWVyeSB0aGF0IGF0IHJ1bnRpbWUgYW5kDQo+IGNvbmZpZ3VyZSBpdHNl
bGYgYWNjb3JkaW5nbHkuIElkZWFsbHkgdGhpcyBzaG91bGQgYmUgcXVlcmllZCB0aHJvdWdoIHRo
ZQ0KPiBkcm1fYnJpZGdlX3RpbWluZ3Mgc3RydWN0dXJlIChvciB0aHJvdWdoIGEgc2ltaWxhciBt
ZWFuKSwgbm90IHRocm91Z2gNCj4gRFQuIEFuIExWRFMgc2luayB0aGF0IGhhcyBhIGZpeGVkIG1h
cHBpbmcgb2Ygb2RkL2V2ZW4gcGl4ZWxzIHRvDQo+IGVuZHBvaW50cyB3b3VsZG4ndCBuZWVkIHRo
ZSBpbmZvcm1hdGlvbiB0byBiZSBzcGVjaWZpZWQgaW4gRFQgYXQgYWxsLg0KDQpJc24ndCBkcm1f
YnJpZGdlX3RpbWluZ3Mgc3BlY2lmaWMgZm9yIGJyaWRnZXM/DQoNClRoYW5rcyENCkZhYg0KDQo+
IA0KPiA+DQo+ID4NCj4gPiAgRXhhbXBsZToNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBM
YXVyZW50IFBpbmNoYXJ0DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
