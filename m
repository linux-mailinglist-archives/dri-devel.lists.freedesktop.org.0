Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7929876
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 15:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C0D6E10B;
	Fri, 24 May 2019 13:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D356E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 13:04:07 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6142.namprd05.prod.outlook.com (20.178.244.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.10; Fri, 24 May 2019 13:04:02 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1922.013; Fri, 24 May 2019
 13:04:02 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Thread-Topic: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Thread-Index: AQHVEL1o/6Se9/15V0mUxf0kK0ZgxaZ4RJKAgAHuVQCAAA3ugA==
Date: Fri, 24 May 2019 13:04:02 +0000
Message-ID: <280025344d8590a4d10edfd9990d26d15a983264.camel@vmware.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-4-emil.l.velikov@gmail.com>
 <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
 <20190524121410.GB6233@arch-x1c3>
In-Reply-To: <20190524121410.GB6233@arch-x1c3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d059b73a-7150-48d7-459f-08d6e0484b3a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR05MB6142; 
x-ms-traffictypediagnostic: MN2PR05MB6142:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB61429B8B37EA8D4698474D7AA1020@MN2PR05MB6142.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(68736007)(6246003)(478600001)(26005)(8676002)(2501003)(4744005)(118296001)(81156014)(81166006)(316002)(25786009)(66066001)(256004)(102836004)(2616005)(11346002)(107886003)(229853002)(5640700003)(5660300002)(6506007)(446003)(14454004)(8936002)(2351001)(4326008)(53936002)(6916009)(6436002)(66946007)(6116002)(66446008)(64756008)(66556008)(66476007)(71200400001)(6512007)(86362001)(7736002)(99286004)(36756003)(6486002)(476003)(76176011)(305945005)(91956017)(486006)(1361003)(2906002)(3846002)(54906003)(186003)(71190400001)(73956011)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6142;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gpiYyR1RXOYZQeLq+0R6LVGEhgYdtTFpyPrgno30mbMdqhYY4xQn6RdF90KOk3zIAZsUf0Cc8ihzemYXEl34wjtkajaDI8WfrYFW27HSTTbZwFle57tcGxDB8LbUTft8T40mKeaGEMHEB4ne+yrPA7M4X7hVC+kvluERgoXoVjmvMB36e+mAd8F6TXNBa5JkcZeh197hhqBT4aaCOYmUYE3xuzbC1mHMrk8lJ6J0Tart4WQpxtuikI1vbtlCoA4QJW1UPuWQIGXScR61mnubcmPI6lALWU8G4TutET4E0hFhU7SgbXCxE4HuhTi+0z+kBu0bqpLtayB5zUPRj8NEnbXo3uSkXFL90C85XgFa10Q+ZOnf/aPMv/a756siVnwJt8oaIXhPSg0XCjVdor4iX7Y9iI855q1oEMV0bgxtaho=
Content-ID: <20CD544BB776A744827217412C082511@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d059b73a-7150-48d7-459f-08d6e0484b3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 13:04:02.1672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6142
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7Z1iqf4hXr7+T50tp/kdPKxWV1ETXpdM0ikgU2tPVM=;
 b=iwlm32u6KAtrYbtJX86Wr/e+Pdj1n4x7yKtgT/f//dJwNMHOidC1vbLqmxQws/9WXVw5U+km/egA2dYH3c7Hiywa64KQQUFzw8oseJ13hNhyT2hwUoF9Up7QDv/2wRsndAfz3uii/3Jc0PE6GCgt65maeKu/vTFD8plcpkmWGl0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA1LTI0IGF0IDEzOjE0ICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6DQo+
IE9uIDIwMTkvMDUvMjMsIFRob21hcyBIZWxsc3Ryb20gd3JvdGU6DQo+ID4gSGksIEVtaWwsDQo+
ID4gDQo+ID4gT24gV2VkLCAyMDE5LTA1LTIyIGF0IDE3OjQxICswMTAwLCBFbWlsIFZlbGlrb3Yg
d3JvdGU6DQo+ID4gPiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPg0KPiA+ID4gDQo+ID4gPiBEcm9wIHRoZSBjdXN0b20gaW9jdGwgaW8gZW5jb2RpbmcgY2hl
Y2sgLSBjb3JlIGRybSBkb2VzIGl0IGZvcg0KPiA+ID4gdXMuDQo+ID4gDQo+ID4gSSBmYWlsIHRv
IHNlZSB3aGVyZSB0aGUgY29yZSBkb2VzIHRoaXMsIG9yIGRvIEkgbWlzcyBzb21ldGhpbmc/DQo+
IA0KPiBkcm1faW9jdGwoKSBhbGxvd3MgZm9yIHRoZSBlbmNvZGluZyB0byBiZSBjaGFuZ2VkIGFu
ZCBhdHRyaWJ1dGVzIHRoYXQNCj4gb25seSB0aGUNCj4gYXBwcm9wcmlhdGUgc2l6ZSBpcyBjb3Bp
ZWQgaW4vb3V0IG9mIHRoZSBrZXJuZWwuDQo+IA0KPiBUZWNobmljYWxseSB0aGUgZnVuY3Rpb24g
aXMgbW9yZSByZWxheGVkIHJlbGF0aXZlIHRvIHRoZSB2bXdnZngNCj4gY2hlY2ssIHlldA0KPiBz
ZWVtcyBwZXJmZWN0bHkgcmVhc29uYWJsZS4NCj4gDQo+IElzIHRoZXJlIGFueSBjb3JuZXItY2Fz
ZSB0aGF0IGlzbid0IGJ1dCBzaG91bGQgYmUgaGFuZGxlZCBpbg0KPiBkcm1faW9jdGwoKT8NCg0K
SSdkIGxpa2UgdG8gdHVybiB0aGUgcXVlc3Rpb24gYXJvdW5kIGFuZCBhc2sgd2hldGhlciB0aGVy
ZSdzIGEgcmVhc29uDQp3ZSBzaG91bGQgcmVsYXggdGhlIHZtd2dmeCB0ZXN0PyBJbiB0aGUgcGFz
dCBpdCBoYXMgdHJhcHBlZCBxdWl0ZSBhIGZldw0KdXNlci1zcGFjZSBlcnJvcnMuDQoNClRoYW5r
cywNClRob21hcw0KDQoNCg0KPiANCj4gLUVtaWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
