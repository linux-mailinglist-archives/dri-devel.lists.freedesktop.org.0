Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC3717233
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8301A10E447;
	Wed, 31 May 2023 00:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0694E10E444;
 Wed, 31 May 2023 00:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685491285; x=1717027285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6cazexL1AISP2v+o4PgIoOCMYFNJhROB8hMDl1JkK18=;
 b=jgfZd48JMuQbdeC9SCE6Pc3iTyG6vPP+0w0G3WxB7EGAQEUofqXJUsO6
 Nkix9XmimCWA+fsXI528BO60o9aYzDlcD35xAmEk1LI5DpSC6UAnl0aLt
 63+hL54Vfl8EKe3M2fgsx8q+dg5LB4Tb/dPuYz3vHcYEn6ottG2PDWGMW
 C8uKPKZtTnVYv9S6rmDG6g/zbW+I0t+KjckAZ4rJci9z8r8AdQS2vd8Ra
 YCXwRuy0ZNL//TVyNnwlLC3oPAIwLe9nWXrSdGIUEkFkgfEKm4Uptwfxl
 UZFUOUmlVpVV3ioXHjunCTL1YA8FH646XDhzi+RznbvZuypaNihWJ4Vv/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="355090418"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="355090418"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 17:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="819032685"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="819032685"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 30 May 2023 17:01:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:01:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 17:01:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 17:01:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG4GwOEg7D19+KMwHD8WL41yGqIelmby5l7qXbgxsmHvFq4kEAqkIqbhE06dtttETH80j0B4dT3RlevCrULkNLTfAHVtqZOA5DgEC2Q8NkEyB0253/bnB5GmPIEUJQgH45gRj2zS8K8VR/oH7oUKXsEJJyXRN1o76TbTqNV+j2dlN/ihpV4LHrUYLE6pl2x3sLykGwjMg4eDcIg57I5EM5kx5KndNlAzIwmIjnxLpVWzGX8f06/bb0PMvKW6E9uwLYYNxewcDuSMEvueexC6/sn4ahqsfnmlXe0AVBEzgk6wUwJXaXceQR4LbFmK/dIkSSelWj5BaxXecthfja2lrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLVusB4BO/Tk/rDyvmiy+x90tnrg+yXk5IHB/fgbdIM=;
 b=CSduYQi5IrmvFusmRRGv2BtSGP7rYkGtGjYJB/E5fXlrBZiTnUrQYlOIAdHa8NYzi45cZFiph2u52zJ5hy6KK1MwsH7YxgZvtd/D94h3JZyJgYIL2ikkSVXS0WzyuBwDa2JabLsVnlY+dvs545E4Ysv/XCSdhZZc9qLpMm20WWnUCSVFUuuCo6vy09p+wlMH8BwAQ3zkuGDUTbc7oa1fndJrpxO7xnz5EgtWxoNpqZ8EHCqgUIqS9DgdNIrrUj0RRu47NFBqtRuQtqNYHxtwoy73WeBKvFcWdnllOQ0FXilIZA8dH8S/3V9llZIHgSQXmujlnphNe/Sr4eV5tqINJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 00:01:18 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:01:18 +0000
Message-ID: <7e6f34eb-cb4a-6de0-3e8f-83172b4a035c@intel.com>
Date: Tue, 30 May 2023 17:01:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v4] drm/i915/huc: differentiate the 2 steps of the MTL HuC
 auth flow
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-5-daniele.ceraolospurio@intel.com>
 <20230530152958.1384061-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230530152958.1384061-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 611a8bd7-b153-47d2-4a02-08db616a287d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JWHaJjo6PjlE77bM96ZAI8MWaKi3ZrMD0cc3IQF1wXXoaniLKu6BRBTOaA7N7CEocDnhFFxLfa4z0cxhfo/MqVnDGyS8wM7PTSdvknPOvmrL4ujd7wu/VDwf7957IKJfk/qVctOt69AhQoKrNdTE+hby5VaDlbHN00M94detGA4NXruc+yC5k5SbYPrroxq7+JuOQBmFFYCb0NMk3TtN+PaxQD1xbY/QOt/+ILp+P4DX7n3IWj2B8uM/7wjNPRGvAp2KEeco6HRTWiGx14jyyYo/fR2GQ5iMlrb8WMRtWQ3SZHWxkXzxR5fVKw2zz9A7I+bXXYg54/VU4G6XeAivzpVltP1eQGeuvd1cz6ptm/z7f9PLjoCezrFbhv3zmcSbShZcOiHu+SuCxZteBtdQAZBQAL6pIaFKVWGOCQl+WhDffEZ+m/tDl+7oF+kMNeKAbSV1ZCHErF7bZqlUmucPEm525HZkPOhzijsUBw3OTBFU0k+Su4ACmSdbYDZhDzlEgO7sMk0TmRTvncl0wUVZMm1a/+4Cxb8BT3YR2kNdAaq5crdMrmfEwB6Xn9jm9wGFl3MCZMH/bU8GJeFcc8hEG0jVlqCHIM76rEv/wJDdAHpwV38w1tpbjH2ele0NIXExOd+exWRvDp/ih5qYRkLC1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199021)(966005)(186003)(107886003)(2616005)(38100700002)(41300700001)(31686004)(83380400001)(53546011)(26005)(6506007)(6512007)(6486002)(6666004)(478600001)(66556008)(4326008)(450100002)(82960400001)(66476007)(66946007)(316002)(5660300002)(8676002)(8936002)(31696002)(2906002)(86362001)(30864003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzRSS1BxOStkZm9GS1M5K2NMQTZSc05QUWgzZ09SR09BNUM2UldWNjlBUVM3?=
 =?utf-8?B?QS9lNlBYb0o2WWdVS2ZPVkJzUmpYREIvSGE5SUFWczJJY2QyVThmQmxRSW84?=
 =?utf-8?B?aTcvTlZoUE9Rc0YwVmhwWnFqVEtoNzFtSXg0K2dZZ01nRFVKYkpveVd0cjhY?=
 =?utf-8?B?cnhVYjE5ZEFORXk2cnR6S3NtTU1Wcml1cVQzYzM5ejduWGJhWjkrN0syMS9h?=
 =?utf-8?B?cnBKdGlSRDBydENEMlM5M25LRFNMckZRUUNoZ2ZTV1hGTHlzOXJpMXVkMUp3?=
 =?utf-8?B?anFNR3p1OGVRL1JxNnNXTCsyRW1Ra252OW5DbndHWTlFRnlMbTVvOGRmNVU2?=
 =?utf-8?B?OGtrSVFxZkVOMGVWdHJ3U3VWVnh3WFhSZXhIQi95VUhCRlZuU3o3MTcySjV5?=
 =?utf-8?B?bzFrUGpkcHlIR0NIWkQ3KzhHWE1jNDhTSFZYcFhxcnlWdGdJR3E4RDJmMnNy?=
 =?utf-8?B?cW1FbTgyUHhpOGFGWXN1N2hoMEJFREVlWFppUWwydmZ6aXloZ1orcHMrazlT?=
 =?utf-8?B?SEk5bEJFNHF3SldWTmNKeDFaOC8zaWdzbXpRRUxPVVhiL29LSDRPMktqRUx3?=
 =?utf-8?B?NWJiTy8zZ29YbkVBcFJkTmRlSnEzUmdMOGFwOU83eFdPYzI1b3h2VmFQWGpN?=
 =?utf-8?B?SW5wVmRyM2lYbjdCUGM4UXk0OFU4Z0JPMTdwQWViUm9vWTlvdW1PTUUxK3No?=
 =?utf-8?B?WEhUaFc2YTk2b3FxZU96T2RpNlY5SDZMaWwzVFkzTklTbktJbjJDN0VXb2E1?=
 =?utf-8?B?cXpQUVg5L3ljVnZnR3VQcDFlSDBsMUNuc2dVc0RYSlorNC9JRklSTUFFeVYy?=
 =?utf-8?B?akYvUyt6Y3RzWjZTWFBmQzJuSndlQVFGMVl1U0hJMGZLTlB6SHZMbkpsa0dP?=
 =?utf-8?B?ZGZieVEzUjY2cEdPbjFPVWtubkdLVmlnSTNIeDFpeE5HNzZXbGF5dmpVc2NE?=
 =?utf-8?B?aVZkRERPdEozVWFhUW92V0lLajBQZFVpUnI4WDBGUTFtM0FIMXFiMmFHMUhq?=
 =?utf-8?B?RS9aazFnamdqVmV3VDU0eGVmcE4wbUdncktjRlV1SkE3Sm82U05hVm5INmlH?=
 =?utf-8?B?SmFBQWFRWkhacEVGOW82dnFWOUdEU0hLUitRVjFMUVJNeG91OFdrV0RSamJt?=
 =?utf-8?B?amFWQU9URHptSldMY2pJbEFvbSt5OTJaYUwwZXZaWUFsdDcwK3dqdmpPdmxq?=
 =?utf-8?B?WXJHOEhBSDVNWmxUN09DUHlaZytlRTcvb3RaSVJpeHBpRVhSeVFmeExVUCt1?=
 =?utf-8?B?eXZjM0ZZa2Z4c2ladWFqM0VmK01BYXNEYUlqUVJsT0dBUzFwOTd1MWYwWlJs?=
 =?utf-8?B?WDROYTYyVzFUcndNeWFBeGZWMTkyZXJ1WGoyeEZMdjE4cnpTSTFzZWQ2SFls?=
 =?utf-8?B?V1lmY1dkNmMyazNUc2NmdExkbUlydDVER1lVYmo1UW5aNHREQmNkaWRNa28w?=
 =?utf-8?B?ZG1VeXFkSHRJdW5BQ1NmOW9NYXFQQmwrNEZVZjFlWXVtdWZIUW5LNHl4MzJW?=
 =?utf-8?B?MVBib1FnSGtBejAzcVorNXhKK1dIZEJNMHdKL2VENjdoMXNOdDZKRXlhR29B?=
 =?utf-8?B?VUJkWndMdUIvSnBaZTB6NFJzZTFubjJLZEh3ZGw5V1I2ZjdFL3YyQmgwV0h2?=
 =?utf-8?B?OE1tdHEzcjRhc28xbWxKVkxBRXNUdUZUL0FhN3VhbEdFVDBXRDNMSDJSVjN4?=
 =?utf-8?B?anYvdmZFYWgwMDBuUTZySEFnczY4ZEpOaE9UN09YdXk4WldaZU81T3lpSjlX?=
 =?utf-8?B?Ukt0ZTM1NVgxdzg2dFJLZ3h5ZTVYN0VNVHNMZnFjZWE5QUwvZ1MrZUdxd24x?=
 =?utf-8?B?YTRhL2wyQTZ3cEdIdVgxbjlxNndDQWxCQ0NtUE5nNEJ5TjdOcURxMTJ4L3pN?=
 =?utf-8?B?UC9aMlBFOFMxZ3hFYmNVRkhlcjYxemNRVUJPeFR6b3JDME9YeGR5Rlo1YXZk?=
 =?utf-8?B?cmJGQlZOZnZ0MkRDaDU5WmJqK1RrS2V6eWhLaUsvd2dlY3hzQk5PK01xU3Fu?=
 =?utf-8?B?L1VBbXNmdFFzVTV4ZGlBUTlsclRNaTVMdFF6Sk5DMmRJVHBGdHhncUtsOUVt?=
 =?utf-8?B?UTdqU00xMGxMWlN2VzBvMW5iQmc4YjRUUEliSzVyL1JPTWVCNDZyOWNtY2xV?=
 =?utf-8?B?U3VWbm5zSWRLWlpxcDl5eU0yNUdVM0hFQVNnYk5mNkg4dlMva0cwZlpoUENq?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 611a8bd7-b153-47d2-4a02-08db616a287d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 00:01:17.8821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SghuiHeI+60CgdZH1NBcHBHfEKWOf+MwgeerERwAcdbbB7gUi4+/XUWYV6S6DX+RKMHJKNT89NqsNNSJQS7pTb01vgfikBto4l8v2N1dH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/30/2023 08:29, Daniele Ceraolo Spurio wrote:
> Before we add the second step of the MTL HuC auth (via GSC), we need to
> have the ability to differentiate between them. To do so, the huc
> authentication check is duplicated for GuC and GSC auth, with meu
meu?

> binaries being considered fully authenticated only after the GSC auth
> step.
>
> To report the difference between the 2 auth steps, a new case is added
> to the HuC getparam. This way, the clear media driver can start
> submitting before full auth, as partial auth is enough for those
> workloads.
>
> v2: fix authentication status check for DG2
>
> v3: add a better comment at the top of the HuC file to explain the
>      different approaches to load and auth (John)
>
> v4: update call to intel_huc_is_authenticated in the pxp code to check
> for GSC authentication
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c     | 111 ++++++++++++++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h     |  16 ++-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c  |   4 +-
>   drivers/gpu/drm/i915/i915_reg.h            |   3 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |   2 +-
>   include/uapi/drm/i915_drm.h                |   3 +-
>   6 files changed, 104 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 37c6a8ca5c71..ab5246ae3979 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -10,6 +10,7 @@
>   #include "intel_huc.h"
>   #include "intel_huc_print.h"
>   #include "i915_drv.h"
> +#include "i915_reg.h"
>   
>   #include <linux/device/bus.h>
>   #include <linux/mei_aux.h>
> @@ -22,15 +23,23 @@
>    * capabilities by adding HuC specific commands to batch buffers.
>    *
>    * The kernel driver is only responsible for loading the HuC firmware and
> - * triggering its security authentication, which is performed by the GuC on
> - * older platforms and by the GSC on newer ones. For the GuC to correctly
> - * perform the authentication, the HuC binary must be loaded before the GuC one.
> + * triggering its security authentication. This is done differently depending
> + * on the platform:
> + * - older platforms (from Gen9 to most Gen12s): the load is performed via DMA
> + *   and the authentication via GuC
> + * - DG2: load and authentication are both performed via GSC.
> + * - MTL and newer platforms: the load is performed via DMA (same as with
> + *   not-DG2 older platforms), while the authentication is done in 2-steps,
> + *   a first auth for clear-media workloads via GuC and a second one for all
> + *   workloads via GSC.
> + * On platforms where the GuC does the authentication, to correctly do so the
> + * HuC binary must be loaded before the GuC one.
>    * Loading the HuC is optional; however, not using the HuC might negatively
>    * impact power usage and/or performance of media workloads, depending on the
>    * use-cases.
>    * HuC must be reloaded on events that cause the WOPCM to lose its contents
> - * (S3/S4, FLR); GuC-authenticated HuC must also be reloaded on GuC/GT reset,
> - * while GSC-managed HuC will survive that.
> + * (S3/S4, FLR); on older platforms the HuC must also be reloaded on GuC/GT
> + * reset, while on newer ones it will survive that.
>    *
>    * See https://github.com/intel/media-driver for the latest details on HuC
>    * functionality.
> @@ -106,7 +115,7 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
>   {
>   	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
>   
> -	if (!intel_huc_is_authenticated(huc)) {
> +	if (!intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>   		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
>   			huc_notice(huc, "timed out waiting for MEI GSC\n");
>   		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
> @@ -124,7 +133,7 @@ static void huc_delayed_load_start(struct intel_huc *huc)
>   {
>   	ktime_t delay;
>   
> -	GEM_BUG_ON(intel_huc_is_authenticated(huc));
> +	GEM_BUG_ON(intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC));
>   
>   	/*
>   	 * On resume we don't have to wait for MEI-GSC to be re-probed, but we
> @@ -284,13 +293,23 @@ void intel_huc_init_early(struct intel_huc *huc)
>   	}
>   
>   	if (GRAPHICS_VER(i915) >= 11) {
> -		huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
> -		huc->status.mask = HUC_LOAD_SUCCESSFUL;
> -		huc->status.value = HUC_LOAD_SUCCESSFUL;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_LOAD_SUCCESSFUL;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_LOAD_SUCCESSFUL;
>   	} else {
> -		huc->status.reg = HUC_STATUS2;
> -		huc->status.mask = HUC_FW_VERIFIED;
> -		huc->status.value = HUC_FW_VERIFIED;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = HUC_STATUS2;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_FW_VERIFIED;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_FW_VERIFIED;
> +	}
> +
> +	if (IS_DG2(i915)) {
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HUC_LOAD_SUCCESSFUL;
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HUC_LOAD_SUCCESSFUL;
> +	} else {
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = HECI_FWSTS5(MTL_GSC_HECI1_BASE);
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HECI_FWSTS5_HUC_AUTH_DONE;
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HECI_FWSTS5_HUC_AUTH_DONE;
>   	}
>   }
>   
> @@ -381,28 +400,38 @@ void intel_huc_suspend(struct intel_huc *huc)
>   	delayed_huc_load_complete(huc);
>   }
>   
> -int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
> +static const char *auth_mode_string(struct intel_huc *huc,
> +				    enum intel_huc_authentication_type type)
> +{
> +	bool partial = huc->fw.has_gsc_headers && type == INTEL_HUC_AUTH_BY_GUC;
> +
> +	return partial ? "clear media" : "all workloads";
> +}
> +
> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
> +				     enum intel_huc_authentication_type type)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
>   	int ret;
>   
>   	ret = __intel_wait_for_register(gt->uncore,
> -					huc->status.reg,
> -					huc->status.mask,
> -					huc->status.value,
> +					huc->status[type].reg,
> +					huc->status[type].mask,
> +					huc->status[type].value,
>   					2, 50, NULL);
>   
>   	/* mark the load process as complete even if the wait failed */
>   	delayed_huc_load_complete(huc);
>   
>   	if (ret) {
> -		huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
> +		huc_err(huc, "firmware not verified for %s: %pe\n",
> +			auth_mode_string(huc, type), ERR_PTR(ret));
>   		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>   		return ret;
>   	}
>   
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
> -	huc_info(huc, "authenticated!\n");
> +	huc_info(huc, "authenticated for %s!\n", auth_mode_string(huc, type));
Not a blocker but should this have an exclamation? It sort of implies 
the authentication is unexpected.

>   	return 0;
>   }
>   
> @@ -442,7 +471,7 @@ int intel_huc_auth(struct intel_huc *huc)
>   	}
>   
>   	/* Check authentication status, it should be done by now */
> -	ret = intel_huc_wait_for_auth_complete(huc);
> +	ret = intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GUC);
>   	if (ret)
>   		goto fail;
>   
> @@ -453,16 +482,29 @@ int intel_huc_auth(struct intel_huc *huc)
>   	return ret;
>   }
>   
> -bool intel_huc_is_authenticated(struct intel_huc *huc)
> +bool intel_huc_is_authenticated(struct intel_huc *huc,
> +				enum intel_huc_authentication_type type)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
>   	intel_wakeref_t wakeref;
>   	u32 status = 0;
>   
>   	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		status = intel_uncore_read(gt->uncore, huc->status.reg);
> +		status = intel_uncore_read(gt->uncore, huc->status[type].reg);
>   
> -	return (status & huc->status.mask) == huc->status.value;
> +	return (status & huc->status[type].mask) == huc->status[type].value;
> +}
> +
> +static bool huc_is_fully_authenticated(struct intel_huc *huc)
> +{
> +	struct intel_uc_fw *huc_fw = &huc->fw;
> +
> +	if (!huc_fw->has_gsc_headers)
> +		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC);
> +	else if (intel_huc_is_loaded_by_gsc(huc) || HAS_ENGINE(huc_to_gt(huc), GSC0))
> +		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
> +	else
> +		return false;
>   }
>   
>   /**
> @@ -477,7 +519,9 @@ bool intel_huc_is_authenticated(struct intel_huc *huc)
>    */
>   int intel_huc_check_status(struct intel_huc *huc)
>   {
> -	switch (__intel_uc_fw_status(&huc->fw)) {
> +	struct intel_uc_fw *huc_fw = &huc->fw;
> +
> +	switch (__intel_uc_fw_status(huc_fw)) {
>   	case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
>   		return -ENODEV;
>   	case INTEL_UC_FIRMWARE_DISABLED:
> @@ -494,7 +538,17 @@ int intel_huc_check_status(struct intel_huc *huc)
>   		break;
>   	}
>   
> -	return intel_huc_is_authenticated(huc);
> +	/*
> +	 * meu binaries loaded by GuC are first partially authenticated by GuC
meu?

John.


> +	 * and then fully authenticated by GSC
> +	 */
> +	if (huc_is_fully_authenticated(huc))
> +		return 1; /* full auth */
> +	else if (huc_fw->has_gsc_headers && !intel_huc_is_loaded_by_gsc(huc) &&
> +		 intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC))
> +		return 2; /* clear media only */
> +	else
> +		return 0;
>   }
>   
>   static bool huc_has_delayed_load(struct intel_huc *huc)
> @@ -508,7 +562,10 @@ void intel_huc_update_auth_status(struct intel_huc *huc)
>   	if (!intel_uc_fw_is_loadable(&huc->fw))
>   		return;
>   
> -	if (intel_huc_is_authenticated(huc))
> +	if (!huc->fw.has_gsc_headers)
> +		return;
> +
> +	if (huc_is_fully_authenticated(huc))
>   		intel_uc_fw_change_status(&huc->fw,
>   					  INTEL_UC_FIRMWARE_RUNNING);
>   	else if (huc_has_delayed_load(huc))
> @@ -541,5 +598,5 @@ void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p)
>   
>   	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>   		drm_printf(p, "HuC status: 0x%08x\n",
> -			   intel_uncore_read(gt->uncore, huc->status.reg));
> +			   intel_uncore_read(gt->uncore, huc->status[INTEL_HUC_AUTH_BY_GUC].reg));
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 112f0dce4702..3f6aa7c37abc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -22,6 +22,12 @@ enum intel_huc_delayed_load_status {
>   	INTEL_HUC_DELAYED_LOAD_ERROR,
>   };
>   
> +enum intel_huc_authentication_type {
> +	INTEL_HUC_AUTH_BY_GUC = 0,
> +	INTEL_HUC_AUTH_BY_GSC,
> +	INTEL_HUC_AUTH_MAX_MODES
> +};
> +
>   struct intel_huc {
>   	/* Generic uC firmware management */
>   	struct intel_uc_fw fw;
> @@ -31,7 +37,7 @@ struct intel_huc {
>   		i915_reg_t reg;
>   		u32 mask;
>   		u32 value;
> -	} status;
> +	} status[INTEL_HUC_AUTH_MAX_MODES];
>   
>   	struct {
>   		struct i915_sw_fence fence;
> @@ -49,10 +55,12 @@ int intel_huc_init(struct intel_huc *huc);
>   void intel_huc_fini(struct intel_huc *huc);
>   void intel_huc_suspend(struct intel_huc *huc);
>   int intel_huc_auth(struct intel_huc *huc);
> -int intel_huc_wait_for_auth_complete(struct intel_huc *huc);
> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
> +				     enum intel_huc_authentication_type type);
> +bool intel_huc_is_authenticated(struct intel_huc *huc,
> +				enum intel_huc_authentication_type type);
>   int intel_huc_check_status(struct intel_huc *huc);
>   void intel_huc_update_auth_status(struct intel_huc *huc);
> -bool intel_huc_is_authenticated(struct intel_huc *huc);
>   
>   void intel_huc_register_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus);
>   void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus);
> @@ -81,7 +89,7 @@ static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
>   static inline bool intel_huc_wait_required(struct intel_huc *huc)
>   {
>   	return intel_huc_is_used(huc) && intel_huc_is_loaded_by_gsc(huc) &&
> -	       !intel_huc_is_authenticated(huc);
> +	       !intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
>   }
>   
>   void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 3355dc1e2bc6..d2b4176c81d6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -160,7 +160,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   	 * component gets re-bound and this function called again. If so, just
>   	 * mark the HuC as loaded.
>   	 */
> -	if (intel_huc_is_authenticated(huc)) {
> +	if (intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>   		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
>   		return 0;
>   	}
> @@ -173,7 +173,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>   
> -	return intel_huc_wait_for_auth_complete(huc);
> +	return intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GSC);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0523418129c5..c14433795c91 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -941,6 +941,9 @@
>   #define HECI_H_GS1(base)	_MMIO((base) + 0xc4c)
>   #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
>   
> +#define HECI_FWSTS5(base)		_MMIO(base + 0xc68)
> +#define   HECI_FWSTS5_HUC_AUTH_DONE	(1 << 19)
> +
>   #define HSW_GTT_CACHE_EN	_MMIO(0x4024)
>   #define   GTT_CACHE_EN_ALL	0xF0007FFF
>   #define GEN7_WR_WATERMARK	_MMIO(0x4028)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index 8dc41de3f6f7..016bd8fad89d 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -196,7 +196,7 @@ bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
>   	 * gsc-proxy init flow (the last set of dependencies that
>   	 * are out of order) will suffice.
>   	 */
> -	if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc) &&
> +	if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc, INTEL_HUC_AUTH_BY_GSC) &&
>   	    intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc))
>   		return true;
>   
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index f31dfacde601..a1848e806059 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -674,7 +674,8 @@ typedef struct drm_i915_irq_wait {
>    * If the IOCTL is successful, the returned parameter will be set to one of the
>    * following values:
>    *  * 0 if HuC firmware load is not complete,
> - *  * 1 if HuC firmware is authenticated and running.
> + *  * 1 if HuC firmware is loaded and fully authenticated,
> + *  * 2 if HuC firmware is loaded and authenticated for clear media only
>    */
>   #define I915_PARAM_HUC_STATUS		 42
>   

