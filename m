Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458EB4816
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F136EB00;
	Tue, 17 Sep 2019 07:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E87A6E181;
 Mon, 16 Sep 2019 09:01:53 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 9B6193E8F9;
 Mon, 16 Sep 2019 09:01:50 +0000 (UTC)
Date: Mon, 16 Sep 2019 05:01:50 -0400
From: Brian Masney <masneyb@onstation.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 00/11] ARM: dts: qcom: msm8974: add support for external
 display
Message-ID: <20190916090150.GA349@onstation.org>
References: <CGME20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3@epcas3p4.samsung.com>
 <20190815004854.19860-1-masneyb@onstation.org>
 <2da29e80-73fb-8620-532e-0b5f54b00841@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2da29e80-73fb-8620-532e-0b5f54b00841@samsung.com>
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1568624511;
 bh=u3nzc9gqP8MUC4JhGKxS32T+hxVY4syKzPf8LbbTamQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aOBRGkMlz/PhmAyVxvgfThua6X09O9qLt8s9Z4+G/dU8zpnBGCcD6NpbPyO3rS0Qw
 /GzuKCU0+FITC5ilWRJR5bvkSsGr0+bVtYVhSl/2Boz+5tl0ZiyVzEOgwWP1hg2fOz
 E5dvSFXBtHXZtL88w+C57HA9DPyvfZwZz6KJQBQA=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 jonas@kwiboo.se, agross@kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 enric.balletbo@collabora.com, freedreno@lists.freedesktop.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKCk9uIE1vbiwgU2VwIDE2LCAyMDE5IGF0IDEwOjEzOjU4QU0gKzAyMDAsIEFu
ZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gSGkgQnJpYW4sCj4gCj4gT24gMTUuMDguMjAxOSAwMjo0OCwg
QnJpYW4gTWFzbmV5IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYmVnaW5zIHRvIGFkZCBz
dXBwb3J0IGZvciB0aGUgZXh0ZXJuYWwgZGlzcGxheSBvdmVyCj4gPiBIRE1JIHRoYXQgaXMgc3Vw
cG9ydGVkIG9uIG1zbTg5NzQgU29Dcy4gSSdtIHRlc3RpbmcgdGhpcyBzZXJpZXMgb24gdGhlCj4g
PiBOZXh1cyA1LCBhbmQgSSdtIGFibGUgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUgSERNSSBicmlk
Z2UgdmlhIHRoZQo+ID4gYW5hbG9naXgtYW54Nzh4eCBkcml2ZXIsIGhvd2V2ZXIgdGhlIGV4dGVy
bmFsIGRpc3BsYXkgaXMgbm90IHdvcmtpbmcKPiA+IHlldC4KPiA+Cj4gPiBXaGVuIEkgcGx1ZyBp
biB0aGUgSERNSSBjYWJsZSwgdGhlIG1vbml0b3IgZGV0ZWN0cyB0aGF0IGEgZGV2aWNlIGlzCj4g
PiBob29rZWQgdXAsIGJ1dCBub3RoaW5nIGlzIHNob3duIG9uIHRoZSBleHRlcm5hbCBtb25pdG9y
LiBUaGUgaG90IHBsdWcKPiA+IGRldGVjdCBHUElPIChocGQtZ3Bpb3MpIG9uIHRoZSBhbmFsb2dp
eC1hbng3OHh4IGJyaWRnZSBhbmQgTVNNIEhETUkKPiA+IGRyaXZlcnMgZG8gbm90IGNoYW5nZSBz
dGF0ZSB3aGVuIHRoZSBzbGltcG9ydCBhZGFwdGVyIG9yIEhETUkgY2FibGUgaXMKPiA+IHBsdWdn
ZWQgaW4gb3IgcmVtb3ZlZC4gSSB3b25kZXIgaWYgYSByZWd1bGF0b3IgaXMgbm90IGVuYWJsZWQg
c29tZXdoZXJlPwo+ID4gSSBoYXZlIGEgY29tbWVudCBpbiBwYXRjaCAxMCByZWdhcmRpbmcgJ2hw
ZC1nZHNjLXN1cHBseScgdGhhdCBtYXkKPiA+IHBvdGVudGlhbGx5IGJlIGFuIGlzc3VlLgo+ID4K
PiA+IEknbSBzdGlsbCBkaWdnaW5nIGluIG9uIHRoaXMsIGhvd2V2ZXIgSSdkIGFwcHJlY2lhdGUg
YW55IGZlZWRiYWNrIGlmCj4gPiBhbnlvbmUgaGFzIHRpbWUuIE1vc3Qgb2YgdGhlc2UgcGF0Y2hl
cyBhcmUgcmVhZHkgbm93LCBzbyBJIG1hcmtlZCB0aGUKPiA+IG9uZXMgdGhhdCBhcmVuJ3QgcmVh
ZHkgd2l0aCAnUEFUQ0ggUkZDJy4KPiA+Cj4gPiBJJ20gdXNpbmcgYW4gQW5hbG9naXggU2VtaWNv
bmR1Y3RvciBTUDYwMDEgU2xpbVBvcnQgTWljcm8tVVNCIHRvIDRLIEhETUkKPiA+IEFkYXB0ZXIg
dG8gY29ubmVjdCBteSBwaG9uZSB0byBhbiBleHRlcm5hbCBkaXNwbGF5IHZpYSBhIHN0YW5kYXJk
IEhETUkKPiA+IGNhYmxlLiBUaGlzIHdvcmtzIGp1c3QgZmluZSB3aXRoIHRoZSBkb3duc3RyZWFt
IE1TTSBrZXJuZWwgdXNpbmcKPiA+IEFuZHJvaWQuCj4gCj4gCj4gVGhpcyBwYXRjaHNldCByaXNr
cyB0byBiZSBmb3Jnb3R0ZW4uIFRvIGF2b2lkIGl0LCBhdCBsZWFzdCBwYXJ0aWFsbHksIEkKPiBj
YW4gbWVyZ2UgcGF0Y2hlcyAxLTUsIGlzIGl0IE9LIGZvciB5b3U/CgpUaGF0IHdvdWxkIGJlIGdy
ZWF0IGlmIHlvdSBjb3VsZCBkbyB0aGF0LgoKVGhhbmtzLAoKQnJpYW4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
