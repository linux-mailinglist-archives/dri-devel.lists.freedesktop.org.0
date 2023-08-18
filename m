Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDBF780745
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 10:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4AE10E499;
	Fri, 18 Aug 2023 08:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A2710E48E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 08:37:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe8242fc4dso6562385e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 01:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692347847; x=1692952647;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=EkTtM2TNIG+ZMhNGtHnzw5WU517N75Vg3ipWDLnXuCM=;
 b=sgKbfSvobO2Acg3w5MD88ZS03UFr/0gL31LuucE2J7G/Bc8lSvXc/CJl0XDC+HOFjX
 GG3XX+AkZp5BqqhRD0TwYrFTtT643LOMpZVtfSFhdY8te4yicAjUa9fTOBpv1LRaVbah
 UYmPFN7ckAGACx/qhNaBUJlWZUN6SLeUrAPpOwjw7Vs8xe84XA7dbyonyadqjfGHd5Bu
 w8jKsYKpBzSLdaYQiNX9wklM7LGdTm5Ut5dDARhfO5Dy0ciNdzAuf8F8ZQKlAdXBdOV7
 K+oj1t6frvexDk7aOQ/vX7gfjtvyRKYBRlwO+wAen2ITbp0WugPg8wAvA3iMihh+VHhd
 yoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692347847; x=1692952647;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EkTtM2TNIG+ZMhNGtHnzw5WU517N75Vg3ipWDLnXuCM=;
 b=WRll0CXSkPxk77665es3FOTSeVsQCBJiAN3+FaPTQx1L3Dvdaqd1bE6MUKDSqm0TJX
 sCEPqn/xfeMe1pqkSHwbG49zFkdzkDnxKSRuHUg3Dr7Ce3A01uTPVNkNc7fe8Cp/QoRn
 oZ4kIGdRF7o3BsoJ0gjSkjsNmNWNC5pQUyHcjl7VLORpy9o/HDi3aky0QdWAszRqr60P
 FhK7sJZ/QFtz7acgv4tbn6nOvhWdpVVbgp24EAw0WWA4cvzhA8PsQylb123Xc/GLUeNX
 sr3zTkTPcrVYHP6NJ2FwTJzAot968uB4qXQ/Zh0B5D7ieppk/rHyOdyWhe1jifoA1Zsl
 TXzA==
X-Gm-Message-State: AOJu0YzaGinDsBs6goEIMkDs8zEOSdeXO0x4sWbcataS9YLvUuqLCHhg
 tHBuszYMsu2x0ArmvC32xjrZYg==
X-Google-Smtp-Source: AGHT+IGWWG9k0zKOaYDfIhvTQO1DGhLcAwN0pgCFVuWFkZ2CUZO+vJbuLqXUQrI2YzypkbM5uSU32A==
X-Received: by 2002:a5d:49cf:0:b0:314:327:2edb with SMTP id
 t15-20020a5d49cf000000b0031403272edbmr1362430wrs.0.1692347847387; 
 Fri, 18 Aug 2023 01:37:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b9f6:39b9:fff4:e741?
 ([2a01:e0a:982:cbb0:b9f6:39b9:fff4:e741])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d4448000000b0031432f1528csm2033008wrr.45.2023.08.18.01.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 01:37:26 -0700 (PDT)
Message-ID: <0f81553d-1d68-43e5-aa49-4801ba7c7d51@linaro.org>
Date: Fri, 18 Aug 2023 10:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm: bridge: samsung-dsim: Fix init during host
 transfer
Content-Language: en-US, fr
To: Frieder Schrempf <frieder@fris.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robert Foss <rfoss@kernel.org>
References: <20230724151640.555490-1-frieder@fris.de>
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
In-Reply-To: <20230724151640.555490-1-frieder@fris.de>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/07/2023 17:16, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> In case the downstream bridge or panel uses DSI transfers before the
> DSI host was actually initialized through samsung_dsim_atomic_enable()
> which clears the stop state (LP11) mode, all transfers will fail.
> 
> This happens with downstream bridges that are controlled by DSI
> commands such as the tc358762.
> 
> As documented in [1] DSI hosts are expected to allow transfers
> outside the normal bridge enable/disable flow.
> 
> To fix this make sure that stop state is cleared in
> samsung_dsim_host_transfer() which restores the previous
> behavior.
> 
> We also factor out the common code to enable/disable stop state
> to samsung_dsim_set_stop_state().
> 
> [1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
> 
> Fixes: 0c14d3130654 ("drm: bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec")
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes for v2:
>    * Fix reversed stop state enable/disable in samsung_dsim_set_stop_state()
> 
> Hi Tim, could you please give this patch a try and report back if
> it fixes your problem? Thanks!
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 043b8109e64a..73ec60757dbc 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1386,6 +1386,18 @@ static void samsung_dsim_disable_irq(struct samsung_dsim *dsi)
>   	disable_irq(dsi->irq);
>   }
>   
> +static void samsung_dsim_set_stop_state(struct samsung_dsim *dsi, bool enable)
> +{
> +	u32 reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> +
> +	if (enable)
> +		reg |= DSIM_FORCE_STOP_STATE;
> +	else
> +		reg &= ~DSIM_FORCE_STOP_STATE;
> +
> +	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> +}
> +
>   static int samsung_dsim_init(struct samsung_dsim *dsi)
>   {
>   	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
> @@ -1445,15 +1457,12 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>   				       struct drm_bridge_state *old_bridge_state)
>   {
>   	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> -	u32 reg;
>   
>   	if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>   		samsung_dsim_set_display_mode(dsi);
>   		samsung_dsim_set_display_enable(dsi, true);
>   	} else {
> -		reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> -		reg &= ~DSIM_FORCE_STOP_STATE;
> -		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> +		samsung_dsim_set_stop_state(dsi, false);
>   	}
>   
>   	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
> @@ -1463,16 +1472,12 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
>   					struct drm_bridge_state *old_bridge_state)
>   {
>   	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> -	u32 reg;
>   
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return;
>   
> -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> -		reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> -		reg |= DSIM_FORCE_STOP_STATE;
> -		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> -	}
> +	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
> +		samsung_dsim_set_stop_state(dsi, true);
>   
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   }
> @@ -1775,6 +1780,8 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>   	if (ret)
>   		return ret;
>   
> +	samsung_dsim_set_stop_state(dsi, false);
> +
>   	ret = mipi_dsi_create_packet(&xfer.packet, msg);
>   	if (ret < 0)
>   		return ret;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
