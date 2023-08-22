Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF5784D91
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 01:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517EB10E090;
	Tue, 22 Aug 2023 23:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0064D10E090;
 Tue, 22 Aug 2023 23:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692748780; x=1724284780;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EXrtaIyzMBSZERHa7IbDsI0CZUNlLMmRdv1IUvP//4Q=;
 b=kMfsooFy85tc9pVXYF4bH0UwKz/bQZYBGnX2UqAdTgUxyeg9IvteB1h6
 1tZ9o4aYBI6jLQTSo9i22h2LWzwOFbQ2LjgqBOtsrlTRSeR/HVPOnBeJ+
 aUvDezs9PiIgw+mt9l0VjwmygkJ9wXf2ITvFFhHYcjMteWji8ezG+WX8g
 Dc2i9cLn7oeJYk31qaaYE6mJ1bGA/0pqbI6lpYuqXd6fG3m0qjVieDStO
 eg2KMlu7liYOmUGIbYu8LiG7VPqbiUhyM1st5E7c8MS/vKSWEY9gGZPB/
 2F+vNzMeNjPXnMJNhqWBIEQ/hIUCaIh8rsBe7Tq/s6NgGnjktzFgM9IjG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="373998476"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="373998476"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 16:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="850822705"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="850822705"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2023 16:59:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 16:59:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 16:59:38 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 16:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLlNtNs1UGo0Ck343sfQV4IEIRfBqN7Iojs7O/uBSwJ4VNRvxEteA6AUS3MWf7tYyCuzCnfESxOESGr18tBD0paT1cWD8QMCaHZ0YGtpTp1TAtbmid8qZtR2x+dcqMYWI4GaY5Cr2w98imML49wvTxKxQTCo/0Q8c7GoL8OOvsjp55/M9mPW6Dkwn3fsir5JxWRjwHwPi5hVFDgkeRSqT0/TjgZZ1SNiTcn/Mc1hLUmnXeX4AqJ1KWc1CG5+lUbivt8u7XFBDfLwgUZSaEVkJa+s96jxOOLJQv/oqvSHkQaocAoR7R3M5jG+k96gkbzsdQtgg/Qc9RyCxhREV+a2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRpLrq4bsBzR/uYGSWzWOGHKGC9FNEK4CTKzLNCj1s0=;
 b=QWgoTVLVLPz2boVmp7dXZh81Bz00M3oq0zXAPRsuGAtSM9hTqVjUqSJACRED1dRjGZC9ThN3AZ9Cq54gdNDWmLRA/zhojJRceI//6+SXHXazdRFM3hIGF+3oIPZS491jc0pUZKbQvGvlPJ28d0WQecBARFpn2PVShXIR27N010MWuJFWdGAu5CjnTTsHBt4eHpkXcEqdBycUqLQFUrg4t1TDn6zOrlvhzHgD6xJgYfmg7Px5c12GDlu8cjkqxs1di8EQwtJgviAPYBQWXNciVX2IcinRS7S3buokWov8/ADSNPUdlgVAZbuxnOQULta/B2RU2vJZVTv6WJgrOJBOBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Tue, 22 Aug
 2023 23:59:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 23:59:32 +0000
Date: Tue, 22 Aug 2023 23:58:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe/vm: Implement userptr page pinning
Message-ID: <ZOVLlztGYb/Vd/De@DUT025-TGLU.fm.intel.com>
References: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
 <20230822162136.25895-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230822162136.25895-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0094.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6cd068-35fe-40e4-f944-08dba36bd408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 27Ze2kG+MDn7QJdqlUmtB18kxA+pbd4HPVLjEdiPB5oDNwzQNcgDwcLDBaO+11IExlbhqJgIb6xJH70etPCbKErSb59sTcqLBOyzdIqHdE8aBlC1I2uHNS++J615I+QzjajC9aWQpCkpqQ1J5s/8+B6OQGRwLoTzizfwZl88sv96p4vw4EYjNyD3rNUJSPmtbqFR3OADDB9dCGrHEwBuTK2SRDYf86pE4FsVFpnOLIfR2m4r5wdBrrdJITNvcGejLaYysWfrt3PdcMlf6JoEhxIZD2k2hgAOp5mqSTv5tJ5Z47PXvAqlGKO8/zOB3spYPeIJrqIx4xjg5QP5OcZ7s9d0CLGXlsI5+ar/EnhwnMcXuN2GZU1LTEmzXz2od6lq/svM6tS+UjIhRkAXOC9FCEbwiTlRB0PRD5TFyPB0TmMowzhaNkHz47z8vEWSh4ILgJ+AhWk8DJ29nf50qoClSut02caDM6PapCUN6/SDQreqKTyElJb9YwQ1LSb2l+TSRRDNz1jCaplTuw2lZHNlysplmLxMpwzmH/qcOS56xg72gmKapjL2Jv1tYHkGoV09
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(1800799009)(186009)(451199024)(6666004)(6506007)(6486002)(6512007)(86362001)(4326008)(5660300002)(2906002)(44832011)(38100700002)(82960400001)(54906003)(66946007)(8936002)(8676002)(6916009)(41300700001)(66476007)(316002)(66556008)(478600001)(83380400001)(66574015)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x8orroWZm41Sb3IsfeVuXujkzK1YXaegC4nofyApQaclPouXsZYFB4N5gW?=
 =?iso-8859-1?Q?tijv/jPeRjTUGWV9jOtwnPMkRJ45eozUkliDd7fTbdaPP7IlW36mr5l/81?=
 =?iso-8859-1?Q?s76KSXMHI2AxrduizluZUcxyWJ+IcmaBvSLKhQAD1wR2iKpF2MoFk0I1eT?=
 =?iso-8859-1?Q?MTQ7waI3i7+Jx52tmzu+hWXPoRCoiOO1QBVfH731DClrc/s6zCgYZhCy88?=
 =?iso-8859-1?Q?hOdalXMqHxNdYZ8GUPYNt3+buTT6zkSGLeq+7dY+YaQuHdcau1edTRQm71?=
 =?iso-8859-1?Q?1hUh4M24+0unfC5wH0pnLDWd8c3y9cD9WC0xt353FfAJ9Z+ts8b1lyjVeJ?=
 =?iso-8859-1?Q?nDAJwUBlvXgPkFn1p4ARdwd6yEWGs3cO6n1og857vgnvI4Zm2XB7f8BT4P?=
 =?iso-8859-1?Q?PwQImru1jGimROVTAvNpWYhngqw+D3W5QZxGx2cFQGue4ZkP9o11MCV7Fy?=
 =?iso-8859-1?Q?m86vAW55m6/Cp+/7wGnLfuKZ6TcL3shHXHWe3194N0ZVaqgFWvsS7+V7cP?=
 =?iso-8859-1?Q?BlLDVtboOYtGj9s3NTkJA1yhbdrjA7VyMIIhlzt1ZjmLPwrHh0P21BQAFU?=
 =?iso-8859-1?Q?STQOv3KRawI8t/MsRPiVRJzzPcPSvqwc+Z7tTuYcSJJVYHqAsABjykwc1H?=
 =?iso-8859-1?Q?aLhbTz2CaiwUQ9a+y7ppUrZWcWqBOnk+QxjFGcMheHy4XAF+ijLd9hyi1x?=
 =?iso-8859-1?Q?Jqerl5gY895GdUmG3y910j088+KvFegNJ2rXx+NJlz0uR1OySY5MoF40sj?=
 =?iso-8859-1?Q?U9xwiKaf9Rx7pVYbKSyQxi39J8rFs1Zx2bkvLX1GlOMfp5Yz+sFepu/mtE?=
 =?iso-8859-1?Q?lSJ7oiOt8gCVJ8sT6Sq81WXYD/5WmHdW44CHov/INuBLVwLAQJFOax6Hhi?=
 =?iso-8859-1?Q?DblH1y7VkMfQusYlhHIZ8qRZammmvNOxGyTW4nBMK5NB+DMQnuFNqhRlU9?=
 =?iso-8859-1?Q?LIytpK6eRkA7UU8l9TmVj1jQAYEL/uhCwUYeocTWAO9DSEzHgHmzAFTl67?=
 =?iso-8859-1?Q?18kIaXyOL5OTqk/8tUeJk1uaZxzW108abdeJZ5+ZMp+k/eBpJkBtUBxb8D?=
 =?iso-8859-1?Q?aBmE/HLtCC9SIg5TuTnjgO8FPmoAfaqVlEbxPYaBIk43AZqyo2YKTquF4y?=
 =?iso-8859-1?Q?atUYAppiCdPtbCIC9kolD8uHu+tHB+KRexiIvK676GyoYoegfgJfYn2j3M?=
 =?iso-8859-1?Q?8j5A6ByrO8/X6KZr8See063HjtdiTVeiu3mfisyWyxyU2L3dcBa5iHB5zl?=
 =?iso-8859-1?Q?D1P6BMwDFeP7cq1pYPha6cCyf03rqmjKMx438cu4d2vwcjflNbeyttUr8N?=
 =?iso-8859-1?Q?xMorDXKPClsxJSEygkhl9rxYOA1sPwfqQmMhw0Z1WKkZsIvXtsnMfIOt6S?=
 =?iso-8859-1?Q?3nYrsBrY+/D01RYtsV1dk0sw3mEwQRhvurAe+qULR6ZmN8kuBSVbF5+DOB?=
 =?iso-8859-1?Q?VeOec8FgHPzIWldJomrdKW7JRLIVRRvQpAhltqk5x08ktwmcxJzJ9w5Sgo?=
 =?iso-8859-1?Q?B9f50wqzq8S4BA9QcLZCb8AAOBnhZRSQ5uhoLuu1PNR1njHZwbFA7YYoGh?=
 =?iso-8859-1?Q?KUDElSmw3HaJ4yuFyUCV3RFmeEY8RUvvlxsMGTsuh7mRUpT/oLY2xbaypT?=
 =?iso-8859-1?Q?fNeygYrpqpCQAc6/YEVZeGOnrfRqwtzQgSWWbruMJuZZBjR7V9wJHCsg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6cd068-35fe-40e4-f944-08dba36bd408
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:59:31.8761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UprECtp8YyOkV5UFITVWsyfl3GgE6pA/EbYJ8yjgib5TfOPX7il+w0OprpgY+lBb5pdlqlLQN6sH6SbRenR2ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 06:21:34PM +0200, Thomas Hellström wrote:
> Implement pinning of userptrs between VM_BIND and VM_UNBIND, which will
> facilitate avoiding long hangs on non-preemptible workloads. But don't
> hook it up to userspace just yet.
> 
> v2:
> - Avoid marking userptr VMAs as invalid in the mmu invalidation notifier.
>   (Matthew Brost)
> - Add an WARN that we don't try to repin userptr pages (Matthew Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 80 +++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_vm.h       |  9 ++++
>  drivers/gpu/drm/xe/xe_vm_types.h | 12 +++++
>  3 files changed, 79 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8bf7f62e6548..037ac42f74a5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -74,10 +74,6 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	if (notifier_seq == vma->userptr.notifier_seq)
>  		return 0;
>  
> -	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
> -	if (!pages)
> -		return -ENOMEM;
> -
>  	if (vma->userptr.sg) {
>  		dma_unmap_sgtable(xe->drm.dev,
>  				  vma->userptr.sg,
> @@ -87,6 +83,18 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  		vma->userptr.sg = NULL;
>  	}
>  
> +	/* TODO: Convert to xe_assert() */
> +	if (XE_WARN_ON(vma->userptr.pinned_pages)) {
> +		unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
> +					    vma->userptr.num_pinned,
> +					    !read_only);
> +		pages = vma->userptr.pinned_pages;
> +	} else {
> +		pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
> +		if (!pages)
> +			return -ENOMEM;
> +	}
> +
>  	pinned = ret = 0;
>  	if (in_kthread) {
>  		if (!mmget_not_zero(vma->userptr.notifier.mm)) {
> @@ -97,11 +105,18 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	}
>  
>  	while (pinned < num_pages) {
> -		ret = get_user_pages_fast(xe_vma_userptr(vma) +
> -					  pinned * PAGE_SIZE,
> -					  num_pages - pinned,
> -					  read_only ? 0 : FOLL_WRITE,
> -					  &pages[pinned]);
> +		if (xe_vma_is_pinned(vma))
> +			ret = pin_user_pages_fast(xe_vma_userptr(vma) +
> +						  pinned * PAGE_SIZE,
> +						  num_pages - pinned,
> +						  read_only ? 0 : FOLL_WRITE,
> +						  &pages[pinned]);
> +		else
> +			ret = get_user_pages_fast(xe_vma_userptr(vma) +
> +						  pinned * PAGE_SIZE,
> +						  num_pages - pinned,
> +						  read_only ? 0 : FOLL_WRITE,
> +						  &pages[pinned]);
>  		if (ret < 0) {
>  			if (in_kthread)
>  				ret = 0;
> @@ -137,19 +152,24 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	if (ret)
>  		goto out_free_sg;
>  
> -	for (i = 0; i < pinned; ++i) {
> -		if (!read_only) {
> -			lock_page(pages[i]);
> -			set_page_dirty(pages[i]);
> -			unlock_page(pages[i]);
> +	if (!xe_vma_is_pinned(vma)) {
> +		for (i = 0; i < pinned; ++i) {
> +			if (!read_only) {
> +				lock_page(pages[i]);
> +				set_page_dirty(pages[i]);
> +				unlock_page(pages[i]);
> +			}
> +
> +			mark_page_accessed(pages[i]);
>  		}
>  
> -		mark_page_accessed(pages[i]);
> +		release_pages(pages, pinned);
> +		kvfree(pages);
> +	} else {
> +		vma->userptr.pinned_pages = pages;
> +		vma->userptr.num_pinned = pinned;
>  	}
>  
> -	release_pages(pages, pinned);
> -	kvfree(pages);
> -
>  	vma->userptr.notifier_seq = notifier_seq;
>  	if (xe_vma_userptr_check_repin(vma) == -EAGAIN)
>  		goto retry;
> @@ -160,9 +180,14 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	sg_free_table(vma->userptr.sg);
>  	vma->userptr.sg = NULL;
>  out_release_pages:
> -	release_pages(pages, pinned);
> +	if (!xe_vma_is_pinned(vma))
> +		release_pages(pages, pinned);
> +	else
> +		unpin_user_pages(pages, pinned);
> +	vma->userptr.num_pinned = 0;
>  mm_closed:
>  	kvfree(pages);
> +	vma->userptr.pinned_pages = NULL;
>  	return ret;
>  }
>  
> @@ -718,6 +743,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  		return false;
>  
>  	down_write(&vm->userptr.notifier_lock);
> +	if (xe_vma_is_pinned(vma)) {
> +		up_write(&vm->userptr.notifier_lock);
> +		return true;
> +	}
> +
>  	mmu_interval_set_seq(mni, cur_seq);
>  
>  	/* No need to stop gpu access if the userptr is not yet bound. */
> @@ -976,10 +1006,16 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  			vma->userptr.sg = NULL;
>  		}
>  
> +		if (vma->userptr.pinned_pages) {
> +			unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
> +						    vma->userptr.num_pinned,
> +						    !read_only);
> +			kvfree(vma->userptr.pinned_pages);
> +		}
> +
>  		/*
> -		 * Since userptr pages are not pinned, we can't remove
> -		 * the notifer until we're sure the GPU is not accessing
> -		 * them anymore
> +		 * We can't remove the notifer until we're sure the GPU is
> +		 * not accessing the pages anymore
>  		 */
>  		mmu_interval_notifier_remove(&vma->userptr.notifier);
>  		xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6de6e3edb24a..913544d7d995 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -139,6 +139,15 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
>  }
>  
> +/**
> + * xe_vma_is_pinned() - User has requested the backing store of this vma
> + * to be pinned.
> + */
> +static inline bool xe_vma_is_pinned(struct xe_vma *vma)
> +{
> +	return xe_vma_is_userptr(vma) && (vma->gpuva.flags & XE_VMA_PINNED);
> +}
> +
>  #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
>  
>  u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3681a5ff588b..9b90e649cd69 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -33,6 +33,8 @@ struct xe_vm;
>  #define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
>  #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
>  #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
> +/* User requested backing store to be pinned */
> +#define XE_VMA_PINNED           (DRM_GPUVA_USERBITS << 8)
>  
>  /** struct xe_userptr - User pointer */
>  struct xe_userptr {
> @@ -54,6 +56,16 @@ struct xe_userptr {
>  	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
>  	 */
>  	bool initial_bind;
> +	/**
> +	 * @pinned_pages: List of pinned pages if xe_vma_pinned(),
> +	 * NULL otherwise. protected by the vm lock.
> +	 */
> +	struct page **pinned_pages;
> +	/**
> +	 * @num_pinned: Number of pointers to pinned pages in @pinned_pages.
> +	 * protected by the vm lock.
> +	 */
> +	unsigned long num_pinned;
>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>  	u32 divisor;
>  #endif
> -- 
> 2.41.0
> 
