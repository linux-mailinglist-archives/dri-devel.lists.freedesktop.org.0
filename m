Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B24BC71CB
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 03:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDD010E8EF;
	Thu,  9 Oct 2025 01:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="PAzJtPog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15579.qiye.163.com (mail-m15579.qiye.163.com
 [101.71.155.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A24310E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 01:29:47 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 253c93889;
 Thu, 9 Oct 2025 09:29:43 +0800 (GMT+08:00)
Message-ID: <642ee0da-5179-4790-ace3-c3035032c6d7@rock-chips.com>
Date: Thu, 9 Oct 2025 09:29:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v6 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Marek Szyprowski <m.szyprowski@samsung.com>, andrzej.hajda@intel.com,
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
References: <CGME20250930091415eucas1p1f82ef0c96cbe0c7c673d975d502629e2@eucas1p1.samsung.com>
 <20250930090920.131094-1-damon.ding@rock-chips.com>
 <41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com>
Content-Language: en-US
In-Reply-To: <41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99c6969bbf03a3kunmdb30cebaa2e219
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5OHlZLT0wdTR9OH0keGEJWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=PAzJtPogGAtKNZF9kobys+S/AKxHrq4GQv8D4Z+zLodxNHH4JYCTujogAXm9fgicqrAw7SJ1Ed/1y5ar44pfmhXbF3urj0ZGNVm3tQFTiqOHhYi0FRcJvpHZzCZZTol5n2XzaUvwtgW2y0xff7e202M52ezasiZAj3cQv8oueNU=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=kHQXpJLhL6Zuw3ZLmpn+nIKZ+QG/Z5d2ERurV4FyGmc=;
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

Hi Marek,

On 9/30/2025 6:17 PM, Marek Szyprowski wrote:
> On 30.09.2025 11:09, Damon Ding wrote:
>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 3 is to add a new parameter to store the point of next bridge.
>> PATCH 4 is to make legacy bridge driver more universal.
>> PATCH 5-10 are preparations for apply drm_bridge_connector helper.
>> PATCH 11 is to ensure last bridge determines OP_EDID/OP_MODES capabilities.
>> PATCH 12 is to apply the drm_bridge_connector helper.
>> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 16 is to attach the next bridge on Analogix side uniformly.
>> PATCH 17-18 are to apply the panel_bridge helper.
> 
> Works fine on my Exynos based test boards with (e)DP displays. Thanks!
> 
> Feel free to update tags if needed:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Thanks a lot for the testing and the tag!

Apologies for the delayed reply as I was on vacation. ;-)

> 
>> Damon Ding (18):
>>     drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>>     drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>>       &drm_bridge_funcs.atomic_enable
>>     drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>>     drm/bridge: Move legacy bridge driver out of imx directory for
>>       multi-platform use
>>     drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>>     drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
>>     drm/exynos: exynos_dp: Apply legacy bridge to parse the
>>       display-timings node
>>     drm/bridge: analogix_dp: Remove redundant
>>       &analogix_dp_plat_data.skip_connector
>>     drm/bridge: analogix_dp: Move the color format check to
>>       .atomic_check() for Rockchip platforms
>>     drm/bridge: analogix_dp: Remove unused
>>       &analogix_dp_plat_data.get_modes()
>>     drm/display: bridge_connector: Ensure last bridge determines
>>       EDID/modes detection capabilities
>>     drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>>     drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>>     drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>>     drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>>     drm/bridge: analogix_dp: Attach the next bridge in
>>       analogix_dp_bridge_attach()
>>     drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>>       in analogix_dp_unbind()
>>     drm/bridge: analogix_dp: Apply panel_bridge helper
>>
>>    drivers/gpu/drm/bridge/Kconfig                |  10 +
>>    drivers/gpu/drm/bridge/Makefile               |   1 +
>>    drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>>    .../drm/bridge/analogix/analogix_dp_core.c    | 395 +++++++++---------
>>    .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>>    drivers/gpu/drm/bridge/imx/Kconfig            |  10 -
>>    drivers/gpu/drm/bridge/imx/Makefile           |   1 -
>>    .../gpu/drm/bridge/imx/imx-legacy-bridge.c    |  91 ----
>>    drivers/gpu/drm/bridge/legacy-bridge.c        |  99 +++++
>>    .../gpu/drm/display/drm_bridge_connector.c    |  42 ++
>>    drivers/gpu/drm/exynos/Kconfig                |   2 +
>>    drivers/gpu/drm/exynos/exynos_dp.c            | 117 ++----
>>    drivers/gpu/drm/imx/ipuv3/Kconfig             |   4 +-
>>    drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |   6 +-
>>    drivers/gpu/drm/imx/ipuv3/parallel-display.c  |   4 +-
>>    drivers/gpu/drm/rockchip/Kconfig              |   1 +
>>    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  67 +--
>>    include/drm/bridge/analogix_dp.h              |   8 +-
>>    include/drm/bridge/imx.h                      |  17 -
>>    include/drm/bridge/legacy-bridge.h            |  18 +
>>    20 files changed, 433 insertions(+), 466 deletions(-)
>>    delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
>>    create mode 100644 drivers/gpu/drm/bridge/legacy-bridge.c
>>    delete mode 100644 include/drm/bridge/imx.h
>>    create mode 100644 include/drm/bridge/legacy-bridge.h
>>
>> ---
>>
>> Changes in v2:
>> - Update Exynos DP driver synchronously.
>> - Move the panel/bridge parsing to the Analogix side.
>>
>> Changes in v3:
>> - Rebase for the existing devm_drm_bridge_alloc() applying commit.
>> - Fix the typographical error of panel/bridge check in exynos_dp_bind().
>> - Squash all commits related to skip_connector deletion in both Exynos and
>>     Analogix code into one.
>> - Apply panel_bridge helper to make the codes more concise.
>> - Fix the handing of bridge in analogix_dp_bridge_get_modes().
>> - Remove unnecessary parameter struct drm_connector* for callback
>>     &analogix_dp_plat_data.attach().
>> - In order to decouple the connector driver and the bridge driver, move
>>     the bridge connector initilization to the Rockchip and Exynos sides.
>>
>> Changes in v4:
>> - Rebase for the applied &drm_bridge_funcs.detect() modification commit.
>> - Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
>> - Drop the drmm_encoder_init() modification commit.
>> - Rename the &analogix_dp_plat_data.bridge to
>>     &analogix_dp_plat_data.next_bridge.
>>
>> Changes in v5:
>> - Add legacy bridge to parse the display-timings node under the dp node
>>     for Exynos side.
>> - Move color format check to &drm_connector_helper_funcs.atomic_check()
>>     in order to get rid of &analogix_dp_plat_data.get_modes().
>> - Remove unused callback &analogix_dp_plat_data.get_modes().
>> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>>     the downstream device is a panel, a bridge or neither.
>> - Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP, and remove it for
>>     ROCKCHIP_ANALOGIX_DP.
>> - Apply rockchip_dp_attach() to support the next bridge attachment for
>>     the Rockchip side.
>> - Move next_bridge attachment from Analogix side to Rockchip/Exynos sides.
>>
>> Changes in v6:
>> - Move legacy bridge driver out of imx directory for multi-platform use.
>> - Apply DRM legacy bridge to parse display timings intead of implementing
>>     the same codes only for Exynos DP.
>> - Ensure last bridge determines EDID/modes detection capabilities in DRM
>>     bridge_connector driver.
>> - Remove unnecessary drm_bridge_get_modes() in
>>     analogix_dp_bridge_get_modes().
>> - Simplify analogix_dp_bridge_edid_read().
>> - If the next is a bridge, set DRM_BRIDGE_OP_DETECT and return
>>     connector_status_connected in analogix_dp_bridge_detect().
>> - Set flag DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment while
>>     binding. Meanwhile, make DRM_BRIDGE_ATTACH_NO_CONNECTOR unsuppported
>>     in analogix_dp_bridge_attach().
>> - Move the next bridge attachment to the Analogix side rather than
>>     scattered on Rockchip and Exynos sides.
>> - Remove the unnecessary analogix_dp_bridge_get_modes().
>> - Squash [PATCH v5 15/17] into [PATCH v5 17/17].
>> - Fix the &drm_bridge->ops to DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT.
>>

Best regards,
Damon

