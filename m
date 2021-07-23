Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF403D395E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 13:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124816EE46;
	Fri, 23 Jul 2021 11:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C536EE46;
 Fri, 23 Jul 2021 11:23:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=did4wbu/Bs8z1vkSruRTJUONXfdSZEVNbIt2F3RMeXiPzz4dbjteQPC0ioYR+GCtbJgEfo25zQldPgYEyF+sg3L6d8hhv25RFrRJzlNJ7+3aHoSep8tT2MMv1C3/OU3DWQaIZwQl4cfUSmYhOB8ZeWvJwFxWJhz9tDmjQ+fF6mJR/nj5TvHj9sAfqNCBSN69Vz59I9q48GqExJLQ4r6vD1D9I/QwWzgHMUsIDzkvfZrU6IAKIBjZC0rw+qyBjZXWhaUy+8BCRHf5vVweLXYRz8ItTvMrMhIg1pWS8RbGCzMuimO2vzT6gmR0oEjyp5pB9iNTEOshuv2PnBBkaG1oNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRcq9Ea/w5DfvldAsv3DZ8eBkXivgp+FvdPPU3G0SXY=;
 b=ZivcsJPwiUXBeJbfxoK0/zMeSG3WswgYBEvOOfrUb2kXO106hgcx4mLE2OAiPTBzM9eNOeMEirmGSTi7GWTsuPHowTplGcL5eCk5OED6XsNyQvwov7k7iqki2GaiysduPvXRyO66M9EKt+PzfVOr4vJxv+iaucnPVdd4i7J+WV3TsIp0I6bTY67DHWvm9WgHgP2fkIqO6vyagxKGCvFR57LqBIFjWBGuT7HKyDrNz1qyFTdtwBYCe9QMsUjs7MILcCnpeFCRwuqqo6IO/CoSAcj0rp8JjZDhzPO4ozs90znIoxAbBH2bvdxR8dX45oNOO/yGdvNMRNNmuJuAeHtCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRcq9Ea/w5DfvldAsv3DZ8eBkXivgp+FvdPPU3G0SXY=;
 b=OHj/lxsXDghyC65rwq79AABDsZyQRE++baVN5AJkDKruvkfoxFkHOE68T9vlCF6waGBfLKqiMRrvnz5BtLHgZifuBZPBYDkagOQczU3rjcHTPgKAqQdKe8oxll0hGamXx6TrteV8yDjFFsfEbF1A8gLzAexQUPxRA1jnER3fKHk=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 23 Jul
 2021 11:23:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.028; Fri, 23 Jul 2021
 11:23:09 +0000
Subject: Re: [Intel-gfx] [RFC 0/8] Per client GPU stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
References: <20210715091820.1613726-1-tvrtko.ursulin@linux.intel.com>
 <e6f53b40-b8bf-3d2b-2dbe-a568254e15d3@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5a4e9aad-5ad6-aa66-ce9b-3a937af39736@amd.com>
Date: Fri, 23 Jul 2021 13:23:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e6f53b40-b8bf-3d2b-2dbe-a568254e15d3@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4ae7:63c0:5e49:6388]
 (2a02:908:1252:fb60:4ae7:63c0:5e49:6388) by
 FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Fri, 23 Jul 2021 11:23:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d149d58d-a5cb-4d00-3aef-08d94dcc3f86
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB419275964271D9F428CD01D183E59@MN2PR12MB4192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HpGeh2BX4Z0ecBRHbyIX3gbnkId/btSUGkaCe1mc3vRHgTxLG5BRPKrWUnTZbQusAeJfWtDxUvC5/hWx2hzhN7qanP9qh7BBnh8mfvEuQv1VqpaF9e/cdSUa3tL/O5taaFqlDdQr7bQsqjDTFIlbHs/KLDodZI0Gml2KGKB+HDiz/KPU+Wbh7JOoka1xhHd284F2HtN9VZ6QZpTdNFGQ5VpJTFeRvKHohPYhXNUYkNKpEUbY4X5dlv9vzCa9lOeJ1qjAum4BpZi07OSnHzYfwcU+aLR++YRPW5q1I+IIWtP2FEwKOXWXEWKbZmg5wYWsgMenuo8pHieLP804an0Uiw39FiERFkiiSxB1uPT1CDsdz2QYx/3sGF1hTgze/pzS0ld60tk+e0z4vHJf9dHyw3Lwq2dUMNA8mQglLKI9eFkjSYpqjAL8aZ5zNnMLNkCDdPIxvVLyRCeIrHB3ouAUQiyyMx1WJW1oJjcVA9DB7wsmcJhRA9O6phimkf44/OF1IUQoqXp00N9YfVhFO76rmvlsP1sgG6I3beQwg5NmEaBvX9sn47FDfFNMVnyEbGq+haUQ/+NdOZZXyRsAA8LSFLJc0IrrDRqxi/OKkhstgWsPeWB0yogTJbMc8VIHnC6dNLc3hJYhgvs1YwVPkGEkfVRuVKtuW8atFVAglgG7J2fTbJqGAGPGtsPX12YSumA5LHpPGTRTtmIfTc2f5pYrfmwzF8uwzZgOzuUM+LvCsSq1X2oUY4GdhQi0sxMAsnyI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(4326008)(2906002)(5660300002)(54906003)(86362001)(45080400002)(478600001)(8936002)(966005)(83380400001)(8676002)(53546011)(186003)(31696002)(316002)(6666004)(66556008)(66946007)(6486002)(66476007)(2616005)(36756003)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHArMjFKZ01RUDBuT3duWTNBTnQyOFYrRWVyVVZkb2dYNjVvWVZaM2tldEhz?=
 =?utf-8?B?cUVWQmtzMWUwa1FGSlkzSzZkOW9sdjJGTjZTdHgrbTVWREFkVGkzaHhnOEdq?=
 =?utf-8?B?K29VWlBUNHVvd0ZmN0JFRFZjZWdQQ2EzVlU4aGlCTXpLOVNXdXVTSnZhTmtB?=
 =?utf-8?B?RkNRcU9ia2hMM05IS29FQk5IV3R2OUhGTDJOc25wK2hoRktQb1NNNU1pckRI?=
 =?utf-8?B?OTk3eXEvc3VXdklYVTZxMEN2MWozTWpBSHRSb3cwWFVDQXNlb0g3alA3am1t?=
 =?utf-8?B?YmNSbWxVZlJvMkZFeWQ0Qko4SDZVem94NWd5emY0UlFpazJDT1pRYVpmY29v?=
 =?utf-8?B?TWlQQ3NObU9seWhMR0pkdVZrRnF3L1RmTU1qV3JCYld0cDNVaHRyNnJ2cDVX?=
 =?utf-8?B?WjZwZnFkVFd6MjMwS3JDWWN5RmxWUkphbnNjZFIxY3RwK2U2QWxidisxNzJY?=
 =?utf-8?B?Q29OTEFaVkwveHZRNXpqSEJ6SkNaQXRqNlBmUjRyMCsrZ29NVFZqbDJ6aUFl?=
 =?utf-8?B?SzRyM0lrQm1odXVERHVEbU0rOFVGVmJ2a1NBYmtCQVpNRnJBWW9XSWJpc1pm?=
 =?utf-8?B?TmRLajlMdDRuQXU1L0NVTmxteStMTzU5SHZleno4UE0vN1owVkUrUTliRXh0?=
 =?utf-8?B?R3ZjMUNZWVMwQVhNOHU3NGNmY2xQRHh6aDBXOUI2RW1xbHpOTExVTFhhYURk?=
 =?utf-8?B?WE9uYzl4U3UvQ2prWVpVQTU0MkRsd1JrT05QMHIwY3BnNm1GNFM0b0FvREgx?=
 =?utf-8?B?YlNCcGtaa25ZQzZKWHpWbmZONXpMcXpOcWFhdnQwZEpPMmdoNEtlZzE4OHhD?=
 =?utf-8?B?WVZoaXVMdXRUNDJ5ZVhvSXB5dWYvUWdJTHZEd3h1dzROYjFidC9VMFM4c3hX?=
 =?utf-8?B?Ynp5VVA0dU1xc2xpeEMvQUtXaVN4ZzRVWXJFeGZ3OWtIV1Uza21CWDdqZzY0?=
 =?utf-8?B?WXExeDZza0pZTUVOVFpwUDFwa3lkOXdSRVNKT2FuRGdtMTR0OENod3VWRjVP?=
 =?utf-8?B?R1AxT2hJOG1xVXRNTGNPM2x3MGhMVmo5QUJQY0NIZFNrVlVabndNM2JsY2Zm?=
 =?utf-8?B?dGdyci9iMmttUnBlRjBuQUdDVG5vTDQyTlBGOXNGYWM4N0w4bmlydjRCRVBn?=
 =?utf-8?B?QkJDNXMxUlhFT0NjRG91MWpDYS9PR2xFYThxQ013SCtHcVE2bmVwbEF5UThC?=
 =?utf-8?B?ZkNmSmt3M3NRbitQaSsrSFRzQWZsYlhaZzFNcUVDMFdJa29KY1BnanhhWDVP?=
 =?utf-8?B?TVBvR2JJNXhLRWpzZ2Q2Y3hsdXVEUzRUUWNoZkxVb2ViOHpOM1VkMDgzN3BQ?=
 =?utf-8?B?bTBVUkhxQWVzVndvZjlPbWE4L2VHcEQ1UkNoN095K2JweHJZRTdXcGFJbjVz?=
 =?utf-8?B?eXMrdkdpVjVIT0FSSm9JdnRiWU1zbFdPUUxOd2lFVm9Bay9sOFRJcUI4aHhW?=
 =?utf-8?B?VlN0YVJmWEJobUV6aTEzb0s4Q1E4V01uNnBRUWRPZkIwNjk1QzJXcjFHTWhh?=
 =?utf-8?B?VUtaUFhhUE1zRkUvOUVXWUNGdEk1K21TQVYvSU0rWk90TGIvT293RmFWSTdr?=
 =?utf-8?B?V2k1dVJ1UWhjTUdXd0JHdGowV3JHaTJTR1lsMStiNmVyZW5KcWYrbndhRE5R?=
 =?utf-8?B?YndxNE9zRktDOTZxWGlJQjEzd1dJTUxIcmRYNVdFYVgrZDdJeEs2QmhSZVRQ?=
 =?utf-8?B?bEVMT0lUVW9xSG1TUFR3QjI4SW5vNms4eVNoQkxyL2pJSnJvS2dSdmZIM0Jh?=
 =?utf-8?B?RFNJZjlnSm42ZEZ1dWZ2aUVOVGZaZHF6VUNzaFJNbUh4bUNrM3RTTGhxREVa?=
 =?utf-8?B?S2dWRDJzdzFXYzZ0V3hma3IvTzZ6dUtVaDJVQUZ5VEhpR3AyWlZRbU8zY1VP?=
 =?utf-8?Q?R5yG+Uq/Nafh+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d149d58d-a5cb-4d00-3aef-08d94dcc3f86
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 11:23:09.0221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIrxapyCT8Mab0yxSWc37Kyz/6S2UopcjipJNA3Y9UKw7hR8V2kQOPRBNNQE2Wls
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
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
Cc: dri-devel@lists.freedesktop.org, "Nieto, David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.07.21 um 13:21 schrieb Tvrtko Ursulin:
>
> On 15/07/2021 10:18, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Same old work but now rebased and series ending with some DRM docs 
>> proposing
>> the common specification which should enable nice common userspace 
>> tools to be
>> written.
>>
>> For the moment I only have intel_gpu_top converted to use this and 
>> that seems to
>> work okay.
>>
>> v2:
>>   * Added prototype of possible amdgpu changes and spec updates to 
>> align with the
>>     common spec.
>
> Not much interest for the common specification?

Well I would rather say not much opposition :)

Of hand everything you do in this patch set sounds absolutely sane to 
me, just don't have any time to review it in detail.

Regards,
Christian.

>
> For reference I've just posted the intel-gpu-top adaptation required 
> to parse it here: 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F446041%2F%3Fseries%3D90464%26rev%3D2&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cc967de8b8c2b499eb25b08d94dcbff2e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637626360837958764%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=07hzP1RuVQkFi8AXWK8i%2Ffu9ajnldcF36PLRrey5wXA%3D&amp;reserved=0.
>
> Note that this is not attempting to be a vendor agnostic tool but is 
> adding per client data to existing i915 tool which uses PMU counters 
> for global stats.
>
> intel-gpu-top: Intel Skylake (Gen9) @ /dev/dri/card0 -  335/ 339 MHz;  
> 10% RC6;  1.24/ 4.18 W;      527 irqs/s
>
>       IMC reads:     3297 MiB/s
>      IMC writes:     2767 MiB/s
>
>          ENGINES BUSY MI_SEMA MI_WAIT
>        Render/3D   78.74% 
> |██████████████████████████████████████████████████████████████████████████▏ 
> |      0%      0%
>          Blitter    0.00% | |      0%      0%
>            Video    0.00% | |      0%      0%
>     VideoEnhance    0.00% | |      0%      0%
>
>    PID              NAME          Render/3D 
> Blitter                      Video                    VideoEnhance
>  10202         neverball |███████████████▎ ||                          
> || ||                          |
>   5665              Xorg |███████▍ ||                          || 
> ||                          |
>   5679     xfce4-session | ||                          || 
> ||                          |
>   5772      ibus-ui-gtk3 | ||                          || 
> ||                          |
>   5775   ibus-extension- | ||                          || 
> ||                          |
>   5777          ibus-x11 | ||                          || 
> ||                          |
>   5823             xfwm4 | ||                          || 
> ||                          |
>
>
> Regards,
>
> Tvrtko
>
>> Tvrtko Ursulin (8):
>>    drm/i915: Explicitly track DRM clients
>>    drm/i915: Make GEM contexts track DRM clients
>>    drm/i915: Track runtime spent in closed and unreachable GEM contexts
>>    drm/i915: Track all user contexts per client
>>    drm/i915: Track context current active time
>>    drm: Document fdinfo format specification
>>    drm/i915: Expose client engine utilisation via fdinfo
>>    drm/amdgpu: Convert to common fdinfo format
>>
>>   Documentation/gpu/amdgpu.rst                  |  26 ++++
>>   Documentation/gpu/drm-usage-stats.rst         | 108 +++++++++++++
>>   Documentation/gpu/i915.rst                    |  27 ++++
>>   Documentation/gpu/index.rst                   |   1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c    |  18 ++-
>>   drivers/gpu/drm/i915/Makefile                 |   5 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  42 ++++-
>>   .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 +
>>   drivers/gpu/drm/i915/gt/intel_context.c       |  27 +++-
>>   drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  24 ++-
>>   .../drm/i915/gt/intel_execlists_submission.c  |  23 ++-
>>   .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
>>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 ++--
>>   drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 +++
>>   drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
>>   drivers/gpu/drm/i915/i915_drm_client.c        | 143 ++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_drm_client.h        |  66 ++++++++
>>   drivers/gpu/drm/i915/i915_drv.c               |   9 ++
>>   drivers/gpu/drm/i915/i915_drv.h               |   5 +
>>   drivers/gpu/drm/i915/i915_gem.c               |  21 ++-
>>   drivers/gpu/drm/i915/i915_gpu_error.c         |   9 +-
>>   drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
>>   23 files changed, 581 insertions(+), 61 deletions(-)
>>   create mode 100644 Documentation/gpu/drm-usage-stats.rst
>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
>>

