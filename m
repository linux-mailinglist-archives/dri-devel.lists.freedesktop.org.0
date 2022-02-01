Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BFA4A5882
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 09:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9411510E392;
	Tue,  1 Feb 2022 08:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DD410E3DF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 08:27:13 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id x13so15108416vsl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 00:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SL60kCkTHbJ0ciU93JjSYQJvykyB9X+JDddxZwvjxkc=;
 b=52Hnx1UzSIL8kzrlOY4BGvYrp2zNXuZHCOKcNGu00bfcuxg7SuRj7huC/MQaeQIfyc
 QxdEztvZ6oSbeOPSgKo6FOWDf2sQqQUO6b45JUYGpn3xuatgQkJ7csSCPgUzv6y3chcR
 bQIWXi/R7KvDumFC7NUvEGYQfmrz1XM8K3eJLLfLBfxpIxLqNh4HC9Mg9pAGp5fiqkJR
 +BaF3u5x6WpNSbGJFsj/OBHqTAMu39qV8dtqSrnU9a0DC9jZhh5ZODZBcmDKyezHkzqU
 yTy601CkmBfIuZ7GZDdMH2VQ8j0UajI6SVPdsDiRosRjpQmhQBODUNN0QimXOfG3fl3C
 owIw==
X-Gm-Message-State: AOAM530Dap/N2tlXazoEqWAUFnXRr1mdsmdK6YdkyzE0fwpOrV1VW6F/
 6hoEidD5OCUsxuBr7uVRq11Ay+LIVQBiLQ==
X-Google-Smtp-Source: ABdhPJyaTAF/kh/zwf7qX3xKdD8Hln6+fce3ZqBIHSHgP5UkqymvFgZGwt/BP34ENxD3vV0SZewb1A==
X-Received: by 2002:a67:6144:: with SMTP id v65mr9405033vsb.34.1643704032071; 
 Tue, 01 Feb 2022 00:27:12 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id j17sm3995971vke.52.2022.02.01.00.27.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 00:27:11 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id m90so13447325uam.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 00:27:11 -0800 (PST)
X-Received: by 2002:a9f:3b19:: with SMTP id i25mr10161571uah.14.1643704030886; 
 Tue, 01 Feb 2022 00:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
In-Reply-To: <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 09:26:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
Message-ID: <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Simon Ser <contact@emersion.fr>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 9:39 PM Simon Ser <contact@emersion.fr> wrote:
> On Monday, January 31st, 2022 at 21:36, Simon Ser <contact@emersion.fr> wrote:
>
> > This driver only advertises XRGB8888 in ssd1307_formats. It would be nice to
> > expose R8 as well so that user-space can directly produce suitable buffers.
> > It would also be nice to have some kind of preferred format, so that user-space
> > knows R8 is preferred over XRGB8888.
>
> Hm, since the format used by the hw is actually R1, adding that to drm_fourcc.h
> would be even better.

What's the story with the Rn formats?
The comments say "n bpp Red", while this is a monochrome (even
inverted) display?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
