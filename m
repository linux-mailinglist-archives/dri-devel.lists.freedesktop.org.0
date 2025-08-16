Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7BEB28F70
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 18:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B1110E3A2;
	Sat, 16 Aug 2025 16:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9AfAZWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E5A10E1DB
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 16:24:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GDISAe029052
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 16:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tUkPCPIsm6rJISiZnG+bdD42
 uN7lGNQoxv/KKJ8aH88=; b=F9AfAZWK86LS6ytZFla7JqGrvBFAMJPNRC+1AMVG
 lsdgKmmzXUMGr2psf3DJ9nqCfL9pfrVrdZH16vRl5XAK/lk0nDx/tP5uvJETQ3nt
 PDd+6lgHrN1OPq9wFpwT3QwmcZXSQEhH+f1InBlaIH76+NpRkLcy1IiPAmu0VOgQ
 itPED5c5qP4xqG6f8QgF1GjRBHoSex+Esk/Dy6AAnXX63GKCDclLJC7jqMnIdc8F
 vizLWb46y5UNVuJpPtS+tfaIenK8D5mQR2BcqNwqM4i5S2hJxzA8cVUCgVS7sLhK
 p2TWbyxfj32CW09SUS9kKIJvv1g8WxwAG8X1knJ5jYlHrw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfbn94t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 16:24:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a94f3bbdbso59841496d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 09:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755361458; x=1755966258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tUkPCPIsm6rJISiZnG+bdD42uN7lGNQoxv/KKJ8aH88=;
 b=O+PUMdtw+2dNsSpe5HLO8B1s7obbA5YT4kVc3pFVeK7x41qpxM+HDdGcJIRGO8tN5L
 gSUmMxXWFQMH83TvksurSP+cH/VJ8nqZbCU0ff1k//ik8cfGc0Bn4NKls54J6OpzjHYH
 Ut0+Z74+FUCvUgBw8aZYLO6w7gFfX3wF33d7JtjOgyYWZ/Ve+/FFj3FTgXoigW0yXnVV
 2gFolF+hTyGD4ZlZTap8O8uvG61WLAf9Yr8siJjpOqP0mUrWbJKX77TXgzx/pcKRmftV
 idOBkSWM/3rLlnUh4DxKsxo7ipo7/8ocL1EHumKoa/lTmR2EIXe0xkXcvzH2WX6t/Zk8
 6S0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqwcUy5oobhYcGR5jWbToIRvGG/yQJ3vbgP8ffV3KAfjfgKPYi6+X4TRS6T4two9PQ0clS91TyvDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwY9z010jXIwNw4xoVAZUiX8nSUAVzwepdOgmWelL9aaciD9Ea1
 V98xmSUWUYsgXyVn7C8PbXVL3YEsQ8pAojIbgPSyFtNEIa8fgAKp5CemEe3yreVfrW029RnMS+w
 5/ISFivGnim++9J281usoGUdtDCYl2ChpcOG65E4KlVkYx8BY5nUxeAaa4Qx2VenbpRuAqfc=
X-Gm-Gg: ASbGncvuZz4FmM80UI6dSgEo1/A/nFHfO61ROSaBn8ci6V4QE6NA7pZ/ge8Y4NdM8yk
 1xjMfGm/ybGVevkCcB6p1XckArsftK1POLzZnfhk61d8ggqWZ1E0Pq8Af+iv5w8F0VxRiVioVwt
 2nV0x6ln8N8e8q5L9E3pjLuCXWYfDB5rKw75/ycDTk0aGo5ECiW7Q7V8T1+SkIXuqkO+mVOpEGO
 mr+Bf00Vr9c72LSDYkJIfR6s5+Mzv4JkzArvja26huYSvr7USvBeUqAX0zL2EM6yTGYsZPQNJET
 sJyzuvgce7xSzgbUKMf82+jKyFJ5VWzgijoaH27vXiLfRAEGagE3BkZ3nlIn4k/1Bk8cYctGdUX
 nTuX+ze1MJhB0xQUXOunWf3I3xImt+Dkn3m2D/bEj53nkTrvJOcw7
X-Received: by 2002:a05:6214:23c8:b0:70b:9b35:4056 with SMTP id
 6a1803df08f44-70bb0594312mr34636606d6.15.1755361458507; 
 Sat, 16 Aug 2025 09:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyipOby5YKPbmwxIkgT3A3KLkCfEvCrPLfYFRSuHIAYH+ruoSaDscrnG+ZdB9u7ilY5jSTVw==
X-Received: by 2002:a05:6214:23c8:b0:70b:9b35:4056 with SMTP id
 6a1803df08f44-70bb0594312mr34636036d6.15.1755361458000; 
 Sat, 16 Aug 2025 09:24:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cc9b1sm915988e87.87.2025.08.16.09.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 09:24:17 -0700 (PDT)
Date: Sat, 16 Aug 2025 19:24:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 5/8] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Message-ID: <sp2pdifimqych5zn3mt7pnba3vl25qflgiys76s7dwmyt3jd72@bmwkc7s6p6c4>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-6-uwu@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814164048.2336043-6-uwu@icenowy.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfX6sI8MM/N5fSQ
 gWxZntrLlsmvG0421s7mYbUxtRe6RJh6AnJI2pHA3/EWYMTpWcF+ljjog/3ZxVE9cedhahR9HZl
 wiIzQy70uD/kmiJU8GhIr0UD4TDiXAPn8E6blpG5qI8OjzMOkbHjek0sCBbrg/cZUF6iz6Bh2BH
 HOdSGt0u8xzUfqY5vo08dmZ02maep936c1+58fpIBEc8Ry/ZkXgjKeYPeQOG2q36zJg5/KP4Ynw
 F1sjaffJMumVErc14rp4ULmQQIY2obfXJHppPuag9Ns8v9DBcWe0RQEni5GGEAPTrcaHo+sdo6h
 TgL+LICkA0P41qAiIgStOWgVcI2ozQeZtIRsz64lv5qxqhaV0OYG5/8QrpTFhz3RZVcAbDGxEDl
 S8dGXr+J
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=68a0b0b3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=M_DeNQq5HZiA6esx_F0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: wqlXwVdElOF8xXelF7NIn-tUfeAlwhRN
X-Proofpoint-ORIG-GUID: wqlXwVdElOF8xXelF7NIn-tUfeAlwhRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160001
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

On Fri, Aug 15, 2025 at 12:40:45AM +0800, Icenowy Zheng wrote:
> T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller (paired
> with DesignWare HDMI TX PHY Gen2) that takes the "DP" output from the
> display controller.
> 
> Add a driver for this controller utilizing the common DesignWare HDMI
> code in the kernel.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  MAINTAINERS                             |   1 +
>  drivers/gpu/drm/bridge/Kconfig          |  10 ++
>  drivers/gpu/drm/bridge/Makefile         |   1 +
>  drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 170 ++++++++++++++++++++++++
>  4 files changed, 182 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa45..eb84e36ded6d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21728,6 +21728,7 @@ F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
>  F:	drivers/firmware/thead,th1520-aon.c
> +F:	drivers/gpu/drm/bridge/th1520-dw-hdmi.c
>  F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a6..f75e6ad04179f 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -322,6 +322,16 @@ config DRM_THINE_THC63LVD1024
>  	help
>  	  Thine THC63LVD1024 LVDS/parallel converter driver.
>  
> +config DRM_THEAD_TH1520_DW_HDMI
> +	tristate "T-Head TH1520 DesignWare HDMI bridge"
> +	depends on OF
> +	depends on COMMON_CLK
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	select DRM_DW_HDMI
> +	help
> +	  Choose this to enable support for the internal HDMI bridge found
> +	  on the T-Head TH1520 SoC.
> +
>  config DRM_TOSHIBA_TC358762
>  	tristate "TC358762 DSI/DPI bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 245e8a27e3fc5..421e445ff1cd9 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
>  obj-$(CONFIG_DRM_SII902X) += sii902x.o
>  obj-$(CONFIG_DRM_SII9234) += sii9234.o
>  obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
> +obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
>  obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
> diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> new file mode 100644
> index 0000000000000..f8dddf3cb0cca
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> + *
> + * Based on rcar_dw_hdmi.c, which is:
> + *   Copyright (C) 2016 Renesas Electronics Corporation
> + * Based on imx8mp-hdmi-tx.c, which is:
> + *   Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_modes.h>
> +
> +#define TH1520_HDMI_PHY_OPMODE_PLLCFG	0x06	/* Mode of operation and PLL dividers */
> +#define TH1520_HDMI_PHY_CKSYMTXCTRL	0x09	/* Clock Symbol and Transmitter Control Register */
> +#define TH1520_HDMI_PHY_VLEVCTRL	0x0e	/* Voltage Level Control Register */
> +#define TH1520_HDMI_PHY_PLLCURRGMPCTRL	0x10	/* PLL current and Gmp (conductance) */
> +#define TH1520_HDMI_PHY_PLLDIVCTRL	0x11	/* PLL dividers */
> +#define TH1520_HDMI_PHY_TXTERM		0x19	/* Transmission Termination Register */
> +
> +struct th1520_hdmi_phy_params {
> +	unsigned long mpixelclock;
> +	u16 opmode_pllcfg;
> +	u16 pllcurrgmpctrl;
> +	u16 plldivctrl;
> +	u16 cksymtxctrl;
> +	u16 vlevctrl;
> +	u16 txterm;
> +};
> +
> +static const struct th1520_hdmi_phy_params th1520_hdmi_phy_params[] = {
> +	{ 35500000,  0x0003, 0x0283, 0x0628, 0x8088, 0x01a0, 0x0007 },
> +	{ 44900000,  0x0003, 0x0285, 0x0228, 0x8088, 0x01a0, 0x0007 },
> +	{ 71000000,  0x0002, 0x1183, 0x0614, 0x8088, 0x01a0, 0x0007 },
> +	{ 90000000,  0x0002, 0x1142, 0x0214, 0x8088, 0x01a0, 0x0007 },
> +	{ 121750000, 0x0001, 0x20c0, 0x060a, 0x8088, 0x01a0, 0x0007 },
> +	{ 165000000, 0x0001, 0x2080, 0x020a, 0x8088, 0x01a0, 0x0007 },
> +	{ 198000000, 0x0000, 0x3040, 0x0605, 0x83c8, 0x0120, 0x0004 },
> +	{ 297000000, 0x0000, 0x3041, 0x0205, 0x81dc, 0x0200, 0x0005 },
> +	{ 371250000, 0x0640, 0x3041, 0x0205, 0x80f6, 0x0140, 0x0000 },
> +	{ 495000000, 0x0640, 0x3080, 0x0005, 0x80f6, 0x0140, 0x0000 },
> +	{ 594000000, 0x0640, 0x3080, 0x0005, 0x80fa, 0x01e0, 0x0004 },
> +	{ ~0UL,      0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }
> +};
> +
> +struct th1520_hdmi {
> +	struct dw_hdmi_plat_data plat_data;
> +	struct dw_hdmi *dw_hdmi;
> +	struct clk *pixclk;
> +	struct reset_control *mainrst, *prst;
> +};
> +
> +static enum drm_mode_status
> +th1520_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +		       const struct drm_display_info *info,
> +		       const struct drm_display_mode *mode)
> +{
> +	/*
> +	 * The maximum supported clock frequency is 594 MHz, as shown in the PHY
> +	 * parameters table.
> +	 */
> +	if (mode->clock > 594000)
> +		return MODE_CLOCK_HIGH;

We should rewrite DW bridge into HDMI ops. It would help us to get rid
of such functions. With it in place it will be handled by the generic
TMDS clock rate check.

> +
> +	return MODE_OK;
> +}
> +
> +static int th1520_hdmi_phy_configure(struct dw_hdmi *hdmi, void *data,
> +				     unsigned long mpixelclock)
> +{
> +	const struct th1520_hdmi_phy_params *params = th1520_hdmi_phy_params;
> +
> +	for (; params->mpixelclock != ~0UL; ++params) {
> +		if (mpixelclock <= params->mpixelclock)
> +			break;

for (...) {
	if (mpixelclock <= params->mpixelclock)
		return th1520_program_phy();
}

return -EINVAL;

> +	}
> +
> +	if (params->mpixelclock == ~0UL)
> +		return -EINVAL;
> +
> +	dw_hdmi_phy_i2c_write(hdmi, params->opmode_pllcfg,
> +			      TH1520_HDMI_PHY_OPMODE_PLLCFG);
> +	dw_hdmi_phy_i2c_write(hdmi, params->pllcurrgmpctrl,
> +			      TH1520_HDMI_PHY_PLLCURRGMPCTRL);
> +	dw_hdmi_phy_i2c_write(hdmi, params->plldivctrl,
> +			      TH1520_HDMI_PHY_PLLDIVCTRL);
> +	dw_hdmi_phy_i2c_write(hdmi, params->vlevctrl,
> +			      TH1520_HDMI_PHY_VLEVCTRL);
> +	dw_hdmi_phy_i2c_write(hdmi, params->cksymtxctrl,
> +			      TH1520_HDMI_PHY_CKSYMTXCTRL);
> +	dw_hdmi_phy_i2c_write(hdmi, params->txterm,
> +			      TH1520_HDMI_PHY_TXTERM);
> +
> +	return 0;
> +}
> +
> +static int th1520_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct th1520_hdmi *hdmi;
> +	struct dw_hdmi_plat_data *plat_data;
> +	struct device *dev = &pdev->dev;
> +
> +	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> +	if (!hdmi)
> +		return -ENOMEM;
> +
> +	plat_data = &hdmi->plat_data;
> +
> +	hdmi->pixclk = devm_clk_get_enabled(dev, "pix");
> +	if (IS_ERR(hdmi->pixclk))
> +		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
> +				     "Unable to get pixel clock\n");
> +
> +	hdmi->mainrst = devm_reset_control_get_exclusive_deasserted(dev, "main");
> +	if (IS_ERR(hdmi->mainrst))
> +		return dev_err_probe(dev, PTR_ERR(hdmi->mainrst),
> +				     "Unable to get main reset\n");
> +
> +	hdmi->prst = devm_reset_control_get_exclusive_deasserted(dev, "apb");
> +	if (IS_ERR(hdmi->prst))
> +		return dev_err_probe(dev, PTR_ERR(hdmi->prst),
> +				     "Unable to get apb reset\n");
> +
> +	plat_data->output_port = 1;
> +	plat_data->mode_valid = th1520_hdmi_mode_valid;
> +	plat_data->configure_phy = th1520_hdmi_phy_configure;
> +	plat_data->priv_data = hdmi;
> +
> +	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	platform_set_drvdata(pdev, hdmi);
> +
> +	return 0;
> +}
> +
> +static void th1520_dw_hdmi_remove(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> +
> +	dw_hdmi_remove(hdmi);
> +}
> +
> +static const struct of_device_id th1520_dw_hdmi_of_table[] = {
> +	{ .compatible = "thead,th1520-dw-hdmi" },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, th1520_dw_hdmi_of_table);
> +
> +static struct platform_driver th1520_dw_hdmi_platform_driver = {
> +	.probe		= th1520_dw_hdmi_probe,
> +	.remove		= th1520_dw_hdmi_remove,
> +	.driver		= {
> +		.name	= "th1520-dw-hdmi",
> +		.of_match_table = th1520_dw_hdmi_of_table,
> +	},
> +};
> +
> +module_platform_driver(th1520_dw_hdmi_platform_driver);
> +
> +MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
> +MODULE_DESCRIPTION("T-Head TH1520 HDMI Encoder Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
