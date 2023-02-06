Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A868C66E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 20:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F74C10E195;
	Mon,  6 Feb 2023 19:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3055010E195;
 Mon,  6 Feb 2023 19:08:06 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316IqmxF027785; Mon, 6 Feb 2023 19:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uIJzNVae7twb2yzgMADriGyIb2GKZdfimt/CObM9pqc=;
 b=pNbrx3yiK8mSXhAg0iwioaAvDxEglEYt0i8TvzR5MTdfRMhS+WRWl8A/U+y4DKlXO8am
 YJ/4oO4QWfZBwxPSYMqYiDRhJhXj2861Qw2Lh0gcYHwFXJG4GUYfobJIHbR7pkEUe9uo
 +BSk0VTwgtbhKfmpeiRK6jWsc1fNDZTmprDfeXFiiAsk2zE2v+4q2qgakyYal4PGADvS
 R6PhIw3T7lS4emp9iV4CTvGDBlH5OmxLrwIfoGjDVqo6M8buzAUN4VBkEA7bbLT0r6kb
 pH9GgNPPVulfXp1bOYanwdkLgorYEl7sq4tI/siJ03bgXlv1VTw4EfF5VDWpzVc7rczd 7Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhcqxvqwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 19:08:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 316J7xFA024491
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Feb 2023 19:07:59 GMT
Received: from [10.110.44.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 11:07:58 -0800
Message-ID: <8e89bdc2-94ff-63b8-3089-c946e0226cff@quicinc.com>
Date: Mon, 6 Feb 2023 11:07:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 20/27] drm/msm/dpu: add dpu_hw_pipe_cfg to
 dpu_plane_state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-21-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-21-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: d0PwH237qKeu6ikM1_mkqZok_Irj22Wl
X-Proofpoint-GUID: d0PwH237qKeu6ikM1_mkqZok_Irj22Wl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302060166
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Now as all accesses to pipe_cfg and pstate have been cleaned, re-add
> struct dpu_hw_pipe_cfg back to dpu_plane_state, so that
> dpu_plane_atomic_check() and dpu_plane_atomic_update() do not have a
> chance to disagree about src/dst rectangles (currently
> dpu_plane_atomic_check() uses unclipped rectangles, while
> dpu_plane_atomic_update() uses clipped rectangles calculated by
> drm_atomic_helper_check_plane_state()).
> 
The title of the patch should now say "add dpu_hw_sspp_cfg"

I have a question on the commit text, why does it say "re-add" and not 
"add".

dpu_hw_pipe_cfg/dpu_hw_sspp_cfg was not a part of dpu_plane_state even 
before and I dont recall it was removed in this series and then added back.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 64 ++++++++++-------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 +
>   2 files changed, 30 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 09a3fde1c910..ecf5402ab61a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -951,7 +951,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>   	const struct drm_crtc_state *crtc_state = NULL;
>   	const struct dpu_format *fmt;
> -	struct drm_rect src, dst, fb_rect = { 0 };
> +	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
> +	struct drm_rect fb_rect = { 0 };
>   	uint32_t min_src_size, max_linewidth;
>   	unsigned int rotation;
>   	uint32_t supported_rotations;
> @@ -984,12 +985,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -EINVAL;
>   	}
>   
> -	src.x1 = new_plane_state->src_x >> 16;
> -	src.y1 = new_plane_state->src_y >> 16;
> -	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
> -	src.y2 = src.y1 + (new_plane_state->src_h >> 16);
> +	pipe_cfg->src_rect = new_plane_state->src;
>   
> -	dst = drm_plane_state_dest(new_plane_state);
> +	/* state->src is 16.16, src_rect is not */
> +	pipe_cfg->src_rect.x1 >>= 16;
> +	pipe_cfg->src_rect.x2 >>= 16;
> +	pipe_cfg->src_rect.y1 >>= 16;
> +	pipe_cfg->src_rect.y2 >>= 16;
> +
> +	pipe_cfg->dst_rect = new_plane_state->dst;
>   
>   	fb_rect.x2 = new_plane_state->fb->width;
>   	fb_rect.y2 = new_plane_state->fb->height;
> @@ -1008,30 +1012,30 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -EINVAL;
>   
>   	/* check src bounds */
> -	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
> +	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
>   		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
> -				DRM_RECT_ARG(&src));
> +				DRM_RECT_ARG(&pipe_cfg->src_rect));
>   		return -E2BIG;
>   
>   	/* valid yuv image */
>   	} else if (DPU_FORMAT_IS_YUV(fmt) &&
> -		   (src.x1 & 0x1 || src.y1 & 0x1 ||
> -		    drm_rect_width(&src) & 0x1 ||
> -		    drm_rect_height(&src) & 0x1)) {
> +		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
> +		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
> +		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>   		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
> -				DRM_RECT_ARG(&src));
> +				DRM_RECT_ARG(&pipe_cfg->src_rect));
>   		return -EINVAL;
>   
>   	/* min dst support */
> -	} else if (drm_rect_width(&dst) < 0x1 || drm_rect_height(&dst) < 0x1) {
> +	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>   		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
> -				DRM_RECT_ARG(&dst));
> +				DRM_RECT_ARG(&pipe_cfg->dst_rect));
>   		return -EINVAL;
>   
>   	/* check decimated source width */
> -	} else if (drm_rect_width(&src) > max_linewidth) {
> +	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>   		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -				DRM_RECT_ARG(&src), max_linewidth);
> +				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>   		return -E2BIG;
>   	}
>   
> @@ -1045,7 +1049,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
>   		(rotation & DRM_MODE_ROTATE_90)) {
> -		ret = dpu_plane_check_inline_rotation(pdpu, sblk, src, fmt);
> +		ret = dpu_plane_check_inline_rotation(pdpu, sblk, pipe_cfg->src_rect, fmt);
>   		if (ret)
>   			return ret;
>   	}
> @@ -1120,9 +1124,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	bool is_rt_pipe;
>   	const struct dpu_format *fmt =
>   		to_dpu_format(msm_framebuffer_format(fb));
> -	struct dpu_hw_sspp_cfg pipe_cfg;
> -
> -	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_sspp_cfg));
> +	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>   
>   	_dpu_plane_set_scanout(plane, pstate, fb);
>   
> @@ -1139,16 +1141,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   			crtc->base.id, DRM_RECT_ARG(&state->dst),
>   			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>   
> -	pipe_cfg.src_rect = state->src;
> -
> -	/* state->src is 16.16, src_rect is not */
> -	pipe_cfg.src_rect.x1 >>= 16;
> -	pipe_cfg.src_rect.x2 >>= 16;
> -	pipe_cfg.src_rect.y1 >>= 16;
> -	pipe_cfg.src_rect.y2 >>= 16;
> -
> -	pipe_cfg.dst_rect = state->dst;
> -
>   	/* override for color fill */
>   	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>   		/* skip remaining processing on color fill */
> @@ -1157,10 +1149,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   
>   	if (pipe->sspp->ops.setup_rects) {
>   		pipe->sspp->ops.setup_rects(pipe,
> -				&pipe_cfg);
> +				pipe_cfg);
>   	}
>   
> -	_dpu_plane_setup_scaler(pipe, fmt, false, &pipe_cfg, pstate->rotation);
> +	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg, pstate->rotation);
>   
>   	if (pipe->sspp->ops.setup_multirect)
>   		pipe->sspp->ops.setup_multirect(
> @@ -1201,12 +1193,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   		}
>   	}
>   
> -	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pipe_cfg);
> +	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pstate->pipe_cfg);
>   	_dpu_plane_set_danger_lut(plane, pipe, fmt);
>   
>   	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
>   		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
> -		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pipe_cfg);
> +		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pstate->pipe_cfg);
>   	}
>   
>   	if (pstate->needs_qos_remap) {
> @@ -1214,9 +1206,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   		_dpu_plane_set_qos_remap(plane, pipe);
>   	}
>   
> -	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pipe_cfg);
> +	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pstate->pipe_cfg);
>   
> -	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pipe_cfg);
> +	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pstate->pipe_cfg);
>   }
>   
>   static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index a08b0539513b..079dad83eb37 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -19,6 +19,7 @@
>    * @base:	base drm plane state object
>    * @aspace:	pointer to address space for input/output buffers
>    * @pipe:	software pipe description
> + * @pipe_cfg:	software pipe configuration
>    * @stage:	assigned by crtc blender
>    * @needs_qos_remap: qos remap settings need to be updated
>    * @multirect_index: index of the rectangle of SSPP
> @@ -33,6 +34,7 @@ struct dpu_plane_state {
>   	struct drm_plane_state base;
>   	struct msm_gem_address_space *aspace;
>   	struct dpu_sw_pipe pipe;
> +	struct dpu_hw_sspp_cfg pipe_cfg;
>   	enum dpu_stage stage;
>   	bool needs_qos_remap;
>   	bool pending;
