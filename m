Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 675035E5BFD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B0210E5B1;
	Thu, 22 Sep 2022 07:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1303610E5B1;
 Thu, 22 Sep 2022 07:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663830802; x=1695366802;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M0nDP35vZcnUM0X/pJZaeeVKFOZ67lbRzhMhAq3kdN8=;
 b=Su7aUZrBp+G2jxvhyhbSPbJT4u62LXEpGmhxtcZsxEolzrqQu9a/ZzTH
 IWgyvRy8x9Tc46fUqPkWEnNX2H/Y49+U9wRMvP4+vKbe8pCe7CKbqjWkT
 M8USlqIjW77g5qe+8nWsghzhJTh8MShAQpL9ARiqK1BnNiyLBYsgVVIej
 IeMBftWeqglciYWHRErRBxGqD3ZPC+tzCdx+o6GuRbDj5zltgDexf+ybo
 2WSolYbRMXv72xAruhb7ZPxEqamx88qp4mcIhnt72X0x0OX5vLkD2LJSc
 Z+9c727QsboiUjq+GcGoU8AJ6JpKXqKvyid5cay6AUqWjQVjlmWOtb7jU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="301066609"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="301066609"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 00:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="619684736"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 22 Sep 2022 00:13:20 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 00:13:20 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 00:13:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 00:13:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 00:13:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvpDthVmk3Anh5rmlWLgY+cv9g/9EegJ6ha8BTsJuorC++y11RS6NcIunhqLaIHDRX+xp3+TNBAfGGncXOVug7HHSNQH6xL7K5UKb/MMPgS2CoUDIogzms8oTVOQM/hdOwTGCg/eQmfucc+3noQ+CSluz7kavwApkFbxUIBS/Ifq17jXroxx6BFEYj2nETVRNdqxtyzfxubBSqtQebfFt8vLxhVjiyMPcHScPQVD+zy6gdyrpLtD4PAilXpGXUe2rkVKlWJ2hsC2wM1F6RHQW+qUJbGfy+c1Hth3FPIWZT0OUA4cSYhr+A4MQsChlYZiziCq/NgMiGf6SiC5iiFdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOYDVbSgTbG/nHKP4da4FuJmbnpBIIOJfXI4auLZITA=;
 b=L9fB8HmqnEivw09sMNcuq5Nz6gGwemaDhYY+arElnWoNjfj3SohKEHDFoP55HUdsHhdkyhXmAbgZazJxF6nW70Ce1Pfl27yOWPoi9tYJzKsfHU9j1WIQgFkQO47kuUzxJOt4BStowjbpjgl06m/wlBvmKjhpGW33lwSnG9xGv71cm0wURkml7O/ey4gHKUTxLaBRAfH+rAfNuBlh+3gyo+ogUZKC6sMM1+KrKoByaBzNdwdvNDZVwv4mqo2Kh0brKQsyniSGlFsKzyT3i9bq+vvympQjKwfYdcm2G387awYJVbvDzKbz2o9eqbta9vGDx+ghJIZp7ZgNzdLJgzexBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 07:13:12 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe%4]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 07:13:12 +0000
Message-ID: <c9a6af40-2f76-e8a1-8b7b-812fa5dd5fff@intel.com>
Date: Thu, 22 Sep 2022 12:43:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 6/7] drm/i915/hwmon: Expose power1_max_interval
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-7-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220916150054.807590-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::21) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|SA2PR11MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3a3307-8dad-4d4f-096d-08da9c69e8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CnpuQy8CAuFRB42Jy7PpPYZ1gE29xj91oF7z3WwDnz/KCqAitXYdCb5tltqugTSMJWxdhatVswrpDGucwBA0r6BwNd1Zx/0bDjvo+Qc9NFjgei9xvx1dISo0Mgqe3PSEiSJYJVXi00Mo47yALv19GIWeG8fnSq0axLMtXT19cxphXFV/0As/FfQwAWfS/GqGY+d/ocme82ZaftpoE4f3EN4FvgmjuUMqMO+vxvpywgphh5h/2S1OhsOoI4SkYkRQTd5ZpxKS8K7f/S2zZ5EfYYn4KFdDYVwx+4gzQjRSwIOFjPumcuorYiQJHBz3AenHkkpdcgn1nlu0SpsKw6h6PFAvPfkPd3f6uiZzEHT0U0pNHwgjJ87hHlu9uhClJWP3ugb8JTbRPtZMJhQV/OroH1LRxc/kdD8M4JUayPiW8krz9J6XQfcEvonbRvZnwS5P1JBE3tGJl00bawMuTuQII7xNtaYsDdCkgPKpjiMrddC7pUtEwSShBBeibSuziVthIt1fWhutagFf5+JxGjcb7O9Wk9Rf++t4UnDyph5Ughf8twXyrjCotVfeIKMvhACeJWJXV9u/dEhxnxr+IsQi9LzhbNvdtYOF/bF0poYNNtq6IeM+ZM85lE7qqkyUlSgEFoJ3jrAMMXEAEaWZ3FqC4gax7VS90TIWg7uyrAGkRStDTdWZf7KddACUBbtIXK8OzReliNVwF19kiHGVLe/YI1EFIDaBxkfzDoY1vfXeIvzeQzyGdAZ8eqIV598ETiswnyN2uqyDVemhYGdAfMdAuc0ojiuyqTAh6ZllH5+/vuw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199015)(31686004)(66556008)(66946007)(83380400001)(36756003)(86362001)(31696002)(38100700002)(82960400001)(2906002)(4326008)(8676002)(6486002)(478600001)(41300700001)(66476007)(186003)(5660300002)(8936002)(2616005)(26005)(6512007)(55236004)(53546011)(6506007)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Unl6dFBIT0dWV2FlMlJMVm5lYTNKSk5kZU9jSjVJcXl1R0NmSUpYV245TTFZ?=
 =?utf-8?B?a2lMREg0eDBEeWdsaVFMb2p3WFl2YmNZT1ZZUVNiTnN5WWNVcWlDRjIzMVBa?=
 =?utf-8?B?cmtGOUR1QXQwU0xjb2JhQm8zeTk5MVYyOVIwenJFb01ZRGFGNG91a2xpUkFm?=
 =?utf-8?B?aEVWRG5FTFF6WFh6a2RQemVPb1Ryck5ma2pLRWV5QVZsK0g5emJHaFdJamh5?=
 =?utf-8?B?Y3NTYmRuVjFQWmsweW1QbUk3T3JoZWZreEYvTkxMQlJSbUxlNGdTb3FhVFRQ?=
 =?utf-8?B?MFhxQ1dYZ2kyNE5TbHJNNDhYV25MSkplYkJKSlNKK0pCaUxIMnAxaURGLzJB?=
 =?utf-8?B?dEloblkyNWZTRFhjbGxmSll0M01wSlgwMG1tbVRPaStCNkJtc0dMc1ZPSktO?=
 =?utf-8?B?K0g2K3h6RnZKakM4V3VHODhHLzh3cGdmWndCRGVCY1h4MTVhZ016YTYzT0wv?=
 =?utf-8?B?c2NwRlFrRkg5RlBKdzJSSkhSeGtzSTl2OHFhL3pvTG5vNnJmWEptMTkzcks3?=
 =?utf-8?B?YktjRFVoUHBwYW5RVFltNFpvTUhJVE9iTDN3NU8yZUoxS1pKdTRFbVF3MzJI?=
 =?utf-8?B?SXRvUm1aSXNMc0VYWVJkN3lhMnByS3VYL1IvRk9IZWdSZ1JFNjhvZDRJOTdi?=
 =?utf-8?B?ajV4bDVFLy9RWWxBS01HLzZsZVVsUkh6UmdPSVpqSmJTRE5DWE9aaEwvWm0z?=
 =?utf-8?B?YzQ4dStjRjFnVGVYVDk2eEIwN3RYajJQVGd6NVEwbnNFQXA1aXUzcUkrVFNx?=
 =?utf-8?B?U1hhclhVSDdSTGlzYkt1T1pBWmxBb3JycjNPWExlOEFkM25rTHhQKys3aGN5?=
 =?utf-8?B?VUY5TCtLTjV5R25XeDJmcG5uWVZLS1M5V2tySTFrRG84bGw3V05iYkxVdzVv?=
 =?utf-8?B?d09RSkFmd0NIV0FMbUVkM3dxWDl4Tk1xZm1CZ3hVWnM5Vmo4WGw2SHV2TTdZ?=
 =?utf-8?B?cWt5Tm5FQkplKzRNUzc4Vi9KMDN5cW5JN0VCd3hIaUFobHpkcXQ4czhweGc1?=
 =?utf-8?B?WFFkQ3ROMjJDLzhNdVJDbHlEVzBVS0VoUk9mR0ovZHBOT29US3RMMUt1eDZl?=
 =?utf-8?B?blVuejErbXAwU2p5ejlKRXEyZTNXc1UraVczWE5WQjdPamZMcVBrdVNMcG9Q?=
 =?utf-8?B?d211ZGJRVzdkYTZnank3eHZhbDU1NzgvSUMzK1ZqMS9WTzJBTmNpMlFsNEx2?=
 =?utf-8?B?NkFBQlN5YUhvZEppQ0NQWkV6VjQ5Vk9hZ2V2MS9NbExBK3c4SWllMHFIMm40?=
 =?utf-8?B?azVwdk5sS3FZeHFHTmFlQXI1WTJqdUxDenp4MENRMWVGZy85Z1hMTnpLNUFn?=
 =?utf-8?B?aW96V2lOVkJDMlpjQzRYaUdINklKcWtjdm5HVGRreWV0N0ZydTNjemZWNHM5?=
 =?utf-8?B?RjRnVWNITTJ1Y2Nya1AxaklXV0lPS05hcEdYU3NNREhYendqWFlxaGloanV4?=
 =?utf-8?B?dk9vOGp6MnJJMzlxWHVvN1loME9TNDAwUzVEWlE2RlFIUmVqdERWZ1VnMUhl?=
 =?utf-8?B?cUhXZjAwYUJxYzB4dmI5M3BoRjVvSEpYNlpOV3IxTUxQdDFhRUJ6ZEp3QXBH?=
 =?utf-8?B?VlYvZTAzVzN6dFhYY3BaYmlsTk5jbHdwcEp6dHZzMEF2OVZ0eFJaNERsYkM5?=
 =?utf-8?B?U0pYTDFabEFQdEErRTVuMlprS1VpelR1U0gwalpvUSt0L2VDNHpZWGUwOVlE?=
 =?utf-8?B?a1R6NW1wVUNvYS9hRmFkL0IybVFLYWgxL2V4alp3ZkZRZUFtWkxRMVg0NnJ2?=
 =?utf-8?B?TjV4c2hGTjFhRUE4UU1samQrcjVBUmlkU3E5OWJUeTBGc1o3TWtpcnpEcmFw?=
 =?utf-8?B?NnV1ZDJGaTlKc0hYblBzVW5yVEEwRGxvMVFMMUJlZUo4UFlFQ0xYVkVueE5h?=
 =?utf-8?B?K0tRaURSaHRFemlkZ1IzbGxPUTh2bkxjYTlkWjZxanRsS3Q3OVZFQTdPUEE4?=
 =?utf-8?B?TjhGU3paOUJCMlpSK0t5bkFpVWlOZnY1eTlFODlLZktyQnhsY1VMUUNxQlpj?=
 =?utf-8?B?YkFZQXg3dzdZZzJZR1ZGR0t4OHZjWVlGUWtXNXNGa2VXcmJ5NmMycXNGYWNm?=
 =?utf-8?B?VE5ieG5PRk5wM2xrU2lXTWlXWDNVMWQxcnhHT3N2amNKNG9WNG13VzFnSjZE?=
 =?utf-8?B?MzltOStrVEw2eFpjWFNZTmQ2VkpvUDVRcG9Yd3ZvTWRKbmZjM3hpSnZvUCty?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3a3307-8dad-4d4f-096d-08da9c69e8da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 07:13:12.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTSrtQVZ/oPxoI8kHZYaXmgnlvtDOOBuhTI0jt9h3xSD6dGS5NZJKWgUKShJnb3LsweJKbGB1QDLPakrRfDb9dKSLmfs43qz5FrvajAB7pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
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
> Expose power1_max_interval, that is the tau corresponding to PL1. Some bit
> manipulation is needed because of the format of PKG_PWR_LIM_1_TIME in
> GT0_PACKAGE_RAPL_LIMIT register (1.x * power(2,y)).
> 
> v2: Update date and kernel version in Documentation (Badal)
> v3: Cleaned up hwm_power1_max_interval_store() (Badal)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |   9 ++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 114 +++++++++++++++++-
>   drivers/gpu/drm/i915/i915_reg.h               |   3 +
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   4 +
>   4 files changed, 129 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index cc70596fff44..7995a885c9d6 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -26,6 +26,15 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel i915 graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		September 2022
> +KernelVersion:	6
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
>   What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
>   Date:		September 2022
>   KernelVersion:	6
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index bd9ba312c474..7d85a81bc39b 100644
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
> @@ -161,6 +164,114 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
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
AFAIU we need to read r from PACKAGE_POWER_SKU reg untill unless it has 
some known issue?
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
/snip
>   	if (IS_ERR(hwmon_dev)) {
>   		mutex_destroy(&hwmon->hwmon_lock);
>   		i915->hwmon = NULL;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 956e5298ef1e..68e7cc85dc53 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1811,6 +1811,9 @@
>    * *_PACKAGE_POWER_SKU - SKU power and timing parameters.
>    */
>   #define   PKG_PKG_TDP			GENMASK_ULL(14, 0)
> +#define   PKG_MAX_WIN			GENMASK_ULL(54, 48)
> +#define     PKG_MAX_WIN_X		GENMASK_ULL(54, 53)
> +#define     PKG_MAX_WIN_Y		GENMASK_ULL(52, 48)
These GENMASK fields needs a reg definition.
Br,
Anshuman Gupta.
>   
>   #define CHV_CLK_CTL1			_MMIO(0x101100)
>   #define VLV_CLK_CTL2			_MMIO(0x101104)
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index 1014d0b7cc16..9331a3c15fd1 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -206,6 +206,10 @@
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
