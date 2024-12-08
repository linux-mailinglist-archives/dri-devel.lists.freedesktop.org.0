Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115F9E8454
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 09:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932C210E259;
	Sun,  8 Dec 2024 08:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BwYdJt7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870AB10E259
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 08:54:27 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso2025662e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 00:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733648066; x=1734252866; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h+wYH3NLtKDcllQeZE+7GVIO6KpUPzEiP96cJ5YgJ1Q=;
 b=BwYdJt7Pp945z+9zrVSReZ2NO+CIUpLi/LQxNbUNq4gr7LKiHb98LS0P3CqZ2hSCtd
 tNZqfIljsGstgnXU7JJPui7QIE8A7d40O77vzI+WtN+vAe6lmwTQrJ+kzUUzif4ZOawv
 QyEuXy+qpfnpD8cOhJp61Lm3BNzCFG0JLLInyi+V1mAIVOzdF05T7qH/FQNJ8Jiynid/
 wSRlWD6dYZYWh/a/AXmx+lgpa+kIzPpA2jAX9cvtxERpzm2OJcELS05Alc+27DmiAWEk
 DzMIBb5Aadlk1fEt9O240zPCDYRrdTNpUxxHA0P3x3C8FbGKQtSUc/MdQpF/9a0YAkqY
 H36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733648066; x=1734252866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+wYH3NLtKDcllQeZE+7GVIO6KpUPzEiP96cJ5YgJ1Q=;
 b=QanM5Armvkoazg2V1x6apiAqcjSWJMM89ufvPUfQvXNahxRqjpfglW+wvodNkofE2a
 CUHanyMDvR8+kBZfEadU2Xzelk1FT10KBgbTp5FOMSVmcgsRU5OJtueewqlbKN79J9om
 a1YMNQ0LH9seQX+HdAkfcaosu/+UFk52CCZULFbP8S8d+uWrxP9WH12GDUz6QNenPm1K
 mwonEfJt3zGkDrZSOPC+DFz0N1zMJspX8Z7yRny4MLFfjAZoXyBfy4sZkrAm1QcQP8U4
 OZ/SeHgK/eLkpSucHWSRpd9sJ9iMWI2KW7viqZrsXI8LdPRUbLBybUVtrdfXNrVThcx6
 NnkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpVVx2ylZ801VFn5R3ejvw1MSTUG55Q2DlDq9aJBds9CV/4MOPePVAuIQYCohgVekMK8DcOoCk3us=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo+8y8bCrbOxLIe0QCuhFh6XawzlPK8p/ypihe/JhDY3MT8MJE
 jNERISHeT+vBPBP2XJffNyQMC/PVMM1evkDRMFqo5RisOEExynKxRj7M6DPD3Vc=
X-Gm-Gg: ASbGncs+JLu2DE+O+GoQyBc7VE099ljEGoLnJu95vAjLIhG6t4Q+l/0rlVylBf/ns6o
 SJdyoD4xCtdWCumyO1mYCcJ6ODV5iRvT2bZJE+evT5+AS2QCfkT4pQ+BueKaOVp9I8K86XJ8nC+
 XPB+YjpySR+1vEQockbhWkackq/fvU/vKxV04MLkxJkjNIkY++5GzrXTuyw20+C0Aul/6LFyM6E
 tyFDsBi2LWL/6i3nRbnuTmmWUmPZaoG2fRojBKNpJAA7O5Bxnq+dEeuoGIUR2XqFEOrS1TTOchd
 gXwIxGyiKLHvHxQK6/UYkY1znVBiCg==
X-Google-Smtp-Source: AGHT+IEwD9OdVC1tUP2ZvsB+PkxO3Q1PwQvsQ272fZrOTDr4N5TQbKxsqYd1nLpVdaFhkndKO0vNWg==
X-Received: by 2002:a05:6512:3a82:b0:53e:2b77:9f04 with SMTP id
 2adb3069b0e04-53e2c2b5ce3mr2772826e87.17.1733648065669; 
 Sun, 08 Dec 2024 00:54:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e94f77f3fsm385463e87.217.2024.12.08.00.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 00:54:24 -0800 (PST)
Date: Sun, 8 Dec 2024 10:54:21 +0200
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
Subject: Re: [PATCH 35/45] drm/msm/dp: add a mst session mutex to protect
 bridge ops
Message-ID: <nmrzydtcn4d3imhanxbvrmydvavarckcck3we5phzimd7l332z@gqfencrtaksn>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-35-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-35-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:06PM -0800, Abhinav Kumar wrote:
> To protect against concurrent access of the dp mst bridges
> introduce a session mutex.

Why is it necessary? What kind of concurrent access is expected?

Why wasn't it introduced together with struct msm_dp_mst?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 15c61fd37c418889074222c0f576778adadf51c9..313eb63b9a35cbbb36db2d7d8f0a85e4441f2998 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -344,6 +344,7 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
>  	struct msm_dp_mst_bridge *bridge;
>  	struct msm_dp *dp;
>  	struct msm_dp_mst_bridge_state *msm_dp_bridge_state;
> +	struct msm_dp_mst *dp_mst;
>  
>  	if (!drm_bridge) {
>  		DRM_ERROR("Invalid params\n");
> @@ -353,6 +354,7 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
>  	bridge = to_msm_dp_mst_bridge(drm_bridge);
>  	msm_dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
>  	dp = bridge->display;
> +	dp_mst = dp->msm_dp_mst;
>  
>  	/* to cover cases of bridge_disable/bridge_enable without modeset */
>  	bridge->connector = msm_dp_bridge_state->connector;
> @@ -363,12 +365,14 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
>  		return;
>  	}
>  
> +	mutex_lock(&dp_mst->mst_lock);
>  	msm_dp_display_atomic_prepare(dp);
>  
>  	rc = _msm_dp_mst_bridge_pre_enable_part1(bridge, old_bridge_state);
>  	if (rc) {
>  		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
>  		msm_dp_display_unprepare(dp);
> +		mutex_unlock(&dp_mst->mst_lock);
>  		return;
>  	}
>  
> @@ -381,6 +385,8 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
>  		   drm_mode_vrefresh(&bridge->drm_mode),
>  		   bridge->vcpi, bridge->start_slot,
>  		   bridge->start_slot + bridge->num_slots);
> +
> +	mutex_unlock(&dp_mst->mst_lock);
>  }
>  
>  static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> @@ -388,6 +394,7 @@ static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>  {
>  	struct msm_dp_mst_bridge *bridge;
>  	struct msm_dp *dp;
> +	struct msm_dp_mst *mst;
>  
>  	if (!drm_bridge) {
>  		DRM_ERROR("Invalid params\n");
> @@ -401,6 +408,9 @@ static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>  	}
>  
>  	dp = bridge->display;
> +	mst = dp->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
>  
>  	_msm_dp_mst_bridge_pre_disable_part1(bridge, old_bridge_state);
>  
> @@ -410,6 +420,8 @@ static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>  
>  	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d disable complete\n", bridge->id,
>  		   DP_MST_CONN_ID(bridge));
> +
> +	mutex_unlock(&mst->mst_lock);
>  }
>  
>  static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> @@ -418,6 +430,7 @@ static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  	int conn = 0;
>  	struct msm_dp_mst_bridge *bridge;
>  	struct msm_dp *dp;
> +	struct msm_dp_mst *mst;
>  
>  	if (!drm_bridge) {
>  		DRM_ERROR("Invalid params\n");
> @@ -433,6 +446,9 @@ static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  	conn = DP_MST_CONN_ID(bridge);
>  
>  	dp = bridge->display;
> +	mst = dp->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
>  
>  	msm_dp_display_atomic_post_disable_helper(dp, bridge->msm_dp_panel);
>  
> @@ -444,6 +460,8 @@ static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  
>  	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d post disable complete\n",
>  		   bridge->id, conn);
> +
> +	mutex_unlock(&mst->mst_lock);
>  }
>  
>  static void msm_dp_mst_bridge_mode_set(struct drm_bridge *drm_bridge,
> @@ -1072,6 +1090,8 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, u32 max_dpcd_tra
>  
>  	dp_display->msm_dp_mst = msm_dp_mst;
>  
> +	mutex_init(&msm_dp_mst->mst_lock);
> +
>  	msm_dp_mst->mst_initialized = true;
>  
>  	drm_dbg_dp(dp_display->drm_dev, "dp drm mst topology manager init completed\n");
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index 5fe5dc7596086467e9a3b3d7d04a665853fbb3d7..b1adb8a61115d4809107553809206bb2ed3c6c3d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -80,6 +80,7 @@ struct msm_dp_mst {
>  	struct drm_dp_aux *dp_aux;
>  	bool mst_session_hpd_state;
>  	u32 max_streams;
> +	struct mutex mst_lock;
>  };
>  
>  struct msm_dp_mst_connector {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
