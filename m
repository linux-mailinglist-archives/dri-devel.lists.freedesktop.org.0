Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31FD425B4B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7F36F40B;
	Thu,  7 Oct 2021 19:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C456E580;
 Thu,  7 Oct 2021 19:04:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="213477440"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="213477440"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 12:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="713469585"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga006.fm.intel.com with ESMTP; 07 Oct 2021 12:03:54 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 12:03:52 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 12:03:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 7 Oct 2021 12:03:52 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 7 Oct 2021 12:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApAjjm+UZFviSE2+fpV4LkBZllfYuw8PJUDkrkyb+U3UAQakfQaIghzIJtTyX8Ndks6XDMEcfkF9skDRi4sr4geMpMNqeVlqlaS8nxyyIja9+kLsdmDuauSvn9dCFZ3JwcCHCWHIKSKxsb56FWGSpWuadW28UJ8HjKrGUcUE8GOsec8QyEgcy+tVK1xVKWXbpJL0/gnnT8/v344HTuKUYlnRhbqT+7DbvDgtT6zX5Ar9izX2A5lSMpZrcpf76kIWVvFpfVYsv/DBAuYdmAgPeJKsLOod64ZP5goFlkMlZtc16GO5Z0UQOupXTgEM1MZAI8v93QWrAlcF9wwfTzJyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBJG3q9M2c/atMJX5GcILmBBuuhlDaiok/3GacruXHU=;
 b=Ln5C3fUR5DMok5hkrVSqCItNlVTBq3wiSXthIUbM9v+F+T7sT2yEJ8hwAuhCHtBnfCCAWGfd5kGNE11f3V8lqi2ESvyizTzO1wrjiVK4yTgPpC1co/47Kh+ylbOFMej1hADWWHbBeoWEIJkq2E+97u3b1oNZLgsEGS/fBwVQID5FgQ6d3/1LzNDG3WsmWHFj6GtJnGxYFTkw6/qw5T8OQBaYmTPTQ+10326BT55tv5eYGM+dg5eTxESFEdvVxuksAHxdKPa4C20m2bwsuCwKLNrj2c1UEG/IuYypRqESOgfzokfoOfqW9XKR7YTzNGpgt23PpNPokUKhL9gwpocqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBJG3q9M2c/atMJX5GcILmBBuuhlDaiok/3GacruXHU=;
 b=pW0C5OdHykOmMpNiAWm6HFw8NXWTheLi6a0q/USswjYR27MGlkMSkDoTP6/9OEEWmaybd1p3RE1pEot2Z1VjXtrVcZSqBoGX7O/pPhzQBHNbkxFGAUMZK1vJ5KE3PD4c3Rvyy5gvngj5jH1MFrI4/MGnUAL5PDsRqRLHBapLpfU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 19:03:50 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 19:03:50 +0000
Subject: Re: [PATCH 05/26] drm/i915: Add logical engine mapping
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-6-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <d604a488-e7e7-2aff-8dfb-14ce11aa0cde@intel.com>
Date: Thu, 7 Oct 2021 12:03:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:a03:40::47) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 BYAPR04CA0034.namprd04.prod.outlook.com (2603:10b6:a03:40::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.19 via Frontend Transport; Thu, 7 Oct 2021 19:03:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a02c29fe-50de-4ffa-5335-08d989c532e8
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5674F14052C7AF4AACF2472ABDB19@PH0PR11MB5674.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uIpSw/yE+vpCaG9f1X2TwJAJGue9Yn7lstNHWYvtKV0v88BbC3lFMXm1399eCgvRKZ5Kw99N3iIBv9Cb/W+xkqWWwX6SyZjxW6/v1Gn6s0sq66fuWHQfastzxfBkVnsRAzM86XWeQFC0gaTBP6uERwcNqONkgE5N9QUALEo3uVEWyitNJU8X1xfbePuAFWwc4BbfmaVVRkOTWz+Z16V8TVzyRSYeeYjJ7KX+++mSWNESJhJ81cbs+lh6Brk31O4PItelvu9tz8o06+i+BvyyjD096SxC66jnL9tNAdICdjhEcmGTkSigO0M7mSxTy+WudSUlG4K5vArYpgO6Gdi0zLx8PW9t+WtWiNrtnDZJRvMN1VM50ZNQZmNs2D8gfpZno5q2Ack0VQ2/yn6mKCpu146UEW5ULknlD1vKMmugPuqXssNhJNT8rvk08c4OtwBW3GHv/XzLc5kZOWaGOUxzfc7WT9MCHwpyM1x55Qa6eiUg2VHAcZk7x8fVlF7cBdVjimLcvGo69vvQEZTORaVSZELWW1bS6ci1XsaV61E0G4AA8FJY9+rP0GzJ1Wt8fnFxl+v8gsT2IkJG2Vjs90FhgjjIXNKGjLu/XpAjdR5cYBv9WnxgB/0HO+R1AUTeeeUm3SIMfabdpP8FFl4wnPCOKBA+Dy/vB3OtbmzPKnY442NPUrD5iZGU7XLAc0DTto8XdX93RAsegkyNFa3FLX8/cWszjqXD84HueDxYQnfDwlcywsNaTWNeYLiiD94dsrce
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(186003)(38100700002)(66946007)(26005)(16576012)(316002)(8676002)(6486002)(508600001)(66556008)(5660300002)(66476007)(8936002)(2906002)(31696002)(86362001)(450100002)(4326008)(31686004)(36756003)(107886003)(83380400001)(956004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVFtZWE3aGt0YVFLNk5Pdy9nVDV1V0VCQ0R0cEZlbUxUQXNYYnVlZk85aUs0?=
 =?utf-8?B?eWV3V2Z4TW1GaElBN2ZwbVBRSWZkMXZ5V092N0U2S2g1Sm9va2tidkhZL2ps?=
 =?utf-8?B?eVNnT0lkekp6RUhoSWZ5UlRQMTBqWStmcnc4andHOTZ5ZkRDeDZPVE5YakRE?=
 =?utf-8?B?NElKbVFQN0RHTDZ0bHlnWlVTMWc1amtsaUFJK0lPSDVrbXd1S0xCQUhxNU9y?=
 =?utf-8?B?SC9YWnZaaDFncVZRa3daVWtFcEZrR2ZoRi80RmI4WDZPU0xUd0Z3YjBya256?=
 =?utf-8?B?UUNpUmdFdG1ZaGY1Q0M1clozRlkrWHJXUi9SMGl4MitGa3Z5WEF2NitUZmpR?=
 =?utf-8?B?SmF5ZnB1OXRnaEhSMGRBRStSaUkzY05GS3I5TWhPNDZTa3hoMW1iR3hpVDdj?=
 =?utf-8?B?SFUycENwRndYNHE3N1BUVmdEaThmSkN6bW0rcE8rSmk4YU1KRllELytUWldZ?=
 =?utf-8?B?S0NMTkRUdDFDdS8zZmYveUNNSzdCdmdBbkhadzdzRGVZdXlZbll5U0JBNzBN?=
 =?utf-8?B?OVFua3BKQ3RQcExaQTBkeTBqZVRTVkxnWjM5U2U1NFBHNXdWQXlPQnorTDJr?=
 =?utf-8?B?S1FubEd6dXcrMWduOXpjeW5IR1BHYmR3eVNHeFJZTldEWDByODB5bHV4d1lP?=
 =?utf-8?B?ZnFSYUkvM2tHbmtDWHhvTnAra0lEWVM1c01WWHZYbWZqeU0ybUZvWlh0UVVi?=
 =?utf-8?B?VStXL2pDeTZWamRTUTBEYTlTUVc2UVh2NGRTZFJGT1VsUlFsQ21DeFgzdStL?=
 =?utf-8?B?OE5JbmIzT2dxclVwbVRpR2h1MU9tUTRaa2xsYnZtU0NlUGppS29PTDFzdGhP?=
 =?utf-8?B?dXVuRC91OG1Ia0JZOEVHQ2RFVUdyQVRJU2NTYUtVM09MVkJzVWMwUlgvMXhP?=
 =?utf-8?B?eWRCVlplSStXR3crcFBnQjBsdC9KYzk5akxoVVkzZ0VDVDNRL1pUa3dsTVRL?=
 =?utf-8?B?Ykc1OVlzTXd2VFErMUJvai93cUhWV2R1VDZKMDJtUCtQcHpYVjUxSzhpZ3Rh?=
 =?utf-8?B?V29pRGMrK29ZQWgyeVk3ZEVzaUZOQ1JIbnVVMyt6aG5HNTJyWllya01BaWRC?=
 =?utf-8?B?d0RiZmpWYzAvZUVBajFGTytEQzc5QkxMdjJydDRYM2krOFltd3FNcTB2QjdE?=
 =?utf-8?B?SGJzOWk1am1Pb0NVaVY4OGdDODU4YzJQbzVSN21lMFJJVzM5UVlScVlZVnVL?=
 =?utf-8?B?YXB1UlhQNnJqNkZEd3BLWGFvVENMM3VDcVVIVzE4WW9Ec2V0S0NRNXVDSDc5?=
 =?utf-8?B?bUxPV2xWbE9sbFV0YzlnZ1ZiOGhLN01yQTBRV1lhcDJsUmpadGFrWkxqVGhC?=
 =?utf-8?B?cjRHY29iQXhET2hMb0JlSHVDOE8yT3lnNnpCa3Q3djhkU1hoZk1MMytaRVk4?=
 =?utf-8?B?U1FIdWF2eEliMXNGK1R0WnlNaFRJRGdSZ0RHQjMyMGZQS1FLSlJ6Tk9SVFA5?=
 =?utf-8?B?aWNja3U5cUtPY3d4T2VuTTBWZFNkemJxK3AwWXQ3Sjl2aWFKcGhvN0Jkc0lq?=
 =?utf-8?B?eVByOEhzWHBDb0ZTeDhuOGcvOHY1dmd5eVh5eTZiWGU1ZTdLRUlsVnhxbVp6?=
 =?utf-8?B?cS9QRG5BeGJkRHJ3dW9QSnRlQmlvVWtwQnBGS0tPVTZuMGJqRlEyTTFtWFox?=
 =?utf-8?B?NzEwTU1QNlE1ZXpFRlBTVUcxYXZNaTV6aVY5UGRpU2xUSFoxVjU5anV3dHVJ?=
 =?utf-8?B?azdGN0ZmckRDRllVRmZrWHNhTkRNLysxamxGRWpyK0JKN2hSUmNHVnhpQ2Vq?=
 =?utf-8?Q?uGhbYKgvNJMqOEq9VCe9nzS0GbEg+4pmftohIkn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a02c29fe-50de-4ffa-5335-08d989c532e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 19:03:50.6658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGYkJiYSY/KbHUvQFMXd/1HJc+3qbd4ei5SMXYAJDQ09ex0znh9vnu+L9h5ywhGrvYwnsRnU2NpmcC4SyHEslJSqvcpwMoOXMfJVwVRy3hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5674
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
> Add logical engine mapping. This is required for split-frame, as
> workloads need to be placed on engines in a logically contiguous manner.
>
> v2:
>   (Daniel Vetter)
>    - Add kernel doc for new fields
> v3
>   (Tvrtko)
>    - Update comment for new logical_mask field
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 60 ++++++++++++++++---
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  7 +++
>   .../drm/i915/gt/intel_execlists_submission.c  |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 21 +------
>   5 files changed, 62 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 2ae57e4656a3..2eb798ad068b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -290,7 +290,8 @@ static void nop_irq_handler(struct intel_engine_cs *engine, u16 iir)
>   	GEM_DEBUG_WARN_ON(iir);
>   }
>   
> -static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
> +static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
> +			      u8 logical_instance)
>   {
>   	const struct engine_info *info = &intel_engines[id];
>   	struct drm_i915_private *i915 = gt->i915;
> @@ -335,6 +336,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
>   
>   	engine->class = info->class;
>   	engine->instance = info->instance;
> +	engine->logical_mask = BIT(logical_instance);
>   	__sprint_engine_name(engine);
>   
>   	engine->props.heartbeat_interval_ms =
> @@ -588,6 +590,37 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>   	return info->engine_mask;
>   }
>   
> +static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
> +				 u8 class, const u8 *map, u8 num_instances)
> +{
> +	int i, j;
> +	u8 current_logical_id = 0;
> +
> +	for (j = 0; j < num_instances; ++j) {
> +		for (i = 0; i < ARRAY_SIZE(intel_engines); ++i) {
> +			if (!HAS_ENGINE(gt, i) ||
> +			    intel_engines[i].class != class)
> +				continue;
> +
> +			if (intel_engines[i].instance == map[j]) {
> +				logical_ids[intel_engines[i].instance] =
> +					current_logical_id++;
> +				break;
> +			}
> +		}
> +	}
> +}
> +
> +static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
> +{
> +	int i;
> +	u8 map[MAX_ENGINE_INSTANCE + 1];
> +
> +	for (i = 0; i < MAX_ENGINE_INSTANCE + 1; ++i)
> +		map[i] = i;
> +	populate_logical_ids(gt, logical_ids, class, map, ARRAY_SIZE(map));
> +}
> +
>   /**
>    * intel_engines_init_mmio() - allocate and prepare the Engine Command Streamers
>    * @gt: pointer to struct intel_gt
> @@ -599,7 +632,8 @@ int intel_engines_init_mmio(struct intel_gt *gt)
>   	struct drm_i915_private *i915 = gt->i915;
>   	const unsigned int engine_mask = init_engine_mask(gt);
>   	unsigned int mask = 0;
> -	unsigned int i;
> +	unsigned int i, class;
> +	u8 logical_ids[MAX_ENGINE_INSTANCE + 1];
>   	int err;
>   
>   	drm_WARN_ON(&i915->drm, engine_mask == 0);
> @@ -609,15 +643,23 @@ int intel_engines_init_mmio(struct intel_gt *gt)
>   	if (i915_inject_probe_failure(i915))
>   		return -ENODEV;
>   
> -	for (i = 0; i < ARRAY_SIZE(intel_engines); i++) {
> -		if (!HAS_ENGINE(gt, i))
> -			continue;
> +	for (class = 0; class < MAX_ENGINE_CLASS + 1; ++class) {
> +		setup_logical_ids(gt, logical_ids, class);
>   
> -		err = intel_engine_setup(gt, i);
> -		if (err)
> -			goto cleanup;
> +		for (i = 0; i < ARRAY_SIZE(intel_engines); ++i) {
> +			u8 instance = intel_engines[i].instance;
> +
> +			if (intel_engines[i].class != class ||
> +			    !HAS_ENGINE(gt, i))
> +				continue;
>   
> -		mask |= BIT(i);
> +			err = intel_engine_setup(gt, i,
> +						 logical_ids[instance]);
> +			if (err)
> +				goto cleanup;
> +
> +			mask |= BIT(i);
> +		}
>   	}
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 5ae1207c363b..68010da468a4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -269,6 +269,13 @@ struct intel_engine_cs {
>   	unsigned int guc_id;
>   
>   	intel_engine_mask_t mask;
> +	/**
> +	 * @logical_mask: logical mask of engine, reported to user space via
> +	 * query IOCTL and used to communicate with the GuC in logical space.
> +	 * The logical instance of a physical engine can change based on product
> +	 * / fusing and defined in the bspec.
I would use 'and' rather than '/' when it line wraps like that. 
Otherwise, it looks like you tried to end the comment, but failed and 
then kept typing!

Also, not sure about 'and defined in the bspec'. I would just drop that 
line. I think 'based on product and fusing' is sufficient. Otherwise, 
you should be including the bspec link.

With that tweaked:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

John.

> +	 */
> +	intel_engine_mask_t logical_mask;
>   
>   	u8 class;
>   	u8 instance;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 7147fe80919e..5ed1e222c308 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3877,6 +3877,7 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   
>   		ve->siblings[ve->num_siblings++] = sibling;
>   		ve->base.mask |= sibling->mask;
> +		ve->base.logical_mask |= sibling->logical_mask;
>   
>   		/*
>   		 * All physical engines must be compatible for their emission
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 2c6ea64af7ec..621c893a009f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -176,7 +176,7 @@ static void guc_mapping_table_init(struct intel_gt *gt,
>   	for_each_engine(engine, gt, id) {
>   		u8 guc_class = engine_class_to_guc_class(engine->class);
>   
> -		system_info->mapping_table[guc_class][engine->instance] =
> +		system_info->mapping_table[guc_class][ilog2(engine->logical_mask)] =
>   			engine->instance;
>   	}
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 8b82da50c2bc..451d9ae861a6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1423,23 +1423,6 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
>   	return __guc_action_deregister_context(guc, guc_id);
>   }
>   
> -static intel_engine_mask_t adjust_engine_mask(u8 class, intel_engine_mask_t mask)
> -{
> -	switch (class) {
> -	case RENDER_CLASS:
> -		return mask >> RCS0;
> -	case VIDEO_ENHANCEMENT_CLASS:
> -		return mask >> VECS0;
> -	case VIDEO_DECODE_CLASS:
> -		return mask >> VCS0;
> -	case COPY_ENGINE_CLASS:
> -		return mask >> BCS0;
> -	default:
> -		MISSING_CASE(class);
> -		return 0;
> -	}
> -}
> -
>   static void guc_context_policy_init(struct intel_engine_cs *engine,
>   				    struct guc_lrc_desc *desc)
>   {
> @@ -1481,8 +1464,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   
>   	desc = __get_lrc_desc(guc, desc_idx);
>   	desc->engine_class = engine_class_to_guc_class(engine->class);
> -	desc->engine_submit_mask = adjust_engine_mask(engine->class,
> -						      engine->mask);
> +	desc->engine_submit_mask = engine->logical_mask;
>   	desc->hw_context_desc = ce->lrc.lrca;
>   	desc->priority = ce->guc_state.prio;
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> @@ -3271,6 +3253,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   		}
>   
>   		ve->base.mask |= sibling->mask;
> +		ve->base.logical_mask |= sibling->logical_mask;
>   
>   		if (n != 0 && ve->base.class != sibling->class) {
>   			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",

