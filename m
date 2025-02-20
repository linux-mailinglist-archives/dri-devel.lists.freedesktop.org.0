Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54BEA3D6E8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC0C10E91A;
	Thu, 20 Feb 2025 10:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ccTMfY9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96D010E91A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:39:03 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30930b0b420so6441981fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047942; x=1740652742; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X92rb9D172xJ3m6jUr9iBc3AayfqZW/VTwWuWXoB8ck=;
 b=ccTMfY9DK3Z81GZbJTRfklLopZbSII3RLsS410YNkHFdvI8aegaNvDT4FNu1HbFGS1
 NwimI1HStOoqUaw4OGO7yehaMulPQyvqkHLxd8qbgIm6WokKeST3OjplTP62E9bvArdW
 IN4/aWEp0m49BY8Z1X8hDN5mPj6U/zPHB1W2VJqyt2SAdFY3d4luSTU4227uTrciqRHx
 mshU8TrZ3aUGaGOgjwMi2LYDDsax9ci1iqQVjiH0y3uvoa7cETuwxpVnFVq7la9gDEmb
 86RqHp5O2pAYeyB1YupzgoFE3LpU/H1GjEhF4whuAHcLOmQB64ujZEBU1Doh09xHm5Vh
 37kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047942; x=1740652742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X92rb9D172xJ3m6jUr9iBc3AayfqZW/VTwWuWXoB8ck=;
 b=fauOqNQ47w6nA4e/alQQnFUnGUi/DLKm/LOF6GYeUn+GPtszzyPnIt++4wtT/zSYHE
 aeRjFrR2t/7wC9/4xUIg5tsf9l4sZmGUN8i7zL7i0sRnk6d3r7f+bKJ+XnFsniFVP7Lw
 tUHwgBb51axDs/eJBH67eUqkGJSVoudTB0m3Ir5w/RbYKJ8Y0esydaCPNhx60sENmNRY
 wqMSuthHceOdDslCMUiY519ItftD6b1TLYEsTBx9FjyetExqP/VaiVRAPhcYx98Sv4HX
 He1EHipTG3C+KaWrLCuZgOm2d0lde0iI7XQpiyH2uTefTgViubfpn6au4BYcrCfpRxU8
 omJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS1KCVJdjiDzCbC0B8mulPDIIWLjwbQUlCIGJr8dQtJCuBCRwXrE7DgoLt5DNmzvnNoKxd17ejqYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIjF3PTzDIOMvBH7fdS/qsEkzVvm88hir57Dwe/49urYoGDT3h
 2Cl3H6bs2BeBBQCJzwR305vBik2fVr5g+b0MkBo9ZTWvUQ20xmTT5rPnI12joJs=
X-Gm-Gg: ASbGncthtr32BSbVftZ5e2J4mFW1QzzWYMT51YyMWG8YOLvGXHR6oIjOll07bNtVGez
 KB7K9jrTyaPYzynOBxAxqyTTFQndtjFYop4LEBXFHxHeSejNbKmxFE3/AUuE/2NKaRXjbP9KDr/
 uywSqjIC7Tk6P9AzdawGK8inD7VLPZZXt56scR8YyY51RIGtvnhk1xeYSz9DfW/ovoCxOCv0OVO
 9HrTWuT2TKgI93Gko20hMPW83lcws9sySobbOyyWpJKHz3XDvQIyEAVnbryc+h/Gf5N+XVhECLo
 Wu4bCoz976HEhI0FrPscMYqf/p8HeIUD9BX5+e1Y8sve1jaRnl+4LoMKjsrGBOSl+DY13ds=
X-Google-Smtp-Source: AGHT+IFRg7UVjRZDmHQnfdnVthz0ufNG5oKmdvchj6JuDiK5kDggWLBI6i3+syJDqIuYb+0vPqagAQ==
X-Received: by 2002:a05:651c:2222:b0:308:f4cc:951b with SMTP id
 38308e7fff4ca-30a45035a2fmr29362691fa.23.1740047942092; 
 Thu, 20 Feb 2025 02:39:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091f503f39sm22024551fa.28.2025.02.20.02.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:39:00 -0800 (PST)
Date: Thu, 20 Feb 2025 12:38:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dsi: Support DSC for dual panel case
Message-ID: <iibq3orsb7uf44luz2he2auox43ki42m2z4nnderyqlhypvfgo@pwqpvua6vuyo>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-5-6c0038d5a2ef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dual-dsi-v2-5-6c0038d5a2ef@linaro.org>
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

On Thu, Feb 20, 2025 at 06:07:56PM +0800, Jun Nie wrote:
> There is dual DSI case that every DSI link is connected to an independent
> panel. In this dual panel case, the frame width for DSC on each link should
> be halved to support the usage case.

Isn't it the case for the DSI panel utilizing two DSI links?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++++++++----
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 ++++++++--
>  3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 35b90c462f637111159b204269ce908614a21586..5a8978bed9f4ca897b418ced60194042d9dd8d05 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -74,7 +74,8 @@ void msm_dsi_host_enable_irq(struct mipi_dsi_host *host);
>  void msm_dsi_host_disable_irq(struct mipi_dsi_host *host);
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_bonded_dsi, struct msm_dsi_phy *phy);
> +			bool is_bonded_dsi, bool is_dual_panel,
> +			struct msm_dsi_phy *phy);
>  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  				  const struct drm_display_mode *mode);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 976c5d82a2efa0fc51657b8534675890be7c33a6..752a97f7181c30dade0a7745492bf16649b3197b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -902,7 +902,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	}
>  }
>  
> -static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> +static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi,
> +			     bool is_dual_panel)
>  {
>  	struct drm_display_mode *mode = msm_host->mode;
>  	u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
> @@ -947,7 +948,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  			return;
>  		}
>  
> -		dsc->pic_width = mode->hdisplay;
> +		if (is_dual_panel)
> +			dsc->pic_width = hdisplay;
> +		else
> +			dsc->pic_width = mode->hdisplay;
>  		dsc->pic_height = mode->vdisplay;
>  		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>  
> @@ -2369,7 +2373,8 @@ static void msm_dsi_sfpb_config(struct msm_dsi_host *msm_host, bool enable)
>  
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_bonded_dsi, struct msm_dsi_phy *phy)
> +			bool is_bonded_dsi, bool is_dual_panel,
> +			struct msm_dsi_phy *phy)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> @@ -2412,7 +2417,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  		goto fail_disable_clk;
>  	}
>  
> -	dsi_timing_setup(msm_host, is_bonded_dsi);
> +	dsi_timing_setup(msm_host, is_bonded_dsi, is_dual_panel);
>  	dsi_sw_reset(msm_host);
>  	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index be13bf682a9601484c9c14e8419563f37c2281ee..158b6cc907cb39cc3b182d3088b793d322a3527c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -24,6 +24,7 @@ struct msm_dsi_manager {
>  	struct msm_dsi *dsi[DSI_MAX];
>  
>  	bool is_bonded_dsi;
> +	bool is_dual_panel;
>  	bool is_sync_needed;
>  	int master_dsi_link_id;
>  };
> @@ -31,6 +32,7 @@ struct msm_dsi_manager {
>  static struct msm_dsi_manager msm_dsim_glb;
>  
>  #define IS_BONDED_DSI()		(msm_dsim_glb.is_bonded_dsi)
> +#define IS_DUAL_PANEL()		(msm_dsim_glb.is_dual_panel)
>  #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
>  #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
>  
> @@ -55,6 +57,7 @@ static int dsi_mgr_parse_of(struct device_node *np, int id)
>  		msm_dsim->is_bonded_dsi = of_property_read_bool(np, "qcom,dual-dsi-mode");
>  
>  	if (msm_dsim->is_bonded_dsi) {
> +		msm_dsim->is_dual_panel = of_property_read_bool(np, "qcom,dual-panel");
>  		if (of_property_read_bool(np, "qcom,master-dsi"))
>  			msm_dsim->master_dsi_link_id = id;
>  		if (!msm_dsim->is_sync_needed)
> @@ -214,6 +217,7 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>  	struct mipi_dsi_host *host = msm_dsi->host;
>  	struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
>  	bool is_bonded_dsi = IS_BONDED_DSI();
> +	bool is_dual_panel = IS_DUAL_PANEL();
>  	int ret;
>  
>  	DBG("id=%d", id);
> @@ -222,7 +226,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>  	if (ret)
>  		goto phy_en_fail;
>  
> -	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_bonded_dsi, msm_dsi->phy);
> +	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
> +				    is_bonded_dsi, is_dual_panel, msm_dsi->phy);
>  	if (ret) {
>  		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
>  		goto host_on_fail;
> @@ -230,7 +235,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>  
>  	if (is_bonded_dsi && msm_dsi1) {
>  		ret = msm_dsi_host_power_on(msm_dsi1->host,
> -				&phy_shared_timings[DSI_1], is_bonded_dsi, msm_dsi1->phy);
> +				&phy_shared_timings[DSI_1], is_bonded_dsi,
> +				is_dual_panel, msm_dsi1->phy);
>  		if (ret) {
>  			pr_err("%s: power on host1 failed, %d\n",
>  							__func__, ret);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
