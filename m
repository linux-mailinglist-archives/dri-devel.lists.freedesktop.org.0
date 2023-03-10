Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B086D6B3916
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D9010E98B;
	Fri, 10 Mar 2023 08:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5893310E98B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:45:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l25so4310927wrb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437941;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=a5HfvYhncPc5WkXrx7TXneqdnHtHjSlY0/csmSTBCvo=;
 b=d5DjCqtS1+wN5j6vUJj7e3Eh3ats3MfHXSD61no9fO/w96/O2QtOiJgXFVhIiqxDcH
 zS9jLB7ReWNugjGwREbBgZqmSkUg9imCpwV1NN3LKCtr2O+E/1fSHNNMcz3yPcO2djRS
 SZQZcKbtFzA5Z0hFKeHuWZBvED7P8ADQRDUkskjd25TWB1ixPiXeluhVoIaMt86xPCE1
 fs1oCox37wkeJL55NerrEfOMPh1Xqxu/HvSaomnTgZN59R67im5Cy1WxYgcqWXhjug+L
 RaEoNuvPZQOeyCh1RdZdCphyM+7nvUGpj8t7BgzdYUFO9fW7rhJYvkLn7pPgkoyTSK/p
 77EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437941;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a5HfvYhncPc5WkXrx7TXneqdnHtHjSlY0/csmSTBCvo=;
 b=b7WaEfDnJztsyumSLDPSVxZ3eTFs3aeSASNMJX1GclpgFq/p0K50a7UlJ6RsDuj6VH
 h8sfbivf9jNu79SBBkvUyk6RlSwMKRGQwjyDTrB2iEzM+ktRaq9qms5TRM9up3A2g5Fx
 M2RWQWx+c82Z4jm2Hh7mVEZiS0Vazubsaag4NRUgyWdJfoXYQ3edNCljFxvTUHJBHzKF
 G5XYlWAV+Fh48ERytbRbnbQN+FDqCa+GrZ3aDQtJeLxtZtIUEbS6cwap7QoDSGGbiEjK
 2TTF54DkHwAjUA52EULcuZOqx7SK8nwHHn4fkM4Sg/WmsxHWIDQXodL2Xd12+J3BHOlg
 Ba3A==
X-Gm-Message-State: AO0yUKUPXzJQJbAdGELnQNVmStgbLctuU7tSgF4ebV+CcgeEyK2wMVzt
 7uydf34cJ17uXlKTaBr4THEvug==
X-Google-Smtp-Source: AK7set8UnLvEQ6jzYl0bMA8Ja77/zqGkBDrnSBl43cDzrY0EJHmrPi2vPwdTN7pXsULDyM93kionLg==
X-Received: by 2002:a05:6000:110d:b0:2c5:4c0e:3736 with SMTP id
 z13-20020a056000110d00b002c54c0e3736mr16024988wrw.24.1678437941380; 
 Fri, 10 Mar 2023 00:45:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:566:5b64:c228:1137?
 ([2a01:e0a:982:cbb0:566:5b64:c228:1137])
 by smtp.gmail.com with ESMTPSA id
 s8-20020adfdb08000000b002c70d97af78sm1513245wri.85.2023.03.10.00.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:45:40 -0800 (PST)
Message-ID: <1ef5f606-ffe5-eefb-c3fe-e81093e1a35b@linaro.org>
Date: Fri, 10 Mar 2023 09:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion again
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
References: <CGME20230309152453eucas1p28e1870593875304648243c9dead4b256@eucas1p2.samsung.com>
 <20230309152446.104913-1-m.szyprowski@samsung.com>
Organization: Linaro Developer Services
In-Reply-To: <20230309152446.104913-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: neil.armstrong@linaro.org
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 16:24, Marek Szyprowski wrote:
> devm_regulator_get_enable_optional() returns -ENODEV if requested
> optional regulator is not present. Adjust code for that, because in the
> 67d0a30128c9 I've incorrectly assumed that it also returns 0 when
> regulator is not present.
> 
> Reported-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> Fixes: 67d0a30128c9 ("drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 534621a13a34..3d046878ce6c 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -718,7 +718,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>   
>   	ret = devm_regulator_get_enable_optional(dev, "hdmi");
> -	if (ret < 0)
> +	if (ret < 0 && ret != -ENODEV)
>   		return ret;
>   
>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,

I'll need to wait until v6.3-rc1 is backmerged into drm-misc-fixes to apply it.

Thanks,
Neil
