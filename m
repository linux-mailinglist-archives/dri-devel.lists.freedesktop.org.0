Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D440775D398
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 21:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B43610E6F2;
	Fri, 21 Jul 2023 19:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B83D10E6F2;
 Fri, 21 Jul 2023 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689966742; x=1721502742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rS/CQojxTXgj1X1D654fyEeQj+V4dNcHTbZfbMg95P8=;
 b=RqZ3kVX8XColntBmVmuV3+rP5TtqYfxKW+iTuHDgMUj7QBESvIU5kV/Z
 yrtuP2Wrro4Dg/gH6YEDJDNYS/iauXWNU3dhHdTU7B/9dvKUq6FThTlk+
 knkjyn2uw8cY423ot+vWcgFUPCQVU7RsfOOLTy/ujzsS7bhgBr7iewM2o
 qyEAuh4+8vh+yQJzHwE5ZtjqsCYS4HiAbmpVsCRi9H1GqcQNmWFIRdUxu
 wNalMz3qYEHNUA9L9I/mSJZ9tCDIIkHOK8qx9jOUo3imT2Y6yT4k7YUPN
 P5NPCB/012kCXBsmEt++utEwbz0UitPCXtULPhNEt6sJC6OfXBOqqWjB0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433333431"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="433333431"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 12:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="724973272"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="724973272"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 21 Jul 2023 12:12:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 12:12:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 12:12:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 12:12:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 12:12:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/6Wl5PXmV2GLEBQ65+1qEHZ6QkLy6nwWBfGSc30o8VRy5UyV9NPOAxwrOHz+1ob2KJ5sfc80Imi/A1y0Yh1N/AFhWd68TVbJefNfnzzQm1j1yWvttjm/1SthqL7rj3mCXtYBGO2hF2teTIw6zr+ev8uKsRFqNagXiZnamY5TFnGkkWFZNQLmUcEP3u4tOt1C92Xffh9BJiVJIGfeG+XlIJquY7rj5z/d3koLtz/DFgY1VlqbcZ8WEJ9SP6rGSEEMFHqkHub0SEtNTYhcFF9lkXLqkFzrAqY8w8xD7GOTzqRvYa6AMOYoYbxkb8lqP1sj7q82ZJ29T8Hqw/966I37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouFNv1+ruVCU1homRAJloW2ZFsho2kJ6j7xEAxoEAYQ=;
 b=gZ9Z8KTtRCXN+sERlW+E/U56OcieE/9QiWCNSo6+TwsOYrLmnj046o2yirbMOTqa/BSCtnHynHvzAW8P8QT/WqWtx2UxgLViH/6XnBJg0HmzcdbGk9Mo2jmUOd4PlL4m0QPapNVSPfUNwBKQen1T1PsL67ac/t4mW2X/bvg/cCDSM2ZmaIlKp2yVmQS+VP9Vx177Jr5+IhbtHhP9VH2csJgxjFutJ5S1UmYVr8xjb/T77uU29hjZp+xd30JXk3jt+8WtDJD1mhIqC2TCmfpZc7zm/Ksfeooz3P+zbjvMD9QNF4jFv6GDFnRMufPiHkoshfHYO3Sldm/VknMelSkFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 19:12:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 19:12:09 +0000
Date: Fri, 21 Jul 2023 12:12:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v8 2/9] drm/i915: Add the gen12_needs_ccs_aux_inv helper
Message-ID: <20230721191205.GB138014@mdroper-desk1.amr.corp.intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230721161514.818895-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: edef4945-672d-40b8-4f8a-08db8a1e6193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9gtwIBDS+torzFNGpDNNf1c1VwjH3U2Mqv82yLUqPghGKa5AvWE3mIlinCbzCcb0hJ8WG7AAD6foFaNGPeoyCWhuwUc7lqPZ64SkW6a8gPekSuXrJj+EEVeJlVvhf+JYq/9yKN0C6ZfEsFS++15Ll6WGkNU5LIA4kEoXMGGQ38db3xiIbXJw4G/7PyExdVfaStQfgxLwphBDXXOw8dct/mc4BqBo+fVe7hEZSfSkuLG5AJcF/hgCpoFETE1JZI4bN1bZSZokKQu0/t1y/q6lVRI9kYgWUFQXMano+2E0MySM3s73lgXZ131gCk+Z2diVEo7eJuwGIMumtlfuCQIymfB/hx7A7JOtC16hxMlYCXN6P4xZMtqDckdgqVk5c6T42SiFD1HI9ZIbF3j4X84FC6HsyKH2g5yJiUudSFbTFKNBKr8/RHOyF7lO4bAdKOp+JKFy7tR89P/2Y98DcbGnAuW9oZ8JqLu/xkNYu18kIP5QHi8L/EUV72m2gNebcBD8k7Hs46WapjVe5gVmULrUAvV+8LuelPzsooh3bppyZwEv9vfU3Y9sHtwFLL8Qcx1R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(2906002)(83380400001)(82960400001)(33656002)(86362001)(38100700002)(4326008)(6916009)(66476007)(66556008)(66946007)(1076003)(186003)(26005)(6506007)(41300700001)(316002)(478600001)(6486002)(6512007)(54906003)(6666004)(8676002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m2UEky/aa8DXTQJUKBavGwf33oPAuiRMk9GdlxjCEaRAr+C1oa+/odAVfsmB?=
 =?us-ascii?Q?HbUgW9ml/OKMHNQ3MBJ11hDpTkCPZgCGX5OJH8P+qqgRHH0LyqU8rdafja8e?=
 =?us-ascii?Q?ml28WZq6W3cJlNchb4x7BHdMLSHumfVv/Jcp6PZvV0RVLNlYyA6mhv3QbeK6?=
 =?us-ascii?Q?9P/V6b/AxybuCfSUNBpkVyI7HOwO+AKbXGg2bhUEoe5ssWKpp6tPGDM0yg6t?=
 =?us-ascii?Q?fF2q7cSUE/x+ScKOsZTV/9W4cGblDG1w7MKYZ793iYkEKXy6qQDpnO34nu+E?=
 =?us-ascii?Q?s2ypW2M+l2uwSLFKMiaALxPzn+nPNcssABhMctScCeolB9lxsC/Tl0sVt1aV?=
 =?us-ascii?Q?xW0LH3u751mfTXxJChDqFevRn0/WRdddav2f4sn/QoFGTjN4AiBS1wHAAwM1?=
 =?us-ascii?Q?dRwMeLakrJq2DBfTKLth48jpv29A2SW72rR8X/6NgKp0zqjuDaCBAIuw6IBL?=
 =?us-ascii?Q?YNNFPnifckoXYe6prsF5xFelvBHJxiG+XqbZb3Ds0Zze16Uu3lo07E5Hpr5W?=
 =?us-ascii?Q?Hy/xEaF9ZJJRxGTCecjD6/6wZ2XBdubIT/+DHlSXXx1/QMG5AiD+uSOW+S4c?=
 =?us-ascii?Q?EBAmtxJmu+/GeYaks8jIxjWqcrd06Y8dS/qTZNiq4ylqcgG7FzOaUOcWgTb+?=
 =?us-ascii?Q?e38UTUXezCIEDThUjab4EiSauQOA3zUZU4+wNqMYNpQ7KhEWndUvlIFSU5hv?=
 =?us-ascii?Q?H+fYWYFHgTV7eriuGb4nZhOI+PgzNHzyKTFzZCvQrze7haY7zzhpfmfNksTh?=
 =?us-ascii?Q?nyGUPEZ/bixASQWKpH/A4nw4vWuGyYTdf6pdMn/TRecROLZ0HAMeCZuk2AbH?=
 =?us-ascii?Q?6rQqXZcgSJZkMSyhIeCTYVDpU4N+T9gHbjFLlUtJd9sEQUQXI1CoFePka1K9?=
 =?us-ascii?Q?FmhqE2VRtbmkCZ/i+AbNbs/TlBmwYF9+VDDv8l1NU5Mi7uHKmo6SjfTDen9i?=
 =?us-ascii?Q?T3UDvEIZh2B7s3thy2dnj95YV5IFsBzw6HpdVoEIK2gXXMSoi/25KvOKVl2m?=
 =?us-ascii?Q?V9nICLlYWyGNa6nLWgmEaXSOE50rHdYMuaSfEpV6lyrVUzu8Z7T2aNe54b9h?=
 =?us-ascii?Q?zIKFuyBK6oAOG22pZUVCAWfFBFR0OUyfKy2vPMhBbwm1HMrpAsnAZUh+DOQZ?=
 =?us-ascii?Q?/5JIXG1od8luVnC5CsRV0QgEfTO3edwhSeikIRlmqKz1N3iIsC9fB3Qp37bs?=
 =?us-ascii?Q?MQKHtgWJODC5qG+Xg8JpwZOXfws3JY8c01eFRJFzOOCQwS+VS5MczlGbuJUq?=
 =?us-ascii?Q?pRaOXpXqVTPz18ojNpzJRp4zkuXT0NiOnKV92Uq5v2H6UwtRzQCzt/KF30Sf?=
 =?us-ascii?Q?JCZPxOliQuEn95Cd4+q3n8crDu/BuVUYCxly0cbEn337OxsYzP0N3ES2q27i?=
 =?us-ascii?Q?9sonovgtIahbe3sfGROtFnaWhMxkC9WxKiPijICftg9/wj8kJ0c5mIjzZgB+?=
 =?us-ascii?Q?P6PbT6ykzkGNd20GqBBXQUQ5XiGzRe5OopSZjJR7dfOjdR+XhWQQQa4srtyH?=
 =?us-ascii?Q?A4Vii/TDVldts8zc/Q5INi066gaSt0UUyT5q3zTd+XjQ9bs9ZxGik13gmaWF?=
 =?us-ascii?Q?OFfInYo6z/p/nkIY2suh3LASRiThEWGgLkZ4tsV/GLbvZxlihI2uGf+Qfc6b?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edef4945-672d-40b8-4f8a-08db8a1e6193
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 19:12:09.6048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wSMt8VWuAfY5MfHOZ+fujyHR4RVxuOaB1k6BLtDZo9pkNErqGB6UkAL07bQWPkrid9qroSR/I3S1TF8SvojnhfL/pB+2K8rKj9wy1uu5Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 06:15:07PM +0200, Andi Shyti wrote:
> We always assumed that a device might either have AUX or FLAT
> CCS, but this is an approximation that is not always true, e.g.
> PVC represents an exception.
> 
> Set the basis for future finer selection by implementing a
> boolean gen12_needs_ccs_aux_inv() function that tells whether aux
> invalidation is needed or not.
> 
> Currently PVC is the only exception to the above mentioned rule.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 563efee055602..460c9225a50fc 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -165,6 +165,18 @@ static u32 preparser_disable(bool state)
>  	return MI_ARB_CHECK | 1 << 8 | state;
>  }
>  
> +static bool gen12_needs_ccs_aux_inv(struct intel_engine_cs *engine)
> +{
> +	if (IS_PONTEVECCHIO(engine->i915))
> +		return false;
> +
> +	/*
> +	 * so far platforms supported by i915 having
> +	 * flat ccs do not require AUX invalidation
> +	 */
> +	return !HAS_FLAT_CCS(engine->i915);
> +}
> +
>  u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
>  {
>  	u32 gsi_offset = gt->uncore->gsi_offset;
> @@ -267,7 +279,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		else if (engine->class == COMPUTE_CLASS)
>  			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
> -		if (!HAS_FLAT_CCS(rq->engine->i915))
> +		if (gen12_needs_ccs_aux_inv(rq->engine))
>  			count = 8 + 4;
>  		else
>  			count = 8;
> @@ -285,7 +297,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  		cs = gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
>  
> -		if (!HAS_FLAT_CCS(rq->engine->i915)) {
> +		if (gen12_needs_ccs_aux_inv(rq->engine)) {
>  			/* hsdes: 1809175790 */
>  			cs = gen12_emit_aux_table_inv(rq->engine->gt, cs,
>  						      GEN12_CCS_AUX_INV);
> @@ -307,7 +319,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  	if (mode & EMIT_INVALIDATE) {
>  		cmd += 2;
>  
> -		if (!HAS_FLAT_CCS(rq->engine->i915) &&
> +		if (gen12_needs_ccs_aux_inv(rq->engine) &&
>  		    (rq->engine->class == VIDEO_DECODE_CLASS ||
>  		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
>  			aux_inv = rq->engine->mask &
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
