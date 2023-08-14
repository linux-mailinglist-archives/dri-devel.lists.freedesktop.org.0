Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47B577B8CC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B2710E1D8;
	Mon, 14 Aug 2023 12:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC5E10E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 12:39:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe501e0b4cso39708485e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692016768; x=1692621568;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=hpbSxgw45nAC+tlCwInuCfzL+dDo7dZHHtU0fZD2iC0=;
 b=IoW1+2NrVx8aip98rgcobGKSGktEsYQ9ZsJKE5JQpOqli6yihZaiU4ntnuS2HyBV03
 gccBRoOmmjJluQzeG0jxu40zyQ72XG732bhwXAIDlacdBJT0QI/CPUj8U3/oaPCrX9Wu
 3Z0ytBSAvCuda3dsjxpkuhmbwQhIRG99+ta0+v6mMv1RI+v7lJMtY4KBdUQfTqTjx2K7
 26uQX0qSkCyM3Fv62qnYVOwaNFq+GD7aVKUoztMoeU3PQBk0Y6YnfTEMnKGS2ZSaiszQ
 7glXDDMbx8JJezPJBrpb0OL+r4szdgSDtP9v3CJEoFIcglG9zLvZr3ykbXFpsw6GxJSZ
 P+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692016768; x=1692621568;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hpbSxgw45nAC+tlCwInuCfzL+dDo7dZHHtU0fZD2iC0=;
 b=K5OK/Um53hdJM+LxLh/jwwqaeJCcqiEvRJ6S3eYkTjeNOwfHJY71lD4HsTFSM0VIgT
 woBPABm6LGmtHGdEJAhB19z0ifm5+Xsmg9GFf6K7WUV+LExQU+XBYhhKwja5Zdokvq3H
 Erw5NE7uOkdnuHCFBkGCMZRl9TjWDi8uqhSr3eRZP+Yk+ztuGzluZ018z7wuusOuxUPH
 unA3GCSppc2wRR255jWbQdU+EblpT/EmVGbbtKtwDmwEWvB+y0fLA3tiX7wB9HA6EatQ
 bfFc0zjJ4KKGzRf2QBs361Wi0aFHOm+V/LawlTVf0I7wQ32p+INr5x099PtlpMV4lGMY
 Mbaw==
X-Gm-Message-State: AOJu0YwNw3Hkgg7iXDa2xCsB9+iSPheD8MlCgR+dq1WGYKIT7UXJLPHZ
 7CqV6dLl+AGz7t1i34Elivt03w==
X-Google-Smtp-Source: AGHT+IFBM6qBD5Z8etFJth9xYWuZU2OYq9ybL//WTaViCH9Z1q6IDQJ0cv18+s90O1Lagv3qwTg1VA==
X-Received: by 2002:a05:600c:3787:b0:3fe:89be:cd3 with SMTP id
 o7-20020a05600c378700b003fe89be0cd3mr6579845wmr.22.1692016767877; 
 Mon, 14 Aug 2023 05:39:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0?
 ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a1cf70e000000b003fe24441e23sm14193823wmh.24.2023.08.14.05.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 05:39:27 -0700 (PDT)
Message-ID: <fa5d2936-93db-4965-be6d-1b6cdaee2755@linaro.org>
Date: Mon, 14 Aug 2023 14:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] drm/panel: simple: Add support for Mitsubishi
 AA084XE01
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20230807123138.67443-1-miquel.raynal@bootlin.com>
 <20230807123138.67443-2-miquel.raynal@bootlin.com>
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
In-Reply-To: <20230807123138.67443-2-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Weber <thomas.weber@corscience.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/08/2023 14:31, Miquel Raynal wrote:
> From: Thomas Weber <thomas.weber@corscience.de>
> 
> Add support for the Mitsubishi AA084XE01 panel which is an 8.4 inch XGA
> TFT-LCD module for industrial use.
> 
> Link: https://www.mouser.fr/datasheet/2/274/aa084xe01_e-364171.pdf
> Signed-off-by: Thomas Weber <thomas.weber@corscience.de>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes in v4:
> * None.
> 
> Changes in v3:
> * Fix connector type.
> 
> Changes in v2:
> * Add connector type and bus flags.
> 
>   drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a247a0e7c799..e498a40e1f78 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2763,6 +2763,32 @@ static const struct panel_desc mitsubishi_aa070mc01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>   };
>   
> +static const struct drm_display_mode mitsubishi_aa084xe01_mode = {
> +	.clock = 56234,
> +	.hdisplay = 1024,
> +	.hsync_start = 1024 + 24,
> +	.hsync_end = 1024 + 24 + 63,
> +	.htotal = 1024 + 24 + 63 + 1,
> +	.vdisplay = 768,
> +	.vsync_start = 768 + 3,
> +	.vsync_end = 768 + 3 + 6,
> +	.vtotal = 768 + 3 + 6 + 1,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +static const struct panel_desc mitsubishi_aa084xe01 = {
> +	.modes = &mitsubishi_aa084xe01_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 1024,
> +		.height = 768,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +};
> +
>   static const struct display_timing multi_inno_mi0700s4t_6_timing = {
>   	.pixelclock = { 29000000, 33000000, 38000000 },
>   	.hactive = { 800, 800, 800 },
> @@ -4286,6 +4312,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "mitsubishi,aa070mc01-ca1",
>   		.data = &mitsubishi_aa070mc01,
> +	}, {
> +		.compatible = "mitsubishi,aa084xe01",
> +		.data = &mitsubishi_aa084xe01,
>   	}, {
>   		.compatible = "multi-inno,mi0700s4t-6",
>   		.data = &multi_inno_mi0700s4t_6,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
