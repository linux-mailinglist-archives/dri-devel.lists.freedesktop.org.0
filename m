Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A08F836C89D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 17:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA656E982;
	Tue, 27 Apr 2021 15:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 613606E981;
 Tue, 27 Apr 2021 15:25:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C10D31B;
 Tue, 27 Apr 2021 08:25:23 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A0C73F73B;
 Tue, 27 Apr 2021 08:25:23 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id C7967682B6E; Tue, 27 Apr 2021 16:25:21 +0100 (BST)
Date: Tue, 27 Apr 2021 16:25:21 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/8] drm/arm: Don't set allow_fb_modifiers explicitly
Message-ID: <YIgs4dY3mBVjXPIz@e110455-lin.cambridge.arm.com>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjcsIDIwMjEgYXQgMTE6MjA6MTFBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBTaW5jZQo+IAo+IGNvbW1pdCA4OTA4ODBkZGZkYmUyNTYwODMxNzA4NjZlNDljODc2
MThiNzA2YWM3Cj4gQXV0aG9yOiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lA
Ym9vdGxpbi5jb20+Cj4gRGF0ZTogICBGcmkgSmFuIDQgMDk6NTY6MTAgMjAxOSArMDEwMAo+IAo+
ICAgICBkcm06IEF1dG8tc2V0IGFsbG93X2ZiX21vZGlmaWVycyB3aGVuIGdpdmVuIG1vZGlmaWVy
cyBhdCBwbGFuZSBpbml0Cj4gCj4gdGhpcyBpcyBkb25lIGF1dG9tYXRpY2FsbHkgYXMgcGFydCBv
ZiBwbGFuZSBpbml0LCBpZiBkcml2ZXJzIHNldCB0aGUKPiBtb2RpZmllciBsaXN0IGNvcnJlY3Rs
eS4gV2hpY2ggaXMgdGhlIGNhc2UgaGVyZSBmb3IgYm90aCBrb21lZGEgYW5kCj4gbWFsaWRwLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
Pgo+IENjOiAiSmFtZXMgKFFpYW4pIFdhbmciIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiBD
YzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVk
YXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IENjOiBNaWhh
aWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gQ2M6IEJyaWFuIFN0YXJr
ZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgfCAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9t
YWxpZHBfZHJ2LmMgICAgICAgICAgICAgICAgfCAxIC0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ttcy5jCj4gaW5kZXggYWVkYTRlNWVjNGY0Li5mZjQ1ZjIzZjNkNTYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+IEBA
IC0yNDcsNyArMjQ3LDYgQEAgc3RhdGljIHZvaWQga29tZWRhX2ttc19tb2RlX2NvbmZpZ19pbml0
KHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAo+ICAJY29uZmlnLT5taW5faGVpZ2h0CT0gMDsK
PiAgCWNvbmZpZy0+bWF4X3dpZHRoCT0gNDA5NjsKPiAgCWNvbmZpZy0+bWF4X2hlaWdodAk9IDQw
OTY7Cj4gLQljb25maWctPmFsbG93X2ZiX21vZGlmaWVycyA9IHRydWU7Cj4gIAo+ICAJY29uZmln
LT5mdW5jcyA9ICZrb21lZGFfbW9kZV9jb25maWdfZnVuY3M7Cj4gIAljb25maWctPmhlbHBlcl9w
cml2YXRlID0gJmtvbWVkYV9tb2RlX2NvbmZpZ19oZWxwZXJzOwo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRw
X2Rydi5jCj4gaW5kZXggZDgzYzczNjZiMzQ4Li5kZTU5ZjMzMDI1MTYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL21hbGlkcF9kcnYuYwo+IEBAIC00MDMsNyArNDAzLDYgQEAgc3RhdGljIGludCBtYWxpZHBf
aW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQo+ICAJZHJtLT5tb2RlX2NvbmZpZy5tYXhfaGVp
Z2h0ID0gaHdkZXYtPm1heF9saW5lX3NpemU7Cj4gIAlkcm0tPm1vZGVfY29uZmlnLmZ1bmNzID0g
Jm1hbGlkcF9tb2RlX2NvbmZpZ19mdW5jczsKPiAgCWRybS0+bW9kZV9jb25maWcuaGVscGVyX3By
aXZhdGUgPSAmbWFsaWRwX21vZGVfY29uZmlnX2hlbHBlcnM7Cj4gLQlkcm0tPm1vZGVfY29uZmln
LmFsbG93X2ZiX21vZGlmaWVycyA9IHRydWU7Cj4gIAo+ICAJcmV0ID0gbWFsaWRwX2NydGNfaW5p
dChkcm0pOwo+ICAJaWYgKHJldCkKPiAtLSAKPiAyLjMxLjAKPiAKCi0tIAo9PT09PT09PT09PT09
PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhl
eSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0t
LS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
