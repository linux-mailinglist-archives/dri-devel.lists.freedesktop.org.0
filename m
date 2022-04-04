Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535504F1404
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 13:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1551A10F091;
	Mon,  4 Apr 2022 11:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEF910F091
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 11:47:38 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z19so7426538qtw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 04:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pkI30un2e+aw5iEZT5SxMrRKH4N5lxurp/14o6OWyKM=;
 b=ooDmXOw+wJNZ7cpZkScTGvHuWGWyxA17fPOocnTdnyVAVjh2WPPKbHVuaQJBkQGB6m
 HYN3ZK6utAyIR+6bAvNI6ZZXDFdg0RX8EbCqKyK/ragAP5RSzEG4xjmEJdR6vgcUpQof
 VKBTBzzC5no7neLLEkK/j3w+6yj8qfGpJKPQiOE4CepZokSQNF6sBmwFII0OnmLZz+AO
 3N79dPfn+cCvtwTPKfR7Dz/ngJRxmFl+p8u4m7SR/QwjpAIy99ZsBRvXxfydoHpWSMWK
 scESMEqyFGO3D+UrIz4ReLewGtqiRq4w3SMniRmantdds0K5oWlHe3KXcxrZiUKLI+x0
 wrFA==
X-Gm-Message-State: AOAM532NGqXZWEemZy+8kEuAbbob2xx1Qhu+kEdpdoppJKFOIKQ0fXU7
 28P3YbAPDYezzpppBt7iKDabJlsE5CknRg==
X-Google-Smtp-Source: ABdhPJzQdr4Y778OO0DCgUtMeemMjXwDy+Z3BYCnQsawui1wi4Pe3UPKsX+rQQSVJLyMvT9Q6xjKCg==
X-Received: by 2002:ac8:5a16:0:b0:2e1:ea00:b4e1 with SMTP id
 n22-20020ac85a16000000b002e1ea00b4e1mr16941194qta.329.1649072856638; 
 Mon, 04 Apr 2022 04:47:36 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05622a038800b002e236535929sm8340851qtx.32.2022.04.04.04.47.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 04:47:36 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id x21so10878269ybd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 04:47:36 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id
 66-20020a250045000000b0063396e22179mr20536043yba.393.1649072855895; 
 Mon, 04 Apr 2022 04:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220404084723.79089-1-zheyuma97@gmail.com>
 <20220404084723.79089-5-zheyuma97@gmail.com>
In-Reply-To: <20220404084723.79089-5-zheyuma97@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Apr 2022 13:47:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWs6DwoKmEBFiwwMWDNLFS4Ow6V0YWWSU-jy3mvK2M4bw@mail.gmail.com>
Message-ID: <CAMuHMdWs6DwoKmEBFiwwMWDNLFS4Ow6V0YWWSU-jy3mvK2M4bw@mail.gmail.com>
Subject: Re: [PATCH 4/7] video: fbdev: vt8623fb: Error out if 'pixclock'
 equals zero
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

Hi Zheyu,

On Mon, Apr 4, 2022 at 1:07 PM Zheyu Ma <zheyuma97@gmail.com> wrote:
> The userspace program could pass any values to the driver through
> ioctl() interface. If the driver doesn't check the value of 'pixclock',
> it may cause divide error.
>
> Fix this by checking whether 'pixclock' is zero in the function
> vt8623fb_check_var().
>
> The following log reveals it:
>
> [   47.778727] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> [   47.778803] RIP: 0010:vt8623fb_set_par+0xecd/0x2210
> [   47.778870] Call Trace:
> [   47.778872]  <TASK>
> [   47.778909]  fb_set_var+0x604/0xeb0
> [   47.778995]  do_fb_ioctl+0x234/0x670
> [   47.779041]  fb_ioctl+0xdd/0x130
> [   47.779048]  do_syscall_64+0x3b/0x90
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/vt8623fb.c
> +++ b/drivers/video/fbdev/vt8623fb.c
> @@ -321,6 +321,9 @@ static int vt8623fb_check_var(struct fb_var_screeninfo *var, struct fb_info *inf
>  {
>         int rv, mem, step;
>
> +       if (!var->pixclock)
> +               return -EINVAL;
> +

When passed an invalid value, .check_var() is supposed to
round up the invalid to a valid value, if possible.

>         /* Find appropriate format */
>         rv = svga_match_format (vt8623fb_formats, var, NULL);
>         if (rv < 0)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
