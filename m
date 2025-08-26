Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35E7B37167
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 19:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D379010E6AC;
	Tue, 26 Aug 2025 17:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2898ijb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7C210E6AC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:36:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QC4EOY006105
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f17eY4ZEtWToQVINE0JoOBhcXHndlaC3tgPDaZ5NpfI=; b=a2898ijbndyrp6we
 6qZOLZnNjV1tkT9Uc+XmUO4esC3FALDewXKBUyYxCVQgHZ4G0qWK11UZ+f7eacaC
 ZqGgQJHz0Fr/jV5GGQKx7o+dLQ8G4qiHEtcTAToNeV8QS7FyBSr8LPPo4SxOjljk
 6nD6JPWp672PmYhuxSmiLTLl+75HQd7iuezU1AlLl8XLfUXwuZN+1yAwOgev3pdy
 wW4JSKw8ti6UtfZl+Gt88xnE/gh0pfLqrKwN3cOxP43fd9tIBGNp9v2ICHZHcNHz
 XeWX+V06CvQDHMG/c1kgZhaEcWB8xNtCyGRXje2j8hvv6224nsxD52cGC/b7ovaQ
 fq5O9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpev6v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:36:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70ddadde46bso8343046d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 10:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756229815; x=1756834615;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f17eY4ZEtWToQVINE0JoOBhcXHndlaC3tgPDaZ5NpfI=;
 b=BY04gCCpFP8lH8vctP0jzZcyZ2nG8hyFgVzabXtZ5hay+7PzRSdtFRQ+QTYbvQFO1t
 BNCK/sDbrnAPJgrMUmqmHknV7seGNpAKR4JNoj33AIDSmse50dn8xincRmUnL/kKia/H
 3I43fZU2Qf51WEvY8TT1EZX2yU6j+li3yRorJNvOjBhL7NZSSZu/CBtvOSsPAJ7jsHpL
 iy4Kmi7zQSFG1AQq/BjAHnTxlY8CnCjfNQ8rL473EsepGhGtHQINgzVV/ZkOJoGixHq/
 2rSV6hO/nL/gQuzvoiYER9TT2R9vcvD7P9itSihZL3LQN4XAJ7TqiG+JOics4X12WeL2
 me9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP0Fg4MCChAw0qc9/XwLrZTTHwuIOKZQY0yWkv6rKIipYef/x3nlNTtd9ZwGm2uKYADuuIJzjpum0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4D6DZ63YZcGnUXpBScEWp962A/y125oUTfeDJk4AbkzbR2PaN
 tAuKG3IhTk5ZzNmpzmW2HTsWOMFcAqR4W68rEN1BB71TjTqp9KLklhMqAP/7UoeLc3A3nJiHEgx
 qYlaEmL+03/3S7+EaPuInsqKpLpjudMysRdjabHbHy+XWZXTfNRZ4YZvhfQdWt68ejUSQNsM=
X-Gm-Gg: ASbGnctqCrDsxKePFzeE5d4E5Eose3rVuhfMYT2Hf0MwMbh45ligqCeSCrxwBiMM19O
 SWE9n+5gz5EBR2numsT3wz7yqSFn2pMBN1T52yWLW9Pomt9v0U92brX+omJtiSnzJRVmyWWmSek
 VqWR4Q5p4tcRd2J5JLXEURhAySv8hqtuWF/gnheCqctExIXCyZZmrvAbNKZDKtgaZ0ym6dc5EBt
 TtoOit6D45Xh0Qfad2WQpJvYebDfHge5GFAgBhzgzTezt65h2BL6NOrr7EwwcqtkjLVK1BxhWMa
 1WooPMtJqW3YlxHOptvOoboodrWfmQ25AGTPuuxhwGi4pnbZg9k/Pnwgq8myDpchPuTY/3ud1JJ
 SJwQoGmMBmWHKgqkuYf9kQrK7c9VzmQ1z6dN0B5xH5dKFHDD9oREL
X-Received: by 2002:a05:6214:f2c:b0:70d:a9c5:1d69 with SMTP id
 6a1803df08f44-70da9c528a6mr123263016d6.53.1756229814230; 
 Tue, 26 Aug 2025 10:36:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRagHVjerTUgz59TdGFX10tvV1NLQnk5HahCHgL9gEPoa/C8zoXOFpFd7uOdfg2GEGcPS6MQ==
X-Received: by 2002:a05:6214:f2c:b0:70d:a9c5:1d69 with SMTP id
 6a1803df08f44-70da9c528a6mr123262536d6.53.1756229813507; 
 Tue, 26 Aug 2025 10:36:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35bffafcsm2416045e87.17.2025.08.26.10.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 10:36:52 -0700 (PDT)
Date: Tue, 26 Aug 2025 20:36:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 28/38] drm/msm/dp: add dp_mst_drm to manage DP MST
 bridge operations
Message-ID: <h22zh2zcgdcv2k3mxc5rslpfd3xnerjfailehtaw3wbtpnisy3@s56vudwvoh4q>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-28-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825-msm-dp-mst-v3-28-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: Qqt5c82bJFkwEX-3eeX7Fj-rXgVNR7Ul
X-Proofpoint-ORIG-GUID: Qqt5c82bJFkwEX-3eeX7Fj-rXgVNR7Ul
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68adf0b7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5RzYBUBdIxyJWEM-9xwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX4d2tv5lsmZnx
 50CPPvtsgKVkZ5NIFPQQO/Gt4I/kGHG+cW91JhG0Z7PvsVWwDn90kCNCspfqfI3tOG0ovxaOlbx
 R+Mr21N5kxCtqAmao8FtsX4ORut52y4Cfmcp0gkJJXXE+WMQX6PeBwipdVDhO+5doTd4Oeogkj/
 rikxDM/E+zhIN3UzpeZD8XrK9wbwOcS10dJSyh9/lhLuNVbm2V2lfmAfBuJutj+EvvoI2hYAbkJ
 wod9vajnmOW8ER2rFfDpqRVFFT22dunpwb+RumvP9exx4HrxYU48Vs3Qpy7xp/8+Nkov6T7jOAC
 S4DGoUJqt7muQLrNh4oCPwJe1K96ToRFS+BO7kRfaLfMjibuHZfuoUCWCnG57mlv9ikMYHUEGqU
 ap9A+MlS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
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

On Mon, Aug 25, 2025 at 10:16:14PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add a new file dp_mst_drm to manage the DP MST bridge operations
> similar to the dp_drm file which manages the SST bridge operations.
> Each MST encoder creates one bridge and each bridge is bound to its
> own dp_panel abstraction to manage the operations of its pipeline.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile        |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.h |   3 +
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 556 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  86 ++++++
>  4 files changed, 647 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 0c0dfb25f01b193b10946fae20138caf32cf0ed2..a61fa2637ff317ed4dee715de5d12a7befa987f5 100644
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
> index d5889b801d190b6f33b180ead898c1e4ebcbf8f3..f958de6244b556df5452a5dbec6899fb79a57193 100644
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
> @@ -25,6 +26,8 @@ struct msm_dp {
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
> index 0000000000000000000000000000000000000000..73de29136801ef5f45e0b2d09280fe113021b68c
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -0,0 +1,556 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/*
> + * Copyright © 2014 Red Hat.

Is it based on? Using the code? C&P?

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

Why? Anyway, MIT licence would be absorbed into GPL-2.0-only (or it
should be GPL-2.0-only OR MIT)

> + */
> +
> +#include "dp_mst_drm.h"
> +
> +#define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
> +#define to_msm_dp_mst_bridge_priv(x) \

Unused

> +		container_of((x), struct msm_dp_mst_bridge, obj)
> +#define to_msm_dp_mst_bridge_state_priv(x) \

Why is it _priv? There is no 'private' bridge state.

> +		container_of((x), struct msm_dp_mst_bridge_state, base)
> +#define to_msm_dp_mst_bridge_state(x) \
> +		to_msm_dp_mst_bridge_state_priv((x)->obj.state)
> +#define to_msm_dp_mst_connector(x) \
> +		container_of((x), struct msm_dp_mst_connector, connector)
> +
> +#define DP_MST_CONN_ID(bridge) ((bridge)->connector ? \
> +		(bridge)->connector->base.id : 0)
> +
> +#define MAX_DPCD_TRANSACTION_BYTES 16
> +
> +static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
> +{
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +
> +	mst_bridge_state = kmemdup(obj->state, sizeof(*mst_bridge_state), GFP_KERNEL);
> +	if (!mst_bridge_state)
> +		return NULL;
> +
> +	__drm_atomic_helper_private_obj_duplicate_state(obj, &mst_bridge_state->base);
> +
> +	return &mst_bridge_state->base;
> +}
> +
> +static void msm_dp_mst_destroy_bridge_state(struct drm_private_obj *obj,
> +					    struct drm_private_state *state)
> +{
> +	struct msm_dp_mst_bridge_state *mst_bridge_state =
> +		to_msm_dp_mst_bridge_state_priv(state);
> +
> +	kfree(mst_bridge_state);
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

Return: foo, abc or def

> + * The total slots required for this port, or error.
> + */
> +static int msm_dp_mst_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, int pbn)
> +{
> +	int num_slots;
> +	struct drm_dp_mst_topology_state *state;
> +
> +	state = to_drm_dp_mst_topology_state(mgr->base.state);
> +	num_slots = DIV_ROUND_UP(pbn, dfixed_trunc(state->pbn_div));

Don't you get those as payload->time_slots ?

> +
> +	/* max. time slots - one slot for MTP header */
> +	if (num_slots > 63)
> +		return -ENOSPC;
> +	return num_slots;
> +}
> +
> +static void msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
> +					 struct msm_dp_mst_bridge *mst_bridge,
> +					 struct drm_atomic_state *state,
> +					 struct drm_dp_mst_port *port)
> +{
> +	int i;
> +	struct msm_dp_mst_bridge *msm_dp_bridge;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct drm_dp_mst_atomic_payload *payload;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
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
> +		msm_dp_bridge = mst->mst_bridge[i];
> +		if (mst_bridge == msm_dp_bridge) {
> +			mst_bridge_state = to_msm_dp_mst_bridge_state(msm_dp_bridge);
> +			/*
> +			 * When a payload was removed make sure to move any payloads after it
> +			 * to the left so all payloads are aligned to the left.
> +			 */

The comment is not valid anymore, as far as I understand.

> +			if (payload->vc_start_slot < 0) {
> +				// cache the payload
> +				prev_start = mst_bridge_state->start_slot;
> +				prev_slots = mst_bridge_state->num_slots;
> +				mst_bridge_state->pbn = 0;
> +				mst_bridge_state->start_slot = 1;
> +				mst_bridge_state->num_slots = 0;
> +				mst_bridge_state->vcpi = 0;
> +			} else { //add payload
> +				mst_bridge_state->pbn = payload->pbn;
> +				mst_bridge_state->start_slot = payload->vc_start_slot;
> +				mst_bridge_state->num_slots = payload->time_slots;
> +				mst_bridge_state->vcpi = payload->vcpi;

I still see a lot of manual slot management here. Can't we use the
struct drm_dp_mst_atomic_payload directly instead of copying and caching
everything?

> +			}
> +		}
> +	}
> +
> +	// Now commit all the updated payloads
> +	for (i = 0; i < mst->max_streams; i++) {
> +		msm_dp_bridge = mst->mst_bridge[i];
> +
> +		mst_bridge_state = to_msm_dp_mst_bridge_state(msm_dp_bridge);
> +		//Shift payloads to the left if there was a removed payload.
> +		if (payload->vc_start_slot < 0 && mst_bridge_state->start_slot > prev_start)
> +			mst_bridge_state->start_slot -= prev_slots;

Well... Don't MST helpers do this already for you? I see corresponding
part in drm_dp_remove_payload_part2().

> +
> +		msm_dp_display_set_stream_info(mst->msm_dp, msm_dp_bridge->msm_dp_panel,
> +					       msm_dp_bridge->id, mst_bridge_state->start_slot,
> +					       mst_bridge_state->num_slots,
> +					       mst_bridge_state->pbn, mst_bridge_state->vcpi);
> +		drm_dbg_dp(mst->msm_dp->drm_dev,
> +			   "conn:%d vcpi:%d start_slot:%d num_slots:%d, pbn:%d\n",
> +			   DP_MST_CONN_ID(msm_dp_bridge), mst_bridge_state->vcpi,
> +			   mst_bridge_state->start_slot,
> +			   mst_bridge_state->num_slots, mst_bridge_state->pbn);
> +	}
> +}
> +
> +static int msm_dp_mst_bridge_pre_enable_part1(struct msm_dp_mst_bridge *dp_bridge,
> +					       struct drm_atomic_state *state)
> +{
> +	struct msm_dp *dp_display = dp_bridge->display;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
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

payload->time_slots ?

> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d pbn:%d, slots:%d\n", DP_MST_CONN_ID(dp_bridge),
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
> +	msm_dp_mst_update_timeslots(mst, dp_bridge, state, port);
> +
> +	return rc;
> +}
> +
> +static void _msm_dp_mst_bridge_pre_enable_part2(struct msm_dp_mst_bridge *dp_bridge,
> +						struct drm_atomic_state *state)
> +{
> +	struct msm_dp *dp_display = dp_bridge->display;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
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

Kill all defensive coding. If something can not happen, there is no need
to check for it.

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
> +	drm_dbg_dp(dp_display->drm_dev, "mst bridge [%d] _pre enable part-2 complete\n",
> +		   dp_bridge->id);
> +}
> +
> +static void msm_dp_mst_bridge_pre_disable_part1(struct msm_dp_mst_bridge *dp_bridge,
> +						 struct drm_atomic_state *state)
> +{
> +	struct msm_dp *dp_display = dp_bridge->display;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
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
> +	msm_dp_mst_update_timeslots(mst, dp_bridge, state, port);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "mst bridge [%d] _pre disable part-1 complete\n",
> +		   dp_bridge->id);
> +}
> +
> +static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
> +						struct drm_atomic_state *state)
> +{
> +	int rc = 0;
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	struct msm_dp_mst *dp_mst;
> +
> +	if (!drm_bridge) {
> +		DRM_ERROR("Invalid params\n");
> +		return;
> +	}
> +
> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> +	mst_bridge_state = to_msm_dp_mst_bridge_state(bridge);
> +	dp_display = bridge->display;
> +	dp_mst = dp_display->msm_dp_mst;
> +
> +	/* to cover cases of bridge_disable/bridge_enable without modeset */
> +	bridge->connector = mst_bridge_state->connector;
> +	bridge->msm_dp_panel = mst_bridge_state->msm_dp_panel;
> +
> +	if (!bridge->connector) {
> +		DRM_ERROR("Invalid connector\n");
> +		return;
> +	}
> +
> +	mutex_lock(&dp_mst->mst_lock);
> +	msm_dp_display_atomic_prepare(dp_display);
> +
> +	rc = msm_dp_mst_bridge_pre_enable_part1(bridge, state);
> +	if (rc) {
> +		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
> +		msm_dp_display_unprepare(dp_display);
> +		mutex_unlock(&dp_mst->mst_lock);
> +		return;
> +	}
> +
> +	msm_dp_display_enable_helper(dp_display, bridge->msm_dp_panel);
> +
> +	_msm_dp_mst_bridge_pre_enable_part2(bridge, state);
> +
> +	mutex_unlock(&dp_mst->mst_lock);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d mode:%s fps:%d vcpi:%d slots:%d to %d\n",
> +		   DP_MST_CONN_ID(bridge), bridge->msm_dp_panel->msm_dp_mode.drm_mode.name,
> +		   drm_mode_vrefresh(&bridge->msm_dp_panel->msm_dp_mode.drm_mode),
> +		   mst_bridge_state->vcpi, mst_bridge_state->start_slot,
> +		   mst_bridge_state->start_slot + mst_bridge_state->num_slots);
> +}
> +
> +static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> +					     struct drm_atomic_state *state)
> +{
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp *dp_display;
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
> +	dp_display = bridge->display;
> +	mst = dp_display->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
> +
> +	msm_dp_mst_bridge_pre_disable_part1(bridge, state);
> +
> +	msm_dp_display_disable_helper(dp_display, bridge->msm_dp_panel);
> +
> +	drm_dp_check_act_status(&mst->mst_mgr);
> +
> +	mutex_unlock(&mst->mst_lock);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "mst bridge:%d conn:%d disable complete\n", bridge->id,
> +		   DP_MST_CONN_ID(bridge));
> +}
> +
> +static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> +						  struct drm_atomic_state *state)
> +{
> +	int conn = 0;
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp *dp_display;
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
> +	dp_display = bridge->display;
> +	mst = dp_display->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
> +
> +	msm_dp_display_atomic_post_disable_helper(dp_display, bridge->msm_dp_panel);
> +
> +	if (!dp_display->mst_active)
> +		msm_dp_display_unprepare(dp_display);
> +
> +	bridge->connector = NULL;
> +	bridge->msm_dp_panel =  NULL;
> +
> +	mutex_unlock(&mst->mst_lock);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "mst bridge:%d conn:%d post disable complete\n",
> +		   bridge->id, conn);
> +}
> +
> +static int msm_dp_mst_bridge_atomic_check(struct drm_bridge *drm_bridge,
> +				struct drm_bridge_state *bridge_state,
> +				struct drm_crtc_state *crtc_state,
> +				struct drm_connector_state *conn_state)
> +{
> +	struct drm_atomic_state *state = crtc_state->state;
> +	struct drm_connector *connector = conn_state->connector;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_mst *mst;
> +	int rc = 0, pbn, slots;
> +	u32 bpp;
> +
> +	if (!drm_atomic_crtc_needs_modeset(crtc_state) || !crtc_state->enable) {
> +		return 0;
> +	}
> +
> +	mst_conn = to_msm_dp_mst_connector(connector);
> +	dp_display = mst_conn->msm_dp;
> +	mst = dp_display->msm_dp_mst;
> +
> +	bpp = connector->display_info.bpc * 3;
> +
> +	if (!bpp)
> +		bpp = 24;
> +
> +	pbn = drm_dp_calc_pbn_mode(crtc_state->mode.clock, bpp << 4);
> +
> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> +	if (IS_ERR(mst_state))
> +		return PTR_ERR(mst_state);
> +
> +	if (!dfixed_trunc(mst_state->pbn_div)) {
> +		mst_state->pbn_div =
> +			drm_dp_get_vc_payload_bw(mst_conn->dp_panel->link_info.rate,
> +						mst_conn->dp_panel->link_info.num_lanes);
> +	}
> +
> +	slots = drm_dp_atomic_find_time_slots(state, &mst->mst_mgr, mst_conn->mst_port, pbn);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "add slots, conn:%d pbn:%d slots:%d rc:%d\n",
> +			connector->base.id, pbn, slots, rc);
> +
> +	return 0;
> +}
> +
> +static void msm_dp_mst_bridge_mode_set(struct drm_bridge *drm_bridge,
> +				       const struct drm_display_mode *mode,
> +				       const struct drm_display_mode *adjusted_mode)

It's clearly defined as deprecated, not to be used by new drivers. Any
reason for not following it?

> +{
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_panel *msm_dp_panel;
> +
> +	if (!drm_bridge || !mode || !adjusted_mode) {

Ugh. No overprotective coding.

> +		DRM_ERROR("Invalid params\n");
> +		return;
> +	}
> +
> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
> +
> +	mst_bridge_state = to_msm_dp_mst_bridge_state(bridge);
> +	bridge->connector = mst_bridge_state->connector;
> +	bridge->msm_dp_panel = mst_bridge_state->msm_dp_panel;

Why? All important functions should have access to bridge state and thus state fields.

> +
> +	msm_dp_panel = bridge->msm_dp_panel;
> +	dp_display = bridge->display;
> +
> +	msm_dp_display_mode_set_helper(dp_display, mode, adjusted_mode, bridge->msm_dp_panel);
> +	msm_dp_panel->pbn = drm_dp_calc_pbn_mode(msm_dp_panel->msm_dp_mode.drm_mode.clock,
> +							  (msm_dp_panel->msm_dp_mode.bpp << 4));
> +	drm_dbg_dp(dp_display->drm_dev, "mst bridge:%d conn:%d mode set complete %s\n", bridge->id,
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
> +	.atomic_check = msm_dp_mst_bridge_atomic_check,
> +	.mode_set     = msm_dp_mst_bridge_mode_set,
> +};
> +
> +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	int rc = 0;
> +	struct msm_dp_mst_bridge *bridge = NULL;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	struct drm_device *dev;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	int i;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		if (!mst->mst_bridge[i]->in_use) {
> +			bridge = mst->mst_bridge[i];
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
> +	dev = dp_display->drm_dev;
> +	bridge->display = dp_display;
> +	bridge->base.funcs = &msm_dp_mst_bridge_ops;
> +	bridge->base.encoder = encoder;
> +	bridge->base.type = dp_display->connector_type;
> +	bridge->base.ops = DRM_BRIDGE_OP_MODES;
> +	drm_bridge_add(&bridge->base);
> +
> +	rc = drm_bridge_attach(encoder, &bridge->base, NULL, 0);
> +	if (rc) {
> +		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
> +		goto end;
> +	}
> +
> +	mst_bridge_state = kzalloc(sizeof(*mst_bridge_state), GFP_KERNEL);
> +	if (!mst_bridge_state) {
> +		rc = -ENOMEM;
> +		goto end;
> +	}
> +
> +	drm_atomic_private_obj_init(dev, &bridge->obj,
> +				    &mst_bridge_state->base,
> +				    &msm_dp_mst_bridge_state_funcs);

Why do you register a separate object if you already have bridge and you
can use bridge's state?

> +
> +	drm_dbg_dp(dp_display->drm_dev, "mst drm bridge init. bridge id:%d\n", i);
> +
> +	return 0;
> +
> +end:
> +	return rc;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..d75731ca2e5870377026e8ad1057bdcc5f0d4c78
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -0,0 +1,86 @@
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

Please check what you are sending. The SPDX header says GPL-2.0-only,
while the licence text is MIT. Why?

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

Are all those includes necessary here? Replace them with forward struct
definitions and move includes to the source file. Only keep those, which
are actually necessary for the contents of the header.

> +
> +#include "dp_panel.h"
> +#include "dp_display.h"
> +
> +struct msm_dp_mst_bridge {
> +	struct drm_bridge base;
> +	struct drm_private_obj obj;
> +	u32 id;
> +
> +	bool in_use;

What does it mean? In use currently for one of outputs?

> +
> +	struct msm_dp *display;
> +	struct drm_encoder *encoder;
> +
> +	struct drm_connector *connector;

Why do you have connector both as a part of the bridge and bridge state?

Please describe design decisions in the commit mesage or as comments.

> +	struct msm_dp_panel *msm_dp_panel;
> +};
> +
> +struct msm_dp_mst_bridge_state {
> +	struct drm_private_state base;
> +	struct drm_connector *connector;
> +	struct msm_dp_panel *msm_dp_panel;
> +
> +	int vcpi;
> +	int pbn;
> +	int num_slots;
> +	int start_slot;

I'd definitely prefer to have payload pointer here, if that's also a
part of the state.

> +};
> +
> +struct msm_dp_mst {
> +	struct drm_dp_mst_topology_mgr mst_mgr;
> +	struct msm_dp_mst_bridge *mst_bridge[DP_STREAM_MAX];
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
