Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6482B6B1659
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 00:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300A910E759;
	Wed,  8 Mar 2023 23:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF1D10E772;
 Wed,  8 Mar 2023 23:14:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328D89LA012562; Wed, 8 Mar 2023 23:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8OWkutlCju7Wj6W+v84VS3ABXh9hOXAVh4ybGDqXKNY=;
 b=YJu6yyRL07sEaBgwJN6nE/aUehg316NX+HKmF3G6WHqvoixXJ6WW6CxvVqenTW1XFn9W
 lKNKRK0dLKjedWNoamwZOq9O/8XUZfbykBgyGx2+DesreSE+EqdVrCMX2dhqIWJvsCwe
 5lP70BucxxAemg/XGTB9BOD7vyc28c3lukmx8dVOkdHwsXUUnGN/+gEF7iUxG/OCvmxj
 IigjRnYcCzVRhhqPnIAh4nC/qxHrKpKnS0RyYh51YVhgEU7h4Koz5XT4sc+sVdQW84fe
 cu2RCv2FQWam6VthtvhvVhy3Fx45BnVpT7cACMmQR6P/LD1rk1hDw/5WoF8H3u5sjZt4 8Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6fgfu6jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 23:14:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 328NEeFr001172
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Mar 2023 23:14:40 GMT
Received: from [10.110.84.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 8 Mar 2023
 15:14:39 -0800
Message-ID: <438c6672-f0e9-ff06-0e87-21ec282f337a@quicinc.com>
Date: Wed, 8 Mar 2023 15:14:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 27/30] drm/msm/dpu: add support for wide planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
 <20230303125725.3695011-28-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230303125725.3695011-28-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bTWfqhHQwdkNIqEKXptxTJgY8p41zPSZ
X-Proofpoint-ORIG-GUID: bTWfqhHQwdkNIqEKXptxTJgY8p41zPSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080193
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



On 3/3/2023 4:57 AM, Dmitry Baryshkov wrote:
> Typically SSPP can support rectangle with width up to 2560. However it's
> possible to use multirect feature and split source to use the SSPP to
> output two consecutive rectangles. This commit brings in this capability
> to support wider screen resolutions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  19 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 125 +++++++++++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
>   3 files changed, 133 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index e651e4593280..03034ec8ed1b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -480,6 +480,15 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   					   format, fb ? fb->modifier : 0,
>   					   &pstate->pipe, 0, stage_cfg);
>   
> +		if (pstate->r_pipe.sspp) {
> +			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
> +			_dpu_crtc_blend_setup_pipe(crtc, plane,
> +						   mixer, cstate->num_mixers,
> +						   pstate->stage,
> +						   format, fb ? fb->modifier : 0,
> +						   &pstate->pipe, 1, stage_cfg);
> +		}
> +
>   		/* blend config update */
>   		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
>   			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
> @@ -1316,10 +1325,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>   		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
>   			state->crtc_x, state->crtc_y, state->crtc_w,
>   			state->crtc_h);
> -		seq_printf(s, "\tsspp:%s\n",
> +		seq_printf(s, "\tsspp[0]:%s\n",
>   			   pstate->pipe.sspp->cap->name);
> -		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
> +		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
>   			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
> +		if (pstate->r_pipe.sspp) {
> +			seq_printf(s, "\tsspp[1]:%s\n",
> +				   pstate->r_pipe.sspp->cap->name);
> +			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
> +				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
> +		}
>   
>   		seq_puts(s, "\n");
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 3d798b939faa..06fbe5ef7ff2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -701,6 +701,10 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   	/* update sspp */
>   	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
>   				   fill_color, fmt);
> +
> +	if (pstate->r_pipe.sspp)
> +		_dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
> +					   fill_color, fmt);
>   }
>   
>   int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
> @@ -958,9 +962,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	int ret = 0, min_scale;
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> +	struct dpu_sw_pipe *pipe = &pstate->pipe;
> +	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>   	const struct drm_crtc_state *crtc_state = NULL;
>   	const struct dpu_format *fmt;
>   	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>   	struct drm_rect fb_rect = { 0 };
>   	uint32_t max_linewidth;
>   	unsigned int rotation;
> @@ -984,8 +991,11 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	if (!new_plane_state->visible)
>   		return 0;
>   
> -	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> -	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	r_pipe->sspp = NULL;
>   
>   	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>   	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> @@ -1017,19 +1027,58 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	max_linewidth = pdpu->catalog->caps->max_linewidth;
>   
> -	/* check decimated source width */
>   	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> -		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -		return -E2BIG;
> +		/* struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state); */
> +
> +		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +			return -E2BIG;
> +		}
> +
> +		/*
> +		 * FIXME: it's not possible to check if sourcesplit is supported,
> +		 * LMs is not assigned yet. It happens in dpu_encoder_virt_mode_set
> +		 */
> +		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> +			   drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
> +			   (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> +			    !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
> +			   /* cstate->num_mixers < 2 ||
> +			   !test_bit(DPU_MIXER_SOURCESPLIT, &cstate->mixers[0].hw_lm->cap->features) || */
> +			   DPU_FORMAT_IS_YUV(fmt)) {
> +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +			return -E2BIG;
> +		}
This patch throws a compilation warning (which seems correct) which 
fails on my CrOS tree

/mnt/host/source/src/third_party/kernel/v5.15/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1049:25: 
error: variable 'fmt' is uninitialized when used here 
[-Werror,-Wuninitialized]
                            DPU_FORMAT_IS_YUV(fmt)) {
                                              ^~~
/mnt/host/source/src/third_party/kernel/v5.15/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h:49:38: 
note: expanded from macro 'DPU_FORMAT_IS_YUV'
         (test_bit(DPU_FORMAT_FLAG_YUV_BIT, (X)->flag))
                                             ^
/mnt/host/source/src/third_party/kernel/v5.15/include/linux/bitops.h:61:50: 
note: expanded from macro 'test_bit'
#define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                                              ^~~~
/mnt/host/source/src/third_party/kernel/v5.15/include/linux/bitops.h:50:37: 
note: expanded from macro 'bitop'
           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \

I have fixed this by making this change:

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 06fbe5ef7ff2..9a03d1cad0ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1027,6 +1027,8 @@ static int dpu_plane_atomic_check(struct drm_plane 
*plane,

         max_linewidth = pdpu->catalog->caps->max_linewidth;

+       fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
         if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
                 /* struct dpu_crtc_state *cstate = 
to_dpu_crtc_state(crtc_state); */

@@ -1067,8 +1069,6 @@ static int dpu_plane_atomic_check(struct drm_plane 
*plane,
                 r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
         }

-       fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
-
         ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
         if (ret)
                 return ret;

Perhaps you can absorb this into your patch.

But this makes me wonder, no YUV cases were tested with this series so far?

> +
> +		/* Use multirect for wide plane. We do not support dynamic assignment of SSPPs, so we know the configuration. */
> +		pipe->multirect_index = DPU_SSPP_RECT_0;
> +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +
> +		r_pipe->sspp = pipe->sspp;
> +		r_pipe->multirect_index = DPU_SSPP_RECT_1;
> +		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +
> +		*r_pipe_cfg = *pipe_cfg;
> +		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> +		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> +		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> +		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
>   	}
>   
>   	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>   
> -	ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, fmt);
> +	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
>   	if (ret)
>   		return ret;
>   
> +	if (r_pipe->sspp) {
> +		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
>   
>   	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> @@ -1096,8 +1145,10 @@ void dpu_plane_flush(struct drm_plane *plane)
>   	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>   		/* force 100% alpha */
>   		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> -	else
> +	else {
>   		dpu_plane_flush_csc(pdpu, &pstate->pipe);
> +		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> +	}
>   
>   	/* flag h/w flush complete */
>   	if (plane->state)
> @@ -1209,13 +1260,14 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	struct drm_plane_state *state = plane->state;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>   	struct dpu_sw_pipe *pipe = &pstate->pipe;
> +	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>   	struct drm_crtc *crtc = state->crtc;
>   	struct drm_framebuffer *fb = state->fb;
>   	bool is_rt_pipe;
>   	const struct dpu_format *fmt =
>   		to_dpu_format(msm_framebuffer_format(fb));
>   	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>   	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>   	struct msm_gem_address_space *aspace = kms->base.aspace;
>   	struct dpu_hw_fmt_layout layout;
> @@ -1243,6 +1295,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   				   drm_mode_vrefresh(&crtc->mode),
>   				   layout_valid ? &layout : NULL);
>   
> +	if (r_pipe->sspp) {
> +		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
> +					   drm_mode_vrefresh(&crtc->mode),
> +					   layout_valid ? &layout : NULL);
> +	}
> +
>   	if (pstate->needs_qos_remap)
>   		pstate->needs_qos_remap = false;
>   
> @@ -1250,16 +1308,31 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   						    &crtc->mode, pipe_cfg);
>   
>   	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
> +
> +	if (r_pipe->sspp) {
> +		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
> +
> +		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
> +	}
>   }
>   
>   static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>   {
>   	struct drm_plane_state *state = plane->state;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> +	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>   
>   	trace_dpu_plane_disable(DRMID(plane), false,
>   				pstate->pipe.multirect_mode);
>   
> +	if (r_pipe->sspp) {
> +		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +		if (r_pipe->sspp->ops.setup_multirect)
> +			r_pipe->sspp->ops.setup_multirect(r_pipe);
> +	}
> +
>   	pstate->pending = true;
>   }
>   
> @@ -1292,6 +1365,9 @@ static void dpu_plane_destroy(struct drm_plane *plane)
>   		pstate = to_dpu_plane_state(plane->state);
>   		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
>   
> +		if (pstate->r_pipe.sspp)
> +			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
> +
>   		mutex_destroy(&pdpu->lock);
>   
>   		/* this will destroy the states as well */
> @@ -1372,12 +1448,29 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>   		const struct drm_plane_state *state)
>   {
>   	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> +	const struct dpu_sw_pipe *pipe = &pstate->pipe;
> +	const struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> +	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>   
>   	drm_printf(p, "\tstage=%d\n", pstate->stage);
> -	drm_printf(p, "\tsspp=%s\n", pstate->pipe.sspp->cap->name);
> -	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->pipe.multirect_mode));
> -	drm_printf(p, "\tmultirect_index=%s\n",
> -		   dpu_get_multirect_index(pstate->pipe.multirect_index));
> +
> +	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> +	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
> +	drm_printf(p, "\tmultirect_index[0]=%s\n",
> +		   dpu_get_multirect_index(pipe->multirect_index));
> +	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> +	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> +
> +	if (r_pipe->sspp) {
> +		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
> +		drm_printf(p, "\tmultirect_mode[1]=%s\n",
> +			   dpu_get_multirect_mode(r_pipe->multirect_mode));
> +		drm_printf(p, "\tmultirect_index[1]=%s\n",
> +			   dpu_get_multirect_index(r_pipe->multirect_index));
> +		drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> +		drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->dst_rect));
> +	}
>   }
>   
>   static void dpu_plane_reset(struct drm_plane *plane)
> @@ -1411,6 +1504,10 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   	 * This is the place where the state is allocated, so fill it fully.
>   	 */
>   	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> +	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> +	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +	pstate->r_pipe.sspp = NULL;
>   
>   	__drm_atomic_helper_plane_reset(plane, &pstate->base);
>   }
> @@ -1427,6 +1524,8 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>   	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
> +	if (pstate->r_pipe.sspp)
> +		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 0ca9002015ff..7490ffd94d03 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -19,7 +19,9 @@
>    * @base:	base drm plane state object
>    * @aspace:	pointer to address space for input/output buffers
>    * @pipe:	software pipe description
> + * @r_pipe:	software pipe description of the second pipe
>    * @pipe_cfg:	software pipe configuration
> + * @r_pipe_cfg:	software pipe configuration for the second pipe
>    * @stage:	assigned by crtc blender
>    * @needs_qos_remap: qos remap settings need to be updated
>    * @multirect_index: index of the rectangle of SSPP
> @@ -34,7 +36,9 @@ struct dpu_plane_state {
>   	struct drm_plane_state base;
>   	struct msm_gem_address_space *aspace;
>   	struct dpu_sw_pipe pipe;
> +	struct dpu_sw_pipe r_pipe;
>   	struct dpu_sw_pipe_cfg pipe_cfg;
> +	struct dpu_sw_pipe_cfg r_pipe_cfg;
>   	enum dpu_stage stage;
>   	bool needs_qos_remap;
>   	bool pending;
