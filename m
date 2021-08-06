Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99243E3034
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 22:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1086EC1D;
	Fri,  6 Aug 2021 20:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8F36EC1D;
 Fri,  6 Aug 2021 20:16:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="278184172"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="278184172"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 13:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="513606719"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Aug 2021 13:16:25 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 13:16:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 6 Aug 2021 13:16:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 6 Aug 2021 13:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJm7j3LwJV6bgoCQh94j0i0AfCLLh77uKShzZ6RQ8oAuhqTjVh6BjSNaQZx3npGzdE7mCY0Vq4oefZt+cY30wItCrqaUTdEvXzbb1NI/R6rcoChD5Z9ElmY7F5AgGHx6TnXPMKcuSfJwK+Ux1sRHiWvy9ioKJyB4DY8t2p4b83VX2rq6BhxyZh852vUf5UppOMHwzCFxETxSP1NetimcTSmNDnv2K8Muz98G7iHD3dnIJLmfEdEJsqrSDA79HfaD5KfLVoNHKkb+GRwBgZCpc/yyokFoYPiEN3fsHlCYSYPEK1xcahcdcHO4kaKkN+lMWxIkMSAHbWCYWKo74sok9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uR0IykBKEhMZ53/5ka2GsNm7VKyAEN7GpqHC/kIDONA=;
 b=eVAiPMcXPfE/YUGlRVaFch/QckkBVvCWhz/cK3eeswClFqDyxqkohE0BxlKRxnrVAwjMHT73qFHJ/jQHPpB+4rXa+nuDcPBQcx0ArKfCmRc07ODj+zFqs1wqCf2VyrlNvr2zkzOlOPgaVFArdQJsQgPO9gwTLfzNUP4ePLhatF+sc/EIlpEsD8+5xlpRp0D8bpQ0Pu8tOlfxVZoyLYufly0ZhJV1IDKUp1zroFwkNdtpmZRGSjBsoeObk1SueMaJ1wPtuv3tx27/D+HP4J80gOnoMqRfPftPQdN0HNv8KIFY0iAsTSxniiaKl4DYYs4r9migV/6w3XRdC65TfiPWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uR0IykBKEhMZ53/5ka2GsNm7VKyAEN7GpqHC/kIDONA=;
 b=C5jrRmxqtV6b9HT43+WfHr9X37h1etgHa9xztoFXcHCo27HFIs8cIYXUlsWkxkB9FiTyadKOWvL+ibJte9lKm+soapJe/nLxR6A+fecxt+/97qw9sEWVV5hU92HGMhXJZplWwSQVmoeQbv7wrQ3GJzotqmkIbZ2q6InXckqV2eg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5673.namprd11.prod.outlook.com (2603:10b6:510:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 20:16:23 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4373.026; Fri, 6 Aug 2021
 20:16:23 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix syncmap memory leak
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210730195342.110234-1-matthew.brost@intel.com>
 <de37e95c-b3e1-0479-db7e-e820077beaa3@intel.com>
 <20210806182920.GA104981@DUT151-ICLU.fm.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <a0f63f45-f5ed-91ac-af2a-be5d632f29ce@intel.com>
Date: Fri, 6 Aug 2021 13:16:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210806182920.GA104981@DUT151-ICLU.fm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 BYAPR02CA0021.namprd02.prod.outlook.com (2603:10b6:a02:ee::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 20:16:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a81f72-f1f2-40c4-761d-08d959170fd7
X-MS-TrafficTypeDiagnostic: PH0PR11MB5673:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB567329A970DE97AE0F5CF056BDF39@PH0PR11MB5673.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pBjIaGZAVNDzfiS4i4jjqoRt9kBA6xrHWAaiOq/ul1rhCWqThgliX3h+fCzUy5Y0893fDBzNfk84vCpYg+xiDMHYUN4Lhkpo2AfS+WItv/IZtvQi9ZtINOIeaZnq7yt8+ffC3QpI7q1E1aukCLBDX5FR8cc0Xz16wJrpk4bttaQkU7EyxjGgMP7Hcw7iS93VeVd1T856PDCqvw68TDRqoBCLOk3ytzFY1aQFk17t8TvnqyBXgvZo5goDLoIdEEAb1yDL9jaVMRQt+PFawKu82Z70E/uE7chEdG6NI9w5x5Iaj8xIomETm4l/y7BZuyWSdabHAbRbleh7eIPG7kelu35HSvWfOu3GhABHJ4VNDpAk4t7aS/zk45+wwjMWcvhBCCr2U6OVUqOytCsTUyR3qvKPQVhizQOITDkJ9y9Eu1oSV6LbuEAX4X2FKb7EapnT8YRVho0Jyv3GA+J0U3hNVgDGJqr8q1EAJVeL9VKWFHMF3PsVxpydL9JuqzLTQLKTkI9GWhjXt2MRReWTNpNuhIInKUmXdtVq8TnmEWQSw5MoLlTDX15oypzsc/3umUcRGbSzyfVEeW9BFSBkXvwOcNKFDzVuseHyFCMoqtudBixWRt1BuyN8beckIEDYgZQMeH5GKX+8KkXgBmMHro3vn7TFZb3bwv/AUKDzKEHsOlxjOUZYk3DyF7lx4IUz43663GnkoKQafDU732Cy+7zMaWFkVJuxeubYQTFYTjsdHFHJWZ8oCxXVbSfabUfwcteFragy2cejI8Vh/ha2GYjP3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(4326008)(6636002)(36756003)(83380400001)(53546011)(31696002)(31686004)(478600001)(2906002)(16576012)(38100700002)(26005)(956004)(2616005)(8936002)(5660300002)(6862004)(8676002)(66476007)(186003)(86362001)(6486002)(316002)(66556008)(37006003)(450100002)(66946007)(43740500002)(45980500001)(505234006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGV1U2xXa2cvLzJOb2g1SmFuNG1sT3JmdU4zaHV4OUhzUTRmamdPbGVrdEcz?=
 =?utf-8?B?NjI2dVRVY3JwNG1UME82WXVoNEwzTXFWbDNYWUJRRENsZUhYNHlOSmR0ek9x?=
 =?utf-8?B?ek9DUmdPRVQzVkpKUWYwM2VIZ3ovMFlqcmZ3aUVNTCtyU1U3TFZLQVBuSlBY?=
 =?utf-8?B?ckFWbXhGRFljOWU3dHk1Wk1VMmtMQncxRVBQU2hncHp0SThyZHdGL0hqMWs3?=
 =?utf-8?B?VFFXOEpuZkdtWmVMVVNoZ1BnbGFGaUtsOStRTkVFSmp2SnhuY2wvNzFjQWdR?=
 =?utf-8?B?UVl3Z01waEhOVU1MVjd3cjVHUlRxMVV0ZWxHcUJLeHR1RUJVbDdmMzJ5V3h3?=
 =?utf-8?B?b1FvVCtiS1FPMU90dnBVU0NteEhXb0hQVXZ4ajNOZkswMDRMaEVYaTdaNGcw?=
 =?utf-8?B?RU5CR3hZbHBZUUVIN2RZU1Jjd0c5M1N0Mk5jMmNjMEkvckZNK1lROE80bXYv?=
 =?utf-8?B?SnNkT3VEMmtGbHVmZ3gxejByb1oycTN5bHBqTmVYMHZUc2laUTltK0hMMTFG?=
 =?utf-8?B?SVJTcTY5L09GeUFacElLc200RVFpRWFuTkFPKzFZUUkxM3RPUG9kZGhJeU1W?=
 =?utf-8?B?ZDFmM2ZBc2tXY1RmaVZuVi9uNUk5NTRpL0Y2WmJId282eEZBMmxTN0U1THZG?=
 =?utf-8?B?KytWYzRKZ0x4c2tqdzRGQSs4R1JFWGRnL1V1bXU1TUdaZzZrazVXcHRweita?=
 =?utf-8?B?Sk91R2ZmTGc1UmhaS2h0cEUyOHpPNlpmZEVvdER2TDJnM0txUjl4OTZXWE9t?=
 =?utf-8?B?bFM3STVTd1hxNDlsUXVoT3lOWTQ1NHdzMUhtZkl5U21JYmFNV3Q4YTEvZE1O?=
 =?utf-8?B?QWpkWnBYaytmSUEvb1ZCbzZIWWhtQVVobXlkSEh0WkRDTFBLeUt2UlpDenNO?=
 =?utf-8?B?WDkwOTc4QkQzMVc5ekpvUzFNV0szeWVZQk9sRDdhMzg3UjFqNHNaRnAvM0Ex?=
 =?utf-8?B?R01nbDFYR2FWRzIyQjZDVWVLQU5qVWFnVHJQRWhkS3lFZGlxL2hBa3p2cTV3?=
 =?utf-8?B?SzdBd2JwWVRKczEwMjN2UU9rUnVHUTB5T1g5SkZNUStmWmRKOEVnZ1hZQ3Rl?=
 =?utf-8?B?V0dBN2s1VFZFcEs4RmFtYlNFbHVZc1FaSlNKdG5mSXh2TlFBL3ZEQVVoRzdS?=
 =?utf-8?B?MHZQaUpRN0hHVnlhbmIwVWF4S2gwazU5K2RJWlNUc3huZzZ6Z3gzMXhzdkNT?=
 =?utf-8?B?U05KNHMwT3U1UjkxUXVkVXVqVUF2NDFQRzB6bnVVZ1RjaXVSa2FnVkVSTHNC?=
 =?utf-8?B?RnQrbHU3RjU2SW1IWG5HcXkrNkZ5V1BjTVdBeVdDTGxxODBVMU1jaUExWlNs?=
 =?utf-8?B?TjZLeUdmM1dudzdTZ1lFSDlmU1BkZ2JPdGZkWWovT0NVdm53aG1zS1pBNEMz?=
 =?utf-8?B?ZzE2Sis2QjVpYlEvOERlanpzckt6TFhSR2I5d285Unp2NVBDcllGakVLRlRX?=
 =?utf-8?B?TVZienFzV3kyOG5xc0dtUkxSMVBGZUNFNXg4cjczbUxJTGlrRXd4L3BxSHlD?=
 =?utf-8?B?YWhiclQyT3Q3dzQzY0FnYUlqSkM1YUNUdWxnTWpTdTZNQjlFenVIRGJ2MzIw?=
 =?utf-8?B?dzA2Yk40VFliRjNRdHBTZ3NMSlQxR0JTMWF1ei92VkJrWTNHWUtTM3hyRDlH?=
 =?utf-8?B?bW9lRnpXNnhuRy9udnhGWnZURjdKNDl1dUZteVphYzA3TVVhdXg4U3hSbHZ2?=
 =?utf-8?B?YjBVcFhDK2tCcnpxMndhTmh6Ni9YcDE0bVVPU2cvVEN6SktOUE1Ddmd1U1ZN?=
 =?utf-8?Q?LP97/G+7iR99snXCy1BaONBcvgEl3W8cfocypOn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a81f72-f1f2-40c4-761d-08d959170fd7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 20:16:23.6207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3EeWDLiS8cAWYv0cxqDnHRLkT5XC8WgEdlLPF2CBvW+/nUFE33A2/5xWKfOJEKo43FoQNcPfQT8ZQyVgfBm8zT7cPQMDT+pFdtK7+4ONkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5673
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

On 8/6/2021 11:29, Matthew Brost wrote:
> On Fri, Aug 06, 2021 at 11:23:06AM -0700, John Harrison wrote:
>> On 7/30/2021 12:53, Matthew Brost wrote:
>>> A small race exists between intel_gt_retire_requests_timeout and
>>> intel_timeline_exit which could result in the syncmap not getting
>>> free'd. Rather than work to hard to seal this race, simply cleanup the
>> free'd -> freed
>>
> Sure.
>
>>> syncmap on fini.
>>>
>>> unreferenced object 0xffff88813bc53b18 (size 96):
>>>     comm "gem_close_race", pid 5410, jiffies 4294917818 (age 1105.600s)
>>>     hex dump (first 32 bytes):
>>>       01 00 00 00 00 00 00 00 00 00 00 00 0a 00 00 00  ................
>>>       00 00 00 00 00 00 00 00 6b 6b 6b 6b 06 00 00 00  ........kkkk....
>>>     backtrace:
>>>       [<00000000120b863a>] __sync_alloc_leaf+0x1e/0x40 [i915]
>>>       [<00000000042f6959>] __sync_set+0x1bb/0x240 [i915]
>>>       [<0000000090f0e90f>] i915_request_await_dma_fence+0x1c7/0x400 [i915]
>>>       [<0000000056a48219>] i915_request_await_object+0x222/0x360 [i915]
>>>       [<00000000aaac4ee3>] i915_gem_do_execbuffer+0x1bd0/0x2250 [i915]
>>>       [<000000003c9d830f>] i915_gem_execbuffer2_ioctl+0x405/0xce0 [i915]
>>>       [<00000000fd7a8e68>] drm_ioctl_kernel+0xb0/0xf0 [drm]
>>>       [<00000000e721ee87>] drm_ioctl+0x305/0x3c0 [drm]
>>>       [<000000008b0d8986>] __x64_sys_ioctl+0x71/0xb0
>>>       [<0000000076c362a4>] do_syscall_64+0x33/0x80
>>>       [<00000000eb7a4831>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Fixes: 531958f6f357 ("drm/i915/gt: Track timeline activeness in enter/exit")
>>> Cc: <stable@vger.kernel.org>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_timeline.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
>>> index c4a126c8caef..1257f4f11e66 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
>>> @@ -127,6 +127,15 @@ static void intel_timeline_fini(struct rcu_head *rcu)
>>>    	i915_vma_put(timeline->hwsp_ggtt);
>>>    	i915_active_fini(&timeline->active);
>>> +
>>> +	/*
>>> +	 * A small race exists between intel_gt_retire_requests_timeout and
>>> +	 * intel_timeline_exit which could result in the syncmap not getting
>>> +	 * free'd. Rather than work to hard to seal this race, simply cleanup
>>> +	 * the syncmap on fini.
>> What is the race? I'm going round in circles just trying to work out how
>> intel_gt_retire_requests_timeout is supposed to get to intel_timeline_exit
>> in the first place.
>>
> intel_gt_retire_requests_timeout increments tl->active_count, active_count == 2
> intel_timeline_exit is called, returns on atomic_add_unless, active_count == 1
> intel_gt_retire_requests_timeout decrements tl->active_count, active_count == 0
> i915_syncmap_free is never called, memory leak
>
> Matt
Okay. Think I follow it now.

Seems like the syncmap free should have been in timeline_fini instead of 
timeline_exit in the first place?

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>
>> Also, free'd -> freed.
>>
>> John.
>>
>>
>>> +	 */
>>> +	i915_syncmap_free(&timeline->sync);
>>> +
>>>    	kfree(timeline);
>>>    }

