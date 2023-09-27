Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F97B0EDB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 00:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE7210E199;
	Wed, 27 Sep 2023 22:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CEB10E199;
 Wed, 27 Sep 2023 22:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695853426; x=1727389426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Ehz0SV659+a11aR9zzUy1oKnBz/967EwX+lesf1ESU=;
 b=LW+sraUPcFW2B+a16mJXlWf9q6iLozzgaGhW0kl5FldskfNhscFIDrcT
 vrVjVeLFQ7zRF56d5V1LaDz5iBmhXHkw5ICd6uTzNJsObYuBCilgMeOd5
 EJAiAaBwFcYXSM5hJnbmuE210wVTE93KD1hnFdauSyWRdV4/uMZrXI03Y
 WWZxas3C/sgd661FP6+N5x1NKh/6W17lDDq+Og4QKdg4cjz0TT2QThf7j
 M2wXJXx690aPlaN6Cr8UvDzs4wjA7O5Crc/DZ0fjqrJt83lH8tMrudHcA
 aEuLlrr5xD20aMNsSu9yNFyU+9s7X1bMy5pXqEoFVtZ6mCMVqWrmn9/mQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361317344"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="361317344"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 15:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="778693601"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="778693601"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 15:23:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 15:23:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 15:23:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 15:23:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 15:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0eTG/2L0f0p6+cmSJ3NATgkrxbLpkuj7WhW2i254WemjAu1wXUb5zJ+lodYbkv2ki+QfYFFv3wqhGYaWiuNlHHQ3cUWJPrPk4EieQrF0r0hICoO6TyMNKWdr03wwpvi/w0zmLUG3qHhbAO8CYIm/QneIQZaDNazexmDtnOxLCQyo6csdvfriOuRmIlKz3xpQCVt3jMvC9+YlMoplC+zyLNoQQtqVsGjnsEc+eEavUTN+IJ720FSTu0BpyV8c02ZpnwZ+Akt1zXU0VLBsfaRykB0Be/1sAKLHO7vcnJC7+hEr/Yj6XhMyHnH1xSPleTa83HpCr+Z7JuDUhakNiHm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46gKutiCkVCQTjbqMJScD/viX7bv1Axfw0vYFj9Ro04=;
 b=D0Kz6sNF4/Xqq2BGeGLF1Lfl4EntxJWnQajXGcDjaLGqvBs5ovm0YF2NkpztOgUyw/gafDENs7WMrHMhnVAtEp+Mjkij/fC1tWKoOkWFMkQ78QXh50wQdn6HBfoXjUKtn2uk86tO6Vs+T6ECklzyWUxHCUgexOJHL3ayRsvxGdX2YJ1Y+j2/CMCWPt7/pSQ3Cs4EnzBjTUoKdd2k9831p05ixJ/1SJuzESK0lEB17CaOlmO3r0/85hEtQgpQgzELXnb5sQN4PzW54+merhwjrp3asdnJs5zeraGEU1yBxznuEtKrDfIFPHsMFyy32siY+O6YS35ne/Ntdvly+zWUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM8PR11MB5669.namprd11.prod.outlook.com (2603:10b6:8:36::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Wed, 27 Sep 2023 22:23:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 22:23:42 +0000
Date: Wed, 27 Sep 2023 15:23:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v6 1/4] drm/i915: Introduce intel_gt_mcr_lock_reset()
Message-ID: <20230927222339.GD2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230927210357.17461-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM8PR11MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: ef97d02f-82cc-4237-21d7-08dbbfa8682c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTdickUXAInzmK2tQLBtZQHW1bWkH7fHxgdCCsOdGS9INzKBgRLfunUn806wF09k17qwCp7vLKRJhPZNfEsihtNQIgrcEvj5JbuPAe0pln08HdzfYrOvMKqmYPEL4W9xZmdbrlHJfTKEeI1Qdonipf/DwksaI14Ac4eP6kAkdahEQxqdZe11GmtE1xSx8ht1d3zj8MLLthFPZ021hjCrnEg2+OycNlpHkOwKvBwrEgoNiEPqyQEeOtOI6gRXbkXu0AgAcmgIlhFam9QurLg5HO7EU8juclupY69liQpK2msZZeLE1TBMSlvd80QQVK/V9rnD/29jTO7xu9/tktLGkC7+uS3jXscWZX7aIknpf4q9daZXYpfAKdBhfXD0Ce3O5bYV7oYSovfWfd5aL1cXrB7MfzMJGt3Q93F0SzkwViNS94FCJakdUFAWMKkj9s9llpfOrXmpipDnqj7j8QGEGP1SSKue+UGShuBdpN3JaFGyqqlKNW+Om7YV3qiNxzwMFdxEgPa+fkeyC0U/qQql13P5gbYHAmrdY2dQsfMs1skgtyRWzuzWHrxJQc/Yw5kE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66556008)(6636002)(6512007)(2906002)(316002)(66476007)(66946007)(4326008)(41300700001)(6862004)(8676002)(8936002)(478600001)(1076003)(6666004)(38100700002)(5660300002)(6506007)(33656002)(86362001)(6486002)(26005)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jafy4ONcC/Pi5+6H+L0cmenwlp50cWESBz+lZxGeWz7yEkjQj1iikDEFxnw3?=
 =?us-ascii?Q?GHmTMSUmijeroU+GiBv7oA128z8hkUpPy4IgXphBWyXnE8nTsWUgr4EpeGvi?=
 =?us-ascii?Q?0sGAJ18zAX11nbpnyL5FT0h8/g8oQ6I70suKLyqY18tYZSLnb/Mlqa47s+a4?=
 =?us-ascii?Q?AhWsAWmxGQacA/HkHAzViOG6lKFPJA1HxFhBSB7XOvAzhIolsdr0BY7sFCbW?=
 =?us-ascii?Q?OavSpX3DpSK3EhHlTQCBpivDqNC6am3zmRH+wxSgwLBqGqqLHpmMA/8ZIqSA?=
 =?us-ascii?Q?vJXAxtqnkgV8Xh/61flsUr3N7tQWOJlkXStC5szkEtBOfVxQZJyOg/lsrFFj?=
 =?us-ascii?Q?HObh9C8V5g40oYGFEBMNXl8ZVEtOjskjc8vR0tl7hu/BMrEAmhPoctrI4WQq?=
 =?us-ascii?Q?sO2YoI5GYNEOmoRViEt372aJiDns7pSymZ6EHUF3d1WVkfFcNgshWhcZv5SN?=
 =?us-ascii?Q?XuuLkP1oxDuHAqgxSOMSqfi+FwEb7oovZzBr0Owup+x2lBRo1kMeKMt10Nca?=
 =?us-ascii?Q?NMUk3FqlAVrp5dP2WApSHUOvBpo831BkLZOapdg3/DGAmUDYUG8rbapEGg9H?=
 =?us-ascii?Q?tro2m7m8ydjQPatwNdDNyPG9/8xTc+JO2QsW15A+DxlhsZBSeKyQma/t3pnD?=
 =?us-ascii?Q?a0qSVZQDBuT8+0fNzFJP3c84OuQGxpZXzrNrQMeq6AC2yEAcGF2YHBhbNdou?=
 =?us-ascii?Q?ngx2XeRapXBcxhs+gRgVg5q6mvRRqBp9jBQPRWGFxK74yUNa+bBLG7rdN8mJ?=
 =?us-ascii?Q?PvTh9p+QWtcHrU4xesCNNn5bQOiwMoWNYZg7kKCxeGu2WxmKM7sVDW+wWiqN?=
 =?us-ascii?Q?uIeG1WIUi7AIwdaS9kfwh9p+9Th4h8xzcZ6X0r6gOUc8RgF9CkEkdkvZnH2D?=
 =?us-ascii?Q?icaQlfjNdx5Pbg6nEfYIVGnHQ57+KGqyY4ka1tPjg46GbADz7k8VLJ9AR7Li?=
 =?us-ascii?Q?uoudAAJXlSi041besp/u2qOLARH6WnbXVRs/FZUj2H50ZYAZahDhpeBjhjau?=
 =?us-ascii?Q?yik8aqmaR5eWaZtyAKZVW91QZOCBfZtwYJ/qskjOYfK0ty4D+wC+h4FtDBk9?=
 =?us-ascii?Q?J04ov8Ib0BhBH7HIGbK2q4XmaH58TRpiyLM5+JUiWI6YH32noWtg4+NZbMxa?=
 =?us-ascii?Q?PPGRw87RW930jnW5BUT4JCfpaLQXOk7qw8/nB/k6726yXcj5+P8w0tty2vqx?=
 =?us-ascii?Q?1rk4DOsn99mcnpr3/XmNv5BR9NOslk7PLJp4yi7SvYvWTkMctSo+oBpK+600?=
 =?us-ascii?Q?od3qtCk6JgZMojMMmLPuecrfWfQO2CSWSoIn0hptaaV7W3V+vbq7dzKmTTP5?=
 =?us-ascii?Q?jf6U0j1sRzhSeusZ33ua0Uic553ZzTm1o60hteroyZ9l9y6AcZtqGuNAdkVz?=
 =?us-ascii?Q?jeXcoxnHgSCygpaHYQaXXuaIPExIW5UydGMNE5PPonWkbPRTrRoZEqToOepZ?=
 =?us-ascii?Q?HDVj5cQRxGqGEBXXZqYIsMiJG/FlmOr64G2ymtRZBS7xxwJReLYNkeo4zL6M?=
 =?us-ascii?Q?a6hKDSPn9eqfp5tUXb+XL0xiILxxOVWkcKIwg0BtLWcrzX9IVcZUMhmmTRaP?=
 =?us-ascii?Q?ab72YvttLO+FLlaTescVp5Yw6ecMLvgMgbORUZliKax1AQBh6UQlDl0501dN?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef97d02f-82cc-4237-21d7-08dbbfa8682c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 22:23:42.7863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUOwqPpI87yjqUzqxDm7OI9Taq4ZjNv/xmVfXzMAd1PTHzX4Cv7IQo6jMsudHXdKciFZ0DM+iTI26pzzNS2EJzbE4kwTNhnFbBUd9UIzuPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5669
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
Cc: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 11:03:54PM +0200, Nirmoy Das wrote:
> Implement intel_gt_mcr_lock_reset() to provide a mechanism
> for resetting the steer semaphore when absolutely necessary.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 29 ++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index bf4a933de03a..d98e0d2fc2ee 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -419,6 +419,35 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
>  		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>  }
>  
> +/**
> + * intel_gt_mcr_lock_reset - Reset MCR steering lock
> + * @gt: GT structure
> + *
> + * Performs a steer semaphore reset operation. On MTL and beyond, a hardware
> + * lock will also be taken to serialize access not only for the driver,
> + * but also for external hardware and firmware agents.

The text here makes it sound like this reset function is going to take
the lock.  Since we have the same language in the lock() function's
kerneldoc, I think you can just delete this whole sentence.

> + * However, there may be situations where the driver must reset the semaphore
> + * but only when it is absolutely certain that no other agent should own the
> + * lock at that given time.

This part leads to questions about what such situations would be and how
we'd know it's safe to use.  Maybe it's best to just say something like
"This will be used to sanitize the initial status of the hardware lock
during driver load and resume since there won't be any concurrent access
from other agents at those times, but it's possible that boot firmware
may have left the lock in a bad state."

> + *
> + * Context: Takes gt->mcr_lock.  uncore->lock should *not* be held when this
> + *          function is called, although it may be acquired after this
> + *          function call.
> + */
> +void intel_gt_mcr_lock_reset(struct intel_gt *gt)
> +{
> +	unsigned long __flags;
> +
> +	lockdep_assert_not_held(&gt->uncore->lock);
> +
> +	spin_lock_irqsave(&gt->mcr_lock, __flags);

If we're doing this to sanitize at load/resume, then presumably we
shouldn't ever be racing with other driver threads either, right?  If it
was possible for some other thread to already be grabbing the MCR lock,
then that would mean it also isn't safe for us to reset it here either.


Matt

> +
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
> +
> +	spin_unlock_irqrestore(&gt->mcr_lock, __flags);
> +}
> +
>  /**
>   * intel_gt_mcr_read - read a specific instance of an MCR register
>   * @gt: GT structure
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> index 41684495b7da..485c7711f2e8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> @@ -11,6 +11,7 @@
>  void intel_gt_mcr_init(struct intel_gt *gt);
>  void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags);
>  void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags);
> +void intel_gt_mcr_lock_reset(struct intel_gt *gt);
>  
>  u32 intel_gt_mcr_read(struct intel_gt *gt,
>  		      i915_mcr_reg_t reg,
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
