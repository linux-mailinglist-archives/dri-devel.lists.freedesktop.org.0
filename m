Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45360491A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3029C10EAE6;
	Wed, 19 Oct 2022 14:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E6610EAE5;
 Wed, 19 Oct 2022 14:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6PAAvmbtYJbqQaxOZGZXKM+mAhsTb1A3rPVM58UVhW4qxbA392EYwYJ3XRyr5yoA0AAIdTkupkAJZ2xFevImr2djJAXofjO/uETJBM7AL7E/n1GVKn2Ar0j1ryb8lW/OgB5qRvQibXoVYBx0EFDuy/99LzYDZUMqr+NAejs2askzJqCeb0U9tPjVGeINxgkxnDMZl5bC2l09XmK/DAaLS2MnRnlGQiQ5bUmSHpTOgE5/cXCebIO6Y0Ue/RO13uxx0J7IC4mQV+xpw6KfcGU09VcM4xQV1n3FLVJ09Po3WY9hSO6tzm7nOWWMJJgJdDUnc5qA0lEvtCIaTUVravsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq+OHzDKgYd9oOc/R+QGhDBg6tfe8dcWkrJdUUd/CB8=;
 b=bUxbOU6FxbhI3xAOqtJHxV7k24XMwoz+wsPILjUyHLQwDs7pjWH2vKf818M7xduq4AT2Lcyd4/p7xfn2En+p+XI97Zz+T988yCqPRuhxsU3UHuYdkxy4xXGycD/KcTCo9AOh+DwX561k7+rWWa+xwv2dmAkd+gpwav08aWvwVEStD9CLKWPDbEpQ5KKYLcjXOkhMrFkPTIseOFYtezQrjsCOj6w6fRfrkY0SRW+QJiAFviA78Ux5xwcD/kZgTNuurpp/qulgSsHXrF8pCrpuNgUeq2dpLWK3SU3PnFGnSbolY2X/y+JrWHlM6FYWZEhU4jgGGDlGiQ1y0QD7aUNx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq+OHzDKgYd9oOc/R+QGhDBg6tfe8dcWkrJdUUd/CB8=;
 b=MY/PyxXxCwJiBqST7blk2KPDNea6u7gGrKZMOi28OzL9YjHtHPHAEttD/9rLazJeUAB6Wc3wH/lc874nCCuUuS6FnpnmHuSQVY5ZLQMSEbBv4Fv8V6z4+LYsUj+/ADLdUx2YVuUKoF4FD66T0Nx4HgetY6H5I9t3eKucx/O9SFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ0PR12MB5454.namprd12.prod.outlook.com (2603:10b6:a03:304::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 14:21:16 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8%6]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 14:21:16 +0000
Message-ID: <4e6cc4e5-3654-8234-603f-0913cbe31f74@amd.com>
Date: Wed, 19 Oct 2022 10:21:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSBkcm0vYW1ka2ZkOiB1c2Ugdm1hX2xv?=
 =?UTF-8?Q?okup=28=29_instead_of_find=5fvma=28=29?=
Content-Language: en-US
To: =?UTF-8?B?dG9tb3Jyb3cgV2FuZyAo546L5b635piOKQ==?= <wangdeming@inspur.com>
References: <20221007024818.4921-1-wangdeming@inspur.com>
 <a1d36d76-396a-0bf0-26b7-c009fbae5dd0@amd.com>
 <2dc397050eed4d11ade7b9020fe2e298@inspur.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <2dc397050eed4d11ade7b9020fe2e298@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0267.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ0PR12MB5454:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c414b7-22bb-4ea7-d91f-08dab1dd2edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iOnzIt6NX0rfOA39HCMgvsK6+mKJUY0kADl0IhbHiGkQNfYtg+CfR8QlDl66hgxbxm4XpGp2+rOdwvXY2jyUG2FpDlRt6YRALH6DR6horf43GytPSVx+k5UniF02o2d8nsKLsWpvr/tvPHkweM+fHJHFDzd5IVk0inTwlqhqQqA9XbLzToIU4UK8vkRXQ6uEr8j2QSkQdzXlTaNPnv5owEo1d/6gZQWo/A2e/ynFW54vuUT4P7g2ozCYbvg7NxdsC5IGBPNRlqWgBqFm8he1zPUDaZQIuV6U/HP9LqA3Cil8l3j3im9UJYkkrE6NIpld3V2djgMzr2NL3yelFKLUpnStPr1or5Uime+em4LQNhlnUXX/7uTzwh5wCb9U4P8SIfk5N7/PybSnGUtFNomyPcsRafTbTKmbXBFWcwtOZn7q7QpupCKoYSBH5DxXsjKg2112lj01wcdTGH1JSzpLGe13ISFmzotOSTieFarI/jm9+hyHUDGKrkVsKy87LWT4l4XH5wzA7Q7s+kjIrdTRF6nTqUhUQLtXXsfL5iUCQd/lCWTYCtBoIFcDLgnKiA0gyZDnx+I1DKdRgy81Mc8DQnuF1WiVLguKDj9owiKkvr5MjjHcnVnACH9qUb6pmNI9c5aK+lDaPM5jCavvihs5vpI0Uf3qkDVyqX8POaHaMjo2alKGJiJ80YgsC5BvJnXS4Jw9zCA7HliOyc9CaFkZ2PM25PZJrSfn5ZRReTRpO+359mA7Bjh4DZ3TD6m9HoMrOm+7nOsaeajGJ5wR7NuLUKAGtv8cvZNYLHlEZztBiyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199015)(4326008)(5660300002)(4001150100001)(8936002)(2906002)(66946007)(44832011)(66476007)(66556008)(54906003)(6916009)(41300700001)(316002)(83380400001)(38100700002)(6666004)(6506007)(53546011)(478600001)(31696002)(86362001)(6486002)(26005)(186003)(6512007)(2616005)(31686004)(36756003)(224303003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlI0NWhqcUdPMVBja2Jjc3p6SVF5dUFjRkJIWGxWMHZib0hQUHkyTlAycExJ?=
 =?utf-8?B?NVJNdGNhSlo2ZGh0UldKRC81dGUwTTZQa28wU3JLMGdhMmlUVXRtc1FIVEtE?=
 =?utf-8?B?UTZNRU8vRHN0T2FPeStXOCtMYjdGSHlDTXhMc2E1aGtuc3FJSERLT1MvZEp6?=
 =?utf-8?B?SWJhTW9XZGJmZTlLNzhUaDFnZ3EvaEtYV2lvNDhzeG9rRTRnR0Q0dmwxdjRW?=
 =?utf-8?B?bzFDSjUyM0ZwZ3ZqSUtoSHFheDF0dDBBQkN4NkJnWUlXbSttY0ozMlFRQ1Fj?=
 =?utf-8?B?UzFIMjdjWCs4YlcyUXJwWjNBRE5Md3gvMG5OVVMzODdaRHVUZjlnUmJhN3JV?=
 =?utf-8?B?cXZzV29aUnNEdWV1ZWlnOTR6T1NsNndURkxqKy9IOWI1andqZ1YvT2pUYURu?=
 =?utf-8?B?M2Rha2JFNllKY2E5WWh4ZHE2cXN1b255TEdTRVNhY0ZMVFJGUElvVUgxRGNx?=
 =?utf-8?B?UHFTUG1iZjhXYVErVlFWYUdyaHI2d092ZkdVbmVhKy9uai9teFZjektJeHVa?=
 =?utf-8?B?bEwyeWhJZmYxMDV3UTRMQXVFTlhJUzN0Rm1jODJiT1hRczYwWjdha0lHSzBC?=
 =?utf-8?B?L1JNOW93RWJCOGxmSDA1aWtMMHllcDk2T2MzNVFmZ0pwWEFzcnNwZmVId2x5?=
 =?utf-8?B?MkF2RVVPUHVKT1FvZXBDQ2tITmhGdC84WUVHRDhQL3ZFRjJyOUl6UTRtd2hC?=
 =?utf-8?B?WmNpRXhFR2grK3pvTXJJUDlRME1TT0ozWS8vbEVVT1pwUllUWldxR3ZCMjZD?=
 =?utf-8?B?aTloTzdZVVNIZHc0SkhLOXZHeGxCRDNSQVRyZHdpYUNNZGhHZTR6U0ZQUzQ5?=
 =?utf-8?B?cFZVUkVsZExHeFo5dVlRQVBWQlRxb0dwYUNYZXJSOVBCNXUyYTVuWldIUmRE?=
 =?utf-8?B?cmZ5MmQvbzc2NUhVVDU3UExZK2NOWThuNkpsL1hDQnRibzF2c2dEMEw3YnJp?=
 =?utf-8?B?YmZpMXA0cGl0UDA5K3YyNGtobDQrb1NaaUJCL2h5RDNkOWZHeGdrNFRkWlZP?=
 =?utf-8?B?NGpvUjZvckR4dnZEai96dFp3cXdOWU1lNjBMd2hBT1p6N0JYRjBZai9PZm5s?=
 =?utf-8?B?SC9Oc3FGeUpxVExQYXhValluTmZxTnZtZkJ0T2UvZ2UrOXM1Z2dCWEdxYnVa?=
 =?utf-8?B?ZWZjOHdLTTlVOHNWb1liV0pqeHkvUC81Vy9iR0UvVHc4dWFWeVhQUElXV3Vm?=
 =?utf-8?B?ZzJCN1B2Rnl3cWZkZ1ZqZy9WR2ZOcTI0RUJxL1UyMWhRK2EvZW0zSFdNenI5?=
 =?utf-8?B?dS9iZDdvUVh0Q1MwSE9GdGZwTFRiVEhBWmhXeGNoMmVLTy9CcUpvZEZuVDIw?=
 =?utf-8?B?K0duTEd6RjNyZk9zOUNIbHZ6dkFHVVJzZ3Q0eFNKMDhFdUZ5TnZDZms4dFdi?=
 =?utf-8?B?dUZMb1p5aWc1V2RGYXVtajROa1BiTVdDWDAwTm5leXgwT0hhaDI5aU8wNmF4?=
 =?utf-8?B?OXYxK25VNTNGSDBWckZRdm5SbW1mcmtiQ2UxdmR3aUQzczdVWEhoeFA2RzNG?=
 =?utf-8?B?R2p0TkJaSFBSVXdXTWd3Wmc4WWd0aEgrQVVGck11dTRVVC9tYnowRkpVMDFp?=
 =?utf-8?B?a0pnWjZFcFBJNkV3SmRjQ29vWlFqZERERTNqY2d4ZDlsaTZnSlR1c3NCUEJR?=
 =?utf-8?B?RU8vT09VZlZQVDZieG1WUEZBd082QTlYU0pTdHlpaG9uREcramJsRm12M0Yr?=
 =?utf-8?B?cS9YWnY2SS9CUFVhdXRPdWllNHF6OWhIb0pHMVdMVGhWajZxSkZJYzgyaWhB?=
 =?utf-8?B?S0o1ZDJJZXNBU0N3d09tVUVJemhoajNvYkJ3NXUvWSt1ajhuN0ZpdUUwSWE2?=
 =?utf-8?B?aStLMXYweXFGb0Z4OWswZ1ZvNTYrSEZuK21vTnlXVGZ6T0IxU0UvWXZBeXdU?=
 =?utf-8?B?ell5YXRMeEVFOUpTYldWOWJ6b1Q2d1p3b1NNSDVMOFRMSEFuQmtKNThkUFVL?=
 =?utf-8?B?UFc5aHl2NURuMWdVY3RHV1FzWEt0TUZxcU81NExuZTg3M2NUdy9CbTFzd1FC?=
 =?utf-8?B?THZJTFVneXRybWtNTWxtOFBvUDM3VFl2Zk9peXFwZHZlelFSOUwrdjNJMFlD?=
 =?utf-8?B?Si96WnpPTXRZbFZMWUNNWHp6UHJPNERlUVc3QlpwcGxmeXRWVmF2NitWM2VW?=
 =?utf-8?Q?a00CJXbQrwCQh5t3wv7IRKr4T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c414b7-22bb-4ea7-d91f-08dab1dd2edf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 14:21:16.0063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4JiHycKBC953zwrsABLHmpErFSZhUf93t+yc9dKnZUmW56BKJngbJwnsWvUEAMq0+HKJC4CGTqhlCmzG6aVMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5454
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
Cc: "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-10-17 um 20:47 schrieb tomorrow Wang (王德明):
> Hi,
> The function vma_lookup show below.  Vma valid check is included in it. Or, What other questions do you have?

My question is, why did you leave the find_vma call in 
svm_range_is_valid unchanged? I don't see a technical reason, but maybe 
I'm missing something. If there is a reason, please explain. If there is 
no reason, please fix that place as well for consistency.

Thanks,
   Felix


>
> static inline
> struct vm_area_struct *vma_lookup(struct mm_struct *mm, unsigned long addr)
>   {
>           struct vm_area_struct *vma = find_vma(mm, addr);
>
>           if (vma && addr < vma->vm_start)
>                   vma = NULL;
>
>           return vma;
>   }
>
>
>> from: Felix Kuehling <felix.kuehling@amd.com>
>> time: 2022年10月18日 3:35
>> to: tomorrow Wang (王德明) <wangdeming@inspur.com>;
>> airlied@gmail.com; daniel@ffwll.ch; alexander.deucher@amd.com;
>> christian.koenig@amd.com; Xinhui.Pan@amd.com
>> linux-kernel@vger.kernel.org
>> sub: Re: [PATCH] drm/amdkfd: use vma_lookup() instead of find_vma()
>>
>>
>> On 2022-10-06 22:48, Deming Wang wrote:
>>> Using vma_lookup() verifies the start address is contained in the
>>> found vma.  This results in easier to read the code.
>> Thank you for the patches. This and your other patch look good to me.
>> However, you missed one use of find_vma in svm_range_is_valid. Is that an
>> oversight or is there a reason why we need to use find_vma there?
>>
>> If you're going to respin it, you may also squash the two patches into one.
>>
>> Thanks,
>>     Felix
>>
>>
>>> Signed-off-by: Deming Wang <wangdeming@inspur.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 12 ++++++------
>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index 64fdf63093a0..cabcc2ca3c23 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -1586,8 +1586,8 @@ static int svm_range_validate_and_map(struct
>> mm_struct *mm,
>>>    		unsigned long npages;
>>>    		bool readonly;
>>>
>>> -		vma = find_vma(mm, addr);
>>> -		if (!vma || addr < vma->vm_start) {
>>> +		vma = vma_lookup(mm, addr);
>>> +		if (!vma) {
>>>    			r = -EFAULT;
>>>    			goto unreserve_out;
>>>    		}
>>> @@ -2542,8 +2542,8 @@ svm_range_get_range_boundaries(struct
>> kfd_process *p, int64_t addr,
>>>    	struct interval_tree_node *node;
>>>    	unsigned long start_limit, end_limit;
>>>
>>> -	vma = find_vma(p->mm, addr << PAGE_SHIFT);
>>> -	if (!vma || (addr << PAGE_SHIFT) < vma->vm_start) {
>>> +	vma = vma_lookup(p->mm, addr << PAGE_SHIFT);
>>> +	if (!vma) {
>>>    		pr_debug("VMA does not exist in address [0x%llx]\n", addr);
>>>    		return -EFAULT;
>>>    	}
>>> @@ -2871,8 +2871,8 @@ svm_range_restore_pages(struct amdgpu_device
>> *adev, unsigned int pasid,
>>>    	/* __do_munmap removed VMA, return success as we are handling stale
>>>    	 * retry fault.
>>>    	 */
>>> -	vma = find_vma(mm, addr << PAGE_SHIFT);
>>> -	if (!vma || (addr << PAGE_SHIFT) < vma->vm_start) {
>>> +	vma = vma_lookup(mm, addr << PAGE_SHIFT);
>>> +	if (!vma) {
>>>    		pr_debug("address 0x%llx VMA is removed\n", addr);
>>>    		r = 0;
>>>    		goto out_unlock_range;
