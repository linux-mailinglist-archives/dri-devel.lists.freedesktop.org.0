Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B5AD9B42
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 10:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0075010E06A;
	Sat, 14 Jun 2025 08:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="H1NHtE1Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973193.qiye.163.com (mail-m1973193.qiye.163.com
 [220.197.31.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419E910E06A
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 08:30:12 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 18a651237;
 Sat, 14 Jun 2025 16:30:07 +0800 (GMT+08:00)
Message-ID: <c5985382-3af7-4111-8ffa-20e88f4c1ca8@rock-chips.com>
Date: Sat, 14 Jun 2025 16:30:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250526120742.3195812-1-damon.ding@rock-chips.com>
 <20250526120742.3195812-4-damon.ding@rock-chips.com>
 <cvbmmyryay65aqusf5z23cgary4gpoimuav73la4r5hc4jtndg@grvdn2rvhir4>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <cvbmmyryay65aqusf5z23cgary4gpoimuav73la4r5hc4jtndg@grvdn2rvhir4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUNJQlZOQ0gfSx1OTkMeGBlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a976d8f737c09dakunm84ed366818831b6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nz46Ngw*CjEwLUkiHi4PHi4s
 NS4KCTNVSlVKTE9CQ0NCQ0tDQkNCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQ0pCTTcG
DKIM-Signature: a=rsa-sha256;
 b=H1NHtE1Qs+tHUenLeewG4U2prozlODz1tnLqSjxcvW8ruFTMDkLysp1eNQH9ds5o3CEF6VtcC/5vBlwfKAL8MrbLuDWp81tQY6pyioAJ/Ok96iZ9rx0bAam0pp1104G1ozwXM8Nx5oHS41MNEPC8fSv0yl35w8pZsel9UNdcHCU=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=sNCiwn8HYqqCA4rNK2VXPMwTL7jSBGEBVu/FFG32Gc4=;
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

Hi Dmitry,

On 2025/6/9 1:44, Dmitry Baryshkov wrote:
> On Mon, May 26, 2025 at 08:07:42PM +0800, Damon Ding wrote:
>> Apply drm_bridge_connector helper for Analogix DP driver.
>>
>> The following changes have been made:
>> - Remove &analogix_dp_device.connector and change
>>    &analogix_dp_device.bridge from a pointer to an instance.
>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>    and &drm_connector_helper_funcs.
>> - Remove &analogix_dp_plat_data.skip_connector.
> 
> You've missed the exynos_dp.c which uses it.
> 
> I think there is slightly more to be handled here. For example, I'd
> suggest moving panel / bridge parsing and attachment to the core driver
> too. Exynos handles several backwards-compatibility cases, e.g. using
> the "panel" property or just passing video timings in the DT node. You
> might need to implement instantiating a panel from videomode specially
> for exynos_dp.c
> 

For this patch series, I'd like to place the DRM bridge on the Analogix 
side and the DRM connector/encoder on the Rockchip side.

Following your recommendation, it would be better to handle the 
panel/bridge parsing on the Analogix side. I believe this approach makes 
sense because the panel/bridge should logically be positioned behind the 
Analogix bridge in the display pipeline.

I will implement you suggestion and update the exynos_dp.c driver 
synchronously.

> This would allow you to cleanup plat_data interface as a preparation for
> this patch.
> 
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 157 ++++++++----------
>>   .../drm/bridge/analogix/analogix_dp_core.h    |   4 +-
>>   include/drm/bridge/analogix_dp.h              |   1 -
>>   3 files changed, 72 insertions(+), 90 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 2c51d3193120..d67afd63d999 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -22,6 +22,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_edid.h>
>> @@ -946,9 +947,10 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>>   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>>   }
>>   
>> -static int analogix_dp_get_modes(struct drm_connector *connector)
>> +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge,
>> +					struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	const struct drm_edid *drm_edid;
>>   	int num_modes = 0;
>>   
>> @@ -957,10 +959,10 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>>   	} else {
>>   		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>>   
>> -		drm_edid_connector_update(&dp->connector, drm_edid);
>> +		drm_edid_connector_update(connector, drm_edid);
>>   
>>   		if (drm_edid) {
>> -			num_modes += drm_edid_connector_add_modes(&dp->connector);
>> +			num_modes += drm_edid_connector_add_modes(connector);
>>   			drm_edid_free(drm_edid);
>>   		}
>>   	}
> 
> This should be split into get_modes() and edid_read(). Use
> DRM_BRIDGE_OP_ flags to control which implementation is actually being
> used.
> 

Yeah, I will do it.

> 
>> @@ -971,51 +973,25 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>>   	return num_modes;
>>   }
>>   
>> -static struct drm_encoder *
>> -analogix_dp_best_encoder(struct drm_connector *connector)
>> +static int analogix_dp_bridge_atomic_check(struct drm_bridge *bridge,
>> +					   struct drm_bridge_state *bridge_state,
>> +					   struct drm_crtc_state *crtc_state,
>> +					   struct drm_connector_state *conn_state)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> -
>> -	return dp->encoder;
>> -}
>> -
>> -
>> -static int analogix_dp_atomic_check(struct drm_connector *connector,
>> -				    struct drm_atomic_state *state)
>> -{
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> -	struct drm_connector_state *conn_state;
>> -	struct drm_crtc_state *crtc_state;
>> -
>> -	conn_state = drm_atomic_get_new_connector_state(state, connector);
>> -	if (WARN_ON(!conn_state))
>> -		return -ENODEV;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   
>>   	conn_state->self_refresh_aware = true;
>>   
>> -	if (!conn_state->crtc)
>> -		return 0;
>> -
>> -	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
>> -	if (!crtc_state)
>> -		return 0;
>> -
>>   	if (crtc_state->self_refresh_active && !dp->psr_supported)
>>   		return -EINVAL;
>>   
>>   	return 0;
>>   }
>>   
>> -static const struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs = {
>> -	.get_modes = analogix_dp_get_modes,
>> -	.best_encoder = analogix_dp_best_encoder,
>> -	.atomic_check = analogix_dp_atomic_check,
>> -};
>> -
>>   static enum drm_connector_status
>> -analogix_dp_detect(struct drm_connector *connector, bool force)
>> +analogix_dp_bridge_detect(struct drm_bridge *bridge)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	enum drm_connector_status status = connector_status_disconnected;
>>   
>>   	if (dp->plat_data->panel)
>> @@ -1027,20 +1003,11 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>>   	return status;
>>   }
>>   
>> -static const struct drm_connector_funcs analogix_dp_connector_funcs = {
>> -	.fill_modes = drm_helper_probe_single_connector_modes,
>> -	.detect = analogix_dp_detect,
>> -	.destroy = drm_connector_cleanup,
>> -	.reset = drm_atomic_helper_connector_reset,
>> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> -};
>> -
>>   static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>>   				     struct drm_encoder *encoder,
>>   				     enum drm_bridge_attach_flags flags)
>>   {
>> -	struct analogix_dp_device *dp = bridge->driver_private;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	struct drm_connector *connector = NULL;
>>   	int ret = 0;
>>   
>> @@ -1049,23 +1016,15 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (!dp->plat_data->skip_connector) {
>> -		connector = &dp->connector;
>> -		connector->polled = DRM_CONNECTOR_POLL_HPD;
>> -
>> -		ret = drm_connector_init(dp->drm_dev, connector,
>> -					 &analogix_dp_connector_funcs,
>> -					 DRM_MODE_CONNECTOR_eDP);
>> -		if (ret) {
>> -			DRM_ERROR("Failed to initialize connector with drm\n");
>> -			return ret;
>> -		}
>> -
>> -		drm_connector_helper_add(connector,
>> -					 &analogix_dp_connector_helper_funcs);
>> -		drm_connector_attach_encoder(connector, encoder);
>> +	connector = drm_bridge_connector_init(dp->drm_dev, encoder);
>> +	if (IS_ERR(connector)) {
>> +		ret = PTR_ERR(connector);
>> +		dev_err(dp->dev, "Failed to initialize connector with drm\n");
>> +		return ret;
>>   	}
>>   
>> +	drm_connector_attach_encoder(connector, encoder);
>> +
>>   	/*
>>   	 * NOTE: the connector registration is implemented in analogix
>>   	 * platform driver, that to say connector would be exist after
>> @@ -1124,7 +1083,7 @@ struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
>>   static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>>   						 struct drm_atomic_state *old_state)
>>   {
>> -	struct analogix_dp_device *dp = bridge->driver_private;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	struct drm_crtc *crtc;
>>   	struct drm_crtc_state *old_crtc_state;
>>   
>> @@ -1177,14 +1136,21 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
>>   }
>>   
>>   static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
>> +					struct drm_atomic_state *state,
>>   					const struct drm_display_mode *mode)
>>   {
>> -	struct analogix_dp_device *dp = bridge->driver_private;
>> -	struct drm_display_info *display_info = &dp->connector.display_info;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	struct video_info *video = &dp->video_info;
>>   	struct device_node *dp_node = dp->dev->of_node;
>> +	struct drm_connector *connector;
>> +	struct drm_display_info *display_info;
>>   	int vic;
>>   
>> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>> +	if (!connector)
>> +		return;
>> +	display_info = &connector->display_info;
>> +
>>   	/* Input video interlaces & hsync pol & vsync pol */
>>   	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>>   	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
>> @@ -1255,7 +1221,7 @@ static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
>>   static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>>   					     struct drm_atomic_state *old_state)
>>   {
>> -	struct analogix_dp_device *dp = bridge->driver_private;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	struct drm_crtc *crtc;
>>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>>   	int timeout_loop = 0;
>> @@ -1268,7 +1234,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>>   	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
>>   	if (!new_crtc_state)
>>   		return;
>> -	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
>> +	analogix_dp_bridge_mode_set(bridge, old_state, &new_crtc_state->adjusted_mode);
>>   
>>   	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
>>   	/* Not a full enable, just disable PSR and continue */
>> @@ -1297,7 +1263,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>>   
>>   static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>>   {
>> -	struct analogix_dp_device *dp = bridge->driver_private;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   
>>   	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
>>   		return;
>> @@ -1320,7 +1286,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>>   static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>>   					      struct drm_atomic_state *old_state)
>>   {
>> -	struct analogix_dp_device *dp = bridge->driver_private;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	struct drm_crtc *old_crtc, *new_crtc;
>>   	struct drm_crtc_state *old_crtc_state = NULL;
>>   	struct drm_crtc_state *new_crtc_state = NULL;
>> @@ -1358,7 +1324,7 @@ static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>>   static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>   						   struct drm_atomic_state *old_state)
>>   {
>> -	struct analogix_dp_device *dp = bridge->driver_private;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	struct drm_crtc *crtc;
>>   	struct drm_crtc_state *new_crtc_state;
>>   	int ret;
>> @@ -1384,24 +1350,27 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>>   	.atomic_enable = analogix_dp_bridge_atomic_enable,
>>   	.atomic_disable = analogix_dp_bridge_atomic_disable,
>>   	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
>> +	.atomic_check = analogix_dp_bridge_atomic_check,
>>   	.attach = analogix_dp_bridge_attach,
>> +	.get_modes = analogix_dp_bridge_get_modes,
>> +	.detect = analogix_dp_bridge_detect,
>>   };
>>   
>>   static int analogix_dp_create_bridge(struct drm_device *drm_dev,
>>   				     struct analogix_dp_device *dp)
>>   {
>> -	struct drm_bridge *bridge;
>> -
>> -	bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
>> -	if (!bridge) {
>> -		DRM_ERROR("failed to allocate for drm bridge\n");
>> -		return -ENOMEM;
>> -	}
>> +	struct drm_bridge *bridge = &dp->bridge;
>> +	int ret;
>>   
>> -	dp->bridge = bridge;
>> +	bridge->ops = DRM_BRIDGE_OP_DETECT |
>> +		      DRM_BRIDGE_OP_HPD |
>> +		      DRM_BRIDGE_OP_MODES;
>> +	bridge->of_node = dp->dev->of_node;
>> +	bridge->type = DRM_MODE_CONNECTOR_eDP;
>>   
>> -	bridge->driver_private = dp;
>> -	bridge->funcs = &analogix_dp_bridge_funcs;
>> +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
>> +	if (ret)
>> +		return ret;
>>   
>>   	return drm_bridge_attach(dp->encoder, bridge, NULL, 0);
>>   }
>> @@ -1493,9 +1462,10 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>>   		return ERR_PTR(-EINVAL);
>>   	}
>>   
>> -	dp = devm_kzalloc(dev, sizeof(struct analogix_dp_device), GFP_KERNEL);
>> -	if (!dp)
>> -		return ERR_PTR(-ENOMEM);
>> +	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
>> +				   &analogix_dp_bridge_funcs);
>> +	if (IS_ERR(dp))
>> +		return ERR_CAST(dp);
>>   
>>   	dp->dev = &pdev->dev;
>>   	dp->dpms_mode = DRM_MODE_DPMS_OFF;
>> @@ -1670,8 +1640,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
>>   
>>   void analogix_dp_unbind(struct analogix_dp_device *dp)
>>   {
>> -	analogix_dp_bridge_disable(dp->bridge);
>> -	dp->connector.funcs->destroy(&dp->connector);
>> +	analogix_dp_bridge_disable(&dp->bridge);
>>   
>>   	drm_panel_unprepare(dp->plat_data->panel);
>>   
>> @@ -1681,7 +1650,8 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>>   
>>   int analogix_dp_start_crc(struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp;
>> +	struct drm_bridge *bridge;
>>   
>>   	if (!connector->state->crtc) {
>>   		DRM_ERROR("Connector %s doesn't currently have a CRTC.\n",
>> @@ -1689,13 +1659,26 @@ int analogix_dp_start_crc(struct drm_connector *connector)
>>   		return -EINVAL;
>>   	}
>>   
>> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
>> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
>> +		return -EINVAL;
> 
> This requires that Analogix is the first bridge in the chain. It might
> be better to loop through all bridges, checking for one with matching
> ops.
>
> I'll check, maybe we have other bridges which can generate CRC data. If
> so, we can add DRM_BRIDGE_OP_CRC interface and loop that through
> drm_bridge_connector.
> 

So far, the function is only for the use of rockchip_drm_vop.c driver, 
and it is called in &drm_crtc_funcs.set_crc_source().

It may be nice to make CRC calculation being a part of struct 
drm_bridge_funcs. I will also try to check whether any serdes bridge 
supports the CRC function.

>> +
>> +	dp = to_dp(bridge);
>> +
>>   	return drm_dp_start_crc(&dp->aux, connector->state->crtc);
>>   }
>>   EXPORT_SYMBOL_GPL(analogix_dp_start_crc);
>>   
>>   int analogix_dp_stop_crc(struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp;
>> +	struct drm_bridge *bridge;
>> +
>> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
>> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
>> +		return -EINVAL;
>> +
>> +	dp = to_dp(bridge);
>>   
>>   	return drm_dp_stop_crc(&dp->aux);
>>   }
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> index 9f9e492da80f..22f28384b4ec 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> @@ -10,6 +10,7 @@
>>   #define _ANALOGIX_DP_CORE_H
>>   
>>   #include <drm/display/drm_dp_helper.h>
>> +#include <drm/drm_bridge.h>
>>   #include <drm/drm_crtc.h>
>>   
>>   #define DP_TIMEOUT_LOOP_COUNT 100
>> @@ -153,8 +154,7 @@ struct analogix_dp_device {
>>   	struct drm_encoder	*encoder;
>>   	struct device		*dev;
>>   	struct drm_device	*drm_dev;
>> -	struct drm_connector	connector;
>> -	struct drm_bridge	*bridge;
>> +	struct drm_bridge	bridge;
>>   	struct drm_dp_aux	aux;
>>   	struct clk		*clock;
>>   	unsigned int		irq;
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index cf17646c1310..cb9663ff61fb 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -29,7 +29,6 @@ struct analogix_dp_plat_data {
>>   	struct drm_panel *panel;
>>   	struct drm_encoder *encoder;
>>   	struct drm_connector *connector;
>> -	bool skip_connector;
>>   
>>   	int (*power_on)(struct analogix_dp_plat_data *);
>>   	int (*power_off)(struct analogix_dp_plat_data *);
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon

