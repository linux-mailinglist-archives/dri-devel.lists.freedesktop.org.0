Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360FAA4E58
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F4710E2AE;
	Wed, 30 Apr 2025 14:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mE5QUwUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBF810E2AE;
 Wed, 30 Apr 2025 14:21:01 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ff62f9b6e4so888803a91.0; 
 Wed, 30 Apr 2025 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746022861; x=1746627661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZmQwZmxB+/0iwMhAswU29lyI7OcK6uMy67401DmTrQ=;
 b=mE5QUwURjcYe7a0wNo+pWNXcewqdJA2GHkYvVCAH0mrxgL20dp02uk/M58yBjPlxAW
 X8+MZ5l3qS4p7qHq0KttVzmelWNWxoeURfft5aSFiYQhk/ABe8G/mPHY402/V9D1Lebr
 tAgQE+bmHg58Jgjhd6r/Isa+9re9BGB3hXKPrt8ViDmBqOkHnZJW6LuTZsyX5sl629f1
 lvgiVVn47ixvx72vXf+QNUDdfTi5PV/YCjJMtQvD81M1JDiNCJlN9d/m/WYBoHgNcrfX
 VHybUjX8P6ssMYdHZxDk4BzEldk01NBb6yH1ej3EqNpecyKnOvO0uGB7O1sX4wnOVfUl
 zgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746022861; x=1746627661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sZmQwZmxB+/0iwMhAswU29lyI7OcK6uMy67401DmTrQ=;
 b=E6rA/Akh0AU+6+11G/jPGZajIfR7egR3HeyLkr8ZtBWGh1VTigI8/po4NcdPTNZ5+6
 a9lSgAIBtuhZzJba3qZbf043uptiDBan4JcAWsjforhSqA3cF8PAhNPCU6oQ+x7H7GkH
 B/GU+D0WVAWGFtkYcS4wrv+Zb9R1DsX/V322j2gK5da7NWOFKfRBsR8YwsoiJHJbmVr0
 wWRDSAvldtfmObCsYT5dTRvB8GIHP2bA1RhL3tNCKEqOvi+tUnz49WoQCQFo8MODwgmB
 AQh9Ooos1O+W9xjk/cDbrKjHonOZ0xcWzkM7iCJ7ZsenobMrr2SFUo8Z0xd5O7IcEdYv
 bsvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPflRC0tj+CjyCwVW3Qmi20wYVJ6Hu5rs05fCKTeHCZr5bHOTw6JgNTQEVTjqfeLKAffloOv0TGxbg@lists.freedesktop.org,
 AJvYcCXxIZP9nSqt72JJoTeXOkiOO0pMfPeUNVPbwjxpEPlJnGjjFZAYJg7Oagl/GYlZTM89IMY+/QGV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRbNBbHuAyW5iD0VI/SPQxVOGcU6DA20JnYD6aa4aVqXe+LfXW
 KQDltB2jPrxstEUeYzWEGHgEXaeYjEeufx4rq3Gl9awCeOvz2bFzcafGO9cmQkBOdoF0R4WGmDp
 VOClZb0NwKnQybX0GWKn/jWFwcRo=
X-Gm-Gg: ASbGncsFkKTAi7bRF1YIq+xpraKAOa38Fz7awJmNBraZcXeRyApHCiis8xfgcxnV02o
 ktOWPCIYA8jMNX5MyF8abrtZ8z8Cn9AwrPjyL3gMO58t+W/rwBx6W0M93E4w6RR5AyArZ+XSJ6W
 ong/U1YuxIgsr/LN2r8ga77Ui525GVZ3sM
X-Google-Smtp-Source: AGHT+IHrRGSCtx7yYWpJEIC2bzjI16vhGr+WvXakgytHAWV7umJvxRTzyd+RXip4iCHcc3z9o9KqkLvAU+fqkw7MRxw=
X-Received: by 2002:a17:90b:1b52:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-30a34a7903fmr1258142a91.3.1746022860936; Wed, 30 Apr 2025
 07:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <aBHZuejTTKkdnGaZ@stanley.mountain>
In-Reply-To: <aBHZuejTTKkdnGaZ@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Apr 2025 10:20:49 -0400
X-Gm-Features: ATxdqUEB0H-Jbi4I5kCfhljTEmMnfaxoRCMWULH3c0gZNlkLYq2fJo8Njqfwsus
Message-ID: <CADnq5_O0CmTSScncQ5kV=BciZdEZ+D_THNEis+Lfy1ENPJ-+pQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shashank Sharma <shashank.sharma@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Wed, Apr 30, 2025 at 4:13=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The "ticket" pointer points to in the middle of the &exec struct so it
> can't be NULL.  Remove the check.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied.  Thanks!

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.c
> index b0e8098a3988..7505d920fb3d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq=
_mgr)
>                         clear =3D false;
>                         unlock =3D true;
>                 /* The caller is already holding the reservation lock */
> -               } else if (ticket && dma_resv_locking_ctx(resv) =3D=3D ti=
cket) {
> +               } else if (dma_resv_locking_ctx(resv) =3D=3D ticket) {
>                         clear =3D false;
>                         unlock =3D false;
>                 /* Somebody else is using the BO right now */
> --
> 2.47.2
>
