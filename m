Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576EC6F9F0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E615389B01;
	Mon, 22 Jul 2019 07:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D0C89AB9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 01:44:10 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 06EACAE16D24FE63FEFF;
 Mon, 22 Jul 2019 09:44:07 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 22 Jul 2019 09:44:02 +0800
Subject: Re: [PATCH -next] drm/komeda: remove set but not used variable 'old'
To: <james.qian.wang@arm.com>, <liviu.dudau@arm.com>, <brian.starkey@arm.com>, 
 <airlied@linux.ie>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20190709135808.56388-1-yuehaibing@huawei.com>
 <20190718185150.GC15868@phenom.ffwll.local>
 <20190719130455.GP15868@phenom.ffwll.local>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <5d435034-501c-3d45-a72f-fac34ef12fc5@huawei.com>
Date: Mon, 22 Jul 2019 09:44:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190719130455.GP15868@phenom.ffwll.local>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:15 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS83LzE5IDIxOjA0LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFRodSwgSnVsIDE4
LCAyMDE5IGF0IDA4OjUxOjUwUE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIFR1
ZSwgSnVsIDA5LCAyMDE5IGF0IDA5OjU4OjA4UE0gKzA4MDAsIFl1ZUhhaWJpbmcgd3JvdGU6Cj4+
PiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4+Pgo+Pj4g
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYzoKPj4+ICBJ
biBmdW5jdGlvbiBrb21lZGFfcGxhbmVfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZToKPj4+IGRyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmM6MTYxOjM1Ogo+Pj4g
IHdhcm5pbmc6IHZhcmlhYmxlIG9sZCBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlCj4+Pgo+Pj4gSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IDk5MGRlZTNhYTQ1
NiAoImRybS9rb21lZGE6Cj4+PiBDb21wdXRpbmcgaW1hZ2UgZW5oYW5jZXIgaW50ZXJuYWxseSIp
Cj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+Pj4g
U2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+Pgo+PiBR
dWV1ZWQgZm9yIDUuMywgdGhhbmtzIGZvciB5b3VyIHBhdGNoLgo+IAo+IENvcnJlY3Rpb24sIHRo
aXMgZG9lc24ndCBldmVuIGNvbXBpbGUuIFBsZWFzZSBjb21waWxlLXRlc3QgcGF0Y2hlcyBiZWZv
cmUKPiBzdWJtaXR0aW5nLgo+IAoKT29wcywgc29ycnkgZm9yIHRoaXMsIEknbGwgYmUgbW9yZSBj
YXJlZnVsbHkuCgo+IFRoYW5rcywgRGFuaWVsCj4gCj4+IC1EYW5pZWwKPj4KPj4+IC0tLQo+Pj4g
IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgfCA0IC0t
LS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPj4+IGluZGV4
IGMwOTVhZjEuLmMxMzgxYWMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4+PiBAQCAtMTU4LDggKzE1OCw2IEBAIHN0
YXRpYyB2b2lkIGtvbWVkYV9wbGFuZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKPj4+
ICBzdGF0aWMgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqCj4+PiAga29tZWRhX3BsYW5lX2F0b21p
Y19kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4+PiAgewo+Pj4gLQlz
dHJ1Y3Qga29tZWRhX3BsYW5lX3N0YXRlICpuZXcsICpvbGQ7Cj4+PiAtCj4+PiAgCWlmIChXQVJO
X09OKCFwbGFuZS0+c3RhdGUpKQo+Pj4gIAkJcmV0dXJuIE5VTEw7Cj4+PiAgCj4+PiBAQCAtMTY5
LDggKzE2Nyw2IEBAIGtvbWVkYV9wbGFuZV9hdG9taWNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBk
cm1fcGxhbmUgKnBsYW5lKQo+Pj4gIAo+Pj4gIAlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX2R1
cGxpY2F0ZV9zdGF0ZShwbGFuZSwgJm5ldy0+YmFzZSk7Cj4+PiAgCj4+PiAtCW9sZCA9IHRvX2tw
bGFuZV9zdChwbGFuZS0+c3RhdGUpOwo+Pj4gLQo+Pj4gIAlyZXR1cm4gJm5ldy0+YmFzZTsKPj4+
ICB9Cj4+PiAgCj4+PiAtLSAKPj4+IDIuNy40Cj4+Pgo+Pj4KPj4KPj4gLS0gCj4+IERhbmllbCBW
ZXR0ZXIKPj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4+IGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
