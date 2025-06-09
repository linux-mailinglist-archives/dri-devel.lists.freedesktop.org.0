Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CD8AD22B7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 17:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B2510E172;
	Mon,  9 Jun 2025 15:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JthWLZEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735A510E09E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 15:44:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559B2CxA019972
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 15:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X7KLN/lr64MhkIB60SnnLp/s
 ugM4QAYOYeScpe8ybOk=; b=JthWLZEQmKmaKw3Lt39FbU6l3q7C8enI6RolY7gV
 lk9W+bGsTiSyHSATnxqqt6nskjrws2Wl5JSP3HidrW8kiraai2lNFWFcVNPAGWma
 a9UyYw0ERySEGRwrs1mqp3jGiIq7Z+jptTG0WQSUrgkvccl4uNcFxlPyRsfIRLV2
 XSSqMiKxyvi6jEeCb900TS3sq6g1PX2scn3hdIBJyMR6OMIWwvtWHeZe6EQp7lNt
 KBUGOisg20Qlr2UMuEw9B2Jx87mQXHAoBx0sxQLS8UUaScwdsRZyVJJlPX9s0Z8E
 XJ5FTzZ54WzxQUXRG8lE77S00uEbClUmQPt3Hu0z5HelJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qctsx1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:44:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a587a96f0aso124272151cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 08:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749483855; x=1750088655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7KLN/lr64MhkIB60SnnLp/sugM4QAYOYeScpe8ybOk=;
 b=VJxEwx8CvCPZFby63raVdaZOGbdr7SIBvRatH2cZx6ByPvUp/UqKaLXoa1GPKdmDLQ
 51JdTJ1XNuqty/2nAOccugAwNnksi8dHNnsilb4Alwf+Nl3/HlVKNwUYEPVWnmwju3qn
 h7OjA4XyQDkeVYL4Isn91WrpU32kHVVtJ82aRJ2GG7mJ2l6pOXo/ht560zPWmj1akHGN
 jRQ3562kyf2sF4LbOpBPG3AytVVIJ5mi5UefLyEPt8rOheeyaF0HxK4SBGXsjAu3PIQu
 qGp+HCi7CU/B8G6HKw/ncLmN/xs6y4QS70SK2xMcwPzWyom54SD/8gCtRSl8qO2mvjal
 7IdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv96ygozv1WQzAqDJdGsODl54WzntqRDxQbj4RBcLUxJ1+iJTnzSrARxTHlZn7F5rzETFis7I0fdc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyduL4dtqsegsij/+SvOerV4FSfGAOrzDQfb/wpA2J/gSpijKYn
 XR1y+GmG2VG6E8771Vg1Gi5PrcPc8+2EtLszFtdQdkQbBW38mDECZMLdcbqrbolBmvPAht/m+AZ
 LLzaum8bWOodnxw9wISIDA5tj1O1A8IQN/2fcZDOT2XiQLhKBFpDTqrAQnGuvLbjZvyaJONI=
X-Gm-Gg: ASbGncud45Kv0AVYiMg5PtcDIYlcjHR3k85QpQ0KcU64PcZQhFSyQPRxE0vTZxOXMDZ
 BPnKFGd1uzA1ar/9pFd54GGzK+P7CThaGELWTPTEtsoo8OaYTrgjSHRMRgNUxGjyIz2ir9WFKit
 Z9GYgsE5HCXZKzY+JWSp5L8esHO3UrIf4ID20DTo9j5azWb7C4524cfuNHHDDG6J6IA9HJ9pvWe
 ISVjJMpg2GROKVA4pMnUHa0EuqSwPgGIRFqwIhuR8YxUHqCQZoa0l5Q3RFhHmArPzGmsSVJTsmG
 yXi6f2vplguDMoRrPBluBHLDD1t91eAIFUnghkSpngQ++bfiGuYe6P+gv+lLwN4R/z6xDOOMeYi
 PhcZugi0xWA==
X-Received: by 2002:a05:6214:2a88:b0:6fa:a0ac:8d46 with SMTP id
 6a1803df08f44-6fb08f69f85mr207189276d6.2.1749483855378; 
 Mon, 09 Jun 2025 08:44:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRj9ZQC4oCBy8Xb7d6S4oRZREoyfjMoijzFK6qJ+ZBbvSLGWSVsbP6Kl/mlvhj7T2w66jEFg==
X-Received: by 2002:a05:6214:2a88:b0:6fa:a0ac:8d46 with SMTP id
 6a1803df08f44-6fb08f69f85mr207188566d6.2.1749483854711; 
 Mon, 09 Jun 2025 08:44:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b55fb3sm11741521fa.49.2025.06.09.08.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:44:13 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:44:12 +0300
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
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <bmzte2ywtlygl4rru73efnfb4vpi3vkveeq32jhonrmxbogp5h@kqaukhzvcxx3>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: OiLy2wjDBmzYWdiNM7uyhv4D-2Pt0AmK
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68470150 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=cixbH43K_2EJUWrG8isA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExNyBTYWx0ZWRfXytwiMyDa3i4p
 bfDWgBNr7ahYg36zTGcOxGOdSo4Z+bM4VJQOuLTy4rZHgHaIZS2xht6dCFPhCE7JxjDITtRx2Zi
 uuGy6siUFpWUpoSrKu3KkNQvUI8lSpiy8ku+dS1yXjDMY4y1cxQpjMZ0Vvo/iXF/EJlCrEsH46b
 Z/Scw4VrPHpbQlhc9ZIu5hn9vFksJCjUhoWdJu+Mf5omj3bNcw7Sh8rA2MWFUGNWF1LM5BZhesC
 D1NXXlrznr8y67ROOD2u/s2iHN1LDsCOCFIOTz1wxEbXfd31h/q+l4+LO8apIp+ArzhX7fGtpQI
 1CcGu7BDYFaUCqzr6pyvX0Sv0Wk1/VBxClk7C8+5Il3Uht2X9NG6Vqb4tBe45fOAZWAs7AwIsAD
 dwhK3UXmBpB4bIWENjyYLJpPCm0i0HUTPT3rcFM1dMO1hSUaOMYrbdqJfjopZjP6r79OyuGZ
X-Proofpoint-ORIG-GUID: OiLy2wjDBmzYWdiNM7uyhv4D-2Pt0AmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090117
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

On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add connector abstraction for the DP MST. Each MST encoder
> is connected through a DRM bridge to a MST connector and each
> MST connector has a DP panel abstraction attached to it.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>  2 files changed, 518 insertions(+)

It generally feels liks 80% of this patch is a generic code. Please
extract generic DP MST connector and push it under drm/display. Other DP
MST drivers should be able to use it.

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index a3ea34ae63511db0ac920cbeebe30c4e2320b8c4..489fa46aa518ff1cc5f4769b2153fc5153c4cb41 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -25,8 +25,12 @@
>   * OF THIS SOFTWARE.
>   */
>  
> +#include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
>  #include "dp_mst_drm.h"
>  
> +#define MAX_DPCD_TRANSACTION_BYTES 16
> +
>  static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
>  {
>  	struct msm_dp_mst_bridge_state *state;
> @@ -79,6 +83,61 @@ static int msm_dp_mst_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, int p
>  	return num_slots;
>  }
>  
> +static int msm_dp_mst_get_mst_pbn_div(struct msm_dp_panel *msm_dp_panel)
> +{
> +	struct msm_dp_link_info *link_info;
> +
> +	link_info = &msm_dp_panel->link_info;
> +
> +	return link_info->rate * link_info->num_lanes / 54000;
> +}
> +
> +static int msm_dp_mst_compute_config(struct drm_atomic_state *state,
> +				      struct msm_dp_mst *mst, struct drm_connector *connector,
> +				      struct drm_display_mode *mode)
> +{
> +	int slots = 0, pbn;
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	int rc = 0;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	int pbn_div;
> +	struct msm_dp *dp_display = mst->msm_dp;
> +	u32 bpp;
> +
> +	bpp = connector->display_info.bpc * 3;
> +
> +	pbn = drm_dp_calc_pbn_mode(mode->clock, bpp << 4);

Is this going to change if DSC is in place? Will it bring fractional BPP
here?

> +
> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> +
> +	if (!dfixed_trunc(mst_state->pbn_div)) {
> +		pbn_div = msm_dp_mst_get_mst_pbn_div(mst_conn->dp_panel);
> +		mst_state->pbn_div.full = dfixed_const(pbn_div);

It looks like this should be using drm_dp_get_vc_payload_bw() (i915,
nouveau). Any reason not to do so?

> +	}
> +
> +	rc = drm_dp_atomic_find_time_slots(state, &mst->mst_mgr, mst_conn->mst_port, pbn);
> +	if (rc < 0) {
> +		DRM_ERROR("conn:%d failed to find vcpi slots. pbn:%d, rc:%d\n",
> +			  connector->base.id, pbn, rc);
> +		goto end;
> +	}
> +
> +	slots = rc;
> +
> +	rc = drm_dp_mst_atomic_check(state);
> +	if (rc) {
> +		DRM_ERROR("conn:%d mst atomic check failed: rc=%d\n", connector->base.id, rc);
> +		slots = 0;

no need to

> +		goto end;
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d pbn:%d slots:%d rc:%d\n",
> +		   connector->base.id, pbn, slots, rc);
> +
> +end:
> +	return (rc < 0 ? rc : slots);
> +}
> +
>  static void _msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
>  					 struct msm_dp_mst_bridge *mst_bridge,
>  					 struct drm_dp_mst_port *port)
> @@ -499,3 +558,459 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder)
>  end:
>  	return rc;
>  }
> +
> +static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomic_state *st,
> +								struct msm_dp_mst_bridge *bridge)
> +{
> +	struct drm_device *dev = bridge->base.dev;
> +
> +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> +
> +	return to_msm_dp_mst_bridge_priv_state(drm_atomic_get_private_obj_state(st,
> +										&bridge->obj));

Save drm_atomic_get_private_obj_state() result to a variable. It will
make it readable.

> +}
> +
> +/* DP MST Connector OPs */
> +static int
> +msm_dp_mst_connector_detect(struct drm_connector *connector,
> +			    struct drm_modeset_acquire_ctx *ctx,
> +			    bool force)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	enum drm_connector_status status = connector_status_disconnected;
> +
> +	if (drm_connector_is_unregistered(&mst_conn->connector))
> +		return status;
> +
> +	if (dp_display->link_ready && dp_display->mst_active)
> +		status = drm_dp_mst_detect_port(connector,
> +						ctx, &mst->mst_mgr, mst_conn->mst_port);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d status:%d\n", connector->base.id, status);
> +
> +	return status;
> +}
> +
> +static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	const struct drm_edid *drm_edid;
> +	int ret;
> +
> +	if (drm_connector_is_unregistered(&mst_conn->connector))
> +		return drm_edid_connector_update(connector, NULL);
> +
> +	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
> +	drm_edid_connector_update(connector, drm_edid);
> +	ret = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);
> +
> +	return ret;

return drm_edid_connector_add_modes(connector)

> +}
> +
> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
> +							    const struct drm_display_mode *mode)
> +{
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct msm_dp *dp_display;
> +	struct drm_dp_mst_port *mst_port;
> +	struct msm_dp_panel *dp_panel;
> +	struct msm_dp_mst *mst;
> +	u16 full_pbn, required_pbn;
> +	int available_slots, required_slots;
> +	struct msm_dp_mst_bridge_state *dp_bridge_state;
> +	int i, slots_in_use = 0, active_enc_cnt = 0;
> +	const u32 tot_slots = 63;
> +
> +	if (drm_connector_is_unregistered(connector))
> +		return 0;
> +
> +	mst_conn = to_msm_dp_mst_connector(connector);
> +	dp_display = mst_conn->msm_dp;
> +	mst = dp_display->msm_dp_mst;
> +	mst_port = mst_conn->mst_port;
> +	dp_panel = mst_conn->dp_panel;
> +
> +	if (!dp_panel || !mst_port)
> +		return MODE_ERROR;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);
> +		if (dp_bridge_state->connector &&
> +		    dp_bridge_state->connector != connector) {
> +			active_enc_cnt++;
> +			slots_in_use += dp_bridge_state->num_slots;
> +		}
> +	}
> +
> +	if (active_enc_cnt < DP_STREAM_MAX) {
> +		full_pbn = mst_port->full_pbn;
> +		available_slots = tot_slots - slots_in_use;
> +	} else {
> +		DRM_ERROR("all mst streams are active\n");
> +		return MODE_BAD;
> +	}
> +
> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
> +
> +	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
> +
> +	if (required_pbn > full_pbn || required_slots > available_slots) {
> +		drm_dbg_dp(dp_display->drm_dev,
> +			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
> +			   mode->name, required_pbn, full_pbn,
> +			   required_slots, available_slots);
> +		return MODE_BAD;
> +	}
> +
> +	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
> +}
> +
> +static struct drm_encoder *
> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_state *state)

Do we need this callback? Don't we have a fixed relationship between
connectors and encoders?

> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct drm_encoder *enc = NULL;
> +	struct msm_dp_mst_bridge_state *bridge_state;
> +	u32 i;
> +	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
> +										    connector);
> +
> +	if (conn_state && conn_state->best_encoder)
> +		return conn_state->best_encoder;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		bridge_state = msm_dp_mst_br_priv_state(state, &mst->mst_bridge[i]);
> +		if (IS_ERR(bridge_state))
> +			goto end;
> +
> +		if (bridge_state->connector == connector) {
> +			enc = mst->mst_bridge[i].encoder;
> +			goto end;
> +		}
> +	}
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		bridge_state = msm_dp_mst_br_priv_state(state, &mst->mst_bridge[i]);
> +
> +		if (!bridge_state->connector) {
> +			bridge_state->connector = connector;
> +			bridge_state->msm_dp_panel = mst_conn->dp_panel;
> +			enc = mst->mst_bridge[i].encoder;
> +			break;
> +		}
> +	}
> +
> +end:
> +	if (enc)
> +		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder:%d\n",
> +			   connector->base.id, i);
> +	else
> +		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder failed\n",
> +			   connector->base.id);
> +
> +	return enc;
> +}
> +
> +static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
> +					     struct drm_atomic_state *state)
> +{
> +	int rc = 0, slots, i;
> +	bool vcpi_released = false;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc *old_crtc;
> +	struct drm_crtc_state *crtc_state;
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp_mst_bridge_state *bridge_state;
> +	struct drm_bridge *drm_bridge;
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +
> +	if (!state)
> +		return rc;
> +
> +	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!new_conn_state)
> +		return rc;
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, connector);
> +	if (!old_conn_state)
> +		goto mode_set;
> +
> +	old_crtc = old_conn_state->crtc;
> +	if (!old_crtc)
> +		goto mode_set;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, old_crtc);
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		bridge = &mst->mst_bridge[i];
> +		drm_dbg_dp(dp_display->drm_dev, "bridge id:%d, vcpi:%d, pbn:%d, slots:%d\n",
> +			   bridge->id, bridge->vcpi, bridge->pbn,
> +			   bridge->num_slots);
> +	}
> +
> +	/*attempt to release vcpi slots on a modeset change for crtc state*/

missing spaces in the block comment

> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		if (WARN_ON(!old_conn_state->best_encoder)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		drm_bridge = drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);

This really looks like this should be a bridge's callback.

> +		if (WARN_ON(!drm_bridge)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +		bridge = to_msm_dp_mst_bridge(drm_bridge);
> +
> +		bridge_state = msm_dp_mst_br_priv_state(state, bridge);
> +		if (IS_ERR(bridge_state)) {
> +			rc = PTR_ERR(bridge_state);
> +			goto end;
> +		}
> +
> +		if (WARN_ON(bridge_state->connector != connector)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		slots = bridge_state->num_slots;
> +		if (slots > 0) {
> +			rc = drm_dp_atomic_release_time_slots(state,
> +							      &mst->mst_mgr,
> +							      mst_conn->mst_port);
> +			if (rc) {
> +				DRM_ERROR("failed releasing %d vcpi slots %d\n", slots, rc);
> +				goto end;
> +			}
> +			vcpi_released = true;
> +		}
> +
> +		if (!new_conn_state->crtc) {
> +			/* for cases where crtc is not disabled the slots are not
> +			 * freed by drm_dp_atomic_release_time_slots. this results
> +			 * in subsequent atomic_check failing since internal slots
> +			 * were freed but not the dp mst mgr's
> +			 */
> +			bridge_state->num_slots = 0;
> +			bridge_state->connector = NULL;
> +			bridge_state->msm_dp_panel = NULL;
> +
> +			drm_dbg_dp(dp_display->drm_dev, "clear best encoder: %d\n", bridge->id);
> +		}
> +	}

This looks like there are several functions fused together. Please
unfuse those into small and neat code blocks.

> +
> +mode_set:
> +	if (!new_conn_state->crtc)
> +		goto end;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
> +
> +	if (drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state->active) {

Use of crtc_state->active doesn't look correct.

> +		if (WARN_ON(!new_conn_state->best_encoder)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		drm_bridge = drm_bridge_chain_get_first_bridge(new_conn_state->best_encoder);
> +		if (WARN_ON(!drm_bridge)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +		bridge = to_msm_dp_mst_bridge(drm_bridge);
> +
> +		bridge_state = msm_dp_mst_br_priv_state(state, bridge);
> +		if (IS_ERR(bridge_state)) {
> +			rc = PTR_ERR(bridge_state);
> +			goto end;
> +		}
> +
> +		if (WARN_ON(bridge_state->connector != connector)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}

Can all of this actually happen?

> +
> +		/*
> +		 * check if vcpi slots are trying to get allocated in same phase
> +		 * as deallocation. If so, go to end to avoid allocation.
> +		 */
> +		if (vcpi_released) {
> +			drm_dbg_dp(dp_display->drm_dev,
> +				   "skipping allocation since vcpi was released in the same state\n");
> +			goto end;
> +		}
> +
> +		if (WARN_ON(bridge_state->num_slots)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		slots = msm_dp_mst_compute_config(state, mst, connector, &crtc_state->mode);
> +		if (slots < 0) {
> +			rc = slots;
> +			goto end;
> +		}
> +
> +		bridge_state->num_slots = slots;
> +	}
> +
> +end:
> +	drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic check ret %d\n",
> +		   connector->base.id, rc);
> +	return rc;
> +}
> +
> +static void dp_mst_connector_destroy(struct drm_connector *connector)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +
> +	drm_connector_cleanup(connector);
> +	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
> +}
> +
> +/* DRM MST callbacks */
> +static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
> +	.get_modes =    msm_dp_mst_connector_get_modes,
> +	.detect_ctx =   msm_dp_mst_connector_detect,
> +	.mode_valid =   msm_dp_mst_connector_mode_valid,
> +	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
> +	.atomic_check = msm_dp_mst_connector_atomic_check,
> +};
> +
> +static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.destroy = dp_mst_connector_destroy,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static struct drm_connector *
> +msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
> +			 struct drm_dp_mst_port *port, const char *pathprop)
> +{
> +	struct msm_dp_mst *dp_mst;
> +	struct drm_device *dev;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_mst_connector *mst_connector;
> +	struct drm_connector *connector;
> +	int rc, i;
> +
> +	dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
> +
> +	dp_display = dp_mst->msm_dp;
> +	dev = dp_display->drm_dev;
> +
> +	mst_connector = devm_kzalloc(dev->dev, sizeof(*mst_connector), GFP_KERNEL);

This shows that somebody doesn't understand the reason for drmm and the
difference between devm and drmm and the lifetime of the objects. Do you
see two issues in this line?

Let me help you. Please use normal (non-managed) memory here. It is the
only correct way to allocate memory for MST connectors.

> +
> +	drm_modeset_lock_all(dev);
> +
> +	rc = drm_connector_dynamic_init(dev, &mst_connector->connector,
> +					&msm_dp_drm_mst_connector_funcs,
> +					DRM_MODE_CONNECTOR_DisplayPort, NULL);
> +	if (rc) {
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_connector->dp_panel = msm_dp_display_get_panel(dp_display);
> +	if (!mst_connector->dp_panel) {
> +		DRM_ERROR("failed to get dp_panel for connector\n");
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_connector->dp_panel->connector = &mst_connector->connector;
> +	mst_connector->msm_dp = dp_display;
> +	connector = &mst_connector->connector;
> +	drm_connector_helper_add(&mst_connector->connector, &msm_dp_drm_mst_connector_helper_funcs);
> +
> +	if (connector->funcs->reset)
> +		connector->funcs->reset(connector);
> +
> +	/* add all encoders as possible encoders */
> +	for (i = 0; i < dp_mst->max_streams; i++) {
> +		rc = drm_connector_attach_encoder(&mst_connector->connector,
> +						  dp_mst->mst_bridge[i].encoder);
> +		if (rc) {
> +			DRM_ERROR("failed to attach encoder to connector, %d\n", rc);
> +			drm_modeset_unlock_all(dev);
> +			return NULL;
> +		}
> +	}
> +
> +	mst_connector->mst_port = port;
> +	drm_dp_mst_get_port_malloc(mst_connector->mst_port);
> +
> +	drm_object_attach_property(&mst_connector->connector.base,
> +				   dev->mode_config.path_property, 0);
> +	drm_object_attach_property(&mst_connector->connector.base,
> +				   dev->mode_config.tile_property, 0);

subconnector? Or do we report the subconnector only for the main DP
port?

> +
> +	drm_modeset_unlock_all(dev);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "add mst connector id:%d\n",

Each time I see "mst" in the text message, I feel a bit sad. It's MST
(or SST).

> +		   mst_connector->connector.base.id);
> +
> +	return &mst_connector->connector;
> +}
> +
> +static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
> +	.add_connector = msm_dp_mst_add_connector,
> +};
> +
> +int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
> +{
> +	struct drm_device *dev;
> +	int conn_base_id = 0;
> +	int ret;
> +	struct msm_dp_mst *msm_dp_mst;
> +
> +	if (!dp_display) {
> +		DRM_ERROR("invalid params\n");
> +		return 0;
> +	}
> +
> +	dev = dp_display->drm_dev;
> +
> +	msm_dp_mst = devm_kzalloc(dev->dev, sizeof(*msm_dp_mst), GFP_KERNEL);
> +	if (!msm_dp_mst)
> +		return -ENOMEM;
> +
> +	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
> +	msm_dp_mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
> +	conn_base_id = dp_display->connector->base.id;
> +	msm_dp_mst->msm_dp = dp_display;
> +	msm_dp_mst->max_streams = max_streams;
> +
> +	msm_dp_mst->mst_bridge = drmm_kzalloc(dev, max_streams * sizeof(struct msm_dp_mst_bridge),
> +					      GFP_KERNEL);
> +
> +	msm_dp_mst->dp_aux = drm_aux;
> +
> +	ret = drm_dp_mst_topology_mgr_init(&msm_dp_mst->mst_mgr, dev,
> +					   drm_aux,
> +					   MAX_DPCD_TRANSACTION_BYTES,
> +					   max_streams,
> +					   conn_base_id);
> +	if (ret) {
> +		DRM_ERROR("dp drm mst topology manager init failed\n");
> +		return ret;
> +	}
> +
> +	dp_display->msm_dp_mst = msm_dp_mst;
> +
> +	mutex_init(&msm_dp_mst->mst_lock);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "dp drm mst topology manager init completed\n");
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index cdde59da7bb937ad67fa818a728082f8fd43a3a6..7b08346e0bb9189009c02745c243722c01d79493 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -75,6 +75,7 @@ struct msm_dp_mst {
>  	struct drm_dp_mst_topology_mgr mst_mgr;
>  	struct msm_dp_mst_bridge *mst_bridge;
>  	struct msm_dp *msm_dp;
> +	struct drm_dp_aux *dp_aux;
>  	u32 max_streams;
>  	struct mutex mst_lock;
>  };
> @@ -97,4 +98,6 @@ struct msm_dp_mst_connector {
>  		container_of((x), struct msm_dp_mst_connector, connector)
>  int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>  
> +int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
> +
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
