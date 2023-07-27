Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB6F765F5A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0A110E030;
	Thu, 27 Jul 2023 22:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6287F10E01F;
 Thu, 27 Jul 2023 22:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690496750; x=1722032750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7R5nCV9CK+yzpFcJ+Gmak8Z/2UBN83CVzuJ4v6L2Hjk=;
 b=O7+eL27XUbCZDTG1PAXqDQ7Uj7vQmOilIKWKQO33DnL0xiNUxWBlD0mb
 Bb7DSpTGnTP0u9Ml0UzGph/rTk60ssy6V0HWjKxBe06rxZucsgE6kS1eI
 Fv5ZTUHMIxjyr3iz1rbsHgK+U931eA8GVwixHUN4GxLYfZgb8qDzYfgRR
 Jq6AUWRPWXVeMl7ylvSd4Vf7Nq8LjlJqpfXp9ftXo2I1qrjsRdbb2OZQi
 gfW5M78ltZM+TVk3TxTFhNaef13u396/xDePwOVgTZocBKCkS5HZ8haUi
 yv1NbBL3nWZYbzJ9+Nf/6cA1NgHrV86Llk6446pAUFkG9aDIK7leR2WcB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365904597"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="365904597"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 15:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="721045025"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="721045025"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 15:25:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 15:25:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 15:25:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 15:25:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 15:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cV93p7ZYXMCGqpQ+p3FmXnsS0USg/G3mRRRTa5Lh/eyr+Bbhp7xkl/sCNL5wBVK8i1jiAujbFd5peyWpLknqKoxLLckhDPI5x+OAptehNNKPkn7+FxmuFaK7wSgXV5FieyEMLaFd6+qcJXTjkAjiqG0WQMSayZplFMRjOas15RgZrXcZEdYMQ5VxelnMfMNCs0A5iLL7RfU+Qapspqkh0FienN+zACVVHmYNv90sABLd8dlOX0/FIf4bk10WPtVtSYqbAKipI+KUV6sqApHZ/VQFWqlFafVW5qCMZNa5zsH2AnkecrgCIGc5CDnKTu2tks3O0alSbEgEn5eBRlzyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ja5RpbeaRRn0keYm/X6SK2d3gxRb7j/2MYs+GaeeF7s=;
 b=U/AQ+B7TapDrVCb3YRM4C16HguTWhyUO7fI5n8jgnjlmxJ8WLMvMCr7+55vbKjE8taQgf4RqxVD3/v1zZBBSaJUHcKX1YVfw0NwLirRqlvHwIvWTx6ZB+57MThYBLYtecZQ8N3j9TW4bUr4xCK8jZYMIjpH81lMOqRUmwTE5prVSNqXw2zuL0z1w7rGp+yYAPwoKZ9OHBGpzVtnzjvU28Bi7eV4VsczxDk9CJzauQFn1G15UUx0ttC/nBGsCrK+br/M+8cEWIA2ynce2XQKKMVAipgWWet4nCuMIlS7OwSExFZJpv8i7Uekr+/zypv7TEVxPu/0OdEB3YzcFXm0NXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5316.namprd11.prod.outlook.com (2603:10b6:610:bf::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Thu, 27 Jul 2023 22:25:47 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 22:25:47 +0000
Date: Thu, 27 Jul 2023 15:25:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 2/8] drm/i915: Split PTE encode between Gen12
 and Meteorlake
Message-ID: <20230727222544.GB138014@mdroper-desk1.amr.corp.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-3-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727145504.1919316-3-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: b181d597-d3f8-4d32-ac87-08db8ef06cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8AamyipeV3sqK7C32el2wReTZUDC8zuUKCVSqeQW6C2+cz0By1UOwwbkOTZw6mCsugq55qnJZQVPZsk2KajqxyH5rWZwOpsSsDPYZTiJTkUwX9+GkAFoqRvRrE5LMWqQhtxKgHAdu8p8h1QZJE7lC+9jpzUny6/qWzua/vSKoz2CKcsZK1MV0LlT9jX4n06BYIkbMdBJkikZ6NLKVCzsMwd+VWoJhdnGpsC/+yxE8ByZNonVL+GJ+sT6cWhmUldIznS01vajOvc45oU57CGrRcHK+UQnmMo7VWU63l9cnn/zKBect+pdv3dh/3cqqzqXOE+ls74xzVmfp0wH8D8E48DTLiXJttPIIYcuz3gIPNNtD19qLZZERtU8eetwFF1TDJCKZL0OttGwiFz9kaJtUJhilMEi+2qI4eF8F33YNxDcMtvljyKLoQFV1lt1VKDbSvAaUpZ/VbLDWDb93viqKpd7ol2XO4lRElcS1yj580fj7ZLKXDOCaHeHvVLmL45hNHEUnnzZArc+LNn5bZRPWRxKOcairVDsZrDLOa4K+3ZVsH/lMixc9ewgN2OKQ9f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199021)(82960400001)(2906002)(6666004)(6486002)(1076003)(26005)(86362001)(478600001)(6512007)(38100700002)(5660300002)(41300700001)(316002)(186003)(66946007)(66556008)(66476007)(6506007)(33656002)(8676002)(8936002)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4kr59T3sFCDhqlN0xihQIN9PXzi2SnUSqTfAjOECy8HR5rzAUAfJHN42J4g5?=
 =?us-ascii?Q?A0Ly1PHXg6DNJ5dI7Axy5HeiTpyYl3/grz0UWFSRU0FDKb5remsyMjy8VjM9?=
 =?us-ascii?Q?oGMcFJi+xx9ai61hrj5b5qM/oNxO2l3iGqifSh8KhFp7qqAFilE+iOAaR7NC?=
 =?us-ascii?Q?EyK3SwlZRS6eMWZGc51YfJcUexaZ9xnd5Q1t8X7a+V9PsimgtU3s78PF6CGE?=
 =?us-ascii?Q?7T9ppSoXsTXa8q7ffg/uuDh6fhDeorujnfqhDoaKfeQunQzNTc/10up+tPaM?=
 =?us-ascii?Q?mvOvUC7PhwhPBiEr/uZ5u5sAr/QpM7Jz+XvvNs/ixH4KS4M+ZgS7zIR5c+EG?=
 =?us-ascii?Q?xM0/JZ6aPxpiY4xy7e9DAaqWevlKy2Qb/eeNjnZm50AwVC3PsSdWba+o12mV?=
 =?us-ascii?Q?X6L1ioFgisUgr/7bhRlXiPrzv6EliTUreuWAu3fYlXAu40spkGYQM7yuqFMw?=
 =?us-ascii?Q?SdQTeV4xQuBMwlG0Q4p1Dr3/skzYiWg/k6HC612hjRaUdszT5lTM0vEiv8GC?=
 =?us-ascii?Q?PzALi7hMN5gg3H2tvwvINCWPbZ2mrUL5QGppC+dWlN99+1jFND9O6rUroWQS?=
 =?us-ascii?Q?NIUP0hYYq8qmxwbnjOA2X83rmVtujk7lt/p/JOasL1jV3hX5QblATYb6Dj1S?=
 =?us-ascii?Q?ZzU5Dz7xc2sFTHh95OZP2wbwVyCLhpOHBQQ2kuq646cE8cMQyiFjuhyBJbva?=
 =?us-ascii?Q?XtPMzxEo/Bs/8kFavorQCPsXQ2HX9eCbx52ekDxFFSyvccgtNQuN9QRx5sYT?=
 =?us-ascii?Q?VLzAp86Iy3+uaMBOI84pJSTezqGRq61mdMk4oMSXTEcq2pPyrp/ZnG2CRme1?=
 =?us-ascii?Q?KgFvfT9p3cUFPGNXCYxcyCVC8rX6t1vvU10LGpZMMqIbpwdlhNqRZak7TGBE?=
 =?us-ascii?Q?4TBCB1no4fj5ELxi29JFMzZeOy5a/1yFPpSbQJm9v3aZmzOcz0xqCk0xc8ye?=
 =?us-ascii?Q?0zp3O4HY4m/0wuY2qScUwvpqylQAVdsDBJu5d7/PHnA/s5Udtn2vZMPrqSkt?=
 =?us-ascii?Q?qR4st2K5HmSg6A8UF9FH3s+FiRTlz0bHiIfBiVxOn8m5Eeow+kTiiik8f8/5?=
 =?us-ascii?Q?KGTGXAk4Fo8B2oV/iaeTZ2dC+Vk+atmAC/RtVsz+0F18fvKOC3pBwXNDarqd?=
 =?us-ascii?Q?fCDHAmV3bcV+5JbYwcqLfhW3K7NX5Wz++d3g42pqN+errJVL5gw/6uMcTEby?=
 =?us-ascii?Q?1QCPhFyMz8khllkdon4sp/eF/P9epaD9gvh4sBh3MNvhZ9nwdlsU+COtVxdi?=
 =?us-ascii?Q?06X9FwSfvxnoIl5/e1uEDwS12u5IGCv+U1FCIUh4w57M3eG4eI+b5doUmZYD?=
 =?us-ascii?Q?EDkVGtlmWunzBZa6MgPGmQvE+YFDR3sfR1Hs8XXrVP6sl0M64M9tyQKH6APn?=
 =?us-ascii?Q?FUcmu1dv+UpjyRllwwCCxkpVU91/PLWTWlYJuf88KddeoP6+dEVlNEJ3WYiK?=
 =?us-ascii?Q?mofGcHPahQ3jyNu0B6Lq/ALVnpkTmaEfVMGf1/8YxLY5MlSk2f/yNbv1v2Dr?=
 =?us-ascii?Q?2gkzrbatFCPAcFOVaKOUGfFFsvT9BeSsZqnKe8bBwnweneD9pR9NqmHcz6/G?=
 =?us-ascii?Q?NR2xRQeJOdFLMzB4ghZYdoHfMeYMWQSRSHAW/HUIAbW+gYJk3e4KYiZr1aUp?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b181d597-d3f8-4d32-ac87-08db8ef06cce
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 22:25:47.3445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nia+epugn9+rdwY7HIk4Vt7Cnes7vfdTp5iEwBtKHHffmthaPviAiwM3IqL1PfU46dWPSOPasfBNwASSBadMFmX4VHsQXdoiTFuAAF/iAMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5316
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 03:54:58PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> No need to run extra instructions which will never trigger on platforms
> before Meteorlake.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index c8568e5d1147..862ac1d2de25 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -63,6 +63,30 @@ static u64 gen12_pte_encode(dma_addr_t addr,
>  {
>  	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>  
> +	if (unlikely(flags & PTE_READ_ONLY))
> +		pte &= ~GEN8_PAGE_RW;
> +
> +	if (flags & PTE_LM)
> +		pte |= GEN12_PPGTT_PTE_LM;
> +
> +	if (pat_index & BIT(0))
> +		pte |= GEN12_PPGTT_PTE_PAT0;
> +
> +	if (pat_index & BIT(1))
> +		pte |= GEN12_PPGTT_PTE_PAT1;
> +
> +	if (pat_index & BIT(2))
> +		pte |= GEN12_PPGTT_PTE_PAT2;
> +
> +	return pte;
> +}
> +
> +static u64 mtl_pte_encode(dma_addr_t addr,
> +			  unsigned int pat_index,
> +			  u32 flags)
> +{
> +	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> +

Would it be more readable to start with

        gen8_pte_t pte = gen12_pte_encode(addr, pat_index, flags);

and then |-in only the MTL-specific bit(s) as appropriate?

>  	if (unlikely(flags & PTE_READ_ONLY))
>  		pte &= ~GEN8_PAGE_RW;
>  
> @@ -995,6 +1019,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>  	 */
>  	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
>  
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> +		ppgtt->vm.pte_encode = mtl_pte_encode;
>  	if (GRAPHICS_VER(gt->i915) >= 12)
>  		ppgtt->vm.pte_encode = gen12_pte_encode;

I think you wanted 'else if' here.  Otherwise you clobber the MTL
function pointer.


Matt

>  	else
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
