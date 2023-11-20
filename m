Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534B17F16BE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 16:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAAC10E407;
	Mon, 20 Nov 2023 15:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E4510E405;
 Mon, 20 Nov 2023 15:08:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6fsT7U/Mm0Wuplpqn/0Tq4TT4jJhR1/lbIIujIYBoU24tBmKITlBLSKKdo6RI0+qBErRoQOB2iLzSGk+FZYEzGNZ2g0pB5LCqpEBVPe+iJAgpXOrJOf3czfh+5IyLtjpfd6taX540RUQR18Fd8oqWwLfl9LNH/uZ2Oci96hZW0weWJmwK12qurQM4SeVn8MNnNiUjM+Zo+fTlcX+fKlOgVMpSdM8TEPVYZeDBRSgvhdALX6ZAPxBuOQ+6UUECFEEBFZ+vDcC3MobH63/aPoKVj78MkvUSYvthuNUtxltnlKKbBLCq4kqUJg/ow4RUzS55XJmQOIirs+lMgqCYIqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35aOIxJNmyPKG1q9EpJg4B4C8aH9gBBCnsWMiMY6Arc=;
 b=nHA4lT1sQEwCJmC9q5PGAGK1x7lGKAj4LiB2CM+euj0q6cipaY+1UNqzkEgF8TwGzqMnNFTr6hQJBTMjR58MFv2BwTLq9Ko0OTBzJaaIZYxTqfltuNHKCx6wrZ7PvMPdAjNS4tBJb3DDHli4YT2CpZwi2i+19mNDPghOoYmiK/8Vlj32GNLkrQ8SS/8Fbkdu4omIqUvws3hOVFZKgtBYgs6tpNcFySREzP9FkdoIzoJtIEOQ3HJGMcYOY2IjA1yXD4SQdGT8Uant5l+101Tcv5FGAhDJQWYaPbZ1yFywm9taWxQfgs83FEf3/BM4PSK2NVz5LxxiRcSzIOCDUyVsvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35aOIxJNmyPKG1q9EpJg4B4C8aH9gBBCnsWMiMY6Arc=;
 b=4OCJyQQW2Po4EdUXU7mspzLWfpzxomQRFMFlmgJEn4Tbu7eE3LROtZw0JMAGZxJlpUJSgwrYWJaTPaoUyHuP6fJakypnVDwdxQGPAtyTRAW9uGZFporYGByMeBxuSSA7hfjl+fGiGCi/prUlJrQaQBkDLUxqEAjDt57UZ/4bJiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7014.namprd12.prod.outlook.com (2603:10b6:303:218::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 15:08:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 15:08:39 +0000
Message-ID: <b799f3c4-081d-44f1-a49b-ad298451f479@amd.com>
Date: Mon, 20 Nov 2023 16:08:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 9026317a-acda-4f8b-a329-08dbe9da9346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4wVg9WYjuNMMk10AOILIf/Xgn7mjNG/48Ef46qadViJVEkmiO1DIFj5B3tggwkPuWzX+pBc3OQbNuzVD6hWYJQlmKcH0fF7OPd3zLZSR2o+VuwvCRiWCnVr4RDzfq2fIb1v6c0qqRp5bkjUJWK7mU/AqmJr3eHxIsGAqxrzDKgY8w0HTRO1aik8YcXFmxG7YIFgmLUSgIzVTCL/KDohwVJ6hprET6ETRIVOd2zdNBkphDI811q2L7LtV1ganw9PWkte1Mkg0MyomCa4W3qSeBWzEVBDy2WedD8N9qruVtn6iUKoZuFptHMRagX14oznm7Bfy7pCNARH4f7AbD2LdW3VGcVkfHtQ0Dv5E94gMZ25/1wofrd8v01avkp9c0vW3eIoMDvZIJ2K9oBx+oejmZyTJCvgcTtEZLK5uk2J0gJjR6eBtxmspT0hW9Clsb4z0jPpnUIL4KH7HTWFLe9n+mNHdw2sA0JlIBcRoOqvkDn15rCQMzfHQeAkCcsJb9qF/7p6osrj6mN8iPruQymB8Zq/pJmPUvkWjAaqpqtBVFBxO9enPhcsgL7+hDQrMd//CWL4mogWzUHb3P2pStei7k+K6Q8Z5z4HvXIcjY2Qroi6oV9t1Jxlythg2te8SkmjS1w16P1X11yaIBjqkv9u7fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(36756003)(86362001)(5660300002)(31696002)(2906002)(31686004)(6512007)(26005)(66574015)(2616005)(478600001)(83380400001)(6486002)(6506007)(6666004)(38100700002)(110136005)(8676002)(316002)(8936002)(66556008)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUtaekpCK0QrLytWUjhIdlJVVDNvc0Y1UlBQTUhuQi9uTnYzNUdlTEFITnp2?=
 =?utf-8?B?QXBNTVF0K2lDeXhoQUNBdithajB0dkJkSUpXV3VEM0ZuU3NTdlNPM2hGeHFD?=
 =?utf-8?B?M1pPVnN2N3JmY2tqZHVyY3F2ek1rMGpsa1NhbWJLYlRYVEUvMTZuMWZkd2hy?=
 =?utf-8?B?QjhSQXkxdk10a043YnhzRDFmclBzQUdzTUJKRC9oNnh2NElydXUySmQxclZE?=
 =?utf-8?B?V0pmT1FHTzhwNE41bGVlOHB2YlFNUnc3bnJzaEFHWnBvK0RtWUNoRlQrR2Q3?=
 =?utf-8?B?bUQzanJlTDZWVHJYeDRleit3b2Vhd3c5bC9ITk9FclBGWjJrVlNhcUdqK1l3?=
 =?utf-8?B?T3NvSDB4ZUZBZTZrTDNwWnpGSGhlanF5ZWc3Mjh6ZHRUaTlwUU5IcDFNbFJi?=
 =?utf-8?B?UlFnVkhyRStLcjhINm5TRk5vNnkyWnVFNW0zek00Z3FXZGhDdm44SmdtRlRB?=
 =?utf-8?B?NkxwSTArN3NrZ1dObEYxdEd4YXZ6cGdkLzMzK3lFNnJKMW9EaFQ3ZEg0S1JU?=
 =?utf-8?B?UDlMb3BJWGNwYzRHcUNPWGhaMkJQcElwa0xLVjVMVDFDYlV4dUM4RjNEZWZD?=
 =?utf-8?B?U1dZdTZ2VzRKeEFXQXNORWVPbVdjeGZ4aFhUUWcxZWtXQk5UNHVpaU92OTFi?=
 =?utf-8?B?Sk5HWlNZWUxINjFpK1RnK0MvL2MvMldSMFVMbUZYQzR4NG5WMjJuVFoxdGta?=
 =?utf-8?B?MUNNTTFEQXJpOHZja0Z0aUxmZ1ViZ3lPVzUwZGY5TFFxbWQvaThqSHNib3pk?=
 =?utf-8?B?eXJETzFvZ1V3ZTgwN2h4WlZrVDVkaXhvRFJ5VTNZNzI4UXU0aWp1dXdTbEgz?=
 =?utf-8?B?ZFdsTkJ3b211QTN0NmxucW9qZnRENUJUUmZqcjNCYmRmMnRpNGllOWtoK3o3?=
 =?utf-8?B?QU5rTFZlbWZHSDMyUHdDSG8vZGV0UEFyaEF0aTFub2hiQzR1YXNIbWZmK3Fk?=
 =?utf-8?B?Qm9SbEF5SUlGMmEvb0NHRmM5Z1ZzcVRKdDZCZzcyM1NrcVE4ZVlRcGxVMHhm?=
 =?utf-8?B?UWI3d0RIZVlETFRqNjZQOU9hR2RCVlhZRnhVOStVMnM2b0VVV3U4Tm1BUENn?=
 =?utf-8?B?MnRpUzE4U0w3dlFhbkw5UnZpNmxLOHM5OTRzMUt1VXZKLzVrTWE2M0V5bkE4?=
 =?utf-8?B?ZWpabTAxbXhQdEZrakU3cktpOFpvRmhGbitCSkpWSmZuRjJIYmdINUNEYmZS?=
 =?utf-8?B?ajBqL3FoY0JiZThHdnZZcUFiRTRNQmpRR3drU0ZoU2wwTUthR3EvOW5lSU1Z?=
 =?utf-8?B?TG5PS0R6M0krcTdzOHlTUDdraFFJZUpsTkZyN2EyUVdUY28xUWw3YzVuZjRR?=
 =?utf-8?B?dUh6enVHTWkybko5NTVLR1Ewak1odnJYY0ovc1VWOWVicUg3dkJUUkhNajJt?=
 =?utf-8?B?MnppMjdGclZqb0c0NHQ0MWttS25uVDNOQkpNbDFBaUtMRnVUdFBGejh2SHZn?=
 =?utf-8?B?dXUvejFpUVRxYVN0WlBUS3F0Q1kzRnltMTZCcUNjY1dqcEpFOHc1RXFXb3Vz?=
 =?utf-8?B?NlZoTS9Cek1qWThkV2pGRmdvYnJ2OHFuYXU2OVFEejg3R1haQk5lRFpaclBG?=
 =?utf-8?B?MWhOcENObHJ0ekdqMnpwK29QdkhQZjd5OEpIOTlhZ29Zb2lXSFp5bzNJRGxi?=
 =?utf-8?B?R3o1VUFyd3VTZ2lzcUdzUVlMakRabUEwYU5zMHpSeWVhcHZQanRjVzhkNG1C?=
 =?utf-8?B?NXpzaTRIUEw4bUVxemFTTHJtaTlwdSswdis3NjViR2w0TldqNFk2UVJLcUE4?=
 =?utf-8?B?UmRKZ3lneWxKT1VXRzhSbm9GWjA4T2VUNXQ3U1g0dXlNZTgzb3JiTFl4ZFVU?=
 =?utf-8?B?eUQ0WmFNdHJwZzNURkdpVXJ0bnRFb2hBaHN1ZGFVZGVSa1NSdnJtWlAzWlBY?=
 =?utf-8?B?MzlCZGRaUkFGTzdUaG5TZE9NZEV5cVFhRGJKaWRkT1JTaFpZWm5LOXZZWXFj?=
 =?utf-8?B?akozK0g5Rnc1aVdkUXZRYzRacmlZVGVUZCtaa0MzL2FHTmJvOU11TE9TeXJy?=
 =?utf-8?B?MXJCZTN3ZlExb3kwYnJkK0wydjBoVVozYURLOEZkQk9WZUJYdXpuc0lVbjFF?=
 =?utf-8?B?aUhXc2lQblhRRHVzYVZKMlVTU0lOS3JsTnc3RXJ6aTVWUHdJQWdBR0Uzc282?=
 =?utf-8?Q?ge5s=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9026317a-acda-4f8b-a329-08dbe9da9346
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 15:08:38.9336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsS+K5AqSrzaFIw+l3yVBUzgAwNaRsrsLf3q8RERw0Gn3ivvoAqpIJTmQCoiUwJk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7014
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

Am 20.11.23 um 12:54 schrieb Thomas Zimmermann:
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

No, the problem here is that the KFD code wants to create DMA-buf 
exports for GEM buffers but from a different file descriptor than the 
DRM render or primary node.

Essentially the KFD node is a separate file descriptor AMD GPUs came up 
with for supporting compute.

Regards,
Christian.

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

