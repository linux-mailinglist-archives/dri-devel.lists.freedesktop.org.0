Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149ED716F5E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 23:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D569210E431;
	Tue, 30 May 2023 21:07:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DA410E431;
 Tue, 30 May 2023 21:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685480822; x=1717016822;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5V6MGLBAebLHLbkcHpAF0OltNtfK0ykFzz6nHayL3k8=;
 b=eNAIR1e9DdM6xAN7zvpAA+3m1LUzdwLBzdnm/mtS7v/kVAN6oKvTh/kW
 IUiNxZXVudpt+vqear4MoMuLwVFS5qCKmwe7mJlEQP8QyuXWXW2ceWe+t
 5+kAq7ovzqGd71IKTi4EBQRK37caJWvL5tRUJW2EJXbx2J8QqPXQqS8Sp
 l7pFdRZe1Qj4GBWenpVNMRRi6jSQMffNjRP0jtQ+g0OzosSQocF0ohYOV
 g+D8QXLtT782scP6G8y0s4rDFblB+O2Z2H+udxIxkA64KG7QQOxjje1Ad
 R+pi4yy/cz0g4R9MxVF1iuReBkAZV23NH7Axpq036vKRVk7XQMNxV9xi5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353891436"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="353891436"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="1036753696"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="1036753696"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 30 May 2023 14:07:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 14:07:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 14:07:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 14:07:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 14:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgr1Tvl7tDNHIFedDw6hkpKqE2lB+MsiNmtEh5nWX55rGSXTDRse+nOozyg2erhGrlkkBauUVFP1GkwqiY849kLu85eoLcLQ4yzfmES/0zT1TDhMM1vH+RJukwDhQrav2D4baJRrvWuSddgfU0VGbn5oWeBlB9dPdpXLxxEYxms1zugxBpED/xqFCzXNw6n13t8i1rZjJbD4gcWNYQWFhp7mGf0/G3eVMk1TrNianWTc3aHVi1yecsgKSe0yZBpV1/tkFK5D9jaOeDZXTgaquKEMhr4dzvkO3QpEsj4rzVKpsZdLW90T/2YFfyV/Kz03ToaynY0MXu7cxBJEsog5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HX3JFrH4jmr2MIerYRaIXxkBbgHcUTmVzGPkTm+2gM=;
 b=mTl27kCW9YJoIS3ZfSObv7BXPyIWXtEhgTbZoHoBfCT9DODX5YQDCQ5Hyn9Ty0qi41ryo/FPxTOlqOYq8NY7oS0g35iqOR3y+mTH8Oh4Pz323tS7ZkMSIKP8Hgcx994ljylV7Q3Voncdo0JVa4ZcTvCCgqE8DxvHgJmguJXyTvIEx4tp6yc/8N31vgIpVbT7TCyGjHj+BzO07qhGSgSos6UIeXFwdQfgFLAOcEeGcpeo7p81RL6RJhFJhhqPTwzO+6MiVW76lKyJhmEWUYFmNuwGh51uaETCMGZu4g4VzJk8yPa2Z5mR3omatIEtaajMFQjuAuCLxfiWxJ7MS92Ovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 21:06:59 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 21:06:59 +0000
Message-ID: <d0c32075-f2fe-1c0f-3338-5343315eaeeb@intel.com>
Date: Tue, 30 May 2023 14:06:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH 3/3] drm/i915/guc: Track all sent actions to GuC
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
 <20230526235538.2230780-4-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230526235538.2230780-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 986673ee-ddf2-4596-e52d-08db6151ce9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jQGsBqON1rWA6cxfa0nuKqT8YJLy6pK6CaYBEGZj+BxD5OKGWAxmKOUcsgE+p5wwmB/38V+2KayYcYh8UjyA31SEfpGYEd4OeimCE/fIvFZzdsB76Yxbm7XhYkaR7/uwNvnJfY5Ot02jxutWdUXkHymERWQm/2ATsmYHhYk0foHaoi+iMr000ovq3E8OLPHyd8aWRxb4ueFMWXBI9KdCEZPXkZgbMUg+6Hblz62Vn8urLkS++7SP6fYuom3k30PSMzTBabQaM2uKd3GBa9kRFx2l/3AbPtC+gV/aZfgLUqChtzJFFtCOqfx5GiSH8e8MLxSqAUKXZGeufM+v7zM5HpCPF/ug76nBtLvJWdEtBtnNKXZU17dEadcayErvyzvFAVGrsCJCxTT5GsfwaRywjipG49pZOdmsbL971I/88JaYS+fgVvXUnxmxWYd0rFNde65AefMcxbrtS8uVpUSskpbH6upoKU6UclNe+rpKJs3Ki1WTufiqVKouJC2jq7/JnOGai2Zu0bGvO4Fe4peZTNkRRNj6DUjBXwAqJ/yLkJEB+sEdN91bowqQDctyyrUlP1t5BKqTKkIA8VBuijrALvG7ewAzosD0wgX3BKs2EKWzF4iwKWnn9vM81qURtfM7r1PnCtYRb7mPYJKhPZBqmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(31696002)(86362001)(41300700001)(6486002)(4326008)(6916009)(6666004)(316002)(450100002)(66556008)(66476007)(36756003)(66946007)(5660300002)(186003)(2616005)(2906002)(6506007)(53546011)(6512007)(31686004)(26005)(83380400001)(38100700002)(107886003)(478600001)(8936002)(8676002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3dlM1dKV1dXUzRkNlZVTmdsNmVRVUZ2d3N3ZURndWFVdHZBMFgraGYxUTJC?=
 =?utf-8?B?SGRhTXFtVE1seDVXa2lXSnJuRFcxVi9uVjgrcVViWGJiUllRQm1OaEg2OEY4?=
 =?utf-8?B?N2lEWTRrRjFPWm4rT0srSUZMTmVHWnVXOVFYN1A3U3FFK1JHM3NtY1Q3ajMz?=
 =?utf-8?B?cGNJUDVhT2pId3ZLdGZqZ2d0OURMK2FTSVRjMlA1SFlHZmQyaXdQL0FzZU5U?=
 =?utf-8?B?VHhsQ0puaUpOZTRQOGNwRDBaR2sycjArVERzMFpQMnYzRzhPZGVnUGxHN05w?=
 =?utf-8?B?Y3NpclBJM2pYYllwMk5aWG4yQUVMeDNNbjNEcVREeFFna1E4VGJ2TWMybFR4?=
 =?utf-8?B?aitIQllrZ1NiakxIMmZYalF4MXJZQ2FINEg5eE83SDdLOEQzb0V0ejJBbjh3?=
 =?utf-8?B?VDhPNGlSbXNhWlVBQS9VYTNQNm9jK0czMjQ3NXduU2VNUE9GTUpYTWxRME5q?=
 =?utf-8?B?Q2pCV0JvTzBONmNYYlBmZzZwVitIb3ZsaHptZGppcStSRzlzY0hVMFg0a0Ni?=
 =?utf-8?B?L2xncEZJUEVsYlNIY2NpZk1kNUNTSHMvOWdRc2JoMnJXbmF6UXVhbFBQcmlD?=
 =?utf-8?B?NXk0MGpJZkxUUTl3dHJaak0xcGp4T0VEUlBWdUJ0WThKVE1BOHBJOFJ1bEVt?=
 =?utf-8?B?SlNDVkRnVFEvdW8wREVLa0ZJSGlGR0YrUzJHRkw2VFJaZFRkRzA4NExmYUVo?=
 =?utf-8?B?RGdjNEdwVENobVk1dkRudGJKSlFIREphVTMxTFhlRkwveEVYUXMvWTRFZUVv?=
 =?utf-8?B?clFUdzJ0Rkh2Z2lacEV3Ukl3bVUxZnFPa0NOMlE3eTNPNUtDRUp1ckxFUlZx?=
 =?utf-8?B?MUZVa1F0d1pacGVKZ0FyWEppZzNYcDNBSndETko0Um1JMkx4c0ZEOWtxSVJv?=
 =?utf-8?B?azkrMVVaTWFXRjYxcGtpRUdyZFZOS0tOOG1HdVZUT21KeHRja3ZiZWlBbmFL?=
 =?utf-8?B?K3FNVkttbXNWbFNsVU1UWld3Q2NwRFhoQ2VTU3orUjVKeXc4cEdUK3RGbGQw?=
 =?utf-8?B?cnY0bGFxSDJ1L0ovNmowVzZiakNWakhyTUpNUTdOaEUwNW5nWmE3NktzaXJE?=
 =?utf-8?B?a1pMZkVUM0dzdDdMMXJnSXpkOHpVQ2s2UWJmTXlScllHbEtsOEpubFpmc2VY?=
 =?utf-8?B?bnFXYnQ3RFF6ZUpCQms5di9tQXpROTJkN2JtcGY3WlkvTWtxa3RZbmxyRFdh?=
 =?utf-8?B?amdkRXlyckhMR0hQdHRld2VUMXBBaGZrZDl1WDVjdmtHQWRMYSt5YXdNVW5R?=
 =?utf-8?B?YkFEVkZ2emZkSzlLdmd1eGEzU1dWcUJ6V2ZIdHJzR0VZUmZHalprRGNxSjd3?=
 =?utf-8?B?RkV1SUh1VEV2UnNNZzc2YzJUWHZlRkNPRmZHdXdGVUVzelBwNHZWTUl3dWRr?=
 =?utf-8?B?dFdTck5LT3V4SXl0T1NyUkRURkRjbnJZai9FT3FUUTdXQ1JpS0Z2eXBxYzdG?=
 =?utf-8?B?amhpY2FUWWxVRVY3citHeC9VWG5zUzNqa0FPd21Kd200Z0JHSzhMVnRZeTIz?=
 =?utf-8?B?NDB4YlBYb0NJSUJQenpueDhUTkgwRWR0cWRXOW44QlFuSmlNZnBkQ1RyQVk1?=
 =?utf-8?B?RE9XYW01NmFnak0vTDBRMkIwSlpyVVVGeWJRNXRtQjUydkJNeWMwV3NxRmV1?=
 =?utf-8?B?U0dIRjc0OStyclVXTGRaU0hoc1VmVVdENEE5ZGJReVNoMGQ1eXc2M2VjZlJD?=
 =?utf-8?B?SEdKbXNKcXoxZHFHdzZoLzN6b05lbk8rcnArTG45KzhvNUh3bU04Nyt6N1ZZ?=
 =?utf-8?B?V0d5TXN4NFBJN2lxbjc0M2J2SWtFYmtqa3ZEWjJ1ZmlDanRnMEpKWUFPMWdi?=
 =?utf-8?B?WmhUdUYyMmdUbmp1TDNudWxRclFzN0NaRzBJY3NrQ3JyYkVGN3hXTmFsZ2Fw?=
 =?utf-8?B?dHFndUphWjJLb29nOVBscUtuK3NKMTdKb0VScXFpdndvYTZLWGJRekdaOFdy?=
 =?utf-8?B?OCtBaWZ2QXhxemxuaWdYUDNCbVpoTWttclNwa3poT2VyNlMzejdHNzN6SkVD?=
 =?utf-8?B?KzZIYm1lQVRtNTJjS2txaENXdXZrUWNETEhPUmRYakR5VFhLcktrOG5LNVNh?=
 =?utf-8?B?c1dqR1JFK0lsaWxIUlk4S2xqWDN1YzNWMCtXQnhiKzRxV0RGZGVhb3F2eHIv?=
 =?utf-8?B?MllpQ3J2N0NLbm54WkFIbGVzQVVac2hOMklFTE41MWFGdklicUs1dUd0RHFK?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 986673ee-ddf2-4596-e52d-08db6151ce9c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 21:06:59.1143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4F5OL7cZy/aSUULuwtUKhqTUjdtDuWO5pGsheX0OwK4uY9B5CCvBIkP83gX7U+KKF2B3xSsAEDtqoDfMo3xPLY7efM9jZVEHoMMV9M3Gqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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
Cc: DRI-Devel@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/26/2023 16:55, John.C.Harrison@Intel.com wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> For easier debug of any unexpected error responses from GuC that
> might be related to non-blocking fast requests, track action code (and
> stack if under DEBUG_GUC config) for every H2G request.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/Kconfig.debug        |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 68 ++++++++++++++++++++++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h | 11 ++++
>   3 files changed, 77 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> index 47e845353ffad..2d21930d55015 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -157,6 +157,7 @@ config DRM_I915_SW_FENCE_CHECK_DAG
>   config DRM_I915_DEBUG_GUC
>   	bool "Enable additional driver debugging for GuC"
>   	depends on DRM_I915
> +	select STACKDEPOT
>   	default n
>   	help
>   	  Choose this option to turn on extra driver debugging that may affect
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 3a71bb582089e..4aa903be1317b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -376,6 +376,24 @@ void intel_guc_ct_disable(struct intel_guc_ct *ct)
>   	}
>   }
>   
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> +static void ct_track_lost_and_found(struct intel_guc_ct *ct, u32 fence, u32 action)
> +{
> +	unsigned int lost = fence % ARRAY_SIZE(ct->requests.lost_and_found);
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +	unsigned long entries[SZ_32];
> +	unsigned int n;
> +
> +	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
> +
> +	/* May be called under spinlock, so avoid sleeping */
> +	ct->requests.lost_and_found[lost].stack = stack_depot_save(entries, n, GFP_NOWAIT);
> +#endif
> +	ct->requests.lost_and_found[lost].fence = fence;
> +	ct->requests.lost_and_found[lost].action = action;
> +}
> +#endif
> +
>   static u32 ct_get_next_fence(struct intel_guc_ct *ct)
>   {
>   	/* For now it's trivial */
> @@ -447,6 +465,11 @@ static int ct_write(struct intel_guc_ct *ct,
>   	}
>   	GEM_BUG_ON(tail > size);
>   
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> +	ct_track_lost_and_found(ct, fence,
> +				FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
> +#endif
> +
>   	/*
>   	 * make sure H2G buffer update and LRC tail update (if this triggering a
>   	 * submission) are visible before updating the descriptor tail
> @@ -953,6 +976,43 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>   	return -EPIPE;
>   }
>   
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> +static bool ct_check_lost_and_found(struct intel_guc_ct *ct, u32 fence)
> +{
> +	unsigned int n;
> +	char *buf = NULL;
> +	bool found = false;
> +
> +	lockdep_assert_held(&ct->requests.lock);
> +
> +	for (n = 0; n < ARRAY_SIZE(ct->requests.lost_and_found); n++) {
> +		if (ct->requests.lost_and_found[n].fence != fence)
> +			continue;
> +		found = true;
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +		buf = kmalloc(SZ_4K, GFP_NOWAIT);
> +		if (buf && stack_depot_snprint(ct->requests.lost_and_found[n].stack,
> +					       buf, SZ_4K, 0)) {
> +			CT_ERROR(ct, "Fence %u was used by action %#04x sent at\n%s",
> +				 fence, ct->requests.lost_and_found[n].action, buf);
> +			break;
> +		}
> +#endif
> +		CT_ERROR(ct, "Fence %u was used by action %#04x\n",
> +			 fence, ct->requests.lost_and_found[n].action);
> +		break;
> +	}
> +	kfree(buf);
> +	return found;
> +}
> +#else
> +static bool ct_check_lost_and_found(struct intel_guc_ct *ct, u32 fence)
> +{
> +	return false;
> +}
> +#endif
> +
>   static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *response)
>   {
>   	u32 len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, response->msg[0]);
> @@ -996,9 +1056,11 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>   	if (!found) {
>   		CT_ERROR(ct, "Unsolicited response message: len %u, data %#x (fence %u, last %u)\n",
>   			 len, hxg[0], fence, ct->requests.last_fence);
> -		list_for_each_entry(req, &ct->requests.pending, link)
> -			CT_ERROR(ct, "request %u awaits response\n",
> -				 req->fence);
> +		if (!ct_check_lost_and_found(ct, fence)) {
> +			list_for_each_entry(req, &ct->requests.pending, link)
> +				CT_ERROR(ct, "request %u awaits response\n",
> +					 req->fence);
> +		}
>   		err = -ENOKEY;
>   	}
>   	spin_unlock_irqrestore(&ct->requests.lock, flags);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index 818415b64f4d1..58e42901ff498 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/interrupt.h>
>   #include <linux/spinlock.h>
> +#include <linux/stackdepot.h>
>   #include <linux/workqueue.h>
>   #include <linux/ktime.h>
>   #include <linux/wait.h>
> @@ -81,6 +82,16 @@ struct intel_guc_ct {
>   
>   		struct list_head incoming; /* incoming requests */
>   		struct work_struct worker; /* handler for incoming requests */
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> +		struct {
> +			u16 fence;
> +			u16 action;
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +			depot_stack_handle_t stack;
> +#endif
> +		} lost_and_found[SZ_16];
> +#endif
>   	} requests;
>   
>   	/** @stall_time: time of first time a CTB submission is stalled */

