Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A6386141A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 15:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4C610EC28;
	Fri, 23 Feb 2024 14:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kP5cTMgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0494710EC2D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 14:38:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41294af9ad7so3007005e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 06:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708699095; x=1709303895; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=OijQr4Cr1wWVumHbsjNdZzaJgYfpd0n4qUPdqEIlqC8=;
 b=kP5cTMgS1IanEYGuRcrgFY6bPUWpfziZLT8lnTE2DIMdbbDdLoWSVM3i7Dfe/duhC5
 4M6SkBH1U0FReE5YqdjDWSdxnHWPcqM8oh3tiAvHP3WqKX4Wu5PS6ko6NaiCQRolxesd
 a2CLsDgwUNoofrw0+B8uvlsLhkReoVSAf12U/rRe0EIhAn5RbM/CeDMFeXI0AfNVcjoq
 zeK+d8+hCAy+J24Wj6IQrwDYIvKq6CCWEqWxEOgzDarAHN05PMH94VM0+I6IRsrhDZ6y
 EGuUzWKFMblezFnkGGHHfzsJvQFmwwVy95laXaU7ZUR36e+FaWrXKus4zZhjMELdLRam
 MrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708699095; x=1709303895;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OijQr4Cr1wWVumHbsjNdZzaJgYfpd0n4qUPdqEIlqC8=;
 b=gaYJvSZDSoUEUs+b+zkdoMYN+KfrQEeUQipKDXmQGhX/bdf363tg3I8haFqVO6l8kU
 QT8oUSxw6fH+J4BViIVfPV9nT8GHKaWvuyQcWLd1vtMg1PR0txDUFC4dlseLUdMFhkTe
 To06xOwIhenrEGbUAw5Dh8pMB2ScaAOg8Tw/Oj6p/F+DIse1iREOLoMtmih7EK02pPMT
 0UCkhQrIxZVHaFgMLCTZTIGRO8KWvOJ+CB/M/EEm3B5ldOgK2M4R7P3z55ScEaHZDYmV
 V0BELq56jyZnbaLKEJ3OUt1Ar4dTSQZt7ahYd/6X9qJCXaMJXufZuGZ/nTnWibbk6sO/
 4spg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB7c1MMNUDKH83PzDBYpTlNN9SEeTCwTRKf8UcVJZlRF9RBEuN9CPsLlYxtMDL5W04YdPr/K3/rkdxpoLNYJbzYMG0SfRC2nQq9VSylYY0
X-Gm-Message-State: AOJu0YzI+vEBTE4Q6MrtUeld6FuR9rXueAe58xsk2h5EFm6/fDpZiIOK
 t7xI+4TgRaXKMM/JqWiDEKQWZBs27jyXi/xQQF3GeNy8jubc3qF5CcW3yDHhcOI=
X-Google-Smtp-Source: AGHT+IHXnSkol2aJhEp+L08VZUe6Bf4+k2kUP/mYBPqvfHWEIG2AEabojynlyu84aR966Z4ypczRBQ==
X-Received: by 2002:a05:600c:3ca6:b0:412:78e1:5089 with SMTP id
 bg38-20020a05600c3ca600b0041278e15089mr18436wmb.13.1708699094868; 
 Fri, 23 Feb 2024 06:38:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58e3:6b80:c446:11f4?
 ([2a01:e0a:982:cbb0:58e3:6b80:c446:11f4])
 by smtp.gmail.com with ESMTPSA id
 c14-20020adfe74e000000b0033b87c2725csm2922134wrn.104.2024.02.23.06.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 06:38:14 -0800 (PST)
Message-ID: <77715ecd-ddb9-450c-98bf-4fcade0e81c0@linaro.org>
Date: Fri, 23 Feb 2024 15:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Content-Language: en-US, fr
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
 <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
 <ZdiU2z8rzo542_Ih@hovoldconsulting.com>
 <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org>
 <ZdiqAPPTn9SvsjL8@hovoldconsulting.com>
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
In-Reply-To: <ZdiqAPPTn9SvsjL8@hovoldconsulting.com>
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

On 23/02/2024 15:21, Johan Hovold wrote:
> On Fri, Feb 23, 2024 at 02:52:28PM +0100, Neil Armstrong wrote:
>> On 23/02/2024 13:51, Johan Hovold wrote:
>>> On Fri, Feb 23, 2024 at 12:03:10PM +0100, Neil Armstrong wrote:
>>>> On 23/02/2024 12:02, Neil Armstrong wrote:
> 
>>>>> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
>>>>>
>>>>> [1/6] drm/bridge: aux-hpd: fix OF node leaks
>>>>>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ee485bdda68d6d3f5728cbe3150eb9013d7d22b
>>>>> [2/6] drm/bridge: aux-hpd: separate allocation and registration
>>>>>          (no commit info)
>>>>> [3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
>>>>>          (no commit info)
>>>>> [4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
>>>>>          (no commit info)
>>>>> [5/6] phy: qcom-qmp-combo: fix drm bridge registration
>>>>>          (no commit info)
>>>>> [6/6] phy: qcom-qmp-combo: fix type-c switch registration
>>>>>          (no commit info)
>>>>>
>>>>
>>>> To clarify, I only applied patch 1 to drm-misc-fixes
>>>
>>> Ok, but can you please not do that? :)
>>>
>>> These patches should go in through the same tree to avoid conflicts.
>>>
>>> I discussed this with Bjorn and Dmitry the other day and the conclusion
>>> was that it was easiest to take all of these through DRM.
>>
>> I only applied patch 1, which is a standalone fix and goes into a separate tree,
>> for the next patches it would be indeed simpler for them to go via drm-misc when
>> they are properly acked.
> 
> But it is *not* standalone as I tried to explain above.
> 
> So you have to drop it again as the later patches depend on it and
> cannot be merged (through a different tree) without it.

drm-misc branches cannot be rebased, it must be reverted, but it can still be applied
on drm-misc-next and I'll send a revert patch for drm-misc-fixes if needed, not a big deal.

> I thought you had all the acks you needed to take this through drm-misc,
> but we can wait a bit more if necessary (and there's no rush to get the
> first one in).

If you want it to be in v6.9, it's too late since the last drm-misc-next PR has been sent
yesterday (https://cgit.freedesktop.org/drm/drm-misc/tag/?h=drm-misc-next-2024-02-22)

Please ping Thomas or Maxime, perhaps it's not too late since the drm-misc-next tree
really closes on sunday.

Neil


> 
> Johan

