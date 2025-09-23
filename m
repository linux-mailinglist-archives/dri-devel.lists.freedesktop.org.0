Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7BB93C5C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 03:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B880510E055;
	Tue, 23 Sep 2025 01:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FU5DxpuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C202910E055
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:00:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MGgBpp008593
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uKwfwovsK6G+XL2gFR+D9Aio
 +yl6faNqELg+9kMUYj8=; b=FU5DxpuV37CkXQyWkySBCmzbs18Spc9at4WnukhN
 uyXildLccMzUTPhgNIZw/uixB/awta7Ci9TraV2ibFRX4BF7K6saJBVBOsPIPMO9
 OgHqLCI1V5b66skApMGvg65cvrcPvAMiXyHwEu5Oaj9Da1HYpB/L2r1tn7pU8US+
 yOsIDIbXTpJuepKpfNHq8T1/qHCF5/r5hc3xJ/pg9i+OFj2XdQwTxh1lXc+iQtlo
 WaqSowIxWmcW4u6r7pzP4Gc8H8i4Q/YgU6Uosg3eBBUEbrgpVW302ed37gcRn01y
 J3zBbJ3BDcHCUq592W7+IfcBI0ENUTmd3t49fb9vZrlMgA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhpqmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:00:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-78f2b1bacfcso81723256d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758589247; x=1759194047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKwfwovsK6G+XL2gFR+D9Aio+yl6faNqELg+9kMUYj8=;
 b=xNvw+ZgKMIZAfUij4IX8P5HvxzokETDhgju1393rlxaFhDIIKwzH98jvufkA9Gkldp
 7U5v0g2YLugHfzGMraK35HMd8301JmwaK6Dq95rO7A8Uazgs4PyqP31Tr23WnLOFsK5Q
 ifaIPXx9IZ+A1Q/zby+AIF7Dfb8bJJoJ89VWn5IUDgaXQrhS+T2VoIpVBDi0DHagnfP+
 bG/FXVWqwNPxP/DEQScJq5J+fxkbyTbf1uzyct6Jlk/0m6PFi9NvjGVSFI4SjIzIhHfn
 v0iEuyxKwKM3SYmOPyDiUCI6DRqF6TUSdn6OuewfJwajEagomMwVjBnVb6ydem1Ps6QF
 jMVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcLuB3eCDqh517rm8KiXleFS/10quNDNkFnmOipTyLvwiNXdYnfxMUBZu7QBITaYY2G6N9vshTRdA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqALzgSDqcbhSr1UoqhEDVXdtzvmp7RP715mhL4RClfqFjfdnG
 gKCiJcmy31Wx9ATfNGlBLaPe32EY8xjplzi1YDGUU5Mmh9sl22bBQ4KWpNPp4ZIMv8CJjYPQgh0
 VIeOtf8X/HVXG19Bayci1eUxzRRlV/1kuraPZKy7tE4yVe/UZrwDtqjPyO7scQX4SP6BYgQk=
X-Gm-Gg: ASbGnctq/4G5aNKTB8co8JAdxQDwR3Rdf2s3rX4nwxma/1JtsBTN3EdHBZwWbA5amMh
 4ywwSOunaR4F5ZOHFjc2CKi2VhVpC72VvgSpbRGqBd8s9lj59JMI5gNpiHrAY5n2/wCUtr2IZ85
 EdYIbB0L0EpqzSHnLzY0C0upS5ueXy5bF5epYzj/FtVrkNhw+xMp5eOhJ169F0ymklhKlFUCWgm
 8pqnnaIOrAQM2+foTLXH9aNxvfK1aQex7TKr62VW11iY6N0JBayUDE+J7+RVmI6PdqVcxwxKKNA
 ZPIigH0cZk8rKyJJ0iAJW9CqukBBEqhJzNGboXgtpGwxwlQUCp3S02q8eewogJRdmfU/9uIIHs0
 GPqIxYre5UKDOPi+E3HdR+FphjA68HlBP28QzenFl4DAKjeqJKHh6
X-Received: by 2002:a05:6214:252b:b0:782:952a:9e45 with SMTP id
 6a1803df08f44-7e71b334514mr6962876d6.65.1758589247160; 
 Mon, 22 Sep 2025 18:00:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPtrX3MUMDF+zqwBkLntyAXDXaG6LVnWCjk6aDDU12rLApl7ZW7ISuHZVgo/gt3eoT+zOpZg==
X-Received: by 2002:a05:6214:252b:b0:782:952a:9e45 with SMTP id
 6a1803df08f44-7e71b334514mr6962196d6.65.1758589246311; 
 Mon, 22 Sep 2025 18:00:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36a98532a74sm13994211fa.29.2025.09.22.18.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 18:00:45 -0700 (PDT)
Date: Tue, 23 Sep 2025 04:00:42 +0300
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
Subject: Re: [PATCH v2 5/8] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Message-ID: <yy57lh5rmbubtqscpquoy3np65tm465cqbtmjw5pqiwxjnecsh@d4qbxe3d4sc5>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-6-uwu@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921083446.790374-6-uwu@icenowy.me>
X-Proofpoint-ORIG-GUID: aru0gjMjSSkA_6jKZV1Yg7lF2k7thaEo
X-Proofpoint-GUID: aru0gjMjSSkA_6jKZV1Yg7lF2k7thaEo
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d1f140 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=kiC7nBRpPsduyw9UZ3oA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfXwSaSc/Ot4xwS
 cLAVl+PyfFXLnzemgkT4OygAu3pt8ZyM/xX96wCHMGFqzUsc7EpAl9CyueE9qMYYxHShHfS8Ugv
 F8YC05+MzVbIi8y4+/upJITlCBk1Ib9zQXUyYaRb89lsN9El5pghOZbrfXsxKLKhYcQwlYQlSlP
 9iBpY8pECsbCMgC7A0k+fEY5shmG7Iq8GEKEnABBb6cT45fGZwCFdQSHydmrV+199lf4oa8Dhah
 ujTSdB9vyJSQLYmdB2uPOgH1A8tDLnSrCStS8xuQCXmouq3FYGNTEVW9jI+4T+bmYgi1KPAjWiL
 CNetHGiVUxyIOzv7PrI6tcIabv2KHNmPJxJLgAivttpqDAWuQ+8C0sVtf9Th6qnq6396nDlWKYc
 Rd8awnwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022
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

On Sun, Sep 21, 2025 at 04:34:43PM +0800, Icenowy Zheng wrote:
> T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller (paired
> with DesignWare HDMI TX PHY Gen2) that takes the "DP" output from the
> display controller.
> 
> Add a driver for this controller utilizing the common DesignWare HDMI
> code in the kernel.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> Changes in v2:
> - Created a new function to set PHY parameters and refactored the
>   control flow of the configure_phy callback.
> 
>  MAINTAINERS                             |   1 +
>  drivers/gpu/drm/bridge/Kconfig          |  10 ++
>  drivers/gpu/drm/bridge/Makefile         |   1 +
>  drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 173 ++++++++++++++++++++++++
>  4 files changed, 185 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f6206963efbf0..98af9dd3664f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21759,6 +21759,7 @@ F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
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
> index 0000000000000..efb27d37ff652
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> @@ -0,0 +1,173 @@
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

Is it the limitation for the pixel clock or for the TMDS char clock (the
difference makes sense for non-8-bpc modes.

> +
> +	return MODE_OK;
> +}
> +

-- 
With best wishes
Dmitry
