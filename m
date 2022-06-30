Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC525622A9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F7410EC3B;
	Thu, 30 Jun 2022 19:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0696E10EC3B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:09:44 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id b125so15116675qkg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McFecsdmSkzrr5h/aM2httNZHnRBnCTdkFuqJ0CF+EA=;
 b=dVfd3fe/ep/PvFJy+cMIVUtg2xksObKSqlh6fBU/qg7KJrukkJTYiryOUtr0DeXFE4
 2y1URzWj+taRojcPUhRAyV7igf1tGAGE+b8bYXk+QH93nhwoKdCbX8hu5ASvfKYxzc28
 /w+6t0PrClwVwMZyIgS9cpKbjFN3/6lKJUUJN7EQquziiO39gpE/gRnxOx2xc6NWTYhK
 XdykkswfSkq5cGZplzkm9LWZMynnfqxH057nYIYZoikudE9ouoNs06Zoi2tMT+X21RLa
 EtGGT4yCQqIQXdINHWXy7c3eWsX9qJPc3bOVoPw3u8ikEu2oVnmRuQu9HHMhgCms3URb
 ZyQA==
X-Gm-Message-State: AJIora/00MIy73zdbls8LOEjuvfKNT3d939S4DKbK8qDnB6XPsF5dLoN
 B/ONlfscmtjsC6uLPdjOcG5wIDSm7QRHpg==
X-Google-Smtp-Source: AGRyM1uLNC7mYtCtuYTg0fMKi5qG/EeqS5Rq256f5KUUBPMkJCwxxjpRF2JO26ZGiVwRb02TufgiGA==
X-Received: by 2002:a37:a296:0:b0:6af:6dba:b75c with SMTP id
 l144-20020a37a296000000b006af6dbab75cmr7535891qke.257.1656616182524; 
 Thu, 30 Jun 2022 12:09:42 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05620a294400b006b24d912ab7sm1067046qkp.46.2022.06.30.12.09.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:09:42 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id p7so76934ybm.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:09:42 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr10820211ybr.380.1656616181876; Thu, 30
 Jun 2022 12:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-4-deller@gmx.de>
In-Reply-To: <20220629200024.187187-4-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 21:09:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVe3TPCpEiNks2p1AAc-7KXx8fnEa8J=Qsvc0d+WTL+w@mail.gmail.com>
Message-ID: <CAMuHMdWVe3TPCpEiNks2p1AAc-7KXx8fnEa8J=Qsvc0d+WTL+w@mail.gmail.com>
Subject: Re: [PATCH 3/5] fbcon: Prevent that screen size is smaller than font
 size
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> We need to prevent that users configure a screen size which is smaller than the
> currently selected font size. Otherwise rendering chars on the screen will
> access memory outside the graphics memory region.
> This patch adds a new function fbcon_modechange_possible() which
> implements this check and which later may be extended with other checks
> if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
> ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
> for a too small screen size.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

Thanks for your patch!

> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2736,6 +2736,34 @@ void fbcon_update_vcs(struct fb_info *info, bool all)
>  }
>  EXPORT_SYMBOL(fbcon_update_vcs);
>
> +/* let fbcon check if it supports a new screen resolution */
> +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *var)
> +{
> +       struct fbcon_ops *ops = info->fbcon_par;
> +       struct vc_data *vc;
> +       int i;
> +
> +       WARN_CONSOLE_UNLOCKED();
> +
> +       if (!ops || ops->currcon < 0)
> +               return -EINVAL;

So if the virtual console is _not_ used as a text console, we refuse
mode changes?

> +
> +       /* prevent setting a screen size which is smaller than font size */
> +       for (i = first_fb_vc; i <= last_fb_vc; i++) {
> +               vc = vc_cons[i].d;
> +               if (!vc || vc->vc_mode != KD_TEXT ||
> +                          registered_fb[con2fb_map[i]] != info)
> +                       continue;
> +
> +               if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) ||
> +                   vc->vc_font.height > FBCON_SWAP(var->rotate, var->yres, var->xres))
> +                       return -EINVAL;
> +       }

IMHO this looks way too fragile, and we should fix the rendering code
to handle cols == 0 || rows == 0 instead...

> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(fbcon_modechange_possible);
> +
>  int fbcon_mode_deleted(struct fb_info *info,
>                        struct fb_videomode *mode)
>  {
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index e645b96d2700..324f726739c4 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1111,7 +1111,9 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>                         var.xres_virtual = var.xres;
>                 if (var.yres_virtual < var.yres)
>                         var.yres_virtual = var.yres;
> -               ret = fb_set_var(info, &var);
> +               ret = fbcon_modechange_possible(info, &var);
> +               if (!ret)
> +                       ret = fb_set_var(info, &var);
>                 if (!ret)
>                         fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>                 unlock_fb_info(info);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
