Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E1691BA1F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 10:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A2D10E102;
	Fri, 28 Jun 2024 08:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f6A5Fx7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2405510E102
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 08:36:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so3077971fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 01:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719563781; x=1720168581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zDb68hW066iuzOiiQ2VnUlOWvx4tBIA+y5FTzYzGwMY=;
 b=f6A5Fx7Z12gD389kRhwRI/Xlxg4Gon651QNeOTZfB3gA8bxFxG+dZCASt+BCYoOaja
 z95R51XjEzjaXldWPid0FKW8qiQb5xB+nHQPj9Q4ib75b68QyrWqVxOen1uZB5oQXQcB
 wDDAkop8cT2Dd8GMZtZizp63WhjvHZQUsm8BP3r2NQAuMM23I74WTuT9mxuVpxHZ72n2
 YKrfYWaNhfr1WPqrH+EUCv8IEKMslXxVbwT860VegI3qAWeUBmFe0a7EqW7IMp9bKvRt
 bbYTrxnW+7Et8KOo9grEOSawFf+RmDXcxhzM/uVK+JtOsicAByVLNvz6DZDs6p6Yw/gJ
 YYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719563781; x=1720168581;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zDb68hW066iuzOiiQ2VnUlOWvx4tBIA+y5FTzYzGwMY=;
 b=O5tppVlqQb+O8r+bwkGSz/B3OAKJifzrAU0a1+xXbUTEkXCNkn+lFqbFVrKM+vINYY
 2YAY0sSu6cqeo9tXpF6J31UXIJ5B983KrejuRe9dBmOaS60BKkFK2syQ1sN5PLZtuP1w
 JVfnhA/LlskCfgOTey+27Vcb6NNcS5YLYQlgLwKLULtGrmAuFe1UjpramGYcczLC61kF
 AfuTtKi9JCY/H86ZSEoMYVXSbJi/cQJ1eIKpUhOGU83TCt6uxVRmO8Ff+5Xt/BdWOk8n
 3PvRJ6Ho+eBz9EsmRlumwQStN3H7MAKwDxXO1paZVq3j6ytzEFA6uNDaBb7hQ5shwF06
 fB6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWofVVcf2R+YFDBtJqqSaeVRJNompMnDSnKi6U1+fiZlGHoDXiUJlSfJCYnJQs7bd13i3n+cJNPoMrneC89yMkW9GSZPI6Vu/XNNd63WbKR
X-Gm-Message-State: AOJu0YwWK1rzl1hZN4DtEXZDY+cpLyk6bmqa9a2mIMkTmDxtcfwRtX5p
 eXG4qWidWiykFmqCf3UmDjjVoZ/wtyQO4+ee2J6yAMYJtkVpz7XkYjX1vPFqsb4=
X-Google-Smtp-Source: AGHT+IGSS2uuHkO4/MuG/M3e/kHyZ8thwkKSOxthIVen75iICKKl6wLeffk0Mx4bh95U1jhRuDh3cA==
X-Received: by 2002:a2e:a98c:0:b0:2ec:89b8:3d2f with SMTP id
 38308e7fff4ca-2ec89b84582mr78445711fa.19.1719563780734; 
 Fri, 28 Jun 2024 01:36:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b17d:324d:ca1:ab31?
 ([2a01:e0a:982:cbb0:b17d:324d:ca1:ab31])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af59732sm24574945e9.11.2024.06.28.01.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 01:36:20 -0700 (PDT)
Message-ID: <0975fcb0-f4e7-4006-997b-92fcf57e450b@linaro.org>
Date: Fri, 28 Jun 2024 10:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Jiangsu Smartwin
 SMMT043480272A-A19
To: Marco Felsch <m.felsch@pengutronix.de>, quic_jesszhan@quicinc.com,
 sam@ravnborg.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240626161714.4057983-1-m.felsch@pengutronix.de>
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
In-Reply-To: <20240626161714.4057983-1-m.felsch@pengutronix.de>
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

Hi Marco,

On 26/06/2024 18:17, Marco Felsch wrote:
> Add compatible to panel-simple for Jiangsu Smartwin Electronics
> SMMT043480272A-A19 4.3" 480x272 LCD-TFT panel.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>   .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 5067f5c0a272..6fcb1ebb86f9 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -206,6 +206,8 @@ properties:
>         - innolux,p120zdg-bf1
>           # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
>         - innolux,zj070na-01p
> +        # Jiangsu Smartwin Electronics 4.3" (480x272) TFT LCD panel
> +      - jianda,smmt043480272a-a19
>           # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
>         - kingdisplay,kd116n21-30nv-a010
>           # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel

This doesn't apply anymore, Could you rebased on drm-misc-next ?

Thanks,
Neil
