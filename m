Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42B4D1D35
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229CD10E4C1;
	Tue,  8 Mar 2022 16:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EFB10E4C1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:31:13 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id bc10so16594797qtb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 08:31:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HwPCO4dFtjlzDdsvWKkUtYlqbyqtlLf5x449OlOiOMg=;
 b=r+ab68frD98402umJYOUKMmvD4qzi5p1djGE4Knf/2XCvVbYk37pw7/OEeIuP5PyXc
 rON+eXRwrrp/5OYY8d4jBjqAARxorHcYIyS8mmMvQQ/sdvK8Mx3kH1PMW6X0+kGSTMOM
 gyMYZLfJknD+LssCqs9a9X3Hpc1hhUCM3Az5PSu4+Xiog84H3hOU1u4R6jNaDsGNZgeU
 UH9O6rI6ljXGyTdArPNg6bVkJi6HLQ31AbFUgh8l4l+qvTfZIMVwVWIP/FmP4yFKF49l
 pRxLL4h+8f0e1hXRGZagwnf0z/QuD10HjC8RacYRTf+WvHBXR8Q3eaYPsKfPKUuBr0gB
 MCEQ==
X-Gm-Message-State: AOAM532+OP5Dln4CAmAz/9fk1L5zErMSN/UG5cJ4QNMo86j3Uy4Dyqwe
 NRmBMCPIRS44X6L7AAWB3DZzs1FtznILgw==
X-Google-Smtp-Source: ABdhPJw+I1jALxIuhosFbrgoODGpkF9AG8BngYqfWXEAwifHcwHQCPruBjE2VN+UPzJLs+HvnE0OZw==
X-Received: by 2002:a05:622a:48f:b0:2dd:b41a:e206 with SMTP id
 p15-20020a05622a048f00b002ddb41ae206mr13928892qtx.274.1646757071362; 
 Tue, 08 Mar 2022 08:31:11 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 s21-20020a05620a16b500b0067b1205878esm3842716qkj.7.2022.03.08.08.31.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 08:31:10 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id g1so38870890ybe.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 08:31:10 -0800 (PST)
X-Received: by 2002:a25:8486:0:b0:619:9fba:895e with SMTP id
 v6-20020a258486000000b006199fba895emr12806820ybk.342.1646757069990; Tue, 08
 Mar 2022 08:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-4-javierm@redhat.com>
In-Reply-To: <20220214133710.3278506-4-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Mar 2022 17:30:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+29x4ZHLAiPiReyLKw_VYBCCLw0bCoQmw9s6sQ4Bxcw@mail.gmail.com>
Message-ID: <CAMuHMdU+29x4ZHLAiPiReyLKw_VYBCCLw0bCoQmw9s6sQ4Bxcw@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Feb 14, 2022 at 2:37 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
> OLED display controllers.
>
> It's only the core part of the driver and a bus specific driver is needed
> for each transport interface supported by the display controllers.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch, which is now commit a61732e808672cfa ("drm:
Add driver for Solomon SSD130x OLED displays") in drm/drm-next

Sorry for the delay, but finally I gave it a try on my Adafruit
FeatherWing 128x32 OLED.
Some of the weird issues (cursor disappears after printing some text,
more text also doesn't appear until I clear the display) are still there.
Unfortunately a regression was introduced since your v3: printed
text is mirrored upside-down. I.e. "E" is rendered correctly, but "L"
turns into "=CE=93" (Greek Gamma).
I suspect something went wrong with the display initialization
sequence.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
