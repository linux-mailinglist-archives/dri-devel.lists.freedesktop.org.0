Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E76A00B8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 02:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C261510E473;
	Thu, 23 Feb 2023 01:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D6210E207;
 Thu, 23 Feb 2023 01:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677116524; x=1708652524;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VkoQOk3o9sPTgM6Asmv460zZxv0060H4qeSnHz9IBPI=;
 b=PVsnnh4ENw2z547QEEJcojtEP8JFPxjvXBdZXbAYKL8d8HHEyjAQoPFW
 6uEWJcdEePMfiQ0xG+lZ0mzvYnBwn8LGBCwDcLkGvt3Ix+8nLM5l/GdmQ
 xtvB+rUDCgJuZsN/mCPkHzH0fYwNBD7ylEqlf+kxQ38SrnSxz1TNX9dGI
 MYlsM/geFbl8Xo9orbr6y6z7QWnte4CUhD0tAzsoQmQyM43TIFodiXpW9
 Bq9ax1EBZ0Y/qnLHgl3O8TdkPuQSJDjEVeO6BTsDXc8EpQQ3x5WhSvjTU
 wgC70CuUM+hbnmmxXntRNRElKR/sMrIwCLls3m6HnZgz49thZxGaaU1P6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="397781353"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="397781353"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 17:42:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="781686896"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="781686896"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2023 17:42:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 17:42:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 17:42:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 17:42:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWELmBliEgNX7b8vK9vwL3CXR/TQME5wrdC/5Jx0lbbxTH/MbHqHi/l+0Q8IfBfeQBkmBhu5vOHLk4FKtzGJqonDBMJ+MG4XiqFg/dCi9edWhOKFhN5iyOqhf0EDgd9nXUmv5q+LRsuT5W/uJ6pm1nXmFEtDsX/YG1E36WvITrSU9fBIQphLc7g/8TcrHzfVUn816QKFAsB/NnCH3ynERmnZlOSdhS+OHxvJbrQTX2U5951xyibFXW/sHFLtSSevVhm5exj+CQpqC5Pe7W5A63YPGlEzXMil/UsWYKvIoTMLIx86N3fqfcUlkUD2zT8hR6MfdfwEGa0INAWl1G21RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NYYgzjb3JzufLzta/8OpeZfW6RZRr26BGR+us3fTvA=;
 b=IYjoFjyOdFuyhobGoPX24lNC5OvcCtvTqHHy64ja0l4UAozGi9DGxPn4liTEXk6s/tAjjZaRAUE6UNMhhBwNVzmani5IcgP1/WnRNgHEYxrdsMnCSEfPg2k8dLck7pkqPFoM4aqEJ+mVOig9ldcYOz1b+o2Y7qIdYmDwRVVmM5GtZJxvcS8ds/YQ2f18DScecz//6NxtUJ01+KUcvigJTM9p6MP2mMNk3hpvuq5p/ppNEoCH+kE9lUn0JIZqi2xa3ZDFYZXnBq1+W6wekivGgco6kRP8VNoFjrXpzoGLDmwV85UW+VcAHFYo+irDyA5Noo+CN5BgYfh8zegOqZ8k9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 01:41:57 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5c78:a264:4cea:6fa5]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5c78:a264:4cea:6fa5%4]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 01:41:57 +0000
Message-ID: <8ff51add-8879-ca17-11e1-381e03303b39@intel.com>
Date: Wed, 22 Feb 2023 17:41:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230222210120.407780-1-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230222210120.407780-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SA1PR11MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 45fff14d-4a35-4595-4750-08db153f2645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vkPoPu/H9HBCbD1oD53JQ/XmdB/yVcNYTFFXjvRgaWX6Y8TGFgmqVtNZ2wuInpMBBzGZ4Q0SwMsNKJ5+4brskc38lHhXoOG6MghDQR/VKkD46QevP91dNHe/D+muyJga5tnwrdO1Rtl2Mj+7DqASlP6Kijj4MFsqKBPLkjvHV+HVZNpMstfWcWyA6KgwqDUAQHoeht+xVwYHJtp40EwasvAaoN4SJtabB6Ig+FMq2T+pwI/lZSoEJxZEJNDKX4O4fzj4ZpeeZ7l+/xVlqEp4z2+vo3Z9M4vuuFrF4vkiS3xISjAXF3/ohRQZZ3my3XBusGdpuFI50KbVaki1tdyzdgazZ6Edif/+a+b3lQa2ljdI4NePrVkdWYAy4JGjyuOFNPWNJK/4dA84uBNHlWr9E5HLQ419d3ZCAWFa3lx4dAH+5WwNSy//EM3IjWcqYF0rAaX3jrqc9VDv72upqdr19ov6EucbMpaZtnMOlIQX8qXr3QlCO0VpPNOOETk495OXCnWx9hAQyhlDfSzxHAdqvET2JqYXYrdEKr6FoeTBPAK+h1BdGnz9gJB49jvR62KGTDWwSmK4SvTF92qGLp3lSVYYle4Y9X9+RZdiHEmza4HD3yJeuUWevnZwygqDHv7gXrevMfO2Zes9gYPI66lEdHCre/PkOSlOJf+i8471s/JxOxyYFJEhnoEnagWakx3YE1GckxsCHLibyNkirtgubXyCuGF2BsE4byY5zxrlNo4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199018)(6486002)(31686004)(83380400001)(2906002)(36756003)(5660300002)(107886003)(31696002)(6512007)(41300700001)(478600001)(86362001)(8936002)(53546011)(38100700002)(26005)(2616005)(186003)(82960400001)(6506007)(66946007)(66476007)(316002)(8676002)(66556008)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFRnR3lIR3BBK3cyYmZTWFZ5MGFMenlkZDNnSXRhdWVIN2Y1YU1UZlRXUE1k?=
 =?utf-8?B?RHhHd1VDVlpuK1hwMjVTYm0vVnp0bFE1b2JKaWM1L3lCazFaaUhKY0twYXpx?=
 =?utf-8?B?WW1odHpPMjZXZ1E5bnBzV0tjdUtNdTZsWmZXVC84TC9saEExcERIV1l2MDRn?=
 =?utf-8?B?V1IwYlpVNWRRL0NFdzZjN2RtY1BBRk5sL0pPZjR0cndmVUMrUGgyODJBYlRQ?=
 =?utf-8?B?L1dMczZpT0U3d0sxVWhxZGFNU09QeTRwYWRLaWJ1Ujg4YUtwQnJKSnZXT24v?=
 =?utf-8?B?TWtzdzNBcUc3V3JNeVRzd0NLNHFOa3BOMXlqYXdhOHcyS1V6cUVVRGJJRFNL?=
 =?utf-8?B?TXFRRDNHQ2VJK3BHUFpleW9wMnFKdDh6V3lhMk1leDlNazhQUitlWjdHN29q?=
 =?utf-8?B?TlZ2eDJ0dDNkVUdtdTFuS21yOTRTM3l5eWp6Vi90TW16WE5MdlgybUZKS2JK?=
 =?utf-8?B?L3NFZXN3YllxY3B6bUx3c1NxVzBVRTZzYUU5aDIzYUY3V2syWVNuN1ZiY29o?=
 =?utf-8?B?MWhGUkh3N0lCbktGaWtYcWNPMGlNNzN3OGRqYit6VUdzYjNERGo3TE03OGdY?=
 =?utf-8?B?UDRvVDVHdUFvVUEvYXdtRkkzZEYvQ2VIVU0vK25HQkcwb3ZhRmQzSGJTbFpK?=
 =?utf-8?B?aS9uYXlWNE5ZMHEybWYxdEJyejRISjBrdXRsUlFmbVcxSlB1RVhpSktQTklY?=
 =?utf-8?B?MXdjc0ZmbnJFTmt4OGxTemkxSTByMnRLUlNYYWdHbjdNSHRTY1RZMloyTVd6?=
 =?utf-8?B?K2pKdUFyUGgzY24vWmNPYm9pYXpFelppTnF3cWsyTGE2UmtBdm8zczZIT2J0?=
 =?utf-8?B?clFldnJzRUxzYmFtR3JFMFhET0h6Z0czU014Q1pFTU40ZVBCQWhmQStySmJ4?=
 =?utf-8?B?bDhEUUtaclNlSGZSUjlIRjJoK2xIa2Y1SG41QzlOaWlvMVdSTW83ejMxenN6?=
 =?utf-8?B?T0NZV3hTME43SUd2Nlk5ZGJKcTVVWjNoWXIzTmxWMnh6dGZ4TE5RSTg0aUFY?=
 =?utf-8?B?YVYvZC94L2s0bmdsZ0J1U2R4RlV5M1dOeEIreXVEejIvSDhIMVFjSUtPR1Zx?=
 =?utf-8?B?Q1hkeS9FVFh3dWdCd1VQMEhMTUtMWEtLMUpML2VRRHNHdUdhQ0twL3U1Q09H?=
 =?utf-8?B?em5rZ3A0V0YrS2l0UTF0NUZQVVdUZDVlemU5eDkwT3lJZStjMzN2K29IdmRK?=
 =?utf-8?B?RkZvbWFpSHdrQTNLNjQ1MVRkUlhIVW9nY1V5UjFYampteEFRODM1TWxOdGN1?=
 =?utf-8?B?M1FjQStoTUw0T1dTT1g5a2pPSmFqQlZTSmwwdS9hQWVtZ1dja0FYZ0JCdDJw?=
 =?utf-8?B?cEpFb2U3cG5kdkdDU1hqYzdtQ3A3TDhHUlZTWXc0ZVdQSzltVlhRM1o3MEtz?=
 =?utf-8?B?b3ZwUkljT2x1TDZIZXEyYTBIU2tERWp6T1FRVEsvdE9XeDRORTFHa0ZjenEr?=
 =?utf-8?B?TVNnMjhhQ2RhSlFKYVNSS3NuMzZrR1cwNVJWZmdGbHVMMURqUms4MFpkK0th?=
 =?utf-8?B?ZW4zOXUrQkFBZWFFc2tkVWh2V1RHWlNHZUE4N3FoWjlxclk5cU9jZXRPN1ds?=
 =?utf-8?B?TU1ORTJqTWJmTVFKNWJCdHoweVF1YjdBc0x2T0xFWlhFZHkxNHVLRDdET2Fo?=
 =?utf-8?B?bk1naG5JODJpOGFOeU05aDhyaHFWSEp2S0tZVUhpcWRjUG1wUGtub1M1Q2o2?=
 =?utf-8?B?TEF6YmtlUHNrdnA2clpiSmNHZVpBVkpFdW05NnVLVTRpY2dRUGFtZ0N0cHBt?=
 =?utf-8?B?SCtSb0ZTZGF4Qi9wV2FKcWhJbXdLRk5CUFNDU1hRbUN4aFQxWWdEZnFmM0ZS?=
 =?utf-8?B?eURXeEZrckVsS2JRR1h1U0k4aEMrWXovK0FwMndsaUVRQjhONUVJR1FvTURZ?=
 =?utf-8?B?QzdQY0R5WU0zTkhveG0wM1FoOTBoRS9QRnp6SHBsdnc4dS9kUnpmOE52NWk4?=
 =?utf-8?B?OWpwaC8wYUlvKzRsNmRzVEFuU1pOWUJoYU5iUzJFMFlrZUVLOWpzYnRJRTlu?=
 =?utf-8?B?YjVTdlNRTEFsYThyN2dHdnJ6UlJBM0xIYllLZCttM25SeFRNaFRsOU14YUhJ?=
 =?utf-8?B?aEt0eUIrZzFqY0lFcHdUMTR4VTlOOXlQNkhJQ040Q0lBRXVrcG84MFpKbndI?=
 =?utf-8?B?N2VpampsdXRCVTIrM01OejFJbmlwbElVRGFyV2h2bW9XTm9LK21PL21xUlNv?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fff14d-4a35-4595-4750-08db153f2645
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 01:41:57.4910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ao3hSZk6iDhVulvmPk966LbUHio/Ff5k7attCHpsEspNUjO6SznT12SfP1PljsW0UpPO9l62ZQh8akk5i5nbxzJntU023ohsOED2Q9Z3Q/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
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
Cc: Vivi@freedesktop.org, Gupta@freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/22/2023 1:01 PM, Alan Previn wrote:
> The Driver-FLR flow may inadvertently exit early before the full
> completion of the re-init of the internal HW state if we only poll
> GU_DEBUG Bit31 (polling for it to toggle from 0 -> 1). Instead
> we need a two-step completion wait-for-completion flow that also
> involves GU_CNTL. See the patch and new code comments for detail.
> This is new direction from HW architecture folks.
>
>     v2: - Add error message for the teardown timeout (Anshuman)
>         - Don't duplicate code in comments (Jani)

LGTM,

Tested-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Fixes: 5a44fcd73498 ("drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded")
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index f018da7ebaac..f3c46352db89 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2749,14 +2749,25 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>   	/* Trigger the actual Driver-FLR */
>   	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
>   
> +	/* Wait for hardware teardown to complete */
> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL,
> +					 DRIVERFLR_STATUS, 0,
> +					 flr_timeout_ms);
> +	if (ret) {
> +		drm_err(&i915->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	/* Wait for hardware/firmware re-init to complete */
>   	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
>   					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>   					 flr_timeout_ms);
>   	if (ret) {
> -		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
> +		drm_err(&i915->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
>   		return;
>   	}
>   
> +	/* Clear sticky completion status */
>   	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
>   }
>   
