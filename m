Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C682339
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A803B89D53;
	Mon,  5 Aug 2019 16:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1A289C2C;
 Mon,  5 Aug 2019 16:54:28 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17895348-1500050 for multiple; Mon, 05 Aug 2019 17:54:21 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20190805154554.3476-1-christian.koenig@amd.com>
 <156502073694.28464.1595909334726483969@skylake-alporthouse-com>
In-Reply-To: <156502073694.28464.1595909334726483969@skylake-alporthouse-com>
Message-ID: <156502405985.28464.7514823669359337891@skylake-alporthouse-com>
Subject: Re: [PATCH 1/5] drm/i915: stop pruning reservation object after wait
Date: Mon, 05 Aug 2019 17:54:19 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDgtMDUgMTY6NTg6NTYpCj4gUXVvdGluZyBDaHJp
c3RpYW4gS8O2bmlnICgyMDE5LTA4LTA1IDE2OjQ1OjUwKQo+ID4gVGhlIHJlc2VydmF0aW9uIG9i
amVjdCBzaG91bGQgYmUgY2FwYWJsZSBvZiBoYW5kbGluZyBpdHMgaW50ZXJuYWwgbWVtb3J5Cj4g
PiBtYW5hZ2VtZW50IGl0c2VsZi4gQW5kIHNpbmNlIHdlIHNlYXJjaCBmb3IgYSBmcmVlIHNsb3Qg
dG8gYWRkIHRoZSBmZW5jZQo+ID4gZnJvbSB0aGUgYmVnaW5uaW5nIHRoaXMgaXMgYWN0dWFsbHkg
YSB3YXN0ZSBvZiB0aW1lIGFuZCBvbmx5IG1pbmltYWwgaGVscGZ1bC4KPiAKPiAiRnJvbSB0aGUg
YmVnaW5uaW5nPyIgQXR0ZW1wdGluZyB0byBwcnVuZSBzaWduYWxlZCBmZW5jZXMgb24gaW5zZXJ0
aW9uIGlzCj4gcXVpdGUgcmVjZW50Lgo+IAo+IEhvd2V2ZXIsIHRoYXQgZG9lc24ndCBoZWxwIHRo
ZSBjYXNlcyB3aGVyZSByZXNlcnZhdGlvbl9vYmplY3Qga2VlcHMgb24KPiBob2xkaW5nIGEgcmVm
ZXJlbmNlIHRvIHRoZSBmZW5jZXMgZm9yIGlkbGUgb2JqZWN0cy4gSXQncyBhbiBhYnNvbHV0ZQo+
IG5pZ2h0bWFyZSBvZiBhIHJlZmVyZW5jZSB0cmFwLgoKRndpdywgaXQncyBhIHBldCBwZWV2ZSwg
YW5kIG5vdCBhIGZ1bmRhbWVudGFsIG9iamVjdCB0byByZW1vdmluZyBzb21lCmxvb3BzIGluc2lk
ZSByZXNlcnZhdGlvbl9vYmplY3QuIEhlcmUsIHRoZSBzZXFubyBpcyBiZWluZyB1c2VkIGFzIGEK
Z3VpZGUgdG8gYXZvaWQgdHJ5aW5nIHRvIHRha2UgdGhlIGxvY2sgaWYgaXQncyBiZWVuIGV4dGVy
bmFsbHkgbW9kaWZpZWQsCmJ1dCBpdCB3b3VsZCBlcXVhbGx5IHdvcmsgd2l0aCBqdXN0IGEgcGxh
aW4gdHJ5bG9jayArIHRlc3RfcmN1LgoKQmV0dGVyIHlldCB3b3VsZCBiZSBhdXRvcHJ1bmluZywg
YnV0IHRoYXQgc3VnZ2VzdHMgYSBzbGlnaHRseSBkaWZmZXJlbnQKZGF0YSBzdHJ1Y3R1cmUgYW4g
cmJ0cmVlIGluc3RlYWQgb2YgYW4gYXJyYXkgYW5kIHNwaW5sb2NrZWQgY2JfbGlzdAptYW5pcHVs
YXRpb24gaW5zdGVhZCBvZiBhIHBsYWluIHJlZmNvdW50LgotQ2hyaXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
