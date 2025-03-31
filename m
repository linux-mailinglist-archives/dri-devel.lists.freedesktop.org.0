Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A0A766B1
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 15:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB7410E3F7;
	Mon, 31 Mar 2025 13:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=crpt.ru header.i=@crpt.ru header.b="LiC1Hdl3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CCB10E3FD;
 Mon, 31 Mar 2025 13:18:53 +0000 (UTC)
Received: from mail.crpt.ru ([192.168.60.4])
 by mail.crpt.ru  with ESMTP id 52VDIe9H015652-52VDIe9J015652
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
 Mon, 31 Mar 2025 16:18:40 +0300
Received: from EX2.crpt.local (192.168.60.4) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 31 Mar
 2025 16:18:40 +0300
Received: from EX2.crpt.local ([192.168.60.4]) by EX2.crpt.local
 ([192.168.60.4]) with mapi id 15.01.2507.044; Mon, 31 Mar 2025 16:18:40 +0300
From: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
To: Felix Kuehling <Felix.Kuehling@amd.com>
CC: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: [PATCH v2] drm/amdkfd: Change svm_range_get_info return type
Thread-Topic: [PATCH v2] drm/amdkfd: Change svm_range_get_info return type
Thread-Index: AQHboj9r5RaSSHXkwUiCl2J/gxqZZA==
Date: Mon, 31 Mar 2025 13:18:40 +0000
Message-ID: <20250331131833.68281-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX2.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 3/31/2025 10:37:00 AM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-FEAS-Client-IP: 192.168.60.4
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru;
 c=relaxed/relaxed; 
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=9lIdQkQX9NhVijtsyv+5cMKTdPnXRz7repYBlxwakX8=;
 b=LiC1Hdl3sEbAIU8+QDpAgP2xVY6l+ZTuywyeWuN4SfvZddDQyRoEUXv8H34ohMw2n3K9vdZTQlO6
 ZRW9oIwm9w1xqP85vFQ/9eeKU+htI2Awt9sZ3sIbbHHc9HHYrmGr1GCu6Rle8c4FHsS1t6JWEDF/
 RvaAN+zVM06KPAtHHKVUXF9qqBkVk81u58RH/u92KUpKYBKZEvqTk7oFEFvXMBkdZltT8yHHQQhQ
 dedUoSlQQ7G84w7skqTlbFm0DgTG1njR6qaqiwXpT+TjhoJ5b2F/hAMZ1x4Nnz9V6ZV/fTWURXTd
 jYeGTkHOBRQwKQbhAg5okbZra7dbJDp/3Yqe8Q==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5kcmV5IFZhdG9yb3BpbiA8YS52YXRvcm9waW5AY3JwdC5ydT4NCg0KU3RhdGljIGFu
YWx5c2lzIHNob3dzIHRoYXQgcG9pbnRlciAic3ZtcyIgY2Fubm90IGJlIE5VTEwgYmVjYXVzZSBp
dCBwb2ludHMNCnRvIHRoZSBvYmplY3QgInN0cnVjdCBzdm1fcmFuZ2VfbGlzdCIuIFJlbW92ZSB0
aGUgZXh0cmEgTlVMTCBjaGVjay4gSXQgaXMNCm1lYW5pbmdsZXNzIGFuZCBoYXJtcyB0aGUgcmVh
ZGFiaWxpdHkgb2YgdGhlIGNvZGUuDQoNCkluIHRoZSBmdW5jdGlvbiBzdm1fcmFuZ2VfZ2V0X2lu
Zm8oKSB0aGVyZSBpcyBubyBwb3NzaWJpbGl0eSBvZiBmYWlsdXJlLg0KVGhlcmVmb3JlLCB0aGUg
Y2FsbGVyIG9mIHRoZSBmdW5jdGlvbiBzdm1fcmFuZ2VfZ2V0X2luZm8oKSBkb2VzIG5vdCBuZWVk
DQphIHJldHVybiB2YWx1ZS4gQ2hhbmdlIHRoZSBmdW5jdGlvbiBzdm1fcmFuZ2VfZ2V0X2luZm8o
KSByZXR1cm4gdHlwZSBmcm9tDQoiaW50IiB0byAidm9pZCIuIA0KDQpTaW5jZSB0aGUgZnVuY3Rp
b24gc3ZtX3JhbmdlX2dldF9pbmZvKCkgaGFzIGEgcmV0dXJuIHR5cGUgb2YgInZvaWQiLiBUaGUN
CmNhbGxlciBvZiB0aGUgZnVuY3Rpb24gc3ZtX3JhbmdlX2dldF9pbmZvKCkgZG9lcyBub3QgbmVl
ZCBhIHJldHVybiB2YWx1ZS4NCkRlbGV0ZSBleHRyYSBjb2RlLg0KDQpGb3VuZCBieSBMaW51eCBW
ZXJpZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFNWQUNFLg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXkgVmF0b3JvcGluIDxhLnZhdG9yb3BpbkBjcnB0LnJ1Pg0KLS0tDQp2
MSAtPiB2MjogYWxzbyBjaGFuZ2UgcmV0dXJuIHR5cGUgb2Ygc3ZtX3JhbmdlX2dldF9pbmZvKCkg
cGVyIEZlbGl4IEt1ZWhsaW5nIHN1Z2dlc3Rpb24NCg0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9jaGFyZGV2LmMgfCAgNCArLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3N2bS5jICAgICB8ICA3ICsrLS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfc3ZtLmggICAgIHwgMTEgKysrKystLS0tLS0NCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2NoYXJkZXYuYw0KaW5kZXggMWU5ZGQwMDYyMGJmLi5hMjE0OWFmYTU4MDMgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQpAQCAtMjAzOSw5ICsyMDM5LDcgQEAg
c3RhdGljIGludCBjcml1X2dldF9wcm9jZXNzX29iamVjdF9pbmZvKHN0cnVjdCBrZmRfcHJvY2Vz
cyAqcCwNCiANCiAJbnVtX2V2ZW50cyA9IGtmZF9nZXRfbnVtX2V2ZW50cyhwKTsNCiANCi0JcmV0
ID0gc3ZtX3JhbmdlX2dldF9pbmZvKHAsICZudW1fc3ZtX3JhbmdlcywgJnN2bV9wcml2X2RhdGFf
c2l6ZSk7DQotCWlmIChyZXQpDQotCQlyZXR1cm4gcmV0Ow0KKwlzdm1fcmFuZ2VfZ2V0X2luZm8o
cCwgJm51bV9zdm1fcmFuZ2VzLCAmc3ZtX3ByaXZfZGF0YV9zaXplKTsNCiANCiAJKm51bV9vYmpl
Y3RzID0gbnVtX3F1ZXVlcyArIG51bV9ldmVudHMgKyBudW1fc3ZtX3JhbmdlczsNCiANCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3ZtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfc3ZtLmMNCmluZGV4IDEwMDcxN2E5OGVjMS4uMWI3ZDU3YTFi
MjQ1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3N2bS5jDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3ZtLmMNCkBAIC00MDc2LDggKzQw
NzYsOCBAQCBpbnQga2ZkX2NyaXVfcmVzdG9yZV9zdm0oc3RydWN0IGtmZF9wcm9jZXNzICpwLA0K
IAlyZXR1cm4gcmV0Ow0KIH0NCiANCi1pbnQgc3ZtX3JhbmdlX2dldF9pbmZvKHN0cnVjdCBrZmRf
cHJvY2VzcyAqcCwgdWludDMyX3QgKm51bV9zdm1fcmFuZ2VzLA0KLQkJICAgICAgIHVpbnQ2NF90
ICpzdm1fcHJpdl9kYXRhX3NpemUpDQordm9pZCBzdm1fcmFuZ2VfZ2V0X2luZm8oc3RydWN0IGtm
ZF9wcm9jZXNzICpwLCB1aW50MzJfdCAqbnVtX3N2bV9yYW5nZXMsDQorCQkJdWludDY0X3QgKnN2
bV9wcml2X2RhdGFfc2l6ZSkNCiB7DQogCXVpbnQ2NF90IHRvdGFsX3NpemUsIGFjY2Vzc2liaWxp
dHlfc2l6ZSwgY29tbW9uX2F0dHJfc2l6ZTsNCiAJaW50IG5hdHRyX2NvbW1vbiA9IDQsIG5hdHRy
X2FjY2Vzc2liaWxpdHkgPSAxOw0KQEAgLTQwODksOCArNDA4OSw2IEBAIGludCBzdm1fcmFuZ2Vf
Z2V0X2luZm8oc3RydWN0IGtmZF9wcm9jZXNzICpwLCB1aW50MzJfdCAqbnVtX3N2bV9yYW5nZXMs
DQogCSpzdm1fcHJpdl9kYXRhX3NpemUgPSAwOw0KIA0KIAlzdm1zID0gJnAtPnN2bXM7DQotCWlm
ICghc3ZtcykNCi0JCXJldHVybiAtRUlOVkFMOw0KIA0KIAltdXRleF9sb2NrKCZzdm1zLT5sb2Nr
KTsNCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShwcmFuZ2UsICZzdm1zLT5saXN0LCBsaXN0KSB7DQpA
QCAtNDEzMiw3ICs0MTMwLDYgQEAgaW50IHN2bV9yYW5nZV9nZXRfaW5mbyhzdHJ1Y3Qga2ZkX3By
b2Nlc3MgKnAsIHVpbnQzMl90ICpudW1fc3ZtX3JhbmdlcywNCiANCiAJcHJfZGVidWcoIm51bV9z
dm1fcmFuZ2VzICV1IHRvdGFsX3ByaXZfc2l6ZSAlbGx1XG4iLCAqbnVtX3N2bV9yYW5nZXMsDQog
CQkgKnN2bV9wcml2X2RhdGFfc2l6ZSk7DQotCXJldHVybiAwOw0KIH0NCiANCiBpbnQga2ZkX2Ny
aXVfY2hlY2twb2ludF9zdm0oc3RydWN0IGtmZF9wcm9jZXNzICpwLA0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9zdm0uaA0KaW5kZXggNmVhMjNjNzgwMDljLi4wMWM3YTQ4Nzc5MDQgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3ZtLmgNCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uaA0KQEAgLTE4NCw4ICsxODQsOCBAQCB2b2lk
IHNjaGVkdWxlX2RlZmVycmVkX2xpc3Rfd29yayhzdHJ1Y3Qgc3ZtX3JhbmdlX2xpc3QgKnN2bXMp
Ow0KIHZvaWQgc3ZtX3JhbmdlX2RtYV91bm1hcF9kZXYoc3RydWN0IGRldmljZSAqZGV2LCBkbWFf
YWRkcl90ICpkbWFfYWRkciwNCiAJCQkgdW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2lnbmVkIGxv
bmcgbnBhZ2VzKTsNCiB2b2lkIHN2bV9yYW5nZV9kbWFfdW5tYXAoc3RydWN0IHN2bV9yYW5nZSAq
cHJhbmdlKTsNCi1pbnQgc3ZtX3JhbmdlX2dldF9pbmZvKHN0cnVjdCBrZmRfcHJvY2VzcyAqcCwg
dWludDMyX3QgKm51bV9zdm1fcmFuZ2VzLA0KLQkJICAgICAgIHVpbnQ2NF90ICpzdm1fcHJpdl9k
YXRhX3NpemUpOw0KK3ZvaWQgc3ZtX3JhbmdlX2dldF9pbmZvKHN0cnVjdCBrZmRfcHJvY2VzcyAq
cCwgdWludDMyX3QgKm51bV9zdm1fcmFuZ2VzLA0KKwkJCXVpbnQ2NF90ICpzdm1fcHJpdl9kYXRh
X3NpemUpOw0KIGludCBrZmRfY3JpdV9jaGVja3BvaW50X3N2bShzdHJ1Y3Qga2ZkX3Byb2Nlc3Mg
KnAsDQogCQkJICAgIHVpbnQ4X3QgX191c2VyICp1c2VyX3ByaXZfZGF0YSwNCiAJCQkgICAgdWlu
dDY0X3QgKnByaXZfb2Zmc2V0KTsNCkBAIC0yMzcsMTMgKzIzNywxMiBAQCBzdGF0aWMgaW5saW5l
IGludCBzdm1fcmFuZ2Vfc2NoZWR1bGVfZXZpY3Rfc3ZtX2JvKA0KIAlyZXR1cm4gLUVJTlZBTDsN
CiB9DQogDQotc3RhdGljIGlubGluZSBpbnQgc3ZtX3JhbmdlX2dldF9pbmZvKHN0cnVjdCBrZmRf
cHJvY2VzcyAqcCwNCi0JCQkJICAgICB1aW50MzJfdCAqbnVtX3N2bV9yYW5nZXMsDQotCQkJCSAg
ICAgdWludDY0X3QgKnN2bV9wcml2X2RhdGFfc2l6ZSkNCitzdGF0aWMgaW5saW5lIHZvaWQgc3Zt
X3JhbmdlX2dldF9pbmZvKHN0cnVjdCBrZmRfcHJvY2VzcyAqcCwNCisJCQkJICAgICAgdWludDMy
X3QgKm51bV9zdm1fcmFuZ2VzLA0KKwkJCQkgICAgICB1aW50NjRfdCAqc3ZtX3ByaXZfZGF0YV9z
aXplKQ0KIHsNCiAJKm51bV9zdm1fcmFuZ2VzID0gMDsNCiAJKnN2bV9wcml2X2RhdGFfc2l6ZSA9
IDA7DQotCXJldHVybiAwOw0KIH0NCiANCiBzdGF0aWMgaW5saW5lIGludCBrZmRfY3JpdV9jaGVj
a3BvaW50X3N2bShzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAsDQotLSANCjIuNDMuMA0K
