Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C35C484298
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 14:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0F210E1CE;
	Tue,  4 Jan 2022 13:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB7110E1CE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 13:37:13 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id g2so32707958pgo.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 05:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D736xcW6mnSzdCeNa4cuzz73/79ln4mEm4aUwrA4o7g=;
 b=H9KIaxj+4rUigwIZEcx9omWefyC8Cr+m2kkulm/BfX3ayl6owe1bEUUKGCG/8IrWKi
 X+Y+gJk4PgNmY3f6SVp24N5TW2QGt2kflhnSH/J5dWBxw8RTOqd0lzsCagYumzAdJ4p0
 gN9y9y/5GOr9FOY4navQhMx0B4Vt2cauY5MuCHy2KiGFoi+dIGH6xX5NvMaIRIs3TT1h
 iRW1TZMRHSm4ZpzLoB+8P61blWZBpR3awOWhqbLJLiLon+bHkmp5aQ8SIRK1OWEb1CWI
 GqUAtQCebmlmF2kV4OC+1CA+KxvBjEgoxp49ehpLx8lxCtnM04MyZXXCSnmPJtZKrPwy
 NBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D736xcW6mnSzdCeNa4cuzz73/79ln4mEm4aUwrA4o7g=;
 b=lz6m6QMDsVfs1R4qt9J2hOwbeBVUQKrWZIYjj6gMrqsLtIY4vr4kRBGoKRFE9/O/v+
 mkoUecfKC/lHuxpkhyPKOYdiolUViwG8IJ0z/Alf3VgRq2+157s+s1f4h3NFarDJcU88
 Ne3QBnGwNPXEAa36vQbeilgf8hg5Ln4Wlvyv5PljaWyTJ1QEtKiq1OrnuZaZ5wVOt7nu
 Q50NND3A2rAu+do8YCDkwNg/suhnF8iCp275r1cWwYjMQt+v8TCdGyCHvSVGoSKPay81
 hM/0wK9w7p3T+/eBoAnF39/utL6+yb2aMsnqKJghsxFUl1QlNIY34hUpmlpUwfEDhFo3
 oXaQ==
X-Gm-Message-State: AOAM531+wNixmD0HkckeRYmRzIroqRvjwNr4iYe6ESPlUP9nTBFJSkAB
 fj3dZ/Bg5//JEGiW6KezORCUt7BbkZtM1CeLZ0/LJA==
X-Google-Smtp-Source: ABdhPJws1bqBeVSXlUmBPeCwIC2GMIkSO+RxkrQ9CkAgsC669S9+4XmAOnJ4iVvmArIN/4+CNqraGyHUpsTWRPnDUY4=
X-Received: by 2002:a63:854a:: with SMTP id u71mr43809083pgd.201.1641303433298; 
 Tue, 04 Jan 2022 05:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20211119015804.3824027-1-xji@analogixsemi.com>
In-Reply-To: <20211119015804.3824027-1-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 14:37:02 +0100
Message-ID: <CAG3jFytg88mWgA24ce4CbPKDA7HDdXOjC=AVxYrhv1c0Z5GTPA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Check GPIO description to avoid
 crash
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
Cc: drinkcat@google.com, pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 bliang@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, tzungbi@google.com,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, sam@ravnborg.org,
 qwen@analogixsemi.com, dan.carpenter@oracle.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Nov 2021 at 02:58, Xin Ji <xji@analogixsemi.com> wrote:
>
> As GPIO probe function "devm_gpiod_get_optional()" may return error
> code, driver should identify GPIO desc as NULL to avoid crash.
>
> Acked-by: Tzung-Bi Shih <tzungbi@google.com>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 001fb39d9919..652ae814246d 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1098,9 +1098,18 @@ static void anx7625_init_gpio(struct anx7625_data *platform)
>         /* Gpio for chip power enable */
>         platform->pdata.gpio_p_on =
>                 devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> +       if (IS_ERR_OR_NULL(platform->pdata.gpio_p_on)) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "no enable gpio found\n");
> +               platform->pdata.gpio_p_on = NULL;
> +       }
> +
>         /* Gpio for chip reset */
>         platform->pdata.gpio_reset =
>                 devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR_OR_NULL(platform->pdata.gpio_reset)) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "no reset gpio found\n");
> +               platform->pdata.gpio_reset = NULL;
> +       }
>
>         if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
>                 platform->pdata.low_power_mode = 1;
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
