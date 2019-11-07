Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287F5F39E9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 21:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216216E526;
	Thu,  7 Nov 2019 20:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56DA6E526
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:55:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E4D671D;
 Thu,  7 Nov 2019 21:55:31 +0100 (CET)
Date: Thu, 7 Nov 2019 22:55:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 6/7] ARM: dts: iwg20d-q7-common: Add LCD support
Message-ID: <20191107205520.GR24983@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573157463-14070-7-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573160131;
 bh=T/JTmFFKWPUIC/UNcZMUFodIIgOi+wflNsrXPviHW2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XuK82nb+Q1K+FJVDzzYmfvW2S0k/ajGaf3N3O9VrdXbRmJ5Y4jP0h9qnPIJCqb30s
 5S8M96lKYTy+8H7rzFizbPsvuEF+4sPbArZ7bdDjqNL02tO/U9SOqqROB58QURScWx
 LQ591kEzntMEBbp32XVyoE26SFycos1p21+5Dthk=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFRodSwgTm92IDA3LCAy
MDE5IGF0IDA4OjExOjAyUE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBUaGUgaXdn
MjBkIGNvbWVzIHdpdGggYSA3IiBjYXBhY2l0aXZlIHRvdWNoIHNjcmVlbiwgdGhlcmVmb3JlCj4g
YWRkIHN1cHBvcnQgZm9yIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IAo+IC0tLQo+IHYyLT52MzoKPiAqIE5v
IGNoYW5nZQo+IHYxLT52MjoKPiAqIE5vIGNoYW5nZQo+IC0tLQo+ICBhcmNoL2FybS9ib290L2R0
cy9pd2cyMGQtcTctY29tbW9uLmR0c2kgIHwgODUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaSB8ICAxIC0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaSBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQo+IGluZGV4IGFlNzVhMWRiLi4z
NDI4YjhkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24u
ZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQo+IEBA
IC00Niw2ICs0Niw0OSBAQAo+ICAJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNjAwMDAwMD47Cj4gIAl9
Owo+ICAKPiArCWxjZF9iYWNrbGlnaHQ6IGJhY2tsaWdodCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJw
d20tYmFja2xpZ2h0IjsKPiArCj4gKwkJcHdtcyA9IDwmcHdtMyAwIDUwMDAwMDAgMD47Cj4gKwkJ
YnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCA0IDggMTYgMzIgNjQgMTI4IDI1NT47Cj4gKwkJZGVmYXVs
dC1icmlnaHRuZXNzLWxldmVsID0gPDc+Owo+ICsJCWVuYWJsZS1ncGlvcyA9IDwmZ3BpbzUgMTQg
R1BJT19BQ1RJVkVfSElHSD47Cj4gKwl9Owo+ICsKPiArCWx2ZHMtcmVjZWl2ZXIgewo+ICsJCWNv
bXBhdGlibGUgPSAibHZkcy1kZWNvZGVyIjsKCkEgc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmcg
aXMgcmVxdWlyZWQuCgpJIHRoaW5rIHRoZSBsdmRzLWRlY29kZXIgZHJpdmVyIHNob3VsZCBlcnJv
ciBvdXQgYXQgcHJvYmUgdGltZSBpZiBvbmx5Cm9uZSBjb21wYXRpYmxlIHN0cmluZyBpcyBsaXN0
ZWQuCgo+ICsJCXBvd2VyZG93biA9IDwmZ3BpbzcgMjUgR1BJT19BQ1RJVkVfTE9XPjsKCnBvd2Vy
ZG93bi1ncGlvcyA/Cgo+ICsKPiArCQlwb3J0cyB7Cj4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiArCj4gKwkJCXBvcnRAMCB7Cj4gKwkJCQlyZWcg
PSA8MD47Cj4gKwkJCQlsdmRzX3JlY2VpdmVyX2luOiBlbmRwb2ludCB7Cj4gKwkJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZsdmRzMF9vdXQ+Owo+ICsJCQkJfTsKPiArCQkJfTsKPiArCQkJcG9ydEAx
IHsKPiArCQkJCXJlZyA9IDwxPjsKPiArCQkJCWx2ZHNfcmVjZWl2ZXJfb3V0OiBlbmRwb2ludCB7
Cj4gKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbj47Cj4gKwkJCQl9Owo+ICsJCQl9
Owo+ICsJCX07Cj4gKwl9Owo+ICsKPiArCXBhbmVsIHsKPiArCQljb21wYXRpYmxlID0gImVkdCxl
dG0wNzAwZzBkaDYiLCAic2ltcGxlLXBhbmVsIjsKClRoZXJlJ3Mgbm8gInNpbXBsZS1wYW5lbCIg
Y29tcGF0aWJsZSBzdHJpbmcgZGVmaW5lZCBhbnl3aGVyZSBhcyBmYXIgYXMgSQpjYW4gdGVsbC4K
Cj4gKwkJYmFja2xpZ2h0ID0gPCZsY2RfYmFja2xpZ2h0PjsKPiArCj4gKwkJcG9ydCB7Cj4gKwkJ
CXBhbmVsX2luOiBlbmRwb2ludCB7Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNfcmVj
ZWl2ZXJfb3V0PjsKPiArCQkJfTsKPiArCQl9Owo+ICsJfTsKPiArCj4gIAlyZWdfMXA1djogMXA1
diB7Cj4gIAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+ICAJCXJlZ3VsYXRvci1u
YW1lID0gIjFQNVYiOwo+IEBAIC0xMjAsNiArMTYzLDE4IEBACj4gIAlzdGF0dXMgPSAib2theSI7
Cj4gIH07Cj4gIAo+ICsmZHUgewo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+ICsKPiArJmdw
aW8yIHsKPiArCXRvdWNoLWludGVycnVwdCB7Cj4gKwkJZ3Bpby1ob2c7Cj4gKwkJZ3Bpb3MgPSA8
MTIgR1BJT19BQ1RJVkVfTE9XPjsKPiArCQlpbnB1dDsKPiArCX07CgpEbyB5b3UgbmVlZCB0aGlz
LCB3aXRoIHRoZSB0b3VjaHBhbmVsQDM4IG5vZGUgYWxyZWFkeSBsaXN0aW5nIHRoZQppbnRlcnJ1
cHQgPwoKPiArfTsKPiArCj4gICZoc3VzYiB7Cj4gIAlzdGF0dXMgPSAib2theSI7Cj4gIAlwaW5j
dHJsLTAgPSA8JnVzYjBfcGlucz47Cj4gQEAgLTE0Nyw2ICsyMDIsMjUgQEAKPiAgCQlWRERJTy1z
dXBwbHkgPSA8JnJlZ18zcDN2PjsKPiAgCQlWRERELXN1cHBseSA9IDwmcmVnXzFwNXY+Owo+ICAJ
fTsKPiArCj4gKwl0b3VjaDogdG91Y2hwYW5lbEAzOCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJlZHQs
ZWR0LWZ0NTQwNiI7Cj4gKwkJcmVnID0gPDB4Mzg+Owo+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8
JmdwaW8yPjsKPiArCQlpbnRlcnJ1cHRzID0gPDEyIElSUV9UWVBFX0VER0VfRkFMTElORz47Cj4g
Kwl9Owo+ICt9Owo+ICsKPiArJmx2ZHMwIHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArCj4gKwlw
b3J0cyB7Cj4gKwkJcG9ydEAxIHsKPiArCQkJbHZkczBfb3V0OiBlbmRwb2ludCB7Cj4gKwkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNfcmVjZWl2ZXJfaW4+Owo+ICsJCQl9Owo+ICsJCX07Cj4g
Kwl9Owo+ICB9Owo+ICAKPiAgJnBjaTAgewo+IEBAIC0xODAsNiArMjU0LDExIEBACj4gIAkJZnVu
Y3Rpb24gPSAiaTJjMiI7Cj4gIAl9Owo+ICAKPiArCXB3bTNfcGluczogcHdtMyB7Cj4gKwkJZ3Jv
dXBzID0gInB3bTMiOwo+ICsJCWZ1bmN0aW9uID0gInB3bTMiOwo+ICsJfTsKPiArCj4gIAlzY2lm
MF9waW5zOiBzY2lmMCB7Cj4gIAkJZ3JvdXBzID0gInNjaWYwX2RhdGFfZCI7Cj4gIAkJZnVuY3Rp
b24gPSAic2NpZjAiOwo+IEBAIC0yMTgsNiArMjk3LDEyIEBACj4gIAl9Owo+ICB9Owo+ICAKPiAr
JnB3bTMgewo+ICsJcGluY3RybC0wID0gPCZwd20zX3BpbnM+Owo+ICsJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4gICZyY2FyX3NvdW5k
IHsKPiAgCXBpbmN0cmwtMCA9IDwmc291bmRfcGlucz47Cj4gIAlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOwo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctZGJjbS1j
YS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaQo+IGluZGV4
IDBlOTlkZjIuLmVkZTJlMGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBk
LXE3LWRiY20tY2EuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1kYmNt
LWNhLmR0c2kKPiBAQCAtMzksNyArMzksNiBAQAo+ICAmZHUgewo+ICAJcGluY3RybC0wID0gPCZk
dV9waW5zPjsKPiAgCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gLQlzdGF0dXMgPSAib2th
eSI7Cj4gIAo+ICAJcG9ydHMgewo+ICAJCXBvcnRAMCB7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
