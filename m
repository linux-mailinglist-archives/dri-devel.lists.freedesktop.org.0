Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B4D3000
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 20:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C3B6E19A;
	Thu, 10 Oct 2019 18:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4471C6E19A;
 Thu, 10 Oct 2019 18:11:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18795246-1500050 for multiple; Thu, 10 Oct 2019 19:11:29 +0100
MIME-Version: 1.0
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191010160640.6472-1-bigeasy@linutronix.de>
References: <20191010160640.6472-1-bigeasy@linutronix.de>
Message-ID: <157073108748.31572.8357146735184542067@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't disable interrupts
 independently of the lock
Date: Thu, 10 Oct 2019 19:11:27 +0100
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yICgyMDE5LTEwLTEwIDE3OjA2OjQwKQo+
IFRoZSBsb2NrcyAoYWN0aXZlLmxvY2sgYW5kIHJxLT5sb2NrKSBuZWVkIHRvIGJlIHRha2VuIHdp
dGggZGlzYWJsZWQKPiBpbnRlcnJ1cHRzLiBUaGlzIGlzIGRvbmUgaW4gaTkxNV9yZXF1ZXN0X3Jl
dGlyZSgpIGJ5IGRpc2FibGluZyB0aGUKPiBpbnRlcnJ1cHRzIGluZGVwZW5kZW50bHkgb2YgdGhl
IGxvY2tzIGl0c2VsZi4KPiBXaGlsZSBsb2NhbF9pcnFfZGlzYWJsZSgpK3NwaW5fbG9jaygpIGVx
dWFscyBzcGluX2xvY2tfaXJxKCkgb24gdmFuaWxsYQo+IGl0IGRvZXMgbm90IG9uIFBSRUVNUFRf
UlQuIEFsc28sIGl0IGlzIG5vdCBvYnZpb3VzIGlmIHRoZXJlIGlzIGEgc3BlY2lhbCByZWFzb24K
PiB0byB3aHkgdGhlIGludGVycnVwdHMgYXJlIGRpc2FibGVkIGluZGVwZW5kZW50bHkgb2YgdGhl
IGxvY2suCj4gCj4gRW5hYmxlL2Rpc2FibGUgaW50ZXJydXB0cyBhcyBwYXJ0IG9mIHRoZSBsb2Nr
aW5nIGluc3RydWN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBBbmRyemVqIFNp
ZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9yZXF1ZXN0LmMgfCAgICA4ICsrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9yZXF1ZXN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlcXVl
c3QuYwo+IEBAIC0yNTEsMTUgKzI1MSwxMyBAQCBzdGF0aWMgYm9vbCBpOTE1X3JlcXVlc3RfcmV0
aXJlKHN0cnVjdCBpCj4gICAgICAgICAgICAgICAgIGFjdGl2ZS0+cmV0aXJlKGFjdGl2ZSwgcnEp
Owo+ICAgICAgICAgfQo+ICAKPiAtICAgICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7Cj4gLQo+ICAg
ICAgICAgLyoKPiAgICAgICAgICAqIFdlIG9ubHkgbG9vc2VseSB0cmFjayBpbmZsaWdodCByZXF1
ZXN0cyBhY3Jvc3MgcHJlZW1wdGlvbiwKPiAgICAgICAgICAqIGFuZCBzbyB3ZSBtYXkgZmluZCBv
dXJzZWx2ZXMgYXR0ZW1wdGluZyB0byByZXRpcmUgYSBfY29tcGxldGVkXwo+ICAgICAgICAgICog
cmVxdWVzdCB0aGF0IHdlIGhhdmUgcmVtb3ZlZCBmcm9tIHRoZSBIVyBhbmQgcHV0IGJhY2sgb24g
YSBydW4KPiAgICAgICAgICAqIHF1ZXVlLgo+ICAgICAgICAgICovCj4gLSAgICAgICBzcGluX2xv
Y2soJnJxLT5lbmdpbmUtPmFjdGl2ZS5sb2NrKTsKPiArICAgICAgIHNwaW5fbG9ja19pcnEoJnJx
LT5lbmdpbmUtPmFjdGl2ZS5sb2NrKTsKPiAgICAgICAgIGxpc3RfZGVsKCZycS0+c2NoZWQubGlu
ayk7Cj4gICAgICAgICBzcGluX3VubG9jaygmcnEtPmVuZ2luZS0+YWN0aXZlLmxvY2spOwo+ICAK
PiBAQCAtMjc4LDkgKzI3Niw3IEBAIHN0YXRpYyBib29sIGk5MTVfcmVxdWVzdF9yZXRpcmUoc3Ry
dWN0IGkKPiAgICAgICAgICAgICAgICAgX19ub3RpZnlfZXhlY3V0ZV9jYihycSk7Cj4gICAgICAg
ICB9Cj4gICAgICAgICBHRU1fQlVHX09OKCFsaXN0X2VtcHR5KCZycS0+ZXhlY3V0ZV9jYikpOwo+
IC0gICAgICAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPiAtCj4gLSAgICAgICBsb2NhbF9pcnFf
ZW5hYmxlKCk7Cj4gKyAgICAgICBzcGluX3VubG9ja19pcnEoJnJxLT5sb2NrKTsKCk5vdGhpbmcg
c2NyZWFtcyBhYm91dCB0aGUgaW1iYWxhbmNlPyBpcnEgb2ZmIGZyb20gb25lIGxvY2sgdG8gdGhl
IG90aGVyPwotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
