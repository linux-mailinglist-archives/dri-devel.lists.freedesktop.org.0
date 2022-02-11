Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C284B2590
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D286010EA80;
	Fri, 11 Feb 2022 12:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4107E10EA80
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:24:08 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id i26so6408261vso.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sjk1d99Bi6DMu1w/ZtC6Jgj+o43T7072qer7CkYT+IA=;
 b=RBETblSqoHDu8Vb//fTrkKVmOzGGW3zO0FT5rdnG/GwYgh8udx8DqWlftSS8WU3tKu
 1TSj66FiSyTI3FYY1ZoTj+1m+5MWhOStsbwINbjVTjTQPMEeqdE+u6j+OOZQOaBccA/g
 xgtY4Q0IfYLeB5Ji5RpTUTwcUhMkN+NPBohrgcwlWvTkdlj/rV6hu8jo12CqZVKpLlvW
 dGa3s553hMKWTh+KKibkEPSyUB7r5oBSUN6shy2C0wWk9VwrJhNBAYFQpYVpGlWxFg7u
 baIMBKqRzxD785ITrDiC1YNQHgqBIzFBK0Qfn25YpYm7JjwRyIGF/yrD32bpnQK96OIE
 yVMQ==
X-Gm-Message-State: AOAM533aQiBbyZOiV4KLBXg27PAek+jkcc+d+IR4PvzkKGaEAzbiYJCZ
 lq+nti1umYybvZC9xJlBRMq2aldfX7fkEg==
X-Google-Smtp-Source: ABdhPJxxAEBwPTARRF3T0APUtWFW9HmMjpUh5C7VNKPKnX1pFf40V+w5chyRfJMRNE+aA1Ep/7zlsA==
X-Received: by 2002:a67:fa50:: with SMTP id j16mr377887vsq.52.1644582247221;
 Fri, 11 Feb 2022 04:24:07 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id q6sm4280079vkd.50.2022.02.11.04.24.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 04:24:06 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id v5so4608536uam.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:24:05 -0800 (PST)
X-Received: by 2002:ab0:384c:: with SMTP id h12mr396518uaw.122.1644582245661; 
 Fri, 11 Feb 2022 04:24:05 -0800 (PST)
MIME-Version: 1.0
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-4-javierm@redhat.com>
 <YgZJpi4llqr93U9Y@smile.fi.intel.com>
 <eed8200c-7716-ce4f-dac5-bd6f0345b631@redhat.com>
In-Reply-To: <eed8200c-7716-ce4f-dac5-bd6f0345b631@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Feb 2022 13:23:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLmUwgCWui4OiZqvqpVWzA-d9QhjZLa_idgC19XeEEjA@mail.gmail.com>
Message-ID: <CAMuHMdVLmUwgCWui4OiZqvqpVWzA-d9QhjZLa_idgC19XeEEjA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] drm: Add driver for Solomon SSD130x OLED displays
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
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Feb 11, 2022 at 1:06 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 2/11/22 12:33, Andy Shevchenko wrote:
> > On Fri, Feb 11, 2022 at 10:19:24AM +0100, Javier Martinez Canillas wrote:
> >> This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
> >> OLED display controllers.
> >>
> >> It's only the core part of the driver and a bus specific driver is needed
> >> for each transport interface supported by the display controllers.

> >> +    bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
> >> +                                        &ssd130xfb_bl_ops, NULL);
> >> +    if (IS_ERR(bl)) {
> >
> >> +            ret = PTR_ERR(bl);
> >> +            dev_err_probe(dev, ret, "Unable to register backlight device\n");
> >> +            return ERR_PTR(ret);
> >
> >               dev_err_probe(dev, PTR_ERR(bl), "Unable to register backlight device\n");
> >               return bl;
> >
> > ?
>
> No, because this function's return value is a struct ssd130x_device pointer,
> not a struct backlight_device pointer.

Hence

    return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
                                 "Unable to register backlight device\n"));

?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
