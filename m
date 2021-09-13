Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C6C408491
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 08:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3479389D7F;
	Mon, 13 Sep 2021 06:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE5489D7F;
 Mon, 13 Sep 2021 06:17:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9U0RoDVLnW3YxoLoeleF9vlTZwHuDuRKK/u9XiHviYT/+Fo+2tjnv1xEwNqhSYJHCFjuBBN4nyMXrjRAzFsZqyIdEUjCj1UeTcpq6bWimzqFa3JkoLwsbPMNPDrKaXJuEhjlSJRs6k4S8Gf+tDkxB7UbHatWEA/F4FxrXGGlKFwXJFoJ2Bp1Py6CsIzrqIUfDMcxhLhHzsWPrrQ7r9bB4ba1ao4FLGc5TkMbTChepGQOzvGoeVpqjSOx30amlUX9PlcCUcyM/dUQ6OoGRFKbgnxe2IZlS0q7MXPO7ufatmAbLdv+sfkrjRoLT8cZ2nkE+66NC5jqQ+WjIh6nSfDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=IysUHUFPJZwcyDsYUhT0SWjdU+eOOYAn6wiF1sUkLAo=;
 b=gQoUn0ijQESVqInHZRJ8Qwyzl8VH7FhmUdPeB29HchMShLtcYmcmAbxhhIAArU1LEo4v+A3cX5V02PT+kk9lfxD24vpN8fMlFO5u1stsiD4DqnZSpZ3wDqCPhF0TifVijXdA8yeKm1N1BmoEdvMDU9EGRa8KTPrw93Ftx1bJXuoXitTC9+4FVMg42Fnv0vh1EnHEfyl3qlCdMryQAmvDoQ7gEx9j1qlX2edRLDn+Z6kxGB3U3YVph5R5aZALDWa+1eFyGr/x/Z+Ba+gG9AuY8CIqpSnMaDA9yW3MOBf4Ix7eC+ahLMZjUCiHdDs7ZlV9RgT9Ps2RZ/+2J2QwyovpRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IysUHUFPJZwcyDsYUhT0SWjdU+eOOYAn6wiF1sUkLAo=;
 b=1aYQTsHSKo39d+U2ClH/5x92V7iwvxx8A2n0n+v9JXuxS4DTVGoABSnlsXEGWlE/IxQQL0bLsYf8GZJXJ+C4sprRb2fGn0ork11Zx9GCR9YW+ucEn9QThXol/YI5KrCC32IUTU3HX0au2zmbs/QkOuWikJ035uwpJOPKbhmR10M=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3677.namprd12.prod.outlook.com (2603:10b6:208:15a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 06:17:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:17:30 +0000
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c67b3b42-d260-44dc-81cb-1d1eb18db643@amd.com>
Date: Mon, 13 Sep 2021 08:17:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5ea3f498cc5ae84fa6aeba97a64e4eb8ab32e02b.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM8P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM8P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 06:17:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ad3b162-a37c-4e74-8de5-08d9767e2a37
X-MS-TrafficTypeDiagnostic: MN2PR12MB3677:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36779B8782B43D4346968FB983D99@MN2PR12MB3677.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d7xXmdq6nn59m8mCiJxeRe027UAQMW25PCSgiPZqCujmyh0/MDCEvlF4+DIawR23R8XmrvBSDaHwUk9tJXBQSrsE1kE8GMhIZAIMfVUAgINy9DkcqsPPyxq9m5zDLcV63LmuqXaL1zviHmIhjrVoZHghmNW9fSLY9SYZiYzMIFA/h5FC6ud96v5PvhcNg/Wpcc9+Rct0QAp5Ayah+TZWAgO5QW6yWIPQ6qlARP1GB4lc6WeVeoaKo2bUQ4eSHuoZXWBiw8AZ4AY+EEWTA4l1g2a0UD91nCp0mJ7iiBk2UEjdG8RwGVRkSExhvEIvjvzyrAPhA9NI60Kk0lC+XSpI5w2dVD38iuepkFJBxOeDA+LdUqtI9wSz2cWg3r8H+hHyyTPg+gGRM8ZRqZo3jhbJnAlUObVE0cwRq0qMFlZCx/oj9CsAg8+TQtFyQzB60j7x1cXTAr1VYAHwp4oKCYNBd6C74m+tMT/UuIu8IQsD9bDGNgYAFqG/+ImRqjhuF1RyD3Fw4KDiCjJvbsUlNanHSPtB8Pk6iiuonQSCgpaCvYPDH2cX6OetVzuDMpzbwY3MDALxRqF3aB2P88ueXtWD4D4bIzxW7uujNCkmFmMbGCHlEK1x03yY66AiV05zvTyoO7aB+V8IExarUKg6kXJT1FOiRtbRvceeGhw5U/1RcMBL8uMJwyGNbedrcYD8aqhiSHCWTRGPO6cj1pizITpBTntBVkOcrYFaPzcbbfhZnKNSfQlVgoXYAMZOct+zBcMS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(26005)(8936002)(186003)(5660300002)(38100700002)(16576012)(316002)(2616005)(2906002)(956004)(31696002)(66946007)(66556008)(66476007)(6486002)(86362001)(4326008)(6666004)(83380400001)(31686004)(66574015)(478600001)(36756003)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STRKNG5iTW5nVkZ3N2dvTWFZekVWa0dxWHZyZDNxTHpKQzRlcDVqZ2xIK21a?=
 =?utf-8?B?Nk5LVG9CRzJLdnhZSytxMkpsQjJsMzA1OVlzWTlTV2FqN3BCOGpGVTh1WC9T?=
 =?utf-8?B?ZjJwQUtyUHBtWVZzSElSZk9kcjg4b1BiOEx1bENZYnVmQUdXZkZveUxqTXRp?=
 =?utf-8?B?SFBCd3NySUl0ZVFBYTV2aFVOaThwTkFZeVIzUWU4TEtZM3NhUGcwNkdsdVRp?=
 =?utf-8?B?NDMrTUJrWXZrOUt0WG5adFQ2Z3VJelBSR3d4MFNjZlVZbitHbzllUkJ5dVNB?=
 =?utf-8?B?ckdoOGs0SkJkZ0VSTHFmU3gyNHhNZ05Tdy9WQWhHVTZTd1o5WVFnRkpXSnVM?=
 =?utf-8?B?bGYxcm51YlFlanpEWHBxVjU4U2QwNGxEVVJKN05OTzNlNy9yU2l4RXJOamVp?=
 =?utf-8?B?ejlKQ1I0cHczWURsNVFhSWRPYTZ3UUg3aHhjNWdtRzJRM1daVlNRMjRTVUli?=
 =?utf-8?B?VzIraW9Ld2p0YS9qaFQ1TXgrMzJWQUR2SXBiT2VkUW1wZm1NQlhQdFcreGZ2?=
 =?utf-8?B?bVhEODlwZGJqZWwzckU4NkdNcTlqRTVCS0dyWitrZ21HWkp4MXZIdmRRa2lK?=
 =?utf-8?B?dDFpVWp1UlBXSi9WZkx5cUFJdlJQUEp5RkVUSFFRbW1NdGNMemZ5RGI0bXdX?=
 =?utf-8?B?M0ZKQzg1MG9UMDl5VnQ4TWRrNW1SNlBwcktEajJScEtDQnVGemxDOFh2UnBY?=
 =?utf-8?B?VE1ldnVZQ3hZZ2UzbjJ6K3VVdnV3dEFDYjgwRU5pSWVhazRkRXdXa2RWcm91?=
 =?utf-8?B?a1BXa2psN2hHbGJMaGRKRFJLdUNSZUQ1bFUwa3oxTXhLVjZZb0J5cWVZSjR2?=
 =?utf-8?B?T3lLdmNlMGxSN3hmYnhoR3hsWU5LNGpUelViUkF3ZG5Sc1U3NFRKSW1zTVNS?=
 =?utf-8?B?MzBScGpnMFpEUm16M1FkcVlJaW1QYjk3YlB5Q2tnUENHT2pxTml1QTNKNTZr?=
 =?utf-8?B?YXVCYXhmbUliSVp6ZjRldzJGMDBGNGRNMURIY2U5Ui92Rk9oUHNTQ2dkWVJ4?=
 =?utf-8?B?Wm1ycng2Y3N3aU5zWlpzRTEwOVJESVdkV1ZBMGIwSDFvNlFJSE41OG42YnZ4?=
 =?utf-8?B?OFZ0eXNWR0ZwU2d4cXFkWFVoNDlBbExRWVdqTzg3RWZQckVhQ2lnK2hwVXdp?=
 =?utf-8?B?VHRSTVVjVDJkRkRpSDZpRXJWRkYyT1lsNGhOb3hncklQZFloaC9xT1NFdnlH?=
 =?utf-8?B?VURsSUliZnVVNVY1S20xTnl3czdhbyt0dnUzN1BlTHFNd2NrNTdNR2R2R1d3?=
 =?utf-8?B?N3VaSm84bDM2bVkvRkI5MW9yVGhoWWxMWjNvelExMmxlOHVTM0ovZGd0eVJI?=
 =?utf-8?B?Tkg0cVFlbmdmWXhIbFg0eG43OEZkdjRweGNJMjRrb2MrK3Ftejd0ZWFCYldz?=
 =?utf-8?B?RXROb29BOEMzRUJBUm1jZ2FCYzNNSEtFbFU3Uk5uNW5PMVVoN1RRL3lxNFVn?=
 =?utf-8?B?RXMxSy9zbmMwYjc3V3AyWURXNnZjZnlkWU1UbHNBcjhXbXhkZE1GaUZVU1I4?=
 =?utf-8?B?OXhlTVM5eTVRcGovYkxaUkZURkxVSTlOd0sySjE4bng2TFBQSXI0c3g1YkpH?=
 =?utf-8?B?R0krUW1VVTdSeTNMenJiQ2U2ZlZsR2FBakJrVllzdVhVODcxYk1MVStwYi9P?=
 =?utf-8?B?Ry9XMWFIdkRLOXpqR2ZXWGR6azlYUUNqVG5vQ1lMNHpTdnBzQ2dtbEY2MHRi?=
 =?utf-8?B?NjVxOUhaSVdlQTA0NlpDY09rbWFwY0cyOURkcm1ldWN1S0tZV3FqbVdmVmZ4?=
 =?utf-8?Q?ouP5AgxPrLRTUujjJ9U0rVXLem/E4DuvR2Ejjo4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad3b162-a37c-4e74-8de5-08d9767e2a37
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 06:17:29.9774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soV9QonpKNAafO542AXONzrOK9uMk0dEpWaEKIWfJJ6oT9eMBnEzDhqhPRYK5+yh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3677
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

Am 11.09.21 um 08:07 schrieb Thomas Hellström:
> On Fri, 2021-09-10 at 19:03 +0200, Christian König wrote:
>> Am 10.09.21 um 17:30 schrieb Thomas Hellström:
>>> On Fri, 2021-09-10 at 16:40 +0200, Christian König wrote:
>>>> Am 10.09.21 um 15:15 schrieb Thomas Hellström:
>>>>> Both the provider (resource manager) and the consumer (the TTM
>>>>> driver)
>>>>> want to subclass struct ttm_resource. Since this is left for
>>>>> the
>>>>> resource
>>>>> manager, we need to provide a private pointer for the TTM
>>>>> driver.
>>>>>
>>>>> Provide a struct ttm_resource_private for the driver to
>>>>> subclass
>>>>> for
>>>>> data with the same lifetime as the struct ttm_resource: In the
>>>>> i915
>>>>> case
>>>>> it will, for example, be an sg-table and radix tree into the
>>>>> LMEM
>>>>> /VRAM pages that currently are awkwardly attached to the GEM
>>>>> object.
>>>>>
>>>>> Provide an ops structure for associated ops (Which is only
>>>>> destroy() ATM)
>>>>> It might seem pointless to provide a separate ops structure,
>>>>> but
>>>>> Linus
>>>>> has previously made it clear that that's the norm.
>>>>>
>>>>> After careful audit one could perhaps also on a per-driver
>>>>> basis
>>>>> replace the delete_mem_notify() TTM driver callback with the
>>>>> above
>>>>> destroy function.
>>>> Well this is a really big NAK to this approach.
>>>>
>>>> If you need to attach some additional information to the resource
>>>> then
>>>> implement your own resource manager like everybody else does.
>>> Well this was the long discussion we had back then when the
>>> resource
>>> mangagers started to derive from struct resource and I was under
>>> the
>>> impression that we had come to an agreement about the different
>>> use-
>>> cases here, and this was my main concern.
>> Ok, then we somehow didn't understood each other.
>>
>>> I mean, it's a pretty big layer violation to do that for this use-
>>> case.
>> Well exactly that's the point. TTM should not have a layer design in
>> the
>> first place.
>>
>> Devices, BOs, resources etc.. are base classes which should implement
>> a
>> base functionality which is then extended by the drivers to implement
>> the driver specific functionality.
>>
>> That is a component based approach, and not layered at all.
>>
>>> The TTM resource manager doesn't want to know about this data at
>>> all,
>>> it's private to the ttm resource user layer and the resource
>>> manager
>>> works perfectly well without it. (I assume the other drivers that
>>> implement their own resource managers need the data that the
>>> subclassing provides?)
>> Yes, that's exactly why we have the subclassing.
>>
>>> The fundamental problem here is that there are two layers wanting
>>> to
>>> subclass struct ttm_resource. That means one layer gets to do that,
>>> the
>>> second gets to use a private pointer, (which in turn can provide
>>> yet
>>> another private pointer to a potential third layer). With your
>>> suggestion, the second layer instead is forced to subclass each
>>> subclassed instance it uses from  the first layer provides?
>> Well completely drop the layer approach/thinking here.
>>
>> The resource is an object with a base class. The base class
>> implements
>> the interface TTM needs to handle the object, e.g.
>> create/destroy/debug
>> etc...
>>
>> Then we need to subclass this object because without any additional
>> information the object is pretty pointless.
>>
>> One possibility for this is to use the range manager to implement
>> something drm_mm based. BTW: We should probably rename that to
>> something
>> like ttm_res_drm_mm or similar.
> Sure I'm all in on that, but my point is this becomes pretty awkward
> because the reusable code already subclasses struct ttm_resource. Let
> me give you an example:
>
> Prereqs:
> 1) We want to be able to re-use resource manager implementations among
> drivers.
> 2) A driver might want to re-use multiple implementations and have
> identical data "struct i915_data" attached to both

Well that's the point I don't really understand. Why would a driver want 
to do this?

It's perfectly possible that you have ttm_range_manager extended and a 
potential ttm_page_manager, but that are two different objects then 
which also need different handling.

> ....
> This would be identical to how we subclass a struct ttm_buffer_object
> or a struct ttm_tt. But It can't look like this because then we can't
> reuse exising implementations that *already subclass* struct
> ttm_resource.
>
> What we have currently ttm_resource-wise is like having a struct
> tt_bo_vram, a struct ttm_bo_system, a struct ttm_bo_gtt and trying to
> subclass them all combined into a struct i915_bo. It would become
> awkward without a dynamic backend that facilitates subclassing a single
> struct ttm_buffer_object?

Why? They all implement different handling.

When you add a private point to ttm_resource you allow common handling 
which doesn't take into account that this ttm_resource object is 
subclassed.

> So basically the question boils down to: Why do we do struct
> ttm_resources differently?

ttm_buffer_object is a subclass of drm_gem_object and I hope to make 
ttm_device a subclass of drm_device in the near term.

I really try to understand what you mean hear, but I even after reading 
that multiple times I absolutely don't get it.

Regards,
Christian.

>> What we should avoid is to abuse TTM resource interfaces in the
>> driver,
>> e.g. what i915 is currently doing. This is a TTM->resource mgr
>> interface
>> and should not be used by drivers at all.
> Yes I guess that can be easily fixed when whatever we end up with above
> lands.
>
>>> Ofc we can do that, but it does indeed feel pretty awkward.
>>>
>>> In any case, if you still think that's the approach we should go
>>> for,
>>> I'd need to add init() and fini() members to the
>>> ttm_range_manager_func
>>> struct to allow subclassing without having to unnecessarily copy
>>> the
>>> full code?
>> Yes, exporting the ttm_range_manager functions as needed is one thing
>> I
>> wanted to do for the amdgpu_gtt_mgr.c code as well.
>>
>> Just don't extend the function table but rather directly export the
>> necessary functions.
> Sure.
> /Thomas
>
>

