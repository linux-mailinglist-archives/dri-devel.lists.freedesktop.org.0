Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B030587C4A8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 22:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70A810FDC9;
	Thu, 14 Mar 2024 21:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpKH8o9t";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C9510FDC9;
 Thu, 14 Mar 2024 21:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710451184; x=1741987184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jQTZ8rzl989iS4b3EXVSqj1SqsS1PH7y53nL1QEcl4Q=;
 b=EpKH8o9to4kiPSxxuDo8I9Gqkv4GelFSqSmBPNZqFz0GVjnstbU7eGy+
 jX2ZGW7KHc6XijgPIiGRHk0D/x1E28HA2Z4mtpEn0o5/sUavHtuHnrXn2
 hEhDZkSEYBovgExgeYk97E3BFH7MU1e4ORq1HTB1v0CO2Q7c962fQGm9R
 ED2TySMHG1WIf2SZpxAGiqwoe8gmpWRO//f/oMcaN3wrcQnzCLylKzYK1
 WDNQ20oeZ+PVghSQyYdJNORUA7sJkRnS789WVAS1lLwcutT6FJ1gnM+U3
 riw1t9kkBfbFQlIDOjfLyDl+Gz7AOXoLVKhhzqJzRG3PeaPTvYe8FQSzm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22817567"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22817567"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 14:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="17121918"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 14:19:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 14:19:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 14:19:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 14:19:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 14:19:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZahy28QIKCtSTSKylkaQGP+oT1NRx8K4pL+xWzemeej9zRzYl1cXyPUOulAG0KKtc2gmTOMwfjqthZjmzQtw6FN0Ay2TCAqMdiqFh6Lv0pwatDd9RLqeWlL3XzORc3D9AWEWBoBPDAUJxPS/SXZ885UdzzPBlRwNw89aUVapmqlopoGhiv9F197NlVxFaHXOJ8sY3i9foJzqp3nB3+0QYtKtFE3h+GTsoARPzWTiyrxhgMMQ7csg6SNKJ3AXqQcGkVp20gLdO/Kn2cndPxZ2kkukpOMBFgpDXJwQP73/beu7U09wdDcWqJVkyTCT0Zhc2cSgDq1LcsgRPbl00GV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yIZuOshq7iTWjLUQaUcyLdnXwPKXBfk9+lwsUCzN9c=;
 b=C1fJe4EoCmIbunzxK7laLBOf1OiomjzGLqiCksfQ7nsQ7xbBno8dTS6DRsslhxSKzdsfpLxHVNMEA7yyCimnjnyeyajmrCgR7KvIGAne6Gh+go5b/n6/fYiRtaFBQulqwZNpzD3t3XvilY254qYzy/qBibmYDLxa0AUTa/e3itrEKPHTPvws3RYQi30nshljXjybXu8/oau4uxG97TQZjG8wmjGU+kPvcgvG421LrQIWmj76BQchwl5qolMlIjk1dvZiw1JpjRLoZKEQXWAIj3KvKww5Fu/nY333VmSuW7XEe6vkVD4/CYkZFlllBbWJS30183JmXycbusAw0MlvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 21:19:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 21:19:31 +0000
Date: Thu, 14 Mar 2024 14:19:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/guc: Update w/a 14019159160
Message-ID: <20240314211929.GR718896@mdroper-desk1.amr.corp.intel.com>
References: <20240308020129.728799-1-John.C.Harrison@Intel.com>
 <20240312162449.GH718896@mdroper-desk1.amr.corp.intel.com>
 <5d68e959-7c4f-44ec-94b4-51489f3dfdc7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5d68e959-7c4f-44ec-94b4-51489f3dfdc7@intel.com>
X-ClientProxiedBy: BYAPR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd365e0-236a-4c34-64da-08dc446c709f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GTHyyaIVvp7fZlNVRM20LvEVbK6k4sIoL2xy4WIPlTeLULHKmkbS0ajWkYrMv23E1aKteYiHutn3le2haqrG+ABeta7R4Mri0DaJe9t45x5thQXaiJYLYEZpoC5WzVL09kxuioyMXO4aW1V5eL8z8UKE7P95eUCblu2alpxDGua4lfKHyxB4rRDhCsxI2xJ0GqNnf8nsN3yOgxscpz+1opAyTXG+FAqpA31aVIAdYpF1bQyV+vcs/6/x/hl8uHoHOCJ9Zaz9OUxvj1TcVknS0/es+FjrcE9gB/iRu+tNRUKpb+HZ6eSBgZj4nC/W9LhdejL4Es79OyXdvAbIcS5SZ6c/+MpsWZG3qao2+BvBf18jBB3lfCOPkM/0uAwfKHfmiXYezogFsr8MkMn3UmNTG7sonpFT9zMeImZgDijJsp8OKp4+Rjw/UmoovwPV01B0Kz4aLp7ZRLVXcPNs0AbhG5W5/+sEXJKI3hxOZPkCnkBr0BzuNqM0KAYBNB0/x5wRhvjcegRnBngkuEPwDKXkSk4dDLnpy3Mws+x+tbOxUIlWN1wBmjtD3gKJlJ+5W7bevDsNuFn+BGoYdt7s6217j6So/+zYzSvssqC+yf91FRLY9ifqckFF3lFOJQO2rNmSSwfNEVQsELHc0CVO0RgWSUhB0I3/oqRe4KTT8ZU8qus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8cS2Js16WWh1LNdfYYEH6vnBGHYHaztY0Y6idLsj7e2Fal8gLP6UaDacJo+Y?=
 =?us-ascii?Q?nCZ6ucVWYFd+xdAdgcUeRd68u0gPc4uwfsqJ1e6K66+7barayDXwGi2fj1dv?=
 =?us-ascii?Q?k5inwIbsH6LxHh8H7i+EYFAkEyZCbGNQjBhRDs3h9Qou2F5najXPPn1EXo80?=
 =?us-ascii?Q?UKy1eZNiAAdzA4vkNh6sHZH4/9nNLmZFGvnvITQDxCvHAZhC/vxGbkMgieXd?=
 =?us-ascii?Q?2jP/NI00PRGORfXjtgfdhhShpR8zhQDKOv/+DD2+ACkisikJiLGTFIpV36MG?=
 =?us-ascii?Q?IoSSK1ZCuYNIQ3EA7kttpnfR+GqxZgjzeYDPefBs5mEWjtdJWBsGZasnunMu?=
 =?us-ascii?Q?ghd/ZwVzP0ZzW+kCxb9pcktR8SBKiBYAdTfZ4QrKwpmRFjzCRZ51JsiIgiyI?=
 =?us-ascii?Q?a8/ZqGaOW4UXfn48Zu6Emk3L4Jgkj0iQSWvzkZrT9O9GaeJMBTqwzZWo/G1y?=
 =?us-ascii?Q?Z5q68+zAoAtKYUh4S+hQCEwZ2tj/4lgHLrUpuxJ+VcuFvRjuihj2Tt2hWQUU?=
 =?us-ascii?Q?XQcCGBIt8FnQemYh6zuzHe19LLhWknTSycLbOHuFIXKlTVOuGV2juHSw/bXX?=
 =?us-ascii?Q?U+5DSUWKjiK9/6/WvPIPOFJxiSKktObrfaYFCApPT4kthZlHX0nZgTn1EyKZ?=
 =?us-ascii?Q?0drAuAk1U1Hdo+VkMJvFC57h9guAi/yUqE+WKSO/AuZWcjyFz2w0EUEK9Nb4?=
 =?us-ascii?Q?aeMD84iFso+8t6Eh+Sx694ppl2WIIOWOec82eFSSHBbQ2mWhJLkgj2aw4kNl?=
 =?us-ascii?Q?x3rfeqNBbx9cpoJTuS/Fu+sRPEEZ9PTsNqZhJv828dIFTEGle0N/18tbjRll?=
 =?us-ascii?Q?0+YCsEsFFlsOSsT99HxvviVb6m9a7DkmunGFLc0lGeHVHcN1lpgsok60vk+l?=
 =?us-ascii?Q?rTbndbNXcAi+9UVRiV7fY1v2vpjLfFB/DBqBg6F8K6Rhg+Zz5KZVOIHtEPtn?=
 =?us-ascii?Q?H8rvTAn5dzGXIAtJsux8YHlnUIzu2qSLRQgl1y2GUr1efpHvlDzMfDfbAyB6?=
 =?us-ascii?Q?4CFBs0NN7mmKfJamC1fSchFfwVHHBo1P+0Q3CBHCOCKmoneXhPG+mUuBvdY8?=
 =?us-ascii?Q?9VTNOBifl2J+F26wSLD4TlDzaqrBficjDYpZVdjpf/QAC0k+4EKEgbnon8pu?=
 =?us-ascii?Q?WvNgy794AOdcyKn59iHK7mVDQw+iZC1vO2oLhGnmg1hAbKxo7q6fn3MBzw2o?=
 =?us-ascii?Q?/IFg4pbiAGTCpfaDPXXgFXDeSXQw+Z6mBUciYELJJl2eMXStEeMULi0sab7Q?=
 =?us-ascii?Q?oslMgLDfmyWNZxTCDltewr7ZO8gVKDQbe0Tbj5ziiD2y2ffN7TLAIrnOI4g6?=
 =?us-ascii?Q?4NBMZzD3cq/XXookcNVymIypX40WGMsHYg2EwjUjjTA57WlUDfd13aXwynE6?=
 =?us-ascii?Q?TPWPlUtuomL9X2Kj41Sfh/V+yqd250mLMPXoGhBoJZT/fBhiWNfcYrxQFCEO?=
 =?us-ascii?Q?cmHArbWTG/FJbehe+xL6eDCMbOnf3NQVKLM3R05dsFKh0ZxHGljYPa6phiRB?=
 =?us-ascii?Q?K8swnkOFE60dZ23nucKTmoDxXdyg7sJtcQtAnD2zAsKjS9tpU0rkmoHAgOFA?=
 =?us-ascii?Q?jhVJV3k/NCqzF9WAjKikNIL4Cu/4cTsuVj9CIBAdsgAst4soJEE4bTZAV7dx?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd365e0-236a-4c34-64da-08dc446c709f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 21:19:31.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7t5pE3auRYeOGoAXInNwBFqbVJK9o0jzDU2JPtqw+AzpdCaBMv1biPhjh81Cr8zr1rKpdOee2Aux+NNQGwRpNDTSi2otIBRzkXwExbzvkU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
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

On Tue, Mar 12, 2024 at 04:43:06PM -0700, John Harrison wrote:
> On 3/12/2024 09:24, Matt Roper wrote:
> > On Thu, Mar 07, 2024 at 06:01:29PM -0800, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > An existing workaround has been extended in both platforms affected
> > > and implementation complexity.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  3 ++-
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  3 ++-
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 21 ++++++++++---------
> > >   3 files changed, 15 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> > > index bebf28e3c4794..3e7060e859794 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> > > @@ -105,7 +105,8 @@ enum {
> > >    * Workaround keys:
> > >    */
> > >   enum {
> > > -	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
> > > +	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,	/* Wa_14019159160 */
> > > +	GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE			= 0x9006,	/* Wa_14019159160 */
> > >   };
> > >   #endif /* _ABI_GUC_KLVS_ABI_H */
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > index 0c67d674c94de..4c3dae98656af 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > @@ -296,7 +296,8 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
> > >   	/* Wa_16019325821 */
> > >   	/* Wa_14019159160 */
> > > -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
> > > +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) ||
> >  From what I can see, this workaround is also needed on Xe_LPG+ (12.74)
> Isn't that an Xe platform? Or is 12.74 just ARL?

12.74 / Xe_LPG+ is used in some ARL, which is being officially supported
by i915.


Matt

> 
> John.
> 
> > now.
> > 
> > 
> > Matt
> > 
> > > +	    IS_DG2(gt->i915))
> > >   		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
> > >   	/*
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > > index 5c9908b56616e..00fe3c21a9b1c 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > > @@ -815,23 +815,23 @@ guc_capture_prep_lists(struct intel_guc *guc)
> > >   	return PAGE_ALIGN(total_size);
> > >   }
> > > -/* Wa_14019159160 */
> > > -static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
> > > +static void guc_waklv_enable_simple(struct intel_guc *guc, u32 *offset, u32 *remain, u32 klv_id)
> > >   {
> > >   	u32 size;
> > >   	u32 klv_entry[] = {
> > >   		/* 16:16 key/length */
> > > -		FIELD_PREP(GUC_KLV_0_KEY, GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
> > > +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> > >   		FIELD_PREP(GUC_KLV_0_LEN, 0),
> > >   		/* 0 dwords data */
> > >   	};
> > >   	size = sizeof(klv_entry);
> > > -	GEM_BUG_ON(remain < size);
> > > +	GEM_BUG_ON(*remain < size);
> > > -	iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
> > > +	iosys_map_memcpy_to(&guc->ads_map, *offset, klv_entry, size);
> > > -	return size;
> > > +	*offset += size;
> > > +	*remain -= size;
> > >   }
> > >   static void guc_waklv_init(struct intel_guc *guc)
> > > @@ -850,10 +850,11 @@ static void guc_waklv_init(struct intel_guc *guc)
> > >   	remain = guc_ads_waklv_size(guc);
> > >   	/* Wa_14019159160 */
> > > -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
> > > -		size = guc_waklv_ra_mode(guc, offset, remain);
> > > -		offset += size;
> > > -		remain -= size;
> > > +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(gt->i915)) {
> > > +		guc_waklv_enable_simple(guc, &offset, &remain,
> > > +					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE);
> > > +		guc_waklv_enable_simple(guc, &offset, &remain,
> > > +					GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE);
> > >   	}
> > >   	size = guc_ads_waklv_size(guc) - remain;
> > > -- 
> > > 2.43.0
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
