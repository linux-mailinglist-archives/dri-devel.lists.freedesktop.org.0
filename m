Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535AC412727
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 22:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132BF89FC5;
	Mon, 20 Sep 2021 20:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2050.outbound.protection.outlook.com [40.107.212.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACE989FC0;
 Mon, 20 Sep 2021 20:05:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFBFbDYyWpdq4Cxqb79jXYUxdnCL4YvhfvHvv2TM8RhEsuJvvg46gG8Jea4tCb28wKvcOMqd3C/o6tyjJHaa+yCOHvwXlIEmeCIDdkUcxt5AfBb5Hx92BP/6QHe/wMJVEDiab04CgQN6yUhj0LmVX/temY2tCpEMjsk6fwwAby6irRgnuRCgPaPwA4vyOAMhLJjd1DevHa4qaAVfGpuvdY6gJO+bNG2Kdr8llUnpr5+ZtyOxHW4ORVE0s3Z8h709SRzoRboFJqFqzts+HNuzkfaIvI+xBg6TVVTupfh9PKK4lp9nV0ELQKKv9k6J6kuOMq64WlmyL1VyrSBLGmAAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=e6QiknsDtDbo16MzY8mXMYYJhjEFtjlG6PbZJmVHPZw=;
 b=m4k0NbtZMBtE3OqWLgFoJlNKZEXIg9xfCPWDeuuLe/xSD4rWhD7W+YZ/aW38oyw4aSU/53t1OKa3JiLsiC3DXnsOfDJUUjRWhVpl73827MVjUNt8QS0Wq0IwnDBGQuC8IQ93DeNxjripdozuKm+bfOMOEJs57BtgYLRGJjAW1MjX047Qt4ZoUA+JvB/2fvsnGAWRfwS8iMG5nsQ1EFqQQErwZlM/ype5uZmVfw+efxAmMDRk2eVyNSj6FglGCpEmRY6wP499mPusqhlrOxDLRChIh/B18HBU3Szcx4LdWmlroLMm6Q+9XvxqgKYbqE+CvyX4k3ur8VxnvUC35PkF/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6QiknsDtDbo16MzY8mXMYYJhjEFtjlG6PbZJmVHPZw=;
 b=5adnuL+jK5hKus77SlJBVQiUpFVDTLJYylryKIBBhglmFLvYhNHkStDmuNzIEaKaiXb+hD2t7sr2T4ezz6UiuwuWrxiBOP3kL5yI78TSIAf/NNUtiJv1tVTty3YdmiYZjfNAXI6Cm+9aCTPUUOxCM2JRkK6b4IIbmWOkETi9RKs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 20:05:33 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 20:05:33 +0000
Subject: Re: [PATCH v2 09/12] lib: test_hmm add module param for zone device
 type
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 Felix.Kuehling@amd.com, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
References: <20210913161604.31981-1-alex.sierra@amd.com>
 <20210913161604.31981-10-alex.sierra@amd.com> <2139200.KYAmxeAneQ@nvdebian>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <729f833c-e880-96ce-5f49-2d72a93faa21@amd.com>
Date: Mon, 20 Sep 2021 15:05:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2139200.KYAmxeAneQ@nvdebian>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:806:27::7) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from [172.31.9.47] (165.204.77.11) by
 SA9PR13CA0122.namprd13.prod.outlook.com (2603:10b6:806:27::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Mon, 20 Sep 2021 20:05:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2b93f99-51f1-441b-2601-08d97c7200d0
X-MS-TrafficTypeDiagnostic: SA0PR12MB4510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4510CCFB0D09BA1A1D525CF3FDA09@SA0PR12MB4510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1WPuHuS9tpFdhaZkYgdajFEI7Wak/4eenYUdY8evXUEN3FFg4XK+/MgDAwCD1atfis88Lzctiv5L+j3OuPhs++r8fo93lOV0nfkdtvGh/9IwTTcarbaEzsFGVyQ5pg+mO/pqfDn1VJZfF/cuek9rDyG4Xw5PXneap4n9cyHsls2+ENkN5b0yzxnNyEY/3y3aRgsYUoby91Zv3USI00uDQ940jMV3hyRjZ5D+FxXj54XQ5MkzVWyr+276M+vjvl4MDC8sraNC501sS31iGM+6qwq5Vp+b9gueQzw0gKUeczcGCN/mO66V2xZbY8VxvngXOfIsVzjuEuOD1jBH+VHBYZ5NPsPpH5SIaF7L+vIbg3sl4e6vcAyRkRO1VMIvv5KEC4A5odLi/dc5ke3KNlrB/eVIfNCtG9XRNF/grOQ4u82UyZpg0li6ILdBt3pPHlPEf+DISci4qGWdTWCEIYkZzC2ePQdTOfRuk3BUVCzuyqFk8Gw2kI3VeydtskvKevkrEKG6IEjYKljfVmvYzdu4MUfl0tJ8JE28ImCSEDWpUBZT7Zchn+10vBLpLCMbN7vnTOQDExoOG32XvfG7y6e06ddffs0dep3Ae+JRl2LlObfPNM0ZnVk9IHUgTNSZSbr3wdvoSaf6IzDwDkJhizXhoc8gAdfoMhUXZudANzz1vMhyi0aOfpp/3G5F3CpF2xEeARID+nlCiRLp5uLCW8TumNe7G8Eyt3kJxdwAgFeW0o82ED27rm9fb2grI2QsCKAb5Hpo7c3dYQ+nV79mQDRbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(2616005)(4326008)(2906002)(956004)(16576012)(5660300002)(83380400001)(26005)(316002)(8936002)(7416002)(8676002)(31686004)(52116002)(6486002)(36756003)(31696002)(508600001)(186003)(53546011)(38100700002)(66556008)(66946007)(38350700002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWV0blpOZm9oK1lHOVF3bFIrOXViRC9uYmNtV3lkRnBVbHpIekVNRFlLdS9z?=
 =?utf-8?B?eU83aU5pbk02eXVkTzZGMU9FR3VmSEtPME5ncGZ6L3M1MklMdm4vclZSeXFl?=
 =?utf-8?B?USs4cTBET09OcWl0YUlEdEFzNEZIbWhrK3FyOUNqUzgrWFZQTEVGNHlwd083?=
 =?utf-8?B?UU9jMXB3UzVvcUVnZXNEd3ZoVld0bmVQUVJzbmtjUUtDYW9XcmJIck4wWVlW?=
 =?utf-8?B?c0R3UGorRFkzaWtnTC9lbks5akg3R1BzcHJZV2dWeEhMNTlLNFNhcnZlOENU?=
 =?utf-8?B?aU5scUdrVXR0bHRnejRaeThBS0YrS1R0MnUzRDRZK011dkg5eG4yc1BKNFh6?=
 =?utf-8?B?aHUxOERiZ0Y3MTFLMGRFSlVWcHkxQlNsR3psL3FDZGEySkE0YXZaMTFCSDBl?=
 =?utf-8?B?NFU0enhzcVVaY3ExNktuRGlhTUhmMmRyVmJMZjVpWVNPR2JIYTNpamJuL2VB?=
 =?utf-8?B?MzdkQnVrazl5Sng3dFJVVm5JaThwREp6bHc1ZHBLbjRLU21NM3I4RThKL3NC?=
 =?utf-8?B?NUp5a09MWGEzS2s2dXhhTSs2WXE3cFp0MENvUXlMNVJDdTZjZ0oxS1hWVFF3?=
 =?utf-8?B?UGZZRWFSQXhZSDZmSDJiYjZLa2NzdWgxWDI1RW5LNDFHS3UxcmlHVmxlWXRl?=
 =?utf-8?B?NEpQcjF3elBZUVE4TWRoN3VXcXBCY0dMRi92TVVzeGtwaEJpZWtEY2VrVHJ4?=
 =?utf-8?B?L2FuVjd6Tzk1V2lleTliYXkyR0xXZ2NSd2ZwYnBOVkl3WjZkellqTHlqOGxi?=
 =?utf-8?B?a1V5Z1BOVEk0N0xkZW9GUGJ6eEpONzBjSkVkR095WlprMFVTV1pKWGJDUEs1?=
 =?utf-8?B?aHdiM0UxUUFHaTFaQjRnWUNLenE2WCtlR3RzSWQrZEc3cGg0NC82RG9ORUlh?=
 =?utf-8?B?WDBwYW91VE1rWlE1QUg2aERYbHZwRzZ6Mmh0d1MxS2FWUmxUMGt6MjZ5eVdX?=
 =?utf-8?B?MnVLVmJPWXpjbjBWOVlzeCtRNjBKUTRRZmZlUjI2YW1BR1RTOHFJbDh5WGox?=
 =?utf-8?B?RXN2Ly9QOWkvRVZ6R2h4QUtwU2VnNE96Ny9BMmNaeU42ZUszSWRpQXMrVm5O?=
 =?utf-8?B?SUE3YU5za3RoaHFPUVAyK291MTJMamRNd243OGlJZmU1aEh2YzJWT2pydHNG?=
 =?utf-8?B?alF1MFRKZSsyd01WRVZMTWVKWFhWeTlGcXdwMzNYNXZwbEVSWFhDVU93RFZy?=
 =?utf-8?B?OWhDZzJ5U3NnVHk5RHJxUHZEeDlJeEoxWVdQQk42TXJHNjdGRS9PZXlDRGRO?=
 =?utf-8?B?TnQwbUlyVFArSGw3bTMvMGp5QTFZMDBBeXpUWTlFbHJNcmdyd3dHb2t2dGJk?=
 =?utf-8?B?OUxlY0lRUkRZTmlsUVlGREt3VHZoUUNPNjhqS0lYaUNxc2N6c1Q4NVNNRWJT?=
 =?utf-8?B?R3V1UzhXN0FNY1BuN1UvRmsrMDRZdGxYZkxRdHBVbTNiY1F1UjZyTnppNDh3?=
 =?utf-8?B?UlhBbTVLRm5mVWpmb3BIWTloc2t5NDBqZFR0Zk1BbXl6Q1V4aE5UVUpWZGVL?=
 =?utf-8?B?SzlZdC9TK1oxNndrYjBoVFRLM3F2d2EvVlQ4dkM3cVFXNFRIWGYyVUxZWExV?=
 =?utf-8?B?QVQ5dEpIRE5EcTVXc0w5amJSM3RoQVRybkpHdmozYWQ4ZWtOL1JRb3JzbTJO?=
 =?utf-8?B?RmdKWlhVRlVNMG1kU2o2SE5mN3ExV3pNb2EybGxkaW90b2J3NC93S3dKQ01D?=
 =?utf-8?B?T29TMUZFZE5WdmlHUHUrWDBHRVF0RjFNZDNpYXVaWEpJWFRLKzdLbE9BM1hT?=
 =?utf-8?Q?+411FrIG4EVvLMNYx35cWrJmKwQDjEOEzsj+wLB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b93f99-51f1-441b-2601-08d97c7200d0
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 20:05:33.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvtxYjd2jJSo2qLPxFqG1ctqljB0X5HTGABiVewIlyalXtwo/etum8fpS5txyAN6EWTKNf+r8SNyOUsMSaXUaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
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


On 9/20/2021 3:53 AM, Alistair Popple wrote:
> On Tuesday, 14 September 2021 2:16:01 AM AEST Alex Sierra wrote:
>> In order to configure device public in test_hmm, two module parameters
>> should be passed, which correspond to the SP start address of each
>> device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
>> private device type is configured.
> It's a pity that testing this seems to require some amount of special setup to
> test. Is there a way this could be made to work on a more standard setup
> similar to how DEVICE_PRIVATE is tested?
Hi Alistair
We tried to do it as simpler as possible. Unfortunately, there are two main
requirements to register dev memory as DEVICE_PUBLIC type. This memory must
NOT be accessed by any memory allocator (SLAB, SLOB, SLUB) plus, it has 
to be
CPU coherently accessed.  We also want to avoid aliasing the same PFNs for
different page types (regular system memory and DEVICE_PUBLIC). So we don't
want the reserved memory to be part of the kernel's memory map before we 
call
memremap_pages. A transparent way of doing it, without any special HW, was
setting a portion of system memory as SPM (Special purpose memory). And use
this as our “device fake” memory.

Regards,
Alex Sierra

>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>> v5:
>> Remove devmem->pagemap.type = MEMORY_DEVICE_PRIVATE at
>> dmirror_allocate_chunk that was forcing to configure pagemap.type
>> to MEMORY_DEVICE_PRIVATE
>>
>> v6:
>> Check for null pointers for resource and memremap references
>> at dmirror_allocate_chunk
>>
>> v7:
>> Due to patch dropped from these patch series "kernel: resource:
>> lookup_resource as exported symbol", lookup_resource was not longer a
>> callable function. This was used in public device configuration, to
>> get start and end addresses, to create pgmap->range struct. This
>> information is now taken directly from the spm_addr_devX parameters and
>> the fixed size DEVMEM_CHUNK_SIZE.
>> ---
>>   lib/test_hmm.c      | 66 +++++++++++++++++++++++++++++++--------------
>>   lib/test_hmm_uapi.h |  1 +
>>   2 files changed, 47 insertions(+), 20 deletions(-)
>>
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index 3cd91ca31dd7..ef27e355738a 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -33,6 +33,16 @@
>>   #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
>>   #define DEVMEM_CHUNKS_RESERVE		16
>>   
>> +static unsigned long spm_addr_dev0;
>> +module_param(spm_addr_dev0, long, 0644);
>> +MODULE_PARM_DESC(spm_addr_dev0,
>> +		"Specify start address for SPM (special purpose memory) used for device 0. By setting this Generic device type will be used. Make sure spm_addr_dev1 is set too");
>> +
>> +static unsigned long spm_addr_dev1;
>> +module_param(spm_addr_dev1, long, 0644);
>> +MODULE_PARM_DESC(spm_addr_dev1,
>> +		"Specify start address for SPM (special purpose memory) used for device 1. By setting this Generic device type will be used. Make sure spm_addr_dev0 is set too");
>> +
>>   static const struct dev_pagemap_ops dmirror_devmem_ops;
>>   static const struct mmu_interval_notifier_ops dmirror_min_ops;
>>   static dev_t dmirror_dev;
>> @@ -450,11 +460,11 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
>>   	return ret;
>>   }
>>   
>> -static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>> +static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>   				   struct page **ppage)
>>   {
>>   	struct dmirror_chunk *devmem;
>> -	struct resource *res;
>> +	struct resource *res = NULL;
>>   	unsigned long pfn;
>>   	unsigned long pfn_first;
>>   	unsigned long pfn_last;
>> @@ -462,17 +472,29 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>   
>>   	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
>>   	if (!devmem)
>> -		return false;
>> +		return -ENOMEM;
>>   
>> -	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
>> -				      "hmm_dmirror");
>> -	if (IS_ERR(res))
>> -		goto err_devmem;
>> +	if (!spm_addr_dev0 && !spm_addr_dev1) {
>> +		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
>> +					      "hmm_dmirror");
>> +		if (IS_ERR_OR_NULL(res))
>> +			goto err_devmem;
>> +		devmem->pagemap.range.start = res->start;
>> +		devmem->pagemap.range.end = res->end;
>> +		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
>> +		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
>> +	} else if (spm_addr_dev0 && spm_addr_dev1) {
>> +		devmem->pagemap.range.start = MINOR(mdevice->cdevice.dev) ?
>> +							spm_addr_dev0 :
>> +							spm_addr_dev1;
>> +		devmem->pagemap.range.end = devmem->pagemap.range.start +
>> +					    DEVMEM_CHUNK_SIZE - 1;
>> +		devmem->pagemap.type = MEMORY_DEVICE_PUBLIC;
>> +		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PUBLIC;
>> +	} else {
>> +		pr_err("Both spm_addr_dev parameters should be set\n");
>> +	}
>>   
>> -	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
>> -	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
>> -	devmem->pagemap.range.start = res->start;
>> -	devmem->pagemap.range.end = res->end;
>>   	devmem->pagemap.nr_range = 1;
>>   	devmem->pagemap.ops = &dmirror_devmem_ops;
>>   	devmem->pagemap.owner = mdevice;
>> @@ -493,10 +515,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>   		mdevice->devmem_capacity = new_capacity;
>>   		mdevice->devmem_chunks = new_chunks;
>>   	}
>> -
>>   	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
>> -	if (IS_ERR(ptr))
>> +	if (IS_ERR_OR_NULL(ptr)) {
>> +		if (ptr)
>> +			ret = PTR_ERR(ptr);
>> +		else
>> +			ret = -EFAULT;
>>   		goto err_release;
>> +	}
>>   
>>   	devmem->mdevice = mdevice;
>>   	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
>> @@ -529,7 +555,8 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>   
>>   err_release:
>>   	mutex_unlock(&mdevice->devmem_lock);
>> -	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
>> +	if (res)
>> +		release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
>>   err_devmem:
>>   	kfree(devmem);
>>   
>> @@ -1097,10 +1124,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
>>   	if (ret)
>>   		return ret;
>>   
>> -	/* Build a list of free ZONE_DEVICE private struct pages */
>> -	dmirror_allocate_chunk(mdevice, NULL);
>> -
>> -	return 0;
>> +	/* Build a list of free ZONE_DEVICE struct pages */
>> +	return dmirror_allocate_chunk(mdevice, NULL);
>>   }
>>   
>>   static void dmirror_device_remove(struct dmirror_device *mdevice)
>> @@ -1113,8 +1138,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
>>   				mdevice->devmem_chunks[i];
>>   
>>   			memunmap_pages(&devmem->pagemap);
>> -			release_mem_region(devmem->pagemap.range.start,
>> -					   range_len(&devmem->pagemap.range));
>> +			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
>> +				release_mem_region(devmem->pagemap.range.start,
>> +						   range_len(&devmem->pagemap.range));
>>   			kfree(devmem);
>>   		}
>>   		kfree(mdevice->devmem_chunks);
>> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
>> index ee88701793d5..00259d994410 100644
>> --- a/lib/test_hmm_uapi.h
>> +++ b/lib/test_hmm_uapi.h
>> @@ -65,6 +65,7 @@ enum {
>>   enum {
>>   	/* 0 is reserved to catch uninitialized type fields */
>>   	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
>> +	HMM_DMIRROR_MEMORY_DEVICE_PUBLIC,
>>   };
>>   
>>   #endif /* _LIB_TEST_HMM_UAPI_H */
>>
>
>
>
