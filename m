Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735BD4FD29B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8A910E7E3;
	Tue, 12 Apr 2022 07:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECB910E7E3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:23:52 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id t2so18424584qtw.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h09al9GPNRGrgzoVRTG5PYUk3CouyOtKbjw7IpJLnEw=;
 b=t+tP1C4k0ZZ9JuxoXlVxe1DDS2TTgX/857+/u2z/ZEeqwqR+2JraVgc0ovV7XGwKKQ
 FqcWv4tOAYf1ZJm87l8gHL+hTP1zaliQSBrW5Yu7lO1hnBLfYXNJKikPUnSOHeohShcm
 /cyTXKuSyrNz34dTMiFaZtHWLfCNj4oRHbfNtcuFCmOk5qG2p2fNVCjb0uCnHFHxVaFc
 Yh2JLIDO6Nb1z0/zLVjYx0dxRdv9CPsTdLaT9uwbIZhWVgdfepZf9+bpJSf7hGPww8/F
 b5OUcz6ucigwTtyrTMLH5Y+CLuqaOV4imIUqDSwD1Aa8DW/+7excGCy9P4XW/W76vCJC
 Jhnw==
X-Gm-Message-State: AOAM530whyFwMypfLJO/N2au3NZ7uvFIuxf5HKh+9qt93K+5r4yKNBkB
 xvnziAxHReqOFMiv7YgBupNqdc5wbEss0FGE
X-Google-Smtp-Source: ABdhPJy+bJAbYcKRV9BtpAJWezOBXPN9dbkXPi5xJjBHJMb68cgDRgHKGv6/yxbdGUZt1HCg5LPAxg==
X-Received: by 2002:ac8:66cc:0:b0:2e2:160d:7e06 with SMTP id
 m12-20020ac866cc000000b002e2160d7e06mr2271107qtp.673.1649748230708; 
 Tue, 12 Apr 2022 00:23:50 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 v3-20020a05622a188300b002ec90a0ecc7sm10597700qtc.59.2022.04.12.00.23.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 00:23:50 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id i20so10421061ybj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:23:49 -0700 (PDT)
X-Received: by 2002:a25:29c2:0:b0:641:224f:17d6 with SMTP id
 p185-20020a2529c2000000b00641224f17d6mr10498662ybp.546.1649748229732; Tue, 12
 Apr 2022 00:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-5-javierm@redhat.com>
In-Reply-To: <20220411211243.11121-5-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 09:23:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSsAtRLob5fLoBMNu-DRXJOaBrEHYEwG5iCA03XR5JSw@mail.gmail.com>
Message-ID: <CAMuHMdVSsAtRLob5fLoBMNu-DRXJOaBrEHYEwG5iCA03XR5JSw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

Thanks for your patch!

On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> These are declared in the ssd130x-i2c transport driver but the information
> is not I2C specific, and could be used by other SSD130x transport drivers.
>
> Move them to the ssd130x core driver and just set the OF device entries to
> an ID that could be used to lookup the correct device info from an array.
>
> While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
> bytes. Since even though are used by the I2C interface, it could also be

though they are ... they could

> useful for other transport protocols such as SPI.
>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c

> @@ -860,7 +890,14 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>
>         ssd130x->dev = dev;
>         ssd130x->regmap = regmap;
> -       ssd130x->device_info = device_get_match_data(dev);
> +
> +       variant = (enum ssd130x_variants)device_get_match_data(dev);

(uintptr_t), to avoid a cast from pointer to integer of different
size warning.

> +

Please drop the blank line.

> +       if (variant >= NR_SSD130X_VARIANTS)
> +               return ERR_PTR(dev_err_probe(dev, -EINVAL,
> +                                            "Invalid SSD130x variant\n"));
> +
> +       ssd130x->device_info = &ssd130x_variants[variant];
>
>         if (ssd130x->device_info->page_mode_only)
>                 ssd130x->page_address_mode = 1;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
