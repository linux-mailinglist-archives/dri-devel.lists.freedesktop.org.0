Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF363F7F74
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 02:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C9E6E44D;
	Thu, 26 Aug 2021 00:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737AF6E44D;
 Thu, 26 Aug 2021 00:50:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="281355545"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="281355545"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 17:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="474020840"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 25 Aug 2021 17:50:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 17:50:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 17:50:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 25 Aug 2021 17:50:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 17:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXH4Thsor8yKPTveDT4QwIroXJ5s8GYt4KYyrtbx4xqU8kP8Gmtu862d3IjFIhGiAboiGuiPVXcvQ/jP7iIzPySJFhiPitceJSkWo0osJOUFExKLijHFK/jSyqc3oJrNo8lbCpp9BuBxq/k8Q6sgh+d6XEg6qfTN/WOgdzjkQXsFFy2ddlCaUevmclmIx2XTHWcDz71DZahUnH3NVT0EioY56AwGKc5SG8PjZQKl2gjmI2KIqTGmBdlYxbrRRvdLLqhO8huakUgdgicHdB5zcRryXoOJv9gw8OisrWH7SPjw/4CGvsK/5iC8PJsIklln1GuzATgpW8QbzOWUcS9rFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeplyxSNnB3bSIU4WGSFkZbZPPE0yB7spEcu/PfjBkI=;
 b=XrxkMna+ivhxxcPU+K2elEcb/MGXE6jtfR3A50n5bkpPtS9iHMDu2GoSjjcLpYrpYiNR0WP7QQSTsRuWRovEKqIL2GzncHoVr4eY/Gmo3KfqoWNBPa2Wg/Z8cgczj/2LadZ+sAz9dUrMWg+9u7zaptFwPS6Dv5SHHgvH++cIWTgTzQopGRdOI2CC9jFZgkpI5PuuhCSwnaQDCTLWaCCAxa/ezWjDw+ImCLzp73T27lpURbktqFsnvNveZowX4ntNMKEsLUZVxXSkqWdBbaLh0HUFFM+8d8ZaEdIlE1gniEkX9RaQAhCRJPtkIQqADR3gcxqlNE+G0JaRpa6sm2OvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeplyxSNnB3bSIU4WGSFkZbZPPE0yB7spEcu/PfjBkI=;
 b=IJ/Nu0fBHGtGemU501VlEmEqkubdZWmfZ9jsjHTZ69Po+hUu1BzKh2DN1Nc3kKa0lPTP2MKGTneVoPPxgvydE3Pmw/FaSq7SKM0xra5XaNJsFkt9h25kwHQLJR4GbOM8Wxqtehn3wqbP+k6FGv2ws6yNGI5QH2LWoBVE6DBgrLY=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM8PR11MB5701.namprd11.prod.outlook.com (2603:10b6:8:20::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.24; Thu, 26 Aug 2021 00:50:27 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 00:50:27 +0000
Subject: Re: [PATCH 22/27] drm/i915/guc: Drop pin count check trick between
 sched_disable and re-pin
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-23-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <884337fb-191e-ee9c-9f65-3b601eb3c97d@intel.com>
Date: Wed, 25 Aug 2021 17:50:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-23-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR03CA0390.namprd03.prod.outlook.com (2603:10b6:a03:3a1::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Thu, 26 Aug 2021 00:50:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 273085ba-e64e-41fd-07e0-08d9682b7ecf
X-MS-TrafficTypeDiagnostic: DM8PR11MB5701:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR11MB570122E102475B9852487F01F4C79@DM8PR11MB5701.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nfl8UsC4k+q9Mndg6g8e4wLeUefKh5p0Y2J1RArjq2p3yCwM1oPHm20OyRgLnE7OsRgt+7VouZQroWbYrEviDgTr8hFeRpladWAX+RbpnWk5EzAgjxihGmXg3TmsTWp+rzej/CN8JtmzrNlgZ9EH31FDszXAVKRK/UsmX4Ea9IrXRaygullKOkgRwY81BBaUh64Jg3ESATzVaGOhGTmi/HB+t2CwabcOuUOYgm/LzMjNZ/BvsgQ5F///KeZZEhiE3NoODaMaZuQKXYCjXhxVaNh89V9HBJqvZTf2EbyzUsTeyuvf6/2c3E40HE/m9KAbJARYZrjr9+d3jzvlhfMfV39Bg6ONvLhVjyPE3l+mQCgxzvfdSW6omO3NJELXiZ4FiN2wycRdz0DYvVcol6Xicx7MVlc9rcvkYtK5OngdVmcZ+rEMwVeM/H/sw710VczvNyMfUhZeijWSMPGhMkWIVLFGpU66xb+xS4iLZouHpiUnLbTP/7/pFpjnAXCO83b7tYGITsdkX401rNlftB8OyFoWiftso1UYc1kyxnBiMbv8KJtIyG0Kd4eovtQaDqrtLcXt/lGkWAMol+BYoLMoXqoLYb2m0uTwCgb0v/5rYOgr9Vo+6keKBmRvpkTgQ+uZiDp00l9nlzMB8NPwje9OC6hv/hiTPjmQZHfMoysx8t4fgbe0pvOxDHMGLRvRNiMe5wcBeDzDm3yqsFU0lAlCdj5tAGwDxGmoMmBvuoNLc+k7vrgryp8WjSxMiCc3/qiXQTmpKnXOBlIrqjngVEfxVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(186003)(8936002)(16576012)(4326008)(31696002)(31686004)(316002)(66946007)(8676002)(38100700002)(66476007)(478600001)(66556008)(26005)(2616005)(956004)(2906002)(86362001)(53546011)(5660300002)(83380400001)(36756003)(6486002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWR2d1ZuMTd4S0I4SzRpTzdaUVg0YmFQSXpWYkJOaVQya3VqU29CYXpLL0xs?=
 =?utf-8?B?VHBGcmIwZWNRZ09saTkyZmJsUG5OWExZdFl5V2dzVk8xcWtTZG0rMFhxUStL?=
 =?utf-8?B?N0U0UjZrTVNtZU5OV1UwTWhHY1Fta1poc1RTRHhzU2VOUzJtcmd6SFhCdDlL?=
 =?utf-8?B?MVA2ZlFiK20vYkFqYU9BMHVmRjFDcWtsU1dlZ3hZK3Y2dmkzbFFyTXNwUVVt?=
 =?utf-8?B?S2xxNEV6dTFVaHFLMHk3M0kxQm0wNVRObEQ1SlNocHZCVTZzeEFvQ1F2Y0dW?=
 =?utf-8?B?K3hEUVB1bENRWUZ5d3VNWEdRLzE0UTF6VTBnTEZIMkoyaTdPeHE1eU10Vm5N?=
 =?utf-8?B?UWl2WHF4cGNhMm1LNEZSODhUQnhoTXpYZE1ZcEppcnc3bkExbjM0ZFlOOXdB?=
 =?utf-8?B?dzZoVDhFa3BEZUJTSEV0QXRGOXlxNzZmN0gzcXEvYzFXT3gvcHVIVnBGMThn?=
 =?utf-8?B?bWpRRTRQQmpkYitzYTg0cGtjNVp2SkZPbjgyaUJOTmhaZzlDMk0rV2Rwazly?=
 =?utf-8?B?UWdrRkh6RGV4NEdFSlg3MWZ6TW9vQ3VWLzZueEhsc3RHeHNTUmlncFZwaDRj?=
 =?utf-8?B?dkhsQ0VCUXpieC9TVUo4d3FuSU9tWDFBWkczdTdScm5NVUJqYm9IV242QmM3?=
 =?utf-8?B?R2RmZ1d0YldBUkkxY1JMdC82T2pJOUNubDlOQUlGZGJSdGNHOTBPbFQxeTlk?=
 =?utf-8?B?SExCQ1pPemY0MWJKUkluTHlRWkZuM3VwT0lVQWNsSExsUzhxS2t1MXhZTW9T?=
 =?utf-8?B?RlhHMmZwQTE1bUs3d1QyL2l1VlMrUU5VYy9BMTFVVS9QelQrWWkrUFF2SFFX?=
 =?utf-8?B?ZUYwK2JaYzZyQVk3QlFFZWhWNkNiWVllNnFHSXlWTy8rTFFqOTJ2eXdDOE1V?=
 =?utf-8?B?RWpVbXVCYjhGUUxFYk95VUVoRlBydmg1SXhqVmkrczVuc3hNU3Z2Wkx5YXNH?=
 =?utf-8?B?MFRVeXVHZ0UyVHR2anJMb3JBZ1FjTC9HS3V3bk9DcU1acUt5VFpsdlNUVWJ4?=
 =?utf-8?B?ZnZHaXczWkJDSjNTclkzamZ2NEs4ZWR5Wk0vRlZETHBwelpWYjZuZHpOeTho?=
 =?utf-8?B?dzlxd1JPKzNhdXdwb3lwZ04rY2M1VUtrZ1FWRWlUazA3SjhIUm1RMjVibk1p?=
 =?utf-8?B?Sm55SUNEL2pSRlA5OU1jNDBTditidTduenZoWXhnREsrWkdpZU83WWRCbExS?=
 =?utf-8?B?SGk0Z3RyM2ZQWGFodk1yS3FxMWVNRUdVRjVwZDc0VFBOZ2RIaXZtTE5mYmJv?=
 =?utf-8?B?NXN5Z0Q5d1grdkpPRzhyMm5LV3h0TTM0dS94VkVkbzFyWWw4NlJBNHh6Q3Iy?=
 =?utf-8?B?UmFGVlp4V1hIdVVKY2hjSkRqZ2U2aktGT3VmVmpFMjF2S1c2c2hWUVJoV1dR?=
 =?utf-8?B?L0dIcCtGYlhKTEQveWk0dThPQ1BtMEkvS2U3QjVvbnFQTzNGMUtUbnhmc0th?=
 =?utf-8?B?OGFOVDJaWEJuelRqaDZqOEU4TXY0YlhiSC9CWE1LSnBDT1gwV3p2MjRmR2FB?=
 =?utf-8?B?TW9zVjZuM3c2MXdLdHdVZlEyanpEa3o4SUU1eFkyTWlxNVBIUWFVbEZkcWd4?=
 =?utf-8?B?TXYwOVhBYTFubTc2R09ZTXpYUUsrZUdSZ0ZtQmt1RkNzalA2MFlvOVdtMG1X?=
 =?utf-8?B?YWRSRWhlKzVHTHc2K25BanA2NGJWRXFHcjc0Z0dvUmlMQ1hLQUxLZ2dkVmhR?=
 =?utf-8?B?OE9XUWJ6NUZyVVRFTFpCVzVSdGM0NDgranlwWlFRVzRNc3RBRGViSVhyYm1n?=
 =?utf-8?Q?Ws8X+ioBVbooCu8/f8BmLcDW/i861DlD3p+/seg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 273085ba-e64e-41fd-07e0-08d9682b7ecf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 00:50:27.2345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mme3gbWj9UiGF8ye6P/s/J8X3rD5+lv3D9F5VKigyF9G4vd4HWaArBZ7ssi9Bp2yEFQUPyq3efpecnFdjB/mUnrWfXc2a/PLjpGT6Lbh+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5701
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
> Drop pin count check trick between a sched_disable and re-pin, now rely
> on the lock and counter of the number of committed requests to determine
> if scheduling should be disabled on the context.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  2 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 49 ++++++++++++-------
>   2 files changed, 34 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index d5d643b04d54..524a35a78bf4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -169,6 +169,8 @@ struct intel_context {
>   		struct list_head fences;
>   		/* GuC context blocked fence */
>   		struct i915_sw_fence blocked_fence;
> +		/* GuC committed requests */
> +		int number_committed_requests;
>   	} guc_state;
>   
>   	struct {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 5f77f25322ca..3e90985b0c1b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -248,6 +248,25 @@ static inline void decr_context_blocked(struct intel_context *ce)
>   	ce->guc_state.sched_state -= SCHED_STATE_BLOCKED;
>   }
>   
> +static inline bool context_has_committed_requests(struct intel_context *ce)
> +{
> +	return !!ce->guc_state.number_committed_requests;
> +}
> +
> +static inline void incr_context_committed_requests(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	++ce->guc_state.number_committed_requests;
> +	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
> +}
> +
> +static inline void decr_context_committed_requests(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	--ce->guc_state.number_committed_requests;
> +	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
> +}
> +
>   static inline bool context_guc_id_invalid(struct intel_context *ce)
>   {
>   	return ce->guc_id == GUC_INVALID_LRC_ID;
> @@ -1751,14 +1770,11 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
>   	/*
> -	 * We have to check if the context has been disabled by another thread.
> -	 * We also have to check if the context has been pinned again as another
> -	 * pin operation is allowed to pass this function. Checking the pin
> -	 * count, within ce->guc_state.lock, synchronizes this function with
> -	 * guc_request_alloc ensuring a request doesn't slip through the
> -	 * 'context_pending_disable' fence. Checking within the spin lock (can't
> -	 * sleep) ensures another process doesn't pin this context and generate
> -	 * a request before we set the 'context_pending_disable' flag here.
> +	 * We have to check if the context has been disabled by another thread,
> +	 * check if submssion has been disabled to seal a race with reset and
> +	 * finally check if any more requests have been committed to the
> +	 * context ensursing that a request doesn't slip through the
> +	 * 'context_pending_disable' fence.
>   	 */
>   	enabled = context_enabled(ce);
>   	if (unlikely(!enabled || submission_disabled(guc))) {
> @@ -1767,7 +1783,8 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   		goto unpin;
>   	}
> -	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
> +	if (unlikely(context_has_committed_requests(ce))) {
> +		intel_context_sched_disable_unpin(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   		return;
>   	}
> @@ -1800,6 +1817,7 @@ static void __guc_context_destroy(struct intel_context *ce)
>   		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
>   		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
>   		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
> +	GEM_BUG_ON(ce->guc_state.number_committed_requests);
>   
>   	lrc_fini(ce);
>   	intel_context_fini(ce);
> @@ -2030,6 +2048,10 @@ static void remove_from_context(struct i915_request *rq)
>   
>   	spin_unlock_irq(&ce->guc_active.lock);
>   
> +	spin_lock_irq(&ce->guc_state.lock);
> +	decr_context_committed_requests(ce);
> +	spin_unlock_irq(&ce->guc_state.lock);
> +
>   	atomic_dec(&ce->guc_id_ref);
>   	i915_request_notify_execute_cb_imm(rq);
>   }
> @@ -2177,15 +2199,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   	 * schedule enable or context registration if either G2H is pending
>   	 * respectfully. Once a G2H returns, the fence is released that is
>   	 * blocking these requests (see guc_signal_context_fence).
> -	 *
> -	 * We can safely check the below fields outside of the lock as it isn't
> -	 * possible for these fields to transition from being clear to set but
> -	 * converse is possible, hence the need for the check within the lock.
>   	 */
> -	if (likely(!context_wait_for_deregister_to_register(ce) &&
> -		   !context_pending_disable(ce)))
> -		return 0;
> -
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   	if (context_wait_for_deregister_to_register(ce) ||
>   	    context_pending_disable(ce)) {
> @@ -2194,6 +2208,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   
>   		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
>   	}
> +	incr_context_committed_requests(ce);
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
>   	return 0;

