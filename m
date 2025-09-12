Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDAB54A8D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C18A10EC06;
	Fri, 12 Sep 2025 11:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IusaH2IO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999A010EC06
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:03:07 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fLUV015470
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=K5xk2wocuhm+OEjl+Wk3AU/O
 83r6hM0+sIAcri2O0k0=; b=IusaH2IOEkhzgRsVax80ahN/YgrUMaTV5BUKnJxH
 uG13ZhNvTRdg0S90YXLeJIhUrkdvfJeEoCS91QAeU8EDQp0jaizbKegIH+lVhTyO
 lXubd2mONqn737XuzyaIFdYRd1xDbIHbCI++LnGYA0TUovaBP17WQmHtjL0Id+oD
 zXi3ZyBZ5R0oldvvh3B8popt/1IQqZYn+zsH0sh6v/zWSgXopGjWYcP0lE5sUxGr
 nMuhARMX8AB4gautIGod98EVmegtu1flTE+MHTxERiB+ytIlzuJrnUWfztXKptkJ
 qSA8RQP5oQBOj32fjZ2J7+kRWzRJJ7qFJm45iajOywUQcQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapunkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:03:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-54a1ab16fe1so553539e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757674986; x=1758279786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5xk2wocuhm+OEjl+Wk3AU/O83r6hM0+sIAcri2O0k0=;
 b=EnkCKL9914o+MRbyRYAx1Nbr9wy+oPqtGQheU9bO8GLiTGcN1Awl03bOBsfKj3s/GP
 bjRN7P5fx6WYHiKfOkqIfzNiISozbc2RA2dysxBXFIajughq/rTtHkEcwEyzjEu/5cRF
 6DYSwnF/Z+MN9qGb/ecHeXZnRh/l97Y+QdLM+qwc5U84BEHiObCpoejnYZLgWok0n+i7
 XR8qpslVZbRd6D6TMdjZ1/TwRslQj2RkMb9XjEgrj+RPobbYCzCw8Pbicgg0InK4fS9v
 x8o+wi3TuFvTFU1mJflq95bkMyNsDUFGViOREOWaSObiv7sKkpdglXjoz+uXUqDf79PE
 SJTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVxzETdA2FbaLTnIJu5X4/OUhBRPQKnEkU+ILsa6/ZnMPukwt49ZTNbbISrGHwejy6fPg6W0tm8mo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvFyVTprwBOR8/Q8DzyFs7+dBg1cMCFTE+trimu3bTkLmr07Au
 Fmiamca3QDqIcJYcW0UW0TMcL/hjwVQxztMCetncYdOtp7U6vKN/8zGRX/5RJf4Gm8u9hOMW28b
 FJD4j3L85iFW/BjR3F9qZouzBzxP6qEd+TrktPavSeyEKHrhE8SHaEDI5dK3osO254mt3GeE=
X-Gm-Gg: ASbGncsE+fTZXkHe4W7ixMYVjH+gjC8o36u2Y9ExpMiFdIkii+2Ovkf3pIAW+r5aJXs
 Fd7NHiGHSpkQAQw313iC5nlYojr80mJH4DKYwLa6sfOF/4DP00uH+kt2qnrrmkxzSlpcbJpPa45
 8K8fC6Dp9elMUKW/33/ezB3ah+WZBrgByuOALD3U5IGTjbVuhPtR9LC6w9wkfdBR6FpLG3DLpJf
 RVoqsLR2QtIw+dn6dEHSnaU5f0mc9p8O1K++F3yf6WfW7yBkYRUjGuPAGT8s2iR+nCI+Fre6JL9
 Ov5Im0lUQzGYV6tppVekl0rgK7kXVOc6gPG70Qqmm+x1hsmZrWq4XGztBqfgcgESrvarBvd0tmx
 fFfNYmaSwA3ZBjlA11QgzD/TI4uaoJrMP77/ehDtISfcHO14wHKD6
X-Received: by 2002:a05:6122:ca5:b0:545:ed72:fdf6 with SMTP id
 71dfb90a1353d-54a16b0c776mr793985e0c.1.1757674985625; 
 Fri, 12 Sep 2025 04:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY+hFG2eRH+htHQnWNG4+2ohkmUmO6Ti7ktBKQw2UjOpEo4hmAg+qQ2vk8mxbn3Ni7HU30eQ==
X-Received: by 2002:a05:6122:ca5:b0:545:ed72:fdf6 with SMTP id
 71dfb90a1353d-54a16b0c776mr793903e0c.1.1757674985011; 
 Fri, 12 Sep 2025 04:03:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1b39dccfsm7552991fa.54.2025.09.12.04.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:03:04 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:03:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 10/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <tsgfxlkxty653crmzmwsr7p6slf27pxf6n6to5p7zvi6wsl444@525tz5uhbj44>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-11-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c3fdea cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=ybcoBtwhkJE93Z-z0mUA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: KjPHmwaGSTc-_mKsuA2rmml1gRLTE8H3
X-Proofpoint-ORIG-GUID: KjPHmwaGSTc-_mKsuA2rmml1gRLTE8H3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX+Bm59BKYVG91
 8y7w9dSh1lX18jLJgkiNJSy9vQiJurKNVuHS2YktKkHRwNmD87fyXMNEoNC5gR5pGiImihkTbxN
 gvFl3jdUdmlQq3+CfLmCgf6vclyGKuAZw6/uHP4/rJMNbrouSINpsQKj2KR0ok8DrqnWNGQTVEv
 U8Fq3ThlcN1HDrmJvQ6Dc31RxMBYJP1NF2w6MZ7DsOKHa1W9TaIGkz5hE31syq1VpUz2CtFXysJ
 aCQ51qszAFZkq7y+Z4WXDhOgD6XqNEL+PVo8qpFHekoFHXts0JOu3KWBzxb6YLoC7zjYzvvvUbv
 jM62zrnIkEkwHFEVZvaQ4ljbpe1tftmL+Re418IQHTmcEqxU50Ys/BOltOhphrXSVlET8JGKNS/
 HUKHtT2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Fri, Sep 12, 2025 at 04:58:39PM +0800, Damon Ding wrote:
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
> 
> Changes in v5:
> - Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
>   for next bridge attachment of Exynos side.
> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>   the downstream device is a panel, a bridge or neither.
> - Remove the calls to &analogix_dp_plat_data.get_modes().
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
>  .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
>  drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
>  include/drm/bridge/analogix_dp.h              |   3 +-
>  5 files changed, 95 insertions(+), 96 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 9bf91d7595d6..156114170c4d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -856,44 +856,38 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
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

This will be already handled by drm_bridge_connector, it will use the
last bridge in chain which implements OP_EDID or OP_MODES (with OP_EDID
having higher priority).

>  
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

return drm_edid_read_ddc(...);

>  
> +	return drm_edid;
> +}
>  
> -static int analogix_dp_atomic_check(struct drm_connector *connector,
> -				    struct drm_atomic_state *state)
> +static int analogix_dp_bridge_atomic_check(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *bridge_state,
> +					   struct drm_crtc_state *crtc_state,
> +					   struct drm_connector_state *conn_state)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> -	struct drm_display_info *di = &connector->display_info;
> -	struct drm_connector_state *conn_state;
> -	struct drm_crtc_state *crtc_state;
> +	struct analogix_dp_device *dp = to_dp(bridge);
> +	struct drm_display_info *di = &conn_state->connector->display_info;
>  	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
>  
>  	if (is_rockchip(dp->plat_data->dev_type)) {
> @@ -905,35 +899,18 @@ static int analogix_dp_atomic_check(struct drm_connector *connector,
>  		}
>  	}
>  
> -	conn_state = drm_atomic_get_new_connector_state(state, connector);
> -	if (WARN_ON(!conn_state))
> -		return -ENODEV;
> -
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
> @@ -945,21 +922,11 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
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
> @@ -967,31 +934,8 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
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
> @@ -1095,14 +1039,21 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
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
> @@ -1186,7 +1137,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
>  	if (!new_crtc_state)
>  		return;
> -	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
> +	analogix_dp_bridge_mode_set(bridge, old_state, &new_crtc_state->adjusted_mode);
>  
>  	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
>  	/* Not a full enable, just disable PSR and continue */
> @@ -1302,7 +1253,11 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
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
> @@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>  
>  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  {
> +	struct drm_bridge *bridge = &dp->bridge;
>  	int ret;
>  
>  	dp->drm_dev = drm_dev;
> @@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  		return ret;
>  	}
>  
> -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> +	if (dp->plat_data->panel)
> +		/* If the next is a panel, the EDID parsing is checked by the panel driver */
> +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
> +	else if (dp->plat_data->next_bridge)
> +		/* If the next is a bridge, the supported operations depend on the next bridge */
> +		bridge->ops = 0;

And what if the next bridge is dp_connector without a separate HPD pin?

> +	else
> +		/* In DP mode, the EDID parsing and HPD detection should be supported */
> +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> +
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

-- 
With best wishes
Dmitry
