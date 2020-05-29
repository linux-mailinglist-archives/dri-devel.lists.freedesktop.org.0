Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BCF1E8B57
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 00:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187776E25A;
	Fri, 29 May 2020 22:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760043.outbound.protection.outlook.com [40.107.76.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8F96E25A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 22:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbOdmzj3mUlpDGjCEEO2QNePSaMuR6FfYe3To5VoeeymAzNrz3RVQpmKSd9mOZySoay4Wna3BUlzv0karh5AjcW+I+TPOWnyxoN0u/ZM2ZSwLrfsLWEx3Cz2ibT1yh4ogzJM58P9jFHP2YGMmG80lKLzi8Bru2xGpU+OU0vIbKfONmG5P3oPfMQnZxXkso0Lo9cyZ9ZtvobgIo5Me8zUG8ag39XbZpqmIrudZ+36XETzzkCnqCPBQvjlcK0dN1TXvVDfE7bfUQeNr79ZLjSz8RupE1psVrUJxG0FEP4Cl4nUW0J3mkGyZa1rpIvkKGs0guzRWRiDGYAIef3vG1hOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBje5mzUrH/KATmqAI3CAFCDZS1TaVqC7RaCVRRKo/Q=;
 b=eu7CZLokL9eAb+05RoPXu/1sT7l2fiJMdAr9y/nyH6bIY2oFDNJcwGetyo0aZEVJUbiGHlEOmOoY2j2otXq66lfsu3mZ6AMJBfX4NtVpU4e2tfNPXHHtjam7UgpPHkEJQaUsSLjk1VeChcg+4d6X7cOols5XMFnK3sNhPfc2YvpifiB7dTCVMjkN0MH0NDfPttVi653c6OTns2itsh5tRhlm+PRoPJ9979dKOsg9kRJK9v8mrbwaxmeQeekbk4Z84+5hQWOvbQbhiD00J+rzsFij4aU6vdjyW7FlykJimacQQ/UfAv+9nY6dc67QvanslSTq77FfbznjautaoDw0cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBje5mzUrH/KATmqAI3CAFCDZS1TaVqC7RaCVRRKo/Q=;
 b=PNsaQJkGQfNbijtMKyjLhvkiIfScPSZfEIQn6+FVULJoxR/wPXCSlWPLMPLKVFxapCL0ExnmNhXgBQyV8bLDAbDRvCLNvsVoMFv4Y/I9XgnKB+71tjE3XRasuNDlUhAOERHZ4LXB5BpiS9X4VGV/95u+bXNpXXVqwmKm4TCmThA=
Received: from SN6PR04CA0100.namprd04.prod.outlook.com (2603:10b6:805:f2::41)
 by BN7PR02MB5250.namprd02.prod.outlook.com (2603:10b6:408:30::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 22:28:30 +0000
Received: from SN1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::80) by SN6PR04CA0100.outlook.office365.com
 (2603:10b6:805:f2::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Fri, 29 May 2020 22:28:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT040.mail.protection.outlook.com (10.152.72.195) with Microsoft SMTP
 Server id 15.20.3045.17 via Frontend Transport; Fri, 29 May 2020 22:28:30
 +0000
Received: from [149.199.38.66] (port=48604 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1jenTi-0000gf-JF; Fri, 29 May 2020 15:27:50 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1jenUM-00037R-4h; Fri, 29 May 2020 15:28:30 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04TMSNjJ007703; 
 Fri, 29 May 2020 15:28:24 -0700
Received: from [172.19.2.244] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1jenUF-00036d-UV; Fri, 29 May 2020 15:28:23 -0700
Date: Fri, 29 May 2020 15:28:23 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH 2/2] drm: xlnx: driver for Xilinx DSI TX Subsystem
Message-ID: <20200529222823.GA32429@smtp.xilinx.com>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1587417656-48078-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <20200504184348.GA3095@smtp.xilinx.com>
 <20200524030813.GF6026@pendragon.ideasonboard.com>
 <20200527175435.GA26381@smtp.xilinx.com>
 <20200527224524.GH6171@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527224524.GH6171@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(376002)(136003)(39860400002)(46966005)(186003)(26005)(8676002)(478600001)(44832011)(426003)(83380400001)(33656002)(2906002)(336012)(4326008)(5660300002)(82740400003)(8936002)(9786002)(6916009)(47076004)(316002)(82310400002)(356005)(70586007)(107886003)(70206006)(1076003)(81166007)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98031c52-bd7c-46df-520a-08d8041f9d6c
X-MS-TrafficTypeDiagnostic: BN7PR02MB5250:
X-Microsoft-Antispam-PRVS: <BN7PR02MB525051F2D88E5C578FE47EADD68F0@BN7PR02MB5250.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lgLsAvbq0Y5grx7DgwoBQ7YFf7AirJXIBnFK1fb+K0a8lhRQg6k0t5drrYgWUMRenxnjst4a067/19VSXQHQX7GxECEL4cLwByq8j6aY9WdOCaYy19eDwiMKQFFWSUelcx/+kbAorEO3DneAOEJDpmYPowTekomcsh1BCRrPk4yFZddrYSWPFkTJKU1lysbyg/kL3EBxwgnJ1ENcMi3oCihv4YN2FsQLqiqk4MOh0yCTfhTHoiCmeQ2ta3tjHTusPMD1xuSj9HK3/GTyxmmRVVvpT1iyIp5guU4SluOlwL0R8k1xQbwTwwKUiZlL6j3YYEshmvCOaE9WyoqjUiDB76tp9UdjOPWTSdFHwiL//IN5cU6xdg4TA9RfqsVE1n5b+6PoZ72p4a1nlk4sAudVOQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 22:28:30.4374 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98031c52-bd7c-46df-520a-08d8041f9d6c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5250
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

On Wed, 2020-05-27 at 15:45:24 -0700, Laurent Pinchart wrote:
> Hi Hyun,
> 
> On Wed, May 27, 2020 at 10:54:35AM -0700, Hyun Kwon wrote:
> > On Sat, 2020-05-23 at 20:08:13 -0700, Laurent Pinchart wrote:
> > > On Mon, May 04, 2020 at 11:43:48AM -0700, Hyun Kwon wrote:
> > >> On Mon, 2020-04-20 at 14:20:56 -0700, Venkateshwar Rao Gannavarapu wrote:
> > >>> The Xilinx MIPI DSI Tx Subsystem soft IP is used to display video
> > >>> data from AXI-4 stream interface.
> > >>> 
> > >>> It supports upto 4 lanes, optional register interface for the DPHY,
> > >> 
> > >> I don't see the register interface for dphy support.
> > > 
> > > I think the D-PHY should be supported through a PHY driver, as it seems
> > > to be shared between different subsystems.
> > 
> > Right, if the logic is shared across subsystems. I can't tell if that's
> > the case as the IP comes as a single block. Maybe GVRao can confirm.
> 
> I believe the CSI2-RX subsystem uses the same D-PHY IP core, but a
> confirmation would be nice.
> 
> > >>> multiple RGB color formats, command mode and video mode.
> > >>> This is a MIPI-DSI host driver and provides DSI bus for panels.
> > >>> This driver also helps to communicate with its panel using panel
> > >>> framework.
> > >>> 
> > >>> Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> > >>> ---
> > >>>  drivers/gpu/drm/xlnx/Kconfig    |  11 +
> > >>>  drivers/gpu/drm/xlnx/Makefile   |   2 +
> > >>>  drivers/gpu/drm/xlnx/xlnx_dsi.c | 755 ++++++++++++++++++++++++++++++++++++++++
> > > 
> > > Daniel Vetter has recently expressed his opiion that bridge drivers
> > > should go to drivers/gpu/drm/bridge/. It would then be
> > > drivers/gpu/drm/bridge/xlnx/. I don't have a strong opinion myself.
> > > 
> > >>>  3 files changed, 768 insertions(+)
> > >>>  create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c
> > >>> 
> > >>> diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
> > >>> index aa6cd88..73873cf 100644
> > >>> --- a/drivers/gpu/drm/xlnx/Kconfig
> > >>> +++ b/drivers/gpu/drm/xlnx/Kconfig
> > >>> @@ -11,3 +11,14 @@ config DRM_ZYNQMP_DPSUB
> > >>>  	  This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose
> > >>>  	  this option if you have a Xilinx ZynqMP SoC with DisplayPort
> > >>>  	  subsystem.
> > >>> +
> > >>> +config DRM_XLNX_DSI
> > >>> +        tristate "Xilinx DRM DSI Subsystem Driver"
> > >>> +        select DRM_MIPI_DSI
> > >>> +        select DRM_PANEL
> > >>> +        select DRM_PANEL_SIMPLE
> > >>> +        help
> > >>> +	  This enables support for Xilinx MIPI-DSI.
> > >> 
> > >> This sentence is not needed with below. Could you please rephrase the whole?
> > >> 
> > >>> +	  This is a DRM/KMS driver for Xilinx programmable DSI controller.
> > >>> +	  Choose this option if you have a Xilinx MIPI DSI-TX controller
> > >>> +	  subsytem.
> > >> 
> > >> These seem incorrectly indented.
> > >> 
> > >>> diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
> > >>> index 2b844c6..b7ee6ef 100644
> > >>> --- a/drivers/gpu/drm/xlnx/Makefile
> > >>> +++ b/drivers/gpu/drm/xlnx/Makefile
> > >>> @@ -1,2 +1,4 @@
> > >>>  zynqmp-dpsub-objs += zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
> > >>>  obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
> > >>> +
> > >>> +obj-$(CONFIG_DRM_XLNX_DSI) += xlnx_dsi.o
> > >>> diff --git a/drivers/gpu/drm/xlnx/xlnx_dsi.c b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> > >>> new file mode 100644
> > >>> index 0000000..b8cae59
> > >>> --- /dev/null
> > >>> +++ b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> > >>> @@ -0,0 +1,755 @@
> > >>> +// SPDX-License-Identifier: GPL-2.0
> > >>> +/*
> > >>> + * Xilinx FPGA MIPI DSI Tx Controller driver
> > >>> + *
> > >>> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> > >>> + *
> > >>> + * Authors:
> > >>> + * - Saurabh Sengar <saurabhs@xilinx.com>
> > >>> + * - Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> > >>> + */
> > >>> +
> > >>> +#include <drm/drm_atomic_helper.h>
> > >>> +#include <drm/drm_connector.h>
> > >>> +#include <drm/drm_crtc.h>
> > >>> +#include <drm/drm_crtc_helper.h>
> > >>> +#include <drm/drm_device.h>
> > >>> +#include <drm/drm_encoder.h>
> > >>> +#include <drm/drm_fourcc.h>
> > >>> +#include <drm/drm_gem_cma_helper.h>
> > >>> +#include <drm/drm_mipi_dsi.h>
> > >>> +#include <drm/drm_panel.h>
> > >>> +#include <drm/drm_probe_helper.h>
> > >>> +
> > >>> +#include <linux/clk.h>
> > >>> +#include <linux/component.h>
> > >>> +#include <linux/device.h>
> > >>> +#include <linux/iopoll.h>
> > >>> +#include <linux/of_device.h>
> > >>> +#include <linux/of_graph.h>
> > >>> +#include <linux/phy/phy.h>
> > >>> +
> > >>> +#include <video/mipi_display.h>
> > >>> +#include <video/videomode.h>
> > >>> +
> > >>> +/* DSI Tx IP registers */
> > >>> +#define XDSI_CCR			0x00
> > >>> +#define XDSI_CCR_COREENB		BIT(0)
> > >>> +#define XDSI_CCR_SOFTRST		BIT(1)
> > >>> +#define XDSI_CCR_CRREADY		BIT(2)
> > >>> +#define XDSI_CCR_CMDMODE		BIT(3)
> > >>> +#define XDSI_CCR_DFIFORST		BIT(4)
> > >>> +#define XDSI_CCR_CMDFIFORST		BIT(5)
> > >>> +#define XDSI_PCR			0x04
> > 
> > [snip]
> > 
> > >>> +	}
> > >>> +
> > >>> +	ret = clk_prepare_enable(dsi->video_aclk);
> > >>> +	if (ret) {
> > >>> +		dev_err(dev, "failed to enable video clk %d\n", ret);
> > >>> +		goto err_disable_dphy_clk;
> > >>> +	}
> > >>> +
> > >>> +	ret = component_add(dev, &xlnx_dsi_component_ops);
> > > 
> > > The driver should expose the DSI-TX as a drm_bridge instead of using the
> > > component framework. You shouldn't register a drm_encoder, and I don't
> > > think you should register a drm_connector either. Only bridge operations
> > > should be exposed, and the drm_bridge .attach() operation should return
> > > an error when DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set. The top-level
> > > driver using this bridge should create the drm_encoder and
> > > drm_connector, most likely using drm_bridge_connector_init() to create
> > > the connector.
> > 
> > Not clear to me if this has to be a bridge, and then what it will be attached
> > to. The IP block itself pretty much self-contains all functionalities already,
> > just like any other drm encoder / connector, so it doesn't have to be wrapped
> > around by any other layer. Please let me know your thought, so I can understand
> > better. :-)
> 
> The DSI output will likely often be connected to a DSI panel, but it
> could also be connected to another bridge, for instance to an ADV7533
> DSI-to-HDMI bridge. In that case an HDMI connector needs to be created,
> not a DSI connector. This is why we are moving towards a model where
> bridge drivers only handle the bridge device, and the drm_encoder and
> drm_connector is created externally, but the display controller driver.
> The drm_bridge_connector_init() helper can automate connector creation
> for a chain of bridges.

Ah I see. Thanks for explanation. It seems relatively new changes and more
scalable. The above case is less likely with FPGA pipeline. But right, it can
still happen in certain cases, ex with 96 boards that have DSI interface only,
and that will help. So I believe encoder / connector drivers (there are more
in Xilinx tree) need to be converted to bridges, with a new top level driver
handling the bridges.

Thanks,
-hyun

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
