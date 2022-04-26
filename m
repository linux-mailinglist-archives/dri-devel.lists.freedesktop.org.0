Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5378B50F411
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB9510E410;
	Tue, 26 Apr 2022 08:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA4B10E410
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVKJrsaJ+WgThRoykibiKs0R9JJU8Uykdy85RxO/Ce86E8gB953giSTV7Q4S5oPXB9ntoTIdQM2s2I4j6yrxKk5KzMX+xbwE2DiZs0lHfN+wuHAMzNatNBnDit+iBcYgSGcWdfWFivLh1V4lkIagoqkvF6hbRNiXxblgVpEIyqQM4GIOopqsMaam1nACY5c4SLUfBnYJgsYIEblDifVW0wiWM2sM2RP2CG5X/adiBz2IZ/KOOfPZ/W3CrM4lp50hKopV9ZlPONL21YItT3cfqS6Ym3HWIZKN5v5/JzxiavN8QBCu94brRKTNQb63hXITIjpZ3GejLLQNZS8aSDGDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtiqOw6JFXZTKbH8oLzY6VoOX6PzE5yThI9dgF9+/Fw=;
 b=GxByBVLM7mRIhC9xGJY+qJXwtdQBK4hF4rCvWkwbyPm3FhWI3jVkKaWNUt2ceCM38tsVdNvATnmQQDwJm3QPw5E9VssUu5+vK8yw3sP6vZYSXC4Au64GddhXz2cY5zJ2dOhmJKzsu1tFIchpH1OSRBUVGzCKzIbgmEsLCgowwL2tut6Eff1tsIF/99Tol+HHf5niyTjACLYo5UEufWcwArnWc6y8sqbf6tiyUlY0NzNOA+uEeMpuq6a6/T5UdQT1BsS+aDwNMjQWhA+eV/tElXKMiesDL4yM7ON3OTWyEHZ8Go1eTLxks5gom8vFHFeIftCxjWBpQ5HLkheV4PADHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtiqOw6JFXZTKbH8oLzY6VoOX6PzE5yThI9dgF9+/Fw=;
 b=0yTvZrPsCpbFo0WJUFxEmpGZlIJGkl17XYzO20gHiAIJS/3NDycZsAbbIiGBVVFXPHQtihTCGyqWtrCiXZgk2vSQmGxqaO+vqb7UEFK7TfDpp+eqw9vLwinpfRtN5gZaNcS4AkZLDiVPbpkPj2caoW9JnBgiGYXs9InsGgRhgXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4819.namprd12.prod.outlook.com (2603:10b6:a03:1fd::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 08:29:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:29:50 +0000
Message-ID: <ad3edfe7-8dbf-b6a1-f51f-53ea600439c9@amd.com>
Date: Tue, 26 Apr 2022 10:29:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/4] drm/nvdla/uapi: Add UAPI of NVDLA driver
Content-Language: en-US
To: Cai Huoqing <cai.huoqing@linux.dev>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <20220426060808.78225-5-cai.huoqing@linux.dev>
 <618a4f53-0998-1e6b-e32b-8bf2d3057cec@amd.com>
 <20220426082341.GA83596@chq-T47>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220426082341.GA83596@chq-T47>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0562.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac33cb8e-dd95-43e1-595f-08da275eee38
X-MS-TrafficTypeDiagnostic: BY5PR12MB4819:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB48197AEAD13C6F031AAB8B7483FB9@BY5PR12MB4819.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUfYoCZUxxCee0kCk68dahd7W2LLM5s7UdqpsneAAQ4oooLdO8bHJWkKc2+C7ywQFm781BmTKF4QKWpGGpNa1iaKFuaNhG1rHW0REbBzXCoQVoO/3JpTgUALIwmuD8EDbZ+zqr3n82x6vseoWw9lJxnasJtTFdqVHRwQ0l1GhKOsK9CXee8Mz72J83bJgCgch++IFnCFOA5LYm9UU1qM5/VckxR1IU7u85T33zOTCEpvBDBi9/EdHgu2oWNGr0K7H3SmnSkx2STtzp2kFcZbdx5gWq/xF1mtWsVWkXQsygoz4usHyDjzXb9B7JHjcZT7DmQlehlAXtAvfaaJMQWO2z+TOkPGSMlsrOTyPF+n+aR0t+9QBYpgHhNNjZj7YTwIDi5eCjCBT8JA15J7Z4b+kglk1s/DTCDoH9LWprAoPOu4LaSY7r1mQWVnL51p/YLmEN0sKli1BZxvvDWzcz2WPrVSVkfH22CHxWDtKRcfooW+wXHdNaMmKOfu01E6U26MZ4yyahcMZpqj8g+4bzwY8kYQZlOQD4CAf/acENBcSG35l5ajauKiAfd93YWcQIOvv3rq34izPClhbJKsSBg65ANht322h/SW6RsPk0jgE9zj7lyvDk77NKPfJVjKWyFO4691umcDOe/E73jI3x3hTkwfGdnky4uLNd6gXzOCQtPmvyI85FslpJrZfNxiEAISvPNhr/+orZkS+csHEZZAyy2ESiIk1lfP72JJiA2/8DtpQuPtiUwTe/uPLaJYiMeD3QvgbPb3Wr4rKkL/LZxlJzixUmT6wqze0SkvsWpL4OEvYKUeHQ/fDGMK8t12ZiDY9dnaaGaqiXKxSWxrOHE7Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(26005)(86362001)(6512007)(6666004)(45080400002)(7416002)(31696002)(966005)(66556008)(6916009)(54906003)(316002)(8676002)(508600001)(66946007)(66476007)(2906002)(4326008)(5660300002)(6506007)(8936002)(6486002)(2616005)(66574015)(36756003)(186003)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bktNUDNOYndGRWxwSzdiaXhWaFVaR3NIWmEzVzFvUUFPVXJpaXJONmx0UnZL?=
 =?utf-8?B?NnAzM3FNNW5ONmx2MnJVL0o5dmxLZklnT0dlbTRpS1RjNW44WkY5QzIvcEJy?=
 =?utf-8?B?MkVJNmZkWjFjZHQwN0hqSFBCNTY1WS9uU0dwTldKdVdjWVJkNndua1JOM1Y2?=
 =?utf-8?B?bml3WmhEdWlhdWhoY0RNTGdFMHhUYS80TFdpUTJidVNPcDJsaFhTYlMzdktB?=
 =?utf-8?B?K3piYk0yeGtvRjNxQjl1cy9mUWtFMnlFakVJMlhob1BpaFdTSEtNY1V6cy9x?=
 =?utf-8?B?TFNzVDlGZEJMbEZEYXArQzNjTnFRV0VxWFRBVlR2S3J4TVpSMDRhblVpY0hG?=
 =?utf-8?B?Z3JyaUZrN2FJam5ETXpaTjRaWEs4Z1Z6Uk1TUkN6ZmRCL2pPeTJkWWNkY0Zo?=
 =?utf-8?B?NEJGTXR1NVNJdEpVWlN2NDgrblJHMm1UeDJETGlyOEorNHNqdlNnVnRSQ3VS?=
 =?utf-8?B?Vzd1ZTRKVG5KZC9GU2lDeXozUXpWeVhjbG10azVYMHdjeHEzdUhGVlk2Y0gz?=
 =?utf-8?B?WlhOTlpjNDh3Mm1lWHpMN3p2T28zOVQ1eVpZWjJ5NFNFc09iY3lJcGk0NWZl?=
 =?utf-8?B?NnNibE9kaWg0Qkt6VlNNbHRxRXphS3FEMGNqV1luNWVYY3JkRmZza056dlJi?=
 =?utf-8?B?NGNKWjZERTNmdXhxcHg0dzRaUnJsbFRRcEVFTG5MV2h6MjhPMDlDbDMyVE5l?=
 =?utf-8?B?cUlaUVM5S1N5bzJiaTI3MW1lNll4RGtkRC90TlJBYm1LOUNUSFE3dDlSaURu?=
 =?utf-8?B?bm9GcDVpbUlQS3NpcVlCRGxDTW0wNHlJTW9XS3ZEM3dUYXYzSGlnWFMvWnlG?=
 =?utf-8?B?V3ZnczBUOUZKRFB3aG9QSUxzdTBKNHQwK0VzRHBGWWpUaGRaQlMvZDhOcnVB?=
 =?utf-8?B?eGdwSTNYL2FaNzNqQVhmK3FhSFl0OERuamdqVHlCR3NDWVA2WEdna1dDZHU3?=
 =?utf-8?B?THc5MUhEWDVhdEZBMkh2anY1Uk51aU4vb1lMZjR6RU5rV2V5d2Q1UmRucG9w?=
 =?utf-8?B?Tm5xTDJyaFdPSWlWbWxueXFEZzZFQmtYblZVWVlZWjVYT0U4eUNDSmVsVisy?=
 =?utf-8?B?QUw3YXVSdUFtY1RDZGxZZWhSS3pWbWlKUWZxN0JBTmJtYmd2OU1tUWh1UEk4?=
 =?utf-8?B?NEhKdHRKZ0NuYkRuU3Y5Y3B6bDh5cFRFeW1KMzZZOWY2TGFsc0ZMSHZ0ekV5?=
 =?utf-8?B?ckNLYVY3dXpBL3lNd2JkeWYwK01nYVBrUkpSTE5HZXJ2VlpvbEVYc2pITzVo?=
 =?utf-8?B?NEVOZjBrRWhpUTNrdW1zLy9DVmdSVnNjMHJTaTQ0NGxicWRGVi94aDRyN0d4?=
 =?utf-8?B?M2l0d0hUQmhLcE1vYnEyMkMrV092N2hYcUNuV1B5SlA2aUZNUWszSFBlbE8x?=
 =?utf-8?B?S2puZzFOaXBpcmU2czBBUWtyWXFzbXNTZ1ZxRld1YXFnV3oxbDFhbkl2cCtD?=
 =?utf-8?B?TmtRbnd5WDFnelNENVk5ZlFsUHdMZmh6YXZIMy9zTm5nRldXcnJ4dUFxMThI?=
 =?utf-8?B?TlFaSlNZOE9scnJnenRVeGhlcHIyaTFKcjIzTjh3SFNid2taVW9ZZ3J6QzN0?=
 =?utf-8?B?allEakY5STF3U2tKbURyeC9sdGw0MkhCekNvZWw5YlZIZVcwNlNrTEQrcWVn?=
 =?utf-8?B?R3hUK0JPRW5qU3BhbUpLdG45VW4yOHk1SExJREtkaHh0L3Z1ZWVrVk9Bc2pK?=
 =?utf-8?B?YUJjbmtHOVRjbUV1OW9rQXRrdWJWOHI3Z3NRbXJDNjZsQUdmRzB0U3IvNG5M?=
 =?utf-8?B?QTllcktIeW56TGF4RFdROXNzVXFDNVRTejNXL3ovb3ZBcVY1aUdPRkx1WkNl?=
 =?utf-8?B?ZTZYTHhvUXh4YXpXV0lyaUwzTnF1Lzh5bXZGYnFCaHZCSUZYbzhLTFBTTGtE?=
 =?utf-8?B?SVNZdCtOVGM2QU4xSk01dzVpV0QveFd3eFNuZjZFZ3FGbzFjcU1NZnE1Z3Ex?=
 =?utf-8?B?dUcxVU9nWGNqcDhVZVRxRUJtTmx4MGVWVytiSzFpcTRod1RTSkVRUjZVS3Ux?=
 =?utf-8?B?SXgwMXhMTVpNRGYyeG02OVkzMmZmbGc5U0dRNllNWWxwZTJLQzN5ZldqWVBP?=
 =?utf-8?B?NnJXSjlWN2Rockp5SDZJYkdrWU9ZanBidlNINGRFTW5uV0p2VlZRZ2hCVEI1?=
 =?utf-8?B?UzBLWENzSm1HRWtzREVqQVpVYzZIOGt2T29KbWV6bnJzbnJMNkRrRUcyOEha?=
 =?utf-8?B?MGdQSmZ5dWlycHNMWjdiQ1dKVS9iRktySGlVcld0YWVwaUk2YmJFbzNpc21Z?=
 =?utf-8?B?bHQ3TEdhVSt6NFhyV1hrVFU2ajA3MVJmSzNDS2xSeFIxM1pBMDZ1TDFxS2Y5?=
 =?utf-8?B?cVgrdXVxbngrRGE5VGM2T3RMSnE5MGRJYjVZZTNyTGZ6N2ExK05RZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac33cb8e-dd95-43e1-595f-08da275eee38
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:29:50.6081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isHieWhYHdKv0S+KUVj4HIsvmmolzPnlzFS8jnJH+358mPtm9jdZHvDXMjaoBlPh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4819
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

Am 26.04.22 um 10:23 schrieb Cai Huoqing:
> On 26 4月 22 08:31:05, Christian König wrote:
>> Am 26.04.22 um 08:08 schrieb Cai Huoqing:
>>> The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
>>> which is integrated into NVIDIA Jetson AGX Xavier,
>>> so add UAPI of this driver.
>>>
>>> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
>>> ---
>>> v1->v2:
>>> *Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to nvdla_drm.h,
>>>    move it to uapi.
>>>    comments link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20bac605-97e6-e5cd-c4e4-83a8121645d8%40amd.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C0777513b15b34d20c30e08da275e235c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637865582541002548%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ziQSwKxqhevOLDxq%2FvgfinF8BG3hiAwmUxsH3ZzZF4E%3D&amp;reserved=0
>>>
>>>    include/uapi/drm/nvdla_drm.h | 99 ++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 99 insertions(+)
>>>    create mode 100644 include/uapi/drm/nvdla_drm.h
>>>
>>> diff --git a/include/uapi/drm/nvdla_drm.h b/include/uapi/drm/nvdla_drm.h
>>> new file mode 100644
>>> index 000000000000..984635285525
>>> --- /dev/null
>>> +++ b/include/uapi/drm/nvdla_drm.h
>>> @@ -0,0 +1,99 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
>>> +/*
>>> + * Copyright (C) 2017-2018 NVIDIA CORPORATION.
>>> + * Copyright (C) 2022 Cai Huoqing
>>> + */
>>> +
>>> +#ifndef __LINUX_NVDLA_IOCTL_H
>>> +#define __LINUX_NVDLA_IOCTL_H
>>> +
>>> +#include <linux/ioctl.h>
>>> +#include <linux/types.h>
>>> +
>>> +#if !defined(__KERNEL__)
>>> +#define __user
>>> +#endif
>>> +
>>> +/**
>>> + * struct nvdla_mem_handle structure for memory handles
>>> + *
>>> + * @handle		handle to DMA buffer allocated in userspace
>>> + * @reserved		Reserved for padding
>>> + * @offset		offset in bytes from start address of buffer
>>> + *
>>> + */
>>> +struct nvdla_mem_handle {
>>> +	__u32 handle;
>>> +	__u32 reserved;
>>> +	__u64 offset;
>>> +};
>>> +
>>> +/**
>>> + * struct nvdla_ioctl_submit_task structure for single task information
>>> + *
>>> + * @num_addresses		total number of entries in address_list
>>> + * @reserved			Reserved for padding
>>> + * @address_list		pointer to array of struct nvdla_mem_handle
>>> + *
>>> + */
>>> +struct nvdla_ioctl_submit_task {
>>> +#define NVDLA_MAX_BUFFERS_PER_TASK (6144)
>>> +	__u32 num_addresses;
>>> +#define NVDLA_NO_TIMEOUT    (0xffffffff)
>>> +	__u32 timeout;
>> What format does that timeout value have?
>>
>> In general it is best practice to have absolute 64bit nanosecond timeouts
>> (to be used with ktime inside the kernel) so that restarting interrupted
>> IOCTLs works smooth.
>>
>>> +	__u64 address_list;
>> Maybe make the comments inline, cause I just wanted to write that you should
>> note that this is pointing to an nvdla_mem_handle array until I saw the
>> comment above.
>>
>>> +};
>>> +
>>> +/**
>>> + * struct nvdla_submit_args structure for task submit
>>> + *
>>> + * @tasks		pointer to array of struct nvdla_ioctl_submit_task
>>> + * @num_tasks		number of entries in tasks
>>> + * @flags		flags for task submit, no flags defined yet
>>> + * @version		version of task structure
>>> + *
>>> + */
>>> +struct nvdla_submit_args {
>>> +	__u64 tasks;
>>> +	__u16 num_tasks;
>>> +#define NVDLA_MAX_TASKS_PER_SUBMIT	24
>>> +#define NVDLA_SUBMIT_FLAGS_ATOMIC	(1 << 0)
>> Well that "no flags defined yet" from the comment above is probably outdated
>> :)
>>
>> A comment what this flag means would also be nice to have.
>>
>> Apart from all those nit picks that looks pretty solid to me. Just one core
>> functionality we usually have seems to be missing here: How is completion
>> signaling implemented?
> Hi,thank for your reply.
>
> Do you mean fence signal? In this driver, IOCTL_SUBMIT is a synchronous call
> which do task submission & wait for done completion. This accerletor deal
> with massive compute operator (Pooling, Conv...), that is different to
> GPU. It's unnecessary to expose fence API to UMD for reducing such less time.

You should probably add that as a comment somewhere here.

Thanks,
Christian.

>
> Thanks,
> Cai
>> Regards,
>> Christian.
>>
>>> +	__u16 flags;
>>> +	__u32 version;
>>> +};
>>> +
>>> +/**
>>> + * struct nvdla_gem_create_args for allocating DMA buffer through GEM
>>> + *
>>> + * @handle		handle updated by kernel after allocation
>>> + * @flags		implementation specific flags
>>> + * @size		size of buffer to allocate
>>> + */
>>> +struct nvdla_gem_create_args {
>>> +	__u32 handle;
>>> +	__u32 flags;
>>> +	__u64 size;
>>> +};
>>> +
>>> +/**
>>> + * struct nvdla_gem_map_offset_args for mapping DMA buffer
>>> + *
>>> + * @handle		handle of the buffer
>>> + * @reserved		reserved for padding
>>> + * @offset		offset updated by kernel after mapping
>>> + */
>>> +struct nvdla_gem_map_offset_args {
>>> +	__u32 handle;
>>> +	__u32 reserved;
>>> +	__u64 offset;
>>> +};
>>> +
>>> +#define DRM_NVDLA_SUBMIT		0x00
>>> +#define DRM_NVDLA_GEM_CREATE	0x01
>>> +#define DRM_NVDLA_GEM_MMAP		0x02
>>> +
>>> +#define DRM_IOCTL_NVDLA_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_SUBMIT, struct nvdla_submit_args)
>>> +#define DRM_IOCTL_NVDLA_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_GEM_CREATE, struct nvdla_gem_create_args)
>>> +#define DRM_IOCTL_NVDLA_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_GEM_MMAP, struct nvdla_gem_map_offset_args)
>>> +
>>> +#endif

