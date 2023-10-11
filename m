Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFD17C53AE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 14:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B8710E773;
	Wed, 11 Oct 2023 12:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354E610E4D7;
 Wed, 11 Oct 2023 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697026962; x=1728562962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6mjobVJrFw+C8Bl5/JLtvX6HqTYMkYkoaJfq2VEBYnE=;
 b=P2wYFghTtWPqeSO0PX7wHbVYlyxXCahJSqBQQasblNbEA77k0GaCAMvZ
 Xx7sWEUkAyIUrXwRUlLmPhm3XFmEBD/mHb5AdrtJiCiGLwi/Kmc7hlP73
 zAinCBwWkmU/w3uxw31M0hPZD1Nu1sKI5stMxCr3c3MYfXuX7MCeAeg3z
 Si5fe0zjZEbQpFwTMQx941KWHNdUUstu5PcvlCJiuoInkF3R5udq1mumx
 f51qVPTPdJqQqWZp81j99vgaraA7lBKQchSbfRDEcLyP8KbUwdy3K5mSE
 H5tAHsEssxOQ+gl8IG98PVrdCM7KTMdCtTJUoD3cSz2OkhwIKWSGWbMbi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387493823"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="387493823"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788975641"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="788975641"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 05:22:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 05:22:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 05:22:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 05:22:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 05:22:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6yvk/l0m0Kj8yFfIJIuzspBUEDPHROd93nPnoeq+s7wMrnW8pX0ka8RDWjvRrzTTJEWXqluqHXsy0IzBrNq3/7vBBCcY4JG9DhmTgCbudfHT7BeelCla0KmB2CDv0mtdkYBWwBipjQ6bGIv2TW1BLR5gzbGujq5IL3gMeAscYDfUCgyGCC00pebPEf8IT2EYkoPM66KJDjYCqMvrKKzuS++e8df8EbiaMIUKZAoSbeTTTlIB7Bfm3F2yoOEhEVHk+0pygdQVQF7JNA8krMvqUa5GJ/DFnRkO1Ppe/vxv/2HQnHxzXg7AuRHCPexVuzkVYnbpmY1nZpL+2GpjhRDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6l+fZux0vyE4t+lusBWQ9cBvoZop2VhrkuILpb/9oVw=;
 b=LbwZhTwtKh8f/IUcup5UgD70AziMpotW/MMhtBlehp+V1CLRhVtVobcRNa4Yz7uoTjgaJ0FD+dgBlQfpIvQzOVvGOt+mTCnSZ6olCUp3hEWWsz+ntFBIfAk+bun+fgRTPCSnTcDz3EZKUrxMIZIs8bKQDOLEKXxNhoEHjtnR3on+MXyr77ZoVuwAW7TCq5Wwy1TMn9GKuWfym1P8/3COX3EJ+1KbLtLqIX3i7T8mM7t9V8TU1zax/6g1KfUKp6LJcq6/PFWY4t2kHiOwWeZx2gqiKej1GOHQxPRTnjkzcZAgGKdMfKXhPdllJuWtqRbYwo71fuUmcoTGRexTGZqoTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Wed, 11 Oct
 2023 12:22:37 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%7]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 12:22:37 +0000
Message-ID: <909f1da9-f112-b619-c1e2-2c3a87ae3ce8@intel.com>
Date: Wed, 11 Oct 2023 14:22:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Prevent potential UAF in engine_init_common
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20231011115451.12521-1-nirmoy.das@intel.com>
 <87fs2h4agd.fsf@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <87fs2h4agd.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB9PR06CA0024.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::29) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|SN7PR11MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: d58a67e8-52fa-4929-4f51-08dbca54c170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9PBgPWvSxu7BGl0dxm0IsgBG4/u4lzTxKQmU5p6QeaH3lABI7xGVBfQvyp8H/kc042jJF7+TS0peokO2JViyKdVrcQGAWioKw+gC6EuYs4YESP9O54R5tUohnwEL/eWg7zEUNMHOwlV3nNJB4X0v2rwHufiv0VnUeBTRjAU/ZTLNMtgBZK0wBRFYgS71V0FKSxyTSQ5TujJMehFPxypdJiILBJEZWHi0SFpEfK5/my9m6tPhrOtYpo1UFDosFonQPYBinBACpxlyRbGOC4aQJLxoHpRLep1EOZJ2iEGkFeoHppEIsQYl+3e7oZeapEjN5h138TIdYRnjC3ZLrCAO8nb2VSoiC5u/zuCHLhFj+LfAGaEmEPth4PuEUGlC+grndIPW2TxG9ki5zpFL/9nPcLxxdcDacuMB44QJo9674un6/FpqiUJJqz6DLg9YeeyAUX1QN4teQuvoX5Ezc82I7fPSDKwaUb7D7OqiHaWVxQvcIbxGteXN6h8qMy2wM1P4cMQGQvhHPwdUFDLEjUZlVxQQ7xAvYEXytghkZWfUQfqHqGxkxam1dy51JaDBZ33vSmKSjE5SptIodenIx+9/4It9kRCKoOpuepWtUUyRcT1Tyc5D7JEYtxJVzz1iIoXagf8ZvPLxnghSPZbtT1oFHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(31686004)(53546011)(6512007)(31696002)(86362001)(38100700002)(36756003)(44832011)(66556008)(83380400001)(6666004)(6486002)(478600001)(82960400001)(8936002)(6506007)(2616005)(8676002)(316002)(4326008)(41300700001)(26005)(2906002)(66946007)(5660300002)(54906003)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUM0dGFIcTVWVG50U0UzUTVsaDRLcjl1MXordWU4QktRQVZrQXAyaHRuUkEy?=
 =?utf-8?B?MTlHRU52bkxhSVczYm8rT1E1ZEFPZ0hNVE16WGN2T3BMdE1GeGxZQ3dHY3Va?=
 =?utf-8?B?VUt6L0psVDZYbU1ZQUdJZlhBUGZhTmU0ZjhFbXRZN28reVFFUXk2TlhkQ2h2?=
 =?utf-8?B?eXZkamhGWW93dXRISzYzSVYvSDRub1d4eUZDR3piUk8vMmt6ZzN0cmd6cnlU?=
 =?utf-8?B?Z0FsdFlMbGI2c2ZGUG9OV1B2Y3BXL2ZPS3lhbHE2OFVGSW9MYW94UGNqTm1i?=
 =?utf-8?B?SFZxSW1nL1Z6VmR3Z2hEc0orMERWOG56Si9VZ3I0NUhWOWltVmNKMDJOejBL?=
 =?utf-8?B?cmc5RlhsdFNkQ3ZqOStIamxZb053MC9xVXJKNGpuZDduVFNpakRwc2lIQ055?=
 =?utf-8?B?UjA1WWxBanc0ejMrTy9JUWlvdkQ0SGpkd0hIU1dVcjhkczM3bWpGci8xSFdJ?=
 =?utf-8?B?b0JXYmdhQkl1b0pRVFBNRkxYc2duaFJmek0zalJ5cUkxY2hRUmhxNThFQkVy?=
 =?utf-8?B?bU5LeExrdzdzSmNjMms0blA1am4wUkNwb0txY05hVzd3RXdOOW9rZy9kdVNh?=
 =?utf-8?B?NjUyMGdmZk9EUjRPdVp0UkFkNHIwaU1tTVdET3p2RlgreFMzVk1WalRUSEFH?=
 =?utf-8?B?dmFmMzJTaDlaYkNtYWpzMXp2ZUZDako5WHlzMDBlSFJxc1RPRzVOUWpGKzdK?=
 =?utf-8?B?VTlnQUt6Z2hJc0ZnaUFSQnA1NnhEcHZJaVc5cys4c3NUUXk5ODBJS0tSTTd4?=
 =?utf-8?B?UmJ6VEJmSXJMZEtWMW9acHJWNXlFWnIyTE8wUDYzNzd4K1ppSGZpbWZGRVZy?=
 =?utf-8?B?b1dSeFFLb1hBajdIVTF3aVkzRHZXZktLM3k2UnMxazg1UUhTaGRuZExBZ204?=
 =?utf-8?B?bDZBUVNYRGEva2RidlZ5N1drN3RDVXM5cldPUS96bmJsYkRFd2hpLy91Vi8w?=
 =?utf-8?B?TzZRWmFJVm9uZnowQVZsY3BGejIyQVVoZmtTOUkyQ2lhS3lGSzJOVldCV0Vv?=
 =?utf-8?B?V2M1MjJ5cGVHdlpObkN2TiswZFcwaDh3NVczRlhOUDlNbHJ6WmFtZndmMDR6?=
 =?utf-8?B?MkJMRVUxTTNXZ2daMEVhSnc5amhTcDB1bk8wRTR1c000Ym1xWUN1djQrZ0h1?=
 =?utf-8?B?T1U3MGs2R3BKMTVxcnU3Q0JYZzZLV2EvengyZEpsS1ZqL2RjeERFd2FhVzhC?=
 =?utf-8?B?aXREZldOSWpVQUszWk1QTS9IMXJlNCsvN1U1eG4rZ0lsNUx4OVlKSW9jOVM0?=
 =?utf-8?B?YXhaeGJxVnVaR1dpdnp0NkI5K1M4OG1WVVFFd2xqV1F4bE1nSzZMRGxkMUFQ?=
 =?utf-8?B?RHJIZUdFMjl4a3lWa2FhYzRveHVvKzEzZEFKVmFsYnI0TlNKTjZ5MjVQTTNw?=
 =?utf-8?B?RjdSU0txb2xEUXlIbDBma2dXblFzYWRUVG9wUy9uOW1jUlNaL1hJdXVIOVR1?=
 =?utf-8?B?elNCU0U5ZkxkaDRsSkNZYkVhalZEeUY0c25QSU05Qm56bUlqREVnbVdjYjB3?=
 =?utf-8?B?Zmk2cXgrZU5zbXMzeVFZeTBGRmo2WnNma01VZnlUemxBQkt4REpQUWVOdkw2?=
 =?utf-8?B?VzJFVkd3SmI1Z0VWQTdCZkVkQmxMc3l0MGw3dklpMlFxSFpIZ09XWVdhQkVk?=
 =?utf-8?B?c3BqRmlraWVlMlhySjR6UXNLMFJXMlBPR3loK2t0b004Y214dXJmQ2J6NGNy?=
 =?utf-8?B?U2ExT3A3b1VXRkpQWnNta0JHeVZkWHBVV0VKTlNOMURhTnFRTEFCVEs3VCs1?=
 =?utf-8?B?bXdINmdVVnNZaGlQdUc3QlVEOXVxMFlOU3NNYk8vLzhsM0UraEhJa3dKUStP?=
 =?utf-8?B?ZmtNaUlxVnlUaXZIMWxid0FGSmhVQ1NFY0JYTkVpMGI4ak02SHNPdXRwU3Nj?=
 =?utf-8?B?YnBzZm8zQjJ1bTlqMHNrR3g3bFVXTnEwN05Fc0M5RGZLMEFYUzRjSUVtRzRu?=
 =?utf-8?B?ZExNMTN2SFd5ZktLK0EwRkQ0RmtGc3dQQXQxbzBDRVFEYXcySm42VDdKUGNX?=
 =?utf-8?B?S0lETFRZcCtHOU45MGxEemZBVk5xK1FkVFZ1VXZEeWhEV3N5elhkQWFYNHJ5?=
 =?utf-8?B?b0VyU1Z3ZFV0eFYwMTNoOStDazZHeWJGVlcrMGFiekhzVVJMVklaRjAwSzEr?=
 =?utf-8?Q?1MMq8uApskg/eyIEbRrzRktXN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d58a67e8-52fa-4929-4f51-08dbca54c170
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 12:22:37.6341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Xefbs1da9TtjTAoAhVysXN9mObX8qaRg4gOyv+AHWnTj31nLSgUrCcehKi0YJfoyMdz+ExZY4E1ghCiOj83Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
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
Cc: dri-devel@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/11/2023 2:20 PM, Jani Nikula wrote:
> On Wed, 11 Oct 2023, Nirmoy Das <nirmoy.das@intel.com> wrote:
>> If measure_breadcrumb_dw() returns an error and bce isn't created,
>> this commit ensures that intel_engine_destroy_pinned_context()
>> is not called with a NULL bce.
> So it's a potential NULL pointer dereference, not use after free like
> the subject says. Please fix the subject.

ah right. I will resend.


Thanks,

Nirmoy

>
> BR,
> Jani.
>
>
>> Fixes: b35274993680 ("drm/i915: Create a kernel context for GGTT updates")
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 179d9546865b..4a11219e560e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -1491,7 +1491,8 @@ static int engine_init_common(struct intel_engine_cs *engine)
>>   	return 0;
>>   
>>   err_bce_context:
>> -	intel_engine_destroy_pinned_context(bce);
>> +	if (bce)
>> +		intel_engine_destroy_pinned_context(bce);
>>   err_ce_context:
>>   	intel_engine_destroy_pinned_context(ce);
>>   	return ret;
