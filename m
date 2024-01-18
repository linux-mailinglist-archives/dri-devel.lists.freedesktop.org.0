Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE25831069
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 01:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5CB10E118;
	Thu, 18 Jan 2024 00:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B1810E0CE;
 Thu, 18 Jan 2024 00:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705536954; x=1737072954;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jm6szoVeSTX4bxV3BC+Kx1mL9IsCWjDjq0Uec8FP224=;
 b=hERZdCgN4NHBEx1yKtEtnt/4tqYYNOxNhe8LT+sKyRnLQyoIN9quOHjj
 g+E5Z0PQ2fUwEu0+6rscKGj/4aw08MhYwjgUJoBHwo25Nx+yb/9adS8+t
 gJgCEIAIjCQoRHeNRpao9dYUmJgJi0fZ60yV3YiMh8Vv9vAVLZT/lt2jr
 Vr99JWiovfchtirWh3JDAsG9d74sIEfYQ+r6E+qRquHh1tPosGa/4k5mv
 TgL36poF/WeWz2ZQhLcT90iutL7WEU836Vquefm9WfHNqAb2zKErQ0q7S
 e9M3uxTA5z+GKi9LhfnWG4BVTj+yvAI85J8ot8lQwDSI3hPB7A5oSpPlf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="399970096"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="399970096"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 16:15:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="854838613"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="854838613"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 16:15:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 16:15:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 16:15:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 16:15:53 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 16:15:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgQwz95vKL8UpqOQb8Y+eMuIDS96PQ5Fxe0ss85nSmZk/pdl4NUeqH7F7WNsxnu2DuiDPa8yKHBMtXhHZ9E6kOlL1qEgTJ22mN418Q73Wkd/sawq0EjKyiSgFs/l57VLoEMT3mTQyzuFy3j73aDp1bs62XOIjC3R9Lk75C/TZRTKkk0iOnjXe0i51PSo1hzDCXH25Vr5vkQAVdM+2nixS1OByV0PYlYyxrZbMzcWuICRwHOPN+cKZyVnwVc9bqkMZBEWCFzX8LXbCwd2Rre/l2cJPrh+D9zj2YFYElHOLaFFJNics888a+9OaEwNN1ndAUAY9Nrs2ain02fTOmxRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMW/EWGe5zqtYud9Ap8TGcnd5yd/Y7x3Dmg8Kwrkowk=;
 b=AYob12vo5s6wbUNi9dVWANC7m0G8HsHzSvEYVAzO9JbkMCyhx9HNRC/ZM7qMUFpYlXHM5mQEhUYjvBhE9zJ2Hxk2yDjHxT/rkLIq31/Yri5chfz61UBNguSE8YckirY+pKfaiAPktzfGX87Ba/W6p1E6CJf8autonr6P6DAMtK74jk6pGexpSNVPwfv0M0SsKUnzjDNlXq78gdS4I2kI/HgKw7duKXrtULQzDVtxXrBaS/zgJvOcQWmP1MF6RS6DwBCIDNv7Ag1sBnjTHmg83fRSzJvHijjPHonUKE/CO9cPekv89Cd9867rIO85BzLVCOclqKoLPwyK1V3lH47INg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB7079.namprd11.prod.outlook.com (2603:10b6:303:22b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Thu, 18 Jan
 2024 00:15:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 00:15:44 +0000
Date: Wed, 17 Jan 2024 16:15:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/display: Avoid calling readq()
Message-ID: <20240118001542.GR45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
 <20240116174050.2435923-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116174050.2435923-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 0402a969-e525-4f50-e8a4-08dc17ba9cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUBVjqsWCkwV6Pdr7k1lGzsLPopCs6Yp2BoYg91puKq9BfJBp6mucIC6ANeX0YtFkygn1cw+Rc5HyjxE40dMTlvauqKnhlfZQ+EusxEmAiMSdL/URYdV53NxN7UvbUGE4YY+PEJ0R2VGKj5I+rGr3TEJ+QUVjP1nJzXCO8S50eyFvkyiSabTVOgQSYaIUbm+kW53KPPwIrAM1bArGXCXRgFg68BcOqJqVAYP5yeRl98vhaGWNItzLodC4ygR5gbpEAEZ+I2xUbNQ7x/bCMEC49lO4zAAwFv0kbl3k1Q/ZNFV9pHAMY5lux9oe1WwyZGlSR6AMXRIE+xlu5/C6ssUlZdYbIVZnTmMQavBrbfOF5VXQ/+HQXtvbB8XZcnBeSumN/DkxFAeCjk8VO/fdnZV6s8Gn4iecLWRK+xSqyxA+sJTSf8OXpVq07xHbFrl+MQF5OqdnhMdyqSwBPmXUfnJStEvMqHIMvA3bl2Jkgcq3uEgszAqT8sk4jqs4hRIpN2NOgoNOUcMI/QJNYskrcaYO2WtZosoDLKuYq8JDmycu1d4OfDRHemuKzJGv+6zMiG/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(33656002)(82960400001)(66556008)(86362001)(4326008)(8676002)(6512007)(1076003)(6486002)(38100700002)(83380400001)(26005)(316002)(450100002)(478600001)(6862004)(5660300002)(66946007)(66476007)(6636002)(2906002)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgslbzRx2zDoCFy+Snmm+fFN2mQW57tuaJTVZiNgOA1LOh7RjnAhqAVlZs1i?=
 =?us-ascii?Q?QjaH9+GXnAG9whEvxLa6LSq7eCahKSuFhWWiYhTqmk1utRjIagRkLXeMaUL9?=
 =?us-ascii?Q?TxPvDfy4kTcRnM4MKVzZUlCkgy7zWjBI17817iCa+EPQ/c5IAejno6/e0/Sz?=
 =?us-ascii?Q?wA9lQg+sN3Rj5wraqucGDlG+A8e5A/phXOR5Dbu2mstU0V3DaLhr266i7kKL?=
 =?us-ascii?Q?1NDINihqAlNSKePVmnEqsVrxjAEjoYcPsItkmod6O6H3CmyiqA1w/ItKINE5?=
 =?us-ascii?Q?tvPbFAJU/SO+h9RDwJSxJWF6ff0IN5PTDXrZrip82ue5ZnFgDSj+4sxudiyZ?=
 =?us-ascii?Q?hRjVdB551HdBdrLzyZnPv1zdsYObjcSuD9o9dPxPVqQh45onwaKghJ83Y5/u?=
 =?us-ascii?Q?wZnqoVZ50WjNk/EvSM04D+gZVBSl0nvzbp8O3jRdBP5CY2Se8rmjrGJrF8qj?=
 =?us-ascii?Q?LsBUVe3uLJJHdhRNrpHBRdBUrKRk0oXdxEbp6ycqaSFpnNwKLxXJvNV8sHjJ?=
 =?us-ascii?Q?UbOMiouJWQQOm/Z74V2yzm6ULGvO4hBlTIj0gOhEofrmjapmtl3Ly/1D5Zb7?=
 =?us-ascii?Q?sGnJxDVA58/yMfA8SGCnd/8lP/PF4PHfYtA7NAlcuOXd6VMFJpFqXbBd6w9J?=
 =?us-ascii?Q?vgoZw+MWG+Q8U2yDREdImqXPKLMWKxZopme48zcLT/Ylz/yilKDIdty2H5zt?=
 =?us-ascii?Q?0aV8xc5JAhH2zGixxR2ig9wyBaFa1jb43EWUYtnm16Kktt5Z7UngdWLh1pfO?=
 =?us-ascii?Q?K5kJfXJw8XwckO9Uw9pH3mc7mLNE6L7QmfJjhJ7w/I1p4cfavseWTIvDBYzv?=
 =?us-ascii?Q?ukuYfvp28ztUo4Hzm6hhbQd2s1M2KvuKWQokCVbcaSiSAMdLZxh91lOxnixl?=
 =?us-ascii?Q?zN8zYQShNf4GulCRQDfY3YsbnFvgbuUdL5L/wfRYJCD8sH7GGcSQvUsrsVjY?=
 =?us-ascii?Q?eTHW5CHlWv9HHXdjMVHWNROrWW5ya4CR6Ahgd2NrmhQGUKbV7L+H29OVm/Dj?=
 =?us-ascii?Q?ZcimjfvF3+MpFKx+BPpYPpefjdIRQH891YBLeEvwsKY5QdOm592CozA4uh0Y?=
 =?us-ascii?Q?DMt1MTzxSwFEiWY3PCKBguf1mwWVsWaV7vHYQ6hNHq5MBU2JqjUpMwJCdo6h?=
 =?us-ascii?Q?aNIiK7KsA2Xrn6Yj8cnASUh3eapFLCg0Jir3bykC3lZvXQ8CsF9DGEThhzDr?=
 =?us-ascii?Q?Ju5dlY6wMOHl84/obe6vc5bTrU3Q03aizpiQ9NEOHzuUwnKXUuvf3sa7zsDS?=
 =?us-ascii?Q?IahDYejXi8yo6uQ2lMxtQ+cQcL+rG+P5r5B4oV5bn2I1hqiID7cx9j3nw7jx?=
 =?us-ascii?Q?7zaSv0NlqJFeol7QgqSa4FgCGMT01BkfFQ4gUb3rvaf/J3zvqKS4OqaSTzVe?=
 =?us-ascii?Q?On6ozBU2pprPssWzDx/b0njndlvF68rs5Ucrp7HEWY7YIfaejahvtGvuyaL1?=
 =?us-ascii?Q?Wxu/LDzw68xqWOWACw5RZ9Y/nHjVTfrrevspKKGeFrKolTSv6PYBLphHUzSO?=
 =?us-ascii?Q?AuI4xDvvGaV0+fBTnQiydyX9fIhcRkMaeEUTamzhzdLky1nvfTJSN6+5zDRF?=
 =?us-ascii?Q?ZdINBKr0v4UCqJypZieCa+M7O2SxLg+Z3dTwXhPZ4rhT0tC9Po1ajl4vrbar?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0402a969-e525-4f50-e8a4-08dc17ba9cd9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 00:15:44.3608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13ryXj3faxPVbs6WxrAKvgaXuvBdnGfrVqzmpNO3QE6awXsmVf1W4Dz1n/48KyfPqAQey0iIcZzLPb+3gNbTFnW8gUv5opNu9oNpFo4MqGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7079
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 09:40:48AM -0800, Lucas De Marchi wrote:
> readq() is not available in 32bits. iosys-map already has the logic in
> place to use read u64 in all cases, so simply add a helper variable for
> using that.
> 
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  .../gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h   | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
> index 5f19550cc845..6739dadaf1a9 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
> @@ -7,6 +7,7 @@
>  #define _I915_GEM_OBJECT_H_
>  
>  #include <linux/types.h>
> +#include <linux/iosys-map.h>
>  
>  #include "xe_bo.h"
>  
> @@ -36,6 +37,7 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
>  {
>  	struct ttm_bo_kmap_obj map;
>  	void *virtual;
> +	struct iosys_map vaddr;
>  	bool is_iomem;
>  	int ret;
>  
> @@ -52,10 +54,11 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
>  	ofs &= ~PAGE_MASK;
>  	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
>  	if (is_iomem)
> -		*ptr = readq((void __iomem *)(virtual + ofs));
> +		iosys_map_set_vaddr_iomem(&vaddr, (void __iomem *)(virtual));

Should we just use a memcpy_fromio (and memcpy in the else branch) and
pass the size actually requested rather than hardcoding it to a u64?  At
the moment the only callsite happens to want a u64, and thus the Xe
compat header has an XE_WARN_ON that complains if any other size is
requested, but in theory this function is supposed to be general purpose
and take any size.


Matt

>  	else
> -		*ptr = *(u64 *)(virtual + ofs);
> +		iosys_map_set_vaddr(&vaddr, virtual);
>  
> +	*ptr = iosys_map_rd(&vaddr, ofs, u64);
>  	ttm_bo_kunmap(&map);
>  out_unlock:
>  	xe_bo_unlock(bo);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
