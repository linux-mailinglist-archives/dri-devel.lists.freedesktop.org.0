Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A971E6E968E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5C510E975;
	Thu, 20 Apr 2023 14:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AA510E0A7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 14:03:36 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h4so2959099ljb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681999414; x=1684591414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NVkfX9ez3svxYnnM8rJPmrSpJjSKXj7Id4d2FlN3kdo=;
 b=KqeZisWyrlpuDhOBtUm7MpDZRVm7fv6Ei87iod2bozueBqbASVy7qkz9awjAAVSP5G
 YDnnpUgTd7mwlkUWt7aH1UYTPsy4Hk8bptdN7qqtXz6sN3sMqtqR15StRbdvsf3ixTaV
 UNqN/1J3WmYyn+lJaeiZ0nOOWHRh5RGrGYeWFVOfI1N3FdHEKDIw9aqK0IWbwlkKi6bp
 NMhO2QeiJZZhKRZ6AKbth5AIz/xO1JoKcWWV019YJcp2fd0K+lSkvREX95yT15aACGRu
 snhW/lsMW4uu65AaijRCk8SCWAtcefRydH8VPjx78sD9fwFVNGpfgaKmmFjlmpSmcSTI
 l+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999414; x=1684591414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NVkfX9ez3svxYnnM8rJPmrSpJjSKXj7Id4d2FlN3kdo=;
 b=CgSZMVTcT9H7w8VmMbaUBLeVRG2fcxuypxye0aB6taYDrOoiH9NJ3rTECrRDG8vxCH
 qh9PPEvZcl12vSOoFgFSfMwoYNOQgkuL5t886i9OR2Uq6n/Aw2JWKcmxMO1pxmvSPPii
 NbbJNq1DToEhlA1bQ6b1sz6vYhljeSOyHbFyITDlO7o8PYo3BMVujMAHvvxQoY6vPj3d
 tKYePq7TBBaGj4KOpNLUSqAiWuaD3lfnsIp0zCXa6lxkrMduGthJlPy4Bkr+oWZH+kVK
 lHwOgShixLDskQBocb0flWN8o4E+yI7+sBfUabtjircAvQmuV/yyCExRtQP3AjTky7/3
 hyEg==
X-Gm-Message-State: AAQBX9cRxPdLIpIHuMZFO8YzgzZJB/GSK1b1yqwiLLaNr/19tELvXtIY
 kliXAxasoRgj0+1O5AXSPvJbwQ==
X-Google-Smtp-Source: AKy350aSqD3HOes9oTjJ/n7YRoirlTchXOp15cOD09I43xK+WajJIRohATh87yc9DNwJ8QMiWGguPA==
X-Received: by 2002:a05:651c:1504:b0:2a8:bb0a:2214 with SMTP id
 e4-20020a05651c150400b002a8bb0a2214mr2441992ljf.12.1681999414124; 
 Thu, 20 Apr 2023 07:03:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a2e86d5000000b002a77792f2c5sm244736ljj.62.2023.04.20.07.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:03:33 -0700 (PDT)
Message-ID: <c2c0567a-8205-510d-bc0d-35b28dd64f70@linaro.org>
Date: Thu, 20 Apr 2023 17:03:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] drm/msm/dpu: always program DSC active bits
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1681490777-15351-1-git-send-email-quic_khsieh@quicinc.com>
 <zs762prrzv2geulwa7ztlolmxgldiyynk22m5ak4ejbyzbctrp@jprtanslko7c>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <zs762prrzv2geulwa7ztlolmxgldiyynk22m5ak4ejbyzbctrp@jprtanslko7c>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2023 02:02, Marijn Suijten wrote:
> On 2023-04-14 09:46:17, Kuogee Hsieh wrote:
>> In current code, the dsc active bits are set only if the cfg->dsc is set.
> 
> This is the old sentence from v1 again, did you accidentally send the
> wrong patch as the improvements from v2 are missing?
> 
>> However, for displays which are hot-pluggable, there can be a use-case
>> of disconnecting a DSC supported sink and connecting a non-DSC sink.
>>
>> For those cases we need to clear DSC active bits during teardown.
> 
> At least teardown is one word again, v2 had "tear down" which is wrong.
> 
>> As discuss at [1], clear DSC active bit will handled at reset_intf_cfg()
> 
> discussed* as pointed out by Dmitry, and make it clear that this is
> about clearing CTL_DSC_ACTIVE (and CTL_DSC_FLUSH?) specifically.  Once
> that is moved to reset_intf_cfg(), this patch should be reverted as
> there is no need to write the registers once again when cfg->dsc equals
> 0.

Kuogee, can we please get a proper v4? With all the relevant changes 
from v2, with the changelog, etc.

Otherwise the present Reviewed-by tags are just incorrect.

> 
> - Marijn
> 
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> [1] https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index bbdc95c..88e4efe 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -541,10 +541,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>   	if (cfg->merge_3d)
>>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>   			      BIT(cfg->merge_3d - MERGE_3D_0));
>> -	if (cfg->dsc) {
>> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>> -		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>> -	}
>> +
>> +	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>> +	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>   }
>>   
>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

-- 
With best wishes
Dmitry

