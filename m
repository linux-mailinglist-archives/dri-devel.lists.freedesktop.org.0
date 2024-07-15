Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD63931633
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFF310E3C3;
	Mon, 15 Jul 2024 13:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WHxwCqAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A658810E3C3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:57:33 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-367940c57ddso2705451f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721051852; x=1721656652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=jqmSoh9JB/3hZYySxLznUyX+qQFd5aQoYQGKXDyQDDs=;
 b=WHxwCqACb5GZGGE9TRvFXobmIGPeumJtIYcj3LjMT8Qx8SRCYOzCCkv3+cdabsxgoh
 c2ASSnHfni0oStntWOHxaOWgNSAl1vgm3pz14yuU3oWsMD4rTw5j28UiwoVCbT2weJxy
 VOctQ3LwZMQ2kOWEdAV72+eczoXJM6ZWOFFDaZs7jjl2mEFc+bR/ZY3p5IIi/DlzgmRa
 HuQsnrOcNhAaSAg5MZdQ80AMN0Rad/YvAHtdbhpbpL36TdeaJbW/I7CS1shLztIbzcTU
 uWcA7bNp0/ZSCwfi8bd2FNrPXteqkAIUbpkLDL7Yxu3k5KcJmnKpLSMr5FgG9yzhi159
 78iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721051852; x=1721656652;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jqmSoh9JB/3hZYySxLznUyX+qQFd5aQoYQGKXDyQDDs=;
 b=jlShYGlWyDY14HGP+y6XV8iqYvR41O5xQ+/wOJcBrqp6X7+wkP3Fccq/1bd0q7ZM1j
 aISjLZe6Tsme0rvSNcuFgaQOCnFN26XaPTfhYWqUM1RBHvsy7Y1ZDIfSp4Hn2b02zBry
 nxJSqDEqfydKp5LXc5wbvPrl3pVxKqZMaQ7pR+3e/tJt5YDySDbSprJYDnWbEvNzwBEs
 NFrWdDMfEAPUD77NckGZQUs8qdBbsR2w41S+QvJeAIJ8TSZTzCiXOrPMnSXj8o0GxKmK
 V+NI00TWV5piWXUuDTgPZwwGR0/+7m4x1zbwvqaAgpxwvcdJwLWumoH8EeZNN65IbSQA
 4Ipw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULvieGOTFCIpK/Mzm092YFukweDEx6pd8M3tmvefy8lTn98Il3+Fyoql2pZJx9m+MsPuyLJP9NkoJmqA4JgWoFqI/2Z/D0iA+QH/tnI375
X-Gm-Message-State: AOJu0YzTjvld9tqQwrW/tcCw1rfPdy7529MSVZohPhr69yjjrmhuV0Fz
 ZWeu5jJNTgB4d3MYZXdlhDRG0Eb7kXq6xgptBzyWldSJSH+0jD5QUaLNEmpPc5Q=
X-Google-Smtp-Source: AGHT+IE2nTXTaioYsA/A41U6llM/pzKPMBmM0saB2C1f2cgdXkuwmS9mdBqiFzKuIMT0ybz0qZzRhA==
X-Received: by 2002:adf:ed91:0:b0:367:340e:d6e6 with SMTP id
 ffacd0b85a97d-367cea96629mr13090106f8f.41.1721051851633; 
 Mon, 15 Jul 2024 06:57:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4?
 ([2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db038dbsm6413873f8f.95.2024.07.15.06.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 06:57:31 -0700 (PDT)
Message-ID: <6f8f902b-8192-492a-8354-18590c6c2c06@linaro.org>
Date: Mon, 15 Jul 2024 15:57:30 +0200
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
In-Reply-To: <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
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

On 15/07/2024 15:51, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 15, 2024 at 6:02 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 15/07/2024 14:54, Stephan Gerhold wrote:
>>> On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
>>>> On 15/07/2024 14:15, Stephan Gerhold wrote:
>>>>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
>>>>>
>>>>> The panel should be handled through the samsung-atna33xc20 driver for
>>>>> correct power up timings. Otherwise the backlight does not work correctly.
>>>>>
>>>>> We have existing users of this panel through the generic "edp-panel"
>>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>>>> partially in that configuration: It works after boot but once the screen
>>>>> gets disabled it does not turn on again until after reboot. It behaves the
>>>>> same way with the default "conservative" timings, so we might as well drop
>>>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>>>> will get a warning and can move to the new driver.
>>>>>
>>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/panel/panel-edp.c | 2 --
>>>>>     1 file changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>>>>> index 3a574a9b46e7..d2d682385e89 100644
>>>>> --- a/drivers/gpu/drm/panel/panel-edp.c
>>>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>>>>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
>>>>>      EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
>>>>>      EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
>>>>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
>>>>> -
>>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
>>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
>>>>>      EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
>>>>>
>>>>
>>>> How will we handle current/old crd DT with new kernels ?
>>>>
>>>
>>> I think this is answered in the commit message:
>>>
>>>>> We have existing users of this panel through the generic "edp-panel"
>>>>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
>>>>> partially in that configuration: It works after boot but once the screen
>>>>> gets disabled it does not turn on again until after reboot. It behaves the
>>>>> same way with the default "conservative" timings, so we might as well drop
>>>>> the configuration from the panel-edp driver. That way, users with old DTBs
>>>>> will get a warning and can move to the new driver.
>>>
>>> Basically with the entry removed, the panel-edp driver will fallback to
>>> default "conservative" timings when using old DTBs. There will be a
>>> warning in dmesg, but otherwise the panel will somewhat work just as
>>> before. I think this is a good way to remind users to upgrade.
>>
>> I consider this as a regression
>>
>>>
>>>> Same question for patch 3, thie serie introduces a bindings that won't be valid
>>>> if we backport patch 3. I don't think patch should be backported, and this patch
>>>> should be dropped.
>>>
>>> There would be a dtbs_check warning, yeah. Functionally, it would work
>>> just fine. Is that reason enough to keep display partially broken for
>>> 6.11? We could also apply the minor binding change for 6.11 if needed.
>>
>> I don't know how to answer this, I'll let the DT maintainer comment this.
>>
>> The problem is I do not think we can pass the whole patchset as fixes
>> for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
>>
>> Neil
> 
> IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
> whenever those folks agree to it. If we're worried about the
> dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
> through the Qualcomm tree as long as it made it into 6.11-rc1. I have
> a hunch that there are going to be more Samsung OLED panels in the
> future that will need to touch the same file, but if the change is in
> -rc1 it should make it back into drm-misc quickly, right?

Not sure the Soc maintainer would accept any patches for -rc1 at this
point, but Bjorn can try to push both #3 and #4 as fixes for -rc2.

Not sure #1 would be accepted as fix via any tree, but having a bindings
error for a kernel release is not a big deal if in-fine the bindings change
has been reviewed and queued for next version.

Basically when the -rc is tagged it gets backmerged into drm-misc-next,
so we can backmerge any -rc we want.

> 
> Personally I think patch #2 could go in anytime since, as people have
> said, things are pretty broken today and the worst that happens is
> that someone gets an extra warning. That would be my preference. That
> being said, we could also snooze that patch for a month or two and
> land it later. There's no real hurry.

We can push it now to drm-misc-next so it gets naturally delayed until v6.12

Neil

> 
> -Doug
> 

