Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE722B3723E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 20:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AF710E059;
	Tue, 26 Aug 2025 18:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rtyrd4Mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6476810E059
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:31:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QC41NL005706
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EyFSf9HDqT3GLT8ygjPbgADY
 2vJYcyFG+EDnXY5XHPE=; b=Rtyrd4Mo+8CSL71yOrMiQwcgytWQvMYshtVjZnZM
 AeH9JgPETNvVwuTigP6MgWOMBkNhJ9PtohFxATioQA7c9xgbGrKG3u7hc3Ocdjsc
 Mb5wynXkUaFEs8SupJMNuKZwNyhILv6YNqH9//AqhCNBhM0R3lDBAn9+TCtiFU06
 dOiCJFWOhgBMU2Bho16XGAVQXNFLfTDUiaAjausq2bwGi+p89wkXTZ7WmkD/fMvQ
 FeUW5O0awUrfApsUnAgY66Y+tieJidnVxPUQ/5Lxmuqa/E91O/gM6mLbLC5bqf8D
 mTRWLgRXAjQKRTKo8vWX/z6cfpn2VKkYcXP6i1Ff5sdsfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpevcb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:31:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b28434045aso231421231cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 11:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756233106; x=1756837906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyFSf9HDqT3GLT8ygjPbgADY2vJYcyFG+EDnXY5XHPE=;
 b=JdqHjWaelnDWbWdIGYYLpYP9jHv6z/ZEQdA/bbXAAw+mF1poISH9wOKQomlyJEtzq9
 Lv+2NL6Em794aUPmlb8r/sqiE7K5W4CYF1BwID0RlzGTsaomns4MVAo8Oz26A3zjeTS0
 2JtJlQFA9KZ3606XLdEwpKUD8Jybx0gYEhaVETCICqzwBTPOss2XeLDxSdh8QzO8kclq
 0NEIbnPuFNWdve2AxiteWFyIJestSIcHAq3Hu4p0RNcSSpB8cKssuP+Gdtd/o7t48SLP
 EOfujQx7acS39/9uorHMM0AGcwaFywxCaDMxESyDnbEBC0A32M2/8Z2f3Aq1j25/TPdw
 mZ1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXhmQSlWdiJH8bpryKFvaEOjFw4Vl9K4Ie3k4aNnQ7M7B+NrbIoClA8/yYTOImzqGeuIBRsOIe9Xo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysnAJUaUjMa9iw9vIjFOv68Q6iwosxLKahCCbei/x23oU6ZZrW
 E/YvG9U20lYOuplnm5RdPDNop9SrW+agXj2Ua1esj/IsBV1ax91IiUWEwPOEVXfFdJcfJVNfxQH
 b4sSaQrN2xJrAX22ac2GCa+hPWwSFHv80/xaDUr0poMElaBGr56KMj7RLhSMmc+KPfS4hTjE=
X-Gm-Gg: ASbGncstiJhfjIiCTK82hCPbVjTAZ6vMt9iIjmVh5gO4IFiCzEMnS/tNDFCiTLyaYwg
 XSI2euLew9u/ttlkOod4OIIh64gDX2+c5rktP5PyeOGwPiJuwtZS9Dsy1+N08B4HfSd3xw0pYxk
 ss5tbDq29cJnt/3EEKIhs7cCyua/7qswKsfmVrJ3LKl9P33bghFuj3rdFJEAy9UZiKhUNGE+STG
 BiUqVu08OqNCLCL2qpDZ5nsFivE7+syijUZ8QAWyEGpqedro+Xe7T6ZzY2HXXRHStrJNRtkbeJW
 dBggjreurkb1wskGpTM46b735mQ7ecDUp+lianlQ5JBGpxKMKdELRYX5lUw6tVX1wRLP+9QNcn0
 xQE9k6P1QYYJJ3hnrBaSuKsMYKBLwD/Byx9Tb8TLJ3pIAs1ERvwD1
X-Received: by 2002:a05:622a:4817:b0:4b2:c78d:d07b with SMTP id
 d75a77b69052e-4b2c78dd273mr73820851cf.1.1756233105895; 
 Tue, 26 Aug 2025 11:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8yFFVfAbYYxd/qTQk86OaQGlYinW8rFfhPOA/rMzCZZ2PzCCcTyKIFzRln1H9fLkUK3kglg==
X-Received: by 2002:a05:622a:4817:b0:4b2:c78d:d07b with SMTP id
 d75a77b69052e-4b2c78dd273mr73820291cf.1.1756233105129; 
 Tue, 26 Aug 2025 11:31:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c1c32esm2441060e87.63.2025.08.26.11.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 11:31:44 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:31:42 +0300
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
Subject: Re: [PATCH v3 30/38] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <x72v67fsgmekfeebasggtiaofwlxw6ikqch4lxkrryior3yxxk@xiiw75bnj37p>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-30-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-30-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: -MGv_9a3hI6VAzEbgNtcLjk76wYjDqwa
X-Proofpoint-ORIG-GUID: -MGv_9a3hI6VAzEbgNtcLjk76wYjDqwa
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68adfd93 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BYdbQh0Jf_UrhektqZAA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfXzBGn6izD/oLP
 5Aep0/W88mFVgXPXr9n9UuI/qQaIgxADt8N3fX2sMD3DiSgMuSxgLww2fE42IJqxnvIk+TvwmYY
 xeg057cyhSNfbsiNWWyf+cpazXtbCljbgp5GQADLxkXKXFIcTOWfVX2P1I2lk+GaM6q5TmQm9Dj
 3Qy58ZNZ83YYs9TazHhGhFplaLOD2GY6V0cKJabh4UtzskPTSdFWa9PmId9BfeVbGDb2s+l+cNQ
 +t+GXS4rKWEnylZH8IkgYWwIY7EBpIXDMjUcmSpiyG0IJ4ZpuFBtx40Aw5sC1hICPjaUdpwjB6j
 uPvL7gQFr0qYDpPnGQMbOWFOvjx0eXoc+i9AA/3iyS9qd48UDg/wp4QNZnoCvzyaoJ1VgdNPsIA
 a5UqpLYT
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

On Mon, Aug 25, 2025 at 10:16:16PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add connector abstraction for the DP MST. Each MST encoder
> is connected through a DRM bridge to a MST connector and each
> MST connector has a DP panel abstraction attached to it.

What's the functionality split between the connector and bridge? Please
explain it here. Do we really need a bridge if we have a non-trivial
connector implementation?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 391 +++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>  2 files changed, 393 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 73de29136801ef5f45e0b2d09280fe113021b68c..b4f640134af544c77ab262d2cbe0b67e1e2e1b3a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -25,6 +25,8 @@
>   * OF THIS SOFTWARE.
>   */
>  
> +#include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
>  #include "dp_mst_drm.h"
>  
>  #define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
> @@ -525,7 +527,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *en
>  
>  	dev = dp_display->drm_dev;
>  	bridge->display = dp_display;
> -	bridge->base.funcs = &msm_dp_mst_bridge_ops;
>  	bridge->base.encoder = encoder;
>  	bridge->base.type = dp_display->connector_type;
>  	bridge->base.ops = DRM_BRIDGE_OP_MODES;
> @@ -554,3 +555,391 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *en
>  end:
>  	return rc;
>  }
> +
> +static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomic_state *st,
> +								struct msm_dp_mst_bridge *bridge)
> +{
> +	struct drm_device *dev = bridge->base.dev;
> +	struct drm_private_state *obj_state = drm_atomic_get_private_obj_state(st, &bridge->obj);
> +
> +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> +
> +	return to_msm_dp_mst_bridge_state_priv(obj_state);
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

Can detect be called for unregistered connector?

> +
> +	if (dp_display->link_ready && dp_display->mst_active)
> +		status = drm_dp_mst_detect_port(connector,
> +						ctx, &mst->mst_mgr, mst_conn->mst_port);

I think this should be wrapped in the pm_runtime calls.

> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d status:%d\n", connector->base.id, status);

Do we need this?

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
> +
> +	if (drm_connector_is_unregistered(&mst_conn->connector))
> +		return drm_edid_connector_update(connector, NULL);

Is there a need for this? I don't see a check in nouveau code.

> +
> +	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
> +	drm_edid_connector_update(connector, drm_edid);
> +
> +	return drm_edid_connector_add_modes(connector);
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
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	u16 full_pbn, required_pbn;
> +	int i, active_enc_cnt = 0;
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
> +		mst_bridge_state = to_msm_dp_mst_bridge_state(mst->mst_bridge[i]);
> +		if (mst_bridge_state->connector &&
> +		    mst_bridge_state->connector != connector)
> +			active_enc_cnt++;
> +	}
> +
> +	if (active_enc_cnt < DP_STREAM_MAX)
> +		full_pbn = mst_port->full_pbn;
> +	else {
> +		DRM_ERROR("all MST streams are active\n");
> +		return MODE_BAD;

And if the stream becomes unused, who will call the mode_valid? This
callback should validate if the mode can be enabled at all, not taking
care about other MST streams, connectors, etc. If the user overcommits,
e.g. by selecting 4 8K modes, then atomic_check() will fail, but it
still should be possible to disable all other connectors and get the max
mode supported here.

> +	}
> +
> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);

You should not be using connector's BPC here. It can be lowered to fit
the mode. It should be (6 * 3) << 4

> +
> +	if (required_pbn > full_pbn) {


> +		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported. pbn %d vs %d\n",
> +			   mode->name, required_pbn, full_pbn);
> +		return MODE_BAD;

MODE_CLOCK_HIGH

> +	}
> +
> +	return msm_dp_display_mode_valid(dp_display, &dp_panel->connector->display_info, mode);
> +}
> +
> +static struct drm_encoder *
> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_state *state)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct drm_encoder *enc = NULL;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	u32 i;
> +	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
> +										    connector);
> +
> +	if (conn_state && conn_state->best_encoder)
> +		return conn_state->best_encoder;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
> +		if (IS_ERR(mst_bridge_state))
> +			goto end;
> +
> +		if (mst_bridge_state->connector == connector) {
> +			enc = mst->mst_bridge[i]->encoder;
> +			goto end;
> +		}
> +	}
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
> +
> +		if (!mst_bridge_state->connector) {
> +			mst_bridge_state->connector = connector;
> +			mst_bridge_state->msm_dp_panel = mst_conn->dp_panel;
> +			enc = mst->mst_bridge[i]->encoder;
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
> +	int rc = 0, slots;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc *old_crtc;
> +	struct drm_crtc_state *crtc_state;
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	struct drm_bridge *drm_bridge;
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct drm_dp_mst_atomic_payload *payload;
> +	struct drm_dp_mst_topology_state *mst_state;
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
> +		goto end;
> +
> +	old_crtc = old_conn_state->crtc;
> +	if (!old_crtc)
> +		goto end;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, old_crtc);
> +
> +	/* attempt to release vcpi slots on a modeset change for crtc state */
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		if (WARN_ON(!old_conn_state->best_encoder)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		drm_bridge = drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);

Why do we have it here rather than in bridge's atomic_check?

> +		if (WARN_ON(!drm_bridge)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +		bridge = to_msm_dp_mst_bridge(drm_bridge);
> +
> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, bridge);
> +
> +		mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> +	
> +		payload = drm_atomic_get_mst_payload_state(mst_state, mst_conn->mst_port);
> +
> +		slots = payload->time_slots;
> +		if (slots > 0) {
> +			rc = drm_dp_atomic_release_time_slots(state,
> +							      &mst->mst_mgr,
> +							      mst_conn->mst_port);
> +			if (rc) {
> +				DRM_ERROR("failed releasing %d vcpi slots %d\n", slots, rc);
> +				goto end;
> +			}
> +		}
> +
> +		if (!new_conn_state->crtc) {
> +			/* for cases where crtc is not disabled the slots are not
> +			 * freed by drm_dp_atomic_release_time_slots. this results
> +			 * in subsequent atomic_check failing since internal slots
> +			 * were freed but not the DP MST mgr's
> +			 */
> +			mst_bridge_state->num_slots = 0;
> +			mst_bridge_state->connector = NULL;
> +			mst_bridge_state->msm_dp_panel = NULL;
> +
> +			drm_dbg_dp(dp_display->drm_dev, "clear best encoder: %d\n", bridge->id);
> +		}
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
> +	kfree(mst_conn);
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
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct drm_connector *connector;
> +	int rc, i;
> +
> +	dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
> +
> +	dp_display = dp_mst->msm_dp;
> +	dev = dp_display->drm_dev;
> +
> +	mst_conn = kzalloc(sizeof(*mst_conn), GFP_KERNEL);
> +
> +	if (!mst_conn)
> +		return NULL;
> +
> +	drm_modeset_lock_all(dev);
> +
> +	connector = &mst_conn->connector;
> +	rc = drm_connector_dynamic_init(dev, connector,
> +					&msm_dp_drm_mst_connector_funcs,
> +					DRM_MODE_CONNECTOR_DisplayPort, NULL);
> +	if (rc) {
> +		kfree(mst_conn);
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_conn->dp_panel = msm_dp_display_get_panel(dp_display);
> +	if (!mst_conn->dp_panel) {
> +		DRM_ERROR("failed to get dp_panel for connector\n");
> +		kfree(mst_conn);
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_conn->dp_panel->connector = connector;
> +	mst_conn->msm_dp = dp_display;
> +
> +	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
> +
> +	if (connector->funcs->reset)
> +		connector->funcs->reset(connector);
> +
> +	/* add all encoders as possible encoders */
> +	for (i = 0; i < dp_mst->max_streams; i++) {
> +		rc = drm_connector_attach_encoder(connector, dp_mst->mst_bridge[i]->encoder);
> +
> +		if (rc) {
> +			DRM_ERROR("failed to attach encoder to connector, %d\n", rc);
> +			kfree(mst_conn);
> +			drm_modeset_unlock_all(dev);
> +			return NULL;
> +		}
> +	}
> +
> +	mst_conn->mst_port = port;
> +	drm_dp_mst_get_port_malloc(mst_conn->mst_port);
> +
> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.path_property, 0);

Where do we set the property then?

> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.tile_property, 0);
> +
> +	drm_modeset_unlock_all(dev);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "add MST connector id:%d\n", connector->base.id);
> +
> +	return connector;
> +}
> +
> +static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
> +	.add_connector = msm_dp_mst_add_connector,

No .poll_hpd_irq ?

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

Can't we just trust the driver?

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
> +	for (int i = 0; i < DP_STREAM_MAX; i++) {
> +		msm_dp_mst->mst_bridge[i] = devm_drm_bridge_alloc(dev->dev,
> +						struct msm_dp_mst_bridge, base,
> +						&msm_dp_mst_bridge_ops);

This should have been a part of the previous patch.

> +	}
> +
> +	msm_dp_mst->dp_aux = drm_aux;
> +
> +	ret = drm_dp_mst_topology_mgr_init(&msm_dp_mst->mst_mgr, dev,
> +					   drm_aux,
> +					   MAX_DPCD_TRANSACTION_BYTES,
> +					   max_streams,
> +					   conn_base_id);
> +	if (ret) {
> +		DRM_ERROR("DP DRM MST topology manager init failed\n");
> +		return ret;
> +	}
> +
> +	dp_display->msm_dp_mst = msm_dp_mst;
> +
> +	mutex_init(&msm_dp_mst->mst_lock);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "DP DRM MST topology manager init completed\n");

Why do we need so many debug messages? They make the log overspammed and
hard to follow.

> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index d75731ca2e5870377026e8ad1057bdcc5f0d4c78..1484fabd92ad0075eac5369aac8ca462acbd3eda 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -70,6 +70,7 @@ struct msm_dp_mst {
>  	struct drm_dp_mst_topology_mgr mst_mgr;
>  	struct msm_dp_mst_bridge *mst_bridge[DP_STREAM_MAX];
>  	struct msm_dp *msm_dp;
> +	struct drm_dp_aux *dp_aux;
>  	u32 max_streams;
>  	struct mutex mst_lock;
>  };
> @@ -83,4 +84,6 @@ struct msm_dp_mst_connector {
>  
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
