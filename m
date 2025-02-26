Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51160A454F2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 06:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAE510E1B8;
	Wed, 26 Feb 2025 05:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFSn7ypA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E9810E1B8;
 Wed, 26 Feb 2025 05:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740548618; x=1772084618;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g5Qgf61UHcDo3VqiL3/rl1A8Sg6/3JICM6wYPZQ+6Ew=;
 b=WFSn7ypALSDCe30q7IPnunxEpMZArD+2PmRSi2F1SAy0hni4tJ2fjLDj
 FTAK/Mi3hJOfchD6LrNsGkKOTeTf3QcJ0kaZRr8Hgo/nY6lBMtWjqPILz
 Il39F1bmPvUQppol4wvxpjYEeT8OO3npkvFzdo0rsku50tefRQQ1ByrBI
 BHuFGnU7nQEqfLFc3K1x2nTj8t553ae7QBC9FlCSQPzSCNlervKzDno0s
 eoakPUToQgHpavI/oXTTxTR4kfxGns7hCLdmeiKEM5Gc6c+owSUVT9BBD
 4ZTzwYx73VqB+cNbfhJifDdAPyxDjHuEnWdIxQOaLuFfmWXF/ZDXFVxEY A==;
X-CSE-ConnectionGUID: KTiTFI42QCS+AxN2bjkxkg==
X-CSE-MsgGUID: fxTD0mfqTB+LOqhdAJobAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41085210"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="41085210"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 21:43:38 -0800
X-CSE-ConnectionGUID: /GOxvFOFRr6pAw1tKZLlXA==
X-CSE-MsgGUID: fwmzYyNYQCyqGW9vwUXLdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="121596896"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 21:43:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 21:43:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 21:43:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 21:43:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p15yYEUZePK83qiIAwCliJL7cXYdTHSBq2RWEgtFudHtyQS69eogrK2zu8wc50SCUhwpBb5fOJk8DM/a2knW942SNm8Zidmz8DxvMEvEGu663Sm9GJyoBC5UMhFdgRZDPaJEadVOGWPgc+vnzXhS9u3jdUEfXOaJWul/h99E36rZfmqpcr+IEhPEvcBVr93X9tYhAHFcbDTLGu2xGrSAbvc7TZQyaCI0JU7N4kc7RQQNOOkwNty5zebGajKekKTuFjQQqOH3yw363TkoycEpjwVe/+J9W1+evDe1Hsw2rikxg8Utm5/+avPWDlh7ObmnaGovZWfDnQvuyL090bBkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhw4CN+2Zas53FNrqci7PG2zoyG/kBrvmI5NEP0ZdGw=;
 b=Q6bQOmHH7IxxOsuNUbyJQ1JFHu6wD9vQf9O7sz0BqQ4feK3YFi/6ceaK9ijOSuim7d+j3Q3l+Qb/r/3SH+AGUYpC9bm/KxAbI6VAlZLMTun3OeaYXX0gJKgI4Z8zuYO6iDHiGEbjybNARH4GPZCVBzzB4NKinrwek90ENmQbtClAZqnzPmSjDjn3iOEZwWJ7cBPvl0jbbV/Qkk/HSyYmPCEFeyKfTabktFQ++LBZrYwO1W7TzO6xStk8AqcLYm7IQ9jXG8M/OlrVQcCwkUFw4Dl0W5isdY75dx68W384I291Z31Ow7pPByxzs+z2iBl0nRyyJ18AW7PUHRUWQJsnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 05:42:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 05:42:54 +0000
Date: Tue, 25 Feb 2025 21:43:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <jeffbai@aosc.io>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "=?iso-8859-1?Q?Jos=E9?= Roberto de Souza" <jose.souza@intel.com>, Francois
 Dugast <francois.dugast@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Mateusz Naklicki
 <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 1/5] drm/xe/bo: fix alignment with non-4K kernel page sizes
Message-ID: <Z76qHHpA47b2rhWc@lstrano-desk.jf.intel.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-1-80f23b5ee40e@aosc.io>
 <wcfp3i6jbsmvpokvbvs5n2yxffhrgu6jyoan3e3m6tb7wbjaq6@tbsit7ignlef>
 <Z76WIgGvvhlbYl/j@lstrano-desk.jf.intel.com>
 <3byh43hetsh37gd544nhurkzhn6ynotlzittvcqjxxwgqg6ucf@b6sdl65ssyxg>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3byh43hetsh37gd544nhurkzhn6ynotlzittvcqjxxwgqg6ucf@b6sdl65ssyxg>
X-ClientProxiedBy: MW4PR04CA0152.namprd04.prod.outlook.com
 (2603:10b6:303:85::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: ed30be16-cda8-419a-c568-08dd56286a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TC81VGNZcGZFTEhyM005T211YkdBSktLRkFjMlBMNmtIdGR6Z2F5ZktVdG9j?=
 =?utf-8?B?Zi9SdDkvQUJmZ2c5RmQ2Y0NjVnljZ1lBdkxJRkJMSmtnYWl3bzRCZTg4RWd1?=
 =?utf-8?B?TTI1YVNxNXpmYThCai9sazYxbUVkR0ZPYnkwaDRvd01zWlhENlBTSHdPT1Bs?=
 =?utf-8?B?cHRGa3NOUGx1SWxhNkN3S0thdENhb2Zva1A0UHJsbGVXRGR0SEFLRVNDSU9o?=
 =?utf-8?B?V2NCbDB5cTdIcFRxUGlXam8wRW9EY3h6aUpwYTQ3SDZKaU1xSTlRTUUvZ1M0?=
 =?utf-8?B?REgrTEZmcjRzUE92SWdUVUp3T2FNUDZDdi9zamFNUGR5V3hQdVRqTFVickVE?=
 =?utf-8?B?eWdQdHdoUHoxcmxJTTVNdU8rUXUvb1VDWjh1Zk9aWTRJcEIvK0luNXR3RXVw?=
 =?utf-8?B?VGcwRmc1L2liT3VLTEI2WWpyWk9MVDA0dk03Mms4ZWNHUXVkNFNqT0lNTnNm?=
 =?utf-8?B?OU55UXlqVnQ3Y2pTV3pWOThXaURIRkZLV25wV1NBaUppMUVLY3pSV1JyZjlT?=
 =?utf-8?B?RVFNYzQ4aklEYjFCbXA0SW1GbS9CdzBERGsyNWJ4dmZ3bzlRK0czWThlYUJz?=
 =?utf-8?B?K09panFWbjg1VEtBVmUrZTVXZS81N1ZHN0FVZjVsamcxUW1RZEFwbFBuaGVu?=
 =?utf-8?B?eVZ3cVFET2ZudHp2YmZ3OHdBWEorajZDRGJNbjdOMEdZVDRvNmlwUWZwL2U4?=
 =?utf-8?B?SWRUK2JwQVZKR2F1YmR2SXNEaDYzNDFUei83WE4vQjdEQ2FwcnlvU290QTNL?=
 =?utf-8?B?MklNenh0MWdiOUU1dFllaG1pY2k2RmpWNktxYWo0ZFcxRDhUZ3RjNWVYdnhh?=
 =?utf-8?B?MlNVRmkrRzl5NHV0RmxlelRXS21NUWZ4a25YSFdmNmJTaWZvMks4ek5objcx?=
 =?utf-8?B?ZUQ4T0Z4OTIxNTlhQXJVUVBHOER3UVRLRlJaZ0gwcXpFOVBFdGpCUTJaZE5t?=
 =?utf-8?B?ZkJaL0YxUmQrbzhIa3h4UWJZNGdjajJ3UzYzR1RKQ2JpYWY1UWNVOEVJUDVC?=
 =?utf-8?B?UjVnVFJ2K3luUnd5NllqeHd6SDZZUWN1WUdYTDFiTkxCeEVZZGV5b0xub1I0?=
 =?utf-8?B?emxqWjdNRm5GMDF2NS9JNXNTUDlKMVFjQkxWRFUwNkluNi9CeE5CRXhrekhK?=
 =?utf-8?B?QVcyZjdYMklPUjJQZ1daZ25DelBBTWNPcitrSHBjeFU2ZzlPUFRhK2F4ZHpV?=
 =?utf-8?B?V050UFYzOUJ1bTJDd2xLcS92dmVFMkh3MytaUzl3bWZ6R3lNdXlkN0d5SWJo?=
 =?utf-8?B?RnFGZDZhdWRoV1ZzaHdsTWg3dk90QTdUUHBQQng5MDE3QlF1bEMvaStqei8z?=
 =?utf-8?B?K2NMQ1lCRVhnU3l1c0R0aEh4b05iWkgwTEI4NWVKc0VadDRSMXozTEpQcDMz?=
 =?utf-8?B?YXBNNTd1cmxkSXhvM25sUkp5U0Y1eW50RkdrVmFDYUVJRVVKeTBQcGZtZE5V?=
 =?utf-8?B?REs3UHNSbW1zVkZkSzBTa2QwUEhuLysyYVUwWlY3VnBod0hZdFVMM2Z0eFB3?=
 =?utf-8?B?a2ppamsxVXI3RkZMQ3lkaVNiMFZCSUQ5RlU0R2hvdE54aE55QzRCTmNMQ2dy?=
 =?utf-8?B?eVNRYkRuMVQ2aVFKWWlkTnRVZnkrZGVEQlRWVkcxc2dRU3Q4cDBFbWlHTVRj?=
 =?utf-8?B?SmhNaU1jSzBXeTZ3SlIzZjg5UGptT1pRSkNtN25YVjFDcnZGRTBJMjJxdFBJ?=
 =?utf-8?B?dDI2RkFhUU9nUzR6cU5aVytmN1JqZzNYMFcwZ09velFPcnJ5YjVaZUZ1TkpN?=
 =?utf-8?B?ck9ZM1Q4V0RkUlFzNGFwQXZxV2tXTmI2VUFFV2VtT3ZKMk5PbUgrditmZ0VT?=
 =?utf-8?B?MFRxbVRNYVJEN05tV3hzWkJwelJubmpsUGZMRVhlWGhMZFVka0ZIaHc5WlVJ?=
 =?utf-8?Q?6jxLu4fOrlwUc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmJCL2pZNy9MMEEzcU5Ob0daQ2FwZ2VpaExYVGhwQzFJYnNyYUIvUy9hWmhk?=
 =?utf-8?B?YWlQUnNmVnpIN0twb21FYXVQSndPMWl1VGJ5dkdkbXdWU09zSUpBNXBzUWFn?=
 =?utf-8?B?WWkyWmFSL1RLV2dYVWNVa2I3QlFTSEdNNVBaQk56cTg0eVA4TlB4TEp6a1NM?=
 =?utf-8?B?QjNXaitmL3k2Q0FWZkM2enhoOEplRUR1V2E0T05aV2lRY1k1YXpSTmFTNHZE?=
 =?utf-8?B?QjNwNXNKUUM5NHIvYitYcDNRckRScUxQdkhNSlRQb0RIMWZZekhFYUprOTVV?=
 =?utf-8?B?ZHVrZThONkFwcnFabW1CazlkSmZDK2RQaWJ4MDJiTGJRYnIwME5MOEZQZVNF?=
 =?utf-8?B?dmxKbEZ2ajFvcHVINHl1UkxDRXpzZHdIOEg4RjFmTEtPeGdDYUM3YW1FRVBz?=
 =?utf-8?B?eVFWR1pMaUJIUjlkeis0T1pPaW9NWFcxS080R0ZOV0pTaWtKaXlXOTFJeVEv?=
 =?utf-8?B?UFZWTlVyOXJWQTZhNDJpd21WVnhVY0gxNnQ0djlTKzFkMTVEbHNnTnR0M1Vj?=
 =?utf-8?B?NGMrQ29vbEFycHdKekQ2UnlhVkpGeVk3YzB6R0tUeU1XLytiUVVndGdrRlUv?=
 =?utf-8?B?MXpMemZuVVk4dlBFUzJJTjh0V3ExWVJuU3BaRlI3Z2UvYjZkdUpFM3JVbjAr?=
 =?utf-8?B?UEtVb1V0eVluemFPSkF6U3ZoTzdlakF1dEpOSnlpeFNKM2VZRnM5T0llc2dM?=
 =?utf-8?B?WTZqVDAxUEt1ZHRUdkhkRjJTZGRyRSt1WnBXQ1QzT1Q3YklKQy91MjdxS3ZW?=
 =?utf-8?B?V291UnZBZU84OG5yZGFmMnJEQXNuRlZkWE1NMzJ0UGpTbHJmSzN5OGx6WFUr?=
 =?utf-8?B?SGlGYnNNTkorbVU4SGFRWGYvdVFYZUpKNGpjQkI0d0ZxdXRtcFhRd1Nha0pw?=
 =?utf-8?B?VUFtUXRIQnd4SVBKV0lxRTZsWDVXMkpYQVNSelV6dzFwU3lNaEhUR2R4UEJn?=
 =?utf-8?B?Mzd4c3E5d1RLcm1JbE9jZCt5Z3BaNGpTUXZvTjdzOVhiVTY5bU5FRFFUdXV1?=
 =?utf-8?B?bTZMQUVlTVhvQnBpMGhTQ3JhQ3d6NXEwRW5nM1dHSUdGZFNkVldnZFdBVkRB?=
 =?utf-8?B?U2Y5UGhyTGlva2FnRnRTeHora3U5UTNQYnZQY2hBUllPd1JZK092Y2R3K1BB?=
 =?utf-8?B?UnIzVVdScGtCM3R5WFlrOEk2cDBxNThPc084dENVSlVHUjVCaDNEK1Vab092?=
 =?utf-8?B?dzVMVVRLbEZ4WlZUa3RJcWhoMXZ3RkVsM21FRHpySUt2d0pNVGxFdUxKOUcw?=
 =?utf-8?B?dEZGWWMwS1VVUzB5SzVyTDc2RkpzOE8xNzY1MUJySDlSYy85eHlnVUNDcEk1?=
 =?utf-8?B?K0FRQnRmUFhTakJDclRDL2dsVDFMZ0kzMW9LbUVtU3FyRG0xalE5Um5CckZs?=
 =?utf-8?B?MFFheitaa3lILzl5SklvbzJLaGN2Q1VRQTBobEgzME5leDU4SFNXNmdhTkRj?=
 =?utf-8?B?S0xlbUJoSzM3NVZYdXFpaFh4ZlI3c0hMeG5UUFpjb3k0WHQ3M3VydGFldVBQ?=
 =?utf-8?B?WG1xOElJWHVHWmE4alhSU2RLaSsyK2hMK25RbW1ZVlR0Y1BSTFI0ek5ES0VZ?=
 =?utf-8?B?aVUwTm1udE5memFBcUllZ09iZ01mT0lVVnlGMXF6S1NubHBHTjV4SzVCMFNU?=
 =?utf-8?B?c2JjYXcyVXhhL29CWVIvMnhTdVFkc1VUb2JVRzRuMXlVbW0rc2p1Ky80WlBW?=
 =?utf-8?B?VGdEckRaMmh2ODZROUcrbloyN2pCZFc4ZE85ZUVhRThtWDhmZkFmNDA2MzZN?=
 =?utf-8?B?cS8zZ3hzWFNSNzJxeWJvUzF6eUtpdm1FaE5YZFlOOTFBSUJzVWlJeGhucjkr?=
 =?utf-8?B?ODRJaDhOZTZEN2swRnZYK21RbWFzRGVUQkZSYXA0cm9OanlnRGgvc21BLzRa?=
 =?utf-8?B?WEdZaHNkM1FlejBoWHVHUmZ6aFE2Rnc2MlMrZ1ZCVEhqUEprcjB0Vlg4S1hp?=
 =?utf-8?B?c1FPWnJ0TGNHblBxQ0ZneFhSRWhJMU8wbFhDNXM4bURVOVJxTURCbkRmQzEw?=
 =?utf-8?B?TFdUcHlsVVpzQ2FyZFI1a2doS011NWdoaXAwY2tVMi9NKzNVN3ljb1JUQSsv?=
 =?utf-8?B?NGN4UGVvZldDTHRObVFzbmpqZi9wZHFXSGdMTDB1K25nUlFUVXNNZ0RHZXBR?=
 =?utf-8?B?OWlGOU1CWUJObGRRNFA5akJPNGtMcXZaRDQyTVJwZytOWVA3WHhoUktXSWxs?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed30be16-cda8-419a-c568-08dd56286a50
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 05:42:54.0042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUPW6t4Ns/T+o5WTlPj4odP5c+wCUbveC//k7RzulM4YmSA3R3p84O/KbI9D8IyQjzIABDNsmAqGHhLCYtGATw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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

On Tue, Feb 25, 2025 at 11:05:16PM -0600, Lucas De Marchi wrote:
> On Tue, Feb 25, 2025 at 08:18:42PM -0800, Matthew Brost wrote:
> > On Tue, Feb 25, 2025 at 09:13:09PM -0600, Lucas De Marchi wrote:
> > > On Wed, Feb 26, 2025 at 10:00:18AM +0800, Mingcong Bai via B4 Relay wrote:
> > > > From: Mingcong Bai <jeffbai@aosc.io>
> > > >
> > > > The bo/ttm interfaces with kernel memory mapping from dedicated GPU
> > > > memory. It is not correct to assume that SZ_4K would suffice for page
> > > > alignment as there are a few hardware platforms that commonly uses non-4K
> > > > pages - for instance, currently, Loongson 3A5000/6000 devices (of the
> > > > LoongArch architecture) commonly uses 16K kernel pages.
> > > >
> > > > Per my testing Intel Xe/Arc families of GPUs works on at least
> > > > Loongson 3A6000 platforms so long as "Above 4G Decoding" and "Resizable
> > > > BAR" were enabled in the EFI firmware settings. I tested this patch series
> > > > on my Loongson XA61200 (3A6000) motherboard with an Intel Arc A750 GPU.
> > > >
> > > > Without this fix, the kernel will hang at a kernel BUG():
> > > >
> > > > [    7.425445] ------------[ cut here ]------------
> > > > [    7.430032] kernel BUG at drivers/gpu/drm/drm_gem.c:181!
> > > > [    7.435330] Oops - BUG[#1]:
> > > > [    7.438099] CPU: 0 UID: 0 PID: 102 Comm: kworker/0:4 Tainted: G            E      6.13.3-aosc-main-00336-g60829239b300-dirty #3
> > > > [    7.449511] Tainted: [E]=UNSIGNED_MODULE
> > > > [    7.453402] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
> > > > [    7.467144] Workqueue: events work_for_cpu_fn
> > > > [    7.471472] pc 9000000001045fa4 ra ffff8000025331dc tp 90000001010c8000 sp 90000001010cb960
> > > > [    7.479770] a0 900000012a3e8000 a1 900000010028c000 a2 000000000005d000 a3 0000000000000000
> > > > [    7.488069] a4 0000000000000000 a5 0000000000000000 a6 0000000000000000 a7 0000000000000001
> > > > [    7.496367] t0 0000000000001000 t1 9000000001045000 t2 0000000000000000 t3 0000000000000000
> > > > [    7.504665] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
> > > > [    7.504667] t8 0000000000000000 u0 90000000029ea7d8 s9 900000012a3e9360 s0 900000010028c000
> > > > [    7.504668] s1 ffff800002744000 s2 0000000000000000 s3 0000000000000000 s4 0000000000000001
> > > > [    7.504669] s5 900000012a3e8000 s6 0000000000000001 s7 0000000000022022 s8 0000000000000000
> > > > [    7.537855]    ra: ffff8000025331dc ___xe_bo_create_locked+0x158/0x3b0 [xe]
> > > > [    7.544893]   ERA: 9000000001045fa4 drm_gem_private_object_init+0xcc/0xd0
> > > > [    7.551639]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
> > > > [    7.557785]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > > > [    7.562111]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
> > > > [    7.566870]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
> > > > [    7.571628] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
> > > > [    7.577163]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
> > > > [    7.583128] Modules linked in: xe(E+) drm_gpuvm(E) drm_exec(E) drm_buddy(E) gpu_sched(E) drm_suballoc_helper(E) drm_display_helper(E) loongson(E) r8169(E) cec(E) rc_core(E) realtek(E) i2c_algo_bit(E) tpm_tis_spi(E) led_class(E) hid_generic(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) la_ow_syscall(E) i2c_dev(E)
> > > > [    7.613049] Process kworker/0:4 (pid: 102, threadinfo=00000000bc26ebd1, task=0000000055480707)
> > > > [    7.621606] Stack : 0000000000000000 3030303a6963702b 000000000005d000 0000000000000000
> > > > [    7.629563]         0000000000000001 0000000000000000 0000000000000000 8e1bfae42b2f7877
> > > > [    7.637519]         000000000005d000 900000012a3e8000 900000012a3e9360 0000000000000000
> > > > [    7.645475]         ffffffffffffffff 0000000000000000 0000000000022022 0000000000000000
> > > > [    7.653431]         0000000000000001 ffff800002533660 0000000000022022 9000000000234470
> > > > [    7.661386]         90000001010cba28 0000000000001000 0000000000000000 000000000005c300
> > > > [    7.669342]         900000012a3e8000 0000000000000000 0000000000000001 900000012a3e8000
> > > > [    7.677298]         ffffffffffffffff 0000000000022022 900000012a3e9498 ffff800002533a14
> > > > [    7.685254]         0000000000022022 0000000000000000 900000000209c000 90000000010589e0
> > > > [    7.693209]         90000001010cbab8 ffff8000027c78c0 fffffffffffff000 900000012a3e8000
> > > > [    7.701165]         ...
> > > > [    7.703588] Call Trace:
> > > > [    7.703590] [<9000000001045fa4>] drm_gem_private_object_init+0xcc/0xd0
> > > > [    7.712496] [<ffff8000025331d8>] ___xe_bo_create_locked+0x154/0x3b0 [xe]
> > > > [    7.719268] [<ffff80000253365c>] __xe_bo_create_locked+0x228/0x304 [xe]
> > > > [    7.725951] [<ffff800002533a10>] xe_bo_create_pin_map_at_aligned+0x70/0x1b0 [xe]
> > > > [    7.733410] [<ffff800002533c7c>] xe_managed_bo_create_pin_map+0x34/0xcc [xe]
> > > > [    7.740522] [<ffff800002533d58>] xe_managed_bo_create_from_data+0x44/0xb0 [xe]
> > > > [    7.747807] [<ffff80000258d19c>] xe_uc_fw_init+0x3ec/0x904 [xe]
> > > > [    7.753814] [<ffff80000254a478>] xe_guc_init+0x30/0x3dc [xe]
> > > > [    7.759553] [<ffff80000258bc04>] xe_uc_init+0x20/0xf0 [xe]
> > > > [    7.765121] [<ffff800002542abc>] xe_gt_init_hwconfig+0x5c/0xd0 [xe]
> > > > [    7.771461] [<ffff800002537204>] xe_device_probe+0x240/0x588 [xe]
> > > > [    7.777627] [<ffff800002575448>] xe_pci_probe+0x6c0/0xa6c [xe]
> > > > [    7.783540] [<9000000000e9828c>] local_pci_probe+0x4c/0xb4
> > > > [    7.788989] [<90000000002aa578>] work_for_cpu_fn+0x20/0x40
> > > > [    7.794436] [<90000000002aeb50>] process_one_work+0x1a4/0x458
> > > > [    7.800143] [<90000000002af5a0>] worker_thread+0x304/0x3fc
> > > > [    7.805591] [<90000000002bacac>] kthread+0x114/0x138
> > > > [    7.810520] [<9000000000241f64>] ret_from_kernel_thread+0x8/0xa4
> > > > [    7.816489]
> > > > [    7.817961] Code: 4c000020  29c3e2f9  53ff93ff <002a0001> 0015002c  03400000  02ff8063  29c04077  001500f7
> > > > [    7.827651]
> > > > [    7.829140] ---[ end trace 0000000000000000 ]---
> > > >
> > > > Revise all instances of `SZ_4K' with `PAGE_SIZE' and revise the call to
> > > > `drm_gem_private_object_init()' in `*___xe_bo_create_locked()' (last call
> > > > before BUG()) to use `size_t aligned_size' calculated from `PAGE_SIZE' to
> > > > fix the above error.
> > > >
> > > > Cc: <stable@vger.kernel.org>
> > > > Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > Tested-by: Mingcong Bai <jeffbai@aosc.io>
> > > > Tested-by: Haien Liang <27873200@qq.com>
> > > > Tested-by: Shirong Liu <lsr1024@qq.com>
> > > > Tested-by: Haofeng Wu <s2600cw2@126.com>
> > > > Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
> > > > Co-developed-by: Shang Yatsen <429839446@qq.com>
> > > > Signed-off-by: Shang Yatsen <429839446@qq.com>
> > > > Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
> > > > 1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 3f5391d416d469c636d951dd6f0a2b3b5ae95dab..dd03c581441f352eff51d0eafe1298fca7d9653d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1441,9 +1441,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > 		flags |= XE_BO_FLAG_INTERNAL_64K;
> > > > 		alignment = align >> PAGE_SHIFT;
> > > > 	} else {
> > 
> > } else if (type == ttm_bo_type_device) {
> > 	new code /w PAGE_SIZE
> > } else {
> > 	old code /w SZ_4K (or maybe XE_PAGE_SIZE now)?
> > }
> > 
> > See below for further explaination.
> > 
> > > > -		aligned_size = ALIGN(size, SZ_4K);
> > > > +		aligned_size = ALIGN(size, PAGE_SIZE);
> > > 
> > > in the very beginning of the driver we were set to use XE_PAGE_SIZE
> > > for things like this. It seems thing went side ways though.
> > > 
> > > Thanks for fixing these. XE_PAGE_SIZE is always 4k, but I think we should
> > > uxe XE_PAGE_SIZE for clarity.  For others in Cc...  any thoughts?
> > > 
> > 
> > It looks like you have a typo here, Lucas. Could you please clarify?
> > 
> > However, XE_PAGE_SIZE should always be 4k, as it refers to the GPU page
> > size, which is fixed.
> 
> yes, that's what I meant: I think we should use XE_PAGE_SIZE (here and
> in other patches in this series) instead of SZ_4K. Even if both are
> the same, it makes things clearer.
> 

I think, to some extent, it has to be considered in context—for example,
Patch #2 in this series, where we are enforcing GuC memory requirements
to 4K, makes SZ_4K appropriate. In contrast, in Patch #4, where we are
operating in GPU page sizes, XE_PAGE_SIZE makes more sense.

Regardless, this series clearly shows that we have been carelessly
mixing SZ_4K, XE_PAGE_SIZE, and PAGE_SIZE throughout the code—probably
mostly my fault from the early Xe coding. I agree that we should try to
clean this up.

Matt 

> Lucas De Marchi
