Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E38180219
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 16:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8676E332;
	Tue, 10 Mar 2020 15:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7DA636E332
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 15:43:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBB4B1FB;
 Tue, 10 Mar 2020 08:43:29 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7A353F534;
 Tue, 10 Mar 2020 08:43:29 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 5585B682F35; Tue, 10 Mar 2020 15:43:28 +0000 (GMT)
Date: Tue, 10 Mar 2020 15:43:28 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH v2 06/17] drm/arm: make hdlcd_debugfs_init() return 0
Message-ID: <20200310154328.GO364558@e110455-lin.cambridge.arm.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-7-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310133121.27913-7-wambui.karugax@gmail.com>
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

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMDQ6MzE6MTBQTSArMDMwMCwgV2FtYnVpIEthcnVnYSB3
cm90ZToKPiBTaW5jZSBjb21taXQgOTg3ZDY1ZDAxMzU2IChkcm06IGRlYnVnZnM6IG1ha2UKPiBk
cm1fZGVidWdmc19jcmVhdGVfZmlsZXMoKSBuZXZlciBmYWlsKSwgZHJtX2RlYnVnZnNfY3JlYXRl
X2ZpbGVzKCkgbmV2ZXIKPiBmYWlscyBhbmQgc2hvdWxkIHJldHVybiB2b2lkLiBUaGVyZWZvcmUs
IHJlbW92ZSBpdHMgdXNlIGFzIHRoZQo+IHJldHVybiB2YWx1ZSBvZiBoZGxjZF9kZWJ1Z2ZzX2lu
aXQoKSBhbmQgaGF2ZSB0aGUgbGF0dGVyIGZ1bmN0aW9uIHJldHVybgo+IDAgZGlyZWN0bHkuCj4g
Cj4gdjI6IG1ha2UgaGRsY2RfZGVidWdmc19pbml0KCkgcmV0dXJuIDAgaW5zdGVhZCBvZiB2b2lk
IHRvIGVuc3VyZSB0aGF0Cj4gZWFjaCBwYXRjaCBjb21waWxlcyBpbmRpdmlkdWFsbHkuCj4gCj4g
UmVmZXJlbmNlczogaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRl
dmVsLzIwMjAtRmVicnVhcnkvMjU3MTgzLmh0bWwKPiBTaWduZWQtb2ZmLWJ5OiBXYW1idWkgS2Fy
dWdhIDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxp
dml1LmR1ZGF1QGFybS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9oZGxjZF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMK
PiBpbmRleCAyZTA1MzgxNWI1NGEuLmJkMGFkNmY0NmE5NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxj
ZF9kcnYuYwo+IEBAIC0yMjYsOCArMjI2LDEwIEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2luZm9fbGlz
dCBoZGxjZF9kZWJ1Z2ZzX2xpc3RbXSA9IHsKPiAgCj4gIHN0YXRpYyBpbnQgaGRsY2RfZGVidWdm
c19pbml0KHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQo+ICB7Cj4gLQlyZXR1cm4gZHJtX2RlYnVn
ZnNfY3JlYXRlX2ZpbGVzKGhkbGNkX2RlYnVnZnNfbGlzdCwKPiAtCQlBUlJBWV9TSVpFKGhkbGNk
X2RlYnVnZnNfbGlzdCksCW1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsIG1pbm9yKTsKPiArCWRybV9kZWJ1
Z2ZzX2NyZWF0ZV9maWxlcyhoZGxjZF9kZWJ1Z2ZzX2xpc3QsCj4gKwkJCQkgQVJSQVlfU0laRSho
ZGxjZF9kZWJ1Z2ZzX2xpc3QpLAo+ICsJCQkJIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsIG1pbm9yKTsK
PiArCXJldHVybiAwOwo+ICB9Cj4gICNlbmRpZgo+ICAKPiAtLSAKPiAyLjI1LjEKPiAKCi0tIAo9
PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwg
IHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2Rl
ISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
