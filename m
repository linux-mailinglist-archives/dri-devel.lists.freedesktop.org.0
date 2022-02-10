Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CD64B13F0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 18:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D0710E8AF;
	Thu, 10 Feb 2022 17:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58D10E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 17:13:15 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id i30so11364199pfk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QZ3cH0FU++BGKzJo9VuS5Ab2ppvdiiMqMLbf8RhGMsg=;
 b=RcQXSfwwmh1ybTIjX8t0ERg/W4xyNj8x4V3zJ3rNfp1h/UXSnU7TAuBkXSbr8C3CjI
 KoHFNReTOopSrqKBk6FR7d0BJzyROO74qBwtiqMgXN6YwVsvjqh8oW2UycI4LCHu3Mu7
 jeQZZerM9+1wRSib/Tq39LBV4317NtfYLgTESQ0S6MsCxUulxoVsfPSwUglvcrXk+AN6
 Q6R8nT9ZCVWTek3VI57ZyYiPVXu+M3T+9QByyW9mNu5yea95DJqwYbRMTVpRdIEKnQ2T
 hVPK01Io4z+vJIWrykmmGIFp59fUPCcPHPHDUiTi6nlPk++q2LflZs1h2j2TzkZ4I9dO
 Mypw==
X-Gm-Message-State: AOAM531Xg7XaIt1fK8Qwn2L0IZiJJqvyVKJmHP5kKXzJX3+Pk0FrmBcd
 7FKMrPCE/bLFCReZ9n+ZujzGcBexT8Tjww==
X-Google-Smtp-Source: ABdhPJzxUTq1+z3u6GZM5nqiAZnvSjhUq8AuegerzYXGUPF2dj+zsPdQaYNxclzuxclkwm6/2lkmkQ==
X-Received: by 2002:a63:924c:: with SMTP id s12mr6973481pgn.257.1644513194978; 
 Thu, 10 Feb 2022 09:13:14 -0800 (PST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47])
 by smtp.gmail.com with ESMTPSA id mn7sm2927929pjb.8.2022.02.10.09.13.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 09:13:14 -0800 (PST)
Received: by mail-pj1-f47.google.com with SMTP id v4so5789013pjh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:13:14 -0800 (PST)
X-Received: by 2002:a1f:294c:: with SMTP id p73mr2998419vkp.0.1644512786734;
 Thu, 10 Feb 2022 09:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20220209090314.2511959-1-javierm@redhat.com>
 <CAMuHMdVs750iE=kP1vabwgsGOb8sHc8aC5k=HwCU32CURnYktw@mail.gmail.com>
In-Reply-To: <CAMuHMdVs750iE=kP1vabwgsGOb8sHc8aC5k=HwCU32CURnYktw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Feb 2022 18:06:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKmfOAdTG70KF+eAw3noXHSGCPyGjw3cSVyQOvzUafhQ@mail.gmail.com>
Message-ID: <CAMuHMdVKmfOAdTG70KF+eAw3noXHSGCPyGjw3cSVyQOvzUafhQ@mail.gmail.com>
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

On Wed, Feb 9, 2022 at 1:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Feb 9, 2022 at 10:03 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> > This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
> > SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
>
> [...]

> The logo is not shown, even when I create a 16-color or 224-color
> version of the small monochrome logo I'm using.

My mistake, I messed up the hook-up, causing it to pick a different
logo that was too large to be displayed.

Of course it's using the 224-color logo reduced to monochrome instead
of the real monochrome logo, as fbcon thinks it's running on XRGB8888.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
