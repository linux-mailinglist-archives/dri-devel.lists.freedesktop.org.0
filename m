Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FABBFE6A4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5DA10E061;
	Wed, 22 Oct 2025 22:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAu0A8rC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432BC10E009;
 Wed, 22 Oct 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761172317; x=1792708317;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oOjloh5QXJwKpawnK3tz4Phs9nY0dPPqgC66lVDtV6c=;
 b=HAu0A8rCW8xImycjASUGEpANTCKXlaai/Y8SG7avUlfBnbPuFq6npEQM
 FGHWLQ/qUDscudN5vwkLicI1pe6dIXAVcazGk1uIk0epzrYf7WBOsWFgP
 dWL6bf0btv5RuzkXGWftOquXJ4nBFevsYxVcVGDbGIUxJZ8Bkvd3Ck5Ig
 YXAs3wowBeOpD1lkHKkOr1U/9z64PelFigpSPNdMtNj6ttg4Kge6pwykB
 G6zvD6TK59q6aSBBVfYeVWlYun8onnhSlY3fFjCLs2JIRf94JGFQNkF/f
 FrMkdEYUB3fWBx8PEItX0GsV5Z5v5ig2dX5kLuo7/IswoNbGl6u200+Dx w==;
X-CSE-ConnectionGUID: /z/0KL/BQheOHSTaRpJrjQ==
X-CSE-MsgGUID: +bv7FkaYT/28dqGFTWz+Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74680259"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="74680259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:31:57 -0700
X-CSE-ConnectionGUID: Y2p6TRNvT1GbYkdHfV102w==
X-CSE-MsgGUID: 5ioUuIkZRUydKc5+GdotZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183579961"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:31:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:31:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 15:31:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:31:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtxHy0s7DDujJQD9FnV4zsSu+AEjLDtFYCqY7VmyjUqhAXPULNNmHbGsZdvo2WFGKTyWxTZDghkPQsVgEu+v7WguIgy76bea9KiHfdRKlJIvZyfW3Yt24IiDrF5GyKif6ZGNmfRn3Qo6AsniUk2sR8v0SNx4gmAvpe2mQiQmSMS37IgdIMnn8mKp4UnuW06qKgtfQRSS44TBR6+bhx9r12wXKAdopJiWp/OS3WXctrQtOMbelvA8GOpcFfy2Se0qs0jk9L8gdlsDS3WbahmHRo499BLQ0UBuqUTXnsGJ4OOUAE9jdWIbTUbqahYFHRchqnAMdILktsbu/zQYWxggVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUrpCMozDM69VPU6GbnPY2bvavGwxOPPbbO9ipngwXQ=;
 b=Toml6wi6LRNYkyG70CVzdE5tXIYt7W27StrMiwYtyXtHS6cb0S34Kyti7xNmAn0XXkNr0Uo3Bz2rDuTujFr0BQTih1JD29NY0H46xUxkE2GmKeOmpEWCsO7A+mYCPyzoGRTwi+ftTMNUj28DOVi9XKCaQIsaqNv7zhoK/zm6fxlHHOlJvgjDNfCUtOw4+krqCwDTZ5AkRwXjbw2PvYMEWepXr0un/Gb9zLlhBy0ohusJYhW4k0/BAWwoKg+HKPXV9gsLoYzRIOBYzat1GUBqavioVZDC0LkwjSy0p/LCeBoTNtiB9YhDZK1UwMZwZf0LiuZdm4dV8gAlC0HJ9MZt7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 22:31:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 22:31:53 +0000
Message-ID: <fdf1ebb7-e8dd-4228-9b13-588e2e617b15@intel.com>
Date: Thu, 23 Oct 2025 00:31:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/26] drm/xe/pf: Add save/restore control state stubs
 and connect to debugfs
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-4-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-4-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: e0537658-d988-4938-ec77-08de11baccbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzdjdkFhcC9JQjF5ZUwzcVZxUFVoUUNoZXo4VXBwZXNqZVdhSmlkNWwxclFj?=
 =?utf-8?B?ZVk0NWxXMlp1QU1Id0czTHRUaHlSSHI0cW5iS0RwS29jWmM1Wm1HdHlZSWJh?=
 =?utf-8?B?L2Z2bGtuOXZaRFp6eDNjaCtPQkx6WTFRRHkydnRMRDRuTXZvN3NqZ2xIOEdG?=
 =?utf-8?B?aXl4ZjI2TFZ5eGh5M2Rhd0VtRit5MEU4MSt4dGllOTB2UGZDWFAyVVJ0SVUv?=
 =?utf-8?B?MzJ6MWwrdlFsbGNKVUxIcjdlUlcyelpHSC9TVHJPZGlzQ1R0c3NiRFhRS2hi?=
 =?utf-8?B?WFluaEM4OVRhbFE5YVFqaW5zWFduU0tNNHZidE9nWW8wSDN6RnIyMStUbWJR?=
 =?utf-8?B?WWttcU1xaW5mS213ek81aDR5d1hoM3h1ODlNdTFWTjM2ckdEOFE1bnI2cVNQ?=
 =?utf-8?B?U003WDJYaXY0R3VpTisxSXFrTWF3dGlJUU9HMWZtaWpPUys0cVpaVzNkeVZz?=
 =?utf-8?B?dWgzeGpUR0Rxa3preUppMFN4SE5JUU9VcitKZVNlQjhDQWhlemRyVENnMW5U?=
 =?utf-8?B?MEowNVZpUi9BNnpjTjhXRlE4UkxHVzVsL0ZYenV4dHkrNU00WVA3LytjQ2Vy?=
 =?utf-8?B?Wjk0Y0QremdwS1p1RFFMZDhpV2JEMG9FcmR3ZmJuWDJwdDdIbGNGdVMyeFJ1?=
 =?utf-8?B?TmZScUY0RE1XTUIwaHFFWFBUZVFHZ2k5Y2NyZmUvY2lsWW9VcERRdkZXVFBX?=
 =?utf-8?B?SXo2Ui80dlNZc0g1aEIwdG9Zc1NaMkZOa0QyR2JyK3kzVm5LcDRpbDNlaDBW?=
 =?utf-8?B?VmJzTnMveFdoK29DVy9jdTJiN2R4bFZ4bWF6cUpYWGhyZDVvR0JZVklQeWJm?=
 =?utf-8?B?SUxlR09WWVM2UWgyd29RdnNibVdUbnVkdWs4Kzd3ZDN5L25DcE05Ykk0d3c4?=
 =?utf-8?B?Q0JlRkZRTXFROXhLSUtkeERzTncvQ1RYandWZHFWczZFMEhMMm91ZklHL21r?=
 =?utf-8?B?blJsQ2tBZ3ZuMjd4V2V4dHB3OUpES1RmRGNYRkpFUi9wZE9rc3JWMXlCaGVr?=
 =?utf-8?B?Uk1RMVliTFJrQWpkUCtyRGxzeUhqVTRPTTBnRDdYc1RGcFZKTHZqd3NNZFBW?=
 =?utf-8?B?Z3l5Z2RnVlc4V1RWamZkeS96YXZxY3p0TjZDeWh4aTIzek5UcUxqQytuR2lL?=
 =?utf-8?B?ODNLMVQweFlOSmxTZnV6TWhDTmJESjN6RytyYWEybWtrSmhjWStYRW5HOVhO?=
 =?utf-8?B?UlNrd3p3Vnp5MnRvMW9qU1lsN1VaTkVTSm1tL0dzTDJwLzlpbjhaREpSYzg5?=
 =?utf-8?B?ZWE2cEVDbWlCNWpEZHhKNlI0aHpQTkJpL05DZm5keUlSNXpla2lCVUdmdGNC?=
 =?utf-8?B?WnJ1eDlnb2lmVzVkQm5OZVhhanhXTk5pc21GUkI0K2JSL2Vtb25mTXFHVHla?=
 =?utf-8?B?dVpFTEs3L1ZGWXBRYjRKbkxBYUZiR1JNWGxIR2F2SXRDV0tQZ0pkdlFXcVhP?=
 =?utf-8?B?bS8wRTliQmJNRE8vNGJmcnVXMTBVREhaS2I5VWQ0RHpLRWdXb2FOenpaa1ds?=
 =?utf-8?B?YW52KzlnaGNhakNHY21Jc3pEanpGQ3kyWmE4c2dmQTlLYWNSTVdMbEpPSlJQ?=
 =?utf-8?B?Ny9OcExneHFCWkVYM2ZUU25RMEQxZm4zMjArY3pnT2hSa3RzcG5hVTFPcWx1?=
 =?utf-8?B?YkJ2ZTc5Zm1tVmd3b1BPZStqWkxyRGkrbTZNeEpjOEN4S3d1b3hrWGNFQm5L?=
 =?utf-8?B?UlZ6SVl6b0krc1FXcEJKUmtYdmhVSG5CRndxR051b2pYVzE1eHZtaWFNZUNU?=
 =?utf-8?B?akN4aE1QVTdEUStiQ2s4NWNQTFdjbzlvMHhOQjdJN2pDeXhtNjJmdEVuLy83?=
 =?utf-8?B?MzVESHNscWxuN2t6S0ZLUTFlNzdMVlljalliQVd5M0lwSm4xbDEyVTExNzZL?=
 =?utf-8?B?RkxCQTlCeEQwUXFld0t2TWV2cXRYbXhLM3NMWEM0Wm0yRW1wcFh3NVBUa2NH?=
 =?utf-8?B?USt0a1hsMmVkQVlxeXRyMzNUYXo0SWdZTXptMXBYNCt6YnZwempuTEJkbmEx?=
 =?utf-8?Q?g445xgyTmzQA7NkpNjF79OGYu9KYH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUl5ekZTQ3laeHJjckpLdG5udGVTU2lIZk04ZWEybnJ0T201R00ranpUYWUw?=
 =?utf-8?B?amJNYmVzdWVSUXMxRTk3bDdUN1BMbC8zQWNjRGZYOGdLR1BxcEc1ZCtVVldN?=
 =?utf-8?B?NVNEYTJHY2txeURuMXpIT2xNcUpnTmFBdnNhOEg0MWd0RlZNZDd6UlZNWk5k?=
 =?utf-8?B?UFJsK0hSdEJ0NnhSM0Q3dXhPRjg0OHBlMHBrMEl2MWthZTVjT1lJOFpUcGcr?=
 =?utf-8?B?Ty9VRC82dk5yb2pCUnk4dkUyYXVCVjY5UkJqVllMMUR5TUZSNmMvRjI2TVRK?=
 =?utf-8?B?WElJYXh1ekluKzNBS1pzenpkTjdZd0pEZ2czc1NIbGRGdHBHRFI0UTFGc0ZK?=
 =?utf-8?B?S0JTaEc0d0YzeEZQLzJsN0dzdVUxUnFaTXVHSm9WR0V0eGtHSGpJaXFLckxs?=
 =?utf-8?B?UG9pbWRtdEoyWWtjQlpnaGZkRU1FRm4wa1VEN2JKM3hMZHNpU2J5NnBLdmYr?=
 =?utf-8?B?RjdES2oyRGROS2ppbEtpQ09NVjNvb3NnYUFTWDMrcmJQS2UvaXVZYzVRa2E1?=
 =?utf-8?B?ZnNYd2dPcmZXZDJxN3NtTXM1Q0hVWjVOSTZjcEFPZHpPaWc4RWl5b1JlcEMz?=
 =?utf-8?B?SHBaUFF4RjJWdldqNHN6cE5DTTdoMDF2TlVnUWJaTUVOQmcraVIwM3d3TWtE?=
 =?utf-8?B?cmpNcXNuR0JCUVQrZEI5eHBVckdMUGgwZi81TXVDSmdHb2dTaXo3RkZaOVpT?=
 =?utf-8?B?dEFNcjFpV2JrT1lvallKRFF4a2ZGeWNqRVRvSVpzeGVXT3czaWVuV2RLczIv?=
 =?utf-8?B?b3RzdkRVWEExNFBmdzBsRGxzVUtmRVdOaHBMMm1XU011MWRIQjNsamtxZmJ3?=
 =?utf-8?B?V1h1UUNORVdUYzZYK1JQVEo2WmIxL1lpcWI4V21KemJkSm8yVUhoRWhzSU42?=
 =?utf-8?B?dVJwaFBCZUdoVG9FazBnTGQ0bVg2MVd4VFU4YzZZSEowZ2NVeDREQXdiaVcw?=
 =?utf-8?B?OEJQOUcrS1FYa0IzczNuRURXeGczM0xyOVJ3TVhjY0pyZEh2QzJpYkFLL0hK?=
 =?utf-8?B?V0M2SUFDaDJuUmtmcDFyWlYwcnB0bHlJL1dLNDEzOC9YVTM1MllTRE5OVGxI?=
 =?utf-8?B?b2ZFcDZZL2Q4ZkpmUVlva1NKTDZ4dVI0VkFiWGJxNDB2ZlZmMHlESW8yK0d5?=
 =?utf-8?B?UmFsRExZNG5MOVRQUlZ4NzhST2pBdUVpcGpnYzBKaXdkS1Z1RnpPMlgzWVFu?=
 =?utf-8?B?YkFNRUsyV0NVNURBVGlXVEIzNDFyL3hyaTRxWGZId1RTOCtzVVZwZGhScnc2?=
 =?utf-8?B?ZDdtUFJDczZDa0o2ejJNMDhMOVZ6VjZDMnNaY0p0MXM2Y1dhR3R2dEMzTEMr?=
 =?utf-8?B?S1F4MW42MHl3dVQ2Z3Z6QzhPZlF2RGhTcHVwN2Q5UmJ1Y2xGZmw2dXFaSkZo?=
 =?utf-8?B?a2x5QmQrU2kvdjdaMFF0RHJReldlZ2huOUh1eE9vd3Vtd1pNQXZiSFZvbWJj?=
 =?utf-8?B?cm9KVGdKME0vTzZNamthUGpJeVVPVXBLMWhkcnN2VGNPZnREM3JuZVZ5RGRB?=
 =?utf-8?B?alRJc1dWdGpyeUZZV1Bsc1cyZG5zWmZQMDR5SEcxQTJUeW9OVkliZXA2TXE0?=
 =?utf-8?B?WGtmVFllZ3hqV2FRRnQxaGE5dDVGVzVHaHFGaDRReDVrVE8wYS9Dc1VJZVFv?=
 =?utf-8?B?S3BieTRaMnBNM1BNTnZyVnVza05lSUEySDZsMkxqVXNWVkpBVnI3NGZpbkwy?=
 =?utf-8?B?TE9aZm1zYmNMMkJlMTZrdXJLS2pLTlV4UEd2VzZ2ZWZ4UUxqeVM3UUk2QlZD?=
 =?utf-8?B?NXpiVEl2OWRxNUxSSVUvNXZwbDFNamJOOTRaS2VHZWg2UEFrT2lwQXFoQnl6?=
 =?utf-8?B?VFhTYVE2NVRtY3NDS1hBNXFCazBaSENzNFozU01Md3J0dmpkYkdxeE1lbU5I?=
 =?utf-8?B?S3luWDNLR1luMmRTQ295Snp6TmVweVRBdUhKUUxZNUhnVW1BYTVESU1FWUNm?=
 =?utf-8?B?KzgxVlVTVHY4WmN6WEU0WEw2dDlOUWV0RjZldDRsS2hsaWE4ZlFKblFnSXUz?=
 =?utf-8?B?VVNBQlJJVEFvaHFCeEQ2Ni8zZ1hSck1KMjRZN1JwaFUyV055QXJYaXpMZUZE?=
 =?utf-8?B?WUhZN1VqVHpOT0VPTzV4bEdzU05xTjlRRmlxeVZKWnpKSDdERFNYTlIrL3FE?=
 =?utf-8?B?ZUllWlQxbVpOc3NkY01BcWVEWEdtNHY5NE1LRENkOTZSK2tuT2RMRkRDem50?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0537658-d988-4938-ec77-08de11baccbe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 22:31:53.2155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSm9RLlY/OQ3rCv5PnaYbB62mFUFchTORfentdjvIXECEdroA2n1UY0XugprcA7kPhdc/cilKSqO6bz+ZKSxQIZ9lzmg/DPI3Ztg/N93eec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> The states will be used by upcoming changes to produce (in case of save)
> or consume (in case of resume) the VF migration data.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 248 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  14 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  96 +++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   4 +
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  38 +++
>  6 files changed, 406 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 2e6bd3d1fe1da..b770916e88e53 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -184,6 +184,12 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(PAUSE_SAVE_GUC);
>  	CASE2STR(PAUSE_FAILED);
>  	CASE2STR(PAUSED);
> +	CASE2STR(SAVE_WIP);
> +	CASE2STR(SAVE_FAILED);
> +	CASE2STR(SAVED);
> +	CASE2STR(RESTORE_WIP);
> +	CASE2STR(RESTORE_FAILED);
> +	CASE2STR(RESTORED);
>  	CASE2STR(RESUME_WIP);
>  	CASE2STR(RESUME_SEND_RESUME);
>  	CASE2STR(RESUME_FAILED);
> @@ -208,6 +214,8 @@ static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
>  	case XE_GT_SRIOV_STATE_FLR_WIP:
>  	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
>  		return 5 * HZ;
> +	case XE_GT_SRIOV_STATE_RESTORE_WIP:
> +		return 20 * HZ;
>  	default:
>  		return HZ;
>  	}
> @@ -329,6 +337,8 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
>  }
>  
>  #define pf_enter_vf_state_machine_bug(gt, vfid) ({	\
> @@ -359,6 +369,8 @@ static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
>  
>  static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
>  static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid);
>  static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
>  static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
>  
> @@ -380,6 +392,8 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
>  
>  		pf_exit_vf_flr_wip(gt, vfid);
>  		pf_exit_vf_stop_wip(gt, vfid);
> +		pf_exit_vf_save_wip(gt, vfid);
> +		pf_exit_vf_restore_wip(gt, vfid);
>  		pf_exit_vf_pause_wip(gt, vfid);
>  		pf_exit_vf_resume_wip(gt, vfid);
>  
> @@ -399,6 +413,8 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
>  	pf_exit_vf_mismatch(gt, vfid);
>  	pf_exit_vf_wip(gt, vfid);
>  }
> @@ -675,6 +691,8 @@ static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
>  {
>  	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
>  	pf_exit_vf_mismatch(gt, vfid);
>  	pf_exit_vf_wip(gt, vfid);
>  }
> @@ -753,6 +771,16 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  		return -EPERM;
>  	}
>  
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
> +		return -EBUSY;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
> +		return -EBUSY;
> +	}
> +
>  	if (!pf_enter_vf_resume_wip(gt, vfid)) {
>  		xe_gt_sriov_dbg(gt, "VF%u resume already in progress!\n", vfid);
>  		return -EALREADY;
> @@ -776,6 +804,218 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  	return -ECANCELED;
>  }
>  
> +static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> +}
> +
> +static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);

nit: you can move expect(PAUSED) here

> +
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +}
> +
> +static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> +		return false;
> +
> +	pf_enter_vf_saved(gt, vfid);
> +
> +	return true;
> +}
> +
> +static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_queue_vf(gt, vfid);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
> +		return -EBUSY;
> +	}
> +
> +	if (!pf_enter_vf_save_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u save already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_finish_save_vf() - Complete a VF migration data save sequence.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
> +		pf_enter_vf_mismatch(gt, vfid);
> +		return -EIO;
> +	}
> +
> +	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +
> +	return 0;
> +}
> +
> +static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> +}
> +
> +static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
> +
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +}
> +
> +static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> +		return false;
> +
> +	pf_enter_vf_restored(gt, vfid);
> +
> +	return true;
> +}
> +
> +static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_queue_vf(gt, vfid);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
> +		return -EBUSY;
> +	}
> +
> +	if (!pf_enter_vf_restore_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u restore already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pf_wait_vf_restore_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESTORE_WIP);
> +	int err;
> +
> +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> +	if (err) {
> +		xe_gt_sriov_notice(gt, "VF%u RESTORE didn't finish in %u ms (%pe)\n",
> +				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
> +		return err;
> +	}
> +
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_finish_restore_vf() - Complete a VF migration data restore sequence.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int ret;
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		ret = pf_wait_vf_restore_done(gt, vfid);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
> +		pf_enter_vf_mismatch(gt, vfid);
> +		return -EIO;
> +	}
> +
> +	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +
> +	return 0;
> +}
> +
>  /**
>   * DOC: The VF STOP state machine
>   *
> @@ -817,6 +1057,8 @@ static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
>  
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
>  	pf_exit_vf_mismatch(gt, vfid);
>  	pf_exit_vf_wip(gt, vfid);
>  }
> @@ -1461,6 +1703,12 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
>  	if (pf_exit_vf_pause_save_guc(gt, vfid))
>  		return true;
>  
> +	if (pf_handle_vf_save(gt, vfid))
> +		return true;
> +
> +	if (pf_handle_vf_restore(gt, vfid))
> +		return true;
> +
>  	if (pf_exit_vf_resume_send_resume(gt, vfid))
>  		return true;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index 8a72ef3778d47..abc233f6302ed 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -14,8 +14,14 @@ struct xe_gt;
>  int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
>  
> +bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
> +
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index c80b7e77f1ad2..e113dc98b33ce 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -31,6 +31,12 @@
>   * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
>   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
>   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
> + * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> + * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
> + * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
> + * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
> + * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
> + * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
>   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
>   * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
>   * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
> @@ -63,6 +69,14 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_PAUSE_FAILED,
>  	XE_GT_SRIOV_STATE_PAUSED,
>  
> +	XE_GT_SRIOV_STATE_SAVE_WIP,
> +	XE_GT_SRIOV_STATE_SAVE_FAILED,
> +	XE_GT_SRIOV_STATE_SAVED,
> +
> +	XE_GT_SRIOV_STATE_RESTORE_WIP,
> +	XE_GT_SRIOV_STATE_RESTORE_FAILED,
> +	XE_GT_SRIOV_STATE_RESTORED,
> +
>  	XE_GT_SRIOV_STATE_RESUME_WIP,
>  	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
>  	XE_GT_SRIOV_STATE_RESUME_FAILED,

it is easier to understand those states after patch 04/26 with diagrams,
and while there are small and hard to avoid overlaps between 03/26 and 04/26
the patch itself LGTM, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> index 416d00a03fbb7..8d8a01faf5291 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -149,3 +149,99 @@ int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_sriov_pf_control_trigger_save_vf - Start a VF migration data SAVE sequence on all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int ret;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_control_finish_save_vf - Complete a VF migration data SAVE sequence on all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int ret;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_finish_save_vf(gt, vfid);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_pf_control_trigger_restore_vf - Start a VF migration data RESTORE sequence on all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int ret;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_trigger_restore_vf(gt, vfid);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_pf_control_wait_restore_vf - Complete a VF migration data RESTORE sequence in all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int ret;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_finish_restore_vf(gt, vfid);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> index 2d52d0ac1b28f..30318c1fba34e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> @@ -13,5 +13,9 @@ int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index a81aa05c55326..e0e6340c49106 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -136,11 +136,31 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
>   *      │   │   ├── reset
>   *      │   │   ├── resume
>   *      │   │   ├── stop
> + *      │   │   ├── save
> + *      │   │   ├── restore
>   *      │   │   :
>   *      │   ├── vf2
>   *      │   │   ├── ...
>   */
>  
> +static int from_file_read_to_vf_call(struct seq_file *s,
> +				     int (*call)(struct xe_device *, unsigned int))
> +{
> +	struct dentry *dent = file_dentry(s->file)->d_parent;
> +	struct xe_device *xe = extract_xe(dent);
> +	unsigned int vfid = extract_vfid(dent);
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = call(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
>  					  size_t count, loff_t *ppos,
>  					  int (*call)(struct xe_device *, unsigned int))
> @@ -179,10 +199,26 @@ static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
>  }										\
>  DEFINE_SHOW_STORE_ATTRIBUTE(OP)
>  
> +#define DEFINE_VF_CONTROL_ATTRIBUTE_RW(OP)					\
> +static int OP##_show(struct seq_file *s, void *unused)				\
> +{										\
> +	return from_file_read_to_vf_call(s,					\
> +					 xe_sriov_pf_control_finish_##OP);	\
> +}										\
> +static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
> +			  size_t count, loff_t *ppos)				\
> +{										\
> +	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
> +					  xe_sriov_pf_control_trigger_##OP);	\
> +}										\
> +DEFINE_SHOW_STORE_ATTRIBUTE(OP)
> +
>  DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
> +DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
> +DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
>  
>  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  {
> @@ -190,6 +226,8 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
>  	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
>  	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
> +	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
> +	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
>  }
>  
>  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)

