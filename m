Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6054A831E63
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 18:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1EC10E882;
	Thu, 18 Jan 2024 17:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8767110E88B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 17:24:40 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc21ad8266fso2951633276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705598620; x=1706203420; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UGVxI9DWCyEsv/jp78Pl1awCTbyR92th5Be9fg9uBng=;
 b=HOQsDisS34auV6Se9Y6qY5itmlY1iEjI062axD9D6kxhvquXbnzUdIZB0CE9orVfic
 wVIMKZwVATi1sqeNZEURGUhpnDA3GV8SJH6nsZwMwTaTkABMaDLWy2HyOg3lLB+c1qCN
 VP6fIuU4d0CYI2C+uSst7Gy14eqLSpaWCpKynLV2ZU1PGFqZB5+p9oBVm5QXr301DGOy
 A77mfuiOeUthSsSXF/gFWR3EM+1kSS2PUQ0+IMVTO9gnTSRsCnJxySg72RmNIojjNYrD
 0R86pLjd1MTy/3k46pXS0opy/A97IAMES7wR5RuXOJFjTGzK3gD4T6jsi8xfT0VQHUyf
 RVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705598620; x=1706203420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UGVxI9DWCyEsv/jp78Pl1awCTbyR92th5Be9fg9uBng=;
 b=FvAgH9nSjQaULpTv7SOHidA0EepRdQW2kBUOK+KKZUkAWp3t5UkLWpB+FDweXglfnW
 PHLWoJXv0p/kCdya/p3g/PEM+d0WBO71nBm+QVz9sDezUhcppNuqLKGTIgtpdYUA12J+
 wsB/Z3ru81ynTq/aDaEzCc9U1Az2pI6UKhWV7K/3LxFQPYtj1pz4G02bIES3xiedYRnx
 HdwGMnnzHExBFLEK91WID4anVAVzAoJPSXuN3qx2NqUl9IvctDLSKVH3wbozZnTumXHV
 kZjkRPZLz9qPMgUD6EkdkE1wTz/LgEhFc9oHwhhKEJKKHyXt7sSdJzHBnPJ1TlpUntRQ
 xRaQ==
X-Gm-Message-State: AOJu0YxPxVcWB/i6aZjCpsFCVovVkR728cA6m3VtbagDxo1LiXJCiMyP
 JwK0FfpAT2SzQe1b3OU+e7GdDu5aJ0NATkNRq+GU4ZR7zMNNBsRPGXge52MNn2q6Ae489OYLeoh
 acZzyO99Kd5GQehnG01Rbmo8MNADPaCDPEu/BqQ==
X-Google-Smtp-Source: AGHT+IFZPZOmSLr8sYUtidrkYXHY+9dCrNdQTcg7gKBq5xIpeY/291djYf1UNIJxnMWWNtfravK1x5+1u8Q9awT4Wj0=
X-Received: by 2002:a25:1846:0:b0:dc2:209d:bc1 with SMTP id
 67-20020a251846000000b00dc2209d0bc1mr1041475yby.9.1705598619558; Thu, 18 Jan
 2024 09:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
 <20240116-jz-test-sim-panel-v1-4-f9511f46c9c7@quicinc.com>
In-Reply-To: <20240116-jz-test-sim-panel-v1-4-f9511f46c9c7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Jan 2024 19:23:27 +0200
Message-ID: <CAA8EJpoa5hrN4x9sUSXPj1UpFa_BKorRj1Kf9d2SE3OZcpvrPw@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] drm/msm/dsi: Add simulated panel support
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Jan 2024 at 00:22, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Introduce the sim_panel_enabled module parameter.
>
> When set, this parameter will force DSI to select the simulated panel
> instead of the physical panel.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c         | 4 ++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 9 ++++++++-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 8 +++++++-
>  3 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index c6bd7bf15605c..daea84f5e3c0c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -5,6 +5,10 @@
>
>  #include "dsi.h"
>
> +bool sim_panel_enabled;
> +MODULE_PARM_DESC(sim_panel_enabled, "Use simulated panel");
> +module_param(sim_panel_enabled, bool, 0444);
> +
>  bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
>  {
>         unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index deeecdfd6c4e4..fa0cab09fff71 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -35,6 +35,8 @@
>
>  #define DSI_RESET_TOGGLE_DELAY_MS 20
>
> +extern bool sim_panel_enabled;
> +
>  static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc);
>
>  static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
> @@ -2009,7 +2011,12 @@ int msm_dsi_host_register(struct mipi_dsi_host *host)
>         if (!msm_host->registered) {
>                 host->dev = &msm_host->pdev->dev;
>                 host->ops = &dsi_host_ops;
> -               ret = mipi_dsi_host_register(host);
> +
> +               if (sim_panel_enabled)
> +                       ret = mipi_dsi_host_register_sim_panel(host);
> +               else
> +                       ret = mipi_dsi_host_register(host);
> +
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 896f369fdd535..e33e6be7309f2 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -30,6 +30,8 @@ struct msm_dsi_manager {
>
>  static struct msm_dsi_manager msm_dsim_glb;
>
> +extern bool sim_panel_enabled;
> +
>  #define IS_BONDED_DSI()                (msm_dsim_glb.is_bonded_dsi)
>  #define IS_SYNC_NEEDED()       (msm_dsim_glb.is_sync_needed)
>  #define IS_MASTER_DSI_LINK(id) (msm_dsim_glb.master_dsi_link_id == id)
> @@ -507,7 +509,11 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
>         int ret;
>
>         int_bridge = msm_dsi->bridge;
> -       ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
> +
> +       if (sim_panel_enabled)
> +               ext_bridge = drm_get_sim_panel_bridge(&msm_dsi->pdev->dev);
> +       else
> +               ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
>                                             msm_dsi->pdev->dev.of_node, 1, 0);

I think that this is definitely an imperfect way to go. We should not
be modifying the DSI host drivers to be able to use the simulation
panel.
Could you please push this to drm_of_find_panel_or_bridge() ?

>         if (IS_ERR(ext_bridge))
>                 return PTR_ERR(ext_bridge);
>
> --
> 2.43.0
>


-- 
With best wishes
Dmitry
