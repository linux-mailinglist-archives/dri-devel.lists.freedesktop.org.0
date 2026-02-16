Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNUbBHdCk2kA3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:14:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8B4145FC0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B498710E3B2;
	Mon, 16 Feb 2026 16:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="heNUzaiL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47BB10E3B0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:14:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4362507f396so3248288f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771258481; x=1771863281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=YBOE+Anr8vUR4aIW1HzZup3vQzErzRhY8eC+0tt761g=;
 b=heNUzaiLM8eTIRP2YBq0CDS9nZr2PwxyZj65A4H45wJyuHZ+DqgYPmgus4qyLzjOWk
 djmjm4uVqvwaPR6BRLe1/o2JoQurgyNm2AcSYz/ylWrREAZ6mFYjwFUKh4L+k2JJFPMA
 zsdCcmzn20+xY3MdJJfzbpaprYyBao3pdpys9UpAS+KbFVWbM8hPHlxZwNVFUCmnKrID
 LIdbXeNtDORnjpyPHhqj8/b9oTJsaC1Ja1HEXPHaxhFnYVyPYOvMj54MiijPz1XC7Cgr
 4BhgWyLG0mTeLFE1DuZTt+0E8zYjv7JfqEshWcIFILdEHr/vYG3CV/0DzfFbLhfb9Nrp
 46YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771258481; x=1771863281;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YBOE+Anr8vUR4aIW1HzZup3vQzErzRhY8eC+0tt761g=;
 b=mVPva6RYepme850uaIUTJaSwZ4oZIGhkkeJwjc4N5UO9mDHNuptw8G+tGCOeh44Azz
 qXCUgMUH5KzO2ir80warhoD9hR3ha4Elh58YJhyRf0iZFlC0O1CoRr8bgLekQdeK3Vct
 YpAKDJnAeswt73CLwhZHUznLyCH+JVLOHKaQuaDdvPSfrI0FZ2tu74T9j3hsBdJ9diGU
 PY4pcKsvWUFi9GvqPx25564tQkxphjz73Bmd3HjNSoOFFX/TI3iJmqTO7U86/qDkxYal
 T6+xfqFJX9BlKrxjEJUl4vyGfY2u2YtLyhOrah9k17apxTCUijmtxoNH9ytVfGj0DQVB
 Ns8Q==
X-Gm-Message-State: AOJu0Yzz8RilXYqZaHAFA1FYIlHB3X2r7xWtGltf9Aawj5ypb/TDXDZL
 O8ZX0xUAvpxysjQjjWFvaowX67A/VM91tZrS/w7295d1awSzRlOP0ZVIvHEC7hvT7pA=
X-Gm-Gg: AZuq6aK1t+CyjRhXDfYki7DQiRKgqZkRRX9mqG3CbiadsJ2XloDj4mTJeukwgK3LLkJ
 U5L+8xQIGSm4XFQY6f1bFnoGX2Ozs636uzRmYy32DKZ7eVxO3iZdy9t4wJuSCX6cgnddLuLL6Zr
 Uysu4s6UdVerA9NSnRXn2VCt6eIAbZWUiB3uavA5g+mTRVvLQvnjVGV/oTNubtfGFouige09CTy
 2qrMn8CYk5dlVsUiA6NUsn1ZHuBg+jWfm4Xjjjoyinm1q/x9KeJK+veaKACjVP9orLy2CiEIISx
 M3bDDINPbsvq7uonZTeFzvKkBVOh60pvPn4az3VkwBHVG3Fp7G+7YIWqCvNzsOGqHDXdq3y844l
 X1kdxyeiBP/RB9epoM0iZ8JcKki+9I3SeSgVWsjjIYACqpMKZ5wYhsq6klAmvsGsEP3KrXQDTle
 cg25rQtdET/Gn+WdzMJm0e+IAASaaZOPQ+cVlUjxFKIapp3VMtIB+ckjhuzqpkbI7BxFNVem1to
 U9S5Q==
X-Received: by 2002:a05:6000:430c:b0:437:677b:4a24 with SMTP id
 ffacd0b85a97d-437978cdde0mr21787157f8f.15.1771258481138; 
 Mon, 16 Feb 2026 08:14:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a?
 ([2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8209sm29732239f8f.30.2026.02.16.08.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:14:40 -0800 (PST)
Message-ID: <6f8896e1-6bf9-4997-9bf3-d5fffbdd4701@linaro.org>
Date: Mon, 16 Feb 2026 17:14:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 3/5] drm/panel: r61307/r69328: remove redundant checks
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260215085140.20499-1-clamor95@gmail.com>
 <20260215085140.20499-4-clamor95@gmail.com>
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
In-Reply-To: <20260215085140.20499-4-clamor95@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 6B8B4145FC0
X-Rspamd-Action: no action

On 2/15/26 09:51, Svyatoslav Ryhel wrote:
> This is now done by the DRM framework itself.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-renesas-r61307.c | 10 ----------
>   drivers/gpu/drm/panel/panel-renesas-r69328.c | 10 ----------
>   2 files changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> index 45afa44af114..2cc3bd66d6d4 100644
> --- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
> +++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
> @@ -35,8 +35,6 @@ struct renesas_r61307 {
>   
>   	struct gpio_desc *reset_gpio;
>   
> -	bool prepared;
> -
>   	bool dig_cont_adj;
>   	bool inversion;
>   	u32 gamma;
> @@ -92,9 +90,6 @@ static int renesas_r61307_prepare(struct drm_panel *panel)
>   	struct device *dev = &priv->dsi->dev;
>   	int ret;
>   
> -	if (priv->prepared)
> -		return 0;
> -
>   	ret = regulator_enable(priv->vcc_supply);
>   	if (ret) {
>   		dev_err(dev, "failed to enable vcc power supply\n");
> @@ -113,7 +108,6 @@ static int renesas_r61307_prepare(struct drm_panel *panel)
>   
>   	renesas_r61307_reset(priv);
>   
> -	priv->prepared = true;
>   	return 0;
>   }
>   
> @@ -175,9 +169,6 @@ static int renesas_r61307_unprepare(struct drm_panel *panel)
>   {
>   	struct renesas_r61307 *priv = to_renesas_r61307(panel);
>   
> -	if (!priv->prepared)
> -		return 0;
> -
>   	usleep_range(10000, 11000);
>   
>   	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> @@ -187,7 +178,6 @@ static int renesas_r61307_unprepare(struct drm_panel *panel)
>   	usleep_range(2000, 3000);
>   	regulator_disable(priv->vcc_supply);
>   
> -	priv->prepared = false;
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> index b40bfd702fac..b5fe127634ae 100644
> --- a/drivers/gpu/drm/panel/panel-renesas-r69328.c
> +++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
> @@ -33,8 +33,6 @@ struct renesas_r69328 {
>   	struct regulator *vdd_supply;
>   	struct regulator *vddio_supply;
>   	struct gpio_desc *reset_gpio;
> -
> -	bool prepared;
>   };
>   
>   static inline struct renesas_r69328 *to_renesas_r69328(struct drm_panel *panel)
> @@ -56,9 +54,6 @@ static int renesas_r69328_prepare(struct drm_panel *panel)
>   	struct device *dev = &priv->dsi->dev;
>   	int ret;
>   
> -	if (priv->prepared)
> -		return 0;
> -
>   	ret = regulator_enable(priv->vdd_supply);
>   	if (ret) {
>   		dev_err(dev, "failed to enable vdd power supply\n");
> @@ -77,7 +72,6 @@ static int renesas_r69328_prepare(struct drm_panel *panel)
>   
>   	renesas_r69328_reset(priv);
>   
> -	priv->prepared = true;
>   	return 0;
>   }
>   
> @@ -142,9 +136,6 @@ static int renesas_r69328_unprepare(struct drm_panel *panel)
>   {
>   	struct renesas_r69328 *priv = to_renesas_r69328(panel);
>   
> -	if (!priv->prepared)
> -		return 0;
> -
>   	gpiod_set_value_cansleep(priv->reset_gpio, 1);
>   
>   	usleep_range(5000, 6000);
> @@ -152,7 +143,6 @@ static int renesas_r69328_unprepare(struct drm_panel *panel)
>   	regulator_disable(priv->vddio_supply);
>   	regulator_disable(priv->vdd_supply);
>   
> -	priv->prepared = false;
>   	return 0;
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
