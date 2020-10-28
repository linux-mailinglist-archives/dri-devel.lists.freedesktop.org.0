Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EA029CCEF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 02:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6BF6EC75;
	Wed, 28 Oct 2020 01:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAB46EC75
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 01:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AojDKeagxprwEXZQAJAqUT210FimCwlWXd3R1zcCmBefNEWT0o64xIqduRPVH3ZAKPw4/UetaIxGjl0xsUToxVnEnkt6v+uogkMTO7+R8aU5cESxZqKT9R5yRsD6pF1iVtXM279U+hYtJEQJgUH96JRT7G//fcOxBVQAuQ0TSxeMumoIkfX3ecbskAeudlchMhOaIOkr6q/Wlj9DFV8ZW8Go/9IFlgyz6FGJOOzAF3eysJaudaNJ1bLstGyaC8JIAhzWU5tI9C5JmU1rNXw8Cl0zWgkjlcmHZrnzhWw+9c+9vlNTsFfXyaQ8WpPWbw19wqx2gB2OFltDSGxMHYiEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFUIh5USxwI3iaKk3bdU8Dl2KZw803Cen8a5KlrLHxw=;
 b=NkIch4YCM2quJs5TUJq/SnbwxX6zQdWZCvcSw8mAYXL5veJN6Tw6W7ls33FeRvjJ6+9Cw42o0vnARirQrPbxcvL0Pv02PVEsj7+RYPvy75kHsacaf0/ZNMQNhKGMNIecYufjnkYPDQRaG0FtOtKyHfhJAHegicQnywYB5BwcuPOvkR5Tofuc+nQ0cdBtEztnh3dZ3296jvsha8WENYpmfGY3X+bjXEbe4JBu77GCcvxYYnSv9S6MTXlUOcGo0Xyl4V/6IXnx/J2Ko0kSpotQjn+Eu28Y262N5y5ETJzrbpCpTY43JBPTEHxcWhYkaCYVlf8qVq8Qr8Lo1t30VVR3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFUIh5USxwI3iaKk3bdU8Dl2KZw803Cen8a5KlrLHxw=;
 b=KECSlciB6YJ2UXsNhAqr5gHdErUA/uH0v8Iz7lAUvhduzL0vnggTxsW2awLpzwwXH/FuwiqJWh0nTw2iSOIuQ2/kIceAgybbxKy7Kqwp52uLmSwIGxIPdFIcpfIyUOHDqGSA9HIboGtRoLN9MeYnKQFSs0T8TYm+KGsta2Vt2GY=
Received: from CY4PR12CA0032.namprd12.prod.outlook.com (2603:10b6:903:129::18)
 by MWHPR02MB2496.namprd02.prod.outlook.com (2603:10b6:300:48::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 28 Oct
 2020 01:36:04 +0000
Received: from CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:129:cafe::3d) by CY4PR12CA0032.outlook.office365.com
 (2603:10b6:903:129::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 01:36:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT028.mail.protection.outlook.com (10.152.75.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3499.20 via Frontend Transport; Wed, 28 Oct 2020 01:36:04 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 27 Oct 2020 18:36:03 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 27 Oct 2020 18:36:03 -0700
Envelope-to: hyunk@xilinx.com, hyun.kwon@xilinx.com, daniel@ffwll.ch,
 laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, peter.ujfalusi@ti.com,
 linux-kernel@vger.kernel.org
Received: from [172.19.75.82] (port=51494 helo=xsjsycl40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kXaNe-00046B-Ud; Tue, 27 Oct 2020 18:36:02 -0700
Received: by xsjsycl40.xilinx.com (Postfix, from userid 13638)
 id E2A963526FA; Tue, 27 Oct 2020 18:36:02 -0700 (PDT)
Date: Tue, 27 Oct 2020 18:36:02 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] drm: xlnx: Use dma_request_chan for DMA channel request
Message-ID: <20201028013602.GA2416810@xilinx.com>
References: <20201023094602.5630-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023094602.5630-1-peter.ujfalusi@ti.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc80ce2e-6c52-48a4-1c36-08d87ae1d59c
X-MS-TrafficTypeDiagnostic: MWHPR02MB2496:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2496966C80AADF866D420530D6170@MWHPR02MB2496.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oTBQQI48TeFvyNP2ZX2uf5+8YH4rMgX55ZFA3IdmLssmnk3UBniw3jRU0ptln4Q5iWoQMJ68DFanyNlZoVxOnmocTrre/gHTSHhj/+0G11D/co0Yk5eeI7733K5Q2uFJTma0w733jcnfZsYq1Z6OqelMQJzy68Uz/gN/FByS8q23AIciUhkfAiPuBuQRPrVa4hNZymf7sGJ0oLLP7DcLXEM5oAsybvB+78SSWHvTKt1eTob2qyiwsQzaiNG9grhxiPuu4xdGDW//7RJ7roT/XlsskSHJtaY0knlDX02TTKo7tTPRN/WL9rLTArsloPIZLId2ZMh4QDINadZIyTPeohgB19DzYvyeedMIeFecsCovF1hlOMmdTjuVZWJ9hSRsXEsZyRd+9rlfEwQGrCAYDJpV1fUKcoS9gnPbkAK/IBA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(46966005)(1076003)(82310400003)(2906002)(356005)(316002)(36906005)(44832011)(8936002)(5660300002)(336012)(36756003)(107886003)(2616005)(26005)(6916009)(33656002)(54906003)(42186006)(426003)(7636003)(186003)(70206006)(70586007)(6266002)(83380400001)(47076004)(478600001)(8676002)(4326008)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 01:36:04.2313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc80ce2e-6c52-48a4-1c36-08d87ae1d59c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2496
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

Hi Peter,

Thanks for the patch.

On Fri, Oct 23, 2020 at 02:46:02AM -0700, Peter Ujfalusi wrote:
> There is no need to use the of_dma_request_slave_channel() directly as
> dma_request_chan() is going to try to get the channel via OF as well.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

So now dma_request_chan() has sysfs / debugfs registrations, and this looks
good to me. I'll commit this within next couple days and keep it posted here.

Thanks,
-hyun

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 98bd48f13fd1..a4405d081aca 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -28,7 +28,6 @@
>  #include <linux/dmaengine.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_dma.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/spinlock.h>
> @@ -1316,8 +1315,7 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
>  
>  		snprintf(dma_channel_name, sizeof(dma_channel_name),
>  			 "%s%u", dma_names[layer->id], i);
> -		dma->chan = of_dma_request_slave_channel(disp->dev->of_node,
> -							 dma_channel_name);
> +		dma->chan = dma_request_chan(disp->dev, dma_channel_name);
>  		if (IS_ERR(dma->chan)) {
>  			dev_err(disp->dev, "failed to request dma channel\n");
>  			ret = PTR_ERR(dma->chan);
> -- 
> Peter
> 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
