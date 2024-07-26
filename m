Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B7893D50E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 16:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE74110E9BE;
	Fri, 26 Jul 2024 14:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VaSAosNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CB810E9BC;
 Fri, 26 Jul 2024 14:24:56 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2cb5deb027dso771662a91.1; 
 Fri, 26 Jul 2024 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722003896; x=1722608696; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XXgLD0m26HUeKNwihPrfsvZTOawIH1uUPigObJkbBi0=;
 b=VaSAosNPaSk8t83ItOn9qnwD1baKLjX/x4nyoROrwfbbaARy4FNLL8z5prGaKtqrDj
 38Qg6hueJsB6GjaaGSYroobrQYTEYyenEPfve0/cCp3iMAo/6fX/YaC6jernv6ayXMsA
 wQX0/OfM6RSvZFdo/w9cA6gnsZt2RLlczco3uUz6eqrInQgMaY5a6I61+WhjHeq2634Y
 NFhTVPK74yj0DCK9S+sWiTMOztPV1h81wh1B7ivIH63gkhIpUdUw2aV/MgrRhjOANvQz
 LR8UF+rO5sZXtyKi2oXkyTlBKsUZGOSxikOVChhf4wqZHz0JNY/0LTBXgETeAWOt6mAF
 NzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722003896; x=1722608696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XXgLD0m26HUeKNwihPrfsvZTOawIH1uUPigObJkbBi0=;
 b=UDjiNlvn4dLP0ISGtiWuKx35sr6pL/obNYtfY95kcvrVGs7adHD9c4bYvPObjSqFqP
 09d6w0KxY94w/yB23/O08qSbyTt2fWuSTfgug++tGJ3fqaKiFVYOiumNA1z4IStFHraG
 bSGU8GiJeKRGACgbScr4mFwpENV4My99pW8I43llC24RCo6whfGl7aFp8C6mj/WKW+Cd
 P4RssyT3C8wOXByoIc2pTIS2/JfmiqUUiqIjFSoRZsp3DGj4PD5e/VgTnjytdMMC13po
 M58EKrn7tWFQcdM8DWHffbyP1JOhOsjwg4ipw6MUQfIX4cwEGzOIxUKLYN1xnCDYeB0Y
 wCuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3W0k9t9VPl43JhyPF0moaj6zXneB/rbVM5g7S8tSN6KzpHUCU190eCm/iEMP+BQC3fJuJabDUHehhGVhThx7XQoENt0uK9xMh4Yb9i6eAqtfrX/rax+rZd99WESgTDpUAo1LgFs0J4ND2Kf2WxA==
X-Gm-Message-State: AOJu0Yym7A7YHLJ1ukvEksp3Wvebo24LcYHgmoDP2e0ady08wL4v2fqe
 3OK++wzWBeB05Uy3mZgrF1K972Lf4hOqpkmXNv+KZ37PzA6EPKm8StySFVxsPgAobZYboGAz4YP
 M0ZIB+rDoMsZQ2J1ZwPYks6CV7lQ=
X-Google-Smtp-Source: AGHT+IFctf80aK3DGwTPMnlRmHGKh/s2j0PYO8TK/gc1CZicgQ4YnsnrfZIjmDDtFAEFkNZUB+suhX2Y6Dy2/0Rhxb0=
X-Received: by 2002:a17:90b:3007:b0:2c4:aa78:b48b with SMTP id
 98e67ed59e1d1-2cf2ec064bbmr6039798a91.38.1722003896184; Fri, 26 Jul 2024
 07:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240726-amdgpu-edid-bios-v2-0-8a0326654253@weissschuh.net>
 <20240726-amdgpu-edid-bios-v2-2-8a0326654253@weissschuh.net>
In-Reply-To: <20240726-amdgpu-edid-bios-v2-2-8a0326654253@weissschuh.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Jul 2024 10:24:44 -0400
Message-ID: <CADnq5_NwCJV0exdGJ+nCFKdSZ-D85LsLQqCucF54jxtSa=yvSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/radeon: convert bios_hardcoded_edid to drm_edid
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Xinhui Pan <Xinhui.Pan@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Jul 26, 2024 at 9:40=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> Instead of manually passing around 'struct edid *' and its size,
> use 'struct drm_edid', which encapsulates a validated combination of
> both.
>
> As the drm_edid_ can handle NULL gracefully, the explicit checks can be
> dropped.
>
> Also save a few characters by transforming '&array[0]' to the equivalent
> 'array' and using 'max_t(int, ...)' instead of manual casts.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/gpu/drm/radeon/radeon_atombios.c   | 17 ++++++-----------
>  drivers/gpu/drm/radeon/radeon_combios.c    | 26 +++++-------------------=
--
>  drivers/gpu/drm/radeon/radeon_connectors.c |  4 ++--
>  drivers/gpu/drm/radeon/radeon_display.c    |  2 +-
>  drivers/gpu/drm/radeon/radeon_mode.h       |  4 ++--
>  5 files changed, 16 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/r=
adeon/radeon_atombios.c
> index 168f3f94003b..81a0a91921b9 100644
> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> @@ -1716,23 +1716,18 @@ struct radeon_encoder_atom_dig *radeon_atombios_g=
et_lvds_info(struct
>                                 case LCD_FAKE_EDID_PATCH_RECORD_TYPE:
>                                         fake_edid_record =3D (ATOM_FAKE_E=
DID_PATCH_RECORD *)record;
>                                         if (fake_edid_record->ucFakeEDIDL=
ength) {
> -                                               struct edid *edid;
> +                                               const struct drm_edid *ed=
id;
>                                                 int edid_size;
>
>                                                 if (fake_edid_record->ucF=
akeEDIDLength =3D=3D 128)
>                                                         edid_size =3D fak=
e_edid_record->ucFakeEDIDLength;
>                                                 else
>                                                         edid_size =3D fak=
e_edid_record->ucFakeEDIDLength * 128;
> -                                               edid =3D kmemdup(&fake_ed=
id_record->ucFakeEDIDString[0],
> -                                                              edid_size,=
 GFP_KERNEL);
> -                                               if (edid) {
> -                                                       if (drm_edid_is_v=
alid(edid)) {
> -                                                               rdev->mod=
e_info.bios_hardcoded_edid =3D edid;
> -                                                               rdev->mod=
e_info.bios_hardcoded_edid_size =3D edid_size;
> -                                                       } else {
> -                                                               kfree(edi=
d);
> -                                                       }
> -                                               }
> +                                               edid =3D drm_edid_alloc(f=
ake_edid_record->ucFakeEDIDString, edid_size);
> +                                               if (drm_edid_valid(edid))
> +                                                       rdev->mode_info.b=
ios_hardcoded_edid =3D edid;
> +                                               else
> +                                                       drm_edid_free(edi=
d);
>                                                 record +=3D struct_size(f=
ake_edid_record,
>                                                                       ucF=
akeEDIDString,
>                                                                       edi=
d_size);
> diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/ra=
deon/radeon_combios.c
> index 41ddc576f8f8..df8d7f56b028 100644
> --- a/drivers/gpu/drm/radeon/radeon_combios.c
> +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> @@ -370,7 +370,7 @@ static uint16_t combios_get_table_offset(struct drm_d=
evice *dev,
>  bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
>  {
>         int edid_info, size;
> -       struct edid *edid;
> +       const struct drm_edid *edid;
>         unsigned char *raw;
>         edid_info =3D combios_get_table_offset(rdev_to_drm(rdev), COMBIOS=
_HARDCODED_EDID_TABLE);
>         if (!edid_info)
> @@ -378,19 +378,14 @@ bool radeon_combios_check_hardcoded_edid(struct rad=
eon_device *rdev)
>
>         raw =3D rdev->bios + edid_info;
>         size =3D EDID_LENGTH * (raw[0x7e] + 1);
> -       edid =3D kmalloc(size, GFP_KERNEL);
> -       if (edid =3D=3D NULL)
> -               return false;
> -
> -       memcpy((unsigned char *)edid, raw, size);
> +       edid =3D drm_edid_alloc(raw, size);
>
> -       if (!drm_edid_is_valid(edid)) {
> -               kfree(edid);
> +       if (!drm_edid_valid(edid)) {
> +               drm_edid_free(edid);
>                 return false;
>         }
>
>         rdev->mode_info.bios_hardcoded_edid =3D edid;
> -       rdev->mode_info.bios_hardcoded_edid_size =3D size;
>         return true;
>  }
>
> @@ -398,18 +393,7 @@ bool radeon_combios_check_hardcoded_edid(struct rade=
on_device *rdev)
>  struct edid *
>  radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
>  {
> -       struct edid *edid;
> -
> -       if (rdev->mode_info.bios_hardcoded_edid) {
> -               edid =3D kmalloc(rdev->mode_info.bios_hardcoded_edid_size=
, GFP_KERNEL);
> -               if (edid) {
> -                       memcpy((unsigned char *)edid,
> -                              (unsigned char *)rdev->mode_info.bios_hard=
coded_edid,
> -                              rdev->mode_info.bios_hardcoded_edid_size);
> -                       return edid;
> -               }
> -       }
> -       return NULL;
> +       return drm_edid_duplicate(drm_edid_raw(rdev->mode_info.bios_hardc=
oded_edid));
>  }
>
>  static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_dev=
ice *rdev,
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm=
/radeon/radeon_connectors.c
> index 880edabfc9e3..528a8f3677c2 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -1059,7 +1059,7 @@ radeon_vga_detect(struct drm_connector *connector, =
bool force)
>          */
>         if ((!rdev->is_atom_bios) &&
>             (ret =3D=3D connector_status_disconnected) &&
> -           rdev->mode_info.bios_hardcoded_edid_size) {
> +           rdev->mode_info.bios_hardcoded_edid) {
>                 ret =3D connector_status_connected;
>         }
>
> @@ -1392,7 +1392,7 @@ radeon_dvi_detect(struct drm_connector *connector, =
bool force)
>  out:
>         if ((!rdev->is_atom_bios) &&
>             (ret =3D=3D connector_status_disconnected) &&
> -           rdev->mode_info.bios_hardcoded_edid_size) {
> +           rdev->mode_info.bios_hardcoded_edid) {
>                 radeon_connector->use_digital =3D true;
>                 ret =3D connector_status_connected;
>         }
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/ra=
deon/radeon_display.c
> index 10fd58f400bc..8f5f8abcb1b4 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1658,7 +1658,7 @@ void radeon_modeset_fini(struct radeon_device *rdev=
)
>                 rdev->mode_info.mode_config_initialized =3D false;
>         }
>
> -       kfree(rdev->mode_info.bios_hardcoded_edid);
> +       drm_edid_free(rdev->mode_info.bios_hardcoded_edid);
>
>         /* free i2c buses */
>         radeon_i2c_fini(rdev);
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeo=
n/radeon_mode.h
> index e0a5af180801..421c83fc70dc 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -39,6 +39,7 @@
>  #include <linux/i2c-algo-bit.h>
>
>  struct edid;
> +struct drm_edid;
>  struct radeon_bo;
>  struct radeon_device;
>
> @@ -262,8 +263,7 @@ struct radeon_mode_info {
>         /* Output CSC */
>         struct drm_property *output_csc_property;
>         /* hardcoded DFP edid from BIOS */
> -       struct edid *bios_hardcoded_edid;
> -       int bios_hardcoded_edid_size;
> +       const struct drm_edid *bios_hardcoded_edid;
>
>         /* firmware flags */
>         u16 firmware_flags;
>
> --
> 2.45.2
>
