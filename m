Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C554C06F5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA3710E21B;
	Wed, 23 Feb 2022 01:39:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B4510E421;
 Wed, 23 Feb 2022 01:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645580376; x=1677116376;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=waNM+ZJiXM1r2Zchibyyiq6ZK5g8bBa/E0WprfNIloQ=;
 b=QB0Z1rLizNPZJeg7d8T+mS7MG2Hy8JK3XWx2dD5tp+rtiqGDJ7av3ShB
 d8wg9c45iSgGLPlEQIOYgU55ONZSBNIr5lUaaWkY2AoX4KUC8P31nZr0t
 K4pxnmWZoEtbCnvon5YhCEOdTNSmIGU6zSPzKFsY2iMx4wWN23+UONb5X
 5oayHqZj9AbyOF0xAb/34DIfChN4ctO0hpoWLPd4/jofBVYsNDv7oiic7
 KKJua9jfTiqelFHnG/VA+ueYQVKQyaAjY/A80uayv1iXGmgCooJ3yXsTu
 kWfc/DbA4Pk7LL2Nv9h4Ln+/blCLJqBdrWaRgyHxyGzA2RYxgtt69ezWW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251779240"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="251779240"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 17:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="606893557"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2022 17:39:32 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 17:39:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 17:39:32 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 17:39:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdCEumzwbf/fn2JKoy2hHC5lK6IvHDYSUFDOgbAs0xsC/geAlI6tjqrlHrIZN5PbsR+vhLecdRLDqPlEdWZ8HPJTqePnPjJR98vFshIoVa3CrDXVcZqbKR5TRqwOIv222SEvG6IJ/V/xV2gQ2QP/hxvD+35+kRnQSQ8yJpHmvKaQ0Bvce87qT5FgwBe7v8VmbK+8z93rppnBtDl8PYC5+wG1kN6j0CYlbsf8vVBzeZiHbLPiNehm/imrEqB4IgzcRou2zvPfO+S6F4FtpgC5SmwnOiGA5QnLPjsk5GYezi6ntB1J7Jl85fpJdU7YrvamvPUU6UldHXjgSuUHaYTPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKkRYuScLBoIqAPD+MbeyibDiGQoLHHCTQpKA0/kHJM=;
 b=mPPiGyZv8flcC1T412hRQidS+Yqj+1ORSYrpF+WTXy7TdoISE3sDeTCVfqUGtQeRE3jHibgVWEd4XdU6guz5bQJG629ag2S5SNJ6ycRkgzfyy//74G9qbt4MxAvEmh4pv8ah0msA6JHUtK9ZpZzYR8eE4ZcD+2j73deDCNbDk4o5dElRaw5f5+c1+CPIv3n2csuASpFW7NsMOCThAMbovL5/YOL2SQhlXMXmAQ0Qi6aBW/Q/Jay7c0nrHVatXXTkRAz6zQNG2y077EuhwP6SeVZYdMEL/cbKG2HLeWO8jbLuXoyt13A4+kefEUDo7e22ZPHud1h0Z263RlhXMcXFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.26; Wed, 23 Feb 2022 01:39:30 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 01:39:30 +0000
Message-ID: <f99a6caf-7aeb-9ff4-4872-cc986e11cf66@intel.com>
Date: Tue, 22 Feb 2022 17:39:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/guc: Do not complain about stale
 reset notifications
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220212010425.3643192-1-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220212010425.3643192-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f2836d6-de74-4927-96e9-08d9f66d55d7
X-MS-TrafficTypeDiagnostic: PH0PR11MB5047:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB50472D4CDC4ED77C8FC5F2ECF43C9@PH0PR11MB5047.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fS5NaNRqiBt6YF0F/xMhJNX8yyPDi5kcJN+/SgZJwVbU5/yeWEZFEvoPB10EdBGnmVrjCAPaG4yWiEiT4g2HGYCPCWVequmAqa+z4x1KBSD5NtIgMGBM6LJNcpIZyIv9EwrART5MyUZobJh2tzVEYWc4hVIJ/b2ecXYpojcPJiiL9CiSCdNeSdx/GH0zF/KzjQPl/B1Xf4txYRi2do1S/1v73oEaIrkWdFYUd7CAZZEe547rHtyDgr3QVlwOUYVUwNfDeW7ilMBczRRvHti8qqWa7EG7TxkBJHsTB6Duq353fEdmd33mtcJG+iOn7LtG7tMIoYcNezRsQGz5Rka/luPjz2sUtkAh5E746UuhfJBEe0pbxRu7fQi6xeRyTTN9PskwOJk5k3lRjbuKyXpXTTIYmTdyuk3BtZFxWuOmLXvnEDdyBdibFEa+AfA13vdoJgYbHotmOtUgU2dDklzjAhVXu6+3BvkugDmYwUPvYyA776CJhnrN5F/+FoDn5fdvKgRrHesYTJyXkr9XcBGQF94/1mKm3M6IAH776RUllg63715lcrh0Y+u41kkTQ7BHiFA4X93n+KN/clwVkSJt8EG3gkeghjrquge37xkmOPIsDCukcB9KzXg+MCNx3dkpaQMGFSuGrtlh0W692sPhey+zwW+AoJSV/zGK/vGoFA/IYmUu4X+4tkxe626yoaV8Nycw5tFzRN3/wiojz+OoLLDQwedJsw6L0qb+jGqIpvWblUK4L0Ixdh+lbWhbesJ+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(6512007)(6506007)(508600001)(450100002)(83380400001)(82960400001)(53546011)(31686004)(36756003)(66476007)(8676002)(186003)(31696002)(2616005)(6486002)(26005)(8936002)(2906002)(66946007)(316002)(15650500001)(86362001)(4326008)(5660300002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkVLcGxYMnVwc2sxblN6TWc5ejhnQlZ5aVJDdHd0RVZZUUZoZWE5c2VIeHZt?=
 =?utf-8?B?OE9aZU9kUnA5djl3VHZ3K0djWlhMQkQzbUtId0Y2ZUNJeTRqYUs0Q0NXN2F2?=
 =?utf-8?B?RlRVSmdVZ245N0NwUG4yYkkvcmE4dExPbS9JNDhNaWpRdlUyQ3BhRU9VM09m?=
 =?utf-8?B?VmZRSjc3RWhaQzBRTXdCV1VuNEs2ZUZJNWpRdGNLWjRIR0FIa1EweFk4Ylds?=
 =?utf-8?B?U2Qzb0xCUmNjV2dqWEFVNTVNYk1RaTJiVzhqck5ISGJyTjVBSVhIWVA2RjZH?=
 =?utf-8?B?T0hBQW4xSlZFeko0c0E5VEhEK0pGNHNWMDVmU004cERSRXF6SG5qNDVFUGEw?=
 =?utf-8?B?Z2Z0cnlFUE5qeGdrcmxIM0J3T0EyUkdzU2FKSmZTVVNlZUVYZW5CdnVTNHpG?=
 =?utf-8?B?cTIydlhlMFlJWTZERnUzU25CM1pPV3pBVEFoVnhkTG9DZlk0ZmtCcHMzWVZl?=
 =?utf-8?B?VGs0WEtHMzdVdSt2Y3d6SHUxMFAzS0lpOFl6OTB4Vk9IMUV3WDhQWG5hQU41?=
 =?utf-8?B?THpOa09vWFh5ZUkzNmt2TGs1a0tOLzF5WGFWTXI5TmlIeE1kR3RnR29nay83?=
 =?utf-8?B?VnAzVjVkT3dnVUZYUGFWNzdOSXlNcTh3MGRxckhBMXVwYnBkM1A5THdFaGRu?=
 =?utf-8?B?aDU2RWRhL3FESkpCQk50elRVNm9WOWtGYXpsZVgrOGM5bWR1TXQ2TGR5NnJ3?=
 =?utf-8?B?dGpLSXlCV1d1ZXNvc3IyY3B2RHQ5TitiL3hEbzZBOTQzMjFCTTZ6VzV0VmtF?=
 =?utf-8?B?ejFnUjZLbjl0cjJjckI4SmkxUmFCbnc2cnFpVnVMSUpiOXNsd3Nsd2FTc2pM?=
 =?utf-8?B?MGJKakZNUmJkemRzb2pybTc3ejB6Wm9QMjNucDdPQzJuZWV0ek5CODJOcjUw?=
 =?utf-8?B?bm5IQW1kdkp3SEg5T1FDbk9NVkJvMVVMWkJDUklVR25tOS9pTVRwR2JSSVdj?=
 =?utf-8?B?VWtIYktCSlVMbVU2eUllM05ndXJoeTVFSmhySkxyTDhSWkFKQ1NKTTlaY2x5?=
 =?utf-8?B?WG9qbnFhWnhaREpmTW9XYzZBQjFRdUdkZFRvNEJQaHpGZWpGQWpYbldXZVRl?=
 =?utf-8?B?V1VwdEI1MWc2bk9lQ2c2TS9EcU9NK1Z6cm45bUVFMm9Oa0I2OFpsaXFyNnpH?=
 =?utf-8?B?bVNEVUVHK0NNTDdTRFJJVXNyZlJKb3JBZEw2WCt0MDNEVHFtZ1NMZXBYdUp2?=
 =?utf-8?B?cUpWekErM0FtYVpIRkpxU0thYndNTmNXNk00bGN6UU0zRUxHYVF5c3VrNkdB?=
 =?utf-8?B?K1NJRll5N05TUWNNQml3Z1BXblV5eHlxNEN1clhRWisvQ1ZRZWRBZ0VMTGhy?=
 =?utf-8?B?bUthQjNIRDFqQm9KbDNnN1hUdC8vVXZqa2dwdlB1UUk2NzFMZEhpZ0p1VWts?=
 =?utf-8?B?NWdnYXRMVDlRTXgzQjhmQnJ2Z3k0a2IrOXNQbllaQUs1R3pVNmVFb2VFTzEz?=
 =?utf-8?B?MEt5WHQ4Y1IzNlVSTjBKVWdXODJEb29WOTRpNStqcHBWYVZ4UnBLZk9adjNM?=
 =?utf-8?B?bStKbkZ6S2tGNU92N1Q4akdXQU5SdGlzOTVEdXJBUWJJLzJZRUwza0VKMGJO?=
 =?utf-8?B?WkFFRG8rcEg1UEtZcitxT0dlWmE2YlhUL04xTTdwaFB1MForZE1lWjRrQ0w0?=
 =?utf-8?B?VTlyV2tQSkQ3UUlKRnplN0NTTExmekdPMjU4MkdEUEl5aGFJT2tBeWZWRExY?=
 =?utf-8?B?TFVRM0RpS0wvL1FvdEpOemhNVlZ3NFg3UENYZk5tMzF0OXBQZXptWWNtUklF?=
 =?utf-8?B?ZlB0Yk0waXlsNHppY3poUUVWKzQ4WTY2d2YwRWdqL2U4T25jeVBjNktCYllk?=
 =?utf-8?B?SjZxTjE3aEJENmFueFR0OU0xN1ZGM1hRNFRLYU5xM1pwaFpGNFREbUkxSlhJ?=
 =?utf-8?B?Vi92blhxWkloRzZCQkMzaXptRWxROEJFM0t1YmIyYUxYdzNlRWhwMnJ0cTFX?=
 =?utf-8?B?NGs5SWsxdndqTUtxYUVtdEtDeFV5RUdnY3p4MlRrdnRmaFZSRHczVVg5bFBB?=
 =?utf-8?B?YXptS1I3Q0VEK1J3d1ptUFJ6cjErT3RwTEM3QmdHQzI4MnpTT1c0ZGk4UHJZ?=
 =?utf-8?B?ZFh4dkpmOVdGcnNocGIvVkN0VlY3T01TSmtDYkIwdmZnaFp4cU5oSWJ2T045?=
 =?utf-8?B?UGtiZjNRTUV4b3FMTVBuWXJlOHgwTVlzdWFTYVdUVWVPbUJEUW0zc2xJSnUw?=
 =?utf-8?B?bzduK2x3Qk5sMExkUXUvUEEwbE9YMldXZVdhdTZ2SjNMelZjMVpKeGRkVGls?=
 =?utf-8?Q?JP0wbFxP5tG9YN9WRbfrFDZKzacM2nG2JWUFcOy0fQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2836d6-de74-4927-96e9-08d9f66d55d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:39:30.3895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbfJKCcX1VcRSM9T1W1c3brxS4eIi28BaEBqBM81Fc0Sh5ihdlyvVqgVwV75HTvvOjDdCWvcHeO2zDpE6+gIP9nml1xVxs5YhrSzYxr4+GQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/11/2022 5:04 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> It is possible for reset notifications to arrive for a context that is
> in the process of being banned. So don't flag these as an error, just
> report it as informational (because it is still useful to know that
> resets are happening even if they are being ignored).
>
> v2: Better wording for the message (review feedback from Tvrtko).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..3afff24b8f24 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4022,10 +4022,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   		capture_error_state(guc, ce);
>   		guc_context_replay(ce);
>   	} else {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
> -			ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
> -			context_blocked(ce));
> +		drm_info(&guc_to_gt(guc)->i915->drm,
> +			 "Ignoring context reset notification for 0x%04X on %s: banned = %d, blocked = %d",

The if statement above checks for !banned, so if we're here we're banned 
for sure, no need to print it as if it was conditional. I'd reword it as 
something like: "Ignoring reset notification for banned context 0x%04X 
...". With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +			 ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
> +			 context_blocked(ce));
>   	}
>   }
>   

