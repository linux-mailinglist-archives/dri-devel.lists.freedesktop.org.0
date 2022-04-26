Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B821B50F101
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 08:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA3610FAE4;
	Tue, 26 Apr 2022 06:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3673B10FAE4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 06:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXIANG8cuaYlzzIkGl+3PFUTa2V20dugYF0eMw34tyf+k7lFzEo/QUAQvNWzTFtqr8uvLzkhvGCeO8kHMN7Q33b1LvTxHOZ/1/FHdRto46ZDBpO1ixG16ikDWLxoPiIIpVLRn8rR2T24jf8j5joCcgSq1Fb6o5IAgCBO3dnTd7zG2SLFwWL++ARlxWZOqRo7rkPx0UJIrYVB5540Gi0I2+1Y7vi19vfbIX6sx6OOK6XcayvqROR5rRmXQqdvxay8Wyb7WlCyX/ak1gBy7QyLmqLRz+OPy9ayfzYVUIbgkacdZo0xW5XM/3ewMTsAMoRpBWFtiYVr7FVkD4FbrUe5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e7nu1vdnqPv/BzdKIAu2XuDqngNYnHYfaPv3cAqkRA=;
 b=W2OOvE3bo0ag+nJey+KQLvu0lcYkTjcE5Irew4AHHV+x/H8PMmnToCbwmryQI/c6dFKOhPd+CQMRVqBmhzRslQahi+0/R2NTIUbZXd40h/Fyok0F/3d7FdEsnqL1da6HbIbE5yNdbR3t02TZ+gf2JS/qsTj2tnW0DpkDAYrDLRkiuTF+ElQUSWk2QozqQUgigZo8gQs/JL2uQ3M5ZzdBvFUS5xl6twG5XZfEhF05LYH1GaCrSLyyXoqKr2Ya2etb97HQPYY6DEIPMY32UTLEqyl40GoVim8t2yx84sZ8B+Wxr0ZVCm8EGV9Hg1L2MfkcEMHn2BWr5Nh4KNLAqr6yGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e7nu1vdnqPv/BzdKIAu2XuDqngNYnHYfaPv3cAqkRA=;
 b=Kcw27ip+dqmxc+tVrY/meFixb9sHAkeQrDkyryD635MEV1SXlQ/DxUoSopNUxXNNBpMMOdX8pom9In7NQGVUWDiaT12jTSL4en9cQM3D4gx0/QXnbIEOLWCYekspY2M/7/MOXJWZtvK5apNBj26vhVzx64T3FY1y++rP2zSYXe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6228.namprd12.prod.outlook.com (2603:10b6:930:20::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 06:31:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 06:31:11 +0000
Message-ID: <618a4f53-0998-1e6b-e32b-8bf2d3057cec@amd.com>
Date: Tue, 26 Apr 2022 08:31:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/4] drm/nvdla/uapi: Add UAPI of NVDLA driver
Content-Language: en-US
To: Cai Huoqing <cai.huoqing@linux.dev>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <20220426060808.78225-5-cai.huoqing@linux.dev>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220426060808.78225-5-cai.huoqing@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0051.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 309a2029-25c9-4411-e963-08da274e5b0a
X-MS-TrafficTypeDiagnostic: CY5PR12MB6228:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB622825023296D669807AA70B83FB9@CY5PR12MB6228.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8NnVhCfUD06qX/mxSZzNWkB7c088dpK+5UoqpzP1zWQbG3W3qCyo7Lipoa93mp2GNWJRfXGPNlb4A0yqxkWJo216iKyR93MyhJOsF4jihAwwWRWxLNjB/1mF9Y+o/hlWaA610ugzNGRxY9ybX2kNhpcs3i+MJ48u/s3STNz9FbophocPrQL1etDuyMkamrc9C8xuX3NmmZ9rREfLwP+lkpapgp8+Uu3yDH0JqSf/A6xXDuQ5ld4OA1xJtTIe3D4WNtYKYI9G6YAZ5FLXW06K1f1k5+17Tu6IwRNquDAep1AT2/8KFfY2BN59ccw4klUOl7/n9VLp3QoXMzcXBcGsnrskM34U3HVJwXrpEsCdTxc5YVYkZnIkdWWhxxtcYvNKrR9YIyPoFzTojv71Fj/tVrzfDie+ZMqoqNMmrzu69vgRGVr5JLbHJMy3MZrlBTcO7r34dYBjElivDr8qPyBmz30kBV8J25PeMJ4REqFYpRcTyi2h/nC6PrgPqM1WwUsOfpBrMIzgrzs3aaG+xMUQHY+kzsrn9yHZmbErZKLp4XKnCmNnAOXOlf7DN5/LlVSD5+KWsoDWgNcl7wDhWkrPE18HGG15iMCH0L+zFvryJ7LMV7WjBON12gITH3n9tv9/NAyznqzLEmAAL8Z+JXPfTThoeUEXbtwgoWg2YU+Y/blcWmvuxHE1mglMDvakUpCg5e6NQZ4wVDbV/Wx4vTws6Nxn7INclYVMBJxl28kEL1TZNMQYSFbQpKY/36P+WFFd6BFF7ROBZ8GUkXJ9HNwYM/vYGE2gXfb5OPaRR/LgQdmVfF+iZL4uetfVvybB8SU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6506007)(966005)(5660300002)(8936002)(186003)(2616005)(36756003)(31686004)(7416002)(83380400001)(6512007)(26005)(4326008)(6666004)(6486002)(508600001)(316002)(54906003)(6916009)(66946007)(38100700002)(86362001)(8676002)(66556008)(66476007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm80dGVZendjeTM4TEZicnRGT0ovQWpOVXNqWFVrbG4wRmtHaFNFQndPNmJG?=
 =?utf-8?B?dnc3aEVtY1FVSThJOHg1U1QrR2ZHc3R5ZDJaVWhiaVFyTXFxV1NCc0hwck15?=
 =?utf-8?B?TDJ3amI5V0Z2L3ZzS0hXY3EvWlc4S1d2ZElFUUJ0WThDZldIb0oycFBScFFK?=
 =?utf-8?B?Z0t6akk3L2I2YVcwQ0lsb0l6VWR3RlYvdHpGbjlTVkhIT05RY3c2WG9KdFRV?=
 =?utf-8?B?VWRETmkxaTE2N0Y3RVkxWWl1MWZlZDZGQ3pTSUE2VWVuUVlJYXhibVhwT1p4?=
 =?utf-8?B?T3lORTdVMk02VkZQNDhLazVWemRwbWJKT3FLYU5qbWVVZG1sbktiOTJhcW4x?=
 =?utf-8?B?OXB3TWR3Y2RlVGlra0tjQi9ZL3lYRTAzWWR2WnEzL3I5c3FxZ3pmZkRJSnB2?=
 =?utf-8?B?aVVXQVl3dlRhdzkvL05mZU9DQVdWZm84dDRQbVV5OFdtRGh3OGR0b2JaYVhT?=
 =?utf-8?B?RHZrbFBTNnZ6RndBZEsrcXcyaTVOT2VKWU9MVEFkV1c0eDZhSUJqN1dvUld4?=
 =?utf-8?B?UHlaNGNPV3ZhcVUrcjNEQUVWTGRKOFM3eG82NVFnSVJnMC8xK09sZG9KL2Vk?=
 =?utf-8?B?a2FKWHVtdTFKdU5CYW1PVW00MVc5dzhvRnhRbU5PNTN5ZFhveUtZaVZnQmp3?=
 =?utf-8?B?SElkaVFxbm5kMDdVaTVZVWJVRHdTTmROQThVWTgvaDBQTjJRNVNOR2RpbXY5?=
 =?utf-8?B?V2E2TnpWb3VUY3FOMm1CM2xBWjN3TFpZZVNTTUZqTUpGSjVKUlFFTzRiQUt5?=
 =?utf-8?B?dTBTQmlyRUd3TzlXZWkyVTVOcVRiNkdWTUd1Q1MxN1g4SlN4RlNSQk5hQlg3?=
 =?utf-8?B?TUNJVnRrN0NvcEt5VHVQS1FpSDMweWdvZVREZFUrRVh6eGV1a01pbG9YM1E3?=
 =?utf-8?B?VHRmVkExVit0R3R5YkV1K2tQVFp1dGhhaTBwOGVMYmNuRWZSc2JiU3pqOFFX?=
 =?utf-8?B?NWdFeHU2TmUyTksxSDBKbnRWNVN2T2Z2L0k1aXdDeThVVlFpV2I4Yk1RRHc4?=
 =?utf-8?B?NlE2MUkvTWV4blkybVVBVXJwd0hCSTc4QVdZb0tnc203MG52NkY2TmkrSkZI?=
 =?utf-8?B?QWhpbWU4NnpuaVMwcWpFNGRKMU56VGUyUHRMVDZaZ3NMOUszRWtGWGl0QWFk?=
 =?utf-8?B?eHpqSms5R0x5TUNtK01ESnJkZms5enphcG1SMnN0NVFTTUhreU4zd2xmQjUw?=
 =?utf-8?B?YzNsUnZrcmpXMmhGOWJWM1pIc25FUFBnOFRBZ1VLdWZvd1pWR0hHNmJac1J2?=
 =?utf-8?B?YVZkLzMrN2xsd0pnNm9CaGVrQkE5VUVtSHdkZkVnZXJKYUdlaUlmNmZTSksy?=
 =?utf-8?B?VWU4VFVJTktCam9kdFROWWRCWlRuU1llS01adURWdXROL1FETEFSR0lmNUlQ?=
 =?utf-8?B?ZG5QeDVNMnowZGVVd2pDZ0pPLzZEaXAzOGdLUkZRWEdYMWlpdmpxcWZXdDNN?=
 =?utf-8?B?c29xcldwLzU5MzNHelAyNVJyQXJOT1cyektUeEl6bFhaRkI0RVJOakl5R0dO?=
 =?utf-8?B?Wmd0N0w4MEc5Ulg5ZmtTUThIMnI5Z3BhcnVBODgvY1pieXF1Y1h3RkhycDJU?=
 =?utf-8?B?V3NDTzFoMFBhSmVEeE5TcFpLUGlxbWN2KzhaZitqL2gvdUgrOWI1V05mWmtQ?=
 =?utf-8?B?ZlVrY2xhMXVPMEhNbmV4SkxmVWVrdjB1V211Mng5OTVXTGVjREV5aGF3N1Jz?=
 =?utf-8?B?cXppUU03NFdUdGNSbnFJM3lBWmZpeSt3M3Yvd0pKYmJvc0N4NEEweGN1L3hV?=
 =?utf-8?B?L2xaU0xJTFZhYnArUWhBMm1ZOG41Qm1jazFSaGNwYitjY21wVThoNHZMQ0Qr?=
 =?utf-8?B?NnkyQXdKN2FVYjBWUjlNRnE0TCt3V3A0NXRhMHNOeXNRWFVxWE45UmY0Vk9x?=
 =?utf-8?B?WG1jTDFGRXpqd09sbTZOeG5VdzBjbjY2SHlrdlliZ25MOWRyVVRpZ2kvRDVm?=
 =?utf-8?B?MXBXRG5hUkhuenhSVzdyTGhueVVOOHhnc1I1NU1VZWlqOWwxaUQ5a0xKcjBy?=
 =?utf-8?B?WnhwZGxPQmxXUmZZZmF2RDVsb3VlRDU5eC90VmE2c0txRXRjeXdXa0IzemZD?=
 =?utf-8?B?VUZ0SlJQTUZydE5UNStmSHJFdkFkMUpjVWtkYVhZcDRtanFoY2hjSktDdFlZ?=
 =?utf-8?B?ZGdnbVlqSWo3elFnVXdsL3pKbWt4a1hyQ1l3N3ZSL2NsMnRTRWJUbmVzbmdm?=
 =?utf-8?B?R3V1Q1V6WFptV0R6d21YNnFYbTZLcjBkbUpJMWlBcktIQ0wxL2lwQnBOTVlJ?=
 =?utf-8?B?eG95YVluTnBrb2IrQU1TUllLckRLMzh6eTBKbVZkYmw3NWZSWkZUbEFMWjMv?=
 =?utf-8?B?Z1R5MmZlQUJXNGhvaFpXT1MvYTVyaEwvbVhtS1Axb1cvcFE5cFlpdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309a2029-25c9-4411-e963-08da274e5b0a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 06:31:11.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdB1P5gzufEXTTNQ4VnLHckotHkB5Oapu/nmyzWXv5Ek0oM94zC6kx9jEQSxr0/N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6228
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.04.22 um 08:08 schrieb Cai Huoqing:
> The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> which is integrated into NVIDIA Jetson AGX Xavier,
> so add UAPI of this driver.
>
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> ---
> v1->v2:
> *Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to nvdla_drm.h,
>   move it to uapi.
>   comments link: https://lore.kernel.org/lkml/20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com/
>
>   include/uapi/drm/nvdla_drm.h | 99 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
>   create mode 100644 include/uapi/drm/nvdla_drm.h
>
> diff --git a/include/uapi/drm/nvdla_drm.h b/include/uapi/drm/nvdla_drm.h
> new file mode 100644
> index 000000000000..984635285525
> --- /dev/null
> +++ b/include/uapi/drm/nvdla_drm.h
> @@ -0,0 +1,99 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2017-2018 NVIDIA CORPORATION.
> + * Copyright (C) 2022 Cai Huoqing
> + */
> +
> +#ifndef __LINUX_NVDLA_IOCTL_H
> +#define __LINUX_NVDLA_IOCTL_H
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#if !defined(__KERNEL__)
> +#define __user
> +#endif
> +
> +/**
> + * struct nvdla_mem_handle structure for memory handles
> + *
> + * @handle		handle to DMA buffer allocated in userspace
> + * @reserved		Reserved for padding
> + * @offset		offset in bytes from start address of buffer
> + *
> + */
> +struct nvdla_mem_handle {
> +	__u32 handle;
> +	__u32 reserved;
> +	__u64 offset;
> +};
> +
> +/**
> + * struct nvdla_ioctl_submit_task structure for single task information
> + *
> + * @num_addresses		total number of entries in address_list
> + * @reserved			Reserved for padding
> + * @address_list		pointer to array of struct nvdla_mem_handle
> + *
> + */
> +struct nvdla_ioctl_submit_task {
> +#define NVDLA_MAX_BUFFERS_PER_TASK (6144)
> +	__u32 num_addresses;
> +#define NVDLA_NO_TIMEOUT    (0xffffffff)
> +	__u32 timeout;

What format does that timeout value have?

In general it is best practice to have absolute 64bit nanosecond 
timeouts (to be used with ktime inside the kernel) so that restarting 
interrupted IOCTLs works smooth.

> +	__u64 address_list;

Maybe make the comments inline, cause I just wanted to write that you 
should note that this is pointing to an nvdla_mem_handle array until I 
saw the comment above.

> +};
> +
> +/**
> + * struct nvdla_submit_args structure for task submit
> + *
> + * @tasks		pointer to array of struct nvdla_ioctl_submit_task
> + * @num_tasks		number of entries in tasks
> + * @flags		flags for task submit, no flags defined yet
> + * @version		version of task structure
> + *
> + */
> +struct nvdla_submit_args {
> +	__u64 tasks;
> +	__u16 num_tasks;
> +#define NVDLA_MAX_TASKS_PER_SUBMIT	24
> +#define NVDLA_SUBMIT_FLAGS_ATOMIC	(1 << 0)

Well that "no flags defined yet" from the comment above is probably 
outdated :)

A comment what this flag means would also be nice to have.

Apart from all those nit picks that looks pretty solid to me. Just one 
core functionality we usually have seems to be missing here: How is 
completion signaling implemented?

Regards,
Christian.

> +	__u16 flags;
> +	__u32 version;
> +};
> +
> +/**
> + * struct nvdla_gem_create_args for allocating DMA buffer through GEM
> + *
> + * @handle		handle updated by kernel after allocation
> + * @flags		implementation specific flags
> + * @size		size of buffer to allocate
> + */
> +struct nvdla_gem_create_args {
> +	__u32 handle;
> +	__u32 flags;
> +	__u64 size;
> +};
> +
> +/**
> + * struct nvdla_gem_map_offset_args for mapping DMA buffer
> + *
> + * @handle		handle of the buffer
> + * @reserved		reserved for padding
> + * @offset		offset updated by kernel after mapping
> + */
> +struct nvdla_gem_map_offset_args {
> +	__u32 handle;
> +	__u32 reserved;
> +	__u64 offset;
> +};
> +
> +#define DRM_NVDLA_SUBMIT		0x00
> +#define DRM_NVDLA_GEM_CREATE	0x01
> +#define DRM_NVDLA_GEM_MMAP		0x02
> +
> +#define DRM_IOCTL_NVDLA_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_SUBMIT, struct nvdla_submit_args)
> +#define DRM_IOCTL_NVDLA_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_GEM_CREATE, struct nvdla_gem_create_args)
> +#define DRM_IOCTL_NVDLA_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_GEM_MMAP, struct nvdla_gem_map_offset_args)
> +
> +#endif

