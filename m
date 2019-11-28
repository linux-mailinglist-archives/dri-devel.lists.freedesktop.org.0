Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0010C859
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 13:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A64C6E041;
	Thu, 28 Nov 2019 12:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC4A6E041;
 Thu, 28 Nov 2019 12:05:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 04:05:27 -0800
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="203417398"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 04:05:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 02/13] drm/fb-helper: don't preserve fb_ops
 across deferred IO use
In-Reply-To: <f8292d00-5d62-cd3c-9d17-37a3feebd74b@tronnes.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1574871797.git.jani.nikula@intel.com>
 <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
 <f8292d00-5d62-cd3c-9d17-37a3feebd74b@tronnes.org>
Date: Thu, 28 Nov 2019 14:05:22 +0200
Message-ID: <87lfs0mcjh.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyOCBOb3YgMjAxOSwgTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+
IHdyb3RlOgo+IERlbiAyNy4xMS4yMDE5IDE3LjMxLCBza3JldiBKYW5pIE5pa3VsYToKPj4gRGVm
ZXJyZWQgSU8gbm93IHByZXNlcnZlcyB0aGUgZmJfb3BzLgo+PiAKPj4gQ2M6IE5vcmFsZiBUcsO4
bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwu
Y29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCAxOCArKy0t
LS0tLS0tLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVs
cGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4+IGluZGV4IDBjMDg4ZWE3
MGFkMC4uYTVhMmE1MzhkMDg1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPj4gQEAg
LTE5NTQsNyArMTk1NCw2IEBAIHN0YXRpYyBpbnQgZHJtX2ZiZGV2X2ZiX3JlbGVhc2Uoc3RydWN0
IGZiX2luZm8gKmluZm8sIGludCB1c2VyKQo+PiAgc3RhdGljIHZvaWQgZHJtX2ZiZGV2X2NsZWFu
dXAoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikKPj4gIHsKPj4gIAlzdHJ1Y3QgZmJf
aW5mbyAqZmJpID0gZmJfaGVscGVyLT5mYmRldjsKPj4gLQlzdHJ1Y3QgZmJfb3BzICpmYm9wcyA9
IE5VTEw7Cj4+ICAJdm9pZCAqc2hhZG93ID0gTlVMTDsKPj4gIAo+PiAgCWlmICghZmJfaGVscGVy
LT5kZXYpCj4+IEBAIC0xOTYzLDE1ICsxOTYyLDExIEBAIHN0YXRpYyB2b2lkIGRybV9mYmRldl9j
bGVhbnVwKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpCj4+ICAJaWYgKGZiaSAmJiBm
YmktPmZiZGVmaW8pIHsKPj4gIAkJZmJfZGVmZXJyZWRfaW9fY2xlYW51cChmYmkpOwo+PiAgCQlz
aGFkb3cgPSBmYmktPnNjcmVlbl9idWZmZXI7Cj4+IC0JCWZib3BzID0gZmJpLT5mYm9wczsKPj4g
IAl9Cj4+ICAKPj4gIAlkcm1fZmJfaGVscGVyX2ZpbmkoZmJfaGVscGVyKTsKPj4gIAo+PiAtCWlm
IChzaGFkb3cpIHsKPj4gLQkJdmZyZWUoc2hhZG93KTsKPj4gLQkJa2ZyZWUoZmJvcHMpOwo+PiAt
CX0KPj4gKwl2ZnJlZShzaGFkb3cpOwo+PiAgCj4+ICAJZHJtX2NsaWVudF9mcmFtZWJ1ZmZlcl9k
ZWxldGUoZmJfaGVscGVyLT5idWZmZXIpOwo+PiAgfQo+PiBAQCAtMjA2MiwyMyArMjA1NywxNCBA
QCBzdGF0aWMgaW50IGRybV9mYl9oZWxwZXJfZ2VuZXJpY19wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hl
bHBlciAqZmJfaGVscGVyLAo+PiAgCWRybV9mYl9oZWxwZXJfZmlsbF9pbmZvKGZiaSwgZmJfaGVs
cGVyLCBzaXplcyk7Cj4+ICAKPj4gIAlpZiAoZHJtX2ZiZGV2X3VzZV9zaGFkb3dfZmIoZmJfaGVs
cGVyKSkgewo+PiAtCQlzdHJ1Y3QgZmJfb3BzICpmYm9wczsKPj4gIAkJdm9pZCAqc2hhZG93Owo+
PiAgCj4+IC0JCS8qCj4+IC0JCSAqIGZiX2RlZmVycmVkX2lvX2NsZWFudXAoKSBjbGVhcnMgJmZi
b3BzLT5mYl9tbWFwIHNvIGEgcGVyCj4+IC0JCSAqIGluc3RhbmNlIHZlcnNpb24gaXMgbmVjZXNz
YXJ5Lgo+PiAtCQkgKi8KPj4gLQkJZmJvcHMgPSBremFsbG9jKHNpemVvZigqZmJvcHMpLCBHRlBf
S0VSTkVMKTsKPj4gIAkJc2hhZG93ID0gdnphbGxvYyhmYmktPnNjcmVlbl9zaXplKTsKPj4gLQkJ
aWYgKCFmYm9wcyB8fCAhc2hhZG93KSB7Cj4+IC0JCQlrZnJlZShmYm9wcyk7Cj4+ICsJCWlmICgh
c2hhZG93KSB7Cj4+ICAJCQl2ZnJlZShzaGFkb3cpOwo+Cj4gVGhpcyB2ZnJlZSBjYW4gaXMgYSBu
by1vcCBub3cgYW5kIGNhbiBiZSBkcm9wcGVkLiBXaXRoIHRoYXQ6CgpEJ29oIQoKV2l0aCB0aGF0
IEkgdGhpbmsgSSdkIGFsc28gZHJvcCB0aGUgc2hhZG93IGxvY2FsIHZhcmlhYmxlIGFuZCBhc3Np
Z24gdG8KZmJpLT5zY3JlZW5fYnVmZmVyIGRpcmVjdGx5LiBGaW5lIHdpdGggdGhhdD8KClRoYW5r
cy4KCkJSLApKYW5pLgoKPgo+IFJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4KPgo+PiAgCQkJcmV0dXJuIC1FTk9NRU07Cj4+ICAJCX0KPj4gIAo+PiAtCQkq
ZmJvcHMgPSAqZmJpLT5mYm9wczsKPj4gLQkJZmJpLT5mYm9wcyA9IGZib3BzOwo+PiAgCQlmYmkt
PnNjcmVlbl9idWZmZXIgPSBzaGFkb3c7Cj4+ICAJCWZiaS0+ZmJkZWZpbyA9ICZkcm1fZmJkZXZf
ZGVmaW87Cj4+ICAKPj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBJbnRlbC1nZnggbWFpbGluZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ2Z4CgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNz
IENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
