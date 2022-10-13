Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC785FDEBD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 19:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8555C10E30C;
	Thu, 13 Oct 2022 17:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A0F10E305;
 Thu, 13 Oct 2022 17:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665681235; x=1697217235;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SiXHQwfSpxURR9acwzBrKe/4yACEEZAl0K063FdSxMo=;
 b=cX3WdlJDKPEj33Hw8JWJ7K5pNlsoRl6UxgZKkqnNQlEop0nOKO7oHwIo
 C8Ag3VmXUeKvquFTVrjp8Q7yB2S5KRGCj0UXGImzr5KQhjqodhfHSRlbq
 mXOFGDX/GbKaO89O9ZZsu4LmFAnPdM00mZQy6/2ACas2v2ADZUrZcD9uP
 K3clq4lD8n5KlOMvrNsHE47wWon7AenVbbjg1JxLaCkEbiRr59enKcR3H
 eVV5CK1/wZ1eAibiY/+cs8JFuNVCNqocPLTfAbuq7WMEIWOCTFdFSQIiY
 DSKSd/zdA1VGa3DvdSNTg3MsKmMBFvWOMZTp8Dfs0OQetWIRsmCYZ6Z8x g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="391456417"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="391456417"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 10:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="605058450"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="605058450"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 13 Oct 2022 10:13:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 10:13:54 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 10:13:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 13 Oct 2022 10:13:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 10:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecTjmSX3xGVgrF/xZDNseyOT/LoTfPrfZ/pcLP4KkFxLCplPQPjzai9H4pv7a8VRdSKLvIqXbcKYlXga/wEHr8PLaGy4BN4Hbl0qY8lL39RvPNu8t0EviUyto8Bpt3q4iLpiz+SvQcI1uyhPZc8YTY9riyuHVvvvdXB7w8AFAcGPWiQbJrmXdlpVGUPRMJ5yz1x5DtAhb4le8CXjqfy1WgWphUEtXPeosdS9QEfUbZpJkCzUIyc0VMgm7fLAwcmmx+HO9VKetCRpjEPPfYxkrulHuD7uDKz1vDEv+AIhLTfbXQuUX0KfyTQPbtSbwQ+l2b9/engcgrHXTu+PxIi4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRPXidt/D6CiwZ7dam3Uy754b0hUBfyIzsEEJoouBYo=;
 b=Ihwng+NE/wqO6OKdxu3kSf19sZIzG9+XCiw8jveVdCWn1spsP8EwdI572ISyQbYhZH5SE+xL+TXP/GqwhZ9VzS+bz1KNuHqRbSF5UYVeB7msgL4SheBiul+xN/cdh5fvIHouwGyJjbC+YQ67/qZhakkXRIMgQr7BwO6UNrq5CGaHwUQoZglJJAClEPBAs6iFi+P7uFI9Mew3qTirWTkwMD7Ti0lZe2HKEItaKlauPVB05ULjsUHCsc+L+2a8aztFhZgzLBk9D7TJuqRx687SDweM1tcsaBmrnVv2xgpp335U+Br7eU2VCMLFjB73kFy3rFBS22LCNhep2PQ8Tbrbww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 17:13:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::c7a5:baef:b2be:1516]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::c7a5:baef:b2be:1516%6]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 17:13:51 +0000
Message-ID: <44a40ecc-c97d-ed55-1628-6f5e85e65232@intel.com>
Date: Thu, 13 Oct 2022 22:43:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/slpc: Use platform limits for
 min/max frequency
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20221013155524.25886-1-vinay.belgaumkar@intel.com>
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20221013155524.25886-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::30) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA0PR11MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: e1435b82-d2ac-4826-cd5d-08daad3e4cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DALSoUdx0Yrbf2MsHXRIHRKv7HKAN0QyscTwMsMNwj/Nxb96xasRbf+LoA7pLa4BLX3C3EudvTdz0uijNUYnNz0c5BKX2VVFwJPgaxbuAZuY2zaDliwKhMDl1popdhsYgM5JLZGvQRbU6m3iawekoHwhb7KBWWOITnhs6M2HDwr23Z0STcz36K6yM8Th7RbsB3/gFKjqS1OIhHq6x7BOS0FfSAMKWUSim7Rmgb4YVq6BVWFL7umxzz81ffD5KGeO470m1LKva8sgN5kj1KZKczMJ7CiWnMsJLL9UWd+inBm22T7ZUI+WmBlE0Eq8bp2nxfKrQLiptY7LlAyK4HF5+kuMDUKhi20b/k7LawpUGhxaS446YlaycvyVGfclndCH9D2IMtGHN4QzcKuaJh0gCsqAW9lDcnMhY/1f1YjWG1NnCRLNRqmhJjFCpgZBqdpsDlk82LSPCllWCdJ/dFYKitu2YdCh89NzK8pLczw3C7BzRiXG/CzFUaw1EXuMkXGfsZKoc4+uF/GXoDptH4qeV/5WEv70g/MplITK6fGElk5oCLHQ1l70zcedutn3KyRDZ1ig6mWh0IBwKgsJPKQyoxoWnpTc42goaBiO+0nx9s6/gzn7kRJQS2UhrJmEAMP/ZaH8ZWiDZ2NcDQZ/hVFSl+fzavNxsh5nIa8LVoKnJBu1+PWyzjXRNq5DzzqFUoGSa/hxlFfg46TBF/5xd0InJ2f3wwrZw59P/tsHS80EaUrj5AfbobDWLbVEH3/wfAJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199015)(110136005)(316002)(478600001)(6636002)(6666004)(6486002)(966005)(450100002)(31686004)(66476007)(66946007)(8676002)(66556008)(6512007)(8936002)(26005)(41300700001)(186003)(5660300002)(6506007)(2616005)(2906002)(36756003)(83380400001)(82960400001)(38100700002)(53546011)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1hsMTlxaVBjUTFmYkNjMnkrZUFKK2F1ZDRmMGFQWkdkbVpaRk9FZU1oY0FP?=
 =?utf-8?B?THNrS09NOXJhOUcyL0t3WkRUdmJ3b0ZyMTBZaDVvZHdaN0FjcDNwaTkwYjh4?=
 =?utf-8?B?ZEU1YjllMUwwdi93ZFZ0SCsrc25XVUxpMjkycXdrM09maytQQ3M1SkRuQ3A2?=
 =?utf-8?B?bTBFNVY4TmNCL09JMmpyaUZHSXFxcWFtaXY3UjBLODdTYVlONHI5UjhQZC9s?=
 =?utf-8?B?MFUySFFtVzRMN3k0Rzg5VXUrNXNjSi9RUlpKL1pnQ1NpbXVKVFhUVnV5N1pt?=
 =?utf-8?B?ODF5RHhTUkowUkFnWVJYSlYzcWFSZUh5U3V4NjVhcE9Xb1lMV1NrVW50Q3lM?=
 =?utf-8?B?NERncVdSeDFjZVVoYnJVZXMrakhOS2F4cU1ValZBc1NEeUs0bkJJQUUvKzNH?=
 =?utf-8?B?OHM3dmZFR3ZhcDVZVU9rdXRyZ3pHZGI3M0hMeWpHYk9nM1Q3LzRSamRUZ0Zk?=
 =?utf-8?B?am1JK2oxcS9kdW9TRE1BMUFsakdGVDFKbmZmQWMxKzJybzFTNHhCaGtsWllG?=
 =?utf-8?B?blBuRHFkcHFSR2pEYmg4RlI3UFVtZ3BRWjRiVHYyTzZzOTIxc21ma2N1WXdY?=
 =?utf-8?B?YzFTK0QyKzIwUml5NDlBU1VzQVZleDJZNE9tVTRnUFBDSHMyUjh3OWE5SFFR?=
 =?utf-8?B?NkcydjBCOW1ITVM0NVd6OUU3eFZCVWE4VCtabSs1ZnZaM1pNanF1bmZuWkkw?=
 =?utf-8?B?Q1JVTDlvUVZ1ZGt3NTByK2NFM24zdlMzUWthNHRySlFLRXY0dk5KbDZsSTht?=
 =?utf-8?B?b2V4Y1R1MGRobGtmd3EzemNQeWZIc1NvYlpxcno4ZTEzWEdzOTJlQ2FIckpr?=
 =?utf-8?B?U1FFMXdHblhmMURDZjRranRUNlZ3Mk5NREkxUjh3LzBYdHp4M1FiRjFQYTRs?=
 =?utf-8?B?RFhoNGp3ZUF1T3hjQzlRNU9tY0xubHk1SHFST0R0MmxOSW1CNVZVNWRCd0ti?=
 =?utf-8?B?Mm02U0M3RHBNYmdIZy9ybWVnb2tuOE9EaFpnaG5CcGwyT0VhVkV5M2hhbTRR?=
 =?utf-8?B?RzNoUXVodFR0Y0hHQ3NjWHBCRS9WeHFFVXNhN2xCcVZZNnZJWWF4ZVhsc0lF?=
 =?utf-8?B?QnFsaWNoZzBRSmlzR2VlS3E1WUF1RUh2TlRuL3VCWFhDL0tzWnFyMkFPVEU3?=
 =?utf-8?B?NFhVNlVZa0tKTDkxZ2NnSmdMR3RxZDREUHFKVDcrd1NSWTZBK1lWZHhadGh2?=
 =?utf-8?B?dm5EWXY1QVJVcHJBRnZ5SS9YZ2phQktzbVlGTDREYy9OUFFLMUVRTVc4T1Jx?=
 =?utf-8?B?NkltcVMrME1Ta3REUGJrbEJ5bFk5WWdaOWJJV2YzVWVvUnBETEp5aWNQaUxN?=
 =?utf-8?B?Z2Z6ZUlEVWJzSXlPRWN1Y3NSMUtCUTRkbEVaQjdUVTZJR044N2pYZjNHTU5i?=
 =?utf-8?B?WGRyanRYOGprRWdnUGFqNmJqNVJVc0VBQjR0VyttV25EUW9WV2VqSnJ6YW9Y?=
 =?utf-8?B?dnl6Mmk4NWowZ2VQOWZTczlmZU5USGtSNGk5Z1NIMzdHQ3hNeDlnR0cxSVlI?=
 =?utf-8?B?OHZENHFWa1JpeUtLQ3IrWEtHOFFldXFDaldVSHE4SytQYkVSbElEWmZ3U3oz?=
 =?utf-8?B?MkE5L0trcER0aVNDRTE5SlJNSlE3M3kvK2JFaTR4YUs1TVNzR2crVHBSekVN?=
 =?utf-8?B?TVlHNjJFaERpV0JXdFBNYkcwTWVmL256RThZMTlUb2FjZ2ozanQ0Z292UlJQ?=
 =?utf-8?B?S0t2cmlaZ2JvUE1DUzRJU1AvU0tWVEZlV2w4V0ttY0F2NjRkR3NsQjlqVWhn?=
 =?utf-8?B?V0hiUmw3cjBPUlFPc21kT0t0dnlPWFY1UmZ3K3hlSUtvbE5Qdk9nMVJiUUln?=
 =?utf-8?B?ZnJIeDk2Rkg1MnZoMUN0WjlZbFpFWTdVamcyeitvdEpBeHlVNS9NZ0JmV0VL?=
 =?utf-8?B?OWp1Y29yMURFaHVRMjYvNTZuRzhneEgxb3ZITmlQeGFQQXpFT3VQN00rR2RH?=
 =?utf-8?B?YjFKWmFVQXZCOGNHYzhtaHBVV3I0VzlZalJ0YWszK1F3WjZFOHY0eUNjMmsw?=
 =?utf-8?B?M0dRVWFHVDFrdE1RWCtDcWphL2ZtN2x3Ym5oc1c1cG1LdWJPbVRsYU1Ha1Jm?=
 =?utf-8?B?QVB6dU81U25GMktnRk5zQTlVWm83VU5pbURnYnVtbFozTWk2b0RWZ29FT2lL?=
 =?utf-8?Q?3UKVaBT//SAONwpp5w/O3CiI6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1435b82-d2ac-4826-cd5d-08daad3e4cd5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 17:13:51.8299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKP74OtiXqELt5SgIADfHq0EwVPci+S4uy8p+TAK35pA25lG6Wsl3Q3ocvSZp0L7nRC/v/41XXeQupPduxMghA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
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



On 10/13/2022 9:25 PM, Vinay Belgaumkar wrote:
> GuC will set the min/max frequencies to theoretical max on
> ATS-M. This will break kernel ABI, so limit min/max frequency
> to RP0(platform max) instead.
> 
> Also modify the SLPC selftest to update the min frequency
> when we have a server part so that we can iterate between
> platform min and max.
> 
> v2: Check softlimits instead of platform limits(Riana)
> 
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7030
> 
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/selftest_slpc.c       | 40 +++++++++++++------
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 29 ++++++++++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 ++
>   3 files changed, 60 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
> index 4c6e9257e593..e42bc215e54d 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
> @@ -234,6 +234,7 @@ static int run_test(struct intel_gt *gt, int test_type)
>   	enum intel_engine_id id;
>   	struct igt_spinner spin;
>   	u32 slpc_min_freq, slpc_max_freq;
> +	u32 saved_min_freq;
>   	int err = 0;
>   
>   	if (!intel_uc_uses_guc_slpc(&gt->uc))
> @@ -252,20 +253,35 @@ static int run_test(struct intel_gt *gt, int test_type)
>   		return -EIO;
>   	}
>   
> -	/*
> -	 * FIXME: With efficient frequency enabled, GuC can request
> -	 * frequencies higher than the SLPC max. While this is fixed
> -	 * in GuC, we level set these tests with RPn as min.
> -	 */
> -	err = slpc_set_min_freq(slpc, slpc->min_freq);
> -	if (err)
> -		return err;
> +	if (slpc_min_freq == slpc_max_freq) {
> +		/* Server parts will have min/max clamped to RP0 */
> +		if (slpc->min_is_rpmax) {
> +			err = slpc_set_min_freq(slpc, slpc->min_freq);
> +			if (err) {
> +				pr_err("Unable to update min freq on server part");
> +				return err;
> +			}
>   
> -	if (slpc->min_freq == slpc->rp0_freq) {
> -		pr_err("Min/Max are fused to the same value\n");
> -		return -EINVAL;
> +		} else {
> +			pr_err("Min/Max are fused to the same value\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		/*
> +		 * FIXME: With efficient frequency enabled, GuC can request
> +		 * frequencies higher than the SLPC max. While this is fixed
> +		 * in GuC, we level set these tests with RPn as min.
> +		 */
> +		err = slpc_set_min_freq(slpc, slpc->min_freq);
> +		if (err)
> +			return err;
>   	}
>   
> +	saved_min_freq = slpc_min_freq;
> +
> +	/* New temp min freq = RPn */
> +	slpc_min_freq = slpc->min_freq;
> +
>   	intel_gt_pm_wait_for_idle(gt);
>   	intel_gt_pm_get(gt);
>   	for_each_engine(engine, gt, id) {
> @@ -347,7 +363,7 @@ static int run_test(struct intel_gt *gt, int test_type)
>   
>   	/* Restore min/max frequencies */
>   	slpc_set_max_freq(slpc, slpc_max_freq);
> -	slpc_set_min_freq(slpc, slpc_min_freq);
> +	slpc_set_min_freq(slpc, saved_min_freq);
>   
>   	if (igt_flush_test(gt->i915))
>   		err = -EIO;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index fdd895f73f9f..11613d373a49 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>   
>   	slpc->max_freq_softlimit = 0;
>   	slpc->min_freq_softlimit = 0;
> +	slpc->min_is_rpmax = false;
>   
>   	slpc->boost_freq = 0;
>   	atomic_set(&slpc->num_waiters, 0);
> @@ -588,6 +589,31 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>   	return 0;
>   }
>   
> +static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
> +{
> +	int slpc_min_freq;
> +
> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq))
> +		return false;
> +
> +	if (slpc_min_freq > slpc->rp0_freq)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static void update_server_min_softlimit(struct intel_guc_slpc *slpc)
> +{
> +	/* For server parts, SLPC min will be at RPMax.
> +	 * Use min softlimit to clamp it to RP0 instead.
> +	 */
> +	if (is_slpc_min_freq_rpmax(slpc) &&
> +	    !slpc->min_freq_softlimit) {
> +		slpc->min_is_rpmax = true;
> +		slpc->min_freq_softlimit = slpc->rp0_freq;
> +	}
> +}
> +
>   static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>   {
>   	/* Force SLPC to used platform rp0 */
> @@ -647,6 +673,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>   
>   	slpc_get_rp_values(slpc);
>   
> +	/* Handle the case where min=max=RPmax */
> +	update_server_min_softlimit(slpc);
> +
>   	/* Set SLPC max limit to RP0 */
>   	ret = slpc_use_fused_rp0(slpc);
>   	if (unlikely(ret)) {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> index 73d208123528..a6ef53b04e04 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> @@ -19,6 +19,9 @@ struct intel_guc_slpc {
>   	bool supported;
>   	bool selected;
>   
> +	/* Indicates this is a server part */
> +	bool min_is_rpmax;
> +
>   	/* platform frequency limits */
>   	u32 min_freq;
>   	u32 rp0_freq;
