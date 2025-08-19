Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A97B2C4C0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F0C10E5ED;
	Tue, 19 Aug 2025 13:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K+FOiamv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F8A10E17E;
 Tue, 19 Aug 2025 13:10:27 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-24457f57ed4so9633935ad.0; 
 Tue, 19 Aug 2025 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755609027; x=1756213827; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBO0mQ7zrboFrLruEp+8+uIF4ovtiK0aQdxBxT/KyMA=;
 b=K+FOiamv42V+IVpjuA+eKFmPD/MtpZSW/qwNXTUK5yOQa1NFxQLDQcjo4ITF2CFKC1
 U74d1CL7GqeNLDdYs/4flvlwTWvF03g3xCyA2yHC3l8wrRC2+Ulc0ru9dlP2jzZOZv9U
 8vCX0eD9gY6yoJ/c/zlWP3mSX3vB5ft3lxnqtXBZPSWClVjaVFZmg12b94+Pd3IMWRwi
 9HEfezU1eJ7iTnrsiZegeLKBnqDwXH8LqRRXr3ECZsSpkFfaiZnT/TWkwpbCp5k7HYtL
 wpwNwFH/AKpE16lcFn6+JQmeheYNxo/0Mryl0XiipXweAzttpuVC83tH6NzDAIdu8qxU
 yxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755609027; x=1756213827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBO0mQ7zrboFrLruEp+8+uIF4ovtiK0aQdxBxT/KyMA=;
 b=ViJzcaw1EMZj9tEqkpryjhRTG8ejNK9AexRI57UL8rQi2oN8EjSlIY1PZmymtiONzp
 ZX1Z5PYBY0YSfcTcdDoYd2cjc6jOr/8Jw29DoeaWpObw8cRyootvM9XuBMeU6LlNaMji
 JsBXwzgWkp8SkJyrqn9XLnlcoQceMt3RlZxancpZ3B0XDzYqdgRTwzclASNsLJrgQu/v
 ePC8YzwdfKAAVvc+2nZD0fAtjtgb521SvKJf8B8THo2nfPQJovRV3OjZxh0bosREOVA8
 u67zYhlF+ydYuW4Wu2enok8B8wcghr3W/TbEiVZX/LsYzvivraeKqqwIsKYa+b5hfUBz
 EAIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQlbY8PH8cslUKqDVBvxK1FMJ5EUdIJXVpLGko3o2FU9ZYAtB/XRkXm/bzFSlFNLHncSv08IN3VteX@lists.freedesktop.org,
 AJvYcCW1+zp6jGPXUFURTLxckA3OtjwHfZOJx9yQfZdH/S+t9eu40CVnwuGwkdXbXTVuXMJzlZxPJr5q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKM/ju/RUSdxrz8b7wUNt6cMwu96h8n5Q0o2RXYCBxAaBIPUqF
 OJf+LAAFCKo2PCaKJvQeSAIX4yCOhydHGw5IRxh4ZbljPjHp8KZtZ7H92uYv8DC8QHQttY4dXtf
 FUMoQQL7HrBjIL4jnHpHn1lq3mjL8gLYuqA==
X-Gm-Gg: ASbGncsEHunim0v9whnO4UFFAdi0rEu2CQNtTphjvOsKlLpm8+o/aNhj7seoDgppZtc
 jY/Wq9dDR1Q6tzW2F+dj3YtEywRJVeAzpemBrEDtPS0qarbKZ8XE8hvrFb2BJHQWQj4TTXcgP5W
 a70izsTV9j4k3uNF33Uanzcu7M6A4BNjimvHjBZLR7YE80jq2cnowCsnxuzrlpeHxIJAVjKYa7R
 z7VTRU=
X-Google-Smtp-Source: AGHT+IHgDHQQVvQ81lJeFxwOYKVLPEWtIJSQrpi70KdAtd/aUfRobzNM5gDqlN/++cIRn61vbrInrD505a7SNJ3odjc=
X-Received: by 2002:a17:902:ea07:b0:240:33c7:fbf9 with SMTP id
 d9443c01a7336-245e0503f5emr17013235ad.11.1755609027188; Tue, 19 Aug 2025
 06:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250819082524.526572-1-liaoyuanhong@vivo.com>
 <00e7ce33-cc0a-4249-ac18-081ab9ead243@amd.com>
In-Reply-To: <00e7ce33-cc0a-4249-ac18-081ab9ead243@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Aug 2025 09:10:15 -0400
X-Gm-Features: Ac12FXwmelZstNIBVdCAl2Tac6u3JKQmNwideXgAhYQM85MNWz4RZc0s2eVEDwE
Message-ID: <CADnq5_PA8P8V9Da8ZUrDAsYXM_tbnPPyBR4MgF4QA++59vKerA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/fence: Remove redundant 0 value initialization
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Tue, Aug 19, 2025 at 4:41=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 19.08.25 10:25, Liao Yuanhong wrote:
> > The amdgpu_fence struct is already zeroed by kzalloc(). It's redundant =
to
> > initialize am_fence->context to 0.
> >
> > Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> If you want a challenge what we would really use is a scan of all the str=
uctures defined in drivers/gpu/drm/amd/amdgpu/*.[ch] for unused fields.
>
> The UAPI and BIOS/HW header files are full of padding fields, but there s=
houldn't be any in the driver core defines and we sometimes forget to remov=
e fields from structures when they are not used any more.
>
> Regards,
> Christian.
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_fence.c
> > index bcb74286a78a..fd8cca241da6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > @@ -120,7 +120,6 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, str=
uct dma_fence **f,
> >               am_fence =3D kzalloc(sizeof(*am_fence), GFP_KERNEL);
> >               if (!am_fence)
> >                       return -ENOMEM;
> > -             am_fence->context =3D 0;
> >       } else {
> >               am_fence =3D af;
> >       }
>
