Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B6490A03
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296E010E29C;
	Mon, 17 Jan 2022 14:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82E110E2B5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 14:10:13 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id c36so30514852uae.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 06:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVkUe3uV+8LCxfEyOkwQAxMSTEPLRyMs/0Qx0B4nQCU=;
 b=WqhDq/yTxv3FfgYDZtizSubeX5nBD2U6S9qWxqnFDZ1aIjWYYBA+dZDqi1yfJPvIVI
 IdY5Oe9UfB70hdUcevW6UBzow/+gyeq32T7V5IQuXtl7o5yhwgcPTF1YyvHg8TGWPwxd
 bhpCRUJvPzEH0g57uCUR2uQYnYw2ryLf2Ye+dGPVBEwkDMsrp2ISLRNnq27fRJ0sThE/
 ziIkUPdv/hwLmOOuxPkYcjHVvGI4hyoSEQeTIiPKQuJU2vIMzFVLKYvGDx/c+7R9acdB
 3VDiozC8InPNjtaCS/cdehiCu20bsQP2rTpkVChn9EhIllKaMR719lrDcg3uMhzf1pdl
 2VBw==
X-Gm-Message-State: AOAM532QO8Lzj++A5IchJhTdJWbrmYjgw6U4mkxr5mXK9oVDJIOo1iWl
 zg4jhOGTw/vCk+qutcAHvhAq/dAOtpmHgw==
X-Google-Smtp-Source: ABdhPJzXIKJ5aiJQq5Q/Foj9vPh/xh2eL6WHpvL5C7U3xXW3qFR03YQnLdBdB02C+/mbBvOkOwbvew==
X-Received: by 2002:a67:dc17:: with SMTP id x23mr7205411vsj.75.1642428612546; 
 Mon, 17 Jan 2022 06:10:12 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id w131sm3661716vkw.54.2022.01.17.06.10.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:10:12 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 191so10451701vkc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 06:10:11 -0800 (PST)
X-Received: by 2002:a1f:2344:: with SMTP id j65mr7794483vkj.7.1642428611448;
 Mon, 17 Jan 2022 06:10:11 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
In-Reply-To: <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jan 2022 15:10:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
Message-ID: <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jan 17, 2022 at 2:51 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 17.01.22 um 14:29 schrieb Geert Uytterhoeven:
> > On Mon, Jan 17, 2022 at 1:57 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >>> b) to include new drivers (for old hardware) if they arrive (probably happens rarely but there can be).
> >>>     I know of at least one driver which won't be able to support DRM....
> >>
> >> Hmm?  I seriously doubt that.  There is always the option to use a
> >> shadow framebuffer, then convert from standard drm formats to whatever
> >> esoteric pixel format your hardware expects.
> >>
> >> Been there, done that.  Have a look at the cirrus driver.  The physical
> >> hardware was designed in the early 90-ies, almost 30 years ago.  These
> >> days it exists in virtual form only (qemu emulates it).  Thanks to the
> >> drm driver it runs wayland just fine even though it has a bunch of
> >> constrains dictated by the hardware design.
> >
> > The Cirrus DRM driver supports TrueColor (RGB565/888 and ARGB8888)
> > modes only.  The Cirrus fbdev driver also supports mochrome and 256
> > color modes.
> >
> > There exist some DRM drivers that do support DRM_FORMAT_C8, but none of
> > the "tiny" ones do. Same for DRM_FORMAT_RGB{332,233}.  Using a shadow
> > frame buffer to convert from truecolor to 256 colors would be doable,
> > but would give bad results. And what about less colors?
> > Adding support for e.g. DRM_FORMAT_C4 is not straight-forward, as
> > the DRM core assumes in many places that a pixel is at least 1 byte,
> > and would crash otherwise (yes I tried).  Other modes needed are
> > DRM_FORMAT_Y4 and DRM_FORMAT_{BW,WB} (monochrome).
>
> We export XRGB32 from each driver, because userspace expects it. But
> that is not a hard requirement. Userspace can use any format. It's just
> that no one seems to have any use cases so far, so no work has been
> done. Think of XRGB32 as a fallback.

Using an XRGB32 intermediate would kill the user experience on old
machines, due to both increased memory usage and copy overhead.

> Personally, I'd much appreciate if userspace would support more of the
> native formats and not rely on XRGB32.

Supporting monochrome, 16 colors, and 256 colors would be nice.

> > This not only to support "old" hardware, but also modern small OLED
> > and e-ink displays.
>
> There's a DRM driver for Repaper e-Ink displays. So it seems doable at
> least.

Which uses an DRM_FORMAT_XRGB8888 intermediate, and
drm_fb_xrgb8888_to_gray8() and repaper_gray8_to_mono_reversed()
to convert from truecolor to monochrome.  I guess that would work,
as this is a slow e-ink display.  Have fun as a text console ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
