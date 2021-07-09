Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E73C2B3D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 00:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65836E9A5;
	Fri,  9 Jul 2021 22:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BC76E929
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 22:14:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625868849; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ghUqnG/P49X6tRq7x8XPZKLYsowRvouIU1MAIujMU/Q=;
 b=p7IUpWKK5yrRRsu+R+UpelxadJS6Fqo7w3zBHwsovicf3hg0OlR1glDcMWr9MeGuFLRW4zY1
 2o4MLhmJDGqUQzsy/RT5JOAr+QvJtGeyYwUMCD63Rc0rj9x6mBxodnAjPGRO7uuQ0WNxZtFa
 XBzjZWzRvtgLHHi3eGeCqho/vFY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60e8ca2f5d0d101e38c15094 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 22:14:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 83DA9C43143; Fri,  9 Jul 2021 22:14:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B6FEC4338A;
 Fri,  9 Jul 2021 22:14:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Jul 2021 15:14:06 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v1 2/7] drm/msm/dsi: add two helper functions
In-Reply-To: <20210708122833.363451-3-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-3-dmitry.baryshkov@linaro.org>
Message-ID: <5924470a7b3e94c70ceab7ab49e4b1be@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-08 05:28, Dmitry Baryshkov wrote:
> Add two helper functions to be used by display drivers for setting up
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c         |  7 +++++++
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 14 ++++++--------
>  drivers/gpu/drm/msm/msm_drv.h         | 12 ++++++++++--
>  3 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
> b/drivers/gpu/drm/msm/dsi/dsi.c
> index 75afc12a7b25..5201d7eb0490 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -13,6 +13,13 @@ struct drm_encoder *msm_dsi_get_encoder(struct
> msm_dsi *msm_dsi)
>  	return msm_dsi->encoder;
>  }
> 
> +bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
> +{
> +	unsigned long host_flags = 
> msm_dsi_host_get_mode_flags(msm_dsi->host);
> +
> +	return !(host_flags & MIPI_DSI_MODE_VIDEO);
> +}
> +
>  static int dsi_get_phy(struct msm_dsi *msm_dsi)
>  {
>  	struct platform_device *pdev = msm_dsi->pdev;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 1173663c6d5d..a81105633d3c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -216,12 +216,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge 
> *bridge)
>  	return dsi_bridge->id;
>  }
> 
> -static bool dsi_mgr_is_cmd_mode(struct msm_dsi *msm_dsi)
> -{
> -	unsigned long host_flags = 
> msm_dsi_host_get_mode_flags(msm_dsi->host);
> -	return !(host_flags & MIPI_DSI_MODE_VIDEO);
> -}
> -
>  void msm_dsi_manager_setup_encoder(int id)
>  {
>  	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> @@ -231,7 +225,7 @@ void msm_dsi_manager_setup_encoder(int id)
> 
>  	if (encoder && kms->funcs->set_encoder_mode)
>  		kms->funcs->set_encoder_mode(kms, encoder,
> -					     dsi_mgr_is_cmd_mode(msm_dsi));
> +					     msm_dsi_is_cmd_mode(msm_dsi));
>  }
> 
>  static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 
> id)
> @@ -276,7 +270,7 @@ static int msm_dsi_manager_panel_init(struct
> drm_connector *conn, u8 id)
>  	if (other_dsi && other_dsi->panel && kms->funcs->set_split_display) {
>  		kms->funcs->set_split_display(kms, master_dsi->encoder,
>  					      slave_dsi->encoder,
> -					      dsi_mgr_is_cmd_mode(msm_dsi));
> +					      msm_dsi_is_cmd_mode(msm_dsi));
>  	}
> 
>  out:
> @@ -839,3 +833,7 @@ void msm_dsi_manager_unregister(struct msm_dsi 
> *msm_dsi)
>  		msm_dsim->dsi[msm_dsi->id] = NULL;
>  }
> 
> +bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
> +{
> +	return IS_BONDED_DSI();
> +}
> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
> b/drivers/gpu/drm/msm/msm_drv.h
> index 1a48a709ffb3..e0528dfd965e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -350,7 +350,8 @@ void __exit msm_dsi_unregister(void);
>  int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device 
> *dev,
>  			 struct drm_encoder *encoder);
>  void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi *msm_dsi);
> -
> +bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
> +bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
>  #else
>  static inline void __init msm_dsi_register(void)
>  {
> @@ -367,7 +368,14 @@ static inline int msm_dsi_modeset_init(struct
> msm_dsi *msm_dsi,
>  static inline void msm_dsi_snapshot(struct msm_disp_state
> *disp_state, struct msm_dsi *msm_dsi)
>  {
>  }
> -
> +static inline bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
> +{
> +	return false;
> +}
> +static bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
> +{
> +	return false;
> +}
>  #endif
> 
>  #ifdef CONFIG_DRM_MSM_DP
