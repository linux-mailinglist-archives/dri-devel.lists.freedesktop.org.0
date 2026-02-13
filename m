Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKY0AnJZj2lxQgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:03:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EBD13877D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8028010E02B;
	Fri, 13 Feb 2026 17:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWGbedGk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcpU4Zxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EBE10E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 17:03:40 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DB8RsJ2093750
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 17:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YZdH6ExLJouxP5fU/TtsTdoL
 JnFhnqsdlD+R4tXVzho=; b=FWGbedGkWjAaYNkG70roD9icnTsPN5ESxS/YFIYf
 r5s9Ni6T+tUFImBNVwUppc0cL29KziDo5PpXCHbdl1YPd9MSr5CTE4LqbvwAUNDh
 +qqvyV9Ua8VP+sIYODj7pj6Yhig3HFgVxAXYCUAf0ceD91AHysuEKfOphpEBKvSs
 shV6wOZMFzr1G+jjgIDYieAECepyshv5J2qcaNtx5K614Z9+KZcinHSbSzHkItvd
 rezMqVKSlSvyu4Wje+hCd+GvDZa4Toc5HRJuPmZVE1/sRBAbgFTaROfx4JNoUWTH
 3VVSD8wYOLeoj+VXwoZ+mLHULDtSZwJTdcPMqzmJ+HaSXA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k6y4qn9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 17:03:39 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-948bcdc4aa9so5568213241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 09:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771002219; x=1771607019;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YZdH6ExLJouxP5fU/TtsTdoLJnFhnqsdlD+R4tXVzho=;
 b=ZcpU4Zxmj616euSUcJHhzmlORtblHtjfWkbw0W8K89PNIW/CIj3LFla/eSMoVLppHm
 OAmPmS4536M9Im48iNxmgkj6z1zsZaPJYlcGj1lp7Zx10gOq12xc5ZOzhKuQKFtSgfHx
 FMoQ6mba6GkVICYf4GNMv/KPPZE7SmCUEGFmAR4BLMFLbNK/6gg9mlzdbVeg5UwfRf68
 tRvadTFA7Gg1hnYopLlTMWxmoIBQRBFzMNCzpYQBxF+g/Gr0Tmk8++t3tayPT6xFjhsV
 WTCfa59/v9T1c4tieBI8dnUjf2hfighxBQXGX36qZZhyOV36HIDetNirHwPYAzLo7KOd
 EDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771002219; x=1771607019;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZdH6ExLJouxP5fU/TtsTdoLJnFhnqsdlD+R4tXVzho=;
 b=bCYfv8wUdfF8K5HtP2YCsxbMpVfWt+NmEW84rig+TBrbq35386ETwYdvs4+FB6Eg0P
 vhdTqMDzHBrFbRSWVv2raw7Ujw1SoUKZMawpHh4SCAqESw7Pi/umwwdj6krwUfMPSKIe
 E2ysW6fKJ16OMnW6U558GZuANVFYh7tNdKppe31vRNl638iAjZkEXM8twbQg5Lj+bMsm
 75MzNvsFSeJFJg/dZ/6m4qRfCaztU1Kj+SZWAehDLGBdnu/0Q5EPEYX8DeMy8VFCWaKk
 /XvDQpCcThMOM3arDWZEM1RYqxYLabuSywg3ly2kaCiOO8V08y9bHsJBZsOddqV6ay1y
 mIPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb2dwjFeP83ulDdDQlTyA3tSjKHKJ68TMHHXuOSwYPWhUKdPZoG4mcVt/L9v5Nsf02QFWjZwdl2Pw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0LGyssOOdCVqODXM1RoOq+OVu1SJ3wFGXEBorczytlDjixwLw
 69gHi+078mD/u+bkOfBJwNLeJTf0hdgUKyKVruX+zX9lOJ44oFPzGVl8t9VEP9gimeqBAnehtt4
 NNorgAfnPq9oiNY74OTfsaaiGywktU7ai2MqR7ExNWMjHHJIXxdMTABpIyVNC03bJkHorRvQ=
X-Gm-Gg: AZuq6aLgSDMplu9PEVRbtwHgpb6OD0aVC/MeUADJZZSx6sWJmEuo/sDc6KlfS1GvGTs
 +ONSVhTV/a3n3jXUkSal30pvKRJlfwUlB8jNfzyewVcpXtWrm3Gzk0n4oHt4XrTbKF+6HIaJCD9
 Sk3Pd4ojz+Rpk66JwbzX2nMnvI51WxGzOtCwepTfLyiEaSA5+UZHbD1tLgdiC7PhvIPyLS9st0n
 6rDWSW0VJB9yO8YgHSHVoCmqveDVbVSKad0FVLr5Q404onw7bISw4nMixnQYCqjcIUT5sJc52Cm
 6TTTP7UgXwtIxOj6G4oC6v7iSfG9OdT7Vu0W8eBRMD1LH3jAKsKH3PUmiq2z0jkFnH3ULCaNfon
 z/laC0qZIdMON6gExGHzRpR5IMAdZE94TmAwKf+aflkK7/l1FJ3gKTfMZ8iVwtrBO8P3cmLV2Ai
 cpUbRN5s12pLsg/gPyU+XwY7LRvpsKQkmhQVQ=
X-Received: by 2002:a05:6102:2ac1:b0:5f5:4f68:9f7e with SMTP id
 ada2fe7eead31-5fe2ad39bd3mr51938137.8.1771002219173; 
 Fri, 13 Feb 2026 09:03:39 -0800 (PST)
X-Received: by 2002:a05:6102:2ac1:b0:5f5:4f68:9f7e with SMTP id
 ada2fe7eead31-5fe2ad39bd3mr51857137.8.1771002218650; 
 Fri, 13 Feb 2026 09:03:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5635a3sm1717634e87.8.2026.02.13.09.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 09:03:37 -0800 (PST)
Date: Fri, 13 Feb 2026 19:03:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <pufuo7jq4olww3ksyawqkoee34cl4fhtpfh3sh2kfuimajswod@gv4rp6wsnrhx>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-2-5815158d3635@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-2-5815158d3635@linaro.org>
X-Authority-Analysis: v=2.4 cv=NsTcssdJ c=1 sm=1 tr=0 ts=698f596c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=sJjDOZd7UmfH7BeDoGEA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzMSBTYWx0ZWRfX3Gb+90ixi4hM
 DferVfmsryp+WDpetFuRZYYXuIwVaEKo64joi8bQ0NKrEK4dfDnJQlefatNV3BKnUV6+mxsyRn5
 IE0v5/m7EvIy5cyoiShAzDu2iSe8AVX9vDkFZYgmM0U3ddlCVy1DNERf+RRI/kS3C7XueIdxJ7M
 jBTgtsRPq28xSECB4ZdG0SXOlALzeZlMSkdZ10FMpgMwJYeCKxftw1k0hoKpRwShZ1visj7LbDl
 AAUie7FKFhlwkylJ0T3JJQEREPmvIcGkGXBLBNAEJIAsTShdLx48o30p/x94xmEySUHkxEntIbJ
 p2rCESU9C00EQ3Ku13IhkdcIVuP+xwPkXCBSlqMv/eDq2mLvfyBfwdUHzwFuzcxwAnvSriXMQlR
 nwPlT097T+T6+g8TvJZL7M2Fw1N/QC9sMIEKwxXqqNc/aH7CSFxyLSpTfpMel8ZZkAqY1dtUVC0
 WH+WPMe9lnIL/4o7hDg==
X-Proofpoint-GUID: CVuiIJ2eHJPH-QqvQ8IQBr0ySaMhYajK
X-Proofpoint-ORIG-GUID: CVuiIJ2eHJPH-QqvQ8IQBr0ySaMhYajK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130131
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 99EBD13877D
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:54:26PM +0800, Jun Nie wrote:
> Currently, mapping plane to SSPP occurs during the plane check phase for
> non-virtual plane case. The SSPP allocation and plane mapping occurs during
> crtc check phase for virtual plane case. Defer these SSPP operations until

Nit: CRTC

> CRTC check stage to unify the 2 cases, and ease later revisement for
> quad-pipe change.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 155 +++++++++++++-----------------
>  2 files changed, 66 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6bf7c46379aed..797296b14264e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1534,8 +1534,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			return rc;
>  	}
>  
> -	if (dpu_use_virtual_planes &&
> -	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> +	if (crtc_state->planes_changed || crtc_state->zpos_changed) {
>  		rc = dpu_crtc_reassign_planes(crtc, crtc_state);

dpu_crtc_reassing_planes() starts by freeing all SSPPs. It should not be
used in a non-virtual-plane case. I'd suggest duplicating the function
and stripping out all code and data related to virtual planes.

>  		if (rc < 0)
>  			return rc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 66f240ce29d07..be1a7fcf11b81 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1119,102 +1119,24 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>  										 plane);
>  	int ret = 0;
> -	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> -	const struct drm_crtc_state *crtc_state = NULL;
> -	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> +	struct drm_crtc_state *crtc_state = NULL;
>  
>  	if (new_plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
>  							   new_plane_state->crtc);
>  
> -	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> -
> -	if (!pipe->sspp)
> -		return -EINVAL;
> -
>  	ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
>  	if (ret)
>  		return ret;
>  
> -	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
> -	if (ret)
> -		return ret;
> -
>  	if (!new_plane_state->visible)
>  		return 0;
>  
> -	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -					      pipe->sspp,
> -					      msm_framebuffer_format(new_plane_state->fb),
> -					      max_linewidth)) {
> -		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
> -				" max_line:%u, can't use split source\n",
> -				DRM_RECT_ARG(&pipe_cfg->src_rect),
> -				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> -				max_linewidth);
> -		return -E2BIG;
> -	}
> -
> -	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> -}
> -
> -static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> -					  struct drm_atomic_state *state)
> -{
> -	struct drm_plane_state *plane_state =
> -		drm_atomic_get_plane_state(state, plane);
> -	struct drm_plane_state *old_plane_state =
> -		drm_atomic_get_old_plane_state(state, plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> -	struct drm_crtc_state *crtc_state = NULL;
> -	int ret, i;
> -
> -	if (IS_ERR(plane_state))
> -		return PTR_ERR(plane_state);
> -
> -	if (plane_state->crtc)
> -		crtc_state = drm_atomic_get_new_crtc_state(state,
> -							   plane_state->crtc);
> -
> -	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
> -	if (ret)
> -		return ret;
> -
> -	ret = dpu_plane_split(plane, plane_state, crtc_state);
> -	if (ret)
> -		return ret;
> -
> -	if (!plane_state->visible) {
> -		/*
> -		 * resources are freed by dpu_crtc_assign_plane_resources(),
> -		 * but clean them here.
> -		 */
> -		for (i = 0; i < PIPES_PER_PLANE; i++)
> -			pstate->pipe[i].sspp = NULL;
> -
> -		return 0;
> -	}
> -
>  	/*
> -	 * Force resource reallocation if the format of FB or src/dst have
> -	 * changed. We might need to allocate different SSPP or SSPPs for this
> -	 * plane than the one used previously.
> +	 * To trigger the callback of dpu_assign_plane_resources() to
> +	 * finish the sspp assignment or allocation and check.
>  	 */
> -	if (!old_plane_state || !old_plane_state->fb ||
> -	    old_plane_state->src_w != plane_state->src_w ||
> -	    old_plane_state->src_h != plane_state->src_h ||
> -	    old_plane_state->crtc_w != plane_state->crtc_w ||
> -	    old_plane_state->crtc_h != plane_state->crtc_h ||
> -	    msm_framebuffer_format(old_plane_state->fb) !=
> -	    msm_framebuffer_format(plane_state->fb))
> -		crtc_state->planes_changed = true;
> -
> +	crtc_state->planes_changed = true;

Why do we need to enforce this? Previously it was limited to the cases
when the plane has actually changed and required revalidation.

>  	return 0;
>  }
>  
> @@ -1261,9 +1183,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  					      struct dpu_global_state *global_state,
>  					      struct drm_atomic_state *state,
>  					      struct drm_plane_state *plane_state,
> +					      const struct drm_crtc_state *crtc_state,
>  					      struct drm_plane_state **prev_adjacent_plane_state)
>  {
> -	const struct drm_crtc_state *crtc_state = NULL;
>  	struct drm_plane *plane = plane_state->plane;
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>  	struct dpu_rm_sspp_requirements reqs;
> @@ -1273,10 +1195,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	const struct msm_format *fmt;
>  	int i, ret;
>  
> -	if (plane_state->crtc)
> -		crtc_state = drm_atomic_get_new_crtc_state(state,
> -							   plane_state->crtc);
> -
>  	pstate = to_dpu_plane_state(plane_state);
>  	for (i = 0; i < STAGES_PER_PLANE; i++)
>  		prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
> @@ -1288,6 +1206,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	if (!plane_state->fb)
>  		return -EINVAL;
>  
> +	ret = dpu_plane_split(plane, plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
>  	fmt = msm_framebuffer_format(plane_state->fb);
>  	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
>  	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
> @@ -1318,14 +1240,56 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>  }
>  
> +static int dpu_plane_assign_resources(struct drm_crtc *crtc,
> +				      struct dpu_global_state *global_state,
> +				      struct drm_atomic_state *state,
> +				      struct drm_plane_state *plane_state,
> +				      const struct drm_crtc_state *crtc_state,
> +				      struct drm_plane_state **prev_adjacent_plane_state)
> +{
> +	struct drm_plane *plane = plane_state->plane;
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> +	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	int ret;
> +
> +	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> +	if (!pipe->sspp)
> +		return -EINVAL;
> +
> +	ret = dpu_plane_split(plane, plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
> +	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +					      pipe->sspp,
> +					      msm_framebuffer_format(plane_state->fb),
> +					      dpu_kms->catalog->caps->max_linewidth)) {
> +		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
> +				" max_line:%u, can't use split source\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect),
> +				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> +				dpu_kms->catalog->caps->max_linewidth);
> +		return -E2BIG;
> +	}
> +
> +	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> +}
> +
>  int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  			       struct drm_atomic_state *state,
>  			       struct drm_crtc *crtc,
>  			       struct drm_plane_state **states,
>  			       unsigned int num_planes)
>  {
> -	unsigned int i;
>  	struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
> +	const struct drm_crtc_state *crtc_state = NULL;
> +	unsigned int i;
> +	int ret;
>  
>  	for (i = 0; i < num_planes; i++) {
>  		struct drm_plane_state *plane_state = states[i];
> @@ -1334,8 +1298,19 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  		    !plane_state->visible)
>  			continue;
>  
> -		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> +		if (plane_state->crtc)
> +			crtc_state = drm_atomic_get_new_crtc_state(state,
> +								   plane_state->crtc);
> +
> +		if (!dpu_use_virtual_planes)
> +			ret = dpu_plane_assign_resources(crtc, global_state,
> +							 state, plane_state,
> +							 crtc_state,
> +							 prev_adjacent_plane_state);

This is an overkill for the non-virtual case. We don't need adjancent
states, we don't need the array of plane state pointers, etc.

> +		else
> +			ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>  							     state, plane_state,
> +							     crtc_state,
>  							     prev_adjacent_plane_state);
>  		if (ret)
>  			return ret;
> @@ -1772,7 +1747,7 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
>  static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
>  	.prepare_fb = dpu_plane_prepare_fb,
>  	.cleanup_fb = dpu_plane_cleanup_fb,
> -	.atomic_check = dpu_plane_virtual_atomic_check,
> +	.atomic_check = dpu_plane_atomic_check,
>  	.atomic_update = dpu_plane_atomic_update,
>  };
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
