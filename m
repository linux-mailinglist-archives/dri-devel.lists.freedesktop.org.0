Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 646327EE4C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685AC6ECE7;
	Fri,  2 Aug 2019 08:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC746E8BE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:06:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F01EDCC;
 Fri,  2 Aug 2019 10:06:14 +0200 (CEST)
Date: Fri, 2 Aug 2019 11:06:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
Message-ID: <20190802080613.GF5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564733175;
 bh=9+kza4VDTl+eEJMeGT4Xr32idlzQYUeiiTC1I338XCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HaPxzE3tcMpwuIKBEDqz5x+O0u37NVXKCuNIZj19qLZjuEznLp/d2GRe7HikZT/Ht
 TKgUIGn+TiSOxzUebfB2WAA0sfY7sbMQhnGsbv8zZE694/vOEL4YU+MqvLB9MgBRqd
 FkxeHYl5hmdVK2HI3a39AXL4Kug+n6l2TdBN6KAg=
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDA4OjM0OjAyQU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBXaGVuIGlu
IHZlcnRpY2FsIHN0cmlwZSBtb2RlIG9mIG9wZXJhdGlvbiwgdGhlcmUgaXMgdGhlIG9wdGlvbgo+
IG9mIHN3YXBwaW5nIGV2ZW4gZGF0YSBhbmQgb2RkIGRhdGEgb24gdGhlIHR3byBMVkRTIGludGVy
ZmFjZXMKPiB1c2VkIHRvIGRyaXZlIHRoZSB2aWRlbyBvdXRwdXQuCj4gQWRkIGRhdGEgc3dhcCBz
dXBwb3J0IGJ5IGV4cG9zaW5nIGEgbmV3IERUIHByb3BlcnR5IG5hbWVkCj4gInJlbmVzYXMsc3dh
cC1kYXRhIi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNh
c3Ryb0BicC5yZW5lc2FzLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9sdmRzLmMgfCAyMyArKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2x2ZHMuYwo+IGluZGV4IDNhZWFmOWUuLmMzMDZmYWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2x2ZHMuYwo+IEBAIC02OSw2ICs2OSw3IEBAIHN0cnVjdCByY2FyX2x2ZHMgewo+
ICAKPiAgCXN0cnVjdCBkcm1fYnJpZGdlICpjb21wYW5pb247Cj4gIAlib29sIGR1YWxfbGluazsK
PiArCWJvb2wgc3RyaXBlX3N3YXBfZGF0YTsKPiAgfTsKPiAgCj4gICNkZWZpbmUgYnJpZGdlX3Rv
X3JjYXJfbHZkcyhicmlkZ2UpIFwKPiBAQCAtNDM5LDEyICs0NDAsMTYgQEAgc3RhdGljIHZvaWQg
cmNhcl9sdmRzX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICAJcmNhcl9sdmRz
X3dyaXRlKGx2ZHMsIExWRENIQ1IsIGx2ZGhjcik7Cj4gIAo+ICAJaWYgKGx2ZHMtPmluZm8tPnF1
aXJrcyAmIFJDQVJfTFZEU19RVUlSS19EVUFMX0xJTkspIHsKPiAtCQkvKgo+IC0JCSAqIENvbmZp
Z3VyZSB2ZXJ0aWNhbCBzdHJpcGUgYmFzZWQgb24gdGhlIG1vZGUgb2Ygb3BlcmF0aW9uIG9mCj4g
LQkJICogdGhlIGNvbm5lY3RlZCBkZXZpY2UuCj4gLQkJICovCj4gLQkJcmNhcl9sdmRzX3dyaXRl
KGx2ZHMsIExWRFNUUklQRSwKPiAtCQkJCWx2ZHMtPmR1YWxfbGluayA/IExWRFNUUklQRV9TVF9P
TiA6IDApOwo+ICsJCXUzMiBsdmRzdHJpcGUgPSAwOwo+ICsKPiArCQlpZiAobHZkcy0+ZHVhbF9s
aW5rKQo+ICsJCQkvKgo+ICsJCQkgKiBDb25maWd1cmUgdmVydGljYWwgc3RyaXBlIGJhc2VkIG9u
IHRoZSBtb2RlIG9mCj4gKwkJCSAqIG9wZXJhdGlvbiBvZiB0aGUgY29ubmVjdGVkIGRldmljZS4K
PiArCQkJICovCj4gKwkJCWx2ZHN0cmlwZSA9IExWRFNUUklQRV9TVF9PTiB8IChsdmRzLT5zdHJp
cGVfc3dhcF9kYXRhID8KPiArCQkJCQkJICAgICAgIExWRFNUUklQRV9TVF9TV0FQIDogMCk7CgpX
b3VsZCB0aGUgZm9sbG93aW5nIGJlIHNpbXBsZXIgPwoKCQlsdmRzdHJpcGUgPSAobHZkcy0+ZHVh
bF9saW5rID8gTFZEU1RSSVBFX1NUX09OIDogMCkKCQkJICB8IChsdmRzLT5zdHJpcGVfc3dhcF9k
YXRhID8gTFZEU1RSSVBFX1NUX1NXQVAgOiAwKTsKCj4gKwkJcmNhcl9sdmRzX3dyaXRlKGx2ZHMs
IExWRFNUUklQRSwgbHZkc3RyaXBlKTsKPiAgCX0KPiAgCj4gIAkvKgo+IEBAIC03NzAsOCArNzc1
LDEyIEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0KHN0cnVjdCByY2FyX2x2ZHMgKmx2
ZHMpCj4gIAkJfQo+ICAJfQo+ICAKPiAtCWlmIChsdmRzLT5kdWFsX2xpbmspCj4gKwlpZiAobHZk
cy0+ZHVhbF9saW5rKSB7Cj4gKwkJbHZkcy0+c3RyaXBlX3N3YXBfZGF0YSA9IG9mX3Byb3BlcnR5
X3JlYWRfYm9vbCgKPiArCQkJCQkJbHZkcy0+ZGV2LT5vZl9ub2RlLAo+ICsJCQkJCQkicmVuZXNh
cyxzd2FwLWRhdGEiKTsKPiAgCQlyZXQgPSByY2FyX2x2ZHNfcGFyc2VfZHRfY29tcGFuaW9uKGx2
ZHMpOwo+ICsJfQoKQXMgZXhwbGFpbmVkIGluIHRoZSByZXZpZXcgb2YgdGhlIGNvcnJlc3BvbmRp
bmcgRFQgYmluZGluZ3MsIEkgdGhpbmsKdGhpcyBzaG91bGQgYmUgcXVlcmllZCBmcm9tIHRoZSBy
ZW1vdGUgZGV2aWNlIHJhdGhlciB0aGFuIHNwZWNpZmllZCBpbgpEVC4KCj4gIAo+ICBkb25lOgo+
ICAJb2Zfbm9kZV9wdXQobG9jYWxfb3V0cHV0KTsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5j
aGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
