Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B84ADB0A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 15:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98FC10E192;
	Tue,  8 Feb 2022 14:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2656810E192
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 14:20:12 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id a19so3513862vsi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 06:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWsUC/Af6ywp4UcAlxa6QvBdBkZWz95sQEwSbu3EUOM=;
 b=iaW9vCaO535JVhHGfMYgP2ckLiHiQrPtvoewCnkoMRr+xKgM/HdnEPvV/KUTn9V40g
 d9Jft+k/tKhBqXGRMn8TuacjyjmVR2XBnDRzXWFOtAbi7jmWGkL5yIDh1Ok22O9wOdpM
 uf7LBRmtx+h3fmkV11Tk0wW0R1rYR+7eaO2mwGbnA+lGvSwmsb5D8u1D5t67quhi1RDh
 ZF4UIDyqWy9VgB+AXNHTctYzkXy7wtamarxfzCqwerSJG2m6n7jNQpTs5S5Se+cGM4er
 R85aKARIkQFPGVtGjS/y9UwXIER8IgeQSXmYOBwHOliXH9cEtkNXDQT4BKlJ45dGuUBb
 iAEQ==
X-Gm-Message-State: AOAM532a30C16zi22nPYobL8Ehi3l2zGX0wqQGq7LBgbTRfCz1IiVGpT
 7Ui6ed51lEt6wJngm1Tp7lYKpRwXjXI96A==
X-Google-Smtp-Source: ABdhPJwQV25pFNCdJR4nAqKNOK/XOtyJsMJp/6CNXi459b8E7m1cO6kxr7rGGccXPfIp3gEVxxWtmg==
X-Received: by 2002:a05:6102:31a5:: with SMTP id
 d5mr1474697vsh.69.1644330010425; 
 Tue, 08 Feb 2022 06:20:10 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id x47sm2888387uac.16.2022.02.08.06.20.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 06:20:09 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id t184so3521104vst.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 06:20:09 -0800 (PST)
X-Received: by 2002:a05:6102:34d9:: with SMTP id
 a25mr223540vst.68.1644330009205; 
 Tue, 08 Feb 2022 06:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20220204134347.1187749-1-javierm@redhat.com>
In-Reply-To: <20220204134347.1187749-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Feb 2022 15:19:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
Message-ID: <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
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

I gave it a try on an Adafruit FeatherWing 128x32 OLED, connected to an
OrangeCrab ECP5 FPGA board running a 64 MHz VexRiscv RISC-V softcore.

Findings:
  - Kernel size increased by 349 KiB,
  - The "Memory:" line reports 412 KiB less memory,
  - On top of that, "free" shows ca. 92 KiB more memory in use after
    bootup.
  - The logo (I have a custom monochrome logo enabled) is no longer shown.
  - The screen is empty, with a (very very slow) flashing cursor in the
    middle of the screen, with a bogus long line next to it, which I can
    see being redrawn.
  - Writing text (e.g. hello) to /dev/tty0, I first see the text,
    followed by an enlargement of some of the characters.
  - "time ls" on the serial console (no files in the current directory,
    so nothing to print) increases from 0.86s to 1.92s, so the system is
    more loaded.  As ssd1307fb relied on deferred I/O too, the slowdown
    might be (partly) due to redrawing of the visual artefacts
    mentioned above.

So while the displays seems to be initialized correctly, it looks like
there are some serious bugs in the conversion from xrgb8888 to
monochrome.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
