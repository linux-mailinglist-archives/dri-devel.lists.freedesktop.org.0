Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AB3F223F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 23:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CC96E9DF;
	Thu, 19 Aug 2021 21:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FBE6E9DE;
 Thu, 19 Aug 2021 21:31:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="196235434"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="196235434"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 14:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="424177665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 19 Aug 2021 14:31:56 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 14:31:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 19 Aug 2021 14:31:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 19 Aug 2021 14:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVd1JHAoUbXaDilX/E+XNH+QtfcjZ1Uuhb/K4ip5OAwA4y9lYimRLDusC+mwfdzMURBP6yCosylKGIA17wgrbeE+Jg2Jc6PCw0T/MVLERhsweyrikX1mBElZZoFKUVBwfwFxYPLRnz2JW6E4UDkKJ93fkyj9yFGZG7Zbo+qW9j3NoyE0yBkyEHkGbz8huXao81uEVf/8ouSwX6pw0vEHHQCeHfD8JVyEfXp/ThQrm6xmZiVA5W/70L/cLsMuSJ/amtzuMK97dOyqWaPjCerq29ozLQuEGFU4NwwvAVKaypr9PbCEFtzhYEBjTfjqybSakOobMzGL4fFvQ30AEXvFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyLJkNi3FGHxVRlFGy+9YTOavNswH3ABR9uq6TsJNdg=;
 b=BTbAutVrrpMgRqydEPtk0TqB2SNxfDTjmEhmYiyh1OaSjD5x4eJC7RaaG9b68TXVWoBGbXX+jSeC74u4mtINgbMKVIwOjJ6W05WdDEheSldCw7HeEAONGa6V547hTvuw4BIwkVh3Xz+Xn56fhXEmMDKjPCzDw2juBaTz3a/gbS3ETq3V0nJXT7yoSprXRtdARSkZ4EXXjAjcHll74wWyJvvDWY5Nz/KrrmsFlays9lQBIf0AMqvVREtxV2ti4v5tNZEbkrEgREAnHD/O7NvrtP2diRemp5rFVwjBwjBGPunRN/AyZHm7KyHryelyek20eIG5sfdClP+Ojq36VYsLYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyLJkNi3FGHxVRlFGy+9YTOavNswH3ABR9uq6TsJNdg=;
 b=udMAc3Xp6p5+qw8XwScSGtyUqmavi52i5UNaOLwU+LzVRBpSWnPPA/AotYNcE0OMNC6/WltxO5AlXDYW46Bzv5WZkOm1MeUDwO5MK3J6B7EytitGBJg3onyzDVxwjMplIuWTRnqNvNAuEgQTNpoDusTk8pqHZ75XnJ+q6mn7NS8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB2665.namprd11.prod.outlook.com (2603:10b6:5:c3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17; Thu, 19 Aug 2021 21:31:54 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%9]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 21:31:54 +0000
Subject: Re: [Intel-gfx] [PATCH 02/27] drm/i915/guc: Fix outstanding G2H
 accounting
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-3-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <4c984e90-081f-6707-c0ab-def83c7a0a98@intel.com>
Date: Thu, 19 Aug 2021 14:31:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: MW4PR04CA0037.namprd04.prod.outlook.com
 (2603:10b6:303:6a::12) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MW4PR04CA0037.namprd04.prod.outlook.com (2603:10b6:303:6a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 21:31:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bb0095f-cce9-4cab-74cf-08d96358c3bd
X-MS-TrafficTypeDiagnostic: DM6PR11MB2665:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB26658C3B24333556E2FA3DFDF4C09@DM6PR11MB2665.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RT+YeTozALGhNpmBF7IHF/XB7ta3iEGiD9B1RPLABVjoZxX/TVsPl3wUG1TtaqVrBY7GF49aQBHPerFNjkGm86YD/aAl029cAorC79/geRdxLs0/I+AqMp6kze1YWejLvIoBLKpJFdj3bitjNg61oZzXfwZ9JFgqZDj+ks7T0N4L+lkCg+OHHeR8IEafWXpu8HIEkcySzfwlNT+4UA1Nok8mkUsqBqwS3RIYtmneVOeq7KXPDZkE7jHlfVBT82k6HT0TBzPMUnD45UrsqZkV9dvCaF9iIwRUrNNN2IiMqIM0BUNsKQcGq/ZF1QEiSZnjmqzsHgr4TRncdaHOx8x8ySQdiko8u/sxD9y8reqdtlBF5q6VDDeSaRZdGJ9LzrCs6cnpZ57NIRfqfNXjfRAoX+BMTkdxJdgIJWj7h6tebkIw4XSMCGRGj0EVswurBdPKmkfCWDmq6rtZRzXzIpyIaWkNA1jzsSV1r3THQCbZuhy65pPiXiAgxScrImcCKWgswbPtwRodlOfH+/bbcXT0Sk+6OJgWNFJkQN5A9afD1ueLnpxbqJXdyZ6ACGnMTJfe2Ly5Qk9J6Dor3N9K0LrUavseBt1rOmTNEDiCo/tJY571OkPWP9sVuw0d/5/6vigb2oYdXTBkYA6jIU2yLxqAjs0oq6Yb6KnMCQeCNiR4uFjVN7HIebhKg1TtfxZ/n7+P7xMEsowHwJYNhiBeXAutm58RV6/fn+3gZHHqO9ui9vg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(478600001)(4326008)(5660300002)(6486002)(16576012)(53546011)(31686004)(36756003)(186003)(316002)(26005)(38100700002)(8936002)(2616005)(956004)(2906002)(83380400001)(66556008)(15650500001)(66476007)(86362001)(31696002)(8676002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2JsN3hvNTJqbDJBQ2E4ZllkR0kzc0h5eGQxeHJhTnU4Mmw0QXMwWDhNOFRO?=
 =?utf-8?B?UWo3U3hwRU82aUFQckxBK0FUc2RsUVl6bnc3dzhWS1NrNFFkQUVoRjJ4SHBW?=
 =?utf-8?B?Slltem1hNDlSczU5YzlIZXJrSGp5V0lxV0ltQWUzemxKOGRjV3dwMVdhaHZK?=
 =?utf-8?B?NW1WL0lyQjh3azhtenRvQ3FMcUtpVy9EN3Bic2JmVFA4OE9KVGRSV3ZNTXdC?=
 =?utf-8?B?Z1ZvU0dhTzFwdlBBSDZjdHZZb3lSME5Da1lNNjIwME1rbnp6SGk4Q3hvcTZi?=
 =?utf-8?B?NWUyeE5sL202WTJzZ3hKWmJtaU9lYkxBOVJDM05ia1lFTm9XMHVNOU9pV2w4?=
 =?utf-8?B?REdrejFVQ2lRRzNETlhZczkxQkVzTi9WQ0JadHpPQVh2cFBqV1ZoaGRwLzVk?=
 =?utf-8?B?ME4wQnBRNEE3emRnb2dYbk40VU5leTBqdTBhb1JRK01FZkt3S1NIekxoeTV5?=
 =?utf-8?B?a3BwYjhNVFRxWTl3MUtMdktpZW40dkR6dC91QmlkVGJhc1RRZ1lJbzlRQThF?=
 =?utf-8?B?Q2lVeDM4OGpjZWNORmp3T1REVmp0UXNCYnV1RGx6T0hzaEtDN0ZGL3VJL0pV?=
 =?utf-8?B?TWEvZGlRZHQyaXVJSkpHLzlVTnM5OFpVYjE5eHNYWjErdFBLK0JFVDlXbWRt?=
 =?utf-8?B?YURoNXJNN09TbmdiUVEwb1FWTHVYcG1JOCtnZ05hTDlQbTJYYlBlemU0cjZa?=
 =?utf-8?B?Q2FrQis0SmlyRnBia1FiVU9Jc2EyVkxhSXNCOUtqVWxvQXdzYjV6WDRzR2I3?=
 =?utf-8?B?N1E4c1lhZWh2ODBxV21wQ0xaSkxPSnk0dHdoTng2MjF5Y2xyL0dKejY1YVJC?=
 =?utf-8?B?NXYxQWRFejhXRVl0UUZFcDl4YTRYNkRtUTNoUHQydExPQXZyZDlpLzlnNmFi?=
 =?utf-8?B?bE9yS2o2Y3J3aGFxR0paYTBhNCtXWldrbzNPMmdDU1gxNDkzYTdFNVphRExV?=
 =?utf-8?B?K2w4UmJ4bmRoanNHWk5vUFRrb0dqZlc0Q1IydUNCaCs2N2dwbEhXakplcm9E?=
 =?utf-8?B?WEdVajR6YlQzNkZoclNXRDJ1cThCWjdSN2ZhRWhodlQ1TzJiYnpBQ1AxQWJl?=
 =?utf-8?B?eEpFc0ZDVVc2cGRNVzZKSmowZCtmeUFVbDY1TkIyYzRDb0pGbTE1TCtYaFlB?=
 =?utf-8?B?ZGZrRUREL1h4b3MxQ3lFeGR4bmNwMDhZY2ovS0ROeTdkTmwzVUx4WmRIekR3?=
 =?utf-8?B?MjZiczlkeitReXNuMnhHZWVHdnlVQnovbmxFazFicGEwSEJNaWxaK2tKUFQ5?=
 =?utf-8?B?Vzh1bXhpWEx2RVYwblRiYU9td1VwV2JjZlhYWlJ2TExpZDRpTVRvaVJuVXVp?=
 =?utf-8?B?RFJOd05yMGxHUWx0ck8wTHlxOHVwNGNNZU1EWVo2dVlOSWZLVW1vRHQ5OGFB?=
 =?utf-8?B?V0UvYllaekt0YjdnbHlTc1pjcDV0cExyeVoyRGZvYk1JSDExUndrTElwVEJL?=
 =?utf-8?B?T0MvZHdsRUhGTGVXdVpCQ2tITFlwNTdadlRSS1VPZHJPdll0a2FNT2xZc3ha?=
 =?utf-8?B?Z2xXUjJ1WEtWbDJ1d0I0bkFKUU9nekN4U3UxdzI5YUhsRkt4R2thVDFwcnQr?=
 =?utf-8?B?TVdOcDJXcmVZamxtcDBPbHRVZ1ZOdGpQMDl0WXA4Yjg4WFF3ZGdTd0VhYndu?=
 =?utf-8?B?cXVEMWZRUzY1S0MvOCtpcWlYL0dEQVdwSHNOcVZnTnBxV3dzYnQ5a1pTdGt5?=
 =?utf-8?B?blJ4bXR5VHcyVi9sVDAwcTJ5aS92YUJJWDFNR2o5d2lXM3dBMWFwZ05Hc3gv?=
 =?utf-8?Q?gjIziDD3f0bc5CLfOIO7Kpjz2t6NAm1rRhSatX6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb0095f-cce9-4cab-74cf-08d96358c3bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 21:31:54.3274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwUNHsKiBC27d4IWmqVpSX7p6SXN7N3h73/lU1PxpgfzAghG74lPjOZ5caY9JeeignrW8SiZ2+H5VExynCt4MMRNT9GbhI3TWaypDcZF19Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2665
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
> A small race that could result in incorrect accounting of the number
> of outstanding G2H. Basically prior to this patch we did not increment
> the number of outstanding G2H if we encoutered a GT reset while sending
> a H2G. This was incorrect as the context state had already been updated
> to anticipate a G2H response thus the counter should be incremented.
>
> Also always use helper when decrementing this value.
>
> Fixes: f4eb1f3fe946 ("drm/i915/guc: Ensure G2H response has space in buffer")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 ++++++++++---------
>   1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 69faa39da178..32c414aa9009 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -352,6 +352,12 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>   	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
> +static void decr_outstanding_submission_g2h(struct intel_guc *guc)
> +{
> +	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> +		wake_up_all(&guc->ct.wq);
> +}
> +
>   static int guc_submission_send_busy_loop(struct intel_guc *guc,
>   					 const u32 *action,
>   					 u32 len,
> @@ -360,11 +366,13 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
>   {
>   	int err;
>   
> -	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> -
> -	if (!err && g2h_len_dw)
> +	if (g2h_len_dw)
>   		atomic_inc(&guc->outstanding_submission_g2h);
>   
> +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	if (err == -EBUSY && g2h_len_dw)
> +		decr_outstanding_submission_g2h(guc);
> +

here you're special casing  -EBUSY, which kind of implies that the 
caller needs to handle this differently, but most callers seem to ignore 
the return code. Is the counter handled somewhere else in case of EBUSY? 
if so, please add a comment about it.

Daniele

>   	return err;
>   }
>   
> @@ -616,7 +624,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   		init_sched_state(ce);
>   
>   		if (pending_enable || destroyed || deregister) {
> -			atomic_dec(&guc->outstanding_submission_g2h);
> +			decr_outstanding_submission_g2h(guc);
>   			if (deregister)
>   				guc_signal_context_fence(ce);
>   			if (destroyed) {
> @@ -635,7 +643,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   				intel_engine_signal_breadcrumbs(ce->engine);
>   			}
>   			intel_context_sched_disable_unpin(ce);
> -			atomic_dec(&guc->outstanding_submission_g2h);
> +			decr_outstanding_submission_g2h(guc);
>   			spin_lock_irqsave(&ce->guc_state.lock, flags);
>   			guc_blocked_fence_complete(ce);
>   			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> @@ -2583,12 +2591,6 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   	return ce;
>   }
>   
> -static void decr_outstanding_submission_g2h(struct intel_guc *guc)
> -{
> -	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> -		wake_up_all(&guc->ct.wq);
> -}
> -
>   int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   					  const u32 *msg,
>   					  u32 len)

