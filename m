Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169C5BFD28
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 13:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F073110E936;
	Wed, 21 Sep 2022 11:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC9810E935;
 Wed, 21 Sep 2022 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663760771; x=1695296771;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x8Xpk3bkPxYM71zLxPA7DT8cEE5pPPtsqwYLC9tPPqI=;
 b=hqNrobvNuwJF8UiPaI6FV4G8/6ZQtq1+hluIwA/9Z/5iMAVWl4ch1u0l
 3FwwPN9jYJXCaUknBbl20iPpm6o3huZQRMIdrYzrMUaalBxcUwYhIzfZ4
 DEneBXOWkIq4EGksshuRdgdGN06pUyZzDaVusRFGRZo3OYrR/jPM9fb3C
 exJ4DT6KY8AgYrkRkxb7TkKniNyN+fgVrkqjoEv+W9GC6gVfF1m3XxgqZ
 710Dur0JXFqZEO4QI5/ytmvW3RWXm8eZtTpN8FVGYvCeGPzOHQO/Hkycg
 Y8jVo9oqwKdU8j5xm3+TnXajHH8vqQefMRXIsYJ2xGmZfsgSCPrCeDvg3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="299965254"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="299965254"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 04:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="744925480"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 21 Sep 2022 04:46:10 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 04:46:10 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 04:46:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 04:46:09 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 04:46:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYPV//1bsb+Ug5QbgC0E2XCV8KaLM8694qt2lOfgg/IAUQyMe2o+Y3FAJGH6IFuo/OlZSLmO7n/Qy2ue5vwse9mc7nCJNwkADFMeLIK7ys5pT/HgQM3YpNRbEf1JxbfdVLW1Vlv6Z0cR5U6ieD0yQiNVIUoFHYduqnixDAH0/YsQSGC/KYnRvH/1Sm4hGLDDQ8txhNBgi7CdL006DpHw0+gxdxb+ZQJ1n9sfwvqFUUkpCqob10CzAauh+8HHT1PznCfJkCObVbnrieCDR8uVcIcIrzW6Ex0FMlYrubxUMo0jh3XqFPA/NGGam3bARoSJNT4Axbubu3+SqXuxadYqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61aiLCwyPIsc86HYplvSReGLVZNZzE7jkdInPchxAnE=;
 b=oHVilDSfFMugWINzxTmPK2iJ8sGumiA+Mn57HvCwOq47WFBjdNA0cjbHQiy7D3jQbnrMW2uzdHr5ujw8aC722/ZHxVqF4PwDqLFPNpqP04R/gy/v5ZfLX36vqQlUIZ/+UYmBMb3Ms4Olm141gBhMWBAufruIXuWIYtE4mSzaXVcSZ9n1BE110e3FwFPowYx3lJKiwRCzit5Qvd2/bPcLwOuXvhPu93SkVxLoEuTHkv+Oot9Cyx5kpRxmcIssAXoKwSoz7vB53LhEs9dk2tA/DGROuKNECgmlLx6ArngEKxf+QDzkPveZ1tr3eABVzNNBf/RXQoISX3M+HIAMd0G4GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CO6PR11MB5601.namprd11.prod.outlook.com (2603:10b6:303:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Wed, 21 Sep
 2022 11:46:08 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe%4]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 11:46:08 +0000
Message-ID: <b120c201-d4c4-c9af-26bd-432df71b84ac@intel.com>
Date: Wed, 21 Sep 2022 17:15:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP setting
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-4-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220916150054.807590-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::18) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|CO6PR11MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 8442d19d-4b91-4b23-c048-08da9bc6df50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSWS68hVniILYleQOSRUNNPik1kYvO8DIW8JtbTwOaz471yE4Ar6vGQHmE6YqiyiY1dQ1JlZ+WxAW0bAWB4oc1LMUcGssaZCgXQZ3Nsph0zOWZmT7DHaCfenmtqqzYR6GQ2+ys5BeD8uA89q55EhowOwlf6U266k6ZgvMGfjMI0DL1g8ZZM3INAOE3nbYmDBHk3UABKpUsvrgoObdNS2H4eBRy8ykORP5eIY7364eYdDehijuPpIOKw4JQ423CouS83F15tiStjsxx5fJbBaurvHBexi/cXcRby8VoGeVbEDxgoWkeKD51jZvoVhCqIPrMVXI5gtQFZgtgBKC7ak2ETOlFi1ruGeai/PpJbkMfISJ3gMSab97Y+eL9MgyLQpu6PV/X6DPnAL9efVOuwbmjw5TgmZNsMhebmMquQBsOyNccAoXcYqaL1coavtTZ9SrPZthayEzlSZYjU6Q60O8zg1EuEpsRntyqL7yDMAsrUz38C0d3crLX2PjkMQjEY5VMskFbBacs7nZKCSqrTyht/IrRe7qvktBLxkx2P3UGhnHYbtYKLKIir4Tw6SoBKuUrznGwtx886QaHYVDGdlCFOCQDPilGnAE8YTVY3n5+lw/f4D+lf+03YjbBXN53XfYYlGHclcw4OoayWR+LQjhVOsTeLcMikIboeNkcMedTQcbVyHJqaykWp9T2JnSi1XnEnGNETjc1iA9JeR9dck9emvgzYw55WyaeUWO65D3Sk6V/mJ2YU8RNgZ0kQ5qe7sZQ6LuUzybHgSH6eIXqHcDncUYcv105ka9EBCDYIB48Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199015)(2616005)(6486002)(31686004)(83380400001)(6666004)(31696002)(53546011)(41300700001)(6512007)(26005)(30864003)(86362001)(2906002)(5660300002)(316002)(36756003)(6506007)(55236004)(186003)(478600001)(4326008)(82960400001)(66556008)(66476007)(66946007)(38100700002)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0gxY2xQZ2pQMlF3eWdEbCtHNlhJelp2TzRsRURXSlRnMUJLK0hTZmdudzlx?=
 =?utf-8?B?OGgva3N2N0Jtb0lENmdNNmpVNDdreFMwbXFUQllJYkFYTHQzTVk0NkZtNWs5?=
 =?utf-8?B?MXZWb25CTm5mQzhFcCtaNmFQcUpSdytkQXU2MEh6YXoyaGZPa00zZXZDdzdE?=
 =?utf-8?B?RDFHOVNRMWcxOFI1aHlIZ2czQkhLQmUvbmhUSDZtdU1jYjFDZnFudFFkMXV2?=
 =?utf-8?B?QXd4ay9yL2pWS2o1Y1V3ZnhhQUdTT09rZTBKNFJVMkRLaVZ4eXd0bS9vUGlB?=
 =?utf-8?B?UmhKVXc0Q0xUb2M0TDN5ZkNwd0JrMnE1U25OMm92dEVsTUhzdTQrQUhSTUto?=
 =?utf-8?B?c2hyZjlYMElsem1xSWFxSW1LaFIzakdMY1VCOFRBL0JuNnRUWklocS9BRlpL?=
 =?utf-8?B?Y1YwNUJ1ODhBUTFjZ0I0aXZnamgzSmpldm4xbCtIY0FWdk1vbk9PYWhWUlZV?=
 =?utf-8?B?VmFhS3BTWHZObFRiVWs3amw5d3NOUjhrNEd5ZzRKRnVMcmVDRGlVbDJXeThI?=
 =?utf-8?B?WWt1N0NnOUZUaU4xajl2NlJmaEV2NFJDNzF1TnVCNCswUVRZcUJhQTNRMUJF?=
 =?utf-8?B?eEJ2bWxjNE15Rnp1U3pkUS9CVWxsYUs3MExGaWIyOWF0NXA1TVdIUERoL3U2?=
 =?utf-8?B?Zk1aSUVXZG9FZmhSVG9JbSsrRHB4QncvdjhRUDhNd3BZUEFGZzFubVgzdnlB?=
 =?utf-8?B?YU8yT2VEelRYOFQxNnRiemZIWnBUY0hYUFZaN1hMZW5TcW1ZVm4remgzTjhS?=
 =?utf-8?B?MFpJTGZvbC9NdXFCaHBtczVMSkNmUUUxVVlDZGtTUVRabnE4M2hpMUxSSDVs?=
 =?utf-8?B?eXovdWFUWVJKbUpwaEpydFptSWFKQWxxQ0UvZFREcEw0ZTBtTGFNeVM2d0h4?=
 =?utf-8?B?bDd2RjMwV0U0QUlaZUNyMGF1MUxNYlF3blQ4d0Flc1E1QlBnRFN5cVJVdDZF?=
 =?utf-8?B?eGhxd01aNEQ2b3UycnViTHNNdHpkNVNaOStxcWJ5dzNtT1BCNjJRajA1UW94?=
 =?utf-8?B?SkVwV3JJNnFXVXUvZE9zK3VSZ1pxWFNWb3lNUXFXZlA5azh3cUZWTk94ZHdR?=
 =?utf-8?B?V016cVBnekRYQ25hRUk0aytodjZiQndxVE9HR012c0E5ampVUEQ0YU1xeDdC?=
 =?utf-8?B?NDk5T0hxYkxaMGF4SE9EazZxOHp1ck0wRWppRTlOQWZUN0R5MEp4YmtoeUtV?=
 =?utf-8?B?QjZDaGZrZWFUNlVMM1FuK1o3SFBKTkNJM3JNdjIxSTZYbjZKQ0VOOExwbDBr?=
 =?utf-8?B?SUtKbzcyVWhYZzVFMUwrOE00U3l3SDZzaTd3WlRkWFU5aU5qdTFWZDdCY1Vu?=
 =?utf-8?B?dXpvUFR6aVppbHpFRnovektDNDFWUktlMmxZeEZqak1vdUJFZThGVHhobW4z?=
 =?utf-8?B?NWpya3RSU1BLUmlqaHpCeENQbk1EeWE2SHdLQjhYNm93bUJjeVFmQVphdWI1?=
 =?utf-8?B?NmRmYi9GbC9zaTU4MDM3bGVVV3hSQlBRUkpQOGt5MkNzWEEveU55MzdrWmVr?=
 =?utf-8?B?dVdXZTdVcWxuVDliV3RDYVZJYnZ1dmZPOFJxbDlmUXlaYTdCVXhqMGRYM1lW?=
 =?utf-8?B?OUxIZ2RJcWlpdVFWay9Xam9tWTJ6R1Raa2FNYlljUHZ6QUpSenJmeFBPOUtF?=
 =?utf-8?B?RWUrUlhuNlkrWlA4T0t2Vk1MbDJLeWxEQW1ZMnNKaEN0bFBDSTV4dGV5RkNn?=
 =?utf-8?B?S01ibW9jN0xZTGhrWW1GR1lEN0xTN0dabG1oK29oWnE1L1c4SUxsZ2dubnZj?=
 =?utf-8?B?cmFBMXB1N1lwVTdkTEVGazlyQnFlSEZ1V0RFMWVJd2pJSWNYb0FoQnl5bzNn?=
 =?utf-8?B?YXFmVXZOL3d2bEJwV0UyRHRWTlJ4MHpJNVFrSjNIYTNZSW96eG10MThtVW9G?=
 =?utf-8?B?b1BrZHhUV1hkMnJOTEoxTzllN0c0QW5xM1pDZzVvRDd0TGg4SDJDS2RpZUxk?=
 =?utf-8?B?VzJSLzg5S0w5a3pQNEw1c09qTE41WmZlcm1kMkFtNktxSzhORjV4MTNQOUJU?=
 =?utf-8?B?dVRoeXo2SW14L0hPb3pGTzUvYzMrdkMwQy85bVRiRlBaZnpRanRVLytNaEpw?=
 =?utf-8?B?dDJFY2pZMlFTMURjUWhPMmJWQ0QxTWp5REIyaERESFFuVlI0UU5KTURKQXVO?=
 =?utf-8?B?MEF1dDJPdys4eHV1bVd2Zkh3ZU5qN1hPSXVQYlBKN3dqTVcxR1dVKzdPUUlE?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8442d19d-4b91-4b23-c048-08da9bc6df50
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 11:46:08.2536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCrfaX4GC9DYM7CsVJthtUacz3ZvTFeWRpNwq2daXI9aSLyNsSugCtCakwiDcUi2XAZQdKEYQUDfIQnAph0oggBT8l6BXpdFEWHeOk2XT34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5601
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
> Use i915 HWMON to display/modify dGfx power PL1 limit and TDP setting.
> 
> v2:
>    - Fix review comments (Ashutosh)
>    - Do not restore power1_max upon module unload/load sequence
>      because on production systems modules are always loaded
>      and not unloaded/reloaded (Ashutosh)
>    - Fix review comments (Jani)
>    - Remove endianness conversion (Ashutosh)
> v3: Add power1_rated_max (Ashutosh)
> v4:
>    - Use macro HWMON_CHANNEL_INFO to define power channel (Guenter)
>    - Update the date and kernel version in Documentation (Badal)
> v5: Use hwm_ prefix for static functions (Ashutosh)
> v6:
>    - Fix review comments (Ashutosh)
>    - Update date, kernel version in documentation
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  20 +++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 158 +++++++++++++++++-
>   drivers/gpu/drm/i915/i915_reg.h               |   5 +
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   6 +
>   4 files changed, 187 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index e2974f928e58..bc061238e35c 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -5,3 +5,23 @@ Contact:	dri-devel@lists.freedesktop.org
>   Description:	RO. Current Voltage in millivolt.
>   
>   		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> +Date:		September 2022
> +KernelVersion:	6
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
> +Date:		September 2022
> +KernelVersion:	6
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RO. Card default power limit (default TDP setting).
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 45745afa5c5b..5183cf51a49b 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -16,11 +16,16 @@
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - voltage  - millivolts
> + * - power  - microwatts
>    */
>   #define SF_VOLTAGE	1000
> +#define SF_POWER	1000000
>   
>   struct hwm_reg {
>   	i915_reg_t gt_perf_status;
> +	i915_reg_t pkg_power_sku_unit;
> +	i915_reg_t pkg_power_sku;
> +	i915_reg_t pkg_rapl_limit;
>   };
>   
>   struct hwm_drvdata {
> @@ -34,10 +39,68 @@ struct i915_hwmon {
>   	struct hwm_drvdata ddat;
>   	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
>   	struct hwm_reg rg;
> +	int scl_shift_power;
>   };
>   
> +static void
> +hwm_locked_with_pm_intel_uncore_rmw(struct hwm_drvdata *ddat,
> +				    i915_reg_t reg, u32 clear, u32 set)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct intel_uncore *uncore = ddat->uncore;
> +	intel_wakeref_t wakeref;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		intel_uncore_rmw(uncore, reg, clear, set);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
> +/*
> + * This function's return type of u64 allows for the case where the scaling
> + * of the field taken from the 32-bit register value might cause a result to
> + * exceed 32 bits.
> + */
> +static u64
> +hwm_field_read_and_scale(struct hwm_drvdata *ddat, i915_reg_t rgadr,
> +			 u32 field_msk, int nshift, u32 scale_factor)
> +{
> +	struct intel_uncore *uncore = ddat->uncore;
> +	intel_wakeref_t wakeref;
> +	u32 reg_value;
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		reg_value = intel_uncore_read(uncore, rgadr);
> +
> +	reg_value = REG_FIELD_GET(field_msk, reg_value);
> +
> +	return mul_u64_u32_shr(reg_value, scale_factor, nshift);
> +}
> +
> +static void
> +hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
> +			  u32 field_msk, int nshift,
> +			  unsigned int scale_factor, long lval)
> +{
> +	u32 nval;
> +	u32 bits_to_clear;
> +	u32 bits_to_set;
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
> +
> +	bits_to_clear = field_msk;
> +	bits_to_set = FIELD_PREP(field_msk, nval);
> +
> +	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
> +					    bits_to_clear, bits_to_set);
> +}
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>   	NULL
>   };
>   
> @@ -71,6 +134,64 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>   	}
>   }
>   
> +static umode_t
> +hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? 0664 : 0;
> +	case hwmon_power_rated_max:
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_power_sku) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		*val = hwm_field_read_and_scale(ddat,
> +						hwmon->rg.pkg_rapl_limit,
> +						PKG_PWR_LIM_1,
> +						hwmon->scl_shift_power,
> +						SF_POWER);
> +		return 0;
> +	case hwmon_power_rated_max:
> +		*val = hwm_field_read_and_scale(ddat,
> +						hwmon->rg.pkg_power_sku,
> +						PKG_PKG_TDP,It seems a dead code, pkg_power_sky register in initialized with 
INVALID_MMMIO_REG, why are we exposing this, unless i am missing something ?
Br,
Anshuman.
> +						hwmon->scl_shift_power,
> +						SF_POWER);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		hwm_field_scale_and_write(ddat,
> +					  hwmon->rg.pkg_rapl_limit,
> +					  PKG_PWR_LIM_1,
> +					  hwmon->scl_shift_power,
> +					  SF_POWER, val);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -80,6 +201,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	switch (type) {
>   	case hwmon_in:
>   		return hwm_in_is_visible(ddat, attr);
> +	case hwmon_power:
> +		return hwm_power_is_visible(ddat, attr, channel);
>   	default:
>   		return 0;
>   	}
> @@ -94,6 +217,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	switch (type) {
>   	case hwmon_in:
>   		return hwm_in_read(ddat, attr, val);
> +	case hwmon_power:
> +		return hwm_power_read(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -103,7 +228,11 @@ static int
>   hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	  int channel, long val)
>   {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
>   	switch (type) {
> +	case hwmon_power:
> +		return hwm_power_write(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -124,11 +253,36 @@ static void
>   hwm_get_preregistration_info(struct drm_i915_private *i915)
>   {
>   	struct i915_hwmon *hwmon = i915->hwmon;
> +	struct intel_uncore *uncore = &i915->uncore;
> +	intel_wakeref_t wakeref;
> +	u32 val_sku_unit;
>   
> -	if (IS_DG1(i915) || IS_DG2(i915))
> +	if (IS_DG1(i915) || IS_DG2(i915)) {
>   		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
> -	else
> +		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
> +		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
> +	} else {
>   		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
> +	}
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref) {
> +		/*
> +		 * The contents of register hwmon->rg.pkg_power_sku_unit do not change,
> +		 * so read it once and store the shift values.
> +		 */
> +		if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku_unit)) {
> +			val_sku_unit = intel_uncore_read(uncore,
> +							 hwmon->rg.pkg_power_sku_unit);
> +		} else {
> +			val_sku_unit = 0;
> +		}
> +
> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +	}
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 1a9bd829fc7e..55c35903adca 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1807,6 +1807,11 @@
>   #define   POWER_LIMIT_1_MASK		REG_BIT(10)
>   #define   POWER_LIMIT_2_MASK		REG_BIT(11)
>   
> +/*
> + * *_PACKAGE_POWER_SKU - SKU power and timing parameters.
> + */
> +#define   PKG_PKG_TDP			GENMASK_ULL(14, 0)
> +
>   #define CHV_CLK_CTL1			_MMIO(0x101100)
>   #define VLV_CLK_CTL2			_MMIO(0x101104)
>   #define   CLK_CTL2_CZCOUNT_30NS_SHIFT	28
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index ffc702b79579..b74df11977c6 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -189,6 +189,10 @@
>   #define  DG1_QCLK_RATIO_MASK			REG_GENMASK(9, 2)
>   #define  DG1_QCLK_REFERENCE			REG_BIT(10)
>   
> +#define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
> +#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
> +
>   #define GEN6_GT_PERF_STATUS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5948)
>   #define GEN6_RP_STATE_LIMITS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
>   #define GEN6_RP_STATE_CAP			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
> @@ -198,6 +202,8 @@
>   
>   #define GEN10_FREQ_INFO_REC			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>   #define   RPE_MASK				REG_GENMASK(15, 8)
> +#define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> +#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>   
>   /* snb MCH registers for priority tuning */
>   #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
