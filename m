Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126045BFD76
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 14:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E112710E3FC;
	Wed, 21 Sep 2022 12:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD2810E3C3;
 Wed, 21 Sep 2022 12:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663761784; x=1695297784;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jUV7ZVrHlxNr/1m8FMY8oCyFrxPCig4CPYHNqhnnoR8=;
 b=HmrN2X5D6ciyedHmLs3TfBop+WAdQrmFrdpZYx5gvEL/9Xkiu2d+bZhN
 hjf/hTtk2cw7woemvppWNUcDiQgscEQPbvi15wPBB7dgmevfBtYqE+RT+
 +fOHh4yRYu077FbVuAI0IZYF/YvhXJpt7pzziMGyNTDXJKKWkEV1DoQOn
 sv3GXpOf99/adSuDb3Kn4g3PWBI+Oyt3LnK/ZW1MVXira34l0vugMAolt
 CJ2W0atdy1gYCkQYOfloI04M8325FNAOwS9eqrF1s/hk3WySXtXHdeS41
 e6cpO1SB7NqRJOXbyjkifn0oGL6nIdGAwLfdx83vJHjCzfLJpkzyJqd6s A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="283030284"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="283030284"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 05:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="864395863"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 21 Sep 2022 05:03:02 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 05:03:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 05:03:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 05:03:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 05:03:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsKmGlC5rtW26kx3482WAofeK6bdMlY+KRh31xw9m720V9a8PoCeximiB3R1jEb8I13vEZ1zaibY/GhrzhMwtVulEArGQhzwHSmmLrggBlQme+F4ITPVktBQp8+mqqfNk+gVqq36tm34U55MJfru0Ow3NrHPBbNeceBQYpnEzkNyim3mzt3s4uD1OR7K3GPzw10cGiFgNbzDaMCiLXdiUKDGAEiFyju5sX0oQWRQcg4BWC7dKNvWRJhL6kcPOz27/DJkqb1Dgzw5rM3VRI+a8vJtzpLh9l9/LD7irHufJgRTPjEv14KTPmDzMJ7A7fMS2EC9Xb3tgq46W9tP7YJ1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OFTF+a6oYwQaSeb/hYrsSd0fYc5qD79e48Qk5zCcr8=;
 b=hzkIz/N0iEdBd7YU4i/dcKprl7Av2rGE1aP5YFH2vhJiuT9bjigoreaG2N8BEjS+OzjcLMilMWzNHcNSLIxCQIxDXs1O7Zbr+BK9EC5UYP5crS00iK8ORTDvgfuzKezM2lp3VI9llsa3eYFk484BUXQSWYk11b3kJy72kVeNlOeRAYSvDPfxhDRWRlJfE3zoB4wJcVQQ1JbgL1pbGpowfylULM1wcje8W6bfaTm2kJy+94h7tFO85LJKT8yKQAadzdHIaxl0SfuLVTIe3tTr0j+zdAaiso+XyIU93WxdvAjGCRQsEbZRtdWwrS7OzyruZWSwA+T8UrtA4/Pd98VhDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB6800.namprd11.prod.outlook.com (2603:10b6:806:260::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Wed, 21 Sep
 2022 12:02:59 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe%4]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 12:02:59 +0000
Message-ID: <4062cc45-1b29-eb7b-3858-55f3d6ce17b5@intel.com>
Date: Wed, 21 Sep 2022 17:32:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 4/7] drm/i915/hwmon: Show device level energy usage
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-5-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220916150054.807590-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::18) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|SN7PR11MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 86383288-4f65-4463-a398-08da9bc939b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6wvQ3TFk6zYVKe4KyuvJ8LNPdhNOEPvWc+1ju2Jh8Wjt0/OpQjDTG+7VKRBgzTUuDP50fbN2oQKNgPj6eJwZjD+Udxi0s4sMBWN7AP0hoYmvncPMaxE3mYkOWRK+s6toDw96RelcUMd94iCRrHz7obRMzGHCvxfYR1UbBpVEuWF+ZXRjps0BUJx88tIaV2ZbRJqtwUsGwq9SjtNADj4M+lqkVR0y/6dpnN9nLvsL62PZGbtwAkARBXlKVqpRMKYl0tjvLS558VXvyS6/udj7rek+gzGvaGSyvfaRwlJ4Lvi/Pjel1qpbMuMvqLMTHHvgyNp/GcP4fbS6iY0xc1Yu8r/YTSRzN6yzTmbwHKZO8nJo1dxiBbvD+7RWNiuAsWXPXg00QTRqqa4G12mhnqUa8jVBs3uMSeu1R8dg5LBszAUUfLwuvU9TXzS1lcLM1fLPCeqfYm/duKZOdVb1r4xanjNQ/EwnJQliJ4XNTbtx78Z9afnufPDMo7THKyLa6k3aYpasc7mL+Wm5fpS+stol++NVfCSUy8v0I8yQf3ohk5Yxs+sAK5OKYnZ2G3t1Xul3yJLH36Ase6OZVC9WA6dvtW9B8ywXR2AqJm6wsrlHNPxSuUYHC7z/EqgQ1KXCv2fPuR01r33aO4lLZerCXAd1zV5NS6E3ruEG5HQq9oNLRIkBWsYxu/W8PY+7nxkLjrj+HVsSVzvWAES6Bor4xmaIVPNQZZTqhjZAaEsS5X3ex9LM4OyrKQyTnI1rLw611tH4HKwhIAbIQfgiaCcf2702Dk0xNgF77WVeCOKc+6hhYo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199015)(316002)(31686004)(82960400001)(6486002)(4326008)(478600001)(38100700002)(31696002)(41300700001)(36756003)(86362001)(5660300002)(53546011)(55236004)(2906002)(8936002)(186003)(8676002)(66946007)(66556008)(66476007)(2616005)(83380400001)(6666004)(26005)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlJhMk1wVGRnektpWTlxRXorMXlwZEthUTl0Q0R6ekpCQ0YrdVk2UVJIQzBE?=
 =?utf-8?B?bTI2ZnozN0JkNlJCeVlOOGpWeFNtNjdNY2tpVktEM3JOanZ2MFJla1RKcTFs?=
 =?utf-8?B?cU5UMWcvT1AvbmJkQVhTZk0vWHlndWs4ZmhKQ3NJekpiTWV5TUM3MkZWTGRQ?=
 =?utf-8?B?WEdOWThEQVczMWVzWEZMUkc3am5kcFI0K2FRZ2VDWEtuVk9VWFZ1SUJycmNL?=
 =?utf-8?B?VVQ0K3laeFhSbTVsZGNqQVJlN3Y1VjMxclU3UXlkR2VRSDNkb1JqWUZnZDRY?=
 =?utf-8?B?bjMySzk2ZllvcWQvMzIrL2loSVNDTlVYZ093SXlqUFFVNnk5SWdpK0ZGRktD?=
 =?utf-8?B?ZEhnc1ZJN3pKMERwenh6TmlNS1p0ZnUvVy9Bb3ltQTk5ZTlGZktBQ3F6Qngr?=
 =?utf-8?B?VU0vVm1ZNkFXMXh5SjBUdXVQK3NyVk1SV2lvaWs1aDIyVXB1UnFhRzdqSlZI?=
 =?utf-8?B?ejVmd29JenJsOUVQanZ5dVVjb0RJcXhEaG43MSs5TzdOaGdFekdSZktSN0cx?=
 =?utf-8?B?bFhkT3BPOFd6UjViQ3dKYnp2V21YY3o5TDQ4YkVkeDRUcVphUkxFdnZ6Uy9j?=
 =?utf-8?B?cXRXQlV5ZlBQL1hMVnladDVmNlZzTTY1SnJ2QXp5R205bGQzMFV5QzVQS2Q3?=
 =?utf-8?B?L21ybGZkRzJjS0hpL3dHNEpPMnZiVlpJdVBtZjN2TllSdnllOVo2SS9la0Y1?=
 =?utf-8?B?UWNqV0t2S2NOZEhUNmRHaU1GRjdzMWpLUnA5UU96SWZHYkxjWHpVa0hNd2Zz?=
 =?utf-8?B?bXFsL0xGcHFaRGNJMFBYQVJ2V0pkZW84S2M1WU1OdDRNV1A4TEVoUVBwVmZy?=
 =?utf-8?B?Z3hBT1orVDVjSElkSDlNYXprYU5QRitQN0FWVDBuODdXWWRISTd2ODgvTmhI?=
 =?utf-8?B?enVKSU1Bd2xKTEJjQzdXMEZNY2kxV1VyYUpscy9uV0EyUjBlWVZybnZCYXpV?=
 =?utf-8?B?dDdNOThaRDdQRncvRlA4RUVhdTdNS2p1L3I4ZU10cjNDYnNic2lUUUZ0Mi9R?=
 =?utf-8?B?WG9BRUp6QXA0cHdZOG85bE1SQU96VzM2Z1JvcHpWNWVodkhCaEF6TlVlNStl?=
 =?utf-8?B?YkhLd2g4TDl4K0ZzV28wT1RrRFRrSTlnMnUybHNGSklXTVUxNzd3cG5BUjZa?=
 =?utf-8?B?S1ZIOGZDSzJPejhBcis2SDMzQXkwamZ2K21iUndFVm1DTDM1dW50d2l1cElo?=
 =?utf-8?B?RnRrSGtId3BVd25IYk9OZEhVdjByTTFTTG1xcEI3NnVCcXVGc2dSeWlBQldS?=
 =?utf-8?B?YUoxMURSelZTQUxvNFZtQjlCaWhrbXRObW9ubS9wTmZDVUV3WFUwTWNDU1dP?=
 =?utf-8?B?UGpKQWlibXR2OEJoUjhYZjJrTzZjTEVPcS9JOVJhbTg2STQrUXh1cFFZZkow?=
 =?utf-8?B?T3Ryb3gzS0dwamJrREhJVTFTUDN4ZnVZWTBPUkNDOEd3bTRlVVRLQlVaMzNo?=
 =?utf-8?B?elpRVjZRVi8zUFozcTBNTFJQeENSRUhnMTFwcEQ1MGhJazVHSTJ0MXpURUtv?=
 =?utf-8?B?SDBKQVdoV0FUaDFPNDhleWVzcGhCWDllVFliT3ZvZEpHZ05ScWgxMG5aZm9S?=
 =?utf-8?B?b293dTJHemY4VTUzdGFIMnFDcmxpRlVnVExZenlXckRweFp4Y0tVYjJZRDFm?=
 =?utf-8?B?dmdBUHY1SjJvS0NZeDROTmtVNVBicnpUTzhvSlFmVlFVQmswNGFmdkZ5UUVp?=
 =?utf-8?B?YUdJWmxXTGgrZnN2ZVJEdXo5VnArdnFscEs1VStvQjBxS0w4cXZ0Rm5hNW1J?=
 =?utf-8?B?Q0lwdUNyTlo2QXBzQUZRQTFseXpsTUhUam5Ba0NrVGQ4NENackE0NTlBWUc2?=
 =?utf-8?B?cmNCWk9ydXZVa2k5dkQvTFJFTFltNjRBSm40QXdrRG00WE1OdnRmMWU4VTRq?=
 =?utf-8?B?R0Jhbi95S000WkRWb0FvT2JqU2N3S3ZXY3pRbkhKRW5GZUY3Uk9CRmQ2MXRX?=
 =?utf-8?B?bDF0aG5iY1NKdERzT0Q3Z3p6RnlVNnFXRGFOczhNaG8yWFpvd1hROVdhS1JV?=
 =?utf-8?B?bEFTSmxQMk55VDRLYmVtRWhTV1dHejlJUXJPRTRPdGxoaWNCMUIzbGUzdjR3?=
 =?utf-8?B?VTZQZFBhdEFON054L2FCNHRSUjB4cHpOUWlra09vTlN6ajZ4RHJNTzdrVEd2?=
 =?utf-8?B?aVJtMnNiNlU1a2tEV1BUVTdtQ3p4TlFuMGR3TzFZZjlQMmFqaERVbGlkL1Fl?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86383288-4f65-4463-a398-08da9bc939b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 12:02:58.8876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DNefc429fn8m+907LVyepGuqyEVyLsBbGOBdO6C3+ZcsJZasFAybqZ94/fLRr1RJiu7vRU6O5faAMMJB+2OKGxm5RIZKG/LkFizKGtFjws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6800
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



On 9/16/2022 8:30 PM, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> Use i915 HWMON to display device level energy input.
> 
> v2:
>    - Updated the date and kernel version in feature description
> v3:
>    - Cleaned up hwm_energy function and removed unused function
>      i915_hwmon_energy_status_get (Ashutosh)
>    - Updated date, kernel version in documentation
> 
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |   8 ++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 107 +++++++++++++++++-
>   drivers/gpu/drm/i915/i915_hwmon.h             |   1 +
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   2 +
>   4 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index bc061238e35c..94101f818a70 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -25,3 +25,11 @@ Contact:	dri-devel@lists.freedesktop.org
>   Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
> +Date:		September 2022
> +KernelVersion:	6
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RO. Energy input of device in microjoules.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 5183cf51a49b..a42cfad78bef 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -17,21 +17,30 @@
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - voltage  - millivolts
>    * - power  - microwatts
> + * - energy - microjoules
>    */
>   #define SF_VOLTAGE	1000
>   #define SF_POWER	1000000
> +#define SF_ENERGY	1000000
>   
>   struct hwm_reg {
>   	i915_reg_t gt_perf_status;
>   	i915_reg_t pkg_power_sku_unit;
>   	i915_reg_t pkg_power_sku;
>   	i915_reg_t pkg_rapl_limit;
> +	i915_reg_t energy_status_all;
> +};
> +
> +struct hwm_energy_info {
> +	u32 reg_val_prev;
> +	long accum_energy;			/* Accumulated energy for energy1_input */
>   };
>   
>   struct hwm_drvdata {
>   	struct i915_hwmon *hwmon;
>   	struct intel_uncore *uncore;
>   	struct device *hwmon_dev;
> +	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
>   	char name[12];
>   };
>   
> @@ -40,6 +49,7 @@ struct i915_hwmon {
>   	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
>   	struct hwm_reg rg;
>   	int scl_shift_power;
> +	int scl_shift_energy;
>   };
>   
>   static void
> @@ -98,9 +108,60 @@ hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
>   					    bits_to_clear, bits_to_set);
>   }
>   
> +/*
> + * hwm_energy - Obtain energy value
> + *
> + * The underlying energy hardware register is 32-bits and is subject to
> + * overflow. How long before overflow? For example, with an example
> + * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
> + * a power draw of 1000 watts, the 32-bit counter will overflow in
> + * approximately 4.36 minutes.
> + *
> + * Examples:
> + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> + *
> + * The function significantly increases overflow duration (from 4.36
> + * minutes) by accumulating the energy register into a 'long' as allowed by
> + * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
> + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
> + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> + * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> + */
> +static int
> +hwm_energy(struct hwm_drvdata *ddat, long *energy)
> +{
> +	struct intel_uncore *uncore = ddat->uncore;
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_energy_info *ei = &ddat->ei;
> +	intel_wakeref_t wakeref;
> +	i915_reg_t rgaddr;
> +	u32 reg_val;
> +
> +	rgaddr = hwmon->rg.energy_status_all;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		reg_val = intel_uncore_read(uncore, rgaddr);
> +
> +	if (reg_val >= ei->reg_val_prev)
> +		ei->accum_energy += reg_val - ei->reg_val_prev;
> +	else
> +		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
> +	ei->reg_val_prev = reg_val;
> +
> +	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
> +				  hwmon->scl_shift_energy);
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return 0;
> +}
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>   	NULL
>   };
>   
> @@ -192,6 +253,32 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>   	}
>   }
>   
> +static umode_t
> +hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	i915_reg_t rgaddr;
> +
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		rgaddr = hwmon->rg.energy_status_all;
> +		return i915_mmio_reg_valid(rgaddr) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_energy_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		return hwm_energy(ddat, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -203,6 +290,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_in_is_visible(ddat, attr);
>   	case hwmon_power:
>   		return hwm_power_is_visible(ddat, attr, channel);
> +	case hwmon_energy:
> +		return hwm_energy_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -219,6 +308,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_in_read(ddat, attr, val);
>   	case hwmon_power:
>   		return hwm_power_read(ddat, attr, channel, val);
> +	case hwmon_energy:
> +		return hwm_energy_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -254,19 +345,23 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   {
>   	struct i915_hwmon *hwmon = i915->hwmon;
>   	struct intel_uncore *uncore = &i915->uncore;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
>   	intel_wakeref_t wakeref;
>   	u32 val_sku_unit;
> +	long energy;
>   
>   	if (IS_DG1(i915) || IS_DG2(i915)) {
>   		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
>   		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
> +		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
>   	} else {
>   		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
> +		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
>   	}
>   
>   	with_intel_runtime_pm(uncore->rpm, wakeref) {
> @@ -280,9 +375,17 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		} else {
>   			val_sku_unit = 0;
>   		}
> -
> -		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   	}
> +
> +	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +
> +	/*
> +	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
> +	 * first value of the energy register read
> +	 */
> +	if (i915_mmio_reg_valid(hwmon->rg.energy_status_all))
> +		hwm_energy(ddat, &energy);
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> index 7ca9cf2c34c9..4e5b6c149f3a 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.h
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -17,4 +17,5 @@ static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
>   static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
>   #endif
>   
> +int i915_hwmon_energy_status_get(struct drm_i915_private *i915, long *energy);
>   #endif /* __I915_HWMON_H__ */
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index b74df11977c6..1014d0b7cc16 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -191,7 +191,9 @@
>   
>   #define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_ENERGY_UNIT                      REG_GENMASK(12, 8)
Please use tab here instead of space to line up with above macros.
With that,
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>   #define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
> +#define PCU_PACKAGE_ENERGY_STATUS              _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>   
>   #define GEN6_GT_PERF_STATUS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5948)
>   #define GEN6_RP_STATE_LIMITS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
