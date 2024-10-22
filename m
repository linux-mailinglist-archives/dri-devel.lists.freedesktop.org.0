Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D79B9A9818
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 07:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013BF10E5D9;
	Tue, 22 Oct 2024 05:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsNLCYqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A27E10E2E9;
 Tue, 22 Oct 2024 05:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729573596; x=1761109596;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HdGTPVluRRqJ/z6TBkPaaq2ozmi3d4hH9ERV2KetkFg=;
 b=QsNLCYqk2vYnWF3Z0n7UpZx5Asa/+Sbi7ah/0qEiRrgw15lus0PLWapj
 XrFU+JUqQV5aLLsBe1OSOCAJuVU1yzb6C21/SqTRx1kIry0uvO65dXEUz
 fSe0UEV+jaP663Q1stHCut013Dl1hG3fwnWrv9yJOzyYjAIdP4B6XBEMY
 T7BiW9hIwVmxbIpnmKnIfRtKCFh5R6qqJuDUFTJ1tii/TSoyEE3/xrr9W
 kP0at5o7oh2+uZZ84t57cHK7N89tzez2saV88g464LMOjo2QeW6f1ymkN
 b1DwqUpdhoOjDe5bdXp5Jp3U8hAtvbRjCedQgvbQyPRj84UM+rWbco9n5 g==;
X-CSE-ConnectionGUID: Ebk2Iq/uQ82lVJatI5W50Q==
X-CSE-MsgGUID: im/zgBzoQVKVxClkLXjqgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28963751"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28963751"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 22:06:36 -0700
X-CSE-ConnectionGUID: 44nI6cKKQ+6uZwQlTYVhVQ==
X-CSE-MsgGUID: gTAvAx0yR62qVKpEQ7wB8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="84816031"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 22:06:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 22:06:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 22:06:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 22:06:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEgnUK7EeQiOUuYJiBN3yroGVbyegZSlr2Z7aO8clin4g4mERnIhZYwuzZbCtddT69Hpd+WsuJ+C59ih82m5Aw76/TaPjF8Z8xbRG5CXaQG+I573gq7vr7tHVO6l2ADiLv25S6ajNCw9uwipcIyLTYcTaY40kHeQ2ujzzsuZB08kIbnc/L04nBzmw2Oyss2373KvwED0hmyvOLzTJhvpU/TcjhSZb89uwRPfhVDqinqbbVyq/Rcp1bHDbcwmFHyxStSmUu/I/UUdvtK2twa7JZpKVeWtckBFrLYOe/eMWWaq1B6LB9jIh45NtKhDn0dnjgHhkJzFABATah0+FcfCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBT74gvZoAsBmFWiVw/AiUO+8yZfHEbYUEAaDH+UFHU=;
 b=EK3/wiwKH/33EPdGG83F1wt5jh4Yi80bGbV96TFecc5MOh3Ah1s8OOgvagjprCH9umoF+TmSnYkZfYvFmctY2e2AQBeui0cMM1GuHwU7wi80jP03dg5QhQpykNVolThk7Bci+uoyUPEHj19ZbHEMnnM4dl6go8yRtfMkCWLdWzZ28AfbC4PGM1nIQvylKqNMGneW+feeR/VL/dwMk6PsljEf2MSqlyF6tKkk05/OMg0RGYOOD5NMt5gC18pSpOg9ZN+eh9V4Unc2MMaHCz1I0TkHCwOkPzN2965SfWRAXA1cVb6BjiT9rZu6RerCjqlCsjbmeZsgQAecZ2uTt0MA1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 05:06:31 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 05:06:31 +0000
Message-ID: <bcbf8d2c-c781-4597-8fb2-8763b8514519@intel.com>
Date: Tue, 22 Oct 2024 10:36:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <dakr@kernel.org>, <pstanner@redhat.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-4-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241021175705.1584521-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::22) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: d31f5352-74e2-4963-86c8-08dcf2574ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDdia2lWemNabWRCZFcvTlNBUVAyeFlsR2hVdG9qa1Ftb3VrZGpzOVRWTHV5?=
 =?utf-8?B?RnJqTFBHcU45MVdjQ1FnYWt4NlVLeVZmSWdOdXZ5K1BzS2t3NGZKYm90cFF4?=
 =?utf-8?B?N0FIVStzNzRZRW95VlRseDhTRHZESTliM2M2dU1tMlBpWTZaU21Md25yTmVO?=
 =?utf-8?B?TFhtWkhBcHlHdWp4U0tXdXNKVkhyUzQrdmpxaHhlWVFvdW0weWNZeENjRVZD?=
 =?utf-8?B?cDVudzVNRW5nbENGN0g3RnV1QWxQSkxwY2JKMUlXb01yTzdVMGVKUlpHOGVB?=
 =?utf-8?B?SjEzWVNXVjBlSUJpa0hRcGE4eEE2T0Rnb28yZnZxdGJhaFgwaSs1SDVsc0Zw?=
 =?utf-8?B?elNHU1k2ODQ4TkdrQ05OYS9hckF2dmRieTVSV3R1amtFa1B6bTQvQ3NzUmhv?=
 =?utf-8?B?V2lLQjJxbG9zU3ZGTzkzODNwSzlhaTBLVmNTQ09RTHZiUzZoS2xnOEJhSHFP?=
 =?utf-8?B?VXBPdWdiRkw4Q2dEVTFhRzhCWFRVYk1YUG14WkxNM284UFBHL09NVEo0TE8v?=
 =?utf-8?B?d0NJNlp0ekRUdWltcVhvZ2NlZ1IreHRWVFRJT1NLZkI3eEJlbDliQ3JUV0Zk?=
 =?utf-8?B?dEdBYTRWZXl0ZmZiL3RpR1RRUFNYWUplQXVaNnAvNUQ0bVVFaVRHQjhMTGgw?=
 =?utf-8?B?WkszbzJFZVArMWRjZkx1TGFDSlk0SURVWVp4NzJiUEZTY2s1YmVOZUhCVERW?=
 =?utf-8?B?QS9kTjB5SlRrNm1YUStqMXdvOEhING5jMm5nYmQ5TmJzUU8va21BaTc0L1dp?=
 =?utf-8?B?MHBlWENpSjY3dGVadjlBWncxYXg2SUhlLzUzVS9GZ3ZHV25FUHBpa1N4bWJL?=
 =?utf-8?B?dXEzeU9Lc01kSzJMNkdKOXkvQkZ1M0toTWpkdk5Vd2o2aEV6ZzFFNDFwbUpa?=
 =?utf-8?B?U1pZZlA2UEtwZUR6ZFY0T1Vyenc2dnphR3hJM2lDY2EvWGw0RmZvNkwxQ3Ay?=
 =?utf-8?B?SksvUmFOZC9JU3Z6TkdpL0ZWckhOS3lFQ1ZjT1pwUi9IemEvdjBWalM0UzQx?=
 =?utf-8?B?V3ZJbXFIaTRDUjkzbkpIdTZ1MmErUURsWFpabE91OTBwMyszdHJhV0FEUXVr?=
 =?utf-8?B?Uk1PS3RXc1NYY2x5eThTdUFqTEhlaVhrSTB3WVdJSFppRWdqdGJDNno5dU4w?=
 =?utf-8?B?VVNCcnZpU3BERWlOeWtkanBZek5oK0ZXa1BsRkxaZ1NvTldnM21HSEd1c3dS?=
 =?utf-8?B?MkkzQW9qckJoSjVLUjk5Mm9kRzNUcjlFeHhyb3R3aitKc3E4aHhKVk5iTjZB?=
 =?utf-8?B?RTYzMEVsbkpxemxBOWJuOUhaREhTUGFFSTl3SVpjTS9qSExDTnd0Y2VVWlN4?=
 =?utf-8?B?c1djQ2tVUDBYYUxrTTREaFJ1bCtBV1VWNE1aS0xEbkRNTjA4eDlXUUVuT1ZP?=
 =?utf-8?B?emwyVmVkaURNcWY3OFpzRHBOalVFN3FBUmxSekd2M3NpR3dKdUkzemNNVWNi?=
 =?utf-8?B?alA2MHlHTnMzMmNnbUcxeFFPOFprVlJFa0xGSmYxQ3U4QnhkQ05seTRiaUhT?=
 =?utf-8?B?ZHpLMS94WitURmxpZG02QzdaZWFQU1BHeGZyc244Y01Ia2NZMHdwUjk1SWly?=
 =?utf-8?B?OEh0TS9JMUFlNjR0dlRsSFNXWWtBNXpqd0krQjBRT3FyUjB4N3dUcXdyVTN1?=
 =?utf-8?B?ZHIzWkhiYXlkckU2VXRTeWVSYkFCNUQ0LytjaW1yaHhmQmV6U3hqYmZMYXYx?=
 =?utf-8?B?M1grSDB5YlpieVlOdVEveHVRTWM4Y1F5S3FkemNrcWNLSldWdUd1MktLYlFH?=
 =?utf-8?Q?RJdmC+rhxw2T4xElqeGao436h1EhMIxlDNRL2on?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1pNa0thRnpYczRtSFQzMGw4YnlmZ2ZNU05HT0JCMGVTNEFaOUhlMDNkU0dQ?=
 =?utf-8?B?bUZWcU9keUdXUDB0b1lIL0g5ZjloMmxXMUwyY3FpSGk2Nno1VHJXeC9NUUdv?=
 =?utf-8?B?VkNUZ1llOVlKYk44c3BkVjhVRUtTc2ZrUjI3bXMxTzlzZzN5Yk9HLzc2VXZ4?=
 =?utf-8?B?M3ZDTFpPQXNYWElLN1BpSit2b0ZKNHc0OTlEL1F4YlpNMHkrUWZWNFVEMjg4?=
 =?utf-8?B?TGJ5SzJYcmN5WG55anVTNWNzQTE3cDlvQW5ZNytORjU1K3ZOZThCOWc2MkZi?=
 =?utf-8?B?M1M0UTY4dVNJMjJrejRXeUkrdDlsWSszS2RtSlIyelhGMkdieFpkRG5oTmJ5?=
 =?utf-8?B?dDI0TDNaOEUxZ3MrdCtDMzBmWHJzS1ErQXR0ZTB1MTROb0ZBSTJhTWxIc1Q4?=
 =?utf-8?B?bm9PdkFIT1c3dURZU1JEeHpVejlVY3pkYThlYTRvYzJuNXVaT01rTUxQaTQ4?=
 =?utf-8?B?dy9nd1ludDlYMUZ1SDRvNzBjZmF5K1cxcjJFVmdMNTFyblBaS244S2JkZVBQ?=
 =?utf-8?B?TGVIR3ZINkgzWDAzeGJwKzUyR0FsQndUbnBhYzZlN29aZVNOd1pnbUQrclJB?=
 =?utf-8?B?d0dnUktxUW9qZ2lMNWNtcFdkbmo4eVFHckR1OE5tMlFHaC91bjMzeFQvZVVT?=
 =?utf-8?B?U0dNb3l1UkZsMVBtRkNjb1ljb0RwN0pFWWFZTkpvVzY1K3RZRlRYUnhzc1JH?=
 =?utf-8?B?SHVQM1FOenkxVGR2SW9MQ2ZEenNGZEVQaDFac1V4NGlaT3V4TURJWnh3RUZ6?=
 =?utf-8?B?bmRyeVVCeHlPVEJBZ2ptOGt3c0NTeitWRFRjMnpFYTQwbXNJbE9tRzFFcWZY?=
 =?utf-8?B?dEJWa1JEbDc2cHVHOTJ1dlBpQmJxOXA4VEhpdTBqalU5bVdZK2VJb08zNG50?=
 =?utf-8?B?ZXV5cTY0b2xzSHVQYXh6K2pFRzBEUnZEWE10WGRveWJNN1R2TnFWRjBRSjdV?=
 =?utf-8?B?dmxNT0U2VjhRTTg5TUF6ZVRMbWFoNmpmbXZicGNmeWZRVW1zbjM5Tm03TVk3?=
 =?utf-8?B?OFFqQjR5aTQzTUgzeEJ6L0thK2hDQTBWK3d5WStUWlhleHY3MllETUFmUWpG?=
 =?utf-8?B?cGVwcjFrVTBDbUQ5OW5GdHBRM1hQZTNvaWRUbXU4b3FSdlNvSzY2NVc1bmJP?=
 =?utf-8?B?OURJS1QzNTJNYXBvZnVoQ0VsM0dUYldpbXBKSDl6QWEyaE5DUkszVitJSlhQ?=
 =?utf-8?B?cGgvN0owK25nNm1lMS9tRWozTTVnSEdFQWZIaUE2eE51OHlBSzZ6MXhqN2ZS?=
 =?utf-8?B?OFlVWHNnZGZwaHBvaDByRHpBbEJIQVM2Z1U2L0haRloxckNvTGVRMDJmT0w1?=
 =?utf-8?B?WWsyK0tOYWNkYkZGcEJPeEtDY20zNXF1WXl6L1RjMFZ4WWJpVmRYa0Fvem9z?=
 =?utf-8?B?WmJ1RDhWZm9MWFN2dS9zQTVpcW5iWTRTYUFWZC9adHQzU0FhRmR2V0lmaStF?=
 =?utf-8?B?TWF6dERKS1Z0eEsvV0lyVFltTmpjR1ZuOGNFYTB2ekRWa2d3UjRPNjFiMlhz?=
 =?utf-8?B?c2syQUhPdG95ZDRjNE5UL09hTGF6MDhZS2RvWFhxekJycUJDZ3VYVVR2RURh?=
 =?utf-8?B?ZW1DazhDMXRjeEtaQlYvcmJKdktaV0REWlVOZXhwYVlXM21rY2psK2xGcnFp?=
 =?utf-8?B?cWNoNFB4MXQzS2ZMZDhSeFN5VGx3OFF1Z0V1RmNNREdsNmVvaURyQ3gzVTJM?=
 =?utf-8?B?aXhyVmxOSExKTG9qcGZnaG1HMjF1NFo0ZkttZENqYTRscWNJNUwvT3RQN1RS?=
 =?utf-8?B?WG5Xa0FiSFp4RXRVcHczUGxzTm5OOTRCb0ZQUTI1WDlmTU41eVM1RFNEMWV6?=
 =?utf-8?B?M3AyNExJY1VTcGxPd05jZ1RFUE50aFpMY2djZk1rZ1BGb2hqbkMwclBhRzUz?=
 =?utf-8?B?d2hQQ09ROWlkVVlTM0h5L1RWRVJRb1U1RjFUSG1LK0FQRXBIcHlNRTZRTXJX?=
 =?utf-8?B?OFRvbGM3bkF5Rk0vVWhFUFFBZ1I4U0REbGxBYjR5UFp5d0VJeDYzZ0Q5dCs0?=
 =?utf-8?B?bGxubDdpaTNwWEtIWWtETGJVTWFBUnNtN3dIVElZVFhKcVRnK0F6WkxEbGlY?=
 =?utf-8?B?djJIOEdhWm1saUtjRGJmV3NxZitKMFlFYTFDQktVUFFJaXNSWTIrZVhzajJV?=
 =?utf-8?B?SlFhQUpqSy9HNTR4RytSV0FVNXdTL2NnVEErVUxzdUx5NnpGdzMwdEJKbzdt?=
 =?utf-8?Q?ZaUOIPkXVBxFTtILhZQpq9Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d31f5352-74e2-4963-86c8-08dcf2574ad4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 05:06:31.4006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIJlJZLi1rmkzc01wz/2s+yCK0rTYxj7tJ5F9E3nvaUBSO9tWD2GOTPdoVDLKXc1LBlnH6ASz9DIy1rV/qda8MSx8MnAr1bUoVI4o2IB/TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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



On 21-10-2024 23:27, Matthew Brost wrote:
> G2H work queue can be used to free memory thus we should allow this work
> queue to run during reclaim. Mark with G2H work queue with
> WQ_MEM_RECLAIM appropriately.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c260d8840990..1b5d8fb1033a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -213,7 +213,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>   
>   	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
>   
> -	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", 0);
> +	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   	if (!ct->g2h_wq)
>   		return -ENOMEM;
>   

