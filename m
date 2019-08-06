Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED3682F1A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 11:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185A66E34C;
	Tue,  6 Aug 2019 09:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846946E34C;
 Tue,  6 Aug 2019 09:55:35 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id k9so57886059vso.5;
 Tue, 06 Aug 2019 02:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+upkzAhjNnrY2svkrtOcphtlM5AJgWan1eZgAmpG/Gw=;
 b=OL1EE4uJIiUgx5+iDm4BeevytmsMVbJVe6DtRF/S32wQSjIEOb9jgMU+4iJCmSwyiL
 TrSJDGcu/MW5i+gJdviTnlMeq9wzYW23RBeq/IXS6rkHZOrIOd+NdGHnZgtFFDPFOtat
 UBThNywAKJnTW34VQAGSMwEhNKRDcEn6LT2cIP+E4MO1hnAvxGMMMNR+cGuTB5eCzJu+
 KW9nS8ZX/f4pTSnEWTqSpTotHXW/ZEKI2dGHC+7ppFTrcWFtm0/Y0XtBi1H+O7FeUGCf
 ghUfETrU1meq0oMsKt2SLsb+e+PZkIOdWd0vb+xYFQ0352Vn4ipnquCg5ntfjsOguBxC
 DLQg==
X-Gm-Message-State: APjAAAX/9bFaiTE4m84lqtekj5AT7lKINfKQ4yiHSu73IQQ/Qar+SYZn
 VMwlWlMhrndNd3k4Bi5dnnT+UQ6GUBXsOzS65G16bw==
X-Google-Smtp-Source: APXvYqwS6OreF5BRktADfeBkUsWcYHU0ScQQcqw9XDMH1CF1DqfOULALD+7iB6KrJCByGRLCCe5YLQTykbFJAlh0EkA=
X-Received: by 2002:a67:79d4:: with SMTP id u203mr1754252vsc.85.1565085334592; 
 Tue, 06 Aug 2019 02:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
 <CACvgo51Do4XDY9wRku-0v5B+mRRzV2+SgD=dvFT3J9TMf8RK9Q@mail.gmail.com>
 <CAKMK7uEcoQK+y6y2wW6GJzKDjtPZZ5gads3JY6xL+JiP+2QABQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEcoQK+y6y2wW6GJzKDjtPZZ5gads3JY6xL+JiP+2QABQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 6 Aug 2019 10:54:45 +0100
Message-ID: <CACvgo50z6bGu4=jqEHCSUOd_geadEwuOcOquLiVRsCdRroG2fg@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+upkzAhjNnrY2svkrtOcphtlM5AJgWan1eZgAmpG/Gw=;
 b=FcYHLodoGpYeU4Y0XcEK1tvBIDGIjGHL0GKLxqcUnYfA+6JGLw+sdvhkyI8XrmeAPh
 QOWTmRiQMcWoZpxbJfTSPzJZ8ZA84zr9E8cvc8W6TwSdyej7BZcdClpl6bmkyPk05i33
 qCuXHFI/EqJeVxNypUpUc/S/Cft9ZMCfso1UgP80+dORxvgWE1grJJLYieNxbCJlSGqI
 9eRU7+G+xerD3LRwdy/jPCVOaqlK/DLuRda5jViNjqAztc7aLmJ4vwQxoSWDV/NCzt/Y
 qMybY8TWcJgGNLiN0UtNBL1E81SU7LR4fSHDMHdmXFQ6pTOL2q5L4KGJCaDArbVS40sY
 1r8A==
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA2IEF1ZyAyMDE5IGF0IDEwOjQ5LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDYsIDIwMTkgYXQgMTE6NDAgQU0gRW1p
bCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gT24gVHVlLCA2
IEF1ZyAyMDE5IGF0IDA4OjM0LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCAyOjM0IEFNIERhdmUg
QWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBTYXQs
IDMgQXVnIDIwMTkgYXQgMjA6NDcsIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxp
bi5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIERhbmllbCwgRGF2ZSwKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBIZXJlIGlzIHRoZSBmaXJzdCAoYW5kIHByZXR0eSBsYXRlKSBkcm0tbWlz
Yy1uZXh0IFBSLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEl0J3MgcHJldHR5IGJpZyBkdWUgdG8gdGhl
IGxhdGVuZXNzLCBidXQgdGhlcmUncyBub3RoaW5nIHJlYWxseSBtYWpvcgo+ID4gPiA+ID4gc2hv
d2luZyB1cC4gSXQncyBwcmV0dHkgbXVjaCB0aGUgdXN1YWwgYnVuY2ggb2YgcmV3b3JrcywgZml4
ZXMsIGFuZAo+ID4gPiA+ID4gbmV3IGhlbHBlcnMgYmVpbmcgaW50cm9kdWNlZC4KPiA+ID4gPiA+
Cj4gPiA+ID4KPiA+ID4gPiBkaW06IDQxNWQyZTllMDc1NyAoIlJldmVydCAiZHJtL2dlbTogUmVu
YW1lIGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkKPiA+ID4gPiB0byBkcm1fZ2VtX21hcF9vZmZz
ZXQoKSIiKTogbWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+ID4gPiA+IGRpbTogYmU4NTUzODJi
YWNiICgiUmV2ZXJ0ICJkcm0vcGFuZnJvc3Q6IFVzZSBkcm1fZ2VtX21hcF9vZmZzZXQoKSIiKToK
PiA+ID4gPiBtYW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCj4gPiA+ID4gZGltOiBlNGVlZTkzZDI1
NzcgKCJkcm0vdmdlbTogZHJvcCBEUk1fQVVUSCB1c2FnZSBmcm9tIHRoZSBkcml2ZXIiKToKPiA+
ID4gPiBtYW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCj4gPiA+ID4gZGltOiA4ODIwOWQyYzUwMzUg
KCJkcm0vbXNtOiBkcm9wIERSTV9BVVRIIHVzYWdlIGZyb20gdGhlIGRyaXZlciIpOgo+ID4gPiA+
IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+ID4gPiBkaW06IGNjZGFlNDI1NzU2OSAoImRy
bS9ub3V2ZWF1OiByZW1vdmUgb3Blbi1jb2RlZCBkcm1faW52YWxpZF9vcCgpIik6Cj4gPiA+ID4g
bWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+ID4gPiA+Cj4gPiA+ID4gUHJldHR5IHN1cmUgcmV2
aWV3IGluIGRybS1taXNjLW5leHQgaXMgYSBydWxlLiBJIGRvbid0IGV2ZW4gc2VlIGFja3MKPiA+
ID4gPiBvbiBtb3N0IG9mIHRoZXNlLgo+ID4gPgo+ID4gPiBZZXMuIEkgZ3Vlc3MgZm9yIHJldmVy
dHMgaXQncyBub3QgY29vbCwgYnV0IGFsc28gbm90IHRoZSB3b3JzdC4gU3RpbGwKPiA+ID4gYmV0
dGVyIHRvIGdldCBzb21lb25lIHRvIGFjaywgaGVjayBJIGNhbiBwdWxsIHRoYXQgb2ZmIGZvciBl
bWVyZ2VuY3kKPiA+ID4gcmV2ZXJ0cyB3aXRoIGEgZmV3IHBpbmdzIG9uIGlyYywgYW5kIHRoZSAy
IHJldmVydHMgbGFuZGVkIG11Y2ggbGF0ZXIuCj4gPiA+IEJ1dCBmb3Igbm9ybWFsIHBhdGNoZXMg
aXQncyBkZWZpbml0ZWx5IG5vdCBvayBhdCBhbGwuIEFsc28gb25seQo+ID4gPiBwb3NzaWJsZSBp
ZiBwZW9wbGUgYnlwYXNzIHRoZSB0b29saW5nLCBvciBvdmVycmlkZSB0aGUgdG9vbGluZyB3aXRo
Cj4gPiA+IHRoZSAtZiBmbGFnIHRvIGZvcmNlIGEgcHVzaC4KPiA+ID4KPiA+ID4gUm9iLCBFbWls
LCB3aGF0J3MgdXAgaGVyZT8KPiA+ID4KPiA+IEkndmUgZ290IHdhcyBhbiAiVGhhbmtzIiBbMV0g
ZnJvbSBCZW4gb24gdGhlIG5vdXZlYXUgcGF0Y2ggLSBzbyBJIG1lcmdlZCBpdC4KPiA+IFRoZSBt
c20gYW5kIHZnZW0gb25lcyBhcmUgbXkgYmFkIC0gbXVzdCBoYXZlIG1pc3NlZCB0aG9zZSBvbmUK
PiA+IGluYmV0d2VlbiB0aGUgb3RoZXIgcGF0Y2hlcy4KPgo+IFRoZSB0aGluZyBpcywgZGltIHB1
c2ggc2hvdWxkbid0IGFsbG93IHlvdSB0byBkbyB0aGF0LiBBbmQgdGhlIHBhdGNoZXMKPiBoYXZl
IGNsZWFybHkgYmVlbiBhcHBsaWVkIHdpdGggZGltIGFwcGx5IChvciBhdCBsZWFzdCB5b3UgYWRk
ZWQgdGhlCj4gTGluayksIHVubGlrZSBSb2Igd2hvIHNlZW1zIHRvIGp1c3QgaGF2ZSBwdXNoZWQg
dGhlIHJldmVydC4KPgpUaGFua3MsIGRpZCBub3Qga25vdyBhYm91dCBkaW0gcHVzaC4gV2lsbCBt
YWtlIHN1cmUgSSB1c2UgaXQuCgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
