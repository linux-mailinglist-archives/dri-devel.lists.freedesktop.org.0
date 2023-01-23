Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE88678B04
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648B710E5B5;
	Mon, 23 Jan 2023 22:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07CE10E5B5;
 Mon, 23 Jan 2023 22:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674514130; x=1706050130;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xk9T8UidUeNcJ/Y5NFmaMNnj0ovMnV3/ZMwjfzbdOA8=;
 b=IRt+0flhO7rGETXSq5CoJ5QWv/Jmb49UJyPZJ9xTq2GCpJYaHTxVysi6
 +c4XUis4BUbIvFe2ZRqfq3kII1ElphVGqMC6JwCf8skEQri1RaaVHveVO
 K34CpVPbqL9h8461powkfC0/dTdr456ovxJ+QNC+aa6tGH99CwSGhJR1d
 NjpRv74xDGMOfPNrj+Yh26EXbP4xudVtjiaAxqySvQTStVUqcRayODVK6
 +z23/uTw10K21A3qBQ90/5JsmwjLBbW32s4TsRexWJLB45jYTs8GlaAyz
 87Ew/ll1htpeaKmO8uUzqjeaZo8GDasvOznHF9UbMhU8PoXJZIqvqqtlM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388523377"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="388523377"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 14:48:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804365921"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="804365921"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 14:48:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 14:48:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 14:48:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 14:48:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 14:48:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdgNpEn49UyvVHVV9/6P4r1XaBNiCCWET40jVUjsPQxymhKUZyR+cWd685MLNt2okx/zCmGRDZQcQ5ksUeq1ANauHGggDUrPzsMydP9nLeYw0duw7xo/KowChR9Jk1EhTShYwXKDuWkYYx22L16V3FyiDavnk7ZnCv4KU0g05C6l1AblHgYiPrCqQ1NaB24htU/GU+EEx/hWy9fH6lxuuv2KS3CV0tqinACqK7AWUfieiAseOzHM9ZbfaWp8G6mHpYzKuKOhczgMPBUsooJhJlwAxTrElVdmd9Z2Ewd+EaL/RBBPsAZ3ejKOy1YPvYgNaBd4T+CsUottAlgc+K4rLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpeidpq3K9mgJVut+tTHhjC3obju/EX4cvWYx1b9MVs=;
 b=Qt60TdblHpk72OVPiobBT3cdEZd7zf0jz5HMFxAUyBbJYz8HP8vzIdKQBHDm4nUX5Q/ag7Nc9apa41CRO6YB/2kM2u/mcVJf05S7V5KlxBKs2fdpf3YcNp0mG52RsqCMNElbWI1drqiG1eV0MXKSRqmvLqeZ8pzegQSjUSz8xLoo50IPe8q4xgCnlLv/Lk2yU/JNBwbX0YemDXAt5k+J+Fdd8GdIDUU3Pvv2BvX2+NsGajTXXsxdWe+q5BungKssChwPzhJNtGlHP7sUvtxzj3yIaViMQJZqJG2k6D0/LCoJZvggE2eAKwJjyu/HaZTwWGmJFyRhb6o/nlaEdbEhYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 22:48:34 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 22:48:34 +0000
Message-ID: <5cd6d863-5731-a82b-c218-de1de3072de8@intel.com>
Date: Mon, 23 Jan 2023 14:48:32 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 2/8] drm/i915/guc: Update GuC messages in intel_guc.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-3-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230120164050.1765-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b97e93c-6300-4c71-2f66-08dafd93f50e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FQvUqdfZ3zzhqo7UahqoG/w/C99hGI8Sb7cDs2/gj62Ya0BM4a/gd3YPs2CquIYNkT52CnGbfvz4wyFuMg8csknrafdRDEZMbOWLu1zkc+ibUYOKuUAaubB8vpH/GIrRinc6/KC37SgQnaF8rlD9oLEDPiKWdr3W2V7BC3amRzAoM0lAmvzewr4QKvaQhouFE9PAA8FyvtFwHgAY7/sHYC8mt/1kwhJOhHBs3RN8ZXQfYUa51FK0icpNnx6iHfbshn/eSE++Oug+pcyEBFq3Xatj6hExNE4B5sOnYQ5cJWg7DLUv+FGB2zGI2br4BYeukEIe4YgUo3+tkL5+66F5Wz62TdkHQyt5/qNShl0tRvh9+FBU2UNKPEMtbZ5SJy/0gL+IczYC2cODoLjgt1Girp3CT+xkmLY09zuDpSE3INnrpHVZqiC1QujmKjMBLr8dGIzo2jp2kTCW5xkzn0CaVDI52ZnfS9AyZAY3tgVp0/CJO33VmBxmLfiC+w1l/EsLMb1BT1EadPDR97B0+j3DAa42t79DWWDWGdK4Bjn0ZZLRCyTRr3KlN7TL3XFHS9fa0vEs2n36oxaLP+H6IlacqQr+0lH/TgY1MjHPbbev3Nz5H5RLSV7RIm4mwwaqUGO6mWLPp7iaBdcCtG5jENxp13brPGEW3bN8ksMPe7hdD9xXQ3ik2RTnwclJ9/GwEBANN2bNpcK/oW3OIOv77f6hNJCVhEUHcw0ag9UpfHivbKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(83380400001)(31696002)(38100700002)(82960400001)(5660300002)(2906002)(8936002)(41300700001)(86362001)(15650500001)(66476007)(8676002)(53546011)(6506007)(26005)(6512007)(316002)(66946007)(2616005)(66556008)(450100002)(6486002)(186003)(31686004)(478600001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGNhb1N3dWovTmQxenFwb0l4MGpuaUVXVU4yV3V2aDlVTEZQVDZBWm1hOSsw?=
 =?utf-8?B?YXpaekVtRlNPVXNYck84TzBpbVJ4eFB0S0NNMFZEeTlSalJMV0xnWkR2bFF1?=
 =?utf-8?B?dXRkTncxVnpKZXF6c1o0M1VTYUY5YUtFQmRWd0tvRVR5bEJOWVFUS1psejZ5?=
 =?utf-8?B?Y0NoM2dIMmFRNkdHbUJFcnFNM3ZlM0V6K3RENFpBTWlNTDhDN1ZxU2xXK3Jn?=
 =?utf-8?B?cUFPcmF4SC9iNlBzTlV3Nk1YSHhEZDNVM0JMeFBRRUxDOTlGWktLdkxDOWRT?=
 =?utf-8?B?WGZXS2NqRW90di9iZmcxSzRHZERXOFNSSDRLWlBsUWtxeElIQzdHT2F1bWR6?=
 =?utf-8?B?anFvQWZXd3NrbUdXTHdFb0lIZ1RGU2V4bW1TRDFtb0hwaWZxdVl4NGRlV1VI?=
 =?utf-8?B?VnVVTWZGNmlpRGhQVGt6aHQzcTd4MHZoeWNHeGlmODZkWm50cHkvUjBKN1I0?=
 =?utf-8?B?Y3VwOWZlZTBWZzQybHdHTXpzOTlQUHdzcVp5OENHTzFoUzdycjdYMVhoNC9p?=
 =?utf-8?B?MjJ2S3owV3VXRUM4TlI5SU15WXFoZE1tWlMzOTYxTEFMQ2xtY2pvSUlGd1d0?=
 =?utf-8?B?MG02YWI2R0tGLzJYMG9Pc0RQZjArQVAra1BoOW1tUjEwdVZZQkVuQnZPdlA5?=
 =?utf-8?B?SjI0clV3b1JmOG1pVVMzMHZreVFOeFd5Y1RXYjdDRUlEaFdBa3ZtNTZSNEVv?=
 =?utf-8?B?eWVDcmlBZXFvZlFkZmJINGUvMmdoTzZYNUZ3U2dzREpOMHFDZlRYYkJnOFVN?=
 =?utf-8?B?bjdNcDFxUmxaTTM4Q0k2N2VaVUFzdVJWSzQwc01nL2JjT250Szl1c2ZVc2ZI?=
 =?utf-8?B?R1BoTGFiajBHUGFvVGFmUjc2UEJQQmwzcHZDSlZBVnBYVVVNZmkvOUovYU10?=
 =?utf-8?B?azRqRk5vcjRiMUNpTFBsTE1SdFFSR0tkR2swei9DVVVMUHRKZ0p6UWtoa3Jm?=
 =?utf-8?B?c2VPTUZ2V3lKa0JjV21zeXl5czdEblBOYmltVXBzUWhIdjhwM3VRMUpjT1Mx?=
 =?utf-8?B?VjBaZFZIdVlTQ3pmWVQvTGg1cThOdGZBK1M2SC96NDZmbE5peENSK05Zc2Ft?=
 =?utf-8?B?bzdoUzBVNU1wUkMzZllvRnVJTm5CZGRKLzl1cG15VlBGT1RMM0NOVDJ0MjR4?=
 =?utf-8?B?ZzlKcGhYcURoR1ZuOW5KSnAvYnJuTVdRK05xV0lydGhaNGdrVC9oYkNLYUt5?=
 =?utf-8?B?SURVRlA0aW9zUWFkcG9ISS9sbnNyQ3pwcUFEYm0zODZoNGNDazRJUmdodUdK?=
 =?utf-8?B?UjFXanl2M1RRRUF0eXI5N3dTem5rMzVXSE5Ua1lINzBDcWI2ekRWdUo5b0s5?=
 =?utf-8?B?aVUvLzljU2V3a2FTZEZUaGswWis4S1pkK3FrZUFwQ3FlTVJVTVdIVENjMEh2?=
 =?utf-8?B?cHJhWlNRc2FDMXBQUm8yNDlZdjZDWXcwdW1jL0ZDbXVuSEtoWndPbVA1NHlY?=
 =?utf-8?B?T04yR2ZpMldwUzIraGczRzZzN29yMUd6OHkxcytsRlJUQTUyU2JUN0hyd0U0?=
 =?utf-8?B?TFFBbldMMzFGdXgzZlVsanNkbW05a3kzZEFtUU1IdUdtWkQyd3VKVWphWWVv?=
 =?utf-8?B?NlEzRlY2Q25BNUM1UHR3QlA3NHdoWTJaWmVPUHhUUzJZd1JMZm1LTDVuREhl?=
 =?utf-8?B?QUNPallscFpoVDBvVHdMZXI1T1drWkVFbDhpTDJqLzBmb1drcVJPSFlRT0p6?=
 =?utf-8?B?d2lQMmtEaFREa3p1OFp1dEZoWTNtZUFmVmZKUjVZVG9HNzREQWNjTW1qZGVR?=
 =?utf-8?B?ajU4c0RkK0RHUHhsZlRjNnlOdHUzekFoMWY0THdQYzhBQThjVmNjTko1OVNy?=
 =?utf-8?B?cVhuZE9wYUVBTW51OW8xT3JsNFAwdVBnVzBYcUVuZ25OYS9KRWV1MVhHWDZN?=
 =?utf-8?B?aEVsOFdrNklhUytxb1JPcGJTd1JnVlcrRkhTZDR4SWZsU2tZWUl2bmpPczVD?=
 =?utf-8?B?djRreDlFanRURFZicVFydU9NTlpaVkNqY29IR2Rqa3UyaFV2ZjZYZ0lzd2Yr?=
 =?utf-8?B?U3NqZzFzTmZrTFpZc2d5eDFDN3RCNWpQNFZNemNwZm5NdjhSMmVOOUJadFll?=
 =?utf-8?B?ZTJsT0Ftd2p0enB4OWhmUUNYaE04dGtwRXAvV1hTaExqQm1sOERkay9VVGtO?=
 =?utf-8?B?WEhRcUl5MVpZQ3EwN2tkVXN3b0JZM0JkNFh5eGlsU3ZqaHNaMnVMMlRtU1VU?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b97e93c-6300-4c71-2f66-08dafd93f50e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 22:48:34.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfNZD80rH+vDuP+6dhfHwrG9yktHyocOX1fW9GZF56r3ifdys+miWvSuhGzFIeuil4ia3H7SkcacguxvruxgkuuFXZHrMztuMf04sTWXawg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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

On 1/20/2023 08:40, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c | 31 +++++++++++++-------------
>   1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 1bccc175f9e6..be39e519b5fd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -11,6 +11,7 @@
>   #include "intel_guc.h"
>   #include "intel_guc_ads.h"
>   #include "intel_guc_capture.h"
> +#include "intel_guc_print.h"
>   #include "intel_guc_slpc.h"
>   #include "intel_guc_submission.h"
>   #include "i915_drv.h"
> @@ -94,8 +95,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
>   	spin_lock_irq(gt->irq_lock);
> -	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
> -		     gt->pm_guc_events);
> +	guc_WARN_ON_ONCE(guc, intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
> +			 gt->pm_guc_events);
>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>   	spin_unlock_irq(gt->irq_lock);
>   
> @@ -342,7 +343,7 @@ static void guc_init_params(struct intel_guc *guc)
>   	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
>   
>   	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
> -		DRM_DEBUG_DRIVER("param[%2d] = %#x\n", i, params[i]);
> +		guc_dbg(guc, "param[%2d] = %#x\n", i, params[i]);
>   }
>   
>   /*
> @@ -389,7 +390,6 @@ void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p)
>   
>   int intel_guc_init(struct intel_guc *guc)
>   {
> -	struct intel_gt *gt = guc_to_gt(guc);
>   	int ret;
>   
>   	ret = intel_uc_fw_init(&guc->fw);
> @@ -451,7 +451,7 @@ int intel_guc_init(struct intel_guc *guc)
>   	intel_uc_fw_fini(&guc->fw);
>   out:
>   	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
> -	i915_probe_error(gt->i915, "failed with %d\n", ret);
> +	guc_probe_error(guc, "failed with %pe\n", ERR_PTR(ret));
>   	return ret;
>   }
>   
> @@ -480,7 +480,6 @@ void intel_guc_fini(struct intel_guc *guc)
>   int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   			u32 *response_buf, u32 response_buf_size)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>   	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
>   	u32 header;
>   	int i;
> @@ -515,7 +514,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   					   10, 10, &header);
>   	if (unlikely(ret)) {
>   timeout:
> -		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
> +		guc_err(guc, "mmio request %#x: no reply %x\n",
>   			request[0], header);
>   		goto out;
>   	}
> @@ -537,7 +536,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>   		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
>   
> -		drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
> +		guc_dbg(guc, "mmio request %#x: retrying, reason %u\n",
>   			request[0], reason);
>   		goto retry;
>   	}
> @@ -546,7 +545,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
>   		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>   
> -		drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
> +		guc_err(guc, "mmio request %#x: failure %x/%u\n",
>   			request[0], error, hint);
>   		ret = -ENXIO;
>   		goto out;
> @@ -554,7 +553,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   
>   	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>   proto:
> -		drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
> +		guc_err(guc, "mmio request %#x: unexpected reply %#x\n",
>   			request[0], header);
>   		ret = -EPROTO;
>   		goto out;
> @@ -597,9 +596,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
>   	msg = payload[0] & guc->msg_enabled_mask;
>   
>   	if (msg & INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED)
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC crash dump notification!\n");
> +		guc_err(guc, "Received early GuC crash dump notification!\n");
>   	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC exception notification!\n");
> +		guc_err(guc, "Received early GuC exception notification!\n");
These two should drop the 'GUC' string from the message given that it is 
now a prefix.

John.

>   
>   	return 0;
>   }
> @@ -653,7 +652,8 @@ int intel_guc_suspend(struct intel_guc *guc)
>   		 */
>   		ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
>   		if (ret)
> -			DRM_ERROR("GuC suspend: RESET_CLIENT action failed with error %d!\n", ret);
> +			guc_err(guc, "suspend: RESET_CLIENT action failed with %pe\n",
> +				ERR_PTR(ret));
>   	}
>   
>   	/* Signal that the GuC isn't running. */
> @@ -828,12 +828,11 @@ static int __guc_action_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 va
>   
>   static int __guc_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 value)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>   	int err = __guc_action_self_cfg(guc, key, len, value);
>   
>   	if (unlikely(err))
> -		i915_probe_error(i915, "Unsuccessful self-config (%pe) key %#hx value %#llx\n",
> -				 ERR_PTR(err), key, value);
> +		guc_probe_error(guc, "Unsuccessful self-config (%pe) key %#hx value %#llx\n",
> +				ERR_PTR(err), key, value);
>   	return err;
>   }
>   

