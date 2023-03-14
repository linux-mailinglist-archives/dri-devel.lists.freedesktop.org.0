Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FAC6B89C3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 05:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CAF10E6E6;
	Tue, 14 Mar 2023 04:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AEF10E6DA;
 Tue, 14 Mar 2023 04:44:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32E3WCbn014422; Tue, 14 Mar 2023 04:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OUgKNwk94Apxa8vxq4HoVI/tW3UQ4VXD0YUfnohnyJ4=;
 b=OWSujiNClWZ8h4pMDbgWVskh9p3vdxI5dFEG4YT1wciKPjY5H3s26VIZdJD3EOYcvaDT
 rqGF9Uke/Drq1d5XYBKZ920eA/NW5CxunTGBiSlq38dOwxFGbMIRHK3tNQDFpbph7q0Y
 TXtXjl3Z0p2cuGg864udQNlPe0UhVnTPf8/1ZK37PJsF58KNP3OrQHhGtYaxs5D/hPaa
 s4vTGVeisvtvF/MBBlY+6m+7tvNvbi8JClJ/bRXwqaGETNRiRS4dXtuft1XE4flYLixb
 zS/temctAaeOkb2AVYc3AFGm3h44zw+dtlq2Soyzja9mMlTWcpN0Zbq990Apc6u+ZUQt hw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pa1qgtjfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 04:44:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32E4ig12029376
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 04:44:42 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 21:44:41 -0700
Message-ID: <30019903-cc39-0466-26fc-6491d6a0a91c@quicinc.com>
Date: Mon, 13 Mar 2023 21:44:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 32/32] drm/msm/dpu: remove unused
 dpu_plane_validate_multirect_v2 function
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-33-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230310005704.1332368-33-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PB2u2q6xqKt1WCmfAevrRBJr3lY2GiFa
X-Proofpoint-GUID: PB2u2q6xqKt1WCmfAevrRBJr3lY2GiFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303140041
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



On 3/9/2023 4:57 PM, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> After cleaning up the older multirect support the function
> dpu_plane_validate_multirect_v2() is unused. Lets remove it.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

this needs your signed-off too.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 111 ----------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   7 --
>   2 files changed, 118 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 9a03d1cad0ee..bafa1dd1748b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -707,117 +707,6 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   					   fill_color, fmt);
>   }
>   
> -int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
> -{
> -	struct dpu_plane_state *pstate[R_MAX];
> -	const struct drm_plane_state *drm_state[R_MAX];
> -	struct drm_rect src[R_MAX], dst[R_MAX];
> -	struct dpu_plane *dpu_plane[R_MAX];
> -	const struct dpu_format *fmt[R_MAX];
> -	int i, buffer_lines;
> -	unsigned int max_tile_height = 1;
> -	bool parallel_fetch_qualified = true;
> -	bool has_tiled_rect = false;
> -
> -	for (i = 0; i < R_MAX; i++) {
> -		const struct msm_format *msm_fmt;
> -
> -		drm_state[i] = i ? plane->r1 : plane->r0;
> -		msm_fmt = msm_framebuffer_format(drm_state[i]->fb);
> -		fmt[i] = to_dpu_format(msm_fmt);
> -
> -		if (DPU_FORMAT_IS_UBWC(fmt[i])) {
> -			has_tiled_rect = true;
> -			if (fmt[i]->tile_height > max_tile_height)
> -				max_tile_height = fmt[i]->tile_height;
> -		}
> -	}
> -
> -	for (i = 0; i < R_MAX; i++) {
> -		int width_threshold;
> -
> -		pstate[i] = to_dpu_plane_state(drm_state[i]);
> -		dpu_plane[i] = to_dpu_plane(drm_state[i]->plane);
> -
> -		if (pstate[i] == NULL) {
> -			DPU_ERROR("DPU plane state of plane id %d is NULL\n",
> -				drm_state[i]->plane->base.id);
> -			return -EINVAL;
> -		}
> -
> -		src[i].x1 = drm_state[i]->src_x >> 16;
> -		src[i].y1 = drm_state[i]->src_y >> 16;
> -		src[i].x2 = src[i].x1 + (drm_state[i]->src_w >> 16);
> -		src[i].y2 = src[i].y1 + (drm_state[i]->src_h >> 16);
> -
> -		dst[i] = drm_plane_state_dest(drm_state[i]);
> -
> -		if (drm_rect_calc_hscale(&src[i], &dst[i], 1, 1) != 1 ||
> -		    drm_rect_calc_vscale(&src[i], &dst[i], 1, 1) != 1) {
> -			DPU_ERROR_PLANE(dpu_plane[i],
> -				"scaling is not supported in multirect mode\n");
> -			return -EINVAL;
> -		}
> -
> -		if (DPU_FORMAT_IS_YUV(fmt[i])) {
> -			DPU_ERROR_PLANE(dpu_plane[i],
> -				"Unsupported format for multirect mode\n");
> -			return -EINVAL;
> -		}
> -
> -		/**
> -		 * SSPP PD_MEM is split half - one for each RECT.
> -		 * Tiled formats need 5 lines of buffering while fetching
> -		 * whereas linear formats need only 2 lines.
> -		 * So we cannot support more than half of the supported SSPP
> -		 * width for tiled formats.
> -		 */
> -		width_threshold = dpu_plane[i]->catalog->caps->max_linewidth;
> -		if (has_tiled_rect)
> -			width_threshold /= 2;
> -
> -		if (parallel_fetch_qualified &&
> -		    drm_rect_width(&src[i]) > width_threshold)
> -			parallel_fetch_qualified = false;
> -
> -	}
> -
> -	/* Validate RECT's and set the mode */
> -
> -	/* Prefer PARALLEL FETCH Mode over TIME_MX Mode */
> -	if (parallel_fetch_qualified) {
> -		pstate[R0]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> -		pstate[R1]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> -
> -		goto done;
> -	}
> -
> -	/* TIME_MX Mode */
> -	buffer_lines = 2 * max_tile_height;
> -
> -	if (dst[R1].y1 >= dst[R0].y2 + buffer_lines ||
> -	    dst[R0].y1 >= dst[R1].y2 + buffer_lines) {
> -		pstate[R0]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
> -		pstate[R1]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
> -	} else {
> -		DPU_ERROR(
> -			"No multirect mode possible for the planes (%d - %d)\n",
> -			drm_state[R0]->plane->base.id,
> -			drm_state[R1]->plane->base.id);
> -		return -EINVAL;
> -	}
> -
> -done:
> -	pstate[R0]->pipe.multirect_index = DPU_SSPP_RECT_0;
> -	pstate[R1]->pipe.multirect_index = DPU_SSPP_RECT_1;
> -
> -	DPU_DEBUG_PLANE(dpu_plane[R0], "R0: %d - %d\n",
> -		pstate[R0]->pipe.multirect_mode, pstate[R0]->pipe.multirect_index);
> -	DPU_DEBUG_PLANE(dpu_plane[R1], "R1: %d - %d\n",
> -		pstate[R1]->pipe.multirect_mode, pstate[R1]->pipe.multirect_index);
> -	return 0;
> -}
> -
>   static int dpu_plane_prepare_fb(struct drm_plane *plane,
>   		struct drm_plane_state *new_state)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 7490ffd94d03..2784f8841260 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -87,13 +87,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   		uint32_t pipe, enum drm_plane_type type,
>   		unsigned long possible_crtcs);
>   
> -/**
> - * dpu_plane_validate_multirecti_v2 - validate the multirect planes
> - *				      against hw limitations
> - * @plane: drm plate states of the multirect pair
> - */
> -int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane);
> -
>   /**
>    * dpu_plane_color_fill - enables color fill on plane
>    * @plane:  Pointer to DRM plane object
