Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECEA2AD236
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 10:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0657898AF;
	Tue, 10 Nov 2020 09:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354AC898E8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 09:17:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E22B1AC24;
 Tue, 10 Nov 2020 09:17:44 +0000 (UTC)
Subject: Re: [PATCH] drm/fb_helper: Use min_t() to handle size_t and unsigned
 long
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
References: <20201110090119.2667326-1-geert+renesas@glider.be>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cab52bc4-c058-50d0-8048-c67a1ed0da73@suse.de>
Date: Tue, 10 Nov 2020 10:17:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110090119.2667326-1-geert+renesas@glider.be>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDEwLjExLjIwIHVtIDEwOjAxIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOgo+IE9u
IGFybTMyOgo+IAo+ICAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jOiBJbiBmdW5j
dGlvbiDigJhmYl9yZWFkX3NjcmVlbl9iYXNl4oCZOgo+ICAgICBpbmNsdWRlL2xpbnV4L21pbm1h
eC5oOjE4OjI4OiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIGRpc3RpbmN0IHBvaW50ZXIgdHlwZXMg
bGFja3MgYSBjYXN0Cj4gICAgIC4uLgo+ICAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jOjIwNDE6MjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhtaW7igJkKPiAgICAg
IDIwNDEgfCAgc2l6ZV90IGFsbG9jX3NpemUgPSBtaW4oY291bnQsIFBBR0VfU0laRSk7Cj4gCSAg
fCAgICAgICAgICAgICAgICAgICAgICBefn4KPiAgICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9o
ZWxwZXIuYzogSW4gZnVuY3Rpb24g4oCYZmJfd3JpdGVfc2NyZWVuX2Jhc2XigJk6Cj4gICAgIGlu
Y2x1ZGUvbGludXgvbWlubWF4Lmg6MTg6Mjg6IHdhcm5pbmc6IGNvbXBhcmlzb24gb2YgZGlzdGlu
Y3QgcG9pbnRlciB0eXBlcyBsYWNrcyBhIGNhc3QKPiAgICAgLi4uCj4gICAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZmJfaGVscGVyLmM6MjExNToyMjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmG1pbuKAmQo+ICAgICAgMjExNSB8ICBzaXplX3QgYWxsb2Nfc2l6ZSA9IG1pbihjb3VudCwg
UEFHRV9TSVpFKTsKPiAJICB8ICAgICAgICAgICAgICAgICAgICAgIF5+fgo+IAo+IEluZGVlZCwg
b24gMzItYml0IHNpemVfdCBpcyAidW5zaWduZWQgaW50Iiwgbm90ICJ1bnNpZ25lZCBsb25nIi4K
PiAKPiBGaXhlczogMjIyZWM0NWY0YzY5ZGZhOCAoImRybS9mYl9oZWxwZXI6IFN1cHBvcnQgZnJh
bWVidWZmZXJzIGluIEkvTyBtZW1vcnkiKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CgpUaGFua3MgYSBsb3QuIEknbGwgYWRkIHRoZSBw
YXRjaCB0byBkcm0tbWlzYy1uZXh0LgoKPiAtLS0KPiBJbnRlcmVzdGluZ2x5LCB0aGUgY29tbWl0
IGxvZyBjbGFpbXMgdjcgY2hhbmdlZDoKPiAKPiAgICAgdXNlIG1pbl90KHNpemVfdCwpIChrZXJu
ZWwgdGVzdCByb2JvdCkKCkl0IGdvdCBmaXhlZCBpbiB0aGUgZnVuY3Rpb25zJyBpbm5lciBsb29w
cywgYnV0IEkgbWlzc2VkIHRoZSBvdGhlcgppbnN0YW5jZXMuCgpCZXN0IHJlZ2FyZHMKVGhvbWFz
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgNCArKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiX2hlbHBlci5jCj4gaW5kZXggMDFiYTFkYTI4NTExNjM3My4uMjVlZGY2NzA4NjdjNmY3
OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+IEBAIC0yMDM4LDcgKzIwMzgsNyBAQCBz
dGF0aWMgc3NpemVfdCBmYl9yZWFkX3NjcmVlbl9iYXNlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBj
aGFyIF9fdXNlciAqYnVmLCBzaXplXwo+ICAJCQkJICAgbG9mZl90IHBvcykKPiAgewo+ICAJY29u
c3QgY2hhciBfX2lvbWVtICpzcmMgPSBpbmZvLT5zY3JlZW5fYmFzZSArIHBvczsKPiAtCXNpemVf
dCBhbGxvY19zaXplID0gbWluKGNvdW50LCBQQUdFX1NJWkUpOwo+ICsJc2l6ZV90IGFsbG9jX3Np
emUgPSBtaW5fdChzaXplX3QsIGNvdW50LCBQQUdFX1NJWkUpOwo+ICAJc3NpemVfdCByZXQgPSAw
Owo+ICAJaW50IGVyciA9IDA7Cj4gIAljaGFyICp0bXA7Cj4gQEAgLTIxMTIsNyArMjExMiw3IEBA
IHN0YXRpYyBzc2l6ZV90IGZiX3dyaXRlX3NjcmVlbl9iYXNlKHN0cnVjdCBmYl9pbmZvICppbmZv
LCBjb25zdCBjaGFyIF9fdXNlciAqYnVmCj4gIAkJCQkgICAgbG9mZl90IHBvcykKPiAgewo+ICAJ
Y2hhciBfX2lvbWVtICpkc3QgPSBpbmZvLT5zY3JlZW5fYmFzZSArIHBvczsKPiAtCXNpemVfdCBh
bGxvY19zaXplID0gbWluKGNvdW50LCBQQUdFX1NJWkUpOwo+ICsJc2l6ZV90IGFsbG9jX3NpemUg
PSBtaW5fdChzaXplX3QsIGNvdW50LCBQQUdFX1NJWkUpOwo+ICAJc3NpemVfdCByZXQgPSAwOwo+
ICAJaW50IGVyciA9IDA7Cj4gIAl1OCAqdG1wOwo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
