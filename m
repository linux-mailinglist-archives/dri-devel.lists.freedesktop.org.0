Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4580C877BB0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 09:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17CF10EBE0;
	Mon, 11 Mar 2024 08:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MkMEiD6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7569A10E8D2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:29:01 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33e9def4a6dso79063f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710145740; x=1710750540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zQAXL321JQwnIXqnCCeFivDaPKXAJJGBvxgE+6Zz8oU=;
 b=MkMEiD6IlmxFV4xNZFuUj76A6JGYRyfKGxIGuvKkWe8ndxPLTfqP5tEve+jWPLfCGf
 XcltF+9cVzLoLBE63DrtVgAOUeTq/8M+AoNQmtG0GbT0VUQQwIumh3ofyRtgYt5GPXUM
 SbSU3UdyMy9mSxiKIKU8PpXco5CJuCuis1MpCeL555Q0qbBI4XNs0tad1cNWo6ZDL5sc
 6btymYV/AlcEpQp4Ngn9TZtwkGnKkbC80QcevAho58anHuZuNJEFaaKq90+I3sNuxLGK
 Hq+SR05hioTsSj4/I2ySBdg+7VfrHpTEQUHQmHJuFAl4hF5ElJ/15dpU81OoSbysajbc
 lB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710145740; x=1710750540;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zQAXL321JQwnIXqnCCeFivDaPKXAJJGBvxgE+6Zz8oU=;
 b=w9PkZr6wvLRN+qLrWVeZ6eutmA4BGThyx27smIqChooFwPVOUXltass5erDT12jwjU
 TiIZPGhCXbi6YbXP0NJYOWIDS4UTKtiO4RW7SdeTODXAl0GNsbPjdYVXKfFzEYjho0Ub
 DOW/RLBUb5nay6PgbePiCrSEzNs20GgVRzjzPRCXzEHtlBS73PJ6abyZTZzXuXRiGkQ6
 aK+yvYeIEEcGEExIe6gnA/IGcN1wBjuRwuRdxm/++roGrUPyDfVB/STqAuJHY0WQN8z+
 VVJQfrVLW8yh7wv5WWa/Ns30gKKcFi2/0Z5fhXtlj5FG5k6gWLJUZhNKdCbZndnhwXqB
 uGOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0moeZjKBDRMyb1hx1YVtcxRAgXZoCauNEGgDIssBoZ7pCR0b/+J6Dryzr7htBgkGLxM8/evkfQPpShiUVelkInc5EgZyOYd8Gz2WsekFx
X-Gm-Message-State: AOJu0YxeknWs44bqFHPAZ3AMfSWlW+Sq+wkn8194qjp0pnFZcK2lNmPB
 t6PFz9NIwORYW7WE/fjNbP8l/ma9ibXzoQ3YqbrkHjHDnZrajLMQsLuHyOrMQKQ=
X-Google-Smtp-Source: AGHT+IHEN3loKqI+Ct2m21UTsJhhjV14Q7edCHB7+TEqeh9C/JUqcyFDfyQ98UIohTx4OLx3X8uCeQ==
X-Received: by 2002:adf:e389:0:b0:33e:12a2:297f with SMTP id
 e9-20020adfe389000000b0033e12a2297fmr5113096wrm.41.1710145739483; 
 Mon, 11 Mar 2024 01:28:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48be:feb9:192b:f402?
 ([2a01:e0a:982:cbb0:48be:feb9:192b:f402])
 by smtp.gmail.com with ESMTPSA id
 bx27-20020a5d5b1b000000b0033e7eba040dsm2892975wrb.97.2024.03.11.01.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 01:28:58 -0700 (PDT)
Message-ID: <e71f3596-65de-47e7-a23d-700111f55ee4@linaro.org>
Date: Mon, 11 Mar 2024 09:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 7/8] drm/bridge: lt9611uxc: use int for holding number of
 modes
Content-Language: en-US, fr
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>
References: <cover.1709913674.git.jani.nikula@intel.com>
 <ed97f4f036263cdc4f34330cef91214970f99a77.1709913674.git.jani.nikula@intel.com>
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
In-Reply-To: <ed97f4f036263cdc4f34330cef91214970f99a77.1709913674.git.jani.nikula@intel.com>
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

On 08/03/2024 17:03, Jani Nikula wrote:
> lt9611uxc_connector_get_modes() propagates the return value of
> drm_edid_connector_add_modes() but stores the int temporarily in an
> unsigned int. Use the correct type.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index bcf8bccd86d6..f4f593ad8f79 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -294,8 +294,8 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
>   static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
>   {
>   	struct lt9611uxc *lt9611uxc = connector_to_lt9611uxc(connector);
> -	unsigned int count;
>   	const struct drm_edid *drm_edid;
> +	int count;
>   
>   	drm_edid = drm_bridge_edid_read(&lt9611uxc->bridge, connector);
>   	drm_edid_connector_update(connector, drm_edid);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
