Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A1NLzTyn2kyfAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 08:11:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC7D1A1AD7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 08:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DC810E891;
	Thu, 26 Feb 2026 07:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="cQ/AqZp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155100.qiye.163.com (mail-m155100.qiye.163.com
 [101.71.155.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A8210E894
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 07:11:42 +0000 (UTC)
Received: from [172.16.12.43] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3505c726f;
 Thu, 26 Feb 2026 15:11:37 +0800 (GMT+08:00)
Message-ID: <e3230ebc-6e2b-4498-a1e6-f0df981e31c4@rock-chips.com>
Date: Thu, 26 Feb 2026 14:54:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/15] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 luca.ceresoli@bootlin.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260210071225.2566099-1-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9c98c9f35c03a3kunm3e48a6d7631012
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGktMH1ZLH0hMHxkZSxgeH0NWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=cQ/AqZp+ADA4p95tPT73diWySfKCBlVbTDQsyBkSzcQbTwsI8PqXLisZ+Ijq54s91+bF4NTmvls+bGWDkQxVnHXiuMzid9dobp1eNVTAXiZiT0o7jU0t3WWza1GZR6xjXe868MZFGNXrSxVWOtNUzJk7DeGaGMvHc1Ajybx2Suo=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=jcZech508r6J0Y/EcPPn3A5kelYdhYfneanXyHx0CHk=;
 h=date:mime-version:subject:message-id:from;
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:luca.ceresoli@bootlin.com,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:jingoohan1@gmail.com,m:p.zabel@pengutronix.de,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:m.szyprowski@samsung.com,m:jani.nikula@intel.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,samsung.com,rock-chips.com,sntech.de,oss.qualcomm.com,chromium.org,intel.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	NEURAL_HAM(-0.00)[-0.944];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EBC7D1A1AD7
X-Rspamd-Action: no action

On 2/10/2026 3:12 PM, Damon Ding wrote:
> Picked from:
> https://lore.kernel.org/all/20251217093321.3108939-1-damon.ding@rock-chips.com/
> 
> PATCH 1 is to add a new parameter to store the point of next bridge.
> PATCH 2 is to make legacy bridge driver more universal.
> PATCH 3-8 are preparations for apply drm_bridge_connector helper.
> PATCH 9 is to apply the drm_bridge_connector helper.
> PATCH 10-12 are to move the panel/bridge parsing to the Analogix side.
> PATCH 13 is to attach the next bridge on Analogix side uniformly.
> PATCH 14-15 are to apply the panel_bridge helper.
> 
> The following reviewed commits, which to make codes more concise, are
> rebased to the front of this patch series:
> 
> https://lore.kernel.org/all/20251110085823.1197472-1-damon.ding@rock-chips.com/
> https://lore.kernel.org/all/20251111022103.1350183-1-damon.ding@rock-chips.com/
> 
> Damon Ding (15):
>    drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>    drm/bridge: Move legacy bridge driver out of imx directory for
>      multi-platform use
>    drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>    drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
>    drm/exynos: exynos_dp: Apply of-display-mode-bridge to parse the
>      display-timings node
>    drm/bridge: analogix_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Move the color format check to
>      .atomic_check() for Rockchip platforms
>    drm/bridge: analogix_dp: Remove unused
>      &analogix_dp_plat_data.get_modes()
>    drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>    drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>    drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>    drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>    drm/bridge: analogix_dp: Attach the next bridge in
>      analogix_dp_bridge_attach()
>    drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>      in analogix_dp_unbind()
>    drm/bridge: analogix_dp: Apply panel_bridge helper
> 
>   drivers/gpu/drm/bridge/Kconfig                |  10 +
>   drivers/gpu/drm/bridge/Makefile               |   1 +
>   drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>   .../drm/bridge/analogix/analogix_dp_core.c    | 238 +++++++++---------
>   .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
>   drivers/gpu/drm/bridge/imx/Kconfig            |  10 -
>   drivers/gpu/drm/bridge/imx/Makefile           |   1 -
>   .../gpu/drm/bridge/imx/imx-legacy-bridge.c    |  91 -------
>   .../gpu/drm/bridge/of-display-mode-bridge.c   |  93 +++++++
>   drivers/gpu/drm/exynos/Kconfig                |   2 +
>   drivers/gpu/drm/exynos/exynos_dp.c            | 110 ++------
>   drivers/gpu/drm/imx/ipuv3/Kconfig             |   4 +-
>   drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |   6 +-
>   drivers/gpu/drm/imx/ipuv3/parallel-display.c  |   5 +-
>   drivers/gpu/drm/rockchip/Kconfig              |   1 +
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  67 +----
>   include/drm/bridge/analogix_dp.h              |   8 +-
>   include/drm/bridge/imx.h                      |  17 --
>   include/drm/bridge/of-display-mode-bridge.h   |  17 ++
>   19 files changed, 297 insertions(+), 386 deletions(-)
>   delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
>   create mode 100644 drivers/gpu/drm/bridge/of-display-mode-bridge.c
>   delete mode 100644 include/drm/bridge/imx.h
>   create mode 100644 include/drm/bridge/of-display-mode-bridge.h
> 
> ---
> 
> Changes in v2:
> - Update Exynos DP driver synchronously.
> - Move the panel/bridge parsing to the Analogix side.
> 
> Changes in v3:
> - Rebase for the existing devm_drm_bridge_alloc() applying commit.
> - Fix the typographical error of panel/bridge check in exynos_dp_bind().
> - Squash all commits related to skip_connector deletion in both Exynos and
>    Analogix code into one.
> - Apply panel_bridge helper to make the codes more concise.
> - Fix the handing of bridge in analogix_dp_bridge_get_modes().
> - Remove unnecessary parameter struct drm_connector* for callback
>    &analogix_dp_plat_data.attach().
> - In order to decouple the connector driver and the bridge driver, move
>    the bridge connector initilization to the Rockchip and Exynos sides.
> 
> Changes in v4:
> - Rebase for the applied &drm_bridge_funcs.detect() modification commit.
> - Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
> - Drop the drmm_encoder_init() modification commit.
> - Rename the &analogix_dp_plat_data.bridge to
>    &analogix_dp_plat_data.next_bridge.
> 
> Changes in v5:
> - Add legacy bridge to parse the display-timings node under the dp node
>    for Exynos side.
> - Move color format check to &drm_connector_helper_funcs.atomic_check()
>    in order to get rid of &analogix_dp_plat_data.get_modes().
> - Remove unused callback &analogix_dp_plat_data.get_modes().
> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>    the downstream device is a panel, a bridge or neither.
> - Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP, and remove it for
>    ROCKCHIP_ANALOGIX_DP.
> - Apply rockchip_dp_attach() to support the next bridge attachment for
>    the Rockchip side.
> - Move next_bridge attachment from Analogix side to Rockchip/Exynos sides.
> 
> Changes in v6:
> - Move legacy bridge driver out of imx directory for multi-platform use.
> - Apply DRM legacy bridge to parse display timings intead of implementing
>    the same codes only for Exynos DP.
> - Ensure last bridge determines EDID/modes detection capabilities in DRM
>    bridge_connector driver.
> - Remove unnecessary drm_bridge_get_modes() in
>    analogix_dp_bridge_get_modes().
> - Simplify analogix_dp_bridge_edid_read().
> - If the next is a bridge, set DRM_BRIDGE_OP_DETECT and return
>    connector_status_connected in analogix_dp_bridge_detect().
> - Set flag DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment while
>    binding. Meanwhile, make DRM_BRIDGE_ATTACH_NO_CONNECTOR unsuppported
>    in analogix_dp_bridge_attach().
> - Move the next bridge attachment to the Analogix side rather than
>    scattered on Rockchip and Exynos sides.
> - Remove the unnecessary analogix_dp_bridge_get_modes().
> - Squash [PATCH v5 15/17] into [PATCH v5 17/17].
> - Fix the &drm_bridge->ops to DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT.
> 
> Changes in v7:
> - As Luca suggested, simplify the code and related comment for bridge_connector
>    modifications. Additionally, move the commit related to bridge_connector to
>    the top of this patch series.
> - Rename legacy-bridge driver to of-display-mode-bridge driver.
> - Remove unnecessary API drm_bridge_is_legacy() and apply a temporary flag
>    &exynos_dp_device.has_of_bridge instead, which will be removed finally.
> - Remove exynos_dp_legacy_bridge_init() and inline API
>    devm_drm_of_display_mode_bridge().
> 
> Changes in v8:
> - Adapt the related modifications to the newest bridge_connector driver.
> 
> Changes in v9:
> - Fix the Kconfig help text for CONFIG_DRM_OF_DISPLAY_MODE_BRIDGE.
> - Add Tested-by tag from Heiko.
> 

Gentle ping.

I think the patches are in good shape and ready for merging.

Best regards,
Damon

