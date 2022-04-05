Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD3F4F3603
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7A810E92E;
	Tue,  5 Apr 2022 13:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A794710E92B;
 Tue,  5 Apr 2022 13:56:22 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id t21so13446889oie.11;
 Tue, 05 Apr 2022 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YCAAPrKYGMpteO8HsHXIgowtM9srkXdQGvqaN8hMluo=;
 b=OnxBihp4lODvPg4Vh6Z4IKBACJYaqjE50m/IyiPn1KpCeBWtRR7gArmE1n+NVMMzGr
 BMyUcnQ7C4dOX1m1YLDqtnL3PjzqIl4PGNCGHdBcJ10LnpP3MDnrVKRQvTt65f7Yz574
 eUyH5Q1vBKrs+/fKTbicqsJnwHWgpm558b5iHzWKhiAm0XfDvGwYQxViXt7CU1Ju/ZVv
 6WPLhLk3qcfbQ6IVncp6ZAJLiJNd+IAvGGz5apzbdz1G2Q/pLAo94Su4/o7FUoyaLLBM
 AK+GeE4uPJU6RllgVZmCtCYrpWB6QcMtx3VisGFpLaIaV6J5+hFY43oBpCgdv9NtWfLZ
 Vwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YCAAPrKYGMpteO8HsHXIgowtM9srkXdQGvqaN8hMluo=;
 b=mViVv0N0qbLWohOB6KyH61VxsUi/Ax6jX/1FQdSM+2XUBkHOY5rQQ7Ksobekyx38Mg
 qXNzbGesTyGJ6XEtU1FsmrbsrOUXDkZvjAygOGmEKM+amFZkerP/sv7SBShazrB+NFyA
 OcaYCLLloKv6mbHt7lL/YlATHDcVb/byKgFVjlIRBx9W/q8cyaVyR+dhs+PldC2FYzeZ
 GzrvE8BTrzj0k0aGecg5odw1IC7GgvwPp4/o+Q2J1YYS103Deb+sKPYuXbFsUR5XkibY
 Dqi31tObZQGV3DhvGOlAlb6OU0oEDBnysKVANzRvZrhqvxtqWvWzgvTOt5krPVe3JXAg
 Ob4w==
X-Gm-Message-State: AOAM5315jryj+wlwsV9X3jHN+oL8V71pOGwSAnH7DBgf3n65XOEdlWUF
 XsYJZUxzvdJohdQ/qKwO1Cr8lupDM9tYw5s5kVen8Ac8
X-Google-Smtp-Source: ABdhPJzH/9FaaYtXvjsgUHrM11qiKYU7i9SkABBcgqx9plkb/ib6+CEk7Fig2tnoMRBs/644ht1mIt+GM4U4kyh5SpU=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr1372936oic.200.1649166981991; Tue, 05
 Apr 2022 06:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220404233306.2207-1-h0tc0d3@gmail.com>
In-Reply-To: <20220404233306.2207-1-h0tc0d3@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Apr 2022 09:56:10 -0400
Message-ID: <CADnq5_Mf3hpqnbgywSD68CmUe3dYrwjdZpFaMDrMWazDxBFWcg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Junk code
To: Grigory Vasilyev <h0tc0d3@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 Claudio Suarez <cssk@net-c.es>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 5, 2022 at 5:07 AM Grigory Vasilyev <h0tc0d3@gmail.com> wrote:
>
> Variable igp_lane_info always is 0. 0 & any value =3D 0 and false.
> In this way, all =D1=81onditional statements will false.
> Therefore, it is not clear what this code does.

It was leftover from when the code was ported from radeon.  The igp
lane info was available from the vbios on older APUs.  It's not
relevant on any asics supported by amdgpu.  I've applied the patch and
clarified the commit message.

Thanks,

Alex

>
> Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
> ---
>  .../gpu/drm/amd/amdgpu/atombios_encoders.c    | 21 -------------------
>  1 file changed, 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu=
/drm/amd/amdgpu/atombios_encoders.c
> index 2b0cc793291c..100bad2f5901 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -769,7 +769,6 @@ amdgpu_atombios_encoder_setup_dig_transmitter(struct =
drm_encoder *encoder, int a
>         int dp_clock =3D 0;
>         int dp_lane_count =3D 0;
>         int connector_object_id =3D 0;
> -       int igp_lane_info =3D 0;
>         int dig_encoder =3D dig->dig_encoder;
>         int hpd_id =3D AMDGPU_HPD_NONE;
>
> @@ -852,26 +851,6 @@ amdgpu_atombios_encoder_setup_dig_transmitter(struct=
 drm_encoder *encoder, int a
>                         else
>                                 args.v1.ucConfig |=3D ATOM_TRANSMITTER_CO=
NFIG_DIG1_ENCODER;
>
> -                       if ((adev->flags & AMD_IS_APU) &&
> -                           (amdgpu_encoder->encoder_id =3D=3D ENCODER_OB=
JECT_ID_INTERNAL_UNIPHY)) {
> -                               if (is_dp ||
> -                                   !amdgpu_dig_monitor_is_duallink(encod=
er, amdgpu_encoder->pixel_clock)) {
> -                                       if (igp_lane_info & 0x1)
> -                                               args.v1.ucConfig |=3D ATO=
M_TRANSMITTER_CONFIG_LANE_0_3;
> -                                       else if (igp_lane_info & 0x2)
> -                                               args.v1.ucConfig |=3D ATO=
M_TRANSMITTER_CONFIG_LANE_4_7;
> -                                       else if (igp_lane_info & 0x4)
> -                                               args.v1.ucConfig |=3D ATO=
M_TRANSMITTER_CONFIG_LANE_8_11;
> -                                       else if (igp_lane_info & 0x8)
> -                                               args.v1.ucConfig |=3D ATO=
M_TRANSMITTER_CONFIG_LANE_12_15;
> -                               } else {
> -                                       if (igp_lane_info & 0x3)
> -                                               args.v1.ucConfig |=3D ATO=
M_TRANSMITTER_CONFIG_LANE_0_7;
> -                                       else if (igp_lane_info & 0xc)
> -                                               args.v1.ucConfig |=3D ATO=
M_TRANSMITTER_CONFIG_LANE_8_15;
> -                               }
> -                       }
> -
>                         if (dig->linkb)
>                                 args.v1.ucConfig |=3D ATOM_TRANSMITTER_CO=
NFIG_LINKB;
>                         else
> --
> 2.35.1
>
