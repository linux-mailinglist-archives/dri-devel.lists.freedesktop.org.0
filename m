Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0384634AAD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C1610E48E;
	Tue, 22 Nov 2022 23:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFC910E48D;
 Tue, 22 Nov 2022 23:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669158473; x=1700694473;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l7dmJQpOHMR7OQEnI4bWHUkvylFN4ae8dpzO7jIu9aA=;
 b=Z4gBMZj7rHQXDf0k6tAi84GVuwsgOLZxiwpSq/Eu1kfVK5QvCXXgB7yn
 8D2vlFekpq7f11JPYO6pmzqTxSCiom8ZJm3yqJby29lA/Q4ZP2Wv2dk5L
 ie1266JdsfCSOI69jNiV01qrNmEuCFlC0Bx7cQ3IofuQ8hsxQ/pqzNszH
 rgLfbqQ/Du4OxF2H1f7xL4baYf9MwD5CcWmUeH54mL+FuKwKq52IMSTWi
 ogWOSVC5wiFivIbNB3YgwlyDQZM/ZL8Tqg95/KYZJ4TEY74ftWweOaHj7
 qBDhxweWZm5Xnslm2grMvdK1qLaN0KGdUctrH0PN9WLEzncnuA5QUbNI8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="378191105"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="378191105"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 15:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="766500147"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="766500147"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 22 Nov 2022 15:07:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 15:07:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 15:07:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 15:07:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIYQs/GTN+TdkEInrJP1jNu5sNnuxnqXsORXgTbFlVnWwUDUphf6bP8aVJ8pweF1DlK56FNQS8XCv9ZK7Nn+8RsOKZcLlFyM1FnA3ZXcROyqSpUsEp6mbcTUgHGUQ1TzchlMmVjEGzC+s4Au/ew5Ik3e58H8vaxjtERMYL7HNmowuAseIo0lP/0yV9bVrHrxYR0bJxTlgMLR/mcpUL3s4x0lGg3X+DRaF9FqyZR2fa+AjMWZ6cIncLOd4cy8TH9N5whdI4vN2c0ElUmFewkf2FTMU4rG3wuzqILX7/SASgUweKAcT0WS6/p0Lxcf5tFsoRjX2uBMK70cSjJJWX70iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xxSLcCTVkvBQ3NlzKq5zGfBmel7u8fyxwejGTILSR4=;
 b=Rmpy0GYNP+qoQAlBOqhD+pfWLgo8iWdAjQK+NVv2DIzZlE/vOMtCF5ZUQDtmumGawMfmdkSPHmH44sLTE90WeWS3cAE0hF59A1niQnhS48GmQOO7T9idx5aDxL2u+svz20D3cgde535NjgE0Pt/emm4hKIglnQwIGY+u1zvo83cn2kGkspf37GxmyAG9VZzwYbIpT3XzUM5DhcOjOVATGli04GkK8Kix0EKjGWOcRzx64KHlmnsTLLwr+qpag4ATccz/NRXu9mcPlfd3935EN0k3rroh5mrh1pOeBHBbwc6+dnoGfj5lUEEl7fVXW+hONJVBWDN20ySDL9WaQtCkxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN9PR11MB5340.namprd11.prod.outlook.com (2603:10b6:408:119::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 23:07:50 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 23:07:50 +0000
Message-ID: <806d46ab-0153-1aa1-8c8f-1f75ea15381f@intel.com>
Date: Tue, 22 Nov 2022 15:07:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/i915/huc: fix leak of debug object in huc load fence
 on driver unload
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221111005651.4160369-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221111005651.4160369-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BN9PR11MB5340:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f5974bc-4d5f-41ce-f482-08daccde6064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6djvRlVxBtFa0oDrCH9icCT6GMAGW9quz7pHFQtRJChgd7A03tjIPq31USLMZ9I2zAtUhnoaVKg2ks/z/Ab3FvT5VgI1x+JkWoyczZ0UD6eLw5zl3/U16j21umFOivOj9hYR2pEER9M1kHsjF3lL/p/ja+00x1PLNTDBwEJDLirBTezMVWgYQU3/NxHGjgoTg4Rf6DW1YDUEQ/BEiK7ZcXt2PU0yGjnUlcUZKTObO0omCiuE4181gMWNezYHfQUbRc1Pd0v7HJ5XyW/1nelCBGXWDGiGgOiTsV6gnMSSYwOgOX9cD2j7TArSsXT8kuS4tS8cXX+Ay0+anNGor83RnFC9c8yX+nUAnmFuhgjdw1Vi1d6d7AMV2zknkOd+wCUfdfB08b9/dC6zAeoVrVrzcYxM7q9EMEGgAG2jDWcUaonwIBti68Z2gwn41GkZ4x3+jkVTRBIu0X3YKa6ALjAQFvXsl5gdeD+Xk8+5jFb85XJzyN/oTVpo3zOq+aoAJrm1kKgUn+5ZjsJHVA0eQ2q2TJUEsKfM7r8o0ghTjjkE6R9MZ9EtmYiGf7xZj4sujQPSd5kJaGJ3jHqPQTZQ9gUkqLEY3/q0Lvf4b0xJatwKrEAhKZ1J6gkDn9mjaUo3aIVgPpxZ4076aFd6EWVKOMlwLYOgMrukq5y0bCQ8O9qvl5vWBQeHzkRhQpNiVI/3sOIc4/ax1jYGVYUyeu3kjrcGdwawnbSx90kHPaDKHSIJtI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199015)(86362001)(66556008)(36756003)(31696002)(2616005)(53546011)(41300700001)(66946007)(5660300002)(186003)(66476007)(6486002)(8936002)(8676002)(6666004)(26005)(6512007)(478600001)(316002)(6506007)(54906003)(83380400001)(82960400001)(4326008)(38100700002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU9telRKV3FIYnVoNldEK2JDa1JkbDFaSThvTUNjY2NodzlmN2JKME1kV21w?=
 =?utf-8?B?RnVEMGZlZFQ0QjdnSjRteUh6ZDFYVFl4L0FtQmI4TDgzcW5yVkJvYUpiUjZo?=
 =?utf-8?B?d0RKeWV2WlBWdlB2S2J4UW5EMmtnQmtyUlRLTUJqUkZpWWVxdm5xOWxHSmJw?=
 =?utf-8?B?N1VTQmM2eGV0WnJwUDR2c1B6WXRqdjl6MWF2N0JKOVcxQzBwQUl4SGl3U2lB?=
 =?utf-8?B?ME9mS29lQ1lCcndIdWRSdXVWanRqMEJrQXhkdlB2U0VWaVhRTnJJWmRGWWlh?=
 =?utf-8?B?VlRWbWduYlVzR01SOW1rSkh3UDB5cTlxZURNMjRlMUVWL013UEo1YzF5b2ZK?=
 =?utf-8?B?bHl0WkFGV2N4QUdYRTFIeGNkVDVkWlpLMHBqWHNpayt2TlZieDU3bi9mM2Fm?=
 =?utf-8?B?YTlNanB6NFoyUEJQcWZqMmhlbTNKNWoxeDd3dHVZbXJBN0NRS3NVNXcxSUJx?=
 =?utf-8?B?TTZDOGpCckhmOVl0Z1E0WGpjNTJnSUxIUTNOa0QwdkdjOXplZ1doRHBhZDJ2?=
 =?utf-8?B?WTZFNDVWcm9YVysyVE1UVXVKbnRyNzBQTlZhRnZrNmJHQ0FtcUNBOWprcElX?=
 =?utf-8?B?WGRLVnZObU1MRVJmc25jdUVWUStyUW4yNXMrTlF5SkNyTjVkNGQwNWlWRGN0?=
 =?utf-8?B?SUNPZkQ3YjdMRmkzSk1uL3NEU1pwN2xlcjBxVHdmRTB6bTA2UW5RVENURGpQ?=
 =?utf-8?B?bFN4V0dNb0E1akhHa2h6a0FuLzdkTnpOMzd4RmJFRjF6NTRCbnFtellGUDNH?=
 =?utf-8?B?WWVwU0puRXBwM1dPWS9hRUxabzZ2THliOXZNbjFZTGtMQWNyaHQ1MFlILzIz?=
 =?utf-8?B?ZytFL0hRU1NBRWRleWJLKzViLzRKYWtKL3pKa002SkdpK2czQ3U0c1loSi9Q?=
 =?utf-8?B?dEdSTjZhS2tYNFl5dU5NaU8vanh5TFliNWdzWmZJR1Q0MlBZdmZZVk0zSDJR?=
 =?utf-8?B?UXpqblBNZGRQVS94NFR6TE95d2lWM0UyY2hLT3NOTnp1eHZZWVJYS2tEaFFh?=
 =?utf-8?B?a29FOFAxSllWNlVqRXdrTjgyMG85TktxT3dGMjdYSzQ0dzltVk1EakEyQmts?=
 =?utf-8?B?aHBLMFQvVU9MS2N5eDlpOHROZjY3NDhNWEJSZ0pqRjRmQ29XQVA0eUJDcmRF?=
 =?utf-8?B?WVh4ZVBLWUdUMHptMmdLSzI0V2hkSXRtVlQ3VmI2MGMydTFIUmFMckFYQ0tB?=
 =?utf-8?B?cW4zeVAwSW5oMytmY1pBeGNSNDNJZ2tXVk5YTlcxdGFYN3dWZmpMc1Bqemdy?=
 =?utf-8?B?SkVMRVVNQWNRZDE1bzFFZkdJT1BaNXJpQkNkWVk2QmdMcmZLZ3RnRFBMK0VF?=
 =?utf-8?B?ZnNPcVoxZFdYKzdidHpWcFVITGhVVUoxSEVTU0FoYyttOGx1VEkwWHZkZjZz?=
 =?utf-8?B?bWFncXdEb1NmVzgzSGRGTE02aW5IZUlHbzlVdmJOMlJ5c2J6U1o0Ykdxbjln?=
 =?utf-8?B?bkJuTW8zeUJVSW1YSDdleGhZNHpsOFh6U2FiQkpCeWtCT1VTSWpON0RuVXgz?=
 =?utf-8?B?T25kUTQzTDJaZkJKSkRVemExWk5ERXZ1bmxTUnhlZnliNlNudjJIb3d1U0wr?=
 =?utf-8?B?ZGg1N2IxbEJ0a2dLaU1iaVZ0MEtsMWxJTmJ6bDRudmRyUUNNYTluM3JqOGQ3?=
 =?utf-8?B?bXo3bGlzcjcxdXJ5UEg1OU41dHNlbExmblYrZU92dlpXTDNsQUZEQWdyQ0du?=
 =?utf-8?B?SzhPdWhPR3dud2VxY1YwUWpLdmZERTBQYnAvZXBtQ01Nem90S0Y5YmExbkRh?=
 =?utf-8?B?UDdlLzFzODhRMEFwRzNqcmlHb2tWMVc3alE5RWdZeG5TTjlKcXVWcDBJeTg4?=
 =?utf-8?B?ZUJQSllZdysxQVlXUVdjN09QVDlHdTN5R1hydVFsVVQ3cXM1dktiR2pRdDFX?=
 =?utf-8?B?WHNIdGo2UHQzWjBNZEVhTTJJSWJXQmVERjZyaElGWjdXWXROK0FPdHVVMXRN?=
 =?utf-8?B?cVJOSkMwYzRFZUZ5d2t2ODYwdEdnL0piaW5NQ1FrRTJsVW5NZHRiQTNYMEI5?=
 =?utf-8?B?MFo5cVUxNGsyeWxnQm5ubC9obmdpZ1dqamp1SGtnODRhbmNmbDJKZm8reXdJ?=
 =?utf-8?B?WGYrU0llbVdlWDdBMHZrNFVRcGhiZlhVZDc0RXQ2clBuWm1wOHV6Vm9QN2RJ?=
 =?utf-8?B?Yy9tb2FUUWkwazVjQnBzdVFtL2c1V1hqSkxDckxNOFFvNFJmQzg0MGNrM0NC?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5974bc-4d5f-41ce-f482-08daccde6064
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 23:07:50.0256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJVsTYUx6MzEOxQwXIF1jhzAGODz8XafmbjHESPu3Cz2rKGtj/DBM2KczOhRVU1wR0HuCEP0p3yVA2OuhAWk8VuYX7dGnmmXBplUjDn8eJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5340
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Brian Norris <briannorris@chromium.org>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/2022 16:56, Daniele Ceraolo Spurio wrote:
> The fence is always initialized in huc_init_early, but the cleanup in
> huc_fini is only being run if HuC is enabled. This causes a leaking of
> the debug object when HuC is disabled/not supported, which can in turn
> trigger a warning if we try to register a new debug offset at the same
> address on driver reload.
>
> To fix the issue, make sure to always run the cleanup code.
>
> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Reported-by: Brian Norris <briannorris@chromium.org>
> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Brian Norris <briannorris@chromium.org>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>
> Note: I didn't manage to repro the reported warning, but I did confirm
> that we weren't correctly calling i915_sw_fence_fini and that this patch
> fixes that.
>
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 12 +++++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c  |  1 +
>   2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index fbc8bae14f76..83735a1528fe 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -300,13 +300,15 @@ int intel_huc_init(struct intel_huc *huc)
>   
>   void intel_huc_fini(struct intel_huc *huc)
>   {
> -	if (!intel_uc_fw_is_loadable(&huc->fw))
> -		return;
> -
> +	/*
> +	 * the fence is initialized in init_early, so we need to clean it up
> +	 * even if HuC loading is off.
> +	 */
>   	delayed_huc_load_complete(huc);
> -
>   	i915_sw_fence_fini(&huc->delayed_load.fence);
> -	intel_uc_fw_fini(&huc->fw);
> +
> +	if (intel_uc_fw_is_loadable(&huc->fw))
> +		intel_uc_fw_fini(&huc->fw);
>   }
>   
>   void intel_huc_suspend(struct intel_huc *huc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index dbd048b77e19..41f08b55790e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -718,6 +718,7 @@ int intel_uc_runtime_resume(struct intel_uc *uc)
>   
>   static const struct intel_uc_ops uc_ops_off = {
>   	.init_hw = __uc_check_hw,
> +	.fini = __uc_fini, /* to clean-up the init_early initialization */
>   };
>   
>   static const struct intel_uc_ops uc_ops_on = {

