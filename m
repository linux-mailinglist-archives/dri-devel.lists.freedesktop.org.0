Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6924982C99
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E259F89F19;
	Tue,  6 Aug 2019 07:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410130.outbound.protection.outlook.com [40.107.141.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47C16E2E1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yoiag/t2PExUUpb1sDwrUF6XKcuZQJO95eXcq43yzj5OgJP+ohOHNzh8Bcw5yeOk7HVjzrT4sMVJu9BlJ0Jt4XdzmJSROuJkLfAShcRzXzOxX601Rd62knUC/WhnYLa4LZIRWn8fS9RMTUDLXAvJ6D9es7oIe7PWr01KWtM16rTeh28oatfZholdf8Qo426etKNZ8lbbi87lJMez0EC281nmWyy8TTzS6bAKal2K8j87vPV/igdBg45nCOVBxZTG/YjgSnpwIjlgikXKxcCvrFF4tAsJsAydn73PtdTC/MlSiNAm27A3aVCGhlX2X1SAeTGXP0FaSWcRvqLZEuWyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hoa+XcH01AfHVSbMeJptkmhXRFEH6YdvCGU5YKko+s0=;
 b=YYTfCA9K+cQiG0ykv3mx2qixQ1QlRUMAH6altr43/qIlYoFOmU7W/GCF1ux07UWiLkEsrX5HqAZDRM3u83oOEwq+TG4oWzbxSGhO0SoOQ6sR+VYp6jCsvbOiUbq4tlOfiFJ7R5I+wI5jWLSxMCXS0iAJL8cgFGaRNE6jyY+7QgvWlRyHqTP+na4fO3x8Wcx2W9jtdpShEaFqiIUKgPSjtC2CCJ4zgomU0i06tizg/uK6y3xQ2jZplNmbSrr04tCxFsKBrmhcy4idl7+BTsYOgQBW7xDU8e0DlFaoFt8tSsyw10OCZ3TWv+J2eRJbcR5IFrzLfVXeAe+qIMn3g2AbxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1673.jpnprd01.prod.outlook.com (52.133.162.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 09:02:32 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:02:32 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH/RFC 03/12] dt-bindings: panel: lvds: Add dual-link LVDS
 display support
Thread-Topic: [PATCH/RFC 03/12] dt-bindings: panel: lvds: Add dual-link LVDS
 display support
Thread-Index: AQHVSQTExRbt3tkhZE2Hv1S+qusHdqbnfpcAgATHxBA=
Date: Mon, 5 Aug 2019 09:02:31 +0000
Message-ID: <TY1PR01MB1770B6BC28F509EDAEA8C7D5C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802080014.GD5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802080014.GD5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62576135-780a-4380-b6fb-08d71983a677
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1673; 
x-ms-traffictypediagnostic: TY1PR01MB1673:
x-microsoft-antispam-prvs: <TY1PR01MB167378BFDB0AC17072A7B28CC0DA0@TY1PR01MB1673.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(199004)(189003)(11346002)(3846002)(6116002)(256004)(229853002)(86362001)(7416002)(446003)(55016002)(8676002)(68736007)(478600001)(186003)(9686003)(476003)(6246003)(7696005)(99286004)(6916009)(81156014)(66946007)(76116006)(52536014)(6436002)(81166006)(66476007)(66556008)(33656002)(14454004)(7736002)(8936002)(64756008)(102836004)(76176011)(316002)(71200400001)(71190400001)(66446008)(53936002)(486006)(66066001)(26005)(54906003)(74316002)(2906002)(305945005)(6506007)(4326008)(53546011)(25786009)(14444005)(44832011)(5660300002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1673;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: icok3zhjWqyhiFLsbpm9JzIekr6Zmg6OBMxjjKB5A2Vbb15lWnKiTgyOi2t/sMARkmZ7VfxbfiQkyEqiXYb2Zdt8Fbr2alpeHyX0HEzV/yjjzrzJbIhxirupK3wevZl0TfMftQ1/orX8Uk7coXfeQ5viVzcvCfCzc1OYORUP0QjRtTUdHYgWgRfOFz48bUrDAK/e+A1GrzlwUNzzpyaJMQZH3dUSUz22xVdCmaSvgrBoV6ArdSR+mW2ZUh1edrZX+cNfUQpK//Zzr5ZIls90z7FczQDxvMzXGQDRW+tSBGtLExCm6CVb+H2iIP6/VNqA1Grm2+lnzqZdXSsMSqxLccNIi/CKtqOMWXkSzXENLHXz9oV0Wi13DA7nEYU+Mutu5jcRSdbUSG2/Tl8xsjsP4KTf4Jh4HGmawgviml3YSF0=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62576135-780a-4380-b6fb-08d71983a677
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:02:31.9248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1673
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hoa+XcH01AfHVSbMeJptkmhXRFEH6YdvCGU5YKko+s0=;
 b=d8MPvxmngiA5awcA2KC/1UIJ+Q0Mb9gUUDVe4zg9viVfSkp4AmnQ3zJLjkRAU31+ADcCJo/AV4LAWHndg5TgtFqwUDUKkxfZEeYHNTIpybLqOpiyt8OjO/QanfLXfQX4aCrL9rmz8TNqlC0p6f4G+5vdG5QnUFDrQW8znKOLX2c=
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
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMDIgQXVndXN0IDIwMTkgMDk6MDANCj4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDMvMTJd
IGR0LWJpbmRpbmdzOiBwYW5lbDogbHZkczogQWRkIGR1YWwtbGluayBMVkRTIGRpc3BsYXkgc3Vw
cG9ydA0KPiANCj4gSGkgRmFicml6aW8sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4N
Cj4gDQo+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDA4OjM0OjAwQU0gKzAxMDAsIEZhYnJpemlv
IENhc3RybyB3cm90ZToNCj4gPiBEdWFsLWxpbmsgTFZEUyBkaXNwbGF5cyBoYXZlIHR3byBwb3J0
cywgdGhlcmVmb3JlIGRvY3VtZW50IHRoaXMNCj4gPiB3aXRoIHRoZSBiaW5kaW5ncy4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJl
bmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5l
bC1sdmRzLnR4dCAgICAgICAgICB8IDkxICsrKysrKysrKysrKysrKystLS0tLS0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3BhbmVsLWx2ZHMudHh0DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvcGFuZWwtbHZkcy50eHQNCj4gPiBpbmRleCAyNTA4NTBhLi4wNzc5NTQ0
MSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9wYW5lbC1sdmRzLnR4dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWx2ZHMudHh0DQo+ID4gQEAgLTQxLDcg
KzQxLDggQEAgUmVxdWlyZWQgbm9kZXM6DQo+ID4NCj4gPiAgLSBwYW5lbC10aW1pbmc6IFNlZSBw
YW5lbC1jb21tb24udHh0Lg0KPiA+ICAtIHBvcnRzOiBTZWUgcGFuZWwtY29tbW9uLnR4dC4gVGhl
c2UgYmluZGluZ3MgcmVxdWlyZSBhIHNpbmdsZSBwb3J0IHN1Ym5vZGUNCj4gPiAtICBjb3JyZXNw
b25kaW5nIHRvIHRoZSBwYW5lbCBMVkRTIGlucHV0Lg0KPiA+ICsgIChmb3IgYSBzaW5nbGUgbGlu
ayBkaXNwbGF5KSBvciB0d28gcG9ydCBzdWJub2RlcyAoZm9yIGEgZHVhbCBsaW5rIGRpc3BsYXkp
DQo+ID4gKyAgY29ycmVzcG9uZGluZyB0byB0aGUgcGFuZWwgTFZEUyBpbnB1dChzKS4NCj4gDQo+
IEkgdGhpbmsgeW91IHNob3VsZCBleHBhbmQgdGhpcyBhIGJpdCB0byBleHBsYWluIHdoYXQgdGhl
IHBvcnRzDQo+IGNvcnJlc3BvbmQgdG8gaW4gdGhlIGR1YWwgbGluayBtb2RlLg0KDQpXaWxsIGNo
YW5nZS4NCg0KPiANCj4gPiAgTFZEUyBkYXRhIG1hcHBpbmdzIGFyZSBkZWZpbmVkIGFzIGZvbGxv
d3MuDQo+ID4gQEAgLTkyLDMwICs5Myw3MiBAQCBDVEwzOiAwDQo+ID4gIEV4YW1wbGUNCj4gPiAg
LS0tLS0tLQ0KPiA+DQo+ID4gLXBhbmVsIHsNCj4gPiAtCWNvbXBhdGlibGUgPSAibWl0c3ViaXNo
aSxhYTEyMXRkMDEiLCAicGFuZWwtbHZkcyI7DQo+ID4gLQ0KPiA+IC0Jd2lkdGgtbW0gPSA8MjYx
PjsNCj4gPiAtCWhlaWdodC1tbSA9IDwxNjM+Ow0KPiA+IC0NCj4gPiAtCWRhdGEtbWFwcGluZyA9
ICJqZWlkYS0yNCI7DQo+ID4gLQ0KPiA+IC0JcGFuZWwtdGltaW5nIHsNCj4gPiAtCQkvKiAxMjgw
eDgwMCBANjBIeiAqLw0KPiA+IC0JCWNsb2NrLWZyZXF1ZW5jeSA9IDw3MTAwMDAwMD47DQo+ID4g
LQkJaGFjdGl2ZSA9IDwxMjgwPjsNCj4gPiAtCQl2YWN0aXZlID0gPDgwMD47DQo+ID4gLQkJaHN5
bmMtbGVuID0gPDcwPjsNCj4gPiAtCQloZnJvbnQtcG9yY2ggPSA8MjA+Ow0KPiA+IC0JCWhiYWNr
LXBvcmNoID0gPDcwPjsNCj4gPiAtCQl2c3luYy1sZW4gPSA8NT47DQo+ID4gLQkJdmZyb250LXBv
cmNoID0gPDM+Ow0KPiA+IC0JCXZiYWNrLXBvcmNoID0gPDE1PjsNCj4gPiArU2luZ2xlIHBvcnQ6
DQo+ID4gKwlwYW5lbCB7DQo+ID4gKwkJY29tcGF0aWJsZSA9ICJtaXRzdWJpc2hpLGFhMTIxdGQw
MSIsICJwYW5lbC1sdmRzIjsNCj4gPiArDQo+ID4gKwkJd2lkdGgtbW0gPSA8MjYxPjsNCj4gPiAr
CQloZWlnaHQtbW0gPSA8MTYzPjsNCj4gPiArDQo+ID4gKwkJZGF0YS1tYXBwaW5nID0gImplaWRh
LTI0IjsNCj4gPiArDQo+ID4gKwkJcGFuZWwtdGltaW5nIHsNCj4gPiArCQkJLyogMTI4MHg4MDAg
QDYwSHogKi8NCj4gPiArCQkJY2xvY2stZnJlcXVlbmN5ID0gPDcxMDAwMDAwPjsNCj4gPiArCQkJ
aGFjdGl2ZSA9IDwxMjgwPjsNCj4gPiArCQkJdmFjdGl2ZSA9IDw4MDA+Ow0KPiA+ICsJCQloc3lu
Yy1sZW4gPSA8NzA+Ow0KPiA+ICsJCQloZnJvbnQtcG9yY2ggPSA8MjA+Ow0KPiA+ICsJCQloYmFj
ay1wb3JjaCA9IDw3MD47DQo+ID4gKwkJCXZzeW5jLWxlbiA9IDw1PjsNCj4gPiArCQkJdmZyb250
LXBvcmNoID0gPDM+Ow0KPiA+ICsJCQl2YmFjay1wb3JjaCA9IDwxNT47DQo+ID4gKwkJfTsNCj4g
PiArDQo+ID4gKwkJcG9ydCB7DQo+ID4gKwkJCXBhbmVsX2luOiBlbmRwb2ludCB7DQo+ID4gKwkJ
CQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNfZW5jb2Rlcj47DQo+ID4gKwkJCX07DQo+ID4gKwkJ
fTsNCj4gPiAgCX07DQo+ID4NCj4gPiAtCXBvcnQgew0KPiA+IC0JCXBhbmVsX2luOiBlbmRwb2lu
dCB7DQo+ID4gLQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkc19lbmNvZGVyPjsNCj4gPiArVHdv
IHBvcnRzOg0KPiA+ICsJcGFuZWwgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAiYWR2YW50ZWNoLGlk
ay0yMTIxd3IiLCAicGFuZWwtbHZkcyI7DQo+ID4gKw0KPiA+ICsJCXdpZHRoLW1tID0gPDQ3Nj47
DQo+ID4gKwkJaGVpZ2h0LW1tID0gPDI2OD47DQo+ID4gKw0KPiA+ICsJCWRhdGEtbWFwcGluZyA9
ICJ2ZXNhLTI0IjsNCj4gPiArDQo+ID4gKwkJcGFuZWwtdGltaW5nIHsNCj4gPiArCQkJY2xvY2st
ZnJlcXVlbmN5ID0gPDE0ODUwMDAwMD47DQo+ID4gKwkJCWhhY3RpdmUgPSA8MTkyMD47DQo+ID4g
KwkJCXZhY3RpdmUgPSA8MTA4MD47DQo+ID4gKwkJCWhzeW5jLWxlbiA9IDw0ND47DQo+ID4gKwkJ
CWhmcm9udC1wb3JjaCA9IDw4OD47DQo+ID4gKwkJCWhiYWNrLXBvcmNoID0gPDE0OD47DQo+ID4g
KwkJCXZmcm9udC1wb3JjaCA9IDw0PjsNCj4gPiArCQkJdmJhY2stcG9yY2ggPSA8MzY+Ow0KPiA+
ICsJCQl2c3luYy1sZW4gPSA8NT47DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gKwkJcG9ydHMgew0K
PiA+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArCQkJI3NpemUtY2VsbHMgPSA8MD47
DQo+ID4gKw0KPiA+ICsJCQlwb3J0QDAgew0KPiA+ICsJCQkJcmVnID0gPDA+Ow0KPiA+ICsJCQkJ
bHZkczBfcGFuZWxfaW46IGVuZHBvaW50IHsNCj4gDQo+IEkgd291bGQgbmFtZSB0aGUgbGFiZWwg
cGFuZWxfaW4wIGFuZCBwYW5lbF9pbjEgYmVsb3cgdG8gaGF2ZSBhIGNvbW1vbg0KPiBwcmVmaXgg
c2hvd2luZyB0aGF0IGJvdGggcmVmZXIgdG8gdGhlIHNhbWUgcGFuZWwuDQoNCkkgYWdyZWUsIHdp
bGwgY2hhbmdlLCB0aGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lg0KDQo+IA0KPiA+ICsJ
CQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczBfb3V0PjsNCj4gPiArCQkJCX07DQo+ID4gKwkJ
CX07DQo+ID4gKw0KPiA+ICsJCQlwb3J0QDEgew0KPiA+ICsJCQkJcmVnID0gPDE+Ow0KPiA+ICsJ
CQkJbHZkczFfcGFuZWxfaW46IGVuZHBvaW50IHsNCj4gPiArCQkJCQlyZW1vdGUtZW5kcG9pbnQg
PSA8Jmx2ZHMxX291dD47DQo+ID4gKwkJCQl9Ow0KPiA+ICsJCQl9Ow0KPiA+ICAJCX07DQo+ID4g
IAl9Ow0KPiA+IC19Ow0KDQpUaGFua3MsDQpGYWINCg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4g
DQo+IExhdXJlbnQgUGluY2hhcnQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
