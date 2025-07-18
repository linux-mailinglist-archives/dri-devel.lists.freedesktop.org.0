Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AB9B0A9E0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 19:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F7810EA2A;
	Fri, 18 Jul 2025 17:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="z43EccIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9773310EA2A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:57:19 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-235e389599fso22035ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752861439; x=1753466239;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQwq6XL4XMMDUVPyAAts9uHNc3Wh3Ah7TMpl+x8VXU4=;
 b=z43EccIG2lRK9j1LP1nZmdFBxXoPGUnzbBry4agKBKx10LQ+ni1bzFBVlagILBwbHs
 TMfvSDloojsr+jxI8YwNQMLuN1uP2mzAQ+dhPPQiZqhtOj81C7yFuXZIcNYKFF8ggxaU
 uk76sANW7Cq5xFjUWv1c4Z2osdeES8nyS44hu2R41ROLMZOhAtPjc6gX2SxUvpDd1xmS
 nr8nBEfKxiV2pPQ1doZRzGmYGsEz/9gU2YYvuXYihPfKS3mrlqzz6ECLiYSR1Shu6wHN
 cC1XAIBpbMBo2M09yonP0zhs1xTRIcS41UKIkK38EzdsAFdyU52qGmbhVBoCd9Y+irzo
 GxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752861439; x=1753466239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQwq6XL4XMMDUVPyAAts9uHNc3Wh3Ah7TMpl+x8VXU4=;
 b=KE9JT7yr98H+kb5DsmDJBhyE+a8HnQkAPU748maTJZ/AzZj0L8nu9caqDbvImyycpq
 Uk3Spt6uGIRpapsa2c2oGk1wYX6PfFKOnmeMlYuMi2vqY1dYb/xLnAufgKOWpL5wDn6X
 1Ifj4MP6OruXrV14ME7KsqJWlUYZNrEQ5zNUnqPpKycxiYkIahKkZzAIrWU1IO4vA3Eh
 Wh1HhbPKWwH5IZwd6ZL6N2ZCdfFjAnwrRRgh4B6FZgxgicslk5Q7gPQN4sfkSNNEqjlj
 f9vaJAQtiO8GGh7QZAKhEIC+F1WRF05uwfn7LO7SKCnWvNxFdry56NOiSDC2H4njOgAr
 jEag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIRjoCrC4QKzqBga7QD3M37Nbkx/EJC43qZ2WYdlYRMF7qvoTFDuPMn2MA0lmIxcOsdtE9nsd93BE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/vn6js9g/yKffV4JfmEn6BYiZ16pz2QVZIdHWab2lcbywycr7
 6+ipCQo60WB/wZYNcz5qpn+7F/wRQeIKZUpznEMlroio5uN1kJtDgv2DMfNYP40u0ILaqz/dXoD
 45N87SrVS85gDKH6jCRlQfk/9nPmpTgQxojhf6m8g
X-Gm-Gg: ASbGncvJLj3XZjkKevKzCTXwSxO8Ho7pBFtt97eqkHMjVfQcLmZ0KFRqU88QUQa4n8K
 QqkBUn0E/r6FDCY+Sz7vhH9HQFV6eF5KmPIy++0Xia5o+JWY8Je6f6Z0o0y3f92r1ZMmDs7OQg6
 GpLHlPiHTdcWCWjp33RvlcDLbuLSYBKl5JDAIOsQj/3y2DXnY3owQfOCy+aBXh5HjuxKfrLhsOl
 MinCA==
X-Google-Smtp-Source: AGHT+IFB7mRsL16wpHPWottVi1OKrwf75zBs0DCPDQD+QRajm4wHJjRQeKVuBUPTfJF/u36oAJXSpzv3mDvRuLFSvUg=
X-Received: by 2002:a17:902:e845:b0:231:d0ef:e8ff with SMTP id
 d9443c01a7336-23f71cf6272mr147495ad.8.1752861438668; Fri, 18 Jul 2025
 10:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
 <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
In-Reply-To: <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
From: Brian Geffon <bgeffon@google.com>
Date: Fri, 18 Jul 2025 13:56:42 -0400
X-Gm-Features: Ac12FXy1d35S96EobB812Shedx-VhbSYaFw_UhX7goQUz4ANBgmd9GU0nbH0gb8
Message-ID: <CADyq12x1f0VLjHKWEmfmis8oLncqSWxeTGs5wL0Xj2hua+onOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, 
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

On Thu, Jul 17, 2025 at 10:59=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Wed, Jul 16, 2025 at 8:13=E2=80=AFPM Brian Geffon <bgeffon@google.com>=
 wrote:
> >
> > On Wed, Jul 16, 2025 at 5:03=E2=80=AFPM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> > >
> > > On Wed, Jul 16, 2025 at 12:40=E2=80=AFPM Brian Geffon <bgeffon@google=
.com> wrote:
> > > >
> > > > On Wed, Jul 16, 2025 at 12:33=E2=80=AFPM Alex Deucher <alexdeucher@=
gmail.com> wrote:
> > > > >
> > > > > On Wed, Jul 16, 2025 at 12:18=E2=80=AFPM Brian Geffon <bgeffon@go=
ogle.com> wrote:
> > > > > >
> > > > > > Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more fle=
xible (v2)")
> > > > > > allowed for newer ASICs to mix GTT and VRAM, this change also n=
oted that
> > > > > > some older boards, such as Stoney and Carrizo do not support th=
is.
> > > > > > It appears that at least one additional ASIC does not support t=
his which
> > > > > > is Raven.
> > > > > >
> > > > > > We observed this issue when migrating a device from a 5.4 to 6.=
6 kernel
> > > > > > and have confirmed that Raven also needs to be excluded from mi=
xing GTT
> > > > > > and VRAM.
> > > > >
> > > > > Can you elaborate a bit on what the problem is?  For carrizo and
> > > > > stoney this is a hardware limitation (all display buffers need to=
 be
> > > > > in GTT or VRAM, but not both).  Raven and newer don't have this
> > > > > limitation and we tested raven pretty extensively at the time.
> > > >
> > > > Thanks for taking the time to look. We have automated testing and a
> > > > few igt gpu tools tests failed and after debugging we found that
> > > > commit 81d0bcf99009 is what introduced the failures on this hardwar=
e
> > > > on 6.1+ kernels. The specific tests that fail are kms_async_flips a=
nd
> > > > kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
> > > > VRAM buffers resolves the issue.
> > >
> > > + Harry and Leo
> > >
> > > This sounds like the memory placement issue we discussed last week.
> > > In that case, the issue is related to where the buffer ends up when w=
e
> > > try to do an async flip.  In that case, we can't do an async flip
> > > without a full modeset if the buffers locations are different than th=
e
> > > last modeset because we need to update more than just the buffer base
> > > addresses.  This change works around that limitation by always forcin=
g
> > > display buffers into VRAM or GTT.  Adding raven to this case may fix
> > > those tests but will make the overall experience worse because we'll
> > > end up effectively not being able to not fully utilize both gtt and
> > > vram for display which would reintroduce all of the problems fixed by
> > > 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)").
> >
> > Thanks Alex, the thing is, we only observe this on Raven boards, why
> > would Raven only be impacted by this? It would seem that all devices
> > would have this issue, no? Also, I'm not familiar with how
>
> It depends on memory pressure and available memory in each pool.
> E.g., initially the display buffer is in VRAM when the initial mode
> set happens.  The watermarks, etc. are set for that scenario.  One of
> the next frames ends up in a pool different than the original.  Now
> the buffer is in GTT.  The async flip interface does a fast validation
> to try and flip as soon as possible, but that validation fails because
> the watermarks need to be updated which requires a full modeset.
>
> It's tricky to fix because you don't want to use the worst case
> watermarks all the time because that will limit the number available
> display options and you don't want to force everything to a particular
> memory pool because that will limit the amount of memory that can be
> used for display (which is what the patch in question fixed).  Ideally
> the caller would do a test commit before the page flip to determine
> whether or not it would succeed before issuing it and then we'd have
> some feedback mechanism to tell the caller that the commit would fail
> due to buffer placement so it would do a full modeset instead.  We
> discussed this feedback mechanism last week at the display hackfest.
>
>
> > kms_plane_alpha_blend works, but does this also support that test
> > failing as the cause?
>
> That may be related.  I'm not too familiar with that test either, but
> Leo or Harry can provide some guidance.
>
> Alex

Thanks everyone for the input so far. I have a question for the
maintainers, given that it seems that this is functionally broken for
ASICs which are iGPUs, and there does not seem to be an easy fix, does
it make sense to extend this proposed patch to all iGPUs until a more
permanent fix can be identified? At the end of the day I'll take
functional correctness over performance.

Brian

>
> >
> > Thanks again,
> > Brian
> >
> > >
> > > Alex
> > >
> > > >
> > > > Brian
> > > >
> > > > >
> > > > >
> > > > > Alex
> > > > >
> > > > > >
> > > > > > Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more fle=
xible (v2)")
> > > > > > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > Cc: stable@vger.kernel.org # 6.1+
> > > > > > Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > > > > > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drive=
rs/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > > > index 73403744331a..5d7f13e25b7c 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > > > @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(s=
truct amdgpu_device *adev,
> > > > > >                                             uint32_t domain)
> > > > > >  {
> > > > > >         if ((domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM=
_DOMAIN_GTT)) &&
> > > > > > -           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->as=
ic_type =3D=3D CHIP_STONEY))) {
> > > > > > +           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->as=
ic_type =3D=3D CHIP_STONEY) ||
> > > > > > +            (adev->asic_type =3D=3D CHIP_RAVEN))) {
> > > > > >                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> > > > > >                 if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THR=
ESHOLD)
> > > > > >                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
> > > > > > --
> > > > > > 2.50.0.727.gbf7dc18ff4-goog
> > > > > >
