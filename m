Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9AD6D87F3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 22:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360BD10E4C3;
	Wed,  5 Apr 2023 20:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D9C10E219;
 Wed,  5 Apr 2023 20:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680725562; x=1712261562;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PjzWtUU6tSlSYFoPYrBOQJKBlvAAnwaGq+nrLMEfidQ=;
 b=PoFlR57Lq9XkuZRgchIvFne/+FyLS2ZN+hUn+M+uNi9/Dk0lkgcs87o0
 2g4pjPJJakDguNWDdelrRh78D1xiY/Ozd0YVfQKZKiN1sXp4x/G6YJMBn
 EJ33xE37r8IEHsj8kYfn4mEyi4ChRAHchjRCEY8FGTFqHu9SZvXxN5CQ+
 gXiIXh92NgJhdZaFGC9T/0SGDCjA0VO7TbREm2RORGnnk9zeZDtWC6LXR
 EOvvPy19PTRFCD/5g4DvaZj9wBfAMtG6q/q/lDQFTQ84DqR1PB218xn4o
 XZtsnGEdYaYq8hCDqYHNhqlPbAKVBdQ6CfKF266FXfd0ulsVyMN5ETZ8q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="407646612"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="407646612"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 13:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="798050181"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="798050181"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2023 13:12:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 13:12:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 13:12:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 13:12:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 13:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSeN8ZVTxdSNwv5/MSZJOQsrNFEGJxm3Ny2mGFN6IQa2XFp3HpKLpZgXah4HABkM3OvVlG4NvGbzIuqi/5flu4DLvN9U4T9FBHB5AsyrdPhprFx/JK6I2jksvrmgc4kxJJYJv+gPy5Tx88H4AXnGjrlgFDbbjZbLC05nlCVeiopI+FVXRFWsdX52XK2F3uDD+G1WzPavzBr0jiHPxAJxWhLGX7uDF4IUWe3XtRJE6lqG52EqT0KEdFzFESXs+C3xdDj7JpkHwVacAxcMBZK3fOdHvmFfKCpUhniz0VZKSdDJ9xDvXpEhX01zke8XW5vACCBQsxjrPccVHkoyaydrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa/fvvCUaIC/uMdFoCEYtIvTSWO0U+KlbjPxfz/VapA=;
 b=XhtzA8O2s54qdZbCnigAtoBFM5P85ag1yHXwdpm1TsdRFpkBPkiopeka4HY0yz1Ry2x8vckKnTVhcs/a2r6DLJcxLk/mN3u9Ib4TkwBr/horKwgtromwXyMPx7/iQvPAdf+l5x1ui7/ExQfwxV1lKGFzxPTiAlUkUuCjaOmw5Fei8HH9sfVNAaw8mfO0rYaffqqXzULshpEH1UntOk0C7vl5a4btFPqOrnDfJNu4x8OsejEdcPS2NpkIXZKC+qoWlIXxaHahzhDFTySm8o8SFr/iEQkLxkXxg9osJdSPll3fPlEFWp0cdMyAZT2EAJICmp807GR+17iYhW5jz+eMcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 20:12:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 20:12:37 +0000
Date: Wed, 5 Apr 2023 16:12:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH] i915/guc/slpc: Provide sysfs for efficient
 freq
Message-ID: <ZC3WLZvH6a4Q2o5Q@intel.com>
References: <20230401020049.3843873-1-vinay.belgaumkar@intel.com>
 <877cuwguu6.wl-ashutosh.dixit@intel.com>
 <ZC1+Vn+ickyupCBI@intel.com>
 <871qkyp13t.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871qkyp13t.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: ce60b2be-6282-4d8e-ae78-08db361219b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DFUmgzdsjqmnXPegUihhrNtAWbl19BzK5LqAhNR1SOC40WOui69hSvoRZOJl85q+ufMpXgogCKKQgnhe4ThT/9K+BWHMOlY6uYNDjOYy9VaCtv0ug0q4AtlK1NFSAvihiHgzluPk8NjnN00szvJM6K+snhWBH5ujzrmCz0JJJWIgkhO6t+Gay4TeE5vVlPcxigyIyub6DXQUxUJMk1mb08s40dpPjjvhzD58I+jRiiXB6MJUa9gn4jUvGw6XKps1KqSnj5vhBqSjJMgD8qFnPnwRL/v4Zf8daQymg/kDK+dxc6z2HnYniccE/WYlwUVMvu00EY1ROITVjHzYkOdGmIbbv0VTuc4hypsX1J47ZfNcPYOjzJbosmoJomekdzgMmLMCysIlIOKf6/tEx4FnVJijAi2VUgcsLG3XqK+P9a2iEjtMnEW3LT0uHXuQs4bSFsS7blAwuHbHXPhyBMxHMdgz5FQ6W5ubDZ00RS9sodP2Pxnvsy2PSloni/tzdf/RP4/FheK0SsXZece9qd7a5iipaX3NUU01cDTJSphIg1dU5S+a3MZIFXWKU7okshLL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(66899021)(186003)(36756003)(86362001)(6512007)(2616005)(6666004)(6506007)(26005)(5660300002)(37006003)(6636002)(54906003)(6862004)(8936002)(316002)(44832011)(478600001)(82960400001)(8676002)(4326008)(66476007)(66946007)(66556008)(38100700002)(41300700001)(2906002)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YjTstXZJXPJf9Dy2/AX/1l+2fa9B/0KoS895uzIpKuJGJXCTz8zBa796y4U7?=
 =?us-ascii?Q?39IivaNuUHQi8rROr6E2g9q4diD1yXzQk8iG+VGtB5PI/Pj5zyNwCNDCSq0d?=
 =?us-ascii?Q?5hodYjChoatWKE9tjarUFd9jfabUBMHHoa3MlGXtkLBzo5tAAnTE215oAUBQ?=
 =?us-ascii?Q?343bQN0nQoCcaYaxFADVMsxRA5rExeLv/QSGFpI2lFy65MO3hZc/7VDR8CWP?=
 =?us-ascii?Q?EQTEo31ScVSQcbS1/YviCTdq7zOA+oGyyUVpiVT0l/QlhsLvfheO5UpZDAEp?=
 =?us-ascii?Q?WUMLe+nowVjAqw5W7MoZkZ/5w7Y4uK4/FMrk+nrH8ht5GOm+44esVT07fGTs?=
 =?us-ascii?Q?2gGMtiqqZcEUAi6YLHLoXL4ec3dnzZ71Hp5ujAC3/I4SM32LgO5ys8WOcNNY?=
 =?us-ascii?Q?tWHWOiIPs18XmQCsQ+ZuU80qlzSnEGWvQ4UtbcjpY6TqY6ioyc1sQz2Vq4fp?=
 =?us-ascii?Q?v9hBebenzIottXjMYEakHUd1uh9RXniehGFxaLL7AjYkLoE19Iu33hp9A/2Z?=
 =?us-ascii?Q?NDOtq5tWPXRD18moTQF9478MmQYnkS3tcEeCzj1b79ghGJu+oQEcf6a60271?=
 =?us-ascii?Q?IN/6tk8cWIhzFnyctW+gy3QGsZH0jDGEKhD4zCoGWDIPUmnruAZiH3u6FYO/?=
 =?us-ascii?Q?+Nago0DDPKSmFrEGJAdKM50L2YVxNBsQphsH57iXNrJwXkJKsFX59+9fDEnF?=
 =?us-ascii?Q?vKWztEYifdOkEM3J5IsBxrPC8nyxjTgQq84tqpH8yJJbWY6N+cheXhl6UnUm?=
 =?us-ascii?Q?6tMh0tEl0rNspKjM5JbGirupydH6bf0Feqa4WsX3hTHjn+hwILwx4meoz7CQ?=
 =?us-ascii?Q?qDQfUuhBaB8+Z7fNKq8mDAc8g9Ynt4BOzT6N04lapOKRn6p6JM5xllak69L2?=
 =?us-ascii?Q?QckJikHex51HKC94TjsxgFbsymvHkl7If4eBYSeTufywKHQFGXXyh/TBXf+x?=
 =?us-ascii?Q?We3oexn8pweX4eCAYn0VYP8y2saECDQZxmDmoOe3pnWk0YpDyTd6RGoiqOQq?=
 =?us-ascii?Q?oMrjRX9dcY0w67o6JkBfi/PRB/qKCg0p8uJ0v6w9sW3IvEYkE5Y1Hzir8qoW?=
 =?us-ascii?Q?QRCuNNONuQ47VmGVyg/dcnsEqHlKuG9Pag1CF3pg6/zD70uf557sNqIA6wu9?=
 =?us-ascii?Q?0EE2N6oX0yTZNVcOlEpwPiU0pw6IiKD44umGnDytNQlFmdjtE/4VBdZnFcMb?=
 =?us-ascii?Q?3CtdLwkL2Lf8FGQwh0EXP94AP+R8PdsdPEHl5Z354lRkveaHXgdgKZbKA6BF?=
 =?us-ascii?Q?1cOAYLFEINdq1SIucoXwLyxFpsyeDtI0PSF4bt3SiL8hhdQJT/NFD23tTepU?=
 =?us-ascii?Q?5crkZnr0Rj6TOH4DbCbmTt9Zxc7InpDs0cBYyaR2AzV8EjIS53I4s6/vKUXl?=
 =?us-ascii?Q?7R89HvaXYLPhZVOuLHTUk1pUGeGlzyAnLifqZAYcdTcADhzJPl9OcwEJIH+3?=
 =?us-ascii?Q?kywKuAh7oaWm2y253j4rymhq+gp6NGEpc0yz+Hphglk9oPVTl2YFTJbYD+q8?=
 =?us-ascii?Q?XZFZUEK4M40lrfsBJX/1O+YD7VuBpu6fro+MdnC19FbjLAtsiEUj0zdQ8rTj?=
 =?us-ascii?Q?zp6+7cGqYjz+XLGjiC3oDUEdwdlolTFJSIHzTxZb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce60b2be-6282-4d8e-ae78-08db361219b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 20:12:37.3990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGQW6NndHCiQpCovgYdM7HZy5XcCW+IWABhvqMuIJUScKs8v1Sxjwy7XwLJ0ZTjhprTWVMLOvLjm+D8VsZaI5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 12:42:30PM -0700, Dixit, Ashutosh wrote:
> On Wed, 05 Apr 2023 06:57:42 -0700, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> > On Fri, Mar 31, 2023 at 08:11:29PM -0700, Dixit, Ashutosh wrote:
> > > On Fri, 31 Mar 2023 19:00:49 -0700, Vinay Belgaumkar wrote:
> > > >
> > >
> > > Hi Vinay,
> > >
> > > > @@ -478,20 +507,15 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
> > > >	    val > slpc->max_freq_softlimit)
> > > >		return -EINVAL;
> > > >
> > > > +	/* Ignore efficient freq if lower min freq is requested */
> > > > +	ret = intel_guc_slpc_set_ignore_eff_freq(slpc, val < slpc->rp1_freq);
> > > > +	if (ret)
> > > > +		goto out;
> > > > +
> > >
> > > I don't agree with this. If we are now providing an interface explicitly to
> > > ignore RPe, that should be /only/ way to ignore RPe. There should be no
> > > other "under the hood" ignoring of RPe. In other words, ignoring RPe should
> > > be minimized unless explicitly requested.
> > >
> > > I don't clearly understand why this was done previously but it makes even
> > > less sense to me now after this patch.
> >
> > well, I had suggested this previously. And just because without this we would
> > be breaking API expectations.
> >
> > When user selects a minimal frequency it expect that to stick. But with the
> > efficient freq enabled in guc if minimal is less than the efficient one,
> > this request is likely ignored.
> >
> > Well, even worse is that we are actually caching the request in the soft values.
> > So we show a minimal, but the hardware without any workload is operating at
> > efficient.
> >
> > So, the thought process was: 'if user requested a very low minimal, we give them
> > the minimal requested, even if that means to disable the efficient freq.'
> 
> Hmm, I understand this even less now :)
> 
> * Why is RPe ignored when min < RPe? Since the freq can be between min and
>   max? Shouldn't the condition be min > RPe, that is turn RPe off if min
>   higher that RPe is requested?

that is not how guc efficient freq selection works. (unless my memory is
tricking me right now.)

So, if we select a min that is between RPe and RP0, guc will respect and
use the selected min. So we don't need to disable guc selection of the
efficient.

This is not true when we select a very low min like RPn. If we select RPn
as min and guc efficient freq selection is enabled guc will simply ignore
our request. So the only way to give the user what is asked, is to also
disable guc's efficient freq selection. (I probably confused you in the
previous email because I used 'RP0' when I meant 'RPn'. I hope it gets
clear now).

> 
> * Also isn't RPe dynamic, so we can't say RPe == rp1 when using in KMD?

Oh... yeap, this is an issue indeed. Specially with i915 where we have
the soft values cached instead of asking guc everytime.

That's a good point. The variance is not big, but we will hit corner cases.
One way is to keep checking and updating everytime a sysfs is touched.
Other way is do what you are suggesting and let's just accept and deal
with the reality that is: "we cannot guarantee a min freq selection if user
doesn't disable the efficient freq selection".

> 
> * Finally, we know that enabling RPe broke the kernel freq API because RPe
>   could go over max_freq. So it is actually the max freq which is not
>   obeyed after RPe is enabled.

Oh! so it was my bad memory indeed and everything is the other way around?
But I just looked to Xe code, my most recent memory, and I just needed
to toggle the efficient freq off on the case that I mentioned, when min
selection is below the efficient one. With that all the API expectation
that I coded in IGT works neatly.

> 
> So we ignore RPe in some select cases (which also I don't understand as
> mentioned above but maybe I am missing something) to claim that we are
> obeying the freq API, but let the freq API stay broken in other cases?

what cases it stays broken? This is why we need the IGT tests for all the
API behavior in place.

> 
> > So, that was introduced to avoid API breakage. Removing it now would mean
> > breaking API. (Not sure if the IGT tests for the API got merged already,
> > but think that as the API contract).
> 
> I think we should take this patch as an opportunity to fix this and give
> the user a clean interface to ignore RPe and remove this other implicit way
> to ignore RPe. All IGT changes are unmerged at present.

Yeap, the IGT needs to come with whatever we concluded here and we need to
stick with that afterwards, so let's think with care.

Vinay, Ashutosh's strongest argument is the variable RPe. Do you have thoughts
on that?

> 
> Thanks.
> --
> Ashutosh
> 
> 
> 
> >
> > But I do agree with you that having something selected from multiple places
> > also has the potential to cause some miss-expectations. So I was thinking
> > about multiple even orders where the user select the RP0 as minimal, then
> > enable the efficient or vice versa, but I couldn't think of a bad case.
> > Or at least not as bad as the user asking to get RP0 as minimal and only
> > getting RPe back.

in case I let you confused here, what I meant was RPn, not RP0.

> >
> > With this in mind, and having checked the code:
> >
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >
> > But I won't push this immediately because I'm still open to hear another
> > side/angle.
> >
> > >
> > > Thanks.
> > > --
> > > Ashutosh
> > >
> > >
> > > >	/* Need a lock now since waitboost can be modifying min as well */
> > > >	mutex_lock(&slpc->lock);
> > > >	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> > > >
> > > > -	/* Ignore efficient freq if lower min freq is requested */
> > > > -	ret = slpc_set_param(slpc,
> > > > -			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> > > > -			     val < slpc->rp1_freq);
> > > > -	if (ret) {
> > > > -		guc_probe_error(slpc_to_guc(slpc), "Failed to toggle efficient freq: %pe\n",
> > > > -				ERR_PTR(ret));
> > > > -		goto out;
> > > > -	}
> > > > -
> > > >	ret = slpc_set_param(slpc,
> > > >			     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> > > >			     val);
