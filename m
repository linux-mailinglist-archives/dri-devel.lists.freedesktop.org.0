Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1030614086
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 23:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8547910E1DC;
	Mon, 31 Oct 2022 22:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F2810E1DB;
 Mon, 31 Oct 2022 22:14:36 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29VLrF5X010790; Mon, 31 Oct 2022 22:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qJn2KsLZXHQw4wQjRpTaNjvkBZFkA225u/4Lp/T1hUA=;
 b=M0Noido93Mj1Fe9MKTLI703nwX/ImsWZX0Whu136/JwIXa9CMnjzzHshGQ9rCMP39WDe
 8ECPic2dk9CYnYnKLeHltvT5EBK3HqBXI86fFwF3BMqhmh21CW8EhRxqIL28gFKQmLFn
 rJ9yRaPwPoM5ZfVNWVydy+kqq0xcvX8Zk/sPkSiY9QKlnmVpNdr99s4+sfpc2k+OtQ+i
 q3pseNxN5C6qNXflQ+CVd0bYbDxpgE+WzyNsFgIBD+wJrsPG+1QOe7MHT+PBvSx/8m0K
 z7mntF5DKpO8hUocevDa0ntN8pbPMjiDnSP6axH0jtptVeaafv5DvEphkDw1uKq/aJs+ bg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kjjqb0gts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 22:14:29 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29VMESuj018603
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 22:14:28 GMT
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 31 Oct
 2022 15:14:27 -0700
Message-ID: <98ab914d-fe22-ec65-ac3d-85616abecf27@quicinc.com>
Date: Mon, 31 Oct 2022 15:14:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 3/3] drm/msm/dpu: Use color_fill property for DPU
 planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-4-quic_jesszhan@quicinc.com>
 <b8c09f74-2e2f-48ac-d5d6-ef1e94ed9b09@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <b8c09f74-2e2f-48ac-d5d6-ef1e94ed9b09@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: AzjCJP2TTGI1C2muJz5e1gykMOXzzRHD
X-Proofpoint-GUID: AzjCJP2TTGI1C2muJz5e1gykMOXzzRHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_21,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=998 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210310137
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/29/2022 4:40 AM, Dmitry Baryshkov wrote:
> On 29/10/2022 01:59, Jessica Zhang wrote:
>> Initialize and use the color_fill properties for planes in DPU driver. In
>> addition, relax framebuffer requirements within atomic commit path and
>> add checks for NULL framebuffers.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++---------
>>   2 files changed, 48 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 13ce321283ff..157698b4f234 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -441,7 +441,12 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>                   sspp_idx - SSPP_VIG0,
>>                   state->fb ? state->fb->base.id : -1);
>> -        format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>> +        if (pstate->base.fb)
>> +            format = 
>> to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>> +        else if (state->color_fill && !state->color_fill_format)
>> +            format = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> 
> As I wrote in the review of the earlier patch, this disallows using 
> black as the plane fill colour. Not to mention that using ABGR should be 
> explicit rather than implicit.

Hey Dmitry,

Acked.

Thanks,

Jessica Zhang

> 
>> +        else
>> +            format = dpu_get_dpu_format(state->color_fill_format);
>>           if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>>               bg_alpha_enable = true;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 658005f609f4..f3be37e97b64 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -103,7 +103,6 @@ struct dpu_plane {
>>       enum dpu_sspp pipe;
>>       struct dpu_hw_pipe *pipe_hw;
>> -    uint32_t color_fill;
>>       bool is_error;
>>       bool is_rt_pipe;
>>       const struct dpu_mdss_cfg *catalog;
>> @@ -697,7 +696,10 @@ static int _dpu_plane_color_fill(struct dpu_plane 
>> *pdpu,
>>        * select fill format to match user property expectation,
>>        * h/w only supports RGB variants
>>        */
>> -    fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>> +    if (plane->state->color_fill && !plane->state->color_fill_format)
>> +        fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>> +    else
>> +        fmt = dpu_get_dpu_format(plane->state->color_fill_format);
>>       /* update sspp */
>>       if (fmt && pdpu->pipe_hw->ops.setup_solidfill) {
>> @@ -720,6 +722,10 @@ static int _dpu_plane_color_fill(struct dpu_plane 
>> *pdpu,
>>                       fmt, DPU_SSPP_SOLID_FILL,
>>                       pstate->multirect_index);
>> +        /* skip remaining processing on color fill */
>> +        if (!plane->state->fb)
>> +            return 0;
>> +
>>           if (pdpu->pipe_hw->ops.setup_rects)
>>               pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
>>                       &pipe_cfg,
>> @@ -999,12 +1005,21 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       dst = drm_plane_state_dest(new_plane_state);
>> -    fb_rect.x2 = new_plane_state->fb->width;
>> -    fb_rect.y2 = new_plane_state->fb->height;
>> +    if (new_plane_state->fb) {
>> +        fb_rect.x2 = new_plane_state->fb->width;
>> +        fb_rect.y2 = new_plane_state->fb->height;
>> +    }
>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +    if (new_plane_state->fb) {
>> +        fmt = 
>> to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +    } else if (new_plane_state->color_fill) {
>> +        if (new_plane_state->color_fill_format)
>> +            fmt = 
>> dpu_get_dpu_format(new_plane_state->color_fill_format);
>> +        else
>> +            fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>> +    }
>>       min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>> @@ -1016,7 +1031,7 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>           return -EINVAL;
>>       /* check src bounds */
>> -    } else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
>> +    } else if (new_plane_state->fb && !dpu_plane_validate_src(&src, 
>> &fb_rect, min_src_size)) {
>>           DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>                   DRM_RECT_ARG(&src));
>>           return -E2BIG;
>> @@ -1084,9 +1099,9 @@ void dpu_plane_flush(struct drm_plane *plane)
>>       if (pdpu->is_error)
>>           /* force white frame with 100% alpha pipe output on error */
>>           _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
>> -    else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>> +    else if (!(plane->state->fb) && plane->state->color_fill)
>>           /* force 100% alpha */
>> -        _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>> +        _dpu_plane_color_fill(pdpu, plane->state->color_fill, 0xFF);
>>       else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
>>           const struct dpu_format *fmt = 
>> to_dpu_format(msm_framebuffer_format(plane->state->fb));
>>           const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, 
>> fmt);
>> @@ -1125,23 +1140,30 @@ static void 
>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>       struct drm_crtc *crtc = state->crtc;
>>       struct drm_framebuffer *fb = state->fb;
>>       bool is_rt_pipe, update_qos_remap;
>> -    const struct dpu_format *fmt =
>> -        to_dpu_format(msm_framebuffer_format(fb));
>> +    const struct dpu_format *fmt;
>>       struct dpu_hw_pipe_cfg pipe_cfg;
>> -    memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>> -
>> -    _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
>> -
>>       pstate->pending = true;
>>       is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
>>       _dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
>> -    DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> -            ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> -            crtc->base.id, DRM_RECT_ARG(&state->dst),
>> -            (char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>> +    /* override for color fill */
>> +    if (!fb && plane->state->color_fill) {
>> +        /* skip remaining processing on color fill */
>> +        return;
>> +    }
>> +
>> +    memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>> +
>> +    fmt = to_dpu_format(msm_framebuffer_format(fb));
>> +    _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
>> +
>> +    if (fb)
>> +        DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> +                ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> +                crtc->base.id, DRM_RECT_ARG(&state->dst),
>> +                (char *)&fmt->base.pixel_format, 
>> DPU_FORMAT_IS_UBWC(fmt));
>>       pipe_cfg.src_rect = state->src;
>> @@ -1153,12 +1175,6 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>       pipe_cfg.dst_rect = state->dst;
>> -    /* override for color fill */
>> -    if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>> -        /* skip remaining processing on color fill */
>> -        return;
>> -    }
>> -
>>       if (pdpu->pipe_hw->ops.setup_rects) {
>>           pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
>>                   &pipe_cfg,
>> @@ -1509,6 +1525,8 @@ struct drm_plane *dpu_plane_init(struct 
>> drm_device *dev,
>>           DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>>       drm_plane_create_alpha_property(plane);
>> +    drm_plane_create_color_fill_property(plane);
>> +    drm_plane_create_color_fill_format_property(plane);
>>       drm_plane_create_blend_mode_property(plane,
>>               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>>               BIT(DRM_MODE_BLEND_PREMULTI) |
> 
> -- 
> With best wishes
> Dmitry
> 
