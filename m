Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CEE4EDCDE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D9510E28A;
	Thu, 31 Mar 2022 15:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352B110E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:32:36 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so4019023pjm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HMnSntbehaMLduLgRRBR3axAz7D3Z3iT+Ij/aDbCqvU=;
 b=P/Zwb7Rd7hXbbSLopJFX00jusS6zysJlGI8kK9u4tBaOIgT1waRttgaxFcJCiKKYd5
 Dw9K/wk7YQhdL5ObaADLm7fQTEBtYKlUbQh568jIHMe0xNXrJaMZAmpEUiy5f70rtJkX
 JAC0giP0HdoOljFkenM0WTmeFFMOBEUWpazb7mOpLUaHsoEsIbHOqv0PL8soAIaLW0XK
 xqXckL6hsoCIgfEpVoAKJ0MZ6i2sMs+B8DnS25BbTIUOhyH6akWGu2Btt7kzOJ2fA0K/
 FV5WkscfkuuWBmZM4FW5DqL8CGvadLZaFKpiKSCIcKMdarTTscfAkwNvGzbdJk+JH0V2
 fxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HMnSntbehaMLduLgRRBR3axAz7D3Z3iT+Ij/aDbCqvU=;
 b=JGm0CkaHPHgPn8p+1UPJwMUonxzi3P7h9M+rcEJgDl2RdN8fPGaV2rHyAh4kg9RvCX
 uXbigSF8djCefaLiaTw7660l0ITmab66pMbUsWOgRCb/o0+ZvUFjJUIUKIoK/jPrkzzt
 Yx0SJbOEvsFCXXK8+gfMlP/g7jbhJ8mp3EKPr96wqVulLGKU4hqtGv3klFzOHTZmjQRz
 rhcjEFDXljcO/AiDglZLX2FJrAhvMxHyPd2juxQ3wwPd9edqP8NDqp9QyZCt3Q2XFmSq
 fDkwJ1FPqICUJ0SsOGa+9l9vwUx2t2YA25NlWScjUDMPV4H2m7ID8QhcxSsLc4F07tAr
 gjqw==
X-Gm-Message-State: AOAM532oCP5aWf54zEY9aUGZZ6uYlJYXBQfoH5XxZtgx+uSKsNZg4NjH
 BWShdJP0gkUQKOrIXNjwZfjGVR9H8CYtYdqHbkkRcA==
X-Google-Smtp-Source: ABdhPJwAkQJMtcKSPNXLhhSqVlNkqPwolTYegpPdwHVRUmLqD4SBAnm3jRQVW0i/XZwqDQE2L4HzdFmehS5NR/Pd2nk=
X-Received: by 2002:a17:90b:3e85:b0:1c7:7eab:2649 with SMTP id
 rj5-20020a17090b3e8500b001c77eab2649mr6771193pjb.232.1648740755792; Thu, 31
 Mar 2022 08:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220213022648.495895-1-marex@denx.de>
In-Reply-To: <20220213022648.495895-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:32:24 +0200
Message-ID: <CAG3jFyvvM4hah-bqYZdD9zOM2bB04ioD_67TJGgcnZf33=zX-w@mail.gmail.com>
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
To: Marek Vasut <marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 13 Feb 2022 at 03:27, Marek Vasut <marex@denx.de> wrote:
>
> In rare cases, the bridge may not start up correctly, which usually
> leads to no display output. In case this happens, warn about it in
> the kernel log.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 19daaddd29a41..1d7c154ea1d79 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -488,6 +488,11 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>         /* Clear all errors that got asserted during initialization. */
>         regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>         regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
> +
> +       usleep_range(10000, 12000);
> +       regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> +       if (pval)
> +               dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
>  }
>
>  static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
> --
> 2.34.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
