Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36D674300
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378F110E9DE;
	Thu, 19 Jan 2023 19:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157BC10E25A;
 Thu, 19 Jan 2023 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674157215; x=1705693215;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/txFlVQO1LBxQV/dru/1JrWFgiTBsuK6cWZnpC6UI+k=;
 b=IvsgTUIhZXQp3qEcYrmTsgJTr7E8DekT125gYpiFhDdeayrUjGlED1P8
 QqMVtgF32i33Jybnr5B8q4RaHtZ7IlJURhDWlMGhsQziuZHwmtcR3+LNv
 NQo7kDyRMMGS2a8vBpkIapc/yk2vZeIDBiAw5+V+e23+00nyWVSIUoUgb
 ulj/Lonuu4/2A+Y9cjnYqRTa5FH3VYz//0jWIx/SDT4TPzu7C/XyIZBkH
 1AGR6d8QAY1AJnMW8g4bm1Y5BBA8571U4HAypbfbcL1NHvUsFeSBk2ito
 Ak0v263HVoGfsh6XOnNc+fEW9CQZJCBk68EqTYcbdTQSv4ITsC8ORobSS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352655511"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="352655511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 11:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834108208"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="834108208"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 19 Jan 2023 11:40:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:40:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 11:40:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 11:40:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNVSPBfPL8TaOgsP0OAtNd7pv2fHaZnfteEGFoNFH08r4BzmY5O4lw7tskPuNX84IovrKgYxFsFbHTbbN7oshG4yxBFNd2Hf7jv/AhF/QvCw7aBBNGsyizNkJUXMBusUWOfLabA1G4l8D1PlAv7nEBFxBQywtrS0PLWdUivArn5LOiKzIhFY13pkI1mi1xLGYuEHjmvSmeo+JLjwo1zUhSe7pK7cWWPtkPqAUJQc8A5pvoEizZbGKAxnoTF/wEcUScGec4vql/ezaHVbajTQNyyZwgx+s+XZgxZqxVvPbE3ashHlZ/OBYQFgakB/BD2fBzBsBixymNhMUIFhbQqDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1yhBfaCE+wp+IFusuXUd+i6VJU8U1/4QyENzU3pVas=;
 b=CvKcmFNottQeU53/1Mq6HXCJvVt95+aLzlaR1QQGLFiqGBase5mOAQHmm2DsiHqFtT5pOddcBqJPUdlHuWBTPb2R35S12TGkR+KZ3dvLPuVYYWSf1urw8hLkbVW3A7nJwfX5aZFBfO4siAICRY7QcwDeRjcV9m+IxozA6ZAivbhFSx2+4wfGh0nXJLe96kxpwpkgOHYavo9W1wimnIBdm1uWdq8DOfLTgGA7Wd3KoQAVlbKGQzVtBN8WKSR59Mq9c71m+UZI6HdXkhNFnZEh0GmCt3aNVVvckdHKpK0LDTsns1LhBiaoOfPRQyMotrhkfQRAHjgD3Y49VWpp9L6MlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5944.namprd11.prod.outlook.com (2603:10b6:510:124::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 19:40:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 19:40:07 +0000
Date: Thu, 19 Jan 2023 14:40:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 6/6] drm/i915/pxp: Pxp hw init should be
 in resume_complete
Message-ID: <Y8mckRvbcn7lTzrr@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-7-alan.previn.teres.alexis@intel.com>
 <79550dc0-2901-96a4-d6dd-c96926012ec3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <79550dc0-2901-96a4-d6dd-c96926012ec3@intel.com>
X-ClientProxiedBy: BY5PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:180::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: aab003e1-c18d-474c-28bd-08dafa54f79a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Md7scwQlcKsTiID+6fwYzvwCcV2z18H1c6o3hASUBxbcdnaTxzw9YD7V7uQZFTgRUx35WHXFTM5xmYa7lVdstjEDR1LO5uxJifH80zQByCNdgoTyWPxKTzur67Uv9jeTF1ZMTK+CrtgdYrxDHeP6bzCcC4oWQjUCMnSCqZdtLkKvQ8zYjpOgiAXHWP2V4l4byxBOw5h/6zf9qPiTJ0hX64Dn+l6gsDKBbb6Ic78mulASML7oin9AWKE6FuTuEiXNzt7hvOM1otcJRi/Z4s1XoYEYwOEXMxi1VFFFcLTi1I+H5IU3iH5lbigGGVT/xVfwqcfbFY82/592CyQ9rVJyDTz/I6+BWXGoY/a1VjQ9zfSAv0Jj/4ALMHP3iiwW0mNoa0560y06256WmRJ/clG4VI6RgTXlc7Giek6JW51bsbzlMHe+BmJdaKG5Fk01MgCOEfZfFszIxIn940xyRUmMIvXhHNUo5k3bwdGoDzSjmDj0vZlwfcZxGFyc/NLxcvi4R1N+W65mnUd11dyUm6IYsCf/bOKuq1ZJhvTjz2noivF4NIj+O8Z9nhIfr9EGU9Yb5B0YGN2uDpVnq1YR8XhD0c2KWsGZx6tAgoAtxUDMKgkZKhC9j9nIHyNAr/wkn4Iie0KJasAGj/CmqimCR8AE3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199015)(6486002)(36756003)(478600001)(6506007)(86362001)(6666004)(107886003)(53546011)(66476007)(66556008)(66946007)(2616005)(186003)(26005)(4326008)(6636002)(54906003)(8676002)(6512007)(44832011)(37006003)(5660300002)(83380400001)(82960400001)(316002)(38100700002)(2906002)(41300700001)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4v3aBrtD5J4VeLxVOjAyVFsI5Ppe3NPm/4h6htQaSSRbpB2rS9CrpUWQAS1w?=
 =?us-ascii?Q?9WDdpI01OqY053Onl21iylYeOp5cqdvaPpLeRNB/L8TUI0B7ZRGD3BR3wude?=
 =?us-ascii?Q?1BverQYtk6iVGm21hAHe8hprYQtt2pB5FbZx8fzuSIzqASlzVQm2TheQo9kj?=
 =?us-ascii?Q?oU9ZdP06fhhmoqm4sRzDFAyWDLufDRtN3RRUmZLi5emqe1qXFAponorI8RdG?=
 =?us-ascii?Q?FQjkms0IjQww+doV5D4Fl5HQy3Nzp6OublwFrsd9ku4qSpppakS+hZzPx5Oo?=
 =?us-ascii?Q?PyulLpBhOJVZR+TCAA4bDk+EslfwsuM11visRr4zws2ify/kxSX79WooDOX/?=
 =?us-ascii?Q?BN94Er+acgsL1mcT5nGTJZJ71Nvu6AWNYOorX18RQXiwGHyott+Bpje/JvYW?=
 =?us-ascii?Q?nLnfq/rEFM1ipHPLPpEYw7j4N581QgqvvU4StJaqh+VOiKMHEe1g77SjMtFg?=
 =?us-ascii?Q?5Eu2qy7vCHf5CPoASKMZ9/82rqtTDwG/2EMY+TkBQC3Cf+cGWI+o7PnUBzaD?=
 =?us-ascii?Q?+nnPANqHxj9X6g6xK+FVJ3DVwvWDIFm0xRRrcikqhGOW7nj/m9N8AvjYLJq+?=
 =?us-ascii?Q?SrzMu6oO74aNMId+wcksJOY/DuHxmAI6fMpUjOtRaPZ3bZr5MstqxhxG/Fjb?=
 =?us-ascii?Q?k/TA9R6fpfceOmP20Q3xT8t7Qwl0gBG7GOhq2/mSGsUX/4CQ8k5EwiVwqL05?=
 =?us-ascii?Q?8e5/SLYc7PWY2qKXnEKfR4C+R9684YdghmgXPiNjnJiqFB8/szEzaEQ852Dr?=
 =?us-ascii?Q?iFRp1Q4a3kmHy67HzyDE67j5ghma1FRmU2Qg7aTzRJ7X3xfuIz3xo1LL+jlZ?=
 =?us-ascii?Q?cDTrWx3Q5B5eRS+K1NR6mwmhFRjwha4/A76RAWSk6gcckzuem9QcECSsfDfM?=
 =?us-ascii?Q?eLtH48vHnWAEeIzhxsjg4R2BdL9sMpmIomBveuUw9tZevyNgoSJX+JgqDYy9?=
 =?us-ascii?Q?aK37/hJybuFpUjjzVVPP5jx4yNpyM9KGiOjWvoxot7MThiik7Ga53Rlbo3RN?=
 =?us-ascii?Q?s0Y/ayvDHsAst9hQNiVv9yDhPVFJTb7zFBsWTV38rTmrV/QH7HdeZKh4T5ML?=
 =?us-ascii?Q?NqFQhnO1GfOrGiI3F3z+F+/8oiw8ApEUVIRj3PQykoK/jgDLvk/WgZeU0q6C?=
 =?us-ascii?Q?vD1qe7zDIHztaoY/8k7Gyx/msI9VW+DUyABc78ez0Z6DEuK6mPP5FaGQBvGv?=
 =?us-ascii?Q?fCL9p1LdKC0nCtXQMKrmZmOMzK/u88/BBUCdnPykpaOBj5Te+4XtDTqQmahG?=
 =?us-ascii?Q?cZCwAMOskZnlLt0nsgEh34mbBpmqtg999Y8vrM+xug1p6LEe605ClSiB3m32?=
 =?us-ascii?Q?SOkiFQ+lLeGZ0pei5pWEQFSfwvGel+l9hZka9Ie1I9X82kXuc5fj+Yf8l0Ed?=
 =?us-ascii?Q?93WKv40V0/mnoW1rm1qO7H92Kn4T3QF99EQ7kLYLay60IdEoD7IMDKyxngie?=
 =?us-ascii?Q?YZnPG1lZUdHvViOlRh9W1crpamYhC48eJIDpbLzCl2hNYJ/pKdJvt5BnUzZQ?=
 =?us-ascii?Q?y+X23KBM0pFvF7z33mRo4sA3W7iY1inNtGzU6gv3vnz2Q0spmrnl5Q+5lKIg?=
 =?us-ascii?Q?fzOYmidn6+TdhaplqVxlc/8szQtlF+CqNvdPlBlXWVmRyZsyraiJOX+vSjUU?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aab003e1-c18d-474c-28bd-08dafa54f79a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:40:07.2100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DW5T8OuvZfb98OjVguZTP6Js+7R4yltSi0R7ooiLFcdYoewFvH8glScXH9sOk1ZTF8RAARUjZHdot5FozCgUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5944
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 11:10:21AM -0800, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 1/12/2023 5:18 PM, Alan Previn wrote:
> > During suspend flow, i915 currently achors' on the pm_suspend_prepare
> > callback as the location where we quiesce the entire GPU and perform
> > all necessary cleanup in order to go into suspend. PXP is also called
> > during this time to perform the arbitration session teardown (with
> > the assurance no additional GEM IOCTLs will come after that could
> > restart the session).
> > 
> > However, if other devices or drivers fail their suspend_prepare, the
> > system will not go into suspend and i915 will be expected to resume
> > operation. In this case, we need to re-initialize the PXP hardware
> > and this really should be done within the pm_resume_complete callback
> > which is the correct opposing function in the resume sequence to
> > match pm_suspend_prepare of the suspend sequence.
> > 
> > Because this callback is the last thing at the end of resuming
> > we expect little to no impact to the rest of the i915 resume sequence
> > with this change.
> > 
> > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_gt_pm.h   |  1 +
> >   drivers/gpu/drm/i915/i915_driver.c      | 20 ++++++++++++++++++--
> >   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c |  2 +-
> >   drivers/gpu/drm/i915/pxp/intel_pxp_pm.h |  6 +++---
> >   4 files changed, 23 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> > index 6c9a46452364..fd1a23621222 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> > @@ -77,6 +77,7 @@ void intel_gt_pm_fini(struct intel_gt *gt);
> >   void intel_gt_suspend_prepare(struct intel_gt *gt);
> >   void intel_gt_suspend_late(struct intel_gt *gt);
> > +
> 
> Stray newline. With this removed:
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Daniele
> 
> >   int intel_gt_resume(struct intel_gt *gt);
> >   void intel_gt_runtime_suspend(struct intel_gt *gt);
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index c1e427ba57ae..4c68a3f26e96 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -1170,6 +1170,13 @@ static bool suspend_to_idle(struct drm_i915_private *dev_priv)
> >   	return false;
> >   }
> > +static void i915_drm_complete(struct drm_device *dev)
> > +{
> > +	struct drm_i915_private *i915 = to_i915(dev);
> > +
> > +	intel_pxp_resume_complete(i915->pxp);
> > +}
> > +
> >   static int i915_drm_prepare(struct drm_device *dev)
> >   {
> >   	struct drm_i915_private *i915 = to_i915(dev);
> > @@ -1370,8 +1377,6 @@ static int i915_drm_resume(struct drm_device *dev)
> >   	i915_gem_resume(dev_priv);
> > -	intel_pxp_resume(dev_priv->pxp);
> > -
> >   	intel_modeset_init_hw(dev_priv);
> >   	intel_init_clock_gating(dev_priv);
> >   	intel_hpd_init(dev_priv);
> > @@ -1563,6 +1568,16 @@ static int i915_pm_resume(struct device *kdev)
> >   	return i915_drm_resume(&i915->drm);
> >   }
> > +static void i915_pm_complete(struct device *kdev)
> > +{
> > +	struct drm_i915_private *i915 = kdev_to_i915(kdev);
> > +
> > +	if (i915->drm.switch_power_state == DRM_SWITCH_POWER_OFF)
> > +		return;
> > +
> > +	i915_drm_complete(&i915->drm);
> > +}
> > +
> >   /* freeze: before creating the hibernation_image */
> >   static int i915_pm_freeze(struct device *kdev)
> >   {
> > @@ -1783,6 +1798,7 @@ const struct dev_pm_ops i915_pm_ops = {
> >   	.suspend_late = i915_pm_suspend_late,
> >   	.resume_early = i915_pm_resume_early,
> >   	.resume = i915_pm_resume,
> > +	.complete = i915_pm_complete,
> >   	/*
> >   	 * S4 event handlers
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > index e427464aa131..4f836b317424 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > @@ -34,7 +34,7 @@ void intel_pxp_suspend(struct intel_pxp *pxp)
> >   	}
> >   }
> > -void intel_pxp_resume(struct intel_pxp *pxp)
> > +void intel_pxp_resume_complete(struct intel_pxp *pxp)
> >   {
> >   	if (!intel_pxp_is_enabled(pxp))
> >   		return;
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> > index 586be769104f..06b46f535b42 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> > @@ -11,7 +11,7 @@ struct intel_pxp;
> >   #ifdef CONFIG_DRM_I915_PXP
> >   void intel_pxp_suspend_prepare(struct intel_pxp *pxp);
> >   void intel_pxp_suspend(struct intel_pxp *pxp);
> > -void intel_pxp_resume(struct intel_pxp *pxp);
> > +void intel_pxp_resume_complete(struct intel_pxp *pxp);
> >   void intel_pxp_runtime_suspend(struct intel_pxp *pxp);
> >   #else
> >   static inline void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
> > @@ -22,7 +22,7 @@ static inline void intel_pxp_suspend(struct intel_pxp *pxp)
> >   {
> >   }
> > -static inline void intel_pxp_resume(struct intel_pxp *pxp)
> > +static inline void intel_pxp_resume_complete(struct intel_pxp *pxp)
> >   {
> >   }
> > @@ -32,6 +32,6 @@ static inline void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
> >   #endif
> >   static inline void intel_pxp_runtime_resume(struct intel_pxp *pxp)
> >   {
> > -	intel_pxp_resume(pxp);
> > +	intel_pxp_resume_complete(pxp);
> >   }
> >   #endif /* __INTEL_PXP_PM_H__ */
> 
