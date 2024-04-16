Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFCF8A7285
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 19:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D92112D9C;
	Tue, 16 Apr 2024 17:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S+zWDprK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E8D10F271
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 17:41:18 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1e3c9300c65so40543085ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 10:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713289278; x=1713894078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=gwX4nxDVCp1kmf1zIjVH23gKltTL/d0iQxlF9dCUbRA=;
 b=S+zWDprKwpDKeAhgRoDNuII6SAKw/A+JGRZZxlyMG8SNnh3dl1yKbitYi5QR+l1oUd
 lT5V5/eZDUXG9iI6EIj+6WK2voQw6ZgW4pwAkv5/yldmvQ4NXKt5hpM5Af3WEMzwk4ni
 tZzKDnQtOXz6Lieb91N1ggG3fkxhxXU7oMx/Zn45LGBRjFVebdXY+5eQUP705v5sZ0y8
 6En4fkfYbUXol8Q+13JWfyYWaH5dp19X2QPHcX0h5a3H2XHv7eYEfG2p2SveYetQRUgA
 5px+5CWqJdu9omEASE3aVLlFbcI/7hkt4Dwo/cHHXfXFY72f/IkhZ0n9Yd/n7r+E0Fm7
 6pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713289278; x=1713894078;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gwX4nxDVCp1kmf1zIjVH23gKltTL/d0iQxlF9dCUbRA=;
 b=Y23sdfK1UB9s2EsorsurBGPcefPDOH2szwhNfmUjeJMdOpx5Qc7npfVw02N+pw+cNE
 SY79t9J9wd6H/Jv2xIQ02J7b42614pbzSgsZZ7mXzqB9HAdFTjBS8mj7UbhsixoSIF4J
 ouAQYbE+151YXBZ2ZqFyzjrxOtSvfObIvJIgqECpn1qVdb+2TYkJIAj18Pm5eNC9qQgf
 zRMaJNjH/XH5D1ZjbrqRZO+6p8MRSkpEZPH0z/vhu8OYf/EX0r6ApUmHnAmMfH69d6uV
 r/6vI+L1VNTK5oM/Tq2tU1Gk59MAZwAded+Ue0jeveQshNI2M71PPZv27Qssg5wOJBeF
 gn+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVc76jKmqiSVvl9gPCLpfW/JwZ19m7eAtmHlWoPuvNoWvaOYuT3HMIzo/fHH5MrBkEdSNzJ7OK+apsQNQm2KTQLzobOKDMNUwwKtw1tFlL
X-Gm-Message-State: AOJu0YyEcTcifuTRtRKFuLQo7txVocgz7bIyPbnFpjbA8H/W3tRCX4V7
 wjn8Yukd5TDYaK0K2xzu7LZJrH8OiMjP/7WRIgkD8ZMBdVW2O1y5yq0gx+lafX4=
X-Google-Smtp-Source: AGHT+IEGwxYccoBqKT0fH7ZwrQj2HUPo5FYlVFE8isuoynw1i9nbYm8ySD8wxjY7tihGdtHh2Uks0g==
X-Received: by 2002:a17:903:234d:b0:1e7:d482:9e09 with SMTP id
 c13-20020a170903234d00b001e7d4829e09mr2702698plh.7.1713289278220; 
 Tue, 16 Apr 2024 10:41:18 -0700 (PDT)
Received: from [10.36.52.145] ([24.75.208.156])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170902d34600b001def175bbbfsm10065080plk.251.2024.04.16.10.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 10:41:17 -0700 (PDT)
Message-ID: <8a48c2b2-5fe1-4786-8fa4-dc88571f7cee@linaro.org>
Date: Tue, 16 Apr 2024 19:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 01/15] drm/panel: simple: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
References: <cover.1713273659.git.jani.nikula@intel.com>
 <869e91527e8f9da054d776ed6109c7a6bc6151cb.1713273659.git.jani.nikula@intel.com>
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
In-Reply-To: <869e91527e8f9da054d776ed6109c7a6bc6151cb.1713273659.git.jani.nikula@intel.com>
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
>   drivers/gpu/drm/panel/panel-simple.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 7215cf767898..d3264fa2f3ff 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -151,7 +151,7 @@ struct panel_simple {
>   
>   	struct gpio_desc *enable_gpio;
>   
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>   
>   	struct drm_display_mode override_mode;
>   
> @@ -309,8 +309,8 @@ static int panel_simple_suspend(struct device *dev)
>   	regulator_disable(p->supply);
>   	p->unprepared_time = ktime_get_boottime();
>   
> -	kfree(p->edid);
> -	p->edid = NULL;
> +	drm_edid_free(p->drm_edid);
> +	p->drm_edid = NULL;
>   
>   	return 0;
>   }
> @@ -399,11 +399,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>   	if (p->ddc) {
>   		pm_runtime_get_sync(panel->dev);
>   
> -		if (!p->edid)
> -			p->edid = drm_get_edid(connector, p->ddc);
> +		if (!p->drm_edid)
> +			p->drm_edid = drm_edid_read_ddc(connector, p->ddc);
>   
> -		if (p->edid)
> -			num += drm_add_edid_modes(connector, p->edid);
> +		drm_edid_connector_update(connector, p->drm_edid);
> +
> +		num += drm_edid_connector_add_modes(connector);
>   
>   		pm_runtime_mark_last_busy(panel->dev);
>   		pm_runtime_put_autosuspend(panel->dev);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
