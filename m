Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EB6E989C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537B610EC9C;
	Thu, 20 Apr 2023 15:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE21810E960;
 Thu, 20 Apr 2023 15:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682005441; x=1713541441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/5L0TiLTXvOvGbP5+AvSqrOlukQpUUkWSkRVdRnAY1g=;
 b=XSkL0g7cUt10QVuHDx8oD3z1zFzwGglcYCPEjpZIY+tgNKKQwYkxCVb6
 gVwidsTDibuCinY6jnjNRKkgIN5bsKKe8QRXXSpwNU9h4MyYru1oFQsSS
 ahB+0Gpp9PDdlrt6YVeN4nIBtYfSO4at6saN7ZQxzM2gfVjk/CQnCrVpP
 y/demQgcO+kKsphTEESIG1+xhbQZW+ZdKwwrNHDkPBkby2npmHvHDN0gy
 srP9JpwJvDHs34ESo+YS08pomd9YIKAEyOdYTtit9LtmKenP/hdKlQCke
 kpLejSQkrsY+rHObDTXu3z6lHg1doe53LCGb0Rjr5tFAED7L9ztBK9f8k A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411008411"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="411008411"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 08:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="938113319"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="938113319"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 20 Apr 2023 08:43:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 08:43:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 08:43:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 08:43:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNTejiGACH1xjSGZZtP646nqPv7Fzh/D855fmxHQRvu2ya2Pc/QnFvuDT6bWAZkp7NgGZ67RyP7uP9zVKUepAlnBoEeAD8MnoYfRwf5wi1EL6zSS5sAc2fhuvy+Jr6FsXgf6dTuQfGt17IbvEwjCERG/PcP5lEotfdArQYowRRksFwFicy0Ol+72/PH1jF3YAyohjS6HIw8Q0D77PDn1tEdH3MHiG0F7xfKPLKSfa1OhaT2kjPpTSjCTYgmuaiieTCDTIMQtiUHy0USAOp5rp5OoGYjhvPB1Ao2btOXyPAUbfM0pKcbZlpM4n6da8ed0qqIwgmUr9d3PLqsBwchumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEMloU6qBmEPCW7We9uBh49nKXquNP/5iqFhw5IUPPw=;
 b=GP/37GJ+n10Zs0lLLwmrOS4i7xwoqqyADQOfP47WCgbtt2qRZqMZ8LoGrTPji96WV58cpsX/JcdMb9K3l0rV0u5ZRVNoFMcakyhsfOXgzWfHemrmrFga2XkK27ZUDKbTO6skvx5IAEtH3tuDr9RddOxbrnx5PRsSfZf3Tr049a5LwNXVPWGzJRGCPwyT/4gbCr+av05rpU+mgYkOgd/zvv/tVPNzFJYkFgh/7HfFHSSbH2llCfXheygMrrs/MbNJUmHN6bAxsH+wqSDVeFVGwnz8JZ+j4TyH7nABNQqAuEHTt1YSTjB2tRCY0b0Jzh0goJ/b/UL5XWdjNtBe7ezkgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Thu, 20 Apr
 2023 15:43:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 15:43:57 +0000
Date: Thu, 20 Apr 2023 11:43:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC reset to
 complete
Message-ID: <ZEFduD1kUjhRJFaZ@intel.com>
References: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
 <20230410223509.3593109-4-ashutosh.dixit@intel.com>
 <340d7a5f-0b38-3c40-77b8-ab825a7b5fef@linux.intel.com>
 <871qkfo74r.wl-ashutosh.dixit@intel.com>
 <852cfbbe-25be-ec23-e182-8e81f2f0e98a@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <852cfbbe-25be-ec23-e182-8e81f2f0e98a@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: d441318a-da51-4bbd-b542-08db41b60d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +PNZ9KTnqn9AvGEW5OBHga9nYLR3uWehZMsznIFxngGUegckcG9ro/Vqdi2ypVAhVrQijOReVyt6AowKUHvKose508y8CGvtf8ZzYJ3eQ+dX0znWcA8GQbLVD8q2hpGrSH/SclzG7LfJ10Ovnct8j3tDWlJsdJxmk7tz8xCKEAnNyO6ur3iOsJz158Ukj8j0nWLOF+axLkewUCwmTHjzta1qC6mr25blJWRZE6X0d/MM2OK3Qs/olgKRXmIkBi9gOk9lx/dEElP82urYgaOu4lWsf9oJVPnCdVNpUTK2rlCJAOGzZ+GffP2CZr54V7LOAwu1ro+YIJJntjnvGdgU7I9TASleeGVkqtGrWwGEpl7LdFCNMb2S/gczm3ArDVURprZ+95OjHOhyDzHs/gc5zDA36h4S7k0hW1rpIJzNZ1HCZOTkXUSYc2ohnZBEUZFazkoSkmD2Ip4X1tUkdZxWY5FDpxAocx0YyqeYc1INDhPe2LKHD8G/BxcM/FnVsNOm8AObR91JfDnRuXp64fQXEdKNQOrOiVMJLILE9YQhvA1/4AszUaOlKZSdbgX50pLI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(5660300002)(6486002)(41300700001)(316002)(66946007)(4326008)(66476007)(478600001)(66556008)(6916009)(44832011)(8936002)(8676002)(82960400001)(38100700002)(186003)(53546011)(83380400001)(2616005)(6666004)(26005)(6512007)(6506007)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5b/e38iAuZRBtgkOTDYRyVuweoGgzTwuYdI0DselgeM3I4vuiW+lg3USixAs?=
 =?us-ascii?Q?LVNRpJbWZPaEhG7ybPVyu0mTlvGu0Ax1Qg3ie9cV+er2AS5kWJ1T12ySjNv0?=
 =?us-ascii?Q?vTUAdJG1MBBhB13khe1KT1XGQXcR/FaMlXkuqWB8fJCv/owwe/xGJBixycQ9?=
 =?us-ascii?Q?714Ji4quQrXd0QEcJ6Er8r8Bb3il4ONbhlFAmTZQvQ+YWotK5fjdlz3r6wCx?=
 =?us-ascii?Q?iaoVWVlyKtyfdpVMDL7HdqWFajetTEAXkc2r4A3HLvzEaQCgoig32t/YhWYl?=
 =?us-ascii?Q?yFZ4OUqH60pAeQxP/7Exo1qyIYhBIPI8rei4caSAP6vFCR2HVyscTSV10qPa?=
 =?us-ascii?Q?P0Ie4gt3cgaN53OK5FKFHEcPtg3FCgdS9k7M05jH3L6gdtkC7JA1zSgN6RC0?=
 =?us-ascii?Q?93vlXr4oWP96R7ueasCo9ZexHpg2D7nasIbKDItGdEgRVJ+MyZi8tUc+10OA?=
 =?us-ascii?Q?Y6g8LxgrZJUrUk7vdGAtgsMmGMMBF9LUa+oYsL6vj6rkPkfNASwIPSl8ht4x?=
 =?us-ascii?Q?YuphFeh4I4FLvIOt+6pxj+EltfIkO6BrMzPwGfg/Hod5hqSOdn19uMn18mbo?=
 =?us-ascii?Q?Dr3xv+FmL+oEAjyVylIh1h01ve4IdkkTIVgI07XcMkOYuPHmoOzIJcj1OeDF?=
 =?us-ascii?Q?R5hVKHcC8Gxc6zGIKzRi6SETlyM1FGfLigq4JA1DlVq46DZdEIZCF7xucL42?=
 =?us-ascii?Q?UmTrRy7bRVFKjh5AIJDFvIGgFyTjxHvOEOWIRi1kDmY/oF3WA7P3MOattXdF?=
 =?us-ascii?Q?W6yXg2Z6hOo8hRsxrOApgWQCTLy0gfGMQFy1Aha6wsUJe2JE4cE0jNrz/B4f?=
 =?us-ascii?Q?eIqQSnP1yJ6eGPeqI5GY5YcHXrTrxt9P9mBw1lbUc0bAv8SVZyHyvAFT8N4p?=
 =?us-ascii?Q?aQ6ks8msst4X62D7cOPbOGfZSoxXcV1SB0HDoKO7Pwkaic/1WfQERkkDgGpn?=
 =?us-ascii?Q?0t/SDZ0rbRNkcJ1nazUNIYuS5rrEr7qMin2BlzlbRt3U0wOH6eo9+gEMbdrX?=
 =?us-ascii?Q?tToN05xPZRbPVwBYNd7RKSq7VTsmKElwxYtDihR7HrDrzAfNi30SA4y+j3XH?=
 =?us-ascii?Q?k3Z0lv+aqc0YZkpWXKBwEc/S5u2cqDrZX0XDnQelgtRri+ytyHiLzzIFD3lD?=
 =?us-ascii?Q?eIClIyBENYEke8yIngZ+JuRoI9ufY6JAJa9DSe/hMZmOk6zJCcKuIILLxrKe?=
 =?us-ascii?Q?GA/S5zpC/zcvEtaGq1xX9Raq6gwNDTFweYkO4DDfNSzH1JOPzOch8pE/3i+X?=
 =?us-ascii?Q?Zjawh+mmJ2IzObJeSyBcAtLEPn4b/tLJ1FomR7Ww9INEOL+p6Xh6gJ9eRK8o?=
 =?us-ascii?Q?o+Knjb1a8cc8vzgROLj5jGxKCEGrmipP30y/GHI9H2NLctLXcukIMr5Gm1Mz?=
 =?us-ascii?Q?W0FfItbXjwsotrH3XCN0GyX33WbM5KILXCyIfAx2vGX1BjMNbtNhWcITsJKV?=
 =?us-ascii?Q?E6i660QvJ8Xj0OwM0f1JiKgavK5fLz6IOnTbgkFHlsqjrhTJfzdCI/0U4FyV?=
 =?us-ascii?Q?8IaOd6hKYq3252dG9BCZ2hV+wJrHsI+K8LitrTf66IR21LM9sGhvirC6osnA?=
 =?us-ascii?Q?4fE/Z4tti5JrC7yUlOCEf+RtlWeiaUvZGMW972PKx0mla399BHa/iDbhBuR/?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d441318a-da51-4bbd-b542-08db41b60d51
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 15:43:56.8901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUPX0pRRMy44LjBlbQRTeLLFnJIa2ok0y5BazfE2azgig1/0SxU3LxRBjn0a6XUckaAFsOyy7uqEk/t7wyA2sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 08:57:24AM +0100, Tvrtko Ursulin wrote:
> 
> On 19/04/2023 23:10, Dixit, Ashutosh wrote:
> > On Wed, 19 Apr 2023 06:21:27 -0700, Tvrtko Ursulin wrote:
> > > 
> > 
> > Hi Tvrtko,
> > 
> > > On 10/04/2023 23:35, Ashutosh Dixit wrote:
> > > > Instead of erroring out when GuC reset is in progress, block waiting for
> > > > GuC reset to complete which is a more reasonable uapi behavior.
> > > > 
> > > > v2: Avoid race between wake_up_all and waiting for wakeup (Rodrigo)
> > > > 
> > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/i915_hwmon.c | 38 +++++++++++++++++++++++++++----
> > > >    1 file changed, 33 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > index 9ab8971679fe3..8471a667dfc71 100644
> > > > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > > > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > @@ -51,6 +51,7 @@ struct hwm_drvdata {
> > > > 	char name[12];
> > > > 	int gt_n;
> > > > 	bool reset_in_progress;
> > > > +	wait_queue_head_t waitq;
> > > >    };
> > > >      struct i915_hwmon {
> > > > @@ -395,16 +396,41 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
> > > >    static int
> > > >    hwm_power_max_write(struct hwm_drvdata *ddat, long val)
> > > >    {
> > > > +#define GUC_RESET_TIMEOUT msecs_to_jiffies(2000)
> > > > +
> > > > +	int ret = 0, timeout = GUC_RESET_TIMEOUT;
> > > 
> > > Patch looks good to me
> > 
> > Great, thanks :)
> > 
> > > apart that I am not sure what is the purpose of the timeout? This is just
> > > the sysfs write path or has more callers?
> > 
> > It is just the sysfs path, but the sysfs is accessed also by the oneAPI
> > stack (Level 0). In the initial version I also didn't have the timeout
> > thinking that the app can send a signal to the blocked thread to unblock
> > it. I introduced the timeout after Rodrigo brought it up and I am now
> > thinking maybe it's better to have the timeout in the driver since the app
> > has no knowledge of how long GuC resets can take. But I can remove it if
> > you think it's not needed.
> 
> Maybe I am missing something but I don't get why we would need to provide a
> timeout facility in sysfs? If the library writes here to configure something
> it already has to expect a blocking write by the nature of a a write(2) and
> sysfs contract. It can take long for any reason so I hope we are not
> guaranteeing some latency number to someone? Or the concern is just about
> things getting stuck? In which case I think Ctrl-C is the answer because
> ETIME is not even listed as an errno for write(2).

I suggested the timeout on the other version because of that race,
which is fixed now with this approach. It is probably better to remove
it now to avoid confusions. I'm sorry about that.

> 
> > > If the
> > > former perhaps it would be better to just use interruptible everything
> > > (mutex and sleep) and wait for as long as it takes or until user presses
> > > Ctrl-C?
> > 
> > Now we are not holding the mutexes for long, just long enough do register
> > rmw's. So not holding the mutex across GuC reset as we were
> > originally. Therefore I am thinking mutex_lock_interruptible is not needed?
> > The sleep is already interruptible (TASK_INTERRUPTIBLE).
> 
> Ah yes, you are right.
> 
> Regards,
> 
> Tvrtko
> 
> > Anyway please let me know if you think we need to change anything.
> > 
> > Thanks.
> > --
> > Ashutosh
> > 
> > > > 	struct i915_hwmon *hwmon = ddat->hwmon;
> > > > 	intel_wakeref_t wakeref;
> > > > -	int ret = 0;
> > > > +	DEFINE_WAIT(wait);
> > > > 	u32 nval;
> > > >    -	mutex_lock(&hwmon->hwmon_lock);
> > > > -	if (hwmon->ddat.reset_in_progress) {
> > > > -		ret = -EAGAIN;
> > > > -		goto unlock;
> > > > +	/* Block waiting for GuC reset to complete when needed */
> > > > +	for (;;) {
> > > > +		mutex_lock(&hwmon->hwmon_lock);
> > > > +
> > > > +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
> > > > +
> > > > +		if (!hwmon->ddat.reset_in_progress)
> > > > +			break;
> > > > +
> > > > +		if (signal_pending(current)) {
> > > > +			ret = -EINTR;
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		if (!timeout) {
> > > > +			ret = -ETIME;
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		mutex_unlock(&hwmon->hwmon_lock);
> > > > +
> > > > +		timeout = schedule_timeout(timeout);
> > > > 	}
> > > > +	finish_wait(&ddat->waitq, &wait);
> > > > +	if (ret)
> > > > +		goto unlock;
> > > > +
> > > > 	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> > > > 		/* Disable PL1 limit and verify, because the limit cannot be
> > > > disabled on all platforms */
> > > > @@ -508,6 +534,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
> > > > 	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
> > > > 			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
> > > > 	hwmon->ddat.reset_in_progress = false;
> > > > +	wake_up_all(&hwmon->ddat.waitq);
> > > > 		mutex_unlock(&hwmon->hwmon_lock);
> > > >    }
> > > > @@ -784,6 +811,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
> > > > 	ddat->uncore = &i915->uncore;
> > > > 	snprintf(ddat->name, sizeof(ddat->name), "i915");
> > > > 	ddat->gt_n = -1;
> > > > +	init_waitqueue_head(&ddat->waitq);
> > > > 		for_each_gt(gt, i915, i) {
> > > > 		ddat_gt = hwmon->ddat_gt + i;
