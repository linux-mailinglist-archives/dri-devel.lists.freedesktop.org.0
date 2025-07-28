Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6415B14075
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 18:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72E510E540;
	Mon, 28 Jul 2025 16:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F4fYA13I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCDE10E53D;
 Mon, 28 Jul 2025 16:39:00 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-31ec977d203so224871a91.0; 
 Mon, 28 Jul 2025 09:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753720740; x=1754325540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sOICoi7S+RmHvt1B5Vpu4zl7Gq/1pJQJd2IAfflrwDs=;
 b=F4fYA13IPCfrqhrUtlnRtnfzY4jhGHUYwqUX9Dr+hF4QI9+CpBgVoHZsou2v2Y3DiJ
 YjpnVo58Wajtc5Cybz3MJFcnoC57VD8/HcGfls/6WuEyJ4a+YS6T2/EDslISCEwLQPAg
 DG9m4wOJStp/b5ChGQFPMelXH37xTOKz31DfXvsjDkflY2x8RnCickumdybt2YGqNqYk
 WI/AmAE/0iqcFN8JKdd1CaNHkFPT24HsjkpjNgWKIhbtLUIa5LQq8NZwQLJwhImRmzPj
 WRHNdScbsWOYpgPQNd3wbvM0AH1V9ozXrJktmL9Or10whlxic+kzCqpCyhR99Nsfh4S9
 UuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753720740; x=1754325540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sOICoi7S+RmHvt1B5Vpu4zl7Gq/1pJQJd2IAfflrwDs=;
 b=efux2aF6dqOh+cABz70rJVmJSe3UuJT2DnpcMP/dxSNaw4sHmyJczqCHn1bpm8+t6d
 kHNrUY4soAl85Dtd8WWm3MFv8N9pkuxYpktsHNr5I9n8QCe65JGZLDP6fYP21KBvN3n9
 sBn7AagZUc1gQalIFkvSk8miFVMiFIei5Eoc2bWntjfMXG8pRAD+vou5bwqFy+MNvbwz
 vvfw7cA5n5bx4cqsSnRELxy1hFrSuZ7QpW258C+6a/j2BOBo3POzDI1K3nCXpyi1ZdQv
 LQqgmkcFIcXD5am77McsK913qjHQKovbY0NJ34OUF609BbXs0ToHktyG5Hcf7AugJS5c
 phQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr5VwxOA4y9sA222nK5N02L7rMeBsk3mcAWovQRdY895T1YG+3xZiE2Y3C9ukMDa62cEd4AOJt@lists.freedesktop.org,
 AJvYcCVIm+SDLBZs7CbhgsrIbqVSejO1n5+vmwlR0G4us8JhFY6ZMKuwAXFU5j8BoigOxFXzap2QNpR8wwx8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPbY8cHir7/gj62LFwjliAHa9nqqSbKuPjTq5hNEdSigBTmoZb
 RP+guxWhlxW7TIdyqniFzf0+6xAgh9JJcnDzeuzxGMSpsw+mk9Rkl2nbo7RhtkP6sUDXua9ESBa
 XLTFKp1XEwNrcN/7j8ohfJUHWiRCSEZz3Rw==
X-Gm-Gg: ASbGncv/xKNKd+PgH/1oRHf7euBFu7fHut0ocZZGlCo5WxpCkFDxluSlvZZAey62Ymk
 GRN2g4fByRPE7Gal2DOdtV3C5LidhF4wmzrQn30IH76VjeLBf5jv+5SeVZS1Xp/BK7m+u2pES6G
 9tdOD3liLoe2hFXxbGL7Y8TiPP1GLbLOQ/PKd79OefqfZjUXSDB27WUcwebqVocqL+2Ee3bEjLk
 grawlva
X-Google-Smtp-Source: AGHT+IFbnEkN4r3gcvVFaLSYUoforWTVYyBqtZ6tLhVbntqm/AKTQSG30IfM1xqlQPfTbgq6WbOAAGMKFKeeHf2XP9w=
X-Received: by 2002:a17:90b:33cd:b0:31e:e880:8b83 with SMTP id
 98e67ed59e1d1-31ee88093a3mr2500943a91.3.1753720739931; Mon, 28 Jul 2025
 09:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
 <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
 <CADyq12x1f0VLjHKWEmfmis8oLncqSWxeTGs5wL0Xj2hua+onOQ@mail.gmail.com>
 <CADnq5_OhHpZDmV5J_5kA+avOdLrexnoRVCCCRddLQ=PPVAJsPQ@mail.gmail.com>
 <46bdb101-11c6-46d4-8224-b17d1d356504@amd.com>
 <CADnq5_PwyUwqdv1QG_O2XgvNnax+FNskuppBaKx8d0Kp582wXg@mail.gmail.com>
 <eff0ef03-d054-487e-b3bf-96bf394a3bf5@amd.com>
 <CADnq5_NvPsxmm8j0URD_B8a5gg9NQNX8VY0d93AqUDis46cdXA@mail.gmail.com>
 <aH90O93xJhD8PXWL@quatroqueijos.cascardo.eti.br>
 <c4f9dbe8-d224-478f-a91f-03a420333fde@amd.com>
In-Reply-To: <c4f9dbe8-d224-478f-a91f-03a420333fde@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Jul 2025 12:38:48 -0400
X-Gm-Features: Ac12FXyFwFc-78zoVaKBccykUvLP9mu9_gTtlG1-Z3x9hlWNNxrzXPYSW1CXW7k
Message-ID: <CADnq5_PFLuoe2fqn1YL984YPy2FU8SdJ0yWS5nmKFfsNwc324Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Leo Li <sunpeng.li@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Brian Geffon <bgeffon@google.com>, 
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 christian.koenig@amd.com, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Prike Liang <Prike.Liang@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Garrick Evans <garrick@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 22, 2025 at 9:54=E2=80=AFAM Leo Li <sunpeng.li@amd.com> wrote:
>
>
>
> On 2025-07-22 07:21, Thadeu Lima de Souza Cascardo wrote:
> > On Fri, Jul 18, 2025 at 07:00:39PM -0400, Alex Deucher wrote:
> >> On Fri, Jul 18, 2025 at 6:01=E2=80=AFPM Leo Li <sunpeng.li@amd.com> wr=
ote:
> >>>
> >>>
> >>>
> >>> On 2025-07-18 17:33, Alex Deucher wrote:
> >>>> On Fri, Jul 18, 2025 at 5:02=E2=80=AFPM Leo Li <sunpeng.li@amd.com> =
wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 2025-07-18 16:07, Alex Deucher wrote:
> >>>>>> On Fri, Jul 18, 2025 at 1:57=E2=80=AFPM Brian Geffon <bgeffon@goog=
le.com> wrote:
> >>>>>>>
> >>>>>>> On Thu, Jul 17, 2025 at 10:59=E2=80=AFAM Alex Deucher <alexdeuche=
r@gmail.com> wrote:
> >>>>>>>>
> >>>>>>>> On Wed, Jul 16, 2025 at 8:13=E2=80=AFPM Brian Geffon <bgeffon@go=
ogle.com> wrote:
> >>>>>>>>>
> >>>>>>>>> On Wed, Jul 16, 2025 at 5:03=E2=80=AFPM Alex Deucher <alexdeuch=
er@gmail.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On Wed, Jul 16, 2025 at 12:40=E2=80=AFPM Brian Geffon <bgeffon=
@google.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> On Wed, Jul 16, 2025 at 12:33=E2=80=AFPM Alex Deucher <alexde=
ucher@gmail.com> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>> On Wed, Jul 16, 2025 at 12:18=E2=80=AFPM Brian Geffon <bgeff=
on@google.com> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more=
 flexible (v2)")
> >>>>>>>>>>>>> allowed for newer ASICs to mix GTT and VRAM, this change al=
so noted that
> >>>>>>>>>>>>> some older boards, such as Stoney and Carrizo do not suppor=
t this.
> >>>>>>>>>>>>> It appears that at least one additional ASIC does not suppo=
rt this which
> >>>>>>>>>>>>> is Raven.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> We observed this issue when migrating a device from a 5.4 t=
o 6.6 kernel
> >>>>>>>>>>>>> and have confirmed that Raven also needs to be excluded fro=
m mixing GTT
> >>>>>>>>>>>>> and VRAM.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Can you elaborate a bit on what the problem is?  For carrizo=
 and
> >>>>>>>>>>>> stoney this is a hardware limitation (all display buffers ne=
ed to be
> >>>>>>>>>>>> in GTT or VRAM, but not both).  Raven and newer don't have t=
his
> >>>>>>>>>>>> limitation and we tested raven pretty extensively at the tim=
e.s
> >>>>>>>>>>>
> >>>>>>>>>>> Thanks for taking the time to look. We have automated testing=
 and a
> >>>>>>>>>>> few igt gpu tools tests failed and after debugging we found t=
hat
> >>>>>>>>>>> commit 81d0bcf99009 is what introduced the failures on this h=
ardware
> >>>>>>>>>>> on 6.1+ kernels. The specific tests that fail are kms_async_f=
lips and
> >>>>>>>>>>> kms_plane_alpha_blend, excluding Raven from this sharing of G=
TT and
> >>>>>>>>>>> VRAM buffers resolves the issue.
> >>>>>>>>>>
> >>>>>>>>>> + Harry and Leo
> >>>>>>>>>>
> >>>>>>>>>> This sounds like the memory placement issue we discussed last =
week.
> >>>>>>>>>> In that case, the issue is related to where the buffer ends up=
 when we
> >>>>>>>>>> try to do an async flip.  In that case, we can't do an async f=
lip
> >>>>>>>>>> without a full modeset if the buffers locations are different =
than the
> >>>>>>>>>> last modeset because we need to update more than just the buff=
er base
> >>>>>>>>>> addresses.  This change works around that limitation by always=
 forcing
> >>>>>>>>>> display buffers into VRAM or GTT.  Adding raven to this case m=
ay fix
> >>>>>>>>>> those tests but will make the overall experience worse because=
 we'll
> >>>>>>>>>> end up effectively not being able to not fully utilize both gt=
t and
> >>>>>>>>>> vram for display which would reintroduce all of the problems f=
ixed by
> >>>>>>>>>> 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible =
(v2)").
> >>>>>>>>>
> >>>>>>>>> Thanks Alex, the thing is, we only observe this on Raven boards=
, why
> >>>>>>>>> would Raven only be impacted by this? It would seem that all de=
vices
> >>>>>>>>> would have this issue, no? Also, I'm not familiar with how
> >>>>>>>>
> >>>>>>>> It depends on memory pressure and available memory in each pool.
> >>>>>>>> E.g., initially the display buffer is in VRAM when the initial m=
ode
> >>>>>>>> set happens.  The watermarks, etc. are set for that scenario.  O=
ne of
> >>>>>>>> the next frames ends up in a pool different than the original.  =
Now
> >>>>>>>> the buffer is in GTT.  The async flip interface does a fast vali=
dation
> >>>>>>>> to try and flip as soon as possible, but that validation fails b=
ecause
> >>>>>>>> the watermarks need to be updated which requires a full modeset.
> >>>>>
> >>>>> Huh, I'm not sure if this actually is an issue for APUs. The fix th=
at introduced
> >>>>> a check for same memory placement on async flips was on a system wi=
th a DGPU,
> >>>>> for which VRAM placement does matter:
> >>>>> https://github.com/torvalds/linux/commit/a7c0cad0dc060bb77e9c9d235d=
68441b0fc69507
> >>>>>
> >>>>> Looking around in DM/DML, for APUs, I don't see any logic that chan=
ges DCN
> >>>>> bandwidth validation depending on memory placement. There's a gpuvm=
_enable flag
> >>>>> for SG, but it's statically set to 1 on APU DCN versions. It sounds=
 like for
> >>>>> APUs specifically, we *should* be able to ignore the mem placement =
check. I can
> >>>>> spin up a patch to test this out.
> >>>>
> >>>> Is the gpu_vm_support flag ever set for dGPUs?  The allowed domains
> >>>> for display buffers are determined by
> >>>> amdgpu_display_supported_domains() and we only allow GTT as a domain
> >>>> if gpu_vm_support is set, which I think is just for APUs.  In that
> >>>> case, we could probably only need the checks specifically for
> >>>> CHIP_CARRIZO and CHIP_STONEY since IIRC, they don't support mixed VR=
AM
> >>>> and GTT (only one or the other?).  dGPUs and really old APUs will
> >>>> always get VRAM, and newer APUs will get VRAM | GTT.
> >>>
> >>> It doesn't look like gpu_vm_support is set for DGPUs
> >>> https://elixir.bootlin.com/linux/v6.15.6/source/drivers/gpu/drm/amd/d=
isplay/amdgpu_dm/amdgpu_dm.c#L1866
> >>>
> >>> Though interestingly, further up at #L1858, Raven has gpu_vm_support =
=3D 0. Maybe it had stability issues?
> >>> https://github.com/torvalds/linux/commit/098c13079c6fdd44f10586b69132=
c392ebf87450
> >>
> >> We need to be a little careful here asic_type =3D=3D CHIP_RAVEN covers
> >> several variants:
> >> apu_flags & AMD_APU_IS_RAVEN - raven1 (gpu_vm_support =3D false)
> >> apu_flags & AMD_APU_IS_RAVEN2 - raven2 (gpu_vm_support =3D true)
> >> apu_flags & AMD_APU_IS_PICASSO - picasso (gpu_vm_support =3D true)
> >>
> >> amdgpu_display_supported_domains() only sets AMDGPU_GEM_DOMAIN_GTT if
> >> gpu_vm_support is true.  so we'd never get into the check in
> >> amdgpu_bo_get_preferred_domain() for raven1.
> >>
> >> Anyway, back to your suggestion, I think we can probably drop the
> >> checks as you should always get a compatible memory buffer due to
> >> amdgpu_bo_get_preferred_domain(). Pinning should fail if we can't pin
> >> in the required domain.  amdgpu_display_supported_domains() will
> >> ensure you always get VRAM or GTT or VRAM | GTT depending on what the
> >> chip supports.  Then amdgpu_bo_get_preferred_domain() will either
> >> leave that as is, or force VRAM or GTT for the STONEY/CARRIZO case.
> >> On the off chance we do get incompatible memory, something like the
> >> attached patch should do the trick.
>
> Thanks for the patch, this makes sense to me.
>
> Somewhat unrelated: I wonder if setting AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS=
 is necessary before
> bo_pin(). FWIU from chatting with our DCN experts, DCN doesn't really car=
e if the fb is
> contiguous or not.

Is this a APU statement or dGPU statement?  At least on older dGPUs,
they required contiguous VRAM.  This may not be an issue on newer
chips with DCHUB. At the moment, we use the FB aperture to access VRAM
directly in the kernel driver, so we do not set up page tables for
VRAM.  We'd need to do that to support linear mappings of
non-contiguous VRAM buffers in the kernel driver.  We do support it on
some MI chips, so it's doable, but it adds overhead.

>
> Which begs the question -- what exactly does AMDGPU_GEM_CREATE_VRAM_CONTI=
GUOUS mean? From git
> history, it seems setting this flag doesn't necessarily move the bo to be=
 congiguous. But
> rather:
>
>     When we set AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS
>     - This means contiguous is not mandatory.
>     - we will try to allocate the contiguous buffer. Say if the
>       allocation fails, we fallback to allocate the individual pages.
>
> https://github.com/torvalds/linux/commit/e362b7c8f8c7af00d06f0ab609629101=
aebae993
>
> Does that mean -- if the buffer is already in the required domain -- that=
 bo_pin() will also
> attempt to make it contiguous? Or will it just pin it from being moved an=
d leave it at that?
>

It means that the VRAM backing for the buffer will be physically contiguous=
.

> I guess in any case, it sounds like VRAM_CONTIGUOUS is not necessary for =
DCN scanout.
> I can give dropping it a spin and see if IGT complains.

That won't work unless we change how we manage VRAM in vmid0.  Right
now we use the FB aperture to directly access it, if we wanted to use
non-contiguous pages, we'd need to use page tables for VRAM as well.

Alex


>
> Thanks,
> Leo
>
> >>
> >> Alex
> >>
> >
> > Thanks for the patch, Alex.
> >
> > I have tested it, and though kms_async_flips and kms_plane_alpha_blend
> > pass, kms_plane_cursor still fail.
> >
> > I am going to investigate a little more today and send more details fro=
m my
> > findings.
> >
> > Thanks.
> > Cascardo.
> >
> >>
> >>>
> >>> - Leo
> >>>
> >>>>
> >>>> Alex
> >>>>
> >>>>>
> >>>>> Thanks,
> >>>>> Leo
> >>>>>
> >>>>>>>>
> >>>>>>>> It's tricky to fix because you don't want to use the worst case
> >>>>>>>> watermarks all the time because that will limit the number avail=
able
> >>>>>>>> display options and you don't want to force everything to a part=
icular
> >>>>>>>> memory pool because that will limit the amount of memory that ca=
n be
> >>>>>>>> used for display (which is what the patch in question fixed).  I=
deally
> >>>>>>>> the caller would do a test commit before the page flip to determ=
ine
> >>>>>>>> whether or not it would succeed before issuing it and then we'd =
have
> >>>>>>>> some feedback mechanism to tell the caller that the commit would=
 fail
> >>>>>>>> due to buffer placement so it would do a full modeset instead.  =
We
> >>>>>>>> discussed this feedback mechanism last week at the display hackf=
est.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> kms_plane_alpha_blend works, but does this also support that te=
st
> >>>>>>>>> failing as the cause?
> >>>>>>>>
> >>>>>>>> That may be related.  I'm not too familiar with that test either=
, but
> >>>>>>>> Leo or Harry can provide some guidance.
> >>>>>>>>
> >>>>>>>> Alex
> >>>>>>>
> >>>>>>> Thanks everyone for the input so far. I have a question for the
> >>>>>>> maintainers, given that it seems that this is functionally broken=
 for
> >>>>>>> ASICs which are iGPUs, and there does not seem to be an easy fix,=
 does
> >>>>>>> it make sense to extend this proposed patch to all iGPUs until a =
more
> >>>>>>> permanent fix can be identified? At the end of the day I'll take
> >>>>>>> functional correctness over performance.
> >>>>>>
> >>>>>> It's not functional correctness, it's usability.  All that is
> >>>>>> potentially broken is async flips (which depend on memory pressure=
 and
> >>>>>> buffer placement), while if you effectively revert the patch, you =
end
> >>>>>> up  limiting all display buffers to either VRAM or GTT which may e=
nd
> >>>>>> up causing the inability to display anything because there is not
> >>>>>> enough memory in that pool for the next modeset.  We'll start gett=
ing
> >>>>>> bug reports about blank screens and failure to set modes because o=
f
> >>>>>> memory pressure.  I think if we want a short term fix, it would be=
 to
> >>>>>> always set the worst case watermarks.  The downside to that is tha=
t it
> >>>>>> would possibly cause some working display setups to stop working i=
f
> >>>>>> they were on the margins to begin with.
> >>>>>>
> >>>>>> Alex
> >>>>>>
> >>>>>>>
> >>>>>>> Brian
> >>>>>>>
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Thanks again,
> >>>>>>>>> Brian
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Alex
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Brian
> >>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Alex
> >>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more=
 flexible (v2)")
> >>>>>>>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>>>>>>>>>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>>>>>>>>>>> Cc: stable@vger.kernel.org # 6.1+
> >>>>>>>>>>>>> Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.c=
om>
> >>>>>>>>>>>>> Signed-off-by: Brian Geffon <bgeffon@google.com>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
> >>>>>>>>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/d=
rivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>>>>>>>>>>> index 73403744331a..5d7f13e25b7c 100644
> >>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>>>>>>>>>>> @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_doma=
in(struct amdgpu_device *adev,
> >>>>>>>>>>>>>                                             uint32_t domain=
)
> >>>>>>>>>>>>>  {
> >>>>>>>>>>>>>         if ((domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU=
_GEM_DOMAIN_GTT)) &&
> >>>>>>>>>>>>> -           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev=
->asic_type =3D=3D CHIP_STONEY))) {
> >>>>>>>>>>>>> +           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev=
->asic_type =3D=3D CHIP_STONEY) ||
> >>>>>>>>>>>>> +            (adev->asic_type =3D=3D CHIP_RAVEN))) {
> >>>>>>>>>>>>>                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> >>>>>>>>>>>>>                 if (adev->gmc.real_vram_size <=3D AMDGPU_SG=
_THRESHOLD)
> >>>>>>>>>>>>>                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
> >>>>>>>>>>>>> --
> >>>>>>>>>>>>> 2.50.0.727.gbf7dc18ff4-goog
> >>>>>>>>>>>>>
> >>>>>
> >>>
> >
> >> From cce1652c62c42c858de64c306ea0ddc7af3bd0b1 Mon Sep 17 00:00:00 2001
> >> From: Alex Deucher <alexander.deucher@amd.com>
> >> Date: Fri, 18 Jul 2025 18:40:26 -0400
> >> Subject: [PATCH] drm/amd/display: refine framebuffer placement checks
> >>
> >> When we commit planes, we need to make sure the
> >> framebuffer memory locations are compatible. Various
> >> hardware has the following requirements for display buffers:
> >> dGPUs, old APUs, raven1 - must be in VRAM
> >> cazziro/stoney - must be in VRAM or GTT, but not both
> >> newer APUs (raven2/picasso and newer) - can be in VRAM or GTT
> >>
> >> You should always get a compatible memory buffer due to
> >> amdgpu_bo_get_preferred_domain(). amdgpu_display_supported_domains()
> >> will ensure you always get VRAM or GTT or VRAM | GTT depending on
> >> what the chip supports.  Then amdgpu_bo_get_preferred_domain()
> >> will either leave that as is when pinning, or force VRAM or GTT
> >> for the STONEY/CARRIZO case.
> >>
> >> As such the checks could probably be removed, but on the off chance
> >> we do end up getting different memory pool for the old
> >> and new framebuffers, refine the check to take into account the
> >> hardware capabilities.
> >>
> >> Fixes: a7c0cad0dc06 ("drm/amd/display: ensure async flips are only acc=
epted for fast updates")
> >> Reported-by: Brian Geffon <bgeffon@google.com>
> >> Cc: Leo Li <sunpeng.li@amd.com>
> >> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >> ---
> >>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++++++++++--=
-
> >>  1 file changed, 17 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 129476b6d5fa9..de2bd789ec15b 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -9288,6 +9288,18 @@ static void amdgpu_dm_enable_self_refresh(struc=
t amdgpu_crtc *acrtc_attach,
> >>      }
> >>  }
> >>
> >> +static bool amdgpu_dm_mem_type_compatible(struct amdgpu_device *adev,
> >> +                                      struct drm_framebuffer *old_fb,
> >> +                                      struct drm_framebuffer *new_fb)
> >> +{
> >> +    if (!adev->mode_info.gpu_vm_support ||
> >> +        (adev->asic_type =3D=3D CHIP_CARRIZO) ||
> >> +        (adev->asic_type =3D=3D CHIP_STONEY))
> >> +            return get_mem_type(old_fb) =3D=3D get_mem_type(new_fb);
> >> +
> >> +    return true;
> >> +}
> >> +
> >>  static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
> >>                                  struct drm_device *dev,
> >>                                  struct amdgpu_display_manager *dm,
> >> @@ -9465,7 +9477,7 @@ static void amdgpu_dm_commit_planes(struct drm_a=
tomic_state *state,
> >>               */
> >>              if (crtc->state->async_flip &&
> >>                  (acrtc_state->update_type !=3D UPDATE_TYPE_FAST ||
> >> -                 get_mem_type(old_plane_state->fb) !=3D get_mem_type(=
fb)))
> >> +                 !amdgpu_dm_mem_type_compatible(dm->adev, old_plane_s=
tate->fb, fb)))
> >>                      drm_warn_once(state->dev,
> >>                                    "[PLANE:%d:%s] async flip with non-=
fast update\n",
> >>                                    plane->base.id, plane->name);
> >> @@ -9473,7 +9485,7 @@ static void amdgpu_dm_commit_planes(struct drm_a=
tomic_state *state,
> >>              bundle->flip_addrs[planes_count].flip_immediate =3D
> >>                      crtc->state->async_flip &&
> >>                      acrtc_state->update_type =3D=3D UPDATE_TYPE_FAST =
&&
> >> -                    get_mem_type(old_plane_state->fb) =3D=3D get_mem_=
type(fb);
> >> +                    amdgpu_dm_mem_type_compatible(dm->adev, old_plane=
_state->fb, fb);
> >>
> >>              timestamp_ns =3D ktime_get_ns();
> >>              bundle->flip_addrs[planes_count].flip_timestamp_in_us =3D=
 div_u64(timestamp_ns, 1000);
> >> @@ -11760,6 +11772,7 @@ static bool amdgpu_dm_crtc_mem_type_changed(st=
ruct drm_device *dev,
> >>                                          struct drm_atomic_state *stat=
e,
> >>                                          struct drm_crtc_state *crtc_s=
tate)
> >>  {
> >> +    struct amdgpu_device *adev =3D drm_to_adev(dev);
> >>      struct drm_plane *plane;
> >>      struct drm_plane_state *new_plane_state, *old_plane_state;
> >>
> >> @@ -11773,7 +11786,8 @@ static bool amdgpu_dm_crtc_mem_type_changed(st=
ruct drm_device *dev,
> >>              }
> >>
> >>              if (old_plane_state->fb && new_plane_state->fb &&
> >> -                get_mem_type(old_plane_state->fb) !=3D get_mem_type(n=
ew_plane_state->fb))
> >> +                !amdgpu_dm_mem_type_compatible(adev, old_plane_state-=
>fb,
> >> +                                               new_plane_state->fb))
> >>                      return true;
> >>      }
> >>
> >> --
> >> 2.50.1
> >>
> >
>
>
