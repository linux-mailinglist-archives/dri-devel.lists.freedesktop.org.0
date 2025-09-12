Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3DFB54875
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 11:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447F310EBEC;
	Fri, 12 Sep 2025 09:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="L2Y1YPpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A1910EBEC
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:56:09 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250912095607euoutp02b57a8ee8d3363927a331133520e027a6~kgG6-Qf751779417794euoutp02T
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:56:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250912095607euoutp02b57a8ee8d3363927a331133520e027a6~kgG6-Qf751779417794euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1757670967;
 bh=/WgaU7Y24edcvelE6VWdeVRjrf0TYEj3umrowZuuiQ4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=L2Y1YPprEPGLfmwqODN1Guom3McSDbIB5VdVRbCRwMw835DYk5l2p910cNLpNI+z5
 rHhytp43Bafk8VFnZrR8BEkRHwf3Se4vxg/aDHH6RYQFEA57hhRE08pTAIp74BuXKO
 9QMxfpC3Jk94QuvYOBNoEmOoa3cK1eiUw1e7BptY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250912095607eucas1p2a18c183541e1b3a3d852cce1a0a151b7~kgG6gXgC42606026060eucas1p2a;
 Fri, 12 Sep 2025 09:56:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250912095605eusmtip13971d667cb9ff7ae4e1a11bc688d941c~kgG5C1vwN0365103651eusmtip1O;
 Fri, 12 Sep 2025 09:56:05 +0000 (GMT)
Message-ID: <0ff3ba73-18e8-4941-bac6-2efa790c36ab@samsung.com>
Date: Fri, 12 Sep 2025 11:56:05 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 00/17] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250912095607eucas1p2a18c183541e1b3a3d852cce1a0a151b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250912085902eucas1p2b611b4afd6b453c161753f50386a6d01
X-EPHeader: CA
X-CMS-RootMailID: 20250912085902eucas1p2b611b4afd6b453c161753f50386a6d01
References: <CGME20250912085902eucas1p2b611b4afd6b453c161753f50386a6d01@eucas1p2.samsung.com>
 <20250912085846.7349-1-damon.ding@rock-chips.com>
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

On 12.09.2025 10:58, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-9 are preparations for apply drm_bridge_connector helper.
> PATCH 10 is to apply the drm_bridge_connector helper.
> PATCH 11-14 are to move the panel/bridge parsing to the Analogix side.
> PATCH 15-16 are preparations for apply panel_bridge helper.
> PATCH 17 is to apply the panel_bridge helper.
>
> Damon Ding (17):
>    drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>    drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>      &drm_bridge_funcs.atomic_enable
>    drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>    drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>    drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
>    drm/bridge: analogix_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/exynos: exynos_dp: Add legacy bridge to parse the display-timings
>      node
>    drm/bridge: analogix_dp: Move the color format check to
>      .atomic_check() for Rockchip platforms
>    drm/bridge: analogix_dp: Remove unused
>      &analogix_dp_plat_data.get_modes()
>    drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>    drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>    drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>    drm/rockchip: analogix_dp: Apply &analogix_dp_plat_data.attach() to
>      attach next bridge
>    drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>    drm/bridge: analogix_dp: Remove panel disabling and enabling in
>      analogix_dp_set_bridge()
>    drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>      in analogix_dp_unbind()
>    drm/bridge: analogix_dp: Apply panel_bridge helper
>
>   drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>   .../drm/bridge/analogix/analogix_dp_core.c    | 394 ++++++++++--------
>   .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>   drivers/gpu/drm/exynos/exynos_dp.c            | 168 ++++----
>   drivers/gpu/drm/rockchip/Kconfig              |   1 -
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  74 ++--
>   include/drm/bridge/analogix_dp.h              |   9 +-
>   7 files changed, 342 insertions(+), 310 deletions(-)
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

Exynos part still lacks "select DRM_BRIDGE_CONNECTOR" in Kconfig, 
besides that it works fine on all my test boards. Fix this issue and 
feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

