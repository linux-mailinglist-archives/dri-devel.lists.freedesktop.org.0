Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1057D0CA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 18:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C867E10EE67;
	Thu, 21 Jul 2022 16:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AC610ECF5;
 Thu, 21 Jul 2022 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658419861; x=1689955861;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HFGQo6bXWJCXw0EpOTHYnpRm5F1M1SL/xABPhG6kXTM=;
 b=iY550n1hqgZdmVdNYokTVIVYP+yW4VBxap2fn5vD7VwBdNptEmj5stXX
 /WJ3KP5ufHn4y/4mebriulzALbAowxfUgjYMlvZCSuUL6SSNP0m14w9g6
 Y0IB5mWqN8V31AKisrbmDr03LymBYbEsnVp8XLDMyMdlP1mf0GvYo3oxb
 +Zp2PmeTTx06VDxYLcrrbyUl9dn0smK/AIp0ur/NeoXDcvzM2nGml50Tf
 sFvepbPkJ8xICIuTjSXtWeaZfKco8VxcAdrgBMjVnbddkg4s5cJIYwN5P
 xEceE2Iq1NpEpZiUdYXq9BYWndHJ9g9jxxU/hs5/aAtOQdZnivm6qSTCI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="284647172"
X-IronPort-AV: E=Sophos;i="5.93,183,1654585200"; d="scan'208";a="284647172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 09:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,183,1654585200"; d="scan'208";a="626179467"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 21 Jul 2022 09:11:00 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 21 Jul 2022 09:11:00 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 21 Jul 2022 09:10:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 21 Jul 2022 09:10:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Jul 2022 09:10:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIqRisxHE2/+6qJEx4355afkwgu6URATyqDgQi/dLjBWY81whxJNzphFTkqooQvXFTy7YVkCSHGK5mGoEq1jFgrZUDBYZSywNoPyWaaEqDcHjdwiNtxTKW1RvyFUZGvMxfgfRGvRyHEnZdJ7cvMkw0+Ey2fwgfmuxBuneli92WeEmCybSnQ/T3K8nHOdZq/nCmFzW+d4w4a9d8G4X2GTbtSpvVFcCHfoD4zZ8C8kdi0WK0YTRfMVC4ezlimnWrbzui1cUv1SAN5D9szVC0IEanlMN8RJh9TzAsQOh3wZlsBahoV1h2nNjj6QStcjn9oMCJzLgMZchba4FfQqCiSSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1QE/VC0qpZsPug/0MfXEM+D7DodZ1qGf8bzJIVa/78=;
 b=oEepKVmavo6TmzF07+oYWxos/QnDI/5PX7Hg0kD4fyayeG+FHlwJBEyb7ImPu8pgTu7RwRw4lOPMyLOWofn/rTSxmOFLwL2+H9X9mOk82haEBTvXIQPhVY06Sg3/USEtwbwyByMjiLKpbusZgN4uv2M33oCHP4v2pdFPHbRgFgVCyXcPryvMnvW9hfPTur8GFdO5JuqpJsiv5eAMEquu+w59xKeff98tfao/1KYW9pAAJMkxYYBb5ot0IJH1zCQ584ZLq+whgpdKsr/nFhQry2Az6uw7wTal7OfykxToOUvNni7n4e3WXs7YKoKLj/agMw0ekd8o2heHrZ/iY8NthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by MWHPR11MB0014.namprd11.prod.outlook.com
 (2603:10b6:301:64::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Thu, 21 Jul
 2022 16:10:52 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::6466:20a6:57b4:1edf]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::6466:20a6:57b4:1edf%11]) with mapi id 15.20.5458.019; Thu, 21 Jul
 2022 16:10:52 +0000
Date: Thu, 21 Jul 2022 09:10:49 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH v2 16/28] resource: Introduce alloc_free_mem_region()
Message-ID: <62d97a89d66a1_17f3e82949e@dwillia2-xfh.jf.intel.com.notmuch>
References: <165784324066.1758207.15025479284039479071.stgit@dwillia2-xfh.jf.intel.com>
 <165784333333.1758207.13703329337805274043.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <165784333333.1758207.13703329337805274043.stgit@dwillia2-xfh.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::28) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c978c002-a318-44b0-8925-08da6b33953c
X-MS-TrafficTypeDiagnostic: MWHPR11MB0014:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sp+2va/NQ2K8XOkmbDU9NA9H3KvGKCaLCfDwQhcZXLHeYY7vnqB/TxzaI2Gy1BMTz9g0VE3twAgKuXAPNqkk3K9ocgK7RbRa/b5pm0jQ1BbU4JGImJqtaDrYdIAur6HGZLWXJgHxOeudf6vqiD1VZi2KzW+OS+6hOnqjO4JBmH+JcBBgIYbTq0UuNHD6fBlge9rCn0Y5/27V5EZZ57XOX6n5fHKW3WAuZ/3H2GVquibU6khnq6l3/EY7b90ztvD3waXvf9IsqBw1cD0NIX/yLBUp9OIGQE4/gDQVKqmm6flRER26WZdH3FwGRHFw2a0FMAK5Pz2BqmDebDS7/qfkhw1I5Z1omQa7ZDsRoOPHLCdQK7iE2JqqxaGGKu+EuZgcX8CIy+3pKKVBG9jrBg+EU48NHM/fYNbgFm5SytGXMxWVspLxWtXfXERDB3/zoKqsOffAbSaDrkNd9dn8PjukeobtNRN2XExCRmxtTKbW9+M3/+f2FL2LNnJZc/eIL1xVe7vrgWcVPj9XZOTgBhXM6cnAKN3UTrNSJigty2L86fGqm3gzmqq2bjbN1eEBuy0PeYccgSUTQuuqhYENR4YOGnLTH+fuWqirW/+pz90CFf3KL5Q4itrQyFbOmVlwNst8rVRZqOJqo5vX3WtOgeowUTJ85GYXM+iK9RbKex9DH/aQ1bnEdZ49z1HmWI1XQgDEP4OdllmpVe9i1cQkoenWl2P2qMC2gd2iVCvO2ESJlCojET4HEC8rNd144kLdxkGK5lTt1LX5w3GRYPUNAGJuKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2126.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(366004)(396003)(136003)(39860400002)(478600001)(41300700001)(5660300002)(2906002)(8936002)(6486002)(110136005)(4326008)(8676002)(30864003)(66946007)(82960400001)(66476007)(66556008)(38100700002)(316002)(966005)(6506007)(83380400001)(186003)(9686003)(6512007)(26005)(86362001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QnBEZyo7Fp9JsKa84HwPLhhEEgPvR6PAtLZtJDIHmIyn3nVjcYJ0j0O625ED?=
 =?us-ascii?Q?ascCXOgVEz/HpTRgiSp3LGk28xtN+xGyZoehCnsPZeOAevZTgiy3CVqQTKfu?=
 =?us-ascii?Q?SOvIY5/HTfKIzOP+AoXH1Z2TKolSN4C34FvFu1tfmHgRHduOmeTDWhsVU0Dc?=
 =?us-ascii?Q?bKfisjS8v9lfki6Op4gtVBUN1TUEkc7ts7oWVOU+KB95hs0bLsmgMoEC48rO?=
 =?us-ascii?Q?gSaviHJipbhsVmkiU3TOx8wiztMh5jTHOSAE1yF/2y/8y8sb9Id4CcAihnSO?=
 =?us-ascii?Q?hFc27yRf0oQBdD2MsG6XTAxf/Gq71ZQGd2Jpq2SwWrzKtMctcf6U41ll+AgX?=
 =?us-ascii?Q?bSJyVRre9W2gZcZPn2xZkclRANqeRxn0cu3JZF1QV8TfFOuz17oX0Nuu1/yf?=
 =?us-ascii?Q?QUDOaD/AaVj/0ztZBekuevX0Ud9a5Ku0+8Sf47Bkf7yfpfjIoT+4pmWjg6jP?=
 =?us-ascii?Q?aIWkVpBTpg1umdeHbsmDmMpxnemWAvS8RJeFf9X0lK9iQTbc5YJF4rr+ImgK?=
 =?us-ascii?Q?vlsDkQbPuJeIYm8eNeNgkG/aHer0LoD+EpdB0+Bi5G8RwKmNRukfYA4VaCr/?=
 =?us-ascii?Q?19WdRtB3efFPRkkYxVAX3IcFRprIL7dhr8wUnvyRhhRzuYWbwrZfbFyEhvnQ?=
 =?us-ascii?Q?Pg9auQpN911A9Be/5pa8i1sd49vGq1tXuXO/ZQPNI38RabZI1+zu6DSV/GBK?=
 =?us-ascii?Q?rO2NQQLhZdYjSgPfr80KSxHe4B2KiE4MsTmqr/wCvT5Oc+LDF0vvhtlrlPr9?=
 =?us-ascii?Q?x83rhz4u6EXG6GvNvvS8uOGlQuD2lj0FaQya0e51Eci/LV5FgygKe6871CT0?=
 =?us-ascii?Q?RwSN5/V1qNa4QznK9gj66l/Q3fy4CxLZReY77o1gbhNs7KBcmL2LK9q/N/9B?=
 =?us-ascii?Q?VnCfxIWNHPhVszuqV4tkOW9aPe/6unyWwMBuexN0/Gp4rBGJa0toVi7Bf7Qi?=
 =?us-ascii?Q?GVhPm5x2h+s2AlxYeNctDopivNV0ARQ9y0TbSErfharMbYETkoxrmxIBqhzS?=
 =?us-ascii?Q?TSYp6yIRAODoflZScA3D7ARlBVqi8BWrJZD4uYAWXctLJOOhGFVv2YJhX5k3?=
 =?us-ascii?Q?rN4r0Pf/hzq/yy6/g/EKuxUlBNDh76iHilpVmeYNPyfVYsVngJRiUtpqtU0U?=
 =?us-ascii?Q?qcWViT2tRoNuOmct5UkYR4BRv2JtkI3aULQ89UDmuNYQP9hFPTx8aqRGSOIU?=
 =?us-ascii?Q?tXUpgFUtTuZlxU+8ohwPb/PwQfEEYINBRHF8qDUULN2oqznsTgHP2LmSQ596?=
 =?us-ascii?Q?BY6ZExSXhSIGw0wcAPURCRR00cEbyA45AEyziNK3iNr7AOCmZD44wsJVBxh/?=
 =?us-ascii?Q?/U48p2ckDYsgQb2P5xdmTUh5BYq0SOP9doBUwIvYWmR68eAdbDmzUKHMnFdt?=
 =?us-ascii?Q?nx0UswufbQXvcw7JJ3IEHHBOlpXvxZ13GXHnLda+0Z1OXmhImBBrn1Woc15o?=
 =?us-ascii?Q?FplyVOneoXpqeog1Qwc/96onbJywO2DoM3SuiLsV2GiBkbBy+6q7yOe0quM7?=
 =?us-ascii?Q?f1T8cETuALka9TLF9UoQRqZcKTQRp2FgU1jN+ly1Ceg3Bod4vMjURSGs4IJD?=
 =?us-ascii?Q?4rSO6E/fyJpk8HG95i4OAy+sHqIDvAuFzfZ52t93NeBkH2B/dhdt3Nko+dHI?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c978c002-a318-44b0-8925-08da6b33953c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 16:10:52.0435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ep5rf5b44yYdElGY0hQdaw2afcci1towvLxYK3TYHx3kgN83u4G3DZitIJqVsBpGmsxP7ot4AoKXxyti/LNqYXC8Nau65xQfQJZqfVv9dz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0014
X-OriginatorOrg: intel.com
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
Cc: nvdimm@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Wilcox <willy@infradead.org>,
 linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ add dri-devel and nouveau ]

Dan Williams wrote:
> The core of devm_request_free_mem_region() is a helper that searches for
> free space in iomem_resource and performs __request_region_locked() on
> the result of that search. The policy choices of the implementation
> conform to what CONFIG_DEVICE_PRIVATE users want which is memory that is
> immediately marked busy, and a preference to search for the first-fit
> free range in descending order from the top of the physical address
> space.
> 
> CXL has a need for a similar allocator, but with the following tweaks:
> 
> 1/ Search for free space in ascending order
> 
> 2/ Search for free space relative to a given CXL window
> 
> 3/ 'insert' rather than 'request' the new resource given downstream
>    drivers from the CXL Region driver (like the pmem or dax drivers) are
>    responsible for request_mem_region() when they activate the memory
>    range.
> 
> Rework __request_free_mem_region() into get_free_mem_region() which
> takes a set of GFR_* (Get Free Region) flags to control the allocation
> policy (ascending vs descending), and "busy" policy (insert_resource()
> vs request_region()).
> 
> As part of the consolidation of the legacy GFR_REQUEST_REGION case with
> the new default of just inserting a new resource into the free space
> some minor cleanups like not checking for NULL before calling
> devres_free() (which does its own check) is included.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Link: https://lore.kernel.org/linux-cxl/20220420143406.GY2120790@nvidia.com/
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Christoph Hellwig <hch@lst.de>

Jason, Christoph, anyone else that depends on CONFIG_DEVICE_PRIVATE,

Just a heads up that with Jonathan's review I am going to proceed with
pushing this change to linux-next. Please holler if
CONFIG_DEVICE_PRIVATE starts misbehaving, or if you have other feedback,
and I will get it fixed up.

> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  include/linux/ioport.h |    2 +
>  kernel/resource.c      |  178 +++++++++++++++++++++++++++++++++++++++---------
>  mm/Kconfig             |    5 +
>  3 files changed, 150 insertions(+), 35 deletions(-)
> 
> diff --git a/include/linux/ioport.h b/include/linux/ioport.h
> index 79d1ad6d6275..616b683563a9 100644
> --- a/include/linux/ioport.h
> +++ b/include/linux/ioport.h
> @@ -330,6 +330,8 @@ struct resource *devm_request_free_mem_region(struct device *dev,
>  		struct resource *base, unsigned long size);
>  struct resource *request_free_mem_region(struct resource *base,
>  		unsigned long size, const char *name);
> +struct resource *alloc_free_mem_region(struct resource *base,
> +		unsigned long size, unsigned long align, const char *name);
>  
>  static inline void irqresource_disabled(struct resource *res, u32 irq)
>  {
> diff --git a/kernel/resource.c b/kernel/resource.c
> index 53a534db350e..4c5e80b92f2f 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -489,8 +489,9 @@ int __weak page_is_ram(unsigned long pfn)
>  }
>  EXPORT_SYMBOL_GPL(page_is_ram);
>  
> -static int __region_intersects(resource_size_t start, size_t size,
> -			unsigned long flags, unsigned long desc)
> +static int __region_intersects(struct resource *parent, resource_size_t start,
> +			       size_t size, unsigned long flags,
> +			       unsigned long desc)
>  {
>  	struct resource res;
>  	int type = 0; int other = 0;
> @@ -499,7 +500,7 @@ static int __region_intersects(resource_size_t start, size_t size,
>  	res.start = start;
>  	res.end = start + size - 1;
>  
> -	for (p = iomem_resource.child; p ; p = p->sibling) {
> +	for (p = parent->child; p ; p = p->sibling) {
>  		bool is_type = (((p->flags & flags) == flags) &&
>  				((desc == IORES_DESC_NONE) ||
>  				 (desc == p->desc)));
> @@ -543,7 +544,7 @@ int region_intersects(resource_size_t start, size_t size, unsigned long flags,
>  	int ret;
>  
>  	read_lock(&resource_lock);
> -	ret = __region_intersects(start, size, flags, desc);
> +	ret = __region_intersects(&iomem_resource, start, size, flags, desc);
>  	read_unlock(&resource_lock);
>  
>  	return ret;
> @@ -1780,62 +1781,139 @@ void resource_list_free(struct list_head *head)
>  }
>  EXPORT_SYMBOL(resource_list_free);
>  
> -#ifdef CONFIG_DEVICE_PRIVATE
> -static struct resource *__request_free_mem_region(struct device *dev,
> -		struct resource *base, unsigned long size, const char *name)
> +#ifdef CONFIG_GET_FREE_REGION
> +#define GFR_DESCENDING		(1UL << 0)
> +#define GFR_REQUEST_REGION	(1UL << 1)
> +#define GFR_DEFAULT_ALIGN (1UL << PA_SECTION_SHIFT)
> +
> +static resource_size_t gfr_start(struct resource *base, resource_size_t size,
> +				 resource_size_t align, unsigned long flags)
> +{
> +	if (flags & GFR_DESCENDING) {
> +		resource_size_t end;
> +
> +		end = min_t(resource_size_t, base->end,
> +			    (1ULL << MAX_PHYSMEM_BITS) - 1);
> +		return end - size + 1;
> +	}
> +
> +	return ALIGN(base->start, align);
> +}
> +
> +static bool gfr_continue(struct resource *base, resource_size_t addr,
> +			 resource_size_t size, unsigned long flags)
> +{
> +	if (flags & GFR_DESCENDING)
> +		return addr > size && addr >= base->start;
> +	/*
> +	 * In the ascend case be careful that the last increment by
> +	 * @size did not wrap 0.
> +	 */
> +	return addr > addr - size &&
> +	       addr <= min_t(resource_size_t, base->end,
> +			     (1ULL << MAX_PHYSMEM_BITS) - 1);
> +}
> +
> +static resource_size_t gfr_next(resource_size_t addr, resource_size_t size,
> +				unsigned long flags)
> +{
> +	if (flags & GFR_DESCENDING)
> +		return addr - size;
> +	return addr + size;
> +}
> +
> +static void remove_free_mem_region(void *_res)
> +{
> +	struct resource *res = _res;
> +
> +	if (res->parent)
> +		remove_resource(res);
> +	free_resource(res);
> +}
> +
> +static struct resource *
> +get_free_mem_region(struct device *dev, struct resource *base,
> +		    resource_size_t size, const unsigned long align,
> +		    const char *name, const unsigned long desc,
> +		    const unsigned long flags)
>  {
> -	resource_size_t end, addr;
> +	resource_size_t addr;
>  	struct resource *res;
>  	struct region_devres *dr = NULL;
>  
> -	size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
> -	end = min_t(unsigned long, base->end, (1UL << MAX_PHYSMEM_BITS) - 1);
> -	addr = end - size + 1UL;
> +	size = ALIGN(size, align);
>  
>  	res = alloc_resource(GFP_KERNEL);
>  	if (!res)
>  		return ERR_PTR(-ENOMEM);
>  
> -	if (dev) {
> +	if (dev && (flags & GFR_REQUEST_REGION)) {
>  		dr = devres_alloc(devm_region_release,
>  				sizeof(struct region_devres), GFP_KERNEL);
>  		if (!dr) {
>  			free_resource(res);
>  			return ERR_PTR(-ENOMEM);
>  		}
> +	} else if (dev) {
> +		if (devm_add_action_or_reset(dev, remove_free_mem_region, res))
> +			return ERR_PTR(-ENOMEM);
>  	}
>  
>  	write_lock(&resource_lock);
> -	for (; addr > size && addr >= base->start; addr -= size) {
> -		if (__region_intersects(addr, size, 0, IORES_DESC_NONE) !=
> -				REGION_DISJOINT)
> +	for (addr = gfr_start(base, size, align, flags);
> +	     gfr_continue(base, addr, size, flags);
> +	     addr = gfr_next(addr, size, flags)) {
> +		if (__region_intersects(base, addr, size, 0, IORES_DESC_NONE) !=
> +		    REGION_DISJOINT)
>  			continue;
>  
> -		if (__request_region_locked(res, &iomem_resource, addr, size,
> -						name, 0))
> -			break;
> +		if (flags & GFR_REQUEST_REGION) {
> +			if (__request_region_locked(res, &iomem_resource, addr,
> +						    size, name, 0))
> +				break;
>  
> -		if (dev) {
> -			dr->parent = &iomem_resource;
> -			dr->start = addr;
> -			dr->n = size;
> -			devres_add(dev, dr);
> -		}
> +			if (dev) {
> +				dr->parent = &iomem_resource;
> +				dr->start = addr;
> +				dr->n = size;
> +				devres_add(dev, dr);
> +			}
>  
> -		res->desc = IORES_DESC_DEVICE_PRIVATE_MEMORY;
> -		write_unlock(&resource_lock);
> +			res->desc = desc;
> +			write_unlock(&resource_lock);
> +
> +
> +			/*
> +			 * A driver is claiming this region so revoke any
> +			 * mappings.
> +			 */
> +			revoke_iomem(res);
> +		} else {
> +			res->start = addr;
> +			res->end = addr + size - 1;
> +			res->name = name;
> +			res->desc = desc;
> +			res->flags = IORESOURCE_MEM;
> +
> +			/*
> +			 * Only succeed if the resource hosts an exclusive
> +			 * range after the insert
> +			 */
> +			if (__insert_resource(base, res) || res->child)
> +				break;
> +
> +			write_unlock(&resource_lock);
> +		}
>  
> -		/*
> -		 * A driver is claiming this region so revoke any mappings.
> -		 */
> -		revoke_iomem(res);
>  		return res;
>  	}
>  	write_unlock(&resource_lock);
>  
> -	free_resource(res);
> -	if (dr)
> +	if (flags & GFR_REQUEST_REGION) {
> +		free_resource(res);
>  		devres_free(dr);
> +	} else if (dev)
> +		devm_release_action(dev, remove_free_mem_region, res);
>  
>  	return ERR_PTR(-ERANGE);
>  }
> @@ -1854,18 +1932,48 @@ static struct resource *__request_free_mem_region(struct device *dev,
>  struct resource *devm_request_free_mem_region(struct device *dev,
>  		struct resource *base, unsigned long size)
>  {
> -	return __request_free_mem_region(dev, base, size, dev_name(dev));
> +	unsigned long flags = GFR_DESCENDING | GFR_REQUEST_REGION;
> +
> +	return get_free_mem_region(dev, base, size, GFR_DEFAULT_ALIGN,
> +				   dev_name(dev),
> +				   IORES_DESC_DEVICE_PRIVATE_MEMORY, flags);
>  }
>  EXPORT_SYMBOL_GPL(devm_request_free_mem_region);
>  
>  struct resource *request_free_mem_region(struct resource *base,
>  		unsigned long size, const char *name)
>  {
> -	return __request_free_mem_region(NULL, base, size, name);
> +	unsigned long flags = GFR_DESCENDING | GFR_REQUEST_REGION;
> +
> +	return get_free_mem_region(NULL, base, size, GFR_DEFAULT_ALIGN, name,
> +				   IORES_DESC_DEVICE_PRIVATE_MEMORY, flags);
>  }
>  EXPORT_SYMBOL_GPL(request_free_mem_region);
>  
> -#endif /* CONFIG_DEVICE_PRIVATE */
> +/**
> + * alloc_free_mem_region - find a free region relative to @base
> + * @base: resource that will parent the new resource
> + * @size: size in bytes of memory to allocate from @base
> + * @align: alignment requirements for the allocation
> + * @name: resource name
> + *
> + * Buses like CXL, that can dynamically instantiate new memory regions,
> + * need a method to allocate physical address space for those regions.
> + * Allocate and insert a new resource to cover a free, unclaimed by a
> + * descendant of @base, range in the span of @base.
> + */
> +struct resource *alloc_free_mem_region(struct resource *base,
> +				       unsigned long size, unsigned long align,
> +				       const char *name)
> +{
> +	/* Default of ascending direction and insert resource */
> +	unsigned long flags = 0;
> +
> +	return get_free_mem_region(NULL, base, size, align, name,
> +				   IORES_DESC_NONE, flags);
> +}
> +EXPORT_SYMBOL_NS_GPL(alloc_free_mem_region, CXL);
> +#endif /* CONFIG_GET_FREE_REGION */
>  
>  static int __init strict_iomem(char *str)
>  {
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 169e64192e48..a5b4fee2e3fd 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -994,9 +994,14 @@ config HMM_MIRROR
>  	bool
>  	depends on MMU
>  
> +config GET_FREE_REGION
> +	depends on SPARSEMEM
> +	bool
> +
>  config DEVICE_PRIVATE
>  	bool "Unaddressable device memory (GPU memory, ...)"
>  	depends on ZONE_DEVICE
> +	select GET_FREE_REGION
>  
>  	help
>  	  Allows creation of struct pages to represent unaddressable device
> 


