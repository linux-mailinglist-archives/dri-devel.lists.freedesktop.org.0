Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84330CB8E4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 13:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD776EB22;
	Fri,  4 Oct 2019 11:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911ED6EB22;
 Fri,  4 Oct 2019 11:07:15 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18721532-1500050 for multiple; Fri, 04 Oct 2019 12:07:12 +0100
MIME-Version: 1.0
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <fc1d813f-5f57-0a5c-a7ff-ba8db1399d32@linux.intel.com>
References: <20191003210100.22250-1-chris@chris-wilson.co.uk>
 <20191003210100.22250-5-chris@chris-wilson.co.uk>
 <fc1d813f-5f57-0a5c-a7ff-ba8db1399d32@linux.intel.com>
Message-ID: <157018723052.12925.12334881894790832202@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/mm: Use clear_bit_unlock() for
 releasing the drm_mm_node()
Date: Fri, 04 Oct 2019 12:07:10 +0100
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0xMC0wNCAxMDoxNToyMCkKPiAKPiBPbiAwMy8x
MC8yMDE5IDIyOjAxLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBBIGZldyBjYWxsZXJzIG5lZWQg
dG8gc2VyaWFsaXNlIHRoZSBkZXN0cnVjdGlvbiBvZiB0aGVpciBkcm1fbW1fbm9kZSBhbmQKPiA+
IGVuc3VyZSBpdCBpcyByZW1vdmVkIGZyb20gdGhlIGRybV9tbSBiZWZvcmUgZnJlZWluZy4gSG93
ZXZlciwgdG8gYmUKPiA+IGNvbXBsZXRlbHkgc3VyZSB0aGF0IGFueSBhY2Nlc3MgZnJvbSBhbm90
aGVyIHRocmVhZCBpcyBjb21wbGV0ZSBiZWZvcmUKPiA+IHdlIGZyZWUgdGhlIHN0cnVjdCwgd2Ug
cmVxdWlyZSB0aGUgUkVMRUFTRSBzZW1hbnRpY3Mgb2YKPiA+IGNsZWFyX2JpdF91bmxvY2soKS4K
PiA+IAo+ID4gVGhpcyBhbGxvd3MgdGhlIGNvbmRpdGlvbmFsIGxvY2tpbmcgc3VjaCBhcwo+ID4g
Cj4gPiBUaHJlYWQgQSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRocmVhZCBCCj4gPiAg
ICAgIG11dGV4X2xvY2sobW1fbG9jayk7ICAgICAgICAgICAgICAgIGlmIChkcm1fbW1fbm9kZV9h
bGxvY2F0ZWQobm9kZSkpIHsKPiA+ICAgICAgZHJtX21tX25vZGVfcmVtb3ZlKG5vZGUpOyAgICAg
ICAgICAgICAgIG11dGV4X2xvY2sobW1fbG9jayk7Cj4gPiAgICAgIG11dGV4X3VubG9jayhtbV9s
b2NrKTsgICAgICAgICAgICAgICAgICBkcm1fbW1fbm9kZV9yZW1vdmUobm9kZSk7Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2sobW1f
bG9jayk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrZnJlZShub2RlKTsK
PiAKPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgcmVsZWFzZSBzZW1hbnRpY3Mgb24gbm9kZSBh
bGxvY2F0ZWQgbWVhbiAxIC0+IDAgCj4gdHJhbnNpdGlvbiBpcyBndWFyYW50ZWVkIHRvIGJlIHNl
ZW4gb25seSB3aGVuIHRocmVhZCBBIAo+IGRybV9tbV9ub2RlX3JlbW92ZSBpcyBmdWxseSBkb25l
IHdpdGggdGhlIHJlbW92YWwuIEJ1dCBpZiBpdCBpcyBpbiB0aGUgCj4gbWlkZGxlIG9mIHJlbW92
YWwsIG5vZGUgaXMgc3RpbGwgc2VlbiBhcyBhbGxvY2F0ZWQgb3V0c2lkZSBhbmQgdGhyZWFkIEIg
Cj4gY2FuIGVudGVyIHRoZSBpZi1ib2R5LCB3YWl0IGZvciB0aGUgbG9jaywgYW5kIHRoZW4gZHJt
X21tX25vZGVfcmVtb3ZlIAo+IHdpbGwgYXR0ZW1wdCBhIGRvdWJsZSByZW1vdmFsLiBTbyBJIHRo
aW5rIGFub3RoZXIgZHJtX21tX25vZGVfYWxsb2NhdGVkIAo+IHVuZGVyIHRoZSBsb2NrIGlzIG5l
ZWRlZC4KClllcy4gQ2hlY2sgYWZ0ZXIgdGhlIGxvY2sgaXMgaW5kZWVkIHJlcXVpcmVkIGluIHRo
aXMgc2NlbmFyaW8uIEFuZApkcm1fbW1fbm9kZV9yZW1vdmUoKSBpbnNpc3RzIHRoZSBjYWxsZXIg
ZG9lc24ndCB0cnkgYSBkb3VibGUgcmVtb3ZlLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
