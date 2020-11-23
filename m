Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38062C05C9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 13:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6FF89D5C;
	Mon, 23 Nov 2020 12:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C109889D5C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 12:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dek+EKLtpmP5T8W7QhnvHRRykG4sJI3hmHwz+3zX4H9xhzig69EwU0zwhRTG6g339gZLAvR0KLriDAwIJcS5t+hkBfGVacIZlRF6buz1fUoMtYUVzRB453sLqG/5mw1hM5ST6cHTDET79JptOLwfnKWYKuhJfXCA9A3jdW/RQ2wwZNme+BazQvBr0v3Q0KhVAdAHgCOZmknfVmqUNn5BK/wPj0Yi1qaNYJn6q1NwF+aVuySzOj7BzfAAwu64tbP1J5LMp2fU+7VT1liRCdHGsxAZYhksyAlCvZR7aH15PCuNDVJ3QF3cz2Ma11nVFETGDdPQpFL23P9OvICZtEDFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWNFGVxvXD8ksoyR0vBqajl7AxzGw3NOzQvo7B42s+M=;
 b=gBI/MrhwbaHNqzHbkVUmQEDb2RnOt5potv3euxQvKiFsoj6qqMZ2dE7bzSE33Ev9/6rv99kF5+LmtqOBLgmAziHf7Esq3w2bl5FKCuvzQyS17cZWqz1hIX+hB+1ugCHVdVHvnsSn/vrcRT0HoqM6hlFpAR3N3lQkvjblBzncbm57q0WAtvmpORHPDjfNtbaZSnQQC61Ajp+tlOych08hzZZY05b/NeZibt4CLlx5lqfMLWtQrVlDWwJJua9DLVQ9/b6P4eZwH1D9ujjLi5Ina+/lQDsQ22lgwBm759yXQnt50EE8P7MgvCTLPPrXmb2OldXosK8IPGDrGiuEmoUWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWNFGVxvXD8ksoyR0vBqajl7AxzGw3NOzQvo7B42s+M=;
 b=Z9fq0kCbhxGYEucj/Rea+IXyW/3CWyx5hSPNiitozgQ/MP3oAuMxs0fdo9Xhb3lucTszJS3x+wFvDnCb4AVSCkesGDE9v1+T+6m1TKPulRCQBkuHVXxm6vO4Knq5+1Zde93Ytbj+m41WIqmz0w3avyuzNVzDnOjwCITfsZOVbxY=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VE1PR04MB6608.eurprd04.prod.outlook.com
 (2603:10a6:803:125::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Mon, 23 Nov
 2020 12:33:49 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::705a:b82f:c52f:5f5a]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::705a:b82f:c52f:5f5a%6]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 12:33:49 +0000
Date: Mon, 23 Nov 2020 14:33:44 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 5/8] drm/imx: Introduce i.MX8qxp DPU DRM
Message-ID: <20201123123343.4un72imbnweah4tx@fsr-ub1864-141>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
 <1605777745-23625-6-git-send-email-victor.liu@nxp.com>
 <20201120143819.lzytfnoxvekweubx@fsr-ub1864-141>
 <cc4d7b04f1f44ff4b69f0f48b5dd64b489463c30.camel@nxp.com>
Content-Disposition: inline
In-Reply-To: <cc4d7b04f1f44ff4b69f0f48b5dd64b489463c30.camel@nxp.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM0PR06CA0079.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::20) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR06CA0079.eurprd06.prod.outlook.com (2603:10a6:208:fa::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 12:33:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b970a2fb-aec0-4961-3d90-08d88fac06b7
X-MS-TrafficTypeDiagnostic: VE1PR04MB6608:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6608B8EA58EA355ED96D9B56BEFC0@VE1PR04MB6608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLqBYJNiSDt9oUYCdDSQeHwtxzuOxxgqdLB/toIWzhHo1cHOC4MF3djd9otsKOxyFU7x3RBjCzOsLxoRQCmLHt6Deq4EPzsSdLtUBMTCZE0GktG9CepT7ltqhEDiHXPeEWaDWrPH3p7PqE5jqrDrYHFad0Il1v8nX/FsxXr2WbFTfygtdpzChyfczJkIcUyTcf/zd4MT+05TZeCHLPoM0dAikNtRBe2/WQ6lsYIaLPUYX2sFxSbuGbPD+7pDR00pQu3f0/CHudxih1DZAoL2x+fRuZyBtoywSceKBwKjvzjTrann87n+d4AQU5yVHYkWIAzgvqCAZkzSmK4mnzPy2JzR8uLeo4W82PoKpIDYwxWWg0JV4H+4Avn8DIQLTdEXVL/gRlYN0z+bVaULGHjBVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(83380400001)(4326008)(6862004)(966005)(478600001)(9686003)(55016002)(2906002)(4001150100001)(66556008)(66476007)(66946007)(956004)(8936002)(8676002)(5660300002)(6496006)(30864003)(1076003)(33716001)(44832011)(86362001)(7416002)(186003)(16526019)(52116002)(54906003)(316002)(26005)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: E1XFOVgYlyNfNmX4o5cNr2tKTPdGnCpyDNM5UdcYawWuhFcjCXbSDejQBixOrjAd5mg4ZtNlTaFCQW32nbPO0sraXNWq548BVift81GrEC5/I3ER/TPIVD86VgXCsQn/KeDxdMccQWlI0KeqhYpTkeO2l1Z9euWVqjEtUO+ayo86UEuG2G/o4h8iMJzTW2NwTvE9f/kzKqsEDT6YzfVKLzUPkxT+hbwaKb1bkw+eFV4OSem4Hth6LgAun9OCkfK/h/GpSo0EIYz8uTjbxrNZ0LmJoNMQs4/4400vjgTF0S6m8CPX7nQpG8YE2zaTdJ81ojmCgydkciHA0QLAAsfsffo+fnwjPsRhcAF1W//6SAK+LFyPyB3hT/r9hE0ity5dtIA31dbBkOkywjXcuSBhUZj1KQrG28j3Bn5+p6glSgQUsvzSWiAq9sEjIJIS4i1YY1Kt6cWqvlLlipnVnvvpxp5CEfZ4l0DrTB3hHrDfz1N0g7/xddF2/p3eQkcL2H1y5+o3lPZOELTzhuItxBd5Fq8Mdn2l/OpWd+J59EyeWHaaK4AbOpogNk7VC1Ngpwftg+UWBjKhd4KLxaPfU9Sul1ONPYLI/nymBAjGMMWj7GXkEu1p7uQR3mXVmtNzV1ngbYyHOP/HoCm3uxDNNqPPxuyIuhutvWEM4wfhhs73bN49X/mWfU2yf+6UdDphA/LAD5DUrNrWBqWgyrHgP/RBE36lUb/jaVTBSSwQ2f/FwKOaCZa2wqTQdD8RPwo4+BqZXAhRVxtIU7PqUg7U9TEYpnv1aex5H0RaldDHVVniwl7+MVGXF0aegpxKfw0QfMw0NHke/tS6/9hwbkEbQtl0+T2f+dAx+fTgSXEw/HSFt5RTR0HuG1b7n77vqueB3umJX6S40YKa/t+5iOzYXHNK3g==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b970a2fb-aec0-4961-3d90-08d88fac06b7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 12:33:49.0909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qw2HTD7YOi3rhYety+LTiYTgMmC7lEq39FcrIB+5GCKSNdfQotedkB9YnjcJXgGHH14tmRin5qymDPjZ5Zk2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6608
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu Ying,

On Mon, Nov 23, 2020 at 10:45:38AM +0800, Liu Ying wrote:
> Hi Laurentiu,
> 
> On Fri, 2020-11-20 at 16:38 +0200, Laurentiu Palcu wrote:
> > Hi Liu Ying,
> > 
> > I gave this a first look but, since this is a huge piece of code and I'm not
> > very familiar with DPU, I'll probably give it another pass next week.
> > 
> > Anyway, some comments/questions inline.
> > 
> > On Thu, Nov 19, 2020 at 11:22:22AM +0200, Liu Ying wrote:
> > > This patch introduces i.MX8qxp Display Processing Unit(DPU) DRM support.
> > > 
> > > DPU is comprised of two main components that include a blit engine for
> > > 2D graphics accelerations(with composition support) and a display controller
> > > for display output processing, as well as a command sequencer.  Outside of
> > > DPU, optional prefetch engines, a.k.a, Prefetch Resolve Gasket(PRG) and
> > > Display Prefetch Resolve(DPR), can fetch data from memory prior to some DPU
> > > fetchunits of blit engine and display controller.  The prefetch engines
> > > support reading linear formats and resolving Vivante GPU tile formats.
> > > 
> > > This patch adds kernel modesetting support for the display controller part.
> > > The driver supports two CRTCs per display controller, planes backed by
> > > four fetchunits(decode0/1, fetchlayer, fetchwarp), fetchunit allocation
> > > logic for the two CRTCs, prefetch engines(with tile resolving supported),
> > > plane upscaling/deinterlacing/yuv2rgb CSC/alpha blending and CRTC gamma
> > > correction.  The registers of the controller is accessed without command
> > > sequencer involved, instead just by using CPU.
> > 
> > Will you also add support for command sequencer in the future? The command
> > sequencer seems to have the same purpose as the DCSS context loader on iMX8MQ,
> > which is very useful for configuring the various DC blocks right in the
> > blanking period without having to worry about synchronization. Why not use it
> > from the very beginning?
> 
> The single command sequencer(cmdseq) per DPU supports
> NOP/CALL/RET/WRITE/COPY/CCOPY/SYNC instructions.
> 
> It is designed to autonomously process command lists.
> 
> Two reasons for not using cmdseq for display controller(kms):
> 
> 1) performance consideration:
> 
> The SYNC instruction stops processing the subsequent command list until
> one specific hardware event of the DPU is triggered, like shadow loaded
> event, ComCtrl_SW0(cmdseq sequence complete event), etc. To use the
> autonomous command list processing, we would queue command blocks to a
> chain. The command blocks are usually comprised of some initial WRITE
> instructions and a final SYNC instruction(to make sure the WRITE
> instructions take effect).  The command blocks could be for blit engine
> or display controller.  As blit engine and display controller
> operations are naturally async, those SYNC instructions would impact
> the blit and display performance.  Even the two display pipelines(two
> CRTCs) of DPU themselves could impact each other's performance, because
> there could be parallel atomic commits for the two pipelines. 
> 
> 2) no cmdseq read instructions: 
> 
> The KMS driver for the display controller needs to read DPU registers
> to report CRTC scannout position, vlbank count and CRC data(DPU
> Signature units). Also, it needs to read DPU registers to sync some
> events(like FrameGen counter moving). Inserting CPU read operations
> into command sequence would pollute the pure cmdseq programming model.
> 
> 
> In general, cmdseq is probably better to be reserved for blit engine,
> since I assume blit engine, as a 2D engine, usually doesn't need
> reading registers.  Also, blit performance would be good.

Thanks for clarifying this.

> 
> > 
> > > Reference manual can be found at:
> > > https://www.nxp.com/webapp/Download?colCode=IMX8DQXPRM
> > > 
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > 
> > [...]
> > 
> > > diff --git a/drivers/gpu/drm/imx/dpu/dpu-core.c b/drivers/gpu/drm/imx/dpu/dpu-core.c
> > > new file mode 100644
> > > index 00000000..1583c7a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/imx/dpu/dpu-core.c
> > > @@ -0,0 +1,880 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +/*
> > > + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> > > + * Copyright 2017-2020 NXP
> > > + */
> > > +
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/io.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/irqchip/chained_irq.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_domain.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/sizes.h>
> > > +
> > > +#include "dpu.h"
> > > +#include "dpu-prv.h"
> > > +
> > > +static inline u32 dpu_comctrl_read(struct dpu_soc *dpu, unsigned int offset)
> > > +{
> > > +	return readl(dpu->comctrl_reg + offset);
> > > +}
> > > +
> > > +static inline void dpu_comctrl_write(struct dpu_soc *dpu,
> > > +				     unsigned int offset, u32 value)
> > > +{
> > > +	writel(value, dpu->comctrl_reg + offset);
> > > +}
> > > +
> > > +/* Constant Frame */
> > > +static const unsigned int cf_ids[] = {0, 1, 4, 5};
> > > +static const enum dpu_unit_type cf_types[] = {DPU_DISP, DPU_DISP,
> > > +					      DPU_DISP, DPU_DISP};
> > > +static const unsigned long cf_ofss[] = {0x4400, 0x5400, 0x4c00, 0x5c00};
> > > +static const unsigned long cf_pec_ofss[] = {0x960, 0x9e0, 0x9a0, 0xa20};
> > > +
> > > +/* Display Engine Configuration */
> > > +static const unsigned int dec_ids[] = {0, 1};
> > > +static const enum dpu_unit_type dec_types[] = {DPU_DISP, DPU_DISP};
> > > +static const unsigned long dec_ofss[] = {0xb400, 0xb420};
> > > +
> > > +/* External Destination */
> > > +static const unsigned int ed_ids[] = {0, 1, 4, 5};
> > > +static const enum dpu_unit_type ed_types[] = {DPU_DISP, DPU_DISP,
> > > +					      DPU_DISP, DPU_DISP};
> > > +static const unsigned long ed_ofss[] = {0x4800, 0x5800, 0x5000, 0x6000};
> > > +static const unsigned long ed_pec_ofss[] = {0x980, 0xa00, 0x9c0, 0xa40};
> > > +
> > > +/* Fetch Decode */
> > > +static const unsigned int fd_ids[] = {0, 1, 9};
> > > +static const enum dpu_unit_type fd_types[] = {DPU_DISP, DPU_DISP, DPU_BLIT};
> > > +static const unsigned long fd_ofss[] = {0x6c00, 0x7800, 0x1000};
> > > +static const unsigned long fd_pec_ofss[] = {0xa80, 0xaa0, 0x820};
> > > +
> > > +/* Fetch ECO */
> > > +static const unsigned int fe_ids[] = {0, 1, 2, 9};
> > > +static const enum dpu_unit_type fe_types[] = {DPU_DISP, DPU_DISP,
> > > +					      DPU_DISP, DPU_BLIT};
> > > +static const unsigned long fe_ofss[] = {0x7400, 0x8000, 0x6800, 0x1c00};
> > > +static const unsigned long fe_pec_ofss[] = {0xa90, 0xab0, 0xa70, 0x850};
> > > +
> > > +/* Frame Generator */
> > > +static const unsigned int fg_ids[] = {0, 1};
> > > +static const enum dpu_unit_type fg_types[] = {DPU_DISP, DPU_DISP};
> > > +static const unsigned long fg_ofss[] = {0xb800, 0xd400};
> > > +
> > > +/* Fetch Layer */
> > > +static const unsigned int fl_ids[] = {0};
> > > +static const enum dpu_unit_type fl_types[] = {DPU_DISP};
> > > +static const unsigned long fl_ofss[] = {0x8400};
> > > +static const unsigned long fl_pec_ofss[] = {0xac0};
> > > +
> > > +/* Fetch Warp */
> > > +static const unsigned int fw_ids[] = {2, 9};
> > > +static const enum dpu_unit_type fw_types[] = {DPU_DISP, DPU_BLIT};
> > > +static const unsigned long fw_ofss[] = {0x6400, 0x1800};
> > > +static const unsigned long fw_pec_ofss[] = {0xa60, 0x840};
> > > +
> > > +/* Gamma Correction */
> > > +static const unsigned int gc_ids[] = {0, 1};
> > > +static const enum dpu_unit_type gc_types[] = {DPU_DISP, DPU_DISP};
> > > +static const unsigned long gc_ofss[] = {0xc000, 0xdc00};
> > > +
> > > +/* Horizontal Scaler */
> > > +static const unsigned int hs_ids[] = {4, 5, 9};
> > > +static const enum dpu_unit_type hs_types[] = {DPU_DISP, DPU_DISP, DPU_BLIT};
> > > +static const unsigned long hs_ofss[] = {0x9000, 0x9c00, 0x3000};
> > > +static const unsigned long hs_pec_ofss[] = {0xb00, 0xb60, 0x8c0};
> > > +
> > > +/* Layer Blend */
> > > +static const unsigned int lb_ids[] = {0, 1, 2, 3};
> > > +static const enum dpu_unit_type lb_types[] = {DPU_DISP, DPU_DISP,
> > > +					      DPU_DISP, DPU_DISP};
> > > +static const unsigned long lb_ofss[] = {0xa400, 0xa800, 0xac00, 0xb000};
> > > +static const unsigned long lb_pec_ofss[] = {0xba0, 0xbc0, 0xbe0, 0xc00};
> > > +
> > > +/* Timing Controller */
> > > +static const unsigned int tcon_ids[] = {0, 1};
> > > +static const enum dpu_unit_type tcon_types[] = {DPU_DISP, DPU_DISP};
> > > +static const unsigned long tcon_ofss[] = {0xc800, 0xe400};
> > > +
> > > +/* Vertical Scaler */
> > > +static const unsigned int vs_ids[] = {4, 5, 9};
> > > +static const enum dpu_unit_type vs_types[] = {DPU_DISP, DPU_DISP, DPU_BLIT};
> > > +static const unsigned long vs_ofss[] = {0x9400, 0xa000, 0x3400};
> > > +static const unsigned long vs_pec_ofss[] = {0xb20, 0xb80, 0x8e0};
> > > +
> > > +#define DPU_UNITS_DEFINE(unit)			\
> > > +static const struct dpu_units dpu_##unit##s = {	\
> > > +	.ids = unit##_ids,			\
> > > +	.types = unit##_types,			\
> > > +	.ofss = unit##_ofss,			\
> > > +	.pec_ofss = unit##_pec_ofss,		\
> > > +	.cnt = ARRAY_SIZE(unit##_ids),		\
> > > +}
> > > +
> > > +/* units without Pixel Engine Configuration */
> > > +#define DPU_UNITS_DEFINE_NO_PEC(unit)		\
> > > +static const struct dpu_units dpu_##unit##s = {	\
> > > +	.ids = unit##_ids,			\
> > > +	.types = unit##_types,			\
> > > +	.ofss = unit##_ofss,			\
> > > +	.pec_ofss = NULL,			\
> > > +	.cnt = ARRAY_SIZE(unit##_ids),		\
> > > +}
> > > +
> > > +DPU_UNITS_DEFINE(cf);
> > > +DPU_UNITS_DEFINE_NO_PEC(dec);
> > > +DPU_UNITS_DEFINE(ed);
> > > +DPU_UNITS_DEFINE(fd);
> > > +DPU_UNITS_DEFINE(fe);
> > > +DPU_UNITS_DEFINE_NO_PEC(fg);
> > > +DPU_UNITS_DEFINE(fl);
> > > +DPU_UNITS_DEFINE(fw);
> > > +DPU_UNITS_DEFINE_NO_PEC(gc);
> > > +DPU_UNITS_DEFINE(hs);
> > > +DPU_UNITS_DEFINE(lb);
> > > +DPU_UNITS_DEFINE_NO_PEC(tcon);
> > > +DPU_UNITS_DEFINE(vs);
> > > +
> > > +static void dpu_detach_pm_domains(struct dpu_soc *dpu)
> > > +{
> > > +#define DPU_DETACH_PM_DOMAIN(name)					\
> > > +do {									\
> > > +	if (!IS_ERR_OR_NULL(dpu->pd_##name##_link))			\
> > > +		device_link_del(dpu->pd_##name##_link);			\
> > > +	if (!IS_ERR_OR_NULL(dpu->pd_##name##_dev))			\
> > > +		dev_pm_domain_detach(dpu->pd_##name##_dev, true);	\
> > > +									\
> > > +	dpu->pd_##name##_dev = NULL;					\
> > > +	dpu->pd_##name##_link = NULL;					\
> > > +} while (0)
> > > +
> > > +	DPU_DETACH_PM_DOMAIN(pll1);
> > > +	DPU_DETACH_PM_DOMAIN(pll0);
> > > +	DPU_DETACH_PM_DOMAIN(dc);
> > > +}
> > > +
> > > +static int dpu_attach_pm_domains(struct dpu_soc *dpu)
> > > +{
> > > +	u32 flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE;
> > > +	int ret = 0;
> > > +
> > > +#define DPU_ATTACH_PM_DOMAIN(name)					\
> > > +do {									\
> > > +	dpu->pd_##name##_dev =						\
> > > +		dev_pm_domain_attach_by_name(dpu->dev, "" #name "");	\
> > > +	if (IS_ERR(dpu->pd_##name##_dev)) {				\
> > > +		ret = PTR_ERR(dpu->pd_##name##_dev);			\
> > > +		dev_err(dpu->dev,					\
> > > +			"failed to attach " #name " pd dev: %d\n", ret);\
> > > +		goto fail;						\
> > > +	}								\
> > > +									\
> > > +	dpu->pd_##name##_link =						\
> > > +		device_link_add(dpu->dev, dpu->pd_##name##_dev, flags);	\
> > > +	if (IS_ERR(dpu->pd_##name##_link)) {				\
> > > +		ret = PTR_ERR(dpu->pd_##name##_link);			\
> > > +		dev_err(dpu->dev,					\
> > > +			"failed to add device link to " #name		\
> > > +			" pd dev: %d\n", ret);				\
> > > +		goto fail;						\
> > > +	}								\
> > > +} while (0)
> > > +
> > > +	DPU_ATTACH_PM_DOMAIN(dc);
> > > +	DPU_ATTACH_PM_DOMAIN(pll0);
> > > +	DPU_ATTACH_PM_DOMAIN(pll1);
> > > +
> > > +	return ret;
> > > +fail:
> > > +	dpu_detach_pm_domains(dpu);
> > > +	return ret;
> > > +}
> > > +
> > > +static void dpu_units_addr_dbg(struct dpu_soc *dpu, unsigned long dpu_base)
> > > +{
> > > +	int i;
> > > +
> > > +	dev_dbg(dpu->dev, "Common Control: 0x%08lx\n", dpu_base);
> > > +
> > > +#define DPU_UNITS_ADDR_DBG(unit)					\
> > > +do {									\
> > > +	const struct dpu_units *us = &dpu_##unit##s;			\
> > > +									\
> > > +	for (i = 0; i < us->cnt; i++) {					\
> > > +		if (us->pec_ofss) {					\
> > > +			dev_dbg(dpu->dev, "%s%d: pixengcfg @ 0x%08lx,"	\
> > > +				" unit @ 0x%08lx\n", #unit,		\
> > > +				us->ids[i],				\
> > > +				dpu_base + us->pec_ofss[i],		\
> > > +				dpu_base + us->ofss[i]);		\
> > > +		} else {						\
> > > +			dev_dbg(dpu->dev,				\
> > > +				"%s%d: unit @ 0x%08lx\n", #unit,	\
> > > +				us->ids[i], dpu_base + us->ofss[i]);	\
> > > +		}							\
> > > +	}								\
> > > +} while (0)
> > > +
> > > +	DPU_UNITS_ADDR_DBG(cf);
> > > +	DPU_UNITS_ADDR_DBG(dec);
> > > +	DPU_UNITS_ADDR_DBG(ed);
> > > +	DPU_UNITS_ADDR_DBG(fd);
> > > +	DPU_UNITS_ADDR_DBG(fe);
> > > +	DPU_UNITS_ADDR_DBG(fg);
> > > +	DPU_UNITS_ADDR_DBG(fl);
> > > +	DPU_UNITS_ADDR_DBG(fw);
> > > +	DPU_UNITS_ADDR_DBG(gc);
> > > +	DPU_UNITS_ADDR_DBG(hs);
> > > +	DPU_UNITS_ADDR_DBG(lb);
> > > +	DPU_UNITS_ADDR_DBG(tcon);
> > > +	DPU_UNITS_ADDR_DBG(vs);
> > > +}
> > > +
> > > +static int dpu_get_irq(struct platform_device *pdev, struct dpu_soc *dpu)
> > > +{
> > > +#define DPU_GET_IRQ(name)						\
> > > +do {									\
> > > +	dpu->irq_##name = platform_get_irq_byname(pdev, "" #name "");	\
> > > +	dev_dbg(dpu->dev, "get irq_" #name ": %d\n", dpu->irq_##name);	\
> > > +	if (dpu->irq_##name < 0) {					\
> > > +		dev_err_probe(dpu->dev, dpu->irq_##name,		\
> > > +			     "failed to get irq " #name "\n");		\
> > > +		return dpu->irq_##name;					\
> > > +	}								\
> > > +} while (0)
> > > +
> > > +	DPU_GET_IRQ(disengcfg_framecomplete0);
> > > +	DPU_GET_IRQ(disengcfg_seqcomplete0);
> > > +	DPU_GET_IRQ(disengcfg_shdload0);
> > > +	DPU_GET_IRQ(disengcfg_framecomplete1);
> > > +	DPU_GET_IRQ(disengcfg_seqcomplete1);
> > > +	DPU_GET_IRQ(disengcfg_shdload1);
> > > +	DPU_GET_IRQ(extdst0_shdload);
> > > +	DPU_GET_IRQ(extdst1_shdload);
> > > +	DPU_GET_IRQ(extdst4_shdload);
> > > +	DPU_GET_IRQ(extdst5_shdload);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void dpu_irq_handle(struct irq_desc *desc, enum dpu_irq irq)
> > > +{
> > > +	struct dpu_soc *dpu = irq_desc_get_handler_data(desc);
> > > +	struct irq_chip *chip = irq_desc_get_chip(desc);
> > > +	unsigned int virq;
> > > +	u32 status;
> > > +
> > > +	chained_irq_enter(chip, desc);
> > > +
> > > +	status = dpu_comctrl_read(dpu, USERINTERRUPTSTATUS(irq / 32));
> > > +	status &= dpu_comctrl_read(dpu, USERINTERRUPTENABLE(irq / 32));
> > > +
> > > +	if (status & BIT(irq % 32)) {
> > > +		virq = irq_linear_revmap(dpu->domain, irq);
> > > +		if (virq)
> > > +			generic_handle_irq(virq);
> > > +	}
> > > +
> > > +	chained_irq_exit(chip, desc);
> > > +}
> > > +
> > > +#define DPU_IRQ_DISENGCFG_FRAMECOMPLETE_HANDLER_DEFINE(id)		\
> > > +static void								\
> > > +dpu_disengcfg_framecomplete##id##_irq_handler(struct irq_desc *desc)	\
> > > +{									\
> > > +	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_FRAMECOMPLETE##id);	\
> > > +}
> > > +
> > > +#define DPU_IRQ_DISENGCFG_SEQCOMPLETE_HANDLER_DEFINE(id)		\
> > > +static void								\
> > > +dpu_disengcfg_seqcomplete##id##_irq_handler(struct irq_desc *desc)	\
> > > +{									\
> > > +	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_SEQCOMPLETE##id);	\
> > > +}
> > > +
> > > +#define DPU_IRQ_DISENGCFG_SHDLOAD_HANDLER_DEFINE(id)		\
> > > +static void							\
> > > +dpu_disengcfg_shdload##id##_irq_handler(struct irq_desc *desc)	\
> > > +{								\
> > > +	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_SHDLOAD##id);	\
> > > +}
> > > +
> > > +#define DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(id)		\
> > > +static void							\
> > > +dpu_extdst##id##_shdload_irq_handler(struct irq_desc *desc)	\
> > > +{								\
> > > +	dpu_irq_handle(desc, DPU_IRQ_EXTDST##id##_SHDLOAD);	\
> > > +}
> > > +
> > > +DPU_IRQ_DISENGCFG_FRAMECOMPLETE_HANDLER_DEFINE(0)
> > > +DPU_IRQ_DISENGCFG_FRAMECOMPLETE_HANDLER_DEFINE(1)
> > > +
> > > +DPU_IRQ_DISENGCFG_SEQCOMPLETE_HANDLER_DEFINE(0)
> > > +DPU_IRQ_DISENGCFG_SEQCOMPLETE_HANDLER_DEFINE(1)
> > > +
> > > +DPU_IRQ_DISENGCFG_SHDLOAD_HANDLER_DEFINE(0)
> > > +DPU_IRQ_DISENGCFG_SHDLOAD_HANDLER_DEFINE(1)
> > > +
> > > +DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(0)
> > > +DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(1)
> > > +DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(4)
> > > +DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(5)
> > > +
> > > +int dpu_map_irq(struct dpu_soc *dpu, int irq)
> > > +{
> > > +	int virq = irq_linear_revmap(dpu->domain, irq);
> > > +
> > > +	if (!virq)
> > > +		virq = irq_create_mapping(dpu->domain, irq);
> > > +
> > > +	return virq;
> > > +}
> > > +
> > > +static const unsigned long unused_irq[2] = {0x00000000, 0xfffe0008};
> > > +
> > > +static void dpu_irq_hw_init(struct dpu_soc *dpu)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i = 0; i < DPU_IRQ_COUNT; i += 32) {
> > > +		/* mask and clear all interrupts */
> > > +		dpu_comctrl_write(dpu, USERINTERRUPTENABLE(i / 32), 0);
> > > +		dpu_comctrl_write(dpu, USERINTERRUPTCLEAR(i / 32),
> > > +					~unused_irq[i / 32]);
> > > +		dpu_comctrl_write(dpu, INTERRUPTENABLE(i / 32), 0);
> > > +		dpu_comctrl_write(dpu, INTERRUPTCLEAR(i / 32),
> > > +					~unused_irq[i / 32]);
> > > +
> > > +		/* set all interrupts to user mode */
> > > +		dpu_comctrl_write(dpu, USERINTERRUPTMASK(i / 32),
> > > +					~unused_irq[i / 32]);
> > > +	}
> > > +}
> > > +
> > > +static int dpu_irq_init(struct dpu_soc *dpu)
> > > +{
> > > +	struct device *dev = dpu->dev;
> > > +	struct irq_chip_generic *gc;
> > > +	struct irq_chip_type *ct;
> > > +	int ret, i;
> > > +
> > > +	dpu->domain = irq_domain_add_linear(dev->of_node, DPU_IRQ_COUNT,
> > > +					    &irq_generic_chip_ops, dpu);
> > > +	if (!dpu->domain) {
> > > +		dev_err(dev, "failed to add irq domain\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	ret = irq_alloc_domain_generic_chips(dpu->domain, 32, 1, "DPU",
> > > +					     handle_level_irq, 0, 0, 0);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to alloc generic irq chips: %d\n", ret);
> > > +		irq_domain_remove(dpu->domain);
> > > +		return ret;
> > > +	}
> > > +
> > > +	for (i = 0; i < DPU_IRQ_COUNT; i += 32) {
> > > +		gc = irq_get_domain_generic_chip(dpu->domain, i);
> > > +		gc->reg_base = dpu->comctrl_reg;
> > > +		gc->unused = unused_irq[i / 32];
> > > +		ct = gc->chip_types;
> > > +		ct->chip.irq_ack = irq_gc_ack_set_bit;
> > > +		ct->chip.irq_mask = irq_gc_mask_clr_bit;
> > > +		ct->chip.irq_unmask = irq_gc_mask_set_bit;
> > > +		ct->regs.ack = USERINTERRUPTCLEAR(i / 32);
> > > +		ct->regs.mask = USERINTERRUPTENABLE(i / 32);
> > > +	}
> > > +
> > > +#define DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(name)	\
> > > +irq_set_chained_handler_and_data(dpu->irq_##name, dpu_##name##_irq_handler, dpu)
> > > +
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_framecomplete0);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_seqcomplete0);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_shdload0);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_framecomplete1);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_seqcomplete1);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_shdload1);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(extdst0_shdload);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(extdst1_shdload);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(extdst4_shdload);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(extdst5_shdload);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void dpu_irq_exit(struct dpu_soc *dpu)
> > > +{
> > > +	unsigned int i, irq;
> > > +
> > > +#define DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(name)	\
> > > +irq_set_chained_handler_and_data(dpu->irq_##name, NULL, NULL)
> > > +
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_framecomplete0);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_seqcomplete0);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_shdload0);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_framecomplete1);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_seqcomplete1);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_shdload1);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(extdst0_shdload);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(extdst1_shdload);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(extdst4_shdload);
> > > +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(extdst5_shdload);
> > > +
> > > +	for (i = 0; i < DPU_IRQ_COUNT; i++) {
> > > +		irq = irq_linear_revmap(dpu->domain, i);
> > > +		if (irq)
> > > +			irq_dispose_mapping(irq);
> > > +	}
> > > +
> > > +	irq_domain_remove(dpu->domain);
> > > +}
> > > +
> > > +static void dpu_submodules_hw_init(struct dpu_soc *dpu)
> > > +{
> > > +#define DPU_UNITS_HW_INIT(unit)				\
> > > +do {							\
> > > +	const struct dpu_units *us = &dpu_##unit##s;	\
> > > +	int i;						\
> > > +							\
> > > +	for (i = 0; i < us->cnt; i++)			\
> > > +		dpu_##unit##_hw_init(dpu, i);		\
> > > +} while (0)
> > > +
> > > +	DPU_UNITS_HW_INIT(cf);
> > > +	DPU_UNITS_HW_INIT(dec);
> > > +	DPU_UNITS_HW_INIT(ed);
> > > +	DPU_UNITS_HW_INIT(fd);
> > > +	DPU_UNITS_HW_INIT(fe);
> > > +	DPU_UNITS_HW_INIT(fg);
> > > +	DPU_UNITS_HW_INIT(fl);
> > > +	DPU_UNITS_HW_INIT(fw);
> > > +	DPU_UNITS_HW_INIT(gc);
> > > +	DPU_UNITS_HW_INIT(hs);
> > > +	DPU_UNITS_HW_INIT(lb);
> > > +	DPU_UNITS_HW_INIT(tcon);
> > > +	DPU_UNITS_HW_INIT(vs);
> > > +}
> > > +
> > > +static int dpu_submodules_init(struct dpu_soc *dpu, unsigned long dpu_base)
> > > +{
> > > +	int ret, i;
> > > +
> > > +#define DPU_UNIT_INIT(unit, base, index, id, type, pec_ofs, ofs)	\
> > > +do {									\
> > > +	ret = dpu_##unit##_init(dpu, (index), (id), (type),		\
> > > +				(pec_ofs) ? (base) + (pec_ofs) : 0,	\
> > > +				(base) + (ofs));			\
> > > +	if (ret) {							\
> > > +		dev_err(dpu->dev, "failed to initialize %s%d: %d\n",	\
> > > +						#unit, (id), ret);	\
> > > +		return ret;						\
> > > +	}								\
> > > +} while (0)
> > > +
> > > +#define DPU_UNITS_INIT(unit)						\
> > > +do {									\
> > > +	const struct dpu_units *us = &dpu_##unit##s;			\
> > > +									\
> > > +	for (i = 0; i < us->cnt; i++)					\
> > > +		DPU_UNIT_INIT(unit, dpu_base, i,			\
> > > +			      us->ids[i], us->types[i],			\
> > > +			      us->pec_ofss ? us->pec_ofss[i] : 0,	\
> > > +			      us->ofss[i]);				\
> > > +} while (0)
> > > +
> > > +	DPU_UNITS_INIT(cf);
> > > +	DPU_UNITS_INIT(dec);
> > > +	DPU_UNITS_INIT(ed);
> > > +	DPU_UNITS_INIT(fd);
> > > +	DPU_UNITS_INIT(fe);
> > > +	DPU_UNITS_INIT(fg);
> > > +	DPU_UNITS_INIT(fl);
> > > +	DPU_UNITS_INIT(fw);
> > > +	DPU_UNITS_INIT(gc);
> > > +	DPU_UNITS_INIT(hs);
> > > +	DPU_UNITS_INIT(lb);
> > > +	DPU_UNITS_INIT(tcon);
> > > +	DPU_UNITS_INIT(vs);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int platform_remove_devices_fn(struct device *dev, void *unused)
> > > +{
> > > +	struct platform_device *pdev = to_platform_device(dev);
> > > +
> > > +	platform_device_unregister(pdev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void platform_device_unregister_children(struct platform_device *pdev)
> > > +{
> > > +	device_for_each_child(&pdev->dev, NULL, platform_remove_devices_fn);
> > > +}
> > > +
> > > +struct dpu_platform_reg {
> > > +	struct dpu_client_platformdata pdata;
> > > +	const char *name;
> > > +};
> > > +
> > > +static struct dpu_platform_reg client_reg[] = {
> > > +	{
> > > +	  .pdata = {
> > > +		.stream_id = 0,
> > > +		.dec_frame_complete_irq	= DPU_IRQ_DISENGCFG_FRAMECOMPLETE0,
> > > +		.dec_seq_complete_irq	= DPU_IRQ_DISENGCFG_SEQCOMPLETE0,
> > > +		.dec_shdld_irq		= DPU_IRQ_DISENGCFG_SHDLOAD0,
> > > +		.ed_cont_shdld_irq	= DPU_IRQ_EXTDST0_SHDLOAD,
> > > +		.ed_safe_shdld_irq	= DPU_IRQ_EXTDST4_SHDLOAD,
> > > +	   },
> > > +	  .name = "imx-dpu-crtc",
> > > +	}, {
> > > +	  .pdata = {
> > > +		.stream_id = 1,
> > > +		.dec_frame_complete_irq	= DPU_IRQ_DISENGCFG_FRAMECOMPLETE1,
> > > +		.dec_seq_complete_irq	= DPU_IRQ_DISENGCFG_SEQCOMPLETE1,
> > > +		.dec_shdld_irq		= DPU_IRQ_DISENGCFG_SHDLOAD1,
> > > +		.ed_cont_shdld_irq	= DPU_IRQ_EXTDST1_SHDLOAD,
> > > +		.ed_safe_shdld_irq	= DPU_IRQ_EXTDST5_SHDLOAD,
> > > +	  },
> > > +	  .name = "imx-dpu-crtc",
> > > +	}
> > > +};
> > > +
> > > +static DEFINE_MUTEX(dpu_client_id_mutex);
> > > +static int dpu_client_id;
> > > +
> > > +static int dpu_get_plane_grp_res(struct dpu_soc *dpu,
> > > +				 struct dpu_plane_grp *grp)
> > > +{
> > > +	struct dpu_plane_res *res = &grp->res;
> > > +	int i, j;
> > > +	int ret = 0;
> > > +
> > > +	INIT_LIST_HEAD(&grp->fu_list);
> > > +
> > > +#define DPU_UNITS_GET_FOR_PLANE_GRP(unit)				\
> > > +do {									\
> > > +	for (i = 0; i < ARRAY_SIZE(unit##_ids); i++) {			\
> > > +		if (unit##_types[i] == DPU_DISP)			\
> > > +			res->unit##_cnt++;				\
> > > +	}								\
> > > +									\
> > > +	res->unit = devm_kcalloc(dpu->dev, res->unit##_cnt,		\
> > > +				 sizeof(*res->unit), GFP_KERNEL);	\
> > > +	if (!res->unit)							\
> > > +		return -ENOMEM;						\
> > > +									\
> > > +	for (i = 0, j = 0; i < ARRAY_SIZE(unit##_ids); i++) {		\
> > > +		if (unit##_types[i] != DPU_DISP)			\
> > > +			continue;					\
> > > +									\
> > > +		res->unit[j] = dpu_##unit##_get(dpu, unit##_ids[i]);	\
> > > +		if (IS_ERR(res->unit[j])) {				\
> > > +			ret = PTR_ERR(res->unit[j]);			\
> > > +			dev_err(dpu->dev,				\
> > > +				"failed to get %s%d: %d\n",		\
> > > +				#unit, unit##_ids[i], ret);		\
> > > +			return ret;					\
> > > +		}							\
> > > +		j++;							\
> > > +	}								\
> > > +} while (0)
> > > +
> > > +	DPU_UNITS_GET_FOR_PLANE_GRP(fd);
> > > +	DPU_UNITS_GET_FOR_PLANE_GRP(fl);
> > > +	DPU_UNITS_GET_FOR_PLANE_GRP(fw);
> > > +	DPU_UNITS_GET_FOR_PLANE_GRP(lb);
> > > +
> > > +#define DPU_FETCHUNIT_ADD_TO_PLANE_GRP_LIST(unit)			\
> > > +do {									\
> > > +	for (i = res->unit##_cnt - 1; i >= 0; i--)			\
> > > +		dpu_fu_add_to_list(res->unit[i], &grp->fu_list);	\
> > > +} while (0)
> > > +
> > > +	DPU_FETCHUNIT_ADD_TO_PLANE_GRP_LIST(fd);
> > > +	DPU_FETCHUNIT_ADD_TO_PLANE_GRP_LIST(fw);
> > > +	DPU_FETCHUNIT_ADD_TO_PLANE_GRP_LIST(fl);
> > > +
> > > +	grp->hw_plane_cnt = res->fd_cnt + res->fl_cnt + res->fw_cnt;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void dpu_put_plane_grp_res(struct dpu_plane_grp *grp)
> > > +{
> > > +	struct dpu_plane_res *res = &grp->res;
> > > +	struct list_head *l, *tmp;
> > > +	int i;
> > > +
> > > +	grp->hw_plane_cnt = 0;
> > > +
> > > +	list_for_each_safe(l, tmp, &grp->fu_list)
> > > +		list_del(l);
> > > +
> > > +#define DPU_UNITS_PUT_FOR_PLANE_GRP(unit)		\
> > > +do {							\
> > > +	for (i = 0; i < res->unit##_cnt; i++) {		\
> > > +		if (!IS_ERR_OR_NULL(res->unit[i]))	\
> > > +			dpu_##unit##_put(res->unit[i]);	\
> > > +	}						\
> > > +	res->unit##_cnt = 0;				\
> > > +} while (0)
> > > +
> > > +	DPU_UNITS_PUT_FOR_PLANE_GRP(fd);
> > > +	DPU_UNITS_PUT_FOR_PLANE_GRP(fl);
> > > +	DPU_UNITS_PUT_FOR_PLANE_GRP(fw);
> > > +	DPU_UNITS_PUT_FOR_PLANE_GRP(lb);
> > > +}
> > > +
> > > +static int dpu_add_client_devices(struct dpu_soc *dpu)
> > > +{
> > > +	struct device *dev = dpu->dev;
> > > +	struct dpu_platform_reg *reg;
> > > +	struct dpu_crtc_grp *crtc_grp;
> > > +	struct dpu_plane_grp *plane_grp;
> > > +	size_t client_cnt, reg_size;
> > > +	int i, id, ret;
> > > +
> > > +	client_cnt = ARRAY_SIZE(client_reg);
> > > +
> > > +	reg = devm_kcalloc(dev, client_cnt, sizeof(*reg), GFP_KERNEL);
> > > +	if (!reg)
> > > +		return -ENOMEM;
> > > +
> > > +	crtc_grp = devm_kzalloc(dev, sizeof(*crtc_grp), GFP_KERNEL);
> > > +	if (!crtc_grp)
> > > +		return -ENOMEM;
> > > +
> > > +	plane_grp = devm_kzalloc(dev, sizeof(*plane_grp), GFP_KERNEL);
> > > +	if (!plane_grp)
> > > +		return -ENOMEM;
> > > +
> > > +	crtc_grp->plane_grp = plane_grp;
> > > +
> > > +	mutex_lock(&dpu_client_id_mutex);
> > > +	id = dpu_client_id;
> > > +	dpu_client_id += client_cnt;
> > > +	mutex_unlock(&dpu_client_id_mutex);
> > > +
> > > +	reg_size = client_cnt * sizeof(struct dpu_platform_reg);
> > > +	memcpy(reg, &client_reg[0], reg_size);
> > > +
> > > +	ret = dpu_get_plane_grp_res(dpu, plane_grp);
> > > +	if (ret)
> > > +		goto err_get_plane_res;
> > > +
> > > +	for (i = 0; i < client_cnt; i++) {
> > > +		struct platform_device *pdev;
> > > +		struct device_node *np;
> > > +
> > > +		/* Associate subdevice with the corresponding port node. */
> > > +		np = of_graph_get_port_by_id(dev->of_node, i);
> > > +		if (!np) {
> > > +			dev_info(dev,
> > > +				"no port@%d node in %s, not using DISP%d\n",
> > > +				i, dev->of_node->full_name, i);
> > > +			continue;
> > > +		}
> > > +
> > > +		reg[i].pdata.crtc_grp = crtc_grp;
> > > +
> > > +		pdev = platform_device_alloc(reg[i].name, id++);
> > > +		if (!pdev) {
> > > +			ret = -ENOMEM;
> > > +			goto err_register;
> > > +		}
> > > +
> > > +		pdev->dev.parent = dev;
> > > +		pdev->dev.of_node = np;
> > > +		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> > > +		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> > > +
> > > +		reg[i].pdata.of_node = np;
> > > +		ret = platform_device_add_data(pdev, &reg[i].pdata,
> > > +					       sizeof(reg[i].pdata));
> > > +		if (!ret)
> > > +			ret = platform_device_add(pdev);
> > > +		if (ret) {
> > > +			platform_device_put(pdev);
> > > +			goto err_register;
> > > +		}
> > > +	}
> > > +
> > > +	return ret;
> > > +
> > > +err_register:
> > > +	platform_device_unregister_children(to_platform_device(dev));
> > > +err_get_plane_res:
> > > +	dpu_put_plane_grp_res(plane_grp);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int dpu_core_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct device_node *np = dev->of_node;
> > > +	struct dpu_soc *dpu;
> > > +	struct resource *res;
> > > +	unsigned long dpu_base;
> > > +	int ret;
> > > +
> > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	if (!res)
> > > +		return -ENODEV;
> > > +
> > > +	dpu_base = res->start;
> > > +
> > > +	dpu = devm_kzalloc(dev, sizeof(*dpu), GFP_KERNEL);
> > > +	if (!dpu)
> > > +		return -ENOMEM;
> > > +
> > > +	dpu->dev = dev;
> > > +
> > > +	dpu->id = of_alias_get_id(np, "dpu");
> > > +	if (dpu->id < 0) {
> > > +		dev_err(dev, "failed to get dpu node alias id: %d\n", dpu->id);
> > > +		return dpu->id;
> > > +	}
> > > +
> > > +	dpu_units_addr_dbg(dpu, dpu_base);
> > > +
> > > +	ret = dpu_get_irq(pdev, dpu);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	dpu->comctrl_reg = devm_ioremap(dev, dpu_base, SZ_512);
> > > +	if (!dpu->comctrl_reg)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = dpu_attach_pm_domains(dpu);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	dpu->clk_cfg = devm_clk_get(dev, "cfg");
> > > +	if (IS_ERR(dpu->clk_cfg)) {
> > > +		ret = PTR_ERR(dpu->clk_cfg);
> > > +		dev_err_probe(dev, ret, "failed to get cfg clock\n");
> > > +		goto failed_clk_cfg_get;
> > > +	}
> > > +
> > > +	dpu->clk_axi = devm_clk_get(dev, "axi");
> > > +	if (IS_ERR(dpu->clk_axi)) {
> > > +		ret = PTR_ERR(dpu->clk_axi);
> > > +		dev_err_probe(dev, ret, "failed to get axi clock\n");
> > > +		goto failed_clk_axi_get;
> > > +	}
> > > +
> > > +	ret = dpu_irq_init(dpu);
> > > +	if (ret)
> > > +		goto failed_irq_init;
> > > +
> > > +	ret = dpu_submodules_init(dpu, dpu_base);
> > > +	if (ret)
> > > +		goto failed_submodules_init;
> > > +
> > > +	platform_set_drvdata(pdev, dpu);
> > > +
> > > +	pm_runtime_enable(dev);
> > > +
> > > +	ret = dpu_add_client_devices(dpu);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to add client devices: %d\n", ret);
> > > +		goto failed_add_clients;
> > > +	}
> > > +
> > > +	return ret;
> > > +
> > > +failed_add_clients:
> > > +	pm_runtime_disable(dev);
> > > +failed_submodules_init:
> > > +	dpu_irq_exit(dpu);
> > > +failed_irq_init:
> > > +failed_clk_axi_get:
> > > +failed_clk_cfg_get:
> > > +	dpu_detach_pm_domains(dpu);
> > > +	return ret;
> > > +}
> > > +
> > > +static int dpu_core_remove(struct platform_device *pdev)
> > > +{
> > > +	struct dpu_soc *dpu = platform_get_drvdata(pdev);
> > > +
> > > +	platform_device_unregister_children(pdev);
> > > +	pm_runtime_disable(dpu->dev);
> > > +	dpu_irq_exit(dpu);
> > > +	dpu_detach_pm_domains(dpu);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct platform_device *pdev = to_platform_device(dev);
> > > +	struct dpu_soc *dpu = platform_get_drvdata(pdev);
> > > +
> > > +	clk_disable_unprepare(dpu->clk_axi);
> > > +	clk_disable_unprepare(dpu->clk_cfg);
> > > +
> > > +	dev_dbg(dev, "suspended\n");
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused dpu_runtime_resume(struct device *dev)
> > > +{
> > > +	struct platform_device *pdev = to_platform_device(dev);
> > > +	struct dpu_soc *dpu = platform_get_drvdata(pdev);
> > > +	int ret;
> > > +
> > > +	ret = clk_prepare_enable(dpu->clk_cfg);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to enable cfg clock: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +	ret = clk_prepare_enable(dpu->clk_axi);
> > > +	if (ret) {
> > > +		clk_disable_unprepare(dpu->clk_cfg);
> > > +		dev_err(dev, "failed to enable axi clock: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	dpu_irq_hw_init(dpu);
> > > +
> > > +	dpu_submodules_hw_init(dpu);
> > > +
> > > +	dev_dbg(dev, "resumed\n");
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct dev_pm_ops dpu_pm_ops = {
> > > +	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > > +				     pm_runtime_force_resume)
> > > +	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
> > > +};
> > > +
> > > +const struct of_device_id dpu_dt_ids[] = {
> > > +	{ .compatible = "fsl,imx8qxp-dpu" },
> > 
> > I think you also need to add { .compatible = "fsl,imx8qm-dpu" }?
> 
> Will add it after I test the driver with i.MX8qm.
> 
> > 
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, dpu_dt_ids);
> > > +
> > > +struct platform_driver dpu_core_driver = {
> > > +	.driver = {
> > > +		.pm = &dpu_pm_ops,
> > > +		.name = "dpu-core",
> > > +		.of_match_table = dpu_dt_ids,
> > > +	},
> > > +	.probe = dpu_core_probe,
> > > +	.remove = dpu_core_remove,
> > > +};
> > > diff --git a/drivers/gpu/drm/imx/dpu/dpu-crtc.c b/drivers/gpu/drm/imx/dpu/dpu-crtc.c
> > > new file mode 100644
> > > index 00000000..d99ed6e
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/imx/dpu/dpu-crtc.c
> > > @@ -0,0 +1,926 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +/*
> > > + * Copyright 2017-2020 NXP
> > > + */
> > > +
> > > +#include <linux/component.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/irqflags.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/preempt.h>
> > > +#include <linux/spinlock.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_atomic_state_helper.h>
> > > +#include <drm/drm_color_mgmt.h>
> > > +
> > > +#include "dpu.h"
> > > +#include "dpu-crtc.h"
> > > +#include "dpu-dprc.h"
> > > +#include "dpu-drv.h"
> > > +#include "dpu-plane.h"
> > > +
> > > +#define DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(_name)			\
> > > +do {									\
> > > +	unsigned long ret;						\
> > > +	ret = wait_for_completion_timeout(&dpu_crtc->_name, HZ);	\
> > > +	if (ret == 0)							\
> > > +		drm_err(crtc->dev, "[CRTC:%d:%s] %s: wait for " #_name	\
> > > +			" timeout\n",					\
> > > +				crtc->base.id, crtc->name, __func__);	\
> > > +} while (0)
> > > +
> > > +#define DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(fg)			\
> > > +do {									\
> > > +	if (dpu_fg_wait_for_frame_counter_moving(fg))			\
> > > +		drm_err(crtc->dev, "[CRTC:%d:%s] %s: "			\
> > > +			"FrameGen frame counter isn't moving\n",	\
> > > +				crtc->base.id, crtc->name, __func__);	\
> > > +} while (0)
> > > +
> > > +#define DPU_CRTC_CHECK_FRAMEGEN_FIFO(fg)				\
> > > +do {									\
> > > +	if (dpu_fg_secondary_requests_to_read_empty_fifo(fg)) {		\
> > > +		dpu_fg_secondary_clear_channel_status(fg);		\
> > > +		drm_err(crtc->dev,					\
> > > +			"[CRTC:%d:%s] %s: FrameGen FIFO empty\n",	\
> > > +				crtc->base.id, crtc->name, __func__);	\
> > > +	}								\
> > > +} while (0)
> > > +
> > > +#define DPU_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(fg)			\
> > > +do {									\
> > > +	if (dpu_fg_wait_for_secondary_syncup(fg))			\
> > > +		drm_err(crtc->dev,					\
> > > +			"[CRTC:%d:%s] %s: "				\
> > > +			"FrameGen secondary channel isn't syncup\n",	\
> > > +				crtc->base.id, crtc->name, __func__);	\
> > > +} while (0)
> > > +
> > > +static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +
> > > +	if (pm_runtime_active(dpu_crtc->dev->parent))
> > > +		return dpu_fg_get_frame_index(dpu_crtc->fg);
> > > +	else
> > > +		return (u32)drm_crtc_vblank_count(crtc);
> > > +}
> > > +
> > > +static int dpu_crtc_enable_vblank(struct drm_crtc *crtc)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +
> > > +	enable_irq(dpu_crtc->dec_frame_complete_irq);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void dpu_crtc_disable_vblank(struct drm_crtc *crtc)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +
> > > +	disable_irq_nosync(dpu_crtc->dec_frame_complete_irq);
> > > +}
> > > +
> > > +static irqreturn_t
> > > +dpu_crtc_dec_frame_complete_irq_handler(int irq, void *dev_id)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = dev_id;
> > > +	struct drm_crtc *crtc = &dpu_crtc->base;
> > > +	unsigned long flags;
> > > +
> > > +	drm_crtc_handle_vblank(crtc);
> > > +
> > > +	spin_lock_irqsave(&crtc->dev->event_lock, flags);
> > > +	if (dpu_crtc->event) {
> > > +		drm_crtc_send_vblank_event(crtc, dpu_crtc->event);
> > > +		dpu_crtc->event = NULL;
> > > +		drm_crtc_vblank_put(crtc);
> > > +	}
> > > +	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +#define DPU_CRTC_IRQ_HANDLER_DEFINE(name)				\
> > > +static irqreturn_t dpu_crtc_##name##_irq_handler(int irq, void *dev_id)	\
> > > +{									\
> > > +	struct dpu_crtc *dpu_crtc = dev_id;				\
> > > +	complete(&dpu_crtc->name##_done);				\
> > > +	return IRQ_HANDLED;						\
> > > +}
> > > +
> > > +DPU_CRTC_IRQ_HANDLER_DEFINE(dec_seq_complete)
> > > +DPU_CRTC_IRQ_HANDLER_DEFINE(dec_shdld)
> > > +DPU_CRTC_IRQ_HANDLER_DEFINE(ed_cont_shdld)
> > > +DPU_CRTC_IRQ_HANDLER_DEFINE(ed_safe_shdld)
> > > +
> > > +static const struct drm_crtc_funcs dpu_crtc_funcs = {
> > > +	.reset			= drm_atomic_helper_crtc_reset,
> > > +	.destroy		= drm_crtc_cleanup,
> > > +	.set_config		= drm_atomic_helper_set_config,
> > > +	.page_flip		= drm_atomic_helper_page_flip,
> > > +	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
> > > +	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
> > > +	.get_vblank_counter	= dpu_crtc_get_vblank_counter,
> > > +	.enable_vblank		= dpu_crtc_enable_vblank,
> > > +	.disable_vblank		= dpu_crtc_disable_vblank,
> > > +	.get_vblank_timestamp	= drm_crtc_vblank_helper_get_vblank_timestamp,
> > > +	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
> > > +};
> > > +
> > > +static void dpu_crtc_queue_state_event(struct drm_crtc *crtc)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +
> > > +	spin_lock_irq(&crtc->dev->event_lock);
> > > +	if (crtc->state->event) {
> > > +		WARN_ON(drm_crtc_vblank_get(crtc));
> > > +		WARN_ON(dpu_crtc->event);
> > > +		dpu_crtc->event = crtc->state->event;
> > > +		crtc->state->event = NULL;
> > > +	}
> > > +	spin_unlock_irq(&crtc->dev->event_lock);
> > > +}
> > > +
> > > +static enum drm_mode_status
> > > +dpu_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
> > > +{
> > > +	if (mode->crtc_clock > DPU_FRAMEGEN_MAX_CLOCK)
> > > +		return MODE_CLOCK_HIGH;
> > > +
> > > +	return MODE_OK;
> > > +}
> > > +
> > > +static void dpu_crtc_pm_runtime_get_sync(struct drm_crtc *crtc)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_get_sync(dpu_crtc->dev->parent);
> > > +	if (ret < 0) {
> > > +		pm_runtime_put_noidle(dpu_crtc->dev->parent);
> > > +		drm_err(crtc->dev,
> > > +			"[CRTC:%d:%s]: failed to get parent device RPM sync\n",
> > > +			 crtc->base.id, crtc->name);
> > > +	}
> > > +}
> > > +
> > > +static void dpu_crtc_pm_runtime_put(struct drm_crtc *crtc)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_put(dpu_crtc->dev->parent);
> > > +	if (ret < 0) {
> > > +		drm_err(crtc->dev,
> > > +			"[CRTC:%d:%s]: failed to put parent device RPM\n",
> > > +			 crtc->base.id, crtc->name);
> > > +	}
> > > +}
> > > +
> > > +static void dpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +	struct drm_display_mode *adj = &crtc->state->adjusted_mode;
> > > +	enum dpu_link_id cf_link;
> > > +
> > > +	dpu_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
> > > +
> > > +	/* request power-on when we start to set mode for CRTC */
> > > +	dpu_crtc_pm_runtime_get_sync(crtc);
> > > +
> > > +	dpu_fg_displaymode(dpu_crtc->fg, FG_DM_SEC_ON_TOP);
> > > +	dpu_fg_panic_displaymode(dpu_crtc->fg, FG_DM_CONSTCOL);
> > > +	dpu_fg_cfg_videomode(dpu_crtc->fg, adj);
> > > +
> > > +	dpu_tcon_cfg_videomode(dpu_crtc->tcon, adj);
> > > +	dpu_tcon_set_fmt(dpu_crtc->tcon);
> > > +
> > > +	dpu_cf_framedimensions(dpu_crtc->cf_cont,
> > > +			       adj->crtc_hdisplay, adj->crtc_vdisplay);
> > > +	dpu_cf_framedimensions(dpu_crtc->cf_safe,
> > > +			       adj->crtc_hdisplay, adj->crtc_vdisplay);
> > > +	/* constframe in content stream shows black frame - CRTC background */
> > > +	dpu_cf_constantcolor_black(dpu_crtc->cf_cont);
> > > +	/* constframe in safety stream shows blue frame */
> > > +	dpu_cf_constantcolor_blue(dpu_crtc->cf_safe);
> > > +
> > > +	cf_link = dpu_cf_get_link_id(dpu_crtc->cf_safe);
> > > +	dpu_ed_pec_src_sel(dpu_crtc->ed_safe, cf_link);
> > > +
> > > +	cf_link = dpu_cf_get_link_id(dpu_crtc->cf_cont);
> > > +	dpu_ed_pec_src_sel(dpu_crtc->ed_cont, cf_link);
> > > +}
> > > +
> > > +static int dpu_crtc_atomic_check_gamma(struct drm_crtc *crtc,
> > > +				       struct drm_crtc_state *state)
> > > +{
> > > +	size_t lut_size;
> > > +
> > > +	if (!state->color_mgmt_changed || !state->gamma_lut)
> > > +		return 0;
> > > +
> > > +	if (crtc->state->gamma_lut &&
> > > +	    (crtc->state->gamma_lut->base.id == state->gamma_lut->base.id))
> > > +		return 0;
> > > +
> > > +	if (state->gamma_lut->length % sizeof(struct drm_color_lut)) {
> > > +		dpu_crtc_dbg(crtc, "wrong gamma_lut length\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	lut_size = state->gamma_lut->length / sizeof(struct drm_color_lut);
> > > +	if (lut_size != 256) {
> > > +		dpu_crtc_dbg(crtc, "gamma_lut size is not 256\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > > +				 struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_crtc_state *crtc_state;
> > > +	int ret;
> > > +
> > > +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> > > +
> > > +	ret = dpu_crtc_atomic_check_gamma(crtc, crtc_state);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* force a mode set if the CRTC is changed to active */
> > > +	if (crtc_state->active_changed && crtc_state->active) {
> > > +		/*
> > > +		 * If mode_changed is set by us, call
> > > +		 * drm_atomic_helper_check_modeset() as it's Kerneldoc requires.
> > > +		 */
> > > +		if (!crtc_state->mode_changed) {
> > > +			crtc_state->mode_changed = true;
> > > +
> > > +			ret = drm_atomic_helper_check_modeset(crtc->dev, state);
> > > +			if (ret)
> > > +				return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
> > > +				  struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_crtc_state *old_crtc_state;
> > > +	struct drm_atomic_state *old_state;
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +	struct drm_plane *plane;
> > > +	struct drm_plane_state *old_plane_state;
> > > +	struct dpu_plane_state *old_dpstate;
> > > +	struct dpu_fetchunit *fu;
> > > +	const struct dpu_fetchunit_ops *fu_ops;
> > > +	enum dpu_link_id cf_link;
> > > +	int i;
> > > +
> > > +	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
> > > +	old_state = old_crtc_state->state;
> > > +
> > > +	/* do nothing if planes keep being disabled */
> > > +	if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask == 0)
> > > +		return;
> > > +
> > > +	/* request power-on when any plane starts to be active */
> > > +	if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask != 0)
> > > +		dpu_crtc_pm_runtime_get_sync(crtc);
> > > +
> > > +	/*
> > > +	 * Disable relevant planes' resources in SHADOW only.
> > > +	 * Whether any of them would be disabled or kept running depends
> > > +	 * on new plane states in the new global atomic state.
> > > +	 */
> > > +	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
> > > +		old_dpstate = to_dpu_plane_state(old_plane_state);
> > > +
> > > +		if (!old_plane_state->fb)
> > > +			continue;
> > > +
> > > +		if (old_plane_state->crtc != crtc)
> > > +			continue;
> > > +
> > > +		fu = old_dpstate->source;
> > > +
> > > +		fu_ops = dpu_fu_get_ops(fu);
> > > +
> > > +		fu_ops->disable_src_buf(fu);
> > > +
> > > +		if (old_dpstate->is_top) {
> > > +			cf_link = dpu_cf_get_link_id(dpu_crtc->cf_cont);
> > > +			dpu_ed_pec_src_sel(dpu_crtc->ed_cont, cf_link);
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +static void dpu_crtc_set_gammacor(struct dpu_crtc *dpu_crtc)
> > > +{
> > > +	struct drm_crtc *crtc = &dpu_crtc->base;
> > > +	struct drm_color_lut *lut;
> > > +
> > > +	lut = (struct drm_color_lut *)crtc->state->gamma_lut->data;
> > > +
> > > +	dpu_gc_enable_rgb_write(dpu_crtc->gc);
> > > +	dpu_gc_mode(dpu_crtc->gc, GC_GAMMACOR);
> > > +
> > > +	dpu_gc_start_rgb(dpu_crtc->gc, lut);
> > > +	dpu_gc_delta_rgb(dpu_crtc->gc, lut);
> > > +}
> > > +
> > > +static void dpu_crtc_set_gammacor_sync(struct dpu_crtc *dpu_crtc)
> > > +{
> > > +	struct drm_crtc *crtc = &dpu_crtc->base;
> > > +
> > > +	enable_irq(dpu_crtc->dec_shdld_irq);
> > > +
> > > +	dpu_crtc_set_gammacor(dpu_crtc);
> > > +	dpu_fg_shdtokgen(dpu_crtc->fg);
> > > +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
> > > +
> > > +	disable_irq(dpu_crtc->dec_shdld_irq);
> > > +}
> > > +
> > > +static void dpu_crtc_disable_gammacor(struct dpu_crtc *dpu_crtc)
> > > +{
> > > +	dpu_gc_mode(dpu_crtc->gc, GC_NEUTRAL);
> > > +	dpu_gc_disable_rgb_write(dpu_crtc->gc);
> > > +}
> > > +
> > > +static void dpu_crtc_disable_gammacor_sync(struct dpu_crtc *dpu_crtc)
> > > +{
> > > +	struct drm_crtc *crtc = &dpu_crtc->base;
> > > +
> > > +	enable_irq(dpu_crtc->dec_shdld_irq);
> > > +
> > > +	dpu_crtc_disable_gammacor(dpu_crtc);
> > > +	dpu_fg_shdtokgen(dpu_crtc->fg);
> > > +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
> > > +
> > > +	disable_irq(dpu_crtc->dec_shdld_irq);
> > > +}
> > > +
> > > +static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
> > > +				  struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_crtc_state *old_crtc_state;
> > > +	struct drm_atomic_state *old_state;
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +	struct drm_plane *plane;
> > > +	struct drm_plane_state *old_plane_state;
> > > +	struct dpu_plane_state *old_dpstate;
> > > +	struct dpu_fetchunit *fu;
> > > +	struct dpu_dprc *dprc;
> > > +	const struct dpu_fetchunit_ops *fu_ops;
> > > +	bool need_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
> > > +	unsigned long flags;
> > > +	int i;
> > > +
> > > +	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
> > > +	old_state = old_crtc_state->state;
> > > +
> > > +	if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask == 0) {
> > > +		/* Queue a pending vbl event if necessary. */
> > > +		if (!need_modeset && crtc->state->active)
> > > +			dpu_crtc_queue_state_event(crtc);
> > > +		return;
> > > +	}
> > > +
> > > +	if (!need_modeset && crtc->state->active)
> > > +		enable_irq(dpu_crtc->ed_cont_shdld_irq);
> > > +
> > > +	/*
> > > +	 * Don't relinquish CPU until DPRC repeat_en is disabled
> > > +	 * and flush is done(if necessary).
> > > +	 */
> > > +	local_irq_save(flags);
> > > +	preempt_disable();
> > > +
> > > +	/*
> > > +	 * Scan over old plane fetchunits to determine if we
> > > +	 * need to wait for FrameGen frame counter moving in
> > > +	 * the next loop prior to DPRC repeat_en disablement
> > > +	 * or not.
> > > +	 */
> > > +	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
> > > +		old_dpstate = to_dpu_plane_state(old_plane_state);
> > > +
> > > +		if (!old_plane_state->fb)
> > > +			continue;
> > > +
> > > +		if (old_plane_state->crtc != crtc)
> > > +			continue;
> > > +
> > > +		fu = old_dpstate->source;
> > > +
> > > +		fu_ops = dpu_fu_get_ops(fu);
> > > +
> > > +		/*
> > > +		 * Sync with FrameGen frame counter moving so that
> > > +		 * we may disable DPRC repeat_en correctly.
> > > +		 */
> > > +		if (!fu_ops->is_enabled(fu) && !need_modeset &&
> > > +		    old_crtc_state->active) {
> > > +			DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	/*
> > > +	 * Set no stream id for disabled fetchunits of relevant planes.
> > > +	 * Also, disable DPRC repeat_en if necessary.
> > > +	 */
> > > +	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
> > > +		old_dpstate = to_dpu_plane_state(old_plane_state);
> > > +
> > > +		if (!old_plane_state->fb)
> > > +			continue;
> > > +
> > > +		if (old_plane_state->crtc != crtc)
> > > +			continue;
> > > +
> > > +		fu = old_dpstate->source;
> > > +
> > > +		fu_ops = dpu_fu_get_ops(fu);
> > > +
> > > +		if (!fu_ops->is_enabled(fu)) {
> > > +			fu_ops->set_no_stream_id(fu);
> > > +
> > > +			dprc = fu_ops->get_dprc(fu);
> > > +			dpu_dprc_disable_repeat_en(dprc);
> > > +		}
> > > +	}
> > > +
> > > +	if (!need_modeset && crtc->state->active) {
> > > +		/*
> > > +		 * Flush plane(s) update out to display & queue a pending
> > > +		 * vbl event if necessary.
> > > +		 */
> > > +		dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> > > +
> > > +		local_irq_restore(flags);
> > > +		preempt_enable();
> > > +
> > > +		if (old_crtc_state->gamma_lut && !crtc->state->gamma_lut)
> > > +			dpu_crtc_disable_gammacor_sync(dpu_crtc);
> > > +		else if (old_crtc_state->gamma_lut && crtc->state->gamma_lut &&
> > > +			 old_crtc_state->gamma_lut->base.id !=
> > > +			 crtc->state->gamma_lut->base.id)
> > > +			dpu_crtc_set_gammacor_sync(dpu_crtc);
> > > +
> > > +		DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
> > > +
> > > +		disable_irq(dpu_crtc->ed_cont_shdld_irq);
> > > +
> > > +		DPU_CRTC_CHECK_FRAMEGEN_FIFO(dpu_crtc->fg);
> > > +
> > > +		dpu_crtc_queue_state_event(crtc);
> > > +	} else {
> > > +		/*
> > > +		 * Simply flush and hope that any update takes effect
> > > +		 * if CRTC is disabled.  This helps for the case where
> > > +		 * migrating plane(s) from a disabled CRTC to the other
> > > +		 * CRTC.
> > > +		 */
> > > +		if (!crtc->state->active)
> > > +			dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> > > +
> > > +		local_irq_restore(flags);
> > > +		preempt_enable();
> > > +	}
> > > +
> > > +	/* request power-off when all planes are off */
> > > +	if (old_crtc_state->plane_mask != 0 && crtc->state->plane_mask == 0)
> > > +		dpu_crtc_pm_runtime_put(crtc);
> > > +}
> > > +
> > > +static void dpu_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +				   struct drm_atomic_state *state)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +	unsigned long flags;
> > > +
> > > +	drm_crtc_vblank_on(crtc);
> > > +
> > > +	enable_irq(dpu_crtc->dec_shdld_irq);
> > > +	enable_irq(dpu_crtc->ed_cont_shdld_irq);
> > > +	enable_irq(dpu_crtc->ed_safe_shdld_irq);
> > > +
> > > +	dpu_fg_enable_clock(dpu_crtc->fg);
> > > +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> > > +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_safe);
> > > +	if (crtc->state->gamma_lut)
> > > +		dpu_crtc_set_gammacor(dpu_crtc);
> > > +	else
> > > +		dpu_crtc_disable_gammacor(dpu_crtc);
> > > +	dpu_fg_shdtokgen(dpu_crtc->fg);
> > > +
> > > +	/* don't relinquish CPU until TCON is set to operation mode */
> > > +	local_irq_save(flags);
> > > +	preempt_disable();
> > > +	dpu_fg_enable(dpu_crtc->fg);
> > > +
> > > +	/*
> > > +	 * TKT320590:
> > > +	 * Turn TCON into operation mode as soon as the first dumb
> > > +	 * frame is generated by DPU(we don't relinquish CPU to ensure
> > > +	 * this).  This makes DPR/PRG be able to evade the frame.
> > > +	 */
> > > +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> > > +	dpu_tcon_set_operation_mode(dpu_crtc->tcon);
> > > +	local_irq_restore(flags);
> > > +	preempt_enable();
> > > +
> > > +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdld_done);
> > > +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
> > > +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
> > > +
> > > +	disable_irq(dpu_crtc->ed_safe_shdld_irq);
> > > +	disable_irq(dpu_crtc->ed_cont_shdld_irq);
> > > +	disable_irq(dpu_crtc->dec_shdld_irq);
> > > +
> > > +	DPU_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(dpu_crtc->fg);
> > > +
> > > +	DPU_CRTC_CHECK_FRAMEGEN_FIFO(dpu_crtc->fg);
> > > +
> > > +	dpu_crtc_queue_state_event(crtc);
> > > +}
> > > +
> > > +static void dpu_crtc_atomic_disable(struct drm_crtc *crtc,
> > > +				    struct drm_atomic_state *state)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +	struct drm_plane *plane;
> > > +	struct drm_plane_state *old_plane_state;
> > > +	struct dpu_plane_state *old_dpstate;
> > > +	struct dpu_fetchunit *fu;
> > > +	struct dpu_dprc *dprc;
> > > +	const struct dpu_fetchunit_ops *fu_ops;
> > > +	unsigned long flags;
> > > +	int i;
> > > +
> > > +	enable_irq(dpu_crtc->dec_seq_complete_irq);
> > > +
> > > +	/* don't relinquish CPU until DPRC repeat_en is disabled */
> > > +	local_irq_save(flags);
> > > +	preempt_disable();
> > > +	/*
> > > +	 * Sync to FrameGen frame counter moving so that
> > > +	 * FrameGen can be disabled in the next frame.
> > > +	 */
> > > +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> > > +	dpu_fg_disable(dpu_crtc->fg);
> > > +	/*
> > > +	 * There is one frame leftover after FrameGen disablement.
> > > +	 * Sync to FrameGen frame counter moving so that
> > > +	 * DPRC repeat_en can be disabled in the next frame.
> > > +	 */
> > > +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> > > +
> > > +	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
> > > +		old_dpstate = to_dpu_plane_state(old_plane_state);
> > > +
> > > +		if (!old_plane_state->fb)
> > > +			continue;
> > > +
> > > +		if (old_plane_state->crtc != crtc)
> > > +			continue;
> > > +
> > > +		fu = old_dpstate->source;
> > > +
> > > +		fu_ops = dpu_fu_get_ops(fu);
> > > +
> > > +		dprc = fu_ops->get_dprc(fu);
> > > +		dpu_dprc_disable_repeat_en(dprc);
> > > +	}
> > > +
> > > +	local_irq_restore(flags);
> > > +	preempt_enable();
> > > +
> > > +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seq_complete_done);
> > > +
> > > +	disable_irq(dpu_crtc->dec_seq_complete_irq);
> > > +
> > > +	dpu_fg_disable_clock(dpu_crtc->fg);
> > > +
> > > +	drm_crtc_vblank_off(crtc);
> > > +
> > > +	spin_lock_irq(&crtc->dev->event_lock);
> > > +	if (crtc->state->event && !crtc->state->active) {
> > > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > > +		crtc->state->event = NULL;
> > > +	}
> > > +	spin_unlock_irq(&crtc->dev->event_lock);
> > > +
> > > +	/* request power-off when CRTC is disabled */
> > > +	dpu_crtc_pm_runtime_put(crtc);
> > > +}
> > > +
> > > +static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> > > +					  bool in_vblank_irq,
> > > +					  int *vpos, int *hpos,
> > > +					  ktime_t *stime, ktime_t *etime,
> > > +					  const struct drm_display_mode *mode)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> > > +	int vdisplay = mode->crtc_vdisplay;
> > > +	int vtotal = mode->crtc_vtotal;
> > > +	int line;
> > > +	bool reliable;
> > > +
> > > +	if (stime)
> > > +		*stime = ktime_get();
> > > +
> > > +	if (pm_runtime_active(dpu_crtc->dev->parent)) {
> > > +		/* line index starts with 0 for the first active output line */
> > > +		line = dpu_fg_get_line_index(dpu_crtc->fg);
> > > +
> > > +		if (line < vdisplay)
> > > +			/* active scanout area - positive */
> > > +			*vpos = line + 1;
> > > +		else
> > > +			/* inside vblank - negative */
> > > +			*vpos = line - (vtotal - 1);
> > > +
> > > +		reliable = true;
> > > +	} else {
> > > +		*vpos = 0;
> > > +		reliable = false;
> > > +	}
> > > +
> > > +	*hpos = 0;
> > > +
> > > +	if (etime)
> > > +		*etime = ktime_get();
> > > +
> > > +	return reliable;
> > > +}
> > > +
> > > +static const struct drm_crtc_helper_funcs dpu_helper_funcs = {
> > > +	.mode_valid		= dpu_crtc_mode_valid,
> > > +	.mode_set_nofb		= dpu_crtc_mode_set_nofb,
> > > +	.atomic_check		= dpu_crtc_atomic_check,
> > > +	.atomic_begin		= dpu_crtc_atomic_begin,
> > > +	.atomic_flush		= dpu_crtc_atomic_flush,
> > > +	.atomic_enable		= dpu_crtc_atomic_enable,
> > > +	.atomic_disable		= dpu_crtc_atomic_disable,
> > > +	.get_scanout_position	= dpu_crtc_get_scanout_position,
> > > +};
> > > +
> > > +static void dpu_crtc_put_resources(struct dpu_crtc *dpu_crtc)
> > > +{
> > > +#define DPU_CRTC_PUT_RSC(unit)				\
> > > +do {							\
> > > +	if (!IS_ERR_OR_NULL(dpu_crtc->unit))		\
> > > +		dpu_##unit##_put(dpu_crtc->unit);	\
> > > +} while (0)
> > > +
> > > +	DPU_CRTC_PUT_RSC(cf_cont);
> > > +	DPU_CRTC_PUT_RSC(cf_safe);
> > > +	DPU_CRTC_PUT_RSC(dec);
> > > +	DPU_CRTC_PUT_RSC(ed_cont);
> > > +	DPU_CRTC_PUT_RSC(ed_safe);
> > > +	DPU_CRTC_PUT_RSC(fg);
> > > +	DPU_CRTC_PUT_RSC(gc);
> > > +	DPU_CRTC_PUT_RSC(tcon);
> > > +}
> > > +
> > > +static int dpu_crtc_get_resources(struct dpu_crtc *dpu_crtc)
> > > +{
> > > +	struct dpu_soc *dpu = dev_get_drvdata(dpu_crtc->dev->parent);
> > > +	int ret = 0;
> > > +
> > > +#define DPU_CRTC_GET_RSC(unit)						\
> > > +do {									\
> > > +	dpu_crtc->unit = dpu_##unit##_get(dpu, dpu_crtc->stream_id);	\
> > > +	if (IS_ERR(dpu_crtc->unit)) {					\
> > > +		ret = PTR_ERR(dpu_crtc->unit);				\
> > > +		goto err_out;						\
> > > +	}								\
> > > +} while (0)
> > > +
> > > +	DPU_CRTC_GET_RSC(cf_cont);
> > > +	DPU_CRTC_GET_RSC(cf_safe);
> > > +	DPU_CRTC_GET_RSC(dec);
> > > +	DPU_CRTC_GET_RSC(ed_cont);
> > > +	DPU_CRTC_GET_RSC(ed_safe);
> > > +	DPU_CRTC_GET_RSC(fg);
> > > +	DPU_CRTC_GET_RSC(gc);
> > > +	DPU_CRTC_GET_RSC(tcon);
> > > +
> > > +	return ret;
> > > +err_out:
> > > +	dpu_crtc_put_resources(dpu_crtc);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int dpu_crtc_init(struct dpu_crtc *dpu_crtc,
> > > +			 struct dpu_client_platformdata *pdata,
> > > +			 struct dpu_drm_device *dpu_drm)
> > > +{
> > > +	struct drm_device *drm = &dpu_drm->base;
> > > +	struct dpu_soc *dpu = dev_get_drvdata(dpu_crtc->dev->parent);
> > > +	struct drm_crtc *crtc = &dpu_crtc->base;
> > > +	struct dpu_plane *dpu_plane;
> > > +	struct dpu_crtc_grp *crtc_grp = pdata->crtc_grp;
> > > +	struct dpu_plane_grp *plane_grp = crtc_grp->plane_grp;
> > > +	unsigned int stream_id = pdata->stream_id;
> > > +	unsigned int crtc_cnt;
> > > +	int i, ret;
> > > +
> > > +	init_completion(&dpu_crtc->dec_seq_complete_done);
> > > +	init_completion(&dpu_crtc->dec_shdld_done);
> > > +	init_completion(&dpu_crtc->ed_cont_shdld_done);
> > > +	init_completion(&dpu_crtc->ed_safe_shdld_done);
> > > +
> > > +	dpu_crtc->grp = crtc_grp;
> > > +	dpu_crtc->stream_id = stream_id;
> > > +	dpu_crtc->hw_plane_cnt = plane_grp->hw_plane_cnt;
> > > +
> > > +	ret = dpu_crtc_get_resources(dpu_crtc);
> > > +	if (ret) {
> > > +		drm_err(drm, "failed to get HW resources for CRTC: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	plane_grp->cf[stream_id] = dpu_crtc->cf_cont;
> > > +	plane_grp->ed[stream_id] = dpu_crtc->ed_cont;
> > > +
> > > +	/* each CRTC has a primary plane */
> > > +	dpu_plane = dpu_plane_initialize(drm, 0, plane_grp,
> > > +					 DRM_PLANE_TYPE_PRIMARY);
> > > +	if (IS_ERR(dpu_plane)) {
> > > +		ret = PTR_ERR(dpu_plane);
> > > +		drm_err(drm, "failed to init primary plane: %d\n", ret);
> > > +		goto err_put_resources;
> > > +	}
> > > +
> > > +	drm_crtc_helper_add(crtc, &dpu_helper_funcs);
> > > +
> > > +	ret = drm_crtc_init_with_planes(drm, crtc, &dpu_plane->base,
> > > +					NULL, &dpu_crtc_funcs, NULL);
> > > +	if (ret) {
> > > +		drm_err(drm, "failed to add CRTC: %d\n", ret);
> > > +		goto err_put_resources;
> > > +	}
> > > +
> > > +	/* X server assumes 256 element gamma table so let's use that. */
> > > +	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
> > > +	if (ret) {
> > > +		drm_err(drm, "failed to set CRTC gamma size: %d\n", ret);
> > > +		goto err_put_resources;
> > > +	}
> > > +
> > > +	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
> > > +
> > > +	dpu_crtc->encoder->possible_crtcs = drm_crtc_mask(crtc);
> > > +	crtc_grp->crtc_mask |= drm_crtc_mask(crtc);
> > > +	crtc_cnt = hweight32(crtc_grp->crtc_mask);
> > > +
> > > +	/* initialize shared overlay planes for CRTCs in a CRTC group */
> > > +	if (crtc_cnt == DPU_CRTC_CNT_IN_GRP) {
> > > +		/*
> > > +		 * All HW planes in a plane group are shared by CRTCs in a
> > > +		 * CRTC group.  They will be assigned to either primary plane
> > > +		 * or overlay plane dynamically in runtime.  Considering a
> > > +		 * CRTC consumes all HW planes and primary plane takes one
> > > +		 * HW plane, so overlay plane count for a CRTC group should
> > > +		 * be plane_grp->hw_plane_cnt - 1.
> > > +		 */
> > > +		for (i = 1; i < plane_grp->hw_plane_cnt; i++) {
> > > +			dpu_plane =
> > > +				dpu_plane_initialize(drm, crtc_grp->crtc_mask,
> > > +						     plane_grp,
> > > +						     DRM_PLANE_TYPE_OVERLAY);
> > > +			if (IS_ERR(dpu_plane)) {
> > > +				ret = PTR_ERR(dpu_plane);
> > > +				drm_err(drm,
> > > +					"failed to init overlay plane(%d): %d\n",
> > > +									i, ret);
> > > +				goto err_put_resources;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	ret = pm_runtime_get_sync(dpu_crtc->dev->parent);
> > > +	if (ret < 0) {
> > > +		pm_runtime_put_noidle(dpu_crtc->dev->parent);
> > > +		drm_err(drm, "failed to get parent device RPM sync: %d\n", ret);
> > > +		goto err_put_resources;
> > > +	}
> > > +
> > > +#define DPU_CRTC_REQUEST_IRQ(name)					\
> > > +do {									\
> > > +	dpu_crtc->name##_irq = dpu_map_irq(dpu, pdata->name##_irq);	\
> > > +	irq_set_status_flags(dpu_crtc->name##_irq, IRQ_DISABLE_UNLAZY);	\
> > > +	ret = devm_request_irq(dpu_crtc->dev, dpu_crtc->name##_irq,	\
> > > +			       dpu_crtc_##name##_irq_handler,		\
> > > +			       0, dev_name(dpu_crtc->dev), dpu_crtc);	\
> > > +	if (ret < 0) {							\
> > > +		drm_err(drm, "failed to request irq(%u): %d\n",		\
> > > +					dpu_crtc->name##_irq, ret);	\
> > > +		goto err_put_pm_runtime;				\
> > > +	}								\
> > > +	disable_irq(dpu_crtc->name##_irq);				\
> > > +} while (0)
> > > +
> > > +	DPU_CRTC_REQUEST_IRQ(dec_frame_complete);
> > > +	DPU_CRTC_REQUEST_IRQ(dec_seq_complete);
> > > +	DPU_CRTC_REQUEST_IRQ(dec_shdld);
> > > +	DPU_CRTC_REQUEST_IRQ(ed_cont_shdld);
> > > +	DPU_CRTC_REQUEST_IRQ(ed_safe_shdld);
> > 
> > Are these interrupts freed anywhere? Since dpu_crtc_init() is called from
> > bind() you can't rely on devm to free your resources. You need to explicitly
> > free them in unbind().
> 
> The component driver would free them.
> See devres_release_group() called from component_bind() and
> component_unbind() in drivers/base/component.c.

I guess you're right. I'll probably have to look at the code too instead of
relying solely on documentation... :/ The piece of documentation that I read
some time ago, which is still present in component.h, was this:

"""
 * Note that the lifetime of the aggregate driver does not align with
 * any of the underlying &struct device instances. Therefore devm cannot
 * be used and all resources acquired or allocated in this callback must
 * be explicitly released in the @unbind callback.
"""

Either this is obsolete or I'm missing something here... This snippet is from
the component master ops bind(). However, devres_{open/release}_group() appear
to be used in try_to_bring_up_master()/take_down_master(). So, devm usage should
be safe...

Thanks,
laurentiu

> 
> > 
> > > +
> > > +	ret = pm_runtime_put(dpu_crtc->dev->parent);
> > > +	if (ret < 0) {
> > > +		drm_err(drm, "failed to put parent device RPM: %d\n", ret);
> > > +		dpu_crtc_put_resources(dpu_crtc);
> > > +	}
> > > +
> > > +	return ret;
> > > +
> > > +err_put_pm_runtime:
> > > +	pm_runtime_put(dpu_crtc->dev->parent);
> > > +err_put_resources:
> > > +	dpu_crtc_put_resources(dpu_crtc);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int dpu_crtc_bind(struct device *dev, struct device *master, void *data)
> > > +{
> > > +	struct dpu_client_platformdata *pdata = dev->platform_data;
> > > +	struct dpu_drm_device *dpu_drm = data;
> > > +	struct dpu_crtc *dpu_crtc;
> > > +	bool found = false;
> > > +	int ret;
> > > +
> > > +	list_for_each_entry(dpu_crtc, &dpu_drm->crtc_list, node) {
> > > +		if (dpu_crtc->np == dev->of_node) {
> > > +			found = true;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	if (!found) {
> > > +		drm_err(&dpu_drm->base, "failed to find CRTC OF node\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	dpu_crtc->dev = dev;
> > > +
> > > +	ret = dpu_crtc_init(dpu_crtc, pdata, dpu_drm);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	dev_set_drvdata(dev, dpu_crtc);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void dpu_crtc_unbind(struct device *dev, struct device *master,
> > > +				void *data)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc = dev_get_drvdata(dev);
> > > +
> > > +	dpu_crtc_put_resources(dpu_crtc);
> > > +}
> > > +
> > > +static const struct component_ops dpu_crtc_ops = {
> > > +	.bind = dpu_crtc_bind,
> > > +	.unbind = dpu_crtc_unbind,
> > > +};
> > > +
> > > +static int dpu_crtc_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +
> > > +	if (!dev->platform_data)
> > > +		return -EINVAL;
> > > +
> > > +	return component_add(dev, &dpu_crtc_ops);
> > > +}
> > > +
> > > +static int dpu_crtc_remove(struct platform_device *pdev)
> > > +{
> > > +	component_del(&pdev->dev, &dpu_crtc_ops);
> > > +	return 0;
> > > +}
> > > +
> > > +struct platform_driver dpu_crtc_driver = {
> > > +	.driver = {
> > > +		.name = "imx-dpu-crtc",
> > > +	},
> > > +	.probe = dpu_crtc_probe,
> > > +	.remove = dpu_crtc_remove,
> > > +};
> > 
> > [...]
> > 
> > > diff --git a/drivers/gpu/drm/imx/dpu/dpu-drv.c b/drivers/gpu/drm/imx/dpu/dpu-drv.c
> > > new file mode 100644
> > > index 00000000..2416b66
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/imx/dpu/dpu-drv.c
> > > @@ -0,0 +1,296 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +/*
> > > + * Copyright 2019,2020 NXP
> > > + */
> > > +
> > > +#include <linux/component.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_fb_helper.h>
> > > +#include <drm/drm_gem_cma_helper.h>
> > > +#include <drm/drm_modeset_helper.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +#include <drm/drm_vblank.h>
> > > +
> > > +#include "dpu-drv.h"
> > > +#include "dpu-kms.h"
> > > +
> > > +#define DRIVER_NAME	"imx-dpu-drm"
> > > +
> > > +static int legacyfb_depth = 32;
> > > +module_param(legacyfb_depth, uint, 0444);
> > > +
> > > +struct dpu_drm_drv_data {
> > > +	struct list_head crtc_np_list;
> > > +};
> > > +
> > > +DEFINE_DRM_GEM_CMA_FOPS(dpu_drm_driver_fops);
> > > +
> > > +static struct drm_driver dpu_drm_driver = {
> > > +	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
> > > +					  DRIVER_ATOMIC,
> > > +	DRM_GEM_CMA_DRIVER_OPS,
> > > +	.fops				= &dpu_drm_driver_fops,
> > > +	.name				= "imx-dpu",
> > > +	.desc				= "i.MX DPU DRM graphics",
> > > +	.date				= "20200805",
> > > +	.major				= 1,
> > > +	.minor				= 0,
> > > +	.patchlevel			= 0,
> > > +};
> > > +
> > > +static int dpu_drm_bind(struct device *dev)
> > > +{
> > > +	struct dpu_drm_device *dpu_drm;
> > > +	struct drm_device *drm;
> > > +	struct dpu_drm_drv_data *drv_data = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	dpu_drm = devm_drm_dev_alloc(dev, &dpu_drm_driver,
> > > +				     struct dpu_drm_device, base);
> > > +	if (IS_ERR(dpu_drm)) {
> > > +		ret = PTR_ERR(dpu_drm);
> > > +		DRM_DEV_ERROR(dev, "failed to alloc drm device: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	drm = &dpu_drm->base;
> > > +
> > > +	drm->irq_enabled = true;
> > > +
> > > +	ret = dpu_kms_prepare(dpu_drm, &drv_data->crtc_np_list);
> > > +	if (ret) {
> > > +		if (ret != -EPROBE_DEFER)
> > > +			DRM_DEV_ERROR(dev, "failed to prepare kms: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = component_bind_all(dev, dpu_drm);
> > > +	if (ret) {
> > > +		if (ret != -EPROBE_DEFER)
> > > +			DRM_DEV_ERROR(dev,
> > > +				      "failed to bind all components: %d\n",
> > > +									ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	drm_mode_config_reset(drm);
> > > +
> > > +	drm_kms_helper_poll_init(drm);
> > > +
> > > +	ret = drm_dev_register(drm, 0);
> > > +	if (ret) {
> > > +		DRM_DEV_ERROR(dev, "failed to register drm device: %d\n", ret);
> > > +		goto out_register;
> > > +	}
> > > +
> > > +	if (legacyfb_depth != 16 && legacyfb_depth != 32) {
> > > +		DRM_DEV_INFO(dev,
> > > +			     "Invalid legacyfb_depth.  Defaulting to 32bpp\n");
> > > +		legacyfb_depth = 32;
> > > +	}
> > > +
> > > +	drm_fbdev_generic_setup(drm, legacyfb_depth);
> > > +
> > > +	dev_set_drvdata(dev, drm);
> > > +
> > > +	return ret;
> > > +
> > > +out_register:
> > > +	drm_kms_helper_poll_fini(drm);
> > > +	component_unbind_all(dev, NULL);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void dpu_drm_unbind(struct device *dev)
> > > +{
> > > +	struct drm_device *drm = dev_get_drvdata(dev);
> > > +
> > > +	drm_dev_unregister(drm);
> > > +
> > > +	drm_kms_helper_poll_fini(drm);
> > > +
> > > +	drm_atomic_helper_shutdown(drm);
> > > +
> > > +	component_unbind_all(drm->dev, NULL);
> > > +
> > > +	dev_set_drvdata(dev, NULL);
> > > +}
> > > +
> > > +static const struct component_master_ops dpu_drm_ops = {
> > > +	.bind = dpu_drm_bind,
> > > +	.unbind = dpu_drm_unbind,
> > > +};
> > > +
> > > +static int compare_of(struct device *dev, void *data)
> > > +{
> > > +	struct device_node *np = data;
> > > +
> > > +	return dev->of_node == np;
> > > +}
> > > +
> > > +static int dpu_drm_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct component_match *match = NULL;
> > > +	struct device_node *np, *ports, *port;
> > > +	struct dpu_drm_drv_data *drv_data;
> > > +	struct dpu_crtc_of_node *crtc_of_node;
> > > +
> > > +	drv_data = devm_kzalloc(dev, sizeof(*drv_data), GFP_KERNEL);
> > > +	if (!drv_data) {
> > > +		DRM_DEV_ERROR(dev, "failed to alloc driver data\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	INIT_LIST_HEAD(&drv_data->crtc_np_list);
> > > +
> > > +	for_each_matching_node(np, dpu_dt_ids) {
> > > +		if (!of_device_is_available(np))
> > > +			continue;
> > > +
> > > +		ports = of_get_child_by_name(np, "ports");
> > > +		if (!ports)
> > > +			ports = np;
> > > +
> > > +		for_each_child_of_node(ports, port) {
> > > +			drm_of_component_match_add(dev, &match, compare_of,
> > > +								port);
> > > +
> > > +			crtc_of_node = devm_kzalloc(dev, sizeof(*crtc_of_node),
> > > +								GFP_KERNEL);
> > > +			if (!crtc_of_node) {
> > > +				DRM_DEV_ERROR(dev,
> > > +					      "failed to alloc crtc_of_node\n");
> > 
> > I think you're missing an of_node_put(ports) here.
> 
> Will add it in v2.
> 
> > 
> > > +				return -ENOMEM;
> > > +			}
> > > +
> > > +			crtc_of_node->np = port;
> > > +
> > > +			list_add(&crtc_of_node->list, &drv_data->crtc_np_list);
> > > +		}
> > > +
> > > +		of_node_put(ports);
> > > +	}
> > > +
> > > +	if (!match) {
> > > +		DRM_DEV_ERROR(dev, "no available DPU display output port\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	dev_set_drvdata(dev, drv_data);
> > > +
> > > +	return component_master_add_with_match(dev, &dpu_drm_ops, match);
> > > +}
> > > +
> > > +static int dpu_drm_remove(struct platform_device *pdev)
> > > +{
> > > +	component_master_del(&pdev->dev, &dpu_drm_ops);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused dpu_drm_suspend(struct device *dev)
> > > +{
> > > +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> > > +
> > > +	return drm_mode_config_helper_suspend(drm_dev);
> > > +}
> > > +
> > > +static int __maybe_unused dpu_drm_resume(struct device *dev)
> > > +{
> > > +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> > > +
> > > +	return drm_mode_config_helper_resume(drm_dev);
> > > +}
> > > +
> > > +static SIMPLE_DEV_PM_OPS(dpu_drm_pm_ops, dpu_drm_suspend, dpu_drm_resume);
> > > +
> > > +static struct platform_driver dpu_drm_platform_driver = {
> > > +	.probe = dpu_drm_probe,
> > > +	.remove = dpu_drm_remove,
> > > +	.driver = {
> > > +		.name = DRIVER_NAME,
> > > +		.pm = &dpu_drm_pm_ops,
> > > +	},
> > > +};
> > > +
> > > +static struct platform_device *dpu_drm_platform_dev;
> > > +
> > > +static struct platform_driver * const drivers[] = {
> > > +	&dpu_prg_driver,
> > > +	&dpu_dprc_driver,
> > > +	&dpu_core_driver,
> > > +	&dpu_crtc_driver,
> > > +	&dpu_drm_platform_driver,
> > > +};
> > > +
> > > +static int __init dpu_init(void)
> > > +{
> > > +	struct platform_device *pdev;
> > > +	struct device_node *np;
> > > +	int ret;
> > > +
> > > +	ret = platform_register_drivers(drivers, ARRAY_SIZE(drivers));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * If the DT contains at least one available DPU device, instantiate
> > > +	 * the DRM platform device.
> > > +	 */
> > > +	for_each_matching_node(np, dpu_dt_ids) {
> > > +		if (!of_device_is_available(np))
> > > +			continue;
> > > +
> > > +		pdev = platform_device_alloc(DRIVER_NAME, -1);
> > > +		if (!pdev) {
> > > +			ret = -ENOMEM;
> > > +			goto unregister_drivers;
> > > +		}
> > > +
> > > +		ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> > > +		if (ret)
> > > +			goto unregister_drivers;
> > > +
> > > +		ret = platform_device_add(pdev);
> > > +		if (ret) {
> > > +			platform_device_put(pdev);
> > > +			goto unregister_drivers;
> > > +		}
> > > +
> > > +		dpu_drm_platform_dev = pdev;
> > > +		of_node_put(np);
> > > +		break;
> > > +	}
> > > +
> > > +	return ret;
> > > +
> > > +unregister_drivers:
> > > +	of_node_put(np);
> > > +	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
> > > +	return ret;
> > > +}
> > > +module_init(dpu_init);
> > > +
> > > +static void __exit dpu_exit(void)
> > > +{
> > > +	platform_device_unregister(dpu_drm_platform_dev);
> > > +	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
> > > +}
> > > +module_exit(dpu_exit);
> > > +
> > > +MODULE_DESCRIPTION("i.MX DPU DRM Driver");
> > > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > > +MODULE_ALIAS("platform:" DRIVER_NAME);
> > > +MODULE_LICENSE("GPL v2");
> > 
> > [...]
> > 
> > > diff --git a/drivers/gpu/drm/imx/dpu/dpu-prg.c b/drivers/gpu/drm/imx/dpu/dpu-prg.c
> > > new file mode 100644
> > > index 00000000..d9bbfc5
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/imx/dpu/dpu-prg.c
> > > @@ -0,0 +1,389 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +/*
> > > + * Copyright 2017-2020 NXP
> > > + */
> > > +
> > > +#include <linux/bitops.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/io.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +
> > > +#include "dpu-prg.h"
> > > +
> > > +#define SET			0x4
> > > +#define CLR			0x8
> > > +#define TOG			0xc
> > > +
> > > +#define PRG_CTRL		0x00
> > > +#define  BYPASS			BIT(0)
> > > +#define  SC_DATA_TYPE_8BIT	0
> > > +#define  SC_DATA_TYPE_10BIT	BIT(2)
> > > +#define  UV_EN			BIT(3)
> > > +#define  HANDSHAKE_MODE_4LINES	0
> > > +#define  HANDSHAKE_MODE_8LINES	BIT(4)
> > > +#define  SHADOW_LOAD_MODE	BIT(5)
> > > +#define  DES_DATA_TYPE_32BPP	(0 << 16)
> > > +#define  DES_DATA_TYPE_24BPP	(1 << 16)
> > > +#define  DES_DATA_TYPE_16BPP	(2 << 16)
> > > +#define  DES_DATA_TYPE_8BPP	(3 << 16)
> > > +#define  SOFTRST		BIT(30)
> > > +#define  SHADOW_EN		BIT(31)
> > > +
> > > +#define PRG_STATUS		0x10
> > > +#define  BUFFER_VALID_B		BIT(1)
> > > +#define  BUFFER_VALID_A		BIT(0)
> > > +
> > > +#define PRG_REG_UPDATE		0x20
> > > +#define  REG_UPDATE		BIT(0)
> > > +
> > > +#define PRG_STRIDE		0x30
> > > +#define  STRIDE(n)		(((n) - 1) & 0xffff)
> > > +
> > > +#define PRG_HEIGHT		0x40
> > > +#define  HEIGHT(n)		(((n) - 1) & 0xffff)
> > > +
> > > +#define PRG_BADDR		0x50
> > > +
> > > +#define PRG_OFFSET		0x60
> > > +#define  Y(n)			(((n) & 0x7) << 16)
> > > +#define  X(n)			((n) & 0xffff)
> > > +
> > > +#define PRG_WIDTH		0x70
> > > +#define  WIDTH(n)		(((n) - 1) & 0xffff)
> > > +
> > > +#define DPU_PRG_MAX_STRIDE	0x10000
> > > +
> > > +struct dpu_prg {
> > > +	struct device *dev;
> > > +	void __iomem *base;
> > > +	struct list_head list;
> > > +	struct clk *clk_apb;
> > > +	struct clk *clk_rtram;
> > > +	bool is_auxiliary;
> > > +};
> > > +
> > > +static DEFINE_MUTEX(dpu_prg_list_mutex);
> > > +static LIST_HEAD(dpu_prg_list);
> > > +
> > > +static inline u32 dpu_prg_read(struct dpu_prg *prg, unsigned int offset)
> > > +{
> > > +	return readl(prg->base + offset);
> > > +}
> > > +
> > > +static inline void
> > > +dpu_prg_write(struct dpu_prg *prg, unsigned int offset, u32 value)
> > > +{
> > > +	writel(value, prg->base + offset);
> > > +}
> > > +
> > > +static void dpu_prg_reset(struct dpu_prg *prg)
> > > +{
> > > +	usleep_range(10, 20);
> > > +	dpu_prg_write(prg, PRG_CTRL + SET, SOFTRST);
> > > +	usleep_range(10, 20);
> > > +	dpu_prg_write(prg, PRG_CTRL + CLR, SOFTRST);
> > > +}
> > > +
> > > +void dpu_prg_enable(struct dpu_prg *prg)
> > > +{
> > > +	dpu_prg_write(prg, PRG_CTRL + CLR, BYPASS);
> > > +}
> > > +
> > > +void dpu_prg_disable(struct dpu_prg *prg)
> > > +{
> > > +	dpu_prg_write(prg, PRG_CTRL, BYPASS);
> > > +}
> > > +
> > > +static int dpu_prg_stride_fixup(struct dpu_prg *prg,
> > > +				unsigned int width, unsigned int x_offset,
> > > +				unsigned int bits_per_pixel, u64 modifier,
> > > +				unsigned int *stride, dma_addr_t baddr)
> > > +{
> > > +	unsigned int burst_size;
> > > +	unsigned int mt_w = 0;	/* micro-tile width */
> > > +
> > > +	/* prg finer cropping into micro-tile block - top/left start point */
> > > +	switch (modifier) {
> > > +	case DRM_FORMAT_MOD_NONE:
> > > +		break;
> > > +	case DRM_FORMAT_MOD_VIVANTE_TILED:
> > > +	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
> > > +		mt_w = (bits_per_pixel == 16) ? 8 : 4;
> > > +		break;
> > > +	default:
> > > +		dev_err(prg->dev, "unsupported modifier 0x%016llx\n", modifier);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (modifier) {
> > > +		x_offset %= mt_w;
> > > +
> > > +		/* consider x offset to calculate stride */
> > > +		baddr += x_offset * (bits_per_pixel / 8);
> > > +	}
> > > +
> > > +	/*
> > > +	 * address TKT343664:
> > > +	 * fetch unit base address has to align to burst size
> > > +	 */
> > > +	burst_size = 1 << __ffs(baddr);
> > > +	burst_size = round_up(burst_size, 8);
> > > +	burst_size = min(burst_size, 128U);
> > > +
> > > +	/*
> > > +	 * address TKT339017:
> > > +	 * fixup for mismatch between burst size and stride
> > > +	 */
> > > +	if (modifier)
> > > +		*stride = round_up(*stride + round_up(baddr % 8, 8),
> > > +								burst_size);
> > > +	else
> > > +		*stride = round_up(*stride, burst_size);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void dpu_prg_configure(struct dpu_prg *prg,
> > > +		       unsigned int width, unsigned int height,
> > > +		       unsigned int x_offset, unsigned int y_offset,
> > > +		       unsigned int stride, unsigned int bits_per_pixel,
> > > +		       dma_addr_t baddr,
> > > +		       const struct drm_format_info *format, u64 modifier,
> > > +		       bool start)
> > > +{
> > > +	unsigned int burst_size;
> > > +	u32 val;
> > > +	int ret;
> > > +
> > > +	ret = dpu_prg_stride_fixup(prg, width, x_offset, bits_per_pixel,
> > > +				   modifier, &stride, baddr);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	/*
> > > +	 * address TKT342628(part 1):
> > > +	 * when prg stride is less or equals to burst size,
> > > +	 * the auxiliary prg height needs to be a half
> > > +	 */
> > > +	if (prg->is_auxiliary && stride <= burst_size) {
> > 
> > It looks like burst_size is used uninitialized... Or am I missing something?
> 
> You're right.  Will fix this in v2.
> 
> Thanks,
> Liu Ying
> 
> > 
> > Thanks,
> > Laurentiu
> > 
> > > +		height /= 2;
> > > +		if (modifier)
> > > +			y_offset /= 2;
> > > +	}
> > > +
> > > +	dpu_prg_write(prg, PRG_STRIDE, STRIDE(stride));
> > > +	dpu_prg_write(prg, PRG_WIDTH, WIDTH(width));
> > > +	dpu_prg_write(prg, PRG_HEIGHT, HEIGHT(height));
> > > +	dpu_prg_write(prg, PRG_OFFSET, X(x_offset) | Y(y_offset));
> > > +	dpu_prg_write(prg, PRG_BADDR, baddr);
> > > +
> > > +	val = SHADOW_LOAD_MODE | SC_DATA_TYPE_8BIT | BYPASS;
> > > +	if (format->format == DRM_FORMAT_NV21 ||
> > > +	    format->format == DRM_FORMAT_NV12) {
> > > +		val |= HANDSHAKE_MODE_8LINES;
> > > +		/*
> > > +		 * address TKT342628(part 2):
> > > +		 * when prg stride is less or equals to burst size,
> > > +		 * we disable UV_EN bit for the auxiliary prg
> > > +		 */
> > > +		if (prg->is_auxiliary && stride > burst_size)
> > > +			val |= UV_EN;
> > > +	} else {
> > > +		val |= HANDSHAKE_MODE_4LINES;
> > > +	}
> > > +	switch (bits_per_pixel) {
> > > +	case 32:
> > > +		val |= DES_DATA_TYPE_32BPP;
> > > +		break;
> > > +	case 24:
> > > +		val |= DES_DATA_TYPE_24BPP;
> > > +		break;
> > > +	case 16:
> > > +		val |= DES_DATA_TYPE_16BPP;
> > > +		break;
> > > +	case 8:
> > > +		val |= DES_DATA_TYPE_8BPP;
> > > +		break;
> > > +	}
> > > +	/* no shadow for the first frame */
> > > +	if (!start)
> > > +		val |= SHADOW_EN;
> > > +	dpu_prg_write(prg, PRG_CTRL, val);
> > > +}
> > > +
> > > +void dpu_prg_reg_update(struct dpu_prg *prg)
> > > +{
> > > +	dpu_prg_write(prg, PRG_REG_UPDATE, REG_UPDATE);
> > > +}
> > > +
> > > +void dpu_prg_shadow_enable(struct dpu_prg *prg)
> > > +{
> > > +	dpu_prg_write(prg, PRG_CTRL + SET, SHADOW_EN);
> > > +}
> > > +
> > > +bool dpu_prg_stride_supported(struct dpu_prg *prg,
> > > +			      unsigned int width, unsigned int x_offset,
> > > +			      unsigned int bits_per_pixel, u64 modifier,
> > > +			      unsigned int stride, dma_addr_t baddr)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = dpu_prg_stride_fixup(prg, width, x_offset, bits_per_pixel,
> > > +				   modifier, &stride, baddr);
> > > +	if (ret)
> > > +		return false;
> > > +
> > > +	if (stride > DPU_PRG_MAX_STRIDE)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +void dpu_prg_set_auxiliary(struct dpu_prg *prg)
> > > +{
> > > +	prg->is_auxiliary = true;
> > > +}
> > > +
> > > +void dpu_prg_set_primary(struct dpu_prg *prg)
> > > +{
> > > +	prg->is_auxiliary = false;
> > > +}
> > > +
> > > +struct dpu_prg *
> > > +dpu_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
> > > +{
> > > +	struct device_node *prg_node = of_parse_phandle(dev->of_node,
> > > +							name, index);
> > > +	struct dpu_prg *prg;
> > > +
> > > +	mutex_lock(&dpu_prg_list_mutex);
> > > +	list_for_each_entry(prg, &dpu_prg_list, list) {
> > > +		if (prg_node == prg->dev->of_node) {
> > > +			mutex_unlock(&dpu_prg_list_mutex);
> > > +			device_link_add(dev, prg->dev,
> > > +					DL_FLAG_PM_RUNTIME |
> > > +					DL_FLAG_AUTOREMOVE_CONSUMER);
> > > +			return prg;
> > > +		}
> > > +	}
> > > +	mutex_unlock(&dpu_prg_list_mutex);
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +static const struct of_device_id dpu_prg_dt_ids[] = {
> > > +	{ .compatible = "fsl,imx8qm-prg", },
> > > +	{ .compatible = "fsl,imx8qxp-prg", },
> > > +	{ /* sentinel */ },
> > > +};
> > > +
> > > +static int dpu_prg_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct resource *res;
> > > +	struct dpu_prg *prg;
> > > +	int ret;
> > > +
> > > +	prg = devm_kzalloc(dev, sizeof(*prg), GFP_KERNEL);
> > > +	if (!prg)
> > > +		return -ENOMEM;
> > > +
> > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	prg->base = devm_ioremap_resource(&pdev->dev, res);
> > > +	if (IS_ERR(prg->base))
> > > +		return PTR_ERR(prg->base);
> > > +
> > > +	prg->clk_apb = devm_clk_get(dev, "apb");
> > > +	if (IS_ERR(prg->clk_apb)) {
> > > +		ret = PTR_ERR(prg->clk_apb);
> > > +		dev_err_probe(dev, ret, "failed to get apb clock\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	prg->clk_rtram = devm_clk_get(dev, "rtram");
> > > +	if (IS_ERR(prg->clk_rtram)) {
> > > +		ret = PTR_ERR(prg->clk_rtram);
> > > +		dev_err_probe(dev, ret, "failed to get rtram clock\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	prg->dev = dev;
> > > +	platform_set_drvdata(pdev, prg);
> > > +
> > > +	pm_runtime_enable(dev);
> > > +
> > > +	mutex_lock(&dpu_prg_list_mutex);
> > > +	list_add(&prg->list, &dpu_prg_list);
> > > +	mutex_unlock(&dpu_prg_list_mutex);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int dpu_prg_remove(struct platform_device *pdev)
> > > +{
> > > +	struct dpu_prg *prg = platform_get_drvdata(pdev);
> > > +
> > > +	mutex_lock(&dpu_prg_list_mutex);
> > > +	list_del(&prg->list);
> > > +	mutex_unlock(&dpu_prg_list_mutex);
> > > +
> > > +	pm_runtime_disable(&pdev->dev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused dpu_prg_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct platform_device *pdev = to_platform_device(dev);
> > > +	struct dpu_prg *prg = platform_get_drvdata(pdev);
> > > +
> > > +	clk_disable_unprepare(prg->clk_rtram);
> > > +	clk_disable_unprepare(prg->clk_apb);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused dpu_prg_runtime_resume(struct device *dev)
> > > +{
> > > +	struct platform_device *pdev = to_platform_device(dev);
> > > +	struct dpu_prg *prg = platform_get_drvdata(pdev);
> > > +	int ret;
> > > +
> > > +	ret = clk_prepare_enable(prg->clk_apb);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to enable apb clock: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(prg->clk_rtram);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to enable rtramclock: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	dpu_prg_reset(prg);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct dev_pm_ops dpu_prg_pm_ops = {
> > > +	SET_RUNTIME_PM_OPS(dpu_prg_runtime_suspend,
> > > +			   dpu_prg_runtime_resume, NULL)
> > > +};
> > > +
> > > +struct platform_driver dpu_prg_driver = {
> > > +	.probe = dpu_prg_probe,
> > > +	.remove = dpu_prg_remove,
> > > +	.driver = {
> > > +		.pm = &dpu_prg_pm_ops,
> > > +		.name = "dpu-prg",
> > > +		.of_match_table = dpu_prg_dt_ids,
> > > +	},
> > > +};
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
