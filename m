Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA3A509E7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 19:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A860D89262;
	Wed,  5 Mar 2025 18:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lDoE0ml8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D36289262;
 Wed,  5 Mar 2025 18:25:51 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fc92215d15so1646434a91.1; 
 Wed, 05 Mar 2025 10:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741199151; x=1741803951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6ub0LI2sdOj4nWBdarlcwFS6czB6x3ubY+sbg/M77k=;
 b=lDoE0ml8wNuaTExbdMAxNk5RAZPpyYk39vOVP2LWz7q6WouOl6RlpYrZwDRDEj7SPG
 f5gesWfzCWs/rfRAuNoQjJvqEsOe9ZmFHrwrV00CDSJheuEn3+8PsSvN2nJATW76Akgo
 P6OFB4aKA2CLzxn2SLC4PJSK45f67mAO/SiQZaNWGZ2co9h/8LiRPBaRRAXAetx45JKR
 2LnZijU2u0DNQbZNhuN8AeZ1nOJ7OBM5Oj3Xot0BWSNR2GSOl4DU8oNF20577qIXYBiP
 K+tVmUIfgNGgj7DgKaoRRdHF8liHRFO1z//fKWWZyNezZwdGGcGcGUd1Ps6rLBVn8NFI
 qfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741199151; x=1741803951;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6ub0LI2sdOj4nWBdarlcwFS6czB6x3ubY+sbg/M77k=;
 b=w4JtEEVgrpKEGzU0icwyrHMAjDAvg3OUP1Ugs27t65+x1DO5sJqHmmq4NTHgcPlYZl
 01jbrC5llrSLYveKEkQw8p/P7Oum6xSx7B1Iu07u/b69EnY5BHyH6zRPZ/GW1i6KTnf9
 XnQQHAUz2YFoeooBBNkKl/4W9l964WNfAxdl7qhTyI1Jci4mcTj0TKmtQxc/Il5q+V6M
 uhnBB0oayua3EttPCNa+D3akhEhzS+WSZL89SZgSa7wH3q7XAnqr0sTkt63wgqtyemXU
 rwfhRi9rYV0cK+v7JwSPYRZUSFvMXQMRWOSUZO+YLIMXb/WIdZI7QeU/6AlvGmpdThpF
 r5Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8XPj+DhO8YtuhPB/IQ30dLv+JhKjqGYubdlO8777NaJTUrhH8bcNelXIZydwuYgJ30KhjnVBY@lists.freedesktop.org,
 AJvYcCUsVO2I3dlB+QebTvlWBbnQN70Sm6WWsz/LRbc6aHVnSjJfF3lPz53pzHZYqmcbyHNxFvaljQtzQMYB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLb336sAzzeU9dCYpiG/yoCH57C+0XA3IOqmyflsUWPIdvPwkW
 HId6UWksN5y+YWFPfkKsYANaLduSCU0Lt4IRKTKvzN+9JQu9E6BS3jrRBGaofbewhGu2e5NHY6L
 ZqWHDxfj2XJABP4FP7BWoKjLvIrxWhw==
X-Gm-Gg: ASbGncvmxMizW6NHdgBGXS6PMdWqrTENnNgD4wF+Kh606lFOdkkbjbFynLKzj8k/7XM
 c38fCQyk6Sx1MgRXfKOIN3+ouyQXvqSk3asyuvNm7aYUeceLQM4REFEE/IuisQHqjnoN1Cyp6ED
 qEUM3VgvC3pQTKMROBsGEyZu5sqQ==
X-Google-Smtp-Source: AGHT+IHUUUMr0eXBfhB2k8mdAzcSo+xudwlQStKnJTUoHPgc7DWqIflQaDWzZFDkNYAWuQOPHhJZONCvrg9pJIRT4gg=
X-Received: by 2002:a17:90b:3ec7:b0:2fe:8e19:bcd7 with SMTP id
 98e67ed59e1d1-2ff49837979mr1415861a91.5.1741199150789; Wed, 05 Mar 2025
 10:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20250304071030.2166-1-vulab@iscas.ac.cn>
In-Reply-To: <20250304071030.2166-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 5 Mar 2025 13:25:39 -0500
X-Gm-Features: AQ5f1JpsrrkkoNp9IkrO3SOJNFhknOQdq3tpUg-npUaJDMdg63QZADBLS2CqICA
Message-ID: <CADnq5_Nc62v7aB9xof1ZiTq0TQPJvxwjtvTO2KkaWwvfxEg03Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: handle amdgpu_cgs_create_device() errors in
 amd_powerplay_create()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: kenneth.feng@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, 
 Jun.Ma2@amd.com, lijo.lazar@amd.com, amd-gfx@lists.freedesktop.org, 
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

On Tue, Mar 4, 2025 at 4:29=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wro=
te:
>
> Add error handling to propagate amdgpu_cgs_create_device() failures
> to the caller. When amdgpu_cgs_create_device() fails, immediately
> return -EINVAL to stop further processing and prevent null pointer
> dereference.
>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/g=
pu/drm/amd/pm/powerplay/amd_powerplay.c
> index 26624a716fc6..2cb05614466f 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> @@ -51,6 +51,8 @@ static int amd_powerplay_create(struct amdgpu_device *a=
dev)
>         hwmgr->adev =3D adev;
>         hwmgr->not_vf =3D !amdgpu_sriov_vf(adev);
>         hwmgr->device =3D amdgpu_cgs_create_device(adev);
> +       if (!hwmgr->device)
> +               return -EINVAL;

Please return -ENOMEM here.  Also, you need to free hwmgr as well in this c=
ase.

Alex

>         mutex_init(&hwmgr->msg_lock);
>         hwmgr->chip_family =3D adev->family;
>         hwmgr->chip_id =3D adev->asic_type;
> --
> 2.42.0.windows.2
>
