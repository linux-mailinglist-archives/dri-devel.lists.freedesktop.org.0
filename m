Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86826E58A2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 07:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADDC10E044;
	Tue, 18 Apr 2023 05:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1095110E044;
 Tue, 18 Apr 2023 05:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681796167; x=1713332167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K0w+CxVlqCxdBKkc8P627M+RkZ9rp9mc2n6E9Dsn5qE=;
 b=RACKc+BVoEDcB/xoEtci2rUM/giEswwY2TmCAElU1V83I1LEHqNbwE9z
 S5X+wV7PjfzCTH6pVQDLuM0jN/m0UWCKCGw7AxZj0sG3WIAsbWr9E5iMK
 uzHKp+esZcVFQsD8DSSdal3+Fi3aTEzi7wkSEltaTC1D4PGAehK7XtQcM
 1Nic528kX5TcgRQX2jodEey1O5syaBJ3fbAHz9tbZ/wcXbOl6aBaPlziV
 LvxL5O4kqMSC34GagjgINsrPeZKBSBTKZQUNOTxWEZXgsM3NoiIL/N3t7
 i1h98lvnoaFwIqooYMI2gyQVdwlqiumkB9vg4vsKae8oA+CpZjj3EHSFV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="342574146"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="342574146"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 22:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="802412511"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="802412511"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2023 22:36:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 22:36:05 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 22:36:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 22:36:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 22:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i62wsaLsT07rIqNGCxQODmOGyTXHmY4vjTkat2cMErKV2w9IiP5EsxI4pGNjj7SyWsAazeDuV+1aCFvp3k8XdEk1JjDceiTws4L7BkFE4gZ9RBsyV01yFdZvEN4ZyxLGzjepSMfIJ+nkSfUpeHEsN9MlmJYNOTHSTcUtCApZdrVBJ0HosPEVDtiWDGGN6Pa1Yb2weattZhYzdi5nqII3rU3P4pgmuAS9GzuOxeEMZlETu/rJE0eb0ZVa2bTrIJ26I+vHxtDEy26xdttJrrqDP44rEyd/NOqm6gjzUoMJxhYW0KshbjRl/CZ0qG1a9bQ/xmSJeWDGYKJkd2sGWQeSow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zos5OzIVgfgHHoURRgE+U76YQ+TM/+yBglPhGuB+r4k=;
 b=LaVKh5QbMWCqiIstluBGzv+sm0fBiRMxDZa2ylCdJDsRyo2ijzofM7/S16hS0Wvh4RhdXRV+8ti0xzIAAi4sG2p1hA7mmZTdVa8BrQjaWAYC5eH9EyvgLYD4IVfpalE2awHCKdYAG4bq7WVnzZB+viy008igURMbS6gbdD4/Wyxuc2S2CvULuFz7iuzeB3ecbeVTunsXsO0AiQSdBm+WnHiN/C2asWuj/w/X/vgJ5d1nQOvz3Qw1AWyfur8N/0m0F+Jo94HdMwprQrp7o5OpaaVzZVvduW3n9ljGTLF2d8ko/vML5AdaCJm+amLkP7VGWAItpk9yXe8i3lSpiOk9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 05:36:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Tue, 18 Apr 2023
 05:36:03 +0000
Date: Tue, 18 Apr 2023 01:35:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC reset to
 complete
Message-ID: <ZD4sPiMDhhr1wO8+@intel.com>
References: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
 <20230410223509.3593109-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230410223509.3593109-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fc8591-b6bf-4777-b044-08db3fcecc57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sN4I006LSFXVo9hzzKTy0HD1EQ5HRgzvXNc77mzaXgSoW0m/bHSpOTiwTRmK5g4d+R+E7eYCNRmf52MhKPdux/2EXiflrqht55DFOj9U6R8dd9r9MlV8Sv2p+/VwArW9yOL6vbucN6Lg9i9ZZD7ZAdoaURKMAV9gEScot+vQmkIqr1ExdWzJvBCgH+UD3WQvh/et4+5CJiNuBZKkIJuuihKmt57WKdF7wfA4/lvw0oUZ/VEurbnifX3b1cFAldcqkYU6BpPProJo+rkaJ9LiaREUcMJF1vRvNCsBad/xhtvQ4I1KzG5E9ylUZjBfLYjclGa5A9Nf0Ni99mmGLxFZxvEHB6n1Pd9noS26VsYyHj8Y8ldRws9nbBcgK1kVBWAsPJ+cUh3ULn0YdBHtJ2N6z9NJpvre8QbYHTPmN9tHJtxcB7e1WUMrMMSX/n9bPWWNwDmr29NIRB+kF3Sws3phfHr4a8tSHEMMsasYd+ntPxeFF7jvQCNbiAd6/Mol1MYswGi0z4VL5Hd+kI+zc5AKkdRFJHrCQKHHrAuoePqMhPtGWEwZxKCIW82fmm7BNtb4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(36756003)(44832011)(38100700002)(5660300002)(2906002)(8676002)(8936002)(41300700001)(6862004)(86362001)(478600001)(6636002)(2616005)(37006003)(26005)(6506007)(6512007)(186003)(6666004)(6486002)(4326008)(66556008)(66476007)(66946007)(316002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?krFuRFtgmO569AVytsgN8AZ4Vw8BvT92AynYtR6rtObjD1q2zAKulcB9R7+N?=
 =?us-ascii?Q?/TwFs5qj0Q/4Mput4A/xQ+aDXfETTLY4M0R2ylIcHpwiA2IpBSRtAMEkcxtC?=
 =?us-ascii?Q?7moqYcd7jLL1C/Fl340TKIEC4RF6VXoEDbLRfM6Kd5VRxXA0T82WeY2NUwNr?=
 =?us-ascii?Q?aLWwQMcHjAzNWwLSqGQJL3v7Vx72LlHp/AVJecbnbuvBTU9qWxYrmImHPoJQ?=
 =?us-ascii?Q?Y8F5XLL6fRLJlX9b6Va9jhyi0oPDRs9av0tz1xKngcWtrZbfGqkbYdG16zfS?=
 =?us-ascii?Q?4Zwx5YpcpH2P0ivCgmeD1QazF/2CtDQD9ZMRc8VuOg8osSnrJNpofQvQAm0V?=
 =?us-ascii?Q?aM6xbNCSMpERtj0Uprdltin8FgTqGXImBals782LK8JdzrjVdQziTpbmEefZ?=
 =?us-ascii?Q?wfPoeg+qA4KxtQG8i0eThn3HcgqNZWAuJie5OW40bs1aD4P0pJ8gK7d0uzfM?=
 =?us-ascii?Q?h2B1y5HnWhI2Iq0pkML7A7fK8NmsjYemMFeqHZrawgYURdUePDsJN+FbQ0dH?=
 =?us-ascii?Q?eYZPrGAYMiy9XuWOTgB9QgoWSAbJ65M3D5ZHSRD1WY7w/uUylGzE72Chxw4G?=
 =?us-ascii?Q?Iq3cbHj+UvZRJonYOCT7ZLRg7CSUYah3jVcpCCNlfxaBsm+eylpjetz5r8Vv?=
 =?us-ascii?Q?9pq2tQN691HHlP5hrt5rDnso64LIt8Iar0ZrG7KZ8DfpcfTf8eO47Br+ul+L?=
 =?us-ascii?Q?1r0fBpwwfFN/LmBgO3rn36YoauOSL7wTxV8Xeh0DM2vi6ZUWMAuwxocC9+My?=
 =?us-ascii?Q?d1Wok7JODXoWFYJ4mu1tyFbh4jU5z8f5P3WBe6YnqIT7j2r0Gazg0Psu8E6n?=
 =?us-ascii?Q?AjVmtUYgUeeBzISvmcUGq2oT6lFTeS8McWIhLWSMNxLwWws58yFVmHknSj8g?=
 =?us-ascii?Q?qilO5B8Nr2JaJ+N8lFsEvbZgxEKEI5NwOhlWllGfFBbMbr1ki0fUd/omTP4q?=
 =?us-ascii?Q?KBXqAtpGHhy5Bqp2vEdUJEBzZD6c7EHMDgY2Gr1o/2MbOmxgCpXLHOyeJx+m?=
 =?us-ascii?Q?oHnAIf9Fbqq6nuQ46mNYxluHOTKxQhIV79nDvLvPHlT0iRbu9BoO2Wn1H+Fg?=
 =?us-ascii?Q?Bf4jbQUZrYHs0ej+Oowdqb8/wSTjn1r4gjsdozuFDXCpckX2UABptmacAySB?=
 =?us-ascii?Q?fKjgFczxaYcMt4yPP3E7TsEdTwuAEV6J454kFpPDB4otGlzqGILrMS+MGGAn?=
 =?us-ascii?Q?fuLxXY37YkvvyzZTVxT5KcQVK/oAY7LqJKwEa5IOghS30+15wV37DZ+SKtwC?=
 =?us-ascii?Q?hlxsFyqwCSbbbvVFOHeiVbHfydqbqbA3Puam0zeuc2RAer//SzU7yVxxIgTI?=
 =?us-ascii?Q?sRztxKyanAkJil7VBzsdLqID6vPSTAlTHCqQigLGwLr47RLIxNAvgrBeNpoN?=
 =?us-ascii?Q?KHt33R56exonXBIkgm7mkFcxWDQDb31bmWp+7VHTFGdQ73VNJfWNPp2xKROl?=
 =?us-ascii?Q?mtEliw8mvBpy+OiAAklFJlv6bioBvRbOYgj0Gagj3S10EAhXOHeMYBUdLKui?=
 =?us-ascii?Q?mNb4fxM1CWpJqnVUVIhCiqhfxCc6dzo8ecyAGOU2bIcQ6vMunQhSSO+8ef9E?=
 =?us-ascii?Q?M/9bgdOrT9QbvUt1qjyou5GRIVpWcEw6ujCv7eQf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fc8591-b6bf-4777-b044-08db3fcecc57
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 05:36:03.0632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUR4oXRPxSpWcGQQW63z3E0GGPH8Xk+V02zBIHQOOFp/T+RYGpLCQHGO+Sauvp7nFwQ6c07QL1oy+zvO7Ml+Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 03:35:09PM -0700, Ashutosh Dixit wrote:
> Instead of erroring out when GuC reset is in progress, block waiting for
> GuC reset to complete which is a more reasonable uapi behavior.
> 
> v2: Avoid race between wake_up_all and waiting for wakeup (Rodrigo)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 38 +++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 9ab8971679fe3..8471a667dfc71 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -51,6 +51,7 @@ struct hwm_drvdata {
>  	char name[12];
>  	int gt_n;
>  	bool reset_in_progress;
> +	wait_queue_head_t waitq;
>  };
>  
>  struct i915_hwmon {
> @@ -395,16 +396,41 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
>  static int
>  hwm_power_max_write(struct hwm_drvdata *ddat, long val)
>  {
> +#define GUC_RESET_TIMEOUT msecs_to_jiffies(2000)
> +
> +	int ret = 0, timeout = GUC_RESET_TIMEOUT;
>  	struct i915_hwmon *hwmon = ddat->hwmon;
>  	intel_wakeref_t wakeref;
> -	int ret = 0;
> +	DEFINE_WAIT(wait);
>  	u32 nval;
>  
> -	mutex_lock(&hwmon->hwmon_lock);
> -	if (hwmon->ddat.reset_in_progress) {
> -		ret = -EAGAIN;
> -		goto unlock;
> +	/* Block waiting for GuC reset to complete when needed */
> +	for (;;) {
> +		mutex_lock(&hwmon->hwmon_lock);

I'm really afraid of how this mutex is handled with the wait queue.
some initial thought it looks like it is trying to reimplement ww_mutex?

all other examples of the wait_queue usages like this or didn't use
locks or had it in a total different flow that I could not correlate.

> +
> +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
> +
> +		if (!hwmon->ddat.reset_in_progress)
> +			break;

If this breaks we never unlock it?

> +
> +		if (signal_pending(current)) {
> +			ret = -EINTR;
> +			break;
> +		}
> +
> +		if (!timeout) {
> +			ret = -ETIME;
> +			break;
> +		}
> +
> +		mutex_unlock(&hwmon->hwmon_lock);

do we need to lock the signal pending and timeout as well?
or only wrapping it around the hwmon->ddat access would be
enough?

> +
> +		timeout = schedule_timeout(timeout);
>  	}
> +	finish_wait(&ddat->waitq, &wait);
> +	if (ret)
> +		goto unlock;
> +
>  	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
>  
>  	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
> @@ -508,6 +534,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
>  	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
>  			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
>  	hwmon->ddat.reset_in_progress = false;
> +	wake_up_all(&hwmon->ddat.waitq);
>  
>  	mutex_unlock(&hwmon->hwmon_lock);
>  }
> @@ -784,6 +811,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>  	ddat->uncore = &i915->uncore;
>  	snprintf(ddat->name, sizeof(ddat->name), "i915");
>  	ddat->gt_n = -1;
> +	init_waitqueue_head(&ddat->waitq);
>  
>  	for_each_gt(gt, i915, i) {
>  		ddat_gt = hwmon->ddat_gt + i;
> -- 
> 2.38.0
> 
