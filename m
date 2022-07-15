Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703FB576F2B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3F9110000;
	Sat, 16 Jul 2022 14:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC1610E153;
 Fri, 15 Jul 2022 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657920764; x=1689456764;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IYsZTd0vowmEAa7idoIizge6z09rAUHJ6hpRRlCdODY=;
 b=Z6Br7oAO6eAmN/QAYYbwJZ1uWoer+7TwJ8dXcZMZw5MQVP0G3TmLA+2+
 Gl7Vf9cprfQyQ9BUoMpnfFS/bQyQUnUCb6DIT/b3LWCHoTH7fo9J3DUgI
 64MIwTC8Q7k2x2dUfXj60kfZnfTACfmYrloH/QuydDp62kbsbay0+BXpY
 3kQdkSj2M4V5cZ1klcE/mt4vN5KNdmXDSiJW3re+/yVq5ZTsg2+usFowf
 IBhsW6fhrvndckJN+0Q58AlOe+/rvcdwTclqNIi1krisM07VPkEanm//2
 OWrpyWb60gMBAFpKUbIbOoBhX4sWAmWV9Arsr0JawW8DOE1q8w9BhybtU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="266316941"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="266316941"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="624018442"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2022 14:32:25 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:32:24 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:32:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:32:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d17rjZlY3oMCrGv3fd0GSK3dx0tSXk19nGMTXeK/XjC1W5YjGF7Cv3yJfLzfdDX/1/GqnHBgNKvwdTmOHQck6T9tWcK/T/4hdidNRlSyroS0k8HKKl54b9YmyPZuwVjjXLGk1Mfi6GNKryase/r4RskhJenRWSxzAqrYdt8MjARMYG6/DmKkVtwXHoCTVF2qZqKfJqWxfKqfd/uzlHmkl1HWb965btAS0F8QiL/xMifM9E6qjiBy45ug7+Xd47lvl+DztAqyrf0Iu0OGJTD4kMlMMX+UQ6kK772cnkVZ17fT7E0VRZXIe/kHZf0tEEBZBnJc3gEMzZy0nogHTO30Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOADrHO4k0mySrMKR1GDkGT7PlNT+39yhMQDL6BceAY=;
 b=bBEHNbO5zxWQzkrvKr4LkMEzKFfX1sUz3/bD9DWEX3zHXb9vD7kiR8U+4S8q4B45PNjUjuxDLxQh+ymrtsLZwa/57mGD0z1mfMwifT/0V7RGMxNJ3h8gSHxTAHL+ZFnt3/3NVHhwLnfAIfeCQ5RzcQwlJQARZVaXVsLW45yZz3wBu0ZPQ1s5upsEy5b+rjdQTXqjtEVbcZmKbalLAkKGZ7GVVSalxHwOwrLH4XOb2zZAHBH95y4qhOR+tACBB9wvvfLhyOSC0L5N2Y91pGEY6ntWo82Kcn/vMGmf6D6pcQxZOPgGivq48rzedoSS9fx/TPw5mEpOjvEdqaELaNgb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN6PR11MB2591.namprd11.prod.outlook.com (2603:10b6:805:60::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Fri, 15 Jul
 2022 21:32:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:32:22 +0000
Date: Fri, 15 Jul 2022 17:32:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 28/39] drm/i915: i915_deps: use a shorter
 title markup
Message-ID: <YtHc43TYFPChrNVh@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <12353a958aa1b280bba3bc6937caa107edf81dee.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <12353a958aa1b280bba3bc6937caa107edf81dee.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d852850-2226-49e5-33fa-08da66a980c8
X-MS-TrafficTypeDiagnostic: SN6PR11MB2591:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xYZSDBR83mJ5//0xYUBPeOUFb0oAwk5Z76J3uEEokwjfKSMSXy8C4Ux2DKsBmhQ81oRK3hlVDHbNPYmr/gq+WlsqPkMF/8aX4Agr97cbSWV67iJwEP1I8eNt1/itq3LVNxBO/mRDX50EfjbbiKkvyc0PwHLalDodusv+raZLKMuD9pvznhtoJ72i8j6iUG9M+KOsmAHunRhxH0BtCWPbWKAfsIAz3IuYfxQ+MX6sPdTNBhG0Tf3jvUAILYE2bbwHHcHaR4TaEdkelEAPnz1+6g2L3NgS+eQirpze/wLRS31iB5WkoZDg7R0KRgj6FLk/Bgc0pV/C1BxUqUjOArZ9xyNmQUskmwqaQVxooGNlOmZn2mKCWQZrxVJqXrQPNlIAizBUCU5MwNKtqdZNV6ByuwhCrxQnADwOBaxUhlMpB1rl9o5tUGrpBzfKnnbSSCBkBSxvMg492R2O7KZ46Yt5gR3bfN2rve7zo9FDlBqufE/DndLemJ+8SvxyEI0hUst57n12Ww0sPMwBUW0T0D69Jp16dhOQvN2x2oyBrc6SFR+Mb5l2gmbL/nTzWZJJimq+7n/oBd4S2GUqQBgaQToN3utcNrvO6BSdynsnYDUwBgqUiCFWvX5UiEqyjHdrA+jTXGqHfg5+8WRJFVpd97Z3kfKu4R204t62Y+A2n93l/HJiwHCZvMf15aBMsq25XMTTmTu4hexYlRIiq58mBPc7472perw10kXs+iSjEYLltxPsmbgAmRk7UynplJYyIuBUB5AyaHgCEja0SEGyKvEtZnZ6bg+jCvEPS/nfYguREp4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(136003)(39860400002)(396003)(376002)(966005)(6486002)(478600001)(38100700002)(82960400001)(6506007)(6666004)(41300700001)(6512007)(83380400001)(26005)(2616005)(6916009)(316002)(186003)(8676002)(66556008)(8936002)(5660300002)(44832011)(2906002)(66476007)(4326008)(36756003)(86362001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HXBG7xKVAUwKjEogxU5HbvNHPKoyzqXUzGdgKYbdamAc0AuteW7zRahULjt8?=
 =?us-ascii?Q?wP0z5iURooyoeDwFe6F/JqZIJpctWUTm19C2o5C5y+pVu5Arxzrs43trS9ef?=
 =?us-ascii?Q?GX3B8KHmE3R2XxI+iDIDbXPLeMz12Qq5J+7mAdUhOqqz242nGMYIYmOgqGZt?=
 =?us-ascii?Q?tRHkJf0fAj9NDoFZxkfnhUZ4eviTV9Vt3JI5A3iEWrdbtojr+tfVF1pL/Te8?=
 =?us-ascii?Q?i8tUpvuOpapd1DuLF11fW2aALKDNP/xUzSBfUSIR8DWINSNa8bho12wsb1ex?=
 =?us-ascii?Q?QtJ+ebfk6xG+1szbn+68grfS9+eGE53qJajgkvYv9JtXevt0XhQXfEbsirK+?=
 =?us-ascii?Q?hHHxe+cNJGJ7n5MufNKFUbgzz4fBV1dYo+j73johF/RAR1pqRABBZTjJ9wQK?=
 =?us-ascii?Q?WSN9jOhOxv1LxV50ZzAo0PyeYLBCoOrrOj1eY5MyKmyUbBc4YYaUcRbs8kCW?=
 =?us-ascii?Q?tb4lBzZPJN2S3MhFynU5eVdFgrCsOO1uwkg5kalrNydjYGUsMLT1vZgjU4CG?=
 =?us-ascii?Q?mtS+YqwptTAJqJFqFBNSmVZSpKJ/ttnUDr4VYS0MXu1fUvBv6MFQZ9IoqrLR?=
 =?us-ascii?Q?Ri+aCOLRqWvlKXXLoREmUcCn6152wXFVgpcGtU9EAL/5/Wb4s82+26ebTiSD?=
 =?us-ascii?Q?X76a97LUDodWiTtTWfXG3EkZTMcO/cOXBiDAl5wt/V965zklljdrPqFuuxvt?=
 =?us-ascii?Q?Pzxipume58Czg0jCvLrKxUiKpf7sGT6eOiq6OlK3yYEv3PK/1JY6EFemCmRl?=
 =?us-ascii?Q?qAyJ9MG33duJJlSMDx+zNhBj6M2eAMGrobP40J0DzWGlVUzktzgLOPEnzjCo?=
 =?us-ascii?Q?pKvm7S549dAt3D4yB0NpCBIgORJ7DjCeT6/Nx0WCIvf0M7W/HFmFooQc/A4l?=
 =?us-ascii?Q?HlHJkxYEyYIXcH5vmf5WfBpJicjtUJxYvRV65ltqIe5NMvan2BFuHofA8n/2?=
 =?us-ascii?Q?nDg4mLW8Mxc/JdLPvhX+jVaCuEccGE+jbuzc5W8h8mw8W2fXhDyGnvMAT9Lu?=
 =?us-ascii?Q?IZpnNUO2GKk/vjyej+VY8y/+fD09rnljF4GH0HhYlQSvsolMjD3bLuw0Rl/A?=
 =?us-ascii?Q?5GiSkAoYDg/tBm84n/E5qZypjk9XgqLsIDlT75dLguPOnLNriefQ6Lueq4L4?=
 =?us-ascii?Q?s5X9J8KDMJeuRk2HRAgYtKpEa42N6osuFRUnskFELLmokBvoMSdy7INMeVcV?=
 =?us-ascii?Q?5nQy96sV8f7hDL5MgQBZi7sSdX+T7ZGzOYs2mbKxB5yGrIdwdOujzFTbJQqB?=
 =?us-ascii?Q?oN4dBY4kVmgnfBNgYbRCrLJtj6gktSmraHTqQxxJE9gw3Kr9vuVbFjBdTWi6?=
 =?us-ascii?Q?C/q1Ws48VIxVTDdbDhn+g4L+y65rBdswQZ86tn3ei6xNcR0496YKlAzCWOZ1?=
 =?us-ascii?Q?y62TqXd7NvtdkXmfKeE+P0VLShVInj70k0+TzXkGtQtmh/zvo1PbEr0H1Yu0?=
 =?us-ascii?Q?OXbPvk9CXmUlLUbEq8Opsrae11iKdCUW87q57FHP5jo/XxdqvnV+DSB1s0+h?=
 =?us-ascii?Q?Y/H4B8ANtnjJHJX0GEw7c4uqe58R2VsTAoJGAJhf0XevWyqzW6kK7f0O4zjr?=
 =?us-ascii?Q?zGK4hXoRxafNvbHfsQt3JQ5DmTLBSwAtxAMutmHoIOYlyDHSSMwql8Iv73mb?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d852850-2226-49e5-33fa-08da66a980c8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:32:22.7925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmtZBPyQp8oFo3ERp/iowYp4lL//GQo77J102vhmup8ORFKx2RUiFU0PgevIfD8Kp5x3gqATwjUC6ut2s8HSlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2591
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:16AM +0100, Mauro Carvalho Chehab wrote:
> The DOC: tag waits for a one-line short title for the doc
> section. Using multiple lines will produce a weird output.
> So, add a shorter description for the title, while keeping
> the current content below it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/i915_deps.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_deps.c b/drivers/gpu/drm/i915/i915_deps.c
> index 297b8e4e42ee..df6af832e3f2 100644
> --- a/drivers/gpu/drm/i915/i915_deps.c
> +++ b/drivers/gpu/drm/i915/i915_deps.c
> @@ -11,7 +11,9 @@
>  #include "i915_deps.h"
>  
>  /**
> - * DOC: Set of utilities to dynamically collect dependencies into a
> + * DOC: Utilities to collect dependencies for GT migration code
> + *
> + * Set of utilities to dynamically collect dependencies into a
>   * structure which is fed into the GT migration code.
>   *
>   * Once we can do async unbinding, this is also needed to coalesce
> -- 
> 2.36.1
> 
