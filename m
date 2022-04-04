Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10FE4F18E6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D761810E177;
	Mon,  4 Apr 2022 15:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C659D10E177
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 15:52:42 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id 1so8002752qke.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 08:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AoKMmslTq9vAMf9fgCFPDKuPR8Y+Dj4j8nKqoiHe7eI=;
 b=47ZmSLXTdWT+PeQALXaes7EnaIOkE+53/UzpaFq+yktr6KoR34+tvwB9MU50ANgifL
 wxlDo/1ryEbLVvkV6lr/8NuflJ4zbXFMKDFbZHLDa+Kk29g801i7cYsUWOI4HqHXhjpP
 kR7mzf+kwqF4bbvd6zqklEr5TKEAWDgoe4qumG1ohHQXlxWi9qvfHXWRmytVsNUBkB1C
 Ha8ygV7zvoUHUv//wJZIuMkcv1lQRdZDaVBWEezhftgs6zlSuht8Sg6FM3Yh4nkaNMwe
 59Ts7xj5JMRJUhcKTZnQdJW/V3pKe3LkMt3ZvM/ofBUpMxlg6KjtNdvF4sX2WxfLNCMM
 71+w==
X-Gm-Message-State: AOAM530CUgu8se4s2sOP6IqOROOZNoGPUDKt+Og3YE6TQ4jf/bCBjjqO
 0svSHDQDQ48DrqCO6snlhc6IgCySuhz8gQ==
X-Google-Smtp-Source: ABdhPJzAOJ1T32KT9ZYZ9xWl6hhOQEVT67sW+isOB9p8kuEAqQZrv5Y+GGlF/InmOEma655QcNoJjw==
X-Received: by 2002:a37:2703:0:b0:67e:85d1:f5f3 with SMTP id
 n3-20020a372703000000b0067e85d1f5f3mr305738qkn.481.1649087561634; 
 Mon, 04 Apr 2022 08:52:41 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 br35-20020a05620a462300b0067e890073cbsm7360100qkb.6.2022.04.04.08.52.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 08:52:40 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id j2so18506003ybu.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 08:52:40 -0700 (PDT)
X-Received: by 2002:a25:c049:0:b0:634:6751:e8d2 with SMTP id
 c70-20020a25c049000000b006346751e8d2mr437586ybf.6.1649087560296; Mon, 04 Apr
 2022 08:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220404084723.79089-1-zheyuma97@gmail.com>
 <20220404084723.79089-8-zheyuma97@gmail.com>
In-Reply-To: <20220404084723.79089-8-zheyuma97@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Apr 2022 17:52:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXz0z2wARniaLqLqp-Oc6HMgoMpbL3D9Fg57W-wkLWBhw@mail.gmail.com>
Message-ID: <CAMuHMdXz0z2wARniaLqLqp-Oc6HMgoMpbL3D9Fg57W-wkLWBhw@mail.gmail.com>
Subject: Re: [PATCH 7/7] video: fbdev: s3fb: Error out if 'pixclock' equals
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

On Mon, Apr 4, 2022 at 3:50 PM Zheyu Ma <zheyuma97@gmail.com> wrote:
> The userspace program could pass any values to the driver through
> ioctl() interface. If the driver doesn't check the value of 'pixclock',
> it may cause divide error.
>
> Fix this by checking whether 'pixclock' is zero in s3fb_check_var().
>
> The following log reveals it:
>
> [  511.141561] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> [  511.141607] RIP: 0010:s3fb_check_var+0x3f3/0x530
> [  511.141693] Call Trace:
> [  511.141695]  <TASK>
> [  511.141716]  fb_set_var+0x367/0xeb0
> [  511.141815]  do_fb_ioctl+0x234/0x670
> [  511.141876]  fb_ioctl+0xdd/0x130
> [  511.141888]  do_syscall_64+0x3b/0x90
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  drivers/video/fbdev/s3fb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
> index 5c74253e7b2c..b93c8eb02336 100644
> --- a/drivers/video/fbdev/s3fb.c
> +++ b/drivers/video/fbdev/s3fb.c
> @@ -549,6 +549,9 @@ static int s3fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
>         int rv, mem, step;
>         u16 m, n, r;
>
> +       if (!var->pixclock)
> +               return -EINVAL;
> +

When passed an invalid value, .check_var() is supposed to
round up the invalid value to a valid value, if possible.

>         /* Find appropriate format */
>         rv = svga_match_format (s3fb_formats, var, NULL);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
