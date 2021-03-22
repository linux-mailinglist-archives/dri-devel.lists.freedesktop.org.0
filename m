Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703D3343DC8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB7D89DFA;
	Mon, 22 Mar 2021 10:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC9489930;
 Mon, 22 Mar 2021 10:27:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6RbVX2dRoM+V4SvUxDP68g+oMrypkx+UsLPTEaVlUcuRxx3a/AiD0YMfMRjArvJT1znqmXoXpfDvi+L6DqyUHs4S0Nez/257huEoxtBiQKLArmHAQpgxw3yjcHH9++uikkaUDo9nRqaixW70bxWu+dPp4P3kELOP3sSW5LRw0mjqJR30YPzReSfcb/htvtiiIaKYXIbzRCg/uoQUD2VufVaMevyagd4TDXcitrG4q8b3+0D2HQuzy0PfeTzSjhhIjpiX9xw2vCvBSHpvgfKh5UITIA30p1ZEV0/CeCVn0ekYB0GBzzJ/ABmJOwL9ODddVvDi+hOqP0W+c4i0oYTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu85S1tb13VE2v351z6HKk4HzDVjZgv9QJA4MLE3F3g=;
 b=FCdnHuNNnhunVQG2WRs5fNwidyTkjgkmypG/PJqKfZkFqDfneK6oXwjTCVT1CddUsTF5+HQRiojaRPSvHocp3+VlsPxWF8SBRYLOQzIOpTTbDhwSbP/PrMfLpuLeu5/HJR9EnqZUgfkrY3Rqdi92Y4r22wq0ipcoZu0YH8YGQYtpKChw0RtGbLMjXxvuGhqyFO2D72mKi/8b7UJ86fs+pLm9D1lQld/bimFqBiOE+wgLTMlitxI+TDGK4eUFZ8cS0du/wF7vR4rVz7FIcxB763TCFXS5be5pxSkQvkw02hea8syPT3UwDSAcROLJZ2foIiWTngFOFA2PPOO+Y8e/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu85S1tb13VE2v351z6HKk4HzDVjZgv9QJA4MLE3F3g=;
 b=adh8xcAxeXufTzcfBqDpsOiZDq5dPvP3/vDJfxhS4zd0aD7nQ90B1rIwHPv6YDXcUV0V4dFAnCC41cAzFmzhJKQndifOWrT7+cQdUwkZAkMSEl9aq3XUBzc+zW1HXz7oug9XMZAhziudacdGdi/1dQponvIU9+RbmuEvyEvN0eyXAnt1r0e6fIVVungy76ZyEBW/gn1tYrJwu2iNGyborWOE8wgO6+z2pJ27oje2CU6N0/N8N1m5Xlk6BTOq0b8ByS3QfthnDfEZznJI4IeQHDj02qWd7jiWxwOUi1cBY6ntqF92/aLcFiFQrJbsK2ekeQA8qmP1gnaLQtc2mx1sVg==
Received: from DM5PR15CA0028.namprd15.prod.outlook.com (2603:10b6:4:4b::14) by
 BL0PR12MB4929.namprd12.prod.outlook.com (2603:10b6:208:1c4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Mon, 22 Mar 2021 10:27:54 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::39) by DM5PR15CA0028.outlook.office365.com
 (2603:10b6:4:4b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 10:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 10:27:54 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 10:27:48 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 5/8] mm: Device exclusive memory access
Date: Mon, 22 Mar 2021 21:27:46 +1100
Message-ID: <6616451.iqfUG9VtI1@nvdebian>
In-Reply-To: <20210315074245.GC4136862@infradead.org>
References: <20210312083851.15981-1-apopple@nvidia.com>
 <20210312083851.15981-6-apopple@nvidia.com>
 <20210315074245.GC4136862@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dbf1a86-3994-4f7a-2eb0-08d8ed1d2792
X-MS-TrafficTypeDiagnostic: BL0PR12MB4929:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4929A0F578E537132E588809DF659@BL0PR12MB4929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LO1tcYpP9kaKzCjpWUVxbUT1WQJg5+ARKGz260bLyqaabALLlnEUa/lFoawKA8acwWfOX4LBTo5s7kTNtkolJUVdMLo2uH+LGPPjlAdw1WAGjShO0Dof6mZdVvfwHiQEJAzWNim9UGrpbB//aeIJU0K1bIJfHPpla/+08fvavMX+IldlKRlUU7TxvAez9T4774PzxIXR3l+n3ft0IiNYMlsech65HuLU8+pCPKy8mMho73fZgBUmbwxZg8p1Jy2znkQnDK1/Pmm2ooCAOLRtxN0cVLWULnwrz83ktIKPSBoj9ya1WuFtYb6BkdJRhCY4p+WQStggi9E3CIbmKxv3EtdnXuczCZaNz4+WYMD0FcK2G/S6EhHvs3nlKs1uZ8yGwc7bBbnq8HtP86hCrm5s/NXbkbi2xEC0vWZdWJXbSTWven9AqU17rSwODO+TxvmiIt5JG5u9+lXehK1dEjM6qilI7oUy3IMkXQJF/nInRjP8agz1ECuf4jhGc1+yuHS4QwT9sNAfFxkvH6hw1QqqCdkV03+PQR6YbxLRu/GAVUP6zIDZGvratqASKZE+9KvAX9B5UM8Mqo0EBCMg7kosD1CC0g+KqBdr8BP/1/Hz0CyY70l6lZ7DzNM/UTY9HLb+3XjIy6OXnqVYRmEQdtVmwEyYN96lEqkCwPuzbo17yJMMszdmVAw05Jdz9vxvs0bA
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(316002)(54906003)(8676002)(356005)(4326008)(9576002)(8936002)(7636003)(47076005)(336012)(6916009)(426003)(83380400001)(86362001)(2906002)(36906005)(36860700001)(186003)(478600001)(33716001)(82740400003)(70586007)(9686003)(70206006)(16526019)(5660300002)(82310400003)(26005)(7416002)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 10:27:54.5462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbf1a86-3994-4f7a-2eb0-08d8ed1d2792
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4929
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, 15 March 2021 6:42:45 PM AEDT Christoph Hellwig wrote:
> > +Not all devices support atomic access to system memory. To support atomic
> > +operations to a shared virtual memory page such a device needs access to 
that
> > +page which is exclusive of any userspace access from the CPU. The
> > +``make_device_exclusive_range()`` function can be used to make a memory 
range
> > +inaccessible from userspace.
> 
> s/Not all devices/Some devices/ ?

I will reword this. What I was trying to convey is that devices may have 
features which allow for atomics to be implemented with SW assistance.

> >  static inline int mm_has_notifiers(struct mm_struct *mm)
> > @@ -528,7 +534,17 @@ static inline void mmu_notifier_range_init_migrate(
> >  {
> >  	mmu_notifier_range_init(range, MMU_NOTIFY_MIGRATE, flags, vma, mm,
> >  				start, end);
> > -	range->migrate_pgmap_owner = pgmap;
> > +	range->owner = pgmap;
> > +}
> > +
> > +static inline void mmu_notifier_range_init_exclusive(
> > +			struct mmu_notifier_range *range, unsigned int flags,
> > +			struct vm_area_struct *vma, struct mm_struct *mm,
> > +			unsigned long start, unsigned long end, void *owner)
> > +{
> > +	mmu_notifier_range_init(range, MMU_NOTIFY_EXCLUSIVE, flags, vma, mm,
> > +				start, end);
> > +	range->owner = owner;
> 
> Maybe just replace mmu_notifier_range_init_migrate with a
> mmu_notifier_range_init_owner helper that takes the owner but does
> not hard code a type?

Ok. That does result in a function which takes a fair number of arguments, but 
I guess that's no worse than multiple functions hard coding the different 
types and it does result in less code overall.

> >  		}
> > +	} else if (is_device_exclusive_entry(entry)) {
> > +		page = pfn_swap_entry_to_page(entry);
> > +
> > +		get_page(page);
> > +		rss[mm_counter(page)]++;
> > +
> > +		if (is_writable_device_exclusive_entry(entry) &&
> > +		    is_cow_mapping(vm_flags)) {
> > +			/*
> > +			 * COW mappings require pages in both
> > +			 * parent and child to be set to read.
> > +			 */
> > +			entry = make_readable_device_exclusive_entry(
> > +							swp_offset(entry));
> > +			pte = swp_entry_to_pte(entry);
> > +			if (pte_swp_soft_dirty(*src_pte))
> > +				pte = pte_swp_mksoft_dirty(pte);
> > +			if (pte_swp_uffd_wp(*src_pte))
> > +				pte = pte_swp_mkuffd_wp(pte);
> > +			set_pte_at(src_mm, addr, src_pte, pte);
> > +		}
> 
> Just cosmetic, but I wonder if should factor this code block into
> a little helper.

In that case there are arguably are other bits of this function which should 
be refactored into helpers as well. Unless you feel strongly about it I would 
like to leave this as is and put together a future series to fix this and a 
couple of other areas I've noticed that could do with some refactoring/clean 
ups.

> > +
> > +static bool try_to_protect_one(struct page *page, struct vm_area_struct 
*vma,
> > +			unsigned long address, void *arg)
> > +{
> > +	struct mm_struct *mm = vma->vm_mm;
> > +	struct page_vma_mapped_walk pvmw = {
> > +		.page = page,
> > +		.vma = vma,
> > +		.address = address,
> > +	};
> > +	struct ttp_args *ttp = (struct ttp_args *) arg;
> 
> This cast should not be needed.
> 
> > +	return ttp.valid && (!page_mapcount(page) ? true : false);
> 
> This can be simplified to:
> 
> 	return ttp.valid && !page_mapcount(page);
> 
> > +	npages = get_user_pages_remote(mm, start, npages,
> > +				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> > +				       pages, NULL, NULL);
> > +	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
> > +		if (!trylock_page(pages[i])) {
> > +			put_page(pages[i]);
> > +			pages[i] = NULL;
> > +			continue;
> > +		}
> > +
> > +		if (!try_to_protect(pages[i], mm, start, arg)) {
> > +			unlock_page(pages[i]);
> > +			put_page(pages[i]);
> > +			pages[i] = NULL;
> > +		}
> 
> Should the trylock_page go into try_to_protect to simplify the loop
> a little?  Also I wonder if we need make_device_exclusive_range or
> should just open code the get_user_pages_remote + try_to_protect
> loop in the callers, as that might allow them to also deduct other
> information about the found pages.

This function has evolved over time and putting the trylock_page into 
try_to_protect does simplify things nicely. I'm not sure what other 
information a caller could deduct through open coding though, but I guess in 
some circumstances it might be possible for callers to skip 
get_user_pages_remote() which might be a future improvement.

The main reason it looks like this was simply to keep it looking fairly 
similar to how hmm_range_fault() and migrate_vma() are used with an array of 
pages (or pfns) which are filled out from the given address range.
 
> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Thanks.



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
