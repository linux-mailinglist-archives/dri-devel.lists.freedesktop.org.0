Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECCA8CB12E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 17:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC8610EF9D;
	Tue, 21 May 2024 15:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l/Eq9JS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC0E10ED6A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 15:25:07 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-520f9d559f6so6738907e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716305106; x=1716909906; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rOC2cvHHsCfE/XZDQOspaP8vFm7DFyYrnaEnVeU9qAQ=;
 b=l/Eq9JS64iVWslpJqfWnVFMBYyVNfYpIRVwqbO2ouzdbDOj99Qd91Z0WwNZE7Uiu2g
 WrrJpeklfcuaxFXgP/IJhPkxz6KgQyKjSUQlAiFtTv6ajRhv1MXtcvzfH9Z6F2JuARE/
 PDksGaU4MMpt2nx9fFT7ekJj2yjoej5haCWUC9Vm0/fK2iR7KM64+9UD0piqaVXAYEGj
 /6oFge0XJadp3NXdcHO5kTNRmVl488zaNAWAUp9TWMaElwyu3Bx0Nl2bh9ZSqbWYp9iq
 OdTBfzYKp9b+g7YGIx+u8vkrno1xlvyVP7R66xOsTi4tQnJNHzRuLEsAnJr9NkCwmM5x
 8gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716305106; x=1716909906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOC2cvHHsCfE/XZDQOspaP8vFm7DFyYrnaEnVeU9qAQ=;
 b=ls5+Y2dRbC/n+WHM7mhrqDw1+J8fOyl2GiYq+P5Wzg5yE9pczOVeXnRNuH8rgNp1pE
 zDiaZFjOk0cs9ME3s/Jtl6oAlWVx4ff79x4TpasBFTnjOOp6p4KHwf78OMKEcRd6tM39
 0X0o2juqsKPNUY+2EFiGpAyEJoZCRu/CuJMtyQKLnhWluAHW1ZBCls61BmSSfMComAJY
 UeHzW2vMcoDnw+DW9zWPUkZ7Bw7yzKHVnHVmDh/dUv3E9UdxvXCYOFTouQuZs5lRCkdg
 XbTO1sQg2OJgJhRVyUobBR+HIMY4jy8ZxfcoaI8PMLxcamzFJp3jNYePE3zvjJAoj+X+
 XJ2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCULohquqEwctPz3lTJu+vd49lKXrHeXcD4tRen4mxwhDSfNAjcB6yJ+xdcqhzLDygW+C4ayPTUS5+6gGNUQg8BoD8V4k28ER1O2CZzCgg+r
X-Gm-Message-State: AOJu0YzA69qgCC0JCcFtU3m22FO5xIxWHuBt8uxspdUP1wjG38Qy4SZx
 5HiH5df0OKlCvUtqOifCakkyFBS/LyEcOlgBgasl/g8nh45qGHIOps0s7hRmY7k=
X-Google-Smtp-Source: AGHT+IEGx09qqQZGznwGLK2bUqHiwP3SooCwqZgFFp68n5i919CsAWusJO9RSDejXheh0g79t6XsdQ==
X-Received: by 2002:a05:6512:3b0c:b0:51d:4af6:bb86 with SMTP id
 2adb3069b0e04-5220f666ad9mr23745352e87.0.1716305105449; 
 Tue, 21 May 2024 08:25:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5238aba8438sm2540161e87.94.2024.05.21.08.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 08:25:04 -0700 (PDT)
Date: Tue, 21 May 2024 18:25:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: keith <keith.zhao@starfivetech.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de, jack.zhu@starfivetech.com, 
 shengyang.chen@starfivetech.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 10/10] drm/vs: add simple dsi encoder
Message-ID: <cej2d72e6bacbjabyjecoqhjlhz4sxx4bgn2w43rgl3cfyyuwt@jq5kq4egj2wo>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-11-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521105817.3301-11-keith.zhao@starfivetech.com>
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

On Tue, May 21, 2024 at 06:58:17PM +0800, keith wrote:
> add encoder to match cdns dsi driver
> 
> Signed-off-by: keith <keith.zhao@starfivetech.com>

Please fix your git configuration to include your full name into the
S-o-B and Author fields.

> ---
>  drivers/gpu/drm/verisilicon/Makefile        |   3 +-
>  drivers/gpu/drm/verisilicon/vs_drv.c        |   1 +
>  drivers/gpu/drm/verisilicon/vs_drv.h        |   1 +
>  drivers/gpu/drm/verisilicon/vs_simple_enc.c | 190 ++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_simple_enc.h |  25 +++
>  5 files changed, 219 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h
> 
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> index 2d02b4a3a567..c35ba9bd6f81 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -4,7 +4,8 @@ vs_drm-objs := vs_dc_hw.o \
>  		vs_modeset.o \
>  		vs_plane.o \
>  		vs_crtc.o \
> -		vs_drv.o
> +		vs_drv.o \
> +		vs_simple_enc.o
>  
>  vs_drm-$(CONFIG_DRM_INNO_STARFIVE_HDMI) += inno_hdmi-starfive.o
>  obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
> index 6f04102b05b3..2748d48f2c7e 100644
> --- a/drivers/gpu/drm/verisilicon/vs_drv.c
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
> @@ -612,6 +612,7 @@ static struct platform_driver *drm_sub_drivers[] = {
>  #ifdef CONFIG_DRM_INNO_STARFIVE_HDMI
>  	&starfive_hdmi_driver,
>  #endif
> +	&simple_encoder_driver,
>  };
>  
>  static struct component_match *vs_add_external_components(struct device *dev)
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
> index c3c08ed5f8ac..f3f0f170777d 100644
> --- a/drivers/gpu/drm/verisilicon/vs_drv.h
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.h
> @@ -17,6 +17,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "vs_dc_hw.h"
> +#include "vs_simple_enc.h"
>  
>  /*@pitch_alignment: buffer pitch alignment required by sub-devices.*/
>  struct vs_drm_device {
> diff --git a/drivers/gpu/drm/verisilicon/vs_simple_enc.c b/drivers/gpu/drm/verisilicon/vs_simple_enc.c
> new file mode 100644
> index 000000000000..d0b1755d77d2
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_simple_enc.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.

Now it is 2024, so the copyright should probably cover the range.

> + */
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_of.h>
> +
> +#include "vs_crtc.h"
> +#include "vs_simple_enc.h"
> +
> +static const struct simple_encoder_priv dsi_priv = {
> +	.encoder_type = DRM_MODE_ENCODER_DSI

So, is it 'simple' aka something generic or DSI? In the latter case,
please rename it accordingly.

> +};
> +
> +static inline struct vs_simple_encoder *to_simple_encoder(struct drm_encoder *enc)
> +{
> +	return container_of(enc, struct vs_simple_encoder, encoder);
> +}
> +
> +static int encoder_parse_dt(struct device *dev)
> +{
> +	struct vs_simple_encoder *simple = dev_get_drvdata(dev);
> +	unsigned int args[2];
> +
> +	simple->dss_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
> +								  "starfive,syscon",
> +								  2, args);
> +
> +	if (IS_ERR(simple->dss_regmap)) {
> +		return dev_err_probe(dev, PTR_ERR(simple->dss_regmap),
> +				     "getting the regmap failed\n");
> +	}
> +
> +	simple->offset = args[0];
> +	simple->mask = args[1];

Is the value that you've read platform dependent or use case dependent?
What is the actual value being written? Why are you using syscon for it?

> +
> +	return 0;
> +}
> +
> +static void vs_encoder_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
> +{
> +	struct vs_simple_encoder *simple = to_simple_encoder(encoder);
> +
> +	regmap_update_bits(simple->dss_regmap, simple->offset, simple->mask, simple->mask);


A purist in me would ask to have separate mask and value to write.

> +}

Is it necessary to clear those bits when stopping the stream?


[skipped the rest]

> +
> +
> +struct platform_driver simple_encoder_driver = {
> +	.probe = vs_encoder_probe,
> +	.remove = vs_encoder_remove,
> +	.driver = {
> +		.name = "vs-simple-encoder",
> +		.of_match_table = of_match_ptr(simple_encoder_dt_match),
> +	},
> +};
> +
> +MODULE_DESCRIPTION("Simple Encoder Driver");

VeriSilicon DSI Encoder

> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/verisilicon/vs_simple_enc.h b/drivers/gpu/drm/verisilicon/vs_simple_enc.h
> new file mode 100644
> index 000000000000..73e356bfeb2c
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_simple_enc.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_SIMPLE_ENC_H_
> +#define __VS_SIMPLE_ENC_H_
> +
> +#include <drm/drm_encoder.h>
> +
> +struct simple_encoder_priv {
> +	unsigned char encoder_type;
> +};
> +
> +struct vs_simple_encoder {
> +	struct drm_encoder encoder;
> +	struct device *dev;
> +	const struct simple_encoder_priv *priv;
> +	struct regmap *dss_regmap;
> +	unsigned int offset;
> +	unsigned int mask;
> +};

Is there a need for aheader for the encoder? Can you move the
definitions to the source file?

> +
> +extern struct platform_driver simple_encoder_driver;
> +#endif /* __VS_SIMPLE_ENC_H_ */
> -- 
> 2.27.0
> 

-- 
With best wishes
Dmitry
