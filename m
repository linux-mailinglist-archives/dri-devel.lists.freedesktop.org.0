Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2665B2113
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9477A10E359;
	Thu,  8 Sep 2022 14:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D928826D;
 Thu,  8 Sep 2022 14:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAEpouEWBXqIltfur+DZX2KPKGZVbWXrc8S1EV6RLpa1NqthLJopb2MV03ispsqMDeLaSRgf59DMyvhvlyfKDyI3z/RA7T9ewA6OV2KIHL2yTVhLoSvqa3/3qhTbmMK5mjxDJ7TUkI72bSFShEbxd/tVBdniTgfii23KJsieXePZi+l4eYkogmPAFK+6GIkGUaw+/u+w8acisjvozRMe7qnSIkQmXXMzNWbCxdswmysDl6gsMxrNW5aYWUGbJu+9xbcxmLPAeTHLlg8wkSUtyB4O16RZkAUFi9jhrrHPSRRb2N+oGNXOxwEnoMiBl2WIb5E1yJML7j1mGw9d1oUY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faqd28eZNt8VO53gtihiqoDD2o6kqeE8h0fvnL7YQdA=;
 b=ZlWCNReRA3s5iT25sD390D2ME4lthSco6kDQ7BFMqvmUY3s4WrfD/rXHDa7/VCFol97EBr/w056D7hKVVrt1+OPkFVTI8gOTtfmuZ5XF3E5FL6iIKos5YNYMLrK5MUWH913JTy+PEg79yCpyIPC9L9Fhaylhkh1RlY3FZwrO5SrX+by6mE1TgVxGrhh60vcRYr4rPy33lGuqAqIzm0tIwceYtvSYbZ5SYSWsCMCWtLnXF0BxsDwctPDVG2ctZyeBytBdXyazU1q1g7qVxAxN9eRCSbspMiWnz+o/7NkNPm8c9ApER0roN2yHT0NbdaGze1875gpgmPRhFUYqCWC+Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faqd28eZNt8VO53gtihiqoDD2o6kqeE8h0fvnL7YQdA=;
 b=Da7XvyG/FEDs1AtMpKU6N+wLGMR69mgFFAp5XeAP6zUFoiWyzuQTCfp7gua+g1sX6Gd0+fHw6vr68OMiyAxugiMUkY9peRdf1NwuRKL+fV8Z70RfZw3mAFRLsMUaxmVMbXYYIziiNBfdp2gSCdLfeRZl035dAPKhCvL9qDTKT28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by SA1PR12MB6869.namprd12.prod.outlook.com (2603:10b6:806:25d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 8 Sep
 2022 14:45:37 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d503:c616:dcf8:2ae8]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d503:c616:dcf8:2ae8%8]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 14:45:36 +0000
Message-ID: <5fda9947-953e-2cd7-ff39-314cbb4766a0@amd.com>
Date: Thu, 8 Sep 2022 10:45:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] drm/sched: returns struct drm_gpu_scheduler ** for
 drm_sched_pick_best
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
 <79af80cb-7438-1105-c24e-d3a874a0b4ca@amd.com>
 <f0f334ce-ca38-8a84-330e-c586fd813f58@amd.com>
 <afc9c570-b57b-87db-2d00-90376a030a66@amd.com>
From: James Zhu <jamesz@amd.com>
In-Reply-To: <afc9c570-b57b-87db-2d00-90376a030a66@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:207:3d::16) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb37a3ab-a210-41f0-8613-08da91a8ca9e
X-MS-TrafficTypeDiagnostic: SA1PR12MB6869:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s82o0I1ax8mso8LayBGJ5H+st5F7sp8BXrXOvqWWLmi4Iwsn5NuUwh1fuoCQwxkdvYWR1YrK3p/u8uE7n5BpyJX7LTjyscafqTGNJSG8B+fCyg8HL1Em4N66twZZX01kzVq0uR5zUqrXn2BgMW0F7O92S8cex3CQ4aKExefVkkmk2LG2xUtoS5kKvNWGBEcHfSPOYrbA8AJIY0v4B5m/tncTGCbfffmbtyXZ/mfShlx7RM+80U+fSflpsOdSnP7XqOaIz14Cpt++W86ozj4yEe+mxQ/QNypM7SWjouUSeS+LjbGiVqAB91iW6JlFrXFPcnK93siKMyQgfyZB0AgM5kTsgB3nM1OCO4BfqwbvwaBT1fpCClg2/vK14eNI9y9HO+T+Zb+Hm4mtnCZct8JMKtuwWido6pDSJkTZUO7+TpigVDFgMuVGIfExX+4Jhh0YrK2eKeYn/FT+i1XBnDtkosgiEBiryt2vT9RJ9Xrl56XAKxcH4jbj31NSPoNuTXONWGNZHN2V8SObpJje5WA/LDM7TFqqrNL6dAosKQkNmMmuBTW1GhgPWtHYRxgn7sQ4qInwcTeyJQmrRBj5N+EuvIcLMu3UrEIgCBO692P0G7FZUdXoMZ4RdJTDSKjHfMfN/wRl9+Nk1RcvDo+qJowVfKmxES8Bfa6gr6KPBFbpiKPHKcjOVSm+jbj2pIGwMVQQcM9Ie74wE7VlV3vsdU0NnCLzlHM5z0Xt7ZPCbeWHKphCMYcwchuLrXoHW6eobnIdMTNk4LqTNK0UnZJaks40MK4JAub/Gzcc9R0fM2/MDit5ytDPph/bE9eTJTvPqBPSbFfWMqfPZb2Rr3yXX/NURpAzwKcOeu0MGv2PkuUQatE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(66946007)(38100700002)(83380400001)(31686004)(110136005)(66476007)(6486002)(36756003)(4326008)(8676002)(316002)(450100002)(478600001)(66556008)(5660300002)(31696002)(8936002)(53546011)(26005)(186003)(41300700001)(2616005)(2906002)(6506007)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjZJUk1ncEZWZytRakZSenFYOTRnRy9ZdXpjY2ZKallETXVxU0I4Yk1GcG9i?=
 =?utf-8?B?d1laMmZSK2Vsb1dGM3V3L2pHODNVS05zWlQwUkVrNTFlYmpRUjNmemxQNlZS?=
 =?utf-8?B?SnNKRTlOV0Exc1pxb3QzeEduVEl1bzdWZVBGd2xFUE83YldTYTFHRzlCOWRz?=
 =?utf-8?B?cnRULyt1cVcveDBpOXhWU1lHMUtnQ0xpbUlUWUpqblJna25ncllxTUUya0Nw?=
 =?utf-8?B?RTM4Mk5NbzkvM2RSaFJPbkpPcVZtT3J0cHdtQzVYeG9VZjRvQjlJVDAyMTZs?=
 =?utf-8?B?ek0rSkhyaUROOVNnN2xIVHBvZk9xRmUrdDFLMG56WE9LbHVRNms1bDcwaTdY?=
 =?utf-8?B?QlIyTEowSkNYS2lkSWZPaU8zbWJvUWtFVVhubHZHaHAvK2pocTg2RmkrdTZK?=
 =?utf-8?B?Y3AwS1pXcW1WbXFicVVBUm50YWFWWmlmVGFlTXc2eW5lL2o4cFdDbnAzTnBz?=
 =?utf-8?B?K0xBMHZZcStKQy91SXNMd0grbEgxN2h3MnFkYUE4SWtyK1NGd0srcUZIY1Av?=
 =?utf-8?B?SlN1RU00NXBlZmlVT0tGdU85Vkx5UHUvMThlbXhyNHpMTjdvVThwUWN5Vm5k?=
 =?utf-8?B?dm40VjZvNUwwQ0ErbmREYk5ibWxxWDdpMW1rRjU2L015Ykc0NHNkWXNlYWgy?=
 =?utf-8?B?WlRmK0dGb0VRamorM2NiT0J5dEgzUk5FczdTSXJoUjFiVk5RTkNaN2k5YkQv?=
 =?utf-8?B?YllJb3JXWkdCYnphLzFyaDFUTHdVYzE3b04rNm1FeUlIL1lQdHZwaUxQU0la?=
 =?utf-8?B?YlJvMGZBNEVrdUM1K3l0SnVab3NMSE45ellEVjVxQmc0RWszTUpiNFNFMjcr?=
 =?utf-8?B?UEpWb1V6M1l4WnNnV2RkMmRrWGJQMmFGVFB2QTMySEt0VG9PWGJsdlZjZTlu?=
 =?utf-8?B?Ui80K0piRzZubDlSR3V0bUJGVWp5THJ2LytiQ0xHVkw3T2wzVGlXVnhzQ2hu?=
 =?utf-8?B?cWhVR0NGeE9xcHV6dW5jRlNLWUQvODVVQ2pwQzBPQWNXS2crdEFQdnNrS216?=
 =?utf-8?B?RlQzOW9HSmJqYXJ5TnVjZGVuUWFXTkJ5Z255WnBvbWJLZHZWRmZkQVBKeFlV?=
 =?utf-8?B?bDQzRjZiNG5ScnE5ZFBUN2hRdkovWkg3L29mZmlqd0Q3d3R3M1U4Z1QwbUVu?=
 =?utf-8?B?bkFWUTM4cDNLTnZYeU05Mk5qM2lOZm5SY1ZNUzZIZ2dEdXhkaFhMQWpBV1F0?=
 =?utf-8?B?bmlxQ2c3cExUejVweG45R0g2Z1UySi92VmFma0VROGUrZ2lLVlNhZnUzRkxu?=
 =?utf-8?B?aDAyamF6RnlSbCs5aXo4R1lsdnNRM0ZqaXJPbyt3S1l1NERBYVRhUGtPQVdV?=
 =?utf-8?B?eEZnWkVweVJRMjJNT0dFcDdxcUdFL1R3VFlLYnZjeDZ6dE53aWZoV3JQSlNa?=
 =?utf-8?B?MGUwVFRaeitCZkFKSzRQNjVDc25vb3IxRzdubExjalpLbFRUdlpqZ2NCdTIy?=
 =?utf-8?B?cTNQVHArNnVIdmR1V1hOV0lJWXBKeW0rNVJCaU5KQzdMWVNzUUdNL2hISmlW?=
 =?utf-8?B?M2NmK3VkSzFzYmp0MUduUHRacHFDL1dMZERibnB0eVFYZ2NtVE9zWEhWWXZm?=
 =?utf-8?B?SUsvWDJjbUltdHBjQnNxK3Bpa2t0eDZyRDRUYjZPaDBBV082Nk9PbkJvWkZz?=
 =?utf-8?B?cytGYzVtcFZLZ3VaOHlHU3prS3REMXVhWTBKdXc5ODNTZWpnSjJJd3UzVG9W?=
 =?utf-8?B?ak42REJEdk1oS0pCaFlrWUpDTERuaDRJV1poaDJISVV4bmNRSnVodW1pNUc5?=
 =?utf-8?B?VFFydlZpVnFpdC95VGtBaHFDSjFKVlczSUhvZkQrZmVTVHFaeE1aOTJFVHpw?=
 =?utf-8?B?c1AyWHlhemZIcnhLcjhIUEZiLzBYMkVTVXZCTm5aalUwei9jZkZVVHpPeVJz?=
 =?utf-8?B?ZHNHWFh3Ni8wRnZIUXZJd3JqVzFLRDcvYWRybkpGU2ZFVmFZK3pBYnB6TndT?=
 =?utf-8?B?TU5pa3VBOEhSVU8yeHhOVHgvSlNmbVJ5OHIrd0QrR1U0Sm91NFk5ZVhRL3Zz?=
 =?utf-8?B?VGVLSFFsaFVTOWFUZUVRNkRJV1ZXUStKSlBrK2VFS0JmVm9iU2ZJdGd5d3Ex?=
 =?utf-8?B?RWFWUTcrNjdraFl4a1A2eHhGdjUwTE1VTUVpcEtxTmZGTGNKYU82OXZ3aUZo?=
 =?utf-8?Q?V3x4H/KQvgS54x9gRqeZmZM/X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb37a3ab-a210-41f0-8613-08da91a8ca9e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 14:45:36.7984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HewL899EiqyKL3bYvkgTM+8DBfoBgDshtjgYl9PLClMPwd3lub8WKcbOyIY42PAW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6869
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To save lines is not the purpose.

Also I want to use entity->sched_list to track ring which is used in 
this ctx in amdgpu_ctx_fini_entity

Best Regards!

James

On 2022-09-08 10:38 a.m., Andrey Grodzovsky wrote:
> I guess it's an option but i don't really see what's the added value  
> ? You saved a few lines in this patch
> but added a few lines in another. In total seems to me no to much 
> difference ?
>
> Andrey
>
> On 2022-09-08 10:17, James Zhu wrote:
>> Hi Andrey
>>
>> Basically this entire patch set are derived from patch [3/4]: 
>> entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>
>> I think no special reason to treat single and multiple schedule list 
>> here.
>>
>> Best Regards!
>>
>> James
>>
>> On 2022-09-08 10:08 a.m., Andrey Grodzovsky wrote:
>>> What's the reason for this entire patch set ?
>>>
>>> Andrey
>>>
>>> On 2022-09-07 16:57, James Zhu wrote:
>>>> drm_sched_pick_best returns struct drm_gpu_scheduler ** instead of
>>>> struct drm_gpu_scheduler *
>>>>
>>>> Signed-off-by: James Zhu <James.Zhu@amd.com>
>>>> ---
>>>>   include/drm/gpu_scheduler.h | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index 0fca8f38bee4..011f70a43397 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -529,7 +529,7 @@ void drm_sched_fence_finished(struct 
>>>> drm_sched_fence *fence);
>>>>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler 
>>>> *sched);
>>>>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>>>                           unsigned long remaining);
>>>> -struct drm_gpu_scheduler *
>>>> +struct drm_gpu_scheduler **
>>>>   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>                unsigned int num_sched_list);
