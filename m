Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6061649C
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 15:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29646E7C0;
	Tue,  7 May 2019 13:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4066E7C0;
 Tue,  7 May 2019 13:32:59 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2792.namprd12.prod.outlook.com (20.177.126.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 13:32:57 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f0ea:976a:f48c:35a1]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f0ea:976a:f48c:35a1%2]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 13:32:57 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Uma Shankar <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [v8 02/10] drm: Parse HDR metadata info from EDID
Thread-Topic: [v8 02/10] drm: Parse HDR metadata info from EDID
Thread-Index: AQHU7u/1rMcoN50RTEaLaEDv05hxrqZf1NeA
Date: Tue, 7 May 2019 13:32:57 +0000
Message-ID: <554707fd-af9c-c286-246a-a0a82de08b45@amd.com>
References: <1554828284-17776-1-git-send-email-uma.shankar@intel.com>
 <1554828284-17776-3-git-send-email-uma.shankar@intel.com>
In-Reply-To: <1554828284-17776-3-git-send-email-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc0d5e91-5213-4172-e0d7-08d6d2f08415
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2792; 
x-ms-traffictypediagnostic: BYAPR12MB2792:
x-microsoft-antispam-prvs: <BYAPR12MB279235D681A14A6B19C199DEEC310@BYAPR12MB2792.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(346002)(396003)(136003)(199004)(189003)(36756003)(11346002)(6436002)(71200400001)(102836004)(53546011)(6486002)(229853002)(76176011)(3846002)(6506007)(386003)(26005)(66476007)(31686004)(66446008)(2201001)(64756008)(66946007)(2906002)(86362001)(66556008)(7736002)(305945005)(31696002)(5660300002)(73956011)(6116002)(476003)(81166006)(6512007)(6246003)(53936002)(8676002)(99286004)(71190400001)(2616005)(486006)(25786009)(4326008)(446003)(8936002)(68736007)(256004)(478600001)(2501003)(110136005)(186003)(52116002)(72206003)(14454004)(66066001)(81156014)(54906003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2792;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a4XiWmREr/XB1m+57MbRIb4/gJZS/yJVa6pKnrJFHYVIUqtt/SfTOSZg79RKf5h5+OCyHVeculPdlAR3uJv/kcNIA+fIBYn6hPzpsWJCYd3CqVl11u4GdlH/HhAl0Vg6CzA80ABSOtVyjHywvC3EXaCn8islwtk+wu28mKUt7THbopkSXMLfdrUgyTmY/Pp/4a2l+AU12igjTZOcXDFGpUHDLA4Nl8GwT8JTEMhRRYQ3e5BPGjByePdnwA/DHg5tZ8s3eVIiUTjkwy2uXk0f+hDFWuUK1EDrRl4R0XEfiw6y2gFxjsHOzXo22S/tQOXzqfMetioUjgHUHJFDzCewNE3bCKOR/49m9gURVZaQnNPYWLz1g5/Ho4VdPumQDlP/7+Qmq6tw6/uUS8007Y0ipMCH2a4hp/vE8IaUWl2Tp0I=
Content-ID: <6B6A7126C03D5043BD20F39DE28EEA63@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0d5e91-5213-4172-e0d7-08d6d2f08415
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 13:32:57.2716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2792
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H18BJpmGhivQg97gb42BLm5oesz4tiyQjv6NChABH68=;
 b=0LvBBy0nxz+A2TBTZ47nGAknWDFw3iWzu1dZkyAWySkMIOOSLSVgInD1XcKe+dJpGfEfeQm4OFJwUetP7zeu4YQ5UMwC/dRZunBaKrLv1111A2Jy/kYx0xhwewnbSZh3BGRaUKkskrgvGvuaWqyR2Dh6kiLYq5prEOHp7tZBbA8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "ville.syrjala@intel.com" <ville.syrjala@intel.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dcastagna@chromium.org" <dcastagna@chromium.org>,
 "maarten.lankhorst@intel.com" <maarten.lankhorst@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC85LzE5IDEyOjQ0IFBNLCBVbWEgU2hhbmthciB3cm90ZToNCj4gSERSIG1ldGFkYXRhIGJs
b2NrIGlzIGludHJvZHVjZWQgaW4gQ0VBLTg2MS4zIHNwZWMuDQo+IFBhcnNpbmcgdGhlIHNhbWUg
dG8gZ2V0IHRoZSBwYW5lbCdzIEhEUiBtZXRhZGF0YS4NCj4gDQo+IHYyOiBSZWJhc2UgYW5kIGFk
ZGVkIFZpbGxlJ3MgUE9DIGNoYW5nZXMgdG8gdGhlIHBhdGNoLg0KPiANCj4gdjM6IE5vIENoYW5n
ZQ0KPiANCj4gdjQ6IEFkZHJlc3NlZCBTaGFzaGFuaydzIHJldmlldyBjb21tZW50cw0KPiANCj4g
djU6IEFkZHJlc3NlZCBTaGFzaGFuaydzIGNvbW1lbnQgYW5kIGFkZGVkIGhpcyBSQi4NCj4gDQo+
IHY2OiBBZGRyZXNzZWQgSm9uYXMgS2FybG1hbiByZXZpZXcgY29tbWVudHMuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiBSZXZpZXdl
ZC1ieTogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDUyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMNCj4gaW5kZXggMmMyMmVhNC4uMWZjMzcxYiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMNCj4gQEAgLTI4MzAsNiArMjgzMCw3IEBAIHN0YXRpYyBpbnQgZHJt
X2N2dF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAgICNkZWZpbmUg
VklERU9fQkxPQ0sgICAgIDB4MDINCj4gICAjZGVmaW5lIFZFTkRPUl9CTE9DSyAgICAweDAzDQo+
ICAgI2RlZmluZSBTUEVBS0VSX0JMT0NLCTB4MDQNCj4gKyNkZWZpbmUgSERSX1NUQVRJQ19NRVRB
REFUQV9CTE9DSwkweDYNCj4gICAjZGVmaW5lIFVTRV9FWFRFTkRFRF9UQUcgMHgwNw0KPiAgICNk
ZWZpbmUgRVhUX1ZJREVPX0NBUEFCSUxJVFlfQkxPQ0sgMHgwMA0KPiAgICNkZWZpbmUgRVhUX1ZJ
REVPX0RBVEFfQkxPQ0tfNDIwCTB4MEUNCj4gQEAgLTM1NzcsNiArMzU3OCwxMiBAQCBzdGF0aWMg
aW50IGFkZF8zZF9zdHJ1Y3RfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwg
dTE2IHN0cnVjdHVyZSwNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGludA0KPiArY2VhX2RiX3Bh
eWxvYWRfbGVuX2V4dChjb25zdCB1OCAqZGIpDQo+ICt7DQo+ICsJcmV0dXJuIChkYlswXSAmIDB4
MWYpIC0gMTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludA0KPiAgIGNlYV9kYl9leHRlbmRlZF90
YWcoY29uc3QgdTggKmRiKQ0KPiAgIHsNCj4gICAJcmV0dXJuIGRiWzFdOw0KPiBAQCAtMzgxMiw2
ICszODE5LDQ5IEBAIHN0YXRpYyB2b2lkIGZpeHVwX2RldGFpbGVkX2NlYV9tb2RlX2Nsb2NrKHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQ0KPiAgIAltb2RlLT5jbG9jayA9IGNsb2NrOw0K
PiAgIH0NCj4gICANCj4gK3N0YXRpYyBib29sIGNlYV9kYl9pc19oZG1pX2hkcl9tZXRhZGF0YV9i
bG9jayhjb25zdCB1OCAqZGIpDQo+ICt7DQo+ICsJaWYgKGNlYV9kYl90YWcoZGIpICE9IFVTRV9F
WFRFTkRFRF9UQUcpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiArCWlmIChkYlsxXSAhPSBI
RFJfU1RBVElDX01FVEFEQVRBX0JMT0NLKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQoNClNob3VsZG4n
dCB0aGlzIGp1c3QgYmUgY2VhX2RiX2V4dGVuZGVkX3RhZyhkYikgIT0gSERSX1NUQVRJQ19NRVRB
REFUQV9CTE9DSz8NCg0KQWxzbywgdGhlIG90aGVyIGZ1bmN0aW9ucyBhbGwgY2hlY2sgdGhhdCB3
ZSdyZSBnaXZlbiBhIHZhbGlkIGhlcmUgaGVyZSB3aXRoOg0KDQppZiAoIWNlYV9kYl9wYXlsb2Fk
X2xlbl9leHQoZGIpKQ0KICAgICByZXR1cm4gZmFsc2U7DQoNCklzIHRoZXJlIGFueSByZWFzb24g
dGhpcyBpc24ndCBkb25lIGhlcmU/DQoNCg0KPiArDQo+ICsJcmV0dXJuIHRydWU7DQo+ICt9DQo+
ICsNCj4gK3N0YXRpYyB1aW50OF90IGVvdGZfc3VwcG9ydGVkKGNvbnN0IHU4ICplZGlkX2V4dCkN
Cj4gK3sNCj4gKwlyZXR1cm4gZWRpZF9leHRbMl0gJg0KPiArCQkoQklUKEhETUlfRU9URl9UUkFE
SVRJT05BTF9HQU1NQV9TRFIpIHwNCj4gKwkJIEJJVChIRE1JX0VPVEZfVFJBRElUSU9OQUxfR0FN
TUFfSERSKSB8DQo+ICsJCSBCSVQoSERNSV9FT1RGX1NNUFRFX1NUMjA4NCkpOw0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgdWludDhfdCBoZHJfbWV0YWRhdGFfdHlwZShjb25zdCB1OCAqZWRpZF9leHQp
DQo+ICt7DQo+ICsJcmV0dXJuIGVkaWRfZXh0WzNdICYNCj4gKwkJQklUKEhETUlfU1RBVElDX01F
VEFEQVRBX1RZUEUxKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQNCj4gK2RybV9wYXJzZV9o
ZHJfbWV0YWRhdGFfYmxvY2soc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgY29uc3Qg
dTggKmRiKQ0KPiArew0KPiArCXUxNiBsZW47DQo+ICsNCj4gKwlsZW4gPSBjZWFfZGJfcGF5bG9h
ZF9sZW5fZXh0KGRiKTsNCj4gKwljb25uZWN0b3ItPmhkcl9zaW5rX21ldGFkYXRhLmhkbWlfdHlw
ZTEuZW90ZiA9IGVvdGZfc3VwcG9ydGVkKGRiKTsNCj4gKwljb25uZWN0b3ItPmhkcl9zaW5rX21l
dGFkYXRhLmhkbWlfdHlwZTEubWV0YWRhdGFfdHlwZSA9DQo+ICsJCQkJCWhkcl9tZXRhZGF0YV90
eXBlKGRiKTsNCg0KV2hpbGUgbWV0YWRhdGFfdHlwZSBpcyBhc3NpZ25lZCBoZXJlIGxpa2UgaXQg
c2hvdWxkIGJlLCBpdCBpc24ndCANCmFzc2lnbmVkIHRvIHRoZSBvdXRlciBtZXRhZGF0YV90eXBl
IGluIHRoZSBoZHJfc2lua19tZXRhZGF0YS4gSSBhbHNvIA0KY2FuJ3Qgc2VlIGFueXRoaW5nIGlu
IHRoZSBvdGhlciBwYXRjaGVzIHRoYXQgYXNzaWducyB0aGlzIGFueXdoZXJlLg0KDQpTaG91bGRu
J3QgaXQgYWxzbyBiZSBzZXQgaGVyZT8NCg0KPiArDQo+ICsJaWYgKGxlbiA+PSA0KQ0KPiArCQlj
b25uZWN0b3ItPmhkcl9zaW5rX21ldGFkYXRhLmhkbWlfdHlwZTEubWF4X2NsbCA9IGRiWzRdOw0K
PiArCWlmIChsZW4gPj0gNSkNCj4gKwkJY29ubmVjdG9yLT5oZHJfc2lua19tZXRhZGF0YS5oZG1p
X3R5cGUxLm1heF9mYWxsID0gZGJbNV07DQo+ICsJaWYgKGxlbiA+PSA2KQ0KPiArCQljb25uZWN0
b3ItPmhkcl9zaW5rX21ldGFkYXRhLmhkbWlfdHlwZTEubWluX2NsbCA9IGRiWzZdOw0KPiArfQ0K
PiArDQo+ICAgc3RhdGljIHZvaWQNCj4gICBkcm1fcGFyc2VfaGRtaV92c2RiX2F1ZGlvKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGNvbnN0IHU4ICpkYikNCj4gICB7DQo+IEBAIC00
NDM5LDYgKzQ0ODksOCBAQCBzdGF0aWMgdm9pZCBkcm1fcGFyc2VfY2VhX2V4dChzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAgIAkJCWRybV9wYXJzZV95NDIwY21kYl9iaXRtYXAo
Y29ubmVjdG9yLCBkYik7DQo+ICAgCQlpZiAoY2VhX2RiX2lzX3ZjZGIoZGIpKQ0KPiAgIAkJCWRy
bV9wYXJzZV92Y2RiKGNvbm5lY3RvciwgZGIpOw0KPiArCQlpZiAoY2VhX2RiX2lzX2hkbWlfaGRy
X21ldGFkYXRhX2Jsb2NrKGRiKSkNCj4gKwkJCWRybV9wYXJzZV9oZHJfbWV0YWRhdGFfYmxvY2so
Y29ubmVjdG9yLCBkYik7DQo+ICAgCX0NCj4gICB9DQo+ICAgDQo+IA0KDQpOaWNob2xhcyBLYXps
YXVza2FzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
