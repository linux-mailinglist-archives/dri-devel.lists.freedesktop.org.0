Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AA63CFE8D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 18:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDF66E221;
	Tue, 20 Jul 2021 16:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831E06E221
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 16:03:06 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so21962943otf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/vkJe7iPu6rsdTrj/rwJVM+Dly5WduuMAkiM0NoVcRs=;
 b=tkehq4kLm6OU0/ZCklwHz62NOXlObQgW8EWUpyNQ2S0Q8YbPGeFrp+aL64AyMwAsP0
 TYKEoAxG+iBDEJGeN1+SgfEd6i/MUh3ZH8ch22GfXoK/Sq9ndDX0RmX47cNdYgSoUQmA
 RILjD04PqiwU/I8D67WsqbocBFHTNomMApzp1TwKLtWQbhpOb9yWuNNvBjFkaTt9rPbf
 Nt7OWfj9GmQX/4mG1aDIopaQTy2GBwiaTppNHwBRckuPh1it6uhGvBJ4AP8drg/ltygL
 i3scYALFfjB0bxl8bSrU8M09UiqaSaV/4EVsCgJrHVbIrtWsF/Us1eSa7qUzZ2N4FFOz
 N2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/vkJe7iPu6rsdTrj/rwJVM+Dly5WduuMAkiM0NoVcRs=;
 b=nP6QMd5ZPRm0W2t0oINudS5hIXKk92j+LH3RJIAoWG4iiNFdKSoSLyigCGb7/A3+i3
 E9gpvuCr2zwBCMF9c3/vJwyntiIK9YzmPT2N+uDlfsUiB2PSYVtzIder8XrYR+JsGz0J
 HFihdVH76P47Ycd+gboEkyqXfe/K8RKoXT+bvOwZfkZjy9YsOZuwk6vyAZ4Mt+JLn+uJ
 D1UI4UxRSG7RjdDzb88Ox68JwPzqQogJW/QmNPq/ceN2/bx944AzgrjaScBrnjq9+T3J
 6okXUycbuq8RrX9JKX5cGyKZ3Zybr4fYqq3zQAKCFffiIGDzipRuqmMa47lxMvJX28Y6
 AJng==
X-Gm-Message-State: AOAM533DkkPmUIs8vZRo8V+PWHhiWeEubwpmeygnsXxbKDO5A55SaSmj
 jScisZwlx17CmrIJe3g+zf7ewQ==
X-Google-Smtp-Source: ABdhPJyrqDKwsECRQVkzMXTYg0ATE6Lh1vcU0X1FvoL4VMrd25wJ7w3JR+MmjJ1WsmmDQCPVUhGS3A==
X-Received: by 2002:a9d:6c1:: with SMTP id 59mr14779236otx.318.1626796985486; 
 Tue, 20 Jul 2021 09:03:05 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 12sm1228504oij.40.2021.07.20.09.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 09:03:05 -0700 (PDT)
Date: Tue, 20 Jul 2021 11:03:03 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 3/5] drm/panel/samsung-sofef00: make gpio optional
Message-ID: <YPbztxBh4cCJF8p3@yoga>
References: <20210720153125.43389-1-caleb@connolly.tech>
 <20210720153125.43389-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720153125.43389-4-caleb@connolly.tech>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 20 Jul 10:33 CDT 2021, Caleb Connolly wrote:

> The OnePlus 6T panel fails to initialise if it has been reset,
> workaround this by allowing panels to not specify a reset GPIO.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> index 8cb1853574bb..a20a5af14653 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -44,6 +44,8 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
> 
>  static void sofef00_panel_reset(struct sofef00_panel *ctx)
>  {
> +	if (!ctx->reset_gpio)

gpiod_set_value_cansleep(NULL, 1) is a perfectly valid nop, so I don't
think you need to make this conditional.

That said, don't you need this to get the panel out of reset once you
apply power after it being powered off?

> +		return;
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>  	usleep_range(5000, 6000);
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> @@ -137,7 +139,8 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
>  	ret = sofef00_panel_on(ctx);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		if (ctx->reset_gpio)

Ditto.


Regards,
Bjorn

> +			gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>  		return ret;
>  	}
> 
> @@ -276,7 +279,7 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
>  		return ret;
>  	}
> 
> -	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(ctx->reset_gpio)) {
>  		ret = PTR_ERR(ctx->reset_gpio);
>  		dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
> --
> 2.32.0
> 
> 
