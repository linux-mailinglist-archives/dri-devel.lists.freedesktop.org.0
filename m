Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 551097F16B4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 16:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB00E10E3F5;
	Mon, 20 Nov 2023 15:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF0210E3E5;
 Mon, 20 Nov 2023 15:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsIS/792xwFUKf8UPzChoX0qFVnAAV0tBfi0yjy/aQu/UoH09cGHNk72TUqSqj1jrQbsceSq9rl/9j4QFoSpVte/DX61DamHoCq0yXo+/g/SF+wcxsT3nyI5XCmlZNAX8r9AWZ4fyVAdbXbrX8VgNT+E/zJz4bh8Yef6scbFTm2F3KRhyY2KsKLT3X/Thpo5n7OJ6YGBAElyymIXQ24GUxLHcuCmHTp2Y7mwhCjKgfTDsBMvu/epI8/AD+FzPdmMeJwTanRplU0KpATJWdddqTx3kjOePV5rl0qQUaG9hmJGGtjOc2O8ZrKmPt52jJOBrlQItgphnLV6Omv85BSfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPwWqS0wf7ckFllKh/EgBCr2LedGHOMc3R3g27ZdDyM=;
 b=Gcw+RCFXATfSqYji/W1njjF9ObIeo06NFBkJUuS1kAyDAc1VYtfKFlnhIQ3p8QdnTo7Tl7xV/yzkLAmOMj/rwQpZyXilRQ4bP0VQBHWpiruVDkHU4bPF8hmQZlYAv0DG21ojon+Sg87ggkpYY5NjzUo9ZP1ttLdrINt/wpuxWJEMmkHVUy/6ySnMQf25x5DS6nhZwTws1yCms1xaMSB7aKKPlhQdJlo0ALSthPbKevUPfN6j41i3rNUt8RIrrd+Y+fU35my4tMXJ4Q7f6jcdeSk1TDbhUO7sH8VCQMyAl1yPmuIMHt7jg+SqzPm6IUzkWPCgsR6KpwNU13qOKfbtag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPwWqS0wf7ckFllKh/EgBCr2LedGHOMc3R3g27ZdDyM=;
 b=ICR3MAvMKoNNWSTwKHX565CacDdPig9QEmDnYxGdlw+Rf4HJ8wRYPoInTWNSVGQWiy494z5q9HlRRaJIcWg8AvuP4ptKIxXohCZMJvh0ds/NYadjeihC4QGZPapk5+dCf+Yb33sik1kyvdtX/Kdo0V+YNxnt5SF5h2R87X1fJI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB7138.namprd12.prod.outlook.com (2603:10b6:510:1ee::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.25; Mon, 20 Nov
 2023 15:06:34 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 15:06:34 +0000
Message-ID: <7501fb58-9f34-4410-b529-c01e2e45e019@amd.com>
Date: Mon, 20 Nov 2023 10:06:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0166.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: ac542768-f2c0-4a22-12f3-08dbe9da48ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjaMpYkb8wClJbGSm2FS/4M+SDne7OrCn1YCqh8hmiBeT86y4FYsiy7L0k3q7W1uuq2Heq1RwmO+VPNtqoeIUE7qcmNE32j7njX9H+f/8zbYza6M/e/YqRcDkRi5ny1vnM6ouaNmNxNF2qr11EJRo/bOsviraEEW4tkNsYDbij2iKZ8ZwqJNP6QO80NT5aMLiwmT/n8iEaorZoznHlopzFxGnLwNu0t9ar9/PTj//U73mpOwy3aSoKji7JBzhmAu0PwtZCxAHwJNLseSP00GZs8/UrM9G1y7N+tuPHX09KMrjx+uSvVShdT0xMWsFH/n9XSMrloDBgUxnzQa+TZXMd4XPjCIRFZ+GWCM6iW1UsKqsiT8Y/iNaZjwkKqHpvam1kWY1C72R8ywidLntBv9583qAhENbwaP5Cy9QVsoVHsM9cAZC2GjQU3YSropg/WjihVQq/y6C0NjvY1Flw5BZ0s4YZQ1awmh7WcpNoL0Pb33mFVCeNP/Q1kUT0pLFgNbL+OgLGiHu3bbCKqPMMKu0PQLKl88bJm6NmW7zHsgpMhgLlGlbyeVQCR97VV9j8l8dHJs1sUXHvUR9e4YMT+Qd/vUw8+NbBwwEpMKOCuxz8Gn3NPUw9s8z7JNRvK2dCHxKzyXv+T79MGm01mDE5YMzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(4001150100001)(2906002)(83380400001)(38100700002)(41300700001)(316002)(66556008)(66946007)(6512007)(478600001)(53546011)(6506007)(6486002)(86362001)(36756003)(31696002)(31686004)(66476007)(26005)(44832011)(5660300002)(66574015)(2616005)(8936002)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0h6WXRPQnpwOXd0UndGVTJ4Q3k2d3p5aVhWcFNrUnkrdWQxU1hJS1NQQW1L?=
 =?utf-8?B?WG9aU1kwb0FwWE5EUWZTMDhDTy9ya3JvMFA3NDFGWDRENm5aczUxU3h5KzlK?=
 =?utf-8?B?UzRLdHk4Ti8weFd3cU5MSjB6MGdjOVJTMGx2V3lMTWh4cXp5VTA3Yy92WVcv?=
 =?utf-8?B?RC9FMmZEUzNBTDVSTkpMUmhETDBlZjZUQVdBaE5ZYWVjOGtwTTBvZDd2dW1L?=
 =?utf-8?B?V2FJTVkwZlJUNjZ3SU5MZVhOczAvL3RZNExtZ1ZEWWhOei9mdFB6UkVHNUhQ?=
 =?utf-8?B?VWloZzgyeXRZa1N4K20zQ0kwRWs4YlQ0eCszZnp1V2IxTFMydjhlOEJ4R0Vz?=
 =?utf-8?B?d2M1NnhEVHBBeFE1UnAyZllGWnkxd1d4bzBKNGV6bXJESG42ODE0YTVXZTZq?=
 =?utf-8?B?dkN1N3Q3eG0rVWdZVnN6R2hiT2UzckZXZlVKVmhvSEliNTJCVEk1Mm82YmY5?=
 =?utf-8?B?VEllMis5Wjg0ZFhtL1dHNW5UczZ3WXdYMWlXS1dzR1d1Q21jbWNic08vRzg0?=
 =?utf-8?B?UGtjaVlrWFFaK081WjJKT2svSmozaHV4ekpqVGZkdDJtMkxEWGxLS0hBL1k0?=
 =?utf-8?B?aWkxWUI1aCs5eklvMm5nSmxNVng0NjNsdzZ4RnFVVzNhclJDTVpZS3BWeWQx?=
 =?utf-8?B?SXlqSGt5T1ZMN0YyYndWSUsxRUJvRlpkejlEeStaYjkwNGtHa2UyeUJSU3Aw?=
 =?utf-8?B?TWhoYTFnaCtHUndjMVIrazd4MnI0R0Fhd09GRm1KdkQ5cWZPRHBFd1pFRzVN?=
 =?utf-8?B?cW9RUUpRKzA3Vkx1d3NuQjc0bmJjTXByNXAxL1I3clFnQnN6WDk1UTRtL2Fh?=
 =?utf-8?B?bHV5aU81Zm5VVWl3ZnB1SGlyK1BXTVE1K0xLaDRwT3VSSTdaSTRWV3ZZOTZE?=
 =?utf-8?B?RVlEWTFUOG1ZaE83MFBrd1pqYjJlTGNaRFJWbFZhRUUrTDFKN2ltSVZZaDdN?=
 =?utf-8?B?TGFtN2kwb0U5UVVGekN5a0l4dUFMM3lqNmN1S1lIR2V2cFYwTloxOFdXRlVL?=
 =?utf-8?B?TkUvb1BNR3A1clJPZXhwY256UzZxZWVEdForM1gxQWVIWXd6aUI1MnZ2VCtq?=
 =?utf-8?B?eVBKaE9EWDlsYWNTWEJtcm9JMTlmbTZLVVVXWWRZbUpnNGcrWXhkbjl3d3E1?=
 =?utf-8?B?NFExVnJraFpuTXZobWJvaG90eFY0YVI0Q2JVTTZOek5TZmJ2M1VsUmRTRkhP?=
 =?utf-8?B?U0JzS08yakFYeERBM0pxUnNxWGlSbVduVVNJT3k0VkozL0VMN2t3dE9Qbm9m?=
 =?utf-8?B?RjA4UnZ1ZlkzTnVxbkFScExrUGpybXU3alhLUWhCbDU5OWJydzJNMVdKMlNP?=
 =?utf-8?B?VXhRQTdxN05LZmZjR0FpcVh5WEZ3ZXM5WjRtMzdQUUxpT2g1UTJvQVA5VDBp?=
 =?utf-8?B?c2xVS2h6SC9qaWM0bzhuc3ZZR2xYZk00TDRRK0R1WG1sdzFkd2ExeUJPZE9N?=
 =?utf-8?B?bm9aT3dVbXR5MGlhODJGUFVSUnFPRFZaT0grZ25ZVEJaUkpoN0FLTzZ3TXla?=
 =?utf-8?B?UWQ5NE5uSVdpeURvR2paS1hpbXo3UVBJRU1lWG1pbDFpejdMa1lOSG0xVFps?=
 =?utf-8?B?RC9uMHJ3TUxqRHRmbUxCVmpRcGtzekZmMy9vbCtqODFkVTBmemR4ZERTTmVZ?=
 =?utf-8?B?MWllN1Uwd01iS05qZkJQZDlwbUppZVVUemMyKzlrYmx0NEtGd2tPWVVqYXJ5?=
 =?utf-8?B?eEVGOEdFTmgwSXdGeGM3dXpHSi9YQS9DdjNBMmxrcUZVN3c3NW8vTDZ6N0o2?=
 =?utf-8?B?Qnd4eWpUamt0OE9PYitYd2xyNXFUd05rZ2FDTnplOW82blVaYU83K3VLa1d6?=
 =?utf-8?B?SEdTaFZYd0tmN3JaWkxaQ1FFWnVuNjJ6U2hxK3FMUmNiQWZIZFptSDVwZzdF?=
 =?utf-8?B?dGF5SHlnYkhSaWYzK0dGT01iaHA2dlp3WmN2S2NUT1h2RHJObGlQQTg2L0dl?=
 =?utf-8?B?Mk5aRnpDN1ZaYStoZVZobzRhQTMxWEdweVByL2sxOWh2aEpMajFWSnBLUU5r?=
 =?utf-8?B?VWZSbi80YUpXNGNFdkxXbE9UaHRGZ1ArdklWWFNGTVlrV2xJK3B3SjRneW11?=
 =?utf-8?B?cWdXYnVXRnAySnhKMURRU2lIdm1EdWYrQUtuNkowTnljeHFsWlpRZ0dzM0Zz?=
 =?utf-8?Q?VmxKf7pgU6BDkFqWbO5i6/Jx4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac542768-f2c0-4a22-12f3-08dbe9da48ed
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 15:06:34.0176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFAmXE8K0aRLxHk1QrQNKA5dgTRdKADXAAve9f3dOLl79C+yTALEmxjh1jguHSzS85IR+iSF3Yr0jq8VVd8euQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7138
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-20 6:54, Thomas Zimmermann wrote:
> Hi
>
> Am 17.11.23 um 22:44 schrieb Felix Kuehling:
>> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>>
>> These helper functions are needed for KFD to export and import DMABufs
>> the right way without duplicating the tracking of DMABufs associated 
>> with
>> GEM objects while ensuring that move notifier callbacks are working as
>> intended.
>
> I'm unhappy to see these functions making a comeback. They are the 
> boiler-plate logic that all drivers should use. Historically, drivers 
> did a lot one things in their GEM code that was only semi-correct. 
> Unifying most of that made the memory management more readable. Not 
> giving back drivers to option of tinkering with this might be 
> preferable. The rsp hooks in struct drm_driver, prime_fd_to_handle and 
> prime_handle_to_fd, are only there for vmwgfx.
>
> If you want to hook into prime import and export, there are 
> drm_driver.gem_prime_import and drm_gem_object_funcs.export. Isn't it 
> possible to move the additional code behind these pointers?

I'm not trying to hook into these functions, I'm just trying to call 
them. I'm not bringing back the .prime_handle_to_fd and 
.prime_fd_to_handle hooks in struct drm_driver. I need a clean way to 
export and import DMAbuffers from a kernel mode context. I had incorrect 
or semi-correct ways of doing that by calling some driver-internal 
functions, but then my DMABufs aren't correctly linked with GEM handles 
in DRM and move notifiers in amdgpu aren't working correctly.

Regards,
   Felix


>
> Best regards
> Thomas
>
>>
>> CC: Christian König <christian.koenig@amd.com>
>> CC: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> ---
>>   drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
>>   include/drm/drm_prime.h     |  7 +++++++
>>   2 files changed, 25 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 63b709a67471..834a5e28abbe 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
>>   }
>>   EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>   -/*
>> +/**
>>    * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
>>    * @dev: drm_device to import into
>>    * @file_priv: drm file-private structure
>> @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>    *
>>    * Returns 0 on success or a negative error code on failure.
>>    */
>> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>> -                      struct drm_file *file_priv, int prime_fd,
>> -                      uint32_t *handle)
>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>> +                   struct drm_file *file_priv, int prime_fd,
>> +                   uint32_t *handle)
>>   {
>>       struct dma_buf *dma_buf;
>>       struct drm_gem_object *obj;
>> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct 
>> drm_device *dev,
>>       dma_buf_put(dma_buf);
>>       return ret;
>>   }
>> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>>     int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>                    struct drm_file *file_priv)
>> @@ -408,7 +409,7 @@ static struct dma_buf 
>> *export_and_register_object(struct drm_device *dev,
>>       return dmabuf;
>>   }
>>   -/*
>> +/**
>>    * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
>>    * @dev: dev to export the buffer from
>>    * @file_priv: drm file-private structure
>> @@ -421,10 +422,10 @@ static struct dma_buf 
>> *export_and_register_object(struct drm_device *dev,
>>    * The actual exporting from GEM object to a dma-buf is done 
>> through the
>>    * &drm_gem_object_funcs.export callback.
>>    */
>> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>> -                      struct drm_file *file_priv, uint32_t handle,
>> -                      uint32_t flags,
>> -                      int *prime_fd)
>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>> +                   struct drm_file *file_priv, uint32_t handle,
>> +                   uint32_t flags,
>> +                   int *prime_fd)
>>   {
>>       struct drm_gem_object *obj;
>>       int ret = 0;
>> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct 
>> drm_device *dev,
>>         return ret;
>>   }
>> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>>     int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>                    struct drm_file *file_priv)
>> @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>>    * @obj: GEM object to export
>>    * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>>    *
>> - * This is the implementation of the &drm_gem_object_funcs.export 
>> functions
>> - * for GEM drivers using the PRIME helpers. It is used as the 
>> default for
>> - * drivers that do not set their own.
>> + * This is the implementation of the &drm_gem_object_funcs.export 
>> functions for GEM drivers
>> + * using the PRIME helpers. It is used as the default in
>> + * drm_gem_prime_handle_to_fd().
>>    */
>>   struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>                        int flags)
>> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>    * @dev: drm_device to import into
>>    * @dma_buf: dma-buf object to import
>>    *
>> - * This is the implementation of the gem_prime_import functions for GEM
>> - * drivers using the PRIME helpers. It is the default for drivers 
>> that do
>> - * not set their own &drm_driver.gem_prime_import.
>> + * This is the implementation of the gem_prime_import functions for 
>> GEM drivers
>> + * using the PRIME helpers. Drivers can use this as their
>> + * &drm_driver.gem_prime_import implementation. It is used as the 
>> default
>> + * implementation in drm_gem_prime_fd_to_handle().
>>    *
>>    * Drivers must arrange to call drm_prime_gem_destroy() from their
>>    * &drm_gem_object_funcs.free hook when using this function.
>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>> index a7abf9f3e697..2a1d01e5b56b 100644
>> --- a/include/drm/drm_prime.h
>> +++ b/include/drm/drm_prime.h
>> @@ -60,12 +60,19 @@ enum dma_data_direction;
>>     struct drm_device;
>>   struct drm_gem_object;
>> +struct drm_file;
>>     /* core prime functions */
>>   struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
>>                         struct dma_buf_export_info *exp_info);
>>   void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>>   +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>> +                   struct drm_file *file_priv, int prime_fd, 
>> uint32_t *handle);
>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>> +                   struct drm_file *file_priv, uint32_t handle, 
>> uint32_t flags,
>> +                   int *prime_fd);
>> +
>>   /* helper functions for exporting */
>>   int drm_gem_map_attach(struct dma_buf *dma_buf,
>>                  struct dma_buf_attachment *attach);
>
