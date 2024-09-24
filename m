Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDFE984934
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCDA10E71A;
	Tue, 24 Sep 2024 16:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UIcVYpXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7229210E719;
 Tue, 24 Sep 2024 16:09:00 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-718ebb01fd2so1086278b3a.2; 
 Tue, 24 Sep 2024 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727194140; x=1727798940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWsuC1k58rgBxgEKQ95dKaFfehaSkHrV3qM3cnflsPg=;
 b=UIcVYpXmFcpXBJQfIArW3VirlZPmPZEL+C+Etoh4w9rLTpU0hkqwtXZFHbs6iIwkoq
 v1q/2t6p5YaMWErFxCaaB8PMP/N9BS14syBlx1of69E0/TkV/sc1XXNvSn1moZW1UCX4
 ZraZfrPiD/FVihtjN1DcBIYdGLW5HK32ZRfFQr/u34NnjfNlSCcXlUS/tBqEWNVts1lF
 +gAiCO3PGabbsv7lFsi20LmJaxWSki0zV9UPf8k7hcEqVZTgLAEAWwLyilXPmVz+a5Ox
 ILQYul9c+BzMw1ALdqesjj7tXZdbxD6F5inxUONRNqyQQcxCqd6FPZJ0jf9EQCIackJr
 ZITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727194140; x=1727798940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWsuC1k58rgBxgEKQ95dKaFfehaSkHrV3qM3cnflsPg=;
 b=r/hNwWebXRb+D/Culob+0vxOOVFOqJcSyaDyW10Q3CNvkrqIQfHhBuepWPm/eJyXAB
 GKQK3yja8yh7Pe047PJR7vsbUq1Gct0clqucdkf2Pv9q4JDsiY/ZFllN676Hz878Cfkt
 gYRIjilYJ6bTAbtYPyKMMwBbJyWLe8p8NAJQPFPlTM1hLCz4//2yIipPClYGUzuk9bgu
 +S9EHczvRX/1b7Di1bOPJFjyNpmo1JNTJXZlgiQjcLyXJ3dDZTfQyXx4POBeee18B3tm
 8gXTeRRKgz/A3ao3UqoQFOwGmctHEArnXbFJtcqRmx0eG02t+IPwa2tzct0Uio8cnW7S
 JD5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYijz/TKkvFpAgJfbCkyMhr5fKH43szJk61L9PXb1Afl8hJuqdHxO5H7HxSjb/DCYWNDENfxQSUxzt@lists.freedesktop.org,
 AJvYcCVxQ+0N5rwnT7tRS9joQJFzxhOIfIRMZUrhj1q6yA2YlIff94NhaA7CFPQW4A/VBO80sIgMxhAH@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjm1XSZZVBGRpw0VUMlUdSRBA7rpS8bGf1qB0GSJ6aj4aF8pCq
 EPJJfpZaNB/0DpQyTUJOyjB0txR2VtbV+9BV4Dh65uoxupqlqGya9OTBA2FruFuPg+8nKxfikA5
 6t7A3StCTDKUgrXL61RR+xyxRvUY=
X-Google-Smtp-Source: AGHT+IHOExPAGZCXFGmdvFYllAvrAWe+T33mgW0ydNW0IhFfuAjbsci12Zvgz4GCqe7jF+3muMjRPm97OHwCLHCD8KY=
X-Received: by 2002:a05:6a00:1889:b0:714:2051:89ea with SMTP id
 d2e1a72fcca58-71afb5c86bcmr2053630b3a.1.1727194139706; Tue, 24 Sep 2024
 09:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <F25A139789E87C3E+20240920022755.1162495-1-wangyuli@uniontech.com>
 <ade271e8-2f6e-494b-979a-e53942b6b9a7@amd.com>
In-Reply-To: <ade271e8-2f6e-494b-979a-e53942b6b9a7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2024 12:08:47 -0400
Message-ID: <CADnq5_Pvq=W69KM08O4TOhG1fcQTO-KEE31KVqfsuOwJL9vv7w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix typo "acccess" and improve the comment
 style here
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: WangYuli <wangyuli@uniontech.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, sunil.khatri@amd.com, 
 yifan1.zhang@amd.com, vitaly.prosyak@amd.com, Tim.Huang@amd.com, 
 Prike.Liang@amd.com, jesse.zhang@amd.com, lijo.lazar@amd.com, 
 Hawking.Zhang@amd.com, kevinyang.wang@amd.com, srinivasan.shanmugam@amd.com, 
 victorchengchi.lu@amd.com, Jiadong.Zhu@amd.com, tao.zhou1@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, le.ma@amd.com, Wenhui.Sheng@amd.com, 
 Thomas Zimmermann <tzimmermann@suse.de>
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

Applied.  Thanks!

Alex

On Fri, Sep 20, 2024 at 2:29=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.09.24 um 04:27 schrieb WangYuli:
> > There are some spelling mistakes of 'acccess' in comments which
> > should be instead of 'access'.
> >
> > And the comment style should be like this:
> >   /*
> >    * Text
> >    * Text
> >    */
> >
> > Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Link: https://lore.kernel.org/all/f75fbe30-528e-404f-97e4-854d27d7a401@=
amd.com/
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Link: https://lore.kernel.org/all/0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@=
suse.de/
> > Signed-off-by: WangYuli <wangyuli@uniontech.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c  | 6 ++++--
> >   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 6 ++++--
> >   2 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/a=
md/amdgpu/gfx_v11_0.c
> > index d3e8be82a172..33fd2da49a2a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> > @@ -1893,8 +1893,10 @@ static void gfx_v11_0_init_compute_vmid(struct a=
mdgpu_device *adev)
> >       soc21_grbm_select(adev, 0, 0, 0, 0);
> >       mutex_unlock(&adev->srbm_mutex);
> >
> > -     /* Initialize all compute VMIDs to have no GDS, GWS, or OA
> > -        acccess. These should be enabled by FW for target VMIDs. */
> > +     /*
> > +      * Initialize all compute VMIDs to have no GDS, GWS, or OA
> > +      * access. These should be enabled by FW for target VMIDs.
> > +      */
> >       for (i =3D adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; =
i++) {
> >               WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * i, 0);
> >               WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * i, 0);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/=
amd/amdgpu/gfx_v9_4_3.c
> > index 408e5600bb61..57b55b6d797d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> > @@ -1247,8 +1247,10 @@ static void gfx_v9_4_3_xcc_init_compute_vmid(str=
uct amdgpu_device *adev,
> >       soc15_grbm_select(adev, 0, 0, 0, 0, GET_INST(GC, xcc_id));
> >       mutex_unlock(&adev->srbm_mutex);
> >
> > -     /* Initialize all compute VMIDs to have no GDS, GWS, or OA
> > -        acccess. These should be enabled by FW for target VMIDs. */
> > +     /*
> > +      * Initialize all compute VMIDs to have no GDS, GWS, or OA
> > +      * access. These should be enabled by FW for target VMIDs.
> > +      */
> >       for (i =3D adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; =
i++) {
> >               WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID=
0_BASE, 2 * i, 0);
> >               WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID=
0_SIZE, 2 * i, 0);
>
