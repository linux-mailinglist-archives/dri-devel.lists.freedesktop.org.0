Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFE7A16B2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 08:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A78A10E163;
	Fri, 15 Sep 2023 06:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E803D10E163
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 06:59:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-403004a96a4so20123315e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694761143; x=1695365943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=mt0/vU7tS/I4WdeJ1B6LJJREbXiomv2o0TbUICA5gLw=;
 b=wfrfYs5Fupys5fnOGPIld7eKm62/s4Qz4oe0Y1kpJNT7941iKl5s9T5C2sebBjXHxD
 y/zSVNGRz0VCyz9rBZRxuz7rbKahk3+yuUF9eq4+HqYh/kxwR0rT7F2JeU0vookHV3LQ
 Coza2J7W5FOz7iKvaDe9ZtFsjhYHfj6Ymn/zPNzsQ8hoA3332y6shOUCV0/hJsJWudBk
 YviFucFFSBagoTwKloHr3oo4cAleUwQpepwLsdLE5LWNX2zCgcBdSX/ChUnlbvGE2uRy
 NlteYZl9o9KtcgRH1nmaHFA8dZSeuXuAQWNprnqJETqtPtVwXY7XZ9K0n7mF0BnmGo7x
 XQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694761143; x=1695365943;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mt0/vU7tS/I4WdeJ1B6LJJREbXiomv2o0TbUICA5gLw=;
 b=CdhLPwTTReZ/VyN4uYemt+F5AKwCkpJK5UcMDUAyzxQzGY0C1oi4+zm4wN2xIm33yJ
 9NaZ4omRBhzj2a7w8+XE8fFOoMdyFPFcxNc1ilTW1dOLYCs1CXHBuaErAGGDIkm50H+3
 OKn7NQHaQCTIWROhi9mxeMZfcpaWfC8MyzU0AlIluClC3anJVUsvEvySzQfbOWR3/BKZ
 6CfO5pxfg4dyjnzO2z01qrt5PWfgzhDeYAm0CcW0WNiVdkXFA2QCkhVDCkUf3Qp7UMI4
 9gzJOjYATYusus/wUm0K2AK6RnGoScLS16AQxwb2L9dBX/BqhSCqYgV9oyjJ+6KTLTi5
 R4lA==
X-Gm-Message-State: AOJu0YxBNurjEzfJU0qwdBqJt7C9OuOyqJ3YGTQazmhen9nRu7bU/60q
 ooUjsmIcB7MiwO/3/ri8E6aUutjdBRQNe6bSCsaf2Xit
X-Google-Smtp-Source: AGHT+IE4jAQc/f0JC4LzXetxAe50ENFFr3PqEcIIEvx8Zg3C7YQLWDUFz7j8SYv1FN1qOLzLY1IAQQ==
X-Received: by 2002:a7b:c8d0:0:b0:3fe:173e:4a34 with SMTP id
 f16-20020a7bc8d0000000b003fe173e4a34mr674179wml.40.1694761143262; 
 Thu, 14 Sep 2023 23:59:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:990a:74e6:266e:2294?
 ([2a01:e0a:982:cbb0:990a:74e6:266e:2294])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a05600c21cd00b00402ff8d6086sm3779272wmj.18.2023.09.14.23.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 23:59:02 -0700 (PDT)
Message-ID: <a4b4432b-fdde-4922-8d95-3697807eefdb@linaro.org>
Date: Fri, 15 Sep 2023 08:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
Content-Language: en-US, fr
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20230914131015.2472029-1-jani.nikula@intel.com>
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
In-Reply-To: <20230914131015.2472029-1-jani.nikula@intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/09/2023 15:10, Jani Nikula wrote:
> The EDID returned by drm_bridge_get_edid() needs to be freed.
> 
> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: <stable@vger.kernel.org> # v5.17+
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> UNTESTED
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 9913971fa5d2..25ea76558690 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -334,6 +334,8 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>   			return;
>   
>   		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
> +
> +		kfree(edid);
>   	} else
>   		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
