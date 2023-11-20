Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6AD7F1727
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 16:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6208610E41A;
	Mon, 20 Nov 2023 15:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605D110E417;
 Mon, 20 Nov 2023 15:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0WJKzc38rc+LU3IDsBZlPk40Oo870tRQom3fwW6MPYUeOW7YILjeaQZWyGoG6U2RLMELLCEBcEX7GicIn4vmYDf1AZncncdwCMSJlspQxWT0lqGorz9xjDV4bWA/GiAasPqnnDNbTEkCkSDHeJUQemoNVhocgq4IH6ZF5IK95xpab2G7DQXXRnSbQTThOUZcNCqwXMlgoAzZ/bJBW13LrNXTtlVMoGqkjacI+2D+lu/jVifF3dWpuzSBEzm7gwB2hZR+Mx0qzYMfbHw9gfN6CJnp0spnyVtjdU0aN3NSrg8oTtXRrBQDcdfpLPSIIPWo+Oei1bFqMxeXLk95aUcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne7cDQJPc9DvJW3x5XM2rqM08MA829YWXv1bBr1hUDg=;
 b=nGWtR5z7+TMsCJwvY9aE1041eVdt0me/rgixBv+05wK9wGn2yPd4Oglj8CzHy3TltRNAS0y0c80n+8jXMSEzAMN0FK4zRqU7sGQaZzTTKqFNtW58G7Kmgb7CEVZsJLKKn9ZNcBgTTCiQzReG0VtpNt7qJJUrruldKWP2S1wpFPgDEKJDbcr7ASaRkEwo5H/LJsn4ZL5LIM8hIYF37zk56/Cht6Yq3w+a2cBRvCTNsJq9WaEq3LiW61t5n2+/MfDAUIivN3CANdsYTRhGZd71rkPEG0th68mn6MUBLiYaam4vWmiqlY9KO1s4E+JDGKAdXmw81kBCWRiPBzJtohUJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne7cDQJPc9DvJW3x5XM2rqM08MA829YWXv1bBr1hUDg=;
 b=O0L9G/9o+7Dw0LXg54a5j++lq/b1Yg1fhigzDIHNppUDFSan7XUND3mTiwbbHz8WZQ4k/XjoalFcPIqfZVVJHzV1e4DS4v+2/dVpyJgQbAlBsTP+yFucOUcfdeH5DD1JfJhNouzWkgBamCec/xzVxzuE+H0Afnw7MKL/9TZkolw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 15:22:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 15:22:30 +0000
Message-ID: <c4e5254a-6c69-434a-8128-dd140ddba623@amd.com>
Date: Mon, 20 Nov 2023 16:22:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
 <7501fb58-9f34-4410-b529-c01e2e45e019@amd.com>
 <86a843ed-d286-4da0-9fa9-b777d783982f@suse.de>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <86a843ed-d286-4da0-9fa9-b777d783982f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 366286b0-1c16-415a-c210-08dbe9dc8336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UdejP+HMQL3DlHxTZADVlGIDHJVcF2UGR2JAIHyfZe5CykCMt6krG7QKQcs+lBomsFqRj56tLyn08WYFrIRK/26h/fk/7WfyIMCsvTLa2AJPgtOcHdGSFF2iv4EP+EQOn4u1lZPCeiYFIT2dwVH2+Uc4jxDquNBC3dJ6+/s5/MT8/eErffwLiweWM24jmHYEgODqMOYuV0rGMHEhpyasiaCJIReCHfsLV1Ds/OiFcNdB1T4qb4upPcUOOxmQMmCnCRZAkflfZDLYrROh5fIySAvbogwD0jIDsP1fs4PzqDVeJOGUB/w+zGer0QdFIDt6wE+HjQRvp4AjjkrSwBD/lohJ9XlyU3pnOSA237c/VtwXrOop3TG44rcwpMl4Bl8fWNT5mC78X+jPbgSQ79awS9qx9sNtJaL+8P6GMSEFWStYV5mtznB5vEvh69Ii6soEFrgy0tGuUiry85fatnU0PlakqduDAAMINmi0gdlArivkM3+rLtktzRD6L3QwFkfx5IsO1sS/wpxKOBN2LGIHViZK6kBPuSXNgUrdK6p+bbAi5qVtbrWsXOHnnbYH9OvOrEOL51dYyJLjRCNtEniPwtdHDsmMZuFcM1W9MeSTXvrBn3c+6rmcVmF0PkXjq7fHCljurf/p3HXl69ELvoN8hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(86362001)(31696002)(5660300002)(8936002)(4001150100001)(2906002)(41300700001)(8676002)(36756003)(110136005)(66556008)(66946007)(66476007)(316002)(478600001)(6486002)(38100700002)(31686004)(53546011)(83380400001)(66574015)(26005)(6666004)(6506007)(2616005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTJuTjVSVXdGdFR3TzBKV0Rmb2NpS3pBMi9FNkc0NHdZVjN4cEtZT3FIU2Fn?=
 =?utf-8?B?RlBRZEkwRUd6UjBxSVB1Z0duSkhSK0VVcEN2VkYwT1VLc0h4VU95U0VCWm1R?=
 =?utf-8?B?VHBXRlpZcnViSlN4QlBadm5CMUk4YzVnaytDN0tHdXRZZHVHeWFRSW0xYUQ3?=
 =?utf-8?B?OThmSk1EYmpLbEFmU1ZyT0FFWUVsaE5mQWNZb0h1NDVZQ3JobVFFL3dMUU5L?=
 =?utf-8?B?K3QrZmRGeGRoZjRDeXdIdXJYc2lBb3dBTnFFcTc0OVVSdUN3cFlST2d3NGkz?=
 =?utf-8?B?VlhLSmtyNHQvNXg5dDlzRFZBMkxKV0ZXREVBNkk2TTdwUHoyUlF0Y2NnS1dw?=
 =?utf-8?B?ZWVXMUY2dThZY0Y2TUxLVzhRM3pqa05iQTRma1JSZTFZMGxWNmVXUUFITDMz?=
 =?utf-8?B?cVNVcmtJd0VaM3hyTFVUNTF3Rzg0Vit1d0thMkFYMXNVVDVYU3JEbVVodDc5?=
 =?utf-8?B?aWp1T1k0VTNnMHN5cnNidjNjdnE0SXAzN1BialdnbHl4YklEMlFmZ3lRODNi?=
 =?utf-8?B?MFZvci9mOWdXLzlsRU02L1R5a0Jwb1BtNzdpWjJ4NGF4bUUxZHFtYmpGUGg2?=
 =?utf-8?B?c1V2WnN4Q3NLWU1aTTk5c0xscEF0ekZ2a0dnTnY0UHRiSmFqRUtvZ2FHSFk4?=
 =?utf-8?B?V2dRbGtPb01lOEVrQnBSZWFiMHdNUng1a0grcXBvMDhESG8rcE9BZkJST0ZH?=
 =?utf-8?B?b1pGM2d5U1BQUnlrUFJaNjU3ZHZiK1pRekxMREs1YVZEelNjaXBQSWtkK3dp?=
 =?utf-8?B?MVk5d1l3MkQ1cmZaNGgyNFhKTTB3NjkyWnVhdS9JQmJMd2hQM0VWTDdzM2Z2?=
 =?utf-8?B?Q0RaaXUxcFpna0ZEOUgwWU5TVGYwZlZteHA3KzlWRVVZdzZ6TDhZeTRQeTMw?=
 =?utf-8?B?a01udkZYQmpBNHZFY3hqWXRkNkgxeWhRY2JkTGF5bS91cS9TUkZCcHQzcFJj?=
 =?utf-8?B?Yy9MWmFoSE9oRDl0RW1LRk1qYjhpb1I5MkFxTnhXSlg5VGkveStGem9pUmVE?=
 =?utf-8?B?eG8ySmtLclpyZ1p5dFYzbndnVUNoZkRYdGUyUldodFFpbUtLVUpHVmhqODZm?=
 =?utf-8?B?Q0FPaEs0ZGozNTVFRW5WeVNDdnFETzJWc1AvK3pKbHVYbUVuRkhQZFEzZ21h?=
 =?utf-8?B?L3h3Y3hLeFc5QWJwL3BNc002TzFXTXZHYlN2OGc4YUVzTUphTlRIQXRaeTRH?=
 =?utf-8?B?dXJlL21nL1Q3emlGSUJzMkRLbEY1STJNWERiaVF2UmRkbFBqY3R5MEhTSXZP?=
 =?utf-8?B?NTR6NlB2K2wvem9PczNFOVhmMU5NckIwLzJHejJpNEZjTXQxcXVsSnd6SDJX?=
 =?utf-8?B?MC81YzkrNGoyZDhqTlZqbHJBMkgzWTFRdHhUUnk0VzkwN05laUxUN3Btc2kr?=
 =?utf-8?B?anZWelZnd2VyTVVPT0k3Zkw0c1BmdjRkVGNZdkRBNFRqOWZpN2poVitIZXl4?=
 =?utf-8?B?NjhHTllPQ2tCbzh1Mmt1Y2RiQUlvMHp6azl3NDhPN3M2SFlFWW5xVjQzeGUw?=
 =?utf-8?B?alVHZ3RGaVlITG1yTEI5a3NHOEwyYjZ0c3VIaDhucGY4WERxMjcvM3JGOUJK?=
 =?utf-8?B?UXpIOVByYlY1ajZEdFd6QzFqZXpqemNkWWEzU2VSYmJldUZHbzhuNHpGelEw?=
 =?utf-8?B?MzhSY2tDUmlUM3g4T2dIZkhUNjZNL3UvSVIyRWRFQzEwc3h0K2IrWnhCNC9n?=
 =?utf-8?B?UnRDbVFta2k2Y3Ruc3NHdmVWNHVRZ2pzdXc2eDF6QVYxbkFLY2hyMVpxTDFh?=
 =?utf-8?B?eGN5N2psQlhGQk1uNHVMUEVUUzRwZjd2cnZZb2ZZZk1hMjBrSUQwYzhQNWZF?=
 =?utf-8?B?Vlo4TUwwQWpvY0luclcxczdHVWRWdm1mdW03Z25iTXJZYkZkWlkvSDJ5WGYy?=
 =?utf-8?B?amlmOWIwbkYzZ3JYbEROWVR4L2FkUW5JRElZMU15VjZ5WVlhY1EydXlGZ2N3?=
 =?utf-8?B?R3RqN3VZYms2Z0U2UGhPWFMxWGpwYnZtbnl5ZEhMSndNWFlGUWlBa25XT1gr?=
 =?utf-8?B?Z3JTY2R1MkdrdU1BQTF4UWZnaFRGVmJ0ZmlvdUJxelJLbkxTWjZONEM4VGd5?=
 =?utf-8?B?LzRlZmZFT0VaSG1lTzdLVjhaMFZ6Sy9GRDJOZ1FUM2pkeGFNa1lHbDZUUUNE?=
 =?utf-8?Q?kvD/uro+IajHRyV+RpYa/qdQo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366286b0-1c16-415a-c210-08dbe9dc8336
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 15:22:30.8901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/Dl9U9m00XPJ1mfabFUWupwcLNRmvUZKB1N1VaeJEGfS758DpJvZsUJwDmZSo5n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8773
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

Am 20.11.23 um 16:18 schrieb Thomas Zimmermann:
> Hi
>
> Am 20.11.23 um 16:06 schrieb Felix Kuehling:
>> On 2023-11-20 6:54, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 17.11.23 um 22:44 schrieb Felix Kuehling:
>>>> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>>>>
>>>> These helper functions are needed for KFD to export and import DMABufs
>>>> the right way without duplicating the tracking of DMABufs 
>>>> associated with
>>>> GEM objects while ensuring that move notifier callbacks are working as
>>>> intended.
>>>
>>> I'm unhappy to see these functions making a comeback. They are the 
>>> boiler-plate logic that all drivers should use. Historically, 
>>> drivers did a lot one things in their GEM code that was only 
>>> semi-correct. Unifying most of that made the memory management more 
>>> readable. Not giving back drivers to option of tinkering with this 
>>> might be preferable. The rsp hooks in struct drm_driver, 
>>> prime_fd_to_handle and prime_handle_to_fd, are only there for vmwgfx.
>>>
>>> If you want to hook into prime import and export, there are 
>>> drm_driver.gem_prime_import and drm_gem_object_funcs.export. Isn't 
>>> it possible to move the additional code behind these pointers?
>>
>> I'm not trying to hook into these functions, I'm just trying to call 
>> them. I'm not bringing back the .prime_handle_to_fd and 
>> .prime_fd_to_handle hooks in struct drm_driver. I need a clean way to 
>> export and import DMAbuffers from a kernel mode context. I had 
>> incorrect or semi-correct ways of doing that by calling some 
>> driver-internal functions, but then my DMABufs aren't correctly 
>> linked with GEM handles in DRM and move notifiers in amdgpu aren't 
>> working correctly.
>
> I understand that. But why don't you use drm_driver.gem_prime_import 
> and drm_gem_object_funcs.export to add the amdkfd-specific code? These 
> callbacks are being invoked from within drm_gem_prime_fd_to_handle() and
> drm_gem_prime_handle_to_fd() as part of the importing and exporting 
> logic. With the intention of doing driver-specific things. Hence you 
> should not have to re-export the internal drm_gem_prime_*_to_*() helpers.
>
> My question is if the existing hooks are not suitable for your needs. 
> If so, how could we improve them?

No no. You don't seem to understand the use case :) Felix doesn't try to 
implement any driver-specific things.

What Felix tries to do is to export a DMA-buf handle from kernel space.

Regards,
Christian.

>
> Best regards
> Thomas
>
>
>>
>> Regards,
>>    Felix
>>
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>> CC: Christian König <christian.koenig@amd.com>
>>>> CC: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
>>>>   include/drm/drm_prime.h     |  7 +++++++
>>>>   2 files changed, 25 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>>> index 63b709a67471..834a5e28abbe 100644
>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf 
>>>> *dma_buf)
>>>>   }
>>>>   EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>>   -/*
>>>> +/**
>>>>    * drm_gem_prime_fd_to_handle - PRIME import function for GEM 
>>>> drivers
>>>>    * @dev: drm_device to import into
>>>>    * @file_priv: drm file-private structure
>>>> @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>>    *
>>>>    * Returns 0 on success or a negative error code on failure.
>>>>    */
>>>> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>> -                      struct drm_file *file_priv, int prime_fd,
>>>> -                      uint32_t *handle)
>>>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>> +                   struct drm_file *file_priv, int prime_fd,
>>>> +                   uint32_t *handle)
>>>>   {
>>>>       struct dma_buf *dma_buf;
>>>>       struct drm_gem_object *obj;
>>>> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct 
>>>> drm_device *dev,
>>>>       dma_buf_put(dma_buf);
>>>>       return ret;
>>>>   }
>>>> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>>>>     int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void 
>>>> *data,
>>>>                    struct drm_file *file_priv)
>>>> @@ -408,7 +409,7 @@ static struct dma_buf 
>>>> *export_and_register_object(struct drm_device *dev,
>>>>       return dmabuf;
>>>>   }
>>>>   -/*
>>>> +/**
>>>>    * drm_gem_prime_handle_to_fd - PRIME export function for GEM 
>>>> drivers
>>>>    * @dev: dev to export the buffer from
>>>>    * @file_priv: drm file-private structure
>>>> @@ -421,10 +422,10 @@ static struct dma_buf 
>>>> *export_and_register_object(struct drm_device *dev,
>>>>    * The actual exporting from GEM object to a dma-buf is done 
>>>> through the
>>>>    * &drm_gem_object_funcs.export callback.
>>>>    */
>>>> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>> -                      struct drm_file *file_priv, uint32_t handle,
>>>> -                      uint32_t flags,
>>>> -                      int *prime_fd)
>>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>> +                   struct drm_file *file_priv, uint32_t handle,
>>>> +                   uint32_t flags,
>>>> +                   int *prime_fd)
>>>>   {
>>>>       struct drm_gem_object *obj;
>>>>       int ret = 0;
>>>> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct 
>>>> drm_device *dev,
>>>>         return ret;
>>>>   }
>>>> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>>>>     int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void 
>>>> *data,
>>>>                    struct drm_file *file_priv)
>>>> @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>>>>    * @obj: GEM object to export
>>>>    * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>>>>    *
>>>> - * This is the implementation of the &drm_gem_object_funcs.export 
>>>> functions
>>>> - * for GEM drivers using the PRIME helpers. It is used as the 
>>>> default for
>>>> - * drivers that do not set their own.
>>>> + * This is the implementation of the &drm_gem_object_funcs.export 
>>>> functions for GEM drivers
>>>> + * using the PRIME helpers. It is used as the default in
>>>> + * drm_gem_prime_handle_to_fd().
>>>>    */
>>>>   struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>>>                        int flags)
>>>> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>>>    * @dev: drm_device to import into
>>>>    * @dma_buf: dma-buf object to import
>>>>    *
>>>> - * This is the implementation of the gem_prime_import functions 
>>>> for GEM
>>>> - * drivers using the PRIME helpers. It is the default for drivers 
>>>> that do
>>>> - * not set their own &drm_driver.gem_prime_import.
>>>> + * This is the implementation of the gem_prime_import functions 
>>>> for GEM drivers
>>>> + * using the PRIME helpers. Drivers can use this as their
>>>> + * &drm_driver.gem_prime_import implementation. It is used as the 
>>>> default
>>>> + * implementation in drm_gem_prime_fd_to_handle().
>>>>    *
>>>>    * Drivers must arrange to call drm_prime_gem_destroy() from their
>>>>    * &drm_gem_object_funcs.free hook when using this function.
>>>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>>>> index a7abf9f3e697..2a1d01e5b56b 100644
>>>> --- a/include/drm/drm_prime.h
>>>> +++ b/include/drm/drm_prime.h
>>>> @@ -60,12 +60,19 @@ enum dma_data_direction;
>>>>     struct drm_device;
>>>>   struct drm_gem_object;
>>>> +struct drm_file;
>>>>     /* core prime functions */
>>>>   struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
>>>>                         struct dma_buf_export_info *exp_info);
>>>>   void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>>>>   +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>> +                   struct drm_file *file_priv, int prime_fd, 
>>>> uint32_t *handle);
>>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>> +                   struct drm_file *file_priv, uint32_t handle, 
>>>> uint32_t flags,
>>>> +                   int *prime_fd);
>>>> +
>>>>   /* helper functions for exporting */
>>>>   int drm_gem_map_attach(struct dma_buf *dma_buf,
>>>>                  struct dma_buf_attachment *attach);
>>>
>

