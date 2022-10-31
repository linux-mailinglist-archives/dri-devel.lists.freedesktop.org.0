Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A6613D5F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 19:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49B210E055;
	Mon, 31 Oct 2022 18:30:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91F010E055;
 Mon, 31 Oct 2022 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667241018; x=1698777018;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QkEuW4YqiNnyamyq3k0rF9usipkk4bJv9+dqZY4bYSY=;
 b=VMzX93JP2SEohMwhbCiNrYbKvZXGW/jIDEitQH0gxKARBcSCF3eCUc93
 /s8XZj/fycEqHxE20U01mTXDUxTfAKiZ/yCgvhdIdxQ/oLQcf/qtyLsY1
 wh9gdPIgF8X8GjjJXizVIuPAXASQ1TpajiCtDQmNfCMsJq2kmPBTektFa
 D2hJsbkF8MZKlvmZe2shdhoq80ZuwmiMBW+A7WfmoCPkQE3PkjFKNxhfB
 mqxbI/GdDPZsuzjx1BWcw9ixHQsNYRGPLwWJQTMp+HS9SZPA24GLde93Z
 Z6WEl3G4Ijs0xeUkFJbxbUV9fRSchIj1Aq3RtGlDmG2Ql36kIR/OFdlE/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="395285372"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="395285372"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 11:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="666926318"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="666926318"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 31 Oct 2022 11:30:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 11:30:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 11:30:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 11:30:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 11:30:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ij11fHboCUDS4q9uxFCBN1dN5vF4f0am/cdi62htOUUJQhx5NOnB35Ne/MmcHcMj+0e+lVN8lrR4YqubkRPXqwJJcVslcBZMH1VlMPsjEgLPF9SIRsUwIPfvEK1r3sWbJlP/uwASSKcOlfbPoy/LDsNTTKRdK3c1hfWwd1ljhOdtBVCLMdW5LFZuheTeFwyFq93StqlOqXCo6ArRMmPtXgmeRD+VY/4Bfoeg8A9xQxM3yttvyDvzCjPwSQcGMu+qf4MurNcW6qk1kFpKBX8/Xgbaa6Th0xPIR+HlFR7a8F7LkxVm6F3JEsTBEdKi6HnJgl/X/mnsInfVp2m5Mo9aQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0y4t8cba8UODMT+Vgp6ccsMrrbiBi9APpLpv/BfNVY=;
 b=Kh+s5FhqnUfj2ZJoETRbGPDEqZ8sA5aayojH3XPCrtFZJ1avO+nsa7QH5AQbBg+RCHGrwBstdFpmogUr0jjVQkRS5jSuYZLWErb6iikO4jOWnZ09H8wOgPVYTs2Hwz9AGsUFrEckVHI8cEo/r0yHzykm1LOiGdWLAO7djIahVCezRtjf3LBl4/uMwS6G43+ep9GGC/ArXEYv343fSOAMg4q8kyfAUB7wTclioW/ozsl2WSoW05y05Yx54e1mgiLrtD9sFA8ROiDzSbdh9rplD9ybOEzfYlcwO9MzQX+C4lfk3ThiaSPGmZxysE8ncaM1AXU+1rldkBLbuwQVZLx+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 18:30:13 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5769.021; Mon, 31 Oct 2022
 18:30:13 +0000
Message-ID: <3f83f31f-28d4-5b68-3066-5a0b58e20e56@intel.com>
Date: Mon, 31 Oct 2022 11:30:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Don't deadlock busyness
 stats vs reset
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221028194649.1130223-1-John.C.Harrison@Intel.com>
 <20221028194649.1130223-3-John.C.Harrison@Intel.com>
 <56a6c98a-069c-77b0-d6c5-4575bc324075@linux.intel.com>
 <2e7cf7c4-76cb-5a69-8a61-7d1da3577060@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2e7cf7c4-76cb-5a69-8a61-7d1da3577060@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM8PR11MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 678cd06f-3ba3-40a9-5f1b-08dabb6df33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oQo9uTXsZNbZprlqPS0YLEmkk1yZTI1VKFWL8ZfE3oauZRwsk8VE+ovos5ZBKGQQbm0AnlBVY8arBz8mWDXU5SHDuEEGUkYtFryVRp6j3BgVtYwzshA/vsJOz4ho4nARzciggCFzJc3ITT/dtKKa9xM9FwTmGp56Fkl/oqWw1hbKYn4Hk1zAHQ+T0l0N9TZxOMe03LXs8ahKabpbWlgK0zAF+p94g0ZHNdXMpj4tVJV3+Np6IHMPJsot/2ovLsqStxSTWtre7SPHm0nJp90fzkB60R201MD1QEQjgpJatKoCsBDdo6aDxbtvpMAkkevpd/o+xqpE/laYkinaoP7tSjsnT9209ExNM92FUXU4NC+r5uEVO6qDJ9uMLCRUGrPLLIybTDOeJ4xDJLL7+j6ypMAm+up1iUHLnH8WAE7TX3+ScgeE7tWHJtyqftu+5I3Wvb3xI+YJ9JGzCTKBwGX1TNKdx+tJUrgMykQq4aGUE+jyJZMyW/OTyN3AZJLvoTgsexaFm2lGhSvUWMFq/cB0zLGkaJuMyFbt0G930momTUXNomCgq/q3fOkwYhcyC12ZdwuaqZTz5wPbaOaSCGD0n7ftpB3FfHJ3krhx/pCBDhGQZQbH4DuY96lZpZEZcj531dqoKxGXrlp16sjlSQ3vfaMxPYlrKSv/rpHtA3n9p8Gvmp9c9yw9G7mgAGr4jkfShdc++ZERkk/5KEtApIZmRdyeDuazjSmF/C0iNISLOnNoDGa8tZ+HpGr1jqbPkEwpVwZJFTARvy/uPkSC26Xsgfm8aBhSFpBefJGjnCRiY7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(31686004)(83380400001)(4326008)(6486002)(2906002)(36756003)(86362001)(82960400001)(38100700002)(31696002)(53546011)(26005)(6512007)(2616005)(186003)(5660300002)(66556008)(316002)(66946007)(8676002)(66476007)(41300700001)(6506007)(478600001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFJDdWR4WkFlYVFoSU9tWm96ZWRnWHdvY084OGFaVEF5SlRZYXRqUm9TU3Rj?=
 =?utf-8?B?cmRaWVR2TG9qM3JtQXhXdC9TTnhuQjVhbmpuU0s2bkpYR2VqSWFmcHR5VU5r?=
 =?utf-8?B?Smp4aVd3MnZEVjB5blNteURwZGdKTXVKdk5xUHN6MXJJcldhdU9vNHlyU0Ji?=
 =?utf-8?B?eHF0TGxiUkZEQmpLVWEyWGtreFd3bU5LTVF5WnlpK2xkTmNQNjBRcHBkcTBa?=
 =?utf-8?B?a1lsRFJoelRaOUxUMjdKdDlJZGFjcWxRb0xxOE5oVVB1MHlxYkNkeXVYZEJm?=
 =?utf-8?B?ZU1PbjJGVm9PdEdRc3g2U0k1RkhBNUlxZE9aS0Q0bkxnTC81RTdBUGs4MmI1?=
 =?utf-8?B?Zk15bmZpSFFCR0JMdkZQd002Zkt6NUlEUW5GN09FcmUrRUpiSkZQVitJVEZn?=
 =?utf-8?B?MlQ5MlNVVWR1bGlmSWdDRjAvbGdNbkpKa1NNTkxHSEdwbEs3d3o4cnNsVEFZ?=
 =?utf-8?B?dHRIblRualJSWWNCajNkU2l6K0NyZDNYMXU4YVcyR2VlZkdETnR5dndWUjcx?=
 =?utf-8?B?ZFVKSjlFa001RXlnUExKc0JYU1Nwb3p6aG85QTlRaXJOVmw4c2VKaEtQcHp4?=
 =?utf-8?B?TVZzOFU3QVFLcmFVNXYrbXQrMEE4U1hjK2ZZOW40Z1VjcW9DY0g3a1BJTDFU?=
 =?utf-8?B?elVuNmhLajBFVjM0ZUMwTEZUMlNETitZdU5nSlRjNHN4cExTV3ZjR2p1bURY?=
 =?utf-8?B?U3d1YjJKVDZkRzRGZFZRYkNpUUc5T3ZQSU1YTzdsTmpIRko3Z3N3djZFYkpr?=
 =?utf-8?B?TUJLVVkwNnlBQ0xIemZ6YUJXd1R0MGJXeXNjOGIvdERNQ0l0QXllNGY1cklw?=
 =?utf-8?B?dUZRZzlWRXNKRndWdFRUUnJyUmJhcUNROEdIS2MveGM4cVIvQU8zRC8yK1h3?=
 =?utf-8?B?ZnVwUktJNGxFWWRscWFXSUVyMUo1KzVjRDJyZ2tHNnh0bDc1a21YNFRoTERu?=
 =?utf-8?B?Y1pNQ2o4QVV5Vlk3K0QwTjJlbzJ5NUNXRFdlZVJyVTBMTE1MaTZiZGFUdEVr?=
 =?utf-8?B?U0RMb0duOUVXTmFDYkVUdVFUdjAzNmFhQ0Ntc1VscE91SXQ3WTM5VlNjdFQv?=
 =?utf-8?B?OFh2WkUwaWJ3YVFUMC8zbnhCdVJTRE15cnV6YjQzT1VrMzRLZ0NQVGdyd3cx?=
 =?utf-8?B?bXJITUkxSTVnZHBMb0k3VG4rZ2dOcVlsSW5QVy9IMVNVV2VuMHVBNW1HVGlW?=
 =?utf-8?B?c0pBZFE2TTR0TjlkZ1g3bGpHcStaTC9oQ25qZmpobEhrUms5QnBtdlY0VHVm?=
 =?utf-8?B?bTdETExJaHJIaVdielpKbC9YZ2FmMUZZYlNZYnB6SVdweHgydEl5UUdSeTI2?=
 =?utf-8?B?dWZtY1d4RUM0QTZHbmpBQXYra0g4RHB2RjJFWTFweXNZbVVCa0cxVkRMM3Vp?=
 =?utf-8?B?VURyYVhkclZqbGhZZmxWc0ZmZVgvdmJDdVR5UXVLZGRXUzNteU1LazhJc213?=
 =?utf-8?B?dkN0MkxMbUpZT0Rhc1huOWlEVTJpNWx1TThWZytZZTJNWm56S1lVOThkUlox?=
 =?utf-8?B?RkhWb0lFV2p1M0hxUnZhSTNKeThOL3JzTDNBN0R5THZSSEFvVW5zZlIxZzZB?=
 =?utf-8?B?SytuVVRxdGw3Sksza1IzQWI2eEVQMVRDYkxLWk91aVFzQ0FhQXhBdWxOOVBq?=
 =?utf-8?B?RVVYMnBBZm5NelllQUNjZURPZEpQK2RWSUxhMmNIZ1hjOTNkc1lWS0pWbmxo?=
 =?utf-8?B?enY2U0todFpJYUVYUDNnTitJR2tGOFdkNkg3bHA5ek1jazYva0RIZlhEVWJC?=
 =?utf-8?B?a1R5bDV3L0J0dGJrSkZNWGJTbmNUeVl1MG1XY3VtUXo5Y3gyYitheVg5elpw?=
 =?utf-8?B?S2s4dzhMQmFHMHhpVjZSYS9nZWp0TTZ2bVhpN0FQWXRCTmI1azlWdXBaMnVr?=
 =?utf-8?B?Rnp0U1h2M2dWdzg1MWk5amlXVkdWUVN2cGpJaU5ueGdKUFBXOWxEamQ4V3Ix?=
 =?utf-8?B?NjYzeHJkRTZDYVFyN25CTms4OVZzR1I4ZnNqd2J1a3lRclp6bjc4cWNSTlNK?=
 =?utf-8?B?WkdOVGtOR3NoQWszYUY3VFF4b1Z2RGx2cWljeDZ0ZVd1djBtKzczOUVLZ2Ra?=
 =?utf-8?B?OWlFK2NUQzc5M3k1ZEZQdjdEa1FsZDBGOGhud3NhY1RaZU54NGVDanVuRXhx?=
 =?utf-8?B?L29yYjQrdlFrVmNwK1pRdng4MGVJTUYzUjBaSXQ5VEJpRC9YbWQyU254UlJm?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 678cd06f-3ba3-40a9-5f1b-08dabb6df33a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 18:30:13.3646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKST5os7JONYWixQOVSun3otp2nLu8xLWS+WVA2znw/5GWx8Wse1JWY7nUei6EgwOYNUFZug1+BXE6Ea/CdOR0AE7TT9/FrswIaPIKx3UqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5686
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

On 10/31/2022 05:51, Tvrtko Ursulin wrote:
> On 31/10/2022 10:09, Tvrtko Ursulin wrote:
>> On 28/10/2022 20:46, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> The engine busyness stats has a worker function to do things like
>>> 64bit extend the 32bit hardware counters. The GuC's reset prepare
>>> function flushes out this worker function to ensure no corruption
>>> happens during the reset. Unforunately, the worker function has an
>>> infinite wait for active resets to finish before doing its work. Thus
>>> a deadlock would occur if the worker function had actually started
>>> just as the reset starts.
>>>
>>> Update the worker to abort if a reset is in progress rather than
>>> waiting for it to complete. It will still acquire the reset lock in
>>> the case where a reset was not already in progress. So the processing
>>> is still safe from corruption, but the deadlock can no longer occur.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_reset.c             | 15 
>>> ++++++++++++++-
>>>   drivers/gpu/drm/i915/gt/intel_reset.h             |  1 +
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++--
>>>   3 files changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>>> index 3159df6cdd492..2f48c6e4420ea 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>> @@ -1407,7 +1407,7 @@ void intel_gt_handle_error(struct intel_gt *gt,
>>>       intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>>>   }
>>> -int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>>> +static int _intel_gt_reset_trylock(struct intel_gt *gt, int *srcu, 
>>> bool retry)
>>>   {
>>>       might_lock(&gt->reset.backoff_srcu);
>>>       might_sleep();
>>> @@ -1416,6 +1416,9 @@ int intel_gt_reset_trylock(struct intel_gt 
>>> *gt, int *srcu)
>>>       while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>>>           rcu_read_unlock();
>>> +        if (!retry)
>>> +            return -EBUSY;
>>> +
>>>           if (wait_event_interruptible(gt->reset.queue,
>>>                            !test_bit(I915_RESET_BACKOFF,
>>>                                  &gt->reset.flags)))
>>
>> Would it be more obvious to rename the existing semantics to 
>> intel_gt_reset_interruptible(), while the flavour you add in this 
>> patch truly is trylock? I am not sure, since it's all a bit special, 
>> but trylock sure feels confusing if it can sleep forever...
To me, it would seem totally more obvious to have a function called 
'trylock' not wait forever until it can manage to acquire the lock. 
However, according to '2caffbf1176256 drm/i915: Revoke mmaps and prevent 
access to fence registers across reset', the current behaviour is 
exactly how the code was originally written and intended. It hasn't just 
mutated into some confused evolution a thousand patches later. So I 
figure there is some subtle but important reason why it was named how it 
is named and yet does what it does. Therefore it seemed safest to not 
change it unnecessarily.

>
> Oh and might_sleep() shouldn't be there with the trylock version - I 
> mean any flavour of the real trylock.
You mean if the code is split into two completely separate functions? Or 
do you just mean to wrap the might_sleep() call with 'if(!retry)'?

And just to be totally clear, the unconditional call to rcu_read_lock() 
is not something that can sleep? One doesn't need a might_sleep() before 
doing that lock?

John.


>
> Regards,
>
> Tvrtko

