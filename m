Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95A604F53
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 20:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D240110E8B1;
	Wed, 19 Oct 2022 18:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AC810E36A;
 Wed, 19 Oct 2022 18:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666202704; x=1697738704;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sAX4ZfWwii6zL6rXzrIahm5eXMEiCyr5umqT1hVT09s=;
 b=WwNLzHImmUDkANZ3eYXW7d0m8eY16l7u8vya7+p9GeU0U++cef42mxxR
 wAbL8B52CTsk4yiLwAxrdypk2H7PPEiSMMUKOIwOQcB8ai2oFZO8uQNBO
 ywYjoHweh9w9Pbbyf97zHXdT99SPYXJOsrFeF08oM1Tz/bBjtXKOxzEeI
 UrORxskkc2t3i9g5IsM5HFOgLYDwm2T81JPyhBdb5PC38Tw+vPB9kOQM7
 oquxSv+7aM3bhZIF0i/gWqqIESs2ZZAuWE7FaiguqJjHAbOdkATJoSoPT
 znTkkISJ71pEXDFDWpiqmUEqkYXnGxsiWhMN+G4QyvDM9ajNsK5HWXXk3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="304106806"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="304106806"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 11:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="662589315"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="662589315"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 19 Oct 2022 11:05:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 11:05:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 11:05:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 11:05:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 11:05:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQBzPAY69i5XUJoSCvGUIQOg4sKk3TqEBTJ6wTNU0n1ABB4q4m5JUVX8ABoXUowbShb8ci+5PAV4jPv4w/gzwgzDtQjUiOIQj4vhS3m2iUMyN+085tgSdmsvWnzi6WEfy/7IEdPCZAzKnAP3mqHpuExWFwn32skkXesdgz0izy6g1EL4EqspjuRSRiE3p+sTLkiN5GO9RY2SD3NlVl+tOIGth4V7j3lKspDRlHsINSHGpUfepP/7WatUpMO3wFQD4Pa0W6MByh/bAwYE3wzjuteU1OEt7buH2CY+D7Tt4DIiSyjsdV0YZCXBgEEFqZsFIzDPyQr45K/nEBd1/tznWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCFv5dfHnl2Mcd89OS632xU43cJkVHaEuet13zKDLcw=;
 b=XBXKvlG9ooc2NX8y8cskbXhALxGoq0abPvxL/zyjinw4M/ZF7hlCkwOyukx7A7suHu4hZakTmHmIVgsgfHwyUyHv+E1PIhJolQWfoAwtTdTuBYLC8p2fNz2XYcUqMvhiZdVjwPQ9sXekLWxC+Cmqu527Mktuz8UzW2VKZk07o2BoL/Zx7eMAAWgybfGdwLxZumkwy2rf6wEw3/i4MkEEtBqMQ7ZdpxtuWixFJLrdh7XPtWqX+6+YzJhUZ9OyWZqZFLyehcSeE/f0chffp/NYK5xr9HfourLI7BNiuEWx/qtq9ib9d9aSZIAOoRJLLU8xDc3v6ZRpNCP7WMfpYunR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL3PR11MB5697.namprd11.prod.outlook.com (2603:10b6:208:33c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 18:04:58 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 18:04:58 +0000
Date: Wed, 19 Oct 2022 11:04:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 14/17] drm/i915/vm_bind: Expose
 i915_request_await_bind()
Message-ID: <Y1A8Q581jzPbbfs8@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-15-niranjana.vishwanathapura@intel.com>
 <5b8f3280-908d-df3d-e237-9de294326621@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <5b8f3280-908d-df3d-e237-9de294326621@intel.com>
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL3PR11MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: a402d717-c3e2-4ad3-26cf-08dab1fc6f5a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4Xr8+/TjKLspuvtg/9Iv6Bx0qbSBazHxKUwsfTv/JPNwhNXs6DW2I9e5OSoVLVlPOTvzxkAqXQx+QZQZzaYy0fusLtNv5DnhCSYrW4CZT2NAnqyckXklkFBm06pa9Iv+tcKyQM4QQurrcmr4Ox4nfAbLQ8ybtEYsR5gUWYrYMJDK6vI5LditLq0m9vf0iV61frJqscOObuvNV+2+gGMZo+ITAvBqg13SUzmEwxIGjJgPaa/USbJj93Gg2yzNNBnODQMlFb3d3tI1uSa9ehpa12wxaqJYX5zRiXWytM5lfD9UoVpGIWFfr0GMDV95f7591pa9RX2T3PRk7Fp9ntgPChxwtBtLqhMbI0kSADWCc4p7sSGZBSKQn9gK6xSzudUiPJAQfkfpUf61+zEcnf9o6Kad18JpYmxAvl26J0Bd8zWwatw7wyi5xuYaFq8o+41UgyXETwM53lsmou/hS7Ry/qJTrkjkx5s1B/lTE6vNRghz124AYJriG3rgDdVvSWBX7GJ2+MoZBiiEocn7V7fnWi9I4pSK+U50MY8vXUO4EIe8gW+ySoOuAbK8rP3AsXe6b9gMNfIlJ+ZOcXOfyHyJp5bxGSAoOORce0QES8HTs4a9wTgZlLEDwr4smpz1vkryqXCkm6N/b6nCbOrG54hWjkLeijdzkOaz6PaMbo01Y4ayo8ry0akvbLZh109FiwGHaZatywThtVu8l4amNNyMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(366004)(136003)(376002)(39850400004)(396003)(451199015)(186003)(83380400001)(26005)(86362001)(82960400001)(44832011)(5660300002)(2906002)(38100700002)(8936002)(4326008)(6862004)(8676002)(478600001)(9686003)(6486002)(6506007)(316002)(41300700001)(66946007)(33716001)(6666004)(66476007)(6512007)(66556008)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4I3DVFN5eOuIJRQ5N8a8vQ6CoLblQObfp/gUSKqGKCE4/T0DbG3bLmDHdJyG?=
 =?us-ascii?Q?+CkNFWKii7uA3L5cKijPdwEC200Zr9+BikFn68bP7PMALYy90BjlYOeLQiEU?=
 =?us-ascii?Q?Uy1vtHon1i9nsCLWwqPrYqn2IQhkwd0LLfFNgGS2jQ6X6PQDWQwmOyR0nyS9?=
 =?us-ascii?Q?VK+RI298sLheL0o6TlfiBb5/ETm/Dmkv7ToXlMP3TEaH/8IRk+hFHYlwsev0?=
 =?us-ascii?Q?VKT5MUGt8zaTnj2VUwz0SLtkHzB9Re2si0VPT+q77zMqmKi9Me1cDdwjX8MB?=
 =?us-ascii?Q?aTEWAQmjRwJYKZy1KQYbodTSg/ZVdwUsqOL8XwLI6pddkRQpbTZByxGviCml?=
 =?us-ascii?Q?GrUsyIY7P7uG+CfzkxFgogA4FysVqKZ4q++ZqVlyDgBtW0rLPhpVZ3eKea2X?=
 =?us-ascii?Q?/V7tNtiAbrpDwk7HPS/qCy5K4/CLndXA7QjELd0JnxkltrGRbb6iHP61gG3I?=
 =?us-ascii?Q?0ALScJFtEfPylLENXkMIRv/3kgmVWF7k5n7FDikvGtpBqoHBR6maGnExYlRz?=
 =?us-ascii?Q?kVPA+VzCQP9JgWb6Ar4+DOr9+KnKX3D++I9lwykT5CMdG/Jeir4ggFb0rdI8?=
 =?us-ascii?Q?x7UDO/mQ9IMKZCCxd29PdeBzWEBofUiSqjFxhaafRsrg1QfqHQivD1jSPqd5?=
 =?us-ascii?Q?Q1recGPrxz0z5ZJVfxYEuNlMaQp4vc2I6M9X9SiNsOf3Z6HY4/7X/XWcrnHM?=
 =?us-ascii?Q?gjGHnOjXA8AUovzDwtLP1yTTHjuIghCD2Kzv806b359FJni5iZzVTjmE6IwD?=
 =?us-ascii?Q?98m6muzsKTzFLg9byxvapy/lvao7STPZj/QaC+yD1GuRa0yjMZGdTJ4hNGQZ?=
 =?us-ascii?Q?h06kL3PeumZpcDo1X0uYBk8BApRFv48OCRVonQWXyGu1p2Q9Abpi/oXjkqWQ?=
 =?us-ascii?Q?Hnpt251rV7UPgiMdnbiSII0TQ0y1ZyM050ItD0cN+nY3ACs0XM6whhtOmYry?=
 =?us-ascii?Q?F6oPDmASWKm5RrhCwBffXz0dV9eaSa0Q1EjFrCWaUftmPnK78MSG0VQNPz+a?=
 =?us-ascii?Q?SmXotihOagoKF78sFrdnZPv5rYNmekSLRjke6ZApc4gY4Hl0cH8X3y3DXO/m?=
 =?us-ascii?Q?V5h9wrlmiQizPykEefXgm1bEy/C/cvqXAez/mEZa9JGigS6OlhumiV0CxsGb?=
 =?us-ascii?Q?ODty1TTXqDt0rtYTJDhf1sbdiL6jlCGd4Rca1GdbVNBTSaBSyVfQlsg6CuTu?=
 =?us-ascii?Q?HUrn+mU74k7wL5W8lGjQw/UWt7bZr7N0gVe7UdxHvRp4D0Y0WEOd2Mvwqi3m?=
 =?us-ascii?Q?vKjEb9CJPAFCn0cEH2BLc5Abu2kqF2SXWC5UfcIxToTsnqrkWUQ1W4v+6KLM?=
 =?us-ascii?Q?rJEHCaeYkEYc73FAQtKeWuWyWgxe02y2hIZc+tbsbaNYTb1OqzJluuEGWODL?=
 =?us-ascii?Q?F47kc2rQMURBg4mweyYE8Xp5/Ron5bIYG6E0Xt9IuK5zTM+/KCy1w9VECOBC?=
 =?us-ascii?Q?1O8D833nHayvMH8HKRxkDL+fvKbjHlLsx7NfE6Ur+YYC37C2HM7xVbHjOER2?=
 =?us-ascii?Q?CpX924Z3qmdVjQruwIeEoa3FGGmQxJb9/EiEUTCCugOXqN3jbPHxCDbw1/fr?=
 =?us-ascii?Q?wQTIrc4O9dsSjdhAIy/OCKII6C3tTe9ZbERjbZYZMXZgJQekaGumkHKYl2bF?=
 =?us-ascii?Q?P6LfoeQR04+jrVPy7jEKeX4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a402d717-c3e2-4ad3-26cf-08dab1fc6f5a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 18:04:58.5807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Au1Ci1IpbvfuVdIyZHajop/1ioQ8oDCPJRBL0pNvOQ/0QL57TW5qLuUBmOhC1mwRG4PGOE8kZn9UPm0uig0+GVOb4Y1iBCmWK10ulvMfxFwOCR60PWzEOzVjBPE4Ul+v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5697
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

On Wed, Oct 19, 2022 at 05:09:32PM +0100, Matthew Auld wrote:
>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>Rename __i915_request_await_bind() as i915_request_await_bind()
>>and make it non-static as it will be used in execbuf3 ioctl path.
>>
>>Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/i915/i915_vma.c | 8 +-------
>>  drivers/gpu/drm/i915/i915_vma.h | 6 ++++++
>>  2 files changed, 7 insertions(+), 7 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index 4975fc662c86..ab89e907f2eb 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>@@ -1884,18 +1884,12 @@ void i915_vma_revoke_mmap(struct i915_vma *vma)
>>  		list_del(&vma->obj->userfault_link);
>>  }
>>-static int
>>-__i915_request_await_bind(struct i915_request *rq, struct i915_vma *vma)
>>-{
>>-	return __i915_request_await_exclusive(rq, &vma->active);
>>-}
>>-
>>  static int __i915_vma_move_to_active(struct i915_vma *vma, struct i915_request *rq)
>>  {
>>  	int err;
>>  	/* Wait for the vma to be bound before we start! */
>>-	err = __i915_request_await_bind(rq, vma);
>>+	err = i915_request_await_bind(rq, vma);
>>  	if (err)
>>  		return err;
>>diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>>index 04770f8ba815..19e57e12b956 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>@@ -54,6 +54,12 @@ void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
>>  /* do not reserve memory to prevent deadlocks */
>>  #define __EXEC_OBJECT_NO_RESERVE BIT(31)
>>+static inline int
>>+i915_request_await_bind(struct i915_request *rq, struct i915_vma *vma)
>
>Some kernel doc might be good?
>
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

Ok, will add.

Thanks,
Niranjana

>>+{
>>+	return __i915_request_await_exclusive(rq, &vma->active);
>>+}
>>+
>>  int __must_check _i915_vma_move_to_active(struct i915_vma *vma,
>>  					  struct i915_request *rq,
>>  					  struct dma_fence *fence,
