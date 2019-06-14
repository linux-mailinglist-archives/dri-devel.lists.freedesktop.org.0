Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A74621B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B70289A0E;
	Fri, 14 Jun 2019 15:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F3089A08;
 Fri, 14 Jun 2019 15:08:38 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16904012-1500050 for multiple; Fri, 14 Jun 2019 16:08:35 +0100
MIME-Version: 1.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Tejun Heo <tj@kernel.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190614093914.58f41d8f@gandalf.local.home>
References: <20190614093914.58f41d8f@gandalf.local.home>
Message-ID: <156052491337.7796.17642747687124632554@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [BUG] lockdep splat with kernfs lockdep annotations and slab
 mutex from drm patch??
Date: Fri, 14 Jun 2019 16:08:33 +0100
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTdGV2ZW4gUm9zdGVkdCAoMjAxOS0wNi0xNCAxNDozOToxNCkKPiBJJ20gdHJ5aW5n
IHRvIGRlYnVnIHNvbWUgY29kZSB3aGVyZSBJIG5lZWQgS0FTQU4gYW5kIGxvY2tkZXAgZW5hYmxl
ZAo+IGJ1dCBJIGNhbid0IGdldCBwYXN0IHRoaXMgc3BsYXQgdW5yZWxhdGVkIHRvIG15IGNvZGUu
IEkgYmlzZWN0ZWQgaXQKPiBkb3duIHRvIHRoaXMgY29tbWl0Ogo+IAo+ICAzMmViNmJjZmRkYTlk
YSAoImRybS9pOTE1OiBNYWtlIHJlcXVlc3QgYWxsb2NhdGlvbiBjYWNoZXMgZ2xvYmFsIikKPiAK
PiBUbyBtYWtlIHN1cmUgaXQgd2Fzbid0IGEgYmFkIGJpc2VjdCwgSSByZW1vdmVkIHRoZSBwYXRj
aCBhbmQgdGhlIHNwbGF0Cj4gZ29lcyBhd2F5LiBJIGFkZCB0aGUgcGF0Y2ggYmFjaywgYW5kIHRo
ZSBzcGxhdCByZXR1cm5zLiBJIGRpZCB0aGlzCj4gc2V2ZXJhbCB0aW1lcywgc28gSSBoYXZlIGEg
bGFyZ2UgY29uZmlkZW5jZSB0aGF0IHRoaXMgaXMgdGhlIGNhdXNlIG9mCj4gdGhlIHNwbGF0LCBv
ciBhdCBsZWFzdCBpdCBpcyB0aGUgY29tbWl0IHRoYXQgdHJpZ2dlcnMgd2hhdGV2ZXIgaXMgZ29p
bmcKPiBvbi4KPiAKPiBQZXJoYXBzIGFsbCB0aGUgY2FjaGUgdXBkYXRlcyBjYXVzZWQgdGhlIHNs
YWJfbXV0ZXggdG8gYmUgY2FsbGVkCj4gaW52ZXJzZSBvZiB0aGUga2VybmZzIGxvY2tpbmc/Cj4g
Cj4gQXR0YWNoZWQgaXMgbXkgY29uZmlnLgo+IAo+IEFsc28gbWlnaHQgYmUgaGVscGZ1bCwgdGhl
IHNwbGF0IGhhcHBlbnM6Cj4gCj4gICBrZXJuZnNfZm9wX3dyaXRlKCkKPiAgICAgb3BzLT53cml0
ZSA9PSBzeXNmc19rZl93cml0ZQo+ICAgICAgICBzeXNmc19rZl93cml0ZSgpCj4gICAgICAgICAg
b3BzLT5zdG9yZSA9IHNsYWJfYXR0cl9zdG9yZQoKTW9yZSBpbnRlcmVzdGluZ2x5LAoKc3RhdGlj
IHNzaXplX3Qgc2xhYl9hdHRyX3N0b3JlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhdHRyaWJ1dGUgKmF0dHIsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgbGVuKQp7CiAgICAg
ICAgc3RydWN0IHNsYWJfYXR0cmlidXRlICphdHRyaWJ1dGU7CiAgICAgICAgc3RydWN0IGttZW1f
Y2FjaGUgKnM7CiAgICAgICAgaW50IGVycjsKCiAgICAgICAgYXR0cmlidXRlID0gdG9fc2xhYl9h
dHRyKGF0dHIpOwogICAgICAgIHMgPSB0b19zbGFiKGtvYmopOwoKICAgICAgICBpZiAoIWF0dHJp
YnV0ZS0+c3RvcmUpCiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKCiAgICAgICAgZXJyID0g
YXR0cmlidXRlLT5zdG9yZShzLCBidWYsIGxlbik7CiNpZmRlZiBDT05GSUdfTUVNQ0cKICAgICAg
ICBpZiAoc2xhYl9zdGF0ZSA+PSBGVUxMICYmIGVyciA+PSAwICYmIGlzX3Jvb3RfY2FjaGUocykp
IHsKICAgICAgICAgICAgICAgIHN0cnVjdCBrbWVtX2NhY2hlICpjOwoKICAgICAgICAgICAgICAg
IG11dGV4X2xvY2soJnNsYWJfbXV0ZXgpOwoKc28gaXQgaGFwcGVucyB0byBoaXQgdGhlIGVycm9y
ICsgRlVMTCBjYXNlIHdpdGggdGhlIGFkZGl0aW9uYWwgc2xhYmNhY2hlcz8KCkFueXdheSwgYWNj
b3JkaW5nIHRvIGxvY2tkZXAsIGl0IGlzIGRhbmdlcm91cyB0byB1c2UgdGhlIHNsYWJfbXV0ZXgg
aW5zaWRlCnNsYWJfYXR0cl9zdG9yZSgpLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
