Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1554F18E1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A6210E153;
	Mon,  4 Apr 2022 15:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEA010E153
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 15:52:19 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id z19so8073305qtw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 08:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o3vs63IC1K0uTiORv1QjqWD3HYAAr5eIqR2CDFPF9J0=;
 b=wdv5r/U+sgxwXFcKqovEFy6KrZGSBhBxUnHFQxkyP+mqbwoJOtIlR83szeIKivz/iv
 PVTUXFu3fnuaqRMqTZPs9Hk5OUv/pZ+DAs+tO6tiaH0AYcSo5Co8GVbdhmZec0Bjaclp
 uDlxwPHIuNGRG9y0Zx4V0e/MNrocdy8IoJNYnfFxRg7g45M97mv7cSOxfVUYEZWfb+SE
 UcdtCNPSG6C8Gd2wpjJzJTSbmcQGJzPH32raeAj0sgSXIOvrmOm4Ilet3F6XGdZv0Byb
 9NM8P/UVffn74uX+MZOTqsbys1avUDXNChAEdAiu9zoihOsUXySaXBVNv/yIOYAUU60w
 jFzg==
X-Gm-Message-State: AOAM5332nGNaDWSa4n2nmzaDBHrHwcgJftfyB0OROu3EtnlfwSBolf/S
 IX6aU7ou5NzxfobOySal1b0il0utfkvAzw==
X-Google-Smtp-Source: ABdhPJzYwbkxz6kJ0E7d3lmH3T1Mpt2NAHayqDClhecVkM+PzGsrc7X5mKpTQl4Pe6GYm8haPXj4sg==
X-Received: by 2002:a05:622a:148e:b0:2e2:2ebd:63d9 with SMTP id
 t14-20020a05622a148e00b002e22ebd63d9mr593219qtx.601.1649087537682; 
 Mon, 04 Apr 2022 08:52:17 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 v18-20020a05622a189200b002e22e09d77fsm9252317qtc.59.2022.04.04.08.52.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 08:52:17 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id f38so18406306ybi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 08:52:17 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id
 66-20020a250045000000b0063396e22179mr386892yba.393.1649087536915; 
 Mon, 04 Apr 2022 08:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220404084723.79089-1-zheyuma97@gmail.com>
 <20220404084723.79089-7-zheyuma97@gmail.com>
In-Reply-To: <20220404084723.79089-7-zheyuma97@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Apr 2022 17:52:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4ynAyE9sey17f1iP_0nSJexWOB+nYdfRFXPbQXfCksA@mail.gmail.com>
Message-ID: <CAMuHMdW4ynAyE9sey17f1iP_0nSJexWOB+nYdfRFXPbQXfCksA@mail.gmail.com>
Subject: Re: [PATCH 6/7] video: fbdev: arkfb: Error out if 'pixclock' equals
 zero
To: Zheyu Ma <zheyuma97@gmail.com>
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
Cc: Helge Deller <deller@gmx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 4, 2022 at 3:10 PM Zheyu Ma <zheyuma97@gmail.com> wrote:
> The userspace program could pass any values to the driver through
> ioctl() interface. If the driver doesn't check the value of 'pixclock',
> it may cause divide error.
>
> Fix this by checking whether 'pixclock' is zero.
>
> The following log reveals it:
>
> [   76.603696] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> [   76.603712] RIP: 0010:arkfb_set_par+0x10fc/0x24f0
> [   76.603762] Call Trace:
> [   76.603764]  <TASK>
> [   76.603773]  fb_set_var+0x604/0xeb0
> [   76.603827]  do_fb_ioctl+0x234/0x670
> [   76.603873]  fb_ioctl+0xdd/0x130
> [   76.603881]  do_syscall_64+0x3b/0x90
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/arkfb.c
> +++ b/drivers/video/fbdev/arkfb.c
> @@ -566,6 +566,9 @@ static int arkfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
>  {
>         int rv, mem, step;
>
> +       if (!var->pixclock)
> +               return -EINVAL;

When passed an invalid value, .check_var() is supposed to
round up the invalid to a valid value, if possible.

> +
>         /* Find appropriate format */
>         rv = svga_match_format (arkfb_formats, var, NULL);
>         if (rv < 0)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
