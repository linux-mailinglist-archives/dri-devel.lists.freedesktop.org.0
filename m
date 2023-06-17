Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04D733D3F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 02:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504CB10E06E;
	Sat, 17 Jun 2023 00:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144D710E06E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 00:39:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f61b45ee0dso1885613e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 17:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686962379; x=1689554379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VC2x4FJWSiZrLeCPn46ZG1+j93fJD7lUVKQDEFrK0FA=;
 b=CBIBfEyqNRpOh8YrirE2e7k4+/aIWs/4d6wDAcQtVY19CbM8oworR0RVksJuIQtqzN
 EZ7yeci1b/eTQPWh2FqXrBR8kBv4mtSj1AxXF/TiSd2EEp0ax7uZawwIL7sX+jqEE4PW
 quCEQajT2NT9ijtIOfKjPauWHExP38VcdP72CYk/5aJ2BfmcqdNLl4O5FjBqFfP2jl7d
 mII0PVC3Y4azN6yk3LGlmDRLRFrU21A9Zk186KqOQ3pqEzCui+NbuZBnZdObOEMP6mBs
 4pl7gd8USmwQ4p84hf+ZGyH6e15sNFT+KyrJ91xKR2Az97zV+w16ajcDZj8Io4kCz5Z0
 q/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686962379; x=1689554379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VC2x4FJWSiZrLeCPn46ZG1+j93fJD7lUVKQDEFrK0FA=;
 b=Qwtl6qkTd4VHzghxnyY2Vks15VHHtrL8TXUbw+BidGLhkywtrPnIojD3eX7DyoZwqM
 zYKqsbylLozgCOQPDDeNTxF3/OeIEb/NAQWS3MSyyJ6kV/AOGJC23ZgBIO6zccnlQPbg
 yCE+MxkCUA/Rq+Gzc/xJyblWp7gS0Cwl9bNa5FTFQfxqRLveg4J+/Nh3E+0ZqYzNySQ0
 JZYWYdInQ20DP2qwz/NMFJpnmpNgicsQA3Q2Eov4oSbPtlrA6hy00HRvpK8R+1MHGp1H
 5c39X/dKEEuS1xLdizTiZdZ8mtcKTQPMacVoJb/QG8+tDstfMOkKF4fbjUt94d7fHUZB
 7+fg==
X-Gm-Message-State: AC+VfDzup+gsKvKdGTrXZoF8N160o+uEf55i6XYxb8/XG6JZXFojeoyK
 Cr/vaSMCNY6zIwKJJvzAOOmgBA==
X-Google-Smtp-Source: ACHHUZ7Rqa/PqaXfrw0QXF7elEEIGNbjqMM5XZ4t0rgfP0fN+WchgFBHQwaELP42bBuRNIzAuYiVgA==
X-Received: by 2002:a19:e301:0:b0:4f6:2b21:ece1 with SMTP id
 a1-20020a19e301000000b004f62b21ece1mr2279923lfh.43.1686962379181; 
 Fri, 16 Jun 2023 17:39:39 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m16-20020ac24250000000b004f4cabba7ebsm3212342lfl.199.2023.06.16.17.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 17:39:38 -0700 (PDT)
Message-ID: <eb73ceac-4a9d-8bc0-226d-3359e547d5a0@linaro.org>
Date: Sat, 17 Jun 2023 03:39:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 02/19] drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-3-dmitry.baryshkov@linaro.org>
 <b6junzecn74xvb5gk3tg7d442now2jw336czqcxn2uuup6cowu@w6ghvte6ivo3>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b6junzecn74xvb5gk3tg7d442now2jw336czqcxn2uuup6cowu@w6ghvte6ivo3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/06/2023 01:03, Marijn Suijten wrote:
> On 2023-06-16 13:03:00, Dmitry Baryshkov wrote:
> <snip>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index 8da424eaee6a..8fa9d83a539d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -169,11 +169,11 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>>   	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>>   			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> 
> This doesn't apply cleanly on top of your interupt rework series: do you
> still intend to land that?

Yes, but most likely after this series. If everything goes well, I want 
to land this series, DSI DSC docs and last minute fixes to 6.5, 
everything else goes into 6.6 (as its review was not started).

> 
>> -	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>> +	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>>   			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> 
> <snip, same for the other catalogs>
> 
> - Marijn

-- 
With best wishes
Dmitry

