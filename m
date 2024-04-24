Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724108B0274
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BD111388C;
	Wed, 24 Apr 2024 06:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S7UsPLfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016F3113885
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:52:35 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so5497758f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 23:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713941554; x=1714546354; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=z+kkCAVJxss4CPk4KOwYcVQMSZDA+8r/AwQ6dh68tMs=;
 b=S7UsPLfekVLH49v508r5nr7htmZ1kdZ5/3wE9dP2Q6pTA2D5HNf9+SQLBjMv4eCzbI
 SSH+PcoTtog61QcjR74Kw0NKzunYhYh0eMpGviZ6fggrcVEV43pVEkaLqIuc1/QyVpH3
 aZ7ulPLIglveqFUDe7b4eb6SMrc75RVxN5P/IVukA2p091wiEY/WhM9ZtvuGffJhJxNe
 gW5UaGowKa3OC5GjyEZhLzkmeTtqPsxu2SITmlikOyDQZx7vDj3pB52+zNLdGsMlSjty
 tpGi1ACstMKjVjHMVuVxwTjVTnsErO+mZWHcfpFxJ+wUPAVUo8/0WZqARq0WRa6vd4BL
 2cUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713941554; x=1714546354;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=z+kkCAVJxss4CPk4KOwYcVQMSZDA+8r/AwQ6dh68tMs=;
 b=cP0rUdmkIuag0drVL5L4rWcbRLI4Wds4gS9p9TxZxbuGotqRlm/fMljrMNVmQunHkc
 I0wlHHnoxzzun9yLJZj/Pp/6uaNPdtJNlWCy06Og/SXPH4Qi/o5hO+HWfusPS9LOYam2
 GBQdT7ZlOMC2nQk+/I4DSYPOwNQhE5awIei767mZr1fBVGGzmKtH1Nms2rseHoOCAVy5
 xGn9iD363hFgMPI0aSbh1EY1AgoLpY1XOXVi7QTcqI6S1Ex5+OV3eS9CRF4NhpdUyv4D
 hFIiYSGSVAsIQ8amvlh5TDd5oKTJPkMr9hFHzKmhcWCCmW6+eDjyT5VcymYD7peDh9C/
 0iGA==
X-Gm-Message-State: AOJu0Yz0NesJ6CIpCQXca4HoiMgHxOSxDgjZuzqxk8PD1x2/8rpWKqfR
 OY8BmqfJXws3BWD2eaiorclYV8kH+YCEIqtGZcpe7EVdIiHV/ko3XPH5lfuwH5c=
X-Google-Smtp-Source: AGHT+IEVWgpM+FkCadzRn9I6amzbQMsnZKpbQYUhVluMjNrwR1wMJqnIGERLUVZnQUC66EUNm7zrKQ==
X-Received: by 2002:adf:cd11:0:b0:349:8ae9:b030 with SMTP id
 w17-20020adfcd11000000b003498ae9b030mr952155wrm.10.1713941553966; 
 Tue, 23 Apr 2024 23:52:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7?
 ([2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a056000124d00b0034b7906c716sm3146747wrx.106.2024.04.23.23.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:52:33 -0700 (PDT)
Message-ID: <c0f90e91-25dc-4912-906b-154c555fa25c@linaro.org>
Date: Wed, 24 Apr 2024 08:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] drm/panel: novatek-nt36672e: stop setting register
 load before disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Kaehlcke <mka@chromium.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
 <20240404-drop-panel-unregister-v1-3-9f56953c5fb9@linaro.org>
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
In-Reply-To: <20240404-drop-panel-unregister-v1-3-9f56953c5fb9@linaro.org>
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

On 04/04/2024 12:08, Dmitry Baryshkov wrote:
> It is pointless to set register load before disabling the register. This
> vote is going to be dropped as soon as the register is disabled. Drop
> these register_set_load calls.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> index c39fe0fc5d69..9a870b9b6765 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> @@ -25,12 +25,6 @@ static const unsigned long regulator_enable_loads[] = {
>   	100000,
>   };
>   
> -static const unsigned long regulator_disable_loads[] = {
> -	80,
> -	100,
> -	100,
> -};
> -
>   struct panel_desc {
>   	const struct drm_display_mode *display_mode;
>   	u32 width_mm;
> @@ -385,20 +379,9 @@ static int nt36672e_power_off(struct nt36672e_panel *ctx)
>   {
>   	struct mipi_dsi_device *dsi = ctx->dsi;
>   	int ret = 0;
> -	int i;
>   
>   	gpiod_set_value(ctx->reset_gpio, 0);
>   
> -	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
> -		ret = regulator_set_load(ctx->supplies[i].consumer,
> -				regulator_disable_loads[i]);
> -		if (ret) {
> -			dev_err(&dsi->dev, "regulator set load failed for supply %s: %d\n",
> -				ctx->supplies[i].supply, ret);
> -			return ret;
> -		}
> -	}
> -
>   	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>   	if (ret)
>   		dev_err(&dsi->dev, "regulator bulk disable failed: %d\n", ret);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
