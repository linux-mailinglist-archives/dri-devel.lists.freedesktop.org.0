Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8DE70AC41
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 05:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AE110E1B1;
	Sun, 21 May 2023 03:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0255410E1AE;
 Sun, 21 May 2023 03:56:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA36E60C54;
 Sun, 21 May 2023 03:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D1DC433EF;
 Sun, 21 May 2023 03:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684641371;
 bh=/Ntgei8nnou+5p7rRsKa9cmm4DJ7hZ6Wn8CKBwNWPrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZK1W48SXNWLjqidOc7RqMnvVZRQiXPIqXDDWB/Lgp16ZmZ1jRj3lSHL7T+4gvrBun
 58TjaIS/4iqvtHpH1xDAmVPSb2DegKaDSjV5NX/VzBfarjsCcFb/z5gpEa8Jds6KMl
 qpgkvGL/ks5NrZTXoHFSARyDna+ubLzV7oTvBtaLuhGTxS/Puybx9KfmcSbZ+SmJ8F
 b96gC1MCl+De56CulqaYSqM1vn3D7nDlWjMEVGBK+SL+gVXPabZRhiUsze8R8P0wZy
 jYWWKPv4/EmWFx0zw3wZ4B9bQJFPU6RWFoBSnLMQ+Q3ZTPLJhvYK3wpv+ag94XV4dK
 IahrPB8gH8RsA==
Date: Sat, 20 May 2023 22:56:08 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dp: remove most of usbpd-related remains
Message-ID: <6f5fc2lzpvkvwzjjjj4yi4qkrsi3rava6gwgj2tbbfdshgzgnw@lim7bq37e7ud>
References: <20230520182050.4014143-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230520182050.4014143-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 20, 2023 at 09:20:50PM +0300, Dmitry Baryshkov wrote:
> Remove most of remains of downstream usbpd code. Mainline kernel uses
> different approach for managing Type-C / USB-PD, so this remains unused.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> 
> Changes since v1:
> - Also drop USBPD callbacks as per [1].
> 
> [1] https://patchwork.freedesktop.org/patch/536942/?series=117732&rev=1
> 
> ---
>  drivers/gpu/drm/msm/Makefile        |  1 -
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
>  drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +--
>  drivers/gpu/drm/msm/dp/dp_debug.h   |  5 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 34 +------------
>  drivers/gpu/drm/msm/dp/dp_hpd.c     | 67 -------------------------
>  drivers/gpu/drm/msm/dp/dp_hpd.h     | 78 -----------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
>  drivers/gpu/drm/msm/dp/dp_power.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_power.h   |  3 +-
>  10 files changed, 8 insertions(+), 190 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>  delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7274c41228ed..39d9ac05c4b6 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -122,7 +122,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>  	dp/dp_ctrl.o \
>  	dp/dp_display.o \
>  	dp/dp_drm.o \
> -	dp/dp_hpd.o \
>  	dp/dp_link.o \
>  	dp/dp_panel.o \
>  	dp/dp_parser.o \
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index f712780149fd..b2c27d3532bf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -14,7 +14,6 @@
>  #include "dp_catalog.h"
>  
>  struct dp_ctrl {
> -	bool orientation;
>  	atomic_t aborted;
>  	bool wide_bus_en;
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 5e35033ba3e4..3bba901afe33 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -21,7 +21,6 @@
>  struct dp_debug_private {
>  	struct dentry *root;
>  
> -	struct dp_usbpd *usbpd;
>  	struct dp_link *link;
>  	struct dp_panel *panel;
>  	struct drm_connector *connector;
> @@ -232,14 +231,14 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
>  }
>  
>  struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
> -		struct dp_usbpd *usbpd, struct dp_link *link,
> +		struct dp_link *link,
>  		struct drm_connector *connector, struct drm_minor *minor)
>  {
>  	struct dp_debug_private *debug;
>  	struct dp_debug *dp_debug;
>  	int rc;
>  
> -	if (!dev || !panel || !usbpd || !link) {
> +	if (!dev || !panel || !link) {
>  		DRM_ERROR("invalid input\n");
>  		rc = -EINVAL;
>  		goto error;
> @@ -252,7 +251,6 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
>  	}
>  
>  	debug->dp_debug.debug_en = false;
> -	debug->usbpd = usbpd;
>  	debug->link = link;
>  	debug->panel = panel;
>  	debug->dev = dev;
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
> index 8c0d0b5178fd..124227873d58 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.h
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.h
> @@ -32,7 +32,6 @@ struct dp_debug {
>   *
>   * @dev: device instance of the caller
>   * @panel: instance of panel module
> - * @usbpd: instance of usbpd module
>   * @link: instance of link module
>   * @connector: double pointer to display connector
>   * @minor: pointer to drm minor number after device registration
> @@ -42,7 +41,7 @@ struct dp_debug {
>   * for debugfs input to be communicated with existing modules
>   */
>  struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
> -		struct dp_usbpd *usbpd, struct dp_link *link,
> +		struct dp_link *link,
>  		struct drm_connector *connector,
>  		struct drm_minor *minor);
>  
> @@ -59,7 +58,7 @@ void dp_debug_put(struct dp_debug *dp_debug);
>  
>  static inline
>  struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
> -		struct dp_usbpd *usbpd, struct dp_link *link,
> +		struct dp_link *link,
>  		struct drm_connector *connector, struct drm_minor *minor)
>  {
>  	return ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3e13acdfa7e5..6ccf7de13055 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -14,7 +14,6 @@
>  
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> -#include "dp_hpd.h"
>  #include "dp_parser.h"
>  #include "dp_power.h"
>  #include "dp_catalog.h"
> @@ -88,7 +87,6 @@ struct dp_display_private {
>  	struct platform_device *pdev;
>  	struct dentry *root;
>  
> -	struct dp_usbpd   *usbpd;
>  	struct dp_parser  *parser;
>  	struct dp_power   *power;
>  	struct dp_catalog *catalog;
> @@ -98,7 +96,6 @@ struct dp_display_private {
>  	struct dp_ctrl    *ctrl;
>  	struct dp_debug   *debug;
>  
> -	struct dp_usbpd_cb usbpd_cb;
>  	struct dp_display_mode dp_mode;
>  	struct msm_dp dp_display;
>  
> @@ -462,7 +459,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
>  		dp->dp_display.connector_type, dp->core_initialized,
>  		dp->phy_initialized);
>  
> -	dp_power_init(dp->power, false);
> +	dp_power_init(dp->power);
>  	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>  	dp_aux_init(dp->aux);
>  	dp->core_initialized = true;
> @@ -489,11 +486,6 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>  	return dp_display_process_hpd_high(dp);
>  }
>  
> -static int dp_display_usbpd_disconnect_cb(struct device *dev)
> -{
> -	return 0;
> -}
> -
>  static int dp_display_notify_disconnect(struct device *dev)
>  {
>  	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> @@ -578,13 +570,9 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>  
>  static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>  {
> -	struct dp_usbpd *hpd = dp->usbpd;
>  	u32 state;
>  	int ret;
>  
> -	if (!hpd)
> -		return 0;
> -
>  	mutex_lock(&dp->event_mutex);
>  
>  	state =  dp->hpd_state;
> @@ -645,12 +633,8 @@ static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>  
>  static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>  {
> -	struct dp_usbpd *hpd = dp->usbpd;
>  	u32 state;
>  
> -	if (!hpd)
> -		return 0;
> -
>  	mutex_lock(&dp->event_mutex);
>  
>  	state = dp->hpd_state;
> @@ -763,24 +747,10 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>  {
>  	int rc = 0;
>  	struct device *dev = &dp->pdev->dev;
> -	struct dp_usbpd_cb *cb = &dp->usbpd_cb;
>  	struct dp_panel_in panel_in = {
>  		.dev = dev,
>  	};
>  
> -	/* Callback APIs used for cable status change event */
> -	cb->configure  = dp_display_usbpd_configure_cb;
> -	cb->disconnect = dp_display_usbpd_disconnect_cb;
> -	cb->attention  = dp_display_usbpd_attention_cb;
> -
> -	dp->usbpd = dp_hpd_get(dev, cb);
> -	if (IS_ERR(dp->usbpd)) {
> -		rc = PTR_ERR(dp->usbpd);
> -		DRM_ERROR("failed to initialize hpd, rc = %d\n", rc);
> -		dp->usbpd = NULL;
> -		goto error;
> -	}
> -
>  	dp->parser = dp_parser_get(dp->pdev);
>  	if (IS_ERR(dp->parser)) {
>  		rc = PTR_ERR(dp->parser);
> @@ -1540,7 +1510,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>  	dp = container_of(dp_display, struct dp_display_private, dp_display);
>  	dev = &dp->pdev->dev;
>  
> -	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
> +	dp->debug = dp_debug_get(dev, dp->panel,
>  					dp->link, dp->dp_display.connector,
>  					minor);
>  	if (IS_ERR(dp->debug)) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
> deleted file mode 100644
> index db98a1d431eb..000000000000
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.c
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> - */
> -
> -#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
> -
> -#include <linux/slab.h>
> -#include <linux/device.h>
> -
> -#include "dp_hpd.h"
> -
> -/* DP specific VDM commands */
> -#define DP_USBPD_VDM_STATUS	0x10
> -#define DP_USBPD_VDM_CONFIGURE	0x11
> -
> -/* USBPD-TypeC specific Macros */
> -#define VDM_VERSION		0x0
> -#define USB_C_DP_SID		0xFF01
> -
> -struct dp_hpd_private {
> -	struct device *dev;
> -	struct dp_usbpd_cb *dp_cb;
> -	struct dp_usbpd dp_usbpd;
> -};
> -
> -int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
> -{
> -	int rc = 0;
> -	struct dp_hpd_private *hpd_priv;
> -
> -	hpd_priv = container_of(dp_usbpd, struct dp_hpd_private,
> -					dp_usbpd);
> -
> -	if (!hpd_priv->dp_cb || !hpd_priv->dp_cb->configure
> -				|| !hpd_priv->dp_cb->disconnect) {
> -		pr_err("hpd dp_cb not initialized\n");
> -		return -EINVAL;
> -	}
> -	if (hpd)
> -		hpd_priv->dp_cb->configure(hpd_priv->dev);
> -	else
> -		hpd_priv->dp_cb->disconnect(hpd_priv->dev);
> -
> -	return rc;
> -}
> -
> -struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
> -{
> -	struct dp_hpd_private *dp_hpd;
> -
> -	if (!cb) {
> -		pr_err("invalid cb data\n");
> -		return ERR_PTR(-EINVAL);
> -	}
> -
> -	dp_hpd = devm_kzalloc(dev, sizeof(*dp_hpd), GFP_KERNEL);
> -	if (!dp_hpd)
> -		return ERR_PTR(-ENOMEM);
> -
> -	dp_hpd->dev = dev;
> -	dp_hpd->dp_cb = cb;
> -
> -	dp_hpd->dp_usbpd.connect = dp_hpd_connect;
> -
> -	return &dp_hpd->dp_usbpd;
> -}
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
> deleted file mode 100644
> index 8feec5aa5027..000000000000
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.h
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef _DP_HPD_H_
> -#define _DP_HPD_H_
> -
> -//#include <linux/usb/usbpd.h>
> -
> -#include <linux/types.h>
> -#include <linux/device.h>
> -
> -enum plug_orientation {
> -	ORIENTATION_NONE,
> -	ORIENTATION_CC1,
> -	ORIENTATION_CC2,
> -};
> -
> -/**
> - * struct dp_usbpd - DisplayPort status
> - *
> - * @orientation: plug orientation configuration
> - * @low_pow_st: low power state
> - * @adaptor_dp_en: adaptor functionality enabled
> - * @multi_func: multi-function preferred
> - * @usb_config_req: request to switch to usb
> - * @exit_dp_mode: request exit from displayport mode
> - * @hpd_irq: Change in the status since last message
> - * @alt_mode_cfg_done: bool to specify alt mode status
> - * @debug_en: bool to specify debug mode
> - * @connect: simulate disconnect or connect for debug mode
> - */
> -struct dp_usbpd {
> -	enum plug_orientation orientation;
> -	bool low_pow_st;
> -	bool adaptor_dp_en;
> -	bool multi_func;
> -	bool usb_config_req;
> -	bool exit_dp_mode;
> -	bool hpd_irq;
> -	bool alt_mode_cfg_done;
> -	bool debug_en;
> -
> -	int (*connect)(struct dp_usbpd *dp_usbpd, bool hpd);
> -};
> -
> -/**
> - * struct dp_usbpd_cb - callback functions provided by the client
> - *
> - * @configure: called by usbpd module when PD communication has
> - * been completed and the usb peripheral has been configured on
> - * dp mode.
> - * @disconnect: notify the cable disconnect issued by usb.
> - * @attention: notify any attention message issued by usb.
> - */
> -struct dp_usbpd_cb {
> -	int (*configure)(struct device *dev);
> -	int (*disconnect)(struct device *dev);
> -	int (*attention)(struct device *dev);
> -};
> -
> -/**
> - * dp_hpd_get() - setup hpd module
> - *
> - * @dev: device instance of the caller
> - * @cb: struct containing callback function pointers.
> - *
> - * This function allows the client to initialize the usbpd
> - * module. The module will communicate with HPD module.
> - */
> -struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb);
> -
> -int dp_hpd_register(struct dp_usbpd *dp_usbpd);
> -void dp_hpd_unregister(struct dp_usbpd *dp_usbpd);
> -int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd);
> -
> -#endif /* _DP_HPD_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 45208b45eb53..ed1030e17e1b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -10,7 +10,6 @@
>  
>  #include "dp_aux.h"
>  #include "dp_link.h"
> -#include "dp_hpd.h"
>  
>  struct edid;
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index c0aaabb03389..6f88c344db99 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -195,7 +195,7 @@ void dp_power_client_deinit(struct dp_power *dp_power)
>  	pm_runtime_disable(&power->pdev->dev);
>  }
>  
> -int dp_power_init(struct dp_power *dp_power, bool flip)
> +int dp_power_init(struct dp_power *dp_power)
>  {
>  	int rc = 0;
>  	struct dp_power_private *power = NULL;
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
> index e3f959ffae12..a3dec200785e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.h
> +++ b/drivers/gpu/drm/msm/dp/dp_power.h
> @@ -26,13 +26,12 @@ struct dp_power {
>   * dp_power_init() - enable power supplies for display controller
>   *
>   * @power: instance of power module
> - * @flip: bool for flipping gpio direction
>   * return: 0 if success or error if failure.
>   *
>   * This API will turn on the regulators and configures gpio's
>   * aux/hpd.
>   */
> -int dp_power_init(struct dp_power *power, bool flip);
> +int dp_power_init(struct dp_power *power);
>  
>  /**
>   * dp_power_deinit() - turn off regulators and gpios.
> -- 
> 2.39.2
> 
