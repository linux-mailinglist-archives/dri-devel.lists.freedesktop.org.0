Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC47EE743
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3800A10E67D;
	Thu, 16 Nov 2023 19:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BEF10E67D;
 Thu, 16 Nov 2023 19:15:30 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1e9a757e04eso1157620fac.0; 
 Thu, 16 Nov 2023 11:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700162129; x=1700766929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrT52wuzqJEA/NKzytgl6uhJdsSSy1qeuj6M28CmNKE=;
 b=Qf+rxziTmuPzJkYAfuo8K7bdConcDZ7PE31Gzwx1AbSk8iDsTvy42E3nHAmC4a3REl
 Jvo61vZisPXQZX7xIzOZnrukgnYPifWtL6sstkws/eyCKCSgT74mqtcJe0wh7feaAo9V
 d4ddInH83Y6rYqna0h+sO+Sf3gR2NTVLFASmc2kRK66Aiga4XgzoPe+fE/8KyJWMc2jJ
 gbR6ei0up6QWvpC3mDmbPCQbEX0GdUXKGHi+6Lfs030OEpJWAcfyjLu2xH5fVbsnFKOK
 wu3i5pgnis5gNo3bcoqxOpopibSBBOlP5sggKGuTsWlCN2RQBMX+jIv8QaJxCYyVqmGQ
 hE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700162129; x=1700766929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrT52wuzqJEA/NKzytgl6uhJdsSSy1qeuj6M28CmNKE=;
 b=Ewkhdjco/HgigcRJpbCxbGEiusx0MeztqLYlWLlCGmOW19eFgFDb4TKum/t+oOH/XN
 ecbA3mbGZ/z7kw5pHtzzJZW4ncgLRfA41zy9IBuo979ynqRLX+KI4p3EzAKNHL8tl3tQ
 ry6Lx7KlfuxrrlwO3rO6Xm7i2Cj8YjwQnheK3SnE98RxRzmjZbeIIVvlRtJz0Cjx3TmF
 WdTNa8y0XgzeC7Sl2T0SxnGv+z4PfwsSdF66fAI63bbwgvW5KGvL5AV4fsPgVk0eDYfw
 FR6aojFseCoL9MQTbfdqodFjoMXfZBHUapmhuHjIz85UMEFL7xmhSuGul4fm/DGXvbmS
 uNAw==
X-Gm-Message-State: AOJu0YwyhQQXMl3wdstZoQnXhATGMSIgcj6BaGSKYEr6XrX0RhjL/jIr
 SDduRiGPw+aWCNp6MZAhP+xxpQPkAeorPveBZgWjiYLDwqg=
X-Google-Smtp-Source: AGHT+IEEVyfMLpaqabnwIIa7eFVc0DcJwSI3o3KzHkulFTuCGoTzFHhmdC1gw1/qtIymgg8GAkfktThR+JudbyajZhs=
X-Received: by 2002:a05:6870:95a4:b0:1e9:e8c7:bef6 with SMTP id
 k36-20020a05687095a400b001e9e8c7bef6mr1394483oao.18.1700162129700; Thu, 16
 Nov 2023 11:15:29 -0800 (PST)
MIME-Version: 1.0
References: <839c0546-9bad-4b5a-9216-d5e3bab32370@gmail.com>
In-Reply-To: <839c0546-9bad-4b5a-9216-d5e3bab32370@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:15:18 -0500
Message-ID: <CADnq5_OURY17Oih9iiCA9byL=UNK05P5m-Bry8KuA2tW=VVF7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Remove I2C_CLASS_SPD support
To: Heiner Kallweit <hkallweit1@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 Wolfram Sang <wsa@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 6:37=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
>
> I2C_CLASS_SPD was used to expose the EEPROM content to user space,
> via the legacy eeprom driver. Now that this driver has been removed,
> we can remove I2C_CLASS_SPD support. at24 driver with explicit
> instantiation should be used instead.
>
> If in doubt this patch could be applied via the i2c tree.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this via the i2c tree if you prefer.

Alex

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c   | 1 -
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 1 -
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index 1a6675d70..bc56a29e6 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -1527,7 +1527,6 @@ static int aldebaran_i2c_control_init(struct smu_co=
ntext *smu)
>         smu_i2c->port =3D 0;
>         mutex_init(&smu_i2c->mutex);
>         control->owner =3D THIS_MODULE;
> -       control->class =3D I2C_CLASS_SPD;
>         control->dev.parent =3D &adev->pdev->dev;
>         control->algo =3D &aldebaran_i2c_algo;
>         snprintf(control->name, sizeof(control->name), "AMDGPU SMU 0");
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> index 82c4e1f1c..c0e62bab9 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> @@ -2720,7 +2720,6 @@ static int smu_v13_0_0_i2c_control_init(struct smu_=
context *smu)
>                 smu_i2c->port =3D i;
>                 mutex_init(&smu_i2c->mutex);
>                 control->owner =3D THIS_MODULE;
> -               control->class =3D I2C_CLASS_SPD;
>                 control->dev.parent =3D &adev->pdev->dev;
>                 control->algo =3D &smu_v13_0_0_i2c_algo;
>                 snprintf(control->name, sizeof(control->name), "AMDGPU SM=
U %d", i);
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> index 891605d49..9de91bd77 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> @@ -1884,7 +1884,6 @@ static int smu_v13_0_6_i2c_control_init(struct smu_=
context *smu)
>                 smu_i2c->port =3D i;
>                 mutex_init(&smu_i2c->mutex);
>                 control->owner =3D THIS_MODULE;
> -               control->class =3D I2C_CLASS_SPD;
>                 control->dev.parent =3D &adev->pdev->dev;
>                 control->algo =3D &smu_v13_0_6_i2c_algo;
>                 snprintf(control->name, sizeof(control->name), "AMDGPU SM=
U %d", i);
> --
> 2.42.1
>
