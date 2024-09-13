Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD79977C09
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B456110E14F;
	Fri, 13 Sep 2024 09:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P2ZqtgZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5DD10E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:18:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37747c1d928so499012f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726219096; x=1726823896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=g+lCBvfZhk89IxuyRik45Usszh1RJXdqxxur9MDAw60=;
 b=P2ZqtgZ7MFYj6s/zNKzyaep693W/ZDf4qE9Bpo1XCmmIluQ/P4BcnXRCBHveXXjhfA
 WBRT9NHinhnqr2RzLaC+H6kTOaJ3sgTcR1hvx/UjQmoaYquiFbpUpkVN9qkS04OeUBR9
 1lzzmH2U+AtnKBzxbTz6oWSFGV0VjVGxQM0s0lV8/UzlMi/grAd4VVSFLjxO0Eyd0JDj
 HtRLTvN+OFOTzM8rIourZInpCfIivZ0csZ1g6sO6ww4VAqvptZ9TtGYz2EWjjqLaDLm9
 oKVc0Wiglecv6JJ6wMJ8m3B1+tsGPv6UFHdNGClq3JzV+l/Sqwggoie2n3UPzMQUcATU
 LoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726219096; x=1726823896;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=g+lCBvfZhk89IxuyRik45Usszh1RJXdqxxur9MDAw60=;
 b=ibVSp6ZeOXAqEpZjii13hJcTCYSiKGIv5rHhyHS6VJ0saZ1xTQ3cFh19rXZ7Cq6uoI
 n+VzTmOy6nlTWlRsaUvqFUae/vp5JvmXZ20eQ2i7IGEQx+dRgmaaL0oOkTMjSAqRh766
 vuCvXmJXI2UncoAVfhnCxdU5olKdd7WAmTWnaGHgT9pAil7lGkVA8OzqziwVnMgv0lj5
 PGj0pnGXyFyVsQdUkSgu31K8pF8XIh8XBma6IrmMQrge56XdqbwmkMvrhhyEXJlRNEVs
 agGuMRZqtJO0QZzUjtrqaHSqpe8J6/Fz8RkpLNQdvYUMOqi8X7ROpT3mWS7ltmpO7cqN
 arjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkpQaY99eKwkhtVBcfHtwdeJxUSqrO8w+mGDR2KF7V8/tV/4ce7JMZ+5as7Tm9EFR6aSUK6dhV+Rg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPBBEeicRSxv+Z7Lp116omtzOQOfsISi6JHRv0ObKjyup6z5yo
 18Dkxw7USjN2eij5Z5caFGUtbNoeCX72GpgqMRP40tP0CdY94qbzAfbLC2V721w=
X-Google-Smtp-Source: AGHT+IFhW2GYxSfgVCqM06/BxMKkLw7o4vA1zm4kWO44iV8QW6/npglLmLNYsCv3nMYyjlfU/pSZFA==
X-Received: by 2002:a5d:49d0:0:b0:365:f52f:cd44 with SMTP id
 ffacd0b85a97d-378d625a9demr959427f8f.57.1726219095775; 
 Fri, 13 Sep 2024 02:18:15 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956e8a98sm16352062f8f.117.2024.09.13.02.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 02:18:15 -0700 (PDT)
Message-ID: <813cfef8-6464-4927-be2d-55fef1104416@linaro.org>
Date: Fri, 13 Sep 2024 11:18:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: panel-lvds: Add compatible
 for Jenson BL-JT60050-01A
To: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
References: <20240828074753.25401-1-frieder@fris.de>
 <20240828074753.25401-3-frieder@fris.de>
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
In-Reply-To: <20240828074753.25401-3-frieder@fris.de>
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

Hi,

On 28/08/2024 09:46, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The Jenson BL-JT60050-01A is a 7" 1024x600 LVDS display.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes for v2:
> * Add tag from Conor (thanks!)
> ---
>   Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 155d8ffa8f6ef..5af2d69300751 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -50,6 +50,8 @@ properties:
>             - hannstar,hsd101pww2
>             # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
>             - hydis,hv070wx2-1e0
> +          # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
> +          - jenson,bl-jt60050-01a
>             - tbs,a711-panel
>   
>         - const: panel-lvds

How do you want to deal with that, I can apply both patches 1 & 2 to drm-misc-next, is that ok ?

Neil
