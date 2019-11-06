Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222D0F142A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAEB6ECBF;
	Wed,  6 Nov 2019 10:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276F26E1B5;
 Wed,  6 Nov 2019 10:43:00 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19099862-1500050 for multiple; Wed, 06 Nov 2019 10:42:52 +0000
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157303600842.24928.8883426579845207112@skylake-alporthouse-com>
References: <20191106100716.18181-1-chris@chris-wilson.co.uk>
 <20191106101950.GE23790@phenom.ffwll.local>
 <157303600842.24928.8883426579845207112@skylake-alporthouse-com>
Message-ID: <157303697006.24928.6564122275201085833@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 1/3] drm: Expose a method for creating
 anonymous struct file around drm_minor
Date: Wed, 06 Nov 2019 10:42:50 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMTEtMDYgMTA6MjY6NDgpCj4gUXVvdGluZyBEYW5p
ZWwgVmV0dGVyICgyMDE5LTExLTA2IDEwOjE5OjUwKQo+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkg
YXQgMTA6MDc6MTRBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gPiBTb21ldGltZXMg
d2UgbmVlZCB0byBjcmVhdGUgYSBzdHJ1Y3QgZmlsZSB0byB3cmFwIGEgZHJtX2RldmljZSwgYXMg
aXQKPiA+ID4gdGhlIHVzZXIgd2VyZSB0byBoYXZlIG9wZW5lZCAvZGV2L2RyaS9jYXJkMCBidXQg
dG8gZG8gc28gYW5vbnltb3VzbHkKPiA+ID4gKGkuZS4gZm9yIGludGVybmFsIHVzZSkuIFByb3Zp
ZGUgYSB1dGlsaXR5IG1ldGhvZCB0byBjcmVhdGUgYSBzdHJ1Y3QKPiA+ID4gZmlsZSB3aXRoIHRo
ZSBkcm1fZGV2aWNlLT5kcml2ZXIuZm9wcywgdGhhdCB3cmFwIHRoZSBkcm1fZGV2aWNlLgo+ID4g
PiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Cj4gPiAKPiA+IEZvciBwcm9wZXIgaW50ZXJuYWwgYWNjZXNzIHdlIGFscmVhZHkgaGF2
ZSBkcm1fY2xpZW50X29wZW4sIHNvIEkgdGhpbmsKPiA+IHRoaXMgaGFzIGxpbWl0ZWQgKGJ1dCBn
b29kIHVzZSkgaW4gc2VsZnRlc3RzIG9ubHkuIFNvCj4gPiBFWFBPUlRfU1lNQk9MX0ZPUl9URVNU
U19PTkxZIHBsdXMgbWF5YmUgYSBjbGVhcmVyIG5hbWUgZm9yIHRoZSBpbnRlbmRlZAo+ID4gdXNl
IGxpa2UgZHJtX2ZpbGVfbW9ja19vcGVuPwo+IAo+IEkgZm91bmQgdGhlIGV4YW1wbGUgaW4gZHJt
X2dlbV9wcmltZV9tbWFwKCkgdGhhdCB3YXMgZG9pbmcgdGhlIHNhbWUgdHJpY2ssCj4gYW5kIHRo
ZSB0cmljayBvZiBiZWluZyBhYmxlIHRvIGluc3RhbnRpYXRlIG5ldyBzdHJ1Y3QgZmlsZSBhbmQg
aW5zdGFsbCBhCj4gZmQgd2hlbmV2ZXIgc2VlbXMgbGlrZSBpdCB3aWxsIGNvbWUgaW4gaGFuZHku
Li4gSnVzdCBsYWNraW5nIHRoZSB0aGlyZAo+IHVzZXIgYXQgdGhlIG1vbWVudCB0byBjbGFpbSBn
ZW5lcmFsaXR5LgoKVGhlIGNsb3Nlc3QgZXhhbXBsZSBJIGZvdW5kIGluIHRoZSBzcGlyaXQgb2Yg
Y3JlYXRpbmcgYSBuZXcgZHJtX2RldmljZQpzdHJ1Y3QgZmlsZSBhbmQgaW5zdGFsbGluZyBpdCBp
cyBkcm1fbW9kZV9jcmVhdGVfbGVhc2VfaW9jdGwoKSB0aGF0IHVzZXMKZmlsZV9jbG9uZV9vcGVu
KCkgZm9yIHRoaXMgcHVycG9zZS4gVGhlIGFyZ3VtZW50IHRoZXJlIHdvdWxkIGJlIHdoZXRoZXIK
Y2xvbmluZyB0aGUgKGZpbGUtPmZfcGF0aCwgZmlsZS0+Zl9mbGFncywgZmlsZS0+Zl9jcmVkKSBp
cyBhcHByb3ByaWF0ZQp2ZXJzdXMgYW4gYW5vbnltb3VzIGlub2RlLiBJIHRoaW5rIGNsb25pbmcg
dGhlIGNyZWRlbnRpYWxzIHNlZW1zIGNvcnJlY3QKZm9yIGxlYXNpbmcuCi1DaHJpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
