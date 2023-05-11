Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9EB6FEAEE
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 06:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8220E10E59A;
	Thu, 11 May 2023 04:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE25B10E599
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 04:49:32 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ac836f4447so81971091fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 21:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683780570; x=1686372570;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bZ9AhqKlVvzatdS2kcgWF/IaWlcFPC4v3tJjLb2boYI=;
 b=nEvNWB8B7X/36cLkVIoBoXpfEo6kJh0NVVtYCUiVQJqbE6RuoQWAf3wDgAeRpWx9Up
 jVobxFlnDGZo8Ij3mkI8DnURZ4kxmrpSXjBQSGgQeh8E+ABR9f3qbXfz/2HZik3SsH1Z
 fXG1JEmu12fuetkE+NYKl/PFcceUOCavhaMsTZgU3sbjNMqYkd3C/BwsclNfltsY+SA9
 7Q7bjn9pNvnJbdq2Z09nAeusTAc8upZfw6XNy5NuDfYA3IMPtCQ6G2JWOJm8chP7ssZU
 ePGp1PHzYEfuSUExePcRulnRrGOoepVfQDs0O0wk++boEYDch/QKr68+2Ibmz2bmmW1w
 KJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683780570; x=1686372570;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bZ9AhqKlVvzatdS2kcgWF/IaWlcFPC4v3tJjLb2boYI=;
 b=irtw+hvEVlXy0DxrZG+Z83RyPmzGR5XcZBJT7Q48nAUo9eqW7K38SxZIt023kPBhjs
 wcGVzzP2vku5gaIxPPHAIVj3SQOSZlwQ/v3B3lSTyqVkRolCCA8H/tkB0MVFg66oXVQd
 dCtGrIwe0AQspvd2jzFaNqkBP1RrcEVUEyGrzaUpqOKKze4dtK31BhH35A6342EA5/m0
 oNikAM+jIFnH3n/hKlsxv3r6kcqzZqEVgGr7Hw+yS9PQR4alzTR0dE1apsZxxmuT8zHa
 U7awXP2LSg99KqEGnSraIAfE8tam5+0sWcqNqb0J7D7TF54hJB8x8TnLByWsWq3YkSTI
 Mlrw==
X-Gm-Message-State: AC+VfDwNE8BISK58Ts54/TdSUNVhIaBFi1B/r57ZQbo8C41C5OgNEh4s
 4T+zdFLiXIuB2G3LDNtRRN9uxA==
X-Google-Smtp-Source: ACHHUZ5qVfCYkX9lmLG1FWFiEjchXdtKT1t8ljth+JrKg+JUwNKJoOcWuAcaLO7MYxRP5c1C/Z7tdA==
X-Received: by 2002:a2e:b0cc:0:b0:2ac:8486:e318 with SMTP id
 g12-20020a2eb0cc000000b002ac8486e318mr2898519ljl.35.1683780570666; 
 Wed, 10 May 2023 21:49:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a197404000000b004f01ae1e63esm961363lfe.272.2023.05.10.21.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 21:49:30 -0700 (PDT)
Message-ID: <575d9fb6-15c4-1faf-8457-c5ae3f99895c@linaro.org>
Date: Thu, 11 May 2023 07:49:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 2/8] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for
 DPU < 7.0.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-3-git-send-email-quic_khsieh@quicinc.com>
 <b4438422-f24b-7fc1-18cf-3cebdd777530@linaro.org>
 <1a6109ae-7c83-c04e-60c9-dfca6b83d662@quicinc.com>
 <a6146d03-18d1-b1c6-cdbb-d3527cb9021a@linaro.org>
 <ff0a7628-b9e2-d5f5-cb1e-678ea25ec1cb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ff0a7628-b9e2-d5f5-cb1e-678ea25ec1cb@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2023 07:42, Abhinav Kumar wrote:
> 
> 
> On 5/10/2023 9:39 PM, Dmitry Baryshkov wrote:
>> On 11/05/2023 07:38, Abhinav Kumar wrote:
>>>
>>>
>>> On 5/10/2023 9:29 PM, Dmitry Baryshkov wrote:
>>>> On 11/05/2023 01:07, Kuogee Hsieh wrote:
>>>>> DPU < 7.0.0 requires the PINGPONG block to be involved during
>>>>> DSC setting up. Since DPU >= 7.0.0, enabling and starting the DSC
>>>>> encoder engine moved to INTF with the help of the flush mechanism.
>>>>
>>>> Nit: was moved.
>>>>
>>>>> Add a DPU_PINGPONG_DSC feature bit to restrict the availability of
>>>>> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() on the
>>>>> PINGPONG block to DPU < 7.0.0 hardware, as the registers are not
>>>>> available [in the PINGPONG block] on DPU 7.0.0 and higher anymore.
>>>>
>>>> this looks good
>>>>
>>>>> Existing call-sites to these callbacks already skip calling into
>>>>> them if the function pointer is NULL.
>>>>
>>>> This is more relevant for patch 3 commit message.
>>>>
>>>>> Add DPU_PINGPONG_DSC feature
>>>>> bit to all chipset with DPU < 7.0.0.
>>>>
>>>> This is incorrect, as we do not change the catalog in this patch.
>>>>
>>>
>>> Sorry but why not? The changes done to dpu_hw_catalog.c do exactly that.
>>
>> Because the patch does not add this feature bit to any of the 
>> chipsets. I think the relevant patch was lost somewhere during the 
>> rework/rebase.
>>
>>
>>
> 
> This is adding it right?
> 
>    #define PINGPONG_SDM845_MASK \
> -    (BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE))
> +    (BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | 
> BIT(DPU_PINGPONG_DSC))
>    #define PINGPONG_SDM845_TE2_MASK \


Ah, I see now. I was expecting changes to the actual catlog files. 
Please excuse me.

As we are using PINGPONG_SDM845_MASK only up to and including DPU 6.x, 
this is correct.

I'd then suggest rephrasing this sentence to be more explicit:

Add DPU_PINGPONG_DSC to PINGPONG_SDM845_MASK, which is used for all DPU 
< 7.0 chipsets.

-- 
With best wishes
Dmitry

