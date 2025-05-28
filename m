Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D26AC70A8
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 20:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1B510E620;
	Wed, 28 May 2025 18:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaeStp27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92D310E620
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 18:02:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SFCbKf002357
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 18:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mt94scoMpGBlHkRfDjr/0ZaH4cqB4nVNpigo9K1BPzI=; b=MaeStp27orB5w35D
 QO0Llp38kkYe1PnLLuvWzuBuw66WDoKqFgD55Yq/aekHqZHhYWfzcRQ6lYA9X2cg
 AxRvFj12qWO8JB0OpQgqkjemz3G1CA3UUmn7g0juiro4iGYjy9Q3l+snjC3avDUW
 9dPLzjqaiYu1nIMS43JD+YhbKTHIa4DYlta/S2f2vp2SA6XLK5TYQeFSkcuisWnL
 6XLBHR5V98f6WW29lGtZLQ7zdfPshXgnsYco86XnAtO+kYhGBUzR775ofwpz3rA0
 NBsr/wFAA/FP6ltO8JhyJgGAAprGF2r/EVg5YP+eixt1vU0U2CINetYK+CfQeGA7
 R/w9Hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkvxh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 18:02:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c95e424b62so186088685a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748455369; x=1749060169;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mt94scoMpGBlHkRfDjr/0ZaH4cqB4nVNpigo9K1BPzI=;
 b=d6hsDXYsGvah+mYBortzXYq7Xl44OUHDfPlefE0bGfk+pfHNQXpIhnGYGQXcQB6kEU
 Q2uUZZpEkyp9lRweKZSQGpBNUn8AefR9KUEvqu14wvZlSNrEQY1ns1p58ikyrTj7iuf/
 RozcdQsePjwzxJw5yMwIEwbEAd3FIr6GfLZ5rip+bdOrL249QOL+yO4VbZ1qJC+ZqMFg
 WMVt2sEZhci1fn38O17iwBWR4w1UQqXzH8PQpIegKCT7i+KdeCZ6Tk/h56Be0NYQ/wye
 szcKoQBiliphp1hUj26pVZTYL2yGyJ0dHj3gFAF5LEyYRJutQ/LVjyFV2WpBgwjJBIVK
 BsRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5zTFlWLRsh9HJgcvENgOLTga6ehi7A1UEho8FFK4G91o1BKsGsbE7VqO55u0gYhOyllgQHDsFpXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYD/wHcDMtyXKdpXm7hxfo2my77EoVYLoIYnkKfIs7fJ2aYzzR
 lbHD71m4XakIJmanIsvzssGBsOFCt9tsdE0vWw9jr+DBSuPXQNaEj9ym5z6IuMNQvwXX8LVGHKN
 6RqtNIaXSsVF7EGyMNS/NmeMVpdAqO9tpeMgwV9ZDusyp0lq1JmVE/sg3MoGUUWP8ZOCG2Nubf5
 PnFoE=
X-Gm-Gg: ASbGnct+DRnC1bIFppI8P5InRLp1VFPziLgDWYc4vxrsuByNoJom56nwBqTU1iEQ7oi
 I4TwyuBY5ZZMVmnwYlbi8BChixmFTyJtbWq7b2gg7efe4VI9NhI7dCUW2Fn5NmfouiMLyWoYo6p
 zPAnjDVokVzmPcq+3+MwsapPgwZeEH3l7kZWeM0Me3rehLFYo4X0EF8Jm9FWsxo/SKZkho+3Eu5
 9VNXsfNBrcZAJJGevFS3GtIJzK5v1LSpuTue0Ev+VSF+mjsfPy0bSglZrYOuWBWRDwq5el17Fqk
 gdkGGfzqjGoFd19lnOEwe9ft0GKQUpBJalvEINAQON5dNXotdcyGnc6Dt7Ob7yfKbmxyJUaKE68
 =
X-Received: by 2002:a05:6102:5487:b0:4c5:2c3e:3841 with SMTP id
 ada2fe7eead31-4e5ac0d713bmr1037287137.5.1748455358459; 
 Wed, 28 May 2025 11:02:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELc/vRTL5HOf4+VrKbUzHnWp0OBTAbQJHqlFy1eblVpmeIMAnJvUcYCEHijRPc3YXDAGhdqg==
X-Received: by 2002:a9d:6c98:0:b0:735:a98d:a4c9 with SMTP id
 46e09a7af769-735acea2225mr244432a34.7.1748455347211; 
 Wed, 28 May 2025 11:02:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f61ca28sm379055e87.50.2025.05.28.11.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 11:02:25 -0700 (PDT)
Date: Wed, 28 May 2025 21:02:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 31/45] drm/msm/dp: add dp_mst_drm to manage DP MST bridge
 operations
Message-ID: <n5g44odmls5yg4vwb6rfvdxeyy43d4ba4cahanwxe7f5scw7dv@btvb2crhjlbp>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-31-f8618d42a99a@quicinc.com>
 <4unizv5vi7ve7qdpzmcxj6vvxwxrpcppg3y72csi7ga2jqwhrm@5eu74nuopyqf>
 <318ee4bc-b39a-43d3-abcb-22588a9a765c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <318ee4bc-b39a-43d3-abcb-22588a9a765c@quicinc.com>
X-Proofpoint-GUID: 70mFr6BEGvKe_nXV82xPdsTFS3sAdIYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE1NyBTYWx0ZWRfX4uj/8IwLupKw
 uqhSlxGRPLDm0jWTJqWRwmvjOqMSH7WJtH5ifEv7PuD6EQsJ2gqKe6oJc4cQzpGviQDKWR6shTk
 NCK+VUY1Ju0bKARQR8RpyqT6Cnv+zFa2FpUHGUvq+lwUezQ+7vb6gxYHvaRBl8Rm7xkZsqaaFtn
 ZpF0D43qbNd6dBA6ZjSsk75NsM2W5Ly+ViKNqIBfJHiYakbWTaQACaAyCexcZ26xIcZeeomRJPG
 A0Jxwc7z2IglEbII+NKGMPgBPvJ3UXetroYTyy9AF2YtFnRaPuaJoQGJ5mJhF2iJniZBhuZPBRJ
 KVtT0OJThbbPTLuOqjidr/rRktQLwfYfjlPgTnoz71yQxNUjLEkl3nnLu+MfHViG20Srf1/JTXn
 91NjqI0sNycNPHhtceAdtev0VaFYmNtUgIt0QRrrvM/VopNLyC9UG0AlH7VfsmS7raHSyhwN
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68374fca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=AkxkYSyKjySzLiMMLVoA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 70mFr6BEGvKe_nXV82xPdsTFS3sAdIYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280157
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

On Tue, May 27, 2025 at 06:29:49PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 18:12, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:32:02PM -0800, Abhinav Kumar wrote:
> > > Add a new file dp_mst_drm to manage the DP MST bridge operations
> > > similar to the dp_drm file which manages the SST bridge operations.
> > > Each MST encoder creates one bridge and each bridge is bound to its
> > > own dp_panel abstraction to manage the operations of its pipeline.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/Makefile        |   3 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.h |   2 +
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 490 ++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h | 102 ++++++++
> > >   4 files changed, 596 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > > index f274d9430cc311405f890074c1466ffe2ec45ac9..b1e01b3123d9afc4818f059c5d4e7ca70dca3754 100644
> > > --- a/drivers/gpu/drm/msm/Makefile
> > > +++ b/drivers/gpu/drm/msm/Makefile
> > > @@ -142,7 +142,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> > >   	dp/dp_link.o \
> > >   	dp/dp_panel.o \
> > >   	dp/dp_audio.o \
> > > -	dp/dp_utils.o
> > > +	dp/dp_utils.o \
> > > +	dp/dp_mst_drm.o
> > >   msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > > index 6ab14e969bce0fd07b3a550bae17e99652479232..a5d4893f689c6afbbe622c9b7dfa98d23d754831 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > > @@ -7,6 +7,7 @@
> > >   #define _DP_DISPLAY_H_
> > >   #include "dp_panel.h"
> > > +#include "dp_mst_drm.h"
> > >   #include <sound/hdmi-codec.h>
> > >   #include "disp/msm_disp_snapshot.h"
> > > @@ -26,6 +27,7 @@ struct msm_dp {
> > >   	bool is_edp;
> > >   	bool internal_hpd;
> > > +	struct msm_dp_mst *msm_dp_mst;
> > >   	hdmi_codec_plugged_cb plugged_cb;
> > >   	struct msm_dp_audio *msm_dp_audio;
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..e66bd1e565aeb4da3d636eb5f4aa75504d60fd40
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> > > @@ -0,0 +1,490 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
> > > + */
> > > +
> > > +/*
> > > + * Copyright © 2014 Red Hat.
> > > + *
> > > + * Permission to use, copy, modify, distribute, and sell this software and its
> > > + * documentation for any purpose is hereby granted without fee, provided that
> > > + * the above copyright notice appear in all copies and that both that copyright
> > > + * notice and this permission notice appear in supporting documentation, and
> > > + * that the name of the copyright holders not be used in advertising or
> > > + * publicity pertaining to distribution of the software without specific,
> > > + * written prior permission.  The copyright holders make no representations
> > > + * about the suitability of this software for any purpose.  It is provided "as
> > > + * is" without express or implied warranty.
> > > + *
> > > + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> > > + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> > > + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> > > + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> > > + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> > > + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> > > + * OF THIS SOFTWARE.
> > > + */
> > > +
> > > +#include "dp_mst_drm.h"
> > > +
> > > +static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
> > > +{
> > > +	struct msm_dp_mst_bridge_state *state;
> > > +
> > > +	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
> > > +	if (!state)
> > > +		return NULL;
> > > +
> > > +	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
> > > +
> > > +	return &state->base;
> > > +}
> > > +
> > > +static void msm_dp_mst_destroy_bridge_state(struct drm_private_obj *obj,
> > > +					    struct drm_private_state *state)
> > > +{
> > > +	struct msm_dp_mst_bridge_state *priv_state =
> > > +		to_msm_dp_mst_bridge_priv_state(state);
> > > +
> > > +	kfree(priv_state);
> > > +}
> > > +
> > > +static const struct drm_private_state_funcs msm_dp_mst_bridge_state_funcs = {
> > > +	.atomic_duplicate_state = msm_dp_mst_duplicate_bridge_state,
> > > +	.atomic_destroy_state = msm_dp_mst_destroy_bridge_state,
> > > +};
> > > +
> > > +/**
> > > + * dp_mst_find_vcpi_slots() - Find VCPI slots for this PBN value
> > > + * @mgr: manager to use
> > > + * @pbn: payload bandwidth to convert into slots.
> > > + *
> > > + * Calculate the number of VCPI slots that will be required for the given PBN
> > > + * value.
> > > + *
> > > + * RETURNS:
> > > + * The total slots required for this port, or error.
> > > + */
> > > +static int msm_dp_mst_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, int pbn)
> > > +{
> > > +	int num_slots;
> > > +	struct drm_dp_mst_topology_state *state;
> > > +
> > > +	state = to_drm_dp_mst_topology_state(mgr->base.state);
> > > +	num_slots = DIV_ROUND_UP(pbn, dfixed_trunc(state->pbn_div));
> > 
> > drm_dp_atomic_find_time_slots() uses slightly different maths here, with
> > the different precision. Can we use the data that is set by that function
> > instead (payload->time_slots)?
> > 
> Note that drm_dp_atomic_find_time_slots all call in atomic_check func, not
> in other place.So can we call this func in atomic_pre_enable? Also, amg
> driver also have similar usage pattern.

Well, granted that this function can return ENOSPC, it is an error to
call it in atomic_pre_enable(). Nothing in atomic_pre_enable() /
atomic_enable() is allowed to fail.

I think this answers my question: drm_dp_atomic_find_time_slots()
should be called from atomic_check(), this function must be dropped.

> > > +
> > > +	/* max. time slots - one slot for MTP header */
> > > +	if (num_slots > 63)
> > > +		return -ENOSPC;
> > > +	return num_slots;
> > > +}
> > > +
> > > +static void _msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
> > > +					 struct msm_dp_mst_bridge *mst_bridge,
> > > +					 struct drm_dp_mst_port *port)
> > > +{
> > > +	int i;
> > > +	struct msm_dp_mst_bridge *msm_dp_bridge;
> > > +	struct drm_dp_mst_topology_state *mst_state;
> > > +	struct drm_dp_mst_atomic_payload *payload;
> > > +	int prev_start = 0;
> > > +	int prev_slots = 0;
> > > +
> > > +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> > > +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> > > +
> > > +	if (!payload) {
> > > +		DRM_ERROR("mst bridge [%d] update_timeslots failed, null payload\n",
> > > +			  mst_bridge->id);
> > > +		return;
> > > +	}
> > > +
> > > +	for (i = 0; i < mst->max_streams; i++) {
> > > +		msm_dp_bridge = &mst->mst_bridge[i];
> > > +		if (mst_bridge == msm_dp_bridge) {
> > > +			/*
> > > +			 * When a payload was removed make sure to move any payloads after it
> > > +			 * to the left so all payloads are aligned to the left.
> > > +			 */
> > 
> > Please don't. drm_dp_remove_payload_part2() should take care of that for
> > us. What is the reason for caching the data if we have to manually
> > handle the cache?
> > 
> MST framework is managing the port's bandwidth, but we have a bridhge for
> each stream, so we need to keep track of the payload allcation status for
> each bridge, how much we used and how much we left. So maybe they are manage
> two different part.

Well, still no. MST topology master should handle all payload
allocation. If you need any data, enhance its API instead of duplicating
its functionality.

> > > +			if (payload->vc_start_slot < 0) {
> > > +				// cache the payload
> > > +				prev_start = msm_dp_bridge->start_slot;
> > > +				prev_slots = msm_dp_bridge->num_slots;
> > > +				msm_dp_bridge->pbn = 0;
> > > +				msm_dp_bridge->start_slot = 1;
> > > +				msm_dp_bridge->num_slots = 0;
> > > +				msm_dp_bridge->vcpi = 0;
> > > +			} else { //add payload
> > > +				msm_dp_bridge->pbn = payload->pbn;
> > > +				msm_dp_bridge->start_slot = payload->vc_start_slot;
> > > +				msm_dp_bridge->num_slots = payload->time_slots;
> > > +				msm_dp_bridge->vcpi = payload->vcpi;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	// Now commit all the updated payloads
> > > +	for (i = 0; i < mst->max_streams; i++) {
> > > +		msm_dp_bridge = &mst->mst_bridge[i];
> > > +
> > > +		//Shift payloads to the left if there was a removed payload.
> > > +		if (payload->vc_start_slot < 0 && msm_dp_bridge->start_slot > prev_start)
> > > +			msm_dp_bridge->start_slot -= prev_slots;
> > > +
> > > +		msm_dp_display_set_stream_info(mst->msm_dp, msm_dp_bridge->msm_dp_panel,
> > > +					       msm_dp_bridge->id, msm_dp_bridge->start_slot,
> > > +					       msm_dp_bridge->num_slots,
> > > +					       msm_dp_bridge->pbn, msm_dp_bridge->vcpi);
> > > +		drm_dbg_dp(mst->msm_dp->drm_dev,
> > > +			   "conn:%d vcpi:%d start_slot:%d num_slots:%d, pbn:%d\n",
> > > +			   DP_MST_CONN_ID(msm_dp_bridge), msm_dp_bridge->vcpi,
> > > +			   msm_dp_bridge->start_slot,
> > > +			   msm_dp_bridge->num_slots, msm_dp_bridge->pbn);
> > > +	}
> > > +}
> > > +

[...]

> > > +	struct msm_dp_panel *msm_dp_panel;
> > > +
> > > +	int vcpi;
> > > +	int pbn;
> > > +	int num_slots;
> > > +	int start_slot;
> > 
> > Which of the fields (including in_use) are long-lived and which are a
> > part of the current state? Can we move all state ones to bridge's state?
> > 
> in_use only used in bridge_init, so it is long-lived. Looking at it together
> with the next patch, only num_slots changes during atomic_check, so it is in
> bridge_state. pbn/vcpi/start_slots only change during bridge enable/disable,
> so they are placed in the bridge.

Let's look how it will look after refactoring. I'd still push all
changing fields to state. It make a lot of things much easier.

> > > +};
> > > +
> > > +struct msm_dp_mst_bridge_state {
> > > +	struct drm_private_state base;
> > > +	struct drm_connector *connector;
> > > +	struct msm_dp_panel *msm_dp_panel;
> > > +	int num_slots;
> > > +};
> > > +
> > > +struct msm_dp_mst {
> > > +	bool mst_initialized;
> > > +	struct drm_dp_mst_topology_mgr mst_mgr;
> > > +	struct msm_dp_mst_bridge *mst_bridge;
> > > +	struct msm_dp *msm_dp;
> > > +	bool mst_session_hpd_state;
> > > +	u32 max_streams;
> > > +};
> > > +
> > > +struct msm_dp_mst_connector {
> > > +	struct drm_connector connector;
> > > +	struct drm_dp_mst_port *mst_port;
> > > +	struct msm_dp *msm_dp;
> > > +	struct msm_dp_panel *dp_panel;
> > > +};
> > > +
> > > +#define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
> > > +#define to_msm_dp_mst_bridge_priv(x) \
> > > +		container_of((x), struct msm_dp_mst_bridge, obj)
> > > +#define to_msm_dp_mst_bridge_priv_state(x) \
> > > +		container_of((x), struct msm_dp_mst_bridge_state, base)
> > > +#define to_msm_dp_mst_bridge_state(x) \
> > > +		to_msm_dp_mst_bridge_priv_state((x)->obj.state)
> > > +#define to_msm_dp_mst_connector(x) \
> > > +		container_of((x), struct msm_dp_mst_connector, connector)
> > > +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
> > > +
> > > +#endif /* _DP_MST_DRM_H_ */
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
