Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD5A14E91
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 17:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4C289951;
	Mon,  6 May 2019 15:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F82F89951
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 15:04:23 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20BFE2087F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 15:04:23 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id c13so15047482qtn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 08:04:23 -0700 (PDT)
X-Gm-Message-State: APjAAAXV6Qr/ac1TuCA3XdI0W4UOpejwybmnx1uCZYGk5KhYv36GhCjU
 usZ7lgpJ9WkXJtqTzkgoLHspVzrz+ZYbnu8mpw==
X-Google-Smtp-Source: APXvYqwTGaTwpQhCxUNSWGGAJ6lrotLyqlbDqtumhudX19OwLFLZtjwpqmue9eoggzwpO7k4YQzf0M3Agg9uhmRbdSE=
X-Received: by 2002:ac8:610f:: with SMTP id a15mr21088874qtm.257.1557155062365; 
 Mon, 06 May 2019 08:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190501121448.3812-1-jagan@amarulasolutions.com>
 <20190501193429.GA9075@ravnborg.org>
 <CAMty3ZAfwVyvmAmenhrQHJcy3eq-Yb61a4WLop_8jS-7vM940A@mail.gmail.com>
In-Reply-To: <CAMty3ZAfwVyvmAmenhrQHJcy3eq-Yb61a4WLop_8jS-7vM940A@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 6 May 2019 10:04:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mYy1JF_cM7sD82aLuUSnZnwsSD6-Q-W1uTp+_oSdRmg@mail.gmail.com>
Message-ID: <CAL_Jsq+mYy1JF_cM7sD82aLuUSnZnwsSD6-Q-W1uTp+_oSdRmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: simple: Add FriendlyELEC HD702E 800x1280
 LCD panel
To: Jagan Teki <jagan@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557155063;
 bh=GTU8OTjGtl5LOFT7cRg59KsW701NKsE0VzSWQUozfUE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Cvs5PHrbtmKdII0xM3nLCehc/8f272vJsChhVCWWGXtXnPy7j1H/KGXvY2kmKL2BW
 ztsO2Cyzhz3QDyMR2bZxoONjXQdNpFbU42iJMQvfAsfgu9+xrUYnRYmd6+1vxUO5xT
 aEepz0ihsx+ItjP/ZKs1EzwY1OQWrEXvEeWPn5E8=
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgNiwgMjAxOSBhdCA0OjU2IEFNIEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPiB3cm90ZToKPgo+IEhpIFNhbSwKPgo+IE9uIFRodSwgTWF5IDIsIDIwMTkg
YXQgMTowNCBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4KPiA+
IEhpIEphZ2FuCj4gPgo+ID4gT24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDU6NDQ6NDdQTSArMDUz
MCwgSmFnYW4gVGVraSB3cm90ZToKPiA+ID4gSEQ3MDJFIGxjZCBpcyBGcmllbmRseUVMRUMgZGV2
ZWxvcGVkIGVEUCBMQ0QgcGFuZWwgd2l0aCA4MDB4MTI4MAo+ID4gPiByZXNvbHV0aW9uLiBJdCBo
YXMgYnVpbHQgaW4gR29vZGl4LCBHVDkyNzEgY2FwdGl2ZSB0b3VjaHNjcmVlbgo+ID4gPiB3aXRo
IGJhY2tsaWdodCBhZGp1c3RhYmxlIHZpYSBQV00uCj4gPiA+Cj4gPiA+IEFkZCBzdXBwb3J0IGZv
ciBpdC4KPiA+ID4KPiA+ID4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFp
bC5jb20+Cj4gPiA+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiA+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiA+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgo+ID4KPiA+IFBsZWFzZSBzdWJtaXQgdGhlIGJpbmRpbmcgaW4gYSBzZXBhcmF0ZSBw
YXRjaCBhcyBwZXIKPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zdWJtaXR0
aW5nLXBhdGNoZXMudHh0Cj4KPiBIbW0uLiBwcmVwYXJlZCBsaWtlIHRoaXMgaW5pdGlhbGx5IGJ1
dCBmZXcgb2YgbXkgcGF0Y2hlcyB3ZXJlIGNvbWJpbmVkCj4gZWFybGllciBldmVuLXRob3VnaCBJ
IHNlbnQgaXQgc2VwYXJhdGVseS4gYW55d2F5IGxldCBtZSBzZXBhcmF0ZSBpdAo+IGFnYWluLgoK
Rm9yIHdoYXQgc3Vic3lzdGVtPyBBbGwgdGhlIG1haW50YWluZXJzIHRoYXQgSSB3YXMgYXdhcmUg
b2YgZG9pbmcgdGhhdApoYXZlIHN0b3BwZWQuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
