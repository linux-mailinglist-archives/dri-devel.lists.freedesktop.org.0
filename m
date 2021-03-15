Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E47E33AA1E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 04:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7089A89CD9;
	Mon, 15 Mar 2021 03:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403F989CD9;
 Mon, 15 Mar 2021 03:48:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YENhy1SW80Z30ocnrMn/YyRncdqz0PfYEmFWmkqChyZ9GMf4AoyUuFHVl0taXPbv8c9XOO20URRz9SZjz9V0x4iMvjPjK+KCp5y5rlReT9/sr49SQDLX6Squ9waMAV0PYy4yzbM88/VpidqZhEqT1O+zvs6CIGJiV0a+WyWgwWd6mOl1EfikEN3OXPMymsq709AphAJFugjfoGd+YW/Y1wJM2W7mmrPZEXgL9joUrNLVn/zgqqn+yuTy9+T2U8rBy4fjEfijCO/aym4bVBoVp+FOg4ZiSg9Oqo4gtvVBlXAvwE5UTIMjGkrLxyZrtvnOpgusfaVL/N3MCKJNEW5iVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swfBpqeWo+9eGxOv0CqVyftXNHpS81UDjIg91XQ6Wkk=;
 b=F+qg0Rs9Fdk9rlmN2iqRsqfs7+FxTg4Buka1V4FUs12PBfBeqKkOfbt1N9jA2j8W70ueih4ru2YvaKgdCX+Cn3zMJKKqlyGdXbePfuzRczmXIoEn21ZUGtlkat5qyz/gg4olCLpDFvZZSGXxheDeJkLZ/YsTq1YAH9QrYByJ2DdMuz/CapebT7oplc7oqzjnCW/ACKMXrHd3Dfu8gk1LBB6TFkhXlxCGDyjgmDlNv8xb2HGRPp6cCz6G0m8hz/C9dyByIxoa9I8d+F1rgMM0ds/CQ9CpsVgZNlJGe8FjAnA59RV6J/Y78ssF1w3o4ko7I5cYG6aIKvwZVcHz7HgzwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swfBpqeWo+9eGxOv0CqVyftXNHpS81UDjIg91XQ6Wkk=;
 b=HIxOZJucRqT1liDU4NGmQCTbZYn3LWHRXU3AjPf6/SxK6rGKYDD4/phdayvirUp0d2Yf17DCgx4O+IxgKrynlroQRm9+AmLntrQI+wjiGRaSKis6fk4zAe4GCqSBp2M0S9F9i5+UFNxnzcNzDTQGWu8M7MLu07f5kfaopqV6DjU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR1201MB2543.namprd12.prod.outlook.com (2603:10b6:300:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 03:48:52 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28%5]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 03:48:52 +0000
Date: Mon, 15 Mar 2021 11:48:43 +0800
From: Huang Rui <ray.huang@amd.com>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH V2] drm: amd: pm: Mundane typo fixes in the file
 amdgpu_pm.c
Message-ID: <20210315034843.GA2055580@hr-amd>
References: <20210315032136.3669883-1-unixbhaskar@gmail.com>
Content-Disposition: inline
In-Reply-To: <20210315032136.3669883-1-unixbhaskar@gmail.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:202:16::15) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR02CA0131.apcprd02.prod.outlook.com (2603:1096:202:16::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 03:48:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef069ed1-a44d-40fb-f5b3-08d8e7653fd8
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2543C2A948E31602785641BAEC6C9@MWHPR1201MB2543.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:230;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: do2zD/NEfdTdKNfRJ5ipq8sswTWSQkJTsbxp1Y0Azf2hAauXdqCiez/BVcRbkf4zWYDnTMBM5fWZyC8JJUnf9s2+WxG+ksPfSRzAgYpAtTgVAFQJOdVm4LIZu6YlIwXBLnXG5npDmf+NikMHiJG8sd982wbeQ7PUZjWA/BNlduE2tf4eZG6OhSBlU6kF/qXvwKYle6STRmK8ilhXIVWSIwid7vDa0sQ8bLlj8jn9bfHJxsszLcKK6+FZ5GFgV0eX+fiQCW8gRo4FPRysHPk1/Ug8QhWB7JY0tjVsUyZql55ZH2tllI4Fmc/foGUAMT9AU38+HyzmS8hBEUIaeQeyzgFzUGzRVWYBX017l6B+85/idDAe6+Uj+hzQQx7MFo/yRzIVu5p10eZhXjw4XyFJSMiqk5ZyzdtclxYHRr2nNkoMc4W0z1EIvph988XzsgBN/KEJRx4gOw/IY5khmFaCEJLTrBvhR9x9sjB7JRRy/wQVgynfkSBQIQ79YKz9wKG/rjkG0bgACRcqmfQwF8Ycem+QBYkDERjBW1Vv6KwdapmyJl3BVk2eZnEPjMVlNwitjLbfYa6FpMyRXPlMb2F4/QZU6Bbf0UeRYU6bk3jRZWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(66476007)(5660300002)(66556008)(66946007)(1076003)(956004)(83380400001)(26005)(86362001)(966005)(6916009)(6496006)(55016002)(52116002)(6666004)(8676002)(478600001)(316002)(16526019)(186003)(33656002)(8936002)(4326008)(9686003)(45080400002)(54906003)(33716001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IbEdv7+d24Dhdl5UOHyIihxQC3pSGIzBFM8uDchq5D63db9oOysD3cpNL2Yw?=
 =?us-ascii?Q?Eb/OLlxGPEhFIl1YnxChfz3OvTk3BExX/SV1GaqKfcW81mSRDX/NmXn23iw5?=
 =?us-ascii?Q?Z5UC7/nd2P1qdIYtBnwL5CfDjxFkhcYxWPeblxVihihn8bFTaqp4r701p0rI?=
 =?us-ascii?Q?P/0LrF1ahGoOME9lCj0q6/Hj2QiB0/wh2nLG7spXxFshLKj2ZC1wFPoZZNaF?=
 =?us-ascii?Q?pCRNxLhVsd0V8ILaUs3gL3VFfqJB7HckxjJGx/CLlcYGSTqatCm5O/UCaLP3?=
 =?us-ascii?Q?eLTo0/S0hmdpZL5OxmK8K6xkwFqXW0j0EQMRfmw4T1iVL9F4a17CvKY1Fflf?=
 =?us-ascii?Q?GavjUyEIxzGw/MLkWohnZnfY17DnZTbbD6MdXDf00odP7qP7IOJ8rqg33h3P?=
 =?us-ascii?Q?VAg2g151YiFlKl7S5ppNg54c65AvmmbexYoVYC+AU/ght5XBrLzjzZaFZh/M?=
 =?us-ascii?Q?t481i/xLve8PFbQ9FUnvYGAyLnTdXCZ/oC+1AY/azVJ5OSSOiR++IrglMKE/?=
 =?us-ascii?Q?Ge1HHoa672yageNlBJn3w5TCJ3wlSbLiGDPS7gAIslz7G/4ooahhzmEgdFBY?=
 =?us-ascii?Q?x1To+y4oEec4w5qjPsHhOTdzNmceLy7jyuP4W3mfQiEQLgx1EW3OPrZq578j?=
 =?us-ascii?Q?tKJ8FlQdUxkreCafHrkEgimbN5zImK2S6qJoTW4qf87N9za91oopbZN6w5L1?=
 =?us-ascii?Q?YEu1yMM/vZY7RUn5wTg4hPpNojMBGpiTnWzcu4lLmEm0+L3JVTvrZkB0tVe2?=
 =?us-ascii?Q?MRBSU+OfRBCRkXDmkhCK7pZO7bWhRtCDXm887BgIPui2y63HhiUuXKfpo205?=
 =?us-ascii?Q?88AGfNWNFy/AZOTT4zPzuv6Ltrw5ibHbczlcSuguLYxuTBRzacK6C5qeZRF1?=
 =?us-ascii?Q?NCnUIjVcQnVh/t54PQlo+fJR+n/rv5Uy0rRA52JkzNxC7QTjgUw4/65eJ0id?=
 =?us-ascii?Q?ND/+dbsHNaczJ/b85d4t3ya7AKLW114kzbbAgHly84X62tk4Uui1RmXpC1M+?=
 =?us-ascii?Q?FwUu9IGmEvrlyDFcEtQP585b//Jh4uf1OQ2pVbsO2zWHTr8LZHzQfaaneyEi?=
 =?us-ascii?Q?an8wzgczpTXyPaQpKhllYXxtyVBKy0ibZVCP5PIQKRG/vBcc7Pu0Qhp8f7iP?=
 =?us-ascii?Q?UhKOxpNFWUv2ABgMwQhG/O/YQmq8TF9Cwrox2yAjjEgd+nHZme2kLVxcT9XD?=
 =?us-ascii?Q?g9ogqyTZ3UXexQanSTSPJBtGBqIBpwI8Z4UApen9am0sLVEvCVkzkP+qxbLz?=
 =?us-ascii?Q?uTb8FmcB4wEencwO2oiRizcnh70Zf05HxGdfe4uDmacQ+F3e7ripciZVG3QO?=
 =?us-ascii?Q?p0b8IJPkcNuhp4J9LmH3Rgbf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef069ed1-a44d-40fb-f5b3-08d8e7653fd8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 03:48:52.4560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9nHlgmC9OrLZeT04o/nrFa3toqHec5zNskylDNTQjI/TEBvA7N+MlCgTIDesD+a7n1rFga35Zob+V1lgl3JEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2543
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>, "Du,
 Xiaojian" <Xiaojian.Du@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Das,
 Nirmoy" <Nirmoy.Das@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 15, 2021 at 11:21:36AM +0800, Bhaskar Chowdhury wrote:
> 
> s/"an minimum"/"a minimum"/
> s/"an maxmum"/"a maximum"/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  Changes from V1:
>   Randy's suggestion to adjust the subject line text
>   And missed out a spell too,which now included
> 
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index 5fa65f191a37..308249ae1a22 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -3315,9 +3315,9 @@ static ssize_t amdgpu_hwmon_show_mclk_label(struct device *dev,
>   *
>   * - pwm1_max: pulse width modulation fan control maximum level (255)
>   *
> - * - fan1_min: an minimum value Unit: revolution/min (RPM)
> + * - fan1_min: a minimum value Unit: revolution/min (RPM)
>   *
> - * - fan1_max: an maxmum value Unit: revolution/max (RPM)
> + * - fan1_max: a maximum value Unit: revolution/max (RPM)
>   *
>   * - fan1_input: fan speed in RPM
>   *
> --
> 2.30.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7Cray.huang%40amd.com%7C7815a224727f4c9b556008d8e76182b4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637513753293707291%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ApeKXDkijsihPcGSoI9v8ypRcsUXSb2Y7%2FpKsm3c4Xo%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
