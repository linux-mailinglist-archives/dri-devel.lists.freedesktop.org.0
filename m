Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28D8ACFA2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B0C112B8D;
	Mon, 22 Apr 2024 14:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZseN3s+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3808112B84;
 Mon, 22 Apr 2024 14:41:01 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5dcc4076c13so3041206a12.0; 
 Mon, 22 Apr 2024 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713796861; x=1714401661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9LOOxnp6uDCj3fmcKccLPiFpdOHLZ+RePrbPeCtdEE=;
 b=ZseN3s+a4AEar6Sh8QxsJggbR3oaj627Gxa8zn9UBZvwHX059pbSSzhf0Lu+ukueJ1
 Os1tnghs4vfAwgV1wrGn4mI4OCSteiYzPMzzNbetRMWGrMR14307OeGWtPco+eB28uad
 HSFMCJCxuMjnVu10AiinqrxODpb5BhGyDNSRT/NTksYoO4yjqu4LtPEGumskILI6Lmk6
 NZJn1tBBM+UctduZ3bYprEHzN5JXrFZKMqQ37dwqgaEbLjQwrKTX21bMOVZ/PZsfpkQX
 AG1kbZVV/OA39f6nWgxZyfJlJSSi5qvdqSEFKJ+kmPHcn/OByGZnzvghf/Iu2omJlK4h
 orkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713796861; x=1714401661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R9LOOxnp6uDCj3fmcKccLPiFpdOHLZ+RePrbPeCtdEE=;
 b=igHgmOAa7NGstcgW6Eut/eXcpwEFtOs3d9qZmKrGoWXdGkyVkwo2qyZiuFM6G+R3z8
 JVi9aeWig1/BDFXZ6YwYYYabM+yf0nYzquBdnDG7Gv2SKejWMKwy2uEpW2hIYprjujxy
 63GhMLLk2QP9IdmPtuB7DBBM6atrAN/GyybDGNwMAtKzSdasDX9+en9HU11FYdON9wd1
 os4ZdnJ8ttuefLJpnbDslllpNq2sqS1u0KtWqVRSU3u1+NT40j7cl89O/Z2Yd/fsBI/T
 KCJ1dQcawLds9uYz/fNCwTTNwumvPfCfWyX2WWK3RAU84DXBp5L4Yi1HCCateh7vkK4r
 AJ9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfRDSE2KoE9eOcdnb9BCHnkdkrfNzgKYvE+0bUQ045zxL6ErvT/VKCCAifxNc/OQqFfmpzHpZEG2YeuCCq0dJsBQDyx2LksB9HIY62pBZuhT4qs5YlUMfcMKqMB3VXX03KEnREH7Hw+HPoibam0w==
X-Gm-Message-State: AOJu0Ywjm+s4kQrNzJuy4Niz2Kzms/BS0H1E4wc7hE9f9Tt9Ffxm5x0L
 acpXldvkf8ZHFDz7PY3+0Rl/WIDB8bd2OzA+42/ziD49JHdtKTJjuO0AvbHVRMMJMT3JXo568Tx
 nrcaafcLkIu/FTFWkhjSAjbzAZdU=
X-Google-Smtp-Source: AGHT+IEgc0XiwfDp8RVTyTAd5lS2sDXiuF3v9HjTRhVsGc5NIcwymNn2hdprUQwLiFncA8Ojla8Wfuwk9H/w2el4HR8=
X-Received: by 2002:a17:90b:4aca:b0:29b:c31:1fe1 with SMTP id
 mh10-20020a17090b4aca00b0029b0c311fe1mr14464782pjb.10.1713796861204; Mon, 22
 Apr 2024 07:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240422052608.5297-1-maqianga@uniontech.com>
 <68f02c5c-5591-4d6f-9926-b0fc6f9f6287@amd.com>
 <D94775003178862D+20240422203329.49844e71@john-PC>
 <bde48eef-4d8a-4cfa-b824-6de88c0f87fd@amd.com>
In-Reply-To: <bde48eef-4d8a-4cfa-b824-6de88c0f87fd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Apr 2024 10:40:48 -0400
Message-ID: <CADnq5_PQ67J9ytb89-DqOgDw5V-s98TOyVjT5BGfkWMYv5sMQg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fixup bad vram size on gmc v6 and v7
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Qiang Ma <maqianga@uniontech.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, srinivasan.shanmugam@amd.com, 
 Arunpravin.PaneerSelvam@amd.com, le.ma@amd.com, Felix.Kuehling@amd.com, 
 mukul.joshi@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Apr 22, 2024 at 9:00=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.04.24 um 14:33 schrieb Qiang Ma:
> > On Mon, 22 Apr 2024 11:40:26 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >
> >> Am 22.04.24 um 07:26 schrieb Qiang Ma:
> >>> Some boards(like Oland PRO: 0x1002:0x6613) seem to have
> >>> garbage in the upper 16 bits of the vram size register,
> >>> kern log as follows:
> >>>
> >>> [    6.000000] [drm] Detected VRAM RAM=3D2256537600M, BAR=3D256M
> >>> [    6.007812] [drm] RAM width 64bits GDDR5
> >>> [    6.031250] [drm] amdgpu: 2256537600M of VRAM memory ready
> >>>
> >>> This is obviously not true, check for this and clamp the size
> >>> properly. Fixes boards reporting bogus amounts of vram,
> >>> kern log as follows:
> >>>
> >>> [    2.789062] [drm] Probable bad vram size: 0x86800800
> >>> [    2.789062] [drm] Detected VRAM RAM=3D2048M, BAR=3D256M
> >>> [    2.789062] [drm] RAM width 64bits GDDR5
> >>> [    2.789062] [drm] amdgpu: 2048M of VRAM memory ready
> >> Well we had patches like this one here before and so far we always
> >> rejected them.
> >>
> >> When the mmCONFIG_MEMSIZE register isn't properly initialized then
> >> there is something wrong with your hardware.
> >>
> >> Working around that in the software driver is not going to fly.
> >>
> >> Regards,
> >> Christian.
> >>
> > Hi Christian:
> > I see that two patches for this issue have been merged, and the
> > patches are as follows:
> >
> > 11544d77e397 drm/amdgpu: fixup bad vram size on gmc v8
> > 0ca223b029a2 drm/radeon: fixup bad vram size on SI
>
> Mhm, I remember that we discussed reverting those but it looks like that
> never happened. I need to ask around internally.
>
> Question is do you see any other problems with the board? E.g. incorrect
> connector or harvesting configuration?

I'll need to dig up the past discussion again, but IIRC, the issue was
only seen on some non-x86 platforms.  Maybe something specific to MMIO
on those?

Alex


>
> Regards,
> Christian.
>
> >
> > Qiang Ma
> >
> >>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 11 +++++++++--
> >>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 ++++++++++---
> >>>    2 files changed, 19 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> >>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c index
> >>> 23b478639921..3703695f7789 100644 ---
> >>> a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c +++
> >>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c @@ -309,8 +309,15 @@ static
> >>> int gmc_v6_0_mc_init(struct amdgpu_device *adev) }
> >>>     adev->gmc.vram_width =3D numchan * chansize;
> >>>     /* size in MB on si */
> >>> -   adev->gmc.mc_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>> 1024ULL * 1024ULL;
> >>> -   adev->gmc.real_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>> 1024ULL * 1024ULL;
> >>> +   tmp =3D RREG32(mmCONFIG_MEMSIZE);
> >>> +   /* some boards may have garbage in the upper 16 bits */
> >>> +   if (tmp & 0xffff0000) {
> >>> +           DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
> >>> +           if (tmp & 0xffff)
> >>> +                   tmp &=3D 0xffff;
> >>> +   }
> >>> +   adev->gmc.mc_vram_size =3D tmp * 1024ULL * 1024ULL;
> >>> +   adev->gmc.real_vram_size =3D adev->gmc.mc_vram_size;
> >>>
> >>>     if (!(adev->flags & AMD_IS_APU)) {
> >>>             r =3D amdgpu_device_resize_fb_bar(adev);
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c index
> >>> 3da7b6a2b00d..1df1fc578ff6 100644 ---
> >>> a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c +++
> >>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c @@ -316,10 +316,10 @@
> >>> static void gmc_v7_0_mc_program(struct amdgpu_device *adev) static
> >>> int gmc_v7_0_mc_init(struct amdgpu_device *adev) {
> >>>     int r;
> >>> +   u32 tmp;
> >>>
> >>>     adev->gmc.vram_width =3D
> >>> amdgpu_atombios_get_vram_width(adev); if (!adev->gmc.vram_width) {
> >>> -           u32 tmp;
> >>>             int chansize, numchan;
> >>>
> >>>             /* Get VRAM informations */
> >>> @@ -363,8 +363,15 @@ static int gmc_v7_0_mc_init(struct
> >>> amdgpu_device *adev) adev->gmc.vram_width =3D numchan * chansize;
> >>>     }
> >>>     /* size in MB on si */
> >>> -   adev->gmc.mc_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>> 1024ULL * 1024ULL;
> >>> -   adev->gmc.real_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>> 1024ULL * 1024ULL;
> >>> +   tmp =3D RREG32(mmCONFIG_MEMSIZE);
> >>> +   /* some boards may have garbage in the upper 16 bits */
> >>> +   if (tmp & 0xffff0000) {
> >>> +           DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
> >>> +           if (tmp & 0xffff)
> >>> +                   tmp &=3D 0xffff;
> >>> +   }
> >>> +   adev->gmc.mc_vram_size =3D tmp * 1024ULL * 1024ULL;
> >>> +   adev->gmc.real_vram_size =3D adev->gmc.mc_vram_size;
> >>>
> >>>     if (!(adev->flags & AMD_IS_APU)) {
> >>>             r =3D amdgpu_device_resize_fb_bar(adev);
> >>
>
