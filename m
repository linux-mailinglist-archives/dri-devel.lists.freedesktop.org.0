Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FF74ADC7B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C56810E642;
	Tue,  8 Feb 2022 15:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3206410E642
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 15:23:43 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id 48so10008399vki.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 07:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZ7CP5kqwUe/zKlKUAI4I0ax7qbE+g2pzH6adwlgoSo=;
 b=RKVBYWjwYZ1WvaZwCZ++GPl6x+TghQisVQJmwdTVkxy0QIN42abKpimorEmk1iFaCf
 WSry/bhVGLslSPtVRBLqE7hxOzmB8lkpzl1lgG8JEbvkw5397KXa/KM/jpTyDGHv8HYe
 R6YdYnVZvcmA0X0T7ykgyB5yt6r+uBDfLFEv6SDHCG98uJ+ulql3JLwedMS1zdjJ4qEj
 3ww8BZiAUG/PULFM4WBEpTOAkgpfQxwsCUw13XiERbd+pIBN3d2RfJCehiObX8qhnAhq
 m2sPsd5vR/g59j+KYwgDS02tN6XRZNRKJFKLzPrOprZX5Vt/jhvGFI4McyopCW2xLjI/
 Indw==
X-Gm-Message-State: AOAM531GmAcRYz2Z0bKFwInmYMUDZfMmJP9h8aMoHKbygXTMbljZufr9
 dxktWNvIlL0eSRneZRcyCEXNusrfwIJz5g==
X-Google-Smtp-Source: ABdhPJz4N9UKh24S79QtRvqB/Qi5+sSSM0fUMclPKcovvaWzAJy59G5kGjNDL7sgsRnL2iW0Ra4exQ==
X-Received: by 2002:a1f:fc8f:: with SMTP id a137mr1902389vki.9.1644333821804; 
 Tue, 08 Feb 2022 07:23:41 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id k16sm2875172vsr.8.2022.02.08.07.23.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 07:23:41 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id t10so3757064vsp.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 07:23:41 -0800 (PST)
X-Received: by 2002:a05:6102:34d9:: with SMTP id
 a25mr334951vst.68.1644333820869; 
 Tue, 08 Feb 2022 07:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
 <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
In-Reply-To: <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Feb 2022 16:23:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvrJip+W6ZZoO2ZURLc5CYmFno3=Sa2mL4xJE8gMzFqg@mail.gmail.com>
Message-ID: <CAMuHMdWvrJip+W6ZZoO2ZURLc5CYmFno3=Sa2mL4xJE8gMzFqg@mail.gmail.com>
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
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Feb 8, 2022 at 4:10 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 2/8/22 15:19, Geert Uytterhoeven wrote:
> > On Fri, Feb 4, 2022 at 2:43 PM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
> >> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
> >
> > I gave it a try on an Adafruit FeatherWing 128x32 OLED, connected to an
> > OrangeCrab ECP5 FPGA board running a 64 MHz VexRiscv RISC-V softcore.
> >
> > Findings:
> >   - Kernel size increased by 349 KiB,
> >   - The "Memory:" line reports 412 KiB less memory,
> >   - On top of that, "free" shows ca. 92 KiB more memory in use after
> >     bootup.
> >   - The logo (I have a custom monochrome logo enabled) is no longer shown.
>
> I was able to display your tux monochrome with ./fbtest -f /dev/fb1 test004

I meant the kernel's logo (FB_LOGO_*),. Obviously you need to enable
a smaller one, as the default 80x80 logo is too large, and thus can't
be drawn on your 128x64 or my 128x32 display.

> >   - The screen is empty, with a (very very slow) flashing cursor in the
> >     middle of the screen, with a bogus long line next to it, which I can
> >     see being redrawn.
> >   - Writing text (e.g. hello) to /dev/tty0, I first see the text,
> >     followed by an enlargement of some of the characters.
>
> So far I was mostly testing using your fbtest repo tests and all of them
> (modulo test009 that says "Screen size too small for this test").
>
> But I've tried now using as a VT and I see the same visual artifacts. I
> wonder what's the difference between fbcon and the way your tests use
> the fbdev API.

Fbcon does small writes to the shadow frame buffer, while fbtest
writes to the mmap()ed /dev/fbX, causing a full page to be updated.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
