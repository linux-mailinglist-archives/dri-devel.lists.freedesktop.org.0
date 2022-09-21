Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D25BFCC5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 13:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94AD10E389;
	Wed, 21 Sep 2022 11:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702A510E340;
 Wed, 21 Sep 2022 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663758580; x=1695294580;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=29ZU72Ha068h794ev70aZok4iDL23Pnas+VI8Pni/sM=;
 b=nepNpnIZefWB8gexszD9yOkk6q1dkjn3WrwPL53dochoZ0RRu0JthCjA
 xgDApCWrcqom4JD5T4k+aZmoGC8RzVmsKtFRsgSpf/uMvBo8GHpHVq899
 EruwVlCCiX+/JGiN7Thxu4s/kLWI04Iic2KswiPAjMbFqFUtdAD3+e+YM
 kpWzXc7MhXi/Gh7ljlHWx6a1kJ5htKQ7qCwXv+F+srLdQao05QtbvE5at
 wsep2OJZNqzn9Mo/NhRlumUGqnPxkBRnOHeWT4o5n40BxIRSRiPRqJxyt
 oLOIZ43tUPpnNCwS606O1T/A0fTzUm2qyZlEJMw5mvgFxsJGgNKb4mMhl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="298689028"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="298689028"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 04:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="570490539"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2022 04:09:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 04:09:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 04:09:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 04:09:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQTWxBl5T5qoFr33nsRvZk/RzgRMGn4TEVjA63un+SOcVO3jBxi5u2+CBR8x4jkY+aLa6I4asFx+1YidSqmcB834wPyWZjErRQ1n0JvIOosatBO6DqCDBX+L3D3qySsRsuxAgT1o9YU4SwnKi4cALXpEQxOgsAuyPeppl/LG6T15/pdtBvblava6kWGDEibnxQTCFsbXgtqcooo74iqflygXBUExV+KE1GFyeljejAjQsRFuX4/kMXknijTGuYElE6sJAkP6uSuneL9rGWUTznXhve2TQtj1KylY0QzVIyd/XX3pFnkLcoJIggD4hEjdJTwMxfcnadtIXWjVmqnKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96w6/37IAgruYZh9tAbyCHcosYYpU8wKh6QrTcmPAMc=;
 b=eZSUiBReUvSkEnmSRfFQnHz5JH9pa49lNYbjrIF4ex7/mPMmL1+irdSAimp0DGRd9XG9UtVs8LBf9patcsbWD+WZHEE105yurwCpqdjQOdgK+QV4izwn6gZLCjjPdtAc6oMViGhWq7IGKkJiEdeySygT5E7eeIeQ3w0w2QOIhBZtcdlsSBdVYwyYzKSDBBbnz734ZZ0tl4/WlVRPYGygNpPUJBnqwQAmnKSsZSbtnsAXgwJ7y72c19cUoxmmYU8LWYtzsZxLjMCOLII+Aa2s7pBf+LRrOkWn9P/5ddSwzUMZ2U0ZaCGTk0T2U43DDvmzezS4kZw9N+JR8yffq08U8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Wed, 21 Sep
 2022 11:09:31 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe%4]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 11:09:31 +0000
Message-ID: <97c3b793-26a3-2560-1701-96d883937e18@intel.com>
Date: Wed, 21 Sep 2022 16:38:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 2/7] drm/i915/hwmon: Add HWMON current voltage support
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-3-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220916150054.807590-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 154a4ee5-9e75-4e27-5bb2-08da9bc1c208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NQ9Uzje712IBGAt+Zz380Dr/ehJv0N3ziqIEz+u0noI+HJtxEaTRdkYRF3QEal2OmqIqTvEnC3cZXzvThh2fRaLABuJfst4nr9k1qZXxMiR3blIiROQe02oqPeaC5HedukjfvTY3+SngqVg/27rDgOCMEprACFfg8iKli+iih3hGJWV1aMml+36iLmR16wEZynQqJ4dpOSKv5/vkdrft5+tdfeIbRLFutHkSnFNrSRz2NLEDNohzCyU1rboozfY0eEQ2ARfQyvIanhSVckF+a4ddNwSw12gBH/zaI3o/Pl5t5PlGJN7sDAdDg047E6b1uAjK0cKC4WqsiuAZLVLp2WBIrA8qqfvPg/r66t6qjpwVEn69r2nnaAslDpk26kC55hiaRAjg+G2RW/eAZLbwaychE6xgldYq0rb+EaPAUkwp4s97l6Sifo36RSkNmRUk2aVHsjXW2R5aa+ppDIWJdVMNLBqY/WdjvontzO6l8UWTqGwh7F5wU/jTY7dpTRiS8pFff2XfNJYR7MOkyR3cF44uiXo20hnDmZ1iNu1f0Sr7CFOg8pc2Aeb2G1uJcjzyrY5qBa38En6MKF+KRD2zp4Voi8rAG8Qcfqz0Phgxp5s8dRsHoJsPfaQGILxr4kiKPBgv+z2iRmzPs/Min8tM5+7GVugLs7ThrHmmIDqzEnKzcg0tTFhzhi2ma41YgFegOjf0kbTvtwMsc1Zn7deXOrhtlCg9LCqCsBkoBL1vptBHV7CcMPurvQpv8lnuak/2SMdYTKM7nUfUWHPnlaSILOCHEkZdpYGlf7GNmfmiaqQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199015)(86362001)(5660300002)(31686004)(2906002)(8676002)(53546011)(6512007)(26005)(316002)(4326008)(41300700001)(8936002)(38100700002)(66476007)(66556008)(66946007)(31696002)(6506007)(82960400001)(478600001)(186003)(55236004)(83380400001)(6486002)(36756003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEExMWJaU3RMbi8yaU1BdGx5a3lHVlpWMDBlc2dUbUpYZXM4QnIraCtyUGhv?=
 =?utf-8?B?czhVY1N1VWUvbnFjUDhOSkw0VFNFUHJocC9TMCtGTVJxNWlMaFpMVG5BMEYz?=
 =?utf-8?B?QWRFTkk3SkdNcDlpUm1na29IbHVwcWRtbS9Jdzd3cWQzTFNUOXRoTW9lUEhQ?=
 =?utf-8?B?Ykh1cERaMlNmU3pZU3c4TU1UN1dwUC9kTklDYjl3dEV6OElzNENHYVd2YWIx?=
 =?utf-8?B?cTZ2WGFWMUUxY1Q4YmY3RjV0WWFHazRHV2hMYzBJcGo2cVBzMEVhVEVzVkx0?=
 =?utf-8?B?VkY1SFhkMU1ScEhvWmVQbmZkcnhoaWpHU0IyRVkvQ2JCbXI5eHlEMVU1WFBx?=
 =?utf-8?B?TjZ4T1pjRi91WmNrZjlEaUZSbmxSdWZWZFRYc25adWI4VjBSSjFnOTM2U09K?=
 =?utf-8?B?cW1GcHpMSE9KNkY5SHhZR1RqeENOR3ZaZHRJQjdzU3loYXVreHh3dmFWOThX?=
 =?utf-8?B?WUVSMFFsN1N1c2hJSXhOMS9MRERiWWYxQlZXTlgrOUdMMHJsa28rT0NjZHU4?=
 =?utf-8?B?eUh0aHdUSEdUNEowYTh1eFRCUWI4YkhHWjNpd1c1UUFDWDVkZlJERk01QS96?=
 =?utf-8?B?ZzE4bUxXcmZ4bWFKd3BqNlFHWHpyblkrZFdMc0JtZFFqV1VXUkFoRlEwcXRN?=
 =?utf-8?B?cjRKamVaVHovTGtMQzBJbkdFL0pxd0lVdmpKZTB1T1NNMVYzelhRUVJZRzlF?=
 =?utf-8?B?cWkwMDB6MzViS0VSSU90STQwR3hOVE4xUXRNSlIzcXcyQXJuODFYbHU4bE9v?=
 =?utf-8?B?TjZhSHlzL29TZUZucW80Z1pHUk9OQWhad0pmT0JpbmJnckY5dHNnUkVOaGU5?=
 =?utf-8?B?Tm94d1oxWUFjQ2pJNHJiSmJTRkNjOUxsR1lGQXpZSm8yZFd1WE80ZkU4VTJJ?=
 =?utf-8?B?Tml3MEQ4M0ZJdEQ4TjU4akJMYkRjWllGdUJwRGFpemcxYzNiK2VnbFpwNVNB?=
 =?utf-8?B?cWt0VmJIL0p0VTlNclZrdFdlQVp5bGN5VGNtR0E4NC8xbEx1NFU1M0s3bmtD?=
 =?utf-8?B?Z0duN2NBL0dDVnZIRUlra3NqNDRQa0ttN25hNFc2TDd6UVpMYTd4UzQxY3M4?=
 =?utf-8?B?Z3phSUZBT1dzWlROZFduS0lVajVpSmhCWUZoblJWTnFiVnNkcGZPVmVuWk1X?=
 =?utf-8?B?ZXBnbityWnNvQ3FGeVVYaWRwWFpad3AyaVRubFppb1laN1pKYzZCYkI0N0ti?=
 =?utf-8?B?bUtmSDY3U2x6cHVlUEZmU0dzTzltVk45WGxUQjZwd2RwRG44K2gzelloTWVE?=
 =?utf-8?B?aXhqYTlXUjB4M0hLdXcxdlY4NmlmS2tlWVg0Z29NajljSHY5WFlDS3dlYmla?=
 =?utf-8?B?VS9iaXpvT2JSUkN0SEpvcXlEazBva2MzZ05mYktEejA2aHFIb3IwaHBLS1l4?=
 =?utf-8?B?bkQ3QXR1Ny9QenliOXlCNys4dk5URDhFK1lQQVdqS3QxOEVTYytwZXhiTG1n?=
 =?utf-8?B?RjN5MzBSQ2N4OFpsTUM0cW9KUllnUWY1Tk5VOU1JdjdCZUROaDlZTFNmbHpj?=
 =?utf-8?B?a0ViTzJ1cUsrZ2Rwb1phWlpubk8rRDVQRnVMbmx1eFVQZ1A2UFVGZElOVjZi?=
 =?utf-8?B?WkhRSFBkRk9wTElVS2lOTnlqWlBWRTFWY1JscVJsQ1FBMExGQjltdVZ1bGR3?=
 =?utf-8?B?T2h2N3ZuVGVoL09jSjRZMnc4bkd0WW9Uay9MVXVZNllDcnNRYi9rNDVmWElw?=
 =?utf-8?B?dTR1aXRyczMxWE82aFJOYVBqYUlsZ0pweWduNS9zZ0FGWlFkeUxsNVJ3QWdE?=
 =?utf-8?B?eXBMMHI1RjlNQjRpc3VFbm1yUE9aSlNoN1ZZRGI4anlsdDN3TURkblk3UkUy?=
 =?utf-8?B?STE0ai9JVVY3ckxhVVNjMGE3dVllMlFPdVlMYlF5WVJZODQ5KzYyYVNLWkEy?=
 =?utf-8?B?QW8zRU1tb0NmMnFvWHJQcUY3ekVMeWl5ak9kYkM1NjRTS3h0RWlOU2lpNWZP?=
 =?utf-8?B?RVpHNHEybDRRNEVpWFFxZjJmdUpsVklEOS9Wbi9jWmV0MHJPVUhWcGR2MGNn?=
 =?utf-8?B?bEhDdDNISUtjNWRiK3B4cDFJUGQzMEZtNnF2T2t5ZEhUd1BBWlVEd1RoaEZL?=
 =?utf-8?B?SVJIYVE5MkxBMFVoS1NtUlN4ZExhRWwxVHpVdXVYMUdsejEyWHVYQ1ZKdVNu?=
 =?utf-8?B?NGZZLzJ3cmJhVWZ1amx3b1lwSTEzb0NqM3d0OGhzbXJVL0tmVUNoSVg4blIz?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 154a4ee5-9e75-4e27-5bb2-08da9bc1c208
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 11:09:31.4073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/KxU4XwGBOPQ4xvSAEi0MLNOEMRRMf6Mxl8vn1IiocbOF8f8t3POTHykARkugJvTZrYcLMZkLG8JnUvTc9tyqWLIthhXVEchiXGb6KtPmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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
> From: Riana Tauro <riana.tauro@intel.com>
> 
> Use i915 HWMON subsystem to display current input voltage.
> 
> v2:
>    - Updated date and kernel version in feature description
>    - Fixed review comments (Ashutosh)
> v3: Use macro HWMON_CHANNEL_INFO to define hwmon channel (Guenter)
> v4:
>    - Fixed review comments (Ashutosh)
>    - Use hwm_ prefix for static functions (Ashutosh)
> v5:
>    - Added unit of voltage as millivolts (Ashutosh)
>    - Updated date, kernel version in documentation
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  3 ++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 53 +++++++++++++++++++
>   3 files changed, 63 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> new file mode 100644
> index 000000000000..e2974f928e58
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -0,0 +1,7 @@
> +What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
> +Date:		September 2022
> +KernelVersion:	6
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RO. Current Voltage in millivolt.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 2275ee47da95..65336514554d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1510,6 +1510,9 @@
>   #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
>   #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
>   
> +#define GEN12_RPSTAT1				_MMIO(0x1381b4)
> +#define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
> +
>   #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>   #define   GEN11_CSME				(31)
>   #define   GEN11_GUNIT				(28)
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 103dd543a214..45745afa5c5b 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -11,8 +11,16 @@
>   #include "i915_hwmon.h"
>   #include "i915_reg.h"
>   #include "intel_mchbar_regs.h"
> +#include "gt/intel_gt_regs.h"
> +
> +/*
> + * SF_* - scale factors for particular quantities according to hwmon spec.
> + * - voltage  - millivolts
> + */
> +#define SF_VOLTAGE	1000
>   
>   struct hwm_reg {
> +	i915_reg_t gt_perf_status;
>   };
>   
>   struct hwm_drvdata {
> @@ -29,14 +37,49 @@ struct i915_hwmon {
>   };
>   
>   static const struct hwmon_channel_info *hwm_info[] = {
> +	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>   	NULL
>   };
>   
> +static umode_t
> +hwm_in_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return i915_mmio_reg_valid(ddat->hwmon->rg.gt_perf_status) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u32 reg_value;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +			reg_value = intel_uncore_read(ddat->uncore, hwmon->rg.gt_perf_status);
> +		/* HW register value in units of 2.5 millivolt */
> +		*val = DIV_ROUND_CLOSEST(REG_FIELD_GET(GEN12_VOLTAGE_MASK, reg_value) * 25, 10);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
>   {
> +	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
> +
>   	switch (type) {
> +	case hwmon_in:
> +		return hwm_in_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -46,7 +89,11 @@ static int
>   hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	 int channel, long *val)
>   {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
>   	switch (type) {
> +	case hwmon_in:
> +		return hwm_in_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -76,6 +123,12 @@ static const struct hwmon_chip_info hwm_chip_info = {
>   static void
>   hwm_get_preregistration_info(struct drm_i915_private *i915)
>   {
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +
> +	if (IS_DG1(i915) || IS_DG2(i915))
> +		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
> +	else
> +		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
