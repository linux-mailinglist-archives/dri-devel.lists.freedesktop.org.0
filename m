Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA014983D0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C8810E211;
	Mon, 24 Jan 2022 15:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28ED10E211
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 15:50:33 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id w21so31724406uan.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qn8yuU/dY9yzYdXTyBmgzczJZCif2R504KsT3GAaWuA=;
 b=o4fm7x8BWQKmvTXLRpqC+5K+0EDHbWHtTZLgXx8vebjAXoBzUWs5j/wEPmEVXyYWyI
 oeJ2rrAQEBRK6Mph3Ig3k3QU5Hf82/RVjJFm/WF8+nwGyjuic/CaTLqynL1/VYzMo8df
 ejDTNBTCsp1Q2FPXi8siJs7GRcYcKTu6NjFgmdCkO54Xa2uDUMf1ktHXtRPwZn4Tu4ds
 21YkFXtWDzszSqWleZBAMVBoH4TJrRrbE/Hi83z+kPEoiWRB8qzPiLdOEEpOHszh2Ax8
 vctEf7w5zZnbu/9yrq3hQXBnsisWW2x++cPqXgZuFmur3ybf9HWnQOwtWMcbHhMKP85V
 Btrg==
X-Gm-Message-State: AOAM533pX1Q4ZEhUPIX5HhebgXVC41yYAj7Uk3UyBcG1a1A25eWNmxUJ
 0yDvORRJqnLdszQYMYy3E3Hc11z6hAMxGA==
X-Google-Smtp-Source: ABdhPJxSHfVSAY78lKrM6c9AqGzGI+ClYMZcKg+OXnvq52GwW8Jd/khFpfHKzSCTBoAeRugCPSJx+Q==
X-Received: by 2002:ab0:6c42:: with SMTP id q2mr6748994uas.112.1643039432119; 
 Mon, 24 Jan 2022 07:50:32 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id k3sm958638vsc.11.2022.01.24.07.50.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 07:50:31 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id 2so31784571uax.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:50:31 -0800 (PST)
X-Received: by 2002:a67:b009:: with SMTP id z9mr2526092vse.57.1643039430885;
 Mon, 24 Jan 2022 07:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de>
 <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
 <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
 <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
 <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
 <2fc200bb-4b40-7833-31c9-90a78512b601@redhat.com>
 <de6e06e1-f293-1c98-7898-b5d52c400b59@gmx.de>
In-Reply-To: <de6e06e1-f293-1c98-7898-b5d52c400b59@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jan 2022 16:50:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-txqH1fnpkvyOSYUVkG8PTJKWkWFq_X8k-4VcdKR79Q@mail.gmail.com>
Message-ID: <CAMuHMdW-txqH1fnpkvyOSYUVkG8PTJKWkWFq_X8k-4VcdKR79Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
To: Helge Deller <deller@gmx.de>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Mon, Jan 24, 2022 at 4:30 PM Helge Deller <deller@gmx.de> wrote:
> On 1/24/22 12:50, Javier Martinez Canillas wrote:
> > On 1/24/22 12:33, Thomas Zimmermann wrote:
> >
> > [snip]
> >
> >>> Thoughts?
> >>
> >> I can't say I approve keeping fbdev alive, but...
> >>
> >> With fbdev emulation, every DRM driver is an fbdev driver too. So
> >> CONFIG_FB_DRIVER is somewhat misleading. Better add an option like
> >> CONFIG_FBCON_HW_SCROLLING and have it selected by the fbdev drivers that
> >> absolutely need HW acceleration. That option would then protect the rsp
> >> code.
>
> I'm not a fan of something like CONFIG_FBCON_HW_SCROLLING, but I'm not
> against it either.
> For me it sounds that this is not the real direction you want to go,
> which is to prevent that any other drivers take the framebuffer before
> you take it with simpledrm or similiar.
> CONFIG_FBCON_HW_SCROLLING IMHO just disables the (from your POV) neglectable accleration part.
> With an option like CONFIG_FB_DRIVER (maybe better: CONFIG_FB_LEGACY_DRIVERS)
> it's an easy option for distros to disable all of the legacy drivers
> from being built & shipped.
>
> Instead of CONFIG_FBCON_HW_SCROLLING we could also choose
> CONFIG_FBCON_LEGACY_ACCELERATION, because it includes fillrect() as well...

As this is about resurrecting features indicated by the various
FBINFO_HWACCEL_* flags, what about CONFIG_FB_HWACCEL?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
