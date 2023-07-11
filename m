Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA4174E9DD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937D410E33D;
	Tue, 11 Jul 2023 09:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C5F10E337;
 Tue, 11 Jul 2023 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689066498; x=1720602498;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ICTqvfJ5xo+ojOVlINBj58y0MrnJ9S4haBN8joWEKig=;
 b=DBSZdRN86KTYAaQg+nXKItxG0eClUZumvCnN0QsGkvYpEatIqlQZo46I
 ctTE08FNjInHrBfw4WdSdgu8S60SWhWWrOzv+prisIzmKhzGO9TXJ00OV
 dAeWSRtgU3+ieYrG2ofmexmSY2afv+MLvtmmGJywCCSw4tAS6xbSf3uta
 k9m7xiGQvY8nPnNje4wzCOpBMDpsESRTUV33u0+ruHANXhoEu/tO4WYwm
 WXJE3h3XUyja5MC7ckiUzQYdDVttrwvwAakHt0W8XtFpSbFahT6YUQGLk
 Q9Fgjtjdvfc98ZCg9W+BC2XcmRP/IfneRb+bY53HY7BNpPX0vTjimxre7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430655284"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="430655284"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="715121544"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="715121544"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 02:08:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 02:08:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 02:08:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 02:08:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPRJUHxD8BgrtIJy9n9sQp9RRjN5pskpqD/chHC63fqj537eAmJAoc6YUihE3J1Xt60oHwAON4bEQnuk/aQOodFFHz6Ln8qJg2xTXEVOrtO6XtT48GTAqMbWOZ5M1rZaSQfltRmY7xxRcvMPidQ9bMzZ1esCUM5qcpiN3QSjg6q/Z7jaiXRfQ+tOLTw6k2IBOHutbNWxEa0gJ+9BrhrlZkG6GA4OQWnQ7akT2bXWndG/GzSfcCYY2fFqSBwz9nnwcvhyy7uODoPeTO1BQ+YCLhosF+DBG02ds4TNvAhEfutCvo1RRu1LEZSCQco4DyragF2ClOUTfJPvHp3rMJ8MXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Gief30koCjCJkYhFtehkvm1bAMIau993/K/gzvurPk=;
 b=W3tOrgNPlB9/jjfvVnNYEsMsk9PpL191HfGYLXxjnaiZfuGq7aJ+VEEzfpyF+5aDFNekcQAwxEaVH8hNneNFXcrm9UrtU0tyvtMyX558iuVB6YHR9SpzT2pWDDOGnbWxjiOXnkkYf1XkVJurUqESApdW9VfaXLnHsdloicf0erS0QUtD0c+QUDAPQF/nMVRxh/lgE87FJrMMomWTwX596Acw0o60/u5Dco5X3RHv2adGZP9iyUgJtNYofmvadYM4PNbfloQ8HHGc2lWTAixFFCkiGO21SU1FA5swrAWJlsxnz3XoDo61yG1ZpM/aRwWfHx9NlD6+Uymt34iSY8npxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Tue, 11 Jul
 2023 09:08:14 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:08:14 +0000
Message-ID: <dde4749e-1ba5-21b1-fbeb-12086bfb7c30@intel.com>
Date: Tue, 11 Jul 2023 14:38:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] drm/i915: Record which client owns a VM
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
 <20230707130220.3966836-3-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230707130220.3966836-3-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::23) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM4PR11MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: bba03022-7dcf-4b87-163c-08db81ee5bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2wxFVXRLrVwzZsCS9agQ87eTFJskzkQPT0JgykwRJKfLb96hafnsGCwug0L0Y4lqerIXywm1iNaPtYLbaNEb669REu/Wgn6JfECyxHEWuGI13XSLthq8luaig9nsVywrKX5Kft3UraN2wnY8tWTbpFWa1aRYn3r9r4fvYD8tz1tPrIDppwWfYrhbeNzU5Mgd57PGadtIenVSbjFOQGW2RijtJHAv37etlhV57V2Rysvd+LZZ0iufkXTLV9mkG7QSvgHFF24RqzDQ/1pHCGw9Jfxf8ugzATQMsC51iSi2q2LzD0naNgNotQyzuBg1bOcsTJwQPtlBlplI4qJ0KhIa3PhBHvFY7R5DqqD3znYlYalEJHcN0kucxEEDgvmRa+4d9se2bXAmUIGlJB03qwzfVceJgZjZLg+GbPSH1E4Os0C+YYCXpQBRgK02yL9TOcxTYBSRQx4Cdd48GyTwjE5273bBAZ08k2oWvhZOARlgvRb4HhvrNUzCi93osS+9czElztUeSGLVn83xv0oprmvsxb8IGi4Hk9i+RPH7ICAtCXQTpgqhvq4e4Ldpig4An2ZPeaOVM9SkrBod0WPIrntYAAA4NvDS+ROjm8+B3fJHIBECmuBM8KFalFG9QQtGzzDaBPthDnREU1yiJMOlY27uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(31686004)(83380400001)(41300700001)(2616005)(2906002)(186003)(36756003)(5660300002)(38100700002)(82960400001)(26005)(4326008)(8936002)(53546011)(6506007)(8676002)(66476007)(66556008)(316002)(86362001)(66946007)(31696002)(478600001)(6512007)(6666004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUZSWFZOOUM1eTF2R0dLMXZtclc1V0p0QzEwejFRRXROT2RmZVFEUkFLbWpO?=
 =?utf-8?B?Z2hnNjg3b1ZUa2tzTnV6cGxBR05kYS9kdG9LNjM4ejlkZEJqUU0zMDZYRml0?=
 =?utf-8?B?SXBPeEMwUWJHbUR5MGJLaWpmY2xvRnZoRmhyMzlxSGpIQ3kxSVhVSkJXYkti?=
 =?utf-8?B?UEgxTzNXdWtwdDViTlJiVFN0WnN0MEZRejh3V0J0WjdqTWE0RHd3bHZKQmJU?=
 =?utf-8?B?L2trbHh1VGlZMi9UVW90QVprTWR3R2UyYXYyNmZrajlMeStBdWdGTVkyZity?=
 =?utf-8?B?dWtiTEgrZGJEQzdsU0ZZYktTcGtSeUltdGplSXF2QmQ5ZkRZM25LT2xRaHls?=
 =?utf-8?B?WWl2UnFucks5amhFN1pFSHpGVC8xOUZHK3BYWjlySktBT3NPVTcxckNvaUxG?=
 =?utf-8?B?M0NFV1cvQnlVUmxGK1MxaUxDWlAvbTBGWnVGN05weGk5bG12NXR4d25Pc3h1?=
 =?utf-8?B?MEp2cThJRWVxQUZFdEpwT01YR09wc1hGRXhHMTdocVQxdW0xVjZRN3FHTWJn?=
 =?utf-8?B?bmk2RFEwUjBYSFk3WjA4eVFTYjZvSmhRVmJvYjlJSTg1SzBNNW90dVRKeU52?=
 =?utf-8?B?eDVRSHN0cnUrQ3ZGKzVGd0dKbXhIc01EWHVwdUpwbFpYTU0xS0ZGZmRLb1Bm?=
 =?utf-8?B?ejJIMGdiL29NWUk0YTdlbGNWd1h4T1VHb1llazFEaStzYkVSMFRMeSsvWXN5?=
 =?utf-8?B?N1hsMTlaS3ExdWtMK0thTFY0dHpyQ2tCSEdyNElqa2tSVWdKQjhLK2Y1cEp5?=
 =?utf-8?B?aXFIeVZYR0JaNmFwZ3dKWTUxR3gzaTd6ZmNGWGFzMW5PdUN4bjB0aHY3VGhj?=
 =?utf-8?B?SDZFS0RWZnVWcDdBMWt1YWsyZTRVZ1YyV3JMZnFJTVZRazBScTd4ZThYYTlG?=
 =?utf-8?B?SjNZbzlHV1MvWEdzY0s5RU9GNWlsbjJsOUllS2FvajVxbDNRaUdjY3htNHdR?=
 =?utf-8?B?Y0hVd0FYQzk3M2FPcTBEMWczWHp0b2xqUXMzUmxpQmowajlHR3hWSzJmTjdO?=
 =?utf-8?B?eFFyV0Q1RVpBSDBKUk1CcUo3bmtra0Q5U1BlN0h2ZFJRUDR4WE5XVzBGWGFS?=
 =?utf-8?B?OXRFVlJHLzJiWXp3bXhMZTg1VXE4ZXQ1UVh0aUxHTm5WV2h3QUw0cDNTQ0JH?=
 =?utf-8?B?YVJiN3pnVC9ISlErNWhBdGRJUTN2ZytETS81elFLRWJPVWNUdzZSa0VCby9I?=
 =?utf-8?B?cWZYcE1FR0dwdW04RDYrYS9YMWxneGV3eW05VmlRd3lQQWpkTFlIdUszaDZN?=
 =?utf-8?B?SGR0OTgwTkY2OFg3bVJSQ1BadHA3Nkx1d1BBN2RhK2VKdVBRYzFocUYrd0Fj?=
 =?utf-8?B?alVLVHQza21aeTFRWXNOMDBtRVFzR1d4WnpJQ0NuT0krK2JrY1FmcmZEMnMw?=
 =?utf-8?B?NllqUHNva0N2bGVOdTlzdXlqendreWVtSVZuNXJMb2t4SWhZdGp6RkIxRkM1?=
 =?utf-8?B?S1FpNGdzYnYybUlZRGc5NFI1cjFJVkwrV2xZQ25jNFdUNDlpdjEwOVVYZ2hJ?=
 =?utf-8?B?UFh3MmFqQitweTd4THF3OERFVVRpdEFFRnkyeHFCVTNXK0EvcVU2K2JpTGpl?=
 =?utf-8?B?Z3h6NlNYam5kWmN4aGFzOWt0S3VrYjBmMHdvMEFoVDVDaE9ZWUl1TkdtK2ps?=
 =?utf-8?B?bHc0UjlyQzZUS2JabFFObEljWkJFczl4VlFjREtyejhSOXJTVVlKUnJoUnlD?=
 =?utf-8?B?TkZLVExhaGl4Y09mb3p1cGhwNEFNYUlCb045ckVwREhsbUtOQngrUkE3dHVC?=
 =?utf-8?B?bmNjck9pS2dnaURHcUtFaDJwTlZ1Q1Uxclo1bE5oUkRNamJGUE93NjE0WEhU?=
 =?utf-8?B?Y1N1YkVXMlRzeVMwd1ByRjlFNkNzZEY5NFF0SzRlYlIyaER1TDc3cVd1cVdC?=
 =?utf-8?B?bTcwOUJNcjQwWE1FbmZUWmdsMkc4Q1A5Y2Z1dldtTG1PdE1pOEdTaFdCUE1I?=
 =?utf-8?B?QTJQL1RISnhabENNSjZSdmh1NEk1c3djdDZOTFk5bWVtQVl6MFhJdld0NE4r?=
 =?utf-8?B?d0dOVkppajlPWk9SOXJqZVo5RFpnVmIzZUx2a1VMbWtGQTRqVjU5VkhVbC9y?=
 =?utf-8?B?YzNHcmhsUXVJV3lENXl3RWYvNFUxejRlK0VYSlpkTFhyTEZVOGJTZnhxRjhH?=
 =?utf-8?B?TldnNVdvTFVHR1RoVUt0MHdFbHljMXl3Vnc4b1NwL0U1UW11SjJIM0p4Rngz?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bba03022-7dcf-4b87-163c-08db81ee5bac
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:08:14.7579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbXCEUkyiPQvGqFBWUGzYVmZy/twY/a2QTs5V9P7SIzsx9PnSF97yWuTJRC64jaF/kevs7KLHGuZleZ5Isdgdm3EWs4dkoAKgH11kGzUjlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5359
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07-07-2023 18:32, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> To enable accounting of indirect client memory usage (such as page tables)
> in the following patch, lets start recording the creator of each PPGTT.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c       | 11 ++++++++---
>  drivers/gpu/drm/i915/gem/i915_gem_context_types.h |  3 +++
>  drivers/gpu/drm/i915/gem/selftests/mock_context.c |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_gtt.h               |  1 +
>  4 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 9a9ff84c90d7..35cf6608180e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -279,7 +279,8 @@ static int proto_context_set_protected(struct drm_i915_private *i915,
>  }
>  
>  static struct i915_gem_proto_context *
> -proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> +proto_context_create(struct drm_i915_file_private *fpriv,
> +		     struct drm_i915_private *i915, unsigned int flags)
>  {
>  	struct i915_gem_proto_context *pc, *err;
>  
> @@ -287,6 +288,7 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
>  	if (!pc)
>  		return ERR_PTR(-ENOMEM);
>  
> +	pc->fpriv = fpriv;
>  	pc->num_user_engines = -1;
>  	pc->user_engines = NULL;
>  	pc->user_flags = BIT(UCONTEXT_BANNABLE) |
> @@ -1621,6 +1623,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
>  			err = PTR_ERR(ppgtt);
>  			goto err_ctx;
>  		}
> +		ppgtt->vm.fpriv = pc->fpriv;
>  		vm = &ppgtt->vm;
>  	}
>  	if (vm)
> @@ -1740,7 +1743,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>  	/* 0 reserved for invalid/unassigned ppgtt */
>  	xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
>  
> -	pc = proto_context_create(i915, 0);
> +	pc = proto_context_create(file_priv, i915, 0);
>  	if (IS_ERR(pc)) {
>  		err = PTR_ERR(pc);
>  		goto err;
> @@ -1822,6 +1825,7 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>  
>  	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
>  	args->vm_id = id;
> +	ppgtt->vm.fpriv = file_priv;
>  	return 0;
>  
>  err_put:
> @@ -2284,7 +2288,8 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>  		return -EIO;
>  	}
>  
> -	ext_data.pc = proto_context_create(i915, args->flags);
> +	ext_data.pc = proto_context_create(file->driver_priv, i915,
> +					   args->flags);
>  	if (IS_ERR(ext_data.pc))
>  		return PTR_ERR(ext_data.pc);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index cb78214a7dcd..c573c067779f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -188,6 +188,9 @@ struct i915_gem_proto_engine {
>   * CONTEXT_CREATE_SET_PARAM during GEM_CONTEXT_CREATE.
>   */
>  struct i915_gem_proto_context {
> +	/** @fpriv: Client which creates the context */
> +	struct drm_i915_file_private *fpriv;
> +
>  	/** @vm: See &i915_gem_context.vm */
>  	struct i915_address_space *vm;
>  
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index 8ac6726ec16b..125584ada282 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -83,7 +83,7 @@ live_context(struct drm_i915_private *i915, struct file *file)
>  	int err;
>  	u32 id;
>  
> -	pc = proto_context_create(i915, 0);
> +	pc = proto_context_create(fpriv, i915, 0);
>  	if (IS_ERR(pc))
>  		return ERR_CAST(pc);
>  
> @@ -152,7 +152,7 @@ kernel_context(struct drm_i915_private *i915,
>  	struct i915_gem_context *ctx;
>  	struct i915_gem_proto_context *pc;
>  
> -	pc = proto_context_create(i915, 0);
> +	pc = proto_context_create(NULL, i915, 0);
>  	if (IS_ERR(pc))
>  		return ERR_CAST(pc);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 4d6296cdbcfd..7192a534a654 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -248,6 +248,7 @@ struct i915_address_space {
>  	struct drm_mm mm;
>  	struct intel_gt *gt;
>  	struct drm_i915_private *i915;
> +	struct drm_i915_file_private *fpriv;
>  	struct device *dma;
>  	u64 total;		/* size addr space maps (ex. 2GB for ggtt) */
>  	u64 reserved;		/* size addr space reserved */

Looks good to me.
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
