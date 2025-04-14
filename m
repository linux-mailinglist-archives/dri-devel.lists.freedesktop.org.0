Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF39A8790B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 09:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38D810E0CF;
	Mon, 14 Apr 2025 07:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N/PNEEqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D921510E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:38:58 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so3457852f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 00:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744616337; x=1745221137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1YUJUK8AE+cB0J4Fwjv+9Xlb4mSQ/w0tsb8OhE4M4K8=;
 b=N/PNEEqoKgMKOjMvE2t8aQS66H3t9FBTysAVA7JfGbSHbDCJj3N7+4th5RgbHz1rnx
 T+xAmZlUzPrXWo/BQvQ0VxuiQXrrwI6xniRk2jSmlLoO+my29wwo/JN/fnujCEiPz4EX
 U3OgygtSqtHxktdj5vV6CQEv7ZPyBg1La+VSNf68p/O2YHoII0NjaQ6X/vETRcOvtJKy
 Y5xB655xEOrn0DGcQJrbdQef0ec/b6M8WPVEW3mLgFzxIIArgneojDLGOALCdk5r4IfY
 CcwWI9uDxopJaVK5z7c2syG30Lndl+lvHJmZWout9jugfpD33PHJR460t4iMHnJPl2Xl
 dFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744616337; x=1745221137;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1YUJUK8AE+cB0J4Fwjv+9Xlb4mSQ/w0tsb8OhE4M4K8=;
 b=bUZckgJnya9XWotAFO5vkYDRQD2LnHWYsXsUGlBCs5LOG6EKMwTON/2VzmTT80Lj+p
 37w4v3ittmRaw0OY9cdvaUwdc1VfyMbD5mqVUQ81rHx0BevTvOwdDOMQCR/I3Uyo/zKj
 bao6KSFslTGD0o3UyTkxMBW+6+Wm7SFWRq4mJnnKaRa4Q9n3ra8Ap6nPyzwNcFAYO3Kh
 DcY5vXUpiH3NnLa3wGZip+N4E2gzCF+7vU48bYt0WupoPdlkY/ronFiJnWUdoCUDDQO+
 nfmD+xP9ATqPHpFi7QPotps6rbI6qcn4GR6Lg/oSxVbwZ5cNk61H+NwCyxf/UTXBc321
 UsQA==
X-Gm-Message-State: AOJu0YyE5PNnxiDPvSop253dZ1QkUzVmSKLQngiinzr8FghTwNJGMC4U
 jSo3IS5XUBU/cwtNWEBkhCC1qCgFnY4HpbGk6/OWurXUuRln+Qlxl4nf/zu9SsY=
X-Gm-Gg: ASbGncsOAQcqsqwivXcYyg5xAYeuO3tjQMgzvyzzYPuc4bCTFi6AAEPLCj9OabKAs8Y
 JKYkNej/1xjSOuwKI9D4dAcHBG+I9C5gHFcZ3RBW+b5pYdemc9WS/ty+k3iAgOjw5FgOWtFQpkP
 CV9nnK4q8wyNMgekWwLMqEAfWEXO9MLQqjNEay9mp1FBcmPYn5OumbF9CrkhXULryQ2BhRcJMCD
 ouku/7aU8wO0bntoAPnYHXPD39dCZY5gnbpUaSFAGVftaC/LTPdmkjV4xV4olo/97Oo4I22mOi+
 CRKivErnwEq7AlKtTF4X17MMLfNnj/z46hT3YcgRpr/bWwmuvMpMEnURYyPuiz3uVxHkcz8p6ma
 DFBizlgQyOG4/WGJwbw==
X-Google-Smtp-Source: AGHT+IEN00CGuVeGvTjeGWZNIExSe2bYWLZkw12uJCvQgEAsgQb68L2VMNOY2e3uMwjoUJbn6Vqjzw==
X-Received: by 2002:a5d:6daa:0:b0:39c:dfa:d347 with SMTP id
 ffacd0b85a97d-39ea51f4467mr9707081f8f.2.1744616337324; 
 Mon, 14 Apr 2025 00:38:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743?
 ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cb29sm10148851f8f.76.2025.04.14.00.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 00:38:57 -0700 (PDT)
Message-ID: <cd7fcaec-af16-4364-9a5d-77c5ee50bcc3@linaro.org>
Date: Mon, 14 Apr 2025 09:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: select DRM_KMS_HELPER for AUX_BRIDGE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250411-aux-select-kms-v1-1-c4276f905a56@oss.qualcomm.com>
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
In-Reply-To: <20250411-aux-select-kms-v1-1-c4276f905a56@oss.qualcomm.com>
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

On 11/04/2025 17:09, Dmitry Baryshkov wrote:
> The aux bridge uses devm_drm_of_get_bridge() from the panel bridge (and
> correctly selects DRM_PANEL_BRIDGE). However panel bridge is not a
> separate module, it is compiled into the drm_kms_helper.o. Select
> DRM_KMS_HELPER too to express this dependency.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 09a1be234f7173bdf88e385507bbe5e5c6d583a6..b9e0ca85226a603a24f90c6879d1499f824060cb 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -16,6 +16,7 @@ config DRM_AUX_BRIDGE
>   	tristate
>   	depends on DRM_BRIDGE && OF
>   	select AUXILIARY_BUS
> +	select DRM_KMS_HELPER
>   	select DRM_PANEL_BRIDGE
>   	help
>   	  Simple transparent bridge that is used by several non-DRM drivers to
> 
> ---
> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
> change-id: 20250411-aux-select-kms-086618b92d6e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
