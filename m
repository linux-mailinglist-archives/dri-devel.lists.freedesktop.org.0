Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A85A070
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 18:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D3A6E95B;
	Fri, 28 Jun 2019 16:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283DE6E95B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 16:10:22 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE991215EA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 16:10:21 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id c11so5257628qkk.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 09:10:21 -0700 (PDT)
X-Gm-Message-State: APjAAAWP6mB67pqT4S7qd+Ku9LcYyGHSEWs3PqhCkUTwRdcGkI/hzJXW
 euOdxXf/k8mc3jgrG57FgauwFzUjwbHq1+S2og==
X-Google-Smtp-Source: APXvYqyWvAhqS9/ekWTKjDusvBvbzTg0jA8Pn2h4OITXjwQUgHtqy5AWS+DPlCXsn23dZ+IMB0pxlEQeYQRMQrLcvXU=
X-Received: by 2002:a05:620a:1447:: with SMTP id
 i7mr9535724qkl.254.1561738221012; 
 Fri, 28 Jun 2019 09:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190626130007.GE23428@ravnborg.org>
 <CAD=FV=U4UU8q+CS76uuuGUP=EVnE6+BTUf8U=j7uwfczNgkrZw@mail.gmail.com>
 <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
In-Reply-To: <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 28 Jun 2019 10:10:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJGtUTpJL+SDEKi09aDT4yDzY4x9KwYmz08NaZcn=nHfA@mail.gmail.com>
Message-ID: <CAL_JsqJGtUTpJL+SDEKi09aDT4yDzY4x9KwYmz08NaZcn=nHfA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
To: Doug Anderson <dianders@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561738221;
 bh=JT2+LjdeGYwAzgiQO03rJyeR6d1ItE4i/2D95RggsE0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WK6YOV6qVvE0KRPt9YikL6J971ow4Yu2audj9aFOw+PyOMjTrPNbwCqnyr6LtuL6S
 k0615w61hZuNMDr7Akq8rfFhxwP87NBM0L1bAu1cdhPcasKGaEesuXA9h2PK6kEVvq
 dhXOy5pDRJ0jvDtRZyZxn65jVg+JWho3AaMTY7Bc=
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
 Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Sam Ravnborg <sam@ravnborg.org>, Matthias Kaehlcke <mka@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgOTo1NSBBTSBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCA3
OjQxIEFNIERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+
ID4gSGksCj4gPgo+ID4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgNjowMCBBTSBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBEb3VnbGFzLgo+ID4g
Pgo+ID4gPiBPbiBNb24sIEFwciAwMSwgMjAxOSBhdCAxMDoxNzoxN0FNIC0wNzAwLCBEb3VnbGFz
IEFuZGVyc29uIHdyb3RlOgo+ID4gPiA+IEknbSByZXZpdmluZyBTZWFuIFBhdWwncyBvbGQgcGF0
Y2hzZXQgdG8gZ2V0IG1vZGUgc3VwcG9ydCBpbiBkZXZpY2UKPiA+ID4gPiB0cmVlLiAgVGhlIGNv
dmVyIGxldHRlciBmb3IgaGlzIHYzIGlzIGF0Ogo+ID4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE4LUZlYnJ1YXJ5LzE2NTE2Mi5odG1sCj4g
PiA+ID4KPiA+ID4gPiBObyBjb2RlIGlzIGRpZmZlcmVudCBiZXR3ZWVuIHY0IGFuZCB2NSwganVz
dCBjb21taXQgbWVzc2FnZXMgYW5kIHRleHQKPiA+ID4gPiBpbiB0aGUgYmluZGluZ3MuCj4gPiA+
ID4KPiA+ID4gPiBJJ3ZlIHB1bGxlZCB0b2dldGhlciB0aGUgcGF0Y2hlcyB0aGF0IGRpZG4ndCBs
YW5kIGluIHYzLCBhZGRyZXNzZWQKPiA+ID4gPiBvdXRzdGFuZGluZyBmZWVkYmFjaywgYW5kIHJl
cG9zdGVkLiAgQXRvcCB0aGVtIEkndmUgYWRkZWQgcGF0Y2hlcyBmb3IKPiA+ID4gPiByazMyODgt
dmV5cm9uLWNocm9tZWJvb2sgKHVzZWQgZm9yIGphcSwgamVycnksIG1pZ2h0eSwgc3BlZWR5KSBh
bmQKPiA+ID4gPiByazMyODgtdmVyeW9uLW1pbm5pZS4KPiA+ID4gPgo+ID4gPiA+IFBsZWFzZSBs
ZXQgbWUga25vdyBob3cgdGhleSBsb29rLgo+ID4gPiA+Cj4gPiA+ID4gSW4gZ2VuZXJhbCBJIGhh
dmUgYWRkZWQgcGVvcGxlIHRvIHRoZSB3aG9sZSBzZXJpZXMgd2hvIEkgdGhpbmsgd291bGQKPiA+
ID4gPiBsaWtlIHRoZSB3aG9sZSBzZXJpZXMgYW5kIHRoZW4gbGV0IGdldF9tYWludGFpbmVyIHBp
Y2sgZXh0cmEgcGVvcGxlIGl0Cj4gPiA+ID4gdGhpbmtzIGFyZSByZWxldmFudCB0byBlYWNoIGlu
ZGl2aWR1YWwgcGF0Y2guICBJZiBJIHNlZSB5b3UgcmVzcG9uZCB0bwo+ID4gPiA+IGFueSBvZiB0
aGUgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzLCB0aG91Z2gsIEknbGwgYWRkIHlvdSB0byB0aGUgd2hv
bGUKPiA+ID4gPiBzZXJpZXMgQ2MgbGlzdCBuZXh0IHRpbWUuCj4gPiA+ID4KPiA+ID4gPiBDaGFu
Z2VzIGluIHY1Ogo+ID4gPiA+IC0gUmVtb3ZlZCBiaXQgYWJvdXQgT1MgbWF5IGlnbm9yZSAoUm9i
L0V6ZXF1aWVsKQo+ID4gPiA+IC0gQWRkZWQgSGVpa28ncyBUZXN0ZWQtYnkKPiA+ID4gPiAtIEl0
J3Mgbm90IGp1c3QgamVycnksIGl0J3MgbW9zdCByazMyODggQ2hyb21lYm9va3MgKEhlaWtvKQo+
ID4gPgo+ID4gPiBXaGF0IGFyZSB0aGUgcGxhbnMgdG8gbW92ZSBmb3J3YXJkIHdpdGggdGhpcz8K
PiA+ID4gT3IgZGlkIHlvdSBkcm9wIHRoZSB3aG9sZSBpZGVhIGFnYWluPwo+ID4KPiA+IEF0IHRo
ZSBtb21lbnQgSSdtIGJsb2NrZWQgb24gVGhpZXJyeSByZXNwb25kaW5nLCBlaXRoZXIgdGFraW5n
IHRoZQo+ID4gcGF0Y2ggb3IgdGVsbGluZyBtZSB3aGF0IEkgbmVlZCB0byBkbyB0byBmaXggaXQu
ICBJIHNhdyBTZWFuIFBhdWwgcGluZwo+ID4gVGhpZXJyeSBvbiBJUkMgb24gSnVuZSAzcmQgYW5k
IGFzIGZhciBhcyBJIGNvdWxkIHRlbGwgdGhlcmUgd2FzIG5vCj4gPiByZXNwb25zZS4KPiA+Cj4g
PiBodHRwczovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmNicmlsbC9kcmktbG9nLz9jaGFubmVs
PWRyaS1kZXZlbCZoaWdobGlnaHRfbmFtZXM9JmRhdGU9MjAxOS0wNi0wMyZzaG93X2h0bWw9dHJ1
ZQo+ID4KPiA+IC4uLmFuZCBhcyB5b3UgY2FuIHNlZSBIZWlrbyBwaW5nZWQgdGhpcyB0aHJlYWQg
b24gSnVuZSAxNHRoLgo+ID4KPiA+IFRoaWVycnk6IGNhbiB5b3UgaGVscCBnaXZlIHVzIHNvbWUg
ZGlyZWN0aW9uPyAgQXJlIHlvdSB1bmludGVyZXN0ZWQgaW4KPiA+IHJldmlld2luZyB0aGVtIGFu
ZCB3b3VsZCBwcmVmZXIgdGhhdCBJIGZpbmQgc29tZW9uZSB0byBsYW5kIHRoZW0gaW4KPiA+IGRy
bS1taXNjIGRpcmVjdGx5Pwo+Cj4gU2FtOiBPaCEgIEkgaGFkbid0IG5vdGljZWQgdGhhdCB5b3Un
dmUgYmVlbiBhZGRlZCBhcyBhIHBhbmVsCj4gbWFpbnRhaW5lciBpbiBjb21taXQgZWYwZGI5NGY5
NGEwICgiTUFJTlRBSU5FUlM6IEFkZCBTYW0gYXMgcmV2aWV3ZXIKPiBmb3IgZHJtL3BhbmVsIiku
ICBEb2VzIHRoYXQgbWVhbiB5b3UgYXJlIGFibGUgdG8gcHJvdmlkZSBzb21lIGFkdmljZQo+IGZv
ciBob3cgdG8gbGFuZCB0aGlzIHNlcmllcz8gIEFzIGZhciBhcyBJIGtub3cgZXZlcnl0aGluZyBp
cyBpbiBvcmRlcgo+IGZvciBpdCB0byBsYW5kLCBidXQgaWYgeW91IGFyZSBhd2FyZSBvZiBzb21l
dGhpbmcgSSBuZWVkIHRvIGRvIHRvIHNwaW4KPiBpdCB0aGVuIHBsZWFzZSBsZXQgbWUga25vdyEK
CkJUVywgYXQgbGVhc3QgZm9yIHRoZSBiaW5kaW5nLCB0aGlzIHdpbGwgZ2V0IGltcGxpY2l0bHkg
c3VwcG9ydGVkIGluCnRoZSBzY2hlbWEgY29udmVyc2lvblsxXSBhcyBzaW1wbGUtcGFuZWwgYXMg
YSBiaW5kaW5nIGlzIGdvbmUgYW5kCnBhbmVsLWNvbW1vbiBhbHJlYWR5IGhhZCB0aW1pbmcgbm9k
ZSBkZWZpbmVkLiBBIHNjaGVtYSBmb3IgdGhlIHRpbWluZwpub2RlIGlzIHN0aWxsIG5lZWRlZCB0
aG91Z2ggKGhpbnQgOikgKS4KClJvYgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cGF0Y2gvMTEyMTUzOC8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
