Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81116BD3480
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 15:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB17110E396;
	Mon, 13 Oct 2025 13:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYFuwGe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8140D10E395;
 Mon, 13 Oct 2025 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760363389; x=1791899389;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iFIUZX3a3jeeq3u5npeZvqssTqP3uzJm6liLaeDhFYU=;
 b=JYFuwGe4EkCwolvcJXNCNi3wgXtyCTXTiFsV9yhFYyS7kOnJsf07pxxF
 4qm7+aJfF+AtBJclEwpZWYG2t9HJlgSFCxyAJVxG5MXV7PyQDt1+1Vv/5
 BVq72sbdFS7BXFLIcTW2Y+MuZyTmXdhb3w1Nl+uKCaCSgWfzDtNExqxca
 3J7E0gRU5bLWUuhqQB2xtgSbaf5CLM6DqndAAr1ltkQwgFVbvVfJj48Db
 v9OKXY+NRYs7OelakVnnhwmr79pVorohKEqdAYnNam6UKMm6M3gDN6wYz
 totw/BBTOciOVxjGgiz/TQ+RKdAHEg7rSIO/d/6+9xNkqsHkEjYXcPgnJ g==;
X-CSE-ConnectionGUID: PsHaTgJ5TROeMkVkLJ/eKw==
X-CSE-MsgGUID: g7rW5nuURH+W441POLX6Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66155942"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="66155942"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:49:48 -0700
X-CSE-ConnectionGUID: xb/dtYZQRwqY8P1CmT8JKQ==
X-CSE-MsgGUID: kgOhfws2TdGVqxA9pcLaXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="180746084"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:49:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 06:49:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 06:49:47 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 06:49:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u20idHWBkABVVBngJwCwTg3fqGbJ318PqzSBU3JEPwxp15hxWAIl+21MM3pjharmqPKhyRi95VlksJ8CYGS9+41KHdHwunRVRkZaiviT9hbEYTBz9qJXGX2/8TNwGPYbTfJdbA883JI3AssulqzYYb+c7fkvCKFxoabiXTnTTw1fJtSS/2k93XBxFWY5Xjp+Q7iHtPQgs/oouZOhxpsdrRettxKSAFftq5rzBUYXAWulO+a2t0Ui/7SZ7Ziwfd4d+AjzEwo5qTBKFNdpvDTGepV7O4Zyjf960unMleKY+2Km1M2uPv/PXa78E4YoTpMNOWlSKaW6lcGnROEjJqnQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oJLyYC02tr9b+NmEAdHzR/MQchMSoQxwbWBefqTdJ4=;
 b=Gqy4tXScGhSLi7e+2XWq+UqXeiO3kj7RVfG5zhEMEuvJI7IhgWK+I6vZS0/V1XZPUzy1dYOzmGlSySnT7z+0xIyDAckRkJNlNTegPXhys16YAM5TsCxw76E5cX+08YOKR2kkGuAHmkn9F9wcFLdTb8tNKJMGw1PW4fXmkPnbjQuArpgu8Z198eXQzgODm03XzCc787lXC3G+XGznizcENT9IZ5YwJG2aGlX46xe8P2QK1cACgkdspSBXHIQVzC7kUYRf+15Qk1ZLEX+/xfdc4K+7s2gcUqLtQBmCfU+yojQjUaU11Ad1PJfg+dviwnhubbbBum3MU8v3l1VnDwvJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 13:49:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 13:49:44 +0000
Message-ID: <b16fcd12-784c-4201-ab42-42d1bb492da1@intel.com>
Date: Mon, 13 Oct 2025 15:49:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/26] drm/xe/pf: Add wait helper for VF FLR
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-25-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-25-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0299.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d40b24-cac1-4c20-2c91-08de0a5f5dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEY2Z3JQcmdwdmdadHVwVDdUMTJJbGEyb3I3T215MmljU2ExVEx6ZnB0RmI5?=
 =?utf-8?B?SzZ1N1BOMkxIRUVsWnkxQStxc3d2ZDRKcGVjZFRSSUVPREpPUm81OW9PUXVZ?=
 =?utf-8?B?bHozeTFvSk02ZGhSV2tKVzBqSUs0L3VBWkpvdloyVCtWcmpzdy9tdjdmU0J6?=
 =?utf-8?B?ekg1c2dMQzdBUWtrS2ZiZkE1czJPcUw5TG02dnBrK3dOTXVmTm90Q1hXcjhB?=
 =?utf-8?B?bG00eldoT2VRbjd3ekRCZUdsM2dVc2MzKzRLK2JMd09JbVNwdGRLbCtBWExL?=
 =?utf-8?B?alo3WFROZjNLcVRuWWV0YmlMM0xzK09ndTBFVXFlemFiZWhpS0lDcTBMMlEz?=
 =?utf-8?B?ejhnYlpBSE5aUTQweUM3Q1JsU0tvaVRWMllHQVlKRE5wSzdESnBEMWRPRHZh?=
 =?utf-8?B?akhuUFlwSnZIaG55MDVtS05lbXJlRGladXdrYTdqQnRzWU5adUxOQXFEMUZF?=
 =?utf-8?B?MWl3VFIrUkFxZm5pVjgxQjB3cVEvd0RucGtqZzEzVHVUdWtkZlk4Z2NCZGg0?=
 =?utf-8?B?U2QwV28wMTcrTE0xcjkvUUNnUEhEbmFvci9BU3hJMjN1R0cydE9KVkUrS3JW?=
 =?utf-8?B?QkRxbHZzS08yRHdFcXZMTXlqb2pOMHRmSVAvSHMvYkVjcVAvSlBvK2w0eURM?=
 =?utf-8?B?WlRmQzJwN201YWxtYUlwSGpjMGF1WDZGWmMyZHZENnhNUERGTzUvUDRtNTJ0?=
 =?utf-8?B?aW8yUTRna1M2a2h2MzlNTnhVVzFNRHRtRERHbUh1cUF0b3NjT1UzWDdZWUJJ?=
 =?utf-8?B?ME5RZW4rUzNuYS9FSE94VFhJdlBqNFU0eUtpSHd4aGFTYTZvdmZ1VjNHR1NV?=
 =?utf-8?B?VStXc1ZhRVN4VHNzZFBPYjRxcU44Zm9GTHdWL2hSUFY3YmpveHVwZWdlSHBT?=
 =?utf-8?B?SmJFVXBTdktEMGxGRlk3L056YndtU1JicEl3MEVnOXBucEEzdnB3ekFSMEM2?=
 =?utf-8?B?bTJjUGp6cURwUTNINm5vNVdXUllabnJpdFBtTE0zR3Fxa3Y1bXBXckhkVUdE?=
 =?utf-8?B?MG85dlIzdGhXcS9McFZkeTFpMGtzRzNGZXZMbE9KdWl1Y0NaNG1OZFhnbEtM?=
 =?utf-8?B?MlJTK2J1N0UzMnVSRWl1N1FMMkpuMnduV0p4QU90enpSVHd1RjFwNjdGY3NX?=
 =?utf-8?B?MTZlTXcyUUw1ZzVOVTlWNnJ4bGg0cnJSeVg3WVFoSWt4WWRYb3dRcy9zU0Vu?=
 =?utf-8?B?NnVYWlJQUHgrK0Rnajh3Y1pqZlZ0MDdGbCtnV2lPdklYanVUcSt1R3ZnZFQw?=
 =?utf-8?B?YTVsUWtPRFlwNkJwcnVSU014di9EdGs4VkZ5bU5xcEhlVlhCbDNIQ0dDNklS?=
 =?utf-8?B?RHcvQ0N0ZmVVSmZLUzRMUjJrYVg3THA4NjdwOW92TThNRXdVZFdGK2FVNWRp?=
 =?utf-8?B?QzRyOExFZHFLeFRFWjUzRzFQYzhabkpBYkx3YTg5ZXBNd3FBbTZHYklYcGdi?=
 =?utf-8?B?ZFM3Yk93RVd5WFhsc21XQ2hEMnJJWWFUTThoRk5YOG93bU9yWE9abHp5VGh6?=
 =?utf-8?B?SVlUU1dzNUxtUEVBYWpDWUlScHNuNENsOWJmRkFlcmR1KzU3Z0FSb0x3MW05?=
 =?utf-8?B?MEUvZnQ2U1BvL2xDcStHd1dGeHF2TVM2M0xNemRLNzI5TG9wa2Y1djNOUjRy?=
 =?utf-8?B?dllGRWFaMDlnUXQrQXYycDZrVVhmdGwzRlBEbE1aTXlMRmZhb0VzYzBkdzV2?=
 =?utf-8?B?NHdUNllZR05FVFRoVEdPRUlQa256L21wbUxzaWR0TDhxdHBQbHAyNThlcjhO?=
 =?utf-8?B?UU9hVkcyT3M5dUt2T0w0UDVWZkFESTJMNWFXRUlVWHA3K2NYclVucGVBZFdX?=
 =?utf-8?B?bHNJZy95cGhoMGRFRHloWVdtc3pVRHR2cmM5emJKaHNCaUhRb3Z0RVFIT2xH?=
 =?utf-8?B?dWZRWVBpUWpORmw5VG1OdUlhN29xWndsSmFXTVlwVitpTHJRY0FYdkVROU5N?=
 =?utf-8?B?RmRiUkRSb0lTQnlFQzRKUHAyWWg5eTVVWXZ2aEg2SklpRm5QMzV1WkV5Y3lX?=
 =?utf-8?Q?Xhbq+thAk6Nb/Bk59jcliPrpCIC5b0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFZQZGpPV2JUbDI2RnFpNWMvOG4xZjVFTEpyNHJVckh1WGFQSi9aT0Z2VmR6?=
 =?utf-8?B?WFVwN3ZvWmI1UWJtMi9UK2ZTOGtPaHovcWtqM3B2eGQ2SFpQM0dyUitYTlhR?=
 =?utf-8?B?ZkZ5cXozZEdtYitVQnVzSnFWZTlBMEJPQjQyOVgwN3BKaXIvY3g2a3hLTjVr?=
 =?utf-8?B?elBQbVh2NHB3YzhBRllYNW5wOGdZTkFCVjJUWDlqYllISWdvZG5LcHlQVWI1?=
 =?utf-8?B?NGJFd0l2Z1laNlRzSVlYQzlGeWMyaldPMlJwWTYwYzZvcGhqdHFmUHJ4UEM2?=
 =?utf-8?B?Mm5aakRDdjdKdnByRDd2MXNwRFk2Vm1wMDhiWWhtVGpaakFPRmNnOWRmM2dW?=
 =?utf-8?B?YTQ2WlpTbU4zb0V2eStFZ1JyMWkyMCtwdFpyZzd1ZkNic1F2aVpIV0x2SU8r?=
 =?utf-8?B?SjF0ZFpzSlUvZ05LdzNnbzkyeGNxVW54MlE1ZjFjdkhkWEhVSHBFd0ZXb3Vq?=
 =?utf-8?B?US9zUjJoWURIUVJGaWMzRUk2dEkvWm55NnhEc3pqOFhjWlZENVdaSGtpVm0z?=
 =?utf-8?B?eUpQNUZ5RFdJOHYzRFZJYXRQbitYQXJvallYY28vcGFFbmoyZTgwNzdodWNm?=
 =?utf-8?B?Nm5tV245SVF0RWtDUlJlejJLZ0M4Uk0wRHQ3alRxVnRWOENJdlUyQWVOU2pV?=
 =?utf-8?B?ZGRTS2tBUUJ1dC95RUhUZVA5L0thK0R0NjVHZUxCSEl6NFU0dzc5dWI1eWJS?=
 =?utf-8?B?U1psUGxmQzJCVUt4THd5cTk0eUlQd25TZktsOUlqdXc5RmNBTlo3RU9xU0dD?=
 =?utf-8?B?THRqTXJSck91Mm01bGY4TE1xazhJVXBZN2M4OTFkaW1WVGU2YVdNMkdZZHYw?=
 =?utf-8?B?c2pENWY2aWsxcTAzT1hYd2czOXdJYVhSVTNQMk4relRvaXAveXV5a3NYTS9G?=
 =?utf-8?B?NERaQzRSVnRtMlBGUzFMMlhkMThvZWJYakI5WCtqK2FuTENHUXZ4aUdUMitV?=
 =?utf-8?B?am4zWFI4MEZFNVIzYnk1U3pFRGdqOWNHSTM1UGJ6dW1RV2hReENFL1Y5M3NW?=
 =?utf-8?B?cVgvSUpKR2pXNGc0SkZMOUhHS0tsayt3enFhWE1jaWxOVzZ2eXBaZkhrUjlI?=
 =?utf-8?B?REFzcnJ4cTR0cU15QTE1MC9tZWNkanBJbUwyOHBlQVdIWDdnUTlVbWJxcE00?=
 =?utf-8?B?L2pMRzlEdFliaE9idlhBaGluMWpqWTk0bFFWaVRTWGhubHBFdm4yYUVUWVdH?=
 =?utf-8?B?UHlpKzh3UFhkT25WZlBZY1Bkc0lXTWpidDZBNXVQdCtNTkZxSlJPem40RExw?=
 =?utf-8?B?RjdMMnBQT21mOGdwOFdmLzFFVWdFcXVqdENRa3ZLOXRna2hDSExvZEFWU1F6?=
 =?utf-8?B?UXhMcW44cittQXlGYjdUcXdoWXNiSmh1bWtZRFNtVDZjbGRGQXk1dENCSUZw?=
 =?utf-8?B?MDJ1Z1FINmkyNnl1cnZuME5NT3lmMkRQcnFtR2ROM0RHNXcyODNBdmlOVVcw?=
 =?utf-8?B?S3hVSlJZeC9uVXoyd1lnblFZU1MycUJIV05mdExPb2xRekRnZHc5ODRyNjBM?=
 =?utf-8?B?ZUdiTmcvN3F6Y21wY3NtaDIwREZSUkJYdGsyem9oRldUbE03N0trSTNJaVpP?=
 =?utf-8?B?MVFiRFRFc2FuQ1F6dGlZUysrK0dKYitmcDJqS1pEK0NhYjl2QXR4cHFqaG9Y?=
 =?utf-8?B?dkxDTkpFWVp6L0RnNXpDZ2syTjdHc0VYQzBlR1hvckpmeUlsRldrK1lzSWU0?=
 =?utf-8?B?LzgrRUtSR0NjeitYeG5NM08xNXprdGd6dVVaSDNubkQ4RHFDNDNZajcxMXNH?=
 =?utf-8?B?SEl2eDZhNDZYTktwcm90YThSYmFrcHgxdXZtUG5NU1BtNGQ3eXJnenBjRzJK?=
 =?utf-8?B?TXJWcmZMUisvWTY2bFBSdHlNdzRtbmVlREZyM2lwdEtsQ3RoMFFrUFFFV2JE?=
 =?utf-8?B?RDVDM0U3L0hjU1dldUlFcGpNNlR1cUZRNnFONjdOTHluVXEzc0NkSGZYTjRo?=
 =?utf-8?B?RHgrbE9Xa1hqUHRLZGRpeldsZXVrNDRybVU4Q1JycVlzS3ZrUFRqVXVXV1I3?=
 =?utf-8?B?RlRHSC9hTUhvS0JRbExuV0YyNmxuN2tZT3lPRzdzc1hGRWNrcnlvYTlhQ2R5?=
 =?utf-8?B?dERtekR6SUlSTUNIYUU5TDBmZnhrT3pXRWlVUjhIT2k5QXdhd3NvZmQ3R0RR?=
 =?utf-8?B?b2ZXc2x0SS9OVzhWdm9zT1EyMm0zdzh0Rlhia214UDBUSmNHckI1M0hyVnMv?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d40b24-cac1-4c20-2c91-08de0a5f5dab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 13:49:44.5079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uvfi2f5oTShC/XDkW0ivsyiMfrMwZQ1CHa5oo6U9gDUo0YIMujQ7thdM3bN9H6+fa38w0ZqYZhgLQF6wToy0qYtEEjmXj526oo7b2lRzbHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> VF FLR requires additional processing done by PF driver.
> Add a helper to be used as part of VF driver .reset_done().

this ".reset_done" part might require some explanation/update

> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_control.h |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> index 10e1f18aa8b11..24845644f269e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -122,6 +122,30 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
>  	return result;
>  }
>  
> +/**
> + * xe_sriov_pf_control_wait_flr() - Wait for a VF reset (FLR) to complete.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_control_wait_flr(gt, vfid);
> +		result = result ? -EUCLEAN : err;
> +	}
> +
> +	return result;
> +}

one might want to call this new wait function from within xe_sriov_pf_control_reset_vf() which does both trigger/wait
but for me it works as is, so with commit message update

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +
>  /**
>   * xe_sriov_pf_control_sync_flr() - Synchronize a VF FLR between all GTs.
>   * @xe: the &xe_device
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> index 512fd21d87c1e..c8ea54768cfaa 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> @@ -12,6 +12,7 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_save_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_wait_save_vf(struct xe_device *xe, unsigned int vfid);

