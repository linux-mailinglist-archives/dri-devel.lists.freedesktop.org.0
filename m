Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0E6FBB6A
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 01:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09C310E060;
	Mon,  8 May 2023 23:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB8310E060
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 23:27:20 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac82b07eb3so50812121fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 16:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683588438; x=1686180438;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a6Rt7YiQAZlCnHEpzBmgJ4SMOzivrPiJcKF14bVvwBc=;
 b=YBOCnu8VfDSyp3Adz3AUWEr/nwKCediKzOd9kJ0zdZ0tnra0ubkMZU+X5J0ItN/gY4
 vq952Rowh5oKvoRtvcGzVRwDjssEtDV9b3nWUY59FIVrtvRi+fvlbENYgqHoRzFddxGp
 /4MoHCALIOJV3w7ZKGgCI/63MniAI0WUA85OUF8y8ix42O6g/BunJBjTiI/iYzkNuuoL
 gEUupmWmqlpFCK+DODGCARU+nQuBh9vhRbtCiXz10MufMZ4DpnO2LpPUnUsPoTEotRbD
 /h1CcOrcD/oYdUQ8ulal63W2Oi0zmQEjkKTb/WDaDhZn+0xmWTvRozpHuFZyQ5SK3eyH
 iSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683588438; x=1686180438;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a6Rt7YiQAZlCnHEpzBmgJ4SMOzivrPiJcKF14bVvwBc=;
 b=Unh44YMX6blUsrzqKcx7T/OmsjOl67JJ0qZOjr5kKS6cT0PI++taNm6K5+SH07MILh
 5qrASVqWHjy+zKdqDEF9iJAIBAgk6wB20TswU6gaXQ1DmtkMWPbYhOqNRVfpM4I3iKYC
 3P14QSFdMiIDm1zYicw2BJREOCTpx/1c8DGbo8bikqFPbbaTSLeOINKGH+fdA/s4sz1v
 UBraXdiePQ7/fvG/jT8Douv2lUyN3bPdTDSzLFmLH9QUTUJHpQFFYvz8BJR3kmlS16a/
 XEvCL47hDb14GKPU+NosjFGTpuJYzle1mhad5uNxHbHKf+aw9OiLBxsf0QiNI5Ir4S0z
 4U5g==
X-Gm-Message-State: AC+VfDw9ALpLiib7BjfmjH6QQzkz6ERQAi4fi6kTIc6uu4TjdyETjBaY
 cH11JjEg+qJcRbxDvwjujTkovQ==
X-Google-Smtp-Source: ACHHUZ5Bvvam4bUJ8MKi747WCRxlnyuUFM84qlBLhz6yqhAjz3rge5MoCzrhn9yKp6Pwag/AeM0IBg==
X-Received: by 2002:a2e:9355:0:b0:2a7:6e37:ee68 with SMTP id
 m21-20020a2e9355000000b002a76e37ee68mr196002ljh.12.1683588438391; 
 Mon, 08 May 2023 16:27:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a2e7e04000000b002a8e758f669sm1322546ljc.27.2023.05.08.16.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 16:27:17 -0700 (PDT)
Message-ID: <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
Date: Tue, 9 May 2023 02:27:17 +0300
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
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
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

On 08/05/2023 23:09, Abhinav Kumar wrote:
> 
> 
> On 5/3/2023 1:26 AM, Dmitry Baryshkov wrote:
>> On 03/05/2023 04:19, Jessica Zhang wrote:
>>> Currently, word count is calculated using slice_count. This is incorrect
>>> as downstream uses slice per packet, which is different from
>>> slice_count.
>>>
>>> Slice count represents the number of soft slices per interface, and its
>>> value will not always match that of slice per packet. For example, it is
>>> possible to have cases where there are multiple soft slices per 
>>> interface
>>> but the panel specifies only one slice per packet.
>>>
>>> Thus, use the default value of one slice per packet and remove 
>>> slice_count
>>> from the word count calculation.
>>>
>>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to 
>>> compute word count")
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 35c69dbe5f6f..b0d448ffb078 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct msm_dsi_host 
>>> *msm_host, bool is_bonded_dsi)
>>>           if (!msm_host->dsc)
>>>               wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>>           else
>>> -            wc = msm_host->dsc->slice_chunk_size * 
>>> msm_host->dsc->slice_count + 1;
>>> +            /*
>>> +             * When DSC is enabled, WC = slice_chunk_size * 
>>> slice_per_packet + 1.
>>> +             * Currently, the driver only supports default value of 
>>> slice_per_packet = 1
>>> +             *
>>> +             * TODO: Expand drm_panel struct to hold 
>>> slice_per_packet info
>>> +             *       and adjust DSC math to account for 
>>> slice_per_packet.
>>
>> slice_per_packet is not a part of the standard DSC, so I'm not sure 
>> how that can be implemented. And definitely we should not care about 
>> the drm_panel here. It should be either a part of drm_dsc_config, or 
>> mipi_dsi_device.
>>
> 
> This is not correct.
> 
> It is part of the DSI standard (not DSC standard). Please refer to 
> Figure 40 "One Line Containing One Packet with Data from One or More 
> Compressed Slices" and Figure 41 "One Line Containing More than One 
> Compressed Pixel Stream Packet".

I have reviewed section 8.8.24 and Annex D of the DSI standard.

It is not clear to me, if we can get away with always using 
slice_per_packet = 1. What is the DSI sink's difference between Fig. 
40.(b) and Fig 41?

Are there are known panels that require slice_per_packet != 1? If so, we 
will have to implement support for such configurations.

> This has details about this. So I still stand by my point that this 
> should be in the drm_panel.

Note, the driver doesn't use drm_panel directly. So slices_per_packet 
should go to mipi_dsi_device instead (which in turn can be filled from 
e.g. drm_panel or from any other source).

> 
>>> +             */
>>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>>
>>

-- 
With best wishes
Dmitry

