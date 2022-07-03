Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F0565B37
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E886010E516;
	Mon,  4 Jul 2022 16:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA0A10E02B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 08:50:16 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id q16so5861350qtn.5
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 01:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q10avrUQvDZXQrB8NbI6GXVYl9CBfKWMfdOzIE6Fs90=;
 b=v5yXkdg39SKjSOtEWb+93CrN7yZcT4PqLz2zjDIj6a/sFcCZ/JhTpNYcI3M2EvjZGS
 f4/kMllIbszPF+jE+pnVMQWqwapggGYQI3FoVDoq5B/x8LgA0Jt3ZM067OzB+27cK/tN
 oT39TELbtx4vZWeQ73h574Fkd1fkxp/9CFHF1cO32lBBAGJ6agurZ3kG+u1SgFiJ9kvv
 ayOT2CAiwIUagNpuasAZB5rJPH1EA3TSuxN62QOHj/Mkrrq7QvibArTdpwS5YhLdXvJG
 MkV+a1eyJb8F/dKLRSobXN+h8tNgqsDC1BJOn18lE4m87JF+uxBY78pZRjXh0kXjL2mR
 SDgg==
X-Gm-Message-State: AJIora+CUMrSToiaavi7CURrkIW6UpiTEQSmpyPrObbasaYES8R9psan
 48xJVkzWsmAx8+YMk2/ffnc7pebwQA4uWQ==
X-Google-Smtp-Source: AGRyM1uhZtLLYS0+W72jNnsKswxtC+/kJmsI23AqSwt5zgm1q9muBUCg0KoowBqmJ+8jA+H4VTZ8HA==
X-Received: by 2002:ac8:5a0a:0:b0:31d:28b4:56c with SMTP id
 n10-20020ac85a0a000000b0031d28b4056cmr18325534qta.298.1656838215317; 
 Sun, 03 Jul 2022 01:50:15 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 w4-20020a05620a424400b006af08c26774sm21535668qko.47.2022.07.03.01.50.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 01:50:15 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-31c8bb90d09so4014277b3.8
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 01:50:14 -0700 (PDT)
X-Received: by 2002:a81:af27:0:b0:31c:833f:eda5 with SMTP id
 n39-20020a81af27000000b0031c833feda5mr5763706ywh.358.1656838214734; Sun, 03
 Jul 2022 01:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220701202352.559808-1-deller@gmx.de>
 <20220701202352.559808-3-deller@gmx.de>
In-Reply-To: <20220701202352.559808-3-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Jul 2022 10:50:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCSbd38H95jSGiTARekE1Y2YUtKfak9cK3xLwd+ubGdQ@mail.gmail.com>
Message-ID: <CAMuHMdUCSbd38H95jSGiTARekE1Y2YUtKfak9cK3xLwd+ubGdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fbcon: Prevent that screen size is smaller than
 font size
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

On Fri, Jul 1, 2022 at 10:23 PM Helge Deller <deller@gmx.de> wrote:
> We need to prevent that users configure a screen size which is smaller than the
> currently selected font size. Otherwise rendering chars on the screen will
> access memory outside the graphics memory region.
>
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

unsigned int i

> +
> +       WARN_CONSOLE_UNLOCKED();
> +
> +       if (!ops)
> +               return -EINVAL;

This means the frame buffer device is not used as a text console
(i.e. the text console is mapped to a different frame buffer device),
hence it should return success.

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
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(fbcon_modechange_possible);

EXPORT_SYMBOL_GPL()?
No idea why most of fbcon uses the non-GPL variant.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
