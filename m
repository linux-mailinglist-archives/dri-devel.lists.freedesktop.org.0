Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3517562327
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1474812ABB0;
	Thu, 30 Jun 2022 19:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321D712ABAA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:31:25 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id p11so2010030qkg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZgxuFddNswMaFAXw3XokbvDGJHJxBrbwCZoDWZ01t3w=;
 b=UXm3PNlNuvUMKJhNsbGzjmrlB1/wjbjWAZ7F0Ht9kZkjuvhYKLnMOg7md7xMQqjl2R
 aa06vx9QUtYigzDp6bfvKAfJULgJcUh+acSi5MW0yfg0msUiwjfR2qxRNjpFAh/Nrk/l
 w9/e6+zSv4Tm3HS/kEmKJ+wTmrPrT0JdVRcf+xCNrr+JgxpI3ioj02bZc73PFaIuLvPn
 7V9YtcQW1Gdr4Ig/En8Gg6fNdNNWtV/xd0ZTDhGSjt2W+t9NhHL5/P+vaGpXGYtOiKtT
 HQfRoeW3T+jQKOzfHKJK/kJtrj2Lg3SopJjcJXQ79RgpNEjyoM+r9pYklP3/cgIYseGl
 7Ayg==
X-Gm-Message-State: AJIora/o2y59zYB/sA2RjNpX3QpRg98btazyIKpqddsMHctC3B5yaSGi
 BcOyRimTO13D20Nxl+reP69Hsi30Trgoug==
X-Google-Smtp-Source: AGRyM1u79IZKerhNZYbGAZZuwqarHpjP239U6O+5NUtB+x+e0PIUmjJfv1SrRFfM7zZ0b43t13XLwQ==
X-Received: by 2002:a37:5f41:0:b0:6a6:b397:f59c with SMTP id
 t62-20020a375f41000000b006a6b397f59cmr7832996qkb.195.1656617483578; 
 Thu, 30 Jun 2022 12:31:23 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 i11-20020a05620a248b00b006af4f9b77fdsm7904698qkn.44.2022.06.30.12.31.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:31:23 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-317a66d62dfso3209407b3.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:31:22 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr12869945ywg.383.1656617482577; Thu, 30
 Jun 2022 12:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220628022657.597208-1-sashal@kernel.org>
 <20220628022657.597208-8-sashal@kernel.org>
In-Reply-To: <20220628022657.597208-8-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 21:31:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4xPPGv0U4QZkyA-AT07AjYVGGJdKjpQyZCtAH4hYKWQ@mail.gmail.com>
Message-ID: <CAMuHMdV4xPPGv0U4QZkyA-AT07AjYVGGJdKjpQyZCtAH4hYKWQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.9 08/13] video: fbdev: simplefb: Check before
 clk_put() not needed
To: Sasha Levin <sashal@kernel.org>
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
 Yihao Han <hanyihao@vivo.com>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sasha,

On Tue, Jun 28, 2022 at 4:32 AM Sasha Levin <sashal@kernel.org> wrote:
> From: Yihao Han <hanyihao@vivo.com>
>
> [ Upstream commit 5491424d17bdeb7b7852a59367858251783f8398 ]
>
> clk_put() already checks the clk ptr using !clk and IS_ERR()

While I think that is true for all clock implementations in v5.19-rc4,
it is not true for v4.9.320.

> so there is no need to check it again before calling it.
>
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -231,8 +231,7 @@ static int simplefb_clocks_init(struct simplefb_par *par,
>                 if (IS_ERR(clock)) {
>                         if (PTR_ERR(clock) == -EPROBE_DEFER) {
>                                 while (--i >= 0) {
> -                                       if (par->clks[i])
> -                                               clk_put(par->clks[i]);
> +                                       clk_put(par->clks[i]);
>                                 }
>                                 kfree(par->clks);
>                                 return -EPROBE_DEFER;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
