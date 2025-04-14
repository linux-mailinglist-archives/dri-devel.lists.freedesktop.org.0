Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72817A88885
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 18:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AAD10E147;
	Mon, 14 Apr 2025 16:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QtMlTq8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C4A10E146;
 Mon, 14 Apr 2025 16:24:19 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2ff73032ac0so711636a91.3; 
 Mon, 14 Apr 2025 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744647859; x=1745252659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WZud10eViPHjvJZrQ1WbVgYCANxeLpCUxFVXE3wcfRY=;
 b=QtMlTq8rEwGXdHJoKk2FtkqNhrsb04Opdr9mdEzWn5wLPMyo5szrE+4p30xw59fm+3
 Zu4Ocklmy9i2ZOUHj7Z+p/cKvjFJhf4kfMX7YjwNMDv4DVCwt44/bfxkqkCkmKIvWcNH
 Nd7kgD4uGnFvhXxxI2uHgJ1C4a7A/ckgt9sRrc0uTowugPzYMgFa44q9VttO4mRd1A/C
 vCnDC1/+uEM6z3y3imGMCzx8LP6TV5kG2xm7eDzPjWlpxURrG+bufhGnuV1MwVwb4ayK
 T5RqoEaHc6nq2pzs1XiYHMSU1a9E2qa8Eip+5+CsSE27efoSPUg+WqAMfCx6rwjJimVJ
 qUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744647859; x=1745252659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WZud10eViPHjvJZrQ1WbVgYCANxeLpCUxFVXE3wcfRY=;
 b=Pw0LmH9nMnChdtXRT5bcOU/ORITPNy2rGisxDa8mnNzuJ3BQEZbtu8DZ2Xl+wUSPo+
 WHauEriLazSNvI8nMjWax0mnxXgaBRjE2xMnaodqwl8fWRRJD/k+BZS+a8dMm81WUUb8
 DD3dPhuX2MzxDzEFZGzeFVhl7WzfNzMd7T1+ucLXAE+M4phs5VlpH7XWZ9LcYY50nfJX
 8vJHvNb9Fk8M8emV8S7EUizXi1BaZWiUyTWEjNqZ9/OamHnaAT4IsVFajuMr0PpZQ7kK
 6qo4O/5k4ATTBGod6FRSd+7Q41YvNOezBp/G6UFXPckNwh0GkIprAwM4l+6LCRfQPxPO
 LbNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFusqG3x5ji10VF4fDUAYz+2egkottT2RyGmtg0lm6rZPCJGP+VT3HLEJn1i3w9bdjrgLCiN4Q@lists.freedesktop.org,
 AJvYcCXPMrhihkYem43MtYGCpwnT9G87Cc5hExcLWAKAKvxTiDt0w/i+wBD4nLLfeWE+/I9Es3gZUrko12Wr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4ENPJxkmHdxP9fIhdr760HPy1fP4bz6acIDXnBK20x6cnfEzi
 kArMJESoO9AMRYfcc1pIdvaMgRGtivKNL8GKVu0vawsWmD0XComAmOU8jL6SpYw7O82CyFj+PZY
 Z4HZSI2WkGcOl2RGK2VGiQOs3cjg=
X-Gm-Gg: ASbGnctFPzIAwHoxY8utTfI64U0KHvJG874ya91AOxIsQG9yWmGnxlTkIADyazhXcvb
 wcTV+54hvjsrZ/w5gZyVMtL4IXLhXfXKpN/rT15JU48emBiZUzWS43xzV1R+NPPzMz2QW72Er6c
 U3fAVRkqtNtONA4h36D8xgaw==
X-Google-Smtp-Source: AGHT+IHIsZgwmUE371RVExdjfe3uDKkVX+OFob1yNsscZOphYZFPIzOV7hJu8uNOR/J8RHrfXHyWpwMz99OlQxJV/9Y=
X-Received: by 2002:a17:90b:3905:b0:2ff:7b15:8138 with SMTP id
 98e67ed59e1d1-308237e2734mr7400483a91.7.1744647858847; Mon, 14 Apr 2025
 09:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744468610.git.dan.carpenter@linaro.org>
 <b9adf038b3ccf058c49e7e74e1998bc2216e0678.1744468610.git.dan.carpenter@linaro.org>
 <3d8df435-a248-4f38-7a2a-b0f2ec908ae0@amd.com>
In-Reply-To: <3d8df435-a248-4f38-7a2a-b0f2ec908ae0@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 12:24:07 -0400
X-Gm-Features: ATxdqUF3GQVImlGRef4uHJ3JWI5t9seFoFszL8FAVduTHerGcRdz3Qd2V-m_S-0
Message-ID: <CADnq5_N+qd3k6gPrZwXD7suU-6diXWAr1N4st113RzCLJqg_Fg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Clean up error handling in
 amdgpu_userq_fence_driver_alloc()
To: "Yadav, Arvind" <arvyadav@amd.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
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

Applied the series.  Thanks!

On Mon, Apr 14, 2025 at 12:48=E2=80=AFAM Yadav, Arvind <arvyadav@amd.com> w=
rote:
>
> Reviewed-by:Arvind Yadav <arvind.yadav@amd.com>
>
> On 4/12/2025 8:09 PM, Dan Carpenter wrote:
> > 1) Checkpatch complains if we print an error message for kzalloc()
> >     failure.  The kzalloc() failure already has it's own error messages
> >     built in.  Also this allocation is small enough that it is guarante=
ed
> >     to succeed.
> > 2) Return directly instead of doing a goto free_fence_drv.  The
> >     "fence_drv" is already NULL so no cleanup is necessary.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: New patch
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
> >   1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> > index b012fece91e8..86eab5461162 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> > @@ -75,11 +75,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_de=
vice *adev,
> >       int r;
> >
> >       fence_drv =3D kzalloc(sizeof(*fence_drv), GFP_KERNEL);
> > -     if (!fence_drv) {
> > -             DRM_ERROR("Failed to allocate memory for fence driver\n")=
;
> > -             r =3D -ENOMEM;
> > -             goto free_fence_drv;
> > -     }
> > +     if (!fence_drv)
> > +             return -ENOMEM;
> >
> >       /* Acquire seq64 memory */
> >       r =3D amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_ad=
dr,
