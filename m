Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B868A83FD13
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 05:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3DB10EDAF;
	Mon, 29 Jan 2024 04:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E97010E810;
 Mon, 29 Jan 2024 04:01:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T2rAKI012429; Mon, 29 Jan 2024 04:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=/jtbH6p9lwWB7nQttg74tn7I1RrwSl2ReSpJkvqn7OQ=; b=cD
 aMX+2v29ApP/6o2puqsu0MNKVxVpFGXFOLw/ivE0DQw4OMsMc3uXsRqXRQb4HpRE
 LZAFQODPWYPgey5I9vdr6mgAreU+vtw67p6idV9Rx1Jte3fE7HMrLq20WkhFH80Q
 +4niIzKZSi6t+7CGjnNxqfbIARbwMS/IbVbpqolCod9gSYJE9BaOISRpg20rLoh0
 Jdb5s5lUT+G/opkWltFA1zsi63n3bpirRsnKovDFL65r5B3ccfSGv0mW9KzU0iBy
 dHFlPraDZcZugsP1SmDUg0wykueaRhuJ61B1Sp4NtceRyYBlHg0aZHkU0lfC/2nl
 vvhLYQsVod1CdOT4ifOg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvrubar2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 04:00:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T40HVT005490
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 04:00:17 GMT
Received: from [10.110.98.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 28 Jan
 2024 20:00:16 -0800
Message-ID: <0bed7afe-b73a-b1de-edc0-a25b368556bf@quicinc.com>
Date: Sun, 28 Jan 2024 20:00:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/17] drm/msm/dpu: allow
 dpu_encoder_helper_phys_setup_cdm to work for DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-2-quic_parellan@quicinc.com>
 <31e4a033-1779-450c-980e-63c8567837ed@linaro.org>
 <fa5ce695-8c00-1ae4-04cd-d1b49b42c5d6@quicinc.com>
 <5d0b2da2-7683-f801-0acf-255a8c2bd618@quicinc.com>
 <CAA8EJpoTtzupauFah=65Yn_cRQzDbgpLw-6GuXWCUwPcNJvKOA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoTtzupauFah=65Yn_cRQzDbgpLw-6GuXWCUwPcNJvKOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: yT-g3LpLblL9x3QTBRdA2syPzKAJbfcj
X-Proofpoint-GUID: yT-g3LpLblL9x3QTBRdA2syPzKAJbfcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290026
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/28/2024 7:23 PM, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 05:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 1/26/2024 4:39 PM, Paloma Arellano wrote:
>>>
>>> On 1/25/2024 1:14 PM, Dmitry Baryshkov wrote:
>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>>> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
>>>>>
>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>> ---
>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
>>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 31 ++++++++++---------
>>>>>    2 files changed, 18 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> index 993f263433314..37ac385727c3b 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>> @@ -153,6 +153,7 @@ enum dpu_intr_idx {
>>>>>     * @hw_intf:        Hardware interface to the intf registers
>>>>>     * @hw_wb:        Hardware interface to the wb registers
>>>>>     * @hw_cdm:        Hardware interface to the CDM registers
>>>>> + * @cdm_cfg:    CDM block config needed to store WB/DP block's CDM
>>>>> configuration
>>>>
>>>> Please realign the description.
>>> Ack
>>>>
>>>>>     * @dpu_kms:        Pointer to the dpu_kms top level
>>>>>     * @cached_mode:    DRM mode cached at mode_set time, acted on in
>>>>> enable
>>>>>     * @vblank_ctl_lock:    Vblank ctl mutex lock to protect
>>>>> vblank_refcount
>>>>> @@ -183,6 +184,7 @@ struct dpu_encoder_phys {
>>>>>        struct dpu_hw_intf *hw_intf;
>>>>>        struct dpu_hw_wb *hw_wb;
>>>>>        struct dpu_hw_cdm *hw_cdm;
>>>>> +    struct dpu_hw_cdm_cfg cdm_cfg;
>>>>
>>>> It might be slightly better to move it after all the pointers, so
>>>> after the dpu_kms.
>>> Ack
>>>>
>>>>>        struct dpu_kms *dpu_kms;
>>>>>        struct drm_display_mode cached_mode;
>>>>>        struct mutex vblank_ctl_lock;
>>>>> @@ -213,7 +215,6 @@ static inline int
>>>>> dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>>>>>     * @wbirq_refcount:     Reference count of writeback interrupt
>>>>>     * @wb_done_timeout_cnt: number of wb done irq timeout errors
>>>>>     * @wb_cfg:  writeback block config to store fb related details
>>>>> - * @cdm_cfg: cdm block config needed to store writeback block's CDM
>>>>> configuration
>>>>>     * @wb_conn: backpointer to writeback connector
>>>>>     * @wb_job: backpointer to current writeback job
>>>>>     * @dest:   dpu buffer layout for current writeback output buffer
>>>>> @@ -223,7 +224,6 @@ struct dpu_encoder_phys_wb {
>>>>>        atomic_t wbirq_refcount;
>>>>>        int wb_done_timeout_cnt;
>>>>>        struct dpu_hw_wb_cfg wb_cfg;
>>>>> -    struct dpu_hw_cdm_cfg cdm_cfg;
>>>>>        struct drm_writeback_connector *wb_conn;
>>>>>        struct drm_writeback_job *wb_job;
>>>>>        struct dpu_hw_fmt_layout dest;
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>> index 4cd2d9e3131a4..072fc6950e496 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>> @@ -269,28 +269,21 @@ static void
>>>>> dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>>>>>     *                                     This API does not handle
>>>>> DPU_CHROMA_H1V2.
>>>>>     * @phys_enc:Pointer to physical encoder
>>>>>     */
>>>>> -static void dpu_encoder_helper_phys_setup_cdm(struct
>>>>> dpu_encoder_phys *phys_enc)
>>>>> +static void dpu_encoder_helper_phys_setup_cdm(struct
>>>>> dpu_encoder_phys *phys_enc,
>>>>> +                          const struct dpu_format *dpu_fmt,
>>>>> +                          u32 output_type)
>>>>>    {
>>>>>        struct dpu_hw_cdm *hw_cdm;
>>>>>        struct dpu_hw_cdm_cfg *cdm_cfg;
>>>>>        struct dpu_hw_pingpong *hw_pp;
>>>>> -    struct dpu_encoder_phys_wb *wb_enc;
>>>>> -    const struct msm_format *format;
>>>>> -    const struct dpu_format *dpu_fmt;
>>>>> -    struct drm_writeback_job *wb_job;
>>>>>        int ret;
>>>>>          if (!phys_enc)
>>>>>            return;
>>>>>    -    wb_enc = to_dpu_encoder_phys_wb(phys_enc);
>>>>> -    cdm_cfg = &wb_enc->cdm_cfg;
>>>>> +    cdm_cfg = &phys_enc->cdm_cfg;
>>>>>        hw_pp = phys_enc->hw_pp;
>>>>>        hw_cdm = phys_enc->hw_cdm;
>>>>> -    wb_job = wb_enc->wb_job;
>>>>> -
>>>>> -    format = msm_framebuffer_format(wb_enc->wb_job->fb);
>>>>> -    dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format,
>>>>> wb_job->fb->modifier);
>>>>>          if (!hw_cdm)
>>>>>            return;
>>>>> @@ -306,10 +299,10 @@ static void
>>>>> dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
>>>>>          memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
>>>>>    -    cdm_cfg->output_width = wb_job->fb->width;
>>>>> -    cdm_cfg->output_height = wb_job->fb->height;
>>>>> +    cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
>>>>> +    cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
>>>>
>>>> This is a semantic change. Instead of passing the FB size, this passes
>>>> the mode dimensions. They are not guaranteed to be the same,
>>>> especially for the WB case.
>>>>
>>
>> The WB job is storing the output FB of WB. I cannot think of a use-case
>> where this cannot match the current mode programmed to the WB encoder.
>>
>> Yes, if it was the drm_plane's FB, then it cannot be guaranteed as the
>> plane can scale the contents but here thats not the case. Here its the
>> output FB of WB.
> 
> Is it a part of WB uAPI, to have the FB dimensions equal to mode
> dimensions? Or is it just our current limitation? I can easily imagine
> WB outputting data to a part of the FB (just like we can clip FB using
> plane's clip rectangle).
> 
> This boils down to a question, whether CDM should be setup in terms of
> actual output date or the physical memory buffer parameters. I suspect
> the former is the case (which makes this change correct). But it
> either should be described in the commit message or (even better)
> split to a separate commit.
> 

I would say its a combination of both today.

The way I would look at it is even if WB crops a certain section of FB, 
that will not change the FB size. FB size of WB should match the rest of 
the DRM pipeline (the mode programmed to the CRTC/encoder). If WB 
decides to write to only a small section of FB (cropping), then we need 
another WB property like CROP_ROI so that we can program the WB to only 
write to a small section of the programmed FB. So in some sense, there 
is no such support in DRM UAPI today. Hence the FB of WB is the full 
mode of the WB.

CDM is before WB so follows the rest of the pipeline that is whatever 
the data feeding it was programmed to.

> 
