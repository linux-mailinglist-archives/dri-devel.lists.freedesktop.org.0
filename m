Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B91E4C6D
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 19:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BA06E379;
	Wed, 27 May 2020 17:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680058.outbound.protection.outlook.com [40.107.68.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C716E379
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 17:54:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVur/ZHXj1aJIPRwp5u0TVGsLcIhSt3rRTxQ4VX/Lwn9F9XPwSQYVfgQalLMSYAXU+wv2fbOCsxPL8+Iq0npN++PiO0Bnysbbfz8OiD8szllF5wLDZ3nge5NFTtE9Zh4pEtwwsRptl0Ubq5MRdXSZ/enfFysKfxTuoYCSm3Peu9kYK9jfVzXsfc3mpaFnIaSlTF8v7YekKOM9zqFHSUfulTYUisKK839VGhQUa0lloKwL+Gf3zIJ0lmJFDK4qjmcAaTZxSx0uzt3inmY7vv+I8uKlYnXcOnEiTDQJgw78RkGLLsFqRVRSI2npHCG3LNjXhlyqMSDMwWojjcA52Ha3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfXPXEBMXe5yjoBou2Bu91itLNWQoGcE9Yj3HbsI5hw=;
 b=nlklnIz6ibDPgmwAcLpMV5T6AxnycPebBS0tln6ItEyuGZFBO+IycgY1K7QxMfh5whuB+uQT8CORRfeGtOQM5tu34O8iuCik4ZUE1bk5/fMfjwZgPLqYQmw/4sBtnFN2zmNOChZb4TiSe611bVhSb6irJ3e4j5msEggpLMaQxvDSZr2ZP8yLZcr5moeUM2sc/0Hw3OoPStgmpoUjjMqJb1WjBJ9EMWIXeogEwKaDdA91nm7i0szGuh7x8cLJkE4yaocUyxhY3LaLZDJGil2Nu4j8y+ptxibjEpVp+yOtxbSw5nN4V5GG5XOEAL6x+1DWDLNuTWTOuOzAvsnBtDqiVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfXPXEBMXe5yjoBou2Bu91itLNWQoGcE9Yj3HbsI5hw=;
 b=firhIcT70lrXnpbM4Qaq6xxpyKnpV04C2yXcYml9KWYFs31+Bz0hWuQk3sZb5vRZiy0IESCmKYRj1L9EQ3jPUDe2MrCIlzAirLchCFinCa9SiR6Co0k8h0AgOXrucoI4YchB8a13wJiE5gcVDZ54Kju/0c725ef3VwZvKKJgt+o=
Received: from CY4PR02CA0003.namprd02.prod.outlook.com (2603:10b6:903:18::13)
 by MN2PR02MB6752.namprd02.prod.outlook.com (2603:10b6:208:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 27 May
 2020 17:54:45 +0000
Received: from CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:18:cafe::64) by CY4PR02CA0003.outlook.office365.com
 (2603:10b6:903:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.25 via Frontend
 Transport; Wed, 27 May 2020 17:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT004.mail.protection.outlook.com (10.152.74.112) with Microsoft SMTP
 Server id 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 17:54:44
 +0000
Received: from [149.199.38.66] (port=41822 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1je0Fj-0005Su-8c; Wed, 27 May 2020 10:54:07 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1je0GJ-0008MA-O3; Wed, 27 May 2020 10:54:43 -0700
Received: from [172.19.2.244] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1je0GC-0008Kn-04; Wed, 27 May 2020 10:54:36 -0700
Date: Wed, 27 May 2020 10:54:35 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH 2/2] drm: xlnx: driver for Xilinx DSI TX Subsystem
Message-ID: <20200527175435.GA26381@smtp.xilinx.com>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1587417656-48078-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <20200504184348.GA3095@smtp.xilinx.com>
 <20200524030813.GF6026@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200524030813.GF6026@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(136003)(39860400002)(396003)(46966005)(6916009)(54906003)(70586007)(70206006)(81166007)(33656002)(356005)(82310400002)(316002)(83380400001)(426003)(5660300002)(336012)(44832011)(26005)(186003)(1076003)(47076004)(82740400003)(8676002)(9786002)(478600001)(2906002)(4326008)(8936002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 815cecd2-ffcc-4ae5-587e-08d8026709b7
X-MS-TrafficTypeDiagnostic: MN2PR02MB6752:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6752D28B7E41257192FBE248D6B10@MN2PR02MB6752.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1MWuiYcq7844ohiVS8uhW8hysCX4UI5LSPW2pQVJAn8PxW5P5+DML/896nYE/SlNodUa1QrTEsoU6ZWItawPGGQXoZxBYPdUJ0RaALZ0k0pGkmBi06qxfyqFCgAhbp7saRUnfHj2Yp4mcBeMqVE45+KnU1frCV9wq7Aa/5VGBskJNq3n0Shd4Ahd0ZlWYfkKRHRbvvjiqLE0r1WPSnGe9R/64cNK2riS3SOTr/PWU2Th745oELzNIIdfHY/wi4fazzqW2cVfsL/II+tFhQ9IRYu82l5GyosXeRXFVDYOXz6hQbLPVVwJ4aOkSoEDpxCgwAh9sheWEbK9dx2y4bw9cMewzFZU0mOQ9eN/fP1YQ+ZvY32KqGfgK7qTd2SKI8rUY63qZLj/Az+YmTzHYhWXPQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 17:54:44.0742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 815cecd2-ffcc-4ae5-587e-08d8026709b7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6752
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
 Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sat, 2020-05-23 at 20:08:13 -0700, Laurent Pinchart wrote:
> Hi GVRao,
> 
> Thank you for the patch.
> 
> On Mon, May 04, 2020 at 11:43:48AM -0700, Hyun Kwon wrote:
> > On Mon, 2020-04-20 at 14:20:56 -0700, Venkateshwar Rao Gannavarapu wrote:
> > > The Xilinx MIPI DSI Tx Subsystem soft IP is used to display video
> > > data from AXI-4 stream interface.
> > > 
> > > It supports upto 4 lanes, optional register interface for the DPHY,
> > 
> > I don't see the register interface for dphy support.
> 
> I think the D-PHY should be supported through a PHY driver, as it seems
> to be shared between different subsystems.
> 

Right, if the logic is shared across subsystems. I can't tell if that's
the case as the IP comes as a single block. Maybe GVRao can confirm.

> > > multiple RGB color formats, command mode and video mode.
> > > This is a MIPI-DSI host driver and provides DSI bus for panels.
> > > This driver also helps to communicate with its panel using panel
> > > framework.
> > > 
> > > Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> > > ---
> > >  drivers/gpu/drm/xlnx/Kconfig    |  11 +
> > >  drivers/gpu/drm/xlnx/Makefile   |   2 +
> > >  drivers/gpu/drm/xlnx/xlnx_dsi.c | 755 ++++++++++++++++++++++++++++++++++++++++
> 
> Daniel Vetter has recently expressed his opiion that bridge drivers
> should go to drivers/gpu/drm/bridge/. It would then be
> drivers/gpu/drm/bridge/xlnx/. I don't have a strong opinion myself.
> 
> > >  3 files changed, 768 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c
> > > 
> > > diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
> > > index aa6cd88..73873cf 100644
> > > --- a/drivers/gpu/drm/xlnx/Kconfig
> > > +++ b/drivers/gpu/drm/xlnx/Kconfig
> > > @@ -11,3 +11,14 @@ config DRM_ZYNQMP_DPSUB
> > >  	  This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose
> > >  	  this option if you have a Xilinx ZynqMP SoC with DisplayPort
> > >  	  subsystem.
> > > +
> > > +config DRM_XLNX_DSI
> > > +        tristate "Xilinx DRM DSI Subsystem Driver"
> > > +        select DRM_MIPI_DSI
> > > +        select DRM_PANEL
> > > +        select DRM_PANEL_SIMPLE
> > > +        help
> > > +	  This enables support for Xilinx MIPI-DSI.
> > 
> > This sentence is not needed with below. Could you please rephrase the whole?
> > 
> > > +	  This is a DRM/KMS driver for Xilinx programmable DSI controller.
> > > +	  Choose this option if you have a Xilinx MIPI DSI-TX controller
> > > +	  subsytem.
> > 
> > These seem incorrectly indented.
> > 
> > > diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
> > > index 2b844c6..b7ee6ef 100644
> > > --- a/drivers/gpu/drm/xlnx/Makefile
> > > +++ b/drivers/gpu/drm/xlnx/Makefile
> > > @@ -1,2 +1,4 @@
> > >  zynqmp-dpsub-objs += zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
> > >  obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
> > > +
> > > +obj-$(CONFIG_DRM_XLNX_DSI) += xlnx_dsi.o
> > > diff --git a/drivers/gpu/drm/xlnx/xlnx_dsi.c b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> > > new file mode 100644
> > > index 0000000..b8cae59
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> > > @@ -0,0 +1,755 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Xilinx FPGA MIPI DSI Tx Controller driver
> > > + *
> > > + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> > > + *
> > > + * Authors:
> > > + * - Saurabh Sengar <saurabhs@xilinx.com>
> > > + * - Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> > > + */
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_connector.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_crtc_helper.h>
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_encoder.h>
> > > +#include <drm/drm_fourcc.h>
> > > +#include <drm/drm_gem_cma_helper.h>
> > > +#include <drm/drm_mipi_dsi.h>
> > > +#include <drm/drm_panel.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/component.h>
> > > +#include <linux/device.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/phy/phy.h>
> > > +
> > > +#include <video/mipi_display.h>
> > > +#include <video/videomode.h>
> > > +
> > > +/* DSI Tx IP registers */
> > > +#define XDSI_CCR			0x00
> > > +#define XDSI_CCR_COREENB		BIT(0)
> > > +#define XDSI_CCR_SOFTRST		BIT(1)
> > > +#define XDSI_CCR_CRREADY		BIT(2)
> > > +#define XDSI_CCR_CMDMODE		BIT(3)
> > > +#define XDSI_CCR_DFIFORST		BIT(4)
> > > +#define XDSI_CCR_CMDFIFORST		BIT(5)
> > > +#define XDSI_PCR			0x04

[snip]

> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(dsi->video_aclk);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to enable video clk %d\n", ret);
> > > +		goto err_disable_dphy_clk;
> > > +	}
> > > +
> > > +	ret = component_add(dev, &xlnx_dsi_component_ops);
> 
> The driver should expose the DSI-TX as a drm_bridge instead of using the
> component framework. You shouldn't register a drm_encoder, and I don't
> think you should register a drm_connector either. Only bridge operations
> should be exposed, and the drm_bridge .attach() operation should return
> an error when DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set. The top-level
> driver using this bridge should create the drm_encoder and
> drm_connector, most likely using drm_bridge_connector_init() to create
> the connector.
> 

Not clear to me if this has to be a bridge, and then what it will be attached
to. The IP block itself pretty much self-contains all functionalities already,
just like any other drm encoder / connector, so it doesn't have to be wrapped
around by any other layer. Please let me know your thought, so I can understand
better. :-)

Thanks,
-hyun

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
