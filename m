Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C415C6D1609
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 05:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AB510E33C;
	Fri, 31 Mar 2023 03:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4ED10E33C;
 Fri, 31 Mar 2023 03:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680233620; x=1711769620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HqsnVLFJcMHIFYJonezlot/+j7212JT2r5A3EyTKJmk=;
 b=X6fkc3inQGlP5DR2d5hIy+AGrXekinV37qna5sGqxicd9O/+SCGCRL/W
 +3OnrOPieG1cfl7QwDFZYX7Iz/298tCOQ9oUalAVy4z99pyxAtIiIQeGN
 UDAkrojKjGuKGDqFH/0Rjy310469kafXsMY+xtzySDFqF826lUDwy9p1X
 UxMTApyNBlkw3dvuM8ptxHiThPeouGb1EZo8bC0lrCN7/VAYVLM2k+spU
 DesVk8yDqwlJZ40dXleB1rz0hv7d1NMNDWCuaZgO1V2qqBw7bhZMRzg/Z
 g3TRxwiCaorWa/3Oy3Zg8sW4gBfeFIZvQ9PsrrgxdarhFZ16T+YUkPBrS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427619940"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="427619940"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 20:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="754257864"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="754257864"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 20:33:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 20:33:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 20:33:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 20:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5rLgPAbQTj/QntU547sGDt9YfQIgDNFPuWjrfyVZaLg7KNmfHrXAqd6gs7xruN4bbrsZOBRv/JXA+1QRbl345eyUJHeISkvL62wfKrdpWX2WGCkRq4LiL98tfZfUs0kytPWYP6Sy+Z4d87UeaiSX3Jd2ZQGj65OYefy4Z3ZxmxpN3iCtT332RxsXnbYcR7fTfiIrUEWdiPWozEsqwD92Vxp+uY2TOi6YKqq0SA7DACtPUntwfVFjSfXOPUld3EhmnY4Sa23XdkLweqa4Gl/FVPDmKMWRgqyCkzdoz/HFahX76Z7SByf3ElsIzZn1kc+dbo6xzUraQq2g2ITGHfWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyAWrXvGJViHi9tLJwfXpSJjm9oICby3OocUfZSLGVQ=;
 b=Va2+J8lKsvnxXcGb7UXtZp984hwj56z3SEnnBVIq8Ul850CqWSHm9gl5T0ZWc7ISYlRn1bGWimm3GtcXTD7yAYpWppmp8bI4QwXlphMhTkVR+w7IsbNBqn5LM/x5jRBlkio5lY6J5ckSlzh6f4+wXnol6Kf0Czg3RNjdcF8hmqYPgEjTeXLW4yWP4NZjnr1lHSc96wISol/bC04RP1H6tqFjFV5gDvwTOy5BfsVDKKN+llGxwAhPMmGmYsF5d9L0IweNzxIL6SROqSN1A31/Eh2xo5wv6sAOl+3NYj+cuUNs11y/NkqkGPdTAY3sGylaI47tfzb/aEOtNrlj4G9JUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 31 Mar
 2023 03:33:32 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%5]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 03:33:32 +0000
Date: Thu, 30 Mar 2023 20:33:27 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthew Auld
 <matthew.auld@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/9] drm/i915: Use kmap_local_page() in
 gem/selftests/i915_gem_context.c
Message-ID: <642654876a503_375f7e294e@iweiny-mobl.notmuch>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <20230329073220.3982460-7-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230329073220.3982460-7-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 822d6e08-1489-4996-d110-08db3198b3a5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ryy6dv6AUGZnjIQH6RW76aVsateaeIhyd4/ECbsa3GyPzbIV/KIzv+jVRXslhSOYGcmfCwVdd6wL2K24eqTDPZwsY0Y2QNb3cy/nVqIEgna2zSZ9zaCI+nXnaoFCr1ilKhGUUA+aktQgxySaDgHBDx/fYtyaJ778Hfi2voVyg0R2aVxzEJWDhz2U5IdY+GieTAbCIyQzTxhl2N0Z8ZNUOhKklJtgAMyATZT5iklENgwtFyCJBGf8tNVKET364Yma0Snz+/gLBhb8UalRt52Ll9M6TF7t3RoZGjw0aE6uaMcoOeWuHfBiPeW3y4YoTqtnJwtRiWg1CLwSUGrCEy5vccYypwJquplmOUbdZaYC9DWC261NalloZEvfqzWjEazf+/fEZZS9TV6amS2cnR8f0a7eVlSq3beM+8r7LpXcc1ouwq6QgNQBZrQMVcfp7Mpc+wX/BMA4o0ihFjq8gPR29HLOkyIGNpGoKSvuA6rFQ+9AetBDbs+8fzN0fL2HwCuCXqMirrgOsix+qRlkPtelNJsWrCTuTuHoR8ECffNc0uOKrLAIJJ16m81q1aztPjROwINBwAev3fWU1Zp0XlRaGJf3n4CR++FJuovyNBib5Hw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(26005)(66946007)(9686003)(921005)(7416002)(8936002)(6486002)(83380400001)(6506007)(41300700001)(66476007)(316002)(2906002)(38100700002)(54906003)(5660300002)(6512007)(478600001)(86362001)(186003)(44832011)(6666004)(66556008)(966005)(82960400001)(8676002)(110136005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HMn8hFxIZz2vxlrFmnjuMcGWWaWhgOZc6apR6zFGCwNeSvgsldYskcCAxycr?=
 =?us-ascii?Q?u7EjM+Xg50TyXQ7P+wx1Ge+J/CkUxlNdOyXaHCDz4vYX6RIU9vGaXW6NH53d?=
 =?us-ascii?Q?PG9rs1hjojXrn057N1ZlhOpaUXkqSScP5E5hy2dA8BVNfVLA9QlPSqxO6/03?=
 =?us-ascii?Q?7JDlcJAP35t3uSo80cV2fv7OKCUnd8EGytOaExzyJS0De0auxV+YmngsBMhW?=
 =?us-ascii?Q?psR/zT8pyPPrwDTCS6tpVH5GX99/EkAfXhi2BnCJpDdnNJDrxzsN0lPM3pbZ?=
 =?us-ascii?Q?WBosiur6SGwbwmkQns9dfpEe9aZxzuw+z+sfkFtCup/NGYh50cjL0CBZoq/v?=
 =?us-ascii?Q?tWMIEPEVq437f1XbhbfXvhhYpNGUJMnffkL0yxIKesR2X98X8uidtZAsgdjE?=
 =?us-ascii?Q?pQtSE8k47r+zq78Vns+zBLNIXOZ2pG7MUk5B5L0hpbpTAE3560y/CrJzat6v?=
 =?us-ascii?Q?BxYBpaDzSVsb8KD6pgrCvUmc473R+5KUUU6ckCWuXIvM1q61IeYjuG7Wb9Fu?=
 =?us-ascii?Q?xgSaAz6naW0EKc644J7r5w/YqvNiAHltzaEDnku2RdTAnD2h8CBY8PNXxZbO?=
 =?us-ascii?Q?3QWiM4t89aScKsspvprQIvv4tCVwjt7fOzwZ4P/AStlobGnMr6Z8xMzfoVsd?=
 =?us-ascii?Q?xZtkpJeKY93SYB5jrZL554GDaDQVx6TUK38Nnqsg+olaJOGBptheY+EppRgq?=
 =?us-ascii?Q?0RWGVaWbqu5Tuv4W4JZNlVPcFv/F9kRMqKKABjMTlMybISuwwDIx0Drn846Z?=
 =?us-ascii?Q?582DCBHjnmx6ljY7ksWcfYsPN3VSv3r/ZDBlk2XNQTc5EmNDrZkytYz9uVVv?=
 =?us-ascii?Q?axeCB8dpLsjEAPZID9KSZ3g3opyttyQyqg7U8QpT8svmyMqFy7jGcljZ1eHC?=
 =?us-ascii?Q?+A4PCwcRZy3CV7M6gRJHhs5ghTdoXEgLOPUJ7vi5g5mPqIA0U933JRpT6/Yr?=
 =?us-ascii?Q?K994jueTDU1BuP2cOUlDQ0W4Q1AIJ9vBOLsWbv0lTvLMPopcDNoKoT5b2Cd1?=
 =?us-ascii?Q?uCnDM+DYLoPjcn9HLJvi11Gs5gxgn6NWJr7+vumt8LFsLe5J1X596JYF/IKe?=
 =?us-ascii?Q?yI7DoPzXFQOufCyu968ZQmLxS51Lmqz0E0pa6fpjIoNLR6qnXeFCOWkcXOlv?=
 =?us-ascii?Q?f4H6k/JLmnTl6ALD9CYSUpiOZtKIkJ9org3GBvOXG+Hgiv7FMYRVdinuqdHZ?=
 =?us-ascii?Q?PrxcOpNg4hcUkmnU/0j0qvPw/qwKP4w8akJiVUHa+JT2afOGKqBo0IxcRon9?=
 =?us-ascii?Q?KG0ZPTnWucSG9fB6IZkWvNpDR+sb1z6QvcxVXIBD/VUYn92+liKLOO5TjyIe?=
 =?us-ascii?Q?FGwu8eKFkszautwjzxL8SzV+gvDCqz8BZKossoY+D9SpzxcXTR7eaOaPwdZI?=
 =?us-ascii?Q?0t7RDW8a+u9Y/4yK98MYXdo/AERyy4CgqnHXkrB13ywJKZTxDhodcuza8eZE?=
 =?us-ascii?Q?w9p8/3ek/e9+CJBTc15xQay5XWCiZURRsTyD7TD6TUA+eDzsOVV7vFQoQZxy?=
 =?us-ascii?Q?/PbJD57Sf3DOiJuZ7i+SIbMFlhLfi59sWOsyxIOPZwLu2rF/ajI3nqMKNyW9?=
 =?us-ascii?Q?6LO2Cv3zZ3b5GxyL0bI88qo/A2RUsiYSKlew/GGX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 822d6e08-1489-4996-d110-08db3198b3a5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 03:33:32.3907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AT3HilBv4kYx1+rcXQ31cF4d5U+/PByCeSWWKQpIwj7PPRGX687u3jkT5szZuyleM+8No47MzA3FejVljudDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dave Hansen <dave.hansen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1], and this patch converts the call from
> kmap_atomic() to kmap_local_page().
> 
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption.
> 
> With kmap_local_page(), we can avoid the often unwanted side effect of
> unnecessary page faults or preemption disables.
> 
> In drm/i915/gem/selftests/i915_gem_context.c, functions cpu_fill() and
> cpu_check() mainly uses mapping to flush cache and check/assign the
> value.
> 
> There're 2 reasons why cpu_fill() and cpu_check() don't need to disable
> pagefaults and preemption for mapping:
> 
> 1. The flush operation is safe. cpu_fill() and cpu_check() call
> drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush. Since
> CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
> drm_clflush_virt_range(), the flush operation is global.
> 
> 2. Any context switch caused by preemption or page faults (page fault
> may cause sleep) doesn't affect the validity of local mapping.
> 
> Therefore, cpu_fill() and cpu_check() are functions where the use of
> kmap_local_page() in place of kmap_atomic() is correctly suited.
> 
> Convert the calls of kmap_atomic() / kunmap_atomic() to
> kmap_local_page() / kunmap_local().
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> 
> v2:
> * Dropped hot plug related description since it has nothing to do with
>   kmap_local_page().
> * No code change since v1, and added description of the motivation of
>   using kmap_local_page().
> 
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Suggested-by: Ira Weiny <ira.weiny@intel.com>

First off I think this is fine.

But as I looked at this final selftests patch I began to wonder how the
memory being mapped here and in the previous selftests patches are
allocated.  Does highmem need to be considered at all?  Unfortunately, I
could not determine where the memory in the SG list of this test gem
object was allocated.

AFAICS cpu_fill() is only called in create_test_object().  Digging into
huge_gem_object() did not reveal where these pages were allocated from.

I wonder if these kmap_local_page() calls could be removed entirely based
on knowing that the pages were allocated from low mem?  Removing yet
another user of highmem altogether would be best if possible.

Do you know how these test objects are created?  Do the pages come from
user space somehow?

Regardless this is still a step in the right direction so:

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credits:
>   Dave: Referred to his explanation about cache flush.
>   Ira: Referred to his task document, review comments and explanation
>        about cache flush.
>   Fabio: Referred to his boiler plate commit message and his description
>          about why kmap_local_page() should be preferred.
> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index a81fa6a20f5a..dcbc0b8e3323 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -481,12 +481,12 @@ static int cpu_fill(struct drm_i915_gem_object *obj, u32 value)
>  	for (n = 0; n < real_page_count(obj); n++) {
>  		u32 *map;
>  
> -		map = kmap_atomic(i915_gem_object_get_page(obj, n));
> +		map = kmap_local_page(i915_gem_object_get_page(obj, n));
>  		for (m = 0; m < DW_PER_PAGE; m++)
>  			map[m] = value;
>  		if (!has_llc)
>  			drm_clflush_virt_range(map, PAGE_SIZE);
> -		kunmap_atomic(map);
> +		kunmap_local(map);
>  	}
>  
>  	i915_gem_object_finish_access(obj);
> @@ -512,7 +512,7 @@ static noinline int cpu_check(struct drm_i915_gem_object *obj,
>  	for (n = 0; n < real_page_count(obj); n++) {
>  		u32 *map, m;
>  
> -		map = kmap_atomic(i915_gem_object_get_page(obj, n));
> +		map = kmap_local_page(i915_gem_object_get_page(obj, n));
>  		if (needs_flush & CLFLUSH_BEFORE)
>  			drm_clflush_virt_range(map, PAGE_SIZE);
>  
> @@ -538,7 +538,7 @@ static noinline int cpu_check(struct drm_i915_gem_object *obj,
>  		}
>  
>  out_unmap:
> -		kunmap_atomic(map);
> +		kunmap_local(map);
>  		if (err)
>  			break;
>  	}
> -- 
> 2.34.1
> 


