Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047753E2F40
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67996E1A3;
	Fri,  6 Aug 2021 18:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF616E1A3;
 Fri,  6 Aug 2021 18:25:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="212567262"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="212567262"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 11:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="569826147"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 06 Aug 2021 11:25:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 11:25:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 11:25:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 6 Aug 2021 11:25:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 6 Aug 2021 11:25:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/kCtHbH9JqEy0s5T0tEOMO9Kyjxhu//4Dc5wNja3zRvuo8bOWDbslw5L+UGudOiVLVtCk3hiMsYZyySg9XcppD29zSs6i7c+T+DEvne4kNf3hiRZjUl6GqWg1wTu5xz/oRltJhZ88UNEjf+LaxVpHN3eOSFhdA+60yR40HRaHhXUry1wwxLOMrtjT0+fnTvFtDQdt1BzNRWNs2aXPd1wIvInYEnQt4OXO/uX4eytH1mIJ4/ws+KZR25ygcSdvzMQEmq4hMW3iapiLK2FiyDTz2tWIXW2OmjBsWWbfrHntP5EmRkH3KtoPotkHBXdrs3QNLam2k0MMxMGQ4J+A4cfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8LQVm6D411B3abwQEfU3zCK1aK5vZMb+YIhxoZPoQM=;
 b=IIejugZcx8a8Qx1wjh3xVYvV7SnuEYVJRGDDBqcUiHWBxRoN04UnQCHGuc0bHfs9SLstMp7d7wQzYyLE/XjlOORfKy4GiBbyBbeR2yLJxBedqKGNkV/DOkgAFnYLnHzUY3BBGqzX2/JI0XwmD0/1zrzA+fG5QgAyFZe/VeQRCFDilpht891c4lttnVVt8UIzOVftMKQG7Oi/adGldZ676mJEgFnSuvVTtnpduIzjjbU/+8yO0MMLSFqXtZtkzmBqmyF2dfAnIdsDPyRAtg1Wsk+1iw14eY2h8la/IOqA05fMs9IwAx/J3umPy9JKD9+V08tyu2qqw1LRMnAA1gQ0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8LQVm6D411B3abwQEfU3zCK1aK5vZMb+YIhxoZPoQM=;
 b=rGgKOqxsjDmRVh9BD355+98skeR1XWuk96N50ccxVOZjMJ2JYbd/mFK6BaRaVitUTH2dWM9Qofys0OOKEF5HEWKEld3oidtaNunhRgH4KtkM9FsOcAFA26cHZwuXzsZTLociBmP9erQ5pcNQiP4h0acroFT2r82YfrhI6zuj3/A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 18:25:10 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4373.026; Fri, 6 Aug 2021
 18:25:10 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable bonding on gen12+ platforms
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210728192100.132425-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <23d6e809-1d6e-ae35-1aee-e6f0c8c90419@intel.com>
Date: Fri, 6 Aug 2021 11:25:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210728192100.132425-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR08CA0031.namprd08.prod.outlook.com
 (2603:10b6:a03:100::44) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 BYAPR08CA0031.namprd08.prod.outlook.com (2603:10b6:a03:100::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 18:25:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31635713-f310-4b76-d995-08d959078647
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56095F21A2E3D2E21D9D688DBDF39@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfSt067v9pIYktsV3wMo+eBzMo6iYrUB+u5XuJC6tWRmecpaXdZWRzmTnekfi0I4L0Kan3uTL5DoboWNVNdpwXgxdEoh3pKZ1z0UOGzDmYtk1vnPx2dzsRR5ywwOG5tccqFpwPVY+79g4Wz4teQF5BH0xR16DRzrRZZCCB7qVqrTahIZZanFF5SLCTEMymgj5JbazJUrqT/NICwVX8xZEce8w477Kh59mmDn8Zpw1PdR/Nsrur0oyeCoMjZM8mj/E2IVYqlekC2bG0DqW2HSx3T8KwxZoJNpKr0x2GSbER+pYVodWUg9WrQLsHMADT8ZjV7cvsQyGTfuiUb8FbQ9QQxrpNrC+8Sffc/wfS2LJZr/XysIw2rocpHL47+rGttATu76u8auV4Y8YvgJs0Ul9fuGhfOxO7YeQM0GZjK7VXSjNOyKUIsAxsQ4bECaCoj/GT24IdG99NRUnAcs+11n8qkQdcd9FAiMiuBqemhH4ef9jKGHbckjGvCzuuZCG3GP2nY4OHWxMndGcopdPU6fQZW03wAdMBBy/srXH0neMOiQUrgeAxuIRiK336fHm6+fkJp4aUQHmdzLjxc6dhDzXj22+gf/B7TSmWQG51gasZANcsVNVfLSEPkYREns0tsJ1+TjLzP56/wMnOfEKrSuJMcvOediyOERwzMcqkA9OFBHh6hec6e/pv76KPq4LKy0lCPD7sMpsPJXtTmswTho6epHkDDBj36ZCv8srioC4UPMNyhr2wSAUDW2MJ7Grv7m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(31686004)(8936002)(186003)(2616005)(16576012)(31696002)(66476007)(66556008)(956004)(66946007)(450100002)(6486002)(2906002)(53546011)(36756003)(8676002)(316002)(508600001)(5660300002)(86362001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZElpTGVObzBLNEJNbFV2REdhNXY3aEw3ZEVSaUVzN21rYXJraVVoREZrbGIz?=
 =?utf-8?B?aGFhVDV1MVJWc092WEtCSWEzZTVkYkxwODBBc3NPdW1iWWkzUzVWYXIwSU52?=
 =?utf-8?B?RllONm01cDBhTjRDVXhBdVUwV1dmbzZ3V2FKdWFBK0VzR3h1c0pnSGNxbUJt?=
 =?utf-8?B?eVdHTGFMTXRtY3lYTTI0SWhySGxUNmVhZEtzUDJCekZFQWc5dHpJKzVzVmF0?=
 =?utf-8?B?Y1g2Vm9xQTA0dmtqNDV6bkNkejN1b1VyR2U4aUJXS215Y05mdnVnZkhqOFFR?=
 =?utf-8?B?Ly9BV2lvMFpudUFEVkRTYVp2SkMxSE5qc0RuMFhxc2xka1RnR0owTCszNDBj?=
 =?utf-8?B?ZXk0QU1vbUIwSkI0V2JzdGErbGFaOWtLSjN0QXpnUDVCeENkelZxYU5SeDVJ?=
 =?utf-8?B?QmZHeGxJN0JOZzQ4b0FHNGRqVGdEdm9ERmlUZjBoS25qaHNiSWFNTW9qaHdM?=
 =?utf-8?B?OUI0RUNGMGlVTWNBV3JFVmc2WEJUTGpmcVRHZm5nZWtFeHhWeXc1dkFSOWJj?=
 =?utf-8?B?cy9PSXpjdThDbFNGRVpDb3V3THgvc0h6Q0N5VDd3SkE3NXRqU0lHdXBZMkJp?=
 =?utf-8?B?NU1sZXRyU09VTTRNeGFDalk5ZUJBN0xzV1VFeFozOGgvdEJqaGRsWkg4cEVz?=
 =?utf-8?B?ZjBaL1BSOU0vTStLbXFiUGQzWFdIbmlkcWxHUGE0bTM2RDExVTBqQ1d2cmZ1?=
 =?utf-8?B?NXd6ckVsSHhuRmtkajZhTGFMc1B5QU11RDY2Vk15djZyd016bDNvSVZKRDlQ?=
 =?utf-8?B?eldRaUNpekMrOFFwc3I5d2FNL1BaTWNtMldLOVBGbThiMkZabytBQ1d6TFJM?=
 =?utf-8?B?WDN5MUk5LzlmenB5OWpiMkhjekdzS1lUZURwWG5VY0QxM09CaU8vTFpvVndK?=
 =?utf-8?B?aE9Rb2FlOGpsT0J5MEtJN1NDZ0NFS1FEMGUzTDBRRkFra2lqTjMzK1VLc3BM?=
 =?utf-8?B?dmIyQ0lkM08zRnFINjh4NUVtL0NtaDNlYVdnQ01Zakl6NVpoTlQ1OGtDQ3pQ?=
 =?utf-8?B?M0ZxVW0wVThONnFwVEVhMFBJc0ZXaXNRV0FMZTRFRTNBOW0zU29Lc2E4YVhJ?=
 =?utf-8?B?WXg4SVpJQ05NcmErK0tSVnpVRFRkNUowZUFKUUlwdkszdGUycFpWR0xHWTFv?=
 =?utf-8?B?VGhGYi9aOU5Hd2ZKMG1MaTdZdGlxYUxjOXlHQitxTHhLdmVHcWFGQnd1RVcx?=
 =?utf-8?B?QzkzVFMxSVVmOFkyWlFDN2l0ZHpBbGtYcDFVUHZVK085UnIwS0lnUVRnQ25r?=
 =?utf-8?B?aHhPaEZtVU82cURVY1hXZlJjZjhUbGQyQWhOQkoyWENOWVBvWWxYMFFTRUJw?=
 =?utf-8?B?UnY0eEhRMW1xM3lwbGVVSTVPK1dDZFZJS2syNGlLenRpRWdlZ3JJUDYzMUFN?=
 =?utf-8?B?YXNmVG5wS2lGbzArYUU1SGhZZ1VkQkptNzcvQlRZaEdmMHFtM2ZGSW5Gb3ZF?=
 =?utf-8?B?VFFrQW9KYzhFV01aSUVYQ09md05CckRyd0hGMTJLUGF6Qy9UNFBGZXVES3Qz?=
 =?utf-8?B?b2o5U1lTRHV5YWo2Y1hETnJGZFlUVmJsdWQyczRZWlR5M1pkRms3WkdyYy83?=
 =?utf-8?B?M1Fsd0FxZW9zRHJkRHk5aEdCczZtR0pybEdLMmd0UUpIcWVoVGhBcWQvSHRV?=
 =?utf-8?B?RGJtMXJjVkEzU0xMdXlaOStNYlpVelROQjVRQ1FGUlVJQ3g3VzhzZ3Zta3Vo?=
 =?utf-8?B?cHM5WkRBRExIbVdQNERualZ6VVU1YlMxRStjKzVXK1FjckVPSmhPcUNHRVBG?=
 =?utf-8?Q?3x/ftLWgVgMuRTGQZUUWQaMACvNYo8kwvTaJFUP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31635713-f310-4b76-d995-08d959078647
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 18:25:10.4096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZHUjviaOjU0umOagAefDrphp58ZkEmvWzE0pS9QDORmKiDeVonKqtpqsPXt8zUwQgABX7iOl9jph1dSz3L8eXF13L+Cff7D4zDinq4sgKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/28/2021 12:21, Matthew Brost wrote:
> Disable bonding on gen12+ platforms aside from ones already supported by
> the i915 - TGL, RKL, and ADL-S.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 05c3ee191710..9c3672bac0e2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -446,6 +446,13 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
>   	u16 idx, num_bonds;
>   	int err, n;
>   
> +	if (GRAPHICS_VER(i915) >= 12 && !IS_TIGERLAKE(i915) &&
> +	    !IS_ROCKETLAKE(i915) && !IS_ALDERLAKE_S(i915)) {
> +		drm_dbg(&i915->drm,
> +			"Bonding on gen12+ aside from TGL, RKL, and ADL_S not allowed\n");
I would have said not supported rather than not allowed. Either way:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> +		return -ENODEV;
> +	}
> +
>   	if (get_user(idx, &ext->virtual_index))
>   		return -EFAULT;
>   

