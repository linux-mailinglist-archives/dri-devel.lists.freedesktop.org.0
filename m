Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478FFC30829
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AA110E5B2;
	Tue,  4 Nov 2025 10:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XkKRrdcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C31910E5B2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:29:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 658B61A1872;
 Tue,  4 Nov 2025 10:29:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 28285606EF;
 Tue,  4 Nov 2025 10:29:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63BB1102F1CE8; Tue,  4 Nov 2025 11:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762252177; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=krc5D24ubg7SL2yOQz6Oa0xHK/EueyHawLv56YJN53s=;
 b=XkKRrdcGz7pKxSy803LuVVP9Ul/JrkNSX2Esgiwhuy+eCHQP8UUTemUkQCzHc1b9sdFyY0
 ha3kLkgJrwa+INQ5gGICXA9VsJdGUPBwkZuKkGqe9p7lU4qo48HXH7uWW1fC9Bu5eu++VL
 IUzTACK93YJglkH/npJArGYrBMvz5IzcOQUyHvziXybXnY5xMHvx7v0lxY8ADdU/Le/iPM
 FCuy+fcy9ZyNBtm8gq2+SG3Aa45sr44YROzHug4LtIUERsXIOB2Cz50uXzaklj68wP7o/t
 r0t16DOOO8fHF5APgqjOvvwCO7/IaiY5t9GyWJFtSEFMSWhlfbBTImp4MFvSKQ==
Message-ID: <e649d441-0907-4a22-8a2d-c45648d7d840@bootlin.com>
Date: Tue, 4 Nov 2025 11:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/Kconfig: sort driver Kconfig source list
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1762251845.git.jani.nikula@intel.com>
 <4fa11ab0b938d5c726b6ad78d28c7527b830f696.1762251845.git.jani.nikula@intel.com>
Content-Language: en-US, fr
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <4fa11ab0b938d5c726b6ad78d28c7527b830f696.1762251845.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 04/11/2025 à 11:25, Jani Nikula a écrit :
> Sort the driver Kconfig source list, and remove the superfluous blank
> lines in between.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> 
> Tip: 'git show --color-moved' on the commit is the easiest way to
> review.
> ---
>   drivers/gpu/drm/Kconfig | 162 +++++++++++++---------------------------
>   1 file changed, 50 insertions(+), 112 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 5a9b5f7a40e2..a33b90251530 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -277,133 +277,71 @@ config DRM_PRIVACY_SCREEN
>   	bool
>   	default n
>   
> -source "drivers/gpu/drm/sysfb/Kconfig"
> -
> -source "drivers/gpu/drm/arm/Kconfig"
> -
> -source "drivers/gpu/drm/radeon/Kconfig"
> -
> +# DRM driver Kconfig files, sorted
> +source "drivers/gpu/drm/adp/Kconfig"
>   source "drivers/gpu/drm/amd/amdgpu/Kconfig"
> -
> -source "drivers/gpu/drm/nouveau/Kconfig"
> -
> -source "drivers/gpu/drm/nova/Kconfig"
> -
> -source "drivers/gpu/drm/i915/Kconfig"
> -
> -source "drivers/gpu/drm/xe/Kconfig"
> -
> -source "drivers/gpu/drm/kmb/Kconfig"
> -
> -source "drivers/gpu/drm/vgem/Kconfig"
> -
> -source "drivers/gpu/drm/vkms/Kconfig"
> -
> -source "drivers/gpu/drm/exynos/Kconfig"
> -
> -source "drivers/gpu/drm/rockchip/Kconfig"
> -
> -source "drivers/gpu/drm/vmwgfx/Kconfig"
> -
> -source "drivers/gpu/drm/gma500/Kconfig"
> -
> -source "drivers/gpu/drm/udl/Kconfig"
> -
> -source "drivers/gpu/drm/ast/Kconfig"
> -
> -source "drivers/gpu/drm/mgag200/Kconfig"
> -
> +source "drivers/gpu/drm/arm/Kconfig"
>   source "drivers/gpu/drm/armada/Kconfig"
> -
> +source "drivers/gpu/drm/aspeed/Kconfig"
> +source "drivers/gpu/drm/ast/Kconfig"
>   source "drivers/gpu/drm/atmel-hlcdc/Kconfig"
> -
> -source "drivers/gpu/drm/renesas/Kconfig"
> -
> -source "drivers/gpu/drm/sun4i/Kconfig"
> -
> -source "drivers/gpu/drm/omapdrm/Kconfig"
> -
> -source "drivers/gpu/drm/tilcdc/Kconfig"
> -
> -source "drivers/gpu/drm/qxl/Kconfig"
> -
> -source "drivers/gpu/drm/virtio/Kconfig"
> -
> -source "drivers/gpu/drm/msm/Kconfig"
> -
> -source "drivers/gpu/drm/fsl-dcu/Kconfig"
> -
> -source "drivers/gpu/drm/tegra/Kconfig"
> -
> -source "drivers/gpu/drm/stm/Kconfig"
> -
> -source "drivers/gpu/drm/panel/Kconfig"
> -
>   source "drivers/gpu/drm/bridge/Kconfig"
> -
> -source "drivers/gpu/drm/sti/Kconfig"
> -
> -source "drivers/gpu/drm/imx/Kconfig"
> -
> -source "drivers/gpu/drm/ingenic/Kconfig"
> -
> -source "drivers/gpu/drm/v3d/Kconfig"
> -
> -source "drivers/gpu/drm/vc4/Kconfig"
> -
> -source "drivers/gpu/drm/loongson/Kconfig"
> -
>   source "drivers/gpu/drm/etnaviv/Kconfig"
> -
> +source "drivers/gpu/drm/exynos/Kconfig"
> +source "drivers/gpu/drm/fsl-dcu/Kconfig"
> +source "drivers/gpu/drm/gma500/Kconfig"
> +source "drivers/gpu/drm/gud/Kconfig"
>   source "drivers/gpu/drm/hisilicon/Kconfig"
> -
> +source "drivers/gpu/drm/hyperv/Kconfig"
> +source "drivers/gpu/drm/i915/Kconfig"
> +source "drivers/gpu/drm/imagination/Kconfig"
> +source "drivers/gpu/drm/imx/Kconfig"
> +source "drivers/gpu/drm/ingenic/Kconfig"
> +source "drivers/gpu/drm/kmb/Kconfig"
> +source "drivers/gpu/drm/lima/Kconfig"
>   source "drivers/gpu/drm/logicvc/Kconfig"
> -
> +source "drivers/gpu/drm/loongson/Kconfig"
> +source "drivers/gpu/drm/mcde/Kconfig"
>   source "drivers/gpu/drm/mediatek/Kconfig"
> -
> -source "drivers/gpu/drm/mxsfb/Kconfig"
> -
>   source "drivers/gpu/drm/meson/Kconfig"
> -
> -source "drivers/gpu/drm/tiny/Kconfig"
> -
> -source "drivers/gpu/drm/pl111/Kconfig"
> -
> -source "drivers/gpu/drm/tve200/Kconfig"
> -
> -source "drivers/gpu/drm/xen/Kconfig"
> -
> -source "drivers/gpu/drm/vboxvideo/Kconfig"
> -
> -source "drivers/gpu/drm/lima/Kconfig"
> -
> +source "drivers/gpu/drm/mgag200/Kconfig"
> +source "drivers/gpu/drm/msm/Kconfig"
> +source "drivers/gpu/drm/mxsfb/Kconfig"
> +source "drivers/gpu/drm/nouveau/Kconfig"
> +source "drivers/gpu/drm/nova/Kconfig"
> +source "drivers/gpu/drm/omapdrm/Kconfig"
> +source "drivers/gpu/drm/panel/Kconfig"
>   source "drivers/gpu/drm/panfrost/Kconfig"
> -
>   source "drivers/gpu/drm/panthor/Kconfig"
> -
> -source "drivers/gpu/drm/aspeed/Kconfig"
> -
> -source "drivers/gpu/drm/mcde/Kconfig"
> -
> -source "drivers/gpu/drm/tidss/Kconfig"
> -
> -source "drivers/gpu/drm/adp/Kconfig"
> -
> -source "drivers/gpu/drm/xlnx/Kconfig"
> -
> -source "drivers/gpu/drm/gud/Kconfig"
> -
> +source "drivers/gpu/drm/pl111/Kconfig"
> +source "drivers/gpu/drm/qxl/Kconfig"
> +source "drivers/gpu/drm/radeon/Kconfig"
> +source "drivers/gpu/drm/renesas/Kconfig"
> +source "drivers/gpu/drm/rockchip/Kconfig"
>   source "drivers/gpu/drm/sitronix/Kconfig"
> -
>   source "drivers/gpu/drm/solomon/Kconfig"
> -
>   source "drivers/gpu/drm/sprd/Kconfig"
> -
> -source "drivers/gpu/drm/imagination/Kconfig"
> -
> +source "drivers/gpu/drm/sti/Kconfig"
> +source "drivers/gpu/drm/stm/Kconfig"
> +source "drivers/gpu/drm/sun4i/Kconfig"
> +source "drivers/gpu/drm/sysfb/Kconfig"
> +source "drivers/gpu/drm/tegra/Kconfig"
> +source "drivers/gpu/drm/tidss/Kconfig"
> +source "drivers/gpu/drm/tilcdc/Kconfig"
> +source "drivers/gpu/drm/tiny/Kconfig"
> +source "drivers/gpu/drm/tve200/Kconfig"
>   source "drivers/gpu/drm/tyr/Kconfig"
> -
> -source "drivers/gpu/drm/hyperv/Kconfig"
> +source "drivers/gpu/drm/udl/Kconfig"
> +source "drivers/gpu/drm/v3d/Kconfig"
> +source "drivers/gpu/drm/vboxvideo/Kconfig"
> +source "drivers/gpu/drm/vc4/Kconfig"
> +source "drivers/gpu/drm/vgem/Kconfig"
> +source "drivers/gpu/drm/virtio/Kconfig"
> +source "drivers/gpu/drm/vkms/Kconfig"
> +source "drivers/gpu/drm/vmwgfx/Kconfig"
> +source "drivers/gpu/drm/xe/Kconfig"
> +source "drivers/gpu/drm/xen/Kconfig"
> +source "drivers/gpu/drm/xlnx/Kconfig"
>   
>   endif
>   

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

