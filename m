Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7C82CDC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF566E2E3;
	Tue,  6 Aug 2019 07:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A264F6E2F3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 07:34:34 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id g7so65175724oia.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 00:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LiH4E3pS+n4JYxcNVQYxaVOxfIRIcTX/uS8hz4RGcc=;
 b=IxD6BYLq9m90b3SZgizPcAheHKZTZc8SzMjAkESa7mN3uNwnc2OLlWp56U/xINi9NF
 SNx7V5ZDE0d4/7Jxdbm0Mq7McwWArYOsuAXFqPItD2RpwDIgIJh+MF/Ip1/yIBLCdDR6
 i3lOnbTUiAgesSOBxYKNKXnbcgoFAcRZeV/tXq3lGxk9TbDO6UaKt1+m6p7V3jdsQenm
 +VZSMNn+fyLvK3G0M2m/fYAjQ758W8YfHh0uZcneZQ/jpuEhKlUmMhBgZKtrW01oD0k6
 Uc4dwx+h2yFtcfpHQIs0QF/OePeGCn4QHhKnyC9kgehm1emAiZS0llPhy+YzBDwLjQ0C
 SG9g==
X-Gm-Message-State: APjAAAXeNvrJafQaNXFGtWQjDYJC4INeWKiqKR6dnK8roZYZwPGtLo+Q
 9ivLhAxfjKfCUghucpQ5QcT0H01tuv48zfS1dZn+Ag==
X-Google-Smtp-Source: APXvYqya6qioZcbXw2lJ3YjnGHpYoIvBfAs6Qumsb18Fzgw5QZ7/2j4kPM3SZ6ZcqN0QHnm5LjAi7Td7vX9hIgIx2YM=
X-Received: by 2002:a54:4f89:: with SMTP id g9mr892619oiy.110.1565076873785;
 Tue, 06 Aug 2019 00:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
In-Reply-To: <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Aug 2019 09:34:23 +0200
Message-ID: <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>, 
 Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+LiH4E3pS+n4JYxcNVQYxaVOxfIRIcTX/uS8hz4RGcc=;
 b=jEqALIAPKBuziMlbwYZu3x8H9XEhaTD9o/IrmMvySJfI4PMYa3DWPvckLuhR9DqcPk
 0Ov2DBtNL9jnLghgOSYz+WcWFUPA3ae12s5Ggs558mXim66EXYIEA0bge+15ue5GFiNv
 FZEyeC7wJrsQUBEkRiCh3Xb2Fm5z4Vxy8clj4=
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAyOjM0IEFNIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIDMgQXVnIDIwMTkgYXQgMjA6NDcsIE1heGltZSBSaXBh
cmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIERhbmllbCwg
RGF2ZSwKPiA+Cj4gPiBIZXJlIGlzIHRoZSBmaXJzdCAoYW5kIHByZXR0eSBsYXRlKSBkcm0tbWlz
Yy1uZXh0IFBSLgo+ID4KPiA+IEl0J3MgcHJldHR5IGJpZyBkdWUgdG8gdGhlIGxhdGVuZXNzLCBi
dXQgdGhlcmUncyBub3RoaW5nIHJlYWxseSBtYWpvcgo+ID4gc2hvd2luZyB1cC4gSXQncyBwcmV0
dHkgbXVjaCB0aGUgdXN1YWwgYnVuY2ggb2YgcmV3b3JrcywgZml4ZXMsIGFuZAo+ID4gbmV3IGhl
bHBlcnMgYmVpbmcgaW50cm9kdWNlZC4KPiA+Cj4KPiBkaW06IDQxNWQyZTllMDc1NyAoIlJldmVy
dCAiZHJtL2dlbTogUmVuYW1lIGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkKPiB0byBkcm1fZ2Vt
X21hcF9vZmZzZXQoKSIiKTogbWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+IGRpbTogYmU4NTUz
ODJiYWNiICgiUmV2ZXJ0ICJkcm0vcGFuZnJvc3Q6IFVzZSBkcm1fZ2VtX21hcF9vZmZzZXQoKSIi
KToKPiBtYW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCj4gZGltOiBlNGVlZTkzZDI1NzcgKCJkcm0v
dmdlbTogZHJvcCBEUk1fQVVUSCB1c2FnZSBmcm9tIHRoZSBkcml2ZXIiKToKPiBtYW5kYXRvcnkg
cmV2aWV3IG1pc3NpbmcuCj4gZGltOiA4ODIwOWQyYzUwMzUgKCJkcm0vbXNtOiBkcm9wIERSTV9B
VVRIIHVzYWdlIGZyb20gdGhlIGRyaXZlciIpOgo+IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4K
PiBkaW06IGNjZGFlNDI1NzU2OSAoImRybS9ub3V2ZWF1OiByZW1vdmUgb3Blbi1jb2RlZCBkcm1f
aW52YWxpZF9vcCgpIik6Cj4gbWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+Cj4gUHJldHR5IHN1
cmUgcmV2aWV3IGluIGRybS1taXNjLW5leHQgaXMgYSBydWxlLiBJIGRvbid0IGV2ZW4gc2VlIGFj
a3MKPiBvbiBtb3N0IG9mIHRoZXNlLgoKWWVzLiBJIGd1ZXNzIGZvciByZXZlcnRzIGl0J3Mgbm90
IGNvb2wsIGJ1dCBhbHNvIG5vdCB0aGUgd29yc3QuIFN0aWxsCmJldHRlciB0byBnZXQgc29tZW9u
ZSB0byBhY2ssIGhlY2sgSSBjYW4gcHVsbCB0aGF0IG9mZiBmb3IgZW1lcmdlbmN5CnJldmVydHMg
d2l0aCBhIGZldyBwaW5ncyBvbiBpcmMsIGFuZCB0aGUgMiByZXZlcnRzIGxhbmRlZCBtdWNoIGxh
dGVyLgpCdXQgZm9yIG5vcm1hbCBwYXRjaGVzIGl0J3MgZGVmaW5pdGVseSBub3Qgb2sgYXQgYWxs
LiBBbHNvIG9ubHkKcG9zc2libGUgaWYgcGVvcGxlIGJ5cGFzcyB0aGUgdG9vbGluZywgb3Igb3Zl
cnJpZGUgdGhlIHRvb2xpbmcgd2l0aAp0aGUgLWYgZmxhZyB0byBmb3JjZSBhIHB1c2guCgpSb2Is
IEVtaWwsIHdoYXQncyB1cCBoZXJlPwoKVGhhbmtzLCBEYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
