Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E196623443
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 21:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7B510E626;
	Wed,  9 Nov 2022 20:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C1810E0CF;
 Wed,  9 Nov 2022 20:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668024697; x=1699560697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0wrOtyoZLqbUssfwKlhTkONuhu8S0E3qAd7IeYLw8JI=;
 b=gBey5O0DZfzykMc7Msbxg04BCJkAP+cnXF074f4nG3go/rxF/iFJ0GbE
 kQN3UQrJh5+29SvDahmitIAFFebYrircVLa/aIgPj7zuwosKOeBSJz+y5
 u+idRmYzu5oKkMaLg+6Ov8nd5VW+7WOppmn52Wpb1qeh5HSdFOxGe5c9N
 bbTl65N6obFf+4ee6r+DtvqEjW5qcdHLYK8SedKJ8OkZwg5wUfhr2LcbS
 hnZh5S3wtab/7ptRPfwDAnLkUdYMIe707PP82Jgn3fkAnA2g7oBaqjCJ2
 CYYwsJvd4MjS8sjpJJ3ajCQIwN6G/AWbTmKJQJBtT1wEVVBFx0UNQWS0D A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="337835919"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="337835919"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 12:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="966129342"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="966129342"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2022 12:11:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 12:11:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 12:11:36 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 12:11:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBDIYlKj09A1WGorhLcTdsY+3Q83txeiSglxD3+N8gXrl4QQlk01wvVCI502b92pdTUNvGkWDTLIgZRXouk14rN+FdGH0F1RQhR4Is/IaxFuNkkwBaaz0pzQl/WfR5xeYG0jPhisnm+gFqXdOtI4u+dY6mMeQQwuDQDnsU+VVm0nSFTanmsaN7hcnOfdlKsoAkMZeIqJT7AMYwxlhnMMRISJfnoa5ZSBJzp8/+OPyGKXQKx6m4UqtHnOagF95JSDqwdfj0m6FOp3z2Nnd0tjdcJBsWDy1wCUAn9gpIPOtu0fy81z30kX7JIypcRYJpBxsc9DK8NCaXHiekdspGZJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvJTVWo4wSG3ljbtMwLeHbOi3kkhPynulusPPk9ipx8=;
 b=Sp8ghZ17pahtAmAssX5Vy9b6b4vXShWTte6suJWkEToABveD0nOb4JRRwswN9YfUuaLxJdARHztb/LX05sSHoyNwnRqM2npucdEaaLVhO2kJ/AMJLDlGqABibqcUbpBZP5sNUkDaVWUiKQr4ZY6vSCf7SNgXUMyGHT1iNBnCkGkVyf+86+4ssF/AqbXTTOLY9NpmCWNSPvDLEPAcyr+/zmEATPzQdDw4rdC/UgZRivgwaVdcMYHrrKzIMeRBrAV5f81TLJtFaIL9CVEjqJzICpHcuYQigbN7ymqJfFrZB2xxlHawXrSK1jpACDJ45ZAMTpcSyE9hHnWOlLubX7wrJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 20:11:31 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68%3]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 20:11:31 +0000
Date: Wed, 9 Nov 2022 12:11:29 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [PATCH v6 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y2wJcYU4GvB+dLWD@nvishwa1-DESK>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
 <CAM0jSHP6N321s4obATyEfVH1wUH2MEkU-bFy_yHShc=0M59=+w@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM0jSHP6N321s4obATyEfVH1wUH2MEkU-bFy_yHShc=0M59=+w@mail.gmail.com>
X-ClientProxiedBy: BY3PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:a03:255::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 40bb6d59-b2b0-4c91-889d-08dac28e97e9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwpTMOjF06OwYeIabHpaEfvVZi5pb4bdgPl+XmshPIitcoBrcWkll4HutrJV90woeIzYgIgux9/Ca6v5FHaImO6sQA0NuDWRNvhTvKg+AwFCCPKFU1Pg3sFIfr9AeYiuFv8BzIYTqSTUknxHza1e0Qt1pqQR/xdgtVMePpJuqm06ge8Iz/mFgH/EnOiJMzufZhYbQTfcN3gs7DlBjyb0Ccv5XDIRG/cCjkg085EcPZfmbG1Xzuj9kOAW4oH4Rek1EEN3C3byYkYOM7xE0qJ/RGZiCpas4p0QFVC9W7btfKNZ0+MFTE6phppR/rNX2hIJG/hlYUKXu+EXHGNfWC1nmDx/KMlBpvbT9sWVw8UIC/emt2sSENPKUyHkCILA9yOELG3/Zevnn+bkCIxpbwKSAjgw+7gNMDC/nOAmIR2I3CwnP9itJTavg+JOIpYckEv1DVAE26IolzrqJ521C7+btBfRRs0KwFnMbn4YXccoa5Vp2yj0vQ/hk8LFMl+T+Fbq+XoGFSvTdDM4hg0CdMarYzwynBCRUpKgoUwAvrLQd0/Z/mYuYNp+YUYOu5ewgVNhHs7kwSNc9GZCcJFdMDUWv/egSfUS+GQaUq/tNBOHZN5JdUwBpBJrHghtMO3k5JMpE0KY69psMk5yzPgnOzd/X9rK5adrI4O33PR5JxAK4UBrESQddD6TLXIqpIaX7d/kJu4Mmk6kVCuS8ciEXKOALkIEcPILm7o0lGuiCbfbEmZFwJDC9S7YFsr98KbpYIYo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(8936002)(5660300002)(478600001)(186003)(6486002)(2906002)(83380400001)(44832011)(6506007)(41300700001)(26005)(9686003)(38100700002)(6512007)(82960400001)(66556008)(66476007)(66946007)(8676002)(4326008)(33716001)(316002)(86362001)(6916009)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nOTLuk9luLR70kgSdeSR2SgPPVRCvJL5H++r6mQ5kNblwTb7I2Wlk5G5oCeX?=
 =?us-ascii?Q?n93zf/CJn80oFoELekQU9n+NHi2wA+oXekQQfQlj1Psj7EJzaMTiDo9XnTH5?=
 =?us-ascii?Q?02VX21H/38Pmlqv7iNIBwUp+eSXOEkUsvGJzfgwp3MYh7DvxB32X01RSY4Vg?=
 =?us-ascii?Q?UXx5GVlHI3XM2Esl07FsNJ7PWkEoBaCdqStW5/31irsZruYbSWNCTiIfrcZ1?=
 =?us-ascii?Q?3rNKOalsHHj3+LbRRv/+F7g5Z5SSmuDYAYuAtuimp4UJ7QElTq2Gi+PCXZjN?=
 =?us-ascii?Q?1LoRYExsNFsR/ItR5b0tlyynEsNeE/WjFikjpYjxA51cO6tQsLmDu4VOY7Uu?=
 =?us-ascii?Q?tEmZNyA1dXUcAucb5hCg5F49SJMeS4nBS3SFcSVmrhFrFgUcqgOvELlxCvkC?=
 =?us-ascii?Q?Vs3TNtzKFlEDz9Wd0WgbopteCSaj5MlgZi5FYgkaP+rKlmsA73rw7eZ2t3uX?=
 =?us-ascii?Q?frFppNE++g3avtCfsDsaqZHTtSPV+qG+Y3L+yvmQupqq4zIXcKM3taWE1LnV?=
 =?us-ascii?Q?Kzs+mjRyW/5rCnUoqI9fiv4X5NMl04gRxSUQpjCLKOVpli6CyemgWshrixR+?=
 =?us-ascii?Q?aemuX5T6j0N5bbuBRHggEvu/yqxYSpl7XZNDrKUt6DuwZp+qmbSStF0AwV57?=
 =?us-ascii?Q?egDftJ8KDlxYypvQPipLaWkF+BMoHiCfYdVm2GlewVlWp1sJtId9uMxpIg98?=
 =?us-ascii?Q?CMS3Vk17wFH5GBDnIx3Y3AlU41RUCXn7AMZw+NrpZhLagJ4HpI9MOjHd+vO5?=
 =?us-ascii?Q?R4z3tJv0+jtLQn/nnb+pDZ3pwSLV1/X2dCHO60N+yhtgm5vNrh/U/HTQZ31k?=
 =?us-ascii?Q?ocSCVYk3MR9OV3fzuLukOjHID+WBlkqBOffBkLRIXpKSxExITbh5MnPm1qmd?=
 =?us-ascii?Q?LlC0o+5ZLIm2JDV1pU9TfFS4WtT0Ne6ncZYEpsr9N6aP2HXmVIUZe/uZN8n9?=
 =?us-ascii?Q?2v2PaL7IbzaAJb9uYCRy7ZJOA2EJ6P9f3tOe21dQhE/2PAPnk9vxAO7opZtz?=
 =?us-ascii?Q?sPjj0LDLmhhqm5QPpf5ygX7GbNdIRyYE8JIgjilTbSWVkuA46imlDXlRHQa3?=
 =?us-ascii?Q?CwIFyjZXzKWCymZY5vj52i8r8HW3VBRHBcO+YV7wOXl9A1gElUxyGM1LXYBe?=
 =?us-ascii?Q?V6pOQBhxTthH19nIt2aXH/So+nT8meLsAiaNKL+u73Dc+xWvXdr4gCwIkcT+?=
 =?us-ascii?Q?iQt38V9eIO/n/0KyCZIJRI+Zk3rK5C0AgQCdTrfTaS7I1IVJ4ieJcykiaN+W?=
 =?us-ascii?Q?Y1OGN4SvQDkY3fUSfpLhiYSCMUEny+Hln+Irfq8q9bTTx79GgJyXOYF2S3e7?=
 =?us-ascii?Q?QsmXRibWLxP342dnKXofEnzdy3y6iSH0uB2ZJm9eavegM50eKNYCiajpUx9g?=
 =?us-ascii?Q?ayEHQb5z/KlpBRWCgzJv6kPR5cxE0JWJtgJWnlORaz4kP7xOV3M3c6BuM+nQ?=
 =?us-ascii?Q?IH0FgcVM6hDKQBdVjaPGbBMNMXtEA3hNnMEFIAY4SjL8P02WPwNr0Ck59T1D?=
 =?us-ascii?Q?K14PDW3z4vn9zKslRxTf02cAxJDeWiM0tUiNIR6CY7m1foKHm9exbaEWzQjN?=
 =?us-ascii?Q?DxW4/scFpaPI1g+bKmU9/Owa9Db8k1DZidbUZfax75AZmioXf+U20NPm76kY?=
 =?us-ascii?Q?bSvm8BBVrcFqqpCpZF4UuTY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bb6d59-b2b0-4c91-889d-08dac28e97e9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 20:11:31.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UcdsfVuV8VrqXiQ9Wz9T3WvGVxSnRI2xFn7ivnLcujjVtLGNcrEHQdtMgCUJMX0VpMO81XJXT47PwvOFrroZ2MoZPGTlMOD9mjBa9abwTZfg644Gysckik0uOdajW6c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 05:52:54PM +0000, Matthew Auld wrote:
>On Mon, 7 Nov 2022 at 08:53, Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com> wrote:
>>
>> Asynchronously unbind the vma upon vm_unbind call.
>> Fall back to synchronous unbind if backend doesn't support
>> async unbind or if async unbind fails.
>>
>> No need for vm_unbind out fence support as i915 will internally
>> handle all sequencing and user need not try to sequence any
>> operation with the unbind completion.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_vma.c | 51 ++++++++++++++++++++++++++++++---
>>  drivers/gpu/drm/i915/i915_vma.h |  1 +
>>  2 files changed, 48 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 08218e3a2f12..03c966fad87b 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -42,6 +42,8 @@
>>  #include "i915_vma.h"
>>  #include "i915_vma_resource.h"
>>
>> +static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
>> +
>>  static inline void assert_vma_held_evict(const struct i915_vma *vma)
>>  {
>>         /*
>> @@ -1711,7 +1713,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>         spin_unlock_irq(&gt->closed_lock);
>>  }
>>
>> -static void force_unbind(struct i915_vma *vma)
>> +static void force_unbind(struct i915_vma *vma, bool async)
>>  {
>>         if (!drm_mm_node_allocated(&vma->node))
>>                 return;
>> @@ -1725,7 +1727,21 @@ static void force_unbind(struct i915_vma *vma)
>>                 i915_vma_set_purged(vma);
>>
>>         atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>> -       WARN_ON(__i915_vma_unbind(vma));
>> +       if (async) {
>> +               struct dma_fence *fence;
>> +
>> +               fence = __i915_vma_unbind_async(vma);
>> +               if (IS_ERR_OR_NULL(fence)) {
>> +                       async = false;
>> +               } else {
>> +                       dma_resv_add_fence(vma->obj->base.resv, fence,
>> +                                          DMA_RESV_USAGE_READ);
>> +                       dma_fence_put(fence);
>> +               }
>> +       }
>> +
>> +       if (!async)
>> +               WARN_ON(__i915_vma_unbind(vma));
>>         GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>  }
>>
>> @@ -1785,7 +1801,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>>  {
>>         lockdep_assert_held(&vma->vm->mutex);
>>
>> -       force_unbind(vma);
>> +       force_unbind(vma, false);
>>         list_del_init(&vma->vm_link);
>>         release_references(vma, vma->vm->gt, false);
>>  }
>> @@ -1796,7 +1812,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>>         bool vm_ddestroy;
>>
>>         mutex_lock(&vma->vm->mutex);
>> -       force_unbind(vma);
>> +       force_unbind(vma, false);
>> +       list_del_init(&vma->vm_link);
>> +       vm_ddestroy = vma->vm_ddestroy;
>> +       vma->vm_ddestroy = false;
>> +
>> +       /* vma->vm may be freed when releasing vma->vm->mutex. */
>> +       gt = vma->vm->gt;
>> +       mutex_unlock(&vma->vm->mutex);
>> +       release_references(vma, gt, vm_ddestroy);
>> +}
>> +
>> +void i915_vma_destroy_async(struct i915_vma *vma)
>
>Where are we calling this? I can't find it.

Ah, got missed out in this patch. It should be called from vm_unbind
path. Will fix it.

Thanks,
Niranjana

>
>> +{
>> +       bool vm_ddestroy, async = vma->obj->mm.rsgt;
>> +       struct intel_gt *gt;
>> +
>> +       if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
>> +               async = false;
>> +
>> +       mutex_lock(&vma->vm->mutex);
>> +       /*
>> +        * Ensure any asynchronous binding is complete while using
>> +        * async unbind as we will be releasing the vma here.
>> +        */
>> +       if (async && i915_active_wait(&vma->active))
>> +               async = false;
>> +
>> +       force_unbind(vma, async);
>>         list_del_init(&vma->vm_link);
>>         vm_ddestroy = vma->vm_ddestroy;
>>         vma->vm_ddestroy = false;
>> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>> index 737ef310d046..25f15965dab8 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.h
>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>> @@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>>
>>  void i915_vma_destroy_locked(struct i915_vma *vma);
>>  void i915_vma_destroy(struct i915_vma *vma);
>> +void i915_vma_destroy_async(struct i915_vma *vma);
>>
>>  #define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
>>
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
