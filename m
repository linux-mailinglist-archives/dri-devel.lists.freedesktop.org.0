Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90848914628
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B833B10E3CA;
	Mon, 24 Jun 2024 09:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vxBlYsPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A4110E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:20:21 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4217c7eb6b4so33959265e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719220820; x=1719825620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KbmsdFqXhQhvnEQu5Ix9nA78YzXIrqpXyv4OIIIx9Kw=;
 b=vxBlYsPNTvQrR30cvBOcb80XfHpbt3wcY3dKG7OCO4ht0qKyd4BSbvrTCx688O1NJ1
 HpnMwlv6+eikvcqOYBi7ahBPFMqPgpyOSgve+7xZa39EISDr10CbzcngWmRJuIwoOU3L
 5OAg9JnFwFi/aeacpBOhh5mr2sG+xZKMZbLDwaMyYoal/HvFUOWZ11eLImhkMnkr+JJP
 96LzTfszwNhVG1E9oHz5HAl1ot63is9ZcWI8rC/iaNRu5dPBCfA0Sj+rK7CD5Y0Ne6/C
 dkS4+HXRk6jzadqoyYE6D/NGA9TrFxsvzz4qCgASAK0apiAWzFe+W9lKjmCI2a5QLPwU
 rWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719220820; x=1719825620;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KbmsdFqXhQhvnEQu5Ix9nA78YzXIrqpXyv4OIIIx9Kw=;
 b=rCXCIVTUmEDFPoyVL6LmeuTfvmfBu4Yfj2nZxLEa2O20k84ZmPFyqqz4+917YGfeQZ
 ZmWkdbU7PrMVRiy0N08pc2o0JKjxKkIaeEj2pgyKyp6ikysEk/MnI40bqB28a618l4tN
 1PNfnGXtbf6UZHdL7FIoW2ClhTqGVYSvCKKc1OheDTdErhvvt1DqxJ7aAZw5lmQ5G8M+
 5XQDXqH/szgr8ZSmrGakheaXKgFbWri5WYDFui4YZh2FQTEmbTHF2VEOUrKCp7iSE6Ew
 sAyZdx41doQLmnjmQi37xUG1iNFu6ZY18Tdlw9WB7cW2WY7DLRizSnYm6XJpg4azPQy/
 XrCQ==
X-Gm-Message-State: AOJu0Yznbdpps7jfrLgP3VHicaVO2z+ScJviRjZR1n625WwAxCEybMg4
 z9p45aYLNqT0XbqIXqr13ZkGNTkS38bjNemxTV504hJe5cNmajtki+FHE+F1gVU=
X-Google-Smtp-Source: AGHT+IFrQuBGPmb21bSe4gE+PEpAMSIhvu1ChdgH/Jh3NGW+9L0wjfpeM1gpbYLXuT+fpdI6/DoYiA==
X-Received: by 2002:a05:600c:2152:b0:424:8838:364f with SMTP id
 5b1f17b1804b1-4248cc350b1mr26340595e9.22.1719220820016; 
 Mon, 24 Jun 2024 02:20:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74?
 ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247fe1b5desm149043575e9.4.2024.06.24.02.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 02:20:19 -0700 (PDT)
Message-ID: <2bb62caa-e213-42fa-ac9c-4118f66aee9e@linaro.org>
Date: Mon, 24 Jun 2024 11:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/8] drm: bridge: dw_hdmi: Remove cec_notifier_mutex
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240611155108.1436502-1-jonas@kwiboo.se>
 <20240611155108.1436502-7-jonas@kwiboo.se>
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
In-Reply-To: <20240611155108.1436502-7-jonas@kwiboo.se>
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

On 11/06/2024 17:50, Jonas Karlman wrote:
> With CEC phys addr invalidation moved away from the irq handler there is
> no longer a need for cec_notifier_mutex, remove it.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0814ca181f04..256e00a97a9a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -189,7 +189,6 @@ struct dw_hdmi {
>   	void (*enable_audio)(struct dw_hdmi *hdmi);
>   	void (*disable_audio)(struct dw_hdmi *hdmi);
>   
> -	struct mutex cec_notifier_mutex;
>   	struct cec_notifier *cec_notifier;
>   
>   	hdmi_codec_plugged_cb plugged_cb;
> @@ -2459,11 +2458,8 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>   
>   	status = dw_hdmi_detect(hdmi);
>   
> -	if (status == connector_status_disconnected) {
> -		mutex_lock(&hdmi->cec_notifier_mutex);
> +	if (status == connector_status_disconnected)
>   		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> -		mutex_unlock(&hdmi->cec_notifier_mutex);
> -	}
>   
>   	return status;
>   }
> @@ -2577,9 +2573,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>   	if (!notifier)
>   		return -ENOMEM;
>   
> -	mutex_lock(&hdmi->cec_notifier_mutex);
>   	hdmi->cec_notifier = notifier;
> -	mutex_unlock(&hdmi->cec_notifier_mutex);
>   
>   	return 0;
>   }
> @@ -2877,10 +2871,8 @@ static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
>   {
>   	struct dw_hdmi *hdmi = bridge->driver_private;
>   
> -	mutex_lock(&hdmi->cec_notifier_mutex);
>   	cec_notifier_conn_unregister(hdmi->cec_notifier);
>   	hdmi->cec_notifier = NULL;
> -	mutex_unlock(&hdmi->cec_notifier_mutex);
>   }
>   
>   static enum drm_mode_status
> @@ -3303,7 +3295,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   
>   	mutex_init(&hdmi->mutex);
>   	mutex_init(&hdmi->audio_mutex);
> -	mutex_init(&hdmi->cec_notifier_mutex);
>   	spin_lock_init(&hdmi->audio_lock);
>   
>   	ret = dw_hdmi_parse_dt(hdmi);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
