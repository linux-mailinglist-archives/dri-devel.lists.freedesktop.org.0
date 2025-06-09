Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11800AD2317
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 17:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABC610E07C;
	Mon,  9 Jun 2025 15:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhEo/yzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E934F10E3D2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 15:57:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599Zgpe018309
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 15:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9QXe55KACItI0i7FDMXcUe0T0+LRJHjP56/xHT4x6Bc=; b=KhEo/yzFaB69AE4q
 I3K/+aY8nZ8ELkuLTrdH/hIgDZo5eS3/7OB3vBX+dWKUN5eQ3+pFT5XhsHwktLWi
 OgwiMEm66bUdkPkeokJthT7q+mF5mr5IVA7toI/94bOoqX6ZY3IKGSuN1X6QCBoa
 0TnTjH2GDj+r3MHsOljKs2HHyvKnafcQ1tQvThRXzOCsA7kRwQEp1+DQTt7VWZEZ
 MbHTnulWUPQ7imwPsLY1/92RTSqwE1OvFb6lRZ26rc1vPs6vSUWd2i/jllJN8DZj
 aH1wuKjG3BipP+y8vzqSEf6/hIiBagBF43JaOkV6N+Ciec8nBZRovDbL/MRov19d
 XjSAXQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9ppfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:57:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fad9167e4cso95683876d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 08:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749484637; x=1750089437;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9QXe55KACItI0i7FDMXcUe0T0+LRJHjP56/xHT4x6Bc=;
 b=U8pv31clM5qAD8aIaiNFjZ7gd57VPxPCHTRCc5v51E7FiU+wDnTgPP7ejiv7Yko+/y
 wMhzpT7TwEDWY7TMUba8VwbrOVQ8IB/En4z9PTFp/hhLpp3eJYdkXI89btjn7wrsjD2S
 kRQg4cuGhfYHXJSGzsPpW2zu5+pnyi9jtNJo87XU9CfHYmJcAQpfPB+qp7w0LsSMIPbY
 yiORB+BHo4AsCSUhnmQ7OXCYrsU/QHuGHRdlPhPIqGqS4lIkcsGk1LaXjMH1ClUg6lom
 0A+BQahLvGzKfHbD1HtMyZNu6270NpjBHlEMxI7fyAJwaHKI97J+Jsu3CLc2gNsMEw3n
 SdBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIXOBDMhpaHBrPpmF7lRUDm+o3BpQzh8FIkXnpgxy5lw2ieo5QYR8IQNiGHafP3KC7HS/AoN1mX2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb122BRIBJBj3X4uxxf4/ZEYaxYFmvpRVb3I7MaUIf5/ucFK4Y
 dt7Y9UFA1de9aFTgezpycJ9EOfD2DAQiBO1788KZA18kTBCEOL1uOgGqvmNsrnB4RZv1kaNoFeS
 baqFNYSJA1muEv5sxRIYex1JGaocH/wON4HjjPUtsxy2QPJUbHUnESdDWM5MHWSfqj5EwfI4=
X-Gm-Gg: ASbGncu4ATC8QgRKEJKCTDHJxT0Fa0dPgwSlDoqrA6V6ay3DcmFDwU6NZJAOkoCJNjv
 3zOAdftvl0fV8BCPIkqWx67HobD9UmzFusq2bJvkDB5j6AlVBOgpbIwV6gMpxMJ2CyVpLw2VvWj
 09X+dWPnvjY3b0zErIoKCT/jd/lCBQe+Irb+yr5BfAwfZqku9cyRnxv9c37YphJbjaHCCWMHexP
 8NbYShY4V9944MVGpVO+/YqDYh1YbTvjJTuXka/mwsSq2Mgsgm0xJD8XmRSYSPanEOqEn76730f
 1420PZOruVWFd+PLsuxzG73vn25nkFsGlekWyEzW8/0qWz/UIscM9SL47azbpP/JTt6SvyUyki8
 WrOR9hbL2nQ==
X-Received: by 2002:ad4:5f4a:0:b0:6f8:997d:fc82 with SMTP id
 6a1803df08f44-6fb08f69daamr208068296d6.3.1749484636745; 
 Mon, 09 Jun 2025 08:57:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFywGxMqUKggoTh98FNuEH8UZe7lmLOppWokSX7UifuCCZgOLN9aQ9hXk+mmyakXKouzUfM2A==
X-Received: by 2002:ad4:5f4a:0:b0:6f8:997d:fc82 with SMTP id
 6a1803df08f44-6fb08f69daamr208067556d6.3.1749484636064; 
 Mon, 09 Jun 2025 08:57:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1cad4acsm10776041fa.68.2025.06.09.08.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:57:15 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:57:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 28/38] drm/msm/dp: add dp_mst_drm to manage DP MST
 bridge operations
Message-ID: <s433wb4q2jyppdnrqgplonos5m6ummee4vancr55nnjdnogvda@xi72bcq5adnx>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-28-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-msm-dp-mst-v2-28-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: -izHWzWCKNR_SPoG4BlPyf2ayuZO-iK7
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6847045d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=37si7oKWW-H12_D_0FkA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -izHWzWCKNR_SPoG4BlPyf2ayuZO-iK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExOCBTYWx0ZWRfX3MguJPOTX+nF
 m5tv7TnFNdUS/XirQjzo7rdqkXtLqYEpYIz+me++h7Es3wXXBK2iwX0tYtZjRMjdX0AT42exbgx
 55bamNdv7ybfooy0g2DlphXsi+n4F2j44FbB4AFkePKdEGQl7sBPbdnzkQTvtLqspfUO15nDGmw
 30JPnzJN3o4VM4mSQ2DJTuLI3OH8QrqjPV2zlFz0RA9vexYpsUq1JgX5+/9wpfy/O1uN2lUapv3
 9iP+JobO+XcvXOHAwAblWnmkehGZGI4fgxJbW+i4NZ8OAkDIM/FExolpAr8a+q1uJ0RqZNnHKFh
 7SY0kn6Uo5k2MZWGQo7245MQyluWBA0tRfMbQeBs55L58QGgy1cZMULk4oyEyywo9CFOS6atsu+
 sTA0PrpKTDrMja+KmrLZapSBFv+tIPGDv9WX+/ruQsYEGiDggir53JAVPI9seaihu9qrbFZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090118
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

On Mon, Jun 09, 2025 at 08:21:47PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add a new file dp_mst_drm to manage the DP MST bridge operations
> similar to the dp_drm file which manages the SST bridge operations.
> Each MST encoder creates one bridge and each bridge is bound to its
> own dp_panel abstraction to manage the operations of its pipeline.

I don't see this patch being improved from v1. Please follow the
feedback or provide a _good_ reason to ignore it.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile        |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.h |   3 +
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 501 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h | 100 +++++++
>  4 files changed, 606 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7a2ada6e2d74a902879e4f12a78ed475e5209ec2..d317e5ecda28dfd708ccdc5d3d27d4cf0b78b9d5 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -142,7 +142,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>  	dp/dp_link.o \
>  	dp/dp_panel.o \
>  	dp/dp_audio.o \
> -	dp/dp_utils.o
> +	dp/dp_utils.o \
> +	dp/dp_mst_drm.o
>  
>  msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 85eaa55fdcb7d9d8713849ec64a2cc9b08924425..9ca045ed2b4f1a9bc3254b733d1ce5332ebaba96 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -7,6 +7,7 @@
>  #define _DP_DISPLAY_H_
>  
>  #include "dp_panel.h"
> +#include "dp_mst_drm.h"
>  #include "disp/msm_disp_snapshot.h"
>  
>  #define DP_MAX_PIXEL_CLK_KHZ	675000
> @@ -24,6 +25,8 @@ struct msm_dp {
>  	bool is_edp;
>  	bool internal_hpd;
>  
> +	struct msm_dp_mst *msm_dp_mst;
> +
>  	struct msm_dp_audio *msm_dp_audio;
>  	bool psr_supported;
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a3ea34ae63511db0ac920cbeebe30c4e2320b8c4
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -0,0 +1,501 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/*
> + * Copyright © 2014 Red Hat.
> + *
> + * Permission to use, copy, modify, distribute, and sell this software and its
> + * documentation for any purpose is hereby granted without fee, provided that
> + * the above copyright notice appear in all copies and that both that copyright
> + * notice and this permission notice appear in supporting documentation, and
> + * that the name of the copyright holders not be used in advertising or
> + * publicity pertaining to distribution of the software without specific,
> + * written prior permission.  The copyright holders make no representations
> + * about the suitability of this software for any purpose.  It is provided "as
> + * is" without express or implied warranty.
> + *
> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> + * OF THIS SOFTWARE.
> + */
> +
> +#include "dp_mst_drm.h"
> +
> +static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
> +{
> +	struct msm_dp_mst_bridge_state *state;
> +
> +	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
> +
> +	return &state->base;
> +}
> +
> +static void msm_dp_mst_destroy_bridge_state(struct drm_private_obj *obj,
> +					    struct drm_private_state *state)
> +{
> +	struct msm_dp_mst_bridge_state *priv_state =
> +		to_msm_dp_mst_bridge_priv_state(state);
> +
> +	kfree(priv_state);
> +}
> +
> +static const struct drm_private_state_funcs msm_dp_mst_bridge_state_funcs = {
> +	.atomic_duplicate_state = msm_dp_mst_duplicate_bridge_state,
> +	.atomic_destroy_state = msm_dp_mst_destroy_bridge_state,
> +};
> +
> +/**
> + * dp_mst_find_vcpi_slots() - Find VCPI slots for this PBN value
> + * @mgr: manager to use
> + * @pbn: payload bandwidth to convert into slots.
> + *
> + * Calculate the number of VCPI slots that will be required for the given PBN
> + * value.
> + *
> + * RETURNS:
> + * The total slots required for this port, or error.
> + */
> +static int msm_dp_mst_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, int pbn)
> +{
> +	int num_slots;
> +	struct drm_dp_mst_topology_state *state;
> +
> +	state = to_drm_dp_mst_topology_state(mgr->base.state);
> +	num_slots = DIV_ROUND_UP(pbn, dfixed_trunc(state->pbn_div));
> +
> +	/* max. time slots - one slot for MTP header */
> +	if (num_slots > 63)
> +		return -ENOSPC;
> +	return num_slots;
> +}
> +
> +static void _msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
> +					 struct msm_dp_mst_bridge *mst_bridge,
> +					 struct drm_dp_mst_port *port)

As I wrote:

drm_dp_atomic_find_time_slots() should be called from atomic_check(),
this function must be dropped.

> +{
> +	int i;
> +	struct msm_dp_mst_bridge *msm_dp_bridge;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct drm_dp_mst_atomic_payload *payload;
> +	int prev_start = 0;
> +	int prev_slots = 0;
> +
> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> +
> +	if (!payload) {
> +		DRM_ERROR("mst bridge [%d] update_timeslots failed, null payload\n",
> +			  mst_bridge->id);
> +		return;
> +	}
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		msm_dp_bridge = &mst->mst_bridge[i];
> +		if (mst_bridge == msm_dp_bridge) {
> +			/*
> +			 * When a payload was removed make sure to move any payloads after it
> +			 * to the left so all payloads are aligned to the left.
> +			 */

:-(

> +			if (payload->vc_start_slot < 0) {
> +				// cache the payload
> +				prev_start = msm_dp_bridge->start_slot;
> +				prev_slots = msm_dp_bridge->num_slots;
> +				msm_dp_bridge->pbn = 0;
> +				msm_dp_bridge->start_slot = 1;
> +				msm_dp_bridge->num_slots = 0;
> +				msm_dp_bridge->vcpi = 0;
> +			} else { //add payload
> +				msm_dp_bridge->pbn = payload->pbn;
> +				msm_dp_bridge->start_slot = payload->vc_start_slot;
> +				msm_dp_bridge->num_slots = payload->time_slots;
> +				msm_dp_bridge->vcpi = payload->vcpi;
> +			}
> +		}
> +	}
> +
> +	// Now commit all the updated payloads
> +	for (i = 0; i < mst->max_streams; i++) {
> +		msm_dp_bridge = &mst->mst_bridge[i];
> +
> +		//Shift payloads to the left if there was a removed payload.
> +		if (payload->vc_start_slot < 0 && msm_dp_bridge->start_slot > prev_start)
> +			msm_dp_bridge->start_slot -= prev_slots;
> +
> +		msm_dp_display_set_stream_info(mst->msm_dp, msm_dp_bridge->msm_dp_panel,
> +					       msm_dp_bridge->id, msm_dp_bridge->start_slot,
> +					       msm_dp_bridge->num_slots,
> +					       msm_dp_bridge->pbn, msm_dp_bridge->vcpi);
> +		drm_dbg_dp(mst->msm_dp->drm_dev,
> +			   "conn:%d vcpi:%d start_slot:%d num_slots:%d, pbn:%d\n",
> +			   DP_MST_CONN_ID(msm_dp_bridge), msm_dp_bridge->vcpi,
> +			   msm_dp_bridge->start_slot,
> +			   msm_dp_bridge->num_slots, msm_dp_bridge->pbn);
> +	}
> +}
> +
> +static int _msm_dp_mst_bridge_pre_enable_part1(struct msm_dp_mst_bridge *dp_bridge,
> +					       struct drm_atomic_state *state)
> +{
> +	struct msm_dp *msm_dp = dp_bridge->display;
> +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
> +	struct drm_dp_mst_port *port = mst_conn->mst_port;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct drm_dp_mst_atomic_payload *payload;
> +	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;
> +	int pbn, slots;
> +	int rc = 0;
> +
> +	mst_state = drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
> +
> +	pbn = drm_dp_calc_pbn_mode(dp_panel->msm_dp_mode.drm_mode.clock,
> +				   (mst_conn->connector.display_info.bpc * 3) << 4);
> +
> +	slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, pbn);
> +
> +	drm_dbg_dp(msm_dp->drm_dev, "conn:%d pbn:%d, slots:%d\n", DP_MST_CONN_ID(dp_bridge),
> +		   pbn, slots);
> +
> +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> +	if (!payload || payload->time_slots <= 0) {
> +		DRM_ERROR("time slots not allocated for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
> +		rc = -EINVAL;
> +		return rc;
> +	}
> +
> +	drm_dp_mst_update_slots(mst_state, DP_CAP_ANSI_8B10B);
> +
> +	rc = drm_dp_add_payload_part1(&mst->mst_mgr, mst_state, payload);
> +	if (rc) {
> +		DRM_ERROR("payload allocation failure for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
> +		return rc;
> +	}
> +
> +	_msm_dp_mst_update_timeslots(mst, dp_bridge, port);
> +
> +	return rc;
> +}
> +
> +static void _msm_dp_mst_bridge_pre_enable_part2(struct msm_dp_mst_bridge *dp_bridge,
> +						struct drm_atomic_state *state)
> +{
> +	struct msm_dp *msm_dp = dp_bridge->display;
> +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
> +	struct drm_dp_mst_port *port = mst_conn->mst_port;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct drm_dp_mst_atomic_payload *payload;
> +
> +	drm_dp_check_act_status(&mst->mst_mgr);
> +
> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> +
> +	if (!payload) {
> +		DRM_ERROR("mst bridge [%d] null payload\n", dp_bridge->id);
> +		return;
> +	}
> +
> +	if (!payload->port) {
> +		DRM_ERROR("mst bridge [%d] null port\n", dp_bridge->id);
> +		return;
> +	}
> +
> +	if (!payload->port->connector) {
> +		DRM_ERROR("mst bridge [%d] part-2 failed, null connector\n",
> +			  dp_bridge->id);
> +		return;
> +	}
> +
> +	if (payload->vc_start_slot == -1) {
> +		DRM_ERROR("mst bridge [%d] part-2 failed, payload alloc part 1 failed\n",
> +			  dp_bridge->id);
> +		return;
> +	}
> +
> +	drm_dp_add_payload_part2(&mst->mst_mgr, payload);
> +
> +	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre enable part-2 complete\n",
> +		   dp_bridge->id);
> +}
> +
> +static void _msm_dp_mst_bridge_pre_disable_part1(struct msm_dp_mst_bridge *dp_bridge,
> +						 struct drm_atomic_state *state)
> +{
> +	struct msm_dp *msm_dp = dp_bridge->display;
> +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
> +	struct drm_dp_mst_port *port = mst_conn->mst_port;
> +	struct drm_dp_mst_topology_state *old_mst_state;
> +	struct drm_dp_mst_topology_state *new_mst_state;
> +	const struct drm_dp_mst_atomic_payload *old_payload;
> +	struct drm_dp_mst_atomic_payload *new_payload;
> +
> +	old_mst_state = drm_atomic_get_old_mst_topology_state(state, &mst->mst_mgr);
> +
> +	new_mst_state = drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
> +
> +	old_payload = drm_atomic_get_mst_payload_state(old_mst_state, port);
> +	new_payload = drm_atomic_get_mst_payload_state(new_mst_state, port);
> +
> +	if (!old_payload || !new_payload) {
> +		DRM_ERROR("mst bridge [%d] _pre disable part-1 failed, null payload\n",
> +			  dp_bridge->id);
> +		return;
> +	}
> +
> +	drm_dp_remove_payload_part1(&mst->mst_mgr, new_mst_state, new_payload);
> +	drm_dp_remove_payload_part2(&mst->mst_mgr, new_mst_state, old_payload, new_payload);
> +
> +	_msm_dp_mst_update_timeslots(mst, dp_bridge, port);
> +
> +	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre disable part-1 complete\n",
> +		   dp_bridge->id);
> +}
> +
> +static void _msm_dp_mst_bridge_pre_disable_part2(struct msm_dp_mst_bridge *dp_bridge)
> +{
> +	struct msm_dp *msm_dp = dp_bridge->display;
> +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
> +
> +	drm_dp_check_act_status(&mst->mst_mgr);
> +
> +	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre disable part-2 complete\n",
> +		   dp_bridge->id);
> +}
> +
> +static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
> +						struct drm_atomic_state *state)
> +{
> +	int rc = 0;
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp *dp;
> +	struct msm_dp_mst_bridge_state *msm_dp_bridge_state;
> +	struct msm_dp_mst *dp_mst;
> +
> +	if (!drm_bridge) {
> +		DRM_ERROR("Invalid params\n");
> +		return;
> +	}
> +
> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> +	msm_dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
> +	dp = bridge->display;
> +	dp_mst = dp->msm_dp_mst;
> +
> +	/* to cover cases of bridge_disable/bridge_enable without modeset */
> +	bridge->connector = msm_dp_bridge_state->connector;
> +	bridge->msm_dp_panel = msm_dp_bridge_state->msm_dp_panel;
> +
> +	if (!bridge->connector) {
> +		DRM_ERROR("Invalid connector\n");
> +		return;
> +	}
> +
> +	mutex_lock(&dp_mst->mst_lock);
> +	msm_dp_display_atomic_prepare(dp);
> +
> +	rc = _msm_dp_mst_bridge_pre_enable_part1(bridge, state);
> +	if (rc) {
> +		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
> +		msm_dp_display_unprepare(dp);
> +		mutex_unlock(&dp_mst->mst_lock);
> +		return;
> +	}
> +
> +	msm_dp_display_enable_helper(dp, bridge->msm_dp_panel);
> +
> +	_msm_dp_mst_bridge_pre_enable_part2(bridge, state);
> +
> +	mutex_unlock(&dp_mst->mst_lock);
> +
> +	drm_dbg_dp(dp->drm_dev, "conn:%d mode:%s fps:%d vcpi:%d slots:%d to %d\n",
> +		   DP_MST_CONN_ID(bridge), bridge->drm_mode.name,
> +		   drm_mode_vrefresh(&bridge->drm_mode),
> +		   bridge->vcpi, bridge->start_slot,
> +		   bridge->start_slot + bridge->num_slots);
> +}
> +
> +static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> +					     struct drm_atomic_state *state)
> +{
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp *dp;
> +	struct msm_dp_mst *mst;
> +
> +	if (!drm_bridge) {
> +		DRM_ERROR("Invalid params\n");
> +		return;
> +	}
> +
> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> +	if (!bridge->connector) {
> +		DRM_ERROR("Invalid connector\n");
> +		return;
> +	}
> +
> +	dp = bridge->display;
> +	mst = dp->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
> +
> +	_msm_dp_mst_bridge_pre_disable_part1(bridge, state);
> +
> +	msm_dp_display_disable_helper(dp, bridge->msm_dp_panel);
> +
> +	_msm_dp_mst_bridge_pre_disable_part2(bridge);
> +
> +	mutex_unlock(&mst->mst_lock);
> +
> +	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d disable complete\n", bridge->id,
> +		   DP_MST_CONN_ID(bridge));
> +}
> +
> +static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> +						  struct drm_atomic_state *state)
> +{
> +	int conn = 0;
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp *dp;
> +	struct msm_dp_mst *mst;
> +
> +	if (!drm_bridge) {
> +		DRM_ERROR("Invalid params\n");
> +		return;
> +	}
> +
> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> +	if (!bridge->connector) {
> +		DRM_ERROR("Invalid connector\n");
> +		return;
> +	}
> +
> +	conn = DP_MST_CONN_ID(bridge);
> +
> +	dp = bridge->display;
> +	mst = dp->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
> +
> +	msm_dp_display_atomic_post_disable_helper(dp, bridge->msm_dp_panel);
> +
> +	if (!dp->mst_active)
> +		msm_dp_display_unprepare(dp);
> +
> +	bridge->connector = NULL;
> +	bridge->msm_dp_panel =  NULL;
> +
> +	mutex_unlock(&mst->mst_lock);
> +
> +	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d post disable complete\n",
> +		   bridge->id, conn);
> +}
> +
> +static void msm_dp_mst_bridge_mode_set(struct drm_bridge *drm_bridge,
> +				       const struct drm_display_mode *mode,
> +				       const struct drm_display_mode *adjusted_mode)
> +{
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp_mst_bridge_state *dp_bridge_state;
> +	struct msm_dp *dp;
> +	struct msm_dp_panel *msm_dp_panel;
> +
> +	if (!drm_bridge || !mode || !adjusted_mode) {
> +		DRM_ERROR("Invalid params\n");
> +		return;
> +	}
> +
> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> +
> +	dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
> +	bridge->connector = dp_bridge_state->connector;
> +	bridge->msm_dp_panel = dp_bridge_state->msm_dp_panel;
> +
> +	msm_dp_panel = bridge->msm_dp_panel;
> +	dp = bridge->display;
> +
> +	memcpy(&bridge->drm_mode, adjusted_mode, sizeof(bridge->drm_mode));
> +	msm_dp_display_mode_set_helper(dp, mode, adjusted_mode, bridge->msm_dp_panel);
> +	msm_dp_panel->pbn = drm_dp_calc_pbn_mode(msm_dp_panel->msm_dp_mode.drm_mode.clock,
> +							  (msm_dp_panel->msm_dp_mode.bpp << 4));
> +	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d mode set complete %s\n", bridge->id,
> +		   DP_MST_CONN_ID(bridge), mode->name);
> +}
> +
> +/* DP MST Bridge APIs */
> +static const struct drm_bridge_funcs msm_dp_mst_bridge_ops = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset           = drm_atomic_helper_bridge_reset,
> +	.atomic_pre_enable   = msm_dp_mst_bridge_atomic_pre_enable,
> +	.atomic_disable      = msm_dp_mst_bridge_atomic_disable,
> +	.atomic_post_disable = msm_dp_mst_bridge_atomic_post_disable,
> +	.mode_set     = msm_dp_mst_bridge_mode_set,
> +};
> +
> +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder)
> +{
> +	int rc = 0;
> +	struct msm_dp_mst_bridge *bridge = NULL;
> +	struct msm_dp_mst_bridge_state *state;
> +	struct drm_device *dev;
> +	struct msm_dp_mst *mst = dp->msm_dp_mst;
> +	int i;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		if (!mst->mst_bridge[i].in_use) {
> +			bridge = &mst->mst_bridge[i];
> +			bridge->encoder = encoder;
> +			bridge->in_use = true;
> +			bridge->id = i;
> +			break;
> +		}
> +	}
> +
> +	if (i == mst->max_streams) {
> +		DRM_ERROR("mst supports only %d bridges\n", i);
> +		rc = -EACCES;
> +		goto end;
> +	}
> +
> +	dev = dp->drm_dev;
> +	bridge->display = dp;
> +	bridge->base.funcs = &msm_dp_mst_bridge_ops;
> +	bridge->base.encoder = encoder;
> +	bridge->base.type = dp->connector_type;
> +	bridge->base.ops = DRM_BRIDGE_OP_MODES;
> +	drm_bridge_add(&bridge->base);
> +
> +	rc = drm_bridge_attach(encoder, &bridge->base, NULL, 0);
> +	if (rc) {
> +		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
> +		goto end;
> +	}
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state) {
> +		rc = -ENOMEM;
> +		goto end;
> +	}
> +
> +	drm_atomic_private_obj_init(dev, &bridge->obj,
> +				    &state->base,
> +				    &msm_dp_mst_bridge_state_funcs);
> +
> +	drm_dbg_dp(dp->drm_dev, "mst drm bridge init. bridge id:%d\n", i);
> +
> +	return 0;
> +
> +end:
> +	return rc;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..cdde59da7bb937ad67fa818a728082f8fd43a3a6
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + * Permission to use, copy, modify, distribute, and sell this software and its
> + * documentation for any purpose is hereby granted without fee, provided that
> + * the above copyright notice appear in all copies and that both that copyright
> + * notice and this permission notice appear in supporting documentation, and
> + * that the name of the copyright holders not be used in advertising or
> + * publicity pertaining to distribution of the software without specific,
> + * written prior permission.  The copyright holders make no representations
> + * about the suitability of this software for any purpose.  It is provided "as
> + * is" without express or implied warranty.
> + *
> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> + * OF THIS SOFTWARE.
> + */
> +
> +#ifndef _DP_MST_DRM_H_
> +#define _DP_MST_DRM_H_
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/errno.h>
> +#include <linux/version.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_fixed.h>
> +#include <drm/drm_connector.h>
> +#include <drm/display/drm_dp_helper.h>
> +#include <drm/display/drm_dp_mst_helper.h>
> +
> +#include "dp_panel.h"
> +#include "dp_display.h"
> +
> +#define DP_MST_CONN_ID(bridge) ((bridge)->connector ? \
> +		(bridge)->connector->base.id : 0)
> +
> +struct msm_dp_mst_bridge {
> +	struct drm_bridge base;
> +	struct drm_private_obj obj;
> +	u32 id;
> +
> +	bool in_use;
> +
> +	struct msm_dp *display;
> +	struct drm_encoder *encoder;
> +
> +	struct drm_display_mode drm_mode;
> +	struct drm_connector *connector;
> +	struct msm_dp_panel *msm_dp_panel;
> +
> +	int vcpi;
> +	int pbn;
> +	int num_slots;
> +	int start_slot;

All of these should go to the bridge_state or be dropped.

> +};
> +
> +struct msm_dp_mst_bridge_state {
> +	struct drm_private_state base;
> +	struct drm_connector *connector;
> +	struct msm_dp_panel *msm_dp_panel;
> +	int num_slots;
> +};
> +
> +struct msm_dp_mst {
> +	struct drm_dp_mst_topology_mgr mst_mgr;
> +	struct msm_dp_mst_bridge *mst_bridge;
> +	struct msm_dp *msm_dp;
> +	u32 max_streams;
> +	struct mutex mst_lock;
> +};
> +
> +struct msm_dp_mst_connector {
> +	struct drm_connector connector;
> +	struct drm_dp_mst_port *mst_port;
> +	struct msm_dp *msm_dp;
> +	struct msm_dp_panel *dp_panel;
> +};
> +
> +#define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
> +#define to_msm_dp_mst_bridge_priv(x) \
> +		container_of((x), struct msm_dp_mst_bridge, obj)
> +#define to_msm_dp_mst_bridge_priv_state(x) \
> +		container_of((x), struct msm_dp_mst_bridge_state, base)
> +#define to_msm_dp_mst_bridge_state(x) \
> +		to_msm_dp_mst_bridge_priv_state((x)->obj.state)
> +#define to_msm_dp_mst_connector(x) \
> +		container_of((x), struct msm_dp_mst_connector, connector)

Please check, which of these structures and conversion macros can go
into the source file because they are not used outside of it.

> +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
> +
> +#endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
