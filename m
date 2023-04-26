Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA56EEF0A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 09:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFC810E8DC;
	Wed, 26 Apr 2023 07:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B683210E8DC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:17:35 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-956eacbe651so1209237766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 00:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682493454; x=1685085454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+xmo/OgW+kFPZImvTPMJeINxL/eragLSlQhbr0bqSyc=;
 b=w40ywDA1jmA2RPBfxx2qh62xbPkI+yS54M/Uth3ZJF3GaNj3IeiRCYZgyj0ZAZT1/t
 EKwqCPoeY1/hwmSk4mjMg0KZMmmJ/hFnZ/RAJ9F9uV267Rgw9imue3yp5ugF4lwprpDS
 0oysqTPOCLDuqZFQYqsEXlWUX2pHpGLNSsWzxwEA93JhCVT2HywxYTeCC8uj2TrS7qEd
 7ZRzgWW1828BjedgmpB3HuuZYXEv+HATICD1BwIJ1C9WoWjhbGHQeDQd2Ln/Q/uPv+nu
 Tt40/ir82UHfhbqD/blyhPK2bifs1YugSoVlbToSKCdRVQsub6zSFC6p+nPkGY8ySnpm
 NWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682493454; x=1685085454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+xmo/OgW+kFPZImvTPMJeINxL/eragLSlQhbr0bqSyc=;
 b=CUbWPhARaiyAoO9YZct/kMShUIjjL5P+eq/s5NL3kfk6Mk/pyOP1beUYdlgCLMLEnl
 MIC0p7YpNh7zctUqq49l0vNeYx2a9RM9X0NT4EQSND9hFL29YVqw8BSOPIONCKUV1VOI
 KsPcZ4fRER74L3G96yGGfR0PcBS4+mJhxTgNz0ez0gjpauqlZ/5HA7uQbw1Fhig8Gfn2
 5OaSjJTvmJdHFWWuX96vxJ45BdGrEgTokM/fSlDFdc+bUgm1u7HA8Rgy7n0Cq0VL/epm
 tvVMmy4DohZRDPG5MdIHCLgA7e3EP/1wSezB3aTRopS1401n3AZWKOKQN5rb4NFP9SEV
 dg0g==
X-Gm-Message-State: AAQBX9e0SBAXeROQ3bKTzMWWyC3QhGZ1qxgzdUcSyqolOBnVhz71+BEe
 3oHYj8ouB2DumWOcWer7cUNzAA==
X-Google-Smtp-Source: AKy350ZE82lkAbpwjiHo4sTxPLEY+gu0xFJOLVYGfEEWZi+cgKJU3hTeBABfTz+c97ldpqcbMEgyMQ==
X-Received: by 2002:a17:906:c155:b0:94f:432f:242f with SMTP id
 dp21-20020a170906c15500b0094f432f242fmr19767454ejc.67.1682493453844; 
 Wed, 26 Apr 2023 00:17:33 -0700 (PDT)
Received: from [172.23.2.4] ([31.221.30.162]) by smtp.gmail.com with ESMTPSA id
 n6-20020a170906700600b0094f5a74ba83sm7759330ejj.39.2023.04.26.00.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 00:17:33 -0700 (PDT)
Message-ID: <79a8726f-534c-ea2d-f029-7c3e9256fc54@linaro.org>
Date: Wed, 26 Apr 2023 10:17:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 17/21] drm/msm/dpu: Describe TEAR interrupt registers
 for DSI interfaces
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-17-693b17fe6500@somainline.org>
 <692a094b-1cb7-d4e1-7e44-6f9fab075c2f@linaro.org>
 <6fnvr646if7s2wxx64yyhd7ddrxtvirn3tsltba4mgsjkseokq@a7i3d2w3q4pi>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6fnvr646if7s2wxx64yyhd7ddrxtvirn3tsltba4mgsjkseokq@a7i3d2w3q4pi>
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
Cc: dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Robert Foss <rfoss@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2023 10:16, Marijn Suijten wrote:
> On 2023-04-26 03:05:12, Dmitry Baryshkov wrote:
>> On 26/04/2023 02:06, Marijn Suijten wrote:
>>> All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
>>> the PINGPONG block and into the INTF block.  Wire up the IRQ register
>>> masks in the interrupt table for enabling, reading and clearing them.
>>>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 52 +++++++++++++++++------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  4 ++
>>>    2 files changed, 44 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> index e116993b2f8f7..5e2d68ebb113e 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> @@ -17,18 +17,26 @@
>>>     * Register offsets in MDSS register file for the interrupt registers
>>>     * w.r.t. the MDP base
>>>     */
>>> -#define MDP_INTF_OFF(intf)			(0x6A000 + 0x800 * (intf))
>>> -#define MDP_INTF_INTR_EN(intf)			(MDP_INTF_OFF(intf) + 0x1c0)
>>> -#define MDP_INTF_INTR_STATUS(intf)		(MDP_INTF_OFF(intf) + 0x1c4)
>>> -#define MDP_INTF_INTR_CLEAR(intf)		(MDP_INTF_OFF(intf) + 0x1c8)
>>> -#define MDP_AD4_OFF(ad4)			(0x7C000 + 0x1000 * (ad4))
>>> -#define MDP_AD4_INTR_EN_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x41c)
>>> -#define MDP_AD4_INTR_CLEAR_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x424)
>>> -#define MDP_AD4_INTR_STATUS_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x420)
>>> -#define MDP_INTF_REV_7xxx_OFF(intf)		(0x34000 + 0x1000 * (intf))
>>> -#define MDP_INTF_REV_7xxx_INTR_EN(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c0)
>>> -#define MDP_INTF_REV_7xxx_INTR_STATUS(intf)	(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c4)
>>> -#define MDP_INTF_REV_7xxx_INTR_CLEAR(intf)	(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c8)
>>> +#define MDP_INTF_OFF(intf)				(0x6A000 + 0x800 * (intf))
>>> +#define MDP_INTF_INTR_EN(intf)				(MDP_INTF_OFF(intf) + 0x1c0)
>>> +#define MDP_INTF_INTR_STATUS(intf)			(MDP_INTF_OFF(intf) + 0x1c4)
>>> +#define MDP_INTF_INTR_CLEAR(intf)			(MDP_INTF_OFF(intf) + 0x1c8)
>>> +#define MDP_INTF_TEAR_OFF(intf)				(0x6D700 + 0x100 * (intf))
>>> +#define MDP_INTF_INTR_TEAR_EN(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x000)
>>> +#define MDP_INTF_INTR_TEAR_STATUS(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x004)
>>> +#define MDP_INTF_INTR_TEAR_CLEAR(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x008)
>>> +#define MDP_AD4_OFF(ad4)				(0x7C000 + 0x1000 * (ad4))
>>> +#define MDP_AD4_INTR_EN_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x41c)
>>> +#define MDP_AD4_INTR_CLEAR_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x424)
>>> +#define MDP_AD4_INTR_STATUS_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x420)
>>
>>
>> Please don't reindent lines together with doing the actual changes.
>> Please set the correct alignment in the patch 10
> 
> The alignment here is extended to accomodate for
> MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf), or do you want me to reserve
> the right indentation from the get-go in patch 10?  That'd certainly
> make it more clear which lines are added here, and patch 10 already
> adjusts the alignment anyway.

Yes, please.

> 
> - Marijn
> 
>>> +#define MDP_INTF_REV_7xxx_OFF(intf)			(0x34000 + 0x1000 * (intf))
>>> +#define MDP_INTF_REV_7xxx_INTR_EN(intf)			(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c0)
>>> +#define MDP_INTF_REV_7xxx_INTR_STATUS(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c4)
>>> +#define MDP_INTF_REV_7xxx_INTR_CLEAR(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c8)
>>> +#define MDP_INTF_REV_7xxx_TEAR_OFF(intf)		(0x34800 + 0x1000 * (intf))
>>> +#define MDP_INTF_REV_7xxx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x000)
>>> +#define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
>>> +#define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
>>>    
>>>    /**
>>>     * struct dpu_intr_reg - array of DPU register sets
>>> @@ -93,6 +101,16 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>>>    		MDP_INTF_INTR_EN(5),
>>>    		MDP_INTF_INTR_STATUS(5)
>>>    	},
>>> +	[MDP_INTF1_TEAR_INTR] = {
>>> +		MDP_INTF_INTR_TEAR_CLEAR(1),
>>> +		MDP_INTF_INTR_TEAR_EN(1),
>>> +		MDP_INTF_INTR_TEAR_STATUS(1)
>>> +	},
>>> +	[MDP_INTF2_TEAR_INTR] = {
>>> +		MDP_INTF_INTR_TEAR_CLEAR(2),
>>> +		MDP_INTF_INTR_TEAR_EN(2),
>>> +		MDP_INTF_INTR_TEAR_STATUS(2)
>>> +	},
>>>    	[MDP_AD4_0_INTR] = {
>>>    		MDP_AD4_INTR_CLEAR_OFF(0),
>>>    		MDP_AD4_INTR_EN_OFF(0),
>>> @@ -113,11 +131,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>>>    		MDP_INTF_REV_7xxx_INTR_EN(1),
>>>    		MDP_INTF_REV_7xxx_INTR_STATUS(1)
>>>    	},
>>> +	[MDP_INTF1_7xxx_TEAR_INTR] = {
>>> +		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(1),
>>> +		MDP_INTF_REV_7xxx_INTR_TEAR_EN(1),
>>> +		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(1)
>>> +	},
>>>    	[MDP_INTF2_7xxx_INTR] = {
>>>    		MDP_INTF_REV_7xxx_INTR_CLEAR(2),
>>>    		MDP_INTF_REV_7xxx_INTR_EN(2),
>>>    		MDP_INTF_REV_7xxx_INTR_STATUS(2)
>>>    	},
>>> +	[MDP_INTF2_7xxx_TEAR_INTR] = {
>>> +		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(2),
>>> +		MDP_INTF_REV_7xxx_INTR_TEAR_EN(2),
>>> +		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(2)
>>> +	},
>>>    	[MDP_INTF3_7xxx_INTR] = {
>>>    		MDP_INTF_REV_7xxx_INTR_CLEAR(3),
>>>    		MDP_INTF_REV_7xxx_INTR_EN(3),
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>>> index 425465011c807..fda7f8c9caece 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>>> @@ -23,11 +23,15 @@ enum dpu_hw_intr_reg {
>>>    	MDP_INTF3_INTR,
>>>    	MDP_INTF4_INTR,
>>>    	MDP_INTF5_INTR,
>>> +	MDP_INTF1_TEAR_INTR,
>>> +	MDP_INTF2_TEAR_INTR,
>>>    	MDP_AD4_0_INTR,
>>>    	MDP_AD4_1_INTR,
>>>    	MDP_INTF0_7xxx_INTR,
>>>    	MDP_INTF1_7xxx_INTR,
>>> +	MDP_INTF1_7xxx_TEAR_INTR,
>>>    	MDP_INTF2_7xxx_INTR,
>>> +	MDP_INTF2_7xxx_TEAR_INTR,
>>>    	MDP_INTF3_7xxx_INTR,
>>>    	MDP_INTF4_7xxx_INTR,
>>>    	MDP_INTF5_7xxx_INTR,
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

