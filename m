Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95A7458814
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 03:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1936889B67;
	Mon, 22 Nov 2021 02:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B3089BAC;
 Mon, 22 Nov 2021 02:40:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwNlKaszaTEPoNWBiTySpFuENKK1mtTs150lyrtAxb3GAj0qf5g7s9oDZtwiT8oS5my2Jy8ynn/bnHQMWoYU8gk8GGOcvV3/75li0N2vyciGyDb4m9IRKvbfvnni4IEBzZTgDbOYQk5aztJFWQtOszdHCbJLUHMj2Nmj9VLWoLcvg76FepuwdHqBaJbXYtsLbgQEU2rARSdRBfDsAOpIg2VkSqJXA5RLgJWpcWmmxi0IXJntPwRYPduUjHIAKOrU9vW+IERH1gmu3IIbsJ+yTw3luJmH78qSD8ZcjNyo3Qr3bv5YzOiR3K+eZlrfQa+5ld/hXRxwXZa2V7W736BKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKNa+nF+2JDLJehCd98fAVoaWpAzArM2OAp7ay1k7ec=;
 b=Ra9s4x3r6Nv8ZQwfGL4jUQJ6vC3TNyavwsJxpvzhCkmwlV+nituNa49O+NuVIhfO4pngWnM2GkyLUmX4INIMqrJvIiMQGr8X29AL2gfTdjJ50ROieeiCPrLLHVx0m7bnXlw8on/i1YdZV4CFzFlwaXX/2fKkwu5rx/TADEMTFXfuZFFE/F7+0W5tH+KHULYkCxbbtWIuI2t4z2V1s2kyV4qN8sMRz9t3mhKC02UGQiro16/kUEJ7wVpgVJK7OxR8jhCPR11PTMtqJZY2XqHwi14tw4HPAFbeCI8bjISb7PX8L7sARA4zaYLd1gcbopcgmptcxdjd7NktlImp4B/MDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKNa+nF+2JDLJehCd98fAVoaWpAzArM2OAp7ay1k7ec=;
 b=RjRadBRBirn1k5nLbO0MsslmGChxDD3mkYHwkurbsO5mZB9dvE28mrnI+r28eZXgMgeEB0YFgFiXxiIE/GEmzlR1foV0kxQ5jN3U3j+4AJfOyP6doPhMk1YcpHHLlqxEnJ2tkYyE/HOVguDy5tefJM4RlNudMcShH/a0wkibOBMEcttqoBGQ+ZRR37vxFYHHJe2pwfeTK36mBdtsgJiwuCiB1SeEpynZniPwSVSLawum+Hc+nS+bjpjsd6CktLUmz56GYhw8r6mlnUQpD/fRTGOvxLFboOd3GOTFETJETcxhVmfMFUWGNB4scUeWAlO+jEwAU0La+pDjZxr2YHHPPg==
Received: from MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::24)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 02:40:47 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::66) by MW4P220CA0019.outlook.office365.com
 (2603:10b6:303:115::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 02:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Mon, 22 Nov 2021 02:40:46 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 22 Nov
 2021 02:40:43 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>, <rcampbell@nvidia.com>, 
 <linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>, Alex Sierra
 <alex.sierra@amd.com>, Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v1 1/9] mm: add zone device coherent type memory support
Date: Mon, 22 Nov 2021 13:40:40 +1100
Message-ID: <4157439.BacSOyMZPU@nvdebian>
In-Reply-To: <637b19c0-5ec4-b96b-f6f6-c17313f03762@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
 <1997502.P62F5Z1OZk@nvdebian> <637b19c0-5ec4-b96b-f6f6-c17313f03762@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 833acfce-1089-43ca-2fec-08d9ad617ce9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4482:
X-Microsoft-Antispam-PRVS: <DM6PR12MB44827AFD68F04F25D442D165DF9F9@DM6PR12MB4482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GBgblEUomPv5/TGilCRx28tHDLC+CM+KWaQUAjZLQNqEV/Ptwj45AK/FTOXgJL7ezAocCKldeIhD+JT7A2CvyYhzFtf/HC6bvDOqEaYYb00Ksvtge5iXQxpRcQbYew5SacNDIhHts23vXGHHAdguX/vYbkkkVMcGTQVfM78ieRGXMoQr62Ert02LVqTiVK4AdfU1m0UB0Y2/CIVhUyWFUJ7T3xg6G6Ncs1QNxGmJNrYFgo3uGr1Ob4fk8ew/x9AVXvjcoeaeetM9R6VjxAu/nRkqBddmGMG7LbfEjkDAFs7o4eLtmmrxdfh3ijKMQhmSJx6/1i6MOFYiP8m1SSXDzXffiVdUVO0qxpPsTVserGBAkjnjoHwK91f8NtaspCzFFxiRtbtLYvl4yR52evfWPXvI79XwnvbBTkcHUu1Qb5UzvjO0/NTNEX3BFf+USNA6OKAuxmcPn22t9OFeAaTz+NEFYSwhyPls5pKCkALL4sIVjkWH5JyeSyp/NDsZ7edv1/Iie5MvrhIlbVRJfEqXk3NEQR7SiTtLDTMFq8KdGRInF5OZXTyclF5kzXzbIxxBtg/SsJZXcWtsX3rHr/5k6xSEdchOMoyHYdgeUsBoBWBqQ7sT4lGGMuDtF0aT6yJCrWHOiau4i+Xm7mNT/892NwL5p2f4XGtemgynqMUYfDt0M5CmQqgi1VqUkpMkPlNQues1OWh4Ri2n59bO4Qhoaj0nov0S8m6ssZdaPXqhilRJBGEUnRBtF9aCiDNxYBZ4FAdL2JybZ6QhhXENLfD26slMuTTpxUUqOwWCfK1kr5w=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(26005)(2906002)(9686003)(16526019)(83380400001)(8676002)(54906003)(186003)(86362001)(7636003)(82310400003)(8936002)(36860700001)(7416002)(70206006)(110136005)(508600001)(70586007)(4326008)(336012)(36906005)(426003)(33716001)(966005)(47076005)(5660300002)(356005)(9576002)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 02:40:46.5987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 833acfce-1089-43ca-2fec-08d9ad617ce9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482
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

> >> diff --git a/mm/migrate.c b/mm/migrate.c
> >> index 1852d787e6ab..f74422a42192 100644
> >> --- a/mm/migrate.c
> >> +++ b/mm/migrate.c
> >> @@ -362,7 +362,7 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
> >>  	 * Device private pages have an extra refcount as they are
> >>  	 * ZONE_DEVICE pages.
> >>  	 */
> >> -	expected_count += is_device_private_page(page);
> >> +	expected_count += is_device_page(page);
> >>  	if (mapping)
> >>  		expected_count += thp_nr_pages(page) + page_has_private(page);
> >>  
> >> @@ -2503,7 +2503,7 @@ static bool migrate_vma_check_page(struct page *page)
> >>  		 * FIXME proper solution is to rework migration_entry_wait() so
> >>  		 * it does not need to take a reference on page.
> >>  		 */
> > Note that I have posted a patch to fix this - see
> > https://lore.kernel.org/all/20211118020754.954425-1-apopple@nvidia.com/ This
> > looks ok for now assuming coherent pages can never be pinned.
> >
> > However that raises a question - what happens when something calls
> > get_user_pages() on a pfn pointing to a coherent device page? I can't see
> > anything in this series that prevents pinning of coherent device pages, so we
> > can't just assume they aren't pinned.
> 
> I agree. I think we need to depend on your patch to go in first.
> 
> I'm also wondering if we need to do something to prevent get_user_pages
> from pinning device pages. And by "pin", I think migrate_vma_check_page
> is not talking about FOLL_PIN, but any get_user_pages call. As far as I
> can tell, there should be nothing fundamentally wrong with pinning
> device pages for a short time. But I think we'll want to avoid
> FOLL_LONGTERM because that would affect our memory manager's ability to
> evict device memory.

Right, so long as my fix goes in I don't think there is anything wrong with
pinning device public pages. Agree that we should avoid FOLL_LONGTERM pins for
device memory though. I think the way to do that is update is_pinnable_page()
so we treat device pages the same as other unpinnable pages ie. long-term pins
will migrate the page.

> >
> > In the case of device-private pages this is enforced by the fact they never
> > have present pte's, so any attempt to GUP them results in a fault. But if I'm
> > understanding this series correctly that won't be the case for coherent device
> > pages right?
> 
> Right.
> 
> Regards,
>   Felix
> 
> 
> >
> >> -		return is_device_private_page(page);
> >> +		return is_device_page(page);
> >>  	}
> >>  
> >>  	/* For file back page */
> >> @@ -2791,7 +2791,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
> >>   *     handle_pte_fault()
> >>   *       do_anonymous_page()
> >>   * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
> >> - * private page.
> >> + * private or coherent page.
> >>   */
> >>  static void migrate_vma_insert_page(struct migrate_vma *migrate,
> >>  				    unsigned long addr,
> >> @@ -2867,10 +2867,15 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
> >>  				swp_entry = make_readable_device_private_entry(
> >>  							page_to_pfn(page));
> >>  			entry = swp_entry_to_pte(swp_entry);
> >> +		} else if (is_device_page(page)) {
> > How about adding an explicit `is_device_coherent_page()` helper? It would make
> > the test more explicit that this is expected to handle just coherent pages and
> > I bet there will be future changes that need to differentiate between private
> > and coherent pages anyway.
> >
> >> +			entry = pte_mkold(mk_pte(page,
> >> +						 READ_ONCE(vma->vm_page_prot)));
> >> +			if (vma->vm_flags & VM_WRITE)
> >> +				entry = pte_mkwrite(pte_mkdirty(entry));
> >>  		} else {
> >>  			/*
> >> -			 * For now we only support migrating to un-addressable
> >> -			 * device memory.
> >> +			 * We support migrating to private and coherent types
> >> +			 * for device zone memory.
> >>  			 */
> >>  			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
> >>  			goto abort;
> >> @@ -2976,10 +2981,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >>  		mapping = page_mapping(page);
> >>  
> >>  		if (is_zone_device_page(newpage)) {
> >> -			if (is_device_private_page(newpage)) {
> >> +			if (is_device_page(newpage)) {
> >>  				/*
> >> -				 * For now only support private anonymous when
> >> -				 * migrating to un-addressable device memory.
> >> +				 * For now only support private and coherent
> >> +				 * anonymous when migrating to device memory.
> >>  				 */
> >>  				if (mapping) {
> >>  					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> >>
> >
> >
> 




