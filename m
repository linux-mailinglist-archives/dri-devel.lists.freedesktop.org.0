Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854FFB1A34
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 10:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4106EEE3;
	Fri, 13 Sep 2019 08:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED14B6EEDE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:53:30 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1i8hKa-0006rN-C8; Fri, 13 Sep 2019 10:53:28 +0200
Message-ID: <a4f36fed24c8c2a1e9228ee178fe16f2957b3ffb.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] drm/etnaviv: print MMU exception cause
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Fri, 13 Sep 2019 10:53:25 +0200
In-Reply-To: <20190913055052.25599-2-christian.gmeiner@gmail.com>
References: <20190913055052.25599-1-christian.gmeiner@gmail.com>
 <20190913055052.25599-2-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnIsIDIwMTktMDktMTMgYXQgMDc6NTAgKzAyMDAsIENocmlzdGlhbiBHbWVpbmVyIHdyb3Rl
Ogo+IE1pZ2h0IGJlIHVzZWZ1bCB3aGVuIGRlYnVnZ2luZyBNTVUgZXhjZXB0aW9ucy4KPiAKPiBD
aGFuZ2VzIGluIFYyOgo+ICAtIFVzZSBhIHN0YXRpYyBhcnJheSBvZiBzdHJpbmcgZm9yIGVycm9y
IG1lc3NhZ2UgYXMgc3VnZ2VzdGVkCj4gICAgYnkgTHVjYXMgU3RhY2guCgpQbGVhc2UgbW92ZSB0
aG9zZSBjaGFuZ2Vsb2dzIGJlbG93IHRoZSAzIGRhc2hlcywgc28gdGhleSBkb24ndCBlbmQgdXAK
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBUaGV5IGRvbid0IHJlYWxseSBhZGQgYW55IHZhbHVlIHRv
IHRoZQpwZXJzaXN0ZW50IGtlcm5lbCBoaXN0b3J5LgoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIHwgMTUgKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X2dwdS5jCj4gaW5kZXggZDQ3ZDFhOGUwMjE5Li5iOGNkODUxNTNmZTAgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKPiBAQCAtMTM1MSw2ICsxMzUxLDE1IEBA
IHN0YXRpYyB2b2lkIHN5bmNfcG9pbnRfd29ya2VyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykK
PiAgCj4gIHN0YXRpYyB2b2lkIGR1bXBfbW11X2ZhdWx0KHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1
KQo+ICB7Cj4gKwlzdGF0aWMgY29uc3QgY2hhciAqZXJyb3JzW10gPSB7Cj4gKwkJInNsYXZlIG5v
dCBwcmVzZW50IiwKPiArCQkicGFnZSBub3QgcHJlc2VudCIsCj4gKwkJIndyaXRlIHZpb2xhdGlv
biIsCj4gKwkJIm91dCBvZiBib3VuZCIsCj4gKwkJInJlYWQgc2VjdXJpdHkgdmlvbGF0aW9uIiwK
PiArCQkid3JpdGUgc2VjdXJpdHkgdmlvbGF0aW9uIiwKPiArCX07Cj4gKwo+ICAJdTMyIHN0YXR1
c19yZWcsIHN0YXR1czsKPiAgCWludCBpOwo+ICAKPiBAQCAtMTM2NCwxMCArMTM3MywxNiBAQCBz
dGF0aWMgdm9pZCBkdW1wX21tdV9mYXVsdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKPiAgCj4g
IAlmb3IgKGkgPSAwOyBpIDwgNDsgaSsrKSB7Cj4gIAkJdTMyIGFkZHJlc3NfcmVnOwo+ICsJCWNv
bnN0IGNoYXIgKmVycm9yID0gInVua25vd24gc3RhdGUiOwo+ICAKPiAgCQlpZiAoIShzdGF0dXMg
JiAoVklWU19NTVV2Ml9TVEFUVVNfRVhDRVBUSU9OMF9fTUFTSyA8PCAoaSAqIDQpKSkpCj4gIAkJ
CWNvbnRpbnVlOwo+ICAKPiArCQlpZiAoc3RhdHVzIDwgQVJSQVlfU0laRShlcnJvcnMpKQo+ICsJ
CQllcnJvciA9IGVycm9yc1tzdGF0dXNdOwoKSHVoPyBUaGlzIHdvbid0IHdvcmsuIFRoZSBzdGF0
dXMgcmVnaXN0ZXIgaXMgYSBiaXRmaWVsZCwgbm90IGFuIGludGVnZXIKc28geW91IG5lZWQgdG8g
bWFwIHRoZSBiaXQgcG9zaXRpb24gdG8gdGhlIGFycmF5IGluZGV4IHZpYSBmZnMoKSBvcgpzb21l
dGhpbmcgbGlrZSB0aGF0LgoKUmVnYXJkcywKTHVjYXMKCj4gKwo+ICsJCWRldl9lcnJfcmF0ZWxp
bWl0ZWQoZ3B1LT5kZXYsICJNTVUgJWQgJXNcbiIsIGksIGVycm9yKTsKPiArCj4gIAkJaWYgKGdw
dS0+c2VjX21vZGUgPT0gRVROQV9TRUNfTk9ORSkKPiAgCQkJYWRkcmVzc19yZWcgPSBWSVZTX01N
VXYyX0VYQ0VQVElPTl9BRERSKGkpOwo+ICAJCWVsc2UKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
