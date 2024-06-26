Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8861B91877C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8377D10E95F;
	Wed, 26 Jun 2024 16:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zb0rzGEg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EE910E96F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:35:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4255fa23f7bso4953075e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719419715; x=1720024515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=IVNombFGh6XnGXwdeuW//QrSGHhjwRxXK5+Bp5Yi1fc=;
 b=zb0rzGEglvk8m6g2MVqZy4joI//rempjlDmi/KV8umZVYkcU8252Ppk4fMnl5V+OQi
 XOlA/zSUtmKZ++bLXgjlCHchrLZHgNEcbbu6ROnrEg9f6AjL9Y6TdrtLGHU3eH7USXf+
 HO+t1kZ2FoG7+T5XxzD4ZksKrkqVnsisH+4vFgpZTcL9OJe+44buDFa7lZubMJ+gwRDE
 8FW6mXo2oufKJq+KCzLfR5artZiiUFs9p3pt9ox7BdUmYi4wggvcReg/EQxTm+dgt51y
 LplsVfTF9K6dJd6fFBa9R96ITft6J5Z07OGMJMWPjePlqqOWq4Hy3dO+0Nepu+7K2FsC
 NBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719419715; x=1720024515;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IVNombFGh6XnGXwdeuW//QrSGHhjwRxXK5+Bp5Yi1fc=;
 b=vSlNhR30NtVrXsoPufwTgW0iDbSB6H1T2exy8Bx9FRicE9DFsiE5OOcobdhynBJukv
 55xt93DDrauGqwskYxA3/xEX8UqRddkiZBCeBGhXXFBJ571jLTiK36MEmHfGFuhHSwD9
 LhPHTBxDUk5xrMRXqT5RSmTEqRefLmKyzJpqyTI2cZ4asF5T2QuTjwHY21D33H8dVImj
 +y9C1wHOGO7+l4d1INF+tPc1M5NG0WKEUEI6CIfAB2XsDPGL2RvZBvy0flEPRPwfB6/v
 V7AojMaavbSSTTwgdkvuEUHqnacMSZVAl+8vMP4QA/HfErD50OVwebu80Lt2SBe/ZW86
 8nZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+vAuf7TxPmDMysCL0OWumm4yRbawglHTysLSxRR7kpgxA9GGERO/EGUi6ni7aM2CU5LH8O06F4cJ76f7gmtMmEgr+Y5HPnk2TWN8I5/PT
X-Gm-Message-State: AOJu0YwVH0QT0y4wHTIA081WErxtso+/qgFUbIoOzGY8Gnec7HRcJqz4
 mI5ePqkgb/2QOISfvr8i/gNHZrM76ZcfTRYU6nt3cbsNm0Y436jHJTXrGwqKTKA=
X-Google-Smtp-Source: AGHT+IF/H3qe3QkAkh67maafTcj7zPClcHcEdJ3mjvr0P7EcQetcMG/YNSoiIEG0zx2IAQ4inoE7dw==
X-Received: by 2002:a05:600c:3c8d:b0:421:a575:99c9 with SMTP id
 5b1f17b1804b1-4248fe3fa35mr63895905e9.20.1719419713858; 
 Wed, 26 Jun 2024 09:35:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:afc0:84d8:433a:2d67?
 ([2a01:e0a:982:cbb0:afc0:84d8:433a:2d67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c82519c8sm32498645e9.16.2024.06.26.09.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 09:35:13 -0700 (PDT)
Message-ID: <bc7edabf-fec7-4626-bba1-03a78c87b500@linaro.org>
Date: Wed, 26 Jun 2024 18:35:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] drm/mipi-dsi: add mipi_dsi_usleep_range helper
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240626142212.1341556-1-jbrunet@baylibre.com>
 <20240626142212.1341556-3-jbrunet@baylibre.com>
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
In-Reply-To: <20240626142212.1341556-3-jbrunet@baylibre.com>
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

On 26/06/2024 16:22, Jerome Brunet wrote:
> Like for mipi_dsi_msleep(), usleep_range() may often be called
> in between mipi_dsi_dcs_*() functions and needs a multi compatible
> counter part.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   include/drm/drm_mipi_dsi.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 71d121aeef24..0f520eeeaa8e 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -10,6 +10,7 @@
>   #define __DRM_MIPI_DSI_H__
>   
>   #include <linux/device.h>
> +#include <linux/delay.h>
>   
>   struct mipi_dsi_host;
>   struct mipi_dsi_device;
> @@ -297,6 +298,12 @@ ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
>   			msleep(delay);	\
>   	} while (0)
>   
> +#define mipi_dsi_usleep_range(ctx, min, max)	\
> +	do {					\
> +		if (!(ctx)->accum_err)		\
> +			usleep_range(min, max);	\
> +	} while (0)
> +
>   /**
>    * enum mipi_dsi_dcs_tear_mode - Tearing Effect Output Line mode
>    * @MIPI_DSI_DCS_TEAR_MODE_VBLANK: the TE output line consists of V-Blanking

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
