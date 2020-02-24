Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C216A7C5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 14:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4A26E4F4;
	Mon, 24 Feb 2020 13:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E039E6E4F4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 13:59:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B4E630E;
 Mon, 24 Feb 2020 05:59:13 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0DB23F534;
 Mon, 24 Feb 2020 05:59:12 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id A1951682F2C; Mon, 24 Feb 2020 13:59:11 +0000 (GMT)
Date: Mon, 24 Feb 2020 13:59:11 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/arm: make hdlcd_debugfs_init return 0
Message-ID: <20200224135911.GJ364558@e110455-lin.cambridge.arm.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <20200218172821.18378-2-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218172821.18378-2-wambui.karugax@gmail.com>
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIEZlYiAxOCwgMjAyMCBhdCAwODoyODoxM1BNICswMzAwLCBXYW1idWkgS2Fy
dWdhIHdyb3RlOgo+IEFzIGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyBzaG91bGQgcmV0dXJuIHZv
aWQsIHJlbW92ZSBpdHMgdXNlIGFzIGEKPiByZXR1cm4gdmFsdWUgaW4gaGRsY2RfZGVidWdmc19p
bml0IGFuZCBoYXZlIHRoZSBsYXR0ZXIgZnVuY3Rpb24gcmV0dXJuIDAKPiBkaXJlY3RseS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBXYW1idWkgS2FydWdhIDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMgfCA2ICsrKystLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9oZGxjZF9kcnYuYwo+IGluZGV4IDJlMDUzODE1YjU0YS4uYmQwYWQ2ZjQ2YTk3IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jCj4gQEAgLTIyNiw4ICsyMjYsMTAgQEAgc3RhdGljIHN0
cnVjdCBkcm1faW5mb19saXN0IGhkbGNkX2RlYnVnZnNfbGlzdFtdID0gewo+ICAKPiAgc3RhdGlj
IGludCBoZGxjZF9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRybV9taW5vciAqbWlub3IpCj4gIHsKPiAt
CXJldHVybiBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoaGRsY2RfZGVidWdmc19saXN0LAo+IC0J
CUFSUkFZX1NJWkUoaGRsY2RfZGVidWdmc19saXN0KSwJbWlub3ItPmRlYnVnZnNfcm9vdCwgbWlu
b3IpOwo+ICsJZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGhkbGNkX2RlYnVnZnNfbGlzdCwKPiAr
CQkJCSBBUlJBWV9TSVpFKGhkbGNkX2RlYnVnZnNfbGlzdCksCj4gKwkJCQkgbWlub3ItPmRlYnVn
ZnNfcm9vdCwgbWlub3IpOwo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAgI2VuZGlmCj4KPiAtLSAKPiAy
LjI1LjAKPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoISBJIGhhZCB0byBnbyBpbnRvIHRoZSBNTCBh
bmQgZmluZCBvdXQgdGhlIHNlcmllcyB3aGVyZSB0aGlzCnBhdGNoIGJlbG9uZ3MgdG8gYW5kIHNl
ZW4gdGhhdCB5b3UgaGF2ZSBhbHJlYWR5IHJlY2VpdmVkIHNvbWUgZmVlZGJhY2ssIGJ1dCBJIHRo
aW5rCmEgc3VtbWFyeSBpcyB3b3J0aDoKCi0geW91IHNob3VsZCBsb29rIGlmIGl0IGlzIHBvc3Np
YmxlIHRvIG1ha2UgLmRlYnVnZnNfaW5pdCBob29rIHJldHVybiB2b2lkLCBpdCB3b3VsZAogIHNp
bXBsaWZ5IHRoZSBjbGVhbnVwIGluIHRoZSBkcml2ZXJzIGJ5IG5vdCBoYXZpbmcgdG8gcmV0dXJu
IDAuCi0geW91IHNob3VsZCBwdXQgaW4gZWFjaCBkcml2ZXIgcGF0Y2ggYSBub3RlIHRoYXQgZHJt
X2RlYnVnZnNfY3JlYXRlX2ZpbGVzKCkgYWx3YXlzCiAgcmV0dXJucyAwIHNpbmNlIDk4N2Q2NWQw
MTM1NiAoZHJtOiBkZWJ1Z2ZzOiBtYWtlIGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcygpIG5ldmVy
IGZhaWwpCiAgc28gdGhhdCBwZW9wbGUgZG9uJ3QgaGF2ZSB0byBodW50IGluIHRoZSBnaXQgaGlz
dG9yeSBmb3IgY2x1ZXMuCi0gTWFrZSBhbGwgdGhlIGNoYW5nZXMgaW50byBhIHNlcmllcwoKV2l0
aCB0aGF0LCB5b3UgY2FuIGhhdmUgbXkgQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRh
dUBhcm0uY29tPgoKQmVzdCByZWdhcmRzLApMaXZpdQoKLS0gCj09PT09PT09PT09PT09PT09PT09
CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5v
dCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0t
LS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
