Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531827BB21D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C11810E226;
	Fri,  6 Oct 2023 07:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B30C10E226
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:25:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4066241289bso16345385e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696577129; x=1697181929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :reply-to:references:cc:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qV2VQja5LmTI1m7w9ESi1On28HXQZUxRwyeDFL5MFzw=;
 b=YDP/Ljve1kG559QQ2E8eB1iLWSPHT443XH1nycqLIqzj6uVJ61ozs6/IyV9ovkS4Zh
 RQmHDykZQYtAGGp4/8SFiIci0FB/tVYKy7W5ocNZVLq4e8td7mNyOqoItkY9XKwXva3m
 KqmYA7J5KqwvsABn9LKRCP/268wrCws/0VX1ly3MfxEowCBLx6DwgT28p6HROcqgrzhd
 hZyNXcR7eaugOydHNWVjnvLhqosBD9SD4bEKMdPZ/RcosEckXm2aYn0uhZ6CV2SFjwJr
 it/UyXVXCDmcxiVQoMUdDT/xf++0caSvCdrXKGLqKGPCfKgxrSCUPusJeqSIrCEFnRus
 3bQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696577129; x=1697181929;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :reply-to:references:cc:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qV2VQja5LmTI1m7w9ESi1On28HXQZUxRwyeDFL5MFzw=;
 b=lpkH8316U+fnX/3rAaVbtmGKexOzqpNVYlRBAiWeVI9Apvbf9NxU6tx6eda8xCw6N9
 D1YQHAPAv6yIOFBf1l1zIxkEu0U9yMd8uuDYQYGXQiNcR5hIJyCsQ3p3PMKlvXUQh6kJ
 qs+oBq1OKWwMR6vrLKl3HpEh0E+YyD5H5mOb1CRPiOUSat3ZvTqb/1ipenr8yKQS/M92
 MVueMOEqiiZ447tQMPOjBihTxctk22VoyfqjDqnwql408tTxhvk275oFEobqloqnwyNA
 9HbKEXpyhWOSEap4CVnFRmNAClKjLJxF/K1NproNSn6tPUEWAzpUnV3L5cyyHnWo74Ix
 cVfQ==
X-Gm-Message-State: AOJu0Yydd66sAgJc4vIVqrsdMCbVDzj8cNDGXOz37UYeGC3zP5+HCEIn
 wFed5tlYl548Zzv9IVQXpD1APV/6g4e2qtcJtOG9tQ==
X-Google-Smtp-Source: AGHT+IExQtnuJP7YV0qbSmQKcunP4pBKCF++x/8NQW+Qp/omqRbNlFQUw/gOwbYoHglyahyLaI9D5g==
X-Received: by 2002:a7b:c397:0:b0:401:b53e:6c40 with SMTP id
 s23-20020a7bc397000000b00401b53e6c40mr6743451wmj.10.1696577129452; 
 Fri, 06 Oct 2023 00:25:29 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003fefe70ec9csm5354547wmj.10.2023.10.06.00.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 00:25:29 -0700 (PDT)
Message-ID: <f9776050-0388-4136-bcc2-589468da9e55@linaro.org>
Date: Fri, 6 Oct 2023 09:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/drv: propagate errors from drm_modeset_register_all()
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230521173410.4163983-1-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20230521173410.4163983-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2023 19:34, Dmitry Baryshkov wrote:
> In case the drm_modeset_register_all() function fails, its error code
> will be ignored. Instead make the drm_dev_register() bail out in case of
> such an error.
> 
> Fixes: 79190ea2658a ("drm: Add callbacks for late registering")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_drv.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index c6eb8972451a..dc4a496795ee 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -938,8 +938,11 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>   			goto err_minors;
>   	}
>   
> -	if (drm_core_check_feature(dev, DRIVER_MODESET))
> -		drm_modeset_register_all(dev);
> +	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> +		ret = drm_modeset_register_all(dev);
> +		if (ret)
> +			goto err_unload;
> +	}
>   
>   	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
>   		 driver->name, driver->major, driver->minor,
> @@ -949,6 +952,9 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>   
>   	goto out_unlock;
>   
> +err_unload:
> +	if (dev->driver->unload)
> +		dev->driver->unload(dev);
>   err_minors:
>   	remove_compat_control_link(dev);
>   	drm_minor_unregister(dev, DRM_MINOR_ACCEL);

Looks sane to report this error:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
