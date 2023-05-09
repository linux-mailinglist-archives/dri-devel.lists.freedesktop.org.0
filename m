Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7846FC169
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 10:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851E210E351;
	Tue,  9 May 2023 08:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8923B10E352
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 08:12:17 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ad714536cfso31110091fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 01:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683619935; x=1686211935;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5XmVgWUkbGZmH29o+XZsTCuQqgOysUDCxIShsao+BgM=;
 b=htBUkBschRRomgR3PiEMWZoBNU9slAbP0wxrXrJjfIEspJ6Q+lQONSshDs8J6Rr4iS
 TBxQYxNao2FfSB3G/52eUf7IrwLx43h3VdpphWbAlkyh9Y/21IfxHoRlml65YIAm95HE
 z3qhfTNjaHXLtGAeWZAmN04nfEWBuM+N3RWEaqZkYhbuMuavEd+voV63g/U8xeKVXrD+
 x37o1A0k7U5jKr+3n3l0nuU3j5uICGA1ThsBBPL3xnskBviTvdddnJoglPY1a7zNrS1N
 YbrvOrEiqMztykgsKmtNagPTCBEumAIbwiTlP/+2ips/105gEcJRUcB9Hx4REqiJ/cr0
 vh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683619935; x=1686211935;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5XmVgWUkbGZmH29o+XZsTCuQqgOysUDCxIShsao+BgM=;
 b=Bq1XdO30HmBdexfXxtpJn3YlJNJcilNSCHAW4YaGi8I5OTv9eceUnrkPRMZuMkyodz
 CibAXHuYe5PHnyegREYHnD1mvjBtDRqnqLbb2DbbMZAwc39xZoCOpMWEestnlBi3UWIn
 3tiM+MiSJdVL+OPubxp3UbW/NjTyd9gzdMV67dkqkQ2ZY0RP01sE3f3/o3FnT2IT+kd0
 TtTFzq1OzG+g52HPRHvMA/0IwVRHigI7s5yg4SAGxUBY/EGxtqZnv8HlNcYFAtoZVgsj
 V4Aeq3RRV2kqyx/aH1OaSq3iXgU/zft0cnyUnDyEAMuhxe2fe58piUMd+834BAKc/6Y9
 QgRw==
X-Gm-Message-State: AC+VfDxCClCKXO0Di8auL8CK+bodx17GWNA6Ga40q8rYB1hIZtuM50Qx
 sVQanNKJ1Fbs5HOWc4KZ/cmPzw==
X-Google-Smtp-Source: ACHHUZ7h8aaZAMor4jHygqzrp/yoUgufiF6uxaXuQ5T+wYdTfkV23g5TLxZA0j9mSHHfKJWz5zMgig==
X-Received: by 2002:a2e:90ca:0:b0:29a:8580:8140 with SMTP id
 o10-20020a2e90ca000000b0029a85808140mr655790ljg.3.1683619934926; 
 Tue, 09 May 2023 01:12:14 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a19ee0c000000b004eb42f5367bsm263799lfb.19.2023.05.09.01.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 01:12:14 -0700 (PDT)
Message-ID: <8a4716dc-440b-e061-3074-fca9689289e7@linaro.org>
Date: Tue, 9 May 2023 10:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] drm/msm/dsi: Fix compressed word count calculation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
 <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
 <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
 <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9.05.2023 01:27, Dmitry Baryshkov wrote:
> On 08/05/2023 23:09, Abhinav Kumar wrote:
>>
>>
>> On 5/3/2023 1:26 AM, Dmitry Baryshkov wrote:
>>> On 03/05/2023 04:19, Jessica Zhang wrote:
>>>> Currently, word count is calculated using slice_count. This is incorrect
>>>> as downstream uses slice per packet, which is different from
>>>> slice_count.
>>>>
>>>> Slice count represents the number of soft slices per interface, and its
>>>> value will not always match that of slice per packet. For example, it is
>>>> possible to have cases where there are multiple soft slices per interface
>>>> but the panel specifies only one slice per packet.
>>>>
>>>> Thus, use the default value of one slice per packet and remove slice_count
>>>> from the word count calculation.
>>>>
>>>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to compute word count")
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> index 35c69dbe5f6f..b0d448ffb078 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>           if (!msm_host->dsc)
>>>>               wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>>>           else
>>>> -            wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_count + 1;
>>>> +            /*
>>>> +             * When DSC is enabled, WC = slice_chunk_size * slice_per_packet + 1.
>>>> +             * Currently, the driver only supports default value of slice_per_packet = 1
>>>> +             *
>>>> +             * TODO: Expand drm_panel struct to hold slice_per_packet info
>>>> +             *       and adjust DSC math to account for slice_per_packet.
>>>
>>> slice_per_packet is not a part of the standard DSC, so I'm not sure how that can be implemented. And definitely we should not care about the drm_panel here. It should be either a part of drm_dsc_config, or mipi_dsi_device.
>>>
>>
>> This is not correct.
>>
>> It is part of the DSI standard (not DSC standard). Please refer to Figure 40 "One Line Containing One Packet with Data from One or More Compressed Slices" and Figure 41 "One Line Containing More than One Compressed Pixel Stream Packet".
> 
> I have reviewed section 8.8.24 and Annex D of the DSI standard.
> 
> It is not clear to me, if we can get away with always using slice_per_packet = 1. What is the DSI sink's difference between Fig. 40.(b) and Fig 41?
> 
> Are there are known panels that require slice_per_packet != 1? If so, we will have to implement support for such configurations.
At least two different ones on expensive Xperias (souxp00_a+amb650wh07 and
sofef03_m)

Konrad
> 
>> This has details about this. So I still stand by my point that this should be in the drm_panel.
> 
> Note, the driver doesn't use drm_panel directly. So slices_per_packet should go to mipi_dsi_device instead (which in turn can be filled from e.g. drm_panel or from any other source).
> 
>>
>>>> +             */
>>>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>>>
>>>
> 
