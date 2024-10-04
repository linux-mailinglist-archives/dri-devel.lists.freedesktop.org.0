Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B62990522
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 16:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E991E10EA13;
	Fri,  4 Oct 2024 14:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dQfGJPCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D98510EA12;
 Fri,  4 Oct 2024 14:01:12 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2e07d87adc2so307790a91.3; 
 Fri, 04 Oct 2024 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728050471; x=1728655271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMwn901ZRLoRHXVyYDozCoh9nimOdyplKHDEtmswe7U=;
 b=dQfGJPCsdU5ZOb/YI70f4q+YRWWYfz5SVmXbppGbgxpQorePOek2XKsF3V2CUD/mtU
 cFjW99WRezZ/egk5bSvXS3Csz8PNZCn1z9CwNvtS+K39P3W+2Sje+glBIVYci7OgrOBv
 afd/OB1a4TfJuyINPVtpkJ9sYvLIO2Y8b9rhyIUzghBQaMElbhJb1vAfiU8U1rtT4E4Q
 auNBWYWuWQA4N/Owx/IU2/mUE1OPYKn7bxdpVPN6Mxt+ZAWATS+NOxlAHixm+DEnfVLG
 1uw0Lx1cfM3D7AQC717MsJvCFYV5D0m+cR52QjZ4XXTW4QR54fsiUyKsp8APzkpahKBq
 I+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728050471; x=1728655271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KMwn901ZRLoRHXVyYDozCoh9nimOdyplKHDEtmswe7U=;
 b=aRuNqq0jN52bo+vQEh3FXjeVYnKrNce36cQzdYSsdZSnGoY79qJut2rM3NEWAU4krC
 znfUT/GunKD8lUOyI2TCC1aZgF7wyzXlm+MzrnSYBg6hxKC0MKSqirxRvEx9PCipZfnS
 SqRD/ZiL4Ww1V97+0Hco8MyfTVZt5mbfCbkL67pNCfkskz/+qBkUhgk6OYni7Byj295W
 +F8h13MqJ72em18KkjYYIx9LjOu4pwHEKu/4zJuWO1NDcNbLZa9d1B+XfC3HUB6NL9GM
 lTeA7o4GzIA+sDTnt/MKk2MNTZJjmWin961EbwVTeNxYcrJb10faVOHmz8r57b1d7fXI
 9d7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0F9P6s3u0zW2ZoF908EGfRZ9EGzkm/eGkCRCPVZhBZifxdzQSfak1GuQlVtRc+odGgtFSBM7hEI8v@lists.freedesktop.org,
 AJvYcCXTW4mypefh3greFSWnbeLzKJ8foFAG5k3NL33hfgs+uKWxGXgRTnAJE8mbUOml+UOdAG21dbeR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcO3q6NkMepmcRzxkHAUR+RnT+27kbdYgR+z3xKdFeXHAWliDc
 v656Tn0f1L8SVOkhnHlvIUEWH82+/J2mhigkxZ0C5H5vPRQZ9dbafrqelWcjINeEBXCG6QX8Ey+
 8WRv7jMXxwKrlgMXaKe2vcEzBFNc0jnwJ
X-Google-Smtp-Source: AGHT+IEJ1tRqM5NLWvzkRdlOsKIDAq7K9+lPQKlj31f3AEwobSgsbCs+ky8e9auMeCNS8p7/tSoWstvR8FyH9iCmeAs=
X-Received: by 2002:a17:90a:c88:b0:2e0:9d3f:4292 with SMTP id
 98e67ed59e1d1-2e1e62117bemr1411095a91.1.1728050471300; Fri, 04 Oct 2024
 07:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241004010601.3387-1-wuhoipok@gmail.com>
In-Reply-To: <20241004010601.3387-1-wuhoipok@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Oct 2024 10:00:59 -0400
Message-ID: <CADnq5_Nt=8Lx6KOXHf0DHmqo2O7dYKDTfGCz-w_Hv+__=BqP9w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon: add late_register for connector
To: Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
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

On Thu, Oct 3, 2024 at 9:18=E2=80=AFPM Wu Hoi Pok <wuhoipok@gmail.com> wrot=
e:
>
> The patch is to solve null dereference in 'aux.dev', which is
> introduced in recent radeon rework. By having 'late_register',
> the connector should be registered after 'drm_dev_register'
> automatically, where in before it is the opposite.
>
> Fixes: 90985660ba48 ("drm/radeon: remove load callback from kms_driver")
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/atombios_dp.c       |  9 ++-------
>  drivers/gpu/drm/radeon/radeon_connectors.c | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeo=
n/atombios_dp.c
> index fca8b08535a5..6328627b7c34 100644
> --- a/drivers/gpu/drm/radeon/atombios_dp.c
> +++ b/drivers/gpu/drm/radeon/atombios_dp.c
> @@ -228,10 +228,8 @@ void radeon_dp_aux_init(struct radeon_connector *rad=
eon_connector)
>  {
>         struct drm_device *dev =3D radeon_connector->base.dev;
>         struct radeon_device *rdev =3D dev->dev_private;
> -       int ret;
>
>         radeon_connector->ddc_bus->rec.hpd =3D radeon_connector->hpd.hpd;
> -       radeon_connector->ddc_bus->aux.dev =3D radeon_connector->base.kde=
v;
>         radeon_connector->ddc_bus->aux.drm_dev =3D radeon_connector->base=
.dev;
>         if (ASIC_IS_DCE5(rdev)) {
>                 if (radeon_auxch)
> @@ -242,11 +240,8 @@ void radeon_dp_aux_init(struct radeon_connector *rad=
eon_connector)
>                 radeon_connector->ddc_bus->aux.transfer =3D radeon_dp_aux=
_transfer_atom;
>         }
>
> -       ret =3D drm_dp_aux_register(&radeon_connector->ddc_bus->aux);
> -       if (!ret)
> -               radeon_connector->ddc_bus->has_aux =3D true;
> -
> -       WARN(ret, "drm_dp_aux_register() failed with error %d\n", ret);
> +       drm_dp_aux_init(&radeon_connector->ddc_bus->aux);
> +       radeon_connector->ddc_bus->has_aux =3D true;
>  }
>
>  /***** general DP utility functions *****/
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm=
/radeon/radeon_connectors.c
> index 528a8f3677c2..f9c73c55f04f 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -1786,6 +1786,20 @@ static enum drm_mode_status radeon_dp_mode_valid(s=
truct drm_connector *connector
>         return MODE_OK;
>  }
>
> +static int
> +radeon_connector_late_register(struct drm_connector *connector)
> +{
> +       struct radeon_connector *radeon_connector =3D to_radeon_connector=
(connector);
> +       int r =3D 0;
> +
> +       if (radeon_connector->ddc_bus->has_aux) {
> +               radeon_connector->ddc_bus->aux.dev =3D radeon_connector->=
base.kdev;
> +               r =3D drm_dp_aux_register(&radeon_connector->ddc_bus->aux=
);
> +       }
> +
> +       return r;
> +}
> +
>  static const struct drm_connector_helper_funcs radeon_dp_connector_helpe=
r_funcs =3D {
>         .get_modes =3D radeon_dp_get_modes,
>         .mode_valid =3D radeon_dp_mode_valid,
> @@ -1800,6 +1814,7 @@ static const struct drm_connector_funcs radeon_dp_c=
onnector_funcs =3D {
>         .early_unregister =3D radeon_connector_unregister,
>         .destroy =3D radeon_connector_destroy,
>         .force =3D radeon_dvi_force,
> +       .late_register =3D radeon_connector_late_register,
>  };
>
>  static const struct drm_connector_funcs radeon_edp_connector_funcs =3D {
> @@ -1810,6 +1825,7 @@ static const struct drm_connector_funcs radeon_edp_=
connector_funcs =3D {
>         .early_unregister =3D radeon_connector_unregister,
>         .destroy =3D radeon_connector_destroy,
>         .force =3D radeon_dvi_force,
> +       .late_register =3D radeon_connector_late_register,
>  };
>
>  static const struct drm_connector_funcs radeon_lvds_bridge_connector_fun=
cs =3D {
> @@ -1820,6 +1836,7 @@ static const struct drm_connector_funcs radeon_lvds=
_bridge_connector_funcs =3D {
>         .early_unregister =3D radeon_connector_unregister,
>         .destroy =3D radeon_connector_destroy,
>         .force =3D radeon_dvi_force,
> +       .late_register =3D radeon_connector_late_register,
>  };
>
>  void
> --
> 2.46.2
>
