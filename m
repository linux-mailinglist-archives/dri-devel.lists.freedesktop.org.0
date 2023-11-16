Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541807EE74A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E558210E682;
	Thu, 16 Nov 2023 19:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC60A10E680;
 Thu, 16 Nov 2023 19:16:28 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6ce2fc858feso651735a34.3; 
 Thu, 16 Nov 2023 11:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700162188; x=1700766988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJfsU8TyNZy07krkN4D/GXW5S5/EGPw3AYjVhWjd3Xk=;
 b=UAvZiA0U70Yr7mr5bvUNA6vEr8iTAWy6MjG6Bct+10ECaKbUuWKaLwX/BR3SSfZMSZ
 ybg9OMIsw9Z3otrEHXgMe5NEBHvCJ6AA6U7hEFDtoSXG7IK3UNmQDQAKKqxzUFu1n5PN
 aWKsWX5VMjCVW5HNrxeODaMThEwHkSHVKLMxJI2OkdC3gAe81w6SZ8QoKLEkKlt2ODnR
 qBnYkJ1vVyUwv98WjYITZL7dBRxE607pN2FepoM7Y7yRB0bGbWb1IJ4xICOA7u3CXEfD
 ppVsQ2ocK5/eQlT1tYdQMDmZKQPEaW5uRCaO8PHfXJ2wTEJQ7O44Fb8C72MGK2+nmvQu
 dFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700162188; x=1700766988;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJfsU8TyNZy07krkN4D/GXW5S5/EGPw3AYjVhWjd3Xk=;
 b=FtK3DjRaGO6M+hAiJ7yFdk+OBSq5eIbboeppYHPoSvbBg7w9m+0P47dHuHYxY/tHvh
 TKUwOvRuYC04vT4q1J/+Qr2vOir6X7edgY4jKmcSgeEDRf0f1QqpqFTdZn6OCv2f7ztS
 e+IZVv3FKEyEHQHZbXW8HG5TtZqpH7UkMHY+ZCaeqWBZdZBCjAkdoE2+pYEx0q0G6lLz
 n5luQOY6+nAMdIeH9P6EGrQU0AHV7Rj6cMNgB+E79Zxnbt6np7eOjakyn1TlND1p6PJR
 a/VMwMljqYqJTePqXNHeq7/quEht9Q23fcpPFy788pGYVBn4B0WADcEpaste2ogqw2Iu
 6JYg==
X-Gm-Message-State: AOJu0YzrmiATpJGddkjsoGKzD/Scpd6ffNaiMt2TGB7E0ox1hq5W3YO2
 PhEgvH27/nARv3FVdKKjqb4mJmxsMQ54cb29MRI=
X-Google-Smtp-Source: AGHT+IH1vNrw5v/An0taWdCw0btGDRa71oZV0TEwIktj88J12G++fhmCiIcWXFXTRS4R2QvxslI1LRmieXxGxzE+l3c=
X-Received: by 2002:a05:6870:5494:b0:1ea:ce71:dd13 with SMTP id
 f20-20020a056870549400b001eace71dd13mr18093837oan.28.1700162187978; Thu, 16
 Nov 2023 11:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-8-hkallweit1@gmail.com>
In-Reply-To: <20231113112344.719-8-hkallweit1@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:16:17 -0500
Message-ID: <CADnq5_OQ+hX5_vtKKRndSGZf1Gv8pW9E52ij7LdGb_eeQCgSQg@mail.gmail.com>
Subject: Re: [PATCH 07/20] drivers/gpu/drm: remove I2C_CLASS_DDC support
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Wolfram Sang <wsa@kernel.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 6:24=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
>
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>
> Preferably this series should be applied via the i2c tree.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Technically two separate drivers, if you feel like splitting it.  Either wa=
y,
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this via the i2c tree if you prefer.

Alex

>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c |    1 -
>  drivers/gpu/drm/radeon/radeon_i2c.c     |    1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_i2c.c
> index 82608df43..d79cb13e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
> @@ -175,7 +175,6 @@ struct amdgpu_i2c_chan *amdgpu_i2c_create(struct drm_=
device *dev,
>
>         i2c->rec =3D *rec;
>         i2c->adapter.owner =3D THIS_MODULE;
> -       i2c->adapter.class =3D I2C_CLASS_DDC;
>         i2c->adapter.dev.parent =3D dev->dev;
>         i2c->dev =3D dev;
>         i2c_set_adapdata(&i2c->adapter, i2c);
> diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon=
/radeon_i2c.c
> index 314d066e6..3d174390a 100644
> --- a/drivers/gpu/drm/radeon/radeon_i2c.c
> +++ b/drivers/gpu/drm/radeon/radeon_i2c.c
> @@ -918,7 +918,6 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm_=
device *dev,
>
>         i2c->rec =3D *rec;
>         i2c->adapter.owner =3D THIS_MODULE;
> -       i2c->adapter.class =3D I2C_CLASS_DDC;
>         i2c->adapter.dev.parent =3D dev->dev;
>         i2c->dev =3D dev;
>         i2c_set_adapdata(&i2c->adapter, i2c);
>
