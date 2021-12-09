Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B446EFE2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B447F10F0A6;
	Thu,  9 Dec 2021 16:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAE510E613;
 Thu,  9 Dec 2021 16:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NapSjqcCQ7XIa0khyy8xmmaqPCoLWxoeEPYi39sSk/OrsDvlWcKfxQVipNHFGzqoxjvSFIx/qfuzWKSiTsO0GVeTpqYRr+VTPdLyOK+bbx1PXkNDumTA/2j2FfXSNUFMzxo3FZuQ+aK4MkGQJyKRNWdlWeSAVsefVstAk6uHCfn6MP0SAI0bdDXBCpu+9CANNzIIviI0+vl1UGt2UMyQiHZgEkjGoKrU/nsKSX7Q1VColuyR4ks9EkphBj6ZZFT6y+J61TWIY4N7K37KVF2M18fNQPUgNpmvczS6TQXJ2ENAlb7xc5AjZdyERDN/u0NPwZWCiMMO2Zx+dqXIhUZ8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AICLwtbIemTlaWXH2lgTaX839NJHBT/enrm1fCvSTKQ=;
 b=nbmElctSGDZlyAjr99odCjkRlgIgrtYNuPn/ZW/ifVZBpOmV6lU420GOQ3Q/SE53iDNObYvVYDH2FI/iTH/N9FbZUL9bttbFRMiN2oULdZ/0JC+Blbn9F94Qgm5aQsaRYnhjeTgWnQKLQ6rRD7zROyvoTXnvBKRSKfz0w7SZnYhc+bxIImqCX8HXy+mOAZSAFhyN92JuiqF6D0XffdITtLwwHrU7YPv+QKO0E3YQNPZh11U458qMOI5YB3pGahF6nTz63ON3H3qLXtRYsaJ1bMlXbdlddwGnTuXM0JPgTeGz3eoDA3s8FEp44B4xbBui+D1vZyrrzqxFHO/aC33MRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AICLwtbIemTlaWXH2lgTaX839NJHBT/enrm1fCvSTKQ=;
 b=hplEw8BajMfc7v76dOawh9KzJRdrmlx90ycU65fJcgK/u6Zc+l5OX1i/b2ncUmntnXciGCeGF7xahpI3TGfFmdk1UoagVgRVRG3v7TlNsa+BU52ikCBAa3VBenCoPOJFxy7iRIHmbMcJnQfH1/EN1ON+oYeag0VcKGTHfPw7RLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by SA0PR12MB4592.namprd12.prod.outlook.com (2603:10b6:806:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 16:54:36 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37%3]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 16:54:36 +0000
Content-Type: multipart/alternative;
 boundary="------------7MyazOToij2ne5RqFz0x9Flw"
Message-ID: <72fe6b48-4aa5-b766-3f33-8c3445fdcc99@amd.com>
Date: Thu, 9 Dec 2021 10:54:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <2b996383-ebe6-e9d8-d794-58ecfd4a16e8@amd.com>
 <3f8a48d6-7ee7-fb30-5942-29054c34aac5@amd.com> <2497746.4npHOaMrmn@nvdebian>
 <b9163ccc-829e-9939-8177-a66ab41187e7@amd.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <b9163ccc-829e-9939-8177-a66ab41187e7@amd.com>
X-ClientProxiedBy: MN2PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:208:d4::14) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
Received: from [172.31.9.47] (165.204.77.11) by
 MN2PR04CA0001.namprd04.prod.outlook.com (2603:10b6:208:d4::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20 via Frontend Transport; Thu, 9 Dec 2021 16:54:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dc63a02-1d0e-41da-50dc-08d9bb3494c9
X-MS-TrafficTypeDiagnostic: SA0PR12MB4592:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB4592138333B9377F8BA0D419FD709@SA0PR12MB4592.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A16gno6+IIrcrkP6jyxO9FsDKVhCRJduMNjnNJp0Kp49mmo9AbIMUtmBEk2dWBuj0ltcvnKPVxlhtwIbAwlX/Bo1yjoSY2y7KD3rTQk4QBIa5WWyD24DwwQU162ZWjkIWL4Pie8L9C2WuBX6lxU4e7BkPsI4mGH+qtstQOwiPUDJ4wKzi25Ii3+6pgGHjEWdEngfINeZunEwck03ertrhfPGmXJNcdag4W44LCJeejYU1rtEr4gMYzWNqbktwLlYuJTjXI6vo8j6+lTofQJdmZ7BNX8CpxNkHgopqekBk0Ngo/WANUsLmyyfE6/6ndJc9Lw9eJZyNN3pZ7aYps8pJWgOGavg3ZKovBXVLrhdSla/H1WMG1G7pCCniMVjM4CRc5WZkxlqvyJFaFK/cpr7a+iLFQkiOXabQmtQAZKNZ2Dhd7laxdGxMc5zVhrcNNUbTo/4Rb2EAoNWlWC58ThYtAedWTuRTu7R1chComIIfrHfTaMfTy5zztqNy2D4URxO/om+ZPU4Ca/ifbsXbdpUlSHb9sZOSm5mvmsRwi/LRilRT8XKa4BiZ40T+F6e940Lj6AotF4EMP5GoYOeG2Tjp5F9AWxli819YKJ2P3gPIYYdnnRJ3nJ/KzvXX/yIFqceu65F7vrQ018nhMt6zmya9mxd22wuS01rEI8WVbG3F9NMBjMu+TfO8YMdv+pXR8soWnrG7u3CPa84WQtFSa1Aywf0oRjmymiASMUYAmb8BV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(6486002)(316002)(31686004)(6666004)(186003)(5660300002)(36756003)(110136005)(16576012)(83380400001)(4326008)(31696002)(7416002)(66476007)(66556008)(8676002)(33964004)(508600001)(8936002)(38100700002)(956004)(53546011)(66946007)(2616005)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0NvUEZOdjdtUnlJWi96a0ZEOE1iS0V6Yk4wd05hYlZFSVp5V1A4NEVaSU5q?=
 =?utf-8?B?VjYzNWF3eEgzWDVMM25tZFIwTnZWL1h2MVhkOEYyQTg5TlQvUGxGRDk0NWQ1?=
 =?utf-8?B?OEl2N1JPc2I1QlcxVVh5Y1FuRDhUWnByV0JINnNnWE5RM3RQdjkwYnBwRkZC?=
 =?utf-8?B?THlqSTQwbVpGbDFqYzRvU1crSnZSQTBqaHg2OTNlQkFyT2UxN3dBSnBYNGlX?=
 =?utf-8?B?VXdENVErYW4yQXFKay9Hd01YZEw3MXhEOGN3Y2MzME9jYmp0Yzd0Z0duLzdD?=
 =?utf-8?B?UTNwRFV6UXNqV0UxenV6NXZkWHhIeEkzWDg4b3VmS2krWUU0MVZFeGlDZFRI?=
 =?utf-8?B?M1VrNGowT3RRV3J1eU4zU2dVVzRxL2hNN2NsMVZHeklXanFzMVVETjZuTFcy?=
 =?utf-8?B?SmF6K3R6SytJM05BOGRRWFVtTVNVWFY3cWFaeHhsQVNkM2xMVDlyL2tKZTdL?=
 =?utf-8?B?Q1hIdXBHL2FiV29mWVhMTGJjeUxPWmtwejRRYUxJemRJWnpmSEV3QlVBcVU2?=
 =?utf-8?B?U241dFQ2K1VVV2dPSnhMSUNyR0JES0h1alFpYjRGdDNFTjB6WnQyQlhYQ3Bm?=
 =?utf-8?B?cGI3c1d4ZDFjZWNCY1JSUnRYaG5Ta1drek8za2NuS0x0c2hMQU1STlA5NUdU?=
 =?utf-8?B?Qmwrc3VYTUVMaDRsWXQ5L3A4RTNWYzQ5ZUp1ZTdKNW9FbU96SG5OcTU5d00x?=
 =?utf-8?B?bmUyYVZVNWp6Vld0TDNLOHE1V1dmeWJsckdsdGRPNklmTWJmSWZTVFlNdHRX?=
 =?utf-8?B?YVQ4aC9pdjNPUlBMbTBXaUZWOVp6VnlLRGFFUFhmcElxL25wNGhOaGplUFVi?=
 =?utf-8?B?aFVyZFk1M2pkYjNJNWhjcGF6WTFyRVpSWUJuTGxCZTdkNlF0ZWpVOCtxSjIr?=
 =?utf-8?B?VjdONnZjVzJiUnNGaEpKaUliTGdLaFpTTHR4eXFlN29Dc0w5Z2NxTVpVYUVx?=
 =?utf-8?B?YjZheStOWkV3Tk5tamtXSnBYczM1MjB5M1h1c3RjdXgxYkdlN2JsYUhnREVH?=
 =?utf-8?B?ZUdlNkExazhZWEc1TE5uM1VkZVRKZEZ3VCtsczMwZmw3UkthazVHNllidFNa?=
 =?utf-8?B?ZnNEVlUrYU9aTW5rbTNtbFVRQkxjNkcvd0hjcDdSNTJKeGFmczIxVkVBdTcz?=
 =?utf-8?B?TU9nK0U0MXV2UUZ3dzRDeExoUEhwL0NjejhYengzczB1dkpPYjdBN1ltOWw5?=
 =?utf-8?B?STNrZys4bFR4VVhZaHZYSkt1L2ZIUldBRk1rZG5PcnBIZ3NxMThNaldobkRu?=
 =?utf-8?B?dGFRWERLQ0I3Z0wraUtha29iaU9VUkd0c0t5MXlSaGhsWGJkWitidWtiMCtM?=
 =?utf-8?B?RTVoMlc0SUVEY245MWhtb252M0VJS0crbGkrRlZoL0g2dkxtQ29WNitBb0FS?=
 =?utf-8?B?c0szaW45S0VtWFU5U3ZLY29kK2lUSm1tbFQycGhCdzFqNjRIL0hlSytVNnd3?=
 =?utf-8?B?Rzk5WlI2UmlEbUllbzRvRFp1TzQ3REFYRGVEMktiUTZZSURCQm0rVVVXQlZx?=
 =?utf-8?B?eDhFYW9iWFZWcThWZ2h5TFFzQXRybk41NHVzeGl5N2NOdktPNkNweXFNUFNw?=
 =?utf-8?B?RXZhOTd2Nnd5YVJCaUVsYytKYjFiU1ozWG1QaXJMYnZOa1h1TjhNcHZORGVz?=
 =?utf-8?B?TnZOQ0gwYUlwM1NHeFJvZ3NFY2VEMHFUL1BHWVBEK05MSDk1aUlHUVByWlhN?=
 =?utf-8?B?UXBSMDhJTkVrYTlSTzRjMmhPcERUZkVYTzFKU216M0cyRU1peVh2Zmtsc0x2?=
 =?utf-8?B?T2YxdUZEZWhlK3VyYlBMMnRUazdhUVJRaGwrT2RjZE9iWlUzK0xWYUtuVmV3?=
 =?utf-8?B?M05sdmp3Q3gvdVBYZHJ6STBteXQ4MGN5c0ZNMFlIS3BJQitCOHdITUU0TkVh?=
 =?utf-8?B?bWJSZlI5THZOazhGa0JydlFkZlliOGZPRTgrTm9NQ2FiemRLRUc2SlloVmxP?=
 =?utf-8?B?VEtBSG5nd3VmdjdralV3NkRTd0RLVS9DbWxWcmcvS0hZYXhkSWpWWHIwMGhX?=
 =?utf-8?B?SmZiUUpCblNIUXUwVEJOMk9pb3BMUCs3eUMzQTc4QXlpb0VNNGN0L1FWbDZz?=
 =?utf-8?B?L0dNWm1pU3gxTTN5akdoWGRaUjhWQUJZOFJCRmRmOEJMTU9iMXViaEg3YTFJ?=
 =?utf-8?B?emwyZmVvd2pGbzlrdTQ3Rjg4SzFsVmU0eDhmUktYdDVBaDhuQVlkQWFYdDZt?=
 =?utf-8?Q?p9Zxg38B2LoG3YyQG7Uv+mo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc63a02-1d0e-41da-50dc-08d9bb3494c9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 16:54:36.0359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mk1Bpej0mG3lJACo3yvQj3KZ9de6vvAV7gg1JvX3zQy8h7vSIk1XlpDHYZbrDApsjs5cdLTlHOase7hUYJYn7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4592
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------7MyazOToij2ne5RqFz0x9Flw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/9/2021 10:29 AM, Felix Kuehling wrote:
> Am 2021-12-09 um 5:53 a.m. schrieb Alistair Popple:
>> On Thursday, 9 December 2021 5:55:26 AM AEDT Sierra Guiza, Alejandro (Alex) wrote:
>>> On 12/8/2021 11:30 AM, Felix Kuehling wrote:
>>>> Am 2021-12-08 um 11:58 a.m. schrieb Felix Kuehling:
>>>>> Am 2021-12-08 um 6:31 a.m. schrieb Alistair Popple:
>>>>>> On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
>>>>>>> Avoid long term pinning for Coherent device type pages. This could
>>>>>>> interfere with their own device memory manager.
>>>>>>> If caller tries to get user device coherent pages with PIN_LONGTERM flag
>>>>>>> set, those pages will be migrated back to system memory.
>>>>>>>
>>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
>>>>>>> ---
>>>>>>>    mm/gup.c | 32 ++++++++++++++++++++++++++++++--
>>>>>>>    1 file changed, 30 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>>>>> index 886d6148d3d0..1572eacf07f4 100644
>>>>>>> --- a/mm/gup.c
>>>>>>> +++ b/mm/gup.c
>>>>>>> @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
>>>>>>>    #endif /* CONFIG_ELF_CORE */
>>>>>>>    
>>>>>>>    #ifdef CONFIG_MIGRATION
>>>>>>> +static int migrate_device_page(unsigned long address,
>>>>>>> +				struct page *page)
>>>>>>> +{
>>>>>>> +	struct vm_area_struct *vma = find_vma(current->mm, address);
>>>>>>> +	struct vm_fault vmf = {
>>>>>>> +		.vma = vma,
>>>>>>> +		.address = address & PAGE_MASK,
>>>>>>> +		.flags = FAULT_FLAG_USER,
>>>>>>> +		.pgoff = linear_page_index(vma, address),
>>>>>>> +		.gfp_mask = GFP_KERNEL,
>>>>>>> +		.page = page,
>>>>>>> +	};
>>>>>>> +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
>>>>>>> +		return page->pgmap->ops->migrate_to_ram(&vmf);
>>>>>> How does this synchronise against pgmap being released? As I understand things
>>>>>> at this point we're not holding a reference on either the page or pgmap, so
>>>>>> the page and therefore the pgmap may have been freed.
>>>>>>
>>>>>> I think a similar problem exists for device private fault handling as well and
>>>>>> it has been on my list of things to fix for a while. I think the solution is to
>>>>>> call try_get_page(), except it doesn't work with device pages due to the whole
>>>>>> refcount thing. That issue is blocking a fair bit of work now so I've started
>>>>>> looking into it.
>>>>> At least the page should have been pinned by the __get_user_pages_locked
>>>>> call in __gup_longterm_locked. That refcount is dropped in
>>>>> check_and_migrate_movable_pages when it returns 0 or an error.
>>>> Never mind. We unpin the pages first. Alex, would the migration work if
>>>> we unpinned them afterwards? Also, the normal CPU page fault code path
>>>> seems to make sure the page is locked (check in pfn_swap_entry_to_page)
>>>> before calling migrate_to_ram.
>> I don't think that's true. The check in pfn_swap_entry_to_page() is only for
>> migration entries:
>>
>> 	BUG_ON(is_migration_entry(entry) && !PageLocked(p));
>>
>> As this is coherent memory though why do we have to call into a device driver
>> to do the migration? Couldn't this all be done in the kernel?
> I think you're right. I hadn't thought of that mainly because I'm even
> less familiar with the non-device migration code. Alex, can you give
> that a try? As long as the driver still gets a page-free callback when
> the device page is freed, it should work.

ACK.Will do

Alex Sierra

> Regards,
>    Felix
>
>
>>> No, you can not unpinned after migration. Due to the expected_count VS
>>> page_count condition at migrate_page_move_mapping, during migrate_page call.
>>>
>>> Regards,
>>> Alex Sierra
>>>
>>>> Regards,
>>>>     Felix
>>>>
>>>>
>>
--------------7MyazOToij2ne5RqFz0x9Flw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/9/2021 10:29 AM, Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:b9163ccc-829e-9939-8177-a66ab41187e7@amd.com">
      <pre class="moz-quote-pre" wrap="">Am 2021-12-09 um 5:53 a.m. schrieb Alistair Popple:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Thursday, 9 December 2021 5:55:26 AM AEDT Sierra Guiza, Alejandro (Alex) wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 12/8/2021 11:30 AM, Felix Kuehling wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 2021-12-08 um 11:58 a.m. schrieb Felix Kuehling:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Am 2021-12-08 um 6:31 a.m. schrieb Alistair Popple:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Avoid long term pinning for Coherent device type pages. This could
interfere with their own device memory manager.
If caller tries to get user device coherent pages with PIN_LONGTERM flag
set, those pages will be migrated back to system memory.

Signed-off-by: Alex Sierra <a class="moz-txt-link-rfc2396E" href="mailto:alex.sierra@amd.com">&lt;alex.sierra@amd.com&gt;</a>
---
  mm/gup.c | 32 ++++++++++++++++++++++++++++++--
  1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 886d6148d3d0..1572eacf07f4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
  #endif /* CONFIG_ELF_CORE */
  
  #ifdef CONFIG_MIGRATION
+static int migrate_device_page(unsigned long address,
+				struct page *page)
+{
+	struct vm_area_struct *vma = find_vma(current-&gt;mm, address);
+	struct vm_fault vmf = {
+		.vma = vma,
+		.address = address &amp; PAGE_MASK,
+		.flags = FAULT_FLAG_USER,
+		.pgoff = linear_page_index(vma, address),
+		.gfp_mask = GFP_KERNEL,
+		.page = page,
+	};
+	if (page-&gt;pgmap &amp;&amp; page-&gt;pgmap-&gt;ops-&gt;migrate_to_ram)
+		return page-&gt;pgmap-&gt;ops-&gt;migrate_to_ram(&amp;vmf);
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">How does this synchronise against pgmap being released? As I understand things
at this point we're not holding a reference on either the page or pgmap, so
the page and therefore the pgmap may have been freed.

I think a similar problem exists for device private fault handling as well and
it has been on my list of things to fix for a while. I think the solution is to
call try_get_page(), except it doesn't work with device pages due to the whole
refcount thing. That issue is blocking a fair bit of work now so I've started
looking into it.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">At least the page should have been pinned by the __get_user_pages_locked
call in __gup_longterm_locked. That refcount is dropped in
check_and_migrate_movable_pages when it returns 0 or an error.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Never mind. We unpin the pages first. Alex, would the migration work if
we unpinned them afterwards? Also, the normal CPU page fault code path
seems to make sure the page is locked (check in pfn_swap_entry_to_page)
before calling migrate_to_ram.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I don't think that's true. The check in pfn_swap_entry_to_page() is only for
migration entries:

	BUG_ON(is_migration_entry(entry) &amp;&amp; !PageLocked(p));

As this is coherent memory though why do we have to call into a device driver
to do the migration? Couldn't this all be done in the kernel?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think you're right. I hadn't thought of that mainly because I'm even
less familiar with the non-device migration code. Alex, can you give
that a try? As long as the driver still gets a page-free callback when
the device page is freed, it should work.
</pre>
    </blockquote>
    <pre><font face="monospace">ACK.Will do</font></pre>
    <pre><font face="monospace">Alex Sierra</font></pre>
    <blockquote type="cite" cite="mid:b9163ccc-829e-9939-8177-a66ab41187e7@amd.com">
      <pre class="moz-quote-pre" wrap="">
Regards,
&nbsp; Felix


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">No, you can not unpinned after migration. Due to the expected_count VS 
page_count condition at migrate_page_move_mapping, during migrate_page call.

Regards,
Alex Sierra

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
   Felix


</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>
--------------7MyazOToij2ne5RqFz0x9Flw--
