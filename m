Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA23CC5E7
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A866EACB;
	Sat, 17 Jul 2021 19:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572516EAAC;
 Sat, 17 Jul 2021 19:30:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10048"; a="210941273"
X-IronPort-AV: E=Sophos;i="5.84,248,1620716400"; d="scan'208";a="210941273"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2021 12:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,248,1620716400"; d="scan'208";a="453260903"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 17 Jul 2021 12:30:09 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sat, 17 Jul 2021 12:30:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Sat, 17 Jul 2021 12:30:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Sat, 17 Jul 2021 12:30:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFJtkC4UJbvrWbY3qytI/ajXW/969feMjlU0DcigDojuJdCmgnngxanuNaY8EtwOYlgrZc9IfB9a6KAKKvucnwHgQ1Wcmn2NXVETp3Ql8X98LMBIvJacLKmhjL9sibb4bP+JcyCrDeIdHiw2S2vh/HgF2NB4sAZabmXsHoSbHWnavTIzlkJrT9LsoznCGWv52V5bh0+720UC2L0knCNAkGF0nVUnEW97kvjyUT5H1yfO7UI6QMCpKG4Mn+2urCCz6h45Qe1uXJb2yJZWtSzfSwa4pTFrjc1++INlFyJyrFAdMwfwcNm5/DxtNrJivpBT+HGYyv3uluOcB0N8pVI/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaVQX4u03AwWdU8c1QALa1mUN5VmDooX1hAz8RYPz8w=;
 b=KYsRJEkwBN0053D3wmUQlcVfAKh6X4o3EOt5F70tt4f10ejsGfMVJrXSxAFEXkn7ZjWmjvxJhh4YZc3PnGvuU75fAjmBnL4RfRKi3x1OHwGkPmKXePOCZ7Y6cRbmlti48/yMJN2X0vtfIJPnnJrYrYatzPcwwEIk3jFdCa3FxMnF5fw/+DcCf1YukppkUsT6I2mkCwRP/xptywqRFApmT7n1BOp7F7t2/FeUxL9X6ugXi9R4UgHPNIYxXqWMf08WZGPBsWKdD9TpKaEtHs2djCDlsJdbvOWJP0Bl0kaKNxYhLBgFzJA2eK7wATJLzFcA/SOOQIfpAZu9cJfIz/u/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaVQX4u03AwWdU8c1QALa1mUN5VmDooX1hAz8RYPz8w=;
 b=okz1ousjmZ79R5oYf3ZW5IrTYZxZ2zOF6wOn/zKf54cQiZfdMvkdumwNQGMWekdfKNAK/ab3BOsEJpjRY+68/3WSQ9kL9JmAVHlL+g9YJNyfeN+WouVcMVPk8SqiZur0n/D310lSR5nc0k5QUL/5qvUZZnCY5TTZ+tMp3Yphxiw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Sat, 17 Jul
 2021 19:30:07 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%8]) with mapi id 15.20.4331.030; Sat, 17 Jul 2021
 19:30:07 +0000
Subject: Re: [Intel-gfx] [PATCH 12/16] drm/i915/guc/slpc: Cache platform
 frequency limits for slpc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-13-vinay.belgaumkar@intel.com>
 <660d584d-b080-590a-9a4a-ea23cbcf023e@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <fc698214-67ec-779a-1c42-6821fcbb836b@intel.com>
Date: Sat, 17 Jul 2021 12:30:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <660d584d-b080-590a-9a4a-ea23cbcf023e@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0067.prod.exchangelabs.com (2603:10b6:a03:94::44)
 To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR01CA0067.prod.exchangelabs.com (2603:10b6:a03:94::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Sat, 17 Jul 2021 19:30:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5563a278-0525-4e23-6770-08d9495948f4
X-MS-TrafficTypeDiagnostic: CO6PR11MB5588:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB55886312095964932758CD4285109@CO6PR11MB5588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mdiqmtg1BbyOWKiNnWAJRiPzf9H/qLP2UA5FXWulRHcI5skzqPYrQak/taTJXZdTA2JmEKEWsrXWlfueCU4USlOqCBaNqxNd6RRqYJUaVv5tjR0ycXz5jA0hM7FC002qeYB7NOsf8UcrcI3OJu5uUFj5WVw1vR2uNqkovlrfkMbB79FboX9bLc1X8WdNveTY56TZ8LMIRNbxmBAWY7/YNGAfzjP+JdH5IwoyOVrUeXJX8o0kGFsQ/aZvj5zvx8baHezqTc6X35itYdMHKDVFzFT97e/q/7CHxNpKsxjDkStW0+n82vH8ny7EYP2fW1wYYIwEdXhFTpuNcSSJUChJqoDUikC4WQVvEXkBNGnkzA07FVz9EDN+Pmfle37n4qiL/OEy+YhHRynbXwcl8wykjQS0SaF7hcCmipQhFD5aFJc4nVOv2eKGQzIfyCqnkNuhnBcAHF2ZQkHNStg9e0FMLGQ0synLMjeMTw/AZtdCEP7EJKCtjVOiR9Pc/0fWRnDNq5BA6Qaz5XSvxIUBg2aJDq0XSWuKsknxqza/INOqCP4GBAREqlZcSkPBufWcz1LV72GQ33O04G7Kf1TFmsk85Vb7WzwPwg1ORBrWEkIzazD6TCf92TlSpe4tjs8FCEdTy2a1aeI5iWzz2nWsaorRZnR0SZFkTsfMr4XYQ3Si2olUOurpwf+oLIBWOjjGCE0TitR0TXbD7gPnIxzvrmk4Ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(2906002)(26005)(86362001)(186003)(6666004)(478600001)(66476007)(6486002)(31686004)(66556008)(66946007)(31696002)(16576012)(8676002)(38100700002)(316002)(36756003)(53546011)(83380400001)(8936002)(450100002)(956004)(2616005)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXJqS0JFdHh0ODJERUh1MEl5SkVyekFMbVNmVjlveVFOVHMxLzIyOWpTY0F4?=
 =?utf-8?B?b0hGYWJCRzZ0YVRrei9qbU45bXRta3VUajAxWUhEOEIrb3BpaUwxamlaa2N5?=
 =?utf-8?B?WVoySTBNb1lDOWlWYmtacVJwSjRFMkVVLy9yZmZDYWVtcVpJS1B4Nzh3WjB4?=
 =?utf-8?B?OUc5eE14WlVnOXNyUVZQQ1hjUEs3ZW4zanBGMHE4SHluTkUxd2F2UXUyMGtx?=
 =?utf-8?B?SVEyNEJTTXA2b0t0YUVPdmo2K0owYzg1V1ozZ1J3R2ZRb3djNVNXUnZWRUtT?=
 =?utf-8?B?Y0FqMXl1ay9ZWURHYnprMnJvN2l2MGRVYkhUQzRMU00zbnFXUlQ2VzUvemxS?=
 =?utf-8?B?d0pBTHl6UWJ5U3krbHprb0pLRDJHSjY4NFRaMEJvaGJmOEhtQmdkVGtKZkJ5?=
 =?utf-8?B?Z0lSNGRQOS81aG8xOExtLzNUTVA4RXRpN3graEQ3Q1k2TEgyWmJLQVJDS2RZ?=
 =?utf-8?B?WitLV0pZUmNmbTRHV1pydi9wU1RiejF1ZzRKUXhCVjJiMWtDS3FzWGtNQzA3?=
 =?utf-8?B?UDBLRmtyU1o2dDQzWHNEclRnUGwwci9JRFB0dzlhYVlyVzFlWTRlRFVubzBx?=
 =?utf-8?B?YkxUclgrZjVmbFhHZ3JubjhoNWlSQXlPYVJaZzUzc21hTExJTUdPc1Jkd2FH?=
 =?utf-8?B?THFKSHNwQS9OYlFJZkUrMWdZeGNYSkFYc3J2OUhpdFJDNFFzcEpjbmFhZHlX?=
 =?utf-8?B?UmtSNmF6ZlVzUzltTUhHbmZERU54eGdQaEY3bXNiSDdVZE84NW92eXIxdVND?=
 =?utf-8?B?Nk5pV2k4VmFPTnBxc3VJQlMzRVJ5MlVPdG1OSkFxR3M3TnVodktDLzhUTURF?=
 =?utf-8?B?M2F5a2dmcDAxVnVwUXFlM090Ykh2ekJqWWVwOXRGOEpJcWNEcmFCV0R1ZUtx?=
 =?utf-8?B?WFNLM0Y1azltK2tJNGpuYUFRYkZvRkRtazBmMS9lOUZSTGlZbHJ0b1cxc1VM?=
 =?utf-8?B?a1NGeGxjK1JIMWNaTFNiSi9nVW4zZWVKTmtPY1dhbEhTd1JMamF1dCtIQ2NL?=
 =?utf-8?B?RGg3VXhVNXNTM1B0dkEvV05QT3hGSG0yTndyZVpkSkkyZkRGUU1NcllOR255?=
 =?utf-8?B?eUdKUDZKZmYxMjhZamRSSTJGU2d0Mk9EanVQdm4vOFZFMmNTdFhvL0gvN1dq?=
 =?utf-8?B?MjQraEFlY1hGeGZEZk5IN04zTkxOejZGb1VzYWtoL0JQbDY1Q01WTTA2WTJk?=
 =?utf-8?B?c0xTN1EydUhMY1Bpcmw4cHh2NDBUYkFJNVlMTjVsVDAvaXdzM2JwdFdkOXNa?=
 =?utf-8?B?MXR1MXpUWWhYbU5rWWo5SHMxdVE1dEpuZ2VzZXJqMzhJVlhqQ2YvZ1ZucEx0?=
 =?utf-8?B?dVBycEJ3VzdNek8zZEhUa3NRK29EendZZ0x1dFhEUGQ5cVhtbFR4SVdJUlhI?=
 =?utf-8?B?bEhCOXJQNVFnLy9ETXNiQ0dheTBMU0lrNHZGYXI1RXZhOWJML08xMTV4Q1VL?=
 =?utf-8?B?SEtCY3p6MmpVWC9uQ1A5a0k4WktxdVI5MTIwL292VHc5TVdyZFlva1Awd3RL?=
 =?utf-8?B?dlNzbTl4QnV3TDFpTnRDeGtRKzV4WHM2OHdscSt6SzRYWDhycEtnRithQWdy?=
 =?utf-8?B?aHh1NGpqSWtYa2dBbTQ5Nmxub2xSRFdHYUhYR3RCM2FoV3R6OFpNSXdtSC92?=
 =?utf-8?B?a3VyV0xlQURKZ0cwa0dXbll6T3AyQnVYQldDNTlzOTVheWF6U3BpZHo2UWNZ?=
 =?utf-8?B?b1BFK3ZodEFyckYvb0REckRkc2NHMWp6bHRvS2ZudDdsejh2WjM3TW5hNWJM?=
 =?utf-8?Q?D7X3Ey/01weIuBoK7d0x2y15X87qjUKjAJYq/Ss?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5563a278-0525-4e23-6770-08d9495948f4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:30:07.5485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvW6n/s+JV3ZmpwzT7A4eVZK6ABpqgyXLBuM8cRwe3ENIb4NnShTJK4lm799R16glaZFRDOQHXNeBd4OIrf8hCVO3ZjcD/9FyZwhI9PtLGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
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



On 7/10/2021 11:15 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Cache rp0, rp1 and rpn platform limits into slpc structure
>> for range checking while setting min/max frequencies.
>>
>> Also add "soft" limits which keep track of frequency changes
>> made from userland. These are initially set to platform min
>> and max.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 41 +++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index d32274cd1db7..6e978f27b7a6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -86,6 +86,9 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>   		return err;
>>   	}
>>   
>> +	slpc->max_freq_softlimit = 0;
>> +	slpc->min_freq_softlimit = 0;
> 
> as mentioned earlier, now it is time to introduce these fields in .h

ok.

> 
>> +
>>   	return err;
>>   }
>>   
>> @@ -384,6 +387,29 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>>   			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
>>   }
>>   
>> +static int intel_guc_slpc_set_softlimits(struct intel_guc_slpc *slpc)
>> +{
>> +	int ret = 0;
>> +
>> +	/* Softlimits are initially equivalent to platform limits
>> +	 * unless they have deviated from defaults, in which case,
>> +	 * we retain the values and set min/max accordingly.
>> +	 */
>> +	if (!slpc->max_freq_softlimit)
>> +		slpc->max_freq_softlimit = slpc->rp0_freq;
>> +	else if (slpc->max_freq_softlimit != slpc->rp0_freq)
>> +		ret = intel_guc_slpc_set_max_freq(slpc,
>> +					slpc->max_freq_softlimit);
>> +
>> +	if (!slpc->min_freq_softlimit)
>> +		slpc->min_freq_softlimit = slpc->min_freq;
>> +	else if (slpc->min_freq_softlimit != slpc->min_freq)
>> +		ret = intel_guc_slpc_set_min_freq(slpc,
>> +					slpc->min_freq_softlimit);
>> +
>> +	return ret;
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -402,6 +428,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>   	struct slpc_shared_data *data;
>>   	int ret;
>> +	u32 rp_state_cap;
> 
> move up to keep "ret" last
done.

> 
>>   
>>   	GEM_BUG_ON(!slpc->vma);
>>   
>> @@ -445,6 +472,20 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   			DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
>>   				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER));
>>   
>> +	rp_state_cap = intel_uncore_read(i915->gt.uncore, GEN6_RP_STATE_CAP);
>> +
>> +	slpc->rp0_freq = ((rp_state_cap >> 0) & 0xff) * GT_FREQUENCY_MULTIPLIER;
>> +	slpc->min_freq = ((rp_state_cap >> 16) & 0xff) * GT_FREQUENCY_MULTIPLIER;
>> +	slpc->rp1_freq = ((rp_state_cap >> 8) & 0xff) * GT_FREQUENCY_MULTIPLIER;
> 
> we should have definitions for these bits and then we should be able to
> use REG_FIELD_GET

ok.

> 
>> +
>> +	if (intel_guc_slpc_set_softlimits(slpc))
>> +		drm_err(&i915->drm, "Unable to set softlimits");
> 
> missing \n
> maybe we can also print error ?

done.

> 
>> +
>> +	drm_info(&i915->drm,
>> +		 "Platform fused frequency values -  min: %u Mhz, max: %u Mhz",
> 
> missing \n
> double space before 'min'

done.

Thanks,
Vinay.
> 
> Michal
> 
>> +		 slpc->min_freq,
>> +		 slpc->rp0_freq);
>> +
>>   	return 0;
>>   }
>>   
>>
