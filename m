Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C3151682A
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 23:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D128A10E29F;
	Sun,  1 May 2022 21:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F242010E296
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 21:42:17 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f7d19cac0bso131322427b3.13
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MwcGhzUMzuQB5fGeykDG23vjACySyYiqBWBdUcZ2GFk=;
 b=GsyTsXTnDN4CY7AA1wrUQT+Y1CVIulHFr4oTp0Tg20CKmvaI7383RxQl+UgGOv+N+2
 7ou2YNXArVG+yi2/xmhm3RwrSr3D5kp2Qgn4DGjh7X2FOJT6wCnWESaCleX/OA9RyV1j
 bwVae0byfjRjtxi5dpkNZn4RfOZ4A1Dd5ugrXFBMXK6tcItRBG80t8J5dKLVZDkoSscm
 wLvaYka4x9i1J8J19EMXqtisuJV8Y/+IS/CbNSohuvWMsp4QiDVXj73xIQP7ss5xnIhF
 n2lEDjG6braJDzS8nQh1+rl3rM6D4gPTo91/XI5EArn82a4AseinskiVs5gU1UTGg9+F
 pAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MwcGhzUMzuQB5fGeykDG23vjACySyYiqBWBdUcZ2GFk=;
 b=Dwd8n9Y5HHqvdKRm8ACtb+j6IapXn0vn0h344pDrdF8uXOgGJicBS586BSozueeZTn
 tq344mMIa3EFODWwaMqneXprgXnlGoN8qzA0xLcJQvbcU5SmCV5RhkISrgcie57UC6Yo
 TESEcwz2G1PEi1zPcq4tmzhlbDx2aXyMBerIzXYFZqEjGXIFcB3JNhC9f0paY6lnD6QJ
 hPVkGLA8Gv9tFXYfVgIE1Tv9CLunsqyiFTp+uUV4Tv/fEOAsJH97SaGJndqrPlocz9Jy
 x2Tyx6qkEFlutLN7RnXSR0tdt8f3pm/MA7VMzzEL9Vzh+9tDY6UPQDM+RsxJJThqnhzO
 qWzg==
X-Gm-Message-State: AOAM530eg/Cbp+UQ2g/+eWNDpvW4vwLvoy1126BkXTbvcgulVYxfcDC+
 xCm7WCdsal7UWLafR0BVU9PgkhGFEFopWAiYHoapHw==
X-Google-Smtp-Source: ABdhPJweSDfNcHOc9BYhAdVgxvU92j70ljyyRr/zhBZuYvLYJv5UF4MYF8uqkqj6NhL3p2ezG4XOpBAT8/G/pJAvCNA=
X-Received: by 2002:a81:2108:0:b0:2f5:6938:b2b8 with SMTP id
 h8-20020a812108000000b002f56938b2b8mr9549829ywh.151.1651441337159; Sun, 01
 May 2022 14:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-21-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-21-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:42:05 +0200
Message-ID: <CACRpkdY3krNDWcGznSB5fNGM9NXw6xA2qWduDidS1KNM-hbynQ@mail.gmail.com>
Subject: Re: [PATCH 20/48] ARM: pxa: spitz: use gpio descriptors for audio
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
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
