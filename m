Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCEFA231E2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33010E9B0;
	Thu, 30 Jan 2025 16:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/H+uUhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378B910E9AE;
 Thu, 30 Jan 2025 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738254752; x=1769790752;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MxVA23gh+2tlV1fjNFBEIsy9w3l/SxA/crl3/z8a8t0=;
 b=g/H+uUhV5t1BVrkJEd865CayJ1+8cWZdTLMOSwaksu02HUEHM1M/BLJ9
 sJboQMEjs7t3IHs1ZKz4KMNNQKluSYrGQ3B7xrp1AnHGEZeGRQS0qagOV
 vdkwbPFoHCOr5hv+vnoo6J2E2kF56zdtNWe7g2EuMF8XP4DoPGcoaJErR
 J3K1V8MRTFfEAm/Zs32PqKDqEA81obCN/mHlZ5hHlzjN1gYRUK/vyFrIh
 FvN6nyQVhs5yup6gFqc7wNZt6Wj9DQFb40VCmiXhLYFbBQo0/SLFM1h9i
 qULd+F5eZZcCBYWyDD39QrF4p8pX/9UisvKPWeqy4zUpdNswI5GoAsB+i w==;
X-CSE-ConnectionGUID: /bbMV1Y2SueYS5xXvFW0+Q==
X-CSE-MsgGUID: MxS8C0D/SSWlr6u2swuyAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38010174"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38010174"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:32:23 -0800
X-CSE-ConnectionGUID: yGaA6WQsQombOqHLbhdM2g==
X-CSE-MsgGUID: clTrCyOpQjCRVvSR013TDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="114395145"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 08:32:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 08:32:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 08:32:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 08:32:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFWs09L7ZSA8Sdzoabf4NKspuIWG4HuUGekKg/FfhjNL/kP57E7lea9gyWmOI+rJJIKL1gLtc5HvqnrjC2wattnQ2QjWt/QkBjj8nxpigWENO01Uubb/BdatF/BFG5ngIfu2AQBFFO89Ow+4mkrV9ya1yfHBH8ucxUawUZKDxSQbh8xL4yBG1Z86FjUx3qrNfg+gt1FhMSB69YBtdJLhlN88ZS0aGgY9PD8d43q8zxFQoFlRkl0t/rnsp3AubbC7jNDvbGFX9Mr46XcRDnUAtS2gO+65IlgdLJ3NUP2F/YkYY32WJCREil7IYrzumAlCxUwXVjoGC/4RRDsKBAFyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykm34QZi7wrEMqfpzvENcOFQ9kvohL4Wl1ThgbaxX3E=;
 b=q5FJNYJh1H2yPvkvurQh7y9pAKU38uMpAfPD7Ym6/+1dv22t5HUKCljOSqpfpUvymhhfPKxTJBR4lzTEW8hd0iwanyU0lEqj5jO+IxUmtuu6QiWuMv8Kqvlw1qqVPPs8DlW7SF6lVHLrYm8Ri61F+OhPooMFBENy+ee//ONBGO+VzHjRn2GwAdoKmPdl5yDORwBcCxUyADqydq7jpSfAoCy1+R7nQeO29gOr8qGVfZAjlgYrdaUR6Ja2ifj9tlE2vLQgudP/a8pyJrFMQhpNcTX1VLDy9jJmvv4lnK/lvgzVVUKUt+oRRFOeCbgVW28Pxy6onRDj00o45JJo0rInLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7263.namprd11.prod.outlook.com (2603:10b6:8:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 16:31:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:31:50 +0000
Date: Thu, 30 Jan 2025 08:32:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 28/33] drm/xe: Add SVM VRAM migration
Message-ID: <Z5uprTtHJqOsn0EB@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-29-matthew.brost@intel.com>
 <01d5d109-aef5-463f-9475-22c2483501a3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <01d5d109-aef5-463f-9475-22c2483501a3@intel.com>
X-ClientProxiedBy: MW4PR04CA0183.namprd04.prod.outlook.com
 (2603:10b6:303:86::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e764ee6-cedd-48e3-5745-08dd414b98b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yJxdshw6HgAxtz4GYZnV/z+eWJ12EVHvp035prN+HSDYJCOe1k94J2j4M/rP?=
 =?us-ascii?Q?IKRG9C0h3SRG1AI1LTJjsDcuaoFz0ZdwG8iygY/FohyVtLwV9LMqi/6PKVfw?=
 =?us-ascii?Q?XZG+w2TUXzxiYefn7KyFQE3tQCGFIIv7IRQypy8OAL3xzrEWH2FcE9iVoNnc?=
 =?us-ascii?Q?sQLHqBnE87quCM56P3eYXqpo2oUjzlKptEqyFQGWKrKOQCntr5X4wRtDmgXq?=
 =?us-ascii?Q?0scgSS8dW64wnOLVj747pCQWNzLpi9TS+W+BZOx2HEsEVJGQ81VECOI7Af5B?=
 =?us-ascii?Q?vYROUKayj3l0QkH+jVh6SuiwNT0nM3oGN7/ZePh5lz5bmctju9o+EvfU1++f?=
 =?us-ascii?Q?iOjPlUVBOGDfIcFrEyj/6YslNd6g5fqUbYBrxBDlCWeH2Rq6v5Tzv2ED3UTZ?=
 =?us-ascii?Q?5Rlujuk2fJpq1jxA9l8uReMZnDd0JmYYuRhD8SjF41/WffSQuupZrsrKOILu?=
 =?us-ascii?Q?Y5/MMmfy0SU+yGCt/hMTnawbRdJNbS7xt/prWrQ6tYlEczK9TyMRFupiKh9r?=
 =?us-ascii?Q?xIfIH4z2K7fikTUWboPhgXLwkCtwS7RR/6qDFKjbmnU4dbc+dzE/7oeay2Wi?=
 =?us-ascii?Q?iwsqTpKBTOwhxeTBHDdnPGnl732CEOqkZH7JrCk/Mhj4ByO9ZGPm9mKLDqtA?=
 =?us-ascii?Q?dVkGBH/mIl50v3yXYMkBjJ9W65I95IvjFe6jZHPFStkbDygxprj55aqCf8xr?=
 =?us-ascii?Q?F0XTDxVdlRx7xQqQaScciJpOfo+7zY9y1aagV+l3VOgBIGedIoaRXWf2Fqhl?=
 =?us-ascii?Q?GXtJ6ca+1TPiL/0TvJGvDdzQ3pnZ5yiMiVwmr50ollXNMxfOFwcc7ooH1Z8F?=
 =?us-ascii?Q?Vqd/8n2+MTTJFLs395Jr1obQB+zbOfAftSSt+GNn/QfthpGKVPkPXEVxB2eK?=
 =?us-ascii?Q?hmbTMf332jNmtGhXX73zyUMqq1BZCmm+R1luWY3RT8BTaIN3tNWyOIWeY9Xw?=
 =?us-ascii?Q?J0q/dbW6xuDVnaDF0OqR5dEmDw4z99Y1pOcbXhlQTrGjj+momvsgTqbKIvDQ?=
 =?us-ascii?Q?GrAo+GH3ya0FrF367WGO0WknVxNk2TLMv4PeVQq2yoUKBEF8ItNJc2T9fnI1?=
 =?us-ascii?Q?kHoHETknnTYOpD1JPrPhrRbVqTBjxRM0+wIq4fQ6B16rjAgMT7/PqrfvT5ij?=
 =?us-ascii?Q?4NIDjsHWQSMCB8X0E/8XGnkdhzieaUOCEJ0/qeePBSXSeEsWjZ+5FOy8YKAY?=
 =?us-ascii?Q?UPzcuVLGKFWzQ9Tsg3vEbFWFPUUZJW41ruD2KZDz0SO22xkReyHq5YdirHeS?=
 =?us-ascii?Q?N92Rsu50JLk3XNxfmj+6d47Oxwm5zEbvxpjKkdeF656Suum6PiVrGTBxU4+Z?=
 =?us-ascii?Q?Etzd7iB95PmNhVPMpOecTlQXXn3QGqtQfML9uYbfBOiRYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EW05PypHYM/dN8L8zefxImK7q636eK3YemkURvNv8Sc2E0GH12IkmujrKtPj?=
 =?us-ascii?Q?Ee7XDrVpSOwLtIthYQt6pio0bDOwB5DHMXTwb7IY+T9yeOAatrxt9ttybkJN?=
 =?us-ascii?Q?ZWTpWUr0Px2VeRHRob9qsr/KLQzRZGpn4AIFrdDupcqpup5kcmUHtZ1p8M0L?=
 =?us-ascii?Q?NVJ5YrWCNvP45cBj2Jafz5jBIaMGQ92lou8H9hqaPuwXzzZTDrHxnERYJHci?=
 =?us-ascii?Q?ThaELnJ7BRtduQ6Cz1fue1+gZjtpnF2pPRUshDQ2sqL3sEoQHB2cY7ybK6hM?=
 =?us-ascii?Q?u6Gq3QhU47z6AkA22z7C7ZpyJwyZHWWuYJZvdfXHJiFsIIpr/mTU9GWcDcx9?=
 =?us-ascii?Q?EzlB9jnR1i7FID4yDLll008c8lHJrioTf9VjbnmpX4dtItMERwWgyWuOVQG2?=
 =?us-ascii?Q?W5njsPm25551RJ1V4JWtCp9ELceGHi1oyxitgl1ATNuAAkQsgIYYGS+8IOIP?=
 =?us-ascii?Q?1Qhdwqmy6kHLU2bxn1VDamqUr+GJ9xVMJ2ilqcPV9vMbTcMm3iAH7d/Re4wu?=
 =?us-ascii?Q?xQlxP9wrbzsHALazKqyDnjDsBdlfUMK6ESApcrskUA5TkeEgoHnANYqEojI6?=
 =?us-ascii?Q?a7tV6ejxiwwIqQSfCeHW4qct8uKl62IQJc0/qtNCjtno36s6h5Mab+66yROo?=
 =?us-ascii?Q?Nsowh4dWDsJv56AAG3TpiuGePsawAqENDSsj5BM6Y1kOrDSVeZXpAt2a0fhr?=
 =?us-ascii?Q?8tsDuN9eNz/lcMnastDBVVPEQp70TF6HfbypkeTDt7fq0lnXJfeNuSVJazCz?=
 =?us-ascii?Q?69rKc0pweCnLtlOr3KYokPhA7olwSdgXu+gqqEF7se8GrSc4oNF5rRVYYhHG?=
 =?us-ascii?Q?JABjmxFDnbT6UCX+QU87W2iRH+eBMNmZu720qw+t1tB2vCwA7Bx2M2q57fYG?=
 =?us-ascii?Q?4DxbjSZw9PSeF9/AHBLQGYMdYo2TTu9ETlVGAMfJUy+/M6vyuf6GcPQ/hASi?=
 =?us-ascii?Q?dtGYCm5P5ogheLYkm2GK8PxUBqRROGHJ9tcqWkXWDO61By4xbvRisDFWZSQ5?=
 =?us-ascii?Q?I76Ba2lRq3U2bDQhchWe/1MGCvNy+YRWVnVzfkGdZmyvACDGLT5xelg9Cb8O?=
 =?us-ascii?Q?Lykd+/U+nyqO81RW4se3a1RoTW+r/yorKXZsblS9lTTZmXHONLgn38RBRV64?=
 =?us-ascii?Q?uFuHsfto0P46jfnJkBHFOezFWUblVUjO5x4AGuZEPr7lKPPrSx/qDG94F1qx?=
 =?us-ascii?Q?rWueZuGuE/RDWWxXTuVJvLW9OwftOXfg4Y1yYxnFgvBLOxiQ1WB6QSKDwHpG?=
 =?us-ascii?Q?/ZXhYu8JteREUXed4pblNEfavEIGxAki/Q/JlrBFc5Q+N/J1JkQZC/9erTwF?=
 =?us-ascii?Q?oTMha7PIdEWnl6F9QLt6pxmRQ/S5hvvsi3OaBegLg0Si2Nm7zbI8lTbSrI9Q?=
 =?us-ascii?Q?GYgHsAR5iTLgUdO7u06XJc7Jzp4hQdhjZuhsFv17pXxzd4sGvmQP5i/RYmL5?=
 =?us-ascii?Q?TYF8Ckj6Oy0Zveh9buwrRYWAP5dk4nvaPRY3PQnYqhVFG0UJR0WX1BVwHhev?=
 =?us-ascii?Q?rfJwVXnC11qYIbqyjfPG8Oz9/Z05gzHAKd3ptryHwZN92LXLEoCQB1lHbbZM?=
 =?us-ascii?Q?sRIHWuk9ODxNEpehrwGx5LuywNT1m12ec6Blph+FVjY0faJvexixsZ3q/pgS?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e764ee6-cedd-48e3-5745-08dd414b98b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:31:49.9322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQItpwJwPyVcU7ix9liN/AO56VkbljlWdU1Q1MTbXMVyWfygKn2iF8qOh1tyQQe9vZASrQ4j31UY/VGe4Kermw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7263
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

On Thu, Jan 30, 2025 at 02:22:55PM +0000, Matthew Auld wrote:
> On 29/01/2025 19:52, Matthew Brost wrote:
> > Migration is implemented with range granularity, with VRAM backing being
> > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> > TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > 
> > The design choice for using TTM BO for VRAM backing store, as opposed to
> > direct buddy allocation, is as follows:
> > 
> > - DRM buddy allocations are not at page granularity, offering no
> >    advantage over a BO.
> > - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
> >    evict each other).
> > - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
> >    require a dma-resv.
> > - Likely allocation size is 2M which makes of size of BO (872)
> >    acceptable per allocation (872 / 2M == .0004158).
> > 
> > With this, using TTM BO for VRAM backing store seems to be an obvious
> > choice as it allows leveraging of the TTM eviction code.
> > 
> > Current migration policy is migrate any SVM range greater than or equal
> > to 64k once.
> > 
> > [1] https://patchwork.freedesktop.org/series/133643/
> > 
> > v2:
> >   - Rebase on latest GPU SVM
> >   - Retry page fault on get pages returning mixed allocation
> >   - Use drm_gpusvm_devmem
> > v3:
> >   - Use new BO flags
> >   - New range structure (Thomas)
> >   - Hide migration behind Kconfig
> >   - Kernel doc (Thomas)
> >   - Use check_pages_threshold
> > v4:
> >   - Don't evict partial unmaps in garbage collector (Thomas)
> >   - Use %pe to print errors (Thomas)
> >   - Use %p to print pointers (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_svm.c | 99 +++++++++++++++++++++++++++++++++++--
> >   drivers/gpu/drm/xe/xe_svm.h |  5 ++
> >   2 files changed, 100 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index ba1db030bf33..fc030855d078 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -502,7 +502,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
> >   	return 0;
> >   }
> > -__maybe_unused
> >   static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> >   	.devmem_release = xe_svm_devmem_release,
> >   	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> > @@ -582,6 +581,64 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> >   	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
> >   }
> > +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> > +{
> > +	return &tile->mem.vram;
> > +}
> > +
> > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> > +				       struct xe_svm_range *range,
> > +				       const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	struct xe_mem_region *mr = tile_to_mr(tile);
> > +	struct drm_buddy_block *block;
> > +	struct list_head *blocks;
> > +	struct xe_bo *bo;
> > +	ktime_t end = 0;
> > +	int err;
> > +
> > +retry:
> > +	xe_vm_lock(vm, false);
> > +	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range->base.itree.last + 1 -
> > +			  range->base.itree.start, ttm_bo_type_device,
> > +			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > +			  XE_BO_FLAG_CPU_ADDR_MIRROR);
> > +	xe_vm_unlock(vm);
> 
> What was the trick again to ensure eviction is not triggered at this point?
> I thought there was some trick with eviction_valuable() but I can't find it.
> 

I dropped that given the hacky nature of how it was implemented. Yes, it
is possible that we allocate VRAM and it is immediately evicted before
the bind occurs but in practice should never really happen given this BO
should be the last entry on the LRU list. Even if this happens, I
believe this is harmless given the bind will abort and trigger a retry.

Matt

> > +	if (IS_ERR(bo)) {
> > +		err = PTR_ERR(bo);
> > +		if (xe_vm_validate_should_retry(NULL, err, &end))
> > +			goto retry;
> > +		return bo;
> > +	}
> > +
> > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > +			       vm->xe->drm.dev, vm->svm.gpusvm.mm,
> > +			       &gpusvm_devmem_ops,
> > +			       &tile->mem.vram.dpagemap,
> > +			       range->base.itree.last + 1 -
> > +			       range->base.itree.start);
> > +
> > +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> > +	list_for_each_entry(block, blocks, link)
> > +		block->private = mr;
> > +
> > +	/*
> > +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
> > +	 * creation ref can be dropped upon CPU fault or unmap.
> > +	 */
> > +	xe_bo_get(bo);
> > +
> > +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
> > +					   &bo->devmem_allocation, ctx);
> > +	if (err) {
> > +		xe_bo_put(bo);	/* Local ref */
> > +		xe_bo_put(bo);	/* Creation ref */
> > +		return ERR_PTR(err);
> > +	}
> > +
> > +	return bo;
> > +}
> > +
> >   /**
> >    * xe_svm_handle_pagefault() - SVM handle page fault
> >    * @vm: The VM.
> > @@ -590,7 +647,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> >    * @fault_addr: The GPU fault address.
> >    * @atomic: The fault atomic access bit.
> >    *
> > - * Create GPU bindings for a SVM page fault.
> > + * Create GPU bindings for a SVM page fault. Optionally migrate to device
> > + * memory.
> >    *
> >    * Return: 0 on success, negative error code on error.
> >    */
> > @@ -598,11 +656,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   			    struct xe_tile *tile, u64 fault_addr,
> >   			    bool atomic)
> >   {
> > -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> > +	struct drm_gpusvm_ctx ctx = {
> > +		.read_only = xe_vma_read_only(vma),
> > +		.devmem_possible = IS_DGFX(vm->xe) &&
> > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > +	};
> >   	struct xe_svm_range *range;
> >   	struct drm_gpusvm_range *r;
> >   	struct drm_exec exec;
> >   	struct dma_fence *fence;
> > +	struct xe_bo *bo = NULL;
> >   	ktime_t end = 0;
> >   	int err;
> > @@ -610,6 +675,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> >   retry:
> > +	xe_bo_put(bo);
> > +	bo = NULL;
> > +
> >   	/* Always process UNMAPs first so view SVM ranges is current */
> >   	err = xe_svm_garbage_collector(vm);
> >   	if (err)
> > @@ -625,9 +693,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	if (xe_svm_range_is_valid(range, tile))
> >   		return 0;
> > +	/* XXX: Add migration policy, for now migrate range once */
> > +	if (!range->migrated && range->base.flags.migrate_devmem &&
> > +	    (range->base.itree.last + 1 - range->base.itree.start) >= SZ_64K) {
> > +		range->migrated = true;
> > +
> > +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > +		if (IS_ERR(bo)) {
> > +			drm_info(&vm->xe->drm,
> > +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %pe\n",
> > +				 vm->usm.asid, bo);
> > +			bo = NULL;
> > +			goto retry;
> > +		}
> > +	}
> > +
> >   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> > -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
> > +	/* Corner where CPU mappings have changed */
> > +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > +		if (err == -EOPNOTSUPP)
> > +			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> > +		drm_info(&vm->xe->drm,
> > +			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
> > +			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> >   		goto retry;
> > +	}
> >   	if (err)
> >   		goto err_out;
> > @@ -658,6 +748,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	dma_fence_put(fence);
> >   err_out:
> > +	xe_bo_put(bo);
> >   	return err;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 63daffdfdbf6..4c2576162c39 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -35,6 +35,11 @@ struct xe_svm_range {
> >   	 * range. Protected by GPU SVM notifier lock.
> >   	 */
> >   	u8 tile_invalidated;
> > +	/**
> > +	 * @migrated: Range has been migrated to device memory, protected by
> > +	 * GPU fault handler locking.
> > +	 */
> > +	u8 migrated	:1;
> >   };
> >   int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> 
