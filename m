Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C994875B7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 11:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F21A112809;
	Fri,  7 Jan 2022 10:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02C2112702
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 10:37:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRQV6sq+3rcv+/EF9e8BbeN0poiSqMg7zegHFZBas/7fowbodTd4E3hXs0xQlIYJr9/6bT28LqdsncJTqxR8aFaATH/YLgBb9Wz6hhMHUzGthjJ0lXRWXIZ3Tn3UDzqNj/38RU2c4pltxD38eDN3ndc2WdyZj7nTbj1u1HPgz3ek5YhbP5Z/fTjkKXoQcy2B3f6z41fwXHzg9PGoSAMO8c8qQMxOc8XwY9Anu799ZB/kSWeNRsFGcowqzODbeUFCe/WD2MVKQ0NovjQ6Kkt9abd6ITzbnIFCItplMwb4cXMDqatcjKGGP+szxkFD6hj0KcQeKApQYX9NT4DrmefRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ef5HYRCvyIYsIUAUwkjiyght50vTjpXsKdE3Izc/G8=;
 b=KjgGxIhlmauope0MnBA6Cprtpyrqh134dACFiZv5b8D3FpChjZBiWD4jYsylbvRoDbn9Eo54Vz69Wn2PvEWTTLd7LJOVBWdlpbJUTaQPCFYQZCBEIW898gpD4SczdgxEqZw0AiGKCEbsTj12I3sq0D12TDGRU/t7uT/ZEyU/IQ3GFu5NadIFD7sArdmm4KCH4crW2W6fD8+X7nl3BZPn4b+h1cEDJ/qTVtgbNTT0YABBC9C6uWuENp1SbLdYiHFWguApMFRCOA+TMfIxvvDofXHZiy8KWoovg8m8SDh3gosyalREjCjKPjaBLkE8b88lUSA1V5zEQCNFJF2KRF1rOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ef5HYRCvyIYsIUAUwkjiyght50vTjpXsKdE3Izc/G8=;
 b=zPtj6l7ZdVkIvPkOqVucYRT6uRDZVNs0n2yl1AgodbuIkfVc1yUNX5AKKnxc1VbuflNHdiA+X5zhq8itutOmlNM0UqLCDJb2i6ZBySRU01P0UIRz0ct2mrgnPJgmqei56uXxjAJfR93aK8IDOneNwzsyAAi5RWbOoRjOwg1o7Fc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1901.namprd12.prod.outlook.com
 (2603:10b6:300:113::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 10:37:12 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 10:37:12 +0000
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b331e020-fc08-47db-4429-929c8867aa5c@amd.com>
Date: Fri, 7 Jan 2022 11:37:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR0502CA0041.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90fc342b-0b01-4186-6c3e-08d9d1c9a97e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1901:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB19016DF8FF44E0000E4B3705834D9@MWHPR12MB1901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6pt66WhM/DMJ4d3ygr06fwHyHXDCD2ap4uCie+jXq6alVNqkaaM8ZyVEsVpjQHG2gKi3y2LOtt9a4vp7oKc3dF7zCIdcg8oOCeCkgRDpjwSV78/mIsDt4zR0I5gypMaRU9v4TaHKkL0mK5t8dKHCqKwKx6+XGU+5l31P3Ec6V3ttQrksiqncXP3KOV7dzXzrMPmC0eAJxbEKS1MXLHAfcyCL9kkj6YZQmxcJPLlDRFkLYOLtJLPy2ClgkqcsxmPmMgcnNKUnOCZKA6yBX9yidNuj9BNeRUSF1vHdsg76GWrNEmswffkLZFZIQ3pcTCX3DxI+Y5AgZgbL7m8Zgc6cGLDzabeZ2rbkVQK8dHGYLan53RLLUcbp1U/lPnzYRMQxgMRaFgxpwqHrLqWqHM7xXn352SwrRnvOB/AtaFjYhvPrqaeNGXB2wW5i+HqjDkxs3klFp8hFOvKwbOSnEycSPinbsS7fh2mrOC2JqfS7RnoJ7GU/EwMKifNyNasbx2aJ84E18aJSNwsRsnzt2cm7IaejyIdr8a0ckyD2nhXp0rsX+vMntccqnvE/Fgl1jXS2QPd/m16h7xdmvngxsv8sRzRxf0S12AJW42gKogKOmTP+a77XB64QIM7irFhxEhqeNWErJr7V9NQFIjt9TUrfY0lPzY66qxR1G6hjyHhaqiOYbRjbZ6ySIhzuzTQXFKSUYK8WWgU3Qg6BHOtRRTilw4W9onz7m64/zTID4bjjc+QJi+XiKWXYLSBT0o9MnvS3ezAfD9mstVJdZr6WvFNUHFzjPl/CRnV3Vhqqr60h7NGtLr9gqitW+Gv6HXTejffPG06m0TWSqVIxyOFkaH/2tjljjJ3w9wp8Vj6oS8+hsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(4326008)(45080400002)(31686004)(66946007)(31696002)(110136005)(5660300002)(6512007)(86362001)(8676002)(54906003)(8936002)(83380400001)(19627235002)(66574015)(36756003)(316002)(2616005)(6486002)(4001150100001)(966005)(6666004)(186003)(508600001)(38100700002)(30864003)(6506007)(2906002)(43740500002)(45980500001)(579004)(559001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elhybStlcStZMk5SeUJBMDNYb1dHYzNkUUJ5TUhhUlRhVEd0dVp2VVlEdDBa?=
 =?utf-8?B?aFlyeUJvcEVWaVg1cnorTzQya0xWeW5yeFlVMjN2VTQrMWttcjlkb28weG1z?=
 =?utf-8?B?dDZGZW1QZFBpZ1h0VG5XTzExa1VISHg4ZlRrd3RxbVQzRnlUbUFjcllDc3h1?=
 =?utf-8?B?blNwY1F6M3BjM1lhYlROZ3BhNU9Ud2ZoZHAwMG5wT3RrUmUrNmMzZ0ticlRS?=
 =?utf-8?B?VXc5UncvdG1UdTlDWldUanRrMDFmd3pmUUZtb0dmdGZwck9ObzFpbzRSYnpz?=
 =?utf-8?B?bmZMT3lJeVd2dDJiT29GS2lnekNzUFh4LzF1bUVFMEtMWGg4Z3RHTld6azBk?=
 =?utf-8?B?SXRoMEFRUjNhQk1laTF1d0FqZ0dyeklNUGw3bCtadkExS3VGbC9nMm1KWE5F?=
 =?utf-8?B?ODlFTmtBQ2xaS2k1Z2VPWWd6WkU5NHdzT3huaThsT1laQkRuQkR4d2UrUHZ4?=
 =?utf-8?B?ZFBDMXgyelBrVkl5akZjV3ByRVJBZ0Z2Z2VqTURRc3BKRjVmYzdzTExxTm9j?=
 =?utf-8?B?V2RkaUZRbEZqa0ErWC9JTjA0YVhXams3d0MyNktDSTFHVVQ0TFA3ckVDQWpW?=
 =?utf-8?B?SENkUm1FL1pxNjNHb2JTbFV1MnpXY09tdUlia0w1Q2dsRUVDZmVTalVvejJw?=
 =?utf-8?B?SDJQbjkvVFZnbkFnbFlHUVZkMFUwVEpkNFpNTUVsQks2aUcwaFlSTllrTFlt?=
 =?utf-8?B?akgxcnQxZ291UmxNTmdhdjU0S3NyS2hpYXpNbnJIYU1iajluOVYzSmZuaUhG?=
 =?utf-8?B?ai9TSFh6YjF3SDhNK0didmFjcllhWURUWEx3SStvOGNYVXZCVjNWa1pRejNo?=
 =?utf-8?B?L2VrVGtzWEJUYTFVTnIxNkh5OStPdEZjZmFDaHFMcFhRaXZTTTJWOXVJZXpo?=
 =?utf-8?B?c2F3M2x0REJBUXZxbUpKNWFFL1BPUEJKZzNiT2FUdzhjaW1WU0FqOTd0Q1R2?=
 =?utf-8?B?K0hVS3htbG1VMEVxSlJkWklMVTNaYzR2aTBIUm9FSzNnWnI2RDM4Zjg2MVMr?=
 =?utf-8?B?N2NEK0Z1OHlxQmVqQjZJUXZNNnRZQWpYY3NEMDh1aG9MVEZHRVhRTWs1azVZ?=
 =?utf-8?B?UlV6YmZkS0ZxYlFCNUNYcklWV0JxUzhkdEQweFN1R0txcHMyb2x1OE5DeHJR?=
 =?utf-8?B?a0R3dEFndlFIWFo3d2tHbzlrV2V1UlJYRWMwWDRZNUY0WDVWN1VwREg0L3px?=
 =?utf-8?B?eTZzY01KRFJNYTRBOXc4RHB6VE9sUXNIQ25pSzRMdjFxb2FySTdFWVVnWEhj?=
 =?utf-8?B?RmtNL0RwOXdrMTZRc25hSzV1RHZwUExYMG4zZEpmcStvZ1I1TXBNNTR5TTFW?=
 =?utf-8?B?UUxTaVJWcFlSYzJGTHRnV1VCL3FPR1M4YnJBd3hqTDBpeVhNRVdMdkFZMEp2?=
 =?utf-8?B?NjZzZ2p3ckRBall4Vks1a084U3BERWpONGMyVGhBM21uVjVPTDY1NnhkTkVZ?=
 =?utf-8?B?eG1JVUg2UjdqRWZuV3VEaW5oVEcxcEwyOVRKY3hsWGZiOXhIVy9LZ205ZEtR?=
 =?utf-8?B?MVg1R3hRWkJNcEczaVpvS2x1SG9YRzQ4ZXAxSmZmNkhBS3pDWUxYR3dDVGk5?=
 =?utf-8?B?YytTOFNqcWMvNlBSTlllUWNOVC8yc0tUUEYvd1lKb1ovNDF1WXN4Snp1Sitn?=
 =?utf-8?B?MGJMUUpsdXhtbWtjS0tNRGlvN3kvTE1qQjdQMHJpRUd6dmdFb0JDbEs4RldZ?=
 =?utf-8?B?RHFza0dpWkZ3ZEtrUzc5VlUxd21IVHVZZnBONFl2a3lySXJhYjhxL2UrbVQ0?=
 =?utf-8?B?MHZzaUlLUCsxU3luTkxpNGZLZ0lxdkVuNjZEN1hweGJLUWtyV1BWbU1PQVd2?=
 =?utf-8?B?c2w5V2RWdHNyYjFZK3ZsTWdYRVA3Q2tRbC9sTWJwbllqSklLd3lMOW12cFhs?=
 =?utf-8?B?OC96TkZUWFNCOGExUGtETDd1NUxyT054Q2FuVmRVUHU0b3dFODVuL1duazFh?=
 =?utf-8?B?cDFrVlE5aGhXSUQrdWtqTkJiSWFwTVdMRnJ6SmV0T0F5ZGxpc2xoTzJ4TW1Q?=
 =?utf-8?B?d1E0Q0R4c0pPT2tmalRBcmZZa3dmMlgvSm9HUmlDeE4zZm1OSGRHNFM1d0xC?=
 =?utf-8?B?Tm55RFZObHA2T3NKQ3pJTmpqNnorRmdsSHpRMlh1c1lkQkdLelZWT3d6cEg2?=
 =?utf-8?B?eHp0TVlXZ2ZpMGxDRlBjZEp1Wm9FSUlGNFM3SGFkQi9OTjYrNkNjai92bTI2?=
 =?utf-8?Q?6kTWo5nUx8kbf/B4Krdj8Ug=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fc342b-0b01-4186-6c3e-08d9d1c9a97e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 10:37:11.9401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQBsFh9EyLqnxFSYQhfvIhEWLaSZgw7/ou2kllbEZFo0u9/BU15gJd7mn0mPY/EW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1901
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

Am 07.01.22 um 07:12 schrieb Dave Airlie:
> Hi Linus,
>
> I'm on holiday next week, so I thought I'd pre-send the main DRM pull request.
>
> This may mean by the time you pull it there'll be some funkier merge
> conflicts. I've done a test merge with your tree + drm-fixes merged,
> and pushed it out.
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2F~airlied%2Flinux%2Flog%2F%3Fh%3Ddrm-next-5.17-merged&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C89ff952b65d94adfdbb108d9d1a4a9f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637771328393603229%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=jiPu%2BOeY4Vd%2F2Y2PaNhftVPYNPHHIivFdgOcMGAyfyw%3D&amp;reserved=0
>
> nouveau_fence.c is the only conflict I've seen and I've taken the result from
> our rerere cache in the merge above. It's non trivial, would be good to have
> Christian confirm it as well.

Yes that's the correct thing to do.

The nouveau driver has a dependency on the order of the fences which 
only worked by coincident previously and now needs a non-trivial workaround.

Thanks,
Christian.

>
> There is one tegra soc tree and some bcm 2835 patches in here. Not sure if the
> tegra one is also coming via an alternate soc path.
>
> Highlights are support for privacy screens found in new laptops,
> a bunch of nomodeset refactoring, i915 enables ADL-P systems by default, while
> starting to add RPL-S support. vmwgfx adds GEM and support for OpenGL
> 4.3 features
> in userspace. Lots of internal refactorings around dma reservations,
> and lots of driver
> refactoring as well.
>
> I'll possibly have email next week depending on some other circumstances, but
> assume I'm out and Daniel will take care of anything urgent, and I'll
> return next
> week to supply fixes and anything I've missed before rc1 itself
>
> Dave.
>
> drm-next-2022-01-07:
> drm for 5.17-rc1
>
> core:
> - add privacy screen support
> - move nomodeset option into drm subsystem
> - clean up nomodeset handling in drivers
> - make drm_irq.c legacy
> - fix stack_depot name conflicts
> - remove DMA_BUF_SET_NAME ioctl restrictions
> - sysfs: send hotplug event
> - replace several DRM_* logging macros with drm_*
> - move hashtable to legacy code
> - add error return from gem_create_object
> - cma-helper: improve interfaces, drop CONFIG_DRM_KMS_CMA_HELPER
> - kernel.h related include cleanups
> - support XRGB2101010 source buffers
>
> ttm:
> - don't include drm hashtable
> - stop pruning fences after wait
> - documentation updates
>
> dma-buf:
> - add dma_resv selftest
> - add debugfs helpers
> - remove dma_resv_get_excl_unlocked
> - documentation
> - make fences mandatory in dma_resv_add_excl_fence
>
> dp:
> - add link training delay helpers
>
> gem:
> - link shmem/cma helpers into separate modules
> - use dma_resv iteratior
> - import dma-buf namespace into gem helper modules
>
> scheduler:
> - fence grab fix
> - lockdep fixes
>
> bridge:
> - switch to managed MIPI DSI helpers
> - register and attach during probe fixes
> - convert to YAML in several places.
>
> panel:
> - add bunch of new panesl
>
> simpledrm:
> - support FB_DAMAGE_CLIPS
> - support virtual screen sizes
> - add Apple M1 support
>
> amdgpu:
> - enable seamless boot for DCN 3.01
> - runtime PM fixes
> - use drm_kms_helper_connector_hotplug_event
> - get all fences at once
> - use generic drm fb helpers
> - PSR/DPCD/LTTPR/DSC/PM/RAS/OLED/SRIOV fixes
> - add smart trace buffer (STB) for supported GPUs
> - display debugfs entries
> - new SMU debug option
> - Documentation update
>
> amdkfd:
> - IP discovery enumeration refactor
> - interface between driver fixes
> - SVM fixes
> - kfd uapi header to define some sysfs bitfields.
>
> i915:
> - support VESA panel backlights
> - enable ADL-P by default
> - add eDP privacy screen support
> - add Raptor Lake S (RPL-S) support
> - DG2 page table support
> - lots of GuC/HuC fw refactoring
> - refactored i915->gt interfaces
> - CD clock squashing support
> - enable 10-bit gamma support
> - update ADL-P DMC fw to v2.14
> - enable runtime PM autosuspend by default
> - ADL-P DSI support
> - per-lane DP drive settings for ICL+
> - add support for pipe C/D DMC firmware
> - Atomic gamma LUT updates
> - remove CCS FB stride restrictions on ADL-P
> - VRR platform support for display 11
> - add support for display audio codec keepalive
> - lots of display refactoring
> - fix runtime PM handling during PXP suspend
> - improved eviction performance with async TTM moves
> - async VMA unbinding improvements
> - VMA locking refactoring
> - improved error capture robustness
> - use per device iommu checks
> - drop bits stealing from i915_sw_fence function ptr
> - remove dma_resv_prune
> - add IC cache invalidation on DG2
>
> nouveau:
> - crc fixes
> - validate LUTs in atomic check
> - set HDMI AVI RGB quant to full
>
> tegra:
> - buffer objects reworks for dma-buf compat
> - NVDEC driver uAPI support
> - power management improvements
>
> etnaviv:
> - IOMMU enabled system support
> - fix > 4GB command buffer mapping
> - close a DoS vector
> - fix spurious GPU resets
>
> ast:
> - fix i2c initialization
>
> rcar-du:
> - DSI output support
>
> exynos:
> - replace legacy gpio interface
> - implement generic GEM object mmap
>
> msm:
> - dpu plane state cleanup in prep for multirect
> - dpu debugfs cleanups
> - dp support for sc7280
> - a506 support
> - removal of struct_mutex
> - remove old eDP sub-driver
>
> anx7625:
> - support MIPI DSI input
> - support HDMI audio
> - fix reading EDID
>
> lvds:
> - fix bridge DT bindings
>
> megachips:
> - probe both bridges before registering
>
> dw-hdmi:
> - allow interlace on bridge
>
> ps8640:
> - enable runtime PM
> - support aux-bus
>
> tx358768:
> - enable reference clock
> - add pulse mode support
>
> ti-sn65dsi86:
> - use regmap bulk write
> - add PWM support
>
> etnaviv:
> - get all fences at once
>
> gma500:
> - gem object cleanups
>
> kmb:
> - enable fb console
>
> radeon:
> - use dma_resv_wait_timeout
>
> rockchip:
> - add DSP hold timeout
> - suspend/resume fixes
> - PLL clock fixes
> - implement mmap in GEM object functions
> - use generic fbdev emulation
>
> sun4i:
> - use CMA helpers without vmap support
>
> vc4:
> - fix HDMI-CEC hang with display is off
> - power on HDMI controller while disabling
> - support 4K@60Hz modes
> - support 10-bit YUV 4:2:0 output
>
> vmwgfx:
> - fix leak on probe errors
> - fail probing on broken hosts
> - new placement for MOB page tables
> - hide internal BOs from userspace
> - implement GEM support
> - implement GL 4.3 support
>
> virtio:
> - overflow fixes
>
> xen:
> - implement mmap as GEM object function
>
> omapdrm:
> - fix scatterlist export
> - support virtual planes
>
> mediatek:
> - MT8192 support
> - CMDQ refinement
> The following changes since commit 2585cf9dfaaddf00b069673f27bb3f8530e2039c:
>
>    Linux 5.16-rc5 (2021-12-12 14:53:01 -0800)
>
> are available in the Git repository at:
>
>    git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-01-07
>
> for you to fetch changes up to cb6846fbb83b574c85c2a80211b402a6347b60b1:
>
>    Merge tag 'amd-drm-next-5.17-2021-12-30' of
> ssh://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-12-31
> 10:59:17 +1000)
>
> ----------------------------------------------------------------
> drm for 5.17-rc1
>
> core:
> - add privacy screen support
> - move nomodeset option into drm subsystem
> - clean up nomodeset handling in drivers
> - make drm_irq.c legacy
> - fix stack_depot name conflicts
> - remove DMA_BUF_SET_NAME ioctl restrictions
> - sysfs: send hotplug event
> - replace several DRM_* logging macros with drm_*
> - move hashtable to legacy code
> - add error return from gem_create_object
> - cma-helper: improve interfaces, drop CONFIG_DRM_KMS_CMA_HELPER
> - kernel.h related include cleanups
> - support XRGB2101010 source buffers
>
> ttm:
> - don't include drm hashtable
> - stop pruning fences after wait
> - documentation updates
>
> dma-buf:
> - add dma_resv selftest
> - add debugfs helpers
> - remove dma_resv_get_excl_unlocked
> - documentation
> - make fences mandatory in dma_resv_add_excl_fence
>
> dp:
> - add link training delay helpers
>
> gem:
> - link shmem/cma helpers into separate modules
> - use dma_resv iteratior
> - import dma-buf namespace into gem helper modules
>
> scheduler:
> - fence grab fix
> - lockdep fixes
>
> bridge:
> - switch to managed MIPI DSI helpers
> - register and attach during probe fixes
> - convert to YAML in several places.
>
> panel:
> - add bunch of new panesl
>
> simpledrm:
> - support FB_DAMAGE_CLIPS
> - support virtual screen sizes
> - add Apple M1 support
>
> amdgpu:
> - enable seamless boot for DCN 3.01
> - runtime PM fixes
> - use drm_kms_helper_connector_hotplug_event
> - get all fences at once
> - use generic drm fb helpers
> - PSR/DPCD/LTTPR/DSC/PM/RAS/OLED/SRIOV fixes
> - add smart trace buffer (STB) for supported GPUs
> - display debugfs entries
> - new SMU debug option
> - Documentation update
>
> amdkfd:
> - IP discovery enumeration refactor
> - interface between driver fixes
> - SVM fixes
> - kfd uapi header to define some sysfs bitfields.
>
> i915:
> - support VESA panel backlights
> - enable ADL-P by default
> - add eDP privacy screen support
> - add Raptor Lake S (RPL-S) support
> - DG2 page table support
> - lots of GuC/HuC fw refactoring
> - refactored i915->gt interfaces
> - CD clock squashing support
> - enable 10-bit gamma support
> - update ADL-P DMC fw to v2.14
> - enable runtime PM autosuspend by default
> - ADL-P DSI support
> - per-lane DP drive settings for ICL+
> - add support for pipe C/D DMC firmware
> - Atomic gamma LUT updates
> - remove CCS FB stride restrictions on ADL-P
> - VRR platform support for display 11
> - add support for display audio codec keepalive
> - lots of display refactoring
> - fix runtime PM handling during PXP suspend
> - improved eviction performance with async TTM moves
> - async VMA unbinding improvements
> - VMA locking refactoring
> - improved error capture robustness
> - use per device iommu checks
> - drop bits stealing from i915_sw_fence function ptr
> - remove dma_resv_prune
> - add IC cache invalidation on DG2
>
> nouveau:
> - crc fixes
> - validate LUTs in atomic check
> - set HDMI AVI RGB quant to full
>
> tegra:
> - buffer objects reworks for dma-buf compat
> - NVDEC driver uAPI support
> - power management improvements
>
> etnaviv:
> - IOMMU enabled system support
> - fix > 4GB command buffer mapping
> - close a DoS vector
> - fix spurious GPU resets
>
> ast:
> - fix i2c initialization
>
> rcar-du:
> - DSI output support
>
> exynos:
> - replace legacy gpio interface
> - implement generic GEM object mmap
>
> msm:
> - dpu plane state cleanup in prep for multirect
> - dpu debugfs cleanups
> - dp support for sc7280
> - a506 support
> - removal of struct_mutex
> - remove old eDP sub-driver
>
> anx7625:
> - support MIPI DSI input
> - support HDMI audio
> - fix reading EDID
>
> lvds:
> - fix bridge DT bindings
>
> megachips:
> - probe both bridges before registering
>
> dw-hdmi:
> - allow interlace on bridge
>
> ps8640:
> - enable runtime PM
> - support aux-bus
>
> tx358768:
> - enable reference clock
> - add pulse mode support
>
> ti-sn65dsi86:
> - use regmap bulk write
> - add PWM support
>
> etnaviv:
> - get all fences at once
>
> gma500:
> - gem object cleanups
>
> kmb:
> - enable fb console
>
> radeon:
> - use dma_resv_wait_timeout
>
> rockchip:
> - add DSP hold timeout
> - suspend/resume fixes
> - PLL clock fixes
> - implement mmap in GEM object functions
> - use generic fbdev emulation
>
> sun4i:
> - use CMA helpers without vmap support
>
> vc4:
> - fix HDMI-CEC hang with display is off
> - power on HDMI controller while disabling
> - support 4K@60Hz modes
> - support 10-bit YUV 4:2:0 output
>
> vmwgfx:
> - fix leak on probe errors
> - fail probing on broken hosts
> - new placement for MOB page tables
> - hide internal BOs from userspace
> - implement GEM support
> - implement GL 4.3 support
>
> virtio:
> - overflow fixes
>
> xen:
> - implement mmap as GEM object function
>
> omapdrm:
> - fix scatterlist export
> - support virtual planes
>
> mediatek:
> - MT8192 support
> - CMDQ refinement
>
> ----------------------------------------------------------------
> Abhinav Kumar (3):
>        MAINTAINERS: update designated reviewer entry for MSM DRM driver
>        mailmap: add and update email addresses
>        drm/msm/dpu: add layer mixer register dump to dpu snapshot
>
> Ahmad Othman (1):
>        drm/amd/display: Secondary display goes blank on Non DCN31
>
> Akhil P Oommen (2):
>        drm/msm: Increase gpu boost interval
>        drm/msm/a6xx: Capture gmu log in devcoredump
>
> Alex Deucher (11):
>        drm/amdgpu/display: set vblank_disable_immediate for DC
>        drm/amdgpu/gfx10: add wraparound gpu counter check for APUs as well
>        drm/amdgpu/gfx9: switch to golden tsc registers for renoir+
>        drm/amdgpu/pm: fix powerplay OD interface
>        drm/amd/display: update bios scratch when setting backlight
>        drm/amdgpu: handle SRIOV VCN revision parsing
>        drm/amdgpu: clean up some leftovers from bring up
>        drm/amdgpu: add support for IP discovery gc_info table v2
>        drm/amdgpu: fix runpm documentation
>        drm/amdgpu: always reset the asic in suspend (v2)
>        drm/amdgpu: no DC support for headless chips
>
> Alvin Lee (2):
>        drm/amd/display: Wait for ACK for INBOX0 HW Lock
>        drm/amd/display: Fix check for null function ptr
>
> Amber Lin (2):
>        drm/amdkfd: Retrieve SDMA numbers from amdgpu
>        drm/amdkfd: Remove unused entries in table
>
> Ameer Hamza (1):
>        drm/msm/dpu: removed logically dead code
>
> Andi Shyti (3):
>        drm/i915/selftests: Use to_gt() helper
>        drm/i915/pxp: Use to_gt() helper
>        drm/i915: Rename i915->gt to i915->gt0
>
> Andrey Grodzovsky (4):
>        drm/sched: Avoid lockdep spalt on killing a processes
>        drm/amd/pm: Add STB accessors interface
>        drm/amd/pm: Add STB support in sienna_cichlid
>        drm/amd/pm: Add debugfs info for STB
>
> Andy Shevchenko (2):
>        agp/intel-gtt: Replace kernel.h with the necessary inclusions
>        drm: Replace kernel.h with the necessary inclusions
>
> AngeloGioacchino Del Regno (7):
>        dt-bindings: display/bridge: ptn3460: Convert to YAML binding
>        dt-bindings: display/bridge: sil, sii9234: Convert to YAML binding
>        dt-bindings: display: Add bindings for Novatek NT35950
>        drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels
>        dt-bindings: display: Document BOE BF060Y8M-AJ0 panel compatible
>        drm/panel: Add BOE BF060Y8M-AJ0 5.99" AMOLED panel driver
>        drm/msm: Allocate msm_drm_private early and pass it as driver data
>
> Angus Wang (4):
>        drm/amd/display: Fix RGB MPO underflow with multiple displays
>        drm/amd/display: Revert changes for MPO underflow
>        drm/amd/display: Fix LTTPR not Enabled
>        drm/amd/display: Changed pipe split policy to allow for
> multi-display pipe split
>
> Anitha Chrisanthus (1):
>        drm/kmb: Enable support for framebuffer console
>
> Ankit Nautiyal (2):
>        drm/i915/dp: Optimize the FRL configuration for HDMI2.1 PCON
>        drm/i915/dp: For PCON TMDS mode set only the relavant bits in config DPCD
>
> Anshuman Gupta (1):
>        drm/i915/selftest: Disable IRQ for timestamp calculation
>
> Anthony Koo (7):
>        drm/amd/display: [FW Promotion] Release 0.0.92
>        drm/amd/display: [FW Promotion] Release 0.0.93
>        drm/amd/display: [FW Promotion] Release 0.0.94
>        drm/amd/display: [FW Promotion] Release 0.0.95
>        drm/amd/display: [FW Promotion] Release 0.0.96
>        drm/amd/display: [FW Promotion] Release 0.0.97
>        drm/amd/display: [FW Promotion] Release 0.0.98
>
> Anusha Srivatsa (4):
>        i915/display/dmc: Add Support for PipeC and PipeD DMC
>        drm/i915/rpl-s: Add PCI IDS for Raptor Lake S
>        drm/i915/rpl-s: Add PCH Support for Raptor Lake S
>        drm/i915/rpl-s: Enable guc submission by default
>
> Aric Cyr (7):
>        drm/amd/display: 3.2.161
>        drm/amd/display: 3.2.162
>        drm/amd/display: 3.2.163
>        drm/amd/display: 3.2.164
>        drm/amd/display: Reduce stack usage
>        drm/amd/display: 3.2.166
>        drm/amd/display: 3.2.167
>
> Arnd Bergmann (8):
>        dma-buf: st: fix error handling in test_get_fences()
>        drm: fsl-dcu: select CONFIG_DRM_GEM_CMA_HELPER
>        drm: aspeed: select CONFIG_DRM_GEM_CMA_HELPER
>        drm/rcar: stop using 'imply' for dependencies
>        omapdrm: dss: mark runtime PM functions __maybe_unused
>        gpu: host1x: select CONFIG_DMA_SHARED_BUFFER
>        drm/tegra: Mark nvdec_writel() as inline
>        drm/tegra: Mark nvdec PM functions as __maybe_unused
>
> Aurabindo Pillai (1):
>        drm/amd/display: Add feature flags to disable LTTPR
>
> Ben Skeggs (2):
>        drm/nouveau/pmu/gm200-: avoid touching PMU outside of DEVINIT/PREOS/ACR
>        drm/nouveau/pmu/gm200-: use alternate falcon reset sequence
>
> Benoit Parrot (8):
>        drm/omap: Add ability to check if requested plane modes can be supported
>        drm/omap: Add ovl checking funcs to dispc_ops
>        drm/omap: introduce omap_hw_overlay
>        drm/omap: omap_plane: subclass drm_plane_state
>        drm/omap: Add global state as a private atomic object
>        drm/omap: dynamically assign hw overlays to planes
>        drm/omap: add plane_atomic_print_state support
>        drm/omap: Add a 'right overlay' to plane state
>
> Bernard Zhao (6):
>        drm/amd/amdgpu: remove useless break after return
>        drm/amd/amdgpu: cleanup the code style a bit
>        drm/amd/amdgpu: fix potential memleak
>        drm/amd/display: remove no need NULL check before kfree
>        drm/amd/display: cleanup the code a bit
>        drm/exynos: remove useless type conversion
>
> Bhaskar Chowdhury (1):
>        drm/nouveau/bios/init: A typo fix
>
> Bjorn Andersson (6):
>        pwm: Introduce single-PWM of_xlate function
>        drm/bridge: ti-sn65dsi86: Use regmap_bulk_write API
>        drm/bridge: ti-sn65dsi86: Implement the pwm_chip
>        drm/bridge: sn65dsi86: ti_sn65dsi86_read_u16() __maybe_unused
>        drm/msm/dp: Drop now unused hpd_high member
>        drm/msm/dpu: Add more of the INTF interrupt regions
>
> Bokun Zhang (1):
>        drm/amdgpu: Filter security violation registers
>
> Brandon Syu (2):
>        drm/amd/display: Fix eDP will flash when boot to OS
>        drm/amd/display: Fix dual eDP abnormal display issue
>
> Brian Norris (9):
>        drm/panel: kingdisplay-kd097d04: Delete panel on attach() failure
>        drm/panel: innolux-p079zca: Delete panel on attach() failure
>        drm/panel: Delete panel on mipi_dsi_attach() failure
>        drm/rockchip: vop: Add timeout for DSP hold
>        drm/rockchip: dsi: Hold pm-runtime across bind/unbind
>        drm/rockchip: dsi: Reconfigure hardware on resume()
>        drm/rockchip: dsi: Fix unbalanced clock on probe error
>        drm/rockchip: dsi: Disable PLL clock on bind error
>        drm/bridge: analogix_dp: Make PSR-exit block less
>
> Bruce Chang (1):
>        drm/i915/selftests: Follow up on increase timeout in
> i915_gem_contexts selftests
>
> Cai Huoqing (17):
>        drm: panel: nt36672a: Removed extra whitespace.
>        drm/panel: ej030na: Make use of the helper function dev_err_probe()
>        drm/panel: fy07024di26a30d: Make use of the helper function
> dev_err_probe()
>        drm/panel: ili9881c: Make use of the helper function dev_err_probe()
>        drm/panel: k101-im2ba02: Make use of the helper function dev_err_probe()
>        drm/panel: ls037v7dw01: Make use of the helper function dev_err_probe()
>        drm/panel: nt39016: Make use of the helper function dev_err_probe()
>        drm/panel: s6e63j0x03: Make use of the helper function dev_err_probe()
>        drm/panel: sofef00: Make use of the helper function dev_err_probe()
>        drm/panel: td043mtea1: Make use of the helper function dev_err_probe()
>        drm/panel: xpp055c272: Make use of the helper function dev_err_probe()
>        drm/panel: y030xx067a: Make use of the helper function dev_err_probe()
>        drm/omapdrm: Convert to SPDX identifier
>        drm/omap: dss: Make use of the helper macro SET_RUNTIME_PM_OPS()
>        drm/omap: Make use of the helper function
> devm_platform_ioremap_resourcexxx()
>        drm/tidss: Make use of the helper macro SET_RUNTIME_PM_OPS()
>        drm/tidss: Fix warning: unused variable 'tidss_pm_ops'
>
> Candice Li (1):
>        drm/amdgpu: Add recovery_lock to save bad pages function
>
> Changcheng Deng (2):
>        drm/msm/dp: remove unneeded variable
>        drm/amdkfd: use max() and min() to make code cleaner
>
> Charlene Liu (5):
>        drm/amd/display: remove dmcub_support cap dependency
>        drm/amd/display: clean up some formats and log
>        drm/amd/display: Adjust code indentation
>        drm/amd/display: based on flag reset z10 function pointer
>        drm/amd/display: fix B0 TMDS deepcolor no dislay issue
>
> Chia-I Wu (1):
>        MAINTAINERS: add reviewers for virtio-gpu
>
> Chris Park (1):
>        drm/amd/display: Fix Coverity Issues
>
> Chris Wilson (3):
>        drm/i915: Exclude reserved stolen from driver use
>        drm/i915: Sanitycheck device iomem on probe
>        drm/i915: Test all device memory on probing
>
> Christian König (31):
>        drm/scheduler: fix drm_sched_job_add_implicit_dependencies
>        drm/amdgpu: use new iterator in amdgpu_vm_prt_fini
>        drm/msm: use new iterator in msm_gem_describe
>        drm/radeon: use new iterator in radeon_sync_resv
>        dma-buf: fix kerneldoc for renamed members
>        drm/nouveau: use the new iterator in nouveau_fence_sync
>        dma-buf: add dma_resv selftest v4
>        drm/amdgpu: use the new iterator in amdgpu_sync_resv
>        drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
>        drm: use new iterator in drm_gem_plane_helper_prepare_fb v3
>        drm/etnaviv: use new iterator in etnaviv_gem_describe
>        drm/etnaviv: replace dma_resv_get_excl_unlocked
>        drm/nouveau: use the new interator in nv50_wndw_prepare_fb
>        drm/etnaviv: stop getting the excl fence separately here
>        drm/radeon: use dma_resv_wait_timeout() instead of manually waiting
>        dma-buf: add dma_fence_describe and dma_resv_describe v2
>        drm/msm: use the new dma_resv_describe
>        drm/etnaviv: use dma_resv_describe
>        drm/i915: use the new iterator in i915_gem_busy_ioctl v2
>        drm/i915: use new iterator in i915_gem_object_wait_priority
>        drm/i915: use the new iterator in i915_sw_fence_await_reservation v3
>        drm/i915: use new cursor in intel_prepare_plane_fb v2
>        drm/i915: use new iterator in i915_gem_object_wait_reservation
>        drm/amdgpu: stop getting excl fence separately
>        dma-buf: nuke dma_resv_get_excl_unlocked
>        drm/amdgpu: partially revert "svm bo enable_signal call condition"
>        drm/qxl: use iterator instead of dma_resv_shared_list
>        drm/ttm: stop pruning fences after wait
>        dma-buf: make fence mandatory for dma_resv_add_excl_fence v2
>        drm/amdgpu: don't skip runtime pm get on A+A config
>        drm/i915: remove questionable fence optimization during copy
>
> Christophe JAILLET (2):
>        drm/amdkfd: Use bitmap_zalloc() when applicable
>        drm/amdkfd: Slighly optimize 'init_doorbell_bitmap()'
>
> Chun-Kuang Hu (4):
>        drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
>        drm/mediatek: Remove the pointer of struct cmdq_client
>        drm/mediatek: Detect CMDQ execution timeout
>        drm/mediatek: Add cmdq_handle in mtk_crtc
>
> Claudio Suarez (4):
>        drm: get rid of DRM_DEBUG_* log calls in drm core, files drm_a*.c
>        drm/amdgpu: update drm_display_info correctly when the edid is read
>        drm/amdgpu: use drm_edid_get_monitor_name() instead of
> duplicating the code
>        drm/amdgpu: replace drm_detect_hdmi_monitor() with
> drm_display_info.is_hdmi
>
> Clint Taylor (1):
>        drm/i915/adlp: Remove require_force_probe protection
>
> Colin Ian King (3):
>        drm/virtio: fix potential integer overflow on shift of a int
>        drm/virtio: fix another potential integer overflow on shift of a int
>        drm/i915: make array states static const
>
> Cooper Chiou (1):
>        drm/i915: Enable WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9
>
> Dale Zhao (1):
>        drm/amd/display: add hdmi disable debug check
>
> Dan Carpenter (9):
>        drm/bridge: display-connector: fix an uninitialized pointer in probe()
>        drm/i915: pin: delete duplicate check in intel_pin_and_fence_fb_obj()
>        drm/i915/guc: fix NULL vs IS_ERR() checking
>        drm/i915/guc: fix NULL vs IS_ERR() checking
>        drm/vboxvideo: fix a NULL vs IS_ERR() check
>        drm/i915/ttm: Fix error code in i915_ttm_eviction_valuable()
>        drm/bridge: anx7625: fix an error code in anx7625_register_audio()
>        drm/i915: Fix error pointer dereference in i915_gem_do_execbuffer()
>        drm/msm/dp: Fix double free on error in msm_dp_bridge_init()
>
> Daniel Mack (2):
>        dt-bindings: display: add bindings for newhaven, 1.8-128160EF
>        drm/tiny: add driver for newhaven, 1.8-128160EF
>
> Daniel Vetter (3):
>        drm/i915: Remove some dead struct fwd decl from i915_drv.h
>        Merge tag 'drm-misc-next-2021-11-29' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>        Merge v5.16-rc5 into drm-next
>
> Daniele Ceraolo Spurio (3):
>        drm/i915: split general MMIO setup from per-GT uncore init
>        drm/i915/uc: correctly track uc_fw init failure
>        drm/i915/guc: support bigger RSA keys
>
> Darren Powell (2):
>        amdgpu/pm: Create shared array of power profile name strings
>        amdgpu/pm: Modify implmentations of get_power_profile_mode to
> use amdgpu_pp_profile_name
>
> Dave Airlie (18):
>        Merge tag 'drm-misc-next-2021-11-18' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>        Merge tag 'drm-intel-next-2021-11-30' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>        Merge tag 'amd-drm-next-5.17-2021-12-02' of
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C89ff952b65d94adfdbb108d9d1a4a9f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637771328393603229%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=4bAC8YE%2FDj%2FNQ0zjjF5OCaQzSN2Lc%2FPfhrW8PtiJvXA%3D&amp;reserved=0 into drm-next
>        Merge tag 'du-next-20211206' of
> git://linuxtv.org/pinchartl/media into drm-next
>        Merge tag 'drm-misc-next-2021-12-09' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>        Merge tag 'drm-intel-gt-next-2021-12-09' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>        Merge tag 'drm-intel-next-2021-12-14' of
> ssh://git.freedesktop.org/git/drm/drm-intel into drm-next
>        Merge tag 'drm-misc-next-2021-12-16' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>        Merge tag 'mediatek-drm-next-5.17' of
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fchunkuang.hu%2Flinux&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C89ff952b65d94adfdbb108d9d1a4a9f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637771328393603229%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=q6uFUVbVjV9Mm50JBtfsrRRYhUiwl%2FuPFSCIBd%2BWLgE%3D&amp;reserved=0
> into drm-next
>        Merge tag 'amd-drm-next-5.17-2021-12-16' of
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C89ff952b65d94adfdbb108d9d1a4a9f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637771328393603229%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=4bAC8YE%2FDj%2FNQ0zjjF5OCaQzSN2Lc%2FPfhrW8PtiJvXA%3D&amp;reserved=0 into drm-next
>        Merge tag 'drm/tegra/for-5.17-rc1' of
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Ftegra&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C89ff952b65d94adfdbb108d9d1a4a9f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637771328393603229%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=nsZNDMA0dtIDextPQyWicBBjQ1Wmui2zQ0jI1b4FAfE%3D&amp;reserved=0 into drm-next
>        Merge tag 'exynos-drm-next-for-v5.17' of
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
> drm-next
>        Merge branch 'etnaviv/next' of
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.pengutronix.de%2Fgit%2Flst%2Flinux&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C89ff952b65d94adfdbb108d9d1a4a9f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637771328393603229%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=blo6ikplE4zlvQ%2Fe9CdnZBPn6lFunpG6UyqlyGej694%3D&amp;reserved=0 into drm-next
>        Merge tag 'drm-intel-gt-next-2021-12-23' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>        Merge tag 'drm-misc-next-fixes-2021-12-23' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>        Merge tag 'drm-msm-next-2021-12-26' of
> ssh://gitlab.freedesktop.org/drm/msm into drm-next
>        Merge tag 'drm-intel-next-fixes-2021-12-29' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>        Merge tag 'amd-drm-next-5.17-2021-12-30' of
> ssh://gitlab.freedesktop.org/agd5f/linux into drm-next
>
> Dave Stevenson (3):
>        drm/fourcc: Add packed 10bit YUV 4:2:0 format
>        drm/vc4: plane: Add support for DRM_FORMAT_P030
>        drm/vc4: plane: Add support for YUV color encodings and ranges
>
> Dmitry Baryshkov (32):
>        drm/msm/dpu: move LUT levels out of QOS config
>        drm/msm/dpu: remove pipe_qos_cfg from struct dpu_plane
>        drm/msm/dpu: drop pipe_name from struct dpu_plane
>        drm/msm/dpu: remove stage_cfg from struct dpu_crtc
>        drm/msm/dpu: move dpu_hw_pipe_cfg out of struct dpu_plane
>        drm/msm/dpu: drop dpu_csc_cfg from dpu_plane
>        drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg from dpu_plane
>        drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
>        drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
>        drm/msm/mdp5: drop eDP support
>        drm/msm/edp: drop old eDP support
>        dt-bindings: display/msm: remove edp.txt
>        drm/msm/dsi: untangle cphy setting from the src pll setting
>        drm/msm/dsi: stop setting clock parents manually
>        drm/msm/mdp5: drop vdd regulator
>        drm/msm: Initialize MDSS irq domain at probe time
>        drm/msm/hdmi: switch to drm_bridge_connector
>        drm/msm/dpu: drop scaler config from plane state
>        drm/msm/dpu: drop pe argument from _dpu_hw_sspp_setup_scaler3
>        drm/msm/dpu: simplify DPU_SSPP features checks
>        drm/msm/dpu: fix CDP setup to account for multirect index
>        drm/msm/dsi: fix initialization in the bonded DSI case
>        drm/msm/dpu: move disable_danger out of plane subdir
>        drm/msm/dpu: fix safe status debugfs file
>        drm/msm/dpu: make danger_status/safe_status readable
>        drm/msm/dpu: drop plane's default_scaling debugfs file
>        drm/msm/dpu: stop manually removing debugfs files for the DPU plane
>        drm/msm/dpu: stop manually removing debugfs files for the DPU CRTC
>        drm/msm/dpu: simplify DPU's regset32 code
>        drm/msm/dpu: add dpu_crtc_atomic_print_state
>        drm/msm/dpu: add dpu_plane_atomic_print_state
>        drm/msm/dpu: move SSPP debugfs support from plane to SSPP code
>
> Dmitry Osipenko (24):
>        drm/bridge: tc358768: Enable reference clock
>        drm/bridge: tc358768: Support pulse mode
>        drm/bridge: tc358768: Calculate video start delay
>        drm/bridge: tc358768: Disable non-continuous clock mode
>        drm/bridge: tc358768: Correct BTACNTRL1 programming
>        soc/tegra: Enable runtime PM during OPP state-syncing
>        soc/tegra: Add devm_tegra_core_dev_init_opp_table_common()
>        drm/tegra: dc: rgb: Move PCLK shifter programming to CRTC
>        drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+
>        drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
>        drm/tegra: hdmi: Register audio CODEC on Tegra20
>        gpu: host1x: Add initial runtime PM and OPP support
>        gpu: host1x: Add host1x_channel_stop()
>        drm/tegra: submit: Add missing pm_runtime_mark_last_busy()
>        drm/tegra: dc: Support OPP and SoC core voltage scaling
>        drm/tegra: hdmi: Add OPP support
>        drm/tegra: gr2d: Support generic power domain and runtime PM
>        drm/tegra: gr3d: Support generic power domain and runtime PM
>        drm/tegra: vic: Stop channel on suspend
>        drm/tegra: nvdec: Stop channel on suspend
>        drm/tegra: submit: Remove pm_runtime_enabled() checks
>        drm/tegra: Consolidate runtime PM management of older UAPI codepath
>        gpu: host1x: Add back arm_iommu_detach_device()
>        drm/tegra: Add back arm_iommu_detach_device()
>
> Dmytro Laktyushkin (1):
>        drm/amd/display: bring dcn31 clk mgr in line with other version style
>
> Douglas Anderson (1):
>        drm/bridge: parade-ps8640: Add backpointer to drm_device in drm_dp_aux
>
> Eric Bernstein (1):
>        drm/amd/display: ODM + MPO window on only one half of ODM
>
> Evan Quan (6):
>        drm/amdgpu: use generic fb helpers instead of setting up AMD own's.
>        drm/amd/pm: avoid duplicate powergate/ungate setting
>        drm/amdgpu: update the domain flags for dumb buffer creation
>        drm/amdgpu: move smu_debug_mask to a more proper place
>        drm/amdgpu: correct the wrong cached state for GMC on PICASSO
>        drm/amdgpu: put SMU into proper state on runpm suspending for
> BOCO capable platform
>
> Evgenii Krasnikov (1):
>        drm/amd/display: add function for eDP and backlight power on
>
> Fangzhi Zuo (3):
>        drm/amd/display: Add DP-HDMI FRL PCON SST Support in DM
>        drm/amd/display: Add DP-HDMI FRL PCON Support in DC
>        drm/amd/display: Add Debugfs Entry to Force in SST Sequence
>
> Felix Kuehling (6):
>        drm/amdkfd: Add sysfs bitfields and enums to uAPI
>        drm/amdgpu: Fix MMIO HDP flush on SRIOV
>        drm/amdkfd: Fix error handling in svm_range_add
>        drm/amdkfd: Fix svm_range_is_same_attrs
>        drm/amdkfd: Don't split unchanged SVM ranges
>        drm/amdkfd: Make KFD support on Hawaii experimental
>
> Flora Cui (5):
>        drm/amdgpu: cancel the correct hrtimer on exit
>        drm/amdgpu: fix vkms crtc settings
>        drm/amdgpu: check atomic flag to differeniate with legacy path
>        drm/amdgpu: drop the critial WARN_ON in amdgpu_vkms
>        drm/amdgpu: free vkms_output after use
>
> George Shen (7):
>        drm/amd/display: Add vendor specific LTTPR workarounds for DCN31
>        drm/amd/display: Skip vendor specific LTTPR w/a outside link training
>        drm/amd/display: Add 16ms AUX RD interval W/A for specific LTTPR
>        drm/amd/display: Apply LTTPR workarounds to non-transparent mode
>        drm/amd/display: Add W/A for PHY tests with certain LTTPR
>        drm/amd/display: Limit max link cap with LTTPR caps
>        drm/amd/display: Remove CR AUX RD Interval limit for LTTPR
>
> Graham Sider (22):
>        drm/amdkfd: add amdgpu_device entry to kfd_dev
>        drm/amdkfd: replace kgd_dev in static gfx v7 funcs
>        drm/amdkfd: replace kgd_dev in static gfx v8 funcs
>        drm/amdkfd: replace kgd_dev in static gfx v9 funcs
>        drm/amdkfd: replace kgd_dev in static gfx v10 funcs
>        drm/amdkfd: replace kgd_dev in static gfx v10_3 funcs
>        drm/amdkfd: replace kgd_dev in hqd/mqd kfd2kgd funcs
>        drm/amdkfd: replace kgd_dev in various kfd2kgd funcs
>        drm/amdkfd: replace kgd_dev in various amgpu_amdkfd funcs
>        drm/amdkfd: replace kgd_dev in get amdgpu_amdkfd funcs
>        drm/amdkfd: replace kgd_dev in gpuvm amdgpu_amdkfd funcs
>        drm/amdkfd: replace/remove remaining kgd_dev references
>        drm/amdkfd: remove kgd_dev declaration and initialization
>        drm/amdkfd: replace trivial funcs with direct access
>        drm/amdkfd: convert KFD_IS_SOC to IP version checking
>        drm/amdkfd: convert switches to IP version checking
>        drm/amdkfd: convert misc checks to IP version checking
>        drm/amdkfd: replace asic_family with asic_type
>        drm/amdkfd: replace asic_name with amdgpu_asic_name
>        drm/amdkfd: add kfd_device_info_init function
>        drm/amdkfd: remove hardcoded device_info structs
>        drm/amdkfd: add Navi2x to GWS init conditions
>
> Guangming Cao (1):
>        dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
>
> Guchun Chen (6):
>        drm/amdgpu: add error print when failing to add IP block(v2)
>        drm/amdgpu: declare static function to fix compiler warning
>        drm/amdgpu: fix the missed handling for SDMA2 and SDMA3
>        drm/amdgpu: use adev_to_drm to get drm_device pointer
>        drm/amdkfd: correct sdma queue number in kfd device init (v3)
>        drm/amdgpu: drop redundant semicolon
>
> Guo, Bing (1):
>        drm/amd/display: fixed an error related to 4:2:0/4:2:2 DSC
>
> Gustavo A. R. Silva (1):
>        video: omapfb: Fix fall-through warning for Clang
>
> Hans Verkuil (1):
>        drm/nouveau: set RGB quantization range to FULL
>
> Hans de Goede (11):
>        drm: Add privacy-screen class (v4)
>        drm/privacy-screen: Add X86 specific arch init code
>        drm/privacy-screen: Add notifier support (v2)
>        drm/connector: Add a drm_connector privacy-screen helper functions (v2)
>        platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey() helper
>        platform/x86: thinkpad_acpi: Get privacy-screen / lcdshadow ACPI
> handles only once
>        platform/x86: thinkpad_acpi: Register a privacy-screen device
>        drm: panel-orientation-quirks: Add quirk for the Lenovo Yoga Book X91F/L
>        drm/i915/vlv_dsi: Double pixelclock on read-back for dual-link panels
>        drm/i915: Add intel_modeset_probe_defer() helper
>        drm/i915: Add privacy-screen support (v3)
>
> Harshit Mogalapalli (1):
>        drm/i915/display: Fix an unsigned subtraction which can never be negative.
>
> Hawking Zhang (6):
>        drm/amdgpu: add helper to load ip_discovery binary from file
>        drm/amdgpu: rename discovery_read_binary helper
>        drm/amdgpu: add helper to verify ip discovery binary signature
>        drm/amdgpu: read and authenticate ip discovery binary
>        drm/amdgpu: don't override default ECO_BITs setting
>        drm/amdgpu: check df_funcs and its callback pointers
>
> He Ying (1):
>        drm: Small optimization to intel_dp_mst_atomic_master_trans_check
>
> Hector Martin (3):
>        of: Move simple-framebuffer device handling from simplefb to of
>        drm/format-helper: Add drm_fb_xrgb8888_to_xrgb2101010_toio()
>        drm/simpledrm: Add [AX]RGB2101010 formats
>
> Hsin-Yi Wang (1):
>        drm/bridge: anx7625: Fix edid_read break case in sp_tx_edid_read()
>
> Huang Rui (1):
>        drm/amdgpu: introduce new amdgpu_fence object to indicate the
> job embedded fence
>
> Huang, ChiaWen (1):
>        drm/amd/display: use link_rate_set above DPCD 1.3 (#1527)
>
> Ilia Mirkin (1):
>        drm/nouveau/kms/nv04: use vzalloc for nv04_display
>
> Imre Deak (31):
>        drm/i915/dp: Skip the HW readout of DPCD on disabled encoders
>        drm/i915/dp: Ensure sink rate values are always valid
>        drm/i915/dp: Ensure max link params are always valid
>        drm/i915/dp: Ensure sink/link max lane count values are always valid
>        drm/i915/dp: Sanitize sink rate DPCD register values
>        drm/i915/dp: Sanitize link common rate array lookups
>        drm/i915: Add a table with a descriptor for all i915 modifiers
>        drm/i915: Move intel_get_format_info() to intel_fb.c
>        drm/i915: Add tiling attribute to the modifier descriptor
>        drm/i915: Simplify the modifier check for interlaced scanout support
>        drm/i915: Unexport is_semiplanar_uv_plane()
>        drm/i915: Move intel_format_info_is_yuv_semiplanar() to intel_fb.c
>        drm/i915: Add a platform independent way to get the RC CCS CC plane
>        drm/i915: Handle CCS CC planes separately from CCS AUX planes
>        drm/i915: Add a platform independent way to check for CCS AUX planes
>        drm/i915: Move is_ccs_modifier() to intel_fb.c
>        drm/i915: Add functions to check for RC CCS CC and MC CCS modifiers
>        drm/i915/fb: Don't report MC CCS plane capability on GEN<12
>        drm/i915/fb: Don't store bitmasks in the intel_plane_caps enum
>        drm/i915/fb: Fold modifier CCS type/tiling attribute to plane caps
>        drm/i915/fb: Fix rounding error in subsampled plane size calculation
>        drm/i915/adlp/fb: Prevent the mapping of redundant trailing
> padding NULL pages
>        drm/i915/fb: Factor out functions to remap contiguous FB obj pages
>        drm/i915/adlp/fb: Fix remapping of linear CCS AUX surfaces
>        drm/i915/fb: Rename i915_color_plane_view::stride to mapping_stride
>        drm/i915/adlp/fb: Remove restriction on semiplanar UV plane offset
>        drm/i915/adlp/fb: Remove restriction on CCS AUX plane strides
>        drm/i915: Factor out i915_ggtt_suspend_vm/i915_ggtt_resume_vm()
>        drm/i915: Restore memory mapping for DPT FBs across system suspend/resume
>        drm/i915: Fix fastsets on TypeC ports following a non-blocking modeset
>        drm/i915: Fix DPT suspend/resume on !HAS_DISPLAY platforms
>
> Inki Dae (1):
>        drm/exynos: drop the use of label from exynos_dsi_register_te_irq
>
> Isabella Basso (10):
>        drm/amd: Mark IP_BASE definition as __maybe_unused
>        drm/amd: fix improper docstring syntax
>        drm/amdgpu: fix function scopes
>        drm/amdkfd: fix function scopes
>        drm/amd: append missing includes
>        drm/amdgpu: fix location of prototype for amdgpu_kms_compat_ioctl
>        drm/amdgpu: fix amdgpu_ras_mca_query_error_status scope
>        drm/amdgpu: remove unnecessary variables
>        drm/amdgpu: re-format file header comments
>        drm/amd/display: fix function scopes
>
> Ivaylo Dimitrov (1):
>        drm: omapdrm: Export correct scatterlist for TILER backed BOs
>
> Jackie Liu (1):
>        drm/msm/dp: displayPort driver need algorithm rational
>
> Jane Jian (1):
>        drm/amdgpu/sriov/vcn: add new vcn ip revision check case for
> SIENNA_CICHLID
>
> Jani Nikula (55):
>        drm/dp: add helpers to read link training delays
>        drm/dp: reuse the 8b/10b link training delay helpers
>        Merge tag 'topic/drm-dp-training-delay-helpers-2021-10-19' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-intel-next
>        drm/i915/dp: use new link training delay helpers
>        Revert "drm/i915/bios: gracefully disable dual eDP for now"
>        drm/i915/cdclk: put the cdclk vtables in const data
>        drm/i915/dp: fix integer overflow in 128b/132b data rate calculation
>        drm/i915/dsc: demote noisy drm_info() to drm_kms_dbg()
>        Merge drm/drm-next into drm-intel-next
>        drm/i915/audio: group audio under anonymous struct in drm_i915_private
>        drm/i915/audio: name the audio sub-struct in drm_i915_private
>        drm/i915/audio: define the audio struct separately from drm_i915_private
>        drm/i915/audio: move intel_audio_funcs internal to intel_audio.c
>        drm/i915/audio: rename intel_init_audio_hooks to intel_audio_hooks_init
>        drm/i915: include intel-gtt.h only where needed
>        agp/intel-gtt: reduce intel-gtt dependencies more
>        drm/i915/fbc: fix the FBC kernel-doc warnings
>        drm/i915/driver: rename i915_drv.c to i915_driver.c
>        drm/i915/driver: rename driver to i915_drm_driver
>        drm/i915/driver: add i915_driver_ prefix to functions
>        drm/i915: drop intel_display.h include from intel_ddi.h
>        drm/i915: drop intel_display.h include from intel_dpll_mgr.h
>        drm/i915/debugfs: move debug printing to intel_display_power.c
>        drm/i915: move structs from intel_display_power.h to .c
>        drm/i915: drop intel_display.h include from intel_display_power.h
>        drm/i915/pxp: fix includes for headers in include/drm
>        Merge drm/drm-next into drm-intel-next
>        drm/i915/dsi: split out intel_dsi_vbt.h
>        drm/i915/dsi: split out vlv_dsi_pll.h
>        drm/i915/dsi: split out vlv_dsi.h
>        drm/i915/dsi: split out icl_dsi.h
>        drm/i915/display: add intel_crtc_wait_for_next_vblank() and use it
>        drm/i915/crtc: rename intel_get_crtc_for_pipe() to intel_crtc_for_pipe()
>        drm/i915/crtc: rename intel_get_crtc_for_plane() to intel_crtc_for_plane()
>        drm/i915/display: remove intel_wait_for_vblank()
>        drm/i915/crtc: un-inline some crtc functions and move to intel_crtc.[ch]
>        drm/i915/fb: move intel_fb_uses_dpt to intel_fb.c and un-inline
>        drm/i915: split out intel_pm_types.h
>        drm/i915: move enum hpd_pin to intel_display.h
>        drm/i915/display: convert dp_to_i915() to a macro
>        drm/i915/display: stop including i915_drv.h from intel_display_types.h
>        drm/i915/snps: use div32 version of MPLLB word clock for UHBR
>        drm/i915/ddi: add use_edp_hobl() and use_edp_low_vswing() helpers
>        drm/i915/trace: clean up boilerplate organization
>        drm/i915/trace: split out display trace to a separate file
>        Merge drm/drm-next into drm-intel-next
>        drm/i915/reset: include intel_display.h instead of intel_display_types.h
>        drm/i915/active: remove useless i915_utils.h include
>        drm/i915/psr: avoid intel_frontbuffer.h include with declaration
>        drm/i915/fbc: avoid intel_frontbuffer.h include with declaration
>        drm/i915/fb: reduce include dependencies
>        drm/i915/pxp: un-inline intel_pxp_is_enabled()
>        drm/i915/pxp: remove useless includes
>        drm/i915/cdclk: move intel_atomic_check_cdclk() to intel_cdclk.c
>        drm/i915/cdclk: hide struct intel_cdclk_vals
>
> Jarif Aftab (1):
>        drm/amd/display: Added Check For dc->res_pool
>
> Javier Martinez Canillas (8):
>        drm/i915: Fix comment about modeset parameters
>        drm: Don't print messages if drivers are disabled due nomodeset
>        drm/vboxvideo: Drop CONFIG_VGA_CONSOLE guard to call vgacon_text_force()
>        drm: Move nomodeset kernel parameter to the DRM subsystem
>        drm: Decouple nomodeset from CONFIG_VGA_CONSOLE
>        Documentation/admin-guide: Document nomodeset kernel parameter
>        drm: Make the nomodeset message less sensational
>        drm: Fix build error caused by missing drm_nomodeset.o
>
> Jernej Skrabec (1):
>        drm/sun4i: virtual CMA addresses are not needed
>
> Jiapeng Chong (6):
>        drm/nouveau: Remove unused variable ret
>        drm/nouveau/fifo: make tu102_fifo_runlist static
>        drm/amd/display: Clean up some inconsistent indenting
>        drm/amdgpu/pm: clean up some inconsistent indenting
>        drm/amd/display: Fix warning comparing pointer to 0
>        drm/amd/display: Fix warning comparing pointer to 0
>
> Jimmy Kizito (4):
>        drm/amd/display: Use link_enc_cfg API for queries.
>        drm/amd/display: Query all entries in assignment table during updates.
>        drm/amd/display: Initialise encoder assignment when initialising dc_state
>        drm/amd/display: Add work around for tunneled MST.
>
> Jingwen Chen (2):
>        drm/amd/amdgpu: fix psp tmr bo pin count leak in SRIOV
>        drm/amd/amdgpu: fix gmc bo pin count leak in SRIOV
>
> John Harrison (7):
>        drm/i915/guc: Refcount context during error capture
>        drm/i915/uc: Allow platforms to have GuC but not HuC
>        drm/i915/guc: Don't go bang in GuC log if no GuC
>        drm/i915/guc: Don't hog IRQs when destroying contexts
>        drm/i915/guc: Speed up GuC log dumps
>        drm/i915/guc: Increase GuC log size for CONFIG_DEBUG_GEM
>        drm/i915/guc: Flag an error if an engine reset fails
>
> John Keeping (5):
>        dt-bindings: ili9881c: add missing panel-common inheritance
>        dt-bindings: ili9881c: add rotation property
>        drm/panel: ilitek-ili9881c: Read panel orientation
>        drm/rockchip: use generic fbdev setup
>        drm/rockchip: pass 0 to drm_fbdev_generic_setup()
>
> Jonathan Kim (1):
>        drm/amdgpu: disable default navi2x co-op kernel support
>
> Joonas Lahtinen (3):
>        Merge drm/drm-next into drm-intel-gt-next
>        MAINTAINERS: Add Tvrtko as drm/i915 co-maintainer
>        drm/i915: Revert 'guc_id' from i915_request tracepoint
>
> José Expósito (1):
>        drm/amd/display: fix dereference before NULL check
>
> José Roberto de Souza (13):
>        drm/i915/display: Rename POWER_DOMAIN_DPLL_DC_OFF to POWER_DOMAIN_DC_OFF
>        drm/i915/display: Add warn_on in intel_psr_pause()
>        drm/i915/display: Wait PSR2 get out of deep sleep to update pipe
>        drm/i915/adlp: Extend PSR2 support in transcoder B
>        drm/i915/adlp: Implement workaround 16013190616
>        drm/i915/display: Check async flip state of every crtc and plane once
>        drm/i915: Add struct to hold IP version
>        drm/i915: Track media IP stepping separated from GT
>        drm/i915: Rename GT_STEP to GRAPHICS_STEP
>        drm/i915/display/adlp: Disable underrun recovery
>        drm/i915/psr: Fix PSR2 handling of multiplanar format
>        Revert "drm/i915: Implement Wa_1508744258"
>        drm/i915: Add workaround numbers to GEN7_COMMON_SLICE_CHICKEN1
> whitelisting
>
> Jouni Högander (2):
>        drm/i915/display: Add initial selective fetch support for biplanar formats
>        Revert "drm/i915/display/psr: Do full fetch when handling
> multi-planar formats"
>
> Jude Shih (1):
>        drm/amd/display: Move link_enc init logic to DC
>
> Jun Lei (1):
>        drm/amd/display: Code change for DML isolation
>
> Kai Song (1):
>        drm/i915/selftests: Fix inconsistent IS_ERR and PTR_ERR
>
> Kai Vehmanen (1):
>        drm/i915/display: program audio CDCLK-TS for keepalives
>
> Kalyan Thota (1):
>        drm/msm/disp/dpu1: set default group ID for CTL.
>
> Karol Herbst (1):
>        MAINTAINERS: update information for nouveau
>
> Kent Russell (4):
>        drm/amdgpu: Increase potential product_name to 64 characters
>        drm/amdgpu: Enable unique_id for Aldebaran
>        drm/amdgpu: Only overwrite serial if field is empty
>        drm/amdgpu: Access the FRU on Aldebaran
>
> Kevin Tang (6):
>        dt-bindings: display: add Unisoc's drm master bindings
>        drm/sprd: add Unisoc's drm kms master
>        dt-bindings: display: add Unisoc's dpu bindings
>        drm/sprd: add Unisoc's drm display controller driver
>        dt-bindings: display: add Unisoc's mipi dsi controller bindings
>        drm/sprd: add Unisoc's drm mipi dsi&dphy driver
>
> Kieran Bingham (3):
>        gpu: drm: panel-edp: Fix edp_panel_entry documentation
>        drm: rcar-du: Add DSI support to rcar_du_output_name
>        drm: rcar-du: crtc: Support external DSI dot clock
>
> Krishna Manikandan (1):
>        drm/msm: use compatible lists to find mdp node
>
> Kuogee Hsieh (3):
>        drm/msm/dp: Add "qcom, sc7280-dp" to support display port.
>        drm/msm/dp: employ bridge mechanism for display enable and disable
>        drm/msm/dp: dp_link_parse_sink_count() return immediately if aux
> read failed
>
> LUU HOAI (1):
>        drm: rcar-du: Add R-Car DSI driver
>
> Lai, Derek (1):
>        drm/amd/display: Added power down for DCN10
>
> Lang Yu (5):
>        drm/amdgpu: remove power on/off SDMA in SMU hw_init/fini()
>        drm/amdgpu: only hw fini SMU fisrt for ASICs need that
>        drm/amdgpu: introduce a kind of halt state for amdgpu device
>        drm/amdgpu: add support for SMU debug option
>        drm/amd/pm: fix a potential gpu_metrics_table memory leak
>
> Laurent Pinchart (2):
>        drm: rcar-du: Fix CRTC timings when CMM is used
>        dt-bindings: display: bridge: Add binding for R-Car MIPI DSI/CSI-2 TX
>
> Le Ma (1):
>        drm/amdgpu: correct register access for RLC_JUMP_TABLE_RESTORE
>
> Lee Jones (1):
>        drm/nouveau/dispnv50/headc57d: Make local function 'headc57d_olut' static
>
> Leo (Hanghong) Ma (3):
>        drm/amd/display: Add helper for blanking all dp displays
>        drm/amd/display: Drop config guard for DC_LOG_DP2
>        drm/amd/display: Reduce dmesg error to a debug print
>
> Leslie Shi (3):
>        drm/amdgpu: add modifiers in amdgpu_vkms_plane_init()
>        drm/amdgpu: fix incorrect VCN revision in SRIOV
>        drm/amdgpu: Call amdgpu_device_unmap_mmio() if device is
> unplugged to prevent crash in GPU initialization failure
>
> Lijo Lazar (7):
>        drm/amd/pm: Remove artificial freq level on Navi1x
>        drm/amdgpu: Skip ASPM programming on aldebaran
>        drm/amd/pm: Add warning for unexpected PG requests
>        drm/amdgpu: Use MAX_HWIP instead of HW_ID_MAX
>        drm/amdgpu: Don't halt RLC on GFX suspend
>        drm/amd/pm: Skip power state allocation
>        drm/amd/pm: Fix xgmi link control on aldebaran
>
> Luben Tuikov (4):
>        drm/amd/pm: Enhanced reporting also for a stuck command
>        drm/amd/pm: Add debug prints
>        drm/amd/pm: Sienna: Print failed BTC
>        drm/amd/pm: Print the error on command submission
>
> Lucas De Marchi (2):
>        drm/i915: remove CNL leftover
>        drm/i915: replace X86_FEATURE_PAT with pat_enabled()
>
> Lucas Stach (2):
>        drm/etnaviv: limit submit sizes
>        drm/etnaviv: consider completed fence seqno in hang check
>
> Luo Jiaxing (3):
>        drm/nouveau/device: use snprintf() to replace strncpy() to avoid
> NUL-terminated string loss
>        drm/nouveau/kms/nv50-: Remove several set but not used variables
> "ret" in disp.c
>        drm/nouveau/kms: delete an useless function call in
> nouveau_framebuffer_new()
>
> Lv Ruyi (1):
>        drm/amd/display: fix application of sizeof to pointer
>
> Lyude Paul (14):
>        drm/nouveau/kms/nv50-: Use drm_dbg_kms() in crc.c
>        drm/nouveau/kms/nv50-: Check vbl count after CRC context flip
>        drm/nouveau/kms/nv140-: Use hard-coded wndws or core channel for
> CRC channel
>        drm/nouveau/kms/nvd9-nv138: Fix CRC calculation for the cursor channel
>        drm/nouveau/kms/nv140-: Add CRC methods to gv100_disp_core_mthd_head
>        drm/nouveau/kms/nv50-: Correct size checks for cursors
>        drm/nouveau/kms/nv50-: Use NV_ATOMIC() in nv50_head_atomic_check_lut()
>        drm/nouveau/kms/nv50-: Always validate LUTs in
> nv50_head_atomic_check_lut()
>        drm/i915: Add support for panels with VESA backlights with PWM
> enable/disable
>        drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux
> enable/brightness
>        drm/dp: Don't read back backlight mode in drm_edp_backlight_enable()
>        drm/dp, drm/i915: Add support for VESA backlights using PWM for
> brightness control
>        drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()
>        drm/i915/dp: Perform 30ms delay after source OUI write
>
> Maarten Lankhorst (22):
>        drm/i915: Remove gen6_ppgtt_unpin_all
>        drm/i915/selftests: Rework context handling in hugepages selftests
>        drm/i915: Fix i915_request fence wait semantics
>        drm/i915: Create a dummy object for gen6 ppgtt
>        drm/i915: Create a full object for mock_ring, v2.
>        drm/i915: vma is always backed by an object.
>        drm/i915: Remove resv from i915_vma
>        drm/i915: Drain the ttm delayed workqueue too
>        drm/i915: Add support for moving fence waiting
>        drm/i915: Remove dma_resv_prune
>        drm/i915: Remove dma_resv_prune
>        drm/i915: Remove unused bits of i915_vma/active api
>        drm/i915: Change shrink ordering to use locking around unbinding.
>        drm/i915: Remove pages_mutex and
> intel_gtt->vma_ops.set/clear_pages members, v3.
>        drm/i915: Take object lock in i915_ggtt_pin if ww is not set
>        drm/i915: Force ww lock for i915_gem_object_ggtt_pin_ww, v2.
>        drm/i915: Ensure gem_contexts selftests work with unbind changes, v2.
>        drm/i915: Ensure i915_vma tests do not get -ENOSPC with the
> locking changes.
>        drm/i915: Trylock the object when shrinking
>        drm/i915: Require object lock when freeing pages during destruction
>        drm/i915: Add ww ctx to i915_gem_object_trylock
>        drm/i915: Use trylock instead of blocking lock for
> __i915_gem_free_objects.
>
> Madhumitha Tolakanahalli Pradeep (2):
>        drm/i915/dmc: Change max DMC FW size on ADL-P
>        drm/i915/dmc: Update DMC to v2.14 on ADL-P
>
> Manasi Navare (1):
>        drm/i915/: Extend VRR platform support to Gen 11
>
> Marcel Ziswiler (1):
>        drm: import DMA_BUF module namespace
>
> Marek Vasut (7):
>        drm: of: Add drm_of_lvds_get_data_mapping
>        drm/bridge: ti-sn65dsi83: Optimize reset line toggling
>        dt-bindings: display: bridge: lvds-codec: Document pixel data
> sampling edge select
>        drm/bridge: lvds-codec: Add support for pixel data sampling edge select
>        dt-bindings: Add Team Source Display Technology vendor prefix
>        dt-bindings: display: simple: Add Team Source Display TST043015CMHX panel
>        drm/panel: simple: Add Team Source Display TST043015CMHX panel
>
> Marina Nikolic (1):
>        amdgpu/pm: Make sysfs pm attributes as read-only for VFs
>
> Mario Limonciello (6):
>        drm/amd: add some extra checks that is_dig_enabled is defined
>        drm/amd: move variable to local scope
>        drm/amd/pm: fix reading SMU FW version from amdgpu_firmware_info on YC
>        drivers/amd/pm: drop statement to print FW version for smu_v13
>        drivers/amd/pm: smu13: use local variable adev
>        drm/amd/pm: restore SMU version print statement for dGPUs
>
> Mark Brown (1):
>        drm/i915: Fix implicit use of struct pci_dev
>
> Mark Yacoub (1):
>        drm/mediatek: Set the default value of rotation to DRM_MODE_ROTATE_0
>
> Martin Leung (3):
>        drm/amd/display: add else to avoid double destroy clk_mgr
>        drm/amd/display: implement dc_mode_memclk
>        drm/amd/display: Undo ODM combine
>
> Martyn Welch (1):
>        drm/bridge: megachips: Ensure both bridges are probed before registration
>
> Matt Atwood (1):
>        drm/i915/dg2: extend Wa_1409120013 to DG2
>
> Matt Roper (6):
>        drm/i915/dg2: Add initial gt/ctx/engine workarounds
>        drm/i915/dg2: Program recommended HW settings
>        drm/i915: Don't read query SSEU for non-existent slice 0 on old platforms
>        drm/i915/dg2: Add Wa_16011777198
>        drm/i915/dg2: s/DISP_STEPPING/DISPLAY_STEPPING/
>        drm/i915/dg2: Add Wa_14010547955
>
> Matthew Auld (27):
>        drm/i915/dmabuf: fix broken build
>        drm/i915/ttm: add tt shmem backend
>        drm/i915/gtt: drop unneeded make_unshrinkable
>        drm/i915: drop unneeded make_unshrinkable in free_object
>        drm/i915: add some kernel-doc for shrink_pin and friends
>        drm/i915/ttm: move shrinker management into adjust_lru
>        drm/i915/ttm: use cached system pages when evicting lmem
>        drm/i915/ttm: enable shmem tt backend
>        drm/i915/gtt: flush the scratch page
>        drm/i915/gtt: stop caching the scratch page
>        drm/i915/clflush: fixup handling of cache_dirty
>        drm/i915/clflush: disallow on discrete
>        drm/i915: move cpu_write_needs_clflush
>        drm/i915: stop setting cache_dirty on discrete
>        drm/i915/dmabuf: drop the flush on discrete
>        drm/i915: fixup dma_fence_wait usage
>        drm/i915: move the pre_pin earlier
>        drm/i915/ttm: fixup build failure
>        drm/i915/gemfs: don't mark huge_opt as static
>        drm/i915/migrate: don't check the scratch page
>        drm/i915/migrate: fix offset calculation
>        drm/i915/migrate: fix length calculation
>        drm/i915/selftests: handle object rounding
>        drm/i915/xehpsdv: set min page-size to 64K
>        drm/i915/gtt/xehpsdv: move scratch page to system memory
>        drm/i915: enforce min page size for scratch
>        drm/i915/debugfs: add noreclaim annotations
>
> Matthew Brost (11):
>        drm/i915/selftests: Increase timeout in requests perf selftest
>        drm/i915/selftests: Update live.evict to wait on requests / idle
> GPU after each loop
>        drm/i915/guc: Fix recursive lock in GuC submission
>        drm/i915/resets: Don't set / test for per-engine reset bits with
> GuC submission
>        drm/i915: Drop stealing of bits from i915_sw_fence function pointer
>        drm/i915/guc: Use correct context lock when callig clr_context_registered
>        drm/i915/guc: Only assign guc_id.id when stealing guc_id
>        drm/i915/guc: Remove racey GEM_BUG_ON
>        drm/i915/guc: Add extra debug on CT deadlock
>        drm/i915/guc: Kick G2H tasklet if no credits
>        drm/i915/guc: Selftest for stealing of guc ids
>
> Maxime Ripard (53):
>        Merge tag 'topic/drm-dp-training-delay-helpers-2021-10-19' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-misc-next
>        Merge drm/drm-next into drm-misc-next
>        clk: bcm-2835: Pick the closest clock rate
>        clk: bcm-2835: Remove rounding up the dividers
>        drm/vc4: hdmi: Set a default HSM rate
>        drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
>        drm/vc4: hdmi: Make sure the controller is powered in detect
>        drm/vc4: hdmi: Make sure the controller is powered up during bind
>        drm/vc4: hdmi: Rework the pre_crtc_configure error handling
>        drm/vc4: hdmi: Split the CEC disable / enable functions in two
>        drm/vc4: hdmi: Make sure the device is powered with CEC
>        drm/vc4: hdmi: Warn if we access the controller while disabled
>        drm/vc4: crtc: Make sure the HDMI controller is powered when disabling
>        drm/bridge: adv7533: Switch to devm MIPI-DSI helpers
>        drm/bridge: adv7511: Register and attach our DSI device at probe
>        drm/bridge: anx7625: Switch to devm MIPI-DSI helpers
>        drm/bridge: anx7625: Register and attach our DSI device at probe
>        drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers
>        drm/bridge: lt8912b: Register and attach our DSI device at probe
>        drm/bridge: lt9611: Switch to devm MIPI-DSI helpers
>        drm/bridge: lt9611: Register and attach our DSI device at probe
>        drm/bridge: lt9611uxc: Switch to devm MIPI-DSI helpers
>        drm/bridge: lt9611uxc: Register and attach our DSI device at probe
>        drm/bridge: ps8640: Switch to devm MIPI-DSI helpers
>        drm/bridge: ps8640: Register and attach our DSI device at probe
>        drm/bridge: sn65dsi83: Fix bridge removal
>        drm/bridge: sn65dsi83: Switch to devm MIPI-DSI helpers
>        drm/bridge: sn65dsi83: Register and attach our DSI device at probe
>        drm/bridge: sn65dsi86: Switch to devm MIPI-DSI helpers
>        drm/bridge: sn65dsi86: Register and attach our DSI device at probe
>        drm/bridge: tc358775: Switch to devm MIPI-DSI helpers
>        drm/bridge: tc358775: Register and attach our DSI device at probe
>        drm/kirin: dsi: Adjust probe order
>        drm/vc4: hdmi: Remove the DDC probing for status detection
>        drm/vc4: hdmi: Fix HPD GPIO detection
>        drm/vc4: Make vc4_crtc_get_encoder public
>        drm/vc4: crtc: Add encoder to vc4_crtc_config_pv prototype
>        drm/vc4: crtc: Rework the encoder retrieval code (again)
>        drm/vc4: crtc: Add some logging
>        drm/vc4: Leverage the load tracker on the BCM2711
>        drm/vc4: hdmi: Raise the maximum clock rate
>        drm/vc4: hdmi: Enable the scrambler on reconnection
>        drm/vc4: Increase the core clock based on HVS load
>        drm/vc4: crtc: Drop feed_txp from state
>        drm/vc4: Fix non-blocking commit getting stuck forever
>        drm/vc4: crtc: Copy assigned channel to the CRTC
>        drm/vc4: hdmi: Add a spinlock to protect register access
>        drm/vc4: hdmi: Use a mutex to prevent concurrent framework access
>        drm/vc4: hdmi: Prevent access to crtc->state outside of KMS
>        drm/vc4: hdmi: Check the device state in prepare()
>        drm/vc4: hdmi: Introduce an output_enabled flag
>        drm/vc4: hdmi: Introduce a scdc_enabled flag
>        drm/vc4: kms: Wait for the commit before increasing our clock rate
>
> Maíra Canal (1):
>        drm/exynos: Replace legacy gpio interface for gpiod interface
>
> Meenakshikumar Somasundaram (3):
>        drm/amd/display: Add hpd pending flag to indicate detection of new hpd
>        drm/amd/display: Fix for otg synchronization logic
>        drm/amd/display: Adding dpia debug bits for hpd delay
>
> Michael Cheng (1):
>        drm/i915: Introduce new macros for i915 PTE
>
> Michael Strauss (2):
>        drm/amd/display: Add force detile buffer size debug flag
>        drm/amd/display: Force det buf size to 192KB with 3+ streams and upscaling
>
> Michael Trimarchi (4):
>        dt-bindings: vendor-prefix: add Wanchanglong Electronics Technology
>        dt-bindings: ili9881c: add compatible string for Wanchanglong w552946aba
>        drm/panel: ilitek-ili9881d: add support for Wanchanglong W552946ABA panel
>        drm/panel: ilitek-ili9881c: Make gpio-reset optional
>
> Michael Walle (3):
>        drm/etnaviv: use PLATFORM_DEVID_NONE
>        drm/etnaviv: fix dma configuration of the virtual device
>        drm/etnaviv: use a 32 bit mask as coherent DMA mask
>
> Michal Wajdeczko (1):
>        drm/i915/uc: Prepare for different firmware key sizes
>
> Michał Winiarski (7):
>        drm/i915: Store backpointer to GT in uncore
>        drm/i915: Introduce to_gt() helper
>        drm/i915/display: Use to_gt() helper
>        drm/i915/gt: Use to_gt() helper
>        drm/i915/gem: Use to_gt() helper
>        drm/i915/gvt: Use to_gt() helper
>        drm/i915: Use to_gt() helper
>
> Michel Dänzer (2):
>        drm/amd/display: Reduce stack size for
> dml31_ModeSupportAndSystemConfigurationFull
>        drm/amd/display: Reduce stack size for dml31 UseMinimumDCFCLK
>
> Mika Kahola (4):
>        drm/i915/display/dg2: Introduce CD clock squashing table
>        drm/i915/display/dg2: Sanitize CD clock
>        drm/i915/display/dg2: Set CD clock squashing registers
>        drm/i915/display/dg2: Read CD clock from squasher table
>
> Mikita Lipski (6):
>        drm/amd/display: Pass panel inst to a PSR command
>        drm/amd/display: Enable DSC over eDP
>        drm/amd/display: fix accidental casting enum to bool
>        drm/amd/display: PSR panel capability debugfs
>        drm/amd/display: prevent reading unitialized links
>        drm/amd/display: parse and check PSR SU caps
>
> Mikko Perttunen (3):
>        drm/tegra: Add NVDEC driver
>        drm/tegra: Bump VIC/NVDEC clock rates to Fmax
>        drm/tegra: vic: Use autosuspend
>
> Mullati, Siva (1):
>        drm/i915: abstraction for iosf to compile on all archs
>
> Mustapha Ghaddar (1):
>        drm/amd/display: Fix for the no Audio bug with Tiled Displays
>
> Nathan Chancellor (1):
>        drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk()
>
> Neil Armstrong (9):
>        drm/bridge: synopsys: dw-hdmi: also allow interlace on bridge
>        drm/bridge: dw-hdmi: handle ELD when DRM_BRIDGE_ATTACH_NO_CONNECTOR
>        drm/bridge: display-connector: implement bus fmts callbacks
>        drm/meson: remove useless recursive components matching
>        drm/meson: split out encoder from meson_dw_hdmi
>        drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR
>        drm/meson: rename venc_cvbs to encoder_cvbs
>        drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR
>        drm/omap: add sanity plane state check
>
> Nevenko Stupar (1):
>        drm/amd/display: Display object info table changes
>
> Nicholas Kazlauskas (17):
>        drm/amd/display: Fix detection of aligned DMUB firmware meta info
>        drm/amd/display: Only flush delta from last command execution
>        drm/amd/display: Fix DPIA outbox timeout after GPU reset
>        drm/amd/display: Run full global validation in dc_commit_state
>        drm/amd/display: Set plane update flags for all planes in reset
>        drm/amd/display: Reset link encoder assignments for GPU reset
>        drm/amdgpu/display: Only set vblank_disable_immediate when PSR
> is not enabled
>        drm/amd/display: Allow DSC on supported MST branch devices
>        drm/amd/display: Fix DPIA outbox timeout after S3/S4/reset
>        drm/amd/display: Query DMCUB for dp alt status
>        drm/amd/display: Fix out of bounds access on DNC31 stream encoder regs
>        drm/amd/display: Set exit_optimized_pwr_state for DCN31
>        drm/amd/display: Reset DMCUB before HW init
>        drm/amd/display: Fix USB4 null pointer dereference in
> update_psp_stream_config
>        drm/amd/display: Block z-states when stutter period exceeds criteria
>        drm/amd/display: Send s0i2_rdy in stream_count == 0 optimization
>        drm/amd/display: Set optimize_pwr_state for DCN31
>
> Nikola Pavlica (1):
>        drm/panel-simple: Add Vivax TPC-9150 panel v6
>
> Nirmoy Das (2):
>        drm/amdgpu: remove unnecessary checks
>        drm/amdgpu: return early on error while setting bar0 memtype
>
> Oleksij Rempel (1):
>        drm: panel-simple: Add support for the Innolux G070Y2-T02 panel
>
> Oliver Logush (1):
>        drm/amd/display: Rename a struct field to describe a cea component better
>
> Paul Cercueil (7):
>        drm/ingenic: Simplify code by using hwdescs array
>        drm/ingenic: Add support for private objects
>        drm/ingenic: Move IPU scale settings to private state
>        drm/ingenic: Set DMA descriptor chain register when starting CRTC
>        drm/ingenic: Upload palette before frame
>        drm/ingenic: Attach bridge chain to encoders
>        drm/ingenic: Remove bogus register write
>
> Paulo Zanoni (1):
>        drm/i915: rework some irq functions to take intel_gt as argument
>
> Perry Yuan (2):
>        drm/amd/pm: add GFXCLK/SCLK clocks level print support for APUs
>        drm/amd/display: add connector type check for CRC source set
>
> Peter Collingbourne (1):
>        lontium-lt9611: check a different register bit for HDMI sensing
>
> Philip Chen (2):
>        drm/bridge: parade-ps8640: Enable runtime power management
>        drm/bridge: parade-ps8640: Populate devices on aux-bus
>
> Philip Yang (15):
>        drm/amdgpu: IH process reset count when restart
>        drm/amdkfd: process exit and retry fault race
>        drm/amdkfd: handle VMA remove race
>        drm/amdkfd: simplify drain retry fault
>        drm/amdgpu: enable Navi 48-bit IH timestamp counter
>        drm/amdgpu: enable Navi retry fault wptr overflow
>        drm/amdgpu: handle IH ring1 overflow
>        drm/amdkfd: set "r = 0" explicitly before goto
>        drm/amdkfd: fix double free mem structure
>        drm/amdkfd: process_info lock not needed for svm
>        drm/amdkfd: err_pin_bo path leaks kfd_bo_list
>        drm/amdgpu: Handle fault with same timestamp
>        drm/amdgpu: Detect if amdgpu in IOMMU direct map mode
>        drm/amdgpu: Reduce SG bo memory usage for mGPUs
>        drm/amdkfd: fix svm_bo release invalid wait context warning
>
> Prike Liang (1):
>        drm/amd/pm: skip setting gfx cgpg in the s0ix suspend-resume
>
> Qiang Yu (1):
>        drm/lima: fix warning when CONFIG_DEBUG_SG=y & CONFIG_DMA_API_DEBUG=y
>
> Qing Wang (3):
>        drm/panel: dsi-cm: replace snprintf in show functions with sysfs_emit
>        video: fbdev: replace snprintf in show functions with sysfs_emit
>        video: omapfb: replace snprintf in show functions with sysfs_emit
>
> Radhakrishna Sripada (2):
>        drm/i915: Update memory bandwidth formulae
>        drm/i915: Fix Memory BW formulae for ADL-P
>
> Raffaele Tranquillini (2):
>        dt-bindings: panel-simple-dsi: add JDI R63452 panel bindings
>        drm/panel: Add JDI R63452 MIPI DSI panel driver
>
> Rajat Jain (1):
>        drm/connector: Add support for privacy-screen properties (v4)
>
> Rajneesh Bhardwaj (1):
>        drm/amdgpu: Don't inherit GEM object VMAs in child process
>
> Ramalingam C (1):
>        drm/i915/dg2: Add Wa_16013000631
>
> Ramesh Errabolu (3):
>        drm/amdgpu: Update BO memory accounting to rely on allocation flag
>        drm/amdgpu: Pin MMIO/DOORBELL BO's in GTT  domain
>        drm/amdgpu: Declare Unpin BO api as static
>
> Randy Dunlap (3):
>        drm: ttm: correct ttm_range_manager kernel-doc notation
>        drm/i915/gem: placate scripts/kernel-doc
>        gpu: host1x: Drop excess kernel-doc entry @key
>
> Raviteja Goud Talla (1):
>        drm/i915/gen11: Moving WAs to icl_gt_workarounds_init()
>
> Rikard Falkeborn (1):
>        drm/etnaviv: constify static struct cooling_ops
>
> Rob Clark (22):
>        drm/msm/dsi: Adjust probe order
>        drm/msm: Remove unnecessary struct_mutex
>        drm/msm: Drop priv->lastctx
>        drm/msm: Remove struct_mutex usage
>        drm/msm: Handle fence rollover
>        drm/msm: Add debugfs to disable hw err handling
>        drm/msm/adreno: Name the shadow buffer
>        drm/msm/gpu: Respect PM QoS constraints
>        drm/msm/gpu: Add some WARN_ON()s
>        drm/msm/gpu: Make a6xx_get_gmu_log() more generic
>        drm/msm/gpu: Also snapshot GMU HFI buffer
>        drm/msm/gpu: Snapshot GMU debug buffer
>        drm/msm/gpu: Add a comment in a6xx_gmu_init()
>        drm/msm/gpu: Name GMU bos
>        Merge remote-tracking branch 'drm/drm-next' into msm-next-staging
>        drm/msm/gpu: Don't allow zero fence_id
>        drm/bridge: sn65dsi86: defer if there is no dsi host
>        drm/msm/a6xx: Skip crashdumper state if GPU needs_hw_init
>        drm/msm/disp: Tweak display snapshot to match gpu snapshot
>        drm/msm/disp: Export helper for capturing snapshot
>        drm/msm/debugfs: Add display/kms state snapshot
>        drm/msm: Don't use autosuspend for display
>
> Robert Beckett (1):
>        drm/i915/ttm: fix large buffer population trucation
>
> Robin Chen (1):
>        drm/amd/display: To support sending TPS3 pattern when restoring link
>
> Robin Murphy (2):
>        drm/tegra: vic: Fix DMA API misuse
>        gpu: host1x: Add missing DMA API include
>
> Rodrigo Siqueira (6):
>        Documentation/gpu: Reorganize DC documentation
>        Documentation/gpu: Document amdgpu_dm_visual_confirm debugfs entry
>        Documentation/gpu: Document pipe split visual confirmation
>        Documentation/gpu: How to collect DTN log
>        Documentation/gpu: Add basic overview of DC pipeline
>        Documentation/gpu: Add amdgpu and dc glossary
>
> Rodrigo Vivi (2):
>        drm/i915: Clean-up bonding debug message.
>        drm/i915: Don't propagate the gen split confusion further
>
> Roland Scheidegger (2):
>        drm/vmwgfx: support SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2 command
>        drm/vmwgfx: add support for updating only offsets of constant buffers
>
> Roman Li (1):
>        drm/amd/display: Fix OLED brightness control on eDP
>
> Roy Chan (1):
>        drm/amd/display: fix stale info in link encoder assignment
>
> Sam Ravnborg (1):
>        drm/tiny: ili9163: fix build
>
> Sankeerth Billakanti (5):
>        dt-bindings: msm/dp: Add DP compatible strings for sc7280
>        drm/msm/dp: Add DP controllers for sc7280
>        drm/dp: Add macro to check max_downspread capability
>        drm/msm/dp: Enable downspread for supported DP sinks
>        drm/msm/dp: Enable ASSR for supported DP sinks
>
> Sean Paul (4):
>        drm/msm/dpu_kms: Re-order dpu includes
>        drm/msm/dpu: Remove useless checks in dpu_encoder
>        drm/msm/dpu: Remove encoder->enable() hack
>        drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
>
> Sebastian Andrzej Siewior (1):
>        drm/i915: Don't disable interrupts and pretend a lock as been
> acquired in __timeline_mark_lock().
>
> Shawn Guo (2):
>        dt-bindings: display: Add Sony Tulip Truly NT35521 panel support
>        drm/panel: Add Sony Tulip Truly NT35521 driver
>
> Shen, George (2):
>        drm/amd/display: Clear DPCD lane settings after repeater training
>        drm/amd/display: Refactor vendor specific link training sequence
>
> Shirish S (1):
>        drm/amd/display: log amdgpu_dm_atomic_check() failure cause
>
> Shunsuke Mie (1):
>        dma-buf: Update obsoluted comments on dma_buf_vmap/vunmap()
>
> Simon Ser (7):
>        drm/sysfs: introduce drm_sysfs_connector_hotplug_event
>        drm/probe-helper: add drm_kms_helper_connector_hotplug_event
>        drm/connector: use drm_sysfs_connector_hotplug_event
>        amdgpu: use drm_kms_helper_connector_hotplug_event
>        drm/probe-helper: use drm_kms_helper_connector_hotplug_event
>        i915/display/dp: send a more fine-grained link-status uevent
>        drm: document DRM_IOCTL_MODE_GETFB2
>
> Siva Mullati (1):
>        drm/i915: Skip remap_io_mapping() for non-x86 platforms
>
> Solomon Chiu (1):
>        drm/amd/display: Add src/ext ID info for dummy service
>
> Stanislav Lisovskiy (3):
>        drm/i915/dg2: Implement WM0 cursor WA for DG2
>        drm/i915/dg2: Tile 4 plane format support
>        Revert "drm/i915/dg2: Tile 4 plane format support"
>
> Stanley.Yang (8):
>        drm/amd/pm: Update smu driver interface for aldebaran
>        drm/amdgpu: add new query interface for umc block v2
>        drm/amd/pm: add message smu to get ecc_table v2
>        drm/amdgpu: query umc error info from ecc_table v2
>        drm/amdgpu: fix disable ras feature failed when unload drvier v2
>        drm/amdgpu: skip query ecc info in gpu recovery
>        drm/amdgpu: only skip get ecc info for aldebaran
>        drm/amdgpu: skip umc ras error count harvest
>
> Stephen Boyd (1):
>        drm/bridge: ti-sn65dsi86: Set max register for regmap
>
> Stephen Rothwell (1):
>        drm/locking: fix __stack_depot_* name conflict
>
> Stuart Summers (2):
>        drm/i915/xehpsdv: Add initial workarounds
>        drm/i915: Add has_64k_pages flag
>
> Stylon Wang (1):
>        drm/amd/display: Enable P010 for DCN3x ASICs
>
> Sung Joon Kim (3):
>        drm/amd/display: retain/release stream pointer in link enc table
>        drm/amd/display: Revert "retain/release stream pointer in link enc table"
>        drm/amd/display: retain/release at proper places in link_enc assignment
>
> Surbhi Kakarya (2):
>        drm/amd/pm: add new fields for Sienna Cichlid.
>        drm/amdgpu: Check the memory can be accesssed by
> ttm_device_clear_dma_mappings.
>
> Tao Zhou (7):
>        drm/amdgpu: support new mode-1 reset interface (v2)
>        drm/amdgpu: enable RAS poison flag when GPU is connected to CPU
>        drm/amdgpu: add gpu reset control for umc page retirement
>        drm/amdkfd: add reset parameter for unmap queues
>        drm/amdkfd: add reset queue function for RAS poison (v2)
>        drm/amdkfd: reset queue which consumes RAS poison (v2)
>        drm/amdgpu: save error count in RAS poison handler
>
> Tejas Upadhyay (3):
>        drm/i915/gt: Hold RPM wakelock during PXP suspend
>        drm/i915/adl_p: Add ddc pin mapping
>        drm/i915/gt: Use hw_engine_masks as reset_domains
>
> Thierry Reding (9):
>        Merge branch 'tegra-for-5.17-soc-opp' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
> drm/tegra/for-next
>        drm/tegra: Implement correct DMA-BUF semantics
>        drm/tegra: Implement buffer object cache
>        drm/tegra: Do not reference tegra_plane_funcs directly
>        drm/tegra: Propagate errors from drm_gem_plane_helper_prepare_fb()
>        drm/tegra: Support asynchronous commits for cursor
>        drm/tegra: gr2d: Explicitly control module reset
>        drm/tegra: vic: Handle tegra_drm_alloc() failure
>        dt-bindings: display: bridge: lvds-codec: Fix duplicate key
>
> Thomas Hellström (21):
>        drm/i915/gem: Break out some shmem backend utils
>        drm/i915: Introduce refcounted sg-tables
>        drm/i915/ttm: Reorganize the ttm move code
>        drm/i915/ttm: Failsafe migration blits
>        drm/i915/gem: Fix gem_madvise for ttm+shmem objects
>        drm/i915/selftests: Use clear_and_wake_up_bit() for the
> per-engine reset bitlocks
>        drm/i915/ttm: Fix illegal addition to shrinker list
>        drm/i915/ttm: Move the i915_gem_obj_copy_ttm() function
>        drm/i915/ttm: Drop region reference counting
>        drm/i915/ttm: Correctly handle waiting for gpu when shrinking
>        drm/i915/ttm: Implement asynchronous TTM moves
>        drm/i915/ttm: Update i915_gem_obj_copy_ttm() to be asynchronous
>        drm/i915: Avoid allocating a page array for the gpu coredump
>        drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code
>        dma_fence_array: Fix PENDING_ERROR leak in dma_fence_array_signaled()
>        drm/i915: Update error capture code to avoid using the current vma state
>        drm/i915: Fix coredump of perma-pinned vmas
>        drm/i915: Don't leak the capture list items
>        drm/i915: Avoid using the i915_fence_array when collecting dependencies
>        drm/i915: Break out the i915_deps utility
>        drm/i915: Require the vm mutex for i915_vma_bind()
>
> Thomas Zimmermann (46):
>        drm/gma500: Move helpers for struct gtt_range from gtt.c to gem.c
>        drm/gma500: Use to_gtt_range() everywhere
>        drm/gma500: Reimplement psb_gem_create()
>        drm/gma500: Allocate GTT ranges in stolen memory with psb_gem_create()
>        drm/gma500: Rename psb_gtt_{pin,unpin}() to psb_gem_{pin,unpin}()
>        drm/gma500: Inline psb_gtt_attach_pages() and psb_gtt_detach_pages()
>        drm/gma500: Inline psb_gtt_{alloc,free}_range() into rsp callers
>        drm/gma500: Set page-caching flags in GEM pin/unpin
>        drm/gma500: Rewrite GTT page insert/remove without struct gtt_range
>        drm/gma500: Rename struct gtt_range to struct psb_gem_object
>        drm/gma500: Remove generic DRM drivers in probe function
>        drm/rockchip: Implement mmap as GEM object function
>        drm: Build drm_irq.o only if CONFIG_DRM_LEGACY has been set
>        drm: Link several object files into drm_kms_helper.ko
>        drm: Move GEM memory managers into modules
>        drm: Link CMA framebuffer helpers into KMS helper library
>        drm/xen: Implement mmap as GEM object function
>        drm: Update documentation and TODO of gem_prime_mmap hook
>        drm/format-helper: Export drm_fb_clip_offset()
>        drm/format-helper: Rework format-helper memcpy functions
>        drm/format-helper: Add destination-buffer pitch to drm_fb_swab()
>        drm/format-helper: Rework format-helper conversion functions
>        drm/format-helper: Streamline blit-helper interface
>        drm/fb-helper: Allocate shadow buffer of surface height
>        drm/simpledrm: Enable FB_DAMAGE_CLIPS property
>        drm/simpledrm: Support virtual screen sizes
>        drm: Clarify semantics of struct drm_mode_config.{min,
> max}_{width, height}
>        drm/shmem-helper: Unexport drm_gem_shmem_create_with_handle()
>        drm/shmem-helper: Export dedicated wrappers for GEM object functions
>        drm/shmem-helper: Pass GEM shmem object in public interfaces
>        Merge drm/drm-next into drm-misc-next
>        drm/ttm: Don't include drm_hashtab.h
>        drm/vmwgfx: Copy DRM hash-table code into driver
>        drm: Declare hashtable as legacy
>        drm/cma-helper: Move driver and file ops to the end of header
>        drm/cma-helper: Export dedicated wrappers for GEM object functions
>        drm/cma-helper: Pass GEM CMA object in public interfaces
>        drm/mipi-dbi: Remove dependency on GEM CMA helper library
>        drm: Remove CONFIG_DRM_KMS_CMA_HELPER option
>        drm: Return error codes from struct drm_driver.gem_create_object
>        drm/ast: Handle failed I2C initialization gracefully
>        drm/ast: Convert I2C code to managed cleanup
>        drm/ast: Move I2C code into separate source file
>        Merge drm/drm-next into drm-misc-next
>        Merge drm/drm-next into drm-misc-next-fixes
>        drm/exynos: Implement mmap as GEM object function
>
> Tilak Tangudu (2):
>        drm/i915: Disable D3Cold in s2idle and runtime pm
>        drm/i915/rpm: Enable runtime pm autosuspend by default
>
> Tomi Valkeinen (1):
>        drm/omap: increase DSS5 max tv pclk to 192MHz
>
> Tvrtko Ursulin (5):
>        drm/i915: Skip error capture when wedged on init
>        Merge drm/drm-next into drm-intel-gt-next
>        Revert "drm/i915/dmabuf: fix broken build"
>        Merge drm/drm-next into drm-intel-gt-next
>        drm/i915: Use per device iommu check
>
> Uma Shankar (3):
>        drm/i915/xelpd: Enable Pipe color support for D13 platform
>        drm/i915/xelpd: Enable Pipe Degamma
>        drm/i915/xelpd: Add Pipe Color Lut caps to platform config
>
> Umesh Nerlige Ramappa (7):
>        drm/i915/pmu: Add a name to the execlists stats
>        drm/i915/pmu: Connect engine busyness stats from GuC to pmu
>        drm/i915/pmu: Avoid with_intel_runtime_pm within spinlock
>        drm/i915/pmu: Increase the live_engine_busy_stats sample period
>        drm/i915/pmu: Fix synchronization of PMU callback with reset
>        drm/i915/pmu: Wait longer for busyness data to be available from GuC
>        drm/i915/pmu: Fix wakeref leak in PMU busyness during reset
>
> Vandita Kulkarni (4):
>        Revert "drm/i915/tgl/dsi: Gate the ddi clocks after pll mapping"
>        drm/i915/dsi/xelpd: Fix the bit mask for wakeup GB
>        drm/i915/dsi/xelpd: Add DSI transcoder support
>        drm/i915/dsi/xelpd: Disable DC states in Video mode
>
> Victor Skvortsov (7):
>        drm/amdgpu: SRIOV flr_work should use down_write
>        drm/amdgpu: Separate vf2pf work item init from virt data exchange
>        drm/amdgpu: Add *_SOC15_IP_NO_KIQ() macro definitions
>        drm/amdgpu: Modify indirect register access for gmc_v9_0 sriov
>        drm/amdgpu: Modify indirect register access for amdkfd_gfx_v9 sriov
>        drm/amdgpu: get xgmi info before ip_init
>        drm/amdgpu: Modify indirect register access for gfx9 sriov
>
> Vidya Srinivas (1):
>        drm/i915: Add PLANE_CUS_CTL restriction in max_width
>
> Ville Syrjälä (109):
>        drm/i915: Move the pxp plane state computation
>        drm/i915: Fix up skl_program_plane() pxp stuff
>        drm/i915: Remove the drm_dbg() from the vblank evade critical section
>        drm/i915: Rename intel_load_plane_csc_black()
>        drm/i915: Move PCH refclock stuff into its own file
>        drm/i915: Move PCH modeset code to its own file
>        drm/i915: Clean up the {ilk,lpt}_pch_enable() calling convention
>        drm/i915: Move LPT PCH readout code
>        drm/i915: Extract ilk_pch_get_config()
>        drm/i915: Move iCLKIP readout to the pch code
>        drm/i915: Introduce ilk_pch_disable() and ilk_pch_post_disable()
>        drm/i915: Move intel_ddi_fdi_post_disable() to fdi code
>        drm/i915: Introduce lpt_pch_disable()
>        drm/i915: Move function prototypes to the correct header
>        drm/i915/hdmi: Split intel_hdmi_bpc_possible() to source vs. sink pair
>        drm/i915/hdmi: Introduce intel_hdmi_is_ycbr420()
>        drm/i915/hdmi: Introduce intel_hdmi_tmds_clock()
>        drm/i915/hdmi: Unify "4:2:0 also" logic between .mode_valid()
> and .compute_config()
>        drm/i915/hdmi: Extract intel_hdmi_output_format()
>        drm/i915/psr: Disable PSR before modesets turn off all planes
>        Revert "drm/i915/display: Disable audio, DRRS and PSR before planes"
>        drm/i915: Disable all planes before modesetting any pipes
>        drm/i915: Introduce intel_master_crtc()
>        drm/i915: Simplify intel_crtc_copy_uapi_to_hw_state_nomodeset()
>        drm/i915: Split PPS write from DSC enable
>        drm/i915: Perform correct cpu_transcoder readout for bigjoiner
>        drm/i915: Reduce bigjoiner special casing
>        drm/i915: Nuke PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE
>        drm/i915: Fix type1 DVI DP dual mode adapter heuristic for
> modern platforms
>        drm/i915: Fix icl+ combo phy static lane power down setup
>        drm/i915: Don't request GMBUS to generate irqs when called while
> irqs are off
>        drm/i915/hdmi: Turn DP++ TMDS output buffers back on in
> encoder->shutdown()
>        drm/i915: Stop using group access when progrmming icl combo phy TX
>        drm/i915: Query the vswing levels per-lane for icl combo phy
>        drm/i915: Query the vswing levels per-lane for icl mg phy
>        drm/i915: Query the vswing levels per-lane for tgl dkl phy
>        drm/i915: Query the vswing levels per-lane for snps phy
>        drm/i915: Enable per-lane drive settings for icl+
>        drm/i915: Use intel_de_rmw() for tgl dkl phy programming
>        drm/i915: Use intel_de_rmw() for icl mg phy programming
>        drm/i915: Use intel_de_rmw() for icl combo phy programming
>        drm/i915: Reject planar formats when doing async flips
>        drm/i915: Fix async flip with decryption and/or DPT
>        drm/i915: Fix up the sprite namespacing
>        drm/i915: Split update_plane() into update_noarm() + update_arm()
>        drm/i915: Split skl+ plane update into noarm+arm pair
>        drm/i915: Split pre-skl primary plane update into noarm+arm pair
>        drm/i915: Split g4x+ sprite plane update into noarm+arm pair
>        drm/i915: Split ivb+ sprite plane update into noarm+arm pair
>        drm/i915: Split vlv/chv sprite plane update into noarm+arm pair
>        drm/i915: Do vrr push before sampling the frame counter
>        drm/i915: Use vblank workers for gamma updates
>        drm/i915: Use unlocked register accesses for LUT loads
>        drm/i915: Call intel_update_active_dpll() for both bigjoiner pipes
>        drm/i915/fbc: Extract snb_fbc_program_fence()
>        drm/i915/fbc: Extract {skl,glk}_fbc_program_cfb_stride()
>        drm/i915/fbc: Just use params->fence_y_offset always
>        drm/i915/fbc: Introduce intel_fbc_is_compressing()
>        drm/i915/fbc: Extract helpers to compute FBC control register values
>        drm/i915/fbc: Introduce intel_fbc_funcs
>        drm/i915/fbc: Introduce .nuke() vfunc
>        drm/i915/fbc: s/gen7/ivb/
>        drm/i915/fbc: Introduce .program_cfb() vfunc
>        drm/i915/fbc: Introduce intel_fbc_set_false_color()
>        drm/i915/fbc: Nuke BDW_FBC_COMP_SEG_MASK
>        drm/i915/fbc: Clean up all register defines
>        drm/i915/fbc: Finish polishing FBC1 registers
>        drm/i915: Relocate FBC_LLC_READ_CTRL
>        drm/i915/fbc: s/dev_priv/i915/
>        drm/i915/fbc: Start passing around intel_fbc
>        drm/1915/fbc: Replace plane->has_fbc with a pointer to the fbc instance
>        drm/i915: Move vrr push after the frame counter sampling again
>        drm/i915: Do vblank evasion correctly if vrr push has already been sent
>        drm/i915: Fix framestart_delay commens in VRR code
>        drm/i915: Declare .(de)gamma_lut_tests for icl+
>        drm/i915: Disable DSB usage for now
>        drm/i915: Clean up FPGA_DBG/CLAIM_ER bits
>        drm/i915: Clean up DPINVGTT/VLV_DPFLIPSTAT bits
>        drm/i915: Clean up CRC register defines
>        drm/i915: Get rid of the 64bit PLANE_CC_VAL mmio
>        drm/i915: Rename plane YUV order bits
>        drm/i915: Rename PLANE_CUS_CTL Y plane bits
>        drm/i915/fbc: Eliminate racy intel_fbc_is_active() usage
>        drm/i915/fbc: Pass whole plane state to intel_fbc_min_limit()
>        drm/i915/fbc: Nuke lots of crap from intel_fbc_state_cache
>        drm/i915/fbc: Relocate intel_fbc_override_cfb_stride()
>        drm/i915/fbc: Nuke more FBC state
>        drm/i915/fbc: Reuse the same struct for the cache and params
>        drm/i915/fbc: Pass around FBC instance instead of crtc
>        drm/i915/fbc: Track FBC usage per-plane
>        drm/i915/fbc: Flatten __intel_fbc_pre_update()
>        drm/i915/fbc: Pass i915 instead of FBC instance to FBC underrun stuff
>        drm/i915/fbc: Move FBC debugfs stuff into intel_fbc.c
>        drm/i915/fbc: Introduce intel_fbc_add_plane()
>        drm/i915/fbc: Allocate intel_fbc dynamically
>        drm/i915/fbc: Move stuff from intel_fbc_can_enable() into
> intel_fbc_check_plane()
>        drm/i915/fbc: Disable FBC fully on FIFO underrun
>        drm/i915/fbc: Nuke state_cache
>        drm/i915/fbc: Move plane pointer into intel_fbc_state
>        drm/i915/fbc: s/parms/fbc_state/
>        drm/i915/fbc: No FBC+double wide pipe
>        drm/i915/fbc: Pimp the FBC debugfs output
>        drm/i915: Get rid of the "sizes are 0 based" stuff
>        drm/i915: Allow cdclk squasher to be reconfigured live
>        drm/i915: Nuke {pipe,plane}_to_crtc_mapping[]
>        drm/i915: Relocate intel_crtc_for_plane()
>        drm/i915: s/intel_get_first_crtc/intel_first_crtc/
>        drm/i915: Move pipe/transcoder/abox masks under intel_device_info.display
>        drm/i915/fbc: Remember to update FBC state even when not reallocating CFB
>
> Vinay Belgaumkar (5):
>        drm/i915/guc/slpc: Define and initialize boost frequency
>        drm/i915/guc/slpc: Add waitboost functionality for SLPC
>        drm/i915/guc/slpc: Update boost sysfs hooks for SLPC
>        drm/i915/guc/slpc: Check GuC status before freq boost
>        drm/i915/guc: Request RP0 before loading firmware
>
> Vlad Zahorodnii (1):
>        drm/amd/display: Use oriented source size when checking cursor scaling
>
> Vladimir Lypak (2):
>        drm/msm/a5xx: Add support for Adreno 506 GPU
>        drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540
>
> Wan Jiabing (2):
>        drm/i915: Use ERR_CAST instead of ERR_PTR(PTR_ERR())
>        drm/tegra: Remove duplicate struct declaration
>
> Wang Hai (1):
>        drm: fix null-ptr-deref in drm_dev_init_release()
>
> Wayne Lin (2):
>        drm/amd/display: Fix bug in debugfs crc_win_update entry
>        drm/amd/display: Add debugfs entry for ILR
>
> Wenjing Liu (7):
>        drm/amd/display: set MSA vsp/hsp to 0 for positive polarity for
> DP 128b/132b
>        drm/amd/display: add a debug option to force dp2 lt fallback method
>        drm/amd/display: define link res and make it accessible to all
> link interfaces
>        drm/amd/display: populate link res in both detection and validation
>        drm/amd/display: access hpo dp link encoder only through link resource
>        drm/amd/display: support dynamic HPO DP link encoder allocation
>        drm/amd/display: get and restore link res map
>
> Wesley Chalmers (1):
>        drm/amd/display: Add reg defs for DCN303
>
> William Tseng (2):
>        drm/i915/dsi: disable lpdt if it is not enabled
>        drm/i915/dsi: transmit brightness command in HS state
>
> Wyatt Wood (1):
>        drm/amd/display: Prevent PSR disable/reenable in HPD IRQ
>
> Xiang wangx (1):
>        drm/radeon: Fix syntax errors in comments
>
> Xin Ji (4):
>        dt-bindings:drm/bridge:anx7625:add vendor define
>        drm/bridge: anx7625: fix not correct return value
>        drm/bridge: anx7625: add MIPI DPI input feature
>        drm/bridge: anx7625: add HDMI audio function
>
> Xu Wang (1):
>        drm/radeon: correct indentation
>
> Xu, Jinze (1):
>        drm/amd/display: Reset fifo after enable otg
>
> Yang Li (4):
>        drm/v3d: nullify pointer se with a NULL
>        drm/panel: novatek-nt35950: remove unneeded semicolon
>        drm/amd/display: check top_pipe_to_program pointer
>        drm/msm/dpu: remove node from list before freeing the node
>
> Yang Wang (1):
>        drm/amdgpu: fix byteorder error in amdgpu discovery
>
> Yann Dirson (6):
>        drm/amdgpu: update fw_load_type module parameter doc to match code
>        Documentation/gpu: split amdgpu/index for readability
>        Documentation/gpu: include description of AMDGPU hardware structure
>        Documentation/gpu: include description of some of the GC microcontrollers
>        amdgpu: fix some kernel-doc markup
>        amdgpu: fix some comment typos
>
> Ye Guojin (2):
>        drm/amd/display: remove unnecessary conditional operators
>        drm/amd/display: fix cond_no_effect.cocci warnings
>
> Yi-Ling Chen (2):
>        drm/amd/display: fixed the DSC power off sequence during Driver PnP
>        drm/amd/display: Fixed DSC would not PG after removing DSC stream
>
> Yizhuo Zhai (1):
>        drm/amd/display: Fix the uninitialized variable in
> enable_stream_features()
>
> Yongqiang Niu (5):
>        drm/mediatek: Add component OVL_2L2
>        drm/mediatek: Add component POSTMASK
>        drm/mediatek: Add component RDMA4
>        drm/mediatek: Add support for Mediatek SoC MT8192
>        drm/mediatek: Clear pending flag when cmdq packet is done
>
> Zack Rusin (20):
>        drm/vmwgfx: Remove the deprecated lower mem limit
>        drm/vmwgfx: Release ttm memory if probe fails
>        drm/vmwgfx: Fail to initialize on broken configs
>        drm/vmwgfx: Introduce a new placement for MOB page tables
>        drm/vmwgfx: Switch the internal BO's to ttm_bo_type_kernel
>        drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs control
>        drm/vmwgfx: Remove the dedicated memory accounting
>        drm/vmwgfx: Add a debug callback to mobid resource manager
>        drm/vmwgfx: Stop hardcoding the PCI ID
>        drm/vmwgfx: Implement DRIVER_GEM
>        drm/vmwgfx: Implement create_handle on drm_framebuffer_funcs
>        drm/vmwgfx: Update device headers for GL43
>        drm/vmwgfx: support 64 UAVs
>        drm/vmwgfx: Allow checking for gl43 contexts
>        drm/vmwgfx: Remove usage of MOBFMT_RANGE
>        drm/vmwgfx: Bump the minor version
>        drm/vmwgfx: Fix a size_t/long int format specifier mismatch
>        drm/vmwgfx: Remove explicit transparent hugepages support
>        drm/vmwgfx: Remove unused compile options
>        drm/vmwgfx: Fix possible usage of an uninitialized variable
>
> Zhan Liu (2):
>        drm/amd/display: enable seamless boot for DCN301
>        drm/amd/display: Rename dcn_validate_bandwidth to dcn10_validate_bandwidth
>
> Zhigang Luo (4):
>        drm/amdgpu: skip reset other device in the same hive if it's SRIOV VF
>        drm/amdgpu: added PSP XGMI initialization for SRIOV VF during recover
>        drm/amdgpu: recover XGMI topology for SRIOV VF after reset
>        drm/amdgpu: extended waiting SRIOV VF reset completion timeout to 10s
>
> Zhou Qingyang (3):
>        drm/i915/gem: Fix a NULL pointer dereference in igt_request_rewind()
>        drm/amdgpu: Fix a NULL pointer dereference in
> amdgpu_connector_lcd_native_mode()
>        drm/radeon/radeon_kms: Fix a NULL pointer dereference in
> radeon_driver_open_kms()
>
> Zongmin Zhou (1):
>        drm/amdgpu: fixup bad vram size on gmc v8
>
> Zou Wei (1):
>        drm/nouveau/core/client: Mark nvkm_uclient_sclass with static keyword
>
> chen gong (2):
>        drm/amdkfd: Correct the value of the no_atomic_fw_version variable
>        drm/amdgpu: When the VCN(1.0) block is suspended, powergating is
> explicitly enabled
>
> chiminghao (1):
>        drm:amdgpu:remove unneeded variable
>
> chongjiapeng (1):
>        drm/panel: make sharp_ls055d1sx04 static
>
> hongao (1):
>        drm/amdgpu: fix set scaling mode Full/Full aspect/Center not
> works on vga and dvi connectors
>
> hvanzyll (1):
>        drm/amd/display: Visual Confirm Bar Height Adjust
>
> jason-jh.lin (4):
>        drm/mediatek: Add mbox_free_channel in mtk_drm_crtc_destroy
>        drm/mediatek: Remove unused define in mtk_drm_ddp_comp.c
>        drm/mediatek: Rename the define of register offset
>        drm/mediatek: Adjust to the alphabetic order for mediatek-drm
>
> ran jianping (1):
>        drm/amdgpu: remove unneeded variable
>
> sashank saye (1):
>        drm/amdgpu: Send Message to SMU on aldebaran passthrough for sbr handling
>
> shaoyunl (3):
>        drm/amd/amdkfd: Fix kernel panic when reset failed and been
> triggered again
>        drm/amdgpu: move kfd post_reset out of reset_sriov function
>        drm/amdgpu: adjust the kfd reset sequence in reset sriov function
>
> sungwang (1):
>        drm/amd/display: Fix ODM combine issue with fast boot
>
> tangchunyou (1):
>        nouveau/nvkm/subdev/devinit/mcp89.c:Unneeded variable
>
> xinhui pan (2):
>        drm/ttm: Put BO in its memory manager's lru list
>        drm/amdgpu: Fix double free of dmabuf
>
> yangcong (2):
>        drm/bridge: parade-ps8640: Fix additional suspend/resume at bootup
>        drm/panel: Update Boe-tv110c9m and Inx-hj110iz initial code
>
> yipechai (1):
>        drm/amdgpu: Remove the redundant code of psp bootloader functions
>
>   .mailmap                                           |    8 +
>   Documentation/admin-guide/kernel-parameters.txt    |    7 +
>   .../bindings/display/bridge/analogix,anx7625.yaml  |   65 +-
>   .../bindings/display/bridge/lvds-codec.yaml        |   43 +-
>   .../bindings/display/bridge/nxp,ptn3460.yaml       |  106 ++
>   .../devicetree/bindings/display/bridge/ptn3460.txt |   39 -
>   .../display/bridge/renesas,dsi-csi2-tx.yaml        |  118 ++
>   .../devicetree/bindings/display/bridge/sii9234.txt |   49 -
>   .../bindings/display/bridge/sil,sii9234.yaml       |  110 ++
>   .../bindings/display/msm/dp-controller.yaml        |    2 +
>   .../devicetree/bindings/display/msm/edp.txt        |   56 -
>   .../bindings/display/panel/boe,bf060y8m-aj0.yaml   |   81 +
>   .../bindings/display/panel/ilitek,ili9163.yaml     |   69 +
>   .../bindings/display/panel/ilitek,ili9881c.yaml    |    6 +-
>   .../bindings/display/panel/novatek,nt35950.yaml    |  106 ++
>   .../bindings/display/panel/panel-simple-dsi.yaml   |    2 +
>   .../bindings/display/panel/panel-simple.yaml       |    2 +
>   .../display/panel/sony,tulip-truly-nt35521.yaml    |   72 +
>   .../display/sprd/sprd,display-subsystem.yaml       |   64 +
>   .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    |   77 +
>   .../display/sprd/sprd,sharkl3-dsi-host.yaml        |   88 +
>   .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
>   Documentation/gpu/amdgpu-dc.rst                    |   74 -
>   Documentation/gpu/amdgpu.rst                       |  324 ----
>   Documentation/gpu/amdgpu/amdgpu-glossary.rst       |   87 +
>   .../gpu/amdgpu/display/config_example.svg          |  414 ++++
>   Documentation/gpu/amdgpu/display/dc-debug.rst      |   77 +
>   Documentation/gpu/amdgpu/display/dc-glossary.rst   |  237 +++
>   .../gpu/amdgpu/display/dc_pipeline_overview.svg    | 1125 +++++++++++
>   Documentation/gpu/amdgpu/display/dcn-overview.rst  |  171 ++
>   .../gpu/amdgpu/display/display-manager.rst         |   42 +
>   .../gpu/amdgpu/display/global_sync_vblank.svg      |  485 +++++
>   Documentation/gpu/amdgpu/display/index.rst         |   31 +
>   Documentation/gpu/amdgpu/driver-core.rst           |  182 ++
>   Documentation/gpu/amdgpu/driver-misc.rst           |  112 ++
>   Documentation/gpu/amdgpu/index.rst                 |   17 +
>   Documentation/gpu/amdgpu/module-parameters.rst     |    7 +
>   Documentation/gpu/amdgpu/ras.rst                   |   62 +
>   Documentation/gpu/amdgpu/thermal.rst               |   65 +
>   Documentation/gpu/amdgpu/xgmi.rst                  |    5 +
>   Documentation/gpu/drivers.rst                      |    3 +-
>   Documentation/gpu/drm-kms-helpers.rst              |   15 +
>   Documentation/gpu/drm-kms.rst                      |    2 +
>   Documentation/gpu/todo.rst                         |   37 +-
>   MAINTAINERS                                        |   23 +-
>   arch/x86/kernel/early-quirks.c                     |    1 +
>   drivers/char/agp/intel-gtt.c                       |    1 +
>   drivers/clk/bcm/clk-bcm2835.c                      |   13 +-
>   drivers/dma-buf/Makefile                           |    3 +-
>   drivers/dma-buf/dma-buf.c                          |   32 +-
>   drivers/dma-buf/dma-fence-array.c                  |    6 +-
>   drivers/dma-buf/dma-fence.c                        |   17 +
>   drivers/dma-buf/dma-resv.c                         |   26 +-
>   drivers/dma-buf/selftests.h                        |    1 +
>   drivers/dma-buf/st-dma-resv.c                      |  371 ++++
>   drivers/gpu/drm/Kconfig                            |   23 +-
>   drivers/gpu/drm/Makefile                           |   32 +-
>   drivers/gpu/drm/amd/amdgpu/Makefile                |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   12 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  138 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   97 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   18 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.h    |    9 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |  126 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |  143 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |  128 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |  124 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  155 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   35 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  218 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c   |    3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   23 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  202 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  186 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |    2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   19 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    3 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   52 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h            |    3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c       |    4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |  388 ----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  126 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   25 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   36 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   55 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |   16 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.c          |    7 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   20 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    7 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c            |    2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c            |   19 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    |    4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   18 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   73 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   16 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   44 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   28 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  169 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   15 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   57 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   68 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h           |    5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   28 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    5 +
>   drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |    6 +-
>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    4 -
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  121 +-
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    1 -
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |    1 -
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    1 -
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   12 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   13 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   94 +-
>   drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    9 +-
>   drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |    1 -
>   drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    1 -
>   drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |    1 -
>   drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    2 -
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |    5 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |    2 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    5 +-
>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |    1 +
>   drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   78 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    2 -
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   85 +-
>   drivers/gpu/drm/amd/amdgpu/soc15.c                 |   11 +-
>   drivers/gpu/drm/amd/amdgpu/soc15_common.h          |    5 +
>   drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  161 ++
>   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    7 +
>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |    1 +
>   drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    1 +
>   drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |    8 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   54 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  148 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c            |   18 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  998 +++-------
>   .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  144 +-
>   .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    5 +
>   .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |    2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |    8 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    6 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   31 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   46 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |   18 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |    2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |    8 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    8 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    4 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |   12 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   14 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   18 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   12 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |   35 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |    4 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   20 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   66 +-
>   .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   11 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    6 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  325 ++--
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    3 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   98 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   46 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  329 +++-
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    7 +-
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |    4 +
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  217 ++-
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   52 +-
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  101 +-
>   drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    6 +-
>   drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |    6 +-
>   drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    3 +-
>   .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |    2 +-
>   .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |    2 +
>   .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |    2 +-
>   .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |   43 +-
>   .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   26 +-
>   .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |    6 +-
>   .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   44 +-
>   .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |    6 +-
>   .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |   22 +-
>   .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   16 +-
>   .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |    7 +
>   .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |    6 +-
>   drivers/gpu/drm/amd/display/dc/core/dc.c           |  186 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |    2 +
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  343 +++-
>   drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |    2 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 1074 ++++++++++-
>   drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |   68 +-
>   .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   53 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |   63 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  186 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |   10 +-
>   drivers/gpu/drm/amd/display/dc/dc.h                |   35 +-
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   37 +-
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    2 +
>   drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   40 +
>   drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    3 +
>   drivers/gpu/drm/amd/display/dc/dc_link.h           |   27 +-
>   drivers/gpu/drm/amd/display/dc/dc_types.h          |    2 +
>   drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |    6 -
>   drivers/gpu/drm/amd/display/dc/dce/dce_audio.h     |    2 +
>   .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |    5 +-
>   .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |    3 +
>   drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   14 +-
>   drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |    2 +-
>   .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   66 +-
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |    8 -
>   .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |  111 +-
>   .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  125 +-
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |    1 +
>   .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |    5 +-
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |   30 -
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |   20 +-
>   .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   38 +-
>   .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   15 +
>   .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |    3 +
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |   14 -
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |    2 +
>   .../gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c   |    4 +-
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   21 +-
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |    1 +
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   18 +-
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |    4 +
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |    2 +
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |    9 +-
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |   71 +-
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.h  |    3 +
>   .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    7 +-
>   .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |    2 +
>   .../gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c    |    3 +-
>   .../gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c    |    7 +-
>   .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |    3 +-
>   .../amd/display/dc/dcn201/dcn201_link_encoder.c    |    6 +-
>   .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   18 +-
>   .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |    2 +-
>   drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |   15 +-
>   drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |    2 +
>   .../drm/amd/display/dc/dcn21/dcn21_link_encoder.c  |    9 +-
>   .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   35 +-
>   .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |   20 +-
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   36 +-
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |    1 +
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   50 +-
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |    5 +-
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |    3 +
>   .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c  |    2 +-
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |    2 +-
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    1 +
>   .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   18 +-
>   .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |    2 +
>   .../drm/amd/display/dc/dcn301/dcn301_panel_cntl.c  |   10 +-
>   .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   68 +-
>   .../gpu/drm/amd/display/dc/dcn302/dcn302_init.c    |    2 +
>   .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   22 +-
>   .../gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h    |   20 +-
>   .../gpu/drm/amd/display/dc/dcn303/dcn303_init.c    |    2 +
>   .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   21 +-
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    2 +-
>   .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   99 +-
>   .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |    6 +-
>   .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.h   |    3 +-
>   .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |    4 +-
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   43 +-
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    9 +
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |    1 +
>   .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |   10 +-
>   .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   51 +-
>   .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |   31 +
>   drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    2 +-
>   .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    8 -
>   .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  489 ++---
>   .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |    1 +
>   drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   | 1889 ++++++++++++++++++
>   .../amd/display/dc/dml/dml_wrapper_translation.c   |  284 +++
>   .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c   |   33 +-
>   .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h   |    4 -
>   drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   14 +-
>   drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       |   28 -
>   drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h       |    1 -
>   drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |    6 +-
>   drivers/gpu/drm/amd/display/dc/inc/core_status.h   |    2 +
>   drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   18 +
>   drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   17 +-
>   drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h  |    5 +-
>   drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |    2 +-
>   drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h   |   34 +
>   drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    7 +
>   drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |    3 +
>   drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    1 +
>   .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |    3 +-
>   .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    4 +
>   .../drm/amd/display/dc/inc/hw/timing_generator.h   |    2 +
>   drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    1 +
>   drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |    2 +-
>   drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |   10 +-
>   drivers/gpu/drm/amd/display/dc/inc/resource.h      |   17 +-
>   .../amd/display/dc/irq/dce110/irq_service_dce110.c |   10 +-
>   .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |    7 +-
>   .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |    7 +-
>   .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |    7 +-
>   .../amd/display/dc/irq/dcn31/irq_service_dcn31.c   |    7 +-
>   drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   42 +
>   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   61 +-
>   drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   89 +-
>   .../drm/amd/display/include/ddc_service_types.h    |    4 +
>   drivers/gpu/drm/amd/display/include/logger_types.h |    4 -
>   drivers/gpu/drm/amd/include/amd_shared.h           |    2 +
>   .../drm/amd/include/asic_reg/mp/mp_11_0_offset.h   |    7 +
>   .../drm/amd/include/asic_reg/mp/mp_11_0_sh_mask.h  |   12 +
>   .../amd/include/asic_reg/nbio/nbio_7_2_0_offset.h  |    2 -
>   .../amd/include/asic_reg/nbio/nbio_7_2_0_sh_mask.h |   12 -
>   .../gpu/drm/amd/include/cyan_skillfish_ip_offset.h |   10 +-
>   drivers/gpu/drm/amd/include/discovery.h            |   49 +
>   drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |   57 +-
>   drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    4 +
>   drivers/gpu/drm/amd/include/yellow_carp_offset.h   |    4 +-
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   21 +-
>   drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h       |    4 +-
>   drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    8 +
>   drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   31 +-
>   .../gpu/drm/amd/pm/inc/smu13_driver_if_aldebaran.h |   18 +-
>   drivers/gpu/drm/amd/pm/inc/smu_types.h             |    3 +-
>   drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |    2 +-
>   drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |    5 +-
>   drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    9 +-
>   .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |    9 +-
>   .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   14 +-
>   .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   12 +-
>   .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   10 +-
>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  150 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   22 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   10 +-
>   .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   87 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    2 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   10 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   10 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |    6 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  134 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   40 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   34 +-
>   drivers/gpu/drm/arm/Kconfig                        |    2 -
>   drivers/gpu/drm/arm/display/Kconfig                |    1 -
>   drivers/gpu/drm/aspeed/Kconfig                     |    2 +-
>   drivers/gpu/drm/ast/Makefile                       |    2 +-
>   drivers/gpu/drm/ast/ast_drv.c                      |    3 +-
>   drivers/gpu/drm/ast/ast_drv.h                      |    3 +
>   drivers/gpu/drm/ast/ast_i2c.c                      |  152 ++
>   drivers/gpu/drm/ast/ast_mode.c                     |  151 +-
>   drivers/gpu/drm/atmel-hlcdc/Kconfig                |    1 -
>   drivers/gpu/drm/bridge/Kconfig                     |    1 +
>   drivers/gpu/drm/bridge/adv7511/adv7511.h           |    1 -
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   15 +-
>   drivers/gpu/drm/bridge/adv7511/adv7533.c           |   20 +-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |   14 +-
>   drivers/gpu/drm/bridge/analogix/anx7625.c          |  495 ++++-
>   drivers/gpu/drm/bridge/analogix/anx7625.h          |   23 +-
>   drivers/gpu/drm/bridge/display-connector.c         |   88 +-
>   drivers/gpu/drm/bridge/lontium-lt8912b.c           |   31 +-
>   drivers/gpu/drm/bridge/lontium-lt9611.c            |   66 +-
>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   65 +-
>   drivers/gpu/drm/bridge/lvds-codec.c                |   36 +-
>   .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   40 +-
>   drivers/gpu/drm/bridge/parade-ps8640.c             |  347 ++--
>   .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    |   10 +-
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h    |    4 +-
>   .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |    9 +-
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   13 +-
>   drivers/gpu/drm/bridge/tc358768.c                  |   94 +-
>   drivers/gpu/drm/bridge/tc358775.c                  |   50 +-
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  128 +-
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  475 ++++-
>   drivers/gpu/drm/drm_atomic.c                       |  180 +-
>   drivers/gpu/drm/drm_atomic_helper.c                |  243 +--
>   drivers/gpu/drm/drm_atomic_uapi.c                  |    6 +-
>   drivers/gpu/drm/drm_auth.c                         |   12 +-
>   drivers/gpu/drm/drm_connector.c                    |  205 +-
>   drivers/gpu/drm/drm_dp_helper.c                    |  261 ++-
>   drivers/gpu/drm/drm_drv.c                          |   13 +-
>   drivers/gpu/drm/drm_fb_helper.c                    |    2 +-
>   drivers/gpu/drm/drm_format_helper.c                |  311 +--
>   drivers/gpu/drm/drm_fourcc.c                       |    3 +
>   drivers/gpu/drm/drm_gem_atomic_helper.c            |   14 +-
>   drivers/gpu/drm/drm_gem_cma_helper.c               |   95 +-
>   drivers/gpu/drm/drm_gem_shmem_helper.c             |  153 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c              |    4 +-
>   drivers/gpu/drm/drm_hashtab.c                      |   10 +-
>   drivers/gpu/drm/drm_irq.c                          |    2 -
>   drivers/gpu/drm/drm_legacy.h                       |   40 +-
>   drivers/gpu/drm/drm_mipi_dbi.c                     |   40 +-
>   drivers/gpu/drm/drm_nomodeset.c                    |   24 +
>   drivers/gpu/drm/drm_of.c                           |   33 +
>   drivers/gpu/drm/drm_panel_orientation_quirks.c     |    6 +
>   drivers/gpu/drm/drm_privacy_screen.c               |  467 +++++
>   drivers/gpu/drm/drm_privacy_screen_x86.c           |   86 +
>   drivers/gpu/drm/drm_probe_helper.c                 |   48 +-
>   drivers/gpu/drm/drm_sysfs.c                        |   25 +
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   41 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   33 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |   10 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |    1 +
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    4 +-
>   drivers/gpu/drm/exynos/exynos_drm_drv.c            |   13 +-
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   49 +-
>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   20 +-
>   drivers/gpu/drm/exynos/exynos_drm_fimc.c           |    4 +-
>   drivers/gpu/drm/exynos/exynos_drm_gem.c            |   43 +-
>   drivers/gpu/drm/exynos/exynos_drm_gem.h            |    5 -
>   drivers/gpu/drm/fsl-dcu/Kconfig                    |    2 +-
>   drivers/gpu/drm/gma500/framebuffer.c               |   52 +-
>   drivers/gpu/drm/gma500/gem.c                       |  234 ++-
>   drivers/gpu/drm/gma500/gem.h                       |   28 +-
>   drivers/gpu/drm/gma500/gma_display.c               |   51 +-
>   drivers/gpu/drm/gma500/gtt.c                       |  326 +---
>   drivers/gpu/drm/gma500/gtt.h                       |   29 +-
>   drivers/gpu/drm/gma500/oaktrail_crtc.c             |    3 +-
>   drivers/gpu/drm/gma500/psb_drv.c                   |   12 +
>   drivers/gpu/drm/gma500/psb_intel_display.c         |   17 +-
>   drivers/gpu/drm/gma500/psb_intel_drv.h             |    2 +-
>   drivers/gpu/drm/gud/gud_pipe.c                     |   14 +-
>   drivers/gpu/drm/hisilicon/kirin/Kconfig            |    1 -
>   drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |   52 +-
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |    5 +-
>   drivers/gpu/drm/i915/Kconfig                       |    2 +-
>   drivers/gpu/drm/i915/Makefile                      |    9 +-
>   drivers/gpu/drm/i915/display/g4x_dp.c              |    1 +
>   drivers/gpu/drm/i915/display/g4x_hdmi.c            |    1 +
>   drivers/gpu/drm/i915/display/i9xx_plane.c          |  141 +-
>   drivers/gpu/drm/i915/display/icl_dsi.c             |   10 +-
>   drivers/gpu/drm/i915/display/icl_dsi.h             |   15 +
>   drivers/gpu/drm/i915/display/intel_atomic.c        |    1 +
>   drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  107 +-
>   drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   23 +-
>   drivers/gpu/drm/i915/display/intel_audio.c         |  143 +-
>   drivers/gpu/drm/i915/display/intel_audio.h         |    4 +-
>   drivers/gpu/drm/i915/display/intel_bios.c          |   14 +-
>   drivers/gpu/drm/i915/display/intel_bw.c            |  215 ++-
>   drivers/gpu/drm/i915/display/intel_cdclk.c         |  205 +-
>   drivers/gpu/drm/i915/display/intel_cdclk.h         |   10 +-
>   drivers/gpu/drm/i915/display/intel_color.c         |  153 +-
>   drivers/gpu/drm/i915/display/intel_combo_phy.c     |    2 +-
>   drivers/gpu/drm/i915/display/intel_crt.c           |   19 +-
>   drivers/gpu/drm/i915/display/intel_crtc.c          |  155 +-
>   drivers/gpu/drm/i915/display/intel_crtc.h          |   14 +
>   drivers/gpu/drm/i915/display/intel_cursor.c        |   69 +-
>   drivers/gpu/drm/i915/display/intel_ddi.c           |  364 ++--
>   drivers/gpu/drm/i915/display/intel_ddi.h           |    5 +-
>   drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   94 +-
>   drivers/gpu/drm/i915/display/intel_display.c       | 2009 ++++----------------
>   drivers/gpu/drm/i915/display/intel_display.h       |   47 +-
>   .../gpu/drm/i915/display/intel_display_debugfs.c   |  111 +-
>   drivers/gpu/drm/i915/display/intel_display_power.c |  136 +-
>   drivers/gpu/drm/i915/display/intel_display_power.h |  102 +-
>   drivers/gpu/drm/i915/display/intel_display_trace.c |    9 +
>   drivers/gpu/drm/i915/display/intel_display_trace.h |  587 ++++++
>   drivers/gpu/drm/i915/display/intel_display_types.h |  127 +-
>   drivers/gpu/drm/i915/display/intel_dmc.c           |   10 +-
>   drivers/gpu/drm/i915/display/intel_dmc.h           |    2 +
>   drivers/gpu/drm/i915/display/intel_dp.c            |  166 +-
>   .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   61 +-
>   .../gpu/drm/i915/display/intel_dp_link_training.c  |   45 +-
>   drivers/gpu/drm/i915/display/intel_dp_mst.c        |   32 +-
>   drivers/gpu/drm/i915/display/intel_dpll.c          |    2 +-
>   drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    7 +-
>   drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    2 +-
>   drivers/gpu/drm/i915/display/intel_dpt.c           |   62 +-
>   drivers/gpu/drm/i915/display/intel_dpt.h           |    4 +
>   drivers/gpu/drm/i915/display/intel_dsb.c           |    4 +-
>   drivers/gpu/drm/i915/display/intel_dsi.c           |    2 +
>   drivers/gpu/drm/i915/display/intel_dsi.h           |   42 -
>   .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |    4 +
>   drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    2 +
>   drivers/gpu/drm/i915/display/intel_dsi_vbt.h       |   22 +
>   drivers/gpu/drm/i915/display/intel_fb.c            |  717 +++++--
>   drivers/gpu/drm/i915/display/intel_fb.h            |   33 +-
>   drivers/gpu/drm/i915/display/intel_fb_pin.c        |   22 +-
>   drivers/gpu/drm/i915/display/intel_fbc.c           | 1831 ++++++++++--------
>   drivers/gpu/drm/i915/display/intel_fbc.h           |   17 +-
>   drivers/gpu/drm/i915/display/intel_fdi.c           |  141 +-
>   drivers/gpu/drm/i915/display/intel_fdi.h           |    2 +-
>   drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   12 +-
>   drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    7 +-
>   drivers/gpu/drm/i915/display/intel_frontbuffer.h   |    2 +-
>   drivers/gpu/drm/i915/display/intel_gmbus.c         |   13 +-
>   drivers/gpu/drm/i915/display/intel_hdmi.c          |  117 +-
>   drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   42 +-
>   drivers/gpu/drm/i915/display/intel_overlay.c       |    2 +-
>   drivers/gpu/drm/i915/display/intel_pch_display.c   |  501 +++++
>   drivers/gpu/drm/i915/display/intel_pch_display.h   |   27 +
>   drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  648 +++++++
>   drivers/gpu/drm/i915/display/intel_pch_refclk.h    |   21 +
>   drivers/gpu/drm/i915/display/intel_plane_initial.c |    5 +-
>   drivers/gpu/drm/i915/display/intel_psr.c           |  125 +-
>   drivers/gpu/drm/i915/display/intel_psr.h           |   14 +-
>   drivers/gpu/drm/i915/display/intel_quirks.c        |    1 +
>   drivers/gpu/drm/i915/display/intel_sdvo.c          |    2 +-
>   drivers/gpu/drm/i915/display/intel_snps_phy.c      |    4 +-
>   drivers/gpu/drm/i915/display/intel_sprite.c        |  289 +--
>   drivers/gpu/drm/i915/display/intel_sprite.h        |    4 -
>   drivers/gpu/drm/i915/display/intel_tv.c            |    8 +-
>   drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    7 +-
>   drivers/gpu/drm/i915/display/intel_vdsc.c          |   82 +-
>   drivers/gpu/drm/i915/display/intel_vdsc.h          |   10 +-
>   drivers/gpu/drm/i915/display/intel_vrr.c           |   18 +-
>   drivers/gpu/drm/i915/display/intel_vrr.h           |    1 +
>   drivers/gpu/drm/i915/display/skl_scaler.c          |    1 +
>   drivers/gpu/drm/i915/display/skl_universal_plane.c |  511 ++---
>   drivers/gpu/drm/i915/display/vlv_dsi.c             |    8 +
>   drivers/gpu/drm/i915/display/vlv_dsi.h             |   19 +
>   drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    1 +
>   drivers/gpu/drm/i915/display/vlv_dsi_pll.h         |   38 +
>   drivers/gpu/drm/i915/dma_resv_utils.c              |   17 -
>   drivers/gpu/drm/i915/dma_resv_utils.h              |   13 -
>   drivers/gpu/drm/i915/gem/i915_gem_busy.c           |   35 +-
>   drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   18 +-
>   drivers/gpu/drm/i915/gem/i915_gem_context.c        |   26 +-
>   drivers/gpu/drm/i915/gem/i915_gem_create.c         |    2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   15 +-
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   22 +
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  195 +-
>   drivers/gpu/drm/i915/gem/i915_gem_internal.c       |   44 +-
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   11 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.c         |   92 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h         |   48 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   46 +-
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   21 +-
>   drivers/gpu/drm/i915/gem/i915_gem_phys.c           |    6 +-
>   drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    6 +-
>   drivers/gpu/drm/i915/gem/i915_gem_region.c         |    4 +-
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  195 +-
>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |  137 +-
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   19 +-
>   drivers/gpu/drm/i915/gem/i915_gem_throttle.c       |    3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  765 ++++----
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |   41 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |  627 ++++++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h       |   41 +
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |    3 +
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  106 +-
>   drivers/gpu/drm/i915/gem/i915_gemfs.c              |    5 +-
>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  134 +-
>   .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    2 +-
>   .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |   71 +-
>   .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |    4 +-
>   .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |   26 +-
>   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   26 +-
>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  151 +-
>   drivers/gpu/drm/i915/gt/gen6_ppgtt.h               |    2 -
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |    2 +-
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   34 +-
>   drivers/gpu/drm/i915/gt/intel_context.c            |   16 +-
>   drivers/gpu/drm/i915/gt/intel_context.h            |    3 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h      |    1 +
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   68 +-
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   40 +-
>   drivers/gpu/drm/i915/gt/intel_engine_stats.h       |   33 +-
>   drivers/gpu/drm/i915/gt/intel_engine_types.h       |   84 +-
>   drivers/gpu/drm/i915/gt/intel_engine_user.c        |    2 +-
>   .../gpu/drm/i915/gt/intel_execlists_submission.c   |   37 +-
>   drivers/gpu/drm/i915/gt/intel_ggtt.c               |  430 +----
>   drivers/gpu/drm/i915/gt/intel_gt.c                 |   13 +-
>   drivers/gpu/drm/i915/gt/intel_gt.h                 |    1 +
>   drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |    7 +-
>   drivers/gpu/drm/i915/gt/intel_gt_debugfs.h         |   21 +-
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c              |    2 +
>   drivers/gpu/drm/i915/gt/intel_gtt.c                |   30 +-
>   drivers/gpu/drm/i915/gt/intel_gtt.h                |   14 +-
>   drivers/gpu/drm/i915/gt/intel_lrc.c                |    5 +
>   drivers/gpu/drm/i915/gt/intel_migrate.c            |   32 +-
>   drivers/gpu/drm/i915/gt/intel_migrate.h            |    9 +-
>   drivers/gpu/drm/i915/gt/intel_mocs.c               |    2 +-
>   drivers/gpu/drm/i915/gt/intel_ppgtt.c              |   12 -
>   drivers/gpu/drm/i915/gt/intel_rc6.c                |   15 +-
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   17 +-
>   drivers/gpu/drm/i915/gt/intel_reset.c              |   60 +-
>   drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    2 +-
>   drivers/gpu/drm/i915/gt/intel_rps.c                |  143 +-
>   drivers/gpu/drm/i915/gt/intel_rps.h                |    5 +
>   drivers/gpu/drm/i915/gt/intel_workarounds.c        |  477 ++++-
>   drivers/gpu/drm/i915/gt/mock_engine.c              |   50 +-
>   drivers/gpu/drm/i915/gt/selftest_context.c         |    2 +-
>   drivers/gpu/drm/i915/gt/selftest_engine.c          |    2 +-
>   drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |    4 +-
>   .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |    4 +-
>   drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |   35 +-
>   drivers/gpu/drm/i915/gt/selftest_execlists.c       |    6 +-
>   drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |   12 +-
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   22 +-
>   drivers/gpu/drm/i915/gt/selftest_lrc.c             |    2 +-
>   drivers/gpu/drm/i915/gt/selftest_migrate.c         |    7 +-
>   drivers/gpu/drm/i915/gt/selftest_mocs.c            |    2 +-
>   drivers/gpu/drm/i915/gt/selftest_reset.c           |    2 +-
>   drivers/gpu/drm/i915/gt/selftest_ring_submission.c |    4 +-
>   drivers/gpu/drm/i915/gt/selftest_slpc.c            |    6 +-
>   drivers/gpu/drm/i915/gt/selftest_timeline.c        |    6 +-
>   drivers/gpu/drm/i915/gt/selftest_workarounds.c     |    4 +-
>   drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |    1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   42 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |   21 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h         |    5 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   18 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   33 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |   13 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |    5 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c |   62 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  157 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |    3 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |   13 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  373 +++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |    2 +
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   75 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h             |    2 -
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   11 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  188 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   18 +-
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |  175 +-
>   .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |    2 +-
>   drivers/gpu/drm/i915/gvt/fb_decoder.c              |    2 +-
>   drivers/gpu/drm/i915/gvt/gtt.c                     |   12 +-
>   drivers/gpu/drm/i915/gvt/gvt.c                     |    2 +-
>   drivers/gpu/drm/i915/gvt/scheduler.c               |    2 +-
>   drivers/gpu/drm/i915/i915_active.c                 |   28 +-
>   drivers/gpu/drm/i915/i915_active.h                 |   17 +-
>   drivers/gpu/drm/i915/i915_active_types.h           |    2 -
>   drivers/gpu/drm/i915/i915_debugfs.c                |   43 +-
>   drivers/gpu/drm/i915/i915_debugfs_params.c         |    4 +-
>   drivers/gpu/drm/i915/i915_deps.c                   |  237 +++
>   drivers/gpu/drm/i915/i915_deps.h                   |   45 +
>   drivers/gpu/drm/i915/{i915_drv.c => i915_driver.c} |   93 +-
>   drivers/gpu/drm/i915/i915_driver.h                 |   24 +
>   drivers/gpu/drm/i915/i915_drv.h                    |  388 +---
>   drivers/gpu/drm/i915/i915_gem.c                    |   51 +-
>   drivers/gpu/drm/i915/i915_getparam.c               |   10 +-
>   drivers/gpu/drm/i915/i915_gpu_error.c              |  234 ++-
>   drivers/gpu/drm/i915/i915_gpu_error.h              |    4 +-
>   drivers/gpu/drm/i915/i915_iosf_mbi.h               |   42 +
>   drivers/gpu/drm/i915/i915_irq.c                    |   84 +-
>   drivers/gpu/drm/i915/i915_mm.c                     |   28 +-
>   drivers/gpu/drm/i915/i915_mm.h                     |   35 +
>   drivers/gpu/drm/i915/i915_module.c                 |    8 +-
>   drivers/gpu/drm/i915/i915_params.c                 |    3 +
>   drivers/gpu/drm/i915/i915_params.h                 |    1 +
>   drivers/gpu/drm/i915/i915_pci.c                    |  129 +-
>   drivers/gpu/drm/i915/i915_perf.c                   |    2 +-
>   drivers/gpu/drm/i915/i915_pmu.c                    |   14 +-
>   drivers/gpu/drm/i915/i915_query.c                  |    2 +-
>   drivers/gpu/drm/i915/i915_reg.h                    |  566 ++++--
>   drivers/gpu/drm/i915/i915_request.c                |  149 +-
>   drivers/gpu/drm/i915/i915_request.h                |   30 +-
>   drivers/gpu/drm/i915/i915_scatterlist.c            |   62 +-
>   drivers/gpu/drm/i915/i915_scatterlist.h            |   76 +-
>   drivers/gpu/drm/i915/i915_sw_fence.c               |   81 +-
>   drivers/gpu/drm/i915/i915_sw_fence.h               |   23 +-
>   drivers/gpu/drm/i915/i915_sw_fence_work.c          |    2 +-
>   drivers/gpu/drm/i915/i915_switcheroo.c             |    5 +-
>   drivers/gpu/drm/i915/i915_sysfs.c                  |   41 +-
>   drivers/gpu/drm/i915/i915_trace.h                  |  506 +----
>   drivers/gpu/drm/i915/i915_vma.c                    |  523 ++++-
>   drivers/gpu/drm/i915/i915_vma.h                    |   14 +-
>   drivers/gpu/drm/i915/i915_vma_snapshot.c           |  134 ++
>   drivers/gpu/drm/i915/i915_vma_snapshot.h           |  112 ++
>   drivers/gpu/drm/i915/i915_vma_types.h              |   21 +-
>   drivers/gpu/drm/i915/intel_device_info.c           |   64 +-
>   drivers/gpu/drm/i915/intel_device_info.h           |   25 +-
>   drivers/gpu/drm/i915/intel_gvt.c                   |    2 +-
>   drivers/gpu/drm/i915/intel_memory_region.c         |  154 +-
>   drivers/gpu/drm/i915/intel_memory_region.h         |    9 +-
>   drivers/gpu/drm/i915/intel_pch.c                   |    1 +
>   drivers/gpu/drm/i915/intel_pch.h                   |    1 +
>   drivers/gpu/drm/i915/intel_pm.c                    |  119 +-
>   drivers/gpu/drm/i915/intel_pm_types.h              |   76 +
>   drivers/gpu/drm/i915/intel_region_ttm.c            |   50 +-
>   drivers/gpu/drm/i915/intel_region_ttm.h            |    7 +-
>   drivers/gpu/drm/i915/intel_runtime_pm.c            |    3 +
>   drivers/gpu/drm/i915/intel_step.c                  |   77 +-
>   drivers/gpu/drm/i915/intel_step.h                  |    3 +-
>   drivers/gpu/drm/i915/intel_uncore.c                |   28 +-
>   drivers/gpu/drm/i915/intel_uncore.h                |    5 +-
>   drivers/gpu/drm/i915/intel_wopcm.c                 |    2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp.c               |    5 +
>   drivers/gpu/drm/i915/pxp/intel_pxp.h               |   15 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    3 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   10 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |    2 -
>   drivers/gpu/drm/i915/selftests/i915_active.c       |    2 +-
>   drivers/gpu/drm/i915/selftests/i915_gem.c          |    2 +-
>   drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |   25 +-
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   18 +-
>   drivers/gpu/drm/i915/selftests/i915_perf.c         |    2 +-
>   drivers/gpu/drm/i915/selftests/i915_request.c      |   24 +-
>   drivers/gpu/drm/i915/selftests/i915_selftest.c     |    4 +-
>   drivers/gpu/drm/i915/selftests/i915_sw_fence.c     |    2 +-
>   drivers/gpu/drm/i915/selftests/i915_vma.c          |   17 +-
>   drivers/gpu/drm/i915/selftests/igt_flush_test.c    |    2 +-
>   drivers/gpu/drm/i915/selftests/igt_live_test.c     |    4 +-
>   drivers/gpu/drm/i915/selftests/igt_reset.c         |    2 +-
>   .../gpu/drm/i915/selftests/intel_memory_region.c   |   12 +-
>   drivers/gpu/drm/i915/selftests/intel_uncore.c      |    2 +-
>   drivers/gpu/drm/i915/selftests/lib_sw_fence.c      |    8 +-
>   drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   34 +-
>   drivers/gpu/drm/i915/selftests/mock_gtt.c          |   12 +-
>   drivers/gpu/drm/i915/selftests/mock_region.c       |   19 +-
>   drivers/gpu/drm/i915/selftests/mock_uncore.c       |    2 +-
>   drivers/gpu/drm/i915/vlv_sideband.c                |    3 +-
>   drivers/gpu/drm/imx/Kconfig                        |    2 +-
>   drivers/gpu/drm/imx/dcss/Kconfig                   |    2 +-
>   drivers/gpu/drm/ingenic/Kconfig                    |    1 -
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  283 ++-
>   drivers/gpu/drm/ingenic/ingenic-ipu.c              |  127 +-
>   drivers/gpu/drm/kmb/Kconfig                        |    1 -
>   drivers/gpu/drm/kmb/kmb_drv.c                      |    4 +
>   drivers/gpu/drm/lima/lima_device.c                 |    1 +
>   drivers/gpu/drm/lima/lima_gem.c                    |   20 +-
>   drivers/gpu/drm/lima/lima_sched.c                  |    4 +-
>   drivers/gpu/drm/mcde/Kconfig                       |    1 -
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |    6 +
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   20 +
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |    6 +
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  175 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  217 ++-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   23 +-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  142 +-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c           |    3 +-
>   drivers/gpu/drm/meson/Kconfig                      |    3 +-
>   drivers/gpu/drm/meson/Makefile                     |    3 +-
>   drivers/gpu/drm/meson/meson_drv.c                  |   71 +-
>   drivers/gpu/drm/meson/meson_dw_hdmi.c              |  342 +---
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  284 +++
>   .../{meson_venc_cvbs.h => meson_encoder_cvbs.h}    |    2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  447 +++++
>   drivers/gpu/drm/meson/meson_encoder_hdmi.h         |   12 +
>   drivers/gpu/drm/meson/meson_venc_cvbs.c            |  293 ---
>   drivers/gpu/drm/mgag200/mgag200_drv.c              |    3 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c             |    4 +-
>   drivers/gpu/drm/msm/Kconfig                        |    1 +
>   drivers/gpu/drm/msm/Makefile                       |    8 +-
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |    3 +-
>   drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |    3 +-
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |    3 +-
>   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |    4 +-
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   55 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   25 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   15 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   10 -
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  104 +-
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   10 +
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   11 +
>   drivers/gpu/drm/msm/adreno/adreno_device.c         |   38 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    4 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    7 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   41 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |    5 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   38 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   17 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    6 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    8 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   18 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |    3 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   98 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   44 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |    2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |    2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  150 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   40 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |   25 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  564 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   14 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |    4 -
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   22 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          |   56 +-
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       |   27 +-
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       |   14 +-
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |    9 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   23 +-
>   drivers/gpu/drm/msm/dp/dp_display.c                |   59 +-
>   drivers/gpu/drm/msm/dp/dp_display.h                |    1 +
>   drivers/gpu/drm/msm/dp/dp_drm.c                    |   75 +
>   drivers/gpu/drm/msm/dp/dp_hpd.c                    |    2 -
>   drivers/gpu/drm/msm/dp/dp_hpd.h                    |    2 -
>   drivers/gpu/drm/msm/dp/dp_link.c                   |   19 +-
>   drivers/gpu/drm/msm/dsi/dsi.c                      |   64 +-
>   drivers/gpu/drm/msm/dsi/dsi.h                      |    7 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c                 |   77 +-
>   drivers/gpu/drm/msm/dsi/dsi_manager.c              |   37 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   13 +-
>   drivers/gpu/drm/msm/edp/edp.c                      |  198 --
>   drivers/gpu/drm/msm/edp/edp.h                      |   77 -
>   drivers/gpu/drm/msm/edp/edp.xml.h                  |  388 ----
>   drivers/gpu/drm/msm/edp/edp_aux.c                  |  265 ---
>   drivers/gpu/drm/msm/edp/edp_bridge.c               |  111 --
>   drivers/gpu/drm/msm/edp/edp_connector.c            |  132 --
>   drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1373 -------------
>   drivers/gpu/drm/msm/edp/edp_phy.c                  |   98 -
>   drivers/gpu/drm/msm/hdmi/hdmi.c                    |   19 +-
>   drivers/gpu/drm/msm/hdmi/hdmi.h                    |   19 +-
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   83 +-
>   .../drm/msm/hdmi/{hdmi_connector.c => hdmi_hpd.c}  |  158 +-
>   drivers/gpu/drm/msm/msm_debugfs.c                  |  127 +-
>   drivers/gpu/drm/msm/msm_drv.c                      |  117 +-
>   drivers/gpu/drm/msm/msm_drv.h                      |   37 +-
>   drivers/gpu/drm/msm/msm_fbdev.c                    |   13 +-
>   drivers/gpu/drm/msm/msm_fence.h                    |   12 +
>   drivers/gpu/drm/msm/msm_gem.c                      |   29 +-
>   drivers/gpu/drm/msm/msm_gem_submit.c               |    2 +-
>   drivers/gpu/drm/msm/msm_gpu.c                      |   22 +-
>   drivers/gpu/drm/msm/msm_gpu.h                      |   66 +-
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c              |   91 +-
>   drivers/gpu/drm/msm/msm_kms.h                      |   11 +-
>   drivers/gpu/drm/msm/msm_perf.c                     |    9 +-
>   drivers/gpu/drm/msm/msm_rd.c                       |   16 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c               |    4 +-
>   drivers/gpu/drm/mxsfb/Kconfig                      |    2 +-
>   drivers/gpu/drm/nouveau/dispnv04/disp.c            |    4 +-
>   drivers/gpu/drm/nouveau/dispnv50/Kbuild            |    1 +
>   drivers/gpu/drm/nouveau/dispnv50/base907c.c        |    6 +-
>   drivers/gpu/drm/nouveau/dispnv50/corec57d.c        |    2 +-
>   drivers/gpu/drm/nouveau/dispnv50/crc.c             |   64 +-
>   drivers/gpu/drm/nouveau/dispnv50/crc.h             |    7 +-
>   drivers/gpu/drm/nouveau/dispnv50/crc907d.c         |    8 +-
>   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c         |   45 +-
>   drivers/gpu/drm/nouveau/dispnv50/crcc37d.h         |   40 +
>   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c         |   58 +
>   drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |   15 +-
>   drivers/gpu/drm/nouveau/dispnv50/disp.c            |   11 +-
>   drivers/gpu/drm/nouveau/dispnv50/head.c            |   38 +-
>   drivers/gpu/drm/nouveau/dispnv50/head.h            |    2 +
>   drivers/gpu/drm/nouveau/dispnv50/head907d.c        |    6 +
>   drivers/gpu/drm/nouveau/dispnv50/head917d.c        |    1 +
>   drivers/gpu/drm/nouveau/dispnv50/headc37d.c        |    1 +
>   drivers/gpu/drm/nouveau/dispnv50/headc57d.c        |    3 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c            |   15 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndw.h            |    4 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |    6 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |    7 +-
>   .../gpu/drm/nouveau/include/nvhw/class/cl907d.h    |    3 +
>   .../gpu/drm/nouveau/include/nvhw/class/clc57d.h    |   69 +
>   drivers/gpu/drm/nouveau/nouveau_backlight.c        |    5 +-
>   drivers/gpu/drm/nouveau/nouveau_bios.c             |    3 +-
>   drivers/gpu/drm/nouveau/nouveau_display.c          |    5 +-
>   drivers/gpu/drm/nouveau/nouveau_drm.c              |    4 +-
>   drivers/gpu/drm/nouveau/nouveau_fence.c            |   48 +-
>   drivers/gpu/drm/nouveau/nvkm/core/client.c         |    2 +-
>   drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |    4 +-
>   .../gpu/drm/nouveau/nvkm/engine/disp/coregv100.c   |    2 +
>   drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c   |    2 +-
>   drivers/gpu/drm/nouveau/nvkm/falcon/base.c         |    8 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c    |    2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c    |    3 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c     |   37 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.c    |   31 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c    |    2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c    |    2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c    |    2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h     |    2 +
>   drivers/gpu/drm/omapdrm/Makefile                   |    1 +
>   drivers/gpu/drm/omapdrm/dss/dispc.c                |   44 +-
>   drivers/gpu/drm/omapdrm/dss/dsi.c                  |   14 +-
>   drivers/gpu/drm/omapdrm/dss/dss.c                  |   11 +-
>   drivers/gpu/drm/omapdrm/dss/dss.h                  |    5 +
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c            |   14 +-
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h            |   14 +-
>   drivers/gpu/drm/omapdrm/dss/hdmi4_core.c           |    4 +-
>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.c           |    5 +-
>   drivers/gpu/drm/omapdrm/dss/hdmi_phy.c             |    5 +-
>   drivers/gpu/drm/omapdrm/dss/hdmi_pll.c             |    4 +-
>   drivers/gpu/drm/omapdrm/dss/venc.c                 |   11 +-
>   drivers/gpu/drm/omapdrm/dss/video-pll.c            |    8 +-
>   drivers/gpu/drm/omapdrm/omap_dmm_priv.h            |   10 +-
>   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |   10 +-
>   drivers/gpu/drm/omapdrm/omap_dmm_tiler.h           |   10 +-
>   drivers/gpu/drm/omapdrm/omap_drv.c                 |  196 +-
>   drivers/gpu/drm/omapdrm/omap_drv.h                 |   24 +
>   drivers/gpu/drm/omapdrm/omap_fb.c                  |   33 +-
>   drivers/gpu/drm/omapdrm/omap_fb.h                  |    4 +-
>   drivers/gpu/drm/omapdrm/omap_gem.c                 |   79 +-
>   drivers/gpu/drm/omapdrm/omap_gem.h                 |    2 +
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |   34 +-
>   drivers/gpu/drm/omapdrm/omap_overlay.c             |  212 +++
>   drivers/gpu/drm/omapdrm/omap_overlay.h             |   35 +
>   drivers/gpu/drm/omapdrm/omap_plane.c               |  349 +++-
>   drivers/gpu/drm/omapdrm/omap_plane.h               |    1 +
>   drivers/gpu/drm/omapdrm/tcm-sita.c                 |   10 +-
>   drivers/gpu/drm/panel/Kconfig                      |   43 +-
>   drivers/gpu/drm/panel/Makefile                     |    4 +
>   drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |   14 +-
>   drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |  445 +++++
>   drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  108 +-
>   drivers/gpu/drm/panel/panel-dsi-cm.c               |    4 +-
>   drivers/gpu/drm/panel/panel-edp.c                  |    4 +-
>   drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |   13 +-
>   .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |   29 +-
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  265 ++-
>   drivers/gpu/drm/panel/panel-innolux-ej030na.c      |   14 +-
>   drivers/gpu/drm/panel/panel-innolux-p079zca.c      |   10 +-
>   drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |  323 ++++
>   drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |    8 +-
>   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |    8 +-
>   drivers/gpu/drm/panel/panel-lvds.c                 |   18 +-
>   drivers/gpu/drm/panel/panel-novatek-nt35950.c      |  702 +++++++
>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |   10 +-
>   drivers/gpu/drm/panel/panel-novatek-nt39016.c      |   20 +-
>   .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |    8 +-
>   drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |    8 +-
>   drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |   21 +-
>   .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |    1 +
>   drivers/gpu/drm/panel/panel-samsung-sofef00.c      |   17 +-
>   drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |   21 +-
>   drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |    8 +-
>   drivers/gpu/drm/panel/panel-simple.c               |   86 +
>   .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |  552 ++++++
>   drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |   14 +-
>   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |   25 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c            |    2 +-
>   drivers/gpu/drm/panfrost/panfrost_gem.c            |   22 +-
>   drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |    2 +-
>   drivers/gpu/drm/panfrost/panfrost_mmu.c            |    5 +-
>   drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |    6 +-
>   drivers/gpu/drm/pl111/Kconfig                      |    1 -
>   drivers/gpu/drm/qxl/qxl_debugfs.c                  |   17 +-
>   drivers/gpu/drm/qxl/qxl_drv.c                      |    3 +-
>   drivers/gpu/drm/radeon/radeon_drv.c                |    9 +-
>   drivers/gpu/drm/radeon/radeon_kms.c                |   38 +-
>   drivers/gpu/drm/radeon/radeon_sync.c               |   22 +-
>   drivers/gpu/drm/radeon/radeon_uvd.c                |   13 +-
>   drivers/gpu/drm/radeon/radeon_vce.c                |    2 +-
>   drivers/gpu/drm/rcar-du/Kconfig                    |   31 +-
>   drivers/gpu/drm/rcar-du/Makefile                   |    1 +
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   31 +-
>   drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    6 +-
>   drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   10 +-
>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c            |  819 ++++++++
>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h       |  172 ++
>   drivers/gpu/drm/rockchip/Makefile                  |    1 -
>   drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   82 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   23 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    2 -
>   drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c      |  163 --
>   drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h      |   24 -
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   44 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.h        |    7 -
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    4 +-
>   drivers/gpu/drm/scheduler/sched_entity.c           |   15 +-
>   drivers/gpu/drm/shmobile/Kconfig                   |    1 -
>   drivers/gpu/drm/sprd/Kconfig                       |   13 +
>   drivers/gpu/drm/sprd/Makefile                      |    8 +
>   drivers/gpu/drm/sprd/megacores_pll.c               |  305 +++
>   drivers/gpu/drm/sprd/sprd_dpu.c                    |  880 +++++++++
>   drivers/gpu/drm/sprd/sprd_dpu.h                    |  109 ++
>   drivers/gpu/drm/sprd/sprd_drm.c                    |  205 ++
>   drivers/gpu/drm/sprd/sprd_drm.h                    |   19 +
>   drivers/gpu/drm/sprd/sprd_dsi.c                    | 1073 +++++++++++
>   drivers/gpu/drm/sprd/sprd_dsi.h                    |  126 ++
>   drivers/gpu/drm/sti/Kconfig                        |    1 -
>   drivers/gpu/drm/stm/Kconfig                        |    1 -
>   drivers/gpu/drm/sun4i/Kconfig                      |    1 -
>   drivers/gpu/drm/sun4i/sun4i_drv.c                  |    2 +-
>   drivers/gpu/drm/tegra/Kconfig                      |    3 +
>   drivers/gpu/drm/tegra/Makefile                     |    3 +-
>   drivers/gpu/drm/tegra/dc.c                         |  194 +-
>   drivers/gpu/drm/tegra/dc.h                         |    3 +
>   drivers/gpu/drm/tegra/drm.c                        |   30 +-
>   drivers/gpu/drm/tegra/drm.h                        |    1 +
>   drivers/gpu/drm/tegra/gem.c                        |  171 +-
>   drivers/gpu/drm/tegra/gr2d.c                       |  151 +-
>   drivers/gpu/drm/tegra/gr3d.c                       |  353 +++-
>   drivers/gpu/drm/tegra/hdmi.c                       |  183 +-
>   drivers/gpu/drm/tegra/hub.h                        |    1 -
>   drivers/gpu/drm/tegra/nvdec.c                      |  466 +++++
>   drivers/gpu/drm/tegra/plane.c                      |   65 +-
>   drivers/gpu/drm/tegra/plane.h                      |    2 +-
>   drivers/gpu/drm/tegra/rgb.c                        |   53 +-
>   drivers/gpu/drm/tegra/submit.c                     |   77 +-
>   drivers/gpu/drm/tegra/uapi.c                       |   68 +-
>   drivers/gpu/drm/tegra/uapi.h                       |    5 +-
>   drivers/gpu/drm/tegra/vic.c                        |   61 +-
>   drivers/gpu/drm/tidss/Kconfig                      |    1 -
>   drivers/gpu/drm/tidss/tidss_drv.c                  |   13 +-
>   drivers/gpu/drm/tilcdc/Kconfig                     |    1 -
>   drivers/gpu/drm/tiny/Kconfig                       |   31 +-
>   drivers/gpu/drm/tiny/Makefile                      |    1 +
>   drivers/gpu/drm/tiny/bochs.c                       |    3 +-
>   drivers/gpu/drm/tiny/cirrus.c                      |   28 +-
>   drivers/gpu/drm/tiny/ili9163.c                     |  225 +++
>   drivers/gpu/drm/tiny/repaper.c                     |    2 +-
>   drivers/gpu/drm/tiny/simpledrm.c                   |   41 +-
>   drivers/gpu/drm/tiny/st7586.c                      |    2 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                       |    3 +-
>   drivers/gpu/drm/ttm/ttm_range_manager.c            |   11 +-
>   drivers/gpu/drm/tve200/Kconfig                     |    1 -
>   drivers/gpu/drm/v3d/v3d_bo.c                       |   26 +-
>   drivers/gpu/drm/v3d/v3d_gem.c                      |    4 +-
>   drivers/gpu/drm/vboxvideo/vbox_drv.c               |    5 +-
>   drivers/gpu/drm/vboxvideo/vbox_main.c              |    4 +-
>   drivers/gpu/drm/vc4/Kconfig                        |    1 -
>   drivers/gpu/drm/vc4/vc4_bo.c                       |   10 +-
>   drivers/gpu/drm/vc4/vc4_crtc.c                     |   91 +-
>   drivers/gpu/drm/vc4/vc4_debugfs.c                  |    7 +-
>   drivers/gpu/drm/vc4/vc4_drv.h                      |   37 +-
>   drivers/gpu/drm/vc4/vc4_hdmi.c                     |  630 ++++--
>   drivers/gpu/drm/vc4/vc4_hdmi.h                     |   37 +
>   drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |   37 +
>   drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |    8 +
>   drivers/gpu/drm/vc4/vc4_hvs.c                      |   26 +-
>   drivers/gpu/drm/vc4/vc4_kms.c                      |  130 +-
>   drivers/gpu/drm/vc4/vc4_plane.c                    |  203 +-
>   drivers/gpu/drm/vc4/vc4_regs.h                     |   19 +-
>   drivers/gpu/drm/vc4/vc4_txp.c                      |    4 +-
>   drivers/gpu/drm/vgem/vgem_drv.c                    |    2 +-
>   drivers/gpu/drm/virtio/virtgpu_drv.c               |    3 +-
>   drivers/gpu/drm/virtio/virtgpu_ioctl.c             |    4 +-
>   drivers/gpu/drm/virtio/virtgpu_object.c            |   29 +-
>   drivers/gpu/drm/vmwgfx/Kconfig                     |    1 +
>   drivers/gpu/drm/vmwgfx/Makefile                    |    6 +-
>   drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h |    6 +-
>   .../gpu/drm/vmwgfx/device_include/svga3d_devcaps.h |   10 +-
>   drivers/gpu/drm/vmwgfx/device_include/svga3d_dx.h  |   12 +-
>   .../gpu/drm/vmwgfx/device_include/svga3d_limits.h  |    8 +-
>   drivers/gpu/drm/vmwgfx/device_include/svga3d_reg.h |    6 +-
>   .../gpu/drm/vmwgfx/device_include/svga3d_types.h   |    7 +-
>   .../gpu/drm/vmwgfx/device_include/svga_escape.h    |    6 +-
>   .../gpu/drm/vmwgfx/device_include/svga_overlay.h   |    6 +-
>   drivers/gpu/drm/vmwgfx/device_include/svga_reg.h   |   14 +-
>   drivers/gpu/drm/vmwgfx/ttm_memory.c                |  683 -------
>   drivers/gpu/drm/vmwgfx/ttm_memory.h                |   96 -
>   drivers/gpu/drm/vmwgfx/ttm_object.c                |  180 +-
>   drivers/gpu/drm/vmwgfx/ttm_object.h                |   59 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_binding.c            |   45 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_binding.h            |    4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  584 ++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |    7 +
>   drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |   43 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |   30 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |   26 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   92 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  154 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   84 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |   13 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |   43 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |  294 +++
>   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |   16 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c            |  199 ++
>   .../gpu/drm/vmwgfx/vmwgfx_hashtab.h                |   54 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |    3 +
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   45 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |    1 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |   25 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |    2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |   20 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_prime.c              |    1 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   17 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   10 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |   91 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c    |   29 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |   21 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_so.h                 |    6 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    6 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c       |   21 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |  158 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c     |   90 +
>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |  184 --
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  135 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           |   74 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_va.c                 |    2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |   35 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_validation.h         |   53 +-
>   drivers/gpu/drm/xen/xen_drm_front.c                |   16 +-
>   drivers/gpu/drm/xen/xen_drm_front_gem.c            |  108 +-
>   drivers/gpu/drm/xen/xen_drm_front_gem.h            |    7 -
>   drivers/gpu/drm/xlnx/Kconfig                       |    1 -
>   drivers/gpu/host1x/Kconfig                         |    1 +
>   drivers/gpu/host1x/bus.c                           |   80 +-
>   drivers/gpu/host1x/channel.c                       |    8 +
>   drivers/gpu/host1x/debug.c                         |   15 +
>   drivers/gpu/host1x/dev.c                           |  185 +-
>   drivers/gpu/host1x/dev.h                           |    5 +-
>   drivers/gpu/host1x/hw/channel_hw.c                 |   44 +-
>   drivers/gpu/host1x/intr.c                          |    3 -
>   drivers/gpu/host1x/job.c                           |  160 +-
>   drivers/gpu/host1x/job.h                           |    6 +-
>   drivers/gpu/host1x/syncpt.c                        |    5 +-
>   drivers/of/platform.c                              |    4 +
>   drivers/platform/x86/Kconfig                       |    2 +
>   drivers/platform/x86/thinkpad_acpi.c               |  137 +-
>   drivers/pwm/core.c                                 |   26 +
>   drivers/pwm/pwm-pxa.c                              |   16 +-
>   drivers/soc/tegra/common.c                         |   25 +
>   drivers/video/console/vgacon.c                     |   21 -
>   drivers/video/fbdev/core/fbsysfs.c                 |   14 +-
>   drivers/video/fbdev/omap/omapfb_main.c             |    1 +
>   .../video/fbdev/omap2/omapfb/dss/display-sysfs.c   |   14 +-
>   .../video/fbdev/omap2/omapfb/dss/manager-sysfs.c   |   18 +-
>   .../video/fbdev/omap2/omapfb/dss/overlay-sysfs.c   |   20 +-
>   drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c    |   12 +-
>   drivers/video/fbdev/simplefb.c                     |   21 +-
>   include/drm/drm_connector.h                        |   55 +
>   include/drm/drm_device.h                           |    5 +-
>   include/drm/drm_dp_helper.h                        |   35 +-
>   include/drm/drm_drv.h                              |   17 +-
>   include/drm/drm_format_helper.h                    |   61 +-
>   include/drm/drm_gem_atomic_helper.h                |   18 +
>   include/drm/drm_gem_cma_helper.h                   |  189 +-
>   include/drm/drm_gem_shmem_helper.h                 |  168 +-
>   include/drm/drm_gem_ttm_helper.h                   |    2 +-
>   include/drm/drm_gem_vram_helper.h                  |    2 +-
>   include/drm/drm_legacy.h                           |   15 +-
>   include/drm/drm_mm.h                               |    4 +-
>   include/drm/drm_mode_config.h                      |   13 +
>   include/drm/drm_of.h                               |    7 +
>   include/drm/drm_privacy_screen_consumer.h          |   65 +
>   include/drm/drm_privacy_screen_driver.h            |   84 +
>   include/drm/drm_privacy_screen_machine.h           |   46 +
>   include/drm/drm_probe_helper.h                     |    1 +
>   include/drm/drm_sysfs.h                            |    1 +
>   include/drm/gpu_scheduler.h                        |   12 +-
>   include/drm/i915_pciids.h                          |    9 +
>   include/drm/intel-gtt.h                            |    8 +-
>   include/drm/ttm/ttm_bo_api.h                       |    1 -
>   include/drm/ttm/ttm_placement.h                    |   11 +
>   include/linux/console.h                            |    6 -
>   include/linux/dma-buf.h                            |    4 +-
>   include/linux/dma-fence.h                          |    1 +
>   include/linux/dma-resv.h                           |   27 +-
>   include/linux/host1x.h                             |   76 +-
>   include/linux/pwm.h                                |    2 +
>   include/soc/tegra/common.h                         |   15 +
>   include/uapi/drm/amdgpu_drm.h                      |    2 +-
>   include/uapi/drm/drm.h                             |   18 +
>   include/uapi/drm/drm_fourcc.h                      |   11 +
>   include/uapi/drm/vmwgfx_drm.h                      |    1 +
>   include/uapi/linux/kfd_sysfs.h                     |  108 ++
>   1143 files changed, 47597 insertions(+), 24989 deletions(-)
>   create mode 100644
> Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
>   delete mode 100644 Documentation/devicetree/bindings/display/bridge/ptn3460.txt
>   create mode 100644
> Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>   delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii9234.txt
>   create mode 100644
> Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml
>   delete mode 100644 Documentation/devicetree/bindings/display/msm/edp.txt
>   create mode 100644
> Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
>   create mode 100644
> Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
>   create mode 100644
> Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
>   create mode 100644
> Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
>   create mode 100644
> Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
>   create mode 100644
> Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
>   create mode 100644
> Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
>   delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>   delete mode 100644 Documentation/gpu/amdgpu.rst
>   create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
>   create mode 100644 Documentation/gpu/amdgpu/display/config_example.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/dc-debug.rst
>   create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst
>   create mode 100644 Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/dcn-overview.rst
>   create mode 100644 Documentation/gpu/amdgpu/display/display-manager.rst
>   create mode 100644 Documentation/gpu/amdgpu/display/global_sync_vblank.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/index.rst
>   create mode 100644 Documentation/gpu/amdgpu/driver-core.rst
>   create mode 100644 Documentation/gpu/amdgpu/driver-misc.rst
>   create mode 100644 Documentation/gpu/amdgpu/index.rst
>   create mode 100644 Documentation/gpu/amdgpu/module-parameters.rst
>   create mode 100644 Documentation/gpu/amdgpu/ras.rst
>   create mode 100644 Documentation/gpu/amdgpu/thermal.rst
>   create mode 100644 Documentation/gpu/amdgpu/xgmi.rst
>   create mode 100644 drivers/dma-buf/st-dma-resv.c
>   delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_translation.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h
>   create mode 100644 drivers/gpu/drm/ast/ast_i2c.c
>   create mode 100644 drivers/gpu/drm/drm_nomodeset.c
>   create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
>   create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
>   create mode 100644 drivers/gpu/drm/i915/display/icl_dsi.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_display_trace.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_display_trace.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_dsi_vbt.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_pch_display.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_pch_display.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_pch_refclk.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_pch_refclk.h
>   create mode 100644 drivers/gpu/drm/i915/display/vlv_dsi.h
>   create mode 100644 drivers/gpu/drm/i915/display/vlv_dsi_pll.h
>   delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
>   delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
>   create mode 100644 drivers/gpu/drm/i915/i915_deps.c
>   create mode 100644 drivers/gpu/drm/i915/i915_deps.h
>   rename drivers/gpu/drm/i915/{i915_drv.c => i915_driver.c} (95%)
>   create mode 100644 drivers/gpu/drm/i915/i915_driver.h
>   create mode 100644 drivers/gpu/drm/i915/i915_iosf_mbi.h
>   create mode 100644 drivers/gpu/drm/i915/i915_mm.h
>   create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
>   create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h
>   create mode 100644 drivers/gpu/drm/i915/intel_pm_types.h
>   create mode 100644 drivers/gpu/drm/meson/meson_encoder_cvbs.c
>   rename drivers/gpu/drm/meson/{meson_venc_cvbs.h => meson_encoder_cvbs.h} (92%)
>   create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
>   create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h
>   delete mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.c
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
>   rename drivers/gpu/drm/msm/hdmi/{hdmi_connector.c => hdmi_hpd.c} (62%)
>   create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h
>   create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
>   create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
>   create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h
>   create mode 100644 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
>   create mode 100644 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
>   create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt35950.c
>   create mode 100644 drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
>   create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>   create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
>   delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
>   delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h
>   create mode 100644 drivers/gpu/drm/sprd/Kconfig
>   create mode 100644 drivers/gpu/drm/sprd/Makefile
>   create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
>   create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
>   create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
>   create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>   create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>   create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
>   create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
>   create mode 100644 drivers/gpu/drm/tegra/nvdec.c
>   create mode 100644 drivers/gpu/drm/tiny/ili9163.c
>   delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_memory.c
>   delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_memory.h
>   create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>   create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c
>   rename include/drm/drm_hashtab.h =>
> drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h (58%)
>   create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
>   delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
>   create mode 100644 include/drm/drm_privacy_screen_consumer.h
>   create mode 100644 include/drm/drm_privacy_screen_driver.h
>   create mode 100644 include/drm/drm_privacy_screen_machine.h
>   create mode 100644 include/uapi/linux/kfd_sysfs.h

