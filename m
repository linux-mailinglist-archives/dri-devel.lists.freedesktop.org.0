Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7243948AD
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 00:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA846E442;
	Fri, 28 May 2021 22:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC2A6E442
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 22:30:00 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id w7so7116434lji.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hUkZ7gxrrggMcSwtimLivRd00/zcYtdWINyTkTf1Yn0=;
 b=WbYfgllPpb7xpL0JvhDJ0S3gf34DHM1z6KtNsKWLhvjm0ZrI5pYGdFogwYLwrMFiu6
 IU4Fh+7zf+H9gmUvTEh6SUUsQoQA7QrvnATnwjHRpHM3xdunSInRhtCHF/LQEtKusgxH
 c0R/CH1ThXouZkf+4OvcBUo2SH1K7MCUNNpiydsqoMJBNPMOkU3kF6j614gTlnYAS0xb
 hvn1JVFB0Q/82b4H7FEyMi7M1PbQOVE23kqyOIJryAv3OZNvviA+89nlpjpEncC8xid+
 Wczrj2RLmXCQV+9dDyNioa011/+zmON5j02dgQoptR4fVJcWjc2VZESntK1q5StS+eqa
 MTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hUkZ7gxrrggMcSwtimLivRd00/zcYtdWINyTkTf1Yn0=;
 b=cATIkXESV6X+PsaQb0VYI69QMoo9puZWZ1/bS9pm80uOWDbfV/gmJ+RFrYKGGDhJqf
 A/dRRpvxCuLXVHnt63lKnJ6PBBiYypijHPBMqxxUrNQiAtIOP/F7PEzsNcEt6044pXrh
 03QpMYFrviGzcs53V3Kwgusbuj/72Yc5X1d9bZMniMNt2zTFB9SX3mZ+z1HPMdf0stMk
 aCHPgk+y0qX+6d3yKy/Xjmq9h1q9g7hMHlOmfj9Q1xTHiaQaAigvuPkO3RCDICKjCb8F
 iwQykkk7cYL5qGH22j/0mU+sziijO7GT4WJgTDymCXoMK0ju+BX6cIgNNxNklJ+3SZNy
 FSTA==
X-Gm-Message-State: AOAM532Rr2s8tZjQYqYUsWpx+CbLC699uATaC0xC7e2WvVqbPmJeDUIL
 9R0u6thhdwtcwdjfyQPBmG6Wgw==
X-Google-Smtp-Source: ABdhPJxYDy/1GEifpniZzO2atvjxU0F4Rer+fv1ZPsAFE/uscYxRE3toeCkCR4d4eD+IyuGSiymVgg==
X-Received: by 2002:a2e:a7c7:: with SMTP id x7mr8118747ljp.46.1622240998840;
 Fri, 28 May 2021 15:29:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c26sm573001lfv.63.2021.05.28.15.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 15:29:58 -0700 (PDT)
Subject: Re: [RFC PATCH 11/13] drm/msm/disp/dpu1: Add support for DSC in
 topology
To: abhinavk@codeaurora.org
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-16-vkoul@kernel.org>
 <06ffdec5-8b12-c077-0c51-6ea9100b96a4@linaro.org>
 <57a4c00413dcaba38cebf3aa145b4d64@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <30f44396-29f6-ad37-9457-1b15f2f934c3@linaro.org>
Date: Sat, 29 May 2021 01:29:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <57a4c00413dcaba38cebf3aa145b4d64@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/05/2021 01:23, abhinavk@codeaurora.org wrote:
> On 2021-05-28 03:39, Dmitry Baryshkov wrote:
>> On 21/05/2021 15:49, Vinod Koul wrote:
>>> For DSC to work we typically need a 2,2,1 configuration. This should
>>> suffice for resolutions upto 4k. For more resolutions like 8k this won't
>>> work.
>>>
>>> Furthermore, we can use 1 DSC encoder in lesser resulutions, but that is
>>> not power efficient according to Abhinav, so it is recommended to always
>>> use 2 encoders.
>>
>> Not power efficient because the second DSC would also be powered on or
>> because single DSC enc would consume more power than two DSCs?
> 
> I havent got through the series yet but just thought of answering this,
> 
> So before coming to the power aspects of this, hard-coding was done for 
> the foll reasons:
> 
> -> We do not have a topology DTSI property in upstream and will probably 
> not have as well till
> other features are added which support all the topologies
> -> The DSC panel which is being upstreamed as part of this series is 
> working with this 2,2,1 topology
> downstream ( dual lm, dual DSC encoders, single DSI ). Other topologies 
> have not been tried on it yet
> -> There needs to be a better approach to handle all topologies once we 
> have added support for them.
> It can be either a DTSI property if others agree OR some helper API 
> which will determine the best topology
> based on various factors. Till then, since this will be the only DSC 
> panel we are adding support for
> I thought we can start with a fixed topology for now.
> 
> Coming to the power aspect, I only recommended 2-2-1 here because using 
> two mixers is better power wise
> as it will split the width/2. We can also do 2-1-1 by enabling 3D mux 
> but this panel has not been validated
> with a single DSC. So to keep things simple with what has been 
> validated, I thought we can go ahead with
> 2-2-1 for now.
> 
> So rather than giving too much importance to the power aspect of it, the 
> other reasons should also
> be highlighted here as the main reason and the commit text should give 
> these details as well.

Sounds reasonable now, thank you!


> 
>>>
>>> So for now we blindly create 2,2,1 topology when DSC is enabled
>>>
>>> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
>>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 18cb1274a8bb..bffb40085c67 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -609,8 +609,22 @@ static struct msm_display_topology 
>>> dpu_encoder_get_topology(
>>>       topology.num_enc = 0;
>>>       topology.num_intf = intf_count;
>>>   +    drm_enc = &dpu_enc->base;
>>> +    priv = drm_enc->dev->dev_private;
>>> +    if (priv && priv->dsc) {
>>> +        /* In case of Display Stream Compression DSC, we would use
>>> +         * 2 encoders, 2 line mixers and 1 interface
>>> +         * this is power optimal and can drive upto (including) 4k
>>> +         * screens
>>> +         */
>>> +        topology.num_enc = 2;
>>> +        topology.num_intf = 1;
>>> +        topology.num_lm = 2;
>>> +    }
>>> +
>>>       return topology;
>>>   }
>>> +
>>>   static int dpu_encoder_virt_atomic_check(
>>>           struct drm_encoder *drm_enc,
>>>           struct drm_crtc_state *crtc_state,
>>>


-- 
With best wishes
Dmitry
