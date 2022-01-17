Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CFB49098C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 14:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E9010E283;
	Mon, 17 Jan 2022 13:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FECF10E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 13:30:01 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id m15so30365844uap.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 05:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aw/HNeVnfTRxU1ZQlE8UIYhuVJjuteUvt0Niy9Bfiz0=;
 b=Zan8jg5mlkDz5SY0zSNWE3bWqwce6B8CirfDXpPJbQmVUthvOQTvHKRMwlO+1UR/bh
 NV8usx9zLv4C4LLQDwwOmwLihaouTdtlGkVetFXfCKIvLS0ZHyydz93cJIA+5J7bXiyp
 va+IVsFKuYSnHvUNdXzTRv4W0ijiqlWYKri0bCX7bAZAFnNZAMVT8A/6gJDP6Vj26MFN
 IjoSYzYtwD0faROX8F++KEGNV3FbahF5YUSiyln2A0F4Z0AFLliDNzp5P07tDpxLwTZc
 vDzluG5EQfjtOesgQerPLsymO1ZyBPvRkc7+goXGEWLax48xvWHhSjpJp2Ca3RlWS8Qt
 cqmA==
X-Gm-Message-State: AOAM533ErKB+AX0yw4DAUxkaczg55icleamgC+XnzGL0Cuaw9GeE4MI8
 MJB5SMGcvPFqW9OY4XG5/jKVLMkMrCbqSA==
X-Google-Smtp-Source: ABdhPJyy5q/1sJrN5PX2tnTccknmgu26Yp/3To1Z9oH9kDZFpbQ8Dl89gskaX/PUcVcJBKvtz9uXUA==
X-Received: by 2002:a05:6102:244:: with SMTP id
 a4mr7086342vsq.26.1642426200071; 
 Mon, 17 Jan 2022 05:30:00 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178])
 by smtp.gmail.com with ESMTPSA id 7sm3384207uan.19.2022.01.17.05.29.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 05:29:59 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id b77so10338922vka.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 05:29:59 -0800 (PST)
X-Received: by 2002:ac5:c967:: with SMTP id t7mr8120473vkm.20.1642426198916;
 Mon, 17 Jan 2022 05:29:58 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
In-Reply-To: <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jan 2022 14:29:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
Message-ID: <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

On Mon, Jan 17, 2022 at 1:57 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > b) to include new drivers (for old hardware) if they arrive (probably happens rarely but there can be).
> >    I know of at least one driver which won't be able to support DRM....
>
> Hmm?  I seriously doubt that.  There is always the option to use a
> shadow framebuffer, then convert from standard drm formats to whatever
> esoteric pixel format your hardware expects.
>
> Been there, done that.  Have a look at the cirrus driver.  The physical
> hardware was designed in the early 90-ies, almost 30 years ago.  These
> days it exists in virtual form only (qemu emulates it).  Thanks to the
> drm driver it runs wayland just fine even though it has a bunch of
> constrains dictated by the hardware design.

The Cirrus DRM driver supports TrueColor (RGB565/888 and ARGB8888)
modes only.  The Cirrus fbdev driver also supports mochrome and 256
color modes.

There exist some DRM drivers that do support DRM_FORMAT_C8, but none of
the "tiny" ones do. Same for DRM_FORMAT_RGB{332,233}.  Using a shadow
frame buffer to convert from truecolor to 256 colors would be doable,
but would give bad results. And what about less colors?
Adding support for e.g. DRM_FORMAT_C4 is not straight-forward, as
the DRM core assumes in many places that a pixel is at least 1 byte,
and would crash otherwise (yes I tried).  Other modes needed are
DRM_FORMAT_Y4 and DRM_FORMAT_{BW,WB} (monochrome).
This not only to support "old" hardware, but also modern small OLED
and e-ink displays.

On the positive side: DRM would force e.g. the Amiga and Atari
bitplane formats to become internal to the kernel driver, with the
kernel driver converting from packed pixels to bitplanes.  Hence
userspace would no longer have to care about bitplanes.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
