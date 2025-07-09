Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DC0AFE130
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58E910E75C;
	Wed,  9 Jul 2025 07:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="u+O8eUBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8260D10E751
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 07:22:48 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250709072246euoutp02d4a6a9083e61262ab5a15a97bb31ba20~QhFeKPGms0832508325euoutp02K
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 07:22:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250709072246euoutp02d4a6a9083e61262ab5a15a97bb31ba20~QhFeKPGms0832508325euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1752045766;
 bh=qIHbeL0LG8G55ANYGcdpujwUfCstWXCxAhnRkcjxSxo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=u+O8eUBejQ0U3lDJSuGDT7O5A/2mhQfjdEr38ZnnSm3Z8lCrRXk6b+nevytM15awo
 25r7QXh3IEnRHwfD96bFEDkSZQ3ByBaTuHMeYQrrxorgL8Y3By2iGo6nYl2vAjLAM5
 n0Mdgya150E1spOOOyzKUWIQ1LJBxrPnGh+Tabqg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250709072246eucas1p1d64e4c09a83c92497d76cb3efeaf6509~QhFdx5tSY0368803688eucas1p1I;
 Wed,  9 Jul 2025 07:22:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250709072243eusmtip29880f65c5964c8e0828e1df05a890579~QhFbeaA3i1291112911eusmtip2E;
 Wed,  9 Jul 2025 07:22:43 +0000 (GMT)
Message-ID: <4eb09ec9-bb7b-4266-8771-26b4819f47db@samsung.com>
Date: Wed, 9 Jul 2025 09:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Apply drm_bridge_connector helper for the
 Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
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
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250709070139.3130635-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250709072246eucas1p1d64e4c09a83c92497d76cb3efeaf6509
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b
X-EPHeader: CA
X-CMS-RootMailID: 20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b
References: <CGME20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b@eucas1p1.samsung.com>
 <20250709070139.3130635-1-damon.ding@rock-chips.com>
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

On 09.07.2025 09:01, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-8 are preparations for the movement of the panel/bridge parsing.
> PATCH 9 is to apply a better API for the encoder initialization.
> PATCH 10-11 are to apply the newly added API to find panel or bridge.
> PATCH 12 is to apply the drm_bridge_connector helper.

This patchset conflicts with my recent fix for Analogix DP driver 
applied to drm-misc-fixes:

https://lore.kernel.org/all/20250627165652.580798-1-m.szyprowski@samsung.com/


> Damon Ding (12):
>    drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>    drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>      &drm_bridge_funcs.atomic_enable
>    drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
>    drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>    drm/exynos: exynos_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Add support to find panel or bridge
>    drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
>      drm_simple_encoder_init()
>    drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
>    drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
>    drm/bridge: analogix_dp: Remove unused APIs for AUX bus
>    drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>
>   .../drm/bridge/analogix/analogix_dp_core.c    | 370 ++++++++++--------
>   .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
>   drivers/gpu/drm/exynos/exynos_dp.c            |  27 +-
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  42 +-
>   include/drm/bridge/analogix_dp.h              |   6 +-
>   5 files changed, 217 insertions(+), 236 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

