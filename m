Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9203B408873
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 11:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061776E120;
	Mon, 13 Sep 2021 09:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E9A6E11F;
 Mon, 13 Sep 2021 09:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSZw5+EKVkKYoFmtJPgxgrjDHEeGZH3g8ILxkIKbZgMUk0QcQgasqm4FhMeatlFae4+/dlWiY+t8UWG37W/ZifxP2/qZFp+kYCVdyxg3iTwZWO+cBTXx4M7/cln/NVEKJIp0dBmZfjf8WuPV9yJHydBW5BBX38ixAXKgyuyHd3+DFoImJbsJpJgOr1OZFQE7aeU2XlE3z2XsR8D7N0BvCtK0qRSPlyI311bPBrrgxohaWOb+gBkfnDPwR9MK5Z0zwvmynhgK1SXHN1Qpfzgkxlv6VnJVpSwyV2OXikq+yFsbR6alpfSyN6gyYgPEWhU6Ld3Pi66vI9VnXOxl9BFXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=XoUbPbKvAm7GEkX+kGl+Z0NzjXt/rrKjiiodk3g5tp0=;
 b=Bth8td/nPoXU5rYsEtDrBuhyy9TswBDqWh8kSvbchLU7hxUaSCM3Q4gArKKs3hPuRvawcISZ49+tRYFBFLhHitBBHuZw/b4UYQWtkw0U/2dTT3Vj+PTzHXQJkKBWNvFS2mmat7/y0KHUIPmuv9sU/PmOpm3FPE4nDfxU8p2c9GzcP6qsJPsZGUCwUn0rAbtebygtEROjP6SvBYP+2+EfTcn65OFMeLYQ3LjXEjMP0G2yYz2P/YlfKNoyGM2TvhqFZcwFIcfYqcl5BcA4sw4SdUhrDE0o0mgJ99zBeIcGwM1ftJjKxsx1Gq20be1ZUOWAr7LxVQZFahTbiAA8Qdg3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoUbPbKvAm7GEkX+kGl+Z0NzjXt/rrKjiiodk3g5tp0=;
 b=XaidFVC2Q92/VVSlYk7D494uFJjkaEv5xLgvjkh8loVvSyd2qbfY1n/lC5rcqq8hSBAi7PFcdCPlOQhG29KDGUaECL44BMb5sYSdJ2ikZV04ICEJ17eVzpll/s7t2ozaerZDeEIE1T7cJwKba3KLtdL0VcbYIwvxcy3twruijtw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 13 Sep
 2021 09:41:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 09:41:59 +0000
Subject: Re: [RFC PATCH] drm/ttm: Add a private member to the struct
 ttm_resource
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20210910131512.161655-1-thomas.hellstrom@linux.intel.com>
 <d7570cab-d402-761d-40e0-3d08d9b9d3c9@amd.com>
 <a1a8fd3f1ca13b84192bd3c8719f510e5b655b2c.camel@linux.intel.com>
 <c8484b51-4365-bedd-be73-4c0898ac70b1@amd.com>
 <5ea3f498cc5ae84fa6aeba97a64e4eb8ab32e02b.camel@linux.intel.com>
 <c67b3b42-d260-44dc-81cb-1d1eb18db643@amd.com>
 <a6badfa3-efbb-7830-e019-1dd61b0f800e@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5ca10e93-9bac-bd8f-39b0-d60fe06bc289@amd.com>
Date: Mon, 13 Sep 2021 11:41:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a6badfa3-efbb-7830-e019-1dd61b0f800e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR01CA0154.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 09:41:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e339e600-5017-4897-2c3a-08d9769abb2f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB439048AF18A984AB88F9A06683D99@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eOHpS5QZHfp/Lfr7QrJaGgnkSLuREZMW87IrJhL1A1C81Bhb2DP7aXOko8t1WMElvr/X+ZQ1uMZzl4jJOZydc7IqRt/Q/MQ7j+04Btkxd3Pf7ht024mWm29daxGA8+HAQA56xeIkLvjvebtg/3BVx3Ny3SUQK+CFQZE0ff416DTLs6qccvLyafgq9phAGX4egFcLr0feF3PhWQciC7m7ueXJf2cLI0i/ZkDTPFsbe8s1+bOmO2HTA2cui1Cwy0wg0Caz3R4fBB5PQGXOBHguFYWdZtaa3tNIvrPGfZZQxZ6Hdzc9cEQmg8UUNK8pe5smlEXktZXIvygCQgBCrH85UJXMCuiMy4PWOlZcHoim/C/NLNTvQJa2MyYjODccDS/6THjdq83d2NQbcDukU982hELI5kE8NvmwQdN6V0rpgjcVky8WkwASTkqXeLQqpl5H+SEinP0u9G5Yg9K8D/wAZbU0aec3cAXh2b6nWSEqj98e2wNuD8mAq7jQakm55t/YrIo/hb+s/tBiFqr1rfYzFSpqGZLCUOaiI+UB1gwTiN0UilY82oRHCPzkBacz3uJ2lcGjKFd8Xe3AValOBa2D59AJOM/B5nYBq+74p0ddP51KV4/bD5eedMYmsFnL3Iw95R/Yl3ql0f7Uy+7LXymOCNVmryOW1ceITXkbYfsvpo3qaV6Xc0fbtPI3yQwxaYVEWNg/zOYo8CkIiMY792NV6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(66946007)(53546011)(36756003)(38100700002)(26005)(4326008)(31696002)(31686004)(2906002)(6666004)(66574015)(66556008)(66476007)(8936002)(6486002)(478600001)(2616005)(86362001)(83380400001)(956004)(186003)(316002)(5660300002)(8676002)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VCtvZEZYZ2xIQWRaQXRqUTU4bXRFUFFNUGxCWjhGTXg5S0Q1N3Q4UDBwQ1Jk?=
 =?utf-8?B?amRwRlZCSDhOd0k5SzVFek0wb3lENDRrWnlrV2RzWUVsZzNFcmoyZXFtY0lS?=
 =?utf-8?B?Y05CSWJxN1UrbGs3a1lYY0Jsc3NjYzhPRFpEbXcwMklTSStLZ2dXdlJ2cGxR?=
 =?utf-8?B?bDBBV3BRcFl2U0dhT1JEdmIvdzVhOHZSZVV3TmN2TE9qRmh5bXVzM2c0ZW1s?=
 =?utf-8?B?dmFqKzlTTWpEdmdIYWV6L3NqckRYN2J1bHRVdmVMMUhzVWFHNWkyWnBZTGpF?=
 =?utf-8?B?ZDRBNUFMc2JtdWNmT2RyTDNFRG80OW1URHhpNTJEY3A4bU9nenJBTlNJa2Fv?=
 =?utf-8?B?ZGwrMHp1dzRlVHN6U3lkTFZNeTRnNHlkRitNcjRIMkZ0VVFBV2RqcCt2OVBm?=
 =?utf-8?B?cjAwRmxvOGRxN2RxaVpWTm14dGJhajM0TWlIaHk3N3BqdWQvTHBGKzdMMjZE?=
 =?utf-8?B?cEpzc0xaQVFVNGViVTBBWThZcE1IekhvQ3EyZmxDQ2s1R0IyMjQwRktSOVc0?=
 =?utf-8?B?YUsvendGMXByMVFaM1U4Y2Q0REhrZFRTVktNVlRqaWdBK1NLT21ZL0RhWVZj?=
 =?utf-8?B?TUR1MmJjaW1wVEVPRHRYOGtvS05xeXRnKy9YVEtNOWRia2g5QUJVelJXbjhZ?=
 =?utf-8?B?Z2Q3b2xVckI4V3hnVk1BbUQ1Y3NUUkZWUUNhWTM4VDBwK2hVNnpmSlBaSkNp?=
 =?utf-8?B?aEg5dXpzL2xSZFFDUlhJUm41U1lmZ2FSNkZGaWZuNFQzeStlcmthSnpNaldq?=
 =?utf-8?B?bmxxeTNLc0dFWTRCWlU2QmNJaGYxMko4RjVNNUoxS2xkUEZ0U0FUOUVsSU5O?=
 =?utf-8?B?dEQ0TE01RTZPRmpMbEVIZDNYeE9yOTRYTkNNc1lPV1k1T2lyTjlqa0ZQYW9U?=
 =?utf-8?B?YXF5UUl6a1k0WWtOQUdYRW5KcWtCRjYzeVpxeWNwNHdqQ3A4em11ekhES2Fn?=
 =?utf-8?B?NVpDekhyQnFtQklLL1VOaHhsY2cvVzlwS2lRSWVMWFcrS2xOcHVIeXlQQ01i?=
 =?utf-8?B?WnZsalpCUGVZNWFKSVR5MHBDMzlNVk9wZ0JjWE9FMEF6YTZnbGVUSkVNbjIr?=
 =?utf-8?B?S2NUK0NSRFhnMHR2bHhtMjhZSlE4UWhwTmRJdVFLTExQSnBuRU5aMWRhay9D?=
 =?utf-8?B?M2NQVktTb2VVdklmLy9kcTMwQ1RydFdCeUxpRk5Oc2oxRy9zSTFxQjhkNVF2?=
 =?utf-8?B?dER5ejI1cGQ1NWRDV3ZMTkYwVm5mckNFcVpCUjRxWGtXazZtZXJ2SUFZYitO?=
 =?utf-8?B?NFB2QnRMUStvM2hMYTNpOHAwQTFnd3gxaXFidFczUGpHRW1OajRJOTlrbnA2?=
 =?utf-8?B?WkVTZGpzM0c1aTVoNTBWWTVMeHJIbXRxd3c4QldRNnF5cjg0UTdFaStpb0xO?=
 =?utf-8?B?WkJNREE2aDZWbW9VZm9WT2U4SENYaUQ4T0VtZURDdkdFNStnRFNrOEl0RkpF?=
 =?utf-8?B?VmZlTU5jbE83NCtUck1VQi9IUFExSGh1RUU3OVJXNnFEQ2xSV001NHFWQnhM?=
 =?utf-8?B?bFkzcXpIRms3d3dCc0RYbnRQUmRXbWM1N0VyUTNJMUJTczBzdURuZ1NFS3Fv?=
 =?utf-8?B?cmV0SGEzNnBDcERJMmpNNDBNTFNVSTlFbVZOcHhFZ1N6U2FRZDgzUllQSG5O?=
 =?utf-8?B?SjJDbFFzNHJtRmd4SG5udzFmdXhPZ28xSlM3TkRwWjdzRWQxWXFIRjlZeHR3?=
 =?utf-8?B?MzU2eVd2ZXhJR2pNaHRlR2lvYUxRdU1pSnplNFNaWTU5N1lRREZ1NHU4WkFQ?=
 =?utf-8?Q?rR5kDQtUa0IANyDu5C0mEz73ZIINfN5i51343FC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e339e600-5017-4897-2c3a-08d9769abb2f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:41:58.9806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ajLBQriEKKDJCXZ/DRCHh/bWofA8CxGMbQWbfICxG83tvCF6QFp39rtAxLxzhCG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

Am 13.09.21 um 11:36 schrieb Thomas Hellström:
> On 9/13/21 8:17 AM, Christian König wrote:
>> Am 11.09.21 um 08:07 schrieb Thomas Hellström:
>>> On Fri, 2021-09-10 at 19:03 +0200, Christian König wrote:
>>>> Am 10.09.21 um 17:30 schrieb Thomas Hellström:
>>>>> On Fri, 2021-09-10 at 16:40 +0200, Christian König wrote:
>>>>>> Am 10.09.21 um 15:15 schrieb Thomas Hellström:
>>>>>>> Both the provider (resource manager) and the consumer (the TTM
>>>>>>> driver)
>>>>>>> want to subclass struct ttm_resource. Since this is left for
>>>>>>> the
>>>>>>> resource
>>>>>>> manager, we need to provide a private pointer for the TTM
>>>>>>> driver.
>>>>>>>
>>>>>>> Provide a struct ttm_resource_private for the driver to
>>>>>>> subclass
>>>>>>> for
>>>>>>> data with the same lifetime as the struct ttm_resource: In the
>>>>>>> i915
>>>>>>> case
>>>>>>> it will, for example, be an sg-table and radix tree into the
>>>>>>> LMEM
>>>>>>> /VRAM pages that currently are awkwardly attached to the GEM
>>>>>>> object.
>>>>>>>
>>>>>>> Provide an ops structure for associated ops (Which is only
>>>>>>> destroy() ATM)
>>>>>>> It might seem pointless to provide a separate ops structure,
>>>>>>> but
>>>>>>> Linus
>>>>>>> has previously made it clear that that's the norm.
>>>>>>>
>>>>>>> After careful audit one could perhaps also on a per-driver
>>>>>>> basis
>>>>>>> replace the delete_mem_notify() TTM driver callback with the
>>>>>>> above
>>>>>>> destroy function.
>>>>>> Well this is a really big NAK to this approach.
>>>>>>
>>>>>> If you need to attach some additional information to the resource
>>>>>> then
>>>>>> implement your own resource manager like everybody else does.
>>>>> Well this was the long discussion we had back then when the
>>>>> resource
>>>>> mangagers started to derive from struct resource and I was under
>>>>> the
>>>>> impression that we had come to an agreement about the different
>>>>> use-
>>>>> cases here, and this was my main concern.
>>>> Ok, then we somehow didn't understood each other.
>>>>
>>>>> I mean, it's a pretty big layer violation to do that for this use-
>>>>> case.
>>>> Well exactly that's the point. TTM should not have a layer design in
>>>> the
>>>> first place.
>>>>
>>>> Devices, BOs, resources etc.. are base classes which should implement
>>>> a
>>>> base functionality which is then extended by the drivers to implement
>>>> the driver specific functionality.
>>>>
>>>> That is a component based approach, and not layered at all.
>>>>
>>>>> The TTM resource manager doesn't want to know about this data at
>>>>> all,
>>>>> it's private to the ttm resource user layer and the resource
>>>>> manager
>>>>> works perfectly well without it. (I assume the other drivers that
>>>>> implement their own resource managers need the data that the
>>>>> subclassing provides?)
>>>> Yes, that's exactly why we have the subclassing.
>>>>
>>>>> The fundamental problem here is that there are two layers wanting
>>>>> to
>>>>> subclass struct ttm_resource. That means one layer gets to do that,
>>>>> the
>>>>> second gets to use a private pointer, (which in turn can provide
>>>>> yet
>>>>> another private pointer to a potential third layer). With your
>>>>> suggestion, the second layer instead is forced to subclass each
>>>>> subclassed instance it uses from  the first layer provides?
>>>> Well completely drop the layer approach/thinking here.
>>>>
>>>> The resource is an object with a base class. The base class
>>>> implements
>>>> the interface TTM needs to handle the object, e.g.
>>>> create/destroy/debug
>>>> etc...
>>>>
>>>> Then we need to subclass this object because without any additional
>>>> information the object is pretty pointless.
>>>>
>>>> One possibility for this is to use the range manager to implement
>>>> something drm_mm based. BTW: We should probably rename that to
>>>> something
>>>> like ttm_res_drm_mm or similar.
>>> Sure I'm all in on that, but my point is this becomes pretty awkward
>>> because the reusable code already subclasses struct ttm_resource. Let
>>> me give you an example:
>>>
>>> Prereqs:
>>> 1) We want to be able to re-use resource manager implementations among
>>> drivers.
>>> 2) A driver might want to re-use multiple implementations and have
>>> identical data "struct i915_data" attached to both
>>
>> Well that's the point I don't really understand. Why would a driver 
>> want to do this?
>
> Let's say you have a struct ttm_object_vram and a struct 
> ttm_object_gtt, both subclassing drm_gem_object. Then I'd say a driver 
> would want to subclass those to attach identical data, extend 
> functionality and provide a single i915_gem_object to the rest of the 
> driver, which couldn't care less whether it's vram or gtt? Wouldn't 
> you say having separate struct ttm_object_vram and a struct 
> ttm_object_gtt in this case would be awkward?. We *want* to allow 
> common handling.

Yeah, but that's a bad idea. This is like diamond inheritance in C++.

When you need the same functionality in different backends you implement 
that as separate object and then add a parent class.

>
> It's the exact same situation here. With struct ttm_resource you let 
> *different* implementation flavours subclass it, which makes it 
> awkward for the driver to extend the functionality in a common way by 
> subclassing, unless the driver only uses a single implementation.

Well the driver should use separate implementations for their different 
domains as much as possible.

> OT:
>
> Having a variable size array as the last member of the range manager 
> resource makes embedding that extremely fragile IMO. Perhaps hide that 
> variable size functionality in the driver rather than in the common code?

Yeah, Arun is already working on that. It's just not finished yet.

Regards,
Christian.

>
>
> /Thomas
>
>
>

