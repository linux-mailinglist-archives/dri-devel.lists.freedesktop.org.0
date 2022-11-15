Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932C62AF4B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 00:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D078910E033;
	Tue, 15 Nov 2022 23:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA38310E033;
 Tue, 15 Nov 2022 23:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668554113; x=1700090113;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=buJ4q/FhKRl72xJR6RixKOlus/EJd9FMnHli1I/+AKQ=;
 b=OK9lqfsPyCrXlvPtCfomW3rDfMvsWmaKJutLpzi9o7QDduseIsZe/rwl
 34ZrpXwLPklZqrpMTlHw3/3WpV+nO99NKK8aNswuLCGXPiBElBarkxDMF
 oByhpcEejaZK7hb3qGzgJyJoga8k4dizx2fZW1jLlOEEtC6h+OJjSE1NC
 N7o6X5ulBrrWA0HQ4x7NxuBokn08HgGN3baLN1nucCjAWUnAzI6iFCOsM
 JBsNlBHreCEp/vIebHr1fw/m7Q0zjfaO7rHgRVAM2rIJtBfqtt5conjxd
 aRdE/6tp2msOqhiaShJ1XhAnh6AIyMLesgdrsVstkGl5GbyzeIk0ADjnl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="313541753"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="313541753"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 15:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="968184749"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="968184749"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2022 15:15:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 15:15:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 15:15:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 15:15:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 15:15:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDp61wLc79KjScK9/LVsvCv9wK2kuAkSv4ar/21MwTymrXRSFDk2zPKRyn4Z8lh+iuHcfVnKJiDGdBogBVSswWUcgQbkcPUj4a89G2SQ+Wq07kjfK/s0o4JNUgd9gBSyjkp8IBr8kw+89QHJ8zEVI8zeymtZuySvZ+44s19ueSRTaHYKtx3WLJgkQTZtSzp8FiLE91csaOXhiOR7Lcp/ypVttaBE9MkF0ExC44JQavmcw1SqzOl5HXK9BaWs5ZsNV3mDbVXcXQFgHmaJIWlXav2pi0s6uDTpdmvgSEQsM8uNdT0T0m4VUR9D+PuenhukxOS+7w9lOVo/CTYiZKTGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pt+r6S4UzLwLIkwijXz5IAxrgFO7Xlye/MOFISWQMTg=;
 b=Ux6XjWjNN2yFBW8RvVp+D/qRsyuKnyx75BRWFhcrJRERcHBvgI8gDVyNDfUwwse30SJRTUSMi3YvGIDngx+pwXp0heWxMEvTKxhj9OgU92UYftnNmXRDu5/IH4xFmRW6AMPfruRNSbyuWNp6/XTyu1mEOrXyGqKHQji6i3qhD1qNSLfeBswZIwDLqmJWuffRDtbie8ya8sdV8IhnlbrpNlzsvggDTfL4nHFqo+iMLuYiX3ryZWZDLglGSNBvs3zsG6c9yEXu2dxfttqGIZcLScXlR/VfznXRbQenVzDWertM7c6fhKCynGzQ/5fO3RiQlH97BNoXgGeN0NYjCktG3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Tue, 15 Nov
 2022 23:15:07 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 23:15:07 +0000
Date: Tue, 15 Nov 2022 15:15:03 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y3Qdd2aW4AHHDgq3@nvishwa1-DESK>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
 <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
 <a828c36b-8f89-24b0-b287-dabf62f82085@intel.com>
 <Y3O7NCxiZHjjmyN7@nvishwa1-DESK>
 <d8b028ea-4179-768a-7154-5b0bc3641cb1@intel.com>
 <Y3O/a/sF21wC3EdE@nvishwa1-DESK>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3O/a/sF21wC3EdE@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa33a36-9d10-4533-9164-08dac75f3bcf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Hp3NYGd2WmeMirpFBV25YYaOWDEvmYiC9tqFbOTQBQ1p2KQZ1UHZmFdrrEn1izHG+940XS6cmu9xPKtc2+UU09bkWG3sN3s+4CTwCgfpt5jysdJuK/BF/zAUDTkfgFha2xbcms2e0gZVb3ll6bNgFfCZY0p+DxgQVt+UfzxbbTSOFXwBipl8TFemG/rR4wz4hvaYuM7Dsg2+hP/jWeLl1k9HMiJjYlgE+mBCToVF7hnQJClViUH+CcLEjjI0FflsmrAc6KyKtW/ug5ncFTNflew2LtuI0+zFr/wHRbdTACK9E4xW7bUgLyMZEcsu9cnxqEaYFXe244dLvaFBsVJYfwd0ZMKGNPgTdHp9ArOMS6qkIgETSJS9Qx1mh5TzT83FLyRBoZFGrqs6U92+nfmsG4LdW+Faw0c9p2pF4VxFj1tGr+qyLqoIuHvxrJOQa4HTygdVTVxiEKqzetyWlJ8oc1Po6knsio1Fb+2N6iArABS6jnfUPswqdOeYHFNqzjOaHMNtqqQpBTXqOhf2wOOABHiCeQ6VXrzySf0FWXKVlQkv3FNGn3i5Gtr2LWTEOyhx/CWYl7cCF7WADGC0lCF3gSIbvhhtO8m5tnXRlIskrtVp8i2j4MLVVqGZydzkhZyJ5Cx4cw3/T0MFcW7runEXgcu4zPUcFqvo9+cWkjAicljnRfJAGOy+S0mQsFYBNgivuDRUfsL3a87dNCftuqEfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199015)(6512007)(26005)(8936002)(33716001)(82960400001)(38100700002)(6666004)(44832011)(83380400001)(186003)(9686003)(6506007)(66556008)(8676002)(86362001)(5660300002)(6862004)(66476007)(316002)(6636002)(2906002)(66946007)(41300700001)(478600001)(6486002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?j7GM5Am/fsuB+EPxfa59f4rllgKbEkFdblrxEvc+3oK8EEePMYhOa1AdQ6?=
 =?iso-8859-1?Q?/GIPExIk3ePkZz0tKhbAPGqWvS1U2BRTPrgjk6OREmLxd2it6UjWJtWK4C?=
 =?iso-8859-1?Q?9VYO0vKtcq5nAPRPWJo1zzpqZht2bpDpimVLpg45DRyp2RcXTynNxVloej?=
 =?iso-8859-1?Q?cF9CW7iypg20RIW+Jtwq4RLbXCZs4XwMLOpO8ny59XygVzsTzfF6sl4IO7?=
 =?iso-8859-1?Q?H9xl82629eLdg0enYjEMMkydGmZYABmHGMCCP4zNJHRD9OHOilEm1EvRiL?=
 =?iso-8859-1?Q?FWoZ5/zvjUmq1a8QqrZpxGrlh2gdTeaL13O2byBQtBgTO9RxOmZklh8Q0J?=
 =?iso-8859-1?Q?Rp3flEMpmO8FIeP0vMJPSFxxGcINalVwoIpEDsgtEBfC1845hsCuSOTJsg?=
 =?iso-8859-1?Q?sPqaJBq/YhefS1X3Z585YE68tZpgoaT3CEWQMCf/VeWlCR50k3brj8rBhf?=
 =?iso-8859-1?Q?7JucsBnO0kKuPtmLHz/aG3tnr6Twxf+1dv/rj1tYbRuaoAHPnKpeJIVlYW?=
 =?iso-8859-1?Q?PrY6PXKN3XZVAblOf8Z+QXyOIoTxC5o716lADiSPwLD80+yHaewb3MqU4s?=
 =?iso-8859-1?Q?fgpKyJic/UsOZxYi/0VpSrEl7y+qhxyZlWV+gduF1pmjEaBPRBaxjqROUl?=
 =?iso-8859-1?Q?qoKT2AhZuGFP4qHoteX9STLg81yWs668mp7czSmsa7ilUavlePE9XzwPKO?=
 =?iso-8859-1?Q?/tGugNfGdwj0WLmCkBAHli/a1/W8VE/4o8Uox2CZQI0yLm9mkwg263PIfZ?=
 =?iso-8859-1?Q?lck+/0M8NQjLtWGOz8NBYN9jtNro2Gy/FvoGoG5vkivz2jVwcXKlVcjPgm?=
 =?iso-8859-1?Q?9dAYJv5XrvICZFdk24yGgungdfnMDijdGkkojx5PArsEI2Gf+Eb34rlD/q?=
 =?iso-8859-1?Q?hvL+NBg6Joj+0MYPJeEpAQ0L3W+dRLG+k4ka+6DTNP0o11+CJisKMJfCx2?=
 =?iso-8859-1?Q?M1hdLwtR3M0cA79JM+x+rUwbFj3d0w0RtQ0RN9itRAsyYNQdfOCqT1mJBD?=
 =?iso-8859-1?Q?eB3rvt76E1UFYSohkPTF09vL6AstxSwdJ1/OHtiXNwRfuO2WN4jEf+9UOL?=
 =?iso-8859-1?Q?32nNLU+QiXSmf24gpOoGiLMxgJKvgOcsr0WwosXxWwuYHz8K4duYd9MaHA?=
 =?iso-8859-1?Q?JQTspxZ2Hk2Tkm5+5EsbGfCdgoc9nLRvLilgBv5Z/0l4KPqVBfgE8ODibY?=
 =?iso-8859-1?Q?N/VmAm54sQl69SqOPEJpqHIZYSmluYU9lJDIbTLYilGmcA+apHOaFhM1FG?=
 =?iso-8859-1?Q?KSKDCL5K5LO2gVKoYivZkpwDnmb4/9nPhOa11/nKXAAxSXLpDwV0mlkKD3?=
 =?iso-8859-1?Q?jm35nsdAeNFbltFCJuLo3KjVUl/jpjl8ydx+GRj0pdRQp79hWFANEdqAYc?=
 =?iso-8859-1?Q?UAFisS+Qc4zt7dhejU1xyv3jikG9xcGAOMu+mnwOtjUhtv+/a10uqNk6u1?=
 =?iso-8859-1?Q?njilUIzkEvp1NpElvPx5feKMs9a77uSA7YbhD21qTTCosUSdopJy2bi3bs?=
 =?iso-8859-1?Q?9TbI1MZOjn97g7GWeKR1iMWjut8PhK2B5fQ00BagWgKLji1qA4EfQVwZhC?=
 =?iso-8859-1?Q?Av1FwNGF4jGSCIbENOKsbYtpZ3lL64fEXUAuUd0U1pF9L1x267MDIwYKTO?=
 =?iso-8859-1?Q?sDF+Hxxo9xOWluXro0ZUW1nPT112l/0Z0tC1elbMKIsZof1PieWzVPe5bz?=
 =?iso-8859-1?Q?8HI83ZVTZtPAkOjVTIs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa33a36-9d10-4533-9164-08dac75f3bcf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 23:15:06.6863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXPBhTebK5FWOB41HJyA92RNX+GT4AaI4C067Lun/IsoIfe/31obzn/XYQk1GzKNUv3xPg7UcoEnIcH3DLnZaZN+BjN9k9H3mZYvx8UTI+QKAcCNeledPrn7vrqPYtcL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
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

On Tue, Nov 15, 2022 at 08:33:47AM -0800, Niranjana Vishwanathapura wrote:
>On Tue, Nov 15, 2022 at 04:20:54PM +0000, Matthew Auld wrote:
>>On 15/11/2022 16:15, Niranjana Vishwanathapura wrote:
>>>On Tue, Nov 15, 2022 at 11:05:21AM +0000, Matthew Auld wrote:
>>>>On 13/11/2022 07:57, Niranjana Vishwanathapura wrote:
>>>>>Asynchronously unbind the vma upon vm_unbind call.
>>>>>Fall back to synchronous unbind if backend doesn't support
>>>>>async unbind or if async unbind fails.
>>>>>
>>>>>No need for vm_unbind out fence support as i915 will internally
>>>>>handle all sequencing and user need not try to sequence any
>>>>>operation with the unbind completion.
>>>>>
>>>>>v2: use i915_vma_destroy_async in vm_unbind ioctl
>>>>>
>>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>>><niranjana.vishwanathapura@intel.com>
>>>>
>>>>This only does it for non-partial vma, right? Or was that 
>>>>changed somewhere?
>>>>
>>>
>>>No, it applies to any vma (partial or non-partial).
>>>It was so from the beginning.
>>
>>Doesn't __i915_vma_unbind_async() return an error when mm.pages != 
>>vma->pages? IIRC this was discussed before. Just trying to think 
>>about the consequences of this change.
>
>I am not seeing any such restriction. Let me probe and check if there
>is any such restriction anywhere in the call chain.

I checked and I am not seeing any restriction anywher in the call chain.

Niranjana

>
>Niranjana
>
>>
>>>
>>>Niranjana
>>>
>>>>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>
>>>>>---
>>>>> .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>>>>> drivers/gpu/drm/i915/i915_vma.c               | 51 +++++++++++++++++--
>>>>> drivers/gpu/drm/i915/i915_vma.h               |  1 +
>>>>> include/uapi/drm/i915_drm.h                   |  3 +-
>>>>> 4 files changed, 51 insertions(+), 6 deletions(-)
>>>>>
>>>>>diff --git 
>>>>>a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>>>>b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>index d87d1210365b..36651b447966 100644
>>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>@@ -210,7 +210,7 @@ static int i915_gem_vm_unbind_vma(struct 
>>>>>i915_address_space *vm,
>>>>>      */
>>>>>     obj = vma->obj;
>>>>>     i915_gem_object_lock(obj, NULL);
>>>>>-    i915_vma_destroy(vma);
>>>>>+    i915_vma_destroy_async(vma);
>>>>>     i915_gem_object_unlock(obj);
>>>>>     i915_gem_object_put(obj);
>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>>b/drivers/gpu/drm/i915/i915_vma.c
>>>>>index 7cf77c67d755..483d25f2425c 100644
>>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>>@@ -42,6 +42,8 @@
>>>>> #include "i915_vma.h"
>>>>> #include "i915_vma_resource.h"
>>>>>+static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
>>>>>+
>>>>> static inline void assert_vma_held_evict(const struct i915_vma *vma)
>>>>> {
>>>>>     /*
>>>>>@@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>>>>     spin_unlock_irq(&gt->closed_lock);
>>>>> }
>>>>>-static void force_unbind(struct i915_vma *vma)
>>>>>+static void force_unbind(struct i915_vma *vma, bool async)
>>>>> {
>>>>>     if (!drm_mm_node_allocated(&vma->node))
>>>>>         return;
>>>>>@@ -1727,7 +1729,21 @@ static void force_unbind(struct i915_vma *vma)
>>>>>         i915_vma_set_purged(vma);
>>>>>     atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>>>>>-    WARN_ON(__i915_vma_unbind(vma));
>>>>>+    if (async) {
>>>>>+        struct dma_fence *fence;
>>>>>+
>>>>>+        fence = __i915_vma_unbind_async(vma);
>>>>>+        if (IS_ERR_OR_NULL(fence)) {
>>>>>+            async = false;
>>>>>+        } else {
>>>>>+            dma_resv_add_fence(vma->obj->base.resv, fence,
>>>>>+                       DMA_RESV_USAGE_READ);
>>>>>+            dma_fence_put(fence);
>>>>>+        }
>>>>>+    }
>>>>>+
>>>>>+    if (!async)
>>>>>+        WARN_ON(__i915_vma_unbind(vma));
>>>>>     GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>>>> }
>>>>>@@ -1787,7 +1803,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>>>>> {
>>>>>     lockdep_assert_held(&vma->vm->mutex);
>>>>>-    force_unbind(vma);
>>>>>+    force_unbind(vma, false);
>>>>>     list_del_init(&vma->vm_link);
>>>>>     release_references(vma, vma->vm->gt, false);
>>>>> }
>>>>>@@ -1798,7 +1814,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>>>>>     bool vm_ddestroy;
>>>>>     mutex_lock(&vma->vm->mutex);
>>>>>-    force_unbind(vma);
>>>>>+    force_unbind(vma, false);
>>>>>+    list_del_init(&vma->vm_link);
>>>>>+    vm_ddestroy = vma->vm_ddestroy;
>>>>>+    vma->vm_ddestroy = false;
>>>>>+
>>>>>+    /* vma->vm may be freed when releasing vma->vm->mutex. */
>>>>>+    gt = vma->vm->gt;
>>>>>+    mutex_unlock(&vma->vm->mutex);
>>>>>+    release_references(vma, gt, vm_ddestroy);
>>>>>+}
>>>>>+
>>>>>+void i915_vma_destroy_async(struct i915_vma *vma)
>>>>>+{
>>>>>+    bool vm_ddestroy, async = vma->obj->mm.rsgt;
>>>>>+    struct intel_gt *gt;
>>>>>+
>>>>>+    if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
>>>>>+        async = false;
>>>>>+
>>>>>+    mutex_lock(&vma->vm->mutex);
>>>>>+    /*
>>>>>+     * Ensure any asynchronous binding is complete while using
>>>>>+     * async unbind as we will be releasing the vma here.
>>>>>+     */
>>>>>+    if (async && i915_active_wait(&vma->active))
>>>>>+        async = false;
>>>>>+
>>>>>+    force_unbind(vma, async);
>>>>>     list_del_init(&vma->vm_link);
>>>>>     vm_ddestroy = vma->vm_ddestroy;
>>>>>     vma->vm_ddestroy = false;
>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>>>>b/drivers/gpu/drm/i915/i915_vma.h
>>>>>index 737ef310d046..25f15965dab8 100644
>>>>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>>>>@@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>>>>> void i915_vma_destroy_locked(struct i915_vma *vma);
>>>>> void i915_vma_destroy(struct i915_vma *vma);
>>>>>+void i915_vma_destroy_async(struct i915_vma *vma);
>>>>> #define assert_vma_held(vma) 
>>>>>dma_resv_assert_held((vma)->obj->base.resv)
>>>>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>>index e5600f358a15..431d40bb1dee 100644
>>>>>--- a/include/uapi/drm/i915_drm.h
>>>>>+++ b/include/uapi/drm/i915_drm.h
>>>>>@@ -3969,7 +3969,8 @@ struct drm_i915_gem_vm_bind {
>>>>>  * any error.
>>>>>  *
>>>>>  * VM_BIND/UNBIND ioctl calls executed on different CPU 
>>>>>threads concurrently
>>>>>- * are not ordered.
>>>>>+ * are not ordered. Furthermore, parts of the VM_UNBIND 
>>>>>operation can be done
>>>>>+ * asynchronously.
>>>>>  */
>>>>> struct drm_i915_gem_vm_unbind {
>>>>>     /** @vm_id: VM (address space) id to bind */
