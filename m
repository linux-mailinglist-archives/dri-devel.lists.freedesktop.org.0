Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31B63923CB
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 02:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227EF6E8A7;
	Thu, 27 May 2021 00:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCC46E89F;
 Thu, 27 May 2021 00:30:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqicJPO1i3ngsQXN0U7TAgSijIVN/ksAbYM1kBq3Wnabq71owMvdmADPILhDMxn//+jhatE9fM/TVt1ym02ugTfJkSt9K5a+//Y21uE4WAL8GooDtQIeQmmBf3AN3aroxzPrBFpBBg84lMmCNLm3uqRN7F5s/vJL/EGOShKbXQZhEhXZxujoYCM1QjJB/4yLR81RWPhkW9/sBFeApc3+ikv9x9gX8sN/Oev9vyogPwZ/g+kS/oOkcLMu0D3oSw2FHTd991vCmRfYL6Ny7Y4j4frWpfepKcLlv/mjgZ8cKKPeqLvNEl682jDjjhwMNhG2Qbn9sBd2/30mbcrP6jCvuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPCfc/GBa63ueEIYB9FyU9I0z4d56lTwx1LDSC4SV3A=;
 b=Vz8/0L5VB1vyYRIUTNTbZl+bSZ2IMiy8GbzMFpb3DY4sXPNeGWVFF8rSx7uxK34Pvpwlt8yF6VIuef2iiUsgFE9QzoEifyJ7mhu+XSZ6nmBE93xbm7Qo1EvduEL/UnfPYVDYHIgxLHfObHCcoJdc3lJKFuK+ulWLFO76ORZrDsL0W7GO20aYwYcY4NcW2WzWA4Ki/HEZQlfVbdABCf4Y4YJd3zYvF62FOvBAaBA4OL+wx6pD4rOQFGVN7FuUofPqCj6B4bw7sHaUvdVJkbYisiIZ8ON2978OyuOp5O34rINKTqYh79eIoz1AY8L8XghMkRKn9M+9ERIzmEQGEWX+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPCfc/GBa63ueEIYB9FyU9I0z4d56lTwx1LDSC4SV3A=;
 b=ODH/Oq7yQA3YaRQlCJsJWg0Et9RwuQK/co2rS2AqgDrcla7Tjmp9nxSqvFGkAp7tzSiU3U9iwKnb7qRcPu9PhS3RhWXpOjpWYnnuYWHfAUYVMUXzSyTX2zK8ljqxKXyXFQ84b4Eqa0bRSnHKTdhQY8VdCKbZDRW6brXeAIiTxtg1nxlsM+QxpGouWpddkwCVA/jtsYoqMIXXzu8okNXhwZ7Kx5po9OhMTdxW5ihnJbL3z5xnwDee8agE0BwA/XFSeDeJ5lTFVwcjQdQfm/YvlEPma6/ssxsfqhnXCSx0srYb0IGiPBdodblUgGBsPscv1PEd/Y91WX1SNehF1TDimQ==
Received: from MWHPR10CA0001.namprd10.prod.outlook.com (2603:10b6:301::11) by
 BN6PR1201MB0114.namprd12.prod.outlook.com (2603:10b6:405:4d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Thu, 27 May
 2021 00:30:39 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:0:cafe::9a) by MWHPR10CA0001.outlook.office365.com
 (2603:10b6:301::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Thu, 27 May 2021 00:30:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 27 May 2021 00:30:39 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 00:30:36 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] nouveau/svm: Fix missing failure check on call to
 make_device_exclusive_range
Date: Thu, 27 May 2021 10:30:34 +1000
Message-ID: <2050838.rP6W8OkBfs@nvdebian>
In-Reply-To: <20210526140459.3749959-1-colin.king@canonical.com>
References: <20210526140459.3749959-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2447ba04-2c43-41cb-6566-08d920a6a743
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0114:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB011441F2F0625D7260F4A297DF239@BN6PR1201MB0114.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MkyJOCrYMbBcFI+3vVv1DRIiSCLoBO+dO+CUNAq2iUYejfUNItJ2UtQiOPocqJTue2u422xfwkxtokYieKYw9nlydIBVE+iLzy2m92eivB/xlq92tt9eTMOkUc8sYtUXWgn70S4XQivtZExYYNDsCNZYTwMJj965QgwJn6AyNFGh0kJEkv/qBFf8LVflW96mJt1xBf8zICRBOygRpQL4G2RAfVJOaqezSzweveJ7SnjizNWjRp9AWn4yM8RpQ0Ynk2vqx+MEyOL44ULJ4Ki4VgjVfmC/mZHCGNdeSgZ4WJvCsFuP3/M1n02XAldyVv0BA3FyH4qPdpchRJ/I0xmit1t5TX+42bHNytToWgNVh4sqsaj99Tb6byRTfP4wIi3x+aru3u2fQyENoZpc12KF8Uo3x6kqmd7lsAcUMIIh4RhV0MdR7lfB6ONMiU6/nG/F6D74O3o0nCuHrrRl0EvG6d4WSIDW7BPRjtymw/kXpIu/2b/5rfjY+pKDIE3g1YHjM2WWlJmFzRQS52Idb1gLg20RNjv2/aGrmfWUqojLOO9lUQRdkLa9mdJ6FCufo+JqoW8T7k3GJ/uDI1KrEmMDEGokGNy2lcVrKHAria9ur6jJkGHCqivI09J0Tj629vjPggjcMFWuiXy+fKgF3c7k9gRlsupuOCQqnE/ANbKCsDBOXEUG50DUu6zDxC3UjSv+
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(36840700001)(7416002)(6916009)(33716001)(336012)(86362001)(2906002)(9576002)(5660300002)(426003)(186003)(16526019)(9686003)(82310400003)(8936002)(83380400001)(4326008)(8676002)(478600001)(356005)(54906003)(36860700001)(7636003)(36906005)(70206006)(70586007)(26005)(82740400003)(316002)(47076005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 00:30:39.1308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2447ba04-2c43-41cb-6566-08d920a6a743
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0114
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 27 May 2021 12:04:59 AM AEST Colin King wrote:
> The call to make_device_exclusive_range can potentially fail leaving
> pointer page not initialized that leads to an uninitialized pointer
> read issue. Fix this by adding a check to see if the call failed and
> returning the error code.
> 
> Addresses-Coverity: ("Uninitialized pointer read")
> Fixes: c620bba9828c ("nouveau/svm: implement atomic SVM access")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c
> b/drivers/gpu/drm/nouveau/nouveau_svm.c index 84726a89e665..b913b4907088
> 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -609,8 +609,10 @@ static int nouveau_atomic_range_fault(struct
> nouveau_svmm *svmm,
> 
>                 notifier_seq = mmu_interval_read_begin(&notifier->notifier);
> mmap_read_lock(mm);
> -               make_device_exclusive_range(mm, start, start + PAGE_SIZE,
> -                                           &page, drm->dev);
> +               ret = make_device_exclusive_range(mm, start, start +
> PAGE_SIZE, +                                                 &page,
> drm->dev); +               if (ret < 0)
> +                       goto out;

Thanks for spotting, this is fixing get_user_pages() inside 
make_device_exclusive_range() returning an error. However the check needs to 
happen after dropping mmap_lock below:

>                 mmap_read_unlock(mm);
>                 if (!page) {
>                         ret = -EINVAL;
> --
> 2.31.1




