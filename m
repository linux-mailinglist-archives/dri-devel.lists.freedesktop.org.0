Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B62257514F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 17:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042CD11338E;
	Thu, 14 Jul 2022 15:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B807113387;
 Thu, 14 Jul 2022 15:00:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pv0tXzs0O883SjzTU01sudLQUTCfqbqDuzxuVSH92bvWm301dJssP26SXr/azzOFYR/StaIp/07qyK3F6E0COLTVFZWQoIaT9SFWhSWTMqj09mf1ELOng5/oMhW4rTtF3SDQ4GiaJHL+v8IYUs34IcnPefmDv/3Fg27RrXK2JS25cRfhOHow9T2RptdzXjYmEW6jEIxP2J9AY8/TlD/C9eE4Mj+BzTtUbzCnRXsQZD8kZSTwqxRh8hZuDLpL4wX9wbXGWPHiYjtem13P2s78HB74arkhglx7USg1Lpz91lwAsBRq3G1bvrSaOmZFYPQjku6fBYRAUTY7W8217J0EWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW6lwqp+xZoSb6DGvJ1ioxi050qii0JAOR+SFHHL+8o=;
 b=EnzWXK5Inx9wWsJe5LCl5uKV8PspbImNi1gXStbLDWOGcPG1oK/A6k9Q5wFtbeFqYQ2SNXCE3exfv8WJRPrdiURQptcFvCWbc7GPuMDaumVraeFPUVvkTLGoPmA7cNLcNQA1esW9FfmypB8m3wstPG7pWLIXhavjZfF+7BtiSn2L2+KqwuqzLBkQTC+0WSDmqiwiCrj4wBZYO3jULtZtiVVXcoZSeJTGsit9Qt04SHENSvJcJrwJl0Af6TlXZR4DVp4duN5QFWpAS8CQ5ZBkHzUThLV1wvUs6iMst1Cv7somXipHMYsY8FduDuq+ahIXociJPHNrQGjkl8ntTWmuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW6lwqp+xZoSb6DGvJ1ioxi050qii0JAOR+SFHHL+8o=;
 b=u4vE0tvwWSt2zAwNVJzvf7rBq/prlAsPRG9VrLtyxz8/feprkyurmO+n8J+NOdxeTCxfTXjkYQgSsSY0BvnJRFWxymm9z8dHz+cKbbbmnXRQVvjX5mDL6uJ4O+gI6mqf3WB4HrLxUBvprSmomnUPor3IPnn6WDE9/ah0tOmnQGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 15:00:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Thu, 14 Jul 2022
 15:00:39 +0000
Message-ID: <076231a3-38e9-e013-e106-aa926d009e77@amd.com>
Date: Thu, 14 Jul 2022 17:00:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] Revert "drm/amdgpu: add drm buddy support to amdgpu"
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220708102124.493372-1-Arunpravin.PaneerSelvam@amd.com>
 <20220714145423.721e1c3b@maurocar-mobl2>
 <83d9f973-abdd-3d8b-5955-84cfc3f49eea@amd.com>
 <CADnq5_MNkeG4E9ZXRLpgFQxrDN9jDhk7KYYHbjvtY-cUt5Kk8A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_MNkeG4E9ZXRLpgFQxrDN9jDhk7KYYHbjvtY-cUt5Kk8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0054.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::31) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cdd2a81-6399-476a-3b03-08da65a99d99
X-MS-TrafficTypeDiagnostic: PH7PR12MB6491:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /TqWAJMg5K0VdBSQ/wJePyDB4u1Ef1eshmWbZ4gNwKjJHCJ/B0/87k5Ml39vYBIvh9+p3eUvYxQNs+Vg2ZRCC4pg/CpUCOYZh7KgyoR0g3pqLc+W1+W6TXqf/GK8K8ke1/CcWV/x09W20/31kwaubJQoh7qt43JzxY9+3EE1kjjOzDaf0waKZhX42kSg8AOswhsbs77CIt23bU3P0nonqVbKU7570uqxKeGs7DvaIZRnISe4SIK/foqSGaVZQERYSPfrEyPdHTPv6KM7duj6JXJ0QnAhVquKK6jNIU7DHSEmkJ8t8Ji9NeE0Wf7i3SViO/UzUcf5mj9dNX7i9hE3b4/M9vztt0dy3JoU1HDkKJ0mqRVWUiqBdqxSD01CkYiiUP+KeQfYrKHQUrnbQO1LjAyXgqrBegfOcjUdKgCR237Hr2P/EipUSJ/kxRNVRjtXpnjjlkgm4AoK9AiioewTZHKcRoWaQKOiF4sQzOlRaWlAJZsf0ZQbi6piCKAO1QtgJFE/x66hPjHKSsr+EifgkI/JgJR1aeB1bvQKAVxjny9s4M7rykPrh87lgoK42M2wfq2lgpEM1r9gZY/2xfKysxAtC42KEHfh4Tquot88pKls8n2TPIxGj9BICAMzM1RqfceGkfcQL7feU0xJbKPruNZaeO6YAB1Caez3O/PQ7FuvzUVyi8Co6M9TT54Q9C6u/1cR0ifA/ose090XLJMlUhMWuLVhE0sANc0t8aJr/DZ8jQNzAAHObNcpJ/v8VYpuCKCpOC0IyIe7RgzCuKnMdsWuLDQX4P/zxn45p2IKbEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(45080400002)(6666004)(41300700001)(54906003)(6916009)(316002)(6512007)(2616005)(186003)(6506007)(36756003)(53546011)(31686004)(86362001)(31696002)(966005)(6486002)(478600001)(5660300002)(30864003)(2906002)(66946007)(38100700002)(66476007)(4326008)(66556008)(8676002)(8936002)(66574015)(83380400001)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlY3MVVja050RGl0Mjhkb2RidHdDZC9NdzJ4WWJrZjFRek1KNUpZaDBJbjRm?=
 =?utf-8?B?YkVlQzFZMDI0cGk0MWh6bjNnSWZiUFZCbXovWXJGYTh6SGNKd09QNFNDR2pQ?=
 =?utf-8?B?N1hoYUxGa1RpMHNxWHk2QTRXMDZRS1ZwM1E0UGF6aWd1OHFqVEdSVXJhbWFj?=
 =?utf-8?B?RmtvV01jR0R2MlNXNDRhLzlJWmo4cEZKNnVPeEtReGdNK1k1TmY5TEZiYVVX?=
 =?utf-8?B?WmR0Vyt2M3FleHBZZEtCMkRoS2h5elFMSWJJQmpWeGd1OG9zcUhjWFFaQkNl?=
 =?utf-8?B?TlFGYmdTZ29pQlN3Y2FUbmdwTnQ1SC95RHRoS2lJR3hnU2M4UUk5SVRPK3RI?=
 =?utf-8?B?SHRMT3JzRmtpMTZpRjZsWDY3WUFpNEpBNjJJTVBpd2ZTR0t1N0diWk9vaXlM?=
 =?utf-8?B?T2ZLUEVKZ01FTFhNTXlBRFNVb1FUTFlXTHBUSHpSd1A1cTJyS09OM3A3VHR0?=
 =?utf-8?B?UWZRRVhRMnNYYWVtVUUrRDd4Qm16MTROMjNCMVNJVmhPTFRMcWhxeGk2clUy?=
 =?utf-8?B?ODFQR0pBMTV0clZOKzBOTnFUaGVVNVdoWWlKdlFYZ0N1WGlmNkNVY01LU2Y5?=
 =?utf-8?B?aHNVSW9RN0dSODYyMDNOT2xqTmdZaHpYdTZMOUZaMXpJcFVjdmxBL0h1UVRZ?=
 =?utf-8?B?aGpNS0JiUWNqbnZHOTVlWjNZenhTWXNXQzdLcDJTUEpkYURkdlh5dUlHRzUw?=
 =?utf-8?B?bStzS0t5NmNnek0zWDVpK0NBUXYrbnlQNWxjM21XMjNaNnhKbFZmcDhzb3Rn?=
 =?utf-8?B?QnJUZVRDNUVkcTZ5SlcvbG9wODFVSmM1dUkycjVhaDZwb0xlUkNpUVlZTHFz?=
 =?utf-8?B?elUvUUhDbnNZNGk4OHJndVI1RGc1TnNFNHBscHJRaG5VUTNJOGJXWVJYdHRR?=
 =?utf-8?B?eUZCZi9aT0ZtRnhEbUxIZExGOUJGMGVEV0lXN0RIamx4aXA5VkJrZ3RSZGVH?=
 =?utf-8?B?SmxOTlVXT2Z6RGQyVng3VE9YaUlXbFF6dE02V25xR1BpSm0vQ2QzRmprR1pO?=
 =?utf-8?B?QXFvd21Jb0RkN0U5RldxMi9waEM3RXFJdlVSNCtWY24xYVFPQjBZZXhIOGpT?=
 =?utf-8?B?UE0rM3IrcHRsQkw3VUVMNkY3QzBwbWZiMjlsaFR2SmorM1pENFAwQTZZMXVx?=
 =?utf-8?B?WHcwUHBCcEIvanAveE92RS9XQ0ZHdjFPUWpWNGh6VnJwSmR3eEVnOFpnWXdV?=
 =?utf-8?B?RFI3VlNJWEx1RncrbUFaeU5Za1I2OW9hK3hvUjhkOCtWbUI2RzgxdzVOK3dX?=
 =?utf-8?B?K1hPTGtmTkt4NW93dHc4YmVFUGNLWEp4VTYxUVN4RHpVRUZYNmtPSHgxR2JD?=
 =?utf-8?B?ajc2cWYzUGRJTnFNRFF3OXJWVDZFbFRaL1Rmek81enNnWTZUeTA5ODR5VnBQ?=
 =?utf-8?B?RjhzWTZTbGdUaXh5T1RLWE1zRkZmazRFWGVpaTRmOEJUQXk3TjQrTUlGYVRt?=
 =?utf-8?B?SGRSODBtUGlPREdUb2NYaURycCtpSGdWYnRkS09kNjhTdkJZa0s2eGhYUFN2?=
 =?utf-8?B?TVZ1NnBZYk5qdDA5UlUweDZsMlN2L0pPUytCSVB1Sy9QVFk3dmFtM0hhZklr?=
 =?utf-8?B?SFc3NXd0SWlUTzVHbUpOVjc0RWtUY0JxeHJDeWFYbEcxNHhhbkxJSTAwVXRE?=
 =?utf-8?B?cDFIem5IbmQxMExsWGlzRG9qQXd0WUtUV2svbHg5MGFEOUI3d1oxS2IzTW85?=
 =?utf-8?B?d3NoeHFEcmE0ZWtzMzBZSW1nNS9Id1RZeGR6cFA4U2svRU5YeGl1TmpaREFK?=
 =?utf-8?B?MFZzRjI5eXhwdjNlSW9SNXZXWFd0QWJFMythQmw5NGYvSzYvWWlteXZmOTJU?=
 =?utf-8?B?VGVGeDgvc3RIVGZIUThkR0lDeFVSemVndVpjOUJqWGptY1NCL0xRYlhrWVhp?=
 =?utf-8?B?VlBzNWE2SHFTcFU0cTFScG9FbzRZbllSaktOUWwzUkhYQm4zRWRDNUtwKzYv?=
 =?utf-8?B?WGUvZU9GbEFzeWN3bmtuc3dwWk44aDJkQmx0WURnVTIrY1hYd1dVVmxWWExY?=
 =?utf-8?B?c1Y0UDhHeG44WlR0bk5BWm9ONXkwZnlWQktyLysyR0pBdWRmcmxNeThOMjdj?=
 =?utf-8?B?Vm1FbnpiUC9Fc1k1OU9Oc3YrTmZURExpUXJzK3RJaDBuOFVQOGxlbkxYNEJ6?=
 =?utf-8?B?aTJaamNKa00wNUg1ZHpDQS9QUlEzV0UvN2R2KzJNelB4ZVg3bU5YbVE1UUc4?=
 =?utf-8?Q?HKGU/k0zn8ZcgSjsQJAP6f92mYqZ2ybP2hV9FZ3B64dz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdd2a81-6399-476a-3b03-08da65a99d99
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 15:00:39.6477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JX9VfIIe2YZ6UF/BGen5kVDiZFIx0FzOxgVT9BGcLWA8u5cR93HcOOtzLx2QTzd8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.22 um 15:33 schrieb Alex Deucher:
> On Thu, Jul 14, 2022 at 9:09 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Hi Mauro,
>>
>> well the last time I checked drm-tip was clean.
>>
>> The revert is necessary because we had some problems with the commit
>> which we couldn't fix in the 5.19 cycle.
> Would it be worth reverting the revert and applying the actual fix[1]?
>   It's a huge revert unfortunately while the actual fix is like 10
> lines of code.  I'm concerned there will be subtle fallout from the
> revert due to how extensive it is.

We have other bug fixes and cleanups around that patch which didn't made 
it into 5.19 either. I don't want to create an ever greater mess.

Real question is why building drm-tip work for me but not for others?

Christian.

>
> [1] - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2Fuploads%2F564b2cc2b5ea87357f39e45c3a1a44e2%2F0001-drm-amdgpu-Fix-for-drm-buddy-memory-corruption.patch&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Cee3322f9e7c54aaabb9f08da659d74a2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637934024189075602%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=cGS2JZt84FMlA4V57pAA2ilXDC5pvr8ryZcUoHpXKXA%3D&amp;reserved=0
>
> Alex
>
>
>> I will double check drm-tip once more.
>>
>> Regards,
>> Christian.
>>
>> Am 14.07.22 um 14:54 schrieb Mauro Carvalho Chehab:
>>> On Fri, 8 Jul 2022 03:21:24 -0700
>>> Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>
>>>> This reverts the following commits:
>>>> commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into the C file")
>>>> commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new")
>>>> commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>>>>
>>>> [WHY]
>>>> Few users reported garbaged graphics as soon as x starts,
>>>> reverting until this can be resolved.
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> This revert is currently breaking drm-tip. Please revert it ASAP, as it
>>> is preventing CI bots to properly test new patches on the top of current
>>> drm-tip:
>>>
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_new’:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:459:13: error: ‘cur_size’ undeclared (first use in this function)
>>>     459 |         if (cur_size != size) {
>>>         |             ^~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:459:13: note: each undeclared identifier is reported only once for each function it appears in
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:459:25: error: ‘size’ undeclared (first use in this function); did you mean ‘ksize’?
>>>     459 |         if (cur_size != size) {
>>>         |                         ^~~~
>>>         |                         ksize
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:465:30: error: ‘vres’ undeclared (first use in this function); did you mean ‘res’?
>>>     465 |                 trim_list = &vres->blocks;
>>>         |                              ^~~~
>>>         |                              res
>>> In file included from ./include/linux/bits.h:22,
>>>                    from ./include/linux/ratelimit_types.h:5,
>>>                    from ./include/linux/ratelimit.h:5,
>>>                    from ./include/linux/dev_printk.h:16,
>>>                    from ./include/linux/device.h:15,
>>>                    from ./include/linux/dma-mapping.h:7,
>>>                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
>>> ./include/linux/container_of.h:19:54: error: invalid use of undefined type ‘struct drm_buddy_block’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |                                                      ^~
>>> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>>>      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>>         |                                                        ^~~~
>>> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |         ^~~~~~~~~~~~~
>>> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |                       ^~~~~~~~~~~
>>> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>>>     520 |         container_of(ptr, type, member)
>>>         |         ^~~~~~~~~~~~
>>> ./include/linux/list.h:542:9: note: in expansion of macro ‘list_entry’
>>>     542 |         list_entry((ptr)->prev, type, member)
>>>         |         ^~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:473:33: note: in expansion of macro ‘list_last_entry’
>>>     473 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
>>>         |                                 ^~~~~~~~~~~~~~~
>>> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>>>     295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>>         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>>>      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>>         |                                                        ^~~~
>>> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |         ^~~~~~~~~~~~~
>>> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |                       ^~~~~~~~~~~
>>> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>>>     520 |         container_of(ptr, type, member)
>>>         |         ^~~~~~~~~~~~
>>> ./include/linux/list.h:542:9: note: in expansion of macro ‘list_entry’
>>>     542 |         list_entry((ptr)->prev, type, member)
>>>         |         ^~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:473:33: note: in expansion of macro ‘list_last_entry’
>>>     473 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
>>>         |                                 ^~~~~~~~~~~~~~~
>>> In file included from ./include/uapi/linux/posix_types.h:5,
>>>                    from ./include/uapi/linux/types.h:14,
>>>                    from ./include/linux/types.h:6,
>>>                    from ./include/linux/kasan-checks.h:5,
>>>                    from ./include/asm-generic/rwonce.h:26,
>>>                    from ./arch/x86/include/generated/asm/rwonce.h:1,
>>>                    from ./include/linux/compiler.h:248,
>>>                    from ./include/linux/string.h:5,
>>>                    from ./include/linux/dma-mapping.h:6:
>>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type ‘struct drm_buddy_block’
>>>      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
>>>         |                                 ^~~~~~~~~~~~~~~~~~
>>> ./include/linux/container_of.h:22:28: note: in expansion of macro ‘offsetof’
>>>      22 |         ((type *)(__mptr - offsetof(type, member))); })
>>>         |                            ^~~~~~~~
>>> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>>>     520 |         container_of(ptr, type, member)
>>>         |         ^~~~~~~~~~~~
>>> ./include/linux/list.h:542:9: note: in expansion of macro ‘list_entry’
>>>     542 |         list_entry((ptr)->prev, type, member)
>>>         |         ^~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:473:33: note: in expansion of macro ‘list_last_entry’
>>>     473 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
>>>         |                                 ^~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:474:46: error: invalid use of undefined type ‘struct drm_buddy_block’
>>>     474 |                         list_move_tail(&block->link, &temp);
>>>         |                                              ^~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:480:41: error: implicit declaration of function ‘amdgpu_vram_mgr_block_size’; did you mean ‘amdgpu_vram_mgr_vis_size’? [-Werror=implicit-function-declaration]
>>>     480 |                         original_size = amdgpu_vram_mgr_block_size(block) - (size - cur_size);
>>>         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>>         |                                         amdgpu_vram_mgr_vis_size
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:483:28: error: passing argument 1 of ‘mutex_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     483 |                 mutex_lock(&mgr->lock);
>>>         |                            ^~~~~~~~~~
>>>         |                            |
>>>         |                            spinlock_t * {aka struct spinlock *}
>>> In file included from ./include/linux/rhashtable-types.h:14,
>>>                    from ./include/linux/ipc.h:7,
>>>                    from ./include/uapi/linux/sem.h:5,
>>>                    from ./include/linux/sem.h:5,
>>>                    from ./include/linux/sched.h:15,
>>>                    from ./include/linux/ratelimit.h:6:
>>> ./include/linux/mutex.h:199:38: note: expected ‘struct mutex *’ but argument is of type ‘spinlock_t *’ {aka ‘struct spinlock *’}
>>>     199 | extern void mutex_lock(struct mutex *lock);
>>>         |                        ~~~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:484:17: error: implicit declaration of function ‘drm_buddy_block_trim’ [-Werror=implicit-function-declaration]
>>>     484 |                 drm_buddy_block_trim(mm,
>>>         |                 ^~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:487:30: error: passing argument 1 of ‘mutex_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     487 |                 mutex_unlock(&mgr->lock);
>>>         |                              ^~~~~~~~~~
>>>         |                              |
>>>         |                              spinlock_t * {aka struct spinlock *}
>>> ./include/linux/mutex.h:218:40: note: expected ‘struct mutex *’ but argument is of type ‘spinlock_t *’ {aka ‘struct spinlock *’}
>>>     218 | extern void mutex_unlock(struct mutex *lock);
>>>         |                          ~~~~~~~~~~~~~~^~~~
>>> In file included from ./include/linux/rculist.h:10,
>>>                    from ./include/linux/pid.h:5,
>>>                    from ./include/linux/sched.h:14:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:493:29: error: ‘block’ undeclared (first use in this function); did you mean ‘flock’?
>>>     493 |         list_for_each_entry(block, &vres->blocks, link)
>>>         |                             ^~~~~
>>> ./include/linux/list.h:674:14: note: in definition of macro ‘list_for_each_entry’
>>>     674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>>>         |              ^~~
>>> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>>>     295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>>         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>>>      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>>         |                                                        ^~~~
>>> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |         ^~~~~~~~~~~~~
>>> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |                       ^~~~~~~~~~~
>>> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>>>     520 |         container_of(ptr, type, member)
>>>         |         ^~~~~~~~~~~~
>>> ./include/linux/list.h:531:9: note: in expansion of macro ‘list_entry’
>>>     531 |         list_entry((ptr)->next, type, member)
>>>         |         ^~~~~~~~~~
>>> ./include/linux/list.h:674:20: note: in expansion of macro ‘list_first_entry’
>>>     674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>>>         |                    ^~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:493:9: note: in expansion of macro ‘list_for_each_entry’
>>>     493 |         list_for_each_entry(block, &vres->blocks, link)
>>>         |         ^~~~~~~~~~~~~~~~~~~
>>> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>>>     295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>>         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>>>      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>>         |                                                        ^~~~
>>> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |         ^~~~~~~~~~~~~
>>> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |                       ^~~~~~~~~~~
>>> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>>>     520 |         container_of(ptr, type, member)
>>>         |         ^~~~~~~~~~~~
>>> ./include/linux/list.h:564:9: note: in expansion of macro ‘list_entry’
>>>     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>>>         |         ^~~~~~~~~~
>>> ./include/linux/list.h:676:20: note: in expansion of macro ‘list_next_entry’
>>>     676 |              pos = list_next_entry(pos, member))
>>>         |                    ^~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:493:9: note: in expansion of macro ‘list_for_each_entry’
>>>     493 |         list_for_each_entry(block, &vres->blocks, link)
>>>         |         ^~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:496:17: error: implicit declaration of function ‘amdgpu_vram_mgr_first_block’; did you mean ‘amdgpu_vram_mgr_virt_start’? [-Werror=implicit-function-declaration]
>>>     496 |         block = amdgpu_vram_mgr_first_block(&vres->blocks);
>>>         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>         |                 amdgpu_vram_mgr_virt_start
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:502:28: error: implicit declaration of function ‘amdgpu_vram_mgr_block_start’; did you mean ‘amdgpu_vram_mgr_virt_start’? [-Werror=implicit-function-declaration]
>>>     502 |         vres->base.start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
>>>         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>         |                            amdgpu_vram_mgr_virt_start
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:504:13: error: implicit declaration of function ‘amdgpu_is_vram_mgr_blocks_contiguous’ [-Werror=implicit-function-declaration]
>>>     504 |         if (amdgpu_is_vram_mgr_blocks_contiguous(&vres->blocks))
>>>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> cc1: all warnings being treated as errors
>>> make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o] Error 1
>>> make[4]: *** Waiting for unfinished jobs....
>>> make[3]: *** [scripts/Makefile.build:466: drivers/gpu/drm/amd/amdgpu] Error 2
>>> make[2]: *** [scripts/Makefile.build:466: drivers/gpu/drm] Error 2
>>> make[1]: *** [scripts/Makefile.build:466: drivers/gpu] Error 2
>>> make: *** [Makefile:1843: drivers] Error 2
>>> mchehab@sal /new_devel/v4l/tmp $ nano drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> mchehab@sal /new_devel/v4l/tmp $ make drivers/gpu/drm/amd/amdgpu/
>>>     DESCEND objtool
>>>     CALL    scripts/atomic/check-atomics.sh
>>>     CALL    scripts/checksyscalls.sh
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.o
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.o
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.o
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.o
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.o
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.o
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.o
>>> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:30:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:29:8: error: redefinition of ‘struct amdgpu_vram_mgr’
>>>      29 | struct amdgpu_vram_mgr {
>>>         |        ^~~~~~~~~~~~~~~
>>> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu.h:73,
>>>                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:28:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:41:8: note: originally defined here
>>>      41 | struct amdgpu_vram_mgr {
>>>         |        ^~~~~~~~~~~~~~~
>>> In file included from ./include/linux/bits.h:22,
>>>                    from ./include/linux/ratelimit_types.h:5,
>>>                    from ./include/linux/ratelimit.h:5,
>>>                    from ./include/linux/dev_printk.h:16,
>>>                    from ./include/linux/device.h:15,
>>>                    from ./include/linux/dma-mapping.h:7,
>>>                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘to_amdgpu_device’:
>>> ./include/linux/build_bug.h:78:41: error: static assertion failed: "pointer type mismatch in container_of()"
>>>      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>>         |                                         ^~~~~~~~~~~~~~
>>> ./include/linux/build_bug.h:77:34: note: in expansion of macro ‘__static_assert’
>>>      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>>>         |                                  ^~~~~~~~~~~~~~~
>>> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |         ^~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:49:16: note: in expansion of macro ‘container_of’
>>>      49 |         return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
>>>         |                ^~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_do_reserve’:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:244:29: error: initialization of ‘struct drm_mm *’ from incompatible pointer type ‘struct drm_buddy *’ [-Werror=incompatible-pointer-types]
>>>     244 |         struct drm_mm *mm = &mgr->mm;
>>>         |                             ^
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: At top level:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:273:5: error: conflicting types for ‘amdgpu_vram_mgr_reserve_range’; have ‘int(struct amdgpu_vram_mgr *, uint64_t,  uint64_t)’ {aka ‘int(struct amdgpu_vram_mgr *, long long unsigned int,  long long unsigned int)’}
>>>     273 | int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>>>         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:129:5: note: previous declaration of ‘amdgpu_vram_mgr_reserve_range’ with type ‘int(struct amdgpu_vram_mgr *, uint64_t,  uint64_t)’ {aka ‘int(struct amdgpu_vram_mgr *, long long unsigned int,  long long unsigned int)’}
>>>     129 | int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>>>         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_reserve_range’:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:286:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     286 |         spin_lock(&mgr->lock);
>>>         |                   ^~~~~~~~~~
>>>         |                   |
>>>         |                   struct mutex *
>>> In file included from ./include/linux/wait.h:9,
>>>                    from ./include/linux/pid.h:6,
>>>                    from ./include/linux/sched.h:14,
>>>                    from ./include/linux/ratelimit.h:6:
>>> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     347 | static __always_inline void spin_lock(spinlock_t *lock)
>>>         |                                       ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:289:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     289 |         spin_unlock(&mgr->lock);
>>>         |                     ^~~~~~~~~~
>>>         |                     |
>>>         |                     struct mutex *
>>> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     387 | static __always_inline void spin_unlock(spinlock_t *lock)
>>>         |                                         ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: At top level:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:305:5: error: conflicting types for ‘amdgpu_vram_mgr_query_page_status’; have ‘int(struct amdgpu_vram_mgr *, uint64_t)’ {aka ‘int(struct amdgpu_vram_mgr *, long long unsigned int)’}
>>>     305 | int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>>         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:131:5: note: previous declaration of ‘amdgpu_vram_mgr_query_page_status’ with type ‘int(struct amdgpu_vram_mgr *, uint64_t)’ {aka ‘int(struct amdgpu_vram_mgr *, long long unsigned int)’}
>>>     131 | int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>>         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_query_page_status’:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:311:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     311 |         spin_lock(&mgr->lock);
>>>         |                   ^~~~~~~~~~
>>>         |                   |
>>>         |                   struct mutex *
>>> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     347 | static __always_inline void spin_lock(spinlock_t *lock)
>>>         |                                       ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:331:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     331 |         spin_unlock(&mgr->lock);
>>>         |                     ^~~~~~~~~~
>>>         |                     |
>>>         |                     struct mutex *
>>> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     387 | static __always_inline void spin_unlock(spinlock_t *lock)
>>>         |                                         ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_new’:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:377:29: error: initialization of ‘struct drm_mm *’ from incompatible pointer type ‘struct drm_buddy *’ [-Werror=incompatible-pointer-types]
>>>     377 |         struct drm_mm *mm = &mgr->mm;
>>>         |                             ^
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:429:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     429 |         spin_lock(&mgr->lock);
>>>         |                   ^~~~~~~~~~
>>>         |                   |
>>>         |                   struct mutex *
>>> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     347 | static __always_inline void spin_lock(spinlock_t *lock)
>>>         |                                       ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:458:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     458 |         spin_unlock(&mgr->lock);
>>>         |                     ^~~~~~~~~~
>>>         |                     |
>>>         |                     struct mutex *
>>> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     387 | static __always_inline void spin_unlock(spinlock_t *lock)
>>>         |                                         ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:460:13: error: ‘cur_size’ undeclared (first use in this function)
>>>     460 |         if (cur_size != size) {
>>>         |             ^~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:460:13: note: each undeclared identifier is reported only once for each function it appears in
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:460:25: error: ‘size’ undeclared (first use in this function); did you mean ‘ksize’?
>>>     460 |         if (cur_size != size) {
>>>         |                         ^~~~
>>>         |                         ksize
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:466:30: error: ‘vres’ undeclared (first use in this function); did you mean ‘res’?
>>>     466 |                 trim_list = &vres->blocks;
>>>         |                              ^~~~
>>>         |                              res
>>> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>>>     295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>>         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>>>      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>>         |                                                        ^~~~
>>> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |         ^~~~~~~~~~~~~
>>> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |                       ^~~~~~~~~~~
>>> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>>>     520 |         container_of(ptr, type, member)
>>>         |         ^~~~~~~~~~~~
>>> ./include/linux/list.h:542:9: note: in expansion of macro ‘list_entry’
>>>     542 |         list_entry((ptr)->prev, type, member)
>>>         |         ^~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:474:33: note: in expansion of macro ‘list_last_entry’
>>>     474 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
>>>         |                                 ^~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:485:38: error: passing argument 1 of ‘drm_buddy_block_trim’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     485 |                 drm_buddy_block_trim(mm,
>>>         |                                      ^~
>>>         |                                      |
>>>         |                                      struct drm_mm *
>>> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:27:
>>> ./include/drm/drm_buddy.h:146:44: note: expected ‘struct drm_buddy *’ but argument is of type ‘struct drm_mm *’
>>>     146 | int drm_buddy_block_trim(struct drm_buddy *mm,
>>>         |                          ~~~~~~~~~~~~~~~~~~^~
>>> In file included from ./include/linux/rculist.h:10,
>>>                    from ./include/linux/pid.h:5:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:29: error: ‘block’ undeclared (first use in this function); did you mean ‘flock’?
>>>     494 |         list_for_each_entry(block, &vres->blocks, link)
>>>         |                             ^~~~~
>>> ./include/linux/list.h:674:14: note: in definition of macro ‘list_for_each_entry’
>>>     674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>>>         |              ^~~
>>> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>>>     295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>>         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>>>      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>>         |                                                        ^~~~
>>> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |         ^~~~~~~~~~~~~
>>> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |                       ^~~~~~~~~~~
>>> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>>>     520 |         container_of(ptr, type, member)
>>>         |         ^~~~~~~~~~~~
>>> ./include/linux/list.h:531:9: note: in expansion of macro ‘list_entry’
>>>     531 |         list_entry((ptr)->next, type, member)
>>>         |         ^~~~~~~~~~
>>> ./include/linux/list.h:674:20: note: in expansion of macro ‘list_first_entry’
>>>     674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>>>         |                    ^~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:9: note: in expansion of macro ‘list_for_each_entry’
>>>     494 |         list_for_each_entry(block, &vres->blocks, link)
>>>         |         ^~~~~~~~~~~~~~~~~~~
>>> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>>>     295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>>         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>>>      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>>         |                                                        ^~~~
>>> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |         ^~~~~~~~~~~~~
>>> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>>>      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>>         |                       ^~~~~~~~~~~
>>> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>>>     520 |         container_of(ptr, type, member)
>>>         |         ^~~~~~~~~~~~
>>> ./include/linux/list.h:564:9: note: in expansion of macro ‘list_entry’
>>>     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>>>         |         ^~~~~~~~~~
>>> ./include/linux/list.h:676:20: note: in expansion of macro ‘list_next_entry’
>>>     676 |              pos = list_next_entry(pos, member))
>>>         |                    ^~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:9: note: in expansion of macro ‘list_for_each_entry’
>>>     494 |         list_for_each_entry(block, &vres->blocks, link)
>>>         |         ^~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:520:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     520 |         spin_unlock(&mgr->lock);
>>>         |                     ^~~~~~~~~~
>>>         |                     |
>>>         |                     struct mutex *
>>> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     387 | static __always_inline void spin_unlock(spinlock_t *lock)
>>>         |                                         ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_del’:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:545:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     545 |         spin_lock(&mgr->lock);
>>>         |                   ^~~~~~~~~~
>>>         |                   |
>>>         |                   struct mutex *
>>> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     347 | static __always_inline void spin_lock(spinlock_t *lock)
>>>         |                                       ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:554:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     554 |         spin_unlock(&mgr->lock);
>>>         |                     ^~~~~~~~~~
>>>         |                     |
>>>         |                     struct mutex *
>>> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     387 | static __always_inline void spin_unlock(spinlock_t *lock)
>>>         |                                         ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: At top level:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:680:10: error: conflicting types for ‘amdgpu_vram_mgr_vis_usage’; have ‘uint64_t(struct amdgpu_vram_mgr *)’ {aka ‘long long unsigned int(struct amdgpu_vram_mgr *)’}
>>>     680 | uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>>>         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:128:10: note: previous declaration of ‘amdgpu_vram_mgr_vis_usage’ with type ‘uint64_t(struct amdgpu_vram_mgr *)’ {aka ‘long long unsigned int(struct amdgpu_vram_mgr *)’}
>>>     128 | uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr);
>>>         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_debug’:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:701:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     701 |         spin_lock(&mgr->lock);
>>>         |                   ^~~~~~~~~~
>>>         |                   |
>>>         |                   struct mutex *
>>> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     347 | static __always_inline void spin_lock(spinlock_t *lock)
>>>         |                                       ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:702:22: error: passing argument 1 of ‘drm_mm_print’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     702 |         drm_mm_print(&mgr->mm, printer);
>>>         |                      ^~~~~~~~
>>>         |                      |
>>>         |                      struct drm_buddy *
>>> In file included from ./include/drm/ttm/ttm_range_manager.h:8,
>>>                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:26:
>>> ./include/drm/drm_mm.h:551:40: note: expected ‘const struct drm_mm *’ but argument is of type ‘struct drm_buddy *’
>>>     551 | void drm_mm_print(const struct drm_mm *mm, struct drm_printer *p);
>>>         |                   ~~~~~~~~~~~~~~~~~~~~~^~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:703:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     703 |         spin_unlock(&mgr->lock);
>>>         |                     ^~~~~~~~~~
>>>         |                     |
>>>         |                     struct mutex *
>>> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     387 | static __always_inline void spin_unlock(spinlock_t *lock)
>>>         |                                         ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_init’:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:721:39: error: initialization of ‘struct amdgpu_vram_mgr *’ from incompatible pointer type ‘struct amdgpu_vram_mgr *’ [-Werror=incompatible-pointer-types]
>>>     721 |         struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>>>         |                                       ^
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:729:21: error: passing argument 1 of ‘drm_mm_init’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     729 |         drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
>>>         |                     ^~~~~~~~
>>>         |                     |
>>>         |                     struct drm_buddy *
>>> ./include/drm/drm_mm.h:467:33: note: expected ‘struct drm_mm *’ but argument is of type ‘struct drm_buddy *’
>>>     467 | void drm_mm_init(struct drm_mm *mm, u64 start, u64 size);
>>>         |                  ~~~~~~~~~~~~~~~^~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:730:24: error: passing argument 1 of ‘spinlock_check’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     730 |         spin_lock_init(&mgr->lock);
>>>         |                        ^~~~~~~~~~
>>>         |                        |
>>>         |                        struct mutex *
>>> ./include/linux/spinlock.h:341:24: note: in definition of macro ‘spin_lock_init’
>>>     341 |         spinlock_check(_lock);                  \
>>>         |                        ^~~~~
>>> ./include/linux/spinlock.h:322:67: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     322 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
>>>         |                                                       ~~~~~~~~~~~~^~~~
>>> In file included from ./include/linux/spinlock.h:87:
>>> ./include/linux/spinlock_types.h:41:9: error: incompatible types when assigning to type ‘struct mutex’ from type ‘spinlock_t’ {aka ‘struct spinlock’}
>>>      41 |         (spinlock_t) __SPIN_LOCK_INITIALIZER(lockname)
>>>         |         ^
>>> ./include/linux/spinlock.h:342:20: note: in expansion of macro ‘__SPIN_LOCK_UNLOCKED’
>>>     342 |         *(_lock) = __SPIN_LOCK_UNLOCKED(_lock); \
>>>         |                    ^~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:730:9: note: in expansion of macro ‘spin_lock_init’
>>>     730 |         spin_lock_init(&mgr->lock);
>>>         |         ^~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_fini’:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:749:39: error: initialization of ‘struct amdgpu_vram_mgr *’ from incompatible pointer type ‘struct amdgpu_vram_mgr *’ [-Werror=incompatible-pointer-types]
>>>     749 |         struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>>>         |                                       ^
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:760:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     760 |         spin_lock(&mgr->lock);
>>>         |                   ^~~~~~~~~~
>>>         |                   |
>>>         |                   struct mutex *
>>> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     347 | static __always_inline void spin_lock(spinlock_t *lock)
>>>         |                                       ~~~~~~~~~~~~^~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:768:25: error: passing argument 1 of ‘drm_mm_takedown’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     768 |         drm_mm_takedown(&mgr->mm);
>>>         |                         ^~~~~~~~
>>>         |                         |
>>>         |                         struct drm_buddy *
>>> ./include/drm/drm_mm.h:468:37: note: expected ‘struct drm_mm *’ but argument is of type ‘struct drm_buddy *’
>>>     468 | void drm_mm_takedown(struct drm_mm *mm);
>>>         |                      ~~~~~~~~~~~~~~~^~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:769:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>>>     769 |         spin_unlock(&mgr->lock);
>>>         |                     ^~~~~~~~~~
>>>         |                     |
>>>         |                     struct mutex *
>>> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>>>     387 | static __always_inline void spin_unlock(spinlock_t *lock)
>>>         |                                         ~~~~~~~~~~~~^~~~
>>> cc1: all warnings being treated as errors
>>> make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o] Error 1
>>> make[4]: *** Waiting for unfinished jobs....
>>>     CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.o
>>> make[3]: *** [scripts/Makefile.build:466: drivers/gpu/drm/amd/amdgpu] Error 2
>>> make[2]: *** [scripts/Makefile.build:466: drivers/gpu/drm] Error 2
>>> make[1]: *** [scripts/Makefile.build:466: drivers/gpu] Error 2
>>> make: *** [Makefile:1843: drivers] Error 2
>>>
>>> Regards,
>>> Mauro

