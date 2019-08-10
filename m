Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4988AFF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 13:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95B76E2F2;
	Sat, 10 Aug 2019 11:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2667D6E2F2;
 Sat, 10 Aug 2019 11:15:13 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17952548-1500050 for multiple; Sat, 10 Aug 2019 12:15:11 +0100
MIME-Version: 1.0
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190809222643.23142-29-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
 <20190809222643.23142-29-matthew.auld@intel.com>
Message-ID: <156543570864.2301.17600622353015379100@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v3 28/37] drm/i915: check for missing aperture in
 insert_mappable_node
Date: Sat, 10 Aug 2019 12:15:08 +0100
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMTktMDgtMDkgMjM6MjY6MzQpCj4gRnJvbTogQ1EgVGFu
ZyA8Y3EudGFuZ0BpbnRlbC5jb20+Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ1EgVGFuZyA8Y3EudGFu
Z0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRA
aW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jIHwgMyAr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9nZW0uYwo+IGluZGV4IDJhYTRmYmU3ZWRjMC4uYWY2M2QxYTBhZjE0IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2dlbS5jCj4gQEAgLTY0LDYgKzY0LDkgQEAgc3RhdGljIGludAo+ICBpbnNlcnRf
bWFwcGFibGVfbm9kZShzdHJ1Y3QgaTkxNV9nZ3R0ICpnZ3R0LAo+ICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUsIHUzMiBzaXplKQo+ICB7Cj4gKyAgICAgICBp
ZiAoIWdndHQtPm1hcHBhYmxlX2VuZCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9TUEM7
CgpIb3cgZGlkIHlvdSBnZXQgaGVyZT8gVGhpcyBzaG91bGQgcmVtYWluIHRoZSBCVUcgZm9yIHRo
ZSBwcm9ncmFtbWluZwplcnJvci4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
