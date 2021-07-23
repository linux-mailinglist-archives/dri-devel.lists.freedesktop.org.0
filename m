Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF83D4109
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77066E9A9;
	Fri, 23 Jul 2021 19:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B49B6E9A9;
 Fri, 23 Jul 2021 19:43:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="297513033"
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="297513033"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 12:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="434208216"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 23 Jul 2021 12:43:48 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 12:43:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 12:43:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 12:43:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQZujSnhz1d1o1qKsURFzsFW7TFBfQkhgl8xfJ3N9IUqEXgdC5sShmAreMFAo7WK4sDTmXFOIaWh1gHmesxlKTYBLFKRK7BSbuD0ukW0BFYSg9VAk3nkaPqdml9FFZoWiCwkjQ85ANkKRBhccG+3WgKk2Ci10f/JcBIdE2my614ADKtW1MZ77ieLV2WrE3UbvTghKcSPgFuXkS9A6HczCS+gyuzW9p18bJGplAGEXnp6guVqn4gWvOiDJTyLbukt6uDrnjZURjZntR/utdYs7gKttYjyRrWAQ5FFQp5v4BvSnBSksbyM+neI0w49sPhWMCk6FgiHfKBj+WYDmu/M8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iEygOqkQDbNjmOecm+CHN6fN7qfEuaDFSu1KmyJC5w=;
 b=Fbs5+A6zJrdYL4QD23ycUW4K+74GRSTrs/mxYFo1P+MNzgbgTeO1DVtw0XC2/j1Z1Mb0iQcvw8fXChvqd518tfc7HdMaPW8ht5omrLfYwfd2X1//5FRlCgRKMjIzbmrMu62+cmKG1AXMThdAqsMWc18DzjUdYLLtr4Jy1uXc6ObDjx0l703kE+xMIXu5oS1epS/dYoOdNM/8VQHyl4RfWOQYnt6k6IW+U5XAjr5GbtqRUAS/odFmiefwMTfDl1qE7ePZ2BOz2VyWqOz8nDk7OzZs0I8OhFm3io5AXbDuQI5vEx+Hv77zOMLhqxnCalqUBgRKutOEA9pzmvlCsFohHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iEygOqkQDbNjmOecm+CHN6fN7qfEuaDFSu1KmyJC5w=;
 b=ioMimO6OIfUOA3GlqWS/Xe2ON+tst44g1mPOaexmvWdyHblEmiIIEAnvRaxHO/mYoyq4nkm7BE9rkehWxM5//wl88wHFThkwQmkg1A/2mxPDMNZiDjbNgD3H3DocpnJlgN/Rsop7xNRlDVXIhnvI5yfOv6Egiuwo7MDrPBFqXak=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5617.namprd11.prod.outlook.com (2603:10b6:5:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 23 Jul
 2021 19:43:46 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 19:43:46 +0000
Subject: Re: [PATCH 08/14] drm/i915/guc/slpc: Add get max/min freq hooks
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-9-vinay.belgaumkar@intel.com>
 <afb6ccc2-1abd-b507-cea0-e09dda1952b6@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <105fe19f-5ec4-3ba5-6771-ebb1dd2403b4@intel.com>
Date: Fri, 23 Jul 2021 12:43:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <afb6ccc2-1abd-b507-cea0-e09dda1952b6@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0381.namprd04.prod.outlook.com
 (2603:10b6:303:81::26) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MW4PR04CA0381.namprd04.prod.outlook.com (2603:10b6:303:81::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Fri, 23 Jul 2021 19:43:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 618a012a-8716-46f0-dce5-08d94e122f5f
X-MS-TrafficTypeDiagnostic: CO6PR11MB5617:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB561701D10979B79ABCE2559785E59@CO6PR11MB5617.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6gZAEaX/cCbBa5zLgKbPbUgLWA/5eGAcS4xmDSeI/cOX1tzAxCIn0kyxyv70TDz5zFGy01DftLobx7L/mQbIyskC0Q59PxQ23MEa7pWEmR6IFwWV8inTzTYucaR4GA4Y2Xgy7k7UP4D3oGmW+Iu9oQl/ahlGJljYgKcox6BSsZL7kRYgwY8k9cnMPBETXq+f4zqQWGp5gCpbzU2Gcn4TRqVXG9yqjF/tiAUhOYa9UMYTfcXNovTWQ5BkOZGMug90iVA7JVfkbYimgzktrXBXawF1oVuDS3Wbkum6Yy9W59qBFQve08n4rcSL+MOnCVEQ7tjYxxy1Hj32lhsPrvpsI8jaHHygcnQtkN3xHNlj/D+/1r7nklAXN+d4f+ekG4RuVpVBnqgdDzqFyAnqQiXzTBCPnRnY0URPt9Zqz7lmCP9uUQzdXXqaeforJFGEdAcizo++7mzPblgp8SRzdTwyqwF0eLwejjLSTwpeS2DwN8JDfLAoMX4p47wWsqYwC7g/GtZG7bgZCpbmmxIbOIG21Ky40pR1vWDmY22QiUxU4WKQ+U8f7O528al/oak1ZAh0D3qYgOKMreJU9tcClDfJaoUpTgG/Sf27kNCBNcRhKLyj9zfDWo4O7qK5DLYSLKwikJejO3w/U6tdxighz0uyBjArclOcpOcQM8wx89T9q7g86g6CVUl4mCFv53Ge6bLn0gG/y8rtJuJxyRcc02B3Uq3uMBp8Cza/pNi60MRqqrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(478600001)(956004)(53546011)(83380400001)(316002)(107886003)(16576012)(2616005)(5660300002)(31686004)(2906002)(36756003)(8936002)(4326008)(450100002)(6486002)(86362001)(8676002)(31696002)(66946007)(186003)(38100700002)(66556008)(66476007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU96b1BGUjBrTy9oMlZjdk1OcGl0cGRFbmcycXFYWDRZaWU0WU1BQTJGQVI0?=
 =?utf-8?B?cW5UQm5oS3lMZ0Myc094T1gyWlRIcXJhTGhNS3RocGhuZFdaYnZ0VzBGWHlT?=
 =?utf-8?B?Y1NJKzMxcXV5RnRveUdpZU1qakh6VXIwUWd0c24zRFNrQzU5OG1laFZWb1hC?=
 =?utf-8?B?SklqYVRMRDZWYUU4eHRkaHFwamplSXRSR2Yrbnlrdmc2TkU3L051TVVxQzBv?=
 =?utf-8?B?RE1tb1FjVHIrVjBhTDdyQWFsN1pDcDVvaXh2WTE5MG1pQVNISnh0QmIyZUhZ?=
 =?utf-8?B?NTFxQWs1Q2V0eTRrZUlscE9RbkRwZVh1azV4OGJnU0NaYUVWSVg1TmNXT0Nq?=
 =?utf-8?B?b3hQNTJjUWlMSXBkVlZQcW9MUll0Um0wZFdGL3MwMDM1Z0V0bGk5akIxL0VQ?=
 =?utf-8?B?WlB6U3lvclU4MG15S2VGU3FlbXdBa3lrSE91SzBFbEhERVVhMjlaWldSdHMv?=
 =?utf-8?B?cUFKSmdQamhtM0hMdFQzWXNIdmh1aTIxNStmMlpSVDlBVHBJb2lxTG5nZmph?=
 =?utf-8?B?YmJyb3pMRjA4WG0vUThzcHdzS1UxTmZZY0pqeG5uRWdOS0grL3NNWjI0YXlp?=
 =?utf-8?B?cWxiU2pwNlErMUZ4S1oyajhkYnJOQ1lzN040ZDlkWlNzRnhmbklQak9uTXA2?=
 =?utf-8?B?OUluS09CaTdKU0l4Z3BLVkxRbUgzdHhIR2hnS0tZY1hrY0hYUlk1clJmU2NG?=
 =?utf-8?B?QUpydXEzZXg4Ym1oQW9USWhVN2dsa2xNVnB2RlVQTjVTQXRFUlBYQWUyd0FL?=
 =?utf-8?B?elVNUXVodnZLdTVuRm1tUzZrUHcza3NqM29oaVFGd240K1N1VVZBMWI2ZTFX?=
 =?utf-8?B?a2c4Q2JjeVY2NTdCdVRrNUk5b2pqUnR0UkxjMTR5aGxzSGptbFcyeVFMWmxv?=
 =?utf-8?B?VmZtK1k1RU41bU1vaVlOaXQ4cFkxWjF4a2hwUzhvdWJHTUhWQWd1dnR3T1Fs?=
 =?utf-8?B?b0JWb2k1WVZYbmllaGIyeURCR3F5VzM1MTA1WXduR20zeW1aYWR0SENrdnNm?=
 =?utf-8?B?Uko3SDlWM050akUyU0ROQTErclpMZ1M1eXUwaEtBRGJGQk1JK2IyOFJWK3c4?=
 =?utf-8?B?L1dMK3N2YW9YbWpBcVdiRW9qY3NFUmRmS2VudFIrb1lBYVVFZVA4WHk0cm9L?=
 =?utf-8?B?VmpqUmd4d2tVeWdETG5xd0pSVnVNUHkxV0ZVc0pMM1RHbE0zTEoyMDhPRTVN?=
 =?utf-8?B?TzRTZlZrT09pdmpUeFlBaEQ2ek5HTFkxRE1jYWJUMjIzQXIzMGRvSkpsSU9p?=
 =?utf-8?B?TURvbXlBSzJFYnkwWEs2dHNpNXdUb09DNzN5YUtVSFFwVzRPeW5QY0d3RVh4?=
 =?utf-8?B?WXQyVERGamtNNzhyWGZHNE1zMGRBY21INU1oRlYyV1RXZDhxRkVMQmc5TCtu?=
 =?utf-8?B?cXQyT3lUZXpDckZuTXgxQlBuejh1Y1pzbVIraEtYcHhHbVVGMXFxNHJzL2RR?=
 =?utf-8?B?NklIWnc4L2VEUmdXVExxQnVESzRka1VVSTl1MWlVUTNUYW9SV1U3WVhxTG5t?=
 =?utf-8?B?dFpYTHIrY0dzMUEyd3NZSWtHVTlvTWE2N2hsSytubU85N2xIcko5a09vV3dS?=
 =?utf-8?B?dHFCNm9GQWtPSHpJMmxGTW4zV1VITXJENlBOQklDYm83SSt4TUhLTklzSjkv?=
 =?utf-8?B?bkEyRGlUZEtBa3lrM0RzTmIyYjJTWjdtMkRRTml3TWJMUVZJWmFkNkJvNVhX?=
 =?utf-8?B?YUlTbWZST2kxT3FSOWZFNW5aRURvbzhWeHpqUlI4QVlsakN4VVhIUFh4Mi9Y?=
 =?utf-8?Q?X49kzZxmkwTtDeWTmPJ/yq/Rbv9CZKQ3GZIraL1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 618a012a-8716-46f0-dce5-08d94e122f5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:43:46.1911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUwPAAFoHXAxM6tQCLoRqB8JSTz/XGiDVCAj0MF7KD4YnhwKJpIeMPArHrATBhftHgFWfBaAYn1HBXmtkXTIy1lYnD2XU8f45HT0lPqomzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5617
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
Cc: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/21/2021 11:00 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> Add helpers to read the min/max frequency being used
>> by SLPC. This is done by send a H2G command which forces
>> SLPC to update the shared data struct which can then be
>> read.
> 
> add note that functions will be used later

ok.

> 
>>
>> v2: Address review comments (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 52 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index b40c39ba4049..c1cf8d46e360 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -290,6 +290,32 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * intel_guc_slpc_get_max_freq() - Get max frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: pointer to val which will hold max frequency (MHz)
>> + *
>> + * This function will invoke GuC SLPC action to read the max frequency
>> + * limit for unslice.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>> +{
>> +	intel_wakeref_t wakeref;
>> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
>> +	int ret = 0;
> 
> struct drm_i915_private *i915 = slpc_to_i915(slpc);
> intel_wakeref_t wakeref;
> int ret = 0;
> 
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		/* Force GuC to update task data */
>> +		slpc_query_task_state(slpc);
> 
> what if this call fails ?

saving error in ret.

> 
>> +
>> +		*val = slpc_decode_max_freq(slpc);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -322,6 +348,32 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * intel_guc_slpc_get_min_freq() - Get min frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: pointer to val which will hold min frequency (MHz)
>> + *
>> + * This function will invoke GuC SLPC action to read the min frequency
>> + * limit for unslice.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
>> +{
>> +	intel_wakeref_t wakeref;
>> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
>> +	int ret = 0;
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		/* Force GuC to update task data */
>> +		slpc_query_task_state(slpc);
> 
> same here

Populated ret with return code.

Thanks,
Vinay.
> 
> Michal
> 
>> +
>> +		*val = slpc_decode_min_freq(slpc);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index 3a1a7eaafc12..627c71a95777 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -32,5 +32,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>>   
>>   #endif
>>
