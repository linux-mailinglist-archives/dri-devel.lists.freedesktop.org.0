Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A7C4A9B05
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 15:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44E210E3DA;
	Fri,  4 Feb 2022 14:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11F810E3DA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 14:31:48 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id v5so137989uam.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 06:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVjVsdLr/YeumyNFWKCtu2VuB2Qk2ba3Q9UmWUGtgwc=;
 b=q+JPM0EesgllxiZzI835HlrHFH80/VCgIzJlzGrKcexi94GNEljFgioEK+mQgJZIuM
 f2lL4OEsYWenAkrWBxy6XlJ8KS0flhYoIXNDnaslKIIMafFiNo1Y8V5+2vRGpA9Rr6Vb
 HvfF33nyibh6rXNvfxe1+3whvTm9MyMNbKqa7AnoNxV8j2wVbTBuf9qqJBmyIx89fBE6
 9+4YlyCSpzTxfU1pahNI0pA76T8yyPKflGRtVVcfMR40WK6hI7OOkVhUWncmzFiGtXlV
 MZMtE9U2ZWEciL8GhD0zJG6JnY4sGCjNmF75r4NwRyawVKYQVG1QAF2U6HU59cnS51Ai
 dFmw==
X-Gm-Message-State: AOAM530Eai7BVkLKtJ/jelVbdlnIcurHZMFbQZm99JDyZc422pwFx6Pw
 yvcnsKPuUFteSAidSP/lha1LbgqmAhJefA==
X-Google-Smtp-Source: ABdhPJxLW1Fi+tPbS8uptnAJ818v1NWXdOihVyLgsXt632x+INXbfb8snz+R9CT/867dr79zT3o/PQ==
X-Received: by 2002:ab0:2117:: with SMTP id d23mr1053931ual.28.1643985107704; 
 Fri, 04 Feb 2022 06:31:47 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id z27sm553884vsf.24.2022.02.04.06.31.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 06:31:46 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id b37so11075763uad.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 06:31:46 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr922470vsj.5.1643985106337;
 Fri, 04 Feb 2022 06:31:46 -0800 (PST)
MIME-Version: 1.0
References: <20220204134347.1187749-1-javierm@redhat.com>
In-Reply-To: <20220204134347.1187749-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Feb 2022 15:31:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWoBc8amsg009oQGqUST8bN=8WqPM96SkUzcv=P1uRbfA@mail.gmail.com>
Message-ID: <CAMuHMdWoBc8amsg009oQGqUST8bN=8WqPM96SkUzcv=P1uRbfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
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

On Fri, Feb 4, 2022 at 2:43 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.

[...]

> This is a v2 that addresses all the issues pointed in v1, thanks a lot
> to everyone that gave me feedback and reviews. I tried to not miss any
> comment, but there were a lot so forgive me if something is not there.

Thanks for the update!

> Changes in v2:

[...]

Note that the individual patches say "(no changes since v1)"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
