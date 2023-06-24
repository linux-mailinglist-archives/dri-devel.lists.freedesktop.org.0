Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CDF73CB88
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 17:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E862810E18E;
	Sat, 24 Jun 2023 15:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996B910E18E
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 15:03:36 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b63e5f94f1so4310101fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687619014; x=1690211014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qrT+GYGGau7b/Cl8N72Zc45Ylx7WRX09Tiirn5fp1ac=;
 b=Q0+IH0NfIr4sItc+gGTvYbOXJdSVw+TX6RaDX5Lr64ZIdOOQsv7zYWftvOWtpM84uE
 4EzXQvALyo2j+UN94LzMDB7jeusq9Z+6WquHm5dzOKLHlnIOJ3puf4MaTNDGQlNv/GB1
 CNo0LBZrrUYLdgFZ59VpnuDDABpqzd+A7AyqKYJjO0HiyydEmQtN3gvXn/z9373Snrli
 X/tMusuIR9TD+XrguqWTVHntRzErivRbvq80BLyIJ65tc6fGEHynHFfKiMub//PZkx48
 /2wewqnYT1cua+QNpCG8OI+RO97lwduozQDbzYKJp4MDsz+dMpAk8jQEejy2t/JxnrwH
 DEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687619014; x=1690211014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qrT+GYGGau7b/Cl8N72Zc45Ylx7WRX09Tiirn5fp1ac=;
 b=SlA1qILao63uqWf3m7svJ2PmI9xsdwCY0aUIxKCG6k8VHuqcdbVuP1XV/Bk5N8II/o
 5WmcrlunglLbKNwRJPBLYb3YJC7nPoDEEAKemIjEaju2JzDkjoFOakmku1E610/zPv7P
 q+eP8vBSL7GUOmIVnJPoVUVb0X4HMMAi0oYpKsdU40hy335Cu9hjTSJKjBoIMxreMubD
 8oq1tEx2euGq+/srz4Uk9FZ0+IGacR9PmMPrA97oAe6xPoeeRtcdkpNVPmUNIJaknenl
 z8jRe7QdPTowY4ebGUtcFwzOOVM0RlL9tB/Pzw57BiR0AqNkb+SqjC03Qu+BXb57IeHr
 eBEQ==
X-Gm-Message-State: AC+VfDzVCofAdUzXWznZcPXyXjXeXpSVnxNQMGJC+Y7+rZ4KVTG4iRoc
 44HEADyCeVPk9RaG/CYmTJCZkg==
X-Google-Smtp-Source: ACHHUZ6X6AUpG414pgFkU4Ct6EFKFG3kMG0ZPFLkwv8Y37FUGg8Jk87ZR0fIVX8/SBf9aHeG7ZkiCQ==
X-Received: by 2002:a05:651c:169c:b0:2b4:6ea0:90eb with SMTP id
 bd28-20020a05651c169c00b002b46ea090ebmr6871688ljb.14.1687619014523; 
 Sat, 24 Jun 2023 08:03:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a2e9593000000b002b3e5794516sm311146ljh.26.2023.06.24.08.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 08:03:32 -0700 (PDT)
Message-ID: <dffa5b4c-3273-3b8a-a170-acb146063f43@linaro.org>
Date: Sat, 24 Jun 2023 18:03:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/msm/dpu: Update dev core dump to dump registers
 of sub blocks
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-6-3b2cdcc6a576@quicinc.com>
 <114f34dd-e5ce-f878-5b23-4c14dc800547@linaro.org>
 <1e41b909-4886-8392-edbc-78684e52bbf9@quicinc.com>
 <412f68a3-e3cc-f26e-2e3d-59727e5c48d8@linaro.org>
 <37c4bde0-0798-7506-ffd3-c8689ab78ba0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <37c4bde0-0798-7506-ffd3-c8689ab78ba0@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 17:17, Abhinav Kumar wrote:
> 
> 
> On 6/24/2023 5:07 AM, Dmitry Baryshkov wrote:
>> On 24/06/2023 03:09, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/22/2023 5:13 PM, Dmitry Baryshkov wrote:
>>>> On 23/06/2023 02:48, Ryan McCann wrote:
>>>>> Currently, the device core dump mechanism does not dump registers 
>>>>> of sub
>>>>> blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Add wrapper
>>>>> function to dump hardware blocks that contain sub blocks.
>>>>>
>>>>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 194 
>>>>> +++++++++++++++++++++++++++-----
>>>>>   1 file changed, 168 insertions(+), 26 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> index aa8499de1b9f..9b1b1c382269 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> @@ -885,6 +885,154 @@ static int dpu_irq_postinstall(struct msm_kms 
>>>>> *kms)
>>>>>       return 0;
>>>>>   }
>>>>> +static void dpu_kms_mdp_snapshot_add_block(struct msm_disp_state 
>>>>> *disp_state,
>>>>> +                       void __iomem *mmio, void *blk,
>>>>> +                       enum dpu_hw_blk_type blk_type)
>>>>
>>>> No. Such multiplexers add no value to the code. Please inline it.
>>>>
>>>> Not to mention that this patch is hard to review. You both move 
>>>> existing code and add new features. If it were to go, it should have 
>>>> been split into two patches: one introducing the multiplexer and 
>>>> another one adding subblocks.
>>>>
>>>
>>> Ok. we can split this into:
>>>
>>> 1) adding the multiplexer
>>> 2) adding sub-blk parsing support inside the multiplexer
>>
>> I'd say, drop the multiplexer completely. It adds no value here. It is 
>> only used from dpu_kms_mdp_snapshot(). If the code there was complex 
>> enough, it would have made sense to _split_ the function. But even in 
>> such case there would be no point in having multiplexer. We do not 
>> enumerate block by type.
>>
> 
> Can you pls elaborate what you mean by enumerate blk by type?
> 
> We do have DPU_HW_BLK_***
> 
> Did you mean sub-blk?
> 
>>>
>>>>> +{
>>>>> +    u32 base;
>>>>> +
>>>>> +    switch (blk_type) {
>>>>> +    case DPU_HW_BLK_TOP:
>>>>> +    {
>>>>> +        struct dpu_mdp_cfg *top = (struct dpu_mdp_cfg *)blk;
>>>>> +
>>>>> +        if (top->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>>> +            msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>>>>> +                            mmio + top->base, "top");
>>>>> +            msm_disp_snapshot_add_block(disp_state, top->len - 
>>>>> MDP_PERIPH_TOP0_END,
>>>>> +                            mmio + top->base + MDP_PERIPH_TOP0_END,
>>>>> +                            "top_2");
>>>>> +        } else {
>>>>> +            msm_disp_snapshot_add_block(disp_state, top->len, mmio 
>>>>> + top->base, "top");
>>>>> +        }
>>>>> +        break;
>>>>> +    }
>>>>> +    case DPU_HW_BLK_LM:
>>>>> +    {
>>>>> +        struct dpu_lm_cfg *mixer = (struct dpu_lm_cfg *)blk;
>>>>> +
>>>>> +        msm_disp_snapshot_add_block(disp_state, mixer->len, mmio + 
>>>>> mixer->base, "%s",
>>>>> +                        mixer->name);
>>>>> +        break;
>>>>> +    }
>>>>> +    case DPU_HW_BLK_CTL:
>>>>> +    {
>>>>> +        struct dpu_ctl_cfg *ctl = (struct dpu_ctl_cfg *)blk;
>>>>> +
>>>>> +        msm_disp_snapshot_add_block(disp_state, ctl->len, mmio + 
>>>>> ctl->base, "%s",
>>>>> +                        ctl->name);
>>>>> +        break;
>>>>> +    }
>>>>> +    case DPU_HW_BLK_INTF:
>>>>> +    {
>>>>> +        struct dpu_intf_cfg *intf = (struct dpu_intf_cfg *)blk;
>>>>> +
>>>>> +        msm_disp_snapshot_add_block(disp_state, intf->len, mmio + 
>>>>> intf->base, "%s",
>>>>> +                        intf->name);
>>>>> +        break;
>>>>> +    }
>>>>> +    case DPU_HW_BLK_WB:
>>>>> +    {
>>>>> +        struct dpu_wb_cfg *wb = (struct dpu_wb_cfg *)blk;
>>>>> +
>>>>> +        msm_disp_snapshot_add_block(disp_state, wb->len, mmio + 
>>>>> wb->base, "%s",
>>>>> +                        wb->name);
>>>>> +        break;
>>>>> +    }
>>>>> +    case DPU_HW_BLK_SSPP:
>>>>> +    {
>>>>> +        struct dpu_sspp_cfg *sspp_block = (struct dpu_sspp_cfg *)blk;
>>>>> +        const struct dpu_sspp_sub_blks *sblk = sspp_block->sblk;
>>>>> +
>>>>> +        base = sspp_block->base;
>>>>> +
>>>>> +        msm_disp_snapshot_add_block(disp_state, sspp_block->len, 
>>>>> mmio + base, "%s",
>>>>> +                        sspp_block->name);
>>>>> +
>>>>> +        if (sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>>>>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>>>>> +            sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED4))
>>>>> +            msm_disp_snapshot_add_block(disp_state, 
>>>>> sblk->scaler_blk.len,
>>>>> +                            mmio + base + sblk->scaler_blk.base, 
>>>>> "%s_%s",
>>>>> +                            sspp_block->name, sblk->scaler_blk.name);
>>>>
>>>> Actually, it would be better to:
>>>> - drop name from all sblk instances (and use known string instead of 
>>>> the sblk name here)
>>>> - Use sblk->foo_blk.len to check if it should be printed or not.
>>>>
>>>
>>> No, I dont agree. If we drop the names from the sub_blk in the 
>>> catalog, we will end up using "sub_blk_name" string here in the code 
>>> to indicate which blk that is in the dump.
>>>
>>> If we add more sub_blks in the catalog in the future we need to keep 
>>> changing the code over here. Thats not how it should be.
>>>
>>> Leaving the names in the catalog ensures that this code wont change 
>>> and only catalog changes when we add a new sub_blk either for an 
>>> existing or new chipset.
>>>
>>> catalog is indicating the new blk, and dumping code just prints it.
>>>
>>> with your approach, dumping code will or can keep changing with 
>>> chipsets or sub_blks. Thats not how it should be.
>>
>> Well, we do not enumerate sub-blocks in any way, they are not indexed. 
>> So even with sblk->blk.name in place, adding new sub-block would 
>> require adding new code here. That's why I wrote that the calling code 
>> knows which sub-block it refers to.
>>
> 
> Today, unfortunately each sub_blk type is different so we have to do 
> this case by case.
> 
> Ideally, this should have just been
> 
> -> print main blk
> -> print all sub-blks of the main blk
> 
> Without having to handle each main blk's sub-blks separately.
> 
> That way the dumping code would have remained generic without having to 
> do even the multiplexer in the first place.
> 
> Need to explore if somehow we can come up with a generic sub-blk struct 
> and make this possible. Then this code will become much easier and what 
> I am saying will make total sense.

In such case, yes. However I'd warn about having a generic array of 
subblocks. Having named subblock entries might complicate snapshotting, 
but it makes the rest of the DPU driver smaller.

> 
> Even without that, conceptually these sub-blk names are reflecting whats 
> in our software document. So its not a random name but reflects the 
> actual sub-blk name from the hardware.

Yes

> So this belongs in the catalog.

But the sub-block field already has a correct name: scaler_blk, csc_blk, 
etc. Having both sub-block field name and the .name inside results in 
kind of duplication, which seems unnecessary to me.

> Dumping code should not change or know whats the name of each block. It 
> should just use whats in the catalog. thats why even conceptually I am 
> not okay with your idea.

Dumping code itself (msm_disp_snapshot_*) doesn't. But the caller code 
knows what is the subblock.

Let me pick a definition from the patch:

static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
	.pcc = {.name = "pcc", .id = DPU_DSPP_PCC, .base = 0x1700,
		.len = 0x90, .version = 0x10007},
};

the "pcc" is repeated three times. When the code looks at this block, it 
already knows that it is a PCC block.

Compare this with:

static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
	.pcc = {
		.base = 0x1700,
		.len = 0x90,
		.version = 0x10007,
	},
};

Nothing is repeated, but we still know that this is the DSPPn_PCC 
sub-block description.

Calling code does:

u32 base;
base = ctx->cap->sblk->pcc.base;


> 
>> Let me extract the relevant code (skipping all the conditions for now):
>>
>> msm_disp_snapshot_add_block(disp_state, sspp_block->len, mmio + base, 
>> "%s",
>>                  sspp_block->name);
>>
>> if (have_scaler)
>>      msm_disp_snapshot_add_block(disp_state, sblk->scaler_blk.len,
>>                      mmio + base + sblk->scaler_blk.base, "%s_%s",
>>                      sspp_block->name, sblk->scaler_blk.name);
>>
>> if (have_csc)
>>      msm_disp_snapshot_add_block(disp_state, sblk->csc_blk.len,
>>                      mmio + base + sblk->csc_blk.base, "%s_%s",
>>                      sspp_block->name, sblk->csc_blk.name);
>>
>> Consider adding new sub-block, "baz". We would still require manual 
>> addition of the following code:
>>
>>      msm_disp_snapshot_add_block(disp_state, sblk->baz_blk.len,
>>                      mmio + base + sblk->baz_blk.base, "%s_%s",
>>                      sspp_block->name, sblk->baz_blk.name);
>>
>>
>> Compare this with:
>>
>>      msm_disp_snapshot_add_block(disp_state, sblk->baz_blk.len,
>>                      mmio + base + sblk->baz_blk.base, "%s_baz",
>>                      sspp_block->name);
>>
> 
> Basically you are saying why not make the one line change here instead 
> of using the name from the catalog.
> 
> I think it will be better to use from the catalog for the reason I wrote 
> above that dumping code should just "use" the catalog's information and 
> not become a catalog itself.
> 
> You are not saving much by dropping the sub-blk name from catalog anyway.
> 
>> Moreover, if we follow the style of dpu_kms_mdp_snapshot() (which 
>> doesn't use name), it should be:
>>
>>      msm_disp_snapshot_add_block(disp_state, sblk->baz_blk.len,
>>                      mmio + base + sblk->baz_blk.base, "sspp%d_baz", 
>> idx);
>>
>>
> tbh, after looking at this series, it made me think why I didnt use the 
> name from the catalog even for the dpu_kms_mdp_snapshot()
>>
>>>
> 
> <snipped>

-- 
With best wishes
Dmitry

