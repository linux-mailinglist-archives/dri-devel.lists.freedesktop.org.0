Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622DA3FCF04
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 23:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B7B6E0AD;
	Tue, 31 Aug 2021 21:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962906E09A;
 Tue, 31 Aug 2021 21:17:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="205793560"
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="205793560"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 14:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="510081652"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 31 Aug 2021 14:17:50 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 31 Aug 2021 14:17:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 31 Aug 2021 14:17:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 31 Aug 2021 14:17:49 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 31 Aug 2021 14:17:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfJdFBL4uxXdUp4sRzW9fTG/YKgnENkOJXIajnTxHvkU4q5ymuJ/fiiGHD9EIpXjRtyTNjml4N2qINOgX+u7x51TqVGcL3aJ1H5NkwWFGVSHk7vRJwjmNoue107dqxkr3RnB2stNpV5K1BqwFwGbcHM9pwBDyNz1A9Lm6NEJ91NVOi8bJ/Pf83cDDlQu5W+qM/RAfhea8CReDsgwRna11IZrmhY1FXidgMsGGEbKtiGMXsmbkR4X/YOJYAXsvcUNSQ7BsX6iWgQgykHOilSUtoCFFEoSxifTDS5uj8Kyk9PBm+UZtpjt8gGyq5fpHOjJvBCX1yO+4KBZ9j3AK0zjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY14Gj3gVSowGPbBj4LF33mBMwT5erw8Wvv2llZ2OsY=;
 b=QML4ZC3vvvJ+xnsH4X4WrneRic4LrGWQo4Rib0Frh1MXt2NKkCahkMfR4Leyre07Ez6Df9VjOfPaJy1QJ+5aThlhOtgTL+Jkx860x2jKqWhQouSyseDFHRDzlE89pjLPhPzFZ4tlWqqjwNe7a0CiPCzYZzYDub7zdVjTEJ6pi4DXOxt3Z6xCtR9/3BwvkaJXyTJ6pPhujOpT4TWgm58Y2hqN1U887vgIGxdTQvnI15c9TK2LIuBzSGkMwtUpNt16+KOsuoaLNEyKd+p2zx0MrC2fauGdU+z5dhcI5CWu4YM7MuZpjSUam5xHqytVC8n+tVr5J1nPV+enBLWAIjousg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY14Gj3gVSowGPbBj4LF33mBMwT5erw8Wvv2llZ2OsY=;
 b=iTN7ms/5Y2OGMeg1Bl33gRy90q6VaoYuIVIK2PlitkTrd4eiyKpmv8jE5rI4c0loWUu8CuLsZ86Fi671WBSuN02491VP2yesUYO28PvFL0vEBFPodDBayb6lgGBzFYxXwNb1wpJChBtp8ICD6i+ykPtnR3FalGq6l4FM+srgyyY=
Authentication-Results: chris-wilson.co.uk; dkim=none (message not signed)
 header.d=none;chris-wilson.co.uk; dmarc=none action=none
 header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23; Tue, 31 Aug 2021 21:17:47 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 21:17:47 +0000
Subject: Re: [Intel-gfx] [PATCH v7 05/17] drm/i915/pxp: Implement funcs to
 create the TEE channel
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Vetter, Daniel"
 <daniel.vetter@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Huang, Sean Z" <sean.z.huang@intel.com>, <Huang@freedesktop.org>, "Chris
 Wilson" <chris@chris-wilson.co.uk>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
 <20210828012738.317661-6-daniele.ceraolospurio@intel.com>
 <YS6aYYJcKGu1GSv2@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <7b76ed1a-8098-7e47-77f3-274bef88b5b9@intel.com>
Date: Tue, 31 Aug 2021 14:17:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <YS6aYYJcKGu1GSv2@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:320:31::13) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MWHPR18CA0027.namprd18.prod.outlook.com (2603:10b6:320:31::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21 via Frontend Transport; Tue, 31 Aug 2021 21:17:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 166d8a8c-9a5b-4019-b66d-08d96cc4c803
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR11MB57030A865278186DA17DB77AF4CC9@DM8PR11MB5703.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 34tid/7xTS9GcP/Lgdt+hkeckz3MSD8/4i/e7m2pV5DnLsQXWFVFDu/c+LOSMXU+TsLkLjd5YArSt/zoN+MSlGH5fwgC7ix6oCGPwlpqp2XBKJFrbnqZJ57YlllC8QQO0NXqX0LUQccgojHr6aFuG1pODgd5cUlIXwRrDgqqZX7Ht8yizxWXMjMaPaTFqMBmtxtKnTAp1444qZ3FF3dRw94FGYrOvFQZZnSUKKEePf+eLNGkJaL5+Zbu3/dmQZQ9BoZKOIjWsXFoTui5EZ3JsO1/tYDGWHk7Ar7Xnd+97JcVvxX5R2roUym5Auk+NfX6L22KU44dkVHVDrjdquNLn5kntQomifwA+fkhr1IXeFFMQVyog9FoJqfJeS0DjRSkgzgKW0JALa5vAMCUchBhWhcGJaF6rbYiu74FWW5k28nr0KbdwMtNOxQm5IPhBIPM50qdsY4NBmVF8gjjK79fTSQcZVRKYW/OMicBg5aJAOrMdtvdg+43vVJjAY8En2Q2bjgyyrW2lNE292ck3kldbe1SpB0p8oXeS4HWViuAlSS9mzr5O87mAufEYKn84KL74GAP2pBUBvK0MRBfmVu+n9hc8BKTqRSgxlhYpw7rrGKVq5d8/A8hSAPr2blFj32+g1G4ILEtRaXqHOBYsrSQXEoRA1XLmln3YeF6endAsRHxIOU+3e/s5Z9masgIOvuVsQ4ce21E6H57Cp7atLiGjCs7fJvf3ewgnKjEgS6afkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(83380400001)(31686004)(53546011)(2616005)(66476007)(4326008)(8676002)(2906002)(8936002)(5660300002)(316002)(66946007)(26005)(31696002)(66556008)(186003)(16576012)(36756003)(110136005)(86362001)(54906003)(6636002)(478600001)(38100700002)(6486002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHJmN3NPYWxkajhaTldjOTNyczBKQ2p0aTJVOEF0QmpnYkZGQlZHY3NMVncr?=
 =?utf-8?B?K0xERVAyd2ZiR2FOR1UwMkUzYTZnVTBQMlFtTVMza2NjU1MxUTNCajc4RGFF?=
 =?utf-8?B?QXdDV0crcUxyL1NHWXlMT2w1bUdtZ2k2MTNML1MrSXZTV2pLZ2VKUnJJdUpB?=
 =?utf-8?B?S3krVmcrVDJ4N3Y0dGpjRUh1MnBhVFNvL2FQaVVQd0Jpemp5dGVTR0dGRXkw?=
 =?utf-8?B?Rk5nN2Eyc3FQaWxvTnJwTVJORytZSTcxbUw3UU9ROTJ1elN2ajk1SExSOVNE?=
 =?utf-8?B?OW1iRTRYL2ZXUVJubGVUTWxTaXlGUlNocnhhK1I3TGVUclArc24rTTZtNDNR?=
 =?utf-8?B?dFBGaWZWelhPR0x0OWlQOWhpcHZtTTFpMWJEa3laeU5XWCt2aTI2anBxWjI3?=
 =?utf-8?B?ZG5PdFhGUUV5UHE1SmFDZThqSW5XY0RiVEpWbzhha1MyRGdTZUJ6M3FJNTAz?=
 =?utf-8?B?dmhhT1dPL3I0WWMreWRxTU14aHFGMWJjcTQ0TjVOdm1wbFZLYWdRMnpDY2ND?=
 =?utf-8?B?VGpTc1BnZXNLdW52RGpPejh0ZE9QVy92LytMeENPQ2R2RzBqTTFMSXZ4TEdr?=
 =?utf-8?B?MDNRK2JTTmc4U0tDd2cwakNQUk1sN0xjK2R4ZXdJRjFwWkpzMml3V2JhR1lR?=
 =?utf-8?B?eklCMTUwdjB0ZTdSK1BFTmxjL1VtVnk0Y1NWUmpvVEs2NFRqRnhxelZFSmFL?=
 =?utf-8?B?VklsN2JyWStjMVRYeVVVYk5ZWklhTVBGbTBXcXFydWxSR0FkaTRqcXlvK1dZ?=
 =?utf-8?B?b0h3TmdXV2tjdHhNMk1RZzFQSk1yNGlleDdMcllGZEtWcWtodEg0S3c0dnl6?=
 =?utf-8?B?UW4xOGNYUUhIbjJycWI2dGZiVVgzeElwaGJ0TDdnNGp2YXlBUml6WUNEQUFh?=
 =?utf-8?B?MmQrUGZoOWJRaE1obDBkR0c3NXlhNzkvRVhnWmpBNE5maGRidUcxL0hHZS9V?=
 =?utf-8?B?L1lDNzNTa2l2WThYbGJ5WTFFT2x6K21jeGxFR3pDNWY0b3h2YjJPN2pyeElo?=
 =?utf-8?B?UU5EMXczQjVsM0VzU0V2Qk01dG4rd3pMNk5HZ2xPcUg2YjFsOW5KYjBWTkVw?=
 =?utf-8?B?QzJyQzNjdWk2SUdGWitZZk9WUkxWc2xicTdSUENZbU9HQ0l3UHVXTWtSRFd4?=
 =?utf-8?B?TTYzNklnUmJXU1ZkVnlob21vSUpQWHp6ZWRrdUVPODdRMzl3bGxDS2xLMDd1?=
 =?utf-8?B?SU5oR2ZIZDZGM0EvajhaUFVQQVYxTG9aZWlyMU52Y1pja044NGlZWWlRQjND?=
 =?utf-8?B?cTdScnNJTHgva3FHZURqYkV0QnZBNmsxT2diY2MxOFB1ZGlIdUc0VlRRUG1a?=
 =?utf-8?B?cm1FTFlWU3VxMTNBN0U4VUthMVpXSDZ3TkNLWFNGek82R3NiUzNLVXo3N2pV?=
 =?utf-8?B?cStKMTlvSVlVNXIvZlh0cnNZRWZVZUVaMlAxTUVocXBKckU0MGhMYUxUSys1?=
 =?utf-8?B?R1A2WmJ0dWZuOFN2MDNDTFdVQi9yYkRMeGdJcGJIbFpYRUdPZzFkYTBnaUhp?=
 =?utf-8?B?ckx0cDRjZ3d2eVFMSUJpNjh6bFgvaUxoaEpMdUZtUnlab09uekZzZE5aVWxD?=
 =?utf-8?B?a1NDOEN3R3FzcGh6R2xRV2RBSlg3bjYvTmkxWmw4OWFqTmFsaHZONDc4eXhi?=
 =?utf-8?B?YmUzSUtPTTMrTmV2NkRxREhNWVRNQzU4czVmK2N5RTl5K2hnd2tCL0x6bE9p?=
 =?utf-8?B?VU1zVkFVZldyeTNuSVZrVzJHdUJGdy85SjBKS3JHcm04ZldIY3hxa3Q0eGdI?=
 =?utf-8?Q?BccLTnU+9NuQ537keZZlrDxmWuxiFx9K3o2OAY5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 166d8a8c-9a5b-4019-b66d-08d96cc4c803
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 21:17:47.6554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUVM2GmIuJKAQUHyfFnGThrLHcaoyjbageAqoJa+ETkk9EUyOpP1QjfJLc0tCyY6GS41kd5nCYaVCbdppsRGWy4X3jTM8TGybDcCF5HmUfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5703
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



On 8/31/2021 2:08 PM, Rodrigo Vivi wrote:
> On Fri, Aug 27, 2021 at 06:27:26PM -0700, Daniele Ceraolo Spurio wrote:
>> From: "Huang, Sean Z" <sean.z.huang@intel.com>
>>
>> Implement the funcs to create the TEE channel, so kernel can
>> send the TEE commands directly to TEE for creating the arbitrary
>> (default) session.
>>
>> v2: fix locking, don't pollute dev_priv (Chris)
>>
>> v3: wait for mei PXP component to be bound.
>>
>> v4: drop the wait, as the component might be bound after i915 load
>> completes. We'll instead check when sending a tee message.
>>
>> v5: fix an issue with mei_pxp module removal
>>
>> Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v4
>> ---
>>   drivers/gpu/drm/i915/Makefile              |  3 +-
>>   drivers/gpu/drm/i915/pxp/intel_pxp.c       | 13 ++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   | 76 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.h   | 14 ++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  6 ++
>>   5 files changed, 111 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 157644ef5886..cc9fe99ca5c5 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -282,7 +282,8 @@ i915-y += i915_perf.o
>>   
>>   # Protected execution platform (PXP) support
>>   i915-$(CONFIG_DRM_I915_PXP) += \
>> -	pxp/intel_pxp.o
>> +	pxp/intel_pxp.o \
>> +	pxp/intel_pxp_tee.o
>>   
>>   # Post-mortem debug and GPU hang state capture
>>   i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) += i915_gpu_error.o
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
>> index 7b2053902146..400deaea2d8a 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
>> @@ -3,6 +3,7 @@
>>    * Copyright(c) 2020 Intel Corporation.
>>    */
>>   #include "intel_pxp.h"
>> +#include "intel_pxp_tee.h"
>>   #include "gt/intel_context.h"
>>   #include "i915_drv.h"
>>   
>> @@ -50,7 +51,16 @@ void intel_pxp_init(struct intel_pxp *pxp)
>>   	if (ret)
>>   		return;
>>   
>> +	ret = intel_pxp_tee_component_init(pxp);
>> +	if (ret)
>> +		goto out_context;
>> +
>>   	drm_info(&gt->i915->drm, "Protected Xe Path (PXP) protected content support initialized\n");
>> +
>> +	return;
>> +
>> +out_context:
>> +	destroy_vcs_context(pxp);
>>   }
>>   
>>   void intel_pxp_fini(struct intel_pxp *pxp)
>> @@ -58,5 +68,8 @@ void intel_pxp_fini(struct intel_pxp *pxp)
>>   	if (!intel_pxp_is_enabled(pxp))
>>   		return;
>>   
>> +	intel_pxp_tee_component_fini(pxp);
>> +
>>   	destroy_vcs_context(pxp);
>> +
>>   }
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> new file mode 100644
>> index 000000000000..2f28f34c721d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> @@ -0,0 +1,76 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright(c) 2020 Intel Corporation.
>> + */
>> +
>> +#include <linux/component.h>
>> +#include "drm/i915_pxp_tee_interface.h"
>> +#include "drm/i915_component.h"
>> +#include "i915_drv.h"
>> +#include "intel_pxp.h"
>> +#include "intel_pxp_tee.h"
>> +
>> +static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
>> +{
>> +	return &kdev_to_i915(i915_kdev)->gt.pxp;
>> +}
>> +
>> +/**
>> + * i915_pxp_tee_component_bind - bind function to pass the function pointers to pxp_tee
>> + * @i915_kdev: pointer to i915 kernel device
>> + * @tee_kdev: pointer to tee kernel device
>> + * @data: pointer to pxp_tee_master containing the function pointers
>> + *
>> + * This bind function is called during the system boot or resume from system sleep.
>> + *
>> + * Return: return 0 if successful.
>> + */
>> +static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>> +				       struct device *tee_kdev, void *data)
>> +{
>> +	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
>> +
>> +	pxp->pxp_component = data;
>> +	pxp->pxp_component->tee_dev = tee_kdev;
>> +
>> +	return 0;
>> +}
>> +
>> +static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
>> +					  struct device *tee_kdev, void *data)
>> +{
>> +	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
>> +
>> +	pxp->pxp_component = NULL;
>> +}
>> +
>> +static const struct component_ops i915_pxp_tee_component_ops = {
>> +	.bind   = i915_pxp_tee_component_bind,
>> +	.unbind = i915_pxp_tee_component_unbind,
>> +};
>> +
>> +int intel_pxp_tee_component_init(struct intel_pxp *pxp)
>> +{
>> +	int ret;
>> +	struct intel_gt *gt = pxp_to_gt(pxp);
>> +	struct drm_i915_private *i915 = gt->i915;
>> +
>> +	ret = component_add_typed(i915->drm.dev, &i915_pxp_tee_component_ops,
>> +				  I915_COMPONENT_PXP);
>> +	if (ret < 0) {
>> +		drm_err(&i915->drm, "Failed to add PXP component (%d)\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	pxp->pxp_component_added = true;
>> +
>> +	return 0;
>> +}
>> +
>> +void intel_pxp_tee_component_fini(struct intel_pxp *pxp)
>> +{
>> +	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
>> +
>> +	if (fetch_and_zero(&pxp->pxp_component_added))
> +Daniel.
>
> If I'm understanding his locking guidelines well, I believe we should
> start avoiding even these functions.
>
> If there's a risk of init and fini functions to conflict we should
> use regular mutexes.
>
> In case they are called from obvious probe unprobe places than we
> could simply set to false and del the component. But if you have
> to add this here on this latest revision to fix a bug
> I'm assuming we will need a proper mutex.

There is no risk of conflict here, but since we don't abort driver init 
if pxp_init fails, we can end up calling pxp_fini on driver unload even 
if pxp_init was unsuccessful, so we need a variable to track the init 
state of the component. The bug I fixed was actually that reusing 
pxp->pxp_component for this tracking doesn't work, because the PCI 
subsystem unbinds the component on suspend, which clears 
pxp->pxp_component; the component itself is still there even if not 
currently bound and needs removal, hence the use of a different variable.

Daniele

>
>> +		component_del(i915->drm.dev, &i915_pxp_tee_component_ops);
>> +}
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
>> new file mode 100644
>> index 000000000000..23d050a5d3e7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright(c) 2020, Intel Corporation. All rights reserved.
>> + */
>> +
>> +#ifndef __INTEL_PXP_TEE_H__
>> +#define __INTEL_PXP_TEE_H__
>> +
>> +#include "intel_pxp.h"
>> +
>> +int intel_pxp_tee_component_init(struct intel_pxp *pxp);
>> +void intel_pxp_tee_component_fini(struct intel_pxp *pxp);
>> +
>> +#endif /* __INTEL_PXP_TEE_H__ */
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> index bd12c520e60a..3a8e17e591bd 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> @@ -6,9 +6,15 @@
>>   #ifndef __INTEL_PXP_TYPES_H__
>>   #define __INTEL_PXP_TYPES_H__
>>   
>> +#include <linux/types.h>
>> +
>>   struct intel_context;
>> +struct i915_pxp_component;
>>   
>>   struct intel_pxp {
>> +	struct i915_pxp_component *pxp_component;
>> +	bool pxp_component_added;
>> +
>>   	struct intel_context *ce;
>>   };
>>   
>> -- 
>> 2.25.1
>>

