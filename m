Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F28570D4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 23:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F200A10EA2D;
	Thu, 15 Feb 2024 22:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqezyIKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B969010EA2D;
 Thu, 15 Feb 2024 22:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708037742; x=1739573742;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PipnMDc96nqI+NSO3K1lzSut2mMNPzRV81/l0ePqC/4=;
 b=DqezyIKZr6R5ZFkM4foLRD6C4nK6J7vDPDo2MY8xANTh5dAHJHZJrti/
 HfClU+W52EaeZ/tAiM/bkRL7PCZ/5LX5cQnm98MpsZLGI5iWjVA8QU/Xz
 tkdQrMaeFz/2piZz7W17P7TM3kUsfC4kUErmfFRFRrC76/6nGzeCG7w39
 6+TIK1hIeoe7z/E81Na6ZLEFCxt6tgSUIlembA+fT2UMUEzSZUeJ4lXYi
 0rPFIiBmZkY1UDnqavScUireYve88zTwKYdxE4sDrsr6hJz5CH/ksCwrA
 fzND60UomXdKmlz4D5/NlcoM2DR+vNTyzBNpY9OoXjTvffIBQjYjg19F7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13260853"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13260853"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 14:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912246919"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="912246919"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 14:55:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 14:55:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 14:55:38 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 14:55:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NimBucZ2nGmJh9AaC+7e4iQzw6Q7PeX8kq702OUSyy88hfrQTjoEfdsEbICPovU8vdxjAPWajqhsTUBAD133yhjvvIT6++nlAfzWvAYlhPOnP0OZrNwhTCvn6fE+OPLrjY9KeOeDGL/etUtNlnhep/e65b9x9ZabqX2OXT224leExqrUT+F50tdFqK8mMMFTFQrQh0h24Zq2epq5dq6Oy2pJedoHJ40t9n/E9cSCXMbGrSaj+BMgTGArEz0cDBfDMZhFm48ZEeuEA+G2eZkgdzmSW1zQc5BWvRLbeN48668e+XFCoNNG9o7UGiZ68Ze15PQxfAgpkLFG3vxWITesdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzM+EXT/1CEJGGRg4xkkTt8mGtAwJ1va6r7AuRhUy28=;
 b=HGS65DCzTCdlpmEOdGdskTwpuw64eu35XAVXOgdF0SYkFEbaOBXCb2hNKhqQPtGbU2d5pWU1QrD9nxkdHIOEMPwyPNQCIE3lA1iYn0mS30snOPBGDOJWLgFn1i+/L/xbB+iIAZD5ZxWtMchg/H6zbf4H5WdmagyvJHIUSjCBk09kxldj4W+Sc/B7zfLf5Cdez9xnmoUY7fwJrxnEXewuxy5F64QxWrZOkn2TiIdQMwc+ZJrjHqs/G7a4I85mZpQH6lMO70r2UA0RWsPcboIHXjL8kcP6eNfYl4zA/YsG1LXqH6ARGRH7pwAa22CInF7fMRn3+kr14DxPLuxjAHgF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 22:55:29 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Thu, 15 Feb 2024
 22:55:29 +0000
Message-ID: <2d3b2cbc-b274-4970-a38a-60dc93e5ea37@intel.com>
Date: Thu, 15 Feb 2024 14:55:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/gt: Set default CCS mode '1'
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 <stable@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <20240215135924.51705-1-andi.shyti@linux.intel.com>
 <20240215135924.51705-3-andi.shyti@linux.intel.com>
 <be6484e3-d209-4109-97e9-efe02e4e570b@intel.com>
 <Zc6Re9yg-OXpvwdh@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zc6Re9yg-OXpvwdh@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b13b64d-7ccd-4a2f-76d0-08dc2e7934dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDLKIaaiz6Kae6b/1J4+vNwOZ1+BO4yyRSbYng5XIlq9EJy0Kx52JBSOOZyfh7qFt/Itpo2xhChm/5In6Z6Q8MNZkMsjEFfpfVCUMzHOoeoeGpwSIO+eyd9qeOi21OnTJyZDdgVrmkZCktpm8g3J5zYh7HSkoWLssBhnqsfO0tQaFlwlxfq3ATHDCqhSKDZHvJi+1UxuEuIysFgN5he4jArUfvjXp8TvjI9EjYeFa7i1y7Vl2bY7PW6KSW4leHjCi5XloS4/BI3LSjoW7Xs+UNg9q9muhemcYu5YQ/exxRHMpESkUeGhNbqSqf0filpTZwpV6c2JX7AaMff1yp/jmDyG3BSgaKMb/5BqPg7Ofl1bJ4tKtE7z/5EEHJHBWMhLOVQYYAbQEPT9CYZtw3vHidrAL0ezDS+hoWcUkC5yzJZJvMxUYjixTlxz0bJ7U6zvetNAupd3J7AYAazfy95gFixQCeG/SR3lyMpUCwDwbe95ouBV7VY1E60An6NoLHEwkdSfy/wNv7wpPzF2KM9P4MAuJDPoeOKqBzvvA6YGPX+yOfx8GVzrhaJTj1SNLCpt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(5660300002)(31696002)(53546011)(2616005)(6506007)(41300700001)(36756003)(26005)(478600001)(82960400001)(38100700002)(66476007)(83380400001)(6512007)(8676002)(86362001)(66946007)(4326008)(66556008)(6486002)(8936002)(6916009)(6666004)(54906003)(316002)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QndIYnIxSzZubTR6WEI4YlRGYzZqQmc4Y3FEMi9WNC9jMFBTQnhWMmZERHZT?=
 =?utf-8?B?cGprWS9iM0xyajFTSFFxVFcxeTl4K2VWQ3B4bFpCMVlaQVhOVzl0Q01JWHJt?=
 =?utf-8?B?Z0lzSmxTZHcwMHl4MS82VFpCTnNSZ0ZvN2MvNjJBOHJ2OHMzMStNZXJqT1BP?=
 =?utf-8?B?S3pHVkQ5K0pCNTNTcml4V0JyMmxTU0J0WnlMS3JCYVFRYnBoNjZrRzdoSjlu?=
 =?utf-8?B?YUxpM0UzVUxjOXkzdE9IMjZoTnBqdGxoOCtWeE95Tkl5S3Y4L0wxd2VnQ3hU?=
 =?utf-8?B?YjYwaXUyUkcyVHNHeW9GRy9EMlExemdqY25zSEMzQ1Awbk0zQkI5czVTQWJj?=
 =?utf-8?B?UmpkMXNZWjdiSTVtWmZ1d2g0dUxOQ2wxZitRQnlFQkFISDc1RExtWmRtS21n?=
 =?utf-8?B?UmM5bjR5M2hBWk55QkZneGhDemtSRVVvK3ZmUEpscjQwMldNaFlBUk1OTFhX?=
 =?utf-8?B?eXhwdmlySERWMkZtUCtIdSttOW54ekFNYnIxeU9CTmcrc2QzR0p4dUZnTjFB?=
 =?utf-8?B?T3J5amQ1UWdIbWQvaFU1RWJwWS9ycFpYWEFhVlVtL2k1bSsydHNJMi9jVHRG?=
 =?utf-8?B?ZDZySTFmbGVZTVRxSldPbXFoUDlkSHRrTG5nbituMk1rR2dJUFFTMTdueGE2?=
 =?utf-8?B?RzhxeTJ6eFgyR2ljbEVEYVVwUlJrNTBBUVUwQ2NVWm1TVG1JbkE1VU9BM1lq?=
 =?utf-8?B?L1k5SC9xMzlGRnVpdWJtZHNsb1hBNm1vM3BnakI5RUE1cUdoR29qTU1IN29q?=
 =?utf-8?B?ZU1meDZUb2hOSTIvbWdrYVI4OWZwYmVYbk5zK1JSaEU1elBIdGNUWS91SzE5?=
 =?utf-8?B?djlUQUNTZTRNbTRlWmFvUjAzcllUcjlPaUtFQTMvbHRhc3NlUVZIMEFsMGNI?=
 =?utf-8?B?V2tRbmhEVnBNR2VHdlNOUHhsdTRBMnZ6QnRXUDlmSjFmSWpjckpFTFZ4RWVt?=
 =?utf-8?B?eWt2U0cvellXSmd3ZUpMaFI3ZlkzRDB1V2dyd3htRU1rN202SlhqYlNwTHRi?=
 =?utf-8?B?UUFwcTI0RTZyZUhmQUswUUpyR25MN2dDaGViYVFERU1LSkEwMFh4OGF6cWtG?=
 =?utf-8?B?R3pad3hqZlhEVTNxNXhSNGR5emo4emhrRUFGQXljTmcrRWdlUk8rTktPZ0x4?=
 =?utf-8?B?c0lIWHRzS3ZYcUR2ak1XTDZzNkl5NnJWZUxPdUpsS0N1Ykdjd3ZHbTkzVDZp?=
 =?utf-8?B?Wmo2RXkzWExQWU9SM3l5T1FLSGxsY3BPa25pNWh5dDRLMmRHYVFKeDFSV3oz?=
 =?utf-8?B?dThMRThkZ0cxakprN2lEZTgrR1laL1BHR2VrME1kQnIwcTZUY1IxeHhaWDQr?=
 =?utf-8?B?dWUwWVBab1FvbmdGMWpoZ3hFbVN5VDh0S254akFGVVE4RjdyVS9uS0lzNjds?=
 =?utf-8?B?YWgrblJZazNSME5lQnB5WlprQkpQSUw4dk5UTzhwQ1NnR3d3blljaWxHQUtE?=
 =?utf-8?B?WWhTeWQyZzFmd0w1YVpqUUFOZjZKWkw2ZGR5T1NzU2hFeDdTTjl0aWNKcEdQ?=
 =?utf-8?B?bWhuci9KNVpQN3J2eW4za2JhRVFvRG4yekxXeVRpYUxseEo0Y1hXYXRoM3NX?=
 =?utf-8?B?WEtsU2tSMUhFYWd6OG1XTDBFYnZNSkxpYVMvb0ducWE4RCt1ZVJueWtPb0dn?=
 =?utf-8?B?YW43SXo1TUVsenkvWkFUN3hEcmhNSWVTOVNnZzNkbEpLSkQ4dU9HRnhsNy9m?=
 =?utf-8?B?cFN6cCtEdWRQRlNYL3Q4WjBQUW1Zekgwb1VMUGYxUEdHdGJUL2R6SGZDOEVr?=
 =?utf-8?B?L1FJQUExU0tuUEt5NWVuOUZMU3l5SndRWGpRSVdBMSs0YmJ6aUhrem85bDZR?=
 =?utf-8?B?SnlwVzRrTFoyMVNkV1Jzc1BxUytqZjlYazJrOHpOTTdNaGxoN0RxWS9YdzZm?=
 =?utf-8?B?UDh6b3hTUVdpc1VqVHZVbEc3TTM1T05YaHcydytDMWMrZ1hqQVpBWmdCUFBW?=
 =?utf-8?B?WlJUNUhOMGRmTkVFS0NGN2NPM1UzdWhUN2s3ZEVDRnhZZmFxZEh3UktJcmpB?=
 =?utf-8?B?YUg1Qlo5MXNpMGNlSWF2VHVJT0xQYXVibExwa29KR0VNbWxhRjJyU0pKZkc0?=
 =?utf-8?B?cmdST1BHNzhuOUFNVEFqaWdnYXJackNvOEJzYmRBQVdQSWlFbzAyVmtWRVVK?=
 =?utf-8?B?UkF0Z3dSa2ZlRk9wRGVxcDgrSDBWQnN6bEtqZzBtUFNjOXcxNHFQdWw4Z1F2?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b13b64d-7ccd-4a2f-76d0-08dc2e7934dd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 22:55:29.4363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFXiccec1cVqg5eLUsQoeVrDuPGoG15rpR8PS8cNvJkKRz7ihDozYsUa2b1N4/EzMAg3Yyn7pwMLTgQF+G0evcf0TRWeQYBjasuk6P0xHEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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

On 2/15/2024 14:34, Andi Shyti wrote:
> Hi John,
>
> On Thu, Feb 15, 2024 at 01:23:24PM -0800, John Harrison wrote:
>> On 2/15/2024 05:59, Andi Shyti wrote:
>>> Since CCS automatic load balancing is disabled, we will impose a
>>> fixed balancing policy that involves setting all the CCS engines
>>> to work together on the same load.
>>>
>>> Simultaneously, the user will see only 1 CCS rather than the
>>> actual number. As of now, this change affects only DG2.
>> These two paragraphs are mutually exclusive. You can't have four CCS engines
>> 'working together' if only one engine exists. I think you are meaning that
>> we only export 1 CCS engine and that single engine is configured to control
>> all the EUs. As opposed to running in 4 CCS engine mode where the EUs are
>> (dynamically or statically) divided amongst those four engines.
> The balancing is done statically. The dynamic balancing is
> disabled in patch 1.
>
> The 2 or 4 CCS engines will share the same workload.
But they don't.

In i915, we use 'engine' to refer to a command streamer and all the 
associated hardware. This is distinct from the EUs which sit behind and 
can be driven by one or more command streamers. Saying that multiple 
engines are sharing a workload implies that you are submitting the 
context to multiple command streamers in parallel. I.e. a similar 
process to media frame split where they have a set of LRCA contexts 
bound together which are submitted in parallel to two or more video 
decode engines (VCS0, VCS1, etc.). That is not what is happening here.

Here, you are submitting a single context with a singe ring buffer to a 
single engine - CCS0. That engine is configured to own all EUs. Which 
actually means that submitting a compute task to another CCS engine will 
achieve nothing because there are no EUs available to those other 
engines. They will simply hang when waiting for the walker instruction 
to complete.

>
> Because the user won't be able anymore to select the CCS engine
> he wants to use, he will see only one CCS.
>
> I think we are saying the same thing using different words :)
But words are important.

John.

> I can try in v2 to reword the commit better.
>
> Thanks for looking into this.
> Andi
>
>> John.
>>
>>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.2+
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_gt.c      | 11 +++++++++++
>>>    drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
>>>    drivers/gpu/drm/i915/i915_drv.h         | 17 +++++++++++++++++
>>>    drivers/gpu/drm/i915/i915_query.c       |  5 +++--
>>>    4 files changed, 33 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> index a425db5ed3a2..e19df4ef47f6 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> @@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
>>>    	}
>>>    }
>>> +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
>>> +{
>>> +	if (!IS_DG2(gt->i915))
>>> +		return;
>>> +
>>> +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);
>>> +}
>>> +
>>>    int intel_gt_init_hw(struct intel_gt *gt)
>>>    {
>>>    	struct drm_i915_private *i915 = gt->i915;
>>> @@ -195,6 +203,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
>>>    	intel_gt_init_swizzling(gt);
>>> +	/* Configure CCS mode */
>>> +	intel_gt_apply_ccs_mode(gt);
>>> +
>>>    	/*
>>>    	 * At least 830 can leave some of the unused rings
>>>    	 * "active" (ie. head != tail) after resume which
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>> index cf709f6c05ae..c148113770ea 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>> @@ -1605,6 +1605,8 @@
>>>    #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>>>    #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
>>> +#define XEHP_CCS_MODE                          _MMIO(0x14804)
>>> +
>>>    #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>>>    #define   GEN11_CSME				(31)
>>>    #define   GEN12_HECI_2				(30)
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>> index e81b3b2858ac..0853ffd3cb8d 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -396,6 +396,23 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
>>>    	     (engine__); \
>>>    	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
>>> +/*
>>> + * Exclude unavailable engines.
>>> + *
>>> + * Only the first CCS engine is utilized due to the disabling of CCS auto load
>>> + * balancing. As a result, all CCS engines operate collectively, functioning
>>> + * essentially as a single CCS engine, hence the count of active CCS engines is
>>> + * considered '1'.
>>> + * Currently, this applies to platforms with more than one CCS engine,
>>> + * specifically DG2.
>>> + */
>>> +#define for_each_available_uabi_engine(engine__, i915__) \
>>> +	for_each_uabi_engine(engine__, i915__) \
>>> +		if ((IS_DG2(i915__)) && \
>>> +		    ((engine__)->uabi_class == I915_ENGINE_CLASS_COMPUTE) && \
>>> +		    ((engine__)->uabi_instance)) { } \
>>> +		else
>>> +
>>>    #define INTEL_INFO(i915)	((i915)->__info)
>>>    #define RUNTIME_INFO(i915)	(&(i915)->__runtime)
>>>    #define DRIVER_CAPS(i915)	(&(i915)->caps)
>>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>>> index fa3e937ed3f5..2d41bda626a6 100644
>>> --- a/drivers/gpu/drm/i915/i915_query.c
>>> +++ b/drivers/gpu/drm/i915/i915_query.c
>>> @@ -124,6 +124,7 @@ static int query_geometry_subslices(struct drm_i915_private *i915,
>>>    	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
>>>    }
>>> +
>>>    static int
>>>    query_engine_info(struct drm_i915_private *i915,
>>>    		  struct drm_i915_query_item *query_item)
>>> @@ -140,7 +141,7 @@ query_engine_info(struct drm_i915_private *i915,
>>>    	if (query_item->flags)
>>>    		return -EINVAL;
>>> -	for_each_uabi_engine(engine, i915)
>>> +	for_each_available_uabi_engine(engine, i915)
>>>    		num_uabi_engines++;
>>>    	len = struct_size(query_ptr, engines, num_uabi_engines);
>>> @@ -155,7 +156,7 @@ query_engine_info(struct drm_i915_private *i915,
>>>    	info_ptr = &query_ptr->engines[0];
>>> -	for_each_uabi_engine(engine, i915) {
>>> +	for_each_available_uabi_engine(engine, i915) {
>>>    		info.engine.engine_class = engine->uabi_class;
>>>    		info.engine.engine_instance = engine->uabi_instance;
>>>    		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;

