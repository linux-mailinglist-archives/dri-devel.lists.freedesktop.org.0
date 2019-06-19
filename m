Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7444BCDC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 17:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A206E3D6;
	Wed, 19 Jun 2019 15:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16816E3D6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 15:33:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 08:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="181659117"
Received: from mcostacx-wtg.ger.corp.intel.com (HELO localhost)
 ([10.249.47.136])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2019 08:33:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sean Paul <sean@poorly.run>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm: self_refresh: Fix a reversed condition in
 drm_self_refresh_helper_cleanup()
In-Reply-To: <20190619150339.GF25413@art_vandelay>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190619100141.GA28596@mwanda>
 <20190619150339.GF25413@art_vandelay>
Date: Wed, 19 Jun 2019 18:34:56 +0300
Message-ID: <877e9hlhb3.fsf@intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBKdW4gMjAxOSwgU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+IHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDAxOjAxOjQxUE0gKzAzMDAsIERhbiBDYXJwZW50ZXIg
d3JvdGU6Cj4+IFRoaXMgdGVzdCBpcyBmbGlwcGVkIGFyb3VuZCBzbyBpdCBlaXRoZXIgbGVhZHMg
dG8gYSBtZW1vcnkgbGVhayBvciBhCj4+IE5VTEwgZGVyZWZlcmVuY2UuCj4+IAo+PiBGaXhlczog
MTQ1MmMyNWIwZTYwICgiZHJtOiBBZGQgaGVscGVycyB0byBraWNrIG9mZiBzZWxmIHJlZnJlc2gg
bW9kZSBpbiBkcml2ZXJzIikKPj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNh
cnBlbnRlckBvcmFjbGUuY29tPgo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2ggYW5kIHlvdXIgYnVn
IHJlcG9ydCEgSSd2ZSBhcHBsaWVkIHRoaXMgdG8gLW1pc2MtbmV4dCBhbmQKPiB3aWxsIGRpZyBp
bnRvIHRoZSBidWcgcmVwb3J0IHNob3J0bHkuCj4KPj4gLS0tCj4+IEknbSBub3QgdG90YWxseSBz
dXJlIHdoYXQgdGhlIHByZWZlcmVkIHBhdGNoIHByZWZpeCBmb3IgdGhpcyBjb2RlLiAgT25lCj4+
IHRoaW5nIHRoYXQgd291bGQgaGVscCBpcyB3aGVuIHdlJ3JlIGFkZGluZyBuZXcgZmlsZXMgd2Ug
c2hvdWxkIHNwZWNpZnkKPj4gdGhlIHByZWZpeCB0aGF0IHRoZXkncmUgZ29pbmcgdG8gdXNlOgo+
PiAKPj4gLSBkcm06IEFkZCBoZWxwZXJzIHRvIGtpY2sgb2ZmIHNlbGYgcmVmcmVzaCBtb2RlIGlu
IGRyaXZlcnMKPj4gKyBkcm06IHJlZnJlc2ggbW9kZTogQWRkIGhlbHBlcnMgdG8ga2ljayBvZmYg
c2VsZiByZWZyZXNoIG1vZGUgaW4gZHJpdmVycwo+PiAKPj4gSXQncyBhIHNtYWxsIHRoaW5nIGFu
ZCBlbWFpbCBhbHdheXMgc291bmRzIHdoaW55IGJ1dCBJJ20gc2VuZGluZyB0aGlzCj4+IHN1Z2dl
c3Rpb24gdG8gZXZlcnlvbmUgdG9kYXkgc28uLi4KPgo+IFRoZXJlJ3Mgbm8gaGFyZCBydWxlLiBG
b3IgZHJpdmVycyB3ZSB1c2UgZHJtLzxkcml2ZXI+LCBhbmQgZm9yIGNvcmUgcGVvcGxlCj4gdXNl
IGRybSBvciBkcm0vPGZpbGU+LgoKY2hlY2twYXRjaC5wbCBzaG91bGQgaGF2ZSBhIGdpdCBsb2cg
cG9wdWxhcml0eSBjb250ZXN0IGJhc2VkIGNoZWNrIGZvcgp0aGUgcHJlZml4LiBGb3IgbmV3IGZp
bGVzLCBmaXJzdCBjb21lIGZpcnN0IHNlcnZlZC4gOykKCkJSLApKYW5pLgoKCj4KPj4gCj4+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYyB8IDIgKy0KPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hlbHBlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmMKPj4gaW5kZXggMmIzZGFhZjc3ODQxLi5l
MGQyYWQxZjA3MGMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZy
ZXNoX2hlbHBlci5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hl
bHBlci5jCj4+IEBAIC0yMDUsNyArMjA1LDcgQEAgdm9pZCBkcm1fc2VsZl9yZWZyZXNoX2hlbHBl
cl9jbGVhbnVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPj4gIAlzdHJ1Y3QgZHJtX3NlbGZfcmVm
cmVzaF9kYXRhICpzcl9kYXRhID0gY3J0Yy0+c2VsZl9yZWZyZXNoX2RhdGE7Cj4+ICAKPj4gIAkv
KiBIZWxwZXIgaXMgYWxyZWFkeSB1bmluaXRpYWxpemVkICovCj4+IC0JaWYgKHNyX2RhdGEpCj4+
ICsJaWYgKCFzcl9kYXRhKQo+PiAgCQlyZXR1cm47Cj4+ICAKPj4gIAljcnRjLT5zZWxmX3JlZnJl
c2hfZGF0YSA9IE5VTEw7Cj4+IC0tIAo+PiAyLjIwLjEKPj4gCj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkphbmkgTmlrdWxhLCBJ
bnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
