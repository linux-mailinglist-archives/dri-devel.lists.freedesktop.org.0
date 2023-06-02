Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17BE71FD6B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 11:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8504710E643;
	Fri,  2 Jun 2023 09:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174B10E644
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 09:16:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f606912ebaso18569675e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685697379; x=1688289379;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XCSBt06ODCOO6aeVJ2PlXGU7kys31a0U2ya2eb1ukWw=;
 b=Z+ctFkEefF0e4doqq0Ug4bfRYfV4IApiuCj62wHwH5KpnMjImkCKEMD6dqT7PNRqck
 1KxgSYzQW+icJWnxf2IK5Zp6wkBYQ4bRr7wuvKK94lbSyRpz8wwAkskcQMj24qiM1v0M
 GAluuGomAl2RCXaT9ZNXSrDGVZapBa7+Jq9d18QJrscreKDrwX3flFnK43x57UYOsIv7
 zbcespmhVHncyojB36fAyNh5rqJJzl51FFFHTVKe35+DnbdMKCKo7o58rfG7d9pVH8OQ
 EDdUTisqSCde7B8cMJMJtg/sm2DSAVQCSVe5ZJZSZNK6PQkM3H4WEQBgjLvVos0fww56
 a6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685697379; x=1688289379;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XCSBt06ODCOO6aeVJ2PlXGU7kys31a0U2ya2eb1ukWw=;
 b=kcasxemtLtJl7Tjl4RfRvvlp0+3jfOkqXfbg67jig+Ino42cpet+6HhUidVhWuz0KE
 43/4GjSvUkgtmUKwFFsCiQfGghNDOOsE+0reO50+FNDJ6nINKS6JM3nSCWrBlv1U0PhV
 T7wHGItII6KijFCKa1/YNaNNNWHVy3hN0J3XwcV8J4jXFXRO2hGojxjA+POeVMkzoYNp
 ZR6Y0dMRPMXivAc0vAriyU2IkXBrmUrJm6tiXcUECi+ouVNhIrlz+j81uf/UR+zs9MMa
 WK/pQW2GoovfCLBp3yziEVtXpq0gNdtAJhyhN+gZSPP69jzUOufMsb1ff9dUkNKx6yZe
 8NkQ==
X-Gm-Message-State: AC+VfDwxdckOpSsWxLFUZCHPiWytsoXqBmC4rdE2F3YThoQhCKdkQlCl
 lQ0gg10i04iMsLtpVrRD6a1OCw==
X-Google-Smtp-Source: ACHHUZ5kFDVkTijAYhopCOawiE08DDNzoy6papAmWv1662nnpG5t1S72iJGGObX98yTOLoivrgSqwg==
X-Received: by 2002:a05:600c:3798:b0:3f6:244:55df with SMTP id
 o24-20020a05600c379800b003f6024455dfmr1508463wmr.29.1685697378846; 
 Fri, 02 Jun 2023 02:16:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cabd:b6f:39ae:51a2?
 ([2a01:e0a:982:cbb0:cabd:b6f:39ae:51a2])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b003f60119ee08sm4895391wmc.43.2023.06.02.02.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 02:16:18 -0700 (PDT)
Message-ID: <1ed84d1f-d999-f0f2-bd84-d56f46efa384@linaro.org>
Date: Fri, 2 Jun 2023 11:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH -next] drm/meson: Remove unneeded semicolon
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
References: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
Organization: Linaro Developer Services
In-Reply-To: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2023 11:14, Yang Li wrote:
> ./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:117:2-3: Unneeded semicolon
> ./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:231:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5392
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index dd505ac37976..57447abf1a29 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -114,7 +114,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   	case MIPI_DSI_FMT_RGB666_PACKED:
>   	case MIPI_DSI_FMT_RGB565:
>   		return -EINVAL;
> -	};
> +	}
>   
>   	/* Configure color format for DPI register */
>   	writel_relaxed(FIELD_PREP(MIPI_DSI_TOP_DPI_COLOR_MODE, dpi_data_format) |
> @@ -228,7 +228,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>   	case MIPI_DSI_FMT_RGB565:
>   		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
>   		return -EINVAL;
> -	};
> +	}
>   
>   	ret = phy_init(mipi_dsi->phy);
>   	if (ret)

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
