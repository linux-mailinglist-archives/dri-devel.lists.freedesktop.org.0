Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4AF625E60
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 16:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178A110E866;
	Fri, 11 Nov 2022 15:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4890B10E1A6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 15:30:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id t4so3124242wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 07:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vjn5ArajltTgQv7pr83EbNmuV+rzl/lcsKfB/E3PF3U=;
 b=w+iYumzSgV5MUWdaXdlC9tFl24yHNJlS8ht0BC721LuNpPCmNDzYjMmqnuId0qFU+b
 IFC/t4sVxxAizxbdUomvW6O2v7ay4yWr7T5OdRdzHJvOX5qwu6jfkwGMMH3uruxp/BwN
 YgWsN93JD0qPxEiPHr6TOjlQLs6Mrz1AdyF1q26eZtYeqY/1g9PNorUqpCt13S5qtg/C
 aM7N3RPFeevI8cBrFmX4iCMgDpEzw/193JjkNZ5h/H2c65nwqEeKa3ITiRBr4fk8uoX8
 lNsULb+bg67SxM9l04KY0Y7cEfQOVN6Gs2wpPOMEK7M6iIUe41BXwtWQK72e29JCmjp4
 Ohjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vjn5ArajltTgQv7pr83EbNmuV+rzl/lcsKfB/E3PF3U=;
 b=x/KLeWFRC46rW1iKsmAgiFzcOXPYTnLZvCnPLYjF1JHUaGWgDbSQURW+UoqcYhUBDs
 Wsa8ELsXMCUZxSAmcv6mibsR+liuoiZ7BYM7+IsG70lLlTPiaTZrSNpFIr91o/TO3wu5
 ZQ+10Iyt1qWtJ3qLCE6RJkfd62OCh2dcZ3Dus2NWVU5DjPRpECSfWyU8KxZbD1MpLJB+
 mfCS3NXJRGDMcSIo+l9jRgZ+r8RB4K7r7JkqFiGzIxxhJ+BMzsoDRuA4viE7yx3ayEaH
 ZbtJSaFsk5r1Xi+4yE35eddUC/g9hN25KGjpXJ55ekWJmVxjwE6Ke/U4c8a1mBnUKr4D
 zkPQ==
X-Gm-Message-State: ANoB5plkfEDvzLJWLEYYuSiWAMZkQVabM7mtY4datz+2ZIsHvPvX4zoL
 3ancecW/UPT0CYXAoqwwI/wRiUUb96QVZw==
X-Google-Smtp-Source: AA0mqf6XUsCI4dEcgyxw1YLh0eyO9s01T1miqOA9TEcrGum/b6WWFu2rmPcmcy6aNoFNJHGCe0WAqw==
X-Received: by 2002:a7b:ce86:0:b0:3cf:88d3:5685 with SMTP id
 q6-20020a7bce86000000b003cf88d35685mr1654678wmj.38.1668180639514; 
 Fri, 11 Nov 2022 07:30:39 -0800 (PST)
Received: from [192.168.246.1] (92.40.175.160.threembb.co.uk. [92.40.175.160])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003b4a68645e9sm9991840wmq.34.2022.11.11.07.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 07:30:38 -0800 (PST)
Message-ID: <1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org>
Date: Fri, 11 Nov 2022 15:30:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2.5] drm/msm/dsi: switch to DRM_PANEL_BRIDGE
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <0abf1924-485b-8f1c-c8c8-d14dcccc3a27@quicinc.com>
 <0Co5PrfVEsYkXu9wz6ixpiFl0aWmXfIng6NSPOiYNcrAfHZx0w2crkWN7InPdtR-YTAb1IxLovgcEHCmFpmaqA==@protonmail.internalid>
 <20220712132258.671263-1-dmitry.baryshkov@linaro.org>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20220712132258.671263-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch has caused a regression on 6.1-rc for some devices that use 
DSI panels. The new behaviour results in the DSI controller being 
switched off before the panel unprepare hook is called. As a result, 
panel drivers which call mipi_dsi_dcs_write() or similar in 
unprepare() fail.

I've noticed it specifically on the OnePlus 6 (with upstream Samsung 
s0fef00 panel driver) and the SHIFT6mq with an out of tree driver.

On 12/07/2022 14:22, Dmitry Baryshkov wrote:
> Currently the DSI driver has two separate paths: one if the next device
> in a chain is a bridge and another one if the panel is connected
> directly to the DSI host. Simplify the code path by using panel-bridge
> driver (already selected in Kconfig) and dropping support for
> handling the panel directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> I'm not sending this as a separate patchset (I'd like to sort out mdp5
> first), but more of a preview of changes related to
> msm_dsi_manager_ext_bridge_init().
> 
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c         |  35 +---
>   drivers/gpu/drm/msm/dsi/dsi.h         |  16 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c    |  25 ---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 283 +++-----------------------
>   4 files changed, 36 insertions(+), 323 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 1625328fa430..4edb9167e600 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -6,14 +6,6 @@
>   #include "dsi.h"
>   #include "dsi_cfg.h"
> 
> -struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
> -{
> -	if (!msm_dsi || !msm_dsi_device_connected(msm_dsi))
> -		return NULL;
> -
> -	return msm_dsi->encoder;
> -}
> -
>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
>   {
>   	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
> @@ -220,7 +212,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   			 struct drm_encoder *encoder)
>   {
>   	struct msm_drm_private *priv;
> -	struct drm_bridge *ext_bridge;
>   	int ret;
> 
>   	if (WARN_ON(!encoder) || WARN_ON(!msm_dsi) || WARN_ON(!dev))
> @@ -254,26 +245,10 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   		goto fail;
>   	}
> 
> -	/*
> -	 * check if the dsi encoder output is connected to a panel or an
> -	 * external bridge. We create a connector only if we're connected to a
> -	 * drm_panel device. When we're connected to an external bridge, we
> -	 * assume that the drm_bridge driver will create the connector itself.
> -	 */
> -	ext_bridge = msm_dsi_host_get_bridge(msm_dsi->host);
> -
> -	if (ext_bridge)
> -		msm_dsi->connector =
> -			msm_dsi_manager_ext_bridge_init(msm_dsi->id);
> -	else
> -		msm_dsi->connector =
> -			msm_dsi_manager_connector_init(msm_dsi->id);
> -
> -	if (IS_ERR(msm_dsi->connector)) {
> -		ret = PTR_ERR(msm_dsi->connector);
> +	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
> +	if (ret) {
>   		DRM_DEV_ERROR(dev->dev,
>   			"failed to create dsi connector: %d\n", ret);
> -		msm_dsi->connector = NULL;
>   		goto fail;
>   	}
> 
> @@ -287,12 +262,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   		msm_dsi->bridge = NULL;
>   	}
> 
> -	/* don't destroy connector if we didn't make it */
> -	if (msm_dsi->connector && !msm_dsi->external_bridge)
> -		msm_dsi->connector->funcs->destroy(msm_dsi->connector);
> -
> -	msm_dsi->connector = NULL;
> -
>   	return ret;
>   }
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 580a1e6358bf..703e4c88d7fb 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -12,7 +12,6 @@
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_mipi_dsi.h>
> -#include <drm/drm_panel.h>
> 
>   #include "msm_drv.h"
>   #include "disp/msm_disp_snapshot.h"
> @@ -49,8 +48,6 @@ struct msm_dsi {
>   	struct drm_device *dev;
>   	struct platform_device *pdev;
> 
> -	/* connector managed by us when we're connected to a drm_panel */
> -	struct drm_connector *connector;
>   	/* internal dsi bridge attached to MDP interface */
>   	struct drm_bridge *bridge;
> 
> @@ -58,10 +55,8 @@ struct msm_dsi {
>   	struct msm_dsi_phy *phy;
> 
>   	/*
> -	 * panel/external_bridge connected to dsi bridge output, only one of the
> -	 * two can be valid at a time
> +	 * external_bridge connected to dsi bridge output
>   	 */
> -	struct drm_panel *panel;
>   	struct drm_bridge *external_bridge;
> 
>   	struct device *phy_dev;
> @@ -76,8 +71,7 @@ struct msm_dsi {
>   /* dsi manager */
>   struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
>   void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
> -struct drm_connector *msm_dsi_manager_connector_init(u8 id);
> -struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
> +int msm_dsi_manager_ext_bridge_init(u8 id);
>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>   bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
>   int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
> @@ -87,11 +81,9 @@ void msm_dsi_manager_tpg_enable(void);
>   /* msm dsi */
>   static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
>   {
> -	return msm_dsi->panel || msm_dsi->external_bridge;
> +	return msm_dsi->external_bridge;
>   }
> 
> -struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
> -
>   /* dsi host */
>   struct msm_dsi_host;
>   int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
> @@ -116,9 +108,7 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>   				  const struct drm_display_mode *mode);
>   enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>   					    const struct drm_display_mode *mode);
> -struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
>   unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
> -struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
>   int msm_dsi_host_register(struct mipi_dsi_host *host);
>   void msm_dsi_host_unregister(struct mipi_dsi_host *host);
>   void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index fb5ab6c718c8..5a18aa710d00 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -164,7 +164,6 @@ struct msm_dsi_host {
>   	struct msm_display_dsc_config *dsc;
> 
>   	/* connected device info */
> -	struct device_node *device_node;
>   	unsigned int channel;
>   	unsigned int lanes;
>   	enum mipi_dsi_pixel_format format;
> @@ -1721,8 +1720,6 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
> 
>   	dsi_dev_detach(msm_host->pdev);
> 
> -	msm_host->device_node = NULL;
> -
>   	DBG("id=%d", msm_host->id);
>   	if (msm_host->dev)
>   		queue_work(msm_host->workqueue, &msm_host->hpd_work);
> @@ -1988,16 +1985,6 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
>   		goto err;
>   	}
> 
> -	/* Get panel node from the output port's endpoint data */
> -	device_node = of_graph_get_remote_node(np, 1, 0);
> -	if (!device_node) {
> -		DRM_DEV_DEBUG(dev, "%s: no valid device\n", __func__);
> -		ret = -ENODEV;
> -		goto err;
> -	}
> -
> -	msm_host->device_node = device_node;
> -
>   	if (of_property_read_bool(np, "syscon-sfpb")) {
>   		msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
>   					"syscon-sfpb");
> @@ -2678,23 +2665,11 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>   	return MODE_OK;
>   }
> 
> -struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host)
> -{
> -	return of_drm_find_panel(to_msm_dsi_host(host)->device_node);
> -}
> -
>   unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host)
>   {
>   	return to_msm_dsi_host(host)->mode_flags;
>   }
> 
> -struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
> -{
> -	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> -
> -	return of_drm_find_bridge(msm_host->device_node);
> -}
> -
>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host)
>   {
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index cb84d185d73a..546e0b873558 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -214,39 +214,26 @@ static void dsi_mgr_phy_disable(int id)
>   	}
>   }
> 
> -struct dsi_connector {
> -	struct drm_connector base;
> -	int id;
> -};
> -
>   struct dsi_bridge {
>   	struct drm_bridge base;
>   	int id;
>   };
> 
> -#define to_dsi_connector(x) container_of(x, struct dsi_connector, base)
>   #define to_dsi_bridge(x) container_of(x, struct dsi_bridge, base)
> 
> -static inline int dsi_mgr_connector_get_id(struct drm_connector *connector)
> -{
> -	struct dsi_connector *dsi_connector = to_dsi_connector(connector);
> -	return dsi_connector->id;
> -}
> -
>   static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
>   {
>   	struct dsi_bridge *dsi_bridge = to_dsi_bridge(bridge);
>   	return dsi_bridge->id;
>   }
> 
> -static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
> +static void msm_dsi_manager_set_split_display(u8 id)
>   {
> -	struct msm_drm_private *priv = conn->dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
> +	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
> +	struct msm_kms *kms = priv->kms;
>   	struct msm_dsi *master_dsi, *slave_dsi;
> -	struct drm_panel *panel;
> 
>   	if (IS_BONDED_DSI() && !IS_MASTER_DSI_LINK(id)) {
>   		master_dsi = other_dsi;
> @@ -256,89 +243,18 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
>   		slave_dsi = other_dsi;
>   	}
> 
> -	/*
> -	 * There is only 1 panel in the global panel list for bonded DSI mode.
> -	 * Therefore slave dsi should get the drm_panel instance from master
> -	 * dsi.
> -	 */
> -	panel = msm_dsi_host_get_panel(master_dsi->host);
> -	if (IS_ERR(panel)) {
> -		DRM_ERROR("Could not find panel for %u (%ld)\n", msm_dsi->id,
> -			  PTR_ERR(panel));
> -		return PTR_ERR(panel);
> -	}
> -
> -	if (!panel || !IS_BONDED_DSI())
> -		goto out;
> -
> -	drm_object_attach_property(&conn->base,
> -				   conn->dev->mode_config.tile_property, 0);
> +	if (!msm_dsi->external_bridge || !IS_BONDED_DSI())
> +		return;
> 
>   	/*
>   	 * Set split display info to kms once bonded DSI panel is connected to
>   	 * both hosts.
>   	 */
> -	if (other_dsi && other_dsi->panel && kms->funcs->set_split_display) {
> +	if (other_dsi && other_dsi->external_bridge && kms->funcs->set_split_display) {
>   		kms->funcs->set_split_display(kms, master_dsi->encoder,
>   					      slave_dsi->encoder,
>   					      msm_dsi_is_cmd_mode(msm_dsi));
>   	}
> -
> -out:
> -	msm_dsi->panel = panel;
> -	return 0;
> -}
> -
> -static enum drm_connector_status dsi_mgr_connector_detect(
> -		struct drm_connector *connector, bool force)
> -{
> -	int id = dsi_mgr_connector_get_id(connector);
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -
> -	return msm_dsi->panel ? connector_status_connected :
> -		connector_status_disconnected;
> -}
> -
> -static void dsi_mgr_connector_destroy(struct drm_connector *connector)
> -{
> -	struct dsi_connector *dsi_connector = to_dsi_connector(connector);
> -
> -	DBG("");
> -
> -	drm_connector_cleanup(connector);
> -
> -	kfree(dsi_connector);
> -}
> -
> -static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
> -{
> -	int id = dsi_mgr_connector_get_id(connector);
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -	struct drm_panel *panel = msm_dsi->panel;
> -	int num;
> -
> -	if (!panel)
> -		return 0;
> -
> -	/*
> -	 * In bonded DSI mode, we have one connector that can be
> -	 * attached to the drm_panel.
> -	 */
> -	num = drm_panel_get_modes(panel, connector);
> -	if (!num)
> -		return 0;
> -
> -	return num;
> -}
> -
> -static struct drm_encoder *
> -dsi_mgr_connector_best_encoder(struct drm_connector *connector)
> -{
> -	int id = dsi_mgr_connector_get_id(connector);
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -
> -	DBG("");
> -	return msm_dsi_get_encoder(msm_dsi);
>   }
> 
>   static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> @@ -403,7 +319,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>   	struct mipi_dsi_host *host = msm_dsi->host;
> -	struct drm_panel *panel = msm_dsi->panel;
>   	bool is_bonded_dsi = IS_BONDED_DSI();
>   	int ret;
> 
> @@ -418,18 +333,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   	if (!dsi_mgr_power_on_early(bridge))
>   		dsi_mgr_bridge_power_on(bridge);
> 
> -	/* Always call panel functions once, because even for dual panels,
> -	 * there is only one drm_panel instance.
> -	 */
> -	if (panel) {
> -		ret = drm_panel_prepare(panel);
> -		if (ret) {
> -			pr_err("%s: prepare panel %d failed, %d\n", __func__,
> -								id, ret);
> -			goto panel_prep_fail;
> -		}
> -	}
> -
>   	ret = msm_dsi_host_enable(host);
>   	if (ret) {
>   		pr_err("%s: enable host %d failed, %d\n", __func__, id, ret);
> @@ -449,9 +352,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   host1_en_fail:
>   	msm_dsi_host_disable(host);
>   host_en_fail:
> -	if (panel)
> -		drm_panel_unprepare(panel);
> -panel_prep_fail:
> 
>   	return;
>   }
> @@ -469,62 +369,12 @@ void msm_dsi_manager_tpg_enable(void)
>   	}
>   }
> 
> -static void dsi_mgr_bridge_enable(struct drm_bridge *bridge)
> -{
> -	int id = dsi_mgr_bridge_get_id(bridge);
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -	struct drm_panel *panel = msm_dsi->panel;
> -	bool is_bonded_dsi = IS_BONDED_DSI();
> -	int ret;
> -
> -	DBG("id=%d", id);
> -	if (!msm_dsi_device_connected(msm_dsi))
> -		return;
> -
> -	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
> -	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
> -		return;
> -
> -	if (panel) {
> -		ret = drm_panel_enable(panel);
> -		if (ret) {
> -			pr_err("%s: enable panel %d failed, %d\n", __func__, id,
> -									ret);
> -		}
> -	}
> -}
> -
> -static void dsi_mgr_bridge_disable(struct drm_bridge *bridge)
> -{
> -	int id = dsi_mgr_bridge_get_id(bridge);
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -	struct drm_panel *panel = msm_dsi->panel;
> -	bool is_bonded_dsi = IS_BONDED_DSI();
> -	int ret;
> -
> -	DBG("id=%d", id);
> -	if (!msm_dsi_device_connected(msm_dsi))
> -		return;
> -
> -	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
> -	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
> -		return;
> -
> -	if (panel) {
> -		ret = drm_panel_disable(panel);
> -		if (ret)
> -			pr_err("%s: Panel %d OFF failed, %d\n", __func__, id,
> -									ret);
> -	}
> -}
> -
>   static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
>   {
>   	int id = dsi_mgr_bridge_get_id(bridge);
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>   	struct mipi_dsi_host *host = msm_dsi->host;
> -	struct drm_panel *panel = msm_dsi->panel;
>   	bool is_bonded_dsi = IS_BONDED_DSI();
>   	int ret;
> 
> @@ -551,13 +401,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
>   			pr_err("%s: host1 disable failed, %d\n", __func__, ret);
>   	}
> 
> -	if (panel) {
> -		ret = drm_panel_unprepare(panel);
> -		if (ret)
> -			pr_err("%s: Panel %d unprepare failed,%d\n", __func__,
> -								id, ret);
> -	}
> -
>   	msm_dsi_host_disable_irq(host);
>   	if (is_bonded_dsi && msm_dsi1)
>   		msm_dsi_host_disable_irq(msm_dsi1->host);
> @@ -614,76 +457,13 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>   	return msm_dsi_host_check_dsc(host, mode);
>   }
> 
> -static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
> -	.detect = dsi_mgr_connector_detect,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = dsi_mgr_connector_destroy,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static const struct drm_connector_helper_funcs dsi_mgr_conn_helper_funcs = {
> -	.get_modes = dsi_mgr_connector_get_modes,
> -	.best_encoder = dsi_mgr_connector_best_encoder,
> -};
> -
>   static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
>   	.pre_enable = dsi_mgr_bridge_pre_enable,
> -	.enable = dsi_mgr_bridge_enable,
> -	.disable = dsi_mgr_bridge_disable,
>   	.post_disable = dsi_mgr_bridge_post_disable,
>   	.mode_set = dsi_mgr_bridge_mode_set,
>   	.mode_valid = dsi_mgr_bridge_mode_valid,
>   };
> 
> -/* initialize connector when we're connected to a drm_panel */
> -struct drm_connector *msm_dsi_manager_connector_init(u8 id)
> -{
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -	struct drm_connector *connector = NULL;
> -	struct dsi_connector *dsi_connector;
> -	int ret;
> -
> -	dsi_connector = kzalloc(sizeof(*dsi_connector), GFP_KERNEL);
> -	if (!dsi_connector)
> -		return ERR_PTR(-ENOMEM);
> -
> -	dsi_connector->id = id;
> -
> -	connector = &dsi_connector->base;
> -
> -	ret = drm_connector_init(msm_dsi->dev, connector,
> -			&dsi_mgr_connector_funcs, DRM_MODE_CONNECTOR_DSI);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	drm_connector_helper_add(connector, &dsi_mgr_conn_helper_funcs);
> -
> -	/* Enable HPD to let hpd event is handled
> -	 * when panel is attached to the host.
> -	 */
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -	/* Display driver doesn't support interlace now. */
> -	connector->interlace_allowed = 0;
> -	connector->doublescan_allowed = 0;
> -
> -	drm_connector_attach_encoder(connector, msm_dsi->encoder);
> -
> -	ret = msm_dsi_manager_panel_init(connector, id);
> -	if (ret) {
> -		DRM_DEV_ERROR(msm_dsi->dev->dev, "init panel failed %d\n", ret);
> -		goto fail;
> -	}
> -
> -	return connector;
> -
> -fail:
> -	connector->funcs->destroy(connector);
> -	return ERR_PTR(ret);
> -}
> -
>   /* initialize bridge */
>   struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
>   {
> @@ -722,18 +502,21 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
>   	return ERR_PTR(ret);
>   }
> 
> -struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
> +int msm_dsi_manager_ext_bridge_init(u8 id)
>   {
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct drm_device *dev = msm_dsi->dev;
> -	struct drm_connector *connector;
>   	struct drm_encoder *encoder;
>   	struct drm_bridge *int_bridge, *ext_bridge;
>   	int ret;
> 
>   	int_bridge = msm_dsi->bridge;
> -	ext_bridge = msm_dsi->external_bridge =
> -			msm_dsi_host_get_bridge(msm_dsi->host);
> +	ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
> +					    msm_dsi->pdev->dev.of_node, 1, 0);
> +	if (IS_ERR(ext_bridge))
> +		return PTR_ERR(ext_bridge);
> +
> +	msm_dsi->external_bridge = ext_bridge;
> 
>   	encoder = msm_dsi->encoder;
> 
> @@ -745,36 +528,32 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>   	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
>   			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (ret == -EINVAL) {
> -		struct drm_connector *connector;
> -		struct list_head *connector_list;
> -
> -		/* link the internal dsi bridge to the external bridge */
> -		drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
> -
>   		/*
> -		 * we need the drm_connector created by the external bridge
> -		 * driver (or someone else) to feed it to our driver's
> -		 * priv->connector[] list, mainly for msm_fbdev_init()
> +		 * link the internal dsi bridge to the external bridge,
> +		 * connector is created by the next bridge.
>   		 */
> -		connector_list = &dev->mode_config.connector_list;
> +		ret = drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		struct drm_connector *connector;
> 
> -		list_for_each_entry(connector, connector_list, head) {
> -			if (drm_connector_has_possible_encoder(connector, encoder))
> -				return connector;
> +		/* We are in charge of the connector, create one now. */
> +		connector = drm_bridge_connector_init(dev, encoder);
> +		if (IS_ERR(connector)) {
> +			DRM_ERROR("Unable to create bridge connector\n");
> +			return PTR_ERR(connector);
>   		}
> 
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	connector = drm_bridge_connector_init(dev, encoder);
> -	if (IS_ERR(connector)) {
> -		DRM_ERROR("Unable to create bridge connector\n");
> -		return ERR_CAST(connector);
> +		ret = drm_connector_attach_encoder(connector, encoder);
> +		if (ret < 0)
> +			return ret;
>   	}
> 
> -	drm_connector_attach_encoder(connector, encoder);
> +	/* The pipeline is ready, ping encoders if necessary */
> +	msm_dsi_manager_set_split_display(id);
> 
> -	return connector;
> +	return 0;
>   }
> 
>   void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
> --
> 2.35.1
> 

-- 
Kind Regards,
Caleb (they/them)
