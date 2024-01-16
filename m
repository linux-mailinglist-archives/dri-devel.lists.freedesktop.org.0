Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5CD82EB4A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3580E10E476;
	Tue, 16 Jan 2024 09:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3207A10E459
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:10:30 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-50eabd1c701so11698874e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 01:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705396168; x=1706000968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4JP+pTH80AGhoHRS7N2h9nNb/JBmIT3BiPKqeh2cEls=;
 b=vvCeg/E5/xjIfE+IM3OEhpmhBwOLB8q1v+IKpvDc7DSncE04+rDMzAr3j7cr5RcQse
 eQl3d4wZzdNSlLOQaE2yWDMthBHELa5Q0W1ibJwoxtEBEbPvXd9rK7hplZXg2sRcbU/e
 j1uAdqEW325Aqdb7XfRTRex+3rQI+0e/QKzALi9S63+Oya7PJm4pPgBuY8JuINnJiUT6
 +tNC8ExbJkqKYBqRlsuGuy/+xjTMaLpUxgTqrn4OJ9v9I/3BSP8agPgYojARHFO0ngxC
 vE8B4LWzPi26hQL2oD13Ogs2jgPF/8ZjISa4JXWi2DgvQV9c8npEtb2XAJY3M7ztZHsS
 Gmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705396168; x=1706000968;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4JP+pTH80AGhoHRS7N2h9nNb/JBmIT3BiPKqeh2cEls=;
 b=AhBNxKTorfVGIU6IfxSI0HxbXUimdOZadQycrbQZS2zEn+tKFXzy+FiNHQvzo2xI2V
 6WJrE4za95zzGyPMwzTGXdTKc5sH/KJiM2zNcMo7vRkhBtCJuucgMDctsZzvOVvOaMJv
 INbHPtvnKfBbOqEaJI+UBg1xm5vuSUjBWeEs+Xeb9d2GbKAgycoMgRMBdam69iHF8/zP
 t4W3j+6SaXmXMPVJX71fOxOXJPc3A1AS2FyH039ITZKSZy/EAE1FyCniccV8A5GZvWPF
 nBTXp7/xiqZrd1XTjw8+JOaGUTHttqses8IZ6So/LVvEI7I2LWMaJP7DDAlCYZeB2K2r
 05bg==
X-Gm-Message-State: AOJu0YyN1RjMX7FH51dVJIgOrvPz4g4+z9ofFSYfb4RxN3GHk/7/uqz8
 JUZVG96/Gxq5vdeJAa2kJnPvGXTZbaz61Q==
X-Google-Smtp-Source: AGHT+IHEGwnPMy/GeMEYuhyhSNovt05ckF1h6USwD8Wn4VmfmOYiXiG0ukimRShuWP8X/xzAdLpKaA==
X-Received: by 2002:a19:8c1d:0:b0:50e:7b7b:5597 with SMTP id
 o29-20020a198c1d000000b0050e7b7b5597mr3081813lfd.98.1705396168251; 
 Tue, 16 Jan 2024 01:09:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:30a6:c236:cc88:349e?
 ([2a01:e0a:982:cbb0:30a6:c236:cc88:349e])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a19650c000000b0050e7b8ff90esm1737416lfb.66.2024.01.16.01.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 01:09:27 -0800 (PST)
Message-ID: <5f72b937-184d-4002-b300-6092e1731724@linaro.org>
Date: Tue, 16 Jan 2024 10:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: novatek-nt36672e: Include <linux/of.h>
Content-Language: en-US, fr
To: Ritesh Kumar <quic_riteshk@quicinc.com>, quic_jesszhan@quicinc.com,
 sam@ravnborg.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
References: <20240116071803.5264-1-quic_riteshk@quicinc.com>
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
In-Reply-To: <20240116071803.5264-1-quic_riteshk@quicinc.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2024 08:18, Ritesh Kumar wrote:
> Include <linux/of.h> instead of <linux/of_device.h> to fix
> below compilation errors:
> 
> drivers/gpu/drm/panel/panel-novatek-nt36672e.c:564:14: error: implicit declaration of function 'of_device_get_match_data'
>    ctx->desc = of_device_get_match_data(dev);
>                ^
> drivers/gpu/drm/panel/panel-novatek-nt36672e.c:622:34: error: array type has incomplete element type 'struct of_device_id'
>   static const struct of_device_id nt36672e_of_match[] = {
>                                    ^
> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> 
> ---
> In the patch https://lore.kernel.org/all/20231129164316.2663565-1-robh@kernel.org/,
> include of <linux/of.h> from of_device.h was removed. This change was not present
> in my local build resulting in successful compilation while posting
> https://lore.kernel.org/all/20240108095902.22725-3-quic_riteshk@quicinc.com/.
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> index d4e85c2fc899..cb7406d74466 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> @@ -4,7 +4,7 @@
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>   #include <linux/regulator/consumer.h>
>   
>   #include <drm/drm_mipi_dsi.h>

Fixes: ea4f9975625a ("drm/panel: Add support for Novatek NT36672E panel driver")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
