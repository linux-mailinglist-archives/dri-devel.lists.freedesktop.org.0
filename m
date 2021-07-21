Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A53D18A8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 23:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B146E3DF;
	Wed, 21 Jul 2021 21:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42786E3DF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 21:07:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="211519095"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="211519095"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="658446183"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jul 2021 14:07:44 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 21 Jul 2021 14:07:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 21 Jul 2021 14:07:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 21 Jul 2021 14:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPUgrg0OM6ANLar8bWWd84g5LoC/rljvo0gfQ2AZoj7sLna+rNSKd7Hp2MqajjN+P1NtaYquc0cvmKkMPVYHugdyq40pCISwBqYnYhVYFFlg9r6KpE2bHLhbb5tjtZYlcbGthwoV61t69gVwhb5ci4wC144coiizR433x+m22ras2v5aACInq9+IffYlYjwkj/qGtRN+2uw89X4GGUeEmr5GOXA3xEkHUr5uBigdFnXU/Gu5UQ5zqz5mXpKkVnW5/iNzph3l16V8/nsdoq6xgNAq8xhTNAWhCeN0QAbhlGGgrxG+V/x8zoTJVHQWxeHIx4eMuWkRDBZIkPE9NXeBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ts6u0CJNyxangL3FEMA7959JmsV7CZ/z7WIEaXUoMic=;
 b=O5/I/VcXay/chbd3ZJrqDJZ0w2OfBFJ0fNdLIV0uUqnWfDa/RGhUcYqtWxhqRISSmyTm566RYs6mn7czi6W597tI0/oJCPfEaLJAA420ixzAab9dgQi0/okcDy5IKNN4w8QfFb7XDHEr3+LMckVTbY5ThWaAsGTc7rp6i2wA82T9GxRxMlHTc/WvArImRJZkCeBVl017r1MWMQWbGayFdF4Lh3Sv7if5dHqqme5XqkdPCpITXC5S0A8TADRSAVMxNaRr2vZ3ljs+S2NUb0c2+5CtjgeRIIG/TiNL0fL9vy+xiHn5AvdctCdYIvjzDYZTm5fdxfk/M5xJQtvqmlGzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ts6u0CJNyxangL3FEMA7959JmsV7CZ/z7WIEaXUoMic=;
 b=l9FZmgEtpGNVhNRFPuUh5fdTwbYTpjPdm2QZ/G6dkzVVSmFpVOpsFi/3yRmWCosAnPSqPhAZJwy076xRTWl3Sh6j/VZf0XiilRuZo3JXwaBtc09OzOSxJNdfp1GF3Gq+tQUjgN3ZOe0x7ZES25cmbrdJRXT6UlIkO1geBYt7Bg0=
Authentication-Results: chris-wilson.co.uk; dkim=none (message not signed)
 header.d=none;chris-wilson.co.uk; dmarc=none action=none
 header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB0074.namprd11.prod.outlook.com (2603:10b6:4:69::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Wed, 21 Jul 2021 21:07:38 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 21:07:38 +0000
Subject: Re: [PATCH v5 09/15] drm/i915/pxp: Implement PXP irq handler
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
 <20210716041034.382-10-daniele.ceraolospurio@intel.com>
 <YPhugNxZoVjIhiXY@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <9cbd06d6-3486-297e-81d4-42b68ae79478@intel.com>
Date: Wed, 21 Jul 2021 14:07:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <YPhugNxZoVjIhiXY@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR08CA0069.namprd08.prod.outlook.com
 (2603:10b6:a03:117::46) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR08CA0069.namprd08.prod.outlook.com (2603:10b6:a03:117::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Wed, 21 Jul 2021 21:07:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b5332f0-e6b3-4c40-b6de-08d94c8b91ce
X-MS-TrafficTypeDiagnostic: DM5PR11MB0074:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB0074B4B5A2F17315A3D78BCEF4E39@DM5PR11MB0074.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtDHMd5x2JJD6l1sI43pl6MBuTuoZQlldrPLoyWqBmQaQucyF0pFa4wTORELQ012UDejjuFp9FnwYkfPn6ufYbdsj8lUcrIfOodTiK2egvgQqaI6hC4Au4+/Xn/ZZq6NG/6OImi87zNBklOR8tqCrFpKplVxe7klohT50bzGi4Ee0lYGDBssWcfEV37P1wm5Hft3JBOYPV1qI/tJNqeK6Z4gh3SVDW4W6PZH2pZVF66qxETdpTEYjuKNuHADrGUKDKO1GQUHGB7FgI/qEux/OScOoqF0z91XULr7M3vTLrPWlIpQdzzwkgCUeQwslfvVmu99c76OF7HRJpUUNmAAHXRqjL8a9ORrp16hKPLFMYGUmSeVqmka0YrxXdD5hCZxOsWW67HD39fhf+EWu5f3wGwrzr8oqJmPPC7djpEoKmvKQ1Jl0tIOL6ldXubH9G24KU5V5Q2ENEm7BRgdm420UXFmkz2pQ8s+U4jaj+UyWaYyxCX2nGJF4MgPnWZyRYgdTPEX/jmT8k3lK5WoehxqJhL65c1B/W84xemnROEkOJgEgIqzmf1QPAwCj+TsgmjUFDVqKda5/LYydvmWSd948B2KBXwyd809+uA6QIR/3THGmcRL9DyMCJopEQfiZbxFMNusohdfqJZcAUJHpOMPInU1xmIt+N8U+E+B609WlyYrpTX6VkDhjA5WvU5TftfYGARDEgtQQ4vgs3F/YR9V6NEbIBgQ/CE71xJHwACwh8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(6636002)(54906003)(6486002)(478600001)(8936002)(8676002)(316002)(16576012)(37006003)(86362001)(2906002)(38100700002)(66476007)(5660300002)(31686004)(26005)(30864003)(31696002)(36756003)(186003)(2616005)(6862004)(956004)(4326008)(83380400001)(66556008)(66946007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUE2K2xHZDQzNEVvOGhoREtFNzBQOG5QVVhEQ3ZqeE9UOU5Hb3B4Vit2c1NV?=
 =?utf-8?B?RFdhbzl3VUtrdkx0M0lDdStFbG1oVkdieVNsSHVGeTRmZFpmVGhLdENJdElI?=
 =?utf-8?B?NjI3Y2tjSDJTbmFTQ1VVVnNOQThlaURwZnpKdGhmS004OFV0OEtlLzVVQ0di?=
 =?utf-8?B?bWJkeXVNQVdST1FjNWR0akp2RkhQejEvcU5mNVRDNWJmNGhyNE5GcHZHK3Jv?=
 =?utf-8?B?L2NlRXhYaVkwUldlSk1SWTNxREd5aXpOTExoczdhZE9Sd2ZvM016U0IxVjY3?=
 =?utf-8?B?dzdscnFTYTl6dWRuT3N1UlVVV3czMVBwY1dIa0x6NDFiWVFiTkxLS0gyaDFu?=
 =?utf-8?B?ZFk5dFUyak9kOGJqVnZWNFQxYVZzandwWE9zN09sbnUzdlJSU1JXR2U0WmYz?=
 =?utf-8?B?MzRKcTFPNk1jU2MxN25tQjdnSGJpU1JpdDlWOUswTkhLRjRHMDk0OGIxbEd2?=
 =?utf-8?B?WEh6SU5LbnRPclZDMTlCWnBvcy9BOS9WRHNnK290S3ozcGxCeGMzSWNlVEcv?=
 =?utf-8?B?VmswRWtObEx5eGRZeXNqOVJFbFFOakJaaytUNnFPM3d3d081VURVcW0xU3g4?=
 =?utf-8?B?QzVQRzE3aHhpeWFJK2VzdUxNa2JjRkVqSlAyODJteEdqdDd4anFoVjRjb3Vx?=
 =?utf-8?B?NmNSRnZLYTdUN3JSdEVuVVpSbGlNT1BsazlaUXFCWTAvZExGQSthaXR1bUUw?=
 =?utf-8?B?bnVYNWlBSE1jekNGa2JBMC93MEdXdyt2SXlrTnA3bmRNMXhGcVRaTzkwOFRB?=
 =?utf-8?B?V0UrSnRwKzZab25RSjU2dUYxMFB3V3F2dTE3KzBTOHd0OXVMdEp1TlVPZVZK?=
 =?utf-8?B?akw2VysvYjhBY2NNSFFjUEs2ZE8zemlpYlRzYm9TZEdZc0kvVk5WaW83Wkkz?=
 =?utf-8?B?aHFRaTF5R3VpRVBuUmk1S3NIV2t1bGRoTWlCQTJzYlZja3V3UFBQYUVBU2tw?=
 =?utf-8?B?OHo5TFhrTEFvTTg1T0RtRzJkUStlcm5BbGduUDdxKzcveS9kTkp1UituUE1a?=
 =?utf-8?B?aUV3YkcyQ2JMMUk2R0JNMW16bmNLRXg0U2Z1bi9sU0dYUzFHQ2VhTDgwRkF5?=
 =?utf-8?B?WHlGWWVkRWZWanRCSWd5Yk54eGpqN3cvcXNESW8vMlR5VWlpVUpUNTE3M2JX?=
 =?utf-8?B?U2ZDeDlYbi9rcEZleFdXeEpCUG40TEsvZWJ2cGJKaTJXNlhqNjJrOHFpeTU4?=
 =?utf-8?B?QmREVWJaaEdEd2k3ZG5udDRraUlRaTY0d1JnN1FiL1VFWDlXRzE5NUNxWkFV?=
 =?utf-8?B?WGhkSncwdGJwSlhGSW5YdXY3VVhNSzRRZUxOczBvc2JyK2FaMHJrZWJtM0pN?=
 =?utf-8?B?aEUzWUp1L0RwOU9RMWtmVDBPMStieGwydmU1NWZwTG5SeDJ0TnA3aGxIenpI?=
 =?utf-8?B?d2ZMV0QzT3VhZHpoMXNLQUxKVzlQNjhGaUIxUHd2dlNHem15NGkyd0JjQlVB?=
 =?utf-8?B?YkIrazQ5TzVQUjJ5Y0xkR0IrcmJwVHJtNi9FMzk1QXJkU3JzNC8yN1Joa3Fv?=
 =?utf-8?B?enNzRUo4NmZXV0tKYmRRTDZUcHlFMXVRRTZVR1Q0dXZkdkFVUStwa2Jrak41?=
 =?utf-8?B?SkRDMlQrbndPZzB4MEh5L0Q5dkZvMDMxR1IveC9ySjhLSmt5WkV4VUhIS3Fm?=
 =?utf-8?B?QkdOUytVcGVpSW4rck9GRUlPQkloTUVQMWR4OUlKTEx3WlNCRzVWTEdSdTJG?=
 =?utf-8?B?bDU1Smp3dzBxeUtLd21tS1cyUHBrVVZGU3daa1YwOFEySWIxTWQ5YmhENlZj?=
 =?utf-8?Q?hKabvEZjd620Dwhjcui0BFtz3v5zUJ3NJj/aNIp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5332f0-e6b3-4c40-b6de-08d94c8b91ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 21:07:38.2882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwRfA25fHrahhkQpOwQdeG7hmKxFN4SEaJP+/JMqIMXG4PopSvZ7438EPGCvaHOMeoww6ARjDoBxaFliKv5rvup/wCws2rGaot1wtL3sihw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0074
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
Cc: Huang@freedesktop.org, "Huang, Sean Z" <sean.z.huang@intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/21/2021 11:59 AM, Rodrigo Vivi wrote:
> On Thu, Jul 15, 2021 at 09:10:28PM -0700, Daniele Ceraolo Spurio wrote:
>> From: "Huang, Sean Z" <sean.z.huang@intel.com>
>>
>> The HW will generate a teardown interrupt when session termination is
>> required, which requires i915 to submit a terminating batch. Once the HW
>> is done with the termination it will generate another interrupt, at
>> which point it is safe to re-create the session.
>>
>> Since the termination and re-creation flow is something we want to
>> trigger from the driver as well, use a common work function that can be
>> called both from the irq handler and from the driver set-up flows, which
>> has the addded benefit of allowing us to skip any extra locks because
>> the work itself serializes the operations.
>>
>> v2: use struct completion instead of bool (Chris)
>> v3: drop locks, clean up functions and improve comments (Chris),
>>      move to common work function.
>> v4: improve comments, simplify wait logic (Rodrigo)
>> v5: unconditionally set interrupts,
> I didn't find this... this looks the same as v4

It's a very minor change in intel_pxp_irq_enable, the regs were set 
inside the if statement before in this patch and moved outside in a 
later patch, now they're outside to begin.

>
>> rename state_attacked var (Rodrigo)
> thanks
>
>
>
>> Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v4
> anyway, this patch looks good to me...
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Thanks!

Daniele

>
>
>
>> ---
>>   drivers/gpu/drm/i915/Makefile                |  1 +
>>   drivers/gpu/drm/i915/gt/intel_gt_irq.c       |  7 ++
>>   drivers/gpu/drm/i915/i915_reg.h              |  1 +
>>   drivers/gpu/drm/i915/pxp/intel_pxp.c         | 66 +++++++++++--
>>   drivers/gpu/drm/i915/pxp/intel_pxp.h         |  8 ++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     | 99 ++++++++++++++++++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.h     | 32 +++++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 54 ++++++++++-
>>   drivers/gpu/drm/i915/pxp/intel_pxp_session.h |  5 +-
>>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c     |  8 +-
>>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h   | 18 ++++
>>   11 files changed, 283 insertions(+), 16 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
>>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 44d3a2bcb64c..1714089a10f0 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -279,6 +279,7 @@ i915-y += i915_perf.o
>>   i915-$(CONFIG_DRM_I915_PXP) += \
>>   	pxp/intel_pxp.o \
>>   	pxp/intel_pxp_cmd.o \
>> +	pxp/intel_pxp_irq.o \
>>   	pxp/intel_pxp_session.o \
>>   	pxp/intel_pxp_tee.o
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> index c13462274fe8..96f0e9172a09 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> @@ -13,6 +13,7 @@
>>   #include "intel_lrc_reg.h"
>>   #include "intel_uncore.h"
>>   #include "intel_rps.h"
>> +#include "pxp/intel_pxp_irq.h"
>>   
>>   static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>>   {
>> @@ -64,6 +65,9 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
>>   	if (instance == OTHER_GTPM_INSTANCE)
>>   		return gen11_rps_irq_handler(&gt->rps, iir);
>>   
>> +	if (instance == OTHER_KCR_INSTANCE)
>> +		return intel_pxp_irq_handler(&gt->pxp, iir);
>> +
>>   	WARN_ONCE(1, "unhandled other interrupt instance=0x%x, iir=0x%x\n",
>>   		  instance, iir);
>>   }
>> @@ -190,6 +194,9 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>>   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
>>   	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
>>   	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_MASK,  ~0);
>> +
>> +	intel_uncore_write(uncore, GEN11_CRYPTO_RSVD_INTR_ENABLE, 0);
>> +	intel_uncore_write(uncore, GEN11_CRYPTO_RSVD_INTR_MASK,  ~0);
>>   }
>>   
>>   void gen11_gt_irq_postinstall(struct intel_gt *gt)
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 943fe485c662..2c583f2d410d 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -8051,6 +8051,7 @@ enum {
>>   /* irq instances for OTHER_CLASS */
>>   #define OTHER_GUC_INSTANCE	0
>>   #define OTHER_GTPM_INSTANCE	1
>> +#define OTHER_KCR_INSTANCE	4
>>   
>>   #define GEN11_INTR_IDENTITY_REG(x)	_MMIO(0x190060 + ((x) * 4))
>>   
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
>> index 26176d43a02d..b0c7edc10cc3 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
>> @@ -2,7 +2,9 @@
>>   /*
>>    * Copyright(c) 2020 Intel Corporation.
>>    */
>> +#include <linux/workqueue.h>
>>   #include "intel_pxp.h"
>> +#include "intel_pxp_irq.h"
>>   #include "intel_pxp_session.h"
>>   #include "intel_pxp_tee.h"
>>   #include "gt/intel_context.h"
>> @@ -68,6 +70,16 @@ void intel_pxp_init(struct intel_pxp *pxp)
>>   
>>   	mutex_init(&pxp->tee_mutex);
>>   
>> +	/*
>> +	 * we'll use the completion to check if there is a termination pending,
>> +	 * so we start it as completed and we reinit it when a termination
>> +	 * is triggered.
>> +	 */
>> +	init_completion(&pxp->termination);
>> +	complete_all(&pxp->termination);
>> +
>> +	INIT_WORK(&pxp->session_work, intel_pxp_session_work);
>> +
>>   	ret = create_vcs_context(pxp);
>>   	if (ret)
>>   		return;
>> @@ -96,19 +108,61 @@ void intel_pxp_fini(struct intel_pxp *pxp)
>>   	destroy_vcs_context(pxp);
>>   }
>>   
>> -void intel_pxp_init_hw(struct intel_pxp *pxp)
>> +void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp)
>>   {
>> -	int ret;
>> +	pxp->arb_is_valid = false;
>> +	reinit_completion(&pxp->termination);
>> +}
>> +
>> +static void intel_pxp_queue_termination(struct intel_pxp *pxp)
>> +{
>> +	struct intel_gt *gt = pxp_to_gt(pxp);
>> +
>> +	/*
>> +	 * We want to get the same effect as if we received a termination
>> +	 * interrupt, so just pretend that we did.
>> +	 */
>> +	spin_lock_irq(&gt->irq_lock);
>> +	intel_pxp_mark_termination_in_progress(pxp);
>> +	pxp->session_events |= PXP_TERMINATION_REQUEST;
>> +	queue_work(system_unbound_wq, &pxp->session_work);
>> +	spin_unlock_irq(&gt->irq_lock);
>> +}
>>   
>> +/*
>> + * the arb session is restarted from the irq work when we receive the
>> + * termination completion interrupt
>> + */
>> +int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
>> +{
>> +	if (!intel_pxp_is_enabled(pxp))
>> +		return 0;
>> +
>> +	if (!wait_for_completion_timeout(&pxp->termination,
>> +					 msecs_to_jiffies(100)))
>> +		return -ETIMEDOUT;
>> +
>> +	if (!pxp->arb_is_valid)
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
>> +
>> +void intel_pxp_init_hw(struct intel_pxp *pxp)
>> +{
>>   	kcr_pxp_enable(pxp_to_gt(pxp));
>> +	intel_pxp_irq_enable(pxp);
>>   
>> -	/* always emit a full termination to clean the state */
>> -	ret = intel_pxp_terminate_arb_session_and_global(pxp);
>> -	if (!ret)
>> -		intel_pxp_create_arb_session(pxp);
>> +	/*
>> +	 * the session could've been attacked while we weren't loaded, so
>> +	 * handle it as if it was and re-create it.
>> +	 */
>> +	intel_pxp_queue_termination(pxp);
>>   }
>>   
>>   void intel_pxp_fini_hw(struct intel_pxp *pxp)
>>   {
>>   	kcr_pxp_disable(pxp_to_gt(pxp));
>> +
>> +	intel_pxp_irq_disable(pxp);
>>   }
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
>> index 8eeb65af78b1..074b3b980957 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
>> @@ -30,6 +30,9 @@ void intel_pxp_fini(struct intel_pxp *pxp);
>>   
>>   void intel_pxp_init_hw(struct intel_pxp *pxp);
>>   void intel_pxp_fini_hw(struct intel_pxp *pxp);
>> +
>> +void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>> +int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
>>   #else
>>   static inline void intel_pxp_init(struct intel_pxp *pxp)
>>   {
>> @@ -38,6 +41,11 @@ static inline void intel_pxp_init(struct intel_pxp *pxp)
>>   static inline void intel_pxp_fini(struct intel_pxp *pxp)
>>   {
>>   }
>> +
>> +static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
>> +{
>> +	return 0;
>> +}
>>   #endif
>>   
>>   #endif /* __INTEL_PXP_H__ */
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
>> new file mode 100644
>> index 000000000000..46eca1e81b9b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright(c) 2020 Intel Corporation.
>> + */
>> +#include <linux/workqueue.h>
>> +#include "intel_pxp.h"
>> +#include "intel_pxp_irq.h"
>> +#include "intel_pxp_session.h"
>> +#include "gt/intel_gt_irq.h"
>> +#include "i915_irq.h"
>> +#include "i915_reg.h"
>> +
>> +/**
>> + * intel_pxp_irq_handler - Handles PXP interrupts.
>> + * @pxp: pointer to pxp struct
>> + * @iir: interrupt vector
>> + */
>> +void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
>> +{
>> +	struct intel_gt *gt = pxp_to_gt(pxp);
>> +
>> +	if (GEM_WARN_ON(!intel_pxp_is_enabled(pxp)))
>> +		return;
>> +
>> +	lockdep_assert_held(&gt->irq_lock);
>> +
>> +	if (unlikely(!iir))
>> +		return;
>> +
>> +	if (iir & (GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT |
>> +		   GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT)) {
>> +		/* immediately mark PXP as inactive on termination */
>> +		intel_pxp_mark_termination_in_progress(pxp);
>> +		pxp->session_events |= PXP_TERMINATION_REQUEST;
>> +	}
>> +
>> +	if (iir & GEN12_DISPLAY_STATE_RESET_COMPLETE_INTERRUPT)
>> +		pxp->session_events |= PXP_TERMINATION_COMPLETE;
>> +
>> +	if (pxp->session_events)
>> +		queue_work(system_unbound_wq, &pxp->session_work);
>> +}
>> +
>> +static inline void __pxp_set_interrupts(struct intel_gt *gt, u32 interrupts)
>> +{
>> +	struct intel_uncore *uncore = gt->uncore;
>> +	const u32 mask = interrupts << 16;
>> +
>> +	intel_uncore_write(uncore, GEN11_CRYPTO_RSVD_INTR_ENABLE, mask);
>> +	intel_uncore_write(uncore, GEN11_CRYPTO_RSVD_INTR_MASK,  ~mask);
>> +}
>> +
>> +static inline void pxp_irq_reset(struct intel_gt *gt)
>> +{
>> +	spin_lock_irq(&gt->irq_lock);
>> +	gen11_gt_reset_one_iir(gt, 0, GEN11_KCR);
>> +	spin_unlock_irq(&gt->irq_lock);
>> +}
>> +
>> +void intel_pxp_irq_enable(struct intel_pxp *pxp)
>> +{
>> +	struct intel_gt *gt = pxp_to_gt(pxp);
>> +
>> +	spin_lock_irq(&gt->irq_lock);
>> +
>> +	if (!pxp->irq_enabled)
>> +		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_KCR));
>> +
>> +	__pxp_set_interrupts(gt, GEN12_PXP_INTERRUPTS);
>> +	pxp->irq_enabled = true;
>> +
>> +	spin_unlock_irq(&gt->irq_lock);
>> +}
>> +
>> +void intel_pxp_irq_disable(struct intel_pxp *pxp)
>> +{
>> +	struct intel_gt *gt = pxp_to_gt(pxp);
>> +
>> +	/*
>> +	 * We always need to submit a global termination when we re-enable the
>> +	 * interrupts, so there is no need to make sure that the session state
>> +	 * makes sense at the end of this function. Just make sure this is not
>> +	 * called in a path were the driver consider the session as valid and
>> +	 * doesn't call a termination on restart.
>> +	 */
>> +	GEM_WARN_ON(intel_pxp_is_active(pxp));
>> +
>> +	spin_lock_irq(&gt->irq_lock);
>> +
>> +	pxp->irq_enabled = false;
>> +	__pxp_set_interrupts(gt, 0);
>> +
>> +	spin_unlock_irq(&gt->irq_lock);
>> +	intel_synchronize_irq(gt->i915);
>> +
>> +	pxp_irq_reset(gt);
>> +
>> +	flush_work(&pxp->session_work);
>> +}
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
>> new file mode 100644
>> index 000000000000..8b5793654844
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright(c) 2020, Intel Corporation. All rights reserved.
>> + */
>> +
>> +#ifndef __INTEL_PXP_IRQ_H__
>> +#define __INTEL_PXP_IRQ_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct intel_pxp;
>> +
>> +#define GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT BIT(1)
>> +#define GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT BIT(2)
>> +#define GEN12_DISPLAY_STATE_RESET_COMPLETE_INTERRUPT BIT(3)
>> +
>> +#define GEN12_PXP_INTERRUPTS \
>> +	(GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT | \
>> +	 GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT | \
>> +	 GEN12_DISPLAY_STATE_RESET_COMPLETE_INTERRUPT)
>> +
>> +#ifdef CONFIG_DRM_I915_PXP
>> +void intel_pxp_irq_enable(struct intel_pxp *pxp);
>> +void intel_pxp_irq_disable(struct intel_pxp *pxp);
>> +void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir);
>> +#else
>> +static inline void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
>> +{
>> +}
>> +#endif
>> +
>> +#endif /* __INTEL_PXP_IRQ_H__ */
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> index b8e24adeb1f3..67c30e534d50 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> @@ -48,7 +48,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
>>   	return ret;
>>   }
>>   
>> -int intel_pxp_create_arb_session(struct intel_pxp *pxp)
>> +static int pxp_create_arb_session(struct intel_pxp *pxp)
>>   {
>>   	struct intel_gt *gt = pxp_to_gt(pxp);
>>   	int ret;
>> @@ -77,12 +77,13 @@ int intel_pxp_create_arb_session(struct intel_pxp *pxp)
>>   	return 0;
>>   }
>>   
>> -int intel_pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>> +static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>>   {
>>   	int ret;
>>   	struct intel_gt *gt = pxp_to_gt(pxp);
>>   
>> -	pxp->arb_is_valid = false;
>> +	/* must mark termination in progress calling this function */
>> +	GEM_WARN_ON(pxp->arb_is_valid);
>>   
>>   	/* terminate the hw sessions */
>>   	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
>> @@ -101,3 +102,50 @@ int intel_pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>>   
>>   	return ret;
>>   }
>> +
>> +static void pxp_terminate(struct intel_pxp *pxp)
>> +{
>> +	int ret;
>> +
>> +	pxp->hw_state_invalidated = true;
>> +
>> +	/*
>> +	 * if we fail to submit the termination there is no point in waiting for
>> +	 * it to complete. PXP will be marked as non-active until the next
>> +	 * termination is issued.
>> +	 */
>> +	ret = pxp_terminate_arb_session_and_global(pxp);
>> +	if (ret)
>> +		complete_all(&pxp->termination);
>> +}
>> +
>> +static void pxp_terminate_complete(struct intel_pxp *pxp)
>> +{
>> +	/* Re-create the arb session after teardown handle complete */
>> +	if (fetch_and_zero(&pxp->hw_state_invalidated))
>> +		pxp_create_arb_session(pxp);
>> +
>> +	complete_all(&pxp->termination);
>> +}
>> +
>> +void intel_pxp_session_work(struct work_struct *work)
>> +{
>> +	struct intel_pxp *pxp = container_of(work, typeof(*pxp), session_work);
>> +	struct intel_gt *gt = pxp_to_gt(pxp);
>> +	u32 events = 0;
>> +
>> +	spin_lock_irq(&gt->irq_lock);
>> +	events = fetch_and_zero(&pxp->session_events);
>> +	spin_unlock_irq(&gt->irq_lock);
>> +
>> +	if (!events)
>> +		return;
>> +
>> +	if (events & PXP_TERMINATION_REQUEST) {
>> +		events &= ~PXP_TERMINATION_COMPLETE;
>> +		pxp_terminate(pxp);
>> +	}
>> +
>> +	if (events & PXP_TERMINATION_COMPLETE)
>> +		pxp_terminate_complete(pxp);
>> +}
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
>> index 7354314b1cc4..ba4c9d2b94b7 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
>> @@ -8,9 +8,8 @@
>>   
>>   #include <linux/types.h>
>>   
>> -struct intel_pxp;
>> +struct work_struct;
>>   
>> -int intel_pxp_create_arb_session(struct intel_pxp *pxp);
>> -int intel_pxp_terminate_arb_session_and_global(struct intel_pxp *pxp);
>> +void intel_pxp_session_work(struct work_struct *work);
>>   
>>   #endif /* __INTEL_PXP_SESSION_H__ */
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> index 3662bf67407a..7693540dc1f9 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> @@ -80,6 +80,7 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>>   {
>>   	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
>>   	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
>> +	int ret;
>>   
>>   	mutex_lock(&pxp->tee_mutex);
>>   	pxp->pxp_component = data;
>> @@ -88,15 +89,14 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>>   
>>   	/* the component is required to fully start the PXP HW */
>>   	intel_pxp_init_hw(pxp);
>> -
>> -	if (!pxp->arb_is_valid) {
>> +	ret = intel_pxp_wait_for_arb_start(pxp);
>> +	if (ret) {
>>   		drm_err(&i915->drm, "Failed to create arb session during bind\n");
>>   		intel_pxp_fini_hw(pxp);
>>   		pxp->pxp_component = NULL;
>> -		return -EIO;
>>   	}
>>   
>> -	return 0;
>> +	return ret;
>>   }
>>   
>>   static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> index a4797a98c1f9..475e3312c287 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> @@ -6,8 +6,10 @@
>>   #ifndef __INTEL_PXP_TYPES_H__
>>   #define __INTEL_PXP_TYPES_H__
>>   
>> +#include <linux/completion.h>
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>> +#include <linux/workqueue.h>
>>   
>>   struct intel_context;
>>   struct i915_pxp_component;
>> @@ -25,6 +27,22 @@ struct intel_pxp {
>>   	bool arb_is_valid;
>>   
>>   	struct mutex tee_mutex; /* protects the tee channel binding */
>> +
>> +	/*
>> +	 * If the HW perceives an attack on the integrity of the encryption it
>> +	 * will invalidate the keys and expect SW to re-initialize the session.
>> +	 * We keep track of this state to make sure we only re-start the arb
>> +	 * session when required.
>> +	 */
>> +	bool hw_state_invalidated;
>> +
>> +	bool irq_enabled;
>> +	struct completion termination;
>> +
>> +	struct work_struct session_work;
>> +	u32 session_events; /* protected with gt->irq_lock */
>> +#define PXP_TERMINATION_REQUEST  BIT(0)
>> +#define PXP_TERMINATION_COMPLETE BIT(1)
>>   };
>>   
>>   #endif /* __INTEL_PXP_TYPES_H__ */
>> -- 
>> 2.32.0
>>

