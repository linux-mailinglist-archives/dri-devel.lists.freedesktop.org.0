Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E39832146
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 23:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC7210E902;
	Thu, 18 Jan 2024 22:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76D510E902;
 Thu, 18 Jan 2024 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705615306; x=1737151306;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cFuxTH0pBf2nkaODBfJMCk+0B7TMGZVKx1+YdaRPGbU=;
 b=kSg0UMQGMC1QdN87t618Wq1RqgP1Rscwt8ltR8MB7i62hxyy4qZhyg5s
 2OX/kV9wuLBckiMsYQYrlFtnFAHfmb3mRLcC8gGXPyqZ0wi/jhgKKqWAj
 j7mynxC3XGvBLzoI87R67qA3T7zclobANWVepLGT3kwtQnhAx/4nQ4FrB
 lh4HuzporKztzG5imN+1Q4i3a7fJYXLRJBfOyLsGrzihx9RngMqSY2zUB
 QPPdR1uieKsrTWJnyioPn9U5M5f3pdWmzVKuIMJncEIZm1GGNQe4wxPpL
 mXLCA+2qZZ4ePxWpR+5al+XgnSTb+SfJQLbO9ZGglq0Df1GbuUGBUQvYa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7963995"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7963995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="33216021"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 14:01:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 14:01:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 14:01:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 14:01:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9aqEk3T35xCVtujEQ0sGI/hmnb/P8pDkto4PIU778iF2A7NsaZbT+VO8FXJ4CLQg9obHQa+R+O2/KfV7w6lDo0Kv0TS0aXNk81URWOslEQcz7IGF8HuCZ9gVXFE2LhgoDVYAod5fS3JFdqljZl5cjtcp7Ez55GeGfJPZ7eyPy8NlEgIrh8U0q151QfG0hB0GZDFLTlACOCP8tsIRNTFmucO4QoxZxigMTt4h46s/e7lei2pw5mdFSNyWjREWPhJmbuBQW0WcNdBPWj6E0ct2glDtlf127wcALfP0YO1anXb+zIepzAsVzT8ZE7tHS5n9Yf6AYhaWtY4m/EJlrxPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAQjoMo3izd5QF6PPkg/jpFOYlFc1uIsaxlEbLy/emQ=;
 b=P+h0lK8oT7A3eMLBGrFF+fESAGU9Bo+M12ss+G5ZETfNMRNXgW6T5SZjjG9Nzddui5koQ5dSKqnh6KcM2KAvLh4l28S5mwKi3eeqpu69ZFwd7Q9Wq7pl9Iqz4Gibg8LZfkev+eq68V+tMgsp5DATe3StmkQpevPOok2b/UtsSeQKmjnh1UOg21+iu08pIce8zt/UI2oAeV01x6i/T+gvgCxjaZ1rZY4NdDmRkrEza7cpKfOSS5wsWgi9L0I4tF5Z4mxzlex8DUKsgru/dZO33K8LrOgzVgsahZz5Hb1b2YlWKEQIdO3iSJfifa0xKPNVv82egjs8wKMWTQB3FabzvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 22:01:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 22:01:41 +0000
Date: Thu, 18 Jan 2024 16:01:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: Re: [PATCH v2 3/5] drm/xe/display: Avoid calling readq()
Message-ID: <j3rrxqwrfgxh3cz5wet35sralqhcrus2xcjrwmqpq7k7swaipk@fmnlq3ffjm4n>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
 <20240116174050.2435923-4-lucas.demarchi@intel.com>
 <20240118001542.GR45138@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240118001542.GR45138@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bfff2e3-07a3-4093-61e9-08dc18710d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLVI2nb3+mEMYs5kAoKSEs6DmBuGUbejKcM6RYkZhCXxA+ZvWDi137oeyUsixeBLpS6/pxl82mG4PHgsRkC+vvGMZS7QpXn7hfkNseHBZTWN94XPb1mvVv3u23KJDQd1udDMHyN6aeaq4xNcE+esyTwgN3m6ONq16bUvHYK4oZQZahsq/OddK3CnZRvfQUwtQ6H03SKv1Emi0mWtxnCma1Vm0BEVnRc8iCpNuImFN3RkLY0Dp+IkvEU1bxhWxr6YpcO4J9HGuxUAsnQXozgsEvB48UrSC4KJnKah9hIWhYJgt3Fd6oD4jkED4mKgJ633NloSNeUQSqRzoKD5D8g0WTFqwqCc0YwExQcE6zj90SrnAR0RWa+3072zdecoLLTm25PhU8Bh+IhQN/9x2gtNv0qvvxaZXXM4K5lgLzdhm0dbuRLFs45SzR7j3OSBPx3hV1XzFO+nCMjkrqdnuBMY6HB9UTMobY/0vTdwR7p44TGlxGBMJfNRjpUX6dGKk0tLf9QM0OUbLdc9CAKnYpqwNji9Hb5pNQGmV1st2sObOvZFH8BmddYmmqBrQExtZ314
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6506007)(26005)(6512007)(86362001)(9686003)(8676002)(6862004)(5660300002)(33716001)(8936002)(4326008)(83380400001)(6486002)(66476007)(6636002)(450100002)(66556008)(478600001)(316002)(2906002)(66946007)(41300700001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ReJ95m1kFxFdFiCAKBd8iEPdhAr+XrCDtGBQWwKfbABaCvLLU3vo/x3Xc4z9?=
 =?us-ascii?Q?Z4/v4QBVy4K/w638r/HdFG6cHnsZgoOod/94fo9GdhcbIVZblYKlfMRkvdOJ?=
 =?us-ascii?Q?RxTNQOhJxanoUSl+zoZVRqaPhOaNhXsBasKpxzXJUSSbpVTNfwatlZawUCcW?=
 =?us-ascii?Q?iwdsLlhQ4kSM2Kqfdvfq/zUWWeZxsA4D1sk2bbr1ag0iQJ0C/xv6nPum2qyU?=
 =?us-ascii?Q?zjwqT2S5gs2BhPCj7bhB9wEFMbgojweEfiINGds4lp/I+T2QSLDPNkLMoEl4?=
 =?us-ascii?Q?2TuCR7NhhqdEWmnwjfQM44crrAtFLSa6/gJ8WnBRIRw5IKIbr8U8ObRF/yFo?=
 =?us-ascii?Q?FJPc/cb9k29xRWLUE44YvswOjho72diotA1uF+oWkUuLLt0OzhYyckX981/G?=
 =?us-ascii?Q?yfHpk5/90zrhiAW1VhtDSpUmvUjSHdaqXHcvcXmgpNGdzggFioF/qcGk4gxV?=
 =?us-ascii?Q?LvH9gfACxqi32kAm4xzgtvkpBKT9x55dyuMGJqbjjktRKgUHicod8tZGkRXy?=
 =?us-ascii?Q?Os3XJN2uuPse1Uya1TUnZhO5+OIgo5fQkrraQeHGVRq5HDY2+JuzIXR0Z/u2?=
 =?us-ascii?Q?xOcDXHW2BDefv2K+zhxCA5KEZEKd9ZUqG0BJutziDHbwaWAce73zuotuo0eH?=
 =?us-ascii?Q?5ajsfa6LEXLo/DZtsUfjiI0W8Kl2QJnOPtVydcKkZVYFmtsBMv+J6NY7NadR?=
 =?us-ascii?Q?raCRKf8jErjCdSuOCyd9vxXMsWMEgJDPxwXeFIj1s04vVY8hvQmlJJSipKmj?=
 =?us-ascii?Q?VKsL1B2/TMpVlD4MBM9wBLVsPGt9cu2sw1jaay1CpatmSORI+VpF7k6e4gHR?=
 =?us-ascii?Q?wfNIgQHqAY3Xs3c5fovIdY7lgc0lni1rQ+ESGHjShPhdLhrucWJwg4opwEut?=
 =?us-ascii?Q?jdnhbEvkvtTEb8WLoovflqwcib1TzJC9becwRPsgnKJOefIhJF/oaDoGrjHF?=
 =?us-ascii?Q?uDYJhzk8ZBJ0Mj7oBvnyzn0S45CeGXE99IG8pxaNs6G7sPufVHz/NHo/RVij?=
 =?us-ascii?Q?LHgDCVSMPtwA1LfnBuLqXMHCr9O5MsIg0uGVkFiGf0dVPc/6aabggPtR4LVf?=
 =?us-ascii?Q?8ODhGCLqkLUOYamxaMOc3GUdWtCbzMamoss0+kFtFGz1nL628LMI2Tu5N7RJ?=
 =?us-ascii?Q?78iJ3TeSUgToTtEPvHJjME6Y4P0hzGhlX1vrHPGYNYY76ylD2Wg0/ECXv1A2?=
 =?us-ascii?Q?n7zCf1nD7Tihsi9jRkl1AtEhZUiCWhjRpaFXQGumcbVDwdwjzZVWzmGVDCQU?=
 =?us-ascii?Q?N/dbVrfv7nzO20yykCiPzHRRZ0dqIvtrT3pwPoaAsEv03/TVma2nb3PNV/J+?=
 =?us-ascii?Q?YyzHOGckNKlbesdmQLaXx7hH6QWsbdao7ApEhdHCHaHGRAkfMiLWXu7Qntrj?=
 =?us-ascii?Q?bOvIH5jqYDop+1QDp+eklQAy0Fhgvt/ux0Y1FL9kavCddPBGUUHTJuqOnnve?=
 =?us-ascii?Q?8gYj7LLe3TpdEerZPd4y70+2YsEQKtKBezjKM4UJZA7yvufNxfMjYs528gFb?=
 =?us-ascii?Q?YhEns9VDd9/8+Qk7vD0CI4Ab1ROk7/DTs116TW/tjMEy/GWuJlbyaIzdArvE?=
 =?us-ascii?Q?yOI4IM6tDVSdgdMYFlhTjChUjdRRX1KhaxyabKwppmMjhIoc3aTCeiDEPPam?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfff2e3-07a3-4093-61e9-08dc18710d53
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 22:01:41.5459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAFYyxhbxnj7r287YKHDVq88U6YkEzBsnpcQTDCt7PbWEjsLzETHzkkQmqCM+9ByTZ3BjY+j1QkCz0YJMROEz9b3JvJu5LeFp/agOnpyCxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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

On Wed, Jan 17, 2024 at 04:15:42PM -0800, Matt Roper wrote:
>On Tue, Jan 16, 2024 at 09:40:48AM -0800, Lucas De Marchi wrote:
>> readq() is not available in 32bits. iosys-map already has the logic in
>> place to use read u64 in all cases, so simply add a helper variable for
>> using that.
>>
>> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  .../gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h   | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
>> index 5f19550cc845..6739dadaf1a9 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
>> @@ -7,6 +7,7 @@
>>  #define _I915_GEM_OBJECT_H_
>>
>>  #include <linux/types.h>
>> +#include <linux/iosys-map.h>
>>
>>  #include "xe_bo.h"
>>
>> @@ -36,6 +37,7 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
>>  {
>>  	struct ttm_bo_kmap_obj map;
>>  	void *virtual;
>> +	struct iosys_map vaddr;
>>  	bool is_iomem;
>>  	int ret;
>>
>> @@ -52,10 +54,11 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
>>  	ofs &= ~PAGE_MASK;
>>  	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
>>  	if (is_iomem)
>> -		*ptr = readq((void __iomem *)(virtual + ofs));
>> +		iosys_map_set_vaddr_iomem(&vaddr, (void __iomem *)(virtual));
>
>Should we just use a memcpy_fromio (and memcpy in the else branch) and
>pass the size actually requested rather than hardcoding it to a u64?  At
>the moment the only callsite happens to want a u64, and thus the Xe
>compat header has an XE_WARN_ON that complains if any other size is
>requested, but in theory this function is supposed to be general purpose
>and take any size.

yeah, good catch. I will update this on next version.

thanks
Lucas De Marchi

>
>
>Matt
>
>>  	else
>> -		*ptr = *(u64 *)(virtual + ofs);
>> +		iosys_map_set_vaddr(&vaddr, virtual);
>>
>> +	*ptr = iosys_map_rd(&vaddr, ofs, u64);
>>  	ttm_bo_kunmap(&map);
>>  out_unlock:
>>  	xe_bo_unlock(bo);
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
