Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3AFB8BD1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0EC6F4A2;
	Fri, 20 Sep 2019 07:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770131.outbound.protection.outlook.com [40.107.77.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B37A6F7DF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 10:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtiDrEmMzxIc5zPcZ4hxP9uardI2OzdFafCQRVoNPBhYEFADRh6QUdkOO8lwo8SchqF+tAajhd1rpbcQf8IyKzq41nvPabIvXkOmKJNdVfXyELrpmPkRb+QXOG67ytlF8l1dAV5XXDaedEGiIgZGsHSItpxfeqM++nJLaQFdPtYZU8rBpkctb5F7D3tuGxZXxqnPyQq8wOK2NHJUc4qWOJ7V66KFcq6jnMuH+hcM7PxLZy/27q/33QnvdXaTRug9jFaKFCH3q70jauyRPJEAksdWhjdQz2wGrWUj6Oj7yeWWEA8qXk4f4w812bXOt1UvKkajUX21LjS8TnqiR69h0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBTJSlswVOGD4whQ+j7Ii1uqhhDdxwbkPbhNhhWArO4=;
 b=k5zc+KdE3oHARcIELzTSKuMFWyOqylw/EycL7VE86umL9gNjCClsZYpkCR+V1JDkFjxU0XdAe/rabFipAYdHD81/zZbyQDJrFhJlee4WKlF7V4TVj3FFRMkNcOn5bODRf0yqV5vmr2xDYRIYqE9RKRz3QESsiHR5D/5VoXOS8I+S1BKtn3yUbUorbQixYqQ6PHa9+g0X/KHHyjzk8AaIZhm4ujW4tMGjKEx3jyEODlcR7e/3IDQJJk+2vcd0ubHSIJOGY0j/07H1ii2trrty1giDoQYkNMH/v5M9uwjVm6N2eDzT3zwXjm5vIfsl5UL38npjXuZO/UbMfqgray/Jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from MN2PR04MB5886.namprd04.prod.outlook.com (20.179.22.213) by
 MN2PR04MB6861.namprd04.prod.outlook.com (10.186.145.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 19 Sep 2019 10:51:08 +0000
Received: from MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd]) by MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::8520:f80f:ae9:63cd%6]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 10:51:08 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v1 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVbrcoV2OyOAmcWUS3ygObr3iBRKcykX4AgABBUYA=
Date: Thu, 19 Sep 2019 10:51:08 +0000
Message-ID: <20190919105059.GB30631@xin-VirtualBox>
References: <cover.1568858880.git.xji@analogixsemi.com>
 <e41d10504b7d1e977a1f53663c287e4e7d53011a.1568858880.git.xji@analogixsemi.com>
 <446ff66c-8097-fca8-8371-9223679f16bb@baylibre.com>
In-Reply-To: <446ff66c-8097-fca8-8371-9223679f16bb@baylibre.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:203:2e::35) To MN2PR04MB5886.namprd04.prod.outlook.com
 (2603:10b6:208:a3::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72d95f34-7b12-4564-d93b-08d73cef46ea
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR04MB6861; 
x-ms-traffictypediagnostic: MN2PR04MB6861:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6861E22D15272EDA5249FFD3C7890@MN2PR04MB6861.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(346002)(396003)(376002)(366004)(136003)(39850400004)(189003)(199004)(33716001)(71200400001)(9686003)(4326008)(71190400001)(76176011)(256004)(81156014)(478600001)(66446008)(316002)(66946007)(64756008)(66476007)(52116002)(33656002)(81166006)(25786009)(8676002)(99286004)(66556008)(229853002)(6246003)(6116002)(386003)(5660300002)(11346002)(54906003)(186003)(3846002)(6512007)(14454004)(6436002)(53546011)(6916009)(6306002)(7736002)(6486002)(486006)(1076003)(7416002)(66066001)(446003)(6506007)(966005)(86362001)(8936002)(476003)(2906002)(305945005)(107886003)(26005)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6861;
 H:MN2PR04MB5886.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mSIRyTcvH59qVvfscBrXYm6Ap0SN30T3XA9jCMQQGHZvCadfxoWy7z2ZDzhCtp40BdmfOGUjWqAwF361EgD2aajhe6hFvFnNVfT3Bj7vhh+muaRMAkkjThN9UhzqIvyDL8mBDG0axxMTWr71RMa+rVokMuq43hLRrTIDYSko5i5m+a6QVB0Cn83BvdIUqadxeeH5g73YySAyeouU9mBhc6Z0ZTTbRtZ34KQ8gVGCk0ZaZA0xrqFOywc8XgNsGJwKvLNr4g7+6+Wj9zc7mm3+00TAcKdWMgVyLVsXXctx6JEJyVOnEgiTJ66XKJlHuclqqm4Lz8INSyOI4kJq/7uNf6JJ1j/WT30K4ZcSA46PBEAE/tv6yIO+B3+vdwHCdcQM/nYXPcZIhXpEQ2e6hUxFXxiwrlOJoqJKknIxMiHOv1s=
Content-ID: <8248B93224CA044CA79F0C0DC8170CEA@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d95f34-7b12-4564-d93b-08d73cef46ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 10:51:08.4658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MmCTS+sIgafubrF3v9cGHyEPaNDVYgdcQn3MYp5w+WDh2CjLmKHOP+tpFk1e644g9dsSTEjgdWhkVfIgApu0GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6861
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBTJSlswVOGD4whQ+j7Ii1uqhhDdxwbkPbhNhhWArO4=;
 b=qGZHDIyn2aTTVojqA0h/OWXAsvShk59ntS0DRhghmcM/sX9KcRaFnJcVJk26xozj0cDH7pbOg5vXhy1Po7f5tup43X7Jz4DpT/L5qpniAwjmG/sdnhmGd2EfSTMKiBontXMxmWUdaWYw7mdo/n/emoLrwrUho26xciTNllQ34xI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDg6NTc6MTJBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGksCj4gCj4gT24gMTkvMDkvMjAxOSAwODo1NSwgWGluIEppIHdyb3RlOgo+ID4g
VGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBIRCBUcmFuc21pdHRl
ciBkZXNpZ25lZAo+ID4gZm9yIHBvcnRhYmxlIGRldmljZS4gSXQgY29udmVydHMgTUlQSSB0byBE
aXNwbGF5UG9ydCAxLjMgNEsuCj4gPiAKPiA+IFlvdSBjYW4gYWRkIHN1cHBvcnQgdG8geW91ciBi
b2FyZCB3aXRoIGJpbmRpbmcuCj4gPiAKPiA+IEV4YW1wbGU6Cj4gPiAJYW54X2JyaWRnZTogYW54
NzYyNUA1OCB7Cj4gPiAJCWNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NzYyNSI7Cj4gPiAJCXJl
ZyA9IDwweDU4PjsKPiA+IAkJYW54LGxvd19wb3dlcl9tb2RlID0gPDE+Owo+ID4gCQlhbngsZHNp
X3N1cHBvcnRlZCA9IDwxPjsKPiA+IAkJYW54LGRzaV9jaGFubmVsID0gPDE+Owo+ID4gCQlhbngs
ZHNpX2xhbmVzID0gPDQ+Owo+ID4gCQlhbngsaW50ZXJuYWxfcGFubmVsID0gPDE+Owo+ID4gCQlh
bngscC1vbi1ncGlvID0gPCZncGlvMCA0NSBHUElPX0FDVElWRV9MT1c+Owo+ID4gCQlhbngscmVz
ZXQtZ3BpbyA9IDwmZ3BpbzAgNzMgR1BJT19BQ1RJVkVfTE9XPjsKPiA+IAkJc3RhdHVzID0gIm9r
YXkiOwo+ID4gCQlwb3J0IHsKPiA+IAkJCWFueDc2MjVfMV9pbjogZW5kcG9pbnQgewo+ID4gCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9kc2lfYnJpZGdlXzE+Owo+ID4gCQkJfTsKPiA+IAkJ
fTsKPiA+IAl9Owo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaW4gSmkgPHhqaUBhbmFsb2dpeHNl
bWkuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvYW54NzYyNS50eHQgfCA0MiArKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUudHh0Cj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvYW54NzYyNS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2UvYW54NzYyNS50eHQKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBp
bmRleCAwMDAwMDAwLi5mMmExYzJhCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS50eHQKPiA+
IEBAIC0wLDAgKzEsNDIgQEAKPiA+ICtBbmFsb2dpeCBBTlg3NjI1IFNsaW1Qb3J0ICg0SyBNb2Jp
bGUgSEQgVHJhbnNtaXR0ZXIpCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAKPiBOZXcgYmluZGluZ3Mgc2hvdWxkIHVzZSB5YW1sIGZvcm1hdDoK
PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2V4YW1wbGUtc2NoZW1hLnlhbWwKPiAKPiBOZWlsCk9L
LCBJJ2xsIGZvbGxvdyB0aGUgeWFtbCBmb3JtYXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KVGhhbmtz
LApYaW4KPiAKPiA+ICsKPiA+ICtUaGUgQU5YNzYyNSBpcyBhbiB1bHRyYS1sb3cgcG93ZXIgNEsg
TW9iaWxlIEhEIFRyYW5zbWl0dGVyCj4gPiArZGVzaWduZWQgZm9yIHBvcnRhYmxlIGRldmljZXMu
Cj4gPiArCj4gPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiA+ICsKPiA+ICsgLSBjb21wYXRpYmxl
CQk6ICJhbmFsb2dpeCxhbng3NjI1Igo+ID4gKyAtIHJlZwkJCTogSTJDIGFkZHJlc3Mgb2YgdGhl
IGRldmljZQo+ID4gKyAtIGFueCxsb3dfcG93ZXJfbW9kZQk6IExvdyBwb3dlciBtb2RlIHN1cHBv
cnQgZmVhdHVyZQo+ID4gKyAtIGFueCxkc2lfc3VwcG9ydGVkCTogRFNJIG9yIERQSQo+ID4gKyAt
IGFueCxkc2lfY2hhbm5lbAk6IERTSSBjaGFubmVsIGluZGV4Cj4gPiArIC0gYW54LGRzaV9sYW5l
cwk6IERTSSBsYW5lIGNvdW50Cj4gPiArIC0gYW54LGludHItaHBkLWdwaW8JOiBXaGljaCBHUElP
IHRvIHVzZSBmb3IgaW50ZXJydXB0Cj4gPiArCj4gPiArT3B0aW9uYWwgcHJvcGVydGllczoKPiA+
ICsKPiA+ICsgLSBhbngsZXh0Y29uX3N1cHBvcnRlZAo+ID4gKwlleHRlcm5hbCBjb25uZWN0b3Ig
aW50ZXJmYWNlIHN1cHBvcnQgZmxhZwo+ID4gKyAtIGFueCxpbnRlcm5hbF9wYW5uZWwKPiA+ICsJ
V2hpY2ggaW5kaWNhdGUgaW50ZXJuYWwgcGFubmVsCj4gPiArIC0gYW54LHAtb24tZ3Bpbwo+ID4g
KwlXaGljaCBHUElPIHRvIHVzZSBmb3IgUG93ZXIgT24gY2hpcAo+ID4gKyAtIGFueCxyZXNldC1n
cGlvCj4gPiArCVdoaWNoIEdQSU8gdG8gdXNlIGZvciBSRVNFVAo+ID4gKyAtIHBvcnQKPiA+ICsJ
U29DIHNwZWNpZmljIHBvcnQgbm9kZXMgd2l0aCBlbmRwb2ludCBkZWZpbml0aW9ucyBhcyBkZWZp
bmVkIGluCj4gPiArCURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRl
by1pbnRlcmZhY2VzLnR4dCwKPiA+ICsKPiA+ICtFeGFtcGxlOgo+ID4gKwo+ID4gKwlhbnhfYnJp
ZGdlOiBhbng3NjI1QDU4IHsKPiA+ICsJCWNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NzYyNSI7
Cj4gPiArCQlyZWcgPSA8MHg1OD47Cj4gPiArCQlhbngsbG93X3Bvd2VyX21vZGUgPSA8MD47Cj4g
PiArCQlhbngsZHNpX3N1cHBvcnRlZCA9IDwxPjsKPiA+ICsJCWFueCxkc2lfY2hhbm5lbCA9IDwx
PjsKPiA+ICsJCWFueCxkc2lfbGFuZXMgPSA8ND47Cj4gPiArCQlhbngsaW50ci1ocGQtZ3BpbyA9
IDwmZ3BpbzEgMTkgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPiA+ICsJCXN0YXR1cyA9ICJva2F5IjsK
PiA+ICsJfTsKPiA+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
