Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD1FAEE287
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C6710E48B;
	Mon, 30 Jun 2025 15:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VQxAuUT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C939C10E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:32:07 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso29697205e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751297526; x=1751902326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=XSXgoxaay+PYA58c4zjhPzFMDnFgtPjItwIxzy0ui3k=;
 b=VQxAuUT5ghv6qbRdJhiQ4xA1kHdeECyOTKnGhqUqj7v4JDspuZ8TojaKw/V5DOarn/
 pGt38ig6i4vO7+nXHV700l45d2h9FTtVj6GjeuUZhLNxK1ZnbsqJ4cKLJra2D1fszRpD
 dN8t+unBmSpJb03rydX2C0i6G0H/XSd2Tslw690o6lnda7UNOHfCdB2PEjESin8HnCVE
 wCV+aPmhIX4qtPh2femGMt7iK2oj8n+8Y9PVdR/Q0+uQBJBsZ67mq2I0np0igejoX7vO
 og2si4oRanylnUVhl0GI7PyJ2DcaJJsZ2W4OALV6UCWkfrJkFwIv/akxFa+DxCTjVB9i
 7gpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751297526; x=1751902326;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XSXgoxaay+PYA58c4zjhPzFMDnFgtPjItwIxzy0ui3k=;
 b=mqZkRtP/4Mz6fpdqzXOtJvYbB0O3ebBPS7B9PCEVEpdNRCibMsijerYdTsHTEdznvs
 M/O4rtOSHbcMuho4RA52mibjOSFKHZvKwCSFRNFVT1ZA7DiVvcU5hdgQQKUuNSXsIYm3
 lZj5vSWJyKcBfxQb0BhX4oYRgKBlgs6eRsLDu4nW5Pm6nK2+yZ16eFguJw0xn1C8eF5Z
 p7G+w5S7pXxVmFug1Vc+E+MKOEbJudARnpgGkRmI9d6CwGgIFXV0pIegynLhVEJ3b/MJ
 U49prZOq5e8uONdyxpQi7X7nlZt4NVEkhWSvMR/veUqKQRVj8qe9W8ynTNSChPReHmEl
 GlSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjh9do45kaca5osD+ZCotxpqR5uchqGY7df3c1qWZOdT2eggy10zvnFWNMUmBO7Hb0OSWcVy5mg/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK3DmBmpnP7B9Wcq4ZESiEndvuN5V5J7wDR60/TC1meQFYV1JC
 Uj4XEQIsW5pvnuAAkeMu0k4MOn5W2oQ1rL4fypI+HAqPXIDP4PTXHL1haSBZRWC0RS8=
X-Gm-Gg: ASbGncuiiKoGwhUVNz1vC1lSsVnt7i6iP1Db7SYSAItenfdfoyxj+aRv3gJUyFc05g4
 799MQEb5H1BRMTxeck6wx4tdBcWiPT4X8T34FpUA3U34Mlw755/m6j934d4xLr0cjrbG7eEX7DN
 HF/VE9SAcEI8Jf7wPtevOt5D9pmznrZbvSVw9J5xFJYWJFm8PVJCNT4638efzEP2LukN47Hbhfp
 xrmN2lzB6hjgeaMU9EVUU2E010UoQChXalXo6M22xdEKlnFWIABWLI6Xrcc/Dn500NblnZ1RlLl
 byzGuajGG/5dr5EJhATEPDJxi45n5d5kjb+ehakBcBYgEDOKRFI735KjFQ+YEJZYKNQ47lbBE+t
 kRipzKWWsf0T3Op40e2fppmYbq2Z2o2XBuSXe4YF+SmcrlLMB7g==
X-Google-Smtp-Source: AGHT+IHseISBprLA2enzJqvRpN/1R07sVIxG8l/xh24qn9zQwZvQJHG3l/2jqttAmFwaBuecmkfNRA==
X-Received: by 2002:a05:600c:1f0e:b0:453:6150:de50 with SMTP id
 5b1f17b1804b1-4538ee625b2mr121325795e9.28.1751297525987; 
 Mon, 30 Jun 2025 08:32:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb?
 ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538234b6b3sm172687355e9.13.2025.06.30.08.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:32:05 -0700 (PDT)
Message-ID: <a6d1e281-2ba4-4b47-86b6-5bf57fa0b71a@linaro.org>
Date: Mon, 30 Jun 2025 17:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: nv3052c: Reduce duplication of init sequences
To: Priit Laes <plaes@plaes.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Watts <contact@jookia.org>, Ryan Walklin <ryan@testtoast.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250619132211.556027-1-plaes@plaes.org>
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
In-Reply-To: <20250619132211.556027-1-plaes@plaes.org>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/06/2025 15:22, Priit Laes wrote:
> Although there are various small changes between the init
> sequences, the second half is common for all 3 currently
> supported displays.
> 
> Note that this is only compile-tested.
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>

If you can find someone to test this patchset, I'll apply it because it looks good!

Thanks,
Neil

> ---
>   .../gpu/drm/panel/panel-newvision-nv3052c.c   | 408 ++++--------------
>   1 file changed, 74 insertions(+), 334 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 06e16a7c14a7..0d8a367b83fd 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -43,59 +43,12 @@ struct nv3052c {
>   	struct gpio_desc *reset_gpio;
>   };
>   
> -static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
> -	// EXTC Command set enable, select page 1
> -	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x01 },
> -	// Mostly unknown registers
> -	{ 0xe3, 0x00 },
> -	{ 0x40, 0x00 },
> -	{ 0x03, 0x40 },
> -	{ 0x04, 0x00 },
> -	{ 0x05, 0x03 },
> -	{ 0x08, 0x00 },
> -	{ 0x09, 0x07 },
> -	{ 0x0a, 0x01 },
> -	{ 0x0b, 0x32 },
> -	{ 0x0c, 0x32 },
> -	{ 0x0d, 0x0b },
> -	{ 0x0e, 0x00 },
> -	{ 0x23, 0xa0 },
> -	{ 0x24, 0x0c },
> -	{ 0x25, 0x06 },
> -	{ 0x26, 0x14 },
> -	{ 0x27, 0x14 },
> -	{ 0x38, 0xcc }, // VCOM_ADJ1
> -	{ 0x39, 0xd7 }, // VCOM_ADJ2
> -	{ 0x3a, 0x4a }, // VCOM_ADJ3
> -	{ 0x28, 0x40 },
> -	{ 0x29, 0x01 },
> -	{ 0x2a, 0xdf },
> -	{ 0x49, 0x3c },
> -	{ 0x91, 0x77 }, // EXTPW_CTRL2
> -	{ 0x92, 0x77 }, // EXTPW_CTRL3
> -	{ 0xa0, 0x55 },
> -	{ 0xa1, 0x50 },
> -	{ 0xa4, 0x9c },
> -	{ 0xa7, 0x02 },
> -	{ 0xa8, 0x01 },
> -	{ 0xa9, 0x01 },
> -	{ 0xaa, 0xfc },
> -	{ 0xab, 0x28 },
> -	{ 0xac, 0x06 },
> -	{ 0xad, 0x06 },
> -	{ 0xae, 0x06 },
> -	{ 0xaf, 0x03 },
> -	{ 0xb0, 0x08 },
> -	{ 0xb1, 0x26 },
> -	{ 0xb2, 0x28 },
> -	{ 0xb3, 0x28 },
> -	{ 0xb4, 0x33 },
> -	{ 0xb5, 0x08 },
> -	{ 0xb6, 0x26 },
> -	{ 0xb7, 0x08 },
> -	{ 0xb8, 0x26 },
> -	{ 0xf0, 0x00 },
> -	{ 0xf6, 0xc0 },
> +/*
> + * Common initialization registers for all currently
> + * supported displays. Mostly seem to be related
> + * to Gamma correction curves and output pad mappings.
> + */
> +static const struct nv3052c_reg common_init_regs[] = {
>   	// EXTC Command set enable, select page 2
>   	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
>   	// Set gray scale voltage to adjust gamma
> @@ -215,7 +168,7 @@ static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
>   	{ 0xa0, 0x01 }, // PANELU2D33
>   	// EXTC Command set enable, select page 2
>   	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
> -	// Unknown registers
> +	// Page 2 register values (0x01..0x10) are same for nv3051d and nv3052c
>   	{ 0x01, 0x01 },
>   	{ 0x02, 0xda },
>   	{ 0x03, 0xba },
> @@ -236,6 +189,62 @@ static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
>   	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
>   	// Display Access Control
>   	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
> +
> +};
> +
> +static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
> +	// EXTC Command set enable, select page 1
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x01 },
> +	// Mostly unknown registers
> +	{ 0xe3, 0x00 },
> +	{ 0x40, 0x00 },
> +	{ 0x03, 0x40 },
> +	{ 0x04, 0x00 },
> +	{ 0x05, 0x03 },
> +	{ 0x08, 0x00 },
> +	{ 0x09, 0x07 },
> +	{ 0x0a, 0x01 },
> +	{ 0x0b, 0x32 },
> +	{ 0x0c, 0x32 },
> +	{ 0x0d, 0x0b },
> +	{ 0x0e, 0x00 },
> +	{ 0x23, 0xa0 },
> +	{ 0x24, 0x0c },
> +	{ 0x25, 0x06 },
> +	{ 0x26, 0x14 },
> +	{ 0x27, 0x14 },
> +	{ 0x38, 0xcc }, // VCOM_ADJ1
> +	{ 0x39, 0xd7 }, // VCOM_ADJ2
> +	{ 0x3a, 0x4a }, // VCOM_ADJ3
> +	{ 0x28, 0x40 },
> +	{ 0x29, 0x01 },
> +	{ 0x2a, 0xdf },
> +	{ 0x49, 0x3c },
> +	{ 0x91, 0x77 }, // EXTPW_CTRL2
> +	{ 0x92, 0x77 }, // EXTPW_CTRL3
> +	{ 0xa0, 0x55 },
> +	{ 0xa1, 0x50 },
> +	{ 0xa4, 0x9c },
> +	{ 0xa7, 0x02 },
> +	{ 0xa8, 0x01 },
> +	{ 0xa9, 0x01 },
> +	{ 0xaa, 0xfc },
> +	{ 0xab, 0x28 },
> +	{ 0xac, 0x06 },
> +	{ 0xad, 0x06 },
> +	{ 0xae, 0x06 },
> +	{ 0xaf, 0x03 },
> +	{ 0xb0, 0x08 },
> +	{ 0xb1, 0x26 },
> +	{ 0xb2, 0x28 },
> +	{ 0xb3, 0x28 },
> +	{ 0xb4, 0x33 },
> +	{ 0xb5, 0x08 },
> +	{ 0xb6, 0x26 },
> +	{ 0xb7, 0x08 },
> +	{ 0xb8, 0x26 },
> +	{ 0xf0, 0x00 },
> +	{ 0xf6, 0xc0 },
>   };
>   
>   static const struct nv3052c_reg fs035vg158_panel_regs[] = {
> @@ -291,146 +300,6 @@ static const struct nv3052c_reg fs035vg158_panel_regs[] = {
>   	{ 0xb8, 0x26 },
>   	{ 0xf0, 0x00 },
>   	{ 0xf6, 0xc0 },
> -	// EXTC Command set enable, select page 0
> -	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
> -	// Set gray scale voltage to adjust gamma
> -	{ 0xb0, 0x0b }, // PGAMVR0
> -	{ 0xb1, 0x16 }, // PGAMVR1
> -	{ 0xb2, 0x17 }, // PGAMVR2
> -	{ 0xb3, 0x2c }, // PGAMVR3
> -	{ 0xb4, 0x32 }, // PGAMVR4
> -	{ 0xb5, 0x3b }, // PGAMVR5
> -	{ 0xb6, 0x29 }, // PGAMPR0
> -	{ 0xb7, 0x40 }, // PGAMPR1
> -	{ 0xb8, 0x0d }, // PGAMPK0
> -	{ 0xb9, 0x05 }, // PGAMPK1
> -	{ 0xba, 0x12 }, // PGAMPK2
> -	{ 0xbb, 0x10 }, // PGAMPK3
> -	{ 0xbc, 0x12 }, // PGAMPK4
> -	{ 0xbd, 0x15 }, // PGAMPK5
> -	{ 0xbe, 0x19 }, // PGAMPK6
> -	{ 0xbf, 0x0e }, // PGAMPK7
> -	{ 0xc0, 0x16 }, // PGAMPK8
> -	{ 0xc1, 0x0a }, // PGAMPK9
> -	// Set gray scale voltage to adjust gamma
> -	{ 0xd0, 0x0c }, // NGAMVR0
> -	{ 0xd1, 0x17 }, // NGAMVR0
> -	{ 0xd2, 0x14 }, // NGAMVR1
> -	{ 0xd3, 0x2e }, // NGAMVR2
> -	{ 0xd4, 0x32 }, // NGAMVR3
> -	{ 0xd5, 0x3c }, // NGAMVR4
> -	{ 0xd6, 0x22 }, // NGAMPR0
> -	{ 0xd7, 0x3d }, // NGAMPR1
> -	{ 0xd8, 0x0d }, // NGAMPK0
> -	{ 0xd9, 0x07 }, // NGAMPK1
> -	{ 0xda, 0x13 }, // NGAMPK2
> -	{ 0xdb, 0x13 }, // NGAMPK3
> -	{ 0xdc, 0x11 }, // NGAMPK4
> -	{ 0xdd, 0x15 }, // NGAMPK5
> -	{ 0xde, 0x19 }, // NGAMPK6
> -	{ 0xdf, 0x10 }, // NGAMPK7
> -	{ 0xe0, 0x17 }, // NGAMPK8
> -	{ 0xe1, 0x0a }, // NGAMPK9
> -	// EXTC Command set enable, select page 3
> -	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x03 },
> -	// Set various timing settings
> -	{ 0x00, 0x2a }, // GIP_VST_1
> -	{ 0x01, 0x2a }, // GIP_VST_2
> -	{ 0x02, 0x2a }, // GIP_VST_3
> -	{ 0x03, 0x2a }, // GIP_VST_4
> -	{ 0x04, 0x61 }, // GIP_VST_5
> -	{ 0x05, 0x80 }, // GIP_VST_6
> -	{ 0x06, 0xc7 }, // GIP_VST_7
> -	{ 0x07, 0x01 }, // GIP_VST_8
> -	{ 0x08, 0x03 }, // GIP_VST_9
> -	{ 0x09, 0x04 }, // GIP_VST_10
> -	{ 0x70, 0x22 }, // GIP_ECLK1
> -	{ 0x71, 0x80 }, // GIP_ECLK2
> -	{ 0x30, 0x2a }, // GIP_CLK_1
> -	{ 0x31, 0x2a }, // GIP_CLK_2
> -	{ 0x32, 0x2a }, // GIP_CLK_3
> -	{ 0x33, 0x2a }, // GIP_CLK_4
> -	{ 0x34, 0x61 }, // GIP_CLK_5
> -	{ 0x35, 0xc5 }, // GIP_CLK_6
> -	{ 0x36, 0x80 }, // GIP_CLK_7
> -	{ 0x37, 0x23 }, // GIP_CLK_8
> -	{ 0x40, 0x03 }, // GIP_CLKA_1
> -	{ 0x41, 0x04 }, // GIP_CLKA_2
> -	{ 0x42, 0x05 }, // GIP_CLKA_3
> -	{ 0x43, 0x06 }, // GIP_CLKA_4
> -	{ 0x44, 0x11 }, // GIP_CLKA_5
> -	{ 0x45, 0xe8 }, // GIP_CLKA_6
> -	{ 0x46, 0xe9 }, // GIP_CLKA_7
> -	{ 0x47, 0x11 }, // GIP_CLKA_8
> -	{ 0x48, 0xea }, // GIP_CLKA_9
> -	{ 0x49, 0xeb }, // GIP_CLKA_10
> -	{ 0x50, 0x07 }, // GIP_CLKB_1
> -	{ 0x51, 0x08 }, // GIP_CLKB_2
> -	{ 0x52, 0x09 }, // GIP_CLKB_3
> -	{ 0x53, 0x0a }, // GIP_CLKB_4
> -	{ 0x54, 0x11 }, // GIP_CLKB_5
> -	{ 0x55, 0xec }, // GIP_CLKB_6
> -	{ 0x56, 0xed }, // GIP_CLKB_7
> -	{ 0x57, 0x11 }, // GIP_CLKB_8
> -	{ 0x58, 0xef }, // GIP_CLKB_9
> -	{ 0x59, 0xf0 }, // GIP_CLKB_10
> -	// Map internal GOA signals to GOA output pad
> -	{ 0xb1, 0x01 }, // PANELD2U2
> -	{ 0xb4, 0x15 }, // PANELD2U5
> -	{ 0xb5, 0x16 }, // PANELD2U6
> -	{ 0xb6, 0x09 }, // PANELD2U7
> -	{ 0xb7, 0x0f }, // PANELD2U8
> -	{ 0xb8, 0x0d }, // PANELD2U9
> -	{ 0xb9, 0x0b }, // PANELD2U10
> -	{ 0xba, 0x00 }, // PANELD2U11
> -	{ 0xc7, 0x02 }, // PANELD2U24
> -	{ 0xca, 0x17 }, // PANELD2U27
> -	{ 0xcb, 0x18 }, // PANELD2U28
> -	{ 0xcc, 0x0a }, // PANELD2U29
> -	{ 0xcd, 0x10 }, // PANELD2U30
> -	{ 0xce, 0x0e }, // PANELD2U31
> -	{ 0xcf, 0x0c }, // PANELD2U32
> -	{ 0xd0, 0x00 }, // PANELD2U33
> -	// Map internal GOA signals to GOA output pad
> -	{ 0x81, 0x00 }, // PANELU2D2
> -	{ 0x84, 0x15 }, // PANELU2D5
> -	{ 0x85, 0x16 }, // PANELU2D6
> -	{ 0x86, 0x10 }, // PANELU2D7
> -	{ 0x87, 0x0a }, // PANELU2D8
> -	{ 0x88, 0x0c }, // PANELU2D9
> -	{ 0x89, 0x0e }, // PANELU2D10
> -	{ 0x8a, 0x02 }, // PANELU2D11
> -	{ 0x97, 0x00 }, // PANELU2D24
> -	{ 0x9a, 0x17 }, // PANELU2D27
> -	{ 0x9b, 0x18 }, // PANELU2D28
> -	{ 0x9c, 0x0f }, // PANELU2D29
> -	{ 0x9d, 0x09 }, // PANELU2D30
> -	{ 0x9e, 0x0b }, // PANELU2D31
> -	{ 0x9f, 0x0d }, // PANELU2D32
> -	{ 0xa0, 0x01 }, // PANELU2D33
> -	// EXTC Command set enable, select page 2
> -	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
> -	// Unknown registers
> -	{ 0x01, 0x01 },
> -	{ 0x02, 0xda },
> -	{ 0x03, 0xba },
> -	{ 0x04, 0xa8 },
> -	{ 0x05, 0x9a },
> -	{ 0x06, 0x70 },
> -	{ 0x07, 0xff },
> -	{ 0x08, 0x91 },
> -	{ 0x09, 0x90 },
> -	{ 0x0a, 0xff },
> -	{ 0x0b, 0x8f },
> -	{ 0x0c, 0x60 },
> -	{ 0x0d, 0x58 },
> -	{ 0x0e, 0x48 },
> -	{ 0x0f, 0x38 },
> -	{ 0x10, 0x2b },
> -	// EXTC Command set enable, select page 0
> -	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
> -	// Display Access Control
> -	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
>   };
>   
>   
> @@ -487,146 +356,6 @@ static const struct nv3052c_reg wl_355608_a8_panel_regs[] = {
>   	{ 0xb8, 0x26 },
>   	{ 0xf0, 0x00 },
>   	{ 0xf6, 0xc0 },
> -	// EXTC Command set enable, select page 2
> -	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
> -	// Set gray scale voltage to adjust gamma
> -	{ 0xb0, 0x0b }, // PGAMVR0
> -	{ 0xb1, 0x16 }, // PGAMVR1
> -	{ 0xb2, 0x17 }, // PGAMVR2
> -	{ 0xb3, 0x2c }, // PGAMVR3
> -	{ 0xb4, 0x32 }, // PGAMVR4
> -	{ 0xb5, 0x3b }, // PGAMVR5
> -	{ 0xb6, 0x29 }, // PGAMPR0
> -	{ 0xb7, 0x40 }, // PGAMPR1
> -	{ 0xb8, 0x0d }, // PGAMPK0
> -	{ 0xb9, 0x05 }, // PGAMPK1
> -	{ 0xba, 0x12 }, // PGAMPK2
> -	{ 0xbb, 0x10 }, // PGAMPK3
> -	{ 0xbc, 0x12 }, // PGAMPK4
> -	{ 0xbd, 0x15 }, // PGAMPK5
> -	{ 0xbe, 0x19 }, // PGAMPK6
> -	{ 0xbf, 0x0e }, // PGAMPK7
> -	{ 0xc0, 0x16 }, // PGAMPK8
> -	{ 0xc1, 0x0a }, // PGAMPK9
> -	// Set gray scale voltage to adjust gamma
> -	{ 0xd0, 0x0c }, // NGAMVR0
> -	{ 0xd1, 0x17 }, // NGAMVR0
> -	{ 0xd2, 0x14 }, // NGAMVR1
> -	{ 0xd3, 0x2e }, // NGAMVR2
> -	{ 0xd4, 0x32 }, // NGAMVR3
> -	{ 0xd5, 0x3c }, // NGAMVR4
> -	{ 0xd6, 0x22 }, // NGAMPR0
> -	{ 0xd7, 0x3d }, // NGAMPR1
> -	{ 0xd8, 0x0d }, // NGAMPK0
> -	{ 0xd9, 0x07 }, // NGAMPK1
> -	{ 0xda, 0x13 }, // NGAMPK2
> -	{ 0xdb, 0x13 }, // NGAMPK3
> -	{ 0xdc, 0x11 }, // NGAMPK4
> -	{ 0xdd, 0x15 }, // NGAMPK5
> -	{ 0xde, 0x19 }, // NGAMPK6
> -	{ 0xdf, 0x10 }, // NGAMPK7
> -	{ 0xe0, 0x17 }, // NGAMPK8
> -	{ 0xe1, 0x0a }, // NGAMPK9
> -	// EXTC Command set enable, select page 3
> -	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x03 },
> -	// Set various timing settings
> -	{ 0x00, 0x2a }, // GIP_VST_1
> -	{ 0x01, 0x2a }, // GIP_VST_2
> -	{ 0x02, 0x2a }, // GIP_VST_3
> -	{ 0x03, 0x2a }, // GIP_VST_4
> -	{ 0x04, 0x61 }, // GIP_VST_5
> -	{ 0x05, 0x80 }, // GIP_VST_6
> -	{ 0x06, 0xc7 }, // GIP_VST_7
> -	{ 0x07, 0x01 }, // GIP_VST_8
> -	{ 0x08, 0x03 }, // GIP_VST_9
> -	{ 0x09, 0x04 }, // GIP_VST_10
> -	{ 0x70, 0x22 }, // GIP_ECLK1
> -	{ 0x71, 0x80 }, // GIP_ECLK2
> -	{ 0x30, 0x2a }, // GIP_CLK_1
> -	{ 0x31, 0x2a }, // GIP_CLK_2
> -	{ 0x32, 0x2a }, // GIP_CLK_3
> -	{ 0x33, 0x2a }, // GIP_CLK_4
> -	{ 0x34, 0x61 }, // GIP_CLK_5
> -	{ 0x35, 0xc5 }, // GIP_CLK_6
> -	{ 0x36, 0x80 }, // GIP_CLK_7
> -	{ 0x37, 0x23 }, // GIP_CLK_8
> -	{ 0x40, 0x03 }, // GIP_CLKA_1
> -	{ 0x41, 0x04 }, // GIP_CLKA_2
> -	{ 0x42, 0x05 }, // GIP_CLKA_3
> -	{ 0x43, 0x06 }, // GIP_CLKA_4
> -	{ 0x44, 0x11 }, // GIP_CLKA_5
> -	{ 0x45, 0xe8 }, // GIP_CLKA_6
> -	{ 0x46, 0xe9 }, // GIP_CLKA_7
> -	{ 0x47, 0x11 }, // GIP_CLKA_8
> -	{ 0x48, 0xea }, // GIP_CLKA_9
> -	{ 0x49, 0xeb }, // GIP_CLKA_10
> -	{ 0x50, 0x07 }, // GIP_CLKB_1
> -	{ 0x51, 0x08 }, // GIP_CLKB_2
> -	{ 0x52, 0x09 }, // GIP_CLKB_3
> -	{ 0x53, 0x0a }, // GIP_CLKB_4
> -	{ 0x54, 0x11 }, // GIP_CLKB_5
> -	{ 0x55, 0xec }, // GIP_CLKB_6
> -	{ 0x56, 0xed }, // GIP_CLKB_7
> -	{ 0x57, 0x11 }, // GIP_CLKB_8
> -	{ 0x58, 0xef }, // GIP_CLKB_9
> -	{ 0x59, 0xf0 }, // GIP_CLKB_10
> -	// Map internal GOA signals to GOA output pad
> -	{ 0xb1, 0x01 }, // PANELD2U2
> -	{ 0xb4, 0x15 }, // PANELD2U5
> -	{ 0xb5, 0x16 }, // PANELD2U6
> -	{ 0xb6, 0x09 }, // PANELD2U7
> -	{ 0xb7, 0x0f }, // PANELD2U8
> -	{ 0xb8, 0x0d }, // PANELD2U9
> -	{ 0xb9, 0x0b }, // PANELD2U10
> -	{ 0xba, 0x00 }, // PANELD2U11
> -	{ 0xc7, 0x02 }, // PANELD2U24
> -	{ 0xca, 0x17 }, // PANELD2U27
> -	{ 0xcb, 0x18 }, // PANELD2U28
> -	{ 0xcc, 0x0a }, // PANELD2U29
> -	{ 0xcd, 0x10 }, // PANELD2U30
> -	{ 0xce, 0x0e }, // PANELD2U31
> -	{ 0xcf, 0x0c }, // PANELD2U32
> -	{ 0xd0, 0x00 }, // PANELD2U33
> -	// Map internal GOA signals to GOA output pad
> -	{ 0x81, 0x00 }, // PANELU2D2
> -	{ 0x84, 0x15 }, // PANELU2D5
> -	{ 0x85, 0x16 }, // PANELU2D6
> -	{ 0x86, 0x10 }, // PANELU2D7
> -	{ 0x87, 0x0a }, // PANELU2D8
> -	{ 0x88, 0x0c }, // PANELU2D9
> -	{ 0x89, 0x0e }, // PANELU2D10
> -	{ 0x8a, 0x02 }, // PANELU2D11
> -	{ 0x97, 0x00 }, // PANELU2D24
> -	{ 0x9a, 0x17 }, // PANELU2D27
> -	{ 0x9b, 0x18 }, // PANELU2D28
> -	{ 0x9c, 0x0f }, // PANELU2D29
> -	{ 0x9d, 0x09 }, // PANELU2D30
> -	{ 0x9e, 0x0b }, // PANELU2D31
> -	{ 0x9f, 0x0d }, // PANELU2D32
> -	{ 0xa0, 0x01 }, // PANELU2D33
> -	// EXTC Command set enable, select page 2
> -	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
> -	// Unknown registers
> -	{ 0x01, 0x01 },
> -	{ 0x02, 0xda },
> -	{ 0x03, 0xba },
> -	{ 0x04, 0xa8 },
> -	{ 0x05, 0x9a },
> -	{ 0x06, 0x70 },
> -	{ 0x07, 0xff },
> -	{ 0x08, 0x91 },
> -	{ 0x09, 0x90 },
> -	{ 0x0a, 0xff },
> -	{ 0x0b, 0x8f },
> -	{ 0x0c, 0x60 },
> -	{ 0x0d, 0x58 },
> -	{ 0x0e, 0x48 },
> -	{ 0x0f, 0x38 },
> -	{ 0x10, 0x2b },
> -	// EXTC Command set enable, select page 0
> -	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
> -	// Display Access Control
> -	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
>   };
>   
>   static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
> @@ -655,6 +384,7 @@ static int nv3052c_prepare(struct drm_panel *panel)
>   	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>   	usleep_range(5000, 20000);
>   
> +	/* Apply panel-specific initialization registers */
>   	for (i = 0; i < panel_regs_len; i++) {
>   		err = mipi_dbi_command(dbi, panel_regs[i].cmd,
>   				       panel_regs[i].val);
> @@ -665,6 +395,16 @@ static int nv3052c_prepare(struct drm_panel *panel)
>   		}
>   	}
>   
> +	/* Apply common initialization registers */
> +	for (i = 0; i < ARRAY_SIZE(common_init_regs); i++) {
> +		err = mipi_dbi_command(dbi, common_init_regs[i].cmd,
> +				       common_init_regs[i].val);
> +		if (err) {
> +			dev_err(priv->dev, "Unable to set register: %d\n", err);
> +			goto err_disable_regulator;
> +		}
> +	}
> +
>   	err = mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
>   	if (err) {
>   		dev_err(priv->dev, "Unable to exit sleep mode: %d\n", err);

