Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D164B0AB7B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 23:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7260610EA4A;
	Fri, 18 Jul 2025 21:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="llHK4VXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4210EA45;
 Fri, 18 Jul 2025 21:33:36 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-313862d48e7so335773a91.1; 
 Fri, 18 Jul 2025 14:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752874416; x=1753479216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yoIYDGKLLqrTTBTd5BbrrJCdf1AKBXPDRxeJuKHonXI=;
 b=llHK4VXJ0a9NjNnPNDZ8f0oo8x02mOGm1a2GYt7OrdEuvnRLHZPf48mDsnS2SB5sjv
 QRvAv2X5B2f5Wn5qjrziZEgaszZHglRDrVe9E2eg+jM37JuJW0qSTB7135DJZRJjbF80
 75i33wvCwmH7twnD6eUHq/cgF6WDA88PuOfbL/AQc5WtvCugpHeO5xIJ94Fz3dHxFdRM
 cWcTdQFo+z2jRVW2/I29yOPrcSWku16GZlSRzA0j/Hm5nBunRrMgEExWX8rENtMJenxs
 Y6HLbpntZwq0FqXU5QU7PiYPXr/+ZouEpLxUyuxUppSBDcPc4rTvQYCbh30iVTmvDxwO
 aoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752874416; x=1753479216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yoIYDGKLLqrTTBTd5BbrrJCdf1AKBXPDRxeJuKHonXI=;
 b=QDOUhgxwAkas2xTIdkQw5p+N4+zLxcGH4WwGvPdoeUAaPzbcQuekOOcJiTi7CnnRoS
 48af97Kb8SUy/p54taGDqdztOYe4XPVKxy/dCcVGIps5W2+lfyibWaO7g9yqtNqMVbY5
 B5I74rBVsQ3q7qamSLDPB2ElqEyNoc+FNcLF+F6OfPD4RtdjFKShobgc03oUUymuGv+L
 SdivgOdDC/Ox8meSAbvLAmtsmlA7dB2Muyi4O8ZwaJIC/hX90hNfQUBRJzZFwWGbmK9H
 2nqORzgeMGy+97HINCRAsk0/0TbioGi9Fmj2wGd817KMUMO10aPqS59nByo2M23NaBxs
 36oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKKKvoEeqXv2gKAK4WI8Rt6RiHeJeSVNWlxsTLfzcBeEt+NZ6/AB8RAlPZ7jNGogVXtkaS6IvHCYsC@lists.freedesktop.org,
 AJvYcCWLDCPq4lklkU5ZIUFCrR3hM8qvgQid0sB5VYX5j6sesDWqsI4Qhx35m1+qWYk92BONNgiSl3gY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxetTIda4YtpXgJHbG7GQaaq4gnzI00eT035AKIfXQXBe6yQyL4
 Joxj4SLnhx1G+2DYqOg3O80yKZnLHh1sIK3gKYrmQwRf5QLlzoVw5bcQMMJPHgc/qHB0r7k8DHt
 lkbeagIS4Wmk8r7vSXC+mrDokJW7CQ00=
X-Gm-Gg: ASbGncsilf/UxIO6CsSWCL4f1ewLjDUi/U63HNVMWlZBy913p2UvZp9aB+bE9RaEo40
 OxhNXO5MQQX4N5phGumlsoCkjAySC1muBLsQHIrbkfyXfakaPag6eltjSat7noqeax+u5l8WPau
 m46E+IMUnOKmm5m33U2viPkACvbTVzCU4ediXaEq4PJWN0/EMMSYu05/Oyn70cxkWPkHd4QmPiS
 T8p0Rtx
X-Google-Smtp-Source: AGHT+IHU2JSE89KSCWIpL1y/r6ms7fHsS3K0doT7RmW43FYab/R6yrVVLWjf/Od5m6rrisBKH/bQrIiioOQ6VMvs8zU=
X-Received: by 2002:a17:90b:562c:b0:312:25dd:1c8a with SMTP id
 98e67ed59e1d1-31c9e6e8348mr6900316a91.2.1752874415748; Fri, 18 Jul 2025
 14:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
 <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
 <CADyq12x1f0VLjHKWEmfmis8oLncqSWxeTGs5wL0Xj2hua+onOQ@mail.gmail.com>
 <CADnq5_OhHpZDmV5J_5kA+avOdLrexnoRVCCCRddLQ=PPVAJsPQ@mail.gmail.com>
 <46bdb101-11c6-46d4-8224-b17d1d356504@amd.com>
In-Reply-To: <46bdb101-11c6-46d4-8224-b17d1d356504@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jul 2025 17:33:23 -0400
X-Gm-Features: Ac12FXz-nxT-qipwHyJfrv-oShNo004MePvSSyOOpDWDZE0ppLe817Q9ewZxIsw
Message-ID: <CADnq5_PwyUwqdv1QG_O2XgvNnax+FNskuppBaKx8d0Kp582wXg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Leo Li <sunpeng.li@amd.com>
Cc: Brian Geffon <bgeffon@google.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Yunxiang Li <Yunxiang.Li@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Prike Liang <Prike.Liang@amd.com>, 
 Pratap Nirujogi <pratap.nirujogi@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Garrick Evans <garrick@google.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, stable@vger.kernel.org
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

On Fri, Jul 18, 2025 at 5:02=E2=80=AFPM Leo Li <sunpeng.li@amd.com> wrote:
>
>
>
> On 2025-07-18 16:07, Alex Deucher wrote:
> > On Fri, Jul 18, 2025 at 1:57=E2=80=AFPM Brian Geffon <bgeffon@google.co=
m> wrote:
> >>
> >> On Thu, Jul 17, 2025 at 10:59=E2=80=AFAM Alex Deucher <alexdeucher@gma=
il.com> wrote:
> >>>
> >>> On Wed, Jul 16, 2025 at 8:13=E2=80=AFPM Brian Geffon <bgeffon@google.=
com> wrote:
> >>>>
> >>>> On Wed, Jul 16, 2025 at 5:03=E2=80=AFPM Alex Deucher <alexdeucher@gm=
ail.com> wrote:
> >>>>>
> >>>>> On Wed, Jul 16, 2025 at 12:40=E2=80=AFPM Brian Geffon <bgeffon@goog=
le.com> wrote:
> >>>>>>
> >>>>>> On Wed, Jul 16, 2025 at 12:33=E2=80=AFPM Alex Deucher <alexdeucher=
@gmail.com> wrote:
> >>>>>>>
> >>>>>>> On Wed, Jul 16, 2025 at 12:18=E2=80=AFPM Brian Geffon <bgeffon@go=
ogle.com> wrote:
> >>>>>>>>
> >>>>>>>> Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flex=
ible (v2)")
> >>>>>>>> allowed for newer ASICs to mix GTT and VRAM, this change also no=
ted that
> >>>>>>>> some older boards, such as Stoney and Carrizo do not support thi=
s.
> >>>>>>>> It appears that at least one additional ASIC does not support th=
is which
> >>>>>>>> is Raven.
> >>>>>>>>
> >>>>>>>> We observed this issue when migrating a device from a 5.4 to 6.6=
 kernel
> >>>>>>>> and have confirmed that Raven also needs to be excluded from mix=
ing GTT
> >>>>>>>> and VRAM.
> >>>>>>>
> >>>>>>> Can you elaborate a bit on what the problem is?  For carrizo and
> >>>>>>> stoney this is a hardware limitation (all display buffers need to=
 be
> >>>>>>> in GTT or VRAM, but not both).  Raven and newer don't have this
> >>>>>>> limitation and we tested raven pretty extensively at the time.
> >>>>>>
> >>>>>> Thanks for taking the time to look. We have automated testing and =
a
> >>>>>> few igt gpu tools tests failed and after debugging we found that
> >>>>>> commit 81d0bcf99009 is what introduced the failures on this hardwa=
re
> >>>>>> on 6.1+ kernels. The specific tests that fail are kms_async_flips =
and
> >>>>>> kms_plane_alpha_blend, excluding Raven from this sharing of GTT an=
d
> >>>>>> VRAM buffers resolves the issue.
> >>>>>
> >>>>> + Harry and Leo
> >>>>>
> >>>>> This sounds like the memory placement issue we discussed last week.
> >>>>> In that case, the issue is related to where the buffer ends up when=
 we
> >>>>> try to do an async flip.  In that case, we can't do an async flip
> >>>>> without a full modeset if the buffers locations are different than =
the
> >>>>> last modeset because we need to update more than just the buffer ba=
se
> >>>>> addresses.  This change works around that limitation by always forc=
ing
> >>>>> display buffers into VRAM or GTT.  Adding raven to this case may fi=
x
> >>>>> those tests but will make the overall experience worse because we'l=
l
> >>>>> end up effectively not being able to not fully utilize both gtt and
> >>>>> vram for display which would reintroduce all of the problems fixed =
by
> >>>>> 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)"=
).
> >>>>
> >>>> Thanks Alex, the thing is, we only observe this on Raven boards, why
> >>>> would Raven only be impacted by this? It would seem that all devices
> >>>> would have this issue, no? Also, I'm not familiar with how
> >>>
> >>> It depends on memory pressure and available memory in each pool.
> >>> E.g., initially the display buffer is in VRAM when the initial mode
> >>> set happens.  The watermarks, etc. are set for that scenario.  One of
> >>> the next frames ends up in a pool different than the original.  Now
> >>> the buffer is in GTT.  The async flip interface does a fast validatio=
n
> >>> to try and flip as soon as possible, but that validation fails becaus=
e
> >>> the watermarks need to be updated which requires a full modeset.
>
> Huh, I'm not sure if this actually is an issue for APUs. The fix that int=
roduced
> a check for same memory placement on async flips was on a system with a D=
GPU,
> for which VRAM placement does matter:
> https://github.com/torvalds/linux/commit/a7c0cad0dc060bb77e9c9d235d68441b=
0fc69507
>
> Looking around in DM/DML, for APUs, I don't see any logic that changes DC=
N
> bandwidth validation depending on memory placement. There's a gpuvm_enabl=
e flag
> for SG, but it's statically set to 1 on APU DCN versions. It sounds like =
for
> APUs specifically, we *should* be able to ignore the mem placement check.=
 I can
> spin up a patch to test this out.

Is the gpu_vm_support flag ever set for dGPUs?  The allowed domains
for display buffers are determined by
amdgpu_display_supported_domains() and we only allow GTT as a domain
if gpu_vm_support is set, which I think is just for APUs.  In that
case, we could probably only need the checks specifically for
CHIP_CARRIZO and CHIP_STONEY since IIRC, they don't support mixed VRAM
and GTT (only one or the other?).  dGPUs and really old APUs will
always get VRAM, and newer APUs will get VRAM | GTT.

Alex

>
> Thanks,
> Leo
>
> >>>
> >>> It's tricky to fix because you don't want to use the worst case
> >>> watermarks all the time because that will limit the number available
> >>> display options and you don't want to force everything to a particula=
r
> >>> memory pool because that will limit the amount of memory that can be
> >>> used for display (which is what the patch in question fixed).  Ideall=
y
> >>> the caller would do a test commit before the page flip to determine
> >>> whether or not it would succeed before issuing it and then we'd have
> >>> some feedback mechanism to tell the caller that the commit would fail
> >>> due to buffer placement so it would do a full modeset instead.  We
> >>> discussed this feedback mechanism last week at the display hackfest.
> >>>
> >>>
> >>>> kms_plane_alpha_blend works, but does this also support that test
> >>>> failing as the cause?
> >>>
> >>> That may be related.  I'm not too familiar with that test either, but
> >>> Leo or Harry can provide some guidance.
> >>>
> >>> Alex
> >>
> >> Thanks everyone for the input so far. I have a question for the
> >> maintainers, given that it seems that this is functionally broken for
> >> ASICs which are iGPUs, and there does not seem to be an easy fix, does
> >> it make sense to extend this proposed patch to all iGPUs until a more
> >> permanent fix can be identified? At the end of the day I'll take
> >> functional correctness over performance.
> >
> > It's not functional correctness, it's usability.  All that is
> > potentially broken is async flips (which depend on memory pressure and
> > buffer placement), while if you effectively revert the patch, you end
> > up  limiting all display buffers to either VRAM or GTT which may end
> > up causing the inability to display anything because there is not
> > enough memory in that pool for the next modeset.  We'll start getting
> > bug reports about blank screens and failure to set modes because of
> > memory pressure.  I think if we want a short term fix, it would be to
> > always set the worst case watermarks.  The downside to that is that it
> > would possibly cause some working display setups to stop working if
> > they were on the margins to begin with.
> >
> > Alex
> >
> >>
> >> Brian
> >>
> >>>
> >>>>
> >>>> Thanks again,
> >>>> Brian
> >>>>
> >>>>>
> >>>>> Alex
> >>>>>
> >>>>>>
> >>>>>> Brian
> >>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> Alex
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flex=
ible (v2)")
> >>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>>>>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>>>>>> Cc: stable@vger.kernel.org # 6.1+
> >>>>>>>> Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> >>>>>>>> Signed-off-by: Brian Geffon <bgeffon@google.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
> >>>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/driver=
s/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>>>>>> index 73403744331a..5d7f13e25b7c 100644
> >>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>>>>>> @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(st=
ruct amdgpu_device *adev,
> >>>>>>>>                                             uint32_t domain)
> >>>>>>>>  {
> >>>>>>>>         if ((domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_=
DOMAIN_GTT)) &&
> >>>>>>>> -           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asi=
c_type =3D=3D CHIP_STONEY))) {
> >>>>>>>> +           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asi=
c_type =3D=3D CHIP_STONEY) ||
> >>>>>>>> +            (adev->asic_type =3D=3D CHIP_RAVEN))) {
> >>>>>>>>                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> >>>>>>>>                 if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THRE=
SHOLD)
> >>>>>>>>                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
> >>>>>>>> --
> >>>>>>>> 2.50.0.727.gbf7dc18ff4-goog
> >>>>>>>>
>
