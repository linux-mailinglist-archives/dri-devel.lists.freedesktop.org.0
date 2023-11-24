Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889FB7F76C4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 15:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA84710E7F7;
	Fri, 24 Nov 2023 14:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246BC10E7F7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 14:44:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so13693155e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 06:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700837040; x=1701441840; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=JUgLL7DRnYWbwIfG5gCXLaKp2PO1r1BS/La7eMtACoY=;
 b=kVYnRfnYlnNQYB2NwFLKvnS8r16wcMrh1AgYUqB3eGqKEUSk5n+Ky8isNXXkpkEnE/
 UPrXPGY/bfNEA96dexfMIVM5hRU2HWq5hgNTykiQ4VxbDV3tBHzMV2aVAKxbz/QHDpQA
 sqOyZNOc3JxgfEHaTLLqnCiqr6vBB0+b7VLq2v7aondvA95FQWLlt9uaPvPhGc9M4nv6
 DI1BcLlw/SX4ndrPh26TT7roK0oxWPFeocOjbn6cmE73lgV74Z6dkh6VCOTqifc/EVPb
 VCbukSAgUWsnVFQoYB8kvOoSc8rM0GnK7Jhulouo5vr7IOvOsKxOOFydkPM4hV1OmsMg
 ZtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700837040; x=1701441840;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JUgLL7DRnYWbwIfG5gCXLaKp2PO1r1BS/La7eMtACoY=;
 b=nw5W+3/T/2LtB2Jaflx90jF7Q98qR5OcZIwTwlemc7+0300InWQwSR4iXVnh0mPIcl
 my+5CvxLDtP1whlBiq4p5Ezx8rOLLpsjUgNRCggTm/nJ3TicQjyCDI0SiboH6NNovo7Q
 7plONg4BpR4swaxlcjXhDAC1b1gWA2JyNjd4NdEVRp+VYo+jIlAq88IcEOukwwM6aall
 qp8GGZqiZohQVGAPxw01+VcHVrYuveyenJOMF8PajgQPJPA7Pfh0mS6JyycbBaQ4qElW
 1P6CV/dyHEC7p3x1WSKqONNXcPmOj7NFQQ3wZ6G8+QWswKjMTWjnHiXmxgIOYFsv8WeL
 XL0w==
X-Gm-Message-State: AOJu0YxjcN6GWNVikDloKPMDJbH0NMqd2JWlbFByl9jiPGxaGoChkVMy
 Nii+TNQq8o9TiwSC0gEZQSPvFQ==
X-Google-Smtp-Source: AGHT+IG4lHpHegujO0VJykD6EDhiniG+n+uhhSQbk7AaE6VVt77PJjj8KwqZ9FApeIjXsVryvPNchA==
X-Received: by 2002:a5d:6a42:0:b0:32f:8a7f:f00f with SMTP id
 t2-20020a5d6a42000000b0032f8a7ff00fmr2494855wrw.60.1700837040476; 
 Fri, 24 Nov 2023 06:44:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4?
 ([2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adffc02000000b00327de0173f6sm4511051wrr.115.2023.11.24.06.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 06:44:00 -0800 (PST)
Message-ID: <eb099811-8505-44c6-834a-2997c797ae13@linaro.org>
Date: Fri, 24 Nov 2023 15:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 04/12] dt-bindings: phy: amlogic, g12a-mipi-dphy-analog:
 drop unneeded reg property and example
Content-Language: en-US, fr
To: Conor Dooley <conor@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
 <20231124-felt-tip-everybody-f2a6836e52af@spud>
 <c3a07912-07da-4965-94b8-3c0d8889ddc4@linaro.org>
 <20231124-vowel-reversing-619f7c4e5060@spud>
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
In-Reply-To: <20231124-vowel-reversing-619f7c4e5060@spud>
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/11/2023 15:41, Conor Dooley wrote:
> On Fri, Nov 24, 2023 at 02:50:58PM +0100, Neil Armstrong wrote:
>> Hi Conor,
>>
>> On 24/11/2023 13:36, Conor Dooley wrote:
>>> On Fri, Nov 24, 2023 at 09:41:15AM +0100, Neil Armstrong wrote:
>>>> The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
>>>> amlogic,meson-axg-hhi-sysctrl system control register zone which is an
>>>> intermixed registers zone, thus it's very hard to define clear ranges for
>>>> each SoC controlled features even if possible.
>>>>
>>>> The amlogic,g12a-mipi-dphy-analog was wrongly documented as an independent
>>>> register range, which is not the reality, thus fix the bindings by dropping
>>>> the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.yaml
>>>> and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.
>>>>
>>>> Also drop the unnecessary example, the top level bindings example should
>>>> be enough.
>>>>
>>>> Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings")
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> I feel like I left a tag on this one before, but I can't remember.
>>> Perhaps I missed the conclusion to the discussion to the discussion with
>>> Rob about whether having "reg" was desirable that lead to a tag being
>>> dropped?
>>
>> I checked again and nope, not tag, but Rob's question was legitimate and I reworded
>> and clarified the commit message following your reviews.
>> On the other side you suggested a Fixes tag, which I added.
>>
>> The rewording is about why reg doesn't make sense on the nature of the memory
>> region and it doesn't make sense here like other similar nodes.
> 
> Okay, I thought that I had given you one. Perhaps I forgot to send, or
> Rob's message came in between me asking about the Fixes tag & replying
> with an Ack. Sorry about that,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

No problem thanks for your review.

Neil

> 
> Cheers,
> Conor.

