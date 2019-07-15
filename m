Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A859069A77
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 20:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1860892F2;
	Mon, 15 Jul 2019 18:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FCD892F2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:07:01 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w79so13379661oif.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79WYKtJ+U35PauFrpeLqVRnz0ZJBCqDpFetboHZqtQw=;
 b=k/ATs4wQUJVMRH4DJNbt7FvI0plmNC8DQeI59gln0+AJzvuLxNkC8T4Gy4ankzE5Dc
 ARpIYIbRcAxQDwLuoCw4L59zBVPZQgHDImv0UNtZUTuRyNhDNexPJ4aG6VDwarYWuUX9
 66nnkw4/hFp/y6bYCVlWxF0lSegIWDZclkMCstpcfRi6d71yoM8k+GBxHqCTfC/KFxUE
 3SV+odr2Rkioaoxnqv0qdLehyiW8Pj5N2lV8pCSbtKHczxoHMWFEVAWbmDjrieEwnyw4
 E4wlQ5qCEAE2xABaFe+RSE8UlyjJ2VS/F3MpXUI0zCurGKv/cKgpRifkQKPhVEMXFyO0
 Rixg==
X-Gm-Message-State: APjAAAXWBj+6g/f/0wPuU+2YGOrnGz2wxdO3vGDW+DLWGv3BhYmxvR+s
 1fi0IRukm635VhQ/+ZOwjQ+XCAbXhm2JJ5k96cI=
X-Google-Smtp-Source: APXvYqxzSU5VMQ6W7ahIw1tUeCUhSmeOrOvmNhiu3ovS8GKEsu6H2nLQglHA3soLdt+CtkULzqcxQ6i2v25QfXXtMUs=
X-Received: by 2002:aca:b104:: with SMTP id a4mr13598437oif.14.1563214020306; 
 Mon, 15 Jul 2019 11:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
 <20190715122924.GA15202@mellanox.com>
 <CAKMK7uHvjuQ5Dqm0LPrtQxdHh5Z6Pt2mg4AnpRRR0gWb1Wp05g@mail.gmail.com>
 <20190715150402.GD15202@mellanox.com>
 <CAKMK7uGbNuA_pN=r9XKGz2MTVVJWm6q8tKBT3WJPa93nKEe4iA@mail.gmail.com>
 <20190715175726.GC5043@mellanox.com>
In-Reply-To: <20190715175726.GC5043@mellanox.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 15 Jul 2019 20:06:49 +0200
Message-ID: <CAKMK7uGYm3Kb+vUMmpWxYAjTxneUSddBAwHKg+yn0dPsaorETw@mail.gmail.com>
Subject: Re: DRM pull for v5.3-rc1
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=79WYKtJ+U35PauFrpeLqVRnz0ZJBCqDpFetboHZqtQw=;
 b=I5zGheaVWY4Ec6Nj5/hrdukIf4e19bZQ0No77m6mTAowcvkmcvdj0kdrkqOp2YTtGZ
 m+tREyMLN0g9vH+Xx/PiicPd46J4BI5Rj5zBSYok/dkQzK+0j5Pq49Q3eAMXaOzKnC3M
 cvCh4tm7UzHjXbL6Gk0kHG0T6yR+Ao6qG+3Gw=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgNzo1NyBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDc6NTM6MDZQTSAr
MDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPgo+ID4gPiBTbywgSSdsbCBwdXQgaXQgb24gYSB0
b3BpYyBhbmQgc2VuZCB5b3UgdHdvIGEgbm90ZSBuZXh0IHdlZWsgdG8gZGVjaWRlCj4gPiA+IGlm
IHlvdSB3YW50IHRvIG1lcmdlIGl0IG9yIG5vdC4gSSdtIHJlYWxseSB1bmNsZWFyIGhvdyBub3V2
ZWF1J3MgYW5kCj4gPiA+IEFNRCdzIHBhdGNoZmxvdyB3b3Jrcy4uCj4gPgo+ID4gRFJNIGlzIDIt
bGV2ZWwgZm9yIHByZXR0eSBtdWNoIGV2ZXJ5dGhpbmcuIEZpcnN0IGl0IGxhbmRzIGluIGEgZHJp
dmVyCj4gPiB0cmVlIChvciBhIGNvbGxlY3RpdiBvZiBkcml2ZXJzLCBsaWtlIGluIGRybS1taXNj
KS4gVGhlbiB0aG9zZSBzZW5kCj4gPiBwdWxsIHJlcXVlc3RzIHRvIGRybS5naXQgZm9yIGludGVn
cmF0aW9uLiBCdXN5IHRyZWVzIGRvIHRoYXQgZXZlcnkgMS0yCj4gPiB3ZWVrcyAoZS5nLiBhbWRn
cHUpLCBzbG93ZXIgdHJlZXMgb25jZSBwZXIgbWVyZ2Ugd2luZG93IChlLmcuIG5vdXZlYXUpCj4g
PiBmb3IgZHJtLW5leHQsIHNpbWlsYXIgZm9yIGRybS1maXhlcy4KPgo+IFRoZSBEUk0gcGFydCBz
ZWVtcyBsb2dpY2FsIC0gaXQgaXMgaG93IHRoZSBBTUQgR1BVIGFuZCBub3V2ZWF1IGdpdAo+IHRy
ZWVzIHRyZWVzIHdvcmsgdGhhdCBJIGRvbid0IGtub3cuIEkgaGVhcmQgdGhhdCBuZWl0aGVyIGNv
dWxkIHRha2UgaW4KPiBhIHN0YWJsZSB0b3BpYyBicmFuY2g/CgpIbSB5ZWFoIHRoZXkncmUgYSBi
aXQgc3BlY2lhbC4gTm91dmVhdSBpcyBtb3N0bHkgZGV2ZWxvcGVkIGluCnVzZXJzcGFjZSwgYXQg
bGVhc3QgYnkgaXQncyBtYWluIGRldmVsb3BlciBCZW4gU2tlZ2dzLiBCdXQgZ2VuZXJhbGx5Cmhl
J3MgdGFraW5nIGNhcmUgb2Ygc2h1ZmZsaW5nIHBhdGNoZXMgYmFjayZmb3J0aCB1c2luZyBzY3Jp
cHRzLgpVc3VhbGx5IGVhc2llciB0byBkbyBhbnkgbWVyZ2VzIGFuZCBzdHVmZiBpbiBkcm0uZ2l0
IHRob3VnaC4KCkFNRCBpcyBhIGRpZmZlcmVudCBjYXNlLCB0aGV5J3ZlIGRpc2FwcGVhcmVkIHF1
aXRlIGEgbG90IGJlaGluZCB0aGUKYW1kIGZpcmV3YWxscyB3aXRoIHRoZSBuZXcgY29kZWJhc2Uu
IFNvIHRoZXJlIHRoZSByZWJhc2luZy1iZWZvcmUtcHVsbAppcyBmb3IgY29ycG9yYXRlIHBvbGl0
aWNzIHJlYXNvbnMgaXQgc2VlbXMsIGFuZCByZWFsbHkgbm90IG5lZWRlZCBmb3IKYW55IHRlY2hu
aWNhbCByZWFzb25zICh1bmxpa2Ugbm91dmVhdSwgd2hlcmUgcmV2ZXJzZS1lbmdpbmVlcmluZyBo
dyBpbgp1c2Vyc3BhY2UgaXMgYSBsb3QgbmljZXIgdGhhbiBjcmFzaGluZyBrZXJuZWxzKS4gRGF2
ZSZtZSBoYXZlIGJlZW4KbmFnZ2luZyB0aGVtIGZvciBhIGZldyB5ZWFycyBub3cgdG8gZml4IHRo
aXMuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
