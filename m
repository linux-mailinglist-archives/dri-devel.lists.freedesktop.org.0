Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70B3CEF8A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 01:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B04989CA4;
	Mon, 19 Jul 2021 23:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379E189C69;
 Mon, 19 Jul 2021 23:02:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="208028447"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="208028447"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 16:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="453860465"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 19 Jul 2021 16:02:05 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 16:02:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 16:02:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 16:02:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7895mCFa2a59FOhmL4ksHXhAAss66ddUQ2a1Gn3PIVM57gYkFhuKHUrxwq8weUGOCro63rsNFp4/FBBtb7TXyBBQZbRjvDoW9Tn2odovEhnNz/V0GSAUGowLofBcRVhlWbNmtsQF/Fm4CCtcPMVvGE27VlQ65tQ9hl4nUotBY4q3pnP1EWmZoiCkxoonK/KlN2frJjt8lIki12dJhIvvIF89QdJ1lLKtdEfKZj9eendDO1GXBV1QPTMgiDLohD5qm8IeIzj9/EUPEy0zJhmMWotTS0qNPsiF9NO7l21QNcKPP5E4mU6oo0XbrH6K5Vi4R1Pmo/v6ORN4/86/JRYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wR0qlVQ0KXRVnNDUbHrx1wrDZjk51GOXp/klfsZTDuY=;
 b=bF55QecSdHE95rycERFRLEfjNHqBXNYbXEyRmUGo3OAYnQEe1EHICbsioRcJk6bRCDdPFBkZ/b+yo0WcJ56w/lxl70viKnT0cLT4UPqw9etKSdB/Yp1l15OlJMQpZN8TxkeoOEu6EJuSGI0yZcJUt+ha9sI7WxaOriiZ2KkPXaqc3pWTFLznNAi/7MTqF5VxnrHt0l01RwUpMVPDHu7uB2i9q4LyHYa9H356cvlF9gnS2+UA9K3VQqCtppaS4rYPzc/yVafa4zecQGq7r71QLW7/EX+H1QEBxAtzJhyGiZx8ZOwWXjiVwvVXG/kF+FtyXIQ2C6PVUEheQ86xA+QAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wR0qlVQ0KXRVnNDUbHrx1wrDZjk51GOXp/klfsZTDuY=;
 b=JjvctAEtNrdCGmGhqIdFNTTcxIUUbmNiOU6b/rhtWbt882luXZH8JBU+eDJ2glh/DUPjfCuwZYP3vjHtKbY0KKrQbT4HLGq2yF8Ys+8ZhFc9kVYFbrJ1y/BUd9Lwn7xRHnbEQuAGCbb01T0/SrcpHJ88PPcixqq2ZJZaiQys2es=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5673.namprd11.prod.outlook.com (2603:10b6:510:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 23:01:59 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 23:01:59 +0000
Subject: Re: [PATCH 04/51] drm/i915/guc: Implement GuC submission tasklet
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-5-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <f64f3b3e-651d-7375-3aab-2c5ecdb09f70@intel.com>
Date: Mon, 19 Jul 2021 16:01:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:303:b6::34) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR03CA0089.namprd03.prod.outlook.com (2603:10b6:303:b6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 23:01:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2e6afcc-f16a-461f-ba5a-08d94b093662
X-MS-TrafficTypeDiagnostic: PH0PR11MB5673:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56732DF8E70B236F7504BEA8BDE19@PH0PR11MB5673.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FWSmiOIKqz3wEq37c/IYFQVK7hqVMAg/KCHqLbp2JlLU589ZdGY6Wx15WqLPYyfHDhG3jHZk3cRt6xG70TauZ72XejawyjbQqePAhL3CiQ1qPCNMYdc2Zt7S4Tsd1NlrBJeFdT3SPMkoBVntpDWsgOllzRaYU5mO/oU/fVwd4Efd+Z9vbxgCFr95suJl7UcMhpANqLbf7m5Qi4bBBB0UKOGy5hZ9eFNgqx0jCZ4FKWJlQcjGsgLHHbeA4cRuK3jtAMLVi0TmLtjgQrOBCfdWkwDKEiTZTz2Pp2BZpAYER7nNgPEeEpLQpFCRvjTP1jelzaDHYhBJsyC96+jSOR8OjUO6vcxeFcRs0xWiMZYRE0yRon7shlNThpgoqsa/UHYbiSW/PtT1faBz4qCtAykdZjFm0lN1veY/rClvUseDHZyXn7GYAU8bO0GIT1dYmOtlahwCjuTMAhV2qQc5cxKIN3vDrJSuqgKYkL/EQgdsmuo8SMyPr6V+lG6N+P6KdEfc7ikAQJZxnDVa13CMfFcMvieMm2kjfrLOub9qG1zyVWaSZL9PCaNH12WFGenefqs7OMiIucu6ohZ1fyyuFSTvUVmAqtvRyXl8p4410RDQubIiUbZ6YKu9/GPtxIH0kikIuJqrKlJluDa5ejHJKLh+WMlzkKlJBq2cMVrKKd0t09XNWzYLanF1bwBRnNz5kILYXhgvwvqFpYm6q5v+yyq9WDLRjOlE/dVEeuQN2Q3QmlHUWWoAhorD5ebMmSfgFC1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(6486002)(956004)(2616005)(26005)(2906002)(186003)(38100700002)(478600001)(450100002)(5660300002)(8936002)(30864003)(8676002)(53546011)(86362001)(31686004)(36756003)(31696002)(4326008)(66476007)(16576012)(107886003)(66946007)(66556008)(83380400001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNNT3JDSXZ2ZmJIdFFQKzBxL3c2YnA1U0N2YlJJT2RJKzFKSno4ZzZNeHJi?=
 =?utf-8?B?WVpNVW1uRmkvdXdhaVh1WTBPU2dCOVgrTlBpRmh6OFoySTJsaTV3N0xHY1Fo?=
 =?utf-8?B?NXQvOEpxcU9ybTFiZVAvWlowQ21qT0M0N2gzdzQ3MjIwU1BZREFCT0JuRkVl?=
 =?utf-8?B?NlJJTHVuMVFqaGpRaWRCU2htTGw1OFJ2R0RBeW9pd2psNktlYmJkd21hcVJt?=
 =?utf-8?B?T3VGaFpOWks4MW9rYVJWUmhsbUsxQ3VqYXFNOEhYeWs5ZjMyOVFOdU9qOGRR?=
 =?utf-8?B?bk40SVlzbncyRHZYUmJVaU45N2hGVndFZmVSK2VzZERYMzVlVnVNekplaGlK?=
 =?utf-8?B?cXl5bW1NLy9hZ1o3amIyblNWdWQ0L2RpbzYraGpmLzdmNVhwZFhtcHlGbmxW?=
 =?utf-8?B?d2tlUEE4eEV2a25vK2U1QWNvTkx6d2l5TkRCRU8xZVpPRW5GQzNsVjh6eWph?=
 =?utf-8?B?RGQzRHhaaVkycU5iSlpFQ3NRSnY0UUhCak9rUG1VanowRTB0NzFUaWdkSTZH?=
 =?utf-8?B?YWhQRk9Ld1dCWXJCSHp3MmtmcGRUd1Bia2pXdWtPanNVVTg2Yy9KY1NmV0xp?=
 =?utf-8?B?T1ZNSm5TS1VDOTdyLzJTOURsYTNyNFB2NENSQnVqN3NnZGdsV0w3ZmZBOEJv?=
 =?utf-8?B?TW01Uys5TU82WXZZYzRXZE9heXlraFd2VEg1dDg2V2txbDdXcGFYaVlqZmNS?=
 =?utf-8?B?OGpuWkJTTjNoYjZuWHBJdE05MmU0SG9JRnBIVjlpOHp1TFRwNDBhVVJ5bEFy?=
 =?utf-8?B?QjBwY0ZVa016YUJSVHNWaThNdHo5K29NR0ZUSWJ4OW56dXVJZ2NSMFg5bUda?=
 =?utf-8?B?VXk3SzVwL1Mwd3FncXR4QytSQ0FUL2ZQTVRyNEtEVTVmdTdQMkFXSDVCcHlC?=
 =?utf-8?B?Zm1Pd0x1Nlg3SGhmenArNlI0NDRsMVp3QjNoZTFEc1dKd1ArN0pKY2w2Nkcz?=
 =?utf-8?B?SGpReE5rTEdLdVN6bEN1WFc5SXFzMzVJTXBEZVNhVXhyZ1ZoSUxIMnNWMVdX?=
 =?utf-8?B?RWs3RlRyNzQ1MVBLOVJzQWtGVmNqK1RENExCc08yUDkrNm9LNUIyZHFtVXVv?=
 =?utf-8?B?ZlZOb21jVFdyTkhhWE1VWkFwNWRuNnhLUUNYV2JmTmZFWlluaTUrdit4Q0pP?=
 =?utf-8?B?cUljUWJyZ05YWnp4K1J6TEE0ZmsyYkRGczVZSVkyVWxPdnIzSm1adkZNUFRE?=
 =?utf-8?B?VVVyaVgvd3I0ZDlPRWVncTBySEI1TnNxNnJyeEJIbXhkajR5UGE0THdvZEo2?=
 =?utf-8?B?a1daanZIQ0dkRFBCc1NTVTRmdnJTSFRqUkx0S1E4eFR1WFFTRUZpcEt0OEF1?=
 =?utf-8?B?Sm1zZkZRNnJnNzc0TDNzZjR2Uk92Mkx1dWhwTDhOUDZtdFJ0QS9qMUhMekND?=
 =?utf-8?B?UDZOeHRYOE5HMVVEcEVwMzRET2xrWjdReWIzUnVCUGZJdUg3b1gwUWt5OEFO?=
 =?utf-8?B?QXczR3hlSFBDQTk4RVlsUkNiRklkVnJuM1BkdVgyRGpDZW1SWHhNUWJhUHo4?=
 =?utf-8?B?djVxaDJTbm4vYlVEVkRmTUVtUXdveHRIYlhpR2FmeFVWc3FWeUcvLy9XRGJj?=
 =?utf-8?B?d1dwb2hUR2pPdU5VZEc4dG43WDN6U2Y1dGRJNzlCMVNOZHZ4a0c0d0hDWS9T?=
 =?utf-8?B?amhySzBkRm9EcEJ2QUVRZlprUUt1OFpiYzNZOHlsbERuN2pNWHV4SUhFemN6?=
 =?utf-8?B?YVBiSjhtT2cvQk5zTFB5WTF6QXZvRHF5L095NW9aUWlsUzNmMU95cDIra2E4?=
 =?utf-8?Q?PC7AYw6hPT28qp6kX4G0R+vPUMCgkC7d0h3BaSV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e6afcc-f16a-461f-ba5a-08d94b093662
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 23:01:59.0009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvjtfI2U4dWqXwqYj1/vXOZaDytpSpL5wGIdeERcZv11tW+SZ6crRomlSL8MhTR0o8t9uqfJRfXemFcobOVUlt45QYB5lYdvY39Bb1d8BRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5673
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:16, Matthew Brost wrote:
> Implement GuC submission tasklet for new interface. The new GuC
> interface uses H2G to submit contexts to the GuC. Since H2G use a single
> channel, a single tasklet submits is used for the submission path.
This still needs fixing - 'a single tasklet submits is used' is not 
valid English.

It also seems that the idea of splitting all the deletes of old code 
into a separate patch didn't happen. It really does obfuscate things 
significantly having completely unrelated deletes and adds interspersed :(.

John.


>
> Also the per engine interrupt handler has been updated to disable the
> rescheduling of the physical engine tasklet, when using GuC scheduling,
> as the physical engine tasklet is no longer used.
>
> In this patch the field, guc_id, has been added to intel_context and is
> not assigned. Patches later in the series will assign this value.
>
> v2:
>   (John Harrison)
>    - Clean up some comments
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   4 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 231 +++++++++---------
>   3 files changed, 127 insertions(+), 117 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 90026c177105..6d99631d19b9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -137,6 +137,15 @@ struct intel_context {
>   	struct intel_sseu sseu;
>   
>   	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
> +
> +	/* GuC scheduling state flags that do not require a lock. */
> +	atomic_t guc_sched_state_no_lock;
> +
> +	/*
> +	 * GuC LRC descriptor ID - Not assigned in this patch but future patches
> +	 * in the series will.
> +	 */
> +	u16 guc_id;
>   };
>   
>   #endif /* __INTEL_CONTEXT_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 35783558d261..8c7b92f699f1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -30,6 +30,10 @@ struct intel_guc {
>   	struct intel_guc_log log;
>   	struct intel_guc_ct ct;
>   
> +	/* Global engine used to submit requests to GuC */
> +	struct i915_sched_engine *sched_engine;
> +	struct i915_request *stalled_request;
> +
>   	/* intel_guc_recv interrupt related state */
>   	spinlock_t irq_lock;
>   	unsigned int msg_enabled_mask;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 23a94a896a0b..ca0717166a27 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -60,6 +60,31 @@
>   
>   #define GUC_REQUEST_SIZE 64 /* bytes */
>   
> +/*
> + * Below is a set of functions which control the GuC scheduling state which do
> + * not require a lock as all state transitions are mutually exclusive. i.e. It
> + * is not possible for the context pinning code and submission, for the same
> + * context, to be executing simultaneously. We still need an atomic as it is
> + * possible for some of the bits to changing at the same time though.
> + */
> +#define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
> +static inline bool context_enabled(struct intel_context *ce)
> +{
> +	return (atomic_read(&ce->guc_sched_state_no_lock) &
> +		SCHED_STATE_NO_LOCK_ENABLED);
> +}
> +
> +static inline void set_context_enabled(struct intel_context *ce)
> +{
> +	atomic_or(SCHED_STATE_NO_LOCK_ENABLED, &ce->guc_sched_state_no_lock);
> +}
> +
> +static inline void clr_context_enabled(struct intel_context *ce)
> +{
> +	atomic_and((u32)~SCHED_STATE_NO_LOCK_ENABLED,
> +		   &ce->guc_sched_state_no_lock);
> +}
> +
>   static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>   {
>   	return rb_entry(rb, struct i915_priolist, node);
> @@ -122,37 +147,29 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>   	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
>   }
>   
> -static void guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> +static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   {
> -	/* Leaving stub as this function will be used in future patches */
> -}
> +	int err;
> +	struct intel_context *ce = rq->context;
> +	u32 action[3];
> +	int len = 0;
> +	bool enabled = context_enabled(ce);
>   
> -/*
> - * When we're doing submissions using regular execlists backend, writing to
> - * ELSP from CPU side is enough to make sure that writes to ringbuffer pages
> - * pinned in mappable aperture portion of GGTT are visible to command streamer.
> - * Writes done by GuC on our behalf are not guaranteeing such ordering,
> - * therefore, to ensure the flush, we're issuing a POSTING READ.
> - */
> -static void flush_ggtt_writes(struct i915_vma *vma)
> -{
> -	if (i915_vma_is_map_and_fenceable(vma))
> -		intel_uncore_posting_read_fw(vma->vm->gt->uncore,
> -					     GUC_STATUS);
> -}
> +	if (!enabled) {
> +		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> +		action[len++] = ce->guc_id;
> +		action[len++] = GUC_CONTEXT_ENABLE;
> +	} else {
> +		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT;
> +		action[len++] = ce->guc_id;
> +	}
>   
> -static void guc_submit(struct intel_engine_cs *engine,
> -		       struct i915_request **out,
> -		       struct i915_request **end)
> -{
> -	struct intel_guc *guc = &engine->gt->uc.guc;
> +	err = intel_guc_send_nb(guc, action, len);
>   
> -	do {
> -		struct i915_request *rq = *out++;
> +	if (!enabled && !err)
> +		set_context_enabled(ce);
>   
> -		flush_ggtt_writes(rq->ring->vma);
> -		guc_add_request(guc, rq);
> -	} while (out != end);
> +	return err;
>   }
>   
>   static inline int rq_prio(const struct i915_request *rq)
> @@ -160,125 +177,88 @@ static inline int rq_prio(const struct i915_request *rq)
>   	return rq->sched.attr.priority;
>   }
>   
> -static struct i915_request *schedule_in(struct i915_request *rq, int idx)
> +static int guc_dequeue_one_context(struct intel_guc *guc)
>   {
> -	trace_i915_request_in(rq, idx);
> -
> -	/*
> -	 * Currently we are not tracking the rq->context being inflight
> -	 * (ce->inflight = rq->engine). It is only used by the execlists
> -	 * backend at the moment, a similar counting strategy would be
> -	 * required if we generalise the inflight tracking.
> -	 */
> -
> -	__intel_gt_pm_get(rq->engine->gt);
> -	return i915_request_get(rq);
> -}
> -
> -static void schedule_out(struct i915_request *rq)
> -{
> -	trace_i915_request_out(rq);
> -
> -	intel_gt_pm_put_async(rq->engine->gt);
> -	i915_request_put(rq);
> -}
> -
> -static void __guc_dequeue(struct intel_engine_cs *engine)
> -{
> -	struct intel_engine_execlists * const execlists = &engine->execlists;
> -	struct i915_sched_engine * const sched_engine = engine->sched_engine;
> -	struct i915_request **first = execlists->inflight;
> -	struct i915_request ** const last_port = first + execlists->port_mask;
> -	struct i915_request *last = first[0];
> -	struct i915_request **port;
> +	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> +	struct i915_request *last = NULL;
>   	bool submit = false;
>   	struct rb_node *rb;
> +	int ret;
>   
>   	lockdep_assert_held(&sched_engine->lock);
>   
> -	if (last) {
> -		if (*++first)
> -			return;
> -
> -		last = NULL;
> +	if (guc->stalled_request) {
> +		submit = true;
> +		last = guc->stalled_request;
> +		goto resubmit;
>   	}
>   
> -	/*
> -	 * We write directly into the execlists->inflight queue and don't use
> -	 * the execlists->pending queue, as we don't have a distinct switch
> -	 * event.
> -	 */
> -	port = first;
>   	while ((rb = rb_first_cached(&sched_engine->queue))) {
>   		struct i915_priolist *p = to_priolist(rb);
>   		struct i915_request *rq, *rn;
>   
>   		priolist_for_each_request_consume(rq, rn, p) {
> -			if (last && rq->context != last->context) {
> -				if (port == last_port)
> -					goto done;
> -
> -				*port = schedule_in(last,
> -						    port - execlists->inflight);
> -				port++;
> -			}
> +			if (last && rq->context != last->context)
> +				goto done;
>   
>   			list_del_init(&rq->sched.link);
> +
>   			__i915_request_submit(rq);
> -			submit = true;
> +
> +			trace_i915_request_in(rq, 0);
>   			last = rq;
> +			submit = true;
>   		}
>   
>   		rb_erase_cached(&p->node, &sched_engine->queue);
>   		i915_priolist_free(p);
>   	}
>   done:
> -	sched_engine->queue_priority_hint =
> -		rb ? to_priolist(rb)->priority : INT_MIN;
>   	if (submit) {
> -		*port = schedule_in(last, port - execlists->inflight);
> -		*++port = NULL;
> -		guc_submit(engine, first, port);
> +		last->context->lrc_reg_state[CTX_RING_TAIL] =
> +			intel_ring_set_tail(last->ring, last->tail);
> +resubmit:
> +		/*
> +		 * We only check for -EBUSY here even though it is possible for
> +		 * -EDEADLK to be returned. If -EDEADLK is returned, the GuC has
> +		 * died and a full GT reset needs to be done. The hangcheck will
> +		 * eventually detect that the GuC has died and trigger this
> +		 * reset so no need to handle -EDEADLK here.
> +		 */
> +		ret = guc_add_request(guc, last);
> +		if (ret == -EBUSY) {
> +			tasklet_schedule(&sched_engine->tasklet);
> +			guc->stalled_request = last;
> +			return false;
> +		}
>   	}
> -	execlists->active = execlists->inflight;
> +
> +	guc->stalled_request = NULL;
> +	return submit;
>   }
>   
>   static void guc_submission_tasklet(struct tasklet_struct *t)
>   {
>   	struct i915_sched_engine *sched_engine =
>   		from_tasklet(sched_engine, t, tasklet);
> -	struct intel_engine_cs * const engine = sched_engine->private_data;
> -	struct intel_engine_execlists * const execlists = &engine->execlists;
> -	struct i915_request **port, *rq;
>   	unsigned long flags;
> +	bool loop;
>   
> -	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> -
> -	for (port = execlists->inflight; (rq = *port); port++) {
> -		if (!i915_request_completed(rq))
> -			break;
> -
> -		schedule_out(rq);
> -	}
> -	if (port != execlists->inflight) {
> -		int idx = port - execlists->inflight;
> -		int rem = ARRAY_SIZE(execlists->inflight) - idx;
> -		memmove(execlists->inflight, port, rem * sizeof(*port));
> -	}
> +	spin_lock_irqsave(&sched_engine->lock, flags);
>   
> -	__guc_dequeue(engine);
> +	do {
> +		loop = guc_dequeue_one_context(sched_engine->private_data);
> +	} while (loop);
>   
> -	i915_sched_engine_reset_on_empty(engine->sched_engine);
> +	i915_sched_engine_reset_on_empty(sched_engine);
>   
> -	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> +	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
>   static void cs_irq_handler(struct intel_engine_cs *engine, u16 iir)
>   {
> -	if (iir & GT_RENDER_USER_INTERRUPT) {
> +	if (iir & GT_RENDER_USER_INTERRUPT)
>   		intel_engine_signal_breadcrumbs(engine);
> -		tasklet_hi_schedule(&engine->sched_engine->tasklet);
> -	}
>   }
>   
>   static void guc_reset_prepare(struct intel_engine_cs *engine)
> @@ -349,6 +329,10 @@ static void guc_reset_cancel(struct intel_engine_cs *engine)
>   	struct rb_node *rb;
>   	unsigned long flags;
>   
> +	/* Can be called during boot if GuC fails to load */
> +	if (!engine->gt)
> +		return;
> +
>   	ENGINE_TRACE(engine, "\n");
>   
>   	/*
> @@ -433,8 +417,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   
>   void intel_guc_submission_fini(struct intel_guc *guc)
>   {
> -	if (guc->lrc_desc_pool)
> -		guc_lrc_desc_pool_destroy(guc);
> +	if (!guc->lrc_desc_pool)
> +		return;
> +
> +	guc_lrc_desc_pool_destroy(guc);
> +	i915_sched_engine_put(guc->sched_engine);
>   }
>   
>   static int guc_context_alloc(struct intel_context *ce)
> @@ -499,32 +486,32 @@ static int guc_request_alloc(struct i915_request *request)
>   	return 0;
>   }
>   
> -static inline void queue_request(struct intel_engine_cs *engine,
> +static inline void queue_request(struct i915_sched_engine *sched_engine,
>   				 struct i915_request *rq,
>   				 int prio)
>   {
>   	GEM_BUG_ON(!list_empty(&rq->sched.link));
>   	list_add_tail(&rq->sched.link,
> -		      i915_sched_lookup_priolist(engine->sched_engine, prio));
> +		      i915_sched_lookup_priolist(sched_engine, prio));
>   	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
>   }
>   
>   static void guc_submit_request(struct i915_request *rq)
>   {
> -	struct intel_engine_cs *engine = rq->engine;
> +	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
>   	unsigned long flags;
>   
>   	/* Will be called from irq-context when using foreign fences. */
> -	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> +	spin_lock_irqsave(&sched_engine->lock, flags);
>   
> -	queue_request(engine, rq, rq_prio(rq));
> +	queue_request(sched_engine, rq, rq_prio(rq));
>   
> -	GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
> +	GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
>   	GEM_BUG_ON(list_empty(&rq->sched.link));
>   
> -	tasklet_hi_schedule(&engine->sched_engine->tasklet);
> +	tasklet_hi_schedule(&sched_engine->tasklet);
>   
> -	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> +	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
> @@ -602,8 +589,6 @@ static void guc_release(struct intel_engine_cs *engine)
>   {
>   	engine->sanitize = NULL; /* no longer in control, nothing to sanitize */
>   
> -	tasklet_kill(&engine->sched_engine->tasklet);
> -
>   	intel_engine_cleanup_common(engine);
>   	lrc_fini_wa_ctx(engine);
>   }
> @@ -674,6 +659,7 @@ static inline void guc_default_irqs(struct intel_engine_cs *engine)
>   int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   {
>   	struct drm_i915_private *i915 = engine->i915;
> +	struct intel_guc *guc = &engine->gt->uc.guc;
>   
>   	/*
>   	 * The setup relies on several assumptions (e.g. irqs always enabled)
> @@ -681,7 +667,18 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   	 */
>   	GEM_BUG_ON(GRAPHICS_VER(i915) < 11);
>   
> -	tasklet_setup(&engine->sched_engine->tasklet, guc_submission_tasklet);
> +	if (!guc->sched_engine) {
> +		guc->sched_engine = i915_sched_engine_create(ENGINE_VIRTUAL);
> +		if (!guc->sched_engine)
> +			return -ENOMEM;
> +
> +		guc->sched_engine->schedule = i915_schedule;
> +		guc->sched_engine->private_data = guc;
> +		tasklet_setup(&guc->sched_engine->tasklet,
> +			      guc_submission_tasklet);
> +	}
> +	i915_sched_engine_put(engine->sched_engine);
> +	engine->sched_engine = i915_sched_engine_get(guc->sched_engine);
>   
>   	guc_default_vfuncs(engine);
>   	guc_default_irqs(engine);

