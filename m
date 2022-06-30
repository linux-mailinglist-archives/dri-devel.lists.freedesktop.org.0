Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE37562300
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE19A12AA31;
	Thu, 30 Jun 2022 19:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8435112AA34
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:21:49 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id b133so15191013qkc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3PYIklwKRbZib6lnKejKJfseVyL5UdoclVR+DLTM0c=;
 b=o9J6rdbs2D7tLiT2cA742JOjf5fHGnux40JBnVF5XgH9mo7OAJdVIjFUd5NtdO/X0E
 EpEpyeE8aJ+UnTrjxM9/9mgQA6dJccLLKd2pWL0MAfYNMz0aNUDNSmu80FZtk+xb/Zcc
 DbEv6qV5zSMs6xPLrgRoXZO4sc1uMcmCk8yKz4CjD81oxgpfSF4Qne6xrlH8206xnfXn
 PyOlSPJgcS+lV7/DfPmu1dArU5TUaybA7mR6PdcaA6WuuZkcnQCxDVT6PAyn5EKhnnua
 Bpl5AdY3OnJv92YLEUufBoBpqb4uppqUcWCnWkkMbt9CTfRSrPTcEL/7md7gHWOxa8OG
 L4Cw==
X-Gm-Message-State: AJIora9tDv/gMHotspeSUiYChLsRmPhXFmv9vx3MA/5AQS9sqF6RDIEi
 9ssfCrSRyfy0kib0xMcwvTUqeWQ6438fDQ==
X-Google-Smtp-Source: AGRyM1uyXJKx+LFHZYuIT5CFE0yEZ7FKEaaUsJFNak41DtalJlqmJ0Z8hQoFUTTzEgalhdnPOUwctw==
X-Received: by 2002:a05:620a:1275:b0:6af:e17:3dcf with SMTP id
 b21-20020a05620a127500b006af0e173dcfmr7441319qkl.215.1656616908205; 
 Thu, 30 Jun 2022 12:21:48 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 i11-20020a05620a248b00b006af4f9b77fdsm7887950qkn.44.2022.06.30.12.21.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:21:47 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id v38so163505ybi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:21:47 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr11777905ybh.36.1656616907463; Thu, 30
 Jun 2022 12:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-6-deller@gmx.de>
In-Reply-To: <20220629200024.187187-6-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 21:21:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXs+m80hPjcbW6XfNrgQYyO8G5McyGSjY5bPqAxQjqk_g@mail.gmail.com>
Message-ID: <CAMuHMdXs+m80hPjcbW6XfNrgQYyO8G5McyGSjY5bPqAxQjqk_g@mail.gmail.com>
Subject: Re: [PATCH 5/5] fbcon: Use fbcon_info_from_console() in
 fbcon_modechange_possible()
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
> Use the fbcon_info_from_console() wrapper which was added to kernel
> v5.19 with commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup").
>
> Signed-off-by: Helge Deller <deller@gmx.de>

Thanks for your patch!

I guess you kept this separate, to ease backporting?
This does mean that upstream will never really see if using
registered_fb[] directly may cause problems...

> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2752,7 +2752,7 @@ int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *va
>         for (i = first_fb_vc; i <= last_fb_vc; i++) {
>                 vc = vc_cons[i].d;
>                 if (!vc || vc->vc_mode != KD_TEXT ||
> -                          registered_fb[con2fb_map[i]] != info)
> +                          fbcon_info_from_console(i) != info)
>                         continue;
>
>                 if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) ||

Anyway, LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
