Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C1FACC43F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 12:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC2C10E5F1;
	Tue,  3 Jun 2025 10:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lem0NO5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E7710E5FD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 10:21:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JGX4005035
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Jun 2025 10:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+yFMWYOsepgGCv6WJkDjVObj
 uomJ6ssrQYWGuL/VKH0=; b=Lem0NO5pvjbail51CcHRVfcA0l0GTaXc05Qefe6O
 960aIU+/kNbrsaJBcTaXHzf7mlS0XezUvHhn3K9iNApgLy76iFOBdTnwBCmSCH8w
 v1Eu0gBIww/WDLtC/Ss7P2s7hNy3lvBlUxDmGnMJS9L8HdbVLWEbirdutky90ola
 0L9w7bG0K9lLYsXSr9I/YXgeqbL01h5LfTzGgygYgodj+IqCYkzldzjgaw/7j2dU
 2WAswJYh/pzL1zMI1VgFtLta4vxawuNxtamJrzVd2VjOv8YAmpPFMgpmfKBA90t+
 Q83CGn93zZDXpRy8vDKhOjj3yYfO8XETcV8xamVk0cjtfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471wqwg997-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 10:21:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d0aa9cdecdso278405685a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 03:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748946109; x=1749550909;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+yFMWYOsepgGCv6WJkDjVObjuomJ6ssrQYWGuL/VKH0=;
 b=IBQ//PJDEz0hq4kZsmvjyuZ8Gs3d7ASp9t2WCb9oabTidQ3+dx6Q8zi60rqVQQbtOa
 afCG7xRGMeX+oyRQbAgJg6wDqVGi3CQ468kuLq3VWdsjxPlPK/eNU9Eam7Elznb5M8L8
 RK9eIXLNoE48OjUuA4phN764cc+KIW6LKgzKvCRrTRm/ZRS7sOnP5FwuINYmcE8UW1qi
 gJ4rpxKhObvYD3kKE/mhehrBl3Nx+KdD4oMxSufJJjsx3HnMKD6khVtKIgI3dftBT8bS
 am/yCyTXUVIU92hmDxA2jG+KLcHeU62VIpDpB7XVDQ/2lUqBOfa113DBnUsgddFezjnn
 PyHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg497yAuGneyCrgKEhdifXUwCgntWTMGuSWGCx9nZSOfvVfUT1fYrHLnAlkNl9KqlAxUKIBauqLjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqyyqAmdH0YO3ZlwSFf87I+tpq/nUGNhc3MY07S2KTfEbdPFCM
 qdK0des8M3YBXHRcV8+ZWJICs2sBd2G4t5iuSXe6028G1fh1kclYTUvBUql1WQG8PLoiHAq0qcT
 v+b9P0+6vn67p745OauvnVDGGlUsc9Vrpz5m0vRtXFLxZl/SC5TWZ0vcDJ9k6CtYTptG1WJk=
X-Gm-Gg: ASbGncsFi+j5CtlHKcFUrqWDEeJtULT895Z2Gauz9Ekyn4RP8OW11DoDcmCHvmuO9Je
 sBxtPb6xcg4qXzU20PshN5cFWzqecwpAJY3A3jkxvMPFhwlPSQY4mF6Bw3lCArOokazSGh1eLVb
 QMIbsxf/6aPE09Pfq0iOBJM4I78GlrN41e1G4Q+areRz7Af1EpV9qITtylWalgVlWhdytUPYQql
 SugEj1r4zsSVvfn/XHabGxT8VNDjojOQTfv8B1iy5eafVz2mrdeaD+g7vsQuNrcXxzGMIRp+uvm
 xYp/IYavjlmYT2y7F9BOJ1w/KrBpCfS45ZqOn2TLSheC0vjjqvBwerr76U7Yt+vmMQYMGQEmPQ4
 =
X-Received: by 2002:a05:620a:4142:b0:7c5:6678:ab18 with SMTP id
 af79cd13be357-7d0eacd7f28mr1482546185a.42.1748946109522; 
 Tue, 03 Jun 2025 03:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA+wh/4FKedlrkOPQwatQTrmIQIx7FrIJJHycPWZsT+nXMzTZkh9eMA7K4VeFJbCto3w398Q==
X-Received: by 2002:a05:620a:4142:b0:7c5:6678:ab18 with SMTP id
 af79cd13be357-7d0eacd7f28mr1482541885a.42.1748946108944; 
 Tue, 03 Jun 2025 03:21:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a02bbsm1868277e87.84.2025.06.03.03.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 03:21:48 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <dsgnmzswhpht4bewf5wld774riqxffojboujxdf4smutuzmuye@ugyhzv6m7mve>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
X-Proofpoint-GUID: iu3ws2TPhiimEm-W-dCTQbtqRVaAfLpQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MCBTYWx0ZWRfX0i/taZ390IOq
 fPcJu17eyWa4WvAEHm4N8XlhBowXEw060Yn/wTaIBEJQ45xNvT1N2Zecwf3PZYSe2IxCh33tlwJ
 5RVQoiaXRjtF+Ijp9t8UI1gFMfPRFRFMmVnqIayUm2uP2b+hqoWU6xMLvtKu0ZEjuwKINGZqr8k
 VmGuJNZmJ4qj0qPMyYqyzrh6EmDstmp/U0HvGqoTlKch4eiuEWoUFav/wnORk9MzsE6Swey+7wU
 d48yRg+91mRmuH8n7hYZmbq2d/0pM9md7OpUo2TUpoAaFS3g2/6k+1Ehz418rgcDhQzKaDQzWMI
 iw/rw2UBdnU9GV+fIQZp23M+ef4w6aRWozgXeeT3fzLq/hyyxVPt/6S0+vqWDZUUOtmEhRW1kmn
 NiCTrt6SCa7RnOS/sYbKNkgGh4JW19rwRQhrHx4q6ulmWAbGECNuUICq5hTE1Eni2HqVq0u9
X-Proofpoint-ORIG-GUID: iu3ws2TPhiimEm-W-dCTQbtqRVaAfLpQ
X-Authority-Analysis: v=2.4 cv=ZfQdNtVA c=1 sm=1 tr=0 ts=683eccbe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=kVcFuMI1zxpe4gVQ-GQA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030090
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

On Tue, Jun 03, 2025 at 03:10:09PM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 148 +++++++++++++++++++-----------
>  1 file changed, 94 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 0bb153a71353ca9eaca138ebbee4cd699414771d..501b6a1bad4a1fee832f15efa7caec136a669da5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>  		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
>  }
>  
> +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> +				      struct dpu_sw_pipe **single_pipe,
> +				      struct dpu_sw_pipe_cfg **single_pipe_cfg,
> +				      bool config_pipe)

Could you please describe, what does this function do? Why is it
returning the pipe or configuring a pipe?

> +{
> +	int i, valid_pipe = 0;
> +	struct dpu_sw_pipe *pipe;
> +
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
> +		if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
> +			valid_pipe++;
> +			if (valid_pipe > 1)
> +				return false;
> +			*single_pipe = &pstate->pipe[i];
> +			*single_pipe_cfg = &pstate->pipe_cfg[i];
> +		} else {
> +			if (!config_pipe)
> +				continue;
> +			pipe = &pstate->pipe[i];
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			pipe->sspp = NULL;
> +		}
> +	}
> +
> +	return true;
> +}
>  
>  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  				       struct drm_atomic_state *state,
> @@ -1028,15 +1055,15 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>  					  const struct msm_format *fmt,
>  					  uint32_t max_linewidth)
>  {
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
> -	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe *pipe, *prev_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
>  	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
>  	u16 max_tile_height = 1;
>  
> -	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> +	if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, true))
> +		return false;
> +
> +	if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe, &prev_pipe_cfg, false) ||
>  	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
>  		return false;
>  
> @@ -1050,11 +1077,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>  	if (MSM_FORMAT_IS_UBWC(prev_fmt))
>  		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
>  
> -	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -	r_pipe->sspp = NULL;
> -
>  	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
>  	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
>  	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> @@ -1183,6 +1205,51 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  	return 0;
>  }
>  
> +static int dpu_plane_try_multirect_in_stage(struct dpu_sw_pipe *pipe,
> +					    struct dpu_sw_pipe_cfg *pipe_cfg,
> +					    struct drm_plane_state *plane_state,
> +					    struct dpu_global_state *global_state,
> +					    struct drm_crtc *crtc,
> +					    struct dpu_rm_sspp_requirements *reqs)
> +{
> +	struct drm_plane *plane = plane_state->plane;
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_sw_pipe *r_pipe = pipe + 1;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
> +	int i;
> +
> +	for (i = 0; i < PIPES_PER_STAGE; i++, pipe++, pipe_cfg++) {
> +		if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> +			continue;
> +
> +		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> +		if (!pipe->sspp)
> +			return -ENODEV;
> +
> +		/*
> +		 * If current pipe is the first pipe in a stage, check
> +		 * multi-rect opportunity for the 2nd pipe in the stage.
> +		 * SSPP multi-rect mode cross stage is not supported.
> +		 */
> +		if (!i &&

Unroll the loop. I think I've asked a similar change in the review of
the previous patch.

> +		    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +		    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +						      pipe->sspp,
> +						      msm_framebuffer_format(plane_state->fb),
> +						      dpu_kms->catalog->caps->max_linewidth)) {
> +			goto stage_assinged;
> +		} else {
> +			/* multirect is not possible, use dedicated SSPP */
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		}
> +	}
> +
> +stage_assinged:
> +	return 0;
> +}
> +
>  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  					      struct dpu_global_state *global_state,
>  					      struct drm_atomic_state *state,
> @@ -1195,11 +1262,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
>  	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, stage_id, ret;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1209,11 +1274,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	prev_adjacent_pstate = prev_adjacent_plane_state ?
>  		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
>  
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1227,44 +1287,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>  
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> -		if (!prev_adjacent_pstate ||
> -		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> -						    dpu_kms->catalog->caps->max_linewidth)) {
> -			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -			if (!pipe->sspp)
> -				return -ENODEV;
> -
> -			r_pipe->sspp = NULL;
> -
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -		}
> -	} else {
> -		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -		if (!pipe->sspp)
> -			return -ENODEV;
> -
> -		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -						      pipe->sspp,
> -						      msm_framebuffer_format(plane_state->fb),
> -						      dpu_kms->catalog->caps->max_linewidth)) {
> -			/* multirect is not possible, use two SSPP blocks */
> -			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -			if (!r_pipe->sspp)
> -				return -ENODEV;
> -
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	if (prev_adjacent_pstate &&
> +	    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> +					    dpu_kms->catalog->caps->max_linewidth)) {

And this needs to take care of LMs. prev_adjacent_pstate should be
per-stage, otherwise you can end up sharing the SSPPs between stages
(which is not allowed).

> +		goto assigned;
> +	}
>  
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -		}
> +	for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> +		pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
> +		pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
> +		ret = dpu_plane_try_multirect_in_stage(pipe, pipe_cfg,
> +						       plane_state,
> +						       global_state,
> +						       crtc, &reqs);
> +		if (ret)
> +			return ret;
>  	}
>  
> +assigned:
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
