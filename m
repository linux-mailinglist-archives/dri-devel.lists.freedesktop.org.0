Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87683739334
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 01:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C141110E374;
	Wed, 21 Jun 2023 23:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF93910E37A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 23:46:59 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b45e6e1b73so84532941fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687391217; x=1689983217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oOiwUqZP4/ZBUQay2OmmnkqAiOONYUDUlPRVo/SLkM4=;
 b=DFnJQlCH2I3JkVfWuCzr5CSiQPKUQSAov76XceCVfvZrVHk9tYVmkpYAwW0JqmNZxC
 sY0hLfW04E0X/QSJqyn5XYpRHA4yQw/xVn3UvzZQ4yc51fQD3l5GvRd9JHhGuvZlFgx7
 28/ob8g/w3LkLdEF02Hwpvw4lSGF3JNOtWcv74SJFKPsEzpJXOmfPX09PfM9Cl8glLUs
 0Z2GlbWHfvo1Axd1SO5WCO1fOFMuzaRBhhjUmnuUs4VXV6bqNyjuT9Uq+1FOhz90Sc+k
 p6N8D8ip/OGRWJT/cbWmSuI2TWl+ENdoN6AwkABz4JYRhS9E9wOfJbF+aIbSpYIXdHhl
 sU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687391217; x=1689983217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOiwUqZP4/ZBUQay2OmmnkqAiOONYUDUlPRVo/SLkM4=;
 b=JQHm+qevAmi9iGsN1X5hnRIqWsDWNbGpy6KbfFdqX9UbUR96y9zZVg66ctV7B7O5X+
 OZnm6rB+Q5zGFVHmFJfrVrG955HmOdq7svIL9HGJzo733B4QKn7Rh+mk5vwRkQatcoBe
 52LGmuxEcxKahlHdtNr4vWknDn2t3pvf1RPFiukdVLUIUTYWAAdom6aJWzqYcz+IFdUt
 bYL+9tddMAh/5YVDPrCU2USXVJMMcshAF4xR4yfAK+zvSk2uJkSg99XuO1eGbyiZrltz
 gE0NV3gHjtM0YZsOOSePBYtnP4WsKV0++z/SBEHpPb5JQZTB+MI94bnAc1D3IbyYRDUK
 cqfg==
X-Gm-Message-State: AC+VfDxjArtHcI8QVg2nIyeMEzB4em3dRRMk5H3aDG/1iHpE5EI1RSSs
 qMiaQ5gOc8Q2XGuUcfzzXQ27pw==
X-Google-Smtp-Source: ACHHUZ59SEFD1bzDgMCtit9uF6IrHCQYYtidCfeaP2JiLSZdyfmuw85CumHY+HwWPTvbgmF6Ihb5RQ==
X-Received: by 2002:a2e:998c:0:b0:2b1:a3ce:b709 with SMTP id
 w12-20020a2e998c000000b002b1a3ceb709mr11935997lji.39.1687391217167; 
 Wed, 21 Jun 2023 16:46:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a2e7d02000000b002b4750c4db0sm1075944ljc.49.2023.06.21.16.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 16:46:56 -0700 (PDT)
Message-ID: <b119470d-f656-71d1-8b87-b4b8196f5220@linaro.org>
Date: Thu, 22 Jun 2023 02:46:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: Set DATABUS_WIDEN on command mode
 encoders
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
 <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
 <cce68370-3fd9-4c9a-258e-af0d5d057fda@quicinc.com>
 <n2c5qlujxhbbj2aqlgj7fetzoteood5h4hmbwt4mapi77xlvmt@bpourzaideti>
 <81a5e241-ec82-7414-8752-4ce3cb084959@linaro.org>
 <f14f2c31-38c2-0600-3a29-17e83afececf@quicinc.com>
 <26tvhvqpxtxz5tqc6jbjixadpae34k7uc7fyec2u5o2ccj4tdq@tjvguzlolc3g>
 <8dcd643f-9644-a4e7-a0d5-eefa28084a88@linaro.org>
 <7d5256cd-c0bd-36e3-9b59-63ad8595f0ce@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7d5256cd-c0bd-36e3-9b59-63ad8595f0ce@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/06/2023 02:01, Abhinav Kumar wrote:
> 
> 
> On 6/21/2023 9:36 AM, Dmitry Baryshkov wrote:
>> On 21/06/2023 18:17, Marijn Suijten wrote:
>>> On 2023-06-20 14:38:34, Jessica Zhang wrote:
>>> <snip>
>>>>>>>>> +    if (phys_enc->hw_intf->ops.enable_widebus)
>>>>>>>>> +        phys_enc->hw_intf->ops.enable_widebus(phys_enc->hw_intf);
>>>>>>>>
>>>>>>>> No. Please provide a single function which takes necessary
>>>>>>>> configuration, including compression and wide_bus_enable.
>>>>>>>>
>>>>>>>
>>>>>>> There are two ways to look at this. Your point is coming from the
>>>>>>> perspective that its programming the same register but just a 
>>>>>>> different
>>>>>>> bit. But that will also make it a bit confusing.
>>>>>
>>>>> My point is to have a high-level function that configures the INTF for
>>>>> the CMD mode. This way it can take a structure with necessary
>>>>> configuration bits.
>>>>
>>>> Hi Dmitry,
>>>>
>>>> After discussing this approach with Abhinav, we still have a few
>>>> questions about it:
>>>>
>>>> Currently, only 3 of the 32 bits for INTF_CONFIG2 are being used (the
>>>> rest are reserved with no plans of being programmed in the future). 
>>>> Does
>>>> this still justify the use of a struct to pass in the necessary
>>>> configuration?
>>>
>>> No.  The point Dmitry is making is **not** about this concidentally
>>> using the same register, but about adding a common codepath to enable
>>> compression on this hw_intf (regardless of the registers it needs to
>>> touch).
>>
>> Actually to setup INTF for CMD stream (which is equal to setting up 
>> compression at this point).
>>
> 
> Yes it should be setup intf for cmd and not enable compression.
> 
> Widebus and compression are different features and we should be able to 
> control them independently.
> 
> We just enable them together for DSI. So a separation is necessary.
> 
> But I am still not totally convinced we even need to go down the path 
> for having an op called setup_intf_cmd() which takes in a struct like
> 
> struct dpu_cmd_intf_cfg {
>      bool data_compress;
>      bool widebus_en;
> };
> 
> As we have agreed that we will not touch the video mode timing engine 
> path, it leaves us with only two bits.
> 
> And like I said, its not that these two bits always go together. We want 
> to be able to control them independently which means that its not 
> necessary both bits program the same register one by one. We might just 
> end up programming one of them if we just use widebus.
> 
> Thats why I am still leaning on keeping this approach.

I do not like the idea of having small functions being called between 
modules. So, yes there will a config of two booleans, but it is 
preferable (and more scalable) compared to separate callbacks.

Not to mention that it allows us to program required registers directly 
(by setting values) rather than using RMW cycles and thus depending on 
the value being previously programmed to these registers.

> 
>>>  Similar to how dpu_hw_intf_setup_timing_engine() programs the
>>> hw_intf - including widebus! - for video-mode.
>>>
>>> Or even more generically, have a struct similar to intf_timing_params
>>> that says how the intf needs to be configured - without the caller
>>> knowing about INTF_CONFIG2.
>>>
>>> struct dpu_hw_intf_cfg is a very good example of how we can use a single
>>> struct and a single callback to configure multiple registers at once
>>> based on some input parameters.
>>>
>>>> In addition, it seems that video mode does all its INTF_CONFIG2
>>>> configuration separately in dpu_hw_intf_setup_timing_engine(). If we
>>>> have a generic set_intf_config2() op, it might be good to have it as
>>>> part of a larger cleanup where we have both video and command mode use
>>>> the generic op. What are your thoughts on this?
>>>
>>> Not in that way, but if there is a generic enable_compression() or
>>> configure_compression() callback (or even more generic, similar to
>>> setup_intf_cfg in dpu_hw_ctl) that would work for both video-mode and
>>> command-mode, maybe that is beneficial.
>>
>> I'd rather not do this. Let's just 'setup timing enging' vs 'setup 
>> CMD'. For example, it might also include setting up other INTF 
>> parameters for CMD mode (if anything is required later on).
>>
> 
> Agreed on setup CMD but I dont know whether we need a setup CMD at all.
> Seems like an overkill.
> 
>>>
>>> - Marijn
>>

-- 
With best wishes
Dmitry

