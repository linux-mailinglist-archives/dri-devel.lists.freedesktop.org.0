Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BCF1B1B04
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 03:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBD26E864;
	Tue, 21 Apr 2020 01:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3216E296
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 01:04:19 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id x1so9572721ejd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q2OcyMsNOgOJ4QjVwoaZYpXk03Hzr+6I0WrOWZa7y3Q=;
 b=Rn3pCEnulDE6HTJYfjly0/qCFdbEN8deS+EJtvDTp0+AAtd9M1vyGp4BVYvV4yC3Yf
 XAykjGDFio38Ouw6DgN8WWTvRKcQqNIa9jIbTk7hZ2VpwFlOhum3g5bJBt5ucarXq3VF
 0nb6XBUEjEB8RNnemLforAHuVHysLoPMQOGEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q2OcyMsNOgOJ4QjVwoaZYpXk03Hzr+6I0WrOWZa7y3Q=;
 b=HlvYKKozWoHU1Q95sqdy94liISD6M6MCKlWMI0DwZRcSIH8KjCJeKFQI4j7+znbSgv
 KvqTtwVV+XKpyId0NUPRTloqdQtKK2WrR/TV/actXEfa5XsAKTYMvVKKwId/I1bhs5B8
 L0HUxJF/XHys6+UFY0BzfR3lqq+lVVfBJIu4x8KljtN5jJIkmxbsXSBd4h4ieDVbk4K1
 CaE4eVRMRoXNfh1SUm2jAa7ChLeyw6yMTj1C8MToNLGx3eFP2SkBFb/vUQ7rocKO6/Ux
 AgcYq8rpxBTJdB3bOHqO7TkpJHAsvKHOC1BayJK+9rY/yzfjqrszKwbwfR3382MOGasi
 bM7w==
X-Gm-Message-State: AGi0PuZDiLggXBWk/s0plV2UUOt0jrKVuWwSXylpYRyaq2auDUKESF6m
 5OriM5ZemtfEFdp2c4Jhm1UpyZux859uwGiMQ1I=
X-Google-Smtp-Source: APiQypJjXBuoS0eOtHahjvE07p3zTTxEuyWsRwZ1DUaNxJWFPPkybrgdK3q6OnjeXnVf/5ny1Mmq357Z6pHtTI6kON4=
X-Received: by 2002:a17:906:6444:: with SMTP id
 l4mr18235261ejn.313.1587431058081; 
 Mon, 20 Apr 2020 18:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
 <3911a86d6b5bfa7ad88cd7c82416fbe6bb47e793.1587407777.git.christophe.leroy@c-s.fr>
In-Reply-To: <3911a86d6b5bfa7ad88cd7c82416fbe6bb47e793.1587407777.git.christophe.leroy@c-s.fr>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Apr 2020 01:04:05 +0000
Message-ID: <CACPK8XfqnqgkXcBzp=nqd=AJX1MK05eTNiyOdaEuRu3_6RsXSQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] powerpc: Replace _ALIGN_DOWN() by ALIGN_DOWN()
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Apr 2020 at 18:38, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>
> _ALIGN_DOWN() is specific to powerpc
> ALIGN_DOWN() is generic and does the same
>
> Replace _ALIGN_DOWN() by ALIGN_DOWN()

This one is a bit less obvious. It becomes (leaving the typeof's alone
for clarity):

-((addr)&(~((typeof(addr))(size)-1)))
+((((addr) - ((size) - 1)) + ((typeof(addr))(size) - 1)) &
~((typeof(addr))(size)-1))

Which I assume the compiler will sort out?

Reviewed-by: Joel Stanley <joel@jms.id.au>




>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
>  arch/powerpc/include/asm/nohash/32/pgtable.h |  2 +-
>  arch/powerpc/kernel/pci_64.c                 |  2 +-
>  arch/powerpc/kernel/prom.c                   |  6 +++---
>  arch/powerpc/kernel/prom_init.c              |  8 ++++----
>  arch/powerpc/mm/book3s64/hash_tlb.c          |  4 ++--
>  arch/powerpc/mm/init_64.c                    |  4 ++--
>  arch/powerpc/platforms/powernv/opal-fadump.c |  2 +-
>  arch/powerpc/platforms/powernv/pci-ioda.c    |  2 +-
>  arch/powerpc/platforms/ps3/mm.c              | 14 +++++++-------
>  arch/powerpc/platforms/pseries/rtas-fadump.c |  2 +-
>  11 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
> index 7549393c4c43..53b5c93eaf5d 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -195,7 +195,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
>  #endif
>
>  #ifdef CONFIG_KASAN_VMALLOC
> -#define VMALLOC_END    _ALIGN_DOWN(ioremap_bot, PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
> +#define VMALLOC_END    ALIGN_DOWN(ioremap_bot, PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
>  #else
>  #define VMALLOC_END    ioremap_bot
>  #endif
> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
> index b04ba257fddb..5b4d4c4297e1 100644
> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
> @@ -116,7 +116,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
>  #endif
>
>  #ifdef CONFIG_KASAN_VMALLOC
> -#define VMALLOC_END    _ALIGN_DOWN(ioremap_bot, PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
> +#define VMALLOC_END    ALIGN_DOWN(ioremap_bot, PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
>  #else
>  #define VMALLOC_END    ioremap_bot
>  #endif
> diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
> index f83d1f69b1dd..e5d05af5a9af 100644
> --- a/arch/powerpc/kernel/pci_64.c
> +++ b/arch/powerpc/kernel/pci_64.c
> @@ -130,7 +130,7 @@ static int pcibios_map_phb_io_space(struct pci_controller *hose)
>         unsigned long size_page;
>         unsigned long io_virt_offset;
>
> -       phys_page = _ALIGN_DOWN(hose->io_base_phys, PAGE_SIZE);
> +       phys_page = ALIGN_DOWN(hose->io_base_phys, PAGE_SIZE);
>         size_page = _ALIGN_UP(hose->pci_io_size, PAGE_SIZE);
>
>         /* Make sure IO area address is clear */
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 6620f37abe73..10b5d5eafd34 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -96,7 +96,7 @@ static inline int overlaps_initrd(unsigned long start, unsigned long size)
>         if (!initrd_start)
>                 return 0;
>
> -       return  (start + size) > _ALIGN_DOWN(initrd_start, PAGE_SIZE) &&
> +       return  (start + size) > ALIGN_DOWN(initrd_start, PAGE_SIZE) &&
>                         start <= _ALIGN_UP(initrd_end, PAGE_SIZE);
>  #else
>         return 0;
> @@ -623,9 +623,9 @@ static void __init early_reserve_mem(void)
>  #ifdef CONFIG_BLK_DEV_INITRD
>         /* Then reserve the initrd, if any */
>         if (initrd_start && (initrd_end > initrd_start)) {
> -               memblock_reserve(_ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
> +               memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
>                         _ALIGN_UP(initrd_end, PAGE_SIZE) -
> -                       _ALIGN_DOWN(initrd_start, PAGE_SIZE));
> +                       ALIGN_DOWN(initrd_start, PAGE_SIZE));
>         }
>  #endif /* CONFIG_BLK_DEV_INITRD */
>
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 806be751c336..4cf5958eebd4 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1500,7 +1500,7 @@ static unsigned long __init alloc_down(unsigned long size, unsigned long align,
>
>         if (highmem) {
>                 /* Carve out storage for the TCE table. */
> -               addr = _ALIGN_DOWN(alloc_top_high - size, align);
> +               addr = ALIGN_DOWN(alloc_top_high - size, align);
>                 if (addr <= alloc_bottom)
>                         return 0;
>                 /* Will we bump into the RMO ? If yes, check out that we
> @@ -1518,9 +1518,9 @@ static unsigned long __init alloc_down(unsigned long size, unsigned long align,
>                 goto bail;
>         }
>
> -       base = _ALIGN_DOWN(alloc_top - size, align);
> +       base = ALIGN_DOWN(alloc_top - size, align);
>         for (; base > alloc_bottom;
> -            base = _ALIGN_DOWN(base - 0x100000, align))  {
> +            base = ALIGN_DOWN(base - 0x100000, align))  {
>                 prom_debug("    trying: 0x%lx\n\r", base);
>                 addr = (unsigned long)prom_claim(base, size, 0);
>                 if (addr != PROM_ERROR && addr != 0)
> @@ -1586,7 +1586,7 @@ static void __init reserve_mem(u64 base, u64 size)
>          * have our terminator with "size" set to 0 since we are
>          * dumb and just copy this entire array to the boot params
>          */
> -       base = _ALIGN_DOWN(base, PAGE_SIZE);
> +       base = ALIGN_DOWN(base, PAGE_SIZE);
>         top = _ALIGN_UP(top, PAGE_SIZE);
>         size = top - base;
>
> diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
> index 4a70d8dd39cd..2242d022b620 100644
> --- a/arch/powerpc/mm/book3s64/hash_tlb.c
> +++ b/arch/powerpc/mm/book3s64/hash_tlb.c
> @@ -196,7 +196,7 @@ void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
>         int hugepage_shift;
>         unsigned long flags;
>
> -       start = _ALIGN_DOWN(start, PAGE_SIZE);
> +       start = ALIGN_DOWN(start, PAGE_SIZE);
>         end = _ALIGN_UP(end, PAGE_SIZE);
>
>         BUG_ON(!mm->pgd);
> @@ -238,7 +238,7 @@ void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr)
>         pte_t *start_pte;
>         unsigned long flags;
>
> -       addr = _ALIGN_DOWN(addr, PMD_SIZE);
> +       addr = ALIGN_DOWN(addr, PMD_SIZE);
>         /*
>          * Note: Normally, we should only ever use a batch within a
>          * PTE locked section. This violates the rule, but will work
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index 4002ced3596f..c7ce4ec5060e 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -203,7 +203,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>         unsigned long page_size = 1 << mmu_psize_defs[mmu_vmemmap_psize].shift;
>
>         /* Align to the page size of the linear mapping. */
> -       start = _ALIGN_DOWN(start, page_size);
> +       start = ALIGN_DOWN(start, page_size);
>
>         pr_debug("vmemmap_populate %lx..%lx, node %d\n", start, end, node);
>
> @@ -292,7 +292,7 @@ void __ref vmemmap_free(unsigned long start, unsigned long end,
>         unsigned long alt_start = ~0, alt_end = ~0;
>         unsigned long base_pfn;
>
> -       start = _ALIGN_DOWN(start, page_size);
> +       start = ALIGN_DOWN(start, page_size);
>         if (altmap) {
>                 alt_start = altmap->base_pfn;
>                 alt_end = altmap->base_pfn + altmap->reserve +
> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> index d361d37d975f..9a360ced663b 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -671,7 +671,7 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
>          * Firmware supports 32-bit field for size. Align it to PAGE_SIZE
>          * and request firmware to copy multiple kernel boot memory regions.
>          */
> -       fadump_conf->max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
> +       fadump_conf->max_copy_size = ALIGN_DOWN(U32_MAX, PAGE_SIZE);
>
>         /*
>          * Check if dump has been initiated on last reboot.
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 57d3a6af1d52..276b011cd45d 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -264,7 +264,7 @@ static void pnv_ioda_reserve_dev_m64_pe(struct pci_dev *pdev,
>                 if (!r->parent || !pnv_pci_is_m64(phb, r))
>                         continue;
>
> -               start = _ALIGN_DOWN(r->start - base, sgsz);
> +               start = ALIGN_DOWN(r->start - base, sgsz);
>                 end = _ALIGN_UP(r->end - base, sgsz);
>                 for (segno = start / sgsz; segno < end / sgsz; segno++) {
>                         if (pe_bitmap)
> diff --git a/arch/powerpc/platforms/ps3/mm.c b/arch/powerpc/platforms/ps3/mm.c
> index 423be34f0f5f..71ed37f7f475 100644
> --- a/arch/powerpc/platforms/ps3/mm.c
> +++ b/arch/powerpc/platforms/ps3/mm.c
> @@ -263,7 +263,7 @@ static int ps3_mm_region_create(struct mem_region *r, unsigned long size)
>         int result;
>         u64 muid;
>
> -       r->size = _ALIGN_DOWN(size, 1 << PAGE_SHIFT_16M);
> +       r->size = ALIGN_DOWN(size, 1 << PAGE_SHIFT_16M);
>
>         DBG("%s:%d requested  %lxh\n", __func__, __LINE__, size);
>         DBG("%s:%d actual     %llxh\n", __func__, __LINE__, r->size);
> @@ -394,7 +394,7 @@ static struct dma_chunk * dma_find_chunk(struct ps3_dma_region *r,
>         unsigned long bus_addr, unsigned long len)
>  {
>         struct dma_chunk *c;
> -       unsigned long aligned_bus = _ALIGN_DOWN(bus_addr, 1 << r->page_size);
> +       unsigned long aligned_bus = ALIGN_DOWN(bus_addr, 1 << r->page_size);
>         unsigned long aligned_len = _ALIGN_UP(len+bus_addr-aligned_bus,
>                                               1 << r->page_size);
>
> @@ -423,7 +423,7 @@ static struct dma_chunk *dma_find_chunk_lpar(struct ps3_dma_region *r,
>         unsigned long lpar_addr, unsigned long len)
>  {
>         struct dma_chunk *c;
> -       unsigned long aligned_lpar = _ALIGN_DOWN(lpar_addr, 1 << r->page_size);
> +       unsigned long aligned_lpar = ALIGN_DOWN(lpar_addr, 1 << r->page_size);
>         unsigned long aligned_len = _ALIGN_UP(len + lpar_addr - aligned_lpar,
>                                               1 << r->page_size);
>
> @@ -775,7 +775,7 @@ static int dma_sb_map_area(struct ps3_dma_region *r, unsigned long virt_addr,
>         struct dma_chunk *c;
>         unsigned long phys_addr = is_kernel_addr(virt_addr) ? __pa(virt_addr)
>                 : virt_addr;
> -       unsigned long aligned_phys = _ALIGN_DOWN(phys_addr, 1 << r->page_size);
> +       unsigned long aligned_phys = ALIGN_DOWN(phys_addr, 1 << r->page_size);
>         unsigned long aligned_len = _ALIGN_UP(len + phys_addr - aligned_phys,
>                                               1 << r->page_size);
>         *bus_addr = dma_sb_lpar_to_bus(r, ps3_mm_phys_to_lpar(phys_addr));
> @@ -830,7 +830,7 @@ static int dma_ioc0_map_area(struct ps3_dma_region *r, unsigned long virt_addr,
>         struct dma_chunk *c;
>         unsigned long phys_addr = is_kernel_addr(virt_addr) ? __pa(virt_addr)
>                 : virt_addr;
> -       unsigned long aligned_phys = _ALIGN_DOWN(phys_addr, 1 << r->page_size);
> +       unsigned long aligned_phys = ALIGN_DOWN(phys_addr, 1 << r->page_size);
>         unsigned long aligned_len = _ALIGN_UP(len + phys_addr - aligned_phys,
>                                               1 << r->page_size);
>
> @@ -889,7 +889,7 @@ static int dma_sb_unmap_area(struct ps3_dma_region *r, dma_addr_t bus_addr,
>         c = dma_find_chunk(r, bus_addr, len);
>
>         if (!c) {
> -               unsigned long aligned_bus = _ALIGN_DOWN(bus_addr,
> +               unsigned long aligned_bus = ALIGN_DOWN(bus_addr,
>                         1 << r->page_size);
>                 unsigned long aligned_len = _ALIGN_UP(len + bus_addr
>                         - aligned_bus, 1 << r->page_size);
> @@ -926,7 +926,7 @@ static int dma_ioc0_unmap_area(struct ps3_dma_region *r,
>         c = dma_find_chunk(r, bus_addr, len);
>
>         if (!c) {
> -               unsigned long aligned_bus = _ALIGN_DOWN(bus_addr,
> +               unsigned long aligned_bus = ALIGN_DOWN(bus_addr,
>                                                         1 << r->page_size);
>                 unsigned long aligned_len = _ALIGN_UP(len + bus_addr
>                                                       - aligned_bus,
> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
> index 70c3013fdd07..81343908ed33 100644
> --- a/arch/powerpc/platforms/pseries/rtas-fadump.c
> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
> @@ -506,7 +506,7 @@ void __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
>         fadump_conf->fadump_supported   = 1;
>
>         /* Firmware supports 64-bit value for size, align it to pagesize. */
> -       fadump_conf->max_copy_size = _ALIGN_DOWN(U64_MAX, PAGE_SIZE);
> +       fadump_conf->max_copy_size = ALIGN_DOWN(U64_MAX, PAGE_SIZE);
>
>         /*
>          * The 'ibm,kernel-dump' rtas node is present only if there is
> --
> 2.25.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
