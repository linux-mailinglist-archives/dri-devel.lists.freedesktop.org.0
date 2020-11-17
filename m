Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4752B5B60
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B426A6E16D;
	Tue, 17 Nov 2020 08:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570556E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 08:55:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u12so15111496wrt.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 00:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RtxIAxEZISmwL9Tvj9Gd08JgoH0+MMiWxX80iMCHZDc=;
 b=bErZpINFuyZnGZ8F8evjNC8fUls4APjWAmOWfFL/IPZVCCeNdOZlv+evABOB4FKGVR
 oFEyQ4GEioUoHmwnNPWIeeuxNuJG/Dgneaf8P1E/0nUX+IhaH8vTxFeeLgU3kDNC5iIP
 eWyUp0k2Aolkb9ZIOoYNu4M5zAtlas1A3ZYX5xkqL/GPn9IA0mWkVvgsjq8ABmu9p0wZ
 F5n3j3a/NzpE0gQwnvorRzqGvrO2aqO3vCz/CqKSgssK0f53t4/1VcOIkgckNo4TqQt4
 EWVIqQzdXqweKAaS+NxtWlSisozFu06duy5hO0zNEFKLOoquoHCUsm/RFvfw9WXf8frT
 eoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RtxIAxEZISmwL9Tvj9Gd08JgoH0+MMiWxX80iMCHZDc=;
 b=pK1V10nMRqlh6T26EDez+CrGL8jfjzq4m/NiiHpQ+H0jY/fHwzXxujuHXM+kjjx0vo
 XDwxpOUVo589NWoynw0btILEa2++jPtBh6COjKZHYKYUQYElNxhUYLFcAjSohkN7wufT
 GAh3273xP3kCSqVb8C+Qh2+vgepC4QhmJPWnkdbMkroeY3QbDB403oiKvcILjQtm57Xt
 3Hk85pm0UDHP/Pa1wadcA3wfilcqoSBxDl+Z4JQmPPG0DufK3gvvL3NW52UYYeQqmPSY
 koNYKSMkBwRyDH7MBzw+Ptcf15ZlWOI9RMXlER82buRzReUCsjrVoiqxszE4bGY4Ah/e
 0dfw==
X-Gm-Message-State: AOAM5320KWjc9kANcPJlRJNfD/XWuNNqBgguneYqERagiMDNaK0zHFqH
 LBL+WF3XI5tNJKB+aCDy+O91Ew==
X-Google-Smtp-Source: ABdhPJytrGcqZ3nwt9VI+MkVjJZck/vlmrILQNa6R7F0ckrifFniUjchV6BcDBI7c/hGJrwxcLqwSA==
X-Received: by 2002:adf:cd8d:: with SMTP id q13mr24353280wrj.61.1605603306792; 
 Tue, 17 Nov 2020 00:55:06 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26?
 ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
 by smtp.gmail.com with ESMTPSA id a17sm28722073wra.61.2020.11.17.00.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 00:55:06 -0800 (PST)
Subject: Re: [PATCH 3/4] drm/meson: dw-hdmi: Register a callback to disable
 the regulator
To: Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20201116200744.495826-1-maz@kernel.org>
 <20201116200744.495826-4-maz@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <35fc622c-bebb-6111-9d08-e6b5433e75c5@baylibre.com>
Date: Tue, 17 Nov 2020 09:55:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116200744.495826-4-maz@kernel.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2020 21:07, Marc Zyngier wrote:
> Removing the meson-dw-hdmi module results in the following splat:
> 
> i[   43.340509] WARNING: CPU: 0 PID: 572 at drivers/regulator/core.c:2125 _regulator_put.part.0+0x16c/0x174
> [...]
> [   43.454870] CPU: 0 PID: 572 Comm: modprobe Tainted: G        W   E     5.10.0-rc4-00049-gd274813a4de3-dirty #2147
> [   43.465042] Hardware name:  , BIOS 2021.01-rc2-00012-gde865f7ee1 11/16/2020
> [   43.471945] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
> [   43.477896] pc : _regulator_put.part.0+0x16c/0x174
> [   43.482638] lr : regulator_put+0x44/0x60
> [...]
> [   43.568715] Call trace:
> [   43.571132]  _regulator_put.part.0+0x16c/0x174
> [   43.575529]  regulator_put+0x44/0x60
> [   43.579067]  devm_regulator_release+0x20/0x2c
> [   43.583380]  release_nodes+0x1c8/0x2b4
> [   43.587087]  devres_release_all+0x44/0x6c
> [   43.591056]  __device_release_driver+0x1a0/0x23c
> [   43.595626]  driver_detach+0xcc/0x160
> [   43.599249]  bus_remove_driver+0x68/0xe0
> [   43.603130]  driver_unregister+0x3c/0x6c
> [   43.607011]  platform_driver_unregister+0x20/0x2c
> [   43.611678]  meson_dw_hdmi_platform_driver_exit+0x18/0x4a8 [meson_dw_hdmi]
> [   43.618485]  __arm64_sys_delete_module+0x1bc/0x294
> 
> as the HDMI regulator is still enabled on release.
> 
> In order to address this, register a callback that will deal with
> the disabling when the driver is unbound, solving the problem.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Fixes: 161a803fe32d ("drm/meson: dw_hdmi: Add support for an optional external 5V regulator")

> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 29a8ff41595d..68826cf9993f 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -941,6 +941,11 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>  
>  }
>  
> +static void meson_disable_regulator(void *data)
> +{
> +	regulator_disable(data);
> +}
> +
>  static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  				void *data)
>  {
> @@ -989,6 +994,10 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  		ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
>  		if (ret)
>  			return ret;
> +		ret = devm_add_action_or_reset(dev, meson_disable_regulator,
> +					       meson_dw_hdmi->hdmi_supply);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
