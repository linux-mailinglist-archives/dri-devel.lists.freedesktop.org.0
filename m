Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AD6C98C0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 09:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A456E25F;
	Thu,  3 Oct 2019 07:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF03A6E25F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 07:01:43 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z19so3176994ior.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 00:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaTSOsWkX0NwMXV+OVQ4GdiZGiGZm7DQLiGys1P/CwM=;
 b=XiXA+3ofUhIm/tREfaP7KXRct3iPyP2aUOrjF/BKdtFYL7aD48oTP/mjFVMu4wxd4a
 3j2UdZ3+q9xAY5xuId02BBnbXVDypli2KjuOC1G4b563tg4QYmyompryGARRsS872OFe
 b4LmZXuxVHUp0OejL4uy9qLDgowbSfN8VYfr61ogRB/TC3gAj/vioFZukSFkiQQ6mM3j
 83eK9bj5vQXFYXbyiPOVwTbsE6RhjaKZhwJnfo45rZubRq6TqCfzofYqGuIf9aco0jBb
 A+mP0Y/8t3QLI2v1C0p0c2v2HagQsfygbxC61J2K4sE6ZgERdW9A2YnkJXjFGKjE841U
 ApBQ==
X-Gm-Message-State: APjAAAVSlbuCjKieLaqN5FY0GAwulXcGoRy8bJLw75fDXrb/1uvj0lyZ
 w/HsO0h7tjkNukzbg5OKWIQBw4NXxdQ60tihl6Ur6A==
X-Google-Smtp-Source: APXvYqxM2F/rF0fpKNncuUJT+YRkExY6NtSZFmZJqRNh7an4Mrr/PKtbKXdxgxjXj+qLiStrfZW997mYZqDUjGR51tg=
X-Received: by 2002:a6b:2b07:: with SMTP id r7mr7264826ior.173.1570086102574; 
 Thu, 03 Oct 2019 00:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-6-jagan@amarulasolutions.com>
 <CAGb2v64RJeHXSDknPvH3RrDLqPzSvR-p2k2vA73Zt1xsOd5TSw@mail.gmail.com>
In-Reply-To: <CAGb2v64RJeHXSDknPvH3RrDLqPzSvR-p2k2vA73Zt1xsOd5TSw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 3 Oct 2019 12:31:31 +0530
Message-ID: <CAMty3ZBmY+wZ4MZD1ipjnfhVy3gBRCqsAXGqF79mo+eaX=L2fA@mail.gmail.com>
Subject: Re: [PATCH v11 5/7] drm/sun4i: sun6i_mipi_dsi: Add VCC-DSI regulator
 support
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RaTSOsWkX0NwMXV+OVQ4GdiZGiGZm7DQLiGys1P/CwM=;
 b=AYvgtbDiQ21Bs+qVq2dGhqdNnCjEZtjI+RtycTGJZwDSFgTMwWE/ZDzIDSjDPI+4ko
 XIJkx4HVNDR3hj83PjWGh38PHwo7NJn/JnLE30yVfqtLZvxtTvU81/OWwr1NfwK1qwm8
 ZsKxbOXBdfpY3Evv0RggiUM8VFxlUP6MW24aY=
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMywgMjAxOSBhdCAxMjoyNiBQTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5v
cmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMywgMjAxOSBhdCAyOjQ2IFBNIEphZ2FuIFRla2kg
PGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiA+Cj4gPiBBbGx3aW5uZXIgTUlQ
SSBEU0kgY29udHJvbGxlcnMgYXJlIHN1cHBsaWVkIHdpdGggU29DCj4gPiBEU0kgcG93ZXIgcmFp
bHMgdmlhIFZDQy1EU0kgcGluLgo+ID4KPiA+IEFkZCBzdXBwb3J0IGZvciB0aGlzIHN1cHBseSBw
aW4gYnkgYWRkaW5nIHZvbHRhZ2UKPiA+IHJlZ3VsYXRvciBoYW5kbGluZyBjb2RlIHRvIE1JUEkg
RFNJIGRyaXZlci4KPiA+Cj4gPiBUZXN0ZWQtYnk6IE1lcmxpam4gV2FqZXIgPG1lcmxpam5Ad2l6
enVwLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlf
ZHNpLmMgfCAxNCArKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42
aV9taXBpX2RzaS5oIHwgIDIgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlf
ZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwo+ID4gaW5kZXgg
NDQ2ZGM1NmNjNDRiLi5mZTlhMzY2N2YzYTEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjZpX21pcGlfZHNpLmMKPiA+IEBAIC0xMTEwLDYgKzExMTAsMTIgQEAgc3RhdGljIGludCBz
dW42aV9kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAgICAgICAg
ICAgICAgICByZXR1cm4gUFRSX0VSUihiYXNlKTsKPiA+ICAgICAgICAgfQo+ID4KPiA+ICsgICAg
ICAgZHNpLT5yZWd1bGF0b3IgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAidmNjLWRzaSIpOwo+
ID4gKyAgICAgICBpZiAoSVNfRVJSKGRzaS0+cmVndWxhdG9yKSkgewo+ID4gKyAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiQ291bGRuJ3QgZ2V0IFZDQy1EU0kgc3VwcGx5XG4iKTsKPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihkc2ktPnJlZ3VsYXRvcik7Cj4gPiArICAgICAg
IH0KPiA+ICsKPiA+ICAgICAgICAgZHNpLT5yZWdzID0gZGV2bV9yZWdtYXBfaW5pdF9tbWlvX2Ns
ayhkZXYsICJidXMiLCBiYXNlLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZzdW42aV9kc2lfcmVnbWFwX2NvbmZpZyk7Cj4gPiAgICAgICAgIGlmIChJ
U19FUlIoZHNpLT5yZWdzKSkgewo+ID4gQEAgLTExODMsNiArMTE4OSwxMyBAQCBzdGF0aWMgaW50
IHN1bjZpX2RzaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICBzdGF0
aWMgaW50IF9fbWF5YmVfdW51c2VkIHN1bjZpX2RzaV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3Qgc3VuNmlfZHNpICpkc2kgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsKPiA+ICsgICAgICAgaW50IGVycjsKPiA+ICsKPiA+ICsgICAgICAg
ZXJyID0gcmVndWxhdG9yX2VuYWJsZShkc2ktPnJlZ3VsYXRvcik7Cj4gPiArICAgICAgIGlmIChl
cnIpIHsKPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRzaS0+ZGV2LCAiZmFpbGVkIHRvIGVu
YWJsZSBWQ0MtRFNJIHN1cHBseTogJWRcbiIsIGVycik7Cj4gPiArICAgICAgICAgICAgICAgcmV0
dXJuIGVycjsKPiA+ICsgICAgICAgfQo+ID4KPiA+ICAgICAgICAgcmVzZXRfY29udHJvbF9kZWFz
c2VydChkc2ktPnJlc2V0KTsKPiA+ICAgICAgICAgY2xrX3ByZXBhcmVfZW5hYmxlKGRzaS0+bW9k
X2Nsayk7Cj4gPiBAQCAtMTIxNSw2ICsxMjI4LDcgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBzdW42aV9kc2lfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+Cj4gPiAg
ICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkc2ktPm1vZF9jbGspOwo+ID4gICAgICAgICBy
ZXNldF9jb250cm9sX2Fzc2VydChkc2ktPnJlc2V0KTsKPiA+ICsgICAgICAgcmVndWxhdG9yX2Rp
c2FibGUoZHNpLT5yZWd1bGF0b3IpOwo+ID4KPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5oIGIv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmgKPiA+IGluZGV4IDVjM2FkNWJl
MDY5MC4uYTAxZDQ0ZTllNDYxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjZpX21pcGlfZHNpLmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9t
aXBpX2RzaS5oCj4gPiBAQCAtMTIsNiArMTIsNyBAQAo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2Nv
bm5lY3Rvci5oPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2VuY29kZXIuaD4KPiA+ICAjaW5jbHVk
ZSA8ZHJtL2RybV9taXBpX2RzaS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29u
c3VtZXIuaD4KPgo+IFlvdSBkb24ndCBuZWVkIHRvIGluY2x1ZGUgdGhlIGhlYWRlciBmaWxlIHNp
bmNlIHlvdSBhcmUgb25seQo+IGluY2x1ZGluZyBhIHBvaW50ZXIgdG8gdGhlIHN0cnVjdCwgYW5k
IG5vdGhpbmcgZWxzZS4KClllcywgbWFrZSBzZW5zZS4gSSB3aWxsIGRyb3AgaXQuCgo+Cj4gT3Ro
ZXJ3aXNlLAo+Cj4gUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KCnRo
YW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
