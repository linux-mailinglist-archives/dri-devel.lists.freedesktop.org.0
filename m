Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB069B459FA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 16:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CFA10EBB1;
	Fri,  5 Sep 2025 14:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HRvXBehO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE4D10EBB0;
 Fri,  5 Sep 2025 14:02:11 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-24ca270d700so4965685ad.0; 
 Fri, 05 Sep 2025 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757080931; x=1757685731; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmzENMw6YNHe2IJ7FAYcIAfnTl3HXJqQlHsorHVRbJc=;
 b=HRvXBehOLDQTTcL0FhoM4+n6Dy3aWHWVjJjwrnyB2msCcF6wdPEiNZTE88lfEhQRfB
 QP7fOA782jzbVO9HB+v4WCjoh49TkyPVrUpgwxcLR3ydapJpQ2Ysber6Ct0pth4Bvmm1
 D0qBg8yKLIJQ+QBNXEqVCiIlEF+IptBNxbLmzGHzBID/LgLgFxgGCy+dyqwgtweRLM0P
 xw0h9s3uHL/QNLX9GOXWHY+jf9ETUnMl7cTnejcYy0RNG1KiYw4yA1UWQB6W3eAqd4tM
 CpXs2znclPZY2bm7sD1QitReGp+1iTmufQWT8BEEvX84/9frCHw5xnqul74cGApPZ4L2
 g7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757080931; x=1757685731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmzENMw6YNHe2IJ7FAYcIAfnTl3HXJqQlHsorHVRbJc=;
 b=o+7Ma4h/l7g25dSgS1tIXDlk3DKzi5pukLJ2in2bgZ1tZ2hbVLYniWD5z834++TeSz
 qyqWVRITc5X7HMXvw0HBSQwqR3xlau7edYVTYH8miuiiaaDSgVU8EDRmVNHNKD+Sema+
 rzaVI94QANdjeZ0huXdIlkhep7IcVBJ84ULfdwe+4uc4jiZ+ALXwJZkpS17yxhIAZ85e
 nPJ76406tYMLhrEJlICnj1anq+mpQu8vNowa1sYJxhMK/SXIG+RxQM2QhjQPLTtte7Pe
 LJsvn0OzOl7I3LKvuubk8wizi0DsgJW7jgydTpL7kUdJ0i2R95fXm+c4dZtLTTGJApiS
 EVgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTZiRpacT49RNnu6PqQx2RxwjNJszx1pUD/0Jf62To82BDvZKiFem6YMFEbtKL+QF6oec8vtVY@lists.freedesktop.org,
 AJvYcCWs4v7bppLrHDMWq1rBHmdsP+/ruXGIxBvmdF4jHySyObj+7gO2PKlAkfol+jfkuo8YyoeitNvnWvCH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtC2OWZfc09d+1FTD9c4xEbiTuheptGyqGpOiIinUYziR9dlpy
 /i0MR44OwT7cDSYY9brqCkoTfAoZWhSIRw0Y8fW1GaQ1uvSgZAnjEFsckhgF5N77ICCsnf++Q6k
 VnPD8thda9MgXd+fyO9RJ5mMt+Gy2YxE=
X-Gm-Gg: ASbGncu7NNtPXPgQB66JF+XkTqc4Gnem+NU5Jyf3ivpbqd2HHt9VWGVprqfq/Y2Ocqb
 O66ZEAQjEfa70nVEHOhEzgc8NEY7IH87xAhBNhJ9nH3Zua6F8wYcvdKVQEo18Y3mUodiTy/E3E6
 Z/FMx/fDUI+hNJxODpb1giAYS/H65AAJnpXX/M9uE9FOJmymQfcmqtuiomqg8BiWH5MCwdeMEei
 jmxO16pWXQs7B5FoQ==
X-Google-Smtp-Source: AGHT+IF9rkgtoSMCl0jYFSHVZuyZeCWt9XZMNT1MGcboLMsN9CKxcNZU79FEyRdNtyL0WU9L2+FyKsOgYQInTvQ6ias=
X-Received: by 2002:a17:902:dac8:b0:24f:8286:9e5a with SMTP id
 d9443c01a7336-24f8286a133mr5036715ad.6.1757080930194; Fri, 05 Sep 2025
 07:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <aLnhaU9cLeAdim7J@stanley.mountain>
 <SA1PR12MB814473BD381D10C842F30422EF03A@SA1PR12MB8144.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB814473BD381D10C842F30422EF03A@SA1PR12MB8144.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Sep 2025 10:01:58 -0400
X-Gm-Features: Ac12FXx-WGJ-F0--XB5dXIw5UpADiQRdi1GA0k5IIwFmngy8mfiqzoc0IpdRJ0c
Message-ID: <CADnq5_PZgPKjARKaKrxtKOUhuk8KBOOba75SxnFJD_76W8yDKw@mail.gmail.com>
Subject: Re: [PATCH next] drm/amdgpu: Fix error codes if copy_to_user() fails
To: "Francis, David" <David.Francis@amd.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>, 
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
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

On Fri, Sep 5, 2025 at 8:59=E2=80=AFAM Francis, David <David.Francis@amd.co=
m> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Whoops. Yep, story checks out.
>
> This is
> Reviewed-By: David Francis <David.Francis@amd.com>
> ________________________________
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Thursday, September 4, 2025 2:58 PM
> To: Francis, David <David.Francis@amd.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Ch=
ristian.Koenig@amd.com>; David Airlie <airlied@gmail.com>; Simona Vetter <s=
imona@ffwll.ch>; Arvind Yadav <Arvind.Yadav@amd.com>; Sharma, Shashank <Sha=
shank.Sharma@amd.com>; Thomas Zimmermann <tzimmermann@suse.de>; amd-gfx@lis=
ts.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedes=
ktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <l=
inux-kernel@vger.kernel.org>; kernel-janitors@vger.kernel.org <kernel-janit=
ors@vger.kernel.org>
> Subject: [PATCH next] drm/amdgpu: Fix error codes if copy_to_user() fails
>
> The copy_to_user() function returns the number of bytes that it wasn't
> able to copy, but we should return -EFAULT to the user.
>
> Fixes: 4d82724f7f2b ("drm/amdgpu: Add mapping info option for GEM_OP ioct=
l")
> Fixes: f9db1fc52ceb ("drm/amdgpu: Add ioctl to get all gem handles for a =
process")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 63eb75a579ce..2b58bc805374 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -1067,7 +1067,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, voi=
d *data,
>                  drm_exec_fini(&exec);
>
>                  if (num_mappings > 0 && num_mappings <=3D args->num_entr=
ies)
> -                       r =3D copy_to_user(u64_to_user_ptr(args->value), =
vm_entries, num_mappings * sizeof(*vm_entries));
> +                       if (copy_to_user(u64_to_user_ptr(args->value), vm=
_entries, num_mappings * sizeof(*vm_entries)))
> +                               r =3D -EFAULT;
>
>                  args->num_entries =3D num_mappings;
>
> @@ -1159,7 +1160,8 @@ int amdgpu_gem_list_handles_ioctl(struct drm_device=
 *dev, void *data,
>          args->num_entries =3D bo_index;
>
>          if (!ret)
> -               ret =3D copy_to_user(u64_to_user_ptr(args->entries), bo_e=
ntries, num_bos * sizeof(*bo_entries));
> +               if (copy_to_user(u64_to_user_ptr(args->entries), bo_entri=
es, num_bos * sizeof(*bo_entries)))
> +                       ret =3D -EFAULT;
>
>          kvfree(bo_entries);
>
> --
> 2.47.2
>
