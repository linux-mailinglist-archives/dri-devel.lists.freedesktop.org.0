Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CFA56226F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD19611AC3E;
	Thu, 30 Jun 2022 19:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7A211ABBC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:00:59 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id c137so15152725qkg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9WBUVcgDv8MjfQAjmqbMGyjD439nITcAGw7oJ2dGb+s=;
 b=1s9cPooB0JzgH7JUR4LF347OxvPlkP75vUoUWyoMpYzZ0lyHyksOpcdqgkRcDlASOv
 WnHvBAq0zxO6OTpdzkASrg8J+p1FC+4Zpkr19OVd4NrJ0Dw1gdxBUbU0RH5FFWZgWV6+
 AWeBHlXa77Zd8JlZokfo0t7l35C/cJPgGxZ89yIDnHo0vixLU3vYxDip/skCA1wf1d2X
 Rf2o2Mc8eT05hQphqIEq8t0KRZV05vHKCa93MffDvWWBncNQGIjbq4VtxYSJat7evf6G
 lLB+DqwFTPPb9lm9fuRV5/9gLxW6RU7G9E4cGU1kqmOJfM5P0Nx4IHAjGsc5nhBordS4
 Wgcg==
X-Gm-Message-State: AJIora8FbTVknU7zGvuWXY1g/YFlvXWwbATnv9w/T6fog62g5L21VOoq
 yAysHd6N7HZI3EBLY2Tx6MIkWmHJvCh+tw==
X-Google-Smtp-Source: AGRyM1v8avi8b0230RAFihXEzeK5XtMqd5KV2DyniydQB49fOeWMTLApV6VJZJ023P+mV1Z0nfL05Q==
X-Received: by 2002:a05:620a:4111:b0:6a7:4b2c:a1c8 with SMTP id
 j17-20020a05620a411100b006a74b2ca1c8mr7521511qko.166.1656615658495; 
 Thu, 30 Jun 2022 12:00:58 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 l6-20020a37bb06000000b006a981a2c483sm15431531qkf.39.2022.06.30.12.00.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:00:58 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-3137316bb69so2285897b3.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:00:58 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr11920163ywb.316.1656615657800; Thu, 30
 Jun 2022 12:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-3-deller@gmx.de>
In-Reply-To: <20220629200024.187187-3-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 21:00:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
Message-ID: <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
Subject: Re: [PATCH 2/5] fbcon: Fix up user-provided virtual screen size
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
> The virtual screen size can't be smaller than the physical screen size.
> Based on the general rule that we round up user-provided input if
> neccessary, adjust the virtual screen size as well if needed.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

Thanks for your patch!

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>                         return -EFAULT;
>                 console_lock();
>                 lock_fb_info(info);
> +               /* adjust virtual screen size if user missed it */
> +               if (var.xres_virtual < var.xres)
> +                       var.xres_virtual = var.xres;
> +               if (var.yres_virtual < var.yres)
> +                       var.yres_virtual = var.yres;
>                 ret = fb_set_var(info, &var);
>                 if (!ret)
>                         fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);

Given "[PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
fb_set_var", I don't think we need this patch.  Moreover, this
patch will prevent triggering the WARN_ON()s in [PATCH 4/5] in the
most common buggy case of drivers plainly ignoring var.[xy]res_virtual.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
