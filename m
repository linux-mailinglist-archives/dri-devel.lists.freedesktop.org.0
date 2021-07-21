Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C04F3D1107
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6DC6EB9C;
	Wed, 21 Jul 2021 14:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF156EB9C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:18:15 +0000 (UTC)
Received: from dggeme707-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GVHf12bkXzcgMT;
 Wed, 21 Jul 2021 22:14:49 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme707-chm.china.huawei.com (10.1.199.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 21 Jul 2021 22:18:12 +0800
Received: from dggeme759-chm.china.huawei.com ([10.8.81.151]) by
 dggeme759-chm.china.huawei.com ([10.8.81.151]) with mapi id 15.01.2176.012;
 Wed, 21 Jul 2021 22:18:12 +0800
From: "tiantao (H)" <tiantao6@hisilicon.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "xinliang.liu@linaro.org"
 <xinliang.liu@linaro.org>, "john.stultz@linaro.org" <john.stultz@linaro.org>, 
 "kongxinwei (A)" <kong.kongxinwei@hisilicon.com>, "Chenfeng (puck)"
 <puck.chen@hisilicon.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "maxime@cerno.tech" <maxime@cerno.tech>, 
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcm0vaGlzaWxpY29uL2hpYm1jOiBSZW1vdmUgdmFy?=
 =?gb2312?Q?iable_'priv'_from_hibmc=5Funload()?=
Thread-Topic: [PATCH] drm/hisilicon/hibmc: Remove variable 'priv' from
 hibmc_unload()
Thread-Index: AQHXfjK9wMqhF99OGEi6vuiJ39ete6tNed4g
Date: Wed, 21 Jul 2021 14:18:12 +0000
Message-ID: <1483a5ad4ed74250909576c8fd2a37d0@hisilicon.com>
References: <20210721131704.10306-1-tzimmermann@suse.de>
In-Reply-To: <20210721131704.10306-1-tzimmermann@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.40.188.144]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPg0KDQotLS0tLdPK
vP7Urbz+LS0tLS0NCreivP7IyzogVGhvbWFzIFppbW1lcm1hbm4gW21haWx0bzp0emltbWVybWFu
bkBzdXNlLmRlXSANCreiy83KsbzkOiAyMDIxxOo31MIyMcjVIDIxOjE3DQrK1bz+yMs6IHhpbmxp
YW5nLmxpdUBsaW5hcm8ub3JnOyB0aWFudGFvIChIKSA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT47
IGpvaG4uc3R1bHR6QGxpbmFyby5vcmc7IGtvbmd4aW53ZWkgKEEpIDxrb25nLmtvbmd4aW53ZWlA
aGlzaWxpY29uLmNvbT47IENoZW5mZW5nIChwdWNrKSA8cHVjay5jaGVuQGhpc2lsaWNvbi5jb20+
OyBhaXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2g7IG1heGltZUBjZXJuby50ZWNoOyBz
YW1AcmF2bmJvcmcub3JnDQqzrcvNOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmUgQWlybGllIDxhaXJs
aWVkQGdtYWlsLmNvbT47IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQrW
98ziOiBbUEFUQ0hdIGRybS9oaXNpbGljb24vaGlibWM6IFJlbW92ZSB2YXJpYWJsZSAncHJpdicg
ZnJvbSBoaWJtY191bmxvYWQoKQ0KDQpUaGUgdmFyaWFibGUgJ3ByaXYnIGdvdCBpbnRyb2R1Y2Vk
IGluIGNvbW1pdCAzOWEzNjRhMTllMDMNCigiZHJtL2hpc2lsaWNvbi9oaWJtYzogQ29udmVydCB0
byBMaW51eCBJUlEgaW50ZXJmYWNlcyIpIGJ5IGFjY2lkZW50Lg0KSXQncyB1bnVzZWQ7IHJlbW92
ZSBpdC4gRml4ZXMgYSBjb21waWxlciB3YXJuaW5nLg0KDQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCkZpeGVzOiAzOWEzNjRhMTllMDMgKCJk
cm0vaGlzaWxpY29uL2hpYm1jOiBDb252ZXJ0IHRvIExpbnV4IElSUSBpbnRlcmZhY2VzIikNClJl
cG9ydGVkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQpDYzogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQpDYzogVGlhbiBUYW8gPHRpYW50YW82QGhp
c2lsaWNvbi5jb20+DQpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+DQpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCkNjOiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1j
L2hpYm1jX2RybV9kcnYuYyB8IDEgLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jDQpp
bmRleCBmNzNhOGUwZWExMmUuLjYxMGZjOGUxMzVmOSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYw0KQEAgLTI0OSw3ICsyNDksNiBAQCBz
dGF0aWMgaW50IGhpYm1jX2h3X2luaXQoc3RydWN0IGhpYm1jX2RybV9wcml2YXRlICpwcml2KQ0K
IA0KIHN0YXRpYyBpbnQgaGlibWNfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpICB7DQot
CXN0cnVjdCBoaWJtY19kcm1fcHJpdmF0ZSAqcHJpdiA9IHRvX2hpYm1jX2RybV9wcml2YXRlKGRl
dik7DQogCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYtPmRldik7DQogDQog
CWRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRldik7DQotLQ0KMi4zMi4wDQoNCg==
