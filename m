Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614382E0801
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEAB6E863;
	Tue, 22 Dec 2020 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722B26E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 08:31:20 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D0V086qZGzhw8f;
 Tue, 22 Dec 2020 16:30:32 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:31:07 +0800
Subject: Re: [PATCH] drm/hisilicon: Use pcim_enable_device()
To: Daniel Vetter <daniel@ffwll.ch>
References: <1608511522-3100-1-git-send-email-tiantao6@hisilicon.com>
 <X+EbgCy17bUa8X1N@phenom.ffwll.local>
 <aaef6075-eb6c-3fbe-5cb1-2415f96debd9@huawei.com>
 <CAKMK7uEKo6XEHfagk49ugWSmKO7mGQQ-EHpA9swNc9v-s1mtgQ@mail.gmail.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <e64279a8-4748-2614-0e9e-777404ef0862@huawei.com>
Date: Tue, 22 Dec 2020 16:31:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEKo6XEHfagk49ugWSmKO7mGQQ-EHpA9swNc9v-s1mtgQ@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDIwLzEyLzIyIDE2OjI3LCBEYW5pZWwgVmV0dGVyIOWGmemBkzoKPiBPbiBUdWUsIERl
YyAyMiwgMjAyMCBhdCAxOjM4IEFNIHRpYW50YW8gKEgpIDx0aWFudGFvNkBodWF3ZWkuY29tPiB3
cm90ZToKPj4KPj4g5ZyoIDIwMjAvMTIvMjIgNjowMiwgRGFuaWVsIFZldHRlciDlhpnpgZM6Cj4+
PiBPbiBNb24sIERlYyAyMSwgMjAyMCBhdCAwODo0NToyMkFNICswODAwLCBUaWFuIFRhbyB3cm90
ZToKPj4+PiBVc2luZyB0aGUgbWFuYWdlZCBmdW5jdGlvbiBzaW1wbGlmaWVzIHRoZSBlcnJvciBo
YW5kbGluZy4gQWZ0ZXIKPj4+PiB1bmxvYWRpbmcgdGhlIGRyaXZlciwgdGhlIFBDSSBkZXZpY2Ug
c2hvdWxkIG5vdyBnZXQgZGlzYWJsZWQgYXMKPj4+PiB3ZWxsLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogVGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCA2ICsrLS0t
LQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9o
aWJtY19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2Ry
bV9kcnYuYwo+Pj4+IGluZGV4IDAyZjNiZDEuLjcxNTkwMTggMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKPj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYwo+Pj4+IEBAIC0z
MjksNyArMzI5LDcgQEAgc3RhdGljIGludCBoaWJtY19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYg
KnBkZXYsCj4+Pj4gICAgICAgZGV2LT5wZGV2ID0gcGRldjsKPj4+PiAgICAgICBwY2lfc2V0X2Ry
dmRhdGEocGRldiwgZGV2KTsKPj4+Pgo+Pj4+IC0gICAgcmV0ID0gcGNpX2VuYWJsZV9kZXZpY2Uo
cGRldik7Cj4+Pj4gKyAgICByZXQgPSBwY2ltX2VuYWJsZV9kZXZpY2UocGRldik7Cj4+Pj4gICAg
ICAgaWYgKHJldCkgewo+Pj4+ICAgICAgICAgICAgICAgZHJtX2VycihkZXYsICJmYWlsZWQgdG8g
ZW5hYmxlIHBjaSBkZXZpY2U6ICVkXG4iLCByZXQpOwo+Pj4+ICAgICAgICAgICAgICAgZ290byBl
cnJfZnJlZTsKPj4+PiBAQCAtMzM4LDcgKzMzOCw3IEBAIHN0YXRpYyBpbnQgaGlibWNfcGNpX3By
b2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+Pj4+ICAgICAgIHJldCA9IGhpYm1jX2xvYWQoZGV2
KTsKPj4+PiAgICAgICBpZiAocmV0KSB7Cj4+Pj4gICAgICAgICAgICAgICBkcm1fZXJyKGRldiwg
ImZhaWxlZCB0byBsb2FkIGhpYm1jOiAlZFxuIiwgcmV0KTsKPj4+PiAtICAgICAgICAgICAgZ290
byBlcnJfZGlzYWJsZTsKPj4+PiArICAgICAgICAgICAgZ290byBlcnJfZnJlZTsKPj4+PiAgICAg
ICB9Cj4+Pj4KPj4+PiAgICAgICByZXQgPSBkcm1fZGV2X3JlZ2lzdGVyKGRldiwgMCk7Cj4+Pj4g
QEAgLTM1NCw4ICszNTQsNiBAQCBzdGF0aWMgaW50IGhpYm1jX3BjaV9wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqcGRldiwKPj4+Pgo+Pj4+ICAgIGVycl91bmxvYWQ6Cj4+Pj4gICAgICAgaGlibWNfdW5s
b2FkKGRldik7Cj4+Pj4gLWVycl9kaXNhYmxlOgo+Pj4+IC0gICAgcGNpX2Rpc2FibGVfZGV2aWNl
KHBkZXYpOwo+Pj4+ICAgIGVycl9mcmVlOgo+Pj4+ICAgICAgIGRybV9kZXZfcHV0KGRldik7Cj4+
PiBUaGUgZHJtX2Rldl9wdXQgaGVyZSBhbmQgaW4gaGlibWNfcGNpX3JlbW92ZSBpcyB3cm9uZywg
ZGV2bV9kcm1fZGV2X2FsbG9jCj4+PiB0YWtlcyBjYXJlIG9mIHRoYXQgYWxyZWFkeS4gSSdtIGtp
bmRhIHN1cHJpc2VkIHlvdSBkb24ndCBoYXZlIGEgcmVmY291bnQKPj4+IHVuZGVycnVuIGFscmVh
ZHkgLSBkbyB5b3UgdGVzdCBtb2R1bGUgdW5sb2FkIHdpdGggS0FTQU4gZW5hYmxlZD8KPj4gVGhh
bmtzIGZvciBoZWxwaW5nIHRvIHJldmlldyB0aGUgY29kZe+8jGFuZCBraW5kbHkgZ2l2aW5nIG1l
IGFkdmljZeOAggo+Pgo+PiB0aGlzIHByb2JsZW0gaGF2ZSBiZWVuIGZpeGVk44CCCj4+Cj4+IGM4
NTVhZjJmOWM1YzYwNzYwZmQxYmVkNzg4OWE4MWJjMzdkMjU5MWQgZHJtL2hpc2lsaWNvbjogRml4
IHVzZS1hZnRlci1mcmVlCj4gU29ycnksIEkgd2FzIG9uIGFuIG9sZGVyIHRyZWUuIE5vdGUgdGhh
dCB0aGlzIGZpeCBpcyBpbmNvbXBsZXRlLCB0aGUKPiBkcm1fZGV2X3B1dCBpbiB0aGUgZXJyb3Ig
cGF0aCBvZiBoaWJtY19wY2lfcHJvYmUgc3RpbGwgZXhpc3RzLgo+IC1EYW5pZWwKSSBhbHNvIGZv
dW5kIHRoZSBwcm9ibGVtLCBoYXMgcmFpc2VkIHRoZSBwYXRjaCBpbiB0aGUgaW50ZXJuYWwgcmV2
aWV3IAphbmQgdGVzdGluZywgdG8gY29uZmlybSB0aGF0IHRoZXJlIGlzIG5vIHByb2JsZW0sIGl0
IHdpbGwgYmUgc2VudCBvdXQuClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLgo+Pj4gVGhlIHBjaW0g
cGF0Y2ggbG9va3Mgb2ssIHNvIFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgo+Pj4KPj4+IENoZWVycywgRGFuaWVsCj4+Pgo+Pj4+IC0tCj4+Pj4gMi43
LjQKPj4+Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
