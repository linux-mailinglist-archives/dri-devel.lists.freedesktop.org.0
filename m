Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78B10803A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 21:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80346E08C;
	Sat, 23 Nov 2019 20:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F876E08C;
 Sat, 23 Nov 2019 20:05:21 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19314250-1500050 for multiple; Sat, 23 Nov 2019 20:05:12 +0000
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191123195321.41305-1-natechancellor@gmail.com>
References: <20191123195321.41305-1-natechancellor@gmail.com>
Message-ID: <157453950786.2524.16955749910067219709@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Remove tautological compare in eb_relocate_vma
Date: Sat, 23 Nov 2019 20:05:07 +0000
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBOYXRoYW4gQ2hhbmNlbGxvciAoMjAxOS0xMS0yMyAxOTo1MzoyMikKPiAtV3RhdXRv
bG9naWNhbC1jb21wYXJlIHdhcyByZWNlbnRseSBhZGRlZCB0byAtV2FsbCBpbiBMTFZNLCB3aGlj
aAo+IGV4cG9zZWQgYW4gaWYgc3RhdGVtZW50IGluIGk5MTUgdGhhdCBpcyBhbHdheXMgZmFsc2U6
Cj4gCj4gLi4vZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYzox
NDg1OjIyOiB3YXJuaW5nOgo+IHJlc3VsdCBvZiBjb21wYXJpc29uIG9mIGNvbnN0YW50IDU3NjQ2
MDc1MjMwMzQyMzQ4NyB3aXRoIGV4cHJlc3Npb24gb2YKPiB0eXBlICd1bnNpZ25lZCBpbnQnIGlz
IGFsd2F5cyBmYWxzZQo+IFstV3RhdXRvbG9naWNhbC1jb25zdGFudC1vdXQtb2YtcmFuZ2UtY29t
cGFyZV0KPiAgICAgICAgIGlmICh1bmxpa2VseShyZW1haW4gPiBOX1JFTE9DKFVMT05HX01BWCkp
KQo+ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAK
PiBTaW5jZSByZW1haW4gaXMgYW4gdW5zaWduZWQgaW50LCBpdCBjYW4gbmV2ZXIgYmUgbGFyZ2Vy
IHRoYW4gVUlOVF9NQVgsCj4gd2hpY2ggaXMgbGVzcyB0aGFuIFVMT05HX01BWCAvIHNpemVvZihz
dHJ1Y3QgZHJtX2k5MTVfZ2VtX3JlbG9jYXRpb25fZW50cnkpLgo+IFJlbW92ZSB0aGlzIHN0YXRl
bWVudCB0byBmaXggdGhlIHdhcm5pbmcuCgpUaGUgY2hlY2sgc2hvdWxkIHJlbWFpbiBhcyB3ZSBk
byB3YW50IHRvIGRvY3VtZW50IHRoZSBvdmVyZmxvdwpjYWxjdWxhdGlvbiwgYW5kIGl0IHNob3Vs
ZCByZXByZXNlbnQgdGhlIHR5cGVzIHVzZWQgLS0gaXQncyBtdWNoIGVhc2llcgp0byByZXZpZXcg
YSBzdHViIHRoYW4gdHJ5aW5nIHRvIGZpbmQgYSBtaXNzaW5nIG92ZXJmbG93IGNoZWNrLiBJZiB0
aGUKb3ZlcmZsb3cgY2Fubm90IGhhcHBlbiBhcyB0aGUgdHlwZXMgYXJlIHdpZGUgZW5vdWdoLCBu
byBwcm9ibGVtLCB0aGUKY29tcGlsZXIgY2FuIHJlbW92ZSB0aGUga25vd24gZmFsc2UgYnJhbmNo
LgoKVGF1dG9sb2d5IGhlcmUgaGFzIGEgcHVycG9zZSBmb3IgY29udmV5aW5nIGluZm9ybWF0aW9u
IHRvIHRoZSByZWFkZXIuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
