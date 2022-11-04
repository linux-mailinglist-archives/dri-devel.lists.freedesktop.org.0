Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C661A054
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 19:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B7810E02E;
	Fri,  4 Nov 2022 18:53:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A48F10E02E;
 Fri,  4 Nov 2022 18:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667588012; x=1699124012;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NSzrNbXPsWk35n3Rhf/oVcFTD5D5+Uv1EbpuBE2Jygw=;
 b=XWEQyPF42ToQ2K0qoD8piUH+O0KJF+6EjPOSwwdjjHm951/loEV8cqlE
 oEf1k5qBEZT7jSPzPO6t8XjM711zijYSa8CzjeZRzfHssHJf83tnEnamz
 UkkdNWdFjO9eTBLFlBdM+BhmYGyoWHoIXk7GT99rx15iS/3j2VHxtD+GU
 Jk1NjdhoIxkeNU2mfd3g2KIxJDCXRKF1n3VA/BmssyFgolg16LIg/pnD8
 hMSXfCMQ3WZKSH4/jcEHz8bBY3LRbq/D/XzA+VMjmeV65d3eIb9njMLK0
 vqT8OFWWrlcyGxD+CUP7tEjR2j8vR+Kj2KeAohqdOF2Z4ceZ51ROMrPUq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="311165819"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="311165819"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 11:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="698753782"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="698753782"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 04 Nov 2022 11:53:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 11:53:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 11:53:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 11:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foQ+H9oc9lfAcrG8IX4vbhi6Y5KCDAxCUPtTqCKytAB9wz5IlHdpw1AUY9m0ITir9TtjzoRaB+HkjYUi+2c1wwTC5E45LQwo7M7dmG4aW4yeCQpBFfoQWcZkJCzd2TV1QbyYMpQlMcL45ZvANXsUFvP73FU28lEpqGqyxywiukY3JtZId27QF6eX2N3YtcEFM/IYnlcjtK4+bLhttVaqAR2Xho+iaw2qbiR7BwjgJ3NfMrYm2fX2CCst8CFqkp8WhbpiMEFhpS79m9+GxImF3zV0UeXGdowvW7kS9tAoRgZKFROvpMvh26ep/cMVEw9eklZGFkbcBizOZQG6Q8Vapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VW3qewlW6ubDyDLON+i8T4RsCazrdsFKMFQq+AIsWDY=;
 b=c8x/vNJ/fjOIupmEdNLlhYvfpZRV0DNR85wgAOZDBtl9eUd2bYOoADciESvaN1E0TbwR4W86OZT840gzOClF0SFNGtaONrgS1nQTh7qHmmTCLWgx1bH1sxFtLJRdx+2QDEnzpnIdVDlliaN41l7v20ES0VKoHezZHIzyiIRTcOPKbERQEsCc61KFLSJ1noaDOZa4Gm+mO56LY3KEswHaJRKu5E6+X6rxwkiML3VRKFOzZGaCyfP3kkuC/b+Cb46x97bKvv9blHJGyIbleKRMvQtCvXh8KZJgFfZI7uHsZUN//ujMJL+8k8vov1MLhuMhSnqzdp7XBRaq/EB+fHyeoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MW4PR11MB6811.namprd11.prod.outlook.com (2603:10b6:303:208::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 18:53:29 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 18:53:29 +0000
Message-ID: <307671a5-08c9-8ef3-9774-e40338968dc0@intel.com>
Date: Fri, 4 Nov 2022 11:53:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] drm/i915/guc: Properly initialise kernel contexts
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
 <20221102192109.2492625-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221102192109.2492625-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|MW4PR11MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0ab3fe-86ec-4894-1d68-08dabe95dcb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dnu6+Em0V/Vj/ZaX6Pax/t6+7tvUT4JKTYDvUA1AjcbdJxY0Cn0ZXv/qAfwsioXQdA1CynvGZ79l52czk1Pl6/469WuTLbSGsG2q3wH01LGPuzbyNY5a1qwqvooXNvzStqfhOpvX6TJjjEchjg+4wHdd7sKX2UE18RJTIHp145M14D9Z0z9iCMcSfrsIq2xyX8HzF0E6FcLRwnoh3ZzamuHbKeh+2zI32m7DmZWiBAQnJMjRMz0y1r3ixMwHQrMiQt60IYWVDXsyaTqibyti0R9CRpm2XwX5Jd9o3fzjJ2kgvAJufOsYGusQCobrL4m6lp78kCJvmhhwBLwHiTTRQemlV4G4OstkdRBpMRSJ9F/9VteMROQO/T/hx4SQjQCryqxfJ053UlY8h9/388Kn/ksetkJPbWL+Ggcf7Vh5ACjmbU4LqUBqC3xEeFWCkB3LnH1SgtriXc+8lv2NPJAXC4IZ1DSIoNmyfkZJ31w6qHyuHWOzfaarnRhfl6TvzbcVbMwN6Fkw8Vtew0K23LsIuT36penIE2gnbwFivr8QUW8jfWDjm/8FcRHmqY+Ok3lrmli3GpfnmlIO5mXCUV4a9xvPmJMdiRqmOJ8lyOzzF7Pnn0P9lmNtA5PqY3FVkGNqRwdtNb7xY6kkNPCD+nAom98PbKet9M7ds6hTUlrxlvu5UL8RGBYWR/3sd0uoI/D884X1TBHexDMnad4edJxS7CKPQZJRfgTkGX9zHvt1H72w2PSvGWZZ4S8w1thiPyzUM992wCruLF9UEBzky/2fEmC11/pC8YgLv5DVQcT7tE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199015)(86362001)(36756003)(41300700001)(6512007)(66556008)(8676002)(66946007)(26005)(4326008)(66476007)(2616005)(5660300002)(6506007)(8936002)(186003)(6486002)(450100002)(478600001)(53546011)(316002)(38100700002)(82960400001)(6666004)(2906002)(83380400001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NndBTXhCZjRmSlRKcnk5VTNFS3JOYjNZY3l1RzR4YS9FSCtTZWFOT3Z3Z1lu?=
 =?utf-8?B?TWZ2Y05RTklnMkhFZS8yNlJyMFVMMm9HWDQyVm9DZUNLUHMrblAyNkRyZ0Jv?=
 =?utf-8?B?NjRtMTRLOEU3RkRqYnE1VFBocnpvNG1kQ1lDbGRjUVU2WHRXU2VkYWVDRmsr?=
 =?utf-8?B?UWFXTEtkOEFuNTUrWGZNYnRmWGx1NTJSMjN4QndGYkh0QzZWT05GcG1rdWtj?=
 =?utf-8?B?N1FXT0t4U2szTU5ZKzQvOHljc0xHRU1DQllNQjJrYjBWck9kVkF1YW5NQzEz?=
 =?utf-8?B?WnNZQVlYMlR0TFZkbXpQRUppcHA4c3FVTHlSV0pYVzJUWjQ4c3d4UVVKNzJM?=
 =?utf-8?B?QWRwR01QR0x3eWxRQldXZUpTY2V6bmRHOFZHalJoYXZwUEpZVERLNkkrT2FE?=
 =?utf-8?B?elhRSE5NM1ovV3ovU0dVbVZDZ0xsS09ub3VQaG1zdWNrUFNtbWFqUUVKdTJl?=
 =?utf-8?B?UlJlL3h2TEZWbnVGRTdQL3FFazZqdmZIV1pyU1VybmVvYkpwSWhCaFBEeStk?=
 =?utf-8?B?YjhQTGt3czZqWmpQOEdOandqVmNVMm1pa090dWltRC80d01VMWk4dUpzT1V3?=
 =?utf-8?B?ZE9KQzNqQlY4S0VIaEUrYjNkQzlUTGV5OWxQcnE3dHVjWktkVGY0K1c3YTRv?=
 =?utf-8?B?UTI4Mmc2OHdTN21KQmJPeDJEL0NSNm1XUkdSaDE3d04wdWxOZDliN2hraFRi?=
 =?utf-8?B?QzJub0hndjBObzV6Y3BKeUFzSUdIOGduaTBaOU9BVVRSSFZvWm9wOWJZUW1l?=
 =?utf-8?B?bnZKYjEyc3hXQkduR1BsYStBaHZWTG9tQ1ZyYUlLQml0Wk5WNEZ4Rm9xZzNu?=
 =?utf-8?B?YzhTSUdpTGd2SWxLSDhOUDBWc3N4eVBvZ1NhV0xSLzZWYjRCUHVUMm5pOVZy?=
 =?utf-8?B?QXczYWdQenJuR3k4OEtYR0xUbmkybGZYZHh4aG43OXlOSWNQV0Flb0hGSmhD?=
 =?utf-8?B?bXNqV3ZGM0IwQ1lTTVVkaVlQazFFZmlwdHhqTTlsRENjaVpXVEFITWpocXlJ?=
 =?utf-8?B?REs5bmRPNmJVNDJ1bG9MQU9nbGJGMG5WdkZBNjlEYlNZTncwZUZNMXNzeTA1?=
 =?utf-8?B?dlU4cExaRUpTVlJPVDRjY29INDYwMUlxYnoxNSt4NS91cjVtUHh6c01xNlpF?=
 =?utf-8?B?SkRRUWxSNFc5QUtSa0gvanNCRzA0VlEyZjRPdWh0aVlxb3BobjdPTmNCeWFB?=
 =?utf-8?B?eUswOFB3L05BeldhNjRoT2M2ZldMQjk2c0c1dEQwbmZLM1lkWmlZaGhUZFUz?=
 =?utf-8?B?cHZGK1YrK0F0ZFhBOXhYcVUzbGVkdGdjT3lvdzdkb09adkg4Sll3VldaNndD?=
 =?utf-8?B?L2hSNWFLMlBSMVYrUDl5SnE4ZFNocGw2UlJoZmFKTi80SUh2cVZSMm1YVHdZ?=
 =?utf-8?B?eGUva2NQdEg5UE5PYkExVmpuT0dmVGFkSmxVUFZveEFLK0ZSRHBtWTNTUjU5?=
 =?utf-8?B?Y2JpNmdzNlR3MUlXMGNwZXlOUUp2UjNOUHdtc0xRN01WdkxuWWoxaXhJQ0NW?=
 =?utf-8?B?ek5WcTE3N2dMaTVKQkRBcjBkT21LS3p1MGM4OVlGYjZXTkhzbFpYRkV4cG4z?=
 =?utf-8?B?Qk5aaFgwZ05tcENWTEVVVnVmb0lsZnlYQmtZeHVIRFgrU2hCOFlyTnFXOHhE?=
 =?utf-8?B?anNiSSs5bmdpRmZublRaSnJmUlhqVU9HTlJmWkF3NTkwNm5IaXhZcElrZUlN?=
 =?utf-8?B?REJHM1o4UzAyTlhuaGF3N3BNVFNWdXIvRk1mK1krVGVxTXBSb0RjOEFod3Q4?=
 =?utf-8?B?TE8yQTc1OFBrcTBMRnRKS2U4UEhGNTZQTFVmQzUyVWxuTkN5VW9CdzR3aVZF?=
 =?utf-8?B?MEZtcGpkZnNRdjExS0R1eFQwZlEyWWQ4VW5tbC80WVBrNlJ0ZlNoUUc3WVFq?=
 =?utf-8?B?NmJpU0J3ZlRGdzBXZzd3NnNZTFJKcFAwajBTQWJ2ZDJuazdvMFRjWUNPZFh3?=
 =?utf-8?B?UFAxZHF6blJhdGc4dTllbURYdmY5a0o5SEhNNUVRVyt0OFZlcC9WbFplbHBw?=
 =?utf-8?B?UHlMTEhDS3o3YmJndzVpc2NwZ2poQm5EZStzOExQbDJqRWNLV2VQaGNnUEVF?=
 =?utf-8?B?VGhOdmVrcU96c1FyNEJxeGlQZThyRUUwSkY0S05Id0puZGg2bnZ4UXJ3NDg0?=
 =?utf-8?B?bHV0UnNwd1lHNFFBbFp3YXY3c05jVHJjWTlqNVlGYkI4YWRzdXI1TXNTbXBh?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0ab3fe-86ec-4894-1d68-08dabe95dcb2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 18:53:28.9818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l28lYswBePwi8KSxw/t3S0+BGF+ThCF2wLn1aQGbPb/jm9HhUE+EiLmatseDcoaeFB1+VLQalFT/xhJZMpcsyMb1b65lXUeFDLkU0i10B6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6811
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



On 11/2/2022 12:21 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> If a context has already been registered prior to first submission
> then context init code was not being called. The noticeable effect of
> that was the scheduling priority was left at zero (meaning super high
> priority) instead of being set to normal. This would occur with
> kernel contexts at start of day as they are manually pinned up front
> rather than on first submission. So add a call to initialise those
> when they are pinned.

Does this need a fixes tag? on one side, we were leaving the priority to 
the wrong value, but on the other there were no actual consequences.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 4ccb29f9ac55c..941613be3b9dd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4111,6 +4111,9 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
>   	if (context_guc_id_invalid(ce))
>   		pin_guc_id(guc, ce);
>   
> +	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
> +		guc_context_init(ce);
> +
>   	try_context_registration(ce, true);
>   }
>   

