Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A868CCB9B6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6398E6EB56;
	Fri,  4 Oct 2019 12:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F356EB51;
 Fri,  4 Oct 2019 12:01:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 05:01:39 -0700
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="191559246"
Received: from paaron-mobl.ger.corp.intel.com (HELO [10.251.93.134])
 ([10.251.93.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/AES256-SHA;
 04 Oct 2019 05:01:38 -0700
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/mm: Use clear_bit_unlock() for
 releasing the drm_mm_node()
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20191003210100.22250-1-chris@chris-wilson.co.uk>
 <20191003210100.22250-5-chris@chris-wilson.co.uk>
 <fc1d813f-5f57-0a5c-a7ff-ba8db1399d32@linux.intel.com>
 <157018723052.12925.12334881894790832202@skylake-alporthouse-com>
 <157018786025.12925.9929624154459883899@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <0b89ccc5-1b44-121b-4601-f8ae3f67b039@linux.intel.com>
Date: Fri, 4 Oct 2019 13:01:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <157018786025.12925.9929624154459883899@skylake-alporthouse-com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzEwLzIwMTkgMTI6MTcsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIENocmlz
IFdpbHNvbiAoMjAxOS0xMC0wNCAxMjowNzoxMCkKPj4gUXVvdGluZyBUdnJ0a28gVXJzdWxpbiAo
MjAxOS0xMC0wNCAxMDoxNToyMCkKPj4+Cj4+PiBPbiAwMy8xMC8yMDE5IDIyOjAxLCBDaHJpcyBX
aWxzb24gd3JvdGU6Cj4+Pj4gQSBmZXcgY2FsbGVycyBuZWVkIHRvIHNlcmlhbGlzZSB0aGUgZGVz
dHJ1Y3Rpb24gb2YgdGhlaXIgZHJtX21tX25vZGUgYW5kCj4+Pj4gZW5zdXJlIGl0IGlzIHJlbW92
ZWQgZnJvbSB0aGUgZHJtX21tIGJlZm9yZSBmcmVlaW5nLiBIb3dldmVyLCB0byBiZQo+Pj4+IGNv
bXBsZXRlbHkgc3VyZSB0aGF0IGFueSBhY2Nlc3MgZnJvbSBhbm90aGVyIHRocmVhZCBpcyBjb21w
bGV0ZSBiZWZvcmUKPj4+PiB3ZSBmcmVlIHRoZSBzdHJ1Y3QsIHdlIHJlcXVpcmUgdGhlIFJFTEVB
U0Ugc2VtYW50aWNzIG9mCj4+Pj4gY2xlYXJfYml0X3VubG9jaygpLgo+Pj4+Cj4+Pj4gVGhpcyBh
bGxvd3MgdGhlIGNvbmRpdGlvbmFsIGxvY2tpbmcgc3VjaCBhcwo+Pj4+Cj4+Pj4gVGhyZWFkIEEg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaHJlYWQgQgo+Pj4+ICAgICAgIG11dGV4X2xv
Y2sobW1fbG9jayk7ICAgICAgICAgICAgICAgIGlmIChkcm1fbW1fbm9kZV9hbGxvY2F0ZWQobm9k
ZSkpIHsKPj4+PiAgICAgICBkcm1fbW1fbm9kZV9yZW1vdmUobm9kZSk7ICAgICAgICAgICAgICAg
bXV0ZXhfbG9jayhtbV9sb2NrKTsKPj4+PiAgICAgICBtdXRleF91bmxvY2sobW1fbG9jayk7ICAg
ICAgICAgICAgICAgICAgZHJtX21tX25vZGVfcmVtb3ZlKG5vZGUpOwo+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2sobW1fbG9jayk7
Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUobm9kZSk7Cj4+
Pgo+Pj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHJlbGVhc2Ugc2VtYW50aWNzIG9uIG5vZGUg
YWxsb2NhdGVkIG1lYW4gMSAtPiAwCj4+PiB0cmFuc2l0aW9uIGlzIGd1YXJhbnRlZWQgdG8gYmUg
c2VlbiBvbmx5IHdoZW4gdGhyZWFkIEEKPj4+IGRybV9tbV9ub2RlX3JlbW92ZSBpcyBmdWxseSBk
b25lIHdpdGggdGhlIHJlbW92YWwuIEJ1dCBpZiBpdCBpcyBpbiB0aGUKPj4+IG1pZGRsZSBvZiBy
ZW1vdmFsLCBub2RlIGlzIHN0aWxsIHNlZW4gYXMgYWxsb2NhdGVkIG91dHNpZGUgYW5kIHRocmVh
ZCBCCj4+PiBjYW4gZW50ZXIgdGhlIGlmLWJvZHksIHdhaXQgZm9yIHRoZSBsb2NrLCBhbmQgdGhl
biBkcm1fbW1fbm9kZV9yZW1vdmUKPj4+IHdpbGwgYXR0ZW1wdCBhIGRvdWJsZSByZW1vdmFsLiBT
byBJIHRoaW5rIGFub3RoZXIgZHJtX21tX25vZGVfYWxsb2NhdGVkCj4+PiB1bmRlciB0aGUgbG9j
ayBpcyBuZWVkZWQuCj4+Cj4+IFllcy4gQ2hlY2sgYWZ0ZXIgdGhlIGxvY2sgaXMgaW5kZWVkIHJl
cXVpcmVkIGluIHRoaXMgc2NlbmFyaW8uIEFuZAo+PiBkcm1fbW1fbm9kZV9yZW1vdmUoKSBpbnNp
c3RzIHRoZSBjYWxsZXIgZG9lc24ndCB0cnkgYSBkb3VibGUgcmVtb3ZlLgo+IAo+IEkgaGFkIHRv
IGdvIGJhY2sgYW5kIGRvdWJsZSBjaGVjayB0aGUgdm1hIGNvZGUsIGFuZCB0aGF0J3MgZmluZS4K
PiAoV2UgaGl0IHRoaXMgY2FzZSB3aGVyZSBvbmUgdGhyZWFkIGlzIGV2aWN0aW5nIGFuZCBhbm90
aGVyIHRocmVhZCBpcwo+IGRlc3Ryb3lpbmcgdGhlIG9iamVjdC4gQW5kIGZvciB1cyB3ZSBkbyB0
aGUgY2hlY2sgdW5kZXIgdGhlIGxvY2sgaW5zaWRlCj4gX19pOTE1X3ZtYV91bmJpbmQoKSBvbiB0
aGUgZGVzdHJveSBwYXRoLikKClNvIEkgdGhpbmsgaWYgeW91IGFtZW5kIHRoZSBjb21taXQgbWVz
c2FnZSB0byBjb250YWluIHRoZSByZXBlYXRlZCBjaGVjayAKdW5kZXIgdGhlIGxvY2sgcGF0Y2gg
bG9va3MgZ29vZCB0byBtZS4gV2l0aCB0aGF0OgoKUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGlu
IDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CgpSZWdhcmRzLAoKVHZydGtvCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
