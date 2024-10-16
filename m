Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8699A004B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 06:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256A710E65D;
	Wed, 16 Oct 2024 04:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X47D+OsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1155310E65D;
 Wed, 16 Oct 2024 04:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729054058; x=1760590058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n+dN2M3eEnTZulIpsRR6EZpl+Y5mi3e2B92QVXDN/FE=;
 b=X47D+OsBE2rfQuBoGKPkdBYr96q9EPlH3DVhKpZetRaqZBalfV7kyHje
 JiVPFBgoeFOgoROOHv1G8Q4Pp45JcVf7FXCFdmWGlpnB0zTKm7yNXQc20
 RVVEYPR2BR/C/z0+1ZI4CEeyA9It1oFeqYznto36wJnYOc2d1Kdhy0urA
 6mRUFhdjBsTdf9nmPHeXFiw+g077qxlpzZg/69GyJ6SDctMZXcDE6thFP
 863RF5lV/SHdBXfg/dZFcnAK9W9E8pQ6OpBD5YS2qBgbTWfi7ZAkxeCQp
 L92oZiGLQTpjYqZTIhvESjx521AFl48+/bYD/THhyeCrGdwvO5DpXjXFx Q==;
X-CSE-ConnectionGUID: qak4RaG1SEWv88g8X0MItA==
X-CSE-MsgGUID: 1KPxgcylQ72zq9u2B4nNpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="53898601"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="53898601"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 21:47:37 -0700
X-CSE-ConnectionGUID: jpvre5TPQQCAKNtffY3sYw==
X-CSE-MsgGUID: NIV5w+JBQH2ct9h76ANScw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78281267"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 21:47:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 21:47:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 21:47:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 21:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VH1cvEN5zBSu3HwzctWLY5nynI4oGCEsfh4mdokpEELfubrnMlAQFeul6xcghtYbllT9El401g/AWN6ZwAMABTDcQrWkfObBHEJ5M8O8fm9h13V16iIQBMQgz26b6c/3CwyCkipeANopoGaUYxr45XYtmAjluPH+7ebMLw5A8LinCTrmhI89JCuKUWFeke+0qZEthpSVdWXeLdRJxXBb0r6J7+2V6Xl+d65KnamimIKIttT/wKRCWfpNh7+bjAjd1pwAxtO+pDTb0zicTJ5bnzuROJlOpG/XvJt9eRJ+oybkf+EnDBnOe7GyXRs2ldX7SZBkCVz4KB/ZSRjoTa9DZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7oTPVc/Dw+CPwvKAQxUSBlYfXBHYfuXOjXUta8SiAE=;
 b=e4cjPD45mJLnYt3lVJeXK0n8aFtIAZvMglWS6xUEUDZR/BZsMK6heGAD1dXaf3SG9ZzhwLZ/wQTVFVPMUOt73s1NhDlHFQGEgfNTWpg+rojyKBzLrLnv8mQMa0KzraQpWQ/gsJxp98xdDhoCDMVsE6uqBXgkny/pO1s9m2yg3KnL3h9zrrwMQKXJ9zpyaoHuSZ5BJwBciGhhLqCXD7oOeJQtm6SfA9XNZe8fDUoRhtZltw8OO9vFzmDQYhSbw/OLf38CPmt20szTUiB/uvyjF2RTk0OdEeZ6p6zSu0HUMRTAMr0cMH7cqMMzJw1hF0MBdRkgcd0cwh5/Hfu9EbYXTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:47:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:47:33 +0000
Date: Wed, 16 Oct 2024 04:46:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Message-ID: <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87o73k8yyq.fsf@nvdebian.thelocal>
X-ClientProxiedBy: BYAPR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:40::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: 962bc01d-7565-4b7f-deea-08dced9da63e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+h2c9GpWfdhdawlk1CrgJOD9haouRBUaHO5TKzVaBjkGnRd169njhMoWkPvt?=
 =?us-ascii?Q?Cr9qC2CkGXDmgaCkQBZyh/22N0njAM5olH6GoEDAcOH8KaAUjIdNPg5euWbK?=
 =?us-ascii?Q?lYO+r99Qqj9YxXkMtKYG0I6hm1+D4/V0pkVICJM2RNzNdqaTPaagadr4lUic?=
 =?us-ascii?Q?+XU9RgkQ2uZokmkUWUN5s/43B99fLUy5bmkji6YOWV2Z18pKDjUXeIB6AuGY?=
 =?us-ascii?Q?vtqLnYnywHWMXgLnLTv7EVGa+qZ275h4jnG5sdSTm4ApervvW64BfP1gErqX?=
 =?us-ascii?Q?LqzcIPOUAl5M2Qs6lgO3Tp5yFN90zx4ymTB1A1WfPGCcCCaGt0HMRPT4fUe5?=
 =?us-ascii?Q?eIYSnnTZ7u2eBHhPLb8CAbMxFjINvTA7DC/HQNECEGpSoDKb3xxwwHrYmNCO?=
 =?us-ascii?Q?/l1JdbrDnj86fXcxtDUjJKy5OxI+yUVtUQwVoUxeE+2oHeryXtJfQ9cKcMQ+?=
 =?us-ascii?Q?0qj9+5uTFXIdGxMCahAVWooXdDjPWHK9E1Fz1paBQV0lfBSpFhDth5lCuq7S?=
 =?us-ascii?Q?sfC1ASkDxQzDtQowctHs+OSY0dGiq3NANfc82dAwkQLbw2GXCEaQEX1ymoNQ?=
 =?us-ascii?Q?2l7qx3aCiCP5KKladukuYSbI1O7pPl8IX6+7kg4ukWT9lPMyqOZT1+Kh7gYq?=
 =?us-ascii?Q?9+jtffpKUsUXvzHcMKPexI/M1lA7jJbiODo5+xaxzud4i/k2K11jKzwl+xHx?=
 =?us-ascii?Q?Byg2GANS1r2sFgtIUp+3Zvj5kV7AYa1oB7ICxiFzjHmu7Yy3wpP6eefdFItC?=
 =?us-ascii?Q?UvruDwLXZ4MD0Kaw1qOIubZcoJEDEl2/m5tOWvbhFbZng7bBK71DjZGxzxUd?=
 =?us-ascii?Q?jsYRxYgBvoEbIRUDNESDXP4pzcQ0EvOIg8zYvcM/38ngYD+CNNFQHqx5pmFc?=
 =?us-ascii?Q?bRBwuTGPDT1F6UrPvpag4uwtQ5rAOIHF3XPdRC7X+8np37aV19Xqra1Szft2?=
 =?us-ascii?Q?yoF1BIfnwe0um+UIe7wAmUJfNPZ+NM2l1VBqVxBtBYk65pJLyOY48wna39pU?=
 =?us-ascii?Q?4XS96S24eF0QaLGEmsmqlG3grG+qkcISto2gUCoVDQwTGBX9tAKCTJmFaCi9?=
 =?us-ascii?Q?frF+T3aKSPHCFpH9LTCTYM5yyM0JJI1t6YRkBDKGr1lXmLkdwEObBTRPn9C1?=
 =?us-ascii?Q?glgysI3UFYUZmTkdAcpdyjWjPszajSo32ex/pKBMHZivQXuXh8/atmLvuZJc?=
 =?us-ascii?Q?cXX9Y8VNZQgmzGvh4YpoRiMcQ1b7PbUmw1zbAXX+J3bERqaiD8zvuu/WPBcH?=
 =?us-ascii?Q?auoBPGyjzFsbVIVh1muWnzxppai3sgVgV7lsSwsINQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnrEdNYYnzBZOM/ueUfmLw+4bZgsel/KHwA/x9jrG4vkPAguomj0boziMPXz?=
 =?us-ascii?Q?HPWskrf8+Zry8g41x9WSDr9V65V9iI6tqNoNMJ0qA5GOgbLy1IA6nl1i1bs7?=
 =?us-ascii?Q?MRVkqfI5YolSbtoN9vGqaELZHfrKUsRYsksbxrvE8lRR8nWKFjw0xgruiOJO?=
 =?us-ascii?Q?55CTxYztU99vMgGqkHn5EomEQ3k0DWMv+Hx9+hbSocOgPfTv5MWVcMq34J6x?=
 =?us-ascii?Q?Ly7yaas8oZlATcyGg+67kQayP6GtiBckXf7igI9JYK57+z46gncs6JuO5qK3?=
 =?us-ascii?Q?J0Kb9PThVDHP4+Op5qLBIlnt+W8STIbSE4J6x6VFUECmqc8jh4NrKr+Ojyi8?=
 =?us-ascii?Q?L5MvYR1TiPzh2PwB10uthLptIB7ZeUiTKtZb1XMP77HyeAn/bTVYx2PAVmss?=
 =?us-ascii?Q?d4+70abWs5um54Xd5q7V5hyN3pa/58IJ35Chn7NsFEBursu+vbIgAXgTekJ/?=
 =?us-ascii?Q?tihUn5wxj4A60vRS5e5Xm29xKQnSBSRWDEPgU4jbfZAqQc0YhjvCEQVFhwXd?=
 =?us-ascii?Q?ZUh6kw/6rUgpTSzv9PiORO5lYSKgNcrGt5XpkWEPYDHkaTFmeiFe01/7wEAu?=
 =?us-ascii?Q?vrwNFb67juieo6xKiDp90Zsj1c+u1zKonPYNiBeOM2kZUeb2bti6Jv5eklzX?=
 =?us-ascii?Q?PtaSp+rikrWw0sd9OaxJeufN4QkXycyNA0EnWS+GS+mK2diBk2zqjFV+IPz4?=
 =?us-ascii?Q?SSkn+75LueF3m4MiWBsDhOpBk2t/e+kQexTePMOZIOSTo0h3zugduGEwC8KX?=
 =?us-ascii?Q?Hiq1IcVHa6DydBjQr9cKBRI1daod+Zbb1ZBjrmeRSENqXlmwfaFhr7ml8jZL?=
 =?us-ascii?Q?WanTKIQM502Adja5x5KBn5Xw4EsjTxOf5yEHViFgLVx3pTA8kWLYS7X8+B69?=
 =?us-ascii?Q?sJH4+lTtq2o5Kse6M6DsMd07L4wHWnpiC/653Iyp0N9NJKq9497bMxaqc5QZ?=
 =?us-ascii?Q?M6RNJmgQ1FCk9Kh6hw2xqCMTP7d0j9huwNsic12Gtdw7VTj6rqNu27UfJZHg?=
 =?us-ascii?Q?9XsQQk+hyb0rvStp1qOkPFIG258eKSOX4MkdHjZPVW5PSjNc673nZutzzhNm?=
 =?us-ascii?Q?NQCATDoPUT4KaZTikRAJw8gQ8tx3MwuDVx0EYtbRjFuwkKdVMz7Krx0R37xG?=
 =?us-ascii?Q?iR2Ii//CUpIMie5+eFzZKJW9gpkdPCxgDwSqvonIVEW3Gh5oZakZ5oIe2yk5?=
 =?us-ascii?Q?xDXpBVIdT0i93ter4OO3bfzEFaLJSxro9rV+Rd+vuOfsrDQpSahfqA5IOnA8?=
 =?us-ascii?Q?Fo/ZloHyxOxnEGnj1w60MleOA8b4tI56W9XXZIhgSGaFfRGm1aBX0H+SWg3G?=
 =?us-ascii?Q?CEwutT0Jnz7BPNbJz5cbnjS6oRYSKzYYVKge2GbGlWYGZtnUaxAlu6f9agU8?=
 =?us-ascii?Q?9Oum2zQBcusNYpLG7Zj1AvIzFTRFYZPqxKIlZO/x6yVD7cwqDfG6uSgJcbfz?=
 =?us-ascii?Q?USAdOKzCuJL8U3yY8HfvY6ywd8MwKHv9Kg38tZ8G5Lo7eO/AYK4Ndx4a1eog?=
 =?us-ascii?Q?K1e72mavQerET1RvtioJpxrYlEEhhks7jhPwa+ReoxNTPujpFRgwWPzSfYxE?=
 =?us-ascii?Q?rUXWPUeaHbrn+fibXUGInMNyjRMfMi19WYHNL6tssJGpGXKwPHV764itY7sd?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 962bc01d-7565-4b7f-deea-08dced9da63e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:47:33.5514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kL161UNEnqgh13xulyAxV4Ok9d8OZlFHXAOLJCxWWA0nxyvjiWeUMEQaAJHfyTYKftr0D0DndAqRmkRnkkHCIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > Add migrate_device_prepoluated_range which prepares an array of
> > pre-populated device pages for migration.
> 
> It would be nice if the commit message could also include an explanation
> of why the existing migrate_device_range() is inadequate for your needs.
> 

Yea, my bad. It should explain this is required for non-contiguous
device pages. I suppose I could always iterate for contiguous regions
with migrate_device_range too if you think that is better.

> > v2:
> >  - s/migrate_device_vma_range/migrate_device_prepopulated_range
> >  - Drop extra mmu invalidation (Vetter)
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/linux/migrate.h |  1 +
> >  mm/migrate_device.c     | 35 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 36 insertions(+)
> >
> > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > index 002e49b2ebd9..9146ed39a2a3 100644
> > --- a/include/linux/migrate.h
> > +++ b/include/linux/migrate.h
> > @@ -229,6 +229,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
> >  void migrate_vma_finalize(struct migrate_vma *migrate);
> >  int migrate_device_range(unsigned long *src_pfns, unsigned long start,
> >  			unsigned long npages);
> > +int migrate_device_prepopulated_range(unsigned long *src_pfns, unsigned long npages);
> >  void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
> >  			unsigned long npages);
> >  void migrate_device_finalize(unsigned long *src_pfns,
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 9cf26592ac93..f163c2131022 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -924,6 +924,41 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
> >  }
> >  EXPORT_SYMBOL(migrate_device_range);
> >  
> > +/**
> > + * migrate_device_prepopulated_range() - migrate device private pfns to normal memory.
> > + * @src_pfns: pre-popluated array of source device private pfns to migrate.
> > + * @npages: number of pages to migrate.
> > + *
> > + * Similar to migrate_device_range() but supports non-contiguous pre-popluated
> > + * array of device pages to migrate.
> > + */
> > +int migrate_device_prepopulated_range(unsigned long *src_pfns, unsigned long npages)
> 
> I don't love the name, I think because it is quite long and makes me
> think of something complicated like prefaulting. Perhaps
> migrate_device_pfns()?
> 

Sure.

> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; i++) {
> > +		struct page *page = pfn_to_page(src_pfns[i]);
> > +
> > +		if (!get_page_unless_zero(page)) {
> > +			src_pfns[i] = 0;
> > +			continue;
> > +		}
> > +
> > +		if (!trylock_page(page)) {
> > +			src_pfns[i] = 0;
> > +			put_page(page);
> > +			continue;
> > +		}
> > +
> > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> 
> This needs to be converted to use a folio like
> migrate_device_range(). But more importantly this should be split out as
> a function that both migrate_device_range() and this function can call
> given this bit is identical.
> 

Missed the folio conversion and agree a helper shared between this
function and migrate_device_range would be a good idea. Let add that.

Matt

> > +	}
> > +
> > +	migrate_device_unmap(src_pfns, npages, NULL);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> > +
> >  /*
> >   * Migrate a device coherent folio back to normal memory. The caller should have
> >   * a reference on folio which will be copied to the new folio if migration is
> 
