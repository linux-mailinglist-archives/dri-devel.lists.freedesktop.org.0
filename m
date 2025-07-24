Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9FEB106AB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F4010E13B;
	Thu, 24 Jul 2025 09:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wHZnEWiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEA910E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:42:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so8451075e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753350160; x=1753954960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=z79CaHWu43l5yDjP2x+eJ9/JPd8Ed9Dgxev8omxcjqk=;
 b=wHZnEWiH4rj0IzGgJ4Hl8BI4bK1FSeITdgvean9r3qJ+Nt/A/3GA/vZuG6EIbK7+48
 Vz6iL2pJcYPeBquMa3shR5erck6oLhtuqNtnar3eLyicOEPm8/9W66mJVxNxmPe1Oqt3
 NCiht0yw9DVdF7GkuZua6xfDHT7soe+0lPLvPWrvJVaY6d9027OxRWvwhtNO2hfqGkfh
 dm4R0can2Szf9ozBiCvwIshW+CgmieJhvarLTrOXSeAn6YmSCuVTYYm3vYCvD4K2PrEo
 qeStwK97PXccHtO1pVYOP6SNsfCRCRBu4occOROBZll0iX0RMJ+L39HRgNWm7D3LZ92k
 doXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753350160; x=1753954960;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=z79CaHWu43l5yDjP2x+eJ9/JPd8Ed9Dgxev8omxcjqk=;
 b=qW7nmS1I98z62ZscpCnVJonCM49472tvhI4c7lQlehYAOtH7jtXmM74Chp1DPP9uTE
 wpF85hjg/Z685B2BbFesU7KaE/Ybfbm57RFxduISV+oqIF5XqKsigt+74Gq04yB1gbUz
 Y6s8V+5J1sSoHshXLG+/5c6q5T08Q63ElStmiT7mVdBHNVcxFRrnG9SSDjV9Bg1TEhCR
 l3cvipZ9IKG48XQeDoqsazsNhdZzaUTPX4ymr+V7KsdPXMGjs0FC26L/Ita9xVQqnKTd
 9scrY0iyyFXdPRGqnLIlMEIaEqMkUPEhtDeeU8MmSxr639Isrf2/XG7M1IEvQggCLp/i
 PmnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvO8TAUlSJRJD+aCG56Bd5OVpKIPrmA7CP2rCceLuqh7e/7kFFEO/Mv6aMRsrlTMSomISVrq7UHsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPOfrAHo91BA5BXrki96w989h7WetMQwVGhBgv3H8BJ8o9wpPK
 SYU2fRydfMhVPYvVrmGfOQZhiv3X4V/q8sIfLObYeQ7GdOZeaCKi5L0mgRsvMFlMwRM=
X-Gm-Gg: ASbGncvLqYhbfWC/rAHAMKH5Wj0vDkXvpqDHc4S3n4oXi4UGMoCVA2nXxVTLVJ/S70A
 myihzXyud35GrregCGdi70y88zMkksR55JlqHBtq47SJapCBBO1MfI6BcBEK1AsyNNSXGDEd0Qb
 DxHO0DSxgAwGO5v4zNK0/cETc8ScLwnj+xT0RatCPrpA2vqmtqB9292ngMYEOFoVTh7hqDq58I3
 qRCaXT8JEtOmdQyDGE0nTg0PN5m0sMcYoXbBT0+uEfOg6qKeBesgRjEeyEr7Lfc+tTDfRhgEiTD
 iaYmKbBlh/vyGEjflRnwOJL7lfLO1b3MpFLmXF0FsgnsHIxn4nGYFUs+kiGSLR/u2cCJm1KIZjI
 5m0x3F02IwLTHALKGx1mI3al0YJxlU2Z3fqUeS1D7MPM=
X-Google-Smtp-Source: AGHT+IEJiJWWY6AZunf3Qx5trJPQSTvOfmPtKb0jYGN1pLKaCbVpPEh7OudnuPeQBKWruWnGdZ/9gw==
X-Received: by 2002:a05:600c:4e0d:b0:456:2dc1:a603 with SMTP id
 5b1f17b1804b1-45868c8f4fbmr51798005e9.5.1753350160391; 
 Thu, 24 Jul 2025 02:42:40 -0700 (PDT)
Received: from [172.20.10.3] ([78.246.240.195])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4586ec79441sm13392125e9.2.2025.07.24.02.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 02:42:40 -0700 (PDT)
Message-ID: <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
Date: Thu, 24 Jul 2025 11:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
 <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
 <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
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
In-Reply-To: <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/07/2025 11:32, Dmitry Baryshkov wrote:
> On Thu, 24 Jul 2025 at 12:08, <neil.armstrong@linaro.org> wrote:
>>
>> On 20/05/2025 10:06, Johan Hovold wrote:
>>> Hi Chris,
>>>
>>> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
>>>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
>>>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
>>>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>>>>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>>>>>>>>         }
>>>>>>>>
>>>>>>>>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>> +
>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
>>>>>>>> +     if (ret < 0) {
>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
>>>>>>>> +                         aux->name, ret);
>>>>>>>> +             return -ENODEV;
>>>>>>>> +     }
>>>>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>> +
>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
>>>>>>>> +     if (ret < 0) {
>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
>>>>>>>> +                         aux->name, ret);
>>>>>>>> +             return -ENODEV;
>>>>>>>> +     }
>>>>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>>>>>>>> +
>>>>>>>> +     /*
>>>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
>>>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
>>>>>>>> +      * the sink must use the MIN value as the effective PWM bit count.
>>>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
>>>>>>>> +      * correct brightness scaling on compliant eDP panels.
>>>>>>>> +      */
>>>>>>>> +     pn = clamp(pn, pn_min, pn_max);
>>>>>>>
>>>>>>> You never make sure that pn_min <= pn_max so you could end up with
>>>>>>> pn < pn_min on broken hardware here. Not sure if it's something you need
>>>>>>> to worry about at this point.
>>
>> I'm trying to figure out what would be the behavior in this case ?
>>
>> - Warn ?
>> - pn_max = pn_min ?
>> - use BIT_COUNT as-is and ignore MIN/MAX ?
>> - pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
>> - reverse clamp? clamp(pn, pn_max, pn_min); ?
>> - generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?
> 
> Per the standard, the min >= 1 and max >= min. We don't need to bother
> about anything here.

Yeah, I agree. But I think a:
if (likely(pn_min <= pn_max))
is simple and doesn't cost much...

> 
> On the other hand, I think the patch needs to be updated a bit. If the
> pn value changed after clamping, it makes sense to write it back to
> the DP_EDP_PWMGEN_BIT_COUNT register by jumping to the tail of the
> drm_edp_backlight_probe_max() function

You're right, we need to write it back, but we can't jump to
the tail of the function since it has all the pwmgen logic
in the middle.

Neil

> 
>>
>> Or just bail out ?
>>
>> Neil
>>
>>>>>>
>>>>>> I am honestly not sure. I would hope that devices follow the spec and
>>>>>> there is no need to be too paranoid, but then again we do live in the
>>>>>> real world where things are... not so simple ;-).
>>>>>> I will wait for further feedback from someone who has more experience
>>>>>> with eDP panels than I have.
>>>>>
>>>>> There's always going to be buggy devices and input should always be
>>>>> sanitised so I suggest adding that check before calling clamp() (which
>>>>> expects min <= max) so that the result here is well-defined.
>>>>
>>>> Makes sense, I will do so in the next revision.
>>>
>>> It seems you never got around to respinning this one so sending a
>>> reminder.
>>>
>>> Johan
>>>
>>
> 
> 

