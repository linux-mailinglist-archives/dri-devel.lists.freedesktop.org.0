Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F032D53096D
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85BA10E60E;
	Mon, 23 May 2022 06:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic301-21.consmr.mail.gq1.yahoo.com
 (sonic301-21.consmr.mail.gq1.yahoo.com [98.137.64.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB7010F3E8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 13:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1653053641; bh=K5D2ddvcAFT7qU/7/cIEJD0V4lwIe18sO6+LKjoJkw4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=PkYqpkkuQo45ByHHvchEhcebEAtp8AaC3/itk3+k6pOYzK1Vl/z8z2g9vmutXN7I+03ApExQ4Y6NLB+mJcTpxYKJvvgyubHih/MqBK1Y11BeD30vqVTc0y1MeyFfiy3rCLZWZIHEDBZC4ahH0inwNJWV4xCg2iwePPljxybrImoNt1fbIhLFEizqXiPa4oducIBTEgo/mA96tSRC+OvtAgX6rD6ayRTLgxi5VR/46+xLeyq6zj6iUiGngD9191uvtGbsX6W2THai8Km28tbUH07O+9GAxGU8OOdoTvL2OxR6ZVpzH1zVjegzIF7Rog41ycBWUqiR2YYy+asOTrHKlw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1653053641; bh=k377TC4FGAEpIeRlbM1rv1iA2GuaofkGOp8RBu3yFHW=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=ugE6ujVanxC1STiP9viWDUWUTNr/7Wt7WN+8jsE/QCpermZtrtRAmb+JEtTaPCqWvzCLjKRzlFHmOmRlqly5nRy6Pco3dqpWzd+rCRd8nPoHcWX0uXI46JW+Rcxe4e5blbA0AB4+/e0weqdbzBQPr8Fj+4Jjrwt9l6wOn1ngb9jg77j3LsRIUF60sw2r0tJMr2WNI3fO9KAhu+ab9BOdtFRCES0M9WUvS9cMcQFIjtRgQJhFLbegsXhXPke0fJM2W56NR7EOVruOBmrw0REmQHnlmYmIqkHKMcbaTSBFZMhwyRP68X9o9jBO9UAYFlH3wkfHoWT3bBG2Bgi/TZVDoQ==
X-YMail-OSG: Y48VktsVM1mw1z0tQFnDRFf5ZFKaFyl88afrKxRgVCgenPdgml44kt9snHULpVT
 0hp3_yGN5gR8i1DwVi8RSa8Tjln6rXBvzF_mi6gMpilobbMMYPhnFUsBCXflENor4wEUUZNSmxyw
 ai48GGw8Y6.jdx043KG_tOo8G4Jmhkj05v3Ch.1Ut3YFFvauy_jNvaiswLqGx_5CkZib26t67mWd
 v.fg36jpHJlDXy6dFR3IVxO7AZmdzT2ML1jvHYDGU3XniZ_gAxL9hB_5nCYJLjv96xYlLK2yZvWi
 7.uHJxWl3WWsJU5PaaHz9vzU0LH4nW9xRufzzv8nU8jKIK0FTuG7UePWKD.QveI1K516F.xFZ2Sv
 KdFfpBV7t98KX1GzR4CXAi2Fmro4iNkk2gW6KkQYyZvddsSsBvES1Vk3IKz_JaBt46ORP71IICFf
 _cZQKiIrezoGDURRIwoCo7fuhQBoUPnevV1uuIKBoR08ir2zaE3SrGWq4xQI5NozSPjI6xS8mUcL
 8LQREAONgkJvqpkY1ChD1yiEcApxNn3Kg67R_hH9Zag8DjckAboKfmcwhFuLthXYyRQOq.orj1og
 U6XtQR6s3Z4iNUZNupP178rGJoDuSB.m4ZqG6.rQ33Z9SuuwVo2FJ9CkbGb8VrEqIMmNUMuU96Hm
 mKYWS3fhCsK5TS6efG98kfRrHdJiyfFRhr2amzI1ru0Yk4OrF68XOnjEubxPzj7CNz7QSYP9ji2k
 C.ziTjq9SyX9oJ75DCIiheFoncYe3YPD0B6KZaP9NqGUj6jqbxWkLprxJF6jJAN8mna77uif7jLU
 AdviL5AaGK03B6rKCJu_4YzT1KCElh_OjJdMCtL1iV_HhUiD3pwTRGe5x0MY5mBpML35XU2WoUG.
 tcJb7gTfdE0yvdGszIy9Mi670l890r258zDdaeeaXNEjkzrJ2tWBVn9kjMJFpFe_aV_FB_IbziQ9
 HWabonezKTYBrLnm49Mn9rhQR4LKGlbA5puye05mehZWT0VacflQ.cMQgiiqdwhERh1Re8zSh26m
 Gk0r57T6lXZ5fDhUXK.tp5RSZbTl4c43W.9qZwG9HUgeNLWNCsl_Bu9HWsk6wtfeciGjagOJHFcl
 5ibrmoOf.5n7dpBCLhOnNE5G9OZmS_r81Fup_YgNPry9aBT7cVlfQjvpzHHnuS._UbSYZ0noJWzW
 BwTcwZByIjHOCmqaqQW8HIW1tA1N_xLmdC8aOkaibNjVLS1FUhD_adW.YKBMGvd2AljWFHM0weoX
 A1cQNlmZLS7T26QoTblYoV8f6qf0kO5xt_6RevEWsbEUVehI2DrRCE7G1Wfohx.hqi4T8TA.puAQ
 sv.TrzuZhbSJ7eWZ06OH74Fcdbe_i2p9Y6hoWTeaPkkp6Xoc.hF3XI48Vz9SZuuYaDklhkS_QEYl
 5xwQH895VwCP3RL5gqIU_Y4GfhctIUqn9RdQwVxOPkjw_jT2xz7Cle_jzNNKnCf5vL5RaJF1WndL
 LXx3O1qoLa_wWrbzXSTdSHOh8sOda8aFNeNYBtBmKP4PKP7KuyyslQSSLp2D.MbE3nmkYma5bsWL
 HMpO40hsuCZmIMaSdc8tqNyPKo1DpY3M_GkEcVGlqG2INwshP294ZHblx.Tcrhk895hodtT3KCG4
 iTwjk5odyFIZt8XZMl.NV5MuGr1XuUJgjPDJTf_7B_yqJcGyVDGJKpBmc9fLvmqtJjSue1TsSJK4
 uu5gR1eBHHke7g_zT2Zfves6VxMqDUYC9gKikpXfc8fhUzA0cr0eKd9Je61rCWZKILB3.UogNaPC
 YJPWxETcskk6NC_Wp.RjKC6.4DsmNBjk0XzEAS4uKfqFDLI6XbtCkv04_1l67umJkst_y9XkoAX.
 xNPe4YNN7394MMO8MyzmWn3iiosn30eO6PBD4v3MbmivZHLxrpIySMuvAWpWF5Yx.13EakdrURU9
 vPPVKuDnSfeBAlIQiIlA34.bosrKDPG5EZGLwwJDOVXc5HhFVjCjJcIbe0LfNbHxYwH7H47VQIne
 hoDB_nqDX4ZY5qJaX_smXDE_i0TB80HHXWa6bplXabf9K2qEBMna3975kd7RoWhKoHXdddkml9ia
 zYyEnt4j9FimF826VhH8qwOA_1NKnOEDNM3gi6EoQjR5cC2qC5idpK8oxrS1WUzekA3zM52RKYb2
 nbRsuf8iAUsVckiUApbxO1aWK1cLqCX3xTvd8CcZK3SrItQxhcDnnSok0e6ZC4KA5tIupcYA6fTg
 gGjcC
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Fri, 20 May 2022 13:34:01 +0000
Received: by hermes--canary-production-bf1-5d4b57496-srbfg (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 457ab9e3e0994f36cbc2ca446594030f; 
 Fri, 20 May 2022 13:33:56 +0000 (UTC)
Message-ID: <3ca084a9-768e-a6f5-ace4-cd347978dec7@netscape.net>
Date: Fri, 20 May 2022 09:33:55 -0400
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
 <8b1ebea5-7820-69c4-2e2b-9866d55bc180@netscape.net>
 <c5fa3c3f-e602-ed68-d670-d59b93c012a0@netscape.net>
 <3bff3562-bb1e-04e6-6eca-8d9bc355f2eb@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <3bff3562-bb1e-04e6-6eca-8d9bc355f2eb@suse.com>
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

On 5/20/2022 5:41 AM, Jan Beulich wrote:
> On 20.05.2022 10:30, Chuck Zmudzinski wrote:
>> On 5/20/2022 2:59 AM, Chuck Zmudzinski wrote:
>>> On 5/20/2022 2:05 AM, Jan Beulich wrote:
>>>> On 20.05.2022 06:43, Chuck Zmudzinski wrote:
>>>>> On 5/4/22 5:14 AM, Juergen Gross wrote:
>>>>>> On 04.05.22 10:31, Jan Beulich wrote:
>>>>>>> On 03.05.2022 15:22, Juergen Gross wrote:
>>>>>>>
>>>>>>> ... these uses there are several more. You say nothing on why
>>>>>>> those want
>>>>>>> leaving unaltered. When preparing my earlier patch I did inspect them
>>>>>>> and came to the conclusion that these all would also better
>>>>>>> observe the
>>>>>>> adjusted behavior (or else I couldn't have left pat_enabled() as the
>>>>>>> only predicate). In fact, as said in the description of my earlier
>>>>>>> patch, in
>>>>>>> my debugging I did find the use in i915_gem_object_pin_map() to be
>>>>>>> the
>>>>>>> problematic one, which you leave alone.
>>>>>> Oh, I missed that one, sorry.
>>>>> That is why your patch would not fix my Haswell unless
>>>>> it also touches i915_gem_object_pin_map() in
>>>>> drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>>>>
>>>>>> I wanted to be rather defensive in my changes, but I agree at least
>>>>>> the
>>>>>> case in arch_phys_wc_add() might want to be changed, too.
>>>>> I think your approach needs to be more aggressive so it will fix
>>>>> all the known false negatives introduced by bdd8b6c98239
>>>>> such as the one in i915_gem_object_pin_map().
>>>>>
>>>>> I looked at Jan's approach and I think it would fix the issue
>>>>> with my Haswell as long as I don't use the nopat option. I
>>>>> really don't have a strong opinion on that question, but I
>>>>> think the nopat option as a Linux kernel option, as opposed
>>>>> to a hypervisor option, should only affect the kernel, and
>>>>> if the hypervisor provides the pat feature, then the kernel
>>>>> should not override that,
>>>> Hmm, why would the kernel not be allowed to override that? Such
>>>> an override would affect only the single domain where the
>>>> kernel runs; other domains could take their own decisions.
>>>>
>>>> Also, for the sake of completeness: "nopat" used when running on
>>>> bare metal has the same bad effect on system boot, so there
>>>> pretty clearly is an error cleanup issue in the i915 driver. But
>>>> that's orthogonal, and I expect the maintainers may not even care
>>>> (but tell us "don't do that then").
>> Actually I just did a test with the last official Debian kernel
>> build of Linux 5.16, that is, a kernel before bdd8b6c98239 was
>> applied. In fact, the nopat option does *not* break the i915 driver
>> in 5.16. That is, with the nopat option, the i915 driver loads
>> normally on both the bare metal and on the Xen hypervisor.
>> That means your presumption (and the presumption of
>> the author of bdd8b6c98239) that the "nopat" option was
>> being observed by the i915 driver is incorrect. Setting "nopat"
>> had no effect on my system with Linux 5.16. So after doing these
>> tests, I am against the aggressive approach of breaking the i915
>> driver with the "nopat" option because prior to bdd8b6c98239,
>> nopat did not break the i915 driver. Why break it now?
> Because that's, in my understanding, is the purpose of "nopat"
> (not breaking the driver of course - that's a driver bug -, but
> having an effect on the driver).

I wouldn't call it a driver bug, but an incorrect configuration of the
kernel by the user.  I presume X86_FEATURE_PAT is required by the
i915 driver and therefore the driver should refuse to disable
it if the user requests to disable it and instead warn the user that
the driver did not disable the feature, contrary to what the user
requested with the nopat option.

In any case, my test did not verify that when nopat is set in Linux 5.16,
the thread takes the same code path as when nopat is not set,
so I am not totally sure that the reason nopat does not break the
i915 driver in 5.16 is that static_cpu_has(X86_FEATURE_PAT)
returns true even when nopat is set. I could test it with a custom
log message in 5.16 if that is necessary.

Are you saying it was wrong for static_cpu_has(X86_FEATURE_PAT)
to return true in 5.16 when the user requests nopat? I think that is
just permitting a bad configuration to break the driver that a
well-written operating system should not allow. The i915 driver
was, in my opinion, correctly ignoring the nopat option in 5.16
because that option is not compatible with the hardware the
i915 driver is trying to initialize and setup at boot time. At least
that is my understanding now, but I will need to test it on 5.16
to be sure I understand it correctly.

Also, AFAICT, your patch would break the driver when the nopat
option is set and only fix the regression introduced by bdd8b6c98239
when nopat is not set on my box, so your patch would
introduce a regression relative to Linux 5.16 and earlier for the
case when nopat is set on my box. I think your point would
be that it is not a regression if it is an incorrect user configuration.
I respond by saying a well-written driver should refuse to honor
the incorrect configuration requested by the user and instead
warn the user that it did not honor the incorrect kernel option.

I am only presuming what your patch would do on my box based
on what I learned about this problem from my debugging. I can
also test your patch on my box to verify that my understanding of
it is correct.

I also have not yet verified Juergen's patch will not fix it, but
I am almost certain it will not unless it is expanded so it also
touches i915_gem_object_pin_map() with the fix. I plan to test
his patch, but expanded so it touches that function also.

I also plan to test your patch with and without nopat and report the
results in the thread where you posted your patch. Hopefully
by tomorrow I will have the results.

Chuck
