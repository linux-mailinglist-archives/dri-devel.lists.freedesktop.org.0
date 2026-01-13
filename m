Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BABFD16A4D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 05:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F42010E10A;
	Tue, 13 Jan 2026 04:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvjyVbiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0BF10E10A;
 Tue, 13 Jan 2026 04:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768280269; x=1799816269;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5LaY5q0L+9bSlAhn4cJsL1jgd8JjV7SgXj7zE0QlK5U=;
 b=KvjyVbiAXzknAS6dBHorwikp9Wu9Vti/3afrKJKxSQukgfuOaEDEDFSb
 Jzpz1jtLNNqxG2t0DrcI395H3D192sU2MogRmCEAUswRE2pVw3QN19324
 f8+JtxHntgNx3idPDJLMgx+c9igi5m+GmSCdGQvajVLE7FjYObieaY9Xb
 KRZN4g+v82XcQTCUQJv7nyCv8qYc+ymg+FQvXV63TOzQgMXiD29K8OBG+
 bbabWFUrAZ9gVl4I0fDTmqUxnMON864Pzge9kZ8dHfeyvQTbM+blQnaho
 vg2z8mLcPo5ESjVe2YmgMoxbMaj3X1c84GSlBIF+zIxSPKrdUHISeGykp A==;
X-CSE-ConnectionGUID: +JON6HFjTpqwvaPgLDgMOw==
X-CSE-MsgGUID: dpBa2Fd2SB+PevlrTqJ7zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69292457"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69292457"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 20:57:49 -0800
X-CSE-ConnectionGUID: 4NLDs3/4Q7yutoXQuYE2OA==
X-CSE-MsgGUID: Kjlpmj1TTyCVxXmG1u295Q==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 20:57:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 20:57:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 20:57:47 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 20:57:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnK1wLaK9+2p5QavheMfK9k1+Pkp8E6dVD5JEOlVkb3dCSskgltsCLXzIldYOa7Jd3cmwuOKr0vGENfEthYKFICnCLn0vfhMeTQKiqbrC+iZfd46oH5Dq5YvnC4lh9v/Ui8pFh3K6UAqZnEVeoGsXSzZozIYgdnLMRVDiVbob/KwAcK91dFqnz+gPqymXmBac+oxz+nPfibL7CNWsKm4TIIzwJrCK3VoL1AqRkqZpzrqkRbSXwQ1kL/OUISMYH/tEcnVY9AMNV/xuuUVIxdgWgcH4hL6pxDnH620VtWxDdkKOyDF3SmANxRmpErenq4ul+TeFGXWaDtcGMgLym19qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXiiTYWhTx2oLpDP53XzCzb2hh8Z0NBHz/uMCghONqs=;
 b=y8HHVlI1MQ0HR1dPFOhbBxamkOyn7vd3A0ctT6L8hNfNJURMnOa9zkScmixB7AwKIkHK7MbF6lQdUFJ3VL5h6ZtiB5FTrdXJYBx06QCzRiiHczx5ZqWWmTEvck9yaTneSl43DLgOUuP3egtHUAgFqUfJT8nSycOduhkeBOr1NMC7YLbU/GOa+FRSV5EWlCpgKW+buNdOlCLD+g8/XxrAshDXkcDtaktGQPkkw8LIw1tLgqjD0V3yNXt4v8lgz+VHYWy+8VsPHsia3citUtt81IMy1LSKohPDbjLiH7kjsG7MNbj00fPCHVJl9+nnCTAtobNq3TJlsaVjctjgDfxoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7942.namprd11.prod.outlook.com (2603:10b6:208:3fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 04:57:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 04:57:45 +0000
Message-ID: <2c52bd70-c8bf-4f26-99f3-009ef18d8a15@intel.com>
Date: Tue, 13 Jan 2026 10:27:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tools/drm_ras: tool to communicate with DRM
 Netlink Subsystem
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Gupta Anshuman <anshuman.gupta@intel.com>, Vivi Rodrigo
 <rodrigo.vivi@intel.com>, Iddamsetty Aravind <aravind.iddamsetty@intel.com>
References: <20251219125653.1325766-1-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251219125653.1325766-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: 0891b19e-00ea-4348-b870-08de52604a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGRXMU1YbUNWYklGanJteWI1TVlCWnZZLzd4b1V5a0NYZ213dGZ4UHRjMUVO?=
 =?utf-8?B?KzRoSzl2Q3dkN1Fab0tFUGJYRHJIZUpSMjlPK25rZ0pUUVVRblRFcTRPS3E4?=
 =?utf-8?B?MloxNnRBZlpuaVNacE9WK1BCb1dNaEN2UmZYZm1OdXNZc3FqeGJ3Q3RCWDgv?=
 =?utf-8?B?UWZUSEtkRzFoWW9TYVlLZ2hmRktnTmk5NVhBSXdvaUxPTkhXaldVcjQrWity?=
 =?utf-8?B?ekppWGNNVjd1b25wdmpDb1dRMHZoTU5CMi9sK0I5YUphZWN6ajgzUDVTRkNs?=
 =?utf-8?B?anVaYjFtQTY0RWVBbFZVYXhmalgydThtRmh2TG1tRXdmcTZnN0N6S1BvVGVz?=
 =?utf-8?B?bFNnMVVxYVEvclhBb01nbkJjREY2L3Y5Tnl1YjF5RHViQjlNYTUzOE9INFNw?=
 =?utf-8?B?ckU1NDljOWMwbWVpSzlPQ2ZVd0FSZGRka0JEKzZZQXYxUW41ZmZpQUpGUG9G?=
 =?utf-8?B?Y0VWNFBTZWRpWHpJMzl2NzF1NDZub0xYc0JJR3V5YSt5eXlvdzU3OFpBcFVl?=
 =?utf-8?B?Qlo2TTRGV3pnM1BrZEFvWHdPeHFkWjJnemZFenBkQ3k4OVYwY1k1Y2NCYzFK?=
 =?utf-8?B?MndtRkprOWRxbzVSKzBPVTFVNm5nSGlKVlVMekR0WTIwL3Y2TW82cjVrZE5x?=
 =?utf-8?B?VUV4WnFmSTFOclRRZG1DdDNUUndpb24xN1g3RjRjdmdKZkhERktjanZZNVd0?=
 =?utf-8?B?NE5GSmFtTjhEWStyOEZNVGRpZDNRdTlFTCtFajlEUktYZC9LY2J1c3ZMOFN2?=
 =?utf-8?B?cWFqZHJmN3BnSnFYWktvRU1mL3JsY2V2d3dTZUVTNkNvTDZlZXlXbFlNUzVJ?=
 =?utf-8?B?c3JRcnBHMWtlN3pGYmJONEJNdThyeVdXK0cvblQyVHFJZmxxbjNUUkJncXdP?=
 =?utf-8?B?RzJ4a2lzTEdWcWhwbU4vSDZLQktmblNxaVFjaDVNOXhIQllZMUp2K1VDcDI4?=
 =?utf-8?B?OU5tRXY2eURuR0JrNzN6UjRadXhLdUt1WFBrREgyei84M3FFWmJwY0VCUktW?=
 =?utf-8?B?UDhqT0lmQ01kbDlHVC8rRmY1R09sYXFJS0ZId0VDU1ZBY3NjdmoyQUpPaUlE?=
 =?utf-8?B?eWZxSlg2bWd5Snh2bUxZQVZXZEJJazIycXUzSXVTdXRGSG1rS3YvVjBEZXBu?=
 =?utf-8?B?cDRiUklqdGJyLy9rOUc2QWFQd3U2Y050ZjBVMmJsZFhDUkRDZWFGVytTUk53?=
 =?utf-8?B?Ly9pRE50Ky9OQVZzY0NGK1h1RlVUQTBVKzArbXp1RjdYb1lwajQ5MzV5OXh5?=
 =?utf-8?B?MXZEbGZsbEZDbFFmTWd5WFJxQUs5ckpkMmhQSkRZTHcrZ0NyejQ1NGxFTWRL?=
 =?utf-8?B?dXpaUXJOY2gzWmRBR2pFUjZtQWVGYUs3TmFJRkN1QUJ4K0xkcGtPVWJreU1o?=
 =?utf-8?B?UU5qU0VaVTRXTHJnanF1SkxxQkpaSHZoSFNLOEEvL1NWR2hib1FSem11Ym9n?=
 =?utf-8?B?Ukh0YllTendDVzhPWENMQ0JtY3pKMGtzdlg1Mktiem5xUk5ROEZLMDlzdEtH?=
 =?utf-8?B?YWlDbGp2bjR5U01MejdRV2d1OXhybTVidTdZZnV5NU5QdEJWZHVFYlFRQXRy?=
 =?utf-8?B?anY1OFlOa0VhSU1PaUo0OXhKRCs2ZWdVb0hua1hTNERONEtSLzRiUnJvN1dT?=
 =?utf-8?B?R1hpVjN3SldxaHQrTUg5NWtDQ0Q5OFVCVk1wV1pMYzU4d3lRL202ZytDbGl1?=
 =?utf-8?B?U2xGV3ZZbjFHZnl1Ty84ZkgvYnNjSEhBSHZ0L3l2dHkwN25KY0NqeFRCclFh?=
 =?utf-8?B?anpLMUJRcDV6U0Y5SHVoZjBTaElmWlBkbEV0bVk0b0RvSWkrMjZZbnlNOTV4?=
 =?utf-8?B?MjRXN3dIUHZjZTZ1ancva0JEVWZMano5UUladUQwbW9Obk05NTV1QmFYYUtQ?=
 =?utf-8?B?K0lYSTZJNzZkN1dtandOVE5YVjZqZ1IyVWN4RDJDUThwZXZLcmg1M3V5dVYw?=
 =?utf-8?Q?Qovp6k1cm6pDnJWRKNgGNyPj/2mD79Bf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0EyRlU5Y01MZ1FUKzRoV1A1dDB0SEdOZVBTYjU1VzY4M283OGJkZHkzVC9V?=
 =?utf-8?B?RGhZMVFLMlgvSitzRUhmUC9mcXZWMnh0R2pQL0RHSGNOaUJPaDBEYlBlQzQz?=
 =?utf-8?B?eEozWlpuakVnMUM1U2tBS094RFljUC9SOFpkVFQvL0lIUWE4WTFBMXNKS2ta?=
 =?utf-8?B?aHFsOWdJL3JJSEZUREFiWEZiajZLdUc4empERVZzYWs2OXZzSnRGZTA2aE9R?=
 =?utf-8?B?aTNxeXNPNXhEVEN4bXdzbmx5M1FtRmxKUXpXUkdGL2JQMG1ZZ0JscytwNGgx?=
 =?utf-8?B?VXFzYVFrMVRobkY2cU5OUzNkdFgwMUNzYXpZOG1OWVBQdXJmK1RyMDJJVGNF?=
 =?utf-8?B?eWQxdUFlTUNjSkNYTnhyKy9CczNLT1pDRSs1aExrMmhTUHczOUVoM0dtRlor?=
 =?utf-8?B?Nk9iTmFqcWhzVkdBU3BvY01ZWml2ajUweEkvQmg4c2V2MnNoNzhpNGpxL3RI?=
 =?utf-8?B?cUozY2lxL0Q3Z3ZYWGRieEw1TUVZK2xFQnpSclFhWlN0QWtTUlVNeFUvZVBS?=
 =?utf-8?B?d3FQc2Rzc1JJdWJjRWV6a1NiYUc1c1dKTDRWWkRvaG5VZE13TWE4UVNLNklv?=
 =?utf-8?B?Qy9vMUVYcGYrZ2l1UVJIRzdBUnErZjNVQ014OHlHcDVtWk5wN1FOWHVnd285?=
 =?utf-8?B?dmQydHBpUElCSHNhTk1HWTF2ZzZ5N1ZpTkdUOHBXeWhoT0NYS1ZIZmF4dXpn?=
 =?utf-8?B?VnZQY3BvTFM2UWNHeXUxZC9GT0xBWnpEeUdQQzBPdHZyVDNCOGFHRzBwNUpJ?=
 =?utf-8?B?L1hISFYzeUtIV0NWYWZ0ZnNaNmVQbDZSNGhoRTNqRVdDS1grUXdiOWdQejZM?=
 =?utf-8?B?eVhIQkplZ3plcmpNL0wra08rSEhUWmxnRmFXcHZCNjlncFRQbE5TTmxwTEE3?=
 =?utf-8?B?YVhkQ1dDN055THhjS3lkem5zZmp4dkJHSFJjT1FZalV5eTZaYVNJTkxyaGht?=
 =?utf-8?B?U1JlMUhZNzNKQStMN2c4dTdrQjZVbU9vWGhGKzFkalRPWjJZSWZWSkFqdmov?=
 =?utf-8?B?VjhPektWUlJMTFRvRUZiM0lZZHVYdjJzSjZhQ3YrNTBUMEJZZHRRcWdlRGtj?=
 =?utf-8?B?WWg0Vlh0QUFDSzlVaFo3SE1wTkdSdzVQQzRrWmhGYnBBNkpkZlMwemNOWXl5?=
 =?utf-8?B?eTM5THFleWh1QmliZnZST20zYTNGbUtpaEtYMk1xeEd6MXJ3SStXNmx6N08y?=
 =?utf-8?B?VjVxLzNKWEFOektiTkhJK3RCZGUyalJzc1djaFQxVE5MVTZJVFdFdjVtbHBk?=
 =?utf-8?B?azRRdG8wWHA2dGtlUldOZ3N1RnY3cTJqRDh0L3o1OEp4MDYvRWVwclBTVGQy?=
 =?utf-8?B?V1RQYWU4M1JpVkhHRTJqek1aZXhoMG9LVUw2T2F2aVlGMU9vT1pBRG4yUmV0?=
 =?utf-8?B?bm9KYjhWd3BNTzcreTBjRXZzbmxrZm5WQnVxVlZqYi9ya2J3Vmtjd2Jsa1pR?=
 =?utf-8?B?VzlFeUswS0FlRzhhb054aFhsS2Z3UzBucFhMU3h2eXdoSFFvNHczZFNKdURG?=
 =?utf-8?B?Y2cwVzNibnpoNlAzZlAzSnZzVk9vNDl4dDVoRG5xMXpTS1Vrckp0M3pNc2V1?=
 =?utf-8?B?eWdBY0lyOEY5WmJQUThESVdXb0NxUmNjZGphZ2tjVkhJc051RUl1MUdZSEFl?=
 =?utf-8?B?M1lrSDVoaEg0TmFVTnR0WWtMYmN0VjM1L1RGK1FhTTNVK2pxR1FNWjVaKzlG?=
 =?utf-8?B?c3RKNGJYNlJxUXpSaTZUbll1cEZkczhxSTF4dW5GMjB2eUV0OW1WV25qZzlK?=
 =?utf-8?B?NERIbFhTeldKd3E0Mkxvb25zZ2NKYlFRenRucEdWZDRvdXRrL0tKTC9PZ3ZC?=
 =?utf-8?B?WXVkcmVIakFMVmxidVpUeFpTN3hKZmorZ2ZxaUlRM1czSDVtZld3dzFMdEs1?=
 =?utf-8?B?YTU2dkVpbWNHUCtaZWFPVUJUQk5kVVp5aUhZQUtXbEJnd2N5UGowY0k3cHU2?=
 =?utf-8?B?UXJ2TlZDWWtvTzRaWmdSMjlLWkkrNTRDMndRcm9DdE9qbnFLSVV4S1V2U0pQ?=
 =?utf-8?B?WWlPRnBjL2FmOW9zN3o5WUErbExmOUJRTDY1TnZZVEpqMitrTVR0VkgwV0hO?=
 =?utf-8?B?aTdwZ2NMWWVMcU5nNFV3SVdYVExMblNKYnlueTBPZm5BODJQQWk3TitlR21W?=
 =?utf-8?B?aFhaMDBtRmxxdFdiWlRoN0R0aGVtV04rTnp2ajVGV0lYYkZtbXBPTXgwY1Ux?=
 =?utf-8?B?czhvVHpKenhNQ2lHcXM0RytHZ1dRUXFvZVJsdmFKSndSQmw5MVpNb083bHVD?=
 =?utf-8?B?Qm5wUVZ6ZU02ZHQ3bFZDWnJJSHQzcnVNTG1jWWdsNmx1UXJ0bko4NTVvK2Jp?=
 =?utf-8?B?OGZuQUorcWZCOTFGMmVYOGhLV3FycUZ2akVNUGdzd0tQQkpxb1ljZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0891b19e-00ea-4348-b870-08de52604a27
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 04:57:45.1559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfCJ0k+eCd8hJUz4TcxeJNqIR9/T4tE5WzlcM+qT94GKkZNmZKWN/mEKCmDpAdqekdf3/7SDg6Xc49GkTdorkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7942
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

Hi Ravi

I ran the tool and have some suggestions.

On 12/19/2025 6:26 PM, Ravi Kishore Koppuravuri wrote:
> User space tool for querying GPU health monitoring RAS events via
> Generic Netlink Socket interface from Kernel's DRM Netlink Subsystem.
> Available Commands are
> 	- List Nodes
> 	- Get Error Counters
> 	- Query Error Counter
> 
> Below are the example usage of the tool
> 
> Examples:
> 
> $./build/tools/drm_ras list_nodes

The current patch requires root/CAP_NET_ADMIN priveleges. So this 
shouldn't work with non root.

Please check and update the help section

> node-id   device-name    	node-name       	node-type
> 0         0000:03:00.0   	correctable-errors	1
> 1         0000:03:00.0   	nonfatal-errors		1
> 2         0000:03:00.0   	fatal-errors		1
> 

When you display errors per node. Can you add a extra line/column with 
the node-name


> $./build/tools/drm_ras get_error_counters --node-id=1
> error-id  error-name            error-value
> 1         Core Compute Error    0
> 2         SOC Internal Error    0
> 
> $./build/tools/drm_ras query_error_counter --node-id=1 --error-id=1
> counter value 0

Same here.. add the error-name


> 
> $./build/tools/drm_ras query_error_counter --node-id=1
> --error-name="Core Compute Error"
> Resolving error_name "Core Compute Error" to get error_id
> Retrieved error_id 1 from error_name Core Compute Error
> counter value 0


1) Also i see that if there is any error it doesn't report the error.
Can you also add that

The python script has something like this so something similar with 
error type


Netlink error: Operation not permitted
nl_len = 36 (20) nl_flags = 0x100 nl_type = 2
         error: -1



2) using undefined options gives a segmentation fault.
Please fix this to display a user-friendly message


sudo ./build/tools/drm_ras --h
Segmentation fault (core dumped)

Thanks
Riana


> 
> Cc: Tauro Riana <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
> Co-developed-by: Iddamsetty Aravind <aravind.iddamsetty@intel.com>
> Signed-off-by: Iddamsetty Aravind <aravind.iddamsetty@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> 
> ---
> V3 -> V4:
> 	- Introduced new command to query error counter using error-name
> V2 -> V3:
> 	- Created handle_err() function to remove redundant code
> 	- Handled more error scenarios while passing command line arguments
> 	- Resolved formatting issues (Rodrigo)
> 
> V1 -> V2:
> 	- Removed device_id from the input parameters
> 	- Updated help() function
> 	- Incorporated error handling logic
> ---
> ---
>   include/drm-uapi/drm_ras.h |  79 ++++++
>   meson.build                |   5 +-
>   tools/drm_ras.c            | 556 +++++++++++++++++++++++++++++++++++++
>   tools/meson.build          |   5 +
>   4 files changed, 644 insertions(+), 1 deletion(-)
>   create mode 100644 include/drm-uapi/drm_ras.h
>   create mode 100644 tools/drm_ras.c
> 
> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> new file mode 100644
> index 000000000..af893aa36
> --- /dev/null
> +++ b/include/drm-uapi/drm_ras.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN uapi header */
> +
> +#ifndef _LINUX_DRM_RAS_H
> +#define _LINUX_DRM_RAS_H
> +
> +#define DRM_RAS_GENL_NAME "drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> +};
> +
> +enum {
> +	/* Unique identifier for the node*/
> +	DRM_RAS_NODE_ATTR_NODE_ID = 1,
> +
> +	/* Device name chosen by the driver at the time of registration */
> +	DRM_RAS_NODE_ATTR_DEVICE_NAME,
> +
> +	/* Node name chosen by the driver at registration to identify RAS node inside the device */
> +	DRM_RAS_NODE_ATTR_NODE_NAME,
> +
> +	/* Type of the node, identifying its function */
> +	DRM_RAS_NODE_ATTR_NODE_TYPE,
> +
> +	__DRM_RAS_NODE_ATTR_MAX,
> +	DRM_RAS_NODE_ATTR_MAX = (__DRM_RAS_NODE_ATTR_MAX - 1)
> +};
> +
> +enum {
> +	/* Node ID targeted by this error counter operation */
> +	DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID = 1,
> +
> +	/* Unique identifier for a specific error counter within an node */
> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID,
> +
> +	/* Name of the requested error counter */
> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME,
> +
> +	/* Current value of the requested error counter */
> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE,
> +
> +	__DRM_RAS_ERROR_COUNTER_ATTR_MAX,
> +	DRM_RAS_ERROR_COUNTER_ATTR_MAX = (__DRM_RAS_ERROR_COUNTER_ATTR_MAX - 1)
> +};
> +
> +enum drm_genl_error_cmds {
> +	/**
> +	 * @DRM_RAS_CMD_LIST_NODES: Command to Retrieve the full list of currently registered
> +	 * DRM RAS nodes.Each node includes its dynamically assigned ID, name, and type.
> +	 * Obtain the Node IDs by calling this command and use it in the subsequent operations
> +	 * on the nodes.
> +	 */
> +	DRM_RAS_CMD_LIST_NODES = 1,
> +
> +	/**
> +	 * @DRM_RAS_CMD_GET_ERROR_COUNTERS: Retrieve the full list of error counters for a given
> +	 * node. The response include id, name, and current value of each counter.
> +	 */
> +	DRM_RAS_CMD_GET_ERROR_COUNTERS,
> +
> +	/**
> +	 * @DRM_RAS_CMD_QUERY_ERROR_COUNTER: Query the information of a specific error counter
> +	 * for a given node. Response contains id, name, and current value of the counter.
> +	 */
> +	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#endif /* _LINUX_DRM_RAS_H */
> diff --git a/meson.build b/meson.build
> index db6e09a94..f7807660e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -165,10 +165,13 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
>   libudev = dependency('libudev', required : true)
>   glib = dependency('glib-2.0', required : true)
>   
> +libnl = dependency('libnl-3.0', required: false)
> +libnl_genl = dependency('libnl-genl-3.0', required: false)
> +libnl_cli = dependency('libnl-cli-3.0', required:false)
> +
>   xmlrpc = dependency('xmlrpc', required : false)
>   xmlrpc_util = dependency('xmlrpc_util', required : false)
>   xmlrpc_client = dependency('xmlrpc_client', required : false)
> -
>   xmlrpc_cmd = find_program('xmlrpc-c-config', required : false)
>   if not xmlrpc.found() and xmlrpc_cmd.found()
>   	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs', check: false)
> diff --git a/tools/drm_ras.c b/tools/drm_ras.c
> new file mode 100644
> index 000000000..13aab347a
> --- /dev/null
> +++ b/tools/drm_ras.c
> @@ -0,0 +1,556 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <ctype.h>
> +#include <getopt.h>
> +#include <linux/genetlink.h>
> +#include <netlink/netlink.h>
> +#include <netlink/cache.h>
> +#include <netlink/genl/genl.h>
> +#include <netlink/genl/ctrl.h>
> +#include <netlink/cli/utils.h>
> +#include <netlink/cli/link.h>
> +#include "../include/drm-uapi/drm_ras.h"
> +#include "igt_device_scan.h"
> +
> +#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
> +
> +struct nl_sock *mcsock;
> +
> +enum opt_val {
> +	OPT_UNKNOWN = '?',
> +	OPT_END = -1,
> +	OPT_NODEID,
> +	OPT_ERRORID,
> +	OPT_ERRORNAME,
> +	OPT_HELP,
> +};
> +
> +enum cmd_ids {
> +	INVALID_CMD = -1,
> +	LIST_NODES = 0,
> +	GET_ERROR_COUNTERS,
> +	QUERY_ERROR_COUNTER,
> +
> +	__MAX_CMDS,
> +};
> +
> +static const char * const cmd_names[] = {
> +	"list_nodes",
> +	"get_error_counters",
> +	"query_error_counter",
> +};
> +
> +struct err_mapping {
> +	uint32_t node_id;
> +	uint32_t error_id;
> +	char error_name[65];
> +};
> +
> +struct app_context {
> +	enum drm_genl_error_cmds command;
> +	struct nl_sock *sock;
> +	struct nl_cb *cb;
> +	uint32_t node_id;
> +	uint32_t error_id;
> +	int error;
> +	int family_id;
> +	char error_name[65];
> +	struct err_mapping *err_mappings;
> +	int num_mappings;
> +	int err_map_capacity;
> +	bool is_mapping;
> +};
> +
> +static void help(char **argv)
> +{
> +	int i;
> +
> +	printf("Usage: %s command [<command options>]\n", argv[0]);
> +	printf("commands:\n");
> +
> +	for (i = 0; i < __MAX_CMDS; i++) {
> +		switch (i) {
> +		case LIST_NODES:
> +			printf("%s %s\n",
> +			       argv[0],
> +			       cmd_names[i]);
> +			break;
> +		case GET_ERROR_COUNTERS:
> +			printf("%s %s --node-id=<node-id>\n",
> +				argv[0],
> +				cmd_names[i]);
> +			break;
> +		case QUERY_ERROR_COUNTER:
> +			printf("%s %s --node-id=<node-id> "
> +				"--error-id=<error-id>\n",
> +				argv[0],
> +				cmd_names[i]);
> +			printf("%s %s --node-id=<node-id> "
> +				"--error-name=<error-name>\n",
> +				argv[0],
> +				cmd_names[i]);
> +			break;
> +		default:
> +			printf("%s is Unknown Command\n",
> +			       (i < __MAX_CMDS && cmd_names[i]) ? cmd_names[i] : "Unknown");
> +		}
> +	}
> +}
> +
> +static void handle_err(struct nl_sock *sock, int ret, const char *err_msg)
> +{
> +	nl_close(sock);
> +	nl_socket_free(sock);
> +	nl_cli_fatal(ret, err_msg);
> +}
> +
> +static uint32_t get_error_id_by_name(struct app_context *ctx, const char *error_name)
> +{
> +	int i = 0;
> +
> +	for (i = 0; i < ctx->num_mappings; ++i) {
> +		if (strcmp(ctx->err_mappings[i].error_name, error_name) == 0 &&
> +		    ctx->err_mappings[i].node_id == ctx->node_id) {
> +			return ctx->err_mappings[i].error_id;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static void __send_cmd(int cmd, void *arg)
> +{
> +	struct app_context *ctx = (struct app_context *)arg;
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		handle_err(ctx->sock, NLE_INVAL, "nlmsg_alloc failed\n");
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_LIST_NODES:
> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
> +				       ctx->family_id, 0,
> +				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
> +				       cmd, 1);
> +		if (!msg_head)
> +			handle_err(ctx->sock, ENOMEM, "genlmsg_put failed\n");
> +
> +		if (!ctx->is_mapping)
> +			printf("%-18s\t%-30s\t%-30s\t%-18s\n",
> +				"node-id", "device-name", "node-name", "node-type");
> +		break;
> +	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
> +		if (ctx->node_id == -1) {
> +			fprintf(stderr, "Error: --node-id is required for %s command\n",
> +				cmd_names[ctx->command - 1]);
> +			exit(EXIT_FAILURE);
> +		}
> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
> +				       ctx->family_id, 0,
> +				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
> +				       cmd, 1);
> +
> +		if (!msg_head)
> +			handle_err(ctx->sock, ENOMEM, "genlmsg_put failed\n");
> +
> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
> +		if (!ctx->is_mapping)
> +			printf("%-18s\t%-30s\t%-18s\n",
> +				"error-id", "error-name", "error-value");
> +
> +		break;
> +	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
> +		if (ctx->node_id == -1) {
> +			fprintf(stderr,
> +				"Error: --node-id is required for %s command\n",
> +				cmd_names[ctx->command - 1]);
> +			exit(EXIT_FAILURE);
> +		}
> +
> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
> +				       ctx->family_id, 0,
> +				       NLM_F_REQUEST | NLM_F_ACK,
> +				       cmd, 1);
> +
> +		if (!msg_head)
> +			handle_err(ctx->sock, ENOMEM, "genlmsg_put failed\n");
> +
> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID, ctx->error_id);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
> +
> +	ret = nl_recvmsgs_default(ctx->sock);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
> +
> +	nlmsg_free(msg);
> +}
> +
> +
> +static void query_by_error_name(struct app_context *ctx)
> +{
> +	enum drm_genl_error_cmds orig_command = ctx->command;
> +	uint32_t error_id_from_name = 0;
> +
> +	ctx->is_mapping = true;
> +	ctx->num_mappings = 0;
> +
> +	ctx->command = DRM_RAS_CMD_GET_ERROR_COUNTERS;
> +
> +	/* Map error_id with error_name using get_error_counters op */
> +	__send_cmd(DRM_RAS_CMD_GET_ERROR_COUNTERS, ctx);
> +
> +	ctx->command = orig_command;
> +
> +	/* Get the error_id from the given error_name */
> +	error_id_from_name = get_error_id_by_name(ctx, ctx->error_name);
> +	if (error_id_from_name == (uint32_t)-1) {
> +		fprintf(stderr, "Error: Unable to find error-name %s for node %d\n",
> +				ctx->error_name, ctx->node_id);
> +		handle_err(ctx->sock,
> +			   NLE_FAILURE,
> +			   "Unable to find given error-name for the given node\n"
> +			   );
> +	}
> +
> +	/* Query the error counter with retrieved error_id */
> +	ctx->is_mapping = false;
> +	ctx->error_id = error_id_from_name;
> +	__send_cmd(DRM_RAS_CMD_QUERY_ERROR_COUNTER, ctx);
> +
> +}
> +
> +static void send_cmd(int cmd, void *arg)
> +{
> +	struct app_context *ctx = (struct app_context *)arg;
> +
> +	if (cmd == DRM_RAS_CMD_QUERY_ERROR_COUNTER &&
> +	    ctx->error_id == -1 &&
> +	    strlen(ctx->error_name) > 0) {
> +		query_by_error_name(ctx);
> +	} else {
> +		__send_cmd(cmd, ctx);
> +	}
> +}
> +
> +
> +static int list_nodes_handler(struct nl_msg *msg, void *arg)
> +{
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct nlattr *nla;
> +	int len, remain;
> +
> +	len = GENL_HDRLEN;
> +	nlmsg_for_each_attr(nla, nlh, len, remain) {
> +		if (nla_type(nla) > DRM_RAS_NODE_ATTR_MAX) {
> +			printf("Unknown Node attribute type: %d\n", nla_type(nla));
> +			return NL_SKIP;
> +		}
> +
> +		switch (nla_type(nla)) {
> +		case DRM_RAS_NODE_ATTR_NODE_ID:
> +			printf("%-18u\t", nla_get_u32(nla));
> +			break;
> +		case DRM_RAS_NODE_ATTR_DEVICE_NAME:
> +			printf("%-30s\t", nla_get_string(nla));
> +			break;
> +		case DRM_RAS_NODE_ATTR_NODE_NAME:
> +			printf("%-30s\t", nla_get_string(nla));
> +			break;
> +		case DRM_RAS_NODE_ATTR_NODE_TYPE:
> +			printf("%-18u\n", nla_get_u32(nla));
> +			break;
> +		default:
> +			printf("Unknown attribute type: %d\n", nla_type(nla));
> +			break;
> +		}
> +	}
> +	return NL_OK;
> +}
> +
> +static int query_error_counter(struct nl_msg *msg, void *arg)
> +{
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct app_context *ctx = (struct app_context *)arg;
> +	struct nlattr *attrs[256];
> +	int ret;
> +
> +	ret = genlmsg_parse(nlh, 0, attrs, 256, NULL);
> +	if (ret < 0) {
> +		fprintf(stderr, "Failed to parse attributes: %s\n", nl_geterror(ret));
> +		return NL_SKIP;
> +	}
> +
> +	if (!attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE])
> +		handle_err(ctx->sock,
> +			   NLE_FAILURE,
> +			   "DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE attribute is missing\n"
> +			   );
> +
> +	printf("counter value %u\n", nla_get_u32(attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]));
> +
> +	return NL_OK;
> +}
> +
> +static int get_error_counters(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = (struct app_context *)arg;
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct nlattr *nla;
> +	int len, remain;
> +	uint32_t curr_error_id = 0;
> +	char curr_error_name[65] = {0};
> +
> +	len = GENL_HDRLEN;
> +
> +	nlmsg_for_each_attr(nla, nlh, len, remain) {
> +		if (nla_type(nla) > DRM_RAS_ERROR_COUNTER_ATTR_MAX) {
> +			printf("Unknown error counter attribute type: %d\n", nla_type(nla));
> +			return NL_SKIP;
> +		}
> +
> +		switch (nla_type(nla)) {
> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID:
> +			curr_error_id = nla_get_u32(nla);
> +			if (!ctx->is_mapping)
> +				printf("%-18u\t", curr_error_id);
> +			break;
> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME:
> +			strncpy(curr_error_name, nla_get_string(nla), sizeof(curr_error_name) - 1);
> +			curr_error_name[sizeof(curr_error_name) - 1] = '\0';
> +			if (!ctx->is_mapping)
> +				printf("%-30s\t", curr_error_name);
> +			break;
> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE:
> +			if (!ctx->is_mapping)
> +				printf("%-18u\n", nla_get_u32(nla));
> +
> +			if (ctx->is_mapping) {
> +				if (ctx->num_mappings >= ctx->err_map_capacity) {
> +					ctx->err_map_capacity = ctx->err_map_capacity
> +								? ctx->err_map_capacity * 2
> +								: 10;
> +					ctx->err_mappings = realloc(ctx->err_mappings,
> +						ctx->err_map_capacity * sizeof(struct err_mapping));
> +					if (!ctx->err_mappings) {
> +						fprintf(stderr, "Memory allocation failed\n");
> +						handle_err(ctx->sock, NLE_FAILURE, "Memory allocation failed\n");
> +					}
> +				}
> +
> +				ctx->err_mappings[ctx->num_mappings].error_id = curr_error_id;
> +				len = sizeof(ctx->err_mappings[ctx->num_mappings].error_name);
> +				snprintf(ctx->err_mappings[ctx->num_mappings].error_name,
> +					len, "%s", curr_error_name);
> +				ctx->err_mappings[ctx->num_mappings].error_name[len - 1] = '\0';
> +				ctx->err_mappings[ctx->num_mappings].node_id = ctx->node_id;
> +				ctx->num_mappings++;
> +			}
> +			break;
> +		default:
> +			printf("Unknown attribute type: %d\n", nla_type(nla));
> +			break;
> +		}
> +	}
> +	return NL_OK;
> +}
> +
> +static int drm_genl_handle_msg(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = (struct app_context *)arg;
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct genlmsghdr *gnlh = genlmsg_hdr(nlh);
> +
> +	if (gnlh->cmd != ctx->command) {
> +		fprintf(stderr,
> +			"Unexpected command response: got %d, expected %d\n",
> +			gnlh->cmd,
> +			ctx->command);
> +		return NL_SKIP;
> +	}
> +
> +	switch (ctx->command) {
> +	case DRM_RAS_CMD_LIST_NODES:
> +		return list_nodes_handler(msg, arg);
> +	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
> +		return get_error_counters(msg, arg);
> +	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
> +		return query_error_counter(msg, arg);
> +	default:
> +		fprintf(stderr, "Unknown command: %d\n", ctx->command);
> +		ctx->error = -EOPNOTSUPP;
> +		return NL_SKIP;
> +	}
> +}
> +
> +static int get_cmd(char *cmd_name)
> +{
> +	int i;
> +
> +	if (!cmd_name)
> +		return -1;
> +
> +	for (i = 0; i < __DRM_RAS_CMD_MAX; i++) {
> +		if (strcasecmp(cmd_name, cmd_names[i]) == 0)
> +			return i + 1;
> +	}
> +	return -1;
> +}
> +
> +static int check_for_help(int argc, char **argv)
> +{
> +	for (int i = 1; i < argc; i++) {
> +		if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "-h") == 0)
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	char *endptr;
> +	int ret, opt, option_index = 0;
> +	struct app_context ctx = {0};
> +	static struct option options[] = {
> +		{"error-id", optional_argument, NULL, OPT_ERRORID},
> +		{"node-id",  optional_argument, NULL, OPT_NODEID},
> +		{"error-name", optional_argument, NULL, OPT_ERRORNAME},
> +		{"help",     no_argument,       NULL, OPT_HELP},
> +		{0, 0, 0, 0}
> +	};
> +
> +	ctx.error_id = -1;
> +	ctx.node_id = -1;
> +	memset(ctx.error_name, '\0', sizeof(ctx.error_name));
> +	ctx.is_mapping = false;
> +	ctx.err_mappings = NULL;
> +	ctx.num_mappings = 0;
> +	ctx.err_map_capacity = 0;
> +
> +	if (argc < 2) {
> +		fprintf(stderr, "\nNo Arguments were passed.\n\n"
> +			"Use --help to see the correct usage.\n\n");
> +		exit(EXIT_FAILURE);
> +	}
> +	if (check_for_help(argc, argv)) {
> +		help(argv);
> +		exit(EXIT_SUCCESS);
> +	}
> +
> +	ctx.command = get_cmd(argv[1]);
> +	if (ctx.command < 0) {
> +		fprintf(stderr, "invalid command\n");
> +		help(argv);
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	optind = 2;
> +	while ((opt = getopt_long(argc, argv, "h", options, &option_index)) != -1) {
> +		switch (opt) {
> +		case OPT_ERRORID:
> +			if (strlen(optarg) == 0) {
> +				printf("error-id not specified. check --help  for correct usage\n");
> +				exit(EXIT_FAILURE);
> +			}
> +			ctx.error_id = strtoul(optarg, &endptr, 10);
> +			if (*endptr != '\0' || ctx.error_id < 0) {
> +				fprintf(stderr,
> +					"\ninvalid error-id %s\n\n"
> +					"Enter a valid error-id received from get_error_counters command\n\n",
> +					optarg);
> +				exit(EXIT_FAILURE);
> +			}
> +			break;
> +		case OPT_ERRORNAME:
> +			if (optarg == NULL || strlen(optarg) == 0) {
> +				printf("error-name not specified. check --help for usage\n");
> +				exit(EXIT_FAILURE);
> +			}
> +			if (strlen(optarg) >= sizeof(ctx.error_name)) {
> +				fprintf(stderr,
> +					"\ninvalid error-name %s\n\n"
> +					"error-name is too long\n\n",
> +					optarg);
> +				exit(EXIT_FAILURE);
> +			}
> +			strncpy(ctx.error_name, optarg, sizeof(ctx.error_name)-1);
> +			ctx.error_name[sizeof(ctx.error_name)-1] = '\0';
> +			break;
> +		case OPT_NODEID:
> +			if (strlen(optarg) == 0) {
> +				printf("node-id not specified. Check --help for correct usage\n");
> +				exit(EXIT_FAILURE);
> +			}
> +
> +			ctx.node_id = strtoul(optarg, &endptr, 10);
> +			if (*endptr != '\0' || ctx.node_id < 0) {
> +				fprintf(stderr,
> +					"\ninvalid node id %s\n\n"
> +					"Enter a valid node-id received from list_nodes command\n\n",
> +					optarg);
> +				exit(EXIT_FAILURE);
> +			}
> +
> +			break;
> +		case OPT_HELP:
> +		case 'h':
> +			help(argv);
> +			exit(EXIT_SUCCESS);
> +			break;
> +		case '?':
> +			fprintf(stderr,
> +				"Unknown argument passed\n"
> +				"Check --help for the correct usage\n\n");
> +			exit(EXIT_FAILURE);
> +			break;
> +		default:
> +			fprintf(stderr, "Unexpected option: %c\n", opt);
> +			exit(EXIT_FAILURE);
> +			break;
> +		}
> +	}
> +
> +	ctx.sock = nl_cli_alloc_socket();
> +	if (!ctx.sock)
> +		nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
> +
> +	ret = nl_cli_connect(ctx.sock, NETLINK_GENERIC);
> +	if (ret < 0)
> +		handle_err(ctx.sock, ret, "Cannot connect handle\n");
> +
> +	ctx.family_id = genl_ctrl_resolve(ctx.sock, DRM_RAS_GENL_NAME);
> +	if (ctx.family_id < 0)
> +		handle_err(ctx.sock, NLE_INVAL, "Resolving of family name failed\n");
> +
> +	ret = nl_socket_modify_cb(ctx.sock, NL_CB_VALID, NL_CB_CUSTOM, drm_genl_handle_msg, &ctx);
> +	if (ret < 0)
> +		handle_err(ctx.sock, ret, "Unable to modify valid message callback\n");
> +
> +	send_cmd(ctx.command, &ctx);
> +
> +	nl_close(ctx.sock);
> +	nl_socket_free(ctx.sock);
> +
> +	if (ctx.err_mappings)
> +		free(ctx.err_mappings);
> +
> +	return 0;
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..74ff97713 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -70,6 +70,11 @@ if libudev.found()
>   		   install : true)
>   endif
>   
> +executable('drm_ras', 'drm_ras.c',
> +			dependencies : [tool_deps, libnl, libnl_cli, libnl_genl],
> +			install_rpath : bindir_rpathdir,
> +			install : true)
> +
>   executable('gputop', 'gputop.c',
>              install : true,
>              install_rpath : bindir_rpathdir,

