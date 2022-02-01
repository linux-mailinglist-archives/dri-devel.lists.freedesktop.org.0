Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F14A5DEC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 15:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD8910E52D;
	Tue,  1 Feb 2022 14:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F66910E52D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 14:05:31 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id l14so9296885vko.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 06:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tSPo3aBmqMYxhq4BWMLe/VmrA5tIsKRk8/D0WbRUEX0=;
 b=EmSBmjS4l4dHt4wEt0yXbASXL9nvN80e1G0bLuFS892DeFkuy9BqPrxFnNezmZLsMj
 jcUnBSTaMiDSEU8m8Qida3UGG/GIDL259pS/o5DIYNCFg5bD2ZqMVehu+hj00r6xuRSa
 kbU+oL2+5vEzhmFySxlF7XGFdqD4FwJ/5ToVUqDLKqrXQ/YNeHrMYWnTwpyfcKZ+EX0a
 L6JjdyZ/qHPBSrnXc1SMjpAX+UqCXD46bcnUB+kIHEz4rd1htYnFZHSR4pH8PRTNtKO0
 wReT1DEl9eJ8qAPbXmORCmr48JAzLB1V8sf18jcne5ymQNE3rUS34QhtZaDYR6GTZTK3
 Wz1A==
X-Gm-Message-State: AOAM531MTA0lY/IeFx++BCZPkG9DKQ3EAhT/TrY5JAzk2zHlKOQ/DZXz
 mj3Zd+St+X9fmo39HkhQQ8n+lOVYDX3WWQ==
X-Google-Smtp-Source: ABdhPJwSoABM84WyqLYXdwRfQiNmBlqTtifjGbbxaPCwHZlASvgzBTyF4CokV8oU2owGFRFOkjITYw==
X-Received: by 2002:a05:6122:9a8:: with SMTP id
 g40mr10243793vkd.15.1643724330414; 
 Tue, 01 Feb 2022 06:05:30 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id q4sm4849934vke.15.2022.02.01.06.05.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:05:30 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id az20so16187419vsb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 06:05:29 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr10246425vsj.5.1643724329652; 
 Tue, 01 Feb 2022 06:05:29 -0800 (PST)
MIME-Version: 1.0
References: <20220131202916.2374502-1-javierm@redhat.com>
 <cc093cd5-fba1-5d84-5894-81a6e1d039ff@suse.de>
 <73dbc5c7-b9e2-a260-49a6-0b96f342391e@redhat.com>
In-Reply-To: <73dbc5c7-b9e2-a260-49a6-0b96f342391e@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 15:05:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJpoG=XChpqNotfEDrWCxFUqyhjW2JW1ckAyKcWXvAUw@mail.gmail.com>
Message-ID: <CAMuHMdUJpoG=XChpqNotfEDrWCxFUqyhjW2JW1ckAyKcWXvAUw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Javier Martinez Canillas <javierm@redhat.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Feb 1, 2022 at 2:02 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 2/1/22 10:33, Thomas Zimmermann wrote:
> >> +{
> >> +    u8 col_end = col_start + cols - 1;
> >> +    int ret;
> >> +
> >> +    if (col_start == ssd1307->col_start && col_end == ssd1307->col_end)
> >> +            return 0;
> >> +
> >> +    ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_COL_RANGE);
> >> +    if (ret < 0)
> >> +            return ret;
> >> +
> >> +    ret = ssd1307_write_cmd(ssd1307->client, col_start);
> >> +    if (ret < 0)
> >> +            return ret;
> >> +
> >> +    ret = ssd1307_write_cmd(ssd1307->client, col_end);
> >> +    if (ret < 0)
> >> +            return ret;
> >
> > Can you write these cmds in one step, such as setting up an array and
> > sending it with ssd1307_write_array?
>
> I don't think so because the commands are different. But I'll check the
> ssd1306 datasheet again to confirma that's the case.

IIRC, I tried that while working on the optimizations for ssd1307fb,
and it didn't work.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
