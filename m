Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D599717B7E2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F30C6EC70;
	Fri,  6 Mar 2020 08:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F4F6EC5F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 04:17:35 +0000 (UTC)
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id C0E65126F8CD98FD0DC4;
 Fri,  6 Mar 2020 11:59:58 +0800 (CST)
Received: from dggeme712-chm.china.huawei.com (10.1.199.108) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 6 Mar 2020 11:59:58 +0800
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme712-chm.china.huawei.com (10.1.199.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Fri, 6 Mar 2020 11:59:57 +0800
Received: from dggeme759-chm.china.huawei.com ([10.7.64.73]) by
 dggeme759-chm.china.huawei.com ([10.7.64.73]) with mapi id 15.01.1713.004;
 Fri, 6 Mar 2020 11:59:58 +0800
From: "tiantao (H)" <tiantao6@hisilicon.com>
To: "tiantao (H)" <tiantao6@hisilicon.com>, "Chenfeng (puck)"
 <puck.chen@hisilicon.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xinliang.liu@linaro.org"
 <xinliang.liu@linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcm0vaGlzaWxpY29uOiBDb2RlIGNsZWFudXAgZm9y?=
 =?gb2312?B?IGhpYm1jX2Rydl92ZGFj?=
Thread-Topic: [PATCH] drm/hisilicon: Code cleanup for hibmc_drv_vdac
Thread-Index: AQHV82l0rH8iwdUyDEm3ey4ityyBS6g68H7A
Date: Fri, 6 Mar 2020 03:59:58 +0000
Message-ID: <de254b5bd5304d4381fe0738fc52762b@hisilicon.com>
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
 <1583466184-7060-3-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1583466184-7060-3-git-send-email-tiantao6@hisilicon.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.57.60.129]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxso7oNCg0KCVNvcnJ5o6xwbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guDQoNCkJlc3QNCg0K
LS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IExpbnV4YXJtIFttYWlsdG86bGludXhhcm0tYm91
bmNlc0BodWF3ZWkuY29tXSC0+rHtIFRpYW4gVGFvDQq3osvNyrG85DogMjAyMMTqM9TCNsjVIDEx
OjQzDQrK1bz+yMs6IENoZW5mZW5nIChwdWNrKSA8cHVjay5jaGVuQGhpc2lsaWNvbi5jb20+OyBh
aXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2g7IHR6aW1tZXJtYW5uQHN1c2UuZGU7IGty
YXhlbEByZWRoYXQuY29tOyBhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tOyB0Z2x4QGxpbnV0cm9u
aXguZGU7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IHhpbmxpYW5nLmxpdUBsaW5h
cm8ub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQqzrcvNOiBMaW51eGFybSA8bGlu
dXhhcm1AaHVhd2VpLmNvbT4NCtb3zOI6IFtQQVRDSF0gZHJtL2hpc2lsaWNvbjogQ29kZSBjbGVh
bnVwIGZvciBoaWJtY19kcnZfdmRhYw0KDQpjb2RlIGNsZWFudXAgZm9yIGhpYm1jX2Rydl92ZGFj
LmMsIG5vIGFjdHVhbCBmdW5jdGlvbiBjaGFuZ2VzLg0KDQpTaWduZWQtb2ZmLWJ5OiBUaWFuIFRh
byA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4NClNpZ25lZC1vZmYtYnk6IEdvbmcganVuamllIDxn
b25nanVuamllMkBodWF3ZWkuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9o
aWJtYy9oaWJtY19kcm1fdmRhYy5jIHwgNDkgKysrKysrKystLS0tLS0tLS0tLS0tLS0tDQogMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fdmRhYy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fdmRhYy5jDQppbmRleCA2
NzhhYzJlLi5mMGU2YmI4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9o
aWJtYy9oaWJtY19kcm1fdmRhYy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hp
Ym1jL2hpYm1jX2RybV92ZGFjLmMNCkBAIC01MiwzMiArNTIsNiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9jb25uZWN0b3JfZnVuY3MgaGlibWNfY29ubmVjdG9yX2Z1bmNzID0gew0KIAkuYXRv
bWljX2Rlc3Ryb3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZGVzdHJveV9z
dGF0ZSwNCiB9Ow0KIA0KLXN0YXRpYyBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqDQotaGlibWNfY29u
bmVjdG9yX2luaXQoc3RydWN0IGhpYm1jX2RybV9wcml2YXRlICpwcml2KSAtew0KLQlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gcHJpdi0+ZGV2Ow0KLQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yOw0KLQlpbnQgcmV0Ow0KLQ0KLQljb25uZWN0b3IgPSBkZXZtX2t6YWxsb2MoZGV2LT5k
ZXYsIHNpemVvZigqY29ubmVjdG9yKSwgR0ZQX0tFUk5FTCk7DQotCWlmICghY29ubmVjdG9yKSB7
DQotCQlEUk1fRVJST1IoImZhaWxlZCB0byBhbGxvYyBtZW1vcnkgd2hlbiBpbml0IGNvbm5lY3Rv
clxuIik7DQotCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCi0JfQ0KLQ0KLQlyZXQgPSBkcm1f
Y29ubmVjdG9yX2luaXQoZGV2LCBjb25uZWN0b3IsDQotCQkJCSAmaGlibWNfY29ubmVjdG9yX2Z1
bmNzLA0KLQkJCQkgRFJNX01PREVfQ09OTkVDVE9SX1ZHQSk7DQotCWlmIChyZXQpIHsNCi0JCURS
TV9FUlJPUigiZmFpbGVkIHRvIGluaXQgY29ubmVjdG9yOiAlZFxuIiwgcmV0KTsNCi0JCXJldHVy
biBFUlJfUFRSKHJldCk7DQotCX0NCi0JZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3Rv
ciwNCi0JCQkJICZoaWJtY19jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsNCi0NCi0JcmV0dXJuIGNv
bm5lY3RvcjsNCi19DQotDQogc3RhdGljIHZvaWQgaGlibWNfZW5jb2Rlcl9tb2RlX3NldChzdHJ1
Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsDQogCQkJCSAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICptb2RlLA0KIAkJCQkgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqX21vZGUpIEBAIC0x
MDksMTMgKzgzLDYgQEAgaW50IGhpYm1jX3ZkYWNfaW5pdChzdHJ1Y3QgaGlibWNfZHJtX3ByaXZh
dGUgKnByaXYpDQogCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7DQogCWludCByZXQ7
DQogDQotCWNvbm5lY3RvciA9IGhpYm1jX2Nvbm5lY3Rvcl9pbml0KHByaXYpOw0KLQlpZiAoSVNf
RVJSKGNvbm5lY3RvcikpIHsNCi0JCURSTV9FUlJPUigiZmFpbGVkIHRvIGNyZWF0ZSBjb25uZWN0
b3I6ICVsZFxuIiwNCi0JCQkgIFBUUl9FUlIoY29ubmVjdG9yKSk7DQotCQlyZXR1cm4gUFRSX0VS
Uihjb25uZWN0b3IpOw0KLQl9DQotDQogCWVuY29kZXIgPSBkZXZtX2t6YWxsb2MoZGV2LT5kZXYs
IHNpemVvZigqZW5jb2RlciksIEdGUF9LRVJORUwpOw0KIAlpZiAoIWVuY29kZXIpIHsNCiAJCURS
TV9FUlJPUigiZmFpbGVkIHRvIGFsbG9jIG1lbW9yeSB3aGVuIGluaXQgZW5jb2RlclxuIik7IEBA
IC0xMzEsNiArOTgsMjIgQEAgaW50IGhpYm1jX3ZkYWNfaW5pdChzdHJ1Y3QgaGlibWNfZHJtX3By
aXZhdGUgKnByaXYpDQogCX0NCiANCiAJZHJtX2VuY29kZXJfaGVscGVyX2FkZChlbmNvZGVyLCAm
aGlibWNfZW5jb2Rlcl9oZWxwZXJfZnVuY3MpOw0KKwljb25uZWN0b3IgPSBkZXZtX2t6YWxsb2Mo
ZGV2LT5kZXYsIHNpemVvZigqY29ubmVjdG9yKSwgR0ZQX0tFUk5FTCk7DQorCWlmICghY29ubmVj
dG9yKSB7DQorCQlEUk1fRVJST1IoImZhaWxlZCB0byBhbGxvYyBtZW1vcnkgd2hlbiBpbml0IGNv
bm5lY3RvclxuIik7DQorCQlyZXR1cm4gLUVOT01FTTsNCisJfQ0KKw0KKwlyZXQgPSBkcm1fY29u
bmVjdG9yX2luaXQoZGV2LCBjb25uZWN0b3IsDQorCQkJCSAmaGlibWNfY29ubmVjdG9yX2Z1bmNz
LA0KKwkJCQkgRFJNX01PREVfQ09OTkVDVE9SX1ZHQSk7DQorCWlmIChyZXQpIHsNCisJCURSTV9F
UlJPUigiZmFpbGVkIHRvIGluaXQgY29ubmVjdG9yOiAlZFxuIiwgcmV0KTsNCisJCXJldHVybiBy
ZXQ7DQorCX0NCisNCisJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJmhpYm1j
X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOw0KKwlkcm1fY29ubmVjdG9yX3JlZ2lzdGVyKGNvbm5l
Y3Rvcik7DQogCWRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVy
KTsNCiANCiAJcmV0dXJuIDA7DQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCkxpbnV4YXJtIG1haWxpbmcgbGlzdA0KTGludXhhcm1A
aHVhd2VpLmNvbQ0KaHR0cDovL2h1bGsuaHVhd2VpLmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
YXJtDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
