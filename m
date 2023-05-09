Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 048786FBC1A
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 02:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131BF10E1A2;
	Tue,  9 May 2023 00:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5D910E31D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 00:47:53 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f14f266b72so3577077e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 17:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683593271; x=1686185271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2K2VmoJpgggZ+u/mJfOtr7nUCJcuEBaFmF7jzQMS/XY=;
 b=Tzm5TS0YUuReR77RmAKhdJ/PEyPdUH89d9qJIQgRR0oSEl1nlosD/MYdRkVmhc+32m
 LU7PXZ3Y6LIIQgsZPQbycvVT4yGy3sMAMFV8IJl2LOf8RTQKoyo9K1ahqEd+7b4pKJpd
 t8fpTN0F4f7KZSijtdoSIsNIhdr2xFh4at/jmj1o2lb65XiZKXrKu+Lnh7sObcEjGrmM
 KtJc2Y6jb9CZx9MYOnGXW9xaofVbI5kE+RwHqv3twI0gZiu0Qg6wFjOdzziX7b8B9+sP
 voe8UZ/06itjelaLV33yg4uEx4MHOIfnqHYEhBDPO8TDwZyGGbAANBAu+5XcqoGVW5to
 W14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683593271; x=1686185271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2K2VmoJpgggZ+u/mJfOtr7nUCJcuEBaFmF7jzQMS/XY=;
 b=ehxyUskcBQ4R2G09Ofyq+u3zypHN27EZz+qKNir1Wub5FEIzpbYWN3YlFyjgwnoPPL
 QOADkF6vRTwW3boN29qe1+OKPmsRR71SwzNpoL98Xg01VxQOo7J19JCNopKAjztHz8j9
 J2YSlfELnYQg82AarGjluITbqpSHb4L4n/BWV7tBAfcFbHM1Ku1mRYhiS93idJsZ+f/P
 Ea3hSdJwEG2a/InmWciPut4pwINr2W1aeMM26jcYr+kilXNS0HlGhTG1cuGn9H+vdLXb
 jm9wqfpPKQrtvN96g+BCN2zFp9UZUfIGnxdXVZiprZmH8/bmvdVc2XHbcwplwktAicln
 lkfA==
X-Gm-Message-State: AC+VfDxtJQZCneV6uZY0RaAExCwOQg6guXF8NVN/fa79szSkZ5/PEiqA
 xGxjl948Va0pedWbFB1nABKykQ==
X-Google-Smtp-Source: ACHHUZ6RTm+eGaF74iA7qeN9tia8YuVb03hXciakYT4mKKhFphVn3XVmdVFIQeMGDuSZiPs1w8QLew==
X-Received: by 2002:ac2:52b9:0:b0:4f1:1d32:6d67 with SMTP id
 r25-20020ac252b9000000b004f11d326d67mr239037lfm.39.1683593271023; 
 Mon, 08 May 2023 17:47:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05651211c400b004edc2a023ffsm146075lfr.36.2023.05.08.17.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 17:47:50 -0700 (PDT)
Message-ID: <9e9bbe10-8646-9443-06b2-fa6737d0c267@linaro.org>
Date: Tue, 9 May 2023 03:47:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] drm/msm/dsi: Fix compressed word count calculation
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
 <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
 <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
 <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
 <e4ebb901-84fd-7e7d-531c-1f8d7fec00f9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e4ebb901-84fd-7e7d-531c-1f8d7fec00f9@quicinc.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2023 03:45, Abhinav Kumar wrote:
> 
> 
> On 5/8/2023 4:27 PM, Dmitry Baryshkov wrote:
>> On 08/05/2023 23:09, Abhinav Kumar wrote:
>>>
>>>
>>> On 5/3/2023 1:26 AM, Dmitry Baryshkov wrote:
>>>> On 03/05/2023 04:19, Jessica Zhang wrote:
>>>>> Currently, word count is calculated using slice_count. This is 
>>>>> incorrect
>>>>> as downstream uses slice per packet, which is different from
>>>>> slice_count.
>>>>>
>>>>> Slice count represents the number of soft slices per interface, and 
>>>>> its
>>>>> value will not always match that of slice per packet. For example, 
>>>>> it is
>>>>> possible to have cases where there are multiple soft slices per 
>>>>> interface
>>>>> but the panel specifies only one slice per packet.
>>>>>
>>>>> Thus, use the default value of one slice per packet and remove 
>>>>> slice_count
>>>>> from the word count calculation.
>>>>>
>>>>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to 
>>>>> compute word count")
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> index 35c69dbe5f6f..b0d448ffb078 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct 
>>>>> msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>>           if (!msm_host->dsc)
>>>>>               wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>>>>           else
>>>>> -            wc = msm_host->dsc->slice_chunk_size * 
>>>>> msm_host->dsc->slice_count + 1;
>>>>> +            /*
>>>>> +             * When DSC is enabled, WC = slice_chunk_size * 
>>>>> slice_per_packet + 1.
>>>>> +             * Currently, the driver only supports default value 
>>>>> of slice_per_packet = 1
>>>>> +             *
>>>>> +             * TODO: Expand drm_panel struct to hold 
>>>>> slice_per_packet info
>>>>> +             *       and adjust DSC math to account for 
>>>>> slice_per_packet.
>>>>
>>>> slice_per_packet is not a part of the standard DSC, so I'm not sure 
>>>> how that can be implemented. And definitely we should not care about 
>>>> the drm_panel here. It should be either a part of drm_dsc_config, or 
>>>> mipi_dsi_device.
>>>>
>>>
>>> This is not correct.
>>>
>>> It is part of the DSI standard (not DSC standard). Please refer to 
>>> Figure 40 "One Line Containing One Packet with Data from One or More 
>>> Compressed Slices" and Figure 41 "One Line Containing More than One 
>>> Compressed Pixel Stream Packet".
>>
>> I have reviewed section 8.8.24 and Annex D of the DSI standard.
>>
>> It is not clear to me, if we can get away with always using 
>> slice_per_packet = 1. What is the DSI sink's difference between Fig. 
>> 40.(b) and Fig 41?
>>
> 
> The difference is that in fig 40(b) there is only one packet of data 
> (check closely, there is only one header).
> 
> In fig 41, there are multiple headers so its showing multiple packets.

Yes, this is the description of the pictures. I mean what is the 
functional difference?

> 
>> Are there are known panels that require slice_per_packet != 1? If so, 
>> we will have to implement support for such configurations.
>>
> 
> Unless explicitly requested by the panel, we can use 1. From the device 
> tree files of the panels we support downstream, I do see 
> qcom,mdss-dsc-slice-per-pkt set to 2 for some panels. I dont know 
> whether those panels will not work with 1. I really don't think any of 
> the DSC panels working with MSM were upstreamed.
> 
> I think the one jessica will be posting (and merging) will be the first 
> and that works with 1.
> 
> If there are other panels in the works which require 2 slice_per_pkt, I 
> would wait to first see them on the list and if they cannot work with 1 
> slice_per_pkt, add support for that.

If slice_per_pkt change is localized - touching only few lines in DSI or 
in msm_helpers. Otherwise we should consider having that from the 
beginning (but hardcoded to 1 for now).

> 
>>> This has details about this. So I still stand by my point that this 
>>> should be in the drm_panel.
>>
>> Note, the driver doesn't use drm_panel directly. So slices_per_packet 
>> should go to mipi_dsi_device instead (which in turn can be filled from 
>> e.g. drm_panel or from any other source).
>>
>>>
>>>>> +             */
>>>>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>>>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>>>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>>>>
>>>>
>>

-- 
With best wishes
Dmitry

