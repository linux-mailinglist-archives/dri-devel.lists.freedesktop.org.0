Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1738F574EAF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 15:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED72310F363;
	Thu, 14 Jul 2022 13:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B1510F35F;
 Thu, 14 Jul 2022 13:08:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mlsd5MjkJ8DOw+vY2gjdKYj4O7kIkmAQuuP4FcpGxAnDOvfOL9/83B3N9novgIcWPMSNYkbY3lRAi4g9MIcsNRh91DiUgquHOfmd4/gJGdcfVnyIpKRlz9bqNSSngk18rnP8qoSW9nHxRkCIplzjEtIG2lt2POBHHiw/bWzvMwAvGXHnRe1j/Iqp5vW2sAWWWOu3aqmx4ZIXNVo/SmmTHBT0BKXE7ncf4jI8dYcux+9KWqKbnG+GJGtcDzz3W8oDPdFcuA8MpVw/Zt+0WeDPFsV76shjMMSVMIo+8i308/A/XVNjsLR/tA1jfCemYhJ2uJs3vHMi2BkZDabK13T4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AqquFuAehLw4L0lU0IR6SgJWEpRZ35LW5+YpbfmigM=;
 b=FcWH/wfHwYR4HLqSBZEnDaGr2gs0dqgzEWH9hcyiidcwlNB7WcmZjRnXCzNR/LIZ7MWWeuCxahmhN6X9Gut8YPwyAhtYMHAm3cCVNeHT3VZ6BdovamX1DHqdrmZh7Zb7G/rAIVt8QhDQEXJ6RMt0jDLpbaeIRaLPUt0h1OlxwnN6rWbRLsgMRu4i80qX/khdm80gnFfOkQ7/mWQhzyUt6v6P1vDawxLnejb82Bjr4vJFXsePeGcccgB/OxQgmpEa+wV5Hl4E0j2nBqCBV30r+7YxQ9FtjmPmkzJbWYPaayeUlZp9xZsgxQz7/4b+K9GAPIKFl8JME+f/WZ+Gf6ns+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AqquFuAehLw4L0lU0IR6SgJWEpRZ35LW5+YpbfmigM=;
 b=W7YTbeLVHBTxSPd/I3M7Td4Xd7en0Qx8dcPKtkchqX708eZx1aDkjKOCYMZz8HPqf9AKCObPbpDTw9UpMPqk4l6jvcz9/srZdRA5W9g7OIWG8azG+dczGX8JmqzWsb3TI01NUMXNr8O51oUIB2yjbDWN7ZaKXCA+KVTQRt5cgK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3853.namprd12.prod.outlook.com (2603:10b6:208:162::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 13:08:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Thu, 14 Jul 2022
 13:08:54 +0000
Message-ID: <83d9f973-abdd-3d8b-5955-84cfc3f49eea@amd.com>
Date: Thu, 14 Jul 2022 15:08:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] Revert "drm/amdgpu: add drm buddy support to amdgpu"
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20220708102124.493372-1-Arunpravin.PaneerSelvam@amd.com>
 <20220714145423.721e1c3b@maurocar-mobl2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220714145423.721e1c3b@maurocar-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0087.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 768be243-2898-495b-f4dc-08da659a0130
X-MS-TrafficTypeDiagnostic: MN2PR12MB3853:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twKx0RlSa7QN7z0tHeaV7fqM6+bfIqYM8G9FPKsYpP/sVQxIBHKYsO9mNAIz0qC0aet/WY/TjrYw3Up3dg5ABI1oyr/BUMbaDjiMC13Dktda6Sd7EXOB+WC5mKGqWRFmibXHIwUhHeC0KQj0bqgLrjDa96OLtOd9NY5F8yi1/JDlFgqdVduNgaych/EfqKZeesjjqbosXkj5qXTqqtkph4q9WIPSE66Q1QF9DofmowDMkpv92cmnRks74AXpfFG3lpP1nt3uKpG3MPU7t1upaDtyZN+jCfMRQjOfGVIyUvlGx/cg9ukOi1nAmph7mg2x1mFs4L1AUf/zn5l4DXqUKNoFaGd63upPIRWteDbMCGClAt/9gewGoMwyrMiVnYyFmF0OMg8oy3c4jMPrP/EqD8XAZ+h1fpIQn81iNTxBccQ4tMxHIItUQBI5diFGlpOsarVvMq2EpIBn4AEHX1EY+/ADDs5FeQ9dmfFshi+Y8/88h8fZ7aFe0mDLDZ7MP7GhsxyybMrtwHyyUjeIdbAWouIFP9EWP6A7bCxB3HU5QRtyFXFb8mVGgEW9nyIrJpozUFAKoHHOOiYAl1dPiWPm6OKcGt7btuABa2vjs9DWZSjlwa7GyoxrXp5wgG2iatlHjC8mvQrfVHEmxc952GWN+jOv9kszJLBG+gCCgZP7CXgq/CzhCsqMzLyGTrO7eM99DYpYvWfjRFA4AJr6dtA0DI0iYRovYd6K4tUYh/NuIkjLmKUg//hnTbexuhT/3FpWxRDz2eZ9XPW+/KN/CCssep/IGv0mcarSWpIr1apnl3TO2wnik23IcFP6mZM6HXnJUyqt6aTYcdffyXNe8pqwZXhqKu0Wz3Pz7NB/ttuxEls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(186003)(2616005)(38100700002)(30864003)(2906002)(31686004)(6636002)(5660300002)(36756003)(110136005)(8676002)(6512007)(41300700001)(66946007)(8936002)(6666004)(478600001)(66556008)(66476007)(6506007)(6486002)(26005)(4326008)(83380400001)(31696002)(86362001)(316002)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3JrSnFMb2pqT0dzSTBaQnNrSVdqSGVNeXVMcDVGZjBoaVM3QnpqNnJKZ1lE?=
 =?utf-8?B?bTRqNEFSd3V4OXhGK3lZa2pyL1g0MytGMkdtTEd0amdYWHZ4WENDb24zTm1n?=
 =?utf-8?B?S09xbVd5ZWc1S2lLNWhtSmhGV29ReDlBMTN2ZWg3RW1WUGFzQ1RBNnhXaENB?=
 =?utf-8?B?SmZYQ1hkSHdhbmcwUWc2RTNrM3pJNmlXWHNSZzM4Zm1yaWFkUmd6SkVDa0Ju?=
 =?utf-8?B?eitNSDEyNFRPTDlPT05KQU91NmhOWnZpQmpmV05mdDZkZTFqUTlSd3dZWXVo?=
 =?utf-8?B?M0JFR1hBV1BaaHNOcGZoVkc0OEFCUmpreFIzVFlOQWJuYzFoaTJXcEZ2QUlV?=
 =?utf-8?B?cDk1VDFvcUdNVG1wY0l6eFZlM2VyQThOTHFaeXJCb1N3aFJPQjkyVXZBVzlx?=
 =?utf-8?B?VWVVOWtGMUM1Z1RiWFdnT011K09ERTBOZVBCeDNwWFdtZE5OeFZFcDREdEU0?=
 =?utf-8?B?RVZyWmtMWHFPTE1kNWZLNGd3dFVyVjEyWnh6MnJ2YXppSXZabFptNzkvNTlx?=
 =?utf-8?B?NWQrVi9tQzdZOHp2NFo0Z2huOGNnM2xJTjQ0cGZUZXM4eWZxalMzYzZ0ZGFM?=
 =?utf-8?B?OFMxeG4raDdHV2NMWlZXSmI5bzNOeGlKV2dNRllVeVRTTjFBaC9OMFIyeUx6?=
 =?utf-8?B?R0RqelRUTVdKOG1ONzVvVElEY1ZvY0tqQjNJZW4wWVpUMXc4UHV3YnBVcm45?=
 =?utf-8?B?VVRJSVl5bENtVGRQRCtlTlFabkxkYWJRRlYrR0d6a3Q5SU9EWDByV1Q4UytJ?=
 =?utf-8?B?Q0d1S3IvNldFN2xLc3NIeHFyQWc3Z2RUMmhtVFJlRmJ6WEk4eVpxU1phZjRl?=
 =?utf-8?B?M3hIMjV5cmtVb29ZOUEwc3R6NjJzNW8xR283dSs3VGhWdGpEbjIxOW9NakM3?=
 =?utf-8?B?YVF3VTR3eE1mWTUvQnpFYXkxd0liVHBVYlg4RlVqd1lxa1NqOHBhYW14VXcr?=
 =?utf-8?B?RDJNZE1uMUZSWGxJQW1hckFrWkUzSy82ZU94eHF0MTZyR3hQeXI5SEl1VWJF?=
 =?utf-8?B?RVBBbHJWRjdNYTIxSEw3Vm9QU05URjNtNmFja2RFSERiODZXQnNxNWREZjA2?=
 =?utf-8?B?T2NUQm0yVWY3elhiSzQzMzFuQUd0cWJKL1pXNVEwbDAwQnFuSHkzQXMzaU9K?=
 =?utf-8?B?NWFNclRoenpMTzdPVnlvdU1PaWFPd2owTkxvUnZFSXhEVDhEY3QrRFoybWVH?=
 =?utf-8?B?Zk96ZWJORHhocmU1N1A4Uyt6WTN4R21qU2hBMWZZeldkMjhXYzMvWUUwamhN?=
 =?utf-8?B?MTZiYzR5eXhITXhmUUNqU3ZWTklwS0t5WWlYZGVxS21ydEwySGN0WkEwa2xW?=
 =?utf-8?B?d2tWUG5OUXFDK0tMbE5VNS8wQzRBVHRNeFpaT1hleS9TYWNXL1ZXaGFKZXFE?=
 =?utf-8?B?alJFQnRLODlwdk5ZdTBHRUl3YkNzWGFkTitFOWp2VEt4TE1vamxwU0UrWFJV?=
 =?utf-8?B?dUF6VFovc3ZSQzYxTWQ4NnFySmdqYzFzWnhQZEMwZ205ZkcrV1N4bzBWSVlL?=
 =?utf-8?B?RzNqYXYrNWxiOHFWZ2tkRW1VUTRLOE1uMzk5amhnZmN1WnlGU0lHalp2alUv?=
 =?utf-8?B?MlBXZDZ2a2hhbDIvb0lSampqc29XM3NrSGhTZ200VmRybkhqUmRqVGV5aWx5?=
 =?utf-8?B?aW02K2JmanZPdGd4UTV2RkJJUkhXRDFlWTg1YU1HSENpaUlHSm1xdzR2TXcx?=
 =?utf-8?B?am9OS3E3QTA1UkFvWDlKTGhlQVp1YU1yRVo3WW1BUVFJdUs0Mk5Temo1K1hX?=
 =?utf-8?B?eml5OWJHRlpMYWRTdlh3bnRxeWdtZFpBd3JZbUY0aXljWjE4Z0xLRjhZT1lL?=
 =?utf-8?B?bTUvNDVlcHJtVzhnRFh3TU1sdTIzblg5UUdqZFhEN09uS0RxTHdsQlRpL0RN?=
 =?utf-8?B?N2pEenBLUmpvWGtnSHpmb045aXI5RWF2NDdLTFBpbk4rRmdwOU1HQTJBUTRL?=
 =?utf-8?B?SDJjcVN1ZXVMQWlSYThlWVBDWmJOYVVkT3NneTBtQjhEd1l1NG9NNXZETEpk?=
 =?utf-8?B?Z1g5TERVM1FGNHB3c0ZrcG5MM2tNcUk4eDVqeHJqSlh3cWlzTjcwZ2VoUUNH?=
 =?utf-8?B?aHB1TWVydWN5YnRDdDhUaWhyRXBJeGFnaEQyNWVFVE1KRHd1aGJMTElaWHRK?=
 =?utf-8?Q?Tv3sSKSyP9Wux1RbpkqrpoHsd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768be243-2898-495b-f4dc-08da659a0130
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 13:08:54.8669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 994zFqXN2ZRrnAZrBB8Vnx6G/qDYs8qoJEwcqlON9b4+Jfhbm7MxCI6wHYnOlkAR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3853
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

well the last time I checked drm-tip was clean.

The revert is necessary because we had some problems with the commit 
which we couldn't fix in the 5.19 cycle.

I will double check drm-tip once more.

Regards,
Christian.

Am 14.07.22 um 14:54 schrieb Mauro Carvalho Chehab:
> On Fri, 8 Jul 2022 03:21:24 -0700
> Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com> wrote:
>
>> This reverts the following commits:
>> commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into the C file")
>> commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new")
>> commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>>
>> [WHY]
>> Few users reported garbaged graphics as soon as x starts,
>> reverting until this can be resolved.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> This revert is currently breaking drm-tip. Please revert it ASAP, as it
> is preventing CI bots to properly test new patches on the top of current
> drm-tip:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_new’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:459:13: error: ‘cur_size’ undeclared (first use in this function)
>    459 |         if (cur_size != size) {
>        |             ^~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:459:13: note: each undeclared identifier is reported only once for each function it appears in
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:459:25: error: ‘size’ undeclared (first use in this function); did you mean ‘ksize’?
>    459 |         if (cur_size != size) {
>        |                         ^~~~
>        |                         ksize
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:465:30: error: ‘vres’ undeclared (first use in this function); did you mean ‘res’?
>    465 |                 trim_list = &vres->blocks;
>        |                              ^~~~
>        |                              res
> In file included from ./include/linux/bits.h:22,
>                   from ./include/linux/ratelimit_types.h:5,
>                   from ./include/linux/ratelimit.h:5,
>                   from ./include/linux/dev_printk.h:16,
>                   from ./include/linux/device.h:15,
>                   from ./include/linux/dma-mapping.h:7,
>                   from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
> ./include/linux/container_of.h:19:54: error: invalid use of undefined type ‘struct drm_buddy_block’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                                                      ^~
> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>    520 |         container_of(ptr, type, member)
>        |         ^~~~~~~~~~~~
> ./include/linux/list.h:542:9: note: in expansion of macro ‘list_entry’
>    542 |         list_entry((ptr)->prev, type, member)
>        |         ^~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:473:33: note: in expansion of macro ‘list_last_entry’
>    473 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
>        |                                 ^~~~~~~~~~~~~~~
> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>    295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>    520 |         container_of(ptr, type, member)
>        |         ^~~~~~~~~~~~
> ./include/linux/list.h:542:9: note: in expansion of macro ‘list_entry’
>    542 |         list_entry((ptr)->prev, type, member)
>        |         ^~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:473:33: note: in expansion of macro ‘list_last_entry’
>    473 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
>        |                                 ^~~~~~~~~~~~~~~
> In file included from ./include/uapi/linux/posix_types.h:5,
>                   from ./include/uapi/linux/types.h:14,
>                   from ./include/linux/types.h:6,
>                   from ./include/linux/kasan-checks.h:5,
>                   from ./include/asm-generic/rwonce.h:26,
>                   from ./arch/x86/include/generated/asm/rwonce.h:1,
>                   from ./include/linux/compiler.h:248,
>                   from ./include/linux/string.h:5,
>                   from ./include/linux/dma-mapping.h:6:
> ./include/linux/stddef.h:16:33: error: invalid use of undefined type ‘struct drm_buddy_block’
>     16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
>        |                                 ^~~~~~~~~~~~~~~~~~
> ./include/linux/container_of.h:22:28: note: in expansion of macro ‘offsetof’
>     22 |         ((type *)(__mptr - offsetof(type, member))); })
>        |                            ^~~~~~~~
> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>    520 |         container_of(ptr, type, member)
>        |         ^~~~~~~~~~~~
> ./include/linux/list.h:542:9: note: in expansion of macro ‘list_entry’
>    542 |         list_entry((ptr)->prev, type, member)
>        |         ^~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:473:33: note: in expansion of macro ‘list_last_entry’
>    473 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
>        |                                 ^~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:474:46: error: invalid use of undefined type ‘struct drm_buddy_block’
>    474 |                         list_move_tail(&block->link, &temp);
>        |                                              ^~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:480:41: error: implicit declaration of function ‘amdgpu_vram_mgr_block_size’; did you mean ‘amdgpu_vram_mgr_vis_size’? [-Werror=implicit-function-declaration]
>    480 |                         original_size = amdgpu_vram_mgr_block_size(block) - (size - cur_size);
>        |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                                         amdgpu_vram_mgr_vis_size
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:483:28: error: passing argument 1 of ‘mutex_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    483 |                 mutex_lock(&mgr->lock);
>        |                            ^~~~~~~~~~
>        |                            |
>        |                            spinlock_t * {aka struct spinlock *}
> In file included from ./include/linux/rhashtable-types.h:14,
>                   from ./include/linux/ipc.h:7,
>                   from ./include/uapi/linux/sem.h:5,
>                   from ./include/linux/sem.h:5,
>                   from ./include/linux/sched.h:15,
>                   from ./include/linux/ratelimit.h:6:
> ./include/linux/mutex.h:199:38: note: expected ‘struct mutex *’ but argument is of type ‘spinlock_t *’ {aka ‘struct spinlock *’}
>    199 | extern void mutex_lock(struct mutex *lock);
>        |                        ~~~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:484:17: error: implicit declaration of function ‘drm_buddy_block_trim’ [-Werror=implicit-function-declaration]
>    484 |                 drm_buddy_block_trim(mm,
>        |                 ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:487:30: error: passing argument 1 of ‘mutex_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    487 |                 mutex_unlock(&mgr->lock);
>        |                              ^~~~~~~~~~
>        |                              |
>        |                              spinlock_t * {aka struct spinlock *}
> ./include/linux/mutex.h:218:40: note: expected ‘struct mutex *’ but argument is of type ‘spinlock_t *’ {aka ‘struct spinlock *’}
>    218 | extern void mutex_unlock(struct mutex *lock);
>        |                          ~~~~~~~~~~~~~~^~~~
> In file included from ./include/linux/rculist.h:10,
>                   from ./include/linux/pid.h:5,
>                   from ./include/linux/sched.h:14:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:493:29: error: ‘block’ undeclared (first use in this function); did you mean ‘flock’?
>    493 |         list_for_each_entry(block, &vres->blocks, link)
>        |                             ^~~~~
> ./include/linux/list.h:674:14: note: in definition of macro ‘list_for_each_entry’
>    674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>        |              ^~~
> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>    295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>    520 |         container_of(ptr, type, member)
>        |         ^~~~~~~~~~~~
> ./include/linux/list.h:531:9: note: in expansion of macro ‘list_entry’
>    531 |         list_entry((ptr)->next, type, member)
>        |         ^~~~~~~~~~
> ./include/linux/list.h:674:20: note: in expansion of macro ‘list_first_entry’
>    674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>        |                    ^~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:493:9: note: in expansion of macro ‘list_for_each_entry’
>    493 |         list_for_each_entry(block, &vres->blocks, link)
>        |         ^~~~~~~~~~~~~~~~~~~
> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>    295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>    520 |         container_of(ptr, type, member)
>        |         ^~~~~~~~~~~~
> ./include/linux/list.h:564:9: note: in expansion of macro ‘list_entry’
>    564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>        |         ^~~~~~~~~~
> ./include/linux/list.h:676:20: note: in expansion of macro ‘list_next_entry’
>    676 |              pos = list_next_entry(pos, member))
>        |                    ^~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:493:9: note: in expansion of macro ‘list_for_each_entry’
>    493 |         list_for_each_entry(block, &vres->blocks, link)
>        |         ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:496:17: error: implicit declaration of function ‘amdgpu_vram_mgr_first_block’; did you mean ‘amdgpu_vram_mgr_virt_start’? [-Werror=implicit-function-declaration]
>    496 |         block = amdgpu_vram_mgr_first_block(&vres->blocks);
>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                 amdgpu_vram_mgr_virt_start
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:502:28: error: implicit declaration of function ‘amdgpu_vram_mgr_block_start’; did you mean ‘amdgpu_vram_mgr_virt_start’? [-Werror=implicit-function-declaration]
>    502 |         vres->base.start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
>        |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                            amdgpu_vram_mgr_virt_start
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:504:13: error: implicit declaration of function ‘amdgpu_is_vram_mgr_blocks_contiguous’ [-Werror=implicit-function-declaration]
>    504 |         if (amdgpu_is_vram_mgr_blocks_contiguous(&vres->blocks))
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.build:466: drivers/gpu/drm/amd/amdgpu] Error 2
> make[2]: *** [scripts/Makefile.build:466: drivers/gpu/drm] Error 2
> make[1]: *** [scripts/Makefile.build:466: drivers/gpu] Error 2
> make: *** [Makefile:1843: drivers] Error 2
> mchehab@sal /new_devel/v4l/tmp $ nano drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> mchehab@sal /new_devel/v4l/tmp $ make drivers/gpu/drm/amd/amdgpu/
>    DESCEND objtool
>    CALL    scripts/atomic/check-atomics.sh
>    CALL    scripts/checksyscalls.sh
>    CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.o
>    CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.o
> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:30:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:29:8: error: redefinition of ‘struct amdgpu_vram_mgr’
>     29 | struct amdgpu_vram_mgr {
>        |        ^~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu.h:73,
>                   from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:28:
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:41:8: note: originally defined here
>     41 | struct amdgpu_vram_mgr {
>        |        ^~~~~~~~~~~~~~~
> In file included from ./include/linux/bits.h:22,
>                   from ./include/linux/ratelimit_types.h:5,
>                   from ./include/linux/ratelimit.h:5,
>                   from ./include/linux/dev_printk.h:16,
>                   from ./include/linux/device.h:15,
>                   from ./include/linux/dma-mapping.h:7,
>                   from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘to_amdgpu_device’:
> ./include/linux/build_bug.h:78:41: error: static assertion failed: "pointer type mismatch in container_of()"
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                         ^~~~~~~~~~~~~~
> ./include/linux/build_bug.h:77:34: note: in expansion of macro ‘__static_assert’
>     77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>        |                                  ^~~~~~~~~~~~~~~
> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:49:16: note: in expansion of macro ‘container_of’
>     49 |         return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
>        |                ^~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_do_reserve’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:244:29: error: initialization of ‘struct drm_mm *’ from incompatible pointer type ‘struct drm_buddy *’ [-Werror=incompatible-pointer-types]
>    244 |         struct drm_mm *mm = &mgr->mm;
>        |                             ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: At top level:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:273:5: error: conflicting types for ‘amdgpu_vram_mgr_reserve_range’; have ‘int(struct amdgpu_vram_mgr *, uint64_t,  uint64_t)’ {aka ‘int(struct amdgpu_vram_mgr *, long long unsigned int,  long long unsigned int)’}
>    273 | int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:129:5: note: previous declaration of ‘amdgpu_vram_mgr_reserve_range’ with type ‘int(struct amdgpu_vram_mgr *, uint64_t,  uint64_t)’ {aka ‘int(struct amdgpu_vram_mgr *, long long unsigned int,  long long unsigned int)’}
>    129 | int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_reserve_range’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:286:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    286 |         spin_lock(&mgr->lock);
>        |                   ^~~~~~~~~~
>        |                   |
>        |                   struct mutex *
> In file included from ./include/linux/wait.h:9,
>                   from ./include/linux/pid.h:6,
>                   from ./include/linux/sched.h:14,
>                   from ./include/linux/ratelimit.h:6:
> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    347 | static __always_inline void spin_lock(spinlock_t *lock)
>        |                                       ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:289:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    289 |         spin_unlock(&mgr->lock);
>        |                     ^~~~~~~~~~
>        |                     |
>        |                     struct mutex *
> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    387 | static __always_inline void spin_unlock(spinlock_t *lock)
>        |                                         ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: At top level:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:305:5: error: conflicting types for ‘amdgpu_vram_mgr_query_page_status’; have ‘int(struct amdgpu_vram_mgr *, uint64_t)’ {aka ‘int(struct amdgpu_vram_mgr *, long long unsigned int)’}
>    305 | int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:131:5: note: previous declaration of ‘amdgpu_vram_mgr_query_page_status’ with type ‘int(struct amdgpu_vram_mgr *, uint64_t)’ {aka ‘int(struct amdgpu_vram_mgr *, long long unsigned int)’}
>    131 | int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_query_page_status’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:311:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    311 |         spin_lock(&mgr->lock);
>        |                   ^~~~~~~~~~
>        |                   |
>        |                   struct mutex *
> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    347 | static __always_inline void spin_lock(spinlock_t *lock)
>        |                                       ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:331:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    331 |         spin_unlock(&mgr->lock);
>        |                     ^~~~~~~~~~
>        |                     |
>        |                     struct mutex *
> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    387 | static __always_inline void spin_unlock(spinlock_t *lock)
>        |                                         ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_new’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:377:29: error: initialization of ‘struct drm_mm *’ from incompatible pointer type ‘struct drm_buddy *’ [-Werror=incompatible-pointer-types]
>    377 |         struct drm_mm *mm = &mgr->mm;
>        |                             ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:429:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    429 |         spin_lock(&mgr->lock);
>        |                   ^~~~~~~~~~
>        |                   |
>        |                   struct mutex *
> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    347 | static __always_inline void spin_lock(spinlock_t *lock)
>        |                                       ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:458:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    458 |         spin_unlock(&mgr->lock);
>        |                     ^~~~~~~~~~
>        |                     |
>        |                     struct mutex *
> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    387 | static __always_inline void spin_unlock(spinlock_t *lock)
>        |                                         ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:460:13: error: ‘cur_size’ undeclared (first use in this function)
>    460 |         if (cur_size != size) {
>        |             ^~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:460:13: note: each undeclared identifier is reported only once for each function it appears in
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:460:25: error: ‘size’ undeclared (first use in this function); did you mean ‘ksize’?
>    460 |         if (cur_size != size) {
>        |                         ^~~~
>        |                         ksize
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:466:30: error: ‘vres’ undeclared (first use in this function); did you mean ‘res’?
>    466 |                 trim_list = &vres->blocks;
>        |                              ^~~~
>        |                              res
> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>    295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>    520 |         container_of(ptr, type, member)
>        |         ^~~~~~~~~~~~
> ./include/linux/list.h:542:9: note: in expansion of macro ‘list_entry’
>    542 |         list_entry((ptr)->prev, type, member)
>        |         ^~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:474:33: note: in expansion of macro ‘list_last_entry’
>    474 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
>        |                                 ^~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:485:38: error: passing argument 1 of ‘drm_buddy_block_trim’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    485 |                 drm_buddy_block_trim(mm,
>        |                                      ^~
>        |                                      |
>        |                                      struct drm_mm *
> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:27:
> ./include/drm/drm_buddy.h:146:44: note: expected ‘struct drm_buddy *’ but argument is of type ‘struct drm_mm *’
>    146 | int drm_buddy_block_trim(struct drm_buddy *mm,
>        |                          ~~~~~~~~~~~~~~~~~~^~
> In file included from ./include/linux/rculist.h:10,
>                   from ./include/linux/pid.h:5:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:29: error: ‘block’ undeclared (first use in this function); did you mean ‘flock’?
>    494 |         list_for_each_entry(block, &vres->blocks, link)
>        |                             ^~~~~
> ./include/linux/list.h:674:14: note: in definition of macro ‘list_for_each_entry’
>    674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>        |              ^~~
> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>    295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>    520 |         container_of(ptr, type, member)
>        |         ^~~~~~~~~~~~
> ./include/linux/list.h:531:9: note: in expansion of macro ‘list_entry’
>    531 |         list_entry((ptr)->next, type, member)
>        |         ^~~~~~~~~~
> ./include/linux/list.h:674:20: note: in expansion of macro ‘list_first_entry’
>    674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
>        |                    ^~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:9: note: in expansion of macro ‘list_for_each_entry’
>    494 |         list_for_each_entry(block, &vres->blocks, link)
>        |         ^~~~~~~~~~~~~~~~~~~
> ././include/linux/compiler_types.h:295:27: error: expression in static assertion is not an integer
>    295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ./include/linux/container_of.h:19:9: note: in expansion of macro ‘static_assert’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ./include/linux/container_of.h:19:23: note: in expansion of macro ‘__same_type’
>     19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ./include/linux/list.h:520:9: note: in expansion of macro ‘container_of’
>    520 |         container_of(ptr, type, member)
>        |         ^~~~~~~~~~~~
> ./include/linux/list.h:564:9: note: in expansion of macro ‘list_entry’
>    564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>        |         ^~~~~~~~~~
> ./include/linux/list.h:676:20: note: in expansion of macro ‘list_next_entry’
>    676 |              pos = list_next_entry(pos, member))
>        |                    ^~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:9: note: in expansion of macro ‘list_for_each_entry’
>    494 |         list_for_each_entry(block, &vres->blocks, link)
>        |         ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:520:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    520 |         spin_unlock(&mgr->lock);
>        |                     ^~~~~~~~~~
>        |                     |
>        |                     struct mutex *
> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    387 | static __always_inline void spin_unlock(spinlock_t *lock)
>        |                                         ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_del’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:545:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    545 |         spin_lock(&mgr->lock);
>        |                   ^~~~~~~~~~
>        |                   |
>        |                   struct mutex *
> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    347 | static __always_inline void spin_lock(spinlock_t *lock)
>        |                                       ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:554:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    554 |         spin_unlock(&mgr->lock);
>        |                     ^~~~~~~~~~
>        |                     |
>        |                     struct mutex *
> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    387 | static __always_inline void spin_unlock(spinlock_t *lock)
>        |                                         ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: At top level:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:680:10: error: conflicting types for ‘amdgpu_vram_mgr_vis_usage’; have ‘uint64_t(struct amdgpu_vram_mgr *)’ {aka ‘long long unsigned int(struct amdgpu_vram_mgr *)’}
>    680 | uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:128:10: note: previous declaration of ‘amdgpu_vram_mgr_vis_usage’ with type ‘uint64_t(struct amdgpu_vram_mgr *)’ {aka ‘long long unsigned int(struct amdgpu_vram_mgr *)’}
>    128 | uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr);
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_debug’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:701:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    701 |         spin_lock(&mgr->lock);
>        |                   ^~~~~~~~~~
>        |                   |
>        |                   struct mutex *
> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    347 | static __always_inline void spin_lock(spinlock_t *lock)
>        |                                       ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:702:22: error: passing argument 1 of ‘drm_mm_print’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    702 |         drm_mm_print(&mgr->mm, printer);
>        |                      ^~~~~~~~
>        |                      |
>        |                      struct drm_buddy *
> In file included from ./include/drm/ttm/ttm_range_manager.h:8,
>                   from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:26:
> ./include/drm/drm_mm.h:551:40: note: expected ‘const struct drm_mm *’ but argument is of type ‘struct drm_buddy *’
>    551 | void drm_mm_print(const struct drm_mm *mm, struct drm_printer *p);
>        |                   ~~~~~~~~~~~~~~~~~~~~~^~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:703:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    703 |         spin_unlock(&mgr->lock);
>        |                     ^~~~~~~~~~
>        |                     |
>        |                     struct mutex *
> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    387 | static __always_inline void spin_unlock(spinlock_t *lock)
>        |                                         ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_init’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:721:39: error: initialization of ‘struct amdgpu_vram_mgr *’ from incompatible pointer type ‘struct amdgpu_vram_mgr *’ [-Werror=incompatible-pointer-types]
>    721 |         struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>        |                                       ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:729:21: error: passing argument 1 of ‘drm_mm_init’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    729 |         drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
>        |                     ^~~~~~~~
>        |                     |
>        |                     struct drm_buddy *
> ./include/drm/drm_mm.h:467:33: note: expected ‘struct drm_mm *’ but argument is of type ‘struct drm_buddy *’
>    467 | void drm_mm_init(struct drm_mm *mm, u64 start, u64 size);
>        |                  ~~~~~~~~~~~~~~~^~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:730:24: error: passing argument 1 of ‘spinlock_check’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    730 |         spin_lock_init(&mgr->lock);
>        |                        ^~~~~~~~~~
>        |                        |
>        |                        struct mutex *
> ./include/linux/spinlock.h:341:24: note: in definition of macro ‘spin_lock_init’
>    341 |         spinlock_check(_lock);                  \
>        |                        ^~~~~
> ./include/linux/spinlock.h:322:67: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    322 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
>        |                                                       ~~~~~~~~~~~~^~~~
> In file included from ./include/linux/spinlock.h:87:
> ./include/linux/spinlock_types.h:41:9: error: incompatible types when assigning to type ‘struct mutex’ from type ‘spinlock_t’ {aka ‘struct spinlock’}
>     41 |         (spinlock_t) __SPIN_LOCK_INITIALIZER(lockname)
>        |         ^
> ./include/linux/spinlock.h:342:20: note: in expansion of macro ‘__SPIN_LOCK_UNLOCKED’
>    342 |         *(_lock) = __SPIN_LOCK_UNLOCKED(_lock); \
>        |                    ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:730:9: note: in expansion of macro ‘spin_lock_init’
>    730 |         spin_lock_init(&mgr->lock);
>        |         ^~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_fini’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:749:39: error: initialization of ‘struct amdgpu_vram_mgr *’ from incompatible pointer type ‘struct amdgpu_vram_mgr *’ [-Werror=incompatible-pointer-types]
>    749 |         struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>        |                                       ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:760:19: error: passing argument 1 of ‘spin_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    760 |         spin_lock(&mgr->lock);
>        |                   ^~~~~~~~~~
>        |                   |
>        |                   struct mutex *
> ./include/linux/spinlock.h:347:51: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    347 | static __always_inline void spin_lock(spinlock_t *lock)
>        |                                       ~~~~~~~~~~~~^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:768:25: error: passing argument 1 of ‘drm_mm_takedown’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    768 |         drm_mm_takedown(&mgr->mm);
>        |                         ^~~~~~~~
>        |                         |
>        |                         struct drm_buddy *
> ./include/drm/drm_mm.h:468:37: note: expected ‘struct drm_mm *’ but argument is of type ‘struct drm_buddy *’
>    468 | void drm_mm_takedown(struct drm_mm *mm);
>        |                      ~~~~~~~~~~~~~~~^~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:769:21: error: passing argument 1 of ‘spin_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    769 |         spin_unlock(&mgr->lock);
>        |                     ^~~~~~~~~~
>        |                     |
>        |                     struct mutex *
> ./include/linux/spinlock.h:387:53: note: expected ‘spinlock_t *’ {aka ‘struct spinlock *’} but argument is of type ‘struct mutex *’
>    387 | static __always_inline void spin_unlock(spinlock_t *lock)
>        |                                         ~~~~~~~~~~~~^~~~
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
>    CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.o
> make[3]: *** [scripts/Makefile.build:466: drivers/gpu/drm/amd/amdgpu] Error 2
> make[2]: *** [scripts/Makefile.build:466: drivers/gpu/drm] Error 2
> make[1]: *** [scripts/Makefile.build:466: drivers/gpu] Error 2
> make: *** [Makefile:1843: drivers] Error 2
>
> Regards,
> Mauro

