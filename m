Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 414B9232C57
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D5C6E873;
	Thu, 30 Jul 2020 07:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375DA6E4A1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 09:33:09 +0000 (UTC)
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 69CD65530AF83CA3DC8E;
 Wed, 29 Jul 2020 17:33:04 +0800 (CST)
Received: from dggeme761-chm.china.huawei.com (10.3.19.107) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 29 Jul 2020 17:33:03 +0800
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme761-chm.china.huawei.com (10.3.19.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 29 Jul 2020 17:33:04 +0800
Received: from dggeme759-chm.china.huawei.com ([10.7.64.73]) by
 dggeme759-chm.china.huawei.com ([10.7.64.73]) with mapi id 15.01.1913.007;
 Wed, 29 Jul 2020 17:33:03 +0800
From: "tiantao (H)" <tiantao6@hisilicon.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>, 
 "tglx@linutronix.de" <tglx@linutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xinliang.liu@linaro.org"
 <xinliang.liu@linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjNdIGRybS9oaXNpbGljb246IEZpeGVkIHRoZSB3?=
 =?utf-8?Q?arning:_Assignment_of_0/1_to_bool_variable?=
Thread-Topic: [PATCH v3] drm/hisilicon: Fixed the warning: Assignment of 0/1
 to bool variable
Thread-Index: AQHWZYMn+f7W3RNSC0mml/fqdJgmo6keSxtA
Date: Wed, 29 Jul 2020 09:33:03 +0000
Message-ID: <c3f00286e3dd4146bcae5da6b69226c5@hisilicon.com>
References: <1595940907-17874-1-git-send-email-tiantao6@hisilicon.com>
 <e8035faa-8f0f-4269-ef20-24408baa6f7a@suse.de>
In-Reply-To: <e8035faa-8f0f-4269-ef20-24408baa6f7a@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.57.60.129]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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

SGkgVGhvbWFzOg0KDQoJVGhhbmsgeW91IHZlcnkgbXVjaCAuDQoNCkJlc3QNCg0KLS0tLS3pgq7k
u7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBUaG9tYXMgWmltbWVybWFubiBbbWFpbHRvOnR6aW1t
ZXJtYW5uQHN1c2UuZGVdIA0K5Y+R6YCB5pe26Ze0OiAyMDIw5bm0N+aciDI55pelIDE2OjM1DQrm
lLbku7bkuro6IHRpYW50YW8gKEgpIDx0aWFudGFvNkBoaXNpbGljb24uY29tPjsgYWlybGllZEBs
aW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBrcmF4ZWxAcmVkaGF0LmNvbTsgYWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbTsgdGdseEBsaW51dHJvbml4LmRlOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyB4aW5saWFuZy5saXVAbGluYXJvLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0K5oqE6YCBOiBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT4NCuS4u+mimDog
UmU6IFtQQVRDSCB2M10gZHJtL2hpc2lsaWNvbjogRml4ZWQgdGhlIHdhcm5pbmc6IEFzc2lnbm1l
bnQgb2YgMC8xIHRvIGJvb2wgdmFyaWFibGUNCg0KDQoNCkFtIDI4LjA3LjIwIHVtIDE0OjU1IHNj
aHJpZWIgVGlhbiBUYW86DQo+IGZpeGVkIHRoZSBmb2xsb3dpbmcgd2FybmluZzoNCj4gaGlibWNf
ZHJtX2Rydi5jOjI5NjoxLTE4OldBUk5JTkc6IEFzc2lnbm1lbnQgb2YgMC8xIHRvIGJvb2wgdmFy
aWFibGUuDQo+IGhpYm1jX2RybV9kcnYuYzozMDE6Mi0xOTogV0FSTklORzogQXNzaWdubWVudCBv
ZiAwLzEgdG8gYm9vbCB2YXJpYWJsZS4NCj4gDQo+IHYyOg0KPiB1c2luZyB0aGUgcGNpX2Rldi5t
c2lfZW5hYmxlZCBpbnN0ZWFkIG9mIHByaXYtPm1zaV9lbmFibGVkLg0KPiANCj4gdjM6DQo+IGp1
c3QgY2FsbCBwY2lfZW5hYmxlX21zaSgpIGFuZCBwY2lfZGlzYWJsZV9tc2koKSwgaXQncyBubyBu
ZWVkIHRvIHNldCANCj4gZGV2LT5wZGV2LT5tc2lfZW5hYmxlZCBhZ2Fpbi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPg0KDQpUaGFua3MuIEFk
ZGVkIHRvIGRybS1taXNjLW5leHQNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIHwgNSArLS0t
LSAgDQo+IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5oIHwg
MSAtDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNf
ZHJtX2Rydi5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJt
X2Rydi5jDQo+IGluZGV4IDI0OWMyOTguLmI4ZDgzOWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jDQo+IEBAIC0yNTQsOSArMjU0
LDggQEAgc3RhdGljIGludCBoaWJtY191bmxvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4g
IA0KPiAgCWlmIChkZXYtPmlycV9lbmFibGVkKQ0KPiAgCQlkcm1faXJxX3VuaW5zdGFsbChkZXYp
Ow0KPiAtCWlmIChwcml2LT5tc2lfZW5hYmxlZCkNCj4gLQkJcGNpX2Rpc2FibGVfbXNpKGRldi0+
cGRldik7DQo+ICANCj4gKwlwY2lfZGlzYWJsZV9tc2koZGV2LT5wZGV2KTsNCj4gIAloaWJtY19r
bXNfZmluaShwcml2KTsNCj4gIAloaWJtY19tbV9maW5pKHByaXYpOw0KPiAgCWRldi0+ZGV2X3By
aXZhdGUgPSBOVUxMOw0KPiBAQCAtMjk0LDEyICsyOTMsMTAgQEAgc3RhdGljIGludCBoaWJtY19s
b2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICAJCWdvdG8gZXJyOw0KPiAgCX0NCj4gIA0K
PiAtCXByaXYtPm1zaV9lbmFibGVkID0gMDsNCj4gIAlyZXQgPSBwY2lfZW5hYmxlX21zaShkZXYt
PnBkZXYpOw0KPiAgCWlmIChyZXQpIHsNCj4gIAkJRFJNX1dBUk4oImVuYWJsaW5nIE1TSSBmYWls
ZWQ6ICVkXG4iLCByZXQpOw0KPiAgCX0gZWxzZSB7DQo+IC0JCXByaXYtPm1zaV9lbmFibGVkID0g
MTsNCj4gIAkJcmV0ID0gZHJtX2lycV9pbnN0YWxsKGRldiwgZGV2LT5wZGV2LT5pcnEpOw0KPiAg
CQlpZiAocmV0KQ0KPiAgCQkJRFJNX1dBUk4oImluc3RhbGwgaXJxIGZhaWxlZDogJWRcbiIsIHJl
dCk7IGRpZmYgLS1naXQgDQo+IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJt
Y19kcm1fZHJ2LmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19k
cm1fZHJ2LmgNCj4gaW5kZXggNjA5NzY4Ny4uYTY4Mzc2MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmgNCj4gQEAgLTI1LDcgKzI1
LDYgQEAgc3RydWN0IGhpYm1jX2RybV9wcml2YXRlIHsNCj4gIAl2b2lkIF9faW9tZW0gICAqZmJf
bWFwOw0KPiAgCXVuc2lnbmVkIGxvbmcgIGZiX2Jhc2U7DQo+ICAJdW5zaWduZWQgbG9uZyAgZmJf
c2l6ZTsNCj4gLQlib29sIG1zaV9lbmFibGVkOw0KPiAgDQo+ICAJLyogZHJtICovDQo+ICAJc3Ry
dWN0IGRybV9kZXZpY2UgICpkZXY7DQo+IA0KDQotLQ0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
