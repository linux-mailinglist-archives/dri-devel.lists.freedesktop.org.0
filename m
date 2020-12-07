Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DD2D25EF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE93389F5F;
	Tue,  8 Dec 2020 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEEC89C96
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:30:12 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqJ145c80zkmXL;
 Mon,  7 Dec 2020 17:29:28 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Dec 2020
 17:29:56 +0800
Subject: Re: [PATCH drm/hisilicon v2 1/2] drm/hisilicon: Use managed
 mode-config init
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao
 <tiantao6@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
References: <1607331906-19005-1-git-send-email-tiantao6@hisilicon.com>
 <1607331906-19005-2-git-send-email-tiantao6@hisilicon.com>
 <cf28147b-a506-3d72-fb71-bb30a801fd8d@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <0d60eccc-907d-6fc2-e1c2-c7fe0facd21e@huawei.com>
Date: Mon, 7 Dec 2020 17:29:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cf28147b-a506-3d72-fb71-bb30a801fd8d@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrlnKggMjAyMC8xMi83IDE3OjIyLCBUaG9tYXMgWmltbWVybWFubiDlhpnpgZM6Cj4gSGkKPiAK
PiBBbSAwNy4xMi4yMCB1bSAxMDowNSBzY2hyaWViIFRpYW4gVGFvOgo+PiBVc2luZyBkcm1tX21v
ZGVfY29uZmlnX2luaXQoKSBzZXRzIHVwIG1hbmFnZWQgcmVsZWFzZSBvZiBtb2Rlc2V0dGluZwo+
PiByZXNvdXJjZXMuCj4+Cj4gCj4gSW5kaXZpZHVhbCBwYXRjaGVzIHVzdWFsbHkgY29udGFpbiBh
IGNoYW5nZWxvZyB0byBoaWdobGlnaHQgdGhlIAo+IGRpZmZlcmVuY2UgdG8gcHJldmlvdXMgdmVy
c2lvbnMuIFBsZWFzZSBhZGQgb25lIGJlZm9yZSBjb21taXR0aW5nIHRoZSAKCkp1c3QgdG8gYmUg
c3VyZTogSSBkb24ndCBuZWVkIHRvIGFkZCBhIGNoYW5nbG9nIHRvIHRoaXMgaW5kaXZpZHVhbCAK
cGF0Y2gsIHJpZ2h0PwoKPiBwYXRjaC7CoCBZb3VyIGNvdmVyIGxldHRlciBmb3IgdGhlIHNlcmll
cyBhbHJlYWR5IGRvZXMgdGhpcyBjb3JyZWN0bHkuCj4gCj4+IFNpZ25lZC1vZmYtYnk6IFRpYW4g
VGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPgo+IAo+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAKPiBUaGFua3MgZm9yIGFsbCB0aGVzZSB1
cGRhdGVzLgoKVGhhbmsgeW91IGZvciB5b3VyIGNvbnN0YW50IGhlbHAgd2l0aCB0aGUgcmV2aWV3
IGNvZGUgYW5kIHlvdXIgY2FyZWZ1bCAKZ3VpZGFuY2UhCgo+IAo+PiAtLS0KPj4gwqAgZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCAxNCArKystLS0tLS0t
LS0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYu
aCB8wqAgMSAtCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGli
bWMvaGlibWNfZHJtX2Rydi5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMv
aGlibWNfZHJtX2Rydi5jCj4+IGluZGV4IDM2ODc3NTMuLjdmMDEyMTMgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCj4+IEBAIC05
Niw4ICs5Niw5IEBAIHN0YXRpYyBpbnQgaGlibWNfa21zX2luaXQoc3RydWN0IGhpYm1jX2RybV9w
cml2YXRlIAo+PiAqcHJpdikKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0g
JnByaXYtPmRldjsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiAtwqDCoMKgIGRybV9tb2RlX2Nv
bmZpZ19pbml0KGRldik7Cj4+IC3CoMKgwqAgcHJpdi0+bW9kZV9jb25maWdfaW5pdGlhbGl6ZWQg
PSB0cnVlOwo+PiArwqDCoMKgIHJldCA9IGRybW1fbW9kZV9jb25maWdfaW5pdChkZXYpOwo+PiAr
wqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoMKgwqDC
oMKgIGRldi0+bW9kZV9jb25maWcubWluX3dpZHRoID0gMDsKPj4gwqDCoMKgwqDCoCBkZXYtPm1v
ZGVfY29uZmlnLm1pbl9oZWlnaHQgPSAwOwo+PiBAQCAtMTI1LDE0ICsxMjYsNiBAQCBzdGF0aWMg
aW50IGhpYm1jX2ttc19pbml0KHN0cnVjdCAKPj4gaGlibWNfZHJtX3ByaXZhdGUgKnByaXYpCj4+
IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gLXN0YXRpYyB2b2lkIGhpYm1jX2ttc19m
aW5pKHN0cnVjdCBoaWJtY19kcm1fcHJpdmF0ZSAqcHJpdikKPj4gLXsKPj4gLcKgwqDCoCBpZiAo
cHJpdi0+bW9kZV9jb25maWdfaW5pdGlhbGl6ZWQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGRybV9t
b2RlX2NvbmZpZ19jbGVhbnVwKCZwcml2LT5kZXYpOwo+PiAtwqDCoMKgwqDCoMKgwqAgcHJpdi0+
bW9kZV9jb25maWdfaW5pdGlhbGl6ZWQgPSBmYWxzZTsKPj4gLcKgwqDCoCB9Cj4+IC19Cj4+IC0K
Pj4gwqAgLyoKPj4gwqDCoCAqIEl0IGNhbiBvcGVyYXRlIGluIG9uZSBvZiB0aHJlZSBtb2Rlczog
MCwgMSBvciBTbGVlcC4KPj4gwqDCoCAqLwo+PiBAQCAtMjYyLDcgKzI1NSw2IEBAIHN0YXRpYyBp
bnQgaGlibWNfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4+IMKgwqDCoMKgwqAgZHJt
X2F0b21pY19oZWxwZXJfc2h1dGRvd24oZGV2KTsKPj4gwqDCoMKgwqDCoCBwY2lfZGlzYWJsZV9t
c2koZGV2LT5wZGV2KTsKPj4gLcKgwqDCoCBoaWJtY19rbXNfZmluaShwcml2KTsKPj4gwqDCoMKg
wqDCoCBkZXYtPmRldl9wcml2YXRlID0gTlVMTDsKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4g
wqAgfQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJt
Y19kcm1fZHJ2LmggCj4+IGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19k
cm1fZHJ2LmgKPj4gaW5kZXggYTQ5YzEwZS4uN2QyNjNmNCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmgKPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmgKPj4gQEAgLTQyLDcgKzQy
LDYgQEAgc3RydWN0IGhpYm1jX2RybV9wcml2YXRlIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJt
X2NydGMgY3J0YzsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2VuY29kZXIgZW5jb2RlcjsKPj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgaGlibWNfY29ubmVjdG9yIGNvbm5lY3RvcjsKPj4gLcKgwqDCoCBi
b29sIG1vZGVfY29uZmlnX2luaXRpYWxpemVkOwo+PiDCoCB9Owo+PiDCoCBzdGF0aWMgaW5saW5l
IHN0cnVjdCBoaWJtY19jb25uZWN0b3IgKnRvX2hpYm1jX2Nvbm5lY3RvcihzdHJ1Y3QgCj4+IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
