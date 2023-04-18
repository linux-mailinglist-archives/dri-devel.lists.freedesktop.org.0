Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0816E5911
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 08:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253C810E683;
	Tue, 18 Apr 2023 06:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD4C10E66C;
 Tue, 18 Apr 2023 06:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681797878; x=1713333878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lRdkO9JXVS3Rrx76VWA+GS1oMiSd2mRy6IMXxky5Thc=;
 b=AHvSXgZJ73b3ssLQgY7w3IFYW/xyRtRWPz5pbqw0sIMM0IY4nwik9ar8
 t+y9pAGC83A6g00+sVxO67oqexOiyj4FKm1dcCrIrM+461akQP4sgVIq2
 z9eNGdXRUnF++2Vg3JhWUYSuGveMIOO3Nj0h6EiNuGZuKUsQV1lz9t8CC
 i6pSvDGJ1V7/bpHZUS3FQK2fXvZBVBV5ovhut7qeBP85OO7QkNX6y/20z
 vENUhX0tbdHkIt0Hcoi88YSFz+sO0S6Yn5B6NlQLdGxAuJptLkLFBqsJS
 GwEnTTw6gWwYLVC9EGtEqMB/Vbz5SttAON8iPf7Jmdq16mDh+VCXG1NTW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="325424662"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="325424662"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 23:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="693508646"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="693508646"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 17 Apr 2023 23:04:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 23:04:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 23:04:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 23:04:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 23:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdC5QFGxTRPIU7YH7FSamQZwNh+uBAdTfyqt8HNU46YM5gF1sllS8Bd1zBZZwgiK1JGe9gFA7FruiK/AEYGBGKu3TyqXO+tcpYuBEAoRBvdG75dALI3sgsF64bF1KmwPHLY9rpdVuHWRv7u9VL/STNwvi8JDeUDO8gC/x8oOLVhj0o8DqeOb/7ACFhYVJw7kFtOkvXGAlG64KlK7mE5uf2FwX8fj4tGKhxkPNbUpEiNFecffLbRcDQUdgPmJudAQXMJImBY/9B1zwRmvwNnttqE7tawxm6jei4Y8x07HXqhwvMib2dFrnIWRhOESjFFFPh/tumSNm07Wrb9+zaQjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA+eMTJQn8VgBv4LggxNmrinT0ThPOY3Hci/7N7isIo=;
 b=TvQmp6COuf76P0h+mUCeOIt0dM13rT6FsaSfwa1LxKD8uOj0TsDYjqx0hUktUzZsMH5yuyW5T/NShrogLOzGAVqBwm5eOrB3Nm03BTImp1OEGE/dUxmjEUmYtMSSgRhMFeDRBHTkp6seqg+TQf0ATKORe6+B2iiL2k0fyWUY6pNpwRluADFjcAbMYRZFqNY0Q4ocl9WXm6qmLCYjworiFnc9f+ZZmjE3k1YcYCvzOesWm36y2T1P2o6QVz4f/IMIshXUbTjKJRG9TvlBCr6VHdwbHCSUbptB3qjUWAZ1Y06E7MUKCoLTGMvjlCiFBccZF+J1vLp1Y6UDiHxHNBGGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 06:04:34 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2988:48c2:4dd7:decd]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2988:48c2:4dd7:decd%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 06:04:34 +0000
Message-ID: <1b1a439b-d5ec-5079-ba35-846cae91e776@intel.com>
Date: Mon, 17 Apr 2023 23:04:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Provide sysfs for
 efficient freq
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230418000915.3489494-1-vinay.belgaumkar@intel.com>
 <ZD306iP1tDnekIn0@ashyti-mobl2.lan>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZD306iP1tDnekIn0@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:180::27) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|PH0PR11MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 065ef339-0136-4537-0835-08db3fd2c82c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73CZj0OB3wtV229EOXM7lk05i9Yzt6d4W4OPhAia3VC4CM7BxZnztqPs1DgX5yDnpAhsRUnAeK1GKXijiNEeITGIq9kiredW9lMsgw+F0/Zt5qxQfYn8G3kuuh6yf7eQhIMcvI83LTHysVa7OXGxBxI2JU0D42Vx3qA07ERavzGbzUTMJu2kDCiifV1KVAjAyouEosYB7dVOFTZqReDQDHfyuTW82FBiYIg1rxLepyoNNxM2H7lKAs1yyC3FLTLbz+3Q5eQeoaS/73oGtdnqYSr20T8Se3X9zlZfYMYgRK1/x82OLFFM4OyDIg5tJZ0vFi+P/eYa0rFrDnBKH9i2Hz0EhsGgGkzF37dhVgeeN6rsypB01WhfaIfxoNLyFehf2jGdHJNwnLKkAJUbQZXYPgQSXcxMJqIqmaXRfrzJH90i3yDDc+IGu+/lnghpsZRlYr97t/AETjRyelBMdUc25XdQmn41TKYzB3QyISsjtC2FGo2A9JQ9lAw9s2bui1XVjaC4Hin/goNboJ+/RkXuxCPmVar6MLjIyqCvWZrHB2Gt9vxNs/9NjLKOBX2PpQXM33thlPLiN/tUBSx9D4sNPRMpUjffJ4ftHCSA4TL6IWm2n3JQan+zcPWLDbXt6g8b94C9+5XB9dO8ZmiYIImVow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199021)(2616005)(53546011)(6512007)(6506007)(26005)(31686004)(478600001)(66556008)(66946007)(66476007)(83380400001)(316002)(82960400001)(6486002)(6666004)(186003)(4326008)(6916009)(8936002)(8676002)(41300700001)(5660300002)(2906002)(36756003)(31696002)(38100700002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZFWGFxMGIxM2lhazlGVnZReUprNXJuOUp2WmRDbUZaZjNHSzdtN293V2Rt?=
 =?utf-8?B?UGdGTkFOMjZUSVZRUVhpY0p6UW01amRSR1pVVnNkWThCelhzZERlNUViWi95?=
 =?utf-8?B?d2t6S2lFRUJ0WWpMV085RWFzV0ZmVFhOZTMvUGJobzJJVU1VVmJuL1RhUXpx?=
 =?utf-8?B?UXl6ZmgrVHdkVkNWakRaTS9CZE5kcWEzOTE0MlkzUklUc01ZOW9SVWtjdjhX?=
 =?utf-8?B?aHZudDlkUFZ5T3N5cWNuRGpnalU1UkNUeHcwV0J2NUpibjNIL2oxZlJxeUpm?=
 =?utf-8?B?SUhOSml6b0Q2ZXF1UTJyeXJuVERlZEJCTFJ3b3J3SEswUXRyb0J2Ny9GTW9s?=
 =?utf-8?B?SSt2VHB1bVdnYlFsaFArdDZ3cExtUlBUbXFOMTJGdFFiOTJwRFlHMnB6S0pP?=
 =?utf-8?B?eEJOQzdsNVZWYTZOUHBoaFNab21lZVNOMHRCSDlVUDUwaFI2dkFzeVBxTlBh?=
 =?utf-8?B?WEF5Rjg5d3hGaGRWN0RhSEdKQlpKcFovL2xUbk40MVNxcjdxQ2xnd2l0MzJV?=
 =?utf-8?B?TS8wNzNRZ0FNYjhQRjBqVHA0bUx2eGExS2FWSytPRHYxR0xUUjJwYTVPNGd3?=
 =?utf-8?B?ZmJuNkhscytnaFEvRE1zcjVFRFBwWFluREtBNEhhaFFXTnZTWkk0MEU5Y0ZK?=
 =?utf-8?B?a1NydmJuaC8rVnkyNElWN0I1TlFPRy9Gb05zY05VejZnYjBOMTk0VDdaL0pL?=
 =?utf-8?B?akF4cUJ3NWNWV282cTNXM1crcUl6Y2NodTVEYzdmZ0wybXc5cjdRNGxPMzNj?=
 =?utf-8?B?WHlGbjFSSisvQ1gzQ2NSMEdxSXZjaVRyRWluZWI2MGpBSmR2QzJyelRLRWhE?=
 =?utf-8?B?bmRCQ0RrSlNQMkZNb2ZkY3NwVGRQVnBRa01DeDdiQXUrMGh6SDZURmE4OXFX?=
 =?utf-8?B?blhsemF0blhqQ3UwTWRNditsbUcrcHNuQUNUVXFKQ1hQVFY2YkhSMmd4WWZY?=
 =?utf-8?B?SDUxNjRaQlcvS0tMeUYrWGFKSEtBc042VHA0ZzVHVXNtZEN4a3VHOWRqQXR4?=
 =?utf-8?B?dUQ5L1Q4ekJPRnJaNlRlNnlCZ05aYVQydFZZYVcxT3NmSXJhbWRWRDMxMEpY?=
 =?utf-8?B?aEdaeVJsN3l4bVpxK0RpRFJKY0lKVmdIdWhYTVlpUVVhK3hnRTNkaE5MbmRE?=
 =?utf-8?B?cElYTkZDcC9UZUNxTVdVUEFlenFpb1UyNEhsbE9OQXYxQSt5TTNJL3hVQWl6?=
 =?utf-8?B?bjNaQ0QxanBtUXFyZCtmYlB4RmNBakpzbDNaemxXemtoaTJ0bEpXU09pTHRv?=
 =?utf-8?B?YkY3dHZ4RlhKYWJWYVZnTGNNQXdvSDd4MFpock1SaVgxM2VTTlBVYVpLMFJ4?=
 =?utf-8?B?ejFBVmt1L3YzOE5SV2hMdjVHeitaN1BYaS82OXZVSEdkZXVaMWZVdHo5ZHpD?=
 =?utf-8?B?ZCtzUndraUpQL2gyK1lhaFplM0JWTGJSMDgwYnJGSFpPU1FmeHFaMmpWRk44?=
 =?utf-8?B?M0JiWndmQUlqbUxhbVExY2dmbm02US9RVms4Yy80dHdRY2RTbi9CQTE1T1pC?=
 =?utf-8?B?OEtkQlRqRlpKSE1RaVJVeDhEVTI1NDRKTElhaVNSdVVJeVdGUmE3QXhSNVl2?=
 =?utf-8?B?Z0t2THVLdWZ5SC8xaFRLOTMrRkdMSldZc2FZNDltYTQ0WHovYW82YkowSHJ6?=
 =?utf-8?B?WW9FTm90eEhUR2UvMGNSOGNJYjhlKzE5eTdBVzZLUVZGQ0xSMmlBMkJGdXAr?=
 =?utf-8?B?VXZWelA0c0swOVBhYjVTTnZ4T1MzODl2MkI1ZXRVQmRFMU82UnlJMEtwd2Qv?=
 =?utf-8?B?OEVIcHRXL1hTRnU2bWgwSXFtdkdNMDlhZGFKQmpFa0R3enZmWDd1dE1qdmFt?=
 =?utf-8?B?RTJsTWVaT1R5WnA2NXZ6ZTYxWE5tR2cyb3I1TUhzSHF0eGhwcVd2SGRNb2ln?=
 =?utf-8?B?NVlieS9SOXhzUU0wejJGbDhTcCtlZ0FJanB3ZU9jQUplRmlhbDhEMjVLZjNz?=
 =?utf-8?B?TCsvdjgzQXQwSVBkakRodHdndnNsOU50cHNFK1Yza3pQMURkanZxUEQvVkpV?=
 =?utf-8?B?bFVTWDVxdnhSU0xGREV6Tk1QaElpMFJoQ08vM2JVcFRCbFVxbVNiVUhrcTht?=
 =?utf-8?B?WTdaRE52V1d5VGFCOTJEMXQvTzQ1S1NsRVVsbzg4QVJPQWo2RWlSZ0wwd2JT?=
 =?utf-8?B?SW9HVWJaK2RsQjVxOHAvY1Z0MXBiWE1uWXpSbHk2UlBLZ3piYjJITnErRUhr?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 065ef339-0136-4537-0835-08db3fd2c82c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 06:04:34.0745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZR7Sy/SgRmliPHbNM7vEvbsgkkaCcSSF/pcRseJVInbT+nujBcG8PC0EX+7M/5Gxn36/NvNLmwltV6BwVyqjmH/cfQW/OvIDapBEd+F1hP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
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


On 4/17/2023 6:39 PM, Andi Shyti wrote:
> Hi Vinay,
>
> Looks good, just few minor comments below,
>
> [...]
>
>> @@ -267,13 +267,11 @@ static int run_test(struct intel_gt *gt, int test_type)
>>   	}
>>   
>>   	/*
>> -	 * Set min frequency to RPn so that we can test the whole
>> -	 * range of RPn-RP0. This also turns off efficient freq
>> -	 * usage and makes results more predictable.
>> +	 * Turn off efficient freq so RPn/RP0 ranges are obeyed
>>   	 */
>> -	err = slpc_set_min_freq(slpc, slpc->min_freq);
>> +	err = intel_guc_slpc_set_ignore_eff_freq(slpc, true);
>>   	if (err) {
>> -		pr_err("Unable to update min freq!");
>> +		pr_err("Unable to turn off efficient freq!");
> drm_err()? or gt_err()? As we are here we can use a proper
> printing.
>
> How is this change related to the scope of this patch?
The selftest was relying on setting min freq < RP1 to disable efficient 
freq, now that we have an interface, the test should use that (former 
method will not work). Should this be a separate patch?
>
>>   		return err;
>>   	}
>>   
>> @@ -358,9 +356,10 @@ static int run_test(struct intel_gt *gt, int test_type)
>>   			break;
>>   	}
>>   
>> -	/* Restore min/max frequencies */
>> -	slpc_set_max_freq(slpc, slpc_max_freq);
>> +	/* Restore min/max frequencies and efficient flag */
>>   	slpc_set_min_freq(slpc, slpc_min_freq);
>> +	slpc_set_max_freq(slpc, slpc_max_freq);
>> +	intel_guc_slpc_set_ignore_eff_freq(slpc, false);
> mmhhh... do we care here about the return value?
I guess we should, will add.
>
>>   
>>   	if (igt_flush_test(gt->i915))
>>   		err = -EIO;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 026d73855f36..b1b70ee3001b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -277,6 +277,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   
>>   	slpc->max_freq_softlimit = 0;
>>   	slpc->min_freq_softlimit = 0;
>> +	slpc->ignore_eff_freq = false;
>>   	slpc->min_is_rpmax = false;
>>   
>>   	slpc->boost_freq = 0;
>> @@ -457,6 +458,31 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>>   	return ret;
>>   }
>>   
>> +int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	intel_wakeref_t wakeref;
>> +	int ret = 0;
> no need to initialize ret here.
ok.
>
>> +
>> +	mutex_lock(&slpc->lock);
>> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>> +
>> +	ret = slpc_set_param(slpc,
>> +			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> +			     val);
>> +	if (ret) {
>> +		guc_probe_error(slpc_to_guc(slpc), "Failed to set efficient freq(%d): %pe\n",
>> +				val, ERR_PTR(ret));
>> +		goto out;
>> +	}
>> +
>> +	slpc->ignore_eff_freq = val;
> nit that you can ignore: if you put this under else and save
> brackets and a goto.

ok.

Thanks,

Vinay.

>
> Andi
