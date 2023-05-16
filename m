Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECBD7056FB
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 21:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DBA10E367;
	Tue, 16 May 2023 19:21:16 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3164710E360;
 Tue, 16 May 2023 19:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684264873; x=1715800873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=hXGAUbxXyDUd0DGXQsu4SLPjCqF9hqPxd8j757hCRGU=;
 b=HKh13eZ5xi4Wu32Zt6p2TC96dTVgONLuA58LtGg4ZHqDQymk1ksjrmQ+
 0eF4kFpymvg0Kx7rDHwZ+ZkaPuXEZ0ym3mtay1S1XmGx1uAGa2zNWndtK
 Nt62OQw3BmYWBfC3SNUt4txWtDaUKsIoP/QdUFg9/SBjvVxWrhBeJ0Vyz
 vigo0z34Si2D2t5yGC6XAl4Gc6wk3PrphiJUY8xNiMh120Tf+8wG0KBx/
 EoqfDqvXbFGwCpn7mReYqlwoPvvZxuAOOq2HW/76PpNpC2nowt0Qp68kD
 HZtN/W/3xUITyjsBlcXHEp/Q1tRdbqNRff0U9ShfQuQ6slZbrTXYvp2G2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="353854337"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
 d="scan'208,217";a="353854337"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 12:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="947965758"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
 d="scan'208,217";a="947965758"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 16 May 2023 12:21:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 12:21:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 12:21:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 12:21:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 12:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxtgJ/XAhSpqMB2QRcHDvBcmRilbNkEM5crmFmiPspbmqzSMj+PJe6p3W2Mkmktl/J2QLDQAoGZX0T6MvEjUA8Goza7ugruq6vW35/dG6Z7IEJ9Q4znlSfPCf0lGbnmg8D4dDSJn6DGz5MaBl672gYKtd7F+dv5KCBBHyypd1Vp3JGQeg9bI8nFKBMtJCIz9I6wx63jSp93uCFmi+rjh6KI7w41aGeJu/UJKtLX5UrPrINTYRdt1GzvlGmusRDZ2bsPSRgEPd3QnlYsQ2NyzzjModTn+Hbpp3hKv7k8rl0Ly+VsQ4u1E0HLZKjcktQZ0z+wiSdSND2wWsYtcmROJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ze0i58uZTvmtH3DLhJytjPiXJcb/hnkW0+X1+9RH4AQ=;
 b=drBOAzi6CrcDDp6TcfCZJzeI7Tj9POkTHDUcE+MPHgzw77J/uOC9M0hSWQMutJoPRe0d+uWvjN0UALgaKQ6i6CJ4CPN5zTShgYh73KW7GpTENVc1ksQSiuiC53kVEZCCgWbpXbSgiJn4EG0u2abV+k8lHI3Qz5d7tGXRd3cC0TiDsqEf7cMGYGS7yril5wUU41Ap63w9r5/8ZLPtlM/KT3hzMf5luKxqHkjkFMiFGfdJl76f0dRC2Kongqubz7/u6pJ6IXdtfxHRo1gZ1Y3En/QBf2R91gyx732m0YrLPwQCUxW3RUPTdZJw9fZRqOOBoHLo2H+GimbQh1IpRZYGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB7494.namprd11.prod.outlook.com (2603:10b6:510:283::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Tue, 16 May
 2023 19:21:08 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 19:21:08 +0000
Content-Type: multipart/alternative;
 boundary="------------m7cUoolTSnVaysT0nQ0timzx"
Message-ID: <61e0ef39-308b-7384-d5db-8cad2a152729@intel.com>
Date: Tue, 16 May 2023 12:21:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915: Dump error capture to kernel
 log
Content-Language: en-GB
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
 <20230418181744.3251240-2-John.C.Harrison@Intel.com>
 <696ba7f2-4353-e154-af0b-83604dda2546@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <696ba7f2-4353-e154-af0b-83604dda2546@intel.com>
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1a7e77-54a2-42cf-2df8-08db5642b33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvpDfzQFEIzvE0qwU5ZdZ2AaNMFYHVw6s8QaPaCl4Niy0czit3umfWCTLo0PIepY8T1EArwMO9y36qSeNxj5OstVYupS+X1NTUzjVu1Y2UMzHfSANJ05YFH66VwZawDsEqrsnOYYjOmqmEUpHcyLc+WmRqvpZPd0P9MnvazWd/9tcRESvWzONsndnF/ydYjaq8rO7h7eQN99T34suKu+QTKhTl0+N1x3vHTC7Weq5LQR6l6EXd9CPEPLJFbzaK93DWrBFFVAUV2tFBNlCJcBAPrhytlJC1m/WWc1yt9zuE7gzfTC9eCCrdJjCsWyraL8QDRGYVv+4fbwm7dVeOuXy6xXU6AgZslRwM4+NGw7sU+iIgGoI5vOPyN5T+E1wX4rOVvt0StVkcvNpQVBR61O/VGthGWoYRy2FMtdksJl4L7PygIsWJOM5ufbSbocwLuIsjCdHU7YmYCV6T43/vFsfDZchIzretXOYzJ8EXM3WyRfENeBfGlLF+w1rgse9Rw8jbTkKNovDCO/EnR0Tlo7X9G2z0Ho9OB/LW3c+RqsGZUmojWWF4XkwntJRe1BA6iBwDOlKL/tUIWnh0HUqt0AoQxBcqDMfSaGLx1qf/8eE4zjAGWkGYVfJQG1aJZhQDNkLlkfjCrNYvPD7UpkYlJJ+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(31686004)(33964004)(4326008)(6486002)(66556008)(66946007)(66476007)(450100002)(316002)(86362001)(478600001)(36756003)(83380400001)(26005)(186003)(53546011)(2616005)(6506007)(6512007)(5660300002)(8936002)(8676002)(41300700001)(6666004)(30864003)(82960400001)(31696002)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDRKeVRiQXpJRmtYSVZEWUxnV2pLWEdVTWlodUxyUmxKMzVmaW9oazB6a0Zj?=
 =?utf-8?B?REFUU1Q5ZjZHOE5zZVpqdVVibXJVUnM1RENUaFBIRlNEb1ZqNS9WaW9MNkNw?=
 =?utf-8?B?NUcrd1VKVXdwZHVORm9IcFlIVUx5M3YwREU0OFBSVW9OVVFncFhoMlB0NGlQ?=
 =?utf-8?B?L3BJQ1p0YTBCdEl5VmQ1Zk5zQmRqOVkyNmdjbGw0SG8yZFg4SEJsZ0xhVC9w?=
 =?utf-8?B?ZlI3SGZXeC91a1ZOVTMvT2xKRkpYL1VCN3QxekRlV1VYL0huQjhMMysxeEVh?=
 =?utf-8?B?dm05a09la2RrRC8yUERzR3VHSEo3cWVtcEtLK2NONGhrbTd5ME16aTJWREZx?=
 =?utf-8?B?eHlVRUFvYjVIaEZpdzBVTEVDeWN6RHdrNzJCV05jYkpoOEdrNlEvdHhpam5z?=
 =?utf-8?B?VER0cXlWTzM1dHJBSnl6K1hFTDdPMUUvSkZLOCtXK2hLUjFPcy9QUHMrYThj?=
 =?utf-8?B?eVRjNWRCSDNlN3ZmQjdMcXdqWmdlblBwSjZFWDJMaVdyZnphdDM3UmpwTnE1?=
 =?utf-8?B?M0t2Ukx1c2g0TTFVeVUwL2VqQVd5V3huOXRtdzF1dlcyWDZEMEU5SlFBa1J3?=
 =?utf-8?B?RHpaUUtLQ0V0b01zYTVNaFNVTkpZT283cjd5Y2Y3emgwUWMvVGF0TmltVUpl?=
 =?utf-8?B?ZkJlVmtzcEtqL0dmb1RoS3RvbGlxczhPWkdHK1N5RCsvYlR6dEQyMkt4SkFI?=
 =?utf-8?B?ZzkrbkppTE5Zb0lCYW92T2FFb2lUdTlWWktrY2QrWEhOYmJVaFRuR0krSDB5?=
 =?utf-8?B?WGFyakxjaGdPQ2ZNQ2lKWUdQQVJ1UnNObGF4am5oblo1dUtuTjZxUm9OOS9X?=
 =?utf-8?B?QzdMSURBekJBaWdEYTZBNzVGeFBxUUdNa1JpeWdqUFQ5K2hCRHBlWVIxb0Js?=
 =?utf-8?B?MEQyaERhVXVDcjNjTUlZWldndXVlTDdZaVFvVFVuLzM5cU5vVHlHNHRUcW9x?=
 =?utf-8?B?Q2VkODA2czJlcDlQOGlQNTNQRWtZVGJzeU9kU3ROVStPU1lRZmhhczc1V3d0?=
 =?utf-8?B?NlpKaG5IMFFEQWVXcExmZVp4ZjdmWlJWMkpEVjdQWWYreXY0NjhUbzc3aVVX?=
 =?utf-8?B?M1kvNU1PSHU5eEx1YVFCdXViKzRsZ01udW5mbjFvZTdSM1NVazFyMDNnckpV?=
 =?utf-8?B?QWdicDY0NHhLVk8wN0RGYjlmTmQyL2toWEFpZXNwTUtFcDF4RVU5ZlVrVms1?=
 =?utf-8?B?dWFmT3QzV0hFdlUzakN1VDlsY1QrcjJLZEQ5blM2YjRoUVBhd0JQWndqQ01q?=
 =?utf-8?B?WExwektMb3M4cllUT3BPR05MUDZyWGJYN1RHa0xPaWdiZGdJdTUzdjlXSjFZ?=
 =?utf-8?B?ZUNrSENGNFYvU0phNlFIc1ZMTG13dmF1aGx4VU84a3BuMTNHV0t5MS93Njdm?=
 =?utf-8?B?Zi9qbnJrRElsTXpWdTcrOTFqSW1wYTV0dHJOeVpTUGVkZEpHbDRLQmwwb2wz?=
 =?utf-8?B?QnBjS1BNZURtd2lDUlQwUWJnYmUxSmJySmFud0MwUVdTZmFiRDRaMnpIeHlN?=
 =?utf-8?B?dEh4WUY5MG9QRWZLc0hhL2t0M0pEYlN6OVZBMmp6UkQ5VTE5d2lzVkhJOXpW?=
 =?utf-8?B?NWFoQlNOSlFLRUhOVFBPdzJGTFdlOHVvWFpsbUYrNUpjOTBkYVZJVmhuK08w?=
 =?utf-8?B?UmRHNzVIS3VrSWhFSnBlZ0xwbW1DVHhkck44akdZY0EwaDk3akVDOEtldjJG?=
 =?utf-8?B?Ly8xdml5cmtNTlUyTmNOUlBjQjU1Rnd5ZUJwcm5Ca0Y4bWxTSkxlZzVUcm4z?=
 =?utf-8?B?bVpMVEZRMGQzckZRS2FBUXE3Wkw0UXdGdXdWSEFMcWZKMGxBYjFTWUkwNmdk?=
 =?utf-8?B?WGsxbGt5VTBId3VDMTJ1VFJoYlRkdVJYY3dvU090SjZiemJ5SVZJcVdiOGJK?=
 =?utf-8?B?USs5UTRMazRyTXdpY0lGdUozakxKVSt5b1pRUFpUNEVuaXZDQ09oZmZ2akN2?=
 =?utf-8?B?cWozbFczOFhYQkVlbE5UdTRqZkwrWXNMdHdoWXMwWnJxYW5KdXpNT1ZXWjJ5?=
 =?utf-8?B?Q1djWnMrRVAvWUZxbTlKaTdWczNzWFltbGlEQ1FNN0I0czRSVWdvYXBWdGt0?=
 =?utf-8?B?TzJZWmlLa1ZwVXA2cW1Fam1YYUZQZFZuTlZZcGVJOEF1ek9OcnZ3ZXVPOWFj?=
 =?utf-8?B?WXN6UUtiM1Z0Mi82M2NyWHduRlNxOENMQlU1MHFGcGNid0k3WEx5NWdpSHdv?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1a7e77-54a2-42cf-2df8-08db5642b33a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 19:21:07.9810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwJ+b4QfbPn29pSNFUV9e0lpt3/0BCi+wN6J3fJlH01P9/jK3i7v+gq1hYZ9/FWPrGGexcPHcv2osQxhs1/oNfZ9R2at3M2N22AFCkZ4xDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7494
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

--------------m7cUoolTSnVaysT0nQ0timzx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/2023 12:17, Belgaumkar, Vinay wrote:
> On 4/18/2023 11:17 AM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> This is useful for getting debug information out in certain
>> situations, such as failing kernel selftests and CI runs that don't
>> log error captures. It is especially useful for things like retrieving
>> GuC logs as GuC operation can't be tracked by adding printk or ftrace
>> entries.
>>
>> v2: Add CONFIG_DRM_I915_DEBUG_GEM wrapper (review feedback by Rodrigo).
>
> Do the CI sparse warnings hold water? With that looked at,
You mean this one totally fatal and absolutely must be fixed error?

    Fast mode used, each commit won't be checked separately.


Does anyone even know what that means or why it (apparently totally 
randomly) hits some patch sets and not others?

If you mean the checkpatch warnings. One is about not reporting out of 
memory errors (because you are supposed to return -ENOMEM and let the 
user handle it instead), but that doesn't apply for an internal kernel 
only thing which is already just a debug print. The other is about macro 
argument re-use, which is not an issue in this case and not worth 
re-writing the code to avoid.

John.


>
> LGTM,
>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 132 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_gpu_error.h |  10 ++
>>   2 files changed, 142 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index f020c0086fbcd..03d62c250c465 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -2219,3 +2219,135 @@ void i915_disable_error_state(struct 
>> drm_i915_private *i915, int err)
>>           i915->gpu_error.first_error = ERR_PTR(err);
>>       spin_unlock_irq(&i915->gpu_error.lock);
>>   }
>> +
>> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>> +void intel_klog_error_capture(struct intel_gt *gt,
>> +                  intel_engine_mask_t engine_mask)
>> +{
>> +    static int g_count;
>> +    struct drm_i915_private *i915 = gt->i915;
>> +    struct i915_gpu_coredump *error;
>> +    intel_wakeref_t wakeref;
>> +    size_t buf_size = PAGE_SIZE * 128;
>> +    size_t pos_err;
>> +    char *buf, *ptr, *next;
>> +    int l_count = g_count++;
>> +    int line = 0;
>> +
>> +    /* Can't allocate memory during a reset */
>> +    if (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>> +        drm_err(&gt->i915->drm, "[Capture/%d.%d] Inside GT reset, 
>> skipping error capture :(\n",
>> +            l_count, line++);
>> +        return;
>> +    }
>> +
>> +    error = READ_ONCE(i915->gpu_error.first_error);
>> +    if (error) {
>> +        drm_err(&i915->drm, "[Capture/%d.%d] Clearing existing error 
>> capture first...\n",
>> +            l_count, line++);
>> +        i915_reset_error_state(i915);
>> +    }
>> +
>> +    with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>> +        error = i915_gpu_coredump(gt, engine_mask, 
>> CORE_DUMP_FLAG_NONE);
>> +
>> +    if (IS_ERR(error)) {
>> +        drm_err(&i915->drm, "[Capture/%d.%d] Failed to capture error 
>> capture: %ld!\n",
>> +            l_count, line++, PTR_ERR(error));
>> +        return;
>> +    }
>> +
>> +    buf = kvmalloc(buf_size, GFP_KERNEL);
>> +    if (!buf) {
>> +        drm_err(&i915->drm, "[Capture/%d.%d] Failed to allocate 
>> buffer for error capture!\n",
>> +            l_count, line++);
>> +        i915_gpu_coredump_put(error);
>> +        return;
>> +    }
>> +
>> +    drm_info(&i915->drm, "[Capture/%d.%d] Dumping i915 error capture 
>> for %ps...\n",
>> +         l_count, line++, __builtin_return_address(0));
>> +
>> +    /* Largest string length safe to print via dmesg */
>> +#    define MAX_CHUNK    800
>> +
>> +    pos_err = 0;
>> +    while (1) {
>> +        ssize_t got = i915_gpu_coredump_copy_to_buffer(error, buf, 
>> pos_err, buf_size - 1);
>> +
>> +        if (got <= 0)
>> +            break;
>> +
>> +        buf[got] = 0;
>> +        pos_err += got;
>> +
>> +        ptr = buf;
>> +        while (got > 0) {
>> +            size_t count;
>> +            char tag[2];
>> +
>> +            next = strnchr(ptr, got, '\n');
>> +            if (next) {
>> +                count = next - ptr;
>> +                *next = 0;
>> +                tag[0] = '>';
>> +                tag[1] = '<';
>> +            } else {
>> +                count = got;
>> +                tag[0] = '}';
>> +                tag[1] = '{';
>> +            }
>> +
>> +            if (count > MAX_CHUNK) {
>> +                size_t pos;
>> +                char *ptr2 = ptr;
>> +
>> +                for (pos = MAX_CHUNK; pos < count; pos += MAX_CHUNK) {
>> +                    char chr = ptr[pos];
>> +
>> +                    ptr[pos] = 0;
>> +                    drm_info(&i915->drm, "[Capture/%d.%d] }%s{\n",
>> +                         l_count, line++, ptr2);
>> +                    ptr[pos] = chr;
>> +                    ptr2 = ptr + pos;
>> +
>> +                    /*
>> +                     * If spewing large amounts of data via a serial 
>> console,
>> +                     * this can be a very slow process. So be 
>> friendly and try
>> +                     * not to cause 'softlockup on CPU' problems.
>> +                     */
>> +                    cond_resched();
>> +                }
>> +
>> +                if (ptr2 < (ptr + count))
>> +                    drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",
>> +                         l_count, line++, tag[0], ptr2, tag[1]);
>> +                else if (tag[0] == '>')
>> +                    drm_info(&i915->drm, "[Capture/%d.%d] ><\n",
>> +                         l_count, line++);
>> +            } else {
>> +                drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",
>> +                     l_count, line++, tag[0], ptr, tag[1]);
>> +            }
>> +
>> +            ptr = next;
>> +            got -= count;
>> +            if (next) {
>> +                ptr++;
>> +                got--;
>> +            }
>> +
>> +            /* As above. */
>> +            cond_resched();
>> +        }
>> +
>> +        if (got)
>> +            drm_info(&i915->drm, "[Capture/%d.%d] Got %zd bytes 
>> remaining!\n",
>> +                 l_count, line++, got);
>> +    }
>> +
>> +    kvfree(buf);
>> +
>> +    drm_info(&i915->drm, "[Capture/%d.%d] Dumped %zd bytes\n", 
>> l_count, line++, pos_err);
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h 
>> b/drivers/gpu/drm/i915/i915_gpu_error.h
>> index a91932cc65317..a78c061ce26fb 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
>> @@ -258,6 +258,16 @@ static inline u32 i915_reset_engine_count(struct 
>> i915_gpu_error *error,
>>   #define CORE_DUMP_FLAG_NONE           0x0
>>   #define CORE_DUMP_FLAG_IS_GUC_CAPTURE BIT(0)
>>   +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) && 
>> IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>> +void intel_klog_error_capture(struct intel_gt *gt,
>> +                  intel_engine_mask_t engine_mask);
>> +#else
>> +static inline void intel_klog_error_capture(struct intel_gt *gt,
>> +                        intel_engine_mask_t engine_mask)
>> +{
>> +}
>> +#endif
>> +
>>   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>>     __printf(2, 3)

--------------m7cUoolTSnVaysT0nQ0timzx
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 5/16/2023 12:17, Belgaumkar, Vinay wrote:<br>
    <blockquote type="cite" cite="mid:696ba7f2-4353-e154-af0b-83604dda2546@intel.com">
      On 4/18/2023 11:17 AM, <a class="moz-txt-link-abbreviated" href="mailto:John.C.Harrison@Intel.com">John.C.Harrison@Intel.com</a> wrote:
      <br>
      <blockquote type="cite">From: John Harrison
        <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
        <br>
        <br>
        This is useful for getting debug information out in certain
        <br>
        situations, such as failing kernel selftests and CI runs that
        don't
        <br>
        log error captures. It is especially useful for things like
        retrieving
        <br>
        GuC logs as GuC operation can't be tracked by adding printk or
        ftrace
        <br>
        entries.
        <br>
        <br>
        v2: Add CONFIG_DRM_I915_DEBUG_GEM wrapper (review feedback by
        Rodrigo).
        <br>
      </blockquote>
      <br>
      Do the CI sparse warnings hold water? With that looked at,
      <br>
    </blockquote>
    You mean this one totally fatal and absolutely must be fixed error?<br>
    <blockquote>
      <pre class="moz-quote-pre" wrap="">Fast mode used, each commit won't be checked separately.</pre>
    </blockquote>
    <br>
    Does anyone even know what that means or why it (apparently totally
    randomly) hits some patch sets and not others?<br>
    <br>
    If you mean the checkpatch warnings. One is about not reporting out
    of memory errors (because you are supposed to return -ENOMEM and let
    the user handle it instead), but that doesn't apply for an internal
    kernel only thing which is already just a debug print. The other is
    about macro argument re-use, which is not an issue in this case and
    not worth re-writing the code to avoid.<br>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:696ba7f2-4353-e154-af0b-83604dda2546@intel.com">
      <br>
      LGTM,
      <br>
      <br>
      Reviewed-by: Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a>
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/i915/i915_gpu_error.c | 132
        ++++++++++++++++++++++++++
        <br>
        &nbsp; drivers/gpu/drm/i915/i915_gpu_error.h |&nbsp; 10 ++
        <br>
        &nbsp; 2 files changed, 142 insertions(+)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c
        b/drivers/gpu/drm/i915/i915_gpu_error.c
        <br>
        index f020c0086fbcd..03d62c250c465 100644
        <br>
        --- a/drivers/gpu/drm/i915/i915_gpu_error.c
        <br>
        +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
        <br>
        @@ -2219,3 +2219,135 @@ void i915_disable_error_state(struct
        drm_i915_private *i915, int err)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915-&gt;gpu_error.first_error = ERR_PTR(err);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock_irq(&amp;i915-&gt;gpu_error.lock);
        <br>
        &nbsp; }
        <br>
        +
        <br>
        +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
        <br>
        +void intel_klog_error_capture(struct intel_gt *gt,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_engine_mask_t engine_mask)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; static int g_count;
        <br>
        +&nbsp;&nbsp;&nbsp; struct drm_i915_private *i915 = gt-&gt;i915;
        <br>
        +&nbsp;&nbsp;&nbsp; struct i915_gpu_coredump *error;
        <br>
        +&nbsp;&nbsp;&nbsp; intel_wakeref_t wakeref;
        <br>
        +&nbsp;&nbsp;&nbsp; size_t buf_size = PAGE_SIZE * 128;
        <br>
        +&nbsp;&nbsp;&nbsp; size_t pos_err;
        <br>
        +&nbsp;&nbsp;&nbsp; char *buf, *ptr, *next;
        <br>
        +&nbsp;&nbsp;&nbsp; int l_count = g_count++;
        <br>
        +&nbsp;&nbsp;&nbsp; int line = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Can't allocate memory during a reset */
        <br>
        +&nbsp;&nbsp;&nbsp; if (test_bit(I915_RESET_BACKOFF, &amp;gt-&gt;reset.flags))
        {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err(&amp;gt-&gt;i915-&gt;drm, &quot;[Capture/%d.%d]
        Inside GT reset, skipping error capture :(\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; error = READ_ONCE(i915-&gt;gpu_error.first_error);
        <br>
        +&nbsp;&nbsp;&nbsp; if (error) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err(&amp;i915-&gt;drm, &quot;[Capture/%d.%d] Clearing
        existing error capture first...\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915_reset_error_state(i915);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; with_intel_runtime_pm(&amp;i915-&gt;runtime_pm, wakeref)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error = i915_gpu_coredump(gt, engine_mask,
        CORE_DUMP_FLAG_NONE);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (IS_ERR(error)) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err(&amp;i915-&gt;drm, &quot;[Capture/%d.%d] Failed to
        capture error capture: %ld!\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++, PTR_ERR(error));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; buf = kvmalloc(buf_size, GFP_KERNEL);
        <br>
        +&nbsp;&nbsp;&nbsp; if (!buf) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err(&amp;i915-&gt;drm, &quot;[Capture/%d.%d] Failed to
        allocate buffer for error capture!\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915_gpu_coredump_put(error);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; drm_info(&amp;i915-&gt;drm, &quot;[Capture/%d.%d] Dumping i915
        error capture for %ps...\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++, __builtin_return_address(0));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Largest string length safe to print via dmesg */
        <br>
        +#&nbsp;&nbsp;&nbsp; define MAX_CHUNK&nbsp;&nbsp;&nbsp; 800
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; pos_err = 0;
        <br>
        +&nbsp;&nbsp;&nbsp; while (1) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t got = i915_gpu_coredump_copy_to_buffer(error,
        buf, pos_err, buf_size - 1);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (got &lt;= 0)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buf[got] = 0;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos_err += got;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr = buf;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (got &gt; 0) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t count;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char tag[2];
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next = strnchr(ptr, got, '\n');
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (next) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count = next - ptr;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *next = 0;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tag[0] = '&gt;';
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tag[1] = '&lt;';
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count = got;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tag[0] = '}';
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tag[1] = '{';
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count &gt; MAX_CHUNK) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t pos;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *ptr2 = ptr;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (pos = MAX_CHUNK; pos &lt; count; pos +=
        MAX_CHUNK) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char chr = ptr[pos];
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr[pos] = 0;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;i915-&gt;drm,
        &quot;[Capture/%d.%d] }%s{\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++, ptr2);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr[pos] = chr;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr2 = ptr + pos;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If spewing large amounts of data via a
        serial console,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * this can be a very slow process. So be
        friendly and try
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * not to cause 'softlockup on CPU'
        problems.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cond_resched();
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ptr2 &lt; (ptr + count))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;i915-&gt;drm,
        &quot;[Capture/%d.%d] %c%s%c\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++, tag[0], ptr2,
        tag[1]);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (tag[0] == '&gt;')
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;i915-&gt;drm,
        &quot;[Capture/%d.%d] &gt;&lt;\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;i915-&gt;drm, &quot;[Capture/%d.%d]
        %c%s%c\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++, tag[0], ptr, tag[1]);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr = next;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got -= count;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (next) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr++;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got--;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* As above. */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cond_resched();
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (got)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;i915-&gt;drm, &quot;[Capture/%d.%d] Got
        %zd bytes remaining!\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_count, line++, got);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; kvfree(buf);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; drm_info(&amp;i915-&gt;drm, &quot;[Capture/%d.%d] Dumped %zd
        bytes\n&quot;, l_count, line++, pos_err);
        <br>
        +}
        <br>
        +#endif
        <br>
        diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h
        b/drivers/gpu/drm/i915/i915_gpu_error.h
        <br>
        index a91932cc65317..a78c061ce26fb 100644
        <br>
        --- a/drivers/gpu/drm/i915/i915_gpu_error.h
        <br>
        +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
        <br>
        @@ -258,6 +258,16 @@ static inline u32
        i915_reset_engine_count(struct i915_gpu_error *error,
        <br>
        &nbsp; #define CORE_DUMP_FLAG_NONE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0
        <br>
        &nbsp; #define CORE_DUMP_FLAG_IS_GUC_CAPTURE BIT(0)
        <br>
        &nbsp; +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) &amp;&amp;
        IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
        <br>
        +void intel_klog_error_capture(struct intel_gt *gt,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_engine_mask_t engine_mask);
        <br>
        +#else
        <br>
        +static inline void intel_klog_error_capture(struct intel_gt
        *gt,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel_engine_mask_t engine_mask)
        <br>
        +{
        <br>
        +}
        <br>
        +#endif
        <br>
        +
        <br>
        &nbsp; #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
        <br>
        &nbsp; &nbsp; __printf(2, 3)
        <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------m7cUoolTSnVaysT0nQ0timzx--
