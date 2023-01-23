Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC7678B29
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F3410E5BB;
	Mon, 23 Jan 2023 22:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E60F10E5B7;
 Mon, 23 Jan 2023 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674514671; x=1706050671;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JazzOKMDk+2gYPVjn/4o0quNzim0itugcE09OglQhc4=;
 b=YSDu5Li72DUzXCpq7P+mghSTavjFgt1yENEfuC/NvfsSUKQIJvc2IwU/
 1p3t2ugcntwoKefse8sOtGelcgRe0AssjTvcq/n5dip9ge8+ImOXCLydE
 dLMcRaWJaaKAI6LGLpl3dAxI+e9O9qx5JUp+Qjr65JlPKqw5zmcqDV9b1
 pXwwfByJK6lnc5bk5q9Gn4dNdyd2MerA0ViBJOitygGCcnp0inK7Xe0VN
 0/NzzwhhcqpQaVSHRHveI4w3HGmLveN7onLjtnk4P4BuJVr+0pZ62f2h0
 0myjvVtjF8tO8H02aUWTZBjVnsKVB7FwDzQ73pkGRFNXS1je5l524sqjp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="314077109"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="314077109"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 14:57:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639368042"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="639368042"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 14:57:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 14:57:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 14:57:50 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 14:57:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDwdSR7Ksra77602b8OJ3b4ctY7hoQo/2cTZv/nHehB5TIHEzOotblNf5qR/DU79Ti23Z7TnyaBxJsLy/832EmFoppY8hP4IwRS4afqraYEPNa7zCdxHeRk65SEHFq+nj++prQ7l0JHQBZtqo/xZkEnJ4x83IJVgqjkLKI3KFDJuoezHRRRWCt2D6r76Cuq2YmdToL5A9PQsSD6yK/FlZm+XnY/qAUDXa9IpqlkxluIezbSvSjAxRiladuQ5knI8UITNNNlUS6jFqAMH+uwDRX5I2CslYlEpmCtjh+1yjm+cQ2Efjn8Th8WqjlJtsbHXGk0+SrLVzVM2jvivF+BvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEaDniUkz2idfifJRxMHJegLuhqcGi/zWNGbkgffRuM=;
 b=MoAdDxuU0nhkMXXy7dkBSEQ/8cMiv1f+cNErT64prtJ0TLm6GI7ld/IQOkC5bAoXPowDkwbPMI8U0YBFUfRYx0a/dxxV5zKXriGKQ4hVfgKoqgK648/KyT1+yjir98JrGReOxck8t73WhptaaSZFKp81YWVW79YN4LFXsn4V6ZFCkir3VESepFc4ACYsOaIAG/APzvLjIaL3HoeD291im7rXpy5Ae/5dVBvretzxtCBPqc7MEg6hMVqGN5+X9lWnHAwActVk3mdR9cv/mjcuCK94B/HNga2Djb5tI9P5DiTcQQ9hnwqCpG6wxl9bm1tPKyhEgxcswnsZ17o0LRu9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 22:57:48 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 22:57:48 +0000
Message-ID: <005d9f14-fb0a-326f-51f9-0f8486f37832@intel.com>
Date: Mon, 23 Jan 2023 14:57:45 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 5/8] drm/i915/guc: Update GuC messages in intel_guc_fw.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-6-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230120164050.1765-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0038.prod.exchangelabs.com (2603:10b6:a03:94::15)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c0a6f8-63ad-4d90-3c4a-08dafd953f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyU+Ca6uH3gNy6ZwioxMmbEdvoBUd6WkmP4yljMo1ddIlUnYdVlH6GolUpNWhC/XMx0Avtk7h+yxLFEdbnnpIbqVfZzqcc7B8mThWDO2diOu6tliCHHryQfcA3/kPGZ3/YyGoIEm6Hoo7/B3wOooCpw8Mu4KxVpWhjX52sXML4WRpY5rA+tE9WrFZccxG2ySKmlYW+sjI3RIxLblZI3k88+VSE4HKxcCl9zFaedKHbsw/c3d5c/HvLEMzXRm/yB1x2Q3KM/hd/Jf7tPjUR1/LiNZ1z6i7LJgvtu3xQclx6eAYqVUbfEoIUpfjllJVrKl9B5cCmjgdHSqFcdy4Eh1uwXefWB9VNb1Xzthq5maYNJpBJDxLJornN68Lf8hMXiA8Qa7MA14jztLmUstP51/bsyMgCFP1zxS8drxvonl6Y5Ykl7VOCz7EIAvD7zynT7LCQ6NfSz9Rtzai6z6xmbLgMGnMB1SAykmxWiiepQqhcRUQ4xN2O2vzqa8vWjhZ6hFdVcd0TQHvyeMguPwabVCwTBOLhGBfwhOls7VpuI/lL4PYwzsqgPXg+YJ4VgQQjnEdsk8aPOsbeKEpXzW4pUVQNhK01oEaDzBMKpV2utbY5pANV9+NPa0BcskEBbCrDgeIIA0PYPAQP2OdS+n8aaWWWS5q710YLrgRNGhV0ulWLMBWER+6S+s+RR9fg8/DFIp8RFYxc48bX1/ETxwhDn77ksP/pMATyHVYCO9aqZx6Cs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199015)(38100700002)(83380400001)(82960400001)(41300700001)(86362001)(15650500001)(2906002)(8936002)(5660300002)(8676002)(26005)(6512007)(53546011)(6506007)(186003)(6666004)(66556008)(66476007)(316002)(2616005)(66946007)(478600001)(6486002)(450100002)(31686004)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWFCWmk0SzA0YzJqMVE2QnJZQ0ZOcXBVYzlFRzJ6bERVazluREl6ajlOL0pG?=
 =?utf-8?B?cFpxWmhlU2U2ajVDTDlDNENFTGQxbk5TY2dDMEZ6am1WVFRUK1l0MGdTeHlZ?=
 =?utf-8?B?NVRhcW11M1BWQXdtdkxVU2xNSFNiY2grTEFRQThCNFFER2xDRlFZemMrWVlE?=
 =?utf-8?B?THBZd3hQOW45UllzL3FWczVZZEZ5SHdYa3RlRi9SMDN1YmNST1A5RDRtVkJk?=
 =?utf-8?B?WDlsdnUyYWkvTkxGSkNRdGhDMFAxYmpoaUViRUgyUk52aWRJZXE3c0pLc2E4?=
 =?utf-8?B?SlIvbmx4QmRNekI4TEZiT0JERys2RUpYVkZWMU9mVDNrdk0wbXZVK1BHb2tX?=
 =?utf-8?B?NkhaS0dOcjZYaGkzUDVBOEFYUC9wMGU0RUpLTzhSbnFUdnd0Z09wS1pIKzZU?=
 =?utf-8?B?RHlzRW5rMXRQbU0vWXREb0I4ZCtsUEFXS1dGRWY4ZUtnaGlDT1Brc3V2Yk95?=
 =?utf-8?B?N3Y4MFJyRnI4eDRHQStYdG15K1J6OG1oRzUraHBtN0NGT0NqVnhXSHJXOEdP?=
 =?utf-8?B?UlFBY1B2Y3hCRjJMM2UxdzJpR21Cb2JjT2k1cmd6ckw1ZDJuc25RQ2tWTDN6?=
 =?utf-8?B?VGhlUlIxWkxqclh0MWtHYTFRWVFSQnZOazNUM1k3dk95VVk5UzBNNFRMenl6?=
 =?utf-8?B?WlhST3VUS05JYkc0YmlFdUk1VGFSUGY1MjR2dEFuSXp3UjNoSUIrODdKZDIz?=
 =?utf-8?B?eTFIOWkwWFdyQ0VHRkY1cTFaSmtyT3lNQnR0WHpBSzlKWHVueEROQktyWUc5?=
 =?utf-8?B?azZUYWFwQnlWSExwMVRsZ1pOakRwV0taR1ZkdFBpMUlZMDFVUmp1cS9lQ1pT?=
 =?utf-8?B?REdjeHhTNWxqamhub1dpbmhGb3RJRHRIVG93Q3F4ZHNMZjNBQ1l5bnBqclkw?=
 =?utf-8?B?YXF4QlhuWlFaMFNhMFk3cEpCSWVxcmgzdXA3ZmVIVTY3MkV1djQrMTJUMk5M?=
 =?utf-8?B?T1BXRE5ZRU1HbHdqNGdSYUxBU0k2UE4zdkI1amVpdTIvaE9YN0pBb3doRXcy?=
 =?utf-8?B?ZGpMemZxaFhPRFNZVDRWRHpDdDJ3YkRzTjZtMnQ3dlk2OTJnS0JuYjRPNklX?=
 =?utf-8?B?Z0dUd2NvWXY5NE1JSWIwQ2d2Wng4WEltUXp4S00wYTQvc2QycFFLMGZOSzZG?=
 =?utf-8?B?bDl1YmpSUDk1TFdrT0dNWm1uY0dxWFAzbngwbUp2Sjlia0RvU1lyblo0dlFC?=
 =?utf-8?B?SHAvRGtEaU41RDcySUErK1VPblFFYXhDeXlPOWZBNkdMUU9WNWc2ZkpIa0pq?=
 =?utf-8?B?ZFh4cFRtbU83NUhLdlZReDArTmNaSi9Fd08vaS9rQWV5NHlXb2FPNktNdmJl?=
 =?utf-8?B?TXdUWDNtbkVwK0R6UjVxRTAydkdySkxpdDc1NldvQ1l2TlNxbWxQZHI2WE83?=
 =?utf-8?B?K2hsMzZVMFlWQ1FJQkdod3RrWW9zVmwwZStNeHErbUlXMnRmdnZpYnJUN1B5?=
 =?utf-8?B?Vy9wWGhnWGtDZ09sczhOZ2tlV2JxeVArV2V6RlI1RWtRSUdzNzVIeHFjd2pS?=
 =?utf-8?B?Unp6MndweDQvb2o1WlJzWENhWFlINy9xWTRFalRnZ3QxOGJoZmhuazRXYU9K?=
 =?utf-8?B?a01sSE10cmNGTWpUV2kwTlZKa3F5elBnVkh4RlV5d3BVTC9sYkFvdnlJaGRN?=
 =?utf-8?B?T3MrY1A2ZFpZeTRVeWNUVkNxbEhFZk5nR21ULzczNU9GU0pJTE5xdDJHT04v?=
 =?utf-8?B?MFNORi90TzNGWDEvUEYwNE05T0VVREc5SGhGSUNRQWZiUnNQWG1TUm1TZ0pG?=
 =?utf-8?B?RURkUkxTYmQwQVNLSHF1Mk9DbW9OUWNSbGVGeVQzd0lSZklRMjRxVUt5Mzdz?=
 =?utf-8?B?T0gvYjNCbnZIWDBjcGI5OHo5Y0ZTZWd0NDE4QTRnZjFUVnZsMHJOeHVQaUEv?=
 =?utf-8?B?VEZnUmhyK044S1BYdyt1U2QvVUp1bXduVWZIRnQwQ0FEa3hvSkxuSXJEbUxx?=
 =?utf-8?B?Q3ZXNzhhMlB4VzdPdTQ1SHB1ZUF4SG5UcXZUNFhNOThSbDBXTHl3R3ZBb3Iz?=
 =?utf-8?B?eDlPeDQzVUJhcklvdCtaQ2pEQnM4VU1qd2dMdkVqT2lZcFRZUVpyUllCM3Qw?=
 =?utf-8?B?T1FvNW1BZGdzSlZsQVlqM053bm9Ya0U3aiswWHpPMC9KVlA3bzVrQ1c1dmFr?=
 =?utf-8?B?bzdNcFRJN3lzVVkxSG8ra0pxNmIvTE1Tc0V2S1JhQnE1YlBoNVhaZm83MVlJ?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c0a6f8-63ad-4d90-3c4a-08dafd953f4b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 22:57:48.1289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQFjeoxcduReRtAtTitIGy8za1ZEw6hNt8hDkkFPEZcW/TpQTcDY0I8MtRm5SI+hI+yoZeAchnQMzwJuEkJ+0V+SnwhzCREoMuBlXEQcdP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
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

On 1/20/2023 08:40, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 5b86b2e286e0..3d2249bda368 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -13,6 +13,7 @@
>   #include "gt/intel_gt_mcr.h"
>   #include "gt/intel_gt_regs.h"
>   #include "intel_guc_fw.h"
> +#include "intel_guc_print.h"
>   #include "i915_drv.h"
>   
>   static void guc_prepare_xfer(struct intel_gt *gt)
> @@ -103,8 +104,10 @@ static inline bool guc_ready(struct intel_uncore *uncore, u32 *status)
>   	return uk_val == INTEL_GUC_LOAD_STATUS_READY;
>   }
>   
> -static int guc_wait_ucode(struct intel_uncore *uncore)
> +static int guc_wait_ucode(struct intel_guc *guc)
>   {
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	struct intel_uncore *uncore = gt->uncore;
>   	u32 status;
>   	int ret;
>   
> @@ -127,10 +130,8 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
>   	 */
>   	ret = wait_for(guc_ready(uncore, &status), 200);
>   	if (ret) {
> -		struct drm_device *drm = &uncore->i915->drm;
> -
> -		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> -		drm_info(drm, "GuC load failed: status: Reset = %d, "
> +		guc_info(guc, "load failed: status = 0x%08X\n", status);
> +		guc_info(guc, "load failed: status: Reset = %d, "
>   			"BootROM = 0x%02X, UKernel = 0x%02X, "
>   			"MIA = 0x%02X, Auth = 0x%02X\n",
>   			REG_FIELD_GET(GS_MIA_IN_RESET, status),
> @@ -140,12 +141,12 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
>   			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>   
>   		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> -			drm_info(drm, "GuC firmware signature verification failed\n");
> +			guc_info(guc, "firmware signature verification failed\n");
>   			ret = -ENOEXEC;
>   		}
>   
>   		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) == INTEL_GUC_LOAD_STATUS_EXCEPTION) {
> -			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
> +			guc_info(guc, "firmware exception. EIP: %#x\n",
>   				 intel_uncore_read(uncore, SOFT_SCRATCH(13)));
>   			ret = -ENXIO;
>   		}
> @@ -194,7 +195,7 @@ int intel_guc_fw_upload(struct intel_guc *guc)
>   	if (ret)
>   		goto out;
>   
> -	ret = guc_wait_ucode(uncore);
> +	ret = guc_wait_ucode(guc);
>   	if (ret)
>   		goto out;
>   

