Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6E6F57E9
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 14:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512C410E2AD;
	Wed,  3 May 2023 12:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C891C10E2AD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 12:31:11 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-55c939fb24dso5314937b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 05:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683117070; x=1685709070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTrT4jPc7J5Eliba/sNg5kwjP6TH6hnGe4LZ/zcsA7o=;
 b=h6CZGQjzmQEBoCydE3tNyOUgkXuZkUfdzrGG9K7kUwAwoLFxNhVXjtbs3lH8tPxDCJ
 lgKRzg/JByUmGYCLL1CBZxXCRwwaP/rcXDhv2Q0GbKNzMw1mD93llA0XuKu/SXVKGhJI
 NHqdGYM/fsJ+Ulf/M1a3wzv1A4ho3F0hcM+YLNZQbZaR4dRxXgizaF3qTwUJMBBb9vk+
 k0MT4rhuEw/bjlFGXI9qtZ70Th89ykZJTxgBlWMLyNPantAaXohSSDpl+SR2KNSQNWyd
 O4ti0OXekeEAAcuBzGV2+JNTOWwwti5A2/r08pux2hZNGEsWdjxGaCG3fEnLYaVTcLex
 f5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683117070; x=1685709070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTrT4jPc7J5Eliba/sNg5kwjP6TH6hnGe4LZ/zcsA7o=;
 b=Ra4h+py5hUPunRjlw2dAQ4yX83qaUtYTKrsxusu5sFMID7bnXdVtaln7ufuOGoVVtz
 dn7wSfVdZLzwEqieTTsnAAeeFehGn4IAL8aGMGC7VgRcycTjxAWNkds0A43JAEmNgxMe
 3lgUsnOD9aGTCPHFshP08HqGBgqw0xeUkQmE35A/JJ7hsZVqP0mXRFQfIaU4sg6DJ9yY
 N9x0yWKqxnhcdBeBABTqCIi8K+DDmm2oqdKE/v95DoXnDLzoF/U2ugX7TDWyS+Av3NEV
 /pH0nRblhz9hziKqcbgsX9Rj3S8EZkOI5KbmzU9Tme5mhPKflOydaDb9oqmxPzdMkb0C
 cI5g==
X-Gm-Message-State: AC+VfDzmYLDrIfcP9AQi5cTx2ZXrQ90CccTIw1aUlmixBIqn6NI47UL7
 53b0D2YQYuRhQYw2M5es4hByMIgrwZFbC1bUiVfxCA==
X-Google-Smtp-Source: ACHHUZ5Ewu4j5yENuc3yZI5omV8bCwxGXLnezBSGE3w7r+x/XbA+XE92J0DD6UuUftsDizL2fZBuK/upLJL7mLXrYUg=
X-Received: by 2002:a81:4f4f:0:b0:55a:aa57:5660 with SMTP id
 d76-20020a814f4f000000b0055aaa575660mr5037096ywb.20.1683117070218; Wed, 03
 May 2023 05:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v1-0-97704e36b094@linaro.org>
 <20230430-nokia770-regression-v1-3-97704e36b094@linaro.org>
 <CAPDyKFoPa3PZGFBO4njSfEd6H0rdc6KKwPFvE1x6Xx13thKv8g@mail.gmail.com>
In-Reply-To: <CAPDyKFoPa3PZGFBO4njSfEd6H0rdc6KKwPFvE1x6Xx13thKv8g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 May 2023 14:30:58 +0200
Message-ID: <CACRpkdaXVeFtm1cqgtKsOnVppGC1dKNmdOSN59r97C1u_XTqGw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM/mmc: Convert old mmci-omap to GPIO descriptors
To: Ulf Hansson <ulf.hansson@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andreas Kemnade <andreas@kemnade.info>,
 linux-input@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 2, 2023 at 4:26=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
> On Sun, 30 Apr 2023 at 11:22, Linus Walleij <linus.walleij@linaro.org> wr=
ote:

> > Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> This looks like it's best funneled through the soc maintainer's tree(s), =
right?
>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks, yeah the plan is to wait and see if I get some testing from
the OMAP1/2/3
guys and then collect the lot and put on a branch to SoC unless Tony wants
the job :D

Yours,
Linus Walleij
