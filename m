Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C99276F3
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 09:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F5589BFF;
	Thu, 23 May 2019 07:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91789BFF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 07:32:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-106-214-nat.elisa-mobile.fi
 [85.76.106.214])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9139B337;
 Thu, 23 May 2019 09:32:01 +0200 (CEST)
Date: Thu, 23 May 2019 10:31:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH 5/6] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Message-ID: <20190523073141.GB4745@pendragon.ideasonboard.com>
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065400.BD9EB68B05@newverein.lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523065400.BD9EB68B05@newverein.lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558596722;
 bh=/W2SCMLQvihCKvM7mxR3BE+Y239YuZ1nvKLwS2lS22s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b6vY6YIDsBJ6mfZ1r7Cjz+6RS7YWDC4UqQv/GhyPYWnwLaqWsHk4FioMivLW63tzk
 cr3JIVwoKX+zuCtO47ebgD+Lo5+6DQctzjSOf0UjhryORcxtcJ/jenCG8PBz3Y3v+N
 RFtQvviCFCcE6TLV0l9RHjyP2CIv6RzPEGaxsvFk=
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9yc3RlbiwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBNYXkgMjMsIDIw
MTkgYXQgMDg6NTQ6MDBBTSArMDIwMCwgVG9yc3RlbiBEdXdlIHdyb3RlOgo+IEZyb206IEljZW5v
d3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiAKPiBUaGUgYW54NjM0NSBpcyBhbiB1bHRyYS1s
b3cgcG93ZXIgRGlzcGxheVBvcnQvZURQIHRyYW5zbWl0dGVyIGRlc2lnbmVkCj4gZm9yIHBvcnRh
YmxlIGRldmljZXMuCj4gCj4gQWRkIGEgYmluZGluZyBkb2N1bWVudCBmb3IgaXQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgo+IFNpZ25lZC1vZmYt
Ynk6IFZhc2lseSBLaG9ydXpoaWNrIDxhbmFyc291bEBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogVG9yc3RlbiBE
dXdlIDxkdXdlQHN1c2UuZGU+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL2FueDYzNDUudHh0ICAgICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDYzNDUudHh0
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9hbng2MzQ1LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9hbng2MzQ1LnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi5lNzlhMTEzNDhkMTEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDYzNDUudHh0
Cj4gQEAgLTAsMCArMSw1NiBAQAo+ICtBbmFsb2dpeCBBTlg2MzQ1IGVEUCBUcmFuc21pdHRlcgo+
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICsKPiArVGhlIEFOWDYzNDUgaXMg
YW4gdWx0cmEtbG93IHBvd2VyIEZ1bGwtSEQgZURQIHRyYW5zbWl0dGVyIGRlc2lnbmVkIGZvcgo+
ICtwb3J0YWJsZSBkZXZpY2VzLgo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiArCj4gKyAt
IGNvbXBhdGlibGUJCTogImFuYWxvZ2l4LGFueDYzNDUiCj4gKyAtIHJlZwkJCTogSTJDIGFkZHJl
c3Mgb2YgdGhlIGRldmljZQo+ICsgLSByZXNldC1ncGlvcwkJOiBXaGljaCBHUElPIHRvIHVzZSBm
b3IgcmVzZXQKPiArIC0gZHZkZDEyLXN1cHBseQk6IFJlZ3VsYXRvciBmb3IgMS4yViBkaWdpdGFs
IGNvcmUgcG93ZXIuCj4gKyAtIGR2ZGQyNS1zdXBwbHkJOiBSZWd1bGF0b3IgZm9yIDIuNVYgZGln
aXRhbCBjb3JlIHBvd2VyLgo+ICsKPiArT3B0aW9uYWwgcHJvcGVydGllczoKPiArCj4gKyAtIFZp
ZGVvIHBvcnRzIGZvciBSR0IgaW5wdXQgYW5kIGVEUCBvdXRwdXQgdXNpbmcgdGhlIERUIGJpbmRp
bmdzCj4gKyAgIGRlZmluZWQgaW4gWzFdCj4gKwo+ICtbMV06IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAo+ICsKPiArRXhhbXBsZToK
PiArCj4gK2FueDYzNDU6IGFueDYzNDVAMzggewo+ICsJY29tcGF0aWJsZSA9ICJhbmFsb2dpeCxh
bng2MzQ1IjsKPiArCXJlZyA9IDwweDM4PjsKPiArCXJlc2V0LWdwaW9zID0gPCZwaW8gMyAyNCBH
UElPX0FDVElWRV9MT1c+OyAvKiBQRDI0ICovCj4gKwlkdmRkMjUtc3VwcGx5ID0gPCZyZWdfZGxk
bzI+Owo+ICsJZHZkZDEyLXN1cHBseSA9IDwmcmVnX2ZsZG8xPjsKPiArCj4gKwlwb3J0cyB7Cj4g
KwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKwkJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsJ
CWFueDYzNDVfaW46IHBvcnRAMCB7Cj4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJCQkj
c2l6ZS1jZWxscyA9IDwwPjsKPiArCQkJcmVnID0gPDA+Owo+ICsJCQlhbng2MzQ1X2luX3Rjb24w
OiBlbmRwb2ludEAwIHsKPiArCQkJCXJlZyA9IDwwPjsKPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9
IDwmdGNvbjBfb3V0X2FueDYzNDU+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwo+ICsJCWFueDYzNDVf
b3V0OiBwb3J0QDEgewo+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkJI3NpemUtY2Vs
bHMgPSA8MD47Cj4gKwkJCXJlZyA9IDwxPjsKPiArCj4gKwkJCWFueDYzNDVfb3V0X3BhbmVsOiBl
bmRwb2ludEAwIHsKPiArCQkJCXJlZyA9IDwwPjsKPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
cGFuZWxfaW5fZWRwPjsKPiArCQkJfTsKPiArCQl9Owo+ICsJfTsKPiArfTsKCi0tIApSZWdhcmRz
LAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
