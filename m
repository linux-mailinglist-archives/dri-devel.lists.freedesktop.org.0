Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61308C6DAB
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3681C10E23A;
	Wed, 15 May 2024 21:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bodIrdCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B2410E23A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 21:16:57 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-351d309bbecso500613f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715807815; x=1716412615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=uO72t1z4PhC45RlSB4zxjIXXfxmOyzDDnn9KfpOoEe4=;
 b=bodIrdCGtORkA+Sd+IkoboOI+u5v+NRPn6bJJs5iOxrmMTUqbdfscYqw24aoZAu7i+
 JGYLFvOiWbNFgea7ninSy31YhIrdAWNgB0GZUWH8Xm0GaoX9smc+KxjqDGq+lwhh+tVE
 cuufhfGXych1yzjT1l5IxwXjNIpyqEy6IzUoXF2caKqhr9T2jHNNzF9p5/TyCR3FZVWQ
 YLbEdjPnm+ft0RtxbFqnvKkUDkXB/hk3ABxXfrOPyXCgSvPdhjxkh+qbpX3UftRvWL4Z
 vWTd9SUv3FLIP88WVbH66kCw1XbPPiiTDwosF646M6y6pSbHR6GPhizz7Vh4vXJvQv5y
 glvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715807815; x=1716412615;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uO72t1z4PhC45RlSB4zxjIXXfxmOyzDDnn9KfpOoEe4=;
 b=YLF6mygyuW2tb65FzqukidgG+9GLpJuyPDblugCQ8rsXLj5Fc6Bd8iO1w3cbmdYX9Z
 A8ht+77MGOHjS0dZhaGts8o5Tndr6JGwsLrsyglg2u2pc9Gi16eUAVX9KO92Y4Nl7mXq
 f0ENMfxWssMUoA2tP1qSGBpsNktHii1wihDQNrnl2uJXV5LwdXfXtBf1vGxELr35pCff
 jOMp/qfaiYQwnHnFYBr5fBXbRknW4hQhklHW+H3CdUXIcslTMJXfVmzGbRzQ0E8DbsvF
 wT1Uk8bV9yUxWee5f7SjleP0DwRqXS2EOFH/nEd3guyznJmbxSKPdEqMwQoSMEkV8pfy
 YGwQ==
X-Gm-Message-State: AOJu0YxVFg+tbLOVCvlFkCdp9GFyXR1H/I8eqhLVD4NCLEMA6cK1788G
 1HMYR5ZfUcJX2kVcOfH+F85uNXdGaPz3eVE6GnIJQXF42xFXc571t3ywTRdLyEU=
X-Google-Smtp-Source: AGHT+IEUctWvzTXBDh1cypHW7Zi5V2fUkv/hXY0KH6Mc4+fNR34ZBg14Lrsy8sjgxwL6kcVno6FY0A==
X-Received: by 2002:a05:6000:1968:b0:34d:707c:922a with SMTP id
 ffacd0b85a97d-3504a6310bbmr16846290f8f.13.1715807815272; 
 Wed, 15 May 2024 14:16:55 -0700 (PDT)
Received: from [10.1.2.176] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce25casm244577145e9.20.2024.05.15.14.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 14:16:54 -0700 (PDT)
Message-ID: <721b4837-420f-4acf-95b4-514395ed8896@linaro.org>
Date: Wed, 15 May 2024 23:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/6] drm/panel: simple: Add Lincoln Tech Sol
 LCD185-101CT panel
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
 <20240515095133.745492-5-a-bhatia1@ti.com>
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
In-Reply-To: <20240515095133.745492-5-a-bhatia1@ti.com>
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
> Add support for Lincoln Technology Solutions LCD185-101CT, 10.1",
> 1920x1200, 8-bit TFT LCD with LVDS interface, LED backlight and PCAP
> touch support (Goodix GT928).
> 
> [0]: Panel Datasheet
> https://lincolntechsolutions.com/wp-content/uploads/2023/04/LCD185-101CTL1ARNTT_DS_R1.3.pdf
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index dcb6d0b6ced0..10e974bffd28 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2870,6 +2870,35 @@ static const struct panel_desc lg_lb070wv8 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct drm_display_mode lincolntech_lcd185_101ct_mode = {
> +	.clock = 155127,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 128,
> +	.hsync_end = 1920 + 128 + 20,
> +	.htotal = 1920 + 128 + 20 + 12,
> +	.vdisplay = 1200,
> +	.vsync_start = 1200 + 19,
> +	.vsync_end = 1200 + 19 + 4,
> +	.vtotal = 1200 + 19 + 4 + 20,
> +};
> +
> +static const struct panel_desc lincolntech_lcd185_101ct = {
> +	.modes = &lincolntech_lcd185_101ct_mode,
> +	.bpc = 8,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 217,
> +		.height = 136,
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
>   static const struct display_timing logictechno_lt161010_2nh_timing = {
>   	.pixelclock = { 26400000, 33300000, 46800000 },
>   	.hactive = { 800, 800, 800 },
> @@ -4644,6 +4673,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "lg,lb070wv8",
>   		.data = &lg_lb070wv8,
> +	}, {
> +		.compatible = "lincolntech,lcd185-101ct",
> +		.data = &lincolntech_lcd185_101ct,
>   	}, {
>   		.compatible = "logicpd,type28",
>   		.data = &logicpd_type_28,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
