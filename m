Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E57EB18D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 15:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10BA10E20A;
	Tue, 14 Nov 2023 14:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C98C10E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 14:08:39 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40a48775c58so33879105e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 06:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699970918; x=1700575718; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Oqf6gytLqFb8qEPqoHx08oC5AruJuDr18v95ngS2z6E=;
 b=B9d4pdv+iAjte4RkQcJwgOzdN00Xory1mgVr3nZ313Ti+rEeucGT/id7z9pFirCboL
 HmksLvz2k4GwCBC2VsJCcWFavOepv1YtGoMu9CGhxfCH6SdDuoyXoCh9kRAsvhI37CGY
 u/VHDxPTufbg5dZpVlCGxXEJ+PM737ND1y8k0uqJPkwOO2fsT31dGTnk9pXbpfA1ZsOw
 /w3wiMRCbLCKlueMUBoFfoxWg+joOeLORyoGi9/EKlya6uea64YzTHtmEcLbvA58uIRX
 RrDi61Kug+hUhHadkOpE4795D1aJkh9X8wTPsS1gyXtXjwuNJu6WzwE47Y5hxtX42oIG
 EnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699970918; x=1700575718;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Oqf6gytLqFb8qEPqoHx08oC5AruJuDr18v95ngS2z6E=;
 b=ttBH+tw6DZKw9494cxy7OjgSVoQvbwsZes9e+HVU/NXNa+zi1IByjVkC9R2YFsxeJB
 ag8WXs6mioky4ZWDQGqRvpwcrw9KlOWcn5XyGLoyqkYE/1nYVEXzXPYMAb0wKafqVL5I
 nJ+gB0ZfBwWIyj5d5nJiaH2AnbDnLff6RR+iFhpNVAlolwKHuVRWApVI1YyJltblpmdw
 uaim51SkfuhvX1ogVGH64mvSQUEpaPZA+KYQtqdaOUKL5RaTcEGLl8X0PknqHWc2PBfL
 wGHD0aiynhvIZgWofdOcunzLtqztjs5TLmlD9RPSZK9RpWbqTX6u+977D2OkBWLBDty2
 np7g==
X-Gm-Message-State: AOJu0YxN908STnOfS0zEOH7yCl4aI0zngWtC2BGeycVHMrFexfE0p6sY
 ixrnHwRyNSArLXYwe3rUYJBqnA==
X-Google-Smtp-Source: AGHT+IFTU2lq4vDw46y+DKgUmMqgoWFvNm96LbGHVmRkHynSA3vr4y39kjkdpLQGvpzK9zKQ5nKYPg==
X-Received: by 2002:a05:600c:4715:b0:40a:42dd:c82c with SMTP id
 v21-20020a05600c471500b0040a42ddc82cmr7754829wmo.27.1699970917579; 
 Tue, 14 Nov 2023 06:08:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a90d:d9d5:9399:5adf?
 ([2a01:e0a:982:cbb0:a90d:d9d5:9399:5adf])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003fe1fe56202sm11435423wma.33.2023.11.14.06.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 06:08:37 -0800 (PST)
Message-ID: <c45a3094-501f-408d-9bef-7e634f99185e@linaro.org>
Date: Tue, 14 Nov 2023 15:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 04/12] dt-bindings: phy: amlogic, g12a-mipi-dphy-analog:
 drop unneeded reg property and example
Content-Language: en-US, fr
To: Rob Herring <robh@kernel.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
 <20231110205716.GA413638-robh@kernel.org>
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
In-Reply-To: <20231110205716.GA413638-robh@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Belin <nbelin@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/2023 21:57, Rob Herring wrote:
> On Thu, Nov 09, 2023 at 10:00:05AM +0100, Neil Armstrong wrote:
>> Now this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml and is
>> documented as a subnode of a simple-mfd, drop the invalid reg property.
> 
> Why is it invalid? It's preferred to have 'reg' in MFDs even if Linux
> doesn't use them. If there's a chunk of registers you can define, then
> do so. If it's all register bit soup, then fine, omit it.

I still don't understand why this particular MFD subnode needs a reg and not
the other ones, using reg would need adding #address-cells/#size-cells on top
node and change all examples/DT for nothing.

Like the other meson-gx-hhi-sysctrl subnodes, it's a register bit soup and this
one is no exception.

Neil

> 
> Rob

