Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D82FA8759E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 03:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A6710E442;
	Mon, 14 Apr 2025 01:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="R3LNFO7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m21473.qiye.163.com (mail-m21473.qiye.163.com
 [117.135.214.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5400810E442
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 01:58:34 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 11bb3e4e9;
 Mon, 14 Apr 2025 09:58:28 +0800 (GMT+08:00)
Message-ID: <641cf50c-82d9-4690-bff7-36bc7f0f954c@rock-chips.com>
Date: Mon, 14 Apr 2025 09:58:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/bridge: analogix_dp: ignore return values of
 drm_panel_* calls
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-6-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-6-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQktMQ1YfSEIYTk8ZGE1JSx1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a963204f70a03a3kunm11bb3e4e9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mww6DBw*SzICPC4SHghJNU4a
 PzAaCz1VSlVKTE9PTkJOQktCTE1PVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOSUpCNwY+
DKIM-Signature: a=rsa-sha256;
 b=R3LNFO7PXe2yE11wxIkEsuLQ0mSFket7sQQu0kzw7k+gHKgX4+FMMoXpkhwF7IOuZdxbFsYhYn13Zfph2ACSHhb1v+K13QJbebkHMTNt60FXDRaem2AkCoZU9+LSLnBaWVM4HDFAAAMeNKqX/yEAmYp8RAbXFprvX4QEsm5yt7g=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=9j4J4fkgVTui3/AFzsLEhhQTB84aEZmksSJuscefb9o=;
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

On 2025/4/1 13:11, Dmitry Baryshkov wrote:
> Follow the example of other drivers and ignore return values of the
> drm_panel_prepare() / unprepare() / enable() / disable() calls. There is
> no possible error recovery, so the driver just logs a message.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 39 ++++------------------
>   1 file changed, 6 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index f60068011008482f7b7b2edfcab5fb1b3e9e130f..c7dffdae31877ae194fc6b0a5bf21be203f7dcc4 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -838,10 +838,7 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>   	int ret;
>   
>   	/* Keep the panel disabled while we configure video */
> -	if (dp->plat_data->panel) {
> -		if (drm_panel_disable(dp->plat_data->panel))
> -			DRM_ERROR("failed to disable the panel\n");
> -	}
> +	drm_panel_disable(dp->plat_data->panel);
>   
>   	ret = analogix_dp_train_link(dp);
>   	if (ret) {
> @@ -863,13 +860,7 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>   	}
>   
>   	/* Safe to enable the panel now */
> -	if (dp->plat_data->panel) {
> -		ret = drm_panel_enable(dp->plat_data->panel);
> -		if (ret) {
> -			DRM_ERROR("failed to enable the panel\n");
> -			return ret;
> -		}
> -	}
> +	drm_panel_enable(dp->plat_data->panel);
>   
>   	/* Check whether panel supports fast training */
>   	ret = analogix_dp_fast_link_train_detection(dp);
> @@ -1136,7 +1127,6 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	struct analogix_dp_device *dp = bridge->driver_private;
>   	struct drm_crtc *crtc;
>   	struct drm_crtc_state *old_crtc_state;
> -	int ret;
>   
>   	crtc = analogix_dp_get_new_crtc(dp, old_state);
>   	if (!crtc)
> @@ -1147,11 +1137,7 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	if (old_crtc_state && old_crtc_state->self_refresh_active)
>   		return;
>   
> -	if (dp->plat_data->panel) {
> -		ret = drm_panel_prepare(dp->plat_data->panel);
> -		if (ret)
> -			DRM_ERROR("failed to prepare the panel ret = %d\n", ret);
> -	}
> +	drm_panel_prepare(dp->plat_data->panel);
>   }
>   
>   static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
> @@ -1231,17 +1217,11 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   {
>   	struct analogix_dp_device *dp = bridge->driver_private;
> -	int ret;
>   
>   	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
>   		return;
>   
> -	if (dp->plat_data->panel) {
> -		if (drm_panel_disable(dp->plat_data->panel)) {
> -			DRM_ERROR("failed to disable the panel\n");
> -			return;
> -		}
> -	}
> +	drm_panel_disable(dp->plat_data->panel);
>   
>   	disable_irq(dp->irq);
>   
> @@ -1249,11 +1229,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   
>   	pm_runtime_put_sync(dp->dev);
>   
> -	if (dp->plat_data->panel) {
> -		ret = drm_panel_unprepare(dp->plat_data->panel);
> -		if (ret)
> -			DRM_ERROR("failed to unprepare the panel ret = %d\n", ret);
> -	}
> +	drm_panel_unprepare(dp->plat_data->panel);
>   
>   	dp->fast_train_enable = false;
>   	dp->psr_supported = false;
> @@ -1678,10 +1654,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
>   	analogix_dp_bridge_disable(dp->bridge);
>   	dp->connector.funcs->destroy(&dp->connector);
>   
> -	if (dp->plat_data->panel) {
> -		if (drm_panel_unprepare(dp->plat_data->panel))
> -			DRM_ERROR("failed to turnoff the panel\n");
> -	}
> +	drm_panel_unprepare(dp->plat_data->panel);
>   
>   	drm_dp_aux_unregister(&dp->aux);
>   
> 

The patch has been verified with the eDP panel "lg,lp079qx1-sp0v" in 
RK3588S EVB1 board.

Tested-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

