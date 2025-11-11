Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DCAC4D4C2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 12:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A13010E554;
	Tue, 11 Nov 2025 11:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlPAFqnu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jad0VAGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1631810E552
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 11:07:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AB4so7n1327083
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 11:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0GL6AX4f5B9v3LxUu9tCxDTR
 Pg4Nz4OvpM8/ZiJ/lrY=; b=UlPAFqnulsjL+DwWS1zu3xe0s9DCw1MO29glbnsn
 yD0AegAg+J/6OTRR/XiC3QLJXrF0JcGTHmsS7rbg/nXCYp8Kdw2RsCvDdIWPIMjH
 XkuLaKnT/puCnnQghjV0rogyGH7Up6ifp9033bCvleniOn/ida+HKGc8bGENNMQj
 2JlEJT1xvdHTdL1Il+jhiQiWxha8iZJgLep4ziQ89zDuA1DO+2HsAMJfrmsaeE+h
 /VyWsCA2b8RPkzpru6yHsTvP9hJ3/oSeoO5DtkrAOgimkIi9uqwQFkE3pDQgfYgX
 /z/zmmPtlYcDLmT9gvu0txkPzM83Ty1WpMQN5vRaPrYUqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhh2d3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 11:07:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8b33c1d8eso115231201cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 03:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762859252; x=1763464052;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0GL6AX4f5B9v3LxUu9tCxDTRPg4Nz4OvpM8/ZiJ/lrY=;
 b=jad0VAGMJDP2omNiHv/LdEsMZI2NB6V/Ww1sFXzkDKURUraDCs8UIRtYXiWzL3nR5l
 Sly0/DQCpqwKMfuiWeMC5+K6LZnJ63itFvWtb80mDfITqvKUkH3t7YKJkCSccrE0KmzR
 zECn0RdmriS/CCw6oPfolmTCi7Fd34fTYMlyRaqqSGo+I/EcUt2PXYu451LsgKoTmKcw
 wK+w9wiF0A/hH0QVTKPmnoSBkxZl3q34IGO1wi3XmXXVEGzf1MHmDI1Vdj8VKjrYvjIX
 SP7l4Zhw9ikURx7nXI7hCTBWyZn895QSkztiU/vUmOtU2UTz8tFrKi2fpfyVT9oWHmgi
 dQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762859252; x=1763464052;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0GL6AX4f5B9v3LxUu9tCxDTRPg4Nz4OvpM8/ZiJ/lrY=;
 b=bdzgnAsKZy0d87HFGD+mR+gmGB5iiHAPN52rAVml8IFrTnB8w418A0hSejMiDTRJ6J
 o4fOsO+ZJRmat5662d5bYWtw6SKOpj9scmwe2V1golPEKmDj6lr1quMLgXXLgDlI83Se
 /o5ZtQRQTh1HtMal6qgsdC1UWIeu1Uyeb7+orOO8qQmBnBizORhRs1iEkSqn579G+8j2
 RIf2DAW064aVlE3aMMb1HmX/+X/Q1TMAaEy3KE/Qy4FRVUn51UHGKW3CgeZos2JhG8Zr
 d1rMXjTwR9X3sW8ffU91ZL3vTSnP5TbGtJr5r86WgEBz3LksqtDJd1Zsl38Haqpr4c5E
 cRNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOPXcnEHYUF33WumytmY18NKigrzxfInM+LQR/G89XQLKCF9U4IzSr44BWQ8FTJDCGgeALmFlFZJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAh5UKvbDCpxySelwG1Cay89OJHPXPPP1acymJR+ycsB0KgzyV
 wvIV7GDc1PhzsSeM11PjhoDTAd1xaMPmz7uaVOl3Mu9Vvbq5N2Jl2l9e3PE9/6TYFJ4boRQPHK1
 WHybw7P8tNgLOpN6JTxfy/FSXiQ8tmWoim+vsuiKQYqYteU8//UOmcufTR0AgAKhz6aJNALE=
X-Gm-Gg: ASbGnctlgotiZCdy5jCQKko1yT1aDh3+G+g0AuPoPzHAlN2AiWdyN+Z8qP+YtTi6kgh
 UCPa2bhWeTAQo3UmAMSdRMFJeb19nXmXHY3M4i+qoCNOy9Iyw1rAD4Lt9jGCbqBVHNOF2P1p2Iw
 ubeL1G6A5D2oAsXoqtlqh+izdd5jIDIRN42fzFu0MmU5ghxRh1oC70EK7DtlnHTe1GyBi/A+aP7
 3ANVWu10NJu4PoR35irhyOtheAck1KMIrv3gTK8AT+H1bTKUtzGQW3NiC6i02oYSjAxzxNIWbkI
 Qa4I7jBLOYaDOzJHJk5YBgags+AnlbZOk9pCPsKORJotpCgVUR2ZfjU+hbMqGe5fDqfATBhG+LW
 QGJgrmykfMoAGcBj6N7eLuf9oHYfn3H9kKFj+HDWTTpLlEvwTQ8zmj9lXo3+mYwQEIOaU0B8YNn
 b2SY56T3yxyZuC
X-Received: by 2002:ac8:7d0a:0:b0:4b5:f7d4:39fa with SMTP id
 d75a77b69052e-4eda4e7ac76mr154971211cf.12.1762859252090; 
 Tue, 11 Nov 2025 03:07:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOyvBNAS3QLH6jY8Fp3DqOwKCqP04zJqQg9X/UOenGRTF/Rnu3xscXAQAT73TcBrpZ7gagDw==
X-Received: by 2002:ac8:7d0a:0:b0:4b5:f7d4:39fa with SMTP id
 d75a77b69052e-4eda4e7ac76mr154970351cf.12.1762859251305; 
 Tue, 11 Nov 2025 03:07:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37a5f0ee523sm41794201fa.42.2025.11.11.03.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 03:07:30 -0800 (PST)
Date: Tue, 11 Nov 2025 13:07:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm: panel: Add Waveshare MIPI-DSI panel driver
Message-ID: <tggz6tsbzsydhi7hmwpacqea7o2nzstm4ta3cye5nbse2dh32y@lxlqnyyfhmfc>
References: <20251111104309.3424018-1-tessolveupstream@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111104309.3424018-1-tessolveupstream@gmail.com>
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=691318f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=V4Th9uXqAAAA:8 a=LbDzrTjz2W1hcEXESF0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=NPz-sUGDo_RSEfLfxCKS:22
X-Proofpoint-ORIG-GUID: kMpHxyAyOgaRsSRsbV_KkzBcbENwh7Wx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NyBTYWx0ZWRfXz2i2za8yI/x6
 mFWCFGmmA/5TxeIgZGp+sC6ki5dsCDkciQOQEEIkgYd+Br/OaP3PUZrV8wa9Jk7m9gSCJhO1JPT
 rbOIbcW76nJhbo0OKS4TY5v3noi8ivGnaV0LM6EwL+u9n4kb+DZlv9cb3UJHTDZ+REM1zDENFIk
 b2Jscd1Cc2gkmiBXMZsJgwdKKT9DaUm69W4z5PAQEIdY2lKFWiD8u0tdtXe99ErwK+Y5NtJex7P
 FNtRmfk/YxciTdDOTcBeMzxvt/b7MosHwb8ScG4wqkZmzAUYU/aE3lGpNO9Q5ZMHXzFApRpfQc/
 qZt1fUHgBgO3IFbgxIpd8We1GsKh3f6RTTsZRU7i/6M8PPcU5A5B6ZIWkYrHD4zqBbpqGL5O9BA
 3ZVsEokUpz6ko/S4YohyvQVFoTP88A==
X-Proofpoint-GUID: kMpHxyAyOgaRsSRsbV_KkzBcbENwh7Wx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110087
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

On Tue, Nov 11, 2025 at 04:13:09PM +0530, Sudarshan Shetty wrote:
> This patch adds a DRM panel driver for Waveshare MIPI-DSI panels
> of various sizes (5.0", 5.5", 7.0", 8.0", and 10.1") with integrated
> touch functionality.
> 
> The driver provides:
>  - Initialization and reset sequencing
>  - MIPI-DSI command transfer for panel setup
>  - Backlight integration through the backlight class device
>  - Support for multiple panel variants via compatible strings
> 
> These panels are commonly used with Waveshare development kits
> and require proper power sequencing and regulator support.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/gpu/drm/panel/Kconfig                 |   11 +
>  drivers/gpu/drm/panel/Makefile                |    1 +
>  .../gpu/drm/panel/panel-waveshare-dsi-v2.c    | 2687 +++++++++++++++++


This was sent to the internal ML, got negative feedback and still
reached the public ML. May I ask, WHY?


Anyway, you missed the bindings for the driver.

>  4 files changed, 2700 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index a1e564024be2..178c8699f86c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1823,4 +1823,5 @@ CONFIG_CORESIGHT_STM=m
>  CONFIG_CORESIGHT_CPU_DEBUG=m
>  CONFIG_CORESIGHT_CTI=m
>  CONFIG_MEMTEST=y
> +CONFIG_DRM_PANEL_WAVESHARE_TOUCHSCREEN_V2=y
>  CONFIG_REGULATOR_WAVESHARE_TOUCHSCREEN=y

Separate commit, the entry is out of place there is no reason to build
the driver into the kernel, etc.

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 407c5f6a268b..b771817af8f8 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -1137,6 +1137,17 @@ config DRM_PANEL_VISIONOX_VTDR6130
>  	  Say Y here if you want to enable support for Visionox
>  	  VTDR6130 1080x2400 AMOLED DSI panel.
>  
> +config DRM_PANEL_WAVESHARE_TOUCHSCREEN_V2
> +	tristate "Waveshare touchscreen panels V2"
> +	depends on DRM_MIPI_DSI
> +	depends on I2C
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Enable support for Waveshare DSI touchscreen panels,
> +	  Say Y here if you want to enable support for the Waveshare
> +	  DSI Touchscreens.  To compile this driver as a module,
> +	  choose M here.
> +
>  config DRM_PANEL_WIDECHIPS_WS2401
>  	tristate "Widechips WS2401 DPI panel driver"
>  	depends on SPI && GPIOLIB
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 3615a761b44f..3947e28addde 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -114,5 +114,6 @@ obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>  obj-$(CONFIG_DRM_PANEL_VISIONOX_RM692E5) += panel-visionox-rm692e5.o
>  obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
>  obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
> +obj-$(CONFIG_DRM_PANEL_WAVESHARE_TOUCHSCREEN_V2) += panel-waveshare-dsi-v2.o
>  obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
>  obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> diff --git a/drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c b/drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c
> new file mode 100644
> index 000000000000..7af11fdc026f
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c
> @@ -0,0 +1,2687 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Waveshare International Limited
> + *
> + * Based on panel-raspberrypi-touchscreen by Broadcom
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct ws_panel_desc {
> +	int (*init)(struct mipi_dsi_device *dsi);
> +	const struct drm_display_mode *mode;
> +	const unsigned long mode_flags;
> +	unsigned int lanes;
> +	enum mipi_dsi_pixel_format format;
> +};
> +
> +struct ws_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	const struct ws_panel_desc *desc;
> +
> +	struct regulator *power;
> +	struct gpio_desc *reset;
> +	struct gpio_desc *iovcc;
> +	struct gpio_desc *avdd;

Don't use GPIOs for regulators. Use proper regulator framework devices.

> +
> +	enum drm_panel_orientation orientation;
> +};
> +
> +enum dsi_cmd_type {
> +	INIT_DCS_CMD,
> +	DELAY_CMD,
> +};

Unused

> +
> +struct panel_init_cmd {
> +	enum dsi_cmd_type type;
> +	size_t len;
> +	const char *data;
> +};

Unused

> +
> +static int ws_panel_12_3_a_4lane_init(struct mipi_dsi_device *dsi)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0x83, 0x10, 0x2E);

- Please don't group panels by vendor. Panel drivers are grouped by the
  controlling IC. In this driver you've tried to stuff together several
  panels with different controllers. Instead add these to the drivers
  with the corresponding controllers. Feel free to rework existing
  drivers in order to be able to do it.

- Also, lowercase the hex.

> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);

exit_sleep_mode

> +	msleep(120);

Use a proper wrapper

> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);

set_display_on

> +	msleep(20);
> +
> +	return 0;

Return error code.

> +};
> +
> +static int ws_panel_10_1_a_4lane_init(struct mipi_dsi_device *dsi)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE0, 0x00);

As you can see, it's a completely different init sequence.

> +
> +static int ws_panel_prepare(struct drm_panel *panel)
> +{
> +	struct ws_panel *ctx = panel_to_ws(panel);
> +	int ret;
> +
> +	if (ctx->iovcc) {
> +		gpiod_set_value_cansleep(ctx->iovcc, 1);
> +		msleep(20);
> +	}
> +
> +	if (ctx->avdd) {
> +		gpiod_set_value_cansleep(ctx->avdd, 1);
> +		msleep(20);
> +	}

Yuck

> +
> +	if (ctx->reset) {
> +		gpiod_set_value_cansleep(ctx->reset, 0);
> +		msleep(60);
> +		gpiod_set_value_cansleep(ctx->reset, 1);
> +		msleep(60);
> +	}
> +
> +	ret = ctx->desc->init(ctx->dsi);
> +	if (ret < 0)
> +		dev_err(panel->dev, "failed to init panel: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static int ws_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct ws_panel *ctx = panel_to_ws(panel);
> +
> +	mipi_dsi_dcs_set_display_off(ctx->dsi);
> +	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
> +
> +	if (ctx->reset) {
> +		gpiod_set_value_cansleep(ctx->reset, 0);
> +		msleep(5);
> +	}
> +
> +	if (ctx->avdd) {
> +		gpiod_set_value_cansleep(ctx->avdd, 0);
> +		msleep(5);
> +	}
> +
> +	if (ctx->iovcc) {
> +		gpiod_set_value_cansleep(ctx->iovcc, 0);
> +		msleep(5);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode ws_panel_12_3_a_4lane_mode = {
> +	.clock = 95000,

My preference is to define mode.clock clearly as (720 + 10 + 10 + 12)
* (1920 + 64 + 18 + 4) * 63 / 1000 (why 63 though?)

> +	.hdisplay = 720,
> +	.hsync_start = 720 + 10,
> +	.hsync_end = 720 + 10 + 10,
> +	.htotal = 720 + 10 + 10 + 12,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 64,
> +	.vsync_end = 1920 + 64 + 18,
> +	.vtotal = 1920 + 64 + 18 + 4,
> +	.width_mm = 109,
> +	.height_mm = 292,
> +};
> +
> +static const struct drm_display_mode ws_panel_10_1_a_mode = {
> +	.clock = 70000,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 40,
> +	.hsync_end = 800 + 40 + 20,
> +	.htotal = 800 + 40 + 20 + 20,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 20,
> +	.vsync_end = 1280 + 20 + 20,
> +	.vtotal = 1280 + 20 + 20 + 4,
> +	.width_mm = 135,
> +	.height_mm = 216,
> +};
> +
> +static const struct drm_display_mode ws_panel_10_1_b_4lane_mode = {
> +	.clock = 66000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 60,
> +	.hsync_end = 720 + 60 + 60,
> +	.htotal = 720 + 60 + 60 + 4,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 16,
> +	.vsync_end = 1280 + 16 + 12,
> +	.vtotal = 1280 + 16 + 12 + 4,
> +	.width_mm = 125,
> +	.height_mm = 222,
> +};
> +
> +static const struct drm_display_mode ws_panel_10_1_b_mode = {
> +	.clock = 69000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 50,
> +	.hsync_end = 720 + 50 + 50,
> +	.htotal = 720 + 50 + 50 + 50,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 26,
> +	.vsync_end = 1280 + 26 + 12,
> +	.vtotal = 1280 + 26 + 12 + 4,
> +	.width_mm = 125,
> +	.height_mm = 222,
> +};
> +
> +static const struct drm_display_mode ws_panel_9_b_4lane_mode = {
> +	.clock = 66000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 60,
> +	.hsync_end = 720 + 60 + 60,
> +	.htotal = 720 + 60 + 60 + 4,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 16,
> +	.vsync_end = 1280 + 16 + 12,
> +	.vtotal = 1280 + 16 + 12 + 4,
> +	.width_mm = 114,
> +	.height_mm = 196,
> +};
> +
> +static const struct drm_display_mode ws_panel_9_b_mode = {
> +	.clock = 69000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 50,
> +	.hsync_end = 720 + 50 + 50,
> +	.htotal = 720 + 50 + 50 + 50,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 26,
> +	.vsync_end = 1280 + 26 + 12,
> +	.vtotal = 1280 + 26 + 12 + 4,
> +	.width_mm = 114,
> +	.height_mm = 196,
> +};
> +
> +static const struct drm_display_mode ws_panel_8_8_a_mode = {
> +	.clock = 75000,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 50,
> +	.hsync_end = 480 + 50 + 50,
> +	.htotal = 480 + 50 + 50 + 50,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 20,
> +	.vsync_end = 1920 + 20 + 20,
> +	.vtotal = 1920 + 20 + 20 + 20,
> +	.width_mm = 68,
> +	.height_mm = 219,
> +};
> +
> +static const struct drm_display_mode ws_panel_8_a_mode = {
> +	.clock = 70000,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 40,
> +	.hsync_end = 800 + 40 + 20,
> +	.htotal = 800 + 40 + 20 + 20,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 30,
> +	.vsync_end = 1280 + 30 + 12,
> +	.vtotal = 1280 + 30 + 12 + 4,
> +	.width_mm = 107,
> +	.height_mm = 172,
> +};
> +
> +static const struct drm_display_mode ws_panel_7_a_mode = {
> +	.clock = 83333,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 120,
> +	.hsync_end = 720 + 120 + 100,
> +	.htotal = 720 + 120 + 100 + 100,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 10,
> +	.vsync_end = 1280 + 10 + 10,
> +	.vtotal = 1280 + 10 + 10 + 10,
> +	.width_mm = 85,
> +	.height_mm = 154,
> +};
> +
> +static const struct drm_display_mode ws_panel_5_5_a_mode = {
> +	.clock = 65000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 50,
> +	.hsync_end = 720 + 50 + 50,
> +	.htotal = 720 + 50 + 50 + 10,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 15,
> +	.vsync_end = 1280 + 15 + 12,
> +	.vtotal = 1280 + 15 + 12 + 4,
> +	.width_mm = 62,
> +	.height_mm = 110,
> +};
> +
> +static const struct drm_display_mode ws_panel_5_a_mode = {
> +	.clock = 70000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 40,
> +	.hsync_end = 720 + 40 + 20,
> +	.htotal = 720 + 40 + 20 + 20,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 30,
> +	.vsync_end = 1280 + 30 + 10,
> +	.vtotal = 1280 + 30 + 10 + 4,
> +	.width_mm = 62,
> +	.height_mm = 110,
> +};
> +
> +static const struct drm_display_mode ws_panel_4_c_mode = {
> +	.clock       = 36500,
> +	.hdisplay    = 720,
> +	.hsync_start = 720 + 40,
> +	.hsync_end   = 720 + 40 + 20,
> +	.htotal      = 720 + 40 + 20 + 20,
> +	.vdisplay    = 720,
> +	.vsync_start = 720 + 24,
> +	.vsync_end   = 720 + 24 + 4,
> +	.vtotal      = 720 + 24 + 4 + 12,
> +	.width_mm	 = 88,
> +	.height_mm	 = 88,
> +};
> +
> +static const struct drm_display_mode ws_panel_3_4_c_mode = {
> +	.clock       = 44300,
> +	.hdisplay    = 800,
> +	.hsync_start = 800 + 40,
> +	.hsync_end   = 800 + 40 + 20,
> +	.htotal      = 800 + 40 + 20 + 20,
> +	.vdisplay    = 800,
> +	.vsync_start = 800 + 24,
> +	.vsync_end   = 800 + 24 + 4,
> +	.vtotal      = 800 + 24 + 4 + 12,
> +	.width_mm	 = 88,
> +	.height_mm	 = 88,
> +};
> +
> +static int ws_panel_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct ws_panel *ctx = panel_to_ws(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
> +	if (!mode) {
> +		dev_err(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
> +			ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
> +			drm_mode_vrefresh(ctx->desc->mode));
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;

drm_connector_helper_get_modes_fixed()

> +
> +	drm_connector_set_panel_orientation(connector, ctx->orientation);
> +
> +	return 1;
> +}
> +
> +static enum drm_panel_orientation
> +ws_panel_get_orientation(struct drm_panel *panel)
> +{
> +	struct ws_panel *ctx = panel_to_ws(panel);
> +
> +	return ctx->orientation;
> +}
> +
> +static const struct drm_panel_funcs ws_panel_funcs = {
> +	.prepare = ws_panel_prepare,
> +	.unprepare = ws_panel_unprepare,
> +	.get_modes = ws_panel_get_modes,
> +	.get_orientation = ws_panel_get_orientation,
> +};
> +
> +static int ws_panel_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct ws_panel *ctx;
> +	int ret;
> +
> +	dev_info(&dsi->dev, "dsi panel: %s\n",
> +		 (char *)of_get_property(
> +			 dsi->dev.of_node, "compatible", NULL));
> +
> +	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +	ctx->dsi = dsi;
> +	ctx->desc = of_device_get_match_data(&dsi->dev);
> +
> +	ctx->panel.prepare_prev_first = true;
> +	drm_panel_init(&ctx->panel, &dsi->dev, &ws_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ctx->reset = devm_gpiod_get_optional(
> +			&dsi->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
> +				     "Couldn't get our reset GPIO\n");
> +
> +	ctx->iovcc = devm_gpiod_get_optional(
> +			&dsi->dev, "iovcc", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->iovcc))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->iovcc),
> +					"Couldn't get our iovcc GPIO\n");
> +
> +	ctx->avdd = devm_gpiod_get_optional(&dsi->dev, "avdd", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->avdd))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->avdd),
> +					"Couldn't get our avdd GPIO\n");
> +
> +	ret = of_drm_get_panel_orientation(
> +			dsi->dev.of_node, &ctx->orientation);
> +	if (ret) {
> +		dev_err(&dsi->dev, "%pOF: failed to get orientation: %d\n",
> +			dsi->dev.of_node, ret);
> +		return ret;
> +	}
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	dsi->mode_flags = ctx->desc->mode_flags;
> +	dsi->format = ctx->desc->format;
> +	dsi->lanes = ctx->desc->lanes;
> +	dev_info(&dsi->dev, "lanes: %d\n", dsi->lanes);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret)
> +		drm_panel_remove(&ctx->panel);
> +
> +	return ret;
> +}
> +
> +static void ws_panel_dsi_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct ws_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&ctx->panel);
> +	if (ctx->reset) {
> +		gpiod_set_value_cansleep(ctx->reset, 0);
> +		msleep(5);
> +	}
> +
> +	if (ctx->avdd) {
> +		gpiod_set_value_cansleep(ctx->avdd, 0);
> +		msleep(5);
> +	}
> +
> +	if (ctx->iovcc) {
> +		gpiod_set_value_cansleep(ctx->iovcc, 0);
> +		msleep(5);
> +	}
> +}
> +
> +static void ws_panel_dsi_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct ws_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	if (ctx->reset) {
> +		dev_info(&dsi->dev, "shutdown\n");
> +		gpiod_set_value_cansleep(ctx->reset, 0);
> +		msleep(5);
> +	}
> +
> +	if (ctx->avdd) {
> +		gpiod_set_value_cansleep(ctx->avdd, 0);
> +		msleep(5);
> +	}
> +
> +	if (ctx->iovcc) {
> +		gpiod_set_value_cansleep(ctx->iovcc, 0);
> +		msleep(5);
> +	}
> +}
> +
> +static const struct ws_panel_desc ws_panel_12_3_inch_a_4lane_desc = {
> +	.init = ws_panel_12_3_a_4lane_init,
> +	.mode = &ws_panel_12_3_a_4lane_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_10_1_inch_a_4lane_desc = {
> +	.init = ws_panel_10_1_a_4lane_init,
> +	.mode = &ws_panel_10_1_a_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_10_1_inch_a_desc = {
> +	.init = ws_panel_10_1_a_init,
> +	.mode = &ws_panel_10_1_a_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_10_1_inch_b_4lane_desc = {
> +	.init = ws_panel_10_1_b_4lane_init,
> +	.mode = &ws_panel_10_1_b_4lane_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_10_1_inch_b_desc = {
> +	.init = ws_panel_10_1_b_init,
> +	.mode = &ws_panel_10_1_b_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_9_inch_b_4lane_desc = {
> +	.init = ws_panel_10_1_b_4lane_init,
> +	.mode = &ws_panel_9_b_4lane_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_9_inch_b_desc = {
> +	.init = ws_panel_10_1_b_init,
> +	.mode = &ws_panel_9_b_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_8_8_inch_a_desc = {
> +	.init = ws_panel_8_8_a_init,
> +	.mode = &ws_panel_8_8_a_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_8_inch_a_4lane_desc = {
> +	.init = ws_panel_8_a_4lane_init,
> +	.mode = &ws_panel_8_a_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_8_inch_a_desc = {
> +	.init = ws_panel_8_a_init,
> +	.mode = &ws_panel_8_a_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_7_inch_a_desc = {
> +	.init = ws_panel_7_a_init,
> +	.mode = &ws_panel_7_a_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_5_5_inch_a_desc = {
> +	.init = ws_panel_5_5_a_init,
> +	.mode = &ws_panel_5_5_a_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_5_inch_a_desc = {
> +	.init = ws_panel_5_a_init,
> +	.mode = &ws_panel_5_a_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_4_inch_c_desc = {
> +	.init = ws_panel_4_c_init,
> +	.mode = &ws_panel_4_c_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct ws_panel_desc ws_panel_3_4_inch_c_desc = {
> +	.init = ws_panel_3_4_c_init,
> +	.mode = &ws_panel_3_4_c_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +};
> +
> +static const struct of_device_id ws_panel_of_match[] = {
> +	{ .compatible = "waveshare,12.3-dsi-touch-a,4lane",
> +	  &ws_panel_12_3_inch_a_4lane_desc },
> +	{ .compatible = "waveshare,10.1-dsi-touch-a-4lane",
> +	  &ws_panel_10_1_inch_a_4lane_desc },
> +	{ .compatible = "waveshare,10.1-dsi-touch-a",

Is it the same panel but connected differently? Or are those two
different panels?

The same question applies to several other panels here.

> +	  &ws_panel_10_1_inch_a_desc },
> +	{ .compatible = "waveshare,10.1-dsi-touch-b,4lane",
> +	  &ws_panel_10_1_inch_b_4lane_desc },
> +	{ .compatible = "waveshare,10.1-dsi-touch-b",
> +	  &ws_panel_10_1_inch_b_desc },
> +	{ .compatible = "waveshare,9.0-dsi-touch-b,4lane",
> +	  &ws_panel_9_inch_b_4lane_desc },
> +	{ .compatible = "waveshare,9.0-dsi-touch-b",
> +	  &ws_panel_9_inch_b_desc },
> +	{ .compatible = "waveshare,8.8-dsi-touch-a",
> +	  &ws_panel_8_8_inch_a_desc },
> +	{ .compatible = "waveshare,8.0-dsi-touch-a-4lane",
> +	  &ws_panel_8_inch_a_4lane_desc },
> +	{ .compatible = "waveshare,8.0-dsi-touch-a", &ws_panel_8_inch_a_desc },
> +	{ .compatible = "waveshare,7.0-dsi-touch-a", &ws_panel_7_inch_a_desc },
> +	{ .compatible = "waveshare,7.0-dsi-touch-b", &ws_panel_7_inch_a_desc },
> +	{ .compatible = "waveshare,5.5-dsi-touch-a",
> +	  &ws_panel_5_5_inch_a_desc },
> +	{ .compatible = "waveshare,5.0-dsi-touch-a", &ws_panel_5_inch_a_desc },
> +	{ .compatible = "waveshare,4.0-dsi-touch-c", &ws_panel_4_inch_c_desc },
> +	{ .compatible = "waveshare,3.4-dsi-touch-c",
> +		&ws_panel_3_4_inch_c_desc },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ws_panel_of_match);
> +
> +static struct mipi_dsi_driver ws_panel_dsi_driver = {
> +	.probe		= ws_panel_dsi_probe,
> +	.remove		= ws_panel_dsi_remove,
> +	.shutdown	= ws_panel_dsi_shutdown,
> +	.driver = {
> +		.name		= "waveshare-dsi",
> +		.of_match_table	= ws_panel_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(ws_panel_dsi_driver);
> +
> +MODULE_AUTHOR("Waveshare Team <support@waveshare.com>");
> +MODULE_DESCRIPTION("Waveshare DSI panel driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
