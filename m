Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86530B01431
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CF910E263;
	Fri, 11 Jul 2025 07:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="TVoTqxym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49228.qiye.163.com (mail-m49228.qiye.163.com
 [45.254.49.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333F810E263
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:16:42 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1badd8452;
 Fri, 11 Jul 2025 15:16:37 +0800 (GMT+08:00)
Message-ID: <9a094335-79ac-4419-bfb7-0df27b8fa603@rock-chips.com>
Date: Fri, 11 Jul 2025 15:16:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Apply drm_bridge_connector helper for the
 Analogix DP driver
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
References: <CGME20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b@eucas1p1.samsung.com>
 <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <4eb09ec9-bb7b-4266-8771-26b4819f47db@samsung.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4eb09ec9-bb7b-4266-8771-26b4819f47db@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5CT1ZPQksaQ0hPGkNCHx9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
X-HM-Tid: 0a97f857deaa03a3kunm3b2ab5caf2ddf4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjY6MRw*IjEwIx8MDFEJDSMX
 SVZPCQpVSlVKTE5JSUpDSUtLSkpLVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITUJDNwY+
DKIM-Signature: a=rsa-sha256;
 b=TVoTqxymO3vvd1b9+aSl1I0T2j9Z9r35bWxjCF2PbI0G5iTNtWDkfCbrHJCDevU7au9JgckLZxcTkF0Z8DZSgEIleijQGpvQFqDHEGX0dNpC8fl9hHIVR27rvXzlXte9GD4Rjega3ly4DXnG/AxqFar4mDw05jbkgmtK1ExGa7Q=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=kxsHD+SSh0Luv+skgTZWigJdecyXnBYdarAnH8cNCSY=;
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

On 2025/7/9 15:22, Marek Szyprowski wrote:
> On 09.07.2025 09:01, Damon Ding wrote:
>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 3-8 are preparations for the movement of the panel/bridge parsing.
>> PATCH 9 is to apply a better API for the encoder initialization.
>> PATCH 10-11 are to apply the newly added API to find panel or bridge.
>> PATCH 12 is to apply the drm_bridge_connector helper.
> 
> This patchset conflicts with my recent fix for Analogix DP driver
> applied to drm-misc-fixes:
> 
> https://lore.kernel.org/all/20250627165652.580798-1-m.szyprowski@samsung.com/
> 

Yeah, I've also been tracking your patch as well, and I will rebase my 
changes once it's merged.

> 
>> Damon Ding (12):
>>     drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>>     drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>>       &drm_bridge_funcs.atomic_enable
>>     drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
>>     drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>>     drm/exynos: exynos_dp: Remove redundant
>>       &analogix_dp_plat_data.skip_connector
>>     drm/bridge: analogix_dp: Remove redundant
>>       &analogix_dp_plat_data.skip_connector
>>     drm/bridge: analogix_dp: Add support to find panel or bridge
>>     drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
>>       drm_simple_encoder_init()
>>     drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
>>     drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
>>     drm/bridge: analogix_dp: Remove unused APIs for AUX bus
>>     drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>>
>>    .../drm/bridge/analogix/analogix_dp_core.c    | 370 ++++++++++--------
>>    .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
>>    drivers/gpu/drm/exynos/exynos_dp.c            |  27 +-
>>    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  42 +-
>>    include/drm/bridge/analogix_dp.h              |   6 +-
>>    5 files changed, 217 insertions(+), 236 deletions(-)
>>
> Best regards

Best regards,
Damon

