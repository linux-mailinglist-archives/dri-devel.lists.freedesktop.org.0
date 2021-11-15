Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB22D450004
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 09:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771BF6E866;
	Mon, 15 Nov 2021 08:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBAB6E866
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 08:35:23 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id b17so33314125uas.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 00:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PmBiLQLwGk4BtQ4xIuEDuY7kvhhjd5riXXU4uoLcz30=;
 b=meYrEGfnJlxyUlndmn6/EJgLoUy2U9352WYvzzs3OeLmxGDW2nODY2rWdQgJr/hvB2
 RJz4ydPBuVcI7Sz2lzAdz1KDimOue8BC2cVS6Zo6Z9XSflnfzSFsX4faMBaV4ev9YhMu
 ZJ3f0HXG1RBC0uT2rIPqp6hLeCVnKUkn/XYSgiSVXqMMpISDOwO3vBKSWiK5eSp8R2Z+
 DUSWlvxzU0F5Lbbu2NaWYoIpPqdxad0YXEL0K/5bj64r8l/y8/hF/TeZUKFMbKQjZHbV
 LU2don/G8Hv7LAt6ibhFCWgc4yFqEW2Kw7JbXYPpyy/3hhVWVAdoFsrHUzqcnkyueltf
 1opA==
X-Gm-Message-State: AOAM531/Ez6Q3Cq+Xs8ZfLSM+cefpZVz48d+texdl2RCUdh+ldVintD+
 hV6sWLW4BSul+vh+V9JNjMheN7NOxnNhbA==
X-Google-Smtp-Source: ABdhPJzDiEVYN/2mnLh+KRZKG5W2o+mnmahUv3kxpk6ht0mqXHByEJGPGB3NgDMi7ntk9dQXEhqtbQ==
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr38174041uah.22.1636965322249; 
 Mon, 15 Nov 2021 00:35:22 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id c11sm8862581vsh.22.2021.11.15.00.35.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 00:35:21 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id y5so15282016ual.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 00:35:21 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr52047394uar.14.1636965320871; 
 Mon, 15 Nov 2021 00:35:20 -0800 (PST)
MIME-Version: 1.0
References: <20211115063257.14369-1-rdunlap@infradead.org>
In-Reply-To: <20211115063257.14369-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Nov 2021 09:35:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWerZGYz_i8oBK4-ZC+AHZm8c0VW7CXDRX=2PxboWFZ-w@mail.gmail.com>
Message-ID: <CAMuHMdWerZGYz_i8oBK4-ZC+AHZm8c0VW7CXDRX=2PxboWFZ-w@mail.gmail.com>
Subject: Re: [PATCH] fbdev: sh7760fb: document fallthrough cases
To: Randy Dunlap <rdunlap@infradead.org>
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
 Rich Felker <dalias@libc.org>,
 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Manuel Lauss <mano@roarinelk.homelinux.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 7:33 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> Fix fallthrough warnings in sh776fb.c:
>
> ../drivers/video/fbdev/sh7760fb.c: In function 'sh7760fb_get_color_info':
> ../drivers/video/fbdev/sh7760fb.c:138:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   138 |                 lgray = 1;
> ../drivers/video/fbdev/sh7760fb.c:143:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   143 |                 lgray = 1;
>
> Just document the current state of code execution/flow.
>
> Fixes: 4a25e41831ee ("video: sh7760fb: SH7760/SH7763 LCDC framebuffer driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Section 30.4.4 ("Data Format") of the SH7760 Group Hardware
Manual confirms fall-through is appropriate here (especially for
the odd 6 bpp mode).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
