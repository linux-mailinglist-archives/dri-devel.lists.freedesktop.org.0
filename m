Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B477E70E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24EE10E38F;
	Wed, 16 Aug 2023 16:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD34810E38F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:57:30 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3198d2745feso1124161f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692205049; x=1692809849;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=o9UCPIbwET1nK7OtL4k21iTK03Gqf/XBiAM4YHfVC6Y=;
 b=DD1Lh5jRTBRof6bbiGBRpUxJArFXGYFf30JHXVXInFmcmgQhStl3XzifEFVJO29bY2
 beN/dYamXkkV9Co3T11uakyKlVRMaR7MkDL9OFaBlMV9/6sQCYh3tmHvTosVLrJ1t69I
 uix15KIKS3fvAkDzPjeNuW4iFWiR0oLfsAgSFLUtjB8UpakA0tR9EpwPVXp43Bepslu7
 Qm8/5U17ooD+ooJ87KSFmrU+1yagSCcVky0Q2tZhdYnbhCTZbzomKljlPpaapzFdiNmU
 Z9D9av5lBowbi3TXjnnX7CGJRpVy436GtoIm2mK9yb62z0tMTnBjF8xU77YE0DkwuEUA
 YckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692205049; x=1692809849;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o9UCPIbwET1nK7OtL4k21iTK03Gqf/XBiAM4YHfVC6Y=;
 b=EK+AW/8pwePrh67wRy4Dx/kJRkeDoOHfwDLiedRgrw+58tqCoyokx4aur5B0YpO/hP
 MHMQb+0cgI8Ce4tvcDQSM7KQ4gPiuG6nAAEQRSXN4D9rZcUP63uS1aTzUaK3vT6GDZrL
 XHbEi6dHlBFp9HtbeJxKXrkyZElCU80N8ldvm27BrmnbjVLlT3J0ZwgzFPHaSG8Y3/NJ
 FKYvRhX4Go+Y1iUprZI502Wappec7SNbgJJp7Vbd2JgvehTPdWpITxCOXdcV0lFxoyju
 nIuZDOKWMzOS6W/hkhI5tFXDSnR1PNEbqVb1fhrYRLugeZFOo5qLXMhKTcYMezFVnVHA
 hs2A==
X-Gm-Message-State: AOJu0YwPgKPWKqTQzb/ND7YXmfwwVQzohlcmop1F2vzMK+FhVtKaVrFg
 k+79JPrqjQIG/pbNHOw2wzEC8Q==
X-Google-Smtp-Source: AGHT+IFpu7NsMnfNRz0FQaZYKkOj0aFLicer1gWur6dmfQYA+bPEhZnBoAqhud9cPlQiIuUFfFjHAA==
X-Received: by 2002:a5d:4d11:0:b0:319:77d4:b313 with SMTP id
 z17-20020a5d4d11000000b0031977d4b313mr1673688wrt.58.1692205049186; 
 Wed, 16 Aug 2023 09:57:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9f7b:ceef:54e7:3152?
 ([2a01:e0a:982:cbb0:9f7b:ceef:54e7:3152])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a5d4281000000b00317a29af4b2sm21758221wrq.68.2023.08.16.09.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 09:57:28 -0700 (PDT)
Message-ID: <29304199-1df3-4fa4-8fcf-a8e34bd7a098@linaro.org>
Date: Wed, 16 Aug 2023 18:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/5] Add JDI LPM102A188A display panel support
Content-Language: en-US, fr
To: Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
 <ZNz5sSnxs_E8p_4J@orome>
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
In-Reply-To: <ZNz5sSnxs_E8p_4J@orome>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/08/2023 18:30, Thierry Reding wrote:
> On Mon, Aug 07, 2023 at 02:33:00PM +0100, Diogo Ivo wrote:
>> Hello,
>>
>> These patches add support for the JDI LPM102A188A display panel,
>> found in the Google Pixel C.
>>
>> Patch 1 adds the DT bindings for the panel.
>>
>> Patch 2 adds the panel driver, which is based on the downstream
>> kernel driver published by Google and developed by Sean Paul.
>>
>> Patches 3-5 add DT nodes for the regulator, backlight controller and
>> display panel.
>>
>> The first version of this patch series can be found at:
>> https://lore.kernel.org/all/20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt/
>>
>> The first submission of v2 can be found at:
>> https://lore.kernel.org/all/20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt/
>>
>> Changes in v2:
>>   - Patch 1: remove touchscreen reset gpio property
>>   - Patch 2: clear register based on its value rather than a DT property
>>   - Patch 3: tune backlight delay values
>>   - Patch 4: add generic node names, remove underscores
>>
>> Changes in v3:
>>   - Patch 1: add Reviewed-by
>>   - Patch 2: fix error handling, remove enabled/prepared booleans, add
>>     dc/dc setting
>>   - Patches 3-5: Split previous patch 3 into three different patches,
>>     each adding a separate node
>>   - removed previous patch 2 pertaining to Tegra DSI reset as it was upstreamed
>>
>> Diogo Ivo (5):
>>    dt-bindings: display: Add bindings for JDI LPM102A188A
>>    drm/panel: Add driver for JDI LPM102A188A
>>    arm64: dts: smaug: Add DSI/CSI regulator
>>    arm64: dts: smaug: Add backlight node
>>    arm64: dts: smaug: Add display panel node
> 
> I've picked up patches 3-5 into the Tegra tree and I assume the other
> two will go in through drm-misc?

Sure, done !

> 
> Thierry

