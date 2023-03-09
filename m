Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C636B2A6E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4594189D63;
	Thu,  9 Mar 2023 16:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CF289D63
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:09:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id c18so1517638wmr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 08:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678378166;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=baM3HjE9DHLDRhWVfhwj4CxYGrNduMCVIYgW3lJTrXk=;
 b=iaa/1vV1rmISH0Ji0xGX1OzifywbERYgyvuDecuzcJOkhUt4LmFcJUpILJWa4bnadW
 JRkFU61L6fCQU1oia8nnXtry9uhoYL7NCFdXs2CrKDXCvlIgvd8n7Odx8TK87Or57hAQ
 mKMUVWoMqD8nLBo4LZpAF3AH55oTY8FRfsRMmqsafX5k36uWJIVRRGl8mHez7IiqDe7o
 vimG3FTnFTJ4sZQHGMsd3i6wYpE2FdkpGLCY/jq6AhyVSTkP1uVatZjoAu5WG5plA9xz
 LKySpBsMjYqJQ8FXGsLu8A58gVsYy5MAwtUKlZ5v2re5OBisMlx6CFcFjrXu8nU1wzae
 blKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678378166;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=baM3HjE9DHLDRhWVfhwj4CxYGrNduMCVIYgW3lJTrXk=;
 b=AiS656aJ/96V3rLZ2LJJ3wruH2ieryWFY5nNIh3WUPPbbha7GmYyy9FNvOPQby4KUN
 ZlLccr+DxGNkN+RfOXXeJI8csjZGZe1GV6FkO821iyRp4Eb6DT7lLEO935LZ6huhPnP/
 J/B8p9XfU2Q5BHi+WtE+wFy05nt+F/0mZDByYeeDodzeenI25mKBnByXeOK5ZsbQTG6/
 WLcLvxshJyBjTmXt0d0uo9yxb3RGrPhRcOJv0bIscdDCpyunEXVQ9ZXDFqDs5DM9MK+X
 GWE11DlnxsWJuPGLZxUK/ItkAEYA4uxSZ1Iy/bA9XHd6f94rT9/dM74AdLroxCGoY0v4
 BQSw==
X-Gm-Message-State: AO0yUKWg3xtx8EO3iGpY4EjQr8cJFoId9/mt1mKoyhjDsNNJPb91g8LK
 98O1tz4caqa+rNXBeG6RdiQOSg==
X-Google-Smtp-Source: AK7set9lWqVBezY8rlJKRdM/6lwliOySmAqXpeWCr+d3/Ss6zcbxSKWYzxPcdKzRhY/uCL02e259/w==
X-Received: by 2002:a1c:7417:0:b0:3eb:2b69:c3c4 with SMTP id
 p23-20020a1c7417000000b003eb2b69c3c4mr21108056wmc.36.1678378165794; 
 Thu, 09 Mar 2023 08:09:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9df7:bf3e:9813:995a?
 ([2a01:e0a:982:cbb0:9df7:bf3e:9813:995a])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b003ebf73acf9asm338152wmo.3.2023.03.09.08.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 08:09:25 -0800 (PST)
Message-ID: <c0eecc5e-4ad9-b9ea-137c-903abfad849f@linaro.org>
Date: Thu, 9 Mar 2023 17:09:24 +0100
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

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
