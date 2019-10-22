Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA558E040B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 14:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9C96E791;
	Tue, 22 Oct 2019 12:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3746E791
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 12:42:19 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42D6521906
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 12:42:19 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id c17so23485233qtn.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 05:42:19 -0700 (PDT)
X-Gm-Message-State: APjAAAVK/FTIEDTgewvNuLssFizqwT+TPUQgGDb09dlAVj30xsSqBZRy
 YUho2UaGj5HECVQa3B78H4I1wT8A9UQk/IJu8A==
X-Google-Smtp-Source: APXvYqxf6MiuQdiT7Kz6alYW3lLAiryxko/xUIhWeHE6cCzheQDLOsAyk0cPSV/+Iz0r0zq3dgDPP+/dTRg57i4n7U8=
X-Received: by 2002:a0c:add6:: with SMTP id x22mr781981qvc.79.1571748138355;
 Tue, 22 Oct 2019 05:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-3-robh@kernel.org>
 <20191022111443.GE4756@pendragon.ideasonboard.com>
In-Reply-To: <20191022111443.GE4756@pendragon.ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Oct 2019 07:42:06 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+kyLZ8LAVN-5UDJUy9nMLiAjN452HWg5WYAfLS7QD=Yw@mail.gmail.com>
Message-ID: <CAL_Jsq+kyLZ8LAVN-5UDJUy9nMLiAjN452HWg5WYAfLS7QD=Yw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571748139;
 bh=EM5Hd+W+Xbp28U+Qeo5Lp8facOPIzhF6X+VJbmFVCFE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=w/zX1/Tg4kUp8ZsraDAtrm6nTJHzeZRRAQyBnvhIoxWOH+70wbRChvFYoclQzrAyx
 t3pce/y+Pd+Gz2n8TXgw3ysqSr9+h3cV75SfJ1htirf+jlAvk1lKLvT4TRTokOffrM
 DrmpGkHFokoIFCfb2flUsdsxd6OuxQnF7je6KEvA=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgNjoxNCBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2guCj4KPiBPbiBNb24sIE9jdCAyMSwgMjAxOSBhdCAwNDo0NTo0NlBN
IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IEludHJvZHVjZSBhIG5ldyBmbGFnLCBEUk1f
TU9ERV9EVU1CX0tFUk5FTF9NQVAsIGZvciBzdHJ1Y3QKPiA+IGRybV9tb2RlX2NyZWF0ZV9kdW1i
LiBUaGlzIGZsYWcgaXMgZm9yIGludGVybmFsIGtlcm5lbCB1c2UgdG8gaW5kaWNhdGUKPiA+IGlm
IGR1bWIgYnVmZmVyIGFsbG9jYXRpb24gbmVlZHMgYSBrZXJuZWwgbWFwcGluZy4gVGhpcyBpcyBu
ZWVkZWQgb25seSBmb3IKPiA+IENNQSB3aGVyZSBjcmVhdGluZyBhIGtlcm5lbCBtYXBwaW5nIG9y
IG5vdCBoYXMgdG8gYmUgZGVjaWRlZCBhdCBhbGxvY2F0aW9uCj4gPiB0aW1lIGJlY2F1c2UgY3Jl
YXRpbmcgYSBtYXBwaW5nIG9uIGRlbWFuZCAod2l0aCB2bWFwKCkpIGlzIG5vdCBndWFyYW50ZWVk
Cj4gPiB0byB3b3JrLiBTZXZlcmFsIGRyaXZlcnMgYXJlIHVzaW5nIENNQSwgYnV0IG5vdCB0aGUg
Q01BIGhlbHBlcnMgYmVjYXVzZQo+ID4gdGhleSBkaXN0aW5ndWlzaCBiZXR3ZWVuIGtlcm5lbCBh
bmQgdXNlcnNwYWNlIGFsbG9jYXRpb25zIHRvIGNyZWF0ZSBhCj4gPiBrZXJuZWwgbWFwcGluZyBv
ciBub3QuCj4gPgo+ID4gVXBkYXRlIHRoZSBjYWxsZXJzIG9mIGRybV9tb2RlX2R1bWJfY3JlYXRl
KCkgdG8gc2V0Cj4gPiBkcm1fbW9kZV9kdW1iX2NyZWF0ZS5mbGFncyB0byBhcHByb3ByaWF0ZSBk
ZWZhdWx0cy4gQ3VycmVudGx5LCBmbGFncyBjYW4KPiA+IGJlIHNldCB0byBhbnl0aGluZyBieSB1
c2Vyc3BhY2UsIGJ1dCBpcyB1bnVzZWQgd2l0aGluIHRoZSBrZXJuZWwuIExldCdzCj4gPiBmb3Jj
ZSBmbGFncyB0byB6ZXJvIChubyBrZXJuZWwgbWFwcGluZykgZm9yIHVzZXJzcGFjZSBjYWxsZXJz
IGJ5IGRlZmF1bHQuCj4gPiBGb3IgaW4ga2VybmVsIGNsaWVudHMsIHNldCBEUk1fTU9ERV9EVU1C
X0tFUk5FTF9NQVAgYnkgZGVmYXVsdC4gRHJpdmVycwo+ID4gY2FuIG92ZXJyaWRlIHRoaXMgYXMg
bmVlZGVkLgo+ID4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogTWF4aW1lIFJp
cGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMgICAgICAgfCAxICsKPiA+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVycy5jIHwgNSArKysrLQo+ID4gIGluY2x1ZGUv
dWFwaS9kcm0vZHJtX21vZGUuaCAgICAgICAgfCAyICsrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9jbGllbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMKPiA+
IGluZGV4IGQ5YTJlMzY5NTUyNS4uZGJmYzgwNjFiMzkyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9jbGllbnQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGll
bnQuYwo+ID4gQEAgLTI2NCw2ICsyNjQsNyBAQCBkcm1fY2xpZW50X2J1ZmZlcl9jcmVhdGUoc3Ry
dWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQsIHUzMiB3aWR0aCwgdTMyIGhlaWdodCwgdQo+ID4g
ICAgICAgZHVtYl9hcmdzLndpZHRoID0gd2lkdGg7Cj4gPiAgICAgICBkdW1iX2FyZ3MuaGVpZ2h0
ID0gaGVpZ2h0Owo+ID4gICAgICAgZHVtYl9hcmdzLmJwcCA9IGluZm8tPmNwcFswXSAqIDg7Cj4g
PiArICAgICBkdW1iX2FyZ3MuZmxhZ3MgPSBEUk1fTU9ERV9EVU1CX0tFUk5FTF9NQVA7Cj4gPiAg
ICAgICByZXQgPSBkcm1fbW9kZV9jcmVhdGVfZHVtYihkZXYsICZkdW1iX2FyZ3MsIGNsaWVudC0+
ZmlsZSk7Cj4gPiAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICBnb3RvIGVycl9kZWxl
dGU7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMKPiA+IGluZGV4IGQxOGE3NDBmZTBm
MS4uNzRhMTNmMTRjMTczIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1i
X2J1ZmZlcnMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYwo+
ID4gQEAgLTk3LDcgKzk3LDEwIEBAIGludCBkcm1fbW9kZV9jcmVhdGVfZHVtYihzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAo+ID4gIGludCBkcm1fbW9kZV9jcmVhdGVfZHVtYl9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpk
YXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKPiA+ICB7Cj4gPiAtICAgICByZXR1cm4g
ZHJtX21vZGVfY3JlYXRlX2R1bWIoZGV2LCBkYXRhLCBmaWxlX3ByaXYpOwo+ID4gKyAgICAgc3Ry
dWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iICphcmdzID0gZGF0YTsKPiA+ICsKPiA+ICsgICAgIGFy
Z3MtPmZsYWdzID0gMDsKPgo+IEkgd291bGQgcHJlZmVyIHJldHVybmluZyBhbiBlcnJvciBpZiBm
bGFncyBpcyBzZXQgdG8gYSBub24temVybyB2YWx1ZSwKPiB0byBjYXRjaCB1c2Vyc3BhY2UgZXJy
b3JzIGVhcmx5LCBidXQgSSdtIGFsc28gd29ycmllZCBpdCB3b3VsZCBicmVhawo+IGV4aXN0aW5n
IHVzZXJzcGFjZSBieSB1bmNvdmVyaW5nIGV4aXN0aW5nIGJ1Z3MuIFN0aWxsLCBpZiB3ZSBsYXRl
ciBhZGQKPiBmbGFncyB0aGF0IHVzZXJzcGFjZSBjYW4gc2V0LCB0aG9zZSBleGlzdGluZyBidWdz
IHdpbGwgYmUgdHJpZ2dlcmVkLCBzbwo+IHdlJ2xsIGhhdmUgdG8gZGVhbCB3aXRoIHRoZW0gYW55
d2F5LCBhbmQgd2UgY291bGQgYWxyZWFkeSBnaXZlIGl0IGEgdHJ5LgoKSSB3b3VsZCBsaWtlIHRo
YXQgdG9vLCBidXQgdGhlIGNvbW1lbnQganVzdCBhYm92ZSB0aGlzIGNvZGUgdGVsbHMgbWUKdGhh
dCdzIGxpa2VseSB0byBicmVhayB0aGluZ3M6CgogICAgICAgIC8qCiAgICAgICAgICogaGFuZGxl
LCBwaXRjaCBhbmQgc2l6ZSBhcmUgb3V0cHV0IHBhcmFtZXRlcnMuIFplcm8gdGhlbSBvdXQgdG8K
ICAgICAgICAgKiBwcmV2ZW50IGRyaXZlcnMgZnJvbSBhY2NpZGVudGFsbHkgdXNpbmcgdW5pbml0
aWFsaXplZCBkYXRhLiBTaW5jZQogICAgICAgICAqIG5vdCBhbGwgZXhpc3RpbmcgdXNlcnNwYWNl
IGlzIGNsZWFyaW5nIHRoZXNlIGZpZWxkcyBwcm9wZXJseSB3ZQogICAgICAgICAqIGNhbm5vdCBy
ZWplY3QgSU9DVEwgd2l0aCBnYXJiYWdlIGluIHRoZW0uCiAgICAgICAgICovCgpNYXliZSB1c2Vy
c3BhY2UgZG9lcyBjb3JyZWN0bHkgemVybyBvdXQgaW5wdXQgcGFyYW1zLgoKUm9iCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
