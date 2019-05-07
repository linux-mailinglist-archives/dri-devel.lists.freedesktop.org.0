Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B01644A
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 15:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC9B89B5F;
	Tue,  7 May 2019 13:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AB889B5F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 13:10:48 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id a10so14801176otl.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 06:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pAgdAjAQ41e+k9RIOAaf7UwVPbjN19zPzB9CqtCyi8o=;
 b=Rv+/U4efXYKRZuKzMJgfJ+5v3f342AXMaZSDt9pCaSzdmcf1hrsRlool7DQBFZXD57
 VxMAjO2uB2fNNU/X9lQbp83L5oJppqaYSuOWe5H8DW5n/GbYdo3HLn/yNQ3D/bJ5jwVF
 B9hSJG8r9HfWyFzL0MU9CJ6qSfdaGkdsvqT1Mxu+r76iu4O/fK84Lfyg69jriEgnd86s
 2HXBbylIiqn7tK+tkgbndC5xP/gfmtB+3llYnxxsqX6+QsJ2FwhcjjSi5TFMiTfhmcel
 UifIq/2iBHzfXrD99h8c2UyULu0rHcNR/5BsHhYz6e+/fjMReHSUqHaFPtVaeaW83Mbj
 +nAQ==
X-Gm-Message-State: APjAAAWtFzRIZYtnmrnefkZZ8r9zz0yYb89nPcAD4yuN/U+4SAqrr8Sa
 KM+dKEaNhoMeAlq4kIBtStG/2U3zY/r8MFSHNNaz8QSW/jY=
X-Google-Smtp-Source: APXvYqyq6Oa3R9ujCSp5aX2pGJv5ioCCjL3fBgrFeYLXZnoYKeISsxqO4YXczAuWqNLSXAJntbNAN0ExsIJit4gfVno=
X-Received: by 2002:a05:6830:111:: with SMTP id
 i17mr4016302otp.322.1557234647846; 
 Tue, 07 May 2019 06:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190501121448.3812-1-jagan@amarulasolutions.com>
 <20190501193429.GA9075@ravnborg.org>
 <CAMty3ZAfwVyvmAmenhrQHJcy3eq-Yb61a4WLop_8jS-7vM940A@mail.gmail.com>
 <CAL_Jsq+mYy1JF_cM7sD82aLuUSnZnwsSD6-Q-W1uTp+_oSdRmg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+mYy1JF_cM7sD82aLuUSnZnwsSD6-Q-W1uTp+_oSdRmg@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 7 May 2019 18:40:36 +0530
Message-ID: <CAMty3ZBpRABe4u26ZN91JRB+vVF4Z96k-LDoe37d6EdVDkfJsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: simple: Add FriendlyELEC HD702E 800x1280
 LCD panel
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pAgdAjAQ41e+k9RIOAaf7UwVPbjN19zPzB9CqtCyi8o=;
 b=S8yvcDyHGUuySevVVbPrSHU3t8AKRaaUF6KGBJy+P2dAJmiCw3ZklE01rjGliEZPW4
 C2yMlpkmHc1FHLb2I0w5+p1/BEmwSl2dl/i+CsulO4YWdZcu/KtbaktRVu7wpNNzIGXI
 zbFYwyoJyeynlp/9dqdvyIh1uQnz4KrRNOPaI=
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

T24gTW9uLCBNYXkgNiwgMjAxOSBhdCA4OjM0IFBNIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgNiwgMjAxOSBhdCA0OjU2IEFNIEphZ2FuIFRl
a2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBTYW0sCj4g
Pgo+ID4gT24gVGh1LCBNYXkgMiwgMjAxOSBhdCAxOjA0IEFNIFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEphZ2FuCj4gPiA+Cj4gPiA+IE9uIFdl
ZCwgTWF5IDAxLCAyMDE5IGF0IDA1OjQ0OjQ3UE0gKzA1MzAsIEphZ2FuIFRla2kgd3JvdGU6Cj4g
PiA+ID4gSEQ3MDJFIGxjZCBpcyBGcmllbmRseUVMRUMgZGV2ZWxvcGVkIGVEUCBMQ0QgcGFuZWwg
d2l0aCA4MDB4MTI4MAo+ID4gPiA+IHJlc29sdXRpb24uIEl0IGhhcyBidWlsdCBpbiBHb29kaXgs
IEdUOTI3MSBjYXB0aXZlIHRvdWNoc2NyZWVuCj4gPiA+ID4gd2l0aCBiYWNrbGlnaHQgYWRqdXN0
YWJsZSB2aWEgUFdNLgo+ID4gPiA+Cj4gPiA+ID4gQWRkIHN1cHBvcnQgZm9yIGl0Lgo+ID4gPiA+
Cj4gPiA+ID4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4g
PiA+ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+ID4gPiBDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4gPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRp
b25zLmNvbT4KPiA+ID4KPiA+ID4gUGxlYXNlIHN1Ym1pdCB0aGUgYmluZGluZyBpbiBhIHNlcGFy
YXRlIHBhdGNoIGFzIHBlcgo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c3VibWl0dGluZy1wYXRjaGVzLnR4dAo+ID4KPiA+IEhtbS4uIHByZXBhcmVkIGxpa2UgdGhpcyBp
bml0aWFsbHkgYnV0IGZldyBvZiBteSBwYXRjaGVzIHdlcmUgY29tYmluZWQKPiA+IGVhcmxpZXIg
ZXZlbi10aG91Z2ggSSBzZW50IGl0IHNlcGFyYXRlbHkuIGFueXdheSBsZXQgbWUgc2VwYXJhdGUg
aXQKPiA+IGFnYWluLgo+Cj4gRm9yIHdoYXQgc3Vic3lzdGVtPyBBbGwgdGhlIG1haW50YWluZXJz
IHRoYXQgSSB3YXMgYXdhcmUgb2YgZG9pbmcgdGhhdAo+IGhhdmUgc3RvcHBlZC4KCk1heSBiZSBp
dCB3YXMgcmVjZW50LCBEbWl0cnkgY29tYmluZWQgYnkgcHJldmlvdXMgZHQgYW5kIGRyaXZlciBj
aGFuZ2VzLgoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2lkPWFlOTdmYjU4OTY0OGNkNTU1OGYxY2VlYTMx
NzQwNGE2MzkzMDc1MDEKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2lkPWE1ZjUwYzUwMTMyMTI0OWQ2NzYx
MTM1M2RkZTZkNjhkNDhjNWI5NTkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
