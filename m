Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C766CA42122
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2497C10E419;
	Mon, 24 Feb 2025 13:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtJENO9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DED10E12A;
 Mon, 24 Feb 2025 06:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740377232; x=1771913232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JdEkd+bnyB4DRM14pjq1ieFe2dqOq/POV8Ol0pHeyJM=;
 b=YtJENO9H5Nq2ImBufnYE0fSQzkoj82R6LrQrAryRlbOcvo2bw8Kp+b/b
 0eqScZhASTifUx/YaJe9xL8rDs957V9b0kpCofbHMJ+8jQiRMeMHzmYhO
 7hLGospeCtk7KyOtV3bBJAw7CpdO8HILLsV83tx49SC0StPnxUdaYch5Z
 tBoQuWH6oxP0Prmkfjg3Y5bryQOm+9nHhOdTJF/lzYrrY/bnUVbPJZ3Q8
 pjVt9ZNMFJZSq3WMI/OaKjtR48x8dvwMsiRc+v5XwHVnAfC53yxiB41EL
 7xIPK7x3pc7/thnLJO11nutTwUW0q712gr1uLl6h9Z7S3u8kNzfTZOCDZ Q==;
X-CSE-ConnectionGUID: SG8lnD+0TFig85qnBwuhBQ==
X-CSE-MsgGUID: 0X1dWf43ShK7jPSf8FlB6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="44897665"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="44897665"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 22:07:11 -0800
X-CSE-ConnectionGUID: +YY/oj0MRKWeeowQovX5jg==
X-CSE-MsgGUID: EfvoBwwEQh2JScycpXwGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="120877526"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2025 22:07:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 23 Feb 2025 22:07:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Feb 2025 22:07:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 22:07:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkkU0qI3VDH/Wy6frlEpEDF3af2SHzE+EWq35DjX5hO20pV7PoW6B4jZZODx6/mlp92/2rpWZdM/W9sQIr1cXROEZtmMqOylKa2LuRKR0L/FcIz6hqkJLRQU1d0esJTKRyMi23ksSfsq+ZOWjUSYOv0DUYyxDYuMNhMbRTUdAy+RCWO2w9gHwAWwdwslmgR/cA7A/5bAI3copAQozyqB2BDmvacn7pbd8ry1c84qiG6gsOt+Wy8lUXu1zhmlE7zTIlFZMYuap1rMGjtDRX9Y2CUs2F7AqDy5RTqcIzX0V3sDSYuvH6C3ymdqLzODxmFDEdbEf4pR0/ohgOOXEFq2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Cc9mIP2H0eif96lhwB6eFfptjvZl9JhMkUINzk9fUc=;
 b=SGNMIJN69maEoaybNSC/nHKk/4IKejcnpCoYtuUc+RB+0hDLlRPST7oybi3x2tNpyPmv1qzoFb32FSl15iqSeuf0Ztyqhw6xvsTh50Jg6w0KcKY7YUQkjeD1Flap6YtTnrS9XENxfkxMNI5b/e5TmBJ9IBAYn6mEa4wtlvVQgYxVdJdrQt64SQnU2ZikwRMsEI8IYPPqu20Dd+nDOncChxECJMJaQ8mS2fwB5RTwHP+ZBXCJzi5XKssFR/dTmiPepP/yxQ2iS0u277pO16iaDqKBKWr/Fv+xK7o9ITnfo26Uunvm7kAsGh2JycOF7tgeEtK2BeDW4h06B+inlLA0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Mon, 24 Feb
 2025 06:06:52 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 06:06:52 +0000
Message-ID: <f9641756-5d96-4c34-9e93-6a17a20e1677@intel.com>
Date: Mon, 24 Feb 2025 11:36:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/i915/display: Compute the scaler filter
 coefficients
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
 <20250219115359.2320992-3-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250219115359.2320992-3-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: eecfa3ec-0a05-4748-8deb-08dd54996eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2lHenVqbWc2NmZQOUNGMFUvcktPcXcvWVZhc1Y4cWpDQmF3QWc3WUpPaUdv?=
 =?utf-8?B?dTVseHZIQTNHN0xtZWhBQmFEWEpzNFBQTkQ5S0hVU1dVVlVKaHRiK0Nnemc2?=
 =?utf-8?B?K0czeWl0ZjRFMFB4VHhuSmRjUlRhTVl3Y0wxbkl4em9kQ2x6VjlwTWpQSy8r?=
 =?utf-8?B?MURJVXFKZVFFL3REMUNLdnBLeWlDRFMvK212Z1hRdlNjWUpaRVc1c21oM1R6?=
 =?utf-8?B?ald2Vk15UThsWEtsOGhlUk5uSHpRaHY0Rm5Oc1dIT3ZCRTNveUUxRmxMQWRK?=
 =?utf-8?B?NDlWazlYTER2VEhNMVBYUHZRb01GVGgwSVJaR2xQWU1ZNGVKNzVSNU0wcmhk?=
 =?utf-8?B?eGwwcCt0RWdLQlQvSDBOQjduR3BSaWtXOFJDMW0wMXJ2Y015MHFUVEgzNDhQ?=
 =?utf-8?B?clBUaVFVTVZ0ZE5lNFJWTEQrZllPU3B2TmZzUHpKSVlMWFE4a2ZkRFZpcjlH?=
 =?utf-8?B?RHhWZ3RvWDVFMTJHQm9TOTlzMEFyakJCK296Zi9Cci9jV0MzWS9ZSTN2UGxv?=
 =?utf-8?B?bVBUODA0am1xbENiUmlZYkYwRTlQdVpOMkhtRUs2TDJDcXVPNVZXMmk5N3Jv?=
 =?utf-8?B?dmd4TyswMGo2TCtzOVNzMjVIUG1OcUJSWjl0c1lxcG5SMmF5UUp6NjNPcjl0?=
 =?utf-8?B?TCtRbGh3cnN3WEtmbFBDUnltSVU0OEdSNXVkMUhDYno3SjBNSnZqTWk5T2sz?=
 =?utf-8?B?a04wRy8ya1RHVy9STlNBN3EvNndSdWVvVkMzblRvVmxLSVF4SEc4UW55c1pT?=
 =?utf-8?B?SXRsTTgxdmRaMDVma1dmTnFnbDREenVwWWpNd0hxZitzMzFveFQwMFQxdDdu?=
 =?utf-8?B?c0xqbFZGUStIbEs2T0NjdU5OUlNzL0ZuTTdOa0lienF2aHdiUGU5anZaZ0I3?=
 =?utf-8?B?SjFzWXRXdGxmZ0FHZkU1NFVrOGRYTi9tU21YOFA4TGowVHU4ZDhTdTNybWxh?=
 =?utf-8?B?R0haQ0pMckJLWGxNUkgvaHVqQ2Jyc2RBblhEd3kvT01UeGxuSEFKaGFIeXcv?=
 =?utf-8?B?bFVMdWNFY25HMzJ6aktzUVFySFVLb3EvMGJWR3FtTzBDd1V6cTRIckhJa1VV?=
 =?utf-8?B?MGdOTnZwQ0ZvcU1WYkU5TDcrTFcyR2FQZkcycHBKUFVCUUYydnpYeExxcEFa?=
 =?utf-8?B?U1l5QXRSWVQ1NFZPd09YUnR5WjNwMllzTEFEQWhoNFhVVzg2Qk4va2szRHg4?=
 =?utf-8?B?c2R4RXBDcThoTHFaaDVNOU12ZmtzOHo3blNwQVVobEVib3B1bDB4eDljNmVM?=
 =?utf-8?B?aUZ6R2JYaDZlMGJlUEVIU2ltdUg3SlV5SlJoem91dlR5cXhvaGpoS1JGaUoy?=
 =?utf-8?B?VjFxcWg5R0ZPblNNQ04rZkM1RHVCdGQvN0ZOa1B2WWttRGtScFFsUm1FRSti?=
 =?utf-8?B?MFUvc2w0LytFdWMzZGdYR294cEc3ZkdTRC95QTRSYXhnOUlYeWtTc2JNWDBi?=
 =?utf-8?B?RHRJVUxieWQ3T1FLRlpDQmNNQ2xHWFVDOGthR0NRdm9LOENONkN6NnNpZ2hF?=
 =?utf-8?B?UFBkWW5qdUErRWt2b0R1VUNZQWtZWXhQSnFPQ3k0UmpJSzVvOGVLdWIrY2Qy?=
 =?utf-8?B?QzEwUWRxd25KVDVoNlJkWStaTTB1U0djZEk3a0dNUDZ5clJZSGthS3ZVS0VT?=
 =?utf-8?B?eGdVNytTQWE1Z011dXllY2IxTjNpMFcrblUvNzU4M2hTUk5YWWZ5Y2RILzlV?=
 =?utf-8?B?UEhGM3NZR1FTMC9tMWJPOUxaQi9tNE5VNVozS3htUi9aLzdlS2pSWFdITm83?=
 =?utf-8?B?MWtwNTBXRUI0Zjh1VkduVlFMdnNncmpGbkc3RjRPWEQrK3B5Wk5RWUl1Qjc3?=
 =?utf-8?Q?07zZvlDtCqGvE29K6kepyA1PYR0FyrhBhdPv8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmlHRXN4NmZqTFp5MzE5eG1oU1Ivd044U01WcklPVHVkdHloS3lGWUFGb2NH?=
 =?utf-8?B?MkF3VWhKZlRWakN5Ym5odjVOWUc1NXNaVkZBKzVHM3B0U2dYdHNxRXljQmQv?=
 =?utf-8?B?a29rQTRVbDlzUWJlblVTT1QwMVJQbGF4OXRBU29hdmNYZmJ0MnhRQm5FMUpx?=
 =?utf-8?B?T1c0ZmZNdUZNYzlsMjlvaVhiVS9lL0pJSzVLbCtCNW1NaUxtYnZuUGpUV1p4?=
 =?utf-8?B?SnlMbzFLNm5weVlFTGFYQUt3N3NCaExCeHlaN1Z4TEc2NVVSa3NpUVpEM096?=
 =?utf-8?B?UUNTQlh5eGY1dFVONWxSNHFHWGhyN3pzUW5LdXU1Vk9aSUhqL09ETmpOTUxp?=
 =?utf-8?B?bGFvRHV2bnBWU1BHK1JLVDEvNVhYUUpxT2g3dGlxS1FIQUJnZXdBaUVTaGdo?=
 =?utf-8?B?eElQdlRDUEEzaXZTTnYwSVJJSk52WnppTnJSVXh4amhVOVJZVXlxUjVpSTk3?=
 =?utf-8?B?eGE3cjZPTGo3by9YTTRFQ0trRUVMWWdVcy9weFdxTVV3VFZvb3FaK21BUGZU?=
 =?utf-8?B?RitPT2FHQXB3cEVJSitxSHl4MjVJdjFlaXViU1l4cVR4cTlHV0txMTh6bXk3?=
 =?utf-8?B?VDg5eEhxQlQ5ZTZPUXFzaG84WGZ4RW9XMWFucUpLRTloVW9XYmxnaTRWTUt2?=
 =?utf-8?B?bm5hV2w4WGRuS2Jkc2lPQzl3M0NxRDRtcHVQbGE1ckhkTlUzb1dWVGgxK3hH?=
 =?utf-8?B?c2lJbzB0RG5KYUV2VmRDd0dVMFhBNzZkRzk1R3JTeEh5dXF3bnpsbWlhQjFK?=
 =?utf-8?B?MktoUzJDN0VMVVExejdNVUhtWmsyTThQY3BCL1pObDdoYXd1aUhKZnBsYkRC?=
 =?utf-8?B?MEZJeGJTQ0xlcTVsNjlaQ0M1YnR3azNXYi9WeFBoUGJFSXA2cTB6Y3VjWTBz?=
 =?utf-8?B?WWowbmp4MjFYUzVIam9zSE9kaTUrbGFFNmwxWGRWbXltZnAwaFJFbU1IMmV2?=
 =?utf-8?B?YlRCSjR0U0YxejdRYTJVMENXMStFdW1OQjZUT0p5eUp5OE9JS2crZjgzNkUw?=
 =?utf-8?B?V3phVnFkZjJTYXdtRnowTVltdjZxSWJjdWlreUNrdVNCMzIrOFJ5VlZRdDZN?=
 =?utf-8?B?ODEyVTMydFRWTEE3S0JFUFdTY2JFb3ozaHp1Ull2bzRMNll3SnFhT283YnVN?=
 =?utf-8?B?SVltRU5iOHpObFhvdi9WZGhrdm1tdUJ4ZHpUZTVNblVkT0plVkZRSk9xTDJl?=
 =?utf-8?B?bU5tZlRkc2ZxZHkreE5ZUkRFbDF1RGY0S3dkQ3B1QU9Hc0tHOG8yK2pIbktx?=
 =?utf-8?B?SnVOS3I3YVZUZC82Y3NUS0NCYVRxMm90Z0kvSTA2cm52K3ppUk4vMmpneUZP?=
 =?utf-8?B?YVhmMmxtZkRZaVRMSFVMb0Y3NUZLVHdxREhPT2psc1RQVFI3SjRSTG1SVFFa?=
 =?utf-8?B?U2JYTklZT0U1N2F5QVlab0Q2RzA2RVhjK1ZKUEhNclFFTTVLak5FeExTR0VC?=
 =?utf-8?B?SjVxYmlybnJPUkNlSTdzeUMyU3BKSE8rZlR5UWROTWM3ekZudXBDUUcyVmU1?=
 =?utf-8?B?bGlHZUNDMENveEF4dktab0Zqbzdod3B6WVR0WkxOSmlzb1BhU3JtMFFiRERG?=
 =?utf-8?B?SnZRQ0JIQmFQY2c1dFgrMzZVVUg1RGNRc09VZmF3amhYVEIrMFgwK2VVaEVN?=
 =?utf-8?B?VGJyd2syYlN2OUJtSzZuWjhPbDBLRFJnSWtnMlRHa0lYb3hlNnV0YmsxVGlO?=
 =?utf-8?B?UW8yMDFwcHRZZVphVVRFbWlMWFlOaEVVMjV2TVlxaHhoTEdVMXVBNjEzUGgr?=
 =?utf-8?B?Vm1nbGpQcUp2MnlvWVh3ZEZEMzBFOTZOUDlxSDVySTN6SFdmUVdnZEo2SUxO?=
 =?utf-8?B?OTRzbmNrR2tYeTFGMU95T2hoRmFXbG5HcU82dDROVFBkTVVyV2tDTmZmelZ4?=
 =?utf-8?B?cGVybkJsbFN4QTNvVHpuTlZ3NURhOVpyNUlPL2pHZjJvMVM4VGR2TytDTEJG?=
 =?utf-8?B?TGtveXBpYkNkYThYcUs4Rzg5dTByaTBHeGhTOWVUQlhhTFVyS3BBeEVHY1pG?=
 =?utf-8?B?RG9vMEhMZldqdjZnK0htOVQraEJqbVdaSDB5RWY0NVFqN1dsQ0h3bUx5K0ti?=
 =?utf-8?B?SEVSbkhKN1FkUEQvUDFIbVd6Mm1ZUlZGMW52SlBuYUZNMnY3aHo3MHppN0Jq?=
 =?utf-8?B?MGJISlZnME9LSmV2eHk2d3JRVUdqSUNpQ1JTa1dLVkRsUU5lVUxFOEp0N05w?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eecfa3ec-0a05-4748-8deb-08dd54996eb9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 06:06:52.2036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AxNGK2+alocztCxBrftYRmw+uUQqkeoJP50UqhV3SYtYIrniMsQcQonQAwg6gu/09UvS3kwii8g5MywRlec/ZdkGkk3ZEs5+4vEY5HS9Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
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


On 2/19/2025 5:23 PM, Nemesa Garg wrote:
> The sharpness property requires the use of one of the scaler
> so need to set the sharpness scaler coefficient values.
> These values are based on experiments and vary for different
> tap value/win size. These values are normalized by taking the
> sum of all values and then dividing each value with a sum.
>
> v2: Fix ifndef header naming issue reported by kernel test robot
> v3: Rename file name[Arun]
>      Replace array size number with macro[Arun]
> v4: Correct the register format[Jani]
>      Add brief comment and expalin about file[Jani]
>      Remove coefficient value from crtc_state[Jani]
> v5: Fix build issue
> v6: Add new function for writing coefficients[Ankit]
> v7: Add cooments and add a scaler id check [Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/display/intel_casf.c     | 154 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  16 ++
>   .../gpu/drm/i915/display/intel_casf_regs.h    |  19 +++
>   drivers/gpu/drm/i915/display/intel_display.c  |   1 +
>   .../drm/i915/display/intel_display_types.h    |  13 ++
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   7 files changed, 205 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index ed05b131ed3a..d7550b26cdfb 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -230,6 +230,7 @@ i915-y += \
>   	display/intel_bios.o \
>   	display/intel_bo.o \
>   	display/intel_bw.o \
> +	display/intel_casf.o \
>   	display/intel_cdclk.o \
>   	display/intel_cmtg.o \
>   	display/intel_color.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> new file mode 100644
> index 000000000000..1526bebae1b6
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + */
> +#include "i915_reg.h"
> +#include "intel_casf.h"
> +#include "intel_casf_regs.h"
> +#include "intel_de.h"
> +#include "intel_display_types.h"
> +#include "skl_scaler.h"
> +
> +#define FILTER_COEFF_0_125 125
> +#define FILTER_COEFF_0_25 250
> +#define FILTER_COEFF_0_5 500
> +#define FILTER_COEFF_1_0 1000
> +#define FILTER_COEFF_0_0 0
> +#define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
> +
> +/**
> + * DOC: Content Adaptive Sharpness Filter (CASF)
> + *
> + * From LNL onwards the display engine based adaptive
> + * sharpening filter is supported. This helps in
> + * improving the image quality. The display hardware
> + * uses one of the pipe scaler for implementing casf.
> + * It works on a region of pixels depending on the
> + * tap size. The coefficients are used to generate an
> + * alpha value which is used to blend the sharpened image
> + * to original image.
> + */
> +
> +const u16 filtercoeff_1[] = {
> +	FILTER_COEFF_0_0, FILTER_COEFF_0_0, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0,
> +	FILTER_COEFF_0_0,
> +};
> +
> +const u16 filtercoeff_2[] = {
> +	FILTER_COEFF_0_0, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> +	FILTER_COEFF_0_0,
> +};
> +
> +const u16 filtercoeff_3[] = {
> +	FILTER_COEFF_0_125, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> +	FILTER_COEFF_0_125,
> +};
> +
> +static int casf_coeff_tap(int i)
> +{
> +	return i % SCALER_FILTER_NUM_TAPS;
> +}
> +
> +static u16 casf_coeff(struct intel_crtc_state *crtc_state, int t)
> +{
> +	struct scaler_filter_coeff value;
> +	u16 coeff;
> +
> +	value = crtc_state->hw.casf_params.coeff[t];
> +	coeff = SET_POSITIVE_SIGN(0) | EXPONENT(value.exp) | MANTISSA(value.mantissa);
> +
> +	return coeff;
> +}
> +
> +/*
> + * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
> + * To enable casf:  program scaler coefficients with the coeffients
> + * that are calculated and stored in hw.casf_params.coeff as per
> + * SCALER_COEFFICIENT_FORMAT
> + *

Remove extra line here.


> + */
> +static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	int id = crtc_state->scaler_state.scaler_id;
> +	int i;
> +
> +	if (id == 0) {
> +		drm_WARN(display->drm, 0, "Second scaler not enabled\n");
> +		return;
> +	}

Perhaps better thing to check here is if (id != 1)


> +
> +	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
> +			  PS_COEF_INDEX_AUTO_INC);
> +
> +	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 1),
> +			  PS_COEF_INDEX_AUTO_INC);
> +
> +	for (i = 0; i < 17 * 7; i += 2) {

Use the macro here.


> +		u32 tmp;
> +		int t;
> +
> +		t = casf_coeff_tap(i);
> +		tmp = casf_coeff(crtc_state, t);
> +
> +		t = casf_coeff_tap(i + 1);
> +		tmp |= casf_coeff(crtc_state, t) << 16;
> +
> +		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
> +				  tmp);
> +		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 1),
> +				  tmp);
> +	}
> +}
> +
> +void intel_casf_enable(struct intel_crtc_state *crtc_state)
> +{
> +	intel_casf_write_coeff(crtc_state);
> +}
> +
> +static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
> +					  u16 coefficient)
> +{
> +	if (coefficient < 25) {
> +		coeff->mantissa = (coefficient * 2048) / 100;
> +		coeff->exp = 3;
> +	} else if (coefficient < 50) {
> +		coeff->mantissa = (coefficient * 1024) / 100;
> +		coeff->exp = 2;
> +	} else if (coefficient < 100) {
> +		coeff->mantissa = (coefficient * 512) / 100;
> +		coeff->exp = 1;
> +	} else {
> +		coeff->mantissa = (coefficient * 256) / 100;
> +		coeff->exp = 0;
> +	}
> +}
> +
> +void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	const u16 *filtercoeff;
> +	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
> +	u16 sumcoeff = 0;
> +	u8 i;
> +
> +	if (crtc_state->hw.casf_params.win_size == 0)
> +		filtercoeff = filtercoeff_1;
> +	else if (crtc_state->hw.casf_params.win_size == 1)
> +		filtercoeff = filtercoeff_2;
> +	else
> +		filtercoeff = filtercoeff_3;
> +
> +	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++)
> +		sumcoeff += *(filtercoeff + i);
> +
> +	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
> +		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
> +		convert_sharpness_coef_binary(&crtc_state->hw.casf_params.coeff[i],
> +					      filter_coeff[i]);
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> new file mode 100644
> index 000000000000..840208b277f8
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_H__
> +#define __INTEL_CASF_H__
> +
> +#include <linux/types.h>
> +
> +struct intel_crtc_state;
> +
> +void intel_casf_enable(struct intel_crtc_state *crtc_state);
> +void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
> +
> +#endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> new file mode 100644
> index 000000000000..0b3fcdb22c0c
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation

2025


> + */
> +
> +#ifndef __INTEL_CASF_REGS_H__
> +#define __INTEL_CASF_REGS_H__
> +
> +#include "intel_display_reg_defs.h"
> +
> +/* Scaler Coefficient structure */
> +#define SIGN				REG_BIT(15)
> +#define EXPONENT_MASK			REG_GENMASK(13, 12)
> +#define EXPONENT(x)			REG_FIELD_PREP(EXPONENT_MASK, (x))
> +#define MANTISSA_MASK			REG_GENMASK(11, 3)
> +#define MANTISSA(x)			REG_FIELD_PREP(MANTISSA_MASK, (x))
> +
> +#endif /* __INTEL_CASF_REGS__ */
> +
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 065fdf6dbb88..0f3279cfa0f1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -60,6 +60,7 @@
>   #include "intel_audio.h"
>   #include "intel_bo.h"
>   #include "intel_bw.h"
> +#include "intel_casf.h"

This does not belong to this patch.


Regards,

Ankit

>   #include "intel_cdclk.h"
>   #include "intel_clock_gating.h"
>   #include "intel_color.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index a4e3f33f75eb..bb902cb7561f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -926,6 +926,18 @@ struct intel_csc_matrix {
>   	u16 postoff[3];
>   };
>   
> +struct scaler_filter_coeff {
> +	u16 sign;
> +	u16 exp;
> +	u16 mantissa;
> +};
> +
> +struct intel_casf {
> +#define SCALER_FILTER_NUM_TAPS 7
> +	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
> +	u8 win_size;
> +};
> +
>   void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
>   
>   typedef void (*intel_io_reg_write)(void *ctx, i915_reg_t reg, u32 val);
> @@ -966,6 +978,7 @@ struct intel_crtc_state {
>   		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
>   		struct drm_display_mode mode, pipe_mode, adjusted_mode;
>   		enum drm_scaling_filter scaling_filter;
> +		struct intel_casf casf_params;
>   	} hw;
>   
>   	/* actual state of LUTs */
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5ce65ccb3c08..f2418585a498 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -205,6 +205,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/intel_backlight.o \
>   	i915-display/intel_bios.o \
>   	i915-display/intel_bw.o \
> +	i915-display/intel_casf.o \
>   	i915-display/intel_cdclk.o \
>   	i915-display/intel_cmtg.o \
>   	i915-display/intel_color.o \
