Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E798D3991
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AD86EBB0;
	Fri, 11 Oct 2019 06:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF7C6E3AE;
 Thu, 10 Oct 2019 18:26:12 +0000 (UTC)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iId8c-0008CA-6O; Thu, 10 Oct 2019 20:26:10 +0200
Date: Thu, 10 Oct 2019 20:26:10 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't disable interrupts
 independently of the lock
Message-ID: <20191010182610.g7r5ieysx7r6kpco@linutronix.de>
References: <20191010160640.6472-1-bigeasy@linutronix.de>
 <157073108748.31572.8357146735184542067@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157073108748.31572.8357146735184542067@skylake-alporthouse-com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
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

T24gMjAxOS0xMC0xMCAxOToxMToyNyBbKzAxMDBdLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlcXVlc3QuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9yZXF1ZXN0LmMKPiA+IEBAIC0yNTEsMTUgKzI1MSwxMyBAQCBz
dGF0aWMgYm9vbCBpOTE1X3JlcXVlc3RfcmV0aXJlKHN0cnVjdCBpCj4gPiAgICAgICAgICAgICAg
ICAgYWN0aXZlLT5yZXRpcmUoYWN0aXZlLCBycSk7Cj4gPiAgICAgICAgIH0KPiA+ICAKPiA+IC0g
ICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiA+IC0KPiA+ICAgICAgICAgLyoKPiA+ICAgICAg
ICAgICogV2Ugb25seSBsb29zZWx5IHRyYWNrIGluZmxpZ2h0IHJlcXVlc3RzIGFjcm9zcyBwcmVl
bXB0aW9uLAo+ID4gICAgICAgICAgKiBhbmQgc28gd2UgbWF5IGZpbmQgb3Vyc2VsdmVzIGF0dGVt
cHRpbmcgdG8gcmV0aXJlIGEgX2NvbXBsZXRlZF8KPiA+ICAgICAgICAgICogcmVxdWVzdCB0aGF0
IHdlIGhhdmUgcmVtb3ZlZCBmcm9tIHRoZSBIVyBhbmQgcHV0IGJhY2sgb24gYSBydW4KPiA+ICAg
ICAgICAgICogcXVldWUuCj4gPiAgICAgICAgICAqLwo+ID4gLSAgICAgICBzcGluX2xvY2soJnJx
LT5lbmdpbmUtPmFjdGl2ZS5sb2NrKTsKPiA+ICsgICAgICAgc3Bpbl9sb2NrX2lycSgmcnEtPmVu
Z2luZS0+YWN0aXZlLmxvY2spOwo+ID4gICAgICAgICBsaXN0X2RlbCgmcnEtPnNjaGVkLmxpbmsp
Owo+ID4gICAgICAgICBzcGluX3VubG9jaygmcnEtPmVuZ2luZS0+YWN0aXZlLmxvY2spOwo+ID4g
IAo+ID4gQEAgLTI3OCw5ICsyNzYsNyBAQCBzdGF0aWMgYm9vbCBpOTE1X3JlcXVlc3RfcmV0aXJl
KHN0cnVjdCBpCj4gPiAgICAgICAgICAgICAgICAgX19ub3RpZnlfZXhlY3V0ZV9jYihycSk7Cj4g
PiAgICAgICAgIH0KPiA+ICAgICAgICAgR0VNX0JVR19PTighbGlzdF9lbXB0eSgmcnEtPmV4ZWN1
dGVfY2IpKTsKPiA+IC0gICAgICAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPiA+IC0KPiA+IC0g
ICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+ID4gKyAgICAgICBzcGluX3VubG9ja19pcnEoJnJx
LT5sb2NrKTsKPiAKPiBOb3RoaW5nIHNjcmVhbXMgYWJvdXQgdGhlIGltYmFsYW5jZT8gaXJxIG9m
ZiBmcm9tIG9uZSBsb2NrIHRvIHRoZSBvdGhlcj8KClRoZXJlIGlzIG5vIGltYmFsYW5jZSwgaXMg
dGhlcmU/IEludGVycnVwdHMgYXJlIGRpc2FibGVkIGFzIHBhcnQgb2YKYWNxdWlyaW5nIHRoZSBm
aXJzdCBsb2NrIGFuZCBlbmFibGVkIGFnYWluIGFzIHBhcnQgb2YgcmVsZWFzaW5nIHRoZQpzZWNv
bmQgbG9jay4KSXQgbWF5IG5vdCBsb29rIGJlYXV0aWZ1bC4gCgpJJ20ganVzdCBub3Qgc3VyZSBp
ZiB0aGlzCgp8ICAgICAgICAgc3Bpbl9sb2NrX2lycSgmcnEtPmVuZ2luZS0+YWN0aXZlLmxvY2sp
Owp8ICAgICAgICAgbGlzdF9kZWwoJnJxLT5zY2hlZC5saW5rKTsKfCAgICAgICAgIHNwaW5fdW5s
b2NrX2lycSgmcnEtPmVuZ2luZS0+YWN0aXZlLmxvY2spOwp8IAp8ICAgICAgICAgc3Bpbl9sb2Nr
X2lycSgmcnEtPmxvY2spOwp8ICAgICAgICAgaTkxNV9yZXF1ZXN0X21hcmtfY29tcGxldGUocnEp
OwrigKYKfCAgICAgICAgIHNwaW5fdW5sb2NrX2lycSgmcnEtPmxvY2spOwoKaGFzIGJlZW4gYXZv
aWRlZCBiZWNhdXNlIGFuIGludGVycnVwdCBoZXJlIGNvdWxkIGNoYW5nZSBzb21ldGhpbmcgb3Ig
aWYKdGhpcyBpcyBqdXN0IGFuIG9wdGltaXNhdGlvbi4KCj4gLUNocmlzCgpTZWJhc3RpYW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
