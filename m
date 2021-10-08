Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D45426F79
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 19:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5E36E105;
	Fri,  8 Oct 2021 17:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028BB6E0FE;
 Fri,  8 Oct 2021 17:20:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="226454135"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="226454135"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 10:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="561382354"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Oct 2021 10:20:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 10:20:28 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 10:20:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 8 Oct 2021 10:20:27 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 8 Oct 2021 10:20:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0BTT8USAa58RjCphT3xykYi9xpvU5Gr2cEdW6mBzyvwMUQq/Kvx4r2Bgo/1cglzfpKph1zB1UZZu8WHdnM1vpLPFOmBrZqjWYBa9m95qFHjJf1LhjbYIQl70xVemVpF6h59USBcPZht0HDKKluA5pbRie3v8MDXgA/VNTkWC8mYmSRLC6aX6ivN3piiAXtqSpPn6kT61o/GxvjUpg3zASod0EWUqkL/CWRg+OCvW2nw8pAiFLYHThlPGBd1/5f2AfzRylMfXUlj3XCZS2/RzJC6j1obv0pBOivzumWPD7NMW1eQ7bnuFHPLZKD5c7gc+/oP+BChqegWIF7YaoHIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTr+PV29xfT0FH+asaXz4HVf8UX86HBL7vSpFwVSyyA=;
 b=Lj9moHQjpkDCHcq67o94Xlm/6V2oB/17dQih0Lwmmp3xoDVQt2Q6fCe9CwxEfB7OG/MfQJv+vVd/N+N3ZSxTKiHBo8hfBV8ueFMLoS65ISarSU+BlCX/uGoj+GnMfDDxlFcW0EvT4b5HdVppjaETE5FMw7XsQt81X+tvLlh2NsuJyH2+M1oToEGaDYUTke/E8avFA1O2MsO57pP/K4DmPiUnGbDMRFu0PWTGNqBNHU4hTeT10JbRTG7FEIhVBk8a5uRkBndUbkJrCcNC58j4dksj84KHA/UM3bj81kmnNqE0F8z4k0G6QyB9eVwOlRcIHlU2EdM7KWn5BiSM7UvsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTr+PV29xfT0FH+asaXz4HVf8UX86HBL7vSpFwVSyyA=;
 b=xA1+8ZLWjmV34atVqrhLLOI7s8SB2UbIPMafeAokXdnyfc8bzWHsD0p4deZkIfbf0vpGWbarQ9/k3grz2UwzhqI6ysYbywmqALD+vsJ/pyFG1Wla+zGG357OE3mO20xgVa/YrjMNnoUCxAwsrRBRxd8TNtXSzDBMQmZv7wjggIw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5578.namprd11.prod.outlook.com (2603:10b6:510:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 17:20:26 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 17:20:26 +0000
Subject: Re: [PATCH 12/26] drm/i915/guc: Implement multi-lrc submission
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-13-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <2eea93a0-a752-bfae-b267-9d7d1b9ba61c@intel.com>
Date: Fri, 8 Oct 2021 10:20:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-13-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW2PR16CA0052.namprd16.prod.outlook.com
 (2603:10b6:907:1::29) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW2PR16CA0052.namprd16.prod.outlook.com (2603:10b6:907:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 8 Oct 2021 17:20:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e25e704-0961-4ac2-09ba-08d98a7feb17
X-MS-TrafficTypeDiagnostic: PH0PR11MB5578:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55786882692B7D08028FCF0ABDB29@PH0PR11MB5578.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C77SRnKFo/9z9WHEhZusWv9DHoYpmBhpYdJMH0vyvneg6x002TYoUQJ0GHnpWOll0XBnJNxiPrGLpBMuRpUc60OGNkNPAZJb5ymyg9Nly4Brb3Gu/qErU3zJqJNyTwted/pCZAqi//lmbGiEhzr9M5kig7TP+L1XjrKbzLxnNHecm6hERJvZJ42tnU9WYkwNPIyKL74btuSRYYcqIRBaKGK9xSyC3wsUPUFn7xxn+AxKqjO5PPSutBd8SmeT7KUw+vAYziAQeNBTJq4/I+Z+KoYZKzbi8zzPIRvJ5xdVd9Cdr/deAM9jwFNrpnBJ1DpY7xGtF1RJSPadY4OAMIOjFQykmukU+sGpcFVdmIaxXLWvmXQzNvlVkFpbZ/SD0r4OGnNqnPsdjV5d46gG+MA8EVgcNPJJRL9vSUoIc4D9CpuU9HvrrbDyLxKDzGCfkiqfaMDdhyXk9WxtDgcy4BBK3eu1iwLoWQROBjuORDXPByRy8dpedpcxGcsji9Dt6mTe754/3FeAJLKLMieM58LYW2XqQ6KjTqrmo9ZjHyiUGP91buEO8KToO8WVl9MK57wOEpjk/OV1TEZkTT7BOR/h28BI9GIBCooXCQQ5MgmtaUCRsA/NtnS4KN7ceIZH3hA0ts+5SBOxLJJdUB17MF0S299rImQNh4+Lkz1bz/OKUYFyUmBIzz8bvXA88e/0B1NSOaK0oMI/ceY+UaVXP6abpg4685CVJOqs1u/RvqyV3Nft6xKqNiot6Uy2y6j5Sw9c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(36756003)(83380400001)(86362001)(2906002)(5660300002)(8936002)(31686004)(316002)(4326008)(16576012)(6486002)(66556008)(38100700002)(956004)(31696002)(508600001)(450100002)(186003)(2616005)(30864003)(66476007)(53546011)(8676002)(26005)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0pNeUZRV21RNS82OUQxNUd2d2N0SlVFR2VVSy9KQTNpaG5RUHpSQkJpZW1P?=
 =?utf-8?B?UjFKTUI0RUlKamlWWjYvNFRKRzVXeWtlS2hDWEZBOVhSeTh0cVMwTjN2QzEw?=
 =?utf-8?B?eS9XcFNVL2UrOUsrSmRJdVRjbXlkTklMSEJBSUY1NXJvTEFhVUZpL0lIOG1o?=
 =?utf-8?B?azhOdGJPVk4xRkUyamUwRkRURHVvWDN2UjAwK2hncGRyV25CeTBoelR6VDlx?=
 =?utf-8?B?OW5RTGdwVTEwWEhWRlBKejc4cS9XUVVuM0J3NUExRXhCdVhNNm9aWC9QMUpZ?=
 =?utf-8?B?QS9PR2VheXpqVlRUdU85QWNWWWZBd2cvbXJkOTkyZlA3YS8xR3FUbVptdm5L?=
 =?utf-8?B?R00rVDBpcVE3eVdKS0NrYlAwaDlDYTBrNFh0ek9FUndXQU1xSTFxWHg1SUxH?=
 =?utf-8?B?WG1yTDliSU1zWFhhalVzdzhvT3hBdlplKzUwQktXVnRTUjd5NUplKytaNnZx?=
 =?utf-8?B?YlQ3M1dscDZPWDZleWQ1QW51RzFWckJjakt6ZTBRd0dWVFhaamJ4L0E4VWtx?=
 =?utf-8?B?ZWMzckd3R1UrZ2NVcXFCOVNpbGNtN0Uyc3FlcFhER0tuaG5zOUhVT2p2ODJu?=
 =?utf-8?B?Y2J4VWg4VHpLaUJFSTRJOHBSRk1sTXU0bXBqaEFqeWUvNURuMkJaT2hQT0Fx?=
 =?utf-8?B?VG9oY3FvYnZxK29veWZKd0xCMFZvaUxHaWJBT2xrOVFuUTBqVjZpTHA4UEd5?=
 =?utf-8?B?SXl2Smc3U2pYNUx5a2RFRGJ6M1B4N2MrcDhuamxmemFJMkRTZURPSXVWZm01?=
 =?utf-8?B?R2paRHp2dlJ0dHJOYTAwRVY4aUJNamNJU21wb05qNm5WWkEzNzlvZXlzdm42?=
 =?utf-8?B?K3lpNmJvZm1TOVJuMXVNTHlKUjRlZTZKU1o2YlRiWjRWQitRcGxkMkhFZDV1?=
 =?utf-8?B?Wm9oc0pEVTNEZW42WUVZdVVwVC9MUjZIemlwUTVHOGdjaG44MDR6VDQvUzQ1?=
 =?utf-8?B?clVuNDdqZEhEdUpwOHd2R3NyR1BaT2NzWlBqN3JFbmJSdDVZMHNGVTM4NS9s?=
 =?utf-8?B?eHBXeGYyanFaZG1zRWJwL25FQVdUQU8rZHgzaTFDZnlOempJNlVVU0dvTWhL?=
 =?utf-8?B?WE1ucUZYbUg2WEsrSVFXYmU1U1QxZHBuU1p2VzRRVU5IMGVBSEYyNDR3TUVQ?=
 =?utf-8?B?NzkxMmFNYVN5TFpCRFRIRWF5bUdlcko1TU5Fc0puUWR6Z2YxMHJWU1MvSjFL?=
 =?utf-8?B?MG53YlRiZHZ4ZitWRDQ3VHhuOHM5WFhjd25MVGZ6TjRrTjBadTVlU0dlVWNw?=
 =?utf-8?B?R1A0aDBGYlF2SG9vbE9Ja1dJdTRBZDMrVy9rdjh1V2p4ZkNCZDFsMG14RVlh?=
 =?utf-8?B?bWJnY3psOTk1OG1oZERBajJUUnlhZ0RoQVNDUE15UGlNZENSbmRvWXcxME1t?=
 =?utf-8?B?QWZKQTRLZjhFWE9ZSjlNbG9Hd2QzUzlkdmZhZHB5OXJ1eUlycGpOTzhFU1or?=
 =?utf-8?B?ZEUvQ3ZjSGxzNEhkU2oybEdmNmlONmVPU1VaZ1NFTjR1SnpoN1dQeURNY0J4?=
 =?utf-8?B?NHB4dGxNK2tWTjN5bmVEUnpoUU5DVlV0bGQzNlhSVVQ0L2tDZjR0RERVR0tQ?=
 =?utf-8?B?NTlPTjlicnhONUFvbGhzWjQrY3VnaWphTUFuOU9ZbnBrQlk2K0hjWk1sQ0pp?=
 =?utf-8?B?R2pHZXZINEZDTXMwQmQ1MkZiNzJyZ2pTSTd5UDg0d01Sb2E2QkxYRE5GbHUr?=
 =?utf-8?B?RjI0eGZxcWpPTWV2eUkwbTBCRkU5elF6ci82Yjgwb3I3RnovNzY1ckdMQWhY?=
 =?utf-8?Q?Gs6O2piZeno2x314MqZgz/oXT439D7BXJtmCP+m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e25e704-0961-4ac2-09ba-08d98a7feb17
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 17:20:26.0913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDq2zzBO9u4nmAGlygo9KV9ayxKfQkAGfJXxcVzZhZQVgCOCMV319fBRlsPb6SlKWmM773XNK0cq21pA0m5BpjfsCnDgF79D77KpuVB1Za8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5578
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

On 10/4/2021 15:06, Matthew Brost wrote:
> Implement multi-lrc submission via a single workqueue entry and single
> H2G. The workqueue entry contains an updated tail value for each
> request, of all the contexts in the multi-lrc submission, and updates
> these values simultaneously. As such, the tasklet and bypass path have
> been updated to coalesce requests into a single submission.
>
> v2:
>   (John Harrison)
>    - s/wqe/wqi
>    - Use FIELD_PREP macros
>    - Add GEM_BUG_ONs ensures length fits within field
>    - Add comment / white space to intel_guc_write_barrier
>   (Kernel test robot)
>    - Make need_tasklet a static function
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  26 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   8 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  24 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  23 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 319 ++++++++++++++++--
>   drivers/gpu/drm/i915/i915_request.h           |   8 +
>   6 files changed, 335 insertions(+), 73 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 8f8182bf7c11..7191e8439290 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -756,3 +756,29 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p)
>   		}
>   	}
>   }
> +
> +void intel_guc_write_barrier(struct intel_guc *guc)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> +		/*
> +		 * Ensure intel_uncore_write_fw can be used rather than
> +		 * intel_uncore_write.
> +		 */
> +		GEM_BUG_ON(guc->send_regs.fw_domains);
> +
> +		/*
> +		 * This register is used by the i915 and GuC for MMIO based
> +		 * communication. Once we are in this code CTBs are the only
> +		 * method the i915 uses to communicate with the GuC so it is
> +		 * safe to write to this register (a value of 0 is NOP for MMIO
> +		 * communication). If we ever start mixing CTBs and MMIOs a new
> +		 * register will have to be chosen.
> +		 */
Hmm, missed it before but this comment is very CTB centric and the 
barrier function is now being used for parallel submission work queues. 
Seems like an extra comment should be added to cover that case. Just 
something simple about WQ usage is also guaranteed to be post CTB switch 
over.

> +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> +	} else {
> +		/* wmb() sufficient for a barrier if in smem */
> +		wmb();
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index a9f4ec972bfb..147f39cc0f2f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -46,6 +46,12 @@ struct intel_guc {
>   	 * submitted until the stalled request is processed.
>   	 */
>   	struct i915_request *stalled_request;
> +	enum {
> +		STALL_NONE,
> +		STALL_REGISTER_CONTEXT,
> +		STALL_MOVE_LRC_TAIL,
> +		STALL_ADD_REQUEST,
> +	} submission_stall_reason;
>   
>   	/* intel_guc_recv interrupt related state */
>   	/** @irq_lock: protects GuC irq state */
> @@ -361,4 +367,6 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc);
>   
>   void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
>   
> +void intel_guc_write_barrier(struct intel_guc *guc);
> +
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 20c710a74498..10d1878d2826 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -377,28 +377,6 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
>   	return ++ct->requests.last_fence;
>   }
>   
> -static void write_barrier(struct intel_guc_ct *ct)
> -{
> -	struct intel_guc *guc = ct_to_guc(ct);
> -	struct intel_gt *gt = guc_to_gt(guc);
> -
> -	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> -		GEM_BUG_ON(guc->send_regs.fw_domains);
> -		/*
> -		 * This register is used by the i915 and GuC for MMIO based
> -		 * communication. Once we are in this code CTBs are the only
> -		 * method the i915 uses to communicate with the GuC so it is
> -		 * safe to write to this register (a value of 0 is NOP for MMIO
> -		 * communication). If we ever start mixing CTBs and MMIOs a new
> -		 * register will have to be chosen.
> -		 */
> -		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> -	} else {
> -		/* wmb() sufficient for a barrier if in smem */
> -		wmb();
> -	}
> -}
> -
>   static int ct_write(struct intel_guc_ct *ct,
>   		    const u32 *action,
>   		    u32 len /* in dwords */,
> @@ -468,7 +446,7 @@ static int ct_write(struct intel_guc_ct *ct,
>   	 * make sure H2G buffer update and LRC tail update (if this triggering a
>   	 * submission) are visible before updating the descriptor tail
>   	 */
> -	write_barrier(ct);
> +	intel_guc_write_barrier(ct_to_guc(ct));
>   
>   	/* update local copies */
>   	ctb->tail = tail;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 0eeb2a9feeed..a00eeddc1449 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -58,19 +58,16 @@
>   #define WQ_STATUS_CMD_ERROR		3
>   #define WQ_STATUS_ENGINE_ID_NOT_USED	4
>   #define WQ_STATUS_SUSPENDED_FROM_RESET	5
> -#define WQ_TYPE_SHIFT			0
> -#define   WQ_TYPE_BATCH_BUF		(0x1 << WQ_TYPE_SHIFT)
> -#define   WQ_TYPE_PSEUDO		(0x2 << WQ_TYPE_SHIFT)
> -#define   WQ_TYPE_INORDER		(0x3 << WQ_TYPE_SHIFT)
> -#define   WQ_TYPE_NOOP			(0x4 << WQ_TYPE_SHIFT)
> -#define WQ_TARGET_SHIFT			10
> -#define WQ_LEN_SHIFT			16
> -#define WQ_NO_WCFLUSH_WAIT		(1 << 27)
> -#define WQ_PRESENT_WORKLOAD		(1 << 28)
> -
> -#define WQ_RING_TAIL_SHIFT		20
> -#define WQ_RING_TAIL_MAX		0x7FF	/* 2^11 QWords */
> -#define WQ_RING_TAIL_MASK		(WQ_RING_TAIL_MAX << WQ_RING_TAIL_SHIFT)
> +#define WQ_TYPE_BATCH_BUF		0x1
> +#define WQ_TYPE_PSEUDO			0x2
> +#define WQ_TYPE_INORDER			0x3
> +#define WQ_TYPE_NOOP			0x4
> +#define WQ_TYPE_MULTI_LRC		0x5
> +#define WQ_TYPE_MASK			GENMASK(7, 0)
> +#define WQ_LEN_MASK			GENMASK(26, 16)
> +
> +#define WQ_GUC_ID_MASK			GENMASK(15, 0)
> +#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
Other option for documenting WQ and WQI would be at the top of this 
block of definitions. I believe there is a one line comment of 'work 
queue item header definitions' but none of these defines actually use 
the WQI abbreviation. And some description of what the work queue is, 
how it is used, etc. would be good.

>   
>   #define GUC_STAGE_DESC_ATTR_ACTIVE	BIT(0)
>   #define GUC_STAGE_DESC_ATTR_PENDING_DB	BIT(1)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 031b1bf5ba91..1610120e31a1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -399,6 +399,29 @@ __get_process_desc(struct intel_context *ce)
>   		   LRC_STATE_OFFSET) / sizeof(u32)));
>   }
>   
> +static u32 *get_wq_pointer(struct guc_process_desc *desc,
> +			   struct intel_context *ce,
> +			   u32 wqi_size)
> +{
> +	/*
> +	 * Check for space in work queue. Caching a value of head pointer in
> +	 * intel_context structure in order reduce the number accesses to shared
> +	 * GPU memory which may be across a PCIe bus.
> +	 */
> +#define AVAILABLE_SPACE	\
> +	CIRC_SPACE(ce->parallel.guc.wqi_tail, ce->parallel.guc.wqi_head, WQ_SIZE)
> +	if (wqi_size > AVAILABLE_SPACE) {
> +		ce->parallel.guc.wqi_head = READ_ONCE(desc->head);
> +
> +		if (wqi_size > AVAILABLE_SPACE)
> +			return NULL;
> +	}
> +#undef AVAILABLE_SPACE
> +
> +	return ((u32 *)__get_process_desc(ce)) +
> +		((WQ_OFFSET + ce->parallel.guc.wqi_tail) / sizeof(u32));
> +}
> +
>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   {
>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> @@ -558,10 +581,10 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>   
>   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
>   
> -static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> +static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   {
>   	int err = 0;
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	u32 action[3];
>   	int len = 0;
>   	u32 g2h_len_dw = 0;
> @@ -582,26 +605,17 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>   
> -	/*
> -	 * Corner case where the GuC firmware was blown away and reloaded while
> -	 * this context was pinned.
> -	 */
> -	if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id))) {
> -		err = guc_lrc_desc_pin(ce, false);
> -		if (unlikely(err))
> -			return err;
> -	}
> -
>   	spin_lock(&ce->guc_state.lock);
>   
>   	/*
>   	 * The request / context will be run on the hardware when scheduling
> -	 * gets enabled in the unblock.
> +	 * gets enabled in the unblock. For multi-lrc we still submit the
> +	 * context to move the LRC tails.
>   	 */
> -	if (unlikely(context_blocked(ce)))
> +	if (unlikely(context_blocked(ce) && !intel_context_is_parent(ce)))
>   		goto out;
>   
> -	enabled = context_enabled(ce);
> +	enabled = context_enabled(ce) || context_blocked(ce);
>   
>   	if (!enabled) {
>   		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> @@ -620,6 +634,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   		trace_intel_context_sched_enable(ce);
>   		atomic_inc(&guc->outstanding_submission_g2h);
>   		set_context_enabled(ce);
> +
> +		/*
> +		 * Without multi-lrc KMD does the submission step (moving the
> +		 * lrc tail) so enabling scheduling is sufficient to submit the
> +		 * context. This isn't the case in multi-lrc submission as the
> +		 * GuC needs to move the tails, hence the need for another H2G
> +		 * to submit a multi-lrc context after enabling scheduling.
> +		 */
> +		if (intel_context_is_parent(ce)) {
> +			action[0] = INTEL_GUC_ACTION_SCHED_CONTEXT;
> +			err = intel_guc_send_nb(guc, action, len - 1, 0);
> +		}
>   	} else if (!enabled) {
>   		clr_context_pending_enable(ce);
>   		intel_context_put(ce);
> @@ -632,6 +658,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	return err;
>   }
>   
> +static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> +{
> +	int ret = __guc_add_request(guc, rq);
> +
> +	if (unlikely(ret == -EBUSY)) {
> +		guc->stalled_request = rq;
> +		guc->submission_stall_reason = STALL_ADD_REQUEST;
> +	}
> +
> +	return ret;
> +}
> +
>   static inline void guc_set_lrc_tail(struct i915_request *rq)
>   {
>   	rq->context->lrc_reg_state[CTX_RING_TAIL] =
> @@ -643,6 +681,134 @@ static inline int rq_prio(const struct i915_request *rq)
>   	return rq->sched.attr.priority;
>   }
>   
> +static bool is_multi_lrc_rq(struct i915_request *rq)
> +{
> +	return intel_context_is_child(rq->context) ||
> +		intel_context_is_parent(rq->context);
> +}
> +
> +static bool can_merge_rq(struct i915_request *rq,
> +			 struct i915_request *last)
> +{
> +	return request_to_scheduling_context(rq) ==
> +		request_to_scheduling_context(last);
> +}
> +
> +static u32 wq_space_until_wrap(struct intel_context *ce)
> +{
> +	return (WQ_SIZE - ce->parallel.guc.wqi_tail);
> +}
> +
> +static void write_wqi(struct guc_process_desc *desc,
> +		      struct intel_context *ce,
> +		      u32 wqi_size)
> +{
> +	/*
> +	 * Ensure WQI are visible before updating tail
> +	 */
> +	intel_guc_write_barrier(ce_to_guc(ce));
> +
> +	ce->parallel.guc.wqi_tail = (ce->parallel.guc.wqi_tail + wqi_size) &
> +		(WQ_SIZE - 1);
This relies on WQ_SIZE being a power of two, right? Is it possible to 
add a BUILD_BUG_ON to ensure that?

> +	WRITE_ONCE(desc->tail, ce->parallel.guc.wqi_tail);
> +}
> +
> +static int guc_wq_noop_append(struct intel_context *ce)
> +{
> +	struct guc_process_desc *desc = __get_process_desc(ce);
> +	u32 *wqi = get_wq_pointer(desc, ce, wq_space_until_wrap(ce));
> +	u32 len_dw = wq_space_until_wrap(ce) / sizeof(u32) - 1;
> +
> +	if (!wqi)
> +		return -EBUSY;
> +
> +	GEM_BUG_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
> +
> +	*wqi = FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
> +		FIELD_PREP(WQ_LEN_MASK, len_dw);
> +	ce->parallel.guc.wqi_tail = 0;
> +
> +	return 0;
> +}
> +
> +static int __guc_wq_item_append(struct i915_request *rq)
> +{
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +	struct intel_context *child;
> +	struct guc_process_desc *desc = __get_process_desc(ce);
> +	unsigned int wqi_size = (ce->parallel.number_children + 4) *
> +		sizeof(u32);
> +	u32 *wqi;
> +	u32 len_dw = (wqi_size / sizeof(u32)) - 1;
> +	int ret;
> +
> +	/* Ensure context is in correct state updating work queue */
> +	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
> +	GEM_BUG_ON(context_guc_id_invalid(ce));
> +	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
> +	GEM_BUG_ON(!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id));
> +
> +	/* Insert NOOP if this work queue item will wrap the tail pointer. */
> +	if (wqi_size > wq_space_until_wrap(ce)) {
> +		ret = guc_wq_noop_append(ce);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	wqi = get_wq_pointer(desc, ce, wqi_size);
> +	if (!wqi)
> +		return -EBUSY;
> +
> +	GEM_BUG_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
> +
> +	*wqi++ = FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_MULTI_LRC) |
> +		FIELD_PREP(WQ_LEN_MASK, len_dw);
> +	*wqi++ = ce->lrc.lrca;
> +	*wqi++ = FIELD_PREP(WQ_GUC_ID_MASK, ce->guc_id.id) |
> +	       FIELD_PREP(WQ_RING_TAIL_MASK, ce->ring->tail / sizeof(u64));
> +	*wqi++ = 0;	/* fence_id */
> +	for_each_child(ce, child)
> +		*wqi++ = child->ring->tail / sizeof(u64);
> +
> +	write_wqi(desc, ce, wqi_size);
> +
> +	return 0;
> +}
> +
> +static int guc_wq_item_append(struct intel_guc *guc,
> +			      struct i915_request *rq)
> +{
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +	int ret = 0;
> +
> +	if (likely(!intel_context_is_banned(ce))) {
> +		ret = __guc_wq_item_append(rq);
> +
> +		if (unlikely(ret == -EBUSY)) {
> +			guc->stalled_request = rq;
> +			guc->submission_stall_reason = STALL_MOVE_LRC_TAIL;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static bool multi_lrc_submit(struct i915_request *rq)
> +{
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +
> +	intel_ring_set_tail(rq->ring, rq->tail);
> +
> +	/*
> +	 * We expect the front end (execbuf IOCTL) to set this flag on the last
> +	 * request generated from a multi-BB submission. This indicates to the
> +	 * backend (GuC interface) that we should submit this context thus
> +	 * submitting all the requests generated in parallel.
> +	 */
> +	return test_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL, &rq->fence.flags) ||
FYI: Apparently the test_bit/set_bit/etc helpers are intended for use on 
arbitrary sized bitfields. As in, they do all sorts of complicated 
atomic operations to work on 164 bit words and such like. For single 
word flags, the guidance is to just use 'if(word & BIT(bit))' instead.

John.

> +		intel_context_is_banned(ce);
> +}
> +
>   static int guc_dequeue_one_context(struct intel_guc *guc)
>   {
>   	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> @@ -656,7 +822,17 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   	if (guc->stalled_request) {
>   		submit = true;
>   		last = guc->stalled_request;
> -		goto resubmit;
> +
> +		switch (guc->submission_stall_reason) {
> +		case STALL_REGISTER_CONTEXT:
> +			goto register_context;
> +		case STALL_MOVE_LRC_TAIL:
> +			goto move_lrc_tail;
> +		case STALL_ADD_REQUEST:
> +			goto add_request;
> +		default:
> +			MISSING_CASE(guc->submission_stall_reason);
> +		}
>   	}
>   
>   	while ((rb = rb_first_cached(&sched_engine->queue))) {
> @@ -664,8 +840,8 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   		struct i915_request *rq, *rn;
>   
>   		priolist_for_each_request_consume(rq, rn, p) {
> -			if (last && rq->context != last->context)
> -				goto done;
> +			if (last && !can_merge_rq(rq, last))
> +				goto register_context;
>   
>   			list_del_init(&rq->sched.link);
>   
> @@ -673,33 +849,84 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   
>   			trace_i915_request_in(rq, 0);
>   			last = rq;
> -			submit = true;
> +
> +			if (is_multi_lrc_rq(rq)) {
> +				/*
> +				 * We need to coalesce all multi-lrc requests in
> +				 * a relationship into a single H2G. We are
> +				 * guaranteed that all of these requests will be
> +				 * submitted sequentially.
> +				 */
> +				if (multi_lrc_submit(rq)) {
> +					submit = true;
> +					goto register_context;
> +				}
> +			} else {
> +				submit = true;
> +			}
>   		}
>   
>   		rb_erase_cached(&p->node, &sched_engine->queue);
>   		i915_priolist_free(p);
>   	}
> -done:
> +
> +register_context:
>   	if (submit) {
> -		guc_set_lrc_tail(last);
> -resubmit:
> +		struct intel_context *ce = request_to_scheduling_context(last);
> +
> +		if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id) &&
> +			     !intel_context_is_banned(ce))) {
> +			ret = guc_lrc_desc_pin(ce, false);
> +			if (unlikely(ret == -EPIPE)) {
> +				goto deadlk;
> +			} else if (ret == -EBUSY) {
> +				guc->stalled_request = last;
> +				guc->submission_stall_reason =
> +					STALL_REGISTER_CONTEXT;
> +				goto schedule_tasklet;
> +			} else if (ret != 0) {
> +				GEM_WARN_ON(ret);	/* Unexpected */
> +				goto deadlk;
> +			}
> +		}
> +
> +move_lrc_tail:
> +		if (is_multi_lrc_rq(last)) {
> +			ret = guc_wq_item_append(guc, last);
> +			if (ret == -EBUSY) {
> +				goto schedule_tasklet;
> +			} else if (ret != 0) {
> +				GEM_WARN_ON(ret);	/* Unexpected */
> +				goto deadlk;
> +			}
> +		} else {
> +			guc_set_lrc_tail(last);
> +		}
> +
> +add_request:
>   		ret = guc_add_request(guc, last);
> -		if (unlikely(ret == -EPIPE))
> +		if (unlikely(ret == -EPIPE)) {
> +			goto deadlk;
> +		} else if (ret == -EBUSY) {
> +			goto schedule_tasklet;
> +		} else if (ret != 0) {
> +			GEM_WARN_ON(ret);	/* Unexpected */
>   			goto deadlk;
> -		else if (ret == -EBUSY) {
> -			tasklet_schedule(&sched_engine->tasklet);
> -			guc->stalled_request = last;
> -			return false;
>   		}
>   	}
>   
>   	guc->stalled_request = NULL;
> +	guc->submission_stall_reason = STALL_NONE;
>   	return submit;
>   
>   deadlk:
>   	sched_engine->tasklet.callback = NULL;
>   	tasklet_disable_nosync(&sched_engine->tasklet);
>   	return false;
> +
> +schedule_tasklet:
> +	tasklet_schedule(&sched_engine->tasklet);
> +	return false;
>   }
>   
>   static void guc_submission_tasklet(struct tasklet_struct *t)
> @@ -1255,10 +1482,16 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>   
>   	trace_i915_request_in(rq, 0);
>   
> -	guc_set_lrc_tail(rq);
> -	ret = guc_add_request(guc, rq);
> -	if (ret == -EBUSY)
> -		guc->stalled_request = rq;
> +	if (is_multi_lrc_rq(rq)) {
> +		if (multi_lrc_submit(rq)) {
> +			ret = guc_wq_item_append(guc, rq);
> +			if (!ret)
> +				ret = guc_add_request(guc, rq);
> +		}
> +	} else {
> +		guc_set_lrc_tail(rq);
> +		ret = guc_add_request(guc, rq);
> +	}
>   
>   	if (unlikely(ret == -EPIPE))
>   		disable_submission(guc);
> @@ -1266,6 +1499,16 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>   	return ret;
>   }
>   
> +static bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
> +{
> +	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +
> +	return submission_disabled(guc) || guc->stalled_request ||
> +		!i915_sched_engine_is_empty(sched_engine) ||
> +		!lrc_desc_registered(guc, ce->guc_id.id);
> +}
> +
>   static void guc_submit_request(struct i915_request *rq)
>   {
>   	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> @@ -1275,8 +1518,7 @@ static void guc_submit_request(struct i915_request *rq)
>   	/* Will be called from irq-context when using foreign fences. */
>   	spin_lock_irqsave(&sched_engine->lock, flags);
>   
> -	if (submission_disabled(guc) || guc->stalled_request ||
> -	    !i915_sched_engine_is_empty(sched_engine))
> +	if (need_tasklet(guc, rq))
>   		queue_request(sched_engine, rq, rq_prio(rq));
>   	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
>   		tasklet_hi_schedule(&sched_engine->tasklet);
> @@ -2258,9 +2500,10 @@ static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
>   
>   static void add_to_context(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
>   
>   	spin_lock(&ce->guc_state.lock);
> @@ -2293,7 +2536,9 @@ static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
>   
>   static void remove_from_context(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
> +
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
>   	spin_lock_irq(&ce->guc_state.lock);
>   
> @@ -2712,7 +2957,7 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
>   static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   					   int prio)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
>   
>   	/* Short circuit function */
> @@ -2735,7 +2980,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   
>   static void guc_retire_inflight_request_prio(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   
>   	spin_lock(&ce->guc_state.lock);
>   	guc_prio_fini(rq, ce);
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 7bd9ed20623e..8950785e55d6 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -139,6 +139,14 @@ enum {
>   	 * the GPU. Here we track such boost requests on a per-request basis.
>   	 */
>   	I915_FENCE_FLAG_BOOST,
> +
> +	/*
> +	 * I915_FENCE_FLAG_SUBMIT_PARALLEL - request with a context in a
> +	 * parent-child relationship (parallel submission, multi-lrc) should
> +	 * trigger a submission to the GuC rather than just moving the context
> +	 * tail.
> +	 */
> +	I915_FENCE_FLAG_SUBMIT_PARALLEL,
>   };
>   
>   /**

