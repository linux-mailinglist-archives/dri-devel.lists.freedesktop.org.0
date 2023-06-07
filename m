Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19EF725116
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 02:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DEE10E3EC;
	Wed,  7 Jun 2023 00:16:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E00D10E33B;
 Wed,  7 Jun 2023 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686096969; x=1717632969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g4Ms87JEpT+NwFheZSVN2DPSpYYM7ifRXXp6j6xNcNk=;
 b=gKhevTL/4nnROJu1gnqiDxivdxyZFcWghKARsqR+bUaUahyzZrPDRzMv
 O4hB8IBN+WhUoicGz5u0X1r2evCiXo10ks5eUeV8jT3b5zILvY0yWz56v
 oT4sICqk6yqpCzp5K7IADGsYVUVNpTiCp9IkqcAlnpmsW/imHI8Pw2NXd
 9qHtUhYCORVHEWj1omEGNZGQl+Iwo+Ual7/oRm2D50Orj9LIwlX6dl9Zu
 lOjv0HU/wupNe+QTrLO+g/EpiKxIgMMGJtqSVpXkoFpIcDcQAJO51EuhV
 dAyJ0bG7bhGdTIE/uaeg7uQqxPMfBuB1dHBXnh92eV+ikUf0brN4rsg93 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="420384455"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="420384455"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 17:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709272725"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="709272725"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 17:16:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 17:16:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 17:16:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 17:16:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNT7wqrzjgysP55LSS2/XTt06x841VEZzAVx1UW56wpT4xqwqz1q/4CQVUm4iMyZRxxvbL7IqWqNHzRnb58HPj71g8T80p2sFWPoalKgMed1L7C3HOaR29dpt/ewF+lkcjcFuerWq+4IHhnp0ZMD2+Vqldb73Ec/sK39nUONlJdYuyEjRsCGMh12rf7W9fi6vUFNS+0zkbsepq1Bd4l4wJgGBlmwl+s2gKke6DMflcOsBKiwQSUqdWIaAq75qBlhMumkx4c8ii2RQA1yDhc2/TWk+JCgb7ARr6H6nxlTBDC+/PlBxa/qd+rh2tY7lOCmeMhkbtO8oja6HMeuBym+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ee8o4EYrAW8xcif/tVLr6BfyUs0CP/kLGvmE159OHoo=;
 b=f3XWbQ8Pkj5OAv6uxqNkZZFMAbL/UmS+A/TSPG0zN3CmOnjk+yKFQkHHj5C9CG3W18w5N4RbqQB9lycIBLEXOsuJYysgJ04XUQHFFsffrX4Y6f/VhopPiPLw+zwyT0o2C1WFPctdCsCQjZtl/LTL6BnfQGg0/LqWfZL6ba57VHkjTiZgj8KKP7FzW5iYh/ecHA4P6b9rDkWyDrloZTkIgUMiO113LVTffD40KaXF8jxKxeKVjPXRibdjJ6Xcn11hsyiTCYzMEMgYW3ddXR988LiuVkbYcWmFw/GlAQ2KmBuvXhfgYS0wEfpv3ug9yKC8uU4DXPsUIUPaamY2s/9NlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 00:16:04 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::30f2:1e90:7035:40c4]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::30f2:1e90:7035:40c4%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 00:16:04 +0000
Message-ID: <ea89f474-163d-3838-a364-a2479e183768@intel.com>
Date: Tue, 6 Jun 2023 17:15:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915/guc: Force a reset on internal GuC error
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230605205431.852088-1-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230605205431.852088-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6282da-b855-423b-6a06-08db66ec6171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOWtjwdcJnDOadFSq+AZyW/smiHub8x9NVNrWX5UO6kw+PO27VJyfLIgQ52JTI8XbNSxlXbz2UDbEccJb/JddyB+JNs+X1a1xmFAUJ4npWXxRd9KwBKsWY4zu0d1hEkoBsP7i9rGh/ycbzRDbgJ9W/iR6qRZxfBAUt97ZaBkLzAVFOckZKGOKoyFZhJNhdcFi+iqA8qy+Gq05RqaW5f6JzCn0IIswrjVnQxbvNztTDBINmgJQVxIaC2KiqSg4or4O2B+jxEVynFV1WUl0hkOqzvFie3RkLfzvHiiSzs8li262Fe4h/GgNDeEySNW6pWPWRtBu9O608nAj3+wnme4fHczb9e0fs4k59RKAHWdmra4GGtz8+WJqy3uNxCtHAQsuraEe6QwBqZ1z+pTOyRcqpCrA9rQlEuJitKVXMSdM2ii9BtcO6xlGxzzHImOLivCxBuA2ofETjR/eS7sOBWuGzk6BcAQemUuWcCuRjC++pMRyhD7KZf/9HlSwZ1JQMf/PWM7pBOaDqpP3+Llt9jO8xHrBLR6WmUmSdWq6pnciwljaVxRDRG5nKzMZBxQJZ0t27l/TZDTSTp9lkT9yueY1O2+NlUWyQOt4DK7KBFEE/pqqKi8u0EQoq3Nyq2LsZacy2ypIT1hhwUPR+BoqqsEmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(53546011)(86362001)(186003)(450100002)(82960400001)(26005)(6506007)(6512007)(31696002)(6486002)(2616005)(31686004)(83380400001)(6666004)(8936002)(8676002)(5660300002)(478600001)(36756003)(38100700002)(2906002)(316002)(41300700001)(4326008)(66946007)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVZJc2tXaTFsd3dNTUkxU1FZRGptOUFKMFhXb2tEd2Fob1NIVXJYek01N3Jj?=
 =?utf-8?B?QnN6OEh4Z09tZnA2c0hMM0R5Rmc5QnU0cWhhbk1qNHk1bFBBVFBva2pxWHp3?=
 =?utf-8?B?NVJuQ2pRUmJ2eFpRN1p1L0NFWVgzc3NQb0lLaTBoMmROMThjdGlnWWY5YjFC?=
 =?utf-8?B?V1V4c0RuTGpDNHNSRThyamFrSjZaR2hZbmQ4a3U1cTdLemVTWG5PdWp5Q0dJ?=
 =?utf-8?B?RU4xdUk2bHNocG0vWWRsQldSWFMxczc4OHlnZGJ5TXhWRkJEbjhRaWVCc3BQ?=
 =?utf-8?B?cXduRmNjVlU0aEZERnRFcHpoL2M2bVNlMVV0SE9ZYmR0V1JDTmlVamJDMFo4?=
 =?utf-8?B?ajJ3RnFlUXUzc1pFNUxUZ1QrK0t1MmZ2M09TbWJJTm54UVIzQ0JkNHp0ZVA5?=
 =?utf-8?B?ZGVlaG1oamZjUWhSV2o2aFpIcFpNaVZ4dUc5YTdUZEEyWkpzdWxlblFnaFlR?=
 =?utf-8?B?b2hoWk9LNTdncGxzRGdWWVFNcXZMTjY5emE5Mk5PUHd3bWxHM1l6TG5IQjQr?=
 =?utf-8?B?L0ZmQWlnOCtTbWVHZ0ZScUhBRlZMcUxTU2JEM095UC95NkxxaG4vMEVZczRj?=
 =?utf-8?B?alRFbzlEa3NZVndJbGQ5cDZ0bDVpaWZYRUlkNmV4NkdUQkN0dUkydVRnTE4w?=
 =?utf-8?B?aTRKZzg0QnBkOVFTeklXS1VCSnVxditub2M4YWI0SnZaQlFTa0JkKzNZNTBl?=
 =?utf-8?B?dmk2MHhzQUQyT0dOM2g5Y1BnMkw1Z2hsTmJQL1FmREV0MUlGTk1oUGZwYmYw?=
 =?utf-8?B?NHRDcW93Y0luazJHRmovamVlYzV6ejFjV1NBM2N6dHpkUzdvSkoxcDQ0dzMw?=
 =?utf-8?B?bDVNalhPQTZXcDBZemNhOG5TMkVJYnJZWkY2VTdQQVlDalFmbURuRzh2SGx2?=
 =?utf-8?B?Z0Rub0tRNERXaTdja1FlQ0dpRGl3MFdTaU9vQUhvS09RZC9aRktLZHhnUnd1?=
 =?utf-8?B?L2s0Nk84QUErL0xPdnpvL0dBSUMzSllOdVo4bzZFQkY2UWxxdVlJc0tZM1p2?=
 =?utf-8?B?bXpkMzNUWWRHVTZFY2t5WVpoU1VtWG5OeFJiem1DLzdoWThGVDFPYUpwTllD?=
 =?utf-8?B?azZXTGZ4cTI2SStMUzBDZXVyb3l6NGtSQmFKQ2pnZSttZ0owdDdoSVpFQ2tw?=
 =?utf-8?B?OWlvT05PSmtUSi9ZanA4dWxDRmJTRkZ2OUIvMlRoTGRGVVJaNWRGVHc0TjRC?=
 =?utf-8?B?R0NrZnc4eEZERUVZakFnNXpLbCtkc3EyM0REYWVGZm02dkxpc2dMUFVpeEUv?=
 =?utf-8?B?VFRiMHZyeDYrYmYxQ2pTWWxscHQ3OHVvRzVnaVZYR003Q1BFR05HRWRidGdk?=
 =?utf-8?B?ZkJ6YXV4Y0h0bjFUMXk0L2pNcllOSmdYVFRSbXAwbDhweUZDaUU0U1dyYWFY?=
 =?utf-8?B?OHVuNFZtZHZmMmd2VExDUDQxY204Mmd0dkdrTWVpS0dBd25WYk1xSGZFMTFC?=
 =?utf-8?B?cTloNW5uY1JKaVdtVXcrVTJQbXpvWStoVlExLzhnVU1oTXpmc1lsS2VkZGIw?=
 =?utf-8?B?dmM5eFhwUVlOY0htUkgxSjMvbWRkY2NpZzNiQmNpOFF3eTdjalZoeGtZblFZ?=
 =?utf-8?B?Vm1tY2tIdG5FdlFBem5iRHJkMzFqZGdoUlhudUxtckpBendQQTZpNFhWUkVY?=
 =?utf-8?B?bDAzelZBekJ0OFdXMTBLdnI2VUNKWmpCNm56RGJacTRUKy9ndHlNOHEyaWlu?=
 =?utf-8?B?YXhkS3JOYWx6b0dMbXhwWEdxZWtvWVdrajBjeFNnQmFFYUR0cXZYKy9MSlQ1?=
 =?utf-8?B?MkdTTU4yZ1ZXeWYzMTVmYlhLT2dxOXBjOWpGWTVSSzJyU2Q4U2lWNHpMTGV0?=
 =?utf-8?B?K0dEbGl4RUQ4VVhRUXJvRUxhc3dpTnhiZVIxaVRHM2lCVVJyRlY2VDVYalcr?=
 =?utf-8?B?eS9HcUhBK1I1ZGk3R3BCbWVzMHo2NzVqM3ExRG1iRkxnWW1LS1hyVUdMMEVi?=
 =?utf-8?B?UmRGMithWThUa2hCUE1YeEUzQW9Ka2pIOFZnalA4aDZnV0RWS1BidjI4UEh1?=
 =?utf-8?B?ZlAwNjF1RzUvUnE2WmlJU01NZUJBYi9mTkpMYXp3d2Vqd0F5ZkxpWk1wZTNC?=
 =?utf-8?B?MnVMeXVWYWhPcFV0aGd5UWU5ZWJCWUZIbk10RkdPR0Y3dWJtNXhzZEI1eHZo?=
 =?utf-8?B?WmxBeDVLUVc5R1RkcVVHSHhvL1ZaSCtDVmhwelFHRWxpbFF3SmNHNlhSaldB?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6282da-b855-423b-6a06-08db66ec6171
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 00:16:03.7537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3KK3jKT/wKmbf8sntJ/9kBeOxL5vR8JY0vpTOk6hd+xJScwJldfIAB+OXYH/tvAk9lv/msGbwwC584CakyPHV7cxvxluOqzIZPQDot6R6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/5/2023 1:54 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> If GuC hits an internal error (and survives long enough to report it
> to the KMD), it is basically toast and will stop until a GT reset and
> subsequent GuC reload is performed. Previously, the KMD just printed
> an error message and then waited for the heartbeat to eventually kick
> in and trigger a reset (assuming the heartbeat had not been disabled).
> Instead, force the reset immediately to guarantee that it happens and
> to eliminate the very long heartbeat delay. The captured error state
> is also more likely to be useful if captured at the time of the error
> rather than many seconds later.
>
> Note that it is not possible to trigger a reset from with the G2H
> handler itself. The reset prepare process involves flushing
> outstanding G2H contents. So a deadlock could result. Instead, the G2H
> handler queues a worker thread to do the reset asynchronously.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    | 26 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h    |  9 ++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 +-----
>   3 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 2eb891b270aec..c35cf10f52b56 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -159,6 +159,13 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   	gen11_reset_guc_interrupts(guc);
>   }
>   
> +static void guc_dead_worker_func(struct work_struct *w)
> +{
> +	struct intel_guc *guc = container_of(w, struct intel_guc, dead_guc_worker);
> +
> +	intel_gt_handle_error(guc_to_gt(guc), ALL_ENGINES, I915_ERROR_CAPTURE, "dead GuC");
> +}
> +
>   void intel_guc_init_early(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> @@ -171,6 +178,8 @@ void intel_guc_init_early(struct intel_guc *guc)
>   	intel_guc_slpc_init_early(&guc->slpc);
>   	intel_guc_rc_init_early(guc);
>   
> +	INIT_WORK(&guc->dead_guc_worker, guc_dead_worker_func);
> +
>   	mutex_init(&guc->send_mutex);
>   	spin_lock_init(&guc->irq_lock);
>   	if (GRAPHICS_VER(i915) >= 11) {
> @@ -585,6 +594,20 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   	return ret;
>   }
>   
> +int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action)
> +{
> +	if (action == INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> +		guc_err(guc, "Crash dump notification\n");
> +	else if (action == INTEL_GUC_ACTION_NOTIFY_EXCEPTION)
> +		guc_err(guc, "Exception notification\n");
> +	else
> +		guc_err(guc, "Unknown crash notification\n");
> +
> +	queue_work(system_unbound_wq, &guc->dead_guc_worker);

Do we need to flush the worker on suspend/unload?

> +
> +	return 0;
> +}
> +
>   int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
>   				       const u32 *payload, u32 len)
>   {
> @@ -601,6 +624,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
>   	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
>   		guc_err(guc, "Received early exception notification!\n");
>   
> +	if (msg & (INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED | INTEL_GUC_RECV_MSG_EXCEPTION))
> +		queue_work(system_unbound_wq, &guc->dead_guc_worker);

I'm a bit worried about queuing this for a failure during the init flow. 
If we have a systemic issue (e.g. bad memory) we could end up trying and 
failing to reset & reload multiple times, until the wedge code manages 
to set the wedge on init flag.

Daniele

> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 8dc291ff00935..0b54eec95fc00 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -266,6 +266,14 @@ struct intel_guc {
>   		unsigned long last_stat_jiffies;
>   	} timestamp;
>   
> +	/**
> +	 * @dead_guc_worker: Asynchronous worker thread for forcing a GuC reset.
> +	 * Specifically used when the G2H handler wants to issue a reset. Resets
> +	 * require flushing the G2H queue. So, the G2H processing itself must not
> +	 * trigger a reset directly. Instead, go via this worker.
> +	 */
> +	struct work_struct dead_guc_worker;
> +
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
>   	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
> @@ -476,6 +484,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   					 const u32 *msg, u32 len);
>   int intel_guc_error_capture_process_msg(struct intel_guc *guc,
>   					const u32 *msg, u32 len);
> +int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action);
>   
>   struct intel_engine_cs *
>   intel_guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index f28a3a83742dc..7b09ad6931021 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -1116,12 +1116,8 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>   		ret = 0;
>   		break;
>   	case INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
> -		CT_ERROR(ct, "Received GuC crash dump notification!\n");
> -		ret = 0;
> -		break;
>   	case INTEL_GUC_ACTION_NOTIFY_EXCEPTION:
> -		CT_ERROR(ct, "Received GuC exception notification!\n");
> -		ret = 0;
> +		ret = intel_guc_crash_process_msg(guc, action);
>   		break;
>   	default:
>   		ret = -EOPNOTSUPP;

