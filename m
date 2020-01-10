Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3671373B0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 17:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A653B6EA59;
	Fri, 10 Jan 2020 16:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A025A6EA59
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 16:31:09 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j17so2101788edp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 08:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BcakXweHEcQflg8HJoYvX703zzGZOe1NoqnogCk40Mc=;
 b=fZ0leFzD7Og+dtCTgZ9Ecj4KV1bQx/7Eg5RkVMvaIu7GCoyAJzKzarRLGQeuv8LVMQ
 W26mJb/fawbyYUPtU12K8X07mA+M+fRTkOrzv8dGm+NQRgNp43UJTFYi1Rvpt8A1kqpx
 BBTOb+i1gEUXfP+xGEetdbsJhQCSi1NOsJ2YxLwReci31faxftEYLxnORAyGtwubnM7C
 JDxkJCE0uqefRcb8ZYLB8RlYqmdpuHwv9OwZhUbLx1aAZkAnnuzZZYd/vO6J3bBJrZvU
 GItOdaQ7a92rn7Hv4ZtY5eWuq52ljnYLZ0kxKsEQQVZ4Gi+4OvpNpPRYxfnJiaAHQDnw
 TDqg==
X-Gm-Message-State: APjAAAX/6ZS4UIWAv3uCC2HYd3AmGCkUlpeJyUGLtDjUmaFSzbhNsUWg
 IpFo+Tuy8Xgo/xbngP4Dg8Ed5SaTSrc=
X-Google-Smtp-Source: APXvYqwVWQxUJ1WjPyykbK0a2TLs75g4WSHzbEv1jvI3sGSqTR9SphqgDHWEYVX8VBVP0bEZw1/UHw==
X-Received: by 2002:a05:6402:a51:: with SMTP id
 bt17mr1709615edb.314.1578673867635; 
 Fri, 10 Jan 2020 08:31:07 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id md13sm53180ejb.85.2020.01.10.08.31.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2020 08:31:07 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id g17so2420545wro.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 08:31:07 -0800 (PST)
X-Received: by 2002:adf:ef4e:: with SMTP id c14mr4522664wrp.142.1578673866678; 
 Fri, 10 Jan 2020 08:31:06 -0800 (PST)
MIME-Version: 1.0
References: <20200110141140.28527-1-stefan@olimex.com>
 <20200110141140.28527-3-stefan@olimex.com>
In-Reply-To: <20200110141140.28527-3-stefan@olimex.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 11 Jan 2020 00:30:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v670FN7-dyjQuL+gyagupm5pr+z1ZWGG8E8YnYJA0aKPEA@mail.gmail.com>
Message-ID: <CAGb2v670FN7-dyjQuL+gyagupm5pr+z1ZWGG8E8YnYJA0aKPEA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 2/2] drm: sun4i: hdmi: Add support for sun4i
 HDMI encoder audio
To: Stefan Mavrodiev <stefan@olimex.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 open list <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 10, 2020 at 10:12 PM Stefan Mavrodiev <stefan@olimex.com> wrote:
>
> Add HDMI audio support for the sun4i-hdmi encoder, used on
> the older Allwinner chips - A10, A20, A31.
>
> Most of the code is based on the BSP implementation. In it
> dditional formats are supported (S20_3LE and S24_LE), however
> there where some problems with them and only S16_LE is left.
>
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> ---
>  drivers/gpu/drm/sun4i/Kconfig            |   1 +
>  drivers/gpu/drm/sun4i/Makefile           |   1 +
>  drivers/gpu/drm/sun4i/sun4i_hdmi.h       |  30 ++
>  drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c | 375 +++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c   |   4 +
>  5 files changed, 411 insertions(+)
>  create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c
>
> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> index 37e90e42943f..192b732b10cd 100644
> --- a/drivers/gpu/drm/sun4i/Kconfig
> +++ b/drivers/gpu/drm/sun4i/Kconfig
> @@ -19,6 +19,7 @@ if DRM_SUN4I
>  config DRM_SUN4I_HDMI
>         tristate "Allwinner A10 HDMI Controller Support"
>         default DRM_SUN4I
> +       select SND_PCM_ELD
>         help
>           Choose this option if you have an Allwinner SoC with an HDMI
>           controller.
> diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
> index 0d04f2447b01..e2d82b451c36 100644
> --- a/drivers/gpu/drm/sun4i/Makefile
> +++ b/drivers/gpu/drm/sun4i/Makefile
> @@ -5,6 +5,7 @@ sun4i-frontend-y                += sun4i_frontend.o
>  sun4i-drm-y                    += sun4i_drv.o
>  sun4i-drm-y                    += sun4i_framebuffer.o
>
> +sun4i-drm-hdmi-y               += sun4i_hdmi_audio.o
>  sun4i-drm-hdmi-y               += sun4i_hdmi_ddc_clk.o
>  sun4i-drm-hdmi-y               += sun4i_hdmi_enc.o
>  sun4i-drm-hdmi-y               += sun4i_hdmi_i2c.o
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> index 7ad3f06c127e..456964e681b0 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> @@ -42,7 +42,32 @@
>  #define SUN4I_HDMI_VID_TIMING_POL_VSYNC                BIT(1)
>  #define SUN4I_HDMI_VID_TIMING_POL_HSYNC                BIT(0)
>
> +#define SUN4I_HDMI_AUDIO_CTRL_REG      0x040
> +#define SUN4I_HDMI_AUDIO_CTRL_ENABLE           BIT(31)
> +#define SUN4I_HDMI_AUDIO_CTRL_RESET            BIT(30)
> +
> +#define SUN4I_HDMI_AUDIO_FMT_REG       0x048
> +#define SUN4I_HDMI_AUDIO_FMT_SRC               BIT(31)
> +#define SUN4I_HDMI_AUDIO_FMT_LAYOUT            BIT(3)
> +#define SUN4I_HDMI_AUDIO_FMT_CH_CFG(n)         (n - 1)
> +#define SUN4I_HDMI_AUDIO_FMT_CH_CFG_MASK       GENMASK(2, 0)
> +
> +#define SUN4I_HDMI_AUDIO_PCM_REG       0x4c
> +#define SUN4I_HDMI_AUDIO_PCM_CH_MAP(n, m)      ((m - 1) << (n * 4))
> +#define SUN4I_HDMI_AUDIO_PCM_CH_MAP_MASK(n)    (GENMASK(2, 0) << (n * 4))
> +
> +#define SUN4I_HDMI_AUDIO_CTS_REG       0x050
> +#define SUN4I_HDMI_AUDIO_CTS(n)                        (n & GENMASK(19, 0))
> +
> +#define SUN4I_HDMI_AUDIO_N_REG         0x054
> +#define SUN4I_HDMI_AUDIO_N(n)                  (n & GENMASK(19, 0))
> +
> +#define SUN4I_HDMI_AUDIO_STAT0_REG     0x58
> +#define SUN4I_HDMI_AUDIO_STAT0_FREQ(n)         (n << 24)
> +#define SUN4I_HDMI_AUDIO_STAT0_FREQ_MASK       GENMASK(27, 24)
> +
>  #define SUN4I_HDMI_AVI_INFOFRAME_REG(n)        (0x080 + (n))
> +#define SUN4I_HDMI_AUDIO_INFOFRAME_REG(n)      (0x0a0 + (n))
>
>  #define SUN4I_HDMI_PAD_CTRL0_REG       0x200
>  #define SUN4I_HDMI_PAD_CTRL0_BIASEN            BIT(31)
> @@ -283,9 +308,13 @@ struct sun4i_hdmi {
>         struct regmap_field     *field_ddc_sda_en;
>         struct regmap_field     *field_ddc_sck_en;
>
> +       u8                      hdmi_audio_channels;
> +
>         struct sun4i_drv        *drv;
>
>         bool                    hdmi_monitor;
> +       bool                    hdmi_audio;
> +
>         struct cec_adapter      *cec_adap;
>
>         const struct sun4i_hdmi_variant *variant;
> @@ -294,5 +323,6 @@ struct sun4i_hdmi {
>  int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *clk);
>  int sun4i_tmds_create(struct sun4i_hdmi *hdmi);
>  int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi);
> +int sun4i_hdmi_audio_create(struct sun4i_hdmi *hdmi);
>
>  #endif /* _SUN4I_HDMI_H_ */
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c
> new file mode 100644
> index 000000000000..b6d4199d15ce
> --- /dev/null
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c
> @@ -0,0 +1,375 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2020 Olimex Ltd.
> + *   Author: Stefan Mavrodiev <stefan@olimex.com>
> + */
> +#include <linux/dma-mapping.h>
> +#include <linux/dmaengine.h>
> +#include <linux/module.h>
> +#include <linux/of_dma.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/pcm_drm_eld.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>

I would drop the ASoC stuff and just do a standard ALSA driver.
You really don't gain anything from using ASoC, since this is
just a really standard PCM DMA interface plus some controls.
There aren't multiple components that need to be strung together.

ChenYu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
