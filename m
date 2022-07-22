Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C347D57DCE6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 10:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B98914BE;
	Fri, 22 Jul 2022 08:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BBD914BD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 08:52:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a5so5556094wrx.12
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2Pn4rXwJt2p3TU+sUueEHtQodbg6OuCCH2XmCube7cQ=;
 b=r27r4fHqAh0CWRW3DSWor9BS2qur9Q41GzIHFZqQES6pCfAcZx5CuJFslnk7z+fv47
 6jlKigelz6Pb4RrJn0Hc1qzBD7Ev/b836NwnSQXWysNnhTuPdlQeJETOu1ZiXH1+eKPf
 Vqqni8cAY5bOcuzzngHlGJPBOi96W81wpdlhXmSqij+iqajS9YrtkIoGjZzApDyYAXcL
 sUL9U1xoEy9H+L83cIq0PHm6MUAmRm47KeQGih47T5/IxLZ4fGG5BYYBOF7VpjjIxhnf
 O96jmScWEVUOPGmmsgY1ZIH3Yp+WqvcOHuZWh5coUHu9umTjLfJhdoPvCipn7JX75cLB
 O0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2Pn4rXwJt2p3TU+sUueEHtQodbg6OuCCH2XmCube7cQ=;
 b=CCRr0a2+6FMXSvmh5nqB3+KPigaP8k/Z9tgSGnMnkit5D5oq856HzN5Wt72IVmbRAh
 v5qjgIdWg960k4ngvK5u+GQjCAL88VzoRqQ3NEL/H+IFUrndynS68vdHLz6SPuOkd2nB
 XBADESubVUVjnDpjpk16Fah+nCRuKJbgGY15sDsvWSGhvTydneCsd3Znq/va+ecoRX9U
 BdOIFeQeQW4D0FmsZIi/6nSQnZmwegLolFrbK1fM5UeZRlPzeUv1JZmTZWuCX7fcPghB
 kfo0EesNwm5mG70VQo3CrXKg9qIclLUXCXeGUXbxlSykv3xr9Q3QY66R4azmlqb+uQnc
 1UUg==
X-Gm-Message-State: AJIora+VU6bo0IZtV36H/i64UFucForrpqYG+i3V2AhQcCZtgjr33VBM
 k1yUUzWpKsBnyxlSUVWsSMnWEA==
X-Google-Smtp-Source: AGRyM1uKdvpmi+vQrw3tcNIve4triqR6UDhGsTHpKea8nf/rvMaGuXeiQBf96xeCJUr5qlFO6NsSZA==
X-Received: by 2002:adf:ef49:0:b0:21e:4688:5c66 with SMTP id
 c9-20020adfef49000000b0021e46885c66mr1635319wrp.145.1658479964036; 
 Fri, 22 Jul 2022 01:52:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:57a9:b2a2:82d5:8786?
 ([2a01:e0a:982:cbb0:57a9:b2a2:82d5:8786])
 by smtp.gmail.com with ESMTPSA id
 m184-20020a1c26c1000000b003a04722d745sm8031736wmm.23.2022.07.22.01.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 01:52:43 -0700 (PDT)
Message-ID: <6467b619-d03f-a108-659f-062c96998848@baylibre.com>
Date: Fri, 22 Jul 2022 10:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Use dev_err_probe() to avoid
 polluting the log
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220722074755.660258-1-javierm@redhat.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220722074755.660258-1-javierm@redhat.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Erico Nunes <ernunes@redhat.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Enric Balletbo i Serra <eballetbo@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/07/2022 09:47, Javier Martinez Canillas wrote:
> If devm_drm_of_get_bridge() can't find the connected bridge, it returns an
> ERR_PTR(-EPROBE_DEFER) to indicate that the probe should be deferred.
> 
> But this path also prints an error message, which pollutes the kernel log
> since is printed on every probe deferral, i.e:
> 
>    $ dmesg | grep "failed to create panel bridge" | wc -l
>    38
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 369bf72717f6..90bbabde1595 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1206,10 +1206,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>   	int ret;
>   
>   	pdata->next_bridge = devm_drm_of_get_bridge(pdata->dev, np, 1, 0);
> -	if (IS_ERR(pdata->next_bridge)) {
> -		DRM_ERROR("failed to create panel bridge\n");
> -		return PTR_ERR(pdata->next_bridge);
> -	}
> +	if (IS_ERR(pdata->next_bridge))
> +		return dev_err_probe(pdata->dev, PTR_ERR(pdata->next_bridge),
> +				     "failed to create panel bridge\n");
>   
>   	ti_sn_bridge_parse_lanes(pdata, np);
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
