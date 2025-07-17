Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03405B08FF4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686CA10E144;
	Thu, 17 Jul 2025 14:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rk0cE3/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9EB10E144;
 Thu, 17 Jul 2025 14:59:06 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b2700de85d0so57094a12.2; 
 Thu, 17 Jul 2025 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752764345; x=1753369145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ya0Pf7GBbiFI9yCYfAdyjgFg/XCTrL1Lup/5nSkjZ4=;
 b=Rk0cE3/4velB5AI95Y8a6IsnTA3LSkxdaeHYF/DC1wz+P66Dxd24EpyFerCABs46eY
 5szECa2lUnvbDySLVUOl8/B1o3fPkkMztr8iBbbmW75Z84xCjTuL8yzmJxNS0c0JDQCu
 BxbTHjWn0Lnq8vMTqJosNIk4ygGnIpx8PoEf/R0sjac6vgXIkYOU5tYd7j8o5s8v2nNr
 mUeU5HzkJMRFA9n9DJdV9+R9Z41JpaF4I8Wtev/1PJdHBn3WSMquCObpNT08lrJUrrgQ
 fPM4hfwkE6tyI98K9a+E8Y+vGjL266wMOJOsP7zcqY+nxTtCUUx3uNLQhknhv3rAGAXY
 Ti3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752764345; x=1753369145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ya0Pf7GBbiFI9yCYfAdyjgFg/XCTrL1Lup/5nSkjZ4=;
 b=X96Qgz73vR/TDx/3Zn2x12oUF8iCanBT4dC91NwMHVFqWCSOPhS9adC2uGFggBoXcj
 XaHB+wiU3KSkhclqb4keIqSuot02OV9mNCP4dAn4toxAuam+1yF9Oy9cjCdGouow2h9Y
 tY3jJP7h5oY7D/qozar216n92vVEXA4EEbBO+3V4MizyrCSA+lO+Qnx1w5QywE02AlLL
 WcmZVHTMq8JuFEPryc/b9u8Ldy4onf8b6zUgodytsmvf+YwtW1hpjWOeAmG3sQMz33cP
 V7L72ZBb6XHr8lW1+Cw5Rhmkq+CsrDFn1AYroVncSTtEdH/tIVzJ6u/or8l7UuF5/kB9
 Wzpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULyEI7Qt6WqM3lkuVxDXoQDgaDGdOgTaUl4fr3Z+XyLR8aqrtlYIPxxqy5DJCsSdn0k0wIhXna@lists.freedesktop.org,
 AJvYcCVQN0YroFqxmRQulJKAJaf7OrtxGeBkTxY4xLQE2PvmRoL2o1UoPDft9x9s7gmS6iefVso/LlWiTugf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTpG42ecXM48Skc5ZhAc2FczXlH+7NL3VLFvfR3LOBr5U6oJb7
 YrJmcNTCHGr8ovwDypQ8kTwRe09PipiKwK5/nOHjBsc1+6sSCwAj7s+KqGKPABQp2z5a37pYA4C
 ngeLTC57gMlczGPS4aU4j0/n7+DE5mwo=
X-Gm-Gg: ASbGncsX8rMObERfMnWgjz/uEl71yCIlCnLW7sg8CuUnoiXcsr65J9YR9NtYdHBsZUV
 OalcnETD8MxSik9akkT4a0kd+nLSae06Zq4yq3yk/3md1RTh0p2CTpWxW5gTePjg2nplNijk/+G
 IlpSRQv5iZzqDt71bnibOPMg58dkQ2XbzMaFu3L6zIvpeboSlsKsg0v2BodPAkAUDeArqdrxEBS
 tGRdmlO
X-Google-Smtp-Source: AGHT+IHHlq/nQ9G6EWKKiMZEs2wLT9KLcyNzfgfIaMgOnK9+QgUCsPjP/ogcxgDDwwAVqR5cbpqVFpHPsuJaCZ+oScY=
X-Received: by 2002:a17:90b:4b8b:b0:311:9c9a:58e2 with SMTP id
 98e67ed59e1d1-31c9e798695mr3931081a91.7.1752764345395; Thu, 17 Jul 2025
 07:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
In-Reply-To: <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Jul 2025 10:58:53 -0400
X-Gm-Features: Ac12FXzrKvidT2q85M3LPC-hr0sTqZC7FoEbjKXO6dUbumO7fgzZhruHSNnRlGI
Message-ID: <CADnq5_PnktmP+0Hw0T04VkrkKoF_TGz5HOzRd1UZq6XOE0Rm1g@mail.gmail.com>
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

On Wed, Jul 16, 2025 at 8:13=E2=80=AFPM Brian Geffon <bgeffon@google.com> w=
rote:
>
> On Wed, Jul 16, 2025 at 5:03=E2=80=AFPM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > On Wed, Jul 16, 2025 at 12:40=E2=80=AFPM Brian Geffon <bgeffon@google.c=
om> wrote:
> > >
> > > On Wed, Jul 16, 2025 at 12:33=E2=80=AFPM Alex Deucher <alexdeucher@gm=
ail.com> wrote:
> > > >
> > > > On Wed, Jul 16, 2025 at 12:18=E2=80=AFPM Brian Geffon <bgeffon@goog=
le.com> wrote:
> > > > >
> > > > > Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexi=
ble (v2)")
> > > > > allowed for newer ASICs to mix GTT and VRAM, this change also not=
ed that
> > > > > some older boards, such as Stoney and Carrizo do not support this=
.
> > > > > It appears that at least one additional ASIC does not support thi=
s which
> > > > > is Raven.
> > > > >
> > > > > We observed this issue when migrating a device from a 5.4 to 6.6 =
kernel
> > > > > and have confirmed that Raven also needs to be excluded from mixi=
ng GTT
> > > > > and VRAM.
> > > >
> > > > Can you elaborate a bit on what the problem is?  For carrizo and
> > > > stoney this is a hardware limitation (all display buffers need to b=
e
> > > > in GTT or VRAM, but not both).  Raven and newer don't have this
> > > > limitation and we tested raven pretty extensively at the time.
> > >
> > > Thanks for taking the time to look. We have automated testing and a
> > > few igt gpu tools tests failed and after debugging we found that
> > > commit 81d0bcf99009 is what introduced the failures on this hardware
> > > on 6.1+ kernels. The specific tests that fail are kms_async_flips and
> > > kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
> > > VRAM buffers resolves the issue.
> >
> > + Harry and Leo
> >
> > This sounds like the memory placement issue we discussed last week.
> > In that case, the issue is related to where the buffer ends up when we
> > try to do an async flip.  In that case, we can't do an async flip
> > without a full modeset if the buffers locations are different than the
> > last modeset because we need to update more than just the buffer base
> > addresses.  This change works around that limitation by always forcing
> > display buffers into VRAM or GTT.  Adding raven to this case may fix
> > those tests but will make the overall experience worse because we'll
> > end up effectively not being able to not fully utilize both gtt and
> > vram for display which would reintroduce all of the problems fixed by
> > 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)").
>
> Thanks Alex, the thing is, we only observe this on Raven boards, why
> would Raven only be impacted by this? It would seem that all devices
> would have this issue, no? Also, I'm not familiar with how

It depends on memory pressure and available memory in each pool.
E.g., initially the display buffer is in VRAM when the initial mode
set happens.  The watermarks, etc. are set for that scenario.  One of
the next frames ends up in a pool different than the original.  Now
the buffer is in GTT.  The async flip interface does a fast validation
to try and flip as soon as possible, but that validation fails because
the watermarks need to be updated which requires a full modeset.

It's tricky to fix because you don't want to use the worst case
watermarks all the time because that will limit the number available
display options and you don't want to force everything to a particular
memory pool because that will limit the amount of memory that can be
used for display (which is what the patch in question fixed).  Ideally
the caller would do a test commit before the page flip to determine
whether or not it would succeed before issuing it and then we'd have
some feedback mechanism to tell the caller that the commit would fail
due to buffer placement so it would do a full modeset instead.  We
discussed this feedback mechanism last week at the display hackfest.


> kms_plane_alpha_blend works, but does this also support that test
> failing as the cause?

That may be related.  I'm not too familiar with that test either, but
Leo or Harry can provide some guidance.

Alex

>
> Thanks again,
> Brian
>
> >
> > Alex
> >
> > >
> > > Brian
> > >
> > > >
> > > >
> > > > Alex
> > > >
> > > > >
> > > > > Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexi=
ble (v2)")
> > > > > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > Cc: stable@vger.kernel.org # 6.1+
> > > > > Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > > > > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > > > > ---
> > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > > index 73403744331a..5d7f13e25b7c 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > > > @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(str=
uct amdgpu_device *adev,
> > > > >                                             uint32_t domain)
> > > > >  {
> > > > >         if ((domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_D=
OMAIN_GTT)) &&
> > > > > -           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic=
_type =3D=3D CHIP_STONEY))) {
> > > > > +           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic=
_type =3D=3D CHIP_STONEY) ||
> > > > > +            (adev->asic_type =3D=3D CHIP_RAVEN))) {
> > > > >                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> > > > >                 if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THRES=
HOLD)
> > > > >                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
> > > > > --
> > > > > 2.50.0.727.gbf7dc18ff4-goog
> > > > >
