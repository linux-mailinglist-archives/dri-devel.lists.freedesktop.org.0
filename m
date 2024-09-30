Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AF898A6FA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 16:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2121310E517;
	Mon, 30 Sep 2024 14:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mz+WWgcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B0210E517
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 14:28:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-37cc84c12c2so2287924f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727706513; x=1728311313; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qs9fqcM4y/62FZTYV45HZ7IoYxEq/8eoOWfouR/4iR0=;
 b=mz+WWgcId9E7dJepA+6CaTHQSMCuctE8hMVhaOm5dQNAkiBgfo20X78akUP2a5rRSF
 jQ2Psls49WNYUBHCBmquyoDZNkor3zxUcIeToNZIMZoI5aDcNwSrYDHnnXEOikK5kaQT
 zzonJ50b5vWb/G/Rn+RVnovrkoiT4fOVz4lLODbmzFOKGGCTqBhxQcoTLa7ILmW/WkrR
 6baJCDfQ3HGaozVMZkp2d4kjT/qA1tKaXBDCq455e1s5MwmbjVxExwUPC8lLZePl7Y5s
 aeAyrBIWiRoA7uhy46RGSUJQ0ZAQL9SMrPl31UZfQwRCfZsg0QN5HyueIaMCGW1TZXPJ
 /0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727706513; x=1728311313;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qs9fqcM4y/62FZTYV45HZ7IoYxEq/8eoOWfouR/4iR0=;
 b=qDQS5hDduG58lz43zC4VrcF984jGfJqesWWE0Mhyovp6ozaB6WWwMMx1QhbaYTpuFw
 I1uU/95XQ5osi0iXMEzgn++qzFjidZ6SP950f0Was2YN8XN3RqlNFy0qTSnyo9hcB6VC
 5Q4iwF0DwEtqwdj94rO9fjCmsXrVKDZ6zEMILLKY6K7NZlygEk8ZrKEneVo8ZYpzHFNw
 Yhf2SQwBpjjHrofSq5td8BWMQW4EJb+vYyADhdyqyeaJ/mYDY0aMtBjAcx4id4XANxo8
 ZOaPRKkGH+w90AEn6tBmVKCr1jr1u1RH3hj22ldWMVartYKLt3HH0AMj23cY3KkOASvf
 vr3g==
X-Gm-Message-State: AOJu0YzWc6NslGSMtUI7hj/fe1+RhA6nhP30kd+3pTYM6NXPUwGKvVjG
 Ng5dLOSpHZcpdG4ua2gyGATuDoVyKIpoTJGOBPki/wa82z4Se4xkkt7cQ4a2v/U=
X-Google-Smtp-Source: AGHT+IEM2DcMunLEXQ0MqIlR8/rqi0iScdiX8I6h2sTZyeX/CjsYANv0QIzwmOhRTVKq9xpqbrx7lw==
X-Received: by 2002:adf:edc9:0:b0:37c:c5d6:b2d2 with SMTP id
 ffacd0b85a97d-37cd59df35amr7661374f8f.0.1727706513467; 
 Mon, 30 Sep 2024 07:28:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bdc6:abc9:5047:7828?
 ([2a01:e0a:982:cbb0:bdc6:abc9:5047:7828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd57427fbsm9123453f8f.100.2024.09.30.07.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 07:28:32 -0700 (PDT)
Message-ID: <76f38f99-79af-4015-b07b-6ff3ec070cdb@linaro.org>
Date: Mon, 30 Sep 2024 16:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] drm/panel: ili9322: Constify struct regmap_bus
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
 <20240925-drm-const-regmap-v1-5-e609d502401b@gmail.com>
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
In-Reply-To: <20240925-drm-const-regmap-v1-5-e609d502401b@gmail.com>
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

On 25/09/2024 17:42, Javier Carrasco wrote:
> `ili9322_regmap_bus` is not modified and can be declared as const to
> move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> index 4a6dcfd781e8..94b7dfef3b5e 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> @@ -318,7 +318,7 @@ static int ili9322_regmap_spi_read(void *context, const void *reg,
>   	return spi_write_then_read(spi, buf, 1, val, 1);
>   }
>   
> -static struct regmap_bus ili9322_regmap_bus = {
> +static const struct regmap_bus ili9322_regmap_bus = {
>   	.write = ili9322_regmap_spi_write,
>   	.read = ili9322_regmap_spi_read,
>   	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
