Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230C9AB18D1
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8034D10EA69;
	Fri,  9 May 2025 15:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dCA/rrcz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FB810EA69
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 15:35:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a0b6aa08e5so2011395f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746804936; x=1747409736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8Lf024pTfan+q9P4HvlL7cyqlLI9Q/+p93cpsiJhSK4=;
 b=dCA/rrczg87augsdPX2/c6n1F5B6bvSns2Jq0mnIqXor1orv2aXlHj/sC4SMNKgONq
 m4KWQn4gqa2pKjo6l5qI3mTjOLQVRLaGGCzXfyTyqKnZug3CnjgthGf9IoXX3cn2GJjp
 PJJa8cYfMyP6Y1JPPPF8lIaQyzk1OYm4ppUmLllhS1n1d+c8azv+KwVDjgwLMtIeHl5g
 axTwy/BN+pHT//fqPb5xmZsPuhMuKWdwg/zOjwR50NmNNzZo+ZA5eT2mh69aP6FkfYMT
 f3PMXistdSdidOpUN90J023fokyK71NCJ49Iqpa88I1coYG6hlrEI/3zK1ZodVAEd4yJ
 y1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746804936; x=1747409736;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8Lf024pTfan+q9P4HvlL7cyqlLI9Q/+p93cpsiJhSK4=;
 b=b4xk0z66UlQjbff54J8bXTBBnlSm5obVK3AG91nsN34rbmbNY0lW8Zh7qeGkn52XDG
 1D27RxAgBTWBLIy7TOzgdlkyQrmUVpzl4AAjeyPcXE6KD91jBYBgYB3YJCf8PHQ+noSp
 Fqwl3UXSs+eUVbLSXH8aV1bMZYSiTIV5G3JkpePhKndLx4ZXFXMJTfVXGps3hHw+hTzt
 q5fR2vnhkPxRNLM5xw1ksecGEeXFvnKwsCrCtK/02lTpdGqJa2EXs82qQJyCfJVUb3PV
 VRyo23MUV+0s2UzdUgid+FnpSIUDV4O277oDUWuBTqUYxkMbw6QryTQ0rjNbiF67VBe7
 e4YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTyRVaCHqH+o4fCYdTduhspibm+53wO0Agnp8e9DWTa7dPHyE8yC4+Q7z4kBiIr34JELBqiKE5eGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycsExHP9UaaEuJlVtGguO738aJ815DC0xpNQRiwzTr+H12An4O
 TZCULLB6zxwwsqx/SdjMf2nB4Uh83v+tYIjHgjmwWp4jKlyH1s3o/90HJ63aDVo=
X-Gm-Gg: ASbGnctuSkA/OIUiUYOThcGTijDZ1eezu/Xmrstec/mCd8aVfPKNuwprO/zmVF5rQqu
 kDKjQ9ag66pEenQ1H3bK3Ea+TPa4TOs+3bQjzUShjT1Dc6rLKjlvdM3SgpkhBnjUb5ne2CoDeIn
 SdSA30i3SPxx4L2BQFjgk+uSu8RKZrnPBum0Z4sqys9FBJBxgStVIq5QdkOcntAurtR7+qT5mT3
 BqotbTRambv6OuWPeMp3nSs2nV4cHanCG8xQYqFcC4T+7w/lrJywUXBiltcGS4gRhbLz6/MUE1E
 vAnOL7vqJXC6MKL7JrqYDk+KN/JqY8rBMLMWudcOwxXDQ/5fsNmWjVBFwlYGcgNPhtTmYWu9KDA
 /oYZ6LTaqsYAqB7U=
X-Google-Smtp-Source: AGHT+IHee8AoQ48Wmh4QoUcNKP20otCxG3keyweeVnCtmCpXbPFY1XMvweqwVZVtf5GlL3zDrP25Eg==
X-Received: by 2002:a5d:5f86:0:b0:39b:f44b:e176 with SMTP id
 ffacd0b85a97d-3a0b99504f7mr7296980f8f.24.1746804936618; 
 Fri, 09 May 2025 08:35:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2?
 ([2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2961sm3570883f8f.45.2025.05.09.08.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 08:35:36 -0700 (PDT)
Message-ID: <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
Date: Fri, 9 May 2025 17:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: I Hsin Cheng <richard120310@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250505184338.678540-1-richard120310@gmail.com>
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
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/05/2025 20:43, I Hsin Cheng wrote:
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
> 
> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Could you add a Fixes tag ?

Thanks,
Neil

> ---
> Changelog:
> 
> v1 -> v2:
> 	- Use 1000ULL instead of casting the type of "mode->clock"
> 	- Refine commit title and message
> 	- Fix the issue for the evaluation inside drm_mode_status
> 	  meson_encoder_hdmi_mode_valid() as well
> 
> Christophe,
> Thanks for your review and your suggestion, I think I should add a tag
> for you,too, but I'm not sure what should I add, if you would be so kind
> please let me know how should I tag you in the patch.
> 
> Best regards,
> I Hsin Cheng
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 7752d8ac85f0..c08fa93e50a3 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>   	unsigned long long venc_freq;
>   	unsigned long long hdmi_freq;
>   
> -	vclk_freq = mode->clock * 1000;
> +	vclk_freq = mode->clock * 1000ULL;
>   
>   	/* For 420, pixel clock is half unlike venc clock */
>   	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> @@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>   	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>   	struct meson_drm *priv = encoder_hdmi->priv;
>   	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
> -	unsigned long long clock = mode->clock * 1000;
> +	unsigned long long clock = mode->clock * 1000ULL;
>   	unsigned long long phy_freq;
>   	unsigned long long vclk_freq;
>   	unsigned long long venc_freq;

