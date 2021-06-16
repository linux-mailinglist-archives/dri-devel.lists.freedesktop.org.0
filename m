Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168D3A9631
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 11:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9402A6E546;
	Wed, 16 Jun 2021 09:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7645D6E546
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 09:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgn71rbRDjeaf+GpBhsgl2j+uopP4ntKxkgOIz1/9NdU8W1WOMXhE0qa6ue+wFHHynL4NSyxFFM3iTqA4RBjbued8Gb+Cp8pPiQlfXCM5dYSH1vQUs9KgTlePbzlXzhwI3qOxMqMDOy0mTS+lsImAdCQYyIzLQPu0fef7P00SGALKrK7N1kJsiFrASD68WZEJUSS6ShNeDvQTBty3RBGl5uB/UMFw3+RIfsp9Qw1yWZT3eNczDxbKnjf7bt5hhxM7VWKoNlh6yOuzhMbOEbSqsdSbFWrqhS09lQt3Uj6m3q6oi/b5RLqTAmSvr8D58zgQfseZO92DRR3P83m0PfiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBjJBJypb3P96mURgCe/Fs2u+W8ERFdAgR+DUmsMWsQ=;
 b=LQL3LC0u9fFElnFa/O3ug5eixB7vKdQqIq+zXPQ9KGjR/wm49V/5Vvt9sjrBdTq5M5Ee+fLiT+2gNu5qQHjFS1Wixpt5WUp2I0x38k+GGM0Xz+VIRIxoXbLaL55frIatJbV2K7Fw89E0ysZPMMYlINFcyp2wlzdps80fMSKEE0IjFUMV5/yxZTB7t8M4t2CKTLMSWMC8P4U6nyWc5ccPR/i4sMG5ErUt3SMP76yqRnszceKEIVkchkUmGBzQUQRXwA5DFvsFnUw6XL8mOo1aKpgKVzNzaR/H1N1WbZn2RtjQ5DsJZPEYBgPqUTyQKvm0FcdmnFcLc4YiSPSqA7qKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.ie smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBjJBJypb3P96mURgCe/Fs2u+W8ERFdAgR+DUmsMWsQ=;
 b=ZNdv5ywjovs6LfmvXqzJHEgGR3wP2Rf283qV83T7YXgI1F4AClsxsFRm7Yif+uEmZjEDN8WLck2otIf85+7DwRDVuim2S6xRZ+RX7ZMG+dkpxmLRUjCI416jBtc4e69QPAAJCel+ekwPirre0qV+/DDx37PDy+NEBmwH+JjgIu+0xULcsKpEX7Q6jwTiglw5HH9zQUHFbmqIyu0z9MCbSgAoY5EQgOFrk6+kTSst4JwfJr9/rkxi3PMPTlmZqesxwSVbc4C7rvL78TjfbnCTj1nM5qbucldjnWjpTf/GmnnmJwNT5A16YFWZor91FGjSxQWN+iXZYW9LSClac4ubSQ==
Received: from BN9PR03CA0623.namprd03.prod.outlook.com (2603:10b6:408:106::28)
 by DM6PR12MB2858.namprd12.prod.outlook.com (2603:10b6:5:182::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Wed, 16 Jun
 2021 09:31:36 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::15) by BN9PR03CA0623.outlook.office365.com
 (2603:10b6:408:106::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Wed, 16 Jun 2021 09:31:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 09:31:36 +0000
Received: from [10.26.49.10] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 09:31:34 +0000
Subject: Re: [PATCH v7 13/15] drm/tegra: Implement job submission part of new
 UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, <thierry.reding@gmail.com>,
 <digetx@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-14-mperttunen@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <72a1a9b5-475c-fd70-d46f-0762df71fa58@nvidia.com>
Date: Wed, 16 Jun 2021 10:31:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-14-mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a37b88a5-05c0-4f40-9fcb-08d930a98964
X-MS-TrafficTypeDiagnostic: DM6PR12MB2858:
X-Microsoft-Antispam-PRVS: <DM6PR12MB285812D80895ABB2A84A9148D90F9@DM6PR12MB2858.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p5Xbv8rJozKf5YiYXmDxx+P4fMPh5wgQia6xmjmpPyLLWYxrG3kWZEJk6z6I9LtIv2OHIsX0zCLvYq21A377G7INiKXfAaXYe1rwXOodgTPwUKjEeMp+8pOgMxnU/exa1eV/7tUNBR1sTvOknSWi5xsxRe8SSIaSp2FgFn8HL7lti7b92D+vS6B+U5Gdftd6TJH/eznhO/Ae2/zk71YNBta9T/fj9TKwvOHIgwXVuMm9Dm5POxHifXv/HkvQbDQcVhOdldt473g7snfhMQU65APzo6ZCjFsY7zTqRSVOPkBFEysXpxUINUcb8ujFVIoETHVzVgWI1Iqf8kAKLOAwge8EVkxCxwaNyQmCp+z6jx9le4hyN1oIrc5fRk3T2QfGhO5OFq9LnJEwDKDTfBoa2wpA3xxfiymqdN6Fcvqo7UACdVQKgDweCDjEpPglL7IYPBVNWtBpCx+ulXhEeR/tmOgWeg+z1tfKCvlxoKSTkwlJBzCrzZhIIonvMLcspL5dW9CWDDMS3DFkMUjQeTgIvtDJTENqx+UYaTJOK8TnFhb5zsJ43BUuqWj00Ox9tqvaiecw36gXmJt19BU3v30ooOdtQAR+CEwLqgaWYm9PA3LShNsRYUxqPenIPAnsmV1MRYHhX+qcJ+0MZCdvFj+78Rd+Sbsw0bBWnaJaGetFNgYgeQYf73W814f0BC255HXA
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(16526019)(478600001)(53546011)(31686004)(82740400003)(26005)(356005)(86362001)(16576012)(110136005)(82310400003)(6666004)(54906003)(8676002)(2906002)(31696002)(7636003)(83380400001)(2616005)(5660300002)(186003)(8936002)(316002)(47076005)(36906005)(36860700001)(36756003)(4326008)(336012)(426003)(70586007)(70206006)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 09:31:36.0556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a37b88a5-05c0-4f40-9fcb-08d930a98964
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2858
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mikko,

On 10/06/2021 12:04, Mikko Perttunen wrote:
> Implement the job submission IOCTL with a minimum feature set.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v7:
> * Allocate gather BO with DMA API to get page-aligned
>   memory
> * Add error prints to a few places where they were missing
> v6:
> * Remove sgt bypass path in gather_bo - this would cause
>   cache maintenance to be skipped and is unnecessary in
>   general.
> * Changes related to moving to using syncpoint IDs
> * Add syncobj related code
> * Print warning on submit failure describing the issue
> * Use ARCH_DMA_ADDR_T_64BIT to check if that is indeed
>   the case
> * Add support for relative syncpoint wait
> * Use pm_runtime_resume_and_get
> * Only try to resume engines that support runtime PM
> * Removed uapi subdirectory
> * Don't use "copy_err" variables for copy_from_user
>   return value
> * Fix setting of blocklinear flag
> v5:
> * Add 16K size limit to copies from userspace.
> * Guard RELOC_BLOCKLINEAR flag handling to only exist in ARM64
>   to prevent oversized shift on 32-bit platforms.
> v4:
> * Remove all features that are not strictly necessary.
> * Split into two patches.
> v3:
> * Remove WRITE_RELOC. Relocations are now patched implicitly
>   when patching is needed.
> * Directly call PM runtime APIs on devices instead of using
>   power_on/power_off callbacks.
> * Remove incorrect mutex unlock in tegra_drm_ioctl_channel_open
> * Use XA_FLAGS_ALLOC1 instead of XA_FLAGS_ALLOC
> * Accommodate for removal of timeout field and inlining of
>   syncpt_incrs array.
> * Copy entire user arrays at a time instead of going through
>   elements one-by-one.
> * Implement waiting of DMA reservations.
> * Split out gather_bo implementation into a separate file.
> * Fix length parameter passed to sg_init_one in gather_bo
> * Cosmetic cleanup.
> ---
>  drivers/gpu/drm/tegra/Makefile    |   2 +
>  drivers/gpu/drm/tegra/drm.c       |   4 +-
>  drivers/gpu/drm/tegra/gather_bo.c |  82 +++++
>  drivers/gpu/drm/tegra/gather_bo.h |  24 ++
>  drivers/gpu/drm/tegra/submit.c    | 549 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/submit.h    |  17 +
>  6 files changed, 677 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tegra/gather_bo.c
>  create mode 100644 drivers/gpu/drm/tegra/gather_bo.h
>  create mode 100644 drivers/gpu/drm/tegra/submit.c
>  create mode 100644 drivers/gpu/drm/tegra/submit.h

...

> diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
> new file mode 100644
> index 000000000000..e3200c10ca9e
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/submit.c
> @@ -0,0 +1,549 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#include <linux/dma-fence-array.h>
> +#include <linux/file.h>
> +#include <linux/host1x.h>
> +#include <linux/iommu.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/nospec.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/sync_file.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_syncobj.h>
> +
> +#include "drm.h"
> +#include "gather_bo.h"
> +#include "gem.h"
> +#include "submit.h"
> +#include "uapi.h"
> +
> +#define SUBMIT_ERR(ctx, fmt, ...) \
> +	dev_err_ratelimited(ctx->client->base.dev, \
> +		"%s: job submission failed: " fmt "\n", \
> +		current->comm __VA_OPT__(,) __VA_ARGS__)


For older compilers that don't support __VA_OPT__ this generates a
compilation error ...

drivers/gpu/drm/tegra/submit.c: In function ‘submit_copy_gather_data’:
drivers/gpu/drm/tegra/submit.c:27:17: error: expected ‘)’ before
‘__VA_OPT__’
   current->comm __VA_OPT__(,) __VA_ARGS__)
                 ^
I think that we may just have to use ##__VA_ARGS__ here.

Cheers
Jon

-- 
nvpublic
