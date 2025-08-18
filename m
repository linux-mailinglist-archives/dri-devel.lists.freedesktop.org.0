Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117AB2B428
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 00:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C08B10E10F;
	Mon, 18 Aug 2025 22:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2j6AD8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B38010E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 22:39:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEUFgZ026407
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 22:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BY1hgucLdkNvv01XAwo6wMbgTIX6hQM/0OVtxlQdU3E=; b=N2j6AD8OZFna85lc
 5ERyzh/bddCRfREKd9K8KJlnazErW5hUvVlEWfUyyLTH7rp0pjbWOXZyH36leg/h
 HgHiY6yINFPTn9CKmzeVRR4bZoyrlqLamcp5qX0eCZt0pRdVf5c/Ns35PKzhD7we
 905oulXH+G9eiCLNlG72goh0tIDtatL+tjWfQvxSxe06m+PJh4s8vaEEnRSjG58u
 4yq6kM7MC4moR5eqwRgWFR3tmjAb3G4puOKwhzAR/i9/Ed5qpn04H8U5731YiY32
 TQrSdTQH/3kwZteoLoy2hEyNFM/U4KPhSO5zaPH6qsz0Dvi2OTK2ni54CAcO7xQG
 SAdWGA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyuntmye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 22:39:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e2e60c3e7so8183525b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 15:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755556793; x=1756161593;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BY1hgucLdkNvv01XAwo6wMbgTIX6hQM/0OVtxlQdU3E=;
 b=NH8Edqvr/hVwi8QZUnoSmDYR+VL6hJ+TQ3Hf1+2OLE9oX3pd7CdnD4HX0buM2U/pr7
 nbARACswtdFWhE+xDPCTDo+31lQkNKpFBP0qVNRlxK+welWst28IQVQk5y2wGI4RDtIi
 rVNBK4WeToHXtN52Qnzy/cnjUDT/vHRLNzYDaFPLHtpygDsRGRA4hru2/e0mrQJHAQ6J
 /znftf6tYVUWyj0fGDQWHi/lyyYD3vkcQuO/R2IjY4+RFoqzz6TWkrRzG5ypFicukdCf
 MWhPvstUaWszgzpIGcpI0cJZtS+D8jNRF5Ns4mj2zftb96jzEaSS3SiG7sLeZXbyHM/g
 Qcsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbEhq2oj5Ej5trHScJv6sYNFXkIQSG2TW/jJQJSvCpZkEZOPDVGT2jo6Z+YZ1gbTnFY19WXNH7FA8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcz+ZddIf8q36weDDKHONCYI01lApZ9mUztPmgqW9icx3f9/RB
 EiIxgE5d/3wg3Hnkv/zM3GrgWTi7ijoU52SmWIjoA8m2KMzlrxsWZ+/GItpBzOtwPXu6YHlyCWv
 42VMRvD4wU5u2eg0EfUQo02xYCMWYGrc7Sqea1Lj9IOoGlwykxu9tpz8UYEON3kXcFhyVhzk=
X-Gm-Gg: ASbGncvHvHFXeA/CjkTs3d6yny0tjlJH1RoMA+A4VeHMIUgIBpD/ZEtZ/+WWY8hdGer
 tWSLgN842XoaxOioyzd6CFu5ABIeT8piLKu+zzt6gwtfX/ctf+nHyUUpBUSbKA0VieovOg81PDg
 Wg4eSRqY2l9y9W1aeMoy3BKI0zUDZM4AHS55azNjc/znPkL9VCEaVrsWtaUYumQfWETE3dvqyKn
 43OVHCR2AIJr0bwDF1r2HIupYx85oa5ky93qmIYCAB5uqgKGQbWfHRy5oRXHJh/E8vyEFntgPtj
 IDHlpNK/c6BiqL+svUTjLkHXZqsvNi4zd34iOANWQ//jkAxaJUqh/kgM8zKwwaNplfqosIHL0Q7
 Oj5+XAOjYL0H842GHHDRK9w==
X-Received: by 2002:a05:6a20:3d89:b0:235:2cd8:6cb6 with SMTP id
 adf61e73a8af0-2430d491e52mr384030637.34.1755556793500; 
 Mon, 18 Aug 2025 15:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq6QzQ92Ms9MWn6tK7XtdYkvkgmvMQ1omaaWBGATwca5iSKcTllJphXcM5JkwhGnaMgdjCwA==
X-Received: by 2002:a05:6a20:3d89:b0:235:2cd8:6cb6 with SMTP id
 adf61e73a8af0-2430d491e52mr383994637.34.1755556793043; 
 Mon, 18 Aug 2025 15:39:53 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e81227473sm122042b3a.51.2025.08.18.15.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 15:39:52 -0700 (PDT)
Message-ID: <5572e441-750d-4f91-b08b-5e50f4f79ac4@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 15:39:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 08/13] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
 <20250801-v6-16-rc2-quad-pipe-upstream-v14-8-b626236f4c31@linaro.org>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-8-b626236f4c31@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zpaAGeQrGOBq0yv8rU2KFH4UkJKEFPIc
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a3abba cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=lKL-FtN6G_pLEYU0NVEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX2F3JfFYep9yW
 CNcoMfZUj53HbGmeu/kBKisi0cdQqTCj+73t+BFpSLBOld1pN6VlkqX8jbZmwvEBIsLpY1YEd4B
 /Q1/ERNy91E35m/oB8VhIB602j9Kw44KGN2KFLflQ4uNnpIrMjYNFuWh839gimlLif5h38VlQCw
 B3Y5PCM6GfA1eaoDVUA4dO0ThAVF3dPAiYixH6LRZ/NA8YQhOXfgFLU+OD0CiZCeFIT7zSPsDxW
 FMnyPHmfNp4g1AJN/L53qd8EWaami0i/KURHqv/3yH0Q4TUu7dkaD7HQVSqpN5RM6sf5qm62D3C
 RObYc2qDko+xEYTPTmh/Z054i/jvIq0VVvJaQrETB62EIOGb+kJYfk6KpD1FBvxb+x/tDF+pdqo
 3L4uVkTd
X-Proofpoint-ORIG-GUID: zpaAGeQrGOBq0yv8rU2KFH4UkJKEFPIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
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



On 8/1/2025 8:07 AM, Jun Nie wrote:
> The stage contains configuration for a mixer pair. Currently the plane
> supports just one stage and 2 pipes. Quad-pipe support will require
> handling 2 stages and 4 pipes at the same time. In preparation for that
> add a separate define, PIPES_PER_PLANE, to denote number of pipes that
> can be used by the plane.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  7 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
>   4 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 121bd0d304b308bcd7226784eda14d7c7f5a46f4..30fbd7565b82c6b6b13dc3ec0f4c91328a8e94c9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -472,8 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
>   
> -
> -		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		for (i = 0; i < PIPES_PER_PLANE; i++) {
>   			if (!pstate->pipe[i].sspp)
>   				continue;
>   			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
> @@ -1305,7 +1304,7 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
>   	return ret;
>   }
>   
> -#define MAX_CHANNELS_PER_CRTC 2
> +#define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
>   #define MAX_HDISPLAY_SPLIT 1080
>   
>   static struct msm_display_topology dpu_crtc_get_topology(
> @@ -1663,7 +1662,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>   			state->crtc_x, state->crtc_y, state->crtc_w,
>   			state->crtc_h);
>   
> -		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		for (i = 0; i < PIPES_PER_PLANE; i++) {
>   			if (!pstate->pipe[i].sspp)
>   				continue;
>   			seq_printf(s, "\tsspp[%d]:%s\n",
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 175639c8bfbb9bbd02ed35f1780bcbd869f08c36..9f75b497aa0c939296207d58dde32028d0a76a6d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,6 +34,7 @@
>   #define DPU_MAX_PLANES			4
>   #endif
>   
> +#define PIPES_PER_PLANE			2
>   #define PIPES_PER_STAGE			2
>   #ifndef DPU_MAX_DE_CURVES
>   #define DPU_MAX_DE_CURVES		3
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 5e8703b0e2abb89887a5661adb3542a0c10d2b32..55429f29a4b95594771d930efe42aaa4126f6f07 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -634,7 +634,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   		return;
>   
>   	/* update sspp */
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
> @@ -1158,7 +1158,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   		 * resources are freed by dpu_crtc_assign_plane_resources(),
>   		 * but clean them here.
>   		 */
> -		for (i = 0; i < PIPES_PER_STAGE; i++)
> +		for (i = 0; i < PIPES_PER_PLANE; i++)
>   			pstate->pipe[i].sspp = NULL;
>   
>   		return 0;
> @@ -1212,7 +1212,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   	pipe_cfg = &pstate->pipe_cfg[0];
>   	r_pipe_cfg = &pstate->pipe_cfg[1];
>   
> -	for (i = 0; i < PIPES_PER_STAGE; i++)
> +	for (i = 0; i < PIPES_PER_PLANE; i++)
>   		pstate->pipe[i].sspp = NULL;
>   
>   	if (!plane_state->fb)
> @@ -1345,7 +1345,7 @@ void dpu_plane_flush(struct drm_plane *plane)
>   		/* force 100% alpha */
>   		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>   	else {
> -		for (i = 0; i < PIPES_PER_STAGE; i++)
> +		for (i = 0; i < PIPES_PER_PLANE; i++)
>   			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
>   	}
>   
> @@ -1468,7 +1468,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>   			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
>   
>   	/* move the assignment here, to ease handling to another pairs later */
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
> @@ -1482,7 +1482,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>   
>   	pstate->plane_fetch_bw = 0;
>   	pstate->plane_clk = 0;
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
> @@ -1501,7 +1501,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>   	struct dpu_sw_pipe *pipe;
>   	int i;
>   
> -	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> +	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
>   		pipe = &pstate->pipe[i];
>   		if (!pipe->sspp)
>   			continue;
> @@ -1623,7 +1623,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>   
>   	drm_printf(p, "\tstage=%d\n", pstate->stage);
>   
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		pipe = &pstate->pipe[i];
>   		if (!pipe->sspp)
>   			continue;
> @@ -1680,7 +1680,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>   		return;
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 007f044499b99ac9c2e4b58e98e6add013a986de..1ef5a041b8acae270826f20ea9553cbfa35a9f82 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -31,8 +31,8 @@
>    */
>   struct dpu_plane_state {
>   	struct drm_plane_state base;
> -	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> -	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
> +	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
> +	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
>   	enum dpu_stage stage;
>   	bool needs_qos_remap;
>   	bool pending;
> 

