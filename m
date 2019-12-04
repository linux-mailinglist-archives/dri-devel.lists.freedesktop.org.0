Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1F1122E7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 07:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92546E077;
	Wed,  4 Dec 2019 06:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE666E077;
 Wed,  4 Dec 2019 06:31:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 22:31:02 -0800
X-IronPort-AV: E=Sophos;i="5.69,276,1571727600"; d="scan'208";a="205276496"
Received: from huberth-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.252.34.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 22:30:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v3 04/12] video: fbdev: uvesafb: modify the
 static fb_ops directly
In-Reply-To: <20191203170351.GH624164@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com>
 <af63cda5de9fee3acd28e7d264f920338298bc0a.1575390740.git.jani.nikula@intel.com>
 <20191203170351.GH624164@phenom.ffwll.local>
Date: Wed, 04 Dec 2019 08:31:06 +0200
Message-ID: <87muc8haad.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwMyBEZWMgMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90
ZToKPiBPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwNjozODo0NlBNICswMjAwLCBKYW5pIE5pa3Vs
YSB3cm90ZToKPj4gQXZvaWQgbW9kaWZ5aW5nIHRoZSBmYl9vcHMgdmlhIGluZm8tPmZib3BzIHRv
IGxldCB1cyBtYWtlIHRoZSBwb2ludGVyCj4+IGNvbnN0IGluIHRoZSBmdXR1cmUuCj4+IAo+PiBD
YzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy92aWRlby9mYmRl
di91dmVzYWZiLmMgfCA0ICsrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi91
dmVzYWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3V2ZXNhZmIuYwo+PiBpbmRleCA0Mzk1NjVj
YWU3YWIuLjUzZDA4ZDFiNTZmNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi91
dmVzYWZiLmMKPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi91dmVzYWZiLmMKPj4gQEAgLTE0
NDAsNyArMTQ0MCw3IEBAIHN0YXRpYyB2b2lkIHV2ZXNhZmJfaW5pdF9pbmZvKHN0cnVjdCBmYl9p
bmZvICppbmZvLCBzdHJ1Y3QgdmJlX21vZGVfaWIgKm1vZGUpCj4+ICAKPj4gIAkvKiBEaXNhYmxl
IGJsYW5raW5nIGlmIHRoZSB1c2VyIHJlcXVlc3RlZCBzby4gKi8KPj4gIAlpZiAoIWJsYW5rKQo+
PiAtCQlpbmZvLT5mYm9wcy0+ZmJfYmxhbmsgPSBOVUxMOwo+PiArCQl1dmVzYWZiX29wcy5mYl9i
bGFuayA9IE5VTEw7Cj4+ICAKPj4gIAkvKgo+PiAgCSAqIEZpbmQgb3V0IGhvdyBtdWNoIElPIG1l
bW9yeSBpcyByZXF1aXJlZCBmb3IgdGhlIG1vZGUgd2l0aAo+PiBAQCAtMTUxMCw3ICsxNTEwLDcg
QEAgc3RhdGljIHZvaWQgdXZlc2FmYl9pbml0X2luZm8oc3RydWN0IGZiX2luZm8gKmluZm8sIHN0
cnVjdCB2YmVfbW9kZV9pYiAqbW9kZSkKPj4gIAkJCShwYXItPnlwYW4gPyBGQklORk9fSFdBQ0NF
TF9ZUEFOIDogMCk7Cj4+ICAKPj4gIAlpZiAoIXBhci0+eXBhbikKPj4gLQkJaW5mby0+ZmJvcHMt
PmZiX3Bhbl9kaXNwbGF5ID0gTlVMTDsKPj4gKwkJdXZlc2FmYl9vcHMuZmJfcGFuX2Rpc3BsYXkg
PSBOVUxMOwo+PiAgfQo+Cj4gSSByZWFkIGNvZGUuCj4KPiBJIGNyaWVkLgo+Cj4gUmV2aWV3ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4KPiBBbHNvLCB3aXRo
IG1vcmUgcmVhZGluZyBhbmQgbW9yZSBiYWQgZHJlYW1zIEknbGwgZ2V0IGFib3V0IHRoaXMsIEkn
bQo+IHJldmlzaW5nIG15IHRha2Ugb24gcGF0Y2hlcyAxJjIgaW4gdGhpcyBzZXJpZXMuIE9uIHRo
b3NlIGFsc28KPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgo+Cj4gYXMtaXMuCgpUaGFua3MuIEkgZmVlbCB5b3UuCgpBbmQgcmVtZW1iZXIsIGFs
bCBJIGV2ZXIgd2FudGVkIHRvIGRvIHdhcwoKLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIGludGVsZmJf
b3BzID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgaW50ZWxmYl9vcHMgPSB7CgppbiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMuCgoKQlIsCkphbmkuCgoK
Pgo+IENoZWVycywgRGFuaWVsCj4+ICAKPj4gIHN0YXRpYyB2b2lkIHV2ZXNhZmJfaW5pdF9tdHJy
KHN0cnVjdCBmYl9pbmZvICppbmZvKQo+PiAtLSAKPj4gMi4yMC4xCj4+IAo+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBJbnRlbC1nZnggbWFpbGlu
ZyBsaXN0Cj4+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngKCi0tIApKYW5pIE5p
a3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
