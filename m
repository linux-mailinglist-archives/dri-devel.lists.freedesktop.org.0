Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B172E07F6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F65B6E847;
	Tue, 22 Dec 2020 09:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816006E051
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 00:42:02 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D0HZp2jmFzhvRJ;
 Tue, 22 Dec 2020 08:41:22 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 08:38:35 +0800
Subject: Re: [PATCH] drm/hisilicon: Use pcim_enable_device()
To: Daniel Vetter <daniel@ffwll.ch>, Tian Tao <tiantao6@hisilicon.com>
References: <1608511522-3100-1-git-send-email-tiantao6@hisilicon.com>
 <X+EbgCy17bUa8X1N@phenom.ffwll.local>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <aaef6075-eb6c-3fbe-5cb1-2415f96debd9@huawei.com>
Date: Tue, 22 Dec 2020 08:38:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X+EbgCy17bUa8X1N@phenom.ffwll.local>
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:48 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 kraxel@redhat.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CtTaIDIwMjAvMTIvMjIgNjowMiwgRGFuaWVsIFZldHRlciDQtLXAOgo+IE9uIE1vbiwgRGVjIDIx
LCAyMDIwIGF0IDA4OjQ1OjIyQU0gKzA4MDAsIFRpYW4gVGFvIHdyb3RlOgo+PiBVc2luZyB0aGUg
bWFuYWdlZCBmdW5jdGlvbiBzaW1wbGlmaWVzIHRoZSBlcnJvciBoYW5kbGluZy4gQWZ0ZXIKPj4g
dW5sb2FkaW5nIHRoZSBkcml2ZXIsIHRoZSBQQ0kgZGV2aWNlIHNob3VsZCBub3cgZ2V0IGRpc2Fi
bGVkIGFzCj4+IHdlbGwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBo
aXNpbGljb24uY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1j
L2hpYm1jX2RybV9kcnYuYyB8IDYgKystLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2ls
aWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKPj4gaW5kZXggMDJmM2JkMS4uNzE1OTAxOCAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2
LmMKPj4gQEAgLTMyOSw3ICszMjksNyBAQCBzdGF0aWMgaW50IGhpYm1jX3BjaV9wcm9iZShzdHJ1
Y3QgcGNpX2RldiAqcGRldiwKPj4gICAJZGV2LT5wZGV2ID0gcGRldjsKPj4gICAJcGNpX3NldF9k
cnZkYXRhKHBkZXYsIGRldik7Cj4+ICAgCj4+IC0JcmV0ID0gcGNpX2VuYWJsZV9kZXZpY2UocGRl
dik7Cj4+ICsJcmV0ID0gcGNpbV9lbmFibGVfZGV2aWNlKHBkZXYpOwo+PiAgIAlpZiAocmV0KSB7
Cj4+ICAgCQlkcm1fZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUgcGNpIGRldmljZTogJWRcbiIs
IHJldCk7Cj4+ICAgCQlnb3RvIGVycl9mcmVlOwo+PiBAQCAtMzM4LDcgKzMzOCw3IEBAIHN0YXRp
YyBpbnQgaGlibWNfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+PiAgIAlyZXQgPSBo
aWJtY19sb2FkKGRldik7Cj4+ICAgCWlmIChyZXQpIHsKPj4gICAJCWRybV9lcnIoZGV2LCAiZmFp
bGVkIHRvIGxvYWQgaGlibWM6ICVkXG4iLCByZXQpOwo+PiAtCQlnb3RvIGVycl9kaXNhYmxlOwo+
PiArCQlnb3RvIGVycl9mcmVlOwo+PiAgIAl9Cj4+ICAgCj4+ICAgCXJldCA9IGRybV9kZXZfcmVn
aXN0ZXIoZGV2LCAwKTsKPj4gQEAgLTM1NCw4ICszNTQsNiBAQCBzdGF0aWMgaW50IGhpYm1jX3Bj
aV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPj4gICAKPj4gICBlcnJfdW5sb2FkOgo+PiAg
IAloaWJtY191bmxvYWQoZGV2KTsKPj4gLWVycl9kaXNhYmxlOgo+PiAtCXBjaV9kaXNhYmxlX2Rl
dmljZShwZGV2KTsKPj4gICBlcnJfZnJlZToKPj4gICAJZHJtX2Rldl9wdXQoZGV2KTsKPiBUaGUg
ZHJtX2Rldl9wdXQgaGVyZSBhbmQgaW4gaGlibWNfcGNpX3JlbW92ZSBpcyB3cm9uZywgZGV2bV9k
cm1fZGV2X2FsbG9jCj4gdGFrZXMgY2FyZSBvZiB0aGF0IGFscmVhZHkuIEknbSBraW5kYSBzdXBy
aXNlZCB5b3UgZG9uJ3QgaGF2ZSBhIHJlZmNvdW50Cj4gdW5kZXJydW4gYWxyZWFkeSAtIGRvIHlv
dSB0ZXN0IG1vZHVsZSB1bmxvYWQgd2l0aCBLQVNBTiBlbmFibGVkPwoKVGhhbmtzIGZvciBoZWxw
aW5nIHRvIHJldmlldyB0aGUgY29kZaOsYW5kIGtpbmRseSBnaXZpbmcgbWUgYWR2aWNloaMKCnRo
aXMgcHJvYmxlbSBoYXZlIGJlZW4gZml4ZWShowoKYzg1NWFmMmY5YzVjNjA3NjBmZDFiZWQ3ODg5
YTgxYmMzN2QyNTkxZCBkcm0vaGlzaWxpY29uOiBGaXggdXNlLWFmdGVyLWZyZWUKCj4gVGhlIHBj
aW0gcGF0Y2ggbG9va3Mgb2ssIHNvIFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgo+Cj4gQ2hlZXJzLCBEYW5pZWwKPgo+PiAgIAo+PiAtLSAKPj4gMi43
LjQKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
