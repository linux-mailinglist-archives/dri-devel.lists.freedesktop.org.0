Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9136AE9D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 20:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51EA6E177;
	Tue, 16 Jul 2019 18:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730051.outbound.protection.outlook.com [40.107.73.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572526E075;
 Tue, 16 Jul 2019 18:28:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrZj66ZoYmLleaOKOye007XZYkD4XCFcymq/2/QK2KBk/7GpyTpXylrdaW3LjIkh4mJWi+F1VVJbavXVe1CF/ZnkB9RgoCYbQIk9YA5CqTgWtYhXEtqRRuxdOiBe3n3UFVQmTmLfXAF1sbW0N1Z6l8SbfILAcN/FgN6a1cJkNShrlpyrDDkYQc0+OUZu9EVvtsSajLWCNrqgggBn5+2/uuIc9ThPv6CCWvV2WO9qeixqY4nAqViUet/YNAaj2vEXk4wWqQLLlXfbGSND6r17md7McW8BFW/rzPVRCfSJooxC/Si8Kn0jkah1UutGfKhfeYLUpHYfZCBbA2d0HxbYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FncXO3+03jJozW0odtKf0eq4DNWpxcRjCpZMiubfW1I=;
 b=AHEjsIOH7m2jhVb4bGZwoh6x7of2DYmhcMkeeoMIzlzbchYvo+RSO/FA2pRvjrugOE8Y310t8udp48I3dVjMnwX2l7x0j9tnswjKgJsirc8io1GhWuwk5AZgZUWL/v8H/NsqxG1KMkWei49bkDJjvKw6GKgOUHPZTuOmPFXVd5qun8pSC32387ofc7Nz5sHWKTnB1qsvu9fvr11zRX2mPj3aSEEdU7KoFeqb47+TrmOc1E4dT1cknndjVBIPP62bv7aOPwx+G/ctKe8KjbDQRx2K97Ehemqx78KAqXsHcDrLW0eZMjbAdqC8pQGsIf3fLWGmFU4biXOsuqSghcCkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB2983.namprd12.prod.outlook.com (20.178.53.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 18:28:52 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 18:28:52 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "lyude@redhat.com" <lyude@redhat.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/sysfs: Add mstpath attribute to connector devices
Thread-Topic: [PATCH v2] drm/sysfs: Add mstpath attribute to connector devices
Thread-Index: AQHVMz58IfZ3gvdcmESRH3zyPAdG7abEfV4AgAkkxQA=
Date: Tue, 16 Jul 2019 18:28:52 +0000
Message-ID: <a2ed8ffd-1b92-23c8-f56a-36a1ce2bb311@amd.com>
References: <20190704190519.29525-4-sunpeng.li@amd.com>
 <20190705143220.11109-1-sunpeng.li@amd.com>
 <346980b73f3b1fbbc70cbf3771788cec0777d4c0.camel@redhat.com>
In-Reply-To: <346980b73f3b1fbbc70cbf3771788cec0777d4c0.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb8a263e-84b6-455f-e62e-08d70a1b7403
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2983; 
x-ms-traffictypediagnostic: BYAPR12MB2983:
x-microsoft-antispam-prvs: <BYAPR12MB2983B83B0406EA2BC3F7540382CE0@BYAPR12MB2983.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(199004)(189003)(2501003)(2906002)(186003)(36756003)(26005)(76176011)(86362001)(14454004)(102836004)(6486002)(31696002)(99286004)(6506007)(53936002)(52116002)(53546011)(6512007)(25786009)(3846002)(6116002)(386003)(6246003)(4326008)(31686004)(6436002)(81156014)(71190400001)(7736002)(71200400001)(66476007)(316002)(66946007)(66556008)(305945005)(64756008)(66446008)(8676002)(5660300002)(68736007)(54906003)(476003)(446003)(11346002)(8936002)(229853002)(478600001)(486006)(2616005)(256004)(66066001)(110136005)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2983;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hdhYl398r77++72SMiRk7NNvYy6Lm9n0GXIfzgMQ/9n9D3l1T23FjoTb2K/xIBFegMapmVdEMe1l+nXpgLaESGV5lKzZssVy6cReYW4wWagAxnunLr51Ovu25FLDxRPT8gKSAArteMb71qvLwNlxVVKc2k5EZN5DS5/qHsb5LQas5pROR8rDvLOATK5HxpfoT4YE0NAZ9uH8ADRXiIovdwiSCedp6zohikTXeDgTGw21Nqhaq7kVr7/GyQudTi8Jc6AIGOdMdvY5Kf4H3hCDXLIo2JIIItgiNpdrDiTfG4lCaQ5GWnCwmmIsfNTEhgMWCL/0JRzn7hDNnelgWdufKQ3x/kMXJWXcJNfAwTyUx/fdwpld51BZw0AXKkAW1ghTSoshqMURU0T4uOJQuGKWWopqgD+QEz6u7shgZJUlbSI=
Content-ID: <4C06A298E092C84AA8D8933217E86078@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8a263e-84b6-455f-e62e-08d70a1b7403
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 18:28:52.6070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2983
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FncXO3+03jJozW0odtKf0eq4DNWpxcRjCpZMiubfW1I=;
 b=o3GgUY1ndbEE6Oe94Cg0kERWiAlvucBMVUOT1LNXFbCDwoHzaE4ppFX0Icxtmp0366vxKfg5CWH2wpguzqHi8HQ3JXYRt7x5KvCeDZ0fHdWp2pD1zTThqwSFBjcWlpYhmGwQMIMLLauytN/fhYMY5IZgPUZCTVz8lwKMlSG66bQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCg0KT24gMjAxOS0wNy0xMCA2OjUwIHAubS4sIEx5dWRlIFBhdWwgd3JvdGU6DQo+IGdhaC4g
U28sIEkgd2FzIG9yaWdpbmFsbHkgZ29pbmcgdG8gYXNrICJ3aHkgZGlkbid0IHdlIGFkZCB0aGUg
Y29ubmVjdG9yIG5hbWUNCj4gaW50byB0aGlzPyIsIGJ1dCB0aGVuIEkgcmVhbGl6ZWQgd2UncmUg
ZG9pbmcgdGhlIHJpZ2h0IHRoaW5nIGFscmVhZHkgYW5kIGp1c3QNCj4gZG9pbmcgY2FyZCVkLSVz
ICUgKGNhcmRfbnVtYmVyLCBwYXRoX3Byb3ApLiBXaGljaCBtZWFucyB3ZSBwcm9iYWJseSByZWFs
bHkgZG9uJ3QNCj4gd2FudCB0byBhZGQgYSBwcm9wZXJ0eSBjYWxsZWQgbXN0cGF0aCwgc2luY2Ug
aXQncyBoYXJkbHkgZGlmZmVyZW50IGZyb20gcGF0aA0KPiAod2hvb3BzISkuDQo+IA0KPiBBZGRp
dGlvbmFsbHksIGFmdGVyIHNvbWUgdGhpbmtpbmcgSSByZWFsaXplZCBJIG1heSBoYXZlIG1hZGUg
YSBtaXN0YWtlIGFzIEknbQ0KPiBub3QgZW50aXJlbHkgc3VyZSBpZiB3ZSB3b3VsZCBuZWVkIHRv
IHNwZWNpZnkgdGhlIERSTSBjYXJkIGluIHRoZSBwYXRoIHByb3AgZm9yDQo+IHVkZXYsIGNvbnNp
ZGVyaW5nIHRoYXQncyBzcGVjaWZpZWQgaW4gdGhlIHN5c2ZzIHBhdGggYWxsIHJlYWR5LiBFdmVu
IGlmIEknbQ0KPiB3cm9uZyBvbiB0aGF0IHRob3VnaCwgSSB0aGluayBpdCBtaWdodCBiZSBiZXR0
ZXIgbm90IHRvIGFkZCBhbiBtc3RwYXRoIHByb3BlcnR5DQo+IGFuZCBqdXN0IGdvIHRoZSByb3V0
ZSBvZiBqdXN0IGFkZGluZyBhIG5ldyBwYXRoX3YyIHByb3BlcnR5IHRoYXQgd2UgY291bGQgdXNl
DQo+IGZvciBib3RoIE1TVCBhbmQgbm9uLU1TVCBjb25uZWN0b3IgcGF0aHMuIChJIGNjJ2QgeW91
IG9uIHRoZSBlbWFpbCB0aHJlYWQgYWJvdXQNCj4gdGhpcywgc28geW91IGNhbiByZWFkIG1vcmUg
YWJvdXQgdGhpcyB0aGVyZS4NCg0KRnVubnkgZW5vdWdoLCBJIHdhcyBvcmlnaW5hbGx5IHRyeWlu
ZyB0byBtYWtlIHRoaXMgd29yayBmb3IgU1NUIGRldmljZXMuDQpJdCBkaWRuJ3QgbWFrZSBzZW5z
ZSB0byBoYXZlIGJ5LW5hbWUgYW5kIGJ5LXBhdGgsIGJ1dCBvbmx5IGhhdmUgU1NUDQpleGlzdCBp
biB0aGUgYnktbmFtZSBzeW1saW5rcy4gVGhlIHF1ZXN0aW9uIHRoZXJlIHdhcyAid2hhdCB0byB1
c2UgZm9yDQpzc3QgcGF0aHM/IiBFdmVudHVhbGx5IEkgc2V0dGxlZCB3aXRoIGtlZXBpbmcgdGhp
cyBwdXJlbHkgZm9yIHVzZXINCmZyaWVuZGxpbmVzcy4gQnV0IHNpbmNlIGRpc2N1c3Npb24gaXMg
YWxyZWFkeSB1bmRlcndheSBmb3IgYSBiZXR0ZXINCidwYXRoJywgaXQgbWFrZXMgc2Vuc2UgdG8g
ZGVsYXkgdGhpcy4NCg0KPiANCj4gU28sIEkgd291bGQgYWN0dWFsbHkgc3VnZ2VzdCB3ZSBqdXN0
IGRyb3AgdGhpcyBwYXRjaCBlbnRpcmVseSBmb3Igbm93LiBXZSBzaG91bGQNCj4gYmUgZmluZSB3
aXRob3V0IGl0LCBldmVuIHRob3VnaCB0aGUgZHBfYXV4X2RldiBwYXRocyB3aWxsIGJlIGtpbmQg
b2YgdWdseSBmb3IgYQ0KPiBsaXR0bGUgd2hpbGUuIEknZCByYXRoZXIgdGhlIHJlc3Qgb2YgdGhp
cyBzZXJpZXMgZ2V0IHVwc3RyZWFtIGZpcnN0LCBhbmQgdHJ5IHRvDQo+IGRvIHRoZSBwYXRoIHBy
b3Agc3R1ZmYgc2VwYXJhdGVseS4+DQoNClNvdW5kcyBmYWlyLCBnb2luZyB0byBzcGluIHVwIHYz
Lg0KDQpUaGFua3MhDQpMZW8NCg0KPiANCj4gT24gRnJpLCAyMDE5LTA3LTA1IGF0IDEwOjMyIC0w
NDAwLCBzdW5wZW5nLmxpQGFtZC5jb20gd3JvdGU6DQo+PiBGcm9tOiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4NCj4+DQo+PiBUaGlzIGNhbiBiZSB1c2VkIHRvIGNyZWF0ZSBtb3JlIGRlc2Ny
aXB0aXZlIHN5bWxpbmtzIGZvciBNU1QgYXV4DQo+PiBkZXZpY2VzLiBDb25zaWRlciB0aGUgZm9s
bG93aW5nIHVkZXYgcnVsZToNCj4+DQo+PiBTVUJTWVNURU09PSJkcm1fZHBfYXV4X2RldiIsIFNV
QlNZU1RFTVM9PSJkcm0iLCBBVFRSU3ttc3RwYXRofT09Ij8qIiwNCj4+IAlTWU1MSU5LKz0iZHJt
X2RwX2F1eC9ieS1wYXRoLyRhdHRye21zdHBhdGh9Ig0KPj4NCj4+IFRoZSBmb2xsb3dpbmcgc3lt
bGlua3Mgd2lsbCBiZSBjcmVhdGVkIChkZXBlbmRpbmcgb24geW91ciBNU1QgdG9wb2xvZ3kpOg0K
Pj4NCj4+ICQgbHMgL2Rldi9kcm1fZHBfYXV4L2J5LXBhdGgvDQo+PiBjYXJkMC1tc3Q6MC0xICBj
YXJkMC1tc3Q6MC0xLTEgIGNhcmQwLW1zdDowLTEtOCAgY2FyZDAtbXN0OjAtOA0KPj4NCj4+IHYy
OiByZW1vdmUgdW5uZWNlc3NhcnkgbG9ja2luZyBvZiBtb2RlX2NvbmZpZy5tdXRleA0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KPj4gLS0tDQo+PiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4+
ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMN
Cj4+IGluZGV4IGFkMTA4MTBiYzk3Mi4uN2Q0ODNhYjY4NGEwIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9zeXNmcy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5
c2ZzLmMNCj4+IEBAIC0yMzYsMTYgKzIzNiwzNiBAQCBzdGF0aWMgc3NpemVfdCBtb2Rlc19zaG93
KHN0cnVjdCBkZXZpY2UgKmRldmljZSwNCj4+ICAJcmV0dXJuIHdyaXR0ZW47DQo+PiAgfQ0KPj4g
IA0KPj4gK3N0YXRpYyBzc2l6ZV90IG1zdHBhdGhfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXZpY2Us
DQo+PiArCQkJICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPj4gKwkJCSAgICBj
aGFyICpidWYpDQo+PiArew0KPj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0g
dG9fZHJtX2Nvbm5lY3RvcihkZXZpY2UpOw0KPj4gKwlzc2l6ZV90IHJldCA9IDA7DQo+PiArCWNo
YXIgKnBhdGg7DQo+PiArDQo+PiArCWlmICghY29ubmVjdG9yLT5wYXRoX2Jsb2JfcHRyKQ0KPj4g
KwkJcmV0dXJuIHJldDsNCj4+ICsNCj4+ICsJcGF0aCA9IGNvbm5lY3Rvci0+cGF0aF9ibG9iX3B0
ci0+ZGF0YTsNCj4+ICsJcmV0ID0gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICJjYXJkJWQtJXNc
biIsDQo+PiArCQkgICAgICAgY29ubmVjdG9yLT5kZXYtPnByaW1hcnktPmluZGV4LCBwYXRoKTsN
Cj4+ICsNCj4+ICsJcmV0dXJuIHJldDsNCj4+ICt9DQo+PiArDQo+PiAgc3RhdGljIERFVklDRV9B
VFRSX1JXKHN0YXR1cyk7DQo+PiAgc3RhdGljIERFVklDRV9BVFRSX1JPKGVuYWJsZWQpOw0KPj4g
IHN0YXRpYyBERVZJQ0VfQVRUUl9STyhkcG1zKTsNCj4+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8o
bW9kZXMpOw0KPj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhtc3RwYXRoKTsNCj4+ICANCj4+ICBz
dGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqY29ubmVjdG9yX2Rldl9hdHRyc1tdID0gew0KPj4gIAkm
ZGV2X2F0dHJfc3RhdHVzLmF0dHIsDQo+PiAgCSZkZXZfYXR0cl9lbmFibGVkLmF0dHIsDQo+PiAg
CSZkZXZfYXR0cl9kcG1zLmF0dHIsDQo+PiAgCSZkZXZfYXR0cl9tb2Rlcy5hdHRyLA0KPj4gKwkm
ZGV2X2F0dHJfbXN0cGF0aC5hdHRyLA0KPj4gIAlOVUxMDQo+PiAgfTsNCj4+ICANCj4gDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
