Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9206D10E4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B0E10F03F;
	Thu, 30 Mar 2023 21:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F7910F03D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:32:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bi9so26280692lfb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680211949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aTqJwL7oBiO+i/ddIgWkEiFhacs+3OCWtKXm1Tp67Cs=;
 b=OVuKVEb7pgKQF3vr0EZSfol5Mig2ns7Yk/XprlTV1hA7JdOoQY9G+bTWfz06E6sbp3
 1Tlz81N4K6++tgWAQo1Ca1WD1NRidQBpa01VzgKDXWxjjF0UKLI1WZ8mV1RBaG5ybUSQ
 SgmZGPPbIcz5acSGalsZEsWxzVUbo/h7wkZCh+RC+LruyquKXLnhgNuPstIwU9wlhZzb
 g6ZNjqO+xKWjuPZmqIQ2/GJS4o0CjyW49TWoL9XDvrv/YIeZvWed0sM2IRjeDqErplSX
 eQo+8GaQXobpVk7AWl2UK6CjOIKnbEYp6w5STq2Vk6Av/Dfq5Z0bkHKthJgAjxyu7TaB
 a5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680211949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aTqJwL7oBiO+i/ddIgWkEiFhacs+3OCWtKXm1Tp67Cs=;
 b=wlsLEYpDpnhyhb9aSAPk99biYCCFEH0IPEEurtOn1/Xe7GhVhIXa4+nJMaTVBsBx+L
 qjRPtgfMFGdf6UiiOIDoe6AitAAzmBwRYegwanHhTP14gH2x++na4ZAYa/L5rrcxEmiw
 wWJL5Gjml3+rrupjSz97CT4cf5zc5U2uB30ZWwLkocREViqv7l7F7jnVXOjxA1HRVm4o
 xnFux3MBxemVPtn/tXSSLx/XFZtGx4YbDvTuWygABsjZ4p+l4DVxplXyH1KL6+s/BjEy
 0/6ctfdpl2sRfY/28t1gAHc3NxmTDvVafNpTEmWeyyvyZIVNIH9TSXKIy5VcsC64jMtK
 7fPg==
X-Gm-Message-State: AAQBX9ejoZtECf6Ef7k3XRJM0V/0Y1PgolhpayiaJ/UsEUD0WdSlj6rr
 qlBDvOrTEhwJb2ZDjj0w2d0R3g==
X-Google-Smtp-Source: AKy350ZGflQvaIlYJPAclGpHbzprCG3zHk+Wm/YCGsHyvM4odrKaN0sSrPL+HGoNMk0vnKUo3BdjQA==
X-Received: by 2002:a19:2d1c:0:b0:4d8:86c1:4785 with SMTP id
 k28-20020a192d1c000000b004d886c14785mr2188004lfj.26.1680211949367; 
 Thu, 30 Mar 2023 14:32:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r25-20020ac25a59000000b004cb45148027sm94871lfn.203.2023.03.30.14.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 14:32:29 -0700 (PDT)
Message-ID: <63fd5b75-e4a4-0d15-db9e-461a8f4a1cd9@linaro.org>
Date: Fri, 31 Mar 2023 00:32:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2, 37/50] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-38-dmitry.baryshkov@linaro.org>
 <6ca39767-09c7-3323-bde3-52824d81ca41@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6ca39767-09c7-3323-bde3-52824d81ca41@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 15:29, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Theoretically since sm8150 we should be using a single CTL for the
>> source split case, but since we do not support it for now, fallback to
>> DPU_CTL_SPLIT_DISPLAY.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Hmm.. so is it a software construct? E.g. "pass half of the data to
> each of the INTFs and tell them to cooperate"?

It is not a fully software construct, if I understand correctly. You 
have to program either a single CTL or two CTLs for a flush.

> 
> Apart from that, since it's temporary, I think it deserves a comment
> reminding us to fix it eventually™

Sure, this is, I think, a next item on my plate after getting all of 
wide planes and catalog in: to rework CTL support for sm8150+.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index a3a79d908451..094876b1019b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -47,13 +47,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>>   	{
>>   	.name = "ctl_0", .id = CTL_0,
>>   	.base = 0x15000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>   	},
>>   	{
>>   	.name = "ctl_1", .id = CTL_1,
>>   	.base = 0x16000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>   	},
>>   	{

-- 
With best wishes
Dmitry

