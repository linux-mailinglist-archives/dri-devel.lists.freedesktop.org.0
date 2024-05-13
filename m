Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ED28C457E
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22BB10E897;
	Mon, 13 May 2024 16:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lT2O2ydC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFC610E8A0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:59:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 98875CE0C6C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3C7C4AF0A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715619581;
 bh=JitgSMLRZNI4ny1UnV3o1usQaHTQC5I0Tk9f27RylSQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lT2O2ydCn169pZ6YH3hZwo6Heyyp70Py//tELvxYzOkNoYwDUkxOEYyMH4hIIseLV
 MGQLolSW/qiDKsoaU96xrQ/EO4LmABCcft0V2wqUBTBrYPBJ94Q0cRvTA2ho+ZUKVR
 wTomjz+qVTULYZpRbSjPKl0CC3JUhbqgBgjFZibk/rrerlyoNb44QfXwSamDrUdirZ
 wmrs0MJZmahc+TXDLcMPd5taMUMG/jbIF7bzilTPXo6wZiikbRrMlE1V4pqfHhwg3k
 8LEcqwj05B2/9Pkiao1XDhLOm5rfegZUiaFq8eSCu1mnuJmSeBVUtUnxfBmrDhML97
 LrFgpuSTWvIlQ==
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-23f9d07829bso2465745fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:59:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YzWlxQc7BIg6BMAN1CmzaCVz11BljgMeVRPAVXR//s2nSEfs7bU
 v8MGyQ8aSV/puoZ3z4wBP34zENm8oBAnLAcwZqlVR44YQl8cmygs6AS/HvXhvnzJAbaydHDxywi
 6xrT93oif8pWWPEfp2xhF0ybYMntJbqqlFael/Q==
X-Google-Smtp-Source: AGHT+IGlxh1Dy5ysKOVds09zArKG9c9noCluyALHfc5Bn+YbXeExnTTxJ5+knqKIQqmNb6mYhwGsmaYQo1ct2IYqvuU=
X-Received: by 2002:a05:6871:729a:b0:23c:a6f8:9362 with SMTP id
 586e51a60fabf-24172a76ff6mr13846720fac.13.1715619580755; Mon, 13 May 2024
 09:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715353572.git.jani.nikula@intel.com>
 <b2bdec9161ddcbf79c8516aeea508a9903bd0074.1715353572.git.jani.nikula@intel.com>
In-Reply-To: <b2bdec9161ddcbf79c8516aeea508a9903bd0074.1715353572.git.jani.nikula@intel.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 18:59:29 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5Og9E_thegG1-spCrYvQzuzq2tSigQ5huLHkOYE65GEw@mail.gmail.com>
Message-ID: <CAN6tsi5Og9E_thegG1-spCrYvQzuzq2tSigQ5huLHkOYE65GEw@mail.gmail.com>
Subject: Re: [RESEND 3/6] drm/radeon: remove radeon_connector_edid() and stop
 using edid_blob_ptr
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>
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

On Fri, May 10, 2024 at 5:08=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> radeon_connector_edid() copies the EDID from edid_blob_ptr as a side
> effect if radeon_connector->edid isn't initialized. However, everywhere
> that the returned EDID is used, the EDID should have been set
> beforehands.
>
> Only the drm EDID code should look at the EDID property, anyway, so stop
> using it.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/radeon/radeon_audio.c      |  7 ++++---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 15 ---------------
>  drivers/gpu/drm/radeon/radeon_mode.h       |  2 --
>  3 files changed, 4 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/rade=
on/radeon_audio.c
> index 16c10db3ce6f..0bcd767b9f47 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -303,6 +303,7 @@ void radeon_audio_endpoint_wreg(struct radeon_device =
*rdev, u32 offset,
>  static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
>  {
>         struct drm_connector *connector =3D radeon_get_connector_for_enco=
der(encoder);
> +       struct radeon_connector *radeon_connector =3D to_radeon_connector=
(connector);
>         struct radeon_encoder *radeon_encoder =3D to_radeon_encoder(encod=
er);
>         struct cea_sad *sads;
>         int sad_count;
> @@ -310,7 +311,7 @@ static void radeon_audio_write_sad_regs(struct drm_en=
coder *encoder)
>         if (!connector)
>                 return;
>
> -       sad_count =3D drm_edid_to_sad(radeon_connector_edid(connector), &=
sads);
> +       sad_count =3D drm_edid_to_sad(radeon_connector->edid, &sads);
>         if (sad_count < 0)
>                 DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>         if (sad_count <=3D 0)
> @@ -326,6 +327,7 @@ static void radeon_audio_write_sad_regs(struct drm_en=
coder *encoder)
>  static void radeon_audio_write_speaker_allocation(struct drm_encoder *en=
coder)
>  {
>         struct drm_connector *connector =3D radeon_get_connector_for_enco=
der(encoder);
> +       struct radeon_connector *radeon_connector =3D to_radeon_connector=
(connector);
>         struct radeon_encoder *radeon_encoder =3D to_radeon_encoder(encod=
er);
>         u8 *sadb =3D NULL;
>         int sad_count;
> @@ -333,8 +335,7 @@ static void radeon_audio_write_speaker_allocation(str=
uct drm_encoder *encoder)
>         if (!connector)
>                 return;
>
> -       sad_count =3D drm_edid_to_speaker_allocation(radeon_connector_edi=
d(connector),
> -                                                  &sadb);
> +       sad_count =3D drm_edid_to_speaker_allocation(radeon_connector->ed=
id, &sadb);
>         if (sad_count < 0) {
>                 DRM_DEBUG("Couldn't read Speaker Allocation Data Block: %=
d\n",
>                           sad_count);
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm=
/radeon/radeon_connectors.c
> index 81b5c3c8f658..80879e946342 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -255,21 +255,6 @@ static struct drm_encoder *radeon_find_encoder(struc=
t drm_connector *connector,
>         return NULL;
>  }
>
> -struct edid *radeon_connector_edid(struct drm_connector *connector)
> -{
> -       struct radeon_connector *radeon_connector =3D to_radeon_connector=
(connector);
> -       struct drm_property_blob *edid_blob =3D connector->edid_blob_ptr;
> -
> -       if (radeon_connector->edid) {
> -               return radeon_connector->edid;
> -       } else if (edid_blob) {
> -               struct edid *edid =3D kmemdup(edid_blob->data, edid_blob-=
>length, GFP_KERNEL);
> -               if (edid)
> -                       radeon_connector->edid =3D edid;
> -       }
> -       return radeon_connector->edid;
> -}
> -
>  static void radeon_connector_get_edid(struct drm_connector *connector)
>  {
>         struct drm_device *dev =3D connector->dev;
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeo=
n/radeon_mode.h
> index 546381a5c918..e0a5af180801 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -701,8 +701,6 @@ extern u16 radeon_connector_encoder_get_dp_bridge_enc=
oder_id(struct drm_connecto
>  extern bool radeon_connector_is_dp12_capable(struct drm_connector *conne=
ctor);
>  extern int radeon_get_monitor_bpc(struct drm_connector *connector);
>
> -extern struct edid *radeon_connector_edid(struct drm_connector *connecto=
r);
> -
>  extern void radeon_connector_hotplug(struct drm_connector *connector);
>  extern int radeon_dp_mode_valid_helper(struct drm_connector *connector,
>                                        struct drm_display_mode *mode);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
