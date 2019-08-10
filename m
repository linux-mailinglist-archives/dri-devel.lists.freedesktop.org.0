Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB34088AF9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 13:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB59F88CE4;
	Sat, 10 Aug 2019 11:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE6588CE4;
 Sat, 10 Aug 2019 11:14:27 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17952537-1500050 for multiple; Sat, 10 Aug 2019 12:14:22 +0100
MIME-Version: 1.0
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190809222643.23142-28-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
 <20190809222643.23142-28-matthew.auld@intel.com>
Message-ID: <156543565984.2301.1867813749482956139@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v3 27/37] drm/i915: Don't try to place HWS in non-existing
 mappable region
Date: Sat, 10 Aug 2019 12:14:19 +0100
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMTktMDgtMDkgMjM6MjY6MzMpCj4gRnJvbTogTWljaGFs
IFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+Cj4gCj4gSFdTIHBsYWNlbWVu
dCByZXN0cmljdGlvbnMgY2FuJ3QganVzdCByZWx5IG9uIEhBU19MTEMgZmxhZy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4K
PiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX2NzLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfY3Mu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9jcy5jCj4gaW5kZXggNjM0
ZWY0NWI3N2RhLi40NjY1OGVjZDg5NzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfZW5naW5lX2NzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9lbmdpbmVfY3MuYwo+IEBAIC01MTIsNyArNTEyLDcgQEAgc3RhdGljIGludCBwaW5fZ2d0
dF9zdGF0dXNfcGFnZShzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUsCj4gICAgICAgICB1
bnNpZ25lZCBpbnQgZmxhZ3M7Cj4gIAo+ICAgICAgICAgZmxhZ3MgPSBQSU5fR0xPQkFMOwo+IC0g
ICAgICAgaWYgKCFIQVNfTExDKGVuZ2luZS0+aTkxNSkpCj4gKyAgICAgICBpZiAoIUhBU19MTEMo
ZW5naW5lLT5pOTE1KSAmJiBIQVNfTUFQUEFCTEVfQVBFUlRVUkUoZW5naW5lLT5pOTE1KSkKClNo
b3VsZCB3ZSByaXNrIElTX0dFTigpIDw9IDkgaW5zdGVhZD8KCj4gICAgICAgICAgICAgICAgIC8q
Cj4gICAgICAgICAgICAgICAgICAqIE9uIGczMywgd2UgY2Fubm90IHBsYWNlIEhXUyBhYm92ZSAy
NTZNaUIsIHNvCj4gICAgICAgICAgICAgICAgICAqIHJlc3RyaWN0IGl0cyBwaW5uaW5nIHRvIHRo
ZSBsb3cgbWFwcGFibGUgYXJlbmEuCj4gLS0gCj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
