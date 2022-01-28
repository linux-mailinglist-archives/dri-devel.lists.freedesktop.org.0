Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F0F49F0C0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 02:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F2110E2BE;
	Fri, 28 Jan 2022 01:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2044.outbound.protection.outlook.com [40.107.100.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151EB10E2AA;
 Fri, 28 Jan 2022 01:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyeKdGAZb8ylrjra9mnLH8slv6GtiqIA2wiAVvNXListxpAe6c8/01XRCIPRMLGQz9ajynuqruv9LpTutemrqcM1sJfTKhDm/N09MB6hshwTFEfypo7kgUnLLZY/p/OGs+LvfgEjjfaMGV/Op1hdTxZYjfaLhb7yUrItElq3WAE0viHy0Jo6Dknu1oeNHYySXfiM/zcapiRKR3hGJA01UTyrL61M95BeUl43Yil94YSEHgmzkdvcQDMsX1rJI8Jq/McgCE6PI8nGTIJKOT0hcUADhXCvNakQ4XKBx6ndJWjPUFFCAj55Wj5/kISROF8oZtbHbYXGF5Cxhw69tm5yRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WERRZbkO7KrPZ9mMosOwiu9kkt21oFSuOwsDjXTZfSk=;
 b=fSXjiIgPjif4DoeI12Trh6q/4SD8yip6ZQOgPr/SxTsyTAG1dY4KWd/QaUx8VeZoo+t0Gi6S1r7T2RskJfcZlM/9AkTnTwIZHuwnCIp4Z6olZGuyMOH54ULI4Kq+S7BbVoDVAoimN6TaLMv1HW5XvrmJUYw6t0hWG37INaMCMg5dHuqKOXtWSdWTgdB/5xXuAW3nCuvsp8zaovJR/ZVDGGkPwZF30Eqy4kUhjT18LrpVo9iCZih7LyX/ftfgEwYsZDmTWW7uc9n8Wqll+iulyg0nTG7q/QSK4rWTYNAOIWROSLTMkSgeipz3uCsBp25diTDph/mgXllzDQxHKFYPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WERRZbkO7KrPZ9mMosOwiu9kkt21oFSuOwsDjXTZfSk=;
 b=Fp/VNdmsb1gS/Hi3pseeP081cmym1fxfhTe9CJL+ClokYfdqtneELaELATOX+BQ9WPMXIKBW65/KCFjjennoMh9AWSq2Yjmq4tNbLQy0tgwQqIhjgyMtB59CBNbVAUjpCVPrHA3bOcy7atlLBNWDqGsWn5UuR4EgUFD1Y2DZdLhTvDCJ/EsLGkt+nKWyD10tCIvyalgpIUSVvRQ2r1A0yEGb680UC1Sm2fFa5n8est32Sn9RLFUCS6eA3rcgvZ42jfze7iz3PT8qGOa2fad97nQSB0N6tzDBeUQCY225BW6Sc0saE00KBg44HaW9sTWPeGqxSxlyLL2Sr2PHyeWECQ==
Received: from MW4PR04CA0038.namprd04.prod.outlook.com (2603:10b6:303:6a::13)
 by MN2PR12MB3198.namprd12.prod.outlook.com (2603:10b6:208:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 01:57:47 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::60) by MW4PR04CA0038.outlook.office365.com
 (2603:10b6:303:6a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 01:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 01:57:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Fri, 28 Jan 2022 01:57:45 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 27 Jan 2022
 17:57:42 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v4 01/10] mm: add zone device coherent type memory support
Date: Fri, 28 Jan 2022 12:57:40 +1100
Message-ID: <3321052.0DCqWhyCST@nvdebian>
In-Reply-To: <20220127030949.19396-2-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127030949.19396-2-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: drhqmail201.nvidia.com (10.126.190.180) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e79e3e1a-b0c3-4024-f6f7-08d9e2019486
X-MS-TrafficTypeDiagnostic: MN2PR12MB3198:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3198692D2C433CF0A7DB2C95DF229@MN2PR12MB3198.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8jXtzz+5p/ohzUIHN3L5W5dzd70hx6TIIeNd6vyAYtGMpXJtsf3jvHS+OFYuYuAjnzrxc4+CdgMhKWcvsPNOWBYXaD3yMF+U27pN4/AGAYmoAypgp19k6BZC5yAuPK2Hx4y43X5r2AH51eBRkfRUqcDxmhUpoC+s7mY6iE69iShNZ82WQmY7TZmhbSYmJ5x+8hlO7MZJ71tRIavtVd3H4KUt2IqXfFvmHR4lAH/K+vjGO7/+awXABZSEu0Pwfk8vzdhw8Fh8W2S9jD2Lj8K9T55eG2dH7AOd0bg9IlF7UbB7Yn06zXsmnZeeOzk3rxIp/yKgdLWqMSd7rRLBjAE5C3qS2nxj5plS38TYDsA5cB3O3bcVZmSnL2bIhzGteNM5LtWHC1AqQBT3HsLrswJ2Y6Ho8nogFc1/Z9SjOymOuhMcYV5FDqhNFdquJfYr9lDDoCzbbNEvUPrXgSP5FS4vsj+DQzHsc/TU8WaIsHgrDUx2xoQ/eaMtxM000DNenIF+NJCTj0K0KXbPzCVhEZ6OFBJoRp5AFFAL9KlKx/28shXQSNkZ8MTbgCz3VzIHDRnrXBtETiWFB5kbq1JEHkYrPQTU4NIxC7NTcQsSc9XRqjw5EwGUOpvIFn6AeJ23rDH6gQ1X+dmxNYubvT2dbFSx/KujUfsy/8zmel+OY9d4BPqsYZtZgFwc7woTWPLtYRDseklYkto9OZAIWUKWEw+IKoDdpcyrYbG+1MxiTzKHrW38w8AE7Y4zxM0zWtrF8C1
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(54906003)(82310400004)(110136005)(26005)(47076005)(336012)(426003)(16526019)(83380400001)(186003)(508600001)(86362001)(36860700001)(8936002)(8676002)(4326008)(70206006)(70586007)(9686003)(2906002)(9576002)(40460700003)(33716001)(316002)(356005)(5660300002)(7416002)(81166007)(39026012)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 01:57:46.3103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e79e3e1a-b0c3-4024-f6f7-08d9e2019486
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3198
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 27 January 2022 2:09:40 PM AEDT Alex Sierra wrote:

[...]

> diff --git a/mm/migrate.c b/mm/migrate.c
> index 1852d787e6ab..277562cd4cf5 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -362,7 +362,7 @@ static int expected_page_refs(struct address_space
> *mapping, struct page *page)> 
>          * Device private pages have an extra refcount as they are
>          * ZONE_DEVICE pages.
>          */
> 
> -       expected_count += is_device_private_page(page);
> +       expected_count += is_dev_private_or_coherent_page(page);
> 
>         if (mapping)
>         
>                 expected_count += thp_nr_pages(page) +
>                 page_has_private(page);
> 
> @@ -2503,7 +2503,7 @@ static bool migrate_vma_check_page(struct page *page)
> 
>                  * FIXME proper solution is to rework migration_entry_wait()
>                  so
>                  * it does not need to take a reference on page.
>                  */
> 
> -               return is_device_private_page(page);
> +               return is_dev_private_or_coherent_page(page);

As Andrew points out this no longer applies due to changes here. I think you
can just drop this hunk though.

[...]

> diff --git a/mm/rmap.c b/mm/rmap.c
> index 6aebd1747251..32dae6839403 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1823,10 +1823,17 @@ static bool try_to_migrate_one(struct page *page, struct vm_area_struct *vma,
>  			 * pteval maps a zone device page and is therefore
>  			 * a swap pte.
>  			 */
> -			if (pte_swp_soft_dirty(pteval))
> -				swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -			if (pte_swp_uffd_wp(pteval))
> -				swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			if (is_device_coherent_page(page)) {
> +				if (pte_soft_dirty(pteval))
> +					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_uffd_wp(pteval))
> +					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			} else {
> +				if (pte_swp_soft_dirty(pteval))
> +					swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_swp_uffd_wp(pteval))
> +					swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +			}

As I understand things ptes for device coherent pages don't need special
treatment, therefore rather than special casing here it should just fall
through to the same path as normal pages. For that I think all you need is
something like:

-                if (is_zone_device_page(page)) {
+                if (is_device_private_page(page)) {

Noting that device private pages are the only zone device pages that could
have been encountered here anyway.

>  			set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
>  			/*
>  			 * No need to invalidate here it will synchronize on
> @@ -1837,7 +1844,7 @@ static bool try_to_migrate_one(struct page *page, struct vm_area_struct *vma,
>  			 * Since only PAGE_SIZE pages can currently be
>  			 * migrated, just set it to page. This will need to be
>  			 * changed when hugepage migrations to device private
> -			 * memory are supported.
> +			 * or coherent memory are supported.
>  			 */
>  			subpage = page;
>  		} else if (PageHWPoison(page)) {
> @@ -1943,7 +1950,8 @@ void try_to_migrate(struct page *page, enum ttu_flags flags)
>  					TTU_SYNC)))
>  		return;
>  
> -	if (is_zone_device_page(page) && !is_device_private_page(page))
> +	if (is_zone_device_page(page) &&
> +	    !is_dev_private_or_coherent_page(page))
>  		return;
>  
>  	/*
> 




