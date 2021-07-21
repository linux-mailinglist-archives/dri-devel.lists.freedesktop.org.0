Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C103D0606
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 02:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892AB6E409;
	Wed, 21 Jul 2021 00:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754386E409;
 Wed, 21 Jul 2021 00:11:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209445794"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209445794"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 17:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="501081399"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2021 17:11:51 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 17:11:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 20 Jul 2021 17:11:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 17:11:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMyw1LFctX4W785fgidIaC/BIeGOAEE0LN0IMyOc5ABBv6LXi5KpGuNFuPllt9cPbhX1zw6r4pMHEeSDLFpKAmLr8dO4YM3v91MJ5SfXj+O26iyXA72F+bXcWujEm1sr189+x2afzObvw9f94gT+Sas8tcawvZiAX5Mj1zThceAmTMy2epL9D+Ek80acMUDYjDJiMm51jy2lXYxNhWrfQveSTI7Q3EgqItGMyBRlTa8ZWXyJASZgUKp3aTxb5Iv4AWDtYoAAgPOFLqjzMOQjMW3kh4Rws5bgB5b5wiqOZlmjLmmWzVlMG0L7zYNE8HmZsZkQWgH+sRzZ2+7GBqGpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qd4i2LEF/e4fg6Zk/rNamoYQWPlALCmZMsfmFCsfAA=;
 b=Rhh34p7zPfevELXQbRuS9S71lemzt4QJpO9PYXpfSE9Ei3lvQDegWKG26pcyxqLaSYExQwdFafZ1gfvBzmUAQM2gRJywhH43gcm+vHyTXvanW29N7IJ/NamXXkNVO2VR7fx2Xg6Vwrhm2OkaKvUkmYZAob9kovcXKDbHMZL05toSYBD4ruDiKJ05MBskv9CJ/O/YhmyKTcBeDs3A/7bqS4Aw8MZsH850dxXf1DqEHNQmAK1xED1IIrQScZKT/APVPeuEmEaOsYb6c0CSVPFH0wxRZzeQnVGSssKsqDjGUpqjg1ngMW3Z3yem/Ujl0LeeOtWNOLWOQwn+yo5OQxWq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qd4i2LEF/e4fg6Zk/rNamoYQWPlALCmZMsfmFCsfAA=;
 b=MEO4toOM0EB7u+0qYUvjUipq2S5O7fUvSVi2UsUk+o1liBdEy4TMoAK9FjcQUxDRcJ/rXoWnGHOTROJy2HmgHQsPSJI9rACUWAlx1QSFBWQNqsjsu8n6yYLdizys1IcZ6BSbY8dUbbBEGr7QgtpU/ZvX/ez5JPhkf92/FStAOKE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 00:11:49 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 00:11:49 +0000
Subject: Re: [PATCH 04/18] drm/i915/guc: Implement GuC submission tasklet
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210720223921.56160-1-matthew.brost@intel.com>
 <20210720223921.56160-5-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <30e8ca08-8614-2a36-4eda-8e3a503cce62@intel.com>
Date: Tue, 20 Jul 2021 17:11:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210720223921.56160-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BY5PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:180::42) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 BY5PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:180::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.8 via Frontend
 Transport; Wed, 21 Jul 2021 00:11:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a30f4f0-0d47-4389-c533-08d94bdc2237
X-MS-TrafficTypeDiagnostic: PH0PR11MB5644:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5644072F27317086AF6577FBBDE39@PH0PR11MB5644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +eE2hfZgsFhjq2QH8L+gUcWyCivgxJ1PG0ruzgXAG0x7QRwyj0og+n51I4lBy4+J3fYN4U+qh3pqqpl0EzMkTJkMyKL6QrBpYg8ENXcxTrT878U02s6uWAv37q7cl0zNPoLrltYEcZ1s6NHf6G7z2lHvTCIIPZyjigg5X8ge4X+am3RxwhSJFMVtLzHgYw/Eh9QxUjRCVt8MI1bDsYPQxUD27lJVkn+23e7Xn2ImAqxtF24F3UXQf8Q0kdfP/mO2wff4AHi5P8J8SnEDJO4hkPk+CvTGbwz6J3ON75MtULHmRzZhQbTsLwxWeZkn/YJiHnszJ3SFIn/zGivw2ZPIXdqUnDtg1qn4xLfWMCdsqi81jip4S1a7KLvRUjY1RC90vN97Cv4sZw39QuQ06cm3+heJqL3wrSNgQ0i5irKrAW3zUkkfPdemRlM+ZKTLBXMX0L+0wOPNHTWFpyknQPy5fCIWObXkMlVpJSCtUCK4LuoCY1ZbdFCga2+bh3gX5lgGo3IvyhoRkdt1kDdPeNbQucUkxfqaQdMn/n39I6zprJrXfxMeccD1iypRyECiTQrBlm4USt9q1HzSNiFFZS4VUYpHwC5gJjZt2drvFfwfP+xGyPSCz8Pw5S0vldZYtv/7Usi4GF5Xw3Z5lT1dEEfXqv4sPzpYCH5X/fKC2sn12QbE+60QMJAge/1x5YNeVcJxeYYtJ9VLTo91xbbikG1z085P1FKN30tEL1cS6WHBdRVENKGzuC1sZTVB/oz+bjWn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(36756003)(31696002)(83380400001)(8936002)(38100700002)(53546011)(86362001)(66946007)(6486002)(16576012)(31686004)(316002)(66476007)(956004)(2616005)(66556008)(4326008)(186003)(450100002)(2906002)(8676002)(26005)(30864003)(5660300002)(107886003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDZ0em1DWUc0RVNNaXlXSVNoRUNrRUJwdUJkdlFxOGhiY0lRendpUUhLL1V2?=
 =?utf-8?B?b3UwSDRlRmNIbkhyUlM3dEEydUtldVRsbXhFUVl3MndhVzZWWWVna09BejJR?=
 =?utf-8?B?bnZ2VDRleUtkTVFoNVB4L1Y3Tk1naW9QNksvSitzelRrYUN1SzRBT1pnbENn?=
 =?utf-8?B?ZTJpMFVQeUh6cmo1d1o1aXoyWnVMeEJvaTUyUkV0UzdBZGk4M3h2aXpzUXNh?=
 =?utf-8?B?eDBtTmhETkZrNzZSLzl3cXN0ZmVwak9DU1N5aVNWS1hvYUdUK0tPR1FKSk5w?=
 =?utf-8?B?RFhNeG5nUnhMcE1UZW1EcnZKV2I2TzlhWk81NUdGY0QzOGFzYXR5M3NPSUE1?=
 =?utf-8?B?MlBSdHY3S1dpd2lTakw3WWVVU0RxVFZXYnlqbHkrY1pzd2hsRmZSQm1iWWN1?=
 =?utf-8?B?N0pHOWZsNzgvcnJmYnFyU0o4ektwNllHaDZhTkRPSHl0MWZnWkNzejY4aG1h?=
 =?utf-8?B?U2hkSlNRWSsxNlZnb2JIZC9JakhSMzRxY0FQK0ZwQ0JCT051SlZWNTYrWEc5?=
 =?utf-8?B?cng3QkUrN3plVy9WclQzZlZKK3hXRFdDR2tpNWxPTDJkWS82d1phVkJleEY3?=
 =?utf-8?B?aUhueWRSbVhnbW1paEkwdks5bzVPYlEzdW14YjE4Q2lhNGdTOXlFMEI2TE5P?=
 =?utf-8?B?YWlMdUd5N241ck1jQjF0RTcrLzVzZnFEZm5ZdDF0clZnZGVDS3h4T3g3THVY?=
 =?utf-8?B?cHlZM1hPMkhxdC92TGRKRmJoNDZ3aEtHMGZqbG11NDZ1T1NvZXFkWExlcjBH?=
 =?utf-8?B?K1VBa0tlQTgvSU53VnJMZ2YvTFdlb1dPUDVuR1VPR2t3bjMwcTF0OTdOaTR4?=
 =?utf-8?B?YUZqemxHOXNMcndNRktYemZJMGpZT29WNVg1WUxBQ0diVXh2aFJEaEZXYlh5?=
 =?utf-8?B?cHFKTWZmTWd2NTcrbzR5SDBCREN4dVlMWUFsekxFOTlRTVcvMFN6YjV2bDdD?=
 =?utf-8?B?a2kybWtqanZ6YmZGeUlhNCt0RzE4K3RNNHFTSExxcU1mSlMyckdBWUhlVXBl?=
 =?utf-8?B?K1A1YWYzRWtWWTBxOGFnWk1MODhKc2JybVpva3h6R2duaUg5YVpCZDhPLy9r?=
 =?utf-8?B?Mk9HV3FIRCtrajZheENmRDRrTys4bkZGNzdRenMyNGRFeXRheURJMi80QnN3?=
 =?utf-8?B?WmROcktodzFzYUI4WldVNUYwejF2Y0dIVHdXV2NuRVlTR05aUUxCdjhTSS9l?=
 =?utf-8?B?a3lXRHEwWmxuYkx2bnFMNStMWS91NGJ2NmpsaDNDazRDeEUrWklQUWNmT3U0?=
 =?utf-8?B?NThEbDlSSEQ2WVVTaXU3dHlubVMyemxBZWpCaDBsRm5lTll0bkMxcUEzU2Vx?=
 =?utf-8?B?MHlKVUJVZTZoN1FhMlJuMFhkbG5uRUU2WFh0SlNMMHkxT2g4dlZKaktXM0lZ?=
 =?utf-8?B?WldSTTFodDh0a1Uwa01mcVIzeERSOHZvbHMzSEVYcGk4d0RDSzN6c0wwT1Nj?=
 =?utf-8?B?Smk4NXF4UXhjSXc5SG5vcTBUSmxlVlZYSC91MzRlYzIvdUk0UHJSdmF5RTNa?=
 =?utf-8?B?bjlYRXJLam9IdDdKZkdVZkJwcjhJYlBGSzBHNDlmdE5TeDk2WnByV3ZHRWlP?=
 =?utf-8?B?TVZmYi9CN3RodlVWRHJKbUltaG1ZRDFnZ1p1L0xFSzY4UlNadDBFZWV4V3Fn?=
 =?utf-8?B?QVlWZ0czWmlnUEFqdnhpZW55Y09QVzNzT0pjU2ovNGFkUWEwc2lDUWJHNVBT?=
 =?utf-8?B?Q0dESTJVdnM0ODA4Z1YrYm1obHdCbm5mN3VrMXdZYUdNVnkxanZ3OHAvVnc4?=
 =?utf-8?Q?sDj58owf2JF1f2lF8l5XcJoCd3acbiXeQo8wqGg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a30f4f0-0d47-4389-c533-08d94bdc2237
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 00:11:48.9998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HenmE94o6ngFLYZXy6WdLqmOv5hEc/iQWGCs07so1Dt2OIwRW+KiYBeg1HXOk1vifG+v9R3MXNU8Xdt0hQow+bK7zG10hMB7x3gEQhzv+1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
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

On 7/20/2021 15:39, Matthew Brost wrote:
> Implement GuC submission tasklet for new interface. The new GuC
> interface uses H2G to submit contexts to the GuC. Since H2G use a single
> channel, a single tasklet is used for the submission path.
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
> v3:
>   (John Harrison)
>    - More comment cleanups
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

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

