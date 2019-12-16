Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6485121AF9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 21:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCCF6E10D;
	Mon, 16 Dec 2019 20:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529A86E10D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 20:37:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id D08F3291A84
Subject: Re: [PATCHv4 03/36] drm/gem-fb-helper: Allow drivers to allocate
 struct drm_framebuffer on their own
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
 <20191213155907.16581-4-andrzej.p@collabora.com>
 <20191216170829.bemqww5g5yngltio@e110455-lin.cambridge.arm.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <a7281d11-e483-82c8-3922-be3c96153fa0@collabora.com>
Date: Mon, 16 Dec 2019 21:37:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216170829.bemqww5g5yngltio@e110455-lin.cambridge.arm.com>
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, James Wang <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsCgpNeSB3YXkgb2YgdGhpbmtpbmcgaXMgZXhwbGFpbmVkIGJlbG93LiBEbyB5b3Ug
c3RpbGwgZmluZCBpdCBwcm9ibGVtYXRpYz8KClcgZG5pdSAxNi4xMi4yMDE5IG/CoDE4OjA4LCBM
aXZpdSBEdWRhdSBwaXN6ZToKPiBIaSBBbmRyemVqLAo+IAoKPHNuaXA+Cgo+PiArc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciAqCj4+ICtkcm1fZ2VtX2ZiX2NyZWF0ZV93aXRoX2Z1bmNzKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPj4gKwkJCSAgICAgY29uc3Qg
c3RydWN0IGRybV9tb2RlX2ZiX2NtZDIgKm1vZGVfY21kLAo+PiArCQkJICAgICBjb25zdCBzdHJ1
Y3QgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzICpmdW5jcykKPj4gK3sKPj4gKwlzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9ianNbNF07Cj4+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmI7Cj4+ICsJ
aW50IHJldCwgbnVtX3BsYW5lczsKPj4gKwo+PiArCXJldCA9IGRybV9nZW1fZmJfbG9va3VwKGRl
diwgZmlsZSwgbW9kZV9jbWQsIG9ianMpOwo+PiArCWlmIChyZXQgPCAwKQo+PiArCQlyZXR1cm4g
RVJSX1BUUihyZXQpOwoKaGVyZSBvYmpzIGlzIGd1YXJhbnRlZWQgdG8gaGF2ZSBiZWVuIGZpbGxl
ZC4uLgoKPj4gKwludW1fcGxhbmVzID0gcmV0Owo+PiArCj4+ICsJcmV0ID0gZHJtX2dlbV9mYl9z
aXplX2NoZWNrKGRldiwgbW9kZV9jbWQsIG9ianMpOwo+IAo+IGlmIGRybV9nZW1fZmJfc2l6ZV9j
aGVjaygpIHJldHVybnMgYW4gZXJyb3IsIHRoZW4gLi4uCj4gCj4+ICsJaWYgKHJldCkKPj4gKwkJ
ZmIgPSBFUlJfUFRSKHJldCk7Cj4+ICsJZWxzZQo+PiArCQlmYiA9IGRybV9nZW1fZmJfYWxsb2Mo
ZGV2LCBtb2RlX2NtZCwgb2JqcywgbnVtX3BsYW5lcywgZnVuY3MpOwo+IAo+IC4uLi4gdGhlIGVs
c2UgcGFydCBpcyBub3QgdGFrZW4sIGJ1dCAuLi4KCi4uLiBub25ldGhlbGVzcyBvYmpzIGhhdmUg
YWxyZWFkeSBiZWVuIGxvb2tlZCB1cC4uLgoKPiAKPj4gICAKPj4gLQlyZXR1cm4gRVJSX1BUUihy
ZXQpOwo+PiArCWlmIChJU19FUlIoZmIpKQo+PiArCQlmb3IgKG51bV9wbGFuZXMtLTsgbnVtX3Bs
YW5lcyA+PSAwOyBudW1fcGxhbmVzLS0pCj4+ICsJCQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2Nr
ZWQob2Jqc1tudW1fcGxhbmVzXSk7Cj4gCj4gLi4uIGhlcmUgeW91J2xsIGF0dGVtcHQgdG8gZGVy
ZWZlcmVuY2UgdGhlIG9ianMuIEkgZG9uJ3QgdGhpbmsgdGhhdCBpcyBjb3JyZWN0LgoKLi4uIHNv
IGl0IGlzIHNhZmUgdG8gZGVyZWZlcmVuY2Ugb2JqcyBoZXJlCgpSZWdhcmRzLAoKQW5kcnplagpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
