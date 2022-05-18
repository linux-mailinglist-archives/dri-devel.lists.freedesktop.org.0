Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F82E52C0FB
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 19:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BC5112430;
	Wed, 18 May 2022 17:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBFD11219C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 17:31:04 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id p4so3454316lfg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W0khqJIcojkvYp4i+6PmQHGcWlcA75m1iNcSn8ShT7U=;
 b=yTpK9RpaOCMTiTgGpMgZG8XdBWs1CywBpNqPNB29FH4LyQ4Q19n7ZDG+0p0yAbqn8r
 BLjY1LZQvtzo9mGDZ/nJIQGicjEwpVawGRAnTB+TCU8GKGz/8MXPtW9ZbELwHRbRomG7
 WOIH0dHRvGtarMRZNDeaXLjDXfk3TG+VyXheQA2lNSP+fNLwFM0vSsXRBEzz5AQdYH87
 z2enqN7WR88m4xNykkWTEbhRSfwlE/YaTbp0OJ+LcNCFY1f/9F6vNsPL3X+BCG+0DPgG
 Dr/m30YVoa5cq2h+I4NpsPojDin+LKAOeuLnNfeYfb4o/03GlxDTf0SXwTzkpDiVlFvZ
 yg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W0khqJIcojkvYp4i+6PmQHGcWlcA75m1iNcSn8ShT7U=;
 b=CeTZ7CdNmnbeHd32YKfF/G3EAEIt6dHb1iGc5UTk+PiHQ1u08hC2hPcREFnsyy23Xf
 EN11Q1Im9RIiptcB/ZPEyScomq1PuR01JxgYo1QcWD1K0X0bTC5BcE5iD/uplBrkgL+M
 kqDKSH7BLxkJzP/OSWitHnXseaAVy0FEOxyBbWjBj4Y3e4+24s05PPKNPogJ5+BiOGvr
 Dtnd4p0hpjJWGvB1es4nsdkwnX1TFRu/MMxavpxkeOZc0Ahr7+ES9jLXt1LuSSQGDGLW
 /9OcnnwfKqdKZOM76ztVlDKx6gB3DqKkmVH06fP8lqkYH/BFo53Q615cgfnfLI/Jeqag
 INKg==
X-Gm-Message-State: AOAM532Wh4ZdkG04ge7vKs0y5BJsupJUrv6qKIZuV2pRyY1RGntIKmbu
 +a8+Iv7+8qKIkFeFy+6Um/u5lypJ8vj9Ww==
X-Google-Smtp-Source: ABdhPJzfhQnOcGgqw+xluDL3RImpfpueTdknbybj82UpoiEHjdlbUY8XBYfPioSEHPNlaYbP/Hl7yg==
X-Received: by 2002:a05:6512:2622:b0:448:27b9:5299 with SMTP id
 bt34-20020a056512262200b0044827b95299mr399179lfb.86.1652895062363; 
 Wed, 18 May 2022 10:31:02 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a197007000000b0047255d211a1sm5568lfc.208.2022.05.18.10.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 10:31:01 -0700 (PDT)
Message-ID: <38e1f139-6814-db63-1f4b-5a76a1ab0eda@linaro.org>
Date: Wed, 18 May 2022 20:31:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 0/2] eDP/DP Phy vdda realted function
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqq4fxxgY0mj0JBans3GE-HAuad4Zsf7Ntwy1WW3bHbTQ@mail.gmail.com>
 <98295144-2e05-674b-4983-5f1738480c86@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <98295144-2e05-674b-4983-5f1738480c86@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/05/2022 20:29, Kuogee Hsieh wrote:
> 
> On 5/18/2022 10:16 AM, Dmitry Baryshkov wrote:
>> On Wed, 18 May 2022 at 19:43, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>> wrote:
>>> 1) add regulator_set_load() to eDP/DP phy
>>> 2) remove vdda related function out of eDP/DP controller
>> These patches touch two subsystems and have a dependency between them.
>> How do we merge them?
> 
> currently, both phy and controller are vote for regulator. The last vote 
> will just increase count.
> 
> Therefore the dependency should be very loose.

So, do you propose to merge dp change a cycle after the phy changes go in?

> 
> 
>>> Kuogee Hsieh (2):
>>>    phy/qcom: add regulator_set_load to edp/dp phy
>>>    drm/msm/dp: delete vdda regulator related functions from eDP/DP
>>>      controller
>>>
>>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------
>>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  6 ---
>>>   drivers/gpu/drm/msm/dp/dp_power.c   | 95 
>>> +------------------------------------
>>>   drivers/phy/qualcomm/phy-qcom-edp.c | 25 ++++++++--
>>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 13 +++++
>>>   5 files changed, 36 insertions(+), 117 deletions(-)
>>>
>>> -- 
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>> Forum,
>>> a Linux Foundation Collaborative Project
>>>
>>


-- 
With best wishes
Dmitry
