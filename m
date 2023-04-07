Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D546DABF5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 13:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DED10E0ED;
	Fri,  7 Apr 2023 11:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEC610E0ED;
 Fri,  7 Apr 2023 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680865456; x=1712401456;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tByCt0hKXejxX8L/q6UEg/zo+WjZhHXi9C+gG0i6n88=;
 b=DYgPTeCEDcM5E1TOdIdgi+1H0XE8L8ULY6/4SI+Yn46RmzatxlSXKuYG
 /25Ecd+v71tQILh+dun840tx/a5HkReLCIwFOE/KwkZ+FyVLkfDT09Baf
 B5B2raIdf9AcFwROlgYdauAvKbBGSYynwTbcQU7hrOnXgvidxHT1865Hv
 GR1kj47LgoOAyEKhqojcpZ+BYf7mFtPbEuuev0BqntirV4rcaDJBtW+D3
 CE2mEIhdgDT4nwzuCND8sJjhquw2iWEPAiY5qaSv53fQ1Cuo3K8Gep1XI
 FJNfU+oiWsLTLWd6jCWnjCaXSuNr7bN4eo9wqN8oKWffVK7JCocZ2UZzG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323338170"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="323338170"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 04:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="681004544"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="681004544"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 07 Apr 2023 04:04:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 04:04:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 04:04:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 04:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONNJg6m008r223ERtK71A6X5YcxGr0U2CE9k0z9ueIuz1DioSOoZKegD8xoyx8LiZiZ3yfIJi4X4T7YBfc9yA0zqoX+4y/bKfqHAfj0KdgwlgsyvyDNe5auktgdGqJEkUhWMEiRSuS8cxdK4Q//HDtWtC5efaBgchRYG41zpQwWcNnP31biOgZDK5uMF/Fz17RKxzlU6z6XFb5/kCosC3gj0zZfqF79Udj7qk/mEQnL/SbbeS434FbJuwUby/NgheG6bjfuAOH8OmeIe2uZYNpvuZ6nxWDmyE65l7gWNUufbOu6LVxMZ3zLwbmFi9iQsS5efx6cxhk5y2c0PFbyDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMFmJrIonqr1gf6mC1VoaeylCSWZ2jtMZGv3XuYFhGw=;
 b=LS1emBb0mMig8JfLm7L/jF/oqjGGUFlpKJGLoOaIHue0UYPBVUUnHT2dI9IzrxMxS9Y34bDIWwMZGzcopm6Ox4oYkLrQboCOqaGJO01AHwFXOY7c+fQXryO/vd+opQ2ppHktnPm55jhl0uxx7Hev4/W8TqbpwB25XXIXDkWwUqXFFRPYiNRcad7ZscZIaf73EdR5R82MRzBnscEWSQEpUeIp5G07hGI17FQPbdqv0Q3gZXhzbgBLScZul0KNpodV2HE583BfOQT5QRSFN5ltKNmpSP0E9HVqYwRuWtFkqnmvDlpRbcRNhUsKP5bujcRcS42NLpRHZkbPJma+dsJvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.23; Fri, 7 Apr 2023 11:04:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 11:04:11 +0000
Date: Fri, 7 Apr 2023 07:04:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC
 reset to complete
Message-ID: <ZC/4puC4sAanEGjE@intel.com>
References: <20230406044522.3108359-1-ashutosh.dixit@intel.com>
 <20230406044522.3108359-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230406044522.3108359-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 314532da-c9e6-4650-51ce-08db3757d094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(2906002)(5660300002)(6506007)(6512007)(26005)(8936002)(6862004)(6486002)(2616005)(37006003)(44832011)(6666004)(186003)(316002)(6636002)(83380400001)(41300700001)(478600001)(82960400001)(38100700002)(8676002)(66946007)(4326008)(66556008)(36756003)(86362001)(450100002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 314532da-c9e6-4650-51ce-08db3757d094
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 11:04:10.7334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHrhWICeB2Sxb9649OKYEGtg0bLQ+A1vAciwHsBYz2VqmlTtgjTi6NasW1MpNARi27lOtxwYJZlOatB2iB+lbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
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

On Wed, Apr 05, 2023 at 09:45:22PM -0700, Ashutosh Dixit wrote:
> Instead of erroring out when GuC reset is in progress, block waiting for
> GuC reset to complete which is a more reasonable uapi behavior.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 9ab8971679fe3..4343efb48e61b 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -51,6 +51,7 @@ struct hwm_drvdata {
>  	char name[12];
>  	int gt_n;
>  	bool reset_in_progress;
> +	wait_queue_head_t wqh;
>  };
>  
>  struct i915_hwmon {
> @@ -400,10 +401,15 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
>  	int ret = 0;
>  	u32 nval;
>  
> +retry:
>  	mutex_lock(&hwmon->hwmon_lock);
>  	if (hwmon->ddat.reset_in_progress) {
> -		ret = -EAGAIN;
> -		goto unlock;
> +		mutex_unlock(&hwmon->hwmon_lock);
> +		ret = wait_event_interruptible(ddat->wqh,
> +					       !hwmon->ddat.reset_in_progress);

this is indeed very clever!
maybe just use the timeout version to be on the safeside and then return the
-EAGAIN on timeout?

my fear is probably due to the lack of knowledge on this wait queue, but
I'm wondering what could go wrong if due to some funny race you enter this
check right after wake_up_all below has passed and then you will be here
indefinitely waiting...

> +		if (ret)
> +			return ret;
> +		goto retry;
>  	}
>  	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
>  
> @@ -426,7 +432,6 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
>  			 PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
>  exit:
>  	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
> -unlock:
>  	mutex_unlock(&hwmon->hwmon_lock);
>  	return ret;
>  }
> @@ -508,6 +513,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
>  	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
>  			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
>  	hwmon->ddat.reset_in_progress = false;
> +	wake_up_all(&hwmon->ddat.wqh);
>  
>  	mutex_unlock(&hwmon->hwmon_lock);
>  }
> @@ -784,6 +790,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>  	ddat->uncore = &i915->uncore;
>  	snprintf(ddat->name, sizeof(ddat->name), "i915");
>  	ddat->gt_n = -1;
> +	init_waitqueue_head(&ddat->wqh);
>  
>  	for_each_gt(gt, i915, i) {
>  		ddat_gt = hwmon->ddat_gt + i;
> -- 
> 2.38.0
> 
