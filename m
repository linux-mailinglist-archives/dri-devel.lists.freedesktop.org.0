Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C1153098B
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA22B10ED64;
	Mon, 23 May 2022 06:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic315-54.consmr.mail.gq1.yahoo.com
 (sonic315-54.consmr.mail.gq1.yahoo.com [98.137.65.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F14D10E204
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1653139448; bh=u7Yu+KyEIfPZJbhWAIRqnrm/m3z+dGwiH+Er13915nE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=Vz/X7Tg2KXqHVb0jKRQz9cJZrnXS6Y0rMqdMeizybrsocQSbPfzfutoh/J3UP0G1gsnBS02sQJLl4BPL4MVHEFtijFGTXttTpdw5UYoNFz9yzMMIDEA7FKHSbuQec1GzeBEiM83Kh+tnyu3YAns5Qr8CH/EzVHaN4rehQyCan/+Uf1Mb6jtvCi9O5T88AUxwxf9+8qsB55nQW/xqnSu17UuUPSxjrf4YuHm6dYwxxcl1IBQ9QCBK1iVmh2FEApWUmX/yap+reTSCOLChc5SVBIV53xjyUOaRsSjmhYp88c+l2Q6fRugEDhWn2vYsLRG9NhzKKDzAeIZC1OdwYgovMg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1653139448; bh=fjywVtOkL+0USSEpOqb1IdSWmSiRUy7HljK9ZuevyH9=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=REmdCsNLmO5djeOLQ0OMVJaDeOY8bQKZoTfIErzQJX21RscnkKf0SYroqeSzNSXxJ0/cqSdLoBrPIoRdBoGHmA5DW7EzpFtJ3E4+og/ELN8uCdYYO2Q5pzWQVII0stCPD6+/76EBiknW7cgFBbQhcAMQL83XCBBZqtpxSRKrKZHQwdltsK3qogqF7gBBg2wXaAXQblY6Joowrq7TqO96Mk9GNmzT+lmjXPaXnNzS/m8G4RlWKz4GNpnonZiE4EU6XgNuyydgxLWfmBpSZfI15aJBzRPay8IrZtF3hYPfFoHwCxXmkoAbI0daWTRFgPZlbxNXXjIwsWkqWFFQUEtM1w==
X-YMail-OSG: dGjnYDYVM1nZFIxMGgIyXvS33pdt8sJTeJDIiUVrevs4mbVRYc9JT4J52MOoXFo
 2cmWTv0ymmA5a.XrpPIirj2zCrOKW1cD4PDtyUkTkMvWgA.dQufwQHJ1bktN8Kn7TwSOpMhVt93L
 DMCAfGwmhMRscJH_GslY1rGJdnTJNkFuEhbJu9UxrpM3JnHmFGSfZDlNyrtLvKuGl_4W8G741WCP
 JDu97AzYxdMPQeJGJ7VEPUR7GAvgyZ4TQAKSpTTfI1WjWAW.cgNHO86ukAkrU5OVIbX2i4x.h5PJ
 BHwgAHWpZ.VUIlvQn8rQ.J_WCXWvex.Wt8547Trf8THc6rnE2JMpE1MSWzHqf1UfIh_HGf4L9C8u
 SCghkIwaj35mCeq5neDHxa9hr_Zv8tZMvHwv8kLMrEqk6XLaaVWFwAS1XD3M4KzJRa31tzI37FDk
 QXt7bp3acIE72ibVmS.aUfRJG2W.mTwbSOKcUSXroteXR_2OS.2_W8i_K.4uvIHye0iPfYTJKXxC
 lBTcqugQj0xiRAO96XTHSLHlitLK8ZMDztlXxiWP2UvV7587GzeuXEkFigVkm6KLqY4viE5ZIHvB
 Pb0q25Av2XkjI2TBdfoeYqwqWh9F3WNBzTmS1IJXQPJ66JwQRiEfa3p9XKxztfx5FyeHFKoQUeId
 PCZ9fpGXv5fhIZDC5l6X.RPDacaAtAwOEYNIsgfsEkA6S1y9XNdiiDs2BSoy68f3Mu0F99Uyh.9F
 Wz9PUbH7AMcZ6iX0UKft1J8OUhrkW01WvbjuW0VB7lB4Z8PSwY9fpKXNNtPf6.lGr6bRCnBQv9v4
 AoSI9FwsCPTqlAkhoJ3ftMih_G7GS.J3bC3gQvutP_9CGAvlzeU80xM8dOlgT7kCAvA7xI7SWBS6
 7L472O3tbs2Kog3Yn08ViAY4Ojx_n8JaGTOYC0jB6mQdaqbiXx0Dod9VhOi9NdROaQ7K_jM2Fg6q
 jfX0lJFgcURmZxQIER9oqJUDNGSvwU3O3TI0GS5HLZXzWZOfDvsdLaZd7eAtgVCh7K7wiAvfe4F8
 yMlzWfEgLxgtUWZRj8oz7KaSTL8otVTauLWgccOfaI4TXRJqLgfei7HaJJ5prAa2MDLVUXfcbrjK
 AFezWEsMjJJz1jExkY.jVIJt2aHPZ5jU_iaGKWwIIckODByIMFrcKN._fRUrneCyXMBDajYVWi78
 z8WxhwE961lFmVxFjJQHT6Gei1eRuSBe7CbMJpt7Sv2aCf_1aCiU1Zyk3g8newjwJyOcE8G0lln1
 gFPLNp5LkdcHkL7DyxCwjk4KBX93L8E8QyyhR.cb6I3TVQUtE71AhHkQ9Oe8amJShJ5NxHx1t4ZS
 qLoj9R3SozO1KD4nJzkHTa8xOGBaSBqMuWsi3L59zFykR19Rhm7mGPcvDEEdh8pQPb7miqjQSTAp
 va.zuhmV.8nPmfugL63FgqXpMDWMj.noB0SXevpSCNu2pb0t971LbflvRku0dQ8sdidFPjP0T59e
 n7j3zux1vsAKSVODZfBUylDIayyLZO8DyJ8s2Tjz2yqZELG6TkSnZhUQGt5uNaPzy3o64voqXyGw
 CtKbYLMRO_4EEk.MH.roLBmZ0ErR_9n.FF339MWy6d.YUf.32MBVCTKaMt62vUjdqT8tFy8H0hlH
 kD._tV6XPf9OcEVCtI9gDKBbjXfrh6CR.MMC9ldL4d1kHPg1amuhdc0riFynonchkfjKiDNjZVkz
 8S5e_cOKFB.ExWBtqIdS7hBeTiWkOi7V._.7UgwHrTUFT41CTEbHLNrTM0I32.xxYNn8izmJ0iWf
 6IOQPUAWyDt5_uZWxtpD7bsWgFRf1MHQnvsgd4D_edQEXfKITXduB20HO3aiB4amJZrRXev3maFv
 .UaFb.y6uRbXN08phHBQmLW4RLEFFZK_bJLb_tCAXurN_k9Oc.nmmySBgde74mBIDbn3eJAZOZ.s
 erewTSNVwNPlAZHCDrWjFs5u6kfAVA7rnW4vXS6Q0wOOOf8dyICsjYbJ4pxSfx3q6A_Y0cuYgP3A
 AnCrTQQs5KzIWcZVrOuD7BWcykmDxlBfoYfJs1rvEiD1NLdNT2pkJe.9PfhsuoP2ZViKr3HYfH.0
 jxgHneh0253SxqRrsGsiBskaaZcjTsdA1q7bhcfmfFhHKSPA8vBH3NkWKsbw_AL21U4OdW92qHRH
 bWhDHPshEz_xyfbLkB.ESMn5LKE3_ATG4UDBb8t6tPXnMr9gOH6llQC7gxcyL7rz6O0rieSRKpNd
 zst9pFHIsyguMlw--
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Sat, 21 May 2022 13:24:08 +0000
Received: by hermes--canary-production-bf1-5d4b57496-srbfg (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID b79d68d9aeaaa8a76906c73f93b0ea7b; 
 Sat, 21 May 2022 13:24:06 +0000 (UTC)
Message-ID: <6c13b3ec-dc39-8de1-8e5d-87138f2a3b4b@netscape.net>
Date: Sat, 21 May 2022 09:24:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: Chuck Zmudzinski <brchuckz@netscape.net>
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20220503132207.17234-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20225
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jan Beulich <jbeulich@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/3/22 9:22 AM, Juergen Gross wrote:
> Some drivers are using pat_enabled() in order to test availability of
> special caching modes (WC and UC-). This will lead to false negatives
> in case the system was booted e.g. with the "nopat" variant and the
> BIOS did setup the PAT MSR supporting the queried mode, or if the
> system is running as a Xen PV guest.
>
> Add test functions for those caching modes instead and use them at the
> appropriate places.
>
> For symmetry reasons export the already existing x86_has_pat_wp() for
> modules, too.
>
> Fixes: bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with pat_enabled()")
> Fixes: ae749c7ab475 ("PCI: Add arch_can_pci_mmap_wc() macro")
> Signed-off-by: Juergen Gross<jgross@suse.com>
> ---
>   arch/x86/include/asm/memtype.h           |  2 ++
>   arch/x86/include/asm/pci.h               |  2 +-
>   arch/x86/mm/init.c                       | 25 +++++++++++++++++++++---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c |  8 ++++----
>   4 files changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/include/asm/memtype.h b/arch/x86/include/asm/memtype.h
> index 9ca760e430b9..d00e0be854d4 100644
> --- a/arch/x86/include/asm/memtype.h
> +++ b/arch/x86/include/asm/memtype.h
> @@ -25,6 +25,8 @@ extern void memtype_free_io(resource_size_t start, resource_size_t end);
>   extern bool pat_pfn_immune_to_uc_mtrr(unsigned long pfn);
>   
>   bool x86_has_pat_wp(void);
> +bool x86_has_pat_wc(void);
> +bool x86_has_pat_uc_minus(void);
>   enum page_cache_mode pgprot2cachemode(pgprot_t pgprot);
>   
>   #endif /* _ASM_X86_MEMTYPE_H */
> diff --git a/arch/x86/include/asm/pci.h b/arch/x86/include/asm/pci.h
> index f3fd5928bcbb..a5742268dec1 100644
> --- a/arch/x86/include/asm/pci.h
> +++ b/arch/x86/include/asm/pci.h
> @@ -94,7 +94,7 @@ int pcibios_set_irq_routing(struct pci_dev *dev, int pin, int irq);
>   
>   
>   #define HAVE_PCI_MMAP
> -#define arch_can_pci_mmap_wc()	pat_enabled()
> +#define arch_can_pci_mmap_wc()	x86_has_pat_wc()
>   #define ARCH_GENERIC_PCI_MMAP_RESOURCE
>   
>   #ifdef CONFIG_PCI
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index 71e182ebced3..b6431f714dc2 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -77,12 +77,31 @@ static uint8_t __pte2cachemode_tbl[8] = {
>   	[__pte2cm_idx(_PAGE_PWT | _PAGE_PCD | _PAGE_PAT)] = _PAGE_CACHE_MODE_UC,
>   };
>   
> -/* Check that the write-protect PAT entry is set for write-protect */
> +static bool x86_has_pat_mode(unsigned int mode)
> +{
> +	return __pte2cachemode_tbl[__cachemode2pte_tbl[mode]] == mode;
> +}
> +
> +/* Check that PAT supports write-protect */
>   bool x86_has_pat_wp(void)
>   {
> -	return __pte2cachemode_tbl[__cachemode2pte_tbl[_PAGE_CACHE_MODE_WP]] ==
> -	       _PAGE_CACHE_MODE_WP;
> +	return x86_has_pat_mode(_PAGE_CACHE_MODE_WP);
> +}
> +EXPORT_SYMBOL_GPL(x86_has_pat_wp);
> +
> +/* Check that PAT supports WC */
> +bool x86_has_pat_wc(void)
> +{
> +	return x86_has_pat_mode(_PAGE_CACHE_MODE_WC);
> +}
> +EXPORT_SYMBOL_GPL(x86_has_pat_wc);
> +
> +/* Check that PAT supports UC- */
> +bool x86_has_pat_uc_minus(void)
> +{
> +	return x86_has_pat_mode(_PAGE_CACHE_MODE_UC_MINUS);
>   }
> +EXPORT_SYMBOL_GPL(x86_has_pat_uc_minus);
>   
>   enum page_cache_mode pgprot2cachemode(pgprot_t pgprot)
>   {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 0c5c43852e24..f43ecf3f63eb 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -76,7 +76,7 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
>   	if (args->flags & ~(I915_MMAP_WC))
>   		return -EINVAL;
>   
> -	if (args->flags & I915_MMAP_WC && !pat_enabled())
> +	if (args->flags & I915_MMAP_WC && !x86_has_pat_wc())
>   		return -ENODEV;
>   
>   	obj = i915_gem_object_lookup(file, args->handle);
> @@ -757,7 +757,7 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
>   
>   	if (HAS_LMEM(to_i915(dev)))
>   		mmap_type = I915_MMAP_TYPE_FIXED;
> -	else if (pat_enabled())
> +	else if (x86_has_pat_wc())
>   		mmap_type = I915_MMAP_TYPE_WC;
>   	else if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>   		return -ENODEV;
> @@ -813,7 +813,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>   		break;
>   
>   	case I915_MMAP_OFFSET_WC:
> -		if (!pat_enabled())
> +		if (!x86_has_pat_wc())
>   			return -ENODEV;
>   		type = I915_MMAP_TYPE_WC;
>   		break;
> @@ -823,7 +823,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>   		break;
>   
>   	case I915_MMAP_OFFSET_UC:
> -		if (!pat_enabled())
> +		if (!x86_has_pat_uc_minus())
>   			return -ENODEV;
>   		type = I915_MMAP_TYPE_UC;
>   		break;

This patch is advertised as a fix for
bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with pat_enabled()")

bdd8b6c98239 causes a serious regression on my system when
running Linux as a Dom0 on Xen.

The regression is that on my system, the error caused by this issue
causes the i915driver to call its add_taint_for_CI function, which
in turn totally halts the system during early boot. So this makes
it impossible for either 5.17.y or the 5.18-rc versions to run
as a Dom0 on my system. I cannot upgrade my system to the 5.17.y
or to 5.18-rc versions without a proper fix for bdd8b6c98239.

I did some testing with this patch on my system (my tests included
the first patch of this 2-patch series), and here are the results:

This patch does *not* fix it. I expected this patch, as is, to not
fix it but allow me to add a simple patch that uses the new
x86_has_pat_wc() function provided by this patch to the
i915_gem_object_pin_map() function in i915_gem_pages.c
that would fix it.

However, even by adding the following simple patch to the
i915_gem_object_pin_map() function to the patch, the
patch series still does *not* fix the regression on my system:

--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -428,7 +428,7 @@
              goto err_unpin;
          }

-        if (GEM_WARN_ON(type == I915_MAP_WC && !pat_enabled()))
+        if (GEM_WARN_ON(type == I915_MAP_WC && !x86_has_pat_wc()))
              ptr = ERR_PTR(-ENODEV);
          else if (i915_gem_object_has_struct_page(obj))
              ptr = i915_gem_object_map_page(obj, type);

I verified that this is the function where pat_enabled() is returning
a false negative on my system.

This means x86_has_pat_wc() is still giving me a false negative, even
when running as a Xen Dom0. I am not sure you understand what is
really causing the problem Jan is trying to fix here with false
negatives from pat_enabled(). I also tested Jan's patch that
you are trying to replace with this patch, and his patch *does* fix
the problem on my system. Jan's patch is very simple and solves the
problem by editing pat_enabled() so that it returns true if
boot_cpu_has(X86_FEATURE_HYPERVISOR)) is true after the
other checks for the x86 pat feature failed.

I expect you do not have a system that actually has the problem
that Jan and I are trying to fix because the problem only exists on
systems with specific hardware, and in my case it is an Intel Haswell
CPU with integrated GPU. You might be able to test your patch,
though, if you boot the patched kernel with the nopat option and
check if your new functions return false when running on the bare
metal and true when running in a Dom0 on the Xen hypervisor. That is
what the new functions should do. I think you were expecting your
new x86_has_pat_wc() function to return true when Linux is running
as a Dom0 on the Xen hypervisor even when pat_enabled() returns
false. But it does not seem to be working.

In any case, after testing this patch, I cannot confirm that it
fixes bdd8b6c98239.

Best regards,

Chuck
