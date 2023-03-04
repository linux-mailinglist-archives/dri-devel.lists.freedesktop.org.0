Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31F46AA751
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 02:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0433F10E78F;
	Sat,  4 Mar 2023 01:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4CF10E16E;
 Sat,  4 Mar 2023 01:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677893702; x=1709429702;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yFxrOn7U0JfLXf0oHi9HrkkqyVrAkBTLfuVc/dep9R4=;
 b=JGk3qzwOTIWK2QeUdKCfJc42VcdPpXMYvtussMYy2kyqR5Y13jIsYHmm
 5DRzxsuqpv/91zks8n9ROy6oLJkAKdSi4xqwkFOM4wVxfknWCABzIlWli
 YRAfv74Aww2gyHLgmkIylAlUK24sMfv2sOd8NSg5zyPobgQhvPIsoyg4N
 NCnArkcUQ2tjRAPMAHXorISmkbQQP2LgRV6KsheuRlwFqfSCl3H3Gy9OQ
 a7O1ENsraHmKIRaubSMtKew2fgg4aCssjEAsLTnAz5zkI1wuJgtg5nVfn
 zaRJ7IFRGBYhWvN6VWfTbdyvNgje46D3V5oPQ82fMQLfkSxpLA/HcjQSb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="319029746"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="319029746"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 17:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="668850755"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="668850755"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 17:34:32 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 17:34:31 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 17:34:31 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 17:34:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 17:34:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmD+BbLvHlHs/SIsztpp25CAHaQKKU8VsbYa7HReqTB26f60UW3zB4f9bzPH1gfF3CyqpCUs1gdGBcevnwkLreAF94dPKC9IUKxChYUT5sCZO11fcaQKM61g9Bkv2KQ2YgWvOiHD6Y21k17zwXfv9Xq+r+JLS8Dm5xK5DjZtYuB9gHPejM3K05M6WnsBJgNv6inzc5wqgn6EHr4Vehc6u5fD2cAD7wBykjGBqjA/D/nMW4RTOhd6NlKqB4EoL6r+YZNzCo3bu00CvpDm1/YgetPEWIeY0QEzDVS+1d0NtBv3zZ+WUW3fTJabP5016f5bnEEmOTqXcuFuK2TezNhT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s+jzVouuAsZgjLgL82K6UxXskF7kFM7MTV1TP8p7xg=;
 b=aVK5rNs1O4B6AENPJMrWGELTbA0ZTBvk5IQpLPWfr9iVlNDqfIn8P7BV8hKlRl/GoyZTYNzKR8jLinmPkQBZ6Rg4OPqZhIcG2IvIn1tVVPPf8rD2hFURdi1q9XEUqBWcIt00DTUTKg/unT5fMNCqt/54mDWT960/S24dOb/3Q957OeL43fXO3OzSQwUNgelvNwq724ZP0KI5r2qR263zH9APkyndHnvFIhRtI9rpXCKO3AfzgIUdDEHIvXIpbpcBDvIeKPkZwI8EOsAHjoRp1TcA9J72SdD0DC6qBtsjhOpWLepDy4KOSNRLIL1MgZLSQVMUgZAa1bLTp5I3iM89Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19; Sat, 4 Mar 2023 01:34:29 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.022; Sat, 4 Mar 2023
 01:34:29 +0000
Message-ID: <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
Date: Fri, 3 Mar 2023 17:34:26 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM4PR11MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: be5dac11-6c6a-4fbb-5cec-08db1c50986a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WvyYSXpqh69DDbEGngJIZVzS0CGPkACgX2POlcN2AbF9Z+wjQlB3Y00BOrp4Jiw1HJj0Q+vgF6W84JLl3Std5xZbO3twHN8TcTJuJlA3C8JjzW4mcJKzYdTQ5M00e3whEkwOo4ufBnpn5lp69x1o5nphKsAZDB8d+q+1Ko0hRnDit17cJuFBwhdsGcyYzQ4bNdGc87nWyffxalXXB0Yru0i9IKuD9pCQ3NjRnL2jSWvdv8YpK51+R0s5oF/F5eXKYAQTnuKKk/oRrFZRACURdtoQAWF3UD+RT2WHpaD9JUsW4TZk9U8fHsAIcr3+A/iiASnBJa+zH6khIaeFy14TTItuWgWMt/Uotlg8FbLHXL+uxj0ILnONhHz2+PQ2j1doaT4Rnnd4m0w9mU9INByeQfFnZLTvmGRDCCcs6Ucvka9m8QTmmHxh07KJ8e6VNIFze79z4n0XIUQP/hj31/QBXcL/pDJYsJSSlB30XlWEIH6I6OLWEO86yneAeIh78XUdsJHzreDkQlI2YbJGB0yq4R42KPFDTM1PtywIGV/59klaVoKG/YXfHhGdR/F9OVJHVdafxgMWsHRQYeHwFJlv3Gmm41o1L8dqDyrJwuwd/J+rn7fdSjO1lYC/34LeatNIpNqLqpOtPDku7eGPxOGdONKHN9ITeGdcVEboEnykF7/Ky1X++IF2WY8igZKeEJog
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199018)(31686004)(478600001)(6666004)(83380400001)(36756003)(316002)(38100700002)(82960400001)(2616005)(186003)(31696002)(6512007)(6506007)(53546011)(26005)(966005)(6486002)(5660300002)(86362001)(30864003)(2906002)(8676002)(66476007)(66556008)(66946007)(41300700001)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWhIWDFwZy9keFBWTXduWHN2SjcrbHhaeHNwOWFKRUVMbkxTNE50djZVN0kz?=
 =?utf-8?B?c3JDS3RSdE9YWSsyZ3pZSlE2ZzduQmthd3ZMemdCeGlJWG1jUUFMb0plMjZh?=
 =?utf-8?B?dk5zVDdnZXlzSVhaTzc0NTQ2NHJxR3RQK0ZIWDB6M3hEZFBTMzFrWmRabTZ3?=
 =?utf-8?B?cEEwY1dUSFNQS3p2bGUwbzBMaGl0R2FhTHJQV0tkNDV5QVJUbGRYbWhHNTVi?=
 =?utf-8?B?VzFaek5YeVpENVVtK3o2NjVDelRWVU1BKzgvM0x4SVFpN1dEZUdUOCt3bnYr?=
 =?utf-8?B?RGZraTFnNnM1R1pxWERaNUxLc29OVHhoUzZUYUwxS25YeTVzZzNQN1pMM0N2?=
 =?utf-8?B?bkZwaHdkQ3lZdUhJREtLTC9KSURVcWRhQnRLQ1RZeG1pTzNvU21wczh1K1Qz?=
 =?utf-8?B?ZVNNTUxBOUovekhKdWhsRHJnY0d4ZlYzaGlZRmo4V1VnejRjK1NzNkQrSWsx?=
 =?utf-8?B?SVZ2Q29YS09acWF2alpqNjFJSGV4MkdWdTR4aEJKU0NwQlQ2MjJ5L2tDTHBp?=
 =?utf-8?B?anVHYTZ0Q25lMERQZ3NhbU9wZVE3bitTT3dUNW83Q25SUkZPU1ZwVWgwNTNK?=
 =?utf-8?B?Tm5mZzRlNjRiaHBXRXVzajJnZWM4L2syNkEvM0hqek1rNVltYk0zemRoQVV6?=
 =?utf-8?B?b2ZuZmsrMmp0WmY1N2JXN3l6YXArd0xmZnhUS0g4TUpHSUxwSWlTaFBQd1NF?=
 =?utf-8?B?ZkNlV2lFbWpnMmdIT3dqRHN5UndvVmFiaGVMVzdxQnFyY0FBbDhrWlRIVVdZ?=
 =?utf-8?B?Z2p6ZCtjMERvTytQL2c0ZUhySUxhOHd1NE1hNGt4RS9NbmdpUENxdmJTcWxv?=
 =?utf-8?B?WmZpZ3RwZGQxVWk2SllteVFCUitQNWhmM0ROOFpsNWluY1F1YWF3UlEyZVIv?=
 =?utf-8?B?RW9kU3VjWUVaSFRNWGNTYkl3OS8zdGpyYzRTYXovVVlWeEM5UVNSMkZpYnlr?=
 =?utf-8?B?ZXkzNDQ5YlN5TFkyNFJpZk01ZUU0Zkpld1lrMjJmZEJaNitYMFZhWS9OSHY5?=
 =?utf-8?B?Ry9IajV6blo4b0U1WS9WNlROY1YxVVdNcHlsOWlhclBKd3BEY3A3Yjc2M2lh?=
 =?utf-8?B?WFZrbWhma0Vwajl5cUVnTjlZOUJQOHBIaG5NdzVhQzUwWEtRV3A1S3U2WXpi?=
 =?utf-8?B?Y1Nya3NEVm9vQVYyR1JiTnd3Sk9YT2JHV05KbDZnTTZlKzUxU1p3ejA2akZV?=
 =?utf-8?B?YkVsbGx3WGxpcXdtUTdHU21ta0V0dVJwQ2dudG8xdFcxMmZiNFBlT3J1NTBm?=
 =?utf-8?B?eHYxNmJEekpDMHVsbmZpdm1oTTBtdjhtOWxOV3IvMGQzUDZuWlR6UVFISmxK?=
 =?utf-8?B?TUprUGdyb2lRK0xMdFQvRHJZNWloak8vZXlFTmFlSkl2ZUZCUCs0d1JHVlJF?=
 =?utf-8?B?cVFhVFVjd0gvV0JFU0I3WTF6eldVVDlpbG1qS21tTGtoWktPZUc3ZXNkU2tq?=
 =?utf-8?B?T2xYL0lTVTlMb2ZWSnZIdEt2OEtSRUU3aTJzV0hNMksvaHY5bFZ2c3JXMjlP?=
 =?utf-8?B?eGJKajFuTkJuUnJCUHExVGQ4cEJhbmt4TTNzNFk3ZzcyQnFqTkUrajZOQjNz?=
 =?utf-8?B?ejdZalU1MFUvSUhZOVFEZXlheW1VZXJtVCtscHB1aWYrOHFDaFV3Y1NIcXhB?=
 =?utf-8?B?VzNmZnAyQUNQTjZqRUFlNzJabWtoY1VwdTE1TmVOYmgvQ0wvS25iKytTelll?=
 =?utf-8?B?V3pnQzd3RGJTYmw1ak01QTFkRlFUaVFjZGtjOU4zcDJWNkJKOU13OW1EZWFs?=
 =?utf-8?B?czFoangzY3ZqQTRXL1BnaUg1ZlpOZTFscVZQRzJjV1kzYmtrWm1qelBMd243?=
 =?utf-8?B?V1JEYmVMZFVZbVBZaWF6aXVFbVdxRlpqbXdvWG80b2N5ZzBMeVAzVitiaGs4?=
 =?utf-8?B?dkJHNXU0a2lOckZCREs2eU1VLzJNK2dkUE4rNS9STThWTFpqUWludzA3WW1m?=
 =?utf-8?B?dWhNOVQyZ21OaDJucWczdmcyZDJadDM1S1ZIOHljRnJkemtGVDVBeFpvRmZn?=
 =?utf-8?B?ZUNDLzVqVkhXbTFXVjdOc3dKQkEwUWpHVm50ZjVUbHE2Q2luWGJQRFlUQ2JL?=
 =?utf-8?B?K2p5UlhHaS9QdmgvOFc5WlJNVGlsVGYwK3F5NllwNE1BdGpyNktvWUpjREZB?=
 =?utf-8?B?TWV5dUZ2STRnVWFUMVlnRGJIQ3pBVTRtSllUL3ZvRGtiNDZLZVJndzZGZ2M1?=
 =?utf-8?Q?j8kt06kt1NAfNWZi8LHelEI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be5dac11-6c6a-4fbb-5cec-08db1c50986a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2023 01:34:28.4375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rC6rPudvOTl/l2AJWmB3doElE/TKnySqW69s63c8M0BRpFNdOSf2kqaPBiAGRusVlrWR3owLg3KXnSAl6fpq/ELeJJnNTRyF50b9Z4nl94E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6479
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/27/2023 6:21 PM, Alan Previn wrote:
> Add MTL's function for ARB session creation using PXP firmware
> version 4.3 ABI structure format.
>
> Also add MTL's function for ARB session invalidation but this
> reuses PXP firmware version 4.2 ABI structure format.
>
> Before checking the return status, look at the GSC-CS-Mem-Header's
> pending-bit which means the GSC firmware is busy and we should
> resubmit.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp.c          | 34 ++++++++--
>   .../drm/i915/pxp/intel_pxp_cmd_interface_43.h | 21 +++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 62 +++++++++++++++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |  4 ++
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c  | 11 +++-
>   5 files changed, 126 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index aecc65b5da70..61041277be24 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -290,6 +290,8 @@ static bool pxp_component_bound(struct intel_pxp *pxp)
>   
>   static int __pxp_global_teardown_final(struct intel_pxp *pxp)
>   {
> +	int timeout;
> +
>   	if (!pxp->arb_is_valid)
>   		return 0;
>   	/*
> @@ -299,7 +301,12 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
>   	intel_pxp_mark_termination_in_progress(pxp);
>   	intel_pxp_terminate(pxp, false);
>   
> -	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(250)))
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		timeout = GSC_PENDING_RETRY_LATENCY_MS;
> +	else
> +		timeout = 250;
> +
> +	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
>   		return -ETIMEDOUT;
>   
>   	return 0;
> @@ -307,6 +314,8 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
>   
>   static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
>   {
> +	int timeout;
> +
>   	if (pxp->arb_is_valid)
>   		return 0;
>   	/*
> @@ -315,7 +324,12 @@ static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
>   	 */
>   	pxp_queue_termination(pxp);
>   
> -	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(250)))
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		timeout = GSC_PENDING_RETRY_LATENCY_MS;
> +	else
> +		timeout = 250;
> +
> +	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
>   		return -ETIMEDOUT;
>   
>   	return 0;
> @@ -353,8 +367,20 @@ int intel_pxp_start(struct intel_pxp *pxp)
>   	if (!intel_pxp_is_enabled(pxp))
>   		return -ENODEV;
>   
> -	if (wait_for(pxp_component_bound(pxp), 250))
> -		return -ENXIO;
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
> +		/*
> +		 * GSC-fw loading, GSC-proxy init (requiring an mei component driver) and
> +		 * HuC-fw loading must all occur first before we start requesting for PXP
> +		 * sessions. Checking HuC authentication (the last dependency)  will suffice.
> +		 * Let's use a much larger 8 second timeout considering all the types of
> +		 * dependencies prior to that.
> +		 */
> +		if (wait_for(intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc), 8000))

This big timeout needs an ack from userspace drivers, as intel_pxp_start 
is called during context creation and the current way to query if the 
feature is supported is to create a protected context. Unfortunately, we 
do need to wait to confirm that PXP is available (although in most cases 
it shouldn't take even close to 8 secs), because until everything is 
setup we're not sure if things will work as expected. I see 2 potential 
mitigations in case the timeout doesn't work as-is:

1) we return -EAGAIN (or another dedicated error code) to userspace if 
the prerequisite steps aren't done yet. This would indicate that the 
feature is there, but that we haven't completed the setup yet. The 
caller can then decide if they want to retry immediately or later. Pro: 
more flexibility for userspace; Cons: new interface return code.

2) we add a getparam to say if PXP is supported in HW and the support is 
compiled in i915. Userspace can query this as a way to check the feature 
support and only create the context if they actually need it for PXP 
operations. Pro: simpler kernel implementation; Cons: new getparam, plus 
even if the getparam returns true the pxp_start could later fail, so 
userspace needs to handle that case.

> +			return -ENXIO;
> +	} else {
> +		if (wait_for(pxp_component_bound(pxp), 250))
> +			return -ENXIO;
> +	}
>   
>   	mutex_lock(&pxp->arb_mutex);
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> index b2523d6918c7..9089e02a8c2d 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> @@ -11,6 +11,7 @@
>   
>   /* PXP-Cmd-Op definitions */
>   #define PXP43_CMDID_START_HUC_AUTH 0x0000003A
> +#define PXP43_CMDID_INIT_SESSION 0x00000036

I don't know where this interface is defined, so for now I'm going to 
assume this and the below structs are correct. I'll sync with you on the 
side to get to the specs.

>   
>   /* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
>   #define PXP43_MAX_HECI_IN_SIZE (SZ_32K)
> @@ -27,4 +28,24 @@ struct pxp43_start_huc_auth_out {
>   	struct pxp_cmd_header header;
>   } __packed;
>   
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_in {
> +	struct pxp_cmd_header header;
> +		/* header.stream_id fields for vesion 4.3 of Init PXP session: */
> +		#define PXP43_INIT_SESSION_VALID BIT(0)
> +		#define PXP43_INIT_SESSION_APPTYPE BIT(1)
> +		#define PXP43_INIT_SESSION_APPID GENMASK(17, 2)
> +	u32 protection_mode;
> +		#define PXP43_INIT_SESSION_PROTECTION_ARB 0x2
> +	u32 sub_session_id;
> +	u32 init_flags;
> +	u32 rsvd[12];
> +} __packed;
> +
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_out {
> +	struct pxp_cmd_header header;
> +	u32 rsvd[8];
> +} __packed;
> +
>   #endif /* __INTEL_PXP_FW_INTERFACE_43_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index 30aa660a975f..6f5c5dad8c16 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -9,6 +9,7 @@
>   #include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
>   
>   #include "i915_drv.h"
> +#include "intel_pxp_cmd_interface_42.h"
>   #include "intel_pxp_cmd_interface_43.h"
>   #include "intel_pxp_gsccs.h"
>   #include "intel_pxp_types.h"
> @@ -150,6 +151,67 @@ gsccs_send_message_retry_complete(struct intel_pxp *pxp,
>   	return ret;
>   }
>   
> +int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
> +				   int arb_session_id)
> +{
> +	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
> +	struct pxp43_create_arb_in msg_in = {0};
> +	struct pxp43_create_arb_out msg_out = {0};
> +	int ret;
> +
> +	msg_in.header.api_version = PXP_APIVER(4, 3);
> +	msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
> +	msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, arb_session_id) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +	msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
> +
> +	ret = gsccs_send_message_retry_complete(pxp,
> +						&msg_in, sizeof(msg_in),
> +						&msg_out, sizeof(msg_out), NULL);
> +	if (ret)
> +		drm_warn(&i915->drm, "Failed to send gsccs msg for creating-session-%d: ret=[%d]\n",
> +			 arb_session_id, ret);
> +	else if (msg_out.header.status != 0x0)
> +		drm_warn(&i915->drm, "PXP firmware failed on creating-session-%d: status=0x%08x\n",
> +			 arb_session_id, msg_out.header.status);

Should this follow the same log style as 
https://patchwork.freedesktop.org/patch/521431/? same for the function 
below.

> +
> +	return ret;
> +}
> +
> +void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
> +{
> +	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
> +	struct pxp42_inv_stream_key_in msg_in = {0};
> +	struct pxp42_inv_stream_key_out msg_out = {0};
> +	int ret = 0;
> +
> +	memset(&msg_in, 0, sizeof(msg_in));
> +	memset(&msg_out, 0, sizeof(msg_out));

You're already initializing the structs to zero with "= {0}"

Daniele

> +	/*
> +	 * Stream key invalidation reuses the same version 4.2 input/output
> +	 * command format but firmware requires 4.3 API interaction
> +	 */
> +	msg_in.header.api_version = PXP_APIVER(4, 3);
> +	msg_in.header.command_id = PXP42_CMDID_INVALIDATE_STREAM_KEY;
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +
> +	msg_in.header.stream_id = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, session_id);
> +
> +	ret = gsccs_send_message_retry_complete(pxp,
> +						&msg_in, sizeof(msg_in),
> +						&msg_out, sizeof(msg_out), NULL);
> +	if (ret)
> +		drm_warn(&i915->drm, "Failed to send gsccs msg for inv-stream-session-%d: ret=[%d]\n",
> +			 session_id, ret);
> +	else if (msg_out.header.status != 0x0)
> +		drm_warn(&i915->drm, "PXP firmware failed on inv-stream-session-%d: status=0x%08x\n",
> +			 session_id, msg_out.header.status);
> +}
> +
>   static int
>   gsccs_create_buffer(struct intel_gt *gt,
>   		    const char *bufname, size_t size,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> index bd1c028bc80f..4d393f1248fe 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> @@ -13,11 +13,15 @@ struct intel_pxp;
>   #define GSC_REPLY_LATENCY_MS 200
>   #define GSC_PENDING_RETRY_MAXCOUNT 40
>   #define GSC_PENDING_RETRY_PAUSE_MS 50
> +#define GSC_PENDING_RETRY_LATENCY_MS (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS)
>   
>   #ifdef CONFIG_DRM_I915_PXP
>   void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
>   int intel_pxp_gsccs_init(struct intel_pxp *pxp);
>   
> +int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
> +void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
> +
>   #else
>   static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
>   {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index b8fa6df7141b..4ddf2ee60222 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -7,6 +7,7 @@
>   
>   #include "intel_pxp.h"
>   #include "intel_pxp_cmd.h"
> +#include "intel_pxp_gsccs.h"
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
>   #include "intel_pxp_types.h"
> @@ -62,7 +63,10 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
>   		return -EEXIST;
>   	}
>   
> -	ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		ret = intel_pxp_gsccs_create_session(pxp, ARB_SESSION);
> +	else
> +		ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
>   	if (ret) {
>   		drm_err(&gt->i915->drm, "tee cmd for arb session creation failed\n");
>   		return ret;
> @@ -106,7 +110,10 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>   
>   	intel_uncore_write(gt->uncore, KCR_GLOBAL_TERMINATE(pxp->kcr_base), 1);
>   
> -	intel_pxp_tee_end_arb_fw_session(pxp, ARB_SESSION);
> +	if (HAS_ENGINE(gt, GSC0))
> +		intel_pxp_gsccs_end_arb_fw_session(pxp, ARB_SESSION);
> +	else
> +		intel_pxp_tee_end_arb_fw_session(pxp, ARB_SESSION);
>   
>   	return ret;
>   }

