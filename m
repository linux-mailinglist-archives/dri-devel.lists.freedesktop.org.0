Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95678100FBA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 01:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DE96E858;
	Tue, 19 Nov 2019 00:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F011C6E858
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 00:10:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C6AF563;
 Tue, 19 Nov 2019 01:10:55 +0100 (CET)
Date: Tue, 19 Nov 2019 02:10:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 10/13] ARM: dts: iwg20d-q7-common: Add LCD support
Message-ID: <20191119001040.GJ5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-11-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-11-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574122258;
 bh=XFfX/G7NzxqQJnTAHlH2fQVX+Bu3b8f6Wws4eHPfM18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZN+K8HElpgO7xbpEGcacnAQOAu2goym+RxZLiXaBlXjW6ello1hsY8LPZ7NWTt0Dq
 huHhazVuHL3u6G99lVTOPi+vldsHs36dVlRw8D+99k1pTcaMpVz2zfCm9oo0Pco3Wj
 lqKqgvCx6j5QcHBfdnrYbxGLaTxUDuvhUpocaBuY=
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

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgTm92IDEzLCAy
MDE5IGF0IDAzOjUxOjI5UE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBUaGUgaXdn
MjBkIGNvbWVzIHdpdGggYSA3IiBjYXBhY2l0aXZlIHRvdWNoIHNjcmVlbiwgdGhlcmVmb3JlCj4g
YWRkIHN1cHBvcnQgZm9yIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgoKQWNrZWQtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCkkgZXhwZWN0IEdlZXJ0IHRv
IHBpY2sgdGhpcyB1cC4KCj4gLS0tCj4gdjMtPnY0Ogo+ICogUmV3b3JrZWQgY29tcGF0aWJpbGl0
eSBvZiBEVCBub2RlIGx2ZHMtcmVjZWl2ZXIKPiAqIHMvcG93ZXJkb3duL3Bvd2VyZG93bi1ncGlv
cy9nIGluIGx2ZHMtcmVjZWl2ZXIKPiAqIFJld29ya2VkIGNvbXBhdGliaWxpdHkgb2YgRFQgbm9k
ZSBwYW5lbAo+IHYyLT52MzoKPiAqIE5vIGNoYW5nZQo+IHYxLT52MjoKPiAqIE5vIGNoYW5nZQo+
IC0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctY29tbW9uLmR0c2kgIHwgODUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBk
LXE3LWRiY20tY2EuZHRzaSB8ICAxIC0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2l3
ZzIwZC1xNy1jb21tb24uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24u
ZHRzaQo+IGluZGV4IGFlNzVhMWRiLi5hYjVhZTkzIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3
ZzIwZC1xNy1jb21tb24uZHRzaQo+IEBAIC00Niw2ICs0Niw0OSBAQAo+ICAJCWNsb2NrLWZyZXF1
ZW5jeSA9IDwyNjAwMDAwMD47Cj4gIAl9Owo+ICAKPiArCWxjZF9iYWNrbGlnaHQ6IGJhY2tsaWdo
dCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsKPiArCj4gKwkJcHdtcyA9IDwm
cHdtMyAwIDUwMDAwMDAgMD47Cj4gKwkJYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCA0IDggMTYgMzIg
NjQgMTI4IDI1NT47Cj4gKwkJZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDc+Owo+ICsJCWVu
YWJsZS1ncGlvcyA9IDwmZ3BpbzUgMTQgR1BJT19BQ1RJVkVfSElHSD47Cj4gKwl9Owo+ICsKPiAr
CWx2ZHMtcmVjZWl2ZXIgewo+ICsJCWNvbXBhdGlibGUgPSAidGksZHM5MGNmMzg0YSIsICJsdmRz
LWRlY29kZXIiOwo+ICsJCXBvd2VyZG93bi1ncGlvcyA9IDwmZ3BpbzcgMjUgR1BJT19BQ1RJVkVf
TE9XPjsKPiArCj4gKwkJcG9ydHMgewo+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkJ
I3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsJCQlwb3J0QDAgewo+ICsJCQkJcmVnID0gPDA+Owo+
ICsJCQkJbHZkc19yZWNlaXZlcl9pbjogZW5kcG9pbnQgewo+ICsJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmbHZkczBfb3V0PjsKPiArCQkJCX07Cj4gKwkJCX07Cj4gKwkJCXBvcnRAMSB7Cj4gKwkJ
CQlyZWcgPSA8MT47Cj4gKwkJCQlsdmRzX3JlY2VpdmVyX291dDogZW5kcG9pbnQgewo+ICsJCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW4+Owo+ICsJCQkJfTsKPiArCQkJfTsKPiArCQl9
Owo+ICsJfTsKPiArCj4gKwlwYW5lbCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJlZHQsZXRtMDcwMGcw
ZGg2IjsKPiArCQliYWNrbGlnaHQgPSA8JmxjZF9iYWNrbGlnaHQ+Owo+ICsKPiArCQlwb3J0IHsK
PiArCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZk
c19yZWNlaXZlcl9vdXQ+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwl9Owo+ICsKPiAgCXJlZ18xcDV2
OiAxcDV2IHsKPiAgCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4gIAkJcmVndWxh
dG9yLW5hbWUgPSAiMVA1ViI7Cj4gQEAgLTEyMCw2ICsxNjMsMTggQEAKPiAgCXN0YXR1cyA9ICJv
a2F5IjsKPiAgfTsKPiAgCj4gKyZkdSB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+
ICsmZ3BpbzIgewo+ICsJdG91Y2gtaW50ZXJydXB0IHsKPiArCQlncGlvLWhvZzsKPiArCQlncGlv
cyA9IDwxMiBHUElPX0FDVElWRV9MT1c+Owo+ICsJCWlucHV0Owo+ICsJfTsKPiArfTsKPiArCj4g
ICZoc3VzYiB7Cj4gIAlzdGF0dXMgPSAib2theSI7Cj4gIAlwaW5jdHJsLTAgPSA8JnVzYjBfcGlu
cz47Cj4gQEAgLTE0Nyw2ICsyMDIsMjUgQEAKPiAgCQlWRERJTy1zdXBwbHkgPSA8JnJlZ18zcDN2
PjsKPiAgCQlWRERELXN1cHBseSA9IDwmcmVnXzFwNXY+Owo+ICAJfTsKPiArCj4gKwl0b3VjaDog
dG91Y2hwYW5lbEAzOCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJlZHQsZWR0LWZ0NTQwNiI7Cj4gKwkJ
cmVnID0gPDB4Mzg+Owo+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8yPjsKPiArCQlpbnRl
cnJ1cHRzID0gPDEyIElSUV9UWVBFX0VER0VfRkFMTElORz47Cj4gKwl9Owo+ICt9Owo+ICsKPiAr
Jmx2ZHMwIHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArCj4gKwlwb3J0cyB7Cj4gKwkJcG9ydEAx
IHsKPiArCQkJbHZkczBfb3V0OiBlbmRwb2ludCB7Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8
Jmx2ZHNfcmVjZWl2ZXJfaW4+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwl9Owo+ICB9Owo+ICAKPiAg
JnBjaTAgewo+IEBAIC0xODAsNiArMjU0LDExIEBACj4gIAkJZnVuY3Rpb24gPSAiaTJjMiI7Cj4g
IAl9Owo+ICAKPiArCXB3bTNfcGluczogcHdtMyB7Cj4gKwkJZ3JvdXBzID0gInB3bTMiOwo+ICsJ
CWZ1bmN0aW9uID0gInB3bTMiOwo+ICsJfTsKPiArCj4gIAlzY2lmMF9waW5zOiBzY2lmMCB7Cj4g
IAkJZ3JvdXBzID0gInNjaWYwX2RhdGFfZCI7Cj4gIAkJZnVuY3Rpb24gPSAic2NpZjAiOwo+IEBA
IC0yMTgsNiArMjk3LDEyIEBACj4gIAl9Owo+ICB9Owo+ICAKPiArJnB3bTMgewo+ICsJcGluY3Ry
bC0wID0gPCZwd20zX3BpbnM+Owo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiArCXN0
YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4gICZyY2FyX3NvdW5kIHsKPiAgCXBpbmN0cmwtMCA9
IDwmc291bmRfcGlucz47Cj4gIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctZGJjbS1jYS5kdHNpIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaQo+IGluZGV4IDBlOTlkZjIuLmVkZTJlMGMg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaQo+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1kYmNtLWNhLmR0c2kKPiBAQCAtMzks
NyArMzksNiBAQAo+ICAmZHUgewo+ICAJcGluY3RybC0wID0gPCZkdV9waW5zPjsKPiAgCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gLQlzdGF0dXMgPSAib2theSI7Cj4gIAo+ICAJcG9ydHMg
ewo+ICAJCXBvcnRAMCB7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
