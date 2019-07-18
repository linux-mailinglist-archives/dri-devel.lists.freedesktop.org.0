Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C66CFE7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CA36E3F0;
	Thu, 18 Jul 2019 14:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770089.outbound.protection.outlook.com [40.107.77.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B421F6E3F4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Os2LQvstea7oxajN+5TmNHZPE2msagx7IryJBnkD5bSnLQfiNkzjCu3AFHk5+V9YIadabN2YBsOkwmZPFFY+IsdAzwsF9O1i557shfI6U1yNMNpjfZ/iNw0ETv7Ct4deyZQTT3jELJKyAylUNLjZ3pMIH3jqIUydthuftNwissORzVu1ouarNZnOPf5Dv1VEC4jkdJ3ueyO17p9p2VZD6Yt060e09PzTQvzuLwNkAx1SqUnAWAXprlMNyhOs7OXzr+siMD0/lHpZjErrUFJKL0t+kUiic+fQF7bjDZ7/eZLqnCOiQJD7lpLtZtxTnE6+racnvdv0+mTDWkHdo2bp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbFpLlCdyamYo/lPYRutMzPnfY5iO8frng86iAnN48A=;
 b=hwPDsDcDiEUg54pFq6Uhl6IfEbm+7yUJuAe8GP22G7yeExZylO2LFZm6AU2lFaITsA1FG/Cg1MSIk1ll8uYZ4lCk20xQL2/I+ihnusMyDkeWRb156t/RuWANvktA7NcoJMRPVEJ1nVRSU3/3gccOwMV+WDXJ/XbSyP4zF8LrxzS+LDzdDf4uTLOm8dfYf3w10v3jIHkn02r12xl72b3s/kwsxkcQabtq8zDcxyOiw8MZfIB7HhUhFAUfQUbuSGTAn2d3RkjLXly+CkswD/2ZVh3kNfEmPQCzR6EcocvJmGpVnVbKF0tZ4UpR3NF5X8zYR4tWZRFc0TuSw/eO4vexbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 14:33:28 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 14:33:28 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Topic: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Index: AQHVPVnoqE0gPkoYWUCt/IPkTJivbabQPf2AgAAZI4CAABK/gIAABs2A
Date: Thu, 18 Jul 2019 14:33:28 +0000
Message-ID: <30bdbec2-4ae1-943b-86a2-2424655fedf5@amd.com>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <3bef64d0-97be-6aed-aa10-7a4592e7fb54@intel.com>
 <d7085a57-b9fc-c5d8-bea2-10cabb80f0f8@amd.com>
 <36d29516-42e7-6ce5-88fc-a005ed4432d6@intel.com>
In-Reply-To: <36d29516-42e7-6ce5-88fc-a005ed4432d6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:203:b0::25) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c332f4c-7bdc-4b21-776d-08d70b8ce636
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-microsoft-antispam-prvs: <MN2PR12MB34408B3B5556FBF7981E915EB4C80@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(189003)(199004)(2906002)(5660300002)(36756003)(110136005)(478600001)(305945005)(7736002)(81156014)(6512007)(256004)(68736007)(316002)(3846002)(81166006)(6116002)(2501003)(66946007)(66556008)(8676002)(8936002)(229853002)(31686004)(6486002)(6436002)(53936002)(71200400001)(486006)(476003)(386003)(66446008)(26005)(446003)(64756008)(31696002)(52116002)(186003)(53546011)(66066001)(2616005)(66476007)(6246003)(71190400001)(25786009)(11346002)(14444005)(14454004)(6506007)(102836004)(99286004)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1Mb0Es1LQEFvMnBtc1uz8oOhbZCKmv5riiz+7xbo/h8iwL+kXpVJjlyjblc9RLJG9aERV+pN77Y8yxKRvKyFR8LdkjImxqWuEjXmmEr9K6JitijNdeOxa27mwpZ6x9WR2MIdcYd2kp8aG0PV//nJSUiNk026D4w5Zzm6HT3bmynERpnXkdRJvv31a9Jgw990NHuXJ+wHgruryTxILCKE7uNz579aJ/xy215rDuWVh7+7cCXTLfZ2BjuJnSgsT9DUmhIPdase3HkD5GlrVBK6Ow5Deu3wyaL8rCp/yeGyti6JFcbmuBIwmpxpATiQoLWS+vM4QZW9q0HbKfSJTuVtGVDoTHDaYc6WV312rjB+D4e0ivVlcFP8M/ctR8nYEj2vfkTys1JqA0+ShIBAoAqIL2L+knHd++Nw5kk78MtfS2E=
Content-ID: <6324E8B1B802AD44804737DB3EC0E155@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c332f4c-7bdc-4b21-776d-08d70b8ce636
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 14:33:28.4229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbFpLlCdyamYo/lPYRutMzPnfY5iO8frng86iAnN48A=;
 b=hFBBCkIoMh6NPCNP9cTUQ51JRQMJTjIFfqFv/3NTaGmfK1PaTW+1+66hBtrciztfepA2jUJE9RQxgPeq5rGIfaEL0EqbL5l5U80jrrba5WVMYpRcyftsGvXsXxEhLPV2SRdk/k6XVmtYTf6SrazOelwjwLyrMuY70XPl/scGbFk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQrlnKggMjAxOS83LzE4IDIyOjA4LCBMaW9uZWwgTGFuZHdlcmxpbiDlhpnpgZM6DQo+IE9uIDE4
LzA3LzIwMTkgMTY6MDIsIENodW5taW5nIFpob3Ugd3JvdGU6DQo+PiDlnKggMjAxOS83LzE4IDE5
OjMxLCBMaW9uZWwgTGFuZHdlcmxpbiDlhpnpgZM6DQo+Pj4gT24gMTgvMDcvMjAxOSAxNDoxMywg
Q2h1bm1pbmcgWmhvdSB3cm90ZToNCj4+Pj4gaWYgV0FJVF9GT1JfU1VCTUlUIGlzbid0IHNldCBh
bmQgaW4gdGhlIG1lYW53aGlsZSBubyB1bmRlcmx5aW5nIGZlbmNlDQo+Pj4+IG9uIHN5bmNvYmos
DQo+Pj4+IHRoZW4gcmV0dXJuIG5vbi1ibG9jayBlcnJvciBjb2RlIHRvIHVzZXIgc2FwY2UuDQo+
Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5j
b20+DQo+Pj4+IC0tLQ0KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwg
NCArKy0tDQo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jDQo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4+Pj4gaW5kZXgg
MzYxYTAxYTA4YzE4Li45MjlmN2M2NGY5YTIgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fc3luY29iai5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29i
ai5jDQo+Pj4+IEBAIC0yNTIsNyArMjUyLDcgQEAgaW50IGRybV9zeW5jb2JqX2ZpbmRfZmVuY2Uo
c3RydWN0IGRybV9maWxlDQo+Pj4+ICpmaWxlX3ByaXZhdGUsDQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9m
ZW5jZV9wdXQoKmZlbmNlKTsNCj4+Pj4gwqDCoMKgwqDCoMKgIH0gZWxzZSB7DQo+Pj4+IC3CoMKg
wqDCoMKgwqDCoCByZXQgPSAtRUlOVkFMOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVO
T1RCTEs7DQo+Pj4+IMKgwqDCoMKgwqDCoCB9DQo+Pj4+IMKgwqAgwqDCoMKgwqDCoCBpZiAoIShm
bGFncyAmIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJVF9GT1JfU1VCTUlUKSkNCj4+Pj4gQEAg
LTgzMiw3ICs4MzIsNyBAQCBzdGF0aWMgc2lnbmVkIGxvbmcNCj4+Pj4gZHJtX3N5bmNvYmpfYXJy
YXlfd2FpdF90aW1lb3V0KHN0cnVjdCBkcm1fc3luY29iaiAqKnN5bmNvYmpzLA0KPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmbGFncyAmIERSTV9TWU5DT0JKX1dBSVRfRkxB
R1NfV0FJVF9GT1JfU1VCTUlUKSB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb250aW51ZTsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVs
c2Ugew0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpbWVvdXQgPSAtRUlO
VkFMOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpbWVvdXQgPSAtRU5P
VEJMSzsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gY2xl
YW51cF9lbnRyaWVzOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+DQo+Pj4gVGhpcyB3b3VsZCBicmVhayBleGlzdGlu
ZyB0ZXN0cyBmb3IgYmluYXJ5IHN5bmNvYmpzLg0KPj4gSG93IGRvZXMgdGhpcyBicmVha3MgYmlu
YXJ5IHN5bmNvYmo/DQo+DQo+DQo+IFRoaXMgaXMgdXNlZCBpbiB0aGUgc3VibWlzc2lvbiBwYXRo
IG9mIHNldmVyYWwgZHJpdmVycy4NCj4NCj4gQ2hhbmdpbmcgdGhlIGVycm9yIGNvZGUgd2lsbCBj
aGFuZ2Ugd2hhdCB0aGUgZHJpdmVycyBhcmUgcmVwb3J0aW5nIHRvIA0KPiB1c2Vyc3BhY2UgYW5k
IGNvdWxkIGJyZWFrIHRlc3RzLg0KPg0KPg0KPiBpOTE1IGRvZXNuJ3QgdXNlIHRoYXQgZnVuY3Rp
b24gc28gaXQncyBub3QgYWZmZWN0ZWQgYnV0IA0KPiBsaW1hL3BhbmZyb3N0L3ZjNCBzZWVtIHRv
IGJlLg0KDQoNCmFueW9uZSBmcm9tIHZjNCBjYW4gY29uZmlybSB0aGlzPyBUaGVyZSBhcmUgbWFu
eSBwbGFjZSBpbiB3YWl0X2lvY3RsIA0KYmVpbmcgYWJsZSB0byByZXR1cm4gcHJldmlvdXMgRUlO
VkFMLCBub3Qgc3VyZSB3aGF0IHRoZXkgdXNlIHRvLg0KDQoNCj4NCj4NCj4+DQo+Pg0KPj4+IElz
IHRoaXMgcmVhbGx5IHdoYXQgd2Ugd2FudD8NCj4+IEkgd2FudCB0byB1c2UgdGhpcyBtZWFuaW5n
ZnVsIHJldHVybiB2YWx1ZSB0byBqdWRnZSBpZiBXYWl0QmVmb3JlU2lnbmFsDQo+PiBoYXBwZW5z
Lg0KPj4NCj4+IEkgdGhpbmsgdGhpcyBpcyB0aGUgY2hlYXBlc3QgY2hhbmdlIGZvciB0aGF0Lg0K
Pg0KPg0KPiBJIHRob3VnaHQgdGhlIHBsYW4gd2FzIHRvIGFkZCBhIG5ldyBpb2N0bCB0byBxdWVy
eSB0aGUgbGFzdCBzdWJtaXR0ZWQgDQo+IHZhbHVlLg0KDQpZZXMsIHRoYXQgaXMgb3B0aW9uYWwg
d2F5IHRvby7CoCBJIGp1c3QgdGhvdWdodCBjaGFuZ2luZyByZXR1cm4gdmFsdWUgaXMgDQp2ZXJ5
IGNoZWFwLCBpc24ndCBpdD8NCg0KDQotRGF2aWQNCg0KPg0KPiBEaWQgSSBtaXN1bmRlcnN0YW5k
Pw0KPg0KPg0KPiBUaGFua3MsDQo+DQo+DQo+IC1MaW9uZWwNCj4NCj4NCj4+DQo+PiAtRGF2aWQN
Cj4+DQo+Pg0KPj4+DQo+Pj4gLUxpb25lbA0KPj4+DQo+Pj4NCj4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
