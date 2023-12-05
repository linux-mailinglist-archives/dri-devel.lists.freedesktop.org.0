Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03C804B8E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 08:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843A110E489;
	Tue,  5 Dec 2023 07:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D80410E489
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 07:57:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso32715835e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 23:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701763077; x=1702367877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=6yZ/VcoVbuPE7IS/Acx3sYefHrc8lhnBqcqEkq1L8A0=;
 b=PaBIcGQOWuIBZrSlDHn2noXI1RBJ5/Ia306JKzZVi73ei0rTAFWkYUiE4NUg1YGtrg
 K3BQ1ZJgFtg+sERIKCEPx/gOhK8wDJFUd589zKu1y/Zgpm6aNDRJer/pLwYFjy8jK9do
 dc2d0EsDajyrIkoTIRIfywZMBA1SPDfOkJcpH+ea6fc2ekljV8ejESGYsYEejWsOfT7v
 LjxOJzc0bgXimYqHJupZAucXrOkSIYFKVKjmTmstp06UhaOfdbb1doznJoeoVu8KpWgE
 i9E8G/LNX/ROGNwa/Ftf13Z3HsCjGQvh+1qR2EZecPFAbJtk/eQgN9fmUY//Jn68DaHO
 Z/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701763077; x=1702367877;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6yZ/VcoVbuPE7IS/Acx3sYefHrc8lhnBqcqEkq1L8A0=;
 b=K57zDYsENcHigPyxA6yRjjiM8H5yHyVmLvGYe+RXBluANqcTZwObBoRtPzmeq+xfdL
 cufkpzFMq44D8arf2wcAhcLrLyfQeChrOSSJaVvydF/c+g6hNdLRVTdIdncZvWuNKjZ3
 w1niKyzulxGL4Th7TDlLEA/PRnpoIOxw/OFcCt8Zfed3+sby2pBbWT4R4nd7HnkR0RFa
 6jkLAbGkKWyFOe5m8eeJhZcyW0I96lCFhImPvvUrhL5MxLzLh8Ft+SrMW8DyFbfYYgGq
 IHbxxN8frvoDkEQxrsk8vhdewGsu8FaYbRVUb6ye5WoPvDqjgTKiC7gwGcijbTpjFIOO
 jOHQ==
X-Gm-Message-State: AOJu0Yyjg0jpf9LiiK91j6g8Qv45vkpMUtGM6QtjWt4SvfhTZO9JS98T
 X0pwZKta8U5+S+8HAjjMOqxVRg==
X-Google-Smtp-Source: AGHT+IGMUPO9d6IrvhXxXUIgi62nJFBXjjWYh5z/w4DQ0n2j8KHJb9zPfh20zYGiTu/FmyDUv0/+Xw==
X-Received: by 2002:a05:600c:2e51:b0:40b:5e4a:2351 with SMTP id
 q17-20020a05600c2e5100b0040b5e4a2351mr264525wmf.83.1701763077338; 
 Mon, 04 Dec 2023 23:57:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb?
 ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
 by smtp.gmail.com with ESMTPSA id
 fm19-20020a05600c0c1300b004060f0a0fd5sm17803498wmb.13.2023.12.04.23.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 23:57:56 -0800 (PST)
Message-ID: <8f0f5965-2c41-414e-84ba-95da76082234@linaro.org>
Date: Tue, 5 Dec 2023 08:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 02/10] drm/panel: himax-hx8394: Drop shutdown logic
Content-Language: en-US, fr
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
References: <20231204185719.569021-1-macroalpha82@gmail.com>
 <20231204185719.569021-3-macroalpha82@gmail.com>
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
In-Reply-To: <20231204185719.569021-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 sboyd@kernel.org, sam@ravnborg.org, mturquette@baylibre.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, quic_jesszhan@quicinc.com,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 19:57, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The driver shutdown is duplicate as it calls drm_unprepare and
> drm_disable which are called anyway when associated drivers are
> shutdown/removed.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8394.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> index 3823ff388b96..d8e590d5e1da 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -390,27 +390,11 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
>   	return 0;
>   }
>   
> -static void hx8394_shutdown(struct mipi_dsi_device *dsi)
> -{
> -	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
> -	int ret;
> -
> -	ret = drm_panel_disable(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
> -
> -	ret = drm_panel_unprepare(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
> -}
> -
>   static void hx8394_remove(struct mipi_dsi_device *dsi)
>   {
>   	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
>   	int ret;
>   
> -	hx8394_shutdown(dsi);
> -
>   	ret = mipi_dsi_detach(dsi);
>   	if (ret < 0)
>   		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> @@ -427,7 +411,6 @@ MODULE_DEVICE_TABLE(of, hx8394_of_match);
>   static struct mipi_dsi_driver hx8394_driver = {
>   	.probe	= hx8394_probe,
>   	.remove = hx8394_remove,
> -	.shutdown = hx8394_shutdown,
>   	.driver = {
>   		.name = DRV_NAME,
>   		.of_match_table = hx8394_of_match,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
