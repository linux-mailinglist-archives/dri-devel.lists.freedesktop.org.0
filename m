Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765F6892143
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 17:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED90510E142;
	Fri, 29 Mar 2024 16:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sbyN1WkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2293510E142
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 16:07:57 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4154614b47eso9484945e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711728414; x=1712333214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=910sYo/xx/qV+ioXaoBH98NDqB9jTlEs+LCNU9Jr8Vg=;
 b=sbyN1WkUAtGqFkoshsyJthTsHpBTYtCRnZ4yEpEg0z7CkrN3/i3DNbUK9DcJDftN8U
 aiVoj6CSGjlzWUSTZqfqg2EqTspQ1tQ+1/QsZjLGxPa+RYE23yWQn43Lh95lQITtIq+F
 +z15BIyk152ZUJLfzEpepMrzDBFF+t3J/2aFe8tyrcIjYois/tz6gdoMbFES4DD5Z8rQ
 2JXYQTVlSUZGwi8NGgLg+K37c2jSyuKzz3UTwqti18Eecbw4KEpncLZadWUDUA9btMNw
 256MAzf8Vlho8Wp0pkHz5pLXWYszoeQpwkVucNzt30pew+H/rYLLwJkwdzDyXBwstBSt
 +iVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711728414; x=1712333214;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=910sYo/xx/qV+ioXaoBH98NDqB9jTlEs+LCNU9Jr8Vg=;
 b=oNLu6Cwbh0AwOv0eovJyblzdI8fKhnmFEY/FIIm1HrG+JKVDX3/Tqgb/e0jFfhIThL
 P16DqAIwAKuIQ4Xvem68vp5XOwC0dO8ZpxDRIpRYIPs1+SUVGsywSiNrxEALk/JCHE0V
 MFLBaAKzH3JsWYmIiKc1+flaznNHjd3FL1Q+0UuzxvrxTdMi7uci+hNhFkU98B+lhc/A
 yve4+AcSt7Y5AybeeZsRMWCjNaGc86TtLlDd+9ZYIGP4LDUVV3UpLnXZVGs4GSHY3IIE
 s+c4bvxdSmJR24G3fv+syGJv9ALjWk+Oz+Pyweo70KacmUuox6ueUa4fum29T6e7rWvp
 vyYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTtWPH01kJbN/faVdbOqxKsCdsXLlQlb1Cdfj/Su21baT2zLGVnNhjGGG8541257oxZZBVj6I9tk1XSoYpaTen8Db4nFMsxVRlcXKLL6u5
X-Gm-Message-State: AOJu0Ywyon1RxbuMudv7Mf8IBVHlWI/M2A3Ng4Ch0aNCyPt8tDBOYcs7
 fbHiUzWJZZDAkL4wCn47wfp6YQG4fcoiMwiS1ZshdFaUVzhF98PF+RVNp8k6aho=
X-Google-Smtp-Source: AGHT+IEUGFncxOKRlhWzHn6/3rGUasXsB6aBZluKSo+5RB0TvYX13ogX/YivIl/dkflWpGfRX1SW6A==
X-Received: by 2002:a05:600c:314b:b0:414:5e9b:804b with SMTP id
 h11-20020a05600c314b00b004145e9b804bmr5106212wmo.10.1711728413972; 
 Fri, 29 Mar 2024 09:06:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3cd8:c97b:1468:c232?
 ([2a01:e0a:982:cbb0:3cd8:c97b:1468:c232])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b0041550a32112sm1917639wmq.42.2024.03.29.09.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Mar 2024 09:06:53 -0700 (PDT)
Message-ID: <15e637ee-e72d-494c-bc0e-fc30921e9285@linaro.org>
Date: Fri, 29 Mar 2024 17:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v11 3/7] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Belin <nbelin@baylibre.com>, Jagan Teki
 <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
 <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-3-04f55de44604@linaro.org>
 <1jv8558b11.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jv8558b11.fsf@starbuckisacylon.baylibre.com>
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

On 29/03/2024 13:35, Jerome Brunet wrote:
> 
> On Mon 25 Mar 2024 at 12:09, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> In order to setup the DSI clock, let's make the unused VCLK2 clock path
>> configuration via CCF.
>>
>> The nocache option is removed from following clocks:
>> - vclk2_sel
>> - vclk2_input
>> - vclk2_div
>> - vclk2
>> - vclk_div1
>> - vclk2_div2_en
>> - vclk2_div4_en
>> - vclk2_div6_en
>> - vclk2_div12_en
>> - vclk2_div2
>> - vclk2_div4
>> - vclk2_div6
>> - vclk2_div12
>> - cts_encl_sel
>>
>> vclk2 and vclk2_div uses the newly introduced vclk regmap driver
>> to handle the enable and reset bits.
>>
>> In order to set a rate on cts_encl via the vclk2 clock path,
>> the NO_REPARENT flag is set on cts_encl_sel & vclk2_sel in order
>> to keep CCF from selection a parent.
>> The parents of cts_encl_sel & vclk2_sel are expected to be defined
>> in DT or manually set by the display driver at some point.
>>
>> The following clock scheme is to be used for DSI:
>>
>> xtal
>> \_ gp0_pll_dco
>>     \_ gp0_pll
>>        |- vclk2_sel
>>        |  \_ vclk2_input
>>        |     \_ vclk2_div
>>        |        \_ vclk2
>>        |           \_ vclk2_div1
>>        |              \_ cts_encl_sel
>>        |                 \_ cts_encl	-> to VPU LCD Encoder
>>        |- mipi_dsi_pxclk_sel
>>        \_ mipi_dsi_pxclk_div
>>           \_ mipi_dsi_pxclk		-> to DSI controller
>>
>> The mipi_dsi_pxclk_div is set as bypass with a single /1 entry in div_table
>> in order to use the same GP0 for mipi_dsi_pxclk and vclk2_input.
>>
>> The SET_RATE_PARENT is only set on the mipi_dsi_pxclk_sel clock so the
>> DSI bitclock is the reference base clock to calculate the vclk2_div value
>> when pixel clock is set on the cts_encl endpoint.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/meson/Kconfig |  1 +
>>   drivers/clk/meson/g12a.c  | 72 ++++++++++++++++++++++++++++++++++-------------
>>   2 files changed, 53 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 8a9823789fa3..59a40a49f8e1 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -144,6 +144,7 @@ config COMMON_CLK_G12A
>>   	select COMMON_CLK_MESON_EE_CLKC
>>   	select COMMON_CLK_MESON_CPU_DYNDIV
>>   	select COMMON_CLK_MESON_VID_PLL_DIV
>> +	select COMMON_CLK_MESON_VCLK
>>   	select MFD_SYSCON
>>   	help
>>   	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 90f4c6103014..083882e53b65 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -22,6 +22,7 @@
>>   #include "clk-regmap.h"
>>   #include "clk-cpu-dyndiv.h"
>>   #include "vid-pll-div.h"
>> +#include "vclk.h"
>>   #include "meson-eeclk.h"
>>   #include "g12a.h"
>>   
>> @@ -3165,7 +3166,7 @@ static struct clk_regmap g12a_vclk2_sel = {
>>   		.ops = &clk_regmap_mux_ops,
>>   		.parent_hws = g12a_vclk_parent_hws,
>>   		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
>> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
>> +		.flags = CLK_SET_RATE_NO_REPARENT,
>>   	},
>>   };
>>   
>> @@ -3193,7 +3194,6 @@ static struct clk_regmap g12a_vclk2_input = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_sel.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>   	},
>>   };
>>   
>> @@ -3215,19 +3215,32 @@ static struct clk_regmap g12a_vclk_div = {
>>   };
>>   
>>   static struct clk_regmap g12a_vclk2_div = {
>> -	.data = &(struct clk_regmap_div_data){
>> -		.offset = HHI_VIID_CLK_DIV,
>> -		.shift = 0,
>> -		.width = 8,
>> +	.data = &(struct meson_vclk_div_data){
>> +		.div = {
>> +			.reg_off = HHI_VIID_CLK_DIV,
>> +			.shift   = 0,
>> +			.width   = 8,
>> +		},
>> +		.enable = {
>> +			.reg_off = HHI_VIID_CLK_DIV,
>> +			.shift   = 16,
>> +			.width   = 1,
>> +		},
>> +		.reset = {
>> +			.reg_off = HHI_VIID_CLK_DIV,
>> +			.shift   = 17,
>> +			.width   = 1,
>> +		},
>> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
>>   	},
>>   	.hw.init = &(struct clk_init_data){
>>   		.name = "vclk2_div",
>> -		.ops = &clk_regmap_divider_ops,
>> +		.ops = &meson_vclk_div_ops,
>>   		.parent_hws = (const struct clk_hw *[]) {
>>   			&g12a_vclk2_input.hw
>>   		},
>>   		.num_parents = 1,
>> -		.flags = CLK_GET_RATE_NOCACHE,
>> +		.flags = CLK_SET_RATE_GATE,
>>   	},
>>   };
>>   
>> @@ -3246,16 +3259,24 @@ static struct clk_regmap g12a_vclk = {
>>   };
>>   
>>   static struct clk_regmap g12a_vclk2 = {
>> -	.data = &(struct clk_regmap_gate_data){
>> -		.offset = HHI_VIID_CLK_CNTL,
>> -		.bit_idx = 19,
>> +	.data = &(struct meson_vclk_gate_data){
>> +		.enable = {
>> +			.reg_off = HHI_VIID_CLK_CNTL,
>> +			.shift   = 19,
>> +			.width   = 1,
>> +		},
>> +		.reset = {
>> +			.reg_off = HHI_VIID_CLK_CNTL,
>> +			.shift   = 15,
>> +			.width   = 1,
>> +		},
>>   	},
>>   	.hw.init = &(struct clk_init_data) {
>>   		.name = "vclk2",
>> -		.ops = &clk_regmap_gate_ops,
>> +		.ops = &meson_vclk_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3339,7 +3360,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3353,7 +3374,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3367,7 +3388,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3381,7 +3402,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3395,7 +3416,7 @@ static struct clk_regmap g12a_vclk2_div12_en = {
>>   		.ops = &clk_regmap_gate_ops,
>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>   		.num_parents = 1,
>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3461,6 +3482,7 @@ static struct clk_fixed_factor g12a_vclk2_div2 = {
>>   			&g12a_vclk2_div2_en.hw
>>   		},
>>   		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3474,6 +3496,7 @@ static struct clk_fixed_factor g12a_vclk2_div4 = {
>>   			&g12a_vclk2_div4_en.hw
>>   		},
>>   		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3487,6 +3510,7 @@ static struct clk_fixed_factor g12a_vclk2_div6 = {
>>   			&g12a_vclk2_div6_en.hw
>>   		},
>>   		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3500,6 +3524,7 @@ static struct clk_fixed_factor g12a_vclk2_div12 = {
>>   			&g12a_vclk2_div12_en.hw
>>   		},
>>   		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> @@ -3561,7 +3586,7 @@ static struct clk_regmap g12a_cts_encl_sel = {
>>   		.ops = &clk_regmap_mux_ops,
>>   		.parent_hws = g12a_cts_parent_hws,
>>   		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
>> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>>   	},
>>   };
>>   
>> @@ -3717,15 +3742,22 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
>>   		.ops = &clk_regmap_mux_ops,
>>   		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
>>   		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
>> -		.flags = CLK_SET_RATE_NO_REPARENT,
>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
>>   	},
>>   };
>>   
>> +/* Force as bypass by forcing a single /1 table entry, and not rely of boot value */
> 
> The comment here is not entirely accurate.
> 
> The table below will actually force to only use a 1 divider on
> .set_rate(), not on boot, AFAICT.
> 
> The boot value will stay in the register until the first call to set_rate().
> 
> Considering this is quite fragile as it is, It would be nice to prefix
> the updated comment with "FIXME"

Ack

> 
>> +static const struct clk_div_table g12a_mipi_dsi_pxclk_div_table[] = {
>> +	{ .val = 0, .div = 1 },
>> +	{ /* sentinel */ },
>> +};
>> +
>>   static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
>>   	.data = &(struct clk_regmap_div_data){
>>   		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
>>   		.shift = 0,
>>   		.width = 7,
>> +		.table = g12a_mipi_dsi_pxclk_div_table,
>>   	},
>>   	.hw.init = &(struct clk_init_data){
>>   		.name = "mipi_dsi_pxclk_div",
> 
> 

