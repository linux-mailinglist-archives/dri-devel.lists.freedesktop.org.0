Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7722E5E5BDC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F0510E427;
	Thu, 22 Sep 2022 07:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A8210E3AF;
 Thu, 22 Sep 2022 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663830551; x=1695366551;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/M+sWG9fWfLL07EfHm+gtTGEgO9BnGL4ksuKwBQiqQE=;
 b=TdmNWQC00CE7b996bIT25wYGR+sxJjzhGKhdgGf6fZNig7G0FGOnTi77
 qLSa/eN+/iPx/oEo5cSa+0TJ+05wiK8kWgBV06c0/y6qp5KhgbgKtqzAa
 l1j0Jy/VeFBdbarowgi8h+meCtTQmYx1WKITUwDOQewRT/gbTlIq8au67
 +3hirC+niQVuoR2qSrXkAHEpJk0UZJi/P7LIz68Tphn+wHRhLKAp19LMW
 9F/+kWkPPjjJLVZW1LR4svyXDH3pZz0WN77W1I8ffy1X/5u5XIcOmxyyY
 85Il09IdUGoWIsazlIYx7UzVGJU2ZmI0OHeJW04AfPioqMwUaU5M8mPJq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="280590177"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="280590177"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 00:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="650404667"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 22 Sep 2022 00:09:02 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 00:09:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 00:08:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 00:08:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 00:08:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rdjm+VIIBQGY0RJajd0XcpmN8gmRzXV3ANCjvEwFvfd+kiBuBLOjKzStUf21AqrKvFoGNvkDQ+iU3VBXAKDI73nM3w5GdKnPF3bjleGm3MGwHP2C4IsLCkbe/qq5u8I3HYZFpCqyZmriDp4qCPYe8UBVHPaH+HdINhpSdrwV4OBzqT0s1z9K/vIyLqtSfnmndFHBeI+80oOgNx7BIt32QOv5066tDY8GraBWC+kZJlli+xYzqcCfP6xNNKbkGPNiyIDr/kkl6z02uOeChXl1hun8DIpRfuMQFuLHTxpPFQcKK56jceNCbP3oSSi0Mqv6r1V3B8gp53eLfVQiv1H4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT7Y+4X8WxLTSHnGn6c2BPvf8/FSyLAd++vK02uTUXk=;
 b=L1rJ360ARmuBgMQIghzxvctIrRjpR3Dx8Jhwkku2xtkIt38FPoXn3c/q9DuKqeoANoLrZNGP4sF22yvwa4D9RCC5/ueJZgngwsGFbJPOsrz0teTBTat7dD11BnCDGLGdlh+sQUZuDf+wc/qOZ/URA2VWKUBc5D5pn247RhStqdtm7UUjAOCyQh6VfoRSi01Q/12WRySl7PL4k5+njhnLlBzQpZ+W4E5T9eHNGh1J9jPlhIs6pHxMc9/RTniP5hYTyO6Gy2iaeMVgYk/chyxghg+dQl1NPphwH47Y1MuueRLpRa6rP3IKz1X7XEEssWnkU/WfwRhMXLbyWGjJBsBn8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB6309.namprd11.prod.outlook.com (2603:10b6:8:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Thu, 22 Sep
 2022 07:08:57 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe%4]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 07:08:57 +0000
Message-ID: <c5c19826-2163-e473-24b6-5ff90ee07c33@intel.com>
Date: Thu, 22 Sep 2022 12:38:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP setting
Content-Language: en-US
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-4-badal.nilawar@intel.com>
 <b120c201-d4c4-c9af-26bd-432df71b84ac@intel.com>
 <393a7b54-d179-f9b4-e377-ed2c3c8de000@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <393a7b54-d179-f9b4-e377-ed2c3c8de000@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::10) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|DM4PR11MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: a908d31d-58ca-4620-fd7b-08da9c6950fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FoXTrKECpIXOiF0XtAlpGq0FRKdTkN91xZexyykoSmvvjm5JQT/FrJeJZpleD0lEVkFCrZ5x1NTRFPr6YcNQObaCKRGpFdAcszZBWUkNL2L4OQe8C4Y4n/3h88myYaJXuxrqUtNpTo01i23aLxaCMZpZTaqZvpdxL86RIQwBXaNMIqVHMSB3TPWGZC7tgkopLmUwAHztMo3BdzQ7clUQLC+glXWNuSKLDwyJGsmODVhxVZ4Q8MIeNNekh0K2KFmp8fu2E9et+1deJ3VJON3jihXcGv3c6AgRHTK9zDxo9ACrhJEPBrsFHwrn/eqCvhTTlNwJsFjDtX0+7xTF8JvgNlI9vWd/EGm+rZS9VtAQsS2uby8jSxUDU0VRENe18nOQ974cDSCPYl4L3tbZS1LwhDq3dawOJFljSSXwqPJ2wRRcKo8yMAkXII4UyJIAKYfbwBvFmULsTg4HOEe5SMtUL8iwTYFHu7lmYjIjGA9mpPMHyzsW48lEVUPbMMSm4zYBthgzLwvTHUOiunBYwVKZvSYF4eEyur4AzvP5Xd+49CMbsc9TAESqn7las44FHoPF0ZMsqE4tfWBREqbb9hcKLyrusYk+U1fPnOgcI2kqfPKp6iPRQtq1YTlWCH1HlAPayIJapk7yzb3MU6li+iBEcUFvLCbtWFF9WRioNW2GJjZPOTRG1KeMYVWjicU92jEI1582Ypqa/EiChV6aaEESjqIQp1TRCpWQx8C4tv2eQOy4Xmt0C0aMWh6FBbM2i197T7LZ27Xmj0nq/chHxweHSrEV5IMJt45wk7+w7TjvGaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199015)(316002)(82960400001)(83380400001)(31686004)(26005)(38100700002)(6506007)(186003)(2616005)(6512007)(2906002)(53546011)(55236004)(6666004)(8936002)(478600001)(6486002)(66556008)(86362001)(66946007)(41300700001)(31696002)(8676002)(4326008)(66476007)(36756003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTF3Yk1hMVltZGFWaDdBUzR2cTlJdnVDcW9MQS9rTkNZbGZBeDRaWnc4S2dK?=
 =?utf-8?B?enBMeXpId3BzaWI4UWZGQnBzRjdvNWVYcUlhZHVDWjg2Ujc0V2VDbDQxK0FQ?=
 =?utf-8?B?NUhzRVpmcWhtY1VBcGtsWWZwVlQ1U0tPWVZJUjdZVElzY3BzaWdQR3E0OFYv?=
 =?utf-8?B?eVRuSW9tQUU3bVdyNkFhN0VNZlB6eW1yNmxYSXpZdE1MSHJSQnJGY2JkQWRY?=
 =?utf-8?B?VERjMlpDNHc5TzhIWXc0cEtYRExNYVRCd05CMzJZdkdHY1oySGpzYURqZFk4?=
 =?utf-8?B?cUFNK3Jya2JvY0NrZlF3aUZRL1FmY21la1NPSVcvZ3V1eXBrV0N4WW9VR24z?=
 =?utf-8?B?UStUOWpsKzM1MXN1MWpTR3YyL2ZpWit0ZVRaajVvNHE5NStRUVhFV1orQ1p2?=
 =?utf-8?B?VHF6OUhvMk16TmJxcDI5NnBOQnlteDJZQXBmajBlcENXRFlRTlF4L01RYkJi?=
 =?utf-8?B?TGE2VnRvbHJxaUJnRHhhNklnaHRDQlJZVlRCQmQrdWVUNThEaUFXTG9Ncm5m?=
 =?utf-8?B?cFl1biswVHh5bjE3MUdBeEpzN2Fkcm5lM1lBbVRDYWp4bGJiWVJJdUtxeXZ5?=
 =?utf-8?B?UVZ5TDNmZWQ5ZXR0Tk9adEgrNFo3SmFmeGpJRS9taFRMaVRXbE5BMzlJNWgy?=
 =?utf-8?B?SzFIM0wvZTNxQ0trbElIMk94bEhzTDhORlZacmdNOVBWeXJLN2FkRzdZKzhp?=
 =?utf-8?B?bWVtZzlWRndZbU1CdlZqWS9ZeDNHRDYvbUViemlzTjA3N3ZOdzkreWVQNkFh?=
 =?utf-8?B?dzlLQnlTZHBZVG5MZnRBc2grenhpZjRsSEE0eDR3cXg3R0grSDcvNlNjVW5y?=
 =?utf-8?B?TVcyOWhra0dIRERoUW42SE8wS1NtU2V1NytNaG1raDllMDlab2kzZGRCQUZ4?=
 =?utf-8?B?aUI4cXlLclFMTkNLc1EwUXljTmtxMHRuT2lHRmVWakRHdllYdVFTdFBvaWts?=
 =?utf-8?B?TSsyTy9UMXorajNpNnhYaGcvbFJOa1RHbkE5TWdGSVJwWlBXMFZJaGRSTnJN?=
 =?utf-8?B?ZXozV21GZVNuZ3lpVDFYS0x3YWxBVmlsc1FVTzlqWTFNVzgyMTRxb29rWW1m?=
 =?utf-8?B?dEU5cExBckNTcFZ1UmlCWEkyMXFYRUVLRXIrR1dDT1NBSWNjQStxQWtlRXA5?=
 =?utf-8?B?eE94QWROb1pOVlFVZGhJRVhUbzVpdDd6VVNBWnJSeVBSWUpGUm9xVi9raFEw?=
 =?utf-8?B?c1ZFMjVNOFdmWFdQWHduMkUvNzA0TGVyMVh0T2Izcy9pVXAwYXJ2MWtkZXRr?=
 =?utf-8?B?b25HSGpnaWZ4cG9MWVZYM2hJdHlKSDEvYmZUK1YrcUk1R2R3RE5MeE83UjZT?=
 =?utf-8?B?ampPU09rZkt4alpXaUVERGd1OGNEREtpMEtCU3ZKNTJQYkMzZGVHa0VDdnpG?=
 =?utf-8?B?bTlhOU5PNzdxTkEvbTlmazNyaHdwZEN4M1Y4cnhnQ3Z1NFNyL0JkblFuL01G?=
 =?utf-8?B?TXhYREt3ckVxVHRNQklMcXkrN3hMTENNMjNwRXNEeGNsbFo4RC8zTjhkVlBE?=
 =?utf-8?B?cDVKSW9tS1Q2b3NSUmpjdDRXZ3d4VUJaSGp2VEpyb1E4WXRNdzhXeU9RRmNa?=
 =?utf-8?B?OUh0eThoM1BhS0R2YldJcEp4bGZiSHVURlpmaElMTWdDcmd3QkkzWHErdEMy?=
 =?utf-8?B?aTNvcHBOWDBlbFNnVWd0eDBCTDhjY201TlVRNkgrdGFPWEFDWDFMSmJMd0JZ?=
 =?utf-8?B?UmZGWGdQRGVSTFloT2xkMDVSTjVpYTE1VEhIYXh1MU5TUjN1T21DRzFheWhw?=
 =?utf-8?B?UVNCWUZzcTk2MDNoUUhGcUN2K2R3VHQ0WW5EN0xzWWVEMWRUbmlkdGI4bkRN?=
 =?utf-8?B?R2s0M1YvNzVuUEQ0cG9vaGRDMU5RUDJ0ZmRXaUNCSlhOTXVvckVWVjNhNmJD?=
 =?utf-8?B?UThUY01NQ0svRXNFK2pJT2EvWWFOaHVlRTNJZFlMZHVLVXVOWURwcFRiRy80?=
 =?utf-8?B?bHYySjV0UnlrczZBcStTc05PUFdqeHo5LytPSVdrWk44NElZbnlZRTV3eG5C?=
 =?utf-8?B?TzVwU0pGbmowTW91ZHZsb3NKSEJpWTNUekJrWm1mV2JCaW9DQ3FRaWdnUGFI?=
 =?utf-8?B?UVZMWm1BWXNETE9LaG9VUFRZSTNkbUkzYUFXZ3VVOXdDSVFyWGRBUXREaEU1?=
 =?utf-8?B?QXhHS2VuZGpSeFNlR2tzNDhKKzcrK2VOdWhpY1plZ2g3QlVGNGpmZlp0aWd1?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a908d31d-58ca-4620-fd7b-08da9c6950fd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 07:08:57.4417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/w1CRcUrd9MKTtaW4+gecwVIMgflVykEiM7ioJDfvtLPbWlTs9jPtEt0ph38sf2Dzv6sR4M7XLDBCsV7UHR9UlrTe/O8WzalitBqut3C/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6309
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
Cc: ashutosh.dixit@intel.com, jon.ewins@intel.com, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/21/2022 8:23 PM, Nilawar, Badal wrote:
> 
> 
> On 21-09-2022 17:15, Gupta, Anshuman wrote:
>>
>>
>> On 9/16/2022 8:30 PM, Badal Nilawar wrote:
>>> From: Dale B Stimson <dale.b.stimson@intel.com>
>>>
>>> Use i915 HWMON to display/modify dGfx power PL1 limit and TDP setting.
>>>
>>> v2:
>>>    - Fix review comments (Ashutosh)
>>>    - Do not restore power1_max upon module unload/load sequence
>>>      because on production systems modules are always loaded
>>>      and not unloaded/reloaded (Ashutosh)
>>>    - Fix review comments (Jani)
>>>    - Remove endianness conversion (Ashutosh)
>>> v3: Add power1_rated_max (Ashutosh)
>>> v4:
>>>    - Use macro HWMON_CHANNEL_INFO to define power channel (Guenter)
>>>    - Update the date and kernel version in Documentation (Badal)
>>> v5: Use hwm_ prefix for static functions (Ashutosh)
>>> v6:
>>>    - Fix review comments (Ashutosh)
>>>    - Update date, kernel version in documentation
>>>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  20 +++
>>>   drivers/gpu/drm/i915/i915_hwmon.c             | 158 +++++++++++++++++-
>>>   drivers/gpu/drm/i915/i915_reg.h               |   5 +
>>>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   6 +
>>>   4 files changed, 187 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon 
>>> b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>> index e2974f928e58..bc061238e35c 100644
>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>>> @@ -5,3 +5,23 @@ Contact:    dri-devel@lists.freedesktop.org
>>>   Description:    RO. Current Voltage in millivolt.
>>>           Only supported for particular Intel i915 graphics platforms.
>>> +
>>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_max
>>> +Date:        September 2022
>>> +KernelVersion:    6
>>> +Contact:    dri-devel@lists.freedesktop.org
>>> +Description:    RW. Card reactive sustained  (PL1/Tau) power limit 
>>> in microwatts.
>>> +
>>> +        The power controller will throttle the operating frequency
>>> +        if the power averaged over a window (typically seconds)
>>> +        exceeds this limit.
>>> +
>>> +        Only supported for particular Intel i915 graphics platforms.
>>> +
>>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_rated_max
>>> +Date:        September 2022
>>> +KernelVersion:    6
>>> +Contact:    dri-devel@lists.freedesktop.org
>>> +Description:    RO. Card default power limit (default TDP setting).
>>> +
>>> +        Only supported for particular Intel i915 graphics platforms.
>>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c 
>>> b/drivers/gpu/drm/i915/i915_hwmon.c
>>> index 45745afa5c5b..5183cf51a49b 100644
>>> --- a/drivers/gpu/drm/i915/i915_hwmon.c
>>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>>> @@ -16,11 +16,16 @@
>>>   /*
>>>    * SF_* - scale factors for particular quantities according to 
>>> hwmon spec.
>>>    * - voltage  - millivolts
>>> + * - power  - microwatts
>>>    */
>>>   #define SF_VOLTAGE    1000
>>> +#define SF_POWER    1000000
>>>   struct hwm_reg {
>>>       i915_reg_t gt_perf_status;
>>> +    i915_reg_t pkg_power_sku_unit;
>>> +    i915_reg_t pkg_power_sku;
>>> +    i915_reg_t pkg_rapl_limit;
>>>   };
>>>   struct hwm_drvdata {
>>> @@ -34,10 +39,68 @@ struct i915_hwmon {
>>>       struct hwm_drvdata ddat;
>>>       struct mutex hwmon_lock;        /* counter overflow logic and 
>>> rmw */
>>>       struct hwm_reg rg;
>>> +    int scl_shift_power;
>>>   };
>>> +static void
>>> +hwm_locked_with_pm_intel_uncore_rmw(struct hwm_drvdata *ddat,
>>> +                    i915_reg_t reg, u32 clear, u32 set)
>>> +{
>>> +    struct i915_hwmon *hwmon = ddat->hwmon;
>>> +    struct intel_uncore *uncore = ddat->uncore;
>>> +    intel_wakeref_t wakeref;
>>> +
>>> +    mutex_lock(&hwmon->hwmon_lock);
>>> +
>>> +    with_intel_runtime_pm(uncore->rpm, wakeref)
>>> +        intel_uncore_rmw(uncore, reg, clear, set);
>>> +
>>> +    mutex_unlock(&hwmon->hwmon_lock);
>>> +}
>>> +
>>> +/*
>>> + * This function's return type of u64 allows for the case where the 
>>> scaling
>>> + * of the field taken from the 32-bit register value might cause a 
>>> result to
>>> + * exceed 32 bits.
>>> + */
>>> +static u64
>>> +hwm_field_read_and_scale(struct hwm_drvdata *ddat, i915_reg_t rgadr,
>>> +             u32 field_msk, int nshift, u32 scale_factor)
>>> +{
>>> +    struct intel_uncore *uncore = ddat->uncore;
>>> +    intel_wakeref_t wakeref;
>>> +    u32 reg_value;
>>> +
>>> +    with_intel_runtime_pm(uncore->rpm, wakeref)
>>> +        reg_value = intel_uncore_read(uncore, rgadr);
>>> +
>>> +    reg_value = REG_FIELD_GET(field_msk, reg_value);
>>> +
>>> +    return mul_u64_u32_shr(reg_value, scale_factor, nshift);
>>> +}
>>> +
>>> +static void
>>> +hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
>>> +              u32 field_msk, int nshift,
>>> +              unsigned int scale_factor, long lval)
>>> +{
>>> +    u32 nval;
>>> +    u32 bits_to_clear;
>>> +    u32 bits_to_set;
>>> +
>>> +    /* Computation in 64-bits to avoid overflow. Round to nearest. */
>>> +    nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
>>> +
>>> +    bits_to_clear = field_msk;
>>> +    bits_to_set = FIELD_PREP(field_msk, nval);
>>> +
>>> +    hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
>>> +                        bits_to_clear, bits_to_set);
>>> +}
>>> +
>>>   static const struct hwmon_channel_info *hwm_info[] = {
>>>       HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>>> +    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>>>       NULL
>>>   };
>>> @@ -71,6 +134,64 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, 
>>> long *val)
>>>       }
>>>   }
>>> +static umode_t
>>> +hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int 
>>> chan)
>>> +{
>>> +    struct i915_hwmon *hwmon = ddat->hwmon;
>>> +
>>> +    switch (attr) {
>>> +    case hwmon_power_max:
>>> +        return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? 0664 
>>> : 0;
>>> +    case hwmon_power_rated_max:
>>> +        return i915_mmio_reg_valid(hwmon->rg.pkg_power_sku) ? 0444 : 0;
>>> +    default:
>>> +        return 0;
>>> +    }
>>> +}
>>> +
>>> +static int
>>> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>>> +{
>>> +    struct i915_hwmon *hwmon = ddat->hwmon;
>>> +
>>> +    switch (attr) {
>>> +    case hwmon_power_max:
>>> +        *val = hwm_field_read_and_scale(ddat,
>>> +                        hwmon->rg.pkg_rapl_limit,
>>> +                        PKG_PWR_LIM_1,
>>> +                        hwmon->scl_shift_power,
>>> +                        SF_POWER);
>>> +        return 0;
>>> +    case hwmon_power_rated_max:
>>> +        *val = hwm_field_read_and_scale(ddat,
>>> +                        hwmon->rg.pkg_power_sku,
>>> +                        PKG_PKG_TDP,It seems a dead code, 
>>> pkg_power_sky register in initialized with 
>> INVALID_MMMIO_REG, why are we exposing this, unless i am missing 
>> something ?
> Agree that for platforms considered in this series does not support 
> hwmon_power_rated_max. In fact hwm_power_is_visible will not allow to 
> create sysfs entry if pkg_power_sku is not supported. Considering future 
> dgfx platforms we didn't remove this entry. In future for supported 
> platforms we just need to assign valid register to pkg_power_sku.
AFAIU PACKAGE_POWER_SKU reg is valid for both DG1 and DG2 from BSpec:51862
So we need to define the register.
See once more comment below,
> 
> Regards,
> Badal
>> Br,
>> Anshuman.
>>> +                        hwmon->scl_shift_power,
>>> +                        SF_POWER);
>>> +        return 0;
>>> +    default:
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +}
>>> +
>>> +static int
/snip
>>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>>> b/drivers/gpu/drm/i915/i915_reg.h
>>> index 1a9bd829fc7e..55c35903adca 100644
>>> --- a/drivers/gpu/drm/i915/i915_reg.h
>>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>>> @@ -1807,6 +1807,11 @@
>>>   #define   POWER_LIMIT_1_MASK        REG_BIT(10)
>>>   #define   POWER_LIMIT_2_MASK        REG_BIT(11)
>>> +/*
>>> + * *_PACKAGE_POWER_SKU - SKU power and timing parameters.
>>> + */
>>> +#define   PKG_PKG_TDP            GENMASK_ULL(14, 0)
Define register above this definition, GENMASK should follow
by a register.
Br,
Anshuman.
>>> +
>>>   #define CHV_CLK_CTL1            _MMIO(0x101100)
>>>   #define VLV_CLK_CTL2            _MMIO(0x101104)
>>>   #define   CLK_CTL2_CZCOUNT_30NS_SHIFT    28
>>> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h 
>>> b/drivers/gpu/drm/i915/intel_mchbar_regs.h
>>> index ffc702b79579..b74df11977c6 100644
>>> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
>>> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
>>> @@ -189,6 +189,10 @@
>>>   #define  DG1_QCLK_RATIO_MASK            REG_GENMASK(9, 2)
>>>   #define  DG1_QCLK_REFERENCE            REG_BIT(10)
>>> +#define PCU_PACKAGE_POWER_SKU_UNIT _MMIO(MCHBAR_MIRROR_BASE_SNB + 
>>> 0x5938)
>>> +#define   PKG_PWR_UNIT                REG_GENMASK(3, 0)
>>> +#define   PKG_TIME_UNIT                REG_GENMASK(19, 16)
>>> +
>>>   #define GEN6_GT_PERF_STATUS            _MMIO(MCHBAR_MIRROR_BASE_SNB 
>>> + 0x5948)
>>>   #define GEN6_RP_STATE_LIMITS            
>>> _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
>>>   #define GEN6_RP_STATE_CAP            _MMIO(MCHBAR_MIRROR_BASE_SNB + 
>>> 0x5998)
>>> @@ -198,6 +202,8 @@
>>>   #define GEN10_FREQ_INFO_REC            _MMIO(MCHBAR_MIRROR_BASE_SNB 
>>> + 0x5ef0)
>>>   #define   RPE_MASK                REG_GENMASK(15, 8)
>>> +#define PCU_PACKAGE_RAPL_LIMIT _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>> +#define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>>>   /* snb MCH registers for priority tuning */
>>>   #define MCH_SSKPD                _MMIO(MCHBAR_MIRROR_BASE_SNB + 
>>> 0x5d10)
