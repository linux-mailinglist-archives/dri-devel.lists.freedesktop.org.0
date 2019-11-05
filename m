Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E1F0A38
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 00:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA18F6EB85;
	Tue,  5 Nov 2019 23:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B0C6EB85
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 23:34:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: daniels) with ESMTPSA id E83972852B3
Message-ID: <13a5d60f0262ea2505f95d139e04da7fa710fe7c.camel@collabora.com>
Subject: Re: [PATCHv2 4/4] drm/rockchip: Add support for afbc
From: Daniel Stone <daniels@collabora.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 dri-devel@lists.freedesktop.org
Date: Tue, 05 Nov 2019 23:34:28 +0000
In-Reply-To: <20191104221228.3588-5-andrzej.p@collabora.com>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-5-andrzej.p@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.34.1 (by Flathub.org) 
MIME-Version: 1.0
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-rockchip@lists.infradead.org, James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKCk9uIE1vbiwgMjAxOS0xMS0wNCBhdCAyMzoxMiArMDEwMCwgQW5kcnplaiBQ
aWV0cmFzaWV3aWN6IHdyb3RlOgo+ICsJaWYgKG1vZGVfY21kLT5tb2RpZmllclswXSkgewoKSSBi
ZWxpZXZlIHRoaXMgY2FuIHN0aWxsIGJlIERSTV9GT1JNQVRfTU9EX0lOVkFMSUQsIHdoaWNoICE9
IDAuIFlvdQpwcm9iYWJseSB3YW50IHRvIGV4cGxpY2l0bHkgY2hlY2sgaWYgaXQncyBhbiBBRkJD
IG1vZGlmaWVyLgoKPiArCQljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvOwo+ICsJ
CWludCBicHA7Cj4gKwo+ICsJCWlmICghZHJtX2FmYmNfY2hlY2tfb2Zmc2V0KGRldiwgbW9kZV9j
bWQpKQo+ICsJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiArCj4gKwkJaWYgKCFkcm1fYWZi
Y19nZXRfc3VwZXJibGtfd2gobW9kZV9jbWQtPm1vZGlmaWVyWzBdLAo+ICZ3LCAmaCkpCj4gKwkJ
CXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ICsKPiArCQlpZiAodyAhPSAxNiB8fCBoICE9IDE2
KSB7Cj4gKwkJCURSTV9ERVZfRVJST1IoZGV2LT5kZXYsCj4gKwkJCQkiVW5zdXBwb3J0ZWQgYWZi
YyB0aWxlIHcvaCBbJWQvJWRdXG4iLAo+IHcsIGgpOwoKVGhpcyBjYW4ganVzdCBiZSBhIFdBUk5f
T05DRSgpIG9yIHNvbWV0aGluZywgc2luY2UgaXQgaW5kaWNhdGVzIGFuCmltcG9zc2libGUgY29u
ZGl0aW9uIC0gdGhlIERSTSBjb3JlIHNob3VsZCd2ZSBhbHJlYWR5IHJlamVjdGVkIHRoaXMKbW9k
aWZpZXIgYXMgdW5zdXBwb3J0ZWQuCgo+ICsJCWlmIChtb2RlX2NtZC0+d2lkdGggPiBST0NLQ0hJ
UF9NQVhfQUZCQ19XSURUSCkgewo+ICsJCQlEUk1fREVWX0VSUk9SKGRldi0+ZGV2LAo+ICsJCQkJ
ICAgICAgIlVuc3VwcG9ydGVkIHdpZHRoICVkPiVkXG4iLAo+ICsJCQkJICAgICAgbW9kZV9jbWQt
PndpZHRoLAo+ICsJCQkJICAgICAgUk9DS0NISVBfTUFYX0FGQkNfV0lEVEgKPiArCQkJKTsKClVz
ZXJzcGFjZSBzaG91bGRuJ3QgYmUgYWxsb3dlZCB0byBzcGFtIHRoZSBsb2cgYnkgdHJpZ2dlcmlu
ZyBlcnJvcgptZXNzYWdlczsgcGxlYXNlIG1ha2UgdGhpcyBkZWJ1ZyBpbnN0ZWFkLiBXaGlsc3Qg
eW91J3JlIHRoZXJlLCBhZGRpbmcKbG9ncyB0byB0aGUgb3RoZXIgZXJyb3IgcmV0dXJucyBoZXJl
IG1pZ2h0IGJlIHVzZWZ1bC4KCj4gQEAgLTE2Niw2ICsxNzksNyBAQCBzdHJ1Y3Qgdm9wIHsKPiAg
CS8qIG9wdGlvbmFsIGludGVybmFsIHJnYiBlbmNvZGVyICovCj4gIAlzdHJ1Y3Qgcm9ja2NoaXBf
cmdiICpyZ2I7Cj4gIAo+ICsJc3RydWN0IHZvcF93aW4gKmFmYmNfd2luOwoKSXQgc2VlbXMgbGlr
ZSBldmVyeXdoZXJlIGFmYmNfd2luIGlzIHVzZWQsIGl0J3Mgbm90IGFjdHVhbGx5IHVzZWQgZm9y
CnRoZSB3aW5kb3cgdmFsdWUsIGJ1dCByYXRoZXIganVzdCB1c2VkIGFzIGFuIGlzX2FmYmNfZW5h
YmxlZCBib29sLiBJbgp0aGF0IGNhc2UsIGl0IHdvdWxkIGJlIGJldHRlciBhcyBhIHJlYWwgYm9v
bCwgYW5kIGxpdmluZyBpbiBlaXRoZXIgdGhlCm91dHB1dCBvciBwbGFuZSBzdGF0ZS4KClRoaXMg
d291bGQgZWxpbWluYXRlIHRoZSBuZWVkIHRvIHVuc2V0IHRoZSB2YXJpYWJsZSBhcyB3ZWxsLgoK
UmVsYXRlZGx5LCBjYW4gb25lIFZPUCBzdXBwb3J0IG11bHRpcGxlIHNpbXVsdGFuZW91cyB3aW5k
b3dzIHVzaW5nCkFGQkM/IElmIG5vdCwgdGhlIGNoZWNrIHRoYXQgb25seSBvbmUgd2luZG93IGlz
IHVzaW5nIEFGQkMgaXMgbWlzc2luZwpmcm9tIHRoaXMgcGF0Y2guCgo+ICtzdGF0aWMgaW50IHZv
cF9jb252ZXJ0X2FmYmNfZm9ybWF0KHVpbnQzMl90IGZvcm1hdCkKPiArewo+ICsJc3dpdGNoIChm
b3JtYXQpIHsKPiArCWNhc2UgRFJNX0ZPUk1BVF9YUkdCODg4ODoKPiArCWNhc2UgRFJNX0ZPUk1B
VF9BUkdCODg4ODoKPiArCWNhc2UgRFJNX0ZPUk1BVF9YQkdSODg4ODoKPiArCWNhc2UgRFJNX0ZP
Uk1BVF9BQkdSODg4ODoKPiArCQlyZXR1cm4gQUZCQ19GTVRfVThVOFU4VTg7Cj4gKwljYXNlIERS
TV9GT1JNQVRfUkdCODg4Ogo+ICsJY2FzZSBEUk1fRk9STUFUX0JHUjg4ODoKPiArCQlyZXR1cm4g
QUZCQ19GTVRfVThVOFU4Owo+ICsJY2FzZSBEUk1fRk9STUFUX1JHQjU2NToKPiArCWNhc2UgRFJN
X0ZPUk1BVF9CR1I1NjU6Cj4gKwkJcmV0dXJuIEFGQkNfRk1UX1JHQjU2NTsKPiArCS8qIGVpdGhl
ciBvZiB0aGUgYmVsb3cgc2hvdWxkIG5vdCBiZSByZWFjaGFibGUgKi8KClVucmVhY2hhYmxlIGNh
biBiZSBXQVJOX09OQ0UoKSByYXRoZXIgdGhhbiBhIHNpbGVudCByZXR1cm4uCgpPdGhlciB0aGFu
IHRoYXQsIHRoaXMgaXMgbG9va2luZyBhIF9sb3RfIG5pY2VyIHRoYW4gdjEgdGhvdWdoIQoKQ2hl
ZXJzLApEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
