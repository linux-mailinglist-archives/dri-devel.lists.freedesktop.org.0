Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FF66226E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8A310E3A5;
	Mon,  9 Jan 2023 10:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E937210E3A3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:04:29 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id h21so7296284qta.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ILt2nHhZG6OAJb7Z4BVZBIlEGFuGgmOKUcbFf2IQt4=;
 b=R594lVMk9/s00dM8KnJKBPrwtnivlqbqSpKsb9TrSWeqLEJHjWWrXW7L7Wkp7YFY+M
 QMUvVaQztTMJ9NmS8h/YVwGcoX2idly4DGvy4qYiyo7uoTvpnt4z6ftFlpTlr1R5bLbR
 fU1BpVBuHZOzu0JLBNQpTNSch7C7WUJjropWl/5NStmkFMbMGSGy8JlolnBeBB6Cp6SB
 yh3r5lM4xQdPwJOQQs/yyCJEI2f0aoWWD9VT0HrTewUmk2LSraC9omTPS+ic2wfyae5S
 DzvrX1qdDTVMWNFEqz4yYJymv21wP88n9NgVe0NVBeg+uly33DxajpFFGvwIK4bSnQmW
 uuww==
X-Gm-Message-State: AFqh2ko2s+BzQEcL67RXpzxCaXKRCC6LONXbk4BYrmKZGj0LBJvoE6DN
 XWDrLP/mntR1kcgURhAPBMNtlW4Bvs74Rg==
X-Google-Smtp-Source: AMrXdXt0qJ/tr3gdA9zDVZKxnqqNUFkDzJYWuqf2efDt4MKiiWSj0Q4UlOPHQIvTaFkoiJEEEjVEHw==
X-Received: by 2002:ac8:6649:0:b0:3a9:87d6:5b86 with SMTP id
 j9-20020ac86649000000b003a987d65b86mr90596888qtp.6.1673258668722; 
 Mon, 09 Jan 2023 02:04:28 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05622a149400b0035d432f5ba3sm4393529qtx.17.2023.01.09.02.04.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 02:04:28 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-4b6255ce5baso105873627b3.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:04:28 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr1566668ywb.47.1673258667893; Mon, 09
 Jan 2023 02:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20230105094039.1474255-1-xurui@kylinos.cn>
 <CAMuHMdX174erGgrCUBv2WdX67H=mig-hi=SOdeMJ=0__thC_fw@mail.gmail.com>
In-Reply-To: <CAMuHMdX174erGgrCUBv2WdX67H=mig-hi=SOdeMJ=0__thC_fw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Jan 2023 11:04:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdCBxZ39BbtLDPeiMK9BK4M0W5hynrYLFx6+ibunyxGw@mail.gmail.com>
Message-ID: <CAMuHMdVdCBxZ39BbtLDPeiMK9BK4M0W5hynrYLFx6+ibunyxGw@mail.gmail.com>
Subject: Re: [PATCH] fbdev/g364fb: Fix a compilation issue
To: xurui <xurui@kylinos.cn>
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
Cc: linux-fbdev@vger.kernel.org, trivial@kernel.org, deller@gmx.de,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This time with the new linux-mips mailing list address...

On Mon, Jan 9, 2023 at 11:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Xurui,
>
> On Thu, Jan 5, 2023 at 10:45 AM xurui <xurui@kylinos.cn> wrote:
> > drivers/video/fbdev/g364fb.c:202:4: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> >
> > Signed-off-by: xurui <xurui@kylinos.cn>
>
> Thanks for your patch!
>
> > --- a/drivers/video/fbdev/g364fb.c
> > +++ b/drivers/video/fbdev/g364fb.c
> > @@ -175,7 +175,8 @@ int __init g364fb_init(void)
> >  {
> >         volatile unsigned int *curs_pal_ptr =
> >             (volatile unsigned int *) CURS_PAL_REG;
> > -       int mem, i;
> > +       int mem;
> > +       uintptr_t i;
>
> This doesn't look like the right fix to me.
>
> The line the compiler[1] complains about is:
>
>                 *(unsigned short *) (CURS_PAT_REG + i * 8) = 0;
>
> Interestingly, it doesn't complain about:
>
>         *(unsigned short *) (CURS_PAT_REG + 14 * 64) = 0xffff;
>
> This driver uses raw memory writes to write to hardware registers.
> Probably it should use writel() instead.
>
> [1] mips64-linux-gnuabi64-gcc version 10.3.0 (Ubuntu 10.3.0-1ubuntu1)
>     jazz_defconfig + CONFIG_64BIT=y
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
