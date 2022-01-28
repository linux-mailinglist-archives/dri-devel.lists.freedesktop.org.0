Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D807449F0D3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 03:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E1410E2B9;
	Fri, 28 Jan 2022 02:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F5310E2AA;
 Fri, 28 Jan 2022 02:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogUBb11fZD2TOwPjzpEsmA2Bk9LAYsomyZgsOyXkElTsm1zsh9ED5DvE56wjMRGv0JWKLznWMe2OunU6rkYcnaIUhDENP68PGc8t53ocbw09rT3OaYcLRY3e1TwDXPh1L68Lo8+uaTJ3D/6UP0EjpNpVaXqKf/+57hnId2NkahJr/XrN4idVdoJS/P7AxMpCKLEjmgfBQAGu7NpY6u27whqK1zuccr8YjTUGm7lQR5l/Jzmnq/LMFoR6cu5hqCAjG7DwDIKa21q8B6BiYJkmENGbG3dbyFXd5lF45NicFcxHwNd6GgvQskl8a+/WzS5LOQLySTtu6BniuFkLIMbyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SDtd7JPrp7DRw/Nv2qYzHU/GVNu640VLVfpuHBIemA=;
 b=cJvwVlZ3+WHeb9V4y0Qmcnz8oMndDxKQot6N998AFcaSf0K+e9EJduDl6oJMb8WJqPyi1c+bLYyxvXIcFy8O3ow1758tdkjsnDrtk6TF/dLEuKD43KQO0hapcVbuUtePYyhkn0GL7EmAqZyWu06ZTCa/d6nNro12QwPKRA7ZkSJJa81Wm2aLsDjm7Vb580DAFq3c0gxgVjOdsrfTOSKqBl+N7cSD+XyAzoSyuGltM/HNaUCOynsEqijYS+L6ixf8V+8pr5VGfctVk6Yln+Djouk6nwE1Fwq9FL22gMD30JbgXewA1C+q2WiDJKeyFE/H7POVtDtEUHIwqolRD9Xn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SDtd7JPrp7DRw/Nv2qYzHU/GVNu640VLVfpuHBIemA=;
 b=MCKRAdDz/fGusxboNHg9+jRsZl+GhtWBRzI9wqeFWCUO502arG7rzGRhnZ2d/0ZPcx4OEBYrN2Ow7xci5Dj3GucyVKwNc30mDOQEWqz/tsU1yme0I3LBnBYojQ8kIV/gQeS6Q/ruUmVPkFux6Bp2L42vpmcWZLO712lwmMSqPbjDLsVqhc92hE72Yi4R7w0y6ycmGAEFRL80R3Bcz2c+iGBBZvYIYohRBJnTwgORW/MGiZLzmfL12CZyMpCTxYqx0veUW8wTbdHcA5loe+O+ROfHr8ARFzgs0+5o2o5eQ7jYTBJQqFL1DPn78l5M7XSKDTGods6cLMjMTF12RwqFoQ==
Received: from MW4PR03CA0092.namprd03.prod.outlook.com (2603:10b6:303:b7::7)
 by BN8PR12MB2948.namprd12.prod.outlook.com (2603:10b6:408:6d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 02:07:28 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::e8) by MW4PR03CA0092.outlook.office365.com
 (2603:10b6:303:b7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 02:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 02:07:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Fri, 28 Jan 2022 02:07:26 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 27 Jan 2022
 18:07:23 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v4 02/10] mm: add device coherent vma selection for memory
 migration
Date: Fri, 28 Jan 2022 13:07:20 +1100
Message-ID: <234822701.kmWCVztOKD@nvdebian>
In-Reply-To: <20220127030949.19396-3-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127030949.19396-3-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: drhqmail203.nvidia.com (10.126.190.182) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bbfdab6-1521-4375-6e86-08d9e202eecf
X-MS-TrafficTypeDiagnostic: BN8PR12MB2948:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2948367CD37337773B8B36B6DF229@BN8PR12MB2948.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INFfGZCIcucoQhMNNdKQovQGDJX7icOjHMhi0yeiwYJ3AVtTRrbAyNNFbFaHtYfA+k/YzuecyweeOoYusb8N62dhcVkCkPLd75XwBnlBMJXW+o1TncMdSKnHcc9eej596+UXTV2NZGUZs4fuDK6k7KhoHkIPhas3Usjh0Uqa/Ofg1/cl/E+PcBO/Cl3ku6jJHefjBdjOxZlArUVfxwEYTEtD4lZYGRIqw9eJEUo4A+oXfa1bCcyTihk3OFtcXseYwdZc2zPcMSLCUuoYFZU7hG79/VGNdEOUSpG0UmaaJ7F7y55wKNfQxRbUpouMCF4rXcJtGNOcIbRe6vhJSO7vRcGm7UpxCVY3HDhvNNQtObuK7kHJiUB5v16dsVGp4WiyWJIn8HvOnnXRJ7Y6D2YFUtUuyqE5eKk8VCH/+u4GEVT7UyEmVTcJWPiPfxNS+6O4kKOgSCiAKlaf97hN9ypQY9CXiG6FdkDKg34DU4K0Wyx1a+YtZ5oxsi/tqipn2O7cQDHDwpFfKRv5d2rp88PFOAY7Cc5f0ad1wFJMWe3cb7npZau1qAItdI57y+mQBA10cU6TgMhB3tuWzDj9e/PrFaFNN8cJY7Olne2/63UTR2E3N8XhqzZJNM2FpZVhWMv77AhBRxnMGYkLzPtx7HSz0H2u52DsAPH4lesBglGpNe64PZ8R75slsRIHDR3hzTNZwfj5+wU/RvCSW9guLvLbCw==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(110136005)(36860700001)(316002)(54906003)(508600001)(47076005)(2906002)(81166007)(33716001)(356005)(82310400004)(8936002)(8676002)(9686003)(40460700003)(70206006)(70586007)(7416002)(4326008)(426003)(16526019)(336012)(186003)(86362001)(9576002)(5660300002)(26005)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 02:07:27.2925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbfdab6-1521-4375-6e86-08d9e202eecf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2948
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

On Thursday, 27 January 2022 2:09:41 PM AEDT Alex Sierra wrote:

[...]

> diff --git a/mm/migrate.c b/mm/migrate.c
> index 277562cd4cf5..2b3375e165b1 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2340,8 +2340,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			if (is_writable_device_private_entry(entry))
>  				mpfn |= MIGRATE_PFN_WRITE;
>  		} else {
> -			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> -				goto next;

This isn't correct as it allows zero pfn pages to be selected for migration
when they shouldn't be (ie. because MIGRATE_VMA_SELECT_SYSTEM isn't specified).

>  			pfn = pte_pfn(pte);
>  			if (is_zero_pfn(pfn)) {
>  				mpfn = MIGRATE_PFN_MIGRATE;
> @@ -2349,6 +2347,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				goto next;
>  			}
>  			page = vm_normal_page(migrate->vma, addr, pte);
> +			if (page && !is_zone_device_page(page) &&
> +			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> +				goto next;
> +			if (page && is_device_coherent_page(page) &&
> +			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
> +			     page->pgmap->owner != migrate->pgmap_owner))
> +				goto next;
>  			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>  		}
> 




