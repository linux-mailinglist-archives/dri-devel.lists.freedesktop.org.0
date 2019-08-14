Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D518E69D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A36B6E8E3;
	Thu, 15 Aug 2019 08:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4786E26F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 06:35:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMvwl5aR1oKm7SyxPXA8c4D4Q1a2hB2geoOavNyPQJZ+VM1N39n8yilAWTRfH/xwVFXmX23u4hOumAJsDt+zgFA4jCJniB85v0HMVMEZhjWlDcDf2ghnH/qh2ZmLOW3SF/jt5vKUCp0tm8Geq5usveEulMd1jmoiirYUkTDNwL5sSxi2KJkwuQm6JVWgn5b46aNokr3AdVFkXnBBSUr7eYlrUXWsITsRJtA0dPhLVO7fIi40Id1JnF0BdmdPqch06NAvcOaRHkvsjuI2gFACt9ocws/nn6FHaDIl7kW8b/DcyzZ0GJzPHSLENm14gMCZsSPFkAvI3ky5ssCp5YYu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrY6U0jLZy6/GMHI8u1hQA2xcul2vC1XGw6wyOdgOko=;
 b=BxyfQeBTE4ZKPXqWopGobv412+FThwMieQ4TDG9jQaMKXGJ7uYiRMrc+Xn9t8LkUpKt3Gcmbwk6jszu/5MamYxNKp0dJNfVBO6EZo415tl0haODzn8bG7B2tabA4m+V02asNZtcnPwz6zXsh38B5vrWtiE7IgZoRKgZiSNjjxhH6GNiZKSwlQQFfGNxpJJ/1qatJmAtsQDjwlWOcfhknaMlq2/FzK0NsWOzUdQ+hCI56lFOtbEfs28evpsnWynqjOOTnTeD+rWT4gKcY6+GiEAAnLzBTfuYm3XmOL/V1x3cILtc9lr/6F2JYI/0xkTIxUSwKL76cI/DaIJIXTMr8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB7PR04MB5195.eurprd04.prod.outlook.com (20.176.236.27) by
 DB7PR04MB4043.eurprd04.prod.outlook.com (52.134.107.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Wed, 14 Aug 2019 06:35:39 +0000
Received: from DB7PR04MB5195.eurprd04.prod.outlook.com
 ([fe80::e854:ffa9:a285:88a4]) by DB7PR04MB5195.eurprd04.prod.outlook.com
 ([fe80::e854:ffa9:a285:88a4%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 06:35:39 +0000
From: Wen He <wen.he_1@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [EXT] Re: [v2 2/3] dt/bindings: display: Add optional property
 node defined for Mali DP500
Thread-Topic: [EXT] Re: [v2 2/3] dt/bindings: display: Add optional property
 node defined for Mali DP500
Thread-Index: AQHVPhnccwb1TIQN/EKQlWAhJUUmNqb4TKgAgAII04A=
Date: Wed, 14 Aug 2019 06:35:39 +0000
Message-ID: <DB7PR04MB51957AD439A537C44A24BB45E2AD0@DB7PR04MB5195.eurprd04.prod.outlook.com>
References: <20190719095842.11683-1-wen.he_1@nxp.com>
 <20190812231946.GA31179@bogus>
In-Reply-To: <20190812231946.GA31179@bogus>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf36f8d2-c7bf-48f4-9b33-08d720819fbf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB7PR04MB4043; 
x-ms-traffictypediagnostic: DB7PR04MB4043:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB404319B376EC4F8F2B13FD84E2AD0@DB7PR04MB4043.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(199004)(189003)(13464003)(53936002)(6916009)(86362001)(6436002)(81166006)(6506007)(8936002)(55016002)(102836004)(54906003)(53546011)(478600001)(4326008)(33656002)(256004)(7696005)(76176011)(66476007)(14454004)(486006)(66556008)(76116006)(66946007)(66446008)(64756008)(11346002)(446003)(476003)(81156014)(2906002)(26005)(3846002)(7736002)(74316002)(6116002)(5660300002)(52536014)(8676002)(305945005)(229853002)(186003)(316002)(9686003)(66066001)(6246003)(71200400001)(71190400001)(25786009)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4043;
 H:DB7PR04MB5195.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IV9VXuWImptrpfMvWB7aOztNTCxAWCLx8z/luptt8G0RP+W0htjEO/kqZYkJzDAHKD9hql2vIUOrNrnGWCA60HKGleScLNJJ2KHBEO69jpyfggmmR0SnIEnPyI8hMc66xcdIppvuBM+L8tB34MvfkC+I6e2UE/XBWClHv11Z6B39ZVer+kbO3qvJRjl1gWuzceNo4USXn4//7kGtu0REf3P1E0p4AcVD735iizsOA+ODywlNG5pRtZ1W1uk+fCUNqHgDnX+a1j/RmMTGGeLMi8P0zK9FQBT5Rf6IvsWAX21ReQ0XGJPRxc/N38zVh6uzyqgtAI2mL5TpXzaHSMUPpdGAWGcV1KjTIZHBh2di1bgaIhM9Jp5IklMUs1peUqWqsBEDf1AFx5zcJAxfQjiEwXFqniq2m3/ZgQLbdyUoBuo=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf36f8d2-c7bf-48f4-9b33-08d720819fbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 06:35:39.8039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqRZeJVtJeyI7VsPxaW9LdsnYNImkfkjKzidF04OjU9g0DEQDC/Q3VtuE1UHxUhbVPhGZJth9UdkkUq6YPw3rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4043
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrY6U0jLZy6/GMHI8u1hQA2xcul2vC1XGw6wyOdgOko=;
 b=eQMIKJw6Mm1319yvgJd2D3qWQXzw/w6g2JD8jd1e8eNvLwrXOsPo3w/bIY4NcndGFw1OLgWjnoh202cVi0T7K31yEa8KYy5bqYayPZnAqFlCGYUU+93z42/pb1+WspPfNAdG+iaJZHvCZElCKWFvOQgU7yO7oYeGMbgFalwn4Jo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=wen.he_1@nxp.com; 
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Leo Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogMjAxOeW5tDjmnIgxM+aXpSA3OjIwDQo+IFRvOiBXZW4g
SGUgPHdlbi5oZV8xQG54cC5jb20+DQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IGxpdml1LmR1ZGF1QGFybS5jb207DQo+IGJy
aWFuLnN0YXJrZXlAYXJtLmNvbTsgYWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBM
ZW8gTGkNCj4gPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFt2MiAy
LzNdIGR0L2JpbmRpbmdzOiBkaXNwbGF5OiBBZGQgb3B0aW9uYWwgcHJvcGVydHkgbm9kZQ0KPiBk
ZWZpbmVkIGZvciBNYWxpIERQNTAwDQo+IA0KPiANCj4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQg
MDU6NTg6NDJQTSArMDgwMCwgV2VuIEhlIHdyb3RlOg0KPiA+IEFkZCBvcHRpb25hbCBwcm9wZXJ0
eSBub2RlICdhcm0sbWFsaWRwLWFycW9zLXZhbHVlJyBmb3IgdGhlIE1hbGkgRFA1MDAuDQo+ID4g
VGhpcyBwcm9wZXJ0eSBkZXNjcmliZSB0aGUgQVJRb1MgbGV2ZWxzIG9mIERQNTAwJ3MgUW9TIHNp
Z25hbGluZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlbiBIZSA8d2VuLmhlXzFAbnhwLmNv
bT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYXJtLG1hbGlkcC50eHQgfCAzICsrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sbWFsaWRwLnR4dA0KPiA+IGluZGV4IDJmNzg3MDk4M2Vm
MS4uNzZhMGU3MjUxMjUxIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxtYWxpZHAudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50eHQNCj4gPiBAQCAtMzcs
NiArMzcsOCBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+DQo+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yZXNlcnZlZC1tZW1vcnkvcmVzZXJ2ZWQtbWVtb3J5LnR4dCkNCj4g
PiAgICAgIHRvIGJlIHVzZWQgZm9yIHRoZSBmcmFtZWJ1ZmZlcjsgaWYgbm90IHByZXNlbnQsIHRo
ZSBmcmFtZWJ1ZmZlciBtYXkNCj4gPiAgICAgIGJlIGxvY2F0ZWQgYW55d2hlcmUgaW4gbWVtb3J5
Lg0KPiA+ICsgIC0gYXJtLG1hbGlkcC1hcnFvcy1oaWdoLWxldmVsOiBpbnRlZ2VyIG9mIHUzMiB2
YWx1ZSBkZXNjcmliaW5nIHRoZSBBUlFvUw0KPiA+ICsgICAgbGV2ZWxzIG9mIERQNTAwJ3MgUW9T
IHNpZ25hbGluZy4NCj4gDQo+IHUzMiBoZXJlLCBhbmQuLi4NCg0KSGkgUm9iLA0KDQpTb3JyeSwg
c2hvdWxkIGJlIHdyaXR0ZW4gYXMiIHBoYW5kbGUgdG8gYSBub2RlIGRlc2NyaWJpbmcgdGhlIEFR
Um9TIGxldmVscyBvZiBEUDUwMCdzIFFvUyBzaWduYWxpbmciLi4NCklzIHRoYXQgb2s/DQoNCkJl
c3QgUmVnYXJkcywNCldlbg0KDQo+IA0KPiA+DQo+ID4NCj4gPiAgRXhhbXBsZToNCj4gPiBAQCAt
NTQsNiArNTYsNyBAQCBFeGFtcGxlOg0KPiA+ICAgICAgICAgICAgICAgY2xvY2tzID0gPCZvc2Nj
bGsyPiwgPCZmcGdhb3NjMD4sIDwmZnBnYW9zYzE+LA0KPiA8JmZwZ2Fvc2MxPjsNCj4gPiAgICAg
ICAgICAgICAgIGNsb2NrLW5hbWVzID0gInB4bGNsayIsICJtY2xrIiwgImFjbGsiLCAicGNsayI7
DQo+ID4gICAgICAgICAgICAgICBhcm0sbWFsaWRwLW91dHB1dC1wb3J0LWxpbmVzID0gL2JpdHMv
IDggPDggOCA4PjsNCj4gPiArICAgICAgICAgICAgIGFybSxtYWxpZHAtYXJxb3MtaGlnaC1sZXZl
bCA9IDwmcnFvc3ZhbHVlPjsNCj4gDQo+IHBoYW5kbGUgaGVyZT8NCj4gDQo+ID4gICAgICAgICAg
ICAgICBwb3J0IHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgZHAwX291dHB1dDogZW5kcG9p
bnQgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9
IDwmdGRhOTk4eF8yX2lucHV0PjsNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
