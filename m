Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD17573F5C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 00:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25139B440;
	Wed, 13 Jul 2022 22:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC63996C0;
 Wed, 13 Jul 2022 22:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657749916; x=1689285916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JAn875rryMBrMhD6oNkNcmGpR9KLhifLHYNgMkX1ltc=;
 b=l2b7AJgKgz8S/3o2aJKx1kS8tGW83PN8LT0LlQolEWMoFZ+OlL2qil/2
 kvaKJotpWZJut+7nPo1e9PFvJjAsiBBxis+w8lCg9hrQHHURYNAhucqJm
 KOs518JXvGNvpq3mfVXJ8PZaWivQODZ87nWpSmzsyn1Sy/Gmvkizo98ir
 UQg2NZPNEM3R/Me4zu9nTemOwu6W2egtAsMoJJHkwSdt2PSuj+H2o7H0q
 N1i8zhVfod8uDTs4MhUhTnVev3r8Tob/JUBmKNueVcXiLcsB84OHLYC+l
 zBnubTop8qvjniS1B6YcZdYESYel/6aAqiRJeEf/IWR7rxYLYBNpVBKqb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="282909678"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="282909678"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 15:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="595866467"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga002.jf.intel.com with ESMTP; 13 Jul 2022 15:05:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 15:05:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 15:05:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 15:05:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0ALJlZ6HidyenhL3M9ArciRzIV9i5asxMgH6N6NA0cUo2kNFmWnGON5sFU1MlkjdAvtqGGMcJp1KplQasHUXfElR/GSfnvuP9HtK+UJIGf5ovH7rFNJv48Rw54dfEiT+G+htkEXt9O4eM+LehKnR3rb1nwUCRI6RQglgdyKD6FGzAujuBwCSFwW+FUZwopORMlL6Dr6YsVarXfkKeQA1UHuLzjfsOUY5I9+HXMoclRw+1yGE5ec1HgGHOodo2maFhwXoZD/PWlViVK8jaO5XZzArEzjZLPbZd5Tu6YBD1eoapBpoOlEEjcfG81eH2I6E2qAMH2s2vLb+qbD9NbIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yB+hpjwESu7SAdqp2lSdtKvUo/o9F+xPPDSQtYxsl5o=;
 b=VLIgJqddNFZMQjkSR2aY3u5bm+IcQ8hjNPD30RJ70uOexgR+OhZqDVMDPpyFGGwyfRGxpXSLTUcr7EacqBCh7mxTnS9TLW7gsCwYaFwXBnjKf9k3UrBxtNXyUI/kDQsLiXOIeRrWQKCNkX9n27thUrkLUGf4Hfbuj7EpPYLEOndFFaDCiCr83f0y9mLaLZ3935jBuj+F6UfHN30w2iDnlxbnkOaCxiAiFP4KEzn44EmXLlS55+Hfvy07T3lQ5NFNpZnENhygQYQfh1ZSt9C62WXNN0p0cSrEvMEi75p5pYsOYEAdipoMU7yPKugLAA901KapgDV2mSjMp+f9x589cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MWHPR11MB2031.namprd11.prod.outlook.com (2603:10b6:300:29::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.24; Wed, 13 Jul
 2022 22:05:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 22:05:12 +0000
Date: Wed, 13 Jul 2022 18:05:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 05/39] drm/i915: display: fix kernel-doc markup warnings
Message-ID: <Ys9BksNo/iylds2g@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <e860a7d8e5f9c41c462ef354b9ca6f36ae142e1b.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e860a7d8e5f9c41c462ef354b9ca6f36ae142e1b.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e8edfb5-e83c-4ecb-8c34-08da651bc1e8
X-MS-TrafficTypeDiagnostic: MWHPR11MB2031:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5gzV94X9noP/33a4d5laFxkdqH0nn4AS2yUCQi2sIHfPuKdnDRnkN6lIBPaltgyfJ+kADJCw3QMq5AeEAAtUnvPwxpyF9yPkFOrjkhyBS+sRCiAZq0f6OqyMQnauTCXUYe3l36VywxZeTHEt/ORw2JZkS10Fmtl2XvGu3LQhi2QwCB+mxGneNk4VzmibcfPTLFU2bvUKu5nDKpWwEQXDKVY9oVsFiDikm6o6bGLsPCUOK6PKwyWFpjpnlAO2XQbcxiPyZp2SH6Jy+8XN6swGi1v/vnvsKRiPIuiEeC4LeHovpmhCXDfKV4zgi6+IoskBCa5Lujdw+Do25U5P0cM1ELFfI8RZPQFgsKJ2vsOwzM/h1pd5tJ56+Y5EtdCTtKGCNwIfUO0AQ4hG7BI/2mbtNuM9k9AMLopcVOKdoWg5f5qKRnxcbUSl+6/SwNawb8JflGatuy9f9ZEpFgKx4uy4lp+xwSfGQg1niiLrW7ClUsOIO1WAk2lvkUqLzmA3P2gj6QUnQ05ixoBztX3sdjOB41qjNwWEIU7NcCNSjcVtKFd9Nnyh566xi+BNq3NW9yogB0uFB0BfTNvioa+DBFbtKkud65Kh4PilYUFIp1gDNon2TEAtcVmWvH72smF2tmTVvcNbRVCNRFhGCfHJb4WvUC63RDZENlXbkSms4QJWE0Oj4GGbvTh62Nv/pN2hbzkpbUp+2P6wxblxr1oZPQNDD/bEoblX/3jt1075Glg3pi3AAmIKJIK+j5emZ75CyzPgFt21IkE6nex8VZkE2E6ktxbKuNmXRHocWcG0y2KO7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(366004)(39860400002)(396003)(966005)(6506007)(44832011)(316002)(2906002)(6486002)(6916009)(6512007)(54906003)(6666004)(41300700001)(36756003)(26005)(5660300002)(66556008)(478600001)(38100700002)(83380400001)(66946007)(66476007)(4326008)(186003)(2616005)(8936002)(82960400001)(86362001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OTQ2hP80aWoR9AZ2uFXv7Nny/QoBfyP9N3Vlg8DL1k3W0Kz47NoOEYSgkpJR?=
 =?us-ascii?Q?UtSAKOegNRuic5gj6HMDZ/eBW0zdGxahd2r6nVB+yFJI3FjMZPLTFF8Db3z8?=
 =?us-ascii?Q?/i3DD8zo7se5FcHhF9xAhDbS6DoU2GSVEpOwAt/PiaeffcpbOY3Cn2a6uSgH?=
 =?us-ascii?Q?ntTgjLBfcG7h1ieP0gKDy2ewJ2t8fO0iibDX5UcxwFtW1nG7OcF4j9nA2kcV?=
 =?us-ascii?Q?hLVzZxbFEpFoE3jqrgIiSdKqSCHjBz4kq1UGs3x2IPURNnzYF+lj2gtyAaiP?=
 =?us-ascii?Q?AJfM5RxbnlB5yil9HNiXi1Eo1pFbix60zkrFUyufv82fT0yIYgZ6X8lXb7EG?=
 =?us-ascii?Q?HAGSFTcsD1eanfyVzdMx2Xk+YlHum3lm/eDlpPe2Qg+IuEaSl4TInbrxPXLV?=
 =?us-ascii?Q?1+j5kU4XVsKT05tOggn0XOPxcN5WM2Hfs6K0sUh1qAuhNPGt6PiMzglWXytv?=
 =?us-ascii?Q?I4AZzaoR3jmk5zAp3b4UcFu31azdfsO29rUMrL7pi+J6EJH63Yfx5ZYcuToA?=
 =?us-ascii?Q?CXH2CoLyuPSFO1Vw0b2pNU2XesTMBXXMXTfJ1uu8djJ98P4Fy2Ud0FSEqy/n?=
 =?us-ascii?Q?HbMt7h3LOwDcTgNQliAguRINjEd5e2WfgOzoyRSujLFkE8InGYX8KFIbglFQ?=
 =?us-ascii?Q?C8l8LXK8RljYsa/pXFMhl8J4rsr2Rp7L0ZzxuSKhpnDakEkMlDOYDkmjY4uw?=
 =?us-ascii?Q?tAjvUEnkG9TSCFJnEOI60yvZvCv4JCcW655zf+ON5NXm/Tq/G7w1xcPqq9M+?=
 =?us-ascii?Q?d784GYkUNQ+i5gXNUXCxJi54faJYepqSGK1M6R4QkcL+4Zo1wqGSw32ckBS1?=
 =?us-ascii?Q?FrhtMkpU8qosD8QYhN8OZTc3oqtxc86L6MxD5qbUthjWsmZuJ8DKWL7TK3fd?=
 =?us-ascii?Q?MkXBQ/aqet6XXWLNInWsPz1R0muR/2j95/6b8yssGOyp9KVd0mxcPdUXYog7?=
 =?us-ascii?Q?rDl4K5XugQL0m54nKUTVKLlXi93rM58BBUQNZqaBaqMwpe93V6kcI8o3hN+Y?=
 =?us-ascii?Q?GMhczj0kXBt18DtwWA0I881s/D//PXVNRRe0d3CWgpI6EvK3c3bpCLlbWqD0?=
 =?us-ascii?Q?otbvOuBA2ofE5zPt+cSv6ZNZd+LgtkeedrvI+cCV8OAraGfbidtbYuNdd5kl?=
 =?us-ascii?Q?Khg1YJZU9YGRiP5ldmMxK0mBVqIABewKdTq45G0VPjRlUfEddsdjSCrbdLb6?=
 =?us-ascii?Q?G38Bnn4Ey2ayZcovPDZRxvQRGiSu32OTzqJ+uFQbgkNHzkK+WjA9WbciSpjJ?=
 =?us-ascii?Q?K5ixORFFYshi39Se0H2KGTm4O2q9/bU+FKC9k6paY8t3Zxn316ehFZey2kXl?=
 =?us-ascii?Q?jtI5+lkO1ujTetTa2x1ST8iM1oB7RV16ZKWt/GOstjbDpIv9seBMeIhn1ebh?=
 =?us-ascii?Q?+wzjOXHiqtGtK0uQY2Ztks4uLeE0fJnXIzR1jlqwuKDqUQVRcH2qzEwhfn2N?=
 =?us-ascii?Q?uLxN7wpdRKqNCKoZKuIq6yj7gR4Mqbb8mD7qrx2eHn9P5hbTamDZZVMv8MXk?=
 =?us-ascii?Q?2SQSyWvAom1qc1XwwC3hCHlWN+hicxQS7ZGOsM2bx1G4W6xIb/IPT2G3eY1f?=
 =?us-ascii?Q?tM7GuKboGtSfTQsMjVBMC6/mxU8Jvh8UFmRX9zEYhK8neOrEj0I00GVFNEpl?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8edfb5-e83c-4ecb-8c34-08da651bc1e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 22:05:12.6235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wd4oVwS+8k0e2376bdMtwsLeKtEhklnr7FuyG4OZqUctgedeyPGNoT8LL7UN/o3gu2pZoaWV1HYJSyjG/S1ryA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2031
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
 David Airlie <airlied@linux.ie>, Anshuman
 Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Patnana Venkata Sai <venkata.sai.patnana@intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:11:53AM +0100, Mauro Carvalho Chehab wrote:
> There are a couple of issues at i915 display kernel-doc markups:
> 
> 	drivers/gpu/drm/i915/display/intel_display_debugfs.c:2238: warning: Function parameter or member 'intel_connector' not described in 'intel_connector_debugfs_add'
> 	drivers/gpu/drm/i915/display/intel_display_debugfs.c:2238: warning: Excess function parameter 'connector' description in 'intel_connector_debugfs_add'
> 	drivers/gpu/drm/i915/display/intel_display_power.c:700: warning: expecting prototype for intel_display_power_put_async(). Prototype was for __intel_display_power_put_async() instead
> 	drivers/gpu/drm/i915/display/intel_tc.c:807: warning: Function parameter or member 'work' not described in 'intel_tc_port_disconnect_phy_work'
> 	drivers/gpu/drm/i915/display/intel_tc.c:807: warning: Excess function parameter 'dig_port' description in 'intel_tc_port_disconnect_phy_work'
> 
> Those are due to wrong parameter of function name. Address them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_power.c   | 2 +-
>  drivers/gpu/drm/i915/display/intel_tc.c              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 6c3954479047..1e35eb01742b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -2229,7 +2229,7 @@ DEFINE_SHOW_ATTRIBUTE(i915_current_bpc);
>  
>  /**
>   * intel_connector_debugfs_add - add i915 specific connector debugfs files
> - * @connector: pointer to a registered drm_connector
> + * @intel_connector: pointer to a registered drm_connector
>   *
>   * Cleanup will be done by drm_connector_unregister() through a call to
>   * drm_debugfs_connector_remove().
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 589af257edeb..fd6b71160a06 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -685,7 +685,7 @@ intel_display_power_put_async_work(struct work_struct *work)
>  }
>  
>  /**
> - * intel_display_power_put_async - release a power domain reference asynchronously
> + * __intel_display_power_put_async - release a power domain reference asynchronously

oh, we are really using __ prefix for non-static functions?! o.O

anyway, with that ditto "()" consistency,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



>   * @i915: i915 device instance
>   * @domain: power domain to reference
>   * @wakeref: wakeref acquired for the reference that is being released
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
> index 6773840f6cc7..7ce0cbe0de05 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> @@ -797,7 +797,7 @@ void intel_tc_port_lock(struct intel_digital_port *dig_port)
>  
>  /**
>   * intel_tc_port_disconnect_phy_work: disconnect TypeC PHY from display port
> - * @dig_port: digital port
> + * @work: workqueue struct
>   *
>   * Disconnect the given digital port from its TypeC PHY (handing back the
>   * control of the PHY to the TypeC subsystem). This will happen in a delayed
> -- 
> 2.36.1
> 
