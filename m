Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DEF931899
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 18:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A9B10E43F;
	Mon, 15 Jul 2024 16:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ClJ8fLs+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C4810E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 16:39:59 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so61184861fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721061598; x=1721666398; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=086b6d+gc7yqfCOplh7mxFF8q3s0UEqs3kxdIOeu14g=;
 b=ClJ8fLs+Zy7E5qJu3hLD7PX7Yr7hNyiuzuLbCJrdMYyo7DeGGP1NqX1HzfNT1kZGU8
 MO2TKkRK0T9DyWD9mMrfl+cGAzgov4kb3la7BHF8SSpUbMRbsUn+H/YqRYM/w14gTihq
 oHODiyxXxbNMpNyFMNPNI/Eq9G4aOszq7+bQROWIRMeSM3q4zFkiBci1Jd256gZNmHWy
 W8j1nkgnX2xeKFbPmRUoiGTclHYB0sUFqIcKkqV0hq72g6i2uFa+ENWMmDsEQbPFSG8k
 IVHihIhOnWpbkhtkUR3160khoFn0L/iL5+6NbIuVGf7M5fs/5I2aePiIKnlM/3pIHd5f
 hMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721061598; x=1721666398;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=086b6d+gc7yqfCOplh7mxFF8q3s0UEqs3kxdIOeu14g=;
 b=VwfGGvRxoqCVYfrZgQ0HeocCQvSHzAxMhLYN8P5ZPNzjTu+ueuTjYvsHHq5VldSYFV
 T9kRnDhDNuvRDlMmlqh3Yff1tZ3I+G2kNwaM2HqXiHMui8WEo46f5zwuCvxUcU3loVtj
 88Cdc/Zt3IcEuc2p7ModjQItZuQqecuXtCzPYBR7QR12r+apnVs87D30UJp67BsJ5eQg
 CbCYQbPQBILAkzUmjgU0uSlMPVi40BUoNx4nOR04FQqjRqY40XS2PVtJwat5vrr9tJDS
 XnW8Uu5kPxiuT9HHM0adb4uUniGsEPKaodGGpILIOiaIPRuWh4EQbF02lHk4EKIO0sZD
 sRKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnqLJie4eKvNjybIEhRRn3s4J1fioRtclyxDlhyLyWAnuHqTuXPRwnT0NdrevV/tyvu7Q93ORMnupgFsmJL9mT0w+TXuv6z5/VjIOy0eJr
X-Gm-Message-State: AOJu0Yy+ywuUOGMNa/lsbUBOWk9JuIyeGABaaHzx0F8lH/7a9VcYc8DI
 lO8KoBpudq4Y6UUiKi7YhgnpZ0jbwhniUuo+r9njDUlK2qDnE5wEVYdLfXPMVJU=
X-Google-Smtp-Source: AGHT+IG+XcElSRCGhjUuuzGzjpntRet3YsErGMe3aOi14rgD9n2iYY3pC4eHrBC4f7kKDLM40+7EiA==
X-Received: by 2002:a2e:8012:0:b0:2ec:140c:8985 with SMTP id
 38308e7fff4ca-2eef2da7455mr3012311fa.36.1721061597649; 
 Mon, 15 Jul 2024 09:39:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4?
 ([2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabf3bdsm6831119f8f.30.2024.07.15.09.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 09:39:57 -0700 (PDT)
Message-ID: <4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.org>
Date: Mon, 15 Jul 2024 18:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
To: Doug Anderson <dianders@chromium.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
 <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
 <ZpUcI3KkIa58zC55@linaro.org>
 <d1603248-afe8-4594-9e2e-81ba208dff00@linaro.org>
 <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
 <6f8f902b-8192-492a-8354-18590c6c2c06@linaro.org>
 <CAD=FV=Ugf-SfJYHzEZ0+ekm4zeXpgUi4XzJTuzuwJN1hjns1CQ@mail.gmail.com>
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
In-Reply-To: <CAD=FV=Ugf-SfJYHzEZ0+ekm4zeXpgUi4XzJTuzuwJN1hjns1CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 15/07/2024 16:40, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 15, 2024 at 6:57 AM <neil.armstrong@linaro.org> wrote:
>>
>> On 15/07/2024 15:51, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Mon, Jul 15, 2024 at 6:02 AM Neil Armstrong
>>> <neil.armstrong@linaro.org> wrote:
>>>>
>>>> On 15/07/2024 14:54, Stephan Gerhold wrote:
>>>>> On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
>>>>>> On 15/07/2024 14:15, Stephan Gerhold wrote:
>>>>>>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
>>>>>>>
>>>>>>> The panel should be handled through the samsung-atna33xc20 driver for
>>>>>>> correct power up timings. Otherwise the backlight does not work correctly.
>>>>>>>
>>>>>>> We have existing users of this panel through the generic "edp-panel"
>>>>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>>>>>> partially in that configuration: It works after boot but once the screen
>>>>>>> gets disabled it does not turn on again until after reboot. It behaves the
>>>>>>> same way with the default "conservative" timings, so we might as well drop
>>>>>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>>>>>> will get a warning and can move to the new driver.
>>>>>>>
>>>>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>>>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/panel/panel-edp.c | 2 --
>>>>>>>      1 file changed, 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>>>>>>> index 3a574a9b46e7..d2d682385e89 100644
>>>>>>> --- a/drivers/gpu/drm/panel/panel-edp.c
>>>>>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>>>>>>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
>>>>>>>       EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
>>>>>>>       EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
>>>>>>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
>>>>>>> -
>>>>>>>       EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
>>>>>>>       EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
>>>>>>>       EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
>>>>>>>
>>>>>>
>>>>>> How will we handle current/old crd DT with new kernels ?
>>>>>>
>>>>>
>>>>> I think this is answered in the commit message:
>>>>>
>>>>>>> We have existing users of this panel through the generic "edp-panel"
>>>>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>>>>>> partially in that configuration: It works after boot but once the screen
>>>>>>> gets disabled it does not turn on again until after reboot. It behaves the
>>>>>>> same way with the default "conservative" timings, so we might as well drop
>>>>>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>>>>>> will get a warning and can move to the new driver.
>>>>>
>>>>> Basically with the entry removed, the panel-edp driver will fallback to
>>>>> default "conservative" timings when using old DTBs. There will be a
>>>>> warning in dmesg, but otherwise the panel will somewhat work just as
>>>>> before. I think this is a good way to remind users to upgrade.
>>>>
>>>> I consider this as a regression
>>>>
>>>>>
>>>>>> Same question for patch 3, thie serie introduces a bindings that won't be valid
>>>>>> if we backport patch 3. I don't think patch should be backported, and this patch
>>>>>> should be dropped.
>>>>>
>>>>> There would be a dtbs_check warning, yeah. Functionally, it would work
>>>>> just fine. Is that reason enough to keep display partially broken for
>>>>> 6.11? We could also apply the minor binding change for 6.11 if needed.
>>>>
>>>> I don't know how to answer this, I'll let the DT maintainer comment this.
>>>>
>>>> The problem is I do not think we can pass the whole patchset as fixes
>>>> for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
>>>>
>>>> Neil
>>>
>>> IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
>>> whenever those folks agree to it. If we're worried about the
>>> dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
>>> through the Qualcomm tree as long as it made it into 6.11-rc1. I have
>>> a hunch that there are going to be more Samsung OLED panels in the
>>> future that will need to touch the same file, but if the change is in
>>> -rc1 it should make it back into drm-misc quickly, right?
>>
>> Not sure the Soc maintainer would accept any patches for -rc1 at this
>> point, but Bjorn can try to push both #3 and #4 as fixes for -rc2.
> 
> Yeah, I guess it's pretty late for -rc1.
> 
> 
>> Not sure #1 would be accepted as fix via any tree, but having a bindings
>> error for a kernel release is not a big deal if in-fine the bindings change
>> has been reviewed and queued for next version.
> 
> In general my understanding is that we don't worry too much about
> temporary bindings errors as long as things meet up in linuxnext and
> get fixed. ...but in this case we're talking about the dts going into
> 6.11 and the bindings in 6.12 which means that v6.11 will be released
> and still have the bindings error. That's non-ideal...
> 
> Can we really not consider the bindings as "Fix" since it's required
> to pass dts validation for the dts patch which is a "Fix"? If we can
> consider this bindings change a Fix then we could land it in
> drm-misc-fixes and then things could meet up nicely I think, right?

Probably, we'll need insight from Krzysztof/Conor/Rob on this point,
and perhaps Maxime aswell.

Neil

> 
> -Doug
> 

