Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7FB70740A
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF8810E495;
	Wed, 17 May 2023 21:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EED10E495
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 21:20:35 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-561c1ae21e7so16162127b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684358434; x=1686950434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/xRTFfbK4NYimyDUxrCUmH9rx6aZeiSGuBiaYTmxbw=;
 b=ahFgt2u2X9w9clM14mYo/38fBow6nCB8b73iuZFrZfxREkniMjSDCp8HWAKBaRYMxi
 LUOLzS54YDfp+Fr/Mwn3HnxydyKpcX0KE3NKHTuPrpZvYD8fIYxwCdWVB9sRG7z33pEY
 hVS/nrIbGldQAmcwS2yjW26/kKIUEF9XVCAhAnyUgze5yZAgsyK/sbClPjsrltulIobF
 9GoO31H6UiWQyrTETXhpad2945FX2wlbEy1FGuoQgPINKjZsXR4QBP9cNQq2o+tpCDlW
 yHA9FLI7M4w2wJfkJkDGncg57spNyhccK5KPLDkzxuc6ZieyQGgmFy2/Q8tFJV2I10SV
 QPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684358434; x=1686950434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/xRTFfbK4NYimyDUxrCUmH9rx6aZeiSGuBiaYTmxbw=;
 b=C1IZSbocuVSZmGBuDZt0c4lZuWKfb/j2bOOA+WjjzidFFA8++E8IUhBFggtm+FmgvH
 3LlqSsYipTpQgk1fYwUS+JKzf6t+dqiV7OlLc76VXERjFSSHfwUbLWbi9QbbFpL9NrtS
 CybmNzPFvWrOV107kGJGpupKdo55PnUTppxn3FbTOb8rV/OOWE+mqiSjCcXYrfO6gtyZ
 /8xjybNftrTE3oswlyuKxzwGmk1NwKK+Q6/RSf6xGJpmj3fyC3RUBFsZHDTn7wu/AbNb
 /UjHLTo0z0dMKfn0X5h3Yt96Fx0OYgbJyN7NVweMY8W47+MO/syEnkNG2toahOqOj36c
 dxxw==
X-Gm-Message-State: AC+VfDyE4XyLDQQPPOgs9GkMIEfmVeAtbL0dQjFUSkTa7+LJFnTI0GmE
 c+V1xojAC1L5B7vu8X7tNhhXE6Hc1DJaos0Idtv/jg==
X-Google-Smtp-Source: ACHHUZ4te0AaK/JzTEsMGDqUpCCjq8nPtW1UY5HTyKVkPeqxtL5BAZZNlI0T3h3SEvEB44eVdaFAHp0j8rMQPrfGTL8=
X-Received: by 2002:a0d:d6c9:0:b0:561:c9c1:ce with SMTP id
 y192-20020a0dd6c9000000b00561c9c100cemr2679247ywd.8.1684358434224; 
 Wed, 17 May 2023 14:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
 <20230517203953.GI271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230517203953.GI271152@darkstar.musicnaut.iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 May 2023 23:20:22 +0200
Message-ID: <CACRpkdbv6hb6KTTSPMhzYJrS_TGoPdeTUO4CZVjaTH0R=G66=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] Input: ads7846 - Convert to use software nodes
To: Aaro Koskinen <aaro.koskinen@iki.fi>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andreas Kemnade <andreas@kemnade.info>,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 10:39=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.f=
i> wrote:

> When tested w/gpio-descriptors-omap branch, the touchscreen probe fails:
>
> [    2.378540] SPI driver ads7846 has no spi_device_id for ti,tsc2046
> [    2.391906] SPI driver ads7846 has no spi_device_id for ti,ads7843
> [    2.405029] SPI driver ads7846 has no spi_device_id for ti,ads7845
> [    2.418151] SPI driver ads7846 has no spi_device_id for ti,ads7873

This is just regular noise from SPI device drivers that are missing
spi_device_id.

> [    2.432556] ads7846 spi2.0: Unknown device model
> [    2.443817] ads7846: probe of spi2.0 failed with error -22
>
> I don't know if that's caused by any the patches in the branch or some
> other regression. With v6.2 it probes OK.

The device is missing compatible. I fixed it.

Will push the branch after looking at the rest of the comments.

Yours,
Linus Walleij
