Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64A6A6B85
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 12:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCBB10E238;
	Wed,  1 Mar 2023 11:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8147410E238;
 Wed,  1 Mar 2023 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677669240; x=1709205240;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RtAoJk1u1mF13ftWsnYxjoHfYIwRl8lInmgOgrKKnAI=;
 b=hX0JAr6KGLHILDcYboBAuCa23plIg5A6a3EKjLHIGsWHpD0sq4n3nPt3
 QjIv6WnR4uc94/zMMrvlHry3IHsxMsswp4SoNmRKeVPrKf9DSuJewBWEt
 LzBf32eODPJzA6Mnkm2cBCzdToLPJv3S3rhejKuDQv+5dhH4v+crk1fuC
 WUMOuCB5Ybx82rOLzi1AinHMrMxFZEkHoibr8Gh3pmFJAyZh9yJGv6QQQ
 /j/9Cs/9SzfIY+pdP9NQgsVI8yERicRjuqa++3iH7Ltu/PCI8Jm1V4opd
 TWMHET0AYYMDQzWOvZ48GmX+5xQUdQj6hZRZ3CCY6PXvsir4epesruLnu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="396948874"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="396948874"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 03:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="848609540"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="848609540"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 01 Mar 2023 03:14:00 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 03:14:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Mar 2023 03:14:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Mar 2023 03:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKaGWf4Gasa+jGHZ5HuHZ9qlgsd9o5yK2BlcepG/fYWhc5XrC/rrNUEgyYnufssRn6xOI8rO1uvpCf1jfAU2SiLM3gLN2o2g1wlxRrdQQhrWQpC37j5R+9DxVBM1WaZPlA5zG9xFrwkRp3r2ewpo42b++I0paCS8GkVNr4V+EeL6zeViKOlNuM0+lzFMMShThqiwn9m4RTtqYmGvqWGMKelpO2oAJq39JNUpX60ap5qKho9utaigsk0GNk/DJ/IOacCyLQHfAHq7L9wN9doUmKpDmhBw+m+vljBFa8/2VtZlH1ls8fwonYxiTCezksqoEwEdo1uw5cwJJdUb3bVy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmISOO+om+Nnc8SUYJ2D9hxWWp/i35Zrbp93B8MaDVo=;
 b=f9cW39TNCzqXE736hOl4LYNl/6nknGeXNWWw1DlpPdHUwovxTOoWfNtDpb2UwEhEL/hKfj23KaUTT4oL6bROyhX8iKOmUdo8jvitAyVSKrPm9rP/3pjGaagYABDwGQpGEF6a680tFAkxINGVhiRUXOGVxgeYtEdBnvBPCYTP5m+MpDORMPvTFkvhE4GQvXW7uM4SVGXv6uYcd6vNgOp8q5StaKV8DgBUKqdgkEcAzOzt4Ebv6E2CnlE9BRsiYXtoUiDrMDviKJokatJSFPaNuaawXBoH8jFiKredmDF4nb+TnLE/L6lNaCwnBGkDw7RAM4tpqgwntzfj30as8rLtQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 11:13:53 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::ba24:c771:dd96:7d68]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::ba24:c771:dd96:7d68%9]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 11:13:52 +0000
Message-ID: <3c079b18-78be-7bca-da60-0805058447ee@intel.com>
Date: Wed, 1 Mar 2023 16:41:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/i915/hwmon: Accept writes of value 0 to
 power1_max_interval
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230228044334.3630391-1-ashutosh.dixit@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230228044334.3630391-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a91ade2-a41e-4a5a-3828-08db1a460a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cxh1tSB5WRjJOyE8CjbGgtw7XTqzpSuqRp3aLvLUS2uszc0VIfAqzamUffywWCavcWSrn/mjj6RItcsyNxhqXXPQqUPooxB0GpkGwv5pTJe9fTApIStAWhcED3VWR5vRIzkQcdxVdp0NAUkRo2KaS0PYmMbbZ9IPYJJX44MFPBG3/Z01y4NxHsN5yOTiKPVHb4D1P23menpIhgsmwGb72xDIa9XWODOINjhUQD56aO6ZLEiwyabsWw7QkKIsz5wUfMcHXDeG1NXgZX1aSETQE4Ffk28wavSrGOZfkWBLg134QJz3sweAjgj2KEZa6S4zLV/VxG7PLm9LGBjT6M+vZKxUvFLG9Vx7miiyzV+BG/1Y5dmBkfsi8ScIqVuG3X9htpsbXPAEPpo7OEAc+Rh4xk30ZoFLsjFg/Jnwg+Hgnq2fH9wEK1vekxPd6UtW7+OaEj2hEACISv5oSEciXWlyl/7eTO00v93ja3ioVwPVxQzwJLtVrl5z9Qg6488phFVqiurnZ+hVYZuP5LNCt5YZTL+o/WSOsxLbh1VThy8nfwoLg3Qv6I6nj57sH9+qb0QqtUzEK89D7hAJ59HfBX6JzSu5mVcnx1bjvt7OW8nzWJJSuDxnKrGm7I1pDfhic5pmHuhsX0g7/XQ3FcJbR4zEE882+GYPZTS6+Q2DfC/ov2EFCc7vBDb+Bzixw99423MR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199018)(36756003)(83380400001)(53546011)(6486002)(6506007)(6512007)(6666004)(966005)(107886003)(31696002)(41300700001)(186003)(26005)(86362001)(5660300002)(66946007)(66476007)(8676002)(4326008)(8936002)(66556008)(38100700002)(450100002)(2906002)(2616005)(82960400001)(316002)(478600001)(54906003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlRoZFlTSzhZeGEyajRQWFdBek5IbWY1ako1NS9Lbmx6RWJWMEZLN2JDdUtE?=
 =?utf-8?B?azBQak5jV0x3SzZ0b01oZlBQSnlrd2JZMi9sbWNGcnhrSzR3ZittQzljc0Rs?=
 =?utf-8?B?V0g1dU5GZkE3NDIwUVlCdXF5dkZvSTN6YS9hQzlDbWNqVlNqOHhNSE5qem84?=
 =?utf-8?B?MG1xS2ZlbHhLeFpjNnRYdkRWZGxxTkhYS3VGbi8zbm1QVkdrV2JDZ3ZQN1NN?=
 =?utf-8?B?dGlibEU3dzQ5ejdqb1Uwckd0ZFRSRDZoSElRMTRhY2FaMG55akJYMSs5OXR2?=
 =?utf-8?B?OFErRmd5MnlZS1dNUzROOG1oYjB0T0k4cEFqdnpQeFBISHhGaHZBcnhrckc0?=
 =?utf-8?B?YUg5MzJXWnV2TXZSQTFCRmE4UnFlMGc0Vnk0RkVvRG5PWFlJdXRHcVo3Rnl6?=
 =?utf-8?B?L0ViUkhBWDA0YWo0TjJSQ3JRdHNTb0FwRGhjbkdiQlBua3NJU0NTUmZ5cE4w?=
 =?utf-8?B?cmN2cFFKUHNabkRDalY4cjlZNHFLZGFQY082aDJKdjU5NVdFTnA1V0U1RVlx?=
 =?utf-8?B?bS9CTGxzQk96WWEram0xU3dZQzd5UDVyRTVZSG9ZeE1yS0xSUUN4azl0c1cy?=
 =?utf-8?B?VmN3WHNmMUpZWkRFRDRIMnh3QUpRQ0svUDd5Tkh4WENMWXc2aHRjQk80ZXpD?=
 =?utf-8?B?Slh5cXE1RGRYbFlkQkdUUWFaR21XWnoxREhRR2s5elMwdklNZVJvakdMbDFE?=
 =?utf-8?B?eEZ2UTBXd2JyTUE4UHAwdlc2Zzh4Y1RFYVhzdkRUZ0UzNkpMTElHei9IRU9z?=
 =?utf-8?B?NWVsdXBXSkNaeHV1WEkzbnordVJmWmF4aDVjc3dSMi84YTJXWVBWenJYYWdU?=
 =?utf-8?B?SEZJVzhnMEhldjVEMXBJQmlXYm1OYTVMUU5NdFpGMG5hR2QzZDZuQkx2Znh4?=
 =?utf-8?B?TGJIUURtZ0MzTDBEd2lPSnJjVlFWYmF6MGoyMVhlejVRUXljeWhwYWlZcldC?=
 =?utf-8?B?OFNiUEViN3FvczROUzlnNk0vazZSdU10bVF5QkpuZ0o4dUFFYURqeW5rcEM4?=
 =?utf-8?B?RVJwR2lDZ2VIYm5oYnFOUk90M3NYNXp4N2JhS0xwOXRGVWx6bERieVd0MnJF?=
 =?utf-8?B?WmRLa3pnWDUyOGV3T2dpZHB5RE9tRlplUUllWWV4OVdqOTltalB3T3B6aUUv?=
 =?utf-8?B?M3ErQTUxZjQzRUo5NCtYZUdmWjN3QVN3UlJTSFhKdFAwcEViMG5kUDFBVnhq?=
 =?utf-8?B?R1kxRFRqUXNYWWhjWGZ4WmRIVlhRd1ViU2tCcGhCUE1vemkvVjV0MVRpU0hx?=
 =?utf-8?B?Tk00K3lGODgzYmgzTVoxZUdKSTRpbG1lZllSTU0vUGJqU1BRNTdoUTNRamRE?=
 =?utf-8?B?dGtVb05XUi9pN1czUmZJOU1rZit3SmR1NVBReS9LdkFBTHEyaXJvdi9ZNHdj?=
 =?utf-8?B?Yk5BVGdzdU5HajIwS1FzWFNvVUJ3NnAzbGV3OTRiRUdQYlhnenMyMVNDOU1N?=
 =?utf-8?B?QzR0L2xPODFRMkg0K25ldkxraCtsYnd1RTVyZGQ5TlJ0R1cvaVV6RHQ0elVs?=
 =?utf-8?B?OXJXaDBsdmhzNTVraGg5RVRPQWxOcFNsSzRiZHM4K0VtbUl0QjBHNVNWcXRW?=
 =?utf-8?B?WHEvVlBpVkpjbzI4b3gzeEI4bzBtNXVTSlpMeEZWNVF4eFd1Ymprb3pralhq?=
 =?utf-8?B?TytNMjJnU0tEOXhKajlvWnc2aGs4TFJhOEJNa2h4MW9sbXZ2VDlhcm1KQk51?=
 =?utf-8?B?Tk5OZHMxcVN2Rm9BS1g5aGFCQ0h4RmNwV3ZsOUNBQ01RUlU4YS9LenlGK1Rt?=
 =?utf-8?B?YlJjek1vRmJ0d1hxb3RpTmlSNkFjVHVsMG1mbFFMSUNpQ2E5d3ptZUJ3V210?=
 =?utf-8?B?Ylg2bGJSaXFXWFJ4NUQwM1B5UndwMUgwaVJiT1lPaXpaVUpnaENHR1orMkV3?=
 =?utf-8?B?ZkppYllUYWlUZUdpcFBqM1QvOVAvRzdZQ3dZQUh0MjJIT04xc2J6UG1FdTVs?=
 =?utf-8?B?b0Eza0tvWTRUNUdPZFJ3bFRPZVdWcVdhelFHUCtIRVB5QXkwUkt0eVhZZzha?=
 =?utf-8?B?Q0NXL2xIMGU2cWIzMjlwQ0ZmNVkzQnBFeVRFTWs0bldaL2JPYjAwTUxTY3U2?=
 =?utf-8?B?VVRzUGZPV0d2a0Vjc2YrV1MzaytTcWZ5S3N1L25kZW4rS1JTcFpHWmZXVzNv?=
 =?utf-8?B?QzBhWkZGM1RrS3BpelJRUUYxWGQ3ZEplS1RUYmtpZ0hpbEVVeWkxeFpYMlVE?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a91ade2-a41e-4a5a-3828-08db1a460a47
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 11:13:52.7404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnMBdICgRa9cBORmoorOWXf9cHSHsQ2LzVF3G4Cpv3vaPTkSLGoyD5vFJuxbOcYeZeiiOcU2dk3VNmmqmmHcYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28-02-2023 10:13, Ashutosh Dixit wrote:
> The value shown by power1_max_interval in millisec is essentially:
> 	((1.x * power(2,y)) * 1000) >> 10
> Where x and y are read from a HW register. On ATSM, x and y are 0 on
> power-up so the value shown is 0.
> 
> Writes of 0 to power1_max_interval had previously been disallowed to avoid
> computing ilog2(0) but this resulted in the corner-case bug
> below. Therefore allow writes of 0 now but special case that write to
> x = y = 0.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7754
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_hwmon.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 7c20a6f47b92e..596dd2c070106 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -218,11 +218,15 @@ hwm_power1_max_interval_store(struct device *dev,
>   	/* val in hw units */
>   	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
>   	/* Convert to 1.x * power(2,y) */
> -	if (!val)
> -		return -EINVAL;
> -	y = ilog2(val);
> -	/* x = (val - (1 << y)) >> (y - 2); */
> -	x = (val - (1ul << y)) << x_w >> y;
> +	if (!val) {
> +		/* Avoid ilog2(0) */
> +		y = 0;
> +		x = 0;
> +	} else {
> +		y = ilog2(val);
> +		/* x = (val - (1 << y)) >> (y - 2); */
> +		x = (val - (1ul << y)) << x_w >> y;
> +	}
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>   
>   	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
>   
