Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AAC7F188C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 17:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360F710E059;
	Mon, 20 Nov 2023 16:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0F610E059;
 Mon, 20 Nov 2023 16:22:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zbeeu65cgfhCNN8NSP7BIP46PYtmlS46GxISi/rtrajc+nhsWjiwV3wOP4WhQybReCGTJQ97aN+l5kPTxD7I5AfNT35OFuFzL/YQJlr0gQBcPMkFoZ5DHNmTkr9T7RuWM8n+6hr7DiAJYRE1EY2lElXT7GrodH0L+ZFmyAu/pvt3UUlU06OhkW18ZSlcjjcwvco5ieUc9xEN07CbS5x+DI73Ix3NgkSWB3vFe2N1XyBZfun9Pe4yI29R7GVnYUFmTnX2yfA5N9NOIlPeLkBnkuNTOeOk++y2rn7KAAyFntS1Ixg8/vu7kzcfDca/OF6u6ZUIXfQJkXGcCy5ZDWf45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U82BxjxFNDxJXXt8aQA3CwCp5D5vBtikbPb+hMFIdMg=;
 b=ArlLPaOxE8tE/ec8CYX7IVbpEYOHiEfzIpcNeh9PDzEsbRFIEVMC9+J/ul8sLAXv8gwFhWZiB7Y+vvdWi+13ny0s6t2kpEcNzhIWGL2BIyoZRxyxFf5DxPMWHtmCh+dfEf7sQaoG42fhb6tZwroQY5ZuDvakr7kAwTtm84HZ93PYW1CdZlGWehfgXtQEYnTUCMuW6MO4EhyYCNgzgG3vLMhmDNvJDzAKR7tbtTyv5DGzLfDuggitoKj0oJDACeuEBZ9FsZHCuGgOADS63D0UexYCaDkkiPXItcDURpezk58wqEDPFkdfi9pl4i4rbunmmqZ3fhUWH26HxbjwUHECZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U82BxjxFNDxJXXt8aQA3CwCp5D5vBtikbPb+hMFIdMg=;
 b=oFPrh6XTz/wakFHfPv4DNYEliNDanTiP8XnaPK2McINyHrBsDgbuEjddfXv5wBIV5t/kjeoJVOjB/JCFD7H9cpxaoHR3JRq54zVwmE2RgRTNhHKNFwee4+QqmSc2Jp46kTn0pi0C89qg+IPJ+NSLVEZTLeQbZKUAXqpz/nZ0qtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 16:22:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 16:22:53 +0000
Message-ID: <5fee047e-2dfb-450d-839b-01fffb3c01d0@amd.com>
Date: Mon, 20 Nov 2023 17:22:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
 <7501fb58-9f34-4410-b529-c01e2e45e019@amd.com>
 <86a843ed-d286-4da0-9fa9-b777d783982f@suse.de>
 <c4e5254a-6c69-434a-8128-dd140ddba623@amd.com>
 <73722172-69e8-4bdf-bfe3-e7c5bbff7219@suse.de>
 <814430b0-38de-4fd5-9719-a2f7b217cb0d@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <814430b0-38de-4fd5-9719-a2f7b217cb0d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: eb98164f-060c-46d8-a690-08dbe9e4f223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mYATTg4JZz6fWImAN8mxAZLfGRCLVz1f33LYBVKCDcZqRxs6z2yS108asRg1GnydF83OW9rO6vogiyLGFrOJ1tGdc1R7nqN44GSjJlanEtuDE9ISN6HyvXFQPcrB8ZFFsnDk+8RFP9S3PiVRCWZO2nhZ8S0jpQ3m7Fq0iZhsavuwMveVXz3VTkLUAaFc0zyQv7F7w4Z/Z818GQkFaiYBRnALrlBrL/5Rw/Jp6qp8D76CTHVDy9zd6VrJX2H+6bfyAjccchidlJfLeZvwROv9YHGdp+OUQw6jKXwgbabq3jmwzG1K6lJY8tN9nqH39Ph+SP9J1Fv0Y5s4RUXQ/zwVM/odbvUx2Gh17wy1pZtPjWneKPE2qQwP76Juu+qEjo86lJ/gQhaoHgK04gA6C6I0/FKxz8rzmcafbYDq8geQhBTcRQar75+UH8oIQAvnz1wmub1s0jrBX7SvuESqqr8cpAfZpwsPOrrl7r3YhfTf2GWJsU5ECmpGnkygtW1R3Y28CoZvBkqHyTPNMieF3iqh2EH360ENJawM7JsG1R0P3OSeV3O2iMqC5JqMsCWvvfg6guEUxBC+hUD8uuHKutJrRCxvPhRKejJFg8SXYFg4WYnrHjib3B5k8dln6FUVYIgVvVpIaW09MYXfED+pdxod5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(86362001)(31696002)(31686004)(110136005)(6486002)(6666004)(6506007)(66476007)(66556008)(316002)(66946007)(36756003)(2616005)(53546011)(6512007)(26005)(83380400001)(66574015)(30864003)(2906002)(4001150100001)(41300700001)(478600001)(5660300002)(38100700002)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdhSXl1N2ZkQlJhYlpLcFdoOTJLaitHQ25RSnljZnkza0h1NzBpRFV4K2U1?=
 =?utf-8?B?WGhzR1FOSHVubUcrMjlsbWVkZGxIWXNMdXlqOFJIb2FWZDN5WG1QVEpqeFk3?=
 =?utf-8?B?YkFpVXhwNlA1VHd1MHNrcXlRcE1aNUd5QVozUjVEQW5NQ2tST29nVjFhQnU3?=
 =?utf-8?B?d3BzVlBlYzBrVlE0NkZrNElnTmFEYkhyZ2N6Skhsd0p2U1FOQnBvREZNbjY3?=
 =?utf-8?B?VVliOVNRa3piSnMycnFaeE1xd3JXRFVsM2IxS2J5RXVvRng3VTJSMW1RU0Mr?=
 =?utf-8?B?YWMxT3lqamZpekpqbHo0Zm9PV3lqcU94aTVaNENEdTJyZ2hWdG9hREJ1LzFR?=
 =?utf-8?B?S1pTRHk5dTFkT3pBQWRScHJSbEdZMXVrVmwxRU52eTJtMHdXVEJYVGJoRUtl?=
 =?utf-8?B?UnRCOURBUkl2WXF1M1RSdmdaVyt3dlV1NGR3akthdERqOGc1eStQS2ZxTmIz?=
 =?utf-8?B?TVlhN0ZHNFJRa3FVL3krK0ZmWGJMb2VySXAwcWV4RlpVZGRkS3YxOXJWNGxI?=
 =?utf-8?B?NXZoZmM2SG4xVmpvWW9VUC80bTFLa3p5aDNpU1JKS0dIM1AydmNWTzA5WkNl?=
 =?utf-8?B?Q1g1ZFhaWVpzbnlVcU92UHU3bHZqc3UwTHplOUM0RCtpSTJ0Y2o5SE1BUWc1?=
 =?utf-8?B?MmJlcEVIRWZrUWFXMDAva0xrYkNRTDBMb3pzOXVidjRjbEVmTHBsTFJEN21H?=
 =?utf-8?B?K3VsT3pnd1VKYW9oYldYTmVaNzcvNWgvbGhkSlpsUWk3bUhTY3ROVFJxUHJQ?=
 =?utf-8?B?RlBSN0V4R1ZJdXp1NzZObEU4bXlZblJlWkgzZ0M3Ynk3dmhYak81enJxcHFO?=
 =?utf-8?B?NHBZWVJFRWlnT0JMR1VVbFZzZUpiNnArM2RsUEFoUGJuNUhDeUtkTEROMXlO?=
 =?utf-8?B?VXZtK0J1SUJGalVyYy9hUld2R0IrMkdBMGx2L0tBMGJoVjcza2NjMVA2WDRP?=
 =?utf-8?B?aHNJM2l3ZG42QmxlSzd3Qi9zQks0dXRtVzJEb2xJdm81QnNreEl0dy9scUFs?=
 =?utf-8?B?dUJHTE1XRTcyc2U2OVk4TjRaUDI1YkxvYVhMVWQ1Rk1FWjRRRHJDa2htK283?=
 =?utf-8?B?SFd6RG14aG9ROHJsK3N6UE15TFR1eVhsVXREeU9raThVbzBCb0NRMk5kK1VS?=
 =?utf-8?B?eHhUeXlHWlNZUEowZmhWOURTUWxKL0FUcm9tWG9pUUNWa0U3YUlmUXp3cU1M?=
 =?utf-8?B?ZFFlNEgwSjJLTnozOUM0c0VwbWdOQ3JObUgvZ1NGNzYxaG0rbjViaTRNNUxw?=
 =?utf-8?B?SVAxZzJNRlczQmdGWGRFc3JEQkExZStycXdsOWhHWGxuY2pJcVdxbnFOUlpl?=
 =?utf-8?B?ekUyNTBpZit4VUJBMzl1MDF2Y0hlWmY4OUlobmh3bGJWYzVOT0pjekF1S0R0?=
 =?utf-8?B?UGxkNzEySzRsQ3FSUUlZdzZsQTBab2NGYjNrZ1E3WXVMVU9OQzltakJpWDFR?=
 =?utf-8?B?U1FqRzJUbzBaU0VlYVFtaEhML1NBdGc5QzZXc1RNaC9PMzRZRHBzUGZvSUdr?=
 =?utf-8?B?aTk5Q1N2d0d6dkNPMy9NWERRNktES0M1U1h6Yzg5Wlp2MkxyUjRSdGxIRXhT?=
 =?utf-8?B?SVF4UnFoaU41aUhhTVNMMFhYamJCNWNScEJxMWp5aVltbUpUTDg5NUVuQ29E?=
 =?utf-8?B?NG84N2U3QmhhcGZvL1FYN0JrWlp3TGRlbzY2NGpQcVg0RnUrM01kck1wdHFT?=
 =?utf-8?B?TWhMckJsT0xHcytTS0treTl4bGlFOVBCWEtWWTI2am9xWEorZUt6bldjN1p2?=
 =?utf-8?B?SEJPN0dSd25sS2NnMzVhNFA2RURGK3hNMnVUclRkV2hCWWY0blhJMHNvdTAy?=
 =?utf-8?B?U1BCTk9iMzgrMmplR05mV0tja2hpRW92ZEZUanNvcExLV1JBekxpRG81TEdG?=
 =?utf-8?B?QnVzWDFnSzJtbGlzcjdsWnY3em9kWUd1ZGZ3SDcvaklCczhndC9qc3pwUlZB?=
 =?utf-8?B?RURTWmZQT05WenorblhXcUlkZUlka3Fpc0d1TnpsZ01GSzJLWHpNRGcrN0Fw?=
 =?utf-8?B?aTM5RVVnQlVFcFlBZWFWWWwzTkV2K05abHVVa1VIY1hVZ0RoNFZTQ21FMW4x?=
 =?utf-8?B?OFNGZWIwOG4yT3JsUW9rT0EyU1p4and1VDU4ZVVadWlzVjczbWNXc1JvSFBU?=
 =?utf-8?Q?bK+XP1ITCU5zeOCKThOjyZrx5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb98164f-060c-46d8-a690-08dbe9e4f223
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:22:52.9529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6qQ/Nx0V5wN0g+H7gKhRzRtaofY10xKCcVR6D1gCzN070Cg0olkETDrMdBjXoBX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608
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

Am 20.11.23 um 17:15 schrieb Felix Kuehling:
>
> On 2023-11-20 11:02, Thomas Zimmermann wrote:
>> Hi Christian
>>
>> Am 20.11.23 um 16:22 schrieb Christian König:
>>> Am 20.11.23 um 16:18 schrieb Thomas Zimmermann:
>>>> Hi
>>>>
>>>> Am 20.11.23 um 16:06 schrieb Felix Kuehling:
>>>>> On 2023-11-20 6:54, Thomas Zimmermann wrote:
>>>>>> Hi
>>>>>>
>>>>>> Am 17.11.23 um 22:44 schrieb Felix Kuehling:
>>>>>>> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>>>>>>>
>>>>>>> These helper functions are needed for KFD to export and import 
>>>>>>> DMABufs
>>>>>>> the right way without duplicating the tracking of DMABufs
>>>>>>> associated with
>>>>>>> GEM objects while ensuring that move notifier callbacks are 
>>>>>>> working as
>>>>>>> intended.
>>>>>> I'm unhappy to see these functions making a comeback. They are the
>>>>>> boiler-plate logic that all drivers should use. Historically,
>>>>>> drivers did a lot one things in their GEM code that was only
>>>>>> semi-correct. Unifying most of that made the memory management more
>>>>>> readable. Not giving back drivers to option of tinkering with this
>>>>>> might be preferable. The rsp hooks in struct drm_driver,
>>>>>> prime_fd_to_handle and prime_handle_to_fd, are only there for 
>>>>>> vmwgfx.
>>>>>>
>>>>>> If you want to hook into prime import and export, there are
>>>>>> drm_driver.gem_prime_import and drm_gem_object_funcs.export. Isn't
>>>>>> it possible to move the additional code behind these pointers?
>>>>> I'm not trying to hook into these functions, I'm just trying to call
>>>>> them. I'm not bringing back the .prime_handle_to_fd and
>>>>> .prime_fd_to_handle hooks in struct drm_driver. I need a clean way to
>>>>> export and import DMAbuffers from a kernel mode context. I had
>>>>> incorrect or semi-correct ways of doing that by calling some
>>>>> driver-internal functions, but then my DMABufs aren't correctly
>>>>> linked with GEM handles in DRM and move notifiers in amdgpu aren't
>>>>> working correctly.
>>>> I understand that. But why don't you use drm_driver.gem_prime_import
>>>> and drm_gem_object_funcs.export to add the amdkfd-specific code? These
>>>> callbacks are being invoked from within 
>>>> drm_gem_prime_fd_to_handle() and
>>>> drm_gem_prime_handle_to_fd() as part of the importing and exporting
>>>> logic. With the intention of doing driver-specific things. Hence you
>>>> should not have to re-export the internal drm_gem_prime_*_to_*() 
>>>> helpers.
>>>>
>>>> My question is if the existing hooks are not suitable for your needs.
>>>> If so, how could we improve them?
>>> No no. You don't seem to understand the use case :) Felix doesn't 
>>> try to
>>> implement any driver-specific things.
>> I meant that I understand that this patchset is not about setting
>> drm_driver.prime_handle_to_fd, et al.
>>
>>> What Felix tries to do is to export a DMA-buf handle from kernel space.
>> For example, looking at patch 2, it converts a GEM handle to a file
>> descriptor and then assigns the rsp dmabuf to mem, which is of type
>> struct kgd_mem. From my impression, this could be done within the
>> existing ->export hook.
>
> That would skip the call to export_and_register_object. I think that's 
> what I'm currently missing to set up gem_obj->dmabuf.

I think we are talking past each other. kgd_mem is not part of the 
amdgpu driver, so it can't go into an ->export callback.

What happens here is that a drm_client code uses the amdgpu driver to 
export some DMA-buf to file descriptors.

In other words this is a high level user of drm_client and not something 
driver internal.

If you don't want to export the drm_gem_prime_handle_to_fd() function 
directly we could add some drm_client_buffer_export() or similar.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> Then there's close_fd(), which cannot go into ->export. It looks like
>> the fd isn't really required.  Could the drm_prime_handle_to_fd() be
>> reworked into a helper that converts the handle to the dmabuf without
>> the fd?  Something like drm_gem_prime_handle_to_dmabuf(), which would
>> then be exported?
>>
>> And I have the question wrt the 3rd patch; just that it's about 
>> importing.
>>
>> (Looking further through the code, it appears that the fd could be
>> removed from the helpers, the callbacks and vmwgfx. It would then be
>> used entirely in the ioctl entry points, such as
>> drm_prime_fd_to_handle_ioctl().)
>>
>> Best regards
>> Thomas
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>
>>>>> Regards,
>>>>>     Felix
>>>>>
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>> CC: Christian König <christian.koenig@amd.com>
>>>>>>> CC: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/drm_prime.c | 33 
>>>>>>> ++++++++++++++++++---------------
>>>>>>>    include/drm/drm_prime.h     |  7 +++++++
>>>>>>>    2 files changed, 25 insertions(+), 15 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_prime.c 
>>>>>>> b/drivers/gpu/drm/drm_prime.c
>>>>>>> index 63b709a67471..834a5e28abbe 100644
>>>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>>>> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf
>>>>>>> *dma_buf)
>>>>>>>    }
>>>>>>>    EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>>>>>    -/*
>>>>>>> +/**
>>>>>>>     * drm_gem_prime_fd_to_handle - PRIME import function for GEM
>>>>>>> drivers
>>>>>>>     * @dev: drm_device to import into
>>>>>>>     * @file_priv: drm file-private structure
>>>>>>> @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>>>>>     *
>>>>>>>     * Returns 0 on success or a negative error code on failure.
>>>>>>>     */
>>>>>>> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>>>>> -                      struct drm_file *file_priv, int prime_fd,
>>>>>>> -                      uint32_t *handle)
>>>>>>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>>>>> +                   struct drm_file *file_priv, int prime_fd,
>>>>>>> +                   uint32_t *handle)
>>>>>>>    {
>>>>>>>        struct dma_buf *dma_buf;
>>>>>>>        struct drm_gem_object *obj;
>>>>>>> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct
>>>>>>> drm_device *dev,
>>>>>>>        dma_buf_put(dma_buf);
>>>>>>>        return ret;
>>>>>>>    }
>>>>>>> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>>>>>>>      int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void
>>>>>>> *data,
>>>>>>>                     struct drm_file *file_priv)
>>>>>>> @@ -408,7 +409,7 @@ static struct dma_buf
>>>>>>> *export_and_register_object(struct drm_device *dev,
>>>>>>>        return dmabuf;
>>>>>>>    }
>>>>>>>    -/*
>>>>>>> +/**
>>>>>>>     * drm_gem_prime_handle_to_fd - PRIME export function for GEM
>>>>>>> drivers
>>>>>>>     * @dev: dev to export the buffer from
>>>>>>>     * @file_priv: drm file-private structure
>>>>>>> @@ -421,10 +422,10 @@ static struct dma_buf
>>>>>>> *export_and_register_object(struct drm_device *dev,
>>>>>>>     * The actual exporting from GEM object to a dma-buf is done
>>>>>>> through the
>>>>>>>     * &drm_gem_object_funcs.export callback.
>>>>>>>     */
>>>>>>> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>>>>> -                      struct drm_file *file_priv, uint32_t handle,
>>>>>>> -                      uint32_t flags,
>>>>>>> -                      int *prime_fd)
>>>>>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>>>>> +                   struct drm_file *file_priv, uint32_t handle,
>>>>>>> +                   uint32_t flags,
>>>>>>> +                   int *prime_fd)
>>>>>>>    {
>>>>>>>        struct drm_gem_object *obj;
>>>>>>>        int ret = 0;
>>>>>>> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct
>>>>>>> drm_device *dev,
>>>>>>>          return ret;
>>>>>>>    }
>>>>>>> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>>>>>>>      int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void
>>>>>>> *data,
>>>>>>>                     struct drm_file *file_priv)
>>>>>>> @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>>>>>>>     * @obj: GEM object to export
>>>>>>>     * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>>>>>>>     *
>>>>>>> - * This is the implementation of the &drm_gem_object_funcs.export
>>>>>>> functions
>>>>>>> - * for GEM drivers using the PRIME helpers. It is used as the
>>>>>>> default for
>>>>>>> - * drivers that do not set their own.
>>>>>>> + * This is the implementation of the &drm_gem_object_funcs.export
>>>>>>> functions for GEM drivers
>>>>>>> + * using the PRIME helpers. It is used as the default in
>>>>>>> + * drm_gem_prime_handle_to_fd().
>>>>>>>     */
>>>>>>>    struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>>>>>>                         int flags)
>>>>>>> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>>>>>>     * @dev: drm_device to import into
>>>>>>>     * @dma_buf: dma-buf object to import
>>>>>>>     *
>>>>>>> - * This is the implementation of the gem_prime_import functions
>>>>>>> for GEM
>>>>>>> - * drivers using the PRIME helpers. It is the default for drivers
>>>>>>> that do
>>>>>>> - * not set their own &drm_driver.gem_prime_import.
>>>>>>> + * This is the implementation of the gem_prime_import functions
>>>>>>> for GEM drivers
>>>>>>> + * using the PRIME helpers. Drivers can use this as their
>>>>>>> + * &drm_driver.gem_prime_import implementation. It is used as the
>>>>>>> default
>>>>>>> + * implementation in drm_gem_prime_fd_to_handle().
>>>>>>>     *
>>>>>>>     * Drivers must arrange to call drm_prime_gem_destroy() from 
>>>>>>> their
>>>>>>>     * &drm_gem_object_funcs.free hook when using this function.
>>>>>>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>>>>>>> index a7abf9f3e697..2a1d01e5b56b 100644
>>>>>>> --- a/include/drm/drm_prime.h
>>>>>>> +++ b/include/drm/drm_prime.h
>>>>>>> @@ -60,12 +60,19 @@ enum dma_data_direction;
>>>>>>>      struct drm_device;
>>>>>>>    struct drm_gem_object;
>>>>>>> +struct drm_file;
>>>>>>>      /* core prime functions */
>>>>>>>    struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
>>>>>>>                          struct dma_buf_export_info *exp_info);
>>>>>>>    void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>>>>>>>    +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>>>>> +                   struct drm_file *file_priv, int prime_fd,
>>>>>>> uint32_t *handle);
>>>>>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>>>>> +                   struct drm_file *file_priv, uint32_t handle,
>>>>>>> uint32_t flags,
>>>>>>> +                   int *prime_fd);
>>>>>>> +
>>>>>>>    /* helper functions for exporting */
>>>>>>>    int drm_gem_map_attach(struct dma_buf *dma_buf,
>>>>>>>                   struct dma_buf_attachment *attach);

