Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2F1688822
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 21:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D44910E620;
	Thu,  2 Feb 2023 20:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F3D10E61E;
 Thu,  2 Feb 2023 20:15:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312K7Y98007809; Thu, 2 Feb 2023 20:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FExfpP0Wu4uLeH3REpqXfv2Y+nJEtEC/VPVgSbF/KMY=;
 b=m2bY2QSadhVZJHoSnubNv7oWWdj+NPknJ220Idznly1PPEB47jxhHaj0tG5vaezewX0T
 8uH00JYxl5JxzCurcp8xpKONEj027doWSna33QOLXJx4+9U2rTzfYbCOqvzktEE5H1et
 zjICsBDluNgK5cd4Z3oR2txG9sUMlzVPKpq4RXFvLz9KPz0uZqmr4MC1ZwpaKixVoFq8
 xKixpD7yneQeYlaAlW1WORUpiNEsVIaA5zM+KDBCv1kxrwEQcBazF7wspiZ6yj9P3Fp4
 p71byKJo2We2YQ1ygjV3PxEe/QMUMZYQtXQMpUnj3AazkOsRAQGdUcyhfxbBNnQXIOHX Qw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfm9cv1cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 20:14:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 312KEsAb026571
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Feb 2023 20:14:54 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 2 Feb 2023
 12:14:54 -0800
Message-ID: <a4af7146-126f-cd6e-4c65-dbdffe6cca82@quicinc.com>
Date: Thu, 2 Feb 2023 12:14:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 12/27] drm/msm/dpu: remove dpu_hw_fmt_layout from
 struct dpu_hw_pipe_cfg
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-13-dmitry.baryshkov@linaro.org>
 <77764494-8a74-8450-ac75-33d6de0b2f8d@quicinc.com>
 <CAA8EJpq4ybOQg-Mb5RM+dcrBbR+3WrWSgvd4d20C6NKa90C15Q@mail.gmail.com>
 <62ace381-2c59-9096-2b4f-412b329ad78e@quicinc.com>
 <c6eb252e-fdff-8e17-4acb-cdb3ba850887@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <c6eb252e-fdff-8e17-4acb-cdb3ba850887@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YbPf3PJX_LN7op22IzO1dzwTmlzdFCg5
X-Proofpoint-GUID: YbPf3PJX_LN7op22IzO1dzwTmlzdFCg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_14,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302020180
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/2/2023 12:10 PM, Dmitry Baryshkov wrote:
> On 02/02/2023 21:54, Abhinav Kumar wrote:
>>
>>
>> On 2/2/2023 11:45 AM, Dmitry Baryshkov wrote:
>>> On Thu, 2 Feb 2023 at 21:38, Abhinav Kumar 
>>> <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>>>> Remove dpu_hw_fmt_layout instance from struct dpu_hw_pipe_cfg, leaving
>>>>> only src_rect and dst_rect. This way right and left pipes will have
>>>>> separate dpu_hw_pipe_cfg isntances, while the layout is common to both
>>>>> of them.
>>>>>
>>>>
>>>> Sorry for not responding to this comment earlier.
>>>>
>>>> https://patchwork.freedesktop.org/patch/473168/?series=99909&rev=1#comment_875370 
>>>>
>>>>
>>>>   From the perspective of wide planes you are right that the layout is
>>>> common but not true from smart DMA point of view.
>>>>
>>>> For wide planes, yes, its usually the same buffer with just the src_x
>>>> being different but conceptually and even HW wise each rectangle of the
>>>> smart DMA is capable of fetching from a different buffer.
>>>>
>>>>   From the pov, this decision of not having the dpu_hw_fmt_layout as 
>>>> part
>>>> of dpu_hw_pipe_cfg seems incorrect to me.
>>>
>>> Yes, each rectangle/pipe can fetch from a different buffer. However in
>>> our use case the layout is not defined for each pipe. It is defined
>>> for a plane, no matter how many pipes are used for the plane, since
>>> the buffer is also defined per plane.
>>>
>> Even if the layout is defined per plane.
>>
>> So lets say
>>
>> plane A with layout A maps to rect 1 of DMA0
>> plane B with layout B maps to rect 2 of DMA0
>>
>> How can layout be assumed to be duplicated in this case?
>>
>> This is not a wide plane use-case but just smartDMA case of two 
>> different layers.
>>
>> Maybe I am missing something but this is the example i am interested 
>> about.
> 
> PlaneA has layoutA. So dpu_plane_sspp_update_pipe() will program layoutA 
> using (DMA0, rect1)->setup_sourceaddress(layoutA).
> 
> PlaneB has layoutB, so (DMA0, rect2)->setup_sourceaddress(layoutB).
> 
> Maybe the commit message is misleading. The layout is not common to 
> rect1 and rect2. It is common to all pipes/rectangles driving a single 
> plane.
> 

Ack, Its clear now.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

>>
>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 30 
>>>>> ++++++++++-----------
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ++---
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 10 +++----
>>>>>    3 files changed, 22 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>>> index 2bd39c13d54d..400d043f37fa 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>>> @@ -486,7 +486,7 @@ static void dpu_hw_sspp_setup_rects(struct 
>>>>> dpu_sw_pipe *pipe,
>>>>>    }
>>>>>
>>>>>    static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe 
>>>>> *pipe,
>>>>> -             struct dpu_hw_pipe_cfg *cfg)
>>>>> +             struct dpu_hw_fmt_layout *layout)
>>>>>    {
>>>>>        struct dpu_hw_sspp *ctx = pipe->sspp;
>>>>>        u32 ystride0, ystride1;
>>>>> @@ -497,41 +497,41 @@ static void 
>>>>> dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>>>>>                return;
>>>>>
>>>>>        if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>>>>> -             for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
>>>>> +             for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
>>>>>                        DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx 
>>>>> + i * 0x4,
>>>>> -                                     cfg->layout.plane_addr[i]);
>>>>> +                                     layout->plane_addr[i]);
>>>>>        } else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>>>>>                DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
>>>>> -                             cfg->layout.plane_addr[0]);
>>>>> +                             layout->plane_addr[0]);
>>>>>                DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
>>>>> -                             cfg->layout.plane_addr[2]);
>>>>> +                             layout->plane_addr[2]);
>>>>>        } else {
>>>>>                DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR + idx,
>>>>> -                             cfg->layout.plane_addr[0]);
>>>>> +                             layout->plane_addr[0]);
>>>>>                DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
>>>>> -                             cfg->layout.plane_addr[2]);
>>>>> +                             layout->plane_addr[2]);
>>>>>        }
>>>>>
>>>>>        if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>>>>> -             ystride0 = (cfg->layout.plane_pitch[0]) |
>>>>> -                     (cfg->layout.plane_pitch[1] << 16);
>>>>> -             ystride1 = (cfg->layout.plane_pitch[2]) |
>>>>> -                     (cfg->layout.plane_pitch[3] << 16);
>>>>> +             ystride0 = (layout->plane_pitch[0]) |
>>>>> +                     (layout->plane_pitch[1] << 16);
>>>>> +             ystride1 = (layout->plane_pitch[2]) |
>>>>> +                     (layout->plane_pitch[3] << 16);
>>>>>        } else {
>>>>>                ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 
>>>>> + idx);
>>>>>                ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 
>>>>> + idx);
>>>>>
>>>>>                if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>>>>>                        ystride0 = (ystride0 & 0xFFFF0000) |
>>>>> -                             (cfg->layout.plane_pitch[0] & 
>>>>> 0x0000FFFF);
>>>>> +                             (layout->plane_pitch[0] & 0x0000FFFF);
>>>>>                        ystride1 = (ystride1 & 0xFFFF0000)|
>>>>> -                             (cfg->layout.plane_pitch[2] & 
>>>>> 0x0000FFFF);
>>>>> +                             (layout->plane_pitch[2] & 0x0000FFFF);
>>>>>                } else {
>>>>>                        ystride0 = (ystride0 & 0x0000FFFF) |
>>>>> -                             ((cfg->layout.plane_pitch[0] << 16) &
>>>>> +                             ((layout->plane_pitch[0] << 16) &
>>>>>                                 0xFFFF0000);
>>>>>                        ystride1 = (ystride1 & 0x0000FFFF) |
>>>>> -                             ((cfg->layout.plane_pitch[2] << 16) &
>>>>> +                             ((layout->plane_pitch[2] << 16) &
>>>>>                                 0xFFFF0000);
>>>>>                }
>>>>>        }
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>>>> index c713343378aa..8dad52eb2a90 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>>>> @@ -154,13 +154,11 @@ struct dpu_hw_pixel_ext {
>>>>>
>>>>>    /**
>>>>>     * struct dpu_hw_pipe_cfg : Pipe description
>>>>> - * @layout:    format layout information for programming buffer to 
>>>>> hardware
>>>>>     * @src_rect:  src ROI, caller takes into account the different 
>>>>> operations
>>>>>     *             such as decimation, flip etc to program this field
>>>>>     * @dest_rect: destination ROI.
>>>>>     */
>>>>>    struct dpu_hw_pipe_cfg {
>>>>> -     struct dpu_hw_fmt_layout layout;
>>>>>        struct drm_rect src_rect;
>>>>>        struct drm_rect dst_rect;
>>>>>    };
>>>>> @@ -243,10 +241,10 @@ struct dpu_hw_sspp_ops {
>>>>>        /**
>>>>>         * setup_sourceaddress - setup pipe source addresses
>>>>>         * @pipe: Pointer to software pipe context
>>>>> -      * @cfg: Pointer to pipe config structure
>>>>> +      * @layout: format layout information for programming buffer 
>>>>> to hardware
>>>>>         */
>>>>>        void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
>>>>> -                                 struct dpu_hw_pipe_cfg *cfg);
>>>>> +                                 struct dpu_hw_fmt_layout *layout);
>>>>>
>>>>>        /**
>>>>>         * setup_csc - setup color space coversion
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> index cbff4dea8662..0d2a7170e0ab 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> @@ -471,21 +471,21 @@ static void _dpu_plane_set_qos_remap(struct 
>>>>> drm_plane *plane)
>>>>>
>>>>>    static void _dpu_plane_set_scanout(struct drm_plane *plane,
>>>>>                struct dpu_plane_state *pstate,
>>>>> -             struct dpu_hw_pipe_cfg *pipe_cfg,
>>>>>                struct drm_framebuffer *fb)
>>>>>    {
>>>>>        struct dpu_plane *pdpu = to_dpu_plane(plane);
>>>>>        struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>>>>>        struct msm_gem_address_space *aspace = kms->base.aspace;
>>>>> +     struct dpu_hw_fmt_layout layout;
>>>>>        int ret;
>>>>>
>>>>> -     ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
>>>>> +     ret = dpu_format_populate_layout(aspace, fb, &layout);
>>>>>        if (ret)
>>>>>                DPU_ERROR_PLANE(pdpu, "failed to get format layout, 
>>>>> %d\n", ret);
>>>>>        else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
>>>>>                trace_dpu_plane_set_scanout(&pstate->pipe,
>>>>> -                                         &pipe_cfg->layout);
>>>>> - pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
>>>>> +                                         &layout);
>>>>> + pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, &layout);
>>>>>        }
>>>>>    }
>>>>>
>>>>> @@ -1134,7 +1134,7 @@ static void 
>>>>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>>>>
>>>>>        memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>>>>>
>>>>> -     _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
>>>>> +     _dpu_plane_set_scanout(plane, pstate, fb);
>>>>>
>>>>>        pstate->pending = true;
>>>>>
>>>
>>>
>>>
> 
