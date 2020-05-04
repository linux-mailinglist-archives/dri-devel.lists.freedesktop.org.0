Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C69D1C4634
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 20:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C4F6E46E;
	Mon,  4 May 2020 18:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEDC6E46E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 18:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYa7PnnbBZPdiXGDRlfC9uM1JPxGZv+HJqhcR1Qp1F5Y8+5fMv20pDYIbtxIZGSaig7CvAb5W+j/cPOlWca0yg6qISf/JwxJT2qWr/i3vmbWQdqtkZb48Lir7h/IrjAQ2p2AqYSLWQJiMcAzZhuDFK13SyYQXXmOcezcoNnJsuzlKp2TVyp44cX/KsyE6dcCMFYuSojs9dJ4FO/rKrtWd+6oP1U53fec5TY06cz5LThgdf3EYrpNsUG/6qVSralQ4kjL47SRrPqMBLsUctgpfrKj1OzOsAjv+epzV81ABefNWH95Uw5vGNgUKqtH5ocvgBpftniL8RVFYQVc+qmoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miipEusqqMCmqMkM4ve9p/HqlnJj3kVNpnKtXZyRB4g=;
 b=FKLO2jqvq/33EDcxvDDG5aFyrcmdOhveTDCxWZU0p7shsL5o++vh/vhtw2OTSi2Hhfq+/dFOgG2+PcW2YyqkSbqqC6p2IlZcx3GE0yRnJd0sXMfvruStZTEgWlEKqq0Bcwb7+zE2s/qqzXKRHEPg2ABbJwtfpEM65CpDVyLe73NnURdNjGV8cc70dqYzhZ51R96BgEanzRTQd2tWrOrB1kFWmFNoSsym9Dc2uhqC7TbODDKgjXMWSuC5UHXLdMZhCO+pmGNeYSIov77seSiEXicUyqUlCCGbi+RK2W9D19dO5Axd4X7p5roRz+xvsnwnI8f18ZvpFuTj1VUcm+yQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miipEusqqMCmqMkM4ve9p/HqlnJj3kVNpnKtXZyRB4g=;
 b=X/45APEm2HBoyFE3vvEUeo26IsEsuOdYqRpCVQSblsp5UEsqeUncyLd4ijR+RvYPRGjC1D3KPSKKpnNCygm3eQUDtr2H391HGhK/WAzeD8j1HVsP7HlEzSKup8yaAbvfDuZynZHPHmgMYGB638Od6lJEjtNXA2mVpMZF7ZAMmmw=
Received: from MN2PR01CA0028.prod.exchangelabs.com (2603:10b6:208:10c::41) by
 DM6PR02MB6252.namprd02.prod.outlook.com (2603:10b6:5:1d2::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19; Mon, 4 May 2020 18:43:57 +0000
Received: from BL2NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:10c:cafe::8d) by MN2PR01CA0028.outlook.office365.com
 (2603:10b6:208:10c::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Mon, 4 May 2020 18:43:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT011.mail.protection.outlook.com (10.152.77.5) with Microsoft SMTP
 Server id 15.20.2958.27 via Frontend Transport; Mon, 4 May 2020 18:43:56
 +0000
Received: from [149.199.38.66] (port=59577 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1jVg4D-0004QZ-TI; Mon, 04 May 2020 11:43:49 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1jVg4J-0007c4-Q6; Mon, 04 May 2020 11:43:55 -0700
Received: from [172.19.2.244] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1jVg4C-0007bZ-Pw; Mon, 04 May 2020 11:43:48 -0700
Date: Mon, 4 May 2020 11:43:48 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Subject: Re: [RFC PATCH 2/2] drm: xlnx: driver for Xilinx DSI TX Subsystem
Message-ID: <20200504184348.GA3095@smtp.xilinx.com>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1587417656-48078-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587417656-48078-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(39860400002)(346002)(376002)(46966005)(6862004)(4326008)(2906002)(478600001)(82310400002)(356005)(82740400003)(186003)(81166007)(33656002)(47076004)(26005)(107886003)(70206006)(70586007)(316002)(426003)(44832011)(30864003)(9786002)(8676002)(1076003)(6636002)(54906003)(336012)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29b361fa-5a39-477a-e3e7-08d7f05b19db
X-MS-TrafficTypeDiagnostic: DM6PR02MB6252:
X-Microsoft-Antispam-PRVS: <DM6PR02MB625268267772D9EFEA8E15DBD6A60@DM6PR02MB6252.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03932714EB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zX7F1e+5lupzGB3L3UoZhX0CoEwEbfQZZ8cmFpNNAZRit5nDQjcPxY74DYYu9URD7bFL9IKIDbvFcQ+yq/C1/srjUwnL15hvdPhsEIjf1o4wQuH4kz5MPKtDkAoik83T3dUAVdYuCHcYvSVhHCEsXOJLE2mDjDd8ujbN26/+aRaiU+iAhpN091BG0MeFo5zNcAemjQnO5JhnosTXsMlxdwIQaHrVupvmW8BYxTLbEsgp93DvAjWcJp5ElgVZUrO7XsUc1NKTyY1vBXMr7R69oQ04P643J0irauWIxEHyNGHu/f4YzbSgDqpwptNznVF0uG5p59Z41ZEM9aUKBoe21HmGRedGJsDaYSScl4c2xugevlbXW32hIh28eNmE/OyH1oLNk7cKziK5zxrV3HQUQhFP5mK6RtHB6rRbJIN4FXzQA6asIkS8Qf+wzk9uyVj+iZlcuC1CM8Y1FQ1r8Jp5N4KBveTRKE8H4pPLFVODnkrjDSgxtYWQms9yTxfdHziQoUG6A8a30LllIUFv8/hYag==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2020 18:43:56.2675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b361fa-5a39-477a-e3e7-08d7f05b19db
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6252
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
Cc: Sandip Kothari <sandipk@xilinx.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi GVRao,

Thanks for the patch. Sorry for late reply.

On Mon, 2020-04-20 at 14:20:56 -0700, Venkateshwar Rao Gannavarapu wrote:
> The Xilinx MIPI DSI Tx Subsystem soft IP is used to display video
> data from AXI-4 stream interface.
> 
> It supports upto 4 lanes, optional register interface for the DPHY,

I don't see the register interface for dphy support.

> multiple RGB color formats, command mode and video mode.
> This is a MIPI-DSI host driver and provides DSI bus for panels.
> This driver also helps to communicate with its panel using panel
> framework.
> 
> Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> ---
>  drivers/gpu/drm/xlnx/Kconfig    |  11 +
>  drivers/gpu/drm/xlnx/Makefile   |   2 +
>  drivers/gpu/drm/xlnx/xlnx_dsi.c | 755 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 768 insertions(+)
>  create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c
> 
> diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
> index aa6cd88..73873cf 100644
> --- a/drivers/gpu/drm/xlnx/Kconfig
> +++ b/drivers/gpu/drm/xlnx/Kconfig
> @@ -11,3 +11,14 @@ config DRM_ZYNQMP_DPSUB
>  	  This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose
>  	  this option if you have a Xilinx ZynqMP SoC with DisplayPort
>  	  subsystem.
> +
> +config DRM_XLNX_DSI
> +        tristate "Xilinx DRM DSI Subsystem Driver"
> +        select DRM_MIPI_DSI
> +        select DRM_PANEL
> +        select DRM_PANEL_SIMPLE
> +        help
> +	  This enables support for Xilinx MIPI-DSI.

This sentence is not needed with below. Could you please rephrase the whole?

> +	  This is a DRM/KMS driver for Xilinx programmable DSI controller.
> +	  Choose this option if you have a Xilinx MIPI DSI-TX controller
> +	  subsytem.

These seem incorrectly indented.

> diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
> index 2b844c6..b7ee6ef 100644
> --- a/drivers/gpu/drm/xlnx/Makefile
> +++ b/drivers/gpu/drm/xlnx/Makefile
> @@ -1,2 +1,4 @@
>  zynqmp-dpsub-objs += zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
>  obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
> +
> +obj-$(CONFIG_DRM_XLNX_DSI) += xlnx_dsi.o
> diff --git a/drivers/gpu/drm/xlnx/xlnx_dsi.c b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> new file mode 100644
> index 0000000..b8cae59
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> @@ -0,0 +1,755 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xilinx FPGA MIPI DSI Tx Controller driver
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Authors:
> + * - Saurabh Sengar <saurabhs@xilinx.com>
> + * - Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
> +
> +#include <video/mipi_display.h>
> +#include <video/videomode.h>
> +
> +/* DSI Tx IP registers */
> +#define XDSI_CCR			0x00
> +#define XDSI_CCR_COREENB		BIT(0)
> +#define XDSI_CCR_SOFTRST		BIT(1)
> +#define XDSI_CCR_CRREADY		BIT(2)
> +#define XDSI_CCR_CMDMODE		BIT(3)
> +#define XDSI_CCR_DFIFORST		BIT(4)
> +#define XDSI_CCR_CMDFIFORST		BIT(5)
> +#define XDSI_PCR			0x04
> +#define XDSI_PCR_VIDEOMODE(x)		(((x) & 0x3) << 3)
> +#define XDSI_PCR_VIDEOMODE_MASK		(0x3 << 3)
> +#define XDSI_PCR_VIDEOMODE_SHIFT	3
> +#define XDSI_PCR_BLLPTYPE(x)		((x) << 5)
> +#define XDSI_PCR_BLLPMODE(x)		((x) << 6)
> +#define XDSI_PCR_EOTPENABLE(x)		((x) << 13)
> +#define XDSI_GIER			0x20
> +#define XDSI_ISR			0x24
> +#define XDSI_IER			0x28
> +#define XDSI_STR			0x2C
> +#define XDSI_STR_RDY_SHPKT		BIT(6)
> +#define XDSI_STR_RDY_LNGPKT		BIT(7)
> +#define XDSI_STR_DFIFO_FULL		BIT(8)
> +#define XDSI_STR_DFIFO_EMPTY		BIT(9)
> +#define XDSI_STR_WAITFR_DATA		BIT(10)
> +#define XDSI_STR_CMD_EXE_PGS		BIT(11)
> +#define XDSI_STR_CCMD_PROC		BIT(12)
> +#define XDSI_STR_LPKT_MASK		(0x5 << 7)
> +#define XDSI_CMD			0x30
> +#define XDSI_CMD_QUEUE_PACKET(x)	((x) & GENMASK(23, 0))
> +#define XDSI_DFR			0x34
> +#define XDSI_TIME1			0x50
> +#define XDSI_TIME1_BLLP_BURST(x)	((x) & GENMASK(15, 0))
> +#define XDSI_TIME1_HSA(x)		(((x) & GENMASK(15, 0)) << 16)
> +#define XDSI_TIME2			0x54
> +#define XDSI_TIME2_VACT(x)		((x) & GENMASK(15, 0))
> +#define XDSI_TIME2_HACT(x)		(((x) & GENMASK(15, 0)) << 16)
> +#define XDSI_HACT_MULTIPLIER		GENMASK(1, 0)
> +#define XDSI_TIME3			0x58
> +#define XDSI_TIME3_HFP(x)		((x) & GENMASK(15, 0))
> +#define XDSI_TIME3_HBP(x)		(((x) & GENMASK(15, 0)) << 16)
> +#define XDSI_TIME4			0x5c
> +#define XDSI_TIME4_VFP(x)		((x) & GENMASK(7, 0))
> +#define XDSI_TIME4_VBP(x)		(((x) & GENMASK(7, 0)) << 8)
> +#define XDSI_TIME4_VSA(x)		(((x) & GENMASK(7, 0)) << 16)
> +#define XDSI_LTIME			0x60
> +#define XDSI_BLLP_TIME			0x64
> +/*
> + * XDSI_NUM_DATA_T represents number of data types in the
> + * enum mipi_dsi_pixel_format in the MIPI DSI part of DRM framework.
> + */
> +#define XDSI_NUM_DATA_T			4
> +#define XDSI_VIDEO_MODE_SYNC_PULSE	0x0
> +#define XDSI_VIDEO_MODE_SYNC_EVENT	0x1
> +#define XDSI_VIDEO_MODE_BURST		0x2

Please remove these unused 3 definitions.

> +
> +#define XDSI_DPHY_CLK_MIN	197000000000UL
> +#define XDSI_DPHY_CLK_MAX	203000000000UL
> +#define XDSI_DPHY_CLK_REQ	200000000000UL
> +
> +/* command timeout in usec */
> +#define XDSI_CMD_TIMEOUT_VAL	(3000)
> +
> +/**
> + * struct xlnx_dsi - Xilinx DSI-TX core
> + * @encoder: DRM encoder structure
> + * @dsi_host: DSI host device
> + * @connector: DRM connector structure
> + * @panel_node: MIPI DSI device panel node
> + * @panel:  DRM panel structure
> + * @dev: device structure
> + * @iomem: Base address of DSI subsystem
> + * @lanes: number of active data lanes supported by DSI controller
> + * @cmdmode: command mode support
> + * @mode_flags: DSI operation mode related flags
> + * @format: pixel format for video mode of DSI controller
> + * @vm: videomode data structure
> + * @mul_factor: multiplication factor for HACT timing parameter
> + * @video_aclk: Video clock
> + * @dphy_clk_200M: 200MHz DPHY clock and AXI Lite clock
> + */
> +struct xlnx_dsi {
> +	struct drm_encoder encoder;
> +	struct mipi_dsi_host dsi_host;
> +	struct drm_connector connector;
> +	struct device_node *panel_node;
> +	struct drm_panel *panel;
> +	struct device *dev;
> +	void __iomem *iomem;
> +	u32 lanes;
> +	bool cmdmode;
> +	u32 mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	struct videomode vm;
> +	u32 mul_factor;
> +	struct clk *video_aclk;
> +	struct clk *dphy_clk_200M;
> +};
> +
> +#define host_to_dsi(host) container_of(host, struct xlnx_dsi, dsi_host)
> +#define connector_to_dsi(c) container_of(c, struct xlnx_dsi, connector)
> +#define encoder_to_dsi(e) container_of(e, struct xlnx_dsi, encoder)
> +
> +static inline void xlnx_dsi_writel(void __iomem *base, int offset, u32 val)
> +{
> +	writel(val, base + offset);
> +}
> +
> +static inline u32 xlnx_dsi_readl(void __iomem *base, int offset)
> +{
> +	return readl(base + offset);
> +}
> +
> +/**
> + * xlnx_dsi_set_display_mode - Configure DSI timing registers
> + * @dsi: xilinx DSI structure
> + *
> + * This function writes the timing parameters of DSI IP which are
> + * retrieved from panel timing values.
> + */
> +static void xlnx_dsi_set_display_mode(struct xlnx_dsi *dsi)

This function better directly inline to xlnx_dsi_atomic_mode_set(). Then,
the videomode is not really needed. Please remove it and use drm_display_mode.

> +{
> +	struct videomode *vm = &dsi->vm;
> +	u32 reg, video_mode;
> +
> +	reg = xlnx_dsi_readl(dsi->iomem, XDSI_PCR);
> +	video_mode = (reg & XDSI_PCR_VIDEOMODE_MASK) >>
> +		      XDSI_PCR_VIDEOMODE_SHIFT;
> +
> +	/* configure the HSA value only if non_burst_sync_pluse video mode */
> +	if (!video_mode &&
> +	    (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)) {
> +		reg = XDSI_TIME1_HSA(vm->hsync_len);
> +		xlnx_dsi_writel(dsi->iomem, XDSI_TIME1, reg);
> +	}
> +
> +	reg = XDSI_TIME4_VFP(vm->vfront_porch) |
> +	      XDSI_TIME4_VBP(vm->vback_porch) |
> +	      XDSI_TIME4_VSA(vm->vsync_len);
> +	xlnx_dsi_writel(dsi->iomem, XDSI_TIME4, reg);
> +
> +	reg = XDSI_TIME3_HFP(vm->hfront_porch) |
> +	      XDSI_TIME3_HBP(vm->hback_porch);
> +	xlnx_dsi_writel(dsi->iomem, XDSI_TIME3, reg);
> +
> +	dev_dbg(dsi->dev, "mul factor for parsed datatype is = %d\n",
> +		(dsi->mul_factor) / 100);

Remove unneeded ().

> +	/*
> +	 * The HACT parameter received from panel timing values should be
> +	 * divisible by 4. The reason for this is, the word count given as
> +	 * input to DSI controller is HACT * mul_factor. The mul_factor is
> +	 * 3, 2.25, 2.25, 2 respectively for RGB888, RGB666_L, RGB666_P and
> +	 * RGB565.
> +	 * e.g. for RGB666_L color format and 1080p, the word count is
> +	 * 1920*2.25 = 4320 which is divisible by 4 and it is a valid input
> +	 * to DSI controller. Based on this 2.25 mul factor, we come up with
> +	 * the division factor of (XDSI_HACT_MULTIPLIER) as 4 for checking
> +	 */
> +	if ((vm->hactive & XDSI_HACT_MULTIPLIER) != 0)

if (!(vm->hactive & XDSI_HACT_MULTIPLIER))?

> +		dev_warn(dsi->dev, "Incorrect HACT will be programmed\n");

dev_warn() better come with more details. Probably it can mention that
hactive is not aligned along with its value.

> +
> +	reg = XDSI_TIME2_HACT((vm->hactive) * (dsi->mul_factor) / 100) |

Ditto. No ().

> +	      XDSI_TIME2_VACT(vm->vactive);
> +	xlnx_dsi_writel(dsi->iomem, XDSI_TIME2, reg);
> +
> +	dev_dbg(dsi->dev, "LCD size = %dx%d\n", vm->hactive, vm->vactive);
> +}
> +
> +/**
> + * xlnx_dsi_set_display_enable - Enables the DSI Tx IP core enable
> + * register bit
> + * @dsi: Xilinx DSI structure
> + *
> + * This function takes the DSI strucure and enables the core enable bit
> + * of core configuration register.
> + */
> +static void xlnx_dsi_set_display_enable(struct xlnx_dsi *dsi)
> +{
> +	u32 reg;
> +
> +	reg = xlnx_dsi_readl(dsi->iomem, XDSI_CCR);
> +	reg |= XDSI_CCR_COREENB;
> +

Nit. It can be less lines by removing this empty line and setting the reg
at declarartion an so on.

> +	xlnx_dsi_writel(dsi->iomem, XDSI_CCR, reg);
> +	dev_dbg(dsi->dev, "MIPI DSI Tx controller is enabled.\n");
> +}
> +
> +/**
> + * xlnx_dsi_set_display_disable - Disable the DSI Tx IP core enable
> + * register bit
> + * @dsi: Xilinx DSI structure
> + *
> + * This function takes the DSI strucure and disables the core enable bit
> + * of core configuration register.
> + */
> +static void xlnx_dsi_set_display_disable(struct xlnx_dsi *dsi)
> +{
> +	u32 reg;
> +
> +	reg = xlnx_dsi_readl(dsi->iomem, XDSI_CCR);
> +	reg &= ~XDSI_CCR_COREENB;
> +

Ditto.

> +	xlnx_dsi_writel(dsi->iomem, XDSI_CCR, reg);
> +	dev_dbg(dsi->dev, "DSI Tx is disabled. reset regs to default values\n");
> +}
> +
> +/**
> + * xlnx_dsi_host_transfer - transfer command to panel
> + * @host: mipi dsi host structure
> + * @msg: mipi dsi msg with type, length and data
> + *
> + * This function is valid only in command mode.
> + * It checks the command fifo empty status and writes into
> + * data or cmd register and waits for the completion status.
> + *
> + * Return:	number of bytes, on success and error number on failure

Nit. Extra spaces.

> + */
> +static ssize_t xlnx_dsi_host_transfer(struct mipi_dsi_host *host,
> +				      const struct mipi_dsi_msg *msg)
> +{
> +	struct xlnx_dsi *dsi = host_to_dsi(host);
> +	u32 data0, data1, cmd0, status, val;
> +	const char *tx_buf = msg->tx_buf;
> +
> +	if (!(xlnx_dsi_readl(dsi->iomem, XDSI_CCR) & (XDSI_CCR_COREENB |
> +						      XDSI_CCR_CMDMODE))) {

This passes when one of these 2 bits is set, and I don't think it's right.

> +		dev_err(dsi->dev, "dsi command mode not enabled\n");
> +		return -EINVAL;
> +	}
> +
> +	if (msg->type == MIPI_DSI_DCS_LONG_WRITE) {
> +		status = readl_poll_timeout(dsi->iomem + XDSI_STR, val,
> +					    ((val & XDSI_STR_LPKT_MASK) ==
> +					     XDSI_STR_LPKT_MASK), 1,

Please remove unneeded (). Same for rest below.

> +					    XDSI_CMD_TIMEOUT_VAL);

It'd be nice if these delay / timeout values are described..

> +		if (status) {
> +			dev_err(dsi->dev, "long cmd fifo not empty!\n");
> +			return -ETIMEDOUT;

Isn't this checking if the controller is ready for long packet transaction?
Then maybe -EBUSY is better. For timeout, the 'status' can propagate.
Same for below.

> +		}
> +		data0 = tx_buf[0] | (tx_buf[1] << 8) | (tx_buf[2] << 16) |
> +			(tx_buf[3] << 24);
> +		data1 = tx_buf[4] | (tx_buf[5] << 8);
> +		cmd0 = msg->type | (MIPI_DSI_DCS_READ << 8);
> +
> +		xlnx_dsi_writel(dsi->iomem, XDSI_DFR, data0);
> +		xlnx_dsi_writel(dsi->iomem, XDSI_DFR, data1);
> +		xlnx_dsi_writel(dsi->iomem, XDSI_CMD, cmd0);
> +	} else {

I'm not familiar with DSI transaction handling, but is it safe to assume
all other than long write is short packet write (param, without param)?

> +		data0 = tx_buf[0];

This line can be removed.

> +		if (msg->type == MIPI_DSI_DCS_SHORT_WRITE_PARAM)
> +			data0 = MIPI_DSI_DCS_SHORT_WRITE_PARAM |
> +				(tx_buf[0] << 8) | (tx_buf[1] << 16);
> +		else
> +			data0 = MIPI_DSI_DCS_SHORT_WRITE | (tx_buf[0] << 8);

I'd put () for this if - else statments, but it may be just me.


Then, this can mvoe to right before xlnx_dsi_writel() below.

> +
> +		status = readl_poll_timeout(dsi->iomem + XDSI_STR, val,
> +					    ((val & XDSI_STR_RDY_SHPKT) ==
> +					     XDSI_STR_RDY_SHPKT), 1,
> +					    XDSI_CMD_TIMEOUT_VAL);
> +		if (status) {
> +			dev_err(dsi->dev, "short cmd fifo not empty\n");
> +			return -ETIMEDOUT;
> +		}
> +		xlnx_dsi_writel(dsi->iomem, XDSI_CMD, data0);
> +	}
> +
> +	status = readl_poll_timeout(dsi->iomem + XDSI_STR, val,
> +				    (!(val & XDSI_STR_CMD_EXE_PGS)), 1,
> +				    XDSI_CMD_TIMEOUT_VAL);
> +	if (status) {
> +		dev_err(dsi->dev, "cmd time out\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return msg->tx_len;
> +}
> +
> +static int xlnx_dsi_host_attach(struct mipi_dsi_host *host,
> +				struct mipi_dsi_device *device)
> +{
> +	u32 panel_lanes;
> +	struct xlnx_dsi *dsi = host_to_dsi(host);
> +
> +	panel_lanes = device->lanes;

I'd do this above,

	u32 panel_lanes = device->lanes

> +	dsi->mode_flags = device->mode_flags;
> +	dsi->panel_node = device->dev.of_node;
> +
> +	if (panel_lanes != dsi->lanes) {
> +		dev_err(dsi->dev, "Mismatch of lanes. panel = %d, DSI = %d\n",
> +			panel_lanes, dsi->lanes);
> +		return -EINVAL;
> +	}
> +
> +	if (device->format != dsi->format) {
> +		dev_err(dsi->dev, "Mismatch of format. panel = %d, DSI = %d\n",
> +			device->format, dsi->format);
> +		return -EINVAL;
> +	}
> +
> +	if (dsi->connector.dev)
> +		drm_helper_hpd_irq_event(dsi->connector.dev);
> +
> +	return 0;
> +}
> +
> +static int xlnx_dsi_host_detach(struct mipi_dsi_host *host,
> +				struct mipi_dsi_device *device)
> +{
> +	struct xlnx_dsi *dsi = host_to_dsi(host);
> +
> +	if (dsi->panel) {
> +		drm_panel_detach(dsi->panel);
> +		dsi->panel = NULL;
> +	}
> +
> +	if (dsi->connector.dev)
> +		drm_helper_hpd_irq_event(dsi->connector.dev);
> +
> +	return 0;
> +}
> +
> +static const struct mipi_dsi_host_ops xlnx_dsi_ops = {
> +	.attach = xlnx_dsi_host_attach,
> +	.detach = xlnx_dsi_host_detach,
> +	.transfer = xlnx_dsi_host_transfer,
> +};
> +
> +static int xlnx_dsi_connector_dpms(struct drm_connector *connector,
> +				   int mode)
> +{
> +	struct xlnx_dsi *dsi = connector_to_dsi(connector);
> +	int ret;
> +
> +	dev_dbg(dsi->dev, "connector dpms state: %d\n", mode);
> +
> +	switch (mode) {
> +	case DRM_MODE_DPMS_ON:
> +		ret = drm_panel_prepare(dsi->panel);
> +		if (ret < 0) {
> +			dev_err(dsi->dev, "DRM panel not found\n");
> +			return ret;
> +		}
> +
> +		ret = drm_panel_enable(dsi->panel);
> +		if (ret < 0) {
> +			drm_panel_unprepare(dsi->panel);
> +			dev_err(dsi->dev, "DRM panel not enabled\n");
> +			return ret;
> +		}
> +		break;
> +	default:
> +		drm_panel_disable(dsi->panel);
> +		drm_panel_unprepare(dsi->panel);
> +		break;
> +	}
> +
> +	return drm_helper_connector_dpms(connector, mode);
> +}
> +
> +static enum drm_connector_status
> +xlnx_dsi_detect(struct drm_connector *connector, bool force)
> +{
> +	struct xlnx_dsi *dsi = connector_to_dsi(connector);
> +
> +	if (!dsi->panel) {
> +		dsi->panel = of_drm_find_panel(dsi->panel_node);
> +		if (dsi->panel) {
> +			drm_panel_attach(dsi->panel, &dsi->connector);

Above are quite static, so can't it be done in host attach? Or do you see more
dynamic use cases?

> +			if (dsi->cmdmode) {
> +				xlnx_dsi_writel(dsi->iomem, XDSI_CCR,
> +						XDSI_CCR_CMDMODE |
> +						XDSI_CCR_COREENB);
> +				drm_panel_prepare(dsi->panel);

Just to confirm, is this not needed for non-command mode? And how is this
aligned with same call in dpms(), meaning the panel will be prepared
twice in command mode.

> +				xlnx_dsi_writel(dsi->iomem, XDSI_CCR, 0);
> +			}
> +		}
> +	} else if (!dsi->panel_node) {
> +		xlnx_dsi_connector_dpms(connector, DRM_MODE_DPMS_OFF);
> +		drm_panel_detach(dsi->panel);
> +		dsi->panel = NULL;
> +	}
> +
> +	if (dsi->panel)
> +		return connector_status_connected;
> +
> +	return connector_status_disconnected;
> +}
> +
> +static void xlnx_dsi_connector_destroy(struct drm_connector *connector)
> +{
> +	drm_connector_unregister(connector);
> +	drm_connector_cleanup(connector);
> +	connector->dev = NULL;
> +}
> +
> +static const struct drm_connector_funcs xlnx_dsi_connector_funcs = {
> +	.detect = xlnx_dsi_detect,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = xlnx_dsi_connector_destroy,
> +	.reset			= drm_atomic_helper_connector_reset,

This better indent more consistently. Please do it through the entire file.

> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +	.dpms = xlnx_dsi_connector_dpms,
> +};
> +
> +static int xlnx_dsi_get_modes(struct drm_connector *connector)
> +{
> +	struct xlnx_dsi *dsi = connector_to_dsi(connector);
> +
> +	if (dsi->panel)
> +		return drm_panel_get_modes(dsi->panel, connector);
> +
> +	return 0;
> +}
> +
> +static struct drm_encoder *
> +xlnx_dsi_best_encoder(struct drm_connector *connector)
> +{
> +	return &(connector_to_dsi(connector)->encoder);
> +}
> +
> +static const struct drm_connector_helper_funcs
> +xlnx_dsi_connector_helper_funcs = {
> +	.get_modes = xlnx_dsi_get_modes,
> +	.best_encoder = xlnx_dsi_best_encoder,
> +};
> +
> +static int xlnx_dsi_create_connector(struct drm_encoder *encoder)
> +{
> +	struct xlnx_dsi *dsi = encoder_to_dsi(encoder);
> +	struct drm_connector *connector = &dsi->connector;
> +	struct drm_device *drm = encoder->dev;
> +	int ret;
> +
> +	connector->polled = DRM_CONNECTOR_POLL_HPD;
> +
> +	ret = drm_connector_init(encoder->dev, connector,
> +				 &xlnx_dsi_connector_funcs,
> +				 DRM_MODE_CONNECTOR_DSI);
> +	if (ret) {
> +		dev_err(dsi->dev, "Failed to initialize connector with drm\n");
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(connector, &xlnx_dsi_connector_helper_funcs);
> +	drm_connector_attach_encoder(connector, encoder);
> +	if (!drm->registered)
> +		return 0;
> +
> +	drm_connector_register(connector);
> +
> +	return 0;
> +}
> +
> +/**
> + * xlnx_dsi_atomic_mode_set -  derive the DSI timing parameters
> + *
> + * @encoder: pointer to Xilinx DRM encoder
> + * @crtc_state: Pointer to drm core crtc state
> + * @connector_state: DSI connector drm state
> + *
> + * This function derives the DSI IP timing parameters from the timing
> + * values given in the attached panel driver.
> + */
> +static void
> +xlnx_dsi_atomic_mode_set(struct drm_encoder *encoder,
> +			 struct drm_crtc_state *crtc_state,
> +				 struct drm_connector_state *connector_state)
> +{
> +	struct xlnx_dsi *dsi = encoder_to_dsi(encoder);
> +	struct videomode *vm = &dsi->vm;
> +	struct drm_display_mode *m = &crtc_state->adjusted_mode;
> +
> +	vm->hactive = m->hdisplay;
> +	vm->vactive = m->vdisplay;
> +	vm->vfront_porch = m->vsync_start - m->vdisplay;
> +	vm->vback_porch = m->vtotal - m->vsync_end;
> +	vm->vsync_len = m->vsync_end - m->vsync_start;
> +	vm->hfront_porch = m->hsync_start - m->hdisplay;
> +	vm->hback_porch = m->htotal - m->hsync_end;
> +	vm->hsync_len = m->hsync_end - m->hsync_start;
> +	xlnx_dsi_set_display_mode(dsi);

As commented above, this doesn't have to be re-directed through videomode.
Then the function can be inlined here.

> +}
> +
> +static void xlnx_dsi_disable(struct drm_encoder *encoder)
> +{
> +	struct xlnx_dsi *dsi = encoder_to_dsi(encoder);
> +
> +	xlnx_dsi_set_display_disable(dsi);

	xlnx_dsi_set_display_disable(encoder_to_dsi(encoder));

Maybe even this wrapper can be removed?

> +}
> +
> +static void xlnx_dsi_enable(struct drm_encoder *encoder)
> +{
> +	struct xlnx_dsi *dsi = encoder_to_dsi(encoder);
> +
> +	xlnx_dsi_set_display_enable(dsi);

Ditto.

> +}
> +
> +static const struct drm_encoder_helper_funcs
> +xlnx_dsi_encoder_helper_funcs = {
> +	.atomic_mode_set = xlnx_dsi_atomic_mode_set,
> +	.enable = xlnx_dsi_enable,
> +	.disable = xlnx_dsi_disable,
> +};
> +
> +static const struct drm_encoder_funcs xlnx_dsi_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +static int xlnx_dsi_parse_dt(struct xlnx_dsi *dsi)
> +{
> +	struct device *dev = dsi->dev;
> +	struct device_node *node = dev->of_node;
> +	int ret;
> +	u32 datatype;
> +	static const int xdsi_mul_fact[XDSI_NUM_DATA_T] = {300, 225, 225, 200};
> +
> +	dsi->dphy_clk_200M = devm_clk_get(dev, "dphy_clk_200M");
> +	if (IS_ERR(dsi->dphy_clk_200M)) {
> +		ret = PTR_ERR(dsi->dphy_clk_200M);
> +		dev_err(dev, "failed to get dphy_clk_200M %d\n", ret);
> +		return ret;
> +	}
> +
> +	dsi->video_aclk = devm_clk_get(dev, "s_axis_aclk");
> +	if (IS_ERR(dsi->video_aclk)) {
> +		ret = PTR_ERR(dsi->video_aclk);
> +		dev_err(dev, "failed to get video_clk %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32(node, "xlnx,dsi-num-lanes", &dsi->lanes);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "missing xlnx,dsi-num-lanes property\n");
> +		return ret;
> +	}
> +	if (dsi->lanes > 4 || dsi->lanes < 1) {
> +		dev_err(dsi->dev, "%d lanes : invalid lanes\n", dsi->lanes);
> +		return -EINVAL;
> +	}

Nit. An empty line here would be helpful for readability.

> +	ret = of_property_read_u32(node, "xlnx,dsi-data-type", &datatype);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "missing xlnx,dsi-data-type property\n");
> +		return ret;
> +	}
> +	dsi->format = datatype;
> +	if (datatype > MIPI_DSI_FMT_RGB565) {
> +		dev_err(dsi->dev, "Invalid xlnx,dsi-data-type string\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * multiplication factor used for HACT, based on data type.
> +	 *
> +	 * e.g. for RGB666_L datatype and 1920x1080 resolution,
> +	 * the Hact (WC) would be as follows -
> +	 * 1920 pixels * 18 bits per pixel / 8 bits per byte
> +	 * = 1920 pixels * 2.25 bytes per pixel = 4320 bytes.
> +	 *
> +	 * Data Type - Multiplication factor
> +	 * RGB888    - 3
> +	 * RGB666_L  - 2.25
> +-	 * RGB666_P  - 2.25
> +	 * RGB565    - 2
> +	 *
> +	 * Since the multiplication factor maybe a floating number,
> +	 * a 100x multiplication factor is used.
> +	 */
> +	dsi->mul_factor = xdsi_mul_fact[datatype];
> +
> +	dsi->cmdmode = of_property_read_bool(node, "xlnx,dsi-cmd-mode");
> +
> +	dev_dbg(dsi->dev, "DSI controller num lanes = %d", dsi->lanes);
> +	dev_dbg(dsi->dev, "DSI controller datatype = %d\n", datatype);
> +	dev_dbg(dsi->dev, "DSI controller cmd mode = %d\n", dsi->cmdmode);
> +
> +	return 0;
> +}
> +
> +static int xlnx_dsi_bind(struct device *dev, struct device *master,
> +			 void *data)
> +{
> +	struct xlnx_dsi *dsi = dev_get_drvdata(dev);
> +	struct drm_encoder *encoder = &dsi->encoder;
> +	struct drm_device *drm_dev = data;
> +	int ret;
> +
> +	drm_encoder_init(drm_dev, encoder, &xlnx_dsi_encoder_funcs,
> +			 DRM_MODE_ENCODER_DSI, NULL);
> +	drm_encoder_helper_add(encoder, &xlnx_dsi_encoder_helper_funcs);
> +
> +	encoder->possible_crtcs = 1;
> +
> +	ret = xlnx_dsi_create_connector(encoder);
> +	if (ret) {
> +		dev_err(dsi->dev, "fail creating connector, ret = %d\n", ret);
> +		drm_encoder_cleanup(encoder);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_host_register(&dsi->dsi_host);
> +	if (ret < 0) {

Just nit. if (ret) would do.

> +		dev_err(dsi->dev, "failed to register DSI host: %d\n", ret);
> +		xlnx_dsi_connector_destroy(&dsi->connector);
> +		drm_encoder_cleanup(encoder);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xlnx_dsi_unbind(struct device *dev, struct device *master,
> +			    void *data)
> +{
> +	struct xlnx_dsi *dsi = dev_get_drvdata(dev);
> +
> +	xlnx_dsi_disable(&dsi->encoder);
> +	mipi_dsi_host_unregister(&dsi->dsi_host);
> +}
> +
> +static const struct component_ops xlnx_dsi_component_ops = {
> +	.bind	= xlnx_dsi_bind,
> +	.unbind	= xlnx_dsi_unbind,
> +};
> +
> +static int xlnx_dsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct xlnx_dsi *dsi;
> +	int ret;
> +	unsigned long rate;
> +
> +	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +	if (!dsi)
> +		return -ENOMEM;
> +
> +	dsi->dsi_host.ops = &xlnx_dsi_ops;
> +	dsi->dsi_host.dev = dev;
> +	dsi->dev = dev;
> +
> +	ret = xlnx_dsi_parse_dt(dsi);
> +	if (ret)
> +		return ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	dsi->iomem = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(dsi->iomem)) {
> +		dev_err(dev, "failed to remap io region\n");
> +		return PTR_ERR(dsi->iomem);
> +	}
> +	platform_set_drvdata(pdev, dsi);
> +
> +	ret = clk_set_rate(dsi->dphy_clk_200M, XDSI_DPHY_CLK_REQ);
> +	if (ret) {
> +		dev_err(dev, "failed to set dphy clk rate %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(dsi->dphy_clk_200M);
> +	if (ret) {
> +		dev_err(dev, "failed to enable dphy clk %d\n", ret);
> +		return ret;
> +	}
> +
> +	rate = clk_get_rate(dsi->dphy_clk_200M);
> +	if (rate < XDSI_DPHY_CLK_MIN && rate > XDSI_DPHY_CLK_MAX) {

A brief comment for this line wold be helpful.

> +		dev_err(dev, "Error DPHY clock = %lu\n", rate);
> +		ret = -EINVAL;
> +		goto err_disable_dphy_clk;
> +	}
> +
> +	ret = clk_prepare_enable(dsi->video_aclk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable video clk %d\n", ret);
> +		goto err_disable_dphy_clk;
> +	}
> +
> +	ret = component_add(dev, &xlnx_dsi_component_ops);
> +	if (ret < 0)

I prefer if (ret) where possible, but it may be just me. I let you decide.

> +		goto err_disable_video_clk;
> +
> +	return ret;

return 0;? but up to you.

> +
> +err_disable_video_clk:
> +	clk_disable_unprepare(dsi->video_aclk);
> +err_disable_dphy_clk:
> +	clk_disable_unprepare(dsi->dphy_clk_200M);
> +	return ret;
> +}

At least, this initial one better come with a complete display pipeline,
ex crtc / plane are missing. This won't be functional without those.
I believe Laurent was planning to make the xlnx drm layer as a library,
so hopefully this can be a good starting point and come with drivers aligned
with it.

> +
> +static int xlnx_dsi_remove(struct platform_device *pdev)
> +{
> +	struct xlnx_dsi *dsi = platform_get_drvdata(pdev);
> +
> +	component_del(&pdev->dev, &xlnx_dsi_component_ops);
> +	clk_disable_unprepare(dsi->video_aclk);
> +	clk_disable_unprepare(dsi->dphy_clk_200M);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id xlnx_dsi_of_match[] = {
> +	{ .compatible = "xlnx-dsi", },

This should change. I believe it should be something like, xlnx,<dsi ip name>-<version>

Thanks,
-hyun

> +	{ /* end of table */ },
> +};
> +MODULE_DEVICE_TABLE(of, xlnx_dsi_of_match);
> +
> +static struct platform_driver dsi_driver = {
> +	.probe = xlnx_dsi_probe,
> +	.remove = xlnx_dsi_remove,
> +	.driver = {
> +		.name = "xlnx-dsi",
> +		.of_match_table = xlnx_dsi_of_match,
> +	},
> +};
> +
> +module_platform_driver(dsi_driver);
> +
> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_DESCRIPTION("Xilinx FPGA MIPI DSI Tx Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
