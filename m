Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C568348889A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 11:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D6D10E2EC;
	Sun,  9 Jan 2022 10:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4086910E2EC
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 10:01:47 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id b77so6423354vka.11
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 02:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVWt1AOHq8FaZK5a1Obn95ziGdwNeIdN+dxQ37ARsjk=;
 b=eFIGWNhGpW8NsFZXDo/t6UNI4LKa2E7QZ9lPgwH6U4Po/2BZF8AKOo+KQMED0lXWdW
 nIZh86+huWg8S+2eGPuQXdnW1VZ3TQhloZlOWMB1YEVXZ9em7A5hZvURAw9ckZaDhFKl
 lBq+TtFUrhaj/wycQ640XzBHtdfdnzfLNHoOdjYih1cJei9JJPq9NDlFXDLItPR2oK+a
 YQClYs+KCOqEq57tg++DByDtDMbB8ViQUBtJaxeHQ2u8wY/Yt2zrZ3La6TriauGnAlcV
 VYdgfSTphaOmSK0gz970kkGHi4pZ3Z28HH694brXDZ7KvL4uaJ9N8qVpQn1xcrk5N4QW
 MGXw==
X-Gm-Message-State: AOAM533a/4KHfUSHPO3eiGFcEwN7DRXOJRp4dh0yRae8LcAd2J1w7oYw
 QuLLk8pIZ6xBe0SKFL1CjW5VnNOIv+XN3A==
X-Google-Smtp-Source: ABdhPJyTlExLpVPtRR36YZFddU4Ngd3SjAE7moLNfEygpjPxCqX3uqccZ/ZB231smMxTzgiSo/lxsg==
X-Received: by 2002:a1f:2497:: with SMTP id k145mr16599255vkk.21.1641722505684; 
 Sun, 09 Jan 2022 02:01:45 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id q11sm2319626uaj.4.2022.01.09.02.01.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 02:01:45 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id x33so17147012uad.12
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 02:01:44 -0800 (PST)
X-Received: by 2002:ab0:2118:: with SMTP id d24mr23782568ual.78.1641722504022; 
 Sun, 09 Jan 2022 02:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20220107110723.323276-1-javierm@redhat.com>
 <20220107110723.323276-3-javierm@redhat.com>
In-Reply-To: <20220107110723.323276-3-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 9 Jan 2022 11:01:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvFL9GYM-dMdZeyZrQjr13Sgt-XXN19bc6jA3emn2Dcw@mail.gmail.com>
Message-ID: <CAMuHMdWvFL9GYM-dMdZeyZrQjr13Sgt-XXN19bc6jA3emn2Dcw@mail.gmail.com>
Subject: Re: [PATCH 2/2] video: vga16fb: Only probe for EGA and VGA 16 color
 graphic cards
To: Javier Martinez Canillas <javierm@redhat.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Kris Karas <bugs-a21@moonlit-rail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Jan 7, 2022 at 9:00 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The vga16fb framebuffer driver only supports Enhanced Graphics Adapter
> (EGA) and Video Graphics Array (VGA) 16 color graphic cards.
>
> But it doesn't check if the adapter is one of those or if a VGA16 mode
> is used. This means that the driver will be probed even if a VESA BIOS
> Extensions (VBE) or Graphics Output Protocol (GOP) interface is used.
>
> This issue has been present for a long time but it was only exposed by
> commit d391c5827107 ("drivers/firmware: move x86 Generic System
> Framebuffers support") since the platform device registration to match
> the {vesa,efi}fb drivers is done later as a consequence of that change.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215001
> Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
> Reported-by: Kris Karas <bugs-a21@moonlit-rail.com>
> Cc: <stable@vger.kernel.org> # 5.15.x
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Tested-by: Kris Karas <bugs-a21@moonlit-rail.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -1422,6 +1422,18 @@ static int __init vga16fb_init(void)
>
>         vga16fb_setup(option);
>  #endif
> +
> +       /* only EGA and VGA in 16 color graphic mode are supported */
> +       if (screen_info.orig_video_isVGA != VIDEO_TYPE_EGAC &&
> +           screen_info.orig_video_isVGA != VIDEO_TYPE_VGAC)
> +               return -ENODEV;

Probably these checks should be wrapped inside a check for CONFIG_X86?

All non-x86 architectures (except for 2 MIPS platforms) treat
orig_video_isVGA as a boolean flag, and just assign 1 to it.

> +
> +       if (screen_info.orig_video_mode != 0x0D &&      /* 320x200/4 (EGA) */
> +           screen_info.orig_video_mode != 0x0E &&      /* 640x200/4 (EGA) */
> +           screen_info.orig_video_mode != 0x10 &&      /* 640x350/4 (EGA) */
> +           screen_info.orig_video_mode != 0x12)        /* 640x480/4 (VGA) */
> +               return -ENODEV;
> +

Likewise.

A long time ago, I used vga16fb on a PPC box to use a standard PC
graphics card (initialized using an emulator for the card's BIOS ROM),
as a second display. The above changes would break such a use case.

>         ret = platform_driver_register(&vga16fb_driver);
>
>         if (!ret) {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
