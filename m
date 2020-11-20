Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB712BAA0F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 13:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5536E8C0;
	Fri, 20 Nov 2020 12:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23F56E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 12:27:15 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 23so9828865wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 04:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2uCDXZNalh/u9Cw0PqPu7oNwAjDazUPklF3HwIhFrSY=;
 b=wFaVwZ17hlCnb1ALIZ5ViKp6LlQqL6M6wO7Us5E+jwdjNQhEQ2g34TdHtVOiDUF5Jv
 PI/xxItXlvcjD2XxTMx8+3dC3Sw2rX4QqCSHOfTfA4+30V9atvdLZA/bVLWIJ174xi++
 oFtmXUrDUTyecAz22bV0xc5y0fJdk/+XFdWRNdE60VWOKYHOfz+A3zZZZtWh8V7jXIYf
 o2E/4htZHzE3hJbk/WVBqCwLO7d6dHffn6V/sNOK4oQkf1CFhSYyW1ILG1eqmnNtL4ip
 +g0UTdkh6s0oxyv/pXIUxGYECzk9WA1X6ZwbK47cXlaEH+4EziSbDZ9a8hw5FDsfcDSx
 tTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2uCDXZNalh/u9Cw0PqPu7oNwAjDazUPklF3HwIhFrSY=;
 b=svFwRvIagXDTHlV/7gj3kJDNsJv3cdxUTFLlEoAWAvdub+6AXV+CXTnWHmILJ7VNel
 5JM9RBBtfUecg+dZHlpSZzWjzvt0QHKe2RothUGF0RCv8v3Nv8jiEvjh2sSkDTkX8Xzn
 +BwIQ7tM9WmT8/Jl0NSWy0xTX3RSQUvs+EZeKmmy0hrh2/r+RUFDYRVxTUrv0vUXr84p
 58VVAFWt57DLoLEL4vGIUHJ7rCMpVUVnXrhTx8hOWqQUs1+BVT/lS5sjIehP25W4QwXV
 zHR2XzCmYQO98sNfUcGb5N9lYq6DnbJkztIulPR75ewRdYoUpfD0zzlJgsusW4i4YHx8
 thrQ==
X-Gm-Message-State: AOAM530UnsKvrrhwULOFqcfJel5USBYvAjkJB9GIBcWf+7X1ft2o2oNd
 GPve1plaCoCcY2AqqpoB3QSvew==
X-Google-Smtp-Source: ABdhPJyxCjVLW6ccWphu88IJtbhlNxX/YBQI6vQfsjwzKvlo7sGH1+aTkvPOxTXmHS1IhaygP7m+PQ==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr14762464wrq.33.1605875230262; 
 Fri, 20 Nov 2020 04:27:10 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:3daa:7c69:63d6:7d7d?
 ([2a01:e35:2ec0:82b0:3daa:7c69:63d6:7d7d])
 by smtp.gmail.com with ESMTPSA id t9sm5009413wrr.49.2020.11.20.04.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 04:27:09 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/meson: dw-hdmi: Enable the iahb clock early enough
To: Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20201120094205.525228-1-maz@kernel.org>
 <20201120094205.525228-3-maz@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <efcccf79-9ec2-30c1-2df8-73f2cbfd0cd2@baylibre.com>
Date: Fri, 20 Nov 2020 13:27:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120094205.525228-3-maz@kernel.org>
Content-Language: en-US
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/11/2020 10:42, Marc Zyngier wrote:
> Instead of moving meson_dw_hdmi_init() around which breaks existing
> platform, let's enable the clock meson_dw_hdmi_init() depends on.
> This means we don't have to worry about this clock being enabled or
> not, depending on the boot-loader features.
> 
> Fixes: b33340e33acd ("drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers")
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Tested-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 29623b309cb1..aad75a22dc33 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -1051,6 +1051,10 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	if (ret)
>  		return ret;
>  
> +	ret = meson_enable_clk(dev, "iahb");
> +	if (ret)
> +		return ret;
> +
>  	ret = meson_enable_clk(dev, "venci");
>  	if (ret)
>  		return ret;
> @@ -1086,6 +1090,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	encoder->possible_crtcs = BIT(0);
>  
> +	meson_dw_hdmi_init(meson_dw_hdmi);
> +
>  	DRM_DEBUG_DRIVER("encoder initialized\n");
>  
>  	/* Bridge / Connector */
> @@ -1110,8 +1116,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	if (IS_ERR(meson_dw_hdmi->hdmi))
>  		return PTR_ERR(meson_dw_hdmi->hdmi);
>  
> -	meson_dw_hdmi_init(meson_dw_hdmi);
> -
>  	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
>  	if (next_bridge)
>  		drm_bridge_attach(encoder, next_bridge,
> 
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
