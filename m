Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BBA6D9F92
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 20:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD3310E125;
	Thu,  6 Apr 2023 18:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E74810E125;
 Thu,  6 Apr 2023 18:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680804797; x=1712340797;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=RypZbnJ0AbUEQwaUP8MNAQ+VYPH3y+LKtn9Qe0Wx8Vc=;
 b=awBdgQBWJG1TdoI+HmI2xw9CYRv6W07eNlTbgjN42/W483bjJTme0BLp
 2DTzbcbH6c4WBl/0F2EiimdZmR33UlzHYXXfFZ2kvPKiblggNrzVGK6oR
 fvMj07Jj1y9EEFJM3toVRrOEJrs2ow36B6fWL2q3GK7+xIc9dJiE94FOg
 dgBuS7axiE4ncM0C/t1Zxu3bUoEF0ftKszp/bcrRFGY9aG2uJGxxjxONG
 W1uvAyhcjEWhy89+Bo0ttCQf4YXl0JUpJ1lqIJCs5U2H5QFEB0OPSZD4/
 3Zn36+TQYQRWnT/rqsWHDw7sr1Hcr1xRstF/+dFcvoJ34BUdiG8nO7+MN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322454192"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
 d="scan'208,217";a="322454192"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 11:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="933293084"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
 d="scan'208,217";a="933293084"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.42.228])
 ([10.252.42.228])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 11:13:12 -0700
Content-Type: multipart/alternative;
 boundary="------------q8ZkH0txAsOmdXQfxV9n1Sg0"
Message-ID: <6e60f96e-e538-749a-46f1-103decc23815@linux.intel.com>
Date: Thu, 6 Apr 2023 20:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-2-fei.yang@intel.com>
 <e7f8baa8-dbdb-4362-6024-f7349b3ab2ed@linux.intel.com>
 <BYAPR11MB25677780C61CCC52B95746619A919@BYAPR11MB2567.namprd11.prod.outlook.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <BYAPR11MB25677780C61CCC52B95746619A919@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------q8ZkH0txAsOmdXQfxV9n1Sg0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Fei,

On 4/6/2023 4:55 PM, Yang, Fei wrote:
> > On 4/1/2023 8:38 AM, fei.yang@intel.com wrote:
> >> From: Fei Yang <fei.yang@intel.com>
> >>
> >> On MTL, GT can no longer allocate on LLC - only the CPU can.
> >> This, along with addition of support for ADM/L4 cache calls a
> >> MOCS/PAT table update.
> >> Also add PTE encode functions for MTL as it has different PAT
> >> index definition than previous platforms.
> >>
> >> BSpec: 44509, 45101, 44235
> >>
> >> Cc: Matt Roper <matthew.d.roper@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> Signed-off-by: Madhumitha Tolakanahalli Pradeep 
> <madhumitha.tolakanahalli.pradeep@intel.com>
> >> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >> ---
> >> drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
> >> drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 43 ++++++++++++--
> >> drivers/gpu/drm/i915/gt/gen8_ppgtt.h     |  3 +
> >> drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 ++++++++++-
> >> drivers/gpu/drm/i915/gt/intel_gtt.c      | 23 ++++++-
> >> drivers/gpu/drm/i915/gt/intel_gtt.h      | 20 ++++++-
> >> drivers/gpu/drm/i915/gt/intel_mocs.c     | 76 ++++++++++++++++++++++--
> >> drivers/gpu/drm/i915/gt/selftest_mocs.c  |  2 +-
> >> drivers/gpu/drm/i915/i915_pci.c          |  1 +
> >>   9 files changed, 189 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c 
> b/drivers/gpu/drm/i915/display/intel_dpt.c
> >> index b8027392144d..c5eacfdba1a5 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> >> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
> >>  vm->vma_ops.bind_vma    = dpt_bind_vma;
> >>  vm->vma_ops.unbind_vma  = dpt_unbind_vma;
> >>
> >> -     vm->pte_encode = gen8_ggtt_pte_encode;
> >> +     vm->pte_encode = vm->gt->ggtt->vm.pte_encode;
> >>
> >>        dpt->obj = dpt_obj;
> >>  dpt->obj->is_dpt = true;
> >> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c 
> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> >> index 4daaa6f55668..4197b43150cc 100644
> >> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> >> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> >> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
> >>        return pte;
> >>   }
> >>
> >> +static u64 mtl_pte_encode(dma_addr_t addr,
> >> + enum i915_cache_level level,
> >> +                       u32 flags)
> >> +{
> >> +     gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> >> +
> >> +     if (unlikely(flags & PTE_READ_ONLY))
> >> +             pte &= ~GEN8_PAGE_RW;
> >> +
> >> +     if (flags & PTE_LM)
> >> +             pte |= GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
> >> +
> >> +     switch (level) {
> >> +     case I915_CACHE_NONE:
> >> +             pte |= GEN12_PPGTT_PTE_PAT1;
> >> +             break;
> >> +     case I915_CACHE_LLC:
> >> +     case I915_CACHE_L3_LLC:
> >> +             pte |= GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;
> >> +             break;
> >> +     case I915_CACHE_WT:
> >> +             pte |= GEN12_PPGTT_PTE_PAT0;
> >> +             break;
> >> +     }
> >> +
> >> +     return pte;
> >> +}
> >> +
> >>   static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool 
> create)
> >>   {
> >>        struct drm_i915_private *i915 = ppgtt->vm.i915;
> >> @@ -427,7 +455,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
> >>                      u32 flags)
> >>   {
> >>        struct i915_page_directory *pd;
> >> -     const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, 
> flags);
> >> +     const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, 
> cache_level, flags);
> >>        gen8_pte_t *vaddr;
> >>
> >>        pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
> >> @@ -580,7 +608,7 @@ static void gen8_ppgtt_insert_huge(struct 
> i915_address_space *vm,
> >>       enum i915_cache_level cache_level,
> >>       u32 flags)
> >>   {
> >> -     const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, 
> flags);
> >> +     const gen8_pte_t pte_encode = vm->pte_encode(0, cache_level, 
> flags);
> >>        unsigned int rem = sg_dma_len(iter->sg);
> >>        u64 start = vma_res->start;
> >>
> >> @@ -743,7 +771,7 @@ static void gen8_ppgtt_insert_entry(struct 
> i915_address_space *vm,
> >>  GEM_BUG_ON(pt->is_compact);
> >>
> >>        vaddr = px_vaddr(pt);
> >> - vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level, flags);
> >> + vaddr[gen8_pd_index(idx, 0)] = vm->pte_encode(addr, level, flags);
> >>  drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
> >>   }
> >>
> >> @@ -773,7 +801,7 @@ static void 
> __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
> >>        }
> >>
> >>        vaddr = px_vaddr(pt);
> >> - vaddr[gen8_pd_index(idx, 0) / 16] = gen8_pte_encode(addr, level, 
> flags);
> >> + vaddr[gen8_pd_index(idx, 0) / 16] = vm->pte_encode(addr, level, 
> flags);
> >>   }
> >>
> >>   static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
> >> @@ -820,7 +848,7 @@ static int gen8_init_scratch(struct 
> i915_address_space *vm)
> >>                pte_flags |= PTE_LM;
> >>
> >>  vm->scratch[0]->encode =
> >> - gen8_pte_encode(px_dma(vm->scratch[0]),
> >> + vm->pte_encode(px_dma(vm->scratch[0]),
> >>    I915_CACHE_NONE, pte_flags);
> >>
> >>        for (i = 1; i <= vm->top; i++) {
> >> @@ -963,7 +991,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct 
> intel_gt *gt,
> >>         */
> >>  ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
> >>
> >> - ppgtt->vm.pte_encode = gen8_pte_encode;
> >> +     if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> >> + ppgtt->vm.pte_encode = mtl_pte_encode;
> >> +     else
> >> + ppgtt->vm.pte_encode = gen8_pte_encode;
> >>
> >>  ppgtt->vm.bind_async_flags = I915_VMA_LOCAL_BIND;
> >>  ppgtt->vm.insert_entries = gen8_ppgtt_insert;
> >> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h 
> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> >> index f541d19264b4..6b8ce7f4d25a 100644
> >> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> >> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> >> @@ -18,5 +18,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct 
> intel_gt *gt,
> >>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
> >> enum i915_cache_level level,
> >>                         u32 flags);
> >> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
> >> + unsigned int pat_index,
> >> +                     u32 flags);
> >>
> >>   #endif
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c 
> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >> index 3c7f1ed92f5b..ba3109338aee 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >> @@ -220,6 +220,33 @@ static void guc_ggtt_invalidate(struct 
> i915_ggtt *ggtt)
> >>        }
> >>   }
> >>
> >> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
> >> +                     enum i915_cache_level level,
> >> +                     u32 flags)
> >> +{
> >> +     gen8_pte_t pte = addr | GEN8_PAGE_PRESENT;
> >> +
> >> +     GEM_BUG_ON(addr & ~GEN12_GGTT_PTE_ADDR_MASK);
> >> +
> >> +     if (flags & PTE_LM)
> >> +             pte |= GEN12_GGTT_PTE_LM;
> >> +
> >> +     switch (level) {
> >> +     case I915_CACHE_NONE:
> >> +             pte |= MTL_GGTT_PTE_PAT1;
> >> +             break;
> >> +     case I915_CACHE_LLC:
> >> +     case I915_CACHE_L3_LLC:
> >> +             pte |= MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
> >> +             break;
> >> +     case I915_CACHE_WT:
> >> +             pte |= MTL_GGTT_PTE_PAT0;
> >> +             break;
> >> +     }
> >> +
> >> +     return pte;
> >> +}
> >> +
> >>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
> >> enum i915_cache_level level,
> >>                         u32 flags)
> >> @@ -247,7 +274,7 @@ static void gen8_ggtt_insert_page(struct 
> i915_address_space *vm,
> >>        gen8_pte_t __iomem *pte =
> >>                (gen8_pte_t __iomem *)ggtt->gsm + offset / 
> I915_GTT_PAGE_SIZE;
> >>
> >> -     gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, flags));
> >> +     gen8_set_pte(pte, ggtt->vm.pte_encode(addr, level, flags));
> >>
> >>  ggtt->invalidate(ggtt);
> >>   }
> >> @@ -257,8 +284,8 @@ static void gen8_ggtt_insert_entries(struct 
> i915_address_space *vm,
> >>         enum i915_cache_level level,
> >>         u32 flags)
> >>   {
> >> -     const gen8_pte_t pte_encode = gen8_ggtt_pte_encode(0, level, 
> flags);
> >>        struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> >> +     const gen8_pte_t pte_encode = ggtt->vm.pte_encode(0, level, 
> flags);
> >>        gen8_pte_t __iomem *gte;
> >>        gen8_pte_t __iomem *end;
> >>        struct sgt_iter iter;
> >> @@ -981,7 +1008,10 @@ static int gen8_gmch_probe(struct i915_ggtt 
> *ggtt)
> >>  ggtt->vm.vma_ops.bind_vma    = intel_ggtt_bind_vma;
> >>  ggtt->vm.vma_ops.unbind_vma  = intel_ggtt_unbind_vma;
> >>
> >> - ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
> >> +     if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> >> + ggtt->vm.pte_encode = mtl_ggtt_pte_encode;
> >> +     else
> >> + ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
> >>
> >>        return ggtt_probe_common(ggtt, size);
> >>   }
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
> b/drivers/gpu/drm/i915/gt/intel_gtt.c
> >> index 4f436ba7a3c8..1e1b34e22cf5 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> >> @@ -468,6 +468,25 @@ void gtt_write_workarounds(struct intel_gt *gt)
> >>        }
> >>   }
> >>
> >> +static void mtl_setup_private_ppat(struct intel_uncore *uncore)
> >> +{
> >> + intel_uncore_write(uncore, GEN12_PAT_INDEX(0),
> >> +  MTL_PPAT_L4_0_WB);
> >> + intel_uncore_write(uncore, GEN12_PAT_INDEX(1),
> >> +  MTL_PPAT_L4_1_WT);
> >> + intel_uncore_write(uncore, GEN12_PAT_INDEX(2),
> >> +  MTL_PPAT_L4_3_UC);
> >> + intel_uncore_write(uncore, GEN12_PAT_INDEX(3),
> >> +  MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
> >> + intel_uncore_write(uncore, GEN12_PAT_INDEX(4),
> >> +  MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
> >> +
> >> +     /*
> >> +      * Remaining PAT entries are left at the hardware-default
> >> +      * fully-cached setting
> >> +      */
> >> +}
> >> +
> >>   static void tgl_setup_private_ppat(struct intel_uncore *uncore)
> >>   {
> >>        /* TGL doesn't support LLC or AGE settings */
> >> @@ -603,7 +622,9 @@ void setup_private_pat(struct intel_gt *gt)
> >>
> >>  GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
> >>
> >> -     if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> >> +     if (IS_METEORLAKE(i915))
> >> + mtl_setup_private_ppat(uncore);
> >
> >
> > Could you please sync this with DII. We should be programming PAT for
> > media tile too.
> >
> > I have refactor this patch in DII along with taking care of media tile
> > and I think we should
> >
> > get those changes here too.
>
> I don't think the PAT index registers are multicasted for MTL. The 
> registers
> are at 0x4800 for the render tile and 0x384800 for the media tile, and 
> they
> get programmed in gt_init separately when iterating through each gt. No?


Primary GT is multicasted but the media one is not for MTL.
Added you to a internal email thread where Matt clarified this.


Regards,

Nirmoy

>
> -Fei
>
> > Regards,
> >
> > Nirmoy
> >
> >> +     else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> >>  xehp_setup_private_ppat(gt);
> >>        else if (GRAPHICS_VER(i915) >= 12)
> >>  tgl_setup_private_ppat(uncore);
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h 
> b/drivers/gpu/drm/i915/gt/intel_gtt.h
> >> index 69ce55f517f5..b632167eaf2e 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> >> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> >> @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
> >>   #define BYT_PTE_SNOOPED_BY_CPU_CACHES       REG_BIT(2)
> >>   #define BYT_PTE_WRITEABLE           REG_BIT(1)
> >>
> >> +#define GEN12_PPGTT_PTE_PAT3    BIT_ULL(62)
> >>   #define GEN12_PPGTT_PTE_LM  BIT_ULL(11)
> >> +#define GEN12_PPGTT_PTE_PAT2    BIT_ULL(7)
> >> +#define GEN12_PPGTT_PTE_NC      BIT_ULL(5)
> >> +#define GEN12_PPGTT_PTE_PAT1    BIT_ULL(4)
> >> +#define GEN12_PPGTT_PTE_PAT0    BIT_ULL(3)
> >>
> >> -#define GEN12_GGTT_PTE_LM    BIT_ULL(1)
> >> +#define GEN12_GGTT_PTE_LM            BIT_ULL(1)
> >> +#define MTL_GGTT_PTE_PAT0            BIT_ULL(52)
> >> +#define MTL_GGTT_PTE_PAT1            BIT_ULL(53)
> >> +#define GEN12_GGTT_PTE_ADDR_MASK     GENMASK_ULL(45, 12)
> >> +#define MTL_GGTT_PTE_PAT_MASK                GENMASK_ULL(53, 52)
> >>
> >>   #define GEN12_PDE_64K BIT(6)
> >>   #define GEN12_PTE_PS64 BIT(8)
> >> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;
> >>   #define GEN8_PDE_IPS_64K BIT(11)
> >>   #define GEN8_PDE_PS_2M BIT(7)
> >>
> >> +#define MTL_PPAT_L4_CACHE_POLICY_MASK        REG_GENMASK(3, 2)
> >> +#define MTL_PAT_INDEX_COH_MODE_MASK  REG_GENMASK(1, 0)
> >> +#define MTL_PPAT_L4_3_UC   
> REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
> >> +#define MTL_PPAT_L4_1_WT   
> REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
> >> +#define MTL_PPAT_L4_0_WB   
> REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
> >> +#define MTL_3_COH_2W REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
> >> +#define MTL_2_COH_1W REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
> >> +#define MTL_0_COH_NON   
>  REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
> >> +
> >>   enum i915_cache_level;
> >>
> >>   struct drm_i915_gem_object;
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c 
> b/drivers/gpu/drm/i915/gt/intel_mocs.c
> >> index 69b489e8dfed..89570f137b2c 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> >> @@ -40,6 +40,10 @@ struct drm_i915_mocs_table {
> >>   #define LE_COS(value)           ((value) << 15)
> >>   #define LE_SSE(value)           ((value) << 17)
> >>
> >> +/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> >> +#define _L4_CACHEABILITY(value)      ((value) << 2)
> >> +#define IG_PAT(value)            ((value) << 8)
> >> +
> >>   /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries 
> per word */
> >>   #define L3_ESC(value)           ((value) << 0)
> >>   #define L3_SCC(value)           ((value) << 1)
> >> @@ -50,6 +54,7 @@ struct drm_i915_mocs_table {
> >>   /* Helper defines */
> >>   #define GEN9_NUM_MOCS_ENTRIES       64  /* 63-64 are reserved, 
> but configured. */
> >>   #define PVC_NUM_MOCS_ENTRIES        3
> >> +#define MTL_NUM_MOCS_ENTRIES 16
> >>
> >>   /* (e)LLC caching options */
> >>   /*
> >> @@ -73,6 +78,12 @@ struct drm_i915_mocs_table {
> >>   #define L3_2_RESERVED           _L3_CACHEABILITY(2)
> >>   #define L3_3_WB           _L3_CACHEABILITY(3)
> >>
> >> +/* L4 caching options */
> >> +#define L4_0_WB            _L4_CACHEABILITY(0)
> >> +#define L4_1_WT            _L4_CACHEABILITY(1)
> >> +#define L4_2_RESERVED            _L4_CACHEABILITY(2)
> >> +#define L4_3_UC            _L4_CACHEABILITY(3)
> >> +
> >>   #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
> >>        [__idx] = { \
> >>  .control_value = __control_value, \
> >> @@ -416,6 +427,57 @@ static const struct drm_i915_mocs_entry 
> pvc_mocs_table[] = {
> >>        MOCS_ENTRY(2, 0, L3_3_WB),
> >>   };
> >>
> >> +static const struct drm_i915_mocs_entry mtl_mocs_table[] = {
> >> +     /* Error - Reserved for Non-Use */
> >> +     MOCS_ENTRY(0,
> >> +                IG_PAT(0),
> >> +                L3_LKUP(1) | L3_3_WB),
> >> +     /* Cached - L3 + L4 */
> >> +     MOCS_ENTRY(1,
> >> +                IG_PAT(1),
> >> +                L3_LKUP(1) | L3_3_WB),
> >> +     /* L4 - GO:L3 */
> >> +     MOCS_ENTRY(2,
> >> +                IG_PAT(1),
> >> +                L3_LKUP(1) | L3_1_UC),
> >> +     /* Uncached - GO:L3 */
> >> +     MOCS_ENTRY(3,
> >> +                IG_PAT(1) | L4_3_UC,
> >> +                L3_LKUP(1) | L3_1_UC),
> >> +     /* L4 - GO:Mem */
> >> +     MOCS_ENTRY(4,
> >> +                IG_PAT(1),
> >> +                L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
> >> +     /* Uncached - GO:Mem */
> >> +     MOCS_ENTRY(5,
> >> +                IG_PAT(1) | L4_3_UC,
> >> +                L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
> >> +     /* L4 - L3:NoLKUP; GO:L3 */
> >> +     MOCS_ENTRY(6,
> >> +                IG_PAT(1),
> >> +                L3_1_UC),
> >> +     /* Uncached - L3:NoLKUP; GO:L3 */
> >> +     MOCS_ENTRY(7,
> >> +                IG_PAT(1) | L4_3_UC,
> >> +                L3_1_UC),
> >> +     /* L4 - L3:NoLKUP; GO:Mem */
> >> +     MOCS_ENTRY(8,
> >> +                IG_PAT(1),
> >> +  L3_GLBGO(1) | L3_1_UC),
> >> +     /* Uncached - L3:NoLKUP; GO:Mem */
> >> +     MOCS_ENTRY(9,
> >> +                IG_PAT(1) | L4_3_UC,
> >> +  L3_GLBGO(1) | L3_1_UC),
> >> +     /* Display - L3; L4:WT */
> >> +     MOCS_ENTRY(14,
> >> +                IG_PAT(1) | L4_1_WT,
> >> +                L3_LKUP(1) | L3_3_WB),
> >> +     /* CCS - Non-Displayable */
> >> +     MOCS_ENTRY(15,
> >> +                IG_PAT(1),
> >> +  L3_GLBGO(1) | L3_1_UC),
> >> +};
> >> +
> >>   enum {
> >>        HAS_GLOBAL_MOCS = BIT(0),
> >>        HAS_ENGINE_MOCS = BIT(1),
> >> @@ -445,7 +507,13 @@ static unsigned int get_mocs_settings(const 
> struct drm_i915_private *i915,
> >>        memset(table, 0, sizeof(struct drm_i915_mocs_table));
> >>
> >>  table->unused_entries_index = I915_MOCS_PTE;
> >> -     if (IS_PONTEVECCHIO(i915)) {
> >> +     if (IS_METEORLAKE(i915)) {
> >> + table->size = ARRAY_SIZE(mtl_mocs_table);
> >> + table->table = mtl_mocs_table;
> >> + table->n_entries = MTL_NUM_MOCS_ENTRIES;
> >> + table->uc_index = 9;
> >> + table->unused_entries_index = 1;
> >> +     } else if (IS_PONTEVECCHIO(i915)) {
> >>  table->size = ARRAY_SIZE(pvc_mocs_table);
> >>  table->table = pvc_mocs_table;
> >>  table->n_entries = PVC_NUM_MOCS_ENTRIES;
> >> @@ -646,9 +714,9 @@ void intel_mocs_init_engine(struct 
> intel_engine_cs *engine)
> >>  init_l3cc_table(engine->gt, &table);
> >>   }
> >>
> >> -static u32 global_mocs_offset(void)
> >> +static u32 global_mocs_offset(struct intel_gt *gt)
> >>   {
> >> -     return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
> >> +     return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) + 
> gt->uncore->gsi_offset;
> >>   }
> >>
> >>   void intel_set_mocs_index(struct intel_gt *gt)
> >> @@ -671,7 +739,7 @@ void intel_mocs_init(struct intel_gt *gt)
> >>         */
> >>        flags = get_mocs_settings(gt->i915, &table);
> >>        if (flags & HAS_GLOBAL_MOCS)
> >> - __init_mocs_table(gt->uncore, &table, global_mocs_offset());
> >> + __init_mocs_table(gt->uncore, &table, global_mocs_offset(gt));
> >>
> >>        /*
> >>         * Initialize the L3CC table as part of mocs initalization 
> to make
> >> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c 
> b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> >> index ca009a6a13bd..730796346514 100644
> >> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> >> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> >> @@ -137,7 +137,7 @@ static int read_mocs_table(struct i915_request *rq,
> >>                return 0;
> >>
> >>        if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
> >> -             addr = global_mocs_offset();
> >> +             addr = global_mocs_offset(rq->engine->gt);
> >>        else
> >>                addr = mocs_offset(rq->engine);
> >>
> >> diff --git a/drivers/gpu/drm/i915/i915_pci.c 
> b/drivers/gpu/drm/i915/i915_pci.c
> >> index 621730b6551c..480b128499ae 100644
> >> --- a/drivers/gpu/drm/i915/i915_pci.c
> >> +++ b/drivers/gpu/drm/i915/i915_pci.c
> >> @@ -1149,6 +1149,7 @@ static const struct intel_device_info 
> mtl_info = {
> >>        .has_flat_ccs = 0,
> >>        .has_gmd_id = 1,
> >>        .has_guc_deprivilege = 1,
> >> +     .has_llc = 0,
> >>        .has_mslice_steering = 0,
> >>        .has_snoop = 1,
> >>  .__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>
--------------q8ZkH0txAsOmdXQfxV9n1Sg0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Fei, <br>
    </p>
    <div class="moz-cite-prefix">On 4/6/2023 4:55 PM, Yang, Fei wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BYAPR11MB25677780C61CCC52B95746619A919@BYAPR11MB2567.namprd11.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
        255, 255);" class="elementToProof ContentPasted0">
        &gt; On 4/1/2023 8:38 AM, <a class="moz-txt-link-abbreviated" href="mailto:fei.yang@intel.com">fei.yang@intel.com</a> wrote:
        <div class="ContentPasted0">&gt;&gt; From: Fei Yang
          <a class="moz-txt-link-rfc2396E" href="mailto:fei.yang@intel.com">&lt;fei.yang@intel.com&gt;</a></div>
        <div class="ContentPasted0">&gt;&gt;</div>
        <div class="ContentPasted0">&gt;&gt; On MTL, GT can no longer
          allocate on LLC - only the CPU can.</div>
        <div class="ContentPasted0">&gt;&gt; This, along with addition
          of support for ADM/L4 cache calls a</div>
        <div class="ContentPasted0">&gt;&gt; MOCS/PAT table update.</div>
        <div class="ContentPasted0">&gt;&gt; Also add PTE encode
          functions for MTL as it has different PAT</div>
        <div class="ContentPasted0">&gt;&gt; index definition than
          previous platforms.</div>
        <div class="ContentPasted0">&gt;&gt;</div>
        <div class="ContentPasted0">&gt;&gt; BSpec: 44509, 45101, 44235</div>
        <div class="ContentPasted0">&gt;&gt;</div>
        <div class="ContentPasted0">&gt;&gt; Cc: Matt Roper
          <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a></div>
        <div class="ContentPasted0">&gt;&gt; Cc: Lucas De Marchi
          <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a></div>
        <div class="ContentPasted0">&gt;&gt; Signed-off-by: Madhumitha
          Tolakanahalli Pradeep
          <a class="moz-txt-link-rfc2396E" href="mailto:madhumitha.tolakanahalli.pradeep@intel.com">&lt;madhumitha.tolakanahalli.pradeep@intel.com&gt;</a></div>
        <div class="ContentPasted0">&gt;&gt; Signed-off-by: Aravind
          Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a></div>
        <div class="ContentPasted0">&gt;&gt; Signed-off-by: Fei Yang
          <a class="moz-txt-link-rfc2396E" href="mailto:fei.yang@intel.com">&lt;fei.yang@intel.com&gt;</a></div>
        <div class="ContentPasted0">&gt;&gt; ---</div>
        <div class="ContentPasted0">&gt;&gt;  
          drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-</div>
        <div class="ContentPasted0">&gt;&gt;  
          drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 43 ++++++++++++--</div>
        <div class="ContentPasted0">&gt;&gt;  
          drivers/gpu/drm/i915/gt/gen8_ppgtt.h     |  3 +</div>
        <div class="ContentPasted0">&gt;&gt;  
          drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 ++++++++++-</div>
        <div class="ContentPasted0">&gt;&gt;  
          drivers/gpu/drm/i915/gt/intel_gtt.c      | 23 ++++++-</div>
        <div class="ContentPasted0">&gt;&gt;  
          drivers/gpu/drm/i915/gt/intel_gtt.h      | 20 ++++++-</div>
        <div class="ContentPasted0">&gt;&gt;  
          drivers/gpu/drm/i915/gt/intel_mocs.c     | 76
          ++++++++++++++++++++++--</div>
        <div class="ContentPasted0">&gt;&gt;  
          drivers/gpu/drm/i915/gt/selftest_mocs.c  |  2 +-</div>
        <div class="ContentPasted0">&gt;&gt;  
          drivers/gpu/drm/i915/i915_pci.c          |  1 +</div>
        <div class="ContentPasted0">&gt;&gt;   9 files changed, 189
          insertions(+), 17 deletions(-)</div>
        <div class="ContentPasted0">&gt;&gt;</div>
        <div class="ContentPasted0">&gt;&gt; diff --git
          a/drivers/gpu/drm/i915/display/intel_dpt.c
          b/drivers/gpu/drm/i915/display/intel_dpt.c</div>
        <div class="ContentPasted0">&gt;&gt; index
          b8027392144d..c5eacfdba1a5 100644</div>
        <div class="ContentPasted0">&gt;&gt; ---
          a/drivers/gpu/drm/i915/display/intel_dpt.c</div>
        <div class="ContentPasted0">&gt;&gt; +++
          b/drivers/gpu/drm/i915/display/intel_dpt.c</div>
        <div class="ContentPasted0">&gt;&gt; @@ -300,7 +300,7 @@
          intel_dpt_create(struct intel_framebuffer *fb)</div>
        <div class="ContentPasted0">&gt;&gt;      
           vm-&gt;vma_ops.bind_vma    = dpt_bind_vma;</div>
        <div class="ContentPasted0">&gt;&gt;      
           vm-&gt;vma_ops.unbind_vma  = dpt_unbind_vma;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; -     vm-&gt;pte_encode =
          gen8_ggtt_pte_encode;</div>
        <div class="ContentPasted0">&gt;&gt; +     vm-&gt;pte_encode =
          vm-&gt;gt-&gt;ggtt-&gt;vm.pte_encode;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;        dpt-&gt;obj =
          dpt_obj;</div>
        <div class="ContentPasted0">&gt;&gt;      
           dpt-&gt;obj-&gt;is_dpt = true;</div>
        <div class="ContentPasted0">&gt;&gt; diff --git
          a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
          b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c</div>
        <div class="ContentPasted0">&gt;&gt; index
          4daaa6f55668..4197b43150cc 100644</div>
        <div class="ContentPasted0">&gt;&gt; ---
          a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c</div>
        <div class="ContentPasted0">&gt;&gt; +++
          b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c</div>
        <div class="ContentPasted0">&gt;&gt; @@ -55,6 +55,34 @@ static
          u64 gen8_pte_encode(dma_addr_t addr,</div>
        <div class="ContentPasted0">&gt;&gt;        return pte;</div>
        <div class="ContentPasted0">&gt;&gt;   }</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; +static u64
          mtl_pte_encode(dma_addr_t addr,</div>
        <div class="ContentPasted0">&gt;&gt; +                      
          enum i915_cache_level level,</div>
        <div class="ContentPasted0">&gt;&gt; +                       u32
          flags)</div>
        <div class="ContentPasted0">&gt;&gt; +{</div>
        <div class="ContentPasted0">&gt;&gt; +     gen8_pte_t pte = addr
          | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt; +     if (unlikely(flags
          &amp; PTE_READ_ONLY))</div>
        <div class="ContentPasted0">&gt;&gt; +             pte &amp;=
          ~GEN8_PAGE_RW;</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt; +     if (flags &amp;
          PTE_LM)</div>
        <div class="ContentPasted0">&gt;&gt; +             pte |=
          GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt; +     switch (level) {</div>
        <div class="ContentPasted0">&gt;&gt; +     case I915_CACHE_NONE:</div>
        <div class="ContentPasted0">&gt;&gt; +             pte |=
          GEN12_PPGTT_PTE_PAT1;</div>
        <div class="ContentPasted0">&gt;&gt; +             break;</div>
        <div class="ContentPasted0">&gt;&gt; +     case I915_CACHE_LLC:</div>
        <div class="ContentPasted0">&gt;&gt; +     case
          I915_CACHE_L3_LLC:</div>
        <div class="ContentPasted0">&gt;&gt; +             pte |=
          GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;</div>
        <div class="ContentPasted0">&gt;&gt; +             break;</div>
        <div class="ContentPasted0">&gt;&gt; +     case I915_CACHE_WT:</div>
        <div class="ContentPasted0">&gt;&gt; +             pte |=
          GEN12_PPGTT_PTE_PAT0;</div>
        <div class="ContentPasted0">&gt;&gt; +             break;</div>
        <div class="ContentPasted0">&gt;&gt; +     }</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt; +     return pte;</div>
        <div class="ContentPasted0">&gt;&gt; +}</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt;   static void
          gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)</div>
        <div class="ContentPasted0">&gt;&gt;   {</div>
        <div class="ContentPasted0">&gt;&gt;        struct
          drm_i915_private *i915 = ppgtt-&gt;vm.i915;</div>
        <div class="ContentPasted0">&gt;&gt; @@ -427,7 +455,7 @@
          gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,</div>
        <div class="ContentPasted0">&gt;&gt;                      u32
          flags)</div>
        <div class="ContentPasted0">&gt;&gt;   {</div>
        <div class="ContentPasted0">&gt;&gt;        struct
          i915_page_directory *pd;</div>
        <div class="ContentPasted0">&gt;&gt; -     const gen8_pte_t
          pte_encode = gen8_pte_encode(0, cache_level, flags);</div>
        <div class="ContentPasted0">&gt;&gt; +     const gen8_pte_t
          pte_encode = ppgtt-&gt;vm.pte_encode(0, cache_level, flags);</div>
        <div class="ContentPasted0">&gt;&gt;        gen8_pte_t *vaddr;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;        pd =
          i915_pd_entry(pdp, gen8_pd_index(idx, 2));</div>
        <div class="ContentPasted0">&gt;&gt; @@ -580,7 +608,7 @@ static
          void gen8_ppgtt_insert_huge(struct i915_address_space *vm,</div>
        <div class="ContentPasted0">&gt;&gt;                            
                enum i915_cache_level cache_level,</div>
        <div class="ContentPasted0">&gt;&gt;                            
                u32 flags)</div>
        <div class="ContentPasted0">&gt;&gt;   {</div>
        <div class="ContentPasted0">&gt;&gt; -     const gen8_pte_t
          pte_encode = gen8_pte_encode(0, cache_level, flags);</div>
        <div class="ContentPasted0">&gt;&gt; +     const gen8_pte_t
          pte_encode = vm-&gt;pte_encode(0, cache_level, flags);</div>
        <div class="ContentPasted0">&gt;&gt;        unsigned int rem =
          sg_dma_len(iter-&gt;sg);</div>
        <div class="ContentPasted0">&gt;&gt;        u64 start =
          vma_res-&gt;start;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; @@ -743,7 +771,7 @@ static
          void gen8_ppgtt_insert_entry(struct i915_address_space *vm,</div>
        <div class="ContentPasted0">&gt;&gt;      
           GEM_BUG_ON(pt-&gt;is_compact);</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;        vaddr =
          px_vaddr(pt);</div>
        <div class="ContentPasted0">&gt;&gt; -    
          vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level,
          flags);</div>
        <div class="ContentPasted0">&gt;&gt; +    
          vaddr[gen8_pd_index(idx, 0)] = vm-&gt;pte_encode(addr, level,
          flags);</div>
        <div class="ContentPasted0">&gt;&gt;      
           drm_clflush_virt_range(&amp;vaddr[gen8_pd_index(idx, 0)],
          sizeof(*vaddr));</div>
        <div class="ContentPasted0">&gt;&gt;   }</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; @@ -773,7 +801,7 @@ static
          void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space
          *vm,</div>
        <div class="ContentPasted0">&gt;&gt;        }</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;        vaddr =
          px_vaddr(pt);</div>
        <div class="ContentPasted0">&gt;&gt; -    
          vaddr[gen8_pd_index(idx, 0) / 16] = gen8_pte_encode(addr,
          level, flags);</div>
        <div class="ContentPasted0">&gt;&gt; +    
          vaddr[gen8_pd_index(idx, 0) / 16] = vm-&gt;pte_encode(addr,
          level, flags);</div>
        <div class="ContentPasted0">&gt;&gt;   }</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;   static void
          xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,</div>
        <div class="ContentPasted0">&gt;&gt; @@ -820,7 +848,7 @@ static
          int gen8_init_scratch(struct i915_address_space *vm)</div>
        <div class="ContentPasted0">&gt;&gt;                pte_flags |=
          PTE_LM;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;      
           vm-&gt;scratch[0]-&gt;encode =</div>
        <div class="ContentPasted0">&gt;&gt; -            
          gen8_pte_encode(px_dma(vm-&gt;scratch[0]),</div>
        <div class="ContentPasted0">&gt;&gt; +            
          vm-&gt;pte_encode(px_dma(vm-&gt;scratch[0]),</div>
        <div class="ContentPasted0">&gt;&gt;                            
             I915_CACHE_NONE, pte_flags);</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;        for (i = 1; i &lt;=
          vm-&gt;top; i++) {</div>
        <div class="ContentPasted0">&gt;&gt; @@ -963,7 +991,10 @@ struct
          i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,</div>
        <div class="ContentPasted0">&gt;&gt;         */</div>
        <div class="ContentPasted0">&gt;&gt;      
           ppgtt-&gt;vm.alloc_scratch_dma = alloc_pt_dma;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; -    
          ppgtt-&gt;vm.pte_encode = gen8_pte_encode;</div>
        <div class="ContentPasted0">&gt;&gt; +     if
          (GRAPHICS_VER_FULL(gt-&gt;i915) &gt;= IP_VER(12, 70))</div>
        <div class="ContentPasted0">&gt;&gt; +            
          ppgtt-&gt;vm.pte_encode = mtl_pte_encode;</div>
        <div class="ContentPasted0">&gt;&gt; +     else</div>
        <div class="ContentPasted0">&gt;&gt; +            
          ppgtt-&gt;vm.pte_encode = gen8_pte_encode;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;      
           ppgtt-&gt;vm.bind_async_flags = I915_VMA_LOCAL_BIND;</div>
        <div class="ContentPasted0">&gt;&gt;      
           ppgtt-&gt;vm.insert_entries = gen8_ppgtt_insert;</div>
        <div class="ContentPasted0">&gt;&gt; diff --git
          a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
          b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h</div>
        <div class="ContentPasted0">&gt;&gt; index
          f541d19264b4..6b8ce7f4d25a 100644</div>
        <div class="ContentPasted0">&gt;&gt; ---
          a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h</div>
        <div class="ContentPasted0">&gt;&gt; +++
          b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h</div>
        <div class="ContentPasted0">&gt;&gt; @@ -18,5 +18,8 @@ struct
          i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,</div>
        <div class="ContentPasted0">&gt;&gt;   u64
          gen8_ggtt_pte_encode(dma_addr_t addr,</div>
        <div class="ContentPasted0">&gt;&gt;                        
          enum i915_cache_level level,</div>
        <div class="ContentPasted0">&gt;&gt;                         u32
          flags);</div>
        <div class="ContentPasted0">&gt;&gt; +u64
          mtl_ggtt_pte_encode(dma_addr_t addr,</div>
        <div class="ContentPasted0">&gt;&gt; +                    
          unsigned int pat_index,</div>
        <div class="ContentPasted0">&gt;&gt; +                     u32
          flags);</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;   #endif</div>
        <div class="ContentPasted0">&gt;&gt; diff --git
          a/drivers/gpu/drm/i915/gt/intel_ggtt.c
          b/drivers/gpu/drm/i915/gt/intel_ggtt.c</div>
        <div class="ContentPasted0">&gt;&gt; index
          3c7f1ed92f5b..ba3109338aee 100644</div>
        <div class="ContentPasted0">&gt;&gt; ---
          a/drivers/gpu/drm/i915/gt/intel_ggtt.c</div>
        <div class="ContentPasted0">&gt;&gt; +++
          b/drivers/gpu/drm/i915/gt/intel_ggtt.c</div>
        <div class="ContentPasted0">&gt;&gt; @@ -220,6 +220,33 @@ static
          void guc_ggtt_invalidate(struct i915_ggtt *ggtt)</div>
        <div class="ContentPasted0">&gt;&gt;        }</div>
        <div class="ContentPasted0">&gt;&gt;   }</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; +u64
          mtl_ggtt_pte_encode(dma_addr_t addr,</div>
        <div class="ContentPasted0">&gt;&gt; +                     enum
          i915_cache_level level,</div>
        <div class="ContentPasted0">&gt;&gt; +                     u32
          flags)</div>
        <div class="ContentPasted0">&gt;&gt; +{</div>
        <div class="ContentPasted0">&gt;&gt; +     gen8_pte_t pte = addr
          | GEN8_PAGE_PRESENT;</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt; +     GEM_BUG_ON(addr &amp;
          ~GEN12_GGTT_PTE_ADDR_MASK);</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt; +     if (flags &amp;
          PTE_LM)</div>
        <div class="ContentPasted0">&gt;&gt; +             pte |=
          GEN12_GGTT_PTE_LM;</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt; +     switch (level) {</div>
        <div class="ContentPasted0">&gt;&gt; +     case I915_CACHE_NONE:</div>
        <div class="ContentPasted0">&gt;&gt; +             pte |=
          MTL_GGTT_PTE_PAT1;</div>
        <div class="ContentPasted0">&gt;&gt; +             break;</div>
        <div class="ContentPasted0">&gt;&gt; +     case I915_CACHE_LLC:</div>
        <div class="ContentPasted0">&gt;&gt; +     case
          I915_CACHE_L3_LLC:</div>
        <div class="ContentPasted0">&gt;&gt; +             pte |=
          MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;</div>
        <div class="ContentPasted0">&gt;&gt; +             break;</div>
        <div class="ContentPasted0">&gt;&gt; +     case I915_CACHE_WT:</div>
        <div class="ContentPasted0">&gt;&gt; +             pte |=
          MTL_GGTT_PTE_PAT0;</div>
        <div class="ContentPasted0">&gt;&gt; +             break;</div>
        <div class="ContentPasted0">&gt;&gt; +     }</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt; +     return pte;</div>
        <div class="ContentPasted0">&gt;&gt; +}</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt;   u64
          gen8_ggtt_pte_encode(dma_addr_t addr,</div>
        <div class="ContentPasted0">&gt;&gt;                        
          enum i915_cache_level level,</div>
        <div class="ContentPasted0">&gt;&gt;                         u32
          flags)</div>
        <div class="ContentPasted0">&gt;&gt; @@ -247,7 +274,7 @@ static
          void gen8_ggtt_insert_page(struct i915_address_space *vm,</div>
        <div class="ContentPasted0">&gt;&gt;        gen8_pte_t __iomem
          *pte =</div>
        <div class="ContentPasted0">&gt;&gt;                (gen8_pte_t
          __iomem *)ggtt-&gt;gsm + offset / I915_GTT_PAGE_SIZE;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; -     gen8_set_pte(pte,
          gen8_ggtt_pte_encode(addr, level, flags));</div>
        <div class="ContentPasted0">&gt;&gt; +     gen8_set_pte(pte,
          ggtt-&gt;vm.pte_encode(addr, level, flags));</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;      
           ggtt-&gt;invalidate(ggtt);</div>
        <div class="ContentPasted0">&gt;&gt;   }</div>
        <div class="ContentPasted0">&gt;&gt; @@ -257,8 +284,8 @@ static
          void gen8_ggtt_insert_entries(struct i915_address_space *vm,</div>
        <div class="ContentPasted0">&gt;&gt;                            
                  enum i915_cache_level level,</div>
        <div class="ContentPasted0">&gt;&gt;                            
                  u32 flags)</div>
        <div class="ContentPasted0">&gt;&gt;   {</div>
        <div class="ContentPasted0">&gt;&gt; -     const gen8_pte_t
          pte_encode = gen8_ggtt_pte_encode(0, level, flags);</div>
        <div class="ContentPasted0">&gt;&gt;        struct i915_ggtt
          *ggtt = i915_vm_to_ggtt(vm);</div>
        <div class="ContentPasted0">&gt;&gt; +     const gen8_pte_t
          pte_encode = ggtt-&gt;vm.pte_encode(0, level, flags);</div>
        <div class="ContentPasted0">&gt;&gt;        gen8_pte_t __iomem
          *gte;</div>
        <div class="ContentPasted0">&gt;&gt;        gen8_pte_t __iomem
          *end;</div>
        <div class="ContentPasted0">&gt;&gt;        struct sgt_iter
          iter;</div>
        <div class="ContentPasted0">&gt;&gt; @@ -981,7 +1008,10 @@
          static int gen8_gmch_probe(struct i915_ggtt *ggtt)</div>
        <div class="ContentPasted0">&gt;&gt;      
           ggtt-&gt;vm.vma_ops.bind_vma    = intel_ggtt_bind_vma;</div>
        <div class="ContentPasted0">&gt;&gt;      
           ggtt-&gt;vm.vma_ops.unbind_vma  = intel_ggtt_unbind_vma;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; -    
          ggtt-&gt;vm.pte_encode = gen8_ggtt_pte_encode;</div>
        <div class="ContentPasted0">&gt;&gt; +     if
          (GRAPHICS_VER_FULL(i915) &gt;= IP_VER(12, 70))</div>
        <div class="ContentPasted0">&gt;&gt; +            
          ggtt-&gt;vm.pte_encode = mtl_ggtt_pte_encode;</div>
        <div class="ContentPasted0">&gt;&gt; +     else</div>
        <div class="ContentPasted0">&gt;&gt; +            
          ggtt-&gt;vm.pte_encode = gen8_ggtt_pte_encode;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;        return
          ggtt_probe_common(ggtt, size);</div>
        <div class="ContentPasted0">&gt;&gt;   }</div>
        <div class="ContentPasted0">&gt;&gt; diff --git
          a/drivers/gpu/drm/i915/gt/intel_gtt.c
          b/drivers/gpu/drm/i915/gt/intel_gtt.c</div>
        <div class="ContentPasted0">&gt;&gt; index
          4f436ba7a3c8..1e1b34e22cf5 100644</div>
        <div class="ContentPasted0">&gt;&gt; ---
          a/drivers/gpu/drm/i915/gt/intel_gtt.c</div>
        <div class="ContentPasted0">&gt;&gt; +++
          b/drivers/gpu/drm/i915/gt/intel_gtt.c</div>
        <div class="ContentPasted0">&gt;&gt; @@ -468,6 +468,25 @@ void
          gtt_write_workarounds(struct intel_gt *gt)</div>
        <div class="ContentPasted0">&gt;&gt;        }</div>
        <div class="ContentPasted0">&gt;&gt;   }</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; +static void
          mtl_setup_private_ppat(struct intel_uncore *uncore)</div>
        <div class="ContentPasted0">&gt;&gt; +{</div>
        <div class="ContentPasted0">&gt;&gt; +    
          intel_uncore_write(uncore, GEN12_PAT_INDEX(0),</div>
        <div class="ContentPasted0">&gt;&gt; +                      
           MTL_PPAT_L4_0_WB);</div>
        <div class="ContentPasted0">&gt;&gt; +    
          intel_uncore_write(uncore, GEN12_PAT_INDEX(1),</div>
        <div class="ContentPasted0">&gt;&gt; +                      
           MTL_PPAT_L4_1_WT);</div>
        <div class="ContentPasted0">&gt;&gt; +    
          intel_uncore_write(uncore, GEN12_PAT_INDEX(2),</div>
        <div class="ContentPasted0">&gt;&gt; +                      
           MTL_PPAT_L4_3_UC);</div>
        <div class="ContentPasted0">&gt;&gt; +    
          intel_uncore_write(uncore, GEN12_PAT_INDEX(3),</div>
        <div class="ContentPasted0">&gt;&gt; +                      
           MTL_PPAT_L4_0_WB | MTL_2_COH_1W);</div>
        <div class="ContentPasted0">&gt;&gt; +    
          intel_uncore_write(uncore, GEN12_PAT_INDEX(4),</div>
        <div class="ContentPasted0">&gt;&gt; +                      
           MTL_PPAT_L4_0_WB | MTL_3_COH_2W);</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt; +     /*</div>
        <div class="ContentPasted0">&gt;&gt; +      * Remaining PAT
          entries are left at the hardware-default</div>
        <div class="ContentPasted0">&gt;&gt; +      * fully-cached
          setting</div>
        <div class="ContentPasted0">&gt;&gt; +      */</div>
        <div class="ContentPasted0">&gt;&gt; +}</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt;   static void
          tgl_setup_private_ppat(struct intel_uncore *uncore)</div>
        <div class="ContentPasted0">&gt;&gt;   {</div>
        <div class="ContentPasted0">&gt;&gt;        /* TGL doesn't
          support LLC or AGE settings */</div>
        <div class="ContentPasted0">&gt;&gt; @@ -603,7 +622,9 @@ void
          setup_private_pat(struct intel_gt *gt)</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;      
           GEM_BUG_ON(GRAPHICS_VER(i915) &lt; 8);</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; -     if
          (GRAPHICS_VER_FULL(i915) &gt;= IP_VER(12, 50))</div>
        <div class="ContentPasted0">&gt;&gt; +     if
          (IS_METEORLAKE(i915))</div>
        <div class="ContentPasted0">&gt;&gt; +            
          mtl_setup_private_ppat(uncore);</div>
        <div class="ContentPasted0">&gt;</div>
        <div class="ContentPasted0">&gt;</div>
        <div class="ContentPasted0">&gt; Could you please sync this with
          DII. We should be programming PAT for</div>
        <div class="ContentPasted0">&gt; media tile too.</div>
        <div class="ContentPasted0">&gt;</div>
        <div class="ContentPasted0">&gt; I have refactor this patch in
          DII along with taking care of media tile</div>
        <div class="ContentPasted0">&gt; and I think we should</div>
        <div class="ContentPasted0">&gt;</div>
        <div class="ContentPasted0">&gt; get those changes here too.</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">I don't think the PAT index
          registers are multicasted for MTL. The registers</div>
        <div class="ContentPasted0">are at 0x4800 for the render tile
          and 0x384800 for the media tile, and they</div>
        <div class="ContentPasted0">get programmed in gt_init separately
          when iterating through each gt. No?</div>
      </div>
    </blockquote>
    <p><br>
      Primary GT is multicasted but the media one is not for MTL.<br>
      Added you to a internal email thread where Matt clarified this.</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy <br>
    </p>
    <blockquote type="cite"
cite="mid:BYAPR11MB25677780C61CCC52B95746619A919@BYAPR11MB2567.namprd11.prod.outlook.com">
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
        255, 255);" class="elementToProof ContentPasted0">
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">-Fei</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">&gt; Regards,</div>
        <div class="ContentPasted0">&gt;</div>
        <div class="ContentPasted0">&gt; Nirmoy</div>
        <div class="ContentPasted0">&gt;</div>
        <div class="ContentPasted0">&gt;&gt; +     else if
          (GRAPHICS_VER_FULL(i915) &gt;= IP_VER(12, 50))</div>
        <div class="ContentPasted0">&gt;&gt;              
           xehp_setup_private_ppat(gt);</div>
        <div class="ContentPasted0">&gt;&gt;        else if
          (GRAPHICS_VER(i915) &gt;= 12)</div>
        <div class="ContentPasted0">&gt;&gt;              
           tgl_setup_private_ppat(uncore);</div>
        <div class="ContentPasted0">&gt;&gt; diff --git
          a/drivers/gpu/drm/i915/gt/intel_gtt.h
          b/drivers/gpu/drm/i915/gt/intel_gtt.h</div>
        <div class="ContentPasted0">&gt;&gt; index
          69ce55f517f5..b632167eaf2e 100644</div>
        <div class="ContentPasted0">&gt;&gt; ---
          a/drivers/gpu/drm/i915/gt/intel_gtt.h</div>
        <div class="ContentPasted0">&gt;&gt; +++
          b/drivers/gpu/drm/i915/gt/intel_gtt.h</div>
        <div class="ContentPasted0">&gt;&gt; @@ -88,9 +88,18 @@ typedef
          u64 gen8_pte_t;</div>
        <div class="ContentPasted0">&gt;&gt;   #define
          BYT_PTE_SNOOPED_BY_CPU_CACHES       REG_BIT(2)</div>
        <div class="ContentPasted0">&gt;&gt;   #define BYT_PTE_WRITEABLE
                    REG_BIT(1)</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; +#define
          GEN12_PPGTT_PTE_PAT3    BIT_ULL(62)</div>
        <div class="ContentPasted0">&gt;&gt;   #define
          GEN12_PPGTT_PTE_LM  BIT_ULL(11)</div>
        <div class="ContentPasted0">&gt;&gt; +#define
          GEN12_PPGTT_PTE_PAT2    BIT_ULL(7)</div>
        <div class="ContentPasted0">&gt;&gt; +#define GEN12_PPGTT_PTE_NC
               BIT_ULL(5)</div>
        <div class="ContentPasted0">&gt;&gt; +#define
          GEN12_PPGTT_PTE_PAT1    BIT_ULL(4)</div>
        <div class="ContentPasted0">&gt;&gt; +#define
          GEN12_PPGTT_PTE_PAT0    BIT_ULL(3)</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; -#define GEN12_GGTT_PTE_LM
             BIT_ULL(1)</div>
        <div class="ContentPasted0">&gt;&gt; +#define GEN12_GGTT_PTE_LM
                     BIT_ULL(1)</div>
        <div class="ContentPasted0">&gt;&gt; +#define MTL_GGTT_PTE_PAT0
                     BIT_ULL(52)</div>
        <div class="ContentPasted0">&gt;&gt; +#define MTL_GGTT_PTE_PAT1
                     BIT_ULL(53)</div>
        <div class="ContentPasted0">&gt;&gt; +#define
          GEN12_GGTT_PTE_ADDR_MASK     GENMASK_ULL(45, 12)</div>
        <div class="ContentPasted0">&gt;&gt; +#define
          MTL_GGTT_PTE_PAT_MASK                GENMASK_ULL(53, 52)</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;   #define GEN12_PDE_64K
          BIT(6)</div>
        <div class="ContentPasted0">&gt;&gt;   #define GEN12_PTE_PS64
          BIT(8)</div>
        <div class="ContentPasted0">&gt;&gt; @@ -147,6 +156,15 @@
          typedef u64 gen8_pte_t;</div>
        <div class="ContentPasted0">&gt;&gt;   #define GEN8_PDE_IPS_64K
          BIT(11)</div>
        <div class="ContentPasted0">&gt;&gt;   #define GEN8_PDE_PS_2M  
          BIT(7)</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; +#define
          MTL_PPAT_L4_CACHE_POLICY_MASK        REG_GENMASK(3, 2)</div>
        <div class="ContentPasted0">&gt;&gt; +#define
          MTL_PAT_INDEX_COH_MODE_MASK  REG_GENMASK(1, 0)</div>
        <div class="ContentPasted0">&gt;&gt; +#define MTL_PPAT_L4_3_UC  
            REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)</div>
        <div class="ContentPasted0">&gt;&gt; +#define MTL_PPAT_L4_1_WT  
            REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)</div>
        <div class="ContentPasted0">&gt;&gt; +#define MTL_PPAT_L4_0_WB  
            REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)</div>
        <div class="ContentPasted0">&gt;&gt; +#define MTL_3_COH_2W
          REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)</div>
        <div class="ContentPasted0">&gt;&gt; +#define MTL_2_COH_1W
          REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)</div>
        <div class="ContentPasted0">&gt;&gt; +#define MTL_0_COH_NON    
             REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt;   enum i915_cache_level;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;   struct
          drm_i915_gem_object;</div>
        <div class="ContentPasted0">&gt;&gt; diff --git
          a/drivers/gpu/drm/i915/gt/intel_mocs.c
          b/drivers/gpu/drm/i915/gt/intel_mocs.c</div>
        <div class="ContentPasted0">&gt;&gt; index
          69b489e8dfed..89570f137b2c 100644</div>
        <div class="ContentPasted0">&gt;&gt; ---
          a/drivers/gpu/drm/i915/gt/intel_mocs.c</div>
        <div class="ContentPasted0">&gt;&gt; +++
          b/drivers/gpu/drm/i915/gt/intel_mocs.c</div>
        <div class="ContentPasted0">&gt;&gt; @@ -40,6 +40,10 @@ struct
          drm_i915_mocs_table {</div>
        <div class="ContentPasted0">&gt;&gt;   #define LE_COS(value)    
                    ((value) &lt;&lt; 15)</div>
        <div class="ContentPasted0">&gt;&gt;   #define LE_SSE(value)    
                    ((value) &lt;&lt; 17)</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; +/* Defines for the tables
          (GLOB_MOCS_0 - GLOB_MOCS_16) */</div>
        <div class="ContentPasted0">&gt;&gt; +#define
          _L4_CACHEABILITY(value)      ((value) &lt;&lt; 2)</div>
        <div class="ContentPasted0">&gt;&gt; +#define IG_PAT(value)    
                     ((value) &lt;&lt; 8)</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt;   /* Defines for the tables
          (LNCFMOCS0 - LNCFMOCS31) - two entries per word */</div>
        <div class="ContentPasted0">&gt;&gt;   #define L3_ESC(value)    
                    ((value) &lt;&lt; 0)</div>
        <div class="ContentPasted0">&gt;&gt;   #define L3_SCC(value)    
                    ((value) &lt;&lt; 1)</div>
        <div class="ContentPasted0">&gt;&gt; @@ -50,6 +54,7 @@ struct
          drm_i915_mocs_table {</div>
        <div class="ContentPasted0">&gt;&gt;   /* Helper defines */</div>
        <div class="ContentPasted0">&gt;&gt;   #define
          GEN9_NUM_MOCS_ENTRIES       64  /* 63-64 are reserved, but
          configured. */</div>
        <div class="ContentPasted0">&gt;&gt;   #define
          PVC_NUM_MOCS_ENTRIES        3</div>
        <div class="ContentPasted0">&gt;&gt; +#define
          MTL_NUM_MOCS_ENTRIES 16</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;   /* (e)LLC caching options
          */</div>
        <div class="ContentPasted0">&gt;&gt;   /*</div>
        <div class="ContentPasted0">&gt;&gt; @@ -73,6 +78,12 @@ struct
          drm_i915_mocs_table {</div>
        <div class="ContentPasted0">&gt;&gt;   #define L3_2_RESERVED    
                    _L3_CACHEABILITY(2)</div>
        <div class="ContentPasted0">&gt;&gt;   #define L3_3_WB          
                    _L3_CACHEABILITY(3)</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; +/* L4 caching options */</div>
        <div class="ContentPasted0">&gt;&gt; +#define L4_0_WB          
                     _L4_CACHEABILITY(0)</div>
        <div class="ContentPasted0">&gt;&gt; +#define L4_1_WT          
                     _L4_CACHEABILITY(1)</div>
        <div class="ContentPasted0">&gt;&gt; +#define L4_2_RESERVED    
                     _L4_CACHEABILITY(2)</div>
        <div class="ContentPasted0">&gt;&gt; +#define L4_3_UC          
                     _L4_CACHEABILITY(3)</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt;   #define MOCS_ENTRY(__idx,
          __control_value, __l3cc_value) \</div>
        <div class="ContentPasted0">&gt;&gt;        [__idx] = { \</div>
        <div class="ContentPasted0">&gt;&gt;              
           .control_value = __control_value, \</div>
        <div class="ContentPasted0">&gt;&gt; @@ -416,6 +427,57 @@ static
          const struct drm_i915_mocs_entry pvc_mocs_table[] = {</div>
        <div class="ContentPasted0">&gt;&gt;        MOCS_ENTRY(2, 0,
          L3_3_WB),</div>
        <div class="ContentPasted0">&gt;&gt;   };</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; +static const struct
          drm_i915_mocs_entry mtl_mocs_table[] = {</div>
        <div class="ContentPasted0">&gt;&gt; +     /* Error - Reserved
          for Non-Use */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(0,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(0),</div>
        <div class="ContentPasted0">&gt;&gt; +                L3_LKUP(1)
          | L3_3_WB),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* Cached - L3 + L4
          */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(1,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1),</div>
        <div class="ContentPasted0">&gt;&gt; +                L3_LKUP(1)
          | L3_3_WB),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* L4 - GO:L3 */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(2,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1),</div>
        <div class="ContentPasted0">&gt;&gt; +                L3_LKUP(1)
          | L3_1_UC),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* Uncached - GO:L3
          */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(3,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1)
          | L4_3_UC,</div>
        <div class="ContentPasted0">&gt;&gt; +                L3_LKUP(1)
          | L3_1_UC),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* L4 - GO:Mem */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(4,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1),</div>
        <div class="ContentPasted0">&gt;&gt; +                L3_LKUP(1)
          | L3_GLBGO(1) | L3_1_UC),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* Uncached - GO:Mem
          */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(5,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1)
          | L4_3_UC,</div>
        <div class="ContentPasted0">&gt;&gt; +                L3_LKUP(1)
          | L3_GLBGO(1) | L3_1_UC),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* L4 - L3:NoLKUP;
          GO:L3 */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(6,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1),</div>
        <div class="ContentPasted0">&gt;&gt; +                L3_1_UC),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* Uncached -
          L3:NoLKUP; GO:L3 */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(7,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1)
          | L4_3_UC,</div>
        <div class="ContentPasted0">&gt;&gt; +                L3_1_UC),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* L4 - L3:NoLKUP;
          GO:Mem */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(8,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1),</div>
        <div class="ContentPasted0">&gt;&gt; +              
           L3_GLBGO(1) | L3_1_UC),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* Uncached -
          L3:NoLKUP; GO:Mem */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(9,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1)
          | L4_3_UC,</div>
        <div class="ContentPasted0">&gt;&gt; +              
           L3_GLBGO(1) | L3_1_UC),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* Display - L3;
          L4:WT */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(14,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1)
          | L4_1_WT,</div>
        <div class="ContentPasted0">&gt;&gt; +                L3_LKUP(1)
          | L3_3_WB),</div>
        <div class="ContentPasted0">&gt;&gt; +     /* CCS -
          Non-Displayable */</div>
        <div class="ContentPasted0">&gt;&gt; +     MOCS_ENTRY(15,</div>
        <div class="ContentPasted0">&gt;&gt; +                IG_PAT(1),</div>
        <div class="ContentPasted0">&gt;&gt; +              
           L3_GLBGO(1) | L3_1_UC),</div>
        <div class="ContentPasted0">&gt;&gt; +};</div>
        <div class="ContentPasted0">&gt;&gt; +</div>
        <div class="ContentPasted0">&gt;&gt;   enum {</div>
        <div class="ContentPasted0">&gt;&gt;        HAS_GLOBAL_MOCS =
          BIT(0),</div>
        <div class="ContentPasted0">&gt;&gt;        HAS_ENGINE_MOCS =
          BIT(1),</div>
        <div class="ContentPasted0">&gt;&gt; @@ -445,7 +507,13 @@ static
          unsigned int get_mocs_settings(const struct drm_i915_private
          *i915,</div>
        <div class="ContentPasted0">&gt;&gt;        memset(table, 0,
          sizeof(struct drm_i915_mocs_table));</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;      
           table-&gt;unused_entries_index = I915_MOCS_PTE;</div>
        <div class="ContentPasted0">&gt;&gt; -     if
          (IS_PONTEVECCHIO(i915)) {</div>
        <div class="ContentPasted0">&gt;&gt; +     if
          (IS_METEORLAKE(i915)) {</div>
        <div class="ContentPasted0">&gt;&gt; +            
          table-&gt;size = ARRAY_SIZE(mtl_mocs_table);</div>
        <div class="ContentPasted0">&gt;&gt; +            
          table-&gt;table = mtl_mocs_table;</div>
        <div class="ContentPasted0">&gt;&gt; +            
          table-&gt;n_entries = MTL_NUM_MOCS_ENTRIES;</div>
        <div class="ContentPasted0">&gt;&gt; +            
          table-&gt;uc_index = 9;</div>
        <div class="ContentPasted0">&gt;&gt; +            
          table-&gt;unused_entries_index = 1;</div>
        <div class="ContentPasted0">&gt;&gt; +     } else if
          (IS_PONTEVECCHIO(i915)) {</div>
        <div class="ContentPasted0">&gt;&gt;              
           table-&gt;size = ARRAY_SIZE(pvc_mocs_table);</div>
        <div class="ContentPasted0">&gt;&gt;              
           table-&gt;table = pvc_mocs_table;</div>
        <div class="ContentPasted0">&gt;&gt;              
           table-&gt;n_entries = PVC_NUM_MOCS_ENTRIES;</div>
        <div class="ContentPasted0">&gt;&gt; @@ -646,9 +714,9 @@ void
          intel_mocs_init_engine(struct intel_engine_cs *engine)</div>
        <div class="ContentPasted0">&gt;&gt;              
           init_l3cc_table(engine-&gt;gt, &amp;table);</div>
        <div class="ContentPasted0">&gt;&gt;   }</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; -static u32
          global_mocs_offset(void)</div>
        <div class="ContentPasted0">&gt;&gt; +static u32
          global_mocs_offset(struct intel_gt *gt)</div>
        <div class="ContentPasted0">&gt;&gt;   {</div>
        <div class="ContentPasted0">&gt;&gt; -     return
          i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));</div>
        <div class="ContentPasted0">&gt;&gt; +     return
          i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) +
          gt-&gt;uncore-&gt;gsi_offset;</div>
        <div class="ContentPasted0">&gt;&gt;   }</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;   void
          intel_set_mocs_index(struct intel_gt *gt)</div>
        <div class="ContentPasted0">&gt;&gt; @@ -671,7 +739,7 @@ void
          intel_mocs_init(struct intel_gt *gt)</div>
        <div class="ContentPasted0">&gt;&gt;         */</div>
        <div class="ContentPasted0">&gt;&gt;        flags =
          get_mocs_settings(gt-&gt;i915, &amp;table);</div>
        <div class="ContentPasted0">&gt;&gt;        if (flags &amp;
          HAS_GLOBAL_MOCS)</div>
        <div class="ContentPasted0">&gt;&gt; -            
          __init_mocs_table(gt-&gt;uncore, &amp;table,
          global_mocs_offset());</div>
        <div class="ContentPasted0">&gt;&gt; +            
          __init_mocs_table(gt-&gt;uncore, &amp;table,
          global_mocs_offset(gt));</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;        /*</div>
        <div class="ContentPasted0">&gt;&gt;         * Initialize the
          L3CC table as part of mocs initalization to make</div>
        <div class="ContentPasted0">&gt;&gt; diff --git
          a/drivers/gpu/drm/i915/gt/selftest_mocs.c
          b/drivers/gpu/drm/i915/gt/selftest_mocs.c</div>
        <div class="ContentPasted0">&gt;&gt; index
          ca009a6a13bd..730796346514 100644</div>
        <div class="ContentPasted0">&gt;&gt; ---
          a/drivers/gpu/drm/i915/gt/selftest_mocs.c</div>
        <div class="ContentPasted0">&gt;&gt; +++
          b/drivers/gpu/drm/i915/gt/selftest_mocs.c</div>
        <div class="ContentPasted0">&gt;&gt; @@ -137,7 +137,7 @@ static
          int read_mocs_table(struct i915_request *rq,</div>
        <div class="ContentPasted0">&gt;&gt;                return 0;</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt;        if
          (HAS_GLOBAL_MOCS_REGISTERS(rq-&gt;engine-&gt;i915))</div>
        <div class="ContentPasted0">&gt;&gt; -             addr =
          global_mocs_offset();</div>
        <div class="ContentPasted0">&gt;&gt; +             addr =
          global_mocs_offset(rq-&gt;engine-&gt;gt);</div>
        <div class="ContentPasted0">&gt;&gt;        else</div>
        <div class="ContentPasted0">&gt;&gt;                addr =
          mocs_offset(rq-&gt;engine);</div>
        <div class="ContentPasted0">&gt;&gt;  </div>
        <div class="ContentPasted0">&gt;&gt; diff --git
          a/drivers/gpu/drm/i915/i915_pci.c
          b/drivers/gpu/drm/i915/i915_pci.c</div>
        <div class="ContentPasted0">&gt;&gt; index
          621730b6551c..480b128499ae 100644</div>
        <div class="ContentPasted0">&gt;&gt; ---
          a/drivers/gpu/drm/i915/i915_pci.c</div>
        <div class="ContentPasted0">&gt;&gt; +++
          b/drivers/gpu/drm/i915/i915_pci.c</div>
        <div class="ContentPasted0">&gt;&gt; @@ -1149,6 +1149,7 @@
          static const struct intel_device_info mtl_info = {</div>
        <div class="ContentPasted0">&gt;&gt;        .has_flat_ccs = 0,</div>
        <div class="ContentPasted0">&gt;&gt;        .has_gmd_id = 1,</div>
        <div class="ContentPasted0">&gt;&gt;        .has_guc_deprivilege
          = 1,</div>
        <div class="ContentPasted0">&gt;&gt; +     .has_llc = 0,</div>
        <div class="ContentPasted0">&gt;&gt;        .has_mslice_steering
          = 0,</div>
        <div class="ContentPasted0">&gt;&gt;        .has_snoop = 1,</div>
        <div class="ContentPasted0">&gt;&gt;      
           .__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,</div>
        <br>
      </div>
    </blockquote>
  </body>
</html>

--------------q8ZkH0txAsOmdXQfxV9n1Sg0--
