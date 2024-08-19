Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF519956BBD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 15:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531D710E266;
	Mon, 19 Aug 2024 13:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EktRSFNb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E952C10E265;
 Mon, 19 Aug 2024 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724073740; x=1755609740;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wwkmkog/2ir1FdXl2htWdG5p0H5LpB+CFXFxcEf5bvI=;
 b=EktRSFNbPKlcx83u6Ry/fWfm619AWmOPivsKG6SBh6TBZGtBc8O+jW7A
 r5075CqCc8tPzoYHt27EzX2Z3+Gg0mA4hlkWVG95cL8GxX9P+TyQhRjc3
 XaBGCJZeK+9wW2/4y/p1cE5TysXCeEKzy0Y1bWUOG7JPg1fdYFiJs11ll
 d1rUjMpnJEUxCxKS7UWptTTZchzeBRIj/WXDWpDrG6LsrWdW+yUGaBcuO
 oZDQW/WRpBNrmDuvgUFAVpoQ+xgjdp0WhD6vRBCe4tOGI1i896Oz5GLcj
 p/akrfdxLM5rjbP1D3ICSr3n3pdw7/6EcE/X2p7tDfbJgD3VL7J52RAHC g==;
X-CSE-ConnectionGUID: W8fM6MvxRl6kUoz+bkmBMA==
X-CSE-MsgGUID: l0AGpa1jS0CkVKx6KDQlnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21941495"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="21941495"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 06:22:19 -0700
X-CSE-ConnectionGUID: AIYSZ8nlSf20hVOvAEhaBQ==
X-CSE-MsgGUID: 1X6cmpVnQAq4+s28ac5nmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="60350173"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 06:22:19 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 06:22:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 06:22:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 06:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUiXu/qxHg1nT9+Yshyr4ThJRQG9NlfH6JMIBGxsiWQprXp9rKQUpyn01b5aMTFmPOcA8z2B1V5ZPsdvde5IvuJPfnhnNbl098eLcPf8j9TNadRz2nMKO7zMMblu/oZz/84FSAIaPA6ptiAB1wcYCiedzHpaF31dK8CS/v0Zi+iXMJP1Nt0Pp5RTTz38VtEAxFqms+POCSc6dBzAZ0qw4Kk3om8vrFLpOAlCG/OLabHYOsRaVx40/VdatIlVU7tpUbEkxSEsTnDUsOHaeS/3sz82BOJoXhvqk0QFyYJOse9PFkm377QH7IZ9nU0qZJ58WGm4rBZKoNcQ04vk2FsQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxkbdFkyupbgUquMLxUxn2+PwfzWELp+NG+X4jFjDzc=;
 b=NFdGJxDxspRRA4OKBFQSUiMzpf3fnEEIpToBHX4hyZqfRbQk8GY0x6J+YbTACPWT63gCnRyQs1iYi/esFhWIK5dc73vM9R+s6WH5s/28XeOu9+nsQyX56X8+n/WSdtukBkv/ZoRAG+R0eQj/5ZP9BI2kDurlSiy2mLa258AT+ZK08UTeuoVGyFSlvHI0OrxDE4NpP5iCdwWcJHnCxwWgMmOEd1EZlt7dB6OhjID8+DtASffC7xLj7RgPAzCjbpx9+JRukyi6ZYTdo2AGWlQPx5iXKTereQj2dxZAKmUGtEbyigvh9E1D98f8kCNzqK2KQhHbOyeaMjxU5cp+1LYRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 13:22:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 13:22:15 +0000
Date: Mon, 19 Aug 2024 08:22:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: <linux-kernel@vger.kernel.org>, <sparclinux@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: Re: Build regressions/improvements in v6.11-rc4
Message-ID: <r4lkavdietsete6kwxitnlmh3uvb3zhza3qulqedmvatfeckto@i4qfkfq5vf25>
References: <CAHk-=wgP=qzODR60Xxzem5LQi6sH+6EFCDMOApAgBy37SQ59hA@mail.gmail.com>
 <20240819070639.2558629-1-geert@linux-m68k.org>
 <e43d6c-90df-32d2-c7ac-2991e8c5672f@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <e43d6c-90df-32d2-c7ac-2991e8c5672f@linux-m68k.org>
X-ClientProxiedBy: MW4PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:303:b6::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3f94aa-08c1-44f9-8446-08dcc051f16f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QN2ObsdfYQA/pRKLAsfN9CcFSA6k5rusJ5OC30jDBaXddoid5cKuMk5gcorw?=
 =?us-ascii?Q?glb4OUe0SWMv54g5hiSSrz1eRYlRxf4/KR1VIFdR/EMRnugn0R9RB/nP4vJd?=
 =?us-ascii?Q?/6Sz3rn96rdyx/sGPCAmsubJ9ZQCX76p+YQPUA5UiN6HuEPi/KU32EvIA7WM?=
 =?us-ascii?Q?863z452gNOWnUu9dYSHBUuJR3jXQ90Lznf7l05Etw3K1P5pXD3++96uytoct?=
 =?us-ascii?Q?6OjeeOYqwfSjiZk4psCyyDNlkupAwM3MAQgRapFZVGKhl082sa3yrcECy/9+?=
 =?us-ascii?Q?krWQz5JvK9W5MQGq7JRwosgU6uZkVqPx1M8BQ+RYLgxGqOXhHB8KvsbAD2Ak?=
 =?us-ascii?Q?0sma2NL/6P1V9T4lRB2uqS109wzcTRlzuA56a7UMhDCZp+ypDSzAc8YLpCsT?=
 =?us-ascii?Q?tp6bkYl0BJTPB15nq0T+4J6VhCKyS018aEoDAEggi3Ae0kCLjJoz3jkwTrDU?=
 =?us-ascii?Q?nZubbeWueKkVtB57x1HMfHMHMP7raZXxffACTsgk4adT5qDa5rcjaV+VojOZ?=
 =?us-ascii?Q?e2OYUH76uLH2UN2SEBCl+lhZakI/Btxftbt6J64nFDOfOyUcv6cfhbDHEAPL?=
 =?us-ascii?Q?Z/svv0hhp/hQqpOb3YPcntnfM2cHlcwiMr5dQew72BP3RI67CrgQNxnVwexg?=
 =?us-ascii?Q?BVXKYC89H/Lg7Xwy9HA2zExPnOFWHK/wQLqYeSqV8DiU0vqSTJrYLj2Sm0R9?=
 =?us-ascii?Q?8AL5UIXEWlz1+M4AAzSKLyUzoCN2/s6S/OJ2ZhNG/POECBqiatJAFZF1mppq?=
 =?us-ascii?Q?N6ZwUApIDc2010IypLhgpJbAwdCpCJIvEt0htV4BO5t9kUsvY4T6Db5ywUsA?=
 =?us-ascii?Q?HGIJMR4sEO8e+2mPKJBmjhzlvZbrgwlmIr1LDwL0acKIVR57YTt8taUDGEsA?=
 =?us-ascii?Q?9BItNhSa1/eNcrBvls14kUxVSx6MFjq6ZYRCa7Eny9WiKtLIEA8ym8irMPqT?=
 =?us-ascii?Q?Kqo82mk9SDuactDZ7jLAKzQltenrTqO0NM19zkko21vDUj8MtBqgGNoB28e9?=
 =?us-ascii?Q?ZaH5nZvBcRMZDN3mRS1cDg5VZQ8y8et8y8ZDyK06VXsodsWL5+09drLVaAEF?=
 =?us-ascii?Q?oYLbLG+H6K+LSGW4qdddtiA+7j1ArzvnoGU+wdG/YgdN2SAEZSAql1b3L6yM?=
 =?us-ascii?Q?cT8hRLfyrfh3UI5dfWikcyvt7ElHB223oBZJ8KxqxepXZ6ZaIUtRs0xvQe43?=
 =?us-ascii?Q?gb2PVMSbt1Krmz2Za88+yhe/LptvQgbsvvc74l39kK3u0YP3PPdRxYvGD8fN?=
 =?us-ascii?Q?9DxFK5PQYJj89FaRvg4MmTV6jGUsEFxiDZ2ntCRsYBlRzHP/Ao7iVDpxf/9w?=
 =?us-ascii?Q?TwCY4uNp4FYLbM4UXQ1lJ9qHYuwnHI4EwdqY8hopTFN5Sg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lRJYofYCvQMs7yWYI0v8bKqmyU/MJv70bNH2kQUokyFIu4AFBrJTKVsuLzQ0?=
 =?us-ascii?Q?P2kxJhioq/V7B3WTZ56GYlv5EV3iaWfKN/eM2dwcBY+ciAdEebNCnIMaT9RL?=
 =?us-ascii?Q?IwafrHOJvuMNKeerQ/T6BVVVlWdkeAqgIICTRqsQaO3B55yoopmXCuE3ikKP?=
 =?us-ascii?Q?dzuhfrk4jILmsZ+I6ylkEzRtLlYtdPBXBoT3zswhrhlheuGH2Zw0lRY9FEJq?=
 =?us-ascii?Q?Vs9KBf6RnSje8GgQbtOPfglEPjTRR8aDXZ4Ky6fatyWujcnryjVPrJLp/yB3?=
 =?us-ascii?Q?gBa7n6uLZNSLcXDz1/IFUIblsSdUWcAr/8E7pAhhK+kc5KmsY4R3sTpu1R/T?=
 =?us-ascii?Q?Y6nFGXxrNoGjeaJGN4tEOVmKSXLjsEoLAZqXvSQrwJWRFkkG/PUqk8CpjCm5?=
 =?us-ascii?Q?9kM89Sj/xzWhPUP/9thKONEGjYOfEaUdyS1XiuqTXfhZXVHsx8vv0ZKOwF6f?=
 =?us-ascii?Q?mjChRqPFQignkaUu4ksNp0XVv6jUYRhILO0XU73rLUXk0mGMYJ7xghV0HMwq?=
 =?us-ascii?Q?LPUdWKp/NCvs34oYHNp+FqhYKOS5A3br+tULglOhUQfztt2noWrdtcEFzoWs?=
 =?us-ascii?Q?6z5kZWz9/xxagcmsy5MC7n0uwTCMP/CCGNy/kbD05YVNHqi940HckOqU268T?=
 =?us-ascii?Q?gB4Lvi/EW1Uwq3ihTZfNWzMrKxViCyui/5/Q6zrfEmUj+bIOzO3PPgrodybA?=
 =?us-ascii?Q?XWmOvvYGilD28sopjA/rRCzyWmNgTL7PsFRnt3qP1hSfag3u8k3BwezohhRV?=
 =?us-ascii?Q?NQwtRpqU4fZaMtEXXppil4qthkwafYB7dQDM33XRGBaEtav4ktsi1Q3gTWYY?=
 =?us-ascii?Q?OAKpGHMkW9YETnL3k6BjEyQEhOVViD2eKFxDMCPTf19X1TqKPzDeTvsJq35p?=
 =?us-ascii?Q?Ko631K6xCDhdwd5v1pnoOO156SK0pPqkhLkJ3MvjeGNIhoxn7MVj92s8t5pk?=
 =?us-ascii?Q?CqHvlKEjABu5BOSdJxaMF6WjKntmszafX/MufieXW7UTAB6pbuC+NTrV4++7?=
 =?us-ascii?Q?e1fficOxIOGtOhTiL4317igS76jYIwoZaNWNylyg86DGCCzwpO0hMdKIEOQE?=
 =?us-ascii?Q?D6b2wWquw/PTZNC7D5NlMFSJdupaOPisNTEe971K/Duh2mIc9LSYN5Rc7p/d?=
 =?us-ascii?Q?OR0O4GNtDk4lZt/OfQZT/dnYJ356s/AdFZPdg/Eb/L+H2iRMr5Ne8RW/E0mz?=
 =?us-ascii?Q?cq5F/P/vJcTZ+tNkyVkE7a6B6fAGIpGBFZmvTRvD/f9uyJFwcrgB9iAhxVD+?=
 =?us-ascii?Q?kR9YxFk/2sZpHBfttPDaRhtCkkLSo9HaZ4g8f4pWF4DQHj8spkuQUztSKQzw?=
 =?us-ascii?Q?rtFXJfV1ZjdkoJ9kKJOah2r1oSAfqiAE20/1vHUqgrEcy/lsR8Az8n7Ajspe?=
 =?us-ascii?Q?UKXDmCZUuneM4eNb44iqhwo9AgRnNa4UpPyiisQYL3YKJyxnsM0D9ux8q3w9?=
 =?us-ascii?Q?9sT0SefpIvRHIQzfGf6EdghqOABLEBVDQnEg44y6uY7r2tpL7aTtnYwMFawo?=
 =?us-ascii?Q?kvBp4vEqF8XTTLfr+50ui8IZpFS3xcI9uJgcXjm96kt4waadW9JGKjrrUexR?=
 =?us-ascii?Q?U5S8HfMHCBiJNk2ERJa492tfaFkVXZR1ZqXv0a3Yfvg25AqdDQJCr1M9+181?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3f94aa-08c1-44f9-8446-08dcc051f16f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 13:22:15.7142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FynaoqA3OnSisT7EgGsMSM+DnReipm0OaM0iRVQzNdfqrNLgho99pcSYMz85WYpmK+ClJuYdIusOxYmcpTX+c4E5cC6pJxVeHRIZyCOrT8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
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

On Mon, Aug 19, 2024 at 09:30:32AM GMT, Geert Uytterhoeven wrote:
>On Mon, 19 Aug 2024, Geert Uytterhoeven wrote:
>>JFYI, when comparing v6.11-rc4[1] to v6.11-rc3[3], the summaries are:
>> - build errors: +6/-4
>
>  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime' [-Werror=missing-prototypes]:  => 254:1
>  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime_stick' [-Werror=missing-prototypes]:  => 282:1
>  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday' [-Werror=missing-prototypes]:  => 307:1
>  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday_stick' [-Werror=missing-prototypes]:  => 343:1
>
>sparc64-gcc13/sparc64-allmodconfig
>(pre-existing, but now emitted twice in this config only?)
>
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_952' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_953' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38
>
>powerpc-gcc5/powerpc-all{mod,yes}config
>
>In function 'decode_oa_format.isra.26',
>    inlined from 'xe_oa_set_prop_oa_format' at drivers/gpu/drm/xe/xe_oa.c:1664:6:
>drivers/gpu/drm/xe/xe_oa.c:1573:18: note: in expansion of macro 'FIELD_GET'
>  u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
>                  ^
>Seen before, patch available.

+Rodrigo

This patch needs to propagate to drm-xe-fixes:
f2881dfdaaa9 ("drm/xe/oa/uapi: Make bit masks unsigned")

Lucas De Marchi

>
>Gr{oetje,eeting}s,
>
>						Geert
>
>--
>Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
>In personal conversations with technical people, I call myself a hacker. But
>when I'm talking to journalists I just say "programmer" or something like that.
>							    - Linus Torvalds
