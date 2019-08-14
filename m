Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731608E6E6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD0E6E94A;
	Thu, 15 Aug 2019 08:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40056.outbound.protection.outlook.com [40.107.4.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4076E219
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 12:03:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnw/fBu+c4SlYSEoqOchRpXhvaOfR2HoO9prSmbGMVA2thxHNlS77mcc/RCRjHu0bOEmPTcNIHSTSM4tIX4vSxOazOHajj5mbTjEFiVlitPEmjUDu4HBGg2JbefcVWoM/y5nRRjPYtDDXv6VYWkNhXyryIIpSMCFTJu8USVs754G8Y+Ls+VPGOPvYo4ltUb42TyB9s0fDt3mArwHuA2695ypBSyxX8wgEyu+6o8Bin+G7GBJevlxpY/gUjnXkqMTXEF31QsIWwajOXcVe8oW35AkrnJ/aTmVhW2akzWg4MiczrIAE+htMOsHl6KwfX6eRvE08Jnhg0NYHzdbaAdj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIGYa83jI9xgPwJLHYcF6ge5UfVPaSHW9i7ux4fOhr4=;
 b=Rb2YKhqXTA0le1c3Fjia+OoO3fCa+yffaF8lqqOJQEVY8Inih8Gu/1eSTr1uLLq4cwxCQ4xt9ikoduF6YnFZ0zmtuMt3W4XMg8mwywWQkGXpJyZknmeath1bkitSpAN10/Me1Wp8RVV9GNg7Oo9mapO+0DGgLq/wTeIOLLZiiD6KMXazETUsJRwdFoH7bLcZ0UXr9y/TOlcGde0v156PeUjKplb+wKEjq6Kp/ot0Dn3gP0KvcUL+0oR1nnZGa6d/3NqmQtLCCfWPaIRBuvCit9z6mPKPEkrfDLUkyeUAWjhmLjnDhLb2Zdd0+RZBOIIVoLFxbtmP4WccGIbDJleEQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB6715.eurprd04.prod.outlook.com (20.179.251.14) by
 DB8PR04MB5867.eurprd04.prod.outlook.com (20.179.11.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Wed, 14 Aug 2019 12:03:51 +0000
Received: from DB8PR04MB6715.eurprd04.prod.outlook.com
 ([fe80::b0ab:d127:ca27:e1fa]) by DB8PR04MB6715.eurprd04.prod.outlook.com
 ([fe80::b0ab:d127:ca27:e1fa%7]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 12:03:51 +0000
From: Robert Chiras <robert.chiras@nxp.com>
To: "stefan@agner.ch" <stefan@agner.ch>
Subject: Re: [EXT] Re: [PATCH v2 09/15] dt-bindings: display: Add max-res
 property for mxsfb
Thread-Topic: [EXT] Re: [PATCH v2 09/15] dt-bindings: display: Add max-res
 property for mxsfb
Thread-Index: AQHVUo3mMmhKJOP0h0GajC46r83SHKb6esqAgAAC3ICAAAMVgIAACtWA
Date: Wed, 14 Aug 2019 12:03:51 +0000
Message-ID: <1565784231.3209.74.camel@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
 <1565779731-1300-10-git-send-email-robert.chiras@nxp.com>
 <491aff3d08f24ab4d79a4f8c139d2e44@agner.ch>
 <1565781243.3209.55.camel@nxp.com>
 <33feedd20e0fc154c5b736f882d24569@agner.ch>
In-Reply-To: <33feedd20e0fc154c5b736f882d24569@agner.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e851788-dffb-44cb-0160-08d720af78e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB5867; 
x-ms-traffictypediagnostic: DB8PR04MB5867:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB5867A6ECBDDCA2AB1B6FEC04E3AD0@DB8PR04MB5867.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(199004)(189003)(86362001)(81156014)(81166006)(6246003)(102836004)(305945005)(7416002)(26005)(53546011)(5660300002)(76176011)(6506007)(186003)(66556008)(66476007)(66946007)(2351001)(66446008)(91956017)(64756008)(1730700003)(8676002)(7736002)(14454004)(2501003)(76116006)(53936002)(44832011)(4326008)(2616005)(446003)(99286004)(476003)(25786009)(486006)(256004)(11346002)(6512007)(478600001)(54906003)(66066001)(50226002)(3846002)(6116002)(229853002)(103116003)(6916009)(14444005)(2906002)(8936002)(36756003)(6436002)(71200400001)(71190400001)(6486002)(5640700003)(316002)(99106002)(17423001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB5867;
 H:DB8PR04MB6715.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qX57KmA4wPJpWnsRuzX7Mnqu30ZTg5qqMKB9rT/YskcEKi+D5nTRAh5i6pSH/voqbzMZw4ucIE7+7pRMsQCVST1R85kkH7HfJk4ckHJs0oPnCf1uJnkWGNXLqHG6Aem3/3oJspFCh6zmhAiIrj+6ToHXpQjP1ocbNC9eyjBZ5Nu/HcIM0MHfZU9dKn2B+92QMqaIGl1ghsIVIgKp4gw83/HWmatEcA8DA+Zz3NNUfQfhlBvEkoFUi5nY3t6hwhLAhB2U9L+4qAHlPLT475LpUbNXf0YQqAWn7Ix647N3E+HmZ0fcrFNNqlJRTvggF/yOsOydcK+mgGy//xlarhpY89KeKDTAXEtvs9JAbXpXEmg5btb8X4eeyIr89eAM2+MLdxDOxljq6UdThHcDBpbTDvJRRb+iqmF6HR5Okfy00zc=
Content-ID: <4CB1B8C993E68742BADA05B1ABF60A5A@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e851788-dffb-44cb-0160-08d720af78e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 12:03:51.5040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyQSSwOPhftv6oPj43p9vZ5a7uhcwNCLa6oUC4z98wJayRvNGta1pmGTBSG9lKFUrHXMoSPHPeKlg574iY10Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5867
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIGYa83jI9xgPwJLHYcF6ge5UfVPaSHW9i7ux4fOhr4=;
 b=AenAOkddWgcaZOn0hMjx5/P78jQpdCLnHel6I85gKX8RigyvJ+KyXKPYxobWV6IwxmSApCOcW/rhsuultEoZF57ELGJH0gcjUxcmwJT3rjqahrTY9a68lUsejFKezkJU3v9QqMjUxZ7CnF4Vo5qF8frszpGHAWY4XNPz3JrV548=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=robert.chiras@nxp.com; 
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
Cc: "marex@denx.de" <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "agx@sigxcpu.org" <agx@sigxcpu.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlZmFubiwNCk9uIE1pLCAyMDE5LTA4LTE0IGF0IDEzOjI1ICswMjAwLCBTdGVmYW4gQWdu
ZXIgd3JvdGU6DQo+IE9uIDIwMTktMDgtMTQgMTM6MTQsIFJvYmVydCBDaGlyYXMgd3JvdGU6DQo+
ID4gDQo+ID4gSGkgU3RlZmFuLA0KPiA+IE9uIE1pLCAyMDE5LTA4LTE0IGF0IDEzOjAzICswMjAw
LCBTdGVmYW4gQWduZXIgd3JvdGU6DQo+ID4gPiANCj4gPiA+IE9uIDIwMTktMDgtMTQgMTI6NDgs
IFJvYmVydCBDaGlyYXMgd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gQWRkIG5l
dyBvcHRpb25hbCBwcm9wZXJ0eSAnbWF4LXJlcycsIHRvIGxpbWl0IHRoZSBtYXhpbXVtDQo+ID4g
PiA+IHN1cHBvcnRlZA0KPiA+ID4gPiByZXNvbHV0aW9uIGJ5IHRoZSBNWFNGQl9EUk0gZHJpdmVy
Lg0KPiA+ID4gSSB3b3VsZCBhbHNvIG1lbnRpb24gdGhlIHJlYXNvbiB3aHkgd2UgbmVlZCB0aGlz
Lg0KPiA+ID4gDQo+ID4gPiBJIGd1ZXNzIHRoaXMgbmVlZHMgYSB2ZW5kb3IgcHJlZml4IGFzIHdl
bGwgKGZzbCxtYXgtcmVzKS4gSSBhbHNvDQo+ID4gPiB3b3VsZA0KPiA+ID4gbGlrZSB0byBoYXZl
IHRoZSBhY2sgb2YgdGhlIGRldmljZSB0cmVlIGZvbGtzIGhlcmUuDQo+ID4gUm9iIEhlcnJpbmcg
YWxzbyBha2VkIGJlIGFib3V0IHRoaXMsIGFuZCBJJ2xsIGNvcHkgaGVyZSB0aGUgcmVwbHksDQo+
ID4gd2l0aA0KPiA+IGV4cGxhbmF0aW9uczoNCj4gPiANCj4gPiBJbmRlZWQsIHRoaXMgbGltaXRh
dGlvbiBpcyBhY3R1YWxseSBkdWUgdG8gYmFuZHdpZHRoIGxpbWl0YXRpb24sDQo+ID4gYnV0DQo+
ID4gdGhlIHByb2JsZW0gaXMgdGhhdCB0aGlzIGxpbWl0YXRpb24gY29tZXMgb24gaS5NWDhNIChr
bm93biBhcw0KPiA+IG1TY2FsZQ0KPiA+IDg1MEQpLCB3aGVyZSB0aGUgbWVtb3J5IGJhbmR3aWR0
aCBjYW5ub3Qgc3VwcG9ydDogR1BVL1ZQVSB3b3JrbG9hZA0KPiA+IGluDQo+ID4gdGhlIHNhbWUg
dGltZSB3aXRoIGJvdGggRENTUyBkcml2aW5nIDRrQDYwIGFuZCBlTENESUYgZHJpdmluZyAxMDgw
cA0KPiA+IEA2MC4NCj4gPiBTaW5jZSBlTENESUYgaXMgYSBzZWNvbmRhcnkgZGlzcGxheSB3ZSB0
aG91Z2ggdG8gYWRkIHRoZSBwb3NpYmlsaXR5DQo+ID4gdG8NCj4gPiBsaW1pdCBpdCdzIGJhbmR3
aWR0aCBieSBsaW1pdGluZyB0aGUgcmVzb2x1dGlvbi4NCj4gPiBJZiB5b3Ugc2F5IHRoYXQgbW9y
ZSBkZXRhaWxzIGFyZSBuZWVkZWQsIEkgY2FuIGFkZCB0aGVtIGluIHRoZQ0KPiA+IGRlc2NyaXB0
aW9uLg0KPiBPaCBzb3JyeSBJIG1pc3NlZCB0aGF0Lg0KPiANCj4gUm9iIEhlcnJpbmcgYWxzbyB3
cm90ZToNCj4gPiANCj4gPiBJIHN1cHBvc2Ugd2hhdCB5b3UgYXJlIGFmdGVyIGlzIGJhbmR3aWR0
aCBsaW1pdHM/IElJUkMsIHRoZXJlJ3MNCj4gPiBhbHJlYWR5DQo+ID4gc29tZSBiaW5kaW5ncyBl
eHByZXNzaW5nIHN1Y2ggbGltaXRzLiBBbHNvLCB3b3VsZG4ndCB5b3UgbmVlZCB0bw0KPiA+IGFj
Y291bnQNCj4gPiBmb3IgYnBwIGFuZCB1c2luZyB0aGUgMm5kIHBsYW5lIChJSVJDIHRoYXQgdGhl
cmUgaXMgb25lKS4NCj4gSSBndWVzcyB0aGUgYmluZGluZyBoZSByZWZlcnMgdG8gaXMgbWF4LW1l
bW9yeS1iYW5kd2lkdGgsIHdoaWNoIGlzDQo+IHVzZWQNCj4gaW4gbXVsdGlwbGUgZHJpdmVyIGFs
cmVhZHkuIEl0IG1ha2VzIHNlbnNlIHRvIHJldXNlIHRoaXMgcHJvcGVydHkNCj4gaW5zdGVhZCBv
ZiBpbnZlbnRpbmcgYSBuZXcgc2V0IG9mIHByb3BlcnR5IHdoaWNoIGlzIGFsc28gbm90IHRha2lu
Zw0KPiBicHANCj4gaW50byBhY2NvdW50Li4uDQpBY3R1YWxseSBJIHNhdyB0aGlzIGJpbmRpbmcs
IGJ1dCBJIHRob3VnaHQgaXQgaXMgc3RyaWN0bHkgcmVsYXRlZCB0bw0KdGhhdCBkcml2ZXIsIHdo
ZXJlIGl0IGlzIGRvY3VtZW50ZWQuIE5vdywgdGhhdCB5b3Ugc2F5IHRoaXMgb25lIGlzIHVzZWQN
CmluIG1hbnkgZHJpdmVycyAoYW5kIHJlY2FsbGluZyB0aGF0IHlvdSBzdWdnZXN0ZWQgZm9yIG15
ICdtYXgtcmVzJyB0bw0KYWRkIGEgcHJlZml4KSwgSSBnZXQgaXQgbm93Lg0KPiANCj4gVGhlIHBs
MTExIGRyaXZlciBpbXBsZW1lbnRzIHRoaXMgcHJvcGVydHksIGl0IHNob3VsZCBiZSBmYWlybHkg
ZWFzeQ0KPiB0bw0KPiBhZG9wdCB0aGF0IGNvZGUuDQpTdXJlLCBJIHdpbGwgZG8gc29tZXRoaW5n
IHNpbWlsYXIgaGVyZSwgdG9vLg0KPiANCj4gLS0NCj4gU3RlZmFuDQo+IA0KPiANCj4gDQo+ID4g
DQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gLS0NCj4gPiA+IFN0ZWZhbg0KPiA+ID4gDQo+ID4gPiA+
IA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBDaGly
YXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0IHwgNiArKysrKysN
Cj4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gPiA+IA0KPiA+
ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbXhzZmIudHh0DQo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0DQo+ID4gPiA+IGluZGV4IDQ3MmUxZWEuLjU1ZTIy
ZWQgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L214c2ZiLnR4dA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQNCj4gPiA+ID4gQEAgLTE3LDYgKzE3LDEyIEBA
IFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gPiA+IMKgUmVxdWlyZWQgc3ViLW5vZGVzOg0KPiA+
ID4gPiDCoMKgwqAtIHBvcnQ6IFRoZSBjb25uZWN0aW9uIHRvIGFuIGVuY29kZXIgY2hpcC4NCj4g
PiA+ID4gDQo+ID4gPiA+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiArLSBtYXgtcmVz
OsKgwqDCoGFuIGFycmF5IHdpdGggYSBtYXhpbXVtIG9mIHR3byBpbnRlZ2VycywNCj4gPiA+ID4g
cmVwcmVzZW50aW5nDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBtYXhpbXVtIHN1cHBvcnRlZCByZXNvbHV0aW9uLCBpbiB0aGUgZm9ybSBvZg0KPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA8bWF4WD4sIDxtYXhZPjsgaWYgb25lIG9mIHRo
ZSBpdGVtIGlzIDwwPiwgdGhlDQo+ID4gPiA+IGRlZmF1bHQNCj4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZHJpdmVyLWRlZmluZWQgbWF4aW11bSByZXNvbHV0aW9uIGZvciB0aGF0
IGF4aXMNCj4gPiA+ID4gaXMNCj4gPiA+ID4gdXNlZA0KPiA+ID4gPiArDQo+ID4gPiA+IMKgRXhh
bXBsZToNCj4gPiA+ID4gDQo+ID4gPiA+IMKgwqDCoMKgwqDCoGxjZGlmMTogZGlzcGxheS1jb250
cm9sbGVyQDIyMjAwMDAgew0KPiA+IFRoYW5rcywNCj4gPiBSb2JlcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
