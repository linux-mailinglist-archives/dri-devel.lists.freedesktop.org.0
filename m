Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59E4CAC47
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A38210ED31;
	Wed,  2 Mar 2022 17:40:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B338210ED31;
 Wed,  2 Mar 2022 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646242855; x=1677778855;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N88lF1gNA11yMn5OEC2WDNCOlQhbPRrydlTpB4bgwlE=;
 b=iEL0uzPG6EKkAaI0KI5kOqVb8nY4MgVeUqMX4qloI3V8QmRwH6k937ng
 ml8c/NnjSR599gJhGIoQz2JPyiOD2sbHQGLKJUiNUfhQXGnuHkQoABX31
 xVD8Y6Hfpiu/euc7Z3xoIXt1cdpg/x3liCy3iYAmciSk4ZsAU8xOkhsw8
 9vovJIDlROA5nXylJYjMxmOP1TWnlmWf2l8pouV/NvfWHHH0l6JjO+eC0
 kGX10fIUGj6LqQLlgfyWi8IQ60uuX2vbD6/nkEzjrhKTa3hWZtP7OsYoK
 fE0/zYc8tqJn8Ctpl5XJxbXj2OCxAi/QH93Q16JUil66GiJSW76zzckBh A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="236973344"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="236973344"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 09:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="594082876"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2022 09:40:29 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 09:40:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 09:40:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 2 Mar 2022 09:40:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3gaJymrwE3S9tavIIs/258MRTMeEBcdCSiFAh1qiRBowblV3PMRWLoRtLrT5c5S2fOrTDXRqgJ/fEZnn8UjkyPOhzg+cW9Jf442S6cmPhyIL6qmjH7ITX5r4Sy/I7HHHTy6M24rkDpGHVACv1J1y4C2qRIeC7munP1f+sIan2JlWuiSHOLz24WSxS3ZvaR+LkWPwfxF8nCs6sncKYv9QlHntkBlutA/Hn0n+JHHHp46rX7biexI5rtoI3nv/TljYXCLZ8ydhmCPVt2Ybr27Qa0+L/vAle4hvuXRl+xdT1b2SlpLYAAHM6B0pv3+kPCG5DL8IqCtRU4O78Sa8FO0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsEYqhrsDLSY4KoTQF8qBwTyJYPeT4m+/Snj2oUEphk=;
 b=kjpm/T9PVXqbDtgXoUuwM7+w73uJ/Io4KjYS2oe/ZUOclTLEy9P2x3WYPTT0CBHmqs5ABjiJn+UoAJuf2hkPJp9UYTeAk42DzcgMJYfh0GsWS8pAeyp3am6zgCF9ko9AyeTugZyN4o9BFSPpAWcx4RYIdubIHqSOOWv5RjpPi190cVhrC5buh2NpB/2K1HBxnV5lj8mWNe6DVwdpapFIT4SGrHUG4ztsHDJ2VWDyVQ9u0isLMvVyct7ImERvZWLuFaJydOFzDdSh6ovwQGTevj7CPNUTQr7BxOpJimcfou+bSaqkhaiwkcserfUp+XtN8ci7APn8///iQXDnnD8VsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB2793.namprd11.prod.outlook.com (2603:10b6:5:c0::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 17:40:26 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 17:40:26 +0000
Message-ID: <caff0c55-c1f2-41c0-4a8e-32737c096547@intel.com>
Date: Wed, 2 Mar 2022 09:40:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 0/3] Improve anti-pre-emption w/a for compute
 workloads
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
 <7ceb4723-7ebf-3762-ddb7-b16e48e804d3@intel.com>
 <ccc8d37f-2bcc-b258-4969-430c609c11d0@linux.intel.com>
 <6526515c-a4d1-1815-3ee8-6a35dfa5036f@intel.com>
 <e3abab20-084a-146b-8c6f-274474aa7bc1@linux.intel.com>
 <bb8d25fa-4b6f-0c53-302a-623787760bcd@intel.com>
 <720fe7f8-a712-c755-9fbe-70ac2fa008f6@linux.intel.com>
 <72ebab5f-1023-b590-f5a7-f5db2333e925@intel.com>
 <34273e9e-8473-d95e-fdc0-47ca9e7ac8cb@linux.intel.com>
 <09969620-129e-f032-2f12-0d1adf537e6e@intel.com>
 <fe10779e-db98-4d84-3d12-d4260f28a3c8@linux.intel.com>
 <77cbfff9-cf7b-2c23-d0e0-1b3b49987bf9@intel.com>
 <0bbad457-5fcb-5cc9-8ca6-260c5855554c@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <0bbad457-5fcb-5cc9-8ca6-260c5855554c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:303:8c::10) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7be739df-f361-4218-f50f-08d9fc73bc46
X-MS-TrafficTypeDiagnostic: DM6PR11MB2793:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB2793C330CF693DD2E75E3235BD039@DM6PR11MB2793.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ijz7rmOoFx7Hbttrlj5Ygc4ABUb0hVgEY5E/0C6JEL+Cckr2s9HApeVcRFihz8PvQx4pQIhcaKhqEconQQ1N8jk5QLjrSAHPr7WEileHE36m9Vj8OAez1apvFh5SXhR5o7H03sc78qNZJdG2v4tB5f25w4KAUYJtNCI93EoE8zOICFDwwedy3stzdLMKbmyVX5640sgolzAPoxUzSgSfwcxSD26yO9Mqe21yE/2cyOE7fYzzKgrvfhf5qUxTwIaMdv2Tjgn6qWEUg7LftDWHV7tzx9oLrfZWvV5MxdG7xQqKpuHqxhnfUt/nBxTPgv90kxm6zORrW2qYnuOgZn6IxU8BCTz3r6uc4DU3MckSakeKgQ4OBRaQs3XanwAbZgnYgGtEf9mmpVR1MwynnkjBscxa+3kyRPwbZIlCGkwQxXWZ9QYstGA8NYwiXLQelzsqMNcC/Qq77iGR+c1v7aDah7gEo4knuZ+JXxcV14Io5oSaQe6/2qSidiK+A742VgYRkl3z3vEqzbzG/cEP57EFERhK3uqNk7yyUFVkZIGGaM1dxku97x+ddJPOc+iJKNaOAc3ZPNXUKmXI9XB6IYoRu6yTufSOiYqeDMm+MW7deVdHwHykN6ubDp5q3Do/wDTOMLxcDV5h5Dtn53k7GgXBAzsb0tjG04OSF9xkwLh7UqRBV0jPdpZVOCFLuy0vV5nemiReRL/x/e5hyLRuW/FzyeaaKnA8pBdLxm+EOdHMlbXffy+dxUMm3RGJpD8u4BEPpM07gkHCbhMgkUoZ20qSNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(30864003)(36756003)(6506007)(66476007)(2906002)(5660300002)(66556008)(66946007)(31686004)(8936002)(186003)(83380400001)(2616005)(26005)(6486002)(508600001)(6512007)(82960400001)(38100700002)(53546011)(4326008)(86362001)(6666004)(316002)(31696002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzJtdFJFTVBhVkdlU3luMTNRQ05TQkVvZXk1OE1BRW15NmhmQ1RPbWwySUJP?=
 =?utf-8?B?YVR0MUVEMlZid3lCNkpJckpoTzdKbldycTBDMG5PNUhqMmdTYmFqYkxvUkdp?=
 =?utf-8?B?VVA5YTMrdXVORlpaaTM4RDQ0Sk5tbjZ4ajcvQVRlSXF2Y1ZXamRLbTRLY2FE?=
 =?utf-8?B?WS81V2pNUU5xN2huUXY1RUl0S0thdzNRS1NFa2NjQ1BrMnEzcVpld1M1UGRs?=
 =?utf-8?B?QnlvK0hrZ29QVFhvVS9LSUtFcXpZdDIycWMzZWd0aU9hejRLODA3eXV5eVc0?=
 =?utf-8?B?Z25WUlBNNHlsUWp0MEk2em9zOTdMS3YrSUY1VkhHcENDRDVwTXNVZmRhRUY4?=
 =?utf-8?B?Znc5ZVpxbnZWODVvYUNrTEdZbHNrZHBTRHhLdW1FYU81eG1JbVgxVWdvbUNF?=
 =?utf-8?B?aUlneFl4Qk16MDcvMEhXQzRUWlR6ZCthVHltYTNnSlJBSlYrbVNmK2JQZUJS?=
 =?utf-8?B?dXNUc2RSek8xZ0Fsd0dLaXZtdDBycktnbDkvUWZGVjFUYTEzTlBaSlZ5VzBO?=
 =?utf-8?B?MFNTYXcvMitlZWwxUEgySjQxMWFFUUtUWDVSd2dGSDZkaGJUZnFndjYwVVI5?=
 =?utf-8?B?VUNOSkJ3cWZUUWhFd3RRWmhzaC9DOFF5Q1g0UHhZMGNQRllFWjFISUVGcytw?=
 =?utf-8?B?OVNGQ25zamhHWW04T0xjcG5QbTdZL1FoT3NkOW51Y2Q5MnNNVi9mdEI0bkQx?=
 =?utf-8?B?Vzk2SHpOL1I1TzN2ZXhsaUpqaGpVSGc2NDBDUy8wMjNzZEVETHhRSmxPU0NC?=
 =?utf-8?B?d05nQWJ2ZnZabnR1d2liVUYvdHdpVy9YWFdhMThEU3Z3UHh5TVY1M0FmQ1Mw?=
 =?utf-8?B?V2h5b2Z1VnhJNjRUb1F2Q0MvcndsZ1hMZ2xuUVBmZHdvdHpzS05DeGwvQ2d4?=
 =?utf-8?B?Wjlkc2ZOTjRoakYzRDN6WmlHOUhDN1dIUTN3cFhkTWNUYnNUOTlzS0NDWUdP?=
 =?utf-8?B?WjJyL1RBMzNCSER4TXJLVDdDVFNSTXRZd1FKZWtLRjB6SE9sbFppeDhOT0d6?=
 =?utf-8?B?SExBTTBRd3d1M0UzMFJZTXlmYi9BaVg0UVBlOW9aS3FMQjU2cXoyTVNiMHg1?=
 =?utf-8?B?OWRqWUErSTBvaENnTkV2bUZIMDBRR0dkTS91ZEdyU1ZtNWQyUDRnYWI0Q3VN?=
 =?utf-8?B?SFEwWWNGNUZVV2NrNWhFMUJqSVpvR0dSeVgvSzVsWkJsRVM3RkRZTHVrdlhl?=
 =?utf-8?B?TWgxd0NDVVdQVVg2TzcvZWs5QWF4M1JhYWxvZGsxcHV3emt1dFNkdHpRNWx0?=
 =?utf-8?B?V1JBa1RobzBBSGErNzVuUUl3ZWhUblcyUHdhZTE2aVlEaGtJWEZneGFUYXp1?=
 =?utf-8?B?MHJhODlDOGZFTlRGLzRPK09pMGJWM0dxZGNOTWNGQXMvanJYZDR2YUJZNm82?=
 =?utf-8?B?VVNRdzZVdU4wRUdhOFJvSkNHWXNiZmpodjQ5RXdzSFhuYlVEWms5Ynp2bzNX?=
 =?utf-8?B?ZWlwQWt2SXRFaHhmN0s0UUltRDBrMVBKUzkxc1B4bTdHVjJmRk8zU2NocVk5?=
 =?utf-8?B?S2wzb08ra0RCZE9HRVJuOEFZUkc1OWZDN2szY3VaTStFeWFmMlNKNERTVnhN?=
 =?utf-8?B?VUhkelEwdVZ2dllzdVM5RGtmMU13ODd4MzdXMno2a080RkZDalovNW5aKzNE?=
 =?utf-8?B?REE0TC91SUpVNDBVVVE2VEI1bTRIVUhZN0xPMllHTmZJS2JxQTlEUTlTK2tm?=
 =?utf-8?B?SE4yaCt5N0VOaWprZSt6bFlRbDNsSDhwV2pJQU9YNjBFZG5PZ2hmMEdqaGNh?=
 =?utf-8?B?TU5FbDdYclZqdm5OWnlpek5DVHYrcmlMcitxOGNVVjl2bDdFeTNhcm53Ump0?=
 =?utf-8?B?amhMNUFqWFJDeVpIb3ZabjB6YVFGYktMRlB6eUd1aGsxaC83NGp2bEZmc25l?=
 =?utf-8?B?dzl6ODcrdjYyWXZ5cVdXMUN1Y3hBbTVET09GZFZPZWg5N1Vna3RobGY3UWE0?=
 =?utf-8?B?WmVhcGI0N0R2ald1eEFsMURVUnJ5R0Q3bW1pQ21ReUZDV2NscVZsSk9yMDc5?=
 =?utf-8?B?U1Y0citKblNGQWZ4VkpqaWsrUDgxTVRLMzR5Mm9HNUJ6Q2V3U3RESVlJNjZY?=
 =?utf-8?B?N3dldTh3RGRSY3E3R3ZaMkszdFVlUm93NFh4SnhpYVBURitPbmw5OUJoTWFB?=
 =?utf-8?B?VS84K1c0RFNmM2RDU1VDZS81UjRRR00yd3F5WHE2SXJ1WlMzemFuS3YwWDFt?=
 =?utf-8?B?VUoyL3VOTk40NGcyUXg2cWljbDdZS0RoRE44bUVPOHVlcWRHVmtuQzNZN29Q?=
 =?utf-8?Q?/88UtiKV9J83on40pXtd0omqRnwflYFRc1LyR8/6LM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be739df-f361-4218-f50f-08d9fc73bc46
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 17:40:26.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lj2kEzxA/E7BeTcFH9Tc3QJ9Idy5HIuPKS6NqhQ4y7yXewgQU37B2Is6vfDbv3nW4HzQiBBulxvS79CB8Z3lgoZ9OHXBMJa6+2VH+MyV/xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2793
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/2/2022 03:21, Tvrtko Ursulin wrote:
> On 28/02/2022 19:17, John Harrison wrote:
>> On 2/28/2022 07:32, Tvrtko Ursulin wrote:
>>> On 25/02/2022 19:03, John Harrison wrote:
>>>> On 2/25/2022 10:29, Tvrtko Ursulin wrote:
>>>>> On 25/02/2022 18:01, John Harrison wrote:
>>>>>> On 2/25/2022 09:39, Tvrtko Ursulin wrote:
>>>>>>> On 25/02/2022 17:11, John Harrison wrote:
>>>>>>>> On 2/25/2022 08:36, Tvrtko Ursulin wrote:
>>>>>>>>> On 24/02/2022 20:02, John Harrison wrote:
>>>>>>>>>> On 2/23/2022 04:00, Tvrtko Ursulin wrote:
>>>>>>>>>>> On 23/02/2022 02:22, John Harrison wrote:
>>>>>>>>>>>> On 2/22/2022 01:53, Tvrtko Ursulin wrote:
>>>>>>>>>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Compute workloads are inherently not pre-emptible on 
>>>>>>>>>>>>>> current hardware.
>>>>>>>>>>>>>> Thus the pre-emption timeout was disabled as a workaround 
>>>>>>>>>>>>>> to prevent
>>>>>>>>>>>>>> unwanted resets. Instead, the hang detection was left to 
>>>>>>>>>>>>>> the heartbeat
>>>>>>>>>>>>>> and its (longer) timeout. This is undesirable with GuC 
>>>>>>>>>>>>>> submission as
>>>>>>>>>>>>>> the heartbeat is a full GT reset rather than a per engine 
>>>>>>>>>>>>>> reset and so
>>>>>>>>>>>>>> is much more destructive. Instead, just bump the 
>>>>>>>>>>>>>> pre-emption timeout
>>>>>>>>>>>>>
>>>>>>>>>>>>> Can we have a feature request to allow asking GuC for an 
>>>>>>>>>>>>> engine reset?
>>>>>>>>>>>> For what purpose?
>>>>>>>>>>>
>>>>>>>>>>> To allow "stopped heartbeat" to reset the engine, however..
>>>>>>>>>>>
>>>>>>>>>>>> GuC manages the scheduling of contexts across engines. With 
>>>>>>>>>>>> virtual engines, the KMD has no knowledge of which engine a 
>>>>>>>>>>>> context might be executing on. Even without virtual 
>>>>>>>>>>>> engines, the KMD still has no knowledge of which context is 
>>>>>>>>>>>> currently executing on any given engine at any given time.
>>>>>>>>>>>>
>>>>>>>>>>>> There is a reason why hang detection should be left to the 
>>>>>>>>>>>> entity that is doing the scheduling. Any other entity is 
>>>>>>>>>>>> second guessing at best.
>>>>>>>>>>>>
>>>>>>>>>>>> The reason for keeping the heartbeat around even when GuC 
>>>>>>>>>>>> submission is enabled is for the case where the KMD/GuC 
>>>>>>>>>>>> have got out of sync with either other somehow or GuC 
>>>>>>>>>>>> itself has just crashed. I.e. when no submission at all is 
>>>>>>>>>>>> working and we need to reset the GuC itself and start over.
>>>>>>>>>>>
>>>>>>>>>>> .. I wasn't really up to speed to know/remember heartbeats 
>>>>>>>>>>> are nerfed already in GuC mode.
>>>>>>>>>> Not sure what you mean by that claim. Engine resets are 
>>>>>>>>>> handled by GuC because GuC handles the scheduling. You can't 
>>>>>>>>>> do the former if you aren't doing the latter. However, the 
>>>>>>>>>> heartbeat is still present and is still the watchdog by which 
>>>>>>>>>> engine resets are triggered. As per the rest of the 
>>>>>>>>>> submission process, the hang detection and recovery is split 
>>>>>>>>>> between i915 and GuC.
>>>>>>>>>
>>>>>>>>> I meant that "stopped heartbeat on engine XXX" can only do a 
>>>>>>>>> full GPU reset on GuC.
>>>>>>>> I mean that there is no 'stopped heartbeat on engine XXX' when 
>>>>>>>> i915 is not handling the recovery part of the process.
>>>>>>>
>>>>>>> Hmmmm?
>>>>>>>
>>>>>>> static void
>>>>>>> reset_engine(struct intel_engine_cs *engine, struct i915_request 
>>>>>>> *rq)
>>>>>>> {
>>>>>>>     if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
>>>>>>>         show_heartbeat(rq, engine);
>>>>>>>
>>>>>>>     if (intel_engine_uses_guc(engine))
>>>>>>>         /*
>>>>>>>          * GuC itself is toast or GuC's hang detection
>>>>>>>          * is disabled. Either way, need to find the
>>>>>>>          * hang culprit manually.
>>>>>>>          */
>>>>>>>         intel_guc_find_hung_context(engine);
>>>>>>>
>>>>>>>     intel_gt_handle_error(engine->gt, engine->mask,
>>>>>>>                   I915_ERROR_CAPTURE,
>>>>>>>                   "stopped heartbeat on %s",
>>>>>>>                   engine->name);
>>>>>>> }
>>>>>>>
>>>>>>> How there is no "stopped hearbeat" in guc mode? From this code 
>>>>>>> it certainly looks there is.
>>>>>> Only when the GuC is toast and it is no longer an engine reset 
>>>>>> but a full GT reset that is required. So technically, it is not a 
>>>>>> 'stopped heartbeat on engine XXX' it is 'stopped heartbeat on GT#'.
>>>>>>
>>>>>>>
>>>>>>> You say below heartbeats are going in GuC mode. Now I totally 
>>>>>>> don't understand how they are going but there is allegedly no 
>>>>>>> "stopped hearbeat".
>>>>>> Because if GuC is handling the detection and recovery then i915 
>>>>>> will not reach that point. GuC will do the engine reset and start 
>>>>>> scheduling the next context before the heartbeat period expires. 
>>>>>> So the notification will be a G2H about a specific context being 
>>>>>> reset rather than the i915 notification about a stopped heartbeat.
>>>>>>
>>>>>>>
>>>>>>>>>
>>>>>>>>>     intel_gt_handle_error(engine->gt, engine->mask,
>>>>>>>>>                   I915_ERROR_CAPTURE,
>>>>>>>>>                   "stopped heartbeat on %s",
>>>>>>>>>                   engine->name);
>>>>>>>>>
>>>>>>>>> intel_gt_handle_error:
>>>>>>>>>
>>>>>>>>>     /*
>>>>>>>>>      * Try engine reset when available. We fall back to full 
>>>>>>>>> reset if
>>>>>>>>>      * single reset fails.
>>>>>>>>>      */
>>>>>>>>>     if (!intel_uc_uses_guc_submission(&gt->uc) &&
>>>>>>>>>         intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
>>>>>>>>>         local_bh_disable();
>>>>>>>>>         for_each_engine_masked(engine, gt, engine_mask, tmp) {
>>>>>>>>>
>>>>>>>>> You said "However, the heartbeat is still present and is still 
>>>>>>>>> the watchdog by which engine resets are triggered", now I 
>>>>>>>>> don't know what you meant by this. It actually triggers a 
>>>>>>>>> single engine reset in GuC mode? Where in code does that 
>>>>>>>>> happen if this block above shows it not taking the engine 
>>>>>>>>> reset path?
>>>>>>>> i915 sends down the per engine pulse.
>>>>>>>> GuC schedules the pulse
>>>>>>>> GuC attempts to pre-empt the currently active context
>>>>>>>> GuC detects the pre-emption timeout
>>>>>>>> GuC resets the engine
>>>>>>>>
>>>>>>>> The fundamental process is exactly the same as in execlist 
>>>>>>>> mode. It's just that the above blocks of code (calls to 
>>>>>>>> intel_gt_handle_error and such) are now inside the GuC not i915.
>>>>>>>>
>>>>>>>> Without the heartbeat going ping, there would be no context 
>>>>>>>> switching and thus no pre-emption, no pre-emption timeout and 
>>>>>>>> so no hang and reset recovery. And GuC cannot sent pulses by 
>>>>>>>> itself - it has no ability to generate context workloads. So we 
>>>>>>>> need i915 to send the pings and to gradually raise their 
>>>>>>>> priority. But the back half of the heartbeat code is now inside 
>>>>>>>> the GuC. It will simply never reach the i915 side timeout if 
>>>>>>>> GuC is doing the recovery (unless the heartbeat's final period 
>>>>>>>> is too short). We should only reach the i915 side timeout if 
>>>>>>>> GuC itself is toast. At which point we need the full GT reset 
>>>>>>>> to recover the GuC.
>>>>>>>
>>>>>>> If workload is not preempting and reset does not work, like 
>>>>>>> engine is truly stuck, does the current code hit "stopped 
>>>>>>> heartbeat" or not in GuC mode?
>>>>>> Hang on, where did 'reset does not work' come into this?
>>>>>>
>>>>>> If GuC is alive and the hardware is not broken then no, it won't. 
>>>>>> That's the whole point. GuC does the detection and recovery. The 
>>>>>> KMD will never reach 'stopped heartbeat'.
>>>>>>
>>>>>> If the hardware is broken and the reset does not work then GuC 
>>>>>> will send a 'failed reset' notification to the KMD. The KMD 
>>>>>> treats that as a major error and immediately does a full GT 
>>>>>> reset. So there is still no 'stopped heartbeat'.
>>>>>>
>>>>>> If GuC has died (or a KMD bug has caused sufficient confusion to 
>>>>>> make it think the GuC has died) then yes, you will reach that 
>>>>>> code. But in that case it is not an engine reset that is 
>>>>>> required, it is a full GT reset including a reset of the GuC.
>>>>>
>>>>> Got it, so what is actually wrong is calling intel_gt_handle_error 
>>>>> with an engine->mask in GuC mode. 
>>>>> intel_engine_hearbeat.c/reset_engine should fork into two (in some 
>>>>> way), depending on backend, so in the case of GuC it can call a 
>>>>> variant of intel_gt_handle_error which would be explicitly about a 
>>>>> full GPU reset only, instead of a sprinkle of 
>>>>> intel_uc_uses_guc_submission in that function. Possibly even off 
>>>>> load the reset to a single per gt worker, so that if multiple 
>>>>> active engines trigger the reset roughly simultaneously, there is 
>>>>> only one full GPU reset. And it gets correctly labeled as "dead 
>>>>> GuC" or something.
>>>>>
>>>> Sure. Feel free to re-write the reset code yet again. That's 
>>>> another exceedingly fragile area of the driver.
>>>
>>>> However, that is unrelated to this patch set.
>>>
>>> It's still okay to talk about improving things in my opinion. 
>>> Especially since I think it is the same issue I raised late 2019 
>>> during internal review.
>>>
>>> And I don't think it is fair to say that I should go and rewrite it, 
>>> since I do not own the GuC backend area. Especially given the above.
>>>
>>> If there is no motivation to improve it now then please at least 
>>> track this, if it isn't already, in that internal Jira which was 
>>> tracking all the areas of the GuC backend which could be improved.
>>>
>>> I am also pretty sure if the design was cleaner it would have been 
>>> more obvious to me, or anyone who happens to stumble there, what the 
>>> purpose of intel_engine_heartbeat.c/reset_engine() is in GuC mode. 
>>> So we wouldn't have to spend this long explaining things.
>> My point is that redesigning it to be cleaner is not just a GuC task. 
>> It means redesigning the entire reset sequence to more compatible 
>> with externally handled resets. That's a big task. Sure it can be 
>> added to the todo list but it is totally not in the scope of this 
>> patch set.
>
> My point was that was something which was raised years ago ("don't 
> just shoe-horn, redesign, refactor"). Anyway, stopping flogging of 
> this dead horse.. onto below..
>> This is purely about enabling per engine resets again so that end 
>> users have a better experience when GPU hangs occur. Or at least, 
>> don't have a greatly worse experience on our newest platforms than 
>> they did on all the previous ones because we have totally hacked that 
>> feature out. And actually getting that feature enabled before we ship 
>> too many products and the maintainers/architects decide we are no 
>> longer allowed to turn it on because it is now a behaviour change 
>> that end users are not expecting. So forever more ADL-P/DG2 are stuck 
>> on full GT only resets.
>
> Is any platform with GuC outside force probe already? Either way 
> blocking re-addition of engine resets will not be a thing from 
> maintainers point of view. Whether or not the fail of not having them 
> is a conscious or accidental miss, we certainly want it back ASAP.
>
ADL-P is released and running GuC submission.

John.

> Regards,
>
> Tvrtko

