Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837BF79703A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 08:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F2310E765;
	Thu,  7 Sep 2023 06:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C0F10E764
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 06:10:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-991c786369cso63012366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 23:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694067014; x=1694671814; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wTsVaP+71NqmdPRHOGwX5IHf8E9ep68PnA55/HuDkMQ=;
 b=EIPmZpZ+iTZnlaQR96fFogmxvNOp5NevfM2ej3863wMGdnWdGDtNEWfTcSlLQ/5gjc
 z7Z51Fu5QpsgIhklvU4+oWB08SGh0TN08Ewa/Iq+Ra9UgVkWz8gX2I6J10+KvvN2wmBv
 qySTZ4UN2s8YBtACPBBIQlSHKmNdV6+12QW8WxGmZAMHPSHgNSDOLBiuzLQJ9Qa+eW7x
 6MqY+6zN+4H6LPQBzM4LgKLszcxVNsM/YTVGkyxZaxiJbI7k0dBUNl5wnjUfcSWmvVUV
 c7Ctvu0L0O0vudD9Rljq2EO10aUwwTmwbN5XYsqK+fBYHjeLWH64RrRbl2BTOJTmdknZ
 f/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694067014; x=1694671814;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wTsVaP+71NqmdPRHOGwX5IHf8E9ep68PnA55/HuDkMQ=;
 b=IbDLriFykJ6vOonjIyC3tDjOme2Eh7Q+qGPNFmio9P3mUbb9oCxti2kYsLR5zodBnZ
 zEA82ZJg8n+SH1f8BaaQyM5c4SeEkula5YjPzbAC6sn9hwlmZDM6NbgnQqGxt5t+J1Lb
 WeMLQQfZ2xtVMui/rnsTxfUgrpiqCfr4zGa1U05tb5rKtB6uKDU74M5OsNy10/768phG
 C/UqA3XeFNcDP7uHq2MKouKMlUa8zw9k9PiJe9t/bXViGMHMrVMJ0oLCEKEpr4WOT9i1
 AQrMEI+PGW+q+nqRbTXKCupqux+La216M0zZenhbRWqZurRR9cCretApYX9pI8y0iCh2
 n5CA==
X-Gm-Message-State: AOJu0Yy+CuAk8aLzTZTI+tQlREh64nldY+i6RNKnCQcqkPsxWXs2zba0
 R8NGY7OMnFIfBOyM9dMTCNcK2w==
X-Google-Smtp-Source: AGHT+IFif2c/BpnquDlibCJoxZKaSjA9cO8862DBRQf4TERPnA+7sSqJ0EMKb0emx0l0ms0HIc+meg==
X-Received: by 2002:a17:906:535d:b0:9a2:120a:5777 with SMTP id
 j29-20020a170906535d00b009a2120a5777mr3753951ejo.70.1694067014365; 
 Wed, 06 Sep 2023 23:10:14 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238]) by smtp.gmail.com with ESMTPSA id
 rp24-20020a170906d97800b009a5c98fd82asm9841726ejb.81.2023.09.06.23.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 23:10:13 -0700 (PDT)
Message-ID: <45cd927d-da55-3460-0a26-62b30c33a3ad@linaro.org>
Date: Thu, 7 Sep 2023 08:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] drm: tiny: Add st7735s driver
Content-Language: en-US
To: Stefan x Nilsson <stefan.x.nilsson@axis.com>,
 David Lechner <david@lechnology.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230906-st7735s-v1-0-add92677c190@axis.com>
 <20230906-st7735s-v1-2-add92677c190@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230906-st7735s-v1-2-add92677c190@axis.com>
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
Cc: devicetree@vger.kernel.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2023 18:22, Stefan x Nilsson wrote:
> Add a driver for Sitronix st7735s display controller, as well as a
> Winstar wf0096atyaa3dnn0 0.96" 80x160 TFT panel.
> 
> The driver code is very similar to st7735r, but with adaptations for
> the pipe_enable function. There is also optional support to specify
> a power regulator for the display.
> 
> Signed-off-by: Stefan x Nilsson <stefan.x.nilsson@axis.com>
> ---
>  MAINTAINERS                    |   1 +
>  drivers/gpu/drm/tiny/Kconfig   |  14 +++
>  drivers/gpu/drm/tiny/Makefile  |   1 +
>  drivers/gpu/drm/tiny/st7735s.c | 264 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 280 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c00b2b9086f2..f24295d691e5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6733,6 +6733,7 @@ M:	Stefan x Nilsson <stefan.x.nilsson@axis.com>
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/sitronix,st7735s.yaml
> +F:	drivers/gpu/drm/tiny/st7735s.c
>  
>  DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
>  M:	Javier Martinez Canillas <javierm@redhat.com>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index f6889f649bc1..2917f5412ddd 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -212,3 +212,17 @@ config TINYDRM_ST7735R
>  	  * Okaya RH128128T 1.44" 128x128 TFT
>  
>  	  If M is selected the module will be called st7735r.
> +
> +config TINYDRM_ST7735S
> +	tristate "DRM support for Sitronix ST7735S display panels"
> +	depends on DRM && SPI
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_DMA_HELPER
> +	select DRM_MIPI_DBI
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +	  DRM driver for Sitronix ST7735S with one of the following
> +	  LCDs:
> +	  * Winstar WF0096ATYAA3DNN0 0.96" 80x160 Color TFT
> +
> +	  If M is selected the module will be called st7735s.
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 76dde89a044b..2e805c5b6f16 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
>  obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
>  obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
>  obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
> +obj-$(CONFIG_TINYDRM_ST7735S)		+= st7735s.o
> diff --git a/drivers/gpu/drm/tiny/st7735s.c b/drivers/gpu/drm/tiny/st7735s.c
> new file mode 100644
> index 000000000000..42290f4128db
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/st7735s.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DRM driver for display panels connected to a Sitronix ST7735S
> + * display controller in SPI mode.
> + *
> + * Copyright (C) 2023 Axis Communications AB
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/dma-buf.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/spi/spi.h>
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_mipi_dbi.h>
> +
> +#define ST7735S_FRMCTR1		0xb1
> +#define ST7735S_FRMCTR2		0xb2
> +#define ST7735S_FRMCTR3		0xb3
> +#define ST7735S_INVCTR		0xb4
> +#define ST7735S_PWCTR1		0xc0
> +#define ST7735S_PWCTR2		0xc1
> +#define ST7735S_PWCTR3		0xc2
> +#define ST7735S_PWCTR4		0xc3
> +#define ST7735S_PWCTR5		0xc4
> +#define ST7735S_VMCTR1		0xc5
> +#define ST7735S_GAMCTRP1	0xe0
> +#define ST7735S_GAMCTRN1	0xe1
> +
> +#define ST7735S_MY	BIT(7)
> +#define ST7735S_MX	BIT(6)
> +#define ST7735S_MV	BIT(5)
> +#define ST7735S_RGB	BIT(3)

So you just duplicated st7735r. No need for new driver. Integrate your
work. Probably also no need for new bindings file (although this I did
not check)...

Best regards,
Krzysztof

