Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A5801348
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 20:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2585610E935;
	Fri,  1 Dec 2023 19:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C3A10E933;
 Fri,  1 Dec 2023 19:04:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1IsLca027322; Fri, 1 Dec 2023 19:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bM4H/4tp2hA+EgJKEvze+liFVv0JX1Z4fsysScltUzo=;
 b=nzS2dpNs2yTQJ2CjGASt9igaMWp5br+KgwI5SCMmoxuvtdZF898nL/5e8skGufmxnAIh
 t6gfDxHkWHn2qJ72VrE5oWE4dSgBNMr8HCEpWgaMya5DHw7LWvvf04ZKXXH6AEe8WO29
 AwJLwRQazBdzXNdAGOLz8MSNsvNlKFCzTWvRjEsYKpXP9TvDn+ZVW5GJyIce70h+LD7T
 3c5VknmQLjJXT0H98Vap30u+f8OAwCiv1QjMrq82KASEXixB/TjVSkBDgTXJh+Bqv0fR
 nyA5mxP8hPZ0UldKWr8861wy1BcN38o6VrLf6A6ygCgaPEI0B2xbEja8wrR3W6GNajwP lA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqfbds515-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 19:04:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1J4YjW018483
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 19:04:34 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 11:04:33 -0800
Message-ID: <12490147-d9f9-2695-7a0b-04961003de38@quicinc.com>
Date: Fri, 1 Dec 2023 11:04:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 11/16] drm/msm/dpu: add an API to setup the CDM block for
 writeback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-12-quic_abhinavk@quicinc.com>
 <CAA8EJppBskavOzn4_vUa=kvyYi2zn2XR70Ft-6ZyuOdGYWWL2A@mail.gmail.com>
 <3085d544-b6d9-5064-2789-2bbccf4b6818@quicinc.com>
 <CAA8EJpoP1T3SRT+7i+P7iuKEdCW5D76sEdLpVvBzHWvrqQCe3g@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoP1T3SRT+7i+P7iuKEdCW5D76sEdLpVvBzHWvrqQCe3g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dHmNJXxlJEro5QaFNyaZr1P83Vatek3r
X-Proofpoint-GUID: dHmNJXxlJEro5QaFNyaZr1P83Vatek3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_17,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=950 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010123
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/30/2023 11:20 PM, Dmitry Baryshkov wrote:
> On Fri, 1 Dec 2023 at 02:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 8/30/2023 5:11 PM, Dmitry Baryshkov wrote:
>>> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> Add an API dpu_encoder_helper_phys_setup_cdm() which can be used by
>>>> the writeback encoder to setup the CDM block.
>>>>
>>>> Currently, this is defined and used within the writeback's physical
>>>> encoder layer however, the function can be modified to be used to setup
>>>> the CDM block even for non-writeback interfaces.
>>>>
>>>> Until those modifications are planned and made, keep it local to
>>>> writeback.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   3 +
>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 123 +++++++++++++++++-
>>>>    2 files changed, 125 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> index 510c1c41ddbc..93a8ae67beff 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> @@ -16,6 +16,7 @@
>>>>    #include "dpu_hw_pingpong.h"
>>>>    #include "dpu_hw_ctl.h"
>>>>    #include "dpu_hw_top.h"
>>>> +#include "dpu_hw_cdm.h"
>>>>    #include "dpu_encoder.h"
>>>>    #include "dpu_crtc.h"
>>>>
>>>> @@ -209,6 +210,7 @@ static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>>>>     * @wbirq_refcount:     Reference count of writeback interrupt
>>>>     * @wb_done_timeout_cnt: number of wb done irq timeout errors
>>>>     * @wb_cfg:  writeback block config to store fb related details
>>>> + * @cdm_cfg: cdm block config needed to store writeback block's CDM configuration
>>>>     * @wb_conn: backpointer to writeback connector
>>>>     * @wb_job: backpointer to current writeback job
>>>>     * @dest:   dpu buffer layout for current writeback output buffer
>>>> @@ -218,6 +220,7 @@ struct dpu_encoder_phys_wb {
>>>>           atomic_t wbirq_refcount;
>>>>           int wb_done_timeout_cnt;
>>>>           struct dpu_hw_wb_cfg wb_cfg;
>>>> +       struct dpu_hw_cdm_cfg cdm_cfg;
>>>>           struct drm_writeback_connector *wb_conn;
>>>>           struct drm_writeback_job *wb_job;
>>>>           struct dpu_hw_fmt_layout dest;
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> index 4c2736c3ee6d..11935aac9fd5 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> @@ -24,6 +24,20 @@
>>>>    #define to_dpu_encoder_phys_wb(x) \
>>>>           container_of(x, struct dpu_encoder_phys_wb, base)
>>>>
>>>> +#define TO_S15D16(_x_)((_x_) << 7)
>>>> +
>>>> +static struct dpu_csc_cfg dpu_encoder_phys_wb_rgb2yuv_601l = {
>>>> +       {
>>>> +               TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
>>>> +               TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
>>>> +               TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
>>>> +       },
>>>> +       { 0x00, 0x00, 0x00 },
>>>> +       { 0x0040, 0x0200, 0x0200 },
>>>> +       { 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
>>>> +       { 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
>>>> +};
>>>
>>> Nit: we probably need to have a single place with all dpu_csc_cfg entries.
>>>
>>
>> hmmm ... so we have YUV2RGB matrices for dpu plane and RGB2YUV matrices
>> for WB and DP.
>>
>> We can move all this to dpu_hw_util.c but lets do that in the DP series
>> as that completes the consumer list of these matrices.
> 
> Doing it earlier is usually better. Can we please do it as a part of
> this series?
> 

Would be strange as RGB2YUV matrix is not used by anyone other than WB 
till DP lands.

If you are fine with that anomaly, no concerns.

>>
>>>> +
>>>>    /**
>>>>     * dpu_encoder_phys_wb_is_master - report wb always as master encoder
>>>>     * @phys_enc:  Pointer to physical encoder
>>>> @@ -225,6 +239,112 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>>>>           }
>>>>    }
>>>>
>>>> +/**
>>>> + * dpu_encoder_phys_wb_setup_cdp - setup chroma down sampling block
>>>> + * @phys_enc:Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +       struct dpu_hw_cdm *hw_cdm;
>>>> +       struct dpu_hw_cdm_cfg *cdm_cfg;
>>>> +       struct dpu_hw_pingpong *hw_pp;
>>>> +       struct dpu_encoder_phys_wb *wb_enc;
>>>> +       const struct msm_format *format;
>>>> +       const struct dpu_format *dpu_fmt;
>>>> +       struct drm_writeback_job *wb_job;
>>>> +       int ret;
>>>> +
>>>> +       if (!phys_enc)
>>>> +               return;
>>>> +
>>>> +       wb_enc = to_dpu_encoder_phys_wb(phys_enc);
>>>> +       cdm_cfg = &wb_enc->cdm_cfg;
>>>> +       hw_pp = phys_enc->hw_pp;
>>>> +       hw_cdm = phys_enc->hw_cdm;
>>>> +       wb_job = wb_enc->wb_job;
>>>> +
>>>> +       format = msm_framebuffer_format(wb_enc->wb_job->fb);
>>>> +       dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
>>>> +
>>>> +       if (!hw_cdm)
>>>> +               return;
>>>> +
>>>> +       if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
>>>> +               DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
>>>> +                         dpu_fmt->base.pixel_format);
>>>> +               if (hw_cdm->ops.disable)
>>>> +                       hw_cdm->ops.disable(hw_cdm);
>>>> +
>>>> +               return;
>>>> +       }
>>>> +
>>>> +       memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
>>>> +
>>>> +       cdm_cfg->output_width = wb_job->fb->width;
>>>> +       cdm_cfg->output_height = wb_job->fb->height;
>>>> +       cdm_cfg->output_fmt = dpu_fmt;
>>>> +       cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
>>>> +       cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
>>>> +                       CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
>>>> +
>>>> +       /* enable 10 bit logic */
>>>> +       switch (cdm_cfg->output_fmt->chroma_sample) {
>>>> +       case DPU_CHROMA_RGB:
>>>> +               cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
>>>> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
>>>> +               break;
>>>> +       case DPU_CHROMA_H2V1:
>>>> +               cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
>>>> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
>>>> +               break;
>>>> +       case DPU_CHROMA_420:
>>>> +               cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
>>>> +               cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
>>>> +               break;
>>>> +       case DPU_CHROMA_H1V2:
>>>> +       default:
>>>> +               DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
>>>> +                         DRMID(phys_enc->parent));
>>>> +               cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
>>>> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
>>>> +               break;
>>>> +       }
>>>> +
>>>> +       DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
>>>> +                 DRMID(phys_enc->parent), cdm_cfg->output_width,
>>>> +                 cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
>>>> +                 cdm_cfg->output_type, cdm_cfg->output_bit_depth,
>>>> +                 cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
>>>> +
>>>> +       if (hw_cdm && hw_cdm->ops.setup_csc_data) {
>>>> +               ret = hw_cdm->ops.setup_csc_data(hw_cdm, &dpu_encoder_phys_wb_rgb2yuv_601l);
>>>> +               if (ret < 0) {
>>>> +                       DPU_ERROR("[enc:%d] failed to setup CSC; ret:%d\n",
>>>> +                                 DRMID(phys_enc->parent), ret);
>>>> +                       return;
>>>> +               }
>>>> +       }
>>>> +
>>>> +       if (hw_cdm && hw_cdm->ops.setup_cdwn) {
>>>
>>> You have checked for (!hw_cdm) several lines above. We can drop this
>>> condition here.
>>>
>>
>> Ack.
>>
>>>> +               ret = hw_cdm->ops.setup_cdwn(hw_cdm, cdm_cfg);
>>>> +               if (ret < 0) {
>>>> +                       DPU_ERROR("[enc:%d] failed to setup CDWN; ret:%d\n",
>>>> +                                 DRMID(phys_enc->parent), ret);
>>>> +                       return;
>>>> +               }
>>>> +       }
>>>> +
>>>> +       if (hw_cdm && hw_pp && hw_cdm->ops.enable) {
>>>
>>> And what if !hw_pp ? Can it happen here? No, if I understand correctly.
>>>
>>
>> I dont see any other protection for !hw_pp in this flow so would prefer
>> to keep it.
> 
> But can we end up in this function if we have no hw_pp at all?
> 

Just from code flow yes,

dpu_encoder_prepare_for_kickoff ---> phys->ops.prepare_for_kickoff ---> 
this function

None of them have !hw_pp.

But, if hw_pp failed allocation, then atomic_check will fail so the 
commit will not happen.

I was thinking of the former, if we are fine with the latter we can drop.

>>
>>>> +               cdm_cfg->pp_id = hw_pp->idx;
>>>> +               ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
>>>
>>> As we are calling these three ops in a row, can we merge them together
>>> into a single callback to be called from dpu_encoder.c?
>>>
>>
>> Good idea. I can add a csc_cfg entry to cdm_cfg and merge all three into
>> the enable() op itself and drop the other two.
>>
>>>> +               if (ret < 0) {
>>>> +                       DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
>>>> +                                 DRMID(phys_enc->parent), ret);
>>>> +                       return;
>>>> +               }
>>>> +       }
>>>> +}
>>>> +
>>>>    /**
>>>>     * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
>>>>     * @phys_enc:  Pointer to physical encoder
>>>> @@ -348,8 +468,9 @@ static void dpu_encoder_phys_wb_setup(
>>>>
>>>>           dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
>>>>
>>>> -       dpu_encoder_phys_wb_setup_ctl(phys_enc);
>>>> +       dpu_encoder_helper_phys_setup_cdm(phys_enc);
>>>>
>>>> +       dpu_encoder_phys_wb_setup_ctl(phys_enc);
>>>>    }
>>>>
>>>>    static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
>>>> --
>>>> 2.40.1
>>>>
>>>
>>>
> 
> 
> 
