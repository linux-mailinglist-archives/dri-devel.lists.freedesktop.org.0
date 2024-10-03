Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DBB98F342
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 17:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B6410E21E;
	Thu,  3 Oct 2024 15:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QAZOw1tr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57D610E21E;
 Thu,  3 Oct 2024 15:54:42 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2e0ad414718so188310a91.2; 
 Thu, 03 Oct 2024 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727970882; x=1728575682; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yGeUrKYFIPCVFsOqzylmOrv3kBoBBc0wc9fqVx2R8I=;
 b=QAZOw1trSZSMpPOgFmf/X5OYpSXzrQZhlYCTX9d2EBlnlHk+Ldae6dx+H3bDOM10IH
 3MqwboJn8kfS/WBtR/5xlvkFzZRSzLcYZifi/XlkS9FWru8PBEGJJr5xY7PzMuMris8W
 rw3vJPWSXkyqc7FXIfqNlg5uHwqxyE59ErXyFj67Z8J+X/nTr++N0ZtDYgOOL6noQaqW
 T53m1lCf2iJ2qXYKElm+RsTe+0Vz6q2vkxFtQVknCFfZf+tZhJGKpbIIemJjGNZJuJVi
 s7zJcD4ctCRAlOVcvUkJoYLY7okd2P6GFh+tib1RjJv8mVxL2HhlDBUeoKq3TM35UQWZ
 PTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727970882; x=1728575682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0yGeUrKYFIPCVFsOqzylmOrv3kBoBBc0wc9fqVx2R8I=;
 b=hWpn5B0HlkyZo0FIv/hqYutjDvseqoYQdhbpMZlpKpp6VCKOEv3d4ynTpE3rGqZzy+
 iemkRD3zv5ZxHKI7IWBWZwMcE0MYCEwApy1riaIKsm59gcOiwbI99ZMQ0ihDLZErQ1av
 +szg/yVfHc88YpoGlpn7yOtZyaIVrksooPd3/DWkl1xgD/wu/G7Sb/E8gNQawWQbr24J
 WblLvcSxmhoqxWiyFRoS/ffUshbTrR2Nvwr8m3Eh46+RXugfMWGWif2BdosU0ua6O+PV
 7reIMUn8cBhCt0Kz+vU6/paXHzMQrruIuT5ZD+ZTaASNyK79GU4A8uH4Uzzru3OMSS/w
 gSkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZTYR8HagdNAyymoHQzxXL59HPRUKkt6AEMDyQWKchoZRzsum3mA1O4UuDVDYNAYtArluJOfkI@lists.freedesktop.org,
 AJvYcCVtEk3nRW20CqaUX1D+NcCw2RiS3xGNOjnL6Iw4TTnYohc9oPqsycqaypkrx3rk8F/hBpEmNamjAyjM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnaSAijwWw0TJKlEQiVQPl1UNVtMPTW3ZI9TQ+kpG8J0lGcIgp
 Bpmb4qpcIl78+7dAuBC7jd44LcqYGG0uorczeAHMdyVp2KBot/BLU7nDnlWmPUT4GklvKGJNOEK
 5OThdAmqYMcyvckQBD66XO9Mn2Yk=
X-Google-Smtp-Source: AGHT+IH+eTjTi91vp6di708DRWo+fli07tV+SgXGhpx5vBaiOKNM8nEPU0iifLJQbB3mv3n732aR5ljw2ZJKiemM5cM=
X-Received: by 2002:a17:90b:3c6:b0:2da:a6d4:fd5d with SMTP id
 98e67ed59e1d1-2e184527f84mr3469685a91.1.1727970882126; Thu, 03 Oct 2024
 08:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241003060650.18454-1-wuhoipok@gmail.com>
In-Reply-To: <20241003060650.18454-1-wuhoipok@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Oct 2024 11:54:30 -0400
Message-ID: <CADnq5_PA37NQ52-Y8r6JEtXDRwPehzM5+cxysiZgVks4AkivjQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: add late_register for connector
To: Wu Hoi Pok <wuhoipok@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

+ Hans

On Thu, Oct 3, 2024 at 2:33=E2=80=AFAM Wu Hoi Pok <wuhoipok@gmail.com> wrot=
e:
>
> This is a fix patch not tested yet,
> for a bug I introduce in previous rework of radeon driver.
> The bug is a null dereference in 'aux.dev', which is the
> 'device' not registered, resulting in kernel panic. By having
> 'late_register', the connector should be registered after
> 'drm_dev_register' automatically.
>
> Please help testing thank you.
>
> Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
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
