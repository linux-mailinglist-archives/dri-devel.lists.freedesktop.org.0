Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD5634D98
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 03:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F274B10E1E7;
	Wed, 23 Nov 2022 02:08:22 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A57C10E1E7;
 Wed, 23 Nov 2022 02:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669169298; x=1700705298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zno/PqCHiaJy+1csYNoTXp0wU1RhfMywI3AOVUU/C0s=;
 b=UBbpcqkXPPz0m85VzShoeZ9fXbTQBvG526rzcWmWq7LiGFUsxLyot/5R
 QpgOZqj//mbqu1TjXqI8c8UZeiTPk+UEifMD4Pvaqy8srHld5/59nUItF
 wOWA7YUpRyhftasVW7jTCQJy8RC6U9yxONXHY45+mSCFuzLc1CjPBieWu
 ap28QkKwMzzhs76fLrjgYY3/YZC/WFKsIqAwSs+GaQDnP6t2gYa/f46AR
 ZptVKnujLVppkWQ8zvvz22sFxzYOJsl1TvcJa5rSMjbBTlzT8PxZAcKnd
 uJX+iTSZEtoOvlQZMVQ0tBwLxT6fW9tAJ5/TF0J8oR3FT3VQ9UFduTXV1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="294350708"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="294350708"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 18:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="635748197"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="635748197"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 22 Nov 2022 18:08:16 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13; Tue, 22 Nov 2022 18:08:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 18:08:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 18:08:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2GMlLRo8ZuVyKN/zi3EKDsfDqg+WVnSCmxFCrCYb8Jxv4UawNvQlGGK2s1eH2iZn4vmKkxcF7MtJ37Uo5E8y7ePof9XlPcAGsBuSpELkgZduM5luL71PMr/sPVEECfG2K70h+DLbNii0PO4lDpTLpsRVBAzJrmf9AOSf8Xq/WRxTW2d7nSjMxdsy24AsyPwyc6Pk3bOfh90QBNszKDhbEAIdz7qNTzoSFWkEEf/EjJivJGCwjVjslL4CpfwvVWtRIL+XtCSyyNdEnCkW/dTboS94BtFQ3T0+kMuDMxsH47u7ihzRndq79KFbfgvLRadXO3hbHioF9V/hqiZU+wpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b46o3sDSKfRvu/xVi0rzbfQ3poVoB8RuZAiiuRcHf0c=;
 b=GmQVPgokmDftiyz50y1g4gA/khP6Ck9q6THDWJ6B5ZI58az3PoM6aJWELknyXS0iAHLcqoBLid5QGl5lZnJlc+dLYw0fp6Zit9W4FJIojl2qwbEFNOyNicRFyJmqVaNc52eMwaghnacA/jqScUwWsqyO8ygY3xDUEV51tGM6Gi1+aD+6fLIQQ46j1ve5IYSjQJmMkMs/v0V0s45sNQ3zbDxX5Ocej9od0AtnIRz6r9w6uu6DBdRHomdUmgOkKTaljkQSavy7Cw39azqXGu1rGX/7hgLIPYpieZNVm7TVNXGZMM8hU7Iw1zKGiDF0iX0BQ8BiiOvnqKPzHtqq5jyV7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 02:08:14 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5834.009; Wed, 23 Nov 2022
 02:08:14 +0000
Message-ID: <720d9601-56c7-4c76-9ef4-a86d6b051e0c@intel.com>
Date: Tue, 22 Nov 2022 18:08:10 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/i915/uc: Fix table order verification to check all FW
 types
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221122233328.854217-1-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221122233328.854217-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SN7PR11MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: c168db3a-c45d-4446-78ed-08daccf7935e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BvzIu6yB84yFgtTOTgvwVe9lMMy4yO9yfXGcNt63AO6aum++TeqHwKGacZdaV5ixBNe6uoOZZYx+AOjbF6ngmbpXZADhUyEObQ4IoD0J6omZISrQ51jijJQalmzuaHnTUl+HwN1B0+7/LjgYNb9GOKGsaVNWJmM4fAVqCR61C25cJ1xfpt0XWunXYmisuOPLWBEstYt8npfGRQOdvI6iGEdtf5Vj5OiiuUM5AplYCQxctHDuWClkJIkHAUDqxlSvsb2317F7KGBLo0ikJTjO8a8cOAt5kTvVcL7sZUIWZQeOJQnT6KmQC09HvsKKxVGGedPVPi9d5VZw/XNxy5418tRvc/ReXTYmWcH4cfyEQIotMeWrdX88WvNBtRylr3NHuil2T17/Qd6yTCa6GN6reiSNh3WRrVNJ1wRm8r3jWvZ8FKuesFiRsv8j1t6jMyIfordb2+vpt8vJ88DLozRsgURNEFSIJIknL9ZxnFf7Ms6TyWVkzvZo59ozK4L5cV1fZSV9dvJoJLJ8CnOeeOhqaZ0ygJkcl+Iqof3v+BdBpkPPCbyVcexOElQTLseF/w2gCy9MvqGFB0lPkP5gZqQRdYYYMAi3S3TMe+kB9xOYHr7zD9jW8LCWPNSnnk/4CUAVUSBzu09sdXegze5Aw4J70D+5MwIyFGHnfFi9f3+DUJumUmvakqX5AKF2l1+R6Yb9kBoBNIZZuCYDjuqQusxOPsUPxX3cGQiV72wBnD17SFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199015)(38100700002)(450100002)(31686004)(6486002)(478600001)(6666004)(31696002)(41300700001)(6512007)(86362001)(26005)(6506007)(4326008)(82960400001)(316002)(8676002)(66946007)(66556008)(36756003)(15650500001)(2906002)(66476007)(83380400001)(53546011)(2616005)(5660300002)(8936002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1FrZHZTYXpTSm1IbUJQanFXd3I2TlhWUG9ETUNpMlJaMWkzb2FaaTgvYzgz?=
 =?utf-8?B?MmtvUDIvVVY3QTVFLzZXZ1RzbHEvTG1zRUdVM3FwM3UySkJBc29kSzRGSStL?=
 =?utf-8?B?Um9BRlprcWdNR3JZaUorb1l5Q0pBWDcyZk5qS3Z1V1pmczNrekZHVEQ2Smh4?=
 =?utf-8?B?NzZNSkNBdXNyWnNSU2M4cFFTcjJsOEdMY3V5S3VOZlFieDczWmh3aUp6YnMv?=
 =?utf-8?B?K2MzL3dUbzdKcGVXaU5mWjcvbmlZOVdzUjNaTHNCdDR4dk1UOG1POFMxL3hE?=
 =?utf-8?B?SHlCc05hM2lyYnVpR1FQaU9UVytyaSt6MHVIa1p0eUluQXNlckk5QmdyZGpt?=
 =?utf-8?B?VlBLcUwwVWwwT0dpWmVUcUp1NXpBTXRxVHhTMTlRU0NhTUZGcjB1Skt6bVBW?=
 =?utf-8?B?SjZ0UkFuVzFORk9tendLdGJGbjJJcWpwQVNDSkJWa2UwTmpxeDJQQzhtVVVJ?=
 =?utf-8?B?dU5ocTJSeHNyUXEwdEdFTC9CQzFWbjBjeXAvSjhRSGp0NkJOeE5zTG5SOUFK?=
 =?utf-8?B?b3JueE80Y2N2N1dkMGNJL3l0QVlpdWppVUtTQnNVK0xvL3dWaGRuVUFHRExs?=
 =?utf-8?B?ejYyZjdaQWVxczB3b1VXMmkwV1pNTXIxZitCQ3FUNG95K0RKeFIwTE1lcEcz?=
 =?utf-8?B?czlJQ2JJUlhnL1VKeERiKzRsZ0d1MHVDeFV2RG8vdzZXVFlSNVBkSWdIdWlJ?=
 =?utf-8?B?UEtpajcwV0NDMUNEZHhUa1pOc0x1OWxyamRmV2M2QlF0bzMyZW45UC80aXgx?=
 =?utf-8?B?MUYraGFkdFJPR1owQ0hPS3JqcVdISkRvSC9EK3YzamF1L01GZFRiTmhYUkhH?=
 =?utf-8?B?SHlDdHdhSStxRFdqUWR1eFBVWDNENnUvalJYWENxYWdyb0J2OW82VWtzZmVN?=
 =?utf-8?B?UVh4aXhoeHk5c2FpOVJoU1doc1ZFNFNDeWNqOUtUSEVqakVqZGNTajBmOUFV?=
 =?utf-8?B?aE1IKzIzZU82SWVxY2phOTRNVWVoY2QyV3RaRDU4S1owSWE1SmlrdThIandH?=
 =?utf-8?B?VDB2dEp5NTc1a0NzOWtDMnZ0WjBDVTRZRjk1NnhKb3BHL3JuVlQzYkVoaG0y?=
 =?utf-8?B?aHREV0FwRFFxOGxJb0ZrSEo3MlhFQU9wNUxzdGZpOEd1UXhsMlA2Znp0Z2lm?=
 =?utf-8?B?cGlJQjlKaGdNRzJpOW5FaHZOd1ZUMVY4SGlpRjd4ZFd2U3ZOS0F6MzVLVkVx?=
 =?utf-8?B?MFZiSmUzbXYzVUJLQ2VqazFlN0FMQjMxMDBCOE9PeW43QlFVRzNOSU5mV2RR?=
 =?utf-8?B?cWxvajZvL3BWWk1yeThST08xSTNHa29IQXU1OHlsZlZYWWRvaHI0czNRZTYw?=
 =?utf-8?B?M1JPZkZDcSs1YnRqbGhCYlVBTVRHUlEyd2JwSlBnWnY5a1VGQWhZK0RSNmVz?=
 =?utf-8?B?OFk3SllSVFZhMXZVRWJaTjhyRFh6WXQ2by9oN1I2NkRBT0hHV0JiKzM2eXZO?=
 =?utf-8?B?WTVLa0JXWExjSElLbTRQVDNWdnRKTnNDdkh3VWhZb056TWZJVVM2NFVBcUtr?=
 =?utf-8?B?YUVURW1OYTBTS3BocUhrVlUrRm90Q0ZZREI5enJMSkQ5VGVHVFRud0xFb0hi?=
 =?utf-8?B?N2t4UzZ6UzFMbVRFVGlwUVNEaXRUc1pkUGswYUhacDlJczE2eEF3WTlJSkZt?=
 =?utf-8?B?R0hFQUNjMGtvaXNHZ2tUN1lzdzRvdnFNMEFza25hcWFNVU85S2ZSbVo2QkVz?=
 =?utf-8?B?ZmVxNXA0NmQwSjRTeVpURE5rVVNML1ZvWHJNRVM2TkhZSkVZMHJ1eEE1Zmcy?=
 =?utf-8?B?R3ZYOWRubUgwQU8vQnBFTm8vRjJxdFQ4Z2xmRkt2VFZHSzMyWXRLMDFyYlhP?=
 =?utf-8?B?bXVkMnlwVk04ZkJacFF6SHpGd1BIeElnQ0tOaWV6L1pYem03MTdyWGdLYXdB?=
 =?utf-8?B?WVBtcXJEaUd6SWdwdXlMN3hhc0FUSEhaV09YQkVFMmQ3cHdJNHh1aTFlWVpr?=
 =?utf-8?B?VEpGUTdsMStXYjVjYkNKRkxqQnFvMS9weW9LOGhmM3k1N2xOZ1p5WnBMcXZW?=
 =?utf-8?B?akREbHRDVzFmbzY3eEtjOXJxZzdwOXYraVd4RUluQlNEb25TdFRWSEJselk5?=
 =?utf-8?B?a3FlUTNSbW4yTWZuLzNuejBQQk80YzV6WlU0NFZOOUhLcW5ZNERod3FGMEFE?=
 =?utf-8?B?QXBPa2RtN25nOTNEYUxHNm1VbGN4S0RJMUgyZy92Vy9aczcwdkdjVG4zalo4?=
 =?utf-8?Q?sgcTtWh+4D6JMahInO31too=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c168db3a-c45d-4446-78ed-08daccf7935e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 02:08:14.2919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edvHWt7UXs1tg3BB8XEyQO2vaSND5EQIlWrp6ZHBJBqMLo8sb9qwE7SV0iPZarHDp5cMwlerBn8rdS5CwieakU/08aOxWsrg5w7y9fUZtDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
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



On 11/22/2022 3:33 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> It was noticed that the table order verification step was only being
> run once rather than once per firmware type. Fix that.
>
> Note that the long term plan is to convert this code to be a mock
> selftest. It is already only compiled in when selftests are enabled.
> And the work involved in the conversion was estimated to be
> non-trivial. So that conversion is currently low on the priority list.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 0c80ba51a4bdc..31613c7e0838b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -238,7 +238,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>   		[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>   	};
> -	static bool verified;
> +	static bool verified[INTEL_UC_FW_NUM_TYPES];
>   	const struct uc_fw_platform_requirement *fw_blobs;
>   	enum intel_platform p = INTEL_INFO(i915)->platform;
>   	u32 fw_count;
> @@ -291,8 +291,8 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   	}
>   
>   	/* make sure the list is ordered as expected */
> -	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified) {
> -		verified = true;
> +	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified[uc_fw->type]) {
> +		verified[uc_fw->type] = true;
>   
>   		for (i = 1; i < fw_count; i++) {
>   			/* Next platform is good: */
> @@ -343,7 +343,8 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   				continue;
>   
>   bad:
> -			drm_err(&i915->drm, "Invalid FW blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> +			drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> +				intel_uc_fw_type_repr(uc_fw->type),
>   				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
>   				fw_blobs[i - 1].blob.legacy ? "L" : "v",
>   				fw_blobs[i - 1].blob.major,

