Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D004F93154C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAE110E17D;
	Mon, 15 Jul 2024 13:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y/ZrDU+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC9D10E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:02:00 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4267345e746so28572045e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721048519; x=1721653319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=h0LlF0jvPcioawKxnI/v8jmryUdPpTWQ5f+aNVMOx1M=;
 b=y/ZrDU+aPr4/jwS5/2rQq1dHYIy3n/rR9bD1Sx4IXH+HMxxopjjXagPy3VMCJekIHu
 9c8t+ZN4xd73K3qpINClL9o3reUr5ZL1ZGVdbk09tEcVhXPoZQ8V+A8dPIs9xHYaUeY5
 23uFO/+0vRLRdq837o1Br/4A9V8rUb/I84gxrKhs5kTOJjktRMqdstwXnEXs9d+YsY82
 JB8nHUoyziDhCr0JM6sc9GeuqC1BstlkWLegYuZe6bCswDD1hbH5JiZbt0gSlk97mwXn
 r3TQnegZKMtySNC7Pn+I9CY7oNQxOJb9zOCvIeeZL49aZ6DB3TQmFK6wwgVZ6aNpmA4Q
 g/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721048519; x=1721653319;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h0LlF0jvPcioawKxnI/v8jmryUdPpTWQ5f+aNVMOx1M=;
 b=hyGEpTI/WxeX3a716Ym9W5zJaIKO4uD5zTwEoJwpalBui0pqIj1nQkCPb/GMzE0wa8
 5mcrLE2GpXkTcEoogt3n79jnvnlsv2JxC5ggZ16tsTe1IbBJTWfCuIDnP4q3kKFaMiOc
 aj2tb2k/h3P5S9fVN/v2n/I8S+icWiJySTCvJJ95MU+iYVoWq3HH2tYHQ3RAJcEeZTFU
 iVimvqFIeOVXhJXzH1m5vY7w716+zQCuL9L4epcIN2oxOS9HkR8D/3oMid4QjXVMZob1
 5M0mC01q1CndWUJJAKRKwLasxtGt0AofWR6ELPOIV1YONIrtjrOcHPll1kMncHZ66x/N
 ilQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZEKyFrD/uIAVUTqU6zjH2MGFTCnJWhV7Y9rDfu3yFnp9Hh3gZiCMJj+09sYufWD6l2Fxc6/+eO9DFnmlmbzwdeBwiUO9ebvZ8d8RdD08F
X-Gm-Message-State: AOJu0YxggYLeW0fc5GpubAqNCl45yIBKCqygguYK/BIvxV8ZtCxq+kzr
 s+/zjlmkkux91N3puZIU0D4zK+lC3zYiBRBgYM8xL4RfpEPIZH3WROVzMMsWxA8=
X-Google-Smtp-Source: AGHT+IEDCShUNSMDpb8ubvYx9FNbleT++Anmmj4DRHcb11LRI9IkeO1lUMjxu9JiIw8MJ5eeP5Xkrw==
X-Received: by 2002:a5d:64a6:0:b0:367:8a68:e746 with SMTP id
 ffacd0b85a97d-367cea466aemr17051400f8f.6.1721048518903; 
 Mon, 15 Jul 2024 06:01:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4?
 ([2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3c2dsm6438123f8f.1.2024.07.15.06.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 06:01:58 -0700 (PDT)
Message-ID: <d1603248-afe8-4594-9e2e-81ba208dff00@linaro.org>
Date: Mon, 15 Jul 2024 15:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
 <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
 <ZpUcI3KkIa58zC55@linaro.org>
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
In-Reply-To: <ZpUcI3KkIa58zC55@linaro.org>
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

On 15/07/2024 14:54, Stephan Gerhold wrote:
> On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
>> On 15/07/2024 14:15, Stephan Gerhold wrote:
>>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
>>>
>>> The panel should be handled through the samsung-atna33xc20 driver for
>>> correct power up timings. Otherwise the backlight does not work correctly.
>>>
>>> We have existing users of this panel through the generic "edp-panel"
>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>> partially in that configuration: It works after boot but once the screen
>>> gets disabled it does not turn on again until after reboot. It behaves the
>>> same way with the default "conservative" timings, so we might as well drop
>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>> will get a warning and can move to the new driver.
>>>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>> ---
>>>    drivers/gpu/drm/panel/panel-edp.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>>> index 3a574a9b46e7..d2d682385e89 100644
>>> --- a/drivers/gpu/drm/panel/panel-edp.c
>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
>>>    	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
>>>    	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
>>> -	EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
>>> -
>>>    	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
>>>    	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
>>>    	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
>>>
>>
>> How will we handle current/old crd DT with new kernels ?
>>
> 
> I think this is answered in the commit message:
> 
>>> We have existing users of this panel through the generic "edp-panel"
>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>> partially in that configuration: It works after boot but once the screen
>>> gets disabled it does not turn on again until after reboot. It behaves the
>>> same way with the default "conservative" timings, so we might as well drop
>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>> will get a warning and can move to the new driver.
> 
> Basically with the entry removed, the panel-edp driver will fallback to
> default "conservative" timings when using old DTBs. There will be a
> warning in dmesg, but otherwise the panel will somewhat work just as
> before. I think this is a good way to remind users to upgrade.

I consider this as a regression

> 
>> Same question for patch 3, thie serie introduces a bindings that won't be valid
>> if we backport patch 3. I don't think patch should be backported, and this patch
>> should be dropped.
> 
> There would be a dtbs_check warning, yeah. Functionally, it would work
> just fine. Is that reason enough to keep display partially broken for
> 6.11? We could also apply the minor binding change for 6.11 if needed.

I don't know how to answer this, I'll let the DT maintainer comment this.

The problem is I do not think we can pass the whole patchset as fixes
for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.

Neil

> 
> I'm also fine if this just goes into 6.12 though.
> 
> Thanks,
> Stephan

