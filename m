Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E05C6EB100
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 19:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0738C10EE83;
	Fri, 21 Apr 2023 17:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CD410E0FD;
 Fri, 21 Apr 2023 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682099110; x=1713635110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1EElOJ8fZxBQ0B/BMIIsJVKQFgJdbonw13kYAMy+lLc=;
 b=VNoBPGroEHBIvPr/M1DnEypv8i1+z+z2REBcuWwnZaCe/4HdRD6YS4tI
 O1kCLYjVxnJipuC6sTJCzdZuxltpuEh4BS2WqHpHnh5Le9N/DqoAkpzPL
 gzxRBaFiAmOijxGHcf4OzbF22dWUaQAWo/TIGts5dW1fOeXM6oAVWbqnu
 FX7+QUEeTWs/pHbrAhXgLAyaBJ5nO2P+zx2jgGqPOgCpozf9MPkJ/sXjv
 2EbF8r0OoC+lE8r9YJ1kkYTHz68NkfAYx4Lnk4i5Dt9vBan5HJEOzz53r
 AvDg/WGjGJN70x+AZ4qO+EiDyoYe4tO9dxicxpJ0oNBgQU4KkfhSCP1W+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="346063178"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="346063178"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 10:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="685784680"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="685784680"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 21 Apr 2023 10:45:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 10:45:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 10:45:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 10:45:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 10:45:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8nhWC9VKSemd+hFkH8o/00yY7yZ8dBMjAmAh1UKystwbdnDXlj28ONmNyd0Ihdmjec2eMmdXxXaK1plRlblvchf5XbS651mUAnlwPYQYyqsSdQo3FJa2ntwyUo3+319sf8448xKJVgG3RsDCCxw+KfMl1MwepxaP+SS3Q8wes3PSd4JyNbZCMUVx8eSWYd8WJdNwKT3j0liOf/PqM2Mr33FR168yW6RfL5btgUIC6hBGNul+9alyW/NJVSHnVCXEOmEwmccsQmq5zvkmz14VsTjx9TQbveD+amY6X/b2/B560AwDbqZE0Ix2yzfUFr7Kew7wla6VYBGqC4n52OWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkNzaQzBIboblHQoRM5PeAbRpsaLcO9bvUEamN9kjsA=;
 b=bnIVEswZOtp3fZdGHuQcUob86yS7Rk+V4Ht5iPKg3lI9TNRJWzckJryIeruV7uO1Z8e1wIa0O+xaUhBJZ2HAQ3buq+zt1elgRauSkp3LlSb1d9MsgIcQbf7bkYcI3mZUYPoKBqq60IjruQo6pGLm0u7KvLlKH+kXmoTLOPWdlwQ/47Z+NxaargH8zmYMxKqDs+CUT3rMJw+N72us9EDUTp5Gj2Xkf2yVyQYUU6HDY3N9hc3DrEoX94SVU93pomJVkjg6rTunbhrrXbkMyzLa520EN1cDBP4ZOzK8M/121ibOxJkN/jEiSdv0TAoQ1DAPpyhXgLlpcrQHAKg0OE9KLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 17:45:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 17:45:07 +0000
Date: Fri, 21 Apr 2023 10:45:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [PATCH v4 2/8] drm/i915/mtl: fix mocs selftest
Message-ID: <20230421174503.GP4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230421173801.3369303-1-fei.yang@intel.com>
 <20230421173801.3369303-3-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421173801.3369303-3-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:a03:331::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: e01022e6-efa7-4267-9340-08db42902502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ed+16E1owAu2O1o8R9GEV0MM5XB5fdon7m4u975PvWaoVIQiSt7ToLw1XbIngf1rob39V95jIkDpRRQjb5y1V2JWMq0PrfJvoxfBmeN9rDVdYA3GFK+OIhsUdyxGXnBDuXvxzFEclQIhYwq1YcNGyOpIhlsrFtvAg3Lblv/HDFDOj0rCSOgOncyj9bLKZ8SnCshz0pheoxgcaq6vPa+vxu3nXNKizWZBsVDXJKz8UY4ctdBvbBo7SEjG/KdBTUjOvgE4VeEazcFovQMyzE7CntUOiy0+N1wkcb6At5mmeIW30I/LXXCIGkNDTEV7A9SyY9wqAl1ohxSCp6MjH4edd+B01iJHPw8fdpde5bA+TF7VXDSn4HGxOgVBIKvb6u4VY6Z7hNTN1BexaTW6aJEK9Ewm/yVtrlx972BxWBrQMlK1/GBwEq7zLq44JsTtRlTxuWgn17OAbmxx56XSRaDYhpFFcQrEb/KuiD79Uygi4eiy3BHBm/ZC02MTe5e1IPbT00XDnjgYdIOLAmuBWp/Ul6mD013QD0hSxFhGy1qzzZZv/pbP67SWPl+XqaeN/DMd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(316002)(4326008)(66946007)(66556008)(6636002)(66476007)(450100002)(2906002)(6506007)(26005)(1076003)(186003)(6512007)(38100700002)(83380400001)(41300700001)(8676002)(5660300002)(8936002)(478600001)(6666004)(6486002)(82960400001)(86362001)(34206002)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?exB4ErUq3nEqlXzaTMWvh2C/8BmXKZC9b+Eq8vIqTj4iKnaCw3vx0ALe9Nsd?=
 =?us-ascii?Q?QKXdXal1Y8RISfFEppE9WWthTR2ATpqJwE8dHjaAxodf9M/w0m2jG+MGSzhJ?=
 =?us-ascii?Q?N6LFZuHqwTDVwWu5B1Eo0pS/0xFG6zx0CYV9MoC7hAt8qTFND6avVnn5E+T4?=
 =?us-ascii?Q?SYfGO8urpF01+HCGCkbYEAozNjwEkogTri0Ac/OhqyNl76ry9Fj/rAbd/+hw?=
 =?us-ascii?Q?0SaacyC6om4sl8OyV+RuGNpbawqEyBSUd/jS1Zyennd9CniKmUi3NCrRLhGs?=
 =?us-ascii?Q?ipOnj39W0K1rvwjBJrGTE8mZTTOwxch44FNssLKgMz89axlr0baNeg0bJeWX?=
 =?us-ascii?Q?0qKkcpKZQ9afYPstW9rW+SO8ZunKNTE5lQDYauDWF6EYjuohjZoqxuu6XMGu?=
 =?us-ascii?Q?S1Asv1IBplqRdGtYM5dTlrOISGsiwARhvpENTv3cS6sYODHtpJ/Y+yVN+vhN?=
 =?us-ascii?Q?31xhDQAahsA0m1Z9eLjPS3eGTeVEgyyi3gKdm3cwSB9ddARfJl6PkhILo2ZB?=
 =?us-ascii?Q?6ViZn86ovUMJj2wgQ33vn0oBShW/WL2LFSmyv59IsjyD1FtOnqQHddYn84Sv?=
 =?us-ascii?Q?C+1mD+9irTMkskWB97za1WTeIH0QF0ib4XU98scxvg6ga9zyCat49p/cokoW?=
 =?us-ascii?Q?/HA++NH2mIfwIRjnvRS/A7g+ci3k0ra2zz5LATFpdHuuTkCuUnWeiuPQMVNG?=
 =?us-ascii?Q?u/1eytMTtK3JAlWuMYjVtnuFp6VjNWdPBxtvYmg1ApS/B3FVsVM+fXzHVDLT?=
 =?us-ascii?Q?xCOMQctihZnlbi/bSz7O686iPpSjnN4psXO84TE35cfKFvJhxWtAtMecn4gn?=
 =?us-ascii?Q?EWwOc0SGGOVEngprrT+AxbBDAgrVEciBouW4tmHWbRJ9HJMk6HfkU+DwXeXu?=
 =?us-ascii?Q?Ax5AsldMbGyrGlQ3sGOSMMzLQl7qVCMUomtIr9vrVq2aIPJ3OdQ9EZfVq3Ww?=
 =?us-ascii?Q?wollMkOCltNTXdkadjt6kbLVcb1UQnz8JKHdoth1YUDR3nxyoPlOe5yVrDCi?=
 =?us-ascii?Q?ots3pg1kOdPJRMuEKP/L7QTDjrq+624tqlHDpB38uZ6v4XYmkQGCKe2MUPKN?=
 =?us-ascii?Q?MmlV1U+iklEITsFRi/PlB3XQ+2N0sOKWTy+I3XrRyHifERubeQ9V0DKV+Q6r?=
 =?us-ascii?Q?1VS4lmLQMOSIOw5ukWzZlFKPgd3wI8zpcDiOAg14GXBv+X0WazHgHiNChQF6?=
 =?us-ascii?Q?MYVQqiitFGTXGQN4pFUgh0ZavKN26r/yUGQeS973J9DzbiHB32iMcW5McjQh?=
 =?us-ascii?Q?LvLSYZs91dpey7VNtUJ8QSRhWkLjBVTbBgUcVNGV4UqNGduyoqa1HAKCB2GM?=
 =?us-ascii?Q?IGfvGj36TZ5VzRAt0VVEHKMEBn3PNO0xLHeLqzzuRO2A/fQXr6pHhEoAacFv?=
 =?us-ascii?Q?+MYc/AwjNZQ9g2JTFwmfdgC3n6K4kTylWYcTroIOPGhMCAF5ikeeqcOmOOif?=
 =?us-ascii?Q?RIHKPUtooBjzwgF1X8xSVzr0hwC/qDeddnsiKduXMU4HHS5XovnnZAy6Z4dg?=
 =?us-ascii?Q?Tk+h45SVmPsD9GkGHuGdAyvTY1f7MT4T2QJCmmsdSHMYF9I5DfVX9+UapzCu?=
 =?us-ascii?Q?mg2zoHI6BsQnluZaY5orf1RV9eoaq/JYHDL2fPqgcbV8K2HEpOpSuUhsCkWJ?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e01022e6-efa7-4267-9340-08db42902502
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 17:45:06.9194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XR2h2Z6CA7w2m6DJJLkZYtG4NlpqO6DDdHM6Q5K3ZAttiCU1k0P+i72piO67tgcGWclT7llztrOjywiijPOMntPq21KJ35zgfTX26AMp4fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
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

On Fri, Apr 21, 2023 at 10:37:55AM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Media GT has a different base for MOCS register, need to apply
> gsi_offset to the mmio address if not using the intel_uncore_r/w
> functions for register access.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/selftest_mocs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> index ca009a6a13bd..a8446ab82501 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> @@ -131,13 +131,14 @@ static int read_mocs_table(struct i915_request *rq,
>  			   const struct drm_i915_mocs_table *table,
>  			   u32 *offset)
>  {
> +	struct intel_gt *gt = rq->engine->gt;
>  	u32 addr;
>  
>  	if (!table)
>  		return 0;
>  
>  	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
> -		addr = global_mocs_offset();
> +		addr = global_mocs_offset() + gt->uncore->gsi_offset;
>  	else
>  		addr = mocs_offset(rq->engine);
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
