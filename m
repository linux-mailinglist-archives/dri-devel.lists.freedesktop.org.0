Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11E4B79F2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 22:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446F010E562;
	Tue, 15 Feb 2022 21:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FDE10E2E9;
 Tue, 15 Feb 2022 21:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bawu3x0Z78WTONJf3Xtg/usIqEEuta6F4kQPYfXKtcUGHQYwVo27Bw98z8oumPGLiWI6emh9Ffd5uX91r4aMG6fuZh517E7+gcdiyPKo/KQn0oUVYTR3rVPs39A/wZobHLhCs/YhKA+me8yIldlWNvLs2EIKCgzi9lZ3v0qB/baWk4KTrkx31h+MLvfrO5bTZoeQF/y7Ah96FeLoIA6HZrNBUH9g4g0mrqVJ2VhtAfzzr7TiKObV5/VsxD1iRez3FQXlCntNfnuJe/P61sU1p3ZGpDUf9wjJo6FgZqNYydly/iekxmHsAHkKV6xly0kPaPaoZJutBGayiJU3qKgreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSywJWj12peroQ+wVTN6Ck53E9Hf6v7ckds+ZMGCWEg=;
 b=NrkYt+xPrK16PCtwmtA7jNqJ9MjrNKzBnQHJatjc2jfwBZGCB6s6xzAfx/7PRV5J1cevmuKf272fcbYZE9pLCNzW758t3lIuw5mc+lx0yhOlS7S06EVzOV4/InzsJb93BsWK+wEjDVTCjY37w8f4Fr/kfw2tmWzVxWqWIVzykenRTQ0/5LGroit6mpGU4pdcXI+BtZoKw4lA2t0W4kW3lAh44zNe4a4NDW47Kbursv5707twWz5723m+OFqAzEEPsuL5TKc8oN0tbA1cYCzHo5PtkV/gu/1Pvzx+rCjlYbCcL4TMIC3cVvMrFQKCAlRzsjNIvxTQu1fHz98Ead2izA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSywJWj12peroQ+wVTN6Ck53E9Hf6v7ckds+ZMGCWEg=;
 b=sH+AFfr5esjzH/NurFcw955YoeN1kuAPJbGBHh1mwLXtuXQ2omozNLJU7pVMMBGAJttJ0EKivm6R0SCfbnok6JkaPnyY7yXozqCFFmvkGXPmuczc1CjTKah91uLItBySfgsXcJJnUyuENwhSSSKBAJqIABKJk5jnpEK02ehqNjXpPJeo4VmH469HGD6TGdniF8bgVT4QjQURj8d3MFaSIqghNDnz1tb2GaLgHw16DlrIbexifZTW6dvaZRUgbG6LtffFJKfvtXVTXfqBxFT2GyeVIZBgj0Q4KPdex2MAZdfFVkRXh1S/XFuj9LjRiiWpg6zZJil7OHwTDYpDHSK6sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by BN8PR12MB3620.namprd12.prod.outlook.com (2603:10b6:408:49::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Tue, 15 Feb
 2022 21:50:47 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::498:6469:148a:49c7]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::498:6469:148a:49c7%6]) with mapi id 15.20.4995.015; Tue, 15 Feb 2022
 21:50:47 +0000
Message-ID: <487fdaad-0873-142a-cf3a-a065bc8acff6@nvidia.com>
Date: Tue, 15 Feb 2022 13:50:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/3] migrate.c: Remove vma check in migrate_vma_setup()
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
 <6831bf69f7c7699be83b31c9c56212b5fb07f873.1644207242.git-series.apopple@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <6831bf69f7c7699be83b31c9c56212b5fb07f873.1644207242.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fab9d82-0ce1-45fd-433b-08d9f0cd3928
X-MS-TrafficTypeDiagnostic: BN8PR12MB3620:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3620357CBCD7A4361CE11954A8349@BN8PR12MB3620.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NIfUHG3g9HDL4S1Wwq5Qiq6QWO9xgAEaJKczifFn+a/T1cNrLmtWE0c28YM0Sk7huWymtzUu31uAfXqGzdwPYv2Uuj+6U7NvT0/YnJK3V2LtdCFyws2SjTkol92EYA+lI3V4gY6oGefj4qLX+G2FFu95c04FXq8rc6cicUqA3StugZ8Gs08cB8sndRSrD5ccHR2N85TznYFM3LlAE0+f1UMG1sXNp9iaCyybmkXukPjgFdsppeO8d0JjU9QnUFrJGyWKFodGK1gHeQrpFaCmJx2XIpONB4vZEkkX5OKGqoJ2mUvbyPH49kQMXkqTavlR7Eftq6Es40Gizmlxh61gnGbdUq7L/1kSDZgzXTZy7HadUbQSd4+i0VN1HIE/QcNWLmHubn3rUtDZXn6vDPZ1pS3l5RAcsAxjxAXolJ6UkiJ3qDPW5J60PGegbn6SqqcEUzfjj5eXobthm01T/iE2i9x8qXU4MvjjV6kTjMBM1I1YIMvjqac5lDsqXbjF6BFdpSsdV9WGU3Q/4C6KDr63jQdJmPKOtpeT1v8llb6mZzTcjn9HS6Vy/ev5cIMwiFjJKoicpKgxuM4jKt42UNPkh9vf6vh4AO40jbeCTEtLSBBlW01NEcJ5jSsJs102KPReDjDkKMzYXmEFMmwekeQLWGtB1wFl0uALrRjxL7AJ9XCHdnK/89rY4l6nvsPhspEwiH1s58nkTrx/xqvsUjFMGbjYSoYAMVFivFh6u9ZVrSV6avjlvNMsqCDNLOq01BGb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(86362001)(31696002)(66476007)(66556008)(66946007)(8936002)(2906002)(8676002)(316002)(31686004)(7416002)(36756003)(2616005)(6512007)(6666004)(5660300002)(4326008)(186003)(53546011)(6506007)(508600001)(26005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0o1ZVliR3MyMU9Hdk50clk2VGdIQzdBdDUzTHZsejlZeTUrWFhuWTBUdVhn?=
 =?utf-8?B?NEtienpwaE1tcGU4UUJHRGt0b1ZHUmtreW5IckFHVDdROGQ3aVFPVGJRODFR?=
 =?utf-8?B?SDc1ampDaFA4eUdMd1JtcVJCRjFRTm9FbVorZ3lYSHp1UXFvOWVPNjhKWlh4?=
 =?utf-8?B?RHR0Z2ZGR082QVhjaXBRaElMQldFU0t3NXB6WTRUdHlWZlJTdW5jbDBOeGJs?=
 =?utf-8?B?OHZCUGY0ZkRwcUdYQnB2NXE4NkExeWhPd2JYRjBtYUFnSFdpL1dEVXYxb1F2?=
 =?utf-8?B?QUtVUFYybFFqL3p3VklCcWFQUEp3VkNvMmpneExqYUFDUy9GWUg1QThweXdm?=
 =?utf-8?B?TDlEZHl6QjVsZEMzMXA0S0dSYkRkcXpleFovSzR2YUZyVWhRUUhBY2JZNnJ0?=
 =?utf-8?B?bVFGSGFmMTl2U1hsaTIvUC9jWUwxN0FxWnRMOER0RTFUTlpiSTVLbTdhVnpu?=
 =?utf-8?B?QmxuaWZ3MHhrMU90cU5KZk5YelVoNmFNOVJ6ZFpTcG8rSUMwNUp6YUQ4RnR6?=
 =?utf-8?B?RU1xeFVpNnlFQ0swd1ltdXpjNEUvbE4xT0trdHlrSmlWQUNaNTB4UXF2WG1K?=
 =?utf-8?B?MVg5KzV3VE1FU2FDRERISndDT0NKZUt3Vk1pQ0NlTWQ5Wm0xNmF0c0hBeTZ2?=
 =?utf-8?B?RVFFU2drNnRFTElhT0xCTllZdWNjOVgyNXZ3bWg5My9peWRjdWVKT3hXeGZ5?=
 =?utf-8?B?T3daRnorQytVTjJnTWx5a05vVk12K2k4RUFCc0NWRHFtdlJMeDNKbS96djBC?=
 =?utf-8?B?RVFMdFZnOTcwd1hYZkJjSnk0Wi9CT2xhUFFyTjFibStmMk9XYk85YzhtWEhH?=
 =?utf-8?B?akZ5dFdab1FiNTdxMlF6L1RRaHF2dUk2Z1N3NStmaEg1ZnRveTBLUkNYTUJy?=
 =?utf-8?B?SVlNdUlVZ2Y2WFRFTXFDRjljcWNTSmlSZzE5WFhyYlRubExyREcvdDJJQm9M?=
 =?utf-8?B?eGtMUGErMURTbE9aeXFqVG5PMThYR0RNMHJnMVcyalpKUEt2aGRzUkhaWEZI?=
 =?utf-8?B?RjhZaEN2bzJYaTNsWmN1TTlXYVFGMWdGZlFodTFrWlJsMU5zSmdUMmw0alA1?=
 =?utf-8?B?TzJ1NVVsNWtDSVN3WE9nTUE2dHRWWitmd2MyQnNWNUJjUFh2c2Q0dmhxT2ZI?=
 =?utf-8?B?WnhaVG50ckNpUUloSkd4NHRrUmpsckM2UzFuYkJBV3ZOQXlkaDREa3NjTjBU?=
 =?utf-8?B?cDZSb1RkMmtEdUhLRk51MmtDWDNrQXNzdS9oMmxOZWxPMDNvMUdWVkZqK2VM?=
 =?utf-8?B?bEUyK0ZDSHJ1U1ZpMDhESGdtNnAxQUVPMTNhMHZnUVQrV1Y1U283TDJhUUJC?=
 =?utf-8?B?NU1rUUZFWUx6djY3Yy9sMlZ6T29TZ3hGQ0x4S2xTajRabUd2RlhJQnB1bW9j?=
 =?utf-8?B?cDlhU0Zpa3k0bE9qK1RWL09MS1A2TjQwUHNOc3dkNFdlOFFDeVhmR1F6QjdI?=
 =?utf-8?B?STZvUWMySy9GUkdSN3VaN2NBa2QyaEVnLzhEVVFQQmQ4M0pFVXBFRlo0NS9j?=
 =?utf-8?B?dFdWK2xvMFZTaXdIeXFRSmc5UFRZNVVvSnNKVzBPdXoxNXV0dWVENEwvd1RI?=
 =?utf-8?B?UFJWV3ZCTjhiUFpRU1d2bzhsMTNic1k3M2FQVDkwakVub3czMXU1ZU44bG9B?=
 =?utf-8?B?Y0h2YW5ROW5SK1doRHlRdGtoUGkzL1V6RjNkNXA0VjZFTkhrTkc4eVNiaE1a?=
 =?utf-8?B?RlJOM3o5UFpIaDhrYndtbWwrSTM4MUtNRW5iOGh0ZkpvTE5TeUQwVjcvalBR?=
 =?utf-8?B?SzhCWlVyaWFseXJLcVhRK1BCamxtTUNNOEJFWkxHOEpTSkJ5ejFoODRLbENV?=
 =?utf-8?B?a0U4Tmw5TGIrTWowdVB3eTRjYUZqandNZGN6ZS9odXlCd2tKRkZUUmFKR1RI?=
 =?utf-8?B?V1UzWTMyUkZidjZiaFZHbG4rK1lkcmdTSWVPS20xZmYvZzkrR0hwZndsTUE0?=
 =?utf-8?B?RFAyVS9iMmFqUlVYRTZMTU5kRGUzODd5U0dzRWRFSTJzUFpvN3p6NVZyRmVy?=
 =?utf-8?B?aVBIMWMzRExCSnR1bnVnWk12STNkRTZMSXE5cmxYdCtLU3RTRnlEOUgxRFRa?=
 =?utf-8?B?SmVxeFRXTVBIaUVQOGhROFZnVDNFR1RLWXpucDBvTXZWb2YyMFdKczY3WGtn?=
 =?utf-8?B?UDQwY1NBY0NJNEpzY1BseGJZQ0M0Q1JSN2RTUzhZOTFad2lNY1FkTFR4bVg3?=
 =?utf-8?Q?2Af13epG7JE5NSkIAxLZL+M=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fab9d82-0ce1-45fd-433b-08d9f0cd3928
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 21:50:46.9256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbcMlCqV1Pa0dmV/cTuSc9xwfQ7+6rXCvfAbTB/dfYYBZY4pCsRbPBNiZd85QeCJh6mpvOK2PI11z1FDxodXOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3620
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/22 20:26, Alistair Popple wrote:
> migrate_vma_setup() checks that a valid vma is passed so that the page
> tables can be walked to find the pfns associated with a given address
> range. However in some cases the pfns are already known, such as when
> migrating device coherent pages during pin_user_pages() meaning a valid
> vma isn't required.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
> 
> Changes for v2:
> 
>   - Added Felix's Acked-by
> 
>   mm/migrate.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 

Hi Alistair,

Another late-breaking review question, below. :)

> diff --git a/mm/migrate.c b/mm/migrate.c
> index a9aed12..0d6570d 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2602,24 +2602,24 @@ int migrate_vma_setup(struct migrate_vma *args)
>   
>   	args->start &= PAGE_MASK;
>   	args->end &= PAGE_MASK;
> -	if (!args->vma || is_vm_hugetlb_page(args->vma) ||
> -	    (args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
> -		return -EINVAL;
> -	if (nr_pages <= 0)
> -		return -EINVAL;

Was the above check left out intentionally? If so, then it needs a
commit description note. And maybe even a separate patch, because it
changes the behavior.

If you do want to change the behavior:

* The kerneldoc comment above this function supports such a change: it
requires returning 0 for the case of zero pages requested. So your
change would bring the comments into alignment with the code.

* I don't think memset deals properly with a zero length input arg, so
it's probably better to return 0, before that point.


thanks,
-- 
John Hubbard
NVIDIA

> -	if (args->start < args->vma->vm_start ||
> -	    args->start >= args->vma->vm_end)
> -		return -EINVAL;
> -	if (args->end <= args->vma->vm_start || args->end > args->vma->vm_end)
> -		return -EINVAL;
>   	if (!args->src || !args->dst)
>   		return -EINVAL;
> -
> -	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> -	args->cpages = 0;
> -	args->npages = 0;
> -
> -	migrate_vma_collect(args);
> +	if (args->vma) {
> +		if (is_vm_hugetlb_page(args->vma) ||
> +			(args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
> +			return -EINVAL;
> +		if (args->start < args->vma->vm_start ||
> +			args->start >= args->vma->vm_end)
> +			return -EINVAL;
> +		if (args->end <= args->vma->vm_start || args->end > args->vma->vm_end)
> +			return -EINVAL;
> +
> +		memset(args->src, 0, sizeof(*args->src) * nr_pages);
> +		args->cpages = 0;
> +		args->npages = 0;
> +
> +		migrate_vma_collect(args);
> +	}
>   
>   	if (args->cpages)
>   		migrate_vma_unmap(args);
> @@ -2804,7 +2804,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>   			continue;
>   		}
>   
> -		if (!page) {
> +		if (!page && migrate->vma) {
>   			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
>   				continue;
>   			if (!notified) {

