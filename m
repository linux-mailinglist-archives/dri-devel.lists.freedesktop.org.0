Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD94CB8F8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 13:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F426EB28;
	Fri,  4 Oct 2019 11:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6532F6EB28;
 Fri,  4 Oct 2019 11:17:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18721655-1500050 for multiple; Fri, 04 Oct 2019 12:17:42 +0100
MIME-Version: 1.0
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157018723052.12925.12334881894790832202@skylake-alporthouse-com>
References: <20191003210100.22250-1-chris@chris-wilson.co.uk>
 <20191003210100.22250-5-chris@chris-wilson.co.uk>
 <fc1d813f-5f57-0a5c-a7ff-ba8db1399d32@linux.intel.com>
 <157018723052.12925.12334881894790832202@skylake-alporthouse-com>
Message-ID: <157018786025.12925.9929624154459883899@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/mm: Use clear_bit_unlock() for
 releasing the drm_mm_node()
Date: Fri, 04 Oct 2019 12:17:40 +0100
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMTAtMDQgMTI6MDc6MTApCj4gUXVvdGluZyBUdnJ0
a28gVXJzdWxpbiAoMjAxOS0xMC0wNCAxMDoxNToyMCkKPiA+IAo+ID4gT24gMDMvMTAvMjAxOSAy
MjowMSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gPiBBIGZldyBjYWxsZXJzIG5lZWQgdG8gc2Vy
aWFsaXNlIHRoZSBkZXN0cnVjdGlvbiBvZiB0aGVpciBkcm1fbW1fbm9kZSBhbmQKPiA+ID4gZW5z
dXJlIGl0IGlzIHJlbW92ZWQgZnJvbSB0aGUgZHJtX21tIGJlZm9yZSBmcmVlaW5nLiBIb3dldmVy
LCB0byBiZQo+ID4gPiBjb21wbGV0ZWx5IHN1cmUgdGhhdCBhbnkgYWNjZXNzIGZyb20gYW5vdGhl
ciB0aHJlYWQgaXMgY29tcGxldGUgYmVmb3JlCj4gPiA+IHdlIGZyZWUgdGhlIHN0cnVjdCwgd2Ug
cmVxdWlyZSB0aGUgUkVMRUFTRSBzZW1hbnRpY3Mgb2YKPiA+ID4gY2xlYXJfYml0X3VubG9jaygp
Lgo+ID4gPiAKPiA+ID4gVGhpcyBhbGxvd3MgdGhlIGNvbmRpdGlvbmFsIGxvY2tpbmcgc3VjaCBh
cwo+ID4gPiAKPiA+ID4gVGhyZWFkIEEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaHJl
YWQgQgo+ID4gPiAgICAgIG11dGV4X2xvY2sobW1fbG9jayk7ICAgICAgICAgICAgICAgIGlmIChk
cm1fbW1fbm9kZV9hbGxvY2F0ZWQobm9kZSkpIHsKPiA+ID4gICAgICBkcm1fbW1fbm9kZV9yZW1v
dmUobm9kZSk7ICAgICAgICAgICAgICAgbXV0ZXhfbG9jayhtbV9sb2NrKTsKPiA+ID4gICAgICBt
dXRleF91bmxvY2sobW1fbG9jayk7ICAgICAgICAgICAgICAgICAgZHJtX21tX25vZGVfcmVtb3Zl
KG5vZGUpOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtdXRleF91bmxvY2sobW1fbG9jayk7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAga2ZyZWUobm9kZSk7Cj4gPiAKPiA+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBy
ZWxlYXNlIHNlbWFudGljcyBvbiBub2RlIGFsbG9jYXRlZCBtZWFuIDEgLT4gMCAKPiA+IHRyYW5z
aXRpb24gaXMgZ3VhcmFudGVlZCB0byBiZSBzZWVuIG9ubHkgd2hlbiB0aHJlYWQgQSAKPiA+IGRy
bV9tbV9ub2RlX3JlbW92ZSBpcyBmdWxseSBkb25lIHdpdGggdGhlIHJlbW92YWwuIEJ1dCBpZiBp
dCBpcyBpbiB0aGUgCj4gPiBtaWRkbGUgb2YgcmVtb3ZhbCwgbm9kZSBpcyBzdGlsbCBzZWVuIGFz
IGFsbG9jYXRlZCBvdXRzaWRlIGFuZCB0aHJlYWQgQiAKPiA+IGNhbiBlbnRlciB0aGUgaWYtYm9k
eSwgd2FpdCBmb3IgdGhlIGxvY2ssIGFuZCB0aGVuIGRybV9tbV9ub2RlX3JlbW92ZSAKPiA+IHdp
bGwgYXR0ZW1wdCBhIGRvdWJsZSByZW1vdmFsLiBTbyBJIHRoaW5rIGFub3RoZXIgZHJtX21tX25v
ZGVfYWxsb2NhdGVkIAo+ID4gdW5kZXIgdGhlIGxvY2sgaXMgbmVlZGVkLgo+IAo+IFllcy4gQ2hl
Y2sgYWZ0ZXIgdGhlIGxvY2sgaXMgaW5kZWVkIHJlcXVpcmVkIGluIHRoaXMgc2NlbmFyaW8uIEFu
ZAo+IGRybV9tbV9ub2RlX3JlbW92ZSgpIGluc2lzdHMgdGhlIGNhbGxlciBkb2Vzbid0IHRyeSBh
IGRvdWJsZSByZW1vdmUuCgpJIGhhZCB0byBnbyBiYWNrIGFuZCBkb3VibGUgY2hlY2sgdGhlIHZt
YSBjb2RlLCBhbmQgdGhhdCdzIGZpbmUuCihXZSBoaXQgdGhpcyBjYXNlIHdoZXJlIG9uZSB0aHJl
YWQgaXMgZXZpY3RpbmcgYW5kIGFub3RoZXIgdGhyZWFkIGlzCmRlc3Ryb3lpbmcgdGhlIG9iamVj
dC4gQW5kIGZvciB1cyB3ZSBkbyB0aGUgY2hlY2sgdW5kZXIgdGhlIGxvY2sgaW5zaWRlCl9faTkx
NV92bWFfdW5iaW5kKCkgb24gdGhlIGRlc3Ryb3kgcGF0aC4pCi1DaHJpcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
