Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B7C576EED
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FF410E7B0;
	Sat, 16 Jul 2022 14:36:03 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F4A10E13C;
 Fri, 15 Jul 2022 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657905721; x=1689441721;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y9CB28z/9UPH49xsE4tKq9dxBLEX5Q53XoG1GJb+Uoo=;
 b=YmuYUpmkS/UrkNCMdhfGPgUR8atFwhbrS3ezY2RBDn0evIf8LfoQkK8k
 /OdLyJmRNKW/qcqunrx2QufqqWWMJXu8pCimls3lLWbrLyZOi6XWzCknq
 LaJGpgztOn5N54asz57yi60AKYOFWWOEoU/9+QWbxyPESJOLp/GlaxfiF
 OFnqWLJLY9ZxDj6REZIjaQQe4vqTKChoP6QRAFvh1TthuwwFt0RC8Za2k
 obfnHQuVi1bLCxvBUIe4hXUKO8Xl/djjgLXKkCGXhXpKaRLGCeMamF91y
 hHOgNYT7/gTM0fi7+TztwDaiUtv+pE0U+sUTbaa9ap3fIyY4fuOlJ6OJJ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="285876368"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="285876368"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 10:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923586249"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2022 10:22:00 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 10:22:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 10:22:00 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 10:22:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWvQIiSrH07kHak/spzCKUw4tocWLcNx+WcjZtVZiwgJGKe1W3oI+gD+AAZWmdO/E8LjAU7VU0abcJhxzwabtHCuCOaANEUMPuhI4urA/UnvFGwNu8452PgudUjXaEjOnYbo0QcfJpPmdPA9ZmtrXmuHdne6NdUCk2P0TZSCqYWhA+sjPTWJSBVxZafPLTF7dEsraCeU0JEA7y9Xz5M9sDJFS41rESntOAroq+pYdn+iU+U4aCzGbzcKgJ6FFGulb3uoV2RP8QL9pmnLEmqkkntY3GHXnlYtKchlJYrfrmw4li3xR4bj0RVZrKdPxoyC9d3jXeQK9ZQ4GMplbJAITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNy6c4JDDEDMyqFn6usbUfhRqMKxd+gbyBkKEmq5Oi8=;
 b=OKBWSkv7emAXw714Pts5K6FPckWpTGsF6i/ob3ipcBqQ5Ht+DJRRSV+iFpM7+ICmc/XdHls3VWCfopefzja3x9uZFQluduoVhCB7eHdVNsXgiNot0Xbd2m9d7UMLH4Ip46QOY9xyFdMXKBO/e19Y4G/u3LlWP/M037HXaAy8fpiHDWUu3M1MhabsYNgnGTgEWR63B17aMCM0MJR5vQ/hDIgiY9w3I9F8s3xKlX8e/k45uhqLgGxiNfzRlPjKRZ2lopiACpr2NEaZRFu3cc8PkEVAJKdq1WPjsgwblNWuz01M52a05/1I+jjdK4/TI7Zw9zRtCR1eyVRuaaIw/iGZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14; Fri, 15 Jul 2022 17:21:59 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::e8a1:cb8a:5124:2848]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::e8a1:cb8a:5124:2848%6]) with mapi id 15.20.5438.019; Fri, 15 Jul 2022
 17:21:59 +0000
Message-ID: <aa595256-629c-3116-aee3-95976f8c874b@intel.com>
Date: Fri, 15 Jul 2022 10:21:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/12] drm/i915/guc: Route semaphores to GuC for Gen12+
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-8-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220712233136.1044951-8-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e382c65-504d-407c-1f6f-08da6686862e
X-MS-TrafficTypeDiagnostic: CH0PR11MB5265:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uozzrw/KzBdij6spo7jiMvUKfZzFWaIFzYTP8r6Ka0+WPgKDXqGtof9RaSiDFdH7fpvEyIf7+o0ME6yvYUUL1CfqCjOiy0p6bHCoeisBMwhCNlq7WHaimM9j6aYlq5JqUU/wWSAt8S/yxBswyIIUwhz6tWHS5LCIRxs2FgBC2wp+tLVQ5uMXEGm4t2GJt0oqCvzSomx3CZkxhG+fyxDenb/8NYXaMqBAajqdO8yiqn4hEZvCCvOAzWxTbOWTjIIhg6qPd6TcOcWwmDyGCQZG5EXtY//9vMVuMQsldhWyiVzyirUNrLFOJvMHhqO7qT0yIU8ZkDlXATNxj2duiec2TuuLlE2r/i9IVZR/T5W/Wy7Z2OZBbJWqmcPfaS3Ht6j7g7WKb+93138Oae6v2hEI4FWm+wpEZmmCh1110DDNlyS5qIL2bJ6CH4fuEmb/jG7lZRENDduf0htXe05fw4oM729vgjQAG5Wo/T0N8XZmm6umsLlVrENszKemXr4TezW0JQoHR0ZfqHBzTjoVNdQtEi4/aRarq/hmJUYHiUc1RoescpsSUuTzO7eq3vHNf7fLuivHqj6Zl9cK/zlD5T2Ax5yduwhd4IioZW+ZcLHzAZg5sn8KuOJevV5BSO/feT/pNAluOAcFvsuCdLDx+1OcbEuJMxngh2RyoHDmLbAVNQ5G+JW6Bxo7JITYEhwbdM1FiZ2hBGd9SI0q9Z3JF7yylrWOu9IfqPRhqZPrjbMhZQzbn3b5Aps7zKAKQvOtxG6RcEt32iuKqxRBk2IKdWWi9pVLubKiZdC9O9WKn3HA0fIniTgmH8Av1c5dt9ACWXWVR6CtNsTiqRVD6daUTTcZU0Vn+PJjBoz6f7J/JPXukTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(366004)(136003)(39860400002)(346002)(186003)(66476007)(4326008)(66946007)(450100002)(66556008)(8676002)(6512007)(2906002)(2616005)(26005)(31686004)(36756003)(6666004)(53546011)(41300700001)(6506007)(86362001)(31696002)(82960400001)(8936002)(316002)(5660300002)(38100700002)(6486002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTlDTkhmR2RZMEprSjFHS3B5cUJxUWxiVThEY1RESUVHVVcvUk5VTys5TWdD?=
 =?utf-8?B?VzBSTXBoQ2NRNHlLN2NWMzBYUS9aZXoyVUxjdTJYa0NOczFWUm1OTU5zUUNs?=
 =?utf-8?B?M21QT2d3RzQxemVONWNtaTNSZHBTZUZreWY2MURpbDlEV0k5VDhZMzQrUjQ3?=
 =?utf-8?B?VHZxbTZGSmhpTlJFRTNqR2VSVHpXOFV5aUZkbDk5U0lHWEFZbVJqTlNpQXZw?=
 =?utf-8?B?M3hla0Y1dGFJcFk1b2JCbmpaMDVvbEsvdVVaVnlvTmEreHBrNnczck05OFpy?=
 =?utf-8?B?SzVITE9Hd2ljN3pXYWVmMVQzSGx2bXRmcGRwVGZ1R2ZNTlYreWVsSGs5b3Y5?=
 =?utf-8?B?ZHFNeXdvRkNKbUF5U2ZGZ3p1My9KcVhPWW95ZE13bTdHSXVMa09ycURtN1Fn?=
 =?utf-8?B?UmdxZGVsWkE4TW5GK2xRUEtrd0YwdkluVGdRQjV4WUxLbGdTcHYzWVpUdFFQ?=
 =?utf-8?B?aGxCc1czTnFkMVVneGQ4dWxyUFkwek90TkhMWDNsTXlHbkVoNDZLUlM5WGNF?=
 =?utf-8?B?Znc2U1c5SjhpU2V0VFBnVW9qQXUrQVNWUlV0b3g0Skh0cEdTaUVtZWZWK3l0?=
 =?utf-8?B?NlNHTmE2aFBRVmh4bmVIdEYvNzVSREZSVjVRbmVQTW9CaGxWbzdoWjBXU0Jz?=
 =?utf-8?B?am1iVFg5VmRDRlJFMjZTb25ZVk14MzkxOU9mTjlrZllxNFhpUHZQV2FtSE9F?=
 =?utf-8?B?UEUzM0RtMndwL1orYkRTY3llVEhwa09yUWNMQldXMmhaSHcvekdnMWNLQXFS?=
 =?utf-8?B?a01IU1ZLcXFkdDF0S2N3SDc0ZFMwYThYd3JzdjRxTTA0cUloWVhBREQyUXdL?=
 =?utf-8?B?aTZPaW5qb0pUcGdrSk5FRGNTTzFNeW1ZWHJieGdHMng1UjY2OHB6Y3RKZ3Ez?=
 =?utf-8?B?RjI1NWdlUzI4b1JpbFR0VjVjdWZQVndnSnIzNE9jNk5FRmYzQXlnN2RDM1Jw?=
 =?utf-8?B?cGY5M1I2NVRVVXlPY3pSaU94d1p5bElaSndBQURIVmdwZ3E5NEc3clp5UFdR?=
 =?utf-8?B?TW1FRUdpRTZSVFJOcG1zL1NhZzdCYThQNXpnSVBHcGxveCtnVUw2SGMrd2RW?=
 =?utf-8?B?T0lFakNlNXRMUGxIM2ZYOVQwZXpENEdvYzRTUXdhRnR1TmUwOHV4bmlENWIv?=
 =?utf-8?B?ZnVxRkt6b0szcmxQckZoRHdTdmNTQ1NmeXNFZlN4YnBDSjVKVWRPTXd0Mm8v?=
 =?utf-8?B?a2FsVGU2bXBIVE1OMVFXYWRBZ1NCbUgyL21JZkcxdkhodUYxdmhteVd1NmlB?=
 =?utf-8?B?QTJoUFJvQ1NJcnFCOTVGb3VPeXFxdmZkWXY3clVEV3phWGFsTGoxZnQvY2ZF?=
 =?utf-8?B?NkFVZWN3cDIrVG9OeWFSSUhzNFNubDAzMTg0czNGUWEzSmxmdlJWWWl0U0lr?=
 =?utf-8?B?RlVWN29OTGxzZGZEUm1xckwrSWVyRjFjeFpGMGoyaTFDdE85M3g5VGtyVDJz?=
 =?utf-8?B?Lzk4d0VocWxJM0VEbnNiUWhwL3poTWs5UmZialNCaVZPUWp2REhhQ2dmSVRx?=
 =?utf-8?B?OEszRXRQSWJoVlVHVWE3Q0VpVWtIUFNISnVhZHBHeEpVL3pScmRMWnRuWm1B?=
 =?utf-8?B?cTR5YjZ3T2V6OWRVSTVEbW5NNTRLRmxnNHVtRE85dXpnZTNvczM1ZmpYU2hr?=
 =?utf-8?B?VWdaNXkvVnFYcjlQMUpmcHJkKzgxRHpzbmhEd2lpMVhwUVV3VkFpODR1Q0I3?=
 =?utf-8?B?Tk1zR2VxeVg4UjdqcnFIc0JNc3pQa1ZxVjVXUkVkVVh4UlFTMDhwUDBibXJQ?=
 =?utf-8?B?RkRWRDc4NVBZWW9TMmZ6emd3STdaTlc0bllYZG8zZFg2RDFKeFNOL0NQZk15?=
 =?utf-8?B?L0hBbkRxRmFudFN4d0llcHRtcVJZNE4vV2szbHFMbytwT3RXQlBBV0RHcWJt?=
 =?utf-8?B?S1Z4TXlaLzJBV0liODdsVU1BZjdvcmMzT3paSlVqZFBRNnlzYWRmR1kvL3FL?=
 =?utf-8?B?U3Nmdm15amtjM0dRTitnKzcwcjdienRrajNZZjdnZVJTY2V2dUZBNUVwYWtu?=
 =?utf-8?B?UGZxWjFGUmRPU2d4VnFMdkl6d3ZaNDVFbmdiemJzSUtiL0N3MlpoNTNVS1hy?=
 =?utf-8?B?YUoxMW1KZVF1alFNSVlxaXk2RHg1MU1yQU9WSDQva2NpdVptcFNCVFo2ZnBt?=
 =?utf-8?B?VC9yQVdPalhEVWNxaVZZSC9SVmJnQjc2eWVYbmlVdlp5T2VWM1JIWGF1ZkNV?=
 =?utf-8?Q?tUr7vqeL1KcGVSO65q8Ydjw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e382c65-504d-407c-1f6f-08da6686862e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 17:21:59.1510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6ERtIvLOWtM/Mf1AxtES7FobwapFRbUzURdZs7g2/02JAA8pFP3i95AVISxmabgsfNp2vgP8iYEAAafMYtbaSkC8zmsURUS3fGOogP9fnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
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
Cc: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/12/2022 4:31 PM, John.C.Harrison@Intel.com wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
>
> Since we're going to use semaphores in selftests (and eventually in
> regular GuC submission), let's route semaphores to GuC.

I'd specify that this interrupt is only relevant for semaphores that 
context switch out when their condition is not satisfied, which is not 
something we currently allow (but we do plan to as you mentioned). Also, 
the routing only happens when in GuC submission mode.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h        |  4 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 ++++++++++++++
>   2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> index 8dc063f087eb1..a7092f711e9cd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> @@ -102,6 +102,10 @@
>   #define   GUC_SEND_TRIGGER		  (1<<0)
>   #define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
>   
> +#define GEN12_GUC_SEM_INTR_ENABLES	_MMIO(0xc71c)
> +#define   GUC_SEM_INTR_ROUTE_TO_GUC	BIT(31)
> +#define   GUC_SEM_INTR_ENABLE_ALL	(0xff)
> +
>   #define GUC_NUM_DOORBELLS		256
>   
>   /* format of the HW-monitored doorbell cacheline */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 40f726c61e951..7537459080278 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3953,13 +3953,27 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   
>   void intel_guc_submission_enable(struct intel_guc *guc)
>   {
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	/* Enable and route to GuC */
> +	if (GRAPHICS_VER(gt->i915) >= 12)
> +		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES,
> +				   GUC_SEM_INTR_ROUTE_TO_GUC |
> +				   GUC_SEM_INTR_ENABLE_ALL);
> +
>   	guc_init_lrc_mapping(guc);
>   	guc_init_engine_stats(guc);
>   }
>   
>   void intel_guc_submission_disable(struct intel_guc *guc)
>   {
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
>   	/* Note: By the time we're here, GuC may have already been reset */
> +
> +	/* Disable and route to host */
> +	if (GRAPHICS_VER(gt->i915) >= 12)
> +		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, 0x0);
>   }
>   
>   static bool __guc_submission_supported(struct intel_guc *guc)

