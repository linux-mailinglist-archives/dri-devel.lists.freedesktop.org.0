Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F332135F0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73FB6EB3B;
	Fri,  3 Jul 2020 08:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC906EA5E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 07:43:46 +0000 (UTC)
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 683B7DE95A848263F63A;
 Thu,  2 Jul 2020 15:43:44 +0800 (CST)
Received: from dggeme710-chm.china.huawei.com (10.1.199.106) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 2 Jul 2020 15:43:44 +0800
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme710-chm.china.huawei.com (10.1.199.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 2 Jul 2020 15:43:43 +0800
Received: from dggeme759-chm.china.huawei.com ([10.7.64.73]) by
 dggeme759-chm.china.huawei.com ([10.7.64.73]) with mapi id 15.01.1913.007;
 Thu, 2 Jul 2020 15:43:43 +0800
From: "tiantao (H)" <tiantao6@hisilicon.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "Chenfeng (puck)"
 <puck.chen@hisilicon.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "kraxel@redhat.com" <kraxel@redhat.com>, 
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xinliang.liu@linaro.org"
 <xinliang.liu@linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjJdIGRybS9oaXNpbGljb246IFVzZSBkcm1tX2t6?=
 =?utf-8?Q?alloc()_instead_of_devm=5Fkzalloc()?=
Thread-Topic: [PATCH v2] drm/hisilicon: Use drmm_kzalloc() instead of
 devm_kzalloc()
Thread-Index: AQHWUD+qjoc/aFuowkyMiwMNqK+Q7qjzW+uAgACMSwA=
Date: Thu, 2 Jul 2020 07:43:43 +0000
Message-ID: <f15d7519a91d49d7a92165d754861b72@hisilicon.com>
References: <1593673602-49027-1-git-send-email-tiantao6@hisilicon.com>
 <31a82ab1-e140-5e4d-774b-355a68f44add@suse.de>
In-Reply-To: <31a82ab1-e140-5e4d-774b-355a68f44add@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.57.60.129]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGk6DQoNCkkgYW0gc29ycnkgZm9yIG1pc3VuZGVyc3Rvb2QgeW91IHN1Z2dlc3RzLiBJIHdpbGwg
c2VuZCB2MyB0byBmaXhlZCB0aGlzLg0KDQpCZXN0DQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0N
CuWPkeS7tuS6ujogVGhvbWFzIFppbW1lcm1hbm4gW21haWx0bzp0emltbWVybWFubkBzdXNlLmRl
XSANCuWPkemAgeaXtumXtDogMjAyMOW5tDfmnIgy5pelIDE1OjIwDQrmlLbku7bkuro6IHRpYW50
YW8gKEgpIDx0aWFudGFvNkBoaXNpbGljb24uY29tPjsgQ2hlbmZlbmcgKHB1Y2spIDxwdWNrLmNo
ZW5AaGlzaWxpY29uLmNvbT47IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsga3Jh
eGVsQHJlZGhhdC5jb207IGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb207IHRnbHhAbGludXRyb25p
eC5kZTsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgeGlubGlhbmcubGl1QGxpbmFy
by5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCuaKhOmAgTogTGludXhhcm0gPGxp
bnV4YXJtQGh1YXdlaS5jb20+DQrkuLvpopg6IFJlOiBbUEFUQ0ggdjJdIGRybS9oaXNpbGljb246
IFVzZSBkcm1tX2t6YWxsb2MoKSBpbnN0ZWFkIG9mIGRldm1fa3phbGxvYygpDQoNCkhpDQoNCkFt
IDAyLjA3LjIwIHVtIDA5OjA2IHNjaHJpZWIgVGlhbiBUYW86DQo+IHVzaW5nIHRoZSBuZXcgQVBJ
IGRybW1fa3phbGxvYygpIGluc3RlYWQgb2YgZGV2bV9remFsbG9jKCkNCj4gDQo+IHYyOg0KPiBr
ZWVwIHRoZSBEUk0gaW5jbHVkZSBzdGF0ZW1lbnRzIHNvcnRlZCBhbHBoYWJldGljYWxseS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPg0KPiBS
ZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCAx
OCANCj4gKysrKysrKysrLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9oaXNp
bGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jDQo+IGluZGV4IGE2ZmQwYzIuLmI1NTc3MjggMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Ry
di5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Ry
di5jDQo+IEBAIC0xMSwxOCArMTEsMTggQEANCj4gICAqCUppYW5odWEgTGkgPGxpamlhbmh1YUBo
dWF3ZWkuY29tPg0KPiAgICovDQo+ICANCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2dlbV92cmFtX2hl
bHBlci5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPg0KPiArI2luY2x1
ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxw
ZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4gKyNpbmNsdWRlIDxkcm0v
ZHJtX3ZibGFuay5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4gICNpbmNsdWRl
IDxsaW51eC9jb25zb2xlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+IC0jaW5j
bHVkZSA8bGludXgvcGNpLmg+DQo+IC0NCj4gLSNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxw
ZXIuaD4NCj4gICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPg0KPiAtI2luY2x1ZGUgPGRybS9kcm1f
ZmJfaGVscGVyLmg+DQo+IC0jaW5jbHVkZSA8ZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaD4NCj4g
ICNpbmNsdWRlIDxkcm0vZHJtX2lycS5oPg0KPiAtI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4N
Cj4gLSNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPg0KPiAtI2luY2x1ZGUgPGRybS9k
cm1fdmJsYW5rLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvcGNpLmg+DQoNCk9rLCB0aGF0J3MgYSBi
aXQgdG9vIG11Y2guIDpEDQoNCkZpcnN0IG9mIGFsbCwgaXQncyBzdGlsbCBub3QgYWxwaGFiZXRp
Y2FsbHkuIFNlY29uZCwgbGludXggaGVhZGVycyBnbyBmaXJzdCwgdGhlbiBkcm0gaGVhZGVycyBm
b2xsb3cuIEl0IHNob3VsZCBsb29rIGxpa2UNCg0KICNpbmNsdWRlIDxsaW51eC8uLi4+DQogI2lu
Y2x1ZGUgPGxpbnV4Ly4uLj4NCiAjaW5jbHVkZSA8bGludXgvLi4uPg0KDQogI2luY2x1ZGUgPGRy
bS8uLi4+DQogI2luY2x1ZGUgPGRybS8uLi4+DQogI2luY2x1ZGUgPGRybS8uLi4+DQoNCndpdGgg
ZWFjaCBibG9jayBzb3J0ZWQgYWxwaGFiZXRpY2FsbHkuDQoNCklmIHlvdSBpbmNsdWRlIGRybV9t
YW5hZ2VkLmggcmlnaHQgYmVmb3JlIGRybV9wcmludC5oLCBpdCBzaG91bGQgYmUgZmluZSBhbHJl
YWR5Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICANCj4gICNpbmNsdWRlICJoaWJtY19k
cm1fZHJ2LmgiDQo+ICAjaW5jbHVkZSAiaGlibWNfZHJtX3JlZ3MuaCINCj4gQEAgLTI2Nyw3ICsy
NjcsNyBAQCBzdGF0aWMgaW50IGhpYm1jX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4g
IAlzdHJ1Y3QgaGlibWNfZHJtX3ByaXZhdGUgKnByaXY7DQo+ICAJaW50IHJldDsNCj4gIA0KPiAt
CXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LT5kZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwp
Ow0KPiArCXByaXYgPSBkcm1tX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVM
KTsNCj4gIAlpZiAoIXByaXYpIHsNCj4gIAkJRFJNX0VSUk9SKCJubyBtZW1vcnkgdG8gYWxsb2Nh
dGUgZm9yIGhpYm1jX2RybV9wcml2YXRlXG4iKTsNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+IA0K
DQotLQ0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
