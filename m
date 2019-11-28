Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3522410C9E9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 14:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493236E384;
	Thu, 28 Nov 2019 13:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FEC6E384;
 Thu, 28 Nov 2019 13:55:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 05:55:13 -0800
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="203440669"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 05:55:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/dsc: Return unsigned long on compute offset
In-Reply-To: <20191122184625.20151-1-mikita.lipski@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191122184625.20151-1-mikita.lipski@amd.com>
Date: Thu, 28 Nov 2019 15:55:06 +0200
Message-ID: <87d0dcm7gl.fsf@intel.com>
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMiBOb3YgMjAxOSwgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4gd3JvdGU6Cj4gRnJv
bTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgo+Cj4gV2Ugc2hvdWxkbid0
IGNvbXBhcmUgaW50IHdpdGggdW5zaWduZWQgbG9uZyB0byBmaW5kIHRoZSBtYXggdmFsdWUKPiBh
bmQgc2luY2Ugd2UgYXJlIG5vdCBleHBlY3RpbmcgbmVnYXRpdmUgdmFsdWUgcmV0dXJuZWQgZnJv
bQo+IGNvbXB1dGVfb2Zmc2V0IHdlIHNob3VsZCBtYWtlIHRoaXMgZnVuY3Rpb24gcmV0dXJuIHVu
c2lnbmVkIGxvbmcKPiBzbyB3ZSBjYW4gY29tcGFyZSB0aGUgdmFsdWVzIHdoZW4gY29tcHV0aW5n
IHJjIHBhcmFtZXRlcnMuCj4KPiB2MjogTW9kaWZpZWQgZnVuY3Rpb24gcGFyYW1ldGVycyB0byB1
bnNpZ25lZCB0eXBlIGZvciB0eXBlCj4gY29uc2lzdGVuY3kKCkkgZG9uJ3QgdGhpbmsgdGhhdCBy
ZWFsbHkgYWRkcmVzc2VzIHRoZSByZXZpZXcuCgpCdXQgYWxsIHRoZSBzYW1lLCBjdXJyZW50IGRy
bS10aXAgZG9lcyBub3QgaGF2ZSBhIGNvbXB1dGVfb2Zmc2V0KCkKZnVuY3Rpb24sIGFuZCB0aGUg
b25seSByZWZlcmVuY2UgdG8gaXQgaW4gbXkgZW1haWwgYXJlIHlvdXIgcGF0Y2hlcywgc28KdGhp
cyBpcyBjb21wbGV0ZWx5IHVuYWN0aW9uYWJsZSBhbnl3YXkuCgpJbiBhbnkgY2FzZSBJIHRoaW5r
IHRoZSByb290IGNhdXNlIGZvciB5b3VyIGlzc3VlcyBpcyB0aGUgdW5mb3VuZGVkIHVzZQpvZiB1
bnNpZ25lZCBsb25ncyBpbiBkcm1fZHNjX2NvbXB1dGVfcmNfcGFyYW1ldGVycygpLiBGaXggdGhh
dCBhbmQgbWFueQpvZiB5b3VyIHByb2JsZW1zIGdvIGF3YXkuCgpCUiwKSmFuaS4KCj4KPiBDYzog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogTmlr
b2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8
aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxt
aWtpdGEubGlwc2tpQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMg
fCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHNjLmMKPiBpbmRleCA3NGYzNTI3ZjU2N2QuLmNjY2UwMjk3ZGE2NCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kc2MuYwo+IEBAIC0yNDUsMTEgKzI0NSwxMSBAQCB2b2lkIGRybV9kc2NfcHBz
X3BheWxvYWRfcGFjayhzdHJ1Y3QgZHJtX2RzY19waWN0dXJlX3BhcmFtZXRlcl9zZXQgKnBwc19w
YXlsb2FkLAo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX2RzY19wcHNfcGF5bG9hZF9wYWNrKTsK
PiAgCj4gLXN0YXRpYyBpbnQgY29tcHV0ZV9vZmZzZXQoc3RydWN0IGRybV9kc2NfY29uZmlnICp2
ZHNjX2NmZywgaW50IHBpeGVsc19wZXJfZ3JvdXAsCj4gLQkJCQlpbnQgZ3JvdXBzX3Blcl9saW5l
LCBpbnQgZ3JwY250KQo+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBjb21wdXRlX29mZnNldChzdHJ1
Y3QgZHJtX2RzY19jb25maWcgKnZkc2NfY2ZnLCB1bnNpZ25lZCBpbnQgcGl4ZWxzX3Blcl9ncm91
cCwKPiArCQkJCXVuc2lnbmVkIGxvbmcgZ3JvdXBzX3Blcl9saW5lLCB1bnNpZ25lZCBsb25nIGdy
cGNudCkKPiAgewo+IC0JaW50IG9mZnNldCA9IDA7Cj4gLQlpbnQgZ3JwY250X2lkID0gRElWX1JP
VU5EX1VQKHZkc2NfY2ZnLT5pbml0aWFsX3htaXRfZGVsYXksIHBpeGVsc19wZXJfZ3JvdXApOwo+
ICsJdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAwOwo+ICsJdW5zaWduZWQgbG9uZyBncnBjbnRfaWQg
PSBESVZfUk9VTkRfVVAodmRzY19jZmctPmluaXRpYWxfeG1pdF9kZWxheSwgcGl4ZWxzX3Blcl9n
cm91cCk7Cj4gIAo+ICAJaWYgKGdycGNudCA8PSBncnBjbnRfaWQpCj4gIAkJb2Zmc2V0ID0gRElW
X1JPVU5EX1VQKGdycGNudCAqIHBpeGVsc19wZXJfZ3JvdXAgKiB2ZHNjX2NmZy0+Yml0c19wZXJf
cGl4ZWwsIDE2KTsKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3Mg
Q2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
