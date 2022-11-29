Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860E963B997
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 06:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF2910E0C7;
	Tue, 29 Nov 2022 05:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570B10E0C7;
 Tue, 29 Nov 2022 05:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669701280; x=1701237280;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iujrl6Pd8XmMwWcsk293aKFwW2tTxRoaSZ5DSVQe4HQ=;
 b=LOxUJPLFofVi7TkomaoDbP8+vx1bpotwNBT58BaFlHFAZDRsolxMcxWm
 +KvXhaM29ybxPTeMaaorbA9i5tD6TY/k54UJOGWNicTd9L1T7uV63dFQf
 ZsADT9UyOs0NZZCOkPaKReUybKH/BUphmiYMI8mJhor3wCONqRUOrw2eA
 JMc8Q+siy9sJWBZUN/6cbSFIdLJOqT/tvOZ0A0D9+3Dp+09iZlk0DaMlC
 eyf0VYFsYplmJ8nL+VuJRTCO9udWyxmDcSTjQnh8oAhDfcNiSomod621b
 FfpAYrha6LAW7oj6nYxBie2FCOkZce7gOEw6bf7UFNsmH4qFZbrtgCpsJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="312656101"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="312656101"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 21:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="888716563"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="888716563"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 28 Nov 2022 21:54:39 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 21:54:38 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 21:54:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 21:54:38 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 21:54:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGfeqaNGmaX22z200mnIhXyCMjW/xolx6B0/rmhSWJC09gT9ZsTQFiUYVDY5zhPHT2Dz/cOt40gmHdKF/SvGRRWnwxI1kVa63xgjNees8aw+UDIWV3DQJz8Igmtp3hMI2WCLMHMf9yTkGjgVoJQlto7Z4sp6v277XtDlMdubTpVRTzb5Ld9Tyhe+y5XuyXDhLhEALNpB/5YwxhwqhHvQDSyO1WpDWyibclj4Mqui4qJB8EgcOJRGoSGm60pTofKAdzXmqBLOXCJqMjutSFpPOqf/rJ9btuu5Zys7tbI/jg4AlQMQEVoGZVAqm2WrIKRjva7JJTGOn/LfGF/fFNw5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7M+uqWYDS4kwsgD+ovQQ+IAiRH3K/Md9cqsRPTpDZI=;
 b=amtMDfkJAE9gcMZ0wIk3lImw996oHowKlMUwgZ4ScT/G9Cbz0iRULSQQOmK1ij4AhalJbWDtTgEj3ZM13EQKmXzEZU6yU0k8b3I1gRlFLD40vEEHIVkWlk1TBh7G4jTi6AvUON7xVztj6NEzIRdlQQNaL7jjyEfIN0tKKRC+escHy2+B0tfoQjUr1Q8zP0PKYphAZQyOfk9Yfu1IFVcRURAjs9QWHSDA4zT/wfJbSnZneciaxBHplUSBFhIsw7AWR1XJTzxLbqtzUBpkYOFIKHAjueBSLcwkhofUg0NjhK7ZSuSVUeqi5mp59Z9Kmw8Z3acod3ZW3hf7a0KhqzUEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Tue, 29 Nov
 2022 05:54:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5857.022; Tue, 29 Nov 2022
 05:54:30 +0000
Date: Mon, 28 Nov 2022 21:54:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/mtl: Media GT and Render GT
 share common GGTT
Message-ID: <20221129055428.r3we3kkjettlwyc6@ldmartin-desk2.lan>
References: <20221122070126.4813-1-aravind.iddamsetty@intel.com>
 <Y31iW0lCuUcx4pNg@mdroper-desk1.amr.corp.intel.com>
 <a6f3f20a-3d03-acce-965a-604a43639d0d@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <a6f3f20a-3d03-acce-965a-604a43639d0d@intel.com>
X-ClientProxiedBy: BYAPR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 3237e8a5-5480-481b-fa0b-08dad1ce2e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +kZk3dOoH0kBAqk47rpYLrXBfYYNOzmt3NyJbdd4/NgrUm7tv3EO+iS1wQgubc9o5ZSKjZDpjxEoI1qXksdsKkrtUKDzcGtLv/6T8YJXv/+i+2n9V7MKbIyMOX0hJetQOzva6sgCq7bropBFzhyDz/UnQhZ0/xXOZHtZRP+GnGPcKhJJo7jQh10ddEwWlIiuccphN+Faq+xs6Kho39TjRYlv8sbDdn/5gIpT0FwzA4RD1FAnkaImoU/O/cMKeGKfAQ5E5Qj99ZzB5Io7FLjM3/OYPToZ3imGeEK8IK/my+Sxx15HCYrjDRR5qqYPHI6oGzbx0MTmtcjaMGiwkZ4hv8vi6bbRB4gI3c5Xigbrd+SyAyi+9dRaxpn7oEL2Z79SdAStfa9hwvKEYnWBb/537QoUNyZOcS297kF95YXOoU8cg2mZlbBNdZCGryTWM5vFaHHIEWV6ER0/hff8i2tZnizwPREJclf+lL3O7+LoBntzsjFSx1QjD6ToUOSlsbAGo+IE4/cWwT9SmjI9zCkYSSPV2InhOS5tpZ7DXnlBPI488C/3Pgv7BhTmSO4hopBO57EhtLSGdA6yboy5L9uFodgGPUNxWY9hmbfDzKTEp3WRLt7GAmptYulhE5JU71Ty
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199015)(478600001)(316002)(2906002)(186003)(36756003)(8676002)(66476007)(4326008)(66556008)(6506007)(450100002)(83380400001)(66946007)(26005)(6512007)(1076003)(9686003)(6636002)(86362001)(6486002)(38100700002)(6862004)(41300700001)(8936002)(5660300002)(30864003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B82NfkZKGxvFSmt1qU2Exua5MPvDe47CsM8ZWWopy0dXKtlawZjOw/esh4C4?=
 =?us-ascii?Q?YZwLOxzuKoHgypCg0mBrRe7pYkuIl46x71HT51uRBshC1AH+neVSKFDOD/4r?=
 =?us-ascii?Q?S07obEAsFcYo3YiLCuXVdCi81xrFIXMkHSbDp0SBHqbpeqAgxEaD2U30X3cj?=
 =?us-ascii?Q?scUpQOAK/jXngcNugANemcsN19Qx8tXmoZjXncmuFIAaT/vEzgHt0CzxlcY2?=
 =?us-ascii?Q?UeQIEyWdrkGCIqVL8mje0o6TTTWCKBZueunR9GYeESCCBE978JOFrwpErkMs?=
 =?us-ascii?Q?Zsc9+3WsbomDjPTeH7q7P5Z2BXZSRAdw/bpqEDPsz7wOJHSmEOMjqiJLL4hS?=
 =?us-ascii?Q?omRLvBM8xS0u0iCADxFCGIC63YqXZiqRbuwLJtHft3hpGfJmQZsKDFG7oPMu?=
 =?us-ascii?Q?ZX9EpPoRIpiw6NAnML6NVCfFkJDKhKQrriOLzTIMD18XFTP+9HJ7TFm88e9u?=
 =?us-ascii?Q?0oQ7zzwj+XPy8AGqHz6Et5DyJry4uoZUEM5zhOofLVvzsIq/zqm+1Lzb70vv?=
 =?us-ascii?Q?RyiroPVGQFsPsHi6ZhFEDPnvA+iHA++8Rcuaq1kOspPYriV0UnsCC4U7+puW?=
 =?us-ascii?Q?QFsLV6hXGk5D3/i4OumPqqwcJsDhnoOKWDyK0K8H5iefix6xK/HduDCv/akj?=
 =?us-ascii?Q?J7mvMx4UZRwyqGTLdT9evFpxufZf6I1/q0KBeiP6iwQJMI4QbQa4KmdjzQDI?=
 =?us-ascii?Q?W/pS7+HA1jNhSnMi18ctZgTFb/Q7TsJliyA7H2tIgLjkgL+3orpmqYUz9LxG?=
 =?us-ascii?Q?cyPFJ1M9aeI6JsNRA99devLpiV1vcBLXClPPj73c2rqyykgovbYz+Eh95x1N?=
 =?us-ascii?Q?yt8t8WLs4IEYv7oun6sNMpMlp+Vleg9LZ3qS8K5GlWXP+9ce45HX7jufzpTA?=
 =?us-ascii?Q?M42h17tMAGTn+7MAUvOrxu4aONjYq2Lm/bgyUBYAT5TJizjHeCzazVqWpXaf?=
 =?us-ascii?Q?i2XzsAIdw0Ucl0nmqiOG2zdBd9Oa99ikHqPp0sTY3oI4u6ZP6Np5m4Czwb9K?=
 =?us-ascii?Q?/mFTNyvdBvbLqpfEGbSoHKB4/YznrSB3d/2qg+S09PtfgtNbs1oldxHp9jwa?=
 =?us-ascii?Q?kMkOI0WNgDMcrTEgrd0+/JXuzvbxBYugW5HCZjl9EgL9ye4w2e2azRlLkwi+?=
 =?us-ascii?Q?p6Nx+WHiQI9U8mEB0MvPZcGUIh6L0LIwbh04zF2xDS5rna8rrGChhBnngcL5?=
 =?us-ascii?Q?ClVCu/2wa1D+8uFM/FZ6G2BQjXjZx44lqPfP6Z5ucTyYXNwZ/2eE2+SQUg5W?=
 =?us-ascii?Q?0L9nWrSrb+apWFrtm9SRDd64tXULR1I7qIcsdEcb/7KHa0z78mSQnRDgmLa+?=
 =?us-ascii?Q?P9/ugRNX79xOw1BuQnmkz/GoRJnLg6nQGzy9pE5Bslk9DsB9XLr7pTLxRb8q?=
 =?us-ascii?Q?yv+kfLlCPIsF5kRhv//j49dlu/Q4T1WHpgMX61OtFdfRL31Y3GcBWZFObCZl?=
 =?us-ascii?Q?OmJlH1tRER5N7BXqc3jyWPODMdYFY1JB2kRwRPX1tpGUGlNSoKpWEhlZPG1H?=
 =?us-ascii?Q?u9suzUMRf5mA37Gc7TaDtWIipDp2NVXQkM4MrslKrn7C9sUK3wsdW9NVCbYf?=
 =?us-ascii?Q?XrVLfipdLyt9QbR44oAqbwS7l4wS0UoU4DlfOjcilUmmKo+Vsrt+VTfmcMvd?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3237e8a5-5480-481b-fa0b-08dad1ce2e9c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 05:54:30.3897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGkLU3FnatEvDqX1Vnfpk84l/a1u5/b38CfEGyXuSwt+udBUu3VF5SWsK8DPESx9piuNkVH/oLXMA5EvYdN5JoEh0LM1Xyfs3sAq3TF1Xjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7530
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

On Wed, Nov 23, 2022 at 09:47:03AM +0530, Iddamsetty, Aravind wrote:
>
>
>On 23-11-2022 05:29, Matt Roper wrote:
>> On Tue, Nov 22, 2022 at 12:31:26PM +0530, Aravind Iddamsetty wrote:
>>> On XE_LPM+ platforms the media engines are carved out into a separate
>>> GT but have a common GGTMMADR address range which essentially makes
>>> the GGTT address space to be shared between media and render GT. As a
>>> result any updates in GGTT shall invalidate TLB of GTs sharing it and
>>> similarly any operation on GGTT requiring an action on a GT will have to
>>> involve all GTs sharing it. setup_private_pat was being done on a per
>>> GGTT based as that doesn't touch any GGTT structures moved it to per GT
>>> based.
>>>
>>> BSPEC: 63834
>>>
>>> v2:
>>> 1. Add details to commit msg
>>> 2. includes fix for failure to add item to ggtt->gt_list, as suggested
>>> by Lucas
>>> 3. as ggtt_flush() is used only for ggtt drop i915_is_ggtt check within
>>> it.
>>> 4. setup_private_pat moved out of intel_gt_tiles_init
>>>
>>> v3:
>>> 1. Move out for_each_gt from i915_driver.c (Jani Nikula)
>>>
>>> v4: drop using RCU primitives on ggtt->gt_list as it is not an RCU list
>>> (Matt Roper)
>>>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>Thanks Matt, could you also help with merging the change.
>
>Regards,
>Aravind.
>>
>>> ---
>>>  drivers/gpu/drm/i915/gt/intel_ggtt.c      | 54 +++++++++++++++++------
>>>  drivers/gpu/drm/i915/gt/intel_gt.c        | 13 +++++-
>>>  drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>>>  drivers/gpu/drm/i915/gt/intel_gtt.h       |  4 ++
>>>  drivers/gpu/drm/i915/i915_driver.c        | 12 ++---
>>>  drivers/gpu/drm/i915/i915_gem.c           |  2 +
>>>  drivers/gpu/drm/i915/i915_gem_evict.c     | 51 +++++++++++++++------
>>>  drivers/gpu/drm/i915/i915_vma.c           |  5 ++-
>>>  drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>>>  9 files changed, 111 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> index 8145851ad23d..7644738b9cdb 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> @@ -8,6 +8,7 @@
>>>  #include <linux/types.h>
>>>  #include <linux/stop_machine.h>
>>>
>>> +#include <drm/drm_managed.h>
>>>  #include <drm/i915_drm.h>
>>>  #include <drm/intel-gtt.h>
>>>
>>> @@ -196,10 +197,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>>>
>>>  void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>>>  {
>>> +	struct intel_gt *gt;
>>> +
>>>  	i915_ggtt_suspend_vm(&ggtt->vm);
>>>  	ggtt->invalidate(ggtt);
>>>
>>> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>> +		intel_gt_check_and_clear_faults(gt);
>>>  }
>>>
>>>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>>> @@ -225,16 +229,21 @@ static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>
>>>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>  {
>>> -	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>>  	struct drm_i915_private *i915 = ggtt->vm.i915;
>>>
>>>  	gen8_ggtt_invalidate(ggtt);
>>>
>>> -	if (GRAPHICS_VER(i915) >= 12)
>>> -		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
>>> -				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>>> -	else
>>> -		intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>>> +	if (GRAPHICS_VER(i915) >= 12) {
>>> +		struct intel_gt *gt;
>>> +
>>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>> +			intel_uncore_write_fw(gt->uncore,
>>> +					      GEN12_GUC_TLB_INV_CR,
>>> +					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>>> +	} else {
>>> +		intel_uncore_write_fw(ggtt->vm.gt->uncore,
>>> +				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>>> +	}
>>>  }
>>>
>>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>>> @@ -986,8 +995,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>>
>>>  	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>>>
>>> -	setup_private_pat(ggtt->vm.gt);
>>> -
>>>  	return ggtt_probe_common(ggtt, size);
>>>  }
>>>
>>> @@ -1196,7 +1203,14 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
>>>   */
>>>  int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>>>  {
>>> -	int ret;
>>> +	struct intel_gt *gt;
>>> +	int ret, i;
>>> +
>>> +	for_each_gt(gt, i915, i) {
>>> +		ret = intel_gt_assign_ggtt(gt);

in v3 the intel_gt_assign_ggtt() call is not in i915_driver.c anymore but
rather moved here. We could make i915_ggtt_create() static, doing the
allocation here and intel_gt_assign_ggtt() would be in charge of just
assigning the ggtt. Not very important though and can be done later.

pushed, thanks

Lucas De Marchi

>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>>
>>>  	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
>>>  	if (ret)
>>> @@ -1208,6 +1222,19 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>>>  	return 0;
>>>  }
>>>
>>> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
>>> +{
>>> +	struct i915_ggtt *ggtt;
>>> +
>>> +	ggtt = drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
>>> +	if (!ggtt)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	INIT_LIST_HEAD(&ggtt->gt_list);
>>> +
>>> +	return ggtt;
>>> +}
>>> +
>>>  int i915_ggtt_enable_hw(struct drm_i915_private *i915)
>>>  {
>>>  	if (GRAPHICS_VER(i915) < 6)
>>> @@ -1296,9 +1323,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>>>
>>>  void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>>  {
>>> +	struct intel_gt *gt;
>>>  	bool flush;
>>>
>>> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>> +		intel_gt_check_and_clear_faults(gt);
>>>
>>>  	flush = i915_ggtt_resume_vm(&ggtt->vm);
>>>
>>> @@ -1307,9 +1336,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>>  	if (flush)
>>>  		wbinvd_on_all_cpus();
>>>
>>> -	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
>>> -		setup_private_pat(ggtt->vm.gt);
>>> -
>>>  	intel_ggtt_restore_fences(ggtt);
>>>  }
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> index b5ad9caa5537..b03788d7674e 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> @@ -110,9 +110,18 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>>>
>>>  int intel_gt_assign_ggtt(struct intel_gt *gt)
>>>  {
>>> -	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
>>> +	/* Media GT shares primary GT's GGTT */
>>> +	if (gt->type == GT_MEDIA) {
>>> +		gt->ggtt = to_gt(gt->i915)->ggtt;
>>> +	} else {
>>> +		gt->ggtt = i915_ggtt_create(gt->i915);
>>> +		if (IS_ERR(gt->ggtt))
>>> +			return PTR_ERR(gt->ggtt);
>>> +	}
>>>
>>> -	return gt->ggtt ? 0 : -ENOMEM;
>>> +	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
>>> +
>>> +	return 0;
>>>  }
>>>
>>>  int intel_gt_init_mmio(struct intel_gt *gt)
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>> index c1d9cd255e06..8d915640914b 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>> @@ -277,6 +277,9 @@ struct intel_gt {
>>>  	struct kobject *sysfs_defaults;
>>>
>>>  	struct i915_perf_gt perf;
>>> +
>>> +	/** link: &ggtt.gt_list */
>>> +	struct list_head ggtt_link;
>>>  };
>>>
>>>  struct intel_gt_definition {
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> index 4d75ba4bb41d..d1900fec6cd1 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> @@ -390,6 +390,9 @@ struct i915_ggtt {
>>>  	struct mutex error_mutex;
>>>  	struct drm_mm_node error_capture;
>>>  	struct drm_mm_node uc_fw;
>>> +
>>> +	/** List of GTs mapping this GGTT */
>>> +	struct list_head gt_list;
>>>  };
>>>
>>>  struct i915_ppgtt {
>>> @@ -584,6 +587,7 @@ void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
>>>  int i915_init_ggtt(struct drm_i915_private *i915);
>>>  void i915_ggtt_driver_release(struct drm_i915_private *i915);
>>>  void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
>>> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
>>>
>>>  static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
>>>  {
>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>>> index 69103ae37779..4e1bb3c23c63 100644
>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>> @@ -612,10 +612,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>>>
>>>  	i915_perf_init(dev_priv);
>>>
>>> -	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
>>> -	if (ret)
>>> -		goto err_perf;
>>> -
>>>  	ret = i915_ggtt_probe_hw(dev_priv);
>>>  	if (ret)
>>>  		goto err_perf;
>>> @@ -1316,7 +1312,8 @@ int i915_driver_suspend_switcheroo(struct drm_i915_private *i915,
>>>  static int i915_drm_resume(struct drm_device *dev)
>>>  {
>>>  	struct drm_i915_private *dev_priv = to_i915(dev);
>>> -	int ret;
>>> +	struct intel_gt *gt;
>>> +	int ret, i;
>>>
>>>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>>>
>>> @@ -1331,6 +1328,11 @@ static int i915_drm_resume(struct drm_device *dev)
>>>  		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
>>>
>>>  	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
>>> +
>>> +	for_each_gt(gt, dev_priv, i)
>>> +		if (GRAPHICS_VER(gt->i915) >= 8)
>>> +			setup_private_pat(gt);
>>> +
>>>  	/* Must be called after GGTT is resumed. */
>>>  	intel_dpt_resume(dev_priv);
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>>> index 8468ca9885fd..086c4702e1bf 100644
>>> --- a/drivers/gpu/drm/i915/i915_gem.c
>>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>>> @@ -1143,6 +1143,8 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>>>  	for_each_gt(gt, dev_priv, i) {
>>>  		intel_uc_fetch_firmwares(&gt->uc);
>>>  		intel_wopcm_init(&gt->wopcm);
>>> +		if (GRAPHICS_VER(dev_priv) >= 8)
>>> +			setup_private_pat(gt);
>>>  	}
>>>
>>>  	ret = i915_init_ggtt(dev_priv);
>>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
>>> index f025ee4fa526..4cfe36b0366b 100644
>>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>>> @@ -43,16 +43,25 @@ static bool dying_vma(struct i915_vma *vma)
>>>  	return !kref_read(&vma->obj->base.refcount);
>>>  }
>>>
>>> -static int ggtt_flush(struct intel_gt *gt)
>>> +static int ggtt_flush(struct i915_address_space *vm)
>>>  {
>>> -	/*
>>> -	 * Not everything in the GGTT is tracked via vma (otherwise we
>>> -	 * could evict as required with minimal stalling) so we are forced
>>> -	 * to idle the GPU and explicitly retire outstanding requests in
>>> -	 * the hopes that we can then remove contexts and the like only
>>> -	 * bound by their active reference.
>>> -	 */
>>> -	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>> +	struct intel_gt *gt;
>>> +	int ret = 0;
>>> +
>>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
>>> +		/*
>>> +		 * Not everything in the GGTT is tracked via vma (otherwise we
>>> +		 * could evict as required with minimal stalling) so we are forced
>>> +		 * to idle the GPU and explicitly retire outstanding requests in
>>> +		 * the hopes that we can then remove contexts and the like only
>>> +		 * bound by their active reference.
>>> +		 */
>>> +		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +	return ret;
>>>  }
>>>
>>>  static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
>>> @@ -149,6 +158,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>>  	struct drm_mm_node *node;
>>>  	enum drm_mm_insert_mode mode;
>>>  	struct i915_vma *active;
>>> +	struct intel_gt *gt;
>>>  	int ret;
>>>
>>>  	lockdep_assert_held(&vm->mutex);
>>> @@ -174,7 +184,14 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>>  				    min_size, alignment, color,
>>>  				    start, end, mode);
>>>
>>> -	intel_gt_retire_requests(vm->gt);
>>> +	if (i915_is_ggtt(vm)) {
>>> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>> +
>>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>> +			intel_gt_retire_requests(gt);
>>> +	} else {
>>> +		intel_gt_retire_requests(vm->gt);
>>> +	}
>>>
>>>  search_again:
>>>  	active = NULL;
>>> @@ -246,7 +263,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>>  	if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
>>>  		return -EBUSY;
>>>
>>> -	ret = ggtt_flush(vm->gt);
>>> +	ret = ggtt_flush(vm);
>>>  	if (ret)
>>>  		return ret;
>>>
>>> @@ -332,7 +349,15 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>>>  	 * a stray pin (preventing eviction) that can only be resolved by
>>>  	 * retiring.
>>>  	 */
>>> -	intel_gt_retire_requests(vm->gt);
>>> +	if (i915_is_ggtt(vm)) {
>>> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>> +		struct intel_gt *gt;
>>> +
>>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>> +			intel_gt_retire_requests(gt);
>>> +	} else {
>>> +		intel_gt_retire_requests(vm->gt);
>>> +	}
>>>
>>>  	if (i915_vm_has_cache_coloring(vm)) {
>>>  		/* Expand search to cover neighbouring guard pages (or lack!) */
>>> @@ -438,7 +463,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>>>  	 * switch otherwise is ineffective.
>>>  	 */
>>>  	if (i915_is_ggtt(vm)) {
>>> -		ret = ggtt_flush(vm->gt);
>>> +		ret = ggtt_flush(vm);
>>>  		if (ret)
>>>  			return ret;
>>>  	}
>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>> index 703fee6b5f75..726705b10637 100644
>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>> @@ -1544,6 +1544,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>>  			   u32 align, unsigned int flags)
>>>  {
>>>  	struct i915_address_space *vm = vma->vm;
>>> +	struct intel_gt *gt;
>>> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>>  	int err;
>>>
>>>  	do {
>>> @@ -1559,7 +1561,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>>  		}
>>>
>>>  		/* Unlike i915_vma_pin, we don't take no for an answer! */
>>> -		flush_idle_contexts(vm->gt);
>>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>> +			flush_idle_contexts(gt);
>>>  		if (mutex_lock_interruptible(&vm->mutex) == 0) {
>>>  			/*
>>>  			 * We pass NULL ww here, as we don't want to unbind
>>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
>>> index e5dd82e7e480..2535b9684bd1 100644
>>> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
>>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
>>> @@ -127,6 +127,8 @@ static void igt_pm_resume(struct drm_i915_private *i915)
>>>  	 */
>>>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>>  		i915_ggtt_resume(to_gt(i915)->ggtt);
>>> +		if (GRAPHICS_VER(i915) >= 8)
>>> +			setup_private_pat(to_gt(i915));
>>>  		i915_gem_resume(i915);
>>>  	}
>>>  }
>>> --
>>> 2.25.1
>>>
>>
>
