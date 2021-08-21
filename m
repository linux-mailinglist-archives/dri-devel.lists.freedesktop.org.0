Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE11F3F3782
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 02:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165D36EB42;
	Sat, 21 Aug 2021 00:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FBC6EB3D;
 Sat, 21 Aug 2021 00:14:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="238991086"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="238991086"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 17:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="425187085"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 20 Aug 2021 17:14:27 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 20 Aug 2021 17:14:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 20 Aug 2021 17:14:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 20 Aug 2021 17:14:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbPti9tser7SkdDDY5e9jRDaKP0AJKPVyLOthv/B1KcyQRAfTmB5tnIlsSDH4+H/zLrPNBNZWQef76b2dpIOlx3r7GkvgWKUUgVv2KrakF/1UpWViEk+kD5qA0aLnwP3hg53PkdCNb/WLW+WnglrBAXZT5P3nWBoQmTmgq0MEAtsKrUwgkfxCRkmI271Y9ZoeM1VjYGDF2LUP5uMkZWmBmakDROJNk/GNHNWfOp0CFoZYG9vQ7aUvGk3IksxqtLZ9Jnd74HHYGL2e6haNeA+MvxcoEqZkBep7iKQMhmaBQYVMF22GXFu2fcoOq2IBqDprcRfBKe1fCVWdO9A6fmnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98i73BuVLix03b9fL54cF+q4lbmXqH02dCy2oTtUxpU=;
 b=a6xKq/ct9bc7Kh0UmCYreQW/NRj7lGR7sKkaYJvkMDV2dIaEJy8ix8VqqNfro+nP9BmdoV+ZMQ4nf4jkldyhTJOqnxFGayUBYXIGfvxicTkeQtnKOZE1Dysna6neUDSj8n7q/2sqUEF9aMtXIYu1PnJ+udgSz63c4IYf9rzzgN+OgZPVkrevi+42nR8DJoFvpL0JGhI0uU7vCT1Xxa4YQO1FB9XuHLsENoQEPZtw+quwTLXwabPONvPeMEueShJk2Kvdw0kp2dvLGXYe2DLs6prBrYGSujdrXgZl+hxPOE1c7H+WE8BfBkquJRJ1vIxngXssoSf46/1JOIhzdaUINQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98i73BuVLix03b9fL54cF+q4lbmXqH02dCy2oTtUxpU=;
 b=c9eKPqkDdyq16KgjljYn5JdUElbXOqF4Cd42M/zbrzG6R+Qa3Au8/eDO3Srv90S0xx0XAt25d53OcOPry3He5is5wml9o2P1E5b41Jfo0v0+0ZUN+BTfLbEgdLGten2sUwcG3enscAeAotByZu+5YDu77P1ZOOUCdNZe6dJjfVQ=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB0075.namprd11.prod.outlook.com (2603:10b6:4:6c::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.22; Sat, 21 Aug 2021 00:14:25 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%9]) with mapi id 15.20.4436.021; Sat, 21 Aug 2021
 00:14:24 +0000
Subject: Re: [PATCH 15/27] drm/i915/guc: Reset LRC descriptor if register
 returns -ENODEV
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-16-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <c7ffd3dc-17f3-9c6b-1086-70711ce6e4dc@intel.com>
Date: Fri, 20 Aug 2021 17:14:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-16-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BY5PR17CA0062.namprd17.prod.outlook.com
 (2603:10b6:a03:167::39) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BY5PR17CA0062.namprd17.prod.outlook.com (2603:10b6:a03:167::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Sat, 21 Aug 2021 00:14:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbbf1d59-3b64-4344-1232-08d96438a1f0
X-MS-TrafficTypeDiagnostic: DM5PR11MB0075:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB00758870B19A125BA1BA86F1F4C29@DM5PR11MB0075.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lhy5VA9cWY4SAi083S/t/ix3y2/K0BV1q1NxaOuSoI01dQ5FcvUKeHw6A7JFvNUiviBe1mH8BPFiGVVzFPWoKvbEWGBobCZvm3645wgEHXRXo2xClgh7BHbK5lleOklvrQKVt6lEF2Xv37z2AdiWUgyx9Y6H3aidW/EI1fgF91ys4QQlS+6WvogtpLkUMMl4/4kDxs+Q3+ofHoWEomUzc1RXPr4age9NPyVplqzoQt6d9fxwdh7dGodZoL+8t5zfY6d/EaIrb1Nz8Tzu0blkPK0ZLU0SnIwDgVu6Q/7RoR6XPaf3PUo9bAyAODzEntcyMdHoWQPgYAEfotP0j+MJkwNsz53joOa+DfNgvDmZ5y3wv5g7VcOZGEdXuTKhLwKNF0F8oxbeo3IGD5yXPJTTD8BP+104kwkAnmiZSbwFEJPb2ssaKjfpix5fnsADwwjxLa8iPGuGRUG5ojUP9p3YCqNeApoMtjFOJ5CWc7wf3dSRc5ebepcRTs22q7Tfzu7YbMtbhtG0YSZRVwmRZR1IxgOhN8VbKg1/90HL8M+b6xEW/JOMTnmZ1Irv1VWFH2yKcLRlsvNBl1Safg3zRkq9I188BcXLbMUzPGRcTKtmiUUNo2NDtZmm+5s4C0iXFkTSsk21Ek4jSfO8fojzNPF2iU/LFbot1rWIkd1B2wUcCayT04MWZiwNl/C9kmZBQDuvOloy5k/Pjfa8+HWZS3GBZGVTClVmnJGT+PQ3A4nWKCOBiBDGMVVjOYSun8unTD7d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(186003)(16576012)(66946007)(316002)(8936002)(26005)(5660300002)(83380400001)(8676002)(4326008)(2906002)(31686004)(86362001)(36756003)(53546011)(2616005)(478600001)(956004)(31696002)(66556008)(6486002)(38100700002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cStzdWxqS1gvbHVWbEh6T1BCTUIwMEQvZE84OHhhZU9uYVpPdmE1bXJvRXgr?=
 =?utf-8?B?TCtoYnMzdENnTU55NjVwRXVtU01ENC95UE9iVGFScGgxNmREcG9KTDhvNXh0?=
 =?utf-8?B?cStvWUFGbVBZTWdMV2tyamk1NnlzZkdJQTNrV3hLdjJQekNpSk5heDhkTVA0?=
 =?utf-8?B?cjdPb1ltYWZMb2FuSmt5R3FoQ2VHRWxHaEVDUXdXdjNLWkFsTFBVTG9jeUt5?=
 =?utf-8?B?TDQzcmMya1RCUktVUHdwOXRYRWNZT1h6bm1tYjJmbm5zNjFHNzJqRXhSdk9r?=
 =?utf-8?B?Y0t4RngzdFJwOGU3bHVYSEl0dTlMZUJMeitvKzNqdk40RHhKQ3JDQU44czl0?=
 =?utf-8?B?NkxIMnNRZFlMMWhXMlpJMDJrNkx1QjZVL2paSUZDaE5Oc29uQmNTZ25xME5L?=
 =?utf-8?B?QmxCcG5Pd0VvREg0dXVRNG5qOFJhdWsxeUEvTW1OTnl6VDRZbE9ZSktXSlJZ?=
 =?utf-8?B?UE5zQmpyQlQwNGo2c2szL2FjbngxWThQc2dvNkxOcERqdjB4VUxVSTdrakFN?=
 =?utf-8?B?eHRsVklFWVFKcWdyY281WmJ6eGErRlh4bkd0TFB2aWw0d2ZWZjIxVUloSTB3?=
 =?utf-8?B?aXBsYkt5bzV2REp5cUI4VkZ0alhQeEsvQzIrYnlQYmlLVVBKaENBNlBPblIr?=
 =?utf-8?B?Q3BCTkd2OTNkc3k0VlhVWk9tajR2Ync1ZVYrS2RleGFERkxvRUt5YUJPMVNI?=
 =?utf-8?B?aDVLeDJQL2krTVptTUFta2NydlpHTStoLzNMdFQ2a3ROazhCM29EQXZPZnBO?=
 =?utf-8?B?R3oxNXhjRzNxZGUwMnd1c3p6ZGpLa0Y3S01zTW9jRGU4dStBV0NsdnNNQW81?=
 =?utf-8?B?Ryt5cGt6Y3V0a2tIRytLWnRYWUpoZVM1UDUwUytsOXRMb09YdWwyL1dLMmtB?=
 =?utf-8?B?WXJSbnVYSjFIVGxsUzluNWIzN1BydU8ySWRObzRJZExOSXJkeGRNTW5aR08v?=
 =?utf-8?B?RGlRRk9YMW9hL3h3b2VTcU9KUElrb3N2T2JBMllQcVJoWkNIOXV2bXM0aWh0?=
 =?utf-8?B?WkR5UWFFeFJUM2tVUExIbXUxTjVKOVhxRktDZHp1aklvYm9HV21rRlkwOVVR?=
 =?utf-8?B?dXZzVFArYmdYYkJXa2hWQXFvU08zWHZlYklQTU1WTXFmMFd6S211T25tR3dG?=
 =?utf-8?B?RmNUdkNvaDV5VlhoQXk2UWd3cWhFSWlFanpxUFlIQ3d6QjBOcE0xbExJZ3py?=
 =?utf-8?B?a2hQOWFmTHNOZEErQ1BrT1pNTWxMVFZtcCtZNms1a3V2OWZIbW1Ga1NJQUlH?=
 =?utf-8?B?UXdaMXVVQmc1TDdYVGtBRzMwaWl5OTI2OGZLdzZEKzdDWkN3VGsyS2d3QlEw?=
 =?utf-8?B?UDBzYnVZNDBieEI3OG9jc1VsOENCOVVqVXVDUkJpMjhGUE94NEtqTTE0Nngx?=
 =?utf-8?B?NGk1UTJQeWFOTmV5YlFUdy9VbUtLR3hzWERQZGFpVTFhRUV3Um15bHNvbmw1?=
 =?utf-8?B?dGV0aFBNT2VHaUhrSGRnTUorUExZWTVYY0dZYVBCWEc5c3hmeWR4U0lBQTcw?=
 =?utf-8?B?ZWhhVVpMRDBCc0JjNm4wMjI3emRUaGU5Rk1LTkxZSE9yb0IwOURyVW9Pdzd6?=
 =?utf-8?B?bzU5cDJBNERNNzExYjArM2FQNFNSSUcvT3pnOUE2b2lzMC96NllKQWd5K0Zv?=
 =?utf-8?B?U3ViUk1LQnBoZm96N2IvSWRNaW1sMFhkcVBoRG1JSk9RMXpaVW1tdFU4YTVy?=
 =?utf-8?B?RXhtWXdrUG8wNDMzc0hjazRUenhWZjNzWDN5YjJ2cElVVWhKaEwvalVSMkZ0?=
 =?utf-8?Q?u8eaDFT2XOz1k8yAochVvkSaDxI9kgv3lVsSE2s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbf1d59-3b64-4344-1232-08d96438a1f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2021 00:14:24.9617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4L1e1HP3vAwtFnc+0hMS1ubNRq6BAmyrf80nDK61neSVQzDZHm/zY4T9nuikMv4XewPf40+lW66NKoj3M12ye3xjfIoc3hwMYuEkotkXPgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0075
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> Reset LRC descriptor if a context register returns -ENODEV as this means
> we are mid-reset.
>
> Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index fa87470ea576..4cf5a565f08e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1407,10 +1407,12 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	} else {
>   		with_intel_runtime_pm(runtime_pm, wakeref)
>   			ret = register_context(ce, loop);
> -		if (unlikely(ret == -EBUSY))
> +		if (unlikely(ret == -EBUSY)) {
> +			reset_lrc_desc(guc, desc_idx);
> +		} else if (unlikely(ret == -ENODEV)) {
>   			reset_lrc_desc(guc, desc_idx);
> -		else if (unlikely(ret == -ENODEV))
>   			ret = 0;	/* Will get registered later */
> +		}
>   	}
>   
>   	return ret;

