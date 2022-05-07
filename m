Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D1A51E744
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 15:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53409112C9B;
	Sat,  7 May 2022 13:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17669.qiye.163.com (mail-m17669.qiye.163.com
 [59.111.176.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48A8112C9B
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 13:09:29 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m17669.qiye.163.com (Hmail) with ESMTPA id 826EC46006D;
 Sat,  7 May 2022 21:09:25 +0800 (CST)
Message-ID: <5b697caa-c8ff-9f10-baa0-4d3e1a644a5f@rock-chips.com>
Date: Sat, 7 May 2022 21:09:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 -next] drm/rockchip: Fix Kconfig dependencies
Content-Language: en-US
To: Ren Zhijie <renzhijie2@huawei.com>, hjc@rock-chips.com, heiko@sntech.de,
 airlied@linux.ie, daniel@ffwll.ch, lyude@redhat.com, tzimmermann@suse.de
References: <20220507100910.93705-1-renzhijie2@huawei.com>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220507100910.93705-1-renzhijie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRkaT0pWSkxNTB0eHk
 tPGUJKVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ni46Njo5SD0xPg0zH0IsSR0q
 ShkaFE9VSlVKTU5KQklDQk1NS01LVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEJDTjcG
X-HM-Tid: 0a809ea3a29cda59kuws826ec46006d
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
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhijie:

On 5/7/22 18:09, Ren Zhijie wrote:
> drivers/gpu/drm/rockchip/cdn-dp-core.o: In function `cdn_dp_connector_mode_valid':
> cdn-dp-core.c:(.text+0x1e1): undefined reference to `drm_dp_bw_code_to_link_rate'
> cdn-dp-core.c:(.text+0x1f4): undefined reference to `drm_dp_bw_code_to_link_rate'
> drivers/gpu/drm/rockchip/cdn-dp-core.o: In function `cdn_dp_pd_event_work':
> cdn-dp-core.c:(.text+0x138e): undefined reference to `drm_dp_channel_eq_ok'
> drivers/gpu/drm/rockchip/cdn-dp-reg.o: In function `cdn_dp_train_link':
> cdn-dp-reg.c:(.text+0xd5a): undefined reference to `drm_dp_bw_code_to_link_rate'
>
> The DP-helper module has been replaced by the display-helper module.
> So the driver have to select it.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 1e0f66420b13("drm/display: Introduce a DRM display-helper module")
> Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>

Thanks.

Reviewed-by: Andy Yan <andy.yan@rock-chips.com>

> ---
> v2: remove "select DRM_DISPLAY_HELPER if ROCKCHIP_ANALOGIX_DP" under DRM_ROCKCHIP at the head,
> and separately add the select for ROCKCHIP_ANALOGIX_DP and ROCKCHIP_CDN_DP, which Andy suggested.
> ---
> ---
>   drivers/gpu/drm/rockchip/Kconfig | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index 5afab49dc4f2..53c2d9980d48 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -2,7 +2,6 @@
>   config DRM_ROCKCHIP
>   	tristate "DRM Support for Rockchip"
>   	depends on DRM && ROCKCHIP_IOMMU
> -	select DRM_DISPLAY_HELPER if ROCKCHIP_ANALOGIX_DP
>   	select DRM_GEM_CMA_HELPER
>   	select DRM_KMS_HELPER
>   	select DRM_PANEL
> @@ -38,6 +37,7 @@ config ROCKCHIP_VOP2
>   config ROCKCHIP_ANALOGIX_DP
>   	bool "Rockchip specific extensions for Analogix DP driver"
>   	depends on ROCKCHIP_VOP
> +	select DRM_DISPLAY_HELPER
>   	select DRM_DISPLAY_DP_HELPER
>   	help
>   	  This selects support for Rockchip SoC specific extensions
> @@ -47,6 +47,8 @@ config ROCKCHIP_ANALOGIX_DP
>   config ROCKCHIP_CDN_DP
>   	bool "Rockchip cdn DP"
>   	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
> +	select DRM_DISPLAY_HELPER
> +	select DRM_DISPLAY_DP_HELPER
>   	help
>   	  This selects support for Rockchip SoC specific extensions
>   	  for the cdn DP driver. If you want to enable Dp on
