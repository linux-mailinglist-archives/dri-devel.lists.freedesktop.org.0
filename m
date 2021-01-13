Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71532F4103
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 02:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12EC89A91;
	Wed, 13 Jan 2021 01:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1708489A34;
 Wed, 13 Jan 2021 01:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVDgay178Gwse+jWUnup5HkOrVExYQ/+CWee5JFPI6cTi7Ez3mA5UOwk1yCBh8MbcIrusSLPYTxiQ6fN5ZDD25GulOmF5xaJo8gJsEoFJf79G1Rln/+b+hA5k1BpssiQMf8KrCVp7qsrS3XVcIhSyel5fWrUojgDvCat/qDun+MEJYvFHlha4SEGdDowYnzF7slylp7vMDGSljsgkfLR8CEKAYFjPS8YtQf25GUlvD+uD2S6L3ojzqfHM9/7brwc8AglHzOFriWcPe1HPA4c0H8sg9lMrSm3UJqOUgN3h8rP4/Pr3oXofX3a7Q1v7WJy5qmQJ6+LBnBH/e7FBg8Fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txyxzjYE4nXvsxr+LYJPsb19d8ssy3/HsrXgAPdMclU=;
 b=LEj25A6vvibKOge3gUskleUfu2TAfQr39gyjCReagZehkhxvnRZB9aBIy9SpldlfJ3SEDjuon+kQyN/YUCtJp5Vv1XCNqpz9oN3wXVVRD9MhJZAAnk8B77IJY86ixcWG4sFVyhu9/J7+himAhoG6G6Fjptjnpa/vurdWXbUBpb3ItPGQxLW2jZKkd2eDN+cbwdKdT2Jn2kr5IzC1fORJELhAWA0Mh6pmHFNN3YSWXQBwy31bEy9ufuPdIzdI6GPBmWCb6WXGwmS5eipt15wAqUF47RLCOTS17eB5naFUwNfVTH/DenrRFlPExtBuwvlnwpNv8ATUnxRcdU8s5KLTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txyxzjYE4nXvsxr+LYJPsb19d8ssy3/HsrXgAPdMclU=;
 b=AIZItQTTGJ+TNy9Wq/WCKNeeOp+0Xvv9H3g1+MXvnZiwfFvCH9oX2Z/G8F2jl0jFDpV18IphJos7/VftDMgOZt3Uwt1AXftxMNRa09/Bc76Y1UaHXVMDQvAG7wYrwH5Wr0cwjVrwmdGUv/VbzOVHUhRGtIx6jsw/idskq1KQV6s=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR1201MB0031.namprd12.prod.outlook.com (2603:10b6:301:57::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 01:19:11 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 01:19:11 +0000
Date: Wed, 13 Jan 2021 09:19:01 +0800
From: Huang Rui <ray.huang@amd.com>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] drm: amdgpu: pm: Mark vangogh_clk_dpm_is_enabled() as
 static
Message-ID: <20210113011901.GA135176@hr-amd>
References: <1610481442-6606-1-git-send-email-jrdr.linux@gmail.com>
Content-Disposition: inline
In-Reply-To: <1610481442-6606-1-git-send-email-jrdr.linux@gmail.com>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HK2PR03CA0062.apcprd03.prod.outlook.com (2603:1096:202:17::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Wed, 13 Jan 2021 01:19:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c97688c8-4a1f-4714-d2b2-08d8b7613bab
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0031:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0031728951A92C1854D7B84EECA90@MWHPR1201MB0031.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBlMwqPliRShg2JqedQTJiumzniYUAdvaper8Mp/p1yzdZPKmI1LRNoANQzkCZhx/Wsqq1LPCpPCIw3G3Zddjm8LQ8hMT2bsNTZzGVM3B0DNMXPKXK+0MBvH51rJCoE/oiNMB5p8DFsajzpBlXqObDr3NiyrfS0+olDNNegkOUcAQL9LZ1jwT68FJiSKDdfuySRnT09fwGcRdLSyYOebm8qooELiANqn7J7QqGIAWQDpEll9uPARQ/4OjlhMFGBzX+DWPJEp3KGkj4kDEO+IZgHgsKRRN9kooDqFJoTsG6GAwl1eGrYpod3V0Ee7bHwgYbA9wMdJQpZ6CnPCI8RQLmFw8h3UiFYNgrtRceCRTTtoRQ2DSX9U5j+pK5DfZYWh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(6666004)(26005)(9686003)(54906003)(66946007)(55016002)(186003)(66556008)(16526019)(2906002)(1076003)(33716001)(4326008)(66476007)(52116002)(86362001)(6496006)(83380400001)(956004)(5660300002)(8936002)(8676002)(316002)(478600001)(33656002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BmDrVFX3WkhuI2t/cd8GNSHTf22MA6YA38kJctTf5YylxhnBevGqqUrpzlJ1?=
 =?us-ascii?Q?aZbnhMSRvO92QbIA6HadXmXYMdB3f3ZmErqY/IhlS0oTSCbXWEqynQZbrZ9u?=
 =?us-ascii?Q?OOm4ohLmV2YR7c8xQyonLUcdJksycJKx7ad7+Uto261VDO8rR1uBpdjO+xsQ?=
 =?us-ascii?Q?5HzFAhxchn2cpWk2p4dvTE4EEkUUZsVCoLFvBuioIpS93c7k+EBFa1RYyqkd?=
 =?us-ascii?Q?JiD6AXPadJfFPlIC6hppd1LUudP0XlctOhFIXWDOKQcDHIbikrVUv57CJzS7?=
 =?us-ascii?Q?BKE+gTKvqr3oHAtZus6PlXOuqTXJuU/DEWMGokN1+DWDvl48YH+dWEqPoxcW?=
 =?us-ascii?Q?eQGoYuBew0ydsYmhFV3yPfv42fX6IxWHq86XA1tX6pmt4yDBFv3iObPAsV3F?=
 =?us-ascii?Q?KXf82g5HI4mq0s1nwiI43w51zELrKekZRZHRgWIQsu+ZMCm1dBZzxi0RcfaZ?=
 =?us-ascii?Q?e3BZvZwBdO7GBIFfDoxP03Llkobva4mrnwjBh/UaaBguZfHAK180gf8wOmuM?=
 =?us-ascii?Q?Cau4WQrSmRkbph+hRh8feIW2IF3RvhML50hhYbqCgTf/A5LPowTD9+WxOkRB?=
 =?us-ascii?Q?cVB2nU5lEQD5rrDvxbTVIkUOCvXfFsAM4gQ6Vfnz3M/35D2EvHpPv7McB1SU?=
 =?us-ascii?Q?/J/Vgiu2gJcx3voALZY1FLcFNTUmm1iM7Pl8HxfwetlxvohMTcP36tQ+AzIe?=
 =?us-ascii?Q?9ZsG/bukg4/q8ADRHJ2bNTurhN50yFho7g/EZ0ZA6fL2QtXp7xtYTXQs5Ybo?=
 =?us-ascii?Q?iSPb/mxmk92gCVgDmxq0/SkPRvM5XaTuHlG15qGD6j6UwFPCveMTF387eUc2?=
 =?us-ascii?Q?RURJjQBOPSjZjfabIn/FIvHPPI+3iwhdpMNKzcFdJsYNTZUdJ1Ta7ZjYIaBy?=
 =?us-ascii?Q?q52zh6NRWfIaUWTUEod8ZLB2b9V3FyMWJJ0idxeQdgLPSFSM5rZIDdpi5J9T?=
 =?us-ascii?Q?rA9L/TsX0jpsnRvvDl4w3AIcVp6N2Z9inSe/jn739FOcZyQs/tQkfkZiOIfj?=
 =?us-ascii?Q?W3yu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 01:19:11.1423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c97688c8-4a1f-4714-d2b2-08d8b7613bab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFdbuGVnWbZ54EpVvoij9TzhWI63kA2vGyQ6PoNPL7Ln5CBQGrcR/679VUqviPTv1T03tkIBwWB97+2Cm2n/qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0031
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
Cc: "Su, Jinzhou \(Joe\)" <Jinzhou.Su@amd.com>, "Du,
 Xiaojian" <Xiaojian.Du@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Hou,
 Xiaomeng \(Matthew\)" <Xiaomeng.Hou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 03:57:22AM +0800, Souptick Joarder wrote:
> kernel test robot throws below warnings ->
> 
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> warning: no previous prototype for 'vangogh_clk_dpm_is_enabled'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> warning: no previous prototype for function 'vangogh_clk_dpm_is_enabled'
> [-Wmissing-prototypes]
> 
> Mark vangogh_clk_dpm_is_enabled() as static.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 75ddcad..3ffe56e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -610,7 +610,7 @@ static int vangogh_get_profiling_clk_mask(struct smu_context *smu,
>  	return 0;
>  }
>  
> -bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
> +static bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
>  				enum smu_clk_type clk_type)

Ah, I have another patch which will use this function in another file.

Thanks,
Ray

>  {
>  	enum smu_feature_mask feature_id = 0;
> -- 
> 1.9.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
