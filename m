Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3992A4AF148
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBA610E31C;
	Wed,  9 Feb 2022 12:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E685110E31C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:19:13 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id j21so2323074vsg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 04:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gm3cukjz1mz6yI7/iDNj2u6cqTBPO6YHmLIpXAkxQ1U=;
 b=rg8iBE0HfYb9WtgtVwVzQfm88NHrZEfPqw61+4AxlO3+zcQCnwXXtEveJcZQByzX0S
 FgDnL8JiAu1jijg1Ibbki2R43ekanxWXPkCxDrWKOW8ntLON0Yvho6jjQzR4Zb/vzylQ
 Ovy0PW7VzOJSYcffCOYnLJywJrHHHKZtMGmx1/3ebNqVpYGRSJv2nagyw01QjjMbaMJk
 ErFqHf+yFQw+j/WaAFAg/ByWn3QJ8rLEkV1YssbIMhcSnA0Ya7DwXdvQE/UIXXbJnYaj
 ZWstoIBtvXyT8VsJ+GHgUN7xAYrJp9JR301x+voF+zudYOzw6E/l0N+AKUu9G4Y2Av6K
 pMKQ==
X-Gm-Message-State: AOAM531TJSa2T+kvi++XfIG7IBwd15uYwTf0DkDMwKRpF4llqQjiKzXY
 NXtbt+vpjs0KCmV+v/JNjNULKjKCawtolg==
X-Google-Smtp-Source: ABdhPJzoN+vXEJKj7XScssclgyuSDMRbD/XJs4B1QFAv6IeANERUmb2TxJ91pKZYwvbtJB3PiprZqQ==
X-Received: by 2002:a05:6102:22d1:: with SMTP id
 a17mr556769vsh.42.1644409152494; 
 Wed, 09 Feb 2022 04:19:12 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id n20sm72459vsq.8.2022.02.09.04.19.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 04:19:12 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id e18so1239969vsq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 04:19:12 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr600764vsj.5.1644409151869;
 Wed, 09 Feb 2022 04:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20220209090314.2511959-1-javierm@redhat.com>
In-Reply-To: <20220209090314.2511959-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Feb 2022 13:19:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVs750iE=kP1vabwgsGOb8sHc8aC5k=HwCU32CURnYktw@mail.gmail.com>
Message-ID: <CAMuHMdVs750iE=kP1vabwgsGOb8sHc8aC5k=HwCU32CURnYktw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm: Add driver for Solomon SSD130X OLED displays
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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

On Wed, Feb 9, 2022 at 10:03 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.

[...]

> - Fix a bug when doing partial updates (Geert Uytterhoeven)

Thanks, the text console is now more or less working as expected.
There is still an issue with the cursor, though.
After doing "echo hello > /dev/tty0", the text appears, but the cursor
is gone. "clear > /dev/tty0" brings it back.

The execution time of "time ls" has improved. It now takes 1.21s
(0.86s with ssd1306fb).

The logo is not shown, even when I create a 16-color or 224-color
version of the small monochrome logo I'm using.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
