Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708BD27628
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 08:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3169889BD5;
	Thu, 23 May 2019 06:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810040.outbound.protection.outlook.com [40.107.81.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DB089BD5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 06:45:04 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6272.namprd05.prod.outlook.com (20.178.240.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.13; Thu, 23 May 2019 06:44:54 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1922.013; Thu, 23 May 2019
 06:44:54 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Thread-Topic: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Thread-Index: AQHVEL1o/6Se9/15V0mUxf0kK0ZgxaZ4RJKA
Date: Thu, 23 May 2019 06:44:54 +0000
Message-ID: <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-4-emil.l.velikov@gmail.com>
In-Reply-To: <20190522164119.24139-4-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47ec8baa-0c75-458e-2c54-08d6df4a2a2f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR05MB6272; 
x-ms-traffictypediagnostic: MN2PR05MB6272:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB627286769BD4978913A8F57FA1010@MN2PR05MB6272.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(366004)(136003)(346002)(396003)(199004)(189003)(68736007)(8936002)(66476007)(4326008)(76176011)(305945005)(316002)(99286004)(86362001)(6506007)(6116002)(2906002)(118296001)(7736002)(102836004)(3846002)(73956011)(66446008)(66556008)(64756008)(66946007)(66066001)(110136005)(54906003)(36756003)(81166006)(81156014)(8676002)(76116006)(91956017)(71200400001)(71190400001)(486006)(6436002)(6512007)(107886003)(25786009)(229853002)(446003)(476003)(2501003)(6486002)(2616005)(11346002)(53936002)(478600001)(6246003)(14454004)(5660300002)(186003)(26005)(14444005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6272;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g3yloJfByTmWpC7jp7Nfs15hZsgF7DBJpGFof3iBYmuxuyQdtmjQ3HRY6cklQXObP/RZ0efJYMKc3m255uii/9zyXy+V60xcNt7qFtTKU2jkY93M886UVrj6a+ty8hw+xUGuKBYumKXCwDes4Vu7HkNJbRqklXQ+xEc9RnNUESJMHVcaUvxB4nN8pq4Ltq6M7WxPVYgUpT01paCe19/6Xq0s+7dV4lqVH/gFhWlKoVdYmX7Tfmmr3mcwFnNPkO9IBMsuPcHRvdBnOvnvKz2Eown3oIKZcvQJBB342jAd3sl231WPSch3WckkkbBr6wYM8JHsw3hbCNS0CUVV0omSmjhq2GnJpBPM021U1NoiNWiDNYhSwS76tnEuTbqFhzJXO4z/2IZ5N6ng/HtosmlyisqqSe7PfU0Zr7J+smIjKSg=
Content-ID: <FF912C1DA36CFD42A3B50CEA94DEFCA5@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ec8baa-0c75-458e-2c54-08d6df4a2a2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 06:44:54.6493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cMwzyoAcl9KO863qgwZrZAtzkojQZSZPZQkZHrHJrU=;
 b=yLKNxWgHLyRJgMzUrGW09MaMsbyFH85LFSHcISkWYGsUVH2uwhzC+YKq9grOqt51zeEw9rFxoYr+vYex+pbs+mit12YUoWwQOa2AA/ARft4v+tEJIKZed4xQyfLU0OgyxiNuVJ+LlxWaNfyjV6gNjRVu8ME1gamejudbdWqDxgA=
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
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVtaWwsDQoNCk9uIFdlZCwgMjAxOS0wNS0yMiBhdCAxNzo0MSArMDEwMCwgRW1pbCBWZWxp
a292IHdyb3RlOg0KPiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPg0KPiANCj4gRHJvcCB0aGUgY3VzdG9tIGlvY3RsIGlvIGVuY29kaW5nIGNoZWNrIC0gY29y
ZSBkcm0gZG9lcyBpdCBmb3IgdXMuDQoNCkkgZmFpbCB0byBzZWUgd2hlcmUgdGhlIGNvcmUgZG9l
cyB0aGlzLCBvciBkbyBJIG1pc3Mgc29tZXRoaW5nPw0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KPiAN
Cj4gQ2M6ICJWTXdhcmUgR3JhcGhpY3MiIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2Fy
ZS5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+DQo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IFNpZ25lZC1vZmYtYnk6IEVt
aWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCA5IC0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9k
cnYuYw0KPiBpbmRleCAyY2I2YWUyMTllNDMuLmY2NTU0MjYzOWI1NSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gQEAgLTExNDcsOSArMTE0Nyw2IEBAIHN0YXRpYyBs
b25nIHZtd19nZW5lcmljX2lvY3RsKHN0cnVjdCBmaWxlDQo+ICpmaWxwLCB1bnNpZ25lZCBpbnQg
Y21kLA0KPiAgCQkJCXJldHVybiAtRUFDQ0VTOw0KPiAgCQl9DQo+ICANCj4gLQkJaWYgKHVubGlr
ZWx5KGlvY3RsLT5jbWQgIT0gY21kKSkNCj4gLQkJCWdvdG8gb3V0X2lvX2VuY29kaW5nOw0KPiAt
DQo+ICAJCWZsYWdzID0gaW9jdGwtPmZsYWdzOw0KPiAgCX0gZWxzZSBpZiAoIWRybV9pb2N0bF9m
bGFncyhuciwgJmZsYWdzKSkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+IEBAIC0xMTY5LDEyICsx
MTY2LDYgQEAgc3RhdGljIGxvbmcgdm13X2dlbmVyaWNfaW9jdGwoc3RydWN0IGZpbGUNCj4gKmZp
bHAsIHVuc2lnbmVkIGludCBjbWQsDQo+ICAJCXR0bV9yZWFkX3VubG9jaygmdm1hc3Rlci0+bG9j
ayk7DQo+ICANCj4gIAlyZXR1cm4gcmV0Ow0KPiAtDQo+IC1vdXRfaW9fZW5jb2Rpbmc6DQo+IC0J
RFJNX0VSUk9SKCJJbnZhbGlkIGNvbW1hbmQgZm9ybWF0LCBpb2N0bCAlZFxuIiwNCj4gLQkJICBu
ciAtIERSTV9DT01NQU5EX0JBU0UpOw0KPiAtDQo+IC0JcmV0dXJuIC1FSU5WQUw7DQo+ICB9DQo+
ICANCj4gIHN0YXRpYyBsb25nIHZtd191bmxvY2tlZF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwg
dW5zaWduZWQgaW50IGNtZCwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
