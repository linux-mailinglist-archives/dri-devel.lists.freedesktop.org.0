Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D721C426FB6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 19:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBA26F519;
	Fri,  8 Oct 2021 17:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4606F519;
 Fri,  8 Oct 2021 17:46:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="226845781"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="226845781"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 10:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="440724199"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 08 Oct 2021 10:46:33 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 10:46:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 8 Oct 2021 10:46:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 8 Oct 2021 10:46:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z44CK7kY0jFWVVw5+SH21zO6tsPkbr7jsmgSQvGzFojiSTjfIIXsHzh3IU0Xk/tlXPuxNr0ZnAjJTz7K3hStoQtM46D5T10umV96UisdHwbekK/T0iZnWmbTYp1Ggqq+1C13pedq8WMqXQA9b2n3ylCt3GxjIgbJ6l4+Nhgne1dYEZvLk1hy2VGqnwgrJmm/9hNLdohW7k7+h8DW+cln+uM3yow5MKL+64k4SDUHHKOkHi824A2d2W0Q/fINWGl9A9/fXVRvYTer+z5mFljDckuzUbku0riYVEB6ETErTSkfaFmO1SZpPIJZpj0N5SctUH3JM6+j7ZqUZ14nMpdHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHGdITakKdvd1pe9PWi7yzdW2DYxSYprN34+mylcqd0=;
 b=hk7yv8/RbUg/vnNXDZQv8XzDXzsBNkjPpKrzr3hfA/rXiR8MeB5UVAXBBATXlBaWClYcLOM5/JWyQvi9py2Ib2n9t2Sc6D0V0WsgMcWbRUQd2LHYE47IewsIkFhft8UlMztTg8OEkylH/RDXLMP3MH2qvtlTlo5Ab61vGaFQcGG5XlxlUcXHeydrZrCSXVh/vwzfkGPm+a7YuB1mvG8zGP1hqXF3k9vgRCypTs6xx9nm+33WpWeFHv/uca/7wbpBcsltqEbSGp+7Au0F9rxZ8NlTwgZArMYLtW7Z4/N8i7OwTtJbCkWRz8p9txthWufSkdV8sLq1lnNvEXwokrz8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHGdITakKdvd1pe9PWi7yzdW2DYxSYprN34+mylcqd0=;
 b=QsvP7u0YHPieqryxYj8GIo+otcxvwhPt/kpqVoT31CW2Wkyn7lGIjyHMkjoJSITyH0NaSBPf1SsuQt1Qw7Sbxk+j2ayV7TCy0+Rc7UIwyRPjuWfXreFmDY1JdCsNnfH+UpI0Vx6mg0u0WZr0+Xj6Ys7+8t3itn7YVI6gHABS368=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 17:46:22 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 17:46:22 +0000
Subject: Re: [PATCH 15/26] drm/i915/guc: Update debugfs for GuC multi-lrc
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-16-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <3bbea31b-2b4f-c609-7e88-209b876267f1@intel.com>
Date: Fri, 8 Oct 2021 10:46:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-16-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR03CA0056.namprd03.prod.outlook.com (2603:10b6:303:8e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.19 via Frontend Transport; Fri, 8 Oct 2021 17:46:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7917ba3-81ab-410e-9278-08d98a838a92
X-MS-TrafficTypeDiagnostic: PH0PR11MB5595:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB559555D26AC2615E934252B3BDB29@PH0PR11MB5595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7/m5r1s/d3wU4a9bkdvpiSSRUgzs9MbBlBfivc9P+397mW9jUsVUgjhhC5MU0OXK3Aq43046AoWly3CbXCbSYnwcn6ICk64vm57iCeYS4UzUOChgX7h2bCyPdhmWljhzgN0+2CKkeiDrf2oN61jFNE4t0MWpfeSVP9taB7uNHFQrCaz02SEj1AiOC65NXSDgZx3Dk+q69WqyXhwhPU/Q55h7WiXnFhZDlFl+vWe0UMxg0ho/8zAy4lXSCU0YOo70jzBjR+iElvOB9+uVMpuSmtturf4vclzi3+jV2DuTA9Qmb1zZDkwLRCNupYoRnQAWw1TP7IxcUaFFBusIJp8ODZFuG7FaPpoQcwOx/2ae5y440YN3oYHvXAXiSYFoFhj35guHmki/Ufqgd0DKU7Mdy6Ltvv4WiLDXyF8Wxxz5MBrcaIGoah8rxpkx73lFVqwV05LMvViaDi2y+ngllK7t88JqSu/qlg9VQoXcDJNoKUqK3BV/8sKEJeZh+1xXxd93se8auLQhplv+B3lFLvIqpGOZ36MGwvzMPReNc6vPscp9xF/dT3wVT4fmN1tHhlr/rYYlzpRm8QlexSuQycYPt+HLM0fKG+tOr5MlD9vaXmaEtH89v/BvVN49QvRJPQMKF3ZeZmJO9r84aKCXLpOX8T/6Cpu+P/5oGByO7/Tj9jQdUV9Iyt8nsCsL90OexTAb6cuM6sB5LJNe8YsjXMA8zWqjSPNLj3Zpx5DFksT342XZah8B8uHINRtr1+wEdCfc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(186003)(53546011)(26005)(8936002)(31696002)(36756003)(2906002)(5660300002)(508600001)(4326008)(8676002)(107886003)(31686004)(2616005)(6486002)(16576012)(316002)(66556008)(66946007)(956004)(66476007)(450100002)(6666004)(86362001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M21zeUxqNjRpOUpEVTNlek96cHUvSkdpZ21DMk5LeExuSUxvRHgzTHl1cDBv?=
 =?utf-8?B?OVVNZllJcC9DUW5SdFFrc2ZCMUlXSmgzb3R4RWJ5a2trSXcrNy8zK0hxejBu?=
 =?utf-8?B?NlBkb0xVenVCNjdvNTNiR1dpcS9CMlVyWnN2azdZZzZKSEJMazcya2VEQW14?=
 =?utf-8?B?WjMrbEJaYWQzOENkTGphN01MSFRTdXMvTTBtQU12KzZ3SnpvZi9nbjNEZkFD?=
 =?utf-8?B?dGV0MjM5QVJ0N2FnUnFKUGN3cVlUaHcyR3BlWTZyZGhQcW56cE40N1pqVWVy?=
 =?utf-8?B?MDZQbUZyRGJ2RnBNdTZJZ1IvYW43WDBvcEFubEhTb3JTRTFqYVZCVDlodWo4?=
 =?utf-8?B?a2RVbC9xYWtkSU81cWJHTUNqOUdRVWxUZTZ5cmtVNEtqa05XRVhhdytyM2Yr?=
 =?utf-8?B?SzJTZGEwa0g4d2RhbTd0bVI4VDBtZUhtcWkxeFZOTnR0S3hrbTlhaFhOSElD?=
 =?utf-8?B?K1J4NGhFZU9PbytTb25DUVh0K2xHRy9aRjRuSk9FWmZRanUzRGhtUU42WjJ1?=
 =?utf-8?B?cGx4R3d4YTdhdVNaRzRLY0Uwd0FrL0hVbUJ3cVY0Y24rTlpCY20yU0V3ZldL?=
 =?utf-8?B?NDFHelo3NnZPL0pIRlB2WHpiNitXYVE5b3gyT25UclZxcGd2MVAzbWNWNklD?=
 =?utf-8?B?S2N3MTRyalNRYU82NU9TVTVyV0FWS1pZamkyeTBPQmxiUGxmcElGcTlHTkxO?=
 =?utf-8?B?OXU5OFpkNmx2aGs5QU0zbkF0V3paV0dSVk44MUs1S3lEL3BwekpHK2FCY1l3?=
 =?utf-8?B?ZjYrNFlJMzNrUUhKcUJ0WFQ2cDcyYW5ERWU4bTNyWEhYeEhIOVpETmpjOHV5?=
 =?utf-8?B?S1lJTnByR0FheDRMZVBzbFgvVDNkcEtOMUppOUhCYm95aTlFVExEaGljSTE3?=
 =?utf-8?B?bitBUmlSdnR3L2dxUDFqRGxZYUNNS1R4MFdCZktGZ3FoQStFVXhEYzJlNG5V?=
 =?utf-8?B?aHBHSVU3WWtHOW03dXNoaVh1QWtLUUFCejdyM3hOVUpsUE5QUnBGRDV0MHdY?=
 =?utf-8?B?di8rWkFHUE9nKzI1cEcyZmRiemt5aEloM3oyeVBsOWZ5M2tIeVZNVVRWTEQ2?=
 =?utf-8?B?TVRqL1dwQkhtb3pCWmlLVk44eHlsRUYyc0p3MzhiRnVOWWY2SysyK0xIK0g5?=
 =?utf-8?B?aVVaVGNNRnBoWWJvWkJJSUtTcEkzRUVMYzdjRXpycnVHMnB4eGFRSXR6U0pB?=
 =?utf-8?B?VEFCcDNSNmpBMFdGU0dvdjRubGtrMkdsaFBZNkZpckNpaTZZVkJpNWNoYko0?=
 =?utf-8?B?S1Fzam4xNzdtZmJaNWZCc1NYcnJJZHE1OHF4NFBia2psQnpTTUlwZG93ZDFK?=
 =?utf-8?B?UDV2TWhhVnhHQ3d2elExL0ZFdEdBbVN0SXhjZCtKd3FXY1U2aWRURU5wTG5J?=
 =?utf-8?B?eFUzcGI2Mkg0b0Y0UFk5RitlTmFOaDZVc01VbytwUWxsVTd0Z1NBWW1hOGZU?=
 =?utf-8?B?Y2JWVlVmUE5yV1VBTmUwVFROekJXSms4bW9WZk5QUk1TSHlzVkVoNDBaOERq?=
 =?utf-8?B?bm41OUllSnZPUkVWb3ljS29BaXlYTDFVdE8rT2ltMFMyOTcvVE9NTUwvVGR2?=
 =?utf-8?B?TU1MWjBRMXFFMUlPRVA0ak53cUp3U0pxbThZZjRIVVMzZElEbHdsRGxCRGo0?=
 =?utf-8?B?R2ZoK0t2TEVUcFV1ZDIydTZoa0VsOW1nRmdHT0lJUi9CWXFwYmNnUERyeFp3?=
 =?utf-8?B?dE9yREcyL2FsdzhWMHJIdFFWcFIyWkxYYjFVZ3lOVm1tc3NzYzduRk1TZ1Rp?=
 =?utf-8?Q?j0zArZuz6AEpHkniCqflnbKdTiKi55JqR0kX8VH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7917ba3-81ab-410e-9278-08d98a838a92
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 17:46:22.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgdxqR39raUFy8hZTlXEgMJzvgypQ6YE6PgGtAvAaui0rEz6z4wegqeMsIt0jhSrV9oCZk79HRKLA2dqksRhpsKzpLrmztZl8I+J1zqxTOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5595
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
> Display the workqueue status in debugfs for GuC contexts that are in
> parent-child relationship.
>
> v2:
>   (John Harrison)
>    - Output number children in debugfs
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 53 ++++++++++++++-----
>   1 file changed, 39 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d661a69ef4f7..f69e984683aa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3704,6 +3704,26 @@ static inline void guc_log_context_priority(struct drm_printer *p,
>   	drm_printf(p, "\n");
>   }
>   
> +
> +static inline void guc_log_context(struct drm_printer *p,
> +				   struct intel_context *ce)
> +{
> +	drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
> +	drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> +	drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> +		   ce->ring->head,
> +		   ce->lrc_reg_state[CTX_RING_HEAD]);
> +	drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> +		   ce->ring->tail,
> +		   ce->lrc_reg_state[CTX_RING_TAIL]);
> +	drm_printf(p, "\t\tContext Pin Count: %u\n",
> +		   atomic_read(&ce->pin_count));
> +	drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> +		   atomic_read(&ce->guc_id.ref));
> +	drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
> +		   ce->guc_state.sched_state);
> +}
> +
>   void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   					     struct drm_printer *p)
>   {
> @@ -3713,22 +3733,27 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   
>   	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> -		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
> -		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> -		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> -			   ce->ring->head,
> -			   ce->lrc_reg_state[CTX_RING_HEAD]);
> -		drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> -			   ce->ring->tail,
> -			   ce->lrc_reg_state[CTX_RING_TAIL]);
> -		drm_printf(p, "\t\tContext Pin Count: %u\n",
> -			   atomic_read(&ce->pin_count));
> -		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> -			   atomic_read(&ce->guc_id.ref));
> -		drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
> -			   ce->guc_state.sched_state);
> +		GEM_BUG_ON(intel_context_is_child(ce));
>   
> +		guc_log_context(p, ce);
>   		guc_log_context_priority(p, ce);
> +
> +		if (intel_context_is_parent(ce)) {
> +			struct guc_process_desc *desc = __get_process_desc(ce);
> +			struct intel_context *child;
> +
> +			drm_printf(p, "\t\tNumber children: %u\n",
> +				   ce->parallel.number_children);
> +			drm_printf(p, "\t\tWQI Head: %u\n",
> +				   READ_ONCE(desc->head));
> +			drm_printf(p, "\t\tWQI Tail: %u\n",
> +				   READ_ONCE(desc->tail));
> +			drm_printf(p, "\t\tWQI Status: %u\n\n",
> +				   READ_ONCE(desc->wq_status));
> +
> +			for_each_child(ce, child)
> +				guc_log_context(p, child);
> +		}
>   	}
>   	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }

