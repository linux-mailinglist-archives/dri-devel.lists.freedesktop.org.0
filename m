Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3917F9B9E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 09:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D56110E1FE;
	Mon, 27 Nov 2023 08:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAB310E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 08:21:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-332c7d4a6a7so2602162f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 00:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701073296; x=1701678096; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=a7viWszIcXFoOpqHRSaRGzVaaNqOyV/oWHsy7smbtVg=;
 b=Wc2H7F4SUsGzpJ0K/Jq9q3VtaEDBdU+dlBGHA+ugNWBkIB7IhdURp6NQP1zUq65sP2
 FJE5LXPXj9Z2kT/IHEILD46PkAqgENwJsAw4O6lenv165PDF2hEofRWjxFc/9MLTQj6t
 Lp21/FWV9gRy4/l25WHXP2wMR/zNBHGU5IIDPfhXlmq1MFiRIi3QCI3fXxjyBHRTABmv
 3rO8qVO8NsE7mGqbWU5Dmb2o7wxGbJpJ74i7Qab1oSqQMW1praI6HIPE2qW+qDS0eFKo
 yhUl+cckmSWbfWh6Io8ywD1DMN5Xd7yRq5EitPOK45uTw7E5vrfebRSnHk27hioxvXbJ
 RyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701073296; x=1701678096;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=a7viWszIcXFoOpqHRSaRGzVaaNqOyV/oWHsy7smbtVg=;
 b=L7ljOFccTXt20XizrZFAHXsZYOqgmGkiCI4YtfnFTneoPNuD4ta5X3Y7/BytdqE7mA
 2tTmwtWabmva+cq0Prvk3jWaJOJEE8pj6ol7EhiU0qFP67bI6yY3rMKaf9bBmAyr6Fne
 02RPRCZZYbcPfJmuLdb53gr1Za6SGXdAwjprUioV92qSZvyKO6Ym2cUvx3qS8keXgsG/
 VbPQqSV1AyS9UbQyNiL9ejeNFCaUYctn1AMIMxhXOWRGdqnk0u6MJcEEo008bbYM3k08
 n2eMNAXoTlXuBiLRoJ/DmC+DeYwoeAhGS5i9/aPqNl/HAZ/ql7T4wjx3MSQ9+kS+7ZaL
 Ti6Q==
X-Gm-Message-State: AOJu0YwYbSRboLjI861b3AuA7pYLcuuWSiMKmqN7usaZ6bv9WN6qYJe0
 VKKG7iIr04zSrf8ZXLfpU/6f6A==
X-Google-Smtp-Source: AGHT+IFkDZ/Tc9TFzjuDbFecp8bY9iP6OY/2ge/yDGEVed9tVj/eRKiYrarEioRc6Be7l6syA6eQog==
X-Received: by 2002:adf:f388:0:b0:332:d152:5e9b with SMTP id
 m8-20020adff388000000b00332d1525e9bmr7418994wro.57.1701073296160; 
 Mon, 27 Nov 2023 00:21:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff?
 ([2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff])
 by smtp.gmail.com with ESMTPSA id
 w27-20020adf8bdb000000b00332e5624a31sm10650138wra.84.2023.11.27.00.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 00:21:35 -0800 (PST)
Message-ID: <39219cc4-e10a-4cee-9f14-fde061317e37@linaro.org>
Date: Mon, 27 Nov 2023 09:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 00/12] drm/meson: add support for MIPI DSI Display
Content-Language: en-US, fr
To: Vinod Koul <vkoul@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
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
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 "Lukas F. Hartmann" <lukas@mntre.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

On 24/11/2023 09:41, Neil Armstrong wrote:

<snip>

> 
> ---
> Neil Armstrong (12):
>        dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
>        dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: add example covering meson-axg-hhi-sysctrl
>        dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop example
>        dt-bindings: phy: amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example

Could you pick patches 3 and 4 ? they are both reviewed.

Thanks,
Neil

>        dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
>        clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
>        clk: meson: add vclk driver
>        clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
>        drm/meson: gate px_clk when setting rate
>        arm64: meson: g12-common: add the MIPI DSI nodes
>        DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
>        arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper
> 
>   Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
>   .../phy/amlogic,g12a-mipi-dphy-analog.yaml         |  12 -
>   .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml    |  17 -
>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  33 ++
>   arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
>   .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 384 +++++++++++++++++++++
>   .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   2 +-
>   arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  74 ++++
>   .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 +-
>   drivers/clk/meson/Kconfig                          |   5 +
>   drivers/clk/meson/Makefile                         |   1 +
>   drivers/clk/meson/g12a.c                           | 106 ++++--
>   drivers/clk/meson/vclk.c                           | 141 ++++++++
>   drivers/clk/meson/vclk.h                           |  51 +++
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |   7 +
>   include/dt-bindings/clock/g12a-clkc.h              |   2 +
>   17 files changed, 858 insertions(+), 51 deletions(-)
> ---
> base-commit: b0b93834348aaf1a6e14693b4f1d17d3ec024257
> change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a
> 
> Best regards,

