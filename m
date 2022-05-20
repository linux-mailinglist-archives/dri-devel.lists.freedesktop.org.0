Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54B52E6CD
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0791511B7B5;
	Fri, 20 May 2022 07:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic304-23.consmr.mail.gq1.yahoo.com
 (sonic304-23.consmr.mail.gq1.yahoo.com [98.137.68.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2D311B2E1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 05:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1653026192; bh=4Me/4JASdrdloQbgKafyPXvRt8VNrcs6HsuYguHjRzY=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=tyDM4I7Bq1sCFvdwy62MLgwnyUxAY1AhLZv1yxjv62Uq4ogSD1KShKZ5YQDNfbOvG/T9gnaTIca5Hx8QCRRmEONISsyoZr9fNSpvBwrMMJHqN4G3/O48BW8NQv3bAfVugmGERWTI6Ol+erEuVpZ9DrdyHDdpiQlKLByzeKIAKt7eCB1E9sPisoUTi/mcN1JvdAi/Ncr1n4D+zFOWtNxRJE7bWgDyxKVy++MiLvrW5x8tPpQnsIVQz4AQ50kPlELGoBCBRYGjTztZdKwtgv29yyMwVbQ7FN66veUTlDniLD+ndDEKXwjIju8VEveLYcwC2TE/hM7Pu6GFPfBx84iTmQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1653026192; bh=e1dpCefxzUdOh6XsXzGjZpGDOOQHZNMaNtJy0wzKme9=;
 h=X-Sonic-MF:Date:Subject:From:To:From:Subject;
 b=lcUhXzacJfSlTVSsR0qS16dvnxHnyHtwxhValk1PTwNaCc7BlgpdSPEjh5ZRCfZJs3ZM1uFryUceqa9aFuCZHUT70SRHn0RN0FBdQRUpk1JGhRAdhqrD33i2oEH9mdRRD8cQ/riOQCpkURxjQjEuuu1IWOFLmEFwYVFbqLQAQFmRDpq5/PPhc4LL4L3eFXpCHYx9E6GHb4FiOwJU8InSHsWCKkYqVmd+VlBiH+cEY1fNRXotP74fVyCiiEbw28NtJ5wc+/eXaigsuRRqZPhF9HsLCXeq8ry1as4OqXhR6BVXRmh/9pWjxy/YTC72wO/ZCwks/jqPqrakPbZINLnWFQ==
X-YMail-OSG: KMm6aw8VM1kY.qTbM6378OyzYj34nnkGleDCLgcsyGmHjYVmVjI5kL_I8yckJv0
 5qIVK6onGiyLpH4JcLnmoA.CVosZcSSvt0pjIQc6bmHTYBdTrTtDxhfTJvTQMzzLoqPtvjxYPR4x
 De_PbI4lMmJedPboG4is_29kRrHeEVdPXi2c7xqd.VpMCcWJL0zfvT624g9gJCGV.QeNPjfgvvTy
 C3GNWOCrmtQz._lkBgdvIRa1YIslCBFbdgu4YBA8gWr56C.ZuCwhwi65zhvNkZxID8Tdf6UQTq.B
 jnhhHnB9F6eVekh0nvJ19oit4Pb2lUE1FV6itTgLrkCwOV7iQyUxKlrdRvsK4SXsq4MV4p4iCWjP
 qmtY2itdLcEJGmqTCufNRrinb51RyijQW765aewQuRXiw_8iyNId2cUwEIJRHOhKXVv5vkeSkMC0
 PEmW2DsWYJB40vVFPjr5gELDmUE1Cl2lEGb8adNsJVydygQkdLjOhmpQvVbk3vGoVtNyIeZiyWxL
 PlPkJrgVu.ZlzvH.oAV9k1P8oqn4Awx5ItyQolilndBtznCy0AbYSnuBo5Q3INmxmrYFfoByDblW
 XGmVQSqLZEkCh9WvCOd8jFoWPzPSxKOzBCVdAMyVjDmbt2DlqnntwYG601cM11c9MBYynpJhcfeo
 Vqk89a1pBn5PUtTMEkSOvdbMY7azY2zHw1Saunyae3vONQIbZ_lY_pdl.ycsfsud4vIigJDjwpV4
 dx9dwhq68nY6KyhgpYFAdgraEGZTbLJ4kL7RZp.nAvKZigXKuvLhl8Qng41XpK14SxD7BjQQwkrE
 i32GdytMB6JndVJ2AMurmwQ9CWQ5jhCJBLzOutyh1M.CcY.SjAs6n1JlFgC241W2D4NbOESIHS2R
 J1OyxUnd9eKb.U58cDvUYz3SfMzaaCkXucWPPS_Ugn2cyDyrKM_Vw2CcBXVkn1uYt_mtJtVtzUDy
 sPoD5DyK8SSXcIBNIxRjATYcA8njffmqyn3aWnzO2Y.RBve0wTTm5Ngyg.pAQhxGajFk_BumZxY.
 PeBppfoKjWxbzIECZcGAc.ROhB2cfuc.8x_hc3a3Y3KOGopUu7TYzEKydwQ4CO_CmfmJQAQljaex
 TPdCzp40iln9e6X2w2wsHslyin0W2kJduFhLhkOFrQ8PmckyBAgVIpM1hJL347GsEwjYcJbMjrJg
 beb2OJey8n0MHz96Z07edvV3FkHRPXrVFaxYStMSjscAWQRAkBoH6k4a7C6c_0agMumYw7pBEYeO
 lLAiGArOW9eH2Y3pFMQboWQwZFLw8cPCqnyoVS6hcBN.VlpDOx6k.40u5VQeOHlAjGzXH2d.TORG
 f9rdOn1jYkIrV9ru3xo4nle8FRo8fbEGBKn3BAvUszyXRYZH_Kw1TnCYaNAzlFt8UUxQc1cIMQ6y
 VnqEfYW6UVMulg6_ZgXyibP4swWnU2kgEBaFUWb7NWC.rcKwolwpy03898RatSamPkVX8yZvA9po
 eHIqtzOScS6QwXbSw8I3LCjwo8vGRjNvocy6bHlqjKwSddZiO3HtwpZx9RnCBFgv.14T7amEJ4QA
 9zjQL6cQm8yNPQYrNyEBhEDyryzJtNeMRvcd_tCO_wvd5mEmGdhWsRKMD6WfU4iMGq_JqqaAkV3N
 1KXWR3c8QnsvArz.enpzl1YRK19jw7uSehWza4u31OQPZ.tuHxvpqzrRON8AjzCvYDHFTJA93W3.
 LfIxxYUwcCaimCVdVta7vpjZJPZaXgvRU2_QlIYDi7oJR4TXrxDdwSy_6k2ziJUP3c.J_fInhToE
 8YasVyj4UaHH4MwbOMzoiTX5aqbSnfVz0cLB9pBzaXLdg1Vrt8dh99POm0cKfyatH40WSWV9WhuZ
 wTG4E2mySRPEd0NWB7A.0Q.L1xBv5tTRGEj2qJVVy50ifILhoMAzWnfxrpfJ02HAbxuvnnFZcEJP
 jxmlCeFq8waUaeomuqUYC1hWw_9LRP5UW7Jy.e4BEhPwCeTA6WVCaMp5sDkPcnOuVMxnXTc3XZd8
 AjLvsfSy5RlWaIMntI3URZXnisx4Rhi9mNBXGGV4in6qDmgYjQqzmvyEwnrPqHQdCfH43zC11LRW
 E9cvI112oFbS5iYDrG3EAnfXkUnfOBlB1woocD_gi9GfijgUt2Tfuu.IItCAoR5_PbZJsB_btMmT
 YJ2vUfEv83.OGFDrmXKa_ZdQi5jg2cDmgBS2m1ye6.HOUT16M6i4CBW93f7vJt.keQjUJzb5T_4_
 z7huevnaSxw--
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Fri, 20 May 2022 05:56:32 +0000
Received: by hermes--canary-production-ne1-5495f4d555-7fknq (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID b06f9e3ae8187a718e33d020c3bbcec0; 
 Fri, 20 May 2022 05:56:28 +0000 (UTC)
Message-ID: <c42913eb-6b4b-6be8-cf5b-e73a9795a921@netscape.net>
Date: Fri, 20 May 2022 01:56:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
 <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
 <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
In-Reply-To: <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/20/22 12:43 AM, Chuck Zmudzinski wrote:
> On 5/4/22 5:14 AM, Juergen Gross wrote:
>> On 04.05.22 10:31, Jan Beulich wrote:
>>> On 03.05.2022 15:22, Juergen Gross wrote:
>>>> Some drivers are using pat_enabled() in order to test availability of
>>>> special caching modes (WC and UC-). This will lead to false negatives
>>>> in case the system was booted e.g. with the "nopat" variant and the
>>>> BIOS did setup the PAT MSR supporting the queried mode, or if the
>>>> system is running as a Xen PV guest.
>>> ...
>>>> Add test functions for those caching modes instead and use them at the
>>>> appropriate places.
>>>>
>>>> Fixes: bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with 
>>>> pat_enabled()")
>>>> Fixes: ae749c7ab475 ("PCI: Add arch_can_pci_mmap_wc() macro")
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ...
>>>
>>>
>>> ... these uses there are several more. You say nothing on why those 
>>> want
>>> leaving unaltered. When preparing my earlier patch I did inspect them
>>> and came to the conclusion that these all would also better observe the
>>> adjusted behavior (or else I couldn't have left pat_enabled() as the 
>>> only
>>> predicate). In fact, as said in the description of my earlier patch, in
>>> my debugging I did find the use in i915_gem_object_pin_map() to be the
>>> problematic one, which you leave alone.
>>
>> Oh, I missed that one, sorry.
>
> That is why your patch would not fix my Haswell unless
> it also touches i915_gem_object_pin_map() in
> drivers/gpu/drm/i915/gem/i915_gem_pages.c
>
>>
>> I wanted to be rather defensive in my changes, but I agree at least the
>> case in arch_phys_wc_add() might want to be changed, too.
>
> I think your approach needs to be more aggressive so it will fix
> all the known false negatives introduced by bdd8b6c98239
> such as the one in i915_gem_object_pin_map().
>
> I looked at Jan's approach and I think it would fix the issue
> with my Haswell as long as I don't use the nopat option. I
> really don't have a strong opinion on that question, but I
> think the nopat option as a Linux kernel option, as opposed
> to a hypervisor option, should only affect the kernel, and
> if the hypervisor provides the pat feature, then the kernel
> should not override that, but because of the confusion,

The confusion is: does "nopat" only mean the kernel does not
provide pat to device drivers, or does it mean kernel drivers
are not to use pat even if the hypervisor provides it?
I think the original purpose of bdd8b6c98239 was to
enable "nopat" to disable the use or pat in the i915 driver
even if the feature is present from either the kernel or the
hypervisor. This interpretation of the meaning of "nopat"
would favor Jan's approach, I think.

Chuck
