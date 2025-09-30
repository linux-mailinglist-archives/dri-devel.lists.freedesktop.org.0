Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE353BAC70E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AC810E184;
	Tue, 30 Sep 2025 10:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="YPdM2M7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FD010E184
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 10:17:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250930101729euoutp01b57e6fa199f1d9764685b479ee393f2c~qCAteIN_K1423914239euoutp01S;
 Tue, 30 Sep 2025 10:17:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250930101729euoutp01b57e6fa199f1d9764685b479ee393f2c~qCAteIN_K1423914239euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759227449;
 bh=i0hsYIdTBG3RoYY2oCy/zDpSiKCipQoEifIaLF7Lbqw=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=YPdM2M7DLyVY6SAOTHX498pf0ytk9nQQ+weWK1WExpMmK0cg8gTYgrpSPX6QOX6zn
 icZtcxZ4LcbPQt1kPN2ld9XcNpX2M8e8z3G4+0flukSeQfZzUVZBPDtiFLKFpOE0nC
 0GihKsb7ZPd9aC6ShngC8sIFtoA7m0PgHtycPcb4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250930101728eucas1p2d174bb7433699baa7583852c50f9ccb7~qCAtAAJvC0536105361eucas1p27;
 Tue, 30 Sep 2025 10:17:28 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250930101727eusmtip2963d1f7d88d03e442d658090d83d7b2d~qCArVvP-21105911059eusmtip28;
 Tue, 30 Sep 2025 10:17:27 +0000 (GMT)
Message-ID: <41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com>
Date: Tue, 30 Sep 2025 12:17:26 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v6 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250930090920.131094-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250930101728eucas1p2d174bb7433699baa7583852c50f9ccb7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250930091415eucas1p1f82ef0c96cbe0c7c673d975d502629e2
X-EPHeader: CA
X-CMS-RootMailID: 20250930091415eucas1p1f82ef0c96cbe0c7c673d975d502629e2
References: <CGME20250930091415eucas1p1f82ef0c96cbe0c7c673d975d502629e2@eucas1p1.samsung.com>
 <20250930090920.131094-1-damon.ding@rock-chips.com>
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

On 30.09.2025 11:09, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3 is to add a new parameter to store the point of next bridge.
> PATCH 4 is to make legacy bridge driver more universal.
> PATCH 5-10 are preparations for apply drm_bridge_connector helper.
> PATCH 11 is to ensure last bridge determines OP_EDID/OP_MODES capabilities.
> PATCH 12 is to apply the drm_bridge_connector helper.
> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
> PATCH 16 is to attach the next bridge on Analogix side uniformly.
> PATCH 17-18 are to apply the panel_bridge helper.

Works fine on my Exynos based test boards with (e)DP displays. Thanks!

Feel free to update tags if needed:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> Damon Ding (18):
>    drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>    drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>      &drm_bridge_funcs.atomic_enable
>    drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>    drm/bridge: Move legacy bridge driver out of imx directory for
>      multi-platform use
>    drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>    drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
>    drm/exynos: exynos_dp: Apply legacy bridge to parse the
>      display-timings node
>    drm/bridge: analogix_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Move the color format check to
>      .atomic_check() for Rockchip platforms
>    drm/bridge: analogix_dp: Remove unused
>      &analogix_dp_plat_data.get_modes()
>    drm/display: bridge_connector: Ensure last bridge determines
>      EDID/modes detection capabilities
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
>   .../drm/bridge/analogix/analogix_dp_core.c    | 395 +++++++++---------
>   .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>   drivers/gpu/drm/bridge/imx/Kconfig            |  10 -
>   drivers/gpu/drm/bridge/imx/Makefile           |   1 -
>   .../gpu/drm/bridge/imx/imx-legacy-bridge.c    |  91 ----
>   drivers/gpu/drm/bridge/legacy-bridge.c        |  99 +++++
>   .../gpu/drm/display/drm_bridge_connector.c    |  42 ++
>   drivers/gpu/drm/exynos/Kconfig                |   2 +
>   drivers/gpu/drm/exynos/exynos_dp.c            | 117 ++----
>   drivers/gpu/drm/imx/ipuv3/Kconfig             |   4 +-
>   drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |   6 +-
>   drivers/gpu/drm/imx/ipuv3/parallel-display.c  |   4 +-
>   drivers/gpu/drm/rockchip/Kconfig              |   1 +
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  67 +--
>   include/drm/bridge/analogix_dp.h              |   8 +-
>   include/drm/bridge/imx.h                      |  17 -
>   include/drm/bridge/legacy-bridge.h            |  18 +
>   20 files changed, 433 insertions(+), 466 deletions(-)
>   delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
>   create mode 100644 drivers/gpu/drm/bridge/legacy-bridge.c
>   delete mode 100644 include/drm/bridge/imx.h
>   create mode 100644 include/drm/bridge/legacy-bridge.h
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
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

