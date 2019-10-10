Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E248D3219
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 22:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDEB6EB84;
	Thu, 10 Oct 2019 20:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29656EB82;
 Thu, 10 Oct 2019 20:30:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18796401-1500050 for multiple; Thu, 10 Oct 2019 21:30:37 +0100
MIME-Version: 1.0
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191010182610.g7r5ieysx7r6kpco@linutronix.de>
References: <20191010160640.6472-1-bigeasy@linutronix.de>
 <157073108748.31572.8357146735184542067@skylake-alporthouse-com>
 <20191010182610.g7r5ieysx7r6kpco@linutronix.de>
Message-ID: <157073943519.31572.16175211768966306500@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't disable interrupts
 independently of the lock
Date: Thu, 10 Oct 2019 21:30:35 +0100
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 tglx@linutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yICgyMDE5LTEwLTEwIDE5OjI2OjEwKQo+
IE9uIDIwMTktMTAtMTAgMTk6MTE6MjcgWyswMTAwXSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlcXVlc3QuYwo+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlcXVlc3QuYwo+ID4gPiBAQCAtMjUxLDE1ICsyNTEs
MTMgQEAgc3RhdGljIGJvb2wgaTkxNV9yZXF1ZXN0X3JldGlyZShzdHJ1Y3QgaQo+ID4gPiAgICAg
ICAgICAgICAgICAgYWN0aXZlLT5yZXRpcmUoYWN0aXZlLCBycSk7Cj4gPiA+ICAgICAgICAgfQo+
ID4gPiAgCj4gPiA+IC0gICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiA+ID4gLQo+ID4gPiAg
ICAgICAgIC8qCj4gPiA+ICAgICAgICAgICogV2Ugb25seSBsb29zZWx5IHRyYWNrIGluZmxpZ2h0
IHJlcXVlc3RzIGFjcm9zcyBwcmVlbXB0aW9uLAo+ID4gPiAgICAgICAgICAqIGFuZCBzbyB3ZSBt
YXkgZmluZCBvdXJzZWx2ZXMgYXR0ZW1wdGluZyB0byByZXRpcmUgYSBfY29tcGxldGVkXwo+ID4g
PiAgICAgICAgICAqIHJlcXVlc3QgdGhhdCB3ZSBoYXZlIHJlbW92ZWQgZnJvbSB0aGUgSFcgYW5k
IHB1dCBiYWNrIG9uIGEgcnVuCj4gPiA+ICAgICAgICAgICogcXVldWUuCj4gPiA+ICAgICAgICAg
ICovCj4gPiA+IC0gICAgICAgc3Bpbl9sb2NrKCZycS0+ZW5naW5lLT5hY3RpdmUubG9jayk7Cj4g
PiA+ICsgICAgICAgc3Bpbl9sb2NrX2lycSgmcnEtPmVuZ2luZS0+YWN0aXZlLmxvY2spOwo+ID4g
PiAgICAgICAgIGxpc3RfZGVsKCZycS0+c2NoZWQubGluayk7Cj4gPiA+ICAgICAgICAgc3Bpbl91
bmxvY2soJnJxLT5lbmdpbmUtPmFjdGl2ZS5sb2NrKTsKPiA+ID4gIAo+ID4gPiBAQCAtMjc4LDkg
KzI3Niw3IEBAIHN0YXRpYyBib29sIGk5MTVfcmVxdWVzdF9yZXRpcmUoc3RydWN0IGkKPiA+ID4g
ICAgICAgICAgICAgICAgIF9fbm90aWZ5X2V4ZWN1dGVfY2IocnEpOwo+ID4gPiAgICAgICAgIH0K
PiA+ID4gICAgICAgICBHRU1fQlVHX09OKCFsaXN0X2VtcHR5KCZycS0+ZXhlY3V0ZV9jYikpOwo+
ID4gPiAtICAgICAgIHNwaW5fdW5sb2NrKCZycS0+bG9jayk7Cj4gPiA+IC0KPiA+ID4gLSAgICAg
ICBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gPiA+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxKCZycS0+
bG9jayk7Cj4gPiAKPiA+IE5vdGhpbmcgc2NyZWFtcyBhYm91dCB0aGUgaW1iYWxhbmNlPyBpcnEg
b2ZmIGZyb20gb25lIGxvY2sgdG8gdGhlIG90aGVyPwo+IAo+IFRoZXJlIGlzIG5vIGltYmFsYW5j
ZSwgaXMgdGhlcmU/IEludGVycnVwdHMgYXJlIGRpc2FibGVkIGFzIHBhcnQgb2YKPiBhY3F1aXJp
bmcgdGhlIGZpcnN0IGxvY2sgYW5kIGVuYWJsZWQgYWdhaW4gYXMgcGFydCBvZiByZWxlYXNpbmcg
dGhlCj4gc2Vjb25kIGxvY2suCj4gSXQgbWF5IG5vdCBsb29rIGJlYXV0aWZ1bC4gCgpTdXJlLCBp
dCdzIGF0IHRoZSBzYW1lIHNjb3BlLCBJIGp1c3QgZXhwZWN0IGF0IHNvbWUgcG9pbnQgbG9ja2Rl
cCB0bwpjb21wbGFpbiA6KQogCj4gSSdtIGp1c3Qgbm90IHN1cmUgaWYgdGhpcwo+IAo+IHwgICAg
ICAgICBzcGluX2xvY2tfaXJxKCZycS0+ZW5naW5lLT5hY3RpdmUubG9jayk7Cj4gfCAgICAgICAg
IGxpc3RfZGVsKCZycS0+c2NoZWQubGluayk7Cj4gfCAgICAgICAgIHNwaW5fdW5sb2NrX2lycSgm
cnEtPmVuZ2luZS0+YWN0aXZlLmxvY2spOwo+IHwgCj4gfCAgICAgICAgIHNwaW5fbG9ja19pcnEo
JnJxLT5sb2NrKTsKPiB8ICAgICAgICAgaTkxNV9yZXF1ZXN0X21hcmtfY29tcGxldGUocnEpOwo+
IOKApgo+IHwgICAgICAgICBzcGluX3VubG9ja19pcnEoJnJxLT5sb2NrKTsKPiAKPiBoYXMgYmVl
biBhdm9pZGVkIGJlY2F1c2UgYW4gaW50ZXJydXB0IGhlcmUgY291bGQgY2hhbmdlIHNvbWV0aGlu
ZyBvciBpZgo+IHRoaXMgaXMganVzdCBhbiBvcHRpbWlzYXRpb24uCgpKdXN0IGF2b2lkaW5nIHRo
ZSBiYWNrLXRvLWJhY2sgZW5hYmxlL2Rpc2FibGUuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
