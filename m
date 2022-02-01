Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D1E4A5B52
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9979210E631;
	Tue,  1 Feb 2022 11:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657AC10E316
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:39:07 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id v62so15665172vsv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 03:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mA8XYa2O0+UEsBGkXuHhOFnWvI6ZRmcsG3sID3xO/+M=;
 b=X7uJUe7xI/J93w2nG99BS1Qeczo1OBZbVQT8I01uzmhJks9l4Tz0fAOMd70zMt5HVy
 lZ1wJjIYqZBnnnmWtLKIgn2bd6ZpN69gYByn2nh7nDqMz+PXgKapq5mv4WAgK1pTqp4u
 1H0kvm6hMQWmulUBEhpsEZmpTuWBzJ/hqxeupS0DQ2iNtdyRHRFKz6xzpsJbSAsa7uQQ
 uavUbn81UXdpPa2OJ9GktRONe8E42/k/r1UCCtRV6d+19ear9cuE8mLtsNkJsQZmzgEm
 vOxruKy8a6Zp7obOmuTQjQdz8v/AsOPr+50GXXWSRNHBKolwSAXTvk//UOVjT+OlJD25
 KgjA==
X-Gm-Message-State: AOAM531rpS8OStBpe7ZIqxF1+z6X+OHjzskFa7sJYacwtcno6HJw2+dK
 RuxZs1xJMVkBhR+HsZEL0QYFi9TjU37MJILu
X-Google-Smtp-Source: ABdhPJxQUK+Shb2Z6fMJeUiU2D1KUAGhYWoMvlLUO+sGigQJQyopEYsWSc4OemVPqi6mttS68bXS4w==
X-Received: by 2002:a05:6102:3f07:: with SMTP id
 k7mr9958717vsv.13.1643715546431; 
 Tue, 01 Feb 2022 03:39:06 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179])
 by smtp.gmail.com with ESMTPSA id d74sm4701551vkf.1.2022.02.01.03.39.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:39:05 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id n14so10199981vkk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 03:39:04 -0800 (PST)
X-Received: by 2002:a1f:b287:: with SMTP id b129mr10219823vkf.20.1643715544741; 
 Tue, 01 Feb 2022 03:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org>
 <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
 <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
In-Reply-To: <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 12:38:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
Message-ID: <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Feb 1, 2022 at 12:31 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 2/1/22 10:37, Andy Shevchenko wrote:
> > On Mon, Jan 31, 2022 at 09:56:23PM +0100, Sam Ravnborg wrote:
> >> On Mon, Jan 31, 2022 at 09:12:20PM +0100, Javier Martinez Canillas wrote:
> >
> > ...
> >
> >>> Patch #3 adds the driver. The name ssd1307 was used instead of ssd130x
> >>> (which would be more accurate) to avoid confusion for users who want to
> >>> migrate from the existing ssd1307fb fbdev driver.
> >> Looking forward the name ssd130x would make more sense. There is only so
> >> many existing users and a potential of much more new users.
> >> So in my color of the world the naming that benefits the most users
> >> wins.
> >
> > It depends if the binding is going to be preserved. Also this series doesn't
> > answer to the question what to do with the old driver.
> >
>
> I don't plan to remove the old driver (yet). My goal here is to have an answer
> for Fedora users that might complain that we disabled all the fbdev drivers.
>
> So I wanted to understand the effort involved in porting a fbdev driver to DRM.
>
> > If you leave it, I would expect the backward compatibility, otherwise the
> > series misses removal of the old driver.
> >
>
> I don't see how those two are correlated. You just need different compatible
> strings to match the new and old drivers. That what was usually done for DRM
> drivers that were ported. To give an example, the "omapfb" vs "omapdrm".
>
> Since the current binding has a compatible "ssd1305fb-i2c", we could make the
> new one "ssd1305drm-i2c" or better, just "ssd1305-i2c".

DT describes hardware, not software policy.
If the hardware is the same, the DT bindings should stay the same.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
