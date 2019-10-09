Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4490ED2124
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B17E6EA9B;
	Thu, 10 Oct 2019 06:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767456EA16;
 Wed,  9 Oct 2019 16:51:30 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id BAD3A3E89B;
 Wed,  9 Oct 2019 16:51:28 +0000 (UTC)
Date: Wed, 9 Oct 2019 12:51:28 -0400
From: Brian Masney <masneyb@onstation.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add HDMI nodes
Message-ID: <20191009165128.GB1595@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-5-masneyb@onstation.org>
 <20191009022131.604B52070B@mail.kernel.org>
 <20191009060520.GA14506@onstation.org>
 <20191009153927.3DC5D21848@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009153927.3DC5D21848@mail.kernel.org>
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1570639889;
 bh=XuRSZUxqlEHuVzlpMa3RostZ9o3RMjnb4AAbLDyG678=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T06iGA5qp+VAkynZyImFdjFWH6v2KZuxbkYf0n8YKuB5Fyk1DpWhhk9uYLM7m7XeP
 IMpFzOiFszccfUZpJZTse7j+c2PP5dMpwJBMjFTjccmE0tPUwd0+CDRenOz6CsDInm
 2ErwCd4ddJOfkcQvPEqjDVwPWfP1Kn1310fpKS+k=
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 Laurent.pinchart@ideasonboard.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDg6Mzk6MjZBTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdy
b3RlOgo+IFF1b3RpbmcgQnJpYW4gTWFzbmV5ICgyMDE5LTEwLTA4IDIzOjA1OjIwKQo+ID4gT24g
VHVlLCBPY3QgMDgsIDIwMTkgYXQgMDc6MjE6MzBQTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdyb3Rl
Ogo+ID4gPiBRdW90aW5nIEJyaWFuIE1hc25leSAoMjAxOS0xMC0wNiAxODo0NTowOCkKPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LmR0c2kgYi9hcmNo
L2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQo+ID4gPiA+IGluZGV4IDdmYzIzZTQyMmNj
NS4uYWYwMmVhY2UxNGUyIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3Fj
b20tbXNtODk3NC5kdHNpCj4gPiA+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204
OTc0LmR0c2kKPiA+ID4gPiBAQCAtMTMzNSw2ICsxMzQyLDc3IEBACj4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jm1tY2MgTURTU19BSEJfQ0xLPjsKPiA+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImlmYWNl
IjsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4gPiA+ICsKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBoZG1pOiBoZG1pLXR4QGZkOTIyMTAwIHsKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiA+
ID4gKwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJxY29tLGhkbWktdHgtODk3NCI7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHhmZDkyMjEwMCAweDM1Yz4sCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8MHhmYzRiODAwMCAweDYwZjA+Owo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnLW5hbWVzID0gImNvcmVfcGh5c2ljYWwiLAo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInFmcHJvbV9w
aHlzaWNhbCI7Cj4gPiA+IAo+ID4gPiBJcyB0aGlzIHRoZSBxZnByb20gInVuY29ycmVjdGVkIiBw
aHlzaWNhbCBhZGRyZXNzPyBJZiBzbywgd2h5IGNhbid0IHRoaXMKPiA+ID4gbm9kZSB1c2UgYW4g
bnZtZW0gdG8gcmVhZCB3aGF0ZXZlciBpdCBuZWVkcyBvdXQgb2YgdGhlIHFmcHJvbT8KPiA+IAo+
ID4gVGhlIE1TTSBIRE1JIGNvZGUgaXMgY29uZmlndXJlZCB0byBsb29rIGZvciB0aGlzIHJlZy1u
YW1lIGhlcmU6Cj4gPiAKPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWkuYyNMNTgyCj4gPiAKPiA+IFRo
ZXJlIGlzIGEgcWNvbSxxZnByb20gY29uZmlndXJlZCBmb3IgdGhpcyBib2FyZCBpbiBEVFMsIGhv
d2V2ZXIgaXRzIGF0Cj4gPiBhIGRpZmZlcmVudCBhZGRyZXNzIHJhbmdlLCBzbyBtYXliZSB0aGVy
ZSBhcmUgbXVsdGlwbGUgcWZwcm9tcz8KPiA+IAo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRz
aSNMNDI0Cj4gPiAKPiA+IG1zbTg5OTYuZHRzaSBoYXMgdGhlIHNhbWUgc3R5bGUgb2YgY29uZmln
dXJhdGlvbjoKPiA+IAo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0
L3NvdXJjZS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vbXNtODk5Ni5kdHNpI0w5NTYKPiA+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9hcm02NC9i
b290L2R0cy9xY29tL21zbTg5OTYuZHRzaSNMMTczNgo+ID4gCj4gCj4gVGhlcmUncyBvbmx5IG9u
ZSBxZnByb20gYW5kIHRoZXJlJ3MgdGhlIGFkZHJlc3Mgc3BhY2UgdGhhdCdzCj4gInVuY29ycmVj
dGVkIiB3aGljaCBpcyBub3Qgc3VwcG9zZWQgdG8gYmUgdXNlZCBhbmQgdGhlcmUncyB0aGUgc3Bh
Y2UKPiB0aGF0IGlzICJjb3JyZWN0ZWQiIGFuZCBpcyBzdXBwb3NlZCB0byBiZSB1c2VkLiBJdCBs
b29rcyBsaWtlIHRoaXMgaXMKPiBwb2tpbmcgdGhlIHVuY29ycmVjdGVkIHNwYWNlIGFuZCBpdCBz
aG91bGQgcHJvYmFibHkgc3RvcCBkb2luZyB0aGF0IGFuZAo+IHVzZSB0aGUgbnZtZW0gcHJvdmlk
ZXIgaW5zdGVhZC4gTWF5YmUgc29tZW9uZSB3aXRoIGRvY3MgZm9yIHRoaXMgY2hpcAo+IGFuZCA4
OTk2IGNhbiBoZWxwIGNvbmZpcm0gdGhpcy4KCkRvIHlvdSBrbm93IG9mIGFueSBwdWJsaWNseS1h
dmFpbGFibGUgZG9jdW1lbnRhdGlvbiB0aGF0IGRlc2NyaWJlcyB0aGUKInVuY29ycmVjdGVkIiBh
bmQgImNvcnJlY3RlZCIgYWRkcmVzc2VzPyBJIGdvdCB0aGF0IHFmcHJvbSBhZGRyZXNzIGZvcgp0
aGUgSERNSSBmcm9tIGhlcmU6CgpodHRwczovL2dpdGh1Yi5jb20vQUlDUC9rZXJuZWxfbGdlX2hh
bW1lcmhlYWQvYmxvYi9uNy4xL2FyY2gvYXJtL2Jvb3QvZHRzL21zbTg5NzQtbWRzcy5kdHNpI0wx
MDEKCkkgYXNzdW1lIHRoZSBkb3duc3RyZWFtIGtlcm5lbCBwcm9iYWJseSBkb2Vzbid0IGhhdmUg
dGhlIGNvcnJlY3RlZAphZGRyZXNzIGFueXdoZXJlIGVsc2U/CgpCcmlhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
