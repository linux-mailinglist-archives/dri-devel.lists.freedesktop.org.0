Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E936D4D5168
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 20:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FE910EC9E;
	Thu, 10 Mar 2022 19:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6698310EC9E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 19:23:38 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id s16so5259991qks.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 11:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HoHIIrMg0k/ZFTGcfgryylR1kLXwE+5bLslGVm788tY=;
 b=voxmBS7XolVzHyE4cqel/i+mMPqMKN9bkkl7eJj0V0lrYEzVyDeu9GkVL/K9hWx/rF
 P09QZUZpqp1DIv1Sd4tshscU/BjiDNNyNoSFIauzWniAyliRqbO9Ox9Vd65iDgU1RAPj
 s4Ytn9x3nSa92mh6w2bjTjE+VZ7A1pnqD/ERPm4OAfNfZ/QMpk95zIwKolluETT5hOWh
 tcZaB8jEF/eWoiOvm0n0XoAohQs9WvkwlAS0q+/EvqFg0Gr1POblsx6txS2h+Lbia3NE
 I3kFOEsjzWyAR9xYhpevNlWbYq7o48+CWTd3a0q6deSkVEUOhlZ1cMaTj65265fP+SUH
 PF8g==
X-Gm-Message-State: AOAM532r0DYwur3jb07cMV6RAn1bQAKCmbqZpKWQNCV64M+Vx60rdmBV
 2n+s9Gk1XCB6C2h+NjyQScyvl1q73SMIaw==
X-Google-Smtp-Source: ABdhPJxLlHVkLR5eSahORjADF2yoYKgyMD7gqC6MItb9CnItLS3GlCXwWvKPlD5tQ9tKbwOrwVUAuA==
X-Received: by 2002:a05:620a:a57:b0:67d:396a:8a9d with SMTP id
 j23-20020a05620a0a5700b0067d396a8a9dmr4224173qka.322.1646940216459; 
 Thu, 10 Mar 2022 11:23:36 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 y17-20020a05622a121100b002e0702457b2sm3816377qtx.20.2022.03.10.11.23.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 11:23:35 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-2d6d0cb5da4so69471877b3.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 11:23:35 -0800 (PST)
X-Received: by 2002:a81:49d0:0:b0:2db:dc6d:445d with SMTP id
 w199-20020a8149d0000000b002dbdc6d445dmr5497712ywa.512.1646940215076; Thu, 10
 Mar 2022 11:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20220223193804.18636-5-tzimmermann@suse.de>
 <CGME20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141@eucas1p1.samsung.com>
 <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com>
 <a7c8ee6c-185e-916c-c92a-d3b3f4fd9135@suse.de>
 <f318d57d-ef9e-295a-6865-eb0377a9bd07@samsung.com>
 <CAMuHMdU4w-68-V2QXqbJqorL3iQFyBSRkGTrz5ePFRRUC8mRzw@mail.gmail.com>
 <d8726a6e-d0a9-1471-c113-a7bf567aa994@suse.de>
In-Reply-To: <d8726a6e-d0a9-1471-c113-a7bf567aa994@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Mar 2022 20:23:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVO0-q8CU7CAf-5O1CQ3e-8eeg73KgbS8uDAVY+vnd6nw@mail.gmail.com>
Message-ID: <CAMuHMdVO0-q8CU7CAf-5O1CQ3e-8eeg73KgbS8uDAVY+vnd6nw@mail.gmail.com>
Subject: Re: [v3,4/5] fbdev: Improve performance of cfb_imageblit()
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
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Mar 10, 2022 at 8:22 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 09.03.22 um 11:39 schrieb Geert Uytterhoeven:
> > On Wed, Mar 9, 2022 at 10:22 AM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 09.03.2022 09:22, Thomas Zimmermann wrote:
> >>> Am 08.03.22 um 23:52 schrieb Marek Szyprowski:
> >>>> On 23.02.2022 20:38, Thomas Zimmermann wrote:
> >>>>> Improve the performance of cfb_imageblit() by manually unrolling
> >>>>> the inner blitting loop and moving some invariants out. The compiler
> >>>>> failed to do this automatically. This change keeps cfb_imageblit()
> >>>>> in sync with sys_imagebit().
> >>>>>
> >>>>> A microbenchmark measures the average number of CPU cycles
> >>>>> for cfb_imageblit() after a stabilizing period of a few minutes
> >>>>> (i7-4790, FullHD, simpledrm, kernel with debugging).
> >>>>>
> >>>>> cfb_imageblit(), new: 15724 cycles
> >>>>> cfb_imageblit(): old: 30566 cycles
> >>>>>
> >>>>> In the optimized case, cfb_imageblit() is now ~2x faster than before.
> >>>>>
> >>>>> v3:
> >>>>>      * fix commit description (Pekka)
> >>>>>
> >>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >>>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> >>>> This patch landed recently in linux next-20220308 as commit 0d03011894d2
> >>>> ("fbdev: Improve performance of cfb_imageblit()"). Sadly it causes a
> >>>> freeze after DRM and emulated fbdev initialization on various Samsung
> >>>> Exynos ARM 32bit based boards. This happens when kernel is compiled from
> >>>> exynos_defconfig. Surprisingly when kernel is compiled from
> >>>> multi_v7_defconfig all those boards boot fine, so this is a matter of
> >>>> one of the debugging options enabled in the exynos_defconfig. I will try
> >>>> to analyze this further and share the results. Reverting $subject on top
> >>>> of next-20220308 fixes the boot issue.
> >>>
> >>> Thanks for reporting. I don't have the hardware to reproduce it and
> >>> there's no obvious difference to the original version. It's supposed
> >>> to be the same algorithm with a different implementation. Unless you
> >>> can figure out the issue, we can also revert the patch easily.
> >>
> >> I've played a bit with .config options and found that the issue is
> >> caused by the compiled-in fonts used for the framebuffer. For some
> >> reasons (so far unknown to me), exynos_defconfig has the following odd
> >> setup:
> >>
> >> CONFIG_FONT_SUPPORT=y
> >> CONFIG_FONTS=y
> >> # CONFIG_FONT_8x8 is not set
> >> # CONFIG_FONT_8x16 is not set
> >> # CONFIG_FONT_6x11 is not set
> >> CONFIG_FONT_7x14=y
> >> # CONFIG_FONT_PEARL_8x8 is not set
> >> # CONFIG_FONT_ACORN_8x8 is not set
> >> # CONFIG_FONT_MINI_4x6 is not set
> >> # CONFIG_FONT_6x10 is not set
> >> # CONFIG_FONT_10x18 is not set
> >> # CONFIG_FONT_SUN8x16 is not set
> >> # CONFIG_FONT_SUN12x22 is not set
> >> # CONFIG_FONT_TER16x32 is not set
> >> # CONFIG_FONT_6x8 is not set
> >>
> >> Such setup causes a freeze during framebuffer initialization (or just
> >> after it got registered). I've reproduced this even on Raspberry Pi 3B
> >> with multi_v7_defconfig and changed fonts configuration (this also
> >> required to disable vivid driver, which forces 8x16 font), where I got
> >> the following panic:
> >>
> >> simple-framebuffer 3eace000.framebuffer: framebuffer at 0x3eace000,
> >> 0x12c000 bytes
> >> simple-framebuffer 3eace000.framebuffer: format=a8r8g8b8,
> >> mode=640x480x32, linelength=2560
> >> 8<--- cut here ---
> >> Unable to handle kernel paging request at virtual address f0aac000
> >
> > So support for images with offsets or widths that are not a multiple
> > of 8 got broken in cfb_imageblit(). Oops...
> >
> > BTW, the various drawing routines used to set a bitmask indicating
> > which alignments were supported (see blit_x), but most of them no
> > longer do, presumably because all alignments are now supported
> > (since ca. 20 years?).
> > So you can (temporarily) work around this by filling in blit_x,
> > preventing the use of the 7x14 font.
>
> How do I activate the 7x14 font? It's compiled into the kernel already
> (CONFIG_FONT_7x14=y).

Documentation/fb/fbcon.rst:1. fbcon=font:<name>

Or just disable all other fonts.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
