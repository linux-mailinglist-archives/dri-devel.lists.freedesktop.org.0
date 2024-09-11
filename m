Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B2974BA8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 09:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67A910E802;
	Wed, 11 Sep 2024 07:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mT/Jtv5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164B210E802
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 07:41:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3770320574aso4036645f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726040492; x=1726645292; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=6z34Zlt3Q4zjZ37hMcQIHQZDLBbn26U33a/y1R7bWK8=;
 b=mT/Jtv5PTrD8MoYbZG2bjBzDaK7OIh1F0BvuNF5C7gRGutGXJrVFlHWUsg+zb+4VmN
 Zz9D+D/CdcUaGTqtXnleMc1h7UUk+WA9LYQFdNT/bUPqWsuhGT+zt9wB0t5F1XKW7uB1
 44zQpIxcAgXc+K4Zz+P/fOIn+0spX1UMwn91ZKjpvwkE7R5xXmrPvQBplveB2olze1s/
 o6H6Piee0yF3txZAWmxREi/MAYNAq4s48c3mEfbbGEV4XeQ9ebvlK7HvezuF8+uXDOhP
 Mo0hiGKYRzFXmz5geUCMa2J60DpBMXVjzRlrYO8wRXZHEBj5NMA7fxrgIf0L6mPdDTby
 LuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726040492; x=1726645292;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6z34Zlt3Q4zjZ37hMcQIHQZDLBbn26U33a/y1R7bWK8=;
 b=HsV4EBDj9Y1VnJuP0Y+qVOhiQ3wvUevC2J9OcghFtm6WfkAsD1YaWBvbAPooD3nrR6
 FPErkds/qpnPJQLLY8glSo15LBHfoVRipDACc7tzwlfEWpu/Yo4YrqFm2qkEAyzyUU0Y
 QaAybJq+D+l66DBpS/LI7cBhe4R4VwtND2l86bQnvmO2BVqz/POnqunPeVvbfxbLGExT
 61ftNtwnDv/j8wO4MKo3YCWX0ynZnZRBI1qBj0tRy1G3Tcgzv+n/4//PFxaN4PCTzBjR
 0Aw5Gx14nJj2oBWfq74TrWBkgH7gzSf1dqrLVZ1TvNqt/EyQ+GvyHQzxRZjhdHsCdZqW
 DRjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBaa86WxGc54vuMIRsDP3CGAYxT0M7zAb0yC7C07YN8phw2sk7htQvkD5BFvVHmhHctcmEVlFjtKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAIV79FiD0UViONkY50lZOrLVOxxcukN+ds4GATXXAiSozQoS4
 aqEodaRko4YPipM6f7S5YWGnqs59HH/OsW7Rmrhy5tSLCJLnezSRzZ/Cb2kOcRU=
X-Google-Smtp-Source: AGHT+IFiZ0mm2FQhbHm611cF4I2LYPqNYqrELrQqrRF69RgkMEnaahSfB7lwFpMNJUfHVpjrxmCXOQ==
X-Received: by 2002:adf:f30a:0:b0:377:27f1:d54f with SMTP id
 ffacd0b85a97d-3788967e268mr12536337f8f.45.1726040491556; 
 Wed, 11 Sep 2024 00:41:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1680:3625:e94b:7c21?
 ([2a01:e0a:982:cbb0:1680:3625:e94b:7c21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675c1dsm10791369f8f.58.2024.09.11.00.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 00:41:31 -0700 (PDT)
Message-ID: <8f0227fb-1457-4464-810a-c6b915d9349a@linaro.org>
Date: Wed, 11 Sep 2024 09:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: himax-hx83112a: transition to mipi_dsi wrapped
 functions
To: Doug Anderson <dianders@chromium.org>,
 Tejas Vipin <tejasvipin76@gmail.com>,
 Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
References: <20240904141521.554451-1-tejasvipin76@gmail.com>
 <0bb94cc0-dd72-4da7-b0b6-9e1fe712709b@quicinc.com>
 <0e3bf87b-7d82-44eb-88d2-fddc8e33dd25@quicinc.com>
 <330174f9-bead-4411-b05e-ea9c009f765c@gmail.com>
 <CAD=FV=XsHuhprN-ijw8-ZmOKV6CnCrR=s4X4L57p9J8e02MTBg@mail.gmail.com>
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
In-Reply-To: <CAD=FV=XsHuhprN-ijw8-ZmOKV6CnCrR=s4X4L57p9J8e02MTBg@mail.gmail.com>
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

On 10/09/2024 23:19, Doug Anderson wrote:
> Hi,
> 
> On Sat, Sep 7, 2024 at 1:32 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> On 9/7/24 3:53 AM, Jessica Zhang wrote:
>>>
>>>
>>> On 9/6/2024 3:14 PM, Jessica Zhang wrote:
>>>>
>>>>
>>>> On 9/4/2024 7:15 AM, Tejas Vipin wrote:
>>>>> Changes the himax-hx83112a panel to use multi style functions for
>>>>> improved error handling.
>>>>>
>>>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>>>
>>>> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>
>>> Hi Tejas,
>>>
>>> Just a heads up, it seems that this might be a duplicate of this change [1]?
>>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>> [1] https://patchwork.freedesktop.org/patch/612367/?series=138155&rev=1
>>
>> Ah, thanks for letting me know. I hadn't realized someone else had
>> started working on this too.
>>
>> However, I would argue that my patch [2] is a better candidate for merging
>> because of the following reasons:
>>
>> 1) Removes unnecessary error printing:
>> The mipi_dsi_*_multi() functions all have inbuilt error printing which
>> makes printing errors after hx83112a_on unnecessary as is addressed in
>> [2] like so:
>>
>>> -     ret = hx83112a_on(ctx);
>>> +     ret = hx83112a_on(ctx->dsi);
>>>        if (ret < 0) {
>>> -             dev_err(dev, "Failed to initialize panel: %d\n", ret);
>>>                gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>                regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>> -             return ret;
>>>        }
>>
>> [2] also removes the unnecessary dev_err after regulator_bulk_enable as was
>> addressed in [3] like so:
>>
>>>        ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>> -     if (ret < 0) {
>>> -             dev_err(dev, "Failed to enable regulators: %d\n", ret);
>>> +     if (ret < 0)
>>>                return ret;
>>> -     }
>>
>> 2) Better formatting
>>
>> The mipi_dsi_dcs_write_seq_multi statements in [1] aren't formatted
>> quite right according to what has been done so far. They are written as
>> such in [1]:
>>
>>> +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
>>>                               0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
>>
>> Where they should be written as such in [2]:
>>
>>> +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
>>> +                                  0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
>>
>> All in all, the module generated using my patch ends up being a teensy
>> bit smaller (1% smaller). But if chronology is what is important, then
>> it would at least be nice to see the above changes as part of Abhishek's
>> patch too. And I'll be sure to look at the mail in the drm inbox now
>> onwards :p
>>
>> [1] https://patchwork.freedesktop.org/patch/612367/?series=138155&rev=1
>> [2] https://lore.kernel.org/all/20240904141521.554451-1-tejasvipin76@gmail.com/
>> [3] https://lore.kernel.org/all/CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com/
> 
> I would tend to agree that Tejas's patch looks slightly better, but
> Abhishek's patch appears to have been posted first.
> 
> Neil: any idea what to do here? Maybe a Co-Developed-by or something?
> ...or we could land Abhishek and Tejas could post a followup for the
> extra cleanup?

Yeah usually I take the first one when they are equal, but indeed Tejas
cleanup up a little further and better aligned the parameters so I think
Tejas's one is a better looking version.

In this case we should apply Teja's one, nothing personal Abhishek!

> 
> Abhishek: are you planning to post more _multi cleanups? If so, please
> make sure to CC Tejas (who has been posting a bunch of them) and
> perhaps me since I've been helping to review them a bit.
> 
> -Doug

