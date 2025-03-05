Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECC7A4F829
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 08:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14C110E6F5;
	Wed,  5 Mar 2025 07:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NDV/2He9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5675410E6F5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 07:44:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43bc0b8520cso19408825e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 23:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741160648; x=1741765448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=+aVVWfpM/R7114kq8yw+67pir5NUPFWO9h9JRxaS7qo=;
 b=NDV/2He99GGD3Dy+tfDF+NakgC8F7mgsv+dBtviQkVJZDtQLAQgbfPrqqNvDglC3Zx
 2Rspi4wtCjv4Jwl58vO+z8GHdzCfg9V6fpNH+vE4yjugqskK2HSEX0Sb0PcJUCW5fGN2
 Gju83lfCiOP68u0Ywf+r4hJH5N2qUML0k4XU2pYYkZYKk2NSNn7lNXcqDFkYokzR07O/
 7vdK0vCXV/qLrPr5l19M+qS9d33TzoFkXLMPlJB5XRsf4wm7mfPqSPFiYU9SuMkBeMOq
 KfHvQ72JbRqvepB0oWtH/rl6vCB3moTqvD7tEn/BWAZiLf6oLw0O7H2RDIXGJI/W7zx2
 +6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741160648; x=1741765448;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+aVVWfpM/R7114kq8yw+67pir5NUPFWO9h9JRxaS7qo=;
 b=NBLrST3t6FRxCYJuBBTht4A+taLuFig4xobqeadqpq4DrkfLrrCrk1T9V+n14+wRGs
 U2LJyK55q0xHSC8rnOIp10L/xfgV1fyLdBO4XZHp4FkrJcmdoFRZTW7VSonXAf9oKDXj
 U6ODvlPBuLbJqxfz1hyKeWlfchfqMAxoXawwgIT3stpB3JJ8z966zLvG8Y00sYEsMsm2
 9H3rJH1uI1s3PyXNR9EdEQo4agTIoHnabAhfo8XxNCARpqFQCMjhR+Fl5dhly6f7OyTg
 REsLHpEZmw+Urj+b8bLKhxym+2Mig1OeO1S+LfjotseK1mUansDiGQgALJr/nU95cvxs
 ztMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTSXac+8kq2GAqjiuRfqQoriiCOrZ5RAVJD0CzrhMDvR7HFnwAgnHrW7Ky5JOmFY8yF+vFVibFe7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvWTm3HE/n/pbD1sC4LrPS0ULgIIIrPReRecU1etfB2JtHFliU
 mVrOHGYwdIjUKcNUSNhnNtjRze4BaIA9/pdyd918A2YY4CkcP1fYSF99dsl8TbA=
X-Gm-Gg: ASbGnctu9PFLAXd/IjCzBZQ28EdcJXdEH2NuYKLSI+SaEry50e/y4Z+HwJzTnZGg8AN
 u/ELpgTxY2soY0/SncumFrEE7qM3zWMmz5/QcPuqDPMUwFh1Bm3AV7kgZfWqsnAVKH204XCCn7Y
 XBp42UziyrivcLLiMlPq8bQe0nbJy69tCrVGyT2tolQp2KPH0XB+cFOOeIm6278g1KCCGUxscqp
 coSuoXYDnHIlsXJAtR5U0xiK/3dqz+pIvH6Z21rd6n0LDm91aT9UN1Q4D/5AlUWDvsnck9lJPT/
 lygPAHgsiVBu0Eoozcg5luYZbVKd5lmWyYt7xwbkJOK1wZUlxeTz1j62nK7ovcnjwu+L80ZANfI
 hKREPQnbGpT0InoHVups=
X-Google-Smtp-Source: AGHT+IEPvMkwnzMHESBZZ3ISL/jIpWI/iMcyXh+NYDVcMmY+PloN4Ai5r0S5PZs9sI+S0GqIqmbenw==
X-Received: by 2002:a05:600c:4f15:b0:439:8c80:6af2 with SMTP id
 5b1f17b1804b1-43bd2ae000emr10350255e9.21.1741160647791; 
 Tue, 04 Mar 2025 23:44:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:80fe:f5c:3d29:e407?
 ([2a01:e0a:982:cbb0:80fe:f5c:3d29:e407])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426c355sm9274075e9.1.2025.03.04.23.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 23:44:07 -0800 (PST)
Message-ID: <02fb7b29-6af0-40f2-a187-326fd762835a@linaro.org>
Date: Wed, 5 Mar 2025 08:44:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: fix Visionox RM692E5 dependencies
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danila Tikhonov <danila@jiaxyga.com>, Eugene Lepshy <fekz115@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Wronek <david@mainlining.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250304142907.732196-1-arnd@kernel.org>
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
In-Reply-To: <20250304142907.732196-1-arnd@kernel.org>
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

On 04/03/2025 15:29, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver uses the DSC helpers, so the corresponding
> Kconfig option must be enabled:
> 
> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-visionox-rm692e5.ko] undefined!
> 
> Fixes: 7cb3274341bf ("drm/panel: Add Visionox RM692E5 panel driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/panel/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 5927806cb4a9..e059b06e0239 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -1020,6 +1020,8 @@ config DRM_PANEL_VISIONOX_RM692E5
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DSC_HELPER
> +	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for Visionox RM692E5 amoled
>   	  display panels, such as the one found in the Nothing Phone (1)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
