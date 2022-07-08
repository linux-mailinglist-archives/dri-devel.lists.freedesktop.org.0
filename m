Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF45056C129
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A1B10E531;
	Fri,  8 Jul 2022 20:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0510E531
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:06:56 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id p11so16553765qkg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 13:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PrAYMou5WShK8tYCJZhhedzGwf63ebeVvEWKhQgZ9ig=;
 b=kvH7L5Yi/DeOA+eDg1j2uE/qkOYXXfnxn5KvWiYuzqhqkylGshvfhkkcSqvYNfVqUr
 dkbTKYSMGSTUyGp7h+jlT+XXWQix1PB8wa1UyAjtdSVHxN50PgMwlkmMLT41wnxolPY5
 GZVNJq7Dj651qZGv/RP/ClVe9RqpQqvxZMl/oSco0KJ1gMNgLpQ7dEkDgkEEfCtt2Wx/
 zO+cWwiripOIL82GmkT7AYRb5qpi6gujM1l47MXkQbVME6n6zqNB7B4wfpOn/fwFhwjG
 XcJVTl/LooxZP7bqQuhpPGD736L7K+bbfITW7x7u6hRnjPWVfNFvAKgW/20HwSd8lhfE
 PmIA==
X-Gm-Message-State: AJIora8O6sMy3+BlPx4EUiDdoafuk9Ew3QXqa86Gq5QX9EQcgJxYhS2b
 Qrh5/Gh3DkuaRmQ+Q/9NE9bLjdn2xRpdmg==
X-Google-Smtp-Source: AGRyM1sEUwXA6zv1xILuxVyg0wVzy2QcIO1c+o9HeveYlMgTQGQUajw79pqqlIwZvItzFPd3RclbPw==
X-Received: by 2002:a05:620a:d82:b0:6a9:9102:3948 with SMTP id
 q2-20020a05620a0d8200b006a991023948mr3741977qkl.56.1657310815446; 
 Fri, 08 Jul 2022 13:06:55 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac8661a000000b0031e9b5ead3asm3574986qtp.76.2022.07.08.13.06.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 13:06:54 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2ef5380669cso208045767b3.9
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 13:06:54 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr6013965ywb.502.1657310814238; Fri, 08
 Jul 2022 13:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657301107.git.geert@linux-m68k.org>
 <64e2e9b14c26df28908789374253fd12072c26c2.1657301107.git.geert@linux-m68k.org>
 <b7d937bc-d7c3-6f7a-047c-fc6e5756a5a0@redhat.com>
In-Reply-To: <b7d937bc-d7c3-6f7a-047c-fc6e5756a5a0@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jul 2022 22:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCz4j5bxKBY-W3zWiCLRc9QP+OKco-haGH_9YUhaROgA@mail.gmail.com>
Message-ID: <CAMuHMdWCz4j5bxKBY-W3zWiCLRc9QP+OKco-haGH_9YUhaROgA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/modes: parse_cmdline: Handle empty mode name part
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans.

On Fri, Jul 8, 2022 at 9:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 7/8/22 20:21, Geert Uytterhoeven wrote:
> > If no mode name part was specified, mode_end is zero, and the "ret ==
> > mode_end" check does the wrong thing.
> >
> > Fix this by checking for a non-zero return value instead.
>
> Which is wrong to do, since now if you have e.g. a mode list
> with:
>
> "dblntsc",
> "dblntsc-ff"
>
> in there and the cmdline contains "dblntsc-ff" then you
> will already stop with a (wrong!) match at "dblntsc".

It indeed behaves that way, and did so before, as str_has_prefix()
checks for a matching prefix, and thus may never get to the full
match.  However, can we change that to an exact match, without
introducing regressions?
This can be avoided by reverse-sorting the modelist (or iterating
backwards through a sorted modelist), though.

> > While at it, skip all named mode handling when mode_end is zero, as it
> > is futile.
>
> AFAICT, this is actually what needs to be done to fix this, while keeping
> the ret == mode_end check.

"ret == mode_end" or "ret" doesn't matter (except for the special
case of mode_end is zero), as str_has_prefix() returns either zero or
the length of the prefix.  Hence it never returns a non-zero value
smaller than the length of the prefix.

> > Fixes: 7b1cce760afe38b4 ("drm/modes: parse_cmdline: Allow specifying stand-alone options")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  drivers/gpu/drm/drm_modes.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index 14b746f7ba975954..30a7be97707bfb16 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -1823,9 +1823,9 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
> >       }
> >
> >       /* First check for a named mode */
> > -     for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> > +     for (i = 0; mode_end && i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> >               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> > -             if (ret == mode_end) {
> > +             if (ret) {
> >                       if (refresh_ptr)
> >                               return false; /* named + refresh is invalid */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
