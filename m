Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441F7EE73D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EC810E67E;
	Thu, 16 Nov 2023 19:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498CA10E67D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 19:14:41 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6ce2ea3a944so701354a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700162080; x=1700766880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MWiF1WqqxyBapoclv3EkYIJfdBOsrn+v/ULRkmttT6o=;
 b=JbfMTUoY/awWvQv6aY9GAUE3NFWhJaBJz7M2WHp/Ip+YH925pC15+38QObSX2vSE/Q
 /usAvi/B1cMdiSgvZ7C/qz2KFxTh97p8JvNCQHAi/JkoJjfSRM3AJu2PNnob2JfrS7bo
 GdIG46IWE8236TWY11hn5G7lTnleAuh6HvGyxTFNkAI/kSQif2xyNZoW8CUcY+BKh2z7
 MzvMELDWuJH+jLPITjf7nUnl7SnFMaG7WOjEGDC2VG6Pwc17U17SXS2r+9X302Zdubir
 1Vklp9DJYtPtv3BIw343T2xRZvUDXXaGJ3m6kPwJ5BYhP3eixX3NUhJw6j8UwgkiFZgz
 qNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700162080; x=1700766880;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MWiF1WqqxyBapoclv3EkYIJfdBOsrn+v/ULRkmttT6o=;
 b=JTi83INqb2TcpYNo3aruooj9ohNjctCVEFaOFQSt4B4PQFz/soGjJ9RUQoaP6TpwZF
 CArdHrfjZBDh9by+BVYWInYzOr3Fm+e2aGUgw8jYfHfZTko4c0MqYXEl4oL+EKjT8muB
 ga2AgZXAesj/EoBsNVFJHT1HQy5f7c7N+7ZDCk/PR3CTUO5VuVEqMuwDwgCbSrZREYZX
 kIfvUxtzuz0JKBsTKOH1LpHDJAF9rhCo3cPnOvliXTJbnBhyqcQyVWL6wbTGQ2jew5hJ
 m19mOExbCRzhqgJVg0f3qdLIZatAWkFm52hFOItRONzCuHUDEivFb3Iubkd5hT4NKF8l
 Xrgw==
X-Gm-Message-State: AOJu0YzPyDl9sja+kXn1svOcbjbjU3JyOzh3wqFrm42jw6jo/kp7oDOh
 2SxRFs25VGzT1y18mx9EpyqeF+9MHpcOpTMDyUFbJnFr
X-Google-Smtp-Source: AGHT+IEY+u54FfeNJdJrCOSqzUm/T+8SHxcra/gAeZNjk67vEALsXeSBFNp0n26t+lFgh7s8dBMuraIGNmmWWVYZMEk=
X-Received: by 2002:a05:6870:bb19:b0:1e9:9179:4c6f with SMTP id
 nw25-20020a056870bb1900b001e991794c6fmr21555134oab.49.1700162080572; Thu, 16
 Nov 2023 11:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-20-hkallweit1@gmail.com>
In-Reply-To: <20231113112344.719-20-hkallweit1@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:14:29 -0500
Message-ID: <CADnq5_O66nHTSuLNfu42bPYZ_4ZOeoq7UzpxiWfGuixbgSyJvg@mail.gmail.com>
Subject: Re: [PATCH 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC
 support
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-i2c@vger.kernel.org
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

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       |    1 -
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |    1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index f3680f4e6..ac901f4b4 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2102,7 +2102,6 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
>         if (!aux->ddc.algo)
>                 drm_dp_aux_init(aux);
>
> -       aux->ddc.class =3D I2C_CLASS_DDC;
>         aux->ddc.owner =3D THIS_MODULE;
>         aux->ddc.dev.parent =3D aux->dev;
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 0e0d0e76d..4376e2c1f 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5803,7 +5803,6 @@ static int drm_dp_mst_register_i2c_bus(struct drm_d=
p_mst_port *port)
>         aux->ddc.algo_data =3D aux;
>         aux->ddc.retries =3D 3;
>
> -       aux->ddc.class =3D I2C_CLASS_DDC;
>         aux->ddc.owner =3D THIS_MODULE;
>         /* FIXME: set the kdev of the port's connector as parent */
>         aux->ddc.dev.parent =3D parent_dev;
>
