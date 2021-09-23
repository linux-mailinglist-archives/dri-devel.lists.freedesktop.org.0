Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F73416278
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 17:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC10E6ED15;
	Thu, 23 Sep 2021 15:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AF46ED15;
 Thu, 23 Sep 2021 15:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwGKUvAWMVsho4tyOhVmjvS7r0wwuMnjgv+mMgCkrE0SKZ7ptcP/8JZJagpj+qhbeFnHwYpBedMZltC37y7Xuktu9xG0P7exsIHLS7UssML6EG0NIiwOPeQvXNtMrhZ4XniEIgsKFKF3GYOCim0m1wUUfQLc4E4kzXFQogjjZNaQJqyBt64avbAn+wdePu/LJGoyFOTRZBfi2U+xtmFxqFkoOm5oqGIYShViKAmntv6X5vb3CMeCQ/ZzCiky2//nRSd+z2XjT9m/dVFVTujXzS2ajixaWlbNWe5oHbV3Hh31I/L4vTqocQNRoVkQUz1W87mgQ/V8fQz1FOryxreJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iE5FHE0yxQ+WZW6D4YgWlAxyxKKQ2RredykreDS7RrI=;
 b=hPOovJilBYKo4WUMJVojJohB/zETsUlGns85Ef9mBNAKoyOyMKK5FXjygsO9NMXvykjnZmFqiRPOotxDjxbt8Tx5Sjb5BeNP/8VyYZNnQK8lYb26xs8DW//iGsdEvqLxEy05iMG5OFgwdl9r871dk5LFu8jhyJ3SOimguGRhp6dln0orYThN5S2hMjOVo93J8l6UidNIZ9k/Gp2XEqoBgOIMfW3M+chY4fhNPUhbGGzRBMnLT8houHlBR3KrRVss+BWfTNkeuWNKC3YTTFOy+x5NqIA0t1FyNdLNHmI/lPOQ8Z7sjhU1EEAiArjCuLQIhO2GWKLjPeJj3wTReW6HGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE5FHE0yxQ+WZW6D4YgWlAxyxKKQ2RredykreDS7RrI=;
 b=vQfsiLFY7dWLswiz4FucCtnJ1csJUrZ0pk+XLEvfD7KzpoB9qDArmLfXX+MVBIwM3ftuyerP/XTyZqrlDaMxsT8nioXHyGwScApjKwS3gMhb1uUserzJjBbA6w0K8oV5ROwtLNclEjT0XmMSTvNJ3LWw0NaLAgwj8TZnR9NWidg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:52:50 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 15:52:50 +0000
Subject: Re: [PATCH v2 09/12] lib: test_hmm add module param for zone device
 type
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 Felix.Kuehling@amd.com, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
References: <20210913161604.31981-1-alex.sierra@amd.com>
 <2139200.KYAmxeAneQ@nvdebian> <729f833c-e880-96ce-5f49-2d72a93faa21@amd.com>
 <2161903.HsYN06obEU@nvdebian>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <30468c52-62b6-1af8-07dd-e9be766b6b77@amd.com>
Date: Thu, 23 Sep 2021 10:52:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2161903.HsYN06obEU@nvdebian>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SN2PR01CA0068.prod.exchangelabs.com (2603:10b6:800::36) To
 SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from [172.31.9.47] (165.204.77.11) by
 SN2PR01CA0068.prod.exchangelabs.com (2603:10b6:800::36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:52:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ccdb4d7-c2de-4caa-71bd-08d97eaa3207
X-MS-TrafficTypeDiagnostic: SA0PR12MB4495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44956123C620A074508F70D5FDA39@SA0PR12MB4495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qm+18c+sipx0pbsW4DlROuPK6CXoX6zGOtl7fJcZLhKUMRIXcgyyAKxKXh9jElB+3XQwHqJm426oHk7ztpmIEvMLHagSn9BllTdrMgBqhTESd8ylXdJxG371YU0jv+FiVUsacAfn5Lh3B+yt64PVMp7kFNEXu31dNoPLyjvU/3vyH2u0pEmP+RKYrOJ7gaut4hTVGR/XzEujiozAN7P8/j7H9WbLslzlb8aUZSMXmZmzGklC33fAGVuW//gAuPsTjjDeXm37w7nWUjPVwFddlxZgUjeYHmSXszEZuOZ95HMnkdx4bWN6CvzMUHcXo0TWpCYS7Qd1Zc3k8698SZetpEuEaviHEyBmldLqaN2vWe1u9CG1QIffSfmtcHxJoY3cxk1f/BSXnwUYu/Xe2qtNu2xXWgObNrnreB2CS8QWGxaJTBj5ODii0Tl3ChSsDGmEipMb5akNAnAGJNwwWzxgmzTgwTSb7uzIFzGI3P+3qDkSWk9LwjS9zo9kIbL7nKe3OrycWpGrs0I3Qsdh6Ux9AaYY1XX5+H7LFcKsNyiJmkUgodwPzHHGCx1aDZVG4b+Mub3o2H+CIJJ4rTLVFS+0barvQmPcZzUIw3pscLFJiIdlsIvaRuYjKGru2WBVc8pI+wNmN84MmoJrrfksvgTIsY4NAFf0HgSYqQ9icNO4segq+E024+4RJ3UHQpDkzwX7Gool18Brv48sCwEEfRjxabERWcQGEEH3KjaEfsHGLgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(66556008)(66476007)(508600001)(956004)(4326008)(2906002)(66946007)(36756003)(2616005)(8676002)(26005)(53546011)(7416002)(8936002)(5660300002)(38350700002)(38100700002)(31696002)(83380400001)(31686004)(6486002)(86362001)(52116002)(316002)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZklXVEJDY1hnMDl4S1UvZUxpOGJkNjJGOFordHRMMVBCejBneS9ucFFHTm5P?=
 =?utf-8?B?U3h6cUhhNE1DcUt3eFhtUGFUelNyaUlqUWlFR0VqNzdNaWlGSHdKVkxVZGFa?=
 =?utf-8?B?SkgreUEyQzRmNG5WWmFUK3lSVnZiZzNKTjNkUmJva2l4Zm5ycHRNMVA0MnJl?=
 =?utf-8?B?ekNhM2xyc2czZHAyaUs3ejNhUkd6MEZ1bjFhTVR1cG1lTmJ5MkRtQXJDUnlk?=
 =?utf-8?B?TGsrOThITVgvRjhkVUNwM0t2OHM0NTBMNkNXWGNkN2VoZEV6VmdnWHJVTFl0?=
 =?utf-8?B?cVMzakJiL2U4OVRQR2Qya2hXU0N1M05hOHJOTzRPTDFqS2loUVBxZ0gxWGx4?=
 =?utf-8?B?UWphN2hFN01SSmM0ZnM3aGt4Zm1DdVZGaDQ2ZlZiaEZIT0ZEN0JBQS96L0sx?=
 =?utf-8?B?WFU0cG10aHRtR2pkTENERitNN2MyVnVFMnFIaXV4bzVZQldtTHl5UStMaElU?=
 =?utf-8?B?ZjRhQlFFRVBlVlNGd1VvVHdIYW1VdUZvbkFJYk5qUVJ1eXFCOXplNm01MzlI?=
 =?utf-8?B?dUtHR21Ba3I1WUI1OFdxaWRId1JSa0xlcFgzdXBtVUNYWitpcnJmTHd3N09n?=
 =?utf-8?B?RTVRcGNXY1JiM1Q2N1lqdG5jM21LcGxFaDBLaVVHVkh5TjN3T3RCb2Q3aE5p?=
 =?utf-8?B?U3dMYnhsbmRaN2gyOW84RExaWHdtcnV0TW9ranBVQ3hJTXRsQ3BwMEdoUWda?=
 =?utf-8?B?c0UzKzdkdlFCdTJhVVdXUmh2UGw2N2tJbzRFaHppYy9JeGJ1azdXL1BOSi9N?=
 =?utf-8?B?eURDRzdjUjlaMDdJeUFCMVNZRjkwTGpCckVhUWRxMDBCZFBZV1U3YzlTekxn?=
 =?utf-8?B?WWxkR29ja3ZTalowdTFqSUZMZVhNN1JLWjI2ZWNJWHdQNmp6UCtkaFpJMFBX?=
 =?utf-8?B?bDYrSjB1cUZNV2kyTzZWNkZ1RUZWajBQVkEvbWQzZ2hqRlhSbGV6eFY2OVJq?=
 =?utf-8?B?Q1VIVEpQM2JyenN4RlBDcXYxV21qVUgxTVp4N0hEaWN2QUluZzFYQ0ZyM0Q2?=
 =?utf-8?B?cHpOdnJqUVdicEIvcWljMUsyOU5pZzdma3VyNmV3eC9BYzNCbC9xd2J1SUJ6?=
 =?utf-8?B?MHF6emlOdmZJOC84Nmlnc0VkZ2h1d2ErZ0JSa0hRRXBzYk5ORmlubEJwTThp?=
 =?utf-8?B?R3BLcXhzcWtmYisyUGN6THd5cE5hbThSb0tXR09OL3Q0YzNRU3h0MVljWkI4?=
 =?utf-8?B?Sm1TaDEvZFp0b29ZZ2JqZDVXanErOFVPMXVWb2NkaGUwMmNsdlBCZUVqek5y?=
 =?utf-8?B?SUhSdFh6RGE3elRYNWJHdGV1UW4zNGdibk1PWGlPMWlJMUE1aEo1ZktBZFRm?=
 =?utf-8?B?Rksyc3BqenFMR0lrMmRxcGM3ckZUeHhjOHdIczUxS1BlOHFJZ0psMkdQam1j?=
 =?utf-8?B?VWJIb25Pamh6bStWVFVRUm91emV4cmlTaWdOdmQ5VnhDOElacVo3VHF3SzVm?=
 =?utf-8?B?Q09aMWNGenJxejhwMHJsV1lubVBrd1hySjQ2WlhPTXd1Q0pJT296YnBYcXBo?=
 =?utf-8?B?c2NqWC9Mc3lNV0lKeFFJd0dyczh3VWtMbFo0cjF3cnBSTHdjK2k5L3VoVjZ3?=
 =?utf-8?B?dDZBcXlMMWd4TUFCYWJSV3pJcGoyNmdYcUROM29rK2JaR3U0MUlCdVRrWWNP?=
 =?utf-8?B?cU9PQ1pOdUR0QUtUY0drQXYrZFBySCtSSFVrWUx6dEY4U3RLQytLYmxocUU5?=
 =?utf-8?B?UkFFVXQyMkZmNlhBZlZRK0dmVy9NbWYwd0lIcHRGNFFwd0VuS0Z3Q3pudy9l?=
 =?utf-8?Q?SeZtJ9ogZXmghvJDXaKexzs8VUtr0C5jWZRMlAg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccdb4d7-c2de-4caa-71bd-08d97eaa3207
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:52:50.0983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xem/k3x8ejUYSy/vOwno54bngyZ1LV5ICgrA8ejSaBzS7RxUsOU+kR8EDjr+p4gIL+pczpPwOSoUFt8p09nRlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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


On 9/21/2021 12:14 AM, Alistair Popple wrote:
> On Tuesday, 21 September 2021 6:05:30 AM AEST Sierra Guiza, Alejandro (Alex) wrote:
>> On 9/20/2021 3:53 AM, Alistair Popple wrote:
>>> On Tuesday, 14 September 2021 2:16:01 AM AEST Alex Sierra wrote:
>>>> In order to configure device public in test_hmm, two module parameters
>>>> should be passed, which correspond to the SP start address of each
>>>> device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
>>>> private device type is configured.
>>> It's a pity that testing this seems to require some amount of special setup to
>>> test. Is there a way this could be made to work on a more standard setup
>>> similar to how DEVICE_PRIVATE is tested?
>> Hi Alistair
>> We tried to do it as simpler as possible. Unfortunately, there are two main
>> requirements to register dev memory as DEVICE_PUBLIC type. This memory must
>> NOT be accessed by any memory allocator (SLAB, SLOB, SLUB) plus, it has
>> to be
>> CPU coherently accessed.  We also want to avoid aliasing the same PFNs for
>> different page types (regular system memory and DEVICE_PUBLIC). So we don't
>> want the reserved memory to be part of the kernel's memory map before we
>> call
>> memremap_pages. A transparent way of doing it, without any special HW, was
>> setting a portion of system memory as SPM (Special purpose memory). And use
>> this as our “device fake” memory.
> Ok, I think it's great that we can test this without special HW but the boot
> time configuration is still a bit annoying. Would it be possible to allocate
> memory fitting the above requirements by hot unplugging it with something like
> offline_and_remove_memory()?
>
> I also don't see why the DEVICE_PRIVATE and DEVICE_PUBLIC testing should be
> mutually exclusive - why can't we test both without reloading the module?
You could do both DEVICE_PRIVATE and DEVICE_PUBLIC tests by running the 
test_hmm_sh
script twice, just passing the proper parameters. Even when you booted 
with fake EFI SP
regions. If spm_address_dev0/1 parameters are passed, the module gets 
configured with
DEVICE_PUBLIC type. Otherwise DEVICE_PRIVATE type is set. Technically 
the only
complication in testing DEVICE_PUBLIC is the fake SPM boot parameter.

Alex Sierra
>
>   - Alistair
>
>> Regards,
>> Alex Sierra
>>
>>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>>> ---
>>>> v5:
>>>> Remove devmem->pagemap.type = MEMORY_DEVICE_PRIVATE at
>>>> dmirror_allocate_chunk that was forcing to configure pagemap.type
>>>> to MEMORY_DEVICE_PRIVATE
>>>>
>>>> v6:
>>>> Check for null pointers for resource and memremap references
>>>> at dmirror_allocate_chunk
>>>>
>>>> v7:
>>>> Due to patch dropped from these patch series "kernel: resource:
>>>> lookup_resource as exported symbol", lookup_resource was not longer a
>>>> callable function. This was used in public device configuration, to
>>>> get start and end addresses, to create pgmap->range struct. This
>>>> information is now taken directly from the spm_addr_devX parameters and
>>>> the fixed size DEVMEM_CHUNK_SIZE.
>>>> ---
>>>>    lib/test_hmm.c      | 66 +++++++++++++++++++++++++++++++--------------
>>>>    lib/test_hmm_uapi.h |  1 +
>>>>    2 files changed, 47 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>>>> index 3cd91ca31dd7..ef27e355738a 100644
>>>> --- a/lib/test_hmm.c
>>>> +++ b/lib/test_hmm.c
>>>> @@ -33,6 +33,16 @@
>>>>    #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
>>>>    #define DEVMEM_CHUNKS_RESERVE		16
>>>>    
>>>> +static unsigned long spm_addr_dev0;
>>>> +module_param(spm_addr_dev0, long, 0644);
>>>> +MODULE_PARM_DESC(spm_addr_dev0,
>>>> +		"Specify start address for SPM (special purpose memory) used for device 0. By setting this Generic device type will be used. Make sure spm_addr_dev1 is set too");
>>>> +
>>>> +static unsigned long spm_addr_dev1;
>>>> +module_param(spm_addr_dev1, long, 0644);
>>>> +MODULE_PARM_DESC(spm_addr_dev1,
>>>> +		"Specify start address for SPM (special purpose memory) used for device 1. By setting this Generic device type will be used. Make sure spm_addr_dev0 is set too");
>>>> +
>>>>    static const struct dev_pagemap_ops dmirror_devmem_ops;
>>>>    static const struct mmu_interval_notifier_ops dmirror_min_ops;
>>>>    static dev_t dmirror_dev;
>>>> @@ -450,11 +460,11 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
>>>>    	return ret;
>>>>    }
>>>>    
>>>> -static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>>> +static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>>>    				   struct page **ppage)
>>>>    {
>>>>    	struct dmirror_chunk *devmem;
>>>> -	struct resource *res;
>>>> +	struct resource *res = NULL;
>>>>    	unsigned long pfn;
>>>>    	unsigned long pfn_first;
>>>>    	unsigned long pfn_last;
>>>> @@ -462,17 +472,29 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>>>    
>>>>    	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
>>>>    	if (!devmem)
>>>> -		return false;
>>>> +		return -ENOMEM;
>>>>    
>>>> -	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
>>>> -				      "hmm_dmirror");
>>>> -	if (IS_ERR(res))
>>>> -		goto err_devmem;
>>>> +	if (!spm_addr_dev0 && !spm_addr_dev1) {
>>>> +		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
>>>> +					      "hmm_dmirror");
>>>> +		if (IS_ERR_OR_NULL(res))
>>>> +			goto err_devmem;
>>>> +		devmem->pagemap.range.start = res->start;
>>>> +		devmem->pagemap.range.end = res->end;
>>>> +		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
>>>> +		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
>>>> +	} else if (spm_addr_dev0 && spm_addr_dev1) {
>>>> +		devmem->pagemap.range.start = MINOR(mdevice->cdevice.dev) ?
>>>> +							spm_addr_dev0 :
>>>> +							spm_addr_dev1;
>>>> +		devmem->pagemap.range.end = devmem->pagemap.range.start +
>>>> +					    DEVMEM_CHUNK_SIZE - 1;
>>>> +		devmem->pagemap.type = MEMORY_DEVICE_PUBLIC;
>>>> +		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PUBLIC;
>>>> +	} else {
>>>> +		pr_err("Both spm_addr_dev parameters should be set\n");
>>>> +	}
>>>>    
>>>> -	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
>>>> -	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
>>>> -	devmem->pagemap.range.start = res->start;
>>>> -	devmem->pagemap.range.end = res->end;
>>>>    	devmem->pagemap.nr_range = 1;
>>>>    	devmem->pagemap.ops = &dmirror_devmem_ops;
>>>>    	devmem->pagemap.owner = mdevice;
>>>> @@ -493,10 +515,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>>>    		mdevice->devmem_capacity = new_capacity;
>>>>    		mdevice->devmem_chunks = new_chunks;
>>>>    	}
>>>> -
>>>>    	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
>>>> -	if (IS_ERR(ptr))
>>>> +	if (IS_ERR_OR_NULL(ptr)) {
>>>> +		if (ptr)
>>>> +			ret = PTR_ERR(ptr);
>>>> +		else
>>>> +			ret = -EFAULT;
>>>>    		goto err_release;
>>>> +	}
>>>>    
>>>>    	devmem->mdevice = mdevice;
>>>>    	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
>>>> @@ -529,7 +555,8 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>>>    
>>>>    err_release:
>>>>    	mutex_unlock(&mdevice->devmem_lock);
>>>> -	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
>>>> +	if (res)
>>>> +		release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
>>>>    err_devmem:
>>>>    	kfree(devmem);
>>>>    
>>>> @@ -1097,10 +1124,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
>>>>    	if (ret)
>>>>    		return ret;
>>>>    
>>>> -	/* Build a list of free ZONE_DEVICE private struct pages */
>>>> -	dmirror_allocate_chunk(mdevice, NULL);
>>>> -
>>>> -	return 0;
>>>> +	/* Build a list of free ZONE_DEVICE struct pages */
>>>> +	return dmirror_allocate_chunk(mdevice, NULL);
>>>>    }
>>>>    
>>>>    static void dmirror_device_remove(struct dmirror_device *mdevice)
>>>> @@ -1113,8 +1138,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
>>>>    				mdevice->devmem_chunks[i];
>>>>    
>>>>    			memunmap_pages(&devmem->pagemap);
>>>> -			release_mem_region(devmem->pagemap.range.start,
>>>> -					   range_len(&devmem->pagemap.range));
>>>> +			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
>>>> +				release_mem_region(devmem->pagemap.range.start,
>>>> +						   range_len(&devmem->pagemap.range));
>>>>    			kfree(devmem);
>>>>    		}
>>>>    		kfree(mdevice->devmem_chunks);
>>>> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
>>>> index ee88701793d5..00259d994410 100644
>>>> --- a/lib/test_hmm_uapi.h
>>>> +++ b/lib/test_hmm_uapi.h
>>>> @@ -65,6 +65,7 @@ enum {
>>>>    enum {
>>>>    	/* 0 is reserved to catch uninitialized type fields */
>>>>    	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
>>>> +	HMM_DMIRROR_MEMORY_DEVICE_PUBLIC,
>>>>    };
>>>>    
>>>>    #endif /* _LIB_TEST_HMM_UAPI_H */
>>>>
>>>
>>>
>
>
>
