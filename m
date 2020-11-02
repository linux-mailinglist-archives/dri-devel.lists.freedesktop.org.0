Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E7D2A2BBF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46F26E4FF;
	Mon,  2 Nov 2020 13:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFBB6E432
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:47:12 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPmkK15Jgz15PVx;
 Mon,  2 Nov 2020 16:47:05 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 16:46:58 +0800
Subject: Re: [PATCH] drm/hisilicon: Remove redundant null check
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao
 <tiantao6@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
References: <1604050046-64539-1-git-send-email-tiantao6@hisilicon.com>
 <2dbbbad0-53cf-52cc-3b6b-0d1547f7e085@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <f41cbcb3-d08a-7d3f-530c-a0cb3f9e3801@huawei.com>
Date: Mon, 2 Nov 2020 16:46:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2dbbbad0-53cf-52cc-3b6b-0d1547f7e085@suse.de>
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

CgrlnKggMjAyMC8xMS8yIDE2OjMyLCBUaG9tYXMgWmltbWVybWFubiDlhpnpgZM6Cj4gSGkKPiAK
PiBBbSAzMC4xMC4yMCB1bSAxMDoyNyBzY2hyaWViIFRpYW4gVGFvOgo+PiBkcm1faXJxX3VuaW5z
dGFsbCBjYW4gaGFuZGxlIHRoZSBjYXNlIHdoZXJlIGRldi0+aXJxX2VuYWJsZSBpcyBmYWxzZSwK
Pj4gc28gUmVtb3ZlIHJlZHVuZGFudCBudWxsIGNoZWNrLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBU
aWFuIFRhbyA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCA2ICsrKy0tLQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCj4+IGluZGV4IDBj
MWI0MGQuLmI3MTU4OWIxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2hpYm1jL2hpYm1jX2RybV9kcnYuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2hpYm1jL2hpYm1jX2RybV9kcnYuYwo+PiBAQCAtMjQ2LDEzICsyNDYsMTMgQEAgc3RhdGljIGlu
dCBoaWJtY191bmxvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPj4gICAKPj4gICAJZHJtX2F0
b21pY19oZWxwZXJfc2h1dGRvd24oZGV2KTsKPj4gICAKPj4gLQlpZiAoZGV2LT5pcnFfZW5hYmxl
ZCkKPj4gLQkJZHJtX2lycV91bmluc3RhbGwoZGV2KTsKPj4gLQo+PiArCWRybV9pcnFfdW5pbnN0
YWxsKGRldik7Cj4gCj4gUmVtb3ZpbmcgdGhpcyBjaGVjayB3b3VsZCBhdCBsZWFzdCByZXN1bHQg
aW4gYW4gZXJyb3IsIFsxXSBzbyByYXRoZXIKPiBsZWF2ZSBpdCBpbiBmb3Igbm93Lgo+IApOb3cg
dGhlcmUgc2VlbXMgdG8gYmUgbm8gZHJpdmVyIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2Yg
CmRybV9pcnFfdW5pbnN0YWxsCj4gSW5zdGVhZCwgd2UgY291bGQgZGlzY3VzcyBpZiBkcm1faXJx
X2luc3RhbGwoKSBzaG91bGQgYmVjb21lIGEgbWFuYWdlZAo+IGludGVyZmFjZS4KCkNvZGVzIGxp
a2UgdGhlIGZvbGxvd2luZwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pcnEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1faXJxLmMKaW5kZXggMDlkNmU5ZS4uNTcyMzU3YyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9pcnEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2lycS5jCkBAIC0xNzIsNiArMTcyLDkgQEAgaW50IGRybV9pcnFfdW5pbnN0YWxsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpCiAgICAgICAgIGJvb2wgaXJxX2VuYWJsZWQ7CiAgICAgICAgIGludCBp
OwoKKyAgICAgICBpZighZGV2LT5pcnFfZW5hYmxlZCB8fCAhZGV2KQorICAgICAgICAgICAgICAg
cmV0dXJuIDA7Cgo+IAo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+IAo+IFsxXQo+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2Ry
bV9pcnEuYyNMMjAxCj4gCj4+ICAgCXBjaV9kaXNhYmxlX21zaShkZXYtPnBkZXYpOwo+PiArCj4+
ICAgCWhpYm1jX2ttc19maW5pKHByaXYpOwo+PiAgIAloaWJtY19tbV9maW5pKHByaXYpOwo+PiAg
IAlkZXYtPmRldl9wcml2YXRlID0gTlVMTDsKPj4gKwo+PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+
ICAgCj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
