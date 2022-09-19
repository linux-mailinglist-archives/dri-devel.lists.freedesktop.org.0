Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B05BD08B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C30210E66B;
	Mon, 19 Sep 2022 15:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ADA10E66D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 15:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIw2LKGv8jCBZH7bbamOA8IGt2UXr3sNi/WpdEbANW/9vGN8oADut+KiKdqN64my8+xlL1DQNGFnZcQHz+ZEgilD3HgeMj4kRRJpUWdExF+c+AU2rfC19jrrDNqiO3PwO7Ujl7N/NF17JctAlu2STwoHvMui1jhEzlH4yx+LFuYluoui16db1D4y711Sj3cLjfIRmdBkyEmpwTUoIp2nFjxJNuUiHqZ939AKe/hLR1HQ1HZtzaW8CUOpvzj7VLEIGjwQtg2KgrvZUXGEaVihydrjoEDO2TUOke31i9248qzxCv5UvdXl3L/RbBoRdrwmysRFWc9ARdt0NlljUZkssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmAmsbGODLoW0XOBcyxtf//HsCDluq/wkCfsX0RXqMk=;
 b=JWZPWWOpEQaDrm6MRViwECXXAV0HRyP37txSyKKKAhBKrSi00MBrW+f7xBT9/jSmcKwXxjy+UgMnAJvrrIUuw17s/56LIEt/9KhAOmTbUFOXVDZl6GlQ+ZhluccBp+3MTJ4ggMh753ZF3P9rEY17gk/OIYkJqQPSTbIihTNLK7Yh8eCRnWFLO2cGE+y4RdcnEGJF7NXJ5ahxFQnzS3wrbDinlA7f4knWz50izn/MbnMvWen0TabvEm12MXaLtL5WeFkDxE29xJqlEEiBGcqp/UcrCNzCWavKHMN7Zq+ZkMGGg3J0VpEtc3y8oCAqaj40Q6Tb1cMcadlCwhM2B4KQJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmAmsbGODLoW0XOBcyxtf//HsCDluq/wkCfsX0RXqMk=;
 b=QEuVJktp2zXSXxyWa3GEHYw+q2K4hVNUSpKiAgt5HUenlJ+UIsF52XR/54sJogLhW0fRfURbBOtfvh9SH+ZIS7M8fvRnk9mHFn/3sQyyDVujcVxfjnWeTfOB3n80OWiaivA0kMRdNtuU+wjRZdJ9s7nBU0hdrMOfjvFHZK5V34Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 15:19:50 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 15:19:50 +0000
Message-ID: <f528a8e4-5162-66d5-09da-5252076882b8@amd.com>
Date: Mon, 19 Sep 2022 11:19:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] A simple doc fix
Content-Language: en-US
To: Anup K Parikh <parikhanupk.foss@gmail.com>, skhan@linuxfoundation.org,
 airlied@linux.ie, daniel@ffwll.ch
References: <YyGuwqpuwq+PT3K1@autolfshost>
 <5372b154-dc25-a917-9908-c59555afc865@amd.com> <YyIq8mXKXP1kCoLS@autolfshost>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <YyIq8mXKXP1kCoLS@autolfshost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::31) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|IA1PR12MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9b495f-04ea-46e9-db23-08da9a526521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8KX9RRiiq/EU1F7RFwhSl4D6ked4AIqV6/xfGGmjeyx4qMdE3sJunoD0gQLS9pR1M3uHWlFBKkyxvYS2J1TWzOEsxWUFihs7Ufm8FK38ov0bA3moMQajwTp486/10aHPIRwArHZGRybEN11AD6/Ny7/AUyzkKVh7tQyxLTnoqpWTWu2kqKE41jXZdnDMgyFN5DZxWppZuY3k4HmhpwJ8853PiI4EQfYHEVs6DeimtOo0OlP8cTgKQdYySSHKq7gYYRNwyAX5L0QFFhoyE9FTrsZM65pPdCZNwC2sIHnoQe6ilhA47i1zFmr+eHzAjSG8Y4eorfUUqedZgKsch26Zd20vZGmwvjZF0hrvMvxh3IUtXxvCkk74j18rvouI3Lij24PHeF1uKW/vDzpav2cZ3rYrP6HY+Fx4a6LMd2vAfRxlCHcSLP+7+90/bSqDaNSVFvLozmtdTho4k6+JpudZe0E5Dofsg1N31GpXA0QLxcE0BcaMfcl2mD1m3obWNoRtVuslq5BRujFqAGV+oi2hjEmNFAYOs+cTYT+i3ez9cf+4XZ6AB8yLI6tW+WalIhgv1/f/772ea0tHBEIFAy/rea+TUEhXEwoYuGm03G0FzrDmBbkj2xBlNsfiwag1NSQ1POeXy0QsqCHg+EKa5dfEbYVRszB8+e/L5yhGJZc0n2SWutltA88VRRIp7BNpf55mGek1tvslA6AOleplvm81DJlhXhwmmPPo7oJqNwjOibWJUG7uzTkFQTPW/SB1jWRFo4xB6Ep0BhZZMmiwCo+jGXZT1kg2ytIXL/r+reJIZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199015)(186003)(2616005)(86362001)(83380400001)(38100700002)(8936002)(66946007)(41300700001)(44832011)(66556008)(66476007)(4326008)(8676002)(31696002)(2906002)(5660300002)(6666004)(6512007)(6506007)(53546011)(316002)(6486002)(478600001)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEFrZ3FQTFJiZkZELzdWNUt3T2VIT28xSmlySVEzU0tZYjR5K3JYT09GS0wr?=
 =?utf-8?B?N2Z1VWJDN29BQ29qUTRVSjZLVnJXd0R0K2Q3UzhHUkhEdDVDMGV5bE9tMm1J?=
 =?utf-8?B?a1k3dk1hR21DN2FYNlRtWUJzcnJWeWtKOTZTdWYzTTQ5Y3IxamMvRkI1TDZQ?=
 =?utf-8?B?WnJPOE5idE5FUXdXUDgrZm5jQkx1bHVBcEp2QVdCYkNJK3RwUVJ0U2xPemJ6?=
 =?utf-8?B?aDFzaWpoVUVSQ0xiVm9uREpZNjVQZmwrQi9KakpRby9ML1RDNjRvbTM2Qng0?=
 =?utf-8?B?V1dpNWhZWDZ5Tlg2b3hqVUp2M1ljeXo1UmlGdjFkdzFaT0FSQTA5ekRmK2lO?=
 =?utf-8?B?VDdLWlpFMTZiM2lNU05JZldSblRuSm5zdk5FaEJPdXE3YklNRTJmREMwQkxS?=
 =?utf-8?B?Qml4YmgwMFIvYlBQUHNEd2lyNEFSUEtEcTlmTk9Yek9CSDhheTd0T1ZmTGZO?=
 =?utf-8?B?NnNhZWdyK3IzZlhUU1JQUVpXRERkcDVRcmdXYWw2c29GMW1peE0xL0U1dFE0?=
 =?utf-8?B?cm1LeGd1aUszdEhHeW5LNEM0bFdoMnIxai9SeHBnVlVNc0tNblJISDFFZ1U4?=
 =?utf-8?B?d3VpNjlwcGpGSW5qZk85ZnBiUEg4SmxrRms5MFMzSFF2alcwUE5rLy9mRy9L?=
 =?utf-8?B?bHh0Zi9QdU91OTNRb2RpUURhK1ZyeUZtTUNCY1hCOGpNNThOLzFKQUNWNHVk?=
 =?utf-8?B?SFJidFRFU3BGcC9vTzRlcEZ6L05UeldiYklXdEZES056bitjWlZLK2w3R2ZJ?=
 =?utf-8?B?bTVBS2tCQjJmZkFpUE5vTmc3TmJEYW1qWjduMnZWTCtTOFZOdlo4ajAzU0U2?=
 =?utf-8?B?NUVQeFdhV0tLRGUvTHAzZzNsOFJtM2FDUjh0UTJzZm1kSENiY083NlJvYjhV?=
 =?utf-8?B?N09PSHEvbWJyZkdMaFlUamNHYjM1eHVTZEVubDNTZ08wSFJaenZWREN4MXdj?=
 =?utf-8?B?VFQ5NDhxUFo4KzdybWx5Y011Vi9JQ0tsb0g2MkJkK3NtMkhVKzhJUkVBV3Rn?=
 =?utf-8?B?QmJ2WjRlVDFKSkRJVHpHUHJPMTBvTUFPa3R5TkI5cHd2Z0JaNHlQWHBsNmY3?=
 =?utf-8?B?NmpoMVNxNkRWQmtCWmNLdzJuMTV3ditzOU1DbG85bTMrN1loclBJUzZRWVRG?=
 =?utf-8?B?SndEWGE0Z1BlNEg3WmwzOHF0SnBzZFp4NlBWV2ZCbm9vbEZwdFRldXdhQ1RI?=
 =?utf-8?B?NzU2cjg1VFdtV2RvQWFlR0xuc3E5VnBtcUxIVDFRQ1VidzRsUDE5Q3JQSGNS?=
 =?utf-8?B?UFc5eGlqWlRDeTg0OVhFdUxBV3AwWUZwQzhZaXVXNEhxSmpxWTBFRUp4L2dV?=
 =?utf-8?B?QXFzeEt6bmZuTTQyVUdOMGhkTlhiTVp3UXNuNU1GNmhteWlpWHRVK1dYQzhQ?=
 =?utf-8?B?VjhGY1k0SWJ2SXV3dVl6YzNpTlFQdUNkM2RSVW5IdGFzYzF2cGNGendJUzBw?=
 =?utf-8?B?enVOMmlIWkRxV2EzeHJQY0U5K0svY2NJZnJmdjYyalIrVThUSDYwSHhvMnBj?=
 =?utf-8?B?Y0lnK3dZWVJrZVpMeW9HcG8vaWQxbkhBSHBNL0cvTjJZcDBaaGNvT3pNK2gy?=
 =?utf-8?B?Y1dOYXBwUXc5dHREaTJPZVdjTmNJd0tYQi9yUThPVkhVZk1FaFFIK2RSdUhT?=
 =?utf-8?B?am9iUGZpWmdrbnRBWWprYitiMWdKSko5aGRqSDYwRU5Wa2hEOHd1MkExUlJ5?=
 =?utf-8?B?NDBsTGNlazRxZk5hclZ0RnVVYkt3RUZ3U0NydHlTRDBxQWg5Qy9NbCttNjZo?=
 =?utf-8?B?aGNzMVlFUDJYOWMrMHBLR1FDWER0MExZczR6L042VjNKYXNWdEJCRmY1UENG?=
 =?utf-8?B?TXA3N1hXWEIwUEpIL2k0eXl6cUM2QUMxM3I0SGZzUGtpelJOZnFOVkZXSzNr?=
 =?utf-8?B?RERtMDFSejlVV3hCWVkzL01CWjJTQ2t3UGZOeTB4SVU3N0pzY2ZBUlVGY0Y3?=
 =?utf-8?B?Y0pLOHZHa3NlRDNGcjFWdVMvcWRWV0xFSE0xOTRjN3hsaTVkQVhBaTAwUXBO?=
 =?utf-8?B?WTBvcU8yL05ZTlJMcHp5enBmU1V0Um02SFRnK3JGZThyS3krR2pmTDBOemFD?=
 =?utf-8?B?emNSNmV1WHJibElzNkR0Uy96QitldWIwYkw2ZWY1Wko3b1FqOWRobG9hamJo?=
 =?utf-8?B?N3ByTGlKUU52c29aSmZnNXdkaWRJMGJwVlpPYXR0TmplY3lzU1ZZeTh5VXNm?=
 =?utf-8?Q?A8w/jS13RzZY8T8tGEdT24IS5HqDI1RvyX9yOicWBjI8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9b495f-04ea-46e9-db23-08da9a526521
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 15:19:50.2934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cQOSblUlQV17DunrWcRtHnmjp6qtbbiC40oetWRrtG3F4NlElzSiiJ0FfdtEBwGosfA0PR15PGyVuBZs3vlww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-09-14 15:26, Anup K Parikh wrote:
> On Wed, Sep 14, 2022 at 10:24:36AM -0400, Andrey Grodzovsky wrote:
>> On 2022-09-14 06:36, Anup K Parikh wrote:
>>> Fix two warnings during doc build which also results in corresponding
>>> additions in generated docs
>>>
>>> Warnings Fixed:
>>> 1. include/drm/gpu_scheduler.h:462: warning: Function parameter or member
>>>      'dev' not described in 'drm_gpu_scheduler'
>>> 2. drivers/gpu/drm/scheduler/sched_main.c:1005: warning: Function
>>>      parameter or member 'dev' not described in 'drm_sched_init'
>>>
>>> Signed-off-by: Anup K Parikh <parikhanupk.foss@gmail.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 1 +
>>>    include/drm/gpu_scheduler.h            | 1 +
>>>    2 files changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 68317d3a7a27..875d00213849 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -994,6 +994,7 @@ static int drm_sched_main(void *param)
>>>     *		used
>>>     * @score: optional score atomic shared with other schedulers
>>>     * @name: name used for debugging
>>> + * @dev: A device pointer for use in error reporting in a multiple GPU scenario.
>>
>> Why multiple GPUs scenario ? It's also used in single GPU scenario.
>>
>> Andrey
>>
>>
> Hello Mr. Andrey Grodzovsky,
>
> Thanks for the quick review and response.
>
> My documentation string (same for both files) is based on commit id
> 8ab62eda177bc350f34fea4fcea23603b8184bfd. It seemed that both warnings
> might've been introduced by the addition of that device pointer.
>
> Also, the commit message specifically mentions this addition for use with
> DRM_DEV_ERROR() to make life easier under a multiple GPU scenario. So, I
> used cscope to look for DRM_DEV_ERROR() and then for drm_dev_printk(). I
> also checked previous versions of both files and noticed DRM_ERROR() in
> drivers/gpu/drm/scheduler/sched_main.c changed to DRM_DEV_ERROR().
>
> Perhaps, I wrongly correlated my cscope/history findings with the commit
> message and used absolute wording. I guess that this might be (I usually
> avoid absolute wording) useful not only in a single GPU scenario (to print
> better standardized messages with dev when available) but also in non-error
> printing such as with KERN_NOTICE, KERN_INFO, etc. I'm still not sure if
> the added device pointer could be used for something else besides printing.
>
> Please let me know if my understanding is correct and whether I should
> change the wording to:
>
> A device pointer - primarily useful for printing standardized messages with
> DRM_DEV_ERROR().

It could be used for many other things but in this case in deed used 
only for the print.
So yep - looks good.

Andrey


>>>     *
>>>     * Return 0 on success, otherwise error code.
>>>     */
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index addb135eeea6..920b91fd1719 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -435,6 +435,7 @@ struct drm_sched_backend_ops {
>>>     * @_score: score used when the driver doesn't provide one
>>>     * @ready: marks if the underlying HW is ready to work
>>>     * @free_guilty: A hit to time out handler to free the guilty job.
>>> + * @dev: A device pointer for use in error reporting in a multiple GPU scenario.
>>>     *
>>>     * One scheduler is implemented for each hardware ring.
>>>     */
