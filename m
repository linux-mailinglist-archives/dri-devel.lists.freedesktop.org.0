Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD27C576F21
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C155010FF56;
	Sat, 16 Jul 2022 14:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9CB10E153;
 Fri, 15 Jul 2022 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657920717; x=1689456717;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9FsifD2wZSYNkQY9ndJdgbpgWQQdsMen1A9lmBmZxe0=;
 b=hTOr5XQuk04TLsD/Y2zmjINPaT9y34+v54LJoGETyFH4tC8fy+QY6nAK
 hApti/M3g8Pr0ySPV7/+mwIpxXwkLPBQf/a937wa2BQrXrKVJvIVQp4a7
 quNA3oVjLmiVkVUN6rLX/0E5bGFBFFxeFBgqX/SAvFMJd5bgzbmaJLlOB
 YLc5J2p+KX8W2pq9jyiln7LeQe1cBXi5oaQz9GHagdB66mcers+xcQDM+
 XJUwbzZfI2SaqvseLQc6lP/u4EqOw5XBoahd+fD2oAvlQANpjQMLLk2rN
 dI59FdGkEO4iZanDlwTElfnyV6pP5djBBg6SoRMHgx+2XOdqF0QPFImgv A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="372218703"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="372218703"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="842659192"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 15 Jul 2022 14:31:56 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:31:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:31:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7He0l+bgGAJZY+WAyjr1BV1ZSCgHjz7hyGpAt0R0jaOTjGezsYzzS8r3oiw6ZfwbVCp2mCVKqOjdCPI9k41ZezHXo+VQImjOVDl8CsRpU9ZtRLtioFfMA+bYU/SOE7Y/4CzuAN7WHhTiqvpmrR8F7I8I1raSnDnHkeFy14j58Eu2o1ZoA7/4Loc8XdsElWrq+wkxTdddDjbyhsY42PtuaHNnRSzSmTdNuKhZbAliX7p8UC7+4Nvdh/wQmWlFAHY6oLJa1v/wR8wDGWn4+qbb2rcR9iLBkIgXMQ0M74qwKuocVWUExIY+3mVmxXPqlZqcdigU6bLyVVwfEak5DKJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuFQk1HSbRpjJTUPSZRm7PjQHb8td7G+N8WnxKRJ0V0=;
 b=Sql+ttJBNb4THUDdYisu/FUyxUTOqAbOM64L0P5x73cknHl3JAPzPSsUkPfrFLmbQ+WxlB+rcnfRM8eeApX68Ew+AQwyFKd7gLss1blneVpJINGX+x/hb0CvZRnal1FN4yeK2YTVBLhXdwiaY6D9JhiIT0FfhKGRdTlcgpSa/J2bV4ni/E+Q+LuiokrE+mlwYC3cPW0EuS/UATuKloO9+jQDwy4P49EOtoPTKezkvBZ8AG6bZGXHmWXci4o94l64aU+Tmd4K9nMKfzJ4xiQQ5pvgZ++cDfOY2VoMbqCFHIZ1dVXzRbc4EMmOUZvG1wFrLCAtBaQxQ9E0NOxdgKU69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY4PR1101MB2120.namprd11.prod.outlook.com (2603:10b6:910:1e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Fri, 15 Jul
 2022 21:31:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:31:54 +0000
Date: Fri, 15 Jul 2022 17:31:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 14/39] drm/i915: document kernel-doc
 trivial issues
Message-ID: <YtHcxUNGPk8pdHtR@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <6eca50ad78a54cadaf8e4deecec2309400c24164.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6eca50ad78a54cadaf8e4deecec2309400c24164.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f57da322-cf2a-4126-5796-08da66a96f99
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2120:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBtXoDWpSgbt9JPFvs+alz7X7BL6Jjo/9l0mds1xxzs68NSdtQXPWfZItOThDEXzI3R1Ubf9tLOfUcxpmhRG96yjMrMRA8Mi24eZhAZ9XW9SOLWYW6JCWx8KGCZxlfBS7wBr+w28zx3a/hyMhl9rj1KxyU6ryEasVCRs4zRcgPQC9m2VOJTnnmz3CF2mMXrLZ9XjZayMP4re6JNLTGG5uKng41PtkPbpv0128rM2rUzLtmK906d9N5nq/QgrKWp7+dokO1OWVISOz3sTp7XeopqktrFqOn3xeA/2EMalN6tHPZ0Jn5Q8SBhrqwpd5fGzmgoRq1qX0+hcCUMODkD4LCZTXcnRCXyJnMWs1k8pZbuEp7rNR3hIdV8ULoWVMQpdt41L6V8t6ASHz0mg+NyqZ7O2uy8v+QzLsCWsbtWVZrwCsjucuBGUumdZ7NWJRVfoRzKeXawcj4Vl6OJ/IVwiaE+QtLEyCOonwfvwEGcWY8a0u/+MrxjVfLhVazDLO9Yhn6WD6964EcOQUddvdjqeE7Fceng5cbuh3jhzWMokCwgK7eV4EqikTfZQrzcs0B1UlzbRRONmAMXbVv2V5+MAcRbP0QCAdozZwQdFIbYvSH7E1zHzHcOpi+aYKz/27IUWOAMP5SCIBuAD5BsSRNaUBChsdeu1OW1lxw2QazUY7zw8q0BgtItWTdePEno9BigpCnBUeN8vxRGbTODwsMudz4nHujththoYze3r3Hs8xPE8tQK8SifX9O9m4BF6KJRrvbB62bVnDfLNUiyH+5aSkjtw5UQ2xjTHpG+eXiJBrhE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(346002)(376002)(396003)(136003)(2616005)(6486002)(478600001)(41300700001)(186003)(66556008)(2906002)(36756003)(83380400001)(6506007)(82960400001)(44832011)(966005)(66946007)(316002)(8936002)(5660300002)(66476007)(6666004)(38100700002)(6916009)(8676002)(26005)(6512007)(4326008)(86362001)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Krdxi5ApWzdIM7ZuPGeZLOGOHQ+ET+xL5cKpT79z/Iyjvd4Y+29TJVZWhpC9?=
 =?us-ascii?Q?cmUP5Tak2ZUwygwtJ4pnuBPsLk8iS3BFbvHYlnHYtcLI84QTD2uVm+2e+Y4U?=
 =?us-ascii?Q?tNv+58ai2HCJDrmKC4yf4pmzstt7YPXNlcyIgDL9J/0kjQhw1Rik8s9QRNBT?=
 =?us-ascii?Q?2YftKwY+yGzy376ivV/jzDibIk9VgzspcqC/d770Agw0ugPPVSzp9kRUP2C2?=
 =?us-ascii?Q?umm0RcOrdgOEmjXxVcOI8/2nQ3tsNa3P9axKrNTYrZt4KR7pxwLa2p06oyVC?=
 =?us-ascii?Q?3yTI99ufCyp4ZlxOL8uuoZekOGaLYmQwsjym3t4O82AFA8aQB1kie25mM+zW?=
 =?us-ascii?Q?0Ncl1zquPQOsk4TkuXd7OW/O5F1nT4B9H578Y2xHf/Yz3NLZ/OVTO2E3zukQ?=
 =?us-ascii?Q?Z6AeGc7yN+ghmNvPcksW030WiiYmnRT5hthdjgTvAS+JJquzS1bDyCRTwhbL?=
 =?us-ascii?Q?UAArbILDuDAj7vZExQ8HLurhxImWCpB6PPTdnIeix5bDOPaO7QCIYU1v3cuO?=
 =?us-ascii?Q?Z9G2yw3VkvLbuUHLm4HwcMv1KaVIM10VitoSvXTFJvbWYZ2qoXglwOl34KfJ?=
 =?us-ascii?Q?wOHDKBasmC1yoDzfvp0Y6PtO4IhCRga8Q9mxbEUJ5oNZc1Dvwbqjg9KHHH9y?=
 =?us-ascii?Q?IRp4rA7WUvMgXWegqpLoUq3gLD4JO1/on5jbvbrYAInQbIFpq+VabqyeMT2/?=
 =?us-ascii?Q?lifBMgt7sbpfigLRmlfn6Ehehs6Jxe4FndhQX2m2ll92HpuWPDcqwA2wYMqE?=
 =?us-ascii?Q?UL2pPswUDtsyGgs5vzQDuTuyWqNnIpJRihD+m8p+7eNBYQORcwE+bIJUAyQx?=
 =?us-ascii?Q?0dgkP/BzNyr6kO1lNLyeqSzCGrPAA6mr3noal6R6X0CAYEIOo/vwaqr/HZIr?=
 =?us-ascii?Q?i6sJB6gNWh4nNcqCeTIBuhD4ZT8R3vrX1mZh/miXnE3iodBBMJSBKuYOxOMi?=
 =?us-ascii?Q?ZWvlAA+td3bgMmSKn8XTa6ENzMReSc6cVvuIye9DAnaNBUhrcL8KQqAMHPpe?=
 =?us-ascii?Q?ZwqtNLdTHlDyHe74E8+SQMVnPGee/SIBA0kQlwfQZDjxnhAgP3PytDHrBZHr?=
 =?us-ascii?Q?DGFDL5i/HzgJoFUa2lR7IPtmq8l8Lu2g4LuU+nrSS1alSs9XvUByGHjMqHkn?=
 =?us-ascii?Q?32c0lpHndwZigIXbuieek6QL6ejuCqDljplMX6BbWq+8RpDZULIfsFes9l7y?=
 =?us-ascii?Q?0+lJEBH1g5p9v2iD9z1YK9CZ08Fh8qcIAsRucVAWG8YYccCakXHidS9QXlvu?=
 =?us-ascii?Q?2O73LNTsTwv050ddbe7e1qWcHKkjyNkgpB4AqJ2pS1WZVV34v5WrxPbNM37F?=
 =?us-ascii?Q?XiKps0PE0S3sslW+aNS1KR56b5Hyjs93EJyzSlY6LXQMMH+f5Yr0li2d6AZN?=
 =?us-ascii?Q?PXhI+c+cQQHXoR/a8f1UdWQ6ETyMuiQrVJyAAL580JU+s0wNSqiripVCKxvK?=
 =?us-ascii?Q?KaxTJ06+9P2m3eWhMPw92v2DlgemZJOTQTjqPBc3iiFERBbAkMWAnWCLpgnp?=
 =?us-ascii?Q?ecRMlX5uPUwf3MP0vur3HlXsFdifd2I8lGSOF94NsL4k/nWAVv82M7cTU4Vy?=
 =?us-ascii?Q?yX/TNFZHMnLWpaxOU7Nto2nDALS1Ru/UmCHDGRIRR4LKbBk80e0+dj2vu4ei?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f57da322-cf2a-4126-5796-08da66a96f99
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:31:54.1984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRENBkyvcxu6QTGi/wwTbJ9n+4hZkFZwBlrmnrIb+EX1daN97s17mMPk5y2PhgIkMmSnDS2d4d1VZm0fItHyZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2120
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, Lucas
 De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:02AM +0100, Mauro Carvalho Chehab wrote:
> Fix those kernel-doc warnings:
> 	drivers/gpu/drm/i915/intel_region_ttm.c:199: warning: Function parameter or member 'offset' not described in 'intel_region_ttm_resource_alloc'
> 	drivers/gpu/drm/i915/i915_vma_resource.h:123: warning: Function parameter or member 'wakeref' not described in 'i915_vma_resource'
> 	drivers/gpu/drm/i915/i915_vma.c:1703: warning: Function parameter or member 'vma' not described in 'i915_vma_destroy_locked'
> 	drivers/gpu/drm/i915/i915_vma.c:751: warning: Function parameter or member 'ww' not described in 'i915_vma_insert'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:159: warning: Function parameter or member 'gt' not described in 'intel_gt_fini_hwconfig'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:146: warning: Function parameter or member 'gt' not described in 'intel_gt_init_hwconfig'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:113: warning: expecting prototype for intel_guc_hwconfig_init(). Prototype was for guc_hwconfig_init() instead
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:113: warning: Function parameter or member 'gt' not described in 'guc_hwconfig_init'
> 	drivers/gpu/drm/i915/gt/intel_engine_types.h:276: warning: Function parameter or member 'preempt_hang' not described in 'intel_engine_execlists'
> 
> That are due undocumented parameters.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gt/intel_engine_types.h    | 1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 5 ++++-
>  drivers/gpu/drm/i915/i915_vma.c                 | 2 ++
>  drivers/gpu/drm/i915/i915_vma_resource.h        | 1 +
>  drivers/gpu/drm/i915/intel_region_ttm.c         | 3 ++-
>  5 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 633a7e5dba3b..7c5ad9071fe7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -271,6 +271,7 @@ struct intel_engine_execlists {
>  	 */
>  	u8 csb_head;
>  
> +	/* private: Used only in selftests */
>  	I915_SELFTEST_DECLARE(struct st_preempt_hang preempt_hang;)
>  };
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index 4781fccc2687..76f7447302a6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -103,7 +103,8 @@ static bool has_table(struct drm_i915_private *i915)
>  }
>  
>  /**
> - * intel_guc_hwconfig_init - Initialize the HWConfig
> + * guc_hwconfig_init - Initialize the HWConfig
> + * @gt: GT structure
>   *
>   * Retrieve the HWConfig table from the GuC and save it locally.
>   * It can then be queried on demand by other users later on.
> @@ -138,6 +139,7 @@ static int guc_hwconfig_init(struct intel_gt *gt)
>  
>  /**
>   * intel_gt_init_hwconfig - Initialize the HWConfig if available
> + * @gt: GT structure
>   *
>   * Retrieve the HWConfig table if available on the current platform.
>   */
> @@ -151,6 +153,7 @@ int intel_gt_init_hwconfig(struct intel_gt *gt)
>  
>  /**
>   * intel_gt_fini_hwconfig - Finalize the HWConfig
> + * @gt: GT structure
>   *
>   * Free up the memory allocation holding the table.
>   */
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index ef3b04c7e153..ddf348c597b0 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -733,6 +733,7 @@ bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color)
>  /**
>   * i915_vma_insert - finds a slot for the vma in its address space
>   * @vma: the vma
> + * @ww: An optional struct i915_gem_ww_ctx
>   * @size: requested size in bytes (can be larger than the VMA)
>   * @alignment: required alignment
>   * @flags: mask of PIN_* flags to use
> @@ -1675,6 +1676,7 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
>  /**
>   * i915_vma_destroy_locked - Remove all weak reference to the vma and put
>   * the initial reference.
> + * @vma: VMA to destroy
>   *
>   * This function should be called when it's decided the vma isn't needed
>   * anymore. The caller must assure that it doesn't race with another lookup
> diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
> index 14a0327b2080..a15271d96b7e 100644
> --- a/drivers/gpu/drm/i915/i915_vma_resource.h
> +++ b/drivers/gpu/drm/i915/i915_vma_resource.h
> @@ -49,6 +49,7 @@ struct i915_page_sizes {
>   * @__subtree_last: Interval tree private member.
>   * @vm: non-refcounted pointer to the vm. This is for internal use only and
>   * this member is cleared after vm_resource unbind.
> + * @wakeref: wakeref used for runtime PM reference.
>   * @mr: The memory region of the object pointed to by the vma.
>   * @ops: Pointer to the backend i915_vma_ops.
>   * @private: Bind backend private info.
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 6873808a7015..471a70c50b2c 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -181,7 +181,8 @@ intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
>  #ifdef CONFIG_DRM_I915_SELFTEST
>  /**
>   * intel_region_ttm_resource_alloc - Allocate memory resources from a region
> - * @mem: The memory region,
> + * @mem: The memory region
> + * @offset: The range start
>   * @size: The requested size in bytes
>   * @flags: Allocation flags
>   *
> -- 
> 2.36.1
> 
