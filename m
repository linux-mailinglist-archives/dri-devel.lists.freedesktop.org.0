Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B839118F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB30E6EB3C;
	Sat, 17 Aug 2019 15:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6F76EA9C;
 Thu, 15 Aug 2019 22:51:07 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id D89F23E998;
 Thu, 15 Aug 2019 22:51:04 +0000 (UTC)
Date: Thu, 15 Aug 2019 18:51:04 -0400
From: Brian Masney <masneyb@onstation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC 06/11] drm/bridge: analogix-anx78xx: add support for
 avdd33 regulator
Message-ID: <20190815225104.GB32072@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-7-masneyb@onstation.org>
 <CACRpkdYdQa+FVfpSjLi0SsBMDT4QC667z1P1dnapz7PXgRoB5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYdQa+FVfpSjLi0SsBMDT4QC667z1P1dnapz7PXgRoB5Q@mail.gmail.com>
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565909466;
 bh=GlErRnlbnhtp3xOCD8QDuEBNzdpIzm/CEjl/t+YePi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kbBRmB2Ag3E2vXFKqyIe3P3JBKnDCf2Gw4yfO4jcxecQTEdBlDWG3wDJ+vxPQ+XQN
 a1BNwFsIm8w50ApVariWEfK20tN4ggz3LwN3Ya5I93TAxtpu1h1nThdsONxNN6uX7o
 QkSapavjafeT34+PmnZN/YYXcO0hocqwBz5MLwfA=
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Andy Gross <agross@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 MSM <linux-arm-msm@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MjI6NDVBTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAyOjQ5IEFNIEJyaWFuIE1hc25leSA8bWFz
bmV5YkBvbnN0YXRpb24ub3JnPiB3cm90ZToKPiAKPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgYXZk
ZDMzIHJlZ3VsYXRvciB0byB0aGUgYW5hbG9naXgtYW54Nzh4eCBkcml2ZXIuCj4gPiBOb3RlIHRo
YXQgdGhlIHJlZ3VsYXRvciBpcyBjdXJyZW50bHkgZW5hYmxlZCBkdXJpbmcgZHJpdmVyIHByb2Jl
IGFuZAo+ID4gZGlzYWJsZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHJlbW92ZWQuIFRoaXMgaXMgY3Vy
cmVudGx5IGhvdyB0aGUKPiA+IGRvd25zdHJlYW0gTVNNIGtlcm5lbCBzb3VyY2VzIGRvIHRoaXMu
Cj4gPgo+ID4gTGV0J3Mgbm90IG1lcmdlIHRoaXMgdXBzdHJlYW0gZm9yIHRoZSBtZWFuIHRpbWUg
dW50aWwgSSBnZXQgdGhlIGV4dGVybmFsCj4gPiBkaXNwbGF5IGZ1bGx5IHdvcmtpbmcgb24gdGhl
IE5leHVzIDUgYW5kIHRoZW4gSSBjYW4gc3VibWl0IHByb3Blcgo+ID4gc3VwcG9ydCB0aGVuIHRo
YXQgcG93ZXJzIGRvd24gdGhpcyByZWd1bGF0b3IgaW4gdGhlIHBvd2VyIG9mZiBmdW5jdGlvbi4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9y
Zz4KPiAKPiA+ICtzdGF0aWMgdm9pZCBhbng3OHh4X2Rpc2FibGVfcmVndWxhdG9yX2FjdGlvbih2
b2lkICpfZGF0YSkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBhbng3OHh4X3BsYXRmb3JtX2Rh
dGEgKnBkYXRhID0gX2RhdGE7Cj4gPiArCj4gPiArICAgICAgIHJlZ3VsYXRvcl9kaXNhYmxlKHBk
YXRhLT5hdmRkMzMpOwo+ID4gK30KPiAoLi4uKQo+ID4gKyAgICAgICBlcnIgPSBkZXZtX2FkZF9h
Y3Rpb24oZGV2LCBhbng3OHh4X2Rpc2FibGVfcmVndWxhdG9yX2FjdGlvbiwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBkYXRhKTsKPiAKPiBDbGV2ZXIgaWRlYS4gR29vZCBmb3Ig
aW5pdGlhbCBzdXBwb3J0LCBwcm9iYWJseSBsYXRlciBvbiBpdCB3b3VsZAo+IG5lZWQgdG8gYmUg
cmV3b3JrZWQgdXNpbmcgcnVudGltZSBQTSBzbyBpdCdzIG5vdCBjb25zdGFudGx5Cj4gcG93ZXJl
ZCB1cC4KClllcywgdGhhdCdzIG15IHBsYW4uIEkgc3VzcGVjdCB0aGF0IEkgbWF5IGhhdmUgYSBy
ZWd1bGF0b3IgZGlzYWJsZWQKc29tZXdoZXJlIHNvIEkgd2FzIHBsYW5uaW5nIHRvIGxlYXZlIHRo
aXMgb24gYWxsIHRoZSB0aW1lIGZvciB0aGUgdGltZQpiZWluZyB0byBtYXRjaCB0aGUgZG93bnN0
cmVhbSBiZWhhdmlvciB1bnRpbCBJIGdldCB0aGUgaG90IHBsdWcgZGV0ZWN0CkdQSU8gd29ya2lu
Zy4KCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KClRoYW5rcywKCkJyaWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
