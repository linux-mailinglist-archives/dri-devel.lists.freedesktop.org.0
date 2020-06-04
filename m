Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E91EDAEE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 03:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D48C6E13D;
	Thu,  4 Jun 2020 01:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C362B6E120;
 Thu,  4 Jun 2020 01:55:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O74WfE3qxGKUc5vQ+8He+l3oAT67ShNINk/rzHFtG3tLdt6LEv32l7RqFfLt2rcR5SmkhxOrfEqB+zehM1F+NGvPBw81f0W3RbsJrnCLL/EjTf0qM4yc7ww737s6V3CLHzoFKDKVgjYkWY2YeKAWHgx+XBax7UWcgi72IO+7f6I3aJaeHk1j4wSzjVkd6eFo7KK2tXB1CVRfwkfgBfRESZ6cVV+4toP3k5ocUOFHEju1RozsNyoYtOOfjoIlH0y2t9/6zhYljxmyE3nwv5aXQdyLQ6aw6+rwqP1CPJDyTvv53U4XE7fPmcHcEOIFBeUQlbTOVgvZrCnk6FQp6jhXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXGGvgKncSNbULjTGhOT93qtpom+TgaNRNopjOuaObg=;
 b=XNenLsCKPjmgFgHFLckVH5ylbpFGIfEE9mcR/9Do5xWZkVBI320dh8u25FmzTCWpjT1Ydu4AnYMJD0PicwnteNuz1x5PgLc+iIKk6yRSgH5/9+68UWlQy2OXiuPsWgDgJMwAHZ8nY39wQvc7fqJ9l8CmVs7jnCXAvuYaIDOlFb/lvx2vUrCTVM5sAye+YijqZsk4vG4qI/UIND1I4PvIUORN0vT33sOq8RQ4i6iVLQICno8oEBGsluMmeTQMfNpwkmr4B/8FDiw7RQsZ/ScfhewF0FMu34xuYu6zyZ7Kuwhsuo8XUPpEXPAV0iFiX6gRulRcTYmlN5BAcWzipS3+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXGGvgKncSNbULjTGhOT93qtpom+TgaNRNopjOuaObg=;
 b=LJvTQClplnjiJhozVyI87xrZ/304rxEe2u2e1pBd+8yutCtqGf1VzzeRwO8Db//FtOeBc4kKDPSK3SIwX2J8sWjCqfP5SO/spoi8Y7JHrSEbt7I4VzaaEHmeadus+fwMgDFQT9nxCeeQU3Cwp6+F6AIHmomgAEqm5oLXUiJxygk=
Authentication-Results: thegoodpenguin.co.uk; dkim=none (message not signed)
 header.d=none;thegoodpenguin.co.uk; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB3355.namprd12.prod.outlook.com (2603:10b6:5:115::26)
 by DM6PR12MB2955.namprd12.prod.outlook.com (2603:10b6:5:181::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 01:55:53 +0000
Received: from DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::cd6e:7536:4dbb:aa85]) by DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::cd6e:7536:4dbb:aa85%5]) with mapi id 15.20.3045.024; Thu, 4 Jun 2020
 01:55:53 +0000
Subject: Re: [PATCH v2 02/15] PCI: Add shorthand define for message signalled
 interrupt types
To: Piotr Stankiewicz <piotr.stankiewicz@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20200603114212.12525-1-piotr.stankiewicz@intel.com>
 <20200603114553.12866-1-piotr.stankiewicz@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <1175dbc6-de25-eb4f-b361-4048e1d64a14@amd.com>
Date: Wed, 3 Jun 2020 21:55:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
In-Reply-To: <20200603114553.12866-1-piotr.stankiewicz@intel.com>
Content-Language: en-CA
X-ClientProxiedBy: BN6PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:405:6f::11) To DM6PR12MB3355.namprd12.prod.outlook.com
 (2603:10b6:5:115::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.84.11) by
 BN6PR03CA0073.namprd03.prod.outlook.com (2603:10b6:405:6f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Thu, 4 Jun 2020 01:55:47 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a799c427-5b13-4f20-fc09-08d8082a699d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB295554C058AC08A66FB5440999890@DM6PR12MB2955.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5coERCvQbFdfukh5huRzqxWw37YiUlggKl1ku2Mw+GmmPq3iEB4015CPMSu/uUPNuVzIFT6lr0DUBKe5+nw47hJMGKi5yIiT2nz7jHQkJAKOM3K+kOM+DoKqz12LwpZrYrdZWRiC68vl+N0RFwqCky1xYqIZ5PJ65KPXyDBUP+FUwNinF4S2L0AcgA5lnzYHpnKUQM0f0G9BlU1tsTU4Ysw4dd2WRRBAm5mU6FMvUMsbV6MYPUgJohJdR7N61FYfM89GN9CZPqPbK3fIFMJ8sXy9MdYMo+NcctJ9i5Zx0VqNH1kuELcHTukGCwnveQpZSnn4wO/RcGuWL5QbHEIkpAQ92Fm5Gg4tnkeZRAMzzz8AekKg5Hc0FJgflxwz+jlf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(7416002)(16526019)(186003)(53546011)(31696002)(36756003)(52116002)(86362001)(6506007)(26005)(66556008)(66476007)(2616005)(956004)(8936002)(66946007)(6486002)(44832011)(478600001)(31686004)(15650500001)(6512007)(4326008)(316002)(7366002)(8676002)(83380400001)(2906002)(54906003)(7406005)(5660300002)(110136005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: N8uDfZ5RbPUQZWaIKkcnn/d/2EUibuRmceHBbiIwI1S7Ess4CdJHTXqaycBDdNiebGRlDS2o22dfjR578Gf/ig3F3cxDtm34PsmsPVsvXzPLw3n/pv3CQdsAr+mPJumwg1nhiP3QI1pDUF31aLb2WZN2ir3rLJjCT+wle7EAnpR1jGrjaryEYWKcugH/n1YVQ2Yuu1XR20LRNKerKhngaPNEbn6qrZCLfQ9JNGXhfExCcB1ZeBOUvLVKdHFbaf2AZITU0BORgAJRXsWQql0ZAycVDYH3UMPRs7+WIqRG0pUrRzzdSMvLr5pdqnLj1t57YMgp4ncIZVzxOPyFqI+EarWo9vp6G3gtNpmHW1XjKYXRk9zUtVgPuwdp95iYEi1pELeorW78vRBzd3AptC3ceS/tP2N+aGfMygPe76LPtT9lIRiIxPslVfsTMsTAgTqyFk1Yh/6UjdUR4jAiVOOMv4pMkcta6RkJc700Y8FT2p0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a799c427-5b13-4f20-fc09-08d8082a699d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 01:55:53.1002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfJVwcmEFCVIdTfqQOBMH9K+dFtLm6usM9DUXNMSKddB6qif5mIe2j8UEKqfvcGR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2955
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
Cc: Krzysztof Wilczynski <kw@linux.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Igor Russkikh <irusskikh@marvell.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Jim Gill <jgill@vmware.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 VMware PV-Drivers <pv-drivers@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 linux-media@vger.kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Antoine Tenart <antoine.tenart@bootlin.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Denis Efremov <efremov@linux.com>, Alex Deucher <alexander.deucher@amd.com>,
 Brian King <brking@us.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Salil Mehta <salil.mehta@huawei.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, dmaengine@vger.kernel.org,
 Kelsey Skunberg <skunberg.kelsey@gmail.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>,
 Logan Gunthorpe <logang@deltatee.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That's a sensible change.

In your title you can use "macro" or "definition" or "macro definition".
"Define" is a verb.
"PCI: Add a macro for message-signalled interrupt types"

On 2020-06-03 7:45 a.m., Piotr Stankiewicz wrote:
> There are several places in the kernel which check/ask for MSI or MSI-X
> interrupts. It would make sense to have a shorthand constant, similar to

"a shorthand constant" --> "a macro which defines all MSI-type of interrupt."

Regards,
Luben

> PCI_IRQ_ALL_TYPES, to use in these situations. So add PCI_IRQ_MSI_TYPES,
> for this purpose.
> 
> Signed-off-by: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---
>  Documentation/PCI/msi-howto.rst | 5 +++--
>  include/linux/pci.h             | 4 ++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/PCI/msi-howto.rst b/Documentation/PCI/msi-howto.rst
> index aa2046af69f7..2800ff5aa395 100644
> --- a/Documentation/PCI/msi-howto.rst
> +++ b/Documentation/PCI/msi-howto.rst
> @@ -105,7 +105,8 @@ if it can't meet the minimum number of vectors.
>  The flags argument is used to specify which type of interrupt can be used
>  by the device and the driver (PCI_IRQ_LEGACY, PCI_IRQ_MSI, PCI_IRQ_MSIX).
>  A convenient short-hand (PCI_IRQ_ALL_TYPES) is also available to ask for
> -any possible kind of interrupt.  If the PCI_IRQ_AFFINITY flag is set,
> +any possible kind of interrupt, and (PCI_IRQ_MSI_TYPES) to ask for message
> +signalled interrupts (MSI or MSI-X).  If the PCI_IRQ_AFFINITY flag is set,
>  pci_alloc_irq_vectors() will spread the interrupts around the available CPUs.
>  
>  To get the Linux IRQ numbers passed to request_irq() and free_irq() and the
> @@ -160,7 +161,7 @@ the single MSI mode for a device.  It could be done by passing two 1s as
>  Some devices might not support using legacy line interrupts, in which case
>  the driver can specify that only MSI or MSI-X is acceptable::
>  
> -	nvec = pci_alloc_irq_vectors(pdev, 1, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);
> +	nvec = pci_alloc_irq_vectors(pdev, 1, nvec, PCI_IRQ_MSI_TYPES);
>  	if (nvec < 0)
>  		goto out_err;
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 83ce1cdf5676..b6c9bf70363e 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1422,8 +1422,8 @@ int pci_set_vga_state(struct pci_dev *pdev, bool decode,
>   */
>  #define PCI_IRQ_VIRTUAL		(1 << 4)
>  
> -#define PCI_IRQ_ALL_TYPES \
> -	(PCI_IRQ_LEGACY | PCI_IRQ_MSI | PCI_IRQ_MSIX)
> +#define PCI_IRQ_MSI_TYPES	(PCI_IRQ_MSI | PCI_IRQ_MSIX)
> +#define PCI_IRQ_ALL_TYPES	(PCI_IRQ_LEGACY | PCI_IRQ_MSI_TYPES)
>  
>  /* kmem_cache style wrapper around pci_alloc_consistent() */
>  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
