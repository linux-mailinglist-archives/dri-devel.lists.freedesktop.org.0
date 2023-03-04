Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F136AA774
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 02:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A2910E78B;
	Sat,  4 Mar 2023 01:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821A710E16E;
 Sat,  4 Mar 2023 01:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677894805; x=1709430805;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=US/z6EiVLz3bGKF2BAH32TshEYmPEZpw8SiTImY3cbg=;
 b=ElzVsaNh4Jqva4bJESnF7bXw7zKFONWTkgaciHm336QgynLa6SvGVV26
 wcR38hrXIrCVdPWaADMTPqfod5fqdOTZhQE2558WcZnQueA2UdNnTv6sf
 QeCocpa3Qu4Aqr6AXF1b0hm/o2Ui+u8VVNpre+zPyQKDmItu29HZee+wh
 Pq9P4g9gcL5sqkDXVbMpMxwn/HcZ4nxSE7VJ5rMCyGePp0ZXxXhWDZdxs
 3qPJIdOqAEAWfG/Po5eBdLD4yFRinY9sp8oUzdu4jBrE9gIj2AXmdeLCM
 ae2FNhLraLssRelOVV+kXtLzeFHVXd/O8LzshCp+JSNvi6Qaeb+dW0FqH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="323508271"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="323508271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 17:53:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="705843119"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="705843119"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 03 Mar 2023 17:53:22 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 17:53:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 17:53:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 17:53:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 17:53:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIIbZykLMmkhmnxGsy7evRXbMmUUR50mqExRvNLNO4j7up4yN2tZDA2kKzFs30GCC78WS4TCJcFYwU20cIqLJ7T3HFU/UG++O1iFF/0qyC6Y0+rnvakhlJqvR3670Hq2rkmliWfV/njNxnWKTXL9/4q6pTaKdvR70XYTAEueFbQpaiQrzuAd9SlFRiLTmGSbdyN4rKnyQ3pMRcEe74xyF071WFZy8qwwM0CM4Sw+5g+FYu3RpXYCkvQkX9+TJlsxcasOlzhBWA0Pp6IZnpUodG0fRgIDXneBbC4qH9DEL0lJiWLsXDOloc3qEZeEP4GEHC60r8cRnPX6cEWYAiVKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HOs81Umq8+spq9zHxpqDAS2upZLyQHxYjFhWDxPpck=;
 b=MawaeHZrwFLynACjRT1AjbiNZLw7aVAhXykC+fNRDSQNYFuoViwPB7JpcJmoBNIc7LjiJt+umyQdrBDq/JoQWIdV77CNtmw6A2GfiMbTLFP9oJ9pg0okOrvyFdYwpQqxN1bHzh2DTYgtAk2bvMBV4VkmGb5FjN/yatLS7AftwEkLiKE3ymUpb54RHIjJY2kY6TNPBWIN54xXPLkZ3so2wGGjjpZMORmvSls0gX9gjumgfJXXwTEehJgsCeMQYLIxP6ElKKo2FqIHDMzHTIONSlrxeOz+n9P+EU1BXzAJl9g3Zy6tWeg8Fq3wB0Xg6k+2p+H8/239cFgprNAkn/Xyrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.23; Sat, 4 Mar 2023 01:53:19 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.022; Sat, 4 Mar 2023
 01:53:19 +0000
Message-ID: <1991b162-8210-c64a-0bcc-1811ff93ae10@intel.com>
Date: Fri, 3 Mar 2023 17:53:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 6/8] drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-7-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230228022150.1657843-7-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: a22c8518-dba4-4029-379a-08db1c533a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2pXkB3XC0vc7J7vdejrJccEvGTylfnd1Y6NjDPZ7uKW2ejcn6QROlMY9wA1jdOkAHu7QYNldzHqOyYZ/pfWuCzrH1egojakCS/CoyYqdbgc8zPKaOKG6I47zDMhidDaRNfQO/G0J2flTcrehyeJjSq8UFziQa8wtj4vKWKEH8Cm6/sqxOwW0GqWGfN/5WXwI7OZG6v5h0b1/7VXc8UpUL+VZDWlsXPakzqZckKkODEHfxYFEDFyiuVRnlBB4kCIP0zhO8OUU0G7Px74ZkvGGBahLccAHdPdmq8YfZcyXfvo+LEHgDt4XF8SyZEfpnpEZ5o+hHsKYbFccFqCzjjLmyWCLWrUcFqYSyG7Hxw+o6H8qLjZpWuz8/FsKnBvui+jerIjXQJAiU4hAodj6DLxVdj3vZpqhs8wClyrFq57uxD3piozhXBnDuZ6qFl3sRABWOdYKwj7nC7VRBj0Ia/LeQ55zO8n/wSZeseGAbLuIz0a2g9fPTVkx1RLRH07ug5pcH5/MtoifCDySe9Fp1bPRcCrE5oEHhncB4KjetY3NOz44Z06Ol69kkk8OQJN52YprtoVBMXAFitYTB40qhXE8otKYdN++U6jeUkc21U+qAdMvGM+A/gYWGdy0buwRRKVbNsjAc0gWTKz0sygpTKZtFG9vdI4Nf6/+UK2neoQu/5dGfCj+hkifHpdyWLrbFBZctZwiS3FdUbDb62NvvNxq/8g3PBDCrwZFvksYEKYIRig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199018)(36756003)(82960400001)(6666004)(6486002)(186003)(6506007)(6512007)(53546011)(83380400001)(26005)(41300700001)(66476007)(66946007)(8676002)(66556008)(4326008)(2906002)(8936002)(5660300002)(38100700002)(316002)(86362001)(31696002)(478600001)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b082MHFsaDVDanZ6S1JaT2tWLy81NENyWkNVTzVMSEFYNTBEclFCdklkQU1q?=
 =?utf-8?B?ZHlkTFRmZDJlNjFLVWFCK1VsY0hWd3Fabjh6aGQ3ckZSclZWNHZDTGprQ2FK?=
 =?utf-8?B?RDBHeS81Tm93TnR0UEo0OG9UQXBETWM1MVBKMEZjN3lvMVptRHlVSlZMVGQz?=
 =?utf-8?B?ZmdEM1p1bDRMemxRT2R1T3Z4WnBYaU0xakRKekJwQ01HYnlPd3JTZ0RocXEr?=
 =?utf-8?B?U2U1bXg4RldaYjVsSVNmZjljMk9LMFBjWm9xUk5KQkxTQi9BaCs4a0ZtWWUz?=
 =?utf-8?B?WTBkN0U1bXNpYU1LUEdlaHpwakVrQzU0UWE0V0pSNVpkcUtqTlFHNHd1SHV0?=
 =?utf-8?B?VlJnemU2SHduSllPdUkyaXV6ZVQ2SEg1Z1FXb3QvTFBoNEU0YnlMV3pNRGMr?=
 =?utf-8?B?bndvdTlOM3FKQmMvbENTUlUveU9rYnd1ZE00TlNFdStqTjZONk9NY0dnNjNw?=
 =?utf-8?B?VFZjU3c2enB4K2FIY2tBNTNnZklpWlhIV2lHVzBZalVoTnJFeEtWMWJ2dWhT?=
 =?utf-8?B?Ym15cG1YZHNaWENySVhZSkt3anZGWmFVVFdVTTRvc0xZOUczSUVnYUw5Z05i?=
 =?utf-8?B?WUJKS3o3QnNyQVJkK09YRDVKY2YxY01zR0ZDN2lqcEI5YSs2aW9aQWpHNHJn?=
 =?utf-8?B?NHdna1NWZXlBUVR6TVUzREFKOUh6MWk4eDFuN200TDJ0N01MbTRFSnZlZWE3?=
 =?utf-8?B?QmxnNU04V0FGVmVqZzNvVmdQeExpV3pGM1V0VE8razhSZ0VXSkZCdTIxNHlo?=
 =?utf-8?B?QmFIY0d0Y2NYcFc5WmpIL2NNMS9EOGlFQ1dWY2d1TEhsWVhzeUhtVXYzSHBU?=
 =?utf-8?B?bmRnTVpVMWdHeXZRVVVyWXdpNUdzMWh5aVZqUEp5NnlJZWN1Y2wvL1N2T1pu?=
 =?utf-8?B?M2RnUVQzcHpCZTR2UG9sZzhTSU9IV0M1SmZqc0YzbWNqNlBQTkhCc2xPVWlN?=
 =?utf-8?B?Vms2d1RzY0MrVjhhSTRuWXJjbE9aOFhiN2hRQ090cGdpUFZrSEs1di8xQldT?=
 =?utf-8?B?bGttMEt6dlIxc3RnRTFtNC9pNDZZMWxCb2hJMFZDbkF6NkNoaGVCVnNLOWZQ?=
 =?utf-8?B?MkFmNGZybjVuV3pZZW5HcXZRYXU0Q0NSMU5BS2F5RUg5SjhxcmpVRlVPVm9V?=
 =?utf-8?B?RXpNQ2ZyQTk3SzNuZ3dSQ1dBeHlEallaSjJFcFM4RldOR2pkRUcvekJLZ0to?=
 =?utf-8?B?VDhWaFJGTGM4cFNtTjNNMC81RTJGcVhLeFVJL0IyRmpmUXR4Rm0wbXd1cnQx?=
 =?utf-8?B?Z1YrcDIwWUwxRkdKY01hV25kT05hbG02Rm0zV0tIMmgrb0JSU2xBZktXcmxG?=
 =?utf-8?B?MjRLT2p0VmQ5V3dIekNuMi9zb0l0Z1VKbmJxeUtyK1pFeTVoMVRXYmpNcWlT?=
 =?utf-8?B?U0QxWDRLcXFoQUNoUCtaUlhsZU9QYkdDYmdSaVdCcm1XYk1sd3plV2RZajdq?=
 =?utf-8?B?SEZCRWxWKzdYcUFIWE96cjlwS2ZFR0JkU3NQUnJWaVlscEQvR1dmZEhnbFlH?=
 =?utf-8?B?NFRyRE9keGVUSkMwSmtVZ1pEQTVlcGZobFBld0x2aUlieTFTaVhKWThIbHh0?=
 =?utf-8?B?S0xobGpTMVd2MDlORHB3UWVnLzlpQUhRbHRGQmp4ckxSbWRiYXFMb0lYdHh2?=
 =?utf-8?B?SlBDQzBuVGxxT3YyVWFTNnB2bS8yVy9lVjZ4dGZhdW12cytlVVVjTWwyUXZ1?=
 =?utf-8?B?QWJCSWo3ZnpjYklMOFFCblhoanI0SlZhbWpoaGRqNlV3YkhMQk00ZmhCUnR1?=
 =?utf-8?B?Z3JEV0t1YzBGRlhyWDRnNG9URGRJd2JZcXU4UzMrS0R5WjRpZU1SNnJqdDYr?=
 =?utf-8?B?amdIRmE5emlRdHVDd2hnR1VsV1ZQRkdXcjRFeGFJYjFhZnpMZWIxVjFNTmpU?=
 =?utf-8?B?amVTcGtyUVYzWDFGNU1kTjVJdGZkMHBCaFE4WHYzNzlRcEt3OXRCNVNCTzVM?=
 =?utf-8?B?U0hmc1dyb3lXWlBLckNpdUNNZzN5L05FczFibE1rOFVOVnI0T2NtQS84ckgw?=
 =?utf-8?B?YW5CUGx3RkcxdWk3ajhNcHJ1QzcrdXZRZU41cE1zUXZYdTRhK3U5VWgxb3Mw?=
 =?utf-8?B?bUFYWGVQS0NuS1JvTXRoZ2lZWEZ6NTdCeE8rNUpHYTQ4SDljbTlMVXF2Qisv?=
 =?utf-8?B?WFhoUjR4RXlkOHFPSnhPYzBGbGc0Qng5RGM0aWlJZ2RrWXdYNmVzTldEZmpw?=
 =?utf-8?Q?h1BOQ+8loVSs3G7BudKI7Ec=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a22c8518-dba4-4029-379a-08db1c533a5a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2023 01:53:19.1317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KyuEVFrbOq5kHmbdaBiTCg66JGw2Wi0x9JkNuy0y9f/qAT2nnBnNNxQu0i09230M+vmLf2/sEiorw57KmJ+XN/XbCwmvngF/Tzv192DGwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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
> Despite KCR subsystem being in the media-tile (close to the
> GSC-CS), the IRQ controls for it are on GT-0 with other global
> IRQ controls. Thus, add a helper for KCR hw interrupt
> enable/disable functions to get the correct gt structure (for
> uncore) for MTL.

This is not correct. On MTL, the interrupts logic isn't on any 
particular GT, it is in a shared area. The fact that we handle all 
interrupts as if they were triggered on the root GT is an i915 
implementation decision. Both uncores have access to the irq regs and 
the 2 GTs share the irq lock. A comparable example is the media GuC, 
where the interrupts enable/disable functions are called with the media 
GT structure.

> In the helper, we get GT-0's handle for uncore when touching
> IRQ registers despite the pxp->ctrl_gt being the media-tile.
> No difference for legacy of course.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     | 24 +++++++++++++++++---
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.h     |  8 +++++++
>   3 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> index 4b8e70caa3ad..9f6e300486b4 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> @@ -44,7 +44,7 @@ static int pxp_terminate_get(void *data, u64 *val)
>   static int pxp_terminate_set(void *data, u64 val)
>   {
>   	struct intel_pxp *pxp = data;
> -	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);

In this function the only use you have of the GT is to take 
gt->irq_lock, but that's shared between the GTs so it is ok to use the 
media GT for it.

>   
>   	if (!intel_pxp_is_active(pxp))
>   		return -ENODEV;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> index 91e9622c07d0..3a725397349f 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> @@ -4,10 +4,12 @@
>    */
>   #include <linux/workqueue.h>
>   
> +#include "gt/intel_gt.h"
>   #include "gt/intel_gt_irq.h"
>   #include "gt/intel_gt_regs.h"
>   #include "gt/intel_gt_types.h"
>   
> +#include "i915_drv.h"
>   #include "i915_irq.h"
>   #include "i915_reg.h"
>   
> @@ -17,6 +19,22 @@
>   #include "intel_pxp_types.h"
>   #include "intel_runtime_pm.h"
>   
> +/**
> + * intel_pxp_get_irq_gt - Find the correct GT that owns KCR interrupts
> + * @pxp: pointer to pxp struct
> + *
> + * For platforms with a single GT, we return the pxp->ctrl_gt (as expected)
> + * but for MTL+ that has a media-tile, although the KCR engine is in the
> + * media-tile (i.e. pxp->ctrl_gt), the IRQ controls are on the root tile.
> + * In the end, we don't use pxp->ctrl_gt for IRQ, we always return root gt.
> + */
> +struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp)
> +{
> +	WARN_ON_ONCE(!pxp->ctrl_gt->i915->media_gt && !gt_is_root(pxp->ctrl_gt));
> +
> +	return to_gt(pxp->ctrl_gt->i915);
> +}
> +
>   /**
>    * intel_pxp_irq_handler - Handles PXP interrupts.
>    * @pxp: pointer to pxp struct
> @@ -29,7 +47,7 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
>   	if (GEM_WARN_ON(!intel_pxp_is_enabled(pxp)))
>   		return;
>   
> -	gt = pxp->ctrl_gt;
> +	gt = intel_pxp_get_irq_gt(pxp);

same as above, only use here is the lock.

>   
>   	lockdep_assert_held(gt->irq_lock);
>   
> @@ -68,7 +86,7 @@ static inline void pxp_irq_reset(struct intel_gt *gt)
>   
>   void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   {
> -	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);

in this function we use the gt for:

1 - the lock: see above about this

2 - gen11_gt_reset_one_iir(): this should work with the media GT (we use 
it for media GuC)

3 - writes to the GEN11_CRYPTO_* regs: those should also work with the 
media GT uncore as these regs are in the same range as the GuC scratch 
regs and we use the media uncore for those accesses.

>   
>   	spin_lock_irq(gt->irq_lock);
>   
> @@ -83,7 +101,7 @@ void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   
>   void intel_pxp_irq_disable(struct intel_pxp *pxp)
>   {
> -	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
>   

AFAICS this functions uses the same 3 cases as above.

Overall, I am not sure this patch is required. Am I missing something?

Daniele

>   	/*
>   	 * We always need to submit a global termination when we re-enable the
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
> index 8c292dc86f68..eea87c9eb62b 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
> @@ -9,6 +9,7 @@
>   #include <linux/types.h>
>   
>   struct intel_pxp;
> +struct intel_gt;
>   
>   #define GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT BIT(1)
>   #define GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT BIT(2)
> @@ -23,6 +24,8 @@ struct intel_pxp;
>   void intel_pxp_irq_enable(struct intel_pxp *pxp);
>   void intel_pxp_irq_disable(struct intel_pxp *pxp);
>   void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir);
> +struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp);
> +
>   #else
>   static inline void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
>   {
> @@ -35,6 +38,11 @@ static inline void intel_pxp_irq_enable(struct intel_pxp *pxp)
>   static inline void intel_pxp_irq_disable(struct intel_pxp *pxp)
>   {
>   }
> +
> +static inline struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp)
> +{
> +	return NULL;
> +}
>   #endif
>   
>   #endif /* __INTEL_PXP_IRQ_H__ */

