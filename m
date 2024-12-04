Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35619E48FB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 00:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C98110ED82;
	Wed,  4 Dec 2024 23:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnfhMc74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11AD10ED7F;
 Wed,  4 Dec 2024 23:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733354991; x=1764890991;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/XCsChJX1lj0FA3KJhacGG3ipFInCT4YpqlYwOAbl/8=;
 b=ZnfhMc74sK8oTydFao9/x2GDbztQI2QYUDXyh/qu0UZuQ2/ydk/yNkAs
 r6QMDwIb/6AiWMUynqK4NY1+K2+GPZRkkyvZzJ+vks+bHukfPbJcbkGe6
 A8KYR4YAMkFrMwk/u6fjUPThNiHUyIFdzv/U1hIo+27BoEsnZ+10CpKRY
 mduq1QUmzhwKymx34Su8ZkBuMrW41UoZfLe4Rdt5jopMLW72oZHFAUGkd
 oWVXld/1MqdMUAcOd24rekJpx6E1+QtXZQ+JoyP18+gxTyk3/AoixLP0g
 dFvpgkb2juR9vywm+vNq4Z3K/9u2Cb4gu4YEDx7Twgyz7mz8ZOTvnoGxm A==;
X-CSE-ConnectionGUID: dBgpKflhQG2nTcIrbWPG2w==
X-CSE-MsgGUID: f9geQF5ISPOBIMafuxmikg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45022663"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="45022663"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 15:29:51 -0800
X-CSE-ConnectionGUID: QwDSqL/wTmqUBpiN5h+0+A==
X-CSE-MsgGUID: ulnn+YgMQDiPN4F04yu0lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="93789215"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 15:29:50 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 15:29:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 15:29:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 15:29:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ilz4RL9ouPRfQ/bu/uMZViAU6cdO1c/wGLejsa15g5HR1UVIzgbkfvKRj6Hv1h8CXh0TNVyUvUkXelapK45ngLF9kFNUXvKTBaGzyKu/dh1dWG4BQh0gQGgF88li4rJzSFi4xnrotHQmqKIO8+7Tv89s6FSb29V28kIG/uMhMBMImHr1T4wUWk7zaEi/qHWbTWYnBNmAb/d35T4Nyeu+JWBLp1esQmm43uvlrp14Lzq4Ck0MWE/yedFWWOSPT/jJ8kgYszLkFKdx/iuBMTZgVGBQd6zsQcE4Se/tpu7yd6RuMlfNv9QmhT3Mo51YUMbQuDCzNzEEWDtNVFKZwtLiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFhBCEAa0OVVVnn6yD8wtBa/L/GWvcVvU8Ew+YJh3+U=;
 b=Jk3qXczwB2PcHVFQYjK5E4HKy9RoqbNXOq/nHcjXGZDKNN82BQ9XovhJ7D0YJJenDNItoHx4QknFAm0HP86U0ZuhuQFj1Dqv4GnKAe1nVggUvmbEsgpJRPdGXNBMPBR4zHOSVzAlsHheYFblyqx+qjpj9I/DoXRTDTC4z5q1v6CcM5dKtADPWiQpPNCV1TwLUuvB+WV8rJcaQhAOoVgnkqUuEnCTMfi6UdugtDqbXceZRV4rsdRpzBgz65RHc+4MO2y8qSwQ0zEz+3TsKztWMn82Ccyfps5hpzys69GPobtT46Hj645Y+IsBCZhpUaRo1wskwrgxoJz4yHkqNMamTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 23:29:40 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 23:29:40 +0000
Message-ID: <5ab5f03d-0cd6-432e-84d5-fb11de092da1@intel.com>
Date: Wed, 4 Dec 2024 18:29:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/guc/capture: Maintenence of devcoredump <->
 GuC-Err-Capture plumbing
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
References: <20241203174732.3232351-1-alan.previn.teres.alexis@intel.com>
 <20241203174732.3232351-2-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241203174732.3232351-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fdee0d3-d862-425a-9fe6-08dd14bb8652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVZ3S3dRMXFoQm5MVURpMEVJLy82QWVsajNvdmR2WmR6VlRsaG9CNmVyaFN3?=
 =?utf-8?B?Q2l1R0s2eDB3SFNMMnRZZFAzVm9LdnRMR1RxRmNSRkxlZFppcHFJSXU0dDJO?=
 =?utf-8?B?NFpYSEpOdlgrcG9zQVdBL3B2cnFFalordm40VzEzcDloOHFKSndqUjF6by9o?=
 =?utf-8?B?TkE5Y2FDNmpQZmlxdDErOURrTGsvTXUrU0plYmQ5MUNQK1pHdWlrSm1nS2U2?=
 =?utf-8?B?QTlLN1lIY1NOWUo2WHB2MUk1a3R5eHBmTE9IYlJIV1JBbzRDTWVaWkpmTXd0?=
 =?utf-8?B?TmIzcE5WS3QyMnJzZkNRaTIyQmhtQmVrTEdqV0w1Q3Jwcm9CTGoyWGFPR2JB?=
 =?utf-8?B?THNlMnFleXZ2YmcrSXBIaUNMQU9wR3F0cmZkZGF2L2ozbXVKSlY3djBPZzhr?=
 =?utf-8?B?S0RISkxwTXpGSnNpK0s1UUtLYSs0MWpOclZyMnU0Mk5jMDRwNEdSSG0yWHBn?=
 =?utf-8?B?bXJrVlBlK2hoVUpaYzdkUjNtVXlxL3o5K3l4Q1dwOFNTYWI4R0M1N3lZQkZ1?=
 =?utf-8?B?TE1xeWYyOGxWTnZOak1tL25nQWQ1dGJDcHlnKzdxQURybDBZZzl0WjYzVGhv?=
 =?utf-8?B?UHZrWkE0S1NxQXRQYnY4Um02VU1aYmtkNTVrU0NEL1dkTTkzV1ppZ2NXQXp1?=
 =?utf-8?B?OHJTV2pBTzlTOXNwSUxUZHJ2ZS9OaEF2S0dUMnlKd0E5MkFSQUVtY0tTVWFF?=
 =?utf-8?B?bUlkcXN6QW9QbFFvWTFrOWdLeWxOeGI3eGVxTUY5MGFJT2VOTWw4WUoyUHhP?=
 =?utf-8?B?Mk55bkkvZk1CMy9peWRrT1dPSGhJVDlpdDY1aitEcC9pMk05Tlg0VHh0c0lP?=
 =?utf-8?B?L1l1SUpYL24zUVlEVXdmL2NYSGpjejk3QUJnQ1dqd0tMV0lGcUsxRUEySXpo?=
 =?utf-8?B?S01vbnY2bmRVV2hNQ1hwQUpkQ3V4WFFCSXBRMVRVZUZ5NEUvOWgxVktJSFhT?=
 =?utf-8?B?elgyank4a3czMXpzL0h5Zk5QZ3JEL1lzdDdOeWtwSDNYalNIamtSV0tIZy9P?=
 =?utf-8?B?THBKQWF2TVFIalhzSEFFdlpmMjkxWGFTSXhJQkhIQ09kR3NnUHJHL0NsN01M?=
 =?utf-8?B?Z1lWYkFYbTIydWJHQnRLeDlCTDk4bnJVRHZaL0YybkUrUlNlZ3diVDFEUmlT?=
 =?utf-8?B?K2tscUtMbjJzWXlUTC9KSDl5WXp2NFhwclVrbVQwcHl1dXg0N2IvdEFMSlNS?=
 =?utf-8?B?M0dsWUVWWjhIb0EwUjlncmlWckExR3p3cjcrb0J3enV1bjlrR1VIcnllYjBT?=
 =?utf-8?B?UmZHa0RCN3hFam1BQlBHUEZTK3BxMForNWoxWExGaHdGQnowT2ZGcGQ0bXI4?=
 =?utf-8?B?eDVRbk4vZU5JbDdYS3Vwc1RpcWVKZmpic0Y1NUdZTWMzMk1kRzQzTEN3ZE5k?=
 =?utf-8?B?NUNWU0xGSEtXYUJscVBHWVpsYjNmeG12Y2l4dkdpcitFQW1SMWROb0FxMFcz?=
 =?utf-8?B?TkpZSlVDemxDWUJ0RkpUQ3Izam9tWS8xaXk1djJVamZIR2ZkdTJjRUoyQmp2?=
 =?utf-8?B?RTdNbXJSampreUYrTXBGUnhhc1pURk80emxaWXZ2WVh2QlRodUZ2Tk9VWStJ?=
 =?utf-8?B?c09LeldZM0dGUVd4OFNXY28xaHNyRHBXNCtNK2NhYkJBQ0ZKNXVJQnEvYURU?=
 =?utf-8?B?cUdQejhKZnI1Q3NmZEpXQ3BaN3VrMlF1OVFhbndYZEFoTXdyUWdZdDFiMXVq?=
 =?utf-8?B?TmxqK0Z3VTltLytxaXg0S20xdlh0M1kvMVZHUXZtcU9sQ0NqWEtzMUZSbUps?=
 =?utf-8?B?VzkzbFhOOHpSanRMdVRQMEhNR3ZPSEhlQnVaSGUrYjQyZUQrRkRobmRMb3RZ?=
 =?utf-8?B?TTEvK0wwQmZRanlMRzdoUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHVUOWtaQlNmbHh6NGdMa1VNSlQ3dDlsK3k2N1p4WU9lWTdrZlhuU3ZBNi9L?=
 =?utf-8?B?T1k3QWY5bU94VjJYWXVMMXpWd3ErRFdEYkNSVEdhakM3R0JoL3NRSVdlaDJJ?=
 =?utf-8?B?Vzh6YVZqTE9VN1NJY2p4VGhWOHQzZlozQnI3WkI1OHZWNUUvZ3M5TE94T0Rq?=
 =?utf-8?B?dUpvZ0kvSXVMZmlyQTlCMmFpZlBYQldOMlR0ZWc3V00yZ05iYVJsNzJsdGh6?=
 =?utf-8?B?VkNDUXRoOGhzaDNoR3lRT09jeVd3MThmYkVQUkoyL21tN2FxRmg0aTRvUjY4?=
 =?utf-8?B?RFJGSnNSK2dpT3NqRit4bTFpeGNLOS8zL2xMZ252OUlLbi84cXY2K21YUi9S?=
 =?utf-8?B?SUFDemZiajYrT1UyczliSi9BYnVZRzRiclJrazVianFRUTRodTNyd1JaUWtn?=
 =?utf-8?B?S2ZDT0xVZDQ4ZDR6WUJqWENCOFFkeGxkUVYyMHdpYkIxQ3NieWxmeHNsc2xC?=
 =?utf-8?B?eUc0ZWY3NERRdmtWcEhjUWQ2VFdyd2pQOURrZm1aTTAycHNzbGhOZEkzR3c4?=
 =?utf-8?B?UXNNZVkxQXE5OHQ4WWpON3pXQmZMRm1rN1R3RTJYNldxM25xWDl4Kyt5Ynpi?=
 =?utf-8?B?WTlPV3JZOElmcFRhZnRRcnZUbzl6dGVzTlQ0clRhQ0hQMG9zbWNDenVXUEZy?=
 =?utf-8?B?d0tRRDFiK2lTeTkwRnoxKzhjN3RabG0vUE9EYUJhbVFJN2lOeEsxcVZkbkVY?=
 =?utf-8?B?MVBXdWRrSVNONHJ6M2VWTnpHZm1DMTZrcUVBSlBIVVpsMG92TjZGeDZEaWpR?=
 =?utf-8?B?ckY5Q2lXZUVncHlHbHdXWVZsOHVndlVwbFUyQ0phTWpDVmQzdHg4L01hd2dm?=
 =?utf-8?B?Wi9DcGdIZ09FWHBRZ1o3RXliNFQ3TVNSczNwei9Ia2VsMkZmQ3ZtTzl3Z3lP?=
 =?utf-8?B?VkgyOTdKVDRBSEduTXJWbENQdUVpM1YySGtnTU5ldlAxaEhPbzd1WkhhUDJF?=
 =?utf-8?B?bFlVa2EwaytlVVhhUWFGZERqZDBDV2MwWXl1SWg5V1BsY3BJN2RBWTdHaWQ5?=
 =?utf-8?B?OXVXWlJhK0o4RTZuYUVUdGNZOFdQcjNKeEc2VWp5d3NCV3loankzK3lmcFRz?=
 =?utf-8?B?R0Nmc3hUMmVrTENvMndvQ2VsL3ErTk9Fem4vcW1Cbm43ZDNCL1Jzek1McFpR?=
 =?utf-8?B?ZUFyTmtKM0xRbDVPR1JiRFFHd0NnZWJ6VHNnQXJaekNjbEc2anpBTHQ0R3Aw?=
 =?utf-8?B?MGJZeTdZVVYrT1FqbmIrK2RlUVJjTDhCR3lVQ1Q0SG5DZGUvelIzTmd3VEZi?=
 =?utf-8?B?S0FVVUlEN2p0djltZW5zY1U2aTZJU1lRTUJBQ3Y0Z25PY3VTcmpWa3dQMDd5?=
 =?utf-8?B?M0VDUXQvUHNaUFhyT2cyNU5mL0E1Q3kzbDNMcEdXZmFKVE5oQ0tqaWYwbFlG?=
 =?utf-8?B?NzRCaVBwRWF0TllpY3RDVDUrTTJoWGlUMjE3cUJOOTFYOFJOMHpPTXgxZnhW?=
 =?utf-8?B?ZEFUaWMyYnBXQjFGaVBTVzNMRmUvNUs0UnBBdmZ6UnAvTU9CTWdQWHlBaFhD?=
 =?utf-8?B?TStCWnQ3Ri9ON1lRQzRmMVorU3RrWEJyaUZsaVZBL3NOZ3JsT2xDeFgvbFgr?=
 =?utf-8?B?aDRMQm1zYU9UR2ZUc2s1NzRvaGxFVzlodXgxMEgvdWlER0pnTzF1ZmZiQmda?=
 =?utf-8?B?ZGtoMUIyRmQ5ZU9iUk9kU3VaZmxTWTdCRlloWmJJcUdDbWY3TkRmdno2SEps?=
 =?utf-8?B?WjljWGk0UVdmRkhUaXh4Ymh3VTlSMk1aYWNtYW80YjVsMElLcGFMazF1SlRV?=
 =?utf-8?B?T21oNHNVci8zVk85VXM3Z1B2cUlGbU1ITDFRWkhMUC9KTlFYNmtac3kxYjFK?=
 =?utf-8?B?cGwwbVNreUF2RjRyTVdPcmhLZmt0TVhnUmRwQzB4Z0k2Mi93QjFJZzlJMTBq?=
 =?utf-8?B?cDZHaE1XVFRqWjlaOStGQ29rOW0xbCtLYVNBMEZxY09NWUN6aUVMMHM0bmpB?=
 =?utf-8?B?eFBFQitWaUcvSnkycGJsdzQ3ZUxxcE5Lenp0VVppTkhzT2UvNUJVZTBtRDFP?=
 =?utf-8?B?aWJyd3QyQkJ3Y1AzUEtHRS9WY1BFdFBMR0hNQi9iTyszT3F2dXUxdkczbjg3?=
 =?utf-8?B?T0NJMlZNZ0xIYS9Vd2VvanBrdEZsbmhZMEZkL0I4dnZDazJ2NlRTMlIxa1kw?=
 =?utf-8?Q?XazlvxB50e+9f5TEpFzIUw2qS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdee0d3-d862-425a-9fe6-08dd14bb8652
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 23:29:40.3889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxiWSRhSbwreGslbyVohJLr4aHsB//r77nrmMoZIZlETfFp0yKDbxoDpBysUOUG+DjoYBtM+Llpwtl15Vm/+Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
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

LGTM

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

*Previous RB send to coverletter, resend to the patch itself.

Regards,
Zhanjun Dong

On 2024-12-03 12:47 p.m., Alan Previn wrote:
> The order of the devcoredump event flow is:
> drm-scheduler -> guc-submission-execq-timed-out-job ->
> guc-submission-kill-job -> xe-devcoredump (once the work
> is confirmed to have been killed).
> 
> As we are aware, the GuC-FW IRQ for error-capture delivery
> and extraction could have happened before the start of
> guc-execq-timed-out-job or the middle of it (before or
> during the explicit kill) or not at all. Thus, today, the
> above flow takes a manual capture first before triggering
> the kill-job just in case we need it.
> 
> The structure layering of devcoredump internals are:
> xe_devcoredump_snapshot -> xe_foo_snapshot (where foo
> can be any data dump associated to the job was killed).
> Foo includes the xe_hw_engine_snapshot. Since GuC-Error-Capture
> provides just the register dump of an engine, GuC-Err-Capture
> snapshots should be managed by the xe_hw_engine_snapshot.
> That isn't the case today.
> 
> Furthermore, neither xe_devcoredump_snapshot nor
> xe_hw_engine_snapshot even exists at the start of
> guc-submission-execq-timed-out-job. Thus, the first
> manual capture node has no home. However, today,
> GuC-Error-Capture stores capture snapshots off the
> top-level xe_devcoredump_snapshot's matched_node.
> GuC-Error-Capture also had absorbed the function for
> xe_hw_engine_snapshot generation.
>       NOTE: Existing code isn't broken because xe_devcoredump
>       is not dynamically allocated and designed to hold a
>       single event at a time (i.e. single engine dump).
>       But it's not scalable for future improvement.
> 
> Thus this patch:
> 1. Moves "matched_node" from xe_devcoredump_snapshot to
>     xe_hw_engine_snapshot.
> 2. Relocates the functions for xe_hw_engine_snapshot generation
>     and printing back to xe_hw_engine.c. However, split out the
>     register dump printing so it stays within GuC-Error-Capture
>     (so we don't need to maintain two sets of register lists).
> 3. Keep both the manual and firmware capture nodes within
>     GuC-Error-Capture subsystem's linked list until
>     xe_hw_engine_snapshot gets and puts them later.
> 4. Give xe_hw_engine_snapshot the control and ability to
>     query GuC-Error-Capture for matching snapshots while choosing
>     between manual vs firmware capture getting/putting node.
> 5. While at it, relocate (and rename) key structures, enums
>     and function protos to xe_guc_capture_snapshot_types.h
>     (as an inter-module header) for xe_hw_engine_snapshot to use.
> 6. Since xe_hw_engine_snapshot can also be called by via debugfs
>     without a job, create a new function that does a manual capture
>     of engine registers without any associated job.
> 
>      v2 -> v3:
>       - Fix check on queue handle when getting manual capture (CI-test)
>      v1 -> v2:
>       - Bail on manual capture when running on a VF (Zhanjun)
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c           |   3 -
>   drivers/gpu/drm/xe/xe_devcoredump_types.h     |   6 -
>   drivers/gpu/drm/xe/xe_guc_capture.c           | 406 ++++++++----------
>   drivers/gpu/drm/xe/xe_guc_capture.h           |  10 +-
>   .../drm/xe/xe_guc_capture_snapshot_types.h    |  68 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c            |  21 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c             | 117 +++--
>   drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
>   drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
>   9 files changed, 359 insertions(+), 289 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 71636e80b71d..b17e79528fc7 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -149,9 +149,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>   	xe_guc_ct_snapshot_free(ss->guc.ct);
>   	ss->guc.ct = NULL;
>   
> -	xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
> -	ss->matched_node = NULL;
> -
>   	xe_guc_exec_queue_snapshot_free(ss->ge);
>   	ss->ge = NULL;
>   
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 1a1d16a96b2d..28486ed93314 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -53,12 +53,6 @@ struct xe_devcoredump_snapshot {
>   	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
>   	/** @job: Snapshot of job state */
>   	struct xe_sched_job_snapshot *job;
> -	/**
> -	 * @matched_node: The matched capture node for timedout job
> -	 * this single-node tracker works because devcoredump will always only
> -	 * produce one hw-engine capture per devcoredump event
> -	 */
> -	struct __guc_capture_parsed_output *matched_node;
>   	/** @vm: Snapshot of VM state */
>   	struct xe_vm_snapshot *vm;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 137571fae4ed..719cd089a60c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -26,6 +26,7 @@
>   #include "xe_guc_ads.h"
>   #include "xe_guc_capture.h"
>   #include "xe_guc_capture_types.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_log.h"
> @@ -53,40 +54,6 @@ struct __guc_capture_bufstate {
>   	u32 wr;
>   };
>   
> -/*
> - * struct __guc_capture_parsed_output - extracted error capture node
> - *
> - * A single unit of extracted error-capture output data grouped together
> - * at an engine-instance level. We keep these nodes in a linked list.
> - * See cachelist and outlist below.
> - */
> -struct __guc_capture_parsed_output {
> -	/*
> -	 * A single set of 3 capture lists: a global-list
> -	 * an engine-class-list and an engine-instance list.
> -	 * outlist in __guc_capture_parsed_output will keep
> -	 * a linked list of these nodes that will eventually
> -	 * be detached from outlist and attached into to
> -	 * xe_codedump in response to a context reset
> -	 */
> -	struct list_head link;
> -	bool is_partial;
> -	u32 eng_class;
> -	u32 eng_inst;
> -	u32 guc_id;
> -	u32 lrca;
> -	u32 type;
> -	bool locked;
> -	enum xe_hw_engine_snapshot_source_id source;
> -	struct gcap_reg_list_info {
> -		u32 vfid;
> -		u32 num_regs;
> -		struct guc_mmio_reg *regs;
> -	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
> -#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
> -#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
> -};
> -
>   /*
>    * Define all device tables of GuC error capture register lists
>    * NOTE:
> @@ -287,7 +254,7 @@ struct xe_guc_state_capture {
>   
>   static void
>   guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
> -					   struct __guc_capture_parsed_output *node);
> +					   struct xe_guc_capture_snapshot *node);
>   
>   static const struct __guc_mmio_reg_descr_group *
>   guc_capture_get_device_reglist(struct xe_device *xe)
> @@ -841,7 +808,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>   }
>   
>   static void
> -guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
> +guc_capture_add_node_to_list(struct xe_guc_capture_snapshot *node,
>   			     struct list_head *list)
>   {
>   	list_add(&node->link, list);
> @@ -849,7 +816,7 @@ guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
>   
>   static void
>   guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
> -				struct __guc_capture_parsed_output *node)
> +				struct xe_guc_capture_snapshot *node)
>   {
>   	guc_capture_remove_stale_matches_from_list(gc, node);
>   	guc_capture_add_node_to_list(node, &gc->outlist);
> @@ -857,17 +824,17 @@ guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
>   
>   static void
>   guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
> -				  struct __guc_capture_parsed_output *node)
> +				  struct xe_guc_capture_snapshot *node)
>   {
>   	guc_capture_add_node_to_list(node, &gc->cachelist);
>   }
>   
>   static void
>   guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
> -			      struct __guc_capture_parsed_output *n)
> +			      struct xe_guc_capture_snapshot *n)
>   {
>   	if (n) {
> -		n->locked = 0;
> +		n->locked = false;
>   		list_del(&n->link);
>   		/* put node back to cache list */
>   		guc_capture_add_node_to_cachelist(gc, n);
> @@ -876,9 +843,9 @@ guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
>   
>   static void
>   guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
> -					   struct __guc_capture_parsed_output *node)
> +					   struct xe_guc_capture_snapshot *node)
>   {
> -	struct __guc_capture_parsed_output *n, *ntmp;
> +	struct xe_guc_capture_snapshot *n, *ntmp;
>   	int guc_id = node->guc_id;
>   
>   	list_for_each_entry_safe(n, ntmp, &gc->outlist, link) {
> @@ -888,7 +855,7 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
>   }
>   
>   static void
> -guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
> +guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
>   {
>   	struct guc_mmio_reg *tmp[GUC_STATE_CAPTURE_TYPE_MAX];
>   	int i;
> @@ -935,24 +902,31 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>    *                   This node is created from a pre-allocated list of blank nodes in
>    *                   guc->capture->cachelist and populated with the error-capture
>    *                   data from GuC and then it's added into guc->capture->outlist linked
> - *                   list. This list is used for matchup and printout by xe_devcoredump_read
> - *                   and xe_engine_snapshot_print, (when user invokes the devcoredump sysfs).
> + *                   list. This node (dumped-register-lists) will be requested later by
> + *                   xe_hwe_engine_snapshot creation.
>    *
> - * GUC --> notify context reset:
> - * -----------------------------
> + * DRM Scheduler job-timeout OR GuC-notify guc-id reset:
> + * -----------------------------------------------------
>    *     --> guc_exec_queue_timedout_job
> - *                   L--> xe_devcoredump
> - *                          L--> devcoredump_snapshot
> - *                               --> xe_hw_engine_snapshot_capture
> - *                               --> xe_engine_manual_capture(For manual capture)
> + *             L--> alloc D: xe_guc_capture_snapshot_store_manual_job
> + *                           (only if "alloc C" above didn't happen)
> + *             L--> devcoredump_snapshot
> + *                      --> xe_engine_snapshot_capture_for_queue(q) ..
> + *                               --> xe_guc_capture_snapshot_get(q)
> + *                                   use "alloc C" or else "alloc D"
> + *                               --> store in xe_hw_engine_snapshot->matched_node
>    *
> - * User Sysfs / Debugfs
> - * --------------------
> - *      --> xe_devcoredump_read->
> + * User Devcoredump Sysfs
> + * ----------------------
> + *      --> xe_devcoredump_read-> (user cats devcoredump)
>    *             L--> xxx_snapshot_print
>    *                    L--> xe_engine_snapshot_print
> - *                         Print register lists values saved at
> - *                         guc->capture->outlist
> + *                           L --> xe_guc_capture_snapshot_print (for printing register
> + *                                 lists values of xe_hw_engine_snapshot->matched_node)
> + *      --> xe_devcoredump_free (user clears devcoredump)
> + *             L--> xe_devcoredump_free -> xe_devcoredump_snapshot_free
> + *                    L--> xe_hw_engine_snapshot_free
> + *                           L--> xe_guc_capture_snapshot_put(matched_node)
>    *
>    */
>   
> @@ -1067,13 +1041,13 @@ guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *
>   	return 0;
>   }
>   
> -static struct __guc_capture_parsed_output *
> +static struct xe_guc_capture_snapshot *
>   guc_capture_get_prealloc_node(struct xe_guc *guc)
>   {
> -	struct __guc_capture_parsed_output *found = NULL;
> +	struct xe_guc_capture_snapshot *found = NULL;
>   
>   	if (!list_empty(&guc->capture->cachelist)) {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>   
>   		/* get first avail node from the cache list */
>   		list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
> @@ -1081,7 +1055,7 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
>   			break;
>   		}
>   	} else {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>   
>   		/*
>   		 * traverse reversed and steal back the oldest node already
> @@ -1100,11 +1074,11 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
>   	return found;
>   }
>   
> -static struct __guc_capture_parsed_output *
> -guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
> +static struct xe_guc_capture_snapshot *
> +guc_capture_clone_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *original,
>   		       u32 keep_reglist_mask)
>   {
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>   	int i;
>   
>   	new = guc_capture_get_prealloc_node(guc);
> @@ -1146,7 +1120,7 @@ guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	struct guc_state_capture_group_header_t ghdr = {0};
>   	struct guc_state_capture_header_t hdr = {0};
> -	struct __guc_capture_parsed_output *node = NULL;
> +	struct xe_guc_capture_snapshot *node = NULL;
>   	struct guc_mmio_reg *regs = NULL;
>   	int i, numlists, numregs, ret = 0;
>   	enum guc_state_capture_type datatype;
> @@ -1439,11 +1413,11 @@ void xe_guc_capture_process(struct xe_guc *guc)
>   		__guc_capture_process_output(guc);
>   }
>   
> -static struct __guc_capture_parsed_output *
> +static struct xe_guc_capture_snapshot *
>   guc_capture_alloc_one_node(struct xe_guc *guc)
>   {
>   	struct drm_device *drm = guc_to_drm(guc);
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>   	int i;
>   
>   	new = drmm_kzalloc(drm, sizeof(*new), GFP_KERNEL);
> @@ -1468,7 +1442,7 @@ guc_capture_alloc_one_node(struct xe_guc *guc)
>   static void
>   __guc_capture_create_prealloc_nodes(struct xe_guc *guc)
>   {
> -	struct __guc_capture_parsed_output *node = NULL;
> +	struct xe_guc_capture_snapshot *node = NULL;
>   	int i;
>   
>   	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
> @@ -1565,35 +1539,18 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
>   	}
>   }
>   
> -/**
> - * xe_engine_manual_capture - Take a manual engine snapshot from engine.
> - * @hwe: Xe HW Engine.
> - * @snapshot: The engine snapshot
> - *
> - * Take engine snapshot from engine read.
> - *
> - * Returns: None
> - */
> -void
> -xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
> +static struct xe_guc_capture_snapshot *
> +guc_capture_get_manual_snapshot(struct xe_guc *guc, struct xe_hw_engine *hwe)
>   {
>   	struct xe_gt *gt = hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>   	enum guc_capture_list_class_type capture_class;
>   	const struct __guc_mmio_reg_descr_group *list;
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>   	enum guc_state_capture_type type;
> -	u16 guc_id = 0;
> -	u32 lrca = 0;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return;
>   
>   	new = guc_capture_get_prealloc_node(guc);
>   	if (!new)
> -		return;
> +		return NULL;
>   
>   	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> @@ -1627,26 +1584,87 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>   		}
>   	}
>   
> -	if (devcoredump && devcoredump->captured) {
> -		struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
> +	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
> +	new->eng_inst = hwe->instance;
>   
> -		if (ge) {
> -			guc_id = ge->guc.id;
> -			if (ge->lrc[0])
> -				lrca = ge->lrc[0]->context_desc;
> -		}
> +	return new;
> +}
> +
> +/**
> + * xe_guc_capture_snapshot_store_and_get_manual_hwe - Generate and get manual engine register dump
> + * @guc: Target GuC for manual capture
> + * @hwe: The engine instance to capture from
> + *
> + * Generate a manual GuC-Error-Capture snapshot of engine instance + engine class registers
> + * without any queue association. This capture node is not stored in outlist or cachelist,
> + * Returns: New capture node and caller must "put"
> + */
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_snapshot_store_and_get_manual_hwe(struct xe_guc *guc, struct xe_hw_engine *hwe)
> +{
> +	struct xe_guc_capture_snapshot *new;
> +
> +	new = guc_capture_get_manual_snapshot(guc, hwe);
> +	if (!new)
> +		return NULL;
> +
> +	new->guc_id = 0;
> +	new->lrca = 0;
> +	new->is_partial = 0;
> +	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
> +
> +	return new;
> +}
> +
> +/**
> + * xe_guc_capture_snapshot_store_manual_job - Generate and store a manual engine register dump
> + * @guc: Target GuC for manual capture
> + * @q: Associated xe_exec_queue to simulate a manual capture on its behalf.
> + *
> + * Generate a manual GuC-Error-Capture snapshot of engine instance + engine class registers
> + * for the engine of the given exec queue. Stores this node in internal outlist for future
> + * retrieval with the ability to match up against the same queue.
> + *
> + * Returns: None
> + */
> +void
> +xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	struct xe_guc_capture_snapshot *new;
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	if (!q) {
> +		xe_gt_warn(gt, "Manual GuC Error capture requested with invalid job\n");
> +		return;
>   	}
>   
> -	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
> -	new->eng_inst = hwe->instance;
> -	new->guc_id = guc_id;
> -	new->lrca = lrca;
> +	/* we don't support GuC-Error-Capture, including manual captures on VFs */
> +	if (IS_SRIOV_VF(guc_to_xe(guc)))
> +		return;
> +
> +	/* Find hwe for the queue */
> +	for_each_hw_engine(hwe, gt, id) {
> +		if (hwe != q->hwe)
> +			continue;
> +		break;
> +	}
> +
> +	new = guc_capture_get_manual_snapshot(guc, hwe);
> +	if (!new)
> +		return;
> +
> +	new->guc_id = q->guc->id;
> +	new->lrca = xe_lrc_ggtt_addr(q->lrc[0]);
>   	new->is_partial = 0;
> -	new->locked = 1;
> +	/* lock manual captures until devcoredump-engine puts it */
> +	new->locked = true;
>   	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
>   
>   	guc_capture_add_node_to_outlist(guc->capture, new);
> -	devcoredump->snapshot.matched_node = new;
> +
> +	return;
>   }
>   
>   static struct guc_mmio_reg *
> @@ -1667,24 +1685,16 @@ guc_capture_find_reg(struct gcap_reg_list_info *reginfo, u32 addr, u32 flags)
>   }
>   
>   static void
> -snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
> -			     u32 type, const struct __guc_mmio_reg_descr_group *list)
> +print_noderegs_by_list_order(struct xe_guc *guc, struct gcap_reg_list_info *reginfo,
> +			     const struct __guc_mmio_reg_descr_group *list, struct drm_printer *p)
>   {
> -	struct xe_gt *gt = snapshot->hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
> -	struct gcap_reg_list_info *reginfo = NULL;
> -	u32 i, last_value = 0;
> +	u32 last_value, i;
>   	bool is_ext, low32_ready = false;
>   
>   	if (!list || !list->list || list->num_regs == 0)
>   		return;
> -	XE_WARN_ON(!devcore_snapshot->matched_node);
>   
>   	is_ext = list == guc->capture->extlists;
> -	reginfo = &devcore_snapshot->matched_node->reginfo[type];
>   
>   	/*
>   	 * loop through descriptor first and find the register in the node
> @@ -1751,11 +1761,10 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   
>   			if (is_ext) {
>   				int dss, group, instance;
> -
>   				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
>   				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
> -				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
> -
> +				dss = xe_gt_mcr_steering_info_to_dss_id(guc_to_gt(guc), group,
> +									instance);
>   				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
>   			} else {
>   				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
> @@ -1774,74 +1783,65 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   }
>   
>   /**
> - * xe_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> - * @snapshot: Xe HW Engine snapshot object.
> + * xe_guc_capture_snapshot_print - Print out a the contents of a provided Guc-Err-Capture node
> + * @guc : Target GuC for operation.
> + * @node: GuC Error Capture register dump node.
>    * @p: drm_printer where it will be printed out.
>    *
> - * This function prints out a given Xe HW Engine snapshot object.
> + * This function prints out a register dump of a GuC-Err-Capture node that was retrieved
> + * earlier either by GuC-FW reporting or by manual capture depending on how the
> + * caller (typically xe_hw_engine_snapshot) was invoked and used.
>    */
> -void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +
> +void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
> +				   struct drm_printer *p)
>   {
>   	const char *grptype[GUC_STATE_CAPTURE_GROUP_TYPE_MAX] = {
>   		"full-capture",
>   		"partial-capture"
>   	};
> -	int type;
>   	const struct __guc_mmio_reg_descr_group *list;
> -	enum guc_capture_list_class_type capture_class;
> -
>   	struct xe_gt *gt;
> -	struct xe_device *xe;
> -	struct xe_devcoredump *devcoredump;
> -	struct xe_devcoredump_snapshot *devcore_snapshot;
> +	int type;
>   
> -	if (!snapshot)
> +	if (!guc)
>   		return;
> -
> -	gt = snapshot->hwe->gt;
> -	xe = gt_to_xe(gt);
> -	devcoredump = &xe->devcoredump;
> -	devcore_snapshot = &devcoredump->snapshot;
> -
> -	if (!devcore_snapshot->matched_node)
> +	gt = guc_to_gt(guc);
> +	if (!node) {
> +		xe_gt_warn(gt, "GuC Capture printing without node!\n");
>   		return;
> +	}
> +	if (!p) {
> +		xe_gt_warn(gt, "GuC Capture printing without printer!\n");
> +		return;
> +	}
>   
> -	xe_gt_assert(gt, snapshot->hwe);
> -
> -	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
> -
> -	drm_printf(p, "%s (physical), logical instance=%d\n",
> -		   snapshot->name ? snapshot->name : "",
> -		   snapshot->logical_instance);
>   	drm_printf(p, "\tCapture_source: %s\n",
> -		   devcore_snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
> +		   node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
>   		   "GuC" : "Manual");
> -	drm_printf(p, "\tCoverage: %s\n", grptype[devcore_snapshot->matched_node->is_partial]);
> -	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> -		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> -	drm_printf(p, "\tReserved: %s\n",
> -		   str_yes_no(snapshot->kernel_reserved));
> +	drm_printf(p, "\tCoverage: %s\n", grptype[node->is_partial]);
>   
>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
>   		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
> -							capture_class, false);
> -		snapshot_print_by_list_order(snapshot, p, type, list);
> +							node->eng_class, false);
> +		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
>   	}
>   
> -	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> +	if (node->eng_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> +		type = GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS;
>   		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
> -							GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -							capture_class, true);
> -		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -					     list);
> +							type, node->eng_class, true);
> +		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
>   	}
> -
>   	drm_puts(p, "\n");
>   }
>   
>   /**
> - * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the queue.
> - * @q: The exec queue object
> + * xe_guc_capture_snapshot_get - Matching GuC capture for the queue.
> + *
> + * @guc: The GuC being searched for a matching guc-error-capture snapshot.
> + * @q: The exec queue object that provides engine, guc-id and lrca to match (can be NULL!)
> + * @src: The source of the GuC-error-Capture snapshot to retrieve;
>    *
>    * Search within the capture outlist for the queue, could be used for check if
>    * GuC capture is ready for the queue.
> @@ -1849,28 +1849,31 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>    *
>    * Returns: found guc-capture node ptr else NULL
>    */
> -struct __guc_capture_parsed_output *
> -xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_snapshot_get(struct xe_guc *guc, struct xe_exec_queue *q,
> +			    enum xe_guc_capture_snapshot_source src)
>   {
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
> +	struct xe_gt *gt;
>   	struct xe_device *xe;
>   	u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
> -	struct xe_devcoredump_snapshot *ss;
>   
> -	if (!q || !q->gt)
> +	if (!guc)
>   		return NULL;
>   
> -	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +	gt = guc_to_gt(guc);
> +	if (q && q->gt != gt) {
> +		xe_gt_warn(gt, "Guc-Err-Capture being querried with incorrect queue's GT!");
>   		return NULL;
> +	}
>   
> -	ss = &xe->devcoredump.snapshot;
> -	if (ss->matched_node && ss->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC)
> -		return ss->matched_node;
> +	xe = gt_to_xe(gt);
> +	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +		return NULL;
>   
>   	/* Find hwe for the queue */
> -	for_each_hw_engine(hwe, q->gt, id) {
> +	for_each_hw_engine(hwe, gt, id) {
>   		if (hwe != q->hwe)
>   			continue;
>   		guc_class = xe_engine_class_to_guc_class(hwe->class);
> @@ -1878,8 +1881,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   	}
>   
>   	if (guc_class <= GUC_LAST_ENGINE_CLASS) {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> -		struct xe_guc *guc =  &q->gt->uc.guc;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>   		u16 guc_id = q->guc->id;
>   		u32 lrca = xe_lrc_ggtt_addr(q->lrc[0]);
>   
> @@ -1891,8 +1893,8 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
>   			if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
>   			    n->guc_id == guc_id && n->lrca == lrca &&
> -			    n->source == XE_ENGINE_CAPTURE_SOURCE_GUC) {
> -				n->locked = 1;
> +			    n->source == src) {
> +				n->locked = true;
>   				return n;
>   			}
>   		}
> @@ -1900,77 +1902,19 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   	return NULL;
>   }
>   
> -/**
> - * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
> - * @q: The exec queue object
> - *
> - * Take snapshot of associated HW Engine
> - *
> - * Returns: None.
> - */
> -void
> -xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
> -{
> -	struct xe_device *xe = gt_to_xe(q->gt);
> -	struct xe_devcoredump *coredump = &xe->devcoredump;
> -	struct xe_hw_engine *hwe;
> -	enum xe_hw_engine_id id;
> -	u32 adj_logical_mask = q->logical_mask;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return;
> -
> -	for_each_hw_engine(hwe, q->gt, id) {
> -		if (hwe->class != q->hwe->class ||
> -		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> -			coredump->snapshot.hwe[id] = NULL;
> -			continue;
> -		}
> -
> -		if (!coredump->snapshot.hwe[id]) {
> -			coredump->snapshot.hwe[id] =
> -				xe_hw_engine_snapshot_capture(hwe, q);
> -		} else {
> -			struct __guc_capture_parsed_output *new;
> -
> -			new = xe_guc_capture_get_matching_and_lock(q);
> -			if (new) {
> -				struct xe_guc *guc =  &q->gt->uc.guc;
> -
> -				/*
> -				 * If we are in here, it means we found a fresh
> -				 * GuC-err-capture node for this engine after
> -				 * previously failing to find a match in the
> -				 * early part of guc_exec_queue_timedout_job.
> -				 * Thus we must free the manually captured node
> -				 */
> -				guc_capture_free_outlist_node(guc->capture,
> -							      coredump->snapshot.matched_node);
> -				coredump->snapshot.matched_node = new;
> -			}
> -		}
> -
> -		break;
> -	}
> -}
> -
>   /*
> - * xe_guc_capture_put_matched_nodes - Cleanup macthed nodes
> + * xe_guc_capture_snapshot_put - Release GuC Capture matched node from a prior snapshot_get
>    * @guc: The GuC object
> + * @node: The node to release back to GuC
>    *
>    * Free matched node and all nodes with the equal guc_id from
>    * GuC captured outlist
>    */
> -void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
> +void xe_guc_capture_snapshot_put(struct xe_guc *guc, struct xe_guc_capture_snapshot *n)
>   {
> -	struct xe_device *xe = guc_to_xe(guc);
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct __guc_capture_parsed_output *n = devcoredump->snapshot.matched_node;
> -
>   	if (n) {
>   		guc_capture_remove_stale_matches_from_list(guc->capture, n);
>   		guc_capture_free_outlist_node(guc->capture, n);
> -		devcoredump->snapshot.matched_node = NULL;
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 20a078dc4b85..e85af277be9c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -11,10 +11,7 @@
>   #include "xe_guc.h"
>   #include "xe_guc_fwif.h"
>   
> -struct xe_exec_queue;
>   struct xe_guc;
> -struct xe_hw_engine;
> -struct xe_hw_engine_snapshot;
>   
>   static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
>   {
> @@ -44,18 +41,13 @@ void xe_guc_capture_process(struct xe_guc *guc);
>   int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type,
>   			   enum guc_capture_list_class_type capture_class, void **outptr);
>   int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
> -			       enum guc_capture_list_class_type capture_class, size_t *size);
> +				   enum guc_capture_list_class_type capture_class, size_t *size);
>   int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
>   size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
>   const struct __guc_mmio_reg_descr_group *
>   xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>   				 enum guc_capture_list_class_type capture_class, bool is_ext);
> -struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
> -void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
> -void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
> -void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_guc_capture_steered_list_init(struct xe_guc *guc);
> -void xe_guc_capture_put_matched_nodes(struct xe_guc *guc);
>   int xe_guc_capture_init(struct xe_guc *guc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> new file mode 100644
> index 000000000000..76159cb8fcab
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
> +#define _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
> +
> +#include <linux/types.h>
> +#include <abi/guc_capture_abi.h>
> +#include "xe_guc_fwif.h"
> +
> +struct drm_printer;
> +struct guc_mmio_reg;
> +struct xe_guc;
> +struct xe_exec_queue;
> +struct xe_hw_engine;
> +
> +enum xe_guc_capture_snapshot_source {
> +	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
> +	XE_ENGINE_CAPTURE_SOURCE_GUC
> +};
> +
> +/*
> + * struct xe_guc_capture_snapshot - extracted error capture node
> + *
> + * A single unit of extracted error-capture output data grouped together
> + * at an engine-instance level. We keep these nodes in a linked list.
> + * See cachelist and outlist below.
> + */
> +struct xe_guc_capture_snapshot {
> +	/*
> +	 * A single set of 3 capture lists: a global-list
> +	 * an engine-class-list and an engine-instance list.
> +	 * outlist in __guc_capture_parsed_output will keep
> +	 * a linked list of these nodes that will eventually
> +	 * be detached from outlist and attached into to
> +	 * xe_codedump in response to a context reset
> +	 */
> +	struct list_head link;
> +	bool is_partial;
> +	u32 eng_class;
> +	u32 eng_inst;
> +	u32 guc_id;
> +	u32 lrca;
> +	u32 type;
> +	bool locked;
> +	enum xe_guc_capture_snapshot_source source;
> +	struct gcap_reg_list_info {
> +		u32 vfid;
> +		u32 num_regs;
> +		struct guc_mmio_reg *regs;
> +	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
> +#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
> +#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
> +};
> +
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_snapshot_get(struct xe_guc *guc, struct xe_exec_queue *q,
> +			    enum xe_guc_capture_snapshot_source src);
> +void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
> +				   struct drm_printer *p);
> +void xe_guc_capture_snapshot_put(struct xe_guc *guc, struct xe_guc_capture_snapshot *snapshot);
> +void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_snapshot_store_and_get_manual_hwe(struct xe_guc *guc, struct xe_hw_engine *hwe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9c36329fe857..b2395a645b8d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -28,6 +28,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc.h"
>   #include "xe_guc_capture.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_id_mgr.h"
> @@ -1037,7 +1038,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	const char *process_name = "no process";
> -	struct xe_device *xe = guc_to_xe(guc);
>   	unsigned int fw_ref;
>   	int err = -ETIME;
>   	pid_t pid = -1;
> @@ -1066,18 +1066,23 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		exec_queue_destroyed(q);
>   
>   	/*
> -	 * If devcoredump not captured and GuC capture for the job is not ready
> -	 * do manual capture first and decide later if we need to use it
> +	 * If the queue has't been killed yet or we do not have a firmware-reported
> +	 * GuC-Error-Capture node for the matching job, request GuC-Error-Capture to
> +	 * store a manual capture within its internal list with a job-match.
> +	 * xe_hw_engine_snapshot will decide later if it's needed.
>   	 */
> -	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> -	    !xe_guc_capture_get_matching_and_lock(q)) {
> +	if (!exec_queue_killed(q) && !guc_to_xe(guc)->devcoredump.captured &&
> +	    !xe_guc_capture_snapshot_get(guc, q, XE_ENGINE_CAPTURE_SOURCE_GUC)) {
>   		/* take force wake before engine register manual capture */
>   		fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>   		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
> -
> -		xe_engine_snapshot_capture_for_queue(q);
> -
> +		/*
> +		 * This will generate a manual capture node and store it in
> +		 * This GuC Error Capture link-list as if it came from GuC
> +		 * but with a source-id == manual-capture
> +		 */
> +		xe_guc_capture_snapshot_store_manual_job(guc, q);
>   		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c4b0dc3be39c..ddd91627e623 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -24,7 +24,8 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_topology.h"
> -#include "xe_guc_capture.h"
> +//#include "xe_guc_capture.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hw_fence.h"
>   #include "xe_irq.h"
> @@ -827,9 +828,9 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>   }
>   
>   /**
> - * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> + * hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>    * @hwe: Xe HW Engine.
> - * @q: The exec queue object.
> + * @q: The exec queue object. (can be NULL for debugfs engine-register dump)
>    *
>    * This can be printed out in a later stage like during dev_coredump
>    * analysis.
> @@ -837,11 +838,12 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>    * Returns: a Xe HW Engine snapshot object that must be freed by the
>    * caller, using `xe_hw_engine_snapshot_free`.
>    */
> -struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
> +static struct xe_hw_engine_snapshot *
> +hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
> -	struct __guc_capture_parsed_output *node;
> +	struct xe_guc_capture_snapshot *manual_node;
> +	struct xe_guc *guc;
>   
>   	if (!xe_hw_engine_is_valid(hwe))
>   		return NULL;
> @@ -865,25 +867,66 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   		return snapshot;
>   
>   	if (q) {
> -		/* If got guc capture, set source to GuC */
> -		node = xe_guc_capture_get_matching_and_lock(q);
> -		if (node) {
> -			struct xe_device *xe = gt_to_xe(hwe->gt);
> -			struct xe_devcoredump *coredump = &xe->devcoredump;
> -
> -			coredump->snapshot.matched_node = node;
> -			xe_gt_dbg(hwe->gt, "Found and locked GuC-err-capture node");
> -			return snapshot;
> +		guc = &q->gt->uc.guc;
> +		/* First find the pre-kill manual GuC-Err-Capture node for this job */
> +		manual_node = xe_guc_capture_snapshot_get(guc, q,
> +							  XE_ENGINE_CAPTURE_SOURCE_MANUAL);
> +
> +		/* Next, look for the GuC-Firmware reported node for this job */
> +		snapshot->matched_node = xe_guc_capture_snapshot_get(guc, q,
> +								     XE_ENGINE_CAPTURE_SOURCE_GUC);
> +		if (!snapshot->matched_node) {
> +			xe_gt_dbg(hwe->gt, "Can't find GUC-Sourced err-capture node");
> +			snapshot->matched_node = manual_node;
> +		} else if (manual_node) {
> +			/* looks like we don't need the manually-captured node, return it */
> +			xe_guc_capture_snapshot_put(guc, manual_node);
>   		}
>   	}
>   
> -	/* otherwise, do manual capture */
> -	xe_engine_manual_capture(hwe, snapshot);
> -	xe_gt_dbg(hwe->gt, "Proceeding with manual engine snapshot");
> +	if (!snapshot->matched_node) {
> +		guc = &hwe->gt->uc.guc;
> +		/*
> +		 * Fallback path - do an immediate jobless manual engine capture.
> +		 * This will happen when debugfs is triggered to force an engine dump.
> +		 */
> +		snapshot->matched_node = xe_guc_capture_snapshot_store_and_get_manual_hwe(guc, hwe);
> +		xe_gt_dbg(hwe->gt, "Fallback to jobless-manual-err-capture node");
> +	}
>   
>   	return snapshot;
>   }
>   
> +/**
> + * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
> + * @q: The exec queue object
> + *
> + * Take snapshot of associated HW Engine
> + *
> + * Returns: None.
> + */
> +void
> +xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
> +{
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	u32 adj_logical_mask = q->logical_mask;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	for_each_hw_engine(hwe, q->gt, id) {
> +		if (hwe->class != q->hwe->class ||
> +		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> +			coredump->snapshot.hwe[id] = NULL;
> +			continue;
> +		}
> +		coredump->snapshot.hwe[id] = hw_engine_snapshot_capture(hwe, q);
> +	}
> +}
> +
>   /**
>    * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
>    * @snapshot: Xe HW Engine snapshot object.
> @@ -898,17 +941,41 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>   		return;
>   
>   	gt = snapshot->hwe->gt;
> -	/*
> -	 * xe_guc_capture_put_matched_nodes is called here and from
> -	 * xe_devcoredump_snapshot_free, to cover the 2 calling paths
> -	 * of hw_engines - debugfs and devcoredump free.
> -	 */
> -	xe_guc_capture_put_matched_nodes(&gt->uc.guc);
> +	xe_guc_capture_snapshot_put(&gt->uc.guc, snapshot->matched_node);
> +	snapshot->matched_node = NULL;
>   
>   	kfree(snapshot->name);
>   	kfree(snapshot);
>   }
>   
> +/**
> + * xe_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given Xe HW Engine snapshot object.
> + */
> +void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +{
> +	struct xe_gt *gt;
> +
> +	if (!snapshot)
> +		return;
> +
> +	gt = snapshot->hwe->gt;
> +
> +	drm_printf(p, "%s (physical), logical instance=%d\n",
> +		   snapshot->name ? snapshot->name : "",
> +		   snapshot->logical_instance);
> +	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> +		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> +	drm_printf(p, "\tReserved: %s\n",
> +		   str_yes_no(snapshot->kernel_reserved));
> +	drm_puts(p, "\n");
> +
> +	xe_guc_capture_snapshot_print(&gt->uc.guc, snapshot->matched_node, p);
> +}
> +
>   /**
>    * xe_hw_engine_print - Xe HW Engine Print.
>    * @hwe: Hardware Engine.
> @@ -920,7 +987,7 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
>   
> -	snapshot = xe_hw_engine_snapshot_capture(hwe, NULL);
> +	snapshot = hw_engine_snapshot_capture(hwe, NULL);
>   	xe_engine_snapshot_print(snapshot, p);
>   	xe_hw_engine_snapshot_free(snapshot);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 6b5f9fa2a594..845153fbc149 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -55,9 +55,9 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>   void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>   u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>   				enum xe_engine_class engine_class);
> -struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
> +void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
> +void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
>   void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>   void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index e14bee95e364..ea6b60c819d4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -152,11 +152,7 @@ struct xe_hw_engine {
>   	struct xe_hw_engine_group *hw_engine_group;
>   };
>   
> -enum xe_hw_engine_snapshot_source_id {
> -	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
> -	XE_ENGINE_CAPTURE_SOURCE_GUC
> -};
> -
> +struct xe_guc_capture_snapshot;
>   /**
>    * struct xe_hw_engine_snapshot - Hardware engine snapshot
>    *
> @@ -180,6 +176,13 @@ struct xe_hw_engine_snapshot {
>   	u32 mmio_base;
>   	/** @kernel_reserved: Engine reserved, can't be used by userspace */
>   	bool kernel_reserved;
> +	/**
> +	 * @matched_node: GuC Capture snapshot:
> +	 * The matched capture node for the timedout job
> +	 * this single-node tracker works because devcoredump will always only
> +	 * produce one hw-engine capture per devcoredump event
> +	 */
> +	struct xe_guc_capture_snapshot *matched_node;
>   };
>   
>   #endif

