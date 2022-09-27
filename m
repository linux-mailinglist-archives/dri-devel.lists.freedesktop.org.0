Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1005EC50F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1209A10E94B;
	Tue, 27 Sep 2022 13:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B861F10E946;
 Tue, 27 Sep 2022 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664286922; x=1695822922;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B/XrMFoxJKSdhoQnJIAr/Z0Pv8LNpL2w9hIT2uWdjAQ=;
 b=L7EvaKzjfbjoIEvzf3Ke3mhtCEIz4W88hjZ4LnVvlhkhBTIvQgInXyQV
 vB5unLS14iJOjZ8bRvDa/aivjj5zu9LJiSDOl+Je3A9xFfoX3xwzKM/Nj
 1zg4FILA91O8F9FG8+I6pLv0QtqpBdZajUtL0G3H2BbMvewvryH2PSkSe
 QO7bKt3U/om5Ywow6H4V0YKgW1p/kqYlPCrUogFcZ0ZF7WcygY/Yq2MXu
 i1AH5vz6HSGk8ZhAGsig0XteaVqAWoSNWr2yU7vY5RfRnEw3Op/yxGu/2
 RWcb0PPZS2odYGsH96+ysaiAuB62jah9YtFmXzWL+IqYLeqWGfOUFlNxi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281690013"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="281690013"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 06:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="747047093"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="747047093"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 27 Sep 2022 06:55:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 06:55:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 06:55:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 06:55:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 06:55:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Brg0MlmHpdnFGKQFRpsSQ/1EOrsEv7UuMu1YhNQz4bj37VBcIXXyZ+2r9eyFQ5QOry5NE0+vJfj7amDoDd4ghSHlrcm7ZvOWg4VPuAaevFMDNzqcMN58rzaOohThWFWPeOZHxDFXhCw8r5z0b86BZGp0IpRHkFzk82ezMYxltUzuKV5T5MrPQmfAHTT7P2yD9eLTIuKpwSXGfb5jcy+9C2VRGorwbKEcBut07I57bTYEAsHfJBWdvqmExZ0eqh6+8ZOIwsQxH6DqGTs6xhnpFai5mbSmh5rQrzesJwMpZEaQRoPSpoFjxLq/rA/S8G90HEeHTujJXHhgV1AdKGUN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8bDNxudfSFdYi8dNUmcBU9/xYz6/WyEpicH0XnGv0o=;
 b=i/G6Td6whTF+37Fne87lrI6XX+j52Mb0Mjllse/96X5RJHG5ZMT37VdcKApfluFOn+W7AhJCr0Uh6xJrnIS4QWKSRsv8doSSpXt39GT4/kqgP6BCC0Mr65kMre8vSlCqhM8lDPnwhz3MXJOGvs6ysRyz5Bspj6oA45Oe+iKlYaBmxN98/1nPTLu7XY/zsiFwIvdeywRTipOvSgGSR92TC035kqV3ZNRi6GyG/ya7a0W0at1rQCKI8+dv5Cl++WvfJbiSVLW54s/X4JQ8EPrJ8SOb8Z+owjW0Nyl9wcxeeN91THrZWZ7aO6fkx4fcIw4Dz9ozK5sXfkGiSI711GggPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 13:54:58 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::3a13:6e49:f5c9:acfe]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::3a13:6e49:f5c9:acfe%5]) with mapi id 15.20.5654.024; Tue, 27 Sep 2022
 13:54:58 +0000
Message-ID: <1facc768-f4de-aebb-8206-186fbb45db70@intel.com>
Date: Tue, 27 Sep 2022 19:24:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 6/7] drm/i915/hwmon: Expose power1_max_interval
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220926175211.3473371-1-badal.nilawar@intel.com>
 <20220926175211.3473371-7-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220926175211.3473371-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abf1a24-0c39-415c-0efd-08daa08fdd4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdDAnjkCR25YWfhQx9IqusNDKvJ3dezyb5Xm/ntbS4zVOvdN8USikV7Z/PYr10zlUHa7/tDDmXYpE8ov/rCbVj+sbaIhbP374lNDmeAI4L0w+XnwFd/IOK8Vbt0aIhv3a82F+soWMzftMsmpQYmALuLW6tBlTFhmKh1Qv5vxYhFegDMiLQn885v2wDR8dCZsmvwRTUc7H7IUhC78rugWqjlJ/p4ZmGNPwFGWGoWCpZ4EkGTAqn0E6wr8ngsC2PKYnDdukhvaYigOQbI5cAvpypoMxcX1KMmP5kEZlIRTniOevYLOxdHAFDols0zSCDts9PgzkW2lpBU/Yby0y8VYecApDNOytLb+alJLqjFVldV/rLwu5J8O/GZR880vTgJehrmhTecfNZqw1xsq0pcrmmmpMVj7uCHrqO8alG0mlCt0M/089StoMXLSqo7jFjmh4bESW2V0Vw0p3ew+suVL1AJIJP2T/JlAFK2a+6ExapphmuefaD0zcDkaM02s61+oTbi5KNLiAk9ZFPCzB8SycbFX++0c/iM5Fdukq3xV92NFUtTsgL45Y2zbK7Q8IJrib08s9qLa0gQaGpsC7w2Y9PRs1e+YGoEk/Ry8Jw3oIN+PVeXC8tTYUTHPqzCPCSdg3LLRngvqAkwPI9Urnedkg4JzwvgOIB/W6vSUWie4TrDV0AIVIevnIfPY/d4M1ORjGMLGvC7qcrt3d8fLCD0IwQrlxCq6N1TnBKR4BqyVecsRZucvVPQCWsIOQVQHF/VFeBqWPI5Y0BrCNDqdAH4smJPi1uwK6vZC1dcurVbbfus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199015)(31686004)(36756003)(26005)(41300700001)(107886003)(6512007)(186003)(83380400001)(8936002)(2906002)(86362001)(31696002)(66556008)(38100700002)(66476007)(316002)(8676002)(5660300002)(55236004)(6666004)(2616005)(6506007)(6486002)(478600001)(66946007)(82960400001)(4326008)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFNkYjFhT3pQdUs1TDlhQ2lIQjJsak4raTdqMVVMTmorRlFMbXJPSXpVdEU5?=
 =?utf-8?B?THVXWkxOc053ZlN3VzJ4VmdUa2dkQlIzWEZjSjVEMlcva3ZUaytacWh6dXpu?=
 =?utf-8?B?UVBmNk5tN1J4UnBidi92UTQ4QWNESUNyRHBJU2EyaGVwa2ZRNjNoVkJybEx4?=
 =?utf-8?B?cmo2REJvYm5XY05KSWRSbUJMWnVoMDRXTVk2Q2VwK0ZwNWUySlU1R1JSSEc3?=
 =?utf-8?B?UHhEb2R3RG02K3phbk1IZUR1YTBKTVNidHlhbTBVc1JxY3FwRXlXRTZLWXF4?=
 =?utf-8?B?bmdoQ2grUVlIK2NxcjBwVWhuRXQzeDFUbHhwOEEvS3hXYWorSC9vSE9DU2x0?=
 =?utf-8?B?aHI5SFdGdjNFZnhMT2oyK2ZNMEoxd05rTGVmQVRUcEU0cEl3bklmbW1rYkxq?=
 =?utf-8?B?bzhsY0c4MEhrMEF5ZitNaEloZXBpa1IwQ0RwQlUxTEVJakhKTEJYeTEyWTVO?=
 =?utf-8?B?blMrU0NML1ExOS9EZXV4RGxtQzV0MStpa1U4UFNheXJTcXRjeDBYd2Y0dDZ2?=
 =?utf-8?B?QU11QmVpNDl4VWRUMkpGa3o3S3B2WVFpd1RENWZabjloWXk3bHRFN3FEYjZl?=
 =?utf-8?B?SFhaTlB5cVVKTURDMHFtSDFONEZTV2I1azJ5Z2Z3ODB1czJMTWxOc25vVWJo?=
 =?utf-8?B?bitkZi9jMUxKV0cvZTU5VHlCOUhoUExKazIrNGZIcTE3ZWVLeUREQ016SHly?=
 =?utf-8?B?eDM5QmhqWWFsZjdQUTJaSG1Rdm5Rd0dFMERyTEFwejFHVG56S0lIdXNLbjdH?=
 =?utf-8?B?L1FIc3NUWmc4UHVRWWF5K2xYSFVleWlLbmpEQnFjUzJDQXpkN2hnL2w0K1lq?=
 =?utf-8?B?QmJUQXpqZ211aHl1VmxoUUhWaTA5Sjc2QjJQcEZDNXdXUlpBYm4zNEZDdEd4?=
 =?utf-8?B?eW9mZzA0Vm5MdXMvaktqMXUzOXQ4TUdhNjIvT0M1K0tjaks1d1FxYTNSVkNG?=
 =?utf-8?B?a0tZbzNYZWlXakxTVzNsNDFkUUtQdG56cWtUYmdhQnZiZzF5KzdWQjZlNmxn?=
 =?utf-8?B?eXhXa283SFNiNGJRMXljeEdkUlpac2RnUW9lSFQ2WFVLK2VRVW13QzJYQnBr?=
 =?utf-8?B?MkhBTDJSZndxN1N2NlZQSU5md2NoR0VDcUdwTjZ2MTZCRmVsNStpL05zK1JQ?=
 =?utf-8?B?bWx5RkM0UXZTQ1k1M0E2U0x0ejNrcUxDWHBDQ3Q1WmVvak9iZENraW1UTzZK?=
 =?utf-8?B?aHB2SHAvWjYrUXE0WXozWlFVS1NGTmg5WVhIeUl0OUhxTzNRamtzN3pkM2Fq?=
 =?utf-8?B?SlMwQVRSQjhBM3VaK0JCN2FmRkNHZEp6Vyt0K2U2Q09ZYUhyUlArNWRBMEYy?=
 =?utf-8?B?VVZpS2hESWtPa09WRGtFVi9SK01iRnRnZDBOQkJSMFljNXMram04bk01UndE?=
 =?utf-8?B?VUlrTVhXSDFaaERDZE9vL1I0Y0tlcFE0bHZkbEVMY1ZLQU1iUW5PYWpmNXMx?=
 =?utf-8?B?Ui8ySUVvZEVLTmZZZ2F6Zm9OMEVoOEdpcWVkZDN2eFA4bmQybEI4UlNRWXdm?=
 =?utf-8?B?Tm03YU9lZzZTVXp2cmFkUnhMNFdWdk1YaHU0UXFRaHBKU1VWSGo5VTlid1RS?=
 =?utf-8?B?RG5zNGhvSlN4WXR5b1dvc0owZjNFMHVqWkg5Q1d5T3hSWGpsN0d2YS9HRU5r?=
 =?utf-8?B?aWxnSzRZQ3BXMXVkRlMvYXVnSWJyU3g4eUZvaDBNa0dRWll1QXFvb2JlNjcz?=
 =?utf-8?B?Q2h0STRFV0xTMGdwSkxBbEJJcS9FRHFEUG04NW5UcjhsN2hrYWhTc1Q4N1Aw?=
 =?utf-8?B?REdFNnZkbXpqSlRRaHc4SmlWeXp0YnB5V2kxdE5ITWtuTHZKT2ZnTWRZWlU0?=
 =?utf-8?B?endwNlBnVk1MRE9DZXJaWXF0dmNpL0NVTTFleXJDR09taDFWRjZGVUtFMHZk?=
 =?utf-8?B?eVNpdDA3cjYwS1kzRlQraE8rbEI0YXdPc0ZpSG9wUWlwNTgvSnVoSTczTVBy?=
 =?utf-8?B?RFJ6cVJTcUozOUdwUitYWFVXZGIwTUcwRFFzZnRPVFBmQUIyUEZnM1hlb21k?=
 =?utf-8?B?OUZiRzlIZWxjSFFvUWFlNTlTaHpBN1pZMmh2cDZrQlVuTlBiK2FVMmNxMTVz?=
 =?utf-8?B?bm5sN2cvQWs5NURMY1JOY296SFlGUmdvNEN1bW8reS9BZzFaM2FvWWdlOXlZ?=
 =?utf-8?B?cnQzeWNBT0xQUHIrNGNiKzliblBiWThZTjdYem02ekZGRUEzd0hCZ1lUT01h?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abf1a24-0c39-415c-0efd-08daa08fdd4a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 13:54:58.3181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRmvYfPEYMdfUdzN0KTzbLBvfASpeTVtQClbjRKZketD1wmBzB4WZTFxWUYHZ8kjYIxqi5i+UffsS15LRkHHXGmsP8rEorHNOFLAbp2XsDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
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
Cc: linux-hwmon@vger.kernel.org, andi.shyti@intel.com, tvrtko.ursulin@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/26/2022 11:22 PM, Badal Nilawar wrote:
> From: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Expose power1_max_interval, that is the tau corresponding to PL1, as a
> custom hwmon attribute. Some bit manipulation is needed because of the
> format of PKG_PWR_LIM_1_TIME in
> GT0_PACKAGE_RAPL_LIMIT register (1.x * power(2,y)).
> 
> v2: Update date and kernel version in Documentation (Badal)
> v3: Cleaned up hwm_power1_max_interval_store() (Badal)
> v4:
>    - Fixed review comments (Anshuman)
>    - In hwm_power1_max_interval_store() get PKG_MAX_WIN from
>      pkg_power_sku when it is valid (Ashutosh)
>    - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
> v5: On some of the DGFX setups it is seen that although pkg_power_sku
>      is valid the field PKG_WIN_MAX is not populated. So it is
>      decided to stick to default value of PKG_WIN_MAX (Ashutosh)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
LGTM
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |   9 ++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 115 +++++++++++++++++-
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   7 ++
>   3 files changed, 130 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index f9d6d3b08bba..19b9fe3ef237 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -26,6 +26,15 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel i915 graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
>   What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
>   Date:		February 2023
>   KernelVersion:	6.2
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 2394fa789793..641143956c45 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -20,11 +20,13 @@
>    * - power  - microwatts
>    * - curr   - milliamperes
>    * - energy - microjoules
> + * - time   - milliseconds
>    */
>   #define SF_VOLTAGE	1000
>   #define SF_POWER	1000000
>   #define SF_CURR		1000
>   #define SF_ENERGY	1000000
> +#define SF_TIME		1000
>   
>   struct hwm_reg {
>   	i915_reg_t gt_perf_status;
> @@ -53,6 +55,7 @@ struct i915_hwmon {
>   	struct hwm_reg rg;
>   	int scl_shift_power;
>   	int scl_shift_energy;
> +	int scl_shift_time;
>   };
>   
>   static void
> @@ -161,6 +164,115 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
>   	return 0;
>   }
>   
> +static ssize_t
> +hwm_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u32 r, x, y, x_w = 2; /* 2 bits */
> +	u64 tau4, out;
> +
> +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +		r = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
> +
> +	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
> +	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
> +	/*
> +	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
> +	 *     = (4 | x) << (y - 2)
> +	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
> +	 * However because y can be < 2, we compute
> +	 *     tau4 = (4 | x) << y
> +	 * but add 2 when doing the final right shift to account for units
> +	 */
> +	tau4 = ((1 << x_w) | x) << y;
> +	/* val in hwmon interface units (millisec) */
> +	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	return sysfs_emit(buf, "%llu\n", out);
> +}
> +
> +static ssize_t
> +hwm_power1_max_interval_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	long val, max_win, ret;
> +	u32 x, y, rxy, x_w = 2; /* 2 bits */
> +	u64 tau4, r;
> +
> +#define PKG_MAX_WIN_DEFAULT 0x12ull
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * val must be < max in hwmon interface units. The steps below are
> +	 * explained in i915_power1_max_interval_show()
> +	 */
> +	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +
> +	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
> +	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> +	tau4 = ((1 << x_w) | x) << y;
> +	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	if (val > max_win)
> +		return -EINVAL;
> +
> +	/* val in hw units */
> +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
> +	/* Convert to 1.x * power(2,y) */
> +	if (!val)
> +		return -EINVAL;
> +	y = ilog2(val);
> +	/* x = (val - (1 << y)) >> (y - 2); */
> +	x = (val - (1ul << y)) << x_w >> y;
> +
> +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +
> +	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> +					    PKG_PWR_LIM_1_TIME, rxy);
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> +			  hwm_power1_max_interval_show,
> +			  hwm_power1_max_interval_store, 0);
> +
> +static struct attribute *hwm_attributes[] = {
> +	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t hwm_attributes_visible(struct kobject *kobj,
> +				      struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? attr->mode : 0;
> +	else
> +		return 0;
> +}
> +
> +static const struct attribute_group hwm_attrgroup = {
> +	.attrs = hwm_attributes,
> +	.is_visible = hwm_attributes_visible,
> +};
> +
> +static const struct attribute_group *hwm_groups[] = {
> +	&hwm_attrgroup,
> +	NULL
> +};
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> @@ -472,6 +584,7 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   
>   	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +	hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
>   
>   	/*
>   	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
> @@ -510,7 +623,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>   							 ddat,
>   							 &hwm_chip_info,
> -							 NULL);
> +							 hwm_groups);
>   	if (IS_ERR(hwmon_dev)) {
>   		i915->hwmon = NULL;
>   		return;
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index bd42fb66e297..64aa1e9be463 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -194,6 +194,9 @@
>    */
>   #define PCU_PACKAGE_POWER_SKU			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5930)
>   #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +#define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
> +#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
> +#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
>   
>   #define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> @@ -212,6 +215,10 @@
>   #define   RPE_MASK				REG_GENMASK(15, 8)
>   #define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> +#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
> +#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
> +#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
>   
>   /* snb MCH registers for priority tuning */
>   #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
