Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56177722F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 21:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249D66EE46;
	Fri, 26 Jul 2019 19:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4686EE45;
 Fri, 26 Jul 2019 19:30:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17638544-1500050 for multiple; Fri, 26 Jul 2019 20:30:43 +0100
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <alpine.DEB.2.21.1907262116530.1791@nanos.tec.linutronix.de>
References: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
 <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
 <156416793450.30723.5556760526480191131@skylake-alporthouse-com>
 <alpine.DEB.2.21.1907262116530.1791@nanos.tec.linutronix.de>
Message-ID: <156416944205.21451.12269136304831943624@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
Date: Fri, 26 Jul 2019 20:30:42 +0100
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Josh Poimboeuf <jpoimboe@redhat.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBUaG9tYXMgR2xlaXhuZXIgKDIwMTktMDctMjYgMjA6MTg6MzIpCj4gT24gRnJpLCAy
NiBKdWwgMjAxOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gUXVvdGluZyBUaG9tYXMgR2xlaXhu
ZXIgKDIwMTktMDctMjUgMjI6NTU6NDUpCj4gPiA+IE9uIFRodSwgMjUgSnVsIDIwMTksIEpvc2gg
UG9pbWJvZXVmIHdyb3RlOgo+ID4gPiAKPiA+ID4gPiBPYmp0b29sIHJlcG9ydHM6Cj4gPiA+ID4g
Cj4gPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5v
OiB3YXJuaW5nOiBvYmp0b29sOiAuYWx0aW5zdHJfcmVwbGFjZW1lbnQrMHgzNjogcmVkdW5kYW50
IFVBQ0NFU1MgZGlzYWJsZQo+ID4gPiA+IAo+ID4gPiA+IF9fY29weV9mcm9tX3VzZXIoKSBhbHJl
YWR5IGRvZXMgYm90aCBTVEFDIGFuZCBDTEFDLCBzbyB0aGUKPiA+ID4gPiB1c2VyX2FjY2Vzc19l
bmQoKSBpbiBpdHMgZXJyb3IgcGF0aCBhZGRzIGFuIGV4dHJhIHVubmVjZXNzYXJ5IENMQUMuCj4g
PiA+ID4gCj4gPiA+ID4gRml4ZXM6IDBiMmM4ZjhiNmIwYyAoImk5MTU6IGZpeCBtaXNzaW5nIHVz
ZXJfYWNjZXNzX2VuZCgpIGluIHBhZ2UgZmF1bHQgZXhjZXB0aW9uIGNhc2UiKQo+ID4gPiA+IFJl
cG9ydGVkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiA+ID4gPiBS
ZXBvcnRlZC1ieTogU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWlsLmNvbT4KPiA+ID4gPiBB
Y2tlZC1ieTogUGV0ZXIgWmlqbHN0cmEgKEludGVsKSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4g
PiA+ID4gVGVzdGVkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNv
bT4KPiA+ID4gPiBUZXN0ZWQtYnk6IFNlZGF0IERpbGVrIDxzZWRhdC5kaWxla0BnbWFpbC5jb20+
Cj4gPiA+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9p
c3N1ZXMvNjE3Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9l
QHJlZGhhdC5jb20+Cj4gPiA+IAo+ID4gPiBSZXZpZXdlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0
Z2x4QGxpbnV0cm9uaXguZGU+Cj4gPiAKPiA+IFdoaWNoIHRyZWUgZG8geW91IHBsYW4gdG8gYXBw
bHkgaXQgdG8/IEkgY2FuIHB1dCBpbiBkcm0taW50ZWwsIGFuZCB3aXRoCj4gPiB0aGUgZml4ZXMg
dGFnIGl0IHdpbGwgcGVyY29sYXRlIHRocm91Z2ggdG8gNS4zIGFuZCBiZXlvbmQsIGJ1dCBpZiB5
b3UKPiA+IHdhbnQgdG8gYXBwbHkgaXQgZGlyZWN0bHkgdG8gc3F1YXNoIHRoZSBidWlsZCB3YXJu
aW5ncywgZmVlbCBmcmVlLgo+IAo+IEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IGl0IGludG8gNS4z
LiBJIGNhbiByb3V0ZSBpdCBsaW51eHdhcmRzIGlmIHlvdSBnaXZlCj4gYW4gQWNrZWQtYnksIGJ1
dCBJJ20gaGFwcHkgdG8gaGFuZCBpdCB0byB5b3UgOikKCkFja2VkLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
