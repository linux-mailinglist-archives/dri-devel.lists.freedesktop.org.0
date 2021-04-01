Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF9035205C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 22:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EBF6ECC8;
	Thu,  1 Apr 2021 20:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7E46ECC8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 20:08:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1kF5NIlQNvTQqayL6IKWNFcZAlgUZRxBINr2kNs3fcS1qzzIhOm/V5Onv0XNHgCMSkMuceBt5cICeOmYNKARZ5x+Fo01E3QeaVe0XV62h84dt6OBdwP+KYpT/ELvztnKDiHZ2YnEN1KxLEhAU/BWbX+ux7ng9uQtMHDSP+ufA+d91TlDslevOXk2nK2VTea0nm0VSc5rx7UiGWwIky82/CPNgHuXOBRQICR+tfVOZTcNTbI9okoEiz6XTq5oZ0MK4Gc1+dWlxofQynfBqMAdpPS7mNYiKZ5/V6Mxae4LObUoe+oyliZzjUVfxdTePdw5wbcvpNUVSIBJCFtLcfXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNFGnz1NH4RlLRKp8b5Q15155MEVBdkAHK02nGWEaz0=;
 b=ljPwMYYqHekUtuSGwckJwXvp9iGkMJkEIcGa8kbduKY2cXtr1sAiSIHCionBAb3Ku7JdHb0IAvDcT42Cr5nUIapltuVVY0ih1MQU+jMjsSEkY4kzEMSbAPK21OGk4MuIRii5TlPPbyVVUnVuK8uKw+NUM3UwudBUuwXI5QK/8pSB2Vyh0Pu2Xo17WpoNksRsOYP5+UoWuSv1+QJ5R0ztFvX3S9p9sZ3D2dSZZKsTfm+x6gUUjuR9C+FWUdqWu8s6wB5m5Wj46LaBbZ+GT1XlxiTJ6X7tB/QhbVO2sCSCmhhLhK7GhS7xSrGx/qPbCH6Nwl1WrCasrDGIRtORPOK10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNFGnz1NH4RlLRKp8b5Q15155MEVBdkAHK02nGWEaz0=;
 b=MqDC3ge+MtXkp4Mb6oNRkNSUmxD4b2H/lpmKkiyYsnvmo1teWvFXDJDPmRdjujUfOo7ESjEBPAF/sRYCVFPfNDxgbNvwqxaFL9n8h2qJp3wlya+diQhZpSv2d7jkeUr1yitRmt1XBFKRyZR0Y+W48U1kexdltXpSNthv1Cux1h46Py00q21q7f+DdMdGieBmCPnnIF7hE7WLNyNHrGezIlqTEQnm1UXuk8ELhpYBOev9ey8f0OMfo5JXC/M7YGhIp0Ty7BWWhUOxYhP/+uNWGu33pBfostUt5CS/SqBzpWyFEXI/3swFb1Kp/AUP7tSxhOYOLcR/Ty5UReYLrZ8QMQ==
Received: from BN6PR18CA0002.namprd18.prod.outlook.com (2603:10b6:404:121::12)
 by SJ0PR12MB5504.namprd12.prod.outlook.com (2603:10b6:a03:3ad::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 1 Apr
 2021 20:08:11 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::f4) by BN6PR18CA0002.outlook.office365.com
 (2603:10b6:404:121::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Thu, 1 Apr 2021 20:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 20:08:10 +0000
Received: from [10.26.49.14] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Apr
 2021 20:08:08 +0000
Subject: Re: [PATCH 2/2] drm/tegra: sor: Fully initialize SOR before
 registration
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210401154105.3345412-1-thierry.reding@gmail.com>
 <20210401154105.3345412-2-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5fa61017-5e18-e8aa-ad59-d1151599f322@nvidia.com>
Date: Thu, 1 Apr 2021 21:08:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401154105.3345412-2-thierry.reding@gmail.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7906a710-b5f8-4f4d-1c8a-08d8f549df92
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5504:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5504FBD6E0434D0E4DEAC5FAD97B9@SJ0PR12MB5504.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rLtkurA4rsDMrEfo+M5OYypKU03p4tCtfSWkNN4/LnP0diTfpCocE0d3X0UCwBqxQCA3TGdsDOGzot5IeqGzPr8CG6QWwKQd3iXhelWLZBzbiBSO/SctG33txJ83Nq0drAZelhby+uELqXQhyMWr0r9rBNy3BOI+yT7YQaIY5wPbz6oXdzxSDqLPQAsdfj7E39jv0BV0t4IXhff9/1LIUc6UO5u2thy2eV1VjOOIp6axNlriX4q+g553PaUGjC8s51/DrQF+AQvqO4tOXXz8Tj0yeOsb1CuBoWqVPFp6eDMjJ5ssO+mwEbf4jTufcc/y5jzksU+d88vrVppkkbBT4+zLKvPSwazRbAav0M2/nlA/RKmqT1fRuhUcrvXA6FmHiBu5ahDqejwPWam/DqJZToEDJb3mHUXFmCpg2LipZXvXYixDWyoqvqgTdUvvy8hVD9g1pVXwRWI1wlPR/4/WaQadB3gIFrrkJN7ph+wkpdAJoD2nxPOfuH78jJ1QnVW9VtKaKaSzJo0lBXJcHDdl+/eysVYUHfS/sYVvldfHylFV3d+MYrWiMVToD/7qkTzuO6tNBmvAozrPJLXHm63ZYV5C5mu9v5swAtlNGCdBybLG4WMtgaAGqra9JU/YuflInPe75dZ7Uk0zFEbtEQQhlxKBRPxgOSfRgcATaCNILht98iUuJjJIo2L8KCaRmxYEue5wEkD52UnnnUGufU+KEg==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(16576012)(36906005)(31696002)(31686004)(36860700001)(70206006)(70586007)(336012)(316002)(7636003)(86362001)(82310400003)(83380400001)(356005)(2616005)(4326008)(478600001)(8936002)(36756003)(6916009)(8676002)(47076005)(54906003)(426003)(26005)(16526019)(186003)(5660300002)(2906002)(82740400003)(53546011)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 20:08:10.3528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7906a710-b5f8-4f4d-1c8a-08d8f549df92
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5504
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/04/2021 16:41, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Before registering the SOR host1x client, make sure that it is fully
> initialized. This avoids a potential race condition between the SOR's
> probe and the host1x device initialization in cases where the SOR is
> the final sub-device to register to a host1x instance.
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/sor.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 7b88261f57bb..b29bc10a0a4d 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3916,17 +3916,10 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, sor);
>  	pm_runtime_enable(&pdev->dev);
>  
> -	INIT_LIST_HEAD(&sor->client.list);
> +	host1x_client_init(&sor->client);
>  	sor->client.ops = &sor_client_ops;
>  	sor->client.dev = &pdev->dev;
>  
> -	err = host1x_client_register(&sor->client);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
> -			err);
> -		goto rpm_disable;
> -	}
> -
>  	/*
>  	 * On Tegra210 and earlier, provide our own implementation for the
>  	 * pad output clock.
> @@ -3938,13 +3931,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  				      sor->index);
>  		if (!name) {
>  			err = -ENOMEM;
> -			goto unregister;
> +			goto uninit;
>  		}
>  
>  		err = host1x_client_resume(&sor->client);
>  		if (err < 0) {
>  			dev_err(sor->dev, "failed to resume: %d\n", err);
> -			goto unregister;
> +			goto uninit;
>  		}
>  
>  		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
> @@ -3955,14 +3948,20 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  		err = PTR_ERR(sor->clk_pad);
>  		dev_err(sor->dev, "failed to register SOR pad clock: %d\n",
>  			err);
> -		goto unregister;
> +		goto uninit;
> +	}
> +
> +	err = __host1x_client_register(&sor->client);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
> +			err);
> +		goto uninit;
>  	}
>  
>  	return 0;
>  
> -unregister:
> -	host1x_client_unregister(&sor->client);
> -rpm_disable:
> +uninit:
> +	host1x_client_exit(&sor->client);
>  	pm_runtime_disable(&pdev->dev);
>  remove:
>  	tegra_output_remove(&sor->output);
> 


Thanks! Completed 200 boots on Jetson TX1 without any further probing
issues, so ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
