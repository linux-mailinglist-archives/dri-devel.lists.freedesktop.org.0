Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF1487954F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 14:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A2010EA76;
	Tue, 12 Mar 2024 13:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q9Uyz2QI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF9210EA76
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 13:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1nd7pFwNP1Px+2pF8+xFs45/blSYkDIrHcoiaGqFrnOBSSeELU75FDIyDy/BjF1dujpK0hu0liq6tfkBfsVLDFQwHMCLUU9Uff3oo7BVR8kyU0AZRQfXue1mHj+VyuwaNoWlw3/s7IdawbLTpQdPKrNxodgRjKcSz/xqwhnKWWXsVn/3fdljvloQGI5eXI2kI6N48Cj0iLQzcRmFEqEaC0vMbwlIebTwHlX5hr+WW6fNgX8fNsHRNSWU83fUGtG58e+lTT+2b2MyFTVkcVdHt3NCpoBhBrBNFUFk6dPFsKedW6grAiTABnxLmp+LxdsKJXpqxGHKHtvG/lPMFvBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRbKCqUF3mOMwdDQLSDmkFZTpGqX4V3Ru6jrUE4QKDI=;
 b=K4owBwd6EADk2ikOR+IH0S62R5D0T5wn2mFg9DFxUY0/6LodcI31ebAYtY3HM+g90UdlH2Zaz19ld/Vm2lZww85dPxoUUJ6x/gwwhYHDEE5gmgcyHCOiqAWzNoxapIw6pXMZdYcqennmqf9Sy3dftmoC/lnTAH8AC1gmYSXzZ++Jtbmju5EvzgPaBHrqfHX3kwYfkGMuFLx/adFwLveVf8A5fE+KLA7QSQVkTOxBl9F2ypG7M+IpE7X2ijzBaZVed++yzsCnWN/SYCZx5JJepAqzyLoZmw5lbhLJVFQfQ1wkK+/I75Tdg3m6697Qkk5+Y13a3Tx9UzTVA1Q2Nj7asQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRbKCqUF3mOMwdDQLSDmkFZTpGqX4V3Ru6jrUE4QKDI=;
 b=q9Uyz2QISdwcNIoTR9TQgJBIEYupXsOCnRbqJG8/TbrEaU2H2vqUvViiAtmvfIkJEzS8X3PtJG+2WRdrQi7FSoHp//ubyRmfHjiGYLVOvOvK+uQcPTVRTXnNxHxcaXhtY+Da9sah8jRzqlUDWrisw+AbkytyYfAaQvAjWFYt9Bo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6068.namprd12.prod.outlook.com (2603:10b6:208:3ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 13:48:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.031; Tue, 12 Mar 2024
 13:48:44 +0000
Message-ID: <9cfb7f83-2d76-4e8d-9052-5975da71e0dc@amd.com>
Date: Tue, 12 Mar 2024 14:48:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/gem: Add a mountpoint parameter to
 drm_gem_object_init()
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Russell King <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-3-mcanal@igalia.com>
 <30a7f20b-1f2c-41cb-b193-03429c160b63@igalia.com>
 <3a5d07c0-120f-47f9-a35a-31f3bfcc9330@amd.com>
 <07885e3b-ee7b-456b-9fad-17d9009a4cb7@igalia.com>
 <a0ac2e10-f5f5-4fbb-b591-bd188967ce53@amd.com>
 <e8165baa-9ded-4149-aaa6-6713d112b621@igalia.com>
 <69576e6d-9704-42b9-905f-289f9f9017b9@amd.com>
 <ed7ecd56-0b5e-4543-80f6-7d28ddf8e2ec@igalia.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ed7ecd56-0b5e-4543-80f6-7d28ddf8e2ec@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: afbf5009-ca21-4b0d-dc7f-08dc429b226f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pjpQ82LdL3pWvQlu1W/mQiVkJVp1Epdlv5YJZ62N2MKTAW5ND1n7WKiFFMkS8XKM6h9bAZAWYL3EyjRE3ZILDFJgm17hjy6t/PKWFFrBwH6a7oLtfcZttINyoNtlo8/A8dSrQGZiHCQX2R6rCYPqBcKMgLdN/fRnuoRJZU+akfsxzyTLCHqKvDosU6wTf70tqAg1WfrgkmDbP79I0ZaEW6+u6E935COuZRhXAyV47N5jLnlWdtPnN9N++1+M4TTMQhFGjyK+NLnVY6d/nHEUhoHZNgMNwE5St89Se2ffmTnOBjVefmbqphe9rmmr9Xqbbh8Wey28mO6a4cFIBHmPH1DzsUNXI07h8ifTHJao5dm54JuiYftQ7MC0OXZEs0mOVvYY/5o6Kq9wORHHRbebJjOt2+BNm0BLBwwKUb2XjrdmvD8O45qleKhp5QuBFg6g+jF4ePI310SJJnPgk+Gz/xZiTnbrUu4HzZIhVA+G8tK0z7tkQY/ZhjGJkBUskqPk6r7Ca9t3VLtxBfD7gSYl9W3oVkf1GEC2cLzeqKIR3ieX3uqT08ykYGVjju6SIA67fepFsyEmhyNb18Vx1AHmE2q2qS/naNitHIKEkRocmmu2ZRN8RqcYdrgcPoZg2SbdR4NjLRzIDKM3BM4XIwlygeGJqkJ0DYboaqh9I/nW7Q0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEdHNkZSckJERkxnc2o5ejRIVUFRK3FWendCYVZBQ3ZuUHZlWG1WM0tFdWx4?=
 =?utf-8?B?SEpEVUY1Qm1aOXgwUVI1T0g1bzBlN0d5N1daelhoQU1oR3lTdFhud3o3Nmtz?=
 =?utf-8?B?MnpJT08zVUh6eUZIVnNFV3JsZE9pSUdhMzk5T0h6WTlTelNoZzZUZjRLNHhR?=
 =?utf-8?B?TmZmVmNETURXdjBmajE5aGhnZ3IyOVE3RCtJMmNTdG8xZFJSaGJ1bml2cDA0?=
 =?utf-8?B?V2NTZDE5ZWlCSERhN1pYbDFHWmdRNUxCN3VLZHV1K3JibGwxWHRXTzFrNjYz?=
 =?utf-8?B?YnNvQThBcmNrcTFjVWJma21PSW5vMkIzQ0pjamo4ZFIvbk9BTlk0dzN0NWpR?=
 =?utf-8?B?Y0Rrb2ZHMWRKQVZ4Mkl3MDJCNHlxQ0FFSWZKd3lUMlVPVndraExEcUdvcjU5?=
 =?utf-8?B?Q2JVcXZMU2J3Y3A2MWdzVHB6ODdKd3BoU0FEelhHMTZKelZXZ1hWRkJNODFi?=
 =?utf-8?B?c3Jpbys3L0s3TjdubzNEckJnOUIvYkw2TDNuWkdqb3l3RkZHV2xpZWhOQWRj?=
 =?utf-8?B?enlJblJMTCtTY3B4TW8xSDZoN1ZoUGdXc2dJMEd2SkZ2UVJNcFNmY3pwb3RO?=
 =?utf-8?B?Q1pUelgySjZ6Q2Rpbit1RHZQaGFMaHkzVnVPejMwREFRS25YY3ljVHRCRkZi?=
 =?utf-8?B?OEJZTjhtbkNOamdyOEFXLzJlODlKUXdEcXovRjVvTUtTYXp0MnVITEMvd1F4?=
 =?utf-8?B?dGJCNkwxcmplMkxSVyszYmNkZHRvWkFUdkR1SUJuOVRCM2cvcmpzZVNtUFZa?=
 =?utf-8?B?aS85RkFnb1FEQ1ZDMzROUFlRNGV1elhFRmtTQ1ZxSGlZd3QxUW90Z3V6Y1dL?=
 =?utf-8?B?UjU3YmQ0SzdjbHpNVkN5NCthVmNXdWJBQVptcWFFQkx2blVzb24xNFNQenNx?=
 =?utf-8?B?ZFlqWlhJV1NWeGxCcE5iRHEwYm1HTHVMc3U4YWtITTJoVlluUzAzQk9wTzFL?=
 =?utf-8?B?SWo1YS9QMHJpd2NSMk4zaTFqckU5TXRDNnVSc1Vyakp4cmZmNnYxR29INnhR?=
 =?utf-8?B?eWw3c3RZM1QveFp1L2Z6T0JnQ0EvR05LWGxHa3ZUYUV6cmtMd1BIV2h6TGww?=
 =?utf-8?B?MkVyWEpxOCtsTXBtSHA0djhKTWxFVlQ2SG9WL2lnMGJuNGw0ZFNrZVI3OFFx?=
 =?utf-8?B?OU9KUnMzai94R0ZGMDVmMHR3TUJjblY0SkJsUk9hNTZLQWxPM2ZwRnRFbU91?=
 =?utf-8?B?bnc2c0ViQWhRbFdwdjRoblBMZGVoenJpTlVCcjZLVDdSTDJOT2lCQ21NeUNU?=
 =?utf-8?B?ZjhySDR2UER5NnFvZE0zOHM3b1hEby8rbEFjMjBpdktXSHQwT2xpVEdiVTF2?=
 =?utf-8?B?SGRRWVhla0syUkdEUStzUW1RMFI4TzJuYVhkdm9ML2VhV0lwZTFHN0U4Vk10?=
 =?utf-8?B?QXNsa3hiY21XemtJaHVhaEVvUllWQXpMR3VmWTNTbkJLOE1IZ21EckNEZmpW?=
 =?utf-8?B?OHZpNFNnQXRBWmV3MXhNMGdCRnVrMmgweU5HNGpQdEhUbjVBTm5aNitmblE4?=
 =?utf-8?B?ZUJydkp5Qm1pVTBWU0Q5MDFGNktOeU5iblRsMDhYV04wSXFFNjJpTXRmekFQ?=
 =?utf-8?B?TzRZVUNUTGprb29LcmlQZndjMmFwQWprTklQZnBiWldXZjQzVzVieFZyZFg4?=
 =?utf-8?B?UEJCLy9xY3QyVTc5czU0eDBXQXphZWQ1cG5kMVlQQXVDMHI2UnlYUkJzeGJE?=
 =?utf-8?B?N0ZRT3dldlh1MStIQmd4cjNsYUdYZVRqWmcvMjViaDRKcDloOFp0UU4xUmdr?=
 =?utf-8?B?ZHlBT2Uva0d5bE81emRuTmNDK3U2dE5WaFpQUFdjTkU2VWQwQUR3MmMxNmhS?=
 =?utf-8?B?MUtTcFhhRXBKN1hNcFVOaTVoek5HTHQvTHV4UmV5dmtrNERrbWl1ZHVFWDY3?=
 =?utf-8?B?MjNVZkJwUFcwUVZXTGhVQ0k3MmtSQ0J5QmlCWWNlVG9WSXVpZUt5QkMyYWxM?=
 =?utf-8?B?WUZnZUc3aFRsekM1WDh3dVJhSVNWQmN6T1hiU0d3M3VCYkZuLzRxSnhiRzNR?=
 =?utf-8?B?SkFWd0d6L2F6OWR3NEZtUVdMNUF6bUpRMFZBMU5xWnlBSXl4NW5UaFpuQ2dY?=
 =?utf-8?B?VHpFb28yK1hsK1JMejNieUlKeCszL2tPM2VoTTE4V2VxQ0RDMC9aa084SG1Z?=
 =?utf-8?Q?3vS6im5cLEoOds+b9HPynuyXr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbf5009-ca21-4b0d-dc7f-08dc429b226f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 13:48:44.7005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzhwhgBmeXgKN9SB9+HF6t6Bbba6A+DkpE9BU4flk06qQ07+J1IZsE7JKFgEUHqq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6068
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

Am 12.03.24 um 14:09 schrieb Tvrtko Ursulin:
>
> On 12/03/2024 10:37, Christian König wrote:
>> Am 12.03.24 um 11:31 schrieb Tvrtko Ursulin:
>>>
>>> On 12/03/2024 10:23, Christian König wrote:
>>>> Am 12.03.24 um 10:30 schrieb Tvrtko Ursulin:
>>>>>
>>>>> On 12/03/2024 08:59, Christian König wrote:
>>>>>> Am 12.03.24 um 09:51 schrieb Tvrtko Ursulin:
>>>>>>>
>>>>>>> Hi Maira,
>>>>>>>
>>>>>>> On 11/03/2024 10:05, Maíra Canal wrote:
>>>>>>>> For some applications, such as using huge pages, we might want 
>>>>>>>> to have a
>>>>>>>> different mountpoint, for which we pass in mount flags that 
>>>>>>>> better match
>>>>>>>> our usecase.
>>>>>>>>
>>>>>>>> Therefore, add a new parameter to drm_gem_object_init() that 
>>>>>>>> allow us to
>>>>>>>> define the tmpfs mountpoint where the GEM object will be 
>>>>>>>> created. If
>>>>>>>> this parameter is NULL, then we fallback to shmem_file_setup().
>>>>>>>
>>>>>>> One strategy for reducing churn, and so the number of drivers 
>>>>>>> this patch touches, could be to add a lower level 
>>>>>>> drm_gem_object_init() (which takes vfsmount, call it 
>>>>>>> __drm_gem_object_init(), or drm__gem_object_init_mnt(), and make 
>>>>>>> drm_gem_object_init() call that one with a NULL argument.
>>>>>>
>>>>>> I would even go a step further into the other direction. The 
>>>>>> shmem backed GEM object is just some special handling as far as I 
>>>>>> can see.
>>>>>>
>>>>>> So I would rather suggest to rename all drm_gem_* function which 
>>>>>> only deal with the shmem backed GEM object into drm_gem_shmem_*.
>>>>>
>>>>> That makes sense although it would be very churny. I at least 
>>>>> would be on the fence regarding the cost vs benefit.
>>>>
>>>> Yeah, it should clearly not be part of this patch here.
>>>>
>>>>>
>>>>>> Also the explanation why a different mount point helps with 
>>>>>> something isn't very satisfying.
>>>>>
>>>>> Not satisfying as you think it is not detailed enough to say 
>>>>> driver wants to use huge pages for performance? Or not satisying 
>>>>> as you question why huge pages would help?
>>>>
>>>> That huge pages are beneficial is clear to me, but I'm missing the 
>>>> connection why a different mount point helps with using huge pages.
>>>
>>> Ah right, same as in i915, one needs to mount a tmpfs instance 
>>> passing huge=within_size or huge=always option. Default is 'never', 
>>> see man 5 tmpfs.
>>
>> Thanks for the explanation, I wasn't aware of that.
>>
>> Mhm, shouldn't we always use huge pages? Is there a reason for a DRM 
>> device to not use huge pages with the shmem backend?
>
> AFAIU, according to b901bb89324a ("drm/i915/gemfs: enable THP"), back 
> then the understanding was within_size may overallocate, meaning there 
> would be some space wastage, until the memory pressure makes the thp 
> code split the trailing huge page. I haven't checked if that still 
> applies.
>
> Other than that I don't know if some drivers/platforms could have 
> problems if they have some limitations or hardcoded assumptions when 
> they iterate the sg list.

Yeah, that was the whole point behind my question. As far as I can see 
this isn't driver specific, but platform specific.

I might be wrong here, but I think we should then probably not have that 
handling in each individual driver, but rather centralized in the DRM code.

Regards,
Christian.


>
> Te Cc is plenty large so perhaps someone else will have additional 
> information. :)
>
> Regards,
>
> Tvrtko
>
>>
>> I mean it would make this patch here even smaller.
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>

