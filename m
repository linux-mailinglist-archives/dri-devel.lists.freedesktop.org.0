Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45366224D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0939810E11B;
	Mon,  9 Jan 2023 10:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B9A10E11B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:01:36 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id i20so7337517qtw.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eshgBixf0oY5QW+geWBankTPG5WvD9jfZetbBO0Ldgo=;
 b=7AOyCJ65Iihg1WNhFgIYKQOZDOVkOA5JRq888R1jn7F+9Lj0fqBFm91tTcBVwFbcgO
 Q73cnz6pL6gFJPbCwzRnKWxjKIr3AEpBhFVXP00KeCuls/n8PIbdxhhDJivcctfaW8TK
 pKsarI1yIAD5X/noq/CB04cQCXxA/vT5Smo1CyL3tovIKEzUuQ8ZFvdy+KQo3bsx9JxJ
 dsUKAAIUqgAyBean1qkakfXknjSznLkud3lEM/SBZez4XL+WnLM0dcyDU3lmMUg1CUiM
 YFckDZU1/z3STpwIs9YN40efPbUX/r0iqmZTggWiAKEl2mAkjRcVOvh6lXR1zlijSsbx
 r/0g==
X-Gm-Message-State: AFqh2kptg3/El7I/lHg/C/FYbO9bBJeiVJkI1FVNd7js8i3RKvszdcSC
 VYA7dB8A6wEyLCh6N7fIV/DCBanrvk1KkQ==
X-Google-Smtp-Source: AMrXdXvnzgZLCTtIgQIty3deQSDOr+mUnCmvWLdEvzlOrika6Z3hhHShJAvAyrxIgPGOxc4d3+f/zw==
X-Received: by 2002:ac8:1345:0:b0:3a7:eb01:5ddf with SMTP id
 f5-20020ac81345000000b003a7eb015ddfmr83427501qtj.43.1673258495672; 
 Mon, 09 Jan 2023 02:01:35 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05620a408800b006b5cc25535fsm5152571qko.99.2023.01.09.02.01.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 02:01:35 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id l139so7974587ybl.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:01:35 -0800 (PST)
X-Received: by 2002:a25:d103:0:b0:75d:3ecb:1967 with SMTP id
 i3-20020a25d103000000b0075d3ecb1967mr5480772ybg.604.1673258494966; Mon, 09
 Jan 2023 02:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20230105094039.1474255-1-xurui@kylinos.cn>
In-Reply-To: <20230105094039.1474255-1-xurui@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Jan 2023 11:01:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX174erGgrCUBv2WdX67H=mig-hi=SOdeMJ=0__thC_fw@mail.gmail.com>
Message-ID: <CAMuHMdX174erGgrCUBv2WdX67H=mig-hi=SOdeMJ=0__thC_fw@mail.gmail.com>
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
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 linux-fbdev@vger.kernel.org, trivial@kernel.org, deller@gmx.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xurui,

On Thu, Jan 5, 2023 at 10:45 AM xurui <xurui@kylinos.cn> wrote:
> drivers/video/fbdev/g364fb.c:202:4: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>
> Signed-off-by: xurui <xurui@kylinos.cn>

Thanks for your patch!

> --- a/drivers/video/fbdev/g364fb.c
> +++ b/drivers/video/fbdev/g364fb.c
> @@ -175,7 +175,8 @@ int __init g364fb_init(void)
>  {
>         volatile unsigned int *curs_pal_ptr =
>             (volatile unsigned int *) CURS_PAL_REG;
> -       int mem, i;
> +       int mem;
> +       uintptr_t i;

This doesn't look like the right fix to me.

The line the compiler[1] complains about is:

                *(unsigned short *) (CURS_PAT_REG + i * 8) = 0;

Interestingly, it doesn't complain about:

        *(unsigned short *) (CURS_PAT_REG + 14 * 64) = 0xffff;

This driver uses raw memory writes to write to hardware registers.
Probably it should use writel() instead.

[1] mips64-linux-gnuabi64-gcc version 10.3.0 (Ubuntu 10.3.0-1ubuntu1)
    jazz_defconfig + CONFIG_64BIT=y

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
