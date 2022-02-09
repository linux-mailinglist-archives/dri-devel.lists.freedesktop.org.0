Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B544AF175
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2272B10E32A;
	Wed,  9 Feb 2022 12:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225E210E286
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:26:00 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id b2so2320477vso.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 04:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G5WVmydqJCvKG/B3ZDDRDsVd5anO+fEWBRVMVdA65vE=;
 b=muI1TfU+js7kB4QoGR2zMlaG6URlkuZrf0MiQMPdQGjlHQ7a3anwZe6Hxh0Mkmsu0p
 +WWV+u4ka8YmLhrmdyO1xUb2ZGlUpwmJwItuQrZLIaz7NbLRx95loVmpRC7KnkzYCkfd
 BwrNz9iDn5QHsGg0+fRLsvf7ozmozb32iNtS97hpJcAdz/aYed14u/2OeSBzNpaYBCip
 ZHaMaHd8sJVmbt5DkHYIgVUdOsrkPQLvecyYK5o0IOJTLdgAOK8YebcjCYMDjorcSvAK
 CoQb6/SxcmlBWw8eKW+24nnIr9uz3IpkrpnXBMbdY2pi++5UIbwvn5ck/9D0PSAJKqNh
 vRig==
X-Gm-Message-State: AOAM532K8UWhBgLUkST4jq/IXDr69t5DelTQnSEU8r3VEttjI6Q9bsJX
 PxmVgp4nk1igy2RDaGd6HtOLbRY7pR6rTA==
X-Google-Smtp-Source: ABdhPJwh1Wc/psq3F0haoTQ9fB7YJQor5tys3ctHN4CEREnPH65fv1OPC/uBAgDvfVqlsLXAx2ju7A==
X-Received: by 2002:a67:ab43:: with SMTP id k3mr561418vsh.60.1644409558916;
 Wed, 09 Feb 2022 04:25:58 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178])
 by smtp.gmail.com with ESMTPSA id 22sm3696326vkj.36.2022.02.09.04.25.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 04:25:58 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id z15so1022863vkp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 04:25:58 -0800 (PST)
X-Received: by 2002:a1f:294c:: with SMTP id p73mr691592vkp.0.1644409557884;
 Wed, 09 Feb 2022 04:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
In-Reply-To: <20220209091204.2513437-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Feb 2022 13:25:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
Message-ID: <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
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
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Wed, Feb 9, 2022 at 10:12 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The ssd130x driver only provides the core support for these devices but it
> does not have any bus transport logic. Add a driver to interface over SPI.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/solomon/ssd130x-spi.c

> +static const struct of_device_id ssd130x_of_match[] = {
> +       {
> +               .compatible = "solomon,ssd1305fb-spi",

This needs an update to the DT bindings.
Hence this may be a good time to deprecate the existing
"solomon,ssd130*fb-i2c" compatible values, and switch to
"solomon,ssd130*fb" instead, for both I2C and SPI.
Of course the I2C subdriver still has to bind against the old values,
too, for backwards compatibility.

> +               .data = (void *)&ssd130x_ssd1305_deviceinfo,

The casts are not needed.

> +       },
> +       {
> +               .compatible = "solomon,ssd1306fb-spi",
> +               .data = (void *)&ssd130x_ssd1306_deviceinfo,
> +       },
> +       {
> +               .compatible = "solomon,ssd1307fb-spi",
> +               .data = (void *)&ssd130x_ssd1307_deviceinfo,
> +       },
> +       {
> +               .compatible = "solomon,ssd1309fb-spi",
> +               .data = (void *)&ssd130x_ssd1309_deviceinfo,
> +       },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ssd130x_of_match);
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
