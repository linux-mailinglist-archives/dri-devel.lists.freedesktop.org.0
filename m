Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92024AF154
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55BC10E3EC;
	Wed,  9 Feb 2022 12:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C8210E3FF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:21:20 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id r20so2407025vsn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 04:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qpoc5vmMmNDH+SrdCpaRcSXbVfsZOqQW8hec7Ijd/W8=;
 b=a/jgZWxzc933hcatygoFWs7KWlqaQ763X9d1xfsVK8xno7y+VUWH01Fq0aun1ktA5G
 4R1GibDVvrefz9+yc2EZDPtJI56AfFzSSoYncG/JFeYQ4g8ycn9Vf9qESdFujUNYBC4Z
 a8HHvmQATR/UuKGYmpmjgITwLulIzytN7bCmANPlsfwihnPDpuLINo3ST9qjIEutHzia
 4rNaajsK6797YGFRtsRHB4GvIyhp4vbBjEIuTCTRlt7GNwBuh3TkAnqtvIkN3bfNgkPi
 hY2lnSsLA3UAuNfDahSGbYqF9HFP75dpDmdLrBVh9nvvDoDaHprs6OYTCzJ5DFuuUoHZ
 1+vQ==
X-Gm-Message-State: AOAM530MzfKi/09pICWyvL+q8qs6hj7uP2vfOau+9QWENns2jrkpi5cb
 CBDWqVqC8clCng6gBiy74oM3o8waDGKnhg==
X-Google-Smtp-Source: ABdhPJzy3wyNzKURoCUiestB26bXishL78UwUc8W7hNrJMGD2GgdkUE2I5viR75BViWA1CMPAGG8Ag==
X-Received: by 2002:a05:6102:3a57:: with SMTP id
 c23mr561146vsu.50.1644409279522; 
 Wed, 09 Feb 2022 04:21:19 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id z142sm3265324vkd.22.2022.02.09.04.21.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 04:21:19 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id v6so2292406vsp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 04:21:19 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr553685vse.38.1644409278954;
 Wed, 09 Feb 2022 04:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-5-javierm@redhat.com>
In-Reply-To: <20220209090314.2511959-5-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Feb 2022 13:21:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOfz94gD+SpGRS7HazxA_PN3n2D=Q04CPm-eEMb_CkEw@mail.gmail.com>
Message-ID: <CAMuHMdXOfz94gD+SpGRS7HazxA_PN3n2D=Q04CPm-eEMb_CkEw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drm/solomon: Add SSD130X OLED displays I2C support
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
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Wed, Feb 9, 2022 at 10:03 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The ssd130x driver only provides the core support for these devices but it
> does not have any bus transport logic. Add a driver to interface over I2C.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c

> +static const struct of_device_id ssd130x_of_match[] = {
> +       {
> +               .compatible = "solomon,ssd1305fb-i2c",
> +               .data = (void *)&ssd130x_ssd1305_deviceinfo,

The casts are not needed.

> +       },
> +       {
> +               .compatible = "solomon,ssd1306fb-i2c",
> +               .data = (void *)&ssd130x_ssd1306_deviceinfo,
> +       },
> +       {
> +               .compatible = "solomon,ssd1307fb-i2c",
> +               .data = (void *)&ssd130x_ssd1307_deviceinfo,
> +       },
> +       {
> +               .compatible = "solomon,ssd1309fb-i2c",
> +               .data = (void *)&ssd130x_ssd1309_deviceinfo,
> +       },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ssd130x_of_match);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
