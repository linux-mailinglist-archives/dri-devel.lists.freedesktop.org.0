Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663AC512434
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 23:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1596F10EA9F;
	Wed, 27 Apr 2022 21:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D3410E954;
 Wed, 27 Apr 2022 21:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651093325; x=1682629325;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aG1edwIJBPCjSiQMx1EL+XnsiJtbJwHAYUwpSkKwUpE=;
 b=b+/K3O4qk36P3OB4tAxNvL1+vq09PcVAN6lxnX2avnXrdK3cm7GK5Rtv
 n8xGJW1kZPmfSzKuHAzARjQbXufhMaJLOJI7u153FCrQICep3z1JMBrMJ
 iaqUG6xLWbUyiadLC7N86XPJ0+5OF2lCLtGYy7XUiI0x+iIyO6tuvibHY
 Ckf3SxGAiJUEcwdVzbRWycYwMhIX1lfsXiDh2CkJ2jX6e81Ryr3Ecy3w8
 yIrAQA0IdgaggZ3RaTfsg9FyvCJUt9LDLtBPlxvJCMPFCJknpxGt4IM3y
 G06eyEJ0duAfERwDiJhIUb04DD83lP34phyHGE8PtIU0j85Uz+Fiifd0A A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="253449857"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="253449857"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 14:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="559189059"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 27 Apr 2022 14:01:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 14:01:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 27 Apr 2022 14:01:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 27 Apr 2022 14:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzZobDGHed51jpqKmToitCyI1Vi6Kaqkxlf+i14tqsqBzV/3WTwJnc3uIWdS3WyDb9DJJ/jTtRatUIMvy8MG050c9gkksMJ9/Gi7EkdOZSRiLN92ARWfU1BT72ndeqqbpJu+0yxBiZshA2vzfNlcqGaaHB8O7VtmuwSkY7fL7sxIFbqXgAUbMDygZIJSnBYj52xhuztHoEKfoh0wYYAUP5pjftWfeJpxVgkpcyn+89b1RK6kv0SFzccH3Fub8q7/qMzY+1OJUksgKcW9WaFUSAIjPfXkqSIYWr8PVXmfNDUtcDcCwI8CwS/ZK3BKu7G3DMM5O3MdKftnaIUXmA6Pkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4QLf0TKQwZ96Sm5AmEvrDbP1qsjEA4mocvvzby4aO0=;
 b=HA2caClzRPwl2qURZlQA+4yMVABqa1/mcQzgWD5ozb647CvnXfnT2QtTffL4D/ZLg6ONVSwhE8H2Ce9MMA3Kb1x/E6sn34MADKc848tlTjJ/l6vAfmZLh8mDvWUtdsGEfnRrMyuCTitzXVCbhChv0UT9aRQHZjX+vc/cvyaNuoY4S9yVfAuk2WpqcHX9rmVlRNzY3rW5agd3EbNC2kz215rtytpFG3RaGwXFOI6TpIKXPZTMOSyafixHbsOutC/1i7xpS1mhXl30krUVIX1YRyb0zS9/bH/62oO5e9BORV2jIOfBuJeU3JEUDjAyfjqJ402AStSUuBFIJZERrHl51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 21:01:34 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::9da4:9883:37d0:7b77]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::9da4:9883:37d0:7b77%5]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 21:01:33 +0000
Message-ID: <516126dd-238e-89f8-1915-ae45d8284ddd@intel.com>
Date: Wed, 27 Apr 2022 14:01:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/4] drm/i915/huc: check HW directly for HuC auth status
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20220427002617.1767295-1-daniele.ceraolospurio@intel.com>
 <20220427002617.1767295-2-daniele.ceraolospurio@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220427002617.1767295-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:a03:333::9) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 347d32dc-6cf2-4d84-0843-08da28911c36
X-MS-TrafficTypeDiagnostic: SA2PR11MB5211:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SA2PR11MB5211A6A2B5BEF97418D457A1F4FA9@SA2PR11MB5211.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMaD4xY9GXUIJinXyWNUy8P5asv1F/cC4HTDlRICktngHwSaYk96b3ESeyix1sue1wJjSSjgotxwhoOdIJ/IKkp4OOPLxIxhb6DRs+M+6W1leYYXJrJgNkZ3B97FJWFnrFFwMIKyH4DluPEI0X9dkWd+Y81C1G41IIy+THVc3O31JnLe2K/bcw11o1SNutK/1o5Oxq7OALeVRYDs7yZPK8BG9A8mxJMoZjhB8iOGP10RdnWMNV18/rSuEY+TSCojSbPc0wqw4QVDK1V74sU6fz2BGsljRaHGPqOc48q9iogkQwJ7upgADO0bTNQXVmqxtd6gghvUJv82OaSEl3AYhnMhfGLCWdnI/CT80vITk443mn8HKeJXcjfXgMctznbBXcPR1J9E2gfFLnHKEpAVHu1qrUu/wpJQYLcZjmSqz6i7/lG7unuBB9z72TKVjyhh3UX/yUeMONe8GbWPflffwYp+R4qgJBfwWdeB+wBkqkO6CSaMAyzOF6YTZ+UPODjVDnUvPbmj09HNy4QbTDFPMlRKPsYK6ZrXJzQpZV/ZfQV7TjbVlKoaZlntb5F1vJpVsrDA8Ky/2VAtHuFe6coClSGOnFTESroSRxGBIogf1SyQCYfYLJ+pCoQ0aNTf7c+F70fVfZXC69I3XL0JeiN8zmfGHNTZW2xr9abLeaROvcnDHsE+wEhc96jLBu/e8A1ZnYZKqJ4TJYBrhxbWPkBRlmfSFDUh6BYCV/fxmKH9thdVpQ6730vK5OESKPbUeB97
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(83380400001)(316002)(6636002)(6506007)(53546011)(4326008)(8936002)(31686004)(2906002)(450100002)(66946007)(86362001)(31696002)(36756003)(38100700002)(66556008)(66476007)(8676002)(6862004)(6486002)(508600001)(6512007)(26005)(37006003)(2616005)(186003)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVVSdnBsZlFEMWx1NklpOGptdFVNeks1bjJRMlQ4MlZJWWlCUUpjUXpISWZp?=
 =?utf-8?B?NlRsTlRESUFWbVVmQTlpU0hhUlRkVGhVM0ZpamNzbVZZZm9EWmFoUUw1Z2Nr?=
 =?utf-8?B?cVZsM2dCSVhQQVI4dTF2QmJQazEzbXlTR2d1SkF5WVJRdnRTbTNaUW45OWVm?=
 =?utf-8?B?d2c2MXBMenBtOUd0VGFlQVVaZ0t6N2NLVzRVNnpWTVF6Nk0wcWRRQXN2L0tr?=
 =?utf-8?B?cklxb2wzMDQ1R3Z0TDBRV014eXIydDBxd2NwOUUyMXZ4VGF4djE2ZXRXczk3?=
 =?utf-8?B?MG9UU3Z6VEJHQXJONUVHREh6b1lsRklxU3RtSnhuR3h4Smh0Y0NPRjVabFBD?=
 =?utf-8?B?V25uUnNWNGZOK0NZcW1nT1hmZ0NXSEZFY3VBQTdYdDczdWs4V0JyajR1RzUw?=
 =?utf-8?B?RmlidFcxanRmNGVML01EMVJBb1JXWHVVb0tmWTJabkJsRDhEdUhvNE9TVTl1?=
 =?utf-8?B?c1NsTVJGUUllT21BSWFwUktnTUFoWXpnNlh4bWNWczBwMDdaMWRDdkh6L3Vm?=
 =?utf-8?B?UmQwZFZHdyt0NDNCSno5TFNodXgxVm1pOHR2cm5zTE9QYUhycDN2RzE2b05s?=
 =?utf-8?B?L1VYU1F4alM3aGJsbEZSQlR5dmp5MjlQK1UxWXFxVHdPNXE1SzhBaHR5Y2dx?=
 =?utf-8?B?SER3SWVZUmdwWlZBWkJEU2RObTZtc2lZbVdxOHVzaFhnei8rN2RjODRudUhL?=
 =?utf-8?B?V0EvKzIrR1p6UzU4a2ZVOTFSeUw3ZTVMbzVDT210czJtY1IzaEo3SlNsdnBE?=
 =?utf-8?B?TkNIQkZsS0haL2V5VUIwUG9RQWJoZVBVWlFyVnF6QTJFS3kwU2dialBKa3dT?=
 =?utf-8?B?U2tNdzUxbExRWkZHQTg1QW9LQk9qVzUwdjlwZmVSNTFVdG9naTNKNXl3S0Q0?=
 =?utf-8?B?eE1weXkyWnVLaVhnWGlIdTZmTW5nbXBDL1VlVThWbUF4aUR4NE5nYksyTjZw?=
 =?utf-8?B?RFAyWEFNaVd2Z1VPY0R1YkpOSlBsclVPMXN5UmNDa0U3YjM1a3BWeEszRm9M?=
 =?utf-8?B?VEFtTWpyS2psZ3RBbXpQSDNNZTZ5alo1WGZhZjBxcUlub3NHTmRNOUtRWVBF?=
 =?utf-8?B?Y1V1MTJJU1pjQ2R0d3pqdjJSOTRkVFlJdHhpV2RBbFFWM1R5UnFYdzdYVjVU?=
 =?utf-8?B?Zk41cEIzV051UHFnTEN2TUNJbVl3UGxjdFFwZzJ2SmZ4b1ZvdGMxNzRYOUtt?=
 =?utf-8?B?ZVNjVnNNMXMvRCtBM1NIeGM5N24xV3dwZUxrQ1UyWmk0NlN1Q1NYVE40c2ph?=
 =?utf-8?B?S29sMEpFRFJ3T2s2bXIxZWF3dHlmUUFkYmdMbjRyNHU5QzBSMVd3eUt1NHZz?=
 =?utf-8?B?T09CR21NOTZSeFlsUE5oM0U5cDY4OE1ESkdZUkpob1k5OHp4cEN4VGpOWUdP?=
 =?utf-8?B?Q2ZhbTFiMGNLRlIxQ0t1WTJ5NCtHT3I3Z3JhM21yNUxqandwMk5IWldWeDJI?=
 =?utf-8?B?MjVLWnNYMG10MFFvTG5YYXZqaDdQSkdITzZNU1BkMDBXTTJUSDd6MUsxa2E5?=
 =?utf-8?B?Z2c3aGE0VlpWTkRnU1N2WGl4MXJkNUJTclZDRmkxdXNvNXRLWFZicGtwaUVU?=
 =?utf-8?B?N3lZMUQ3Ui9hQmhHODJvUURnWGkvQk9aelgyRHN5RnBteldyRjllUzk1UFBE?=
 =?utf-8?B?OGFkVHJ5YjJac3AyKzFnM0VoYzlHeFZCVTV1ZWFFcElCS0xnSHlaZHpQcjBn?=
 =?utf-8?B?QzhNM1FVYVRHZS9pMUZzYzE3NFR6bVc0RG9jR0NXaVNHMDB0eGJmMkM5U0Zj?=
 =?utf-8?B?MXU4QmVZUVdNSTRDTmd5U3pOeW9jaU1ZQWt5c2NNNVU5WkMvdUIvTDVRaWlq?=
 =?utf-8?B?am5SSmNrY0FER0VOWmczdzlaMitaWUZ6QzgrMGlzdkVjVUZPTDh6VlZBU2gz?=
 =?utf-8?B?NHdUTS9wMDRDMUJqZVFoYWlOaGlkckZWMWRZY0N6dk5OTHIrd3AveGJ0QXhu?=
 =?utf-8?B?OTBTeDJOaS8wUzA1MVVDY2JhRFZ3bFRVRUlOM1Z5Qk1OVjFrSU81SXYzb1dN?=
 =?utf-8?B?TmJRS28zMGgzcmlUYmY3Sk4yVmhwTXQ0SFpHbVd5eUhmUzR6SUE3RnYwUktU?=
 =?utf-8?B?ZklFM1NaMG9TZnlhM202OU05U0NFWHZqSHNWZ0hIcnVkalBpM2lQbGFsWmlz?=
 =?utf-8?B?eUwrSWNDNWdZcldiRXB4L3pLSlpVd1p6OEg2OXlDNUdrbGpYaytHMFkvemcz?=
 =?utf-8?B?ZzgyLzk4aUh0bWF4M1JaMlJtR21mMHU1aGgrRWhYZ2JvTEV0azI3ZDhpdmh1?=
 =?utf-8?B?Uk4xeU1ENjRRUFA1Z1NiMW1RS2xaWGNWUzJBN1ZtL2NEckw2UTBjeTQzL0ds?=
 =?utf-8?B?RnpJVEsvOUVHeWZsS0JhakE3aDZickEvcmRkcmN6ZnF2YzFDREl2NVFKNWt6?=
 =?utf-8?Q?ODjvzRjQI03nxENJnlzgI4cOw/OblErEQKNfz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 347d32dc-6cf2-4d84-0843-08da28911c36
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 21:01:33.8611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+0HD/O5wzFFREng6GHos5dzllMchbUGSMN+8p5uWPB79+MXolguPD4YT2gXWUF4gtfxXGizeGzPeSUXohQs0bCqRbcZX+ne4z/YuRW8KQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/26/2022 5:26 PM, Daniele Ceraolo Spurio wrote:
> The huc_is_authenticated function return is based on our SW tracking of
> the HuC auth status. However, around suspend/resume and reset this can
> go out of sync with the actual HW state, which is why we use
> huc_check_state() to look at the actual HW state. Instead of having this
> duality, just make huc_is_authenticated() return the HW state and use it
> everywhere we need to know if HuC is running.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 23 ++++++++++++++---------
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h |  5 -----
>   2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 556829de9c172..773020e69589a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -80,6 +80,18 @@ void intel_huc_fini(struct intel_huc *huc)
>   	intel_uc_fw_fini(&huc->fw);
>   }
>   
> +static bool huc_is_authenticated(struct intel_huc *huc)
> +{
> +	struct intel_gt *gt = huc_to_gt(huc);
> +	intel_wakeref_t wakeref;
> +	u32 status = 0;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +		status = intel_uncore_read(gt->uncore, huc->status.reg);
> +
> +	return (status & huc->status.mask) == huc->status.value;
> +}
> +
>   /**
>    * intel_huc_auth() - Authenticate HuC uCode
>    * @huc: intel_huc structure
> @@ -96,7 +108,7 @@ int intel_huc_auth(struct intel_huc *huc)
>   	struct intel_guc *guc = &gt->uc.guc;
>   	int ret;
>   
> -	GEM_BUG_ON(intel_huc_is_authenticated(huc));
> +	GEM_BUG_ON(huc_is_authenticated(huc));

It looks like even on gen9 HuC is surviving the reset, so this BUG_ON is 
now being triggered. I'm going to just change this to a BUG_ON on 
intel_uc_fw_is_running() for now, which would be equivalent to what we 
have right now, and in the meantime I'll follow up with the HuC team to 
see if we can just skip this (and the huc_fw_upload) if HuC shows up as 
already authenticated.

Daniele

>   
>   	if (!intel_uc_fw_is_loaded(&huc->fw))
>   		return -ENOEXEC;
> @@ -150,10 +162,6 @@ int intel_huc_auth(struct intel_huc *huc)
>    */
>   int intel_huc_check_status(struct intel_huc *huc)
>   {
> -	struct intel_gt *gt = huc_to_gt(huc);
> -	intel_wakeref_t wakeref;
> -	u32 status = 0;
> -
>   	switch (__intel_uc_fw_status(&huc->fw)) {
>   	case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
>   		return -ENODEV;
> @@ -167,10 +175,7 @@ int intel_huc_check_status(struct intel_huc *huc)
>   		break;
>   	}
>   
> -	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		status = intel_uncore_read(gt->uncore, huc->status.reg);
> -
> -	return (status & huc->status.mask) == huc->status.value;
> +	return huc_is_authenticated(huc);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 73ec670800f2b..77d813840d76c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -50,11 +50,6 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
>   	return intel_uc_fw_is_available(&huc->fw);
>   }
>   
> -static inline bool intel_huc_is_authenticated(struct intel_huc *huc)
> -{
> -	return intel_uc_fw_is_running(&huc->fw);
> -}
> -
>   void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
>   
>   #endif

