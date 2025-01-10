Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A6A08D91
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E46910F055;
	Fri, 10 Jan 2025 10:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jlocXZhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F3F10F055
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:12:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4368a293339so21668465e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736503947; x=1737108747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=AxsSP/VD9Lx0NclgfZYbaTy2AGtF2Qp2aXxhwUyl1us=;
 b=jlocXZhHY6CAfjspMvxkSY57FTdglvMnJgwR6FTL6062DPC5XhTSKuuJOh9rSmr0im
 xLSUcIRK+eVIGUKNHmK0ci4tHL7Thy6nK6AEal7ZjQeIczVP0gziDwe2n6p8NNSBYFBH
 zq81/XlAcuHZFr4uNNGzM7kJm9eP3OA0uSlZecGSA9kfeomyjFabTrdq49qK/3V1X5Ou
 Bz/QBdFIwaNJB9z4pVezQXwtdyRwbKUFLDN1hYXdsjv78xD+xSOsCbp75s7CO8we+IX5
 vuLxoYYvEccS8+rZcO39I7jlM6hdU4vE2us+QiQR6KAy0xSSeX6f8w4G0SVWiP9EgVxz
 1nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736503947; x=1737108747;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AxsSP/VD9Lx0NclgfZYbaTy2AGtF2Qp2aXxhwUyl1us=;
 b=CoRBE0TpMN1BAEnibixycJ3YtQGUPsBa6FeJRtVOx+TZH//ViU3ljHZW6aW8yWqf8e
 pDhIqcDqA5jVQ0cG5vJY0nJcaO/dTlf36bDfNsOPH2jqGJjkdRs+Fy6VdrXIret7ZQwz
 cx1DW4DYSu1EW5xJ5r+78nnoPtAtq3DNzWkp0KtT4wwGDwdXk30veO9HN+sbapBR5g1S
 083ZX5lmLYakYjBXnC6nnteD7ktwUrI1vCFhIJ3uOvILVL+BQETJeOmU1D+pLCcfNa1b
 w5maPTBiEfCKQQs1oVKox5pNGVJnMIRT6R6yI48R6h6Y5BYo2E3Oy3MvNtvRC47TXp1v
 L2pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrBSeUnEJWUhKUSylt61ax66Y7RnKB2cHqcZtWZmtMSI+Hr3RWTbVsSVJI6wvEHbFqN/BHhVZhB+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/DB0Aqbtb3ikUp9rpmJoLI8JTiUxY8fCV60fSxD5nVulpbRL3
 GLGOot8VqHz7u0jlU0B4tsnjUlZLiou2RhZLQvR4yyhNDgJ5wNVCi3kiqRHLgYA=
X-Gm-Gg: ASbGncsv+s75KbiayN8cgT+ueRFtRI8so1dFdOQOxS7tfj95rkpL02Rlto9gL/ig5Yn
 cJlqy6aRMY7Zl8LAmGhrxNPI84bM0fJywQleiuPb9DXi52BtTSkCCJrt5QZjKDLmcpiro1db5k8
 XHC0uEJJrxZkIhhkiHervUBJ0IOQS8GJbeun4umNhSOYf04KDXQaP7lp06sY4C6cpC4FTRau1ku
 kp808eWgMDeRTKAXeOSwdLyRrmcjLd8GIXUIxq3CrDMtcM2WsSCkdrLarKQzpMNDH1hB04IqpGC
 oRXYL8cDXRQHrSQugivJgS+xj2pNhBIByw==
X-Google-Smtp-Source: AGHT+IEhpHVfYVyL4YwlDVVV7UwQb/jHB96RGA1jR1WVLjzbic871pTiOLZF+y0TWn8ytoY3VVuwnQ==
X-Received: by 2002:a5d:5f85:0:b0:386:3213:5b9b with SMTP id
 ffacd0b85a97d-38a8732c132mr10291514f8f.43.1736503947265; 
 Fri, 10 Jan 2025 02:12:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8?
 ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38428bsm4156433f8f.37.2025.01.10.02.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 02:12:26 -0800 (PST)
Message-ID: <0560bac7-ce4f-4b76-a6af-37ee4747dce9@linaro.org>
Date: Fri, 10 Jan 2025 11:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
To: Maxime Ripard <mripard@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
 <20250110074458.3624094-3-christianshewitt@gmail.com>
 <20250110-flat-quantum-frigatebird-2432f1@houat>
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
In-Reply-To: <20250110-flat-quantum-frigatebird-2432f1@houat>
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

On 10/01/2025 09:36, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Jan 10, 2025 at 07:44:58AM +0000, Christian Hewitt wrote:
>> Playing YUV420 @ 59.94 media causes HDMI output to lose sync
>> with a fatal error reported:
>>
>> [   89.610280] Fatal Error, invalid HDMI vclk freq 593406
>>
>> In meson_encoder_hdmi_set_vclk the initial vclk_freq value is
>> 593407 but YUV420 modes halve the value to 296703.5 and this
>> is stored as int which loses precision by rounding down to
>> 296703. The rounded value is later doubled to 593406 and then
>> meson_encoder_hdmi_set_vclk sets an invalid vclk_freq value
>> and the error triggers during meson_vlkc_setup validation.
>>
>> Fix precision in meson_encoder_hdmi_set_vclk by switching to
>> unsigned long long KHz values instead of int MHz. As values
>> for phy_freq are now more accurate we also need to handle an
>> additional match scenario in meson_vclk_setup.
>>
>> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
>>   drivers/gpu/drm/meson/meson_vclk.c         |  3 +-
>>   2 files changed, 23 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> index 0593a1cde906..fa37cf975992 100644
>> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> @@ -70,12 +70,12 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>>   {
>>   	struct meson_drm *priv = encoder_hdmi->priv;
>>   	int vic = drm_match_cea_mode(mode);
>> -	unsigned int phy_freq;
>> -	unsigned int vclk_freq;
>> -	unsigned int venc_freq;
>> -	unsigned int hdmi_freq;
>> +	unsigned long long vclk_freq;
>> +	unsigned long long phy_freq;
>> +	unsigned long long venc_freq;
>> +	unsigned long long hdmi_freq;
>>   
>> -	vclk_freq = mode->clock;
>> +	vclk_freq = mode->clock * 1000ULL;
> 
> You should be using drm_hdmi_compute_mode_clock() here

Yes in a second time, this simply fixes the actual calculations so it can be
backported to stable kernel to make the feature work again.

And yes at some point we should switch to hdmi helpers in a separate forward
changeset.

Neil

> 
> 
> 
>>   	/* For 420, pixel clock is half unlike venc clock */
>>   	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
>> @@ -85,8 +85,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>>   	phy_freq = vclk_freq * 10;
>>   
>>   	if (!vic) {
>> -		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
>> -				 vclk_freq, vclk_freq, vclk_freq, false);
>> +		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq / 1000ULL,
>> +				 vclk_freq / 1000ULL, vclk_freq / 1000ULL,
>> +				 vclk_freq / 1000ULL, false);
>>   		return;
>>   	}
>>   
>> @@ -107,12 +108,9 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>>   	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>>   		venc_freq /= 2;
>>   
>> -	dev_dbg(priv->dev, "vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
>> -		phy_freq, vclk_freq, venc_freq, hdmi_freq,
>> -		priv->venc.hdmi_use_enci);
>> -
>> -	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
>> -			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
>> +	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq / 1000ULL,
>> +			 vclk_freq / 1000ULL, venc_freq / 1000ULL, hdmi_freq / 1000ULL,
>> +			 priv->venc.hdmi_use_enci);
>>   }
>>   
>>   static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bridge,
>> @@ -122,10 +120,10 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>>   	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>>   	struct meson_drm *priv = encoder_hdmi->priv;
>>   	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
>> -	unsigned int phy_freq;
>> -	unsigned int vclk_freq;
>> -	unsigned int venc_freq;
>> -	unsigned int hdmi_freq;
>> +	unsigned long long vclk_freq;
>> +	unsigned long long phy_freq;
>> +	unsigned long long venc_freq;
>> +	unsigned long long hdmi_freq;
>>   	int vic = drm_match_cea_mode(mode);
>>   	enum drm_mode_status status;
>>   
>> @@ -149,7 +147,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>>   	} else if (!meson_venc_hdmi_supported_vic(vic))
>>   		return MODE_BAD;
>>   
>> -	vclk_freq = mode->clock;
>> +	vclk_freq = mode->clock * 1000ULL;
> 
> And here too.
> 
> Maxime

