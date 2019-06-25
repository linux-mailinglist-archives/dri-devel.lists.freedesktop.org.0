Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81175552F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 18:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFAF8936C;
	Tue, 25 Jun 2019 16:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690072.outbound.protection.outlook.com [40.107.69.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F718936C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:53:12 +0000 (UTC)
Received: from BYAPR05MB5240.namprd05.prod.outlook.com (20.177.231.90) by
 BYAPR05MB6119.namprd05.prod.outlook.com (20.178.54.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.12; Tue, 25 Jun 2019 16:53:08 +0000
Received: from BYAPR05MB5240.namprd05.prod.outlook.com
 ([fe80::400:2b5c:7cd8:8356]) by BYAPR05MB5240.namprd05.prod.outlook.com
 ([fe80::400:2b5c:7cd8:8356%4]) with mapi id 15.20.2008.007; Tue, 25 Jun 2019
 16:53:08 +0000
From: Deepak Singh Rawat <drawat@vmware.com>
To: Sam Ravnborg <sam@ravnborg.org>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, Thomas Hellstrom
 <thellstrom@vmware.com>
Subject: Re: [PATCH v2 0/2] drm/vmwgfx: drop use of drmP.h
Thread-Topic: [PATCH v2 0/2] drm/vmwgfx: drop use of drmP.h
Thread-Index: AQHVKa3A03Lb6OEdikuileuIF6ARU6asmdaA
Date: Tue, 25 Jun 2019 16:53:08 +0000
Message-ID: <4c89e54bcb9bd2da0790f6794cacc47b96921d43.camel@vmware.com>
References: <20190623102334.29406-1-sam@ravnborg.org>
In-Reply-To: <20190623102334.29406-1-sam@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:a03:100::29) To BYAPR05MB5240.namprd05.prod.outlook.com
 (2603:10b6:a03:9f::26)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44bc143e-e834-4338-1056-08d6f98d98d4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR05MB6119; 
x-ms-traffictypediagnostic: BYAPR05MB6119:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BYAPR05MB6119BDAFFE71D97410C01C81BAE30@BYAPR05MB6119.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(366004)(199004)(189003)(71200400001)(36756003)(66556008)(66476007)(73956011)(66946007)(14454004)(5660300002)(66446008)(64756008)(6636002)(52116002)(76176011)(256004)(14444005)(99286004)(476003)(102836004)(386003)(26005)(8676002)(446003)(6486002)(478600001)(8936002)(6506007)(2616005)(81156014)(6436002)(3846002)(86362001)(81166006)(229853002)(118296001)(6116002)(486006)(66066001)(316002)(6246003)(2906002)(4326008)(25786009)(50226002)(53936002)(110136005)(68736007)(305945005)(6512007)(71190400001)(186003)(54906003)(7736002)(11346002)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB6119;
 H:BYAPR05MB5240.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m1ZNYkurkZ/jXIOWxhMgLVNLaF1UUA0c8WvmLXa2rxKEolYfNsKUlXLL8xXEM3eV9EulxnBWMThkdfgnDIJXG4c2Zu2mR0KMObPhJMmKFt2YHYtqpxuy6VTfgFlCHLFka3iGIeeFZRE5SHMqcJybKZq1D82XoFz83zVYL/2nO9FVANuW7l+Gq3F1S3HsXZ5JHRlWx1e9/xzz0s6rzWzX0N4Qu8JHKZQhVgf7nqvksA7drmRsR3Wtur4S+i4he9vDjfWet9ui/mo4dyUZhU6CWWHsdiAlGr8HcB9RCtjtreyaS76fUs3RB1rXJ85FAUgBoCcQyMf+O+/GivkNidUa7rpSPUASkG+w6Tiy62J9Qqtg1IYyWEvEY3h2u/vsFB8ExRpqCQx22Itd7P3uXC/dnpK0B2ZXgxnSJwvw7BbBFO4=
Content-ID: <8B82BA25F0C0F14B98BE0AE9DBA8186A@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bc143e-e834-4338-1056-08d6f98d98d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 16:53:08.1206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drawat@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBZgm/yh47W5hHn4Qm8GNgAkqu9o0esSveEAyEHS7gs=;
 b=TzZLBPXdIKJpZ3RrohL0p9L4NzcjAAD2NjZEJWxrveAukidjRk/Ht/2WL8kqTaIbkDLR1QRHmhpEI3ru0J8gXpKMN6+66KIm/5MYWLI+GIZELPldNePyNzilLkrpQBzXkdDi+J37wWodhCoSVHRDqie7l31pfZsaqFILGVNVoDE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=drawat@vmware.com; 
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLA0KDQpUaGFua3MgZm9yIGRvaW5nIHRoaXMuDQoNClJldmlld2VkLWJ5OiBEZWVwYWsg
UmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPg0KDQpJIGRpZCBzb21lIGNvbXBpbGUvYmFzaWMgcnVu
IHRlc3Qgb24geW91ciBwYXRjaHMuIFRoaW5ncyBsb29rIGZpbmUuDQpXaWxsIGluY2x1ZGUgdGhp
cyBmb3Igdm13Z2Z4LW5leHQgc28gY2FuIHJ1biBtb3JlIGF1dG9tYXRlZCB0ZXN0Lg0KDQpPbiBT
dW4sIDIwMTktMDYtMjMgYXQgMTI6MjMgKzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToNCj4gSW4g
dHdvIHN0ZXBzIGRyb3AgdGhlIHVzZSBvZiBkcm1QLmgNCj4gRmlyc3QgcGF0Y2ggcmVtb3ZlIGRy
bVAuaCBmcm9tIGhlYWRlciBmaWxlcyBhbmQgZml4ZXMgZmFsbG91dC4NCj4gU2Vjb25kIHBhdGNo
IHJlbW92ZSBkcm1QLmggZnJvbSB0aGUgcmVtYWluaW5nIGZpbGVzLg0KPiANCj4gV2hpbGUgdG91
Y2hpbmcgdGhlIGxpc3Qgb2YgaW5jbHVkZSBmaWxlcyBkaXZpZGUgdGhlbSBpbiBibG9ja3MNCj4g
YW5kIHNvcnQgaW5jbHVkZSBmaWxlcyB3aXRoaW4gdGhlIGJsb2Nrcy4NCj4gDQo+IFBhdGNoZXMg
bWFkZSBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dCwgYW5kIGNoZWNrZWQgdGhhdA0KPiB0aGV5IGFw
cGx5IHRvIHZtd2dmeC1maXhlcy01LjIgaW4NCj4gZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9y
Zy9+dGhvbWFzaC9saW51eA0KPiANCj4gQnVpbGQgdGVzdGVkIHdpdGggdmFyaW91cyBjb25maWdz
IHdpdGggc2V2ZXJhbCBhcmNoaXRlY3R1cmVzLg0KPiANCj4gdjI6DQo+IC0gZml4IHdhcm5pbmcg
aW4gaTM4NiBidWlsZCByZXBvcnRlZCBieSAwLWRheQ0KPiAgIChtaXNzaW5nIGluY2x1ZGUpDQo+
IA0KPiAgICAgICAgIFNhbQ0KPiANCj4gU2FtIFJhdm5ib3JnICgyKToNCj4gICAgICAgZHJtL3Zt
d2dmeDogZHJvcCB1c2Ugb2YgZHJtUC5oIGluIGhlYWRlciBmaWxlcw0KPiAgICAgICBkcm0vdm13
Z2Z4OiBkcm9wIHJlbWluYWluZyB1c2VycyBvZiBkcm1QLmgNCj4gDQo+ICBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3R0bV9sb2NrLmggICAgICAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC90dG1fb2JqZWN0LmggICAgICAgIHwgIDcgKysrKy0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfYmluZGluZy5oICAgIHwgIDMgKystDQo+ICBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9iby5jICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9jbWRidWYuYyAgICAgfCAgMyArKysNCj4gIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2Rydi5jICAgICAgICB8IDE3ICsrKysrKysrKysrLS0tLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaCAgICAgICAgfCAzMA0KPiArKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Zi
LmMgICAgICAgICB8ICA4ICsrKystLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9mZW5jZS5jICAgICAgfCAgMyArKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2ZlbmNlLmggICAgICB8ICA1ICsrKystDQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9maWZvLmMgICAgICAgfCAgNiArKysrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2dtci5jICAgICAgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2lycS5jICAgICAgICB8ICAzICsrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfa21zLmMgICAgICAgIHwgMTAgKysrKysrKy0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfa21zLmggICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2xkdS5jICAgICAgICB8ICA2ICsrKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfbW9iLmMgICAgICAgIHwgIDIgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X21zZy5jICAgICAgICB8IDExICsrKysrLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9vdmVybGF5LmMgICAgfCAgNiArKy0tLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMgICB8ICA1ICsrLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9zY3JuLmMgICAgICAgfCAgNiArKysrLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X3N0ZHUuYyAgICAgICB8ICA5ICsrKysrKy0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2dsdWUuYyAgIHwgIDEgLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfdmFsaWRhdGlvbi5oIHwgIDMgKystDQo+ICAyNCBmaWxlcyBj
aGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkNCj4gDQo+IA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
