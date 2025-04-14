Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB4DA87598
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 03:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F83310E440;
	Mon, 14 Apr 2025 01:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="IgTGUOhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3290.qiye.163.com (mail-m3290.qiye.163.com
 [220.197.32.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A2110E440
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 01:54:41 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 11bb22db8;
 Mon, 14 Apr 2025 09:54:36 +0800 (GMT+08:00)
Message-ID: <61f0bdc4-1262-4d8e-a358-7f6da94d8a61@rock-chips.com>
Date: Mon, 14 Apr 2025 09:54:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/bridge: analogix_dp: inline
 analogix_dp_prepare_panel()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-5-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-5-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh9JSFZMTx1JQkMeS01JHUtWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9632016ba503a3kunm11bb22db8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N1E6SSo6DDJJPC4rHigXTz0T
 IyswCj9VSlVKTE9PTkJOTUxMTklIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPSk5PNwY+
DKIM-Signature: a=rsa-sha256;
 b=IgTGUOhqyj/JFnSgt6LJHfOOmO3iU3p8jhBisDLCXW9gBCVRRmJtjMfCB3b6dZ1/NZytO4hFh/gNi8K0RjRovQW6jujsFyaUTq3r5opa562HnZzzgCWFM35gLCNuN+5/Fqxt0RaBAimPUD87yuBUD2fheEIIy7cxDuL4X58XEo8=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=Pn2juoFybSlR3t4mOBSpwjTiKo1IYUX0ygf0WJGwj9k=;
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
> The analogix_dp_prepare_panel() is now only calling a corresponding
> drm_panel function. Inline it to simplify the code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 43 +++++-----------------
>   1 file changed, 10 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978..f60068011008482f7b7b2edfcab5fb1b3e9e130f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -955,33 +955,6 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>   }
>   
> -/*
> - * This function is a bit of a catch-all for panel preparation, hopefully
> - * simplifying the logic of functions that need to prepare/unprepare the panel
> - * below.
> - *
> - * If @prepare is true, this function will prepare the panel. Conversely, if it
> - * is false, the panel will be unprepared.
> - *
> - * The function will disregard the current state
> - * of the panel and either prepare/unprepare the panel based on @prepare.
> - */
> -static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
> -				     bool prepare)
> -{
> -	int ret = 0;
> -
> -	if (!dp->plat_data->panel)
> -		return 0;
> -
> -	if (prepare)
> -		ret = drm_panel_prepare(dp->plat_data->panel);
> -	else
> -		ret = drm_panel_unprepare(dp->plat_data->panel);
> -
> -	return ret;
> -}
> -
>   static int analogix_dp_get_modes(struct drm_connector *connector)
>   {
>   	struct analogix_dp_device *dp = to_dp(connector);
> @@ -1174,9 +1147,11 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	if (old_crtc_state && old_crtc_state->self_refresh_active)
>   		return;
>   
> -	ret = analogix_dp_prepare_panel(dp, true);
> -	if (ret)
> -		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
> +	if (dp->plat_data->panel) {
> +		ret = drm_panel_prepare(dp->plat_data->panel);
> +		if (ret)
> +			DRM_ERROR("failed to prepare the panel ret = %d\n", ret);
> +	}
>   }
>   
>   static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
> @@ -1274,9 +1249,11 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   
>   	pm_runtime_put_sync(dp->dev);
>   
> -	ret = analogix_dp_prepare_panel(dp, false);
> -	if (ret)
> -		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
> +	if (dp->plat_data->panel) {
> +		ret = drm_panel_unprepare(dp->plat_data->panel);
> +		if (ret)
> +			DRM_ERROR("failed to unprepare the panel ret = %d\n", ret);
> +	}
>   
>   	dp->fast_train_enable = false;
>   	dp->psr_supported = false;
> 

The patch has been verified with the eDP panel "lg,lp079qx1-sp0v" in 
RK3588S EVB1 board.

Tested-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

