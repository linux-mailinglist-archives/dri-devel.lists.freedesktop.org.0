Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3009146CA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406DA10E3DE;
	Mon, 24 Jun 2024 09:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gEmfiUay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3267B10E3DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:57:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-36532d177a0so2563417f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719223020; x=1719827820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=lernVVREgJ6DsB5CkgGs6God1E29++TaTF36V6rTHrI=;
 b=gEmfiUayRkW4SiG6sWO7DR62bM83CTDnp+qxLrUyYr2AcnyVE8i6Rf+nZKtlKcTtdH
 kDQo0mR64XQz91zShm4BGflQWFFGDx9jE3jZINu+E/rm6GjCRSfQq9e8JUUF6F9rGvkh
 vgYiMoMZE9rmeUT/wqECy+hGpF8Gt2v58EK4s/mrgEIZfqgLhYDbkOJw8q/2sLLpTD4G
 MxuZNewDWOt0X9KE/iLxPP4emuH9e2S004Lmj6bXEMrPw6bJofP9/KwDMhva5VM5Ro/w
 YMCBdnUt9AlIiXQH+w2msHyCwjuqnb/R09ADRxhsYk1UArs3WV3dgOSdE7pCEgl+4Yxe
 seYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719223020; x=1719827820;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lernVVREgJ6DsB5CkgGs6God1E29++TaTF36V6rTHrI=;
 b=gDjv1iZhbcA6Qq9/VHmbC5US7rBBpKa4obBh+bzEpLhwGDMyHH/CNqNdoVMa2Iin43
 jKi8Ga3PxIV45fuvkiVpUwG5RWPWygZPE7vPnV4AQsJj+Z++y/sk+y0Dpr4EXOJafFMj
 2UJwHDi32JFw8EO3Xlg3PJEejsFNngj2wgifFoHCr9SI5HLL84dXI7f/Uo53tGxN9lF9
 Lor2/HqqbzKf5WUCvBEkw/wnhKK+SiTzQA3WPzKo3J8s8yVnNm+efDsV+P5mrfGN/B0a
 ZdI6kNXRDH/E0dlAg+2Jkw9Bsa3qGJilIryUstE8s+hIQMpfb0cN8xW8PLJcu6zJl+qm
 bquQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwzdH93xFZsYBhMpXeCJ03ToEdd6Zv4/vC/GMg9FhNikiBOqJeTMLYqhDz/kKDPdlwQ8ZE70sTOvM3LCq9Zn5rDOVKllA9Q7tf2MuMxxMU
X-Gm-Message-State: AOJu0YzHmJh6Z1UCiP/taQiOEAxK8KKMZhTFLmUT18w43gstGq9pkQvI
 WNFmBPOpMPFBSBb6XGTthsCeDQGbw1xgSTlNMfTphX0V+6YcPWW4AtYfecIA5ck=
X-Google-Smtp-Source: AGHT+IE0XLB9h1oLwiIgfMkryF3MrNQ1FAsESgNrsTtKryKlwcLQOoE4D97yauPlmOXcsT4+eV6a/Q==
X-Received: by 2002:a5d:58ed:0:b0:362:f291:6f97 with SMTP id
 ffacd0b85a97d-366e4ed2eb5mr2997487f8f.18.1719223020045; 
 Mon, 24 Jun 2024 02:57:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74?
 ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366eef51a14sm3169040f8f.83.2024.06.24.02.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 02:56:59 -0700 (PDT)
Message-ID: <2759176e-031b-4c63-8dc8-b017a63f00b0@linaro.org>
Date: Mon, 24 Jun 2024 11:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/8] drm: bridge: dw_hdmi: Call poweron/poweroff from
 atomic enable/disable
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240611155108.1436502-1-jonas@kwiboo.se>
 <20240611155108.1436502-2-jonas@kwiboo.se>
 <dd6f7a67-e338-4c08-8520-8e85a953834b@linaro.org>
 <af41d129-53ce-4875-bee2-c331aa47c248@kwiboo.se>
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
In-Reply-To: <af41d129-53ce-4875-bee2-c331aa47c248@kwiboo.se>
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

On 24/06/2024 11:41, Jonas Karlman wrote:
> Hi Neil,
> 
> On 2024-06-24 11:23, Neil Armstrong wrote:
>> On 11/06/2024 17:50, Jonas Karlman wrote:
>>> Change to only call poweron/poweroff from atomic_enable/atomic_disable
>>> ops instead of trying to keep a bridge_is_on state and poweron/off in
>>> the hotplug irq handler.
>>>
>>> A benefit of this is that drm mode_config mutex is always held at
>>> poweron/off, something that may reduce the need for our own mutex.
>>>
>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>> ---
>>>    drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 33 ++---------------------
>>>    1 file changed, 2 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> index 9f2bc932c371..34bc6f4754b8 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -172,7 +172,6 @@ struct dw_hdmi {
>>>    	enum drm_connector_force force;	/* mutex-protected force state */
>>>    	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
>>>    	bool disabled;			/* DRM has disabled our bridge */
>>> -	bool bridge_is_on;		/* indicates the bridge is on */
>>>    	bool rxsense;			/* rxsense state */
>>>    	u8 phy_mask;			/* desired phy int mask settings */
>>>    	u8 mc_clkdis;			/* clock disable register */
>>> @@ -2383,8 +2382,6 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
>>>    
>>>    static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
>>>    {
>>> -	hdmi->bridge_is_on = true;
>>> -
>>>    	/*
>>>    	 * The curr_conn field is guaranteed to be valid here, as this function
>>>    	 * is only be called when !hdmi->disabled.
>>> @@ -2398,30 +2395,6 @@ static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
>>>    		hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
>>>    		hdmi->phy.enabled = false;
>>>    	}
>>> -
>>> -	hdmi->bridge_is_on = false;
>>> -}
>>> -
>>> -static void dw_hdmi_update_power(struct dw_hdmi *hdmi)
>>> -{
>>> -	int force = hdmi->force;
>>> -
>>> -	if (hdmi->disabled) {
>>> -		force = DRM_FORCE_OFF;
>>> -	} else if (force == DRM_FORCE_UNSPECIFIED) {
>>> -		if (hdmi->rxsense)
>>> -			force = DRM_FORCE_ON;
>>> -		else
>>> -			force = DRM_FORCE_OFF;
>>> -	}
>>
>> This means we always poweron the bridge even if rxsense is false ?
> 
> If I follow the logic there should not be any difference, beside that
> power on now only happen in atomic_enable instead of sometime in irq
> handler.
> 
> hdmi->rxsense is set to true based on hpd in dw_hdmi_setup_rx_sense().
> For both meson and dw-hdmi this means HPD=1 and not rxsense=1.

Yeah I know, I was worried for other platforms using rxsense

> 
> drm core will call the force/detect ops and enable/disable based on
> forced/HPD state, so I am not expecting any difference in how this
> currently works.
> 
> This change to only poweron/setup in atomic_enable should also fix
> issues/situations where dw-hdmi was poweron too early during bootup in
> irq handler, before the drm driver was fully probed.

Hmm, but I thought the code wouldn't poweron the bridge is rxsense was 0
even if a mode was set, this won't work like this anymore right ?

Neil

> 
> Regards,
> Jonas
> 
>>
>> Neil
>>
>>> -
>>> -	if (force == DRM_FORCE_OFF) {
>>> -		if (hdmi->bridge_is_on)
>>> -			dw_hdmi_poweroff(hdmi);
>>> -	} else {
>>> -		if (!hdmi->bridge_is_on)
>>> -			dw_hdmi_poweron(hdmi);
>>> -	}
>>>    }
>>>    
>>>    /*
>>> @@ -2546,7 +2519,6 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
>>>    
>>>    	mutex_lock(&hdmi->mutex);
>>>    	hdmi->force = connector->force;
>>> -	dw_hdmi_update_power(hdmi);
>>>    	dw_hdmi_update_phy_mask(hdmi);
>>>    	mutex_unlock(&hdmi->mutex);
>>>    }
>>> @@ -2955,7 +2927,7 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>>>    	mutex_lock(&hdmi->mutex);
>>>    	hdmi->disabled = true;
>>>    	hdmi->curr_conn = NULL;
>>> -	dw_hdmi_update_power(hdmi);
>>> +	dw_hdmi_poweroff(hdmi);
>>>    	dw_hdmi_update_phy_mask(hdmi);
>>>    	handle_plugged_change(hdmi, false);
>>>    	mutex_unlock(&hdmi->mutex);
>>> @@ -2974,7 +2946,7 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>>>    	mutex_lock(&hdmi->mutex);
>>>    	hdmi->disabled = false;
>>>    	hdmi->curr_conn = connector;
>>> -	dw_hdmi_update_power(hdmi);
>>> +	dw_hdmi_poweron(hdmi);
>>>    	dw_hdmi_update_phy_mask(hdmi);
>>>    	handle_plugged_change(hdmi, true);
>>>    	mutex_unlock(&hdmi->mutex);
>>> @@ -3073,7 +3045,6 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
>>>    		if (hpd)
>>>    			hdmi->rxsense = true;
>>>    
>>> -		dw_hdmi_update_power(hdmi);
>>>    		dw_hdmi_update_phy_mask(hdmi);
>>>    	}
>>>    	mutex_unlock(&hdmi->mutex);
>>
> 

