Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C292A2BCE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788EB6EB7D;
	Mon,  2 Nov 2020 13:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BA36E0D9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:06:53 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPn936cbxzkdXL;
 Mon,  2 Nov 2020 17:06:47 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 17:06:43 +0800
Subject: Re: [PATCH] drm/hisilicon: Remove redundant null check
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao
 <tiantao6@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
References: <1604050046-64539-1-git-send-email-tiantao6@hisilicon.com>
 <2dbbbad0-53cf-52cc-3b6b-0d1547f7e085@suse.de>
 <f41cbcb3-d08a-7d3f-530c-a0cb3f9e3801@huawei.com>
 <b3656895-42a5-ff20-a695-dccaf1992938@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <48f68940-14a4-6ea7-4296-53970cd74015@huawei.com>
Date: Mon, 2 Nov 2020 17:06:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b3656895-42a5-ff20-a695-dccaf1992938@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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

CgrlnKggMjAyMC8xMS8yIDE3OjAzLCBUaG9tYXMgWmltbWVybWFubiDlhpnpgZM6Cj4gSGkKPiAK
PiBBbSAwMi4xMS4yMCB1bSAwOTo0NiBzY2hyaWViIHRpYW50YW8gKEgpOgo+Pgo+Pgo+PiDlnKgg
MjAyMC8xMS8yIDE2OjMyLCBUaG9tYXMgWmltbWVybWFubiDlhpnpgZM6Cj4+PiBIaQo+Pj4KPj4+
IEFtIDMwLjEwLjIwIHVtIDEwOjI3IHNjaHJpZWIgVGlhbiBUYW86Cj4+Pj4gZHJtX2lycV91bmlu
c3RhbGwgY2FuIGhhbmRsZSB0aGUgY2FzZSB3aGVyZSBkZXYtPmlycV9lbmFibGUgaXMgZmFsc2Us
Cj4+Pj4gc28gUmVtb3ZlIHJlZHVuZGFudCBudWxsIGNoZWNrLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogVGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKg
IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIHwgNiArKyst
LS0KPj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1j
L2hpYm1jX2RybV9kcnYuYwo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9o
aWJtY19kcm1fZHJ2LmMKPj4+PiBpbmRleCAwYzFiNDBkLi5iNzE1ODliMSAxMDA2NDQKPj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYwo+Pj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCj4+
Pj4gQEAgLTI0NiwxMyArMjQ2LDEzIEBAIHN0YXRpYyBpbnQgaGlibWNfdW5sb2FkKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpCj4+Pj4gIMKgIMKgwqDCoMKgwqAgZHJtX2F0b21pY19oZWxwZXJfc2h1
dGRvd24oZGV2KTsKPj4+PiAgwqAgLcKgwqDCoCBpZiAoZGV2LT5pcnFfZW5hYmxlZCkKPj4+PiAt
wqDCoMKgwqDCoMKgwqAgZHJtX2lycV91bmluc3RhbGwoZGV2KTsKPj4+PiAtCj4+Pj4gK8KgwqDC
oCBkcm1faXJxX3VuaW5zdGFsbChkZXYpOwo+Pj4KPj4+IFJlbW92aW5nIHRoaXMgY2hlY2sgd291
bGQgYXQgbGVhc3QgcmVzdWx0IGluIGFuIGVycm9yLCBbMV0gc28gcmF0aGVyCj4+PiBsZWF2ZSBp
dCBpbiBmb3Igbm93Lgo+Pj4KPj4gTm93IHRoZXJlIHNlZW1zIHRvIGJlIG5vIGRyaXZlciB0byBj
aGVjayB0aGUgcmV0dXJuIHZhbHVlIG9mCj4+IGRybV9pcnFfdW5pbnN0YWxsCj4gCj4gVHJ1ZS4g
Tm8gY2xlYW4tdXAgY29kZSBzaG91bGQgZXZlciBmYWlsLiBCdXQgY3VycmVudGx5LCBpdCdzIG5v
dCBoYW5kbGVkCj4gYnkgZHJtX2lycV91bmluc3RhbGwoKS4KPiAKPiBBIGJldHRlciBmaXggd291
bGQgYmUgdG8gaGF2ZSBkcm1faXJxX3VuaW5zdGFsbCgpIHJldHVybiBlYXJseSB3aXRoIGEKPiB3
YXJuaW5nIGlmIElSUXMgYXJlIGRpc2FibGVkLiBBbmQgZm9yIG1vc3QgZHJpdmVycywgYSBtYW5h
Z2VkIHZlcnNpb24gb2YKPiBkcm1faXJxX2luc3RhbGwoKSB3b3VsZCBiZSB1c2VmdWwuCj4gCkNv
ZGVzIGxpa2UgdGhlIGZvbGxvd2luZwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9p
cnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faXJxLmMKaW5kZXggMDlkNmU5ZS4uNTcyMzU3YyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9pcnEuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2lycS5jCkBAIC0xNzIsNiArMTcyLDkgQEAgaW50IGRybV9pcnFfdW5pbnN0YWxsKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAgICAgICAgIGJvb2wgaXJxX2VuYWJsZWQ7CiAgICAgICAg
IGludCBpOwoKKyAgICAgICBpZighZGV2LT5pcnFfZW5hYmxlZCB8fCAhZGV2KQorICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4gCj4+PiBJbnN0ZWFkLCB3
ZSBjb3VsZCBkaXNjdXNzIGlmIGRybV9pcnFfaW5zdGFsbCgpIHNob3VsZCBiZWNvbWUgYSBtYW5h
Z2VkCj4+PiBpbnRlcmZhY2UuCj4+Cj4+IENvZGVzIGxpa2UgdGhlIGZvbGxvd2luZwo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
aXJxLmMKPj4gaW5kZXggMDlkNmU5ZS4uNTcyMzU3YyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9pcnEuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jCj4+IEBA
IC0xNzIsNiArMTcyLDkgQEAgaW50IGRybV9pcnFfdW5pbnN0YWxsKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpCj4+ICDCoMKgwqDCoMKgwqDCoCBib29sIGlycV9lbmFibGVkOwo+PiAgwqDCoMKgwqDC
oMKgwqAgaW50IGk7Cj4+Cj4+ICvCoMKgwqDCoMKgwqAgaWYoIWRldi0+aXJxX2VuYWJsZWQgfHwg
IWRldikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Cj4+Pgo+
Pj4gQmVzdCByZWdhcmRzCj4+PiBUaG9tYXMKPj4+Cj4+PiBbMV0KPj4+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9pcnEu
YyNMMjAxCj4+Pgo+Pj4KPj4+PiAgwqDCoMKgwqDCoCBwY2lfZGlzYWJsZV9tc2koZGV2LT5wZGV2
KTsKPj4+PiArCj4+Pj4gIMKgwqDCoMKgwqAgaGlibWNfa21zX2ZpbmkocHJpdik7Cj4+Pj4gIMKg
wqDCoMKgwqAgaGlibWNfbW1fZmluaShwcml2KTsKPj4+PiAgwqDCoMKgwqDCoCBkZXYtPmRldl9w
cml2YXRlID0gTlVMTDsKPj4+PiArCj4+Pj4gIMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gIMKg
IH0KPj4+PiAgIAo+Pj4KPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
