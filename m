Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60035F67
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD02889C17;
	Wed,  5 Jun 2019 14:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730080.outbound.protection.outlook.com [40.107.73.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485D589BF6;
 Wed,  5 Jun 2019 14:39:07 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2531.namprd12.prod.outlook.com (52.132.11.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 14:39:05 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 14:39:05 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Topic: [PATCH] drm/ttm: fix ttm_bo_unreserve
Thread-Index: AQHVGulu9ZQ941Np90exnDVnWHTczaaL1eGAgAAD1oCAARL9AIAAME3Q
Date: Wed, 5 Jun 2019 14:39:05 +0000
Message-ID: <BL0PR12MB258059160DA59CEFB69D123280160@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20190604152306.1804-1-christian.koenig@amd.com>
 <497dc76b-4752-59cf-a9a4-8fdf8c608383@amd.com>
 <BL0PR12MB2580B3E88C17043DE402CF3280150@BL0PR12MB2580.namprd12.prod.outlook.com>
 <5a0f4e09-2614-5bbc-b8a2-53746bbb0b15@gmail.com>
In-Reply-To: <5a0f4e09-2614-5bbc-b8a2-53746bbb0b15@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3463367-a91e-4b59-391f-08d6e9c38f7c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2531; 
x-ms-traffictypediagnostic: BL0PR12MB2531:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR12MB25317BDD5B5E13103F15DD1580160@BL0PR12MB2531.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(366004)(136003)(346002)(199004)(189003)(13464003)(229853002)(486006)(25786009)(6436002)(450100002)(8676002)(2201001)(81166006)(53546011)(99286004)(76116006)(86362001)(186003)(256004)(6506007)(478600001)(71190400001)(2906002)(110136005)(8936002)(68736007)(6306002)(72206003)(66574012)(71200400001)(9686003)(316002)(446003)(14454004)(26005)(73956011)(66946007)(14444005)(7736002)(81156014)(66446008)(76176011)(53936002)(66476007)(966005)(66556008)(305945005)(66066001)(2501003)(5660300002)(74316002)(3846002)(102836004)(6116002)(6246003)(7696005)(33656002)(476003)(55016002)(64756008)(11346002)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2531;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rxXzJbW9XA+IvIBtKdnIrbMrLVVjr2x4XoHgfIC3y0lYBETZl57knFMgaAwLfUVWhV8BbjbVvA8O3mWwYqd2Pvu9Iyefcm2A2RkwFpSph14zsj3kLs0BwXAcZ9EcFz1UMA5T0ZUXLsgn4lBSMRI/9Z2r4jrkUs9N/alYeZst700EYzpvZ/rBuDs/HQ9XG22gwwowt+4PGJO2GD6cPYAPDpcBvQisA4gDzFg/m0cFLdwmOjCYO0RBW8Zxb1wqvbCMbkyu1kDNrAsW21Z7G7J9q7CSOM5JfeO8a+eua+KR9eVlbT7ZkrZGaxMARI4IwOMHKcryXXbSbP7x8RGLyvpst8U5Epq+pIMU9/Is7Gyc1K4cV0kMGhCYrK6uruysdEUVgnoUJG6W757ZX1vV73koXhoZGNeRlxFugreZ4Rl1icw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3463367-a91e-4b59-391f-08d6e9c38f7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 14:39:05.2142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2531
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVyzfCPQvtf8Q3f6084FvE8IARG6Pee4MGys+eDv68g=;
 b=Z3L1l+MqOFfQVtFGHTISckcCzYhlOvpI4cbm7xU2kxZUX0eMYwc3dkFKQ7avQ0RSxJT3OACLK+UZyZ1TGS9F4w/ucbvebdv/bYimM34YPh/IKwVkVuYFEQpVIjctoE0AlGZM1kwkV3KsZwH44C/y7UCyH960j8koTigaxV0P7fw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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

DQoNClJlZ2FyZHMsDQpPYWsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENo
cmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiANClNlbnQ6
IFdlZG5lc2RheSwgSnVuZSA1LCAyMDE5IDc6MjUgQU0NClRvOiBaZW5nLCBPYWsgPE9hay5aZW5n
QGFtZC5jb20+OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3R0bTogZml4IHR0bV9ib191bnJlc2VydmUNCg0K
QW0gMDQuMDYuMTkgdW0gMjE6MDMgc2NocmllYiBaZW5nLCBPYWs6DQo+DQo+IFJlZ2FyZHMsDQo+
IE9haw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxh
bWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgDQo+IEt1
ZWhsaW5nLCBGZWxpeA0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDQsIDIwMTkgMjo0NyBQTQ0KPiBU
bzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+OyAN
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3R0bTogZml4IHR0bV9ib191bnJl
c2VydmUNCj4NCj4gT24gMjAxOS0wNi0wNCAxMToyMywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToN
Cj4NCj4+IFNpbmNlIHdlIG5vdyBrZWVwIEJPcyBvbiB0aGUgTFJVIHdlIG5lZWQgdG8gbWFrZSBz
dXJlIHRoYXQgdGhleSBhcmUgDQo+PiByZW1vdmVkIHdoZW4gdGhleSBhcmUgcGlubmVkLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4NCj4+IC0tLQ0KPj4gICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDE0
ICsrKysrKy0tLS0tLS0tDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2Jv
X2RyaXZlci5oIA0KPj4gYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGluZGV4IDlm
NTRjZjljNjBkZi4uYzliOGJhNDkyZjI0DQo+PiAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJt
L3R0bS90dG1fYm9fZHJpdmVyLmgNCj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmgNCj4+IEBAIC03NjcsMTQgKzc2NywxMiBAQCBzdGF0aWMgaW5saW5lIGludCB0dG1fYm9f
cmVzZXJ2ZV9zbG93cGF0aChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KPj4gICAgICov
DQo+PiAgICBzdGF0aWMgaW5saW5lIHZvaWQgdHRtX2JvX3VucmVzZXJ2ZShzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvKQ0KPj4gICAgew0KPj4gLQlpZiAoIShiby0+bWVtLnBsYWNlbWVudCAm
IFRUTV9QTF9GTEFHX05PX0VWSUNUKSkgew0KPj4gLQkJc3Bpbl9sb2NrKCZiby0+YmRldi0+Z2xv
Yi0+bHJ1X2xvY2spOw0KPj4gLQkJaWYgKGxpc3RfZW1wdHkoJmJvLT5scnUpKQ0KPj4gLQkJCXR0
bV9ib19hZGRfdG9fbHJ1KGJvKTsNCj4+IC0JCWVsc2UNCj4+IC0JCQl0dG1fYm9fbW92ZV90b19s
cnVfdGFpbChibywgTlVMTCk7DQo+PiAtCQlzcGluX3VubG9jaygmYm8tPmJkZXYtPmdsb2ItPmxy
dV9sb2NrKTsNCj4+IC0JfQ0KPj4gKwlzcGluX2xvY2soJmJvLT5iZGV2LT5nbG9iLT5scnVfbG9j
ayk7DQo+PiArCWlmIChsaXN0X2VtcHR5KCZiby0+bHJ1KSkNCj4+ICsJCXR0bV9ib19hZGRfdG9f
bHJ1KGJvKTsNCj4+ICsJZWxzZQ0KPj4gKwkJdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoYm8sIE5V
TEwpOw0KPiBHb2luZyBqdXN0IGJ5IHRoZSBmdW5jdGlvbiBuYW1lcywgdGhpcyBzZWVtcyB0byBk
byB0aGUgZXhhY3Qgb3Bwb3NpdGUgb2Ygd2hhdCB0aGUgY2hhbmdlIGRlc2NyaXB0aW9uIHNheXMu
DQo+DQo+IFtPYWtdICsxLCB3aGVuIEkgcmVhZCB0aGUgZGVzY3JpcHRpb24sIEkgYWxzbyBnZXQg
bG9zdC4uLlNvIHBsZWFzZSBkbyBhZGQgYSBtb3JlIGFjY3VyYXRlIGRlc2NyaXB0aW9uLg0KDQpJ
J20gcHV6emxlZCB3aHkgeW91IGFyZSBjb25mdXNlZC4gV2Ugbm93IGtlZXAgdGhlIEJPcyBvbiB0
aGUgTFJVIHdoaWxlIHRoZXkgYXJlIHJlc2VydmVkLCBzbyBvbiB1bnJlc2VydmUgd2Ugbm93IG5l
ZWQgdG8gZXhwbGljaXRseSByZW1vdmUgdGhlbSBmcm9tIHRoZSBMUlUgd2hlbiB0aGV5IGFyZSBw
aW5uZWQuDQoNCltPYWtdIFdoZW4gSSByZWFkIHRoZSBkZXNjcmlwdGlvbiwgSSB0aG91Z2ggeW91
IG1lYW50IHRvIHJlbW92ZSBibyBmcm9tIExSVSBvbiBhIHBpbiBhY3Rpb24sIGJ1dCBmcm9tIGNv
ZGVzLCBpdCBpcyBkb25lIG9uIHVucmVzZXJ2ZS4gSW4gb3RoZXIgd29yZHMsIGl0IGlzIGJldHRl
ciB0byBzYXkgImlmIGl0IGlzIHBpbm5lZCIgdGhhbiAgIndoZW4gaXQgaXMgcGlubmVkIi4gU29y
cnkgYmVpbmcgcGlja3kuLi4uQWxzbyBmcm9tIGNvZGVzIGJlZm9yZSB5b3VyIGNoYW5nZSwgdGhl
cmUgd2FzIGEgY29uZGl0aW9uICIhKGJvLT5tZW0ucGxhY2VtZW50ICYgVFRNX1BMX0ZMQUdfTk9f
RVZJQ1QpIi4gSXMgdGhpcyBjb25kaXRpb24gdG8gY2hlY2sgd2hldGhlciBibyBpcyBubyBwaW5u
ZWQ/IEhvdyBkbyB5b3UgY2hlY2sgd2hldGhlciBibyBpcyBwaW5uZWQgaW4gdGhlIG5ldyBjb2Rl
cz8gVG8gbWUgY29uZGl0aW9uICIgbGlzdF9lbXB0eSgmYm8tPmxydSkiIG9ubHkgbWVhbnMgdGhp
cyBibyBpcyBjdXJyZW50bHkgbm90IG9uIExSVSBsaXN0LCBJIGFtIG5vdCBzdXJlIHdoZXRoZXIg
dGhpcyBhbHNvIG1lYW5zIGl0IGlzIG5vdCBwaW5uZWQuIEFsc28sIGNhbiB0dG1fYm9fbW92ZV90
b19scnVfdGFpbCBiZSByZXBsYWNlZCB3aXRoIHR0bV9ib19kZWxfZnJvbV9scnUgLSBmcm9tIHlv
dXIgZGVzY3JpcHRpb24sIHRoaXMgaXMgbW9yZSBsaWtlIGEgZnVuY3Rpb24gdG8gcmVtb3ZlIGl0
IGZyb20gTFJVLiBTb3JyeSB0b28gbWFueSBxdWVzdGlvbnMuIEkgcmVhbGx5IGRvbid0IGtub3cg
dGhlIGNvbnRleHQgaGVyZS4uLg0KDQo+DQo+IEFud2F5LCB0aGlzIHBhdGNoIGlzIFJldmlld2Vk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4NCj4gQlRXLCB0
aGlzIGZpeCBpcyBuZWVkZWQgZm9yIEtGRC4gSXQgZml4ZXMgb3VyIGV2aWN0aW9uIHRlc3QgdGhh
dCB3YXMgYnJva2VuIGJ5IHlvdXIgcHJldmlvdXMgcGF0Y2ggc2VyaWVzLiBUaGlzIHRlc3Qgc3Bl
Y2lmaWNhbGx5IHRyaWdnZXJzIGludGVyYWN0aW9ucyBiZXR3ZWVuIEtGRCBhbmQgZ3JhcGhpY3Mg
dW5kZXIgbWVtb3J5IHByZXNzdXJlLiBJdCdzIHNvbWV0aGluZyB3ZSByYXJlbHkgc2VlIGluIHJl
YWwgd29ybGQgY29tcHV0ZSBhcHBsaWNhdGlvbiB0ZXN0aW5nIHdpdGhvdXQgYSB0YXJnZXRlZCB0
ZXN0LiBCdXQgd2hlbiBpdCBicmVha3MgaXQgbGVhZHMgdG8gc29tZSBwYWluZnVsIGludGVybWl0
dGVudCBmYWlsdXJlcyB0aGF0IGFyZSBoYXJkIHRvIHJlZ3Jlc3MgYW5kIGRlYnVnLg0KPg0KPiBE
byB5b3UgaGF2ZSBhbnkgdGFyZ2V0ZWQgdGVzdHMgdG8gdHJpZ2dlciBldmljdGlvbnMgd2hlbiB5
b3Ugd29yayBvbiBUVE0gaW50ZXJuYWxzPw0KDQpDYXQgYW1kZ3B1X2V2aWN0X2d0dCBpbiBkZWJ1
Z2ZzIGlzIGEgZ29vZCB0ZXN0IGZvciB0aGlzLg0KDQpDaHJpc3RpYW4uDQoNCj4NCj4gUmVnYXJk
cywNCj4gICDCoCBGZWxpeA0KPg0KPg0KPj4gKwlzcGluX3VubG9jaygmYm8tPmJkZXYtPmdsb2It
PmxydV9sb2NrKTsNCj4+ICAgIAlyZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJvLT5yZXN2KTsN
Cj4+ICAgIH0NCj4+ICAgIA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
