Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F04EACD8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 14:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0863710F086;
	Tue, 29 Mar 2022 12:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 587 seconds by postgrey-1.36 at gabe;
 Tue, 29 Mar 2022 12:06:17 UTC
Received: from mail-m176237.qiye.163.com (mail-m176237.qiye.163.com
 [59.111.176.237])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1E810F086
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 12:06:17 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m176237.qiye.163.com (Hmail) with ESMTPA id 74C32C4035E;
 Tue, 29 Mar 2022 19:56:28 +0800 (CST)
Message-ID: <274a12a9-61f1-7d6a-e89c-52237621930b@rock-chips.com>
Date: Tue, 29 Mar 2022 19:56:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 20/23] drm/rockchip: Make VOP driver optional
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <20220328151116.2034635-21-s.hauer@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220328151116.2034635-21-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRlOTEtWHRhIS09PHU
 MeH0NCVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjY6OQw5HD5REQkCKBAyK0oo
 Qz8wCh5VSlVKTU9DTk5PQkNDQkNCVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT01ITTcG
X-HM-Tid: 0a7fd588d4d0d9afkuws74c32c4035e
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha:

On 3/28/22 23:11, Sascha Hauer wrote:
> With upcoming VOP2 support VOP won't be the only choice anymore, so make
> the VOP driver optional.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   drivers/gpu/drm/rockchip/Kconfig            | 8 ++++++++
>   drivers/gpu/drm/rockchip/Makefile           | 3 ++-
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
>   3 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index fa5cfda4e90e3..7d22e2997a571 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -23,8 +23,16 @@ config DRM_ROCKCHIP
>   
>   if DRM_ROCKCHIP
>   
> +config ROCKCHIP_VOP
> +	bool "Rockchip VOP driver"
> +	default y
> +	help
> +	  This selects support for the VOP driver. You should enable it
> +	  on all older SoCs up to RK3399.
> +
>   config ROCKCHIP_ANALOGIX_DP
>   	bool "Rockchip specific extensions for Analogix DP driver"
> +	depends on ROCKCHIP_VOP


Aanlogix dp is also on vop2 base soc such as  rk356x and rk3588 .


>   	help
>   	  This selects support for Rockchip SoC specific extensions
>   	  for the Analogix Core DP driver. If you want to enable DP
> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
> index 1a56f696558ca..dfc5512fdb9f1 100644
> --- a/drivers/gpu/drm/rockchip/Makefile
> +++ b/drivers/gpu/drm/rockchip/Makefile
> @@ -4,8 +4,9 @@
>   # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>   
>   rockchipdrm-y := rockchip_drm_drv.o rockchip_drm_fb.o \
> -		rockchip_drm_gem.o rockchip_drm_vop.o rockchip_vop_reg.o
> +		rockchip_drm_gem.o
>   
> +rockchipdrm-$(CONFIG_ROCKCHIP_VOP) += rockchip_drm_vop.o rockchip_vop_reg.o
>   rockchipdrm-$(CONFIG_ROCKCHIP_ANALOGIX_DP) += analogix_dp-rockchip.o
>   rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) += cdn-dp-core.o cdn-dp-reg.o
>   rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) += dw_hdmi-rockchip.o
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 214214190fef1..7cf8b9665e5cf 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -494,7 +494,7 @@ static int __init rockchip_drm_init(void)
>   		return -ENODEV;
>   
>   	num_rockchip_sub_drivers = 0;
> -	ADD_ROCKCHIP_SUB_DRIVER(vop_platform_driver, CONFIG_DRM_ROCKCHIP);
> +	ADD_ROCKCHIP_SUB_DRIVER(vop_platform_driver, CONFIG_ROCKCHIP_VOP);
>   	ADD_ROCKCHIP_SUB_DRIVER(rockchip_lvds_driver,
>   				CONFIG_ROCKCHIP_LVDS);
>   	ADD_ROCKCHIP_SUB_DRIVER(rockchip_dp_driver,
