Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA4B75D670
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 23:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EC110E706;
	Fri, 21 Jul 2023 21:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072BF10E08F;
 Fri, 21 Jul 2023 21:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689974654; x=1721510654;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=50XH06/VZqkv1S562fBAHkuPil+/Uu93XxTSdq+mBMM=;
 b=MN7EzgygAJx2gZ3+yLq96yB7kRAK+rHtxMyj/hbZLD0U7tlShK1/OZN3
 JT3AidVjzByijp5O/lOGTIv2ow68zGsN/IbbV8x2He9mLbXK5dvo4kpS2
 /Ec7u0zTKKQezthZgB3sMAHzvE4r0EQ7hncKPXEbGfpRHJVjt2rw/4qD9
 D+AOdPpBEVd7SRTwzRHK9MbsCTWKQSkTXkOunBaAwy+b3BEFL9Je2Yv94
 bR7aAV0cjCKiuUwwlJGO6KGAGHonj2U6Feits7Hj0ovIOeBiBJXYE7JGi
 oG3o7RfCHEjLExHM40Mkshxl3HSbB1kOISFZ4RimHmMw4lgjkEYFdhpIe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="453498492"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="453498492"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 14:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838702654"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="838702654"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2023 14:23:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 14:23:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 14:23:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 14:23:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 14:23:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYbBRlXopF1f+srq2OcLTfc0F2xcW2aFHUN61Zvs1VgZLBzx5RHZN2xujvvrAJDj9+yiSeL98fY/mk2TIkopT282awy9qyPua7WQ5Z0jUPssh/dkYOR4vqDMIx9SgZ6KxlJDNIw+Zn7vaIu79P+NoEe2jh5ugWzjtrVISUP8+0yR8NWLJSFJ43c220ANonpaDYczhrgONJgcOj3mwTCm/KycFvUiZgEcpFQKqGshEHzMDRmhiczdv9YtqyE5JA8xOQ+9knI7HQ0kUgoFfgeICBnNwxDa9d2QjrXVn9PEA/2JhpzSrj8Hkpqu976bFAZ/tRVZ45FWoJPGUi//KWUP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrN4chh2vxkUBspMqpewdpnQCL5zIRAUpLjJDVfOuFI=;
 b=IolHO9pUImOe7ERxDBL4sfI4ZzR7QN7PKdBRM6l6fFvG1nVP94hitWMWPcuOJa+Jhff2/06P/DQ7V6nbFUYk3MpRy/5+447Fp7qdnZXlkSSh3tPKeqaxrN/mShhe0r03E6lNRB9ddwuPRbHt6wTDFfRmZ9k7cdohiZPodjW76np+ygXnpgqso+mYYliLw+nUYks+eyog9CVPrZKEBL9GqKfCN1mgPOD0PmjHY1+IPF/IaH6DHB+H3+jTx8gO9kw485lhZoxEvYxLEN5vYP2QMvx4EbgukNLW69fbuVtVa56RGpFum9WORxqva0/ZvZLb9YWAL6aodudloUD7xVLPxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4966.namprd11.prod.outlook.com (2603:10b6:510:42::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 21:23:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 21:23:46 +0000
Date: Fri, 21 Jul 2023 17:23:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Restore efficient freq
 earlier
Message-ID: <ZLr3XJNb2JdXcyvp@intel.com>
References: <20230721180349.1737284-1-vinay.belgaumkar@intel.com>
 <ZLrtcwN1TkUk/yxf@intel.com>
 <3ba54e32-f1b3-8c31-1135-f6d754269afe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3ba54e32-f1b3-8c31-1135-f6d754269afe@intel.com>
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e91ed3-917c-4be7-d984-08db8a30c420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cNw5j3WtkanQ8XpFW/XMG+tecoALpkdpPbEO4Mx2UXMC/tgcbekmcZxf7i6V/Ro6Mv7Hcia43NqUusE7IJo9vD1fnkpMgZE8+LQdZMAxj96QgfWABCrO+23ZWhvTTl85IlCx7V22HjcnqZ4yS8WMsOHpclQ16+Y/8fEnxUErhb7m1hQ525zdxq6zarFKL1ep38KzBZWr9rJWmhnUdHXPaHXfpAvddTBxRyFqpuJd73XwibS+HEExxjl5u1EM8YyVKY7KzfFEYwWo+afJYo0sN6TppxrlG9sYKwe/RYn3jagUWx8E/kWbHgH/X6RCGpX6ditt2jfDqxw9tMRN5Or82/4nyydnP8zNQAxmjlBW2w6TlWrL1FiAo4wEOXp4sA10TChA1FdClcJ3OCKY1o6mywgq8s2iwYqDYDVZBmHLXcaQ8KIu2d6QsNbs6vkR8arG2bMPQrcj7JI/kejQwkXDZe8Cmwlwx2dAgOWOhLUy5SmWOmtsdXPP1vLtdsVJD+OffoVobZReS23eSGyFklu5JnIfK/As0PGZWQ5s/5E1oI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199021)(478600001)(6486002)(6512007)(966005)(82960400001)(38100700002)(186003)(5660300002)(44832011)(6666004)(83380400001)(26005)(2616005)(6506007)(41300700001)(8676002)(6862004)(2906002)(86362001)(36756003)(8936002)(66556008)(53546011)(37006003)(66946007)(66476007)(6636002)(4326008)(316002)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hQ3JOeK2ZbSQMDufJU+3FRjj1NmVyHn10MI9oqfnhu5U7H0Aeftr2yHbD5jZ?=
 =?us-ascii?Q?bxzFh8DIC3MUHIBFlXrSRzrvpnrGCCYC6zidGZS28zokP/qF/KsrgCyBF8HQ?=
 =?us-ascii?Q?FWZd4XGXtC8QRgT0Xnv+x0miPLPoxKtp1K3bpHgQzFpjz/m55gFozBx9f6F0?=
 =?us-ascii?Q?px9YR1B3Unz5PjskM5FL/P9xcfB5mpw/gT2JboBCrBCzZQV7ip05jhEKAB4M?=
 =?us-ascii?Q?hIZEUE3AgqzBAvTrxIXN3jB4ezeOmGB5b1AL6Id/WPwz4t3/9FJpCL4yC6pe?=
 =?us-ascii?Q?YoTOVw5bdUaGJBiS4etVHcZdG0bB/5jCOtROWCqRdfMF4o1qAjmrOvGGUpvQ?=
 =?us-ascii?Q?4iDYWFi/GAYvt2cVEYxcnSA03/FTN0hDZMFm4RJ8PEGNdaLWk9TkxFUUNjp9?=
 =?us-ascii?Q?xPhXZbE7QRpUbt2dOuW0C8BtL7e2jINFqo/i/V7fncLOCjYTEA9Ea7hTKdE0?=
 =?us-ascii?Q?BYQb3C+SMkbaIwpPte38fJFA6z/lqTtjjmHH9HkH+CP1URRWZLnDBWjvgqZ7?=
 =?us-ascii?Q?wUkyoeQB0CaRrN6f/nqwuRKe//TGBt7bGO8uyMxLqRiwFYphxRnCMQ0Zu/fm?=
 =?us-ascii?Q?1w4mZvK4uflMVQB1mpL5zvW8Rt0Ht8XOL2eHVpwv2QTPyWi4PeayZhDn4B9u?=
 =?us-ascii?Q?L3ah5lgtlz+KQhrmxRmk+CZzXb3x0h8ALAbjuF6eOD9ZNwO36++D1D2gEGB3?=
 =?us-ascii?Q?CM63CtNWZT+jo4FH4Rm2EvMjK3PaeFgLd6KU5VpdZFqmUH4PcfA7iJrl5+ow?=
 =?us-ascii?Q?046zBZqign02N0VvSm+luzI686wUzn2U0ovpR3ZN5MpHfnXL5jA7RdrKJ7e3?=
 =?us-ascii?Q?MkNbqjLtsJ7DyA/didInGO4BYdQyJfvGAaxoIf2UTizq8UjA63+Zfa36g2OY?=
 =?us-ascii?Q?4mkpFdXcb0TVjq8EDFLEw5obHK4otMYkIa5WLSeLAIgT9FRGmaeY1AO8R11w?=
 =?us-ascii?Q?JsBmoHD/BrLBhcphd7Kk2mU/dH9LnHkGxHCVE7jrJUeRwu9rWbDB3aiDzMHU?=
 =?us-ascii?Q?SGQbcEuimxUwUenNYpw28pKUKaf0G3hVxnKf18egkb5H26jwHCSVg+jw067+?=
 =?us-ascii?Q?yWaUHYORsGezZaI8FHsHTfE9r04jT1K69AJQcAxGy1rtIaIOAFnUw2KHEKX+?=
 =?us-ascii?Q?ewgGQDef6nOMv5zkgY34BEnO2LQXPXBBh9ERT7Ry8y8GwoRIXpLJPzgaylRE?=
 =?us-ascii?Q?d0aZhgA7yfJFY2rhLEp5HAntALj3uMRigYjUgQZ6bnZWw00ITl1wMzhe7d+e?=
 =?us-ascii?Q?yYHIgt6B/QIGgviYxp0SJQlCHeAp3gBGp+xBBYlLUIEGHYp9UPJmv9Ji/Ey9?=
 =?us-ascii?Q?wo2UsBadSAVDTlIz4+gjbJXRDQBNnJnULlWvB2w+0qMbFEyDJSagrm3w9tV1?=
 =?us-ascii?Q?tZ0VCyZnHQPlWQM/GoPvgbVR8W36aRC5GxI2/N1Q9XoQREiBerpyUzmTLmDq?=
 =?us-ascii?Q?rLuV0d3vY6L0rtYvzFQupRy4yFiasBIBOrf1x6hxsVQ6cvHaOL5/6OThp6q5?=
 =?us-ascii?Q?LPuw/VO2yo5zmR3cDhNdYM03Udb0di5LvWHSLrey/kBx028iJ1W8fCwnYvgE?=
 =?us-ascii?Q?dmXBzE5AQA1t7PDYwUj/lx2/lmhw03Rc1hYM6z/lSDA6UWKSujpQYYqPAkd4?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e91ed3-917c-4be7-d984-08db8a30c420
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 21:23:45.8920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uE1PMynhurzV3qV1aSji9r1qbdB+5TdFLQ4j0KXD4gmgr/V18zQPFBalTquWfbobn3VLBVfPxgTBog/cbf2QBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4966
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 01:44:34PM -0700, Belgaumkar, Vinay wrote:
> 
> On 7/21/2023 1:41 PM, Rodrigo Vivi wrote:
> > On Fri, Jul 21, 2023 at 11:03:49AM -0700, Vinay Belgaumkar wrote:
> > > This should be done before the soft min/max frequencies are restored.
> > > When we disable the "Ignore efficient frequency" flag, GuC does not
> > > actually bring the requested freq down to RPn.
> > > 
> > > Specifically, this scenario-
> > > 
> > > - ignore efficient freq set to true
> > > - reduce min to RPn (from efficient)
> > > - suspend
> > > - resume (includes GuC load, restore soft min/max, restore efficient freq)
> > > - validate min freq has been resored to RPn
> > > 
> > > This will fail if we didn't first restore(disable, in this case) efficient
> > > freq flag before setting the soft min frequency.
> > that's strange. so guc is returning the rpe when we request the min freq
> > during the soft config?
> > 
> > we could alternatively change the soft config to actually get the min
> > and not be tricked by this.
> > 
> > But also the patch below doesn't hurt.
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > (Although I'm still curious and want to understand exactly why
> > the soft min gets messed up when we don't tell guc to ignore the
> > efficient freq beforehand. Please help me to understand.)
> 
> The soft min does not get messed up, but GuC keeps requesting RPe even after
> disabling efficient freq. (unless we manually set min freq to RPn AFTER
> disabling efficient).

so it looks to me that the right solution would be to ensure that everytime
that we disable the efficient freq we make sure to also set the mim freq to RPn,
no?!

> 
> Thanks,
> 
> Vinay.
> 
> > 
> > 
> > > Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8736
> > > Fixes: 55f9720dbf23 ("drm/i915/guc/slpc: Provide sysfs for efficient freq")
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > index ee9f83af7cf6..f16dff7c3185 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > @@ -743,6 +743,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
> > >   	intel_guc_pm_intrmsk_enable(slpc_to_gt(slpc));
> > > +	/* Set cached value of ignore efficient freq */
> > > +	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
> > > +
> > >   	slpc_get_rp_values(slpc);
> > >   	/* Handle the case where min=max=RPmax */
> > > @@ -765,9 +768,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
> > >   	/* Set cached media freq ratio mode */
> > >   	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
> > > -	/* Set cached value of ignore efficient freq */
> > > -	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
> > > -
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.38.1
> > > 
