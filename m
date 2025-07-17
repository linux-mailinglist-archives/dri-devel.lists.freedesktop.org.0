Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DCB08152
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 02:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7914B10E3CF;
	Thu, 17 Jul 2025 00:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xIbBqHzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9365E10E3CF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 00:13:36 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-235e389599fso52305ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 17:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752711216; x=1753316016;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YxwcBRFZJ/IWYAmgYMBlaC5GLM/oN1cP6KDw+nUVd+c=;
 b=xIbBqHzsi1uXxvxG/oO2sTwoLXGpVqbmlFRjiI2eF94Dr75hEIzCz0rcm4gsyIW8Nc
 qHwYPHEtZI7hwJb5E6FOiFeVCMlXRq360maMzZeeBDZqGJmsklmuMGhJrinc/HMljK8b
 06L5U4s46XIcASvYwtEpsu3irdAi6c2dUgqNc5orrqeDZtWCAQPAj6N68X6wTxSOHCMQ
 sl35uxbu1FbiUbRLxbxYU8AP3eZsLRs5TzEUfLI+CUUSSduiyNXO7VZbpYbOB+Kk0eEQ
 aRjbVjWTw1fON+KxQfvvp62KYATqrJQJ9miH5dIbwnv1RBVGiI09rE0e9ukYbaykhLmw
 uvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752711216; x=1753316016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YxwcBRFZJ/IWYAmgYMBlaC5GLM/oN1cP6KDw+nUVd+c=;
 b=jj/Yoq85vgSrNho3d/XD1ZYUDIeoevAiX2Y/QJHo2aU0f4X9C9Hj8c1i2ZUxpsmxVa
 aL06bev1kgFztYNXucWh1LU/z9g/HOVuDNHkvEcyLg9s4ZArET+0WeTxNT5JZTVaEdXJ
 k6S10+SHwy70plN7lpnKYnN6jqV5Fmpuhs+p0D899fGvhp0v1qgP/AbYlGpeFWoociky
 LzLciccdXnvfH6xIHBWNf6teSJfbaK/BtCXfmrrElsA+sQdnVMPyKhGHie0QFFc7DC3L
 mGdtz2rcAWlh1OcxHxLNClAS9Q869i1zEYssoCp1iWGccEU301Ar0OBDrnh3OpF4ld1Z
 vkeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRGtbt+0laUO9Gor+t+1yvKdkfloj1GAFavmzYmsrf15/rTXpjrd8ynHsf0S6VcU72DM0tyCGFdfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH4zsUXGeaoJBV0ZTtKMvCNCsWn5h8+1rv/ySLXKCSIa/z5cI6
 GM0rB/yQdNdU97txOZMEBe8ndm2ODHyojAhKRrTmyPPLiJ+rMMrAticph8qwWu3eUrYUlDqDvfw
 AV+ZXMFFVjhR+TBg6SD2nWHq1FrOceq7lAoTCOV93
X-Gm-Gg: ASbGncuZyqGaG8LJ6ua/Hhk0Mk7a+2b+uImNytY9/uCR3zX6swwkJ3zSs8Xs4ICctEl
 laOw0hLMyq+IKFpEb9Yr3d+5DqPQB3jfkgVxo4yFUPNt6UGF0+wmsn81NwMWWPOamGWONk1bgDD
 DRQ4I0sNYEWdT3d1KzGrTywn/mFpM7yO3gwWmNIRwklXnN2iHiNZo6jXHf+kUh/v9v6Z0tNsjZj
 mTNgg==
X-Google-Smtp-Source: AGHT+IExZ6YQpVxQMTJs5x1bFUTqRcgLAU1GhDN/RUviVrMpTxpuEVJRR17jv0s7D2xBNTbduIancHz0YHYlnDWvA9k=
X-Received: by 2002:a17:902:f548:b0:231:d0ef:e8ff with SMTP id
 d9443c01a7336-23e2fda6d9fmr1332865ad.8.1752711215586; Wed, 16 Jul 2025
 17:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
In-Reply-To: <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
From: Brian Geffon <bgeffon@google.com>
Date: Wed, 16 Jul 2025 20:12:59 -0400
X-Gm-Features: Ac12FXw4FWxTyOpiBAh39vdC9AS1nFe7p6dT3CD8-f9rngBIdz8mZXayZeabz6s
Message-ID: <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
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

On Wed, Jul 16, 2025 at 5:03=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Wed, Jul 16, 2025 at 12:40=E2=80=AFPM Brian Geffon <bgeffon@google.com=
> wrote:
> >
> > On Wed, Jul 16, 2025 at 12:33=E2=80=AFPM Alex Deucher <alexdeucher@gmai=
l.com> wrote:
> > >
> > > On Wed, Jul 16, 2025 at 12:18=E2=80=AFPM Brian Geffon <bgeffon@google=
.com> wrote:
> > > >
> > > > Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexibl=
e (v2)")
> > > > allowed for newer ASICs to mix GTT and VRAM, this change also noted=
 that
> > > > some older boards, such as Stoney and Carrizo do not support this.
> > > > It appears that at least one additional ASIC does not support this =
which
> > > > is Raven.
> > > >
> > > > We observed this issue when migrating a device from a 5.4 to 6.6 ke=
rnel
> > > > and have confirmed that Raven also needs to be excluded from mixing=
 GTT
> > > > and VRAM.
> > >
> > > Can you elaborate a bit on what the problem is?  For carrizo and
> > > stoney this is a hardware limitation (all display buffers need to be
> > > in GTT or VRAM, but not both).  Raven and newer don't have this
> > > limitation and we tested raven pretty extensively at the time.
> >
> > Thanks for taking the time to look. We have automated testing and a
> > few igt gpu tools tests failed and after debugging we found that
> > commit 81d0bcf99009 is what introduced the failures on this hardware
> > on 6.1+ kernels. The specific tests that fail are kms_async_flips and
> > kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
> > VRAM buffers resolves the issue.
>
> + Harry and Leo
>
> This sounds like the memory placement issue we discussed last week.
> In that case, the issue is related to where the buffer ends up when we
> try to do an async flip.  In that case, we can't do an async flip
> without a full modeset if the buffers locations are different than the
> last modeset because we need to update more than just the buffer base
> addresses.  This change works around that limitation by always forcing
> display buffers into VRAM or GTT.  Adding raven to this case may fix
> those tests but will make the overall experience worse because we'll
> end up effectively not being able to not fully utilize both gtt and
> vram for display which would reintroduce all of the problems fixed by
> 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)").

Thanks Alex, the thing is, we only observe this on Raven boards, why
would Raven only be impacted by this? It would seem that all devices
would have this issue, no? Also, I'm not familiar with how
kms_plane_alpha_blend works, but does this also support that test
failing as the cause?

Thanks again,
Brian

>
> Alex
>
> >
> > Brian
> >
> > >
> > >
> > > Alex
> > >
> > > >
> > > > Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexibl=
e (v2)")
> > > > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: stable@vger.kernel.org # 6.1+
> > > > Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > > > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > > > ---
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_object.c
> > > > index 73403744331a..5d7f13e25b7c 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(struc=
t amdgpu_device *adev,
> > > >                                             uint32_t domain)
> > > >  {
> > > >         if ((domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOM=
AIN_GTT)) &&
> > > > -           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_t=
ype =3D=3D CHIP_STONEY))) {
> > > > +           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_t=
ype =3D=3D CHIP_STONEY) ||
> > > > +            (adev->asic_type =3D=3D CHIP_RAVEN))) {
> > > >                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> > > >                 if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THRESHO=
LD)
> > > >                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
> > > > --
> > > > 2.50.0.727.gbf7dc18ff4-goog
> > > >
