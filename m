Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485097D3A24
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58DA10E0CF;
	Mon, 23 Oct 2023 14:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5695610E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:57:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40806e40fccso25032945e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698073076; x=1698677876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=X4sb9XVGW0QNKpavfuN9oxWsbx8M351MiA2dCW1xgcc=;
 b=H6lNS+rR4+QfZGmzsaWg5CROayMtGy4MoG419ySlDboX2MHEBWkCv1ngb8hYMLXFZ8
 gNsxL8mLQRFOIpvxfRRy/6T/GPQqXDxWH9iiYGyzYgSqKPoabB243hei0ZZ+dc2PjvxH
 RfZuJwG+Monrc535kJVckBVsuOVSeSb9q1mZsMmi5Q433Rw5xA9DIoYjne0WuE9/STas
 HIXUH5k+9iUbQ7YvA0C0fa3w1D32zEk/iCG6OS2Dl6O7qjlqv3RZsacRJbd0zh3Xopwo
 AuGuk0ziKpi3RIUF2XT8xC5agq0wBfkzlWfpfjZnPiSjZSfu7+Rfr9ATVRyYqV17SGHP
 OPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698073076; x=1698677876;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=X4sb9XVGW0QNKpavfuN9oxWsbx8M351MiA2dCW1xgcc=;
 b=XJoY/WJbnvSAaaMQOLC1ruagr+C+/qwSjsUcRiHWeZZtgcTARbwpYVIsLYAtD9m/qG
 xQzQik+H2i7CSkrlJKKwVQBC9f1p9h8qXQiPurV9cI+A/6VbWfOQBb1YLCIICcTWyf9v
 /WOjTMAAwnYOMpMbA3obRPDvsRjQKhGrxH8g1i540CscjsBe2aaCPBVMkCk1MsQtfEMc
 Buwi3yRBaTBcUe+wxjubInb//Q1zOu+Ylq5USoGQfuYGmCjoMFaTeqKtdIHHBOR6XsN9
 EVG5wLhnccmKY54eLJgHJ9jIC+ed6in3bzMnMqEtDUc4q+obsoC3HVoAyIaWukOn/kvN
 TeVw==
X-Gm-Message-State: AOJu0YycN0hlsMM/pmAxgjC/y92YKUtwTyIYMRrKt4BaYWEjTyLIVaJZ
 F5qWfTDaE9or+Vst8TeVwgorwQ==
X-Google-Smtp-Source: AGHT+IHui4rUsP9khjsKc/fS6TOgZjAVE9q7nFPizFWwt54lJdTljB6STJsMyrfiujNUFdNh9niqyA==
X-Received: by 2002:a05:600c:3c8d:b0:408:434c:dae7 with SMTP id
 bg13-20020a05600c3c8d00b00408434cdae7mr8254117wmb.2.1698073075657; 
 Mon, 23 Oct 2023 07:57:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a36e:a5d9:26ae:74b1?
 ([2a01:e0a:982:cbb0:a36e:a5d9:26ae:74b1])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c420900b004065e235417sm14163567wmh.21.2023.10.23.07.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 07:57:55 -0700 (PDT)
Message-ID: <53982fa5-3396-4c1f-8360-18957fd687e8@linaro.org>
Date: Mon, 23 Oct 2023 16:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [RFC] Clean up check for already prepared panel
Content-Language: en-US, fr
To: Yuran Pereira <yuran.pereira@hotmail.com>
References: <DB3PR10MB68352B33759F5DB6CC041C84E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
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
In-Reply-To: <DB3PR10MB68352B33759F5DB6CC041C84E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
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
Cc: sam@ravnborg.org, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 23/10/2023 16:51, Yuran Pereira wrote:
> Since the core function drm_panel_prepare already checks if the
> panel is prepared, we can remove this duplicate check from tm5p5_nt35596_prepare
> which acts as a no-op. As suggested in the GPU TODO [1]
> 
> [1] https://docs.kernel.org/gpu/todo.html#clean-up-checks-for-already-prepared-enabled-in-panels
> 
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> index 075a7af81eff..af83451b3374 100644
> --- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> +++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> @@ -112,9 +112,6 @@ static int tm5p5_nt35596_prepare(struct drm_panel *panel)
>   	struct device *dev = &ctx->dsi->dev;
>   	int ret;
>   
> -	if (ctx->prepared)
> -		return 0;
> -
>   	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>   	if (ret < 0) {
>   		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> @@ -132,7 +129,6 @@ static int tm5p5_nt35596_prepare(struct drm_panel *panel)
>   		return ret;
>   	}
>   
> -	ctx->prepared = true;
>   	return 0;
>   }
>   

This has already been done and merged in:
https://patchwork.freedesktop.org/patch/msgid/20230804140605.RFC.1.Ia54954fd2f7645c1b86597494902973f57feeb71@changeid

Thanks,
Neil
