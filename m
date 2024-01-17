Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2EE83103B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 00:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439A810E717;
	Wed, 17 Jan 2024 23:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCF010E700;
 Wed, 17 Jan 2024 23:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705535853; x=1737071853;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tOuAialenL40kL5n38fRk4BACSdEjYgS9qv6HQL8WiE=;
 b=E7HfKYLqbsA2EIskMOvl+DsEf+wnPWlrs3lQEGKcbwQuiH43xz65ujTh
 fvKxUtLh6Iqd7PcTTtHoDaoId8iioflnqOBDGEHFCQeb0DlDyo+7vj+M+
 BsMLaLW5HHIdu7NLi2iPmccDh6WI4d3kEuARqRV3dPDRjQ7/Gm9GHOe5W
 Av7gjRgQiOmdktLhfphRwDZ1kb5JZ5QZKw81coNDZMH9jYHR6UywaQ8Lp
 f9yrmk9kWrRdoJ297BYoWhWUE7cUWRlS+Q0tFbFqmseKmWXB2xHfci/h7
 tXRJ7yMYe+zFAr1pomSSkTxphmKS4thjcz+UIbhubXza15OGWj9rt5k24 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="431457296"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="431457296"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:57:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="145261"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:57:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:57:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:57:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:57:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:57:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtOW+HSJJLCD+mYXq4X5en8HtAf670am+zrW2tFEIQ9J89l33pJ9Cdm0U7v+fWCAoqUoqwhTilVNVL9pN8dlLW9oI8dCfwAYee0SrMgwbWFp4O5u/sG45PrdEIsGJBNyAjUcLA+SV1B5ReCY9YHge0cmYpHm/TTNuju/EsIp0pUHlIUFm4Cql+vyofuycbwCktIGItwwp+NbHQmLtJqZS0L1ER6omQYE6+rt8WfkJhLYMEtqWJGZpwYZGgZkNU+MJbi0jIjCdYlok/0ETU6SYbCnYtcV8hwKxVen4cTRW/mHZz4BGLpqwbqWO8TQ6Qx3p8fOUBzi5o/nFPRzhWs8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKty0c2A1H5rx1yMszGxMi4uM4WwRjGGnbmMAochfHA=;
 b=hrzW+n2lg0O9pNRGGbMSE/uV62LE9Pg6cEfrj2gD29chE6w9G4Gu7OgellzjAW+4RSblsafQPxCrzvkedDEnl4rWHsp6Smvv8b09lPfmQ+b25FrtJ9ELpIKlUI7jK2l0A+q2qEogFn3rISgJi7vJHVgxnmo14eS/SRTlfnX3tpJrOuQcZoIVnsiUJfFfLUYOeNne5nLNXSMizl/u4iLeY7YDjogCmVWGwlz5bY1+JtWXRa05UoCPFMuZ1WuFtHvvKTIW0GBqJc4rOIcfqRbnYieIYFa2PfAURYkFYtlCkOqyucnFUnFyTA8gFY2oPYsjYYMTAYak+yg9E/d6qhp7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 23:57:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Wed, 17 Jan 2024
 23:57:26 +0000
Date: Wed, 17 Jan 2024 15:57:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/mmio: Cast to u64 when printing
Message-ID: <20240117235724.GQ45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
 <20240116174050.2435923-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116174050.2435923-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 35416f6c-b3bf-4785-f04b-08dc17b80e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvWeHrwEeM0gHWniJVgLjtHXxy55UsjNKwKMkaRzld6pa9cFDJgUCdESOPAYh8taY3ir8OBiNARd0T13Mul9kZ6g6NYszxwl3J4NXHEGq/sxnO/kWXloZUoRh45dDLFWl202xgRO8WbC884KnupHgYc83hi35cxg+g2l+Q/DtDE3JwriaSAD8m6iQ5aladZy+sYSgrsom3E5w/tD84bKQ+34kcmIB8sTNBdqenTIXkwhz6hRW+y0+wQ8cTHiR7ikq++pvPjGHzn6R96iznsHF8rhKvqElfA/pFE8laj9zdCEM2y4MUg1CuaWp5hzIsVqK58XmtVGqVFNYPGnjHZjP38uiE0lB6+WFwzw9aLSbBYp+OPTK1FlQIYeQNU812tortALi1uYNUg2mOTnZze5lHXNEGf3ScpaauVxSnRpGtp0XOJdUFQp2/LsoA1BtoV1oBt47nXZiEXj/KktpV53BVMYr3g1Mco1q893Jaf0B8sFgQku+0xeoSoOajVxy5zRiqZBKaMNnLj0V8fSYcSYwquj6MdWj0dM5stdHfCpvrUa9K6nz/izsBsPLtymudiK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6486002)(26005)(82960400001)(86362001)(478600001)(6512007)(316002)(41300700001)(2906002)(1076003)(107886003)(33656002)(6506007)(66946007)(66476007)(5660300002)(66556008)(6636002)(83380400001)(38100700002)(6862004)(8676002)(4326008)(8936002)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e+5OoYwUvuhgHz1EKLc/QpiPGoD8rIeUnyDIoLy/cFEQv3hstlC5W9NF1Cnn?=
 =?us-ascii?Q?Ziaaq4EH/ZcJcvOthxsz2iPGowC0eTo6vebyuh2gjIHLKh5qHnpwJmPX2t9J?=
 =?us-ascii?Q?XISxgTT9acLmYld8Urq5eDjSNJiQdMljeKaQ2guZGD3aumtNpZW2Ua1kmWD+?=
 =?us-ascii?Q?F82insF6qqyHZ6v96KfaPIvQsBoHFtY0n8b0UmZdecr9m27Y3Zm77itgMFJp?=
 =?us-ascii?Q?iJOqPk1GzNN0PUWVgMbjlo3FeFzMiYUdqKCAJ74k3S9AWrIN7ZBjOguGa9qn?=
 =?us-ascii?Q?jDD8ZEiJD+hk6tMBjrszbVe1FvPtLzIScZNTEtioJUIwC3P39KBI5RikUXVK?=
 =?us-ascii?Q?0vKJlwdqfVP9UnnueSga4XBk2IyZv5hfHo9b4tpuTF2mS+b4ktfpjYIWB6iR?=
 =?us-ascii?Q?LxjuAY009zbNpn1LeQTZ6puz89YFoR2fEwNiCyqLod7OG25crnMuyuabzfd9?=
 =?us-ascii?Q?y/FhlZyngWKxB2L7BU80meHrNX43ZiZPJWqCpXhStGHpeowGErnnOz5GqjkI?=
 =?us-ascii?Q?mQAkv6ZevYS5ixXPVrFN0r3PQ473Qz0kDvCB+sdZZ9iSZZzhoxms4QfL34VK?=
 =?us-ascii?Q?WG0fEmFSeFXd0+AdBMBGw2DaayiLVgh/U9dzUcRPc/xCr/cKK3ZUaAaeYwZQ?=
 =?us-ascii?Q?3Yb90LsaCPuV8oBJQHZpX5q0Av3Rd19KbZyQUqh0Sv/YGzhSFSUD+bgXgAoM?=
 =?us-ascii?Q?jPA70rQv1fio80uV+CYnn0A2zmjezZEZfFSgd6xxZcgW0IfqDpGwVraK0nrr?=
 =?us-ascii?Q?x4G9tS7bWik2A2TraR8vkqK8kxLLM3qBo4GtvTkSBw7Noy0oIC8SvrblMhQg?=
 =?us-ascii?Q?iIPji8r4lo1emjwPDy5yQBrZ2MiYybCYmbyi6OjFI9t2D0fv7XvWhnZh/FlM?=
 =?us-ascii?Q?C6LdVGqYrZsXgVF+qkJfx198D6PfEGHcKPP3CCwerMeya/KGib9kYHG7oNRd?=
 =?us-ascii?Q?O2RVMX+e/23yPPRABG7OJ/5Zv+43bG3B0DnRKx3m/Zkvef3cFivOSjLPxaNB?=
 =?us-ascii?Q?PWm1YzQwsDyi9Lw5fzC0RI732KSGiadEm7pIREPVejt9zBTOuGnyGNAYUftt?=
 =?us-ascii?Q?ZT/Ew3ynW0BlpfBcL4HeuU5cDBSyvljSOIz5XKO4xKkDZXMfSHvtKWp0aUTE?=
 =?us-ascii?Q?/rXzc5EcJdgrYzNv6aBQCZd2e/yeH2ElGN4Lo6mcDj4RvrwUDABjLEBW4jUh?=
 =?us-ascii?Q?f9xaYhNRA2yucB7V0u8GCCuMXhPiBY3pobNgLMpzfgZy4QEpe8FBqdypQyKZ?=
 =?us-ascii?Q?hGDKe6zq9tQDBVxvCCIdGyUNtOAvPsyabcD5Bq+tiqYvjpsp7rY4dolC495e?=
 =?us-ascii?Q?ZyW1v0nJxGxlr5outIPUbJAnUmTxFEOlxIxzh881B8OYK6cStvQHJiHBrXo6?=
 =?us-ascii?Q?R3I1oA3koZVbutCtQqplFbTwrtmJ1xIL4xszlKTFSMvZeOUPTHTzQ0CXiR3h?=
 =?us-ascii?Q?wnHhvdRYAklC4ojiqIe+WL8gSxrxWhgHv0T6UrVFGKZKxTmNqZP5gTFQQioc?=
 =?us-ascii?Q?YOOLSaTGivHTKnQs+avb5fM3UAbKvHH0KlvS2l9GYT6Z0nMm7SIqxcnvyyK4?=
 =?us-ascii?Q?rGNtWHeHv5J9wF9O1l9h9ZJ9KaK3qxV66ROEF8Ukf4FuU8Fph45bHWHHgTpp?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35416f6c-b3bf-4785-f04b-08dc17b80e7e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:57:26.5380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whovyuhcL16Rsk8c5QIlgFU+5D4FiRZWVgYYlVeQnDpSnnlNS8c+4Tib5KBhG9t1fObaq1cfeweZzKOY4aUBFTwGRSVN3if16eKPVMLwZEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 09:40:47AM -0800, Lucas De Marchi wrote:
> resource_size_t uses %pa format in printk since the size varies
> depending on build options. However to keep the io_size/physical_size
> addition in the same call we can't pass the address without adding yet
> another variable in these function. Simply cast it to u64 and keep using
> %llx.
> 
> Fixes: 286089ce6929 ("drm/xe: Improve vram info debug printing")
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index c8c5d74b6e90..5f6b53ea5528 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -272,8 +272,8 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
>  			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
>  		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
> -			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + tile->mem.vram.actual_physical_size,
> -			 &tile->mem.vram.io_start, tile->mem.vram.io_start + tile->mem.vram.io_size);
> +			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
> +			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
>  
>  		/* calculate total size using tile size to get the correct HW sizing */
>  		total_size += tile_size;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
