Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE767FAA53
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 20:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B7B10E0DF;
	Mon, 27 Nov 2023 19:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894F410E0BD;
 Mon, 27 Nov 2023 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701113774; x=1732649774;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kSdPp1dpTnIGTvyPlg2xyNCOoWWM3+471f1Pvhxkv7s=;
 b=DZ8wO28qbOshWScDWk9+zXNccSDCGDWjL7MOQOM7HbJ8h6/7I7EeyMpx
 u2fQytQV+Ck4MopgETmb7mPO4nHL8JHrOgH0UpJdiZVsTTcfyu3x8JaO5
 w46pB5eGXlHbcvk76s7H0rVDd31eFpLRLphP9jFmSVMZwHtw7muXfGGI1
 tjlrf/RRn8zyGkqZUXAqIVSAVgiEScvYUuVhtxk6GXjTvw8jQRlWk2dOW
 4Tr1YTAKe0q9KOgxACGFp94v/S4AZRChrXb7OBHJB8PnjryTk/ejjJkwL
 utbqsSkWhQ35piIh2aPuT78GoUDxrdH01Bm3djd547YlLIUs76krNuTun w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372152418"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="372152418"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 11:36:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="912186243"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="912186243"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 11:36:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 11:36:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 11:36:12 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 11:36:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1nDSP9IA8Pe+KBO5yl55Of3mHOUbD0G33kSHzOTa3S9X8JEVRMhcv2iGHc89ur41Tj5sK3zMBlSvcckfAYMx01q4uMHzy0wNT02NSUGv+7iAIPQg9mFJtB5UgGR3ViE+fyyL+H7U3ncwPC+XmOZAgakoe0sLKWzPUhojLg73J4Ga/np/yg5I3T1LNXxpjwd/gqrjjaAfp93AvMnYD6q+5JMtkmsiMVvZxKPzUJTdStZ5LH9Upg5LeblQlcMH7Oim5vXdCKhNBGph/YaTW2P2RCqh3vBhp3q3oA2EWL1EEA6IG6UGkEAX9jHRZA/hvCIfW5qiQOrtsVTAbdbSeZHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0D9Ui5EvxT4/LZRLUgMB0TEiOLv0DNGdlC8U/DXjJ0=;
 b=VgsrRjLONcUsNQWGzVFt8rGK/NL20YP8aSApcd2nrMwG1214+PpB2NLAuC3TIC9AZY+2Rdy5iHlizedboI2GP6Di8GRB94baFt9hchOthi3/QWciXa4sOylPrC92WL3RJckaBdBCs9aqwLUJGKg70WQsAsYSH6J7cePaOY8BgVYsI37As6xPajW0UvVem+E5qjnDuMxGqBu6Rr5K8jvUNlzo/dGHdQxPJAFriJVkOJ+7tJDMGY+GdA5pwXy9EXRcGt/E2uaCnFWOGEj8Ot59tE3Uo/6mpMr/dUfJRE15i9R1FfiWjzgouNN/5XZFOi3ly8kOFr238PGljssYTnNdCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 19:36:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 19:36:08 +0000
Date: Mon, 27 Nov 2023 14:36:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH v5] Documentation/gpu: VM_BIND locking document
Message-ID: <ZWTvohD9rTx9aAWa@intel.com>
References: <20231121104046.3201-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121104046.3201-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4753:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a46f100-e3e6-42c7-22f3-08dbef801993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 29smSuXZ6j+Y8AfFJGYq4aq4kexoyi1ceTvce7/NJ+Gqanaw9gMFbgfVsQls5dEhotXMYpMnMaHam6ZluwRqkh114czEQYuSnLUXVDPXcpZE35mx65y91m3Twtpx17sqqoHVEpvkq0OTLTgCs7r7sGwYbFAK3PiYOtAWaNb0N5R71pq3LzqdoBqhZTmkDBZnOr81++IYCOY73vBWt3tKMiF11xjdmzeIIee4iGK6Nx59KCTEftZOuqgNVdWtvHDrwtQS84ZgsblN12/u5dWzXQ+h4JsQ2fbZrzY5rnpYpzP+/wzo5MiJYiAu53pDMDGwMqcyGguXMgkvHjV0wGJNvJkacPGEkRCTzh2GvUeCyccjrXxrVV/pVl6umaTz9nSJdu0tLmsnea18v6TCSswAuIwaFF21ZwR6O3TXWirOTrrjtH+u76gnuaRNxw/yryYjpMKR4y4tTQfVEYsSgmzE9i4WuGA6z14G+6jtw0nhyL+cxfIqimIdjxu1a2x3QTixE+uHcziQA6W5D9PRMTD0f520uTaJgJfikS0Ek9TibtRBM2bLo0Ew+AErftRHyTGrDHir9JykSOTpFZVLbhpUkTEpgWIu193SKH82bXJ6TI2bSWYgW2nd8efTucZ90X9Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(64100799003)(186009)(6666004)(8676002)(8936002)(4326008)(6512007)(66476007)(66946007)(66556008)(54906003)(6916009)(316002)(6486002)(478600001)(2906002)(30864003)(38100700002)(36756003)(41300700001)(86362001)(26005)(44832011)(6506007)(2616005)(82960400001)(83380400001)(5660300002)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Oo6nZHtzCKd8eFM8PsAdmFcdjVqNySQeQVDiuexJyhCgMeR5g8NjwCZ4a4?=
 =?iso-8859-1?Q?5+5uHKmU999+85OWSL75lfHD++8+FgnXIrfvb9T5dxs8ttZ6Y/xrg0y3MD?=
 =?iso-8859-1?Q?+V7Ayw0Ff0kekOZ/QJEYFFgNGmK22QIojyeiFQUzebi8go2Jesjt2Qp/za?=
 =?iso-8859-1?Q?hQphu1WnfnzPiuH17MgXJTGAMnBvLyYJVI+YiemJNrbkREGM3nATSU1OrK?=
 =?iso-8859-1?Q?V/hPS6QGn498qXbnL5I8UynAh+fX9LiInv9GgGrp36RoIQyiRRV1UWF+Qw?=
 =?iso-8859-1?Q?fTLw7Iavr8/Kq447iPC9MsL8gg9ZOCzgk8tsWBCyTNv9vg9y74VJPuct6T?=
 =?iso-8859-1?Q?xoRmjxwzxcF/BgEIKOyXvmrzmq1XSGs+BtphOm7r7Cp62REgVUwcqXByqY?=
 =?iso-8859-1?Q?QvnmW8r/bIIAoIVa49cOBgZUBS7aiTcM2aoWstkb/wXEAkhOn3et/HcyLv?=
 =?iso-8859-1?Q?yLKpm4IEZ7VDPUEysuryYXgoZ0xydngmqxghJU3eibx9ArYfO+jcLL9NbG?=
 =?iso-8859-1?Q?RNnMx+7gVtAOXkULPEgE6ZqcFX91FaUhcZjmE9QSCCNr9QtSiiNzjWWKG5?=
 =?iso-8859-1?Q?PvsdyZhsxs2Q0Vi1bjcOrT1ZruhcIHGf8rgnk8CqpWvT9PYOFzWIdP0Lpf?=
 =?iso-8859-1?Q?NmIRlaHijI3u9VHlzLvR1zeXgbrqq9Lbnv0hRhdRN+LHvUullt7RsiVWJk?=
 =?iso-8859-1?Q?L6JYQV5095kMQkF+b98zHcnb083zYWBg4y1hpSthBvWdSUg21cxJAYd8Ux?=
 =?iso-8859-1?Q?njhkM7poWs3YxXdyyFH1fyRC6x6J3YjmbAOLiHETdpiuVp4KacF1EsGVDd?=
 =?iso-8859-1?Q?RcWEeG4YDCkuP1hZOhQQOvRDmyeNVFlwWCgsk2HudcF4tnHzLQxf2E/i1X?=
 =?iso-8859-1?Q?aHJIJQ7Q14wv0w3temodOigOllAHsyAjQjevn+oyaz/NujULyNirwyanbm?=
 =?iso-8859-1?Q?h/F5jqFLtogUf5NCI7v3ChcPW1VUlmQeoKnIPBXR0AnSUGNkwtXONsJgcr?=
 =?iso-8859-1?Q?CAXe5CcFOMBgG+nK2VmkZRWuwBbjgPzxAB+QvZPNeymDXwYWewg+g0yYGi?=
 =?iso-8859-1?Q?1chOPcF+YQRtQwqcps+NMIS4M8NE+HKZVlTuItvcST+i3umXLeBRr3ko0t?=
 =?iso-8859-1?Q?UDAo7D/BsBLVaDKxq7lDrwWoZ0HvDC4vT2Z4APCPaBiic33lKy6/ca8Odn?=
 =?iso-8859-1?Q?GVP27Htuqo142bNjJsxWiqZjsPhXnJUBLHmxy4+s7h1ycS9H8dG2VYJCY4?=
 =?iso-8859-1?Q?av95EKwkgITDCCNmvriVJoj8GsUgb1fAOsx19o9+fILDFOPuSFkhSpiatX?=
 =?iso-8859-1?Q?7RHUIdfSBvh3BYdBeERicspxe+4bEpsGcCrgwCBVlna6IplEyGRju3VO04?=
 =?iso-8859-1?Q?wOLnMGLL0dk3dW7s2WFcr1yTpDb66WID0n7lGMhvNEUvgbCoTpv9zuFuZO?=
 =?iso-8859-1?Q?OsduOtVkoOI7rlDoRYxqogqdsERvF/0dW+TPseNQcz5mADW0LWJPCXW4Hy?=
 =?iso-8859-1?Q?Xk5ih9eqja64Njz0r+MhlK3shcIy+9vPav3F48thd/jvxzHPCfOOBP1p7H?=
 =?iso-8859-1?Q?TF/Yg1Vq9EmaN7XblyEQT5rOq+bVvroFzYk/G66wCLVkHRa8Pi+uZY4i+c?=
 =?iso-8859-1?Q?CW+0+vegTg4VEKG/DSrqmz9YRe+wnGgJpz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a46f100-e3e6-42c7-22f3-08dbef801993
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 19:36:07.1983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvLf3p696qlKZXtYPz5Gva7rePTcFlwXa7DAKSMRiMTL6pxt88c7GDtw1U5tBEx0nwuWGQP9SUI3yY+URvauDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
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
Cc: linux-doc@vger.kernel.org, Francois Dugast <francois.dugast@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 11:40:46AM +0100, Thomas Hellstr�m wrote:
> Add the first version of the VM_BIND locking document which is
> intended to be part of the xe driver upstreaming agreement.
> 
> The document describes and discuss the locking used during exec-
> functions, evicton and for userptr gpu-vmas. Intention is to be using the
> same nomenclature as the drm-vm-bind-async.rst.
> 
> v2:
> - s/gvm/gpu_vm/g (Rodrigo Vivi)
> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>   (Rodrigo Vivi)
> - Adjust commit message accordingly.
> - Add SPDX license header.
> 
> v3:
> - Large update to align with the drm_gpuvm manager locking
> - Add "Efficient userptr gpu_vma exec function iteration" section
> - Add "Locking at bind- and unbind time" section.
> 
> v4:
> - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
> - Minor style fixes and typos (Rodrigo Vivi)
> - Clarify situations where stale GPU mappings are occurring and how
>   access through these mappings are blocked. (Rodrigo Vivi)
> - Insert into the toctree in implementation_guidelines.rst
> 
> v5:
> - Add a section about recoverable page-faults.
> - Use local references to other documentation where possible
>   (Bagas Sanjaya)
> - General documentation fixes and typos (Danilo Krummrich and
>   Boris Brezillon)
> - Improve the documentation around locks that need to be grabbed from the
>   dm-fence critical section (Boris Brezillon)
> - Add more references to the DRM GPUVM helpers (Danilo Krummrich and
>   Boriz Brezillon)
> - Update the rfc/xe.rst document.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Thomas Hellstr�m <thomas.hellstrom@linux.intel.com>

First of all, with Bagas and Boris latest suggestions, already few
free to use:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

But a few minor comments below. Mostly trying to address Boris feeling
of long sentences. However, take them with a grain of salt since I'm not
a native english speaker. :) 

> ---
>  Documentation/core-api/pin_user_pages.rst     |   2 +
>  Documentation/gpu/drm-mm.rst                  |   4 +
>  Documentation/gpu/drm-vm-bind-locking.rst     | 579 ++++++++++++++++++
>  .../gpu/implementation_guidelines.rst         |   1 +
>  Documentation/gpu/rfc/xe.rst                  |   5 +
>  5 files changed, 591 insertions(+)
>  create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
> 
> diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core-api/pin_user_pages.rst
> index d3c1f6d8c0e0..6b5f7e6e7155 100644
> --- a/Documentation/core-api/pin_user_pages.rst
> +++ b/Documentation/core-api/pin_user_pages.rst
> @@ -153,6 +153,8 @@ NOTE: Some pages, such as DAX pages, cannot be pinned with longterm pins. That's
>  because DAX pages do not have a separate page cache, and so "pinning" implies
>  locking down file system blocks, which is not (yet) supported in that way.
>  
> +.. _mmu-notifier-registration-case:
> +
>  CASE 3: MMU notifier registration, with or without page faulting hardware
>  -------------------------------------------------------------------------
>  Device drivers can pin pages via get_user_pages*(), and register for mmu
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index acc5901ac840..d55751cad67c 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -466,6 +466,8 @@ DRM MM Range Allocator Function References
>  .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>     :export:
>  
> +.. _drm_gpuvm:
> +
>  DRM GPUVM
>  =========
>  
> @@ -481,6 +483,8 @@ Split and Merge
>  .. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
>     :doc: Split and Merge
>  
> +.. _drm_gpuvm_locking:
> +
>  Locking
>  -------
>  
> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
> new file mode 100644
> index 000000000000..a7d08eccd50e
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> @@ -0,0 +1,579 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +===============
> +VM_BIND locking
> +===============
> +
> +This document attempts to describe what's needed to get VM_BIND locking right,
> +including the userptr mmu_notifier locking and it also discusses some

including the userptr mmu_notifier locking. It also discusses some

> +optimizations to get rid of the looping through of all userptr mappings and
> +external / shared object mappings that is needed in the simplest
> +implementation. In addition there is a section describing the VM_BIND locking

In addition,

> +required for implementing recoverable pagefaults.
> +
> +The DRM GPUVM set of helpers
> +============================
> +
> +There is a set of helpers for drivers implementing VM_BIND, and this
> +set of helpers implements much, but not all of the locking described
> +in this document. In particular it is currently lacking a userptr

In particular,

> +implementation. Please refer to the :ref:`DRM GPUVM documentation
> +<drm_gpuvm>`. This document does not intend to describe the DRM GPUVM
> +implementation in detail, but in some places uses it as an
> +implementation example. It is highly recommended for any driver
> +implementing VM_BIND to use the DRM GPUVM helpers and to extend it if
> +common functionality is missing.
> +
> +Nomenclature
> +============
> +
> +* ``Context``: GPU execution context.

and what is a GPU execution context? :)
Thinking that on Xe we stopped using context because no one could ever
define that and we chosen execution queue instead.

I'd probably just remove this definition from here and do a
s/context/execution context/ where it applies below.

> +* ``gpu_vm``: Abstraction of a virtual GPU address space with
> +  meta-data. Typically one per client (DRM file-private), or one per
> +  context.
> +* ``gpu_vma``: Abstraction of a GPU address range within a gpu_vm with
> +  associated meta-data. The backing storage of a gpu_vma can either be
> +  a GEM object or anonymous pages mapped also into the CPU
> +  address space for the process.
> +* ``gpu_vm_bo``: Abstracts the association of a GEM object and
> +  a VM. The GEM object maintains a list of gpu_vm_bos, and a gpu_vm_bo

  a VM. The GEM object maintains a list of gpu_vm_bos, where each gpu_vm_bo

(maybe 'while'? or some better connector?)

> +  maintains a list of gpu_vmas.
> +* ``userptr gpu_vma or just userptr``: A gpu_vma, whose backing store
> +  is anonymous pages as described above.
> +* ``revalidating``: Revalidating a gpu_vma means making the latest version
> +  of the backing store resident and making sure the gpu_vma's
> +  page-table entries point to that backing store.
> +* ``dma_fence``: A struct dma_fence that is similar to a struct completion
> +  and which tracks GPU activity. When the GPU activity is finished,
> +  the dma_fence signals. Please refer to the ``DMA Fences`` section of
> +  the :doc:`dma-buf doc </driver-api/dma-buf>`.
> +* ``dma_resv``: A struct dma_resv (a.k.a reservation object) that is used
> +  to track GPU activity in the form of multiple dma_fences on a
> +  gpu_vm or a GEM object. The dma_resv contains an array / list
> +  of dma_fences and a lock that needs to be held when adding
> +  additional dma_fences to the dma_resv. The lock is of a type that
> +  allows deadlock-safe locking of multiple dma_resvs in arbitrary
> +  order. Please refer to the ``Reservation Objects`` section of the
> +  :doc:`dma-buf doc </driver-api/dma-buf>`.
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected gpu_vmas, submits a GPU command batch and registers the
> +  dma_fence representing the GPU command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +* ``local object``: A GEM object which is only mapped within a
> +  single VM. Local GEM objects share the gpu_vm's dma_resv.
> +* ``external object``: a.k.a shared object: A GEM object which may be shared
> +  by multiple gpu_vms and whose backing storage may be shared with
> +  other drivers.
> +
> +Locks and locking order
> +=======================
> +
> +One of the benefits of VM_BIND is that local GEM objects share the gpu_vm's
> +dma_resv object and hence the dma_resv lock. So even with a huge

So,

> +number of local GEM objects, only one lock is needed to make the exec
> +sequence atomic.
> +
> +The following locks and locking orders are used:
> +
> +* The ``gpu_vm->lock`` (optionally an rwsem). Protects the gpu_vm's
> +  data structure keeping track of gpu_vmas. It can also protect the
> +  gpu_vm's list of userptr gpu_vmas. With a CPU mm analogy this would
> +  correspond to the mmap_lock.
> +* The ``userptr_seqlock``. This lock is taken in read mode for each
> +  userptr gpu_vma on the gpu_vm's userptr list, and in write mode during mmu
> +  notifier invalidation. This is not a real seqlock but described in
> +  ``mm/mmu_notifier.c`` as a "Collision-retry read-side/write-side
> +  'lock' a lot like a seqcount, however this allows multiple

s/, however/. However/

> +  write-sides to hold it at once...". The read side critical section
> +  is enclosed by ``mmu_interval_read_begin() /
> +  mmu_interval_read_retry()`` with ``mmu_interval_read_begin()``
> +  sleeping if the write side is held.
> +  The write side is held by the core mm while calling mmu interval
> +  invalidation notifiers.
> +* The ``gpu_vm->resv`` lock. Protects the gpu_vm's list of gpu_vmas needing
> +  rebinding, as well as the residency state of all the gpu_vm's local
> +  GEM objects.
> +  Furthermore it typically protects the gpu_vm's list of evicted and

Furthermore,

> +  external GEM objects.
> +* The ``gpu_vm->userptr_notifier_lock``. This is an rwsem that is
> +  taken in read mode during exec and write mode during a mmu notifier
> +  invalidation. The userptr notifier lock is per gpu_vm.
> +* The ``gem_object->gpuva_lock`` This lock protects the GEM object's
> +  list of gpu_vm_bos. This is usually the same lock as the GEM
> +  object's dma_resv, but some drivers protects this list differently,
> +  see below.
> +* The ``gpu_vm list spinlocks``. With some implementations they are needed
> +  to be able to update the gpu_vm evicted- and external object
> +  list. For those implementations, the spinlocks are grabbed when the
> +  lists are manipulated. However to avoid locking order violations

However,

> +  with the dma_resv locks, a special scheme is needed when iterating
> +  over the lists.
> +
> +.. _gpu_vma lifetime:
> +
> +Protection and lifetime of gpu_vm_bos and gpu_vmas
> +==================================================
> +
> +The GEM object's list of gpu_vm_bos, and the gpu_vm_bo's list of gpu_vmas
> +is protected by the ``gem_object->gpuva_lock``, which is typically the
> +same as the GEM object's dma_resv, but if the driver
> +needs to access these lists from within a dma_fence signalling
> +critical section, a driver can choose to instead protect it with a

since you already told 'the driver' above, maybe s/a driver/it/

also the 'instead protect' looks strange, but I don't know how to improve.

> +separate lock, which can be locked from within the dma_fence signalling
> +critical section. Such drivers then need to pay additional attention
> +to what locks need to be taken from within the loop when iterating
> +over the gpu_vm_bo and gpu_vma lists to avoid locking-order inversion.
> +
> +The DRM GPUVM set of helpers provide lockdep asserts that this lock is
> +held in relevant situations and also provides a means of making itself
> +aware of which lock is actually used: :c:func:`drm_gem_gpuva_set_lock`.
> +
> +Each gpu_vm_bo holds a reference counted pointer to the underlying GEM
> +object, and each gpu_vma holds a reference counted pointer to the

object. While each gpu_vma holds a reference counted pointer to the

> +gpu_vm_bo. When iterating over the GEM object's list of gpu_vm_bos and
> +over the gpu_vm_bo's list of gpu_vmas, the ``gem_object->gpuva_lock`` must
> +not be dropped, because if it is dropped, gpu_vmas attached to a
> +gpu_vm_bo may disappear without notice because they are not
> +reference-counted. A driver may implement its own scheme to allow this
> +at the expense of additional complexity, and that is out of scope
> +for this document.
> +
> +In the DRM GPUVM implementation, each gpu_vm_bo and each gpu_vma
> +holds a reference count on the gpu_vm itself. Due to this, and to avoid circular
> +reference counting, cleanup of the gpu_vm's gpu_vmas must not be done from the
> +gpu_vm's destructor. Drivers typically implements a gpu_vm close
> +function for this cleanup.
> +
> +Revalidation and eviction of local objects
> +==========================================
> +
> +(Note that in all the code examples given below we use simplified
> +pseudo-code. In particular, the dma_resv deadlock avoidance algorithm
> +as well as reserving memory for dma_resv fences is left out).

should we use some kind of rst note: block?

> +
> +Revalidation
> +____________
> +With VM_BIND, all local objects need to be resident when the gpu is
> +executing using the gpu_vm, and the objects need to have valid
> +gpu_vmas set up pointing to them. Typically each gpu command buffer

Typically,

> +submission is therefore preceded with a re-validation section:
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(gpu_vm->resv);
> +
> +   // Validation section starts here.
> +   for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list, &gpu_vm_bo) {
> +           validate_gem_bo(&gpu_vm_bo->gem_bo);
> +
> +           // The following list iteration needs the Gem object's
> +           // dma_resv to be held (it protects the gpu_vm_bo's list of
> +           // gpu_vmas, but since local gem objects share the gpu_vm's
> +           // dma_resv, it is already held at this point.
> +           for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> +                  move_gpu_vma_to_rebind_list(&gpu_vma, &gpu_vm->rebind_list);
> +   }
> +
> +   for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gpu_vma) {
> +           rebind_gpu_vma(&gpu_vma);
> +           remove_gpu_vma_from_rebind_list(&gpu_vma);
> +   }
> +   // Validation section ends here, and job submission starts.
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   dma_resv_unlock(gpu_vm->resv);
> +
> +The reason for having a separate gpu_vm rebind list is that there
> +might be userptr gpu_vmas that are not mapping a buffer object that
> +also need rebinding.
> +
> +Eviction
> +________
> +
> +Eviction of one of these local objects will then look similar to the
> +following:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo);
> +           add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +Note that since the object is local to the gpu_vm, it will share the gpu_vm's
> +dma_resv lock so that ``obj->resv == gpu_vm->resv``.
> +The gpu_vm_bos marked for eviction are put on the gpu_vm's evict list,
> +which is protected by ``gpu_vm->resv``,

we should probably break here with a '.' and re-phrase the rest:

>  that is always locked while
> +evicting, due to the above equality.


> +
> +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before eviction,
> +Since the driver must ensure that the eviction blit or copy will wait

s/Since/since.

> +for GPU idle or depend on all previous GPU activity. Furthermore, any
> +subsequent attempt by the GPU to access freed memory through the
> +gpu_vma will be preceded by a new exec function, with a revalidation
> +section which will make sure all gpu_vmas are rebound. The eviction
> +code holding the object's dma_resv while revalidating will ensure a
> +new exec function may not race with the eviction.
> +
> +If a driver, however, is implemented in such a way that, on each exec function,
> +only a subset of vmas are selected for rebind, then all vmas that are
> +*not* selected for rebind must be unbound at the time before the exec
> +function workload is submitted.

A driver can be implemented in such a way where only a subset of vmas are
selected for rebind. In this case, all the vmas that are **not** selected
must be unbound before the exec function workload is submitted.

> +
> +Locking with external buffer objects
> +====================================
> +
> +Since external buffer objects may be shared by multiple gpu_vm's they
> +can't share their reservation object with a single gpu_vm, but will rather
> +have a reservation object of their own. The external objects bound to a

Since external buffer objects may be shared by multiple gpu_vm's, they
can't share their reservation object with a single gpu_vm. Instead they
need to have a reservation object of their own. The external objects bound to a

> +gpu_vm using one or many gpu_vmas are therefore put on a
> +per-gpu_vm list which is protected by the gpu_vm's dma_resv lock or
> +one of the :ref:`gpu_vm list spinlocks <Spinlock iteration>`. Once
> +the gpu_vm's reservation object is locked, it is safe to traverse the
> +external object list and lock the dma_resvs of all external
> +objects. However if instead a list spinlock is used, a more elaborate

However,

> +iteration scheme needs to be used.
> +
> +At eviction time we now need to put the gpu_vm_bos of *all* the gpu_vms a

At eviction time,

But also consider switch to impersonal mode removing 'we'

> +external object is bound to on their gpu_vm's evict list, but we can no longer
> +be certain that we hold the gpu_vm's dma_resvs of all the gpu_vms the
> +object is bound to, since at eviction time we only hold the object's
> +private dma_resv. If we have a ww_acquire context at hand at eviction
> +time we could grab the those dma_resvs but that could cause
> +expensive ww_mutex rollbacks. A simple option is to just mark the
> +gpu_vm_bos of the evicted gem object with an ``evicted`` bool that
> +is inspected before the next time the corresponding gpu_vm evicted list needs
>+ to be traversed, when traversing the list of external objects and

to be traversed. When traversing the list of external objects and

> +locking them. At the time where the evicted list is traversed, the
> +gpu_vm's dma_resv and the object's dma_resv is held, and the gpu_vm_bo
> +marked evicted, can then be added to the gpu_vm's list of evicted
> +gpu_vm_bos. The ``evicted`` bool is protected by the object's
> +dma_resv. Note, that if the gpu_vm's evict list is instead protected
> +by a gpu_vm list spinlock, we can grab that lock at eviction time and
> +hence don't need the trick using the ``evicted`` bool.
> +
> +The exec function becomes
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(gpu_vm->resv);
> +
> +   // External object list is protected by the gpu_vm->resv lock.
> +   for_each_gpu_vm_bo_on_extobj_list(gpu_vm, &gpu_vm_bo) {
> +           dma_resv_lock(gpu_vm_bo.gem_obj->resv);
> +           if (gpu_vm_bo_marked_evicted(&gpu_vm_bo))
> +                   add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +   }
> +
> +   for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list, &gpu_vm_bo) {
> +           validate_gem_bo(&gpu_vm_bo->gem_bo);
> +
> +           for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> +                  move_gpu_vma_to_rebind_list(&gpu_vma, &gpu_vm->rebind_list);
> +   }
> +
> +   for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gpu_vma) {
> +           rebind_gpu_vma(&gpu_vma);
> +           remove_gpu_vma_from_rebind_list(&gpu_vma);
> +   }
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   for_each_external_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +   dma_resv_unlock_all_resv_locks();
> +
> +And the corresponding shared-object aware eviction would look like:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo)
> +           if (object_is_vm_local(obj))
> +                add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +           else
> +                mark_gpu_vm_bo_evicted(&gpu_vm_bo);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +.. _Spinlock iteration:
> +
> +Accessing the gpu_vm's lists without the dma_resv lock held
> +===========================================================
> +
> +Although some drivers will hold the gpu_vm's dma_resv lock when
> +accessing the gpu_vm's evict list and external objects lists, there
> +are drivers that need to access these lists without the dma_resv lock held,
> +for example due to asynchronous state updates from within the


Some drivers will hold the gpu_vm's dma_resv lock when
accessing the gpu_vm's evict list and external objects lists.
However, there
are drivers that need to access these lists without the dma_resv lock held
due to asynchronous state updates from within the


> +dma_fence signalling critical path. In such case a spinlock can be

In such case,

> +used to protect manipulation of the lists. However, since higher level
> +sleeping locks need to be taken for each list item while iterating
> +over the lists, the items already iterated over need to be
> +temporarily moved to a private list and the spinlock released
> +while processing each item:
> +
> +.. code block:: C
> +
> +    struct list_head still_in_list;
> +
> +    INIT_LIST_HEAD(&still_in_list);
> +
> +    spin_lock(&gpu_vm->list_lock);
> +    do {
> +            struct list_head *entry = list_first_entry_or_null(&gpu_vm->list, head);
> +
> +            if (!entry)
> +                    break;
> +
> +            list_move_tail(&entry->head, &still_in_list);
> +            list_entry_get_unless_zero(entry);
> +            spin_unlock(&gpu_vm->list_lock);
> +
> +            process(entry);
> +
> +            spin_lock(&gpu_vm->list_lock);
> +            list_entry_put(entry);
> +    } while (true);
> +
> +    list_splice_tail(&still_in_list, &gpu_vm->list);
> +    spin_unlock(&gpu_vm->list_lock);
> +
> +Due to the additional locking and atomic operations, drivers that *can*
> +avoid accessing the gpu_vm's list outside of the dma_resv lock
> +might want to avoid also this iteration scheme. Particularly if the

Particularly,

> +driver anticipates a large number of list items. For lists where the
> +anticipated number of list items is small, where list iteration doesn't

is this ', where' an or or the reason of being small? but no suggestion
on how to improve this.

> +happen very often or if there is a significant additional cost
> +associated with each iteration, the atomic operation overhead
> +associated with this type of iteration is, most likely, negligible. Note that
> +if this scheme is used, it is necessary to make sure this list
> +iteration is protected by an outer level lock or semaphore, since list
> +items are temporarily pulled off the list while iterating.
> +
> +Please refer to the :ref:`DRM GPUVM locking section
> +<drm_gpuvm_locking>` and its internal
> +:c:func:`get_next_vm_bo_from_list` function.
> +
> +
> +userptr gpu_vmas
> +================
> +
> +A userptr gpu_vma is a gpu_vma that, instead of mapping a buffer object to a
> +GPU virtual address range, directly maps a CPU mm range of anonymous-
> +or file page-cache pages.
> +A very simple approach would be to just pin the pages using
> +pin_user_pages() at bind time and unpin them at unbind time, but this
> +creates a Denial-Of-Service vector since a single user-space process
> +would be able to pin down all of system memory, which is not
> +desirable. (For special use-cases and with proper accounting pinning might
> +still be a desirable feature, though). What we need to do in the
> +general case is to obtain a reference to the desired pages, make sure
> +we are notified using a MMU notifier just before the CPU mm unmaps the
> +pages, dirty them if they are not mapped read-only to the GPU, and
> +then drop the reference.
> +When we are notified by the MMU notifier that CPU mm is about to drop the
> +pages, we need to stop GPU access to the pages by waiting for VM idle
> +in the MMU notifier and make sure that before the next time the GPU
> +tries to access whatever is now present in the CPU mm range, we unmap
> +the old pages from the GPU page tables and repeat the process of
> +obtaining new page references. (See the :ref:`notifier example
> +<Invalidation example>` below). Note that when the core mm decides to
> +laundry pages, we get such an unmap MMU notification and can mark the
> +pages dirty again before the next GPU access. We also get similar MMU
> +notifications for NUMA accounting which the GPU driver doesn't really
> +need to care about, but so far it has proven difficult to exclude
> +certain notifications.

a lot of 'we' in this block as well. I believe it would be better if
impersonal.

> +
> +Using a MMU notifier for device DMA (and other methods) is described in
> +:ref:`the pin_user_pages() documentation <mmu-notifier-registration-case>`.
> +
> +Now the method of obtaining struct page references using
> +get_user_pages() unfortunately can't be used under a dma_resv lock
> +since that would violate the locking order of the dma_resv lock vs the
> +mmap_lock that is grabbed when resolving a CPU pagefault. This means
> +the gpu_vm's list of userptr gpu_vmas needs to be protected by an
> +outer lock, which in our example below is the ``gpu_vm->lock``.
> +
> +The MMU interval seqlock for a userptr gpu_vma is used in the following
> +way:
> +
> +.. code-block:: C
> +
> +   // Exclusive locking mode here is strictly needed only if there are
> +   // invalidated userptr vmas present, to avoid multiple userptr
> +   // revalidations.
> +   down_write(&gpu_vm->lock);
> +   retry:
> +
> +   // Note: mmu_interval_read_begin() blocks until there is no
> +   // invalidation notifier running anymore.
> +   seq = mmu_interval_read_begin(&gpu_vma->userptr_interval);
> +   if (seq != gpu_vma->saved_seq) {
> +           obtain_new_page_pointers(&gpu_vma);
> +           dma_resv_lock(&gpu_vm->resv);
> +           add_gpu_vma_to_revalidate_list(&gpu_vma, &gpu_vm);
> +           dma_resv_unlock(&gpu_vm->resv);
> +           gpu_vma->saved_seq = seq;
> +   }
> +
> +   // The usual revalidation goes here.
> +
> +   // Final userptr sequence validation may not happen before the
> +   // submission dma_fence is added to the gpu_vm's resv, from the POW
> +   // of the MMU invalidation notifier. Hence the
> +   // userptr_notifier_lock that will make them appear atomic.
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   down_read(&gpu_vm->userptr_notifier_lock);
> +   if (mmu_interval_read_retry(&gpu_vma->userptr_interval, gpu_vma->saved_seq)) {
> +          up_read(&gpu_vm->userptr_notifier_lock);
> +          goto retry;
> +   }
> +
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +
> +   for_each_external_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +
> +   dma_resv_unlock_all_resv_locks();
> +   up_read(&gpu_vm->userptr_notifier_lock);
> +   up_write(&gpu_vm->lock);
> +
> +The code between ``mmu_interval_read_begin()`` and the
> +``mmu_interval_read_retry()`` marks the read side critical section of
> +what we call the ``userptr_seqlock``. In reality the gpu_vm's userptr

In reality,

> +gpu_vma list is looped through, and the check is done for *all* of its
> +userptr gpu_vmas, although we only show a single one here.
> +
> +The userptr gpu_vma MMU invalidation notifier might be called from
> +reclaim context and, again to avoid locking order violations, we can't
> +take any dma_resv lock nor the gpu_vm->lock from within it.
> +
> +.. _Invalidation example:
> +.. code-block:: C
> +
> +  bool gpu_vma_userptr_invalidate(userptr_interval, cur_seq)
> +  {
> +          // Make sure the exec function either sees the new sequence
> +          // and backs off or we wait for the dma-fence:
> +
> +          down_write(&gpu_vm->userptr_notifier_lock);
> +          mmu_interval_set_seq(userptr_interval, cur_seq);
> +          up_write(&gpu_vm->userptr_notifier_lock);
> +
> +          // At this point, the exec function can't succeed in
> +          // submitting a new job, because cur_seq is an invalid
> +          // sequence number and will always cause a retry. When all
> +          // invalidation callbacks, the mmu notifier core will flip
> +          // the sequence number to a valid one. However we need to
> +          // stop gpu access to the old pages here.
> +
> +          dma_resv_wait_timeout(&gpu_vm->resv, DMA_RESV_USAGE_BOOKKEEP,
> +                                false, MAX_SCHEDULE_TIMEOUT);
> +          return true;
> +  }
> +
> +When this invalidation notifier returns, the GPU can no longer be
> +accessing the old pages of the userptr gpu_vma and needs to redo the
> +page-binding before a new GPU submission can succeed.
> +
> +Efficient userptr gpu_vma exec_function iteration
> +_________________________________________________
> +
> +If the gpu_vm's list of userptr gpu_vmas becomes large, it's
> +inefficient to iterate through the complete lists of userptrs on each
> +exec function to check whether each userptr gpu_vma's saved
> +sequence number is stale. A solution to this is to put all
> +*invalidated* userptr gpu_vmas on a separate gpu_vm list and
> +only those gpu_vmas on the list are actually checked on each exec
> +function. This list will then lend itself very-well to the spinlock
> +locking scheme that is
> +:ref:`described in the spinlock iteration section <Spinlock iteration>`, since
> +in the mmu notifier, where we add the invalidated gpu_vmas to the
> +list, it's not possible to take any outer locks like the
> +``gpu_vm->lock`` or the ``gpu_vm->resv`` lock. Note that the
> +``gpu_vm->lock`` still needs to be taken while iterating to ensure the list is
> +complete, as also mentioned in that section.
> +
> +If using an invalidated userptr list like this, the retry check in the
> +exec function trivially becomes a check for invalidated list empty.
> +
> +Locking at bind and unbind time
> +===============================
> +
> +At bind time, assuming a GEM object backed gpu_vma, each
> +gpu_vma needs to be associated with a gpu_vm_bo and that
> +gpu_vm_bo in turn needs to be added to the GEM object's
> +gpu_vm_bo list, and possibly to the gpu_vm's external object
> +list. This is referred to as *linking* the gpu_vma, and typically
> +requires that the ``gpu_vm->lock`` and the ``gem_object->gpuva_lock``
> +are held. When unlinking a gpu_vma the same locks should be held,
> +and that ensures that when iterating over ``gpu_vmas`, either under
> +the ``gpu_vm->resv`` or the GEM object's dma_resv, that the gpu_vmas
> +stay alive as long as the lock under which we iterate is not released. For
> +userptr gpu_vmas it's similarly required that during vma destroy, the
> +outer ``gpu_vm->lock`` is held, since otherwise when iterating over
> +the invalidated userptr list as described in the previous section,
> +there is nothing keeping those userptr gpu_vmas alive.
> +
> +Locking for recoverable page-fault page-table updates
> +=====================================================
> +
> +There are two important things we need to ensure with locking for
> +recoverable page-faults:
> +
> +* At the time we return pages back to the system / allocator for
> +  reuse, there should be no remaining GPU mappings and any GPU TLB
> +  must have been flushed.
> +* The unmapping and mapping of a gpu_vma must not race.
> +
> +Since the unmapping (or zapping) of GPU ptes is typically taking place
> +where it is hard or even impossible to take any outer level locks we
> +must either introduce a new lock that is held at both mapping and
> +unmapping time, or look at the locks we do hold at unmapping time and
> +make sure that they are held also at mapping time.

above block is long, but I don't have a suggestion...

> For userptr
> +gpu_vmas, the ``userptr_seqlock`` is held in write mode in the mmu
> +invalidation notifier where zapping happens. Hence, if the

I see very few occurrences of 'zapping' in the code. should we simply
use the unmapping? or is there any other meaning that should deserve
a definition in the terms section?

> +``userptr_seqlock`` as well as the ``gpu_vm->userptr_notifier_lock``
> +is held in read mode during mapping, it will not race with the
> +zapping. For GEM object backed gpu_vmas, zapping will take place under
> +the GEM object's dma_resv and ensuring that the dma_resv is held also
> +when populating the page-tables for any gpu_vma pointing to the GEM
> +object, will similarly ensure we are race-free.
> +
> +If any part of the mapping is performed asynchronously
> +under a dma-fence with these locks released, the zapping will need to
> +wait for that dma-fence to signal under the relevant lock before
> +starting to modify the page-table.
> +
> +Since modifying the
> +page-table structure in a way that frees up page-table memory
> +might also require outer level locks, the zapping of GPU ptes
> +typically focuses only on zeroing page-table or page-directory entries
> +and flushing TLB, whereas freeing of page-table memory is deferred to
> +unbind or rebind time.
> diff --git a/Documentation/gpu/implementation_guidelines.rst b/Documentation/gpu/implementation_guidelines.rst
> index 138e637dcc6b..dbccfa72f1c9 100644
> --- a/Documentation/gpu/implementation_guidelines.rst
> +++ b/Documentation/gpu/implementation_guidelines.rst
> @@ -7,3 +7,4 @@ Misc DRM driver uAPI- and feature implementation guidelines
>  .. toctree::
>  
>     drm-vm-bind-async
> +   drm-vm-bind-locking
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index c29113a0ac30..ceb21219d52e 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -123,10 +123,15 @@ Documentation should include:
>  
>   * O(1) complexity under VM_BIND.
>  
> +The document is now included in the drm documentation :doc:`here </gpu/drm-vm-bind-async>`.
> +
>  Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
>  the second driver supporting VM_BIND+userptr appears. Details to be defined when
>  the time comes.
>  
> +The DRM GPUVM helpers do not yet include the userptr parts, but discussions
> +about implementing them are ongoing.
> +
>  Long running compute: minimal data structure/scaffolding
>  --------------------------------------------------------
>  The generic scheduler code needs to include the handling of endless compute
> -- 
> 2.41.0
> 
