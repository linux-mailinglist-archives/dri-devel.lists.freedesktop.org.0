Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD6B27536
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 04:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8386010E053;
	Fri, 15 Aug 2025 02:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="hfZpv8zW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3289.qiye.163.com (mail-m3289.qiye.163.com
 [220.197.32.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A817C10E053
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 02:04:10 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1f727517b;
 Fri, 15 Aug 2025 10:04:05 +0800 (GMT+08:00)
Message-ID: <6ec86839-2d81-491b-a9fa-b44bb6db8fbf@rock-chips.com>
Date: Fri, 15 Aug 2025 10:04:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Marek Szyprowski <m.szyprowski@samsung.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
 <20250814104753.195255-1-damon.ding@rock-chips.com>
 <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98ab784e4f03a3kunm0571d7eb485c79
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0sfSFZDTU1KSh1OTBpMQxlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=hfZpv8zW2uys6mdORyNcGO+jdR1oTSbgWly42v2Rwxejwtr8GjoEWt+bKnpVT5e1nF9OU25agMwG6zgxwEy5aXBeJJbfAWzI1hPnuAIXyKEeGphMhrobsGe4y0AoA1OiKSEHNipCW+hLlPA5j66L+lShxrMP06AecHT8i7KL0uc=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=DFpzt96SH7zrjIwGrhgfwPhUMLgjWOGWlrIeC6OmdkA=;
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

On 2025/8/14 22:33, Marek Szyprowski wrote:
> On 14.08.2025 12:47, Damon Ding wrote:
>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
>> PATCH 7 is to apply the drm_bridge_connector helper.
>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 11-12 are preparations for apply panel_bridge helper.
>> PATCH 13 is to apply the panel_bridge helper.
> 
> This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's Kconfig,
> so it causes build break:
> 

> drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to
> `drm_bridge_connector_init'
> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
> 
> After adding this dependency, the Exynos DP driver stops working. On
> Samsung Snow Chromebook I observed following issue:
> 
> [    4.534220] exynos-dp 145b0000.dp-controller: failed to attach
> following panel or bridge (-16)
> [    4.543428] exynos-drm exynos-drm: failed to bind
> 145b0000.dp-controller (ops exynos_dp_ops): -16
> [    4.551775] exynos-drm exynos-drm: adev bind failed: -16
> [    4.556559] exynos-dp 145b0000.dp-controller: probe with driver
> exynos-dp failed with error -16
> 
> I will investigate details later in the evening.
> 

Thanks for your review and test. :-)

I found the Rockchip side also lacks 'select DRM_BRIDGE_CONNECTOR' in 
ROCKCHIP_ANALOGIX_DP's Kconfig. I will add the DRM_BRIDGE_CONNECTOR 
selection for both of them in the next version.

>> Damon Ding (13):
>>     drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>>     drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>>       &drm_bridge_funcs.atomic_enable
>>     drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>>     drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>>     drm/bridge: exynos_dp: Remove unused &exynos_dp_device.connector
>>     drm/bridge: analogix_dp: Remove redundant
>>       &analogix_dp_plat_data.skip_connector
>>     drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>>     drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>>     drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>>     drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>>     drm/bridge: analogix_dp: Remove panel disabling and enabling in
>>       analogix_dp_set_bridge()
>>     drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>>       in analogix_dp_unbind()
>>     drm/bridge: analogix_dp: Apply panel_bridge helper
>>
>>    .../drm/bridge/analogix/analogix_dp_core.c    | 384 ++++++++++--------
>>    .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>>    drivers/gpu/drm/exynos/exynos_dp.c            |  48 +--
>>    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  49 +--
>>    include/drm/bridge/analogix_dp.h              |   7 +-
>>    5 files changed, 248 insertions(+), 245 deletions(-)
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
> Best regards

Best regards,
Damon

