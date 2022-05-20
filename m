Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13FF52E6CA
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BBE11B7B4;
	Fri, 20 May 2022 07:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic309-22.consmr.mail.gq1.yahoo.com
 (sonic309-22.consmr.mail.gq1.yahoo.com [98.137.65.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B0E10F467
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 02:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1653012961; bh=7b30/DpTLb5SVpAp4UHZjIHf2v+mEoFOGRCWalC6alk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=USnf2QYQaj6nl7LxofQViMdBJ/eDjmsJlBtwH3wY3YWSXuIbV72F/oLNBlH2zSrKM/+WYQPZgD/BCCXKIyaEY1TcolQROmvaDF/sOFm2Q4RxqekIFvP5NSABaxk4BXOqHlry+PF1caE3Mat0azFw2v0UvpirjGd4UFv4my14ekQDkOLDo8h7T22f0xN4Z8vKuXLsF6OO+vublN1oZKzOW7ILp3+bh4IuQaUvEgq5Ml2fdvg6Tw1Crs0M1RkwaMvfKc8OpRlCZKB1M6xvJxnj3nMn00EeSoWyTD20QzT4jbzt1rPBZdR5LQ2N9sQJ6VN1kVP4BJKJx+qWNb33RzHSoA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1653012961; bh=lgtsVyE93WpkxCRZRawyN3iVw0rx+Gw65El69Q/tblA=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=ZfRx5ZVV9BxgiCZHXZgrp/nKsLmi/bcLkMx7gwgoxYRIKTaV7x/POQdGunMnhTkyXVhN7DSYNVTYAwudLiuLamOyBtecwE6IHPKLB1NAqEh+4CEaQQ+EmPt2i3aOZ3UOHrb9nIUvZPJyZjcCKOoiLMNy19csJltJmYXTWY84VLIL3AceIXuEXHfl2bRPZGrAmmx2GaaIGbQhWVZqV692qCkU1ZCJb8Fxjt7BOQtXlwW/i8vcgoqH5S19Jx4/eq5zlhnZ3qoc44Y9Lf0q1NZEopQGaadV4q7G3XhUQ2vEbHUFcLLjs98hpDTz25V0EFlqfEwRe2SUnY0qeWW3aNy+bw==
X-YMail-OSG: x61LLaYVM1kq7tWP_1hNaOKp6w7u9jbOH7P65gKl8HHmQ7Y72IIIiFhiXHBW6qW
 ESrMDQbkv8bMiQIV_XTVC.5vKsAJgifa30Ent9uN8xvwocvsb6A54Kaxuc7vtOV2sSMDjfoDJyFX
 8i4adJo8SJhO56uGosXENfEDnIc_AGNMHTv3xlJY7KKSSCc9qWyzlvYWMLM.iU.qdmtA5z.m60R0
 h6CHV73wjupOEqY1U7VPnwivWmXirghDQs1EwlPF4DM1jXFF5KZQL6khQ6zBJQCeeO0n_NxWEjQs
 YjTktjHRujhrQXxsHvrW4A_uYff1yLwvKuZF5f8gV2ROnPFE7E0j2uW.pdrECf8ak2KKiXtBM2Tu
 9bf4gFGed5jONY6Sg_zh9R2ET.9WCb3ssmZCzfM6BRV_JLM.H4swaElOhwqUHn9L9cHfTZkla4e7
 nkiJGHXDgKmZc5vqj5LZi4Nk8.js0G3KrGJT4vZn8_zb9mxM0EOZl7nIUXIGQJeGoMI1Iq4LQuHT
 t9PG0pIevwkT8nJYGbdM7CCTCuaec.tgp2gA5hDaNkSC0ivT7Bzco6pGvNcl2xkeaoBpwHaV3hPP
 Iv0TUIkShI5g.2tRmNGEngB1BN79X0T0ulEgyH9COzfMnDPXhMEoYV016RpW90kx9EKp6MRPgGoi
 Pzw4tK4PBBSqQD7Rjo0TKKf7YqxN8.mAW27qfWHaZHPga_jGnPHS26nRmJwgvUnEsNfcCtOSuF_t
 MQNpRyR7rwlgFRq0IMZ89tZuJrzXfUKE1p63DUSyc.bZR.zs4AdsMbSheRlgRBVvHztNXnhH6Wgs
 1yNiuOGwFizYOBkEUeczSwu7qmMZMoRqLxXTCQFnD2MdaiP4KBlR5B.XmDJlqwAb_KGe.5TY47me
 w3HqdK8Yh4eN.1T29kmM5NaAw8uKMLv2o9a3_nR8DIXXmnnEI7w15YIncl.vb2D9_QoJ7Jcs_cHl
 jyWz28rtlG9hDLx.P04gB0rR7qgLxzBOOlrJDIPBGW.Vh8rXxgtpOsbVYGpk_AawaFzxp54wA70o
 eJpLsVxFAY7LlbbfaYaAIVODj4awD1ZIIZAd6KSuS9R.638.YG3gDvnDzB3tMO28t1dmMFi0zBzn
 dWZVlFHKbGwUi67JvAfAtTa.w1.r3ZTWvKzB7wy5rcNXrlcfZt_OWiWPL_xqSzpkBt2iUiE1KfIN
 oO4EeaBHQBcJGY6dmV8G0unjTLdh0.QQniVyCzDUfoIw6QbDtXHQku.ay0fwMaFAGcP63XTi3rU2
 gLFshTCiHPpaAtmWT3zZYD.rqnaEjwgbVmQerbHhZhI2O80MyCfOqT7pqrimgjU2jmqOMiQ6RbEM
 WpasJVIEBcg8MlTfStbm3xCrvH0BDj1PzYUKW3qCxcON6.vs1bGYroXsYytVpEgeiCPTXfJGqlnI
 6_57Y6FI8fnN7nfVQ_FalDIU8lzwBnaoKY2otL0x_I4fTBAhOy1AlM2inYeJfuwCv_4M6KaRKuyK
 0G8x.FRwnqKbj34lzBYPQNcria1eDm.Wvk827FsYM_HOYMuYUYU0rPyhFEBctopUPrOl3r910dEV
 xghoIX9WTniKUY1j_uA2Ma9r5JOvYf4yTKPEFqf5xUdM8ZYPq.5CVY8aSIOa.YOThr9.ynGV5kqM
 dFVUhm.HYB7ZgvwP1TJhnA3uCQleecMiHbjDpol4fptQQspZLGUO1wv4mt88KMeFc4_Gq.8TaZVK
 HT9jsLtQgZuz3k1ZzCmrRZNXzhBH1M6p38fc4LJxP5GD0fOwHTArA6KBbgNZR8cXxds3wkqM5mDd
 kW6yKxLLzgvER_KH30adihpBMzVCdyyv68KB1SpNOQHf82cjnGZss0uCEBl1MoeExFeGxhwARxSn
 nsRyiroOVXbP4YJfcrBVbvUEM.xXfRTgIR3.rdQ_B2rcmMbcTMkoltxFzBZAVduYleKTW3xHGNfU
 D88DSUXb8A1u4A.oeC9vM8XcgGYALOCNlHpPgf4rp4vVn04CTvkjc5IyQf.tkHnP3TohAxM_7jWA
 RYwN_wW_crxJAcerRE3fnmwo9qnYTIa1kb3XpqVItun_sggiu3mZLFZCkmLJ6ftHtKSX4y6H0Ksu
 daL1QttImJ2XKvC4Se4LjOL5GTnpsCvzIQ3NAjXaOfE0dZIUTIQtNzddksp.2whsQzIiGMblgvja
 UNEjIAICtPtD6FBzQrCLHpkHcMNazh9zI4d9MkmAU6guyAdu48msc7xAihTX7vsBVc1FlE0IG
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Fri, 20 May 2022 02:16:01 +0000
Received: by hermes--canary-production-ne1-5495f4d555-xgn59 (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 49a5d3ad8fd09327a59bccdd561ab452; 
 Fri, 20 May 2022 02:16:00 +0000 (UTC)
Message-ID: <788dc391-6a20-5c03-9613-9f22fcc125f1@netscape.net>
Date: Thu, 19 May 2022 22:15:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <20220503132207.17234-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20258
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-Mailman-Approved-At: Fri, 20 May 2022 07:59:06 +0000
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
 Andy Lutomirski <luto@kernel.org>, pkg-xen-devel@alioth-lists.debian.net,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, jbeulich@suse.com,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/3/22 9:22 AM, Juergen Gross wrote:
> Some drivers are using pat_enabled() in order to test availability of
> special caching modes (WC and UC-). This will lead to false negatives
> in case the system was booted e.g. with the "nopat" variant and the
> BIOS did setup the PAT MSR supporting the queried mode, or if the
> system is running as a Xen PV guest.
Hello,

I am also getting a false positive in a Xen Dom0 from
pat_enabled() where bdd8b6c98239 patched the file

drivers/gpu/drm/i915/gem/i915_gem_pages.c

I think this patch also needs to touch that file to
fix the issue I am seeing.

Ever since bdd8b6c98239 was committed, I get the
following in the logs when running as a Dom0 on my
Haswell processor, including with the untainted
official Debian build of 5.17.6:

May 15 06:31:59 debian kernel: [    3.721146] i915 0000:00:02.0: 
[drm:add_taint_for_CI [i915]] CI tainted:0x9 by intel_gt_init+0xb6/0x2e0 
[i915]

This causes the system to hang with the backlight on.
The only recovery is by hitting the reset button and
rebooting Linux Dom0 on Xen with Linux version 5.16
or earlier, or by rebooting Linux version 5.17 without
Xen.

I was able to fix it with a kernel that fixes the
false negative I was getting in
drivers/gpu/drm/i915/gem/i915_gem_pages.c

Can the patch also touch that file, replacing
pat_enabled() with x86_has_pat_wc() in the
place where bdd8b6c98239 patched that file?

Thanks,

Chuck Zmudzinski

>
> Add test functions for those caching modes instead and use them at the
> appropriate places.
>
> For symmetry reasons export the already existing x86_has_pat_wp() for
> modules, too.
>
> Fixes: bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with pat_enabled()")
> Fixes: ae749c7ab475 ("PCI: Add arch_can_pci_mmap_wc() macro")
> Signed-off-by: Juergen Gross <jgross@suse.com>
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

