Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442E9DCD9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D5089208;
	Mon, 29 Apr 2019 07:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33F389444
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2019 19:20:37 +0000 (UTC)
Date: Fri, 26 Apr 2019 21:20:31 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 6/9] dt-bindings: display: hdmi-connector: Add DDC
 power supply
Message-ID: <20190426192031.wtoaxctjo2qxxquq@core.my.home>
Mail-Followup-To: Rob Herring <robh@kernel.org>, linux-sunxi@googlegroups.com,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mark Rutland <mark.rutland@arm.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org
References: <20190413165418.27880-1-megous@megous.com>
 <20190413165418.27880-7-megous@megous.com>
 <20190426182337.GA22245@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190426182337.GA22245@bogus>
X-Mailman-Approved-At: Mon, 29 Apr 2019 07:28:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1556306435; bh=YkDA5dz+uUBdhB87OuCodqIevUET1loowrkHnzxHmKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EhXsG3nnW0ufliDyxcCCrlyL3q7bcG976kKI4sR5ATyeVDQ0Lotjj2sZxbPYTDq9F
 jL8aUH8qj5UxgBMo8ruQ1DqBty3FZXwDCmIjfUcAB++1v8fR+UMCExoY7ILIvrpvRJ
 oOR24V5+FV977sDqY5W++wnTDwes4eyXpcXBZohE=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 Jose Abreu <joabreu@synopsys.com>, linux-gpio@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDE6MjM6MzdQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU2F0LCBBcHIgMTMsIDIwMTkgYXQgMDY6NTQ6MTVQTSArMDIwMCwgbWVnb3VzQG1l
Z291cy5jb20gd3JvdGU6Cj4gPiBGcm9tOiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNv
bT4KPiA+IAo+ID4gU29tZSBBbGx3aW5uZXIgU29DIHVzaW5nIGJvYXJkcyAoT3JhbmdlIFBpIDMg
Zm9yIGV4YW1wbGUpIG5lZWQgdG8gZW5hYmxlCj4gPiBvbi1ib2FyZCB2b2x0YWdlIHNoaWZ0aW5n
IGxvZ2ljIGZvciB0aGUgRERDIGJ1cyB0byBiZSB1c2FibGUuIFVzZQo+ID4gZGRjLXN1cHBseSBv
biB0aGUgaGRtaS1jb25uZWN0b3IgdG8gbW9kZWwgdGhpcy4KPiA+IAo+ID4gQWRkIGJpbmRpbmcg
ZG9jdW1lbnRhdGlvbiBmb3Igb3B0aW9uYWwgZGRjLXN1cHBseSBwcm9wZXJ0eS4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+Cj4gPiAtLS0K
PiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Nvbm5lY3Rvci9oZG1pLWNvbm5l
Y3Rvci50eHQgICAgIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0b3IudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVjdG9yL2hkbWktY29ubmVjdG9yLnR4dAo+ID4gaW5k
ZXggNTA4YWVlNDYxZTBkLi4zMzA4NWFlYjBiYjkgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0b3Iu
dHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9j
b25uZWN0b3IvaGRtaS1jb25uZWN0b3IudHh0Cj4gPiBAQCAtOSw2ICs5LDcgQEAgT3B0aW9uYWwg
cHJvcGVydGllczoKPiA+ICAtIGxhYmVsOiBhIHN5bWJvbGljIG5hbWUgZm9yIHRoZSBjb25uZWN0
b3IKPiA+ICAtIGhwZC1ncGlvczogSFBEIEdQSU8gbnVtYmVyCj4gPiAgLSBkZGMtaTJjLWJ1czog
cGhhbmRsZSBsaW5rIHRvIHRoZSBJMkMgY29udHJvbGxlciB1c2VkIGZvciBEREMgRURJRCBwcm9i
aW5nCj4gPiArLSBkZGMtc3VwcGx5OiB0aGUgcG93ZXIgc3VwcGx5IGZvciB0aGUgRERDIGJ1cwo+
IAo+IEl0J3Mgbm90IGp1c3QgZm9yIEREQy4gSXQgcG93ZXJzIHRoZSBjaGlwcyBpbiBicmlkZ2Ug
ZG9uZ2xlcyBmb3IgCj4gZXhhbXBsZS4gUHJldHR5IG11Y2ggZXZlcnkgZGlhZ3JhbSBJIGZpbmQg
anVzdCBjYWxscyBpdCA1ViBvciArNVYuCj4gCj4gU28gaG93IGFib3V0ICc1Vi1zdXBwbHknIG9y
ICd2NVYtc3VwcGx5Jz8KCkp1c3QgdG8gYmUgc3VyZSwgdGhlIHNjaGVtYXRpYyB0aGF0IGluc3Bp
cmVkIHRoaXMgY2hhbmdlIGxvb2tzIGxpa2UgdGhpczoKCmh0dHBzOi8vbWVnb3VzLmNvbS9kbC90
bXAvMzNiMjk3MWRlNjk0M2U5ZC5wbmcKCkhETUktNVYgaXMgYWx3YXlzIG9uLCBhbmQgd2hhdCBp
cyByZWFsbHkgYmVpbmcgZW5hYmxlZCBoZXJlIGFyZSBtb3NmZXRzCmNvbm5lY3RlZCB0byBERENf
Q0VDX0VOIGFuZCBub3QgdGhlIEhETUktNVYgcG93ZXIgc3VwcGx5LiBTbyBpbiB0aGlzIGNhc2Ug
aXQKcmVhbGx5IGlzIGp1c3QgZm9yIEREQy4gSXQgaXMgY29uY2VpdmFibGUgdGhhdCBzb21lIGJv
YXJkcyBtYXkgbmVlZCBib3RoIHRvCmVuYWJsZSA1ViBmb3IgSERNSSBjaXJjdWl0cnkgYW5kIHNv
bWUgc2VwYXJhdGUgcG93ZXIgc2hpZnRpbmcgbG9naWMgZm9yCkREQyBidXMuCgpTbyBpZiBJIHJl
bmFtZWQgdGhpcywgdGhlIERUUyB3b3VsZCBub3QgZGVzY3JpYmUgdGhlIHJlYWwgSFcgdmVyeSB3
ZWxsCm9uIE9yYW5nZSBQaSAzLgoKdGhhbmsgeW91IGFuZCByZWdhcmRzLAoJT25kcmVqCgo+IFJv
YgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
