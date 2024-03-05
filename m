Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5FF871CAF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FB81123A6;
	Tue,  5 Mar 2024 11:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A2U4g35b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395661123A6;
 Tue,  5 Mar 2024 11:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6AaJwugGZaBd4HRoIAqZgwFVptzQ1ibBQJ51ohDPZNpNKSTBWg+LpqTfuQ+yh/r9YiUq2HAGacq/HG/rgy7K+WyJ4SVNFp8GUByHlwV1FII8DCyEIRyDsl3Th7lW4Jd4xK2cvwPvaiJdWI6OK/oBhGOISyyKm8pBAajhoJhLIaHt+mnzTWuIetAtfSnMf8v1h+RgL7Aql5+d0yS1zBbMEz8FB89l5/wK3Lbg0ul+KftjX3yxawOGQj+8dj5s4xZoOKp6wpUxu20ezGsigX0PB0ouJmdbxK8Jlgh/1qYPhNyFhY1l2dmXB4oxEkU/fMGKa5pT9IwdZEDIRPW0UxbHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjrVNb4Aj8BLbpcASF2QAH3Q6R4WS3Zk7V1C2aWr5a4=;
 b=dheJMf/F7UQgWnxyuTsQurgZMhF9GuO+YfriKaxOA1w4A9V61cLIJrVdqICUTZV54HfiYFDYZgedBXfjf63IwKGlhi6YlDIvLMHU3L+LSZwh7fsAxsY2Y5vr4Il7mmwAtVHs7xsgs6q3Bbd5DoxCK1zDUpdypm9x4UxFUBijIuHJDOJNWa97IzkqmVfQllz6nMjeKVPXnmEXU/OMsIYZqcV2VGLaiB7hcP5JCTFmxB5xdSIJs7ZAhBG6MqG373wGWkX5u79lWMBHdvn37JV3KSXw3W3oogZxLT8jffS/RqIKOXnLvJNV61O0NR0VThJAK0NQUWu+oGpF/va5kQD7gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjrVNb4Aj8BLbpcASF2QAH3Q6R4WS3Zk7V1C2aWr5a4=;
 b=A2U4g35bqJVaeH+anBSUFJVX+UpuFmnndK9RVC8tg3sgOnjq/H/4MVYXlAeblJ/GNwnlih8vcQ9M/KbiBJBGZlAlUQZtm9/RvJMupGnFkLDyFU9l/1TJ1sUsfE8+Ipek2v0GQNilOufhNkpETjT8tSzWZjLFE/VyZDtY0dvTGfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21)
 by DS0PR12MB7897.namprd12.prod.outlook.com (2603:10b6:8:146::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 11:03:17 +0000
Received: from DM6PR12MB4338.namprd12.prod.outlook.com
 ([fe80::66b0:e265:696f:ad0e]) by DM6PR12MB4338.namprd12.prod.outlook.com
 ([fe80::66b0:e265:696f:ad0e%2]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 11:03:17 +0000
Message-ID: <aaf76e24-787d-4ca7-b3af-3636d065c1f6@amd.com>
Date: Tue, 5 Mar 2024 16:33:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] drm/buddy: Add user for defragmentation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, felix.kuehling@amd.com, mario.limonciello@amd.com
References: <20240304163220.3093-1-Arunpravin.PaneerSelvam@amd.com>
 <20240304163220.3093-3-Arunpravin.PaneerSelvam@amd.com>
 <77148946-83ef-4576-a26b-ec84f9a4c63a@gmail.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <77148946-83ef-4576-a26b-ec84f9a4c63a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::19) To DM6PR12MB4338.namprd12.prod.outlook.com
 (2603:10b6:5:2a2::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4338:EE_|DS0PR12MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5bb20e-9121-4fb2-2b60-08dc3d03dc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IOcMDHZi/9tzk7Bpfc8Ol3Fik6ysaXl8GSWwexIa3gHp/pgzXwXZJtCm5bsIk6Ly71KFimbbuLe7L8dLu1oB921BvAsfxzpMdJGcKY54MMQc6NJeLZdVR8aORc2X8skw6KxEt7W7hp3/1zgqCzXBfX94ZzhttKZ4Ke41P+CPlBSxQM4GLE84vwFv0NZUqHIVvAhrACvslHCiQ6sLpTI3WkNm0M1XDA/z+qh371Sqes0hPw3MDTwPXFGP0NGMIrhWbO1gNYb0EIqsZ8OxacztM6lFLm4OcrhaXz2c6eult/yOoICUZkakkWCzHdaK5mdJmOXwo8hDYZkyVcK/GoGnWQN1xDfU4pAxnvE4F3LJVTw+kXT96Bv27ZQujvsIn+OzXwhVqc33O9vjXol/agfzmQ6cQqD+0DWQ38tHmD12m+uWWk1PJXH3xpsvSNuw6XJNml2xkDeo7LfZBQzDJv8S8MnbLGdlNqsOT89HtFSps/5mkYnsbDUccfXYOvz6EdERzl+38pdJgXdtgKoOaNIuBFO68KOUhzCdJfor0/nQVw7gY5Rhl0YUv7LcxORy0hQG5afldiETHh5uTFxRhJE6oN4J9j+YrY1XJP44MdFWUjBzYDxvXOyhh8kyLDOmrIzwLIQDjceOxyZz/lXvD7EFPVsRrFqXVb7BfoVt1EDzUbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4338.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFF1QWpVTGxkbmlibXMrU1VyckxjMEhRakwzdjNFUzVNWFg4TVFBejdyVTl6?=
 =?utf-8?B?VmNGd0dYL05iRU1xRzJJUnJ3b21VVG4zcDBzMmRsb3ZSNlBCT29aT0orbTNC?=
 =?utf-8?B?S1BjWDNnUlU1MGJtSFdRZ1dUZ1hzZ2R3YVlXWFluMTN4T2tJdHpSck1JcllE?=
 =?utf-8?B?Y1oyenNZT3h0c0JET1R6enAyOGpaRlpYVEJYdjFCOUQzNUViOXZLaTVvVnpw?=
 =?utf-8?B?cmxUaUxtaXRCNXlJOWVVSDlHbDhyTm9yYngrWFBCbm5NZWtxMGpoQTJpSTBO?=
 =?utf-8?B?UFR5Y0NuUjdBM0I2cFBvQTlKNE0rN0ZDUndmU09pcTF0M2EwNGZjbis2SU9D?=
 =?utf-8?B?Z1lsampFZ20vaVFCOEVSblpFU1phRnFPSGtQOFdGdHRLY3JTTFUzSndBTWJw?=
 =?utf-8?B?cm1KV1haOGxyMHNqV3pCYnIycVEvWU5JaEJsLzhMN0lWazRObnFTN2VNWDRI?=
 =?utf-8?B?NDcva2gyOStnaHNEOG9pazA1aWRnVmFETFhGcHBRZTQwUjZibUJralZicSt0?=
 =?utf-8?B?OHdWd3FVVXNCSyswdEU3WUh5dDkxbjljQjBwUGN4c0pxYWF2R1FsNUNkdXNJ?=
 =?utf-8?B?cDBFd0xHQXhLUE5CVEFCZHAwcjRMWFY3QzZ3V2h5dzVLc1Yxend5bk5VZ2lE?=
 =?utf-8?B?TGwxRFJ3WEF5b0ZkZWN1NzVhYUtWTk5xZDBORVBnenl1bEczS2F6VWZNb2Fk?=
 =?utf-8?B?dnFLNHI1SHltcFJaQXE2MEkvMDBIRzFDZDVlMmlMTmV3WnpDamRGcFpNdElM?=
 =?utf-8?B?VkxGU1pmMG5mY1FPYVYwSEliKzFHbzQ1K2J2ZnpUd0dnWFlrRThUNlQ0RFd3?=
 =?utf-8?B?eklvY1drcWZob1F0U3I2OHcxWjBKaGtXMWVvc2JQQkd3c0tBRVdxWm5WUTVN?=
 =?utf-8?B?MDRzRUs3UXo4VlBBbVJMdFNGc0Jla1BHQllkTXBMeFZ0Q09VT0xWdXFiUlJq?=
 =?utf-8?B?N2x4VWt5aGRiNFk0V1Z2MXhrY0lJVDAxMnN0SEhzSjF4NWxsbVVUR0hmNHpX?=
 =?utf-8?B?c0RTTnlJMTd3T3hHZGl0K1NZbmF5VG1Cd2d4Q3BFM1dYSWxFTjI5ODZyNEFR?=
 =?utf-8?B?R25TQ21iemtOOHpySzRyaDl0dVdwL1VaZEZuS3AvYjBHSVNWakFDWlBwUkRW?=
 =?utf-8?B?akl6cEU4MzR0dU4xZW5KdzhDNE5HNDBFKzU1N0R1QnNqcmFDNE1GeEU1MTdF?=
 =?utf-8?B?QjZRSURKSGJOSnhlTzIvcy8zMHNpNnJCUjU1ZUFmZVlVdFVTcXRCNXNCbW9j?=
 =?utf-8?B?WXh2R2JMamFOeFZ2bGhCcnFaSVZmSGJobTFpMW5BN3JVY0pKelR5U3k5U3RE?=
 =?utf-8?B?UUFwbXRaU3VIK09KSG1wcHBnUXIrRW52NjFSeEFSQWtNeEd0am9uN2NGMzB0?=
 =?utf-8?B?a1ZnbFdXY1dxcVpDbENUcWZseHVpYTdUaVF5VHFOcXVPcFRZSUxndXg2TE5m?=
 =?utf-8?B?RWFhYUI4ZU8zUzM0OEYveVFlSXgwbUgwWW1aM1NPMWtVWmlvSWpKekVyNUFO?=
 =?utf-8?B?bDJwMENBc29WSUYrWDBKU0xYaVQ2ZXRaRGQ0UWZ0ZmxFR0MyK3g0dkVGbEZk?=
 =?utf-8?B?ditGYTRQbHo3ektoWTg3UjRNTXoxSTYyNU9VZ3JGd3FRLysycUcrMCtVQmtl?=
 =?utf-8?B?cDNwdjZ0MnZuazBJbzg4OXdCNytDNGNleW1QMWxaVFRPeFF0enZHTEVlMVdy?=
 =?utf-8?B?MzNjaVBoUGRTUWY3WlN4b0JoNkY3MG5QYmNYWCswQnEyMEtkU0x2QWhXNmV3?=
 =?utf-8?B?NEQ5RklGQmJiRXR2TGJ2dzlNVGd3WEFNYmpGWUZyc1Qrc0RGY3IxSTJueklY?=
 =?utf-8?B?cm91ZEZoaG5ic0VCbU9kcjlMWDFyZDZwL295bTU2REZYTWJML2FEanAybVdr?=
 =?utf-8?B?Q3ZYVGNPN1JQZzdjOVFaUm1nMFdVbDk2djJQYnF5L3greDJuVnN0UGhEajZZ?=
 =?utf-8?B?WlF4em1RejZwSkozY21QRE0xYVRFZVJNeWdCbWgzMTRFM21naC9XWkQ5TzIy?=
 =?utf-8?B?RVMyd0pLTU82UHZmTFo2bE5JTng3NHZOMEpVM1hNSG5ldG1GWWJTRU1Gb3pm?=
 =?utf-8?B?M1ZRMnZ6S3ZJK0hHZlF6c291LysyVkZqU3JWNVVpZTRHODZ5NU1BRGxIV0cz?=
 =?utf-8?Q?D/Cf6Dgi+ZA4TyW69wvEUu+Al?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5bb20e-9121-4fb2-2b60-08dc3d03dc25
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4338.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 11:03:17.1076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5L5NvpLpsS3fc0BOELr3YBwMgFqq5hfKzCf+R/OFaj4M8g2rR8Mn0Idcr+NtKxZ1F2u/gFg3VOOEQjbirzAvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7897
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 3/4/2024 10:09 PM, Christian König wrote:
> Am 04.03.24 um 17:32 schrieb Arunpravin Paneer Selvam:
>> Add amdgpu driver as user for the drm buddy
>> defragmentation.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++++++++++++++--
>>   drivers/gpu/drm/drm_buddy.c                  |  1 +
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index e494f5bf136a..cff8a526c622 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>                          min_block_size,
>>                          &vres->blocks,
>>                          vres->flags);
>> -        if (unlikely(r))
>> -            goto error_free_blocks;
>> +        if (unlikely(r)) {
>> +            if (r == -ENOSPC) {
>> +                drm_buddy_defrag(mm, min_block_size);
>> +                r = drm_buddy_alloc_blocks(mm, fpfn,
>> +                               lpfn,
>> +                               size,
>> +                               min_block_size,
>> +                               &vres->blocks,
>> +                               vres->flags);
>
> That doesn't looks like something we should do.
>
> We might fallback when contiguous memory is requested, but certainly 
> not on normal allocation failure.
yes, defrag here not useful for normal allocations. But worried about 
the bigger min_block_size normal allocations.
In such cases, I think we should move this drm_buddy_defrag() call into 
buddy allocator file. For example if the required
size is 1024KiB and if min_block_size is 256KiB, the allocator first 
tries to find the 1024KiB block, when there is no single 1024KiB block,
the allocator goes one level below in freelist and tries to search for 
two 512KiB blocks and goes on. At one point of time if we have less space,
we might go further levels below to search four 256KiB blocks to satisfy 
the request.

Assuming if the allocator cannot find the first 256KiB block, that time 
I think we might need to merge the two 128KiB blocks
through defragmentation function. And again for the second 256KiB block, 
we might need to call the defragmentation again to
merge two 128KiB blocks or four 64KiB blocks to form minimum alignment 
size of 256KiB. This goes on for the third and fourth
256KiB blocks to complete the required size allocation of 1024KiB. 
Please let me know if my understanding is not correct.

Thanks,
Arun.
>
> Regards,
> Christian.
>
>> +                if (unlikely(r))
>> +                    goto error_free_blocks;
>> +            } else {
>> +                goto error_free_blocks;
>> +            }
>> +        }
>>             if (size > remaining_size)
>>               remaining_size = 0;
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 40131ed9b0cd..19440f8caec0 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -396,6 +396,7 @@ void drm_buddy_defrag(struct drm_buddy *mm,
>>           }
>>       }
>>   }
>> +EXPORT_SYMBOL(drm_buddy_defrag);
>>     /**
>>    * drm_buddy_free_block - free a block
>

