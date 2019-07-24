Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B6E73066
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 15:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D2A6E53C;
	Wed, 24 Jul 2019 13:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAFC6E529
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:58:53 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c9so31988241lfh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 06:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Z5UzFYhi6H2Bzr3Scice37n2cKfwrnM1A2zQSOal84=;
 b=D2YoACtn6Cta6fPGfX0GmaaPG6HyRdNMJoZ9M+nxB+gYi+WpMWQnkLBy1WUoiULD0j
 hcu2We95f0PE4BzodUk4Oz1rkFUK7V4sfbVKSJN5+jiBbtVQIT/9va2WQUNiguGWxjl0
 YD06RAkLtQmEEy4ZWGO+NoMeNlXanBDCzy8E68dPurQbe8jWD3mDj4zrJwRGjUjnUVdx
 8mEBJEyV0gxOJD+irAcW12o4c7eyk6SnrvtKAlnWURThS4oV/RkvV5/japgbbIpgvWoz
 rhTVX1mvLQWDCjsGsvWcSE8u6LOHuKnSd3l5uOmK4Zxe3TPVQBJ18j8dac6thvTHup9K
 YRoQ==
X-Gm-Message-State: APjAAAWS2DvhZInIG9TTzfRR5YxmD3ESdc3/iyYP+RmkkK+qRgNUIWPp
 CLvQYVVlJg7MCgyfqayDad7sNTB1xD68W5OFn5g8OA==
X-Google-Smtp-Source: APXvYqwdTOeseN/Hq1XGnjd8lMRnCKAQsTM7/VsBcWVBoPs4cjVpWdHT/C6Xf0cA20TN5udLNcPOED/4Mrw9SvzUGiI=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr38209122lfu.141.1563976732315; 
 Wed, 24 Jul 2019 06:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723133755.22677-3-linus.walleij@linaro.org>
 <20190723175445.GA23588@ravnborg.org>
In-Reply-To: <20190723175445.GA23588@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Jul 2019 15:58:40 +0200
Message-ID: <CACRpkdYmO=fBj3MFoQdLrEgA05BLZR3tNv9WhqjLeJ0R0cdDbQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] RTF: drm/panel: simple: Add TI nspire panels
To: Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8Z5UzFYhi6H2Bzr3Scice37n2cKfwrnM1A2zQSOal84=;
 b=otxjmkh/kVjZ4IM4FQrw7xAdQ6ZMWi7+vpVhvym8xvAtfzvsk6Y1MpF4kDfF3szG4e
 ujXo01qlYB9GyBVtTvCW55pyJKAvSuzyYGgc05yORTFQHoumbStriwvaB0wzizPkIgfJ
 /yc+ELX0sXvFi3mfyJSNrnWj6CVB1ipo/QyokYR78Gh0e1CB2knhw8/hPuF5AfdQdef/
 4Fhsrj/r3MlKVkPGCS/weUjARoJojbnyZvnv56TMBg92X1JWDap0/Ni0fmdniXwDgQnw
 A+EVyIDK9D40WfqySO9uC4KK1Pp/KkU5GDrcEx3G4cU6+M60/PQR6TijaHqQV+URDtow
 M0KQ==
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
Cc: Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKZml4ZWQgbW9zdCB0aGluZ3MsIG9uZSBxdWVzdGlvbiByZW1haW46CgpPbiBUdWUs
IEp1bCAyMywgMjAxOSBhdCA3OjU0IFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4g
d3JvdGU6Cgo+IEZ1cnRoZXJtb3JlIEkgZGlkIG5vdCBzZWUgYW55IGJpbmRpbmdzIGZvciB0aGUg
cGFuZWxzLgo+IElmIHRoZXkgaW5kZWVkIGFyZSBtaXNzaW5nLCB0aGVuIHBsZWFzZSBwcm92aWRl
IGJpbmRpbmdzIGluIHRoZSB5YW1sCj4gZm9ybWF0LgoKSUlVQyB3ZSBkbyBub3QgY3JlYXRlIGJp
bmRpbmcgZG9jdW1lbnRzIGZvciB0aGUgc2ltcGxlIHBhbmVscywKYnV0IEkgY2FuIGRvIHRoaXMg
b2YgY291cnNlLCBqdXN0IHZhZ3VlbHkgcmVtZW1iZXIgdGhhdCB0aGUgRFQKcGVvcGxlIGRpZG4n
dCB3YW50IHRvIHNlZSBiaW5kaW5ncyB0aGF0IGFsbCBsb29rIHRoZSBzYW1lCmJ1dCBpbnN0ZWFk
IHJlbHkgb24gcGFuZWwtY29tbW9uLnR4dAoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
