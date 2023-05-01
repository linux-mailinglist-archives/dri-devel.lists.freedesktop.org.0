Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038A6F3A59
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 00:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406FE10E329;
	Mon,  1 May 2023 22:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB4F10E204
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 22:15:27 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f001a2f3aeso3784598e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682979325; x=1685571325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=slq0YEppksLWhrsWzVR9m1vsjnizuudxs8AB95I6DXQ=;
 b=kT3axRIS+cRXqtcOeCAVKrM3fG+oD+Yp45FkZRwYLMuCF6cEA+LKHK4jqvI8LWXJCT
 TVSCcJIciqFqoKiHObVbtUWcvTQT3kRrvdQ6REmL0oFLDfiGIxm0Ge4H9XBC61PkiOTV
 HN8ykRA51YIl3ekk0c9FaIHN2DXpvug3hTvkAt0Cz1fegzCgqUL8qQJFFIdOxprl4h2L
 w7dIagXgHnN+19pRXatjcvSfx7EgCUQsZAXqavRZiG89F3w7yDvmFGXNC9/a+oRSPo64
 WsvCkWLZ9wEggZJan8lGSGGa04dxU9+vmT7aKzdo7QoSiRV5RlPMGF62+tPqsd4TfKKD
 DOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682979325; x=1685571325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=slq0YEppksLWhrsWzVR9m1vsjnizuudxs8AB95I6DXQ=;
 b=YEGxazbxzF7Uca6pHnmlyqS6k+ACBUEdkV9gfF3of71vSq/zb0aPMR/HWyhpOVVBfZ
 Ot7gxQicioTqks2E11T6ve+p6ZGgaf6qXtgRA58LbEoEc1azTAHVCBH+ZS2nacWNymSc
 womrOSHO/vMse+1nwqS6u23a5U4fdNEa+QqgeqfpHtBWwacOvwoKwhh2YF8LlT3f+Nhb
 fTMWn3hUxSYedtEKy7msloMmn/7vuWFAo/M4iz9nUOGiJr8IOcskU3J5YMuSrLyL1/bf
 e5IBKPgwZSkUBZ8nfWKtmF3E7yD8CoY7pJloEH9ZlfqgJXsBNqP8AItBQ8m7avEqdrzx
 hUgA==
X-Gm-Message-State: AC+VfDzOAI4vC25eu9+5oYxw5mwfH5njZzgkgNtr1MVCuILUlNqSZk/N
 BidaHKMpxB+4oMSGL506w16h7g==
X-Google-Smtp-Source: ACHHUZ4kjnO69INNr4tyQiv5vlMXps6cQ/UHc6z/I7juK8F2C59AQUjM05N0dqDD1Uu3GfoalB4NNg==
X-Received: by 2002:ac2:41d7:0:b0:4dd:af74:fe1a with SMTP id
 d23-20020ac241d7000000b004ddaf74fe1amr3931052lfi.48.1682979325217; 
 Mon, 01 May 2023 15:15:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512014600b004efd3c2b746sm4533704lfo.162.2023.05.01.15.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 15:15:24 -0700 (PDT)
Message-ID: <26774a3d-5a4a-727c-0a63-2550eeea4c71@linaro.org>
Date: Tue, 2 May 2023 01:15:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] drm/msm/dpu: remove futile checks from dpu_rm_init()
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-3-dmitry.baryshkov@linaro.org>
 <vciwnimlyzezirun3pnyqtyro3x7n5gb46egisyzbouejjas7b@ssbgx2oabw7o>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <vciwnimlyzezirun3pnyqtyro3x7n5gb46egisyzbouejjas7b@ssbgx2oabw7o>
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

On 02/05/2023 01:13, Marijn Suijten wrote:
> On 2023-04-30 23:35:54, Dmitry Baryshkov wrote:
>> dpu_rm_init() contains checks for block->id values. These were logical
>> in the vendor driver, when one can not be sure which values were passed
>> from DT. In the upstream driver this is not necessary: the catalog is a
>> part of the driver, we control specified IDs.
>>
>> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I was going to send this on top of [1] to prevent conflicts, but it
> seems you beat me to it and also based it on top of that series, though
> without mentioning the dependency in the cover letter.

I hoped that you'd include such a change into the mentioned series. But 
after waiting for some time I went and sent this out, as I was not sure 
about your intentions and time budget.

> 
> [1]: https://lore.kernel.org/linux-arm-msm/20230418-dpu-drop-useless-for-lookup-v3-3-e8d869eea455@somainline.org/
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 34 --------------------------
>>   1 file changed, 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index dffd3dd0a877..d5a06628885e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -122,10 +122,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   			continue;
>>   		}
>>   
>> -		if (lm->id < LM_0 || lm->id >= LM_MAX) {
>> -			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
>> -			continue;
>> -		}
>>   		hw = dpu_hw_lm_init(lm, mmio);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> @@ -139,10 +135,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_merge_3d *hw;
>>   		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
>>   
>> -		if (merge_3d->id < MERGE_3D_0 || merge_3d->id >= MERGE_3D_MAX) {
>> -			DPU_ERROR("skip merge_3d %d with invalid id\n", merge_3d->id);
>> -			continue;
>> -		}
>>   		hw = dpu_hw_merge_3d_init(merge_3d, mmio);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> @@ -157,10 +149,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_pingpong *hw;
>>   		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
>>   
>> -		if (pp->id < PINGPONG_0 || pp->id >= PINGPONG_MAX) {
>> -			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
>> -			continue;
>> -		}
>>   		hw = dpu_hw_pingpong_init(pp, mmio);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> @@ -177,10 +165,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_intf *hw;
>>   		const struct dpu_intf_cfg *intf = &cat->intf[i];
>>   
>> -		if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
>> -			DPU_ERROR("skip intf %d with invalid id\n", intf->id);
>> -			continue;
>> -		}
>>   		hw = dpu_hw_intf_init(intf, mmio);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> @@ -194,11 +178,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_wb *hw;
>>   		const struct dpu_wb_cfg *wb = &cat->wb[i];
>>   
>> -		if (wb->id < WB_0 || wb->id >= WB_MAX) {
>> -			DPU_ERROR("skip intf %d with invalid id\n", wb->id);
>> -			continue;
>> -		}
>> -
>>   		hw = dpu_hw_wb_init(wb, mmio);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> @@ -212,10 +191,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_ctl *hw;
>>   		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
>>   
>> -		if (ctl->id < CTL_0 || ctl->id >= CTL_MAX) {
>> -			DPU_ERROR("skip ctl %d with invalid id\n", ctl->id);
>> -			continue;
>> -		}
>>   		hw = dpu_hw_ctl_init(ctl, mmio, cat->mixer_count, cat->mixer);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> @@ -229,10 +204,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_dspp *hw;
>>   		const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
>>   
>> -		if (dspp->id < DSPP_0 || dspp->id >= DSPP_MAX) {
>> -			DPU_ERROR("skip dspp %d with invalid id\n", dspp->id);
>> -			continue;
>> -		}
>>   		hw = dpu_hw_dspp_init(dspp, mmio);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> @@ -259,11 +230,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_sspp *hw;
>>   		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
>>   
>> -		if (sspp->id < SSPP_NONE || sspp->id >= SSPP_MAX) {
>> -			DPU_ERROR("skip intf %d with invalid id\n", sspp->id);
>> -			continue;
>> -		}
>> -
>>   		hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

