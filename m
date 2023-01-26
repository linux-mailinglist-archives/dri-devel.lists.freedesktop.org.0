Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C2167C62E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 09:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3651910E05A;
	Thu, 26 Jan 2023 08:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0BD10E05A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 08:47:10 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id m12so983331qvt.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 00:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uyvIiOs8TFT5QdDt56s5AZud5rN36NlIHxnKx2RxH+M=;
 b=enww/jgyF6AdIvOFZtdLR05M8JL/9YTc5ATMxUVIsUDRZs1jsElSZ9UkSp5VZLBgc5
 gpE+GoeAGSRQF8fJoIp401cYTdJFKiwk3nQXedywDWwVdpTvUSVycKr0NqCKuwKRKmEs
 jCfzXK1ymcpG+GyUbJbK///phhgZYr8zObeM6hYxZllvH4fN+1ox4hMeOXTcfdjoOBkH
 DQkFc74VRkmOJwmDqaiuZlqeu7bGSHCCgZUV0Nto0aYKPbrjhILL62cfeLuE5GuSAEGJ
 2JHbG5ciWOrnLlZFFYXvJn0ZOXPFlefeI8Fx9wSYjEkfyRHyMiG6xqFNGAAqGaWWaFXp
 D4cg==
X-Gm-Message-State: AO0yUKUeet+lRwi74fg8M8gwkJs/VDCtS6bM4W/HgL0qbDf6Okhikbag
 tGc7Qg8MCeIqxsL0AlPxkYVjptr6A8PVTg==
X-Google-Smtp-Source: AK7set96xcFAiLHGXH/fK3sDoGl23ddhAPPrS8/vWqCIOWcUJ3NzlgArlCtN2jwATjbUbNJ9JOL/YQ==
X-Received: by 2002:a05:6214:da2:b0:537:65bb:b273 with SMTP id
 h2-20020a0562140da200b0053765bbb273mr20546845qvh.44.1674722829303; 
 Thu, 26 Jan 2023 00:47:09 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05620a080600b006faf76e7c9asm539033qks.115.2023.01.26.00.47.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 00:47:08 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-4a263c4ddbaso14949837b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 00:47:07 -0800 (PST)
X-Received: by 2002:a0d:f281:0:b0:508:2f2c:8e5f with SMTP id
 b123-20020a0df281000000b005082f2c8e5fmr253434ywf.384.1674722827384; Thu, 26
 Jan 2023 00:47:07 -0800 (PST)
MIME-Version: 1.0
References: <IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com>
In-Reply-To: <IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2023 09:46:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbW7jmO-Q8=f1HicPNzxb70TPE57akkDCcqvrS=gA9Hg@mail.gmail.com>
Message-ID: <CAMuHMdVbW7jmO-Q8=f1HicPNzxb70TPE57akkDCcqvrS=gA9Hg@mail.gmail.com>
Subject: Re: UBSAN: shift-out-of-bounds in fbcon_set_font
To: Sanan Hasanov <sanan.hasanov@knights.ucf.edu>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
 "deller@gmx.de" <deller@gmx.de>, "contact@pgazz.com" <contact@pgazz.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "samuel.thibault@ens-lyon.org" <samuel.thibault@ens-lyon.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sanan,

On Thu, Jan 26, 2023 at 12:58 AM Sanan Hasanov
<sanan.hasanov@knights.ucf.edu> wrote:
> We found a bug using a modified kernel configuration file used by syzbot.
>
> We enhanced the coverage of the configuration file using our tool, klocalizer.
>
> Kernel Branch: 6.2.0-rc5-next-20230124
> Kernel config: https://drive.google.com/file/d/1F-LszDAizEEH0ZX0HcSR06v5q8FPl2Uv/view?usp=sharing
> Reproducer: https://drive.google.com/file/d/1mP1jcLBY7vWCNM60OMf-ogw-urQRjNrm/view?usp=sharing
>
> Thank you!
>
> Best regards,
> Sanan Hasanov
>
> ================================================================================
> UBSAN: shift-out-of-bounds in drivers/video/fbdev/core/fbcon.c:2489:33
> shift exponent 35 is too large for 32-bit type 'int'

This looks valid to me: con_font_set() checks the font width and height
against max_font_width (64) and max_font_height (128), but fbcon has
stricter limits.

fbcon_set_font() should reject fonts with width > 32 or height > 32.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
