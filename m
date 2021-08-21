Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EDF3F37B8
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 02:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2176EB44;
	Sat, 21 Aug 2021 00:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636B36EB3D;
 Sat, 21 Aug 2021 00:26:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="204061129"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="204061129"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 17:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="425189069"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 20 Aug 2021 17:25:59 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 20 Aug 2021 17:25:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 20 Aug 2021 17:25:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 20 Aug 2021 17:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CefS7nKFaaQlM4qm0Al7Wq/M4hyLPfm34OCgXQSpEKoNWc2pJmUj8gjrZ+UOtAKcgP+yZKlUXKaUduMLSmSbGlUKzdLDoI5A3Bc+90gQ073BU87RTs9Eh5cii6AeLmC9OAmxsbrysWKSUwsdUZltbY2bSjSnBAMYeK6XwXOZZUtUkm6Or2ql0eKHdY8YqMvVt/QPZFkWLwJH2nLoyl+QSLKKCaaHeJABco4Owxu5YdnqAcwWg1m6Gl/HxDSVm+D99p/CLjxwhZKm1s2R2UQvgtDaTSHNP+6GL0Rw2dADIZmvHgTZIjNYSXm+MX3fBmyY3sxy2YNLEjh23LYTzKpzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tiItgutJVRaVu70LEbPjkZoPrBEQ8/IzLhW19Gg/3Q=;
 b=aZr/VfRQGVEL0pclNYJFx4ZS6N1w45uHVTHUQe6LcCWGuqsUbLPCUGlf8m3qf/1N0qdpI/yubJ+S/FSCQTws1AuHUngDdYdbcv1vDvji1tdMtuwls6GC0wcQxgCBinAH+G5y5TpffnQmJ1z0z59Xyk4PpWNm7RE8VxznJyRUe77gt+pvyJlV+IdLcHwN2qOJisve/Sws6mwOYpizKYsLINish/7KRVwOdgclwBgD5E9iLxx3l10MAirAh/azpiMa1Cmq0hL5PjXAfteX594x8N1kPpe8yBqJAPdUDcrrBmqFb9Wr6K+lCCSe6OjPE1evbnGGJlbWaAm817Ub2Z3mxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tiItgutJVRaVu70LEbPjkZoPrBEQ8/IzLhW19Gg/3Q=;
 b=qOXv9JUHT79i6o0D7S/YJL9s83z8eC4AKCG08Byz1yDotxc6vGvcx8I+qHi7kw+RkxYb75SUBuEPRUYOdhoUZnUr0AXf4rTtdJnk83+l1JCYAOMuMjdFW43l4f+A5MDnrVxFC17DjTixhDxBSyOL5eI/sdOoEwv4DQE1DbqJ69c=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB2665.namprd11.prod.outlook.com (2603:10b6:5:c3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Sat, 21 Aug 2021 00:25:45 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%9]) with mapi id 15.20.4436.021; Sat, 21 Aug 2021
 00:25:45 +0000
Subject: Re: [PATCH 17/27] drm/i915/guc: Flush G2H work queue during reset
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-18-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <f57ccb87-c6d7-1510-d43d-090490fd902a@intel.com>
Date: Fri, 20 Aug 2021 17:25:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-18-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR2201CA0053.namprd22.prod.outlook.com
 (2603:10b6:301:16::27) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MWHPR2201CA0053.namprd22.prod.outlook.com (2603:10b6:301:16::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Sat, 21 Aug 2021 00:25:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c85a004-cc1f-4fad-9065-08d9643a3757
X-MS-TrafficTypeDiagnostic: DM6PR11MB2665:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB266527F2D05FC69D28144AA8F4C29@DM6PR11MB2665.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsWrEwSEX1URSU8fevXa2/MWBIsz1bOrc+j9dOIPoDGaJMcrqlmU9+ObfQUjI1AhJWLFzSVmtmbtnDTUuwEwRRHpFV6oU2fOVdfr3hb8AWMQ8y/F2veDX//BQKNF/5RfbeHwaXh/yk9WNAhqwaAxo4NoO1FdbtP5iay6MQAQAOa3DEL2FImtEFzY5aPzOM5/8eWs+gwNI+0U+s46lQrbDZAoRi6HE8K+so71fwjvBzHWQlQjpOnADuRg1+xT3E/pkAuLJkxBekbQ6gco4vadU0czB+kTuf3F4ODmAlfqT1k6tC1cwtZFNqvIHZGyBvLJpv2Gwio3ugFGzMgtFo/CH4Rp5817541gAOQ0bJwnSnFVrE9kaPrNOWddc8hQyhVQEbM40zN3tuYLqIBcS64OAgHbMRWKbZx7aGVOSswZop8eqnZXhgylfXRM+Wd+Rt4WZxRZoDKdG9nk0TgiNj5jc7pF8pMrluLROXzSo9rbEbfI2FW9dOJGAfSYoyZ2EMkMti9G3eugcRqPJrDrZzSd5TCI7pClAU8DS782lwM50yHTYzgMOqM5I+Int3rfrjyHO7BJDmiAeJ061jLJANG6tkdyfaz/9l0bXnrVaQKfWNFuw8ZDJbUdrTGmwf/ZupaJTT5HC/pPjBVi1aQf/UFN+GVLNcjwMH6b+YZtP1rKR2N6Co8NbbYK7jDukj3E3YNMhcM2OxyVwgfkhxsbgw6g1Sh4pF5qhZuhtxK3cMaTcHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(2906002)(8676002)(478600001)(66946007)(31696002)(6666004)(36756003)(956004)(16576012)(316002)(31686004)(8936002)(38100700002)(2616005)(26005)(83380400001)(6486002)(53546011)(5660300002)(4326008)(186003)(66476007)(66556008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1lQdnRURUl6UnF0MEkrQUZwcjR6S2crb1RGaHhYZEFXZDVGeVA3ZGI5Q2NN?=
 =?utf-8?B?V1VUSUpKR0VRREtXVDZiNnAvYVNFSWxack5JOS9kYkNLYldzV3JLTEZmTDdQ?=
 =?utf-8?B?VmRzbTZlemdWV0NjcCtoNGRjRnpIU1NLR0R5eStabDB1SVU2U3BLWFR6ZVBr?=
 =?utf-8?B?YklPdWJSUnpNQy95MVU1QlR0K3p6c2ppdkF1WW1DY2QxS29LbHBzLzl1VTF6?=
 =?utf-8?B?OGJ3MENWQ0NkZE5CMHc0STNiNmJ3WmJacEx2YlFocFp4SGw1dlQycG5EOXo1?=
 =?utf-8?B?STRvbGh6WXZoc2RJUWV1UTZiTlpSZmxlVjh0K3JxRVlwOUN0N0pVcGpHR05U?=
 =?utf-8?B?cVF4ZFIrbEd5b2FBd0lSWUdwQ0ZPSy8xMHRPOHNjK0RXR2N3R09WdlErNTBB?=
 =?utf-8?B?N1RORFRSTTlVOXVoOEVUS1h5dnB6dkwrTnpFWW5JdWM0NWM2YTRoQys3R0V3?=
 =?utf-8?B?VytuT2Y1OElDc2tpalZGSkoxZy9EcE83bDVMOTREa1Nla3RrN1RWTSt3Rldi?=
 =?utf-8?B?ZERtUFltMHhqZlVCQUlTT0RmOVJBcUxlWmJuWit1bGMzbU9LcWUzU3Y0MWRM?=
 =?utf-8?B?OTlGUDh1d1NaNnFxQ0FPL0ZxejNzYlBFK2J5cmczL3Q2NzR6d0pnNDJwR3pq?=
 =?utf-8?B?V0NEQ1lVT3JRZFFnTklIaFJkSWZLeWFyQytidHNVUDhWTHYyc3FxdFpaS2to?=
 =?utf-8?B?R3g4aElOcmhmWTNTVi9wdlc2cGJLSEVxSXdlT3FnczA4UkVWYytIQkRNWWl1?=
 =?utf-8?B?YmR1bEVPeGdVVms0dy8xTjBVODFFbkpITkN5LzRqM1prL2czdm9ROVlxanVE?=
 =?utf-8?B?VmRiNTk5VDcyK3NxUVNkWWNXNElmd1BCRE9VMWVReEc4SEFKM3hRZnkzcEU0?=
 =?utf-8?B?Sk93djRBSERtd3lqSzRsYmdxNHRNTzI4d0hXOURINHJ6T3FBWUg4NG9uSUVX?=
 =?utf-8?B?bVpleENxWFdHczd3aXo1bjZIS2k1OXBPZiswQllKSExUSDVicU5BSDB4SUpr?=
 =?utf-8?B?VlIydkoxSWxZWE9neWx0alF6NVFOaW81RENOcnZIcWJ3Q2IwaDZVWDJLNVAw?=
 =?utf-8?B?dENSbEl5U2tvNEluS3g0bWFZL1d4SWZEazd1ZUl6cWJXbVhjKzBEc3V1ZVJq?=
 =?utf-8?B?ZTdKWVFLSktXY3dqMHRyREttY1JZTmdHcWd4UVpvZWlCd3NRbmI1eTd6bk10?=
 =?utf-8?B?SmhxTWlsRmdXaXpHQXR0RzdhQ1pRU0J5N0RKMUxZb2FkTHpBaERwMC9acGxE?=
 =?utf-8?B?K3NIMG00b1BHL1paYXNVTkhGUWFuRGRXRzlLME00L3FPTUhRYUs2cWs2RjVv?=
 =?utf-8?B?SzhBVnQyczZhMEFMVWFIM0kzZnJFZlZrRnJRa212UmVuWnlWNnJwUVYyWi9G?=
 =?utf-8?B?b3FXSmVIN3FKdW9rRWh0dHJJOExXUENQd3JDbXBUSkZaMXlVTGxySklCUHg3?=
 =?utf-8?B?dTA5eHRoZU1IVFJNZ2EreFN6amNDazFjSHZWM01yUWlNSGc3REo2dVpMRDZJ?=
 =?utf-8?B?N2RPV3EvUDBlbS95YTYvSEZ3YTBZUUVhd2cyc1IrMFh5ZjdISnROZHNyb2Vz?=
 =?utf-8?B?OFlWT3dzbXVtMHhzNmdGZkd0OGFwQld4WVBtNjFFa3B4YkMxb2t2VnRtY0Fx?=
 =?utf-8?B?bzMwU3RXSnphWUJsY0FTK2NLZ3F4WjRLTTdtb3pjZUE1R252cHpzNVFFSGt4?=
 =?utf-8?B?OGdjUXgwZFZuckVuN3hpdGkxMklYODhYenkxQ0ZqNnVTbGdlaGhJV3BOWGhU?=
 =?utf-8?Q?kRfaROS6iR8Zow0xdMDmFNE4Kgtx5/ip3OO/w2I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c85a004-cc1f-4fad-9065-08d9643a3757
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2021 00:25:45.0316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsEytPE9mkWKNU6D6PuwjazA2vivxrbFQ6DLcvPh+Izs4OF0hyDqmsdDBdGg2XdfCjw9NzvtpIzpVLNovWolNdoLJsjTJtA3UyKcRyUk1xA=
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
> It isn't safe to scrub for missing G2H or continue with the reset until
> all G2H processing is complete. Flush the G2H work queue during reset to
> ensure it is done running.

Might be worth moving this patch closer to "drm/i915/guc: Process all 
G2H message at once in work queue".

> Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 ++----------------
>   1 file changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 4cf5a565f08e..9a53bae367b1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -714,8 +714,6 @@ static void guc_flush_submissions(struct intel_guc *guc)
>   
>   void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   {
> -	int i;
> -
>   	if (unlikely(!guc_submission_initialized(guc))) {
>   		/* Reset called during driver load? GuC not yet initialised! */
>   		return;
> @@ -731,20 +729,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   
>   	guc_flush_submissions(guc);
>   
> -	/*
> -	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
> -	 * each pass as interrupt have been disabled. We always scrub for
> -	 * outstanding G2H as it is possible for outstanding_submission_g2h to
> -	 * be incremented after the context state update.
> -	 */
> -	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
> -		intel_guc_to_host_event_handler(guc);
> -#define wait_for_reset(guc, wait_var) \
> -		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
> -		do {
> -			wait_for_reset(guc, &guc->outstanding_submission_g2h);
> -		} while (!list_empty(&guc->ct.requests.incoming));
> -	}
> +	flush_work(&guc->ct.requests.worker);
> +

We're now not waiting in the requests anymore, just ensuring that the 
processing of the ones we already received is done. Is this intended? We 
do still handle the remaining oustanding submission in the scrub so it's 
functionally correct, but the commit message doesn't state the change in 
waiting behavior, so wanted to double check it was planned.

Daniele

>   	scrub_guc_desc_for_outstanding_g2h(guc);
>   }
>   

