Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E48B5C00BA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD71910E797;
	Wed, 21 Sep 2022 15:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DAB10E797;
 Wed, 21 Sep 2022 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663772866; x=1695308866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TX95qqxLL3rJnkJYqibTuG9vEI8l1EjvcV7Wm39UZcg=;
 b=JSFriwwx0qkS9r2zQFAeKFMSWG9nAVzlEsttScCimK4KufdPdWuXztzh
 FWEyZrQOXTIOQfGf7rcDDeWfBtdM+kJ3GRwggA7S9uU5Bgc9rfcF4Kadg
 mgPyi55KFtVNOKCrCGB2tQisS5B6dmfpdI2sHsTBbdtFbCwJIoDkGbbMz
 tLmuT4cTb823ASV20favUVuxS3s59X31N97hYDADYy6Krl7EuME253Bsg
 2dFeiFOxVlrSooF+6VAI6eUeXgaL5FTsyCRMXjcN7riRW7Ti1/U8bbkT/
 Xa2upOVERujXQUsrikUlNgWERVeJdfwNDobpuIT4efBmGZ8PeLJO3nSa5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="386314131"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="386314131"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 08:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="621720547"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2022 08:07:28 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 08:07:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 08:07:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 08:07:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik0W8SJfGfQrCBs3aVaFPj80FFWp6S3PZ9i2ghPxFnv8PJq/TYzExWHvQtignZJdBEcx42sF/y1V5o2auThyhW8Pmz1KmfTewx8F9d1O7Srv8Y47KlzQ8TJDDdqgZ81TMqFEhU+Y0YYkK9S7mfqAvJ8s7nJq32huVkl9JOY3JA6UhqUgKyG1XuUki6HRgx5CTXQwcd3bkJ8I7H4IB8e6xFhYiuasiHK+JndROgKl5Px3gsmdaiwtIFsR/A3/ddcRtYgMnFaKxgzmK6j9FEX52g/x3vWel4Rf/ytmFWBf19qIMXAhafn2PlKbHWtN1jHzvDYn3dacJFm1Kwn9VoTE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSbTEMoB6fWUgiGVY1gKw0e2+C757iqZxc94ku5Ebv8=;
 b=X9Wi4SULH4xMA3l42rdRjFDrd/VTeHIRfwve3yqcFDn/DgLpG5DTcVvnpgMv1UakBdlbjajif9mhFxzSmeN3LLTTc7w5+ri6NfVciXQ0mRCizuyC3OnL8tWZDoJkCPjcny8J13u8CQ9JTauzB06fz1e8f2xjpyfj/Omwv4gjKtMnuwdobbCmrqZVJfBZCKJ+jTVyJDnQ1yVkeIb2T4ePqHCbQ5UY/r4RlzsB2xr8Qe0qFSQHLd+xrYBP4HmuBmwZOqRqIUUFfCLeHuSMYjcYuB4fQhRxbPTVre05Dj8rrX043Ayk0rJQjeyoiRa4dwHRqO7Xq1nMSrD/ZQ3tSf3e9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW3PR11MB4570.namprd11.prod.outlook.com (2603:10b6:303:5f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Wed, 21 Sep
 2022 15:07:25 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe%4]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 15:07:25 +0000
Message-ID: <d8af316e-6e1e-98db-e25b-273c734634f6@intel.com>
Date: Wed, 21 Sep 2022 20:37:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 5/7] drm/i915/hwmon: Expose card reactive critical power
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-6-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220916150054.807590-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::22) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|MW3PR11MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5f067c-55c8-4d24-f6e4-08da9be2fdd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X+lo67O1hmvIbZqFfi2JnUHBpFys4nSlO1Rq0qPR4EIEAjaBXXBonuDK8sx0opuDP0DEUs/DXDHYy7BsWtWBFtro8zBO5RIdaINAeeZTvyNfcNtyR4P8mqSp9rnIGMY7zG6SExf/MjvSJrh3dXM9PflAwe+UNWjDuhDWgGrDC2WzVLlp3JWlv9Kx3xEcYU035TPjseECY1P/gDtLDOW85LxonMmeEqYnMmZ6PVP+hSWjD9HD8mSKC2iJOQjIy2NA/4anBDK9C8S2i8zFd0NAOtEmjwq9xWQmptpJuKEMHygW8pZmd9Xn04UO04dvlVQsINZCPBWBOrX59cAhQUKoQ3CzyD6LvOAfd38oSHxtaS9Jv3cQvdmO9Id5c6nkxB77/wgigOa0yKuNHn4/Y3qTVTm6dJwtxd84i89a0eH15RfQy1/zZXvay/tsSii9V98NA2qOtsGXEAdlyuW5EJAB26HQUDgqvc299cPLEdMrmh1ERPM9J+eIbuDHxQZIaNM+B5Oux6GXvAja9Xp3vQp0K+T+nMtnjUId8ra0nPxuD3H/+/WzRSY44RWSHxoJVC4kVvZYbhRef/qAfn14e6PjBVhq2mg98bkgT27MhlTSa4jScelmqN6AystdlblKMxMsSc8havvQV4ak8Qk4AnhkVNn6vF47ZyL0V0kXZLIOhgGMxAi7NFwlCoJZEcEp3cFAsxHJMClx25YXItBwrbjsNZduiA4ikoJ7Ayp3ncONq+wIfAU4a9z4t6TGrRHhAn3ZZkMnFjU0tuoIDwMilrBsPxBKEOyzxA5U4Ws8kmjgfTo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199015)(86362001)(2906002)(36756003)(316002)(5660300002)(31696002)(26005)(6512007)(53546011)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(38100700002)(8936002)(6506007)(55236004)(82960400001)(478600001)(186003)(6486002)(2616005)(6666004)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Lzg1dHFGcnI4dXJ0T1JicHF0c01tWUt4aXVSY0FSU2VwZjREMEZPTER2TDBN?=
 =?utf-8?B?elZIMHh2WmZHckczYkFoT2k0cWtQb0NlS21lZWk1VGZKQk1mUzdDL0RnOWp2?=
 =?utf-8?B?a3o5L3F4dTJyWVZpczNEWUNNTnhGRHVDQjJ3VmpZakVTVkE3bDZZVXJiWXJK?=
 =?utf-8?B?ZmNZZG5zaVR6cGJSdlg2aUk4aTFsQm1ETUtPSWtHS3lYU3ZoL3kzdU9IaTJW?=
 =?utf-8?B?V1ZyRGQrbmdHcDQvMEpFVFhRRlpadTRXRUZ0NHltWTJURGxWS2RFWktxTmta?=
 =?utf-8?B?c2VDbWdURWxqYWlxR1BKdDh2Y3JSaDN2K1ZJUi9pRUxWRit2S3BuT2lYUSta?=
 =?utf-8?B?Q0dnQUgwWlRaMDVUTzFqV2dyaHhpVkNEMjY3anh0Sll0SmZSQmpYazduWXZu?=
 =?utf-8?B?dFMwL3hqK1RNYWdXbkxkVjhUNklWWkU5cGF4b0xmbVljSnNkUEI0Qjl2cElF?=
 =?utf-8?B?VDNQR3h1M1F0L2FHTnNWalJUelp0UFdkSFdQNGpHUWR5R09zb21VR2IveSta?=
 =?utf-8?B?NXpMTklla2hSODRBYVpOZW0zNy83L05ENHgvb1czdGN2dWZpWmRMTDNlSWtI?=
 =?utf-8?B?anhHVktGWG8zVHlmbnJLWmNYQ1JQZjZhbVMydjdWcGU1ek5rNG9sbHJyaS8r?=
 =?utf-8?B?Skp5Z1c0cE5mYVFrckY1UDFpT29wa3BuSmY5QXdidFhuWUdnRll3LzlnMGdB?=
 =?utf-8?B?cEtRWVNJS2ZkL2JvOWpaR1ZteTIvQzVyMHdlVFRrc0lxZGVvVzJScVNvU0Js?=
 =?utf-8?B?QzlOclQyOWpHV0hhVjBXNXVJaTBxTXNORExhZk5iTktRWk9rT0xKeTRMQjBy?=
 =?utf-8?B?QVFJN09mYytDV1lKZU03QzZ6b1pvVzZ0dzBXWUxacHMzODNGTjNiazhlOGNm?=
 =?utf-8?B?UUw0eWlMVzlSSzFxRDRkUm5KMDBQVTIxQmlvemR3TmFWUVBoRlc5V0dDMnlD?=
 =?utf-8?B?QmhJTzVzV1lFRm1VSGU4ZGRZK1FCdDlDNTZ1RkJHanY3VUNnNW1ZUWVlR2Zi?=
 =?utf-8?B?S1IrZUNWWXlFOW1FM0JlZnk4c09sS3dmYkhnbDhtLzFibDFYVWdnc2JIQ2c3?=
 =?utf-8?B?L0pPNlc1RmdlOW5pdG1VUTRXVXgxbFlTSkZNb3ZRYkFsWTdobXBSaStnU0pz?=
 =?utf-8?B?RVpOL29aMnVZblFFaFM5cW9tQmpwaDJTYjhXTXp0Z1lsak9ad3FEbCtKTi9U?=
 =?utf-8?B?eGdVYlM1ekk1SmRXR2JKYS9lTzRueU1vVzM4MHMrNWZlRU9kR1NhRDdVbXhF?=
 =?utf-8?B?N0h0YkxJVy8ySS9MdE5lbEZObmxTemZ3K3VUR3UyNWVyZFNOTThUbm5hOXlm?=
 =?utf-8?B?aUhmUVpDRGJ4cFU2bFJaSnNUSlZ5dGFSRGRYd3dObHN1VmhWbkltdjRRdHpU?=
 =?utf-8?B?YUZrR1IxeG9JZ3VpWHhLb2gyampERExtTU9NL1hGVjFzTnZ2STVIMS9OdnhF?=
 =?utf-8?B?NFM4U2h3c3NNNzVvTWVvSUk5MmtFUkwrOTkwNFlDSzRiNDJ4RWM2TVZUOTZZ?=
 =?utf-8?B?R1V2WHNMRWZSZU1sY0ZVWEk0Mk1zYXNrMGJUQnJnalg4aTVyR3o5aDdXWEps?=
 =?utf-8?B?elVFb0JieTJmQUpDQ1R5L3NMVlVTalRidEM0ZENSNVdDM0l4STMzTXpzc3lP?=
 =?utf-8?B?UlphYm1xNlJ3ZWRZalZ1WW5XWjh1cDJqU3dWK0FMbmQvZityWTlzVFlnM3lJ?=
 =?utf-8?B?ZDFlQlV5SXJxaHZrTFNHaDJyWXQ5ekVTMzg3RzgxYkw4d3IrbGhTVlFQVUVM?=
 =?utf-8?B?Mmg1R0xWZk04QzVDYTQyaWZWMVpFZ2RzQWZSVnEzSW5Bb29FUXZmelJ6cS9M?=
 =?utf-8?B?STNjK2RVb0xiK0pyeitRekdUUUttZ3drdWN6U1Z0aHFNM0krblFQUWo5T3pI?=
 =?utf-8?B?eWlDSjhiZGY4clBuSmdpZDJkcnVDOUw0UnJqc3dPTHFPWW1oelBNVVRNQUNL?=
 =?utf-8?B?SGEzYWRpR3JFRjArdHRod2I3Rm1YMVRXU0RLNFZzcWVxeURYV2trekpFNENM?=
 =?utf-8?B?aEpEczJEeXNzNWgrSXRtNHJURmxQM1hMcXBoRzlQY2ZDcUpjSXlLWTZhakNT?=
 =?utf-8?B?N3hteXIxLzYyYTFwYWVOellkZzNaNG96MkIvNXZzR0kzVjR5VkNRZHVxWEcv?=
 =?utf-8?B?SlBXanVtZnd1Y0JJaUNmbkpURWdIdlRBSXdSQ1BGL3llb0lJNXFjVWVESHAr?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5f067c-55c8-4d24-f6e4-08da9be2fdd7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 15:07:25.5998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/zLsUm8sZzw52l4OSUsrlVdOFaJBQ7up+6fzIbu98deG66FznBlsyScmzp6s7dj3eEqiwjO+rl+IGJBseoK1scUpGRvVJvYCN/ohFID85U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
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
> From: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Expose the card reactive critical (I1) power. I1 is exposed as
> power1_crit in microwatts (typically for client products) or as
> curr1_crit in milliamperes (typically for server).
> 
> v2: Add curr1_crit functionality (Ashutosh)
> v3:
>    - Use HWMON_CHANNEL_INFO to define power1_crit, curr1_crit (Badal)
> v4: Use hwm_ prefix for static functions (Ashutosh)
> v5: Updated date, kernel version in documentation
> 
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon | 26 +++++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 95 ++++++++++++++++++-
>   drivers/gpu/drm/i915/i915_reg.h               |  6 ++
>   3 files changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 94101f818a70..cc70596fff44 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -26,6 +26,32 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel i915 graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
> +Date:		September 2022
> +KernelVersion:	6
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +
> +		Card reactive critical (I1) power limit in microwatts is exposed
> +		for client products. The power controller will throttle the
> +		operating frequency if the power averaged over a window exceeds
> +		this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
> +Date:		September 2022
> +KernelVersion:	6
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +
> +		Card reactive critical (I1) power limit in milliamperes is
> +		exposed for server products. The power controller will throttle
> +		the operating frequency if the power averaged over a window
> +		exceeds this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
>   What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
>   Date:		September 2022
>   KernelVersion:	6
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index a42cfad78bef..bd9ba312c474 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -11,16 +11,19 @@
>   #include "i915_hwmon.h"
>   #include "i915_reg.h"
>   #include "intel_mchbar_regs.h"
> +#include "intel_pcode.h"
>   #include "gt/intel_gt_regs.h"
>   
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - voltage  - millivolts
>    * - power  - microwatts
> + * - curr   - milliamperes
>    * - energy - microjoules
>    */
>   #define SF_VOLTAGE	1000
>   #define SF_POWER	1000000
> +#define SF_CURR		1000
>   #define SF_ENERGY	1000000
>   
>   struct hwm_reg {
> @@ -160,11 +163,25 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
>   
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> +	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>   	NULL
>   };
>   
> +/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
> +static int hwm_pcode_read_i1(struct drm_i915_private *i915, u32 *uval)
> +{
> +	return snb_pcode_read_p(&i915->uncore, PCODE_POWER_SETUP,
> +				POWER_SETUP_SUBCOMMAND_READ_I1, 0, uval);
> +}
> +
> +static int hwm_pcode_write_i1(struct drm_i915_private *i915, u32 uval)
> +{
> +	return  snb_pcode_write_p(&i915->uncore, PCODE_POWER_SETUP,
> +				  POWER_SETUP_SUBCOMMAND_WRITE_I1, 0, uval);
> +}
> +
>   static umode_t
>   hwm_in_is_visible(const struct hwm_drvdata *ddat, u32 attr)
>   {
> @@ -198,13 +215,18 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>   static umode_t
>   hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
>   {
> +	struct drm_i915_private *i915 = ddat->uncore->i915;
>   	struct i915_hwmon *hwmon = ddat->hwmon;
> +	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? 0664 : 0;
>   	case hwmon_power_rated_max:
>   		return i915_mmio_reg_valid(hwmon->rg.pkg_power_sku) ? 0444 : 0;
> +	case hwmon_power_crit:
> +		return (hwm_pcode_read_i1(i915, &uval) ||
> +			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>   	default:
>   		return 0;
>   	}
> @@ -214,6 +236,8 @@ static int
>   hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   {
>   	struct i915_hwmon *hwmon = ddat->hwmon;
> +	int ret;
> +	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> @@ -230,6 +254,15 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   						hwmon->scl_shift_power,
>   						SF_POWER);
>   		return 0;
> +	case hwmon_power_crit:
> +		ret = hwm_pcode_read_i1(ddat->uncore->i915, &uval);
> +		if (ret)
> +			return ret;
> +		if (!(uval & POWER_SETUP_I1_WATTS))
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_POWER, POWER_SETUP_I1_SHIFT);
> +		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -239,6 +272,7 @@ static int
>   hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>   {
>   	struct i915_hwmon *hwmon = ddat->hwmon;
> +	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> @@ -248,6 +282,9 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>   					  hwmon->scl_shift_power,
>   					  SF_POWER, val);
>   		return 0;
> +	case hwmon_power_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
> +		return hwm_pcode_write_i1(ddat->uncore->i915, uval);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -279,6 +316,56 @@ hwm_energy_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>   	}
>   }
>   
> +static umode_t
> +hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct drm_i915_private *i915 = ddat->uncore->i915;
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		return (hwm_pcode_read_i1(i915, &uval) ||
> +			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_curr_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	int ret;
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		ret = hwm_pcode_read_i1(ddat->uncore->i915, &uval);
> +		if (ret)
> +			return ret;
> +		if (uval & POWER_SETUP_I1_WATTS)
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_CURR, POWER_SETUP_I1_SHIFT);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
> +		return hwm_pcode_write_i1(ddat->uncore->i915, uval);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -292,6 +379,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_power_is_visible(ddat, attr, channel);
>   	case hwmon_energy:
>   		return hwm_energy_is_visible(ddat, attr);
> +	case hwmon_curr:
> +		return hwm_curr_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -310,6 +399,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_power_read(ddat, attr, channel, val);
>   	case hwmon_energy:
>   		return hwm_energy_read(ddat, attr, val);
> +	case hwmon_curr:
> +		return hwm_curr_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -324,6 +415,8 @@ hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	switch (type) {
>   	case hwmon_power:
>   		return hwm_power_write(ddat, attr, channel, val);
> +	case hwmon_curr:
> +		return hwm_curr_write(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 55c35903adca..956e5298ef1e 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6644,6 +6644,12 @@
>   #define   DG1_PCODE_STATUS			0x7E
>   #define     DG1_UNCORE_GET_INIT_STATUS		0x0
>   #define     DG1_UNCORE_INIT_STATUS_COMPLETE	0x1
> +#define   PCODE_POWER_SETUP			0x7C
> +#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> +#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
> +#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
> +#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
Could please add some comment to explain, why POWER_SETUP_I1_SHIFT  = 6, 
what is excatly 10.6 fixed point format ?
With that.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

> +#define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>   #define GEN12_PCODE_READ_SAGV_BLOCK_TIME_US	0x23
>   #define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehpsdv, pvc */
>   /* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
