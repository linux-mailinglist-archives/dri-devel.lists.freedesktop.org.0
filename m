Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EB94A5E08
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 15:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B7F10E62F;
	Tue,  1 Feb 2022 14:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D885710E62F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 14:14:30 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id az20so16222814vsb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 06:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6JTo8Sy9jsMuY9se9GPF3GJU4ezrpNEbpV0Rieuvz5M=;
 b=YpqnGFqd9EnG6BM0XHAgB/JlEwAJUGCgmtTfl4fI6JHJIrSG7frUxNAmTOkLnojMeZ
 epSGuuD4taX1lh/GAUuyRWwzZtZAJKpWNpOBp9lVYvb7ycgcUFXWYgHCUzMePs2F9/Un
 gKrYNIlu23rbCFRTgWH0ye+I0L4TeuSCTEvqYsVESSzUOM7w0fPzuzIRZrSulgozdpPF
 L+QKADJy4Oi+d6IUXSAcoqDCpAlC1GpnC8kDrisDOVLmk6thEkcxdzmumj6GxptA5gLz
 PUsVOYY89dEScvrWEBlf631z/xs9oFty+/0PzJzNJMblppjOxI34cjWpww43bYVtJWAl
 Bklw==
X-Gm-Message-State: AOAM531hJiBrjjammZJQDfHpkdJrnbkyMJtGR7QTBopudYglac64AUk6
 ZxU/VBWVd8sY4gypKg4JH+djf2E5uPOs6fcY
X-Google-Smtp-Source: ABdhPJx9sdr0deMibrkybQYXsmeODdHBledqf7RJ42fwHas/mHgnN9OXe8Ny0FIouKHk/eSC3yrvAg==
X-Received: by 2002:a05:6102:3a7a:: with SMTP id
 bf26mr9145133vsb.27.1643724869827; 
 Tue, 01 Feb 2022 06:14:29 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id g25sm4128074vsj.6.2022.02.01.06.14.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:14:29 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id f6so16229130vsa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 06:14:28 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr9456510vsb.68.1643724868281; 
 Tue, 01 Feb 2022 06:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org>
 <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
 <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
 <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
 <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
In-Reply-To: <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 15:14:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwUfv7pXhPazsgG6t=X=aVtDQkFUk_=mUuFH8Fscx8wg@mail.gmail.com>
Message-ID: <CAMuHMdVwUfv7pXhPazsgG6t=X=aVtDQkFUk_=mUuFH8Fscx8wg@mail.gmail.com>
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

On Tue, Feb 1, 2022 at 2:09 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 2/1/22 12:38, Geert Uytterhoeven wrote:
> >> Since the current binding has a compatible "ssd1305fb-i2c", we could make the
> >> new one "ssd1305drm-i2c" or better, just "ssd1305-i2c".
> >
> > DT describes hardware, not software policy.
> > If the hardware is the same, the DT bindings should stay the same.
> >
>
> Yes I know that but the thing is that the current binding don't describe
> the hardware correctly. For instance, don't use a backlight DT node as a
> property of the panel and have this "fb" suffix in the compatible strings.
>
> Having said that, my opinion is that we should just keep with the existing
> bindings and make compatible to that even if isn't completely correct.
>
> Since that will ease adoption of the new DRM driver and allow users to use
> it without the need to update their DTBs.

To me it looks like the pwms property is not related to the backlight
at all, and only needed for some variants?

And the actual backlight code seems to be about internal contrast
adjustment?

So if the pwms usage is OK, what other reasons are there to break
DT compatibility? IMHO just the "fb" suffix is not a good reason.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
