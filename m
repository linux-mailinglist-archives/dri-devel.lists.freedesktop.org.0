Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1AEB28F95
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 18:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABFE10E3B3;
	Sat, 16 Aug 2025 16:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eviCU05i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9401510E38C
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 16:44:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3AMGK030348
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 16:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=a/ND+XYFn3bL2xeCI3dtf6zp
 ZRcNozLAv93BypE9ZnA=; b=eviCU05iYpXey7dc7sazo4iNuti+3tBp1aPPfcvI
 Rua2duSY7N74qH4pxfNzd1vSHtBfkpijRKRXrht5BKU/okzZ681C9hZZKjVhbZts
 7amj4OkSuzLSKTJ9mxLyB4ICXA2MBiUhZ9deQWiv8TE+QLRrrSy4tf85yo17Gn9s
 2oqwdOiJDIJTy35WhSZ7gj3Ud/f2t+rDKlweQxBMnSwvqsjkF4I/zqM+EUd311Sh
 k6Wv37EjbJiV3tg7dOIUWUFZx6L4bXu35+agW68JzEZOLm84oSQBM+kd8VPbGOix
 4YTAQSTHyM9o0jevVHt7vzHeQBVyQ76Tha57t2dnEQBRFQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxt90vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 16:44:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88dbf013so65860886d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 09:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755362642; x=1755967442;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a/ND+XYFn3bL2xeCI3dtf6zpZRcNozLAv93BypE9ZnA=;
 b=A4nvlrn99hfBtaAqiW66xWxN0LSSB5O0KbFYvv1z4ib+3SSa1f3TWVm1StoJGhHJSX
 UKwAMf8qVAMqqxpfpbkJeatyIq3VyY3abZIpJhEw8nuLRaTHebMEKMaDhG8p0QGvvnJ4
 2ky7hRESLTI4w+DhcAAbpJKbFfjHgq0sGEHGhzeo4RuSFhCLxi5jTqlwuP7i0YuMGj1q
 f++W67TC/FMEjhMhfe8Jpgr75VJoT58zh27pJhXp1xROKcBnwcJThNuv6mfD6kztwQSB
 sPmks0McyZFvs3mZYtFv7Xsy5ewH9kYghhQfEC85utJJhLIBOYS8EcllYqMDYEo/IuqF
 KxvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWNChurmSpu//sGOwYcPCqrdxqCvVsDgUUv9+vUlsgsuwRkQYegKaxWg8hcV5MubfVRQx9D67DlCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc3yOFLzwf3w/lz2XVk/HgShClaoN/znItnUWoqA0JG356ooJe
 Ht8usPTkgKN+jSoh5Xi1A8wviCd5FxIGS22Ni1GgKyxAAun78jMC29a3f4XmZUqND6pHTUCl+rB
 RfFHiGQD+KRrld11f4R4oRpWAIVi0X1Zb2vAYmYb/ndcwdJi3ZyO6qApDK6oKk4Sxq4peZR4=
X-Gm-Gg: ASbGncuKf1wkLjN+qEANOMkDCQDTQO794Fi4VdbdcOOvb8VY8PweqJB7oLLB000tEzv
 I/RgHSNYed2K4bSO12oGoHO3uISI/ufX2k4iHVfMQpqlc3scwL7+QGry1orGhmJWY86Pul1GGL7
 aQLKLTAOsqyUPeqXrZSPqRQnZeZIPA5aBMVOjo/BO6aR09C1cDa+ZLrPcqjJGo7K/ffhiqS/O/c
 TzojdsNFDpiZgCjGZraKLSn4JJX6MLidPSyGKmAhA/7xQ3g39TpSXyUZqFGAaylqwEVkWM6wdgv
 IovBxofP2+YhZL+5ER2bBvZsUCUOYAPa2B//Je+6lImnnj047ypaYkq5vNZUf4caajvIS6iSJGj
 BQOuH0jSbd1D8WiOsztZO4Ydswz+JzxQFdd1sZC5Hnl12PFkU0sPR
X-Received: by 2002:a05:6214:20a3:b0:709:b6a7:5f16 with SMTP id
 6a1803df08f44-70ba7bdbf6cmr79169076d6.28.1755362642218; 
 Sat, 16 Aug 2025 09:44:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtpiAuhV34fMzTAghfd19E6ldXdihh8WZnwVajDj9v8RLDbwhpqckO6fSzgT61D94aqN7wwQ==
X-Received: by 2002:a05:6214:20a3:b0:709:b6a7:5f16 with SMTP id
 6a1803df08f44-70ba7bdbf6cmr79168496d6.28.1755362641652; 
 Sat, 16 Aug 2025 09:44:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a645fcbsm10108661fa.69.2025.08.16.09.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 09:43:59 -0700 (PDT)
Date: Sat, 16 Aug 2025 19:43:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 07/13] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <incxmqneeurgli5h6p3hn3bgztxrzyk5eq2h5nq4lgzalohslq@mvehvr4cgyim>
References: <20250814104753.195255-1-damon.ding@rock-chips.com>
 <20250814104753.195255-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814104753.195255-8-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: uqRYwgYbBIyU0hs-MTtreVpgxSWN7IDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXzQVrzEegcwZa
 FCyaqFg7s6iEItVE1WiV98K+XOpIyMsswVwcG4atOgNK7G+Ouo/swISKOB+/inRbrVtjh+CkHJt
 akL0rqpZtCrBZxEOgkdS0NrVjOR97OiRL1SKPofKuRRvASGmJzj70+qbE5HRi31XXHkjAb7XncC
 LEJbA30PKIMEu9xad//227p9Yo/oMhz7UI9glzCQL7UtPcQ7SOCOBfV3Why1BfKF3RsXCiGUiAo
 WAoevlXO9yi3atbxmWdxeh6IBRf0cOhhYMxkFLPkuRfp/C6yXOtfAP8YHWRBb2l+T5X9x7jLHDn
 3RO1PGb1sghTS+VwK2zvrIYll24/a2IqZU7Kd/pJjxBy+/2Z6dkiNiY6Vf5FWEjiW4cDRDQlyiA
 mOZ9y6qs
X-Proofpoint-GUID: uqRYwgYbBIyU0hs-MTtreVpgxSWN7IDY
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a0b553 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=CixiMOkOpjwi1I4l6n8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
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

On Thu, Aug 14, 2025 at 06:47:47PM +0800, Damon Ding wrote:
> Apply drm_bridge_connector helper for Analogix DP driver.
> 
> The following changes have been made:
> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>   and &drm_connector_helper_funcs.
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach.
> - Remove &analogix_dp_device.connector.
> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>   &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>   &drm_bridge_funcs.edid_read().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v2:
> - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
>   DRM_BRIDGE_OP_EDID.
> - Add analogix_dp_bridge_edid_read().
> - Move &analogix_dp_plat_data.skip_connector deletion to the previous
>   patches.
> 
> Changes in v3:
> - Rebase with the new devm_drm_bridge_alloc() related commit
>   48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
>   API").
> - Expand the commit message.
> - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
>   bridge is available.
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach.
> - In order to decouple the connector driver and the bridge driver, move
>   the bridge connector initilization to the Rockchip and Exynos sides.
> 
> Changes in v4:
> - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
>   &drm_connector.
> - Rename the &analogix_dp_plat_data.bridge to
>   &analogix_dp_plat_data.next_bridge.
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 145 ++++++++----------
>  .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
>  drivers/gpu/drm/exynos/exynos_dp.c            |  18 ++-
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
>  include/drm/bridge/analogix_dp.h              |   3 +-
>  5 files changed, 88 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 7876b310aaed..a8ed44ec8ef5 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -947,24 +947,16 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>  	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>  }
>  
> -static int analogix_dp_get_modes(struct drm_connector *connector)
> +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> -	const struct drm_edid *drm_edid;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	int num_modes = 0;
>  
> -	if (dp->plat_data->panel) {
> +	if (dp->plat_data->panel)
>  		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
> -	} else {
> -		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>  
> -		drm_edid_connector_update(&dp->connector, drm_edid);
> -
> -		if (drm_edid) {
> -			num_modes += drm_edid_connector_add_modes(&dp->connector);
> -			drm_edid_free(drm_edid);
> -		}
> -	}
> +	if (dp->plat_data->next_bridge)
> +		num_modes += drm_bridge_get_modes(dp->plat_data->next_bridge, connector);

If there is a next bridge which provides OP_MODES, then
drm_bridge_connector will use it for get_modes() and skip this one
completely. I'm not sure what's the value of this call.

>  
>  	if (dp->plat_data->get_modes)
>  		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
> @@ -972,51 +964,39 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>  	return num_modes;
>  }
>  
> -static struct drm_encoder *
> -analogix_dp_best_encoder(struct drm_connector *connector)
> +static const struct drm_edid *analogix_dp_bridge_edid_read(struct drm_bridge *bridge,
> +							   struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp = to_dp(bridge);
> +	const struct drm_edid *drm_edid = NULL;
>  
> -	return dp->encoder;
> -}
> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>  
> +	if (dp->plat_data->get_modes)
> +		dp->plat_data->get_modes(dp->plat_data, connector);


So, we have DDC, but we still want to return platform modes? What is the
usecase for that?

There might be some, but I think it deserves a comment in the source
file.

>  
> -static int analogix_dp_atomic_check(struct drm_connector *connector,
> -				    struct drm_atomic_state *state)
> -{
> -	struct analogix_dp_device *dp = to_dp(connector);
> -	struct drm_connector_state *conn_state;
> -	struct drm_crtc_state *crtc_state;
> +	return drm_edid;
> +}
>  
> -	conn_state = drm_atomic_get_new_connector_state(state, connector);
> -	if (WARN_ON(!conn_state))
> -		return -ENODEV;
> +static int analogix_dp_bridge_atomic_check(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *bridge_state,
> +					   struct drm_crtc_state *crtc_state,
> +					   struct drm_connector_state *conn_state)
> +{
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  
>  	conn_state->self_refresh_aware = true;
>  
> -	if (!conn_state->crtc)
> -		return 0;
> -
> -	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> -	if (!crtc_state)
> -		return 0;
> -
>  	if (crtc_state->self_refresh_active && !dp->psr_supported)
>  		return -EINVAL;
>  
>  	return 0;
>  }
>  
> -static const struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs = {
> -	.get_modes = analogix_dp_get_modes,
> -	.best_encoder = analogix_dp_best_encoder,
> -	.atomic_check = analogix_dp_atomic_check,
> -};
> -
>  static enum drm_connector_status
> -analogix_dp_detect(struct drm_connector *connector, bool force)
> +analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	enum drm_connector_status status = connector_status_disconnected;
>  
>  	if (dp->plat_data->panel)
> @@ -1028,21 +1008,11 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>  	return status;
>  }
>  
> -static const struct drm_connector_funcs analogix_dp_connector_funcs = {
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.detect = analogix_dp_detect,
> -	.destroy = drm_connector_cleanup,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
>  static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>  				     struct drm_encoder *encoder,
>  				     enum drm_bridge_attach_flags flags)
>  {
>  	struct analogix_dp_device *dp = to_dp(bridge);
> -	struct drm_connector *connector = NULL;
>  	int ret = 0;
>  
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> @@ -1050,31 +1020,8 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!dp->plat_data->next_bridge) {
> -		connector = &dp->connector;
> -		connector->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -		ret = drm_connector_init(dp->drm_dev, connector,
> -					 &analogix_dp_connector_funcs,
> -					 DRM_MODE_CONNECTOR_eDP);
> -		if (ret) {
> -			DRM_ERROR("Failed to initialize connector with drm\n");
> -			return ret;
> -		}
> -
> -		drm_connector_helper_add(connector,
> -					 &analogix_dp_connector_helper_funcs);
> -		drm_connector_attach_encoder(connector, encoder);
> -	}
> -
> -	/*
> -	 * NOTE: the connector registration is implemented in analogix
> -	 * platform driver, that to say connector would be exist after
> -	 * plat_data->attch return, that's why we record the connector
> -	 * point after plat attached.
> -	 */
>  	if (dp->plat_data->attach) {
> -		ret = dp->plat_data->attach(dp->plat_data, bridge, connector);
> +		ret = dp->plat_data->attach(dp->plat_data, bridge);
>  		if (ret) {
>  			DRM_ERROR("Failed at platform attach func\n");
>  			return ret;
> @@ -1178,14 +1125,21 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
>  }
>  
>  static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
> +					struct drm_atomic_state *state,
>  					const struct drm_display_mode *mode)
>  {
>  	struct analogix_dp_device *dp = to_dp(bridge);
> -	struct drm_display_info *display_info = &dp->connector.display_info;
>  	struct video_info *video = &dp->video_info;
>  	struct device_node *dp_node = dp->dev->of_node;
> +	struct drm_connector *connector;
> +	struct drm_display_info *display_info;
>  	int vic;
>  
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	if (!connector)
> +		return;
> +	display_info = &connector->display_info;
> +
>  	/* Input video interlaces & hsync pol & vsync pol */
>  	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>  	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
> @@ -1269,7 +1223,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
>  	if (!new_crtc_state)
>  		return;
> -	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
> +	analogix_dp_bridge_mode_set(bridge, old_state, &new_crtc_state->adjusted_mode);
>  
>  	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
>  	/* Not a full enable, just disable PSR and continue */
> @@ -1385,7 +1339,11 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>  	.atomic_enable = analogix_dp_bridge_atomic_enable,
>  	.atomic_disable = analogix_dp_bridge_atomic_disable,
>  	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
> +	.atomic_check = analogix_dp_bridge_atomic_check,
>  	.attach = analogix_dp_bridge_attach,
> +	.get_modes = analogix_dp_bridge_get_modes,
> +	.edid_read = analogix_dp_bridge_edid_read,
> +	.detect = analogix_dp_bridge_detect,
>  };
>  
>  static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
> @@ -1615,6 +1573,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>  
>  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  {
> +	struct drm_bridge *bridge = &dp->bridge;
>  	int ret;
>  
>  	dp->drm_dev = drm_dev;
> @@ -1628,7 +1587,16 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  		return ret;
>  	}
>  
> -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> +	bridge->ops = DRM_BRIDGE_OP_DETECT |
> +		      DRM_BRIDGE_OP_EDID |

Should this be limited to the !panel cases? Otherwise OP_EDID overrides
OP_MODES and the analogix_dp_bridge_get_modes() will never be called.

> +		      DRM_BRIDGE_OP_MODES;
> +	bridge->of_node = dp->dev->of_node;
> +	bridge->type = DRM_MODE_CONNECTOR_eDP;
> +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> +	if (ret)
> +		goto err_unregister_aux;
> +
> +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
>  	if (ret) {
>  		DRM_ERROR("failed to create bridge (%d)\n", ret);
>  		goto err_unregister_aux;
> @@ -1646,7 +1614,6 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
>  void analogix_dp_unbind(struct analogix_dp_device *dp)
>  {
>  	analogix_dp_bridge_disable(&dp->bridge);
> -	dp->connector.funcs->destroy(&dp->connector);
>  
>  	drm_panel_unprepare(dp->plat_data->panel);
>  
> @@ -1656,7 +1623,8 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>  
>  int analogix_dp_start_crc(struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp;
> +	struct drm_bridge *bridge;
>  
>  	if (!connector->state->crtc) {
>  		DRM_ERROR("Connector %s doesn't currently have a CRTC.\n",
> @@ -1664,13 +1632,26 @@ int analogix_dp_start_crc(struct drm_connector *connector)
>  		return -EINVAL;
>  	}
>  
> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
> +		return -EINVAL;
> +
> +	dp = to_dp(bridge);
> +
>  	return drm_dp_start_crc(&dp->aux, connector->state->crtc);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_start_crc);
>  
>  int analogix_dp_stop_crc(struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp;
> +	struct drm_bridge *bridge;
> +
> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
> +		return -EINVAL;
> +
> +	dp = to_dp(bridge);
>  
>  	return drm_dp_stop_crc(&dp->aux);
>  }
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index 91b215c6a0cf..17347448c6b0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -154,7 +154,6 @@ struct analogix_dp_device {
>  	struct drm_encoder	*encoder;
>  	struct device		*dev;
>  	struct drm_device	*drm_dev;
> -	struct drm_connector	connector;
>  	struct drm_bridge	bridge;
>  	struct drm_dp_aux	aux;
>  	struct clk		*clock;
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
> index 702128d76ae3..65579873ceea 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -21,6 +21,7 @@
>  #include <drm/bridge/analogix_dp.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -95,8 +96,7 @@ static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
>  }
>  
>  static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
> -				   struct drm_bridge *bridge,
> -				   struct drm_connector *connector)
> +				   struct drm_bridge *bridge)
>  {
>  	struct exynos_dp_device *dp = to_dp(plat_data);
>  	int ret;
> @@ -147,6 +147,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>  	struct exynos_dp_device *dp = dev_get_drvdata(dev);
>  	struct drm_encoder *encoder = &dp->encoder;
>  	struct drm_device *drm_dev = data;
> +	struct drm_connector *connector;
>  	int ret;
>  
>  	dp->drm_dev = drm_dev;
> @@ -168,10 +169,19 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>  	dp->plat_data.encoder = encoder;
>  
>  	ret = analogix_dp_bind(dp->adp, dp->drm_dev);
> -	if (ret)
> +	if (ret) {
>  		dp->encoder.funcs->destroy(&dp->encoder);
> +		return ret;
> +	}
> +
> +	connector = drm_bridge_connector_init(dp->drm_dev, dp->plat_data.encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
> +		return ret;
> +	}
>  
> -	return ret;
> +	return drm_connector_attach_encoder(connector, dp->plat_data.encoder);
>  }
>  
>  static void exynos_dp_unbind(struct device *dev, struct device *master,
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index d30f0983a53a..87dfb48206db 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -25,6 +25,7 @@
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/bridge/analogix_dp.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -394,6 +395,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>  {
>  	struct rockchip_dp_device *dp = dev_get_drvdata(dev);
>  	struct drm_device *drm_dev = data;
> +	struct drm_connector *connector;
>  	int ret;
>  
>  	dp->drm_dev = drm_dev;
> @@ -413,7 +415,14 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>  	if (ret)
>  		goto err_cleanup_encoder;
>  
> -	return 0;
> +	connector = drm_bridge_connector_init(dp->drm_dev, dp->plat_data.encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
> +		goto err_cleanup_encoder;
> +	}
> +
> +	return drm_connector_attach_encoder(connector, dp->plat_data.encoder);
>  err_cleanup_encoder:
>  	dp->encoder.encoder.funcs->destroy(&dp->encoder.encoder);
>  	return ret;
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index f06da105d8f2..ffc05f3de232 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -33,8 +33,7 @@ struct analogix_dp_plat_data {
>  
>  	int (*power_on)(struct analogix_dp_plat_data *);
>  	int (*power_off)(struct analogix_dp_plat_data *);
> -	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
> -		      struct drm_connector *);
> +	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *);
>  	int (*get_modes)(struct analogix_dp_plat_data *,
>  			 struct drm_connector *);
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
