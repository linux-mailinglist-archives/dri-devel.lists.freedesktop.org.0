Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6464C52E6C1
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CE911B7AA;
	Fri, 20 May 2022 07:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-22.consmr.mail.gq1.yahoo.com
 (sonic317-22.consmr.mail.gq1.yahoo.com [98.137.66.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5988A10F398
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 06:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1653029971; bh=nAiiF/gaLx9YvHz1WBDFG9vBQFV8yYAG36DVxtUDGKg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=tLvZ3yzsCHOuV4WrX1KecYXs0pEIszI6bSoNzA1XE25GAU6V3pjIWuolHmY8padgkyekUiCsDaaE5QLypBFyYaxojzCWKxb1HJWRAAAWl8pTnJQzt91y4vddc0IkD9w+njtNwZxCGvjEM1955itIu76Fb4NkqaHPuzHRbySgIf/DSF01Zyn2MHsIE/fPPBHDRK9XxDjiz9wBqyqgy62WqZ59RZmQnDjG7X2UZ50N382AbyBV6BPqT50BZuatq78Oo6yxhouXC1BATI/ki9vBlszgc4BlDGSJCCyTVLHFwU0I8EDZQ0s/iS6i5KKQkoCO0ekSFRqhnES/hqkrMwOe2g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1653029971; bh=qaC13H91UDc+VejYtnG4e4YoYUKSODRWjrwz7203O68=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=FBLtiV+7nG53sWH4vtivDlRsiQ7U9+H2O82e70byZhBu5q513G53nK2/vCRSAif2sFdKprG9M+VRbaSbxlPyjl8LeNIz4DVevl8m2I2aZVeTyV2zvt5JQ77fThijKOQjnX1jAM4vlFIsupDo53wkuhtSUATJWbIySkBTNAO90VV6Syv0Uk6qvAz1skwaI68hOtJ5RPindoD85fX5QgLH6b3Y91hDwRqCdlFX6bPvo23x9kojLsRd5jbpQHrEwWSk27ukIFwhqZm3KJ3OGRpbvezesfwLya8R/u1asItlsDqQnmRKsC6ODgy4H4wjahYYmEHyxNjnldMHwWkhM2+JDA==
X-YMail-OSG: 7xtcaasVM1lx5OMihPL.hTlRrM1A8gAiFAluZtMNuTWzcGcv870G4vhNQPZRIZS
 ilxDgYTnY6Km_vUamZlf4scV5t21_TYQ3L18f1vS8IF2oTF0jrqEYdQWjiwAD_po1Durvana8z9k
 S5Nmu0gvJnezglWTF1P5xNECJtfXsYc75paLHUVCjR0eSwSKmztMsmNOGlP4eTVqXq.1NeSkl2g6
 QvsEqSV3DWHURxjOEGXk68nRQY7hkY4U_3rrBNbxF9HlnxTDidZ2eU2uaytTPAaBYX8PLyMD6KfI
 8Qh4i6fIEQj27ZDyuBs7D2ejdSKXAawjuo0c1F_4jIJPUIIlLcYEmzlDXWaL6ryL_Nn3VPbreDzz
 acD1Z73p_3ufdSev_GUX8DiMfR0Etah7zgfP_jGUa6ctalbF3NcnUck3NqSjO4iH.pT4IVDoO4g.
 SsDFxvhI9kx1Qyw6q_YBnuCSE7Sa7PYi_Yg3g6Qoe5HDOXcze8BWT91QRrax9983YrQDuhSKcY1O
 FdXs0nHPgFowx47xZOC5eoVOqmgT0DUEtE3FbioTjwoJuuX4IRGwookpeDxxLzS5xQ23QLdHNZen
 DSCh3o5wUhfR1bgjTg7XORYgXc4GlXiKAU2svD41dsQIT3WB73cC88lcP_0Hm1P8cfEV1bXDqTV3
 ITLSOplghvQymnxjEv7gLH0nca9XmBaeoLje_SBduuVgJX5rpoTIDZJs7d757Ic.vVqkIuSFTXrZ
 95Op_O8e1Oz7YS7rOcy8FJFk59NED_KjHBGe3mu61MCrFpN.4L7W.6eYBqL3se5ksp6w5LBerJqd
 98sTqB5wG70a5sA.SkXOG.S7wx3faRCL8J0XNFTNQluhnilgXbwIdL99WmBXkVgRFEJnafwoRYCa
 Z8k8yUTnb7ckMJmZejnNq.b_hYLG41aZSXjzaveOZH3OXxuoL46_tQ3EQteu4jJ2yY5_eHWNYqat
 Ri_jkXOsmNcD9_pr3VJITniq2Jn0ZNTY8ZJyraIM_M3PhVkaE8dI711kZ70YCzZRKnsyzq8exphZ
 B_cnxDyPJIT88zju7u81eNctVt2ora4rVYrzPIptRU2HUhOW8_Jpkd4rN6vi5vs95cDPQkGnDaRQ
 ZI_bObcrELFaOZ.ky3MZCLJp6K0gd5EdjeRdhKqtOS5f_hMeX5yiXP0lyRF0g4sswTTDKCUs7lAx
 pwd9mINEq07kqdrZrVC3DKO.aFwFB.KjlW2lsgjl30OXphrTnlTNPkDt2Wb4BTKAzIAW1Zjl_0WD
 Lc9vaypKYJ.vBO4ssOTh7KKvkv3JP1Mfu4jr6Tp70GE05I3QfJLghqxMzOtj5KlGj0FhcTLH3kcc
 0IiuJDtyjAgcQDU6zykDmf1SX.Rm_t1WgWrZ.bQ4vGk3ln56eftNhkBkewlMVT1iUaXlqUcwH8F4
 wV.KlsDBRfUyrcfzEK.eatnVe_TNlQ1yxBd2rqjsl_vZfDPrYG8HywXgOSAlNHm_2VPX6NkoM5xT
 6G1N5lhaTXs1mXbT_F.3sWbISjecItVM5zKDNADFOjEW9MKOA_J1Ckgw37pIdFWPpVhtOcoG1qYT
 oU2EALUQZ66qle9q5H50ck6o2jWgsQi5EAl6W2PzLXmdVGhFNcVHWk7lrkHcT6RgtE4gknfAi.12
 h3C6m8F8CgMfO3GQ.5yxgl0wAxslMHGGqQU9FrpNecAJ4a88Aw9Zrk2rEUlB5iRePZiiA0t3DoE.
 2.egF7I7_T9cyNZyFPTsAdZGsAEn0ifH91EgCZvRvLy.Xa8M.pfNLN30TVHGYVRvzxijxcdXqDs1
 g_20vFXNo.n824fOAMKq0yXKWg9ribjIxu.T69RwZAmsFFqtpMknS1OGHnsJrnb3T6vqsPYMMMMd
 zP_8BlykH.soKnXEJY4YgY8NIWMLPXX1Oc7JaR7b5AkfNAHtJQZtGYFBo16RnUAFioTGM9vcij1D
 RRNZbLbpvVkLOLeIffNQeqeQTJo3W2e9pZ2Ti6zWPvU0AY9fFGcYWPxmB8h4SKJmLat4MVnUGLcs
 nmFw4uL21s9Hsiyb987egxLFul1L_70Jt7rQ.u3GuQX9BJ4GHNlmWJs0RI6iMrCRFWoyYmZNxO_P
 aCcQdZDnCbMIIIFMaeYgF77GZlIzio6lCsPkWxOdUI7epcuPKOA0a97onBFS.bRWfb37uNZ0H8Au
 ckQZogbtCcbzM4DuVH2c_hb_2GQhNuLSq72OSZ.m__vZtFIQwCLL6hH1jYdSlZbes5DIhL58aF2x
 Z5C82
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Fri, 20 May 2022 06:59:31 +0000
Received: by hermes--canary-production-ne1-5495f4d555-xgn59 (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 077428ea294e9eca2cd83f945fe6833b; 
 Fri, 20 May 2022 06:59:14 +0000 (UTC)
Message-ID: <8b1ebea5-7820-69c4-2e2b-9866d55bc180@netscape.net>
Date: Fri, 20 May 2022 02:59:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
 <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
 <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
 <a2e95587-418b-879f-2468-8699a6df4a6a@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <a2e95587-418b-879f-2468-8699a6df4a6a@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/20/2022 2:05 AM, Jan Beulich wrote:
> On 20.05.2022 06:43, Chuck Zmudzinski wrote:
>> On 5/4/22 5:14 AM, Juergen Gross wrote:
>>> On 04.05.22 10:31, Jan Beulich wrote:
>>>> On 03.05.2022 15:22, Juergen Gross wrote:
>>>>> Some drivers are using pat_enabled() in order to test availability of
>>>>> special caching modes (WC and UC-). This will lead to false negatives
>>>>> in case the system was booted e.g. with the "nopat" variant and the
>>>>> BIOS did setup the PAT MSR supporting the queried mode, or if the
>>>>> system is running as a Xen PV guest.
>>>> ...
>>>>> Add test functions for those caching modes instead and use them at the
>>>>> appropriate places.
>>>>>
>>>>> Fixes: bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with
>>>>> pat_enabled()")
>>>>> Fixes: ae749c7ab475 ("PCI: Add arch_can_pci_mmap_wc() macro")
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> ...
>>>>
>>>>> --- a/arch/x86/include/asm/pci.h
>>>>> +++ b/arch/x86/include/asm/pci.h
>>>>> @@ -94,7 +94,7 @@ int pcibios_set_irq_routing(struct pci_dev *dev,
>>>>> int pin, int irq);
>>>>>        #define HAVE_PCI_MMAP
>>>>> -#define arch_can_pci_mmap_wc()    pat_enabled()
>>>>> +#define arch_can_pci_mmap_wc()    x86_has_pat_wc()
>>>> Besides this and ...
>>>>
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>>> @@ -76,7 +76,7 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void
>>>>> *data,
>>>>>        if (args->flags & ~(I915_MMAP_WC))
>>>>>            return -EINVAL;
>>>>>    -    if (args->flags & I915_MMAP_WC && !pat_enabled())
>>>>> +    if (args->flags & I915_MMAP_WC && !x86_has_pat_wc())
>>>>>            return -ENODEV;
>>>>>          obj = i915_gem_object_lookup(file, args->handle);
>>>>> @@ -757,7 +757,7 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
>>>>>          if (HAS_LMEM(to_i915(dev)))
>>>>>            mmap_type = I915_MMAP_TYPE_FIXED;
>>>>> -    else if (pat_enabled())
>>>>> +    else if (x86_has_pat_wc())
>>>>>            mmap_type = I915_MMAP_TYPE_WC;
>>>>>        else if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>>>>>            return -ENODEV;
>>>>> @@ -813,7 +813,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device
>>>>> *dev, void *data,
>>>>>            break;
>>>>>          case I915_MMAP_OFFSET_WC:
>>>>> -        if (!pat_enabled())
>>>>> +        if (!x86_has_pat_wc())
>>>>>                return -ENODEV;
>>>>>            type = I915_MMAP_TYPE_WC;
>>>>>            break;
>>>>> @@ -823,7 +823,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device
>>>>> *dev, void *data,
>>>>>            break;
>>>>>          case I915_MMAP_OFFSET_UC:
>>>>> -        if (!pat_enabled())
>>>>> +        if (!x86_has_pat_uc_minus())
>>>>>                return -ENODEV;
>>>>>            type = I915_MMAP_TYPE_UC;
>>>>>            break;
>>>> ... these uses there are several more. You say nothing on why those want
>>>> leaving unaltered. When preparing my earlier patch I did inspect them
>>>> and came to the conclusion that these all would also better observe the
>>>> adjusted behavior (or else I couldn't have left pat_enabled() as the
>>>> only
>>>> predicate). In fact, as said in the description of my earlier patch, in
>>>> my debugging I did find the use in i915_gem_object_pin_map() to be the
>>>> problematic one, which you leave alone.
>>> Oh, I missed that one, sorry.
>> That is why your patch would not fix my Haswell unless
>> it also touches i915_gem_object_pin_map() in
>> drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>
>>> I wanted to be rather defensive in my changes, but I agree at least the
>>> case in arch_phys_wc_add() might want to be changed, too.
>> I think your approach needs to be more aggressive so it will fix
>> all the known false negatives introduced by bdd8b6c98239
>> such as the one in i915_gem_object_pin_map().
>>
>> I looked at Jan's approach and I think it would fix the issue
>> with my Haswell as long as I don't use the nopat option. I
>> really don't have a strong opinion on that question, but I
>> think the nopat option as a Linux kernel option, as opposed
>> to a hypervisor option, should only affect the kernel, and
>> if the hypervisor provides the pat feature, then the kernel
>> should not override that,
> Hmm, why would the kernel not be allowed to override that? Such
> an override would affect only the single domain where the
> kernel runs; other domains could take their own decisions.
>
> Also, for the sake of completeness: "nopat" used when running on
> bare metal has the same bad effect on system boot, so there
> pretty clearly is an error cleanup issue in the i915 driver. But
> that's orthogonal, and I expect the maintainers may not even care
> (but tell us "don't do that then").
>
> Jan
>
>> but because of the confusion,

As I just wrote earlier, the confusion is whether or not "nopat"
means the kernel drivers will not use pat even if the firmware
and hypervisor provides it. I think you are correct to
point out that is the way the i915 driver behaved with the nopat
option before bdd8b6c98239 was applied, with the same
bad effects on bare metal as with the hypervisor. I think perhaps
dealing with the nopat option to fix bdd8b6c98239 is a solution in
search of a problem, at least as regards the i915 driver.

The only problem we have, as I see it, is with a false negative
when the nopat option is *not* enabled. But the forced disabling
of pat in Jan's patch when the nopat option is enabled is probably
needed if the goal of the patch is to preserve the same
behavior of the i915 driver that it had before bdd8b6c98239
was applied.

In any case, especially if we do include Jan's aggressive approach
of disabling pat with the nopat option and preserving the same bad
behavior we had with nopat before bdd8b6c98239 was applied, the
i915 driver should log a warning when pat is disabled. Right now,
the driver returns -ENODEV with the problem in
i915_gem_object_pin_map(), but it does not log an error. The only
log message I get now is the add_taint_for_CI in intel_gt_init
which was not very helpful information for debugging
this problem. It was only the starting point of a longer debugging
process because of a lack of error log messages in the i915 driver.

Chuck
