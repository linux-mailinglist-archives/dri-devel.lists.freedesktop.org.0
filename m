Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BEE977AA1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFBE10ECAD;
	Fri, 13 Sep 2024 08:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mATffZSY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F4510ECAD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:06:44 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-374c1e5fe79so1360966f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726214803; x=1726819603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TqZBhFB8cimpwzbXgNKnIbtzzD95dG7Ue+nxOw3CDQA=;
 b=mATffZSYuEJ6M7AUraEDSieiwxTN9qZSJSXm3uYwAQZ903VUJ/3iOpXBwRqY4Slzul
 K9GAwA0HL9YLMKwB/kwogavYQxtREbZh3YppJzuIwHy3Rqi0/DsU8FiM9sseeryrTy7r
 RQnIh3R22r5nRbL0XHXEalcEAC2jGosIw9tGa79VjHgl4tTmXrJEmoeqEi65xz+hEjv+
 ByKsLGm7RqFEf9LPH9/IVaQTqmf4HnWta6dWv2udgeKbrDzq8achtDu5tuCJd+j0E5Li
 PgS/ie685JbljPOoa4lvWBfsdyM9bymgpLwlTcDfsx5h7dhgDkwMd2vXsqfaatm4qdCT
 hViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726214803; x=1726819603;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TqZBhFB8cimpwzbXgNKnIbtzzD95dG7Ue+nxOw3CDQA=;
 b=q/9DNbdeJmqzrZ9o6oW8m3MYnvK8WeW851/O/8aMAXorPIJ5shGXzz0kztZyQQfant
 m7G9NRrowQ8Nck4sKS6zH3prBE8bEra6qs1CHYPWau3zIYe50DJiJ6kBxOyy0rfUw5SS
 natOYo9gpUzctn7n8F3bHjlHEqaasR8BL2tgvh2E5iSsQrnpi8bGITzqE52klV3tx0nw
 OZvSgL6tlZWr4HukdzAQrd4ybiYtJChqsfjtTTj4fCsbtd1qQC8jK3lKMk+3tWuJu5xP
 Tqcg5M80hW9+dThicJBHeUOnIHT030qeSbYeszMhcLYmKCJi2l+2OfWiMsiIWWxXskku
 dRcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxTUKco54+xyA9wFlktz+JERQ9ujrPiL9dB7g92EsXe92DqbTCaACbSW++WOCqbkYllO2a/nmyeiM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0KcCIuBS+tjmcmbZIp+5k4/YVFQt/amAROCEzN0jXleQt1ObZ
 +84z4FxPrm22YFFueuBuZQnVO4y4h0h/rWOoceg4v+ybpSAPsvv3dOxAAVUahqs=
X-Google-Smtp-Source: AGHT+IHvWtfMha2KoMqPuP5/ukwrpi/HAR3rzVEdnlOieo8WnEC/635MZTdG6ngo/RnXP69csoG+mw==
X-Received: by 2002:a5d:4e42:0:b0:374:bb2b:e7c4 with SMTP id
 ffacd0b85a97d-378c2d62438mr3242559f8f.57.1726214802860; 
 Fri, 13 Sep 2024 01:06:42 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b16bfb4sm15121095e9.28.2024.09.13.01.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 01:06:42 -0700 (PDT)
Message-ID: <ff114d4e-11f6-4fe7-9963-a30874f4df17@linaro.org>
Date: Fri, 13 Sep 2024 10:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 05/10] drm: bridge: dw_hdmi: Fold poweron and setup
 functions
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
 <20240908132823.3308029-6-jonas@kwiboo.se>
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
In-Reply-To: <20240908132823.3308029-6-jonas@kwiboo.se>
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
> Fold the poweron and setup functions into one function and use the
> adjusted_mode directly from the new crtc_state to remove the need of
> storing previous_mode.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: No change
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 21 ++++++++-------------
>   1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 87fb6fd5cffd..1eefa633ff78 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2236,9 +2236,9 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
>   		    HDMI_IH_MUTE_FC_STAT2);
>   }
>   
> -static int dw_hdmi_setup(struct dw_hdmi *hdmi,
> -			 const struct drm_connector *connector,
> -			 const struct drm_display_mode *mode)
> +static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
> +			   const struct drm_connector *connector,
> +			   const struct drm_display_mode *mode)
>   {
>   	const struct drm_display_info *display = &connector->display_info;
>   	int ret;
> @@ -2378,15 +2378,6 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
>   	hdmi_writeb(hdmi, ih_mute, HDMI_IH_MUTE);
>   }
>   
> -static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
> -{
> -	/*
> -	 * The curr_conn field is guaranteed to be valid here, as this function
> -	 * is only be called when !hdmi->disabled.
> -	 */
> -	dw_hdmi_setup(hdmi, hdmi->curr_conn, &hdmi->previous_mode);
> -}
> -
>   static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
>   {
>   	if (hdmi->phy.enabled) {
> @@ -2936,15 +2927,19 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>   {
>   	struct dw_hdmi *hdmi = bridge->driver_private;
>   	struct drm_atomic_state *state = old_state->base.state;
> +	const struct drm_display_mode *mode;
>   	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
>   
>   	connector = drm_atomic_get_new_connector_for_encoder(state,
>   							     bridge->encoder);
> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
>   
>   	mutex_lock(&hdmi->mutex);
>   	hdmi->disabled = false;
>   	hdmi->curr_conn = connector;
> -	dw_hdmi_poweron(hdmi);
> +	dw_hdmi_poweron(hdmi, connector, mode);
>   	dw_hdmi_update_phy_mask(hdmi);
>   	handle_plugged_change(hdmi, true);
>   	mutex_unlock(&hdmi->mutex);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
