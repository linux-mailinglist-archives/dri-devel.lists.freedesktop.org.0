Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCB08A728F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 19:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB0A10E41B;
	Tue, 16 Apr 2024 17:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cv1sempD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3D610E41B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 17:43:15 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5aa1b7a37b5so3266991eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713289395; x=1713894195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=iS06cmSTuyhClYRnGFxyCcy7fL40DKw/box8yhy+mTs=;
 b=cv1sempDAFR3VK3zICoG4kzp8L7nHgYetiaLev8hc1jxkG9UOWqWdLBLH3LCKQnErd
 zmoPkrqkxVmFbIy+UCENxNaDyBe+aQjAzLNlTlP0ewoaY3/pC1zEiy+FXp88mJxaCga9
 nq/MXrFzGsUsCTKnhTvoevUay4Q28rkKXmpnNifvs+jXvSeV4lnX5Vw0Z3tKe0tLJbhM
 rZvSig7o6YfkqZIcH+pUresDWBrE9l/fYCymtgQouRAyN+P5YHKpGHsymD6TJ0Jqthvm
 /0EQs4j4gYFHE5rvNYbrQX26oHmSeOmZhexa0qiw7MkhpzXnwcU4RwmkPBw4JXGWVzUG
 ajJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713289395; x=1713894195;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iS06cmSTuyhClYRnGFxyCcy7fL40DKw/box8yhy+mTs=;
 b=w0lGQCA8Yx0Z0ZvCim/okZ0y01tTgaycLiduyVl/qrL5HWN+LEw6wDgjuDYg6RQuqu
 qcUhDLCPtThV6wdccUiAf5glJHU/5yJ7b7MDfEHmy/F7NcW6N/FpkRTU44foSzQ88i2A
 6i87JEsjMe6s4The0Cx/gwY3ZnmC0CMXlJ/sAl/rSjxmt+2fuoytQNP6UkXTIVLstRFF
 LFy27nWGq+KpyOx/ZdzdsB6dY4xCr+412FXI1Fn00gcIbEjlTVW2HtdNK0FT862o8AVx
 v0qc0kfvlneX3+8SETloCe7pjrhOaLa/JuMdSyIz7QfhK7iutxCCwveBQ8ggjj7pIjQp
 MOgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEYd9wRtPbl4wBaUv3bSJd9+Vylc2i0aXb3gr923IgZGjh0xtsGUFemRurc+qEF/ucMGQ89aw/CwpVbkOZBS6jj43MO4a/uxJb0jOr87VQ
X-Gm-Message-State: AOJu0Yw3R/I2I+TPm9BSKiAfKRHSUuR0go28I1yZjtVlIwzwupeszE+3
 cy7/cyY7udJN4hGkT1smJ4ShVkwaKqkiynzDYwmj34dL1eVF4YEXzMdT+90Lgyw=
X-Google-Smtp-Source: AGHT+IGKTynjbsBSHDe8wtUWHIypfxvu6d/NEj8iMtEVbBIccvKFKwJpB/0U0t2I9R0/E5hKO10apA==
X-Received: by 2002:a05:6871:5a05:b0:21e:b4d0:9961 with SMTP id
 on5-20020a0568715a0500b0021eb4d09961mr14389867oac.55.1713289394967; 
 Tue, 16 Apr 2024 10:43:14 -0700 (PDT)
Received: from [10.36.52.145] ([24.75.208.156])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a656558000000b005dc36279d6dsm7883025pgw.73.2024.04.16.10.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 10:43:14 -0700 (PDT)
Message-ID: <832ca3d8-355e-4cf4-81ad-8e47d61e6389@linaro.org>
Date: Tue, 16 Apr 2024 19:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/15] drm/panel-edp: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
References: <cover.1713273659.git.jani.nikula@intel.com>
 <a68ee923449a70cc7a59d0d3c96b0bb6764296bd.1713273659.git.jani.nikula@intel.com>
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
In-Reply-To: <a68ee923449a70cc7a59d0d3c96b0bb6764296bd.1713273659.git.jani.nikula@intel.com>
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
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>   drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index d29bacf25c12..ece1e3553c1f 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -242,7 +242,7 @@ struct panel_edp {
>   
>   	const struct edp_panel_entry *detected_panel;
>   
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>   
>   	struct drm_display_mode override_mode;
>   
> @@ -617,13 +617,16 @@ static int panel_edp_get_modes(struct drm_panel *panel,
>   	if (p->ddc) {
>   		pm_runtime_get_sync(panel->dev);
>   
> -		if (!p->edid)
> -			p->edid = drm_get_edid(connector, p->ddc);
> +		if (!p->drm_edid)
> +			p->drm_edid = drm_edid_read_ddc(connector, p->ddc);
> +
> +		drm_edid_connector_update(connector, p->drm_edid);
> +
>   		/*
>   		 * If both edid and hard-coded modes exists, skip edid modes to
>   		 * avoid multiple preferred modes.
>   		 */
> -		if (p->edid && !has_hard_coded_modes) {
> +		if (p->drm_edid && !has_hard_coded_modes) {
>   			if (has_override_edid_mode) {
>   				/*
>   				 * override_edid_mode is specified. Use
> @@ -632,7 +635,7 @@ static int panel_edp_get_modes(struct drm_panel *panel,
>   				num += panel_edp_override_edid_mode(p, connector,
>   						p->detected_panel->override_edid_mode);
>   			} else {
> -				num += drm_add_edid_modes(connector, p->edid);
> +				num += drm_edid_connector_add_modes(connector);
>   			}
>   		}
>   
> @@ -981,8 +984,8 @@ static void panel_edp_remove(struct device *dev)
>   	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
>   		put_device(&panel->ddc->dev);
>   
> -	kfree(panel->edid);
> -	panel->edid = NULL;
> +	drm_edid_free(panel->drm_edid);
> +	panel->drm_edid = NULL;
>   }
>   
>   static void panel_edp_shutdown(struct device *dev)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
