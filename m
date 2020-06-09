Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E781F325C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 04:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6D16E120;
	Tue,  9 Jun 2020 02:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6743F6E120
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 02:48:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPpbdonb22Dd0ac+McFUieBZBRUpbVfyH0lcRdzs4I+/AdL97Ilig1CEpeZsPdVFedz8iHoJvk/6wkavLrtrq8XaGH4c9pZViQqrI9YVvyZq/iai3JC31+VdslNKMnS4UHON3JcHP49hRrYjZ8Z6gkiC82xmPI1G+/EvKMgArvt96PgQJspCG3rLgMKItRz1zXZ+q+L+YFmjXKmOkQtJ911WmkoIdDL21WTHKN04AJgsOqR88BHYhwWWzLX6LiWVtgewxet14syue3FQyi2cs/LSZC5RJPyTHnn0QD1LpIpyQq3I5DQD+33uwUy+iG/gnlkyXFIcxDFirODkLCVk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8BImfZSpAfBNILD0B9OkOCctJIJDuDXJ3wbiSHDatw=;
 b=i4L82fr3kadl3lIgeL1t3opVpwvNCYnRWh17ZvZQBnJiBnssINIU1JcjDveSBcDbsXWY8jfXffy2+lklFXcxxHhmbRwpE1S+jUN7Ig/4mCGskq4g9qi6E5ogzjPb+Ke6IFJPQEiAmg8H2DyeFWzpL0r3F9LpyybTeqKp9/obKg92ZA7SEKKI6KoAAhuK4DNBnOnSIenWiQmB/YBXq6+DLHmpl+lpq8R9mnwox8LFP5DIZJtOguNLvkGpERZLDWCwB1yJXXfDRDig+NmMWFyyxOt7xMFmk7QHRveIdpq9GkZCdO8sV/sH2CF/LI1o+Susv4Ax//85XY7Yz7RyHBdn/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8BImfZSpAfBNILD0B9OkOCctJIJDuDXJ3wbiSHDatw=;
 b=DUiDRPFRXtAgidSsk5EOqB6uJUFdDsSNPVntjoClaBUi5Bjx21uLONnts68kuwTX+LKoAtlZv0Rbi0GSpVHpchCzczcGRtSU6WOVuDbWl2yDSLGMXPEQ4p0ir0rsC+X4cU0EFO9GkYDdDvQi62lvCtuAnn0D1GoJUVolc7jHe3Q=
Received: from CY4PR02MB2790.namprd02.prod.outlook.com (2603:10b6:903:11c::8)
 by CY4PR02MB3255.namprd02.prod.outlook.com (2603:10b6:910:7b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Tue, 9 Jun
 2020 02:48:26 +0000
Received: from CY4PR02MB2790.namprd02.prod.outlook.com
 ([fe80::8478:4f5d:d9e9:8979]) by CY4PR02MB2790.namprd02.prod.outlook.com
 ([fe80::8478:4f5d:d9e9:8979%11]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 02:48:26 +0000
From: Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [RFC PATCH 2/2] drm: xlnx: driver for Xilinx DSI TX Subsystem
Thread-Topic: [RFC PATCH 2/2] drm: xlnx: driver for Xilinx DSI TX Subsystem
Thread-Index: AQHWF1mglRaPzdyDqkWAZse0zugWnqiYWTEAgB5pO4CAC+/AsIAKBOUAgAMovAA=
Date: Tue, 9 Jun 2020 02:48:25 +0000
Message-ID: <CY4PR02MB27908C70E9D66DA91868FF35B1820@CY4PR02MB2790.namprd02.prod.outlook.com>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1587417656-48078-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <20200504184348.GA3095@smtp.xilinx.com>
 <20200524030813.GF6026@pendragon.ideasonboard.com>
 <CY4PR02MB2790B791578160F257049FEAB18D0@CY4PR02MB2790.namprd02.prod.outlook.com>
 <20200607022518.GA7339@pendragon.ideasonboard.com>
In-Reply-To: <20200607022518.GA7339@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=xilinx.com;
x-originating-ip: [223.230.61.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4932b949-7dcb-4fdb-3187-08d80c1f955c
x-ms-traffictypediagnostic: CY4PR02MB3255:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR02MB32554C42A13217FADDC277F7B1820@CY4PR02MB3255.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xe3dyg/92hFjGHOdJhdoEr1XkCHHKGtC1qHpCs2XBZYH8ASPy1O1fCZhWdIda2pUr8QrX8Whq1widR+cLebKxSFmqI4+5kHOwqlT+LLCbuThJ8g3PFXWfILkP7gAunNl0utnTCmEHs7zHdwuXDhzxk2ODvv6aQz9dV5aUSLkCT5qaGz66W50kOVHRRyYq2fNQd7HGr56DgI/9rZ/eR5qA/C+fTgX/LybV9DKMQIYMm0G6nvLLGaYC6AjKPT9vJHXpi77vguki8q6I/dPhAHPysl5IqnsfLf931Z81Jq+eE2RctrYyFqz9g7PraKr56EHz/I/Wo1IF6CWz/e3Eine7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR02MB2790.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(346002)(376002)(396003)(366004)(66476007)(8676002)(4326008)(71200400001)(5660300002)(54906003)(6916009)(9686003)(33656002)(2906002)(86362001)(316002)(83380400001)(52536014)(8936002)(186003)(66446008)(66556008)(76116006)(66946007)(107886003)(64756008)(478600001)(6506007)(7696005)(53546011)(55016002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: QmPlem22nicX78rzkdlpvBAkaJJA55mcyulzosplkXlt5YJtKNTNv3q9PH1hKH+Cme/Vg2l7eKNeo05FFe4KhRjPjnf2Ff6iAqZRDO/4QTxVQr2hc+z8/EET3SmSMMofdiIkwMjsV+NWBQO8wag/dcUxV4TAF9bjGTG3J05s2tX3wZpJoHv+BS1uc+2SI2Kz9bXnsatQRM2CoQOCN3wr7H2qIGMNDuVGXTUHkhsqwJTlTqpa0R24bOnUmIQsZZ6aZ2vcuQ6e9G891N2iiovOdAQd7Yvpy72uVxDyV1B2/2MgfyPLCn2KTNdk+yss6GNzELlcZfYuPHQv0LpOqTs7sVaDTjMcGUfztq1j+szQhvD6qvgUT63KwKbvWSVDZXpcVshkXPpQCa4EEAfvMCEtW/acjKy9/S0tQRJg3GHfhzhwtxnzX53+rhahpB++R6yKkmRCJoujxPNcmKjK4kfw9JO043ZnST2932oGmFojsfY5yfyTmY1ter5K0Xtcw1Vo
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4932b949-7dcb-4fdb-3187-08d80c1f955c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 02:48:26.0372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WGPlOsqyHG/KSoHU/QT4UJ3HiI1gTsdsJSgTWMY3McaYhUnI4Wh9OFvYuIj15CC3ZDJ/FEXUAs3sVW8ipNcyRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3255
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sandip Kothari <sandipk@xilinx.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vishal Sagar <vsagar@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiANClBsZWFzZSBzZWUgbXkgY29t
bWVudHMgYWJvdXQgRC1QSFkgYW5kIGJyaWRnZSBkcml2ZXIgaW1wbGVtZW50YXRpb24uDQoNCj4t
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj5TZW50OiBTdW5kYXksIEp1bmUgNywgMjAy
MCA3OjU1IEFNDQo+VG86IFZlbmthdGVzaHdhciBSYW8gR2FubmF2YXJhcHUgPFZHQU5OQVZBQHhp
bGlueC5jb20+DQo+Q2M6IEh5dW4gS3dvbiA8aHl1bmtAeGlsaW54LmNvbT47IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+YWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNo
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBTYW5kaXAgS290aGFyaQ0KPjxzYW5kaXBr
QHhpbGlueC5jb20+DQo+U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMi8yXSBkcm06IHhsbng6IGRy
aXZlciBmb3IgWGlsaW54IERTSSBUWCBTdWJzeXN0ZW0NCj4NCj5IaSBHVlJhbywNCj4NCj5PbiBT
dW4sIE1heSAzMSwgMjAyMCBhdCAwNTo0MTo1MFBNICswMDAwLCBWZW5rYXRlc2h3YXIgUmFvIEdh
bm5hdmFyYXB1DQo+d3JvdGU6DQo+PiBPbiBTdW5kYXksIE1heSAyNCwgMjAyMCA4OjM4IEFNLCBM
YXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPj4gPiBPbiBNb24sIE1heSAwNCwgMjAyMCBhdCAxMTo0
Mzo0OEFNIC0wNzAwLCBIeXVuIEt3b24gd3JvdGU6DQo+PiA+PiBPbiBNb24sIDIwMjAtMDQtMjAg
YXQgMTQ6MjA6NTYgLTA3MDAsIFZlbmthdGVzaHdhciBSYW8gR2FubmF2YXJhcHUNCj53cm90ZToN
Cj4+ID4+PiBUaGUgWGlsaW54IE1JUEkgRFNJIFR4IFN1YnN5c3RlbSBzb2Z0IElQIGlzIHVzZWQg
dG8gZGlzcGxheSB2aWRlbw0KPj4gPj4+IGRhdGEgZnJvbSBBWEktNCBzdHJlYW0gaW50ZXJmYWNl
Lg0KPj4gPj4+DQo+PiA+Pj4gSXQgc3VwcG9ydHMgdXB0byA0IGxhbmVzLCBvcHRpb25hbCByZWdp
c3RlciBpbnRlcmZhY2UgZm9yIHRoZQ0KPj4gPj4+IERQSFksDQo+PiA+Pg0KPj4gPj4gSSBkb24n
dCBzZWUgdGhlIHJlZ2lzdGVyIGludGVyZmFjZSBmb3IgZHBoeSBzdXBwb3J0Lg0KPj4gPg0KPj4g
PiBJIHRoaW5rIHRoZSBELVBIWSBzaG91bGQgYmUgc3VwcG9ydGVkIHRocm91Z2ggYSBQSFkgZHJp
dmVyLCBhcyBpdA0KPj4gPiBzZWVtcyB0byBiZSBzaGFyZWQgYmV0d2VlbiBkaWZmZXJlbnQgc3Vi
c3lzdGVtcy4NCj4+DQo+PiBJUCBoYXMgdGhlIHByb3Zpc2lvbiB0byByZWFkIERQSFkgcmVnaXN0
ZXIgZm9yIGRlYnVnIHB1cnBvc2Ugb25seS4NCj4+IE5vIHByb2dyYW1taW5nIG9mIERQSFkgaXMg
cmVxdWlyZWQgaW4gc3Vic3lzdGVtLg0KPg0KPkRvIHlvdSBrbm93IGlmIHRoaXMgaXMgdGhlIHNh
bWUgRC1QSFkgYXMgdXNlZCBpbiB0aGUgQ1NJMi1SWCBzdWJzeXN0ZW0gPw0KIA0KU2FtZSBELVBI
WSBjb3JlIGhhcyBiZWVuIHVzZWQgaW4gTUlQSSBDU0kyIFJYU1MsIGJ1dCB3aXRoIGRpZmZlcmVu
dCBjb25maWd1cmF0aW9uLg0KPg0KPj4gPj4+IG11bHRpcGxlIFJHQiBjb2xvciBmb3JtYXRzLCBj
b21tYW5kIG1vZGUgYW5kIHZpZGVvIG1vZGUuDQo+PiA+Pj4gVGhpcyBpcyBhIE1JUEktRFNJIGhv
c3QgZHJpdmVyIGFuZCBwcm92aWRlcyBEU0kgYnVzIGZvciBwYW5lbHMuDQo+PiA+Pj4gVGhpcyBk
cml2ZXIgYWxzbyBoZWxwcyB0byBjb21tdW5pY2F0ZSB3aXRoIGl0cyBwYW5lbCB1c2luZyBwYW5l
bA0KPj4gPj4+IGZyYW1ld29yay4NCj4+ID4+Pg0KPj4gPj4+IFNpZ25lZC1vZmYtYnk6IFZlbmth
dGVzaHdhciBSYW8gR2FubmF2YXJhcHUNCj4+ID4+PiA8dmVua2F0ZXNod2FyLnJhby5nYW5uYXZh
cmFwdUB4aWxpbnguY29tPg0KPj4gPj4+IC0tLQ0KPj4gPj4+ICBkcml2ZXJzL2dwdS9kcm0veGxu
eC9LY29uZmlnICAgIHwgIDExICsNCj4+ID4+PiAgZHJpdmVycy9ncHUvZHJtL3hsbngvTWFrZWZp
bGUgICB8ICAgMiArDQo+PiA+Pj4gIGRyaXZlcnMvZ3B1L2RybS94bG54L3hsbnhfZHNpLmMgfCA3
NTUNCj4+ID4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiA+
DQo+PiA+IERhbmllbCBWZXR0ZXIgaGFzIHJlY2VudGx5IGV4cHJlc3NlZCBoaXMgb3BpaW9uIHRo
YXQgYnJpZGdlIGRyaXZlcnMNCj4+ID4gc2hvdWxkIGdvIHRvIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvLiBJdCB3b3VsZCB0aGVuIGJlDQo+PiA+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UveGxueC8u
IEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIG15c2VsZi4NCg0KVGhlIERTSS1UWCBzdWJz
eXN0ZW0gSVAgYmxvY2sgaXMgbm90IGEgYnJpZGdlIGRyaXZlci4NClRoZSBEU0ktVFggc3Vic3lz
dGVtIElQIGJsb2NrIGl0c2VsZiBjb250YWlucyBhbGwgdGhlIGRybSBlbmNvZGVyL2Nvbm5lY3Rv
cg0KZnVuY3Rpb25hbGl0eSBhbmQgaXTigJlzIHRoZSBsYXN0IG5vZGUgaW4gZGlzcGxheSBwaXBl
IGxpbmUuIEkgZGlkbid0IHNlZSBhbnkgaGFyZA0KcmVxdWlyZW1lbnQgdG8gaW1wbGVtZW50IGl0
IGludG8gYnJpZGdlIGRyaXZlciBhbmQgSSBzZWUgbWFueSBEU0kgZHJpdmVycyBhcmUNCmltcGxl
bWVudGVkIGFzIGVuY29kZXIgZHJpdmVycy4NClhpbGlueCBQTCBEUk0gZW5jb2RlciBkcml2ZXJz
IGFyZSBpbXBsZW1lbnRlZCBpbiBtb2R1bGFyIGFwcHJvYWNoIHNvIHRoYXQNCnRoZXkgY2FuIHdv
cmsgd2l0aCBhbnkgQ1JUQyBkcml2ZXIgd2hpY2ggaGFuZGxlcyB0aGUgRE1BIGNhbGxzLg0KU28s
IGF0IHRoaXMgc3RhZ2Ugd2Ugd2FudCB0byB1cHN0cmVhbSBhcyBlbmNvZGVyIGRyaXZlciBvbmx5
Lg0KPj4gPg0KPj4gPj4+ICAzIGZpbGVzIGNoYW5nZWQsIDc2OCBpbnNlcnRpb25zKCspICBjcmVh
dGUgbW9kZSAxMDA2NDQNCj4+ID4+PiBkcml2ZXJzL2dwdS9kcm0veGxueC94bG54X2RzaS5jDQo+
DQo+W3NuaXBdDQo+DQo+LS0NCj5SZWdhcmRzLA0KPg0KPkxhdXJlbnQgUGluY2hhcnQNCg0KUmVn
YXJkcywNCkdWUmFvDQogDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
