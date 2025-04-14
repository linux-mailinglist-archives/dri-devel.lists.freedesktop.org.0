Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86B9A8754C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 03:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A7E10E0AA;
	Mon, 14 Apr 2025 01:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="NLuHcyiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49195.qiye.163.com (mail-m49195.qiye.163.com
 [45.254.49.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FD410E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 01:38:22 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 11ba6131e;
 Mon, 14 Apr 2025 09:38:14 +0800 (GMT+08:00)
Message-ID: <d4d6d1a2-cfec-4913-a30e-26cf63a17fa2@rock-chips.com>
Date: Mon, 14 Apr 2025 09:38:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/bridge: analogix_dp: drop unused argument to
 analogix_dp_prepare_panel()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-2-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-2-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhkZTVZLSU9LT0kdHh9NGE5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9631f271a503a3kunm11ba6131e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OE06SAw*PDIBAi4qGB0iUVE2
 KEowChFVSlVKTE9PTkJPTUJNS0pNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPTk5KNwY+
DKIM-Signature: a=rsa-sha256;
 b=NLuHcyiS0LzSXIBeVNtImdCsnVHVuCQjmL1298JQEhGOfz4Gn5XFBqDeyHKnxQdPNopmLX3Gq8vVKFwh1SxeJXyLAiuLDZFcZrX5a4Xitp1sdu1NAYuRb8ksxkq3xwb9Tq9x5r3TBcgLg3mrI1YCmYswWj8jFzNkuL6wHTcUY34=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=iD49FTyk71nxxI/ueYiMlbSL/H5Lc+sm+Xe9U6vy+1Q=;
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
> After previous cleanup all calling sites pass true as is_modeset_prepare
> argument to analogix_dp_prepare_panel(). Drop dead code depending on
> that argument being false.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index ab1cfc340aa95bbf13fe021bd33227b565a5458d..82dc4b01806f9728dc882b0128171838e81f21b0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -963,13 +963,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>    * If @prepare is true, this function will prepare the panel. Conversely, if it
>    * is false, the panel will be unprepared.
>    *
> - * If @is_modeset_prepare is true, the function will disregard the current state
> + * The function will disregard the current state
>    * of the panel and either prepare/unprepare the panel based on @prepare. Once
>    * it finishes, it will update dp->panel_is_modeset to reflect the current state
>    * of the panel.
>    */
>   static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
> -				     bool prepare, bool is_modeset_prepare)
> +				     bool prepare)
>   {
>   	int ret = 0;
>   
> @@ -978,13 +978,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   
>   	mutex_lock(&dp->panel_lock);
>   
> -	/*
> -	 * Exit early if this is a temporary prepare/unprepare and we're already
> -	 * modeset (since we neither want to prepare twice or unprepare early).
> -	 */
> -	if (dp->panel_is_modeset && !is_modeset_prepare)
> -		goto out;
> -
>   	if (prepare)
>   		ret = drm_panel_prepare(dp->plat_data->panel);
>   	else
> @@ -993,8 +986,7 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   	if (ret)
>   		goto out;
>   
> -	if (is_modeset_prepare)
> -		dp->panel_is_modeset = prepare;
> +	dp->panel_is_modeset = prepare;
>   
>   out:
>   	mutex_unlock(&dp->panel_lock);
> @@ -1072,7 +1064,6 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>   {
>   	struct analogix_dp_device *dp = to_dp(connector);
>   	enum drm_connector_status status = connector_status_disconnected;
> -	int ret;
>   
>   	if (dp->plat_data->panel)
>   		return connector_status_connected;
> @@ -1194,7 +1185,7 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	if (old_crtc_state && old_crtc_state->self_refresh_active)
>   		return;
>   
> -	ret = analogix_dp_prepare_panel(dp, true, true);
> +	ret = analogix_dp_prepare_panel(dp, true);
>   	if (ret)
>   		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
>   }
> @@ -1294,7 +1285,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   
>   	pm_runtime_put_sync(dp->dev);
>   
> -	ret = analogix_dp_prepare_panel(dp, false, true);
> +	ret = analogix_dp_prepare_panel(dp, false);
>   	if (ret)
>   		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
>   
> 

The patch has been verified with the eDP panel "lg,lp079qx1-sp0v" in 
RK3588S EVB1 board.

Tested-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

