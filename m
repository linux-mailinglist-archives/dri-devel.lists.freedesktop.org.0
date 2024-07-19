Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87886937DE6
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 00:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632B310E0E6;
	Fri, 19 Jul 2024 22:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jHJyLXOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DB910E0B4;
 Fri, 19 Jul 2024 22:48:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JC25b5026373;
 Fri, 19 Jul 2024 22:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AkGBtjIYu3XoMKfvLC9dsIP3nI7CxlnKQNQMRzud6Ms=; b=jHJyLXOxfS1/Ffqm
 Jg+BR+N1b/M1kbybrV06jErcq1nYpZXbzzllkY3Jtn6LIUygT6R89hJDbg3kySph
 c+8kHabyfL3vT8iazlVeH/Tde+FHANojbC2PFRY2EIqMLYNpgtt/8IIZSJcyxV06
 sMwQ8lC5+3WCws8QGQ+yi/vJ912jhuOmWPQoZhSgXej9C/hjOTzQQVH9rGZJjoIk
 WVmX9vFaLgg6bAk3MlWtskwrENYDIRVkgzfPv42/6hgFS580Y0Xm+9aTp9QDrvh9
 Xj05cc+CPZkBm84Z/72hxhATvm/4RrZXoBCFqxyi2FztaOd7VUXhGUZTpr3WCNMF
 7zUkaA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe1mam0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jul 2024 22:48:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46JMmbO2005759
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jul 2024 22:48:37 GMT
Received: from [10.110.15.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 15:48:36 -0700
Message-ID: <133cbe76-6df2-42d2-b7c1-67228242ebd1@quicinc.com>
Date: Fri, 19 Jul 2024 15:48:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/16] drm/msm/dpu: drop msm_format from struct
 dpu_hw_fmt_layout
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-8-501d984d634f@linaro.org>
 <4e19faf3-0fc6-4ef2-abf5-4f9a0579982b@quicinc.com>
 <CAA8EJppGC_u-79YyXqXEeQAc9oBUOm-+ZuUDu_3b8MWnVVAOxg@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppGC_u-79YyXqXEeQAc9oBUOm-+ZuUDu_3b8MWnVVAOxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MboQzn0IN5Zfny6ng2AQDsFOqoVLbd6l
X-Proofpoint-ORIG-GUID: MboQzn0IN5Zfny6ng2AQDsFOqoVLbd6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190168
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/17/2024 3:09 PM, Dmitry Baryshkov wrote:
> On Wed, 17 Jul 2024 at 23:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
>>> The struct dpu_hw_fmt_layout defines hardware data layout (addresses,
>>> sizes and pitches. Drop format field from this structure as it's not a
>> Missing closing brace ")" here?
>>
>>> part of the data layout.
>>>
>>
>> Its a bit subjective IMO whether you consider format as part of hardware
>> data layout or not. Registers do have format bitfields too so I am
>> somewhat unsure if this change is really needed.
> 
> It's not a part of the data buffer layout (num_planes, sizes, pitches
> and offsets) - the items that are defined by struct dpu_hw_fmt_layout.
> As such there is no need to store it in the structure. When necessary
> we can always get it from the framebuffer itself.
> 

Alright,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 31 +++++++---------------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 23 ++++++++--------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  2 --
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  4 +--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  3 ++-
>>>    5 files changed, 25 insertions(+), 38 deletions(-)
>>>
>>
>> <Snip>
>>
>>> @@ -318,15 +318,10 @@ static void dpu_encoder_phys_wb_setup(
>>>    {
>>>        struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>>>        struct drm_display_mode mode = phys_enc->cached_mode;
>>> -     struct drm_framebuffer *fb = NULL;
>>>        struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
>>> -     struct drm_writeback_job *wb_job;
>>>        const struct msm_format *format;
>>> -     const struct msm_format *dpu_fmt;
>>>
>>> -     wb_job = wb_enc->wb_job;
>>>        format = msm_framebuffer_format(wb_enc->wb_job->fb);
>>> -     dpu_fmt = mdp_get_format(&phys_enc->dpu_kms->base, format->pixel_format, wb_job->fb->modifier);
>>>
>>
>> This is interesting. I wonder why I just didnt use format directly that
>> time itself :)
>>
>> Maybe I was thinking that mdp_get_format() will also match the modifiers
>> and return the corresponding msm_format.
>>
>>>        DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
>>>                        hw_wb->idx - WB_0, mode.name,
>>> @@ -338,9 +333,9 @@ static void dpu_encoder_phys_wb_setup(
>>>
>>>        dpu_encoder_phys_wb_set_qos(phys_enc);
>>>
>>> -     dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
>>> +     dpu_encoder_phys_wb_setup_fb(phys_enc, format);
>>>
>>> -     dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
>>> +     dpu_encoder_helper_phys_setup_cdm(phys_enc, format, CDM_CDWN_OUTPUT_WB);
>>>
>>>        dpu_encoder_phys_wb_setup_ctl(phys_enc);
>>>    }
>>> @@ -584,14 +579,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
>>>
>>>        format = msm_framebuffer_format(job->fb);
>>>
>>> -     wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
>>> -                                          format->pixel_format, job->fb->modifier);
>>> -     if (!wb_cfg->dest.format) {
>>> -             /* this error should be detected during atomic_check */
>>> -             DPU_ERROR("failed to get format %p4cc\n", &format->pixel_format);
>>> -             return;
>>> -     }
>>> -
>>>        ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
>>>        if (ret) {
>>>                DPU_DEBUG("failed to populate layout %d\n", ret);
> 
> 
> 
