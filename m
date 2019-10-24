Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 578AFE2C28
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 10:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502616E178;
	Thu, 24 Oct 2019 08:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BAA6E177;
 Thu, 24 Oct 2019 08:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 8A2A3FB03;
 Thu, 24 Oct 2019 10:28:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_m2s9Gqoqld; Thu, 24 Oct 2019 10:28:58 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id BB9D649CFC; Thu, 24 Oct 2019 10:28:53 +0200 (CEST)
Date: Thu, 24 Oct 2019 10:28:53 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/etnaviv: reinstate MMUv1 command buffer window
 check
Message-ID: <20191024082853.GA6812@bogon.m.sigxcpu.org>
References: <20191016142716.10168-1-l.stach@pengutronix.de>
 <20191016142716.10168-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016142716.10168-2-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCk9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA0OjI3OjE2UE0gKzAyMDAsIEx1Y2Fz
IFN0YWNoIHdyb3RlOgo+IFRoZSBzd2l0Y2ggdG8gcGVyLXByb2Nlc3MgYWRkcmVzcyBzcGFjZXMg
ZXJyb25lb3VzbHkgZHJvcHBlZCB0aGUgY2hlY2sKPiB3aGljaCB2YWxpZGF0ZWQgdGhhdCB0aGUg
Y29tbWFuZCBidWZmZXIgaXMgbWFwcGVkIHRocm91Z2ggdGhlIGxpbmVhcgo+IGFwcGVydHVyZSBh
cyByZXF1aXJlZCBieSB0aGUgaGFyZHdhcmUuIFRoaXMgdHVybmVkIGEgc3lzdGVtCj4gbWlzY29u
ZmlndXJhdGlvbiB3aXRoIGEgaGVscGZ1bCBlcnJvciBtZXNzYWdlIGludG8gYSB2ZXJ5IGhhcmQg
dG8KPiBkZWJ1ZyBpc3N1ZS4gUmVpbnN0YXRlIHRoZSBjaGVjayBhdCB0aGUgYXBwcm9wcmlhdGUg
bG9jYXRpb24uCj4gCj4gRml4ZXM6IDE3ZTQ2NjBhZTNkNyAoZHJtL2V0bmF2aXY6IGltcGxlbWVu
dCBwZXItcHJvY2VzcyBhZGRyZXNzIHNwYWNlcyBvbiBNTVV2MikKPiBTaWduZWQtb2ZmLWJ5OiBM
dWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUuYyB8IDE3ICsrKysrKysrKysrKysrLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUuYwo+IGluZGV4IDM1ZWJhZTZhMWJlNy4uMzYwN2QzNDhj
Mjk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jCj4gQEAgLTMyOCwx
MiArMzI4LDIzIEBAIGV0bmF2aXZfaW9tbXVfY29udGV4dF9pbml0KHN0cnVjdCBldG5hdml2X2lv
bW11X2dsb2JhbCAqZ2xvYmFsLAo+ICAKPiAgCXJldCA9IGV0bmF2aXZfY21kYnVmX3N1YmFsbG9j
X21hcChzdWJhbGxvYywgY3R4LCAmY3R4LT5jbWRidWZfbWFwcGluZywKPiAgCQkJCQkgIGdsb2Jh
bC0+bWVtb3J5X2Jhc2UpOwo+IC0JaWYgKHJldCkgewo+IC0JCWdsb2JhbC0+b3BzLT5mcmVlKGN0
eCk7Cj4gLQkJcmV0dXJuIE5VTEw7Cj4gKwlpZiAocmV0KQo+ICsJCWdvdG8gb3V0X2ZyZWU7Cj4g
Kwo+ICsJaWYgKGdsb2JhbC0+dmVyc2lvbiA9PSBFVE5BVklWX0lPTU1VX1YxICYmCj4gKwkgICAg
Y3R4LT5jbWRidWZfbWFwcGluZy5pb3ZhID4gMHg4MDAwMDAwMCkgewo+ICsJCWRldl9lcnIoZ2xv
YmFsLT5kZXYsCj4gKwkJICAgICAgICAiY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZCBtZW1v
cnkgd2luZG93XG4iKTsKPiArCQlnb3RvIG91dF91bm1hcDsKPiAgCX0KPiAgCj4gIAlyZXR1cm4g
Y3R4Owo+ICsKPiArb3V0X3VubWFwOgo+ICsJZXRuYXZpdl9jbWRidWZfc3ViYWxsb2NfdW5tYXAo
Y3R4LCAmY3R4LT5jbWRidWZfbWFwcGluZyk7Cj4gK291dF9mcmVlOgo+ICsJZ2xvYmFsLT5vcHMt
PmZyZWUoY3R4KTsKPiArCXJldHVybiBOVUxMOwo+ICB9Cj4gIAo+ICB2b2lkIGV0bmF2aXZfaW9t
bXVfcmVzdG9yZShzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwKClJldmlld2VkLWJ5OiBHdWlkbyBH
w7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgoKQ2hlZXJzLAogLS0gR3VpZG8KCj4gLS0gCj4gMi4y
MC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBldG5hdml2IG1haWxpbmcgbGlzdAo+IGV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
