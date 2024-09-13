Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F04977BE6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B4910E052;
	Fri, 13 Sep 2024 09:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KX+Zz3f8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DFE10E052
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:09:23 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso18091395e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726218562; x=1726823362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0Px7P8vUhtcnumZBZibQpbbgvjXBl3y0kO8YYM/2s24=;
 b=KX+Zz3f8JBJGabAvs9y60sBgkdYMXagitFYxZXLTNJ1F3QLUlw1ONl81MHVYIZowMn
 EtdEAvuK/J+A6WlxxLlmNTx8AZ/kwgoDWU9yPFpdNiJ2rVVK2+n+ic5HqKC2I7MFdctu
 a2k3y/zwqNtORekCEGQGRD0Qw8Q7tQPUzQgPA9d3dRNs0CcOzo8v5nxsmoLk/nR6393o
 NQEZu94tELCprwoSieOfvec72XcIhPUZE9eeo5Ase2TNa/ZLh05pIX6zVincIUEPyoNY
 jDA+iA8fkQMJNxW9TbFc7bBrg6e06zqr2EcCXvHAOq4lhp5ALBgiPG8O6fJM3BEpUUki
 E5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726218562; x=1726823362;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0Px7P8vUhtcnumZBZibQpbbgvjXBl3y0kO8YYM/2s24=;
 b=Sr8TNvrYb6R2X55fv5Jpao+n2R/+BwgpK6TK8Mnak9xIDvvIKDvLo+JZt+Q4Djmbl4
 McbVHypExnF1Ifh7kYiqeOzoy7RPcyPWa8cZkEz+N4wzn5K3JtL0HOfDA6CcvmO0kzRj
 YbH8DkGxi5C782iMAb0oO527/EU3JVMHvx2Y2k7IfivoSwaS5d9KlPPFMNV73XygjPW3
 TR0wrYJaDbfu0jYBbo6Sn4aW17dLCjWeZg4hqXAXaRBPxNMT2ebPYAj7WUuZlC5qMH5v
 oS0DvOm75YYOYqly15RZenBmUE10G/Xv5YD2XIsZ0PTMpU8KnqYt0/uZyVLal08w3Gmh
 DV+w==
X-Gm-Message-State: AOJu0YzUNwf892ytTjiWJtr8fewTYk9C03AmNiyyfu6o/iF+xEqafdhI
 CtxGkApzbnrmQcEg54f14+0iMXUQ0Fsu5LBdlItG7ORXu/TmZXtha0+gINQNfjU=
X-Google-Smtp-Source: AGHT+IH7SyOewl5IXKTi3cewOPHM7wrZGefNZMT6Npms0fzQJ1acd3Jey9j4PucxqZTn0IAqCKo78g==
X-Received: by 2002:a7b:c386:0:b0:42c:baf9:bee7 with SMTP id
 5b1f17b1804b1-42cdb67b16bmr40882295e9.12.1726218561024; 
 Fri, 13 Sep 2024 02:09:21 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b18202fsm17354465e9.42.2024.09.13.02.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 02:09:20 -0700 (PDT)
Message-ID: <e6d37d13-a150-468f-93c8-f8109996b974@linaro.org>
Date: Fri, 13 Sep 2024 11:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: panel: nt36523: use devm_mipi_dsi_* function to
 register and attach dsi
To: Jianhua Lu <lujianhua000@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240904142907.367786-1-lujianhua000@gmail.com>
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
In-Reply-To: <20240904142907.367786-1-lujianhua000@gmail.com>
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

On 04/09/2024 16:29, Jianhua Lu wrote:
> Switch to devm_mipi_dsi_* function, we don't need to detach and
> unregister dsi manually any more.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 16 ++--------------
>   1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> index 18bd2ee71201..04f1d2676c78 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -1095,18 +1095,6 @@ static int nt36523_unprepare(struct drm_panel *panel)
>   static void nt36523_remove(struct mipi_dsi_device *dsi)
>   {
>   	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
> -	int ret;
> -
> -	ret = mipi_dsi_detach(pinfo->dsi[0]);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "failed to detach from DSI0 host: %d\n", ret);
> -
> -	if (pinfo->desc->is_dual_dsi) {
> -		ret = mipi_dsi_detach(pinfo->dsi[1]);
> -		if (ret < 0)
> -			dev_err(&pinfo->dsi[1]->dev, "failed to detach from DSI1 host: %d\n", ret);
> -		mipi_dsi_device_unregister(pinfo->dsi[1]);
> -	}
>   
>   	drm_panel_remove(&pinfo->panel);
>   }
> @@ -1251,7 +1239,7 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
>   		if (!dsi1_host)
>   			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
>   
> -		pinfo->dsi[1] = mipi_dsi_device_register_full(dsi1_host, info);
> +		pinfo->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host, info);
>   		if (IS_ERR(pinfo->dsi[1])) {
>   			dev_err(dev, "cannot get secondary DSI device\n");
>   			return PTR_ERR(pinfo->dsi[1]);
> @@ -1288,7 +1276,7 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
>   		pinfo->dsi[i]->format = pinfo->desc->format;
>   		pinfo->dsi[i]->mode_flags = pinfo->desc->mode_flags;
>   
> -		ret = mipi_dsi_attach(pinfo->dsi[i]);
> +		ret = devm_mipi_dsi_attach(dev, pinfo->dsi[i]);
>   		if (ret < 0)
>   			return dev_err_probe(dev, ret, "cannot attach to DSI%d host.\n", i);
>   	}

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
