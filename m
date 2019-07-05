Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB360723
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 16:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694186E4C9;
	Fri,  5 Jul 2019 14:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740052.outbound.protection.outlook.com [40.107.74.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF056E4C9;
 Fri,  5 Jul 2019 14:03:57 +0000 (UTC)
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB2709.namprd12.prod.outlook.com (20.177.124.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Fri, 5 Jul 2019 14:03:52 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 14:03:52 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 03/10] drm/sysfs: Add mstpath attribute to connector
 devices
Thread-Topic: [PATCH 03/10] drm/sysfs: Add mstpath attribute to connector
 devices
Thread-Index: AQHVMpuZ1yjWQX+oD0WYzQZULCdh46a62WEAgAE2V4A=
Date: Fri, 5 Jul 2019 14:03:52 +0000
Message-ID: <cfb3d588-e961-1d3b-be6b-d41069f5df03@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
 <20190704190519.29525-4-sunpeng.li@amd.com> <20190704193304.GJ5942@intel.com>
In-Reply-To: <20190704193304.GJ5942@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::27) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e34f469-f1d8-4d67-4f7a-08d701519c01
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2709; 
x-ms-traffictypediagnostic: BYAPR12MB2709:
x-microsoft-antispam-prvs: <BYAPR12MB27091CADA41CFBF0F4BD22DB82F50@BYAPR12MB2709.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(199004)(189003)(6436002)(11346002)(66574012)(446003)(8676002)(2616005)(102836004)(476003)(386003)(6506007)(53546011)(26005)(66556008)(73956011)(66946007)(64756008)(486006)(186003)(72206003)(66476007)(53936002)(66446008)(6512007)(478600001)(86362001)(76176011)(31696002)(68736007)(5660300002)(54906003)(316002)(6916009)(52116002)(14444005)(2906002)(25786009)(31686004)(36756003)(6246003)(71190400001)(71200400001)(305945005)(4326008)(229853002)(81166006)(81156014)(66066001)(3846002)(7736002)(6116002)(6486002)(99286004)(14454004)(256004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2709;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BJT8ndmOY/c5GRUYqutS9dshF1BlnHyi4ty6EzewK/+9YCi/RAYNhpptOYveSwzF0fU5LACFF82XAQW7XlMw0YFyECkLWTlqEPN77K66FyijJLC6IS2O0CjfZR0QdQyIcrL80bwzfoOOFm3EK1wMUMHhojQVUcBUscwu/kfOwyBzX+0Hba2e6tUZSaOiiMJp9B98uIuiRt2EjCmdlI6YwN0I12xk1PMsHSRMBIhrlYo1rRG3l/SGdRJSdyCNsxZfX1RsyYZnBGX8MP61Y/Um5MHjqHVMW0uimD/4fsPr1H/4+pVpz7EZ7wRdI9oiu1g8xUfSRy51VtlethJg/bAL4eTFrrOi+PV8jLG1qVvmDCp+yaQV8bdGPyjSiuhUBbs/aUNgyUrdbubGDcggS8byqiS9FQobFB3jMAyWI5q2seg=
Content-ID: <6654122AFC5F7040B941F2738C896148@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e34f469-f1d8-4d67-4f7a-08d701519c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 14:03:52.0163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTDOV1sVyh2Y/BnSlVpDuyLt7RdTHik/mVFQrsdHv1k=;
 b=Cgd1v7dcxuGe4jMSbxP5lLMOtGmm6ahGdroDetIUY4Y8XxcKIzbaZFJRTChjA1+IbkPkl98KC6p0c1RQ2ELKcND9rucOhMGxUc0fZ3KoTIUpvxrL8GZ/8W0J2NkT//SfcoSrrwTOTsLGCMgdb3VxZ84GSUjerta9H/wULl1jqp0=
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

DQoNCg0KT24gMjAxOS0wNy0wNCAzOjMzIHAubS4sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToNCj4g
T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDM6MDU6MTJQTSAtMDQwMCwgc3VucGVuZy5saUBhbWQu
Y29tIHdyb3RlOg0KPj4gRnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQo+Pg0KPj4g
VGhpcyBjYW4gYmUgdXNlZCB0byBjcmVhdGUgbW9yZSBkZXNjcmlwdGl2ZSBzeW1saW5rcyBmb3Ig
TVNUIGF1eA0KPj4gZGV2aWNlcy4gQ29uc2lkZXIgdGhlIGZvbGxvd2luZyB1ZGV2IHJ1bGU6DQo+
Pg0KPj4gU1VCU1lTVEVNPT0iZHJtX2RwX2F1eF9kZXYiLCBTVUJTWVNURU1TPT0iZHJtIiwgQVRU
UlN7bXN0cGF0aH09PSI/KiIsDQo+PiAJU1lNTElOSys9ImRybV9kcF9hdXgvYnktcGF0aC8kYXR0
cnttc3RwYXRofSINCj4+DQo+PiBUaGUgZm9sbG93aW5nIHN5bWxpbmtzIHdpbGwgYmUgY3JlYXRl
ZCAoZGVwZW5kaW5nIG9uIHlvdXIgTVNUIHRvcG9sb2d5KToNCj4+DQo+PiAkIGxzIC9kZXYvZHJt
X2RwX2F1eC9ieS1wYXRoLw0KPj4gY2FyZDAtbXN0OjAtMSAgY2FyZDAtbXN0OjAtMS0xICBjYXJk
MC1tc3Q6MC0xLTggIGNhcmQwLW1zdDowLTgNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lz
ZnMuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9z
eXNmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jDQo+PiBpbmRleCBhZDEwODEwYmM5
NzIuLjUzZmQxZjcxZTkwMCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lz
ZnMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jDQo+PiBAQCAtMjM2LDE2
ICsyMzYsMzkgQEAgc3RhdGljIHNzaXplX3QgbW9kZXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXZp
Y2UsDQo+PiAgCXJldHVybiB3cml0dGVuOw0KPj4gIH0NCj4+ICANCj4+ICtzdGF0aWMgc3NpemVf
dCBtc3RwYXRoX3Nob3coc3RydWN0IGRldmljZSAqZGV2aWNlLA0KPj4gKwkJCSAgICBzdHJ1Y3Qg
ZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4+ICsJCQkgICAgY2hhciAqYnVmKQ0KPj4gK3sNCj4+
ICsJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9IHRvX2RybV9jb25uZWN0b3IoZGV2
aWNlKTsNCj4+ICsJc3NpemVfdCByZXQgPSAwOw0KPj4gKwljaGFyICpwYXRoOw0KPj4gKw0KPj4g
KwltdXRleF9sb2NrKCZjb25uZWN0b3ItPmRldi0+bW9kZV9jb25maWcubXV0ZXgpOw0KPiANCj4g
VGhlIGJsb2IgaXMgcG9wdWxhdGVkIHdoZW4gdGhlIGNvbm5lY3RvciBpcyBjcmVhdGVkIHNvIEkg
ZG9uJ3QgdGhpbmsNCj4gdGhpcyBsb2NrIGlzIGFjdHVhbGx5IGRvaW5nIGFueXRoaW5nIGZvciB1
cy4NCg0KUmlnaHQsIHdpbGwgZHJvcCB0aGlzLg0KDQo+IA0KPiBPbmUgd291bGQgYWxzbyBob3Bl
IHRoYXQgZGV2aWNlX3VucmVnaXN0ZXIoKSBwcm90ZWN0cyB1cyBmcm9tIHJhY2luZw0KPiB3aXRo
IHRoZSByZW1vdmFsIG9mIHRoZSBhdHRyaWJ1dGUuIEVnLiBpZiB5b3UgaG9sZCBhIGZpbGUgZGVz
Y3JpcHRvcg0KPiBvcGVuIHRvIHRoZSBzeXNmcyBmaWxlIGRvZXMgZGV2aWNlX3VucmVnaXN0ZXIo
KSBibG9jayB1bnRpbCB0aGUgZmQgaXMNCj4gY2xvc2VkPw0KDQpGb3IgZHBjZCB0cmFuc2FjdGlv
bnMsIGFzIGxvbmcgYXMgdGhlIGF1eCBkZXZpY2UgaXMgdW5yZWdpc3RlcmVkIHRocm91Z2gNCmRy
bV9kcF9hdXhfdW5yZWdpc3Rlcl9kZXZub2RlKCksIHdlIHNob3VsZCBiZSBnb29kLiBUaGVyZSdz
IGFuIGF0b21pY190DQp1c2VfY291bnQgdGhhdCBzeW5jcyBhZ2FpbnN0IHJlYWRzIGFuZCB3cml0
ZXMuDQoNCkFsdGhvdWdoIEknbSBub3Qgc3VyZSB3aGF0IHdvdWxkIGhhcHBlbiBpZiB0aGUgZGV2
aWNlIHdhcyByaXBwZWQgb3V0DQpmcm9tIHVuZGVybmVhdGggdXMsIHNheSwgaWYgdGhlIHBhcmVu
dCBjb25uZWN0b3IgZGV2aWNlIGlzIHJlbW92ZWQNCmJlZm9yZSBjYWxsaW5nIGF1eF91bnJlZ2lz
dGVyX2Rldm5vZGUoKS4gSWYgdGhpcyBkb2VzIGhhcHBlbiwgSSB0aGluaw0KaXQncyBtb3JlIG9m
IGFuIG9yZGVyLW9mLW9wZXJhdGlvbnMgaXNzdWUgZnJvbSB0aGUgZHJpdmVyLiBWMiBvZiBwYXRj
aCAyDQooYW5kIDctMTApIGFjdHVhbGx5IGFkZHJlc3NlcyBhIHNwZWNpZmljIG9jY3VyZW5jZSBv
ZiB0aGlzIGR1cmluZyBkcml2ZXINCnVubG9hZC4NCg0KUmVnYXJkaW5nIHN5c2ZzIGF0dHJzLCB0
aGUga2VybmZzIHVuZGVybmVhdGggZG9lcyBzZWVtIHRvIGd1YXJhbnRlZSB0aGF0DQphbnkgci93
IGlzIGNvbXBsZXRlZCBiZWZvcmUgcmVtb3ZhbC4gU2VlIGtlcm5mc19kcmFpbigpLCBjYWxsZWQg
YXMgcGFydA0Kb2Yga2VybmZzX3JlbW92ZSgpLg0KDQpMZW8NCg0KPiANCj4+ICsJaWYgKCFjb25u
ZWN0b3ItPnBhdGhfYmxvYl9wdHIpDQo+PiArCQlnb3RvIHVubG9jazsNCj4+ICsNCj4+ICsJcGF0
aCA9IGNvbm5lY3Rvci0+cGF0aF9ibG9iX3B0ci0+ZGF0YTsNCj4+ICsJcmV0ID0gc25wcmludGYo
YnVmLCBQQUdFX1NJWkUsICJjYXJkJWQtJXNcbiIsDQo+PiArCQkgICAgICAgY29ubmVjdG9yLT5k
ZXYtPnByaW1hcnktPmluZGV4LCBwYXRoKTsNCj4+ICsNCj4+ICt1bmxvY2s6DQo+PiArCW11dGV4
X3VubG9jaygmY29ubmVjdG9yLT5kZXYtPm1vZGVfY29uZmlnLm11dGV4KTsNCj4+ICsJcmV0dXJu
IHJldDsNCj4+ICt9DQo+PiArDQo+PiAgc3RhdGljIERFVklDRV9BVFRSX1JXKHN0YXR1cyk7DQo+
PiAgc3RhdGljIERFVklDRV9BVFRSX1JPKGVuYWJsZWQpOw0KPj4gIHN0YXRpYyBERVZJQ0VfQVRU
Ul9STyhkcG1zKTsNCj4+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8obW9kZXMpOw0KPj4gK3N0YXRp
YyBERVZJQ0VfQVRUUl9STyhtc3RwYXRoKTsNCj4+ICANCj4+ICBzdGF0aWMgc3RydWN0IGF0dHJp
YnV0ZSAqY29ubmVjdG9yX2Rldl9hdHRyc1tdID0gew0KPj4gIAkmZGV2X2F0dHJfc3RhdHVzLmF0
dHIsDQo+PiAgCSZkZXZfYXR0cl9lbmFibGVkLmF0dHIsDQo+PiAgCSZkZXZfYXR0cl9kcG1zLmF0
dHIsDQo+PiAgCSZkZXZfYXR0cl9tb2Rlcy5hdHRyLA0KPj4gKwkmZGV2X2F0dHJfbXN0cGF0aC5h
dHRyLA0KPj4gIAlOVUxMDQo+PiAgfTsNCj4+ICANCj4+IC0tIA0KPj4gMi4yMi4wDQo+IA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
