Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3C4AF427
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404EF10E1D0;
	Wed,  9 Feb 2022 14:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262EB10E1D0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:32:51 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id z1so1919811qto.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 06:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJXDOrB/jL/yycfpf2+OsoUzWbEp18SJyGOgWCPyYcE=;
 b=WeWt8p/yH3Nl+l4m3nHhiwUZLVuJEtezDFDITyYZug4WbMs8wZn73AOhIIObFjeH/t
 5Cr5K9BB2Ul3+N3gfEmo/kXn5PEl2ILrWk2QG/zPWq7WrmyUH0tNFn/HmE1ygRAFKilP
 CX3ng9t+lHNX6WVPNAE16NnwXtzpGRYvZrAeF9koDkvSss5F12lineRtcav243ptzmki
 V2jZOpB2NHhuhVeyxsJMRND8PXIJ6Cf00m4uVOrCjsj/D93X81rcaI53DaSUvvUWVcC3
 6O+m3sni/e9srgp4/1jFQYl/nalFDoJmQTpFCWJTnyD+MBBT/lDcnWQMfGOKIEjXGyKr
 IzGw==
X-Gm-Message-State: AOAM533KTMFiieUOWB85l/GGrBKDQAmCF+CpVvXTP7R0PDzCeVuu0lAK
 4nj7BkgwJi4EEt9y5fA9tr3Os5QwsRUrbg==
X-Google-Smtp-Source: ABdhPJwZp/hLDcunYfMGvrG8repOhEPt1UobpBmETnjaSUYaSQ3lmAi+E+GMfxcs7zg4FdjDrDhCuw==
X-Received: by 2002:ac8:5990:: with SMTP id e16mr1498876qte.373.1644417169772; 
 Wed, 09 Feb 2022 06:32:49 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id bm27sm8079301qkb.5.2022.02.09.06.32.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 06:32:49 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id v186so6527377ybg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 06:32:49 -0800 (PST)
X-Received: by 2002:ab0:384c:: with SMTP id h12mr813487uaw.122.1644416853482; 
 Wed, 09 Feb 2022 06:27:33 -0800 (PST)
MIME-Version: 1.0
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
 <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
 <YgPF1cBMsd9973Dx@smile.fi.intel.com>
In-Reply-To: <YgPF1cBMsd9973Dx@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Feb 2022 15:27:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQdL_Do8Hjay1egfmd9H05R7BjNeKfLGq67mU4bQNVZA@mail.gmail.com>
Message-ID: <CAMuHMdXQdL_Do8Hjay1egfmd9H05R7BjNeKfLGq67mU4bQNVZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Wed, Feb 9, 2022 at 2:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Feb 08, 2022 at 04:10:49PM +0100, Javier Martinez Canillas wrote:
> > On 2/8/22 15:19, Geert Uytterhoeven wrote:
> > > On Fri, Feb 4, 2022 at 2:43 PM Javier Martinez Canillas
> > > <javierm@redhat.com> wrote:
> > >   - Kernel size increased by 349 KiB,
> > >   - The "Memory:" line reports 412 KiB less memory,
> > >   - On top of that, "free" shows ca. 92 KiB more memory in use after
> > >     bootup.
>
> The memory consumption should really be taken seriously, because these kind of
> displays are for embedded platforms with limited amount of resources.

Thanks for your concern!

Looking at the options that are auto-enabled, a few stand out that
look like they're not needed on systems witch such small displays,
or on legacy systems predating DDC:

    menuconfig DRM
            tristate "Direct Rendering Manager (XFree86 4.1.0 and
higher DRI support)"
            depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
            select DRM_NOMODESET
            select DRM_PANEL_ORIENTATION_QUIRKS
            select HDMI

Not everyone pays HDMI royalties ;-)

            select FB_CMDLINE
            select I2C
            select I2C_ALGOBIT

I do need I2C, as it's the transport for my SSD1306 display, but not
everyone needs it.

            select DMA_SHARED_BUFFER
            select SYNC_FILE
    # gallium uses SYS_kcmp for os_same_file_description() to de-duplicate
    # device and dmabuf fd. Let's make sure that is available for our userspace.
            select KCMP

And:

    config DRM_BRIDGE
            def_bool y
            depends on DRM
            help
              Bridge registration and lookup framework.

    config DRM_PANEL_BRIDGE
            def_bool y


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
