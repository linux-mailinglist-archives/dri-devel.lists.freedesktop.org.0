Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06241E5D1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 03:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4F36ECDD;
	Fri,  1 Oct 2021 01:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4756ECDD;
 Fri,  1 Oct 2021 01:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBmmDRBwLMojijJizPh/gA3nuTSCqS68keyrQ6p0tqhTGee1SAc+Cv97tV9C1tjx6iAJur+MAEsg29kZbdNdIyO7/TNAZcro4tkVbdBP98pyjW+OWG7VgDmWz0miIUUMwJD+XJL3z7FCm02AuvaEu4n9qta44QVyZVhnL6sZTTN130YK96/PJOXJBTGyGGZ5AW3tMhZYpeqpKgJka/zSfJETG7V4XmlaLdiybDRmT0fn9RSLIbTcJbwkrZSw+v6QoDylYBnTwS1InNp2cVdvrC1DAUP9u0FEs63bEFIOwAz1hsb2Maoa7ebaS7iYV3LTon/wSDEJr9cKg4kBcuO7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj86CJdHIDnudpjJ2FYNKAZU0t+8WVAzl1pRkPrdY3o=;
 b=OP5By3G7FsC792jgB6aPLRleyoaFn3AVDNXsbg1GfAaHWwt9lMj53pkNLmc9mjWRXCYF/Ry+Vc+PaI3XndF/7ajXHRURLoG3psXbvwGug0IYWnkFBGL2bOLabSAEZGP2RlYibq0yB5noH8zU1ZYttHL0DM3Dd1sYL1SeTj38UHqob9sGm0BnSxOs9u+CWskDLBeB3bHVPbbQxAXXA1UpwkmGc+R8SLuYdHzXsgquWue9YE31FeDah0KSrokzO0C7YHJSLgH340+odlZl8KKOoTD6oaFnrvjljJfpnZ6MUGfTyRRNvjkyuwGn5MvM6+YM75cDgT/ckmUmdT+1XE//2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj86CJdHIDnudpjJ2FYNKAZU0t+8WVAzl1pRkPrdY3o=;
 b=YOItHHaw0ucRutkTxTm0m8s9TtD4OeJstBEoVbVVVKCJGhEXYavyq9oMmHMhv8zXr9u1OPxwSvW+O5Ss6gBwWpFVsVVvr/Crbn9Bpa/ZvuImZ20TOK3A01siwrIjwGvdE48PeVkOJ6zwzeJPSBlSZiiHc9imnFBJUFWSxTbCw4RFosbmvWutLQVaAZzFmp+e+xmisDckU8KH8kiDgf0yQ3GF+DyibqXDpWc7Z+XaJ5v8P1c5JSPWLqxi93+XlZDxo5kgMJTYcIk7PmQw6VHca10tEQWO9amr48a2TImtwcVGQidvw9IhJdjW9UaGPoG4eQKUpiS1xH7nCh4jY/kBYw==
Received: from DM5PR18CA0091.namprd18.prod.outlook.com (2603:10b6:3:3::29) by
 CH0PR12MB5315.namprd12.prod.outlook.com (2603:10b6:610:d6::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14; Fri, 1 Oct 2021 01:32:15 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::d8) by DM5PR18CA0091.outlook.office365.com
 (2603:10b6:3:3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 01:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 01:32:14 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 1 Oct
 2021 01:32:09 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>
Subject: Re: [PATCH v2 10/12] lib: add support for device public type in
 test_hmm
Date: Fri, 1 Oct 2021 11:32:07 +1000
Message-ID: <5085060.BnOf7i5VvV@nvdebian>
In-Reply-To: <20210913161604.31981-11-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
 <20210913161604.31981-11-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 603276db-c836-4cf9-1db1-08d9847b4c41
X-MS-TrafficTypeDiagnostic: CH0PR12MB5315:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5315A8B2B7275CF1044A9041DFAB9@CH0PR12MB5315.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rJh/mCd3a48+DtC6TUWh2LtSjuOcyFX198jCOvkTeJgnlLGAXMF59MvemX0ULvUbnejod/1LZQ7lhT8iyof1YIJlwMT1tODEaCbKZ1p0ZWIM6ycFLAwaxxfZxw/g4fwoMoTJTBCugRLk5b7u11tMdMFemLBqeR8pWX0OwxIWp8CU7HrMky9EfgANS90gj0Wul8BVHHPRSoGjzvVGTly1Pl9xG9XFVUtPsaf+MJkrw2+zpMRraj8B7PQfVwohc80clzGVqBndsG6iHDPJYwHzWBbwJ0XfhlB6OZV2s0j6qVn1ItHEFe53TZ32ZtYa44RmCkjpBXBlZqGhw95aWysYjc7nMlizxBlyjQwQB04ETrjv2h3/e6jizhdveP77wUityPjZpelIRqb0VIBDig8NLie4h2W7Ipe6/E5qCzksVc/mf0HJBro7B80EWbNa7ukm4I5ALtcIpadtTeMpc9HzKWUI19McMEUPQH4Dv8HqmQ2AYyXHNC4zhDUA6iYpMZQsP15apBxGZiQoKQS+SRIr3nkCvPeU3hQY9oyQFZqPhIf0SnYLaNR6LDyU1MNmdo5ovsTD87+DZWHC1ubB1HJFlJP10InJkIkP2aIS8/pDOyZLniOVcFA+QhXbL1jUuqjo/UGVnxNisz8A/Im3D0O74jrF/7sQlN1q4atOrZxtifr+JTWOu48AJqGdmvDmKl1DiYQr8w6z58OYPu8NpoR8UEdhZjz2aIDGOHDFBPZOAcQ=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(26005)(426003)(186003)(2906002)(5660300002)(9686003)(7636003)(9576002)(82310400003)(8936002)(70586007)(83380400001)(508600001)(33716001)(70206006)(16526019)(316002)(36860700001)(30864003)(110136005)(54906003)(7416002)(86362001)(8676002)(336012)(4326008)(356005)(47076005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 01:32:14.3346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 603276db-c836-4cf9-1db1-08d9847b4c41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5315
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

On Tuesday, 14 September 2021 2:16:02 AM AEST Alex Sierra wrote:
> Device Public type uses device memory that is coherently accesible by
> the CPU. This could be shown as SP (special purpose) memory range
> at the BIOS-e820 memory enumeration. If no SP memory is supported in
> system, this could be faked by setting CONFIG_EFI_FAKE_MEMMAP.
> 
> Currently, test_hmm only supports two different SP ranges of at least
> 256MB size. This could be specified in the kernel parameter variable
> efi_fake_mem. Ex. Two SP ranges of 1GB starting at 0x100000000 &
> 0x140000000 physical address. Ex.
> efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  lib/test_hmm.c      | 166 +++++++++++++++++++++++++++-----------------
>  lib/test_hmm_uapi.h |  10 ++-
>  2 files changed, 113 insertions(+), 63 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index ef27e355738a..e346a48e2509 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -469,6 +469,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  	unsigned long pfn_first;
>  	unsigned long pfn_last;
>  	void *ptr;
> +	int ret = -ENOMEM;
>  
>  	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
>  	if (!devmem)
> @@ -551,7 +552,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  	}
>  	spin_unlock(&mdevice->lock);
>  
> -	return true;
> +	return 0;
>  
>  err_release:
>  	mutex_unlock(&mdevice->devmem_lock);
> @@ -560,7 +561,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  err_devmem:
>  	kfree(devmem);
>  
> -	return false;
> +	return ret;
>  }
>  
>  static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
> @@ -569,8 +570,10 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>  	struct page *rpage;
>  
>  	/*
> -	 * This is a fake device so we alloc real system memory to store
> -	 * our device memory.
> +	 * For ZONE_DEVICE private type, this is a fake device so we alloc real
> +	 * system memory to store our device memory.
> +	 * For ZONE_DEVICE public type we use the actual dpage to store the data
> +	 * and ignore rpage.
>  	 */
>  	rpage = alloc_page(GFP_HIGHUSER);
>  	if (!rpage)
> @@ -603,7 +606,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  					   struct dmirror *dmirror)
>  {
>  	struct dmirror_device *mdevice = dmirror->mdevice;
> -	const unsigned long *src = args->src;
> +	unsigned long *src = args->src;
>  	unsigned long *dst = args->dst;
>  	unsigned long addr;
>  
> @@ -621,12 +624,18 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  		 * unallocated pte_none() or read-only zero page.
>  		 */
>  		spage = migrate_pfn_to_page(*src);
> -
> +		if (spage && is_zone_device_page(spage)) {
> +			pr_debug("page already in device spage pfn: 0x%lx\n",
> +				  page_to_pfn(spage));
> +			*src &= ~MIGRATE_PFN_MIGRATE;

I don't think this is quite correct, callers shouldn't modify the src array. To
mark a page as not migrating callers need to set *dst = 0.

However I think this should be considered a test failure anyway. If we are
migrating from system to device memory we would have set
MIGRATE_VMA_SELECT_SYSTEM meaning no device private pages should be returned.
Therefore I don't think we can reach this unless there is a bug right?

> +			continue;
> +		}
>  		dpage = dmirror_devmem_alloc_page(mdevice);
>  		if (!dpage)
>  			continue;
>  
> -		rpage = dpage->zone_device_data;
> +		rpage = is_device_private_page(dpage) ? dpage->zone_device_data :
> +							dpage;
>  		if (spage)
>  			copy_highpage(rpage, spage);
>  		else
> @@ -638,8 +647,10 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  		 * the simulated device memory and that page holds the pointer
>  		 * to the mirror.
>  		 */
> +		rpage = dpage->zone_device_data;
>  		rpage->zone_device_data = dmirror;
> -
> +		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
> +			 page_to_pfn(spage), page_to_pfn(dpage));
>  		*dst = migrate_pfn(page_to_pfn(dpage)) |
>  			    MIGRATE_PFN_LOCKED;
>  		if ((*src & MIGRATE_PFN_WRITE) ||
> @@ -673,10 +684,13 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
>  			continue;
>  
>  		/*
> -		 * Store the page that holds the data so the page table
> -		 * doesn't have to deal with ZONE_DEVICE private pages.
> +		 * For ZONE_DEVICE private pages we store the page that
> +		 * holds the data so the page table doesn't have to deal it.
> +		 * For ZONE_DEVICE public pages we store the actual page, since
> +		 * the CPU has coherent access to the page.
>  		 */
> -		entry = dpage->zone_device_data;
> +		entry = is_device_private_page(dpage) ? dpage->zone_device_data :
> +							dpage;
>  		if (*dst & MIGRATE_PFN_WRITE)
>  			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
>  		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
> @@ -690,6 +704,47 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
>  	return 0;
>  }
>  
> +static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
> +						      struct dmirror *dmirror)
> +{
> +	unsigned long *src = args->src;
> +	unsigned long *dst = args->dst;
> +	unsigned long start = args->start;
> +	unsigned long end = args->end;
> +	unsigned long addr;
> +
> +	for (addr = start; addr < end; addr += PAGE_SIZE,
> +				       src++, dst++) {
> +		struct page *dpage, *spage;
> +
> +		spage = migrate_pfn_to_page(*src);
> +		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
> +			continue;
> +		if (is_device_private_page(spage)) {
> +			spage = spage->zone_device_data;
> +		} else {
> +			pr_debug("page already in system or SPM spage pfn: 0x%lx\n",
> +				  page_to_pfn(spage));
> +			*src &= ~MIGRATE_PFN_MIGRATE;

Same comment as above - shouldn't touch *src and also shouldn't be able to get
here anyway.

> +			continue;
> +		}
> +		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
> +		if (!dpage)
> +			continue;
> +		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
> +			 page_to_pfn(spage), page_to_pfn(dpage));
> +
> +		lock_page(dpage);
> +		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
> +		copy_highpage(dpage, spage);
> +		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +		if (*src & MIGRATE_PFN_WRITE)
> +			*dst |= MIGRATE_PFN_WRITE;
> +	}
> +	return 0;
> +}
> +
> +
>  static int dmirror_migrate(struct dmirror *dmirror,
>  			   struct hmm_dmirror_cmd *cmd)
>  {
> @@ -731,33 +786,46 @@ static int dmirror_migrate(struct dmirror *dmirror,
>  		args.start = addr;
>  		args.end = next;
>  		args.pgmap_owner = dmirror->mdevice;
> -		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
> +		args.flags = (!cmd->alloc_to_devmem &&
> +			     dmirror->mdevice->zone_device_type ==
> +			     HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ?
> +			     MIGRATE_VMA_SELECT_DEVICE_PRIVATE :
> +			     MIGRATE_VMA_SELECT_SYSTEM;
>  		ret = migrate_vma_setup(&args);
>  		if (ret)
>  			goto out;
>  
> -		dmirror_migrate_alloc_and_copy(&args, dmirror);
> +		if (cmd->alloc_to_devmem) {
> +			pr_debug("Migrating from sys mem to device mem\n");
> +			dmirror_migrate_alloc_and_copy(&args, dmirror);
> +		} else {
> +			pr_debug("Migrating from device mem to sys mem\n");
> +			dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
> +		}
>  		migrate_vma_pages(&args);
> -		dmirror_migrate_finalize_and_map(&args, dmirror);
> +		if (cmd->alloc_to_devmem)
> +			dmirror_migrate_finalize_and_map(&args, dmirror);
>  		migrate_vma_finalize(&args);
>  	}
>  	mmap_read_unlock(mm);
>  	mmput(mm);
>  
> -	/* Return the migrated data for verification. */
> -	ret = dmirror_bounce_init(&bounce, start, size);
> -	if (ret)
> -		return ret;
> -	mutex_lock(&dmirror->mutex);
> -	ret = dmirror_do_read(dmirror, start, end, &bounce);
> -	mutex_unlock(&dmirror->mutex);
> -	if (ret == 0) {
> -		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> -				 bounce.size))
> -			ret = -EFAULT;
> +	/* Return the migrated data for verification. only for pages in device zone */
> +	if (cmd->alloc_to_devmem) {
> +		ret = dmirror_bounce_init(&bounce, start, size);
> +		if (ret)
> +			return ret;
> +		mutex_lock(&dmirror->mutex);
> +		ret = dmirror_do_read(dmirror, start, end, &bounce);
> +		mutex_unlock(&dmirror->mutex);
> +		if (ret == 0) {
> +			if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
> +					 bounce.size))
> +				ret = -EFAULT;
> +		}
> +		cmd->cpages = bounce.cpages;
> +		dmirror_bounce_fini(&bounce);
>  	}
> -	cmd->cpages = bounce.cpages;
> -	dmirror_bounce_fini(&bounce);
>  	return ret;

Rather than passing a flag (alloc_to_devmem) can you split this into two
functions - one to migrate to device memory and one to migrate to system
memory?

>  out:
> @@ -781,9 +849,15 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
>  	}
>  
>  	page = hmm_pfn_to_page(entry);
> -	if (is_device_private_page(page)) {
> -		/* Is the page migrated to this device or some other? */
> -		if (dmirror->mdevice == dmirror_page_to_device(page))
> +	if (is_device_page(page)) {
> +		/* Is page ZONE_DEVICE public? */
> +		if (!is_device_private_page(page))
> +			*perm = HMM_DMIRROR_PROT_DEV_PUBLIC;
> +		/*
> +		 * Is page ZONE_DEVICE private migrated to
> +		 * this device or some other?
> +		 */
> +		else if (dmirror->mdevice == dmirror_page_to_device(page))
>  			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
>  		else
>  			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
> @@ -1030,38 +1104,6 @@ static void dmirror_devmem_free(struct page *page)
>  	spin_unlock(&mdevice->lock);
>  }
>  
> -static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
> -						      struct dmirror *dmirror)
> -{
> -	const unsigned long *src = args->src;
> -	unsigned long *dst = args->dst;
> -	unsigned long start = args->start;
> -	unsigned long end = args->end;
> -	unsigned long addr;
> -
> -	for (addr = start; addr < end; addr += PAGE_SIZE,
> -				       src++, dst++) {
> -		struct page *dpage, *spage;
> -
> -		spage = migrate_pfn_to_page(*src);
> -		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
> -			continue;
> -		spage = spage->zone_device_data;
> -
> -		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
> -		if (!dpage)
> -			continue;
> -
> -		lock_page(dpage);
> -		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
> -		copy_highpage(dpage, spage);
> -		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> -		if (*src & MIGRATE_PFN_WRITE)
> -			*dst |= MIGRATE_PFN_WRITE;
> -	}
> -	return 0;
> -}
> -
>  static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  {
>  	struct migrate_vma args;
> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
> index 00259d994410..b6cb8a7d2470 100644
> --- a/lib/test_hmm_uapi.h
> +++ b/lib/test_hmm_uapi.h
> @@ -17,8 +17,12 @@
>   * @addr: (in) user address the device will read/write
>   * @ptr: (in) user address where device data is copied to/from
>   * @npages: (in) number of pages to read/write
> + * @alloc_to_devmem: (in) desired allocation destination during migration.
> + * True if allocation is to device memory.
> + * False if allocation is to system memory.
>   * @cpages: (out) number of pages copied
>   * @faults: (out) number of device page faults seen
> + * @zone_device_type: (out) zone device memory type
>   */
>  struct hmm_dmirror_cmd {
>  	__u64		addr;
> @@ -26,7 +30,8 @@ struct hmm_dmirror_cmd {
>  	__u64		npages;
>  	__u64		cpages;
>  	__u64		faults;
> -	__u64		zone_device_type;
> +	__u32		zone_device_type;
> +	__u32		alloc_to_devmem;

Similar comment here. Rather than add a boolean flag to every command could you
rename the existing command to HMM_DMIRROR_MIGRATE_TO_DEV and add another
(HMM_DMIRROR_MIGRATE_TO_SYS) for this new operation? I think that would end up
being a bit cleaner and matches how this actually gets used in hmm-test.c where
you end up defining hmm_migrate_sys_to_dev() and hmm_migrate_to_dev_sys()
anyway.

 - Alistair

>  };
>  
>  /* Expose the address space of the calling process through hmm device file */
> @@ -49,6 +54,8 @@ struct hmm_dmirror_cmd {
>   *					device the ioctl() is made
>   * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
>   *					other device
> + * HMM_DMIRROR_PROT_DEV_PUBLIC: Migrate device public page on the device
> + *				 the ioctl() is made
>   */
>  enum {
>  	HMM_DMIRROR_PROT_ERROR			= 0xFF,
> @@ -60,6 +67,7 @@ enum {
>  	HMM_DMIRROR_PROT_ZERO			= 0x10,
>  	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
>  	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
> +	HMM_DMIRROR_PROT_DEV_PUBLIC		= 0x40,
>  };
>  
>  enum {
> 




