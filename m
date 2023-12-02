Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC8F801EFF
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 23:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCAF10E226;
	Sat,  2 Dec 2023 22:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A80A10E226
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 22:23:28 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50bf2d9b3fdso44155e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 14:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701555806; x=1702160606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i98wi9Skw7SDbYp7AqZ/fnWX0PsjqvuYrEXQ3u2+UPQ=;
 b=c+hPpDQ+NBCTLZsJmPyn9aHZqVjo3syBnXezWXGeV/KvVLexIqoc/i9zYtOHT4HSvn
 X3BgwTBWcuOFi+FVea9nqezF1ZMeLRghhSaK5pBAmRPkUDhhQn+4UBQ6b3VmzNMvP+Pi
 WrTzRWMNXUBWGzUEQxZuQGluEdRPQBgeam4vGT/4qyHJfPwOXxxTziUpAFU2feHfnmbJ
 sLoPRy909iQ8CwivT4TM2OKi19cBNzk6g0el+DpiBCo62TfEqfOdr9Lqdd/wd+e8kwJZ
 VuF+JAsKOCzlP1KwRDZ2HqkyBninX0Lru8/rl9x7+pyXSjtCAI/35+dKYjnpopf881E0
 7EXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701555806; x=1702160606;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i98wi9Skw7SDbYp7AqZ/fnWX0PsjqvuYrEXQ3u2+UPQ=;
 b=RKzrI7BjE6CdNjbrFoFQZ97anUpxsmFR+kOCsihSAhnlC4tbzpCYFzm9x01CzQOqAp
 aPVXREx2PynZevC/fYJiUUKherlTHRnILSQb3mbF/osdUuQNu63uEZg5b9oj0T0KiWks
 0GWxTmhuklnsuAJVkgub/m/RpUM0B1U/XGtz/yytzZrG9TWaeT6aomb9wvuA8inLvzYR
 51pfC371dc6PfZW2JjqAMqO9neF2JT7nEuDRRhxCEe4mfScRi8qirpIVikFp3KCEnmaU
 3lxfdTO/g3GC7ERHbAEaEQoR7MAjyR8bo/JOYPoaMmVyvw4y/kb7gmDJqnNr3SBrK5fW
 kwEA==
X-Gm-Message-State: AOJu0YzymrilsySvAS2SdKYnHOC8R09UminlMB0zNgzZcNv2GxuxiNlR
 1aKlPTSi/7s4SqzgDEeI1aAB4w==
X-Google-Smtp-Source: AGHT+IFhlsbhAD3nB8qmlIptBu3X5G3H6uBJcCVdG0C+Wpabrj5k/+i0Rwm05YujjeFTCeBqRoeEag==
X-Received: by 2002:ac2:4ac4:0:b0:50b:d764:76db with SMTP id
 m4-20020ac24ac4000000b0050bd76476dbmr1958594lfp.106.1701555806206; 
 Sat, 02 Dec 2023 14:23:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a19741a000000b0050beeea07f3sm146792lfe.4.2023.12.02.14.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Dec 2023 14:23:25 -0800 (PST)
Message-ID: <551382fc-4256-4e2f-974c-9b0f6814a8f8@linaro.org>
Date: Sun, 3 Dec 2023 00:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
Content-Language: en-GB
To: Jonathan Marek <jonathan@marek.ca>
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-5-jonathan@marek.ca>
 <CAA8EJppg=pYh73ncHBCO6Ddv9gG7+WNnpwLYGEv6xEu_3MRNWw@mail.gmail.com>
 <ebec534a-4c72-7d33-4c18-4e0b43338568@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ebec534a-4c72-7d33-4c18-4e0b43338568@marek.ca>
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
Cc: freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2023 20:45, Jonathan Marek wrote:
> On 11/15/23 2:38 AM, Dmitry Baryshkov wrote:
>> On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>>>
>>> Make it clear why the pkt_per_line value is being "divided by 2".
>>>
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 66f198e21a7e..842765063b1b 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -877,6 +877,8 @@ static void dsi_update_dsc_timing(struct 
>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>          /* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
>>>           * registers have similar offsets, so for below common code use
>>>           * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
>>> +        *
>>> +        * pkt_per_line is log2 encoded, >>1 works for supported 
>>> values (1,2,4)
>>>           */
>>>          reg |= 
>>> DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
>>
>> Should we switch to ffs() or fls() instead?
>>
> 
> Just a ffs() on its own can be confusing as well (without the 
> information that only powers of two are possible), I think like this is 
> better.

Sounds fair. Could you please then add `if (pkt_per_line > 4) 
drm_warn("pkt_per_line too big");`

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
>>>          reg |= 
>>> DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
>>> -- 
>>> 2.26.1
>>>
>>
>>

-- 
With best wishes
Dmitry

