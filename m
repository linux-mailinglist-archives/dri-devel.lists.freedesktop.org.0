Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC83C4EFDCC
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 03:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD4E10E095;
	Sat,  2 Apr 2022 01:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADEC10E095
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 01:37:19 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id DB99998029A;
 Sat,  2 Apr 2022 09:37:17 +0800 (CST)
Message-ID: <1c0fbf4f-2e17-29f9-5c69-c80b53ff3d2f@rock-chips.com>
Date: Sat, 2 Apr 2022 09:37:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220401125205.GL4012@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRodS0JWTBpMH08dHx
 hMTUpMVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MhA6HAw5Pj5WQgNOHU8QOAtW
 ExkKFDxVSlVKTU9DQ01IT0hDT0pLVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0tOTDcG
X-HM-Tid: 0a7fe7eb6580d992kuwsdb99998029a
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sacha:

On 4/1/22 20:52, Sascha Hauer wrote:
> -- 
> >From cbc03073623a7180243331ac24c3afaf9dec7522 Mon Sep 17 00:00:00 2001
> From: Sascha Hauer<s.hauer@pengutronix.de>
> Date: Fri, 1 Apr 2022 14:48:49 +0200
> Subject: [PATCH] fixup! drm: rockchip: Add VOP2 driver
>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 7dba7b9b63dc6..1421bf2f133f1 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2287,6 +2287,20 @@ static int vop2_create_crtc(struct vop2 *vop2)
>   			}
>   		}
>   
> +		if (vop2->data->soc_id == 3566) {
> +			/*
> +			 * On RK3566 these windows don't have an independent
> +			 * framebuffer. They share the framebuffer with smart0,
> +			 * esmart0 and cluster0 respectively.
> +			 */
> +			switch (win->data->phys_id) {
> +			case ROCKCHIP_VOP2_SMART1:
> +			case ROCKCHIP_VOP2_ESMART1:
> +			case ROCKCHIP_VOP2_CLUSTER1:
> +				continue;
> +			}


Think about this , there maybe other upcoming vop2 base soc, they may 
only have

mirror window Smart1 Esmart1, or Smart1, Esmart1, Esmart2, Cluster1.

I think this should add WIN_FEATURE at the platform description file 
rockchip_vop2_reg.c, then

check the FEATURE to decide whether the driver should give this window a 
special treatment.

this can make one code run for different soc with different platform 
description. or we should add

the same code logic for different soc again and again.

> +		}
> +
>   		if (win->type == DRM_PLANE_TYPE_OVERLAY)
>   			possible_crtcs = (1 << nvps) - 1;
>   
