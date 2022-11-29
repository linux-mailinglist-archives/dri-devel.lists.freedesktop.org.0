Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4363B9EA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 07:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4E010E36D;
	Tue, 29 Nov 2022 06:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B2810E368;
 Tue, 29 Nov 2022 06:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669704351; x=1701240351;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QsmmAlKuEZJ4Ny8ky2I5Qy2kmE4Ps2Dmz79MZ3rvuwE=;
 b=c1zcaL72L2t5cS6NBBot8AfgLUYiHUneeJ1L90RjSgDzYoeC3oWHJYqi
 AEU/9O3LfYl+ddErCz3jksTCvqpYIuCkNJl5iDoOkhPbfRnsQTBU0+T0Q
 bQeB36l9+uOgidVd/81V0CHyFLlu0OdePrznFH8XjGqGkr9QXwzRwTum1
 AfRMDpHQX4+/wCI25eZ4SepnX9CdLeNTmBkhQhiIVjnvKtM1zfW4vTc2T
 oyW5WhikYtNZjEuRqqIaXAvjRRVHNbQj7Q2cjPszbr16nLok6eJbbyzJE
 oZTzvCtL40/QSe3heDNNr/m7CXsC15oKLnEyyW5+5jS1spygJuv9nfDOX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="312664037"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="312664037"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 22:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="712261331"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="712261331"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2022 22:45:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 22:45:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 22:45:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 22:45:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 22:45:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXjBLvuVhTVQ18nNNOGHRd+17RFqexvBpg+4ic7WCbkR3UXQDjnnFMNo6W6EwzxC4LZLSkQw8HDJBDkLvkpGZWiivob7XNsibHTeH+Qgtncq4ujGhLUAXRZRvnF7Y0+3OBazBGelhMAWp0hZpsxiKnipJBHeZuFcDk0ctEfHT+niXllEUylKKwy5UqIs5sJoJLKTTlMQAu2VUhCvz570vUYeas6bSdYyJaMFBRpYrvjk1F6dtPIWsx8j/1lPWTRvfLAyQEQYK9u7oBnSpR2PXX8H8OT1B2BJcTesPKfuu9rlCeanA+k8PcarGu6OMOjtr439dRiWdjjZfmsMXyBigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ty02CQP7LEDKaauk7fTLypI8BWMINnQKxextyp1OsY=;
 b=Md7Q46jWMcokBOXM0sHGzoN7dXs2lrZx4twP1BUd7nTfvIpzehc/PNbL8938R/PaOxlzycqmcaAApvdM2u6Z5LqOrFiyYWSHwjGN0vdGimZa7HWBjCm7wtoJc5QMBarwu1MN6F7scKkZl4WQUM0zpXcRQqKIuIQlQktqfr6rSXV2ViHa4m9c1lHUshqeHeo/cw9Sk4dkod4dIDBv+PKHWAANUDdW+cSaWJ1o+4fqxnA4Bu1aZGSBeyL5JwgBrSAhEe4l1AnKY62ICG3tUIgskSeX853osbyEFuTXvnGGpDnL12O4diW6KQdsA2AqjIMxm0fcMS3DW5auJY6+O4BKmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6561.namprd11.prod.outlook.com (2603:10b6:510:1c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 06:45:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5857.022; Tue, 29 Nov 2022
 06:45:33 +0000
Date: Mon, 28 Nov 2022 22:45:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/mtl: Media GT and Render GT
 share common GGTT
Message-ID: <20221129064531.rlvay7lpijdusrkr@ldmartin-desk2.lan>
References: <20221122070126.4813-1-aravind.iddamsetty@intel.com>
 <Y31iW0lCuUcx4pNg@mdroper-desk1.amr.corp.intel.com>
 <a6f3f20a-3d03-acce-965a-604a43639d0d@intel.com>
 <20221129055428.r3we3kkjettlwyc6@ldmartin-desk2.lan>
 <ebb5b596-6e87-9782-8127-2eaf517c0359@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebb5b596-6e87-9782-8127-2eaf517c0359@intel.com>
X-ClientProxiedBy: SJ0PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: c1518923-6795-4712-3a3c-08dad1d5507b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1c8COlwhOBXk9HpyXPPSKRR6bhoDSln//Dd6boA2Kw6FyLkAtOMCdWlXpQTq0Yoz6V3Jw4jfqK3WLRyZW+mfoC9//O/ui3wFPlal6U0kSmIlI2ySzOM1pSMu/cAREk9YavBe4XU01dW4+TAD3OG40RNcDSTCGoFGtcUq8d0/uZJ/nSdaqNFr7p8AD5RT4siODuoN2fAQIF5ytaeQW3b0bHUj5EixZbBpPZ6fFQMS/ZQhBHhgVzQxHUxUiE25vfTFxvVfQWATBgPVu5zSqEmNEZqirKidvH9M1hdRPmvVc7LKrcDBgSDsb5L9OqFFxWZIKu7NU0tfnPhduUpwe1TwY9y4QeQwMq5U4PYB46nyaTmujCVcp0br+Brn60bF4710zq3aWS8Rp6+c8H4aYS8ezLr4upfkHyv2Rosmjam/KAOlqJoSQu9RgCwKTqlI6h8HIUzijDQZedE2Eh2LetWWrXM1uGQhosqARUILZka/Eskw/7WPe1ssYX50puH+69caj36C4lOWdDQt6KkaSx1p+e9OSdyK75yrrMRSrABuw2unr73oiYLSAnO4i/h6eilBbFJu5094HYgfABTRdouDIdSIKjDOcBITtvxcFBmJTUZ3/hxHgl6TPSr293AHyyuKl/k7n4J3GtDgN1mmB2BeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199015)(38100700002)(82960400001)(2906002)(41300700001)(86362001)(83380400001)(66556008)(8676002)(6636002)(450100002)(6486002)(1076003)(316002)(66476007)(36756003)(478600001)(66946007)(4326008)(26005)(8936002)(6862004)(5660300002)(186003)(9686003)(53546011)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OkLzLEoDo1xchI00Onz0h45bayJPZirzo9Ls5hZK26A06sK80r+vB/dlNv?=
 =?iso-8859-1?Q?NBro9F2aIge+YPUs4RnLfTY5BVlFQWMWteGkg9yp1anGIOCvbGF6n4HduL?=
 =?iso-8859-1?Q?VryqneHAigG9akCbPgB9HXI2na1CLYddm+cG2tjPCJ2NpZif9bMx12oXLh?=
 =?iso-8859-1?Q?nrt5W3/1r6+jAoEQbyqDf1q02KNdcNGORmFu9VaL8C+fTfwGbrlhxm6jNb?=
 =?iso-8859-1?Q?72HxCj2Kl8sLFFgAcpZtWbgABxNA+mCdUmn4iZmFPj8LMpyW5lMbBmNe24?=
 =?iso-8859-1?Q?0oFvgyMupk8EZ9SJqY5fmXdvLQGPjFNr0Y2i9XdZCR5l4xTVREe38KZw3P?=
 =?iso-8859-1?Q?CCi13Q5/f1DpiwHI8G/+jPhj/8ChKgf2nKMUIASdPoIZJcGWcILYNjgJkG?=
 =?iso-8859-1?Q?xRAAQ+7keb6gdbXOPi0Jw0ESpuy6Ni9YXuolbmyZJ4dPJlnkMQGbS0IaNy?=
 =?iso-8859-1?Q?r6cwyOwh6ybFqaX8AOpBp0OA0tPvalo9lIb81o+HG0tpZOb4mrxNWmsog0?=
 =?iso-8859-1?Q?LoArjjVODbAclcCDS91ji0wOlPlm3DKmZG7W9bqMHZvRF5eIAqiebKcTYI?=
 =?iso-8859-1?Q?kFICd3CWOmMww47lLb1RMHXqcO1ICCJOVnIkntMIqRGP0Bcy37q78HObbd?=
 =?iso-8859-1?Q?H2MSKGOK5hSiFoHXvUlBbTZgtt4UoJWSZPAuzNk1h35x4NFmygJ6dAOuAj?=
 =?iso-8859-1?Q?mtkLl4H5FGHqp99qFAHTsP7AEVFReSLG45URUJvMHtKFfXfEqBOjvfHvwR?=
 =?iso-8859-1?Q?WdlQMr9PEUYKdHeyxm2B7LOgGGD0W0Npc7l0+/S842DtNkkW2pnSqRlqdE?=
 =?iso-8859-1?Q?P+panY6+YvAQr7kmi2fY9BRWvLvwT43d2zFKeHb2E/Zjo/62kkOD4WTGHK?=
 =?iso-8859-1?Q?5BLQHaugJI493OUhmsYjOQogdI/eOQjWf/gpG9n/yn7yiX4j71cPA8k1Pu?=
 =?iso-8859-1?Q?/rLlFRofUhxdLeC20SUb3fGpcx44kqc/BN0PeBb0vMNBEEgRvQrfoI+dhC?=
 =?iso-8859-1?Q?xMx+pkcVUMqR4bR78uRM2RuUUIl4hpBrab+/WErr0Ggmv0M5l6UAPU1+rS?=
 =?iso-8859-1?Q?qP+nfpPUvdV/3S3OlfTqS5mvnUsPiGqxY20l6NlTRJiSISDmhy7Nj98zr+?=
 =?iso-8859-1?Q?awLgYy/YFBiPvpt/+0z2NeB719dEsu/mF/cqoFEpFyQ003v9YvbiRyejCY?=
 =?iso-8859-1?Q?CHJU1OLeWDvDK8ckMoeps+4hNJIMAp/iYUHYanhvA+5dhpVEPtvLXdNTZY?=
 =?iso-8859-1?Q?ID4fp1qKJq9OMTswju4Q7zLbHwnbkO2743ulnv5hNfhMRH9kY9kIIc24X6?=
 =?iso-8859-1?Q?oK/q/VJiNgDNPXrH0dh2FRJN06mt9ailqp5BaWvGJOUeEjxtKmUyzDX+nO?=
 =?iso-8859-1?Q?jzABSaiHfE1AurvaMj7/80nBZH2kYFwy7kVVqh/pLErB4s3ttgye27oRry?=
 =?iso-8859-1?Q?WjvMg9/4vJde23B5DncxianxMCyAvR1rEG3XSCtTtnwSnOfJAA66rAT4qn?=
 =?iso-8859-1?Q?2Lx2V+TwsQmWLxWzRLutmCRwVKUvOp1J2LMkYXZ156lhgOOHyJBDU2n7iJ?=
 =?iso-8859-1?Q?qS5lsB8gZauGyVhMscD9ORlAUeq/oPBS7Q4/GCPGQbEWOkjxSAJzIY/QVk?=
 =?iso-8859-1?Q?hZ6dyfbR42VaALmQ+d0zfgNlxITobC4NBuHkawm+tR68PZ7qUuzk5ccg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1518923-6795-4712-3a3c-08dad1d5507b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 06:45:33.6089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/oHHu9azzVTpMY+0WYOBNXI1cIMM0gvMZS0FJEX+gIVRPdQBD4XXX4aesoHgNxAuitKsYzc2MmdDnmM6GwuxjPjdQ8GbjMYeDzzaJMnO7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6561
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

On Tue, Nov 29, 2022 at 11:33:15AM +0530, Iddamsetty, Aravind wrote:
>
>
>On 29-11-2022 11:24, Lucas De Marchi wrote:
>> On Wed, Nov 23, 2022 at 09:47:03AM +0530, Iddamsetty, Aravind wrote:
>>>
>>>
>>> On 23-11-2022 05:29, Matt Roper wrote:
>>>> On Tue, Nov 22, 2022 at 12:31:26PM +0530, Aravind Iddamsetty wrote:
>>>>> On XE_LPM+ platforms the media engines are carved out into a separate
>>>>> GT but have a common GGTMMADR address range which essentially makes
>>>>> the GGTT address space to be shared between media and render GT. As a
>>>>> result any updates in GGTT shall invalidate TLB of GTs sharing it and
>>>>> similarly any operation on GGTT requiring an action on a GT will
>>>>> have to
>>>>> involve all GTs sharing it. setup_private_pat was being done on a per
>>>>> GGTT based as that doesn't touch any GGTT structures moved it to per GT
>>>>> based.
>>>>>
>>>>> BSPEC: 63834
>>>>>
>>>>> v2:
>>>>> 1. Add details to commit msg
>>>>> 2. includes fix for failure to add item to ggtt->gt_list, as suggested
>>>>> by Lucas
>>>>> 3. as ggtt_flush() is used only for ggtt drop i915_is_ggtt check within
>>>>> it.
>>>>> 4. setup_private_pat moved out of intel_gt_tiles_init
>>>>>
>>>>> v3:
>>>>> 1. Move out for_each_gt from i915_driver.c (Jani Nikula)
>>>>>
>>>>> v4: drop using RCU primitives on ggtt->gt_list as it is not an RCU list
>>>>> (Matt Roper)
>>>>>
>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>
>>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>
>>> Thanks Matt, could you also help with merging the change.
>>>
>>> Regards,
>>> Aravind.
>>>>
>>>>> ---
>>>>>  drivers/gpu/drm/i915/gt/intel_ggtt.c      | 54 +++++++++++++++++------
>>>>>  drivers/gpu/drm/i915/gt/intel_gt.c        | 13 +++++-
>>>>>  drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>>>>>  drivers/gpu/drm/i915/gt/intel_gtt.h       |  4 ++
>>>>>  drivers/gpu/drm/i915/i915_driver.c        | 12 ++---
>>>>>  drivers/gpu/drm/i915/i915_gem.c           |  2 +
>>>>>  drivers/gpu/drm/i915/i915_gem_evict.c     | 51 +++++++++++++++------
>>>>>  drivers/gpu/drm/i915/i915_vma.c           |  5 ++-
>>>>>  drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>>>>>  9 files changed, 111 insertions(+), 35 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>>> index 8145851ad23d..7644738b9cdb 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>>> @@ -8,6 +8,7 @@
>>>>>  #include <linux/types.h>
>>>>>  #include <linux/stop_machine.h>
>>>>>
>>>>> +#include <drm/drm_managed.h>
>>>>>  #include <drm/i915_drm.h>
>>>>>  #include <drm/intel-gtt.h>
>>>>>
>>>>> @@ -196,10 +197,13 @@ void i915_ggtt_suspend_vm(struct
>>>>> i915_address_space *vm)
>>>>>
>>>>>  void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>>>>>  {
>>>>> +    struct intel_gt *gt;
>>>>> +
>>>>>      i915_ggtt_suspend_vm(&ggtt->vm);
>>>>>      ggtt->invalidate(ggtt);
>>>>>
>>>>> -    intel_gt_check_and_clear_faults(ggtt->vm.gt);
>>>>> +    list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>>>> +        intel_gt_check_and_clear_faults(gt);
>>>>>  }
>>>>>
>>>>>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>>> @@ -225,16 +229,21 @@ static void gen8_ggtt_invalidate(struct
>>>>> i915_ggtt *ggtt)
>>>>>
>>>>>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>>>  {
>>>>> -    struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>>>>      struct drm_i915_private *i915 = ggtt->vm.i915;
>>>>>
>>>>>      gen8_ggtt_invalidate(ggtt);
>>>>>
>>>>> -    if (GRAPHICS_VER(i915) >= 12)
>>>>> -        intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
>>>>> -                      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>>>>> -    else
>>>>> -        intel_uncore_write_fw(uncore, GEN8_GTCR,
>>>>> GEN8_GTCR_INVALIDATE);
>>>>> +    if (GRAPHICS_VER(i915) >= 12) {
>>>>> +        struct intel_gt *gt;
>>>>> +
>>>>> +        list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>>>> +            intel_uncore_write_fw(gt->uncore,
>>>>> +                          GEN12_GUC_TLB_INV_CR,
>>>>> +                          GEN12_GUC_TLB_INV_CR_INVALIDATE);
>>>>> +    } else {
>>>>> +        intel_uncore_write_fw(ggtt->vm.gt->uncore,
>>>>> +                      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>>>>> +    }
>>>>>  }
>>>>>
>>>>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>>>>> @@ -986,8 +995,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>>>>
>>>>>      ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>>>>>
>>>>> -    setup_private_pat(ggtt->vm.gt);
>>>>> -
>>>>>      return ggtt_probe_common(ggtt, size);
>>>>>  }
>>>>>
>>>>> @@ -1196,7 +1203,14 @@ static int ggtt_probe_hw(struct i915_ggtt
>>>>> *ggtt, struct intel_gt *gt)
>>>>>   */
>>>>>  int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>>>>>  {
>>>>> -    int ret;
>>>>> +    struct intel_gt *gt;
>>>>> +    int ret, i;
>>>>> +
>>>>> +    for_each_gt(gt, i915, i) {
>>>>> +        ret = intel_gt_assign_ggtt(gt);
>>
>> in v3 the intel_gt_assign_ggtt() call is not in i915_driver.c anymore but
>> rather moved here. We could make i915_ggtt_create() static, doing the
>> allocation here and intel_gt_assign_ggtt() would be in charge of just
>> assigning the ggtt. Not very important though and can be done later.
>
>well we call intel_gt_assign_ggtt in i915_gem_gtt_mock_selftests but not
>i915_ggtt_probe_hw.

makes sense, let's leave it as is.

Lucas De Marchi
