Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269B3D8488
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4126E87D;
	Wed, 28 Jul 2021 00:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B222A6E87D;
 Wed, 28 Jul 2021 00:15:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209439797"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209439797"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634578109"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 27 Jul 2021 17:15:07 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 17:15:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 27 Jul 2021 17:15:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 17:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIjOJm+2EpiJSVdocxs98xjvA1EIoWR0OtkFQ5OLLr2yTUvHZcKDUlRhXbmrywb4c91FvxHUBjrVg6q9EB5m3OoF6CunTTkiMhyAkWn3ZyZm37pcSg+TNHdb7wRjQGD89E7VeTpmY3553zBnRShQeyQDl9H8NcKrl5PhFJFoqOdXON9KM4N5a5vRiraxzq4jSI3UcFzqEFWa2rkNDnJUoZkh2Xd5c99XFCnFM3fOJl9T5rpl09aCW5mEMQNrE6axVTf5ieH2dxI2V2CXW4oZoG/Ly7CZEuEmx19QW4gs4SEAiUQ+toxhf8eH+oWG+qgR7Ss91kwkesnMus3stgherg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cWsJacAg36lJfm3XFi9oRwAEs3NVCLe+9JXVNTBbNE=;
 b=aWiFftzjcqjN5tLPzDW9XGdrlEFEF4IOY6ag/8+I40HIxCGTxL4KyVOanW4OG5i91I5FL32Y+vsd8IaxMfJWonU5zFwfxU/lB4z9WgDJ1TMDN7PwK4Y1ICKuJTg0V5ru4q+Evi+JLrwzRMxrf26Kq7v1FORmu8x6nyue0fLw9wzUR7R6C4uP8TH5jNidqXpMQh18bPC0Q5mDOiRSal6gylnIdZZ7J8Tg0vQoKLff6PZ6CAbd8lKlerf9TCTIB77ANYiocs2TSMcJFYt18aPukm8p6OdK8heBSnf3sIJnklJZXLa2iIYeGn6qGvydnCC3Wk+/fJEjV74EVM0Bngfo6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cWsJacAg36lJfm3XFi9oRwAEs3NVCLe+9JXVNTBbNE=;
 b=GzPA+yKhH3DUvml+y0yy3hIyAKNsop2pLExp1fbL/AardGxAStiES6iK/rZ6Mkbh7RPWKttx1E3TlWCzr6hFsQVa90L5RJ8UEtGzvKzCTjzbkB2TImOLE64ygCWcpJaZrto0x8fi4QBiNJcBkX7mhg13sifnu/BlcU1RMjgMVtE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5601.namprd11.prod.outlook.com (2603:10b6:303:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 00:15:05 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 00:15:05 +0000
Subject: Re: [PATCH 11/15] drm/i915/guc/slpc: Enable ARAT timer interrupt
To: Matthew Brost <matthew.brost@intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-12-vinay.belgaumkar@intel.com>
 <20210727154014.GA47916@DUT151-ICLU.fm.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <f40dc9c4-b3cd-94b2-1d2f-803916841a64@intel.com>
Date: Tue, 27 Jul 2021 17:15:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210727154014.GA47916@DUT151-ICLU.fm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:40::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Wed, 28 Jul 2021 00:15:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da6d8c36-ae92-4aac-ca82-08d9515cbfe5
X-MS-TrafficTypeDiagnostic: CO6PR11MB5601:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB560134FC4F42F1A49804D8A985EA9@CO6PR11MB5601.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XVfdmzIqoP4LOrlLALJyAWl2hbu9O9WooUgvD/9XRn3bN/Jg9KD+Ng1Lek3K2ZS8OMNNIHpSsJGjNyrRik5YmXJLVF8UVtiIOt+cH2raXGFjVoP+v/QiAhNkdrJ2nTDM/4xBVc0+wGVNqD4KPxpHfinIlNqs47T4lsliyn7UfVrTSiXErMq/6ioOzghCQkIdoimbO+xUcKXvosTtqlun21JpoQ71suolyB8zduFIvyEote3wdrMk/A+g6qPkN+J6LElMPJkXFl/swInXuquF6vUpcxiutx7oG2EoNsMV010NL3dFHqgvAKnMJhqHddzsIbTqMWU+xR3lLt61xJwxpy+pub5R8bfp1M9xnPX0fyeV8VeraQmOUV0kgdnNBUPGgIoorRxMrYCt8sGAqGWIDFtxGv0M2MUS3PjhCBSt+oRmF0gRXn7zphOLDcj6s3DaA5VXUOxCsEXS+p2POzFwNeu8fkKhSrxlwPCsukphJbvCflXZTdbv7FpaC/Le8bUZ4eSe5ClYkzCH20OniSp+W0fDNQQR4a0kM3iXvg3MZhNaYRc6EDIF+LT7KG65V9IjaZ2Jtn3m9FUAn6ERr2Fi6QZo/yjeTnRIntWe67okFiZHgZF0e/sNf3IKW2oqI9Vw4Xdnuh4CEYl3lpJH77g87yTrUCvq+nm3dnQgfBJceGDU4f+1n10L23KsAJHQcr3DJ2kougGw8BSu6N7Q6NMySp78oeHxb0FqLRrVNbVl0e0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(5660300002)(86362001)(83380400001)(38100700002)(26005)(53546011)(2906002)(4326008)(6636002)(8676002)(36756003)(186003)(66946007)(66476007)(6486002)(31686004)(478600001)(6862004)(66556008)(37006003)(450100002)(16576012)(8936002)(2616005)(316002)(31696002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFNENGVPRVdMbVFCejc1QWFjNXh1SXZLcUVBOGhONjdLSmtTdWpOU1FFcUpL?=
 =?utf-8?B?S0hIRlF6d0RkQXpYelFYSFJDYjYrQUVnOWg5UysvNU1pdDJvZjdCZXh2L3ZD?=
 =?utf-8?B?eGZ6cU15dlBCbWtjb1JJdTZnSTFYalUzeGhqRGtIV0k3SWZoL0g4eVI0Wi9H?=
 =?utf-8?B?RkhKWU9MTUJUdm1UYzg2U2JubmYzajZzaVhPdUZ4T3E1a0lGWThFWXJUREJM?=
 =?utf-8?B?ZkZsSFJtblRxend6RHREZjZ4YjUxYWJUR01TTmo3V2RUOGoybXFlSTZPVk5C?=
 =?utf-8?B?SW4ySTFqZ1dJbmxFVXR0STczcW1tY3EwdllEcWZNVzBmUFZ5SjNwSklJQ21B?=
 =?utf-8?B?alZhMFh6eDRCdzlVSFJFdEZqalI4dmlNVkpNY2xWMFFhMU83Znl0WVEvcjdx?=
 =?utf-8?B?V1dBYklkZTFBSUNXalpXWUdvTkJXdFpaTGFXdEJhOTZFSndKblVmWXlDTUwr?=
 =?utf-8?B?eStuL0hSWVp1dEM1NzBZNFVkSURFdzFGSXp4aVcraENZZjNVdXdHVGJ5ZzRC?=
 =?utf-8?B?NDJDbTR2dHZDbllDRXIyK1JyaEFDdTBMNkRKcG1ocFVNMG9oWFJteStpZTRx?=
 =?utf-8?B?ckxMcGhkOTBPUlo4aUtnOU8yRWd3WmUrak9pbWlsZEoxSEVXSklDOWkvNkNh?=
 =?utf-8?B?UlE2c1VNUUxibEVLbWVQcGZESlNVbHBJYURpNXpnSEZLMGFDcW9DaFRiZ21I?=
 =?utf-8?B?NjVqKzZkSjNMK2dweHVlMWRicVhRL0E0a0VqbTZsYkVsWG1WQnlsRTZvbDFR?=
 =?utf-8?B?RGNtM0lwbHRhYlNBUEUrcWpOVjFTaERIRDJhbU9LMFVEd1BXeXR6RXloTmht?=
 =?utf-8?B?VEExMWtZVjc3dzBMZUZPdWlMYVdEb0U1MldmU0dwR0h2R05qL2N6M2s4U1BT?=
 =?utf-8?B?WjBYT2NyRlFhMCtyYUM1Q2pabS9iQzJBQzRtdlZWVFk5c05EUHplY3RyeXNU?=
 =?utf-8?B?NWdPREk3SHBMUzNPZnIwQXhtTy9Icmp6UlhFdFhRdkY5ZG94Z3Z2VWpkU0Ro?=
 =?utf-8?B?M2ZrUzhacVM1UWlHNEZKUUJYeVhJdGFpTzlvKzlsd3pXZzNiSEVUSEMzRTB3?=
 =?utf-8?B?cDU0WTcyeFFjMDBvc1BEQUJ6YWVBOFdIVFQ1ZmRJUmpTKzBjQm0vTTl4ekhB?=
 =?utf-8?B?b1hnU0ZLb3k1QU1OOHVZanFHeWlsUHh6VCtqOXN0QnBrOElRcUQ4dkIzRlh4?=
 =?utf-8?B?Tko0VlgwWXdQODhYMUM0bzA4VkZFMTg5QUM3STZzYlpsdURodUl0dmtxWDF4?=
 =?utf-8?B?ZjVFRGtHeDAvbXc4alFVWGdabkJ4UE1veVNxb29Qd0UrNmFUZGZGWVFCZnhp?=
 =?utf-8?B?NjJZU2M5cDBuRVRCeTdPYWswQi8zQy9lSDJDZHhYd3NXWmRpVEdLZjJGTkFx?=
 =?utf-8?B?Y0RzRUVaTHB2OHF3ZDc5bG4vUWpXbE9nL1dROWhHNGg1N1ZqN0xta1grdi9N?=
 =?utf-8?B?eVdnbzhFOTJEUGxLR2ZRblRMaXRnOHJFWHFJVkhLbG5mYWZNZC84UDZJbng4?=
 =?utf-8?B?QWpNcXhXOTdvQWt6NkJPZ2JpekM0RktEc3BhOHdhS0V0MktVMlJ3NkRqQytu?=
 =?utf-8?B?dUY3Q2RuWjZONlRLang4cTRsTTkxUVdvZGREM1lTa2MzbzIxRHE0eVgzaDh2?=
 =?utf-8?B?OW1rbm1LZGlXL0VqS3lNdWtoT090OFplRVNSM1M3SitoTjVqOTEzcHgxQzZp?=
 =?utf-8?B?dW9Ka2xyT0J1NnQwQzFtUTZ1aHJsMEtJeGQ4UGk0QVdWSHN5ZUF4QzZLUHFU?=
 =?utf-8?Q?k/9x9EPutuXlHOAgqv8ddWSXXaNr9j9koHf2LoR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da6d8c36-ae92-4aac-ca82-08d9515cbfe5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 00:15:04.9219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cG94j4Q1516Z6Dbpo+P/xfjWR0vCpJs/KomhZzgnj7gsIKfXBHNg3SBBWHAxcFUcvba8sawlD+7aaZFiGHJcyWT22CTpqWaYri8n0pZ30zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5601
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2021 8:40 AM, Matthew Brost wrote:
> On Mon, Jul 26, 2021 at 12:07:56PM -0700, Vinay Belgaumkar wrote:
>> This interrupt is enabled during RPS initialization, and
>> now needs to be done by SLPC code. It allows ARAT timer
>> expiry interrupts to get forwarded to GuC.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 16 ++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  8 ++++++++
>>   3 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 995d3d4807a3..c79dba60b2e6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -392,6 +392,20 @@ int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
>>   	return ret;
>>   }
>>   
>> +void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>> +{
>> +	u32 pm_intrmsk_mbz = 0;
>> +
>> +	/* Allow GuC to receive ARAT timer expiry event.
> 
> I've been berated for using comments like this this by other engineers.
> I personally don't care at all (nor does checkpatch) but if you want to
> avoid the wrath of others I'd change this to what I have below:
> 
> /*
>   * Allow GuC to receive ARAT timer expiry event.
>   * This interrupt register is setup by RPS code
>   * when host based Turbo is enabled.
>   */
> 
> Same goes for comment below of same style.
> 
> Either way, patch looks good to me. With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Fixed.
Thanks,
Vinay.
> 
>> +	 * This interrupt register is setup by RPS code
>> +	 * when host based Turbo is enabled.
>> +	 */
>> +	pm_intrmsk_mbz |= ARAT_EXPIRED_INTRMSK;
>> +
>> +	intel_uncore_rmw(gt->uncore,
>> +			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -439,6 +453,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   
>>   	slpc_query_task_state(slpc);
>>   
>> +	intel_guc_pm_intrmsk_enable(&i915->gt);
>> +
>>   	/* min and max frequency limits being used by SLPC */
>>   	drm_info(&i915->drm, "SLPC min freq: %u Mhz, max is %u Mhz\n",
>>   			slpc_decode_min_freq(slpc),
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index d133c8020c16..f128143cc1d8 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -9,6 +9,7 @@
>>   #include "intel_guc_submission.h"
>>   #include "intel_guc_slpc_types.h"
>>   
>> +struct intel_gt;
>>   struct drm_printer;
>>   
>>   static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
>> @@ -35,5 +36,6 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>>   int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>>   int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
>> +void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index b98c14f8c229..9238bc076605 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -652,6 +652,7 @@ void intel_uc_suspend(struct intel_uc *uc)
>>   static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>>   {
>>   	struct intel_guc *guc = &uc->guc;
>> +	struct intel_gt *gt = guc_to_gt(guc);
>>   	int err;
>>   
>>   	if (!intel_guc_is_fw_running(guc))
>> @@ -663,6 +664,13 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>>   	if (enable_communication)
>>   		guc_enable_communication(guc);
>>   
>> +	/* If we are only resuming GuC communication but not reloading
>> +	 * GuC, we need to ensure the ARAT timer interrupt is enabled
>> +	 * again. In case of GuC reload, it is enabled during SLPC enable.
>> +	 */
>> +	if (enable_communication && intel_uc_uses_guc_slpc(uc))
>> +		intel_guc_pm_intrmsk_enable(gt);
>> +
>>   	err = intel_guc_resume(guc);
>>   	if (err) {
>>   		DRM_DEBUG_DRIVER("Failed to resume GuC, err=%d", err);
>> -- 
>> 2.25.0
>>
