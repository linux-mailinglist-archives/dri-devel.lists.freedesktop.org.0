Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB18E6DE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89076E8EC;
	Thu, 15 Aug 2019 08:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAFD89C33
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:14:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLJ6ypBYltQOKchKk8Y9V5srCz5rnjTLEwUyFZwHqeXEQBNdg3Bff+63J8n20uobar2PSgzaPsOsjS63QU31rAEX3/qW/9VStrVga58vvsIvkCZ9QIMu2d1Bj4fwH5mLmpdxNynKasK6bKG8Q4oMAS2NLkCJJKXsXSgLhZq/W41S+NZ5FWroEBWa//Sd2w8pKU8Rvy405TaEmCCAzJjZy9xVfSlP378xyTzDtRE58UAaqs5ft+jJlItxGOaoCvxihwmU3ftb8WxnxY3oIBIaG4uL7RXcYIVtlHiI+ouME8RfJ1/98uLnlTOUkuLZlVzQycYp+C76S6TdkFGlvBg1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6NZQWLjjppQslEhkokDzHZyfCkXWMOQg47gOOlbDCI=;
 b=KdQdfVjs2R4d35flvGsftL7BlNE5sZxoNyF6+gzznEuOp+bJ4d4yoezfrAkOEtXeFW4co308JvAoG50d8AxrOGaX3nMHQpIKdfEYwLFYqqjW9lpR+LyKeHPVqZSkd614ESgvyedg5cFtdTx3GUUKPrFlwucp0iiiNFYiRyHt2XL2MGgr4zvnMUJcu80uhEzaoiXvcZkBAmqI3i4LX95brVdwftjt7YT77DVAhtQ/wOlZEYmMN3rULpLY7+0c4gJhv1R+lPBlohZQduF8vQxLCZs+YcjRzxYQGoqGlgmiuQkBbCCdVmXtFfT+uhMMcwiy+7tFwirBMOOWwjsnar9zIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB6715.eurprd04.prod.outlook.com (20.179.251.14) by
 DB8PR04MB5676.eurprd04.prod.outlook.com (20.179.10.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Wed, 14 Aug 2019 11:14:04 +0000
Received: from DB8PR04MB6715.eurprd04.prod.outlook.com
 ([fe80::b0ab:d127:ca27:e1fa]) by DB8PR04MB6715.eurprd04.prod.outlook.com
 ([fe80::b0ab:d127:ca27:e1fa%7]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 11:14:04 +0000
From: Robert Chiras <robert.chiras@nxp.com>
To: "stefan@agner.ch" <stefan@agner.ch>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [EXT] Re: [PATCH v2 09/15] dt-bindings: display: Add max-res
 property for mxsfb
Thread-Topic: [EXT] Re: [PATCH v2 09/15] dt-bindings: display: Add max-res
 property for mxsfb
Thread-Index: AQHVUo3mMmhKJOP0h0GajC46r83SHKb6esqAgAAC3IA=
Date: Wed, 14 Aug 2019 11:14:03 +0000
Message-ID: <1565781243.3209.55.camel@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
 <1565779731-1300-10-git-send-email-robert.chiras@nxp.com>
 <491aff3d08f24ab4d79a4f8c139d2e44@agner.ch>
In-Reply-To: <491aff3d08f24ab4d79a4f8c139d2e44@agner.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5118d463-64ca-4f6d-1f1f-08d720a8842b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB5676; 
x-ms-traffictypediagnostic: DB8PR04MB5676:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB56762FFD3479249686B43891E3AD0@DB8PR04MB5676.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(199004)(189003)(25786009)(2906002)(71200400001)(36756003)(14444005)(256004)(486006)(8676002)(26005)(7736002)(305945005)(76176011)(99286004)(7416002)(6506007)(6116002)(71190400001)(11346002)(102836004)(2616005)(3846002)(81156014)(81166006)(476003)(446003)(44832011)(186003)(8936002)(53546011)(53936002)(6512007)(76116006)(91956017)(54906003)(6246003)(478600001)(316002)(50226002)(6436002)(6486002)(110136005)(2501003)(5660300002)(66066001)(229853002)(86362001)(14454004)(4326008)(66556008)(103116003)(64756008)(66446008)(66476007)(66946007)(99106002)(17423001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB5676;
 H:DB8PR04MB6715.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wkvUX194nCwoQHL08fkZSPhzjw+N++VMLL379iGh/jW017t07X55/CIppHzviQ02b7lGRjDrNKnOWQaD4ObHUQfjB3oba4n6F6EqynIs0jhTpo82MDYW/lwjmC1L2w0711whr8H4rTKv8PDZl4JRgvqvKjqP3y60/p+pKF8EGcsR/EEC21KyJyhGToySZkbfVhxADi7nd+LkyqPuZIcB/pgdnQPyaUWT7NLPDhplzYzfgTYSF6fqZ45HGBWXupkKy4VYYBu+mGA45wfEgCo7+N5pW2AkDgTeLcQvUcNMBx1J77lVAUsdKIZc/eaXeogzutitqqnGpNPSj8qyamVLTlxTatZIk5/XqJ9T1TD+19IAPr5zW1Ym3XG8L8h5ph0xPH0ka87JBFcjU11c/vgng5CVAzGEtjPHsbyE0obN1KM=
Content-ID: <F9C4CA47FB2C2D4F9A249683358F1BBF@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5118d463-64ca-4f6d-1f1f-08d720a8842b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 11:14:03.9378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pyl7ksm/3POHckgfiJqc9axKtufNodvYh7vYdR+0bvkH8IfqcK3oAHvp6dHe/CjZOb8cw8bMlBG6DfcM+6iGfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5676
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6NZQWLjjppQslEhkokDzHZyfCkXWMOQg47gOOlbDCI=;
 b=fBQcJ59jABJfMWE83K9bgb9RbMlxm2BKs/STKfJwn1RDYLQE70EgXoeBUvSyYcAI+KHMnaie65ULuwU14VlB8BnUrWsFE39bkNu8QsTn5LitbgU8m/cmUInVwl8aPLTs1tghbl8RE/4wSX6iJPO5qVkp+bNIJ/psDVs7R9STPLA=
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
 dl-linux-imx <linux-imx@nxp.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlZmFuLA0KT24gTWksIDIwMTktMDgtMTQgYXQgMTM6MDMgKzAyMDAsIFN0ZWZhbiBBZ25l
ciB3cm90ZToNCj4gT24gMjAxOS0wOC0xNCAxMjo0OCwgUm9iZXJ0IENoaXJhcyB3cm90ZToNCj4g
PiANCj4gPiBBZGQgbmV3IG9wdGlvbmFsIHByb3BlcnR5ICdtYXgtcmVzJywgdG8gbGltaXQgdGhl
IG1heGltdW0gc3VwcG9ydGVkDQo+ID4gcmVzb2x1dGlvbiBieSB0aGUgTVhTRkJfRFJNIGRyaXZl
ci4NCj4gSSB3b3VsZCBhbHNvIG1lbnRpb24gdGhlIHJlYXNvbiB3aHkgd2UgbmVlZCB0aGlzLg0K
PiANCj4gSSBndWVzcyB0aGlzIG5lZWRzIGEgdmVuZG9yIHByZWZpeCBhcyB3ZWxsIChmc2wsbWF4
LXJlcykuIEkgYWxzbw0KPiB3b3VsZA0KPiBsaWtlIHRvIGhhdmUgdGhlIGFjayBvZiB0aGUgZGV2
aWNlIHRyZWUgZm9sa3MgaGVyZS4NClJvYiBIZXJyaW5nIGFsc28gYWtlZCBiZSBhYm91dCB0aGlz
LCBhbmQgSSdsbCBjb3B5IGhlcmUgdGhlIHJlcGx5LCB3aXRoDQpleHBsYW5hdGlvbnM6DQoNCklu
ZGVlZCwgdGhpcyBsaW1pdGF0aW9uIGlzIGFjdHVhbGx5IGR1ZSB0byBiYW5kd2lkdGggbGltaXRh
dGlvbiwgYnV0DQp0aGUgcHJvYmxlbSBpcyB0aGF0IHRoaXMgbGltaXRhdGlvbiBjb21lcyBvbiBp
Lk1YOE0gKGtub3duIGFzIG1TY2FsZQ0KODUwRCksIHdoZXJlIHRoZSBtZW1vcnkgYmFuZHdpZHRo
IGNhbm5vdCBzdXBwb3J0OiBHUFUvVlBVIHdvcmtsb2FkIGluDQp0aGUgc2FtZSB0aW1lIHdpdGgg
Ym90aCBEQ1NTIGRyaXZpbmcgNGtANjAgYW5kIGVMQ0RJRiBkcml2aW5nIDEwODBwQDYwLg0KU2lu
Y2UgZUxDRElGIGlzIGEgc2Vjb25kYXJ5IGRpc3BsYXkgd2UgdGhvdWdoIHRvIGFkZCB0aGUgcG9z
aWJpbGl0eSB0bw0KbGltaXQgaXQncyBiYW5kd2lkdGggYnkgbGltaXRpbmcgdGhlIHJlc29sdXRp
b24uDQpJZiB5b3Ugc2F5IHRoYXQgbW9yZSBkZXRhaWxzIGFyZSBuZWVkZWQsIEkgY2FuIGFkZCB0
aGVtIGluIHRoZQ0KZGVzY3JpcHRpb24uDQo+IA0KPiAtLQ0KPiBTdGVmYW4NCj4gDQo+ID4gDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAu
Y29tPg0KPiA+IC0tLQ0KPiA+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbXhzZmIudHh0IHwgNiArKysrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQNCj4gPiBpbmRleCA0NzJlMWVhLi41NWUyMmVk
IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L214c2ZiLnR4dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L214c2ZiLnR4dA0KPiA+IEBAIC0xNyw2ICsxNywxMiBAQCBSZXF1aXJlZCBwcm9w
ZXJ0aWVzOg0KPiA+IMKgUmVxdWlyZWQgc3ViLW5vZGVzOg0KPiA+IMKgwqDCoC0gcG9ydDogVGhl
IGNvbm5lY3Rpb24gdG8gYW4gZW5jb2RlciBjaGlwLg0KPiA+IA0KPiA+ICtPcHRpb25hbCBwcm9w
ZXJ0aWVzOg0KPiA+ICstIG1heC1yZXM6wqDCoMKgYW4gYXJyYXkgd2l0aCBhIG1heGltdW0gb2Yg
dHdvIGludGVnZXJzLCByZXByZXNlbnRpbmcNCj4gPiB0aGUNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBtYXhpbXVtIHN1cHBvcnRlZCByZXNvbHV0aW9uLCBpbiB0aGUgZm9ybSBvZg0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDxtYXhYPiwgPG1heFk+OyBpZiBvbmUgb2Yg
dGhlIGl0ZW0gaXMgPDA+LCB0aGUNCj4gPiBkZWZhdWx0DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZHJpdmVyLWRlZmluZWQgbWF4aW11bSByZXNvbHV0aW9uIGZvciB0aGF0IGF4aXMg
aXMNCj4gPiB1c2VkDQo+ID4gKw0KPiA+IMKgRXhhbXBsZToNCj4gPiANCj4gPiDCoMKgwqDCoMKg
wqBsY2RpZjE6IGRpc3BsYXktY29udHJvbGxlckAyMjIwMDAwIHsNCg0KVGhhbmtzLA0KUm9iZXJ0
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
