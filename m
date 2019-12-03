Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2019910FF08
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3A66E53C;
	Tue,  3 Dec 2019 13:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4606E079;
 Tue,  3 Dec 2019 13:42:59 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19443048-1500050 for multiple; Tue, 03 Dec 2019 13:42:48 +0000
MIME-Version: 1.0
To: Nick Desaulniers <ndesaulniers@google.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAKwvOdniXqn3xt3-W0Pqi-X1nWjJ2vUVofjCm1O-UPXZ7_4rXw@mail.gmail.com>
References: <20191123195321.41305-1-natechancellor@gmail.com>
 <157453950786.2524.16955749910067219709@skylake-alporthouse-com>
 <CAKwvOdniXqn3xt3-W0Pqi-X1nWjJ2vUVofjCm1O-UPXZ7_4rXw@mail.gmail.com>
Message-ID: <157538056769.7230.15356495786856166580@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Remove tautological compare in eb_relocate_vma
Date: Tue, 03 Dec 2019 13:42:47 +0000
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
Cc: intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBOaWNrIERlc2F1bG5pZXJzICgyMDE5LTEyLTAyIDE5OjE4OjIwKQo+IE9uIFNhdCwg
Tm92IDIzLCAyMDE5IGF0IDEyOjA1IFBNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPiB3cm90ZToKPiA+Cj4gPiBRdW90aW5nIE5hdGhhbiBDaGFuY2VsbG9yICgyMDE5LTEx
LTIzIDE5OjUzOjIyKQo+ID4gPiAtV3RhdXRvbG9naWNhbC1jb21wYXJlIHdhcyByZWNlbnRseSBh
ZGRlZCB0byAtV2FsbCBpbiBMTFZNLCB3aGljaAo+ID4gPiBleHBvc2VkIGFuIGlmIHN0YXRlbWVu
dCBpbiBpOTE1IHRoYXQgaXMgYWx3YXlzIGZhbHNlOgo+ID4gPgo+ID4gPiAuLi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jOjE0ODU6MjI6IHdhcm5pbmc6Cj4g
PiA+IHJlc3VsdCBvZiBjb21wYXJpc29uIG9mIGNvbnN0YW50IDU3NjQ2MDc1MjMwMzQyMzQ4NyB3
aXRoIGV4cHJlc3Npb24gb2YKPiA+ID4gdHlwZSAndW5zaWduZWQgaW50JyBpcyBhbHdheXMgZmFs
c2UKPiA+ID4gWy1XdGF1dG9sb2dpY2FsLWNvbnN0YW50LW91dC1vZi1yYW5nZS1jb21wYXJlXQo+
ID4gPiAgICAgICAgIGlmICh1bmxpa2VseShyZW1haW4gPiBOX1JFTE9DKFVMT05HX01BWCkpKQo+
ID4gPiAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4g
PiA+Cj4gPiA+IFNpbmNlIHJlbWFpbiBpcyBhbiB1bnNpZ25lZCBpbnQsIGl0IGNhbiBuZXZlciBi
ZSBsYXJnZXIgdGhhbiBVSU5UX01BWCwKPiA+ID4gd2hpY2ggaXMgbGVzcyB0aGFuIFVMT05HX01B
WCAvIHNpemVvZihzdHJ1Y3QgZHJtX2k5MTVfZ2VtX3JlbG9jYXRpb25fZW50cnkpLgo+ID4gPiBS
ZW1vdmUgdGhpcyBzdGF0ZW1lbnQgdG8gZml4IHRoZSB3YXJuaW5nLgo+ID4KPiA+IFRoZSBjaGVj
ayBzaG91bGQgcmVtYWluIGFzIHdlIGRvIHdhbnQgdG8gZG9jdW1lbnQgdGhlIG92ZXJmbG93Cj4g
PiBjYWxjdWxhdGlvbiwgYW5kIGl0IHNob3VsZCByZXByZXNlbnQgdGhlIHR5cGVzIHVzZWQgLS0g
aXQncyBtdWNoIGVhc2llcgo+IAo+IFdoYXQgZG8geW91IG1lYW4gInJlcHJlc2VudCB0aGUgdHlw
ZXMgdXNlZD8iICBBcmUgeW91IGNvbmNlcm5lZCB0aGF0Cj4gdGhlIHR5cGUgb2YgZHJtX2k5MTVf
Z2VtX2V4ZWNfb2JqZWN0Mi0+cmVsb2NhdGlvbl9jb3VudCBtaWdodCBjaGFuZ2UKPiBpbiB0aGUg
ZnV0dXJlPwoKV2UgbWF5IHdhbnQgdG8gY2hhbmdlIHRoZSByZXN0cmljdGlvbiwgeWVzLgogCj4g
PiB0byByZXZpZXcgYSBzdHViIHRoYW4gdHJ5aW5nIHRvIGZpbmQgYSBtaXNzaW5nIG92ZXJmbG93
IGNoZWNrLiBJZiB0aGUKPiA+IG92ZXJmbG93IGNhbm5vdCBoYXBwZW4gYXMgdGhlIHR5cGVzIGFy
ZSB3aWRlIGVub3VnaCwgbm8gcHJvYmxlbSwgdGhlCj4gPiBjb21waWxlciBjYW4gcmVtb3ZlIHRo
ZSBrbm93biBmYWxzZSBicmFuY2guCj4gCj4gV2hhdCBvdmVyZmxvdyBhcmUgeW91IHRyeWluZyB0
byBwcm90ZWN0IGFnYWluc3QgaGVyZT8KClRoZXNlIHZhbHVlcyBhcmUgdW5kZXIgdXNlciBjb250
cm9sLCBvdXIgdmFsaWRhdGlvbiBzdGVwcyBzaG91bGQgYmUKY2xlYXIgYW5kIGVhc3kgdG8gY2hl
Y2suIElmIHdlIGhhdmUgdGhlIHR5cGVzIHdyb25nLCBpZiB0aGUgY2hlY2tzIGFyZQp3cm9uZywg
d2UgbmVlZCB0byBmaXggdGhlbS4gSWYgdGhlIGNvZGUgaXMgcmVtb3ZlZCBiZWNhdXNlIGl0IGNh
biBiZQpldmFsdWF0ZWQgYnkgdGhlIGNvbXBpbGVyIHRvIGJlIHJlZHVuZGFudCwgaXQgaXMgbXVj
aCBoYXJkZXIgZm9yIHVzIHRvCnZlcmlmeSB0aGF0IHdlIGhhdmUgdHJpZWQgdG8gdmFsaWRhdGUg
dXNlciBpbnB1dC4KCj4gPiBUYXV0b2xvZ3kgaGVyZSBoYXMgYSBwdXJwb3NlIGZvciBjb252ZXlp
bmcgaW5mb3JtYXRpb24gdG8gdGhlIHJlYWRlci4KPiAKPiBXZWxsIGxlYXZpbmcgYSB3YXJuaW5n
IHVuYWRkcmVzc2VkIGlzIGFsc28gbm90IGEgc29sdXRpb24uICBFaXRoZXIKPiByZXBsYWNlIGl0
IHdpdGggYSBjb21tZW50IG9yIHR1cm4gb2ZmIHRoZSB3YXJuaW5nIGZvciB5b3VyIHN1YmRpci4K
Ck15IHBlcnNvbmFsIHByZWZlcmVuY2Ugd291bGQgYmUgdG8gdXNlIGEgYnVuY2ggb2YgY2VudHJh
bCBtYWNyb3MgZm9yIHRoZQp2YXJpb3VzIHR5cGUva21hbGxvYyBvdmVyZmxvd3MsIGFuZCBoYXZl
IHRoZSB3YXJuaW5ncyBzdXBwcmVzc2VkIHRoZXJlCnNpbmNlIHRoZXkgYXJlIHZlcnkgbXVjaCBh
Ym91dCBkb2N1bWVudGluZyB1c2VyIGlucHV0IHZhbGlkYXRpb24uCi1DaHJpcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
