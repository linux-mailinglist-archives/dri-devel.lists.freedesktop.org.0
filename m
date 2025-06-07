Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E00AAD14D2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E6510E4B1;
	Sun,  8 Jun 2025 21:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=heitbaum.com header.i=@heitbaum.com header.b="AtKKm0BA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4E010E116
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jun 2025 13:54:55 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22c33677183so25925735ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jun 2025 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heitbaum.com; s=google; t=1749304495; x=1749909295;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nfQy6KIFglFdWPRXVCbLuDtdfqFk5ju6eWucgsDyGDE=;
 b=AtKKm0BAIqL7pWzyjeJ1wm9KIeNy6rzsL1svOX9WfhgrWBx+Xyw5f85UxADjan6rxq
 0RZNNVSH4XBTkwjJj/EwVaMQWwS8Ow+zYLIhOV4Kr/Km53WsjGZMtacqnOC1wouvG8rv
 QY3INeIQc4cX6kdq+i1OYYevRinrGwFAtyZmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749304495; x=1749909295;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfQy6KIFglFdWPRXVCbLuDtdfqFk5ju6eWucgsDyGDE=;
 b=GwPHkNFdA4doMxkG7XBkPY+ZZggBvAwsIVzqwWH/A0n6gTKT6qnvfBxDUUKqxOBgFM
 dNkCZv58ZOKMX6AMNZb77o2EC1MGi4LUN/1PvAy6lQ80VtZwCYcpMxfT7ZzVtSZDBAmM
 Wr9rRi8TVDEs9vLU1yi3j8cQDBBES9zcTSI145G+M2xSbBrN1qL4I5CQcEYYpsk+sew2
 6ZtUzcMQFWVz8jxGta1deyYBR6UVWsbHZmjurQWKFG6UbqLdUZ99kjBk+0c89ejZkOvm
 jLqscMp9Ecx6DRVRbUcttOcKFqFfLgr9CiY3M2Z/o6HZKdRFaLMygiJyVQbguxk/hdcy
 PUOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnFxV367UXTETVPsSCEsTEClXVDG/Ri6zgJv8D8/izoR28lkqkt2A4YC7fQyTdXOYwGf9shBuG5hs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpQWTCzIsc4h5nSFThPSpBENy4sRaqQEJoIa1s/+g8zhXGZuNd
 sctaqCJglnVwMh1GtVk5TDnLn2CxmhZswduw/LxYIXTWxMTRTNQrdPu4FBmG52dp+3Y=
X-Gm-Gg: ASbGncsPLzyyI0PWCwTNXIN5GU2SXZmTS4ZrlnKbI9QigdshkBTfV7vNy9Btgj/LaYe
 tLOd3ooIo8Q8VbrP9bLHZ4/YdbXQ8oyMoUUv3YLUE/2cphUwBu/1MFXezGE0PCpGkS9rBdTpfrR
 Efk7qMP0Lv1y+XMLw5Q4NTNIxm6o2tyidzYrPiC9wP0rb4yPoNhwlAncGKCMTvWGBZZe/ipvZzS
 JxGHOm4GLUMJAqj/W8yC2G3KOTbNlB1AmFwAVqou40rKHLI+/RmAk9SYoFqepF7vuZA6/YH1HCP
 xZXvjnqyf4nNjVKllB5QrTDfce2jDwPQndmVqaBq0tG4824AJ9OSvcaabhtZ5QMCAcJfDvQ=
X-Google-Smtp-Source: AGHT+IHUFROywX2z9hhR6aUUNIQXaS3RDzGYgZWaHQ49YGLAahqHE23YY0JnhdBX+yYDCIBVyTa7Og==
X-Received: by 2002:a17:902:e890:b0:234:d1f2:da31 with SMTP id
 d9443c01a7336-23601d04105mr104766975ad.2.1749304495058; 
 Sat, 07 Jun 2025 06:54:55 -0700 (PDT)
Received: from bb350dd4b0a6 ([122.199.11.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fce7esm27659075ad.114.2025.06.07.06.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 06:54:54 -0700 (PDT)
Date: Sat, 7 Jun 2025 13:54:45 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, mripard@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com,
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v20 0/8] Initial support Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
Message-ID: <aEREpfjiB52Xg6tQ@bb350dd4b0a6>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1734340233.git.Sandor.yu@nxp.com>
X-Mailman-Approved-At: Sun, 08 Jun 2025 21:44:43 +0000
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

Hi Sandor,

Just following up on the status of a v21 and upstream status, as I note
that with the release of kernel 6.15, the following patch is required to
apply the v20 patchset to linux 6.15.

Thanks
Rudi

commit 4537b799d9af621587cfd6c23da620fe95c5b65e
Author: Rudi Heitbaum <rudi@heitbaum.com>
Date:   Sat May 24 14:13:25 2025 +0000

    linux (NXP iMX8): rebase HDMI patches for 6.15
    
    - https://lore.kernel.org/all/20250213-bridge-connector-v3-3-e71598f49c8f@kernel.org/
    - https://github.com/torvalds/linux/commit/c2b190bf2a8bd02ac196a5a41a00f2bbb73e8252

diff --git a/projects/NXP/devices/iMX8/patches/linux/0001-Initial-support-Cadence-MHDP8501-HDMI-DP-for-i-MX8MQ.patch b/projects/NXP/devices/iMX8/patches/linux/0001-Initial-support-Cadence-MHDP8501-HDMI-DP-for-i-MX8MQ.patch
index 4ada9c6baa..02f0c17ec2 100644
--- a/projects/NXP/devices/iMX8/patches/linux/0001-Initial-support-Cadence-MHDP8501-HDMI-DP-for-i-MX8MQ.patch
+++ b/projects/NXP/devices/iMX8/patches/linux/0001-Initial-support-Cadence-MHDP8501-HDMI-DP-for-i-MX8MQ.patch
@@ -3641,7 +3641,7 @@ new file mode 100644
 index 0000000000000..157b4d44b9e2b
 --- /dev/null
 +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
-@@ -0,0 +1,694 @@
+@@ -0,0 +1,693 @@
 +// SPDX-License-Identifier: GPL-2.0-only
 +/*
 + * Cadence MHDP8501 DisplayPort(DP) bridge driver
@@ -4269,7 +4269,7 @@ index 0000000000000..157b4d44b9e2b
 +}
 +
 +static void cdns_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-+					  struct drm_bridge_state *old_state)
++					  struct drm_atomic_state *state)
 +{
 +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
 +
@@ -4280,10 +4280,9 @@ index 0000000000000..157b4d44b9e2b
 +}
 +
 +static void cdns_dp_bridge_atomic_enable(struct drm_bridge *bridge,
-+					 struct drm_bridge_state *old_state)
++					 struct drm_atomic_state *state)
 +{
 +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
-+	struct drm_atomic_state *state = old_state->base.state;
 +	struct drm_connector *connector;
 +	struct drm_crtc_state *crtc_state;
 +	struct drm_connector_state *conn_state;
@@ -4341,7 +4340,7 @@ new file mode 100644
 index 0000000000000..9556d0929e21d
 --- /dev/null
 +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
-@@ -0,0 +1,745 @@
+@@ -0,0 +1,744 @@
 +// SPDX-License-Identifier: GPL-2.0-only
 +/*
 + * Cadence MHDP8501 HDMI bridge driver
@@ -4943,7 +4942,7 @@ index 0000000000000..9556d0929e21d
 +}
 +
 +static void cdns_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
-+					    struct drm_bridge_state *old_state)
++					    struct drm_atomic_state *state)
 +{
 +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
 +
@@ -4953,10 +4952,9 @@ index 0000000000000..9556d0929e21d
 +}
 +
 +static void cdns_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
-+					   struct drm_bridge_state *old_state)
++					   struct drm_atomic_state *state)
 +{
 +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
-+	struct drm_atomic_state *state = old_state->base.state;
 +	struct drm_connector *connector;
 +	struct drm_crtc_state *crtc_state;
 +	struct drm_connector_state *conn_state;

On Tue, Dec 17, 2024 at 02:51:42PM +0800, Sandor Yu wrote:
> The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.
> 
> The patch set compose of DRM bridge drivers and PHY driver.
> 
> Both of them need by patch #1 and #3 to pass build.
> 
> DRM bridges driver patches:
>   #1: soc: cadence: Create helper functions for Cadence MHDP
>   #2: drm: bridge: cadence: Update mhdp8546 mailbox access functions
>   #3: phy: Add HDMI configuration options
>   #4: dt-bindings: display: bridge: Add Cadence MHDP8501
>   #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> 
> PHY driver patches:
>   #1: soc: cadence: Create helper functions for Cadence MHDP
>   #3: phy: Add HDMI configuration options
>   #6: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
> 
> i.MX8M/TQMa8Mx DT patches:
>   #8: Add DT nodes for DCSS/HDMI pipeline
>   #9: Enable HDMI for TQMa8Mx/MBa8Mx
> 
> v19->v20:
> Patch #1: soc: cadence: Create helper functions for Cadence MHDP
> Patch #2: drm: bridge: cadence: Update mhdp8546 mailbox access functions
> - The two patches are split from Patch #1 in v19.
>   The MHDP helper functions have been moved in a new "cadence" directory
>   under the SOC directory in patch #1, in order to promote code reuse
>   among MHDP8546, MHDP8501, and the i.MX8MQ HDMI/DP PHY drivers,
> 
> Patch #3: phy: Add HDMI configuration options
> - Add a-b tag
> 
> Patch #4: dt-bindings: display: bridge: Add Cadence MHDP8501
> - remove data type link of data-lanes
> 
> Patch #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> - Dump mhdp FW version by debugfs
> - Combine HDMI and DP cable detect functions into one function
> - Combine HDMI and DP cable bridge_mode_valid() functions into one function
> - Rename cdns_hdmi_reset_link() to cdns_hdmi_handle_hotplug()
> - Add comments for EDID in cdns_hdmi_handle_hotplug() and cdns_dp_check_link_state()
> - Add atomic_get_input_bus_fmts() and bridge_atomic_check() for DP driver
> - Remove bpc and color_fmt init in atomic_enable() function.
> - More detail comments for DDC adapter only support SCDC_I2C_SLAVE_ADDRESS
>   read and write in HDMI driver.
> 
> Patch #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
> - implify DP configuration handling by directly copying
>   the configuration options to the driver's internal structure.
> - return the error code directly instead of logging an error message in `hdptx_clk_enable`
> - Remove redundant ref_clk_rate check
> 
> 
> v18->v19:
> Patch #1
> - use guard(mutex)
> - Add kerneldocs for all new APIs.
> - Detail comments for mailbox access specific case.
> - remove cdns_mhdp_dp_reg_write() because it is not needed by driver now.
> 
> Patch #3
> - move property data-lanes to endpoint of port@1
> 
> Patch #4
> - get endpoint for data-lanes as it had move to endpoint of port@1
> - update clock management as devm_clk_get_enabled() introduced.
> - Fix clear_infoframe() function is not work issue.
> - Manage PHY power state via phy_power_on() and phy_power_off().
> 
> Patch #6
> - Simplify the PLL table by removing unused and constant data
> - Remove PHY power management, controller driver will handle them.
> - Remove enum dp_link_rate
> - introduce read_pll_timeout.
> - update clock management as devm_clk_get_enabled() introduced.
> - remove cdns_hdptx_phy_init() and cdns_hdptx_phy_remove().
> 
> Patch #8:
> - move property data-lanes to endpoint of port@1
> 
> v17->v18:
> Patch #1
> - Create three ordinary mailbox access APIs
>     cdns_mhdp_mailbox_send
>     cdns_mhdp_mailbox_send_recv
>     cdns_mhdp_mailbox_send_recv_multi
> - Create three secure mailbox access APIs
>     cdns_mhdp_secure_mailbox_send
>     cdns_mhdp_secure_mailbox_send_recv
>     cdns_mhdp_secure_mailbox_send_recv_multi
> - MHDP8546 DP and HDCP commands that need access mailbox are rewrited
>   with above 6 API functions.
> 
> Patch #3
> - remove lane-mapping and replace it with data-lanes
> - remove r-b tag as property changed.
> 
> Patch #4
> - MHDP8501 HDMI and DP commands that need access mailbox are rewrited
>   with new API functions created in patch #1.
> - replace lane-mapping with data-lanes, use the value from data-lanes
>   to reorder HDMI and DP lane mapping.
> - create I2C adapter for HDMI SCDC, remove cdns_hdmi_scdc_write() function.
> - Rewrite cdns_hdmi_sink_config() function, use HDMI SCDC helper function
>   drm_scdc_set_high_tmds_clock_ratio() and drm_scdc_set_scrambling()
>   to config HDMI sink TMDS.
> - Remove struct video_info from HDMI driver.
> - Remove tmds_char_rate_valid() be called in bridge_mode_valid(),
>   community had patch in reviewing to implement the function.
> - Remove warning message print when get unknown HPD cable status.
> - Add more detail comments for HDP plugin and plugout interrupt.
> - use dev_dbg to repleace DRM_INFO when cable HPD status changed.
> - Remove t-b tag as above code change.
> 
> Patch #6
> - fix build error as code rebase to latest kernel version.
> 
> Patch #8:
> - replace lane-mapping with data-lanes
> 
> 
> v16->v17:
> Patch #1:
> - Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
> Patch #2:
> - remove hdmi.h
> - add 2024 year to copyright
> - Add r-b tag.
> Patch #3:
> - Add lane-mapping property.
> Patch #4:
> - Reset the HDMI/DP link when an HPD (Hot Plug Detect) event is detected
> - Move the HDMI protocol settings from hdmi_ctrl_init() to a new function
>   cdns_hdmi_set_hdmi_mode_type(), to align with the introduced link reset functionality.
> - Implement logic to check the type of HDMI sink.
>   If the sink is not a hdmi display, set the default mode to DVI.
> - Implement hdmi_reset_infoframe function
> - Reorder certain bit definitions in the header file to follow a descending order.
> - Add "lane-mapping" property for both HDMI and DP, remove platform data from driver.
>   lane-mapping should be setting in dts according different board layout.
> - Remove variable mode in struct cdns_mhdp8501_device, video mode could get from struct drm_crtc_state
> - Remove variable char_rate in  struct cdns_mhdp8501_device, it could get from struct struct drm_connector_state.hdmi
> - Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
> - Remove mutext protect for phy_api access functions.
> Patch #6:
> - Remove mbox_mutex
> 
> v15->v16:
> Patch #2:
> - Remove pixel_clk_rate, bpc and color_space fields from struct
>   phy_configure_opts_hdmi, they were replaced by
>   unsigned long long tmds_char_rate.
> - Remove r-b and a-c tags because this patch have important change.
> Patch #4:
> - Add DRM_BRIDGE_OP_HDMI flags for HDMI driver,
> - Introduce the hdmi info frame helper functions,
>   added hdmi_clear_infoframe(), hdmi_write_infoframe() and
>   hdmi_tmds_char_rate_valid() according Dmitry's patch
>   'make use of the HDMI connector infrastructure' patchset ([2]).
> - mode_fixup() is replaced by atomic_check().
> - Fix video mode 4Kp30 did not work on some displays that support
>   LTE_340Mcsc_scramble.
> - updated for tmds_char_rate added in patch #2. 
> Patch #6:
> - updated for tmds_char_rate added in patch #2. 
> 
> v14->v15:
> Patch #6 + #7:
> -  Merged PHY driver into a single combo PHY driver
> Patch #7 + #8:
> - Add DT patches for a running HDMI setup
> 
> v13->v14:
> Patch #4:
> - Rebase to next-20240219, replace get_edid function by edid_read
>   function as commits d807ad80d811b ("drm/bridge: add ->edid_read
>   hook and drm_bridge_edid_read()") and 27b8f91c08d99 ("drm/bridge:
>   remove ->get_edid callback") had change the API.
> 
> v12->v13:
> Patch #4:
> - Explicitly include linux/platform_device.h for cdns-mhdp8501-core.c
> - Fix build warning
> - Order bit bpc and color_space in descending shit. 
> Patch #7:
> - Fix build warning
> 
> v11->v12:
> Patch #1: 
> - Move status initialize out of mbox_mutex.
> - Reorder API functions in alphabetical.
> - Add notes for malibox access functions.
> - Add year 2024 to copyright.
> Patch #4:
> - Replace DRM_INFO with dev_info or dev_warn.
> - Replace DRM_ERROR with dev_err.
> - Return ret when cdns_mhdp_dpcd_read failed in function cdns_dp_aux_transferi().
> - Remove unused parmeter in function cdns_dp_get_msa_misc
>   and use two separate variables for color space and bpc.
> - Add year 2024 to copyright.
> Patch #6:
> - Return error code to replace -1 for function wait_for_ack().
> - Set cdns_phy->power_up = false in phy_power_down function.
> - Remove "RATE_8_1 = 810000", it is not used in driver.
> - Add year 2024 to copyright.
> Patch #7:
> - Adjust clk disable order.
> - Return error code to replace -1 for function wait_for_ack().
> - Use bool for variable pclk_in.
> - Add year 2024 to copyright.
> 
> v10->v11:
> - rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
> use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
> same as the other mailbox access functions.
> - use static for cdns_mhdp_mailbox_write() and cdns_mhdp_mailbox_read()
> and remove them from EXPORT_SYMBOL_GPL().
> - remove MODULE_ALIAS() from mhdp8501 driver.
> 
> v9->v10:
> - Create mhdp helper driver to replace macro functions,
> move all mhdp mailbox access functions and common functions
> into the helper driver.
> Patch #1:drm: bridge: Cadence: Creat mhdp helper driver
> it is totaly different with v9.
> 
> v8->v9:
> - Remove compatible string "cdns,mhdp8501" that had removed
>   from dt-bindings file in v8.
> - Add Dmitry's R-b tag to patch #2
> - Add Krzysztof's R-b tag to patch #3
> 
> v7->v8:
> MHDP8501 HDMI/DP:
> - Correct DT node name to "display-bridge".
> - Remove "cdns,mhdp8501" from mhdp8501 dt-binding doc.
> 
> HDMI/DP PHY:
> - Introduced functions `wait_for_ack` and `wait_for_ack_clear` to handle
>   waiting with acknowledgment bits set and cleared respectively.
> - Use FIELD_PRE() to set bitfields for both HDMI and DP PHY.
> 
> v6->v7:
> MHDP8501 HDMI/DP:
> - Combine HDMI and DP driver into one mhdp8501 driver.
>   Use the connector type to load the corresponding functions.
> - Remove connector init functions.
> - Add <linux/hdmi.h> in phy_hdmi.h to reuse 'enum hdmi_colorspace'.
> 
> HDMI/DP PHY:
> - Lowercase hex values
> - Fix parameters indent issue on some functions
> - Replace 'udelay' with 'usleep_range'
> 
> v5->v6:
> HDMI/DP bridge driver
> - 8501 is the part number of Cadence MHDP on i.MX8MQ.
>   Use MHDP8501 to name hdmi/dp drivers and files. 
> - Add compatible "fsl,imx8mq-mhdp8501-dp" for i.MX8MQ DP driver
> - Add compatible "fsl,imx8mq-mhdp8501-hdmi" for i.MX8MQ HDMI driver
> - Combine HDMI and DP dt-bindings into one file cdns,mhdp8501.yaml
> - Fix HDMI scrambling is not enable issue when driver working in 4Kp60
>   mode.
> - Add HDMI/DP PHY API mailbox protect.
> 
> HDMI/DP PHY driver:
> - Rename DP and HDMI PHY files and move to folder phy/freescale/
> - Remove properties num_lanes and link_rate from DP PHY driver.
> - Combine HDMI and DP dt-bindings into one file fsl,imx8mq-dp-hdmi-phy.yaml
> - Update compatible string to "fsl,imx8mq-dp-phy".
> - Update compatible string to "fsl,imx8mq-hdmi-phy".
> 
> v4->v5:
> - Drop "clk" suffix in clock name.
> - Add output port property in the example of hdmi/dp.
> 
> v3->v4:
> dt-bindings:
> - Correct dt-bindings coding style and address review comments.
> - Add apb_clk description.
> - Add output port for HDMI/DP connector
> PHY:
> - Alphabetically sorted in Kconfig and Makefile for DP and HDMI PHY
> - Remove unused registers define from HDMI and DP PHY drivers.
> - More description in phy_hdmi.h.
> - Add apb_clk to HDMI and DP phy driver.
> HDMI/DP:
> - Use get_unaligned_le32() to replace hardcode type conversion
>   in HDMI AVI infoframe data fill function.
> - Add mailbox mutex lock in HDMI/DP driver for phy functions
>   to reslove race conditions between HDMI/DP and PHY drivers.
> - Add apb_clk to both HDMI and DP driver.
> - Rename some function names and add prefix with "cdns_hdmi/cdns_dp".
> - Remove bpc 12 and 16 optional that not supported.
> 
> v2->v3:
> Address comments for dt-bindings files.
> - Correct dts-bindings file names 
>   Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
>   Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
> - Drop redundant words and descriptions.
> - Correct hdmi/dp node name.
> 
> v2 is a completely different version compared to v1.
> Previous v1 can be available here [1].
> 
> v1->v2:
> - Reuse Cadence mailbox access functions from mhdp8546 instead of
>   rockchip DP.
> - Mailbox access functions be convert to marco functions
>   that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
> - Plain bridge instead of component driver.
> - Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
> - Audio driver are removed from the patch set, it will be add in another
>   patch set later.
> 
> [1] https://patchwork.kernel.org/project/linux-rockchip/cover/cover.1590982881.git.Sandor.yu@nxp.com/
> 
> Alexander Stein (2):
>   arm64: dts: imx8mq: Add DCSS + HDMI/DP display pipeline
>   arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI support
> 
> Sandor Yu (7):
>   soc: cadence: Create helper functions for Cadence MHDP
>   drm: bridge: cadence: Update mhdp8546 mailbox access functions
>   phy: Add HDMI configuration options
>   dt-bindings: display: bridge: Add Cadence MHDP8501
>   drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
>   dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
> 
>  .../display/bridge/cdns,mhdp8501.yaml         |  121 ++
>  .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |   51 +
>  .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   26 +
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   68 +
>  arch/arm64/boot/dts/freescale/mba8mx.dtsi     |   11 +
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   17 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |    2 +
>  .../drm/bridge/cadence/cdns-mhdp8501-core.c   |  379 +++++
>  .../drm/bridge/cadence/cdns-mhdp8501-core.h   |  380 +++++
>  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c |  694 ++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   |  745 ++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  487 ++-----
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   47 +-
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  212 +--
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |   18 +-
>  drivers/phy/freescale/Kconfig                 |   10 +
>  drivers/phy/freescale/Makefile                |    1 +
>  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c  | 1231 +++++++++++++++++
>  drivers/soc/Kconfig                           |    1 +
>  drivers/soc/Makefile                          |    1 +
>  drivers/soc/cadence/Kconfig                   |    9 +
>  drivers/soc/cadence/Makefile                  |    3 +
>  drivers/soc/cadence/cdns-mhdp-helper.c        |  565 ++++++++
>  include/linux/phy/phy-hdmi.h                  |   19 +
>  include/linux/phy/phy.h                       |    7 +-
>  include/soc/cadence/cdns-mhdp-helper.h        |  129 ++
>  26 files changed, 4572 insertions(+), 662 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
>  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
>  create mode 100644 drivers/soc/cadence/Kconfig
>  create mode 100644 drivers/soc/cadence/Makefile
>  create mode 100644 drivers/soc/cadence/cdns-mhdp-helper.c
>  create mode 100644 include/linux/phy/phy-hdmi.h
>  create mode 100644 include/soc/cadence/cdns-mhdp-helper.h
> 
> -- 
> 2.34.1
> 
> 
