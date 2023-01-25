Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EE067A7F9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 01:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C07910E0BB;
	Wed, 25 Jan 2023 00:49:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CCF10E09E;
 Wed, 25 Jan 2023 00:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674607777; x=1706143777;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=501JC7o8UkQhfLKKW4dDEUv/5GjFRAAtqnUo02E5uvo=;
 b=KdeEjAxLetv4ONaidd1BoCofpLWY1QzxETBZPqpD+wd9pwcJvWVS5n5U
 y42zJf6liIPu60iCHUUuvAHnXyi93TwyQ1TFP0c2oTNuQRrF+6Ezyq9jQ
 0/PZ4aeUNxkbko68xr7mpX8WYzNVFwAU8luIyGzrYbmODLWz/vsmHrpYZ
 /0x4LLek9maExLwV1y8G1RrG4yF+mVVIGrHBw3Gz1c8XO4D9iEKUvRHME
 0Mtqbi4F2FWTbM8qHk7ANCAdvauNczuKHO9H+aMxDrVgmPvq418doKo1+
 kJJmGg+7R1FkSzcieFwVhCIiX2tYd7WpFLu7v8HAioNoS/eRc5Rn3xQfW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="326486116"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="326486116"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 16:49:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="662332399"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="662332399"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 24 Jan 2023 16:49:36 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 16:49:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 16:49:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 16:49:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 16:49:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lywau19OAWnQZvYnlf/cvwfRoiCWMd5JTa7+bdgsdZCjGFAlfY2fo0/L65velhLb5RPgSMI9kKdENNuBPYonVV1vE6ZbSrlehgyajxRQvi7uZ047CCf8Rq57j74eFhUy8ysF1miZ8mFG8yBW3xEXxydVDhkXlPmKq96XwR9aPbXHoH3j5CdaasKUaHta2snQILVxEJ0rFIEvJtQD+CrByxgh7OS7kqHY1ynp7iNtowTD5zOZln24hvK6T0Wxt9XEMcaYIZA/TKOCqSVVG+Ff/HA9m84WYlO3N6tNdsoK1H8n6pwISOa5g2p2SgeaNJuY7OB3Eeblk36XboYNBvjFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvUDO2DY0GHTPkgwo+lGMqwZZ+gOUdOoJeAitblWlxg=;
 b=h5LCH0swg/IjDWTwd3C3y/Hqlq32HJihkRsJaievmL+4nCXNeUt1Qr6AdLeLftOU5wCl2kmPU+Fg+Ndn3kc3JXCp8izz7hsRvkm8nana6Aq+8gMYfwHbiszQI+BnBb5XltIxmmi0jY7/JjpMapu3yJl8QtT3OU6d9xj9+afGMuZIszUEpZZGIY3Xp92Z49auI0e/8Dzgos1UaLXScweUl8BqqgH7XEwujRgu723NfzvuQJsUIIcHUuJsAgaSp7wWP1Wb63hT7y7ffYwfdD3PSyPpfkMsrCUzPMDA42uBVHgbw9JivncRN/zBsB55ce1PYN44OSRHhyTOPCYajPwD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5689.namprd11.prod.outlook.com (2603:10b6:610:ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 00:49:33 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 00:49:33 +0000
Message-ID: <d2a8c27d-d7e9-d7ff-8c31-1da6eac9dd0e@intel.com>
Date: Tue, 24 Jan 2023 16:49:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v4] drm/i915/uncore: Use GT message helpers in uncore
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230124205426.1444686-1-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230124205426.1444686-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH0PR11MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e491e9-2765-4ba7-90b5-08dafe6e064b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x37sJQiX/tMMdmTBBuRjgIpZPjn0dT18rcneakvLH5+meD7bo+2NseVpkm2qcbiKWK8VghhhsphgLcAAs2+7IYO8Q/3qfm+Qa2+JKdgLX4XO4k7sJONpxzIoRJfrK4JkPV7CZpiWtiuWzpfG0QTVv/i0IqvW4+42/wym5OAejbbkXmnpx4dieZvSB9CgzeV30W8Ge54Avqi1Euxj4IuSPTudfGYiKW0nLG+beIOxT3CC7lV1X+N4wEvexpoAy+zcJrFA4XzoYvpem0gX+Gu95IliMaW4fEl2wUY3XBQYEFgbgm4esPXnl58bQHFMe9evRfW9TwX9r4q3wO3HppvT5nVKta7zGzpF8PiMNVYt28duWZwo5mhVlSC0+QBhDwbSXPxScLiKkxIhMmhMllXT0O/Hwmengj1O2/cAwY4HyJf09QaMooVY6YTM/qONejjsRRsOl3N3Dx0+WypSRsxU+XeYJQ88tX/5zApkE4TT50yyoF7Q1h/TQkKDK4BzMYJnRQHsJn9e+nobzsUBOeC1S8zEj0+0cFJBU539Bc2afMsuxcSTy948UlBpzM+m8YZdtSj01lcq0fK63+o5EUN2eIysTVztBPEu5Q3dg9666AZk7VFxRieiKM5I1pK4aVuXs/AVl1WMlf5SBjCk2CuV7/SqkzZYY2TQy1CPmCGn+YMaRU6pwEvOeJQaepReySUx/b1iRrxHaCC42nAayBymxjbRQ4iJM9Z7O17/GHzIf7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199018)(8936002)(5660300002)(30864003)(66946007)(15650500001)(86362001)(41300700001)(6916009)(4326008)(82960400001)(31686004)(2906002)(66556008)(450100002)(8676002)(38100700002)(6512007)(66476007)(316002)(31696002)(36756003)(6486002)(2616005)(6506007)(53546011)(26005)(186003)(478600001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzRPZ1l4a2c4U1FoSlRSdzg1UzZNSGhjRCs3NkQ1dlBqNHdveU8rUDQyTUNJ?=
 =?utf-8?B?c3NJLzF0SnhwYURYOCtoNWl2a29uWFBvU1M5VTFzOWZOc0xjZ3NFbjdFZnJD?=
 =?utf-8?B?Z3FzblU4dDUweUxsaFFHRy9HZFprZ3owNUdsd2E2WElueGpBMnBjWGFWY1dr?=
 =?utf-8?B?M09UWHdsNVA2S3NuVlZTV0E3d0NSb2JoSmprRlJFTi94SmlHM3NmVGNPTERp?=
 =?utf-8?B?anc4Q1E3TFlQSGw4UUdKdE0zcmJmSFVZMkFlZ0wxN2RVS3BYb0IvNkJLb0N5?=
 =?utf-8?B?UWhRK3lnaVVxNkVOelpSdDl3MjdhOUJmUUFYLzNSWXVmc1NTRkRtZzZtaHNI?=
 =?utf-8?B?Y2crVFNxMmJMd3JwVkFOZjB6aEhHK0IxaTRJajcrTTdlL3I5RitQMm5BZmhx?=
 =?utf-8?B?U2RtMnIxYm9IWjNnTzJ6b3AwUk4xL0FiSUU2RWRLbVZGbVlxb2g5R3AvMXU2?=
 =?utf-8?B?Sk5LY0hWRTZwNEowbGJjOS95aUI0TmJMMlZOYnlpMThNUm1aRnpmT25nSzM1?=
 =?utf-8?B?SXY3bktqcCs3YjdsZzQxTnlxN2k5dURHVC9wM1ZyTnc0bjJ2UFpMM2VxWEgr?=
 =?utf-8?B?NzJCZVhPUHFTVVNvZklZSTNGUmdmdlpKbjZXM0JWRk00eEJ5KzlEb2Q4eGFV?=
 =?utf-8?B?VDVSaWR2dlI5ZnJOQU1wRXprR0JwOUZ3c0tBY3hDRWZDTlp1TGxtRjNleGg4?=
 =?utf-8?B?WnpCS29LSHlEVTk5RW5uWW1lY2krT3hNNnFIWWZ1VXhvMUJiUTVONjJJNkNw?=
 =?utf-8?B?ekNFK0Z4TFBRK3dFcU9RTWl2cjRBaVVTUVE0cVdpMVE2MlMvdlBtUkg4V3dG?=
 =?utf-8?B?OXBscURqV0ZPNC9RY1BsSHFlVktkUmJ6VTFMY0xaQ09HL3FxbVhJdXRxc1NU?=
 =?utf-8?B?ZW5icytGekVjY2p4aytDK1g1OE5pa043Mjh0RGNTY0VoeHhPWEwxUWxoZE14?=
 =?utf-8?B?bmlUaVp2Z2cvRXkyQ2JkOHphWUFTYy9xZ0NjMExjcGovQXNrTHh6ZW45ZGFh?=
 =?utf-8?B?bEw1TzJXWDdOUHR4RUxzQ1JaTU9PU0NLWmdtS3NhRm40RXBJN3dCbG5ZZ3Vn?=
 =?utf-8?B?Y3A2SXAxWjNLcitReGUzQjExeVIreThhNHVCbHVXQk5TQUtGaGRkT1F0U2Jp?=
 =?utf-8?B?UmhGOVg3SjZNT0ZPVUdyeWhTNXQ0OG5HMnU2eUFURFR2WDJLSzlwd2xFeXZz?=
 =?utf-8?B?bUY1cEtiOWs3YXlxR2R5aXVPRzRENE5mMFMzeldvQnV1eENhdHpEaUNycWFu?=
 =?utf-8?B?QWdBN3Y0ekczM1VoU2ZOMVFkOVNTYjQ0WG9wRWRBSUR2UDVMS1lPZTZrS0xY?=
 =?utf-8?B?Mm5qdjNITlA1ZjVSZWRMTWdoWXM5a2V1dmFBa1Y5emdCWVM1dHVNUU4wb2RY?=
 =?utf-8?B?Mzh2UkFRYjhqcjZiN09mZFBTS2oyN0pzNG01VGozRzRNSlpYYmVHTk5YUDRJ?=
 =?utf-8?B?M0h1SjZKdythZ2tWUDJpUGJTN0xzc3JjNDQwL1hUNUN0SlZsa0l5UzU4RGpK?=
 =?utf-8?B?dHdIa0hlWkFVNW9XTXVzVExCRXF3UXN2Y2p5dUs3VWJ5U1h3UG1KbDNJZk1q?=
 =?utf-8?B?cEhyMG9sdHpJbDExdzRIY1llVWUvSEJnQldVSFhSaGdBYk9rQlZoY2swNWVS?=
 =?utf-8?B?ak9zVkxETFFPUThMMVhhV0g5cFlqTXdmT3ZaZjlKeEpnanQrd2xpQ2FNNkxT?=
 =?utf-8?B?VWpoRFhMV2ZDcXBzcHduQVZSMVF0d3Q0TUZGblNWVkJTSHJZZFl1WkpkZ1da?=
 =?utf-8?B?c1dscU9paEszUFZnNzRCek9wSU5RNlMxRG8yZTRjeGtPQnFnWEN4M3gwcUpW?=
 =?utf-8?B?U2FlbmJRZUR1dm1CRFJuVEdWbHhqUStjSHVaSDZxYW5MenNaRnphekdNWGxR?=
 =?utf-8?B?WE4yeEJTd1h4akZQN0pWSnFTY2JvSWFxTnF5eFl5UzBsdFZBdTRBaGVSbzNw?=
 =?utf-8?B?MDJqWDFKdmFlV01UZlRMTVFabGsxckJ4N0tYVXA2ZXFNV3RDTDVLVEt6ODJp?=
 =?utf-8?B?Um1QbEFEZWNnSFhBQ1lKY3NNbFg4WktoQjFnSG1JM3NVV205U2RHR3dIZGg4?=
 =?utf-8?B?d2pJd2ZFRWpyY0haSTREekdmNVRqWW9tY3NwUWR1enJKbyt1T3pNQTJDUFRv?=
 =?utf-8?B?SDU2MUgrd1JqNWJ3YVNJMkZyY1loMWVuVU5YaXgvN24xWmIza0FRSHJsVUg3?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e491e9-2765-4ba7-90b5-08dafe6e064b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 00:49:33.3382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8eOS92o0MjqpsN59PXLs+2j0T9ST2y8c3DRTu76yl7V/dvMpra02vlp2PKrt90rh1MepY1nNpbj9w2QJsZWqKK2cTt7VXX4/4pn/1xnZIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5689
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

This is actually v1 not v4. Not sure how that crept in!

John.

On 1/24/2023 12:54, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Uncore is really part of the GT. So use the GT specific debug/error
> message helpers so as to get the GT index in the prints.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 133 +++++++++++++---------------
>   1 file changed, 63 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 8dee9e62a73ee..4e357477c6592 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -25,6 +25,7 @@
>   #include <linux/pm_runtime.h>
>   
>   #include "gt/intel_engine_regs.h"
> +#include "gt/intel_gt_print.h"
>   #include "gt/intel_gt_regs.h"
>   
>   #include "i915_drv.h"
> @@ -83,8 +84,7 @@ static void mmio_debug_resume(struct intel_uncore *uncore)
>   		uncore->debug->unclaimed_mmio_check = uncore->debug->saved_mmio_check;
>   
>   	if (check_for_unclaimed_mmio(uncore))
> -		drm_info(&uncore->i915->drm,
> -			 "Invalid mmio detected during user access\n");
> +		gt_info(uncore->gt, "Invalid mmio detected during user access\n");
>   
>   	spin_unlock(&uncore->debug->lock);
>   }
> @@ -179,9 +179,9 @@ static inline void
>   fw_domain_wait_ack_clear(const struct intel_uncore_forcewake_domain *d)
>   {
>   	if (wait_ack_clear(d, FORCEWAKE_KERNEL)) {
> -		drm_err(&d->uncore->i915->drm,
> -			"%s: timed out waiting for forcewake ack to clear.\n",
> -			intel_uncore_forcewake_domain_to_str(d->id));
> +		gt_err(d->uncore->gt,
> +		       "%s: timed out waiting for forcewake ack to clear.\n",
> +		       intel_uncore_forcewake_domain_to_str(d->id));
>   		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>   	}
>   }
> @@ -228,12 +228,11 @@ fw_domain_wait_ack_with_fallback(const struct intel_uncore_forcewake_domain *d,
>   		fw_clear(d, FORCEWAKE_KERNEL_FALLBACK);
>   	} while (!ack_detected && pass++ < 10);
>   
> -	drm_dbg(&d->uncore->i915->drm,
> -		"%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> -		intel_uncore_forcewake_domain_to_str(d->id),
> -		type == ACK_SET ? "set" : "clear",
> -		fw_ack(d),
> -		pass);
> +	gt_dbg(d->uncore->gt, "%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> +	       intel_uncore_forcewake_domain_to_str(d->id),
> +	       type == ACK_SET ? "set" : "clear",
> +	       fw_ack(d),
> +	       pass);
>   
>   	return ack_detected ? 0 : -ETIMEDOUT;
>   }
> @@ -258,9 +257,8 @@ static inline void
>   fw_domain_wait_ack_set(const struct intel_uncore_forcewake_domain *d)
>   {
>   	if (wait_ack_set(d, FORCEWAKE_KERNEL)) {
> -		drm_err(&d->uncore->i915->drm,
> -			"%s: timed out waiting for forcewake ack request.\n",
> -			intel_uncore_forcewake_domain_to_str(d->id));
> +		gt_err(d->uncore->gt, "%s: timed out waiting for forcewake ack request.\n",
> +		       intel_uncore_forcewake_domain_to_str(d->id));
>   		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>   	}
>   }
> @@ -366,9 +364,9 @@ static void __gen6_gt_wait_for_thread_c0(struct intel_uncore *uncore)
>   	 * w/a for a sporadic read returning 0 by waiting for the GT
>   	 * thread to wake up.
>   	 */
> -	drm_WARN_ONCE(&uncore->i915->drm,
> -		      wait_for_atomic_us(gt_thread_status(uncore) == 0, 5000),
> -		      "GT thread status wait timed out\n");
> +	gt_WARN_ONCE(uncore->gt,
> +		     wait_for_atomic_us(gt_thread_status(uncore) == 0, 5000),
> +		     "GT thread status wait timed out\n");
>   }
>   
>   static void fw_domains_get_with_thread_status(struct intel_uncore *uncore,
> @@ -402,8 +400,7 @@ static void __gen6_gt_wait_for_fifo(struct intel_uncore *uncore)
>   		if (wait_for_atomic((n = fifo_free_entries(uncore)) >
>   				    GT_FIFO_NUM_RESERVED_ENTRIES,
>   				    GT_FIFO_TIMEOUT_MS)) {
> -			drm_dbg(&uncore->i915->drm,
> -				"GT_FIFO timeout, entries: %u\n", n);
> +			gt_dbg(uncore->gt, "GT_FIFO timeout, entries: %u\n", n);
>   			return;
>   		}
>   	}
> @@ -476,7 +473,7 @@ intel_uncore_forcewake_reset(struct intel_uncore *uncore)
>   			break;
>   
>   		if (--retry_count == 0) {
> -			drm_err(&uncore->i915->drm, "Timed out waiting for forcewake timers to finish\n");
> +			gt_err(uncore->gt, "Timed out waiting for forcewake timers to finish\n");
>   			break;
>   		}
>   
> @@ -484,7 +481,7 @@ intel_uncore_forcewake_reset(struct intel_uncore *uncore)
>   		cond_resched();
>   	}
>   
> -	drm_WARN_ON(&uncore->i915->drm, active_domains);
> +	gt_WARN_ON(uncore->gt, active_domains);
>   
>   	fw = uncore->fw_domains_active;
>   	if (fw)
> @@ -520,8 +517,7 @@ fpga_check_for_unclaimed_mmio(struct intel_uncore *uncore)
>   	 * to recognize when MMIO accesses are just busted.
>   	 */
>   	if (unlikely(dbg == ~0))
> -		drm_err(&uncore->i915->drm,
> -			"Lost access to MMIO BAR; all registers now read back as 0xFFFFFFFF!\n");
> +		gt_err(uncore->gt, "Lost access to MMIO BAR; all registers now read back as 0xFFFFFFFF!\n");
>   
>   	__raw_uncore_write32(uncore, FPGA_DBG, FPGA_DBG_RM_NOCLAIM);
>   
> @@ -550,7 +546,7 @@ gen6_check_for_fifo_debug(struct intel_uncore *uncore)
>   	fifodbg = __raw_uncore_read32(uncore, GTFIFODBG);
>   
>   	if (unlikely(fifodbg)) {
> -		drm_dbg(&uncore->i915->drm, "GTFIFODBG = 0x08%x\n", fifodbg);
> +		gt_dbg(uncore->gt, "GTFIFODBG = 0x08%x\n", fifodbg);
>   		__raw_uncore_write32(uncore, GTFIFODBG, fifodbg);
>   	}
>   
> @@ -622,7 +618,7 @@ void intel_uncore_resume_early(struct intel_uncore *uncore)
>   	unsigned int restore_forcewake;
>   
>   	if (intel_uncore_unclaimed_mmio(uncore))
> -		drm_dbg(&uncore->i915->drm, "unclaimed mmio detected on resume, clearing\n");
> +		gt_dbg(uncore->gt, "unclaimed mmio detected on resume, clearing\n");
>   
>   	if (!intel_uncore_has_forcewake(uncore))
>   		return;
> @@ -847,9 +843,9 @@ void assert_forcewakes_inactive(struct intel_uncore *uncore)
>   	if (!uncore->fw_get_funcs)
>   		return;
>   
> -	drm_WARN(&uncore->i915->drm, uncore->fw_domains_active,
> -		 "Expected all fw_domains to be inactive, but %08x are still on\n",
> -		 uncore->fw_domains_active);
> +	gt_WARN(uncore->gt, uncore->fw_domains_active,
> +		"Expected all fw_domains to be inactive, but %08x are still on\n",
> +		uncore->fw_domains_active);
>   }
>   
>   void assert_forcewakes_active(struct intel_uncore *uncore,
> @@ -869,9 +865,9 @@ void assert_forcewakes_active(struct intel_uncore *uncore,
>   	assert_rpm_wakelock_held(uncore->rpm);
>   
>   	fw_domains &= uncore->fw_domains;
> -	drm_WARN(&uncore->i915->drm, fw_domains & ~uncore->fw_domains_active,
> -		 "Expected %08x fw_domains to be active, but %08x are off\n",
> -		 fw_domains, fw_domains & ~uncore->fw_domains_active);
> +	gt_WARN(uncore->gt, fw_domains & ~uncore->fw_domains_active,
> +		"Expected %08x fw_domains to be active, but %08x are off\n",
> +		fw_domains, fw_domains & ~uncore->fw_domains_active);
>   
>   	/*
>   	 * Check that the caller has an explicit wakeref and we don't mistake
> @@ -884,9 +880,9 @@ void assert_forcewakes_active(struct intel_uncore *uncore,
>   		if (uncore->fw_domains_timer & domain->mask)
>   			expect++; /* pending automatic release */
>   
> -		if (drm_WARN(&uncore->i915->drm, actual < expect,
> -			     "Expected domain %d to be held awake by caller, count=%d\n",
> -			     domain->id, actual))
> +		if (gt_WARN(uncore->gt, actual < expect,
> +			    "Expected domain %d to be held awake by caller, count=%d\n",
> +			    domain->id, actual))
>   			break;
>   	}
>   
> @@ -955,9 +951,9 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
>   	if (entry->domains == FORCEWAKE_ALL)
>   		return uncore->fw_domains;
>   
> -	drm_WARN(&uncore->i915->drm, entry->domains & ~uncore->fw_domains,
> -		 "Uninitialized forcewake domain(s) 0x%x accessed at 0x%x\n",
> -		 entry->domains & ~uncore->fw_domains, offset);
> +	gt_WARN(uncore->gt, entry->domains & ~uncore->fw_domains,
> +		"Uninitialized forcewake domain(s) 0x%x accessed at 0x%x\n",
> +		entry->domains & ~uncore->fw_domains, offset);
>   
>   	return entry->domains;
>   }
> @@ -1190,7 +1186,7 @@ static int mmio_range_cmp(u32 key, const struct i915_range *range)
>   
>   static bool is_shadowed(struct intel_uncore *uncore, u32 offset)
>   {
> -	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
> +	if (gt_WARN_ON(uncore->gt, !uncore->shadowed_reg_table))
>   		return false;
>   
>   	if (IS_GSI_REG(offset))
> @@ -1898,11 +1894,11 @@ __unclaimed_reg_debug(struct intel_uncore *uncore,
>   		      const i915_reg_t reg,
>   		      const bool read)
>   {
> -	if (drm_WARN(&uncore->i915->drm,
> -		     check_for_unclaimed_mmio(uncore),
> -		     "Unclaimed %s register 0x%x\n",
> -		     read ? "read from" : "write to",
> -		     i915_mmio_reg_offset(reg)))
> +	if (gt_WARN(uncore->gt,
> +		    check_for_unclaimed_mmio(uncore),
> +		    "Unclaimed %s register 0x%x\n",
> +		    read ? "read from" : "write to",
> +		    i915_mmio_reg_offset(reg)))
>   		/* Only report the first N failures */
>   		uncore->i915->params.mmio_debug--;
>   }
> @@ -1913,10 +1909,10 @@ __unclaimed_previous_reg_debug(struct intel_uncore *uncore,
>   			       const bool read)
>   {
>   	if (check_for_unclaimed_mmio(uncore))
> -		drm_dbg(&uncore->i915->drm,
> -			"Unclaimed access detected before %s register 0x%x\n",
> -			read ? "read from" : "write to",
> -			i915_mmio_reg_offset(reg));
> +		gt_dbg(uncore->gt,
> +		       "Unclaimed access detected before %s register 0x%x\n",
> +		       read ? "read from" : "write to",
> +		       i915_mmio_reg_offset(reg));
>   }
>   
>   static inline void
> @@ -2201,8 +2197,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
>   	if (!d)
>   		return -ENOMEM;
>   
> -	drm_WARN_ON(&uncore->i915->drm, !i915_mmio_reg_valid(reg_set));
> -	drm_WARN_ON(&uncore->i915->drm, !i915_mmio_reg_valid(reg_ack));
> +	gt_WARN_ON(uncore->gt, !i915_mmio_reg_valid(reg_set));
> +	gt_WARN_ON(uncore->gt, !i915_mmio_reg_valid(reg_ack));
>   
>   	d->uncore = uncore;
>   	d->wake_count = 0;
> @@ -2254,8 +2250,8 @@ static void fw_domain_fini(struct intel_uncore *uncore,
>   		return;
>   
>   	uncore->fw_domains &= ~BIT(domain_id);
> -	drm_WARN_ON(&uncore->i915->drm, d->wake_count);
> -	drm_WARN_ON(&uncore->i915->drm, hrtimer_cancel(&d->timer));
> +	gt_WARN_ON(uncore->gt, d->wake_count);
> +	gt_WARN_ON(uncore->gt, hrtimer_cancel(&d->timer));
>   	kfree(d);
>   }
>   
> @@ -2388,8 +2384,8 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
>   		spin_unlock_irq(&uncore->lock);
>   
>   		if (!(ecobus & FORCEWAKE_MT_ENABLE)) {
> -			drm_info(&i915->drm, "No MT forcewake available on Ivybridge, this can result in issues\n");
> -			drm_info(&i915->drm, "when using vblank-synced partial screen updates.\n");
> +			gt_info(uncore->gt, "No MT forcewake available on Ivybridge, this can result in issues\n");
> +			gt_info(uncore->gt, "when using vblank-synced partial screen updates.\n");
>   			fw_domain_fini(uncore, FW_DOMAIN_ID_RENDER);
>   			fw_domain_init(uncore, FW_DOMAIN_ID_RENDER,
>   				       FORCEWAKE, FORCEWAKE_ACK);
> @@ -2403,7 +2399,7 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
>   #undef fw_domain_init
>   
>   	/* All future platforms are expected to require complex power gating */
> -	drm_WARN_ON(&i915->drm, !ret && uncore->fw_domains == 0);
> +	gt_WARN_ON(uncore->gt, !ret && uncore->fw_domains == 0);
>   
>   out:
>   	if (ret)
> @@ -2487,7 +2483,7 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
>   
>   	uncore->regs = ioremap(phys_addr, mmio_size);
>   	if (uncore->regs == NULL) {
> -		drm_err(&i915->drm, "failed to map registers\n");
> +		gt_err(uncore->gt, "failed to map registers\n");
>   		return -EIO;
>   	}
>   
> @@ -2615,7 +2611,7 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
>   	 */
>   	if (IS_DGFX(i915) &&
>   	    !(__raw_uncore_read32(uncore, GU_CNTL) & LMEM_INIT)) {
> -		drm_err(&i915->drm, "LMEM not initialized by firmware\n");
> +		gt_err(uncore->gt, "LMEM not initialized by firmware\n");
>   		return -ENODEV;
>   	}
>   
> @@ -2646,7 +2642,7 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
>   
>   	/* clear out unclaimed reg detection bit */
>   	if (intel_uncore_unclaimed_mmio(uncore))
> -		drm_dbg(&i915->drm, "unclaimed mmio detected on uncore init, clearing\n");
> +		gt_dbg(uncore->gt, "unclaimed mmio detected on uncore init, clearing\n");
>   
>   	return 0;
>   }
> @@ -2721,11 +2717,10 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>    */
>   static void driver_initiated_flr(struct intel_uncore *uncore)
>   {
> -	struct drm_i915_private *i915 = uncore->i915;
>   	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
>   	int ret;
>   
> -	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
> +	gt_dbg(uncore->gt, "Triggering Driver-FLR\n");
>   
>   	/*
>   	 * Make sure any pending FLR requests have cleared by waiting for the
> @@ -2738,9 +2733,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>   	 */
>   	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
>   	if (ret) {
> -		drm_err(&i915->drm,
> -			"Failed to wait for Driver-FLR bit to clear! %d\n",
> -			ret);
> +		gt_err(uncore->gt, "Failed to wait for Driver-FLR bit to clear! %d\n", ret);
>   		return;
>   	}
>   	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> @@ -2752,7 +2745,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>   					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>   					 flr_timeout_ms);
>   	if (ret) {
> -		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
> +		gt_err(uncore->gt, "wait for Driver-FLR completion failed! %d\n", ret);
>   		return;
>   	}
>   
> @@ -2911,7 +2904,7 @@ intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
>   {
>   	bool ret = false;
>   
> -	if (drm_WARN_ON(&uncore->i915->drm, !uncore->debug))
> +	if (gt_WARN_ON(uncore->gt, !uncore->debug))
>   		return false;
>   
>   	spin_lock_irq(&uncore->debug->lock);
> @@ -2921,10 +2914,10 @@ intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
>   
>   	if (unlikely(check_for_unclaimed_mmio(uncore))) {
>   		if (!uncore->i915->params.mmio_debug) {
> -			drm_dbg(&uncore->i915->drm,
> -				"Unclaimed register detected, "
> -				"enabling oneshot unclaimed register reporting. "
> -				"Please use i915.mmio_debug=N for more information.\n");
> +			gt_dbg(uncore->gt,
> +			       "Unclaimed register detected, "
> +			       "enabling oneshot unclaimed register reporting. "
> +			       "Please use i915.mmio_debug=N for more information.\n");
>   			uncore->i915->params.mmio_debug++;
>   		}
>   		uncore->debug->unclaimed_mmio_check--;
> @@ -2957,7 +2950,7 @@ intel_uncore_forcewake_for_reg(struct intel_uncore *uncore,
>   {
>   	enum forcewake_domains fw_domains = 0;
>   
> -	drm_WARN_ON(&uncore->i915->drm, !op);
> +	gt_WARN_ON(uncore->gt, !op);
>   
>   	if (!intel_uncore_has_forcewake(uncore))
>   		return 0;
> @@ -2968,7 +2961,7 @@ intel_uncore_forcewake_for_reg(struct intel_uncore *uncore,
>   	if (op & FW_REG_WRITE)
>   		fw_domains |= uncore->funcs.write_fw_domains(uncore, reg);
>   
> -	drm_WARN_ON(&uncore->i915->drm, fw_domains & ~uncore->fw_domains);
> +	gt_WARN_ON(uncore->gt, fw_domains & ~uncore->fw_domains);
>   
>   	return fw_domains;
>   }

