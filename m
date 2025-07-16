Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6BB07F3E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 23:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6CF10E68E;
	Wed, 16 Jul 2025 21:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OIxr9cIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A15C10E3D0;
 Wed, 16 Jul 2025 21:03:12 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-234eaea2e4eso280465ad.0; 
 Wed, 16 Jul 2025 14:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752699791; x=1753304591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6UIkM+5JfCoSV3Rr9tFp4Y8vvVmQFZv80ACh/YnQDA=;
 b=OIxr9cIkw5iWV9LUWYNC5PI3uXu3QXr8km9qDXwm91vczJeGs1B6LUEDBwI6f3OsLt
 iNn7CXWDuFgV/JemxgZon5begzyQ5qvzjiwxPmQxsOxta6ybDaxvBq+vgR5G6+iqvKjR
 pTF+vqYNXUnsvB/G1y+zMCoXU4NBx73wU+NDllNZ4p4MbvArprV9OifJ0SEYFHj52FNJ
 9wwR/796u7MqqiJhBv6tJYXWzrSZn5KN1DVZyQghwXzkisf/cZNNoosJ1dcntsyz2p/c
 fNRK/5i2q8YYX/PGJlsl5veWLaqOc8GJHEQu5JfCeg+yLsfula8RQG5WCTyh1RpFjwxM
 5VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752699791; x=1753304591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6UIkM+5JfCoSV3Rr9tFp4Y8vvVmQFZv80ACh/YnQDA=;
 b=a5ORAu8nAHYIvLSMWP5nU6WQ1CBGQDWKNfeikBU+leWyz1OtUddec1QAJT8eNZwKhA
 MU5BxPkoALnefAp/xYIqoD9rxoKEKIKM1acvq/1ZZGGm7N9XiC23Vtt7yB6Xj3drWrcB
 8ESnFbhLcUpCt9hKmDnk6lXTla3SWonQt9FuTrYOzfJV/zV9u1XqlCdUNlDOJLZujV6c
 LWZ3FyQVyC7NCa47XgvJjWWXYzoCHJOs3s94r05nGL4KnW7IzkCbiV3lzbrsEyftr4QU
 Ucv9OLDQHs2IkHC5N/XxyUPNipIZr9SkkEftggp1JJzxpLSgNb+62zV4uPinD2YNatME
 K6+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJH2C37O3aTgXoFYaiYDwI+ahZF3odJw38Za4lAwoBdaMVyfHitLfCuLDChVA2X8RFpkLvqp7ZeMnZ@lists.freedesktop.org,
 AJvYcCXM1HYaN4PwBT9YPRn2pBUdzKH8KiDn79aTfnr7TpR0Q76N4NoGgjyb/XV0timlV7wMsOAzUpx2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeuOVYTCpI2EwmRtF9w2C9oXHnzZFqIomBJe0gJiaRyOXu1TGd
 89HWSoXTYEcixYMEWAGQ3o0CtBBf8VU3DmXWeLTQqxmnojQDUwBSfzwDz1/DDj0a8g/a31msj9E
 LQF6VRDJ8H5ZaH7hcGaOWlW81ojEPx2s=
X-Gm-Gg: ASbGncvw5o8ijsQ53PQANlC6C2gIsgNd6FoJlWWbnGDjnLzd+9X2r72gM2i/3R8udY2
 JEfCRmdcJso6CXOfMujyCHFolQWzsPt1+afz+XWfRGZU/K2GbNLepODsxEze//5Zv+YAyfK8tbo
 SJp3MbfCZUcuzEvNZjbNo9jf2JpWn4WdoR67747R8jTebBWx7pwkMeuQ89D2hqgpY2fOs90lR24
 xRAT1D+
X-Google-Smtp-Source: AGHT+IHsghxRhO1E0ZijyAH2I0nUHRxro/f8IUv0wNQCuD6VDXxJySfi/1GlXQbFrEdYhyP2vJpz+Q//Pz6HZeGbkkc=
X-Received: by 2002:a17:902:e5c8:b0:234:a734:4abe with SMTP id
 d9443c01a7336-23e24ec7c0dmr27962075ad.1.1752699791287; Wed, 16 Jul 2025
 14:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
In-Reply-To: <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Jul 2025 17:02:59 -0400
X-Gm-Features: Ac12FXwLG4TN6wJTWjc81ebRG8OmwjrBMB7idQ0T2AQxzZyfSqA0dNIRVGujuQ8
Message-ID: <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Brian Geffon <bgeffon@google.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com, 
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

On Wed, Jul 16, 2025 at 12:40=E2=80=AFPM Brian Geffon <bgeffon@google.com> =
wrote:
>
> On Wed, Jul 16, 2025 at 12:33=E2=80=AFPM Alex Deucher <alexdeucher@gmail.=
com> wrote:
> >
> > On Wed, Jul 16, 2025 at 12:18=E2=80=AFPM Brian Geffon <bgeffon@google.c=
om> wrote:
> > >
> > > Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible =
(v2)")
> > > allowed for newer ASICs to mix GTT and VRAM, this change also noted t=
hat
> > > some older boards, such as Stoney and Carrizo do not support this.
> > > It appears that at least one additional ASIC does not support this wh=
ich
> > > is Raven.
> > >
> > > We observed this issue when migrating a device from a 5.4 to 6.6 kern=
el
> > > and have confirmed that Raven also needs to be excluded from mixing G=
TT
> > > and VRAM.
> >
> > Can you elaborate a bit on what the problem is?  For carrizo and
> > stoney this is a hardware limitation (all display buffers need to be
> > in GTT or VRAM, but not both).  Raven and newer don't have this
> > limitation and we tested raven pretty extensively at the time.
>
> Thanks for taking the time to look. We have automated testing and a
> few igt gpu tools tests failed and after debugging we found that
> commit 81d0bcf99009 is what introduced the failures on this hardware
> on 6.1+ kernels. The specific tests that fail are kms_async_flips and
> kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
> VRAM buffers resolves the issue.

+ Harry and Leo

This sounds like the memory placement issue we discussed last week.
In that case, the issue is related to where the buffer ends up when we
try to do an async flip.  In that case, we can't do an async flip
without a full modeset if the buffers locations are different than the
last modeset because we need to update more than just the buffer base
addresses.  This change works around that limitation by always forcing
display buffers into VRAM or GTT.  Adding raven to this case may fix
those tests but will make the overall experience worse because we'll
end up effectively not being able to not fully utilize both gtt and
vram for display which would reintroduce all of the problems fixed by
81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)").

Alex

>
> Brian
>
> >
> >
> > Alex
> >
> > >
> > > Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible =
(v2)")
> > > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: stable@vger.kernel.org # 6.1+
> > > Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_object.c
> > > index 73403744331a..5d7f13e25b7c 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(struct =
amdgpu_device *adev,
> > >                                             uint32_t domain)
> > >  {
> > >         if ((domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAI=
N_GTT)) &&
> > > -           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_typ=
e =3D=3D CHIP_STONEY))) {
> > > +           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_typ=
e =3D=3D CHIP_STONEY) ||
> > > +            (adev->asic_type =3D=3D CHIP_RAVEN))) {
> > >                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> > >                 if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THRESHOLD=
)
> > >                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
> > > --
> > > 2.50.0.727.gbf7dc18ff4-goog
> > >
