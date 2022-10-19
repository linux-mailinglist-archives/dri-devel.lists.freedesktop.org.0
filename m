Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DA604F9A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 20:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CE710E3B4;
	Wed, 19 Oct 2022 18:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3858810E3B4;
 Wed, 19 Oct 2022 18:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666204148; x=1697740148;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8A3Xmw+zkirZM3LZdmctpALbCUD3+U8bCATuZkNSA+E=;
 b=D/WqpE39nvacP/dTAIFucYZjobMT2lH2GGu78A5YMI3Vl8Ir6n+mqPQf
 TldfP/WioY6VofFTZg+TnLxk9+Z6QuA929EqDW9SsQZXivG4vnJA67O5B
 irtZyH9wOE3B3Olwxgdrj1iYNFjyVkJMumD8SCL3pcL3U/Ng3m8/d5pS/
 ACuNE9kNbRUYDDjzK/ImLaA6BAVtyrMU+QBrWzpTRUUEMkWGKDgin0tBg
 whvMji+KNRc74gqUDq0behis7JOki8QaKhkZKvobDmcm5Yn3Xwk4Hc5JT
 fCcpSS+JdVYLrwqJCGgZv3TIPn6unKiPTFgcI84Hj5AB/i5sqRxq+dVlv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306489167"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="306489167"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 11:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="629385348"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="629385348"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 19 Oct 2022 11:29:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 11:29:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 11:29:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 11:29:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 11:29:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MX49UQ/NfkAlGhRO/n7yQSUM77W7y/zL7D/DsjFCgqVSVF35GyQ14fXfHHE4GcmY/rilF10Yjx97h1eYl2VH0RU/gyXCbDBd161edklXQ0oI3y7ZLxEx1gA6ojwjd7F9Op/1Qx/5bYjExHam3lCU4z1WGusUOC1n8F2lhJ62su/56WafDRZPq0kXY/T1hxxe11QMlgWKH+Fddw+zT8N5XRe401ysNALsGzpZwCWgvcZM10emX8DJ7jwElYJYHACxREtdFMO0cMCA2o9OQ99+hBxvw5v8U6Y8XTzUVOddVa0q4dcWtu8rrdng05aU4AKLpoZHyNlo+Zd2csMYZqhJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6t95w9DjXbfGRPgtT/Md5WKRughZGar6lWzAStvPnM=;
 b=NR4Tg0uRu62voxo21mcqbDQWTFYvvbPNzZzVxEBJ0wR1ylV/2J4qu4GlMgS4WsguemGDgA1lnRXBGdWNj8GZsCmoYILCY3UOMBjkmdROCVdbHsSW8XawwxzNz0kt3XgXTqcDMhlOao9x+LQy8t66NzK3CwdzqiyGwS6lrqI7JubFBPHjcn7yg+ExPLmo3HnA1QLYUT1rDHfUX2eqjH+m06mCb4wwcD6sMEX6HltOp2R9uee7NF9p/JQpxmBdXf4yQPTSlxRagBs/l1o31T2xryEJ45yf77dMTIAWegDQdfxrd2/2kBlTN6xeSQMU1BIotA44sotOjFApJebw0qDKYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 18:29:03 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 18:29:03 +0000
Date: Wed, 19 Oct 2022 11:28:54 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 13/17] drm/i915/vm_bind: Update
 i915_vma_verify_bind_complete()
Message-ID: <Y1BB5vMCMCKgi2Ar@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-14-niranjana.vishwanathapura@intel.com>
 <33e7d512-c78d-dfff-0bcd-0cdf94af384a@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <33e7d512-c78d-dfff-0bcd-0cdf94af384a@intel.com>
X-ClientProxiedBy: BYAPR07CA0077.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::18) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a8309e-4863-425c-025f-08dab1ffcc7b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FQnU/EPxAh1HsK3Uo21WO3G+IEIFK6dGBBgW9Tel3CMLFWD1DwcY/D57P/8IReFBWvb+nIocCy2N/7v+AWRSW5jW90aUgUoluW/Cqi/6znn4OldD58eFvg2d2lVF/DCC8dxxnG90pAOVmh+khAm3YlylsYLfC5gBY71egKgtaHAp1MqLk7XnUV620z71b0b8Mi7zfAEImmQJBLAxXIdk36bEk4VK0ezadM+BCJmf7raGcIOqFub1kYFJzMkZPmOCrrIQ3ZzibeUX86TdnvZlioisbS9BSM54PIQID682MZiR6Tqr2acNf/3oEpHGxExc3s2Cj2MkJCXH04inVh7sD59wVrzkbdegxFIMMEyxuCyWFpTddAtxAIiNeSs4g2LuOF0T/8F02by19BJxs5GtsjPguqZwWXfcvwYpKHivomT3Ztc116pLxZvwZK9I0IJv6wb9lJwK6ZgJjp+IyTjfeLsumXkiLnEnduxTC3NOZ/EgtCfBqhFmHCsAi7UJLhO1i2R5zkDO/PhNqZjPAJfADqk48BcrFCy1qutQnwMQhnGN+GtvEPzp6k/gF/59BMtCoU2W6fCqocSwBzLHKQczUwxEu8Rwcw0DUtknrTEUfEluX8s+KlXsCjQjQ+T7RZSd6gSCbcAGm7UOSmGCZs72pFmLTfjN1QW0sJW3UPv/3712ysdEJqNknmIhP2C6VhWBAS3TSrl7A23PhiStsH5iqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199015)(186003)(2906002)(9686003)(6506007)(316002)(6512007)(86362001)(26005)(5660300002)(6636002)(38100700002)(6666004)(41300700001)(82960400001)(66946007)(8676002)(66556008)(66476007)(83380400001)(4326008)(8936002)(33716001)(478600001)(6862004)(44832011)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?de/MH0Dfm73s7amefKE0Qs7UiGiucO3zzIuaZaceGUqEf/C5wARNmvubQE0U?=
 =?us-ascii?Q?R/3CXE/qyMgvkRBxMjd1MG8t2UTo52HsYZChDKGZ2LBdi9Waqnav2ITuvt+l?=
 =?us-ascii?Q?mYQ9NaKufdYznAvzqhApxR0ja1iTRGQFk47vq81rWtBP5DLohRpB9e2gYy7+?=
 =?us-ascii?Q?kZAGa7ZYXXbBDBMarTSpXUnECn3FqtIQh0pKwlVDF1sF5dKkaaP3kGzD9djr?=
 =?us-ascii?Q?SqIfh8MgVAVLtJDR9eMcXoWfeYo4IzrS8sAabaoBYMxe4PWuNd3d41NktJO2?=
 =?us-ascii?Q?Jn1zgCYh8y7pltCe89nEZgvyN4SaBJP6ID6Igdiq25jMc4ipufFGC9l+Lw5W?=
 =?us-ascii?Q?8DF6T8/6PCsu9xx89ZDugswxCUU+3YvtQ9UtvaMRpW3pvWnLRx9wQQn4oZa0?=
 =?us-ascii?Q?cC5TPArDOjyZdt3arJc0LmUMMNCkOdpGIIr/MKSjs3aDSYAWsNR3N1suy9zG?=
 =?us-ascii?Q?X5uR/adjK5lMuUDi+zGMdiaNzsPintyqHxd7eRX8PUguHnBj5B19qQSLpK9N?=
 =?us-ascii?Q?LVem5jQSpS+VgUZbeq8Z2ehFWqbNDamwfoQ/QVUPIb7vENm2hl0yKxOG92Zi?=
 =?us-ascii?Q?AcC+WL5OrJ1DKkQ8vZ6YQ4T/2nys/p/vYPlvKYm5mPnkN+eWfUA2zqHGHwWp?=
 =?us-ascii?Q?4eb8rqyEPueEHnOLeBrOb6sEIRmW72SY0iWDMG+Rhnn7VHBxgBcOl+fRzxJK?=
 =?us-ascii?Q?tM/OWQ8Lh/4tEbrHkf8F48bfvSDbHCT304EIJKdk5zBxC6NsfFpfBLl3iNLW?=
 =?us-ascii?Q?IJ7UXdlMflQ0D7h3bIa67UcIAuPl1sceaMsc48XZTGmk7fOa8IxAP3RDuRlf?=
 =?us-ascii?Q?/jrWcVqLPensUVpbELOb/ySp5SYNREpZfVk2emVUW9YVBKK5WQdaG8VFESDs?=
 =?us-ascii?Q?r0H4CCvNo3o9MJmDoB7zV6kqka6ghhXONsPE4mVE+aFWDDi9jWq0jlkp+fMo?=
 =?us-ascii?Q?+6tsoyTTjO3mf6+zJA1QkckVNLQ7z3cqFEu5sikz4afA9nPbBwntydOw/ziq?=
 =?us-ascii?Q?WkIh1hE4L9wBDfryYSEFeg+W+cUJN9eULt3KVtKh70QHITuDUEm597N2sWZx?=
 =?us-ascii?Q?a5xiN2z3K5ANMaywGb1+1cydc7ip0xQ+1gi9s6mKbXZIbs4Wi+/H737BBg+5?=
 =?us-ascii?Q?FNLfHvSb4LYammguAF0y/gjT0/rQL/ZoZoZo3+pbVHBNDOtzGoGyisERLcXs?=
 =?us-ascii?Q?lAHaMNTPHqW6DAbc2bBQy30R9VX6P/DeN37grEc1MG0uRQm0vOLH/3mqljCL?=
 =?us-ascii?Q?un7vehqvuORDeDiZ9QiKnYgVv42jN1aQjb9LJ3eVmT/1+Ik0wsj5K4E7M1N9?=
 =?us-ascii?Q?kToM4NCu0lLdykYggG0sQieblsH/paP7O8ZG7su8ztLe5234lzt93Qmk5YVD?=
 =?us-ascii?Q?HA1Z8XJ+bwHJ7luyh93GpAYyNwgI55CqIxirO7dku6Ys+B+foVpNrf2+7m4q?=
 =?us-ascii?Q?uOSR+Y8/7OWTHV5ddqsYKJfJf+DsFX0HEyE3LGBZJzkurDdJBohgaUVVi1UJ?=
 =?us-ascii?Q?C9rpBxRHxPVVXVsfx4RsLc27Q8EyVE+hb8CyYOyyjo/DhclLwBFFB5QVyAEO?=
 =?us-ascii?Q?SP5RbpuJnnen525Di1rVsq3GqdxZLujD5gILmPWoZ2OdQAjre4h1Upj8tTuf?=
 =?us-ascii?Q?XUtwRVq3XC9BSYND0xMRYhc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a8309e-4863-425c-025f-08dab1ffcc7b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 18:29:03.2674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRlyuPimgz3te5l8QC7SvptrY2+nDqgy3u1xeHRiPgpp9ENaVOKPRkBZGQZt1IG/+dm6/ounQePoldpGpA7n3y/VtKLwam+Y1NJLszWKAu6MYBsiaMZmR8fZbCb0n7vO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 05:07:31PM +0100, Matthew Auld wrote:
>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>Ensure i915_vma_verify_bind_complete() handles case where bind
>>is not initiated. Also make it non static, add documentation
>>and move it out of CONFIG_DRM_I915_DEBUG_GEM.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/i915_vma.c | 16 +++++++++++-----
>>  drivers/gpu/drm/i915/i915_vma.h |  1 +
>>  2 files changed, 12 insertions(+), 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index eaa13e9ba966..4975fc662c86 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>@@ -439,12 +439,21 @@ int i915_vma_sync(struct i915_vma *vma)
>>  	return i915_vm_sync(vma->vm);
>>  }
>>-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>>-static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>+/**
>>+ * i915_vma_verify_bind_complete() - Check for the bind completion of the vma
>>+ * @vma: vma to check for bind completion
>
>Maybe mention the locking since this is now more than just DEBUG_GEM 
>stuff. I assume we need the object lock or otherwise some guarantee 
>that the vma is pinned?
>
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

I think they are not needed. The fence reference is obtained under rcu
lock anyhow (will add this to documentation). Only thing required is
that vma is not released, but that caller must ensure for all i915_vma
apis anyhow.

Thanks,
Niranjana

>>+ *
>>+ * Returns: 0 if the vma bind is completed. Error code otherwise.
>>+ */
>>+int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>  {
>>  	struct dma_fence *fence = i915_active_fence_get(&vma->active.excl);
>>  	int err;
>>+	/* Ensure vma bind is initiated */
>>+	if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
>>+		return -EINVAL;
>>+
>>  	if (!fence)
>>  		return 0;
>>@@ -457,9 +466,6 @@ static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>  	return err;
>>  }
>>-#else
>>-#define i915_vma_verify_bind_complete(_vma) 0
>>-#endif
>>  I915_SELFTEST_EXPORT void
>>  i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
>>diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>>index 1cadbf8fdedf..04770f8ba815 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>@@ -440,6 +440,7 @@ void i915_vma_make_purgeable(struct i915_vma *vma);
>>  int i915_vma_wait_for_bind(struct i915_vma *vma);
>>  int i915_vma_sync(struct i915_vma *vma);
>>+int i915_vma_verify_bind_complete(struct i915_vma *vma);
>>  /**
>>   * i915_vma_get_current_resource - Get the current resource of the vma
