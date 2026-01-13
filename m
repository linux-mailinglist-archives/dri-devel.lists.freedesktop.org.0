Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE8D175FF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B722210E476;
	Tue, 13 Jan 2026 08:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wRnVK5u9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5197710E477
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:49:15 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so41792225e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768294154; x=1768898954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=z+kmeu9BWG3ptYdbQvuH2TqOWMqQPxmqsTQl8NkTPwQ=;
 b=wRnVK5u9zpcJd3njGa6MkUACjvPPbwMtQlIU8DavrNWWeQPKC0csAgBt8bvsuWFiEp
 DD5mWRpKBK+4X/CidFKnIU6PcOQCn/Iw9/UM8bSW9lqRHcsCl0J/Hgm2VCmG/optUoia
 Bc/QgzDQe/SemMt5hY2s0xMRr8ajjDQyeUsYfh8Pat21ZSUceQyym38g8cHYYmevQWnp
 sJMFZmKcEjYY+3nVhR71zw3b2cWOubRraHizFc3sG5RtaiJqC/QPOGmObvzau8NvRNQr
 f1jBTr1oRa5hDQ/l9v/faFMcjSt2yYGTtgQmf7MBwJoApQ2Ca5p45A4sHeYh1W0Q2IGf
 xICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768294154; x=1768898954;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+kmeu9BWG3ptYdbQvuH2TqOWMqQPxmqsTQl8NkTPwQ=;
 b=StkOA1Yxm5Vuyxq9FqGByvSjCfkhmLwI81d7MoSQ4scBFsxSErY4In99ETk1lkWGj5
 w/6JQ1gZAUEsUMxf2ah00y/b+ScCbbP5kYQkq8OAOgTFBT06+UrK3BiD2gqxv5PGtBuL
 9icwHDJYTU7KZtZBa181XXOKJSi3NZCZ4c+bRDvW6owHhNRxvPtrGHp6eBm+jiyu0K8h
 qbrzlvB0GAmr0UqSG8+pY8zoOy1iuBEgeDN3IaC/TVqLKb4zguYuW05LcEvorCccWwI8
 IwXeggVBnEse7GyuUryNE0IV7nehAfVD4LAGHXBWHneyYco1LtiutN+VerIzRqnTQ1Vx
 +Qdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfTSH3IKeOchC0SGF9zu4Upq3wXjX+Ezvrmj+cvMioxGdlFl4s9dcB6ujqdnt1RyTF54LH7+JzpSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwM21J8M2T+QL6qDmLEbAQU4Gt24yfA6fcI2W6IHmIZ3Z1AEpoD
 +USeA4Vt9lEabEg7A0evaPBvR0N8cduRFg9lhPnB+sgM+QoiRP7Kc4qzaRQpbeOX2tBQSgvQf8j
 iDSclZng=
X-Gm-Gg: AY/fxX5Fnsbxi/yMNIGfWEfKe+GrXQKV7aOsRK57njwCdzSd5erWvOQlk+hWrrhuvt0
 lczxA6rVtTkhOwkCl3YqUM167IbE5WhYLq536YXzMB5Uyw8Wo8yI/tfnkAT0Bt/XSvRB5La6X3m
 fFR1IbwLJOPjbTIee0nlnS43HLSj+nxV+af6wO+Mynpx8y+8d1x55PKVC0n9YFVs49D5Crh38kz
 kWvqcn431isMExmMBEm8zs4zuk4UGjuju5+zjEbXPhm1u9zX6o9W2S8ZfHS+f+pbZmAwvU+JhzG
 4BAs5LWh7lYH6TA9eWzEi80YGLTtEGIWoq236il2mcsTeJPpMn4kukgnfgylRpsXbHjnbhLDgQN
 OLX+YfOevqBBpbfHILAgDLyov7Ak/N6lqKosL2o8lQRvRfRJvrPxrZVbnH74zLiYFF8JTDnq7zH
 EbjifUndzPkyXnvMWCzbDhmZFfmdgSzMUUnKItjx8=
X-Google-Smtp-Source: AGHT+IFajRC2tJv2tx7bsSZWnn9VXaH2V0McvlO8tC83O4q2IoDW3HGwZG9l++OlHjRvRvvzwiH+Ng==
X-Received: by 2002:a05:600c:840f:b0:477:8b2e:aa7d with SMTP id
 5b1f17b1804b1-47d84b3bdeemr266643595e9.30.1768294153704; 
 Tue, 13 Jan 2026 00:49:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768?
 ([2a01:e0a:3d9:2080::fa42:7768]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f41eb3bsm409168255e9.7.2026.01.13.00.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 00:49:12 -0800 (PST)
Message-ID: <54089819-6e8b-44f3-b7b3-6fcf8eff913b@linaro.org>
Date: Tue, 13 Jan 2026 09:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] drm/panel: panasonic-vvx10f034n00: transition to
 mipi_dsi wrapped functions
To: Avinal Kumar <avinal.xlvii@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20260109155203.34886-1-avinal.xlvii@gmail.com>
 <20260109155203.34886-2-avinal.xlvii@gmail.com>
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
In-Reply-To: <20260109155203.34886-2-avinal.xlvii@gmail.com>
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

On 1/9/26 16:52, Avinal Kumar wrote:
> Changes the panasonic-vvx10f034n00 panel to multi
> style functions for improved error handling.
> 
> Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
> ---
>   .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> index 3c3308fc55df..73c5827a15a4 100644
> --- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> +++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> @@ -44,14 +44,24 @@ static inline struct wuxga_nt_panel *to_wuxga_nt_panel(struct drm_panel *panel)
>   
>   static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_nt)
>   {
> -	return mipi_dsi_turn_on_peripheral(wuxga_nt->dsi);
> +	struct mipi_dsi_multi_context dsi_ctx = {
> +		.dsi = wuxga_nt->dsi
> +	};
> +
> +	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int wuxga_nt_panel_disable(struct drm_panel *panel)
>   {
>   	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
>   
> -	return mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
> +	struct mipi_dsi_multi_context dsi_ctx = {
> +		.dsi = wuxga_nt->dsi
> +	};
> +
> +	mipi_dsi_shutdown_peripheral_multi(&dsi_ctx);
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int wuxga_nt_panel_unprepare(struct drm_panel *panel)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
