Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA644344892
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 16:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021396E4B7;
	Mon, 22 Mar 2021 15:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98DB6E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 15:05:19 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id j4so5644872uan.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 08:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QKcelu+NmBcULRnt/75BGuY/1w8xytannxFSZVcT4b8=;
 b=PcqAgCne6TZyKz/KykoWAiO5PUYZMQCgMQ5qlHy73PieNt4pCbWLilN8w3d6oDGtXm
 tOUVjNrH0Z/OEfyHZIY1i10b2xIN0YpV5MBHy+iw36aafpHlue45sx0VUx03VJw6H60c
 q0BuGzSJCvTAeAYHj8uTVlYSCJBuD/CmJn3hZivFFQ2yRYdWd0sZEra1Km7odP0QW7Kd
 DcVMX61qXYlq/Cxz1tc7QYyeyIzqbUxn7lXUsJcJERm+Yoku5hpIY9wvtVRmjycJ1GnJ
 6wUcYlAKs+H8xpiqWoDTAkuxjeyWF/9fjgqIvvQbjDRg2sprKjkkbe9Jo0ZiPqvzGUs3
 JG4g==
X-Gm-Message-State: AOAM530yM5/N6J6knNxm4CAEC8T4vL8VxliTxw0gZDs6Jz2XFgh0rAJZ
 eFzrNJX3w/8RP9iYFMU0iYPX7Xp8YY4m3WZl4Uo=
X-Google-Smtp-Source: ABdhPJz0b1s1oTOxCucwqAxWp5R67A8XGklstumBCcjoVt+uAGLhQvuzSA30ih2KS6v8elIzwhSfkW8ymWhFpvRQgjg=
X-Received: by 2002:ab0:30b3:: with SMTP id b19mr307821uam.58.1616425518872;
 Mon, 22 Mar 2021 08:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210322105307.1291840-1-arnd@kernel.org>
In-Reply-To: <20210322105307.1291840-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Mar 2021 16:05:07 +0100
Message-ID: <CAMuHMdUrALGRaxgrOMUjhEzYUrHataDDNaMr8qs+EMwjrr9hfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] fbdev: omapfb: avoid -Wempty-body warning
To: Arnd Bergmann <arnd@kernel.org>
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
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)"
 <linux-omap@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 11:54 AM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Building with 'make W=1' shows a few harmless warnings:
>
> drivers/video/fbdev/omap2/omapfb/omapfb-main.c: In function 'omapfb_calc_addr':
> drivers/video/fbdev/omap2/omapfb/omapfb-main.c:823:56: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   823 |                     var->xoffset, var->yoffset, offset);
>       |                                                        ^
> drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c: In function 'omapfb_ioctl':
> drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c:911:45: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   911 |                 DBG("ioctl failed: %d\n", r);
>
> Avoid these by using no_printk(), which adds format string checking as
> well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
