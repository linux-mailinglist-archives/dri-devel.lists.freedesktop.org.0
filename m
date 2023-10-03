Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0307B6A59
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 15:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6517910E05D;
	Tue,  3 Oct 2023 13:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B9010E05D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 13:22:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-327be5fe4beso871064f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696339340; x=1696944140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=BPhEMScslRMaYaqRO+dwG2HnFAyJ6EQmjoVhDMsvm2g=;
 b=C4BeFNC/SbG3wDsTPXFsQN/B+WQuOnmIoqXUt35RUkU6pzfKbcQeM2Xak4zzna4RWg
 4KI3zxtIoM6Ehv7hQifbhpoRkOTqA50cbSySheE7XXA0FW1pnjQ7QEgmWlUaaTuEmr3e
 XBDNOfdq9vct6eeRdd/Q73PK0IPw2RMlBjwiMA8fsNPMZ7RW6MEpVMv/Qz9sbkMTtNyG
 zL6BKeZGS1j6dlk+BwwK0zGYtM3w7vQhBO5WysLOBpHtBpQUjuWdDklH5w3Twqc79rVp
 oJuxLGdMtvV0pnHqDnCqhFCyMwP5NrSTY+fJvsxGGfllfGeK+JTU8oKibV8342qbReB9
 7OfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696339340; x=1696944140;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BPhEMScslRMaYaqRO+dwG2HnFAyJ6EQmjoVhDMsvm2g=;
 b=SdYgTmqPvTpiAeIlnmscgmZuBviaZhk1oP6yWBIC1ROeciYd/vVBR+po21b6WhiK2m
 3pCJmRiCQkCuOj9SlxOMBMzyLxJ86l+f1Ur9e/RHYsh53numezQux7pAm/0gKl/rD9Wm
 3vccOE7NUha2zi96CtWFSl5DPZJM9+0ZGSeMdSf0gjoUehucndwXCx+skxx9jIJhQIYC
 j92weRZZ+EQIodu7LPxUedN413Cs3HFTGcfJUxSk7UY3Gu6l02LsHXndW3d4n5z6TmXT
 D9FWO1Hp1+tSAmHUnf+czS/o9eeuwpXnfqkRuFg02pYOgJ+nliSgQjfLi6nDPMZwHwQr
 Oo9A==
X-Gm-Message-State: AOJu0YwdU2TavNZdGDvQceB8canAhCIRolAiydfOXxwIt62u5wCvLklx
 7ompLrufSlePvTaxE7HdtK9DrQ==
X-Google-Smtp-Source: AGHT+IFDM9mm4RExiIDQOdgnZFNqOULSOor4UvfTWPqFV+FOp96KsWwjv9wciLPT3qCL81igyWfz8g==
X-Received: by 2002:adf:eed2:0:b0:31f:fedd:83ad with SMTP id
 a18-20020adfeed2000000b0031ffedd83admr11897768wrp.4.1696339340083; 
 Tue, 03 Oct 2023 06:22:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e31a:fe1c:e925:9858?
 ([2a01:e0a:982:cbb0:e31a:fe1c:e925:9858])
 by smtp.gmail.com with ESMTPSA id
 f8-20020adfdb48000000b0031ff89af0e4sm1568213wrj.99.2023.10.03.06.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Oct 2023 06:22:19 -0700 (PDT)
Message-ID: <bd3bc4bc-b684-4bbd-82cf-c59797ba21cf@linaro.org>
Date: Tue, 3 Oct 2023 15:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Associate DSI device lifetime
 with auxiliary device
Content-Language: en-US, fr
To: Stephen Boyd <swboyd@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>
References: <20231002235407.769399-1-swboyd@chromium.org>
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
In-Reply-To: <20231002235407.769399-1-swboyd@chromium.org>
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
Cc: Maxime Ripard <maxime@cerno.tech>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/10/2023 01:54, Stephen Boyd wrote:
> The kernel produces a warning splat and the DSI device fails to register
> in this driver if the i2c driver probes, populates child auxiliary
> devices, and then somewhere in ti_sn_bridge_probe() a function call
> returns -EPROBE_DEFER. When the auxiliary driver probe defers, the dsi
> device created by devm_mipi_dsi_device_register_full() is left
> registered because the devm managed device used to manage the lifetime
> of the DSI device is the parent i2c device, not the auxiliary device
> that is being probed.
> 
> Associate the DSI device created and managed by this driver to the
> lifetime of the auxiliary device, not the i2c device, so that the DSI
> device is removed when the auxiliary driver unbinds. Similarly change
> the device pointer used for dev_err_probe() so the deferred probe errors
> are associated with the auxiliary device instead of the parent i2c
> device so we can narrow down future problems faster.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f448b903e190..84148a79414b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -692,7 +692,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
>   	return container_of(bridge, struct ti_sn65dsi86, bridge);
>   }
>   
> -static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
> +static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86 *pdata)
>   {
>   	int val;
>   	struct mipi_dsi_host *host;
> @@ -707,7 +707,7 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
>   	if (!host)
>   		return -EPROBE_DEFER;
>   
> -	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
> +	dsi = devm_mipi_dsi_device_register_full(&adev->dev, host, &info);
>   	if (IS_ERR(dsi))
>   		return PTR_ERR(dsi);
>   
> @@ -725,7 +725,7 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
>   
>   	pdata->dsi = dsi;
>   
> -	return devm_mipi_dsi_attach(dev, dsi);
> +	return devm_mipi_dsi_attach(&adev->dev, dsi);
>   }
>   
>   static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> @@ -1298,9 +1298,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>   	struct device_node *np = pdata->dev->of_node;
>   	int ret;
>   
> -	pdata->next_bridge = devm_drm_of_get_bridge(pdata->dev, np, 1, 0);
> +	pdata->next_bridge = devm_drm_of_get_bridge(&adev->dev, np, 1, 0);
>   	if (IS_ERR(pdata->next_bridge))
> -		return dev_err_probe(pdata->dev, PTR_ERR(pdata->next_bridge),
> +		return dev_err_probe(&adev->dev, PTR_ERR(pdata->next_bridge),
>   				     "failed to create panel bridge\n");
>   
>   	ti_sn_bridge_parse_lanes(pdata, np);
> @@ -1319,9 +1319,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>   
>   	drm_bridge_add(&pdata->bridge);
>   
> -	ret = ti_sn_attach_host(pdata);
> +	ret = ti_sn_attach_host(adev, pdata);
>   	if (ret) {
> -		dev_err_probe(pdata->dev, ret, "failed to attach dsi host\n");
> +		dev_err_probe(&adev->dev, ret, "failed to attach dsi host\n");
>   		goto err_remove_bridge;
>   	}
>   
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d

This looks reasonable

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
