Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B72AB29DDBE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 01:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE5789DEA;
	Thu, 29 Oct 2020 00:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1627989DEA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 00:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HS3EhHv8RKhRizufB8LokR8ZM/vcx4p8xX6oT4h83min6lvRzJ3W4DtUKsMJ71GBwe36HxFcgNkO3Nom7MqI8OwtD61uHkZKlaomurfv3wazqroyMR3oGLaX5ELqcSFCtdVNWi5RZbXdtiX9w8EkCT2r7gneyO90x6Bu+8d+mE6Ya5F+Pw6I7aEI5UMtj/7xESCUTIlZui8Fi7g4MIOu399GC1hB+65kWSv+eHEPPBz6i3RTU+eSHOAcWi/hVTDIgsccHJQUlWQg4TiTW3rVE0hgeAAXUZTRmuwUb3V6xyejlWrnKVw66VFuriGHNUtNDECoq1CsTaMxH8EXyPkGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNvsL21tRc7/5MBmilRptxDFb9ql9zyJAT6JugDtZa8=;
 b=WzZxX2KFlFsx8UdBfb0gTqZXGapPKXbeUa6JUhTLoTujWvGZRSkOaa23IqDob7ANeA7F32QoC1jnV67EkuIgWw28OABqLbRG+Lyj0ncPFRHtJN4Mz2F1JGSKvzl79jf1An6zOQEzmK3/CBdX4oNlZod3ViN+txzdNI1WY24c1BYZebyvOiHM1OtblwPX/zEFbgus4hGgmcQwoF/W2YKr6GJD3LPJQPMYiGHN6lnhzrxMchRF+GiXVKGnivlFtFyWu9mSAJgH6pYRsD7867uoxjuD2X2nT5xuZrU620wNSiKG18VCikzfBSFT0LGaKsGBC1hcHowSrJYZo4BkdBeT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNvsL21tRc7/5MBmilRptxDFb9ql9zyJAT6JugDtZa8=;
 b=gzzzlhR1cj471vIM8rGLddHFWpXSRyMN/tVjqxfQb9p0/Quq1O3wjRNMWJbBfMOvakMaMVQzyetLlCM/Yx9K8vAtHGtHGkNTmplcZl4nhq2s1ECgDhcnJ+qRmm5CMi1Pb361DKBmjRuQOtXFXTUrlNEkXs0WwiAKRE6rlW0dwjg=
Received: from DM5PR16CA0037.namprd16.prod.outlook.com (2603:10b6:4:15::23) by
 BYAPR02MB3925.namprd02.prod.outlook.com (2603:10b6:a02:f9::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19; Thu, 29 Oct 2020 00:41:42 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::40) by DM5PR16CA0037.outlook.office365.com
 (2603:10b6:4:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 00:41:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3499.20 via Frontend Transport; Thu, 29 Oct 2020 00:41:42 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 28 Oct 2020 17:41:40 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 28 Oct 2020 17:41:40 -0700
Envelope-to: hyunk@xilinx.com, hyun.kwon@xilinx.com, daniel@ffwll.ch,
 laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, peter.ujfalusi@ti.com,
 linux-kernel@vger.kernel.org
Received: from [172.19.75.82] (port=55728 helo=xsjsycl40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kXw0a-0004Ez-J7; Wed, 28 Oct 2020 17:41:40 -0700
Received: by xsjsycl40.xilinx.com (Postfix, from userid 13638)
 id 87207352755; Wed, 28 Oct 2020 17:41:40 -0700 (PDT)
Date: Wed, 28 Oct 2020 17:41:40 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] drm: xlnx: Use dma_request_chan for DMA channel request
Message-ID: <20201029004140.GA2849549@xilinx.com>
References: <20201023094602.5630-1-peter.ujfalusi@ti.com>
 <20201028013602.GA2416810@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028013602.GA2416810@xilinx.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea539b13-ff4f-46db-7cc5-08d87ba367a2
X-MS-TrafficTypeDiagnostic: BYAPR02MB3925:
X-Microsoft-Antispam-PRVS: <BYAPR02MB39257C1DE10F494CFB424C62D6140@BYAPR02MB3925.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3WSrvh04YUPlWZ8ovN+XN7UDZiXSerP5eHih6JM7j8wtXnG24Liev2+lTweu/dFTcm6Cdq865y1BrSlavmUOnymFRxe9SQt3vJbBy06UwxDUGY/yRf6eaJeOcm2XAT0iovBoKySdgW+ZTNpqkhkf/JZiT79cBe1N4shHLtBd/fR6lWb6SUd5uPTGJ4z+Fsakgr8pdpY3i6yIsTZcT2xquPnhOX6ntANZ/6Qq0mxHh6BqzK/HtbLRyithMBLrnvcHyZYRK7IT9U19j83KKiy6OPMq01+Kh3nTeRizL8Si56ZYoHWsYQuyKx6zVooND7L0yr49QPr46PGBVF3jB5clVfOtJqrRvPet+qw3KYvkolWWWJjxyZaMAuVpc8o2zj4eKzbgCJVnF/m0oc+E9kE6KlSZujO4ld79EZOkqTrj9vI=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(44832011)(36906005)(316002)(336012)(8936002)(356005)(54906003)(478600001)(70206006)(36756003)(5660300002)(6266002)(2906002)(42186006)(70586007)(33656002)(47076004)(4326008)(82310400003)(26005)(82740400003)(8676002)(426003)(1076003)(6916009)(107886003)(186003)(7636003)(83380400001)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 00:41:42.0729 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea539b13-ff4f-46db-7cc5-08d87ba367a2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB3925
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 06:36:02PM -0700, Hyun Kwon wrote:
> Hi Peter,
> 
> Thanks for the patch.
> 
> On Fri, Oct 23, 2020 at 02:46:02AM -0700, Peter Ujfalusi wrote:
> > There is no need to use the of_dma_request_slave_channel() directly as
> > dma_request_chan() is going to try to get the channel via OF as well.
> > 
> > Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> 
> So now dma_request_chan() has sysfs / debugfs registrations, and this looks
> good to me. I'll commit this within next couple days and keep it posted here.
> 

Applied to drm-misc-next.

Thanks!

-hyun


> Thanks,
> -hyun
> 
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > index 98bd48f13fd1..a4405d081aca 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > @@ -28,7 +28,6 @@
> >  #include <linux/dmaengine.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > -#include <linux/of_dma.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/spinlock.h>
> > @@ -1316,8 +1315,7 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
> >  
> >  		snprintf(dma_channel_name, sizeof(dma_channel_name),
> >  			 "%s%u", dma_names[layer->id], i);
> > -		dma->chan = of_dma_request_slave_channel(disp->dev->of_node,
> > -							 dma_channel_name);
> > +		dma->chan = dma_request_chan(disp->dev, dma_channel_name);
> >  		if (IS_ERR(dma->chan)) {
> >  			dev_err(disp->dev, "failed to request dma channel\n");
> >  			ret = PTR_ERR(dma->chan);
> > -- 
> > Peter
> > 
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> > Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
