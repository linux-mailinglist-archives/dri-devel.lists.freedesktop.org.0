Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F89E844F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 09:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B73410E254;
	Sun,  8 Dec 2024 08:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CNj8owa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F7D10E259
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 08:53:26 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53dd57589c8so4714777e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 00:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733648004; x=1734252804; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zY+Pv5KBIJ+oPWTRsUPh052qMWmxG7CG8z02rc7oAFw=;
 b=CNj8owa2/v9Nx7BL1O3ZLDN4dduK4AHmsIca9wJKtPha2DEn0gQ9E9PyN3+yT/T8Zb
 Bz+yQKUTTigSiLhVGJvo/UwooE47S+2e0YnG6ubvPN+DVVePikB0UgoYr8vxwGOyYfVC
 wOurtSSDfz+jrKofJqSsglc+rGOhpu+WCGcvK8g7MpXiF7zeB5Dp0a1h7XQsZ2iaDcob
 LE+1pkl22HW2QFQbogKb+iv2Am9KpTDPWNHiAzo9G5LpVg8JIGdHFzCxcEx/lgAkqeNO
 gH9GGoHLwYsA+660OeSQy1jGeVufYBx+yuoC4rshgPPoda4sZdxIJ9iMBaBjxfwrsR1j
 LcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733648004; x=1734252804;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zY+Pv5KBIJ+oPWTRsUPh052qMWmxG7CG8z02rc7oAFw=;
 b=PnYEFL8ypL1Z07XBXe36pzV0j3FE2EVlMu9W9hqqKAYGH+K6FNQzcUfkovZaZ8uX1D
 9Nj2oOAqTyisDq+UgCmYH4kovrYX9Xk0IaMbkMRPZrapFF8MAQ6Lg6wtJrOshQMEvuY4
 RqdZCg7Mv135jLRrwkmOL1Pfb95HfPDJiN+56pf4PxoIHhFuj/d6wc4BQ05Vqaf6Kn2m
 +Q55YGD0OQVtwAoIR5gIQPpCDAZ235QLSaoqjo5Ofqgd0zPlXt6Nt/L/eb1lgvrwQm7J
 hLFXkr5bXKuF/GdpwK2tv1/gSpCwwqz3wOGNlogKOCfY46Si8+cyoxZz+1rUEOhj1dw/
 kVaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtXhp4/0AGEjI5sNRpcZocI3aaSuYS9SreWLPE0smQ0NOEHMgTD/t+wNCzDGW+yBMXBuvEKPgwJNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+e7vICuabJ4Hs5cF6jpqWTE+y0HWirmLkIiExlU43TCknMlJ2
 CBb/6NzFKysMNSx0nIJuPhgRReY4zlU5roEur8HzoDNyWpe80DTDlv1vYi9ghZI=
X-Gm-Gg: ASbGnctCYSxpKzIZ3lpPFQ6iMTB8UsoNwunr74sgtdOdB5S5A3huCk6d7mC5q79+QOd
 Sj6EFDHdGrfr/n+m4moxn3LvAl0iJlzYId5o2EEoO7KhyHAMoQMnQMlJzArajGJLq5+3gT5MVc0
 nabrQYj4l69L2TNGqgeiP7/EinTo/GQkfIXZZsif6B8dXbZtwjvq/0QmJnCt4ai9lPz2FsiZSdF
 VJH5qw7GvUonA3uMC3dlJEmB3/E3yj3e2pmqVhs1MjmKhCCwWm3uMzeMLfZjf9TwLiE+aLBvPuv
 7Euukb24lZxInDw1y1kXBYepvqnzlQ==
X-Google-Smtp-Source: AGHT+IF7VW3CEt9YUY48meab0OCFP6OZd58+C+IHLBA2TCMgaXgZWeZ4Fj2CYW6DegRR++wyQYIJVg==
X-Received: by 2002:a05:6512:1385:b0:540:19ce:6895 with SMTP id
 2adb3069b0e04-54019ce6b9cmr725514e87.1.1733648004347; 
 Sun, 08 Dec 2024 00:53:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e22947abbsm1040344e87.19.2024.12.08.00.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 00:53:23 -0800 (PST)
Date: Sun, 8 Dec 2024 10:53:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 34/45] drm/msm/dp: add support to re-use and clear the
 panel edid
Message-ID: <va2hxznd76lu7fei4gspvxh4usfd3ebwawd2isvbhjbxjvlldc@gd2drcvx7ts2>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-34-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-34-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:05PM -0800, Abhinav Kumar wrote:
> During certain cases, the dp mst connector's panel edid can be
> re-used such as getting multiple get_modes() without irq_hpd and
> should be cleared in cases when the connector is destroyed or when
> irq hpd is received. Add support to handle these cases for the
> mst_connector's panel edid.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 39 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 2d92084586b466d4953429e8a6fbf766d081cb9f..15c61fd37c418889074222c0f576778adadf51c9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -559,6 +559,34 @@ static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomi
>  										&bridge->obj));
>  }
>  
> +static void msm_dp_mst_clear_panel_edid(struct msm_dp *dp_display)
> +{
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct msm_dp_panel *dp_panel;
> +	struct msm_dp_mst_bridge *dp_bridge;
> +	int i;
> +
> +	if (!dp_display) {
> +		DRM_ERROR("invalid input\n");
> +		return;
> +	}

Drop

> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		dp_bridge = &mst->mst_bridge[i];
> +		mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
> +		dp_panel = dp_bridge->msm_dp_panel;
> +
> +		if (!dp_panel || !mst_conn || !mst_conn->mst_port)
> +			continue;
> +
> +		if (dp_panel->drm_edid) {
> +			drm_edid_free(dp_panel->drm_edid);
> +			dp_panel->drm_edid = NULL;
> +		}
> +	}
> +}
> +
>  /* DP MST HPD IRQ callback */
>  void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
>  {
> @@ -585,6 +613,9 @@ void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
>  	if (handled) {
>  		rc = drm_dp_dpcd_writeb(mst->dp_aux, esi_res, ack[1]);
>  
> +		if (ack[1] & DP_UP_REQ_MSG_RDY)
> +			msm_dp_mst_clear_panel_edid(dp_display);
> +
>  		if (rc != 1)
>  			DRM_ERROR("dpcd esi_res failed. rc=%d\n", rc);
>  
> @@ -620,6 +651,9 @@ static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
>  	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>  	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;
>  
> +	if (dp_panel->drm_edid)
> +		goto duplicate_edid;
> +
>  	drm_edid_free(dp_panel->drm_edid);
>  
>  	dp_panel->drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
> @@ -628,6 +662,7 @@ static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
>  		return -EINVAL;
>  	}
>  
> +duplicate_edid:
>  	drm_edid_connector_update(connector, dp_panel->drm_edid);

No need to update connector. Goto to the next line instead.

>  
>  	return drm_edid_connector_add_modes(connector);
> @@ -894,6 +929,10 @@ static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
>  static void dp_mst_connector_destroy(struct drm_connector *connector)
>  {
>  	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;
> +
> +	drm_edid_free(dp_panel->drm_edid);
> +	dp_panel->drm_edid = NULL;
>  
>  	drm_connector_cleanup(connector);
>  	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
