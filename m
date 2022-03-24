Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A294E6100
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 10:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DFD10E867;
	Thu, 24 Mar 2022 09:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B80110E867;
 Thu, 24 Mar 2022 09:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKU7Y7mJ7NCLY5q68S6nLT+s0ox6MwoO46JCCmuvpJTjcL6M5ORKZiep4msfVbydm6X0J2rwYfvEf9xE1w5ZchJW/1yGUSNDVJRdpVHA2CmL5z3i13qTCCUcmH4nDRe9Ti3YAmF0bgbZjz1ZYNDrQ0bDnwCWkLRtN195Ys2v3NSgL4PD1tVW+w5wEQbE1ZdHlsE/NPaZt6c0HAy/mcSTqlQlwLs5473xtVb94DQMUgRNKcohNGoA+M49wc7hQucPwlocF35VSBS30P0nV2H8XpWONYqk37NDiBf/ts+5ISQwaBmxlznTYPpaqgg5tFejJZUThXA6xZHELHKwGcyf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xAW6eI2Ucxerf3rR+N7P+/7xcW3ykr6whkoTfeeFOM=;
 b=DA3VXK2OtdjSq8i+ZSU4jx4dSQH8NbbVavXVS1JKPXYfmiLN4HtvQNrW/diTMBi6csbBEKw4dnUmjRcPZRYftb8AgBqZgs077li2wZZsVqIQfzBvA8h6V8uUkq1rxw02tEmOA1wIgBberTNJyc+Cs2z+6akDfXRwQkSUeD79KhfnLXGt4h53Jb7BnXVMeelWuVWt8aFHR/zcIAe0he3t695MXfvQqiEnonNV4TR3G6+THySHEPejbVqQ/fMhi0rZYok2cA8a8end2eqYxHe14668oJcNczVpGEpXK18jW6AcH7Ei67GsskPspUG2JV+i/o1iFbHMIhOwPOgOBiyuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xAW6eI2Ucxerf3rR+N7P+/7xcW3ykr6whkoTfeeFOM=;
 b=q53p9HBFp4AkA6RP0WXo9XBuw8ImaEQ/QK3INValASX9tXFiTSl5rPg3HxIKfu8FcfAYSdJ2ZaERX3tQjgbJ9TGlikLLVeDXJmjBF16x+l+G1d5jwvpXggLruDJPimXJapJcEg2GKxWiVKrV/LqXuY7f8cYMT497gHWrnbBzWQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB3381.namprd12.prod.outlook.com (2603:10b6:a03:df::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 24 Mar
 2022 09:20:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Thu, 24 Mar 2022
 09:20:47 +0000
Content-Type: multipart/alternative;
 boundary="------------KiRmHfOYemlkb60anizx2eNB"
Message-ID: <12eba824-ee80-0aac-56ed-e13084c9cae7@amd.com>
Date: Thu, 24 Mar 2022 10:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IOWbnuWkjTogUmU6IOWbnuWkjTogUmU6IFtQ?=
 =?UTF-8?Q?ATCH_v1_1/2=5d_drm/qxl=3a_replace_ioremap_by_ioremap=5fcache_on_a?=
 =?UTF-8?Q?rm64?=
Content-Language: en-US
To: liucong2@kylinos.cn, airlied@redhat.com, kraxel@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, ray.huang@amd.com,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>
References: <2n05d7wxagz-2n05d7wxah0@nsmail6.0>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2n05d7wxagz-2n05d7wxah0@nsmail6.0>
X-ClientProxiedBy: AM6PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e9eeb5c-7c18-4ec0-5354-08da0d779483
X-MS-TrafficTypeDiagnostic: BYAPR12MB3381:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3381ED14DD61474C358B992C83199@BYAPR12MB3381.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJ0swoMBPOZh+ZJ5kXJhkf4uczj68Bl/6yx52SsBriC4jUzUQpaFpey9scjA7BpozGrjhR8faBoyruYE4Kotr9XvZtNwtxfObLWEArjOAXmxKtQ64ZPHEybW41kyxShguYos2I0C80YAPV/PIUnETCb6JWKtm++H2CL1bDKGFpsMkoJyIYcPH0N0TVGCl2IyzMnGOZ/ZKk6QiLpqbbkqLiy4lXbGH2HkoksEqR5w5ZOuESNHD8XI7DjddIKACocU5ZmuPRaOL6icd0PRSReZ6+n19SQCqT3DwoieYU9YBjGV7rmYCbGiDy77jknCwM+reeA2IUcwZyk8pnezf+cX5SAImiOBbs/nqMxJhgx+Tlo1df+rriZ/PSpfB4gY1DWQ9BoCf4PG4mdj1XrloV3rj7fsyMl+vCICH1bpVYAucB+0g4dY43Bled5wl/cIJZc0dHJnHqO7B7NP0usX0Z+RT1w1Fhw3vEogrVtyf3biPT9A8EjEktKi1rNhEFehhjme+Xw7pjOshGyk7LJAn99+U2WQBAyWrS49x+qMtxScK2MvkedUaWW9CXSyRCAWjS+hFtXHCau5oMX6u822na01+Tsm9gOCZD75vI5MJnGOGtlBIxH5v32hx4Wa4VxSVCIEvtbrnihPFLafwLpXw0S7KGTb2DZdoJ/ocXoASQ8lb5BPSWQV/K4RELyHaXlfFcfpdIi+NdwqoLQ2DSXRC8oTF+6jcP1abPYOYfsWrTKSmsh9Zy4jbSAB42IrObN3ijecfEdyhAEObB7Q+k2csUEdPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(84040400005)(83380400001)(66574015)(26005)(6666004)(186003)(316002)(66476007)(6916009)(224303003)(66946007)(31686004)(31696002)(36756003)(66556008)(6512007)(508600001)(2906002)(8936002)(86362001)(30864003)(5660300002)(2616005)(6486002)(38100700002)(921005)(33964004)(6506007)(43740500002)(45980500001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1VRSVFTVXJQcHZXM00rL1JtaHVlekUwUXFCVEVKT04yVWg3ay9NTnJPVE9i?=
 =?utf-8?B?Tkx2bEx1VU9BQUpLSUZZY1NTSmRrNFN1TUFGN3h1aFoycm5pOHhRTWhlMFk4?=
 =?utf-8?B?Wi9YYTBWY1hWTjlYMk1YQS9rQ2QwMXgrMnh5SHVyOU1FVnlzaW1rK2dYUVVo?=
 =?utf-8?B?MytvVzVrQ3pROGE3LzdzQUloYWR4d2IwUzlvVUhhQkZLNnQxQ1NlMHFPMFUw?=
 =?utf-8?B?Ky9BK3U1ZEVibWhkNVdVaXU0SE9VUElZdG5wYjNIRlk4dXhUWnBld3lRY0VP?=
 =?utf-8?B?V2FPaDl1WkcvVDlBMEwvNlN5Zm1mbWpFbHdwU2JKM2RnNDBBdENlY08vYkJu?=
 =?utf-8?B?WGhkcWhUNTZLZnhidW5tWnpZa051YWVGT0ZBeWYxblRZeTB6Z2pPOHdqcUkw?=
 =?utf-8?B?UFdVQ1FwZUdpTSt6dVUvQlZQOUxqU0RRcjJtb2hNNlV1MmNCSDYwWHBLSFZE?=
 =?utf-8?B?L0ZiUmx6RzdTT2hFMFZQbVVKb1kvNXZQY0dKSkM1bjRqaUk3U2t4WEt1aHky?=
 =?utf-8?B?cDFGTVhsMWxBWDdHWUtxUTlqWnltL0I3QVUyMnR4RnVYaS8zZjVqaXlEaTJG?=
 =?utf-8?B?cGVBMTAxZXpCdEd3OVpIVGFQT2ZNeGtHWWJUL3dDYy92ZXNwTk90V1RsQW0x?=
 =?utf-8?B?aGpRcGhkRm5aMHVEaTYvZ0EwNUN5TDVMRGdFV3NFVlZGL01BY2gwWEhNVStv?=
 =?utf-8?B?V2QvSHFncTgzWHpKb29USkNXU0FUTVphN0VFNngwVWdocXpOZTAvYWUvR2R3?=
 =?utf-8?B?LzQ5QmxsWVdITXZ0Q0RGYXh5VzNLVnVHb0xsVWJjaGpWTVFQMW4wU1BCbkx0?=
 =?utf-8?B?ckVFYzM2TGtFZGJrbTF6RWd5T0t4VEwyTHlsaGY5SDV4NENOMHpWNU5kNkRE?=
 =?utf-8?B?amlhQ0kxcno5ZWdnd3grdHgrckNYZ28za0c0YUxsWTV3d3BZT3crWHJrcWJ2?=
 =?utf-8?B?MkFwMlNiZ2d6cHkyWTAycm16MkpIUHA0Qis2MGQzYy9Iek84YTFuVFRDUUVC?=
 =?utf-8?B?MU9teDlvbWRYcFhONWhFeXhQQXZUMi9vbkpPTEFEaXJ4NGd3ak5iV3Q0ck9W?=
 =?utf-8?B?bjlXU2I3V0FicHJBaXBTZHY2MU9Bd2pzOVdrdFRwYWVnejM1YXJqOVMzWEcr?=
 =?utf-8?B?TTBaTFQrb3BaMFNHSFJUd08rUm4xak5GbFJhWDYyN2VLYmE2eDZTZ3lobzBY?=
 =?utf-8?B?Nkp3WmhReGJ6TlNVNFp4cjFRSEtFb2N3RUhydU9udVg2YjRBRHBBVjhPdFRS?=
 =?utf-8?B?R0R0Yk1aVXJHWTVwSzJVeTMxK0puT2xOcWlGRk1MNFNKcFZZQmtjdnp2QWJU?=
 =?utf-8?B?UklXYk8vcUJjRUwrQW56ci9BSXBDaE1pT0w4a2Q2WWFjRmZ6U1NhWUJVWlpj?=
 =?utf-8?B?L203TVFxUEEzRHdHMFB0dkZJcGErSTNycmtHUS9JWDBDUTNqSDR5MnVyZnBX?=
 =?utf-8?B?QzlRdzVwY1p6ME1QVlMxbGdNbXlpNDc0RFJTdnNiRTcxaUEyRDQ0WFkyMzNl?=
 =?utf-8?B?cm0wK3JtdmJmcXlzMUkzWGVBWERncnFxNG1oRytvdkluMVBqczBjZjhMaUxt?=
 =?utf-8?B?ZjVhWDVqSVkrS1Zvc0NtRysvVGN4ck5vSlFQbU9IcDhBU1JOektUTXhiRXVV?=
 =?utf-8?B?Q2xYRENYd3pva05wUXZmb3VqUDF6MmJRUlV3Y3BGajlFRUM0SVNscERWbERQ?=
 =?utf-8?B?SU9majMrTlVIdkx4NlUxeWV5eG4yUXV0c1pUWEZwdXA0SThhbDZRUDhWMDJ3?=
 =?utf-8?B?NlAvaDdhZU41SExUQTNWVXRZN043cC94N3ZhNlRRZDhwb3FKUWp4dUVsVmxl?=
 =?utf-8?B?OXUwaXo4WTlYcDdTMWxVYkhVeGhtc3ZjYTVra2RjQlgwWTVBd1ErUVhJSEVK?=
 =?utf-8?B?YnM1VVhEU3RzMUpKWW01WkIrcGtyV0kyWHc4MUYzSFU4QVlEdXZydzRGdG8w?=
 =?utf-8?Q?KMKLnTCIplk+2klqI+lv/Naeea2DQgKr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9eeb5c-7c18-4ec0-5354-08da0d779483
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 09:20:47.3687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3AYr0poWazc3r5tTOrJVl4lWw7u/Col02imDZHETf/1vLr9F+uMbLJJMRwvsF9M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3381
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

--------------KiRmHfOYemlkb60anizx2eNB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Cong,

when I understand Robin correctly all mapping (host, guest, kernel, 
userspace etc..) must have the same caching attributes unless you use 
the S2FWB feature introduced with Armv8.4.

If you don't follow those rules you usually run into coherency issues or 
even worse system hangs. So you not only need to adjust the kernel 
mappings, but also the function for userspace mappings to follow those 
rules.

Additional to that I think I read Robin correctly that mapping the 
resource write combined should be sufficient to solve your problem. So I 
suggest to use that instead.

On the other hand if you manage to fix this completely for arm64 by 
updating all the places to use cached mappings I'm fine with it as well. 
It's then up to Dave to decide if that's something we want because QXL 
is intentionally emulating a hardware device as far as I know.

Regards,
Christian.

Am 24.03.22 um 08:04 schrieb liucong2@kylinos.cn:
>
> Hi Christian,
>
>
> Can you help explain more detail under what circumstances userspace 
> mapping
>
> will be problematic, you mean cached mappings also need adjustment in
>
> function ttm_prot_from_caching?
>
>
> Regards,
>
> Cong.
>
>
>
>
> *主　题：*Re: 回复: Re: 回复: Re: [PATCH v1 1/2] drm/qxl: replace ioremap 
> by ioremap_cache on arm64
> *日　期：*2022-03-23 18:17
> *发件人：*Christian König
> *收件人：*liucong2@kylinos.cnairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org 
>
>
> Hi Cong,
>
>    yes I've seen that, but that is still not sufficient.
>
>    You need to update the check in ttm_module.c as well or otherwise   
>  your userspace mapping might not work correctly either.
>
>    Regards,
>    Christian.
>
> Am 23.03.22 um 11:00 schrieb liucong2@kylinos.cn:
>>
>> Hi Christian,
>>
>>
>> another commit fix the case in ttm. I send two patches at the       
>>  same time, but seems I miss
>>
>>  '--cover-letter' when run format-patch or some other bad       
>>  operation.
>>
>> ----
>>
>>
>> Regards,
>>
>> Cong.
>>
>>
>>
>>
>> *主　题：*Re: 回复: Re: [PATCH v1 1/2] drm/qxl: replace           
>>  ioremap by ioremap_cache on arm64
>> *日　期：*2022-03-23 17:34
>> *发件人：*Christian König
>> *收件人：*liucong2@kylinos.cnairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org 
>>
>>
>> Hi Cong,
>>
>>                 well than Dave must decide what to do here.
>>
>>                 When QXL emulates a device it should also not use     
>>          memory accesses    which won't work on a physical device.
>>
>>                 BTW: Your patch is really buggy, it misses the cases 
>> in              ttm_module.c
>>
>>                 Regards,
>>                 Christian.
>>
>> Am 23.03.22 um 09:48 schrieb liucong2@kylinos.cn:
>>>
>>> Hi Christian,
>>>
>>>
>>> according to 'Arm Architecture Reference Manual                 
>>>  Armv8,for  Armv8-A
>>>
>>> architecture profile' pdf E2.6.5
>>>
>>>
>>> E2.6.5 Generation of Alignment faults by load/store                 
>>>  multiple  accesses to
>>>
>>>  Device memory
>>>
>>>
>>> When                  FEAT_LSMAOC is  implemented and the value of 
>>> the        applicable nTLSMD
>>>
>>> field is 0, any                  memory  access by an AArch32 Load 
>>> Multiple or            Store
>>>
>>> Multiple                  instruction to        an address that the 
>>> stage 1  translation
>>>
>>> assigns as                  Device-nGRE,  Device-nGnRE, or 
>>> Device-nGnRnE      generates
>>>
>>> an Alignment                  fault.
>>>
>>>
>>> so it seems not just some ARM boards doesn't allow                 
>>>  unaligned    access to MMIO
>>>
>>> space, all pci memory mapped as Device-nGnRE in arm64  cannot       
>>>  support
>>>
>>> unaligned access. and qxl is a device simulated by                 
>>>  qemu, it        should be able to access
>>>
>>> to MMIO space in a more flexible way(PROT_NORMAL)                 
>>>  than the real        physical
>>>
>>> graphics card.
>>>
>>>
>>> ----
>>>
>>>
>>>
>>> Cong.
>>>
>>>
>>>
>>>
>>>
>>> *主　题：*Re: [PATCH v1                    1/2]  drm/qxl: replace 
>>> ioremap by      ioremap_cache on arm64
>>> *日　期：*2022-03-23  15:15
>>> *发件人：*Christian  König
>>> *收件人：*CongLiuairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org 
>>>
>>>
>>>
>>> Am 22.03.22 um 10:34 schrieb Cong Liu:
>>>                         > qxl use ioremap to map ram_header and rom, 
>>>  in the arm64        implementation,
>>>                         > the device is mapped as DEVICE_nGnRE, it 
>>>  can not support        unaligned
>>>                         > access.
>>>
>>>                         Well that some ARM boards doesn't allow 
>>>  unaligned access to MMIO        space
>>>                         is a well known bug of those ARM boards.
>>>
>>>                         So as far as I know this is a hardware bug 
>>> you  are trying to        workaround
>>>                         here and I'm not 100% sure that this is 
>>>  correct.
>>>
>>>                         Christian.
>>>
>>>                         >
>>>                         >    6.620515] pc : setup_hw_slot+0x24/0x60 
>>>  [qxl]
>>>                         > [    6.620961] lr : setup_slot+0x34/0xf0 
>>>  [qxl]
>>>                         > [    6.621376] sp : ffff800012b73760
>>>                         > [    6.621701] x29: ffff800012b73760 x28: 
>>>  0000000000000001        x27: 0000000010000000
>>>                         > [    6.622400] x26: 0000000000000001 x25: 
>>>  0000000004000000        x24: ffffcf376848c000
>>>                         > [    6.623099] x23: ffff0000c4087400 x22: 
>>>  ffffcf3718e17140        x21: 0000000000000000
>>>                         > [    6.623823] x20: ffff0000c4086000 x19: 
>>>  ffff0000c40870b0        x18: 0000000000000014
>>>                         > [    6.624519] x17: 000000004d3605ab x16: 
>>>  00000000bb3b6129        x15: 000000006e771809
>>>                         > [    6.625214] x14: 0000000000000001 x13: 
>>>  007473696c5f7974        x12: 696e696666615f65
>>>                         > [    6.625909] x11: 00000000d543656a x10: 
>>>  0000000000000000        x9 : ffffcf3718e085a4
>>>                         > [    6.626616] x8 : 00000000006c7871 x7 : 
>>>  000000000000000a        x6 : 0000000000000017
>>>                         > [    6.627343] x5 : 0000000000001400 x4 : 
>>>  ffff800011f63400        x3 : 0000000014000000
>>>                         > [    6.628047] x2 : 0000000000000000 x1 : 
>>>  ffff0000c40870b0        x0 : ffff0000c4086000
>>>                         > [    6.628751] Call trace:
>>>                         > [    6.628994]  setup_hw_slot+0x24/0x60  [qxl]
>>>                         > [    6.629404]  setup_slot+0x34/0xf0 [qxl]
>>>                         > [    6.629790] 
>>>   qxl_device_init+0x6f0/0x7f0 [qxl]
>>>                         > [    6.630235]  qxl_pci_probe+0xdc/0x1d0 
>>>  [qxl]
>>>                         > [    6.630654]  local_pci_probe+0x48/0xb8
>>>                         > [    6.631027]   pci_device_probe+0x194/0x208
>>>                         > [    6.631464]  really_probe+0xd0/0x458
>>>                         > [    6.631818] 
>>>   __driver_probe_device+0x124/0x1c0
>>>                         > [    6.632256] 
>>>   driver_probe_device+0x48/0x130
>>>                         > [    6.632669]  __driver_attach+0xc4/0x1a8
>>>                         > [    6.633049]  bus_for_each_dev+0x78/0xd0
>>>                         > [    6.633437]  driver_attach+0x2c/0x38
>>>                         > [    6.633789]  bus_add_driver+0x154/0x248
>>>                         > [    6.634168]  driver_register+0x6c/0x128
>>>                         > [    6.635205] 
>>>   __pci_register_driver+0x4c/0x58
>>>                         > [    6.635628]  qxl_init+0x48/0x1000 [qxl]
>>>                         > [    6.636013]  do_one_initcall+0x50/0x240
>>>                         > [    6.636390]  do_init_module+0x60/0x238
>>>                         > [    6.636768]  load_module+0x2458/0x2900
>>>                         > [    6.637136] 
>>>   __do_sys_finit_module+0xbc/0x128
>>>                         > [    6.637561] 
>>>   __arm64_sys_finit_module+0x28/0x38
>>>                         > [    6.638004]  invoke_syscall+0x74/0xf0
>>>                         > [    6.638366] 
>>>   el0_svc_common.constprop.0+0x58/0x1a8
>>>                         > [    6.638836]  do_el0_svc+0x2c/0x90
>>>                         > [    6.639216]  el0_svc+0x40/0x190
>>>                         > [    6.639526] 
>>>   el0t_64_sync_handler+0xb0/0xb8
>>>                         > [    6.639934]  el0t_64_sync+0x1a4/0x1a8
>>>                         > [    6.640294] Code: 910003fd f9484804 
>>>  f9400c23 8b050084        (f809c083)
>>>                         > [    6.640889] ---[ end trace 
>>>  95615d89b7c87f95 ]---
>>>                         >
>>>                         > Signed-off-by: Cong Liu
>>>                             > ---
>>>                             > drivers/gpu/drm/qxl/qxl_kms.c | 10     
>>>        ++++++++++
>>>                             >   1 file changed, 10 insertions(+)
>>>                             >
>>>                             > diff --git 
>>>  a/drivers/gpu/drm/qxl/qxl_kms.c   b/drivers/gpu/drm/qxl/qxl_kms.c
>>>                             > index 4dc5ad13f12c..0e61ac04d8ad    100644
>>>                             > --- a/drivers/gpu/drm/qxl/qxl_kms.c
>>>                             > +++ b/drivers/gpu/drm/qxl/qxl_kms.c
>>>                             > @@ -165,7 +165,11 @@ int 
>>>  qxl_device_init(struct  qxl_device *qdev,
>>>                             > (int)qdev->surfaceram_size /         
>>>  1024,
>>>                             >   (sb == 4) ? "64bit" : "32bit");
>>>                             >
>>>                             > +#ifdef CONFIG_ARM64
>>>                             > + qdev->rom = 
>>>  ioremap_cache(qdev->rom_base,                     qdev->rom_size);
>>>                             > +#else
>>>                             > qdev->rom =  ioremap(qdev->rom_base,   
>>>             qdev->rom_size);
>>>                             > +#endif
>>>                             >   if (!qdev->rom) {
>>>                             > pr_err("Unable to ioremap ROM\n");
>>>                             >   r = -ENOMEM;
>>>                             > @@ -183,9 +187,15 @@ int 
>>>  qxl_device_init(struct  qxl_device *qdev,
>>>                             >   goto rom_unmap;
>>>                             >   }
>>>                             >
>>>                             > +#ifdef CONFIG_ARM64
>>>                             > + qdev->ram_header = 
>>>  ioremap_cache(qdev->vram_base  +
>>>                             > +  qdev->rom->ram_header_offset,
>>>                             > + sizeof(*qdev->ram_header));
>>>                             > +#else
>>>                             > qdev->ram_header = 
>>>  ioremap(qdev->vram_base +
>>>                             >  qdev->rom->ram_header_offset,
>>>                             > sizeof(*qdev->ram_header));
>>>                             > +#endif
>>>                             >   if (!qdev->ram_header) {
>>>                             > DRM_ERROR("Unable to ioremap RAM       
>>>    header\n");
>>>                             >   r = -ENOMEM;
>>>
>>
>

--------------KiRmHfOYemlkb60anizx2eNB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Cong,<br>
    <br>
    when I understand Robin correctly all mapping (host, guest, kernel,
    userspace etc..) must have the same caching attributes unless you
    use the S2FWB feature introduced with Armv8.4.<br>
    <br>
    If you don't follow those rules you usually run into coherency
    issues or even worse system hangs. So you not only need to adjust
    the kernel mappings, but also the function for userspace mappings to
    follow those rules.<br>
    <br>
    Additional to that I think I read Robin correctly that mapping the
    resource write combined should be sufficient to solve your problem.
    So I suggest to use that instead.<br>
    <br>
    On the other hand if you manage to fix this completely for arm64 by
    updating all the places to use cached mappings I'm fine with it as
    well. It's then up to Dave to decide if that's something we want
    because QXL is intentionally emulating a hardware device as far as I
    know.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 24.03.22 um 08:04 schrieb
      <a class="moz-txt-link-abbreviated" href="mailto:liucong2@kylinos.cn">liucong2@kylinos.cn</a>:<br>
    </div>
    <blockquote type="cite" cite="mid:2n05d7wxagz-2n05d7wxah0@nsmail6.0">
      
      <p>Hi Christian,</p>
      <p><br>
      </p>
      <p>Can you help explain more detail under what circumstances
        userspace mapping</p>
      <p>will be problematic, you mean cached mappings also need
        adjustment in</p>
      <p>function ttm_prot_from_caching?</p>
      <p><br>
      </p>
      <p>Regards,</p>
      <p>Cong.</p>
      <div id="re" style="margin-left:0.5em;padding-left:0.5em;border-left:1px
        solid green;"><br>
        <br>
        <br>
        &nbsp; &nbsp; &nbsp; &nbsp;
        <div style="background-color:#f5f7fa"><b>主　题：</b><span id="subject">Re: 回复: Re: 回复: Re: [PATCH v1 1/2] drm/qxl:
            replace ioremap by ioremap_cache on arm64</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
          <b>日　期：</b><span id="date">2022-03-23 18:17</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
          <b>发件人：</b><span id="from">Christian König</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
          <b>收件人：</b><span id="to"><a class="moz-txt-link-abbreviated" href="mailto:liucong2@kylinos.cnairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org">liucong2@kylinos.cnairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org</a></span>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
        <br>
        &nbsp; &nbsp; &nbsp; &nbsp;
        <div id="content">
          <div class="viewer_part">
            <div>Hi Cong,<br>
              &nbsp; &nbsp;<br>
              &nbsp; &nbsp;yes I've seen that, but that is still not sufficient.<br>
              &nbsp; &nbsp;<br>
              &nbsp; &nbsp;You need to update the check in ttm_module.c as well or
              otherwise &nbsp; &nbsp;your userspace mapping might not work
              correctly either.<br>
              &nbsp; &nbsp;<br>
              &nbsp; &nbsp;Regards,<br>
              &nbsp; &nbsp;Christian. <br>
              &nbsp; &nbsp;<br>
              &nbsp; &nbsp;
              <div class="moz-cite-prefix">Am 23.03.22 um 11:00 schrieb
                &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-abbreviated
                  moz-txt-link-freetext" href="mailto:liucong2@kylinos.cn" moz-do-not-send="true">liucong2@kylinos.cn</a>:<br>
                &nbsp; &nbsp;</div>
              <blockquote type="cite" cite="mid:odhwkkfdf7-odj6iduf90@nsmail6.0">&nbsp; &nbsp;<br>
                &nbsp; &nbsp; &nbsp;
                <p>Hi&nbsp;<span style="background-color: rgb(245, 247,
                    250);">Christian,</span></p>
                <p><br>
                  &nbsp; &nbsp; &nbsp;</p>
                <p>another commit fix the case in ttm. I send two
                  patches at the &nbsp; &nbsp; &nbsp; &nbsp;same time, but seems I miss</p>
                <p>&nbsp;'--cover-letter' when run format-patch or some other
                  bad &nbsp; &nbsp; &nbsp; &nbsp;operation.</p>
                <p>----</p>
                <div id="cs2c_mail_sigature">
                  <p><br>
                    &nbsp; &nbsp; &nbsp; &nbsp;</p>
                  <p>Regards,</p>
                  <p>Cong.</p>
                </div>
                <div id="re" style="margin-left:0.5em;padding-left:0.5em;border-left:1px
                  solid green;"><br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                  <div style="background-color:#f5f7fa"><b>主　题：</b><span id="subject">Re: 回复: Re: [PATCH v1 1/2] drm/qxl:
                      replace &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ioremap by ioremap_cache on
                      arm64</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b>日　期：</b><span id="date">2022-03-23 17:34</span>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b>发件人：</b><span id="from">Christian König</span>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b>收件人：</b><span id="to"><a class="moz-txt-link-abbreviated
                        moz-txt-link-freetext" href="mailto:liucong2@kylinos.cnairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org" moz-do-not-send="true">liucong2@kylinos.cnairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org</a></span>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
                  <br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                  <div id="content">
                    <div class="viewer_part">
                      <div>Hi Cong,<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;well than Dave must decide what
                        to do here.<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;When QXL emulates a device it
                        should also not use &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory accesses
                        &nbsp; &nbsp;which won't work on a physical device.<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;BTW: Your patch is really buggy,
                        it misses the cases in &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ttm_module.c<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;Regards,<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;Christian.<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                        <div class="moz-cite-prefix">Am 23.03.22 um
                          09:48 schrieb &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<a class="moz-txt-link-abbreviated
                            moz-txt-link-freetext" href="mailto:liucong2@kylinos.cn" moz-do-not-send="true">liucong2@kylinos.cn</a>:<br>
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</div>
                        <blockquote type="cite" cite="mid:18a8ijpwp6j-18a9shjbr0c@nsmail6.0">
                          <p>Hi Christian,</p>
                          <p><br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</p>
                          <p>according to 'Arm Architecture Reference
                            Manual &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Armv8,for &nbsp; &nbsp; &nbsp;
                            &nbsp;Armv8-A</p>
                          <p>architecture profile' pdf E2.6.5</p>
                          <p><br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</p>
                          <p>E2.6.5 Generation of Alignment faults by
                            load/store &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;multiple &nbsp; &nbsp; &nbsp;
                            &nbsp;accesses to</p>
                          <p>&nbsp;Device memory</p>
                          <p><br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</p>
                          <p><span style="white-space:pre">	</span>When
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;FEAT_LSMAOC is &nbsp; &nbsp; &nbsp;
                            &nbsp;implemented and the value of the &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp;applicable nTLSMD</p>
                          <p><span style="white-space:pre">	</span>field
                            is 0, any &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory &nbsp; &nbsp; &nbsp;
                            &nbsp;access by an AArch32 Load Multiple or &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Store&nbsp;</p>
                          <p><span style="white-space:pre">	</span>Multiple
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;instruction to &nbsp; &nbsp; &nbsp; &nbsp;an
                            address that the stage 1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;translation&nbsp;</p>
                          <p><span style="white-space:pre">	</span>assigns
                            as &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Device-nGRE, &nbsp; &nbsp; &nbsp;
                            &nbsp;Device-nGnRE, or Device-nGnRnE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp;generates&nbsp;</p>
                          <p><span style="white-space: pre;">	</span>an
                            Alignment &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fault.</p>
                          <br>
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                          <p>so it seems not just&nbsp;some ARM boards
                            doesn't allow &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unaligned &nbsp; &nbsp;
                            &nbsp; &nbsp;access to MMIO&nbsp;</p>
                          <p>space, all pci memory mapped
                            as&nbsp;Device-nGnRE in arm64 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;cannot &nbsp; &nbsp; &nbsp; &nbsp;support</p>
                          <p>unaligned access. and qxl is a
                            device&nbsp;simulated by &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu,
                            it &nbsp; &nbsp; &nbsp; &nbsp;should be able to access&nbsp;</p>
                          <p>to MMIO space in a more flexible
                            way(PROT_NORMAL) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;than the
                            real &nbsp; &nbsp; &nbsp; &nbsp;physical&nbsp;</p>
                          <p>graphics card.</p>
                          <p><br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</p>
                          <p>----</p>
                          <p><br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</p>
                          <p><br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</p>
                          <p>Cong.<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</p>
                          <p><br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</p>
                          <p><br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</p>
                          <p><strong>主　题：</strong><span id="subject">Re:
                              [PATCH v1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1/2] &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;drm/qxl: replace ioremap by &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp;ioremap_cache on arm64</span> &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<strong>日　期：</strong><span id="date">2022-03-23 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;15:15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<strong>发件人：</strong><span id="from">Christian &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;König</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<strong>收件人：</strong><span id="to">Cong<a class="moz-txt-link-abbreviated
                                moz-txt-link-freetext" href="mailto:Liuairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org" moz-do-not-send="true">Liuairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org</a></span>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
                          <p><br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</p>
                          <p>Am 22.03.22 um 10:34 schrieb Cong Liu:<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; qxl use ioremap
                            to map ram_header and rom, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;in the arm64 &nbsp; &nbsp; &nbsp; &nbsp;implementation,<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; the device is
                            mapped as DEVICE_nGnRE, it &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;can not support &nbsp; &nbsp; &nbsp; &nbsp;unaligned<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; access.<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;Well that some ARM
                            boards doesn't allow &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;unaligned access to MMIO &nbsp; &nbsp; &nbsp; &nbsp;space <br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;is a well known bug
                            of those ARM boards.<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;So as far as I know
                            this is a hardware bug you &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;are trying to &nbsp; &nbsp; &nbsp; &nbsp;workaround <br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;here and I'm not
                            100% sure that this is &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;correct.<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;Christian.<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp;6.620515] pc
                            : setup_hw_slot+0x24/0x60 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;[qxl]<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.620961]
                            lr : setup_slot+0x34/0xf0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;[qxl]<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.621376]
                            sp : ffff800012b73760<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.621701]
                            x29: ffff800012b73760 x28: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;0000000000000001 &nbsp; &nbsp; &nbsp; &nbsp;x27:
                            0000000010000000<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.622400]
                            x26: 0000000000000001 x25: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;0000000004000000 &nbsp; &nbsp; &nbsp; &nbsp;x24:
                            ffffcf376848c000<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.623099]
                            x23: ffff0000c4087400 x22: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;ffffcf3718e17140 &nbsp; &nbsp; &nbsp; &nbsp;x21:
                            0000000000000000<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.623823]
                            x20: ffff0000c4086000 x19: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;ffff0000c40870b0 &nbsp; &nbsp; &nbsp; &nbsp;x18:
                            0000000000000014<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.624519]
                            x17: 000000004d3605ab x16: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;00000000bb3b6129 &nbsp; &nbsp; &nbsp; &nbsp;x15:
                            000000006e771809<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.625214]
                            x14: 0000000000000001 x13: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;007473696c5f7974 &nbsp; &nbsp; &nbsp; &nbsp;x12:
                            696e696666615f65<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.625909]
                            x11: 00000000d543656a x10: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;0000000000000000 &nbsp; &nbsp; &nbsp; &nbsp;x9 :
                            ffffcf3718e085a4<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.626616]
                            x8 : 00000000006c7871 x7 : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;000000000000000a &nbsp; &nbsp; &nbsp; &nbsp;x6 :
                            0000000000000017<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.627343]
                            x5 : 0000000000001400 x4 : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;ffff800011f63400 &nbsp; &nbsp; &nbsp; &nbsp;x3 :
                            0000000014000000<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.628047]
                            x2 : 0000000000000000 x1 : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;ffff0000c40870b0 &nbsp; &nbsp; &nbsp; &nbsp;x0 :
                            ffff0000c4086000<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.628751]
                            Call trace:<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.628994]
                            &nbsp;setup_hw_slot+0x24/0x60 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;[qxl]<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.629404]
                            &nbsp;setup_slot+0x34/0xf0 [qxl]<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.629790]
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;&nbsp;qxl_device_init+0x6f0/0x7f0 [qxl]<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.630235]
                            &nbsp;qxl_pci_probe+0xdc/0x1d0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;[qxl]<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.630654]
                            &nbsp;local_pci_probe+0x48/0xb8<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.631027]
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;&nbsp;pci_device_probe+0x194/0x208<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.631464]
                            &nbsp;really_probe+0xd0/0x458<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.631818]
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;&nbsp;__driver_probe_device+0x124/0x1c0<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.632256]
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;&nbsp;driver_probe_device+0x48/0x130<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.632669]
                            &nbsp;__driver_attach+0xc4/0x1a8<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.633049]
                            &nbsp;bus_for_each_dev+0x78/0xd0<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.633437]
                            &nbsp;driver_attach+0x2c/0x38<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.633789]
                            &nbsp;bus_add_driver+0x154/0x248<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.634168]
                            &nbsp;driver_register+0x6c/0x128<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.635205]
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;&nbsp;__pci_register_driver+0x4c/0x58<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.635628]
                            &nbsp;qxl_init+0x48/0x1000 [qxl]<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.636013]
                            &nbsp;do_one_initcall+0x50/0x240<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.636390]
                            &nbsp;do_init_module+0x60/0x238<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.636768]
                            &nbsp;load_module+0x2458/0x2900<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.637136]
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;&nbsp;__do_sys_finit_module+0xbc/0x128<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.637561]
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;&nbsp;__arm64_sys_finit_module+0x28/0x38<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.638004]
                            &nbsp;invoke_syscall+0x74/0xf0<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.638366]
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;&nbsp;el0_svc_common.constprop.0+0x58/0x1a8<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.638836]
                            &nbsp;do_el0_svc+0x2c/0x90<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.639216]
                            &nbsp;el0_svc+0x40/0x190<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.639526]
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;&nbsp;el0t_64_sync_handler+0xb0/0xb8<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.639934]
                            &nbsp;el0t_64_sync+0x1a4/0x1a8<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.640294]
                            Code: 910003fd f9484804 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;f9400c23 8b050084 &nbsp; &nbsp; &nbsp; &nbsp;(f809c083)<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.640889]
                            ---[ end trace &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;95615d89b7c87f95 ]---<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&gt; Signed-off-by:
                            Cong Liu<liucong2@kylinos.cn><br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; ---<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;
                              drivers/gpu/drm/qxl/qxl_kms.c | 10 &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;++++++++++<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; 1 file
                              changed, 10 insertions(+)<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; diff
                              --git &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;a/drivers/gpu/drm/qxl/qxl_kms.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;&nbsp;b/drivers/gpu/drm/qxl/qxl_kms.c<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; index
                              4dc5ad13f12c..0e61ac04d8ad &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp;100644<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; ---
                              a/drivers/gpu/drm/qxl/qxl_kms.c<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +++
                              b/drivers/gpu/drm/qxl/qxl_kms.c<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -165,7
                              +165,11 @@ int &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;qxl_device_init(struct &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;qxl_device *qdev,<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;
                              (int)qdev-&gt;surfaceram_size / &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1024,<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; (sb ==
                              4) ? &quot;64bit&quot; : &quot;32bit&quot;);<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#ifdef
                              CONFIG_ARM64<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +
                              qdev-&gt;rom = &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;ioremap_cache(qdev-&gt;rom_base, &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;qdev-&gt;rom_size);<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#else<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;
                              qdev-&gt;rom = &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;ioremap(qdev-&gt;rom_base, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;qdev-&gt;rom_size);<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#endif<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; if
                              (!qdev-&gt;rom) {<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;
                              pr_err(&quot;Unable to ioremap ROM\n&quot;);<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; r =
                              -ENOMEM;<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -183,9
                              +187,15 @@ int &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;qxl_device_init(struct &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;qxl_device *qdev,<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; goto
                              rom_unmap;<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; }<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#ifdef
                              CONFIG_ARM64<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +
                              qdev-&gt;ram_header = &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;ioremap_cache(qdev-&gt;vram_base &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;+<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;qdev-&gt;rom-&gt;ram_header_offset,<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp;
                              sizeof(*qdev-&gt;ram_header));<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#else<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;
                              qdev-&gt;ram_header = &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;ioremap(qdev-&gt;vram_base +<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp;qdev-&gt;rom-&gt;ram_header_offset,<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp;
                              sizeof(*qdev-&gt;ram_header));<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#endif<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; if
                              (!qdev-&gt;ram_header) {<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;
                              DRM_ERROR(&quot;Unable to ioremap RAM &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;header\n&quot;);<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; r =
                              -ENOMEM;<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</liucong2@kylinos.cn></p>
                        </blockquote>
                        <br>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
                    </div>
                  </div>
                </div>
              </blockquote>
              <br>
              &nbsp;</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------KiRmHfOYemlkb60anizx2eNB--
