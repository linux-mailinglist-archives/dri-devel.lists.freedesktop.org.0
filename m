Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3E6F4672
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EB110E55F;
	Tue,  2 May 2023 14:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B4A10E33C;
 Tue,  2 May 2023 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683039343; x=1714575343;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GbLxtbPc1EXN3YtmRqP7CINjYcou3J2bdqr48+dMgoI=;
 b=R4Cya8SzPefEJwabdyYfmXImvYJO2gn4aH1rF3VyO6yT2XouqrPybbdD
 sbq6GLjwlzoiWFqxRa3ZEFPcoO+qArLu45ql8IsHvKbpUJgJ9FRfgdS52
 GgFRea7k8+UF8oajdT2Fw47Y1j2h0lm7+tajjMtIuATxi/n0jrx60VQKC
 csLMwLOGSRofSJu2zGHrrEXJX/N9jrDLRgRdYQb5+8QkPqIWPkgFeTzIJ
 O3m/gSQ204Pbtmg02pM5S/D7D8ZY+H0OXsqzveCfDBJCDRE6EPWvNEWGe
 k2pW62sTSqEwJQo3N++8Dbwd9xCi1fImm8OGFqgEQiOM4TlO/Nv8hcXW0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="328051582"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="328051582"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 07:55:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="870579031"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="870579031"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 02 May 2023 07:55:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 07:55:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 07:55:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 07:55:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=do0LWL9lvdv5SmJLjbDX+ofjh8CQD0XpxEbm2sfHjJFeUDuFDU3zlV7c3RjCNLtBQD4PR5GDBaGXwh9k14oJhp74hP2EZdWPgpm1KWanJlZZscIodFBqoH63bpd8MWvblLTSiijuHm/YHB9fDfePcvVrWt02tnnqpGvA/KVlH/+EJBeuZrJ/awKX8Ch0WzdxahYcwoB+GA5oOVYFcqvlEuKUdijerGuhidhwFiBIoyP6N87rONezH0MEZ59rBbFWn7cqeZA2aNqQMTPfDZ9mBgRy5nwIvWucEEtjMBh4HNLRDrHxwacLHmBL1+HXn2O7bTqRmIjQiA+eGNu6Q9Nt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCJUNtX5x63iizl9lgiPACNjRJj92epMFhhPM0xPkec=;
 b=jimh/JIdaKi+nHMVIs8HVqY7uEMlQoQ4iRs7J+9xFK/+9Ka9M1B8lMawPXFPeocKjNkhGs7o4DAtzNN7g11tVnFfrj+CVMi3wfowTSYcXrJ9yauI8wzA8Iq24KS7rjLRu/14caDQVYvmBlXc+L61PgCdxFySk7jXu6inOD1fgXJQ4vSCWxy5R3XNgYIHb16Ftz8CvUKS1P1wc13+UX2aqTOqKB4+mzIJZeqReKRtxcd8C1lGj/YsXRy0kNqa4obRHJ3WQaMAzgq6bMk5d2Java6RzdeFeeO5t7ZpYcVbzw7haPaFXZr+IJAJEW+Z0ib2zITZdFpli3PzgbnRJpxfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8041.namprd11.prod.outlook.com (2603:10b6:806:2ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 14:55:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 14:55:35 +0000
Date: Tue, 2 May 2023 14:55:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 06/14] drm/xe: Add GuC CT snapshot to xe_devcoredump.
Message-ID: <ZFEkVsRkpnUVUGoQ@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-7-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: e77ab6ed-9a38-49f2-c9e0-08db4b1d487f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lb6luvGVQosJRLBTR3+ZRIwe766cHBw5IOKDU4KSjUQoUShxvKYbTVt+oS+x12pUUfWYRFY+jYlSYi5HtldxSmh9QBQujWlj/PhKy4g9e/RJJ8vtC2sj7a2hMhHFbUgwKrZScLKpLOZde1W9ZcPBOvq4uZrMyneCo2Z/IsisbLk8Fq/Lmc326vYDbhFNbbu1STwTfAErdf6sgJ75JCnojamBqQ7Ubz9szLgG+LKAKJ4dMlBd07VFPHlUYYseQ3EuYPZP0JXYFd4V+E8CD0mfcpnhKdsb8bvjsEK2zs9X4o9DyQhVB0d60G47AFZkZewrOzm7uSGiX3sPuQaBI/93JkzPOrzXe7eRGhdiNcWfL/bA9Va6zSAHs9cq3dWjpKrUWfztl9Ueq26NAwq8AssYaZA9eWErxd23Aj0WChv3TfmTHSLPriCTaq6qDiV2UKQpgy1VF1RQONDjKl3yvQgH1ZQo35KWb4hi/eKyQoLjfKpz/N0CjaegmqtTCXDJ9j76AXnIJSlnzKgvk47W9xGrliIHhDyoZvRNfrH+WQAZgLz8n8kVfb6JXMdco8imXSAH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(316002)(478600001)(6486002)(6666004)(450100002)(41300700001)(6862004)(8936002)(8676002)(44832011)(6636002)(5660300002)(66946007)(4326008)(66556008)(66476007)(6506007)(6512007)(2906002)(186003)(82960400001)(83380400001)(26005)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ST5Tu4p0T546J15qGbfrLvjZgax/aaWN9M4VUNCClyytQDTY6VBSyIeySyjO?=
 =?us-ascii?Q?DG5pR6rbX1UAEoLuD8OFp3EQf4X6ge0W02Fie1OIi6LkHl9xb6jkHkBWYOZq?=
 =?us-ascii?Q?bTV+mQoLrNmF/tTUHxbrArhjr+8RMXMU3m6aq0cjwMP6ns3nCkIsHM2b4dfr?=
 =?us-ascii?Q?fKXTb+QX3TO/WwcZdD4DDye+zRL7u68dgeak4Zfd9zdHRaQrtmFLqIhWKzZx?=
 =?us-ascii?Q?QGUnZM17zL/ulejTVJNSOoi7cm4KPOMSqCtNOiSJ4/3y5cp0maj52UFSmX9L?=
 =?us-ascii?Q?1JblN7Jc6FuIUyjIEaVtNFWSXf1tuEe/JOTEZYdwslqDx7lz/zTrLuCn92cX?=
 =?us-ascii?Q?ZjOGzpu8zHldeXDjgxZdj/LTc9ZHeN98JopbZc32EtPUwhwYI35eDexs+WMQ?=
 =?us-ascii?Q?Z0lOgXnk0Bs3Vkkg6hZUoYtolcOXAUc61N0PdMUmhcnwdKLXz0qK6j8fahr/?=
 =?us-ascii?Q?NuJqA6SLbhySjrUj4Thf0V/dXCHGuXeQa2e1JXHp8MFFSg6ae2uO5ezAGNIm?=
 =?us-ascii?Q?Df9J2GaSztet19l0WmS779F/6xUy6iKsDbUdhMDBseLQqtH426bcvGP+dPmT?=
 =?us-ascii?Q?uwaZOyZ4qVgOw5MGCyd6Sly+HAFKKB18dZSvtJZnmKiPRMaVV8Ll2PG7RwVt?=
 =?us-ascii?Q?WLmuVwG+N8IVm8plsCVxc55/g1m5SsUh2rNQteQbfnwscfh/Xb+FttJdZeSs?=
 =?us-ascii?Q?yp/B1g8+gaVdeGRlV2QL+SkFWPW6ZJ2Ng8y40mTYlHYDNPTykaSfFO1VVR4M?=
 =?us-ascii?Q?1W2N24QUEsaGdayIMd1ECSRakvxC8ZIyKWDfFCSoTODheWICPxbR1YVnOlAS?=
 =?us-ascii?Q?mv63t0Rrxkb2ckWS82LOVD+gtOaqFVIZVdBvUoSZTvevlAQIneb/yQx/g4Oa?=
 =?us-ascii?Q?hxrak3yaLYIJgkZ9lljjBjGsXa7R9Lwdc82R1NOPvgF1s8cKKMl2lu64hPVG?=
 =?us-ascii?Q?CwkLvne0wUId0Y/mmgrSniKuoGDCUUkfHZQi/EuQTrNaCMvkSJPJYkCA1dvp?=
 =?us-ascii?Q?/T1tOajv5fYCf9riZnUUupFTnvZafpLm47rZ8MIGw95lbmWNH2u0CkkvTOkF?=
 =?us-ascii?Q?LIQA+iYbMbImrP+RJIvsW7vdm+VZU00Ehzw0rIdvflFWInQcmnnNXD0vicu/?=
 =?us-ascii?Q?uGG1D4pvEzqWvsBMrRc+eICtMvvLSkzNjy49Q1BtnhD73fg5MwBuFdD7DW9O?=
 =?us-ascii?Q?5v8twO3n8G/ICDbROPNusvZYzf2cgGaoKDCYLhMibWZY6mSfSGXqpYXABvKn?=
 =?us-ascii?Q?gq/iKCS05fPXCA72/fkgVtOUkteVLQthZznjRiEw+NmYiCYAULnB3Sx6c6eI?=
 =?us-ascii?Q?qbs/aKwIXdvxS1mbjQGtYlbW7QJ0v0WKBz05kb/la+mRIPYEnEOYbPG5A27j?=
 =?us-ascii?Q?Q4bGf8GFuMtBm1NxD5sBFRDnm7CiDRjZiLJZkk9OhURiGE5WJMdWKW3hsQue?=
 =?us-ascii?Q?bFLhVXHjkoMMBCf8jrD3928y2TngROstg05I3dPXf2hoKTHm9WngVINXH2Yx?=
 =?us-ascii?Q?eyR/wnAF5DQiJn2tcji8IJIBIaEDoAhW1PdBzCEQ9gIde4SBPKijEJmnjk1V?=
 =?us-ascii?Q?iBQSILB0EyZOYFMPB9FQliUj+yDnWTXKFQRVctEEsjl4RABoEwzxqW+DrTNz?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e77ab6ed-9a38-49f2-c9e0-08db4b1d487f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 14:55:34.7748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDw1bpaqhMAXwfhDY37yMBd5t3Ginv77LDBrPu1Vj5MlsqR39mJ5sV2cn1Ql3361e1eL1im31o++0HWRha2q3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8041
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:05PM -0400, Rodrigo Vivi wrote:
> Let's start to move our existent logs to devcoredump one by
> one. Any format change should come on follow-up work.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index a08929c01b75..795581c58d90 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -11,6 +11,7 @@
>  
>  #include "xe_engine.h"
>  #include "xe_gt.h"
> +#include "xe_guc_ct.h"
>  
>  /**
>   * DOC: Xe device coredump
> @@ -47,6 +48,11 @@ static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
>  	return container_of(coredump, struct xe_device, devcoredump);
>  }
>  
> +static struct xe_guc *engine_to_guc(struct xe_engine *e)
> +{
> +	return &e->gt->uc.guc;
> +}
> +
>  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
> @@ -81,6 +87,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
>  	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>  
> +	drm_printf(&p, "\n**** GuC CT ****\n");
> +	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
> +
>  	mutex_unlock(&coredump->lock);
>  
>  	return count - iter.remain;
> @@ -96,6 +105,8 @@ static void xe_devcoredump_free(void *data)
>  
>  	mutex_lock(&coredump->lock);
>  
> +	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
> +
>  	coredump->faulty_engine = NULL;
>  	drm_info(&coredump_to_xe(coredump)->drm,
>  		 "Xe device coredump has been deleted.\n");
> @@ -106,10 +117,13 @@ static void xe_devcoredump_free(void *data)
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump)
>  {
>  	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> +	struct xe_guc *guc = engine_to_guc(coredump->faulty_engine);
>  
>  	lockdep_assert_held(&coredump->lock);
>  	ss->snapshot_time = ktime_get_real();
>  	ss->boot_time = ktime_get_boottime();
> +
> +	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 3f395fa9104e..1e44d5346364 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -23,6 +23,10 @@ struct xe_devcoredump_snapshot {
>  	ktime_t snapshot_time;
>  	/** @boot_time:  Relative boot time so the uptime can be calculated. */
>  	ktime_t boot_time;
> +
> +	/* GuC snapshots */
> +	/** @ct_snapshot: GuC CT snapshot */
> +	struct xe_guc_ct_snapshot *ct;
>  };
>  
>  /**
> -- 
> 2.39.2
> 
