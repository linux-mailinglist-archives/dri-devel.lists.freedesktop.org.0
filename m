Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644D1516810
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 23:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A48510E08B;
	Sun,  1 May 2022 21:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D3410E08B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 21:35:38 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f863469afbso107506707b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 14:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T254pOQ0OrSDi8zN/59MRP0JPU9NfQ5B5Rmbgtdrkko=;
 b=wlpA+CfyvX91ALnfVCMPP166Rc0Mpatt42DsMvCkWJmeZUVRfB6mnUYecnMGRNYbhI
 ld8YsssomjW9oCtQmr15blAmBLS+t4KouSWHxbIZVjnsq1DnJlp8Fx6XNCVuGUF0GS/N
 6klXRU6dGXOQupaFrwlX9Yah5rEs29v06x/UCbuJ/f0GQoJQPiBvrEccSjVf/VH42K7p
 RwLGlqfP5o3h1uwBR8xQuBvPKaAX5Sq4RHEUwFvP/y5fx9owfyl5p9sMhmOT/ahPJUD6
 7q+tV1u5MOsspWP4YhNR748kjKGgc9lX4NNszXKAVeEM0jxtUxFRG3LYR6gGsd4NYws0
 Yv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T254pOQ0OrSDi8zN/59MRP0JPU9NfQ5B5Rmbgtdrkko=;
 b=ZAEvVU7g4gnYGpeClKXux6vPsvD/ButzrXkHHsO1FDlGE0gAswwmjVWo0WrDI9sDmt
 PBviK0XJzVML9itW+sOCUcTYhcFqrzQmPEyBM+pFMF7zamw1IDvhgcnSe8/CUvoTRbnh
 B3vxsfu4jhWJ5ICLWxmZEhNnhfS52et9pGQUHA5oMksgpOCDte/EMSXDCBmUCiz2IoCr
 heonaHFZO7fOF6zuHalM6xfaJ4Ro5DhoGkyEBerCk+BWVC/9ay8MiwRDaSCUg/L1d3lY
 o8YvEnBcyNgwpyYnWLvBH5IS++oTkdGHQ/KY4StFUI92mwoXqmST0p69Ow9/0bpYszXW
 an3Q==
X-Gm-Message-State: AOAM532qk2iLTzfg34iv+eWlOO5KHx/EG+5w+SV7DSUYWdGPlJHc1d5t
 97Xtx3fWi8tL5yh4AXcp7HcAzRYMdksheGUq5l3AeQ==
X-Google-Smtp-Source: ABdhPJyiNIf7FX2G9hbcHdCnWtNprAICIXfmTZ2O7M9XljL3Duwj1WbWX/AgvgI1z1Nmh9oOd4l1d7OyIUiw7QC5qEY=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr9543818ywe.140.1651440937377; Sun, 01
 May 2022 14:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-18-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-18-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:35:26 +0200
Message-ID: <CACRpkda10Cv9W07FjO4Ww58V_cgP05Thz-7cv6aF=QC8iW2vDA@mail.gmail.com>
Subject: Re: [PATCH 17/48] ARM: pxa: corgi: use gpio descriptors for audio
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 robert.jarzmik@free.fr, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 6:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The audio driver should not use a hardwired gpio number
> from the header. Change it to use a lookup table.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
