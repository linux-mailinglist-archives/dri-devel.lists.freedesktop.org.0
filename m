Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D644554F1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 07:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203976EEB6;
	Thu, 18 Nov 2021 06:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCAC6EEB6;
 Thu, 18 Nov 2021 06:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwbV+mgCKDsaG1RgTF03Z0Gg44M62z/iGTcXRUi+5BoQsRe56Xij9xqG2V3ff7WdUXvbKJLDfmukdRoa6j7h2CCTxTc5AqqmgWf1kKh6SXFrfDv055iIUmkKMuh4j3AByOxSUrCIWprJqciKyxCl/xObFwwxuha0kZ/k4dt4fwFUVVlhQ9IJPbAjcvO/4uns7fQUJ/j2e1ROZ0ZdARHN9gTAuXwzjxscoXPxlajgZinHGXbL5HGlNN6bTD92iC+xOpqEpdkV1Cl6ncem1Na+4ZPJe/uj+UJt/NfM6Pz5XUzK3B9xCqcecPsKAewyX18md4Mki1tWX1F4iYy18sFPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mt4fbdwXZotHnLm51WQhjK3yLRET2vXzMMsX8jcbA3A=;
 b=dPp4/xMJXTlgfRm/u38S7hyYGGJxMWllVaH0eYufF0hMsXnbVLlPNHqspVfy8ncJIEXDhL80HGb3re3aUkrJuef9AeHpBolSoLxY4MPZqR/YyDxABjs+2oDMppqc7r5wE9nImbEhvOrQLKQ2XBy45maIkq4z5C4PB9OhYkXjnXhGjpbNyAVgIfmw9EAI/irKbE6tSy4kpx+trr4z7zu6VXZeUhlPbxrXORBazL/1c/qnLKWilHKZ6rsPSzMUpRvT1wRULfYVgP0xtHh9hKN9RSAK2oUD6SQGra66vePNP8G9DAAVawAfYD0dEvkJvdkv/a8KHEMuAU6GLIg1B5PwxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt4fbdwXZotHnLm51WQhjK3yLRET2vXzMMsX8jcbA3A=;
 b=cFH9Km+oaMPfNnOpNmxKxDakgafcWdhUnFkRMd34PAA0AH/roCjq5B0H71XpOjrsm67m/Lry/ZEFMt/4Ql8uBKeuf64n1Xomf+EqSXb5VMOmq4cBMsc2qtZzWTPB1/hSdQXRw9uO5yGhi8RyVzt4MPOmlziYX9wkHA5r+rYShoOABJrSekIZDAlstIIOw2+LnMmZTWoOX1OoDH6seYf28/OYpFqpGZxKhIWqTyv9WPRZncqaTtlyX3cKH7TSWKd/ar9VKTLYxOoZbVh6IEJEdyxnzx4PLVDUFsV4RmiygMhV8+VK51dQAqcnU2vzt2p+d7ms47BcsKBbcfCvsWL8OQ==
Received: from BN9PR03CA0075.namprd03.prod.outlook.com (2603:10b6:408:fc::20)
 by MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 06:55:03 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::cb) by BN9PR03CA0075.outlook.office365.com
 (2603:10b6:408:fc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Thu, 18 Nov 2021 06:55:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 06:55:02 +0000
Received: from nvdebian.localnet (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 06:54:55 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v1 2/9] mm: add device coherent vma selection for memory
 migration
Date: Thu, 18 Nov 2021 17:54:08 +1100
Message-ID: <4255842.lH8mPQHcBG@nvdebian>
In-Reply-To: <20211115193026.27568-3-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
 <20211115193026.27568-3-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d0a6e52-ba47-4e5b-f26d-08d9aa605860
X-MS-TrafficTypeDiagnostic: MN2PR12MB4486:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4486FF829DEE47FC0368D563DF9B9@MN2PR12MB4486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NC97Vultgt/5SKzBGSpIkT/2gkKIiVgS4spu8DS8NgrfCZ4VHCwKilg3sU0I65lmyOyCIFV23sb67yGpWn1wY6VOQhIjPueNVcrf2ezSVM5WaV2RZZNUlMaul84NqeO49TJBu0CT28+xyHz0wiuPsCBGxnfHVhAjpjwIG1xXTHdyn1dyZCJeHgt1yHW4KkXfhSIqiQLJOg745yQEaH3ulHl6lFd+MGUYG2ZvO9z9nd/VGKM4BLIGlDCNJYDG8DSsKLg1P/Dye8NT0Guun1pco2IyBuyWZL/Ku6t3uaXBp1PSpEW06B/3COue6M3fvAOuynpswm4fPsGSqTZVdJ4DmRWxdi0/C1ni9Fql6strfGiDAvDRz5uy4SwFLtGUEi/EoZ1cfQDFrhYANd3pCRUAdPw4+or4iD8S4AOfNgn6UshYOyAyOduoOIPMPBuqtUzdUKKOgNQHry8sWEDiUr96/ZRTj48FNVuejwPVpBw3f5AmDAt+l7CIlf0/lqigDpxejn07uD/2zLdwKMawL/TE5yIHN9duF7Rf2hcdf53diAwCoM3HN62SaLntE+FZcZQdvjTWGtH4dukNZAcEZ2rjEP45ICb350svgjPg/ccOFAx6Y3oGo4GA2Fod2IluKm2ynjgUfiYxsd6gC5MD1C4eb/kqPuJhJoLqSvHnXPvjU2+23UQMVgrBAQacCqvWLNsmVIzNA2Ggc+MqRLa/4lK9wKUrhX4dO42pSI+5Yf5LYIo=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(83380400001)(356005)(7636003)(5660300002)(6666004)(70586007)(426003)(7416002)(70206006)(9686003)(47076005)(336012)(33716001)(26005)(4326008)(8676002)(9576002)(508600001)(82310400003)(36860700001)(36906005)(2906002)(110136005)(86362001)(316002)(8936002)(186003)(16526019)(54906003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 06:55:02.4347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0a6e52-ba47-4e5b-f26d-08d9aa605860
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4486
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

On Tuesday, 16 November 2021 6:30:19 AM AEDT Alex Sierra wrote:
> This case is used to migrate pages from device memory, back to system
> memory. Device coherent type memory is cache coherent from device and CPU
> point of view.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
> v2:
> condition added when migrations from device coherent pages.
> ---
>  include/linux/migrate.h | 1 +
>  mm/migrate.c            | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index c8077e936691..e74bb0978f6f 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -138,6 +138,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>  enum migrate_vma_direction {
>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
> +	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>  };
>  
>  struct migrate_vma {
> diff --git a/mm/migrate.c b/mm/migrate.c
> index f74422a42192..166bfec7d85e 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2340,8 +2340,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			if (is_writable_device_private_entry(entry))
>  				mpfn |= MIGRATE_PFN_WRITE;
>  		} else {
> -			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> -				goto next;
>  			pfn = pte_pfn(pte);
>  			if (is_zero_pfn(pfn)) {
>  				mpfn = MIGRATE_PFN_MIGRATE;
> @@ -2349,6 +2347,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				goto next;
>  			}
>  			page = vm_normal_page(migrate->vma, addr, pte);
> +			if (!is_zone_device_page(page) &&
> +			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> +				goto next;
> +			if (is_zone_device_page(page) &&
> +			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
> +			     page->pgmap->owner != migrate->pgmap_owner))
> +				goto next;

Thanks Alex, couple of comments on this:

1. vm_normal_page() can return NULL so you need to add a check for
   page == NULL otherwise the call to is_zone_device_page(NULL) will crash.
2. The check for a coherent device page is too indirect. Being explicit and
   using is_zone_device_coherent_page() instead would make it more direct and
   obvious, particularly for developers who may not immediately realise that
   device-private pages should never have pte_present() entries.

>  			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>  		}
> 




