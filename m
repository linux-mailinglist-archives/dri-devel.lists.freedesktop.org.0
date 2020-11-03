Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 490732A5F57
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804F689AFF;
	Wed,  4 Nov 2020 08:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF0D6E859
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:57:54 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CQNwF6ySjz71qv;
 Tue,  3 Nov 2020 16:57:49 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 3 Nov 2020
 16:57:45 +0800
Subject: Re: [PATCH v2] drm: Add the new api to install irq
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao
 <tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
 <8af4223a-037e-7093-cac3-0061aa7b8025@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <29e7eeb5-de7b-89bd-b710-38c00e3c7b54@huawei.com>
Date: Tue, 3 Nov 2020 16:57:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8af4223a-037e-7093-cac3-0061aa7b8025@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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

CgrlnKggMjAyMC8xMS8zIDE1OjU2LCBUaG9tYXMgWmltbWVybWFubiDlhpnpgZM6Cj4gSGkKPiAK
PiBUaGFua3MsIHRoZSBjb2RlIGxvb2tzIGdvb2QgYWxyZWFkeS4gVGhlcmUganVzdCBhcmUgYSBm
ZXcgbml0cyBiZWxvdy4KPiAKVGhhbmtzIGZvciB0aGUgaGVscCB3aXRoIHRoZSByZXZpZXcgY29k
ZS4KQWRkIHRoZSBuZXcgYXBpIGRldm1fZHJtX2lycV9pbnN0YWxsIGFuZCBoaW1iYyB1c2UgdGhl
IG5ldyBpbnRlcmZhY2UgYXMgCm9uZSBwYXRjaCBvciB0d28/Cgo+IEFtIDAzLjExLjIwIHVtIDAz
OjEwIHNjaHJpZWIgVGlhbiBUYW86Cj4+IEFkZCBuZXcgYXBpIGRldm1fZHJtX2lycV9pbnN0YWxs
KCkgdG8gcmVnaXN0ZXIgaW50ZXJydXB0cywKPj4gbm8gbmVlZCB0byBjYWxsIGRybV9pcnFfdW5p
bnN0YWxsKCkgd2hlbiB0aGUgZHJtIG1vZHVsZSBpcyByZW1vdmVkLgo+Pgo+PiB2MjoKPj4gZml4
ZWQgdGhlIHdyb25nIHBhcmFtZXRlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRp
YW50YW82QGhpc2lsaWNvbi5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2
LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIGluY2x1ZGUvZHJtL2RybV9kcnYu
aCAgICAgfCAgMyArKy0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCj4+IGluZGV4IGNkMTYyZDQuLjBmZTUyNDMgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kcnYuYwo+IAo+IFRoZSBpbXBsZW1lbnRhdGlvbiBzaG91bGQgcmF0aGVyIGdv
IHRvIGRybV9pcnEuYwo+IAo+PiBAQCAtMzksNiArMzksNyBAQAo+PiAgICNpbmNsdWRlIDxkcm0v
ZHJtX2NvbG9yX21nbXQuaD4KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KPj4gICAjaW5j
bHVkZSA8ZHJtL2RybV9maWxlLmg+Cj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4KPj4gICAj
aW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+Cj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fbW9kZV9v
YmplY3QuaD4KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+PiBAQCAtNjc4LDYgKzY3
OSwyOCBAQCBzdGF0aWMgaW50IGRldm1fZHJtX2Rldl9pbml0KHN0cnVjdCBkZXZpY2UgKnBhcmVu
dCwKPj4gICAJcmV0dXJuIHJldDsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgdm9pZCBkZXZtX2Ry
bV9kZXZfaXJxX3VuaW5zdGFsbCh2b2lkICpkYXRhKQo+PiArewo+PiArCWRybV9pcnFfdW5pbnN0
YWxsKGRhdGEpOwo+PiArfQo+PiArCj4+ICtpbnQgZGV2bV9kcm1faXJxX2luc3RhbGwoc3RydWN0
IGRldmljZSAqcGFyZW50LAo+PiArCQkJIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGludCBpcnEp
Cj4+ICt7Cj4+ICsJaW50IHJldDsKPj4gKwo+PiArCXJldCA9IGRybV9pcnFfaW5zdGFsbChkZXYs
IGlycSk7Cj4+ICsJaWYgKHJldCkKPj4gKwkJcmV0dXJuIHJldDsKPj4gKwo+PiArCXJldCA9IGRl
dm1fYWRkX2FjdGlvbihwYXJlbnQsIGRldm1fZHJtX2Rldl9pcnFfdW5pbnN0YWxsLCBkZXYpOwo+
PiArCWlmIChyZXQpCj4+ICsJCWRldm1fZHJtX2Rldl9pcnFfdW5pbnN0YWxsKGRldik7Cj4+ICsK
Pj4gKwlyZXR1cm4gcmV0Owo+PiArfQo+PiArRVhQT1JUX1NZTUJPTChkZXZtX2RybV9pcnFfaW5z
dGFsbCk7Cj4+ICsKPj4gICB2b2lkICpfX2Rldm1fZHJtX2Rldl9hbGxvYyhzdHJ1Y3QgZGV2aWNl
ICpwYXJlbnQsIHN0cnVjdCBkcm1fZHJpdmVyICpkcml2ZXIsCj4+ICAgCQkJICAgc2l6ZV90IHNp
emUsIHNpemVfdCBvZmZzZXQpCj4+ICAgewo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2Rydi5oIGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCj4+IGluZGV4IDAyMzA3NjIuLmZlYzE3NzYg
MTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaAo+PiArKysgYi9pbmNsdWRlL2Ry
bS9kcm1fZHJ2LmgKPiAKPiBBbmQgdGhlIGRlY2xhcmF0aW9uIHNob3VsZCBnbyB0byBkcm1faXJx
LmgKPiAKPiBXZSBnZW5lcmFsbHkgZG9uJ3QgbWVyZ2UgdW51c2VkIGNvZGUsIHNvIHlvdSBzaG91
bGQgY29udmVydCBhdCBsZWFzdCBvbmUKPiBLTVMgZHJpdmVyLCBzYXkgaGlibWMsIHRvIHVzZSB0
aGUgbmV3IGludGVyZmFjZS4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAKPj4gQEAgLTUx
Myw3ICs1MTMsOCBAQCBzdHJ1Y3QgZHJtX2RyaXZlciB7Cj4+ICAgCj4+ICAgdm9pZCAqX19kZXZt
X2RybV9kZXZfYWxsb2Moc3RydWN0IGRldmljZSAqcGFyZW50LCBzdHJ1Y3QgZHJtX2RyaXZlciAq
ZHJpdmVyLAo+PiAgIAkJCSAgIHNpemVfdCBzaXplLCBzaXplX3Qgb2Zmc2V0KTsKPj4gLQo+PiAr
aW50IGRldm1fZHJtX2lycV9pbnN0YWxsKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKPj4gKwkJCSBpbnQgaXJxKTsKPj4gICAvKioKPj4gICAgKiBkZXZtX2Ry
bV9kZXZfYWxsb2MgLSBSZXNvdXJjZSBtYW5hZ2VkIGFsbG9jYXRpb24gb2YgYSAmZHJtX2Rldmlj
ZSBpbnN0YW5jZQo+PiAgICAqIEBwYXJlbnQ6IFBhcmVudCBkZXZpY2Ugb2JqZWN0Cj4+Cj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
