Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8891D576F2F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1108F10EAC6;
	Sat, 16 Jul 2022 14:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5B910E153;
 Fri, 15 Jul 2022 21:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657921288; x=1689457288;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jw5whMorOvONchlJQ3eC+LixtNaLAiKM6spNrxSFxfs=;
 b=O/sjt7/ViZCNt7hfhdY2UsR32ATdAl69tqJsaJDxvGUam21ODx+KvlHO
 ODaxCzv50oxt0OozlOWdQelZXuPKSDJpsKig3/UGQ33DZX4cGtnRFuKf/
 lqvK9JoSVPhjkMp0caxcFN/0pwme1DRp0vWFVpjWXZTAAq//ikSV1jVQK
 2pS1UB/5s3QaZmH9IFOOglhqWIYKS6NVQPU9+J7Mc7W0zmLCeX8sBgON7
 EQqMgNSGzf+Dv+DjTcvj1McT5cW9OqVAvhZKTa3xDoz3wZSBjFJqD01og
 UYd0d5LOZ5h58DnpwQUlRFNuVJjHCuFLs4B9W25aVZcUAol7LfaatS/rS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="283464035"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="283464035"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="624021768"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2022 14:41:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:41:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:41:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:41:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1fMIEFgqclCtPjgXNBQEaA5kTF4cxIinStPN4Cm5nClzcTMJ4PherE3kkEMVHoqQTmAzrG1pDL2VmH0WOPhL7m+LoJocOts2lQ/agPX05p17lz/FlC+xM77xeqn2Nhw3e9tH6NMT0fvvsdRX/TpXYN5b0kPy9eTKOsArmYg6+ufAkdl1QcyymXDdRXAi+Vud29rbcqVNEbw4hpna1uhRYqXhVCcOyJnSdMwJxmcGdqcTgBQyo9eLlUNoFEAhymbyHq59bcX2g4BgsamTEmhed+AaYQ8B3N/9b6PMKgaY1O+Ydbp3BbJpBZrN2h6sdCxRK6oYbq1Fs9LfAcGSeVxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Z79sL36zUmLZtBxCEc/g53Kr6vWMgTgclcTGfABko0=;
 b=AX7TWRfOS8Hrg3Vjy+Lo92Lz+QL2wAiIl5Bv8asfrYTmy0HFzcxxG1nnNbSS47wNij9ZkEbzqGehIhvm5FBwxFnplNqYpIb91WhkbCQJb2afMHf8RkuYcz3tAbWmRNxCpwwI5441Wf+WFO3Eg3Z6BoYk5e+XsqbYM2+Pa5InBnCh+F4QPg3gfRtRYqExw+lDhSKgM2SD3DE3fcs7NeLosrBKcNQ5BlYRIztKjLILvJn9ocruDyP+6XxraodQY785PMfd1bPQW7nj9oNY6i62QHOvYjtTCNOqWtTOvh8xWPaq+hI77OL3Y9Ac9PQV6A/Mkc3WNh02ohMWdQ3aGQCD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6090.namprd11.prod.outlook.com (2603:10b6:930:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Fri, 15 Jul
 2022 21:41:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:41:24 +0000
Date: Fri, 15 Jul 2022 17:41:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 21/39] drm/i915: fix i915_gem_ttm_move.c DOC: markup
Message-ID: <YtHe/r0a9UM+6Q0b@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <395e3cf3bce06ad8e6c4ce0a6e713249a86f870a.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <395e3cf3bce06ad8e6c4ce0a6e713249a86f870a.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f893eef-44f8-4b50-3ef3-08da66aac36d
X-MS-TrafficTypeDiagnostic: CY5PR11MB6090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0ihE+cbVBWBvI6DTrfPb6ux5isMZsKAASFaERgIPCS60Zi/QNaCOSQ5hJ4N3AtYLfSP616puM910BtwB8wYbuu5DarF0RCyL5xYE7zuCqC1frZu12qYB8Ag9glsTtR7i8wIk92W8Ikuq9VSbPhkD9jVaXJZ4sG1MI4HtEeFbGnAXSKXDuaonl8H4DtYTyWXYMuruXsZGJ+cjFgTPvcYzChKjFo3dI/9yuOIknXugCbp860ye+fvOWD7pdp6IalbqvNN7yXrFl7xPizYUD+a/zkwU002m6cUj6MLbT+J2mf+Y5Q/uqbysedCtTKT1wBzcaNzEbiBUmndD/yY+6MJkDRYlxcLAwltSHP7N2FgnSCcINjZ2ZDfHn+bedVfSHkpqYdxdNyypsYZIF41oq4KwCgMhgSd6xtXfQc8J9t3c/jRFojyJIudykx3VLFug/NTuVqHPRPhu35p1EBoD1tvwMxcJkCDLGbeetoJZK/go7vmMFscYcDTVgwfDvMpASzElD1mU+6kDVahXFCHlRlyqRgBv1AshNPjh/bS9NAyzgmnG7R/FHRQzFUAlpErWFAAFaF1/Cr29Kfu110t1i6bohIKYTyhB86E7ys4bFZ1PGIPzRNwxtGMn8vTf8iY8BjHkIcU+AYkHTASOG7BPC8GinPE/u1GX8dOJ0zAJf2R8ZN1kqzagGOuXRfukxlXpyUzjROVDJGjzGWKfIZp14/VhVoT1NxqA50hWcjOjbKV2DNd31Chq3wYk6HlCojn/IpqC2fbSZ7O2oRWg98lKZk32gSJ3LkCK7E8qEv52HJ7g+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(39860400002)(346002)(136003)(376002)(38100700002)(44832011)(66556008)(83380400001)(8676002)(66476007)(66946007)(4326008)(2616005)(82960400001)(5660300002)(86362001)(186003)(2906002)(8936002)(6506007)(6486002)(36756003)(966005)(316002)(41300700001)(478600001)(6666004)(54906003)(6512007)(26005)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KRVK3ytz9gZiuMpNQpRJz/wG710H19Kh80vfg4TRN35FRYQWWn1fyJRfhgOY?=
 =?us-ascii?Q?ebe/k31WOnZOPDQ0U2JN7GpSUo1qIhe68ygEqyAdJtDUYMh9pzlDz7i6m+EI?=
 =?us-ascii?Q?26krRKRzR0wjeNVnWV8i+tQqWJmD6vV1LDlPqn62C5nwpwn9uE2q3JO7OZYd?=
 =?us-ascii?Q?1LZZiQSPdrELrTU8VNB6EbJTWtVSvTnNqzcB/tv7WlDDnIiJneA5TLJm6Uu2?=
 =?us-ascii?Q?tqmzUzYAIt0ywmrS2U8qdd8KuLw9eehWFhwInHoNQPxm7RDM7hPnjyk12Q8Z?=
 =?us-ascii?Q?r7+ldKOYCbDI0QhBzk7jct/7YAA9BMz43DxMeGxiOEbq2gTgqcdwTkJhnZbU?=
 =?us-ascii?Q?bL5FI+EXGGrUzjkc+HC8m4FANxI3WsmJ/Dlcmu0VrQBboWXswYFr96NMSEen?=
 =?us-ascii?Q?OQrcM9GtHeEEoYPjAfPD23aVl3VVfoF0gqMeuKLFkf7GyBxGUnncnWn0ys36?=
 =?us-ascii?Q?H5DNe6lhiOHjMW/gXNkFYKV1D1Ed+Rgky5fAoANya/ygzERrM0RczwBZrLy5?=
 =?us-ascii?Q?glo3AJINr5OPnxSMNs5khn7td6zKzzBA36C38Mb0gNkey6iKtHssalklSqdk?=
 =?us-ascii?Q?or+yeT/fyTY84zj+KW2hs8EPF2F6WGlt21cKqNKpo7Jkx4RBNu1arj0/yLkX?=
 =?us-ascii?Q?Fp0sAqfsQHYAdb4OPoFpwLqDb9Sv6ygCNOBK6FMIbOIaydJSRc5y6pg3JxX2?=
 =?us-ascii?Q?Rroniur+8ui6wWvUZSuY1GTB2OD2uf25677+//trWbUZILBLoOVXQVl9FyW1?=
 =?us-ascii?Q?R7X2WkbVNEkUDtf/VFle5AFXyV1qYFg/yzZuE3UioyQ6LfJCctWMS4UgcgQm?=
 =?us-ascii?Q?iRGgBJyzoUvnBC7qPF2Ggu5UFJ3tZNougCZzHYc2lZ6bLI5RQqZFRIxPg5K5?=
 =?us-ascii?Q?Y4+Ze0V9mFg2YFq67K/psFjaQBbmGCMFou2a7tYl57KeFDMuwbgPgGK2hDpA?=
 =?us-ascii?Q?M2me1JiGdX18ialG5LNaXrmV9QBfTIImgROtlfpBxjzt+IpGaMz2wAz2SkvF?=
 =?us-ascii?Q?yHzTUhbBCcU4O/2gZMJOm2keRkmJu5kufgihjy7o0bmV29v5yVwwbZPXZYZC?=
 =?us-ascii?Q?bopBSxMg+8hqWqja6zoQSbBYnpQx6Uc5U6OBGCp+oU32I3jGYkJrlDqRve0Y?=
 =?us-ascii?Q?lsTj7IdzfMQtsh4KB8SMW1T7KC3Mm2LNeGImFAR4mZ3c5drbsWX50wAIO4v7?=
 =?us-ascii?Q?/DhVcddd9bPTFRn8lR3epd5sTVom75UqlbEtOy3f8Y3/v3nhrFxG8a7TMIY5?=
 =?us-ascii?Q?q4JfWsIEo8NOlQBZpy7s6ePZ4QdtJ9pVxuobAqYbh/N4MjTT3lLDda5+/yZJ?=
 =?us-ascii?Q?eBlcJCSUYtN7vRw1UELKbixnhShlICgDcnKW7uULkI/sWJrIJDiyzFrSNvvE?=
 =?us-ascii?Q?6u2IxRtFSoX30h8P04YtwymVew+CI3gEGug1/RcVTFlSR+08EAPxcckE2wyX?=
 =?us-ascii?Q?8fVMuNNS0G7AEDdmrHQOnsFQiP/a504iok9o8WBpbJHPjXeD9LRv8/rT+h48?=
 =?us-ascii?Q?mQAJluXIKEN7mkwTyWGM7VvAoMWDWZBxSv+bsh1hWScwaMC9SVu0y0AymQ3f?=
 =?us-ascii?Q?BaV6E1pELQmLzVOrkK11ayoSLlodG2kHNOCNQhJHZdZRn90b6NqvzznjeBEN?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f893eef-44f8-4b50-3ef3-08da66aac36d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:41:23.8348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OztMN4dBrYfzwJ3dfeKm9XlhtU/i+UF5fKP0rG8FFWAFKhyziirnNe5hNBEkoIzLV9ptmIm4Dt3cJHkskz502Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Jasmine Newsome <jasmine.newsome@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:09AM +0100, Mauro Carvalho Chehab wrote:
> The doc markup should not end with ":", as it would generate a
> warning on Sphinx while generating the cross-reference tag.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 56217d324a9b..16dd4991d527 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -20,7 +20,7 @@
>  #include "gt/intel_migrate.h"
>  
>  /**
> - * DOC: Selftest failure modes for failsafe migration:
> + * DOC: Selftest failure modes for failsafe migration
>   *
>   * For fail_gpu_migration, the gpu blit scheduled is always a clear blit
>   * rather than a copy blit, and then we force the failure paths as if
> -- 
> 2.36.1
> 
