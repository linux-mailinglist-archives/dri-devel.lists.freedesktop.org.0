Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A669D50889A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0EB10F02E;
	Wed, 20 Apr 2022 12:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7922910E6D5;
 Wed, 20 Apr 2022 12:57:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1CPURPSclU94aojrWywJoK8ipYpGq1YTnwv97TTSUIyv2rgOLWTsTo2/E+wRGZwAO47+CqfKk1eDiNWix8lUXTZ6X61i5eliA6nasT5kR7kvy0F1IEU3gB1sKnRbm4slhYPw1BV8BTKzXaM3Jg4SHIWO4CfzOvlrBDpu/2a+k2MyP64NKixAClSwrDWluM1fy4fIJv5OSJkZewM577gziQA+UXyHIQyG9S7fPUwd8e67cgPilyQt/e8tNEYEeOeem784YIxfW1cypu8rO+U/5B3K5nYIWcy9ZBPkP9aquqHW+IutpULo7WJFrYpFvdlH4IvMLwxmFg3zxccpa+few==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhDgYtY4JHxRXNfB82gvoZOmu+7pcHvcbkifKpb68rw=;
 b=eHWq8K/pIrO55YKfMnOJKCL3ETQZKfjBbe9t7tF39jHw6XM/CDuP4sjnWs93EM/DP74XirU6i18LxlPOGELPPnGyFDqEBH3AeAIdLA0Rboimby/Tx8zmlz4hWUZlx1VnhSg847yoOme3kRbMmxwza/z5C4AqBMVu2NazqipGYVyWt7MT4MMN9+57Vt7WQFPIG2+XW2bUh/sl8ricGZLO6Gfg0WDIqYE7Ec5f10xZgFTeALx6K3ehrdJsAdk9w9VlnHgyBGUY4kQo0wNj4511tQ1mZyTvOOQtIkKGEmIrcC3Ky9L92w/C4biLsf1RO4I0rcTC4tgwPhnCoXBuiy5Q7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhDgYtY4JHxRXNfB82gvoZOmu+7pcHvcbkifKpb68rw=;
 b=wSq+W0yaLsr6MTQDKfsjvcZEV1k020lcocewYBJLv9xChqrZjstkTOK5Ot2HIRJGwk+FLGXXDJN2hCISn8pLiNf/r61OR0k7mTJfyMd9qPstfI7Z8C6cVQcFCEZZQ7mvSb6weuzgZQlo0rdlOPCEVgcpX6RE4fgJTGkCj3IbHEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2929.namprd12.prod.outlook.com (2603:10b6:408:9c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 12:56:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 12:56:55 +0000
Content-Type: multipart/alternative;
 boundary="------------DP6p6IdRVCG3WK4PnPqrm2Xp"
Message-ID: <075258d7-16af-a664-0406-2b2862efe05f@amd.com>
Date: Wed, 20 Apr 2022 14:56:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Content-Language: en-US
To: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
 <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <71f3ac77-b6ed-e503-8e05-dcf9d2c2811a@amd.com>
 <CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
X-ClientProxiedBy: AS9PR06CA0233.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17790e15-81b1-4f89-83f9-08da22cd3f5a
X-MS-TrafficTypeDiagnostic: BN8PR12MB2929:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB29297C104917EF21716913D283F59@BN8PR12MB2929.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LzUD6wh9TI/HPsol33LjDT6xR5JzepcxJfn+ZqOXwkddTaGFoSAGtvuXQoGs0MvOgjf3fw6H8ZvsojKYTIX1c/nlubSl6lMVEOyigzppm+aqr7L0uAYRDBPLDHMpmd41W0wERYmq13z7X0h8PVw24vNNOF9jB1iyI4AYaDdlnXpwcw+i6jtQ8lNm4zFQzVjKh/Me6RxQg57blDJxauIw6Rg2tX1pispAJ/MzXlUGIcFaZsogsZQEkBGdk0ChT6vKGV0fL1QNAAxkYqSdPKa4PFcNXj58cUypPC5O9d7kjSv1qk/YUA5xuTAV2g7eX/2ShUG6HCKXU4O4su8y+nk9SKxza0b31I/RUwGzl8OaAtEPLmhCJNWbPEk1/9C8UoMqP0VWKNnV1AHUOhdz9EWbfC6KLX9GOiz6CwKEAaJOj/jlvfPka41Vr4+0X1OOhsNQiBwC/w2KMuh/+exZbeUaBTjuJLqab3kWNYGK46chFe3C69N3P2YTQ5oc96B5gr+8NGzKFEbzQVeqc2Kt3fghjwRTvnAnWg5xUG1zGN/BW/C5hI2p3XVeU62WFGOr1chnDJrOZOMleZ6sAipkuOeJtGecEy4viwv8iIdULdfQL2ez0fFA+FcKiP08Wbs8jGxwOiLHXcraWiEaZS0NMNiouEqU5DL6jcFhrY5QRXzecNpcTAopEhgbFgAqE4Ne59rWev/iX26YugMoZqmMuH8u+J2qpgl7fqp6vvLreS5HkbD/qMafxB6IYVJL1h3+dllB5mDuWBYq3weDsByPexd1h9CZfVgEhWcnrbpC5vo7dMFnQmDWU0unwfR8BeXq1O7iRqPHCRMHd2+GjxLdpdVcNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(38100700002)(166002)(19627405001)(45080400002)(316002)(36756003)(31686004)(66946007)(6512007)(66556008)(83380400001)(2906002)(508600001)(6486002)(26005)(186003)(5660300002)(33964004)(31696002)(66574015)(6506007)(86362001)(8676002)(53546011)(66476007)(30864003)(6666004)(8936002)(2616005)(43740500002)(45980500001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmtGb0dZa3ZXcDVEd1IyOWpzbEdUNkNBRW4zeld1MEhicnpNbGF1UmJEQnd6?=
 =?utf-8?B?dHc3Mkh5c0Q1azlCNTd2UW15OXJTQ0daRzdBdXRXVkkzSEVlaHRXU0owcVYw?=
 =?utf-8?B?bnE3RjJTd0tqN0JTd2JaVVV2RnFPcUVKRG1vWnNHcU14ZlRWTjRtQlNNVG4w?=
 =?utf-8?B?aUdVckFRanJ1TGdhSU1HUHduclc2T3VqaXBPSHV6WU02Z2NLTkxKYkVITWdB?=
 =?utf-8?B?TUd3UFdGVWZkTlBBVTRUbitxczVkOXhlVkFKZ3hPUlZuMUlCSmUwNlJ0d3NH?=
 =?utf-8?B?eDY5QVV3aFNuRlk0N2JWVWVyaUIySExvaDJ0ZXZkS1I1TFUvby9BRGdlSVJE?=
 =?utf-8?B?VlZWMGxhb3FrSVViVlRvNmJQd21TWUhodmVZaGkzWC94QW5oMHJaaTI0SjFZ?=
 =?utf-8?B?RjJUdkFkUjlnTFBHQ1VPYlE4ZkIyYThLQ0M5cmZlZnB4bDd4cGhlakxDR2xm?=
 =?utf-8?B?b2F1L0JySzlZRzlOQWx2RkU0eHVFWC9KYXF4VHVHakF3dmlORWxyMGpZWHl3?=
 =?utf-8?B?QnFVMlJRdXhpMnJBcVpzREhIVitHRWFjWi9INk1XeVJ0Q1NoV01NQzkzTGJI?=
 =?utf-8?B?cGZNWE1PVy9TWVlkcnRuZWZ0bGg5MjdadmdWYlpXRDE2U3VweWlIbGNMajRT?=
 =?utf-8?B?UjdyOEs1TkgzRXVDRGxkTW5pcG1jNUxQUGZ2R3RDSUtzN3FTeXhaVStUUjdp?=
 =?utf-8?B?MmhIdG5lL1BZdDVYaVA4MWFQZUd2VWFpQWhkN1lvdjlUdVdTVzVTSGgxWHJl?=
 =?utf-8?B?OVg0M0JoY2Nsb0t2SDYzVXVkdGw0dCtCbGtTamdqdmthTndESzV5TmdROXBk?=
 =?utf-8?B?U1ZXbm9FbU1PZFRCSWdmL1lVOVplNzh1clZLaCtkTytuWDNaclhGdG5lMWs2?=
 =?utf-8?B?TnA3OTBrcVovZzRGV05nYU1qNW90Nk81aGxvbXNUdllWcUFlY0UySFRQazZI?=
 =?utf-8?B?bmFDYVR5R1JadEZzazVOVDgrN1BzMlJpd012eC9TcEM5STB1QVlnTHptVXZM?=
 =?utf-8?B?dm1FWVcxbkR1N2xSTEx3bTFjTFpSb3BIb2NnL0lYckVvS3hjdlBZc1U5eno4?=
 =?utf-8?B?WVRuUFY4WWpEOGYyOWNuMjhkZXhWUmI0VHBKdU95ZTFGbUt2UVlvNXg2am5F?=
 =?utf-8?B?NmVEb0NOZHVPR2JWcU1jbXhaNlBkT2JIMkpuUWlhbUtlbnZYQndFckJJZlgv?=
 =?utf-8?B?c05iRHRkd29FcSttaXRlRjU4WVgrbnUrRDhwczRhNzQ2RkNaZ3FldHBQRzIv?=
 =?utf-8?B?R2tldm5SSmVZSXRqak5nNEtBMDFHRnhZSDIzaUQ3Z0pxZFp2bHgxbXhLL0l4?=
 =?utf-8?B?TklBNDhwTXM4U2hWU3p0TlhuTWxLcDRoVyttRWZxTG1EUlVSNVk1cGdLc0Vu?=
 =?utf-8?B?WHdDK3R2SFJUNndxOGxuMlVOVDBaaVQwWnhEZG0wWUFCTXREdTFYK2ZEbDdW?=
 =?utf-8?B?WHJGcWpiT05IZmJ1czJaRDRNUGxIckRyMTJKZTIzQUVneEQxRGcvcFd1cVNy?=
 =?utf-8?B?K3BOSlRoalFjMC9XWUNZOE1TS2lobU9Td2xUN25jWnB6UTZETGs3b0JkLzgx?=
 =?utf-8?B?VktsK2Z3elJJYjdzUERCc0VaNmNLenZmdDgzOVcwZkowMTdUR1dNU3g3MDgz?=
 =?utf-8?B?a2JZWEVLbmFnUFZaSjZJVW15UGdLTjVhQzdRWWpITnBOekVrVTRoWUJjeXYw?=
 =?utf-8?B?c2I2NklLeEZnSS83QWp0d0ZmZTR1eUtaRFNzK2pwZllKZGZyWDZJVGQyTm9M?=
 =?utf-8?B?Qy83NDg5eWcxdTFUWlA0dnRacWYyUFZiQ1RZVWJGSkFJUy9JYldRMGtPa1h0?=
 =?utf-8?B?R3Z2bElEQ3lPQ0xMRld5ODBxYU1nR1l6WCtnV2V1dlpTQUlKNVlpVExaRXBu?=
 =?utf-8?B?Z2pLZ2kxVy93dHhzbXpwSzRaeWFUV2ZPcVZ5V2ZLRmVpRHc1RGtwRXpOdUll?=
 =?utf-8?B?ZGYzKzFkend5aTFTeWU4TWIvS0t3b0VxVDdoaWs4TzVPQXB0ckYvbEp3UEhx?=
 =?utf-8?B?SlV1QUVHUHZieWxEajNDZm1uRmU5eC8rc0k5NFhhTjFNVGFVZ09vWUNwemZt?=
 =?utf-8?B?SGFqNWRudzRTN0NMZHE4aW04NWo1dWxiWXR2b1dIM291TWQ1RURCYkhwQWxH?=
 =?utf-8?B?Q3JjaHNCclVmbkI2S3pwQ09YNVowL3FsTE5icG5rZDJVWmh3L2Yxc2pOcUtU?=
 =?utf-8?B?S3NTU3cydUgwWTBWcG1SZUZEZEppSFc1dVBJVzN1c2J0ZTRIcUhqUnhkSFdN?=
 =?utf-8?B?eGMvWUtxOGpCbmUwM2tDdHllMW5Rdk9DRDIyUlAvb3VtUG9URVpGQ2RSZHVX?=
 =?utf-8?B?d1ZhdHdNU1RkR2xaY1ZreXprUU96VGNua0ZTRTQvMFNqTVdXWlgyQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17790e15-81b1-4f89-83f9-08da22cd3f5a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 12:56:55.6945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VyPa1pCbN25RQEZdBkg5RCWfRQnDo6BwDd78xxjnzXomIbCst9tANo3gOHhK9A4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2929
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

--------------DP6p6IdRVCG3WK4PnPqrm2Xp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin):
>
> [AMD Official Use Only]
>
>
> Hi Chris,
>
> 1) Change the test case to use something larger than 1TiB.
> sure, we can increase the size of BO and make test pass,
> but if user really want to allocate 1TB GTT BO, we have no reason to 
> let it fail? right?

No, the reason is the underlying core kernel doesn't allow kvmalloc 
allocations with GFP_ZERO which are large enough to hold the array of 
allocated pages for this.

We are working on top of the core Linux kernel and should *NEVER* ever 
add workarounds like what was suggested here.

Regards,
Christian.

> the system availed memory about 2T, but it will still fail.
>
> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc 
> fallback path.
>     the 5.18 kernel will add this patch to fix this issue .
>
> Best Regards,
> Kevin
> ------------------------------------------------------------------------
> *From:* Koenig, Christian <Christian.Koenig@amd.com>
> *Sent:* Wednesday, April 20, 2022 8:42 PM
> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Christian König 
> <ckoenig.leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>
> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds 
> kmalloc limit
> Hi Kevin,
>
> yes and that is perfectly valid and expected behavior. There is 
> absolutely no need to change anything in TTM here.
>
> What we could do is:
> 1) Change the test case to use something larger than 1TiB.
> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc 
> fallback path.
>
> Regards,
> Christian.
>
> Am 20.04.22 um 14:39 schrieb Wang, Yang(Kevin):
>>
>> [AMD Official Use Only]
>>
>>
>> Hi Chirs,
>>
>> yes, right, the amdgpu drive rwill use amdgpu_bo_validate_size() 
>> function to verify bo size,
>> but when driver try to allocate VRAM domain bo fail, the amdgpu 
>> driver will fall back to allocate domain = (GTT | VRAM)  bo.
>> please check following code, it will cause the 2nd time to allocate 
>> bo fail during allocate 256Mb buffer to store dma address (via 
>> kvmalloc()).
>>
>> initial_domain = (u32)(0xffffffff & args->in.domains);
>> retry:
>>         r = amdgpu_gem_object_create(adev, size, args->in.alignment,
>>                    initial_domain,
>>                    flags, ttm_bo_type_device, resv, &gobj);
>>         if (r && r != -ERESTARTSYS) {
>>                 if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>>       flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>>       goto retry;
>>                 }
>>
>>                 if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
>>       initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
>>       goto retry;
>>                 }
>> DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
>>               size, initial_domain, args->in.alignment, r);
>>         }
>>
>> Best Regards,
>> Kevin
>>
>> ------------------------------------------------------------------------
>> *From:* Christian König <ckoenig.leichtzumerken@gmail.com> 
>> <mailto:ckoenig.leichtzumerken@gmail.com>
>> *Sent:* Wednesday, April 20, 2022 7:55 PM
>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>> <mailto:KevinYang.Wang@amd.com>; Koenig, Christian 
>> <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com>; 
>> dri-devel@lists.freedesktop.org 
>> <mailto:dri-devel@lists.freedesktop.org> 
>> <dri-devel@lists.freedesktop.org> 
>> <mailto:dri-devel@lists.freedesktop.org>; 
>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org> 
>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>> exceeds kmalloc limit
>> Hi Kevin,
>>
>> no, the test case should already fail in amdgpu_bo_validate_size().
>>
>> If we have a system with 2TiB of memory where the test case could 
>> succeed then we should increase the requested size to something larger.
>>
>> And if the underlying core Linux kernel functions don't allow 
>> allocations as large as the requested one we should *NEVER* ever add 
>> workarounds like this.
>>
>> It is perfectly expected that this test case is not able to fulfill 
>> the desired allocation. That it fails during kvmalloc is unfortunate, 
>> but not a show stopper.
>>
>> Regards,
>> Christian.
>>
>>
>> Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):
>>>
>>> [AMD Official Use Only]
>>>
>>>
>>> Hi Chris,
>>>
>>> you misunderstood background about this case.
>>>
>>> although we expect this test case to fail, it should fail at the 
>>> location where the Bo actual memory is actually allocated. now the 
>>> code logic will cause the failure to allocate memory to store DMA 
>>> address.
>>>
>>> e.g: the case is failed in 2TB system ram machine, it should be 
>>> allocated successful, but it is failed.
>>>
>>> allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to store 
>>> allocate result (page address), this should not be failed usually.
>>>
>>> There is a similar fix in upstream kernel 5.18, before this fix 
>>> entered the TTM code, this problem existed in TTM.
>>>
>>> kernel/git/torvalds/linux.git - Linux kernel source tree 
>>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fh%3Dv5.18-rc3%26id%3Da421ef303008b0ceee2cfc625c3246fa7654b0ca&data=05%7C01%7CKevinYang.Wang%40amd.com%7C2e9fd86a27d64a39432508da22c4b1f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637860525454702938%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=CiP9x3grwQ2aXFZPjpsAtwLCpBVeJufbGngy%2BtXLFbM%3D&reserved=0>
>>> mm: allow !GFP_KERNEL allocations for kvmalloc
>>>
>>> Best Regards,
>>> Kevin
>>>
>>> ------------------------------------------------------------------------
>>> *From:* Koenig, Christian <Christian.Koenig@amd.com> 
>>> <mailto:Christian.Koenig@amd.com>
>>> *Sent:* Wednesday, April 20, 2022 6:53 PM
>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org 
>>> <mailto:dri-devel@lists.freedesktop.org> 
>>> <dri-devel@lists.freedesktop.org> 
>>> <mailto:dri-devel@lists.freedesktop.org>; 
>>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org> 
>>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>> exceeds kmalloc limit
>>> Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):
>>>>
>>>> [AMD Official Use Only]
>>>>
>>>>
>>>>
>>>> ------------------------------------------------------------------------
>>>> *From:* Koenig, Christian <Christian.Koenig@amd.com> 
>>>> <mailto:Christian.Koenig@amd.com>
>>>> *Sent:* Wednesday, April 20, 2022 5:00 PM
>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>>>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org 
>>>> <mailto:dri-devel@lists.freedesktop.org> 
>>>> <dri-devel@lists.freedesktop.org> 
>>>> <mailto:dri-devel@lists.freedesktop.org>; 
>>>> amd-gfx@lists.freedesktop.org 
>>>> <mailto:amd-gfx@lists.freedesktop.org> 
>>>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>>> exceeds kmalloc limit
>>>> Am 20.04.22 um 10:56 schrieb Yang Wang:
>>>> > if the __GFP_ZERO is set, the kvmalloc() can't fallback to use 
>>>> vmalloc()
>>>>
>>>> Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
>>>> when __GFP_ZERO is set?
>>>>
>>>> And even that is really the case then that sounds like a bug in 
>>>> kvmalloc().
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> [kevin]:
>>>> it is really test case from libdrm amdgpu test, which try to 
>>>> allocate a big BO which will cause ttm tt init fail.
>>>
>>>
>>> LOL! Guys, this test case is intended to fail!
>>> *
>>> *The test consists of allocating a buffer so ridiculous large that 
>>> it should never succeed and be rejected by the kernel driver.
>>>
>>> This patch here is a really clear NAK.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> it may be a kvmalloc() bug, and this patch can as a workaround 
>>>> in ttm before this issue fix.
>>>>
>>>> void *kvmalloc_node(size_t size, gfp_t flags, int node)
>>>> {
>>>> ...
>>>>       if ((flags & GFP_KERNEL) != GFP_KERNEL)
>>>>               return kmalloc_node(size, flags, node);
>>>> ...
>>>> }
>>>>
>>>> Best Regards,
>>>> Kevin
>>>>
>>>> > to allocate memory, when request size is exceeds kmalloc limit, 
>>>> it will
>>>> > cause allocate memory fail.
>>>> >
>>>> > e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>>>> >
>>>> > Signed-off-by: Yang Wang <KevinYang.Wang@amd.com> 
>>>> <mailto:KevinYang.Wang@amd.com>
>>>> > ---
>>>> >   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>>>> >   1 file changed, 11 insertions(+), 3 deletions(-)
>>>> >
>>>> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c 
>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>> > index 79c870a3bef8..9f2f3e576b8d 100644
>>>> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>> > @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object 
>>>> *bo, bool zero_alloc)
>>>> >   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>> >   {
>>>> >        ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
>>>> > -                     GFP_KERNEL | __GFP_ZERO);
>>>> > + GFP_KERNEL);
>>>> >        if (!ttm->pages)
>>>> >                return -ENOMEM;
>>>> > +
>>>> > +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
>>>> > +
>>>> >        return 0;
>>>> >   }
>>>> >
>>>> > @@ -108,10 +111,12 @@ static int 
>>>> ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>> >        ttm->pages = kvmalloc_array(ttm->num_pages,
>>>> >                                    sizeof(*ttm->pages) +
>>>> >                                    sizeof(*ttm->dma_address),
>>>> > - GFP_KERNEL | __GFP_ZERO);
>>>> > + GFP_KERNEL);
>>>> >        if (!ttm->pages)
>>>> >                return -ENOMEM;
>>>> >
>>>> > +     memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) 
>>>> + sizeof(*ttm->dma_address)));
>>>> > +
>>>> >        ttm->dma_address = (void *)(ttm->pages + ttm->num_pages);
>>>> >        return 0;
>>>> >   }
>>>> > @@ -120,9 +125,12 @@ static int 
>>>> ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>> >   {
>>>> >        ttm->dma_address = kvmalloc_array(ttm->num_pages,
>>>> >                                         sizeof(*ttm->dma_address),
>>>> > - GFP_KERNEL | __GFP_ZERO);
>>>> > + GFP_KERNEL);
>>>> >        if (!ttm->dma_address)
>>>> >                return -ENOMEM;
>>>> > +
>>>> > +     memset(ttm->dma_address, 0, ttm->num_pages * 
>>>> sizeof(*ttm->dma_address));
>>>> > +
>>>> >        return 0;
>>>> >   }
>>>> >
>>>>
>>>
>>
>

--------------DP6p6IdRVCG3WK4PnPqrm2Xp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin):<br>
    <blockquote type="cite" cite="mid:CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI
            Web (West European)&quot;, &quot;Segoe UI&quot;,
            -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica
            Neue&quot;, sans-serif; font-size: 10.5pt; background-color:
            rgb(255, 255, 255); display: inline !important; color:
            rgb(0, 0, 0);" class="elementToProof">Hi Chris,</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI
            Web (West European)&quot;, &quot;Segoe UI&quot;,
            -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica
            Neue&quot;, sans-serif; font-size: 10.5pt; background-color:
            rgb(255, 255, 255); display: inline !important; color:
            rgb(0, 0, 0);"><br>
          </span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI
            Web (West European)&quot;, &quot;Segoe UI&quot;,
            -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica
            Neue&quot;, sans-serif; font-size: 10.5pt; background-color:
            rgb(255, 255, 255); display: inline !important; color:
            rgb(0, 0, 0);">1) Change the test case to use something
            larger than 1TiB.</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI
            Web (West European)&quot;, &quot;Segoe UI&quot;,
            -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica
            Neue&quot;, sans-serif; font-size: 10.5pt; color: rgb(0, 0,
            0); background-color: rgb(255, 255, 255);">sure, we can
            increase the size of BO and make test pass,</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI
            Web (West European)&quot;, &quot;Segoe UI&quot;,
            -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica
            Neue&quot;, sans-serif; font-size: 10.5pt; color: rgb(0, 0,
            0); background-color: rgb(255, 255, 255);">but if user
            really want to allocate 1TB GTT BO, we have no reason to let
            it fail? right? <br>
          </span></div>
      </div>
    </blockquote>
    <br>
    No, the reason is the underlying core kernel doesn't allow kvmalloc
    allocations with GFP_ZERO which are large enough to hold the array
    of allocated pages for this.<br>
    <br>
    We are working on top of the core Linux kernel and should *NEVER*
    ever add workarounds like what was suggested here.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com">
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI
            Web (West European)&quot;, &quot;Segoe UI&quot;,
            -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica
            Neue&quot;, sans-serif; font-size: 10.5pt; color: rgb(0, 0,
            0); background-color: rgb(255, 255, 255);">the system
            availed memory about 2T, but it will still fail.</span></div>
        <div style="color: rgb(0, 0, 0);" class="elementToProof"><font face="Calibri, Arial, Helvetica, sans-serif"><br style="background-color: rgb(255, 255, 255);">
          </font></div>
        <div style="color: rgb(0, 0, 0);" class="elementToProof"><span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web
            (West European)&quot;, &quot;Segoe UI&quot;, -apple-system,
            BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,
            sans-serif; font-size: 14px; background-color: rgb(255, 255,
            255); display: inline !important;">2) Change kvmalloc to
            allow GFP_ZERO allocations even in the vmalloc fallback
            path.</span></div>
        <div style="color: rgb(0, 0, 0);" class="elementToProof"><span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web
            (West European)&quot;, &quot;Segoe UI&quot;, -apple-system,
            BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,
            sans-serif; font-size: 14px; background-color: rgb(255, 255,
            255); display: inline !important;">&nbsp; &nbsp; the 5.18 kernel will
            add this patch to fix this issue .</span></div>
        <div style="color: rgb(0, 0, 0);" class="elementToProof"><span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web
            (West European)&quot;, &quot;Segoe UI&quot;, -apple-system,
            BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,
            sans-serif; font-size: 14px; background-color: rgb(255, 255,
            255); display: inline !important;"><br>
          </span></div>
        <div style="color: rgb(0, 0, 0);" class="elementToProof"><span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web
            (West European)&quot;, &quot;Segoe UI&quot;, -apple-system,
            BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,
            sans-serif; font-size: 14px; background-color: rgb(255, 255,
            255); display: inline !important;">Best Regards,</span></div>
        <div style="color: rgb(0, 0, 0);" class="elementToProof"><span style="font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web
            (West European)&quot;, &quot;Segoe UI&quot;, -apple-system,
            BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,
            sans-serif; font-size: 14px; background-color: rgb(255, 255,
            255); display: inline !important;">Kevin</span></div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
            <b>Sent:</b> Wednesday, April 20, 2022 8:42 PM<br>
            <b>To:</b> Wang, Yang(Kevin) <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a>;
            Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
            <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail
            when size exceeds kmalloc limit</font>
          <div>&nbsp;</div>
        </div>
        <div class="elementToProof">Hi Kevin,<br>
          <br>
          yes and that is perfectly valid and expected behavior. There
          is absolutely no need to change anything in TTM here.<br>
          <br>
          What we could do is:<br>
          1) Change the test case to use something larger than 1TiB.<br>
          2) Change kvmalloc to allow GFP_ZERO allocations even in the
          vmalloc fallback path.<br>
          <br>
          Regards,<br>
          Christian.<br>
          <br>
          <div class="x_moz-cite-prefix">Am 20.04.22 um 14:39 schrieb
            Wang, Yang(Kevin):<br>
          </div>
          <blockquote type="cite">
            <p style="margin-top: 0px; margin-bottom:
              0px;font-family:Arial; font-size:10pt; color:#0000FF;
              margin:5pt" align="Left">
              [AMD Official Use Only]<br>
            </p>
            <br>
            <div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)">Hi Chirs,</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <br>
              </div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)">yes, right, the amdgpu
                  drive rwill use&nbsp;</span><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; background-color:rgba(0,0,0,0);
                  color:rgb(0,0,0); display:inline!important">amdgpu_bo_validate_size()
                  function to verify bo size,</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; background-color:rgba(0,0,0,0);
                  display:inline!important; color:rgb(0,0,0)">but when
                  driver try to allocate VRAM domain bo fail, the amdgpu
                  driver will fall back to allocate domain = (GTT |
                  VRAM)&nbsp; bo.</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                color:rgb(0,0,0)">
                <span style="font-size:12pt;
                  font-family:Calibri,Arial,Helvetica,sans-serif;
                  background-color:rgba(0,0,0,0);
                  display:inline!important; color:rgb(0,0,0)">please
                  check following code, it will cause the 2</span><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  background-color:rgba(0,0,0,0); color:rgb(0,0,0);
                  display:inline!important"><span style="font-size:13.3333px">nd time</span><span style="font-size:12pt">&nbsp;to allocate bo fail during
                    allocate 256Mb buffer to store dma address (via
                    kvmalloc()).</span></span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style=""><br>
                </span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; background-color:rgba(0,0,0,0);
                  display:inline!important; color:rgb(0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp;
                  initial_domain = (u32)(0xffffffff &amp;
                  args-&gt;in.domains);</span><span style="">
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">retry:</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; r =
                      amdgpu_gem_object_create(adev, size,
                      args-&gt;in.alignment,</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;initial_domain,</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;flags, ttm_bo_type_device,
                      resv, &amp;gobj);</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; if (r
                      &amp;&amp; r != -ERESTARTSYS) {</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if
                      (flags &amp;
                      AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; flags &amp;=
                      ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; goto retry;</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></div>
                  <div><br>
                  </div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if
                      (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; initial_domain |= AMDGPU_GEM_DOMAIN_GTT;</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; goto retry;</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      DRM_DEBUG(&quot;Failed to allocate GEM object (%llu,
                      %d, %llu, %d)\n&quot;,</span></div>
                  <div><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0);
                      background-color:rgba(0,0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size, initial_domain,
                      args-&gt;in.alignment, r);</span></div>
                </span><span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; background-color:rgba(0,0,0,0);
                  display:inline!important; color:rgb(0,0,0)">&nbsp; &nbsp; &nbsp; &nbsp; }</span><span style=""><br>
                </span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <br>
              </div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)">Best Regards,</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)">Kevin</span></div>
              <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <br>
              </div>
              <hr tabindex="-1" style="display:inline-block; width:98%">
              <div id="x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b> Christian König
                  <a href="mailto:ckoenig.leichtzumerken@gmail.com" data-auth="NotApplicable" class="x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                    &lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
                  <b>Sent:</b> Wednesday, April 20, 2022 7:55 PM<br>
                  <b>To:</b> Wang, Yang(Kevin) <a href="mailto:KevinYang.Wang@amd.com" data-auth="NotApplicable" class="x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                    &lt;KevinYang.Wang@amd.com&gt;</a>; Koenig,
                  Christian <a href="mailto:Christian.Koenig@amd.com" data-auth="NotApplicable" class="x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                    &lt;Christian.Koenig@amd.com&gt;</a>; <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_moz-txt-link-abbreviated
                    moz-txt-link-freetext" moz-do-not-send="true">
                    dri-devel@lists.freedesktop.org</a> <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                    &lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_moz-txt-link-abbreviated
                    moz-txt-link-freetext" moz-do-not-send="true">
                    amd-gfx@lists.freedesktop.org</a> <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                    &lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init
                  fail when size exceeds kmalloc limit</font>
                <div>&nbsp;</div>
              </div>
              <div class="x_elementToProof">Hi Kevin,<br>
                <br>
                no, the test case should already fail in
                amdgpu_bo_validate_size().<br>
                <br>
                If we have a system with 2TiB of memory where the test
                case could succeed then we should increase the requested
                size to something larger.<br>
                <br>
                And if the underlying core Linux kernel functions don't
                allow allocations as large as the requested one we
                should *NEVER* ever add workarounds like this.<br>
                <br>
                It is perfectly expected that this test case is not able
                to fulfill the desired allocation. That it fails during
                kvmalloc is unfortunate, but not a show stopper.<br>
                <br>
                Regards,<br>
                Christian.<br>
                <br>
                <br>
                <div class="x_x_moz-cite-prefix">Am 20.04.22 um 13:32
                  schrieb Wang, Yang(Kevin):<br>
                </div>
                <blockquote type="cite">
                  <p style="margin-top: 0px; margin-bottom:
                    0px;margin-top:0px; margin-bottom:0px;
                    font-family:Arial; font-size:10pt; color:#0000FF;
                    margin:5pt" align="Left">
                    [AMD Official Use Only]<br>
                  </p>
                  <br>
                  <div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; color:rgb(0,0,0);
                        background-color:rgba(0,0,0,0)">Hi Chris,</span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <br>
                    </div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; color:rgb(0,0,0);
                        background-color:rgba(0,0,0,0)">you
                        misunderstood background about this case.</span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; color:rgb(0,0,0);
                        background-color:rgba(0,0,0,0)"><br>
                      </span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; color:rgb(0,0,0);
                        background-color:rgba(0,0,0,0)">a</span><span style="color:rgb(0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; background-color:rgba(0,0,0,0)">lthough
                        we expect this test case to fail, it should fail
                        at the location where the Bo actual memory is
                        actually allocated. now the code logic will
                        cause the failure to allocate memory to store
                        DMA address.</span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="color:rgb(0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; background-color:rgba(0,0,0,0)"><br>
                      </span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="color:rgb(0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; background-color:rgba(0,0,0,0)"><span style="background-color:rgb(255,255,255);
                          display:inline!important">e.g:&nbsp;</span>the case
                        is failed in 2TB system ram machine, it should
                        be allocated successful, but it is failed.</span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="color:rgb(0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt"><br>
                      </span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="color:rgb(0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; background-color:rgba(0,0,0,0)">allocate
                        1TB BO, the ttm should allocate 1TB/4k * 8
                        buffer to store allocate result (page address),
                        this should not be failed usually.</span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="color:rgb(0,0,0); font-size:12pt;
                        background-color:rgba(0,0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif"><br>
                      </span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="color:rgb(0,0,0); font-size:12pt;
                        background-color:rgba(0,0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif">There
                        is a similar fix in upstream kernel 5.18, b</span><span style="color:rgb(0,0,0); font-size:12pt;
                        background-color:rgba(0,0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif">efore
                        this fix entered the TTM code, this problem
                        existed in TTM.</span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="color:rgb(0,0,0); font-size:12pt;
                        background-color:rgba(0,0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif"><br>
                      </span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="color:rgb(0,0,0); font-size:12pt;
                        background-color:rgba(0,0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif"><a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fh%3Dv5.18-rc3%26id%3Da421ef303008b0ceee2cfc625c3246fa7654b0ca&amp;data=05%7C01%7CKevinYang.Wang%40amd.com%7C2e9fd86a27d64a39432508da22c4b1f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637860525454702938%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=CiP9x3grwQ2aXFZPjpsAtwLCpBVeJufbGngy%2BtXLFbM%3D&amp;reserved=0" data-auth="Verified" originalsrc="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.18-rc3&amp;id=a421ef303008b0ceee2cfc625c3246fa7654b0ca" shash="KMFRekIa5um9dneRj4pqsGBn2wIcYBwLUel6we5AalD06U/g9WcKPxBwS4F9Mgfpnqpq0GbN+8AA16pzy6v+Ay23e5shnO53IP8e7UcwQUE0fw1Wd4T+gBBF8PJiMugXDZiWlVYrV3tySgoFbmz+CuFzrYJbobUVj6E5khawPfo=" id="LPlnk660272" moz-do-no
 t-send="true">kernel/git/torvalds/linux.git
                          - Linux kernel source tree</a><br>
                      </span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span class="x_x_commit-subject" style="font-size:12pt; margin:1.5em 0em 0.5em;
                        padding:0em; color:rgb(0,0,0);
                        font-family:Calibri,Arial,Helvetica,sans-serif;
                        background-color:rgb(255,255,255)">mm: allow
                        !GFP_KERNEL allocations for kvmalloc</span><br>
                    </div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <div><br>
                      </div>
                      <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; color:rgb(0,0,0);
                        background-color:rgba(0,0,0,0)">Best Regards,</span></div>
                    <div class="x_x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                        font-size:12pt; color:rgb(0,0,0);
                        background-color:rgba(0,0,0,0)">Kevin</span><br>
                      <div><br>
                      </div>
                    </div>
                    <hr tabindex="-1" style="display:inline-block;
                      width:98%">
                    <div id="x_x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri,
                        sans-serif" color="#000000"><b>From:</b> Koenig,
                        Christian
                        <a href="mailto:Christian.Koenig@amd.com" data-auth="NotApplicable" class="x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                          &lt;Christian.Koenig@amd.com&gt;</a><br>
                        <b>Sent:</b> Wednesday, April 20, 2022 6:53 PM<br>
                        <b>To:</b> Wang, Yang(Kevin) <a href="mailto:KevinYang.Wang@amd.com" data-auth="NotApplicable" class="x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                          &lt;KevinYang.Wang@amd.com&gt;</a>; <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_moz-txt-link-abbreviated
                          x_moz-txt-link-freetext moz-txt-link-freetext" moz-do-not-send="true">
                          dri-devel@lists.freedesktop.org</a> <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                          &lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_moz-txt-link-abbreviated
                          x_moz-txt-link-freetext moz-txt-link-freetext" moz-do-not-send="true">
                          amd-gfx@lists.freedesktop.org</a> <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                          &lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
                        <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt
                        init fail when size exceeds kmalloc limit</font>
                      <div>&nbsp;</div>
                    </div>
                    <div>Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):<br>
                      <blockquote type="cite">
                        <p style="margin-top: 0px; margin-bottom:
                          0px;margin-top:0px; margin-bottom:0px;
                          margin-top:0px; margin-bottom:0px;
                          font-family:Arial; font-size:10pt;
                          color:#0000FF; margin:5pt" align="Left">
                          [AMD Official Use Only]<br>
                        </p>
                        <br>
                        <div>
                          <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
                            font-size:12pt; color:rgb(0,0,0)">
                            <br>
                          </div>
                          <hr tabindex="-1" style="display:inline-block;
                            width:98%">
                          <div id="x_x_x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri,
                              sans-serif" color="#000000"><b>From:</b>
                              Koenig, Christian
                              <a href="mailto:Christian.Koenig@amd.com" data-auth="NotApplicable" class="x_x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                                &lt;Christian.Koenig@amd.com&gt;</a><br>
                              <b>Sent:</b> Wednesday, April 20, 2022
                              5:00 PM<br>
                              <b>To:</b> Wang, Yang(Kevin) <a href="mailto:KevinYang.Wang@amd.com" data-auth="NotApplicable" class="x_x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                                &lt;KevinYang.Wang@amd.com&gt;</a>; <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_x_moz-txt-link-abbreviated
                                x_x_moz-txt-link-freetext
                                x_moz-txt-link-freetext
                                moz-txt-link-freetext" moz-do-not-send="true">
                                dri-devel@lists.freedesktop.org</a> <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                                &lt;dri-devel@lists.freedesktop.org&gt;</a>;
                              <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_x_moz-txt-link-abbreviated
                                x_x_moz-txt-link-freetext
                                x_moz-txt-link-freetext
                                moz-txt-link-freetext" moz-do-not-send="true">
                                amd-gfx@lists.freedesktop.org</a> <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                                &lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
                              <b>Subject:</b> Re: [PATCH] drm/ttm: fix
                              ttm tt init fail when size exceeds kmalloc
                              limit</font>
                            <div>&nbsp;</div>
                          </div>
                          <div class="x_x_x_BodyFragment"><font size="2"><span style="font-size:11pt">
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof">Am 20.04.22 um
                                  10:56 schrieb Yang Wang:<br>
                                  &gt; if the __GFP_ZERO is set, the
                                  kvmalloc() can't fallback to use
                                  vmalloc()<br>
                                  <br>
                                  Hui what? Why should kvmalloc() not be
                                  able to fallback to vmalloc() <br>
                                  when __GFP_ZERO is set?<br>
                                  <br>
                                  And even that is really the case then
                                  that sounds like a bug in kvmalloc().</div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><br>
                                  Regards,<br>
                                  Christian.</div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><br>
                                  <div class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">
                                    [kevin]:</div>
                                </div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">it
                                    is really test case from libdrm
                                    amdgpu test, which try to allocate a
                                    big BO which will cause ttm tt init
                                    fail.</span><br>
                                </div>
                              </span></font></div>
                        </div>
                      </blockquote>
                      <br>
                      <br>
                      LOL! Guys, this test case is intended to fail!<br>
                      <b><br>
                      </b>The test consists of allocating a buffer so
                      ridiculous large that it should never succeed and
                      be rejected by the kernel driver.<br>
                      <br>
                      This patch here is a really clear NAK.<br>
                      <br>
                      Regards,<br>
                      Christian.<br>
                      <br>
                      <blockquote type="cite">
                        <div>
                          <div class="x_x_x_BodyFragment"><font size="2"><span style="font-size:11pt">
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">it
                                    may be a kvmalloc() bug, and this
                                    patch can as a workaround in<span style="background-color:rgb(255,255,255);
                                      display:inline!important">&nbsp;ttm</span>&nbsp;before
                                    this issue fix.</span></div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)"><br>
                                  </span></div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">void
                                    *kvmalloc_node(size_t size, gfp_t
                                    flags, int node)&nbsp;<br>
                                  </span></div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">{</span></div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">...</span></div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">&nbsp;
                                    &nbsp; &nbsp; &nbsp; if ((flags &amp; GFP_KERNEL)
                                    != GFP_KERNEL)<br>
                                  </span></div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">&nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return
                                    kmalloc_node(size, flags, node);<br>
                                  </span></div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">...</span></div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><span class="x_x_x_PlainText" style="margin:0px;
                                    background-color:rgb(255,255,255)">}</span></div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof"><br>
                                </div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof">Best Regards,</div>
                                <div class="x_x_x_PlainText
                                  x_x_x_elementToProof">Kevin<br>
                                  <br>
                                  &gt; to allocate memory, when request
                                  size is exceeds kmalloc limit, it will<br>
                                  &gt; cause allocate memory fail.<br>
                                  &gt;<br>
                                  &gt; e.g: when ttm want to create a BO
                                  with 1TB size, it maybe fail.<br>
                                  &gt;<br>
                                  &gt; Signed-off-by: Yang Wang <a href="mailto:KevinYang.Wang@amd.com" data-auth="NotApplicable" class="x_x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                                    &lt;KevinYang.Wang@amd.com&gt;</a><br>
                                  &gt; ---<br>
                                  &gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_tt.c |
                                  14 +++++++++++---<br>
                                  &gt;&nbsp;&nbsp; 1 file changed, 11
                                  insertions(+), 3 deletions(-)<br>
                                  &gt;<br>
                                  &gt; diff --git
                                  a/drivers/gpu/drm/ttm/ttm_tt.c
                                  b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                                  &gt; index 79c870a3bef8..9f2f3e576b8d
                                  100644<br>
                                  &gt; ---
                                  a/drivers/gpu/drm/ttm/ttm_tt.c<br>
                                  &gt; +++
                                  b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                                  &gt; @@ -97,9 +97,12 @@ int
                                  ttm_tt_create(struct ttm_buffer_object
                                  *bo, bool zero_alloc)<br>
                                  &gt;&nbsp;&nbsp; static int
                                  ttm_tt_alloc_page_directory(struct
                                  ttm_tt *ttm)<br>
                                  &gt;&nbsp;&nbsp; {<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =
                                  kvmalloc_array(ttm-&gt;num_pages,
                                  sizeof(void*),<br>
                                  &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL
                                  | __GFP_ZERO);<br>
                                  &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  GFP_KERNEL);<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                                  &gt; +<br>
                                  &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0,
                                  ttm-&gt;num_pages * sizeof(void *));<br>
                                  &gt; +<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                                  &gt;&nbsp;&nbsp; }<br>
                                  &gt;&nbsp;&nbsp; <br>
                                  &gt; @@ -108,10 +111,12 @@ static int
                                  ttm_dma_tt_alloc_page_directory(struct
                                  ttm_tt *ttm)<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =
                                  kvmalloc_array(ttm-&gt;num_pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*ttm-&gt;pages) +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*ttm-&gt;dma_address),<br>
                                  &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  GFP_KERNEL | __GFP_ZERO);<br>
                                  &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  GFP_KERNEL);<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                                  &gt;&nbsp;&nbsp; <br>
                                  &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0,
                                  ttm-&gt;num_pages *
                                  (sizeof(*ttm-&gt;pages) +
                                  sizeof(*ttm-&gt;dma_address)));<br>
                                  &gt; +<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =
                                  (void *)(ttm-&gt;pages +
                                  ttm-&gt;num_pages);<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                                  &gt;&nbsp;&nbsp; }<br>
                                  &gt; @@ -120,9 +125,12 @@ static int
                                  ttm_sg_tt_alloc_page_directory(struct
                                  ttm_tt *ttm)<br>
                                  &gt;&nbsp;&nbsp; {<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =
                                  kvmalloc_array(ttm-&gt;num_pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  sizeof(*ttm-&gt;dma_address),<br>
                                  &gt;
                                  -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  GFP_KERNEL | __GFP_ZERO);<br>
                                  &gt;
                                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  GFP_KERNEL);<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;dma_address)<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                                  &gt; +<br>
                                  &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;dma_address,
                                  0, ttm-&gt;num_pages *
                                  sizeof(*ttm-&gt;dma_address));<br>
                                  &gt; +<br>
                                  &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                                  &gt;&nbsp;&nbsp; }<br>
                                  &gt;&nbsp;&nbsp; <br>
                                  <br>
                                </div>
                              </span></font></div>
                        </div>
                      </blockquote>
                      <br>
                    </div>
                  </div>
                </blockquote>
                <br>
              </div>
            </div>
          </blockquote>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------DP6p6IdRVCG3WK4PnPqrm2Xp--
