Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1219A090EA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 13:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A8410F0A5;
	Fri, 10 Jan 2025 12:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8908B10F0A3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:44:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E99D5C58CC;
 Fri, 10 Jan 2025 12:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226B8C4CED6;
 Fri, 10 Jan 2025 12:44:03 +0000 (UTC)
Message-ID: <adb707fd-1567-407a-a6a7-2ea93dea6ab2@xs4all.nl>
Date: Fri, 10 Jan 2025 13:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/i2c: move TDA drivers under
 drivers/gpu/drm/bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org>
 <20250110-drm-move-tda998x-v2-3-ef2ae5832d21@linaro.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250110-drm-move-tda998x-v2-3-ef2ae5832d21@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/01/2025 13:31, Dmitry Baryshkov wrote:
> TDA998x is the HDMI bridge driver, incorporating drm_connector and
> optional drm_encoder (created via the component bind API by the TICLDC
> and HDLCD drivers). Thus it should be residing together with the other
> DRM bridge drivers under drivers/gpu/drm/bridge/.
> 
> TDA9950 is an I2C-CEC translator, being present on-die on the TDA9989
> and TDA19989 chips, so it is being instantiated by the TDA998x driver.
> Move it together with the TDA998x under bridge drivers subdir.

This last paragraph is no longer correct since the tda9950 is now moved
to media cec.

Regards,

	Hans

> 
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  MAINTAINERS                                   |  2 +-
>  drivers/gpu/drm/arm/Kconfig                   |  1 +
>  drivers/gpu/drm/bridge/Kconfig                |  8 ++++++++
>  drivers/gpu/drm/bridge/Makefile               |  4 ++++
>  drivers/gpu/drm/{i2c => bridge}/tda998x_drv.c |  0
>  drivers/gpu/drm/i2c/Kconfig                   | 13 -------------
>  drivers/gpu/drm/i2c/Makefile                  |  3 ---
>  7 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 223eb6bfd0579768c246dcc51831048627fb8d02..7a15fb49c2905dcba7bc08f03abe12bd7f493f84 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17045,7 +17045,7 @@ M:	Russell King <linux@armlinux.org.uk>
>  S:	Maintained
>  T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
>  T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
> -F:	drivers/gpu/drm/i2c/tda998x_drv.c
> +F:	drivers/gpu/drm/bridge/tda998x_drv.c
>  F:	include/dt-bindings/display/tda998x.h
>  K:	"nxp,tda998x"
>  
> diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> index c901ac00c0c3a8f356bd53d97305c6b39b3e6662..ed3ed617c6884876368c8bd072c53f1b710df443 100644
> --- a/drivers/gpu/drm/arm/Kconfig
> +++ b/drivers/gpu/drm/arm/Kconfig
> @@ -9,6 +9,7 @@ config DRM_HDLCD
>  	select DRM_CLIENT_SELECTION
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
> +	select DRM_BRIDGE # for TDA998x
>  	help
>  	  Choose this option if you have an ARM High Definition Colour LCD
>  	  controller.
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 6b4664d91faa80f096ac6a0548ed342e802ae68b..d20f1646dac27898ecb7599a9a06663357dcca14 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -90,6 +90,14 @@ config DRM_FSL_LDB
>  	help
>  	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
>  
> +config DRM_I2C_NXP_TDA998X
> +       tristate "NXP Semiconductors TDA998X HDMI encoder"
> +       default m if DRM_TILCDC
> +       select CEC_CORE if CEC_NOTIFIER
> +       select SND_SOC_HDMI_CODEC if SND_SOC
> +       help
> +         Support for NXP Semiconductors TDA998X HDMI encoders.
> +
>  config DRM_ITE_IT6263
>  	tristate "ITE IT6263 LVDS/HDMI bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 97304b429a530c108dcbff906965cda091b0a7a2..245e8a27e3fc525ffe02103e4436c71313f55d9a 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -6,6 +6,10 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
>  obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
> +
> +tda998x-y := tda998x_drv.o
> +obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
> +
>  obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
>  obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
> similarity index 100%
> rename from drivers/gpu/drm/i2c/tda998x_drv.c
> rename to drivers/gpu/drm/bridge/tda998x_drv.c
> diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
> deleted file mode 100644
> index 1aa2a0bf5cc183b4ce92fc4f7eb61fd0065250d1..0000000000000000000000000000000000000000
> --- a/drivers/gpu/drm/i2c/Kconfig
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -menu "I2C encoder or helper chips"
> -     depends on DRM && DRM_KMS_HELPER && I2C
> -
> -config DRM_I2C_NXP_TDA998X
> -	tristate "NXP Semiconductors TDA998X HDMI encoder"
> -	default m if DRM_TILCDC
> -	select CEC_CORE if CEC_NOTIFIER
> -	select SND_SOC_HDMI_CODEC if SND_SOC
> -	help
> -	  Support for NXP Semiconductors TDA998X HDMI encoders.
> -
> -endmenu
> diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
> deleted file mode 100644
> index 45791fbfae983eecf58565109cf8eecb6431643b..0000000000000000000000000000000000000000
> --- a/drivers/gpu/drm/i2c/Makefile
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -tda998x-y := tda998x_drv.o
> -obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
> 

