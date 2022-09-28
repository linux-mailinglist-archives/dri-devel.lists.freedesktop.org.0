Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6455EDAE0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 13:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B500510E42F;
	Wed, 28 Sep 2022 11:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E64510E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 11:00:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z6so19242526wrq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 04:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=Vmh28mTnRu63ezVpuO/VYJZBKc7bNMAcTpkijNYdpyA=;
 b=eWsdi58eEi2d+xAwZU365etNANXaKeUbz6X79IbCm9H9HsBdqAZugvQDvVLOABzfB0
 p3zLdfC7XmaOYbVCe9leZRYVvjlL4ArmzkzWiprCKuXkt9XKBVuXWNa4uAdZTyuq40EQ
 HfSpyxljjlafgudMxvIWMNsAWgOkm/q1fiIPhFmehyHQPsbeEqB6owfjKFJYOAwrPTOf
 K/iP4Z+9nlvV/3435cCK+JiuiTG/UX1dmN6QJ+l3+IVs8yxtftML/ncExEdmBpgZJlFO
 URJslWFayRQYLbYPjYUaGWde4zDVq45Rfppg2OCn6ATDWXhUJiQF1iJlmcyQgy1BPsDl
 lZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Vmh28mTnRu63ezVpuO/VYJZBKc7bNMAcTpkijNYdpyA=;
 b=yySN8TvbqxATLn+W/6zLkiYq5MmbtZnI2dcfmpysxDyHoNqnwWKWqlXpPvs9AOhClR
 Dk9nHhwi3zP2ooSJQMWPwmzp11mIobI0M2DSZWqU4vhucN/RklKNl7tG+e/Vj5WJQHwT
 UWGrqLfhwfI6F4BSwwuCZSNwil1AvCO3Djifd6Zf+RsZKyjrDDEpNdDn28Ab41/yzuru
 qzdNERbweTyoOFfuiVnkCNDPO34yXDRmp+5KoJJmfFmAmmxb1/lG0UEs6Mdwe550a0Bx
 2f3u9kejRDA0IVCadHb+Njgz346oB7G1aTqewx+AKItiPSNpRzYI0/SpV+Q8wiADvgFi
 neig==
X-Gm-Message-State: ACrzQf3tJA+Ia/36HlxvdTlIMwkpaKruUt2dTtUIADVPQvy0kn1BCGMh
 fJz1yGsXZTP6PuaMQl7tNzuv1w==
X-Google-Smtp-Source: AMsMyM6CwwVXxXr1iKOfbH0C0zBuHDeMEcKc5KNkjaOdpkrjKkMaH6ADg7D9oJX5c11no20O0U5aLA==
X-Received: by 2002:a5d:6808:0:b0:22a:c437:5b36 with SMTP id
 w8-20020a5d6808000000b0022ac4375b36mr20216420wru.459.1664362854849; 
 Wed, 28 Sep 2022 04:00:54 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 x4-20020adfdcc4000000b0022b11a27e39sm4035884wrm.1.2022.09.28.04.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 04:00:54 -0700 (PDT)
Date: Wed, 28 Sep 2022 12:00:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
Message-ID: <YzQpY2Llwsh/V4xV@maple.lan>
References: <YzN6A9Y20Ea1LdEz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzN6A9Y20Ea1LdEz@google.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 03:32:35PM -0700, Dmitry Torokhov wrote:
> Properties describing GPIOs should be named as "<property>-gpios" or
> "<property>-gpio", and that is what gpiod API expects, however the
> driver uses non-standard "gpios-reset" name. Let's adjust this, and also
> note that the reset line is active low as that is also important to
> gpiod API.

No objections to the goal but...


> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> Another option is to add another quirk into gpiolib-of.c, but we
> may end up with a ton of them once we convert everything away from
> of_get_named_gpio() to gpiod API, so I'd prefer not doing that.

... it is unusual to permit backwards incompatible changes to the DT
bindings[1]: creating "flag days" where hardware stops functioning if
you boot an new kernel with an old DT is a known annoyance to users.

I usually favour quirks tables or similar[2] rather than break legacy
DTs. Very occasionally I accept (believable) arguments that no legacy
DTs actually exist but that can very difficult to verify.

Overall I'd like to solicit views from both GPIO and DT maintainers
before rejecting quirks tables as a way to help smooth these sort of
changes (or links to ML archives if this has already been discussed).

[1] For this particular driver the situation is muddied slightly
    because it looks like complex since it looks the bindings for
    himax,hx8357 and himax,hx8369 are undocumented (and badly named).

[2] When the property is not parsed by library code mostly we handle
    legacy by consuming both new or old names in the parser code.


> diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
> index 9b50bc96e00f..41332f48b2df 100644
> --- a/drivers/video/backlight/hx8357.c
> +++ b/drivers/video/backlight/hx8357.c
> @@ -601,7 +601,7 @@ static int hx8357_probe(struct spi_device *spi)
>  	if (!match || !match->data)
>  		return -EINVAL;
>
> -	lcd->reset = of_get_named_gpio(spi->dev.of_node, "gpios-reset", 0);
> +	lcd->reset = of_get_named_gpio(spi->dev.of_node, "reset-gpios", 0);
>  	if (!gpio_is_valid(lcd->reset)) {
>  		dev_err(&spi->dev, "Missing dt property: gpios-reset\n");
>  		return -EINVAL;

Daniel.
