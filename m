Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE225ECEDA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 22:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8150710E123;
	Tue, 27 Sep 2022 20:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C85710E0FC;
 Tue, 27 Sep 2022 20:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664311505; x=1695847505;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MQ1rw8EYWW8HzxSiBsDL4cGT7Dvhs0gto8N5c5jR244=;
 b=d23rhLH5uSiJp5Z5kgLSNFEfRgYAS8jHn6mz0dPgbbxz+ENybMU8muS/
 m2N8cGKxP1zbpdUoySvXY6BIHcWV55lLynme6OVPKqdDr+Y4x1wZPDZ0r
 6GOhWxJDfIGFj2Lqgrv5EgbrLs+WPLOVyHY/pHra2JlqPP+KoIBAN2PKS
 yK8XfWayV7cG9ZvoO+jjenCb3FXq6YC389rD9DgBhjaOdaryydChXMRj0
 /8RYDBgosA3A7oCbJv1fxi8SnyHHNsMzphBvL3raytcXORQQdyWE5hVSV
 q4hoEAsMYwUD23yTUsQJiSTWScyJh65glU3l/kzlqTGwtXXJR9HYSdnt3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281799390"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="281799390"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 13:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="684128912"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="684128912"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 27 Sep 2022 13:45:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 13:45:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 13:45:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 13:45:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 13:45:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECfbzGN/vka5AstfH/5SC1cWIGIZwtUY1ux23aKSRF+NCI5ZGIpzaw41dRLn3IQAGwcSNruoojFA4rU+cvgUtCwwyAFGZSLP/TGCxqqHpTDTBKzSQYup2OVykpt8PYow9H16hkDHdlU1hSDfWPNSqphLnggPD03EHNHH6xuWlhchHl9InMTCq9bDEc+iT6zs07FYJOHPdJRoHK/mCiu499BqglEs9rt0+iAdvaVcbWxn+Kk+G5a03+skOqO0fCMRcvJTxlYG/oLrDFjE4bZmNjLlgPW/Ndtq1kqeozBO//8pmez89ONLtdXkT6yaLZ3988qSgjlm4KZkg1dHQp5mug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nywBOla7/xVzWc17s2r4MCFZJTw1zGLF/GiUfeKo6hU=;
 b=Swy6tTXYg+jRAplVChJcj8qWhtpy/tYziNJJWd/cYwU6vDDqO3olpgoaNQCKCwcumByjBIpE1r1Kru0is8E38xISbsFSkodLIumnWK/KMsrSZC1Amgn3kgo/7ATRBlcgRTiri/Mq6cshmXYWXFzXNYLBuXqLWuI28bvfusOZIiTTPpAo9qngYQOGf4znnECNggNm9hwsP26+NIZ70J9JUc7z4cEqeARxB8OjGSFF3jBvufjMeySJDtSVPyHecgqXNl8VE7dbYJkvZV8byid064hHYUkiXLZ53ZobF7X69xYZW6Q4MxzAmkPt42nY1fY7o/jmU8I+3CUOqg6U83dFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Tue, 27 Sep
 2022 20:45:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%3]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 20:45:01 +0000
Date: Tue, 27 Sep 2022 16:44:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Bump the reset-failure timeout
 to 60s
Message-ID: <YzNgyOnWfCN+ua/9@intel.com>
References: <20220916204823.1897089-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220916204823.1897089-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fcff05-2313-41c7-8aaf-08daa0c92599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XVUVXk8w0qGKQkUOn6yGZtrJR1GbVymcUNr0w8wQlkLXS8/BIMJcXueETjWmy5gst8YJlJs+iDtw+WUqj/3OkEYry5nNs9PsoD4PIWHGTAM0MJ0ZtVgJ/DvCQTRzNprJqTFWIiNDSGlIHdSd5aIlOld4oK3gWVCaYnD8Th+XKYr8iF9i79RVmCfjgLSq/MOUQuVgDAViTRfoSihG5jE54a4S6VvTvlpAlNtIIKlW3pqoa8OIfN9ItNBaauvTk4mIMDR6kSLI5ZbG4bDG6Y83MrSwvUIHpfE8xzVQeu3+Gi9CW2cOgbOG6/3fcE4106a7yuCE40hwDHR+/tcBZUDiAuqmadnSQqtD7UZnM4q0GVtAVGQBJNQ/VKKu9yDzf3Lq2NtOhMTPB4ai/LqdBlKM52TmI45Xjs67ileCeiX65toxxoEmPZm0+wzf8vwmtF/Smz7fZf8qSJ+BIosp1HME//cG8bgKSPUbEHHQGYpY2iewm260VNMCinUJEowYVBf/s1FPSUu4q5qNpy7DN/EaQZmRubOt99TWyVOxTlmc5K88WXZqYrxrUiIbPi/fH5Cqwg2P55+z41OZU0qhqwOfcu64KdhF/eV7+NjV5bOG27YaezbCeQwal7PrGGrHPT6sc+IDdxJJ6KOl7JC0f+Ah0hvekob7pIBDGue18wQor4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199015)(6862004)(44832011)(5660300002)(8936002)(82960400001)(38100700002)(41300700001)(316002)(6486002)(2906002)(966005)(83380400001)(86362001)(6512007)(26005)(6666004)(6506007)(66946007)(36756003)(66556008)(37006003)(6636002)(66476007)(4326008)(2616005)(186003)(450100002)(478600001)(8676002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GwLe5eROnykmfdKQ5Uv+GwqrspxNStGUrUCfLueSsra4y5zGeq0hCfhToIeF?=
 =?us-ascii?Q?vACs3qepaotHu9eZSID4db0fQwAxWPUi4UCpZQ0JIQUPB09z2Uj8p9f4hU5L?=
 =?us-ascii?Q?Y7aGcjOENTb6c+Beg3jK5PfEAj9etdLk+A0WTTfq4F1bzfba6kQH1lJvjvNr?=
 =?us-ascii?Q?5DuO55MTFPHlaN3kyRE03kZ43awYdU86e8dpAfcs52cM/XvPXOdgggGDjNxg?=
 =?us-ascii?Q?ywLOD5XAzR56h5FKqAusScx8Zx2ceLeP8cM2CEs6DCXtdRr2uFrs8aFtXArU?=
 =?us-ascii?Q?v/n4azdlzUcczA/WroEz3mOGVfFZ2RTgjlzfECzDZLQFCgmm5i6o6Kivj1kl?=
 =?us-ascii?Q?BUk55e7kj8umm+2p3i5XYfgnHewpWMm0PWqUVUZ8ZfQI8Yo0brJ7dycKPUal?=
 =?us-ascii?Q?AgTK5IPWeRkrhWhlZxbPl+3IIia6p9XmL8vNTsYheg2DYzLqX1IFI5H6lKge?=
 =?us-ascii?Q?WM3TeinkmD5BvNvQwSKH88xLArK+pJImA9vLHi191zG7l9N92TXUHOz2faMo?=
 =?us-ascii?Q?99X/HMGEnyNMVI2YBQXGvzVoxs3MxdYqqDOpU3tnDe4DrfdqJi19Q3q+cfzP?=
 =?us-ascii?Q?I+0EiH9gH61ZgOZZPk5q3PzH80S+KdLwUYbP3lfqG9UxVRRr6IMvTSJi0XAv?=
 =?us-ascii?Q?Pf0o/AEGW4UD3YmcC05TfCWykcMGdYs8t5SVIcLqiR4ENRGsJz+Jb9fC4gx2?=
 =?us-ascii?Q?bon1mTpCaOI4QDlTvS4n4zsrJKLcCzWM2nA5lLkBoXrJzzdNOn5KpLH01mDR?=
 =?us-ascii?Q?pP6YJtO03JsvgIa2m0dbMYCPAES7E8yTxRi18EHgUj2o7VC0NTgucTqBXb+3?=
 =?us-ascii?Q?ehXnT1utXIr3ekTgZMDjID77LJjMpzV4hQLZVwWjGCWmUcazGfWznb+uo36M?=
 =?us-ascii?Q?I59DHE/rjmb948f1xQp57EJl31tMLViwv9y5kr2Na1yZq6ElNXAHF/+McbrL?=
 =?us-ascii?Q?fjDlny8hMberC3NJvZeBudtBHy2FtVXQBo1ab06O+Xg9+1sbH07aQ180SNZR?=
 =?us-ascii?Q?95vHqqtpnCRvYC/LtukLqTK6W/IadWGcQBDGnkpvvd5MgljffLeuOEKVnBYD?=
 =?us-ascii?Q?bSn4YjPy5+Fevv+3OwaNZxt+cDUt1nybnK12cTKTQFadeG/s2iiaxugrP8Xp?=
 =?us-ascii?Q?9HT2tsr/UtlQu20aKsMLVSmj+xwjmuLB++MJQ3e2BvZrhvQnUnOlUHhOiEqb?=
 =?us-ascii?Q?kQKstfPXt8wvpLrBg7yacN9ACgzY2DtJ8/EpkpaFTRIiyqXV7CpXuO5j9ZK5?=
 =?us-ascii?Q?Ucz7UhWxuthSdrW9fjsaiSs6Oscei+gWvG33zhgdrrsYhx4UB9NKtCw6lkxZ?=
 =?us-ascii?Q?Itkduf4JSj4ESiAqbmTINyyJV87qCdW+RQqWY8Na5bUnyiYeQwAafK9E13g7?=
 =?us-ascii?Q?6R3ZqwZb+5hPkPyJ/BHnOxZkVXEf5BWFFVT5o/SCylVIJy56hjm+KqIeTuVV?=
 =?us-ascii?Q?fjPjqspacc4rvLufI8QNBCAuTbBTEwN5ko1HjJY9fw3jUDto1kfWAE/Z2FWO?=
 =?us-ascii?Q?BJDsYP8/jy9NQZbRlplaKzb6H+NgwPY+mOjHcBlK8NAIl/7Sdu/w0nURXZFK?=
 =?us-ascii?Q?UOLlxfNPT06YvdPkcZaMUb7VXxLzBSOKixHgQ3Z9i7h0xVNMKxJhKFeV9uDE?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fcff05-2313-41c7-8aaf-08daa0c92599
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 20:45:01.3860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVR9Kl1tzYKaA3ooSp0lnmr/4ObISzgOHqA3vTcRjt0Z/NboEmkBIsXLYCfSN7Tk0aA8cSndht1fsXmU5YrCXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, Sep 16, 2022 at 01:48:23PM -0700, Ashutosh Dixit wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> If attempting to perform a GT reset takes long than 5 seconds (including
> resetting the display for gen3/4), then we declare all hope lost and
> discard all user work and wedge the device to prevent further
> misbehaviour. 5 seconds is too short a time for such drastic action, as
> we may be stuck on other timeouts and watchdogs. If we allow a little
> bit longer before hitting the big red button, we should at the very
> least capture other hung task indicators pointing towards the reason why
> the reset was hanging; and allow more marginal cases the extra headroom
> to complete the reset without further collateral damage.
> 
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6448
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

When handling someone's else patch, please add your signed-off-by here
as well.

> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index b36674356986..3159df6cdd49 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1278,7 +1278,7 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>  	kobject_uevent_env(kobj, KOBJ_CHANGE, reset_event);
>  
>  	/* Use a watchdog to ensure that our reset completes */
> -	intel_wedge_on_timeout(&w, gt, 5 * HZ) {
> +	intel_wedge_on_timeout(&w, gt, 60 * HZ) {
>  		intel_display_prepare_reset(gt->i915);
>  
>  		intel_gt_reset(gt, engine_mask, reason);
> -- 
> 2.34.1
> 
