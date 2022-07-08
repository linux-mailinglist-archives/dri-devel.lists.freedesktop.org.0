Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C356B732
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9AC10E1A6;
	Fri,  8 Jul 2022 10:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C4010E1A6;
 Fri,  8 Jul 2022 10:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOI8TcZAPFgcOEWhbfqAdP8S2GIxN5x1rW7ryCpMkXs3azrzVP1EhHfboQ3zhp2uJPf96GsKlfFpk8mqyEIMj/8NS3qiZzc9wn+IOYjM8ro0eOyFcczNb0WsUPnEfzCEGZRiD2CE4lkaTlxrzWG4Z1iFE0/zAkhcVhF4X4FKDZfkSFZRNBkfGOf0SVH5qMBOBFHUE8/v9HcJDNNalcjA7GY/jfmcYXbn/ExTE3bZedP8rcQLplkwwlwIXVYEOlYd+cIJN9IWBEwSJtFir+1Us++saqPLzOLIQpRYIa0lyKFtog8vnVJ/C5lL0nPDj4/fKx0rTAAZTWffvz98OIsM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+fALzFEHhvE0PgusAgeodwzoi9OeO2hu2wRZ2qEj5E=;
 b=RPmO8cx2//9NTPOq4eRe3/MwBifQwFE5MnH0HCWD/jO9l81/fnnkRb9Ybm2XwRy3ovnJJDBALLJyXBSgww+OTDXuedjBmfzbMib3eFsG5JhZrzb5ZTYjYRr8uEBfpzm1cKNDUexwdFs46oZd435yz3L1b1lNk/Kf63MxzscZrzbB+rZ20keoxTSq+Smgq5g8tuhurYHhu3xDkoewAU6YJ1hSOmU9WL0lGmYMtAk3jgXjQFk5g9APF+LCETOka+jHWrhyUitrO+UdtcvWzPw/dCsy6SK1xh5n8xRB4iRp0WsXFGBFvPTbmvEyn5Tke1lZerKtKU8YRHNTYBLTpnPBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+fALzFEHhvE0PgusAgeodwzoi9OeO2hu2wRZ2qEj5E=;
 b=FONWakszcf1GaDWxf0t2RG/sNa6xrrhAbPru/62dK/lyu7xAMNGHLaApAmNLffeGYE3dmxhCIq6tzfdnwAfl2GvrOycFv0gdPcsKy1/YTlK8y/bLyDzc3Mb+7nrRN4KVpzMlthn1upFkg3l8WjBzcb4diRXOhCDWdp+fb8DszSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 10:23:18 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14%7]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 10:23:18 +0000
Message-ID: <70a689ec-2ff6-b8e5-1a6e-f5d45ffc5dea@amd.com>
Date: Fri, 8 Jul 2022 15:53:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
 <6a164c3e-0241-6e7a-e6c4-878602c77541@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <6a164c3e-0241-6e7a-e6c4-878602c77541@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::33) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ae86521-80d3-4dff-0361-08da60cbdfe7
X-MS-TrafficTypeDiagnostic: SA0PR12MB4415:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZtXbCQy+LE0lgy7YfEJomw+fr9wcwvlGQ8Up+WpfcLcgrjIp9da61BMnevCak7Jcwejx4TRsI4gnQlQ0r/L19QfxOuJZIWckGaC+Zb32OiASTsw+2OwaEVsLNcfrMObJ9ikYXwQd5cmi8AgQ/Gva/547z0sAqXyEXXsO6hASCX6Kbz3TPrbVJpfo3YVlgAHIGcRwPWOGAEtPbyVcFbSeIutihU/DTdkhjCr9PJ8ePSnuDAO/d+dnfsYgRWa0HeJHftPTAgi3hO3ncin4uWMvptDnQ48JEG6r3x6/ZvdApWy6RIcXEzLQ/aAbURjKsobgVcwOJbe7uY6kJRKAf20VVf+vSYBhEFI7f2gFPyGf2w9fFwVwxFd8fIlQtLSdg9l6kgM/MTUjTau50cVQ/saD/dqsZRh8i5QW2ADj/nCrPinz//29FtVTJKLlLLSiierG28CTzuGa25SMHXJUhZzKs2XCUDqe0CnGCC8XBjOTDeYa6TxZeDBVMscKQ/HdoomUiaK3tFbd2OKky8h1pfznJCIW1lrZZt/aZt2zKZFlQoUs9LBmvlCjL3U2FI+dwJ2wbiV3viKuh20yXLm/Yyex6TlOnICcrqWieQ7F5nMKphB96FkpeYQZa1DecQA2xshbqJp7w8uf6X+eBOsrHVdPOJr+/4c47RELrKaFaGyLzXiwU7acVRvkRvXq/Bj1dCb3Vf8GT0K2DjHVux3aitzxvs7J2RjrLBzipAv2l8qk8gjeK1Z1CJ2mhm2yiNf6MRBor5w4dUaEPlpFnn6JCwXIywk0i154LV3jNMoXSyr5/Btoj1go/OGLFjuFQaitPbYhhface1raAzAdqPH3wwPd8OWAaff5GO+o7SiTukgVeSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(66574015)(2906002)(186003)(41300700001)(31686004)(6666004)(83380400001)(36756003)(5660300002)(8676002)(31696002)(8936002)(6512007)(6486002)(66946007)(66556008)(316002)(66476007)(26005)(53546011)(6506007)(450100002)(2616005)(478600001)(38100700002)(4326008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXNTVFNETGtpRXkvK1pZRFY1MXFZZmpSOVZMdFdwcW5ub3ZPb2NVM2xsbXB1?=
 =?utf-8?B?bUdROTR4TWRBQlkweXRtMlRBd0pJemEweXg3WENiRFF6WnBQNVpjWVBFRFNr?=
 =?utf-8?B?R3UzYmpzWVB2Z0x0eFR4cXArU05wcThRcE1WNEJUUmdYL1BJc0pTZmkvUUZV?=
 =?utf-8?B?UEJ6ZXArbHducm5yYWdlK1JOdnVnTWMraEhkUUlIaDRUak1RT0NIVmFCdC9T?=
 =?utf-8?B?akNQYnYvaWVDMlA4NWRkbllMSldBNDVUSHNaNUF6YjVCbGk5L1EvQzR2OGJu?=
 =?utf-8?B?NFgrMU9DVGovQXNUSXFHRmZFQU5SdTBBeTVWKzY5bUl5U08xN1BlelFnZS9m?=
 =?utf-8?B?bDFoQThFcWZDVlhzUWxQazJHZEFtM1NDcWFKKy9jOWFkVll5aXhRUG9xeE5U?=
 =?utf-8?B?VzBjdkVKRC94UU5wZGlXOWdWdWdkK2pEbVpGU0xQdUFtVkJES0RjTFVaMnFC?=
 =?utf-8?B?STBGTzdSU004bS9EdXFteVpxRUhsTUJQejlBYlhyYko1dTZ1VTRXVFVySnli?=
 =?utf-8?B?SXB1NUVnSDc5THZ2MFZkWXJvTzducFZsWjFLUzgxOExkdk1mdWdDRGQyUGRK?=
 =?utf-8?B?M3pnRHRsMHJHYWExQXo3cEUyU1pPYmhRV0w1NVBpWi9sRXlVUk5mcnB6emJ4?=
 =?utf-8?B?bXliTEVkZkhmaGE2RW5oYUNMUkt5TzJ6Ymlkb3NKa242aWpqVW02bTBSN2hv?=
 =?utf-8?B?KzhuVkxPZDhLWEhhYzEvSlNabGZRNVFaV2hzSmZhb3RnclFENHVrOEJmb1Er?=
 =?utf-8?B?TnV4U291VHVGY2JGUm5OMXU2cTJ6NU1qMXRMcmhHZDhOdkRzMTc5WFo4UHFY?=
 =?utf-8?B?WnFIMFdwMTdKcnorSGtQMVgzZWJGTXhmMkN2UVFNckxlRFFXVVVvMTd5b0ph?=
 =?utf-8?B?elY0VXQ1UUt5N0t4cWVUcTd5TDFMcTB6Q2JTbnlWYWlyenZiejVJcVZYZG0w?=
 =?utf-8?B?UlJpckZMTVRobnB6R3JBNU01clg3NXJGY1NnKzFTWWNRaytGNXNzTmNHZy9X?=
 =?utf-8?B?dlJWTytIMDdNNmpwN0dwVHQ0TmR5Um5uNlpwTXVGWitXeXhlRi9XU2lkcWhr?=
 =?utf-8?B?WElvNnl1RExadHlHVVpXWVdxOHU3UGZQZVo2UlErQWJoOXh2MjJMVnhxTEd6?=
 =?utf-8?B?ZTUyM0VwQUpOcXdtZHMxN0E3MHQ3VmJDVGFOSjRUK2d6VDZoYkVibWhtMkFO?=
 =?utf-8?B?a2s0Y0NNTlNsMGh5bjgwRm5SenhYeE4rSyt4cUx5UWtDdUpHZ0xxOHV6WDJn?=
 =?utf-8?B?ZUtScWN5enJ0aThQditidzV4RDJYL0creU0xVFpia21FY3Z3NXBSeGpsb3Yw?=
 =?utf-8?B?NlVhdlh1Qkl1Q1ZiTzRLSWM0VlpUS1F3SDZMUFYxRzRMZitaOHZ2cmszOW4v?=
 =?utf-8?B?Q2Y5NTZ1ZHl4eEJ5ZGh0TkZubDhZYUpQWUZPV050U2pFSm1Wc3V4RWVqbk96?=
 =?utf-8?B?MzhTR1g0VlBTZk9BSjIva044TDQwMzd4cHo4NVFqYjhiNGdnSmR0NUlyQjR5?=
 =?utf-8?B?bkcxM1d1YjkxN2lnWGdEUkZKSFlEcURmOXdIZHZONXdTNlBRWXl5b0tWS2Jk?=
 =?utf-8?B?a2lTRU9zKzM1QkV5N3hPeVNQejVJNnNyUlpsUVB5alBzdHpyWTd0bVowWUlK?=
 =?utf-8?B?Z1VvQm8xd1laTjRIc2Y1ZlJINVpUZDNyNzc0eVFWWDU0cTJsNk9IS3NSMmVu?=
 =?utf-8?B?bGZma2R6OWExVi9YcktGblNOZ0VISThRU0NPbHJ2d01Ia0JqRkxqdktBVXBS?=
 =?utf-8?B?Vi91S21SOVZFKy9XK0JHR0dDclJFNUxCOVlzaFZJUUdROUNERWczbzRXbU1F?=
 =?utf-8?B?eW0vZXdSWUJlRk5LSnZvZG1BeXBjeFhHOHF5U0ZSQ3hYVjdlTWlicnJkaGlh?=
 =?utf-8?B?ZjI5STYwNUVwcEQzdXBXUDJlMUpNWFFKdG93d3hXdy84U25wMFkxMS9KZnN3?=
 =?utf-8?B?cVRHT3ZnbGtGMEtyOGhvQS83ZmpsZnFoMldLbVlwVjJOSXZFZjdpekpqbXV0?=
 =?utf-8?B?Q2hvN0IvZDNwWEtuMldobjRpOTFkcG1pRTI3RlRDb2M3MXhkK3Qxa1lSeHhS?=
 =?utf-8?B?TmpGYTRjcmRGbkt2V1FaVm52TURUTVRJQVVUeW1aWUhHQVNpNVE0czlKSlFh?=
 =?utf-8?Q?39aF4EIDPLBwSVnbw9T65Wwc2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae86521-80d3-4dff-0361-08da60cbdfe7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 10:23:18.0258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrhwhFc1sHmSBUd0EsvktPk2eZ3fVxMGpSTX6uUJP+29IsB11WwxdulPO1+zINDRF9RuYhg75J/iPWMe0PpIlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/8/2022 3:03 PM, Christian König wrote:
> Am 08.07.22 um 11:30 schrieb Arunpravin Paneer Selvam:
>> This reverts commit 708d19d9f362766147cab79eccae60912c6d3068.
>>
>> This is part of a revert of the following commits:
>> commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function 
>> into the C file")
>> commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in 
>> amdgpu_vram_mgr_new")
>> commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>>
>> [WHY]
>> Few users reported garbaged graphics as soon as x starts,
>> reverting until this can be resolved.
>
> Please squash all three patches into a single one. Apart from that 
> looks good to me.

I sent a new patch squashing all the three patches into a single one.

Thanks,
Arun
>
> Christian.
>
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 29 --------------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 27 ++++++++++++++++++
>>   2 files changed, 27 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 7a5e8a7b4a1b..51d9d3a4456c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -50,35 +50,6 @@ to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
>>       return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
>>   }
>>   -static inline struct drm_buddy_block *
>> -amdgpu_vram_mgr_first_block(struct list_head *list)
>> -{
>> -    return list_first_entry_or_null(list, struct drm_buddy_block, 
>> link);
>> -}
>> -
>> -static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct 
>> list_head *head)
>> -{
>> -    struct drm_buddy_block *block;
>> -    u64 start, size;
>> -
>> -    block = amdgpu_vram_mgr_first_block(head);
>> -    if (!block)
>> -        return false;
>> -
>> -    while (head != block->link.next) {
>> -        start = amdgpu_vram_mgr_block_start(block);
>> -        size = amdgpu_vram_mgr_block_size(block);
>> -
>> -        block = list_entry(block->link.next, struct drm_buddy_block, 
>> link);
>> -        if (start + size != amdgpu_vram_mgr_block_start(block))
>> -            return false;
>> -    }
>> -
>> -    return true;
>> -}
>> -
>> -
>> -
>>   /**
>>    * DOC: mem_info_vram_total
>>    *
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> index 4b267bf1c5db..9a2db87186c7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> @@ -53,6 +53,33 @@ static inline u64 
>> amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>>       return PAGE_SIZE << drm_buddy_block_order(block);
>>   }
>>   +static inline struct drm_buddy_block *
>> +amdgpu_vram_mgr_first_block(struct list_head *list)
>> +{
>> +    return list_first_entry_or_null(list, struct drm_buddy_block, 
>> link);
>> +}
>> +
>> +static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct 
>> list_head *head)
>> +{
>> +    struct drm_buddy_block *block;
>> +    u64 start, size;
>> +
>> +    block = amdgpu_vram_mgr_first_block(head);
>> +    if (!block)
>> +        return false;
>> +
>> +    while (head != block->link.next) {
>> +        start = amdgpu_vram_mgr_block_start(block);
>> +        size = amdgpu_vram_mgr_block_size(block);
>> +
>> +        block = list_entry(block->link.next, struct drm_buddy_block, 
>> link);
>> +        if (start + size != amdgpu_vram_mgr_block_start(block))
>> +            return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static inline struct amdgpu_vram_mgr_resource *
>>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>   {
>

