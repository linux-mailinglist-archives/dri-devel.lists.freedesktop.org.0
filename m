Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66131A8753A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 03:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F90310E148;
	Mon, 14 Apr 2025 01:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="PWDQu5Yq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973199.qiye.163.com (mail-m1973199.qiye.163.com
 [220.197.31.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B1C10E148
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 01:25:14 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 11b9cb942;
 Mon, 14 Apr 2025 09:20:00 +0800 (GMT+08:00)
Message-ID: <6b662c34-7a1d-4e07-aaa7-752bc0c7575f@rock-chips.com>
Date: Mon, 14 Apr 2025 09:20:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/bridge: analogix_dp: drop extra calls to
 analogix_dp_prepare_panel()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhNSlZCHhgaQxhOSBlCH0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9631e1bfb403a3kunm11b9cb942
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kwg6Fxw5OjIDLC4NTxw6KDIs
 IglPCkNVSlVKTE9PTkJITUtKQ09NVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIQ0JNNwY+
DKIM-Signature: a=rsa-sha256;
 b=PWDQu5YqPF1XeNhsR+IW7rTbu91p2McyotfPxrjfiqQuJeuhN+4kuCmiEXKXfqGOd18Qf/Ru6LCJIxgp6s1JBrmZscb78w0xwMdBhrOOCnQ0KFs5ptBRvCOTzKc1VL9Ig/hooslZgz2WisstwU+VLQn7K6JvMiKFtDTgdo30goE=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=YaobMm8o+70LNUX6WDcV+2R5nfMUxLQHI1fhk+wAPpU=;
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
> The analogix_dp_prepare_panel() returns immediately if there is no
> attached panel. Drop several calls to this function which are performed
> when dp->plat_data->panel is NULL.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 22 +---------------------
>   1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 042154e2d8ccd74ac2dc27fe527e810a50e08a09..ab1cfc340aa95bbf13fe021bd33227b565a5458d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1005,17 +1005,11 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>   {
>   	struct analogix_dp_device *dp = to_dp(connector);
>   	const struct drm_edid *drm_edid;
> -	int ret, num_modes = 0;
> +	int num_modes = 0;
>   
>   	if (dp->plat_data->panel) {
>   		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
>   	} else {
> -		ret = analogix_dp_prepare_panel(dp, true, false);
> -		if (ret) {
> -			DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> -			return 0;
> -		}
> -
>   		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>   
>   		drm_edid_connector_update(&dp->connector, drm_edid);
> @@ -1024,10 +1018,6 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>   			num_modes += drm_edid_connector_add_modes(&dp->connector);
>   			drm_edid_free(drm_edid);
>   		}
> -
> -		ret = analogix_dp_prepare_panel(dp, false, false);
> -		if (ret)
> -			DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
>   	}
>   
>   	if (dp->plat_data->get_modes)
> @@ -1087,19 +1077,9 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>   	if (dp->plat_data->panel)
>   		return connector_status_connected;
>   
> -	ret = analogix_dp_prepare_panel(dp, true, false);
> -	if (ret) {
> -		DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> -		return connector_status_disconnected;
> -	}
> -
>   	if (!analogix_dp_detect_hpd(dp))
>   		status = connector_status_connected;
>   
> -	ret = analogix_dp_prepare_panel(dp, false, false);
> -	if (ret)
> -		DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
> -
>   	return status;
>   }
>   
> 

With the patch series:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=942183

When I verify this patch, there will be a small warning:
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1075:6: warning: 
unused variable 'ret' [-Wunused-variable]
         int ret;
             ^

It should be better to remove the unused 'ret'.

Best regards,
Damon

