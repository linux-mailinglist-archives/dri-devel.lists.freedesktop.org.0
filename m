Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F74A82FB8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 12:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61176E35D;
	Tue,  6 Aug 2019 10:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DD76E351;
 Tue,  6 Aug 2019 10:28:03 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id v129so57948124vsb.11;
 Tue, 06 Aug 2019 03:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D+lAHSQOxtbia37IV3ZYPxwR4GNMA3lfAOT356BgdJo=;
 b=C4kSOFjPy51xr5XsP30yT86bwYqrJYkVNMk66z9qqXW270Gc3a41eJ38jlWYWJddC3
 aRlGm+CA85WkgVL3cVBhjYkgH9SkvUxT0idyx8yeq5XSkpW/c93k51XCQRdla4DWunNv
 HX/E6CkT3NRicLTVMzlvtJFoZphkwbfVoJjzbBkKQbN+JE4/Ww3prd1kI8NhwEwIJMTO
 hTb/gGsaQO7jXgjhRgc6Av1SsOGdV9xKAokMgF3oP3fKcI1Gc/J9/EJ7YuSBDm+IfQz1
 a56xOhR/CuoX3MfJcxf/EjN7cC+AEPAXOekMWzkR7PUjXM9dwgKuw5qdDkdxVSjGg2vh
 Op2g==
X-Gm-Message-State: APjAAAUKhbqC2yOXGzPwbTHWCK560THF5NNW52i8+RVb4eFA5sgl8T1O
 b355FlekxRRmGEKZCLUEGyIQ6gRhqSkvvjX+ttU=
X-Google-Smtp-Source: APXvYqy1g893T5cbY2vwLDIuC0f1BT4F3bYqYRSDYyJD5qV2AOYEegXLbse59BAi9L+cgpgNU/GZ2D28LR1acf54Z/E=
X-Received: by 2002:a67:9946:: with SMTP id b67mr1815858vse.37.1565087282971; 
 Tue, 06 Aug 2019 03:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
 <CACvgo51Do4XDY9wRku-0v5B+mRRzV2+SgD=dvFT3J9TMf8RK9Q@mail.gmail.com>
 <CAKMK7uEcoQK+y6y2wW6GJzKDjtPZZ5gads3JY6xL+JiP+2QABQ@mail.gmail.com>
 <CACvgo50z6bGu4=jqEHCSUOd_geadEwuOcOquLiVRsCdRroG2fg@mail.gmail.com>
 <CAKMK7uFpuLhR6eL+C15-kPYiEO1upU0+z9nz2BOhriKtSnqX5Q@mail.gmail.com>
 <CAPj87rMj+Y6vW9VubUnHm1QUmh5JJ-+VwQRd5SULwH0rg6ZYSw@mail.gmail.com>
In-Reply-To: <CAPj87rMj+Y6vW9VubUnHm1QUmh5JJ-+VwQRd5SULwH0rg6ZYSw@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 6 Aug 2019 11:27:13 +0100
Message-ID: <CACvgo50-N8SqwfLtzMhsvEhY7VMiH4SyTju2mM0mVXamnKktjw@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Daniel Stone <daniel@fooishbar.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=D+lAHSQOxtbia37IV3ZYPxwR4GNMA3lfAOT356BgdJo=;
 b=FRFgIqk3OwO23h3wKy1pcDcigvRiWGs6pnV3qG1byEYisb/FqJocI7+6+1SKSI0VZs
 NZYJkmQuM+pkPQnXK9h+1ximKt2bxXPJFsVjqVYQUm2AXzo6E3yY9i2Wtts/xcKMrHWa
 lPBWrUFRIpg3PsSD2qpPRwm3eHuQx2Wy/1rv514uzksWNs0sfRfpadwWauqlsz0bLwbV
 YR5mZSA0m0yKtwS8JXpZJRVNSYv1sbtIWcF5KG88IWGckO41s7PocnmT78hR5cO3t0vK
 42AwZwJIrlrKmYk6nS1mWJ1wm/S8hKHhf4JFPn1wd73G3ZcTB8ZT183BCanT7GjZSotK
 3lTA==
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA2IEF1ZyAyMDE5IGF0IDExOjE0LCBEYW5pZWwgU3RvbmUgPGRhbmllbEBmb29pc2hi
YXIub3JnPiB3cm90ZToKCj4gVGhlIGlkZWEgSSBoYWQgYSBmZXcgd2Vla3MgYWdvIHdhcyB0byBo
YXZlIGRpbSB1c2UgJ2dpdCBwdXNoCj4gLS1wdXNoLW9wdGlvbiBmZG8ucHVzaGVkV2l0aERpbT10
aGlzLXdhcy1wdXNoZWQtd2l0aC1kaW0tYW5kLW5vdC1tYW51YWxseScsCj4gdGhlbiBoYXZlIHRo
ZSBob29rcyBvbiB0aGUgc2VydmVyIHNpZGUgY2hlY2sgZm9yIHRoYXQgb3B0aW9uIGFuZAo+IHJl
ZnVzZSBhbnkgZGlyZWN0IHB1c2hlcy4gKE9yIGF0IGxlYXN0LCBpZiBwZW9wbGUgYXJlIHB1c2hp
bmcKPiBkaXJlY3RseSwgdGhleSBoYXZlIHRvIF9yZWFsbHlfIHRyeSB0byBiZSBkb2luZyBpdCwg
YW5kIGNhbid0IGRvIGl0IGJ5Cj4gYWNjaWRlbnQuKQo+CkxldCBtZSB0cnkgYW5kIHdyaXRlIGEg
RElNIHBhdGNoIGZvciB0aGF0LgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
