Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE35743333
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 05:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31AA10E12C;
	Fri, 30 Jun 2023 03:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB9E10E12C;
 Fri, 30 Jun 2023 03:30:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35U3L9GC011810; Fri, 30 Jun 2023 03:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qLQAL5oOwam7hlv102pgTGpwGwpwE4qIl50P6W/t+tw=;
 b=pDbDwlILUlQ8k41kGOjrNWRiEwCff6Zd3fPZ4/OyDdA1BZnxyvRuV1NgIIr1Krq0yFX5
 dr5gHIJTWZ+kXNaVH4Z7SkhBdIzVSufC4IUXTTIbtum3ZxxYJ3yzYqXhYVCwBGmI6BZt
 6JfGiGq7942CaD+zwfLYw5dyAmBnxGTBthYwC3FTMJOXKqaefzYjQqy/eCfXjlCbJRW6
 FAWpZJYq0ohViYQsrjxYttfLpbGwxpAAUvn09yFBD3jSY/hH9YlCamd98n+TvAzrWqOL
 ywwmrGSeCNj7M0jH0gBdFO+EIDxcjf4OInWNBUx4jCPJ+d4HvHh+5Hi1G03Denev8jZ7 Ow== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rh7s2swp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 03:30:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U3UKl2030455
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 03:30:20 GMT
Received: from [10.110.33.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Thu, 29 Jun
 2023 20:30:19 -0700
Message-ID: <525d4cc8-e3b4-5817-4673-c49b5c2be792@quicinc.com>
Date: Thu, 29 Jun 2023 20:30:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: use dpu core's major version to
 enable data compress
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
 <20230629193001.22618-2-quic_abhinavk@quicinc.com>
 <17b3b652-194c-99c2-e460-21663040c398@linaro.org>
 <283a4ae4-c0ea-13f9-fb47-e44f366c26b2@quicinc.com>
 <1962cd48-87e6-4f26-a882-c6648e595a80@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1962cd48-87e6-4f26-a882-c6648e595a80@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0mMVGIun-vMqCfPs8dAyYb5NxOJPrv0d
X-Proofpoint-ORIG-GUID: 0mMVGIun-vMqCfPs8dAyYb5NxOJPrv0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_01,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300028
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/29/2023 8:22 PM, Dmitry Baryshkov wrote:
> On 30/06/2023 06:07, Abhinav Kumar wrote:
>>
>>
>> On 6/29/2023 5:20 PM, Dmitry Baryshkov wrote:
>>> On 29/06/2023 22:29, Abhinav Kumar wrote:
>>>> Instead of using a feature bit to decide whether to enable data
>>>> compress or not for DSC use-cases, use dpu core's major version 
>>>> instead.
>>>> This will avoid defining feature bits for every bit level details of
>>>> registers.
>>>>
>>>> Also, rename the intf's enable_compression() op to program_datapath()
>>>> and allow it to accept a struct intf_dpu_datapath_cfg to program
>>>> all the bits at once. This can be re-used by widebus later on as
>>>> well as it touches the same register.
>>>
>>> Two separate commits please, because...
>>>
>>
>> I thought of it but it seemed better together and was the only way I 
>> could think of. Please see below.
>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  9 +++++++--
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c      |  9 +++++----
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h      | 16 
>>>> ++++++++++++++--
>>>>   3 files changed, 26 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> index b856c6286c85..f4e15b4c4cc9 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> @@ -50,6 +50,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>>               to_dpu_encoder_phys_cmd(phys_enc);
>>>>       struct dpu_hw_ctl *ctl;
>>>>       struct dpu_hw_intf_cfg intf_cfg = { 0 };
>>>> +    struct dpu_kms *dpu_kms = phys_enc->dpu_kms;
>>>>       ctl = phys_enc->hw_ctl;
>>>>       if (!ctl->ops.setup_intf_cfg)
>>>> @@ -68,8 +69,12 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>>                   phys_enc->hw_intf,
>>>>                   phys_enc->hw_pp->idx);
>>>> -    if (intf_cfg.dsc != 0 && 
>>>> phys_enc->hw_intf->ops.enable_compression)
>>>> -        phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
>>>> +    if (intf_cfg.dsc != 0 && dpu_kms->catalog->core_major_version 
>>>> >= 0x7) {
>>>
>>> ... because this becomes incorrect. The datapath should be programmed 
>>> in all the cases, if there is a corresponding callback. intf_cfg.dsc 
>>> should be used as a condition to set datapath_cfg.
>>>
>>
>> The issue is that today we do not have dpu_mdss_cfg as part of 
>> dpu_hw_intf nor _setup_intf_ops because all of those have been dropped 
>> with some rework or cleanup.
> 
> Pass dpu_mdss_cfg to dpu_hw_intf_init(). It was removed as a cleanup, 
> now we can reintroduce it.
> 

Thanks, that will address all these concerns.

I wanted to get agreement before re-introducing it and also make sure 
there was no other way.


>>
>> Ideally even I would like to assign this op only for core_rev >=7 but 
>> that information is no longer available. We would have to start 
>> passing the major and minor versions to _setup_intf_ops() to go with 
>> that approach. So without making all of those changes, the only way I 
>> had was to assign the op unconditionally but call it only for 
>> major_rev >= 7.
>>
>> Passing core_rev to the op itself so that we can write the register 
>> only for core_rev >=7 is an option but then what if some bits start 
>> becoming usable only after minor rev. then we will have to start 
>> passing major and minor rev to program_datapath too. Again getting 
>> little messy.
>>
>> I am open to ideas to achieve the goal of assigning this op only for 
>> core_rev >=7 other than what I wrote above.
>>
>>>
>>>> +        struct intf_dpu_datapath_cfg datapath_cfg = { 0 };
>>>
>>> No need for `0' in the init, empty braces would be enough.
>>>
>>
>> ack.
>>
>>>> +
>>>> +        datapath_cfg.data_compress = true;
>>>> +        phys_enc->hw_intf->ops.program_datapath(phys_enc->hw_intf, 
>>>> &datapath_cfg);
>>>> +    }
>>>>   }
>>>>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int 
>>>> irq_idx)
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> index 5b0f6627e29b..85333df08fbc 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> @@ -513,11 +513,13 @@ static void 
>>>> dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
>>>>   }
>>>> -static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
>>>> +static void dpu_hw_intf_program_datapath(struct dpu_hw_intf *ctx,
>>>> +                     struct intf_dpu_datapath_cfg *datapath_cfg)
>>>>   {
>>>>       u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
>>>> -    intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>>>> +    if (datapath_cfg->data_compress)
>>>> +        intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>>>>       DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>>>>   }
>>>> @@ -543,8 +545,7 @@ static void _setup_intf_ops(struct 
>>>> dpu_hw_intf_ops *ops,
>>>>           ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
>>>>       }
>>>> -    if (cap & BIT(DPU_INTF_DATA_COMPRESS))
>>>> -        ops->enable_compression = dpu_hw_intf_enable_compression;
>>>> +    ops->program_datapath = dpu_hw_intf_program_datapath;
>>>
>>> The `core_major_version >= 7' should either be here or in the 
>>> callback itself.
>>>
>>
>> Yes, ideally I would like it like that but please see above why I 
>> couldnt do it.
>>
>>>>   }
>>>>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>> index 99e21c4137f9..f736dca38463 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>> @@ -48,6 +48,11 @@ struct intf_status {
>>>>       u32 line_count;        /* current line count including 
>>>> blanking */
>>>>   };
>>>> +struct intf_dpu_datapath_cfg {
>>>> +    u8 data_compress;    /* enable data compress between dpu and 
>>>> dsi */
>>>> +    /* can be expanded for other programmable bits */
>>>> +};
>>>
>>> I'd say, dpu_datapath is too generic. What about  intf_cmd_mode_cfg?
>>>
>>
>> The goal was to keep it generic. Its actually the handshake between 
>> DPU and interface datapath so I chose that name.
> 
> Do you have plans of using it for the video mode?
> 

No because we didnt want to touch the video mode path as that was 
discussed in the widebus series already.

Ok, I am fine with intf_cmd_mode_cfg in that case.


>>
>> This is not specific to command mode and intf_cfg is already there so 
>> I chose that one :)
>>
>>>> +
>>>>   /**
>>>>    * struct dpu_hw_intf_ops : Interface to the interface Hw driver 
>>>> functions
>>>>    *  Assumption is these functions will be called after clocks are 
>>>> enabled
>>>> @@ -70,7 +75,7 @@ struct intf_status {
>>>>    * @get_autorefresh:            Retrieve autorefresh config from 
>>>> hardware
>>>>    *                              Return: 0 on success, -ETIMEDOUT 
>>>> on timeout
>>>>    * @vsync_sel:                  Select vsync signal for 
>>>> tear-effect configuration
>>>> - * @enable_compression:         Enable data compression
>>>> + * @program_datapath:           Program the DPU to interface 
>>>> datapath for relevant chipsets
>>>>    */
>>>>   struct dpu_hw_intf_ops {
>>>>       void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>>>> @@ -108,7 +113,14 @@ struct dpu_hw_intf_ops {
>>>>        */
>>>>       void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t 
>>>> encoder_id, u16 vdisplay);
>>>> -    void (*enable_compression)(struct dpu_hw_intf *intf);
>>>> +    /**
>>>> +     * Program the DPU to intf datapath by specifying
>>>> +     * which of the settings need to be programmed for
>>>> +     * use-cases which need DPU-intf handshake such as
>>>> +     * widebus, compression etc.
>>>
>>> This is not a valid kerneldoc.
>>>
>>
>> hmmm ... ok so just // ?
>>
>> I referred disable_autorefresh from above and did the same.
>>
>>>> +     */
>>>> +    void (*program_datapath)(struct dpu_hw_intf *intf,
>>>> +                 struct intf_dpu_datapath_cfg *datapath_cfg);
>>>>   };
>>>>   struct dpu_hw_intf {
>>>
> 
