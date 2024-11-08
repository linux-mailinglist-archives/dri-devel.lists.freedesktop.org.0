Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DC29C2038
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 16:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3041B10E9E6;
	Fri,  8 Nov 2024 15:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jH2np9/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D25210E138;
 Fri,  8 Nov 2024 15:18:25 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2e2a96b242cso273080a91.3; 
 Fri, 08 Nov 2024 07:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731079105; x=1731683905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ztSpKe+LQpulamyWGR10ZiG7OBgDMtt+SUrCLR6C3M=;
 b=jH2np9/bUKhe9ljA0n1c6W9tO6GymO2wm415nXdiZU5rjD5v3NZLmJQtR5EDt3lXT1
 ajN9ofwblA4lX/HXbZcsDfL6fjsDry0W5QdATJWeXrFP0oa3E6SxhK9a5TUBCO5LSBQq
 Ud9qG9d2BcBPUlQKGdDcjPdPVxn4wBdU+vsXjEs7mbtPUp2F8zeXM/u2L4mzkVftNop/
 2BxzQpX9flfRraA5ubUbc/BG6QFY8wKu25dopwYdmwiEpGIgKXEzDbbtDGbc8zTp0130
 UNekykczHUBamzQhHvwmwEwc8lJlG/Z9z757HoyHQELz3EfEx+uCxiBK7J78MXCFZBWg
 kjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731079105; x=1731683905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ztSpKe+LQpulamyWGR10ZiG7OBgDMtt+SUrCLR6C3M=;
 b=N0E219G65W9tUQv+V4dkIptBOmGzCpYgeKbIiFneBwHFj4G+H0/QeEtIMxfr04C/uc
 qC5mR+3MN/Whi0D78rQVputN1oGmarn47EODfm3zyxHPctRvIEYzYMRLpWZXdGBfNJK/
 stmNDI2h4QgznDkZACDzAawp7TIzskJeYwVxb9p/Ym8F4YYmAH4SU3agQRlICDI+a9Qj
 jR7SXDvQomvLG0o+C63wEoIT8HlMOzyt7zEUs0Diuo1J8a/Fzzr+0JTwurIp3RBc5WJp
 /lXFa3YpHBMPikHTYpZOuDulfO+W+PJR2hhPw5sC1QRN+1lOWH2nbaQ1b52k/G27u7W+
 bo5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZRJ7hkDZ5tMdEknqV5tqEB5hGSMbnC/PGcBOcq/FckbbF4/ZQ6eMwk72nQehTwbzvrTR57x8q@lists.freedesktop.org,
 AJvYcCXhrS+9zbDCw58bDbJqAlJ8x+se9FYB02VZp+7/LqcV5DUIYq/7teisEyBc5I4TOyKapRz8RqxzRqs+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydZnYvft+MWmgxItfhxXzflfLPhSG3Ngh8YMoWP7kZ0Ya0NJHc
 wG/TL26DTyLj4vNXQ1hJk/sD8XOkmegFP/ZcYQC8ux0eIcmbAgoIim4dCRq23gVxlElv14Ont0W
 +xkYprWe60XXwqyOvBSSIKiC0anA=
X-Google-Smtp-Source: AGHT+IGalmBCBFBbCttGfKwAgL2JZxgJjBfbYNdkcVmz7yTC0ji3IWfKbBqyZ438BnH4DIaQKzJ215ynoQNwBNhM0PI=
X-Received: by 2002:a17:90b:3b87:b0:2e9:4a0c:252f with SMTP id
 98e67ed59e1d1-2e9b167f7edmr1948422a91.1.1731079104080; Fri, 08 Nov 2024
 07:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20241008191623.8171-1-advaitdhamorikar@gmail.com>
 <CAJ7bep+uo5_xF13e_1mYFMf1npWw1cTbcOe+f19avpjEPfyBqQ@mail.gmail.com>
In-Reply-To: <CAJ7bep+uo5_xF13e_1mYFMf1npWw1cTbcOe+f19avpjEPfyBqQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Nov 2024 10:18:12 -0500
Message-ID: <CADnq5_OCL7x7-m5y1RYwmFxH7XVssX_FK_59UmEiAK9thtLMQw@mail.gmail.com>
Subject: Re: [PATCH-next v3] drm/amdgpu: Cleanup shift coding style
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com, 
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com, 
 sonny.jiang@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, anupnewsmail@gmail.com
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

Applied.  Thanks!  Sorry for the delay.

Alex

On Fri, Nov 8, 2024 at 10:11=E2=80=AFAM Advait Dhamorikar
<advaitdhamorikar@gmail.com> wrote:
>
> Hello,
>
> I have addressed the previous comments,
> Is there something more that I need to address in this version of the pat=
ch?
> I would appreciate feedback.
>
> Best regards,
> Advait
>
> On Wed, 9 Oct 2024 at 00:46, Advait Dhamorikar
> <advaitdhamorikar@gmail.com> wrote:
> >
> > Improves the coding style by updating bit-shift
> > operations in the amdgpu_jpeg.c driver file.
> > It ensures consistency and avoids potential issues
> > by explicitly using 1U and 1ULL for unsigned
> > and unsigned long long shifts in all relevant instances.
> >
> >
> > Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> > ---
> > v1->v2: address review comments
> > https://lore.kernel.org/lkml/CAJ7bepJrm9tJJMSZXz0B_94y8817X4oFpwnrTmUHe=
agOFgVL7g@mail.gmail.com/
> > v2->v3: update changelog and add additional 1U cleanups
> > https://lore.kernel.org/lkml/CADnq5_OgZvTgUDvDqDikoUh28jTRm2mOAVV6zAEtW=
E9RHTFkyA@mail.gmail.com/
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_jpeg.c
> > index 95e2796919fc..995bc28b4fe6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> > @@ -47,7 +47,7 @@ int amdgpu_jpeg_sw_init(struct amdgpu_device *adev)
> >                 adev->jpeg.indirect_sram =3D true;
> >
> >         for (i =3D 0; i < adev->jpeg.num_jpeg_inst; i++) {
> > -               if (adev->jpeg.harvest_config & (1 << i))
> > +               if (adev->jpeg.harvest_config & (1U << i))
> >                         continue;
> >
> >                 if (adev->jpeg.indirect_sram) {
> > @@ -73,7 +73,7 @@ int amdgpu_jpeg_sw_fini(struct amdgpu_device *adev)
> >         int i, j;
> >
> >         for (i =3D 0; i < adev->jpeg.num_jpeg_inst; ++i) {
> > -               if (adev->jpeg.harvest_config & (1 << i))
> > +               if (adev->jpeg.harvest_config & (1U << i))
> >                         continue;
> >
> >                 amdgpu_bo_free_kernel(
> > @@ -110,7 +110,7 @@ static void amdgpu_jpeg_idle_work_handler(struct wo=
rk_struct *work)
> >         unsigned int i, j;
> >
> >         for (i =3D 0; i < adev->jpeg.num_jpeg_inst; ++i) {
> > -               if (adev->jpeg.harvest_config & (1 << i))
> > +               if (adev->jpeg.harvest_config & (1U << i))
> >                         continue;
> >
> >                 for (j =3D 0; j < adev->jpeg.num_jpeg_rings; ++j)
> > @@ -357,7 +357,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void =
*data, u64 val)
> >         if (!adev)
> >                 return -ENODEV;
> >
> > -       mask =3D (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_=
rings)) - 1;
> > +       mask =3D (1ULL << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jp=
eg_rings)) - 1;
> >         if ((val & mask) =3D=3D 0)
> >                 return -EINVAL;
> >
> > @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void =
*data, u64 *val)
> >                 for (j =3D 0; j < adev->jpeg.num_jpeg_rings; ++j) {
> >                         ring =3D &adev->jpeg.inst[i].ring_dec[j];
> >                         if (ring->sched.ready)
> > -                               mask |=3D 1 << ((i * adev->jpeg.num_jpe=
g_rings) + j);
> > +                               mask |=3D 1ULL << ((i * adev->jpeg.num_=
jpeg_rings) + j);
> >                 }
> >         }
> >         *val =3D mask;
> > --
> > 2.34.1
> >
