Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D365252E6CB
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FFF11B7B8;
	Fri, 20 May 2022 07:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic315-8.consmr.mail.gq1.yahoo.com
 (sonic315-8.consmr.mail.gq1.yahoo.com [98.137.65.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEAE11B15C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 04:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1653021800; bh=J1YKr5RacY3w5lsZh/paPzmLPI5/GokFPpbgIzeL1N8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=DPjf6byxXe7OOvRJuwoUNRxkSLMIOl7fm5wIMi6KkNUOnrUaUDIOilQXe1YtorzHmDz9z3Algj5evXV5+Z8/K2OSpuBNcuav565OYJ9uiIU8UO7MsdZLiATjZVRw7aC/k+OnSCM5AYFzXkGDVFsuYlr/5lsfVtj8pCkcb3MZuQlty0lHCbgKHUmlk+1Oz+uKvDWaOIXxFB8y040J3l74VrcSOlu3ZgG28IRzqtZvQ98hRYzbTrXrNoe/LY+PQae/qTyvoW/fgIgzng8A3CcSPmnOCyAkuccTOyidEyzA4/5IIQ1ecy1HraQ9zJR7ynls0m0rHesFg1XpaTvvGGGIDg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1653021800; bh=mBfj7zqheyE1tLGfiJ0ww0RKlhBpFN3oc2UFTWLtPCI=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=Mnya2XL47Fhd1rH7cqwg5FB6+px506jhzRBHwJ4QsGeqUWYIX5i6few3UJeZ1CnkEgauOhjo7e3Xm1JUsEmV5F7sRZwXpggbEXTxvLPL4oRtyRRQVVUn5twrlpNBbNoSmbvCBkJR5zHy6dpIUd5xuxSfU516fuPvsI0RSZ1YaGrwVPJb2UR7lXX8O7DKeRk6iPdXkfvUp2ABVZwWulfkLIusHqRPa3eYpVQCdT4QkkSctkhGtlz+2yhj1FomH8OOHHAjwPIHQF0wYGhXnqdhS0Vy+UH4hEWQDHoiSCOEKM7WBkGPaiVKh2i6QcUsxMOjZoElTssOffKYc8ckzVk1lQ==
X-YMail-OSG: R.k3XAIVM1kotrSaFFhdpBpoD4xSgja4_dkfHDhErnJNqmVRceWBxOlPNtzElRS
 0qhYAtbZrNv56G9bIeNEXEXZuvaUa6t22zhUx7_q8_mvpB5SC_4CorEoljneMSyTt7qhv2kzX8M9
 h21HJ3Z.IRg7kpKUIMBw6J4gRGP99_5AOAAeGVWvItLBvLgOjszD1rl5B0IZzOcTN6MVfgiEO6G9
 D38EE.wn5YNgi1b7F5ce4Tp3bDYPxwvgpNFXyCwV3Z1wI2kUCj3_enjseb3To3DLU7gSydv4C5ZO
 rFBdZZ8TX52gfdk5kUUDB38yy6c62gpUHI51pjF.QM50K4aG28gVJnt7se1nbelja.3_PfOES80B
 wYn5fRpHetrc4OcRMIa2j8kqypfoZM.OEfnUS4kHWDr6aM97Qb4mKqB0jB8lG87ekKdmlrTOAA9Y
 _qc8jyMAtGz854ciX6WvzMgKXBhAxffwQpJcmqi0mMq9i8k6Uu90R3BdVvOYuko6YKmwMJOnBobS
 1j8BCI4D8aPmB7ro3EKp.l1zzbobJfEIafQYxbxh6V4s0kXloaPp_3nXvJSnkuj1T1Yx_AZactm3
 hl6KwiB2sfDTT4iA8hMM5PdUF61SNEOwf.rSvX9S0rDAz3TlWliFbAlXnZnrt4vFYEZNQRh5Opus
 eAkgPFNue8zyrWksx8rqEYMQXLok1ZXVcAHUL7c2aFHLF.nufV5HipkRlI6kTEcn3vXf8RrCjmCn
 J1mrv4U3R3aDF7XrqemtxASI9gUP7oBz_JWCIfWad59NmZ2jClblfDPFLsV6eOfGgxXHjVTG4tdY
 7sPL6WD8XnhZ06JQyk3BNAOZCjxDMI1Lbw7n5BVSslt_PjqW.tLzDlFklpKLCiuG238.mhESvaep
 6KnMkLXM4hFEKdjTlc8DQ6dJrHisJ3xYEZ3Ewk2._TM8fIm3v7F3JLp2ex7BiRnrEdi26omVoWKv
 aGt3VX4GQIbxAJI7GlIXsXHDinW2xrvbUM7RXZAXYG_IoL1cNyTEuwtg43qXQ4agYoe8wBzOUS8e
 ru8oMRlyQwXMR2jXwWHd7AstIsUqtH8qProlbIFPvLZoBD.S.p_sYR_gf7CxD0cjckg_Ka7KTw_W
 MJhPd_ZbeTv60yW6lBAD9st1w4WAqBTP3RSawE0cr3cSONsX1lSBAIEvgbh6VZ2r2jk.GT1zjXeA
 BVcHBbO0vMKTeQPq0J2B7Yj7128f4SImKaF4FY7BbcpAtxtUWUPJXPRE0dFGfMfBy22fuEdA0_GU
 kgktZWyoOHOzaDGY_CC5zubGmxvWQachEdDM.P4vVTuNMOsW5ebgWyIcBCxpobGRuXQvyh5h5lwa
 OJXJAbW9DfyKwxoQafOdF3valglMgZanQJvIY2K78IHovBy9PVEY3tltJOFxsCoudcYuXehCbgPE
 c8Gg1C4BedQDVUnHCIO9a3IHzCbFfywpARwZjgkSkue.9i9icsltyeoQMbfev5upHSeC_Ri_l9Q7
 8WawkOGOwa31yF8.US0wqx4HJ6UD_gGpOsFrmyYLKm0h6RZjFziKt1UGau3kgEPPr7BMZSQwBMBp
 FJNcy3m3mLqd95V8dqAVVZlYVyNC7UWe.G.PGxo23kYeqNsdn9rYIa.VhcPLMCF6KZDxo3RZ0eqv
 BXZW6P5mYwAzmvTZTW7yqryRBEsGqJOWO3Cna_X4clc_dHaaG2mgGBf.9aaENFW6a16sAMnzb_eg
 hIY2yIb2ih9PATNrWWW1pgaKls7zakAZlr2qnhBC7xfWD99mHNhC49HaJRsBEW4..EcJw1EUP8VM
 CMzQBk8fRrxKJse7bsNGi_KLyDWS1uQMjq.k1kAw_Wxqj6pdyg6TKs_oSmiF7PjcBil9_50Iq4o7
 NsC3zfLhuO0DLKpOkkcp72sZliNYrmnsuDk86KePlardyMZ9DynTJZL6pj_2nU5EluZcJt0yvlY5
 vGmRN6WQg7dXCO2nqS9hFOIhViTirdP8ClDzZnMtvpbjOOF65pKTEn.Hz6IeYvWRx6UmeNfQKz5l
 z5SdSU4hKd1.ICaA3EnQE247Z0OUfUZ0A92Yk6Tslam3jb24_gdVapYnfDv5msqeyfF3TXLb2ADX
 nzq_msCXI0cmEJX_BAki7tVbdRK7fbmA1EI2lo10RCYxOjGloMV44vPS7JrV9n5r3yX2Nsgr0Xrv
 cc.S3.oWJb95oXhUcxz8TRnk9_4GBaaU_GGDj0kBA_Z5w78ZsfvEISJaf5ynXKYkI6i4_suDg6Wh
 wgekAoVM-
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Fri, 20 May 2022 04:43:20 +0000
Received: by hermes--canary-production-ne1-5495f4d555-bjbtf (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID a1795d04c77b5a17be6e88fe29b6a939; 
 Fri, 20 May 2022 04:43:16 +0000 (UTC)
Message-ID: <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
Date: Fri, 20 May 2022 00:43:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
 <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20225
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
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/22 5:14 AM, Juergen Gross wrote:
> On 04.05.22 10:31, Jan Beulich wrote:
>> On 03.05.2022 15:22, Juergen Gross wrote:
>>> Some drivers are using pat_enabled() in order to test availability of
>>> special caching modes (WC and UC-). This will lead to false negatives
>>> in case the system was booted e.g. with the "nopat" variant and the
>>> BIOS did setup the PAT MSR supporting the queried mode, or if the
>>> system is running as a Xen PV guest.
>> ...
>>> Add test functions for those caching modes instead and use them at the
>>> appropriate places.
>>>
>>> Fixes: bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with 
>>> pat_enabled()")
>>> Fixes: ae749c7ab475 ("PCI: Add arch_can_pci_mmap_wc() macro")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ...
>>
>>> --- a/arch/x86/include/asm/pci.h
>>> +++ b/arch/x86/include/asm/pci.h
>>> @@ -94,7 +94,7 @@ int pcibios_set_irq_routing(struct pci_dev *dev, 
>>> int pin, int irq);
>>>       #define HAVE_PCI_MMAP
>>> -#define arch_can_pci_mmap_wc()    pat_enabled()
>>> +#define arch_can_pci_mmap_wc()    x86_has_pat_wc()
>>
>> Besides this and ...
>>
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> @@ -76,7 +76,7 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void 
>>> *data,
>>>       if (args->flags & ~(I915_MMAP_WC))
>>>           return -EINVAL;
>>>   -    if (args->flags & I915_MMAP_WC && !pat_enabled())
>>> +    if (args->flags & I915_MMAP_WC && !x86_has_pat_wc())
>>>           return -ENODEV;
>>>         obj = i915_gem_object_lookup(file, args->handle);
>>> @@ -757,7 +757,7 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
>>>         if (HAS_LMEM(to_i915(dev)))
>>>           mmap_type = I915_MMAP_TYPE_FIXED;
>>> -    else if (pat_enabled())
>>> +    else if (x86_has_pat_wc())
>>>           mmap_type = I915_MMAP_TYPE_WC;
>>>       else if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>>>           return -ENODEV;
>>> @@ -813,7 +813,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device 
>>> *dev, void *data,
>>>           break;
>>>         case I915_MMAP_OFFSET_WC:
>>> -        if (!pat_enabled())
>>> +        if (!x86_has_pat_wc())
>>>               return -ENODEV;
>>>           type = I915_MMAP_TYPE_WC;
>>>           break;
>>> @@ -823,7 +823,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device 
>>> *dev, void *data,
>>>           break;
>>>         case I915_MMAP_OFFSET_UC:
>>> -        if (!pat_enabled())
>>> +        if (!x86_has_pat_uc_minus())
>>>               return -ENODEV;
>>>           type = I915_MMAP_TYPE_UC;
>>>           break;
>>
>> ... these uses there are several more. You say nothing on why those want
>> leaving unaltered. When preparing my earlier patch I did inspect them
>> and came to the conclusion that these all would also better observe the
>> adjusted behavior (or else I couldn't have left pat_enabled() as the 
>> only
>> predicate). In fact, as said in the description of my earlier patch, in
>> my debugging I did find the use in i915_gem_object_pin_map() to be the
>> problematic one, which you leave alone.
>
> Oh, I missed that one, sorry.

That is why your patch would not fix my Haswell unless
it also touches i915_gem_object_pin_map() in
drivers/gpu/drm/i915/gem/i915_gem_pages.c

>
> I wanted to be rather defensive in my changes, but I agree at least the
> case in arch_phys_wc_add() might want to be changed, too.

I think your approach needs to be more aggressive so it will fix
all the known false negatives introduced by bdd8b6c98239
such as the one in i915_gem_object_pin_map().

I looked at Jan's approach and I think it would fix the issue
with my Haswell as long as I don't use the nopat option. I
really don't have a strong opinion on that question, but I
think the nopat option as a Linux kernel option, as opposed
to a hypervisor option, should only affect the kernel, and
if the hypervisor provides the pat feature, then the kernel
should not override that, but because of the confusion, maybe
a warning could be printed with the nopat option when a
hypervisor provides the feature so the user can at least have a
knob to tweak if if does not behave the way the user intends.
But I must admit, I don't know if the Xen hypervisor has an
option also to disable pat. If not, then maybe Jan's more
aggressive approach with nopat might be needed if for
some reason pat really needs to be disabled in the Linux
when Linux is running on Xen or another hypervisor, but I don't
know of any cases when that would be needed.

Chuck
