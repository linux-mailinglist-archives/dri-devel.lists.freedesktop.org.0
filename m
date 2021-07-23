Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C443B3D40D2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42596FD05;
	Fri, 23 Jul 2021 19:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C6B6FD01;
 Fri, 23 Jul 2021 19:30:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="192212154"
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="192212154"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 12:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="663393923"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2021 12:30:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 12:30:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 12:30:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 12:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHidYXMNALf0vv933C98bFkIizDrrqjfsfLg2xYar58BXrqJL0tHKHgjZL00L1HqE8okKYhVLAuyMPgpp9ZT4Wi0/WOrXzYEMJkp9mJHDXXdS1GDn5creOXx/23xIih54g5pAQ7E/wlT/5MGKWFi6lJYB+9u7c1LcXnzvsk77BwI3ece5O5+nHMN+7ednkLlscqCiFB/tlWqpBrG1T0UyUToFfddZo1Ub8DY1Q6INA8/Ng+rzWjQG3DNWD1Kga4yh0ajQiwelJgnyMcX+35uuSwSpfSS0eUAsDm+7TiFuwOyMweIWipwjtDmg3YHpNrA57Or6gRoLrFt8ahoX1OdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4L9pEllv4YKrq1R9AeodGsRxSyvVhloJ1tuQArqCzBs=;
 b=h1Q+qgcLPgbtKk2yz6bUZNwXsjqJRnnsL0aHVnKUxeDbdNXbpsd4CjC45bTaLrZ5iBxy/IwBrQK7/s4y/OjSQ2h3PiNhgdxCYyG0S1jMjFR6zKS9CjcLsMbe0z+lXb+O2lkEcy4GURcPCU1BGAp4DuuVg0gV8mC10oB+0aHXhDyF2k+/EMGBWVYVsfaVBakxdOJ42gbKExEQ8u11JSkq9iTrUXOmagLmNPZnvsOkapz1HPx8RSHkjNrQmhvT/nueiHpDsEiO9BgrW3QwuHrTgbHfi8RW3eyT6AksF2H2b6nfsMQlHNJKSstKmE4DgchAQMxcbtUiUZ5HrvoW+Lm+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4L9pEllv4YKrq1R9AeodGsRxSyvVhloJ1tuQArqCzBs=;
 b=H5lAPmEiDprssuLfU0UKiwefL9/nRa8yfBLgyQ0oL4diwy94SiUE6qqt9a6bPKR2OiWNSA1TIER2W9r6wU1BCwcpG+B4kGOLBeUPYYU+AKXsA598LN2PH7Cobz/i3BCE5jOLzvTbRnxMx5EdzvyhwXkVRttWOiijU5/I+lX8eMo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5619.namprd11.prod.outlook.com (2603:10b6:5:358::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 23 Jul
 2021 19:30:15 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 19:30:15 +0000
Subject: Re: [Intel-gfx] [PATCH 05/14] drm/i915/guc/slpc: Allocate, initialize
 and release SLPC
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-6-vinay.belgaumkar@intel.com>
 <fa6e3691-d43b-1b42-f031-f3d533298eae@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <a78f8303-ff47-9b39-3c12-da7548e60387@intel.com>
Date: Fri, 23 Jul 2021 12:30:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <fa6e3691-d43b-1b42-f031-f3d533298eae@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:303:6b::23) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MW4PR04CA0078.namprd04.prod.outlook.com (2603:10b6:303:6b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Fri, 23 Jul 2021 19:30:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c186a1-ed3f-4977-3bad-08d94e104c5b
X-MS-TrafficTypeDiagnostic: CO6PR11MB5619:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB56199C019978288A813C491485E59@CO6PR11MB5619.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AJBa422OUaUCU5astwpFormDBqq9OGVKHCWuS3L+iE8xr42/7Ed6Gp7ObTXDAi7QWzefxD9AGaFgkDjYGijJgwYhevTFukEuADi9ZSPXxtUpEPljPRlTfsIK+Sr7y9j5u23WrbKFp5/2taNioKB4Tg+fAUdqVmxHbEG/4FPqgXUPBwrczWmyp3JxjujwwHdazaQ4DbKZOTH4HH96Ry98r4e87j5AsMW/ysoi+FdVkZrnBuagx0QkWrLQq60+rRAQfecJyMUE8f2jRyEVDqOIwZUA3wIBoi2Wexe3GmshzNLran3G15Jlasvqh6PZ/XWe9pPzhiB9qEbFQdgCwpXgC/353lkDTHqFcC2JxPTI1bu9eE5rstnNbRh9CW/I4Td+bYtPkOJ7mW8F8HMyBrtuo1m2vlz1o48syuBXgX5/xK/ic6zODZP1Lp1ytJk2VaRrZIklou2qN5Ksa+ab36GwEjnyf/mGcBdN/RmkO5g5UudzISC9G4MnOELSKvKnHWhEZnFw7nbJ6QG0ywFAE6Ra21MfGCvofnL4lcQDpxegWq8yMcNNRDreapmEl9vxIcA7xJotIwNR34uLxtxTzsEd5JSNPYCyWYkXqaVvYKYdFjqz1jHvo3eOx6Vqt2/zWL+vyYhLiJn8iCMxzdAbObHDmucpYUo8uR5F/+4juzmT87mka7BwJRUfF26J3Lo0TrZshrNxIN2nP5HDaCt3E+jxnMmSsibn5oHCANPpV+/FKJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(38100700002)(36756003)(86362001)(66556008)(450100002)(478600001)(66946007)(31686004)(2906002)(66476007)(83380400001)(16576012)(186003)(6486002)(8936002)(26005)(5660300002)(8676002)(31696002)(316002)(2616005)(956004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3pkbWVEOCtwS0tBYThabjVjWk9rTjZ4YzZ1aTVUaXJKRnF2WURHUCtpS3BR?=
 =?utf-8?B?Mm1vMkJEYnIxeFczQnJob05WR0RUN05kWER1Ly9RVmx3MnVRZkJHenJCdnEz?=
 =?utf-8?B?RVNVYXRDNlljeks4MHFLVVV5WnVHU2hVa3lXMHVnR1I0bEZpWFZmTTYwdS9a?=
 =?utf-8?B?TUNVOXlqRG1kYUVFdkFQUTNJM2NUaUl3TkUzTFFBSTYxNHo1VEVzOTBGQXJk?=
 =?utf-8?B?Q1JIYlk5encyaStOdFMrYnNBczF1Z2d2d09CNW44bERjbEhCSlBENzN6Q2o4?=
 =?utf-8?B?UWp1bDVmcFZVRURhWHFyRk9raXQ5NVRCd0tVSGRvSXFqNHoyOXBNU2FDbTA3?=
 =?utf-8?B?RjB2eWdHeElTZDJ4TTJFU3p0dHVwaUswQWtWN1FTZ3FDcFR3QmVuZTlXZDY5?=
 =?utf-8?B?a2V1YnV2Ly9kYlFNU3lycW02VmhPUkNkRllzbDJFZXFKZ2F5L3RPdmpZaVlY?=
 =?utf-8?B?NEFQSDNYVEZPdFhQVXFORTZpWTBhQk5LQmFiV3k5bEF5V2Z4KzgvaURuMHI2?=
 =?utf-8?B?WmdDN2pKL0JGanR2VU04SDlxM2Y0aTJhR0MyL05wNWFWWUkySjZSZnFBaS9Y?=
 =?utf-8?B?akNDQTEzK0NYRUlpa295K1lSRGJJY0dLdU10NDkxYXNDaDNlYXVaTld0bXNt?=
 =?utf-8?B?OTVLODUyODVGcWp2NkMwRDlRZW5ORjdTdEQrSk5ROWtVMWk4VEVyU0lIWTFt?=
 =?utf-8?B?emcrTWNmd0dBcElLR1VCK2lDTkFCcSsxdFFjZzBiTXN3SC9yRzUwd2djTk9h?=
 =?utf-8?B?TldYaWJYTTE4SHp4aWpHN3MwdW9Ka2t2WW9wMTRjbGhFM0JqbDRBYUFrdkJw?=
 =?utf-8?B?NE5ZSWdFdmZNVWkvZ2ZlekI0S2M1QkpHNTFZZVBtZzk5SzJ4bGVzZ0RUb1Zn?=
 =?utf-8?B?NEY0RkpSK3AzbytrYWxENUJEVzV1THljOTNZcTFBRUxLYVMrWDFJRDQzdENR?=
 =?utf-8?B?MncvRStNV0VJQ1Z5K3FKTUdtUGRxQ1k1OHQvdkh1dzJ5bkhrNzdVaW1aSVRE?=
 =?utf-8?B?ZDNtT0thSUJGdDdtQitHb1BhTng1K1BhTHFkMGpmcHlyTG5NelB6ZTFQeTVQ?=
 =?utf-8?B?OU9TM210dkMwZ1h4ZGkyaVg5RHpHc3ZTMVVia0w4ejVaYW9TdE9UdldKQnRX?=
 =?utf-8?B?MVFMTXh0Vis5VmJWTVpXRkRnT1VzTENGbE9RbVdXQ3BrejVzU3I0MWxVd1hL?=
 =?utf-8?B?aEFYOVZVOUtjMGVLNkcyQ3hVVy85azVwZ0V1QmNOSndOZXhTcW0zd3hTQUs2?=
 =?utf-8?B?c2lxQnJGRW1MWUg3NVExUFRXVllVbi95TlVyek4wbFJ1aDZOOUN1Y0ZSU2hB?=
 =?utf-8?B?V09lRFJoR2wzQ1N3YU42N2ZnbVRNQ3o4dkcrK0xDZForREpzcy8xZ0hvcmpV?=
 =?utf-8?B?QmpNdzJrb0cxNmIyK042YjZtcHFONjI5aG1USGxCM0hTREx2dnEyOUUvSzlU?=
 =?utf-8?B?NENwYXVCejlzOU1Eanhub3dueDlteVo0SmVQZkdzemw5T0I4dUJMZk5kcnVm?=
 =?utf-8?B?a29KU1hMSldTenZlRkltRTBuVWFyWitQWWZ4dHV0cFNtTCtNQTZhWStxZVds?=
 =?utf-8?B?SWNoaGF6OFdQRUl0dTJJTGt1Q0p2N1puRm9nSVlpZXVEMEhCV01GTStsRlVk?=
 =?utf-8?B?ak9UempQWjRZcTh4VDVSWGdSaEVZVkFMNTA0eXdvTmVCQjhyKzBFT3NCYkZG?=
 =?utf-8?B?NVdQejc0U3ZjZ2tvRFhFNWdWNnBSK1E0NFVFMUMwd3RoWTd6a1M2cEhCRWts?=
 =?utf-8?Q?BMwy51x/1t1d5OwemdWQ1corZ15jmeAleowtfF1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c186a1-ed3f-4977-3bad-08d94e104c5b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:30:15.7714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2492edSNtzLgxb2bxdUPsLzup3QbzkVZ/3RW3JZJUx9i0AeJEcSOpERMUz8WWcogaOeaUZTRau4VCTNrpEzJUC3N0amPl3NBbSY3xr+y7dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5619
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



On 7/21/2021 10:26 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> Allocate data structures for SLPC and functions for
>> initializing on host side.
>>
>> v2: Address review comments (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 11 ++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 36 ++++++++++++++++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 ++
>>   4 files changed, 50 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index fcccb103a21a..686cb978662d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -337,6 +337,12 @@ int intel_guc_init(struct intel_guc *guc)
>>   			goto err_ct;
>>   	}
>>   
>> +	if (intel_guc_slpc_is_used(guc)) {
>> +		ret = intel_guc_slpc_init(&guc->slpc);
>> +		if (ret)
>> +			goto err_submission;
>> +	}
>> +
>>   	/* now that everything is perma-pinned, initialize the parameters */
>>   	guc_init_params(guc);
>>   
>> @@ -347,6 +353,8 @@ int intel_guc_init(struct intel_guc *guc)
>>   
>>   	return 0;
>>   
>> +err_submission:
>> +	intel_guc_submission_fini(guc);
>>   err_ct:
>>   	intel_guc_ct_fini(&guc->ct);
>>   err_ads:
>> @@ -369,6 +377,9 @@ void intel_guc_fini(struct intel_guc *guc)
>>   
>>   	i915_ggtt_disable_guc(gt->ggtt);
>>   
>> +	if (intel_guc_slpc_is_used(guc))
>> +		intel_guc_slpc_fini(&guc->slpc);
>> +
>>   	if (intel_guc_submission_is_used(guc))
>>   		intel_guc_submission_fini(guc);
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index d9feb430ce35..a99d727b5bf0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -12,6 +12,16 @@ static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>>   	return container_of(slpc, struct intel_guc, slpc);
>>   }
>>   
>> +static inline struct intel_gt *slpc_to_gt(struct intel_guc_slpc *slpc)
>> +{
>> +	return guc_to_gt(slpc_to_guc(slpc));
>> +}
>> +
>> +static inline struct drm_i915_private *slpc_to_i915(struct intel_guc_slpc *slpc)
>> +{
>> +	return (slpc_to_gt(slpc))->i915;
> 
> redundant ( )

ok.

> 
>> +}
>> +
>>   static bool __detect_slpc_supported(struct intel_guc *guc)
>>   {
>>   	/* GuC SLPC is unavailable for pre-Gen12 */
>> @@ -35,9 +45,29 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc)
>>   	guc->slpc_selected = __guc_slpc_selected(guc);
>>   }
>>   
>> +static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>> +	int err;
>> +
>> +	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
>> +	if (unlikely(err)) {
>> +		drm_err(&i915->drm,
>> +			"Failed to allocate SLPC struct (err=%pe)\n",
>> +			ERR_PTR(err));
>> +		return err;
>> +	}
>> +
>> +	return err;
>> +}
>> +
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   {
>> -	return 0;
>> +	GEM_BUG_ON(slpc->vma);
>> +
>> +	return slpc_shared_data_init(slpc);
>>   }
>>   
>>   /*
>> @@ -60,4 +90,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>>   {
>> +	if (!slpc->vma)
>> +		return;
>> +
>> +	i915_vma_unpin_and_release(&slpc->vma, I915_VMA_RELEASE_MAP);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index c3b0ad7f0f93..f02249ff5f1b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include "intel_guc_submission.h"
>>   #include "intel_guc_slpc_types.h"
>> +#include "abi/guc_actions_slpc_abi.h"
> 
> is this is needed here ?
> maybe abi.h could be included only in slcp.c ?

ok, removed.

> 
>>   
>>   static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
>>   {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index b85148265b1f..214a449e78f2 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -7,9 +7,12 @@
>>   #define _INTEL_GUC_SLPC_TYPES_H_
>>   
>>   #include <linux/types.h>
>> +#include "abi/guc_actions_slpc_abi.h"
> 
> for below pointers you don't need this header(s) to be included

ok.
Thanks,
Vinay.
> 
> Michal
> 
>>   
>>   struct intel_guc_slpc {
>>   
>> +	struct i915_vma *vma;
>> +	struct slpc_shared_data *vaddr;
>>   };
>>   
>>   #endif
>>
