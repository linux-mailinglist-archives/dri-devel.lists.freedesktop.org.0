Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF866D1C2D2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 03:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D7510E14C;
	Wed, 14 Jan 2026 02:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="j9QIudcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49235.qiye.163.com (mail-m49235.qiye.163.com
 [45.254.49.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC1010E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:58:11 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 308f250c9;
 Wed, 14 Jan 2026 10:58:07 +0800 (GMT+08:00)
Message-ID: <2d77eac3-c213-42d5-bf47-4e81b30f9f38@rock-chips.com>
Date: Wed, 14 Jan 2026 10:58:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: DRM_ROCKCHIP should depend on ARCH_ROCKCHIP
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <5db192d31cc51f027f107c01c01a353a0569ebf4.1768310045.git.geert+renesas@glider.be>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <5db192d31cc51f027f107c01c01a353a0569ebf4.1768310045.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bba70697d03abkunmb3f2a1de1f8330
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkNOTFYaS0tCT0xJSkNMSBhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=j9QIudcYTQdvAa4MQgAhI4Fa8GsWXodzhvPhl5TmPHpdmhS0nTyCktPg0RIFRrgmZLLwRm/qqFGxNIFJfR8xsPugPJWrTrV2cA4CdA4+4le2+yxPG9jw1gMy1QgdTWuEIZsV8nlYaKcQoWgaYV3ADLUZV6io90Fwf5+U69oMxa0=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=BExGeWQxtEVNv6OQM+naThqTHzsblmqsaTZLZYeFiYk=;
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

On 1/13/2026 9:15 PM, Geert Uytterhoeven wrote:
> Rockchip display hardware is only available on Rockchip SoCs.  Hence add
> a dependency on ARCH_ROCKCHIP, to prevent asking the user about this
> driver when configuring a kernel without Rockchip platform support.
> 
> Before, this dependency was implicit through a hard dependency on
> ROCKCHIP_IOMMU.
> 
> Fixes: 0244539f9a4f3b56 ("drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index 025bd770f499e6ed..1479b8c4ed40ad16 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -2,6 +2,7 @@
>  config DRM_ROCKCHIP
>  	tristate "DRM Support for Rockchip"
>  	depends on DRM
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
>  	depends on ROCKCHIP_IOMMU || !ROCKCHIP_IOMMU
>  	depends on OF
>  	select DRM_CLIENT_SELECTION

Thank you for the fix.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi
