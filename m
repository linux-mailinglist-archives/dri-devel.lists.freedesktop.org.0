Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF310A6591E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 17:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A153B10E430;
	Mon, 17 Mar 2025 16:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0EEFSHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B085910E430;
 Mon, 17 Mar 2025 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742230513; x=1773766513;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=akiK3fUy0HVWa5DsjK1YTV5l++4yD1EbR+kvPVs1T6I=;
 b=a0EEFSHhJXciY4xQUzj54omkZaoSfMSCwws4CBn/zAZQQzZD5xq1RIgY
 52a1kMXZwvNzkTBRSChKvBVHetonhbPvZ18y4j0/vKMyagE+4mctpIs0i
 07dKRkhn+IOd+Vq5dU132XOHkS9sHe1ktPuwB7/qTvyIYoZfT5zYNjVMR
 irNJYUTPcaSdIpsMli6jiFuEtm1Rn1ps88WQPNYnatQMJ4ZfyiNUNsfmY
 4MTk0NySmMeOsGMVvJchjmFEHLoiTKwhCcAVo30tGO5n6WP6pL31SOx1K
 qSl2mc4ZkcAG5ICRQtAP+0hbZw7DhpY3zwZcoN6rCK2rn+3Vx5pneuNtg w==;
X-CSE-ConnectionGUID: lay23A3pSeuMH6t40DvENA==
X-CSE-MsgGUID: 6UEXLm0LQIKi1Y7U8maOGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42511543"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="42511543"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:55:12 -0700
X-CSE-ConnectionGUID: PCh7LWB8QoKr0B79uG0bUQ==
X-CSE-MsgGUID: nc2vwbPyTzy1a7Lxou65JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="126180400"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:55:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 09:55:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 09:55:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 09:55:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaGL4aly/xTOyaTC63EeRPFLaxcIhjqL0M6wJsAJP5yCR+0Hlgqf/v0XbgK9xmQ14tjHT4Xm5eemQ0RvSYqD5RGTh9OYXwjrbAU/IGW1mjZ2WDWj/9REevkq8irpDH/wbzN7MYrkY+sh1UXl7R7FbIHCwcU0FdzIzALKMQanEIAk5+NlL74BV28PeFtrarz1xdCgT1LUJFJzXq3Ls++FeoMnHLsZd/EBkAVJN+6wT01jfIeykscK9Gs+W3C1TThJPqgXsyc/jK4qQ6G1x+eMR2NsXTXGdWwMlAQsRWJd4edYCUmRUeYy/oSraIDgVbvEsTOqdkrdFOw09Q7RgWKsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yv8wnAGkav8bHH/ZZ6k/7gIc7mI22RR6BnsxXfjlk1A=;
 b=fvd0xAGpfZttgPdoZSEfvyWf2CQnsbq7J45RF7ay3uoo89T/sZai46wpjEjwfrNcKhKalCFay4zYiOj96AnxW0KE0rOPmY+wow67IR32DWioc9HBZuV2VsKYt0U+9doX8elvVW9eC6y5YrjzaXzI4D195ScnFNx27AVqrWcNgh8BqFmk8a/iotyn3IfdHloeD9zX5bbPJ44bzY4b9zsvR/mTwz6/830pl7UfJMIBjcBDS9LbCzclj1gM8t+4v+L9d007f5SZC3noRO1OrnpU9dy6nd0LugyCRBbjdCtD9oGuQyjPilJuTIDZz3m/cZgkf4uYK5FC3NjtjLf9AD85tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 16:54:52 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 16:54:52 +0000
Date: Mon, 17 Mar 2025 17:54:44 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v5 1/3] drm/i915: Downgrade device register error if
 injected
Message-ID: <2pv4lxp5hrfkqmfvmxpl73lgujyl6gyatzhhmzw37h7l36cgdr@yyia542snbjw>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
 <20250314205202.809563-6-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250314205202.809563-6-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: ZR2P278CA0025.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::15) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8a43ee-7fbe-4fcb-9b4f-08dd65746fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFpLblBTWjJ0b09VNllRcEZVQ3BYTXp0allWNmU5YjNQNjJFMk94SU04NnpP?=
 =?utf-8?B?a2VBVU5jeGVid2FhT1lDbnhLUExmbXB3cDJsaFVBM2tWMlFHd0wyaUZIQkYv?=
 =?utf-8?B?VlNDQ1RrZEtFTHZka2dTZFlMcjdTWDdwRm9IRjlSZ0dub2RXUnNGTDZGZkVK?=
 =?utf-8?B?L09SekFkWXQzQVdIczdZYk4vN1lld0p1MXpTN2t6KzRKU2ZlMXlpTHRwSHNF?=
 =?utf-8?B?NHQ0NnovMVRSTzRvWGVCbGh1UVgzb3AwTFlYMDVDR2U1UW4zeVIydTJ1RENB?=
 =?utf-8?B?TGxYSXViNkc1U242czZkYkZOMk5pWkYzd1RzS3hYKzVLMG9pTFFKVHE0c3A0?=
 =?utf-8?B?Zm1iRzJVOGxJd0FiZE5TZXB2SGlJdy9LQmlSYllDTDMrTkRjZ2RKZmh6WFlH?=
 =?utf-8?B?Rk5XcUkxOHVTODFnWXlzQWRJN29wZi9KSFVrN1huYytlSlp6NTkwRmV2OTZC?=
 =?utf-8?B?RTJmWUtWU0hWTHRuMGFoUW9MM1FLUW90OHlad2Y1M3RCTEFFRjVMUkVtenI5?=
 =?utf-8?B?b0EyZzU0WXlLUWU0cHIrY3JTZjV3SVRvbnlDcVdrZnhhRnJHZEJTbVd2MjV3?=
 =?utf-8?B?YXlaVk5CT21RTGNZaTFZYUtCbm5nOEg3bjVFakJzRFkxNTJidUNNUlNicW9J?=
 =?utf-8?B?TkpYa1JLazBhZTUrSWkvUmd3WXQra3NMVFJVY0tzNmVIZnR2bG9LaXJDUDly?=
 =?utf-8?B?SjVuNkJMam1ESVFhdkdiNEdxMVdBQ0ptV2lMRlZPTXZHaWIwRzJNQ040UHZN?=
 =?utf-8?B?aWxhNVRhTjJpWEQ1a3JVQUNFajNjTVpjZDc4aGpsTWIvQVk5VGFXNzVJaENj?=
 =?utf-8?B?YlZ5bzJDT3g0ZHhKdHVHbE1BbGc0aDRkbFBWV3Iva0xRVTNuTzlkdEZMaTlo?=
 =?utf-8?B?VVdqSlM5bTEzUENIa2xjWkVXdS9lbUdZRkdqUDVvNFEwcW93blh3ZWZKSXlG?=
 =?utf-8?B?aW9vMGRvWURIL3JQTkh0Yk85NkNsMFNNRUgxMytGL3UwSnREUkZTOGdFRytl?=
 =?utf-8?B?TjQ2SmZ2aFBtVk95d3ZoY0JnM0tOWjVicWpJU2p0NnArbHFZVE9ZbHNHekNr?=
 =?utf-8?B?SnVsSG95LzRsUTVYZzh4S2xma2pDbm5PazFMSGtRaUNDaHIvWXNFVml0UHd1?=
 =?utf-8?B?V1g4R2lZWGJwUFZGM3BKUS9YV2dTUWRSM1lMSnNoL1E4S0ZqR28vb0Z4MmZ3?=
 =?utf-8?B?VDlUUmNyb1JpbmpqQkdLeHVWdkE3OGF0Zmw5Rms1bnRrWmhCcERrUWJjdTQr?=
 =?utf-8?B?dUt2UmNrRVgwQXhSUlprUUkxNVVFbjlKL2Mwd1MyTWxiVGc5V3dmdVlvZG14?=
 =?utf-8?B?NWIzU1U4RE5xQWpHalcvVHNkN0RVT0JGaEVUVzhIK24vcUxqdFBFT0syd0Fr?=
 =?utf-8?B?ZWhBTzRaV1psMG9TemFJOXBqaDNkMXhtajc4Uk9jMUJHQng5a0NETTZLV1Ur?=
 =?utf-8?B?M0RQNkY2QWdPdTI5d1ovN1RobjJrdG5Sb05ubWRsQmw0QjZ2akNqcmJZbkhp?=
 =?utf-8?B?QXE1OUxnVnpXaWpyOHZwelR2Q0tMWFJNcFYrdTMzSXpreVRobktDSklZTUM3?=
 =?utf-8?B?dno1RXg2TTNJSWdzamJ0cVVWNmtaK3U3UzI4K1JZenlUa252TDI0MjR6VXZm?=
 =?utf-8?B?UGR4NGM3R2diRlVWOVlrUkpuSG9nUDJhY1ZSVzhPOVlQby8wYnNXTmZYcmNy?=
 =?utf-8?B?RHdZZlY4SW4xSmJlamlQM2VQTzgrTngvTkhhYnI1NDI5dWpuL1AwNlJpTjVV?=
 =?utf-8?B?V3BxQTljMWlnaE03S2lOWDRvZXRRYk04aWlIOEZ5YS84NldhMGFNRUd2UVlJ?=
 =?utf-8?B?bzdaQXo5QlVzVWVYZEpoQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXh2a1NaTUkyc3prL085dGsvUzZ2Q2FEOTJ5aUhCdUJ2enI1ZFdIdksxQkNq?=
 =?utf-8?B?UmVhaTBVMjVveDB0eXIrcE9yWTZkdm1QVk5oWSs0VndGeUwwTEJ4N09IVzhw?=
 =?utf-8?B?OHhoU3lncUJlOWdZcmJPWmQvU2xsVWx5aDB4TGdUWndqc1RRdzRpT0kyVnlV?=
 =?utf-8?B?U3NCVVVJQlMwRkF4dHVldWZXaTMrTFlFTVBCRERIL08zOUt5NkRFNkVJdThH?=
 =?utf-8?B?a1RpQ295VnNPL3AveXhrSGVHR0FWd2lIL1hzcWl3TjVLaU91YmxlTEdJS2c1?=
 =?utf-8?B?OTJycWlTTGkvUVU2Z01JelhrSnVSQTBhZ2Yyb2w0Vm9CQmNBL2VZZEdOQXEv?=
 =?utf-8?B?MC9GbUV3THdUWWR0MzRzcytqN1RUNDIyM2lUSGJtc2t2Vnh6aDRETFhaMTVu?=
 =?utf-8?B?dTl1VW1LNGxwcXRLZUZqbkVkeitEanZSUGFRZzZqUmU3RkpFcjlTcndXZnRi?=
 =?utf-8?B?RnZaODlNWm5kSFlGL0FZLzcxMHJlVmVXMk5aR2krbWl3M2Jqc0dBUWRFUVVz?=
 =?utf-8?B?R0QxNFZsVkE5WTdKd1VJc3Z5alpWcERhWHR4dmFTSEVoK01CRUM5N1IvSk5o?=
 =?utf-8?B?bGFhcEJFSTdIUG1NUnBFOWZFcC9JdUFnM3AyT2Z4M0Z1cm1wY2ltMDlma2xl?=
 =?utf-8?B?bjgxdWtuM1JrQ0tDc0tKc0tPNG0yV3ZhaWJvaHhhQTFFUDNNc3REUzdJMGI3?=
 =?utf-8?B?VG82czdCVGlEYkhlRy8wUDJrbG9zRVV1MkdMRmJrQkJGdjY1b0dLLzJ5d3Bn?=
 =?utf-8?B?QWFSWVZrRUd0bUpKdGpWN1htQVB3aHhOUHRtTGtiT1dzRGFwbE9ndm5nTWt0?=
 =?utf-8?B?T1g5bWdkc01QdmhPNGdLb1hoU2NGWkNSdkIzbmtneVVHK2czMlpPM0JUV25o?=
 =?utf-8?B?QnNWcDdPZk1TYVdLdTN1WU1PWTN5M1EzNUNXNWtwU1VWaXVHd0pwVWNjS3ZV?=
 =?utf-8?B?dlJWd1c1d0gxd0d2Y1BXZlJzYkFRQTBUSGtiS1pUTzR1S3N1MXVjeWV3bkZH?=
 =?utf-8?B?TWE3OWs3cEVNRm1uS2JrYkxNejFaaURYN1RVdGl0RXhaQnh3MVZQTHlneGQ0?=
 =?utf-8?B?d0RwTDBmTlhoVk1XSkhGVDNoMmM0QlpTMFgyZ01Hc0ZES3B0ZVR2a3J1Y01t?=
 =?utf-8?B?SENVYlNiQXdPcnU1L3o2bUVnRmVNTjY1SndaZUFoa1VDUHRueWpOUEEzamhN?=
 =?utf-8?B?L0RoamtHV2t5MWk1d1pIZU9ZRHNCR2UzSjFqTUtWVlV1WWR2K1NTQjUyNnE4?=
 =?utf-8?B?NGxnM0JJQndDM0JaOXU2ODd1cDF1eFlTMHZIaTBUS09kTi9RcnFCQ1h3K1B2?=
 =?utf-8?B?L2srRm1iOWFhWUNoVXFhcnVJdWRBQ1dWOUxkbTcvSU5Tb08yMzBuNVYveGtV?=
 =?utf-8?B?VitsYTNDMkE4ejY1b2tuTDhDYjZvMGN3MEhweVo5bzg4empVQnVGVUlQT1Bj?=
 =?utf-8?B?bzExdTRGSWJTSnQ3SkhHM2hqbFk5YWhMeWd6Mm1BMlF0aCtLMmRqMFJVZWZ2?=
 =?utf-8?B?MnV1bFh3cEtoYTM2b1YwKzJxc2pOaWpTQXozQWtoVEkzQ004d0VCUlI2ZWJz?=
 =?utf-8?B?USs4YVRaVTFHVS90RUxaYTZoYzBKdnh3clZ4YlpqaHdBVHhESzh4NVNCMGJu?=
 =?utf-8?B?TWJjODVpWTlWL1VZM1VHTS9kVVFuMGROZGljNnZENjFod2szRTVGNjEvdFc5?=
 =?utf-8?B?T3czb1pPeDF5b1VET1JxWDRhYllrZnRrSmxiUS9vVjkyUUVoajBIeWdodkJh?=
 =?utf-8?B?YkQvdjJYVjRoUWV0ZzlSRmw3TXR0blh6V3pTWVlWY1Nqai9IWEsrSnQxRVVC?=
 =?utf-8?B?a0s2LzREelRrOU5HWEVHTkV2M1EwOXRrU0tDcmhSbEg4a1BHTktvNk9Mb0JR?=
 =?utf-8?B?VUp3YnpoTENrenlKOXlXRGVCaGdTN2Z0bTRvY1E5V2c4UTBtc0lOMU1iUnoz?=
 =?utf-8?B?Vk9tWkcwK2Y2dXVReDVKdUpMS3FVOG5JOHVBd3VDdC9QejNJN0RWMU1ETW0r?=
 =?utf-8?B?VUdtcWNpMmM0NkJ3dnhrdXREMEJLSTdyWGRaRE1IdjIxVDhFQzY4bitBMjBK?=
 =?utf-8?B?WGM2bXNRSTJYdjd2WjNvekE2L09JUWdqUEI3SDBZSGM1U3BrdE1malo1cGxm?=
 =?utf-8?B?bmh4b25xYWZoSS91Qzc2NmR2QTNtZmRPQitUK3lNb1JQWkVkWnhxTjFXdFRs?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8a43ee-7fbe-4fcb-9b4f-08dd65746fc8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 16:54:52.4126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiYBy26JXcMkah6VyrCLU/X8dWuGBUhf81Kmr6Yeh82zToqyRSkAIn5p3UloAjflHx1mwcbxn3AxAMLwfqdIH9wcmOEudwca858tyv28das=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
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

Hi Janusz,

thanks for the series.

On 2025-03-14 at 21:38:33 GMT, Janusz Krzysztofik wrote:
> Commit 8f460e2c78f2 ("drm/i915: Demidlayer driver loading") which
> introduced manual device registration also added a message that is
> submitted on device registration failure as an error.  If that failure is
> triggered by error injection test, that's an expected error, but CI still
> reports it as a bug.  Fix it.
> 
> Suggested-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof
