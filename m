Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D4A87575
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 03:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3992A10E43E;
	Mon, 14 Apr 2025 01:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="aWGYzSyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973193.qiye.163.com (mail-m1973193.qiye.163.com
 [220.197.31.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE3D10E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 01:46:55 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 11bad66ba;
 Mon, 14 Apr 2025 09:46:49 +0800 (GMT+08:00)
Message-ID: <65b5da62-3994-42e0-916c-4a8505fa3844@rock-chips.com>
Date: Mon, 14 Apr 2025 09:46:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/bridge: analogic_dp: drop panel_is_modeset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk8aQ1ZLGh0YT0oaTRlOSU9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9631fa4e5d03a3kunm11bad66ba
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODo6HSo*PDIDPC4eHx5PKjoz
 SBBPCRRVSlVKTE9PTkJOSUpKT0lOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITUNLNwY+
DKIM-Signature: a=rsa-sha256;
 b=aWGYzSylNmiXIDwCVvLnCAHkwVkH+FU/Po9CcypUW8aTsrHMC3rkXTEcXBG3rsC6VTLUs0kcRSGiRad3itQq2Z1wKUbpFJztxXAvFkstah8OhiI0iQyJMU8SmRH+VtmJGM72/tY4NRXsUX4hzikzu2EeAGWe5myDv2V8gItVo8k=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=Ig4iftYOsYlJff/8wBUz9XCqK3qD58dlsifH7hNudHw=;
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
> The dp->panel_is_modeset is now a write-only field. Drop it completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +----------
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  1 -
>   2 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 82dc4b01806f9728dc882b0128171838e81f21b0..704c6169116eb2601d2ad02dc7294455ceff5460 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -964,9 +964,7 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>    * is false, the panel will be unprepared.
>    *
>    * The function will disregard the current state
> - * of the panel and either prepare/unprepare the panel based on @prepare. Once
> - * it finishes, it will update dp->panel_is_modeset to reflect the current state
> - * of the panel.
> + * of the panel and either prepare/unprepare the panel based on @prepare.
>    */
>   static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   				     bool prepare)
> @@ -983,12 +981,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   	else
>   		ret = drm_panel_unprepare(dp->plat_data->panel);
>   
> -	if (ret)
> -		goto out;
> -
> -	dp->panel_is_modeset = prepare;
> -
> -out:
>   	mutex_unlock(&dp->panel_lock);
>   	return ret;
>   }
> @@ -1532,7 +1524,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   	dp->dpms_mode = DRM_MODE_DPMS_OFF;
>   
>   	mutex_init(&dp->panel_lock);
> -	dp->panel_is_modeset = false;
>   
>   	/*
>   	 * platform dp driver need containor_of the plat_data to get
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index 774d11574b095b093ddf2818ad5b84be6605c9bf..b679d5b71d276f458d905c936160f107225bc6c5 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -170,7 +170,6 @@ struct analogix_dp_device {
>   	bool			psr_supported;
>   
>   	struct mutex		panel_lock;
> -	bool			panel_is_modeset;
>   
>   	struct analogix_dp_plat_data *plat_data;
>   };
> 

The patch has been verified with the eDP panel "lg,lp079qx1-sp0v" in 
RK3588S EVB1 board.

Tested-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

