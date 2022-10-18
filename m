Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E163A601E1E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 02:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1980610E3B3;
	Tue, 18 Oct 2022 00:07:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E8D10E22E;
 Tue, 18 Oct 2022 00:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666051629; x=1697587629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qdjjiJWyjBL2bw/DrFP+d23yKZZBiHS7qCQyyhD6VNI=;
 b=HpN/LgoHLw7BwU5FoaD0wAAufHPMXyFfN6vhYtfnLfDTGzcf0MgyEm8j
 GdX6pdKSaIaWfamWmyX+3Bs3UqI6g5Evw5rlw2y8lsfXGmIemn7My/AEE
 epsDcljTkmQRe/CtXGCbZVnB0OjTLKgjqDCAFxV4xmu8osfZbRpYvH6xY
 XYT1aqbsouXtdhRTAmKNZlpdqTSO+NbZs/Y96bdcBAjsLtpSQu+47rqDw
 j7KYxX5cDRiGa+wcwC6u/fDoBbHYiIW1uVleaDnSEcJoDDbNsVpG/mR9P
 KGGbCLme6to7dzyey2OU04PbEHjROkfN+gdzlFEBXybiVP8jr70pHCYbE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="289246053"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="289246053"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 17:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="770960187"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="770960187"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2022 17:06:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 17:06:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 17:06:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 17:06:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 17:06:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNZ16S/6rQKPObih6SJ4IaL7CNR3XLubTaI6AGX5HUQ5lKTfbALGQyAu4fxnZh2MO4TWzq1h9ApaD8nQs8XKiLM0ULDlZHfqZtS5V4cqKywg4huywFajNwflxN+QRJ3gh+3+myj5hP8j9I2C6U7huaRsURh1N3v7A8dS0P9gwFfvwj/YtBWlwrF1HuypN5kD2JIK9L13zEDQr3Md0nRS8kQiKl+Hg5sqG5PPhLLBKBjDDExs414ZC/XB/6v/+E2+J5/YYym1Hcicpx7jUx5TXThYJkQ5c2ayWKuV2jEOPVK1EPRVUpIq2kd3UZEUpvGIAWV3vjyBL15ZqYcIbStKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQ+u/GZkZQdSglvuatPF/CbgVi32UUndgYNKoQ73Zt4=;
 b=FF1kBDJghKZTg9EiLMKoe6Zuih4JmaxQtrqriBIwRnZQC6j3dhLGeBZfg3VH95aMwAT6GUMRzoIxT18COMhaYcowB/al2/fnMFLd3J9Zo8sfwbQzrWPs3SMlU6kxYtNhao9X83NZDPwTvQXrgMtb3Z1g1n7NRzpa9jxrRTttomcT1b+KiHCisG5qDchwhzQobuN5EdvsdmtDvoXMrj5a8qEGuDYP7DmCbVuzan7kGq9pdg7E1/zUqe3uTKf36FAZcGVGPKi1PTFXXC7ukd+8d4t7m2NF6OKWDcQShMfTTr3qg+MfTLoCzUYJcugTBdTRsbm49Xit1nJ3XELcQ4rviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 00:06:31 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%4]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 00:06:31 +0000
Message-ID: <85de25e4-2b2c-f40d-1a07-1617364b4b28@intel.com>
Date: Mon, 17 Oct 2022 17:06:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 1/4] drm/i915/guc: Limit scheduling properties to avoid
 overflow
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221006213813.1563435-1-John.C.Harrison@Intel.com>
 <20221006213813.1563435-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221006213813.1563435-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0033.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::46) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ0PR11MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2575af-f205-46b5-a847-08dab09c9c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vQcvufkRjOmR12cthBblZ3e9nDEUNjfYOloWJescZHI+ZraBncHAEGKNIOZndE2Ot3WOxPUZtaNwAAy4ImdupgyUlHwBrsUB4ENqj42bLfPO07cpG6b+4Uh3N2UQpq43ZBS0xPkm00UMcia70doglaNWhekzMxVWw+Uv66CWFi0Xrc6AJm9m9tXALoPizdO+aBHW/17X7hkYl8GZ+2RX+5Rd71O0IEAracHrHQ4sea46VVdAAW3VShtngN02vQ0kefiVxd7oKI5hojs2dwnlYbyzGS7FC8nAL95+PJ7VhCPN7XjOL3uTKr5Eu3FksX6phJcaGqwVC6ghuAvtYqojeF0p2gQloXFDzNw3+Cj/fNZIdP37qjydvFlwl35yROTusKqzwdsoY+WlBoT7J8Qn+/CJVW5UoiNvdkjbwFM5W79gSeUTyMFwZ0RnXmyfVMa8bWL6kF2sIRxWBLHkgAWLMDM4MYTERJ0gcbYqMJcAT1nB6KmK/xyN8Y946C0DgYdCOLaPxpLUhUktOLhZNpy5St/0xT6ZhTkSx1TMsjN8AF8n4uSYwoKf1Qj6xj8sfgMC/wIznLyTcfCPza2iX00KxsiBqzQl1UzudSqyq4b/Sy2mFXyfPIPv8XFueND2iMso35XVSQEY+SuG9Ug372ms9Xjyf/iX2jKQbhsFroxvTiN9G1XksSRB90QpF9J03jLf7P7U2vU846zy1JnRl7tTzpMP+7aOFGOW+g4QIK38HGmtCPJryOTZFsYNzRFB0lkYPWC+GUxl+OQE/liWaFW0X0d8ZxaTOOOl0EkCtBhrQj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199015)(82960400001)(83380400001)(36756003)(86362001)(107886003)(38100700002)(6666004)(450100002)(31696002)(66946007)(66556008)(316002)(31686004)(8676002)(30864003)(5660300002)(6486002)(186003)(2906002)(2616005)(66476007)(8936002)(4326008)(478600001)(6512007)(26005)(41300700001)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVBzZ0pVWVVNZ0sxdStZU1V0eXhhLzFISndQVTg4K3BmaElRTlRRK2Z4dm8x?=
 =?utf-8?B?OFZLcHROcjhWREMrY1BnSDZDdzVTRzFiK2daVENYS2F4eXp2Tm43SEdDZHFD?=
 =?utf-8?B?RDFUSUZuSUdRS3o5bGpYL0oyZjV5elJ5ZkxZUkh1bURvUVFFc2k0UzJhMGxq?=
 =?utf-8?B?VjIrM29OVUxyWlRwbFY1WWV5ZlpXK2pZcTROZ3Nxc2hrajNNOEE0ZmdYMTdX?=
 =?utf-8?B?UzNaOEd1M1RCYU8vT1MvdGNoNUZzak5PSld6K0sxUDRFdkt1dk9RM01Nemh6?=
 =?utf-8?B?UEJGd0RUaEIvRGg1QjYwdUNEYzdmMHBZUFZuNTdzWVBReFFuNndxTVhrQmk1?=
 =?utf-8?B?UU9VdTZwOFhySE5nUlFkZCtYQy9QZk4wZFRmaDRHOUhHSVVMTFNJYTM5dmFW?=
 =?utf-8?B?UFFHMkRIeXZTZnJGTDQzNlIrRllCZ1liU29MWCt2MUxiYXUvaWVrWW5wMGlQ?=
 =?utf-8?B?RFdhT2grblZFMExHU2Q4K2luMVdZTzA2UGJpWFhBR1cyN3REY1FUM3RNU2gy?=
 =?utf-8?B?QmxXY3JPTy9MTFdOTXB0NldrMHRRNUpST2E1aVVpUzNFRUF3RXl6RmZlQUhr?=
 =?utf-8?B?UEg5b1VSM3ZXTVI4dExUNkhwcCtXYmpnbVZaS3Z4dUg0cVVjUE9JQTFJNGVN?=
 =?utf-8?B?MUlEa1g4WDhEaHVQcldsalA5TUlkdHlMQTRORUdsOXRVTE9mbWVxQXhSMXFC?=
 =?utf-8?B?aHBibi8yL2QvcFVURnk3SHMwTXIvb09Ic2Z2MmJZUnJLbk1Ya01qcTFYM3R4?=
 =?utf-8?B?aXF4ZHNJN2ZOczlrTCtZemZVYXhGb3JqM293MG1wQmFrSGtodEJRSXVwT2tB?=
 =?utf-8?B?WFBzYVZ0blVWSTNkTlgwdHdmeVZCa2dqN1Z3Wk0yMUM3TDJwQzRYY1BQNDdJ?=
 =?utf-8?B?VTVDSFAveW15TUY4Ym9RQlRjVkFweVdMd1hOdnBRYWRCbkt1SzBFNzZydWFW?=
 =?utf-8?B?SnVZL1c1alViZTV2ejVRUVc0aW9LVVE1ZVRSUy9icGh0d28vbmc2MFhPU1FM?=
 =?utf-8?B?b2Ric2pJcDZlNGloakdGd3RJTTlzZ2twZEd2N2twOHBhNEh4dzZZVzlXZ21N?=
 =?utf-8?B?UEduREdhck5KWkEzeHZ3RDBJeXFCZCtXRFJJZkFvNjhuQW5xUTFoMVYyeWVH?=
 =?utf-8?B?SmlHTWdWYUg5S3pneEpwQ01XeVBhVlFmQTB6My9YNTdNZjluY2JmdTJKSlRC?=
 =?utf-8?B?TloveUltY3E0dU9tek1nVFVRL2s4aWZ0ZzdKaVpzWG1tbllKbU5JbW1wdHVp?=
 =?utf-8?B?YVFoRWx4UStRY1ZQUEtaQWFlZzE0UW00RXdFMktyRkFybCtsMWdQUnFWT3Z3?=
 =?utf-8?B?dkpZQnpEbmFLUWNlWWlyWnBTWnpFV1c4R0x4eHp4Z2NjQ2xYOXZKTzBpVkZh?=
 =?utf-8?B?OUdQbEJjakV5ZUdDRWJNdXYrUlFmWWxKQXc4R00yT0FlY3N2R2Jybms1NXYz?=
 =?utf-8?B?WXQwVks0aWl5SnRpS1IrRmdkZjBuTmdPOHVQUDZoTFFlTktHaEhHd1hoVHdX?=
 =?utf-8?B?dFdUbHNETkhFTG1ZcVA3Tk02OVlqZW80STVhOUVDNjk4MlM0b3JYVnd0MUcv?=
 =?utf-8?B?cjlBWTBNNUpCYjRGaUNnM0Z1d3NxZTZLc2N2cmlLelUvL1dVbHRTbTRVK2ZK?=
 =?utf-8?B?RHVLai9PbmgrczVSZTFGcXB0cVFZT2RUY2VGblBBOVFPYXNLNHYvWUpMMzJr?=
 =?utf-8?B?RjJpVkoxbVRyQ0gxTDJZM2hVSjBDUCtlOCtOVkJCeUsvUlZpMlZQV1V0QTR4?=
 =?utf-8?B?NXU1MWczWEl0WFFNQU9Oek1LRVJuOXR6b1BqM2tLbGl5VkhLZ3dnTzhjZ0ow?=
 =?utf-8?B?T2xiVTNwMGNMZUZ5KzBlZGNtYU16N1g3TUNRNzk5ZzJGdE45UVdoWjdRU2FD?=
 =?utf-8?B?eENsNlVxL2JsK3BrekZUdGdkY2F1RlpkSjdoN3JtMTJ2aXVORVpNditJekFN?=
 =?utf-8?B?S2lLcmNoYlJBeWZwTG9BOWRVbGlXOGQ4VTNkL1dDVzlCbkRGVmo5WC9GWWZD?=
 =?utf-8?B?NWVVVG1UckJ6NzMvUmh0L1M2QlNRblRGZUJFSlR6K0c4SDBKU1E2ZnNWUkVX?=
 =?utf-8?B?dGJPQW52QkczcVpSTFoxRnc3dUxJWk91UkZaRXZGU1M1ZGErbUpnWjBteUox?=
 =?utf-8?B?a2xWbm5oVStXWEJQdnNucHR1TDI0UnRSOUsvalVYa1E5WWpyTkd3TE52R29P?=
 =?utf-8?Q?kn8/lXj8PPFZuROgFdY1O9c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2575af-f205-46b5-a847-08dab09c9c57
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 00:06:31.2129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftSVlQKZ8tPOaS9mk7c7nS3gcVvsoj8vP/DL6VxAt5YgNwK+bxp61my5Lr752U8zcacBdvqNlz47uqPcopMcHeGJe6ZwL5kVqVMybCB2VRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/6/2022 2:38 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> GuC converts the pre-emption timeout and timeslice quantum values into
> clock ticks internally. That significantly reduces the point of 32bit
> overflow. On current platforms, worst case scenario is approximately
> 110 seconds. Rather than allowing the user to set higher values and
> then get confused by early timeouts, add limits when setting these
> values.
>
> v2: Add helper functions for clamping (review feedback from Tvrtko).
> v3: Add a bunch of BUG_ON range checks in addition to the checks
> already in the clamping functions (Tvrtko)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> (v1)

r-b stands

Daniele

> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  6 ++
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 69 +++++++++++++++++++
>   drivers/gpu/drm/i915/gt/sysfs_engines.c       | 25 ++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 21 ++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 +++
>   5 files changed, 119 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 04e435bce79bd..cbc8b857d5f7a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -348,4 +348,10 @@ intel_engine_get_hung_context(struct intel_engine_cs *engine)
>   	return engine->hung_ce;
>   }
>   
> +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs *engine, u64 value);
> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs *engine, u64 value);
> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, u64 value);
> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 value);
> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs *engine, u64 value);
> +
>   #endif /* _INTEL_RINGBUFFER_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 2ddcad497fa30..8f16955f0821e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -512,6 +512,26 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>   		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
>   	}
>   
> +	/* Cap properties according to any system limits */
> +#define CLAMP_PROP(field) \
> +	do { \
> +		u64 clamp = intel_clamp_##field(engine, engine->props.field); \
> +		if (clamp != engine->props.field) { \
> +			drm_notice(&engine->i915->drm, \
> +				   "Warning, clamping %s to %lld to prevent overflow\n", \
> +				   #field, clamp); \
> +			engine->props.field = clamp; \
> +		} \
> +	} while (0)
> +
> +	CLAMP_PROP(heartbeat_interval_ms);
> +	CLAMP_PROP(max_busywait_duration_ns);
> +	CLAMP_PROP(preempt_timeout_ms);
> +	CLAMP_PROP(stop_timeout_ms);
> +	CLAMP_PROP(timeslice_duration_ms);
> +
> +#undef CLAMP_PROP
> +
>   	engine->defaults = engine->props; /* never to change again */
>   
>   	engine->context_size = intel_engine_context_size(gt, engine->class);
> @@ -534,6 +554,55 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>   	return 0;
>   }
>   
> +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs *engine, u64 value)
> +{
> +	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> +
> +	return value;
> +}
> +
> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs *engine, u64 value)
> +{
> +	value = min(value, jiffies_to_nsecs(2));
> +
> +	return value;
> +}
> +
> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, u64 value)
> +{
> +	/*
> +	 * NB: The GuC API only supports 32bit values. However, the limit is further
> +	 * reduced due to internal calculations which would otherwise overflow.
> +	 */
> +	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
> +		value = min_t(u64, value, guc_policy_max_preempt_timeout_ms());
> +
> +	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> +
> +	return value;
> +}
> +
> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 value)
> +{
> +	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> +
> +	return value;
> +}
> +
> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs *engine, u64 value)
> +{
> +	/*
> +	 * NB: The GuC API only supports 32bit values. However, the limit is further
> +	 * reduced due to internal calculations which would otherwise overflow.
> +	 */
> +	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
> +		value = min_t(u64, value, guc_policy_max_exec_quantum_ms());
> +
> +	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> +
> +	return value;
> +}
> +
>   static void __setup_engine_capabilities(struct intel_engine_cs *engine)
>   {
>   	struct drm_i915_private *i915 = engine->i915;
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> index 9670310562029..f2d9858d827c2 100644
> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> @@ -144,7 +144,7 @@ max_spin_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	       const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long duration;
> +	unsigned long long duration, clamped;
>   	int err;
>   
>   	/*
> @@ -168,7 +168,8 @@ max_spin_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (duration > jiffies_to_nsecs(2))
> +	clamped = intel_clamp_max_busywait_duration_ns(engine, duration);
> +	if (duration != clamped)
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.max_busywait_duration_ns, duration);
> @@ -203,7 +204,7 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
>   		const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long duration;
> +	unsigned long long duration, clamped;
>   	int err;
>   
>   	/*
> @@ -218,7 +219,8 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
> +	clamped = intel_clamp_timeslice_duration_ms(engine, duration);
> +	if (duration != clamped)
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
> @@ -256,7 +258,7 @@ stop_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	   const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long duration;
> +	unsigned long long duration, clamped;
>   	int err;
>   
>   	/*
> @@ -272,7 +274,8 @@ stop_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
> +	clamped = intel_clamp_stop_timeout_ms(engine, duration);
> +	if (duration != clamped)
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.stop_timeout_ms, duration);
> @@ -306,7 +309,7 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
>   		      const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long timeout;
> +	unsigned long long timeout, clamped;
>   	int err;
>   
>   	/*
> @@ -322,7 +325,8 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
> +	clamped = intel_clamp_preempt_timeout_ms(engine, timeout);
> +	if (timeout != clamped)
>   		return -EINVAL;
>   
>   	WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
> @@ -362,7 +366,7 @@ heartbeat_store(struct kobject *kobj, struct kobj_attribute *attr,
>   		const char *buf, size_t count)
>   {
>   	struct intel_engine_cs *engine = kobj_to_engine(kobj);
> -	unsigned long long delay;
> +	unsigned long long delay, clamped;
>   	int err;
>   
>   	/*
> @@ -379,7 +383,8 @@ heartbeat_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	if (err)
>   		return err;
>   
> -	if (delay >= jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
> +	clamped = intel_clamp_heartbeat_interval_ms(engine, delay);
> +	if (delay != clamped)
>   		return -EINVAL;
>   
>   	err = intel_engine_set_heartbeat(engine, delay);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index e7a7fb450f442..968ebd79dce70 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -327,6 +327,27 @@ struct guc_update_scheduling_policy {
>   
>   #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>   
> +/*
> + * GuC converts the timeout to clock ticks internally. Different platforms have
> + * different GuC clocks. Thus, the maximum value before overflow is platform
> + * dependent. Current worst case scenario is about 110s. So, the spec says to
> + * limit to 100s to be safe.
> + */
> +#define GUC_POLICY_MAX_EXEC_QUANTUM_US		(100 * 1000 * 1000UL)
> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_US	(100 * 1000 * 1000UL)
> +
> +static inline u32 guc_policy_max_exec_quantum_ms(void)
> +{
> +	BUILD_BUG_ON(GUC_POLICY_MAX_EXEC_QUANTUM_US >= UINT_MAX);
> +	return GUC_POLICY_MAX_EXEC_QUANTUM_US / 1000;
> +}
> +
> +static inline u32 guc_policy_max_preempt_timeout_ms(void)
> +{
> +	BUILD_BUG_ON(GUC_POLICY_MAX_PREEMPT_TIMEOUT_US >= UINT_MAX);
> +	return GUC_POLICY_MAX_PREEMPT_TIMEOUT_US / 1000;
> +}
> +
>   struct guc_policies {
>   	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>   	/* In micro seconds. How much time to allow before DPC processing is
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 693b07a977893..c433d35ae41ae 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2430,6 +2430,10 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>   	int ret;
>   
>   	/* NB: For both of these, zero means disabled. */
> +	GEM_BUG_ON(overflows_type(engine->props.timeslice_duration_ms * 1000,
> +				  execution_quantum));
> +	GEM_BUG_ON(overflows_type(engine->props.preempt_timeout_ms * 1000,
> +				  preemption_timeout));
>   	execution_quantum = engine->props.timeslice_duration_ms * 1000;
>   	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>   
> @@ -2463,6 +2467,10 @@ static void guc_context_policy_init_v69(struct intel_engine_cs *engine,
>   		desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE_V69;
>   
>   	/* NB: For both of these, zero means disabled. */
> +	GEM_BUG_ON(overflows_type(engine->props.timeslice_duration_ms * 1000,
> +				  desc->execution_quantum));
> +	GEM_BUG_ON(overflows_type(engine->props.preempt_timeout_ms * 1000,
> +				  desc->preemption_timeout));
>   	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
>   	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>   }

