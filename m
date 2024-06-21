Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F119124D2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 14:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E6810F16E;
	Fri, 21 Jun 2024 12:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxifjMc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5541310F167;
 Fri, 21 Jun 2024 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718971947; x=1750507947;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cyoemnMhXsBmWN/EECfGnJ5j0ElAtAuhe2Z6MSGKbb0=;
 b=NxifjMc0bK8KEO0lZ5N50Mysh5dFsW9EtjYxr68x6EO/aOjONG+p+CuM
 7TwxRx54T9SjNqFY+zmQ8ES6Ac0f5Qz+mPim8siHOOttJqx4yaHCbkgFA
 IDDANr6O55RFnAYHcrXg484haCvvHsng9olXfhPszUkU/gTvu1MthfqyY
 CLfdua2TxxiHCwEU09sixE4Var8waOV4Chrc0VGHsOrG/98lrRCjQLkEM
 zWxhizu6uIUp7DpWZyJIfDOOyRP+4ed05Fm7PwXOSQZXbGO6rjeLd3Wvj
 0awD7eR8MGfGiy7csjhyPOMl+Awd/2DsQ7HYSK38al9EbcBAB2BW2aFIG w==;
X-CSE-ConnectionGUID: bIZhz6wYRQWmlwRu4Nqlhg==
X-CSE-MsgGUID: 0fZhdvxpQG2FxKwfAJy6kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="26686815"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="26686815"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 05:12:26 -0700
X-CSE-ConnectionGUID: 2MJqg4VYTqG3QkWiU1BT3g==
X-CSE-MsgGUID: p0lC8r6lSyyOOVvxMxPNoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="43241115"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 05:12:27 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 05:12:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 05:12:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 05:12:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PweGJrkl+8T+N33CstLBKhHTDk6dnodthH844m2URGnSyIBnkdEHMDEYuuIS6OIfRyJnNmLT17nMExjDFaMlTYWVF1RAbzZk7NSC9juTTPKgQPkWHSzsRX+Z1ciEqmcwE0fiFwvIeHPk/mTDrLKpDSAsSiuT4pCqVbY35LdS9R8R8k0i4vcdxUPGmH2lCnP9VPVgsJ/xy7BBlYp5pF9HR1hu3lyWEk1ZsYavaQKdtP4zHF9FTJL5SJ503s/nyH4YfWVJgQETgI+iO237JZYcEtdYYIUBnP8GNdhFN7D+evJUYcYmuRnXmpcP9kSjnDoeCWMK9hkvXK+oc4nsCpLXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkFXN9kft1ngc52TK/gnSD7lCtRsLA/rSeRKjk2il0Q=;
 b=LPUV6jcDmi6cwuMQeiviTUI0ZRIcFFWBQ38Rr4lD/WZyXUm39ukn26WcD/YxmCDqEeE4BH+hpeZP3Ovt2OprA1RGHqzbd/uz/l6aF6qBbf9KDNMUkCa002eVilaNecAmU/N1VLnlfSizNTK2llSyyRoQvsemxTkknTM/+AYFa4/DRnH1S7agDy8zDYY905mwHwmQi31yZJUTWyp7HnZ+wg4gCO73EVMuluTWrpQkJzK6v1bgybX6N9QDV6TaOPbeuA3+lvvB5uGw4Ne25ulOFdQ0ZANfhZVw4s4i+6z5iR+surlsWC9ImJraDvK4wg1rOVW561CPuh9KaANk6J3gDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA3PR11MB7527.namprd11.prod.outlook.com (2603:10b6:806:314::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 12:12:23 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 12:12:23 +0000
Message-ID: <26bea2ee-106a-4712-8186-c922a1d32ab2@intel.com>
Date: Fri, 21 Jun 2024 14:12:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/lnl: Offload system clear page activity to GPU
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Christian Koenig
 <christian.koenig@amd.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20240620134656.14380-1-nirmoy.das@intel.com>
 <20240620134656.14380-3-nirmoy.das@intel.com>
 <16c5e779-3ab6-4968-a13c-0afb3fb98b75@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <16c5e779-3ab6-4968-a13c-0afb3fb98b75@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::14) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA3PR11MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 87247fd7-d05f-4449-53ce-08dc91eb67f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bk16VjhGbjNtTURlRWZxT0Q3VTQwV2pyVjZ5dWVxNlllamtIazFWSFZkL21a?=
 =?utf-8?B?cHZMMXBTVFVrcWo4Vkx2aHpFTHlId3FKT3FsL05Bd2NKamRPL1JVK25jZ080?=
 =?utf-8?B?WEtNV1hsNzdUMkk4REhqVmJyb1BJd1hpaXVVTWFLamQxUllmaDdncFU3VmhO?=
 =?utf-8?B?ZDdkdE5ESGJ6eEpLcmsvNEc5dUkxZ1k4L21VQkZwVDZpNnY2Mms5d3RZRncy?=
 =?utf-8?B?dmNiL0xpNVVpdHlLNjhEVWxCYW1wbEs1dzZRNUx3UWgwR3VGaEo1bHh0TGNu?=
 =?utf-8?B?eGJ6dlBuWXF6d2dtRXJ0Wm5ETzJqRFNCdXh2SGZuUndrRlF1YkpnTkNkZkNG?=
 =?utf-8?B?VGhBMGxWQjFGd1BaVktNRUVjNHR3MVEvaDgwWmhSSjI3U1FCNHZTM0huZ1NW?=
 =?utf-8?B?WUp2ZDJTM0gwUlJ4T2tpcERVajdBaVVGeTMrSWhHZmhxcTluSFQ5eXVmd3BX?=
 =?utf-8?B?V2taTS9RUS8vZ2cyUG11Zm4rQTltQjlXaWNza1NCWGNTSGYvaEQ5ajEwVVhr?=
 =?utf-8?B?THRBd3NSeTZsOWtVZWQydC9DR1JxY1NKRnRxQ1lkSXg5cU4vdS82aEFULytm?=
 =?utf-8?B?ZmR6U0NubTh0cDJrWWVmNmVVZGtUbGI3TFdvb0RESnhBbkhib3pScmU5Nk1p?=
 =?utf-8?B?U2FrSWpmV1pNcmFzU3JDNGRwVGRsT0ZNWTAxY0o1aUczWWFjTFZFOG13eDg4?=
 =?utf-8?B?ay8yMUF1cEQvVTk1V0Z5OHg2L21lbDZaaDlYUVlYbzd4L25hL2NqYy9lbDU2?=
 =?utf-8?B?enVtNVorZlVFalR4TlVXRjYyYStGc1NyZTFBOTQ5MEhEMWI4cUVNcEtuaWM2?=
 =?utf-8?B?c2Y0SzYyMnhSU2s2Z01XcWNCVU5KM2JQUzZiMFNGZjA3bnk4cEMvUHBHQTVC?=
 =?utf-8?B?YmsyaFpEeFVFZFJkV3dNVlBwSUo3c0orREo3eGo5c0drZ1QzQlZDVXFoc0kz?=
 =?utf-8?B?S2RwL3BkUnVoUWN0SFNTd0U2N0lFSnpFclBGc1ozb2oyakpDVXJNOW1zRmVE?=
 =?utf-8?B?TnM3MFJLSERLTC9mTm9IMVVjU1N3MjZQTGxYV1dMZG5nYU4yTHVDeXIyK1Zo?=
 =?utf-8?B?NXdhbmVxZ2FnUkJqUnZzVmxHKzV5MzhHT1pzUjB0Mlk4QmQ0VkRleFdiY3dR?=
 =?utf-8?B?MU4xbkh2TGtocllFUkZFTGMwZHZkVlVCME9rTStOb3VQMjh4R05lU0d2R2d6?=
 =?utf-8?B?Y1RjbDVSTFIvWmh4ckNPY2o3cmN4OEQ3elBMbWlIQ25OKyt4WFRvQkhYUXhy?=
 =?utf-8?B?S2ZhdHVZVkl3NjdVRjZFb1ViN3o3OHJDNlhIMUxYck55R09aRGtSZU9pSW0r?=
 =?utf-8?B?YWYyZE1DZTRqZk16NFZRS0ZRb2lYa3djMGJqUUtDaGNrYlJFTHdUNVVpVGgw?=
 =?utf-8?B?cHlUV3E4eXRaRUNFWTdpQjlSU3FubGM0UnExcmJuMHQwZVk4K01PaWhRSEdR?=
 =?utf-8?B?UG40d3dJenNUcFNZTXJaYWlXWmdXbkJyYVZMcDFsZ1I4RDBLdFM1MnZkSmNh?=
 =?utf-8?B?WmFjSllESVp5RUR0TjBGMmZneEphdTJmUmdUOGZxMFh5cDBFVHdBd01kRU9S?=
 =?utf-8?B?b21mOTB1SHlOSk1FNW5jaERrS1B4ck5FTEtUNFl3SzJaTk9IdDZ5Y1F0RStX?=
 =?utf-8?B?Unl1MTkrZ2gxK0pOWkZIeU9TVWZITHVvNTNOUkovRXdZSGRhUjluYk12TDNa?=
 =?utf-8?B?ZlhlcGk1S2VYMXlLRXdWaVd0bk9ZVFI4bDhBMnR2WklSREozejZrTWYzWi9Z?=
 =?utf-8?Q?d6rDlw32PIWXfMMldU7HS1MnT8xDGJqug+6OSS0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmJ1UDRiSHBRUmNiZGk4dkQwWFJSZWdTaGJQWXBndGJBVXF4K251Yk5yQU94?=
 =?utf-8?B?d0lQTzYva2Z0bjYrV2JiMk1NY09JeXJhczk0RlQwVitKU1dvSFF1SDRwUGgy?=
 =?utf-8?B?QWFXbXgyRGswM3lhUzI0b2hMZGQ0WjB3VmRwNDc3ZlYyRlorV1J3YS9qWWRK?=
 =?utf-8?B?cUNpK1hCT1Y5dFo2b0dseXRKUDk5TE55WUVCeFNTYWRSbmZGWmV0dExabzh1?=
 =?utf-8?B?d0hUZTdlOEFuNlZhcEF0eHdLcG1zbGx1RHU0bjNLUmpubTJlU3lqWThJTy9E?=
 =?utf-8?B?OFpjY1F3OTdhOUxBR0EzOHpVSVJiSmxzYlBwQm4wcytNVEMzK2krRlRBT1lN?=
 =?utf-8?B?MnJ5Z2NGZFdoN3dBS2VMcnRuM1RkOU5WTVAvRXRUVXJUYU93eC9LODhQV0Mx?=
 =?utf-8?B?Z05GMlRPcFd4UmQ3TUxRTHlqNEFKMmlPWm9GRlQrUk9MVlZIUXB6ZE5Pek1F?=
 =?utf-8?B?UGFJVkZVaXgxMzRjZ0xQR0hMVFc5cHRRa1ZSbnAvZUdmYW9DZ0tQV092MUEv?=
 =?utf-8?B?MlhZN0h1VjhBN010L2VQZGlDdExNd2IxTmlzNVZVbFNodkVPTndqTDlqR2Rl?=
 =?utf-8?B?Wk9UTDJvRWludkJDc1gzTHVRUk1IZlFzOXRvZGN3b1JocHJ1aXZiZFczbTdx?=
 =?utf-8?B?blk2b1B2OENWZHdJU05OQXV6a015eExOeFBjV2NaZGhzS0dJYTFNZ0ZOVHRK?=
 =?utf-8?B?UjdSRFI1cHNkVEtVM3NaMlU2NjdmaDc5TGF1Y0F1MDVrd2JydEI2NmJpZS9i?=
 =?utf-8?B?TGEwQ1ZKK0xOZ0lhM092Ymcxb2U3VDA4L2pmNTJCZjVTaEx0Q0dRaVF1bnpJ?=
 =?utf-8?B?RVltWlJiZnZhT25oNUVzd1ZwWHV5YnVycGhTL3JNRW0xQW5lUTJzVVdTWTN2?=
 =?utf-8?B?ci9hc2REbVNLTnBZLyttdHowcitYcUcrNkIyV0FuaTlCR0E3UEF5V3puT0t0?=
 =?utf-8?B?TVF5bWl2SFlsVEdOdHlyRU1uTTFoK3FrdGptc1piQ3U1Z2RveFhTVHRJU2JC?=
 =?utf-8?B?ZFFIUWxFckgzcGN1OHd3NnFHM1NJT1Evd1MxNmFyTVZpZ3BmQVRxVFhmaTFI?=
 =?utf-8?B?UHFadThycG9sdU9jTUFWUFBrQXVadVAxODVkaTFxQ24xcG9kZVY3NDBtTlk2?=
 =?utf-8?B?VEkwcSs3bXRCbjJYVDlwNXhWeTZUOHplcFFGOTJyQXRQbkhBVGl3anl4R0ow?=
 =?utf-8?B?WUQrQWNkZnVLNkhmTnltd21TOTlPY2RUZDZlMnk2R1luSm1BK2xYSkNUTEdU?=
 =?utf-8?B?OEtvcFRGV1RyV3JEMVJNbVo1SjZYUko3MHoyc1J6dEdnZ1BRZ0hxdk9NQzF5?=
 =?utf-8?B?czFxZ09vUWVvVVlPQ05xd3lTRlRpTUR6Tm4rWmNEdXc0dWxhSm9OODhkYVNX?=
 =?utf-8?B?cHpaSGJ3YUZXaWZFbjdkSjg5U3F4SzlzZzNxdGk3ajZlcUhsSVJvS3V3VnNX?=
 =?utf-8?B?Y1VTVW5SOU9GNit3dG9oWnBvdU5MMTNiemwzWGtvSGtlSFdrM3hZSVVsaVZ0?=
 =?utf-8?B?RE0zUC84bW9KeGI1TzNWeTcydGFwUWU0WjEzeEt4QVlvQSsrVEhwa01VTmkz?=
 =?utf-8?B?MERaVXkwWjJySExUQmcyNHdoMWwyUE5NSzloSnpHNXRyYW1IZmtmby9LVHJL?=
 =?utf-8?B?cS9YYWg2NmJMRHNIbjFqY1pRSWcvZ1lTMXB5MFVnVGRnamxVcWxWVDFoSXM3?=
 =?utf-8?B?U1FlS3hVYUxXdElRSStnakRJZzluT3dTbUw2K21lQlJ3ekZoTmhlTy95d2xa?=
 =?utf-8?B?a1JHVzV5Z0c4VlRGak1HYXNYMjN3UXIwVVMyQ2VrRVF1SUUxSEg3YzczUHNl?=
 =?utf-8?B?Vld1dVpvQ1UrZFZVRjVFc3oyY0dCMG1nNnV3T1MvRFpGYTZGc3FlWVdZZ0Fp?=
 =?utf-8?B?czJQZmRTaTNlYmk3ZTF6WThVRkdoMGlyRzdNM2tlaXZWUlgxNUx2ZTIvMUh1?=
 =?utf-8?B?anFzY0drOEllSDB5NkZwODYrOUIrKzRPLzBhalREZ2trMjVDU05ZMjhZR2FE?=
 =?utf-8?B?UzMrQWowbnNRODJZY3N1eUFaZmk1ajRCUTQweHlOYXlLa0tLelB4WkgwTUww?=
 =?utf-8?B?eEpIRzdWamNpdzZWRk1vUStUaTVtTjNyQi9JeVI3YWQ1Y0VRUmFHcmFQRWlL?=
 =?utf-8?Q?s9xL1/3UbI5WWEZhsJ2tsNgP1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87247fd7-d05f-4449-53ce-08dc91eb67f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 12:12:22.9600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwGq/fR+xEUiUrm0lsS1iDwUWxcwLETwpHOTCEZF/ua2FLoT+RS0qABWaRa1gS0A/QOqHgHm4T9iEFHMXbqG/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7527
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


On 6/21/2024 2:08 PM, Ghimiray, Himal Prasad wrote:
>
>
> On 20-06-2024 19:16, Nirmoy Das wrote:
>> On LNL because flat CCS, driver will create a migrate job to clear
>> CCS meta data. Extend that to also clear pages using GPU with new
>> ttm pool flag which allows offloading page clear activity to GP
>>
>> This gives very nice improvement for large buffer:
>> Without the patch:
>>   ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-benchmark
>> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.9.0-xe+ x86_64)
>> Using IGT_SRANDOM=1718889799 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: basic-store-benchmark
>> Starting dynamic subtest: WC
>> Dynamic subtest WC: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 4882 us
>> Time taken for size SZ_2M: 3679 us
>> Time taken for size SZ_64M: 13367 us
>> Time taken for size SZ_128M: 21034 us
>> Time taken for size SZ_256M: 32940 us
>> Time taken for size SZ_1G: 116261 us
>> Starting dynamic subtest: WB
>> Dynamic subtest WB: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 5417 us
>> Time taken for size SZ_2M: 5711 us
>> Time taken for size SZ_64M: 15718 us
>> Time taken for size SZ_128M: 26170 us
>> Time taken for size SZ_256M: 50529 us
>> Time taken for size SZ_1G: 177933 us
>> Subtest basic-store-benchmark: SUCCESS (0.504s)
>>
>> With the patch:
>> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run 
>> basic-store-benchmark
>> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.9.0-xe+ x86_64)
>> Using IGT_SRANDOM=1718889593 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: basic-store-benchmark
>> Starting dynamic subtest: WC
>> Dynamic subtest WC: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 4479 us
>> Time taken for size SZ_2M: 3291 us
>> Time taken for size SZ_64M: 6595 us
>> Time taken for size SZ_128M: 9069 us
>> Time taken for size SZ_256M: 12681 us
>> Time taken for size SZ_1G: 41806 us
>> Starting dynamic subtest: WB
>> Dynamic subtest WB: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 3317 us
>> Time taken for size SZ_2M: 6458 us
>> Time taken for size SZ_64M: 12802 us
>> Time taken for size SZ_128M: 19579 us
>> Time taken for size SZ_256M: 38768 us
>> Time taken for size SZ_1G: 143250 us
>> Subtest basic-store-benchmark: SUCCESS (0.328s)
>>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           |  4 ++++
>>   drivers/gpu/drm/xe/xe_device.c       | 36 +++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_migrate.c      |  6 ++---
>>   4 files changed, 37 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 65c696966e96..10ec02412dc4 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -387,6 +387,10 @@ static struct ttm_tt *xe_ttm_tt_create(struct 
>> ttm_buffer_object *ttm_bo,
>>           caching = ttm_uncached;
>>       }
>>   +    /* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear pages */
>> +    if (xe->mem.gpu_page_clear)
>> +        page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>> +
>>       err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, 
>> extra_pages);
>>       if (err) {
>>           kfree(tt);
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 75d4c8ae9234..8e8d54c59aae 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -240,8 +240,6 @@ static void xe_device_destroy(struct drm_device 
>> *dev, void *dummy)
>>         if (xe->unordered_wq)
>>           destroy_workqueue(xe->unordered_wq);
>> -
>> -    ttm_device_fini(&xe->ttm);
>>   }
>>     struct xe_device *xe_device_create(struct pci_dev *pdev,
>> @@ -260,12 +258,6 @@ struct xe_device *xe_device_create(struct 
>> pci_dev *pdev,
>>       if (IS_ERR(xe))
>>           return xe;
>>   -    err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>> -                  xe->drm.anon_inode->i_mapping,
>> -                  xe->drm.vma_offset_manager, false, false);
>> -    if (WARN_ON(err))
>> -        goto err;
>> -
>>       err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>>       if (err)
>>           goto err;
>> @@ -543,6 +535,13 @@ static int xe_device_set_has_flat_ccs(struct  
>> xe_device *xe)
>>       return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>   }
>>   +static void xe_device_destroy_ttm_device(struct drm_device *dev, 
>> void *dummy)
>> +{
>> +    struct xe_device *xe = to_xe_device(dev);
>> +
>> +    ttm_device_fini(&xe->ttm);
>> +}
>> +
>>   int xe_device_probe(struct xe_device *xe)
>>   {
>>       struct xe_tile *tile;
>> @@ -550,6 +549,7 @@ int xe_device_probe(struct xe_device *xe)
>>       int err;
>>       u8 last_gt;
>>       u8 id;
>> +    unsigned int ttm_pool_flags = 0;
>>         xe_pat_init_early(xe);
>>   @@ -572,6 +572,26 @@ int xe_device_probe(struct xe_device *xe)
>>         xe_ttm_sys_mgr_init(xe);
>>   +    /* On iGFX device with flat CCS we clear CCS metadata, let's 
>> extend that
>> +     * and use GPU to clear  pages as well.
>> +     */
>> +    if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe)) {
>> +        ttm_pool_flags = TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE;
>> +        xe->mem.gpu_page_clear = true;
>> +    }
>> +
>> +    err = ttm_device_init_with_pool_flags(&xe->ttm, &xe_ttm_funcs,
>> +                          xe->drm.dev,
>> +                          xe->drm.anon_inode->i_mapping,
>> +                          xe->drm.vma_offset_manager,
>> +                          false, false, ttm_pool_flags);
>> +    if (WARN_ON(err))
>> +        return err;
>> +
>> +    err = drmm_add_action_or_reset(&xe->drm, 
>> xe_device_destroy_ttm_device, NULL);
>> +    if (err)
>> +        return err;
>> +
>>       for_each_gt(gt, xe, id) {
>>           err = xe_gt_init_early(gt);
>>           if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index c37be471d11c..ece68c6f3668 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -325,6 +325,8 @@ struct xe_device {
>>           struct xe_mem_region vram;
>>           /** @mem.sys_mgr: system TTM manager */
>>           struct ttm_resource_manager sys_mgr;
>> +        /** @gpu_page_clear: clear pages offloaded to GPU */
>> +        bool gpu_page_clear;
>>       } mem;
>>         /** @sriov: device level virtualization data */
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 05f933787860..0023f32d147d 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -1003,6 +1003,7 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>       struct xe_gt *gt = m->tile->primary_gt;
>>       struct xe_device *xe = gt_to_xe(gt);
>>       bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && 
>> !IS_DGFX(xe)) ? true : false;
>> +    bool clear_on_create = xe->mem.gpu_page_clear;
>>       struct dma_fence *fence = NULL;
>>       u64 size = bo->size;
>>       struct xe_res_cursor src_it;
>> @@ -1022,7 +1023,6 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           struct xe_sched_job *job;
>>           struct xe_bb *bb;
>>           u32 batch_size, update_idx;
>> -
>>           bool usm = xe->info.has_usm;
>>           u32 avail_pts = max_mem_transfer_per_pass(xe) / 
>> LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>>   @@ -1032,7 +1032,7 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           batch_size = 2 +
>>               pte_update_size(m, clear_vram, src, &src_it,
>>                       &clear_L0, &clear_L0_ofs, &clear_L0_pt,
>> -                    clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>> +                    !clear_on_create ? 0 : emit_clear_cmd_len(gt), 0,
>>                       avail_pts);
>>             if (xe_device_has_flat_ccs(xe))
>> @@ -1060,7 +1060,7 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>           update_idx = bb->len;
>>   -        if (!clear_system_ccs)
>> +        if (clear_on_create)
>
> will break on dgfx

True, I had a different version but I didn't update this afterwards.

Let me resend.


Regards,

Nirmoy

>
>>               emit_clear(gt, bb, clear_L0_ofs, clear_L0, 
>> XE_PAGE_SIZE, clear_vram);
>>             if (xe_device_has_flat_ccs(xe)) {
