Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520CA3E7CB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 23:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4195B10E9EE;
	Thu, 20 Feb 2025 22:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VxQgHgsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F218A10E9EE;
 Thu, 20 Feb 2025 22:52:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KGDvlq002872;
 Thu, 20 Feb 2025 22:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +LhQJ2cNrP1sZLJLlXAaWHjyrUnROMmZ4qkqaQHwakk=; b=VxQgHgsbWKpz6md2
 3NgyegGgh8YQn7ZaGfdTI07PHI1hthK8BypmOOnPfgHT3g4y9GIMVpaKGOUp/osY
 2nd4m0KoNtzjyYbKXeff4AJy9Q2DpDVHzE4Zzfve7dM/ahGHnqqxtCvWK+FIFnQM
 zz83xUuDlz2oVuhe/pFIQ3kT1iSce2UZuSdLgS3JesuzsUoBxuYgRZwsAoMaLw0V
 yJVVdABE04GrmBuZoUpl0MJZrfa/FGCh8ONzGj3ydjh+5mc8cM0z9SBPRDs73b9e
 4cVoStbfT5hgLRiwxNxYN4as7CcUK/4gMJoXaBIIfKBgaJk5+2DPf+5xfa3NZJSl
 kpProA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2fp9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2025 22:52:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KMqpET009129
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2025 22:52:51 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 14:52:50 -0800
Message-ID: <4841020a-5320-4ce2-88b9-34f008febf62@quicinc.com>
Date: Thu, 20 Feb 2025 14:52:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] drm/msm/dpu: Add missing "fetch" name to
 set_active_pipes()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek
 <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Srini Kandagatla
 <srinivas.kandagatla@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-14-d201dcdda6a4@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250217-b4-sm8750-display-v2-14-d201dcdda6a4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gnqIgwloMtZpENg2vID9N5dlsa59Em0X
X-Proofpoint-GUID: gnqIgwloMtZpENg2vID9N5dlsa59Em0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200152
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



On 2/17/2025 8:41 AM, Krzysztof Kozlowski wrote:
> The set_active_pipes() callback configures CTL_FETCH_PIPE_ACTIVE and
> newer DPU v12.0 comes with CTL_PIPE_ACTIVE, thus rename it to
> set_active_fetch_pipes() to better match the purpose.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 +-
>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7191b1a6d41b3a96f956d199398f12b2923e8c82..7de79696a21e58a4c640f00265610ccce8b5d253 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -445,9 +445,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   
>   	uint32_t lm_idx;
>   	bool bg_alpha_enable = false;
> -	DECLARE_BITMAP(fetch_active, SSPP_MAX);
> +	DECLARE_BITMAP(active_fetch, SSPP_MAX);
>   
> -	memset(fetch_active, 0, sizeof(fetch_active));
> +	memset(active_fetch, 0, sizeof(active_fetch));
>   	drm_atomic_crtc_for_each_plane(plane, crtc) {
>   		state = plane->state;
>   		if (!state)
> @@ -464,7 +464,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
>   
> -		set_bit(pstate->pipe.sspp->idx, fetch_active);
> +		set_bit(pstate->pipe.sspp->idx, active_fetch);
>   		_dpu_crtc_blend_setup_pipe(crtc, plane,
>   					   mixer, cstate->num_mixers,
>   					   pstate->stage,
> @@ -472,7 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   					   &pstate->pipe, 0, stage_cfg);
>   
>   		if (pstate->r_pipe.sspp) {
> -			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
> +			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
>   			_dpu_crtc_blend_setup_pipe(crtc, plane,
>   						   mixer, cstate->num_mixers,
>   						   pstate->stage,
> @@ -492,8 +492,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		}
>   	}
>   
> -	if (ctl->ops.set_active_pipes)
> -		ctl->ops.set_active_pipes(ctl, fetch_active);
> +	if (ctl->ops.set_active_fetch_pipes)
> +		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
>   
>   	_dpu_crtc_program_lm_output_roi(crtc);
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 9d4866509e97c262006e15cf3e02a2f1ca851784..2e1e22589f730d1a60c3cbf6ad6b6aeaea38c6fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -675,8 +675,8 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	}
>   }
>   
> -static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
> -	unsigned long *fetch_active)
> +static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
> +					      unsigned long *fetch_active)
>   {
>   	int i;
>   	u32 val = 0;
> @@ -764,7 +764,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
>   
>   	if (mdss_ver->core_major_ver >= 7)
> -		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
> +		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
>   
>   	c->idx = cfg->id;
>   	c->mixer_count = mixer_count;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index f04ae0b1d986fa8f73e5bf96babfca3b4f3a0bf5..b8bd5b22c5f8dadd01c16c352efef4063f2614a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -243,7 +243,7 @@ struct dpu_hw_ctl_ops {
>   	void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
>   		enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
>   
> -	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
> +	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
>   		unsigned long *fetch_active);
>   };
>   
> 
> -- 
> 2.43.0
> 

