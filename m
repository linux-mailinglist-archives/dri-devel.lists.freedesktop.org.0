Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B624BCD82F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E5810EC20;
	Fri, 10 Oct 2025 14:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpmyaHS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F0C10EC29
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:25:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6Ww4c006078
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=n7uMShFAW6vKSxeSDpvmfH6Z
 +go2cr7WrX+Q1W1Pieg=; b=gpmyaHS06KR471Y5SW32Kmf3buxGXP4Nv1dPxeUo
 dFxQ2WcO2rKg0XbxO3Uvh07Utj1MCR2+8bkv1NDpPvJpFXCl6fg45SWYapnpry3a
 R/Z7kD53vk5Cp80V3zK7R7TnxM02tdR+KXSMc9rjpog06xC5G6sBKcRq4kWLEJtP
 mduPP/xUYyRdINiRCmVD7rsassXpurLWfbVkAexozIJg6IrWKPHIJymS08vsB0d5
 Cz1+YdqP8KRv/AW+Wn5/wBiiHXXCCIiIUaFPbE1L8DDJWxsgl9GQw0vmG+xyKX4r
 s542SB/vuusG+8IOM46M2M5/Eey6IsuEVnPEap55KEK9ew==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j6qmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:25:20 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-42fa528658fso17782755ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 07:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760106319; x=1760711119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7uMShFAW6vKSxeSDpvmfH6Z+go2cr7WrX+Q1W1Pieg=;
 b=evRtcg2k/BKGdYipOQr2/1IGvh7q2Ho0T75hceu4tOU3MCYZV1VNsX+NbBeuQ7Ph6t
 tzeN+Km+CqSNBqhUHyACWnp+bYstuvBX323qKoR824IrKjD+C+EAidzB4FuQqwysNmQU
 kSL4untDD7QkwTtBwgeIiS10fozsDTmQXSOH3TqZvRl/bKoEZ2u8Mjtu1OmoypJ66Ai3
 4ZdhT5x85YtuFPyvVMaxnn2Lnk7IWjX76Z6ZpAbMIdwDFtzW1JJD79e1F+oS/WABhP2i
 oqNzaY8v+b2w98lp3cc2l2jX3hnSHPVtzgK/n2E2p9XxSCOrhDqOkiwDODDfSK99waU3
 5WfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMXkKDjWAakTvjuTopLRiONkI0TgWSmLPFQuHfD8p13+LgdLO76DVI7CBi1GK/YjhzR79O364hzBg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyknzJJM9v+5Yxp6OSAD/Lfa1LwJXAYEHQ0hIlrPk+KXzf9g1Df
 opRemGeiqMDjKBIuSd/Tng9J1/bLKrmfVelv3I8CXUYcx0LMvgSHQqUzxYzqR3TQs4lJphVFGp+
 24IIUVChBQ0HWyHRktRSCe033S2bW+frP3+UButItslheWcaPQbst0VBoVK4kTrF+1UFg060=
X-Gm-Gg: ASbGnctjF60JSt/WP8l7vlWtbBh2WEvzNsCVMl8goNRkpx3Ao2Zhl0/SMWFKhOMWkV3
 XVo92kAnujxvsyOXk2CUyiIrRqANLeknsVr948+jxWaYrYgIuSVFAVATAw3cCkM+Fg28hYTzdmR
 iWO/BaYNxeGVbTFRgnqxop624lxpTpZ3Z1hc1iaxQIzIsf1WradxhCHbUzX8opJlAe+Ai12+sQU
 9PWxy2dr5Q8aLviDXsOMoeOJRwZb4LUClqCcZWmcKpfpqmkQ9IsY+TM6rTOb9CwQ/9gzEccls3t
 qnIN8NDeeR3QFsAZvEFW68nzPK661fQGNB3LgYX4AayQjsbD9DSshZ/xC3IhvC/5R1/Irbt1HwC
 LpvcBYlphNWgz6gO5ktVTUSlXrP65dVvkEKSa6BFdFjvsbmBclP0S
X-Received: by 2002:a05:622a:181d:b0:4b4:8ee1:7d98 with SMTP id
 d75a77b69052e-4e6eacccc58mr153261711cf.8.1760104609437; 
 Fri, 10 Oct 2025 06:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2+S1aFOZdF+zvCye8+QDgWhXhMl2cMNQQVose0arE3+Ui+HZrXrYqWEbDWtAEbQ0IBnrD3g==
X-Received: by 2002:a05:622a:181d:b0:4b4:8ee1:7d98 with SMTP id
 d75a77b69052e-4e6eacccc58mr153260751cf.8.1760104608493; 
 Fri, 10 Oct 2025 06:56:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5908820d275sm896056e87.56.2025.10.10.06.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 06:56:47 -0700 (PDT)
Date: Fri, 10 Oct 2025 16:56:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pet Weng <pet.weng@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth Hung <kenneth.Hung@ite.com.tw>,
 Pin-yen Lin <treapking@google.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: Add ITE IT61620 MIPI DSI to HDMI
 bridge driver
Message-ID: <q3bpzusohiadfcqfdtqlz3gbag7rbwc6buhrtppehheda5zhlh@gxbxnmynnqti>
References: <20251009-it61620-0714-v3-0-5d682d028441@ite.com.tw>
 <20251009-it61620-0714-v3-2-5d682d028441@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-it61620-0714-v3-2-5d682d028441@ite.com.tw>
X-Proofpoint-GUID: CbdnaeIA1Pykax_pgiBHGc74gOhqE6UQ
X-Proofpoint-ORIG-GUID: CbdnaeIA1Pykax_pgiBHGc74gOhqE6UQ
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e91750 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Ns9eNvu6AAAA:8 a=fYI6lS67hPgfHarS1QAA:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX89+k4IfTV8I4
 QZWYh56fQNev1NgpnxySUE5plYj5C9ZjnQT+DjAZRIStcg0CXgvXlL/Gtbv6Ct/hGqPjVHPYgAQ
 2mAarDpyhuySCjzrCIVxxxRLzLQCHe0bv4Qweos5UWt/SQ3JrHcPuN8cmPbbrPULmzqtSETBeav
 3mgALkRGMwSLEKqpljQ322goZJ9UG+hE/cmvWySyKp8zIn5t4KSK+0+A4wqL2l4kvc2ApEgoREV
 Sz0KxAOYXScav0SD0MxisZH6SoshZ9PcL5Fgv+cbFj4MRci9DPpgSKBKeT5r5p36LyAIr0QiRUi
 +c3MRFwWccAqnyYUIpqcuFcqx5s1u1oQpi4qkU1t+EW0wWqJBdKFc5pYYjAHiOrXo5zC+MNLx9u
 jNtTVs1O2ffz8Kt1bbsXz8qOw0yxSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Thu, Oct 09, 2025 at 04:02:35PM +0800, Pet Weng wrote:
> This adds support for the ITE IT61620 bridge chip which converts
> MIPI DSI input to HDMI output. The Driver implements the basic
> bridge functions and integrates with the DRM bridge and connector
> frameworks.
> 
> Supported fetures include:
> MIPI DSI input handling
> HDMI output setup
> Basic mode configuration
> I2C-based control and initialization
> HDCP 1.4 handling
> 
> This driver will be used on platforms embedding the IT61620 for
> video output via HDMI from SoCs with MIPI DSI output.
> 
> Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/Kconfig       |   18 +
>  drivers/gpu/drm/bridge/Makefile      |    1 +
>  drivers/gpu/drm/bridge/ite-it61620.c | 2998 ++++++++++++++++++++++++++++++++++
>  3 files changed, 3017 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index a250afd8d662200c250f8e7c1b968a956b9c180c..69430734faabae6e5eb8aa6c50cdc47eca3545e1 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -111,6 +111,24 @@ config DRM_ITE_IT6263
>  	help
>  	  ITE IT6263 LVDS to HDMI bridge chip driver.
>  
> +config DRM_ITE_IT61620
> +	tristate "ITE IT61620 DSI/HDMI bridge"
> +	depends on OF
> +	select DRM_DISPLAY_CONNECTOR
> +	select DRM_DISPLAY_HDMI_HELPER
> +	select DRM_DISPLAY_HDCP_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_KMS_HELPER
> +	select DRM_HDMI_HELPER
> +	select CRYPTO_LIB_SHA1
> +	help
> +	  Driver for ITE IT61620 MIPI DSI to HDMI bridge
> +	  chip driver.
> +
> +	  It enables display output through HDMI when connected to a MIPI
> +	  DSI source. The bridge translates the video signals for HDMI monitors.
> +
>  config DRM_ITE_IT6505
>  	tristate "ITE IT6505 DisplayPort bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index c7dc03182e59273f52250ecd158d90ac3d29439c..41668786a909a217872ef2222b545d2b5bf87b51 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -11,6 +11,7 @@ tda998x-y := tda998x_drv.o
>  obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
>  
>  obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
> +obj-$(CONFIG_DRM_ITE_IT61620) += ite-it61620.o
>  obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
> diff --git a/drivers/gpu/drm/bridge/ite-it61620.c b/drivers/gpu/drm/bridge/ite-it61620.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..079cb0ea264586a34c2b90858dcf6c1e0c66078c
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ite-it61620.c
> @@ -0,0 +1,2998 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 ITE Tech. Inc.
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +#include <linux/pm_runtime.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_of.h>
> +#include <drm/display/drm_hdcp_helper.h>
> +#include <drm/display/drm_hdmi_helper.h>
> +#include <drm/display/drm_hdmi_state_helper.h>
> +#include <video/videomode.h>
> +#include <sound/hdmi-codec.h>
> +#include <crypto/sha1.h>
> +
> +#define EDID_R_BURST_NUM 16
> +#define DDC_FIFO_DEPTH 32
> +
> +#define MIPIRX_I2C_ADDRESS (0x78 >> 1)
> +#define TX_I2C_ADDRESS (0xC0 >> 1)
> +
> +#define REG_CTRL_PW 0xFF
> +
> +#define REG_VENDER_ID_L 0x00
> +#define REG_VENDER_ID_H 0x01
> +#define REG_DEVICE_ID_L 0x02
> +#define REG_DEVICE_ID_H 0x03
> +#define REG_DEV_VERSION 0x04
> +#define DEV_VERSION_A0 0xA0
> +#define DEV_VERSION_C0 0xC0
> +
> +#define RX_REG_BANK 0x0F
> +#define M_MIPIRX_BANK 0x01
> +
> +#define RX_REG_RESET_CTRL 0x05
> +#define B_REF_CLOCK_RESET BIT(3)
> +#define RX_REG_CLK_CTRL 0x10
> +#define B_MIPI_INT_STATUS BIT(7)
> +#define RX_REG_D_RST 0x1A
> +#define B_D_RST BIT(0)
> +#define RX_REG_INT_STATUS_01 0x0A
> +#define B_INI_V_CHG BIT(0)
> +#define RX_REG_INT_POL 0x11
> +#define RX_REG_INT_MASK 0x114
> +#define B_V_CHG BIT(0)
> +#define RX_REG_INT_STATUS_02 0x22
> +#define B_INI_V_STB BIT(5)
> +#define RX_REG_MPPCLKI 0x12
> +
> +#define RX_REG_HFP_L 0x30
> +#define RX_REG_HFP_H 0x31
> +#define RX_REG_HSW_L 0x32
> +#define RX_REG_HSW_H 0x33
> +#define RX_REG_HBP_L 0x34
> +#define RX_REG_HBP_H 0x35
> +#define RX_REG_HDEW_L 0x36
> +#define RX_REG_HDEW_H 0x37
> +#define RX_REG_HTOTAL_L 0x48
> +#define RX_REG_HTOTAL_H 0x49
> +
> +#define RX_REG_SELDCLK 0x24
> +#define RX_REG_VFP_L 0x3A
> +#define RX_REG_VFP_H 0x3B
> +#define RX_REG_VSW_L 0x3C
> +#define RX_REG_VSW_H 0x3D
> +#define RX_REG_VBP_L 0x3E
> +#define RX_REG_VBP_H 0x3F
> +#define RX_REG_VDEW_L 0x40
> +#define RX_REG_VDEW_H 0x41
> +#define RX_REG_POL 0x4E
> +#define B_MIPI_H_POL BIT(0)
> +#define B_MIPI_V_POL BIT(1)
> +
> +#define RX_REG_DSCCTRL 0x25
> +#define RX_REG_SYNC_NUM 0x4D
> +#define RX_REG_BSP_SEL 0x1F
> +#define RX_REG_PWD_CTRL 0xE0
> +#define RX_REG_ENVRR 0x1AC
> +#define RX_REG_ENVBLK 0x1AD
> +
> +#define RX_REG_D2P_RESET 0xA0
> +#define RX_REG_D2P_CTRL 0xA1
> +#define RX_REG_AUTO_D2P_RESET 0xA2
> +#define RX_REG_TUNEOPT 0xA9
> +#define RX_REG_TUNETHRE 0xAA
> +#define RX_REG_DSC_RESET 0xAB
> +#define RX_REG_DSC_VFRD 0xAC
> +
> +#define RX_REG_MIPI_CONFIG 0x112
> +#define B_MIPI_LANE_NUM 0x03
> +#define B_MIPI_PN_SWAP BIT(2)
> +#define B_MIPI_LANE_SWAP BIT(3)
> +#define RX_REG_HS_CTRL 0x118
> +#define RX_REG_LP_CTRL 0x119
> +#define RX_REG_MIPI_CTRL01 0x44
> +#define RX_REG_AUTO_SYNC 0x144
> +#define RX_REG_MV_MAX 0x146
> +#define RX_REG_FORCE_M 0x147
> +#define B_FORCE_MHT_STB BIT(0)
> +#define B_FORCE_MVT_STB BIT(3)
> +#define RX_REG_MIPI_CTRL02 0x14E
> +#define B_FIFO_RST BIT(5)
> +
> +#define TX_REG_STATUS01 0x07
> +#define B_INT_STATUS BIT(0)
> +#define B_HPD_STATUS BIT(1)
> +#define B_VIDEO_STB BIT(2)
> +
> +#define TX_REG_HDMITX_BANK 0x0F
> +#define M_HDMITX_BANK 0x03
> +#define B_INT_EVENT_HDMI BIT(4)
> +#define TX_REG_RESET_1_CTRL 0x05
> +#define B_REFERENCE_CLOCK_RESET BIT(0)
> +#define B_VIDEO_RESET BIT(1)
> +#define B_AUDIO_RESET BIT(2)
> +#define B_AUX_RESET BIT(3)
> +#define B_IPCLK_RESET BIT(4)
> +#define B_SDM_RESET BIT(5)
> +#define B_TCLK_RESET BIT(6)
> +
> +#define TX_REG_RESET_2_CTRL 0x06
> +
> +#define TX_REG_V_STS 0x09
> +#define B_RXSEN BIT(1)
> +#define B_V_STABLE BIT(2)
> +#define B_TMDS_STABLE BIT(3)
> +
> +#define TX_REG_SYS_CONFIG 0x0C
> +#define B_EN_HDMI BIT(6)
> +#define B_INT_POL BIT(0)
> +#define B_INT_MODE BIT(1)
> +#define B_INT_OUT_STATUS BIT(2)
> +#define B_INT_OUTPUT BIT(3)
> +
> +#define BIT_OFFSET(x) ((x) * BITS_PER_BYTE)
> +
> +#define TX_REG_INT1 0x10
> +#define TX_REG_INT_MASK1 0x18
> +#define INT_HPD_CHG 0
> +#define B_HPD_CHG BIT(INT_HPD_CHG)
> +#define BIT_HPD_CHG (BIT_OFFSET(0) + INT_HPD_CHG)
> +#define INT_RXSEN_CHANGE 2
> +#define B_RXSEN_CHANGE BIT(INT_RXSEN_CHANGE)
> +#define BIT_RXSEN_CHANGE (BIT_OFFSET(0) + INT_RXSEN_CHANGE)
> +#define INT_AUTH_F 3
> +#define B_INT_AUTH_F BIT(INT_AUTH_F)
> +#define BIT_INT_AUTH_F (BIT_OFFSET(0) + INT_AUTH_F)
> +#define INT_AUTH_D 4
> +#define B_INT_AUTH_D BIT(INT_AUTH_D)
> +#define BIT_INT_AUTH_D (BIT_OFFSET(0) + INT_AUTH_D)
> +
> +#define TX_REG_INT2 0x11
> +#define TX_REG_INT_MASK2 0x19
> +#define INT_KSV_CHECK 1
> +#define B_KSV_CHECK BIT(INT_KSV_CHECK)
> +#define BIT_KSV_CHECK  (BIT_OFFSET(1) + INT_KSV_CHECK)
> +
> +#define TX_REG_INT3 0x16
> +#define TX_REG_INT_MASK3 0x1E
> +#define INT_TMDS_STB_CHG 6
> +#define B_TMDS_STB_CHG BIT(INT_TMDS_STB_CHG)
> +#define BIT_TMDS_STB_CHG (BIT_OFFSET(2) + INT_TMDS_STB_CHG)
> +
> +#define REG_TX_INT_CTRL 0x21
> +#define B_DIS_INT_OUTPUT BIT(5)
> +#define TX_REG_CLOCK_PWD_CTRL 0x2B
> +
> +#define TX_REG_AFE0E 0x0E
> +#define TX_REG_AFE30 0x30
> +#define TX_REG_AFE33 0x33
> +#define TX_REG_AFE34 0x34
> +#define TX_REG_AFE35 0x35
> +#define TX_REG_AFEE9 0xE9
> +#define TX_REG_AFE_XP 0x219
> +#define TX_REG_AFE_XLC1 0x220
> +#define TX_REG_AFE_XLC2 0x223
> +#define TX_REG_AFE_XLC3 0x226
> +#define TX_REG_AFE_DRV 0x23B
> +
> +#define TX_REG_CR_1_CTRL 0x3A
> +#define TX_REG_CR_2_CTRL 0x3F
> +
> +#define TX_REG_R0TM 0x5A
> +#define TX_REG_SHA_SEL 0x5D
> +
> +#define TX_REG_HDCP_CTRL1 0x60
> +#define B_CPDESIRED BIT(0)
> +#define TX_REG_HDCP_PRO 0x61
> +#define B_AUTH_FIRE BIT(0)
> +#define B_LIST_CHK_DONE BIT(4)
> +#define B_LIST_CHK_FAIL BIT(5)
> +#define TX_REG_HDCP_CTRL2 0x62
> +#define TX_REG_AUTOMUTE 0x65
> +#define B_AN_SEL BIT(0)
> +#define B_EN_AN_GEN BIT(1)
> +#define B_EN_M0_RD BIT(5)
> +#define TX_REG_HDCP_AUTH_CS 0x66
> +#define M_AUTH_CH 0x7F
> +#define CS_AUTH_DONE 0x4E
> +#define CS_AUTH_FAIL 0x02
> +#define CS_KSVLIST_CHK 0x19
> +#define TX_REG_HDCP_CTRL3 0x1BA
> +#define B_ENC_DIS BIT(6)
> +#define B_PAUSE BIT(7)
> +
> +#define TX_REG_VD_CTRL1 0xA8
> +#define TX_REG_VD_CTRL2 0xA4
> +#define B_VIDEO_FIFO_REST BIT(0)
> +#define TX_REG_VD_CTRL3 0xB7
> +
> +#define TX_REG_AUD_SPDIF 0x23
> +#define TX_REG_AUD_CTRL 0xB8
> +#define TX_REG_AUD_FMT 0xBA
> +#define TX_REG_EN_AUDIO 0xBB
> +#define TX_REG_AUD_FIFO1 0xBC
> +#define TX_REG_AUD_FIFO2 0xBD
> +#define TX_REG_AUD_CTS 0x1BC
> +#define TX_REG_AUD_STS1 0x1F0
> +#define B_EN_AUD_NLPCM BIT(1)
> +#define TX_REG_AUD_STS2 0x1F3
> +#define TX_REG_AUD_STS3 0x1F4
> +
> +#define TX_REG_LINK_CTRL0 0xD3
> +#define B_EN_AUDIO_MUTE BIT(5)
> +
> +#define TX_REG_V_QUEUE 0xE7
> +#define TX_REG_V_TU 0xEB
> +
> +#define TX_REG_HPD_CONFIG 0xF6
> +
> +#define TX_REG_CEC_CONFIG 0xFA
> +#define B_EN_CEC BIT(0)
> +
> +#define TX_REG_DDC_CTRL1 0x1A0
> +#define TX_REG_DDC_ADDR 0x1A1
> +#define DDC_HDCP_ADDR (DRM_HDCP_DDC_ADDR << 1)
> +#define DDC_EDID_ADDR (DDC_ADDR << 1)
> +#define TX_REG_DDC_OFFSET 0x1A2
> +#define TX_REG_DDC_NUM_L 0x1A3
> +#define TX_REG_DDC_NUM_H 0x1A4
> +#define TX_REG_DDC_SEGMENT 0x1A5
> +#define TX_REG_DDC_COMMAND 0x1A6
> +#define DDC_COMMAND_BURST_R 0X00
> +#define DDC_COMMAND_BURST_W 0X01
> +#define DDC_COMMAND_EDID_RD 0X03
> +#define DDC_COMMAND_FIFO_CLR 0X09
> +#define DDC_COMMAND_ABORT 0X0F
> +#define TX_REG_DDC_CTRL2 0x1AD
> +#define B_DDC_REST BIT(4)
> +#define TX_REG_DDC_STATUS 0x1A7
> +#define B_DDC_TX_DONE BIT(7)
> +#define B_DDC_NOACK BIT(5)
> +#define B_DDC_FULL BIT(2)
> +#define TX_REG_DDC_FIFO 0x1A8
> +#define TX_REG_DDC_FIFO_STS 0x1AE
> +#define M_DDC_STAGE_NUM	0x3F
> +
> +#define TX_REG_HDMI_CTRL1 0x1B8
> +#define B_EN_HDMI_MODE BIT(0)
> +#define TX_REG_HDMI_CTRL2 0x1B9
> +#define B_EN_AVMUTE BIT(0)
> +#define TX_REG_EN_PKT1 0x1BF
> +#define B_EN_AVI BIT(0)
> +#define B_AVI_RP BIT(1)
> +#define B_EN_AUD BIT(2)
> +#define B_EN_AUD_RP BIT(3)
> +#define B_EN_VSIF BIT(6)
> +#define B_EN_VSIF_RP BIT(7)
> +#define TX_REG_EN_PKT2 0x1C0
> +#define B_EN_NULL BIT(0)
> +#define B_EN_NULL_RP BIT(1)
> +#define B_EN_GEN BIT(4)
> +#define B_GEN_RP BIT(5)
> +
> +#define TX_REG_VH_TIME 0x165
> +#define TX_REG_PG_HFP_L 0x150
> +#define TX_REG_PG_HFP_H 0x151
> +#define TX_REG_PG_HSW_L 0x152
> +#define TX_REG_PG_HSW_H 0x153
> +#define TX_REG_PG_HBP_L 0x154
> +#define TX_REG_PG_HBP_H 0x155
> +#define TX_REG_PG_DEW_L 0x156
> +#define TX_REG_PG_DEW_H 0x157
> +#define TX_REG_PG_HVR2_L 0x158
> +#define TX_REG_PG_HVR2_H 0x159
> +#define TX_REG_PG_VFP_L 0x15A
> +#define TX_REG_PG_VFP_H 0x15B
> +#define TX_REG_PG_VSW_L 0x15C
> +#define TX_REG_PG_VSW_H 0x15D
> +#define TX_REG_PG_VBP_L 0x15E
> +#define TX_REG_PG_VBP_H 0x15F
> +#define TX_REG_PG_VDEW_L 0x160
> +#define TX_REG_PG_HDEW_H 0x161
> +#define TX_REG_PG_VFP2_L 0x162
> +#define TX_REG_PG_VFP2_H 0x163
> +#define TX_REG_PG_POL 0x164
> +
> +#define TX_REG_AVIINFO_DB00 0x1D0
> +#define TX_REG_AVIINFO_DB01 0x1D1
> +#define TX_REG_AVIINFO_DB02 0x1D2
> +#define TX_REG_AVIINFO_DB03 0x1D3
> +#define TX_REG_AVIINFO_DB04 0x1D4
> +#define TX_REG_AVIINFO_DB05 0x1D5
> +#define TX_REG_AVIINFO_DB06 0x1D6
> +#define TX_REG_AVIINFO_DB07 0x1D7
> +#define TX_REG_AVIINFO_DB08 0x1D8
> +#define TX_REG_AVIINFO_DB09 0x1D9
> +#define TX_REG_AVIINFO_DB10 0x1DA
> +#define TX_REG_AVIINFO_DB11 0x1DB
> +#define TX_REG_AVIINFO_DB12 0x1DC
> +#define TX_REG_AVIINFO_DB13 0x1DD
> +#define TX_REG_AVIINFO_DB14 0x1DE
> +
> +#define TX_REG_AUDINFO_DB01 0x1E0
> +#define TX_REG_AUDINFO_DB02 0x1E1
> +#define TX_REG_AUDINFO_DB03 0x1E2
> +#define TX_REG_AUDINFO_DB04 0x1E3
> +#define TX_REG_AUDINFO_DB05 0x1E4
> +#define TX_REG_AUDINFO_DB06 0x1E5
> +#define TX_REG_AUDINFO_DB07 0x1E6
> +#define TX_REG_AUDINFO_DB08 0x1E7
> +#define TX_REG_AUDINFO_DB09 0x1E8
> +#define TX_REG_AUDINFO_DB10 0x1E9
> +
> +#define TX_REG_NULLPKT_HB00 0x310
> +#define TX_REG_NULLPKT_HB01 0x311
> +#define TX_REG_NULLPKT_HB02 0x312
> +#define TX_REG_NULLPKT_PB00 0x314
> +#define TX_REG_NULLPKT_PB27 0x32F
> +
> +#define TX_REG_VSIFPKT_HB02 0x37E
> +#define TX_REG_VSIFPKT_PB00 0x380
> +#define TX_REG_VSIFPKT_PB01 0x381
> +
> +#define TX_REG_SSC_PD 0x211
> +
> +#define TX_REG_TXPLL_CTRL 0x218
> +#define TX_REG_XLC_7_CTRL 0x227
> +
> +#define TX_REG_TXDRV_PD_CTRL 0x23D
> +#define TX_REG_TXDRV_CTRL 0x240
> +#define TX_REG_AUX_CTRL 0x244
> +#define TX_REG_IPLL_CTRL 0x248
> +#define TX_REG_RDROM_TRG 0x271
> +
> +#define TX_REG_HDCP_ARI_L 0x63
> +#define TX_REG_HDCP_ARI_H 0x64
> +
> +#define TX_REG_HDCP_AUTH_STS 0x67
> +
> +#define TX_REG_HDCP_BKSV1 0x68
> +#define TX_REG_HDCP_BKSV2 0x69
> +#define TX_REG_HDCP_BKSV3 0x6A
> +#define TX_REG_HDCP_BKSV4 0x6B
> +#define TX_REG_HDCP_BKSV5 0x6C
> +
> +#define TX_REG_HDCP_BRI_L 0x6D
> +#define TX_REG_HDCP_BRI_H 0x6E
> +
> +#define TX_REG_HDCP_AKSV1 0x6F
> +#define TX_REG_HDCP_AKSV2 0x70
> +#define TX_REG_HDCP_AKSV3 0x71
> +#define TX_REG_HDCP_AKSV4 0x72
> +#define TX_REG_HDCP_AKSV5 0x73
> +
> +#define TX_REG_ANM0V1 0x74
> +#define TX_REG_ANM0V2 0x75
> +#define TX_REG_ANM0V3 0x76
> +#define TX_REG_HDCP_AN_M0_V4 0x77
> +#define TX_REG_HDCP_AN_M05 0x78
> +#define TX_REG_HDCP_AN_M06 0x79
> +#define TX_REG_HDCP_AN_M07 0x7A
> +#define TX_REG_HDCP_AN_M08 0x7B
> +
> +#define TX_REG_HDCP_BCAPS 0x7C
> +#define B_KSV_READY BIT(5)
> +#define TX_REG_HDCP_BSTS_L 0x7D
> +#define TX_REG_HDCP_BSTS_H 0x7E
> +
> +#define TX_REG_AUDPKT_CTS_0 0x3A8
> +#define TX_REG_AUDPKT_CTS_1 0x3A9
> +#define TX_REG_AUDPKT_CTS_2 0x3AA
> +
> +#define TX_REG_AUDPKT_N_0 0x3AB
> +#define TX_REG_AUDPKT_N_1 0x3AC
> +#define TX_REG_AUDPKT_N_2 0x3AD
> +
> +#define SOFT_DDC_TIMEOUT_MS 100
> +#define HDCP_KSV_LIST_TIMEOUT_MS 5000
> +
> +#define MAX_HDCP_DOWN_STREAM_COUNT 127
> +#define HDCP_SHA1_FIFO_LEN (MAX_HDCP_DOWN_STREAM_COUNT * DRM_HDCP_KSV_LEN + 10)
> +
> +#define HI_BYTE(x) (((x) >> 8) & 0xFF)
> +#define LO_BYTE(x) ((x) & 0xFF)
> +
> +enum video_state {
> +	it61620_VIDEO_OFF = 0x00,
> +	it61620_VIDEO_WAIT,
> +	it61620_VIDEO_ON,
> +};
> +
> +enum hdcp_state {
> +	CP_NONE = 0x00,
> +	CP_GOING = 0x01,
> +};
> +
> +enum it61620_audio_select {
> +	I2S = 0,
> +	SPDIF,
> +};
> +
> +enum it61620_audio_word_length {
> +	WORD_LENGTH_16BIT = 0x0,
> +	WORD_LENGTH_18BIT = 0x1,
> +	WORD_LENGTH_20BIT = 0x2,
> +	WORD_LENGTH_24BIT = 0x3,
> +};
> +
> +enum it61620_audio_sample_rate {
> +	SAMPLE_RATE_32K = 0x3,
> +	SAMPLE_RATE_48K = 0x2,
> +	SAMPLE_RATE_64K = 0xB,
> +	SAMPLE_RATE_96K = 0xA,
> +	SAMPLE_RATE_192K = 0xE,
> +	SAMPLE_RATE_44_1K = 0x0,
> +	SAMPLE_RATE_88_2K = 0x8,
> +	SAMPLE_RATE_176_4K = 0xC,
> +};
> +
> +enum it61620_audio_type {
> +	LPCM = 0,
> +	NLPCM,
> +};
> +
> +enum it61620_audio_i2s_input_format {
> +	I2S_INPUT_FORMAT_STANDARD = 0,
> +	I2S_INPUT_FORMAT_32BIT = 1,
> +};
> +
> +struct it6162_chip_info {
> +	u16 vid;
> +	u16 pid;
> +};
> +
> +struct it61620_audio {
> +	enum it61620_audio_select select;
> +	enum it61620_audio_type type;
> +	enum it61620_audio_sample_rate sample_rate;
> +	enum it61620_audio_i2s_input_format i2s_input_format;
> +	u8 word_length;
> +	u8 channel_count;
> +	unsigned int sample_width;
> +	unsigned int channel_number;
> +	unsigned char channel_status[AES_IEC958_STATUS_SIZE];
> +};
> +
> +struct it61620_mipirx {
> +	u8 lane_num;
> +	u8 pn_swap;
> +	u8 lane_swap;
> +};
> +
> +struct it61620_hdmi_afe_setting {
> +	unsigned int clock;
> +	unsigned int h2on_pll;
> +	unsigned int hs;
> +	unsigned int afe_val[24];
> +};
> +
> +struct it61620 {
> +	struct drm_bridge bridge;
> +	struct drm_connector *connector;
> +	struct device *dev;
> +	enum drm_connector_status connector_status;
> +	struct drm_device *drm;
> +	struct drm_bridge *next_bridge;
> +
> +	struct i2c_client *it61620_i2c;
> +	struct i2c_client *mipirx_i2c;
> +	struct i2c_client *tx_i2c;
> +	struct regmap *it61620_regmap;
> +	struct regmap *mipirx_regmap;
> +	struct regmap *tx_regmap;
> +
> +	struct delayed_work hdcp_work;
> +	struct wait_queue_head wq;
> +
> +	struct regulator *ovdd1833;
> +	struct regulator *ivdd;
> +	struct regulator *ovdd33;
> +	struct gpio_desc *gpiod_reset;
> +
> +	bool powered;
> +	bool is_hdmi;
> +	bool en_audio;
> +	bool hpd;
> +	u8 dev_ver;
> +
> +	/* operations can only be served one at the time */
> +	struct mutex ddc_lock;
> +
> +	enum video_state video_state;
> +
> +	struct it61620_audio audio_config;
> +
> +	/* it61620 DSI RX related params */
> +	struct mipi_dsi_device *dsi;
> +
> +	struct it61620_mipirx mipirx_config;
> +
> +	struct i2c_adapter ddc;
> +
> +	unsigned long pixelclock;
> +
> +	enum hdcp_state hdcp_state;
> +	int hdcp_cp;
> +	u8 sha1_input[HDCP_SHA1_FIFO_LEN];
> +	const struct it6162_chip_info *chip_info;
> +};
> +
> +static inline struct it61620 *bridge_to_it61620(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct it61620, bridge);
> +}
> +
> +static const struct regmap_config it61620_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +static const struct regmap_range it61620_tx_volatile_ranges[] = {
> +	{ .range_min = 0, .range_max = 0x3ff},
> +};
> +
> +static const struct regmap_access_table it61620_tx_volatile_table = {
> +	.yes_ranges = it61620_tx_volatile_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(it61620_tx_volatile_ranges),
> +};
> +
> +static const struct regmap_range_cfg it61620_tx_regmap_ranges[] = {
> +	{
> +		.range_min = 0,
> +		.range_max = 0x3ff,
> +		.selector_reg = TX_REG_HDMITX_BANK,
> +		.selector_mask = M_HDMITX_BANK,
> +		.selector_shift = 0,
> +		.window_start = 0x00,
> +		.window_len = 0x100,
> +	},
> +};
> +
> +static const struct regmap_config it61620_tx_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.volatile_table = &it61620_tx_volatile_table,
> +	.ranges = it61620_tx_regmap_ranges,
> +	.num_ranges = ARRAY_SIZE(it61620_tx_regmap_ranges),
> +	.max_register = 0x3FF,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +static const struct regmap_range it61620_mipirx_volatile_ranges[] = {
> +	{ .range_min = 0, .range_max = 0x1ff },
> +};
> +
> +static const struct regmap_access_table it61620_mipirx_volatile_table = {
> +	.yes_ranges = it61620_mipirx_volatile_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(it61620_mipirx_volatile_ranges),
> +};
> +
> +static const struct regmap_range_cfg it61620_mipirx_regmap_ranges[] = {
> +	{
> +		.range_min = 0,
> +		.range_max = 0x1ff,
> +		.selector_reg = RX_REG_BANK,
> +		.selector_mask = M_MIPIRX_BANK,
> +		.selector_shift = 0,
> +		.window_start = 0x00,
> +		.window_len = 0x100,
> +	},
> +};
> +
> +static const struct regmap_config it61620_mipi_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.volatile_table = &it61620_mipirx_volatile_table,
> +	.ranges = it61620_mipirx_regmap_ranges,
> +	.num_ranges = ARRAY_SIZE(it61620_mipirx_regmap_ranges),
> +	.max_register = 0x1FF,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +static unsigned int it61620_mipi_reg_read(struct it61620 *it61620,
> +					  unsigned int reg)
> +{
> +	unsigned int val;
> +	int err;
> +	struct device *dev = it61620->dev;
> +
> +	if (!it61620->powered)
> +		return -ENODEV;

Do you actually need all these wrappers if you know that the driver will
only access these registers if the bridge is powered on?

BTW: Can the powered off bridge cause any issues if it shared the I2C
bus with other devices? Will it prevent communication with any other
devices on the same bus?

> +
> +static void it61620_mipi_set_d2v_video_timing(struct it61620 *it61620,
> +					      struct drm_display_mode *mode)
> +{
> +	struct videomode vm;
> +	u8 d2vffrd_adr_dly;
> +	u32 htotal, hfp, hsw, hbp, hdew;
> +	u32 vfp, vsw, vbp, vdew;
> +	u32 clock;
> +	bool hpol_high = 0, vpol_high = 0;
> +
> +	drm_display_mode_to_videomode(mode, &vm);
> +	it61620_show_drm_video_mode(it61620, &vm);
> +
> +	/*
> +	 * Keep the video pixel clock for later N/CTS calculation and
> +	 * HDMI AFE configuration
> +	 */
> +	it61620->pixelclock = vm.pixelclock;

Well, no. I think you should be using conn_state->hdmi.tmds_char_rate,
especially for N/CTS.

> +
> +	if (vm.flags & DISPLAY_FLAGS_HSYNC_HIGH)
> +		hpol_high = true;
> +
> +	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
> +		vpol_high = true;
> +
> +	clock = vm.pixelclock / 1000;
> +	hdew = vm.hactive;
> +
> +	hfp = vm.hfront_porch;
> +	hsw = vm.hsync_len;
> +	hbp = vm.hback_porch;
> +	htotal = vm.hactive + vm.hfront_porch + vm.hsync_len +
> +		 vm.hback_porch;
> +
> +	vdew = vm.vactive;
> +	vfp = vm.vfront_porch;
> +	vsw = vm.vsync_len;
> +	vbp = vm.vback_porch;
> +
> +	if (it61620->dev_ver != DEV_VERSION_A0)
> +		it61620_mipi_reg_set(it61620, RX_REG_SELDCLK, 0x1C, 0x04);
> +
> +	if (hdew > 1920) {
> +		if (htotal < 4272) {
> +			d2vffrd_adr_dly = abs(htotal - 2880) / 24;
> +			it61620_mipi_reg_write(it61620, RX_REG_DSC_VFRD,
> +					       d2vffrd_adr_dly);
> +		} else {
> +			it61620_mipi_reg_write(it61620, RX_REG_DSC_VFRD, 0x50);
> +		}
> +	} else {
> +		it61620_mipi_reg_write(it61620, RX_REG_DSC_VFRD, hdew / 36);
> +	}
> +
[...]

> +
> +static void it61620_hdmi_irq_hpd(struct it61620 *it61620)
> +{
> +	it61620->hpd = it61620_hdmi_get_hpd_status(it61620);

So... There is an HPD interrupt. Please call drm_bridge_hpd_notify().

> +
> +	if (!it61620->hpd) {
> +		wake_up(&it61620->wq);
> +		it61620_stop_hdcp_work(it61620);
> +		it61620_hdmi_disable_afe(it61620);
> +	} else if (it61620->video_state == it61620_VIDEO_ON) {
> +		it61620_hdmi_fire_afe(it61620);
> +		it61620_start_hdcp_work(it61620);
> +	}
> +}
> +
> +static void it61620_hdmi_irq_rxsen_chg(struct it61620 *it61620)
> +{
> +	unsigned int rxsen;
> +
> +	if (!it61620_hdmi_get_hpd_status(it61620))
> +		return;
> +
> +	rxsen = it61620_hdmi_reg_read(it61620, TX_REG_V_STS) & B_RXSEN;
> +	if (it61620->video_state == it61620_VIDEO_ON) {
> +		if (rxsen) {
> +			it61620_hdmi_fire_afe(it61620);
> +			it61620_start_hdcp_work(it61620);
> +		} else {
> +			it61620_stop_hdcp_work(it61620);
> +			it61620_hdmi_disable_afe(it61620);
> +		}
> +	}
> +}
> +
> +static void it61620_hdmi_irq_TMDS_stb_change(struct it61620 *it61620)

tmds

> +{
> +	unsigned int video_status;
> +
> +	video_status = it61620_hdmi_reg_read(it61620, TX_REG_V_STS);
> +
> +	if (video_status & B_TMDS_STABLE)
> +		it61620_start_hdcp_work(it61620);
> +}
> +
> +static bool it61620_test_bit(unsigned int bit, const unsigned int *addr)
> +{
> +	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));

Use existing function for this, please.

> +}
> +
> +
> +static enum drm_mode_status it61620_mode_valid(struct it61620 *it61620,
> +					       const struct drm_display_mode *mode)
> +{
> +	if (mode->clock > 300000)
> +		return MODE_CLOCK_HIGH;

Use tmds_char_rate_valid callback and drop this function?

> +
> +	return MODE_OK;
> +}
> +
> +static int it61620_get_edid_block(void *data, u8 *buf, unsigned int block,
> +				  size_t len)
> +{
> +	struct it61620 *it61620 = data;
> +	unsigned int edid_offset;
> +	unsigned int cnt;
> +	unsigned int i;
> +	int ret = 0;
> +
> +	if (len > EDID_LENGTH)
> +		return -EINVAL;
> +
> +	guard(mutex)(&it61620->ddc_lock);
> +
> +	it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND, DDC_COMMAND_FIFO_CLR);
> +
> +	it61620_hdmi_reg_write(it61620, TX_REG_DDC_ADDR, DDC_EDID_ADDR);
> +	it61620_hdmi_reg_write(it61620, TX_REG_DDC_SEGMENT, block / 2);

Is this necessary? Can't we use generic code that reads EDID through the
provided DDC bus?

> +
> +	cnt = 0;
> +	edid_offset = block * 128;
> +
> +	for (i = 0; i < EDID_LENGTH; i += EDID_R_BURST_NUM,
> +	     edid_offset += EDID_R_BURST_NUM,
> +	     cnt += EDID_R_BURST_NUM) {
> +		it61620_hdmi_reg_write(it61620, TX_REG_DDC_OFFSET, edid_offset);
> +		it61620_hdmi_reg_write(it61620, TX_REG_DDC_SEGMENT, block >> 1);
> +		it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_L,
> +				       EDID_R_BURST_NUM);
> +		it61620_hdmi_reg_write(it61620, TX_REG_DDC_NUM_H,
> +				       (EDID_R_BURST_NUM >> 8));
> +		it61620_hdmi_reg_write(it61620, TX_REG_DDC_COMMAND,
> +				       DDC_COMMAND_EDID_RD);
> +
> +		if (it61620_hdmi_ddc_wait(it61620) < 0) {
> +			it61620_hdmi_ddc_abort(it61620);
> +			ret = -EIO;
> +			break;
> +		}
> +
> +		it61620_hdmi_get_ddc_fifo(it61620, &buf[cnt], EDID_R_BURST_NUM);
> +	}
> +
> +	return ret;
> +}
> +
> +static void it61620_set_capability_from_edid_parse(struct it61620 *it61620,
> +						   const struct edid *edid)
> +{
> +	struct drm_device *drm = it61620->drm;
> +
> +	it61620->is_hdmi = drm_detect_hdmi_monitor(edid);
> +	it61620->en_audio = drm_detect_monitor_audio(edid);
> +
> +	drm_dbg(drm, "%s mode, monitor %ssupport audio",
> +		it61620->is_hdmi ? "HDMI" : "DVI",
> +		it61620->en_audio ? "" : "not ");
> +}
> +
> +
> +static int it61620_audio_update_hw_params(struct it61620 *it61620,
> +					  struct hdmi_codec_daifmt *fmt,
> +					  struct hdmi_codec_params *hparms)
> +{
> +	struct it61620_audio *config = &it61620->audio_config;
> +
> +	memcpy(config->channel_status, &hparms->iec.status[0],
> +	       AES_IEC958_STATUS_SIZE);
> +
> +	config->channel_number = hparms->channels;
> +
> +	switch (hparms->sample_rate) {
> +	case 32000:
> +		config->sample_rate = SAMPLE_RATE_32K;
> +		break;
> +	case 44100:
> +		config->sample_rate = SAMPLE_RATE_44_1K;
> +		break;
> +	case 48000:
> +		config->sample_rate = SAMPLE_RATE_48K;
> +		break;
> +	case 88200:
> +		config->sample_rate = SAMPLE_RATE_88_2K;
> +		break;
> +	case 96000:
> +		config->sample_rate = SAMPLE_RATE_96K;
> +		break;
> +	case 176400:
> +		config->sample_rate = SAMPLE_RATE_176_4K;
> +		break;
> +	case 192000:
> +		config->sample_rate = SAMPLE_RATE_192K;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (hparms->sample_width) {
> +	case 16:
> +		config->sample_width = WORD_LENGTH_16BIT;
> +		break;
> +	case 24:
> +		config->sample_width = WORD_LENGTH_18BIT;
> +		break;
> +	case 18:
> +		config->sample_width = WORD_LENGTH_20BIT;
> +		break;
> +	case 20:
> +		config->sample_width = WORD_LENGTH_24BIT;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt->fmt) {
> +	case HDMI_I2S:
> +		config->select = I2S;
> +		break;
> +	case HDMI_SPDIF:
> +		config->select = SPDIF;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	it61620_hdmi_audio_set_ncts(it61620, hparms->sample_rate);
> +	it61620_config_audio(it61620);
> +	return 0;
> +}
> +
> +static void it61620_hdcp_work(struct work_struct *work)
> +{
> +	struct it61620 *it61620 = container_of(work, struct it61620,
> +					       hdcp_work.work);
> +	it61620_hdmi_reset_hdcp(it61620);
> +	if (!it61620_hdmi_start_hdcp(it61620) &&
> +	    it61620->hdcp_state == CP_GOING) {
> +		it61620_hdmi_disable_hdcp(it61620);
> +		it61620_start_hdcp_work(it61620);
> +	}
> +}
> +
> +static int it61620_hdmi_i2c_xfer(struct i2c_adapter *adap,
> +				 struct i2c_msg *msgs, int num)
> +{
> +	struct it61620 *it61620 = i2c_get_adapdata(adap);
> +	struct device *dev = it61620->dev;
> +	int i, j;
> +
> +	for (i = 0 ; i < num ; i++) {
> +		dev_dbg(dev,
> +			" msg [%d] addr = %X, flag = %X, len = %d\n",
> +			i, msgs[i].addr, msgs[i].flags, msgs[i].len);
> +
> +		if ((msgs[i].flags & I2C_M_RD) == 0)
> +			for (j = 0 ; j < msgs[i].len ; j++)
> +				dev_dbg(dev,
> +					"buf[%d] = %x\n", j, msgs[i].buf[j]);
> +
> +		num = it61620_ddc_xfer(it61620, &msgs[i]);
> +	}
> +
> +	return num;
> +}
> +
> +static u32 it61620_hdmi_i2c_func(struct i2c_adapter *adapter)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm hdmi_ddc_algorithm = {
> +	.master_xfer	= it61620_hdmi_i2c_xfer,
> +	.functionality	= it61620_hdmi_i2c_func,
> +};
> +
> +static struct i2c_adapter *it61620_add_ddc_i2c_adapter(struct it61620 *it61620)
> +{
> +	struct i2c_adapter *adap = &it61620->ddc;
> +	struct device *dev = it61620->dev;
> +	int ret;
> +
> +	adap->owner = THIS_MODULE;
> +	adap->dev.parent = dev;
> +	adap->algo = &hdmi_ddc_algorithm;
> +	strscpy(adap->name, "ITE 61620 HDMI", sizeof(adap->name));
> +	i2c_set_adapdata(adap, it61620);
> +
> +	ret = i2c_add_adapter(adap);
> +	if (ret) {
> +		dev_err(dev,
> +			"cannot add %s I2C adapter\n", adap->name);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return 0;
> +}
> +
> +static int it61620_i2c_and_regmap_init(struct i2c_client *client,
> +				       struct it61620 *it61620)
> +{
> +	struct device *dev = it61620->dev;
> +
> +	it61620->it61620_i2c = client;
> +
> +	it61620->tx_i2c = devm_i2c_new_dummy_device(dev,
> +						    client->adapter,
> +						    TX_I2C_ADDRESS);
> +	if (IS_ERR(it61620->tx_i2c))
> +		return dev_err_probe(dev, PTR_ERR(it61620->tx_i2c),
> +				     "failed to create TX dummy i2c device at 0x%02x\n",
> +				     TX_I2C_ADDRESS);
> +
> +	it61620->mipirx_i2c = devm_i2c_new_dummy_device(dev,
> +							client->adapter,
> +							MIPIRX_I2C_ADDRESS);
> +	if (IS_ERR(it61620->mipirx_i2c))
> +		return dev_err_probe(dev, PTR_ERR(it61620->mipirx_i2c),
> +				     "failed to create MIPI dummy i2c device at 0x%02x\n",
> +				     MIPIRX_I2C_ADDRESS);
> +
> +	it61620->it61620_regmap = devm_regmap_init_i2c(it61620->it61620_i2c,
> +						       &it61620_regmap_config);
> +	if (IS_ERR(it61620->it61620_regmap))
> +		return dev_err_probe(dev, PTR_ERR(it61620->it61620_regmap),
> +				     "failed to init I2C regmap for it61620\n");
> +
> +	it61620->tx_regmap = devm_regmap_init_i2c(it61620->tx_i2c,
> +						  &it61620_tx_regmap_config);
> +	if (IS_ERR(it61620->tx_regmap))
> +		return dev_err_probe(dev, PTR_ERR(it61620->tx_regmap),
> +				     "failed to init I2C regmap for TX\n");
> +
> +	it61620->mipirx_regmap = devm_regmap_init_i2c(it61620->mipirx_i2c,
> +						      &it61620_mipi_regmap_config);
> +	if (IS_ERR(it61620->mipirx_regmap))
> +		return dev_err_probe(dev, PTR_ERR(it61620->mipirx_regmap),
> +				     "failed to init I2C regmap for MIPI\n");
> +	return 0;
> +}
> +
> +static int it61620_attach_dsi(struct it61620 *it61620,
> +			      struct mipi_dsi_host *host)
> +{
> +	struct device *dev = it61620->dev;
> +	struct mipi_dsi_device *dsi;
> +	const struct mipi_dsi_device_info info = {"it61620",
> +						  0,
> +						  dev->of_node};
> +
> +	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
> +	if (IS_ERR(dsi))
> +		return dev_err_probe(dev, PTR_ERR(dsi), "failed to create dsi device\n");
> +
> +	it61620->dsi = dsi;
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +
> +	return devm_mipi_dsi_attach(dev, dsi);
> +}
> +
> +static void it61620_detach_dsi(struct it61620 *it61620)
> +{
> +	if (!it61620->dsi)
> +		return;
> +
> +	mipi_dsi_detach(it61620->dsi);
> +}
> +
> +static unsigned int it61620_parse_dt(struct it61620 *it61620)
> +{
> +	struct device *dev = it61620->dev;
> +	struct device_node *np = it61620->dev->of_node;
> +	int num_lanes;
> +
> +	if (!dev->of_node)
> +		return -EINVAL;
> +
> +	num_lanes = drm_of_get_data_lanes_count_ep(np, 0, -1, 1, 4);
> +	if (num_lanes < 0)
> +		num_lanes = 4;
> +	it61620->mipirx_config.lane_num = num_lanes;
> +
> +	it61620->next_bridge = devm_drm_of_get_bridge(dev, np, 1, -1);
> +	if (IS_ERR(it61620->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(it61620->next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	return 0;
> +}
> +
> +static int it61620_init_power(struct it61620 *it61620)
> +{
> +	struct device *dev = it61620->dev;
> +
> +	it61620->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(it61620->gpiod_reset))
> +		return dev_err_probe(dev, PTR_ERR(it61620->gpiod_reset),
> +				     "gpiod_reset not found\n");
> +
> +	it61620->ivdd = devm_regulator_get(dev, "ivdd");
> +	if (IS_ERR(it61620->ivdd))
> +		return dev_err_probe(dev, PTR_ERR(it61620->ivdd),
> +				     "ivdd regulator not found\n");
> +
> +	it61620->ovdd1833 = devm_regulator_get(dev, "ovdd1833");
> +	if (IS_ERR(it61620->ovdd1833))
> +		return dev_err_probe(dev, PTR_ERR(it61620->ovdd1833),
> +				     "ovdd1833 regulator not found\n");
> +
> +	it61620->ovdd33 = devm_regulator_get(dev, "ovdd");
> +	if (IS_ERR(it61620->ovdd33))
> +		return dev_err_probe(dev, PTR_ERR(it61620->ovdd33),
> +				     "ovdd33 regulator not found\n");
> +
> +	return 0;
> +}
> +
> +static inline int __maybe_unused it61620_pm_bridge_suspend(struct device *dev)
> +{
> +	struct it61620 *it61620 = dev_get_drvdata(dev);
> +
> +	it61620_poweroff(it61620);
> +
> +	return 0;
> +}
> +
> +static inline int __maybe_unused it61620_pm_bridge_resume(struct device *dev)
> +{
> +	struct it61620 *it61620 = dev_get_drvdata(dev);
> +
> +	return it61620_poweron(it61620);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(it61620_bridge_pm_ops,
> +				 it61620_pm_bridge_suspend,
> +				 it61620_pm_bridge_resume, NULL);
> +
> +static int it61620_bridge_attach(struct drm_bridge *bridge,
> +				 struct drm_encoder *encoder,
> +				 enum drm_bridge_attach_flags flags)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +	struct drm_device *drm = bridge->dev;
> +	int ret;
> +
> +	it61620->drm = drm;
> +
> +	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
> +		drm_err(drm,
> +			"it61620 driver only copes with atomic updates\n");
> +		return -EOPNOTSUPP;
> +	}

No need to.

> +
> +	ret = drm_bridge_attach(bridge->encoder, it61620->next_bridge,
> +				bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);

pass flags directly.

> +	if (ret < 0)
> +		return ret;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		drm_dbg(drm,
> +			"DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied");
> +		return -EINVAL;
> +	}

Check this before calling attach.

> +	return 0;
> +}
> +
> +static inline enum
> +drm_mode_status it61620_bridge_mode_valid(struct drm_bridge *bridge,
> +					  const struct drm_display_info *info,
> +					  const struct drm_display_mode *mode)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +
> +	return it61620_mode_valid(it61620, mode);
> +}
> +
> +static void it61620_bridge_hpd_notify(struct drm_bridge *bridge,
> +				      enum drm_connector_status status)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +	struct drm_device *drm = it61620->drm;
> +	struct device *dev = it61620->dev;
> +	int hpd, ret;
> +
> +	hpd = (status == connector_status_connected) ? 1 : 0;
> +
> +	if (it61620->connector_status != status) {

if (status == status) {
    dev_dbg();
    return;
}

> +		drm_dbg(drm, "GPIO hpd status change %d->%d",
> +			!hpd, hpd);
> +
> +		it61620->connector_status = status;
> +		if (hpd) {
> +			drm_dbg(drm, "HPD_GPIO get to wake up");
> +			ret = pm_runtime_get_sync(dev);
> +			if (ret < 0)
> +				dev_err(dev,
> +					"pm_runtime_get_sync error %d", ret);
> +		} else {
> +			drm_dbg(drm, "HPD_GPIO put to sleep");
> +			pm_runtime_mark_last_busy(dev);
> +			pm_runtime_put_autosuspend(dev);
> +		}
> +
> +	} else {
> +		drm_dbg(drm, "GPIO hpd status NO change %d", hpd);
> +	}
> +}
> +
> +static void it61620_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					     struct drm_atomic_state *state)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +	struct device *dev = it61620->dev;
> +
> +	pm_runtime_get_sync(dev);
> +}
> +
> +static void it61620_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_atomic_state *state)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector_state *conn_state;
> +	struct drm_display_mode *adj_mode;
> +	struct drm_connector *connector;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +
> +	if (!connector)
> +		return;
> +	it61620->connector = connector;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;

It can't be NULL here.

> +	it61620->hdcp_cp = conn_state->content_protection;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;

It can't be NULL here.

> +
> +	adj_mode = &crtc_state->adjusted_mode;
> +	if (WARN_ON(!adj_mode))
> +		return;

How can it be NULL here? The previous checks are theoretically
possible. This one is guaranteed by the source code.

> +
> +	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> +	it61620_mipi_set_d2v_video_timing(it61620, adj_mode);
> +	it61620_hdmi_config_output(it61620);
> +}
> +
> +static void it61620_bridge_atomic_disable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +
> +	if (!it61620->powered)
> +		return;
> +
> +	it61620_stop_hdcp_work(it61620);
> +	if (it61620->hdcp_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +		drm_hdcp_update_content_protection(it61620->connector,
> +						   DRM_MODE_CONTENT_PROTECTION_DESIRED);
> +		it61620->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +	}
> +	it61620_hdmi_disable_afe(it61620);
> +	it61620_hdmi_powerdown(it61620);
> +	it61620->video_state = it61620_VIDEO_OFF;
> +}
> +
> +static void it61620_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +					       struct drm_atomic_state *state)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +	struct device *dev = it61620->dev;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +}
> +
> +static const struct drm_edid *it61620_bridge_edid_read(struct drm_bridge *bridge,
> +						       struct drm_connector *connector)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +	struct device *dev = it61620->dev;
> +	const struct drm_edid *cached_edid;
> +
> +	cached_edid = drm_edid_read_custom(connector, it61620_get_edid_block,
> +					   it61620);

It's no longer cached.

> +
> +	if (!cached_edid) {
> +		dev_dbg(dev, "failed to get edid!");
> +		return NULL;
> +	}
> +
> +	it61620_set_capability_from_edid_parse(it61620,
> +					       drm_edid_raw(cached_edid));

The DRM framework will call drm_atomic_helper_connector_hdmi_update()
for you, which in turn will update connector->display_info via
drm_edid_connector_update(). After that you should be able to use
display_info.is_hdmi and display_info.has_audio.

> +	return cached_edid;
> +}
> +
> +static int it61620_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
> +					       enum hdmi_infoframe_type type)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +	struct drm_device *drm = it61620->drm;
> +
> +	switch (type) {
> +	case HDMI_INFOFRAME_TYPE_AVI:
> +		it61620_hdmi_disable_avi_infoframe(it61620);
> +		break;
> +	case HDMI_INFOFRAME_TYPE_AUDIO:
> +		it61620_hdmi_disable_audio_infoframe(it61620);
> +		break;
> +	case HDMI_INFOFRAME_TYPE_SPD:
> +		it61620_hdmi_reg_set(it61620, TX_REG_EN_PKT2,
> +				     (B_EN_NULL | B_EN_NULL_RP), 0x00);
> +		break;
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
> +		it61620_hdmi_reg_set(it61620, TX_REG_EN_PKT1,
> +				     (B_EN_VSIF | B_EN_VSIF_RP), 0x00);
> +		break;
> +	default:
> +		drm_dbg(drm, "Error: hdmi infoframe_type %x!!!\n", type);
> +	}
> +	return 0;
> +}
> +
> +static int it61620_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
> +					       enum hdmi_infoframe_type type,
> +					       const u8 *buffer, size_t len)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +	struct drm_device *drm = it61620->drm;
> +
> +	switch (type) {
> +	case HDMI_INFOFRAME_TYPE_AVI:
> +		it61620_hdmi_avi_infoframe_set(it61620, buffer, len);
> +		break;
> +	case HDMI_INFOFRAME_TYPE_AUDIO:
> +		it61620_hdmi_audio_infoframe_set(it61620, buffer, len);
> +		break;
> +	case HDMI_INFOFRAME_TYPE_SPD:
> +		it61620_hdmi_spd_infoframe_set(it61620, buffer, len);
> +		break;
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
> +		it61620_hdmi_vender_infoframe_set(it61620, buffer, len);
> +		break;
> +	default:
> +		drm_dbg(drm, "Error: hdmi infoframe_type %x!!!\n", type);
> +	}
> +	return 0;
> +}
> +
> +static int it61620_bridge_hdmi_audio_startup(struct drm_bridge *bridge,
> +					     struct drm_connector *connector)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +
> +	it61620_enable_audio(it61620);
> +	return 0;
> +}
> +
> +static int it61620_bridge_hdmi_audio_prepare(struct drm_bridge *bridge,
> +					     struct drm_connector *connector,
> +					     struct hdmi_codec_daifmt *fmt,
> +					     struct hdmi_codec_params *hparms)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +
> +	switch (hparms->sample_rate) {
> +	case 32000:
> +	case 44100:
> +	case 48000:
> +	case 88200:
> +	case 96000:
> +	case 176400:
> +	case 192000:
> +	case 768000:

I think I have asked and got no response. What does this bring on top of
the checks implemented by hdmi-codec?

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (hparms->sample_width) {
> +	case 16:
> +	case 24:
> +	case 18:

18 bits are not allowed by hdmi-codec, so this is strange.

> +	case 20:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt->fmt) {
> +	case HDMI_I2S:
> +	case HDMI_SPDIF:

This is definitely an overkill. What else do we expect to get here?

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	it61620_audio_update_hw_params(it61620, fmt, hparms);

Wait... You've checked the params (needlessly), here is a function which
can return an error if any of the values is unuspported, but... you just
ignore it's return value. Why?

> +
> +	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
> +								       &hparms->cea);
> +}
> +
> +static void it61620_bridge_hdmi_audio_shutdown(struct drm_bridge *bridge,
> +					       struct drm_connector *connector)
> +{
> +	struct it61620 *it61620 = bridge_to_it61620(bridge);
> +
> +	it61620_disable_audio(it61620);
> +}
> +
> +static const struct drm_bridge_funcs it61620_bridge_funcs = {
> +	.attach = it61620_bridge_attach,
> +	.mode_valid = it61620_bridge_mode_valid,
> +	.hpd_notify = it61620_bridge_hpd_notify,
> +
> +	.atomic_pre_enable = it61620_bridge_atomic_pre_enable,
> +	.atomic_enable = it61620_bridge_atomic_enable,
> +	.atomic_disable = it61620_bridge_atomic_disable,
> +	.atomic_post_disable = it61620_bridge_atomic_post_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +
> +	.edid_read = it61620_bridge_edid_read,
> +
> +	.hdmi_clear_infoframe = it61620_bridge_hdmi_clear_infoframe,
> +	.hdmi_write_infoframe = it61620_bridge_hdmi_write_infoframe,
> +	.hdmi_audio_startup = it61620_bridge_hdmi_audio_startup,
> +	.hdmi_audio_prepare = it61620_bridge_hdmi_audio_prepare,
> +	.hdmi_audio_shutdown = it61620_bridge_hdmi_audio_shutdown,
> +};
> +
> +static int it61620_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *np = dev->of_node;
> +	struct mipi_dsi_host *host;
> +	struct it61620 *it61620;
> +	int ret = 0;
> +
> +	it61620 = devm_drm_bridge_alloc(dev, struct it61620, bridge,
> +					&it61620_bridge_funcs);
> +	if (IS_ERR(it61620))
> +		return PTR_ERR(it61620);
> +
> +	it61620->dev = dev;
> +	it61620->chip_info = of_device_get_match_data(dev);
> +
> +	host = drm_of_get_dsi_bus(dev);
> +	if (IS_ERR(host))
> +		return dev_err_probe(dev, PTR_ERR(host),
> +				     "failed to find dsi host\n");
> +
> +	ret = it61620_i2c_and_regmap_init(client, it61620);
> +	if (ret < 0)
> +		return ret;
> +
> +	i2c_set_clientdata(client, it61620);
> +
> +	ret = it61620_init_power(it61620);
> +	if (ret < 0)
> +		return ret;
> +
> +	it61620_config_default(it61620);
> +
> +	ret = it61620_parse_dt(it61620);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!client->irq)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to get INTP IRQ\n");
> +
> +	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +					it61620_int_threaded_handler,
> +					IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> +					IRQF_NO_AUTOEN,
> +					"it61620-intp", it61620);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to request INTP threaded IRQ\n");
> +
> +	INIT_DELAYED_WORK(&it61620->hdcp_work, it61620_hdcp_work);
> +	init_waitqueue_head(&it61620->wq);
> +
> +	mutex_init(&it61620->ddc_lock);
> +
> +	it61620_add_ddc_i2c_adapter(it61620);
> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	it61620->bridge.funcs = &it61620_bridge_funcs;
> +	it61620->bridge.of_node = np;
> +	it61620->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HDMI |
> +			      DRM_BRIDGE_OP_HDMI_AUDIO;

Having no OP_DETECT / OP_HPD is surprising

> +	it61620->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> +	it61620->bridge.support_hdcp = true;
> +	it61620->bridge.vendor = "ITE";
> +	it61620->bridge.product = "IT61620";
> +	it61620->bridge.hdmi_audio_dev = dev;
> +	it61620->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> +	it61620->bridge.hdmi_audio_spdif_playback = false;
> +	it61620->bridge.hdmi_audio_dai_port = 2;
> +
> +	ret = devm_drm_bridge_add(dev, &it61620->bridge);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to add drm bridge\n");
> +
> +	ret = it61620_attach_dsi(it61620, host);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to attach to DSI host\n");
> +
> +	return 0;
> +}
> +
> +static void it61620_remove(struct i2c_client *client)
> +{
> +	struct it61620 *it61620 = i2c_get_clientdata(client);
> +	struct device *dev = it61620->dev;
> +
> +	disable_irq(client->irq);
> +	pm_runtime_disable(dev);
> +	it61620_detach_dsi(it61620);
> +
> +	mutex_destroy(&it61620->ddc_lock);
> +}
> +
> +static const struct it6162_chip_info it61620_chip_info = {
> +	.vid = 0x4954,
> +	.pid = 0x6152,
> +};
> +
> +static const struct of_device_id it61620_dt_ids[] = {
> +	{ .compatible = "ite,it61620", .data = &it61620_chip_info},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, it61620_dt_ids);
> +
> +static const struct i2c_device_id it61620_i2c_ids[] = {
> +	{ "it61620", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, it61620_i2c_ids);
> +
> +static struct i2c_driver it61620_driver = {
> +	.driver = {
> +		.name = "it61620",
> +		.of_match_table = it61620_dt_ids,
> +		.pm = &it61620_bridge_pm_ops,
> +	},
> +	.probe = it61620_probe,
> +	.remove = it61620_remove,
> +	.id_table = it61620_i2c_ids,
> +};
> +
> +module_i2c_driver(it61620_driver);
> +
> +MODULE_AUTHOR("Pet Weng <pet.weng@ite.com.tw>");
> +MODULE_AUTHOR("Hermes Wu <Hermes.Wu@ite.com.tw>");
> +MODULE_DESCRIPTION("it61620 mipi to hdmi driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
