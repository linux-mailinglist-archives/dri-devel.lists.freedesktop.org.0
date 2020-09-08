Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219F261C33
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 21:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75526E8B2;
	Tue,  8 Sep 2020 19:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9E96E8B2;
 Tue,  8 Sep 2020 19:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9NmcO5jREJCHmCZmv5PhW3cU172y/p7E3cbdl14CgspCgs+qy6+m2iKz0BRUPYdhzbx5sA0G4Tk6s8AqYcOoU3XKEYWr6R4r0V2mK6ShpSt368Quv1RKbx7/NVcuEg5m9g4+loEWnSst1IRpEELrAlmBF2Pj0QsR9ipYv3ci3vOvegnkQWujfpzCaqqcx5n/bf3Hc/yTDSs8fFQEu2C2Dq2trWFawtF9mnImUwOqDdYDaHN3Mr7YAUfAa+PXRrAWUj6HggdD2nzjlfrY+dGFIdhcRTyesf1fIeuQYL+0NmVWtKta2k1rSyY15Opz3Gk8YKL1tcF2wvU+lr4SUQBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2iIlSL/+JwQQr7qbdEdVNLS39E7eII+AKtfg10xNYc=;
 b=kttFZuXeHOuTpMUxfQVL1QTRoeijKa7XwQGcULEAbtQ7sSRiuM4la7dmRqAzfRxcr0yynR5GYKR4A5lv5/7eSonoB6x2T8sUmpvnQv7iZ/JDywNglHy/jkaGE1H/Nye6UvQN76xIFudBsmj+XacCKQ9objeGPms50kyJwE/LEqXNXqumZ37TVPVsDaiQLBk7oGs0OIXn7hWPPMonTOayB5lIvEZxVyLsnSwSqCVidfOQJVHbDTJMnPdqoabciv7gubP9mrPzA59ofWREeT7l4aPsbmDNDxMcK2ByN86Y+xyzco5IMQiKGlS6f+1DWkdNmJB0KRh2Z0n15qySgBX6iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2iIlSL/+JwQQr7qbdEdVNLS39E7eII+AKtfg10xNYc=;
 b=BnRhJgZ8QSMd/BJJ/KD1uc8yKT9/qhb6psF8KGWl5N8dyh9irMzsKdC8iLcW57FbLvHOZzmu9uOp4zOpJs6PYWyo8g89EWF+ijztwMXVA6yk4y5QXe10yXldibzYJzhBb0a0Ku0HX/wxQ/FWdiOJvrfXeZPZbktB+G4INnwgJec=
Received: from CY4PR14CA0030.namprd14.prod.outlook.com (2603:10b6:903:101::16)
 by MN2PR02MB6877.namprd02.prod.outlook.com (2603:10b6:208:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 19:16:11 +0000
Received: from CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:101:cafe::56) by CY4PR14CA0030.outlook.office365.com
 (2603:10b6:903:101::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Tue, 8 Sep 2020 19:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT052.mail.protection.outlook.com (10.152.74.123) with Microsoft SMTP
 Server id 15.20.3348.17 via Frontend Transport; Tue, 8 Sep 2020 19:16:10
 +0000
Received: from [149.199.38.66] (port=39053 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kFj5v-0006Ao-B8; Tue, 08 Sep 2020 12:15:55 -0700
Received: from [127.0.0.1] (helo=localhost)
 by smtp.xilinx.com with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kFj69-0007JW-Qa; Tue, 08 Sep 2020 12:16:09 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 088JG0Kw023800; 
 Tue, 8 Sep 2020 12:16:00 -0700
Received: from [172.19.75.82] (helo=xsjsycl40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kFj60-0007EO-3Y; Tue, 08 Sep 2020 12:16:00 -0700
Received: by xsjsycl40.xilinx.com (Postfix, from userid 13638)
 id 12A36352762; Tue,  8 Sep 2020 12:16:00 -0700 (PDT)
Date: Tue, 8 Sep 2020 12:16:00 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/xlnx: Use devm_drm_dev_alloc
Message-ID: <20200908191600.GA1569998@xilinx.com>
References: <20200904143941.110665-7-daniel.vetter@ffwll.ch>
 <20200907082225.150837-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907082225.150837-1-daniel.vetter@ffwll.ch>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7726dea6-dbea-47e2-48d3-08d8542ba4f3
X-MS-TrafficTypeDiagnostic: MN2PR02MB6877:
X-Microsoft-Antispam-PRVS: <MN2PR02MB687758BBD98AB8A25B36F114D6290@MN2PR02MB6877.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEK0QhHDrhGijlpRY44GWRBjROQYrWYpMU5/H6ZBC5ay6MzIJBjGX7D0dH3oYQa35BAE2ewMu6sNGXaQ5ALYDT42Hp/g7nd8OLb6uGbVPiknNLw30z53pbxYSkc53A2+m4rvogZIarquTKr9ti3xFXmmGJEPPVJPCYqW690nblLOPc/81aS8fglOUfW7tIQnNPWRw67Y8YTkevH5XB2bu4ZMNbUO9EYifdRFPxorIOvzu895EKS4MPd7490A0JBIEkomH9mePM7lSdpUstNg7w853Xhh0NN6TbiOg0BFCUvsyJ416g8PrNpuFGRK/xW3qyFCDxltA4htWhuRWTPWmoI4FMEO8caDwxpgjrk1+HhqIhIrcOunNWwGzkxZWOXiRQi9oDCiFfQWRpBZPw0VXA==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(396003)(346002)(136003)(376002)(39860400002)(46966005)(33656002)(44832011)(54906003)(42186006)(2616005)(8936002)(426003)(336012)(81166007)(478600001)(316002)(82740400003)(82310400003)(83380400001)(8676002)(47076004)(6266002)(5660300002)(26005)(4326008)(6916009)(186003)(356005)(70206006)(70586007)(2906002)(36756003)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 19:16:10.0569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7726dea6-dbea-47e2-48d3-08d8542ba4f3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6877
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Simek <michals@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Mon, Sep 07, 2020 at 01:22:25AM -0700, Daniel Vetter wrote:
> Gets rid of drmm_add_final_kfree, which I want to unexport so that it
> stops confusion people about this transitional state of rolling drm
> managed memory out.
> 
> This also fixes the missing drm_dev_put in the error path of the probe
> code.
> 
> v2: Drop the misplaced drm_dev_put from zynqmp_dpsub_drm_init (all
> other paths leaked on error, this should have been in
> zynqmp_dpsub_probe), now that subsumed by the auto-cleanup of
> devm_drm_dev_alloc.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: linux-arm-kernel@lists.infradead.org

Looks correct to me.

Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>

Thanks!

-hyun

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 27 ++++++---------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 26328c76305b..8e69303aad3f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -111,7 +111,7 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
>  	/* Initialize mode config, vblank and the KMS poll helper. */
>  	ret = drmm_mode_config_init(drm);
>  	if (ret < 0)
> -		goto err_dev_put;
> +		return ret;
>  
>  	drm->mode_config.funcs = &zynqmp_dpsub_mode_config_funcs;
>  	drm->mode_config.min_width = 0;
> @@ -121,7 +121,7 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
>  
>  	ret = drm_vblank_init(drm, 1);
>  	if (ret)
> -		goto err_dev_put;
> +		return ret;
>  
>  	drm->irq_enabled = 1;
>  
> @@ -154,8 +154,6 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
>  
>  err_poll_fini:
>  	drm_kms_helper_poll_fini(drm);
> -err_dev_put:
> -	drm_dev_put(drm);
>  	return ret;
>  }
>  
> @@ -208,27 +206,16 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	/* Allocate private data. */
> -	dpsub = kzalloc(sizeof(*dpsub), GFP_KERNEL);
> -	if (!dpsub)
> -		return -ENOMEM;
> +	dpsub = devm_drm_dev_alloc(&pdev->dev, &zynqmp_dpsub_drm_driver,
> +				   struct zynqmp_dpsub, drm);
> +	if (IS_ERR(dpsub))
> +		return PTR_ERR(dpsub);
>  
>  	dpsub->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, dpsub);
>  
>  	dma_set_mask(dpsub->dev, DMA_BIT_MASK(ZYNQMP_DISP_MAX_DMA_BIT));
>  
> -	/*
> -	 * Initialize the DRM device early, as the DRM core mandates usage of
> -	 * the managed memory helpers tied to the DRM device.
> -	 */
> -	ret = drm_dev_init(&dpsub->drm, &zynqmp_dpsub_drm_driver, &pdev->dev);
> -	if (ret < 0) {
> -		kfree(dpsub);
> -		return ret;
> -	}
> -
> -	drmm_add_final_kfree(&dpsub->drm, dpsub);
> -
>  	/* Try the reserved memory. Proceed if there's none. */
>  	of_reserved_mem_device_init(&pdev->dev);
>  
> @@ -286,8 +273,6 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
>  	clk_disable_unprepare(dpsub->apb_clk);
>  	of_reserved_mem_device_release(&pdev->dev);
>  
> -	drm_dev_put(drm);
> -
>  	return 0;
>  }
>  
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
