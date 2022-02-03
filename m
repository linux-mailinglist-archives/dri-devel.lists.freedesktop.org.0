Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8C04A8670
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 15:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D5810F05C;
	Thu,  3 Feb 2022 14:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B74B10F05C;
 Thu,  3 Feb 2022 14:34:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFx0qGw0v1tmQX0oaVc9fQD+l0WeakroH1+3yhZ3RhANhjlMgGpKB+pjajfUH43PfLA3xxVUUMkPtCdMICJ4DCfW11BkuHwItB8sjpAzkHgdziFXSp9M3bT03EVIhjKuhaGo1GgM0Kcae7zbpHZiL49QokhYqKeFG/sviI+W0toCepeXkQCHdRyK/tQZNy+JKIm5aJ/LjR2moEFKTlDodD4jOtsOZbReQbZA+kR7hmiRSWc50cdylmTc6BzsN36eNxe6g4vaZjodDHJMmh0PWM+spljhYRj17/5otvCrclUohPdxiYlguo6tRVq4bIX2I0vPsiG2TZFMdFdYh+1pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vG1zQ6rQLiIJCtN/2VUYWyRq5GOWlRAryXXoxSIZBfM=;
 b=IY51eKpUDGP4ZOu7V/Wc0RCjnnGatIjxQ7+tZxnXycakRKv6Yqf0gQJB+7gU9wRs0WLNW4v8Op1v7JpZzIzRixf+0zszaMA5hpyP6MQfQUs3xHyrJTakdHa9+/XeZSZGBPpO0HvnEBmOnG3iPUzRsBsGpF2AMhhBpe8lWkPwVR1gXf7sDu/6p13Anr2R5tX3HvrzkdFM0n7nw1OrKyToJldmHfbRgOXO9RTq+MamLw1QjSpOYhgpO8f/dDzkoJAESxDHRrssp+Qbs/J836g7Zlw9zdnAPM/6yXTSX9idOZRC8LlULQFO+oIJIRUERytdFU4AJNH2/2Ue7vYqedIygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vG1zQ6rQLiIJCtN/2VUYWyRq5GOWlRAryXXoxSIZBfM=;
 b=vZkjrm5T6BT5VqwDHMipy+/oKAOs24179Rud3IPX/ATHzSK2SGZ8RkiMJw3l2tfHQgvexYWQBuDSndm4WOjTGTxlZo/gQBkFh1vqPqROYdn80PFI6wGDo9DO8BTE1vUaIQv1sL4hCkFgW5PZZcEkL3TUH74hbbxHA7iBDu6FRwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR1201MB0233.namprd12.prod.outlook.com (2603:10b6:4:55::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 14:33:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 14:33:56 +0000
Message-ID: <eb2dc20e-0229-64a9-0b73-79e64fe041b2@amd.com>
Date: Thu, 3 Feb 2022 15:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/7] drm/selftests: Move i915 buddy selftests into drm
Content-Language: en-US
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::49) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 016b0f77-b352-4ac7-357b-08d9e722358f
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0233:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0233726A27CB5B7FF64BAB4183289@DM5PR1201MB0233.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/vfeVuMY4EeMJXx+cA2xTJ2eNFgr30ksG8YH93stTdR/UmkdgifLdlJPUuSnBSHRMhJPsPLAPtIYVyA2c6cyRAwrl8AaV2U3r5ACA/rjxm9SNy6a7OAxrR5GQ63Kia0/kqQZxc+A1glrK+38QWCLO034AiVdsI0m+Y1wt+SWF11eQtBu3HA1SS6hH9zHEKZjLWSXb9zyTrkejOeTp0i26FLMKXBhtValvkoA5yGcmT4N/KCvH9lJ4DvdbBOyWb1QrP3RZ4+H+brDhPGs1NehvSxsigLGVOmAaNV2tkbkVFoGuRy0eMuHjFzMFjc1ScmD19Egz6hmtY7wiV54JG2FDPgtRSR9I2cUs2Iy+eV8T1ZDDDJRppm8E2wmlXqjFIWLLasLcunSQY2SCgCMVcSGnBFZUh2kJZNRRW8FrFdJIovgxmYahKP3MP69ZqBUqYsl8uL7dZWN2TxiSXAEMrDkq66azbpf9DzYZ2Yb9GPXLho6MBySGHmobf/zoqtzonfy9/uFtvk1z9sQGOmMQpIXyZXpkIcguANvozCzU4RIKGHwVqpRQFxq8W4UER9qXiYtbDXzKIYz2OapHlL/1J/igSB/p3vUStY3k+N22fwvqP3whm7Na611P2inno64oCXs/XY8FOrs62y43M62VBoHPD7yL1vpDJiZXALVOtPuvyAlWmy8hUHnMHlwc0NGUsEQUjM+c9/a4c1/6egBfu00VppEBlm1qTpiZ9U8Bs3gsU0fEsl/YUgI9YB8/4zjTtL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(31686004)(2906002)(36756003)(5660300002)(66574015)(83380400001)(4326008)(2616005)(508600001)(6512007)(186003)(26005)(6486002)(8676002)(6506007)(6666004)(316002)(86362001)(66476007)(31696002)(66946007)(66556008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjJ4ZWNnNFhqalJFK2hrSDgvRjlPVVlJSWI2VFg1Skhzb1dHMTltSTFTMDRI?=
 =?utf-8?B?U0UyZkp6bm9Ka2MwcmF5eWkzcEdUUGlEZXBramRoL1FEZGNIY2xxN29BcWFw?=
 =?utf-8?B?R29BZ284cm5BTGtodU9YaUxPU2FCcUU1RFljbmtXcHV3WGEvL0hIamgwQWsy?=
 =?utf-8?B?aDB3eE8vVUhMcUgrRHFTalZwT1B1T2kxcW1zWTNuY1NQWk5YalV5NllNVkdq?=
 =?utf-8?B?eEdUSFZ0RTBmTWo5Ri9GU3lLNFl0aFdLNFI2cHBmU05hMTJiVjJ4WFAzeDZi?=
 =?utf-8?B?M0Q4c0xkRm92VHRHUlFPWnJMSlRaY2xvR2MyNnhJYklBMVV1QnBJcFB4NHhj?=
 =?utf-8?B?MC9ZRHZWbkpQMzQ2UFhsNFE1akxVaytneDFqanVINC9TZWV4QXk5aklxbG9M?=
 =?utf-8?B?ZjUxSGxGanlOdURPVEVjTCtRMFdvelpSc3dudHA3djRRN0R1b1JqelhDQSs0?=
 =?utf-8?B?Nk9STTVoT1g4ajZmTXQyS0JsRGgxNFNJN2NndHNSV3FQSFRwc2VSUWhIaWJ4?=
 =?utf-8?B?VDYxNXhxWTlxZ0V3V1E1QTNqb3p2bWZsVC9seVFwV3E3NnJjWWdWQldpdC9W?=
 =?utf-8?B?QldDQkpCdC9Bb0JjVXkrczZYSDlNZG1SeHZRb1ZCNmpEdnVTOVdxdHlLZmts?=
 =?utf-8?B?c1JoVUxLNVpnSzRzTHp5YmJpMFVxaSs1SGpIa2UvOTl5QTdSMjdDWXA1Zk80?=
 =?utf-8?B?MU9XMzlqMGxpUlcwUXYvVW91L3FnWkxtVmJ2R3N4aEVwSUhKL2YvcTJMajlP?=
 =?utf-8?B?SEJVbEEwQVNzMk9TdHRTWDVFdmhoc0sxaEpnUms2a0RqaDVWbVgyTXFXK2Ru?=
 =?utf-8?B?eTBGTTBUMmxrWCtIYVVYaDlDL2g2Y200T0J2cU0zckJPSlUrZVg2UityVks5?=
 =?utf-8?B?TnJoVkc3UmM2OGlESDRYbFJuUHR4ZVdNOVVHOHU5N0liMlAzSGN4R3pIaThy?=
 =?utf-8?B?cGRVdHAydHErNktZUU5BYjhobTcrZXZFaTJxMmFyT3VRekUrYm5PekViUm02?=
 =?utf-8?B?MXUrK0dabmhVZGZ0OFovYThsR05PaFdQS0hVaU5yQTNJOWRWWWdpbkYyZmJV?=
 =?utf-8?B?bWp0VTdKOEhlcTlROEpBRWlwVUllWDNVaGsrNkxsTmVPNXlSaCsyWHNhTEU3?=
 =?utf-8?B?YXkrOVVOK3ZoUy9qUGhlTWtyU25MQkJVZE5CNVJvbytGektQeHRaWXYxZFBS?=
 =?utf-8?B?WnlDV0EzMm1iUTVJdUtKamNiUmN4MFhSR3ZwajFCbnM5NmxrNzFvVmhaR0U2?=
 =?utf-8?B?cGtnaXBBbFpMQWhhaEdDVDBmVGdQTm8xTmJYc1ZubmlscENPR09hNTluV3ZJ?=
 =?utf-8?B?YW5VRGVMallpRWlLWUpLbWZsUzFTL3NPMXZlbWVxeWZQYVRwRjNQbmxSRW1l?=
 =?utf-8?B?V2pUQWlRejJwRTBlNTNDK1YyWktTckoveDJiSmFGS2g1YWlFV3NVNFczbXRo?=
 =?utf-8?B?UWJLRENGV0tJOGhsSFNNRm9tcWV4OGpTeThiRDV1VzBTcnNaWkxYTms3WXpv?=
 =?utf-8?B?cWcrOFYzYTd2T2FvZUprM1UxQ2VvQ0QzZDc0b1Y1ck5tUWVEaFh4cnJ6ZjZR?=
 =?utf-8?B?em9ldzhGRU92VWZNS25Zai9BMjdLc3pvVFkzS29SSzY0RVdyS2ZvNVByeTBW?=
 =?utf-8?B?VHM1bEhOOTZkckRkVEFjRXhNcmQrTkJ5TEJmSnlJM3ZtUTBhZ2pid1JOWVpJ?=
 =?utf-8?B?QzZaUTNIRFFPZ01UT2d1eVhqYVBYbGJHc0szT3l6VXZhZmhuZ1ZQM1BDeExa?=
 =?utf-8?B?TnpxQ0hyVmdoNkMrZTNnZWZZSHkvYmZETzROc0ZucGJ5b0dHSEJOQjVTMTRO?=
 =?utf-8?B?VzQ2VFAyZHQ2YWNsQWhWL3NiWkZkOUhMNkdOOVN6WXVjbDUvNmVuUEtkdGs1?=
 =?utf-8?B?RXpqRloxTVJXRGRDT2NVQ0ZtRUc4aUVRVE9kck01RFkrSDFJUDhWeTFTaG44?=
 =?utf-8?B?c1F3SDA1ZFRjeW1PYXRsYlUwaTVpOFNzMWE3Z3U3VFNVMU1aUzFnRU1FZ0Vi?=
 =?utf-8?B?eDJzYlZqS1JPWTIvdUk2Y0x1b0dnZmk1aUN4NTJKUmMrakppamk4Z2liN3Iz?=
 =?utf-8?B?TFFneTdJNzBTM21pK2tzZDA2azlmNXNGbWpiTmd1MDhpRVZ3d2lOZzFJNTZx?=
 =?utf-8?Q?jjzo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016b0f77-b352-4ac7-357b-08d9e722358f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 14:33:56.6086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WXiZeX4bL53m234kYAzIk5rnm13XUpKwhjH0YjQdq8CqYkTsBCCU2LJw2MgGJ8v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0233
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.02.22 um 14:32 schrieb Arunpravin:
> - move i915 buddy selftests into drm selftests folder
> - add Makefile and Kconfig support
> - add sanitycheck testcase
>
> Prerequisites
> - These series of selftests patches are created on top of
>    drm buddy series
> - Enable kselftests for DRM as a module in .config
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

Only skimmed over this, but of hand I haven't seen anything obviously bad.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to the series.

Regards,
Christian.

> ---
>   drivers/gpu/drm/Kconfig                       |  1 +
>   drivers/gpu/drm/selftests/Makefile            |  3 +-
>   .../gpu/drm/selftests/drm_buddy_selftests.h   |  9 ++++
>   drivers/gpu/drm/selftests/test-drm_buddy.c    | 49 +++++++++++++++++++
>   4 files changed, 61 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
>   create mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index eb5a57ae3c5c..ff856df3f97f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -71,6 +71,7 @@ config DRM_DEBUG_SELFTEST
>   	select DRM_DP_HELPER
>   	select DRM_LIB_RANDOM
>   	select DRM_KMS_HELPER
> +	select DRM_BUDDY
>   	select DRM_EXPORT_FOR_TESTS if m
>   	default n
>   	help
> diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
> index 0856e4b12f70..5ba5f9138c95 100644
> --- a/drivers/gpu/drm/selftests/Makefile
> +++ b/drivers/gpu/drm/selftests/Makefile
> @@ -4,4 +4,5 @@ test-drm_modeset-y := test-drm_modeset_common.o test-drm_plane_helper.o \
>   		      test-drm_damage_helper.o test-drm_dp_mst_helper.o \
>   		      test-drm_rect.o
>   
> -obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o
> +obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o \
> +				    test-drm_buddy.o
> diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> new file mode 100644
> index 000000000000..a4bcf3a6dfe3
> --- /dev/null
> +++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* List each unit test as selftest(name, function)
> + *
> + * The name is used as both an enum and expanded as igt__name to create
> + * a module parameter. It must be unique and legal for a C identifier.
> + *
> + * Tests are executed in order by igt/drm_buddy
> + */
> +selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
> new file mode 100644
> index 000000000000..51e4d393d22c
> --- /dev/null
> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2019 Intel Corporation
> + */
> +
> +#define pr_fmt(fmt) "drm_buddy: " fmt
> +
> +#include <linux/module.h>
> +
> +#include <drm/drm_buddy.h>
> +
> +#include "../lib/drm_random.h"
> +
> +#define TESTS "drm_buddy_selftests.h"
> +#include "drm_selftest.h"
> +
> +static unsigned int random_seed;
> +
> +static int igt_sanitycheck(void *ignored)
> +{
> +	pr_info("%s - ok!\n", __func__);
> +	return 0;
> +}
> +
> +#include "drm_selftest.c"
> +
> +static int __init test_drm_buddy_init(void)
> +{
> +	int err;
> +
> +	while (!random_seed)
> +		random_seed = get_random_int();
> +
> +	pr_info("Testing DRM buddy manager (struct drm_buddy), with random_seed=0x%x\n",
> +		random_seed);
> +	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
> +
> +	return err > 0 ? 0 : err;
> +}
> +
> +static void __exit test_drm_buddy_exit(void)
> +{
> +}
> +
> +module_init(test_drm_buddy_init);
> +module_exit(test_drm_buddy_exit);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");

