Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630B969B38E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 21:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C29310F0BE;
	Fri, 17 Feb 2023 20:13:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425D10F0BE;
 Fri, 17 Feb 2023 20:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676664798; x=1708200798;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S8FDzUbax0PWvRjxqc5FOwCncKflLW5k8OwD0ChIJrs=;
 b=KTXN1PBY+zRtQG6CaLXEX5MihP+DBntEml3PTenhshwKCL8Dp1jqTb1U
 ntzfelhS2l0J6eNRu0cNzNTI4nUDGagbov3OyPFWUU4xb5ce+OfvarnEv
 ouo0nPQ5ffQwHYtk3JZuLkJaa8i9hHsNk2F1R/IplSENPp1/4p9pL+sR7
 t5iQ0UwqKQ/T9MwgfQBG0KMVhEviq3Z14KJMH3izeaJIJ1kmHV5GneivY
 9kyfP4i0q+otftl9Vy3bWANDzdweWaqxY8tX6aDRZU8LQxvqMRbSJySpW
 tcidUwF9KpwV4zZSUm+rTusK7uiBcfUo0kGQDvpyGOV4Rm4EP0x5EN867 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="312445669"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="312445669"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 12:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="648192218"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="648192218"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 17 Feb 2023 12:13:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:13:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 12:13:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 12:13:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9o5BZmsWhwNmTJn73wXTHHBmkxHW+z0gTiYl5kBx95poNSnk8ZEGx7Y62WGb4oJLOIiU3xGI3b1CXaZ6ok71ikD/yWSyksJpBotRysGRgPPIYm8JGK+PIZKEKM+jOGNxdwSCWhZ1+jewk+cQGMlu7sE5hXEMCS7o6r64j5UtcIHkBjHuo7y7VDVT5iTswfZkBY9uEPU9KkDiZFFdSuRGXe3NqdZEeVoSIMPhnNI7iPO7oC2NghBXAKxwDpaodj+Q0cGuf15QTzn+McEWQCbCoSU8F0/YxHVxYWOFe0fOI0hSndPA1CjL18PscdBTppWJUZexiLha4Fa7K05cef2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Srwu/E8TVizrDh2KVxzeyAMt8znaToGNW+BLI3ZDNOs=;
 b=Ou3pZXzlzAw1d9udB01Rwit77W0yYA1VCJzltgui/vqc+5Yvo/xkNl8tgex8i7A21oO6tAgvP9oSLqQmYqJjXvNmdzI/zzLps94wFelDAkYkuhlLndjQPF/BLVsybAkHeqIHTmo2bfMqneqI+fOZq3VQ7heJGQQhpnDKeLv9k3LNT9ukUwI0WjUEvPYcYGDE/QVzwIYg76AiRqsMQiop9jlAmFwRo8nnhC0oNg8I/8R4yGAYu5T+TKsR8m8mOuehsdyBiM1oIb3CCR/xO/XWi+eGojYfPt2+vpsFfNoS8UERlDpydzNSgFPXTc8yjgZbDqZ0xZwEkdeqjtQxwpaJyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 17 Feb
 2023 20:13:14 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 20:13:14 +0000
Message-ID: <e2629520-3738-38b5-c1e9-53dc035ee1c6@intel.com>
Date: Fri, 17 Feb 2023 12:13:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.2
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/guc: Improve clean up of
 busyness stats worker
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112015447.2430224-1-John.C.Harrison@Intel.com>
 <20230112015447.2430224-2-John.C.Harrison@Intel.com>
 <44ddb672-5265-7a1b-47d5-758b0e456043@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <44ddb672-5265-7a1b-47d5-758b0e456043@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0020.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 63870343-e324-4aa7-fbcb-08db11236673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WSwVyGhtB1VgljioQkdpDc//nn7W5qsupI45io6i54KnLnLLsF6nQgEyR/HbgYISL0Iyt7TzhRalLCPFs4PAsNtMjMb/+hRn89G/YX6GmXInnCBynwS25rAbyoOy58i9y21y961EQ9ljK7tCpi9qdnN93GQr2WDPLykgBxjtbjVgdGfZN84AuZoUePDPpuBz70Mg1KKyBs+tKxZ4dk0qn6VPpgNTRNc4r8Rr3y84GamyZeoF4o4K8f1OGRym5Dj00cj3eKbbNwmuS0trIIimHQU0FQrH6rQ7C2asdQ4CNVgH37HoPbsCy2Q4Rs+uyNsv0Ex9eahVyp/qRB3mDleWwBlJKseHGQQ5ParWeoWg4rEUeQkVYo4K/tb4pre0/OxYCRwgeru7TDg45V2pEUz90cFvLCzurBE9tPAxZoAvSXMquSdhxNqNjzR4szeozannr+jUyz6NE0R1QEVlOPsMbr55u15jHpz1KK43BRjKRNvjX5oQmpkkRxQLs+VdH1npHrmW4h6XNGh1jydk6LR+gqyhmIgUhyJGS9jSv8jNMvOcS/JOVTFnXrLxRrfy6cHUUcPvEDoUepxFA3SpGHO9rjKfc1qSb2/r4EnFDhmgEPyWaEF6JxnMAYYovzSNOvobNIFdebmhfLnGTtZqMiUYyX11Yg7DS6WLySxGJjstlmLOVSu8Ocgo1bmvkN9ptobYJNNhx6S3259A5g38bUcU4U90t3AD030SMQaOGztIWIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199018)(36756003)(31696002)(86362001)(8936002)(450100002)(82960400001)(316002)(4326008)(6486002)(66476007)(66556008)(8676002)(41300700001)(5660300002)(66946007)(2906002)(38100700002)(83380400001)(6512007)(478600001)(53546011)(6506007)(2616005)(26005)(186003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWdrb3FsVDBablFKR0FlQzRpTG1JN2lYcXhUNC9sSXBhV1Q4YjlNSEIwUElx?=
 =?utf-8?B?cGRTdE54QlA5WmJ4WlpBQjU2SUE4SWtJTUVYdU5YRnlQRjQwc0YvakZ0MzRo?=
 =?utf-8?B?MHlINk9DdVI1ZHhZSlQ1L0kwV3B4eXM5T21zRFlERTN6RjhGNjZLeUFBZlRT?=
 =?utf-8?B?dTUybXZqd29IYWZQTmNtYUlqZ0puWW03SmgzSHZ5c1MrUGZkRW16QUxyNWh0?=
 =?utf-8?B?RkdQY0xrbUhOSGlUYVN0OTdxK1FGaEdpMk5YVUI1cGZ3NzFqL1ZuYkFiUjEv?=
 =?utf-8?B?WkpxMUt5Q1NWS3FsM2VVZ2xxSUF2QnEwVjZMRUh3TWRiRklOY3pXd2lVbCsz?=
 =?utf-8?B?c1V5QjMyWUpZS2lxbElpblpYR1BUZlFiQ3ZGYXE2b1E5dVhja0pjNlorQ0dJ?=
 =?utf-8?B?ZTVIZ0xFYzNDelZDR0tOYlV3OVZoMkVnWllSNGg2YlY3Y0ZEWVZBaWg5eWpH?=
 =?utf-8?B?TkVocCtGVFRGWDdZZC9reld2Q0J1QmVSelRGYUdsd3VmRkZ6SHR2RjJwYWlF?=
 =?utf-8?B?cXpMU3FrMlI0V1NGRnpGL2xTdjFEMUlzNUFDOXU0b0RMYkZSMVFEQUIrU1NZ?=
 =?utf-8?B?bVJmd01hVUJ3NFcvNEhCMzNWR21LV29uVEJZN2pXcDZPaHhqaTdRdUZOMDVF?=
 =?utf-8?B?cDAzZXVxYzZ6MGFlMEpKdnZQTFI2U3VnbEtGdy9lQVRwUUQwblJQZEdMaG9X?=
 =?utf-8?B?TmVMUkdWdjJaUFIxUlplZkU2Vzd2M2poejhMMU9QQXVpcnZvSFdqMzVZOGdl?=
 =?utf-8?B?L3NOdnZrcE51aVo5VWdvSU9OeXF5OHlteGtDZmYxcHdWM1kvdGxDaURMYVVt?=
 =?utf-8?B?Snh4c2tycFdJbTZIQisyMEREeGYxdkRtR09ob2ZzSGJKUi9GQ2pLeDd2M2Zh?=
 =?utf-8?B?V2IrcnE3L0Q5T1BlY1VNOHRSMld5QkxsR2g5TGYxYmVpNk1CVjl0TFJXYWw4?=
 =?utf-8?B?NTJWRENyV1FrQ2ZuRVp3ZmEyc0Z1eGFRdWNsT3pqUlI1UVRvOGtRQVZQL1BR?=
 =?utf-8?B?TUh4V01RajB2MmNMbyt0ZURuZXlKNUsxNEQ2Rmx4cXlnR2grc2FwU09BWjA2?=
 =?utf-8?B?MGtKUFZuTlkzTDRGNjY0UDZrQ01aWnBuc1JzN21MbkY0WUowUlYvb2IwV1Vr?=
 =?utf-8?B?c0lRcTRuMGhxa2JFcmtXdW9FOVgyNnVmMXZsZXQrY1d6aE9sRWZidzQydVl0?=
 =?utf-8?B?TWdKckVTaXdXYWo4TGxjMFYrMmRQdXZzVVFEZkZFU3I2Q3FSQkI5MGY2bHFJ?=
 =?utf-8?B?UzNIbUFMdEk5STVKWXRmVVVDSTZNbTJpaFBBOWFiYUV2YjBTR1BtSEtaenFI?=
 =?utf-8?B?Z0l4QUY4ZVZnTks0T1J6YUZQK09Cd3ExR2dleml2K0hWRVJ4NTREamJxejBR?=
 =?utf-8?B?c29GbXQvRkh5RWJQTkJibG14SVZuQnJlZlJSZDZVeU01UUMvbXRBRWNSNEJq?=
 =?utf-8?B?eFgrNCtRUTU0OUlmR1N0aSs0ekxXdHpGL0pPQzg5NjFvUExYMitERjJqVlZC?=
 =?utf-8?B?WlRRaTBONFAyN0ZpN1ZkbVBpMENJaEhBZ2ZLQVR3ZllLUU5RYlR6Vm1TY3hG?=
 =?utf-8?B?TjdYdmMwV3Q4WGc1ZWpsSDBNNVhuSjJvbkZ6WGg5SzBOd1J1SVl2cGtMemsr?=
 =?utf-8?B?RzJCMEsxcitBcXFPaXJOeDR6VU51VFFnTU1lQnVNVEN2M0wwRlJQRWxBbWxO?=
 =?utf-8?B?VFJvRkxsVXBPZFUxY20zV0lBaWZpbEsxUHVsamtsUk5DNGpTWlNjS3JYUmdH?=
 =?utf-8?B?NWE3Yi9SSUpUUzMzNHloNlVjeE5rNGRaYmhmL2ZjMWQrczFLTCtvL0l0OWFE?=
 =?utf-8?B?a0FkZmNyUlhIcEFPWHdxMHhFSWl6OXBGVExKZ1ZEUEt4ODlQbUQ4YWk5Zk9a?=
 =?utf-8?B?d2Z1U1lLdDMyS01KeDhDUmx1U2k4cjhYMFlPdjFiZDlsaCsrSENSQU5oSWR4?=
 =?utf-8?B?LzdrUnM4WjltLy9mSUVtTUJmb1U5MXZudDdXQnZ4STRmSkJxRTAvTFFpUFhZ?=
 =?utf-8?B?L0pPSmZaQTlwNEdlMDN3ZHlJWlJuSzAvQlUzcUlEbThuelNVRkZpUGJtVEI1?=
 =?utf-8?B?bWJ1dHFkemVOUGxFSGdCWHNWQ0l6aXB4M0liQkZoQjhjaFg4YnNlMkZtZzE1?=
 =?utf-8?B?Yy9zdlZxcTVKbS83S1M0ZWx0QzNqdldEeExFVkxDMHVmQlFjMFdVUk9ZVXdp?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63870343-e324-4aa7-fbcb-08db11236673
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 20:13:14.5336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBqGseFOQ+RBP4ffyHb2orpnvpA3881/Agr7g+n1fjktyjiTSn9TMjjv4Se3Qw5reAcHctkiblM9bKkNWHQinVPIep0ryBqY9Cbx6em8M40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

On 1/24/2023 16:55, Ceraolo Spurio, Daniele wrote:
> On 1/11/2023 5:54 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The stats worker thread management was mis-matched between
>> enable/disable call sites. Fix those up. Also, abstract the cancel
>> code into a helper function rather than replicating in multiple places.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 ++++++++++++-------
>>   1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b436dd7f12e42..982364777d0c6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1435,19 +1435,25 @@ static void guc_init_engine_stats(struct 
>> intel_guc *guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>>       intel_wakeref_t wakeref;
>> +    int ret;
>>         mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
>>                guc->timestamp.ping_delay);
>>   -    with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
>> -        int ret = guc_action_enable_usage_stats(guc);
>> +    with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
>> +        ret = guc_action_enable_usage_stats(guc);
>>   -        if (ret)
>> -            drm_err(&gt->i915->drm,
>> -                "Failed to enable usage stats: %d!\n", ret);
>> +    if (ret) {
>> +        cancel_delayed_work_sync(&guc->timestamp.work);
>
> Wouldn't it be easier to just call mod_delayed_work after the H2G if 
> ret==0, instead of having it before and cancelling if we get a failure?
>
>> +        drm_err(&gt->i915->drm, "Failed to enable usage stats: 
>> %d!\n", ret);
>>       }
>>   }
>>   +static void guc_park_engine_stats(struct intel_guc *guc)
>> +{
>> +    cancel_delayed_work_sync(&guc->timestamp.work);
>> +}
>> +
>
> Now you're asymmetric with the park/unpark, because on the park side 
> you have this wrapper, while on the unpark side you directly call 
> mod_delayed_work.
The point is that submission disable needs to also cancel the worker. 
But calling the actual busyness park function seems excessive - no need 
to do all the updating if we are about to reset the GuC or unload the 
driver.

Thinking about it more, calling this park_engine_stats is actually wrong 
given that engine stats and busyness are the same thing, so basically we 
would have two functions with the same name where one is a subset of the 
other. Is it simpler (and safe?) to just call the full busyness unpark 
from submission_disable? Or is it better to have a 
cancel/enable_busyness_worker() pair for all instances of turning the 
worker on or off?

John.


>
> Daniele
>
>>   void intel_guc_busyness_park(struct intel_gt *gt)
>>   {
>>       struct intel_guc *guc = &gt->uc.guc;
>> @@ -1460,7 +1466,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
>>        * and causes an unclaimed register access warning. Cancel the 
>> worker
>>        * synchronously here.
>>        */
>> -    cancel_delayed_work_sync(&guc->timestamp.work);
>> +    guc_park_engine_stats(guc);
>>         /*
>>        * Before parking, we should sample engine busyness stats if we 
>> need to.
>> @@ -4409,11 +4415,11 @@ void intel_guc_submission_enable(struct 
>> intel_guc *guc)
>>       guc_init_global_schedule_policy(guc);
>>   }
>>   +/* Note: By the time we're here, GuC may have already been reset */
>>   void intel_guc_submission_disable(struct intel_guc *guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>> -
>> -    /* Note: By the time we're here, GuC may have already been reset */
>> +    guc_park_engine_stats(guc);
>>         /* Disable and route to host */
>>       if (GRAPHICS_VER(gt->i915) >= 12)
>

