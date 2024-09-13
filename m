Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B64977A7C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1331C10ECAF;
	Fri, 13 Sep 2024 08:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nk4Uvpc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46A310ECAF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:03:03 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-374c326c638so442942f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726214582; x=1726819382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=WuKvojtCZg7g14c14RQDvHtxwoqt5QeCZyN0kUqDmA0=;
 b=Nk4Uvpc035iwrFpEvIrJYaWdx/T7fm0taETQr+4B0I/1zTcUbSOCFTqu21Zp5peMWT
 yB49XGY8XwrDwfnpY7d4ufWvVNgCmYwx7DIcQFisRMozqU9HeeiipsiFkOmnJHlRpLXT
 EYSMmPGz4hX5JsR+VOaSuQYqkGNGY1QD0I1I6dEM1tBk4j0OUs3ch4owV5HNZ+gPvee7
 kpu7aFz3OttQKTnYTrPkHvUkJOBqw+YFhfLtEpbG0/vlYBClt5+jy/DotjzqVLu0L2Sv
 sq8AuvOIqn/feDe/wmBpVUIBKpZnrADCvXAWqiBI194gvcW+68e2FhbvMbUsOSFI7C0m
 J3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726214582; x=1726819382;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WuKvojtCZg7g14c14RQDvHtxwoqt5QeCZyN0kUqDmA0=;
 b=CHz2GJX9sv8M3r177s4LJh3cG4tlBY6Nx7m3zSts/ASoPBDA2cYAC8Mlkblv4INUt/
 re1UTeVZLSrmr4v6uppVZzlf8H/02YMvAJDQpmYZP6JrYZaNAjgvQHBNT3s+to3nKDuo
 euqOrXA2l8R0CyF3rpODZmc/1c4BVPRq7sJdMb7PfbF5QjmApU3gslyp4peCNJidKd1y
 91yQtbqdve07hf4L8FgxJPiYrfXNBG7ztXs/e/pntqKpjj9Jno96r2+jV4ClwGgRR/co
 9hUIBcaELfpBGvImVQ+92L5Y9e7MudOei1qiEA31bd+xZrXUCV44amvB3kluUGePTJcU
 BFHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+akShN/t44Nawpu5Tx1jk7ewYA1n49wZndzVZuuM3Z8QMaWyV1I81UPlVytJNZPUFQltptnkTjSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLVfYPryb9OupdP/b8WhevuVUX4CS1vNGcUv465hPd4a7RBKnz
 RYiprhZX/WmGR4aFzCpDoCD52HDKgTP3MMAcekMXwQwhBLECuq91N4Ie98e1cjk=
X-Google-Smtp-Source: AGHT+IGjWX8++sbopvCOcrzHWzZMeCZ109rEfa8ItpaKA91i9e/Yn1nIyeUmaUhA27muapNY9/QnTA==
X-Received: by 2002:adf:edc6:0:b0:34d:ae98:4e7 with SMTP id
 ffacd0b85a97d-378d6241ff8mr1021335f8f.41.1726214581833; 
 Fri, 13 Sep 2024 01:03:01 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956761c6sm16112834f8f.61.2024.09.13.01.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 01:03:01 -0700 (PDT)
Message-ID: <17aece51-fe00-4c60-85cc-f89cb14b2e6a@linaro.org>
Date: Fri, 13 Sep 2024 10:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 06/10] drm: bridge: dw_hdmi: Remove previous_mode and
 mode_set
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Christopher Obbard <chris.obbard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240908132823.3308029-1-jonas@kwiboo.se>
 <20240908132823.3308029-7-jonas@kwiboo.se>
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
In-Reply-To: <20240908132823.3308029-7-jonas@kwiboo.se>
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

On 08/09/2024 15:28, Jonas Karlman wrote:
> With the use of adjusted_mode directly from the crtc_state there is no
> longer a need to store a copy in previous_mode, remove it and the now
> unneeded mode_set ops.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: No change
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 19 +------------------
>   1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 1eefa633ff78..6a94376a3da3 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -154,8 +154,6 @@ struct dw_hdmi {
>   		bool enabled;
>   	} phy;
>   
> -	struct drm_display_mode previous_mode;
> -
>   	struct i2c_adapter *ddc;
>   	void __iomem *regs;
>   	bool sink_is_hdmi;
> @@ -165,7 +163,7 @@ struct dw_hdmi {
>   	struct pinctrl_state *default_state;
>   	struct pinctrl_state *unwedge_state;
>   
> -	struct mutex mutex;		/* for state below and previous_mode */
> +	struct mutex mutex;		/* for state below */
>   	enum drm_connector_force force;	/* mutex-protected force state */
>   	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
>   	bool disabled;			/* DRM has disabled our bridge */
> @@ -2894,20 +2892,6 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>   	return mode_status;
>   }
>   
> -static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> -				    const struct drm_display_mode *orig_mode,
> -				    const struct drm_display_mode *mode)
> -{
> -	struct dw_hdmi *hdmi = bridge->driver_private;
> -
> -	mutex_lock(&hdmi->mutex);
> -
> -	/* Store the display mode for plugin/DKMS poweron events */
> -	drm_mode_copy(&hdmi->previous_mode, mode);
> -
> -	mutex_unlock(&hdmi->mutex);
> -}
> -
>   static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>   					  struct drm_bridge_state *old_state)
>   {
> @@ -2971,7 +2955,6 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>   	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
>   	.atomic_enable = dw_hdmi_bridge_atomic_enable,
>   	.atomic_disable = dw_hdmi_bridge_atomic_disable,
> -	.mode_set = dw_hdmi_bridge_mode_set,
>   	.mode_valid = dw_hdmi_bridge_mode_valid,
>   	.detect = dw_hdmi_bridge_detect,
>   	.edid_read = dw_hdmi_bridge_edid_read,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
