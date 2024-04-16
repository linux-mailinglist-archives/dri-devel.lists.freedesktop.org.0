Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093FB8A728A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 19:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191A910F271;
	Tue, 16 Apr 2024 17:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T1DJQ5tu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6C110F271
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 17:41:33 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6ecf8ebff50so3155244b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 10:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713289293; x=1713894093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=fuSlZ3HYBwGWpvUjlEHJZ6jiAtRBcYC8gyN7/1CSeUs=;
 b=T1DJQ5tu8lqunTJ9gAgVwXflQMCerbNoRdO8KGmgWcRgrNyn1Y3Yl6ybjU1yB1v9eg
 ePgWuS+HkLn+RKPXwU0tO1tk3v0zWNN+94mbU6U8bASmxZrH1MKwuWtQAs3WpqdAH4sc
 teTvAqoTFoL97Pp9dlAtU4MiOxxaiYeIQ//3xUCxBjyfU+0BbZ9jjUfBpLsz4DnSPy1a
 a7mBTQws/wJGLG6bsxu/ufJAcE+2wVxJWvGGl1YT48SdlZm6Sb5f5p6/i77l4jtkJXhb
 QuW6aUGJYPtOR7d7sJW/0ZsApARaecMdp5UcI6OVJrEVNanvk98Ot96vW1cUSgGZ7CTb
 Nd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713289293; x=1713894093;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fuSlZ3HYBwGWpvUjlEHJZ6jiAtRBcYC8gyN7/1CSeUs=;
 b=LuEGLXvqobXWA8m2U6lxRNE5aFrbX8dFnZ2Ae2SSTb9yu4DVEJeoBZQh0AwvZpu1Il
 Z0PFQlA7Q13cebuzwORHwmK72VIu4+XapXcQ5vGB06sUhX5FZ4EGhgxWAT6JMXRnjrFr
 ip7DaHPyvit2JwIfUoqkOSJM2GXBRmAFdSFNvV9x1w+GEILm7pm0fYfwv9Pjipp5QEjp
 N0J/Az0fWW5IzlEeV6jAEAW+lnFXXnCADdgOnM9MpSr1s+sKi6kmhr+8Gvye4TW1lbO+
 UOwec9erTiqqqAKJNLdoIrGlqlscauzO7aFBnFIhJt9tV+ARhiO3MSd1/JduxWpDUFJf
 cQYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXiWP+EV5i7gtKmOdmntq3cYASJmXOEVDRqfOUQ8EwO0O6jvyAHk3S+/GEKV7h0uOF3NJ11tHQlGa8otMwRYipiNrYGpE9uEelaoD8TLzd
X-Gm-Message-State: AOJu0YyPB1Ho0EVXdzDGFaTBZn33Fy8vHeAhBEfO1mA2UxsM1z4KbTRs
 RdZz0Zb3HtXqTQff84vzu1SiZ6XQSOM6cXVkNIdmfsbyOLULvX7n28dQLkt2lo1SKsCHmpZbgm6
 keKMY8Q==
X-Google-Smtp-Source: AGHT+IG1dzh2TdV/BigVdaBJloMJJZT5sQrBhWJ95u2+OPWPhZ3NkBEkbkMvpbyIgMeig9eceehhMw==
X-Received: by 2002:a05:6a00:194f:b0:6ed:41f4:1886 with SMTP id
 s15-20020a056a00194f00b006ed41f41886mr3862754pfk.8.1713289292766; 
 Tue, 16 Apr 2024 10:41:32 -0700 (PDT)
Received: from [10.36.52.145] ([24.75.208.156])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a056a00175500b006eaafcb0ba4sm9223242pfc.185.2024.04.16.10.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 10:41:32 -0700 (PDT)
Message-ID: <b0baa839-f9b0-4ba3-bd09-6c2166a7bba9@linaro.org>
Date: Tue, 16 Apr 2024 19:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 02/15] drm/panel-samsung-atna33xc20: switch to struct
 drm_edid
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
References: <cover.1713273659.git.jani.nikula@intel.com>
 <4ec5ec3ac5c5fbe738f51aeeb4363de1a9672684.1713273659.git.jani.nikula@intel.com>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <4ec5ec3ac5c5fbe738f51aeeb4363de1a9672684.1713273659.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2024 15:22, Jani Nikula wrote:
> Prefer struct drm_edid based functions over struct edid.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>   drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> index 6828a4f24d14..a9f0d214a900 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -36,7 +36,7 @@ struct atana33xc20_panel {
>   	struct gpio_desc *el_on3_gpio;
>   	struct drm_dp_aux *aux;
>   
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>   
>   	ktime_t powered_off_time;
>   	ktime_t powered_on_time;
> @@ -253,9 +253,12 @@ static int atana33xc20_get_modes(struct drm_panel *panel,
>   
>   	pm_runtime_get_sync(panel->dev);
>   
> -	if (!p->edid)
> -		p->edid = drm_get_edid(connector, &aux_ep->aux->ddc);
> -	num = drm_add_edid_modes(connector, p->edid);
> +	if (!p->drm_edid)
> +		p->drm_edid = drm_edid_read_ddc(connector, &aux_ep->aux->ddc);
> +
> +	drm_edid_connector_update(connector, p->drm_edid);
> +
> +	num = drm_edid_connector_add_modes(connector);
>   
>   	pm_runtime_mark_last_busy(panel->dev);
>   	pm_runtime_put_autosuspend(panel->dev);
> @@ -351,7 +354,7 @@ static void atana33xc20_remove(struct dp_aux_ep_device *aux_ep)
>   	drm_panel_disable(&panel->base);
>   	drm_panel_unprepare(&panel->base);
>   
> -	kfree(panel->edid);
> +	drm_edid_free(panel->drm_edid);
>   }
>   
>   static void atana33xc20_shutdown(struct dp_aux_ep_device *aux_ep)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
