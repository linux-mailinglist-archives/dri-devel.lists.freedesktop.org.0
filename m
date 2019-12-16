Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C02DF121807
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 19:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F586E85F;
	Mon, 16 Dec 2019 18:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1786E85F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 18:41:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2A453283C49
Subject: Re: [PATCHv4 05/36] drm/gem-fb-helper: Add generic afbc size checks
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
 <20191213155907.16581-6-andrzej.p@collabora.com>
 <20191216171903.fqujludojsyphodo@e110455-lin.cambridge.arm.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <96f82e93-8595-1020-fb08-53a521dc535a@collabora.com>
Date: Mon, 16 Dec 2019 19:41:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216171903.fqujludojsyphodo@e110455-lin.cambridge.arm.com>
Content-Language: en-US
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 James Wang <james.qian.wang@arm.com>, dri-devel@lists.freedesktop.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsCgpXIGRuaXUgMTYuMTIuMjAxOSBvwqAxODoxOSwgTGl2aXUgRHVkYXUgcGlzemU6
Cj4gSGkgQW5kcnplaiwKPiAKPiBPbiBGcmksIERlYyAxMywgMjAxOSBhdCAwNDo1ODozNlBNICsw
MTAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4+IEV4dGVuZCB0aGUgc2l6ZS1jaGVj
a2luZyBzcGVjaWFsIGZ1bmN0aW9uIHRvIGhhbmRsZSBhZmJjLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+PiAtLS0K
Pj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jICAgICAgICAgICAgICAgICB8IDEwICsr
Ky0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMgICAgICAgICAgICB8ICAz
ICsKPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYyB8IDYw
ICsrKysrKysrKysrKysrKysrKy0tCj4+ICAgaW5jbHVkZS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZl
cl9oZWxwZXIuaCAgICAgfCAxNiArKysrKysKPj4gICA0IGZpbGVzIGNoYW5nZWQsIDgyIGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZvdXJjYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+PiBpbmRleCBk
MTRkZDdjODYwMjAuLjlhYzIxNzVjNWJlZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9mb3VyY2MuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jCj4+IEBA
IC0zMjMsOCArMzIzLDE0IEBAIGRybV9nZXRfZm9ybWF0X2luZm8oc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwKPj4gICB7Cj4+ICAgCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmluZm8gPSBO
VUxMOwo+PiAgIAo+PiAtCWlmIChkZXYtPm1vZGVfY29uZmlnLmZ1bmNzLT5nZXRfZm9ybWF0X2lu
Zm8pCj4+IC0JCWluZm8gPSBkZXYtPm1vZGVfY29uZmlnLmZ1bmNzLT5nZXRfZm9ybWF0X2luZm8o
bW9kZV9jbWQpOwo+PiArCS8qIGJ5cGFzcyBkcml2ZXIgY2FsbGJhY2sgaWYgYWZiYyAqLwo+PiAr
CWlmICghZHJtX2lzX2FmYmMobW9kZV9jbWQtPm1vZGlmaWVyWzBdKSkKPj4gKwkJaWYgKGRldi0+
bW9kZV9jb25maWcuZnVuY3MtPmdldF9mb3JtYXRfaW5mbykgewo+PiArCQkJY29uc3Qgc3RydWN0
IGRybV9tb2RlX2NvbmZpZ19mdW5jcyAqZnVuY3M7Cj4+ICsKPj4gKwkJCWZ1bmNzID0gZGV2LT5t
b2RlX2NvbmZpZy5mdW5jczsKPj4gKwkJCWluZm8gPSBmdW5jcy0+Z2V0X2Zvcm1hdF9pbmZvKG1v
ZGVfY21kKTsKPj4gKwkJfQo+IAo+IFdoYXQgaGFzIHRoaXMgY2hhbmdlIHRvIGRvIHdpdGggdGhl
IHJlc3Qgb2YgdGhlIHBhdGNoPyBBbHNvLCBJIHRoaW5rIHRoaXMgZ29lcwo+IGFnYWluc3QgdGhl
IGlkZWEgdGhhdCBhbiBBRkJDLWF3YXJlIGRyaXZlciBtaWdodCByZXR1cm4gYmV0dGVyIGRhdGEg
YWJvdXQgdGhlIGZvcm1hdAo+IGluZm8gdGhhbiB0aGUgZHJtX2Zvcm1hdF9pbmZvKCkgY29kZS4K
PiAKClRoZSByZWFzb24gaXMgdGhlIGNvbmNsdXNpb24gb2YgbXkgdGFsayB3aXRoIGRhbnZldCBv
biBpcmM6CgpodHRwczovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmNicmlsbC9kcmktbG9nLz9j
aGFubmVsPWRyaS1kZXZlbCZoaWdobGlnaHRfbmFtZXM9JmRhdGU9MjAxOS0xMS0xMyZzaG93X2h0
bWw9dHJ1ZQoKSSBmb2xsb3dlZCBoaXMgYWR2aWNlIC0gaWYgSSB1bmRlcnN0b29kIGhpbSBjb3Jy
ZWN0bHksIHRoYXQgaXMuCgo+IEFzIGEgYmlrZXNoZWQsIEkga25vdyBpdCBpcyB1c2VmdWwgZm9y
IGRlYnVnZ2luZyB0byB0dXJuIHRoZSBvbmVsaW5lciBpbnRvIDMsIGJ1dCBpdAo+IGZlZWxzIGxp
a2Ugbm90IG5lY2Vzc2FyeSBoZXJlLgoKODAgY2hhcnMgcGVyIGxpbmUuIElmIGtlcHQgaW4gb25l
IGxpbmUsIHRoZSBsaW1pdCBpcyBleGNlZWRlZAp3aXRoIGFuIGFkZGl0aW9uYWwgaW5kZW50YXRp
b24gbGV2ZWwgcHJlc2VudC4KClJlZ2FyZHMsCgpBbmRyemVqCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
