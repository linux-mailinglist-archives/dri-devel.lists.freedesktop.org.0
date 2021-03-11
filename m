Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74714337963
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE8A6EE69;
	Thu, 11 Mar 2021 16:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3246EE60;
 Thu, 11 Mar 2021 16:31:20 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 24078142-1500050 for multiple; Thu, 11 Mar 2021 16:31:13 +0000
MIME-Version: 1.0
In-Reply-To: <20210311114432.GB101473@zkempczy-mobl2>
References: <20210310212606.766121-1-jason@jlekstrand.net>
 <20210310215007.782649-1-jason@jlekstrand.net>
 <20210311114432.GB101473@zkempczy-mobl2>
Subject: Re: [PATCH] i915: Drop relocation support on all new hardware (v3)
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Jason Ekstrand <jason@jlekstrand.net>, Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Date: Thu, 11 Mar 2021 16:31:11 +0000
Message-ID: <161548027193.13836.14203592427794395157@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjEtMDMtMTEgMTE6NDQ6MzIpCj4gT24g
V2VkLCBNYXIgMTAsIDIwMjEgYXQgMDM6NTA6MDdQTSAtMDYwMCwgSmFzb24gRWtzdHJhbmQgd3Jv
dGU6Cj4gPiBUaGUgVnVsa2FuIGRyaXZlciBpbiBNZXNhIGZvciBJbnRlbCBoYXJkd2FyZSBuZXZl
ciB1c2VzIHJlbG9jYXRpb25zIGlmCj4gPiBpdCdzIHJ1bm5pbmcgb24gYSB2ZXJzaW9uIG9mIGk5
MTUgdGhhdCBzdXBwb3J0cyBhdCBsZWFzdCBzb2Z0cGluIHdoaWNoCj4gPiBhbGwgdmVyc2lvbnMg
b2YgaTkxNSBzdXBwb3J0aW5nIEdlbjEyIGRvLiAgT24gdGhlIE9wZW5HTCBzaWRlLCBHZW4xMisg
aXMKPiA+IG9ubHkgc3VwcG9ydGVkIGJ5IGlyaXMgd2hpY2ggbmV2ZXIgdXNlcyByZWxvY2F0aW9u
cy4gIFRoZSBvbGRlciBpOTY1Cj4gPiBkcml2ZXIgaW4gTWVzYSBkb2VzIHVzZSByZWxvY2F0aW9u
cyBidXQgaXQgb25seSBzdXBwb3J0cyBJbnRlbCBoYXJkd2FyZQo+ID4gdGhyb3VnaCBHZW4xMSBh
bmQgaGFzIGJlZW4gZGVwcmVjYXRlZCBmb3IgYWxsIGhhcmR3YXJlIEdlbjkrLiAgVGhlCj4gPiBj
b21wdXRlIGRyaXZlciBhbHNvIG5ldmVyIHVzZXMgcmVsb2NhdGlvbnMuICBUaGlzIG9ubHkgbGVh
dmVzIHRoZSBtZWRpYQo+ID4gZHJpdmVyIHdoaWNoIGlzIHN1cHBvc2VkIHRvIGJlIHN3aXRjaGlu
ZyB0byBzb2Z0cGluIGdvaW5nIGZvcndhcmQuCj4gPiBNYWtpbmcgc29mdHBpbiBhIHJlcXVpcmVt
ZW50IGZvciBhbGwgZnV0dXJlIGhhcmR3YXJlIHNlZW1zIHJlYXNvbmFibGUuCj4gPiAKPiA+IFJl
amVjdGluZyByZWxvY2F0aW9ucyBzdGFydGluZyB3aXRoIEdlbjEyIGhhcyB0aGUgYmVuZWZpdCB0
aGF0IHdlIGRvbid0Cj4gPiBoYXZlIHRvIGJvdGhlciBzdXBwb3J0aW5nIGl0IG9uIHBsYXRmb3Jt
cyB3aXRoIGxvY2FsIG1lbW9yeS4gIEdpdmVuIGhvdwo+ID4gbXVjaCBDUFUgdG91Y2hpbmcgb2Yg
bWVtb3J5IGlzIHJlcXVpcmVkIGZvciByZWxvY2F0aW9ucywgbm90IGhhdmluZyB0bwo+ID4gZG8g
c28gb24gcGxhdGZvcm1zIHdoZXJlIG5vdCBhbGwgbWVtb3J5IGlzIGRpcmVjdGx5IENQVS1hY2Nl
c3NpYmxlCj4gPiBjYXJyaWVzIHNpZ25pZmljYW50IGFkdmFudGFnZXMuCj4gPiAKPiA+IHYyIChK
YXNvbiBFa3N0cmFuZCk6Cj4gPiAgLSBBbGxvdyBUR0wtTFAgcGxhdGZvcm1zIGFzIHRoZXkndmUg
YWxyZWFkeSBzaGlwcGVkCj4gPiAKPiA+IHYzIChKYXNvbiBFa3N0cmFuZCk6Cj4gPiAgLSBXQVJO
X09OIHBsYXRmb3JtcyB3aXRoIExNRU0gc3VwcG9ydCBpbiBjYXNlIHRoZSBjaGVjayBpcyB3cm9u
Zwo+IAo+IEkgd2FzIGFza2VkIHRvIHJldmlldyBvZiB0aGlzIHBhdGNoLiBJdCB3b3JrcyBhbG9u
ZyB3aXRoIGV4cGVjdGVkCj4gSUdUIGNoZWNrIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9wYXRjaC80MjMzNjEvP3Nlcmllcz04Mjk1NCZyZXY9MjUKPiAKPiBCZWZvcmUgSSdsbCBn
aXZlIHlvdSByLWIgLSBpc24ndCBpOTE1X2dlbV9leGVjYnVmZmVyMl9pb2N0bCgpIGJldHRlciBw
bGFjZQo+IHRvIGRvIGZvciBsb29wIGp1c3QgYWZ0ZXIgY29weV9mcm9tX3VzZXIoKSBhbmQgY2hl
Y2sgcmVsb2NhdGlvbl9jb3VudD8KPiBXZSBoYXZlIGFuIGFjY2VzcyB0byBleGVjMl9saXN0IHRo
ZXJlLCB3ZSBrbm93IHRoZSBnZW4gc28gd2UncmUgYWJsZSB0byBzYXkKPiByZWxvY2F0aW9ucyBh
cmUgbm90IHN1cHBvcnRlZCBpbW1lZGlhdGUsIHdpdGhvdXQgZW50ZXJpbmcgaTkxNV9nZW1fZG9f
ZXhlY2J1ZmZlcigpLgoKVGhlcmUncyBhIE5PUkVMT0MgZmxhZyB5b3UgY2FuIGVuZm9yY2UgYXMg
bWFuZGF0b3J5LiBUaGF0J3MgdHJpdmlhbCBmb3IKdXNlcnNwYWNlIHRvIHNldCwgcmVhbGx5IG1h
a2VzIHN1cmUgdGhleSBhcmUgYXdhcmUgb2YgdGhlIGNoYW5nZSBhZm9vdCwKYW5kIGk5MTVfZ2Vt
X2NlY2tfZXhlY2J1ZmZlcigpIHdpbGwgcGVyZm9ybSB0aGUgdmFsaWRhdGlvbiB1cGZyb250IHdp
dGgKdGhlIG90aGVyIGZsYWcgY2hlY2tzLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
