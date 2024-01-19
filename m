Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141348322ED
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 02:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B19310E948;
	Fri, 19 Jan 2024 01:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C0F10E94E;
 Fri, 19 Jan 2024 01:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705627321; x=1737163321;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v9VLlYtBrv/dK1d8NFOi1S3lBHLb7JRXN+xahB6Vxuw=;
 b=fU1qZyIk23Pg7FgtXHawht5gonXylanssrdEuDtTbBIdUu7sbX0VbBU8
 ft3m/uwzDDSfXz0AdE5Sl1poDzJ2lSJBmZCk9aJK79I9donMae2FGIkSy
 6wshL0zXTa+CoedGHN5NhaiNbeTARC68QEDSYVcZH6mBHqo2kLtrD/Y+4
 DdtsSp1Rxzh3PdfSswhagIEvsG3PbU7UVA3yu1UhZLEOO8z3JJ5nHBOLz
 ulf+wvNv2plWK4b1D4o0jnCUzGhruJeqqP3xsQjwEfMgHXVP9YxxUXCmK
 ejt6NEb6s8PgtoSiSbsVTAVVZfzF/VN4WaBvkTE2tuZY9inUELOYCp/52 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="8023213"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="8023213"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 17:21:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1031823923"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="1031823923"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 17:21:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 17:21:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 17:21:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 17:21:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSuFJ2hUH1uc5/ppTcq2oJ7Qo3ChwmwReHaY4J9o7SiQAyjeLXcwZSDu9CNlo0h8MMkVW/paeYvYnW1+sGuPMuXYo7KGuK4CemvTHWEgXhywEKn3cz1B8GDZV7aWemMIDYv2YghpAghfgyRzrChpkBP8RZ4D/dGkA4jkOeqxbKhvQ/ckvGZeHU9DO1MjFfzppXVyTSURIYrxNb7fUMh4FX+Qz+nyrpqYrqKINSgulPCqQmlrdJnETSk995Io/lQPORj/hGu5PJ12XLl4cl4mdy1WUuUcEvjpFrQ856r9UnP30hmwyO7jqhYBh28uCZq5E84wodBAK/8CCQg64w/9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NorfzqqRhwSgAQgPP/b1jDocctZHxsRcq1+ZTIQCVkE=;
 b=TjTPkZJAVjiKZTzVVFuhqrZtL9il2++sKnMx+I1DnUyGcRFguuUMflmoyJ2bc/FW4fX2cvLs8ToQSO2GfKoRr+HTEQvN6ernbj5IO+QsyVAngdTaG9yaI7SAAYiMAiPPFfppnoj//fGvZZ7R8e28k0ui5FlKCpjdkV9nNgqeFUNy3joTSQOhZMEkDxgVpmSP+X2M0EctkswZV9JXF660YHYnY65s9MFP8A74Y6a/BdM10r03F/tSUS/I6G+rHJKHTlypQkcuZdMPzKByrZFDukpL/Z965S+k7ZdhKRBp/7J7F4OWs948XHh2/of6nWeHHXeH/fVIZhFRmTRd/pb0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB6623.namprd11.prod.outlook.com (2603:10b6:a03:479::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 01:21:25 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3%4]) with mapi id 15.20.7181.019; Fri, 19 Jan 2024
 01:21:25 +0000
Message-ID: <c1457166-8fa9-49f8-805d-ca4aaa33a9f9@intel.com>
Date: Thu, 18 Jan 2024 17:21:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/mtl: Wake GT before sending H2G message
To: Matt Roper <matthew.d.roper@intel.com>
References: <20240118231728.3817168-1-vinay.belgaumkar@intel.com>
 <20240118235022.GX45138@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240118235022.GX45138@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c05c6e-ad68-4593-a0c8-08dc188cf412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qga+lXrEQZjgQwXCyvDno53T4qVvShvHOdut69bN+Ny8VZvcZWZf4/T+I17cY4vGSV2nz/io6fC/BKV8AoVJN2S15VzLcbwLEIbd6LRhmz07LmdzGSPxl6p9awaQkdAu2w+DNHEU3lmLgsJVVTL6CsgBf09v28dJXBu22rO8I0gUrxzhk4ezVsyyqzJw09yeIH5Q1SopU/BIKuiiCi+Y/87zoi9MbFvvBBE7lXf+RKhZAO5X7st3tSIMOIVwyYpA+iofagLCwI2oCubWOWWHqi/kW2hTv4vt3pVtVlbl5IkwuHFo8smXi3VuVA2N4UYyTyHElql7lyfwS2hiir0R4wh11b6v+txZJRAGF8EhGkxgDyGKLpDEp4YRBeKLMOyej2kZWHnWCIT/Nmj74cefLFhQsaoU5aZvguFoXoZ2L4IvAQ0ht/t83k1m6AZdD35uY0tnciCKTTMRCt8MpaIVbxcruE0Wi3I8wTJ8jKwQaAzqhaLJQC3RzSV32eGQ1VosgpiTFnE6r7aHm4PygO/a0gL+iRWHHPtnuhClnpBzxmfFjbHZjyRE1pe1ATDLizzCDRy2JRfS8m2Dh52Mbr1P2GLk6hiOGrlf3dW8hKFuxbU+EFLtLhOV1t/pfvXEBqybDlqFRanV8WLi0NIQUXG+JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6506007)(31686004)(6512007)(53546011)(26005)(2616005)(6636002)(36756003)(86362001)(31696002)(38100700002)(82960400001)(8676002)(41300700001)(6486002)(83380400001)(37006003)(15650500001)(5660300002)(6862004)(478600001)(4326008)(2906002)(450100002)(316002)(8936002)(66556008)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWRoTURPQnRXb2RhMGRDajNHeitLdktRZktZTmF3eVFQU2tWSlF0ZWl4TXJx?=
 =?utf-8?B?bXhkVkVMUjZOYk03d1VNSXVRVWxHbGVrNlNXYzg5cTVjZlBMei9yVkJzVEl6?=
 =?utf-8?B?MmxvejlaLzczclJJK3hEMW5jNDVsU3lsa3grVWVGWURnQkpyTkhIaENhNEU5?=
 =?utf-8?B?N2JvaHRqWDloNXc2czkvQW85SnlwUGx4cG5CVmIyOGRDQUw1R3VGZk1UN0Zu?=
 =?utf-8?B?djlNNzc3c050WUJ3QzdMbEpoaFBzWWt4cmVDQmswLzVic0pQdHRzS3VHMkln?=
 =?utf-8?B?VTQyRlVZcy9DdzRGbDUvUlJFZGVMWE02Z2hrYXcrc24reUJwMmR1QWJJN2VU?=
 =?utf-8?B?LzBzVkZoSWRKeDlHZGF0TFJNMmpjWEwyeXlEYW9nUjNPcWRDaHh0YjJjQTJ1?=
 =?utf-8?B?QW41NDdKczZOazZ6Z3QvRk1QVWFrOGJ2WS9VOUptMVZ0NmlxbWVOOFVFb0xs?=
 =?utf-8?B?OHdHYmVaL2Y1SVpJYmJKeFRvV3VGV1c1Y0ZiWTJQYU5pVmRsb2NnY25xVmw5?=
 =?utf-8?B?T0dxcVhzOEQ4UzR2a2VPMElOZ3c2RUhtemZhN2hQd2krazZHZnBnS1ROdVov?=
 =?utf-8?B?V2xFd3k2N1ZKU0diUjB0R2dlbXRmRS9iQ0tEUkxpZ1NkV05KdnhyN3c4WFEv?=
 =?utf-8?B?bHQrWUZ3RjBpZnFRRnhmZGQvTERROEY0a0s1YTdCMkE0SFIwNnVqREtEeTZk?=
 =?utf-8?B?QXRWWHJDOE5tQnNpVWRacFVKVU8wVE9xaVFRd0U4UzJaOG05a3F2anNaN1Rw?=
 =?utf-8?B?Y1NCdG42enp0U3lFWk1rUzZDK0FKTExsK1lXazJ6akxuRzVzT284SFpLV1FT?=
 =?utf-8?B?VW45dXlwQ0NUUTQ2dHZYM3NmYno2RmthVE9HU3RWY3htTHFQbjFtUDVRcVVF?=
 =?utf-8?B?aGxxUUsyZzE2TG92c2UzVkc0SldZY082ZTBWZjhQbWtwSjhvS3NOU2FzVzdG?=
 =?utf-8?B?ZHl0bE1ZV2VxQVR1ejdRNWF5eUR3eStvdUdSN1A0ZllDdGdSWmZvUUtXOGE0?=
 =?utf-8?B?dUFGRnhlL3NaYnFVQnlIdGZoWGI4cE5hUkk1VFNMMDExbFJvdVlWUktVeDBN?=
 =?utf-8?B?blhFSDR4cmdnTDRUVE1yM3YxUTVRelVJZUQ2VzV5eUlwbnU1c0ZsMkpsQzBw?=
 =?utf-8?B?bzB5NTRmQ3RBSllBcFRSU0NQT3pUUWRnUmdkSmN5WlVFRDZOZFl5dkZYRGVt?=
 =?utf-8?B?MGlvamZnVHFTZDUyT3RDTm9Bb0hqbGEvRkJvZGJzSEVRczVwL2w0MkVEaXNl?=
 =?utf-8?B?QXlUbytwUEFjanlXUitZOWI1VmFPQllyOFQ2M2hSU050djdPZklPY0l1S0lh?=
 =?utf-8?B?M3dyMmF3dzA3alNLTnpkWlIxeGgrRUFmNVNXcElXTXRMOCsrNXhVcEdiTVpG?=
 =?utf-8?B?d2d4TGdiVE1MYklUZFdPVThUMjdkZUJSY3FjbFBPbVNzR0FFL2JUUXMreWIx?=
 =?utf-8?B?cEMxNWJLZ3lLRUJKM1VTa0hSdHRiNG5wTXRacE01MVpyVUlTTFk2WEVaajAx?=
 =?utf-8?B?RTRuOHl1TXlrQ2hZemtwWVVaQURPUGpiRXNzY3JpTjlCdk1nbWZ5YzB5ZWJZ?=
 =?utf-8?B?NnBTQmFoVVJ2Rk5Yc3MrTGZUcjRKdXdrSlFtS2JHWjBMMGIvaGd2UWdMK3Uw?=
 =?utf-8?B?bFNRYys3K3prME9hbm1iYVFKbGtoZ1I1WFRQNDlvRkRkbXQ4eVRoSSszc2Rl?=
 =?utf-8?B?SWJtbWpYRHdCYUZmcXNRT1g1SG1RdkxlZVdkeGlnUUgzVElyclo5SXJCWkpk?=
 =?utf-8?B?MHhJbzg1V0lFR3c2Rlo5bDN4SkRzQlRnMFQ2cVREd2tsL05ONUN3RnJvanV0?=
 =?utf-8?B?VHJvb29SZXdocThkeUVxRVJRTitDWWxva2pYVmlxa3gyYVdYS1BDUU14THBh?=
 =?utf-8?B?MDJ0V1ZQeUJNVFJZZWI3UHFZZHFDVWlEUWttbzc4RlkvZmN2RWVYbG5KeTFp?=
 =?utf-8?B?NkZnS0dhUnVHRFJEd0RURTNaQ1g5aWh3b2hnWlo4VVo0SlNQL0tSckdjKzho?=
 =?utf-8?B?VE5ja1VSQjg2YnYxRkU0YVBYcTdTODhNWkVuTzU3aG00NWkxRjVIYmZKcDFS?=
 =?utf-8?B?OXZxMlYrZHNmdHpYMUtOTTM1b2xCbDFPTXZmS1FPRTNwcnlhb3hYOUE1L2JG?=
 =?utf-8?B?SE1LRWhmYnJIVHpOUE1BdlZpbkV4alNmemhzVmhHbzdrN3YyaDlsWnpqR0g4?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c05c6e-ad68-4593-a0c8-08dc188cf412
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 01:21:25.0531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3ZwGNbtfGm5M7a8za/uJCEM119SDEOwv4nYcsJopSkiNgmddrTMP1x6eOmr8kEr7fWd7FNdnnWSa/DzOZTrNcylDLXZkuKt+uVA+IwGPtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6623
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/18/2024 3:50 PM, Matt Roper wrote:
> On Thu, Jan 18, 2024 at 03:17:28PM -0800, Vinay Belgaumkar wrote:
>> Instead of waiting until the interrupt reaches GuC, we can grab a
>> forcewake while triggering the H2G interrupt. GEN11_GUC_HOST_INTERRUPT
>> is inside an "always on" domain with respect to RC6. However, there
> A bit of a nitpick, but technically "always on" is a description of GT
> register ranges that never get powered down.  GEN11_GUC_HOST_INTERRUPT
> isn't inside the GT at all, but rather is an sgunit register and thus
> isn't affected by forcewake.  This is just a special case where the
> sgunit register forwards a message back to the GT's GuC, and the
> workaround wants us to make sure the GT is awake before that message
> gets there.
True, can modify the description to reflect this.
>
>> could be some delays when platform is entering/exiting some higher
>> level platform sleep states and a H2G is triggered. A forcewake
>> ensures those sleep states have been fully exited and further
>> processing occurs as expected.
> Based on this description, is adding implicit forcewake to this register
> really enough?  Implicit forcewake powers up before a read/write, but
> also allows it to power back down as soon as the MMIO operation is
> complete.  If the GuC is a bit slow to notice the interrupt, then we
> could wind up with a sequence like
>
>   - Driver grabs forcewake and GT powers up
>   - Driver writes 0x1901f0 to trigger GuC interrupt
>   - Driver releases forcewake and GT powers down
>   - GuC notices interrupt (or maybe fails to notice it because the GT
>     powered down before it had a chance to process it?)
>
> which I'm guessing isn't actually going to satisfy this workaround.  Do
> we actually need to keep the GT awake not just through the register
> operation, but also through the GuC's processing of the interrupt?  If
> so, then we probably want to do an explicit forcewake get/put to ensure
> the hardware stays powered up long enough.

The issue being addressed here is not GT entering C6, but the higher 
platform sleep states. Once we force wake GT while writing to the H2G 
register, that should bring us out of sleep. After clearing the 
forcewake (which would happen after the write for 0x1901f0 goes 
through), we still have C6 hysteresis and the hysteresis counters for 
the higher platform sleep states which should give GuC enough time to 
process the interrupt before we enter C6 and then subsequently these 
higher sleep states.

Thanks,

Vinay.

>
>
> Matt
>
>> This will have an official WA soon so adding a FIXME in the comments.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/intel_uncore.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
>> index dfefad5a5fec..121458a31886 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.c
>> +++ b/drivers/gpu/drm/i915/intel_uncore.c
>> @@ -1800,7 +1800,10 @@ static const struct intel_forcewake_range __mtl_fw_ranges[] = {
>>   	GEN_FW_RANGE(0x24000, 0x2ffff, 0), /*
>>   		0x24000 - 0x2407f: always on
>>   		0x24080 - 0x2ffff: reserved */
>> -	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT)
>> +	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT),
>> +	GEN_FW_RANGE(0x40000, 0x1901ec, 0),
>> +	GEN_FW_RANGE(0x1901f0, 0x1901f0, FORCEWAKE_GT)
>> +		/* FIXME: WA to wake GT while triggering H2G */
>>   };
>>   
>>   /*
>> -- 
>> 2.38.1
>>
