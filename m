Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45631B270A6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 23:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC9810E096;
	Thu, 14 Aug 2025 21:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="aif0DMJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F86810E096
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 21:17:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250814211704euoutp0151cd121a86511c0931ff87acade13743~bvsMJN_iv3218132181euoutp014
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 21:17:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250814211704euoutp0151cd121a86511c0931ff87acade13743~bvsMJN_iv3218132181euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1755206224;
 bh=cSEixDLE7xsPsFz7NBwxP7uK65MZGZKF8ZUmhrV1huw=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=aif0DMJNDGGyAVppTHMk6Yf+pUZiOWU0ER6evHyGiNIC4x5MUx2Uk4BrgOCHG32br
 v0vqia2Zf89eZKmw901sVlL+ul/Lzc6Y3ALfe83DhoHRPHhcp/U1Zx/XW7ya5K/4HA
 EyAA1M0g09bPOExExj4/J1IFPfi27LIby9z7wyEY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250814211703eucas1p253cb95d05d46ff9f84c21d549f0f0098~bvsK_rr3M1788217882eucas1p2V;
 Thu, 14 Aug 2025 21:17:03 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250814211700eusmtip10f43f1f50846dd52289fb97bdd649f18~bvsIPXpgd2313023130eusmtip1d;
 Thu, 14 Aug 2025 21:17:00 +0000 (GMT)
Message-ID: <7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
Date: Thu, 14 Aug 2025 23:16:59 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
From: Marek Szyprowski <m.szyprowski@samsung.com>
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
In-Reply-To: <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814211703eucas1p253cb95d05d46ff9f84c21d549f0f0098
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
X-EPHeader: CA
X-CMS-RootMailID: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
 <20250814104753.195255-1-damon.ding@rock-chips.com>
 <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
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


On 14.08.2025 16:33, Marek Szyprowski wrote:
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

The failure is caused by trying to add plat_data->next_bridge twice 
(from exynos_dp's .attach callback, and from analogix' ->bind callback).


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

