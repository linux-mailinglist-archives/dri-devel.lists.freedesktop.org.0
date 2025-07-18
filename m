Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A2B0AAF6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 22:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039C510EA3C;
	Fri, 18 Jul 2025 20:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H3cRL5hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDFE10EA3B;
 Fri, 18 Jul 2025 20:07:28 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b350c85cf4eso280036a12.1; 
 Fri, 18 Jul 2025 13:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752869247; x=1753474047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I9RhPn6bn+hJA06IZWwattr/+qu6k9jF9QGOYEXW45s=;
 b=H3cRL5hcl+8rrA58YkUlIeCQOzerMbSZ73enHLDYQOch80/7e6bOGJNxJta53I1eU9
 NmKgWscaSxBEat9n6LS387liWWY5Z7qcRAZi1W9veLCFv/2HISlqErGysomuI1Z8k7Wd
 2NTOuh/ZMEEJwmNHQTjZNyBHtTYMtN3ubC174IHEdg4Wc+SUXJnYZVpyX70sevCRts6e
 N9OxAkBQWTmj0zZMUosY3oOneAVna9jzIZUcgBdoCNlc0BOCBix/Oe4ur0lGIYPVdvct
 0hvLBTvYjZNPS0sItWDWSrFfTRFgS1+EwvvMdlPNlMVFm5HqnZoVlQ3P3CIsK5YeRH0G
 0DLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752869247; x=1753474047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9RhPn6bn+hJA06IZWwattr/+qu6k9jF9QGOYEXW45s=;
 b=kp2eqp1vKaZYtV7uxDVtRgydlV59LEn557nps56+/alXMfrFA8h035VD0o4m1xJqkB
 bqytyj6psvtyKX9JAs1t/iSFhpglc3YozN5WS2UO5IcXS5blTQJLRpAeL5/7utpFv4Ox
 47vCdhWRxHnTjhqemrATYEyJxejLbhxb+iETRvfNMmYHSXRw1MTrjzZskYFKsOTO8X2F
 jHzJIdjNs48g3QZMYfFlWdLIkaaqwYQ886RcKMSZPI4+d3sFfiKBxn74IkA+JpKY0QYq
 JT4A1NjIN21uVJENYrrKyeSCBh9b9PDzBGjcjX+6y6wRrBANimMBnyNfUMcuRjSzgHpu
 qGcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoIUold9H08a3FzfN9r7B/+vpS1vwgeWvzU2lr3buTKLiRUgDvQ+koGzcv16CncAEi7qwGSdiW@lists.freedesktop.org,
 AJvYcCVrFDqU6U0lrCzkp7yc0p81xUBM2cezv+CeOVsYBweayYHxD5rSkIVPdVyk1/4n2ZL44c2m2tF0iSqJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7WH4fnYncPd6Z9UjstNsuqoxrqH5DXcKSAypZfYFgL0YacIkO
 6Ve5KnQCl1uLpyh/24I8dMYNoJvti5IzLfMUwhWbPi9Dx8u14F3aHlfnTa1Atsj4yBaGbhJOzh1
 0dRO30Z+EGckJkivTxIQoFDoJZmXh3OY=
X-Gm-Gg: ASbGncupUqcCtQHaeklJLccc10LUkbBMlr0RSqDcCgD6/+vsbqFOewq4bj5tM5GE+Ni
 xmjj5dCKuzZlUrbVH3qVApCn9LX6J8yT4gqvlKTPTHloOG3r1vmI8a8sE1xhPVJi5oU3fprg/mk
 +UrARCO7beEe7ZjWO1DIjTE3/0zp/RR9NAIGaqdchwcADHNRWc5ocDi51D3cRA5Y21pnjWEPpZw
 atx6A9/
X-Google-Smtp-Source: AGHT+IEEIC7Ov8wCVOKS/R8qsm5tmfCXtvXWU4DJsxwH/1X3wLmGk+yjxCtQD3NZENjz6uOuesxywakCO3vaWoj9Bjc=
X-Received: by 2002:a17:90b:2ec7:b0:312:639:a06d with SMTP id
 98e67ed59e1d1-31c9e78ec64mr6626904a91.5.1752869247216; Fri, 18 Jul 2025
 13:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
 <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
 <CADyq12x1f0VLjHKWEmfmis8oLncqSWxeTGs5wL0Xj2hua+onOQ@mail.gmail.com>
In-Reply-To: <CADyq12x1f0VLjHKWEmfmis8oLncqSWxeTGs5wL0Xj2hua+onOQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jul 2025 16:07:15 -0400
X-Gm-Features: Ac12FXzpSsEJ7zuzpP255sChl3CDubYC6yiCREKgz9m-Uq3Jrl2YudKs6Zl1T3g
Message-ID: <CADnq5_OhHpZDmV5J_5kA+avOdLrexnoRVCCCRddLQ=PPVAJsPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Brian Geffon <bgeffon@google.com>
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

On Fri, Jul 18, 2025 at 1:57=E2=80=AFPM Brian Geffon <bgeffon@google.com> w=
rote:
>
> On Thu, Jul 17, 2025 at 10:59=E2=80=AFAM Alex Deucher <alexdeucher@gmail.=
com> wrote:
> >
> > On Wed, Jul 16, 2025 at 8:13=E2=80=AFPM Brian Geffon <bgeffon@google.co=
m> wrote:
> > >
> > > On Wed, Jul 16, 2025 at 5:03=E2=80=AFPM Alex Deucher <alexdeucher@gma=
il.com> wrote:
> > > >
> > > > On Wed, Jul 16, 2025 at 12:40=E2=80=AFPM Brian Geffon <bgeffon@goog=
le.com> wrote:
> > > > >
> > > > > On Wed, Jul 16, 2025 at 12:33=E2=80=AFPM Alex Deucher <alexdeuche=
r@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Jul 16, 2025 at 12:18=E2=80=AFPM Brian Geffon <bgeffon@=
google.com> wrote:
> > > > > > >
> > > > > > > Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more f=
lexible (v2)")
> > > > > > > allowed for newer ASICs to mix GTT and VRAM, this change also=
 noted that
> > > > > > > some older boards, such as Stoney and Carrizo do not support =
this.
> > > > > > > It appears that at least one additional ASIC does not support=
 this which
> > > > > > > is Raven.
> > > > > > >
> > > > > > > We observed this issue when migrating a device from a 5.4 to =
6.6 kernel
> > > > > > > and have confirmed that Raven also needs to be excluded from =
mixing GTT
> > > > > > > and VRAM.
> > > > > >
> > > > > > Can you elaborate a bit on what the problem is?  For carrizo an=
d
> > > > > > stoney this is a hardware limitation (all display buffers need =
to be
> > > > > > in GTT or VRAM, but not both).  Raven and newer don't have this
> > > > > > limitation and we tested raven pretty extensively at the time.
> > > > >
> > > > > Thanks for taking the time to look. We have automated testing and=
 a
> > > > > few igt gpu tools tests failed and after debugging we found that
> > > > > commit 81d0bcf99009 is what introduced the failures on this hardw=
are
> > > > > on 6.1+ kernels. The specific tests that fail are kms_async_flips=
 and
> > > > > kms_plane_alpha_blend, excluding Raven from this sharing of GTT a=
nd
> > > > > VRAM buffers resolves the issue.
> > > >
> > > > + Harry and Leo
> > > >
> > > > This sounds like the memory placement issue we discussed last week.
> > > > In that case, the issue is related to where the buffer ends up when=
 we
> > > > try to do an async flip.  In that case, we can't do an async flip
> > > > without a full modeset if the buffers locations are different than =
the
> > > > last modeset because we need to update more than just the buffer ba=
se
> > > > addresses.  This change works around that limitation by always forc=
ing
> > > > display buffers into VRAM or GTT.  Adding raven to this case may fi=
x
> > > > those tests but will make the overall experience worse because we'l=
l
> > > > end up effectively not being able to not fully utilize both gtt and
> > > > vram for display which would reintroduce all of the problems fixed =
by
> > > > 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)"=
).
> > >
> > > Thanks Alex, the thing is, we only observe this on Raven boards, why
> > > would Raven only be impacted by this? It would seem that all devices
> > > would have this issue, no? Also, I'm not familiar with how
> >
> > It depends on memory pressure and available memory in each pool.
> > E.g., initially the display buffer is in VRAM when the initial mode
> > set happens.  The watermarks, etc. are set for that scenario.  One of
> > the next frames ends up in a pool different than the original.  Now
> > the buffer is in GTT.  The async flip interface does a fast validation
> > to try and flip as soon as possible, but that validation fails because
> > the watermarks need to be updated which requires a full modeset.
> >
> > It's tricky to fix because you don't want to use the worst case
> > watermarks all the time because that will limit the number available
> > display options and you don't want to force everything to a particular
> > memory pool because that will limit the amount of memory that can be
> > used for display (which is what the patch in question fixed).  Ideally
> > the caller would do a test commit before the page flip to determine
> > whether or not it would succeed before issuing it and then we'd have
> > some feedback mechanism to tell the caller that the commit would fail
> > due to buffer placement so it would do a full modeset instead.  We
> > discussed this feedback mechanism last week at the display hackfest.
> >
> >
> > > kms_plane_alpha_blend works, but does this also support that test
> > > failing as the cause?
> >
> > That may be related.  I'm not too familiar with that test either, but
> > Leo or Harry can provide some guidance.
> >
> > Alex
>
> Thanks everyone for the input so far. I have a question for the
> maintainers, given that it seems that this is functionally broken for
> ASICs which are iGPUs, and there does not seem to be an easy fix, does
> it make sense to extend this proposed patch to all iGPUs until a more
> permanent fix can be identified? At the end of the day I'll take
> functional correctness over performance.

It's not functional correctness, it's usability.  All that is
potentially broken is async flips (which depend on memory pressure and
buffer placement), while if you effectively revert the patch, you end
up  limiting all display buffers to either VRAM or GTT which may end
up causing the inability to display anything because there is not
enough memory in that pool for the next modeset.  We'll start getting
bug reports about blank screens and failure to set modes because of
memory pressure.  I think if we want a short term fix, it would be to
always set the worst case watermarks.  The downside to that is that it
would possibly cause some working display setups to stop working if
they were on the margins to begin with.

Alex

>
> Brian
>
> >
> > >
> > > Thanks again,
> > > Brian
> > >
> > > >
> > > > Alex
> > > >
> > > > >
> > > > > Brian
> > > > >
> > > > > >
> > > > > >
> > > > > > Alex
> > > > > >
> > > > > > >
> > > > > > > Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more f=
lexible (v2)")
> > > > > > > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > Cc: stable@vger.kernel.org # 6.1+
> > > > > > > Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com=
>
> > > > > > > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
> > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/dri=
vers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > > > > index 73403744331a..5d7f13e25b7c 100644
> > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > > > > @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain=
(struct amdgpu_device *adev,
> > > > > > >                                             uint32_t domain)
> > > > > > >  {
> > > > > > >         if ((domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_G=
EM_DOMAIN_GTT)) &&
> > > > > > > -           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->=
asic_type =3D=3D CHIP_STONEY))) {
> > > > > > > +           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->=
asic_type =3D=3D CHIP_STONEY) ||
> > > > > > > +            (adev->asic_type =3D=3D CHIP_RAVEN))) {
> > > > > > >                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> > > > > > >                 if (adev->gmc.real_vram_size <=3D AMDGPU_SG_T=
HRESHOLD)
> > > > > > >                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
> > > > > > > --
> > > > > > > 2.50.0.727.gbf7dc18ff4-goog
> > > > > > >
