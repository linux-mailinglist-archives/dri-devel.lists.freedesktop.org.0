Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961B4C0131
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 19:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F65210E2B3;
	Tue, 22 Feb 2022 18:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCF010E276;
 Tue, 22 Feb 2022 18:24:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eG4o/iENPmvyqllwYorbAi9Fxwyqk2uDcbwrlNqB++8Iq9gn43M0kACRnZnMnLUGXPGjmeN8iuy1qzNk2dHicSKiBem0UY3hME8M06LVOnBm38six4r5aIpu359yUMOznWgtaYi/K41dhdNGV8CAR9Als7s6uXXv+vCjSxbaLS6KMwBOWrYBnRKg9Wew5D7NUBg9sVMbgVlfEu/wnfa3xiaB0L3r1GiLL6Lz41n94vXEVl3HwY6wcJHBMo/TrvyFodDpuCQtwrOomazQ/FZrKm8cv0JJ+TPVkNavxbqp2GW3BrhpStQ+UI13zfMOY9vTTyiFdB4KL1EsfcZA2kjscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEddhGainsB5a2YiQrT1hqGx0vof5NV0+8O4E3GFFzo=;
 b=kq2YDYltO/CMFhz/ex88m8bIsEevccMHB6FkgPzahtkL3SQQSFQex/U5om8z4+AzWc3evtysL61vPGniGyEQXKfdVnTwTVjY+P5aI2FXcOOfGJpMIDtapb387Q19NMZ4iAGyibwgUemkwjjzHjGmwVrEKgbgaMwyZKVkThgdxp74zcIEXRV+xa1BkN/Ew17lLlU0BLAHfOlCPttMHca36HB1a+IIl0lC6/E+S2vUiWUm28HE2McHk7JXoSMoozZCQa08Jiqa7AcdwfuQ6PzMmZfKaJ1myzW8RMIdMhKQKfJ6IzHeHV9CQY9PCMPHTwguGsUsWytSZX44fiLObG7eZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEddhGainsB5a2YiQrT1hqGx0vof5NV0+8O4E3GFFzo=;
 b=ctTTuHXq9YanodhaVIupWTLIJeMMHyeqIUfZGY/HQ5goATpQMszFnvh0VbruYw7ofAbmwHJ5axkG52ksdnZ/QJNRe2S39NYhwEaMQ/yrA+F3aStNhT499NGEY5HwulopRCh761n9Dk5SgUYJbr5g2bLk8kxilXlgsFydPqA/RhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 18:24:36 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::88a:bf7a:6898:5ba9]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::88a:bf7a:6898:5ba9%5]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 18:24:36 +0000
Message-ID: <995b793c-9ed8-85d7-faf8-d57348cafc99@amd.com>
Date: Wed, 23 Feb 2022 00:05:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/7] drm/selftests: Move i915 buddy selftests into drm
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
 <4af33e93-12c1-a6e8-4ae6-cc6122117373@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <4af33e93-12c1-a6e8-4ae6-cc6122117373@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::32) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db41a288-d828-44da-074b-08d9f63094b6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5780:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5780AF9B0D4AE9BDC023EC3FE43B9@BL1PR12MB5780.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /KACroc1Xd/1+KDIfohGJCs7L3vTQLTizIzxG2cgS17VCIc/p54YJ6Zr9cgWjDdzkuRcow0VNO+vRA2GuswmCbD8P7lhuo61awCDUPzC8Xc5n+6ukxbrA06QWAO9f1hSkT8wxTd0Qs6akOijU26CtScZjkXbe50FOM5DioKvJ5+gOfvtz9xKdWQj/3jeXqfSr9aAcKiYLDvH95KRQk8u6n5PeSwDOunV1if6JBsnTD09lCsPD8DtL6Azh2sqvVPWnFymhHoiBd2USFgQUL+12TUmT3gXXWFLzst+vQp4O4ws1fRVidxv0WPRK73FUL09iT2lSivb5vN56IH4+D2/aJ6JdCKw+bzcMyLpX0dtf+zz1YrEtTqY/Q91/kjnyyar1bzNKZLVDKibZ15sIIO2UWbCHRGz04VPLQiqAab4t86DUQ9O24U4NPHaMlfo/wXDiGrpmR/cFSuIKqyEjpNwnnGW/VblOXblnfSrQwofUIFbL9GticgMeKXm7x/LTlHjB9fIGZUwFvKTLLX3TrectakWZ+nWrvE6k+iMbJF43WdB0bSF4NWbrS3ixBjU57HffNo9/aMN7SDSf7AxaaiGsG4aJz7gp8HfzmjzuBKmvDShx7xSGOnObn8+C6IySqS2E9fAF8362vZAnqu8np5KwVpEeXMDKuhnVeI/37FrsYGxjLaro2b7uclXWB93qTYpMCVnul4q35vfBpYfj1YuRgALUWUxvsVwSymqY9h39lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(38100700002)(31696002)(86362001)(53546011)(66946007)(66556008)(6506007)(36756003)(26005)(186003)(508600001)(2616005)(6486002)(6512007)(6666004)(4326008)(66476007)(8676002)(5660300002)(316002)(8936002)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjNWeXQ0WHhhZTNZVHl3UDdVWC9oUFR0ZU5SRndoOUFHRjM2K3ZDRXNmbmNT?=
 =?utf-8?B?bEFVaHFwNVgvakpoZ2Z3am13dUErcUlLNmNSWFdhUVZHUnFxajZpL0U1dWxi?=
 =?utf-8?B?NmNPcmZxN0x1OFp6andyYmJxL0NYVXI3NXN2dXdLNlNVZ2dlNktueGMweU1q?=
 =?utf-8?B?VFZHMFJhMlgzRFVXaWhwS01mNUJ5WW9nOTFGd1ZiKzVReXVqeUlKSlp2ZUtL?=
 =?utf-8?B?U2tXRXJyQXh2N25MVHlxWC9aOUE4L21FRkYxaXgxOE9MWU9tandEQldyWC9h?=
 =?utf-8?B?RHRFYWo5dUh5VEhneTRYTTFWZ0k2bWpHbTQ1Ui9LNUY0aDIzV0VaRzVDMkZr?=
 =?utf-8?B?eEtQMVh6akU0aThzcS82cnpESm5vV1U4ZFBoNmdoem94T0xvN25Td0dVWkdX?=
 =?utf-8?B?dXJSd2g0ZXdWYVYxNld5citrTmk5TkNMTjFHb1ZBZjdqRjlwS2d3d3R3blow?=
 =?utf-8?B?TUZyYy9xNFZSaFNYVHNVdjBqVS9veVRJbVl0aUlHcVF5Qk45NEpSOFpIMkpX?=
 =?utf-8?B?bSttMkZPVGtUUUJvbnBVdkh4dW5DVC9aN09kamZTcGg5Ry9BaDZkVjdxSU5E?=
 =?utf-8?B?WHVFcVBOcTQrOWd2Y0pGODJSZFdLREVneS9Zbll6d25GTHdzblRabUxwV2xp?=
 =?utf-8?B?dzF3Y3hrVUtpMDVvd3c0VjFSWkUrckdFSWdLK09BOSt6czd4V3pGbXNobXNy?=
 =?utf-8?B?ZEl1d2FvTnJvL0N1SzdIQ2tjSTIrUkJrTm1HSVV2YkpIM3NGMEpNNFNtTCtR?=
 =?utf-8?B?QndQelNGZFRHbzZCZVRNK1QydlBXZWp6THZ4ZWhQVytGcmZZSldFbGVuQ3lK?=
 =?utf-8?B?MUY4VitRUnRvR2NRM0NjZWhLZFQvVHA2OE1PSzhNRDBXRFA2ellqTTZPaWdl?=
 =?utf-8?B?VjZDZUl0VEY3a0lyNVZYbVRZVjhUbjdPbHp2cG40OTN2OW92ZE16STJQOG45?=
 =?utf-8?B?SXpnWnpOVnBTdnZndnplaFZ1WXF3MG1yS3JRZjZoZDk0T3NxUWpFQlhUMU93?=
 =?utf-8?B?L1Z4ZStGUjZFY1lvNDZjK0dXWmRvcjdJb0hHYlRJSyt1U3Bhc05XR1o1SkFS?=
 =?utf-8?B?MUx0dGNJc3NlMytLV1hHdFpFdVVQcXZULzhDTzJMN1hFR1p0bU11N0g2Q1Nk?=
 =?utf-8?B?YnRpeW1lMHQwajQ2LzZMenBJK0pHUjh6Zzh5SU4yWWtzOEJBSkF0b20vekpk?=
 =?utf-8?B?ckZCZklCS3VHZjg3aDlwTitmRXRuWW5HdU15bko4YzNOdFpTMWdGMXlYSUN4?=
 =?utf-8?B?QXYzWkhJMVUrRjhlTVRXemJDU1FzNFlzV1NGc21RU3lPcjcrQk1XcW5IYlAy?=
 =?utf-8?B?R09DTDFNSFNqZUx2c205clI0a1lVY2NDWSt1aFZ0c01yZkVicnV6M3k4MWlh?=
 =?utf-8?B?OWg1YjBnemw3WTFwZitOcFFyM1RSVnJiUG9BMFF6UTVXVHNvOTgrNk8vdllw?=
 =?utf-8?B?QnJIRkE3UHM0QlpObkQzZTlsQ3BQZHh5dkFTaENRRzFQNnNVSWd1WGV1OHZp?=
 =?utf-8?B?QVJCR3o3RlFFUzZ2elNWcHBnOGZqS2kzL1dOQVUyd2REVlBxQ2pMWXpPenFB?=
 =?utf-8?B?ZGVNbnlaeHlSbGpqYi9RSUgxeDdjNERtQVFNRFFFTEhUek8wLy9UdXI3UVRJ?=
 =?utf-8?B?T1dQbklUNHFRRFIvcFlKR1lNd1VSU051YmVYVm1zdW5FVmZCb0x3bUxmRnpp?=
 =?utf-8?B?WVBTUTV1Mjd2WEdia3VVRFB1ZkhLQmhyVzg1L2E4YVdrVHIvQmpacnVBMUxJ?=
 =?utf-8?B?MTZpamNCdVIwTm5xRTFTS2JLVU8xU3RiTCtwd2NQL3FEdHBpUmVZOUJ4QzhB?=
 =?utf-8?B?Mjc2ZXFOejdlR0piMkZIQkhHYW1ndlRnTDdEd0ZHYnVyNTBjVUUySVJSYVlV?=
 =?utf-8?B?Sm11NXFhTUNrckhMOTJkTzJKU2k2STVMWUFaRGxNRSs3SnNUZHJCUWhBem9l?=
 =?utf-8?B?ZkdwdnU2bE0zUmlNaHFKUUZmTHBUSkRKeUVLZ2lWTnVhNzd1TXpIWlFoTkdm?=
 =?utf-8?B?R3RJWXlDQ1krZG1Tc3BOZTRHVDY2TXBNMUZ1N0JFRFRXVktsZzBYL0o1N3kx?=
 =?utf-8?B?WWE3bHNQSEJ1d29zb25OUHlNZUsrd0RUNHNZOTliVERzaTYrZXZQRENVeEV0?=
 =?utf-8?B?Y2RXTmZZNU83cDZjUE8zMTBTaUJDU0xmd3EyVVhPTXhoTDVacVlRS3hLMEk4?=
 =?utf-8?Q?KPzHomFz/u598COYwLlbC2k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db41a288-d828-44da-074b-08d9f63094b6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 18:24:36.6424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LDJM0GpXFGCQQ1r6d7o7Mv4O7a/YpAQJAEVXdbtRxekcBumJzMC9ISXglD7m7Tsoru0zEpp52RnQ1MOV+alaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/02/22 4:05 pm, Matthew Auld wrote:
> On 03/02/2022 13:32, Arunpravin wrote:
>> - move i915 buddy selftests into drm selftests folder
>> - add Makefile and Kconfig support
>> - add sanitycheck testcase
>>
>> Prerequisites
>> - These series of selftests patches are created on top of
>>    drm buddy series
>> - Enable kselftests for DRM as a module in .config
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> 
> At some point I guess we also want some IGT that picks this up? Like we 
> do in tests/drm_mm.c? That way this can get picked up by CI?

igt-gpu-tools? we need to create tests/drm_buddy.c to pick these tests.
I will create a patch to include drm buddy selftests into igt-gpu-tools
> 
> Acked-by: Matthew Auld <matthew.auld@intel.com>
> 
>> ---
>>   drivers/gpu/drm/Kconfig                       |  1 +
>>   drivers/gpu/drm/selftests/Makefile            |  3 +-
>>   .../gpu/drm/selftests/drm_buddy_selftests.h   |  9 ++++
>>   drivers/gpu/drm/selftests/test-drm_buddy.c    | 49 +++++++++++++++++++
>>   4 files changed, 61 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
>>   create mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index eb5a57ae3c5c..ff856df3f97f 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -71,6 +71,7 @@ config DRM_DEBUG_SELFTEST
>>   	select DRM_DP_HELPER
>>   	select DRM_LIB_RANDOM
>>   	select DRM_KMS_HELPER
>> +	select DRM_BUDDY
>>   	select DRM_EXPORT_FOR_TESTS if m
>>   	default n
>>   	help
>> diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
>> index 0856e4b12f70..5ba5f9138c95 100644
>> --- a/drivers/gpu/drm/selftests/Makefile
>> +++ b/drivers/gpu/drm/selftests/Makefile
>> @@ -4,4 +4,5 @@ test-drm_modeset-y := test-drm_modeset_common.o test-drm_plane_helper.o \
>>   		      test-drm_damage_helper.o test-drm_dp_mst_helper.o \
>>   		      test-drm_rect.o
>>   
>> -obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o
>> +obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o \
>> +				    test-drm_buddy.o
>> diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
>> new file mode 100644
>> index 000000000000..a4bcf3a6dfe3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
>> @@ -0,0 +1,9 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* List each unit test as selftest(name, function)
>> + *
>> + * The name is used as both an enum and expanded as igt__name to create
>> + * a module parameter. It must be unique and legal for a C identifier.
>> + *
>> + * Tests are executed in order by igt/drm_buddy
>> + */
>> +selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
>> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
>> new file mode 100644
>> index 000000000000..51e4d393d22c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
>> @@ -0,0 +1,49 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2019 Intel Corporation
>> + */
>> +
>> +#define pr_fmt(fmt) "drm_buddy: " fmt
>> +
>> +#include <linux/module.h>
>> +
>> +#include <drm/drm_buddy.h>
>> +
>> +#include "../lib/drm_random.h"
>> +
>> +#define TESTS "drm_buddy_selftests.h"
>> +#include "drm_selftest.h"
>> +
>> +static unsigned int random_seed;
>> +
>> +static int igt_sanitycheck(void *ignored)
>> +{
>> +	pr_info("%s - ok!\n", __func__);
>> +	return 0;
>> +}
>> +
>> +#include "drm_selftest.c"
>> +
>> +static int __init test_drm_buddy_init(void)
>> +{
>> +	int err;
>> +
>> +	while (!random_seed)
>> +		random_seed = get_random_int();
>> +
>> +	pr_info("Testing DRM buddy manager (struct drm_buddy), with random_seed=0x%x\n",
>> +		random_seed);
>> +	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
>> +
>> +	return err > 0 ? 0 : err;
>> +}
>> +
>> +static void __exit test_drm_buddy_exit(void)
>> +{
>> +}
>> +
>> +module_init(test_drm_buddy_init);
>> +module_exit(test_drm_buddy_exit);
>> +
>> +MODULE_AUTHOR("Intel Corporation");
>> +MODULE_LICENSE("GPL");
