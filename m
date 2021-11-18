Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3444553F5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 05:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83776E8BD;
	Thu, 18 Nov 2021 04:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CD06E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 04:52:26 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id b4so4227747pgh.10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 20:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QSOtOAi5Tc1aIEzabwTYbDWspkmg5uzVLYl8MIpPJoA=;
 b=MdFNOM/e2K2/fRS6inj/lGYD9pE3B63yoJteoHGfVImfEoViHCQ0lCSOQ43s42TfHA
 pocsPucoLU2vRtzZKm0yhhejcLKw3uMNVCqAMMfifLzVYWiGQ+nORuUSTyRqGzEcj9SV
 RIkoXoDDgcWSjKBTKc8tuosEHqfgGDDoGbyMuJXmj6uFWG7+9Bl+sK2nzQT//l8e/MKC
 eXS6kn+lNHaQ12VpSpfETvbb8HW9M/vTbZBMj+S0zZHBHrcreL5WcIWSjaYxo6pX8jCg
 ZZSD2z9+KaxK7GwxkYQmFqaPGEYR04B56QFDavcl7mZczdzmsFo40SdOTWEM1+k1mhON
 uPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QSOtOAi5Tc1aIEzabwTYbDWspkmg5uzVLYl8MIpPJoA=;
 b=EVfI5CAlMB2hs4itY4pey4qEfIolxbeoxpXKqP8QbhMFaIdp00L1EfMpYtG0uFWMFD
 uxPtj//xW+1EgdowbPoa/RFd7d1cdLbBM3d2Dx5ePasqgpg0dU8al+k2+L0VMYOV5/eZ
 5pgagEJhEtOxedU+0jYQIS6zr3zrJrEphSz0o6FATCg7xnlXmz49pMnUHjcjPSf+MZXc
 itQuCHJkWXJKgmNvoU4dLzVD8G+Tpm37OV818OGDAy/zT9vSozKpkOnCn/clvZLrNQi1
 1sYOjQ0fx567JT5zr5LZRoQ/h4ze10HwWqyKfhsHVxc2b/QJ9SiQfHJkarFrqjtCSJxR
 +ITg==
X-Gm-Message-State: AOAM5320tKJPIXXtAPzNZr5O9VcMO/Y/xDxbnse0ZC0Rq8SigYh6QswW
 5lHMToW8zUFyPkuYXLf8DWhilSCZuQjqL6Yftq3DuA==
X-Google-Smtp-Source: ABdhPJz5uBVbVFCngw7k8h9ZCzm+ig9jeVfnyUG/Yflt8UH1BiiKZNwTDTqCnlI/CLuQuJ76kR+PQZ4lr97UqVdw30A=
X-Received: by 2002:a05:6a00:848:b0:49f:b215:e002 with SMTP id
 q8-20020a056a00084800b0049fb215e002mr52878678pfk.47.1637211145842; Wed, 17
 Nov 2021 20:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20211118031125.3778969-1-xji@analogixsemi.com>
In-Reply-To: <20211118031125.3778969-1-xji@analogixsemi.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 18 Nov 2021 12:52:14 +0800
Message-ID: <CA+Px+wUc8+5HtkS8y4b9aw7m+wLS+zC1em6VKRNog1QKnJrZ=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Check GPIO description to avoid crash
To: Xin Ji <xji@analogixsemi.com>
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
Cc: drinkcat@google.com, jernej.skrabec@gmail.com, pihsun@chromium.org,
 jonas@kwiboo.se, airlied@linux.ie, bliang@analogixsemi.com,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, sam@ravnborg.org,
 qwen@analogixsemi.com, dan.carpenter@oracle.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 11:11 AM Xin Ji <xji@analogixsemi.com> wrote:
> @@ -1098,9 +1098,18 @@ static void anx7625_init_gpio(struct anx7625_data *platform)
>         /* Gpio for chip power enable */
>         platform->pdata.gpio_p_on =
>                 devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> +       if (IS_ERR(platform->pdata.gpio_p_on)) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "no enable gpio found\n");
> +               platform->pdata.gpio_p_on = NULL;
> +       }
> +
>         /* Gpio for chip reset */
>         platform->pdata.gpio_reset =
>                 devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(platform->pdata.gpio_reset)) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "no reset gpio found\n");
> +               platform->pdata.gpio_p_on = NULL;
> +       }
>
>         if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
>                 platform->pdata.low_power_mode = 1;

devm_gpiod_get_optional() is possible to return NULL (see
https://elixir.bootlin.com/linux/v5.15.2/source/drivers/gpio/gpiolib-devres.c#L250).
Thus, we should use IS_ERR_OR_NULL for checking the return value.

The cases here would work fine except it will skip to print some
informative messages.

Acked-by: Tzung-Bi Shih <tzungbi@google.com>
