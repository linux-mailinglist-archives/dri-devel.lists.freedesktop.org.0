Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2836F10F8B6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 08:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1586E3DF;
	Tue,  3 Dec 2019 07:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5346E3DF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 07:29:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1BA7309;
 Tue,  3 Dec 2019 08:29:38 +0100 (CET)
Date: Tue, 3 Dec 2019 09:29:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] ARM: dts: am335x-evm: Use drm simple-panel instead of
 tilcdc-panel
Message-ID: <20191203072932.GL4730@pendragon.ideasonboard.com>
References: <20191202185729.12921-1-jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202185729.12921-1-jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575358179;
 bh=7cZbYLONLyPLh46EPhOTsWVY7T7ktT6/ScSQB9363YY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Leqg0R6YUsSnpROUbCxEy4cfmiGkOCfTGZM43r+n1uEKkbWIRkUzyiD+ZwmPZv+2D
 bUxAHCy4NgvqVM4tmy418aSLwIEH3jYkFVeI6UtOl5Kfo6RKPrzEueYrqlskH8QzTu
 o7Tzgq8KrwIdS85VsaLK+h90k3XWrbPCAGYKMn5c=
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
Cc: devicetree@vger.kernel.org, tony@atomide.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 bcousson@baylibre.com, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBEZWMgMDIsIDIwMTkg
YXQgMDg6NTc6MjlQTSArMDIwMCwgSnlyaSBTYXJoYSB3cm90ZToKPiBNb3ZlIHRvIHVzZSB0aGUg
bmV3IGRybSBwYW5lbCBzdXBwb3J0IGluIHRpbGNkYyB0b2dldGhlciB3aXRoIGFkZGVkCj4gInRm
YyxzOTcwMHJ0d3Y0M3RyLTAxYiItcGFuZWwgc3VwcG9ydCBpbiBkcm0gcGFuZWwtc2ltcGxlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gLS0tCj4gInRmYyxz
OTcwMHJ0d3Y0M3RyLTAxYiIgaW4gcGFuZWwtc2ltcGxlIGhhcyBiZWVuIGluIGZvciBzb21lIHRp
bWUgbm93Cj4gc28gaXQgaXMgYWJvdXQgdGltZSB0byBnZXQgdGhpcyBpbiB0b28uCj4gCj4gIGFy
Y2gvYXJtL2Jvb3QvZHRzL2FtMzM1eC1ldm0uZHRzIHwgNDQgKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDI2IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hbTMzNXgtZXZtLmR0
cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzM1eC1ldm0uZHRzCj4gaW5kZXggYTAwMTQ1NzA1Yzli
Li4wZTI4NmExYzljYzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWV2
bS5kdHMKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9hbTMzNXgtZXZtLmR0cwo+IEBAIC0xMTMs
NyArMTEzLDcgQEAKPiAgCQl9Owo+ICAJfTsKPiAgCj4gLQliYWNrbGlnaHQgewo+ICsJYmFja2xp
Z2h0OiBiYWNrbGlnaHQgewo+ICAJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7Cj4gIAkJ
cHdtcyA9IDwmZWNhcDAgMCA1MDAwMCAwPjsKPiAgCQlicmlnaHRuZXNzLWxldmVscyA9IDwwIDUx
IDUzIDU2IDYyIDc1IDEwMSAxNTIgMjU1PjsKPiBAQCAtMTIxLDM1ICsxMjEsMTkgQEAKPiAgCX07
Cj4gIAo+ICAJcGFuZWwgewo+IC0JCWNvbXBhdGlibGUgPSAidGksdGlsY2RjLHBhbmVsIjsKPiAr
CQljb21wYXRpYmxlID0gInRmYyxzOTcwMHJ0d3Y0M3RyLTAxYiI7Cj4gKwo+ICAJCXN0YXR1cyA9
ICJva2F5IjsKCkkgdGhpbmsgdGhpcyBjYW4gYmUgZHJvcHBlZCBhcyBpdCdzIGltcGxpY2l0LgoK
PiArCj4gIAkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiAgCQlwaW5jdHJsLTAgPSA8Jmxj
ZF9waW5zX3MwPjsKPiAtCQlwYW5lbC1pbmZvIHsKPiAtCQkJYWMtYmlhcyAgICAgICAgICAgPSA8
MjU1PjsKPiAtCQkJYWMtYmlhcy1pbnRycHQgICAgPSA8MD47Cj4gLQkJCWRtYS1idXJzdC1zeiAg
ICAgID0gPDE2PjsKPiAtCQkJYnBwICAgICAgICAgICAgICAgPSA8MzI+Owo+IC0JCQlmZGQgICAg
ICAgICAgICAgICA9IDwweDgwPjsKPiAtCQkJc3luYy1lZGdlICAgICAgICAgPSA8MD47Cj4gLQkJ
CXN5bmMtY3RybCAgICAgICAgID0gPDE+Owo+IC0JCQlyYXN0ZXItb3JkZXIgICAgICA9IDwwPjsK
PiAtCQkJZmlmby10aCAgICAgICAgICAgPSA8MD47Cj4gLQkJfTsKPiAgCj4gLQkJZGlzcGxheS10
aW1pbmdzIHsKPiAtCQkJODAweDQ4MHA2MiB7Cj4gLQkJCQljbG9jay1mcmVxdWVuY3kgPSA8MzAw
MDAwMDA+Owo+IC0JCQkJaGFjdGl2ZSA9IDw4MDA+Owo+IC0JCQkJdmFjdGl2ZSA9IDw0ODA+Owo+
IC0JCQkJaGZyb250LXBvcmNoID0gPDM5PjsKPiAtCQkJCWhiYWNrLXBvcmNoID0gPDM5PjsKPiAt
CQkJCWhzeW5jLWxlbiA9IDw0Nz47Cj4gLQkJCQl2YmFjay1wb3JjaCA9IDwyOT47Cj4gLQkJCQl2
ZnJvbnQtcG9yY2ggPSA8MTM+Owo+IC0JCQkJdnN5bmMtbGVuID0gPDI+Owo+IC0JCQkJaHN5bmMt
YWN0aXZlID0gPDE+Owo+IC0JCQkJdnN5bmMtYWN0aXZlID0gPDE+Owo+ICsJCWJhY2tsaWdodCA9
IDwmYmFja2xpZ2h0PjsKCkkgd291bGQgYWRkIGEgYmxhbmsgbGluZSBoZXJlLgoKPiArCQlwb3J0
cyB7Cj4gKwkJCXBvcnQgewo+ICsJCQkJcGFuZWxfMDogZW5kcG9pbnRAMCB7Cj4gKwkJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZsY2RjXzA+Owo+ICsJCQkJfTsKPiAgCQkJfTsKPiAgCQl9OwoKVGhl
IG91dHRlciBwb3J0cyBub2RlIGlzbid0IHJlcXVpcmVkIGlmIHRoZXJlJ3MgYSBzaW5nbGUgcG9y
dCwgdXAgdG8KeW91LgoKPiAgCX07Cj4gQEAgLTUyNSw2ICs1MDksMTQgQEAKPiAgCXN0YXR1cyA9
ICJva2F5IjsKPiAgCj4gIAlibHVlLWFuZC1yZWQtd2lyaW5nID0gImNyb3NzZWQiOwo+ICsKPiAr
CXBvcnRzIHsKPiArCQlwb3J0IHsKPiArCQkJbGNkY18wOiBlbmRwb2ludEAwIHsKPiArCQkJCXJl
bW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfMD47Cj4gKwkJCX07Cj4gKwkJfTsKPiArCX07CgpTYW1l
IGhlcmUuCgpXaXRoIHRoZSBhYm92ZSBpc3N1ZXMgYWRkcmVzc2VkIGFzIGFwcGxpY2FibGUsCgpS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgoKPiAgfTsKPiAgCj4gICZlbG0gewoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNo
YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
