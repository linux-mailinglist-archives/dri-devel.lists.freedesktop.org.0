Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351F109FB7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDE36E3EC;
	Tue, 26 Nov 2019 13:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC206E3EC;
 Tue, 26 Nov 2019 13:59:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 05:59:37 -0800
X-IronPort-AV: E=Sophos;i="5.69,245,1571727600"; d="scan'208";a="202724846"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.9.229])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 05:59:34 -0800
MIME-Version: 1.0
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20191125164057.GH14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-4-niranjana.vishwanathapura@intel.com>
 <157467597709.2314.3239893018411484277@skylake-alporthouse-com>
 <20191125164057.GH14488@nvishwa1-DESK.sc.intel.com>
Message-ID: <157477677170.23952.10779405590776070095@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [Intel-gfx] [RFC 03/13] drm/i915/svm: Runtime (RT) allocator
 support
Date: Tue, 26 Nov 2019 15:59:31 +0200
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
Cc: intel-gfx@lists.freedesktop.org, sanjay.k.kumar@intel.com,
 dri-devel@lists.freedesktop.org, dave.hansen@intel.com, jglisse@redhat.com,
 jgg@mellanox.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBOaXJhbmphbiBWaXNod2FuYXRoYXB1cmEgKDIwMTktMTEtMjUgMTg6NDA6NTcpCj4g
T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDk6NTk6MzdBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+ID5RdW90aW5nIE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgKDIwMTktMTEtMjIgMjA6
NTc6MjQpCj4gPj4gU2hhcmVkIFZpcnR1YWwgTWVtb3J5IChTVk0pIHJ1bnRpbWUgYWxsb2NhdG9y
IHN1cHBvcnQgYWxsb3dzCj4gPj4gYmluZGluZyBhIHNoYXJlZCB2aXJ0dWFsIGFkZHJlc3MgdG8g
YSBidWZmZXIgb2JqZWN0IChCTykgaW4gdGhlCj4gPj4gZGV2aWNlIHBhZ2UgdGFibGUgdGhyb3Vn
aCBhbiBpb2N0bCBjYWxsLgo+ID4KPiA+VGhlIGlvY3RsIHRob3VnaCBpcyBub3Qgc3ZtIHNwZWNp
ZmljLCBpdCBpcyB0byBkbyB3aXRoICJidWxrIHJlc2lkZW5jeSIKPiA+YW5kIGNhbiBiZSB1c2Vk
IHRvIHJlZHVjZSBleGVjYnVmIHRyYWZmaWMgdG8gcHJvdmlkZSB2aXJ0dWFsIGFkZHJlc3MKPiA+
bGF5b3V0IGNvbnRyb2xzIHRvIGUuZy4gVnVsa2FuIGNsaWVudHMuCj4gPgo+ID5JOTE1X1ZNX0JJ
TkQgewo+ID4gICAgICAgdWludDMyX3Qgdm1faWQ7Cj4gPiAgICAgICBpbnQzMl90IGZkOyAvKiBv
ciAtMSBmb3IgYW5vbiwgb3IgYnVmIGRlcGVuZGluZyBvbiBmbGFncyAqLwo+ID4gICAgICAgdWlu
dDY0X3QgZmxhZ3M7Cj4gPiAgICAgICB1aW50NjRfdCBvZmZzZXQ7IC8qIG9mZnNldCBpbmZvIGZk
IFtwYWdlIGFsaWduZWRdICovCj4gPiAgICAgICB1aW50NjRfdCBsZW5ndGg7IC8qIHBhZ2UgYWxp
Z25lZCAqLwo+ID4gICAgICAgdWludDY0X3QgaW92YTsgLyogcGFnZSBhbGlnbmVkICovCj4gPiAg
ICAgICB1aW50NjRfdCBleHRlbnNpb25zOwo+ID59OyAvKiB3aGVyZSBwYWdlIGFsaWduZWQgaXMg
YWN0dWFsbHkgbW9yZSBJOTE1X0dUVF9QQUdFX0FMSUdOTUVOVCAqLwo+ID4KPiA+YXMgSSByZWNh
bGwuIEkgYWxzbyByZWNhbGwgaXQgYmVpbmcgcGFydCBvZiBhIGZ1dHVyZSBjb21tYW5kIHN0cmVh
bQo+ID5pbnRlcmZhY2UgdG8gcmVkdWNlIGlvY3RscywgYnV0IHRoYXQgaXMgYW5vdGhlciBzdG9y
eS4KPiAKPiBUaGFua3MgQ2hyaXMuCj4gSSB3aWxsIGNoYW5nZSBJOTE1X0JJTkQgdG8gSTkxNV9W
TV9CSU5ELgoKV2UncmUgdmVyeSBtdWNoIGRlcGVuZGluZyBvbiBHRU0gVk0gZXZlbiBpZiBCT3Mg
d291bGRuJ3QgYmUgdXNlZCwKc28gdGhpcyBpcyBiZXN0IGNhbGxlZCBJOTE1X0dFTV9WTV9CSU5E
IHRvIG1hdGNoIEk5MTVfR0VNX1ZNX0NSRUFURQphbmQgYXZvaWQgdXNlciBjb25mdXNpb24uCgo+
IEN1cnJlbnRseSwgaXQgaXMgb25seSBhZGRyZXNzaW5nIGJpbmRpbmcgU1ZNIHN5c3RlbSAoYnVm
ZmVyKSBhbmQgcnVudGltZSAoQk9zKQo+IGFsbG9jYXRpb25zLiBCdXQgaXQgY2FuIGJlIGV4cGFu
ZGVkIGZvciBvdGhlciBiaW5kaW5ncy4gSSBoYXZlICd0eXBlJyBmaWVsZAo+IGluc3RlYWQgb2Yg
J2ZkJyBhbmQgJ2V4dGVuc2lvbnMnICYgJ2lvdicgY2FuIGJlIGFkZGVkIGxhdGVyIGlmIHJlcXVp
cmVkLgoKV2Ugc2hvdWxkIHRyeSB0byBoYXZlIHRoZSB1QVBJIGFzIGZpbmFsIGFzIGVhcmx5IGFz
IHBvc3NpYmxlLiBUaGUKY2hhbmdlIHByb2Nlc3MgaXMgaGFyZGVyIHRoZSBsYXRlciBpdCBpcyBk
b25lLCBldmVuIGZvciBSRkMgOikKCk9uIHRoZSBzYW1lIG5vdGUsIEknbSBpbmNsaW5lZCB0byBo
YXZlIEk5MTVfU1ZNX01JR1JBVEUgY2FsbGVkCkk5MTVfR0VNX1ZNX1BSRUZBVUxUIGZyb20gdGhl
IHN0YXJ0LCBhcyBJIGFscmVhZHkgaGF2ZSBnb3Qgc29tZQpjb25mdXNlZCBxdWVzdGlvbnMgZnJv
bSBmb2xrcyB3aG8gbWl4IGl0IHdpdGggbWVtb3J5IHByZXNzdXJlCmluaXRpYXRlZCBtaWdyYXRp
b24uIEFuZCBpdCdzIGluaGVyZW50bHkgcmFjeSBhcyBhbnlib2R5IGNvdWxkCnJhY2Ugd2l0aCBp
dCwgc28gUFJFRkFVTFQgd291bGQgZ2l2ZSBhbiBpbXByZXNzaW9uIG9mIHRoYXQuCgpBbmQgSSB0
aGluayBJOTE1X0dFTV9WTV9QUkVGQVVMVCB3b3VsZCBiZSBhIGdlbmVyYWxseSBhcHBsaWNhYmxl
CmZ1bmN0aW9uLCBqdXN0IGxpa2UgSTkxNV9HRU1fVk1fQklORC4gU28gd2Ugc2hvdWxkIHVzZSBh
IHN0cnVjdAptZW1iZXIgbmFtZXMgdGhhdCBhcmUgY2xvc2UgdG8gSTkxNV9HRU1fVk1fQklORC4K
CkJldHRlciBpZGVhcyBmb3IgbmFtZSB0byBlbXBoYXNpcyB0aGUgbmF0dXJlIG9mIHdoYXQgaXMg
YmVpbmcKZG9uZT8gSTkxNV9HRU1fVk1fRkFVTFQvSTkxNV9HRU1fVk1fe00sfUFEVklDRS4uLgoK
UmVnYXJkcywgSm9vbmFzCgo+IElzIHRoYXQgT0s/Cj4gCj4gPi1DaHJpcwo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcg
bGlzdAo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
