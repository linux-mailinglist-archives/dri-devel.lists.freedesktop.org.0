Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42C59F46F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B457310E171;
	Wed, 24 Aug 2022 07:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00BE1125CB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 07:31:26 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id a15so12063606qko.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 00:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=82WQkDOdERyND7bY3iF+8AcDaMfTG/LJhOwz2xG4mtY=;
 b=kqTqo+ijIrCxrhth2Z+dZ9+PJeXaFQESzbmLVX/tgkp+k5EHTV6KWRD0jdXh61bgAy
 Zz21UM1PwqUthtjbvV/sORRVzXLcYR30LfIzdlxw5Mz6zRUr9ExXrreDPPEkCPlLk93G
 IMsDiGF6Iwmy6qMEebhT58h6sRBya0eDvTSjZI5ySJ8qCnqbS1la7pF4lVo8XCOhcDNQ
 5WZgURKOKHaOHk2oZsiB093AJKouQp9pzJ4W7y82V0uGH078tktaCbCaTXm+nZQ3C5Kx
 nWlMTeeeeY05poORSgMxkKQkqlK3c2T2con5L/ABVaH/Nubhm6CCwUEwMA3V/7yOFUgq
 yCqA==
X-Gm-Message-State: ACgBeo2e6Ua7Pu9mrULE93LPN2MneBgqF2OahqFv7hg4vBs8GMvj3zQA
 krjLDXLwRIIAy2ZeDIvalmEJ+js+dPllKw==
X-Google-Smtp-Source: AA6agR7Y63dB0yBKW5d7kGkxSxVWUesksAgfvcR4xGnE7Xs9/+2xbsH3dphTyQ2ZBF6QifcQkBLWQw==
X-Received: by 2002:a05:620a:4454:b0:6bb:c0d7:3585 with SMTP id
 w20-20020a05620a445400b006bbc0d73585mr18316123qkp.335.1661326285737; 
 Wed, 24 Aug 2022 00:31:25 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 p11-20020ac8740b000000b00342fcdc2d46sm12047625qtq.56.2022.08.24.00.31.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 00:31:25 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-33da3a391d8so25786667b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 00:31:25 -0700 (PDT)
X-Received: by 2002:a81:658:0:b0:334:a23e:6caa with SMTP id
 85-20020a810658000000b00334a23e6caamr28318780ywg.283.1661326285004; Wed, 24
 Aug 2022 00:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220816130713.28597-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220816130713.28597-1-yuanjilin@cdjrlc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Aug 2022 09:31:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV8iVoNKMKz1A12+P3hbvsJ8xgwKX8-LNTs+85dn2YDEw@mail.gmail.com>
Message-ID: <CAMuHMdV8iVoNKMKz1A12+P3hbvsJ8xgwKX8-LNTs+85dn2YDEw@mail.gmail.com>
Subject: Re: [PATCH] video/fbdev: fix repeated words in comments
To: Jilin Yuan <yuanjilin@cdjrlc.com>
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

Hi Jilin,

On Tue, Aug 16, 2022 at 3:08 PM Jilin Yuan <yuanjilin@cdjrlc.com> wrote:
>  Delete the redundant word 'set'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Thanks for your patch, which is now commit 253cabc01468d6b5 ("fbdev:
ssd1307fb: Fix repeated words in comments") in fbdev/for-next

> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -450,7 +450,7 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
>         if (ret < 0)
>                 return ret;
>
> -       /* Set Set Area Color Mode ON/OFF & Low Power Display Mode */
> +       /* Set Area Color Mode ON/OFF & Low Power Display Mode */
>         if (par->area_color_enable || par->low_power) {
>                 u32 mode;

Given the register being written below is called
SSD1307FB_SET_AREA_COLOR_MODE, I think the original was correct
(hint: the "S" in "Set" was capitalized).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
