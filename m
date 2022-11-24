Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA73B63734A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CEB10E69B;
	Thu, 24 Nov 2022 08:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEF810E69B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 08:03:08 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id c2so580769qko.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NxhodYFDmdQqVB4ltzcytu+P4hXGUv/V9/mCUnkpmmg=;
 b=pp+dXGYbHlDMjqKNUcrcLdjIwUkgptYpyE1VerCFYKULdOHpD8X5B2aZAM1STFhjbM
 +VF3Rhh53kQVvjLTWWY2G+DHVm+TwN0KqNK7DcPmR3wXDMGyCQ5bkWXhlR2Wv855pWKp
 8DVliJOglHiM7Nfe+z/CCtdHUHiVL07XEmA/78Vn5ZjDK0vdHeOKhW8V9Tz6tFrzzbXl
 9DhiUMfRhrvFanuFMv4ai5aGJm6t8dew/J3Wdsb8Lg/gHQWDiKjr7lzGoxwGX1kMStjd
 wXnw4VmG51IgXz9rp4FZiUK0BzZbDRFb17TREskxG119A+RjOXu4m3ecNu+K9Ugu8raF
 pi+A==
X-Gm-Message-State: ANoB5pkMOFt7HK3QGyvFSF8rPFye6owf4ixRPoT+M4TRNX7PArDQiHxy
 CjdMtBRH1jm52ZFzublJyO8wFFJEsDDUqw==
X-Google-Smtp-Source: AA0mqf4J0tIx+T6ztjdBjvFR0R71VRDz8Y/kifhPxjwTjt9fxJHKERy9d/TU7ByDscRETt9IxLdR8A==
X-Received: by 2002:a37:acd:0:b0:6ee:9097:ccc1 with SMTP id
 196-20020a370acd000000b006ee9097ccc1mr28752495qkk.484.1669276987195; 
 Thu, 24 Nov 2022 00:03:07 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05620a298d00b006eee3a09ff3sm469660qkp.69.2022.11.24.00.03.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 00:03:06 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3abc71aafcaso8634737b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:03:05 -0800 (PST)
X-Received: by 2002:a81:f80f:0:b0:38e:e541:d8ca with SMTP id
 z15-20020a81f80f000000b0038ee541d8camr29389264ywm.283.1669276985156; Thu, 24
 Nov 2022 00:03:05 -0800 (PST)
MIME-Version: 1.0
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <Y35RCaEP0icg6San@phenom.ffwll.local>
 <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
 <20221124065148.7v4m3qli2k74mic6@sirius.home.kraxel.org>
In-Reply-To: <20221124065148.7v4m3qli2k74mic6@sirius.home.kraxel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Nov 2022 09:02:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJUUPPxS6VCHV1X9XMqzfACvu8qivUVO2pMbvD7rcQKg@mail.gmail.com>
Message-ID: <CAMuHMdUJUUPPxS6VCHV1X9XMqzfACvu8qivUVO2pMbvD7rcQKg@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

On Thu, Nov 24, 2022 at 8:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > +#ifdef __BIG_ENDIAN
> > >
> > > Why do we need the #ifdef here? Iirc some hw has big endian flags in the
> > > scanout registers, so could supprt this unconditionally if there's no
> > > #ifdef around the format defines. Some drivers might then also want a
> > > DRM_FORMAT_FOO_BE define to simplify tables and stuff, but that's more a
> > > bikeshed.
> >
> >  "Limit this to big-endian platforms, as there is currently no need
> >  to support these formats on little-endian platforms."
> >
> > Will anyone make use of this? In theory, all of the 16-bpp formats
> > can have a big-endian counterpart.
>
> Highly unlikely.  Dealing with 16-bpp formats in non-native byte order
> is a PITA because it isn't enough to simply adjust the masks and shifts
> to pick the correct bits and be done with it.
>
> The qemu stdvga happens to have a register to switch framebuffer
> byteorder (so both x64 and ppc are happy), and the bochs drm driver
> actually supports that no matter what the cpu byte order is, but it
> supports only DRM_FORMAT_XRGB8888 + DRM_FORMAT_BGRX8888.
>
> Supporting 16 bpp in the driver wouldn't be that much of a problem, but
> processing the framebuffer on the host side when emulating a big endian
> guest on a little endian host is painful.  I think I can't ask pixman to
> do a conversation from DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN to
> DRM_FORMAT_XRGB8888 on a little endian machine.

Indeed. But you can do a quick 16-bit byteswap, and convert from
DRM_FORMAT_RGB565 to DRM_FORMAT_XRGB8888?

There's a similar issue with Cairo, cfr. '[PATCH libdrm v2 08/10]
util: Fix pwetty on big-endian"[1].

BTW, does pixman support converting DRM_FORMAT_RGB565 to
DRM_FORMAT_XRGB8888 on a big-endian machine?

[1] https://lore.kernel.org/all/e8597038478f12e9eda5e86b309b52988f69f2eb.1657302103.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
