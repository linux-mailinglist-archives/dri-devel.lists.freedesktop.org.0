Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446154A58B7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 09:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D120B10E4BC;
	Tue,  1 Feb 2022 08:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC0510E4BC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 08:44:03 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id l196so9967827vki.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 00:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=raT8Y/Y+3uKWPsdtZjNjvpSo+gn1Wm+Os229uVdckR0=;
 b=MVRUaA53X+NyjHurfAZAJXvmQLHc135nEZMN2hljtgdoAYjAxS4SxYCSNgSeHgRES3
 uaDwE1YnUCEZFR8PC/FiSPrHg3eTzDl8vcbMtiE1UocpIZ342MK3TaZR57Mwmp6uKrMN
 e4Z6g0kdp+PXijLGMia6tygXSd85QWdZGK/phbDDKZ7Gg6GFZD/MFaBJXyG8PMiSXfJm
 Ki4D/XoNbCwLztM61JrFDXdUBRPary1X0XQTUWhCJq6GPBuN3dCQvxaLKLwxBBq7ABhT
 1HD0H3uOkgIEfmR2DB6eXLNZqfxw1Ovpgm0E2jlR2O5tgq2XZS5jUUwTxN7/bJ9Or40J
 IBtQ==
X-Gm-Message-State: AOAM5327mWhy4CFxwY2ATu66eym0afp9/J+hWhw1Es6i1h8O92NRK0kJ
 BF1lGEef/Xliyc3Gi2QlfUQ8i6SGp5e6TQ==
X-Google-Smtp-Source: ABdhPJy35D1NIrjA45GuSu2KU1n7O3Q6Zi84vtYGaBVXqi1uaDICBR6GXdUb1ApZ3RMiNxvT0ufzWQ==
X-Received: by 2002:a05:6122:d0b:: with SMTP id
 az11mr9757681vkb.41.1643705042202; 
 Tue, 01 Feb 2022 00:44:02 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id d19sm3855668vsh.18.2022.02.01.00.44.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 00:44:01 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id j185so9995440vkc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 00:44:01 -0800 (PST)
X-Received: by 2002:a1f:5d84:: with SMTP id r126mr9423475vkb.33.1643705041310; 
 Tue, 01 Feb 2022 00:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20220131201225.2324984-1-javierm@redhat.com>
In-Reply-To: <20220131201225.2324984-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 09:43:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMayLLRavAJJujmPqT+Vd11dPfycqXie3w_pOkS8i9eA@mail.gmail.com>
Message-ID: <CAMuHMdXMayLLRavAJJujmPqT+Vd11dPfycqXie3w_pOkS8i9eA@mail.gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Jan 31, 2022 at 9:12 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.

Thanks for your series!

I'll give it a try on an Adafruit FeatherWing 128x32 OLED, connected
to an OrangeCrab ECP5 FPGA board running a 64 MHz VexRiscv RISC-V
softcore.

> Using the DRM fb emulation, all the tests from Geert Uytterhoeven's fbtest
> (https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git) passes:
>
>      ./fbtest -f /dev/fb1
>     Using drawops cfb32 (32 bpp packed pixels)
>     Available visuals:
>       Monochrome
>       Grayscale 256
>       Truecolor 8:8:8:0

Oh, fake 32-bpp truecolor ;-)

Does it run modetest, too?

I'm trying to get modetest working on my atari DRM driver.
Comparing to the cirrus driver doesn't help much, as modetest doesn't
seem to work with the cirrus driver (modified to not do hardware
access, as I don't have cirrus hardware):

    # modetest -M cirrus -s 31:1024x768-60Hz
    setting mode 1024x768-60.00Hz on connectors 31, crtc 34
    failed to set gamma: Function not implemented

Does there exist another simple test program for showing something
using the DRM API?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
