Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394958C6DB2
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACDC10EBAC;
	Wed, 15 May 2024 21:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q3CvfvVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C6A10EBAC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 21:17:19 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-34e7a35d5d4so5912292f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715807838; x=1716412638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=D0ecu82tuX1ni98ypLLsTpUA0kFlxPhIqL4+3/EGxOA=;
 b=Q3CvfvVLEh+fZk5J/RsAGoeVIX9pv8gOMNZJepq9VbAZ0NYGPUZXA4AsIeRkWH41B1
 qZINhgKIigXzoG16ZScLoO9FupY9+XPXHLTNoMc+A9erKuiqo0/R1KiX+NVq+kvMXvwu
 8rrjVIGSIiPdkAoQiDWsIYf3NILppDXYIuVUk2t7VAbcuwTukFJlQPubiqdDnt2OV+1H
 1SlDNVpvPXS1WkoIqZ5FFKLa92X9bqN4ebUhs/1ozg83rd1Eq+Z3ihc9FihdgJ07spxN
 4p/+5kFlqKlFG2lWJwROSwoR/5PvYCa9SmOND77GvuhfE+l8SGWHmyJjY/p5m9EDZOaX
 Aehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715807838; x=1716412638;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=D0ecu82tuX1ni98ypLLsTpUA0kFlxPhIqL4+3/EGxOA=;
 b=mmgMl7BydGSQ4i7XO7EIaUJJN6ego4NAffqgILxo5WwnvTvqfuY1bgN5O6oBkAbyh0
 YJy3pbgjoMot1pTjsE9LHswaBlpDTPIJEkButIu1Z4pQE/VRLoZqqIch8NuA9lvZQOc3
 2/chCr7WuMr8LtS/yS2qzeU/vTcMSy0Nr1BnWVeV4cs5+JswJWdnx7/EbNz2QyAYZlFs
 o4MAXGMHF5GBK2WJA2s7ByWHkSuQE+I0TGN62dCXNMlEWqGKcB+ht9yOJKv2+lzqz76J
 wxK2nfSFQpMvk6zQy1eNv2WU2XIkXMpxCINzw/QyJmRef3l6wU9uKxEL4BSx3IND3g5C
 aG0w==
X-Gm-Message-State: AOJu0Yxm5Jh7k1EKQpLLGMQtvA0CDpkMyas68NLo3qs+5Rhz4D4fHBDc
 ITSxQUTCvb9VsEyxbvE2t/OgW4SvBR1Te+3Zp3YF04Zyx0ogbPv4HRzSkBnun9M=
X-Google-Smtp-Source: AGHT+IH8Iu67CkoC7/nlTrdtjmS8OSpJsiAUHCgKh2Xh/6pKxrhVkmBbpcisbLl6bNrjDPNWu/keEw==
X-Received: by 2002:adf:f791:0:b0:343:8e85:dd7c with SMTP id
 ffacd0b85a97d-3504a9580bamr12811320f8f.55.1715807837876; 
 Wed, 15 May 2024 14:17:17 -0700 (PDT)
Received: from [10.1.2.176] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbca98sm17355196f8f.112.2024.05.15.14.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 14:17:17 -0700 (PDT)
Message-ID: <eb65ad1a-04df-42bf-8683-ba8876bb885e@linaro.org>
Date: Wed, 15 May 2024 23:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 6/6] drm/panel: simple: Add Microtips Technology
 MF-103HIEB0GA0 panel
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240515095133.745492-1-a-bhatia1@ti.com>
 <20240515095133.745492-7-a-bhatia1@ti.com>
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
In-Reply-To: <20240515095133.745492-7-a-bhatia1@ti.com>
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

On 15/05/2024 11:51, Aradhya Bhatia wrote:
> Add support for Microtips Technology USA MF-103HIEB0GA0 10.25"[0],
> 1920x720, 8-bit TFT LCD with LVDS interface. Its a Dual-LVDS Panel and
> does not support touch.
> 
> [0]: Panel Datasheet
> https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2660/13-103HIEB0GA0-S_V1.0_20211206.pdf
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3a0d8f0ff267..1b0a6b4e034c 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3084,6 +3084,35 @@ static const struct panel_desc microtips_mf_101hiebcaf0_c = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct drm_display_mode microtips_mf_103hieb0ga0_mode = {
> +	.clock = 93301,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 72,
> +	.hsync_end = 1920 + 72 + 72,
> +	.htotal = 1920 + 72 + 72 + 72,
> +	.vdisplay = 720,
> +	.vsync_start = 720 + 3,
> +	.vsync_end = 720 + 3 + 3,
> +	.vtotal = 720 + 3 + 3 + 2,
> +};
> +
> +static const struct panel_desc microtips_mf_103hieb0ga0 = {
> +	.modes = &microtips_mf_103hieb0ga0_mode,
> +	.bpc = 8,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 244,
> +		.height = 92,
> +	},
> +	.delay = {
> +		.prepare = 50,
> +		.disable = 50,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
>   	.clock = 30400,
>   	.hdisplay = 800,
> @@ -4726,6 +4755,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "microtips,mf-101hiebcaf0",
>   		.data = &microtips_mf_101hiebcaf0_c,
> +	}, {
> +		.compatible = "microtips,mf-103hieb0ga0",
> +		.data = &microtips_mf_103hieb0ga0,
>   	}, {
>   		.compatible = "mitsubishi,aa070mc01-ca1",
>   		.data = &mitsubishi_aa070mc01,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
