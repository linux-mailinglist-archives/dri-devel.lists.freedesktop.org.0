Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C778C072E4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FB810EAF4;
	Fri, 24 Oct 2025 16:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dpHpJbbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9487410EAD0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:08:20 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-33badfbd87aso463151a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761322100; x=1761926900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTQVK2aQT1vIN8ZpKJaaMrUDsELoEiIRjPfw0a3iVhI=;
 b=dpHpJbbsVlYN4gnZ0xETK5hPz92or6Cj53CydBpLPz4PBo5Ju3PnPwv+u00NLVClaj
 V2qnYEHQ6Kz5p5aXZ8BuqoB1cptpKZj4KvrLMffStCVqQjnXei/2sxQrkSkleTq3CkKl
 mcgSmaUoZo+C5LQ+hBs2XIp1BU0wNdjKZJjYFd1loTVNDbheEWLmubhpi+ShiW1TQjZb
 g3GrMnilaZo/N1CPP3UIh/PgFypXBZSShVP0xx7o4N9pSqt3gV9GzELyoSwycfucXg99
 zQ54S8ChQePiiLY0aHmDhQ79xX9dXtGxfIUxZinMYQ6aEc/o/dzTrtfcO6dThZ/LQ42Q
 e2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761322100; x=1761926900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bTQVK2aQT1vIN8ZpKJaaMrUDsELoEiIRjPfw0a3iVhI=;
 b=ibY5yrRn/Odp5Lamf+NgNJdIOGkwU6k9Yecd607Ho8UTT/MG6vhd/K+G/srMFwtlUT
 9GwCOIwSFZaPhl1YxDHHu2etbNfrKc80hTKXbeBRjqL0yghOp9Hj74c4kXGgZYrh/c5L
 JyAoGKyW/skSZqH5kq2YIAmtaKyT2qoBMnLZiOf/KLtKmefSKmQ3J05em9HexhP7ETmT
 c5z1aN8V6TXtVcYqj554dXcPJVzhrM+778Ib8C/NyViVh9YJ+JNgZ4iunkk4Yg3hbNrb
 c9czHWislU144Tqpe4yUjKIcdxxqRppJ+a44g8zNwPsoTYsmf8xRb+nsEEeZW73mxvC9
 CbCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgnT7XaOn+hVuWAaGdN5yWsdqgSa/ECcQBP2NDYnz4JKpY7RyND7cYbe9WeAPfr4uahVgrCWMd+n4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxknJHTkFhiZEj7e9oMdrdKQr157mvlVymB1ljtdzqGKF5bgUM3
 CkSewMuJo1NxDveMAoTtP3r08sxZdk69aIv8D1S4Wa789+eRGSXLlFknmuCGXmJDvUEDRIEWCWF
 A8JQiwIxaKdxkExrhobe97LKhqMBnGLM=
X-Gm-Gg: ASbGncvgHG89dZDCh98XS67yyrKZpLXR4K6WZ56YNFhdCHD+DKEMIyJeggvHl0bbtnx
 QVbbJDZsyR4aHuEr6LPLzqc0zgcF5ilsqlPC9Iok0NZWg11ka/ZcXXQ+MH+luXTNAUo+peheJxN
 HE8XIFRqyfHSuEMXJUG4DemHL61Ayh16riioIHDblPDCY2CLVwngG7DrvomNnXq0Rgfn9O/9bK1
 tWL0AU2HSC604Xty3iUuuxB8w0oZ+pFlaLqw5ezWXfhKh2mDk8Uc/5rBD7y
X-Google-Smtp-Source: AGHT+IHuKMHIzacDRQR5C0tlCqOGlXp+2mvpP1Rw2CFVttYDd7vViELLYU2FSf1zGiwr/4mecZiOM5Dzi7juFV5w05o=
X-Received: by 2002:a17:902:f787:b0:290:aaff:344e with SMTP id
 d9443c01a7336-292d3e447f2mr106851415ad.2.1761322099740; Fri, 24 Oct 2025
 09:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-4-lkml@antheas.dev>
 <61da9864-b7c8-43f1-b437-36756077b545@amd.com>
In-Reply-To: <61da9864-b7c8-43f1-b437-36756077b545@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 Oct 2025 12:08:07 -0400
X-Gm-Features: AS18NWDSc8rqEfOFx3bZ8_HjDIswouVHQNkmMydC8_vInVKkCJow-kZH_kpVpvU
Message-ID: <CADnq5_NPwwtrjYaELVvrC+D5vb4_iosCnghud8i9+NO0zC+_qA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/amdgpu: only send the SMU RLC notification on
 S3
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Perry Yuan <perry.yuan@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
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

On Fri, Oct 24, 2025 at 11:54=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> > From: Alex Deucher <alexander.deucher@amd.com>
> >
> > For S0ix, the RLC is not powered down. Rework the Van Gogh logic to
> > skip powering it down and skip part of post-init.
> >
> > Fixes: 8c4e9105b2a8 ("drm/amdgpu: optimize RLC powerdown notification o=
n Vangogh")
> > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
> >   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
> >   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
> >   3 files changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index 3d032c4e2dce..220b12d59795 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -5243,9 +5243,11 @@ int amdgpu_device_suspend(struct drm_device *dev=
, bool notify_clients)
> >       if (amdgpu_sriov_vf(adev))
> >               amdgpu_virt_release_full_gpu(adev, false);
> >
> > -     r =3D amdgpu_dpm_notify_rlc_state(adev, false);
> > -     if (r)
> > -             return r;
> > +     if (!adev->in_s0ix) {
> > +             r =3D amdgpu_dpm_notify_rlc_state(adev, false);
> > +             if (r)
> > +                     return r;
> > +     }
>
> Just FYI this is going to clash with my unwind failed suspend series [1].
>
> This is fine, just whichever "lands" first the other will need to rework
> a little bit and I wanted to mention it.
>
> Link:
> https://lore.kernel.org/amd-gfx/20251023165243.317153-2-mario.limonciello=
@amd.com/
> [1]
>
> This does have me wondering though why amdgpu_dpm_notify_rlc_state() is
> even in amdgpu_device_suspend()?  This is only used on Van Gogh.
> Should we be pushing this deeper into amdgpu_device_ip_suspend_phase2()?
>
> Or should we maybe overhaul this to move the RLC notification into a
> .set_mp1_state callback instead so it's more similar to all the other ASI=
Cs?
>

TBH, I don't think this is even required at all here.  The rlc is
stopped in smu_disable_dpms() and we already notify the SMU at that
point.  Notifying it again here seems superfluous.  Would need to test
that removing this one doesn't cause an issue with S3.

> >
> >       return 0;
> >   }
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/dr=
m/amd/pm/swsmu/amdgpu_smu.c
> > index fb8086859857..244b8c364d45 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > @@ -2040,6 +2040,12 @@ static int smu_disable_dpms(struct smu_context *=
smu)
> >           smu->is_apu && (amdgpu_in_reset(adev) || adev->in_s0ix))
> >               return 0;
> >
> > +     /* vangogh s0ix */
> > +     if ((amdgpu_ip_version(adev, MP1_HWIP, 0) =3D=3D IP_VERSION(11, 5=
, 0) ||
> > +          amdgpu_ip_version(adev, MP1_HWIP, 0) =3D=3D IP_VERSION(11, 5=
, 2)) &&
> > +         adev->in_s0ix)
> > +             return 0;
> > +
>
> How about for GPU reset, does PMFW handle this too?

I'm not 100% sure.  We need to check with the PMFW team.  I think
vangogh works the same as gfx11 and newer APUs since the s0i3
implementation was more aligned with those chips than RMB.  These
special code paths were added specifically for S3 enablement since the
behavior is different relative to S0ix.

Alex

>
> >       /*
> >        * For gpu reset, runpm and hibernation through BACO,
> >        * BACO feature has to be kept enabled.
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > index 2c9869feba61..0708d0f0938b 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > @@ -2217,6 +2217,9 @@ static int vangogh_post_smu_init(struct smu_conte=
xt *smu)
> >       uint32_t total_cu =3D adev->gfx.config.max_cu_per_sh *
> >               adev->gfx.config.max_sh_per_se * adev->gfx.config.max_sha=
der_engines;
> >
> > +     if (adev->in_s0ix)
> > +             return 0;
> > +
> >       /* allow message will be sent after enable message on Vangogh*/
> >       if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT) &=
&
> >                       (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
>
