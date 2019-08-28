Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF2A0769
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 18:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4D989DA4;
	Wed, 28 Aug 2019 16:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDDD89DA4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 16:31:33 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x3so147104lji.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 09:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NjXiz0jtJWGT4cEckFQPpVyw/lRnuMBErWmMi5AhrWA=;
 b=h2HaB7VYR7EZSE/h0TjIxXjpC0zIM/9jNoDArJU7It2qHBjnRVPmMOozy01JKG5iXr
 BVvu3AKe796ZL0Wj5SSOHFktUrnHemxf7Kc8V5XJMi7dlQyan7x/wnN8LY0OM0e3szfy
 kWhUY4ojFHYLbNUntgvRKpNAboLZpQCyjC5gBGL1AXGt/LguqfcNufqclwLAYz/RXFkr
 S3FeRlvJKtQTw+WQ+GQOaDtihBaBDk5bhtwpr48JR/yb+h6xyIwH5+3SgUg9b/Wz5uUo
 XJt+m12uj5BYZ5Cq0n8J4tP9D2cgYP6Sd//4qKRhBOkglu8sXHbtBL0R1buGFZC5OgsB
 zT0Q==
X-Gm-Message-State: APjAAAUmaVVAxzLiOSucmaEwvI15Hsir8nglxli3FoiDADRmYMwFpjqF
 eIDkgrlUHkVGkeOBGOExKVmb8GVvBtDZ48XjM3B+uXbAPCc=
X-Google-Smtp-Source: APXvYqxAHfxii1r8G4uA4TRksDr+gKgKoYBl4Hdl6wuwPpbFwpxiCpD0ZSA802wdhf0b6NWeu0VbqDNspGN9n84/Rjg=
X-Received: by 2002:a2e:9f0f:: with SMTP id u15mr2559887ljk.54.1567009891738; 
 Wed, 28 Aug 2019 09:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
 <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
 <CAMRc=McUEgm6yH7enwHuHxVTL41dmb5KAY_pxTmSr3vctCs2xg@mail.gmail.com>
 <CAMuHMdV3obGtQ7qohNedQNgpvZvyL9xjH0HUiBKD6b8Ou5F+XA@mail.gmail.com>
In-Reply-To: <CAMuHMdV3obGtQ7qohNedQNgpvZvyL9xjH0HUiBKD6b8Ou5F+XA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Aug 2019 18:31:19 +0200
Message-ID: <CACRpkdbgZhgSvicq2XG0n2hiKA9K8VFmvCPn3W9oXgSLrZiw=w@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NjXiz0jtJWGT4cEckFQPpVyw/lRnuMBErWmMi5AhrWA=;
 b=E5GgF7uEiUS4O03g81yoi6j0NmHdf4h5a677oc0l/9oNnv0vPvwDHY9bBDT7sfZWMO
 rtsogJ+CsbQsVUNcCCnRHsk9EWzhAL6ZAKvbAkIGd3LbnZ9GbTX5hpb5oa1NrfnQCDQD
 85jxjR9VZDrJIS3b4zWx5d3/+VcTuqraAY6MfUm0HRhJ88NUTZw3xDXtM5agrv/wXgTK
 4OEFhl9VwwKoRXdkm56/y0MiVOG/BysRAFp+oFrmld0FBfH7Wc6WzPLGLl/lz1dZz4pY
 cQR2OdKQ1dpLW+E67rY2iNc+/jXps0kUscsilbRR/9V3g+yKEWUcVcl6Q4w3/v7MaUkX
 iQqw==
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6MzYgQU0gR2VlcnQgVXl0dGVyaG9ldmVuCjxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cgo+IENDIHRoZSBwb3VyIHNvdWwgd2l0aCB0aGUgZWNv
dmVjIGJvYXJkLgoKV2l0aCBncmVhdCBwb3dlciBjb21lcyBncmVhdCByZXNwb25zaWJpbGl0eSA7
KQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
