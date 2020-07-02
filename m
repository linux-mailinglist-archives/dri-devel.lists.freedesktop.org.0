Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E8211CCA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB426EA84;
	Thu,  2 Jul 2020 07:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 970 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jul 2020 07:20:33 UTC
Received: from huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B5C6E207
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 07:20:32 +0000 (UTC)
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 4564DCF9CC776307FF85;
 Thu,  2 Jul 2020 15:04:14 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 2 Jul 2020 15:04:00 +0800
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 2 Jul 2020 15:04:00 +0800
Received: from dggeme759-chm.china.huawei.com ([10.7.64.73]) by
 dggeme759-chm.china.huawei.com ([10.7.64.73]) with mapi id 15.01.1913.007;
 Thu, 2 Jul 2020 15:04:00 +0800
From: "tiantao (H)" <tiantao6@hisilicon.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "Chenfeng (puck)"
 <puck.chen@hisilicon.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "kraxel@redhat.com" <kraxel@redhat.com>, 
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xinliang.liu@linaro.org"
 <xinliang.liu@linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGRybS9oaXNpbGljb246IFVzZSBkcm1tX2t6YWxs?=
 =?utf-8?Q?oc()_instead_of_devm=5Fkzalloc()?=
Thread-Topic: [PATCH] drm/hisilicon: Use drmm_kzalloc() instead of
 devm_kzalloc()
Thread-Index: AQHWUDv5oF9N4eaD8EOIzTbHFGOwPKjz3NAQ
Date: Thu, 2 Jul 2020 07:04:00 +0000
Message-ID: <8f415f3d92584498bd979787d1846e5e@hisilicon.com>
References: <1593652914-19639-1-git-send-email-tiantao6@hisilicon.com>
 <50ea833a-7d8d-a1ad-3622-3456afc87719@suse.de>
In-Reply-To: <50ea833a-7d8d-a1ad-3622-3456afc87719@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.57.60.129]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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

SGnvvJoNCg0KCVRoYW5rcyBmb3IgdGhlIGhlbHAgd2l0aCB0aGUgcmV2aWV3IGNvZGUuIEkgd2ls
bCBzZW5kIHYyIHRvIGZpeGVkIHRoaXMuDQoNCkJlc3QNCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0t
LQ0K5Y+R5Lu25Lq6OiBUaG9tYXMgWmltbWVybWFubiBbbWFpbHRvOnR6aW1tZXJtYW5uQHN1c2Uu
ZGVdIA0K5Y+R6YCB5pe26Ze0OiAyMDIw5bm0N+aciDLml6UgMTQ6NDMNCuaUtuS7tuS6ujogdGlh
bnRhbyAoSCkgPHRpYW50YW82QGhpc2lsaWNvbi5jb20+OyBDaGVuZmVuZyAocHVjaykgPHB1Y2su
Y2hlbkBoaXNpbGljb24uY29tPjsgYWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBr
cmF4ZWxAcmVkaGF0LmNvbTsgYWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbTsgdGdseEBsaW51dHJv
bml4LmRlOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyB4aW5saWFuZy5saXVAbGlu
YXJvLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K5oqE6YCBOiBpbnV4YXJtQGh1
YXdlaS5jb20NCuS4u+mimDogUmU6IFtQQVRDSF0gZHJtL2hpc2lsaWNvbjogVXNlIGRybW1fa3ph
bGxvYygpIGluc3RlYWQgb2YgZGV2bV9remFsbG9jKCkNCg0KSGkNCg0KQW0gMDIuMDcuMjAgdW0g
MDM6MjEgc2NocmllYiBUaWFuIFRhbzoNCj4gdXNpbmcgdGhlIG5ldyBBUEkgZHJtbV9remFsbG9j
KCkgaW5zdGVhZCBvZiBkZXZtX2t6YWxsb2MoKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGlhbiBU
YW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2hp
c2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMNCj4gaW5kZXggYTZmZDBjMi4uMmYy
MDcwNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJt
Y19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJt
Y19kcm1fZHJ2LmMNCj4gQEAgLTIzLDYgKzIzLDcgQEANCj4gICNpbmNsdWRlIDxkcm0vZHJtX3By
aW50Lmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4NCj4gICNpbmNsdWRl
IDxkcm0vZHJtX3ZibGFuay5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPg0KDQpQ
bGVhc2Uga2VlcCB0aGUgRFJNIGluY2x1ZGUgc3RhdGVtZW50cyBzb3J0ZWQgYWxwaGFiZXRpY2Fs
bHkuDQoNCldpdGggdGhpcyBmaXhlZA0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4gIA0KPiAgI2luY2x1ZGUgImhpYm1jX2RybV9kcnYu
aCINCj4gICNpbmNsdWRlICJoaWJtY19kcm1fcmVncy5oIg0KPiBAQCAtMjY3LDcgKzI2OCw3IEBA
IHN0YXRpYyBpbnQgaGlibWNfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgCXN0cnVj
dCBoaWJtY19kcm1fcHJpdmF0ZSAqcHJpdjsNCj4gIAlpbnQgcmV0Ow0KPiAgDQo+IC0JcHJpdiA9
IGRldm1fa3phbGxvYyhkZXYtPmRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7DQo+ICsJ
cHJpdiA9IGRybW1fa3phbGxvYyhkZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOw0KPiAg
CWlmICghcHJpdikgew0KPiAgCQlEUk1fRVJST1IoIm5vIG1lbW9yeSB0byBhbGxvY2F0ZSBmb3Ig
aGlibWNfZHJtX3ByaXZhdGVcbiIpOw0KPiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
