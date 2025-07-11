Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28A5B0152E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4976210E9BA;
	Fri, 11 Jul 2025 07:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="f3ABdV+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49210.qiye.163.com (mail-m49210.qiye.163.com
 [45.254.49.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7DD10E9BA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:50:22 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1baf32046;
 Fri, 11 Jul 2025 15:50:18 +0800 (GMT+08:00)
Message-ID: <84b8fe6e-0d33-42a9-9f8f-ed10998429e8@rock-chips.com>
Date: Fri, 11 Jul 2025 15:50:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-13-damon.ding@rock-chips.com>
 <6140569.FjKLVJYuhi@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6140569.FjKLVJYuhi@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUIeS1YYSUJKSUpMQkgfTxhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f876b52003a3kunm13db4e75f3c74a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6GCo*KjE2Lx8SUSk5EgEj
 C08wCj5VSlVKTE5JSUlLSUlLTEJNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPT0lMNwY+
DKIM-Signature: a=rsa-sha256;
 b=f3ABdV+J9ZF4Xh4dDg/WOg07CApS5rihUgUFAvDfOc0Q3Sk0KKlc5dUnKK0B8PkH67LddM3XLMInqreiNp6Iq4k45NkImv8eCKuNN/9Qarq/wNQ452zop5AwY0dB2gNx8FzkKokv0WlZypir9qZ2d0Pl+UxU4dsxr9HRKS+eZqs=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=ugJYj+exyps/6wR5MX4czRxtXgkmuqVMFOJv2QPxESU=;
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

Hi Heiko,

On 2025/7/10 4:11, Heiko Stübner wrote:
> Am Mittwoch, 9. Juli 2025, 09:01:39 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> Apply drm_bridge_connector helper for Analogix DP driver.
>>
>> The following changes have been made:
>> - Remove &analogix_dp_device.connector and change
>>    &analogix_dp_device.bridge from a pointer to an instance.
>> - Apply devm_drm_bridge_alloc() to allocate &analogix_dp_device that
>>    contains &drm_bridge.
>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>    and &drm_connector_helper_funcs.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ------
>>
>> Changes in v2:
>> - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
>>    DRM_BRIDGE_OP_EDID.
>> - Add analogix_dp_bridge_edid_read().
>> - Move &analogix_dp_plat_data.skip_connector deletion to the previous
>>    patches.
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 169 ++++++++----------
>>   .../drm/bridge/analogix/analogix_dp_core.h    |   4 +-
>>   2 files changed, 80 insertions(+), 93 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index abc64cc17e4c..fb510e55ef06 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -23,6 +23,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_edid.h>
>> @@ -948,23 +949,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>>   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>>   }
>>   
>> -static int analogix_dp_get_modes(struct drm_connector *connector)
>> +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> -	const struct drm_edid *drm_edid;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	int num_modes = 0;
>>   
>>   	if (dp->plat_data->panel) {
>>   		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
> 
> here is one example where a panel_bridge would help :-)
> 
> I.e. I'd think without it the code would need some sort of
> 
>    	if (dp->plat_data->bridge) {
>    		num_modes += drm_bridge_get_modes(dp->plat_data->bridge, connector);
> 
> thing?
> 

Oh, the handling of bridge here is indeed not well thought out. I will 
implement the panel-bridge in the next version.

>> -	} else {
>> -		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>> -
>> -		drm_edid_connector_update(&dp->connector, drm_edid);
>> -
>> -		if (drm_edid) {
>> -			num_modes += drm_edid_connector_add_modes(&dp->connector);
>> -			drm_edid_free(drm_edid);
>> -		}
>>   	}
>>   
>>   	if (dp->plat_data->get_modes)
> 

Best regards,
Damon

