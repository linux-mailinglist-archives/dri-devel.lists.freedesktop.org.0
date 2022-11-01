Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A50B614235
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 01:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCBE10E27E;
	Tue,  1 Nov 2022 00:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFC910E278
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 00:20:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id r12so21656223lfp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ltVA0VEUWwJOZXNwFHdny7/I3PEIV7RG2e5fWcKzBQ8=;
 b=ynernax80c+tiaO3NNIs+GPZRJtUxlZG2ik1koxH4sC8uwwR6XiMZbaPqO2lL1NDcs
 4LS/oL+6VPWjCasuv2i3hR5T/ZBbFQ0OeYxT7lEXTvGGX2T4M4268aVloAite1gS+RNv
 KB351DYB5KyspLRm7KFy3euJkcb7rQtq5rps25tGAx0oGFczKaytVEi4ElaNokglVHOW
 3H7cLRex6VSaxTdXmniCg7D37yonGJ+iDODESba/RsTbO/74xSS4CLgAfvSGwLb8ZZrq
 V6Ck+5BkcstBo2ahF7G/TgnTtULnzThyTwfauTNTduB/cEaIykz8YAYVd3U/H0xt9ooa
 hIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ltVA0VEUWwJOZXNwFHdny7/I3PEIV7RG2e5fWcKzBQ8=;
 b=wTdAB8MV3+XmJCU9jist1pp+Y0ZG5FbBSNGxQzXVRFaLt1fjFZGKk3BEUJ6fXYaMEF
 DmFgol9iDBT3H1L6YlhKJwuhVI4IT8flZ8pSv5ZSNlGSAOdz3evEnQPV9kK+u82uGfqP
 JDr/tEsXDWtx+EGDPaR+VlI0p5Fg9Q3/v88LHu2jfA6n79bNz1Bfly/Yk6rh394Dngxx
 yEKB131+qiJpxr6nck4QOjBsxxDRo6AMNsiusze3o6FRpF5F2IXZGlef4sO51eLqrY/S
 u+4MsYr7XCvT84pjmvCSraZwPfM+SIBRNsvytUNYyNNq4JNwvyQorOau6cvZt2wM8Cne
 yFPA==
X-Gm-Message-State: ACrzQf0iqWsrz72LJClQ3FuGRslfSz2mQPCBynnb2VrixiwrA2HURTFv
 JcLL82M7W75q/SUwRzjnsqdoqQ==
X-Google-Smtp-Source: AMsMyM4Zoc7cRAvYcF98dy4VrumGZYvL4foPAVdEmemuIlPPH1lQjSnn0wW3UkUis3DI3XXtOW4T8g==
X-Received: by 2002:ac2:47fa:0:b0:4a2:361d:da19 with SMTP id
 b26-20020ac247fa000000b004a2361dda19mr6257267lfp.548.1667262029463; 
 Mon, 31 Oct 2022 17:20:29 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056512239000b00497a61453a9sm229395lfv.243.2022.10.31.17.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 17:20:29 -0700 (PDT)
Message-ID: <c77e5aad-d21c-e880-8ef3-081aeac86240@linaro.org>
Date: Tue, 1 Nov 2022 03:20:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] drm/msm/dsi: add a helper method to compute the dsi
 byte clk
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
 <dea86c81-449a-3296-d5de-c3b346f974e4@linaro.org>
 <350c27fb-3d13-9252-6fa3-f67b7cc47444@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <350c27fb-3d13-9252-6fa3-f67b7cc47444@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/10/2022 01:22, Abhinav Kumar wrote:
> 
> 
> On 10/27/2022 10:35 AM, Dmitry Baryshkov wrote:
>> On 22/09/2022 03:49, Abhinav Kumar wrote:
>>> Re-arrange the dsi_calc_pclk method to two helpers, one to
>>> compute the DSI byte clk and the other to compute the pclk.
>>>
>>> This makes the separation of the two clean and also allows
>>> clients to compute and use the dsi byte clk separately.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 27 +++++++++++++++++++--------
>>>   2 files changed, 21 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>>> b/drivers/gpu/drm/msm/dsi/dsi.h
>>> index 2a96b4fe7839..60ba8e67f550 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>> @@ -118,6 +118,8 @@ int dsi_link_clk_enable_6g(struct msm_dsi_host 
>>> *msm_host);
>>>   int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
>>>   void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host);
>>>   void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host);
>>> +unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool 
>>> is_bonded_dsi,
>>> +        const struct drm_display_mode *mode);
>>>   int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size);
>>>   int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
>>>   void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 57a4c0fa614b..32b35d4ac1d3 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -569,9 +569,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host 
>>> *msm_host)
>>>       clk_disable_unprepare(msm_host->byte_clk);
>>>   }
>>> -static unsigned long dsi_get_pclk_rate(struct msm_dsi_host 
>>> *msm_host, bool is_bonded_dsi)
>>> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode 
>>> *mode, bool is_bonded_dsi)
>>>   {
>>> -    struct drm_display_mode *mode = msm_host->mode;
>>>       unsigned long pclk_rate;
>>>       pclk_rate = mode->clock * 1000;
>>> @@ -588,12 +587,18 @@ static unsigned long dsi_get_pclk_rate(struct 
>>> msm_dsi_host *msm_host, bool is_bo
>>>       return pclk_rate;
>>>   }
>>> -static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
>>> is_bonded_dsi)
>>> +unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool 
>>> is_bonded_dsi,
>>> +        const struct drm_display_mode *mode)
>>>   {
>>> +    struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>>       u8 lanes = msm_host->lanes;
>>>       u32 bpp = dsi_get_bpp(msm_host->format);
>>> -    unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, 
>>> is_bonded_dsi);
>>> -    u64 pclk_bpp = (u64)pclk_rate * bpp;
>>> +    unsigned long pclk_rate;
>>> +    u64 pclk_bpp;
>>> +
>>> +    pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>>> +
>>> +    pclk_bpp = (u64)pclk_rate * bpp;
>>>       if (lanes == 0) {
>>>           pr_err("%s: forcing mdss_dsi lanes to 1\n", __func__);
>>> @@ -606,8 +611,14 @@ static void dsi_calc_pclk(struct msm_dsi_host 
>>> *msm_host, bool is_bonded_dsi)
>>>       else
>>>           do_div(pclk_bpp, (8 * lanes));
>>> -    msm_host->pixel_clk_rate = pclk_rate;
>>> -    msm_host->byte_clk_rate = pclk_bpp;
>>> +    return pclk_bpp;
>>> +}
>>> +
>>> +static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
>>> is_bonded_dsi)
>>> +{
>>> +    msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, 
>>> is_bonded_dsi);
>>> +    msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, 
>>> is_bonded_dsi,
>>> +            msm_host->mode);
>>
>> This way you are calling dsi_get_pclk_rate twice(), which is slightly 
>> inefficient. You can call it once (here) and then pass the resulting 
>> pclk_rate as an argument to dsi_byte_clk_get_rate().
> 
> So the goal was to have two independent APIs to calculate byte and pixel 
> clk.
> 
> If we pass the output of one as the input to the other we are making 
> them dependent.
> 
> Thats why i kept it separate.

Calling one function from another clearly points that they are not 
independent. And surely pixel and byte clocks can not be fully 
independent. I see your point about getting only the byte clock. But I 
think it would be easier to explicitly pass the pixel rate rather than 
calculating it again under the hood.

> 
>>
>>>       DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
>>>                   msm_host->byte_clk_rate);
>>> @@ -635,7 +646,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host 
>>> *msm_host, bool is_bonded_dsi)
>>>       dsi_calc_pclk(msm_host, is_bonded_dsi);
>>> -    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_bonded_dsi) * bpp;
>>> +    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) 
>>> * bpp;
>>
>> So... We have calculated all rates, stored the pclk_rate in 
>> msm_host->pixel_clk_rate. And now we are going to calculate it again. 
>> As you are touching this line of code, I'd suggest to just use 
>> msm_host->pixel_clk_rate instead of a function call.
> 
> Ack, I will fix this.
> 
>>
>>>       do_div(pclk_bpp, 8);
>>>       msm_host->src_clk_rate = pclk_bpp;
>>

-- 
With best wishes
Dmitry

