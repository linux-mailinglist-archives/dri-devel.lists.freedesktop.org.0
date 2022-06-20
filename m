Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656B552564
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 22:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229EF10EDCB;
	Mon, 20 Jun 2022 20:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAD210EDCB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 20:10:05 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id d129so11152199pgc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RGtfEnm6zfcUFyJwIqTfi32/Pu6qfGI/7yYCFLwg0z8=;
 b=mkgnfNkqQGbl8nyklqSc10Vo3tlh+N6/spBTuRnbdeYzqjoyS1tI/2fDSIMhxgfMCl
 /Vlij07Mx8/rhdhxPtWG1fIBYe9Nht4gyclVT3bvaswn46am0wv7gcIxmNmk3+grxAbD
 TtMPux5UrUaG7v1sYInGIRhdw9XyndepVb0cVh2s4wa+GWP+MJMhtZJsjIAMPS/tbfxM
 iCUYYOLHU7mNHYmrAzSVFYTULTAEnXgYsDo6X2K+VA2ufp/NNWbPBmDln9qFYYhs7AAv
 p14if2UPNewdUtPUost92u2uMp+Fop99r6s0aHAW02kwPjpvByWY7TL4eUKtGMTElRND
 CUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RGtfEnm6zfcUFyJwIqTfi32/Pu6qfGI/7yYCFLwg0z8=;
 b=TB8pjEN9WjPhDXgAtAeBqd/x/Fvv8wUoKtiUfmAZ0HEUwYxo2Wzn84DIEyPzCAL+n7
 LWV+9QxZPhjB6c/lNM9h27g6vEQ2Q8BoqXQXDlqsHCmcYdITouYSXfAtT583Kwm3wY2n
 yj2hGhePeVt00yhF135fJ9J7DzshWMlzsDNmttU5ClibHaY/6jS4JwV4LHUe1RGnlPMq
 4o46lz0tnT9+kc6ffay107yBWAG9NXlH1t0363XitmSCcxlmylRkXS6Y0JQu65PxPCpA
 VnB9+XVk712Xf6IUAU2EzqdG0uDO8I503w/0p4aDTpw6UERdenp0w0mdOfaamOsyKKQE
 UPkw==
X-Gm-Message-State: AJIora/fjTwqJEyhEuxc/6IrOk4dsM+5KHzzKrd/QKJIoqWzPNfOjL9A
 ZovyRA/WXxVZWJqIyNb3AsnoWnEGmAMRgn1w0da0vTMu9srchA==
X-Google-Smtp-Source: AGRyM1tM4peI7FqAd+hRq5+n9I1XfgJJ34RdDF6xBcZ/3ZKbCEd3jlNrzOFF7y42V8lexqpmyzOzC00ZvJwCh6ZrDNQ=
X-Received: by 2002:a63:9d81:0:b0:40c:7a36:79df with SMTP id
 i123-20020a639d81000000b0040c7a3679dfmr12267013pgd.201.1655755805448; Mon, 20
 Jun 2022 13:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220614095835.1398708-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220614095835.1398708-1-alexander.stein@ew.tq-group.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 20 Jun 2022 22:09:53 +0200
Message-ID: <CAG3jFyvwEPWHSFdKusNuM9iTdj4_88GOdtaP7FTeWzuwpqMzeg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: ti-sn65dsi83: add more dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jun 2022 at 11:58, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Add more warning/debug messages during probe. E.g. a single -EPROBE_DEFER
> might have several causes, these messages help finding the origin.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> * New in v2
>
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index b27c0d7c451a..a306150a8027 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -677,7 +677,7 @@ static int sn65dsi83_probe(struct i2c_client *client,
>         ctx->enable_gpio = devm_gpiod_get_optional(ctx->dev, "enable",
>                                                    GPIOD_OUT_LOW);
>         if (IS_ERR(ctx->enable_gpio))
> -               return PTR_ERR(ctx->enable_gpio);
> +               return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio), "failed to get enable GPIO\n");
>
>         usleep_range(10000, 11000);
>
> @@ -687,7 +687,7 @@ static int sn65dsi83_probe(struct i2c_client *client,
>
>         ctx->regmap = devm_regmap_init_i2c(client, &sn65dsi83_regmap_config);
>         if (IS_ERR(ctx->regmap))
> -               return PTR_ERR(ctx->regmap);
> +               return dev_err_probe(dev, PTR_ERR(ctx->regmap), "failed to get regmap\n");
>
>         dev_set_drvdata(dev, ctx);
>         i2c_set_clientdata(client, ctx);
> --
> 2.25.1
>

Reviewed & applied series to drm-misc-next.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
