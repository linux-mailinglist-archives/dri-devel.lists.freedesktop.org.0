Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738FB07B57
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C27610E2CB;
	Wed, 16 Jul 2025 16:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nguGav4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F2A10E2CB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 16:40:52 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-237f18108d2so2855ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752684052; x=1753288852;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBVaXc10A4jRruPriSxBpOpyudYSZuIpQyGPNMCEI5A=;
 b=nguGav4JBPz6WDgk71CnAxPtkPPduFmHOD6Jvl5ciH0Tq/fxOuYeWOHz168H7CLcMq
 gQWFfr68H2xeuiF1D21lXl5RCW1JdhSv59cw7wMQ4PuVf47N0b1qZpVPcvSV+NSbfuDu
 0YBoRB6SV6Oc7uQMot/bJbHcAi51Ikiz0pUYZiWks6nhdlAdK7w+8zr+L5UWduz6oft3
 eWb3n1yfzCD+wA0NibmOVXkHN5mYc2kpslzTjRCda1ejfxzakUgGviwP/vUVAfzFNVIQ
 bjf6zncU3ZEtY8VnPSpGKgnFVBdDao+MmDH27Mb2aJ7ACihd4JR8Hepeu5re44MJ0B1K
 2Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752684052; x=1753288852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBVaXc10A4jRruPriSxBpOpyudYSZuIpQyGPNMCEI5A=;
 b=j7uSZsNh+66Vi6kF8IldpRLxEfiubFPQeBdRjYihGd8QOaxuxZ2gWJHq0Uk6eSeHGa
 3Or+FELHaVMZKJ0Ng8Cb/3IFbc33IX4S1+lF0cxKCAO+ytW8WuPwQRzsTATysmxpBBtV
 YWM0ThLt9N2srs4u9Iq0nERtt/g+YRIgKRXmZHoz0qicLxadiLEyiMMweZ6nDFjJSVPG
 kZUSOf/j8ZRB0hlZLzhkJchACt0IYiPHipiqOQoWbJYzcxgHG5i+i3uNIDw+FYxRp+Gi
 zWYO6+Yd3ghmfCxXoZskkG/iDKiCuOUC/nVExnhJsBoYFx9tir///HSMmW7rjpiCnMwB
 DaSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY090GqlVnM3XgFwsVLGFxzTzHh8AakNCUemKVVd+URsTReTwbQICGxBFwR54NYfMLeRSNOOaIx9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuJXHokSIMJ0HdLFb2lBoeMtmriIoiFT4TZV1mvXTkRpoxVnev
 SdwgY9acvmaCdyJeupWwHdZN9tZLAoGIBOiu7DvQvoTRFNrQfCKHhHJrGhR+l5QKfynhEC6IcGd
 KpJMXMlTCJmFFsJCEl1mJghpRY5rYVySGvZiDuIeg
X-Gm-Gg: ASbGnctgwyb1ZzwApXbePqg1TZ0fxPxIX2WPnkuPcbB/vaU89OCzDgaGCfPV9fVob3M
 u5CwwI4zpp1t6IYx/dZdW9Knut1vPK2AG7jtApStofIziqVe2B+QRGd/vxb/fVx4bp3qROjH4gC
 XCkUJkKY6ASs7liRDF5nLzM2qP3eLrc13duNJYX2TJDYgtMyP0kQrO35Ent0ESY7DOgq4aN/qB0
 GMXnEfGm2LzSAX9
X-Google-Smtp-Source: AGHT+IHYQT5VXdCLT8hxrmg+0yfaXwrBL7UyuNaYscaOfd+9wb7KNDQaQqvXeihVJ+Iuuagh7P0Alzo8AVqhcyLotSs=
X-Received: by 2002:a17:902:e5c2:b0:235:f298:cbbb with SMTP id
 d9443c01a7336-23e2644036cmr3043915ad.26.1752684051728; Wed, 16 Jul 2025
 09:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
In-Reply-To: <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
From: Brian Geffon <bgeffon@google.com>
Date: Wed, 16 Jul 2025 12:40:15 -0400
X-Gm-Features: Ac12FXyULN47EIoDp4OeB3JlE-FJDnHi4sIL1ptSRWoQg8L9yjUdgo_BV4vPoWI
Message-ID: <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Alex Deucher <alexdeucher@gmail.com>
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

On Wed, Jul 16, 2025 at 12:33=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Wed, Jul 16, 2025 at 12:18=E2=80=AFPM Brian Geffon <bgeffon@google.com=
> wrote:
> >
> > Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v=
2)")
> > allowed for newer ASICs to mix GTT and VRAM, this change also noted tha=
t
> > some older boards, such as Stoney and Carrizo do not support this.
> > It appears that at least one additional ASIC does not support this whic=
h
> > is Raven.
> >
> > We observed this issue when migrating a device from a 5.4 to 6.6 kernel
> > and have confirmed that Raven also needs to be excluded from mixing GTT
> > and VRAM.
>
> Can you elaborate a bit on what the problem is?  For carrizo and
> stoney this is a hardware limitation (all display buffers need to be
> in GTT or VRAM, but not both).  Raven and newer don't have this
> limitation and we tested raven pretty extensively at the time.

Thanks for taking the time to look. We have automated testing and a
few igt gpu tools tests failed and after debugging we found that
commit 81d0bcf99009 is what introduced the failures on this hardware
on 6.1+ kernels. The specific tests that fail are kms_async_flips and
kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
VRAM buffers resolves the issue.

Brian

>
>
> Alex
>
> >
> > Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v=
2)")
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: stable@vger.kernel.org # 6.1+
> > Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_object.c
> > index 73403744331a..5d7f13e25b7c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(struct am=
dgpu_device *adev,
> >                                             uint32_t domain)
> >  {
> >         if ((domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_=
GTT)) &&
> > -           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_type =
=3D=3D CHIP_STONEY))) {
> > +           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_type =
=3D=3D CHIP_STONEY) ||
> > +            (adev->asic_type =3D=3D CHIP_RAVEN))) {
> >                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> >                 if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THRESHOLD)
> >                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
> > --
> > 2.50.0.727.gbf7dc18ff4-goog
> >
