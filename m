Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AB0984A19
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 19:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFC310E8C3;
	Tue, 24 Sep 2024 17:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BIURoR3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9538710E8C3;
 Tue, 24 Sep 2024 17:05:16 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2d8a4bad404so438401a91.1; 
 Tue, 24 Sep 2024 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727197516; x=1727802316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lccss7b+PPPdgDMWVV+dLTdvaIaRkSluice+dhJE7yM=;
 b=BIURoR3liYgdJjNarYxJVRUCo/QAcObH1klRnRMnw2F/EMfjv3eBeLjD6EHZPx9e/4
 3mjEQFDBoMfkNkRtG5FUbq2NLfQqKzQJlwUeQOH9BM0JgUc6WGnf6YypDzWGL+b9Ssxh
 4I46OAaxmNEkXLVg5s6cXsEPv5svgWPyIPRxq9ytw0ocU5j9WJxrQYF4Huld5++O3jxO
 y/e2+Trcsq769QI4XnCn6mq/gPk1wHj6EBK7cIy2D6iPvHyT9ido1GWeYyRs4uylNTry
 ws0laklIbPD+lIxOOT8G6UzPDlfkX5Ik7yU6jeuQ9KafUGgXV65D9xxkQ5bdGcvjHFzz
 OMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727197516; x=1727802316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lccss7b+PPPdgDMWVV+dLTdvaIaRkSluice+dhJE7yM=;
 b=aIsuQ/thyw/XcQKloFYtBV57lmtNy/ms4pztZyX88o2cmhDod9vAi2HAMKwyVT0vZ9
 T/dEUQWMAI9Ws8kxZVVDm6JzSqMtytgc+J84RztdzS4iHCbirt2WHG6PsNBEKVc7pQom
 s3DUZr5nPvYQzpLX1w+jennsKgu/8c4DadYER4+T1Kk6WiVPL163cEMEiLCw2I8UYvVs
 W9JTyIpWDZNm+jUDsnMzqObbqfhsR1JpgKDn86UqqibKZRu5hO1ouZinXh5sac2tkUGi
 7hjv7vaZWlLtNaX/YBLx1+I/+kYSyytQlU2ESrQJQ4Tu1Lu8OZKFaBLDE66pXT6Juwa0
 rIEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh/cczT1C+UBMb/rjhvhKL3wJT+BCdlMFF9+C6jUjiBcliw0yM0BRuh2ckt7DS4+NCM7gW62g6@lists.freedesktop.org,
 AJvYcCWoUeQgNIu3m1+bHmxlMhenire8xv/Ypd5w+1S08+7R6JKlX6APFX9n6WmDwynvMGbsy3nh51sYlnN+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuYpVeDxpfCAKSMMciISm18AiXN5MiWRDGiAVts669JX03LFIq
 Z/tPFmAcHpO2bMi7d2T4ubA37ovY5BZUxwckEY1YNUNnbem8bd2olgKJhQt7To8XuMy6e0yoP8p
 E8pZrzutrwtypfrWLUIokKhlnW+U=
X-Google-Smtp-Source: AGHT+IEm1M/263IJX2uy0cLLXAid7dgO/+hbup76IjqANE9iuRdSDZBYcCHLsVy8aY8VjxriJB40uwPp8Ry3nLtc5M0=
X-Received: by 2002:a17:90a:e513:b0:2d8:8cfd:585d with SMTP id
 98e67ed59e1d1-2e05802da10mr1707599a91.2.1727197516117; Tue, 24 Sep 2024
 10:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240923012446.4965-1-linux@treblig.org>
 <20240923012446.4965-6-linux@treblig.org>
In-Reply-To: <20240923012446.4965-6-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2024 13:05:04 -0400
Message-ID: <CADnq5_PiB1eofAzdBvq8yxZypkv-JKutwqy7US9CQ4CV_R218w@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: Remove unused amdgpu_i2c functions
To: linux@treblig.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
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

Alex

On Sun, Sep 22, 2024 at 9:43=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> amdgpu_i2c_add and amdgpu_i2c_init were added in 2015's commit
> d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
> but never used.
>
> Remove them.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c | 25 -------------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h |  4 ----
>  2 files changed, 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_i2c.c
> index 00d6211e0fbf..f0765ccde668 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
> @@ -225,15 +225,6 @@ void amdgpu_i2c_destroy(struct amdgpu_i2c_chan *i2c)
>         kfree(i2c);
>  }
>
> -/* Add the default buses */
> -void amdgpu_i2c_init(struct amdgpu_device *adev)
> -{
> -       if (amdgpu_hw_i2c)
> -               DRM_INFO("hw_i2c forced on, you may experience display de=
tection problems!\n");
> -
> -       amdgpu_atombios_i2c_init(adev);
> -}
> -
>  /* remove all the buses */
>  void amdgpu_i2c_fini(struct amdgpu_device *adev)
>  {
> @@ -247,22 +238,6 @@ void amdgpu_i2c_fini(struct amdgpu_device *adev)
>         }
>  }
>
> -/* Add additional buses */
> -void amdgpu_i2c_add(struct amdgpu_device *adev,
> -                   const struct amdgpu_i2c_bus_rec *rec,
> -                   const char *name)
> -{
> -       struct drm_device *dev =3D adev_to_drm(adev);
> -       int i;
> -
> -       for (i =3D 0; i < AMDGPU_MAX_I2C_BUS; i++) {
> -               if (!adev->i2c_bus[i]) {
> -                       adev->i2c_bus[i] =3D amdgpu_i2c_create(dev, rec, =
name);
> -                       return;
> -               }
> -       }
> -}
> -
>  /* looks up bus based on id */
>  struct amdgpu_i2c_chan *
>  amdgpu_i2c_lookup(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_i2c.h
> index 63c2ff7499e1..21e3d1dad0a1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h
> @@ -28,11 +28,7 @@ struct amdgpu_i2c_chan *amdgpu_i2c_create(struct drm_d=
evice *dev,
>                                           const struct amdgpu_i2c_bus_rec=
 *rec,
>                                           const char *name);
>  void amdgpu_i2c_destroy(struct amdgpu_i2c_chan *i2c);
> -void amdgpu_i2c_init(struct amdgpu_device *adev);
>  void amdgpu_i2c_fini(struct amdgpu_device *adev);
> -void amdgpu_i2c_add(struct amdgpu_device *adev,
> -                   const struct amdgpu_i2c_bus_rec *rec,
> -                   const char *name);
>  struct amdgpu_i2c_chan *
>  amdgpu_i2c_lookup(struct amdgpu_device *adev,
>                   const struct amdgpu_i2c_bus_rec *i2c_bus);
> --
> 2.46.1
>
